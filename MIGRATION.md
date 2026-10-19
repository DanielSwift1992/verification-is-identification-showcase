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

## The move, 19 October 2026 (T-0015, step 3)

The slice of the theory at `6244eb87` is copied here unchanged: the targets above, the plugins GenerateCommand, ProseGen and CensusGen, OrganizationTests, and `Checks/Publication.swift`. The theory side prepared three things first: `press --rules`, the `Tools` and `LawCheck` products, and `census --target` and `voice --scope`.

What changed in the move:

- `ShowcaseTools` carries the commands that build or read the company: prose, generate (org, font), curve, site, `judge diff` and `judge chain` (JudgeDiff, moved out of Court), and the company half of the readme law. CodeForm and SourceFile move with GenerateOrg, their only user.
- The plain judge, `Press` and the where courts stay in the theory: gate compiles every `Sources/Court/*.swift` of its pin, and `Press.Term` is the term language of the where judge.
- CensusGen counts the theory's targets through its checkout and this package's targets in place, with `census --target`.
- `Package.swift` reads `VI_THEORY_PATH`, defaulting to the sibling checkout; ShowcaseTools sets the absolute path for the disposable worktrees of `judge diff` and `curve`.
- `Checks/publication.sh` runs the seven `PUBLICATION_*` refusals with the theory's protocol: positive fixture first, exit 1, the rejected type named, no crash or missing module.

Closed since: the `voice` scopes for DocumentKit and these catalogs, the `census` law, the documentation site and its Pages, and the grammar mirror, which reads the theory's lexicon, alphabet and seed from `VI_THEORY_PATH` since the theory's c31f6880 and judges this package's files by the theory's scope table. Open when this was written, and done since, was the theory's own step: removing the moved targets, its README pointer and docs.yml on four targets, published only after this package has its own remote and Pages.

Two artifacts of the theory package are produced by code of this one: the curve chart `Resources/curve.svg` of the theory's catalog (VectorDemo `chart`) and `Sources/Examples/Examples.docc/CoveredVisibleClaim.md` (DocumentKitDemo `claim --write`). The Curve page is part of the theory's Topics tree, so both stay there. This package writes them into the theory checkout (`VI_THEORY_PATH`) and its artifacts law diffs them there. The theory alone cannot regenerate them: the build dependency runs the other way from the code dependency, a debt of the contract between the packages (Desk task T-0016) until the chart and the claim render without DocumentKit.
