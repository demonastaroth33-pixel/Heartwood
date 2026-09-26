---
description: Stage F of the TEMP-PLANNING integration pipeline — Cross-doc Consistency Pass. Dangling-reference checks + terminology normalization across all 15 docs + docs/LifeTree.md. MEDIUM-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage F — Cross-doc Consistency Pass

Framework effort assignment: **MEDIUM** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger. The v6-final terminology examples below (week recap /
weekly review / week verdict) were gen-1-era — the gen-2 register terms are
listed instead.

Execute the framework's Stage F instruction exactly:

Unchanged from v4 (§12), plus:

- Confirm every REMOVES-existing deletion Stage D1/D2 performed doesn't
  leave a dangling reference elsewhere (e.g. if the tree-1..tree-6
  skeletons' content is deleted from the ledger, confirm nothing else in
  docs/ still cites a skeleton as live; if a superseded register value is
  removed from life-tree-design/, confirm no doc still quotes the old
  number).
- Terminology normalization: the same concept must carry the same name
  across all 15 docs + docs/LifeTree.md (e.g. the register terms: "twig
  bars" vs "mixed days", "stage-year" vs "year", the crown/medal/trophy
  ladder names, the ring-fold and canopy rules — the register locks these;
  the docs must not still name them three ways). Flag, don't silently
  rename, when a name change crosses a DecisionLog entry.

Base mechanism (v4 §12): the cross-doc consistency pass reconciles the
final docs — every name, reference, milestone label, decision citation, and
format is consistent across all files; inconsistencies between docs that
the drafting introduced are fixed; inconsistencies that predate the pass
are flagged in the output.

Fix inconsistencies where they are safe (pure formatting, naming, or
references between docs). Flag — do not silently change — anything that
touches a DecisionLog entry or locked scope. Report every change and every
flag, and stop for human review.