#!/usr/bin/env python3
"""Replay each palette relation against its pinned source and the count court."""
import argparse
from functools import lru_cache
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
ORIGIN_SHA256 = "edfe1b1dd287cdfbbc09af9a544d677c0aad0e5b3084655370cb5d475edf6534"


def term(text):
    tokens = re.findall(r"[A-Za-z_]\w*|[<>,]", text)
    assert "".join(tokens) == re.sub(r"\s+", "", text), text
    position = 0

    def read():
        nonlocal position
        name = tokens[position]
        position += 1
        args = []
        if position < len(tokens) and tokens[position] == "<":
            position += 1
            while True:
                args.append(read())
                delimiter = tokens[position]
                position += 1
                if delimiter == ">":
                    break
                assert delimiter == ","
        return name, tuple(args)

    result = read()
    assert position == len(tokens), text
    return result


def definitions(text):
    # The numeric aliases are single-line declarations. Unrelated multiline
    # rendering declarations are not inputs to this independent arithmetic.
    found = {}
    for name, params, body in re.findall(
            r"^public typealias (\w+)(?:<([^>]+)>)? = ([^\n]+)", text, re.M):
        if body.count("<") != body.count(">"):
            continue
        parameters = tuple(p.split(":")[0].strip() for p in params.split(",")) if params else ()
        found[name] = (parameters, term(body))
    return found


def written(t):
    name, args = t
    return name + ("<" + ", ".join(written(arg) for arg in args) + ">" if args else "")


def evaluator(defs, products):
    @lru_cache(None)
    def value(t, env=()):
        name, args = t
        if name in dict(env):
            assert not args
            return dict(env)[name]
        if name in ("Unit", "Never"):
            assert not args
            return int(name == "Unit")
        if name in ("Plus", "Times"):
            assert len(args) == 2
            a, b = (value(arg, env) for arg in args)
            if name == "Plus":
                return a + b
            assert products, "a count presentation still contains Times"
            return a * b
        params, body = defs[name]
        assert len(params) == len(args), name
        return value(body, tuple(zip(params, (value(arg, env) for arg in args))))
    return value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--theory", required=True, type=Path)
    parser.add_argument("--judge", required=True, type=Path)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    folder = ROOT / "Checks/Playground"
    ledger = json.loads((folder / "palette-residue.json").read_text())
    origin_bytes = (folder / ledger["origin"]["fixture"]).read_bytes()
    assert hashlib.sha256(origin_bytes).hexdigest() == ORIGIN_SHA256 == ledger["origin"]["sha256"]
    assert ledger["origin"]["revision"] == "400b6674d1c120bb2b86150631093f86ec4d7994"
    assert ledger["origin"]["path"] == "corpus/Palette.swift"
    original = origin_bytes.decode()
    world = ROOT / ledger["world"]
    body = world.read_text()
    primitive = args.theory / "Sources/VerificationIsIdentification/Primitive.swift"
    primitive_text = primitive.read_text()
    before = definitions(original + "\n" + primitive_text)
    present = definitions(body + "\n" + primitive_text)
    old_value = evaluator(before, products=True)
    sum_value = evaluator(present, products=False)
    original_records = {
        name: expr for name, (params, expr) in before.items()
        if not params and expr[0] == "Legible"
    }
    assert len(original_records) == 17
    assert {r["id"] for r in ledger["requirements"]} == set(original_records)
    assert len(ledger["requirements"]) == 17
    assert ledger["required_outcome"] == "holds" and ledger["unsupported"] == []
    assert ledger["question"] == {
        "id": "vi.count.unit-never-plus/1", "predicate": "PaletteContrastQuestion",
        "encoding": "UnaryArithmeticEncoding", "sigma": "PaletteLight",
    }
    assert "gate-unsupported:" not in body and "ContrastHolds" not in body
    assert "extension Legible" not in body
    assert not any(expr[0] == "ContrastCount" for params, expr in present.values() if not params)
    legible_text = re.search(
        r"public enum Legible<Bright: Structure, Dark: Structure, Slack: Structure>"
        r": Close \{([^}]+)\}", body)[1]
    legible_fields = {name: term(t) for name, t in re.findall(
        r"typealias (\w+) = ([^\n]+)", legible_text)}
    assert set(legible_fields) == {"R1"}
    reading, reading_args = legible_fields["R1"]
    assert reading == "ContrastCount" and len(reading_args) == 3
    # Source of the old relation, rather than a formula copied from the new one.
    old_rhs = term(re.search(r"^where Bright == (.+) \{\}$", original, re.M)[1])
    fields_text = re.search(
        r"public enum ContrastCount<Bright: Structure, Dark: Structure, Slack: Structure>"
        r": PredicateReading \{([^}]+)\}", body)[1]
    fields = {name: term(t) for name, t in re.findall(r"typealias (\w+) = ([^\n]+)", fields_text)}
    assert fields["Left"] == term("Bright") and fields["Answer"] == term("Right")
    for field, value in (("Predicate", "PaletteContrastQuestion"),
                         ("Encoding", "UnaryArithmeticEncoding"), ("Sigma", "PaletteLight")):
        assert fields[field] == term(value)
    # The output door now takes an explicit integer scale. Its rational
    # coordinates and browser-facing labels retain their original values.
    screen = r"public typealias ScreenLight<[\s\S]+?(?=\n\n)"
    old_screen = re.search(screen, original)[0]
    expected_screen = old_screen.replace("= XYZWrite<", "= XYZRatioWrite<")
    for channel in "RGB":
        expected_screen = expected_screen.replace("Times<" + channel + ", Step>", channel)
    expected_screen = expected_screen.replace("SRGBBluePrimary.ZShare>>", "SRGBBluePrimary.ZShare>, CoordinateScale>")
    assert re.search(screen, body)[0] == expected_screen
    assert before["Step"] == ((), term("Half<Half<Half<Half<Half<Unit>>>>>"))
    assert sum_value(term("CoordinateScale")) == 32
    # The old step is 1/32. Every channel numerator is unchanged, so moving
    # that denominator to the output door preserves all printed thousandths.
    def labels(text):
        return dict(re.findall(r'extension (\w+) \{\s*public static var typeName: String \{ "([^"]*)" \}', text))
    # Keep every original browser-facing label at its own declaration. Profile
    # role/theme/witness words are new inputs, not changes to those labels.
    old_labels, new_labels = labels(original), labels(body)
    assert old_labels and all(new_labels.get(name) == value for name, value in old_labels.items())
    for name in before:
        if re.fullmatch(r".+(?:Lit|Dim)(?:Red|Green|Blue|Y)", name) or name.endswith("Slack"):
            assert sum_value(term(name)) == old_value(term(name)), name
    records = []
    for row in ledger["requirements"]:
        ident = row["id"]
        expression = original_records[ident]
        original_line = "public typealias " + ident + " = "
        source_line = next(line for line in original.splitlines() if line.startswith(original_line))
        assert row["relation"] == source_line
        assert original.splitlines()[row["source_line"] - 1] == source_line
        bright, dark, slack = expression[1]
        assert bright[0] == "Times" and len(bright[1]) == 2, ident
        assert bright[1][0] == term("Plus<U32, U8>"), ident
        target = ident + ".R1"
        expected_args = (bright[1][1], dark, slack)
        assert present[ident] == ((), ("Legible", expected_args)), ident
        assert row["route"] == "count" and row["targets"] == [target]
        assert row["negative_control"] == {
            "alias": ident, "argument": "Slack", "add": "Unit", "exit": 1, "refused": target,
        }
        numbers = tuple(old_value(t) for t in (bright, dark, slack))
        parameters = tuple(zip(("Bright", "Dark", "Slack"),
                               (sum_value(t) for t in expected_args)))
        new_numbers = tuple(sum_value(t, parameters) for t in reading_args)
        assert new_numbers == numbers, ident
        left, dark_count, slack_count = numbers
        old_right = old_value(old_rhs, (("Dark", dark_count), ("Slack", slack_count)))
        new_right = sum_value(fields["Right"], tuple(zip(("Bright", "Dark", "Slack"), numbers)))
        assert left == old_right == new_right == 180 * dark_count + 57344 + slack_count, ident
        records.append({"id": ident, "target": target, "bright": left,
                        "dark": dark_count, "slack": slack_count, "answer": old_right})
    print("palette: all 17 original bright arguments are Times<40, level>; every R1 preserves the integer relation")

    results = []
    with tempfile.TemporaryDirectory(prefix="palette-count-") as scratch:
        path = Path(scratch) / "Palette.swift"

        def run(label, text, exit_code, needle, refusals=0):
            path.write_text(text)
            command = [
                str(args.judge), "judge", "count", str(path), str(primitive),
                str(ROOT / "Sources/DocumentKit/Spectrum.swift"),
                "--predicate", "PaletteContrastQuestion",
                "--encoding", "UnaryArithmeticEncoding", "--sigma", "PaletteLight",
            ]
            result = subprocess.run(command, capture_output=True, text=True, timeout=60)
            assert result.returncode == exit_code and needle in result.stdout, (
                label, result.returncode, result.stdout, result.stderr)
            assert result.stdout.count("✗ COUNT:") == refusals, label
            assert not result.stderr, (label, result.stderr)
            results.append({"case": label, "exit": result.returncode, "stdout": result.stdout})
            print("palette: " + label)

        run("all 17 readings", body, 0, "✓ COUNT holds: 17 source-bound readings")
        ids = {row["id"] for row in records}
        for record in records:
            target, ident = record["target"], record["id"]
            isolated = re.sub(
                r"^public typealias (\w+) = [^\n]+\n",
                lambda m: "" if m[1] in ids and m[1] != ident else m[0], body, flags=re.M)
            run(ident + " alone", isolated, 0, "✓ COUNT holds: 1 source-bound readings")
            # Change the pair's own Slack argument. R1 must read this edit directly.
            actual_args = present[ident][1][1]
            wrong_args = (*actual_args[:2], ("Plus", (term("Unit"), actual_args[2])))
            negative, substitutions = re.subn(
                r"^public typealias " + ident + r" = [^\n]+$",
                "public typealias " + ident + " = " + written(("Legible", wrong_args)),
                body, flags=re.M)
            assert substitutions == 1
            needle = (f"'{target}' count Left = {record['bright']}, "
                      f"but Answer = {record['answer'] + 1} [PaletteContrastQuestion]")
            run(ident + " slack + 1", negative, 1, needle, refusals=1)
    report = {
        "question": ledger["question"], "origin": ledger["origin"],
        "world_sha256": hashlib.sha256(world.read_bytes()).hexdigest(),
        "primitive_sha256": hashlib.sha256(primitive.read_bytes()).hexdigest(),
        "judge_sha256": hashlib.sha256(args.judge.read_bytes()).hexdigest(),
        "arithmetic": records, "court_runs": results,
    }
    if args.report:
        args.report.write_text(json.dumps(report, indent=2) + "\n")
    print("✓ PALETTE holds: 17 original relations, 17 isolated readings, 17 addressed refusals")


if __name__ == "__main__":
    main()
