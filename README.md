# Verification Is Identification · showcase

This repository contains a 204-person company written as Swift types: its people, their documents, the access rules and an intranet website. The same declarations are checked against the access rules and rendered into the website. Pages and navigation are generated ahead of time, so browsing them needs no application server.

The types and rules come from [Verification Is Identification](https://github.com/DanielSwift1992/verification-is-identification). This repository shows what can be constructed and checked with them.

## The company

Declarations describe the 204 people, their documents and their access requests. An access rule is a conditional conformance, and the compiler checks every declared request against the rules.

[Open the playground](https://danielswift1992.github.io/typed-playground/), change a declaration and see how the checker responds. **Plant a lie** changes a declaration for the checker to read. The At scale tab checks a 12,800-person file with the page's JavaScript checker. [Its checks](https://github.com/DanielSwift1992/typed-playground#the-checks) document the supported subset of Swift.

This is a constructed company, not a connection to a real organisation. The checks establish relations between its declarations. Enforcing access in a running system would need its own implementation and a checked connection to the source.

## The website and its navigation

The [company site](https://danielswift1992.github.io/verification-is-identification-showcase/documentation/organization/) presents dashboards, reports and personal cards. Within their declared directories, the guided walks reach any page in four choices and any of the people in eight. The reader chooses each branch. [DocumentKit](https://danielswift1992.github.io/verification-is-identification-showcase/documentation/documentkit/) renders the pages and the SVG from types.

Four of the employee cards have a type-checked keypad, an example of navigation between declared states. A key is a link to a declared state. The 6561 possible input sequences share a small state graph, because every wrong digit leads to the same dead state. The compiler checks the type of the supplied secret against the page's declared secret, and nothing a visitor types reaches the compiler. The page prints the code, and the unlocked address can be opened directly. The example shows state transitions. It is not an authentication mechanism.

## Build and check

`swift build` builds against the theory revision that `Package.swift` pins, so an ordinary build reproduces anywhere. `swift test` runs the company's count tests and prints "Executed 15 tests".

[`check.sh`](check.sh) runs every law of this package: the build and its tests, the seven refusals of the published claim, the dynamics rules, the committed artifacts against the types that produce them, the second judge against the compiler under planted changes, the numbers on this page, the census and the voice. Two of the regenerated artifacts belong to the theory, the curve chart and the covered visible claim, so the full check needs the theory's source tree: the sibling checkout `../verification-is-identification`, or the checkout `VI_THEORY_PATH` names.

`swift package --allow-writing-to-package-directory generate` regenerates the checked-in roster, walk sources, font metrics and SVG artwork.

## Build cost

The [Curve](https://danielswift1992.github.io/verification-is-identification/documentation/verificationisidentification/curve/) page measures how the build time grows as the company grows to 12,800 employees, and `swift run ShowcaseTools curve 400 800 1600` reruns the measurement. A recorded measurement on a 14-core Apple M4 Pro, taken while the company was still inside the theory package: a clean build in about eight minutes, a rebuild after a comment-only policy edit in about ten seconds.

| Part | Source |
| --- | --- |
| The company: people, policy, pages | [`Sources/Organization`](Sources/Organization), [`Sources/OrgWalkPages`](Sources/OrgWalkPages) |
| Rendering: pages, tables, SVG | [`Sources/DocumentKit`](Sources/DocumentKit) |
| Drivers and demos | [`Sources/OrgDemo`](Sources/OrgDemo), [`Sources/VectorDemo`](Sources/VectorDemo), [`Sources/DocumentKitDemo`](Sources/DocumentKitDemo), [`Sources/DynamicsDemo`](Sources/DynamicsDemo) |
| Commands that build or read the company | [`Sources/ShowcaseTools`](Sources/ShowcaseTools) |

## License

MIT
