---
description: Approve change for the agency operations desk
---

# Approve change

Read the current project and scope-review first. Require written client agreement and a named internal reviewer other than the requester. An actor name is a record, not authenticated identity.

```bash
node scripts/agency.mjs approve-change --project=<project> --change=<change> --evidence=<evidence> --actor=<actor>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
