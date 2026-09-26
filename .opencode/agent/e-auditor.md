---
description: Stage E of the TEMP-PLANNING integration pipeline — Audit. Five parts: item coverage, intent fidelity, dependency integrity, ID census coverage, self-citation cross-check. Produces docs/IntegrationAuditReport.md. MAX-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage E — Audit (Auditor)

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger — the v6-final Part 5 cross-checked a "COACH SYSTEM —
CONSOLIDATED FUNCTIONALITY MAP" section that does not exist in gen-2; the
gen-2 Part 5 is specified below.

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

**PART 5 — Life Tree register cross-check (gen-2):**

Input, in addition to the standard audit inputs: the life-tree-design/
sources (SCHEMA.md §2.4 the threshold register, §2.3 the canonical domain
table, §2.5 the trigger table, §2.6 the state model, §3 the derivation
contract) and the final drafted docs/LifeTree.md (+ the amended docs that
carry tree decisions, e.g. UIUX.md's tree surface, Database.md's
formatVersion 3).

For every register value / threshold / schedule / contract number in the
sources, confirm it is represented in the final docs. Verdict per item:
- ✅ REPRESENTED — the value shows up in the final docs/LifeTree.md (or
  the amended doc it mapped to).
- ❌ ORPHANED-VALUE — the register locked this value but nothing in the
  final docs reflects it.

This is an independent check against the ledger's own extraction — a
mismatch here means either the ledger missed something the register
already locked (bad) or the value was superseded in the ledger (worth
noting, not a drafting failure). Distinguish the two where you can.

Output as Part 5 of docs/IntegrationAuditReport.md.

Write docs/IntegrationAuditReport.md to disk and STOP for human review — do
not proceed to any later stage.