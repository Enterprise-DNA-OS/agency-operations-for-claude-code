---
description: Log time for the agency operations desk
---

# Log time

Read the project and person first. Completed work only. Use whole minutes, true or false for billable, and an ISO date. Retainer entries must fall within the period. Rates are copied from the person at entry time.

```bash
node scripts/agency.mjs log-time --project=<project> --person=<person> --date=<date> --minutes=<minutes> --billable=<billable> --description=<description> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
