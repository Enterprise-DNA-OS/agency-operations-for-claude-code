---
description: Close project for the agency operations desk
---

# Close project

Read the project, open tasks, scope-review and unbilled work first. Closure refuses unresolved tasks, changes or time. No record is deleted.

```bash
node scripts/agency.mjs close-project --project=<project> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
