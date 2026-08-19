---
description: Stage C2 of the TEMP-PLANNING integration pipeline — optional fresh-session cross-auditor. Samples 10-20 ledger rows (verbatim-critical, REMOVES-existing, E-flagged) and verifies them against final docs. HIGH-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage C2 — Fresh-session cross-auditor (optional)

Framework effort assignment: **HIGH** (not in the §1 table — C2 is
primarily human; this agent is the optional fresh-session cross-auditor
variant from §11). One stage = one fresh session — you share zero context
with the drafting sessions by design.

Context: E is a self-audit — the same model that drafted validates its own
output, which structurally misses systematic errors. Your job is the
model-independent check (Stage C2):

- Sample 10–20 ledger rows from docs/IntegrationLedger.md. Prioritize:
  verbatim-critical rows, REMOVES-existing rows, and any rows E flagged as
  marginal in docs/IntegrationAuditReport.md.
- For each sampled row, verify it is faithfully represented in the final
  docs via `git diff`/read — the claim in the ledger row must be findable
  in the target doc, with numbers/thresholds/names exact.
- Per-row verdict: VERIFIED-CLEAN or MISMATCH (with the discrepancy:
  missing, altered, or contradicting content; quote both sides).
- Do not fix the docs yourself — report the mismatches; the human routes
  them back to the Drafter session or fixes them directly.
- Log your outcome in docs/IntegrationAuditReport.md as Part 6.

Report the sampled rows, verdicts, and mismatches. Do not edit any doc
other than appending your Part 6 to the audit report.
