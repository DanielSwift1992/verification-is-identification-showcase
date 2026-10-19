// swift-tools-version: 5.9
// The showcase package: the company world, its rendering and its checks, a consumer of the
// theory package (T-0015). It is checked against the theory at `theoryRevision`. VI_THEORY_PATH
// names a local checkout of the theory instead: check.sh sets it to the sibling checkout, the
// workflow to the revision it checks out, and ShowcaseTools passes it to its disposable worktrees.
import PackageDescription

let theoryRevision = "458dd5aacbc5d7c6f2d9a75dff3c49850f41b74b"
// The name keeps `package: "verification-is-identification"` resolving whatever the checkout's
// directory is called: a path dependency otherwise takes its identity from the directory name.
let theory: Package.Dependency = Context.environment["VI_THEORY_PATH"].map { .package(name: "verification-is-identification", path: $0) }
    ?? .package(url: "https://github.com/DanielSwift1992/verification-is-identification", revision: theoryRevision)

let package = Package(
    name: "VerificationIsIdentificationShowcase",
    platforms: [.macOS(.v13)],
    products: [
        // Organization: a scaled showcase, a whole company's access model as types,
        // every access proved at build. The framework applied to business logic.
        .library(name: "Organization", targets: ["Organization"]),

        // DocumentKit: atoms (Close) and combinators (Open) that compose into documents.
        // Rendering is typeName walking the Paired chain.
        .library(name: "DocumentKit", targets: ["DocumentKit"]),
    ],
    dependencies: [
        theory,
        // Docs only: Swift-DocC renders the catalogs into a browsable site. NOT a target dependency.
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        // The commands that read or build this package's world: prose, generate, curve,
        // judge diff/chain, site. The lint, grammar, census, voice and plain judge are the
        // theory's Tools, run from this root.
        .executableTarget(name: "ShowcaseTools", dependencies: [
            .product(name: "Court", package: "verification-is-identification"),
            .product(name: "Alphabet", package: "verification-is-identification"),
        ]),

        // Spells Organization/Prose.json into Glyph atoms + Open types on every build.
        .plugin(name: "ProseGen", capability: .buildTool(), dependencies: ["ShowcaseTools"]),
        // Spells the census into atoms on every build of Organization, counting the theory's
        // targets through its checkout and this package's own in place.
        .plugin(name: "CensusGen", capability: .buildTool(), dependencies: [
            .product(name: "Tools", package: "verification-is-identification"),
        ]),

        // `swift package generate [org|cards|diagram|chart|all] [N]`: the roster, the login
        // walk, the card art and the architecture diagram, checked-in artifacts.
        .plugin(name: "GenerateCommand",
                capability: .command(
                    intent: .custom(verb: "generate",
                                    description: "Regenerate the roster, the login walk, the card art, and the architecture diagram"),
                    permissions: [.writeToPackageDirectory(
                        reason: "regenerate GeneratedTeam/GeneratedRoster/GeneratedLogin/GeneratedEmployeeCards.swift, the card SVGs, and architecture.svg")]),
                dependencies: ["ShowcaseTools", "VectorDemo"]),

        // The dynamics world: one state file whose slots move by rewrite triples, pressed by
        // the theory's `swift run Tools press <Rule> --file … --rules …`.
        .executableTarget(name: "DynamicsDemo", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            "DocumentKit",
            .product(name: "Examples", package: "verification-is-identification"),
        ]),

        // DocumentKit: atoms + combinators → documents via typeName; Vector.swift is the same
        // mechanism on a second medium, SVG.
        .target(name: "DocumentKit", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            .product(name: "Alphabet", package: "verification-is-identification"),
        ], plugins: [.plugin(name: "LawCheck", package: "verification-is-identification")]),

        // `swift run DocumentKitDemo render-doc`: the engine documents itself.
        .executableTarget(name: "DocumentKitDemo", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            "DocumentKit",
            .product(name: "Examples", package: "verification-is-identification"),
        ]),

        // `swift run VectorDemo cards|diagram|chart|all`: the card art, the architecture
        // diagram and the headcount chart, composed from real `Vector` atoms.
        .executableTarget(name: "VectorDemo", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            "DocumentKit", "Organization",
        ]),

        // Organization: the domain model (System/, Query/) and its rendering (View/).
        .target(name: "Organization", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            "DocumentKit",
            .product(name: "Alphabet", package: "verification-is-identification"),
        ], plugins: ["ProseGen", "CensusGen", .plugin(name: "LawCheck", package: "verification-is-identification")]),

        // The generated walk page types, as their own module.
        .target(name: "OrgWalkPages", dependencies: [
            .product(name: "VerificationIsIdentification", package: "verification-is-identification"),
            "DocumentKit", "Organization",
        ]),

        // `swift run OrgDemo render-doc`: every generated page's rendered markdown into the catalog.
        .executableTarget(name: "OrgDemo", dependencies: ["Organization", "DocumentKit", "OrgWalkPages"]),

        // count pins the numbers the showcase's body-composed types settle to.
        .testTarget(name: "OrganizationTests", dependencies: ["Organization"]),
    ]
)
