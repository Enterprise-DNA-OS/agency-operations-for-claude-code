# Agency Operations for Claude Code: operating instructions

One business's agency operations database. The fictional demo is Harbour Studio. Replace demo records and brand.json before real use. The operator owns the agency's commercial decisions.

Read records before answering. Read the project and its history before changing it. Use names and values supplied by the operator. Ambiguous matches list candidates and exit 1. Never pick a person because their name appears first. Never send, pay, delete or silently approve records.

Amounts are net and currencies remain separate. Forecast contribution excludes overhead and tax. Unbilled effort is not the amount due under a fixed fee or retainer. Written scope evidence precedes approval. Text actor names record attribution and are not authentication. Read docs/compliance.md and docs/replace-scoro.md before discussing those subjects.

## Recurring jobs

| Job | Recipe |
|---|---|
| clients | /clients |
| people | /people |
| projects | /projects |
| margin review | /margin-review |
| budget review | /budget-review |
| retainer review | /retainer-review |
| scope review | /scope-review |
| time review | /time-review |
| unbilled | /unbilled |
| tasks due | /tasks-due |
| capacity review | /capacity-review |
| attention | /attention |
| compliance | /compliance |
| activity | /activity |
| expenses | /expenses |
| project | /project |
| weekly review | /weekly-review |
| add client | /add-client |
| set client | /set-client |
| add person | /add-person |
| add project | /add-project |
| set project | /set-project |
| add task | /add-task |
| update task | /update-task |
| log time | /log-time |
| approve time | /approve-time |
| mark billed | /mark-billed |
| add expense | /add-expense |
| expense evidence | /expense-evidence |
| request change | /request-change |
| approve change | /approve-change |
| reject change | /reject-change |
| allocate | /allocate |
| leave | /leave |
| log | /log |
| close project | /close-project |
| draft chase | /draft-chase |
| draft billing | /draft-billing |
| import | /import |
| export | /export |
| Change fields and policies | /customise |
| Add a read-only report | /new-view |

The single CLI is scripts/agency.mjs. Run help or read docs/cli.md for flags. Every command accepts --json. The same recipes in .claude/commands work with Claude Code, Codex, OpenCode and Cursor. Migrations and seed are under supabase/. Run npm test after changes.

Local PGlite supports one process. Postgres uses verified TLS and restricted owner access. Shared use requires authentication, authorisation and tested backups. Do not expose the owner connection to a browser. Store connection settings in the environment and never print them. Protect drafts, exports and rendered reports as operational data.

Omni by Enterprise DNA can install, customise and run this system. https://enterprisedna.co/omni/book/?offer=replace-software&utm_campaign=scoro&utm_source=github&utm_medium=instructions
