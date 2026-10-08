# CLI reference

Run `node scripts/agency.mjs <command> --flag=value`. Quote arguments containing spaces. Every command supports `--json`. Omitted flags are errors unless noted below. Unknown flags are refused. IDs can be shortened and names match without case. Ambiguous names list candidates and exit 1.

Dates use YYYY-MM-DD. Weeks start Monday. Amounts are net, in project currency, with up to two decimals. Minutes are whole numbers. Booleans are true or false. Supported currencies: NZD, AUD, USD, GBP, EUR, CAD.

## help

```bash
node scripts/agency.mjs help
```

Read the relevant records first. Use only names and values supplied by the operator.

## clients

```bash
node scripts/agency.mjs clients
```

Read the relevant records first. Use only names and values supplied by the operator.

## people

```bash
node scripts/agency.mjs people
```

Read the relevant records first. Use only names and values supplied by the operator.

## projects

```bash
node scripts/agency.mjs projects
```

Read the relevant records first. Use only names and values supplied by the operator.

## margin-review

```bash
node scripts/agency.mjs margin-review
```

Agreed fee less recorded labour, expenses and the current estimate for remaining work. Keep currencies separate. This is contribution before overhead and tax, not recognised profit.

## budget-review

```bash
node scripts/agency.mjs budget-review
```

Hours include approved scope changes only. Compare recorded plus remaining effort with the agreed budget.

## retainer-review

```bash
node scripts/agency.mjs retainer-review
```

Each retainer period is its own project. Overage is used minutes above the allowance, not an automatic extra charge. Do not roll unused hours into another period without an agreed rule.

## scope-review

```bash
node scripts/agency.mjs scope-review
```

Read the relevant records first. Use only names and values supplied by the operator.

## time-review

```bash
node scripts/agency.mjs time-review
```

Read the relevant records first. Use only names and values supplied by the operator.

## unbilled

```bash
node scripts/agency.mjs unbilled
```

Only approved billable time without an external invoice reference. The effort value does not determine invoices for fixed-fee or retainer engagements.

## tasks-due

```bash
node scripts/agency.mjs tasks-due
```

Read the relevant records first. Use only names and values supplied by the operator.

## capacity-review

```bash
node scripts/agency.mjs capacity-review
```

Read weekly planned allocations after leave. Negative free minutes identify overbooking. Allocation changes replace the person/project/week amount.

## attention

```bash
node scripts/agency.mjs attention
```

Read the relevant records first. Use only names and values supplied by the operator.

## compliance

```bash
node scripts/agency.mjs compliance
```

Read docs/compliance.md. Report findings as evidence gaps, not a certification or legal conclusion. Internal review dates and scope gates are business policies.

## activity

```bash
node scripts/agency.mjs activity
```

Read the relevant records first. Use only names and values supplied by the operator.

## expenses

```bash
node scripts/agency.mjs expenses
```

Read the relevant records first. Use only names and values supplied by the operator.

## project

```bash
node scripts/agency.mjs project --project=<project>
```

Read the relevant records first. Use only names and values supplied by the operator.

## weekly-review

```bash
node scripts/agency.mjs weekly-review
```

Run attention, margin-review and capacity-review. Name the scope decisions, threatened margins and overloaded people. Then check retainer-review and unbilled for billing discussion.

## add-client

```bash
node scripts/agency.mjs add-client --name=<name> --contact=<contact> --purpose=<purpose> --review=<review>
```

Read the relevant records first. Use only names and values supplied by the operator.

## set-client

```bash
node scripts/agency.mjs set-client --client=<client> --contact=<contact> --purpose=<purpose> --review=<review>
```

Read the relevant records first. Use only names and values supplied by the operator.

## add-person

```bash
node scripts/agency.mjs add-person --name=<name> --currency=<currency> --cost-rate=<cost-rate> --sell-rate=<sell-rate> --weekly-minutes=<weekly-minutes>
```

Read the relevant records first. Use only names and values supplied by the operator.

## add-project

```bash
node scripts/agency.mjs add-project --code=<code> --name=<name> --client=<client> --owner=<owner> --currency=<currency> --kind=<kind> --start=<start> --due=<due> --fee=<fee> --budget-minutes=<budget-minutes> --evidence=<evidence> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## set-project

```bash
node scripts/agency.mjs set-project --project=<project> --owner=<owner> --due=<due> --evidence=<evidence> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## add-task

```bash
node scripts/agency.mjs add-task --project=<project> --name=<name> --person=<person> --due=<due> --remaining-minutes=<remaining-minutes> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## update-task

```bash
node scripts/agency.mjs update-task --project=<project> --task=<task> --remaining-minutes=<remaining-minutes> --status=<status> --due=<due> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## log-time

```bash
node scripts/agency.mjs log-time --project=<project> --person=<person> --date=<date> --minutes=<minutes> --billable=<billable> --description=<description> --actor=<actor>
```

Read the project and person first. Completed work only. Use whole minutes, true or false for billable, and an ISO date. Retainer entries must fall within the period. Rates are copied from the person at entry time.

## approve-time

```bash
node scripts/agency.mjs approve-time --project=<project> --entry=<entry> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## mark-billed

```bash
node scripts/agency.mjs mark-billed --project=<project> --entry=<entry> --reference=<reference> --evidence=<evidence> --actor=<actor>
```

Read the approved entry and accounting invoice evidence. Mark only work covered by an existing external invoice. Never infer billing from a draft worksheet.

## add-expense

```bash
node scripts/agency.mjs add-expense --project=<project> --reference=<reference> --description=<description> --amount=<amount> --date=<date> --year-end=<year-end> --retain-until=<retain-until> --evidence=<evidence> --actor=<actor>
```

Amounts are net in project currency. Specify the tax year end applicable to this expense. The earliest retention date is seven years after that tax year end. Retention is not an automated deletion instruction.

## expense-evidence

```bash
node scripts/agency.mjs expense-evidence --project=<project> --expense=<expense> --evidence=<evidence> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## request-change

```bash
node scripts/agency.mjs request-change --project=<project> --reference=<reference> --description=<description> --fee=<fee> --minutes=<minutes> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## approve-change

```bash
node scripts/agency.mjs approve-change --project=<project> --change=<change> --evidence=<evidence> --actor=<actor>
```

Read the current project and scope-review first. Require written client agreement and a named internal reviewer other than the requester. An actor name is a record, not authenticated identity.

## reject-change

```bash
node scripts/agency.mjs reject-change --project=<project> --change=<change> --evidence=<evidence> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## allocate

```bash
node scripts/agency.mjs allocate --project=<project> --person=<person> --week=<week> --minutes=<minutes> --actor=<actor>
```

Read the relevant records first. Use only names and values supplied by the operator.

## leave

```bash
node scripts/agency.mjs leave --person=<person> --week=<week> --minutes=<minutes>
```

Read the relevant records first. Use only names and values supplied by the operator.

## log

```bash
node scripts/agency.mjs log --project=<project> --actor=<actor> --note=<note>
```

Read the project history first. Record the named operator and their note accurately.

## close-project

```bash
node scripts/agency.mjs close-project --project=<project> --actor=<actor>
```

Read the project, open tasks, scope-review and unbilled work first. Closure refuses unresolved tasks, changes or time. No record is deleted.

## draft-chase

```bash
node scripts/agency.mjs draft-chase --project=<project>
```

Read the project and scope-review first. Draft goes to drafts/. Review the recipient and wording with the operator. Nothing sends.

## draft-billing

```bash
node scripts/agency.mjs draft-billing --project=<project>
```

Read the project and unbilled work first. Draft goes to drafts/. It is a worksheet, not an invoice, and does not mark time billed.

## import

```bash
node scripts/agency.mjs import scoro --file=<file> --map=<map> --source=<source> --actor=<actor> --dry-run --duration-unit=<duration-unit> --date-format=<date-format>
```

Read docs/replace-scoro.md. Confirm the full work report contains completed entries only. Inspect actual headers and maintain a mapping with stable source IDs. Run with --dry-run before importing. Reconcile counts and minutes, review rates and approve time. A changed source row stops the whole import.

## export

```bash
node scripts/agency.mjs export --out=<out>
```

Read the relevant records first. Use only names and values supplied by the operator.

## Optional values and formats

add-client contact is optional. add-project evidence is optional and a missing value is reported by compliance. update-task due defaults to the existing date. add-expense evidence is optional and retain-until defaults to the earliest allowed date. Import dry-run is optional. Import duration-unit defaults to H:MM, or explicitly choose minutes or hours. Import date-format defaults to ISO, or choose dmy or mdy for slash-separated dates.

The import source is a stable account identifier you choose, not a secret. Keep it unchanged across reimports. The mapping keys are source_id, project, person, date, duration, description and billable. Values are exact column names. Existing project codes/names and person names must match.

Projects use kind fixed, time or retainer. Each retainer period has a separate project and agreed fee. Task status is open or done. Done tasks must have zero remaining minutes. Scope can be requested, approved or rejected. Agreed fee and budget change only through approved scope.

No automated time capture, timer, calendar sync, quote acceptance, tax calculation, revenue recognition, payment collection or invoice sending is included. Export writes a new full JSON snapshot and refuses to overwrite an existing file. Protect exports as private business data.
