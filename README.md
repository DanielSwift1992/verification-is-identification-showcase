# Verification Is Identification · showcase

This package is the worked application of [verification-is-identification](https://github.com/DanielSwift1992/verification-is-identification): a 204-person company written as Swift types, with an access policy and an intranet website. It depends on the theory package at a pinned revision and adds no claim to it. The theory states the law, the papers and the canon of verdicts. This package declares a world and checks it against them.

## The company

Declarations describe the 204 people, their documents and their access requests. A policy rule is a conditional conformance, and the compiler checks the declared requests against it.

[Open the playground](https://danielswift1992.github.io/typed-playground/) to edit declarations and see the page they describe. **Plant a lie** changes a declaration for its checker to read. The At scale tab judges a 12,800-person file. [Its checks](https://github.com/DanielSwift1992/typed-playground#the-checks) document the supported subset of Swift.

The company is a declared world. The checked access assertions are about its declarations. A running organisation would need its own source relation and operations to enforce access.

## The website and navigation

The [company site](https://danielswift1992.github.io/verification-is-identification/documentation/organization/) presents dashboards, reports and personal cards. Within their declared directories, the guided walks reach any page in four choices and any of the people in eight. The reader chooses each branch. [DocumentKit](https://danielswift1992.github.io/verification-is-identification/documentation/documentkit/) renders the pages and the SVG from types.

Four of the employee cards have a login keypad. A key is a link to a declared state. The 6561 possible input sequences share a small state graph, because every wrong digit leads to the same dead state. The compiler checks the supplied secret type against the page's declared secret. The page prints the password, and the unlocked address can be opened directly. This is a static navigation demonstration.

## Build and check

The theory package is the sibling checkout `../verification-is-identification`. `VI_THEORY_PATH` names another one.

`swift build` checks the whole package. `swift test` runs the company's count tests and prints "Executed 15 tests". The [Curve](https://danielswift1992.github.io/verification-is-identification/documentation/verificationisidentification/curve/) page reports measurements as the company grows to 12,800 employees, and `swift run ShowcaseTools curve 400 800 1600` reruns them.

[`check.sh`](check.sh) lists this package's checks: the build and tests, the dynamics rules, the committed artifacts against the types that produce them, the second judge against the compiler under planted lies, and the numbers on this page. `swift package --allow-writing-to-package-directory generate` regenerates the checked-in roster, walk sources, font metrics and SVG artwork.

| Part | Source |
| --- | --- |
| The company: people, policy, pages | [`Sources/Organization`](Sources/Organization), [`Sources/OrgWalkPages`](Sources/OrgWalkPages) |
| Rendering: pages, tables, SVG | [`Sources/DocumentKit`](Sources/DocumentKit) |
| Drivers and demos | [`Sources/OrgDemo`](Sources/OrgDemo), [`Sources/VectorDemo`](Sources/VectorDemo), [`Sources/DocumentKitDemo`](Sources/DocumentKitDemo), [`Sources/DynamicsDemo`](Sources/DynamicsDemo) |
| Commands that build or read the company | [`Sources/ShowcaseTools`](Sources/ShowcaseTools) |

## License

MIT
