#!/usr/bin/env python3
"""The compiler owns its artifact layout, not the platform name in a probe."""
from pathlib import Path
import json
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'Tools'))
import drawing

with tempfile.TemporaryDirectory(prefix='swiftpm-inputs-') as temp:
    for layout in ['', 'Modules', 'emitted/modules']:
        root = Path(temp) / ('flat' if not layout else layout.replace('/', '-'))
        modules = root / layout
        modules.mkdir(parents=True)
        expected = []
        for name in ['VerificationIsIdentification', 'Alphabet', 'DocumentKit']:
            (modules / (name + '.swiftmodule')).write_bytes(b'module')
            objects = root / 'objects' / (name + '.build')
            objects.mkdir(parents=True)
            (objects / (name + '.swift.o')).write_bytes(b'object')
            expected.append(str(objects / (name + '.swift.o')))
        flags, objects = drawing.link_inputs(root, ['VerificationIsIdentification', 'Alphabet', 'DocumentKit'])
        assert flags == ['-I', str(modules)] and objects == expected
        def refused(module, phrase):
            try:
                drawing.link_inputs(root, [module])
            except ValueError as error:
                assert phrase in str(error) and str(root) in str(error)
            else:
                raise AssertionError('incomplete or ambiguous build accepted')
        (modules / 'DocumentKit.swiftmodule').unlink()
        refused('DocumentKit', 'found 0/1')
        (modules / 'DocumentKit.swiftmodule').write_bytes(b'module')
        (root / 'objects/DocumentKit.build/DocumentKit.swift.o').unlink()
        refused('DocumentKit', 'no SwiftPM object files')
        duplicate = root / 'duplicate'
        duplicate.mkdir()
        (duplicate / 'Alphabet.swiftmodule').write_bytes(b'other module')
        refused('Alphabet', 'found 2/1')
        # Host-plugin artifacts can coexist with the drawing libraries. Follow
        # the emitted object's compile command rather than a directory name.
        (root / 'description.json').write_text(json.dumps({'swiftCommands': {
            'drawing-library': {'moduleName': 'Alphabet', 'moduleOutputPath': str(modules/'Alphabet.swiftmodule'),
                                'objects': [expected[1]]},
            'host-plugin': {'moduleName': 'Alphabet', 'moduleOutputPath': str(duplicate/'Alphabet.swiftmodule'),
                            'objects': [str(root/'host/Alphabet.swift.o')]}}}))
        flags,objects=drawing.link_inputs(root,['Alphabet'])
        assert flags==['-I',str(modules)] and objects==[expected[1]]
    # The service's Products directory has modules but no <module>.build.
    # Only the emitted JSON plan supplies the intermediate paths. Neither
    # their location nor their names are a convention of this reader.
    root=Path(temp)/'service';binary=root/'out/Products/Debug-linux-x86_64';binary.mkdir(parents=True)
    intermediate=root/'arbitrary-private-location';intermediate.mkdir()
    module=intermediate/'Alphabet.swiftmodule';module.write_bytes(b'module')
    obj=intermediate/'unrelated-object-name.o';obj.write_bytes(b'object')
    inputs=['/presented/Alphabet.swift','/compiler/generated/file-map.json']
    requirement={'tool':'swift-driver-compilation-requirement','inputs':inputs,'outputs':[str(module)]}
    compilation={'tool':'swift-driver-compilation','inputs':inputs,'outputs':[str(obj)]}
    commands={'module':requirement,'objects':compilation,'delivery':{'tool':'file-copy','outputs':[str(binary/'Alphabet.swiftmodule/target.swiftmodule')]}}
    manifest=root/'opaque-plan-location/manifest.json';manifest.parent.mkdir();manifest.write_text(json.dumps({'commands':commands}))
    def read():return drawing.link_inputs(binary,['Alphabet'],root)
    assert read()==(['-I',str(intermediate.resolve())],[str(obj.resolve())])
    # Identical prior plans are the same pair; different active pairs refuse.
    old=root/'another-plan/manifest.json';old.parent.mkdir();old.write_bytes(manifest.read_bytes())
    assert read()==(['-I',str(intermediate.resolve())],[str(obj.resolve())])
    old.unlink()
    def fails(phrase):
        try:read()
        except ValueError as error:assert phrase in str(error),str(error)
        else:raise AssertionError('missing, unpaired or ambiguous outputs accepted')
    obj.unlink();fails('missing SwiftPM output');obj.write_bytes(b'object')
    module.unlink();fails('missing SwiftPM output');module.write_bytes(b'module')
    commands['module']['inputs']=['/different/compilation'];manifest.write_text(json.dumps({'commands':commands}));fails('found 0')
    commands['module']['inputs']=inputs
    other=intermediate/'other.o';other.write_bytes(b'object')
    commands['competing']={'tool':'swift-driver-compilation','inputs':inputs,'outputs':[str(other)]}
    manifest.write_text(json.dumps({'commands':commands}));fails('found 2')
print('SWIFTPM INPUTS GREEN: native flat/Modules/host-plugin and build-service plans; missing, unpaired and ambiguous outputs refuse')
