#!/usr/bin/env python3
"""The actual native Drawing input and the declared world input are one set."""
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('drawing', root / 'Tools/drawing.py')
drawing = importlib.util.module_from_spec(spec)
spec.loader.exec_module(drawing)
ids = {r['id'] for r in json.loads((root / 'Worlds/Playground/drawing.json').read_text())['worlds']}
requests = [r for r in json.loads((root / 'Contracts/Drawing/v0.1/manifest.json').read_text())['cases'] if r['id'] in ids]
drawing.check_document_inputs(requests)
request = next(r for r in requests if r['id'] == 'readme')
original = (root / 'Worlds/Playground/ReadMe/gate.manifest.swift').read_text()
with tempfile.TemporaryDirectory(prefix='drawing-input-controls-') as temp:
    at = Path(temp) / 'Worlds/Playground/ReadMe/gate.manifest.swift'
    at.parent.mkdir(parents=True)
    for name, text in [
        ('wrong Kind', original.replace('Kind = DocumentFile', 'Kind = CarriedFile', 1)),
        ('missing source', original.replace('Dictionary/ReadMe.swift', 'Dictionary/Missing.swift')),
        ('repeated source', original.replace('ReadMePages.swift', 'Dictionary/ReadMe.swift')),
        ('extra source', original + '\npublic enum Extra: Mine { public typealias Kind = DocumentFile }\nextension Extra { public static var typeName: String { "Extra.swift" } }\n'),
    ]:
        at.write_text(text)
        try:
            drawing.check_document_inputs([request], Path(temp))
        except ValueError as error:
            assert 'gate.manifest.swift' in str(error), str(error)
            print('DOCUMENT INPUT REFUSED: ' + name)
        else:
            raise AssertionError(name + ' unexpectedly accepted')
print('DOCUMENT INPUTS GREEN: ten real source sets, four addressed negative controls')
