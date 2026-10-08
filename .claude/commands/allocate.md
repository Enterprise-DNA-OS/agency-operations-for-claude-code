---
description: Allocate for the agency operations desk
---

# Allocate

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs allocate --project=<project> --person=<person> --week=<week> --minutes=<minutes> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
