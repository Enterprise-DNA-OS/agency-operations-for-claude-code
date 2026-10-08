---
description: Add expense for the agency operations desk
---

# Add expense

Amounts are net in project currency. Specify the tax year end applicable to this expense. The earliest retention date is seven years after that tax year end. Retention is not an automated deletion instruction.

```bash
node scripts/agency.mjs add-expense --project=<project> --reference=<reference> --description=<description> --amount=<amount> --date=<date> --year-end=<year-end> --retain-until=<retain-until> --evidence=<evidence> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
