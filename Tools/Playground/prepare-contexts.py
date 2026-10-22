#!/usr/bin/env python3
"""Author the world's pinned declaration contexts; publication only reads them.

These are source files, not a table of exported names or a replacement kit.
Every name and conformance is read by gate from the actual pinned Swift.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BEGIN = '// Owner-declared Language inputs (Tools/Playground/prepare-contexts.py).'
END = '// End owner-declared Language inputs.'
SHOWCASE = 'https://github.com/DanielSwift1992/verification-is-identification-showcase'
VI = 'https://github.com/DanielSwift1992/verification-is-identification'

def git(root, *args):
    return subprocess.check_output(['git', '-C', str(root), *args])

def prepare(revision, theory):
    revision = git(ROOT, "rev-parse", revision).decode().strip()
    vi_pin = re.search(r'let theoryRevision = "([0-9a-f]+)"', (ROOT / 'Package.swift').read_text())[1]
    for directory in sorted((ROOT / 'Worlds/Playground').iterdir()):
        manifest = directory / 'gate.manifest.swift'
        record = directory / '.gate/forms-definitions.json'
        if not manifest.is_file() or not record.is_file():
            continue
        text = re.sub(re.escape(BEGIN) + r'.*?' + re.escape(END) + r'\n?', '', manifest.read_text(), flags=re.S).rstrip() + '\n\n'
        data = json.loads(record.read_text())
        data['files'] = [f for f in data['files'] if not f['row'].startswith('Context')]
        extra = BEGIN + '\npublic enum WorldLanguage: Role {}\npublic enum DrawingPalette: Role {}\n'
        def take(row, source, source_revision, source_path, repository):
            nonlocal extra
            value = git(source, 'show', source_revision + ':' + source_path)
            digest = hashlib.sha256(value).hexdigest()
            existing = next((f for f in data['files'] if f['repository'] == repository and f['source_path'] == source_path), None)
            if existing:
                if existing['sha256'] != digest:
                    raise ValueError(str(record) + ': ' + existing['row'] + ' differs from ' + source_revision + ':' + source_path + '; repin the owner row explicitly')
                return existing['row']
            local = '.gate/inputs/language/' + source_path
            origin = row + 'Origin'
            extra += (f'public enum {origin}: Role {{}}\nextension {origin} {{\n'
                      f'    public static var typeName: String {{ "{repository}@{source_revision}" }}\n}}\n'
                      f'public enum {row}: Theirs {{\n    public typealias Kind = CarriedFile\n'
                      f'    public typealias At = {origin}\n}}\nextension {row} {{\n'
                      f'    public static var typeName: String {{ "{local}" }}\n}}\n')
            data['files'].append(dict(row=row, path=local, repository=repository, revision=source_revision,
                                      source_path=source_path, sha256=digest))
            return row
        scope = take('ContextScopes', ROOT, revision, 'Checks/Grammar/scopes.swift', SHOWCASE)
        primitive = take('ContextPrimitive', theory, vi_pin, 'Sources/VerificationIsIdentification/Primitive.swift', VI)
        alphabet = take('ContextAlphabet', theory, vi_pin, 'Sources/Alphabet/Alphabet.swift', VI)
        kit = [take('ContextKit' + name, ROOT, revision, 'Sources/DocumentKit/' + name + '.swift', SHOWCASE)
               for name in ('Vector', 'Design', 'Spectrum', 'GeneratedFontMetrics', 'Dynamics')]
        vi_inputs = [primitive]
        # These two owner dictionaries state Succ applications. Other worlds
        # do not borrow Numeral just because they use another part of VI.
        if directory.name in ('Atom', 'Light'):
            vi_inputs.append(take('ContextNumeral', theory, vi_pin, 'Sources/VerificationIsIdentification/Numeral.swift', VI))
        # These dictionaries refer to declarations in the compiler's real
        # inputs. Carry each complete source; never manufacture exported names.
        supplements = {'Light': ('Core',), 'Atom': ('Core', 'Verdict', 'Seeing'),
                       'Site': ('Core', 'Verdict')}
        for name in supplements.get(directory.name, ()):
            vi_inputs.append(take('Context' + name, theory, vi_pin,
                                  'Sources/VerificationIsIdentification/' + name + '.swift', VI))
        imports = [dict(module='VerificationIsIdentification', inputs=vi_inputs, namespace='VerificationIsIdentification'),
                   dict(module='Alphabet', inputs=[alphabet], namespace='Alphabet'),
                   dict(module='DocumentKit', inputs=kit, namespace='DocumentKit')]
        own_sources = '\n'.join(p.read_text() for p in directory.rglob('*.swift') if '.gate' not in p.parts and p != manifest)
        if 'import Organization' in own_sources:
            roster = take('ContextRoster', ROOT, revision, 'Sources/Organization/System/Roster.swift', SHOWCASE)
            imports.append(dict(module='Organization', inputs=[roster], namespace='Organization'))
        def language(match):
            body = re.sub(r'\n\s*public typealias Language\s*=\s*\w+', '', match[2])
            if re.search(r'typealias Kind = (?:DocumentFile|FormsFile|WorldFile)\b', body):
                body += '\n    public typealias Language = WorldLanguage\n'
            elif match[1] == 'ThePalette':
                body += '\n    public typealias Language = DrawingPalette\n'
            return 'public enum ' + match[1] + ': ' + match[3] + ' {' + body + '}'
        text = re.sub(r'public enum (\w+): (Mine|Theirs)\s*\{([^{}]*)\}',
                      lambda m: language((None, m[1], m[3], m[2])), text)
        # Palette has its own existing count question and input context.
        spectrum = next(f['row'] for f in data['files'] if f['source_path'] == 'Sources/DocumentKit/Spectrum.swift')
        palette_vi = [primitive] + [take('Context' + name, theory, vi_pin,
            'Sources/VerificationIsIdentification/' + name + '.swift', VI) for name in ('Core', 'Verdict')]
        intrinsic = [dict(namespace='Swift', version='vi.court.intrinsic-swift/2', exports=['Never', 'String'])]
        data['languages'] = dict(
            WorldLanguage=dict(module='World' + directory.name, namespace='World' + directory.name,
                               intrinsics=intrinsic, definitions=[], imports=imports, scope_map=scope),
            DrawingPalette=dict(module='DrawingPalette', namespace='DrawingPalette', intrinsics=intrinsic,
                                definitions=palette_vi + [spectrum], imports=[
                dict(module='VerificationIsIdentification', inputs=palette_vi, namespace='VerificationIsIdentification'),
                dict(module='DocumentKit', inputs=[spectrum], namespace='DocumentKit')], scope_map=scope))
        manifest.write_text(text + extra + END + '\n')
        record.write_text(json.dumps(data, indent=2) + '\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--revision', required=True)
    parser.add_argument('--theory', type=Path, required=True)
    args = parser.parse_args()
    prepare(args.revision, args.theory)
