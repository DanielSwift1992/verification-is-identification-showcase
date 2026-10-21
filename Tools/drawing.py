#!/usr/bin/env python3
"""Compile presented Swift, then read typeName in a disposable child process.

This driver never interprets drawing forms. Runtime traps, compiler failures and
budget exhaustion have different outcomes. Only the first may be a refusal.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import resource
import signal
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / 'Worlds/Playground/drawing.json'
CONTRACT = ROOT / 'Contracts/Drawing/v0.1'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def input_bytes(request, base=ROOT):
    return b'\n'.join((base / name).read_bytes() for name in request['sources'])


def profile_environment():
    inputs = ['Worlds/Playground/Site/Palette.swift', 'Worlds/Playground/Site/DrawingBindings.swift',
              'Assets/InterVariable.ttf', 'Assets/InterLicense.txt', 'Sources/DocumentKit/GeneratedFontMetrics.swift']
    return {'profileSHA256': sha((ROOT / 'Worlds/Playground/Site/DrawingProfile.swift').read_bytes()),
            'inputSHA256': [sha((ROOT / name).read_bytes()) for name in inputs]}


def owner_environment():
    theory = Path(os.environ.get('VI_THEORY_PATH', ROOT / '.build/checkouts/verification-is-identification'))
    files = {'showcase/Package.swift': sha((ROOT / 'Package.swift').read_bytes())}
    for label, base, folders in [('showcase', ROOT, ['Sources/DocumentKit', 'Sources/Organization']),
                                  ('theory', theory, ['Sources/VerificationIsIdentification', 'Sources/Alphabet'])]:
        for folder in folders:
            sources = sorted((base / folder).glob('*.swift')) if label == 'theory' else sorted((base / folder).rglob('*.swift'))
            if not sources:
                raise ValueError('owner source module is missing: ' + str(base / folder))
            for path in sources:
                files[label + '/' + str(path.relative_to(base))] = sha(path.read_bytes())
    return {'theoryRevision': re.search(r'let theoryRevision = "([0-9a-f]+)"', (ROOT / 'Package.swift').read_text())[1],
            'files': files}


def no_core():
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))


def run(command, budget, **kw):
    with subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                          start_new_session=True, preexec_fn=no_core, **kw) as child:
        try:
            stdout, stderr = child.communicate(timeout=budget)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL)
            child.communicate()
            raise
        return subprocess.CompletedProcess(command, child.returncode, stdout, stderr)


def target_requests(requests):
    """SwiftPM owns a target's source selection and its compilation settings."""
    description = run(['swift', 'package', 'describe', '--type', 'json'], 60, cwd=ROOT)
    if description.returncode:
        raise RuntimeError(description.stderr.decode(errors='replace'))
    targets = {t['name']: t for t in json.loads(description.stdout)['targets']}
    manifest = run(['swift', 'package', 'dump-package'], 60, cwd=ROOT)
    if manifest.returncode:
        raise RuntimeError(manifest.stderr.decode(errors='replace'))
    declarations = {t['name']: t for t in json.loads(manifest.stdout)['targets']}

    def dependencies(name, seen=None):
        seen = set() if seen is None else seen
        if name in seen:
            return seen
        target = targets.get(name)
        if target is not None and target.get('type') != 'library':
            return seen
        seen.add(name)
        if target:
            # describe includes build plugins among product_dependencies. The
            # manifest's dependency edges exclude pluginUsages; tools are not linked.
            for edge in declarations[name].get('dependencies', []):
                kind = next(iter(edge))
                if kind not in ['product', 'byName', 'target']:
                    raise ValueError('unsupported SwiftPM dependency edge: ' + kind)
                dependencies(edge[kind][0], seen)
        return seen

    resolved = []
    for original in requests:
        request = dict(original)
        if 'target' in request:
            if request['target'] not in targets:
                raise ValueError('unknown SwiftPM target: ' + request['target'])
            target = targets[request['target']]
            request['sources'] = sorted(str(Path(target['path']) / name) for name in target['sources'])
            request['dependencies'] = sorted(dependencies(request['target']))
            locations = [name for name in request['sources'] if re.search(
                r'\b(?:enum|struct|class|typealias)\s+' + re.escape(request['root']) + r'\b',
                (ROOT / name).read_text())]
            if len(locations) != 1:
                raise ValueError('drawing root needs one declaration: ' + request['root'])
            request['address'] = locations[0] + '#' + request['root']
        resolved.append(request)
    return resolved


def build():
    result = run(['swift', 'build', '--target', 'DocumentKit'], 600, cwd=ROOT)
    if result.returncode:
        raise RuntimeError(result.stderr.decode(errors='replace') + result.stdout.decode(errors='replace'))
    result = run(['swift', 'build', '--show-bin-path'], 60, cwd=ROOT)
    if result.returncode:
        raise RuntimeError(result.stderr.decode(errors='replace'))
    return Path(result.stdout.decode().strip())


def read(request, binary, base=ROOT):
    address = request['address']
    if request.get('status') == 'not-compared':
        result = {'status': 'not-compared', 'address': address, 'reason': request['reason']}
        if request.get('sources'):
            result['inputSHA256'] = sha(input_bytes(request, base))
        return result
    root = request['root']
    if not re.fullmatch(r'[A-Za-z_][A-Za-z_0-9]*', root):
        raise ValueError('root must name a declared Swift type')
    result = {'address': address, 'inputSHA256': sha(input_bytes(request, base))}
    dependencies = request.get('dependencies', ['VerificationIsIdentification', 'Alphabet', 'DocumentKit'])
    with tempfile.TemporaryDirectory(prefix='drawing-') as directory:
        tmp = Path(directory)
        main = tmp / 'main.swift'
        imports = ['VerificationIsIdentification', 'DocumentKit']
        if request.get('target'):
            imports.append(request['target'])
        read_root = request['target'] + '.' + root if request.get('target') else root
        main.write_text(''.join('import ' + module + '\n' for module in imports)
                        + 'print(' + read_root + '.typeName, terminator: "")\n')
        executable = tmp / 'read'
        try:
            # The library target itself is compiled by SwiftPM, including all its
            # declared files and settings. Only an external request compiles raw files.
            modules = [request['target']] if request.get('target') else [
                m for m in dependencies if m not in ['VerificationIsIdentification', 'Alphabet', 'DocumentKit']]
            for module in modules:
                prepared = run(['swift', 'build', '--target', module], request.get('compileSeconds', 120), cwd=ROOT)
                if prepared.returncode:
                    return dict(result, status='failed', reason='compile',
                                diagnostic=(prepared.stderr + prepared.stdout).decode(errors='replace'))
            objects = [str(p) for module in dependencies for p in sorted((binary / (module + '.build')).glob('*.o'))]
            if any(not list((binary / (module + '.build')).glob('*.o')) for module in dependencies):
                return dict(result, status='failed', reason='missing-object-module')
            sources = [] if request.get('target') else [str(base / p) for p in request['sources']]
            compiled = run(['swiftc', '-I', str(binary / 'Modules'),
                            '-module-cache-path', str(tmp / 'modules'),
                            *sources, str(main), *objects,
                            '-o', str(executable)], request.get('compileSeconds', 120))
            if compiled.returncode:
                return dict(result, status='failed', reason='compile', diagnostic=compiled.stderr.decode(errors='replace'))
            readout = run([str(executable)], request.get('readSeconds', 20))
        except subprocess.TimeoutExpired:
            return dict(result, status='failed', reason='budget')
        if readout.returncode:
            diagnostic = readout.stderr.decode(errors='replace')
            # A killed/crashed process alone is not a semantic refusal. These are
            # the owner's named preconditions; other failures remain red errors.
            for message, code in [('Half of an odd magnitude:', 'half-odd'),
                                  ('Rest underflow:', 'rest-underflow'),
                                  ('Wrapped overflow in ', 'text-overflow'),
                                  ('Fitted overflow in ', 'text-overflow')]:
                if message in diagnostic:
                    return dict(result, status='refused', code=code)
            return dict(result, status='failed', reason='runtime', diagnostic=diagnostic)
        try:
            xml = ET.fromstring(readout.stdout)
            if xml.tag != '{http://www.w3.org/2000/svg}svg':
                raise ValueError('root is not SVG')
        except (ET.ParseError, ValueError) as error:
            return dict(result, status='failed', reason='xml', diagnostic=str(error))
        return dict(result, status='svg', svgSHA256=sha(readout.stdout), svg=readout.stdout.decode())


def show_request(request, base):
    if request.get('target'):
        request, base = target_requests([request])[0], ROOT
    result = read(request, build(), base)
    print(json.dumps(result, ensure_ascii=False))
    return 0 if result['status'] == 'svg' else 1


def document_sources(manifest):
    """The manifest selects source identities; no page-name convention does."""
    text = manifest.read_text()
    rows, edges = {}, {}
    for name, body in re.findall(r'public enum (\w+): (?:Mine|Theirs)\s*\{([^{}]*)\}', text):
        names = re.findall(r'extension ' + name + r'\s*\{\s*public static var typeName:\s*String\s*\{\s*("(?:\\.|[^"\\])*")\s*\}', text)
        if len(names) != 1:
            raise ValueError(str(manifest) + ': ' + name + ' needs one path')
        path = json.loads(names[0])
        if path.startswith('/') or '..' in Path(path).parts or name in rows or path in [r[0] for r in rows.values()]:
            raise ValueError(str(manifest) + ': repeated or unsafe input ' + path)
        kind = re.search(r'\btypealias Kind\s*=\s*(\w+)', body)
        rows[name] = (path, kind[1] if kind else None)
        values = re.findall(r'typealias DrawingInputs\s*=\s*([^\n}]+)', body)
        if len(values) > 1:
            raise ValueError(str(manifest) + ': repeated DrawingInputs at ' + name)
        if values:
            raw = values[0].strip()
            if not re.fullmatch(r'\w+|\(\s*\w+(?:\s*,\s*\w+)+\s*\)', raw):
                raise ValueError(str(manifest) + ': DrawingInputs needs a row or tuple at ' + name)
            refs = re.findall(r'\w+', raw)
            if len(refs) != len(set(refs)):
                raise ValueError(str(manifest) + ': DrawingInputs repeats a row at ' + name)
            edges[name] = refs
    def walk(name, stack=()):
        if name not in rows or name in stack:
            raise ValueError(str(manifest) + ': missing or cyclic DrawingInputs row ' + name)
        return {name}.union(*(walk(ref, (*stack, name)) for ref in edges.get(name, [])))
    for name in edges:
        walk(name)
    reached = set().union(*(walk(name) for name, (_, kind) in rows.items() if kind == 'DocumentFile'))
    return sorted(rows[name][0] for name in reached)



def check_document_inputs(requests, root=ROOT):
    for request in requests:
        sources = request['sources']
        worlds = {tuple(Path(p).parts[:3]) for p in sources}
        if len(worlds) != 1 or next(iter(worlds))[:2] != ('Worlds', 'Playground'):
            raise ValueError(request['id'] + ': drawing sources need one declared world')
        world = Path(*next(iter(worlds)))
        manifest = root / world / 'gate.manifest.swift'
        declared = [str(world / p) for p in document_sources(manifest)]
        if sorted(sources) != declared:
            raise ValueError(str(manifest) + ': DocumentFile input differs from native drawing ' + request['id']
                             + ': ' + repr(sorted(set(sources) ^ set(declared))))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('request', nargs='?', help='world id, or a JSON request with paths relative to its directory')
    selection = parser.add_mutually_exclusive_group()
    selection.add_argument('--check', action='store_true', help='execute every declared drawing and contract case')
    selection.add_argument('--freeze', action='store_true', help='author the contract from the native reader (review the resulting diff)')
    args = parser.parse_args()
    # A caller's request does not depend on the showcase catalog or fixtures.
    if not (args.check or args.freeze) and args.request and Path(args.request).is_file():
        path = Path(args.request).resolve()
        return show_request(json.loads(path.read_text()), path.parent)
    registry = json.loads(REGISTRY.read_text())
    controls = json.loads((CONTRACT / 'requests.json').read_text())
    if not (args.check or args.freeze):
        request = next((r for r in registry['worlds'] + controls if r['id'] == args.request), None)
        if request is None:
            parser.error('name a declared world or a JSON request')
        return show_request(request, ROOT)
    registry['worlds'] = target_requests(registry['worlds'])
    check_document_inputs(registry['worlds'])
    cases = registry['worlds'] + controls
    binary = build()
    if args.check or args.freeze:
        owner = owner_environment()
        manifest = {} if args.freeze else json.loads((CONTRACT / 'manifest.json').read_text())
        if not args.freeze and owner != manifest['owner']:
            raise ValueError('native owner sources differ from the frozen Drawing contract')
        expected = {c['id']: c for c in manifest.get('cases', [])}
        records = []
        failed = False
        # The registry cannot silently drop a canvas already declared by these worlds.
        declared = set()
        for path in (ROOT / 'Worlds/Playground').rglob('*.swift'):
            for match in re.finditer(r'public enum (\w+): (?:GrownDiagram|Diagram)\b', path.read_text()):
                declared.add(str(path.relative_to(ROOT)) + '#' + match[1])
        registered = {r['address'] for r in registry['worlds']}
        if declared != registered:
            raise ValueError('drawing registry does not match declared canvases: ' + repr(declared ^ registered))
        if len({r['id'] for r in cases}) != len(cases):
            raise ValueError('duplicate drawing case id')
        if not args.freeze and set(expected) != {r['id'] for r in cases}:
            raise ValueError('contract case set differs from requests')
        for request in cases:
            result = read(request, binary)
            valid = result['status'] == request.get('expect', 'svg')
            record = dict(result, id=request['id'], root=request.get('root'), sources=request.get('sources', []))
            if request.get('target'):
                record['target'] = request['target']
            if 'svg' in record:
                output = 'cases/' + request['id'] + '.svg'
                svg = record.pop('svg').encode()
                if 'text' in request:
                    text_nodes = [node.text or '' for node in ET.fromstring(svg).iter('{http://www.w3.org/2000/svg}text')]
                    valid = valid and request['text'] in text_nodes
                    record['text'] = request['text']
                record['output'] = output
                if args.freeze:
                    (CONTRACT / output).write_bytes(svg)
                else:
                    valid = valid and (CONTRACT / output).read_bytes() == svg
            if not args.freeze:
                valid = valid and record == expected.get(request['id'])
            label = ('NOT-COMPARED' if result['status'] == 'not-compared' else 'OK') if valid else 'FAIL'
            print(label + ' ' + request['id'] + ' ' + json.dumps(record, ensure_ascii=False), flush=True)
            failed |= not valid
            records.append(record)
        if not failed:
            xml = (CONTRACT / 'cases/xml-special.svg').read_text()
            twins = [xml.replace('>&lt;tag&gt;', '><tag>', 1),
                     xml.replace('aria-label="&lt;tag&gt;', 'aria-label="<tag>', 1),
                     xml.replace('&quot;double&quot;', '"double"', 1)]
            for index, twin in enumerate(twins):
                if twin == xml:
                    raise ValueError('XML refusal twin was not applied')
                try:
                    ET.fromstring(twin)
                except ET.ParseError:
                    print('OK xml-output-refusal-' + str(index), flush=True)
                else:
                    raise ValueError('unescaped XML twin was accepted')
        if args.freeze and not failed:
            (CONTRACT / 'manifest.json').write_text(json.dumps({'format': 1, 'owner': owner, 'cases': records}, indent=2) + '\n')
        if not failed:
            portable = {'format': 'drawing/1', 'owner': owner, 'profile': profile_environment(), 'cases': []}
            for record in records:
                item = dict(record)
                item['sourceSHA256'] = [sha((ROOT / name).read_bytes()) for name in record['sources']]
                if record.get('output'):
                    item['svg'] = (CONTRACT / record['output']).read_text()
                portable['cases'].append(item)
            data = json.dumps(portable, indent=2) + '\n'
            if args.freeze:
                (CONTRACT / 'contract.json').write_text(data)
            elif (CONTRACT / 'contract.json').read_text() != data:
                raise ValueError('portable Drawing contract differs from native cases')
        print('Drawing outcomes: ' + ', '.join(str(sum(r['status'] == status for r in records)) + ' ' + status for status in ['svg', 'refused', 'not-compared', 'failed']), flush=True)
        return int(failed)


if __name__ == '__main__':
    try:
        sys.exit(main())
    except (RuntimeError, ValueError, OSError, subprocess.TimeoutExpired) as error:
        print(json.dumps({'status': 'failed', 'reason': str(error)}), file=sys.stderr)
        sys.exit(2)
