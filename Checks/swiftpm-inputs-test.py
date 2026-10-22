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
print('SWIFTPM INPUTS GREEN: flat, Modules, relocated and host-plugin outputs; missing and ambiguous inputs refuse')
