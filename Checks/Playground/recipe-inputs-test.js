#!/usr/bin/env node
"use strict";
const fs = require("fs"), path = require("path"), os = require("os"), cp = require("child_process"),
    crypto = require("crypto"), assert = require("assert"), {pathToFileURL} = require("url");
const {readRecipeInput} = require("../../Tools/Playground/generate-company.js");
const temporary = fs.mkdtempSync(path.join(os.tmpdir(), "scale-inputs-"));
const full = path.join(temporary, "full"), shallow = path.join(temporary, "shallow");
const bytes = Buffer.from("pinned input\n");
const git = (root, args) => cp.execFileSync("git", args, {cwd:root, encoding:"utf8", stdio:["ignore", "pipe", "pipe"]}).trim();
const commit = message => git(full, ["-c", "user.name=Scale checks", "-c", "user.email=checks@example.invalid",
    "-c", "commit.gpgSign=false", "commit", "-qm", message]);
const address = "scale-generation/1#inputs[0]";
let controls = 0;
function refused(root, row, reason) {
    assert.throws(() => readRecipeInput(root, row, address), error =>
        error.message.includes(address) && error.message.includes(row.path + "@" + row.revision)
        && error.message.includes(reason));
    controls += 1;
}
try {
    fs.mkdirSync(full);
    git(full, ["init", "-q"]);
    git(full, ["branch", "-M", "main"]);
    fs.writeFileSync(path.join(full, "input.txt"), bytes);
    git(full, ["add", "input.txt"]); commit("pin input");
    const revision = git(full, ["rev-parse", "HEAD"]);
    const row = {path:"input.txt", revision, sha256:crypto.createHash("sha256").update(bytes).digest("hex")};
    fs.writeFileSync(path.join(full, "later.txt"), "later\n");
    git(full, ["add", "later.txt"]); commit("later head");
    assert.deepStrictEqual(readRecipeInput(full, row, address), bytes); controls += 1;
    git(temporary, ["clone", "--quiet", "--depth", "1", "--branch", "main", pathToFileURL(full).href, shallow]);
    assert.strictEqual(git(shallow, ["rev-parse", "--is-shallow-repository"]), "true");
    assert.notStrictEqual(cp.spawnSync("git", ["cat-file", "-e", revision + "^{commit}"], {cwd:shallow}).status, 0);
    assert.deepStrictEqual(readRecipeInput(shallow, row, address), bytes); controls += 1;
    assert.strictEqual(git(shallow, ["rev-parse", "--is-shallow-repository"]), "true");
    refused(shallow, {...row, revision:"f".repeat(40)}, "pinned revision unavailable");
    refused(shallow, {...row, sha256:"0".repeat(64)}, "pinned SHA-256 mismatch");
    const changed = Buffer.from(bytes); changed[0] ^= 1;
    fs.writeFileSync(path.join(shallow, "input.txt"), changed);
    refused(shallow, row, "working SHA-256 mismatch");
    fs.writeFileSync(path.join(shallow, "input.txt"), bytes);
    fs.writeFileSync(path.join(shallow, "absent.txt"), bytes);
    refused(shallow, {...row, path:"absent.txt"}, "absent or unreadable at the pinned revision");
    refused(shallow, {...row, revision:"HEAD"}, "full commit pin");
    refused(shallow, {...row, sha256:"invalid"}, "SHA-256 digest");
    git(shallow, ["remote", "set-url", "origin", path.join(temporary, "unavailable-origin")]);
    assert.deepStrictEqual(readRecipeInput(shallow, row, address), bytes); controls += 1;
    console.log("SCALE INPUTS GREEN: " + controls + " controls; full and depth-1 pins, addressed refusals, warm offline read");
} finally {
    fs.rmSync(temporary, {recursive:true, force:true});
}
