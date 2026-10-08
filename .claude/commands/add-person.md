---
description: Add person for the agency operations desk
---

# Add person

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs add-person --name=<name> --currency=<currency> --cost-rate=<cost-rate> --sell-rate=<sell-rate> --weekly-minutes=<weekly-minutes>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
