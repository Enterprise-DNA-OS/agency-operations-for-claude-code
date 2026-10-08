---
description: Change the agency system to fit the business
---

# Customise

Read CLAUDE.md, the migration, affected commands and tests. Take a database backup with export before changing records. Confirm the operator's field, terminology or policy, including effects on existing records. Write a new numbered SQL migration in supabase/migrations/, never change an applied migration. Apply with npm run migrate to a temporary database, test the old and new workflows, then apply to the selected business database. Update cli.json, CLI, documents, views and affected command recipes. Run npm test. Never put authentication or secrets in a text actor field.
