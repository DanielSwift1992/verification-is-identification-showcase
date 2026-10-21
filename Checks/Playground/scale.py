#!/usr/bin/env python3
"""Read the full materialized company and its addressed negative controls."""
from pathlib import Path
import hashlib,json,re,subprocess,sys,tempfile
root=Path(__file__).resolve().parents[2]
subprocess.run(['node','Tools/Playground/generate-company.js','--check'],cwd=root,check=True)
record=json.loads((root/'Checks/Playground/scale-generation.json').read_text())
expected=json.loads((root/'Checks/Playground/scale-court.json').read_text())
names=record['company_files']
texts={name:(root/name).read_text() for name in names}
canonical=''.join(text if i==0 else text.split('\n',5)[5] for i,text in enumerate(texts.values()))
assert hashlib.sha256(canonical.encode()).hexdigest()==expected['canonical_company_sha256']
text='\n'.join(texts.values())
assert len(re.findall(r'^public enum Emp[0-9]+: Employee, Person \{',text,re.M))==expected['people']
assert '// gate-company-data' not in text
assert json.loads((root/'Worlds/Playground/Scale/.gate/forms-definitions.json').read_text())['plain_fragments']==[]
command=[sys.argv[1],'judge']
def judge(parts):
 with tempfile.TemporaryDirectory(prefix='scale-control-') as tmp:
  file=Path(tmp)/'Company.swift';file.write_text('\n'.join(parts.values()))
  result=subprocess.run(command+[str(file)],cwd=root,capture_output=True,text=True)
  starts=[];start=1
  for name,body in parts.items():
   size=len(body.split('\n'));starts.append((name,start,start+size));start+=size
  actual=[]
  for n,premise in re.findall(r'Company\.swift:(\d+)  (.*)',result.stdout+result.stderr):
   line=int(n);name,first,end=next(row for row in starts if row[1]<=line<row[2])
   actual.append(dict(file=Path(name).name,line=line-first+1,premise=premise))
  return result,actual
clean,_=judge(texts)
assert clean.returncode==0,(clean.stdout,clean.stderr)
counts=re.search(r'(\d+) declarations · (\d+) lookups · (\d+) premises',clean.stdout)
assert counts and dict(zip(('declarations','lookups','premises'),map(int,counts.groups())))==expected['clean'],clean.stdout
for case in expected['cases']:
 assert text.count(case['anchor'])==1 and case['anchor']!=case['replacement'],case['id']
 changed=dict(texts);changed[case['path']]=changed[case['path']].replace(case['anchor'],case['replacement'],1)
 result,actual=judge(changed)
 assert result.returncode==1 and actual==case['refusals'],(case['id'],result.stdout,result.stderr)
 print('SCALE REFUSAL '+case['id']+' '+json.dumps(actual),flush=True)
registry=json.loads((root/'Worlds/Playground/drawing.json').read_text())
scale=next(c for c in registry['worlds'] if c['id']=='scale')
assert scale['status']=='not-compared' and scale['expect']=='not-compared' and scale['reason']
print('SCALE ALL GREEN: '+json.dumps(dict(people=expected['people'],counts=expected['clean'],bytes=len(text.encode()),lines=len(text.splitlines()),generation_sha256=hashlib.sha256((root/'Checks/Playground/scale-generation.json').read_bytes()).hexdigest(),drawing='not-compared')))
