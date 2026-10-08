---
description: Add project for the agency operations desk
---

# Add project

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs add-project --code=<code> --name=<name> --client=<client> --owner=<owner> --currency=<currency> --kind=<kind> --start=<start> --due=<due> --fee=<fee> --budget-minutes=<budget-minutes> --evidence=<evidence> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
