# Organization court contract v0.1

The suite `showcase.organization.questions/0.1` holds the company's plain court to frozen answers. The court reads the company's fragment against the policy this package declares: ranks, departments, workplaces, the four shares and their homes, and the premises of Employee, Person and the cycles. The theory keeps the where and count courts and their own contract (`Contracts/Court/v0.1` in the theory repository). This package owns the policy, so it owns this court and this contract.

| Version | Identifier | What it fixes |
|---|---|---|
| Question | `showcase.organization.policy-premises/1` | Every reference resolves through one dictionary of declarations, and every premise of the declared policy is checked as a table row. |
| Input | `showcase.organization.fragment/1` | Two frozen worlds: a generated company of 48 with four planted lies, and the world gate seeds from `people.csv` and `grants.csv` with one. |
| Response | `showcase.organization.cli-text/1` | Exact exit and stdout/stderr lines; the milliseconds on a verdict line are matched as a number. |

Run it against any implementation that takes the files as arguments:

```
python3 Checks/organization-contract.py --command-json '["/path/to/ShowcaseTools", "judge"]' --implementation-id "<name>"
```

The four lies are the ones `ShowcaseTools judge diff` plants: a cross-department access, a rank spelled to nothing, a site pointing at a department, and a team claiming a foreign rank. The fixtures carry their origins and SHA-256 in `contract.json`, and the driver refuses a changed manifest under this suite name. A semantic change requires a new version.

The reference is `ShowcaseTools judge` at showcase 8b69d9f, where this suite and the court's file `Sources/Court/OrganizationJudge.swift` (SHA-256 e4787f58c8d1fb944e7ddcc1f21d901d2fd782e6459a1646aec674f43beee2c6) were published together. At this version the reference answers 8/8, the theory's copy of the court (kept until gate takes the court from here) answers 8/8, and gate's node port `bin/judge.js` answers 7/8: on a file that is not there it stops with a stack trace and exit 1 where the court says `✗ THE JUDGE cannot read the corpus` and exits 2.

The parse door prints what the reader read in a shape each carrier chooses for its consumer, so it is inspection, not a verdict, and is outside the suite. Passing does not establish general implementation equivalence.
