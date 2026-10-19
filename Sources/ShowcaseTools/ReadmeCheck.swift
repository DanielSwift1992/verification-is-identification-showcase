// README CHECK — the showcase README's numbers are counted, not remembered.
//
// The company half of the theory package's readme law, moved with the company (T-0015):
// people from the two team files, tests from this package's test sources, keypad cards from
// the credentialed people, the walk depths from the roster and the Organization page, and
// the two numbers a theory documentation page owns (the keypad's 6561 on Neighbors, the
// curve's 12800 on Curve), read from the theory checkout. A claim that drifts fails by name,
// and a claim that disappears fails too: silence is also a drift.

import Foundation

enum ReadmeCheck {
    static let root = FileManager.default.currentDirectoryPath
    static let theory = ProcessInfo.processInfo.environment["VI_THEORY_PATH"]
        ?? root + "/../verification-is-identification"

    static func read(_ path: String, in base: String = root) -> String? {
        try? String(contentsOfFile: base + "/" + path, encoding: .utf8)
    }

    static func countMatches(_ text: String, of pattern: String) -> Int {
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.numberOfMatches(in: text, range: NSRange(text.startIndex..., in: text))
    }

    static func swiftSources(_ directory: String) -> String {
        let base = root + "/" + directory
        let paths = (FileManager.default.enumerator(atPath: base)?.allObjects as? [String]) ?? []
        return paths.filter { $0.hasSuffix(".swift") }
            .map { (try? String(contentsOfFile: base + "/" + $0, encoding: .utf8)) ?? "" }
            .joined(separator: "\n")
    }

    /// Every capture of `pattern`, as text.
    static func words(_ text: String, _ pattern: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(text.startIndex..., in: text)
        return regex.matches(in: text, range: range).compactMap { match in
            guard match.numberOfRanges > 1,
                  let captured = Range(match.range(at: 1), in: text) else { return nil }
            return String(text[captured])
        }
    }

    /// Every capture of `pattern`, as digits with the thousands comma shed.
    static func claims(_ text: String, _ pattern: String) -> [Int] {
        words(text, pattern).compactMap { Int($0.replacingOccurrences(of: ",", with: "")) }
    }

    /// The number a prose word states: the walk sentences spell small counts as words.
    static let numberWords = [
        "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
        "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
    ]

    /// A file the check needs, or a refusal that names it: a missing page cannot count as zero.
    static func require(_ path: String, in base: String = root) -> String {
        guard let text = read(path, in: base) else {
            print("✗ the readme check cannot read \(base)/\(path)")
            exit(2)
        }
        return text
    }

    static func run(_ arguments: [String]) {
        let readme = require("README.md")
        var lies: [String] = []

        // What the two packages count today.
        let team = require("Sources/Organization/System/Team.swift")
        let named = countMatches(team, of: ": *Employee\\b")
        let generated = countMatches(require("Sources/Organization/System/GeneratedTeam.swift"), of: ": *Employee\\b")
        let people = named + generated
        let tests = countMatches(swiftSources("Tests"), of: "func test")
        let docc = "Sources/VerificationIsIdentification/VerificationIsIdentification.docc"
        let keypadSequences = claims(require(docc + "/Neighbors.md", in: theory), "= (\\d+)").first ?? 0
        let curveEmployees = claims(require(docc + "/Curve.md", in: theory), "N = ([\\d,]+)").first ?? 0

        // What the README says, each pattern read at every occurrence.
        let expectations: [(pattern: String, count: Int, name: String)] = [
            ("(\\d+)-person company", people, "people in the two team files"),
            ("the (\\d+) people", people, "people in the two team files"),
            ("Executed (\\d+) tests", tests, "test functions under Tests"),
            ("(\\d+) possible input sequences", keypadSequences, "sequences the Neighbors page derives"),
            ("to ([\\d,]+) employees", curveEmployees, "employees the Curve page measures"),
            ("([\\d,]+)-person file", curveEmployees, "employees the Curve page measures"),
        ]
        for expectation in expectations {
            let found = claims(readme, expectation.pattern)
            if found.isEmpty {
                lies.append("the claim \"\(expectation.pattern)\" is gone from the README, and the gate holds it")
                continue
            }
            let drifted = found.filter { $0 != expectation.count }
            for value in drifted {
                lies.append(
                    "the README says \(value) where the packages count \(expectation.count) (\(expectation.name))"
                )
            }
        }

        // The walk sentence, in both homes. The roster walk halves the roster at every door,
        // so its depth is implied by the people count. The site walk's depth has no formula
        // here, so the README and the Organization page must speak the same sentence.
        let organizationPage = require("Sources/Organization/Organization.docc/Organization.md")
        let rosterDepth = Int(ceil(log2(Double(max(people, 2)))))
        for home in [("README", readme), ("Organization page", organizationPage)] {
            let stated = words(home.1, "people in (\\w+)").compactMap { numberWords[$0] }
            if stated.isEmpty {
                lies.append("the roster-walk claim \"people in <depth>\" is gone from the \(home.0)")
            }
            let wrong = stated.filter { $0 != rosterDepth }
            for value in wrong {
                lies.append(
                    "the \(home.0) says the roster walk takes \(value) choices where "
                        + "\(people) people halve in \(rosterDepth)"
                )
            }
        }
        let credentialed = countMatches(team, of: ": *Employee, *Credentialed")
        let keypadCards = words(readme, "(\\w+) of the employee cards")
            .compactMap { numberWords[$0.lowercased()] }
        if keypadCards.isEmpty {
            lies.append("the keypad-cards claim \"<n> of the employee cards\" is gone from the README")
        }
        let overstated = keypadCards.filter { $0 != credentialed }
        for value in overstated {
            lies.append(
                "the README says \(value) cards carry a keypad where Team.swift declares "
                    + "\(credentialed) credentialed people"
            )
        }

        let readmeChoices = words(readme, "any page in (\\w+) choices")
        let pageChoices = words(organizationPage, "any page in (\\w+) choices")
        if readmeChoices.isEmpty || pageChoices.isEmpty {
            lies.append("the site-walk claim \"any page in <n> choices\" must stand in the README and the Organization page")
        } else if Set(readmeChoices + pageChoices).count > 1 {
            lies.append(
                "the site-walk depth disagrees: the README says \(readmeChoices.joined(separator: ", ")), "
                    + "the Organization page says \(pageChoices.joined(separator: ", "))"
            )
        }

        if lies.isEmpty {
            print(
                "✓ THE NUMBERS hold: \(people) people (\(named) named, \(generated) generated), \(tests) tests, "
                    + "\(keypadSequences) keypad sequences, \(curveEmployees) at the curve's end, "
                    + "walks \(pageChoices.first ?? "?") and \(rosterDepth) deep."
            )
        } else {
            for lie in lies { print("✗ \(lie)") }
            exit(1)
        }
    }
}
