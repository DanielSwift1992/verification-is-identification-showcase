#!/usr/bin/env python3
"""Stream one law; quote its bounded tail when the command fails."""
from pathlib import Path
import re
import subprocess
import sys

TAIL_BYTES = 8192
TAIL_LINES = 60
ANNOTATION_DATA_BYTES = 12000
HEADER = '::error title=Showcase law failed::'


def escape(text):
    return text.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')


class Tail:
    def __init__(self):
        self.data = bytearray()

    def append(self, chunk):
        self.data.extend(chunk[-TAIL_BYTES:])
        if len(self.data) > TAIL_BYTES:
            del self.data[:-TAIL_BYTES]

    def text(self):
        return ''.join(self.data.decode('utf-8', errors='replace').splitlines(keepends=True)[-TAIL_LINES:])


def annotation(law, status, tail):
    prefix = escape(f'Law {law} exited with status {status}. Last output:\n')
    room = ANNOTATION_DATA_BYTES - len(prefix.encode('utf-8'))
    quoted = escape(tail).encode('utf-8')[-room:].decode('utf-8', errors='ignore')
    return (HEADER + prefix + quoted + '\n').encode('utf-8')


def run(law, command, *, cwd, output):
    if not re.fullmatch(r'[a-z][a-z0-9-]{0,63}', law):
        raise ValueError('law needs its registered tag')
    tail = Tail()
    try:
        child = subprocess.Popen(command, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    except OSError as error:
        output.write(annotation(law, 127, str(error)))
        output.flush()
        return 127
    while True:
        chunk = child.stdout.read1(8192)
        if not chunk:
            break
        output.write(chunk)
        output.flush()
        tail.append(chunk)
    child.stdout.close()
    status = child.wait()
    if status:
        if tail.data and not tail.data.endswith(b'\n'):
            output.write(b'\n')
        output.write(annotation(law, status, tail.text()))
        output.flush()
    return status if status >= 0 else 1


if __name__ == '__main__':
    if len(sys.argv) < 4 or sys.argv[2] != '--':
        sys.exit('usage: ci-law.py <registered-law> -- <command> [argument ...]')
    sys.exit(run(sys.argv[1], sys.argv[3:], cwd=Path.cwd(), output=sys.stdout.buffer))
