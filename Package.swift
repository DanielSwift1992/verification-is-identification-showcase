// swift-tools-version: 6.0
// Skeleton, 18 October 2026. Targets arrive with the migration slice (Desk task T-0015).
// Development uses the sibling checkout of the theory package; a release pins a tagged revision instead.
import PackageDescription

let package = Package(
    name: "verification-is-identification-showcase",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(path: "../verification-is-identification"),
    ],
    targets: []
)
