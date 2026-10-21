#!/usr/bin/env python3
"""Read the full materialized company and its addressed negative controls."""
from pathlib import Path
import hashlib,json,re,subprocess,sys,tempfile
root=Path(__file__).resolve().parents[2]
subprocess.run(['node','Tools/Playground/generate-company.js','--check'],cwd=root,check=True)
record=json.loads((root/'Checks/Playground/scale-generation.json').read_text())
expected=json.loads((root/'Checks/Playground/scale-court.json').read_text())
text=(root/expected['company']).read_text()
assert len(re.findall(r'^public enum Emp[0-9]+: Employee, Person \{',text,re.M))==expected['people']
assert '// gate-company-data' not in text
assert json.loads((root/'Worlds/Playground/Scale/.gate/forms-definitions.json').read_text())['plain_fragments']==[]
command=[sys.argv[1],'judge']
clean=subprocess.run(command+[expected['company']],cwd=root,capture_output=True,text=True)
assert clean.returncode==0,(clean.stdout,clean.stderr)
counts=re.search(r'(\d+) declarations · (\d+) lookups · (\d+) premises',clean.stdout)
assert counts and dict(zip(('declarations','lookups','premises'),map(int,counts.groups())))==expected['clean'],clean.stdout
for case in expected['cases']:
 assert text.count(case['anchor'])==1 and case['anchor']!=case['replacement'],case['id']
 with tempfile.TemporaryDirectory(prefix='scale-control-') as tmp:
  file=Path(tmp)/'Company.swift';file.write_text(text.replace(case['anchor'],case['replacement'],1))
  result=subprocess.run(command+[str(file)],cwd=root,capture_output=True,text=True)
  actual=[dict(line=int(n),premise=p) for n,p in re.findall(r'Company\.swift:(\d+)  (.*)',result.stdout+result.stderr)]
  assert result.returncode==1 and actual==case['refusals'],(case['id'],result.stdout,result.stderr)
  print('SCALE REFUSAL '+case['id']+' '+json.dumps(actual),flush=True)
registry=json.loads((root/'Worlds/Playground/drawing.json').read_text())
scale=next(c for c in registry['worlds'] if c['id']=='scale')
assert scale['status']=='not-compared' and scale['expect']=='not-compared' and scale['reason']
print('SCALE ALL GREEN: '+json.dumps(dict(people=expected['people'],counts=expected['clean'],bytes=len(text.encode()),lines=len(text.splitlines()),generation_sha256=hashlib.sha256((root/'Checks/Playground/scale-generation.json').read_bytes()).hexdigest(),drawing='not-compared')))
