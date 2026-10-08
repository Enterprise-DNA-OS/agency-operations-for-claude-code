---
description: Mark billed for the agency operations desk
---

# Mark billed

Read the approved entry and accounting invoice evidence. Mark only work covered by an existing external invoice. Never infer billing from a draft worksheet.

```bash
node scripts/agency.mjs mark-billed --project=<project> --entry=<entry> --reference=<reference> --evidence=<evidence> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
