---
description: Update task for the agency operations desk
---

# Update task

Read the relevant records first. Use only names and values supplied by the operator.

```bash
node scripts/agency.mjs update-task --project=<project> --task=<task> --remaining-minutes=<remaining-minutes> --status=<status> --due=<due> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
