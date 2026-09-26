# PIPELINE FRAMEWORK — v7 GEN-2 DELTA (addendum to v6-final)

**Date: 2026-09-26.** The v6-final framework (and RUNBOOK.md) was
written against the ARCHIVED gen-1 ledger. This delta maps it to the
gen-2 ledger (TEMP-PLANNING.md, ~3,900 lines, the refactor & Life
Tree design generation). The v6-final procedures, stages (A1a→G),
and discipline remain valid; ONLY the ledger-specific keys change.
Read this addendum FIRST; where it disagrees with v6-final, this
wins.

## 1. The ledger this pipeline drafts from

- Source: `TEMP-PLANNING.md` (the gen-2 ledger — the C/F/N/L series
  + the tree-7 design decisions + the D-number records D060–D117).
- The Life Tree design's authoritative detail lives OUTSIDE the
  ledger and is part of the drafting surface:
  - `life-tree-design/VISION.md` (17 principles, the organ map)
  - `life-tree-design/SCHEMA.md` (2.3 the canonical domain table,
    2.4 the threshold register, 2.5 the trigger table, 2.6 the
    state model, 3 the derivation contract)
  - `life-tree-design/LOOPHOLES.md` (the resolutions + the stage
    model + the matrix)
  - `life-tree-design/ACHIEVEMENT-SCAN.md` (the rarity ladder +
    the identity axis)
  - `life-tree-design/INPUT-INVENTORY.md` (the feature surface)
  - `life-tree-design/paper-run/` (the 19 archetype walks — the
    validation evidence)
  - `life-tree-design/audits/` (the audit chain)
- The ledger's tree-1..tree-6 skeletons are SUPERSEDED — the
  authoritative tree record is tree-7 (D085–D117); drafters read
  the decision records + the life-tree-design sources.

## 2. The gen-2 legend families (v6-final's families are archived)

| Family | Ids | Meaning |
|---|---|---|
| candidate-C | C-01..C-15 | journaling research candidates (research-journaling/) |
| candidate-F | F-01..F-32 | fitness research candidates (research-fitness/) |
| candidate-N | N-01..N-18 | nutrition research candidates (research-nutrition/) |
| candidate-L | L-01..L-15 | LifeOS research candidates (research-lifeos/) |
| audit | audit-1..audit-13 | refactor-audit checklist anchors |
| tree | tree-1..tree-7 | the Life Tree design system (tree-7 = the decisions) |
| engine | engine-1, engine-2 | cross-cutting discipline blocks |
| D-records | D060..D117 | the decision log records (statuses: LOCKED/SKIPPED/REJECTED/AGREED IN PRINCIPLE/PENDING) |

The gen-1 families (backup-A, census-A, routine-A, audit-B/C/E,
resolve-B/E, spec-E, TENSION, clash, G/J/R/H…) are ARCHIVED and do
not exist in gen-2.

## 3. The D-number range

- v6-final says "DecisionLog ends at D040" — STALE. The gen-2
  convention: D082+ (implied for every LOCKED entry), continuing
  through D117. The docs pass assigns the final D-numbers per row;
  NOTE the collision: the ledger skill-install records D083/D084
  collide with the DecisionLog's already-recorded D083 — the docs
  pass renumbers the ledger pair (→D118/D119).
- The framework's "next available starting D041" is STALE — the
  next free number is D118+.

## 4. The draftable scope (what the drafters may draft)

- The C/F/N/L series entries with LOCKED status + their LANDS
  (per the general convention: the D-number is implied).
- The tree-7 decisions D085–D117 + the life-tree-design sources
  (the register values, the schedules, the state model, the
  trigger table) — the future docs/LifeTree.md family.
- The doc-amendment flags scattered across the ledger (the D117 A1
  register collects them; drafters also scan for "amend at the
  docs pass" flags).
- NOT draftable as decided: entries with PENDING/AGREED-IN-
  PRINCIPLE status, the SKELETON text of tree-1..tree-6 (superseded
  by tree-7), the [REVIEW] markers (all resolved as of the 2026-09-26 re-audit - the N-03/N-11 confirmations are recorded),
  the unfilled Unlocks/Refactor sections.

## 5. The Coach Consolidated Map cross-check (v6-final §cross-check)

The v6-final references a "Coach Consolidated Map" section — it
does not exist in gen-2; the Coach's authority is
`docs/CoachSystem.md` + the L-10 record + the tree decisions
(D103/D110/D111). Drop the cross-check or re-point it to
CoachSystem.md.

## 6. The A1a ID census

The A1a stage enumerates the ledger's IDs by family (including
tree-7 — the legend now includes it). The census must also list
the life-tree-design/ sources as drafting inputs (they carry the
register/model/trigger detail the ledger points to).
