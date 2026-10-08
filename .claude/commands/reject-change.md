---
description: Reject change for the agency operations desk
---

# Reject change

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs reject-change --project=<project> --change=<change> --evidence=<evidence> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
