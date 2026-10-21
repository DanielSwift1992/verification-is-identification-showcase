#!/usr/bin/env node
// Materialize the owner's company before publication. Gate reads the outputs.
"use strict";
const fs = require("fs"), path = require("path"), cp = require("child_process"), crypto = require("crypto");
const root = path.resolve(__dirname, "../..");
const configPath = "Tools/Playground/company-seed.json";
const sha = bytes => crypto.createHash("sha256").update(bytes).digest("hex");
function thousands(value) { return String(value).replace(/\B(?=(\d{3})+(?!\d))/g, "\u2009"); }
function mustReplace(view, from, to) {
    if (!view.includes(from)) throw new Error("makeBigCompany anchor lost: " + from.slice(0, 48));
    return view.replace(from, to);
}

function makeBigCompany(count, organizationFile, seed, pools) {
    const {givenPool, familyPool, bornPool, rankPool, departmentPool, sitePool} = pools;
    const organizationView = organizationFile.slice(0, organizationFile.indexOf("// ── the data the page reads"));
    const lines = [];
    // the same three modules the seed names: the people below are the domain's
    // own types, so the generated file builds where the seed builds
    lines.push("import VerificationIsIdentification", "import DocumentKit",
        "import Organization", "");
    lines.push("// A generated company of " + count + " people. Every field is computed from the");
    lines.push("// person's index, so no person depends on another. The cards above count");
    lines.push("// this list live: edit anyone, and the judge re-checks the file as you type.", "");
    let view = organizationView.slice(organizationView.indexOf("// ── the display strings"));
    view = mustReplace(view, '"The Organization"', '"The Organization, N = ' + thousands(count) + '"');
    // the same paragraph layout as the organization: five sentences swapped 1:1
    view = mustReplace(view,
        '"Four people, their departments and shares, written as types in the file on the left."',
        '"This file is the same organization, written out for ' + thousands(count) + ' people."');
    view = mustReplace(view,
        '"The drawing reads the declarations in this file. Browser drafts are saved with their verdict."',
        '"The editor shows a portion of this file; Full keeps the complete source."');
    view = mustReplace(view,
        '"Open Full to change a person or a department alias; the drawing reads the changed declarations."',
        '"The company court reads the declared department and share claims."');
    view = mustReplace(view,
        '"Change an employee Home from Finance to Sales; the company court names a broken share claim."',
        '"The court reads the complete company fragment, @LINES@ lines."');
    view = mustReplace(view,
        '"Open Table to read the declarations as rows; a name leads to its source."',
        '"Change a Home alias in Full; the court names a broken share claim at its line."');
    view = mustReplace(view,
        '"The court reads the declared company fragment. Edited page bodies have not been checked by Swift."',
        '"The editor shows this file in pages. The judge reads all pages at once."');
    lines.push(view, "// gate-company-data");
    for (let i = 0; i < givenPool.length; i += 1) {
        lines.push("public enum " + givenPool[i][0] + ": GivenNameCycle {");
        lines.push("    public typealias Next = " + givenPool[(i + 1) % givenPool.length][0]);
        lines.push("    public typealias Sex = " + givenPool[i][1], "}");
    }
    for (let i = 0; i < familyPool.length; i += 1) {
        lines.push("public enum " + familyPool[i] + ": FamilyNameCycle {");
        lines.push("    public typealias Next = " + familyPool[(i + 1) % familyPool.length], "}");
    }
    for (let i = 0; i < bornPool.length; i += 1) {
        lines.push("public enum " + bornPool[i] + ": BirthYearCycle {");
        lines.push("    public typealias Next = " + bornPool[(i + 1) % bornPool.length], "}");
    }
    lines.push("");
    const width = String(count - 1).length;
    const handle = (i) => "Emp" + String(i).padStart(width, "0");
    for (let i = 0; i < count; i += 1) {
        const n = i + seed;
        lines.push("public enum " + handle(i) + ": Employee, Person {");
        lines.push("    public typealias Rank = " + rankPool[n % 3]);
        lines.push("    public typealias Home = " + departmentPool[n % 4]);
        lines.push("    public typealias Given = " + givenPool[n % 12][0]);
        lines.push("    public typealias Family = " + familyPool[Math.floor(n / 12) % 12]);
        lines.push("    public typealias Born = " + bornPool[Math.floor(n / 144) % 8]);
        lines.push("    public typealias Site = " + sitePool[n % 3]);
        lines.push("    public typealias Sex = Given.Sex", "}");
    }
    lines.push("", "public enum Company: Roster {", "    @StructureBuilder",
        "    public static var body: some Structure {");
    for (let i = 0; i < count; i += 8) {
        const row = [];
        for (let j = i; j < Math.min(i + 8, count); j += 1) row.push(handle(j) + ".self;");
        lines.push("        " + row.join(" "));
    }
    lines.push("    }", "}");
    for (const [team, department, offset] of
        [["FinanceTeam", "Finance", 0], ["EngineeringTeam", "Engineering", 1]]) {
        lines.push("", "public enum " + team + ": Team {", "    @StructureBuilder",
            "    public static var body: some Structure {");
        for (let i = (offset - seed % 4 + 4) % 4; i < count; i += 4) {
            lines.push("        VerifiedInDepartment<" + handle(i) + ", " + department + ">.self;");
        }
        lines.push("    }", "}");
    }
    lines.push("", "public enum AllAccesses: AccessLedger {", "    @StructureBuilder",
        "    public static var body: some Structure {");
    for (let i = 0; i < count; i += 1) {
        const n = i + seed;
        lines.push("        VerifiedView<" + handle(i) + ", "
            + departmentPool[n % 4] + "Share>.self;");
    }
    lines.push("    }", "}", "");
    const full = lines.join("\n");
    return full.replace("@LINES@", thousands(full.split("\n").length));
}


function materialize(count, seed, config) {
    const organization = fs.readFileSync(path.join(root, "Worlds/Playground/Organization/Organization.swift"), "utf8");
    const mixed = makeBigCompany(count, organization, seed, config.pools);
    const marker = "// gate-company-data\n", boundary = mixed.indexOf(marker);
    if (boundary < 0 || boundary !== mixed.lastIndexOf(marker)) throw Error("one company boundary is required");
    const header = "import VerificationIsIdentification\nimport DocumentKit\nimport Organization\n\n";
    const data = header + "// Materialized by Tools/Playground/generate-company.js; seed " + seed + ".\n"
        + mixed.slice(boundary + marker.length);
    const pages = mixed.slice(0, boundary).replace(/complete company fragment, [^"]+ lines/, "complete company fragment, " + thousands(data.split("\n").length) + " lines");
    let manifest = fs.readFileSync(path.join(root, "Worlds/Playground/Company/gate.manifest.swift"), "utf8");
    manifest += "\n// The owner supplies the page and geometry; neither states company premises.\n";
    for (const [name, file] of [["ThePages", "ScalePages.swift"], ["TheGeometry", "Dictionary/Design.swift"]]) {
        manifest += "public enum " + name + ": Mine {\n    public typealias Kind = CarriedFile\n}\nextension " + name
            + " {\n    public static var typeName: String { \"" + file + "\" }\n}\n";
    }
    return {
        "Worlds/Playground/Scale/Company.swift": Buffer.from(data),
        "Worlds/Playground/Scale/ScalePages.swift": Buffer.from(pages),
        "Worlds/Playground/Scale/Dictionary/Design.swift": fs.readFileSync(path.join(root, "Worlds/Playground/Organization/Dictionary/Design.swift")),
        "Worlds/Playground/Scale/gate.manifest.swift": Buffer.from(manifest),
        "Worlds/Playground/Scale/.gate/forms-definitions.json": fs.readFileSync(path.join(root, "Worlds/Playground/Company/.gate/forms-definitions.json"))
    };
}
function run(args) {
    const config = JSON.parse(fs.readFileSync(path.join(root, configPath)));
    let count = config.count, seed = config.seed, check = false;
    while (args.length) {
        const flag = args.shift();
        if (flag === "--check") check = true;
        else if (flag === "--count") count = Number(args.shift());
        else if (flag === "--seed") seed = Number(args.shift());
        else throw Error("usage: node Tools/Playground/generate-company.js [--count N] [--seed N] [--check]");
    }
    if (!Number.isSafeInteger(count) || count < 8 || !Number.isSafeInteger(seed) || seed < 0 || seed + count > 2 ** 31)
        throw Error("count and seed must be bounded integers; count >= 8, seed >= 0");
    const git = args => cp.execFileSync("git", args, {cwd:root, encoding:"utf8"}).trim();
    const toolPath = "Tools/Playground/generate-company.js";
    const toolRevision = git(["log", "-1", "--format=%H", "--", toolPath]);
    const input = (file, revision) => {
        const bytes = fs.readFileSync(path.join(root, file));
        const committed = cp.execFileSync("git", ["show", revision + ":" + file], {cwd:root});
        if (!bytes.equals(committed)) throw Error(file + ": commit the recipe/input before recording its provenance");
        return {path:file, revision, sha256:sha(bytes)};
    };
    const tool = input(toolPath, toolRevision);
    const inputs = [input(configPath, git(["log", "-1", "--format=%H", "--", configPath])),
        ...["Worlds/Playground/Organization/Organization.swift", "Worlds/Playground/Organization/Dictionary/Design.swift",
            "Worlds/Playground/Company/gate.manifest.swift", "Worlds/Playground/Company/.gate/forms-definitions.json"]
            .map(file => input(file, config.source_revision))];
    const files = materialize(count, seed, config);
    const record = {format:"scale-generation/1", tool, inputs, parameters:{count, seed},
        outputs:Object.entries(files).map(([file, bytes]) => ({path:file, sha256:sha(bytes), bytes:bytes.length})),
        command:"node Tools/Playground/generate-company.js --count " + count + " --seed " + seed,
        storage:"versioned", compilation:"Company.swift is read whole by the company court. The Scale page has not been compiled or compared by Drawing."};
    const source = fs.readFileSync(path.join(root, "Worlds/Playground/Organization/Organization.swift"), "utf8");
    const legacy = makeBigCompany(count, source, seed, config.pools);
    record.address_map = {legacy:"gate@8886973: generated Company.swift", file:"Worlds/Playground/Scale/Company.swift",
        legacy_data_start_line:legacy.slice(0, legacy.indexOf("// gate-company-data\n") + "// gate-company-data\n".length).split("\n").length,
        data_start_line:6, rule:"The data suffix is byte-identical; add the difference of these start lines to map an old data line."};
    files["Checks/Playground/scale-generation.json"] = Buffer.from(JSON.stringify(record, null, 2) + "\n");
    for (const [file, bytes] of Object.entries(files)) {
        const target = path.join(root, file);
        if (check) {
            if (!fs.existsSync(target) || !fs.readFileSync(target).equals(bytes)) throw Error(file + ": materialized bytes differ; run the recorded command");
        } else {
            fs.mkdirSync(path.dirname(target), {recursive:true}); fs.writeFileSync(target, bytes);
        }
    }
    console.log((check ? "SCALE RECIPE GREEN: " : "materialized Scale: ") + count + " people, seed " + seed
        + ", " + record.outputs.reduce((n, f) => n + f.bytes, 0) + " output bytes");
}
module.exports = {makeBigCompany, materialize};
if (require.main === module) { try { run(process.argv.slice(2)); } catch (e) { console.error(e.message); process.exitCode = 1; } }
