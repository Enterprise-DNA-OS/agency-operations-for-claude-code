# Move completed work from Scoro

Scoro documents CSV export from Reports > Work > Detailed report, with full-export and displayed-column options. Export completed work for the agreed date range and users. Confirm permissions, filters and the number of records before leaving Scoro. Source checked 8 October 2026: [Scoro work reports](https://support.scoro.com/hc/en-us/articles/12695853690893-Work-reports).

## Configure and map once

1. Use a fresh database and run npm run migrate, without demo seed.
2. Add clients, people and projects. Set each person's cost/sell rates in the project's currency. Split retainer projects into the actual contracted periods.
3. Inspect your CSV's headers. Copy examples/scoro-map.json into your private imports directory and map its seven keys to your actual columns. The example is an illustrative mapping, not a claim about Scoro's exact default headers.
4. source_id must identify an individual exported work entry, not merely the parent task. Verify that it is unique and stable. If your export omits such an identifier, preserve a separate stable identifier column during preparation. Never regenerate IDs on each export or use changing row positions. Keep an original export for reconciliation.
5. Map project and person to the exact configured code/name. Map date, duration, description and billable. Include completed entries only. Billable accepts true/false or yes/no. Review this mapping against your actual export.

## The import

```bash
node scripts/agency.mjs import scoro --file=imports/work.csv --map=imports/map.json --source=your-scoro-site --actor="Operations manager" --dry-run --json
node scripts/agency.mjs import scoro --file=imports/work.csv --map=imports/map.json --source=your-scoro-site --actor="Operations manager" --json
```

Default dates are ISO and durations are H:MM. For exports using day/month/year, add --date-format=dmy. For decimal hours or whole minutes, use --duration-unit=hours or --duration-unit=minutes. The entire file rolls back on a bad row. A test run also rolls everything back. The source value identifies your account and must stay constant.

An unchanged repeat is skipped. A changed record with the same source ID stops the import for reconciliation. Reordering does not create duplicates. Duplicate IDs in one file are refused. Import does not change existing rates or evidence.

## What arrives and what needs separate work

Completed work date, duration, description, billable flag and links to configured projects and people arrive. Local cost and sell rates are copied at import time. Historical vendor rates, billed status, approvals, tasks, future bookings, contracts, attachments, invoices, receipts and custom fields do not arrive. Importing history with changing rates needs a reviewed rate mapping before final loading. All new time starts unapproved.

Compare counts and minutes by person, project and date with the original export. Review the financial totals using your historical rates. Approve correct entries and mark only those already covered by real accounting invoices as billed, with their evidence reference. Keep Scoro available until current scope, tasks, retainer periods and accounting history have been reconciled. The free importer is one command after configuration and mapping; a complete move depends on the records your business needs.

The included examples use fictional demo records. Test against the demo with --file=examples/scoro-work.csv --map=examples/scoro-map.json and an explicit source value. Never import customer work into that demo.
