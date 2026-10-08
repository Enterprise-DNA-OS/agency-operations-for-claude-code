---
description: Draft chase for the agency operations desk
---

# Draft chase

Read the project and scope-review first. Draft goes to drafts/. Review the recipient and wording with the operator. Nothing sends.

```bash
node scripts/agency.mjs draft-chase --project=<project>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
