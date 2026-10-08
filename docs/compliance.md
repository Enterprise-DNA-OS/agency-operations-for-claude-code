# Record checks and operating policies

Checked 8 October 2026. This is an agency operations record checker for one business. It does not provide payroll, tax invoices, revenue recognition, legal certification or automatic document verification. Review jurisdiction and retention duties before using it for a real firm.

| Rule | Check | Basis |
|---|---|---|
| NZ-RECORD-01 | Expenses without an evidence reference are flagged. The database refuses retain_until earlier than seven years after the supplied tax year end. | [Inland Revenue record keeping](https://www.ird.govt.nz/managing-my-tax/record-keeping) requires records for at least seven tax years. The operator supplies the applicable year end and keeps the actual supporting documents. |
| NZ-PRIVACY-09 | Missing purposes, missing review dates and overdue client privacy reviews are flagged. | [Privacy Principle 9](https://www.privacy.org.nz/privacy-principles/9/) limits personal-information retention to a lawful purpose. Review dates are an internal control, not a statutory deadline. Never delete tax records because a privacy review is due. |
| POLICY-SCOPE-01 | Active projects without an evidence reference are flagged. Pending changes do not increase agreed budgets. Approval requires written evidence and a different named reviewer from the requester. | Internal agency policy. A text name is not a verified electronic signature or proof of client authority. |
| POLICY-TIME-01 | Unreviewed time is flagged and excluded from the billing worksheet. Only reviewed billable time can be marked billed, with an external invoice reference and evidence. | Internal billing policy. Draft output creates no liability and sends nothing. |

Inland Revenue also requires the appropriate language and approval for offshore record storage. A deployment review must address those duties. A stored evidence reference does not prove the source exists, is complete or remains readable. Back up records and evidence together and test recovery.

Use compliance to list findings, then inspect the related project, expenses and time-review. Update expense-evidence and set-client to record completed checks. Records remain available after closing a project. There is no deletion command or automatic purge.

The database enables row-level security and revokes public access. CLI use is through the database owner. Browser clients must never receive owner credentials. Before shared use, add authenticated access and roles appropriate to the business. The activity log is operator attribution, not tamper-proof audit evidence. Database owners can change it.
