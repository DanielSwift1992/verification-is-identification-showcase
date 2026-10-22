#!/usr/bin/env python3
"""Changing an input requires a new native profile, not an old certificate."""
import argparse
import copy
import hashlib
import json
import re
from pathlib import Path
import sys
import tempfile
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'Tools'))
import drawing_profile as reader


VARIANTS=reader.ROOT/'Profiles/Playground/Controls/variants.json'


def sha(data):return hashlib.sha256(data).hexdigest()


def transform(declared,inputs,spec):
    """Text changes only; DocumentKit still owns every colour and count."""
    request=copy.deepcopy(declared);result=dict(inputs)
    for row,replacements in spec.get('replacements',{}).items():
        text=result[row].decode()
        for old,new in replacements.items():
            assert old in text,(row,old,'rename has no source')
            text=text.replace(old,new)
        result[row]=text.encode()
    for row,values in spec.get('values',{}).items():
        text=result[row].decode()
        for name,value in values.items():
            text,count=re.subn(r'^(public typealias '+re.escape(name)+r' = ).+$',lambda m:m[1]+value,text,flags=re.M)
            assert count==1,(row,name,'value needs one declaration')
        result[row]=text.encode()
    request['inputs']={row:Path(path).name for row,path in request['inputs'].items()}
    for old,new in spec.get('input_rows',{}).items():
        assert new not in request['inputs'],(new,'row already exists')
        request['inputs'][new]=request['inputs'].pop(old);result[new]=result.pop(old)
    return request,result


def reading(declared,inputs,spec,binary):
    request,values=transform(declared,inputs,spec)
    with tempfile.TemporaryDirectory(prefix='profile-variant-') as temp:
        root=Path(temp)
        for row,path in request['inputs'].items():(root/path).write_bytes(values[row])
        css,receipt=reader.resolve(request,root,binary)
    return request,values,css,receipt


def check_digest(name,spec,receipt):
    assert sha(receipt)==spec['receipt_sha256'],name+': native profile receipt changed'


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--export',type=Path,help='write temporary owner readings for an external consumer test')
    args=parser.parse_args()
    declared=json.loads(reader.DEFAULT.read_text());binary=reader.drawing.build()
    inputs={row:(reader.ROOT/path).read_bytes() for row,path in declared['inputs'].items()}
    control=json.loads(VARIANTS.read_text());assert control['format']==1
    variants=control['variants']
    results={}
    for name,spec in variants.items():
        request,values,css,receipt=reading(declared,inputs,spec,binary)
        check_digest(name,spec,receipt);results[name]=(request,values,css,receipt)
        if args.export:
            target=args.export/name;target.mkdir(parents=True,exist_ok=True)
            for row,path in request['inputs'].items():(target/path).write_bytes(values[row])
            (target/'drawing.css').write_bytes(css);(target/'receipt.json').write_bytes(receipt)
    if args.export:
        print('PROFILE VARIANTS GREEN: current owner inputs, declared transformations, native receipt digests')
        return
    with tempfile.TemporaryDirectory(prefix='profile-inputs-') as temp:
        root=Path(temp);request=copy.deepcopy(declared)
        for row,path in declared['inputs'].items():
            name=Path(path).name;(root/name).write_bytes(inputs[row]);request['inputs'][row]=name
        def path(row):return root/request['inputs'][row]
        originals={n:p.read_bytes() for n in request['inputs'] for p in [path(n)]}
        def reset():
            for n,data in originals.items():path(n).write_bytes(data)
        def refused(label,mutate,phrase):
            reset();mutate()
            try:reader.resolve(request,root,binary)
            except ValueError as e:assert phrase in str(e),(label,str(e))
            else:raise AssertionError(label+': accepted')
        source=path(request['profile']['row']);bindings=path('TheBindings');palette=path('ThePalette')
        refused('missing dark binding',lambda:source.write_text(source.read_text().replace('BindingReference1, ','')), 'both themes')
        refused('foreign Legible endpoint',lambda:bindings.write_text(bindings.read_text().replace('Foreground = BindTextLight','Foreground = BindLawLight',1)), 'endpoints')
        refused('false source font',lambda:source.write_text(source.read_text().replace('4989b125924991b90d05b2d16e0e388c48f7d5bb8b30539bbf9c755278d0ccaf','0'*64)), 'SourceFontSHA256')
        refused('lost license',lambda:path('TheLicense').write_text(''), 'license')
        refused('different coordinate scale',lambda:bindings.write_text(bindings.read_text().replace('Never, CoordinateScale>', 'Never, Twice<CoordinateScale>>',1)), 'luminance')
        refused('false native count',lambda:palette.write_text(re.sub(r'^public typealias TextOnPaperSlack = .+$', 'public typealias TextOnPaperSlack = Never', palette.read_text(), flags=re.M)), 'Legible')
        reset();before,old=reader.resolve(request,root,binary)
        # Exercise the real compiler with SwiftPM modules beside the objects,
        # not under Modules. Only the artifact layout changes, never the input
        # declarations, and neither CSS nor the native receipt may change.
        with tempfile.TemporaryDirectory(prefix='profile-flat-modules-') as directory:
            flat=Path(directory)
            for module in ['VerificationIsIdentification','Alphabet','DocumentKit']:
                emitted=next(binary.rglob(module+'.swiftmodule'))
                objects=next(p for p in binary.rglob(module+'.build') if p.is_dir())
                (flat/(module+'.swiftmodule')).symlink_to(emitted,target_is_directory=emitted.is_dir())
                (flat/(module+'.build')).symlink_to(objects,target_is_directory=True)
            (flat/'ModuleCache').symlink_to(binary/'ModuleCache',target_is_directory=True)
            flat_css,flat_receipt=reader.resolve(request,root,flat)
            assert (flat_css,flat_receipt)==(before,old),'SwiftPM artifact layout changed the native reading'
        _,_,after,receipt=results['renamed']
        assert after==before and json.loads(receipt)['inputs']!=json.loads(old)['inputs']
        _,_,after,receipt=results['other-palette']
        assert after!=before and json.loads(receipt)['css']['sha256']!=json.loads(old)['css']['sha256']
    # Change an owner value outside either variant's delta. Both readings must
    # inherit it, including their certificate, without editing the control table.
    changed=dict(inputs)
    changed['ThePalette'],count=re.subn(rb'^(public typealias SurfaceTrackDimRed = ).+$',rb'\g<1>U1',changed['ThePalette'],flags=re.M)
    assert count==1 and changed['ThePalette']!=inputs['ThePalette']
    for name,spec in variants.items():
        _,values,css,receipt=reading(declared,changed,spec,binary)
        row=spec.get('input_rows',{}).get('ThePalette','ThePalette')
        assert b'public typealias SurfaceTrackDimRed = U1\n' in values[row],name+': owner edit was lost'
        assert values[row]!=results[name][1][row] and css!=results[name][2] and sha(receipt)!=sha(results[name][3]),name+': variant stayed frozen'
        assert json.loads(receipt)['inputs'][row]['sha256']==sha(values[row])
        try:check_digest(name,spec,receipt)
        except AssertionError:pass
        else:raise AssertionError(name+': old expected digest accepted a changed owner input')
    assert not list((VARIANTS.parent).glob('*/*.swift')) and not list(VARIANTS.parent.glob('*/receipt.json')),'full owner controls must not return'
    print('PROFILE INPUTS GREEN: SwiftPM layouts, delivery refusals, native count, A3/A4 deltas and owner-edit propagation in both variants')


if __name__=='__main__':main()
