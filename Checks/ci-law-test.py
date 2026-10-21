#!/usr/bin/env python3
"""A failed law keeps its name, status and safely quoted last output."""
from pathlib import Path
import importlib.util
import io
import os
import shutil
import subprocess
import sys
import tempfile
import unittest

# The clean-tree laws run after this check. Importing the helper leaves no cache.
sys.dont_write_bytecode = True

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('ci_law', ROOT / 'Checks/ci-law.py')
ci = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ci)


class LawOutputTests(unittest.TestCase):
    def child(self, source):
        output = io.BytesIO()
        code = ci.run('example', [sys.executable, '-c', source], cwd=ROOT, output=output)
        return code, output.getvalue()

    def test_success_keeps_both_streams_without_annotation(self):
        code, output = self.child("import sys;sys.stdout.write('out');sys.stdout.flush();sys.stderr.write(' err\\n')")
        self.assertEqual((code, output), (0, b'out err\n'))

    def test_failure_keeps_name_status_and_tail(self):
        for status in (1, 2, 3, 7, 127):
            code, output = self.child(f"print('original reason');raise SystemExit({status})")
            self.assertEqual(code, status)
            self.assertIn(f'Law example exited with status {status}'.encode(), output)
            self.assertIn(b'Last output:%0Aoriginal reason%0A', output)
            self.assertEqual(output.count(ci.HEADER.encode()), 1)

    def test_quotation_cannot_start_another_workflow_command(self):
        code, output = self.child("import sys;sys.stdout.write('100%\\r\\n::warning::payload\\n%0A');raise SystemExit(1)")
        report = output.split(ci.HEADER.encode(), 1)[1]
        self.assertEqual(code, 1)
        self.assertEqual(report.count(b'\n'), 1)
        self.assertNotIn(b'\r', report)
        self.assertIn(b'100%25%0D%0A::warning::payload%0A%250A', report)

    def test_unterminated_output_has_a_separate_annotation_line(self):
        code, output = self.child("import sys;sys.stdout.write('end');raise SystemExit(2)")
        self.assertTrue(output.startswith(b'end\n::error '))
        self.assertEqual(code, 2)

    def test_encoded_annotation_is_bounded_and_retains_the_last_reason(self):
        code, output = self.child("print('old sentinel');print('%'*100000);print('last reason');raise SystemExit(1)")
        raw, report = output.split(ci.HEADER.encode(), 1)
        self.assertIn(b'%'*100000, raw)
        self.assertNotIn(b'old sentinel', report)
        self.assertIn(b'last reason%0A', report)
        self.assertLessEqual(len(report), ci.ANNOTATION_DATA_BYTES + 1)
        self.assertEqual(code, 1)

    def test_tail_has_a_line_and_retained_memory_bound(self):
        tail = ci.Tail()
        tail.append(b'old line\n' + b'x'*100000)
        self.assertLessEqual(len(tail.data), ci.TAIL_BYTES)
        tail.append(b'\n' + b'line\n'*70 + b'last\n')
        self.assertNotIn('old line', tail.text())
        self.assertLessEqual(len(tail.text().splitlines()), ci.TAIL_LINES)
        self.assertTrue(tail.text().endswith('last\n'))

    def test_signal_and_missing_command_stay_red(self):
        code, output = self.child('import os,signal;os.kill(os.getpid(),signal.SIGTERM)')
        self.assertEqual(code, 1)
        self.assertIn(b'status -15', output)
        out = io.BytesIO()
        self.assertEqual(ci.run('example', ['/showcase-no-such-command'], cwd=ROOT, output=out), 127)
        self.assertIn(b'Law example', out.getvalue())

    def test_utf8_tail_boundary_still_has_valid_annotation_bytes(self):
        code, output = self.child("print('ж'*20000);print('last');raise SystemExit(1)")
        report = output.split(ci.HEADER.encode(), 1)[1]
        report.decode('utf-8')
        self.assertIn(b'last%0A', report)
        self.assertLessEqual(len(report), ci.ANNOTATION_DATA_BYTES + 1)
        self.assertEqual(code, 1)

    def test_failed_law_is_annotated_before_later_output(self):
        with tempfile.TemporaryDirectory(prefix='showcase-ci-later-') as directory:
            root=Path(directory);(root/'Checks').mkdir();(root/'Package.swift').write_text('// fixture\n')
            driver=(ROOT/'check.sh').read_text();start=driver.index('LAWS=(\n');end=driver.index('\n)\n',start)+3
            laws='LAWS=(\n"first|negative control|printf last-reason; false"\n"later|success|printf later-\\n; seq 1 100"\n)\n'
            (root/'check.sh').write_text(driver[:start]+laws+driver[end:])
            shutil.copyfile(ROOT/'Checks/ci-law.py',root/'Checks/ci-law.py')
            result=subprocess.run(['bash','check.sh'],cwd=root,env=dict(os.environ,VI_THEORY_PATH=str(root)),capture_output=True)
            self.assertEqual(result.returncode,1)
            self.assertIn(b'Law first exited with status 1',result.stdout)
            self.assertIn(b'Last output:%0Alast-reason',result.stdout)
            self.assertLess(result.stdout.index(b'Law first'),result.stdout.index(b'later-'))
            self.assertNotIn(b'Law later exited',result.stdout)

    def test_driver_preserves_pipefail(self):
        with tempfile.TemporaryDirectory(prefix='showcase-ci-pipe-') as directory:
            root = Path(directory)
            (root/'Checks').mkdir();(root/'Package.swift').write_text('// fixture\n')
            driver=(ROOT/'check.sh').read_text().replace('swift run Tools lint Sources/DynamicsDemo/Rules.swift --strict','false | true')
            (root/'check.sh').write_text(driver)
            shutil.copyfile(ROOT/'Checks/ci-law.py',root/'Checks/ci-law.py')
            result=subprocess.run(['bash','check.sh','--only','rules'],cwd=root,env=dict(os.environ,VI_THEORY_PATH=str(root)),capture_output=True)
            self.assertEqual(result.returncode,1)
            self.assertIn(b'Law rules exited with status 1',result.stdout)

    def test_driver_preserves_nounset(self):
        with tempfile.TemporaryDirectory(prefix='showcase-ci-unset-') as directory:
            root = Path(directory)
            (root/'Checks').mkdir();(root/'Package.swift').write_text('// fixture\n')
            driver=(ROOT/'check.sh').read_text()
            line=next(line for line in driver.splitlines() if line.startswith('"rules|'))
            driver=driver.replace(line, "'rules|nounset control|printf %s \"$SHOWCASE_CI_UNSET_CONTROL\"'")
            (root/'check.sh').write_text(driver)
            shutil.copyfile(ROOT/'Checks/ci-law.py',root/'Checks/ci-law.py')
            env=dict(os.environ,VI_THEORY_PATH=str(root))
            env.pop('SHOWCASE_CI_UNSET_CONTROL',None)
            result=subprocess.run(['bash','check.sh','--only','rules'],cwd=root,env=env,capture_output=True)
            self.assertEqual(result.returncode,1)
            self.assertIn(b'Law rules exited with status',result.stdout)
            self.assertIn(b'SHOWCASE_CI_UNSET_CONTROL',result.stdout)

    def test_driver_failure_names_the_actual_registered_law(self):
        with tempfile.TemporaryDirectory(prefix='showcase-ci-law-') as directory:
            root = Path(directory)
            (root/'Checks').mkdir();(root/'bin').mkdir();(root/'Package.swift').write_text('// fixture\n')
            shutil.copyfile(ROOT/'check.sh',root/'check.sh')
            shutil.copyfile(ROOT/'Checks/ci-law.py',root/'Checks/ci-law.py')
            swift=root/'bin/swift'
            swift.write_text("#!/bin/sh\nprintf 'first reason\\nlast reason 100%%\\n';exit 7\n")
            swift.chmod(0o755)
            result=subprocess.run(['bash','check.sh','--only','rules'],cwd=root,env=dict(os.environ,PATH=str(root/'bin')+':'+os.environ['PATH'],VI_THEORY_PATH=str(root)),capture_output=True)
            self.assertEqual(result.returncode,1)
            self.assertIn(b'Law rules exited with status 7',result.stdout)
            self.assertIn(b'last reason 100%25%0A',result.stdout)
            self.assertIn('✗ RED: rules'.encode(),result.stdout)


if __name__ == '__main__':
    unittest.main()
