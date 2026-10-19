import PackagePlugin
import Foundation

// Spells the census into atoms on every build of the Organization target, the same
// relationship ProseGen has to Prose.json: the source is the repository's own Swift, the
// artifact lives in the plugin's work directory and is never committed, and the page that
// wears the numbers cannot go stale because the numbers are re-counted by the build that
// renders it. Input tracking rides this target's own sources (the same simplification
// LawCheck makes): a change in a sibling target refreshes the counts on the next build
// that touches this one, and a clean build — every deploy — counts everything fresh.
@main
struct CensusGen: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        guard let target = target as? SourceModuleTarget else { return [] }
        let tool = try context.tool(named: "Tools")
        let censusSwift = context.pluginWorkDirectory.appending("GeneratedCensus.swift")
        // The census counts the theory's targets through its checkout and this package's
        // own targets in place, by name, so a moved directory is refused, not counted as zero.
        guard let theory = context.package.dependencies.first(where: {
            $0.package.directory.lastComponent == "verification-is-identification"
                || $0.package.displayName == "VerificationIsIdentification"
        })?.package.directory else {
            Diagnostics.error("CensusGen: the theory package is not among the dependencies")
            return []
        }
        let showcase = context.package.directory
        let targets = [
            "VerificationIsIdentification:Lattice=\(theory.appending("Sources/VerificationIsIdentification"))",
            "DocumentKit:Engine=\(showcase.appending("Sources/DocumentKit"))",
            "Organization:Company=\(showcase.appending("Sources/Organization"))",
            "Court:Court=\(theory.appending("Sources/Court"))",
            "Tools+Plugins:Tooling=\(theory.appending("Sources/Tools")),\(theory.appending("Plugins")),"
                + "\(showcase.appending("Sources/ShowcaseTools")),\(showcase.appending("Plugins"))",
        ].flatMap { ["--target", $0] }
        return [
            .buildCommand(
                displayName: "Counting the census into atoms",
                executable: tool.path,
                arguments: ["census", "--emit", censusSwift.string] + targets,
                inputFiles: target.sourceFiles(withSuffix: "swift").map(\.path),
                outputFiles: [censusSwift]
            )
        ]
    }
}
