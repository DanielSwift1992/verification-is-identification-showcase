#!/usr/bin/env python3
"""Changing an input requires a new native profile, not an old certificate."""
import copy
import json
import re
from pathlib import Path
import shutil
import sys
import tempfile
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'Tools'))
import drawing_profile as reader


def main():
    declared=json.loads(reader.DEFAULT.read_text());binary=reader.drawing.build()
    output=reader.ROOT/'Profiles/Playground/Controls'
    def keep(name,request,root,css,receipt):
        target=output/name
        files={'drawing.css':css,'receipt.json':receipt}
        for row in ['TheProfileSource','TheBindings','ThePalette','PaintInput']:
            if row in request['inputs']:files[Path(request['inputs'][row]).name]=(root/request['inputs'][row]).read_bytes()
        for path,data in files.items():
            if '--write' in sys.argv:
                target.mkdir(parents=True,exist_ok=True);(target/path).write_bytes(data)
            else:
                assert (target/path).read_bytes()==data,str(target/path)+': native profile control changed'
    with tempfile.TemporaryDirectory(prefix='profile-inputs-') as temp:
        root=Path(temp);request=copy.deepcopy(declared)
        for row,path in declared['inputs'].items():
            name=Path(path).name;shutil.copy2(reader.ROOT/path,root/name);request['inputs'][row]=name
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
        palette.write_text(palette.read_text().replace('SurfaceCardColour','HarborPaper'))
        bindings.write_text(bindings.read_text().replace('SurfaceCardColour','HarborPaper').replace('BindSurfaceCard','MooringPaper').replace('ThePalette::','PaintInput::'))
        source.write_text(source.read_text().replace('BindSurfaceCard','MooringPaper').replace('Palette = ThePalette','Palette = PaintInput').replace('"Inter"','"Harbor Face"'))
        renamed=copy.deepcopy(request);renamed['inputs']['PaintInput']=renamed['inputs'].pop('ThePalette')
        after,receipt=reader.resolve(renamed,root,binary)
        assert after==before and json.loads(receipt)['inputs']!=json.loads(old)['inputs']
        keep('renamed',renamed,root,after,receipt)
        reset()
        for channel in ['Red','Green','Blue']:
            palette.write_text(re.sub(r'^public typealias SurfaceTrackLit'+channel+r' = .+$', 'public typealias SurfaceTrackLit'+channel+' = U1', palette.read_text(), flags=re.M))
        after,receipt=reader.resolve(request,root,binary)
        assert after!=before and json.loads(receipt)['css']['sha256']!=json.loads(old)['css']['sha256']
        keep('other-palette',request,root,after,receipt)
    print('PROFILE INPUTS GREEN: four delivery controls, false native count, A3 rename and A4 new palette')


if __name__=='__main__':main()
