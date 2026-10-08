---
description: Draft billing for the agency operations desk
---

# Draft billing

Read the project and unbilled work first. Draft goes to drafts/. It is a worksheet, not an invoice, and does not mark time billed.

```bash
node scripts/agency.mjs draft-billing --project=<project>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
