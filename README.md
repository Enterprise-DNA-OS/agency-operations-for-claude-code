# Agency Operations for Claude Code

Know which project is consuming its fee, which retainer has used its hours and who is overbooked next week. An MIT-licensed database and command set for agency operations managers. Works with Claude Code, Codex, OpenCode or Cursor.

| Do it yourself | We customise it | We run it for you |
|---|---|---|
| Free. Try the demo, configure your rates and import work records. | Your scope rules, retainers, reports, Scoro data and a web front end or different stack if needed. | Installed, connected and operated through Omni by Enterprise DNA. One setup fee, then a retainer. |
| [Quick start](#quick-start) | [Get your version built](https://enterprisedna.co/omni/book/?offer=replace-software&utm_campaign=scoro&utm_source=github&utm_medium=customise) | [Book a call](https://enterprisedna.co/omni/book/?offer=replace-software&utm_campaign=scoro&utm_source=github&utm_medium=managed) |

## The weekly agency meeting

Five jobs: review project contribution, get written scope approvals, check retainer usage, rebalance staff allocations and reconcile approved unbilled work. The fictional Harbour Studio demo includes an over-budget launch, unapproved extra formats, an exhausted retainer, an overloaded designer and missing expense evidence. Demo dates are relative to the first seed run. Reseeding preserves later changes.

## Quick start

Node 20 or later, Windows or Linux:

```bash
git clone https://github.com/Enterprise-DNA-OS/agency-operations-for-claude-code.git
cd agency-operations-for-claude-code
npm install
npm run demo
npm test
npm run view
npm run docs
```

Open the directory in your coding agent and ask for the weekly review. The commands are in .claude/commands/, with AGENTS.md and CLAUDE.md pointing every runtime at the same files. There are 41 CLI commands and 42 slash recipes. See [all arguments and calculations](docs/cli.md).

PGlite stores the demo under .data/db without a server. DATABASE_URL selects Postgres 15 or later with verified TLS. For real imports, select a fresh DATA_DIR, run npm run migrate without seed, and configure clients, staff rates and projects first. Do not put customer records into the demo database. The local database is single-process. A shared deployment needs authenticated operators, restricted database access and tested backups. Text actor names are attribution, not authentication. All data belongs to one business; there is no tenant switch.

## What the numbers mean

- Agreed fee and hour budget include approved scope changes only. Pending requests stay separate.
- Forecast cost adds recorded labour, expenses and each open task's remaining minutes at its assigned person's current cost rate. Forecast contribution excludes overhead and tax. It is not recognised profit or revenue.
- Recorded time stores cost and sell rates at entry time. Changing a person's rate does not rewrite earlier work.
- Unbilled effort includes reviewed, billable entries without an external invoice reference. On fixed-fee and retainer projects, this is effort value, not an amount payable.
- Each retainer period is a separate project. Entries outside its dates are refused. Unused allowance does not roll forward automatically.
- Weekly capacity subtracts recorded leave from each person's capacity, then subtracts allocations. Negative free minutes identify overbooking.
- Currency stays on each project. Mixed-currency staff assignments are refused. Reports never sum different currencies.

## Ten questions beyond a fixed report

Scoro already has detailed reporting, an assistant and an agent connection. These questions demonstrate this build's working queries, not an unsupported claim that Scoro cannot answer them.

1. Which projects combine late tasks and unapproved scope? `attention`
2. What contribution remains after recorded costs and estimated remaining work? `margin-review`
3. How much requested scope is still outside the agreed fee? `scope-review`
4. Which budgets are exceeded by completed and remaining hours together? `budget-review`
5. Which retainer periods have used more than their allowance? `retainer-review`
6. Who is overbooked after their recorded leave is deducted? `capacity-review`
7. What reviewed work has no accounting invoice reference? `unbilled`
8. Which expenses have no source-document reference? `compliance`
9. Which active projects have had no recorded work for fourteen days? `attention`
10. Who changed a project's scope or delivery records, and what was logged? `project`

## Your first hour: ten things to ask for

1. Put our name, logo and colours on the paperwork.
2. Show the decisions holding up delivery this week.
3. Compare recorded cost with the cost still to come.
4. Separate pending scope from the client's agreed fee.
5. Show remaining retainer hours by period.
6. Rebalance next week's designer allocations after leave.
7. Draft a scope approval request for an owner to review.
8. Test our work-report export before importing it.
9. Add our service-line field through a new migration with /customise.
10. Add a weekly client contribution snapshot with /new-view.

## Documents and read-only views

brand.json controls the business name, logo and colours. npm run docs renders project status sheets, scope approval requests, retainer statements and billing worksheets as printable HTML. npm run view renders the weekly meeting and retainer snapshots. Draft correspondence stays in drafts/. No command sends, charges a client or changes accounting records. Protect the output as private business data.

[Compliance checks](docs/compliance.md) cover missing expense evidence, privacy-review records and internal scope/time controls. They do not certify the business or replace accounting advice. [Why no front end](docs/why-no-front-end.md) explains the role of browser reports and what an interactive workspace adds.

## Move from Scoro

[The replacement guide](docs/replace-scoro.md) covers the supported CSV work-report import, column mapping, stable IDs, rate review and reconciliation. One import command loads completed work into configured projects. It does not silently recreate the whole Scoro account. Bring budgets, tasks, invoices, attachments and history outside that report through a separately agreed migration.

## Verification

npm test creates a temporary database and checks all 41 commands, seed idempotence, scope approvals, contribution calculations, historical rates, retainer dates, capacity after leave, billing controls, expense retention, repeat imports, whole-file rollback, CSV parsing, escaped HTML, drafts and exports. CI runs the same suite on Windows and Linux and against Postgres. TEST_DATABASE_URL accepts only an empty disposable database. See [research and selection](docs/research.md) for source evidence and its limits.

MIT licence. Not affiliated with Scoro or Anthropic. Hosting and agent usage have separate costs. [Book 30 minutes with Sam](https://enterprisedna.co/omni/book/?offer=replace-software&utm_campaign=scoro&utm_source=github&utm_medium=readme).
