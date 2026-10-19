#!/usr/bin/env python3
"""Run the versioned organization court contract against a supplied implementation.

The command is an argv array, never shell source. Expectations live in the
versioned manifest, separately from observed results. No output is accepted on
the strength of an exit code alone. The shape follows the theory's court
contract driver (Checks/court-contract.py there); the questions are this
package's: the company's plain court over its fragment.
"""
from collections import Counter
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess
import sys
import time


# An immutable suite name binds the exact manifest bytes, including its case set.
# New normative expectations require a new release and a deliberate registry entry.
SUITE_HASHES = {
    "showcase.organization.questions/0.1": "49c45e20f8fb3fdcc21e49c370264da482abb8e02e75bcd889998f77fd105d1c",
}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def within(root, name):
    path = (root / name).resolve()
    if not path.is_relative_to(root):
        raise ValueError(f"input escapes contract directory: {name}")
    return path


def load_contract(path):
    root = path.resolve().parent
    contract = json.loads(path.read_text())
    if contract.get('schema') != 'showcase.organization.conformance/1':
        raise ValueError('unknown manifest schema')
    expected_hash = SUITE_HASHES.get(contract.get('suite'))
    if expected_hash is None or digest(path) != expected_hash:
        raise ValueError('unregistered or changed manifest for this suite identity')
    cases = contract['cases']
    ids = [case['id'] for case in cases]
    if not cases or len(ids) != len(set(ids)):
        raise ValueError('empty or duplicate case list')
    absent = set(contract['missing_files'])
    for name in absent:
        if within(root, name).exists():
            raise ValueError(f'missing-file control exists: {name}')
    for name, entry in contract['files'].items():
        if digest(within(root, name)) != entry['sha256']:
            raise ValueError(f'fixture hash mismatch: {name}')
    for case in cases:
        if case['pass'] != 'plain' or not case['files']:
            raise ValueError(f"invalid pass or empty inputs: {case['id']}")
        if not set(case['files']) <= set(contract['files']) | absent:
            raise ValueError(f"unbound input: {case['id']}")
        for channel in ('stdout', 'stderr'):
            rule = case['expected'][channel]
            if ('lines' in rule) == ('line_patterns' in rule):
                raise ValueError(f"ambiguous output rule: {case['id']}")
            for pattern in rule.get('line_patterns', []):
                re.compile(pattern)
    return root, contract


def channel_matches(text, rule):
    # CRLF is the only permitted transport normalization.
    text = text.replace('\r\n', '\n')
    if any(separator in text for separator in ('\r', '\v', '\f', '\u0085', ' ', ' ')):
        return False
    if text and not text.endswith('\n'):
        return False
    lines = text[:-1].split('\n') if text else []
    if 'lines' in rule:
        wanted = rule['lines']
        return Counter(lines) == Counter(wanted) if rule.get('unordered') else lines == wanted
    patterns = rule['line_patterns']
    return len(lines) == len(patterns) and all(re.fullmatch(p, line) for p, line in zip(patterns, lines))


def run(argv, root, timeout):
    start = time.monotonic()
    try:
        result = subprocess.run(argv, cwd=root, capture_output=True, timeout=timeout)
        return {'argv': argv, 'exit': result.returncode,
                'stdout': result.stdout.decode('utf-8', errors='replace'),
                'stderr': result.stderr.decode('utf-8', errors='replace'),
                'seconds': round(time.monotonic() - start, 6)}
    except (OSError, subprocess.TimeoutExpired) as exc:
        return {'argv': argv, 'exit': None, 'stdout': '', 'stderr': '',
                'error': type(exc).__name__, 'detail': str(exc),
                'seconds': round(time.monotonic() - start, 6)}


def mismatches(actual, expected):
    if actual.get('error'):
        return [actual['error']]
    failures = []
    if actual['exit'] != expected['exit']:
        failures.append('exit')
    for channel in ('stdout', 'stderr'):
        if not channel_matches(actual[channel], expected[channel]):
            failures.append(channel)
    return failures


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', type=Path,
                        default=Path(__file__).resolve().parents[1] / 'Contracts/OrganizationCourt/v0.1/contract.json')
    parser.add_argument('--command-json', required=True,
                        help='JSON argv prefix, e.g. ["/absolute/ShowcaseTools", "judge"]')
    parser.add_argument('--implementation-id', required=True,
                        help='caller-supplied identity; not proof of a source/binary correspondence')
    parser.add_argument('--report', type=Path)
    parser.add_argument('--timeout', type=float, default=60)
    args = parser.parse_args()
    root, contract = load_contract(args.manifest)
    prefix = json.loads(args.command_json)
    if not isinstance(prefix, list) or not prefix or not all(isinstance(w, str) for w in prefix):
        raise SystemExit('command-json must be a nonempty JSON array of strings')
    results = []
    for case in contract['cases']:
        argv = prefix + case['files']
        actual = run(argv, root, args.timeout)
        failures = mismatches(actual, case['expected'])
        results.append({'id': case['id'], 'failures': failures, 'actual': actual})
        print(('PASS ' if not failures else 'FAIL ') + case['id']
              + ('' if not failures else ' (' + ', '.join(failures) + ')'))
    passed = sum(1 for r in results if not r['failures'])
    print(f"{passed}/{len(results)} cases matched; general equivalence is not established")
    if args.report:
        args.report.write_text(json.dumps({
            'suite': contract['suite'], 'manifest_sha256': digest(args.manifest),
            'versions': contract['versions'], 'implementation_id': args.implementation_id,
            'command_prefix': prefix, 'results': results}, ensure_ascii=False, indent=1) + '\n')
    sys.exit(0 if passed == len(results) else 1)


if __name__ == '__main__':
    main()
