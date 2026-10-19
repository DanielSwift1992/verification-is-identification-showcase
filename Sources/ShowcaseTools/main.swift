import Foundation
import OrganizationCourt

// ShowcaseTools: the commands that read or build this package's world. The lint, grammar,
// census and voice are the theory package's `Tools`, run from this package's root
// (`swift run Tools …`); these are the ones that need the company itself.
//
//   prose      spell Prose.json into Glyph atoms + Open types, run by the ProseGen build plugin.
//   generate   regenerate the roster (`org [N]`), the font metrics (`font`), or both (`all`):
//              checked-in artifacts. The card art, the diagrams and the chart are VectorDemo's;
//              the complete regenerate is `swift package generate`.
//   curve      the saturation instrument: growing companies, timed builds, the growth law.
//   judge      the company's plain court over the paths it is given (`parse` prints what it
//              read); `diff N` seats it beside the compiler on one corpus under planted lies;
//              `chain N [--swift]` replays the derivation-chain spelling.
//   site       build the combined DocC archive of this package and serve it locally.
//   readme     the README's company numbers, counted from the team files and the pages.
//
// A disposable worktree of this package lives in a temporary directory, where the sibling
// checkout of the theory is not a sibling. When a sibling exists and VI_THEORY_PATH is unset,
// its absolute path is resolved here, once, for every child; otherwise the children build
// against the pinned revision of Package.swift, as this process did.
if ProcessInfo.processInfo.environment["VI_THEORY_PATH"] == nil {
    let theory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent("../verification-is-identification").standardizedFileURL.path
    if FileManager.default.fileExists(atPath: theory + "/Package.swift") {
        setenv("VI_THEORY_PATH", theory, 0)
    }
}

switch CommandLine.arguments.dropFirst().first {
case "prose":    ProseGenTool.run(Array(CommandLine.arguments.dropFirst(2)))
case "curve":    Curve.run(Array(CommandLine.arguments.dropFirst(2)))
case "site":     Site.run(Array(CommandLine.arguments.dropFirst(2)))
case "readme":   ReadmeCheck.run(Array(CommandLine.arguments.dropFirst(2)))
case "judge":
    let arguments = Array(CommandLine.arguments.dropFirst(2))
    if arguments.first == "diff" || arguments.first == "chain" {
        JudgeDiff.run(arguments)
    } else {
        OrganizationJudge.run(arguments)
    }
case "generate":
    let sub = Array(CommandLine.arguments.dropFirst(2))
    let rest = Array(sub.dropFirst())
    switch sub.first {
    case "org":   GenerateOrg.run(rest)
    case "font":  GenerateFont.run(rest)
    case "all":
        GenerateOrg.run(rest)
        GenerateFont.run([])
        print("ShowcaseTools generate all: roster and font metrics; cards/diagram/pulse/board/heroes are VectorDemo's; the complete regenerate is `swift package generate` (or `swift package generate all`), not this command alone.")
    default:
        FileHandle.standardError.write(Data("usage: ShowcaseTools generate <org|font|all> [N]: the COMPLETE regenerate is `swift package generate`\n".utf8))
        exit(2)
    }
default:
    FileHandle.standardError.write(Data("usage: ShowcaseTools <prose|generate|curve|judge|site|readme> ...\n".utf8))
    exit(2)
}
