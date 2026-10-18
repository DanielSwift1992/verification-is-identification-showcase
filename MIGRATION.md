# Migration slice from verification-is-identification

Source of the map: `Package.swift` and `check.sh` of the theory package at db20e638 (18 October 2026).

## Targets that move

| Target | Depends on | Notes |
|---|---|---|
| DocumentKit | VerificationIsIdentification, Alphabet; plugin LawCheck | renderer, walks, text metrics |
| Organization | VerificationIsIdentification, DocumentKit, Alphabet; plugins ProseGen, CensusGen, LawCheck | 204 people, policy, site |
| OrgWalkPages | VerificationIsIdentification, DocumentKit, Organization | guided walks |
| OrgDemo | Organization, DocumentKit, OrgWalkPages | renders the site |
| VectorDemo | VerificationIsIdentification, DocumentKit, Organization | architecture diagram, figures |
| DocumentKitDemo | VerificationIsIdentification, DocumentKit, Examples | depends on Examples: keep the dependency on the theory package |
| DynamicsDemo | VerificationIsIdentification, DocumentKit, Examples | law `rules` (Tools lint on Rules.swift) moves with it |
| GenerateCommand (plugin) | Tools, VectorDemo | regenerates roster, walks, fonts, SVG |
| OrganizationTests | Organization | part of the 19 tests |

## Code that moves with them

- Tools: `GenerateOrg.swift`, `GenerateFont.swift`, `Curve.swift`, the showcase parts of `Site.swift`, `Census.swift` rows for engine and company, `ReadmeCheck.swift` expectations for people, keypad cards, roster and site walks, curve employees.
- Court: the company reader tables in `Judge.swift` and the differential check `JudgeDiff.swift` (they read `Sources/Organization/System/GeneratedTeam.swift` and `Filtering.swift` by path and build the Organization target).
- Laws of `check.sh`: `artifacts`, `judge`, the showcase rows of `census`, the showcase expectations of `readme`, the Organization tests inside `build`.
- Documentation: the Organization and DocumentKit DocC catalogs and their part of `docs.yml`; the theory site keeps VerificationIsIdentification, Examples, GrammarLexicon and Alphabet.

## What stays in the theory package

VerificationIsIdentification, Alphabet, GrammarLexicon, Court (where and count courts, canon of verdicts), Examples, ExamplesTests, Tools (lint, grammar, voice, quotes, papers, tree-sort, the theory part of readme), plugins LawCheck, ProseGen, CensusGen, TreeSortCommand, Checks, the papers.

## Order

1. Measure the check profiles separately before moving anything (theory, showcase, judge conformance).
2. Create this package's `Package.swift` with a pinned dependency on the theory package; keep a local path override for development.
3. Move the slice in one change, with its tests, generation command, tools, laws and documentation; nothing else in that change.
4. In the theory package: drop the showcase expectations from the readme law, reduce `docs.yml` to four targets, point the README's demonstration section here.
5. CI and Pages for this package; both packages green on clean machines.
