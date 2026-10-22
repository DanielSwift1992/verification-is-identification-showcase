#!/usr/bin/env python3
"""Recompute owner Court receipts. Gate authors a plan; the Swift owner answers.

The check consumes frozen, byte-bound requests and recomputes every answer. It
has no dependency on a gate build and never takes a saved verdict as evidence.
Gate independently matches the complete request hash before using a receipt.
"""
import argparse, hashlib, json, os, re, shutil, socket, subprocess, tempfile, time
import urllib.error, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OWNER = 'https://github.com/DanielSwift1992/verification-is-identification-showcase'
VI = 'https://github.com/DanielSwift1992/verification-is-identification'
REQUESTS = ROOT / 'Checks/Playground/court-requests.json'
READER = ROOT / 'Checks/Playground/court-reader.json'
BEGIN = '// Owner Court receipt inputs.'
END = '// End owner Court receipt inputs.'

def canonical(value): return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(',', ':')).encode()
def sha(value): return hashlib.sha256(value).hexdigest()
def require_disk():
    if shutil.disk_usage('/System/Volumes/Data' if Path('/System/Volumes/Data').is_dir() else ROOT).free < 5 * 1024 ** 3:
        raise RuntimeError('less than 5 GiB free; Court check not started')
def stored(path, value):
    path.parent.mkdir(parents=True, exist_ok=True); path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')

def authored_world(world):
    """Bind the world before its receipt rows, which cannot hash themselves."""
    manifest = (world/'gate.manifest.swift').read_text()
    manifest = re.sub(re.escape(BEGIN)+r'.*?'+re.escape(END)+r'\n?', '', manifest, flags=re.S).rstrip()+'\n'
    record = json.loads((world/'.gate/forms-definitions.json').read_text())
    receipt_rows = {row for context in record['languages'].values() for row in context.pop('receipts', [])}
    record['files'] = [file for file in record['files'] if file['row'] not in receipt_rows]
    return dict(manifest=sha(manifest.encode()), record=sha(canonical(record)))

def plan(gate, world):
    with socket.socket() as probe: probe.bind(('127.0.0.1', 0)); port = probe.getsockname()[1]
    with tempfile.TemporaryFile() as log:
        child = subprocess.Popen([str(gate), 'serve', str(port), '--no-open'], cwd=world, stdout=log, stderr=log)
        try:
            for _ in range(600):
                if child.poll() is not None: log.seek(0); raise RuntimeError(log.read().decode(errors='replace'))
                try:
                    with urllib.request.urlopen(f'http://127.0.0.1:{port}/grammar-contexts', timeout=60) as reply: result = json.load(reply)
                    if result.get('refusals') or result.get('unsupported'): raise ValueError(str(world)+': '+json.dumps(result))
                    return result
                except urllib.error.URLError: time.sleep(.1)
            raise RuntimeError(str(world)+': gate did not become ready')
        finally:
            child.terminate()
            try: child.wait(timeout=5)
            except subprocess.TimeoutExpired: child.kill(); child.wait()

def answer(command, request, positive=True):
    require_disk()
    with tempfile.TemporaryDirectory(prefix='showcase-court-question-') as directory:
        root = Path(directory)
        for file in request['files']:
            name = Path(file['name'])
            if name.is_absolute() or '..' in name.parts: raise ValueError('unsafe named input: '+str(name))
            path=root/name; path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(file['text'].encode())
        result=subprocess.run(command+request['arguments'], cwd=root, capture_output=True, timeout=1200)
        reply=dict(exit=result.returncode, stdout=result.stdout.decode(), stderr=result.stderr.decode())
        report=json.loads(reply['stdout'])
        if report.get('schema')!='vi.court.sources/1' or (positive and report.get('outcome') not in ('holds','empty')):
            raise ValueError('owner Court did not establish this reading: '+reply['stdout'])
        return reply

def native_reader():
    metadata=json.loads(READER.read_text()); revision=metadata['revision']
    cache=ROOT/'.build/court-reader'/revision; cache.mkdir(parents=True,exist_ok=True)
    local=os.environ.get('VI_THEORY_PATH')
    for name, digest in metadata['sources'].items():
        path=cache/name; raw=None
        if path.is_file() and sha(path.read_bytes())==digest: continue
        if local:
            p=subprocess.run(['git','-C',local,'show',revision+':'+name],capture_output=True)
            if p.returncode==0: raw=p.stdout
        if raw is None:
            with urllib.request.urlopen(VI.replace('github.com','raw.githubusercontent.com')+'/'+revision+'/'+name) as reply: raw=reply.read()
        if sha(raw)!=digest: raise ValueError(name+': bytes differ from the declared Court reader')
        path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw)
    main=cache/'main.swift'; main.write_text('import Foundation\nJudge.run(Array(CommandLine.arguments.dropFirst()))\n')
    binary=cache/'court'; stamp=cache/'build.json'
    compiler=subprocess.check_output(['swiftc','--version']).decode()
    binding=sha(canonical(dict(reader=metadata,main=sha(main.read_bytes()),compiler=compiler)))
    if binary.is_file() and stamp.is_file():
        receipt=json.loads(stamp.read_text())
        if receipt.get('input')==binding and receipt.get('binary')==sha(binary.read_bytes()): return [str(binary)]
    require_disk()
    with tempfile.TemporaryDirectory(prefix='showcase-court-build-') as tmp:
        command=['swiftc','-O','-module-cache-path',tmp,'-o',str(binary)]+[str(cache/name) for name in sorted(metadata['sources'])]+[str(main)]
        subprocess.run(command,check=True)
    stored(stamp,dict(input=binding,binary=sha(binary.read_bytes())))
    return [str(binary)]

def freeze(gate, command, revision):
    document=dict(format='showcase.court.requests/1',reader_revision=revision,worlds={},requests={})
    calculated={}
    for manifest in sorted((ROOT/'Worlds/Playground').glob('*/gate.manifest.swift')):
        world=manifest.parent; name=str(world.relative_to(ROOT)); reading=plan(gate,world)
        entry=dict(binding=authored_world(world),own={},languages={});document['worlds'][name]=entry
        for context in reading['contexts']:
            requests=context.get('requests',[])
            if not requests: continue
            receipts=[]; keys=[]
            for request in requests:
                if request['reader']['revision']!=revision: raise ValueError(name+': wrong Court reader')
                key=sha(canonical(request)); keys.append(key);document['requests'][key]=request
                for source in context['court']['sources']:
                    if source['role']!='own': continue
                    path=ROOT/source['source']
                    if not path.is_file(): path=world/source['source']
                    if not path.is_file(): raise ValueError(source['source']+': own input has no owner file')
                    entry['own'][str(path.relative_to(ROOT))]=sha(path.read_bytes())
                if key not in calculated: calculated[key]=answer(command,request)
                receipts.append(dict(schema='gate.court.receipt/1',request_sha256=key,response=calculated[key]))
            output='Contracts/CourtReceipts/v0.5/'+world.name+'/'+context['language']+'.json'
            stored(ROOT/output,dict(schema='gate.court.receipts/1',receipts=receipts))
            entry['languages'][context['language']]=dict(path=output,requests=keys)
            print(world.name,context['language'],len(keys),'owner answers recomputed',flush=True)
    if not calculated: raise ValueError('no declared Court requests')
    stored(REQUESTS,document)

def take(revision):
    revision=subprocess.check_output(['git','rev-parse',revision],cwd=ROOT,text=True).strip()
    for name,entry in json.loads(REQUESTS.read_text())['worlds'].items():
        world=ROOT/name;manifest=world/'gate.manifest.swift';record=world/'.gate/forms-definitions.json'
        text=re.sub(re.escape(BEGIN)+r'.*?'+re.escape(END)+r'\n?', '',manifest.read_text(),flags=re.S).rstrip()+'\n'
        data=json.loads(record.read_text());old={row for context in data['languages'].values() for row in context.pop('receipts',[])}
        data['files']=[file for file in data['files'] if file['row'] not in old]
        block=BEGIN+'\n'
        for language,reading in entry['languages'].items():
            row='CourtReceipt'+language;origin=row+'Origin';source=reading['path'];path='.gate/receipts/'+language+'.json'
            raw=subprocess.check_output(['git','show',revision+':'+source],cwd=ROOT)
            block+='public enum '+origin+': Role {}\nextension '+origin+' {\n    public static var typeName: String { "'+OWNER+'@'+revision+'" }\n}\n'
            block+='public enum '+row+': Theirs {\n    public typealias Kind = CarriedFile\n    public typealias At = '+origin+'\n}\nextension '+row+' {\n    public static var typeName: String { "'+path+'" }\n}\n'
            data['files'].append(dict(row=row,path=path,repository=OWNER,revision=revision,source_path=source,sha256=sha(raw)))
            data['languages'][language]['receipts']=[row]
        manifest.write_text(text+block+END+'\n');stored(record,data)
        if authored_world(world)!=entry['binding']: raise ValueError(name+': taking a receipt changed its question')

def controls(command, document):
    fixture=json.loads((ROOT/'Checks/Playground/courts.json').read_text())
    for case in fixture['cases']:
        world=case['world'].split('/')[0]; entry=document['worlds']['Worlds/Playground/'+world]
        candidates=[document['requests'][key] for key in entry['languages']['WorldLanguage']['requests']]
        requests=[r for r in candidates if r['arguments'][0]==case['court'] and all(
            '--'+name in r['arguments'] and r['arguments'][r['arguments'].index('--'+name)+1]==value
            for name,value in case.get('question',{}).items())]
        if len(requests)!=1: raise ValueError(case['id']+': question is not declared once')
        request=json.loads(json.dumps(requests[0]))
        if 'mutation' in case:
            source=fixture['declaration_files'].get(world,'Worlds/Playground/Site/Palette.swift')
            name=str(Path(source).relative_to('Worlds/Playground/'+world))
            file=next(f for f in request['files'] if f['name']==name)
            before,after=case['mutation']
            if file['text'].count(before)!=1: raise ValueError(case['id']+': mutation anchor lost')
            file['text']=file['text'].replace(before,after)
            context_name=request['arguments'][request['arguments'].index('--context')+1]
            context_file=next(f for f in request['files'] if f['name']==context_name)
            context=json.loads(context_file['text'])
            next(s for s in context['sources'] if s['input']==name)['sha256']=sha(file['text'].encode())
            context_file['text']=canonical(context).decode()
        response=answer(command,request,positive=False);report=json.loads(response['stdout'])
        if response['exit']!=case['exit']: raise ValueError(case['id']+': '+response['stdout'])
        objections=[d for row in report['results'] for d in row['diagnostics']]
        for field in ('equalities','memberships','readings'):
            if field in case and sum(row[field] for row in report['results'])!=case[field]: raise ValueError(case['id']+': wrong '+field)
        if 'refusal_count' in case and len(objections)!=case['refusal_count']: raise ValueError(case['id']+': wrong refusal coverage '+str(objections))
        for name in case.get('refused',[])+case.get('additional_refused',[])+case.get('refused_readings',[]):
            if not any("'"+name in d for d in objections): raise ValueError(case['id']+': missing '+name)
        for name,counts in case.get('reading_counts',{}).items():
            claim="'"+name+"' count Left = "+str(counts['left'])+", but Answer = "+str(counts['answer'])
            if not any(claim in d for d in objections): raise ValueError(case['id']+': wrong count at '+name)
        print('COURT CONTROL',case['id'],response['exit'],json.dumps(objections),flush=True)

def check(command):
    doc=json.loads(REQUESTS.read_text());metadata=json.loads(READER.read_text());calculated={};total=0
    if doc['format']!='showcase.court.requests/1' or doc['reader_revision']!=metadata['revision']: raise ValueError('Court reader differs from the frozen requests')
    worlds={str(p.parent.relative_to(ROOT)) for p in (ROOT/'Worlds/Playground').glob('*/gate.manifest.swift')}
    if set(doc['worlds'])!=worlds: raise ValueError('Court receipt coverage differs from the declared worlds')
    referenced={key for entry in doc['worlds'].values() for reading in entry['languages'].values() for key in reading['requests']}
    if referenced!=set(doc['requests']): raise ValueError('a complete request is missing or is not used by a world')
    for name,entry in doc['worlds'].items():
        world=ROOT/name
        if authored_world(world)!=entry['binding']: raise ValueError(name+': declared Language inputs changed; regenerate and repin Court receipts')
        for path,digest in entry['own'].items():
            if sha((ROOT/path).read_bytes())!=digest: raise ValueError(path+': own Court input changed; regenerate and repin its receipt')
        record=json.loads((world/'.gate/forms-definitions.json').read_text())
        for language,reading in entry['languages'].items():
            if not reading['requests'] or len(set(reading['requests']))!=len(reading['requests']): raise ValueError(name+': empty or repeated language reading')
            if sum(doc['requests'][key]['arguments'][0]=='where' for key in reading['requests'])!=1: raise ValueError(name+': own-source where coverage is not declared once')
            expected=[]
            for key in reading['requests']:
                request=doc['requests'][key]
                if sha(canonical(request))!=key or request['reader']['revision']!=metadata['revision']: raise ValueError(name+': request hash or reader differs')
                if key not in calculated: calculated[key]=answer(command,request)
                expected.append(dict(schema='gate.court.receipt/1',request_sha256=key,response=calculated[key]))
            path=ROOT/reading['path']; raw=path.read_bytes()
            if json.loads(raw)!=dict(schema='gate.court.receipts/1',receipts=expected): raise ValueError(str(path)+': answers differ from fresh Swift reading')
            refs=record['languages'][language].get('receipts',[])
            origins=[f for f in record['files'] if f['row'] in refs]
            if len(origins)!=1 or origins[0]['source_path']!=reading['path'] or origins[0]['sha256']!=sha(raw) or origins[0]['repository']!=OWNER:
                raise ValueError(name+': owner receipt is not the declared pinned input')
            total+=len(expected);print(name,language,'owner answers recomputed',flush=True)
    if not total: raise ValueError('no requests checked')
    controls(command,doc)
    print('COURT RECEIPTS GREEN:',total,'requests;',len(calculated),'distinct complete inputs recomputed')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--gate',type=Path);parser.add_argument('--command-json');parser.add_argument('--revision');parser.add_argument('--freeze',action='store_true');parser.add_argument('--take')
    args=parser.parse_args()
    if args.take: take(args.take)
    elif args.freeze:
        if not args.gate or not args.command_json or not args.revision: parser.error('--freeze needs --gate, --command-json and --revision')
        freeze(args.gate.resolve(),json.loads(args.command_json),args.revision)
    else: check(json.loads(args.command_json) if args.command_json else native_reader())
