---
description: Add task for the agency operations desk
---

# Add task

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs add-task --project=<project> --name=<name> --person=<person> --due=<due> --remaining-minutes=<remaining-minutes> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
