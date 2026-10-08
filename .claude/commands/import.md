---
description: Import for the agency operations desk
---

# Import

Read docs/replace-scoro.md. Confirm the full work report contains completed entries only. Inspect actual headers and maintain a mapping with stable source IDs. Run with --dry-run before importing. Reconcile counts and minutes, review rates and approve time. A changed source row stops the whole import.

```bash
node scripts/agency.mjs import scoro --file=<file> --map=<map> --source=<source> --actor=<actor> --dry-run --duration-unit=<duration-unit> --date-format=<date-format>
```

Substitute the operator's values for placeholders. Add --json for structured output. If a match is ambiguous, show the candidates and get an exact choice. Never invent records or send anything. See docs/cli.md for optional flags and rules.
