# Structural Impact Proposal — TEMP-PLANNING.md (gen-2 ledger)

**Stage:** B2 — Cross-Doc Structural Impact Analysis (Architect) · **Framework:** TempPlanning-Integration-Framework-v6-final §7 + Pipeline-Framework-v7-Gen2-Delta (read first; wins on disagreement) · **Date:** 2026-09-26 · **Inputs read (current content, directly):** `docs/IntegrationIntentBrief.md` (full, 78 lines) · `TEMP-PLANNING.md` (full, 3922 lines — including tree-7 D085–D117 and every "amend at the docs pass" flag) · `docs/UIUX.md` (390) · `docs/Roadmap.md` (1068) · `docs/Database.md` (400) · `docs/CoachSystem.md` (497) · `docs/Architecture.md` (453) · `docs/Gamification.md` (493) · `docs/DecisionLog.md` (1205) · `docs/DesignSystem.md` (475) · `docs/DevelopmentWorkflow.md` (239) · `docs/README.md` (89) · `life-tree-design/VISION.md` (337) · `life-tree-design/SCHEMA.md` (484) · `doc draft framework/TempPlanning-Integration-Framework-v6-final.md` §6–§10 · `doc draft framework/RUNBOOK.md` · `doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md` (read first).

**Method:** every Intent Brief item (INT-01…INT-27) × every doc its "Affected docs" names, mapped to its current on-disk state, with the proposed change, the type, and the row dependencies. The eight GEN-2 structural items from the B2 prompt are each elaborated. No doc was touched — proposal only.

**Standing GEN-2 corrections (delta wins):** (1) there is NO Coach Consolidated Functionality Map in gen-2 — the Coach authority is `docs/CoachSystem.md` + the L-10 record + the tree decisions (D103/D110/D111); (2) the entity-sync-plane-before-P2.5 restructure is gen-1 history (already locked as D059 + Roadmap M11) — it is NOT a gen-2 item; (3) the ledger's D083/D084 skill-install records collide with DecisionLog's already-recorded D083 → renumber to D118/D119 at the docs pass; (4) the tree-1..tree-6 skeletons are superseded pointers, NOT draftable scope (delta §4); (5) the docs/ set is now 23 files + the NEW `docs/LifeTree.md` family (delta §8).

---

## 1. Executive summary

### 1.1 Artifact
This file: **`docs/StructuralImpactProposal.md`** (Stage B2 output; reviewed at the Stage C human checkpoint before any drafting).

### 1.2 Per-doc change counts (rows in the §3 table; the eight GEN-2 items in §2 carry the elaborations)

| Doc | New-addition | Extends-existing | Restructures-existing | Renames-placeholder | REMOVAL | Total rows |
|---|---|---|---|---|---|---|
| `docs/LifeTree.md` (NEW family) | 19 (flagship family + its contributory rows; §2.1 outline) | — | — | — | — | 19 |
| `docs/UIUX.md` | 5 (tree screen; identity-axis filters; dev-only tuning panel; lookup section; mobbin maps) | 7 | — | — | — | 12 |
| `docs/Roadmap.md` | — | 9 | 0 (M0–M5 locked; M9 placeholder filled, not restructured) | 2 (M9 placeholder → full spec, INT-01 + INT-25) | — | 11 |
| `docs/Database.md` | 1 (ONE coherent schema set §2.4) | 6 | — | — | — | 7 |
| `docs/CoachSystem.md` | — | 5 | 2 (weekly message template; authority re-point) | — | — | 7 |
| `docs/Architecture.md` | — | 4 | — | — | — | 4 |
| `docs/Gamification.md` | — | 5 | — | — | — | 5 |
| `docs/DecisionLog.md` | — | 4 | 1 (D085–D117 register + renumber + D071 re-point) | — | 1 (D071 "not a spec" verdict superseded) | 6 |
| `docs/DesignSystem.md` | — | 4 | — | — | — | 4 |
| `docs/DevelopmentWorkflow.md` | — | 3 | — | — | 1 (S021 gen-1 M2 Life Tree sequencing superseded) | 4 |
| `docs/README.md` | — | 1 (provenance note: two pipeline generations; doc map + LifeTree.md entry) | — | — | — | 1 |
| EXTERNAL: life-tree-design/ sources | — | 12 (amendment targets only — never silently re-created in docs/) | — | — | — | 12 (grouped) |

**Total: 92 rows.** Type histogram: new-addition 26 · extends-existing 48 · restructures-existing 3 · renames-placeholder 2 · REMOVAL 1 (in-table; the 6 ledger-skeleton REMOVAL rows + D071 + S021 + M9-premise supersessions are detailed in §2.5/§4) · EXTERNAL-amendment 12.

### 1.3 REMOVAL rows (summary — full detail §4)
1. **tree-1..tree-6 skeleton records** (ledger, TEMP-PLANNING.md:2355–2397) — 6 REMOVAL rows. Superseded by tree-7 (D085–D117) + the life-tree-design/ sources; content already absorbed into `life-tree-design/VISION.md`, `SCHEMA.md`, `TRAIT-SPACE.md`, `LOOPHOLES.md` (absorption noted per row so D2 preserves the evidence; the ledger is archived, never edited).
2. **DecisionLog D071 "Life Tree — not a spec" verdict** — REMOVAL/supersession: re-pointed to the gen-2 design chapter (D085–D117) + the new docs/LifeTree.md spec.
3. **DevelopmentWorkflow.md S021 (gen-1 M2-bound Life Tree sequencing)** — REMOVAL/supersession: replaced by D117's M9 plan (the row is superseded content; keep the sequencing-notes block as archived history, amend the S021 row text).
4. **Roadmap.md M9 placeholder premises** ("no new tables" at :887 and :900; "renders from the M7 owner catalog" at :896; mockup in the M8-closing pass at :859) — superseded by D107/D108/D109/D110/D117; the placeholder is RENAMED into the full M9 spec (§2.3) rather than deleted.

### 1.4 Dependency chains (summary — full detail §5)
- **Chain A — LifeTree.md (flagship):** DecisionLog D085–D117 entries → external sources consolidated (SCHEMA/VISION/LOOPHOLES/ACHIEVEMENT-SCAN/INPUT-INVENTORY/TRAIT-SPACE/PLAN/paper-run) → tree-state model (D107) → derivation protocol (D108) → register + triggers (D105/D106) → seasonal states + ceremony (D085/D095/D094) → launch-day + restore contracts (D097/D098/D109) → privacy/copy boundary (D110) → render/perf (D111) → handoff/M9 phases (D117).
- **Chain B — Database.md schema set:** DecisionLog schema entries → formatVersion 3 + logFingerprint → isBackfill → adoptedAt → viewed_moments → the F/N/L-era fields (setType, batch/containers, trivial-foods, gram-reference, veggie-tag, parse-output, day-pattern, receipt-substitution) → M10–M13 format rows consume the version.
- **Chain C — Roadmap M9:** M7 analytics owners (qualifyingEntry etc.) + M8 Coach rule-book session → M9 phases B–G + standing gates H0–H5 → LifeTree.md implementation section mirrors it.
- **Chain D — CoachSystem:** INT-16 authority re-point → INT-17 weekly message template (rule-book session) → the 12 amend conflicts (F-08/F-19/F-24/F-30/D102) → tree read-surface (D110).
- **Chain E — the 12 conflicts + INT-19 register:** all amendment rows depend on the docs pass assigning final D-numbers (D118+) and on DecisionLog D085–D117 being recorded first.

### 1.5 Flags for the Stage C human checkpoint
- **REMOVAL sign-off needed:** the 6 ledger-skeleton rows + D071 re-point + S021 supersession + the M9 placeholder-premise supersessions (§4).
- **B1 artifact not on disk:** the B1 mapper's annotated ledger is absent from this run (only A1–A3 artifacts exist). The "12 amend-at-docs-pass conflicts" in §2.6 are therefore derived from the ledger's own "amend at the docs pass" flags (all verified against current doc line numbers). If the B1 annotation exists elsewhere, reconcile counts at Stage C.
- **Draft-source verdicts required (RUNBOOK C):** L-15 (INT-24) is a DESIGN FEED (feed-only, placement deferred to D117 D1/D2) — REFER, not drafted as a feature; F-26 progression-edge is SKIPPED — not drafted as schema; INT-23 `_TO FILL_` sections — nothing drafted; research leftovers (INT-27) — DecisionLog open items only.
- **The D060 override** (Roadmap.md:283-288) is an amendment of a *locked closure*, explicitly requested in the ledger (TEMP-PLANNING:131) — flagged for explicit human approval.
- **Coach Consolidated Map cross-check** (v6-final §5) is DROPPED per delta §5 — re-pointed to CoachSystem.md + L-10 + D103/D110/D111 (§2.7).

---

## 2. The eight GEN-2 structural items

### 2.1 NEW doc family — `docs/LifeTree.md` (flagship; INT-01 + 18 contributory intents)

**Type: new-addition.** The single largest structural change: a NEW canonical spec doc consolidating tree-7 (D085–D117) + the EXTERNAL life-tree-design sources (delta §1/§6 — those sources are part of the drafting surface). It is authoring NEW scope (the design chapter is complete in life-tree-design/; docs/ gains the canonical spec). The existing DecisionLog note that life-tree-design/ is intentionally outside docs (DecisionLog.md:1201) is PRESERVED — the external folder stays the authoritative working design; docs/LifeTree.md is the shipped, docs-voice spec that cites it.

**Proposed section outline** (from SCHEMA.md §2.3–2.6 + §3 and VISION.md, rewritten in docs/ voice — headings and one-line content only; the drafter fills from the decision records, never copies the external files verbatim):

1. **What the Life Tree is** — the one-paragraph vision (VISION §1), the 17 locked principles distilled into the docs' rule voice (every input feeds the tree; derived-only + anti-farm; years not months; cohesion is the single most important constraint; explainability), and the explicit NOT-list (not decoration, not a write-path entity, no XP, no shame).
2. **The master clock and the shared anchor** — D090 stage clock (SEED → SEEDLING → SAPLING → POLE → MATURE → OLD-GROWTH, any-domain ticks); D101 two year types (stage-years vs ring-years, never confused); D102 the frozen birth anchor shared by the tree, the Coach anniversary, milestone reviews, and rings; D100 presence predicate (content organs read occurredAt truth; presence organs read the written-in-window guard ±3d; imports excluded; a pure backfill cannot birth the tree).
3. **The canonical domain table** — D104 / SCHEMA 2.3: the two-level model (7 presence-domains → 5 branches; body→gym body-forks, media→journal media-forks, goals presence, periods → base); every system reads one table.
4. **The organ map and the duality principle** — D088: trunk + rings, 5 fixed branches, forks, twigs, leaves, buds (D087), flowers, fruits/spurs, vascular system, the 14 adaptation rows; scale separation; dormancy + revival; the section-UI local-view contract (habits tab = bud garden, journal = leaves, nutrition = sap monitor, gym = branch growth, goals = orchard, achievements = garden — one derived state, one animation language, two scales).
5. **The threshold register** — D105/D115/D116 / SCHEMA 2.4: groups A–F with the numbers verbatim (presence bars, stage gates, capacities, tenure floors, adaptation axis signatures, windows & formulas); the register freezes at the engine contract; the D105 dev-tools tuning surface is documented here as dev-only (§2.2).
6. **The trigger-correlation table** — D103/D106 / SCHEMA 2.5: the flower triggers (D092 schedule + D091 overlay + D095 seasons + D096 banking), the 14 adaptation triggers, the structural/ceremony triggers, the no-double-fire map; the F-03 NO-BLOOM arbitration (bract-style flourish, zero flowers).
7. **The tree-state model** — D107 / SCHEMA 2.6: the lean derived cache (meta + stage + axes + bankBuds + trunk + branches + habits + leaves + flowers + fruits + periods); only what the renderer draws and the derivation tracks; every other fact stays in its owning system.
8. **The derivation protocol** — D108: incremental delta + atomic swap; persisted cache + first-paint contract; off-UI-thread isolate; set-commutative fold; single-writer lock + idempotence; in-session ceremony state machine (queue, never interrupts writing).
9. **Seasonal organ states** — D085/D095: growing vs resting seasons; per-organ states (ephemeral flowers, winter leaf-buds, winter-persistent fruits, scale-wrapped habit buds); the winter bank → spring flush; season-phase function (calendar + intensity modifiers); autumn leaf-fall re-bake (D111 P-03).
10. **Stage-transition UX and the ceremony language** — D094 + D086 + D112 + D106: day-1 seed; germination; every transition a designed moment (durations, nothing loops); replay-on-open + viewed watermark; why-panel carries the schedule; the ONE shared ceremony language (F-03 flourish, F-15 hero ring, ink-wash blush = the one saturation moment); reduced-motion fallbacks.
11. **The launch-day contract** — D097: full-history derivation from day one (veteran tree already mature); time-lapse replay once from PRECOMPUTED YEARLY SNAPSHOTS; the legend card; the D100 two-tier split governing backdating.
12. **The restore/backup contract** — D098/D109: tree state is a derived cache, never source data; monotonicity by design; three restore cases (same-era / older / newer) all honest; re-derivation as a designed transition; the cache is regenerable, never part of backup integrity; formatVersion 3 logFingerprint; the synced `viewed_moments` table.
13. **Privacy and copy boundaries** — D110: read-surface exclusion (payload-blindness — the tree NEVER touches coach_outputs, gamification cache tables, or goal internals); why-panel value law (four clauses); sharing-safe default (sensitive-row collapse); L10N contract (zero prose in the state model; the derived-copy engine is the single place language lives).
14. **Rarity, identity, and coherence** — D091/D112/D113/D086: the flower overlay (131 trophy names + tier labels EXACTLY unchanged); the identity axis (family → flower family); the coherence filter (axis signatures + compatible-sibling fallback); the 17-audit four statuses (WIRED / RESERVED-UNMAPPED / STRUCTURAL / EXCLUDED-BY-DESIGN-PERMANENT); the rarity-tier ladder from the FULL scanned achievement list.
15. **Render and performance** — D111: the LOD ladder (mass / structure / detail); the semantics surface (one deterministic source → pixels and semantics); keyboard map; transition announcements; deuteranopia + contrast gates; motion tiers; ≥44px hit areas; the 45k-draw-op disaster made structurally impossible.
16. **Surfaces and interaction** — tree-4 + D094/D099: the tree tab layout (hero + overview strip + detail panel); the why-panel; bud clusters; the bank counter (top-3 + count + closed bucket); sensitive-row collapse; the identity-axis filter chips (§2.2); the dev-only tuning panel (§2.2).
17. **Development handoff and implementation plan** — D117 + life-tree-design/PLAN.md: A pre-M9 amendments; B phase-0 engine foundation (renderer perf spike, state model, dev tools, derivation engine); C organs; D visuals (17-audit → archetype mockups → flower/adaptation visuals); E navigation/feeds; F anatomy views; G review mode; standing gates H0–H5 (incl. the seeded-data stress tests that reproduce the 19 paper-run archetypes).
18. **The consumed H3 owners** — D117 A3: qualifyingEntry, streak, goalProgress, coachEngagement, dayActivityScore, mediaPresence — exact outputs, designed alongside their owning systems.
19. **References** — link-out to life-tree-design/VISION.md, SCHEMA.md, LOOPHOLES.md, ACHIEVEMENT-SCAN.md, INPUT-INVENTORY.md, TRAIT-SPACE.md, PLAN.md, paper-run/, audits/, research-botany/MASTER-Botany-Reference.md (never inline-copied).

**Contributory intent rows:** INT-01 (family), INT-02 (state/derivation), INT-03 (register), INT-04 (dev-tooling), INT-05 (clock/anchor), INT-06 (duality), INT-07 (ceremony), INT-08 (seasonal), INT-09 (stage-transition UX), INT-10 (ceremony queue), INT-11 (launch-day), INT-12 (restore), INT-13 (read-surface), INT-14 (copy/L10N), INT-15 (identity-axis), INT-16 (branch detail = L-10 insight home), INT-24 (L-15 design-feed note), INT-25 (implementation plan), INT-26 (consolidation source).

### 2.2 UIUX.md — the tree screen, identity-axis filters, dev-only tuning panel

**Type: new-addition (×3) + extends-existing.** Current state: UIUX.md has NO tree surface (nav shell lists Dashboard/Journal/Habits/Settings + "Later: Goals, Coach"); the tab-existence lock is gen-1 and placement is deferred to the UI/UX ordering pass (Roadmap.md:856-859); the calendar tint section (UIUX.md:136-149) is the closest visual precedent.

Proposed:
1. **The tree tab surface** (INT-01/09/14): a new "Life Tree" section under the shell — tab (placement per the deferred UI/UX ordering pass), the hero tree + overview strip + detail panel layout (D094/D099), the day-1 seed state, germination, empty/dormant states, why-panel, semantics surface (D111), sensitive-row collapse (D110(3)), and the reduced-motion + LOD render states. It references docs/LifeTree.md as the spec owner — UIUX.md carries the surface copy, never re-specifies the engine.
2. **Identity-axis filters** (INT-15): in the tree tab's overview strip / detail panel, filter chips browse by identity axis — flower family (ACHIEVEMENT-SCAN §1.5), tier magnitude (Sprout→Grove), and branch/domain. New surface element, derived-only, no schema; names/tiers unchanged per D091.
3. **Dev-only tuning panel** (INT-04/D105): a "Dev-only surfaces" subsection documenting the D105 register/palette tuning panel — playable register values + blush tokens driving live re-derivation + re-render; **explicitly marked build-time only, NEVER shipped** (DevelopmentWorkflow.md carries the build-time tool discipline; Roadmap M9 B3 schedules it). This is the one surface in the app that is documented to never exist in the product.
4. **Section screens gain organ-local states** (INT-06 duality): journal/habits/nutrition/gym/goals/achievements screens reference their tree organ (leaves, buds, sap monitor, branch growth, orchard, garden) — one derived state, two scales; the habit card becomes the bud's local view (D112 DV-C5 — the mini-plant stages are replaced by bud states; the RENAME of "Heartwood" is dropped).
5. **Ceremony references** (INT-07): session screen (F-03 bract flourish) + weight-ladder hero ring (F-15) point at the shared ceremony language owned by LifeTree.md; NOT confetti (DesignSystem.md carries the tokens).
6. **Seasonal render states** (INT-08): autumn leaf-fall, winter leaf-buds, spring flush — as render states of the tree surface; season palette tokens in DesignSystem.md.
7. **Weekly surface copy** (INT-17): the merged weekly check-in's copy matches the F-24 3–5-line template + the F-30 readouts + the L-10 insight line (one line within); the four one-line places amend (§2.6 #6).
8. **GUI research lookup section** (INT-20/21): a verbatim "GUI research references" lookup section carrying the M0–M9 milestone→research table + the three mobbin dataset maps (file paths + screen counts VERBATIM-CRITICAL, cited not embedded).

### 2.3 Roadmap.md — M9 (Life Tree launch) authoring vs locked M0–M5

**Type: renames-placeholder + new-addition (M9 authoring).** Current state: Roadmap.md:876-901 is the "## Milestone 9 — Life Tree" placeholder — D071-based, "CONFIRMED PREMISES ONLY", with exit criteria that conflict with the gen-2 design (below). M0–M5 are LOCKED milestones (M0 untouched per D081; M1–M5 restructured 2026-08-23 and locked) — **no restructuring of M0–M5 is proposed.** M6–M8 keep their locks; only premise amendments are proposed (M7/M9 premises per INT-05, M7 cache-vs-log arbitration per INT-13).

Proposed M9 authoring (per D117's launch sequence; the design doc exists in life-tree-design/, so this is authoring NEW scope into the existing placeholder, not restructuring a locked milestone):
- **Scope:** fill the placeholder with the D117 phases — A pre-M9 (the docs-pass amendment register, owner-contract groundwork, emotional copy-language pass); B phase-0 engine foundation (renderer perf spike ≤16ms at LOD-1/2, state model implementation, dev-tools tuning surface, derivation engine); C organs (trunk/rings, branches/twigs/forks, buds, leaves, seasonal states, adaptations); D visuals (trait-space 17-audit → archetype mockups from the 19 paper-run archetypes → flower/adaptation/seasonal visuals + ceremony + why-panel copy engine); E navigation/feeds (the duality principle); F anatomy views (root/stem/leaf cross-sections + time-lapse replay); G review mode (yearly review artifacts). Standing gates H0–H5 (H0 = D-number collision note → D118/D119; H1 = seeded-data stress tests reproducing the paper run; H2 perf gates; H3 coherence checks; H4 deuteranopia/contrast; H5 acceptance criteria = the paper-run fixtures).
- **Exit criteria:** replace the placeholder's criteria with the D117 standing gates + the launch-day/restore contracts' acceptance (D097/D098) + the perf budget (D111) + the stress-test fixtures (H1/H5).
- **Premise supersessions inside the placeholder (explicit):**
  - Roadmap.md:887-888 "no new tables" → SUPERSEDED: D107/D108 establish a PERSISTED tree-state cache table (engine-written, never user-write-path) + D109 adds the synced `viewed_moments` user-state table. "No write-path entity" stays true (the user never writes tree state; the cache is regenerable).
  - Roadmap.md:896 "Tree renders fully derived from the M7 owner catalog" → reconciled: the tree consumes the H3 OWNER FUNCTIONS (the Analytics Engine catalog), but D110(6) forbids reading the M7 cache TABLES — the tree derives from the event log directly with its own cache. The owner-functions wording stays; the table-level dependency is removed.
  - Roadmap.md:859 "includes the Life Tree mockup (M9)" in the M8-closing UI/UX ordering pass → amended per D117 D2: the ARCHETYPE MOCKUPS defer to M9 phase D2; the UI/UX ordering pass closes M8 with the tree tab's NAV PLACEMENT only.
  - Roadmap.md:878 "D071 — idea-recorded user vision" citation → re-pointed to the gen-2 design chapter (D085–D117) + docs/LifeTree.md.
- **M7/M9 premises (INT-05):** M7's account-anchor wording already matches D102 (first real event, frozen); add the stage-year/ring-year vocabulary note (D101) + the shared-anchor cross-ref; M9's rings read the same anchor.

### 2.4 Database.md — the ONE coherent schema set

**Type: new-addition (one versioned set) + extends-existing.** Current state: Database.md carries formatVersion 2 (backup, :311), the logical schema tables, and the migration discipline (additive, never delete columns). D117 A1 explicitly names Database.md as the amendment home and NOT StorageDecision.md ("which carries no format").

Proposed — ONE coherent versioned schema-change set landing as a single migration block under DecisionLog entries (INT-18 + the F/N/L-era fields):

**(a) Tree-era (the INT-18 six, D109/D113/D117 A1):**
1. **formatVersion 3** — backup format bump: carries a monotonic `logFingerprint` (eventCount + syncSeq) so a restored backup tells the tree cache it is stale immediately (D109 C-2); additive to format 2, old backups remain importable per the migration rules.
2. **`logFingerprint`** — also stored in the tree cache meta (SCHEMA 2.6) and used by the D108 incremental-derivation protocol; regenerable cache stays OUT of the backup enumeration (D098).
3. **`isBackfill`** — stored flag on events (D113 IA-3): the D100 presence predicate reads it; historical-backfill mode can never arm rings, stage ticks, or presence; the D116 A6 backfill-trophy predicate extends the exclusion to trophy conditions.
4. **`adoptedAt`** — stored adoption timestamp on media (D113 IA-4): "qualifies forward-only" becomes computable (D113 B M-09 — adopted media counts for media presence forward-only from adoption, never before).
5. **Event-schema notes** — the events table gains the isBackfill flag + the future-dating clamp note (D114: events with occurredAt in the future are excluded from all math) + the written-in-window guard predicates the D100 presence predicate reads.
6. **`viewed_moments`** — a new synced user-state table (D109 C-1): which transitions/replays the user has seen; account-once + per-device delivery; user state (like settings), never a regenerable cache; rides the backup enumeration + the M11 sync plane.

**(b) Fitness-era:**
7. **`setType`** (F-05, Track-1 LOCKED): one nullable enum column on `exercise_sets` (warmup|working|failure), explicit values written at save, default 'working'; queries never guess; W excluded from volume/PR/est-1RM/adherence + qualifyingEntry(GYM) must read "≥1 real WORKING set" (F-05 adherence exclusion → Gamification.md amendment, §2.6 #1).

**(c) Nutrition-era:**
8. **Batch + containers + line items** (N-05): `batch` entity + `containers` table with per-container line items (mini receipt per container), partial-consume semantics, per-part sources, recipe-linked AND free-form containers.
9. **Trivial-foods list** (N-06): a small user-editable list table (or flag) for calorie-trivial foods — each entry carries its REAL macros (never fudged); "N trivial items not logged" footnote.
10. **Gram-reference field** (N-11): every food carries a gram reference; portion picker presets each carry gram equivalents; portionMultiplier scales from the gram anchor.
11. **Veggie-tag + water source** (N-16): food veggie-tag (seeded, user-adjustable) + water source for the two default-OFF habit check-ins (veggies, water).
12. **Receipt-line substitution field** (N-10): the substitution lives on the RECEIPT LINE (copy-in preserved, no fork); macro-range adherence condition for done-differently.

**(d) LifeOS-era:**
13. **Parse-output fields** (L-01): NL parser output fields on goals/tasks (dates + units + cadences; rule-based, offline).
14. **Day-pattern field** (L-13): routine day-template binding expands from one dayKey to a day-PATTERN (weekday/weekend, specific days, weekly cadence); pattern changes future-only.

**(e) Flagged — NOT draftable as decided schema:**
15. **Progression-edge table** (F-26): SKIPPED for now (user) — recorded for future; activation trigger = rep-mode exercise work (M2 build or later); the docs pass must NOT draft it as schema (delta §4).

Every field lands as an additive versioned migration (never delete columns), each with a DecisionLog entry; the set is ONE decision group for the D1/D2 executor, not six separate passes (INT-18 footer flag).

### 2.5 REMOVAL rows — tree-1..tree-6 skeleton records

**Type: REMOVAL (×6, ledger-side supersession — evidence preserved).** The tree-1..tree-6 skeletons (TEMP-PLANNING.md:2355–2397) are design-dimension pointers, explicitly labeled "SKELETON — FILLED BY tree-7 (D085–D117) + …; superseded". They are NOT draftable scope (delta §4). Each row retires the skeleton text as a drafting source and names where its content was already absorbed (so D2 preserves the evidence — the ledger is archived at Stage G, never edited; the docs pass simply does not draft from the skeletons):

| Skeleton | Retired (ledger lines) | Replacement lives in |
|---|---|---|
| tree-1 Vision & metaphor | 2355–2358 | tree-7 D085–D117 + life-tree-design/VISION.md §1–§2 (17 principles) |
| tree-2 Tree anatomy (visual system) | 2360–2369 | VISION.md §3 organ map + SCHEMA.md §2.3/§2.4/§2.5 + D088 (branch system v4, duality) + D087 (buds) |
| tree-3 Growth data (100% derived) | 2371–2379 | SCHEMA.md §2.6 state model + §3 derivation contract + D108 protocol + D107 lean model |
| tree-4 Surfaces & interaction | 2381–2387 | D094 (stage-transition UX) + D095/D099 (surface states) + VISION.md §15 (navigation/feeds) |
| tree-5 Render & performance | 2389–2392 | D111 (surface/render cluster) + the register F9 perf gate (SCHEMA 2.4) |
| tree-6 Implementation plan | 2394–2396 | D117 (development handoff) + life-tree-design/PLAN.md (living status record) |

Related supersessions handled as consolidation notes inside LifeTree.md content (not separate REMOVAL rows): D091's flower-tier relabeling proposal WITHDRAWN (overlay instead); D099 N-6 mirror clause SUPERSEDED by D110(1) payload-blindness; D114/D115/D116 reconciliation notes (D085 "ring closes at the year boundary" → anchored window; D085 "greener winter canopy" → D095 leaf-bud model).

### 2.6 The 12 amend-at-docs-pass conflicts (extends/conflicts rows, exact current-doc locations)

Derived from the ledger's own "amend at the docs pass" flags (B1's annotated ledger is not on disk — see §1.5). Each row names the current-doc location and the required amendment:

| # | Conflict (source) | Current-doc location | Required amendment | Type |
|---|---|---|---|---|
| 1 | F-05 adherence exclusion (TEMP-PLANNING:313–320) | Gamification.md:209-211 — `qualifyingEntry` GYM bar reads "≥1 real logged set" | Amend to "≥1 real WORKING set"; a warm-up-only session is a logged session, not a trained session | extends-existing (conflict) |
| 2 | F-08 SCHEMA-AMENDMENT (TEMP-PLANNING:492–496) | CoachSystem.md:277 — "Settings keys only; zero core schema change." | Amend to "settings keys + the setType column (F-05)" — the F-05 setType makes the old absolute claim false | extends-existing (conflict) |
| 3 | F-13 doc-amendment (1) (TEMP-PLANNING:572–584) | Architecture.md:189 and :268-270 — "rollingWindowMean = the ONLY rolling-average math in the engine" | Amend both to "the ONLY windowed rolling-average util; the body trend owner uses the time-indexed EMA (F-13)" | extends-existing (conflict) |
| 4 | F-13 doc-amendment (3) (TEMP-PLANNING:583–584) | Roadmap.md:361 — same absolute claim | Same amendment | extends-existing (conflict) |
| 5 | F-19 N5-deferral (TEMP-PLANNING:762–766) | Roadmap.md:1027-1029 (idea-park N5) + CoachSystem.md:352-357 ("Deferred: recovery readiness (N5)") + FUT-2 at Roadmap.md:1013 / CoachSystem.md:356,490 | Both deferral lines read "CLOSED by F-19" (training-load Form only); FUT-2 non-duplication note carried forward, not repealed | extends-existing (conflict) |
| 6 | F-24 ONE-LINE-AMENDMENTS (TEMP-PLANNING:841–845) | CoachSystem.md:171 (check_in_weekly), :177 (nutrition_checkup), :185 (phase_close), :236 (milestone-review) | All four "one Coach line per strictness" places amend to the 3–5-line message template (review → adjust → next-week goal); F-30 readouts + L-10 insight line live inside it | restructures-existing (conflict) |
| 7 | D060 supersession (TEMP-PLANNING:131) | Roadmap.md:283-288 — fitness surface CLOSED (D060), N3/N5/N6/N8 park-able | The gen-2 fitness mandate (user-approved F-series) SUPERSEDES D060 for the named locked candidates; the closure list is amended; the clause that N3/N5 remain park-able is amended (they are re-opened, not park-able — F-05 re-opens N3's setType, F-19 closes N5) | extends-existing (conflict — needs explicit human sign-off, §1.5) |
| 8 | D083/D084 → D118/D119 renumber (D117 H0; delta §3) | DecisionLog.md:1179 (D083 already recorded) | The ledger's skill-install pair (TEMP-PLANNING:95–130) renumbers to D118/D119 to avoid duplicate IDs; the docs pass records the renumber | restructures-existing (conflict) |
| 9 | D071 re-point (INT-19) | DecisionLog.md:894-908 ("Life Tree — deferred M2, not a spec") + Roadmap.md:878 (citation) | D071's "not a spec" verdict is superseded by the gen-2 design chapter (D085–D117) → re-point to the M9 spec (docs/LifeTree.md); Roadmap's D071 citation updated | REMOVAL (supersession) |
| 10 | D102 Coach anniversary (TEMP-PLANNING:2947–2949) | CoachSystem.md:208-210 ("the FIRST journal entry's date = day one") + Roadmap.md:814-816 (same) + Gamification.md:176-177 ("It is NOT the milestone-review anchor") | Milestone-review anniversary = the shared birth anchor (first in-window event, frozen, never shifts on deletion); a gym-only user gets their review on the tree's birthday; Gamification's "NOT the milestone-review anchor" sentence is amended | extends-existing (conflict) |
| 11 | D112 Heartwood naming note (TEMP-PLANNING:3322–3326) | Gamification.md:143 (achievement tier "Heartwood"); the app name + habit stage share the word | A naming note at the docs pass: all three "Heartwood" names stay (app, achievement tier, habit stage), ambiguity documented, never renamed; the habit card's mini-plant stages are replaced by bud states (D112 DV-C5) | extends-existing (conflict) |
| 12 | F-12 default-style reconciliation (TEMP-PLANNING:444–450) | Roadmap.md:221-228 — PO style list names LINEAR-WEIGHT as the compound default | Amend the record: "weight-mode default = linear progression with GZCLP stage-cascade on failure (F-12)" — LP progression with cascade-on-failure, no conflict with the locked style list | extends-existing (conflict) |

Rider (folds into #6, not a separate row): F-30/F-28 display reconciliation (TEMP-PLANNING:959–968, 994–1007) — the weekly check-in's volume fact line (CoachSystem.md:170, 272–275) renders F-28's chart as the data visualization; F-30's readouts (LOAD/STIMULUS/BALANCE) live ONLY inside the weekly message.

### 2.7 CoachSystem.md — weekly-message template + Coach authority re-point

**Type: restructures-existing (weekly surface) + extends-existing (authority).** Current state: CoachSystem.md is a self-contained authority (Philosophy → Architecture → Event-log discipline → MVP Coach → Full Coach Design → Outputs & surfaces → Named rules → Achievement tie-in → Context switches → Privacy & the never-list → Strictness → Settings → Scheduling). The weekly check-in is one Coach line per strictness (four places — §2.6 #6).

Proposed:
1. **Weekly-message template (INT-17/F-24/F-30/L-10):** the merged weekly surface's Coach section restructures into the 3–5-line template: review (the week's numbers: sessions, volume vs bands, PRs, sets held, form) → adjust (the engine's decisions, rule-cited) → next-week goal (one concrete target). F-30's three readouts (LOAD / STIMULUS / BALANCE) + L-10's insight line (one line) + N-13's estimate-framing lines + F-08's band verdict + F-14's rate-vs-target + F-19's Form zone + F-20's ramp alert + F-29's balance ratios all ride inside it — template + interpolation, no LLM (the Reflection Generator's flagship output).
2. **Coach authority re-point (INT-16, delta §5):** no ledger map exists; CoachSystem.md IS the authority. Add a short authority note stating: CoachSystem.md + the L-10 record + the tree decisions (D103 trigger authority — the achievement system wins over derived triggers, no-double-fire; D110 payload-blindness/why-panel; D111 semantics surface) + the engine-2 rule-book session (the ~25 named rules committed by M2; ONE rule-execution architecture; table-driven tests; provenance-as-authority). The Life Tree branch detail hosts the L-10 insight line (payload-blind mirror per D110).
3. **Payload-blindness reinforcement (INT-13/D110(1)):** CoachSystem.md documents that `coach_outputs` rows are rendered text and are NEVER a tree input — the tree's read surface never includes them (structurally enforced); the LLM render-never-decide rule is reinforced (the LLM may never make a decision the heuristics can't explain).
4. **Anniversary amendment (INT-05/D102):** §2.6 #10.

### 2.8 The seven-doc amendment register (INT-19, D117 A1)

A coordinated amendment set executed at the docs pass (D2), each item with its D-number:

| Doc | Amendments |
|---|---|
| **DecisionLog.md** | D085–D117 records (33 headers — D060 exists only as a supersession cross-ref; D082+ implied convention); D083/D084 ledger pair renumbered → D118/D119 (collision note); D071 re-pointed (§2.6 #9); research leftovers (17 items, INT-27) recorded as open deferred items (D038/D039 precedent); audit findings become decisions only when an audit runs (INT-22); the docs-pass implied D-numbers assigned D118+ (same-theme rows share one D-number per RUNBOOK C) |
| **Gamification.md** | anchor/six-domain/qualifyingEntry premises (D100 predicate + D101 year types + D102 shared anchor + F-05 working-set bar §2.6 #1); ring brand = six CORE domains (D116 D10); no-rename guarantee (D091, INT-15); Heartwood naming note (§2.6 #11); PR milestones / weight-ladder copy references the shared ceremony (INT-07) |
| **CoachSystem.md** | anniversary = shared anchor (D102); weekly message template + one-line amendments (F-24/F-30, §2.6 #6); N5 deferral closed (F-19, §2.6 #5); volume-balance schema note (F-08, §2.6 #2); payload-blindness + rule-book session + authority note (INT-16/17, §2.7) |
| **Roadmap.md** | D060 closure-clause override at :283-288 (§2.6 #7); M7/M9 premises (INT-05/13); M9 authoring (§2.3); rollingWindowMean claim at :361 (§2.6 #4); N5 park line at :1027-1029 (§2.6 #5); PO default-style at :221-228 (§2.6 #12); D071 citation at :878 (§2.6 #9); M10–M13 rows reference formatVersion 3 + viewed_moments (INT-12/18) |
| **Database.md** | the ONE coherent schema set (§2.4) — DecisionLog entries per field group |
| **UIUX.md** | tree tab + semantics contract (INT-01/09); identity-axis filters + dev-only panel (§2.2); weekly surface copy (INT-17); sensitive-row collapse (INT-14) |
| **Architecture.md** | rollingWindowMean absolute claims (:189, :268-270, §2.6 #3); owner catalog additions (time-indexed EMA trend owner for body, impliedTDEE owner (N-07, M3+), the tree-consumed owners qualifyingEntry/streak/goalProgress/coachEngagement/dayActivityScore/mediaPresence per D117 A3); off-UI-thread derivation note (D108) |

---

## 3. Intent item × affected doc — the impact table

| ID | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| INT-01 | docs/LifeTree.md (NEW) | does not exist | NEW canonical spec consolidating tree-7 + the life-tree-design sources; §2.1 outline | new-addition | DecisionLog D085–D117; life-tree-design sources; INT-02…26 |
| INT-01 | docs/UIUX.md | no tree surface; shell tabs Dashboard/Journal/Habits/Settings; nav ordering deferred (L170) | new "Life Tree" tab section: hero + overview strip + detail panel, day-1/empty/dormant states, why-panel, semantics surface, sensitive-row collapse, LOD render states; M9 GUI reference row | new-addition | LifeTree.md §10/§15/§16; Roadmap M9; DesignSystem ceremony tokens |
| GEN-2 (2a) | docs/UIUX.md | no identity-axis browsing | identity-axis filter chips in the tree tab's overview strip / detail panel (flower family, tier magnitude, branch/domain — §2.2); derived-only, no schema, names/tiers unchanged per D091 | new-addition | INT-15; LifeTree.md §14/§16 |
| GEN-2 (2b) | docs/UIUX.md | no dev-only surface | D105 dev-tools tuning panel as a "Dev-only surfaces" subsection — playable register/palette, build-time only, explicitly NEVER shipped (§2.2); DevelopmentWorkflow.md carries the tool discipline | new-addition | INT-04; LifeTree.md §5/§17 |
| INT-01 | docs/Roadmap.md | M9 placeholder (D071 premises) at :876-901 | fill the placeholder with the D117 phases + standing gates; premise supersessions (§2.3) | renames-placeholder | LifeTree.md §17; M7/M8 locks; INT-25 |
| INT-01 | EXTERNAL: life-tree-design/* | authoritative detail (delta §1) | remain drafting inputs + amendment targets; never re-created in docs/ | EXTERNAL-amendment | — |
| INT-02 | docs/LifeTree.md | — | engine spec: lean state model (D107) + derivation protocol (D108) + consumed-owner contract list (D117 A3) | new-addition | INT-01; INT-18 |
| INT-02 | docs/Architecture.md | owner catalog at :165-192; no tree engine | H3 owner catalog gains the tree-consumed owners (qualifyingEntry, streak, goalProgress, coachEngagement, dayActivityScore, mediaPresence) + the off-UI-thread derivation note; tree derives from the log directly, never the M7 cache tables (D110(6)) | extends-existing | INT-13; INT-18 |
| INT-02 | docs/Database.md | logical schema + event log; no tree cache | persisted tree-cache table (engine-written, regenerable, NOT in the backup enumeration — D098) + logFingerprint cross-ref | extends-existing | INT-18 |
| INT-03 | docs/LifeTree.md | — | register section freezing D105/D115/D116 values verbatim (groups A–F) | new-addition | INT-01 |
| INT-03 | EXTERNAL: life-tree-design/SCHEMA.md §2.4 | already carries the register + D116 additions | stays authoritative as the amendment target; register freezes at the engine contract | EXTERNAL-amendment | — |
| INT-04 | docs/LifeTree.md | — | dev-tooling section: the D105 debug panel spec (playable register + palette), build-time-only, never shipped | new-addition | INT-01 |
| INT-04 | docs/Roadmap.md | no dev-tools item | M9 phase-0 B3 schedules the panel before any visual tuning | extends-existing | LifeTree.md §17; INT-01 |
| INT-04 | docs/DevelopmentWorkflow.md | no dev-only tooling section | documents the dev-only tuning panel as a build-time tool (no user surface) | new-addition | INT-04 |
| INT-05 | docs/LifeTree.md | — | stage clock + shared anchor in the derivation contract (D090/D101/D102/D100) | new-addition | INT-01 |
| INT-05 | docs/CoachSystem.md | anniversary anchor = first journal entry (:208-210) | anniversary = the shared birth anchor (D102) | extends-existing | INT-19 |
| INT-05 | docs/Gamification.md | anchor + six-domain presence + qualifyingEntry (§Gamification:171-236) | stage-year/ring-year vocabulary + shared-anchor cross-refs (D101/D102) | extends-existing | INT-19 |
| INT-05 | docs/Database.md | backup format v2 | frozen anchor rides the backup format (D098) — part of the formatVersion-3 set | extends-existing | INT-18 |
| INT-05 | docs/Roadmap.md | M7/M9 premises | M7/M9 premise amendments (anchor reads; stage-years vocabulary) | extends-existing | INT-19 |
| INT-06 | docs/UIUX.md | section screens have no tree linkage | journal/habits/nutrition/gym/goals/achievements screens gain organ-local states (duality); habit card = bud's local view (D112 DV-C5) | extends-existing | LifeTree.md §4 |
| INT-06 | docs/DesignSystem.md | tokens for M0 surfaces only | duality tokens: one animation language, two scales | extends-existing | INT-06 |
| INT-06 | docs/LifeTree.md | — | duality contract section (§2.1 outline §4) | new-addition | INT-01 |
| INT-06 | docs/Gamification.md | habit card / growth ladder | habit card becomes the bud's local view (mini-plant stages replaced by bud states) | extends-existing | INT-06 |
| INT-07 | docs/DesignSystem.md | ceremony absent; gold reserved for streaks | ceremony token set (ink/paper stamp + vault-cell glow; NOT confetti) + the ink-wash blush as the one saturation moment (D112) | extends-existing | LifeTree.md §10 |
| INT-07 | docs/UIUX.md | session screen + weight ladder have no ceremony refs | F-03 bract flourish + F-15 hero ring reference the shared ceremony language | extends-existing | INT-07 |
| INT-07 | docs/Gamification.md | PR milestones / weight-ladder copy | copy references the shared ceremony (F-03/F-15 deferral resolved) | extends-existing | INT-07 |
| INT-07 | docs/LifeTree.md | — | ceremony language spec (D094 moments + D106 no-bloom + D112 palette) | new-addition | INT-01 |
| INT-08 | docs/LifeTree.md | — | seasonal organ-state model + season-phase function (D085/D095) | new-addition | INT-01 |
| INT-08 | docs/UIUX.md | no seasonal states | seasonal render states (autumn leaf-fall, winter buds, spring flush) | extends-existing | INT-08 |
| INT-08 | docs/DesignSystem.md | no season palette | season palette tokens | extends-existing | INT-08 |
| INT-08 | EXTERNAL: SCHEMA.md §5 + LOOPHOLES.md | seasonality system locked | stays authoritative (amendment target for reconciliations) | EXTERNAL-amendment | — |
| INT-09 | docs/LifeTree.md | — | stage-transition UX spec (day-1 seed, germination, tick ceremonies, replay-on-open, why-panel schedule) | new-addition | INT-01 |
| INT-09 | docs/UIUX.md | no tree tab states | tree tab empty/transition states | extends-existing | INT-09 |
| INT-09 | docs/DesignSystem.md | motion tokens exist (durInstant/Fast/Slow + reduced-motion) | motion TIERS (FULL/REDUCED/NONE, D111 M-3) | extends-existing | INT-09 |
| INT-09 | EXTERNAL: LOOPHOLES.md (N-1 launch-day replay) | locked | stays authoritative | EXTERNAL-amendment | — |
| INT-10 | docs/LifeTree.md | — | ceremony engine spec: queue + per-device delivery + watermark semantics (D108(5)/D109 C-1/D097) | new-addition | INT-01 |
| INT-10 | docs/Database.md | no viewed_moments | synced `viewed_moments` user-state table (account-once + per-device) | extends-existing | INT-18 |
| INT-10 | EXTERNAL: SCHEMA.md (sync contract) | locked | stays authoritative | EXTERNAL-amendment | — |
| INT-11 | docs/LifeTree.md | — | launch-day spec + the D100 presence predicate (two-tier split) | new-addition | INT-01 |
| INT-11 | docs/Roadmap.md | M9 placeholder | M9 phase F anatomy views + time-lapse replay (D097) | extends-existing | INT-01 |
| INT-11 | docs/Database.md | no isBackfill | `isBackfill` column on the event schema (D113 IA-3) | extends-existing | INT-18 |
| INT-11 | EXTERNAL: SCHEMA.md presence predicate + INPUT-INVENTORY §12 | locked | stays authoritative (the forbidden-list mirror) | EXTERNAL-amendment | — |
| INT-12 | docs/LifeTree.md | — | restore/rederivation spec: three cases + guardrail + cache rule (D098) | new-addition | INT-01 |
| INT-12 | docs/Database.md | formatVersion 2 | formatVersion 3 + monotonic logFingerprint (D109 C-2) | extends-existing | INT-18 |
| INT-12 | docs/Roadmap.md | M10–M13 sync rows | M10–M13 rows reference formatVersion 3 + the viewed_moments table | extends-existing | INT-18 |
| INT-12 | EXTERNAL: SCHEMA.md (sync contract) | locked | stays authoritative | EXTERNAL-amendment | — |
| INT-13 | docs/LifeTree.md | — | read-surface contract: event log + own H3 owners ONLY; why-panel value law (four clauses) | new-addition | INT-01 |
| INT-13 | docs/CoachSystem.md | coach_outputs documented as the Coach's output store | payload-blindness: coach_outputs is NOT a tree input (structurally enforced); LLM render-never-decide reinforced | extends-existing | INT-16 |
| INT-13 | docs/Roadmap.md | M7 analytics cache | M7 records the cache-vs-log arbitration (tree derives from the log directly) | extends-existing | INT-13 |
| INT-13 | EXTERNAL: SCHEMA.md (read-surface contract) | locked | stays authoritative | EXTERNAL-amendment | — |
| INT-14 | docs/LifeTree.md | — | copy-engine spec (single place language lives; zero prose in state model) + sharing-safe collapse rules | new-addition | INT-01 |
| INT-14 | docs/UIUX.md | no sensitive-row collapse | sensitive rows (body/nutrition) collapse in screenshot/shared contexts | extends-existing | INT-14 |
| INT-14 | docs/CoachSystem.md | facts-only/no-LLM-narrative precedent | copy-discipline precedent reinforced for the tree's mirror | extends-existing | INT-14 |
| INT-15 | docs/LifeTree.md | — | identity/coherence spec: axis signatures, sibling fallback, D086 accents, 17-audit statuses | new-addition | INT-01 |
| INT-15 | docs/Gamification.md | achievement catalog = external v2 file (live source) | no-rename guarantee (D091) + the scan-time achievement-list feed recorded | extends-existing | INT-15 |
| INT-15 | EXTERNAL: ACHIEVEMENT-SCAN.md §1.5 + TRAIT-SPACE.md | locked inputs | stay authoritative (identity axis + the 17-audit) | EXTERNAL-amendment | — |
| INT-16 | docs/CoachSystem.md | self-contained authority; no ledger map | authority re-point: CoachSystem.md + L-10 + D103/D110/D111 + engine-2 rule-book session (§2.7) | restructures-existing | delta §5 |
| INT-16 | docs/LifeTree.md | — | branch detail surfaces the L-10 insight line (payload-blind mirror per D110) | new-addition | INT-01 |
| INT-16 | docs/Architecture.md | engine-2 discipline tied to Coach | engine-2 rule-execution architecture note (one catalog, strictness-parameterized) | extends-existing | INT-16 |
| INT-16 | docs/DecisionLog.md | D082+ records exist | rule-book-session records (D082+ entries at the session) | extends-existing | INT-16 |
| INT-17 | docs/CoachSystem.md | one Coach line per strictness (4 places) | weekly-message template restructure (3–5 lines; F-30 readouts + L-10 insight inside) | restructures-existing | F-24/F-30/L-10/N-13 |
| INT-17 | docs/UIUX.md | merged weekly check-in surface | weekly surface copy matches the template | extends-existing | INT-17 |
| INT-17 | docs/Architecture.md | readouts derived from owners | the readouts are derived from existing owners — zero new computation, no new surface | extends-existing | INT-17 |
| INT-18 | docs/Database.md | formatVersion 2; no tree-era columns | the ONE coherent schema set (§2.4) as one versioned migration block | new-addition | DecisionLog entries |
| INT-18 | docs/DecisionLog.md | D082+ recorded | D082+ entries for the schema set (one decision group) | extends-existing | INT-18 |
| INT-18 | docs/Roadmap.md | M10–M13 sync rows | M10–M13 reference formatVersion 3 | extends-existing | INT-18 |
| INT-19 | docs/DecisionLog.md | D085+ not recorded; D083 collision | D085–D117 register + D118/D119 renumber + D071 re-point (§2.8) | restructures-existing | D117 A1/H0 |
| INT-19 | docs/Gamification.md | anchor/qualifyingEntry premises | named amendments (§2.8) | extends-existing | INT-19 |
| INT-19 | docs/CoachSystem.md | anniversary + weekly lines | named amendments (§2.8) | extends-existing | INT-19 |
| INT-19 | docs/Roadmap.md | D060 closure at :283-288; M7/M9 premises | D060 override + premise amendments + M9 authoring (§2.3/§2.8) | extends-existing | INT-19 |
| INT-19 | docs/Database.md | — | the schema set lands here (INT-18) | extends-existing | INT-18 |
| INT-19 | docs/UIUX.md | — | tree tab + semantics contract (§2.2) | extends-existing | INT-01 |
| INT-19 | docs/Architecture.md | rollingWindowMean absolute claims | named amendments (§2.8) | extends-existing | INT-19 |
| INT-20 | docs/UIUX.md | no lookup section | verbatim "GUI research references" lookup section (milestone→research table) — Track 2, D2 executes | new-addition | Track-2 routing |
| INT-21 | docs/UIUX.md | no mobbin maps | the three verbatim mobbin dataset maps (file paths + screen counts, cited not embedded) | new-addition | INT-20 |
| INT-22 | docs/Roadmap.md | milestone homes per area | milestone homes per APP MAP area (reference only) | extends-existing | INT-22 |
| INT-22 | docs/DevelopmentWorkflow.md | no audit-anchor home | candidate home for the audit-anchor structure (audit-1..13) | extends-existing | placement is a B2/C decision |
| INT-22 | docs/DecisionLog.md | D082+ | audit findings recorded as decisions only when an audit runs | extends-existing | INT-22 |
| INT-23 | docs/Roadmap.md | audit-12 open | audit-12 (unlocks) stays an open item — nothing drafted | extends-existing (record-only) | — |
| INT-23 | docs/DecisionLog.md | — | NO entry — nothing decided (`_TO FILL_` guard) | extends-existing (record-only) | — |
| INT-24 | docs/LifeTree.md | — | design-feed note under anatomy/render references: L-15 grid is FEED ONLY, placement deferred to D117 D1/D2 | new-addition (record-only) | D117 D1/D2 |
| INT-24 | EXTERNAL: research-lifeos/MASTER-LifeOS-Research.md (R03 §11) | research source | stays the citation root | EXTERNAL-amendment | — |
| INT-25 | docs/LifeTree.md | — | implementation section mirroring the 10-step session plan + D117's phase sequence | new-addition | INT-01 |
| INT-25 | docs/Roadmap.md | M9 placeholder | M9 phases B–G + standing gates H0–H5 | renames-placeholder | INT-01 |
| INT-25 | docs/DevelopmentWorkflow.md | S021 gen-1 M2 Life Tree sequencing | S021 superseded by D117's M9 plan (reconcile at the docs pass) | REMOVAL (supersession) | D117 |
| INT-25 | EXTERNAL: life-tree-design/PLAN.md | living status record | stays the living status record (Step 3 done; 19 archetypes; steps 4–9 → M9) | EXTERNAL-amendment | — |
| INT-26 | docs/LifeTree.md | — | consolidated FROM the external sources (delta §1/§6) — the docs pass drafts by consolidating, never silently re-creating | new-addition | INT-01 |
| INT-26 | EXTERNAL: VISION/SCHEMA/LOOPHOLES/ACHIEVEMENT-SCAN/INPUT-INVENTORY/TRAIT-SPACE/PLAN/paper-run/audits/MASTER-Botany | authoritative detail | amendment targets executed with the sources (SCHEMA 2.4 rows, INPUT-INVENTORY §9/§14, PLAN.md statuses); DecisionLog.md:1201 note preserved | EXTERNAL-amendment | — |
| INT-27 | docs/DecisionLog.md | open items exist (D070) | the 17 research leftovers recorded as open deferred items (D038/D039 precedent) | extends-existing | INT-27 |
| INT-27 | docs/DevelopmentWorkflow.md | no no-go citations | cites the research anti-patterns as documented no-goes where nudges/gamification/AI are described | extends-existing | INT-27 |
| INT-27 | docs/CoachSystem.md | rule-book session deferred | rule-book session candidates referenced at activation, not drafted | extends-existing (record-only) | INT-27 |
| — | docs/README.md | provenance note lists the gen-1 set (2026-08-20) | provenance note lists BOTH generations (gen-1 2026-08-20 + gen-2 2026-09-26); doc map gains docs/LifeTree.md at G (delta §7/§8) | extends-existing | G Part-C |

---

## 4. REMOVAL rows (detail)

All REMOVAL rows require explicit Stage C sign-off (RUNBOOK C — "confirm the removal is intended, not an extraction error").

1. **tree-1 skeleton** (ledger:2355–2358) — REMOVAL as a drafting source; replacement: tree-7 + VISION.md §1–§2. Evidence preserved: the archived ledger keeps the skeleton text; life-tree-design/ holds the absorbed design.
2. **tree-2 skeleton** (2360–2369) — REMOVAL; replacement: VISION.md §3 + SCHEMA.md §2.3/§2.4/§2.5 + D088/D087. Evidence: same.
3. **tree-3 skeleton** (2371–2379) — REMOVAL; replacement: SCHEMA.md §2.6 + §3 + D107/D108. Evidence: same.
4. **tree-4 skeleton** (2381–2387) — REMOVAL; replacement: D094/D095/D099 + VISION.md §15. Evidence: same.
5. **tree-5 skeleton** (2389–2392) — REMOVAL; replacement: D111 + the register F9 perf gate. Evidence: same.
6. **tree-6 skeleton** (2394–2396) — REMOVAL; replacement: D117 + PLAN.md. Evidence: same.
7. **DecisionLog D071 "not a spec" verdict** (DecisionLog.md:894–908) — REMOVAL/supersession: the verdict text stays as history but is re-pointed; the M9 spec (docs/LifeTree.md + D085–D117) supersedes the "idea-recorded" status. Replacement lives in: LifeTree.md + Roadmap.md:878 (citation) + the DecisionLog D085–D117 records.
8. **DevelopmentWorkflow.md S021** ("LIFE TREE: … built DURING the Life Tree section build, M2") — REMOVAL/supersession: replaced by D117's M9 plan (the sequencing-notes block is archived history; the S021 row is amended, not deleted wholesale).
9. **Roadmap.md M9 placeholder premises** — supersession (not deletion): "no new tables" (:887/:900), "renders from the M7 owner catalog" (:896), "mockup in the UI/UX ordering pass" (:859) are replaced by the D107/D108/D109/D110/D117 facts (§2.3). The placeholder section itself is RENAMED into the full M9 spec.
10. **D091 flower-tier relabeling proposal** (ledger-internal) — withdrawn; the overlay supersedes; no docs content to remove (Gamification.md names stay exactly as-is).
11. **D099 N-6 mirror clause** ("derived coach_outputs facts do appear") — superseded by D110(1); inside LifeTree.md content, the read-surface exclusion replaces it.

D1/D2 removal discipline (RUNBOOK): removed content leaves an HTML comment naming the superseding decision ID; nothing is deleted without the comment.

---

## 5. Dependency chains

- **Chain A — LifeTree.md (flagship, 19 contributory rows):** DecisionLog D085–D117 recorded (INT-19) → external sources consolidated (INT-26) → state model (INT-02) → derivation protocol (INT-02) → register/triggers (INT-03) → seasonal + ceremony (INT-08/09/10) → launch-day + restore (INT-11/12) → privacy/copy (INT-13/14/15) → surfaces (INT-01) → handoff/M9 (INT-25). Nothing in docs/ may reference LifeTree.md sections before the doc exists; nothing in LifeTree.md may be drafted before DecisionLog carries the D-records.
- **Chain B — Database.md schema set (INT-18):** DecisionLog schema entries → formatVersion 3 + logFingerprint → isBackfill → adoptedAt → event-schema notes → viewed_moments → F/N/L-era fields → M10–M13 rows (INT-12/18) consume the format. The tree-cache table (INT-02) and the viewed_moments table (INT-10) both depend on this set.
- **Chain C — Roadmap M9:** M7 analytics owners (qualifyingEntry/streak/etc. — INT-05/13) + M8 Coach rule-book session (INT-16) → M9 phases B–G + gates H0–H5 (INT-01/04/11/25) → LifeTree.md §17 mirrors it. M9's exit criteria depend on the D117 standing gates + the D097/D098 contracts.
- **Chain D — CoachSystem:** INT-16 authority re-point → INT-17 weekly-message template (rule-book session) → the 12 conflicts #2/#5/#6/#10/#11 → the tree read-surface (INT-13). The four one-line amendments (#6) must land with the template, not before.
- **Chain E — the amendment register (INT-19):** all 12 conflicts + the seven-doc register depend on the docs pass assigning final D-numbers (D118+) and on DecisionLog D085–D117 being recorded first. The D060 override (#7) needs explicit human sign-off before any drafting.
- **Chain F — UIUX:** tree screen (INT-01) → identity-axis filters (INT-15) → dev-only panel (INT-04) → seasonal/ceremony states (INT-08/09) → weekly-surface copy (INT-17) → lookup section (INT-20/21). The tree screen depends on LifeTree.md (§10/§15/§16) + DesignSystem tokens + Roadmap M9.
- **Chain G — Track 2:** INT-20/21/22/23/24/25/26/27 route via this proposal + the D2 executor, NOT the per-row D1 path (INT brief footer 8; ledger PIPELINE self-directives).

---

## 6. Placeholder-reconciliation flags

Every superseded register value whose new home is life-tree-design/SCHEMA.md §2.4 (or an internal reconciliation) — flagged so no drafter copies the stale value:

1. **B2 = 20 → 15** (D115/D116 S1: the earlier record's 20 superseded; the register holds 15).
2. **A4 literal 365-day-window → CUMULATIVE-ACCRUAL** (D116 S2: ≥200 cumulative in-window days; the counter resets at 200; ~13.2 months for the every-other-day life).
3. **B4 single-branch ≥6 twigs (D114) → ≥2 stage-years AND ≥90 in-window days ANY-DOMAIN-MIXED** (D115/D116 D1).
4. **F4 RESOURCE ceiling 20 → 12** (D116 D3) + the event unit pinned (per-input-class events, one count each).
5. **D089 100-day spine referent → D116 D9 cadence armor** (spines = 26 consecutive weeks; thorns = 52 + tenure ≥2).
6. **D088 thorns 365-day referent → D116 D9** (same cadence-armor replacement).
7. **E2 buttress resource leg → balance ≥0.7 ONLY** (D116 D5 + the recording audit).
8. **D093 tenure floor reading → D090 stage-clock years** (the floor reads the tree's own years, not the six-domain ring brand).
9. **D097 N-7 backdating premise → D100 two-tier split** (citation corrected).
10. **D085 "ring closes at the year boundary" → the anchored window's boundary** (E3/D090 — never calendar-chopped).
11. **D085 "greener winter canopy" → D095 leaf-bud model** (a winter of logging makes the spring flush denser).
12. **D099 N-6 "derived coach_outputs facts" mirror → D110(1) payload-blindness** (the tree never touches coach_outputs).
13. **D091 relabeling proposal → withdrawn** (the overlay carries the flower thematic; trophy names/tiers stay exactly as they are).
14. **Roadmap M9 placeholder "no new tables" → D107/D108 persisted cache + D109 viewed_moments** (§2.3).
15. **M9 exit "renders from the M7 owner catalog" → the H3 owner FUNCTIONS, never the M7 cache tables** (D110(6)).

The register freezes at the engine contract (D116 LANDS); until then SCHEMA.md §2.4 is the live authority and the dev-tools tuning surface plays every value (D105).

---

## 7. Notes for Stage C (human review)

1. **REMOVAL sign-off** (§4) — confirm each supersession is intended; especially the D060 override (an amendment of a locked closure) and the M9 placeholder-premise supersessions.
2. **Draft-source verdicts:** L-15 (REFER — design feed), F-26 (not draftable — SKIPPED), INT-23 (nothing drafted), research leftovers (DecisionLog open items), the `_TO FILL_` sections (never invented).
3. **Decision numbering:** confirm the consolidated D085–D117 list + the D118+ assignment (RUNBOOK C: same-theme rows share one D-number; the D083/D084 → D118/D119 renumber is mandatory).
4. **IntegrationSequencingNotes.md placement** — already resolved gen-1 (folded into DevelopmentWorkflow.md; the standalone file is not an artifact of this run).
5. **Track-2 routing** — INT-20/21/22/23/24/25/26/27 go to the D2 executor, not the D1 per-row path.
6. **EXTERNAL-only targets** — SCHEMA.md §2.4/§2.5/§2.6/§3, INPUT-INVENTORY §9/§14, PLAN.md statuses, LOOPHOLES.md, ACHIEVEMENT-SCAN.md, TRAIT-SPACE.md are amended in their own files with the sources; docs/ never silently re-creates them (DecisionLog.md:1201 preserved).
7. **The Coach Consolidated Map cross-check (v6-final §5) is dropped** per delta §5 — the Coach authority re-point is §2.7.

---

*Stage B2 complete. Artifact: `docs/StructuralImpactProposal.md`. STOP — do not proceed to any later stage (Stage C or beyond) without human review.*