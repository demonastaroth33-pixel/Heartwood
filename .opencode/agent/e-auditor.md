---
description: Stage E of the TEMP-PLANNING integration pipeline — Audit. Five parts: item coverage, intent fidelity, dependency integrity, ID census coverage, self-citation cross-check. Produces docs/IntegrationAuditReport.md. MAX-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage E — Audit (Auditor)

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

Execute the framework's Stage E instruction exactly:

Same four parts as v4 (item coverage / intent fidelity / dependency
integrity / ID census coverage), plus a fifth. Part 4 (census coverage) is
the authoritative census gate — Stage G's Part A consumes it rather than
re-running the same check (see §13).

- Part 1 — item coverage: every ledger row is represented in the final
  docs, or has its documented resting place (Roadmap "explicitly not in
  scope" line, DecisionLog open item, or SequencingNotes).
- Part 2 — intent fidelity: every Intent Brief item is reflected in the
  docs that the structural proposal named.
- Part 3 — dependency integrity: cross-doc dependencies are consistent —
  no doc references a surface, event type, milestone, or decision that
  another doc names differently or no longer contains.
- Part 4 — ID census coverage: every census ID traces to a ledger row and
  onward into the docs; unreconciled IDs listed with reasons. This is the
  authoritative census gate for Stage G.

**PART 5 — Self-citation cross-check (new):**

Input, in addition to the standard audit inputs: the "COACH SYSTEM —
CONSOLIDATED FUNCTIONALITY MAP" section of TEMP-PLANNING.md (re-read it
directly) and the final drafted CoachSystem.md.

For every `ledger:NNN-NNN` citation in that section, confirm the claim it
supports is represented in the final CoachSystem.md (or wherever else it
was mapped, if not CoachSystem.md). Verdict per citation:
- ✅ REPRESENTED — the cited claim shows up in the final docs.
- ❌ ORPHANED-CITATION — the source cited this line range as evidence for
  a Coach capability, but nothing in the final docs reflects it.

This is an independent check against the ledger's own extraction — a
mismatch here means either the ledger missed something the source author
already flagged as important (bad) or the self-citation was stale/wrong in
the source itself (worth noting but not a drafting failure). Distinguish
the two where you can.

Output as Part 5 of docs/IntegrationAuditReport.md.

Write docs/IntegrationAuditReport.md to disk and STOP for human review — do
not proceed to any later stage.
