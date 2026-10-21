#!/usr/bin/env python3
"""Metadata selects Swift readings; DocumentKit computes their values."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import struct
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parent))
import drawing

ROOT = Path(__file__).resolve().parent.parent
DEFAULT = ROOT / 'Profiles/Playground/request.json'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def records(text):
    result = {}
    for m in re.finditer(r'public enum (\w+): (\w+)\s*\{(.*?)\n\}', text, re.S):
        fields = re.findall(r'public typealias (\w+)\s*=\s*([^\n]+)', m[3])
        if len(dict(fields)) != len(fields):
            raise ValueError(m[1] + ': duplicate metadata field')
        result[m[1]] = dict(kind=m[2], axes=dict(fields), line=text[:m.start()].count('\n') + 1)
    words = dict(re.findall(r'extension (\w+)\s*\{\s*public static var typeName: String\s*\{\s*("[^"\n]*")\s*\}', text))
    return result, {k: json.loads(v) for k, v in words.items()}


def refs(value):
    if not re.fullmatch(r'\([\w, ]*\)', value):
        raise ValueError('references must be a finite tuple')
    return [v.strip() for v in value[1:-1].split(',') if v.strip()]


def font_weight(data):
    # This is delivery metadata, not a substitute for the owner's metric table.
    u16 = lambda n: struct.unpack_from('>H', data, n)[0]
    tables = {data[n:n+4]: struct.unpack_from('>I', data, n+8)[0]
              for n in range(12, 12 + 16*u16(4), 16)}
    weight = str(u16(tables[b'OS/2'] + 4))
    if b'fvar' in tables:
        at = tables[b'fvar']
        for i in range(u16(at+8)):
            n = at + u16(at+4) + i*u16(at+10)
            if data[n:n+4] == b'wght':
                weight = ' '.join(str(struct.unpack_from('>i', data, p)[0] // 65536) for p in [n+4, n+12])
    return weight


def resolve(request, base, binary=None):
    inputs = request['inputs']
    content = {name: (base / path).read_bytes() for name, path in inputs.items()}
    profile = request['profile']
    source = content[profile['row']].decode()
    declarations, words = records(source)
    candidates = [(n, d) for n, d in declarations.items() if d['kind'] == 'DrawingProfile']
    if len(candidates) != 1:
        raise ValueError('one DrawingProfile is required')
    _, definition = candidates[0]
    axes = definition['axes']
    if set(axes) != {'Reader', 'Contract', 'Palette', 'Bindings', 'Font', 'Metrics', 'License', 'Legible'}:
        raise ValueError('unknown or missing DrawingProfile field')
    if words[axes['Reader']] != 'gate/documentkit-drawing':
        raise ValueError('unsupported drawing reader')
    palette_row = axes['Palette']
    font = declarations[axes['Font']]['axes']
    metrics = declarations[axes['Metrics']]['axes']
    if declarations[axes['Font']]['kind'] != 'DrawingFont' or set(font) != {'Asset','Family','Face'}:
        raise ValueError('invalid DrawingFont fields')
    if declarations[axes['Metrics']]['kind'] != 'DrawingMetrics' or set(metrics) != {'Input','Profile','Font','SourceFontSHA256','UnitsPerEm','CapHeight','Advances','MissingGlyph'} or metrics['Font'] != axes['Font']:
        raise ValueError('font and metrics do not name the same declared face')
    asset_row, metrics_row, license_row = font['Asset'], metrics['Input'], axes['License']
    parsed = {name: records(data.decode()) for name, data in content.items() if name not in [asset_row]}
    selected = {profile['row'], palette_row, asset_row, metrics_row, license_row}
    def reference(ref):
        row, name = words[ref].split('::')
        selected.add(row)
        d, w = parsed[row]
        return row, name, d[name], w
    bindings = []
    for ref in refs(axes['Bindings']):
        row, name, d, w = reference(ref)
        if d['kind'] != 'DrawingBinding' or set(d['axes']) != {'Role', 'Theme', 'Colour', 'Luminance'}:
            raise ValueError(name + ': invalid DrawingBinding')
        a = d['axes']; y = parsed[row][0][a['Luminance']]
        if y['kind'] != 'DrawingLuminance' or set(y['axes']) != {'Value', 'Colour', 'Projection'} or y['axes']['Colour'] != a['Colour']:
            raise ValueError(name + ': invalid declared luminance')
        bindings.append(dict(name=name, id=row+'::'+name, role=w[a['Role']], theme=w[a['Theme']], term=a['Colour'],
                             value=y['axes']['Value'], projection=y['axes']['Projection'], row=row,
                             address=inputs[row]+':'+str(d['line'])))
    keys = [(b['theme'], b['role']) for b in bindings]
    if any(not re.fullmatch(r'[a-z][a-z0-9-]*', b['role']) or b['theme'] not in ['light','dark'] for b in bindings):
        raise ValueError('invalid drawing role or theme')
    if len(set(keys)) != len(keys) or set(keys) != {(t, r) for t in ['light', 'dark'] for r in request['roles']}:
        raise ValueError('each declared role requires exactly one binding in both themes')
    witnesses = []
    by_name = {b['id']: b for b in bindings}
    aliases = dict(re.findall(r'^public typealias (\w+) = ([^\n]+)', content[palette_row].decode(), re.M))
    for ref in refs(axes['Legible']):
        row, name, d, w = reference(ref); a = d['axes']
        if d['kind'] != 'DrawingLegible' or set(a) != {'Theme', 'Foreground', 'Background', 'Witness'}:
            raise ValueError(name + ': invalid DrawingLegible')
        witness_row, witness = w[a['Witness']].split('::')
        if witness_row != palette_row:
            raise ValueError(name + ': witness must name the selected palette')
        ends = re.fullmatch(r'Legible<\s*([^,]+?)\s*,\s*([^,]+?)\s*,\s*(.+)>', aliases[witness])
        fg, bg = by_name[row+'::'+a['Foreground']], by_name[row+'::'+a['Background']]
        if not ends or {fg['value'], bg['value']} != {ends[1], ends[2]} or fg['theme'] != bg['theme'] or fg['theme'] != w[a['Theme']]:
            raise ValueError(name + ': witness endpoints differ from the declared bindings')
        witnesses.append(dict(id=witness, foreground=fg['name'], background=bg['name'], theme=w[a['Theme']],
                              address=inputs[palette_row]+':'+str(content[palette_row].decode().splitlines().index('public typealias '+witness+' = '+aliases[witness])+1)))
    expected = {n for n, a in aliases.items() if a.startswith('Legible<')}
    if {w['id'] for w in witnesses} != expected or len(witnesses) != len(expected):
        raise ValueError('Legible coverage differs from the selected palette')
    contract_name = axes['Contract']; contract = None
    if words.get(contract_name) != '':
        selected.add(contract_name)
        contract = json.loads(content[contract_name])
        if not isinstance(contract,dict):
            raise ValueError('the Drawing contract input must be a record')
    if set(inputs) != selected:
        raise ValueError('request must name exactly the profile inputs: '+repr(sorted(selected)))
    font_hash = sha(content[asset_row]); family=words[font['Family']]
    if words[metrics['SourceFontSHA256']] != font_hash:
        raise ValueError('font bytes differ from SourceFontSHA256')
    if not content[license_row].strip():
        raise ValueError('font license is missing')
    # No interpretation of Swift arithmetic or colour expressions: the actual
    # source is compiled against DocumentKit and read by the native process.
    rows = []
    for index,b in enumerate(bindings):
        n = b['name']; rows.append('[' + ','.join(json.dumps(k)+': '+v for k,v in {
            'css': n+'.Colour.typeName', 'projection': n+'.Luminance.Projection.typeName',
            'value': n+'.Luminance.Value.count','scale':'scale'+str(index)}.items()) + '] as [String: Any]')
    checks = ['precondition('+w['id']+'.R1.Left.count == '+w['id']+'.R1.Right.count, "Legible '+w['id']+'")' for w in witnesses]
    program = '''import Foundation
import VerificationIsIdentification
import DocumentKit
func luminance<X: Structure,Y: Structure,Z: Structure,S: Structure,V: Structure,T: Structure>(
    _ colour: XYZRatioWrite<X,Y,Z,S>.Type, _ projection: XYZRatioWrite<Never,V,Never,T>.Type, _ value: V.Type, _ address: String
) -> Int {
    precondition(Y.count == V.count && S.count == T.count, address + ": luminance or coordinate scale differs from its colour")
    return S.count
}
'''
    program += '\n'.join('let scale'+str(i)+' = luminance('+b['name']+'.Colour.self, '+b['name']+'.Luminance.Projection.self, '+b['name']+'.Luminance.Value.self, '+json.dumps(b['address'])+')' for i,b in enumerate(bindings))+'\n'
    program += '\n'.join(checks)+'\n'
    program += 'let result: [[String: Any]] = ['+','.join(rows)+']\n'
    program += 'FileHandle.standardOutput.write(try JSONSerialization.data(withJSONObject: result, options: [.sortedKeys]))\n'
    binary = binary or drawing.build()
    with tempfile.TemporaryDirectory(prefix='drawing-profile-') as temp:
        tmp = Path(temp); main = tmp/'main.swift';main.write_text(program); executable=tmp/'read'
        objects = [str(p) for module in ['VerificationIsIdentification','Alphabet','DocumentKit'] for p in sorted((binary/(module+'.build')).glob('*.o'))]
        sources = [str(base/inputs[row]) for row in sorted({palette_row, metrics_row} | {b['row'] for b in bindings})]
        compiled = drawing.run(['swiftc','-I',str(binary/'Modules'),'-module-cache-path',str(tmp/'modules'),*sources,str(main),*objects,'-o',str(executable)],120)
        if compiled.returncode:
            raise ValueError(compiled.stderr.decode(errors='replace'))
        output = drawing.run([str(executable)],20)
        if output.returncode:
            raise ValueError(output.stderr.decode(errors='replace'))
        values = json.loads(output.stdout)
    for b, value in zip(bindings, values):
        if value['projection'].split(' ')[2] != value['css'].split(' ')[2]:
            raise ValueError(b['name']+': projection and printed luminance differ')
        b['css'] = value['css'];b['luminance'] = value['value'];b['scale'] = value['scale'];b.pop('projection');b.pop('row')
    by_name = {b['name']: b for b in bindings}
    if any(by_name[w['foreground']]['scale'] != by_name[w['background']]['scale'] for w in witnesses):
        raise ValueError('Legible endpoints use different coordinate scales')
    mw = parsed[metrics_row][1]
    font_result = dict(sha256=font_hash,family=family,cssFamily='gate-drawing-'+font_hash,face=words[font['Face']],
                       units=int(mw[metrics['UnitsPerEm']]),cap=int(mw[metrics['CapHeight']]),
                       advances_sha256=sha(mw[metrics['Advances']].encode()),metrics_sha256=sha(content[metrics_row]),
                       profile=words[metrics['Profile']],missingGlyph=words[metrics['MissingGlyph']])
    css = '\n'.join((':root' if theme=='light' else ':root[data-theme="dark"]')+'{'+''.join('--vi-'+b['role']+':'+b['css']+';' for b in bindings if b['theme']==theme)+'}' for theme in ['light','dark'])+'\n'
    css += '@font-face{font-family:'+json.dumps(font_result['cssFamily'])+';src:url("../'+font_hash+'/font.ttf") format("truetype");font-weight:'+font_weight(content[asset_row])+';font-style:normal;font-display:block;}\n'
    css += 'svg[data-vi-canvas]{font-family:'+json.dumps(font_result['cssFamily'])+';font-optical-sizing:none;font-kerning:none;font-variant-ligatures:none;}\n'
    bound = {name:dict(sha256=sha(data),path=inputs[name]) for name,data in content.items()}
    reader_files = {'Tools/drawing_profile.py':sha(Path(__file__).read_bytes())}
    reader_files.update(drawing.owner_environment()['files'])
    receipt = dict(format='drawing-profile/1', reader=dict(id='showcase/DocumentKitProfileReader',version=1,files=reader_files),
                   profile_row=profile['row'],inputs=bound,palette_row=palette_row,css=dict(row=request['css_row'],sha256=sha(css.encode())),
                   contract_row=contract_name if contract is not None else None,
                   result=dict(status='ready' if contract is not None else 'not-compared',reason='Owner-resolved profile' if contract is not None else 'The owner Drawing contract is not declared',
                     inputSHA256=sha(json.dumps({n:r['sha256'] for n,r in sorted(bound.items())},separators=(',',':')).encode()),
                     bindings=bindings,witnesses=witnesses,font=font_result,contract=contract,
                     assets=[dict(sha256=font_hash,name='font.ttf'),dict(sha256=sha(content[license_row]),name='license.txt')]))
    return css.encode(), (json.dumps(receipt,ensure_ascii=False,indent=2)+'\n').encode()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('request',nargs='?',type=Path,default=DEFAULT)
    parser.add_argument('--check',action='store_true')
    parser.add_argument('-o','--output',type=Path)
    args=parser.parse_args();request=json.loads(args.request.read_text())
    base=ROOT if args.request.resolve()==DEFAULT.resolve() else args.request.resolve().parent
    output=args.output or args.request.parent
    css,receipt=resolve(request,base)
    for name,data in [('drawing.css',css),('receipt.json',receipt)]:
        path=output/name
        if args.check:
            if not path.is_file() or path.read_bytes()!=data:
                raise ValueError(str(path)+': owner reading differs from the recorded bytes')
        else:
            path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
    print('PROFILE GREEN: native DocumentKit; both themes; bound inputs')


if __name__=='__main__':
    main()
