---
description: Stage G of the TEMP-PLANNING integration pipeline — ID-Census Reconciliation + No-Holes Gate. Parts A (consume E Part 4), B (residual re-read), C (archive & close). MAX-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage G — ID-Census Reconciliation + No-Holes Gate

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it. If re-reading the source plus the docs exceeds your context
window, process in contiguous chunks and append findings incrementally.

Execute the framework's Stage G instruction exactly:

**Part A (census gate):** consume E's Part 4 — verify it is present,
complete, and its unreconciled list is empty. Do NOT re-run the census
coverage check from scratch (same dedupe principle as Part 5 vs G); only
confirm E's output and clear the gate.

**Part B (residual re-read):** unchanged mechanism from v4 (§13), with the
un-numbered-prose scan now explicitly including: Periods, Milestone Review,
the Coach Consolidated Map (cross-checked against Part 5 above rather than
re-scanned independently — avoid doing the same check twice), Calendar UI,
Settings tab, and both "Remaining open items" / "Future ideas" closing
sections.

**Part C (archive & close):** after A and B clear, and with the user's
final approval:

- `TEMP-PLANNING.md` moves to `audits/` with a date suffix (precedent:
  `audits/audit-2026-08-14.md`) — the repo never keeps a second source of
  truth at root.
- The pipeline artifacts (`IntegrationIDCensus.md`, `IntegrationLedger.md`,
  `IntegrationIntentBrief.md`, `IntegrationSequencingNotes.md`,
  `StructuralImpactProposal.md`, `IntegrationAuditReport.md`) move to
  `audits/` alongside it, date-suffixed as a set.
- `docs/README.md`'s doc map is updated: retired entries removed, one line
  pointing at the archived integration set for provenance.
- Final commit covers the archive move (see §14 for the full end-state).

**Final sign-off condition:** Stage G is not complete until — Part A
(census) empty, Part B (residual) empty, Part 5 of the audit report has
zero ❌ ORPHANED-CITATION entries that trace to a genuine ledger miss rather
than a stale source citation, C2's sampled rows all verify clean, AND
Part C's archive move is committed.

Part C happens only with the user's explicit final approval — if it has
not been given, do Parts A and B, report the gate verdict, and stop.
