# LIFE TREE — IMPLEMENTATION STEP PLAN (the session roadmap)

**Recorded 2026-08-29 (schema session).** The 10-step map agreed with
the user for building the Life Tree engine. Statuses tracked here;
every completed step leaves its record in TEMP-PLANNING tree-7
(D-numbers), VISION.md, SCHEMA.md, and TRAIT-SPACE.md.

> **How to read:** each step = what it delivers, its status, its
> record location, and its gates. Steps 1–2 are LOCKED and recorded.
> Step 3 (feature scan) is NEXT.

---

## STEP 1 — The 6 open decisions ✅ DONE (D085–D088)

Deliver: every gating question resolved with the user.
Record: TEMP-PLANNING tree-7 (D085–D088) · VISION §4 (resolved).

| Decision | Result | Decision |
|---|---|---|
| Seasonality driver | Calendar skeleton + data intensity (layered) | D085 |
| Super-hard achievement visual | Deterministic core + derived accents (hybrid) | D086 |
| Habit mapping | Habits = buds (swell → burst → scar) | D087 |
| Branch refactor | v4: 5 fixed branches, leader, forks, twigs, rings, dormancy | D088 |
| Species-composite rules | Gradient coherence: 4 axes, positions, signatures | D088 |
| Ghost-in-the-Machine tier | Folded into the achievement-scan (full list, many families) | D086 correction |

## STEP 2 — Refactor the organ map ✅ DONE (D088)

Deliver: the refactor-first attack on the baseline; the locked
structure (5 fixed branches, twig layer, duality principle, adaptation
layer, gradient coherence, integration rules).
Record: TEMP-PLANNING tree-7 (D088) · VISION §3 (locked table) ·
SCHEMA §3/§5/§6 · TRAIT-SPACE §3.

## STEP 3 — Feature scan ⏳ NEXT

Deliver: inventory EVERY input in the app from the real docs
(Database.md, Architecture.md, CoachSystem.md, Gamification.md,
Roadmap.md, UIUX.md, MediaStorage.md + the achievement spec + the
ledger). Sub-steps: the ACHIEVEMENT-SCAN (every achievement family +
tier → the rarity ladder) and the FEATURE INVENTORY (every feature →
its inputs).
Record: SCHEMA §2 (the inventory table).
Gate: every input enumerated; no feature left unlisted.

## STEP 4 — Archetype mockups (design-time cohesion validation)

Deliver: stylized archetype-tree mockups (gym-heavy, journal-heavy,
balanced, decade-consistent, bursty, Mediterranean-overlap) using the
design workflow — the visual contract + the cohesion check BEFORE
schema rows are locked.
Record: design/ (mockup scratch) → reviewed against the axis
signatures.
Gate: every archetype passes the botanical-contradiction check
visually; mockups approved by the user.

## STEP 5 — Input map

Deliver: SCHEMA.md filled row by row — every feature → organ →
botanical mechanism → threshold → visible change → why. Each row a
user-approved decision (D-numbers).
Record: SCHEMA.md (the full map) · TEMP-PLANNING tree-7 (condensed).
Gate: zero un-mapped features; every threshold defined.

## STEP 6 — Engine architecture

Deliver: the code design — derivation cache (in-DB derived table vs
snapshot — a DecisionLog question), tree-state data model, incremental
update protocol, H3 owner functions, the RENDERER DESIGN (instanced
procedural leaves, LOD, stylized pipeline) with explicit perf budgets,
the seeded-data test harness.
Record: ENGINE-CONTRACT.md (the architecture half).
Gate: the renderer design is committed with budgets (the deferred
spike only confirms numbers, not direction).

## STEP 7 — Trait space + visual design

Deliver: TRAIT-SPACE.md filled — trait dimensions, candidate values
from the full botanical research (all 25 inflorescences, 30 fruits,
46 modifications), data drivers, axis signatures, the why-panel spec,
tokens/art direction (heartwood language), the ceremony (F-03).
The mockups from step 4 feed this.
Record: TRAIT-SPACE.md · design tokens.
Gate: every trait traces to data; every candidate is coherent within
the axis envelope.

## STEP 8 — Engine contract

Deliver: the zero-decision-fatigue spec — exact derivation rules,
the secondary-growth trigger (candidate: first qualifying year),
season-phase function + intensity modifiers, rarity tiers from the
achievement scan, every adaptation's axis signature + trigger, the
why-panel output format.
Record: ENGINE-CONTRACT.md (the spec half) · SCHEMA §9 decision
record.
Gate: an implementer needs zero open questions.

## STEP 9 — Build sequencing

Deliver: the phased build plan with tests per phase:
PHASE 0 = the renderer perf spike (prove the perf budget on a minimal
derived tree with a real device) → organs (trunk/rings, branches/
twigs, buds, leaves) → visuals (flowers, fruits, adaptations,
seasonal states) → navigation/feeds (the duality principle) → anatomy
views (root/stem/leaf sections, time-lapse) → review mode.
Record: TEMP-PLANNING tree-6 (implementation plan).
Gate: each phase has tests; the perf gate is a milestone gate.

## STEP 10 — Record into TEMP-PLANNING

Deliver: tree-1..tree-6 filled with the condensed decisions +
D-numbers + LANDS; the docs pass later drafts into docs/ (a
docs/LifeTree.md family, DecisionLog entries) via the drafter
pipeline.
Record: TEMP-PLANNING tree-1..tree-6 · the docs pass.

---

## Status summary

| Step | Status |
|---|---|
| 1. Open decisions | ✅ DONE (D085–D088) |
| 2. Organ map refactor | ✅ DONE (D088) |
| 3. Feature scan | ✅ DONE (3-pass audited + the artifacts 1-3 + the register + the model) |
| 4. Archetype mockups | pending (the paper run precedes) |
| 5. Input map | STRUCTURE DONE (the 3 artifacts + the register + the model); the consolidation + the paper run remain |
| 6. Engine architecture | pending (the owner contracts + the perf numbers) |
| 7. Trait space + visual design | pending |
| 8. Engine contract | pending |
| 9. Build sequencing | pending |
| 10. Record into TEMP-PLANNING | pending (ongoing per step) |