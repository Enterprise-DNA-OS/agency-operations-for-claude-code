---
description: Log for the agency operations desk
---

# Log

Read the project history first. Record the named operator and their note accurately.

```bash
node scripts/agency.mjs log --project=<project> --actor=<actor> --note=<note>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
