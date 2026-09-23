# LOOP-CLOSURE VERIFICATION — the D115 gate (final)

**Date:** 2026-09-23 · **Gate:** final loop-closing verifier for the D115 closure round
**Scope read in full:** TEMP-PLANNING.md (D115 L3401–3444, D097 L2720–2759, D100 L2837–2872, D091 L2495–2507, D110 L3166–3211) · SCHEMA.md · LOOPHOLES.md · INPUT-INVENTORY.md · TRAIT-SPACE.md · PLAN.md · ACHIEVEMENT-SCAN.md · the prior gate (relentless-logic-audit.md).

---

## VERDICT: PASS-WITH-FIXES

The core D115 deadlock fixes (B2/B4 days-based, fork routing, seedling leaf-buds, the leaf-family envelope, the D097 citation, the canonical-7 ring, SCHEMA §3 BALANCE, §2.6) are correctly applied to the text. But **the D115 record overclaims on two items it never made** (PLAN.md statuses, ACHIEVEMENT-SCAN §1.5) — the exact C-2 false-claim failure mode this round existed to kill — and **the round's own headline claim ("the every-other-day archetype matures") is arithmetically false against the thresholds it locked** (B2 = 20/30, A4 = 200/yr). A clean PASS would be false.

---

## 1. The ten claimed fixes — verified against the text

1. **Gates read days, not twigs (B2/B4)** — APPLIED. SCHEMA B2 (L102–104): ">=20 in-window days within any 30-day window in ANY domain … - D115: days, not twigs"; B4 (L106–110): ">=2 stage-years AND >=1 domain with >=90 in-window days in its best anchored year … DAYS-BASED - D115; no gate ever blocks on a twig count". No twig language remains in either gate. A3 (L94–95) stays the twig render unit, as D115(1) prescribes.
2. **Fork-routing note** — PARTIAL. Body row (SCHEMA L53): "body days count toward the GYM branch's presence — forks are render structure, never a gate (D115)" ✓. **Media row (L54) got no such note** — "journal branch's MEDIA-FORKS | media days feed the forks" only; the parent-presence/never-a-gate clause is not restated for the second domain D115(2) explicitly names.
3. **Seedling's banked form** — PARTIAL. LOOPHOLES §2 SEEDLING leaf capacity (L56): "leaf clusters (aggregated) + LEAF-BUDS on the stem (the banked content visible form - D115)" ✓. **The §3 matrix row-1 SEEDLING cell (L77) still reads "leaf clusters per twig"** — no leaf-bud form, the exact stale cell M-2 pointed at.
4. **Leaf-family envelope** — APPLIED. TRAIT-SPACE §4 (L74–80): "THE LEAF-FAMILY ENVELOPE (LOCKED - D115, the last zombie vector) … SIBLING FORMS WITHIN THAT FAMILY ONLY … never crossing into another family's envelope". (Cosmetic: two headers numbered "## 4".)
5. **Grove-transformation winter persistence** — APPLIED (recorded). D115 (L3427–3430): "the crown legend and a manifested transformation PERSIST THROUGH WINTER … the legend + transformations are the tree's permanent marks". Nothing in the live docs contradicts it (D095's ephemerality is scoped to ordinary blooms by the record).
6. **D097 citation → D100** — APPLIED. D097(5) (L2750–2753): "governed by D100's two-tier split - content is real (occurredAt truth), presence is earned (the written-in-window guard)". The "(N-7 - consistent with all locks)" text is gone. Minor C-2 housekeeping remains: D100's LANDS still doesn't cite D097, and D097's LANDS still says "N-1/N-7 resolved" with no D100 pointer.
7. **LOOPHOLES canonical-7 + ratchet** — PARTIAL. L44–47: "the CANONICAL 7 presence-domains per D104/D114 … existence is monotonic once born — D114" ✓. **Residuals: §7 L174–175 still states "no events = no tree" unqualified** (the ratchet qualifier exists in §1 and INPUT-INVENTORY §14, not here); **§1 L39–40's master-clock tick still defines SEEDLING→SAPLING as "(first twig on any branch)"** — twig-gated tick text that B2 superseded.
8. **SCHEMA §3 BALANCE 7** — APPLIED. L315–316: "distribution across the CANONICAL 7 presence-domains, D104"; F6 (L173): "Shannon evenness across the 7 presence-domains". No "5 domains" remains in SCHEMA.
9. **INPUT-INVENTORY coach rows** — PARTIAL. L199: payload-blindness with "mirrors H3 OWNERS ONLY — it NEVER touches coach_outputs rows (D110 payload-blindness)" ✓. L200: coachEngagement "opt-ins, deletes, annotates NEVER feed it - check-ins + taps only" (H-03/D110, E11-consistent) ✓. **L201's "Coach-generated metrics/summaries (analytics windows, strictness modes, all 9 kinds) | 3 | sap-level derived facts" still contradicts payload-blindness** — the 9 kinds are coach_outputs rows, which D110(1) forbids the tree from touching.
10. **The model's SCHEMA home (§2.6)** — APPLIED. SCHEMA L267: "### 2.6 THE TREE-STATE MODEL (LOCKED - D107, the lean form)". (Section order 2.6-before-2.2 is cosmetic.)

## 2. D115 mechanical claims NOT applied (false claims in the record)

- **"PLAN.md statuses (Step 3 done; 19 archetypes)"** — NOT APPLIED. PLAN.md L36/L126 still read "STEP 3 — Feature scan ⏳ NEXT"; L49–50 still list 6 archetypes; Step 8 (L91) still carries the pre-D101 "secondary-growth trigger (candidate: first qualifying year)". The file is unchanged.
- **"ACHIEVEMENT-SCAN's stale 'NOT locked' line -> D091"** — NOT APPLIED. §1.5 header (L18–19) still reads "TEMPORARY proposal — recorded 2026-08-29, pending the loophole-resolution session; NOT locked", and L47 still says the relabeling is "pending user approval" — while D091's LANDS (L2506–2507) cites §1.5 as the locked overlay's source.

## 3. New / remaining contradictions in the current text

1. **[MODERATE] The every-other-day maturity claim is arithmetically false against the thresholds D115 itself locked.** SCHEMA B4 (L109) and D115(1) both state "the every-other-day archetype … matures". A strict every-other-day logger has ~15 in-window days per 30-day window — **below B2's 20** — and ~182 days/year — **below A4's 200**, so no stage-years and B4's ≥2 stage-years is unreachable. Even a 200-day/year evenly-spread user tops out at ~16–17 days in any 30-day window. The claim only holds for bursty/multi-domain-heavy cadences that aren't "every-other-day". The deadlock class this round was built to close is still open for the named archetype.
2. **[MODERATE] B2's "in ANY domain" is ambiguous** between per-domain (20 days in one domain) and any-domain-mixed (20 days across domains). Under the per-domain reading, the rotating daily logger (C-1 instance 1 — no domain ≥15/30) stays SEEDLING-locked: the exact deadlock D115(2) claims to close. The intended any-domain-mixed reading must be stated.
3. **[MINOR] LOOPHOLES §1 master clock (L39–40):** "SEEDLING→SAPLING = first sustained presence period (first twig on any branch)" — the definitive clock instrument still documents the tick as twig-based, contradicting B2 and "no gate ever blocks on a twig count".
4. **[MINOR] LOOPHOLES §7 (L174–175):** "no events = no tree" unqualified — the ratchet qualifier ("first birth only; existence is monotonic once born") is missing here although present in §1 and INPUT-INVENTORY §14.
5. **[MINOR] LOOPHOLES §3 matrix row-1 SEEDLING cell (L77):** "leaf clusters per twig" — inconsistent with the §2 SEEDLING leaf-buds form and D115(3) (the leaf-buds burst into clusters at SAPLING).
6. **[MINOR] INPUT-INVENTORY §9 L201:** "Coach-generated metrics/summaries … all 9 kinds → sap-level derived facts" vs the payload-blindness row directly above it (D110(1): never touches coach_outputs rows).
7. **[MINOR] SCHEMA L54 media row:** missing the D115 fork-routing note (parent-presence toward the journal branch; forks never a gate) that the body row carries.
8. **[MINOR] D100's LANDS** still lacks the D097 cross-citation (C-2's housekeeping half).

## 4. Observations (not blockers)

- SCHEMA §5 (LOCKED — D085) still contains "ring closes at the year boundary" and "greener canopy from active winter logging" — both explicitly reconciled/superseded in D115's RECONCILIATIONS (L3431–3437). The record binds, so this is covered, but §5 has no D115 pointer; an implementer reading §5 alone gets the superseded mechanism.
- The remaining "six-domain" mentions in live docs are the ACHIEVEMENT-SCAN VIII-family trophy conditions — explicitly deferred to the docs pass by D114(3)/D115. Not a contradiction.
- TRAIT-SPACE.md has duplicate "## 4" headers (Explainability + Leaf-Family Envelope) — cosmetic renumbering only.

## 5. Bottom line

All five headline fixes (1, 4, 5, 6, 8, 10) are genuinely applied; items 2, 3, 7, 9 are partial. Two claimed mechanical fixes (PLAN.md, ACHIEVEMENT-SCAN) were never made — the record must be corrected, not the claim repeated. The two arithmetic findings (every-other-day vs B2/A4; B2's domain-reading ambiguity) are the only ones that could reopen a gate deadlock, and they must be settled before the engine contract. No locked decision is reopened by anything in this report.

**Gate action:** PASS-WITH-FIXES — apply items §2 (two line edits + record correction), §3.1–3.2 (threshold or claim edit), and the §3.3–3.8 stale lines.