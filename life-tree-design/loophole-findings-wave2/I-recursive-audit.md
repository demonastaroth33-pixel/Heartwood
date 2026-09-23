# I — RECURSIVE META-AUDIT (Wave 2 · Operations Hunt)

**Audit date:** 2026-09-23 · **Auditor:** recursive meta-auditor (meta-lens)
**Inputs:** A-clock-integrity (15) · B-economics-scale (19) · C-device-state (14) ·
D-accessibility-surface (12) · E-design-vision (21) · F-input-map-clashes (38) ·
G-render-perf (22) · H-coach-privacy (13) — **154 findings: 35 CRITICAL · 77 MAJOR ·
42 MINOR.**
**Authorities re-checked:** TEMP-PLANNING tree-7 (D085–D099, verbatim L2403–L3068),
VISION.md (17 principles), LOOPHOLES.md, SCHEMA.md, INPUT-INVENTORY.md (§1–§16),
scan-outputs/01-data-layer.md, 04-roadmap.md (M9 L1248–1269, M11 L1286+, M13
L1334–1350, M7 qualifyingEntry L1002–1014), 02-achievements.md, 03-coach.md,
06-media.md, docs/Database.md backup format, lib/ (events table, repositories),
and the wave-1 meta-audit (loophole-findings/F-recursive-audit.md) for
non-duplication.

---

## 1. VERDICT ON THE HUNTS: **STRONG — MATERIAL PROGRESS, FOUR STRUCTURAL HOLES**

The eight hunts are the strongest pass yet: they read **code, not just docs**
(A verifies `writtenAt` is absent, C-device verifies the events table's columns
and the export format, H verifies `formatVersion 2` lacks the anchor and reads
`dashboard_providers.dart`, G numbers every render state against a concrete
draw-op budget), they each read and built upon wave-1 (F-recursive-audit) rather
than re-reporting it, and the finding set is **genuinely non-duplicative across
lenses** — A and C-device both arrive at `writtenAt` from opposite directions
(trust guard vs LWW ordering) without re-listing each other's findings.

Three of the eight are load-bearing beyond the rest: **F** (the input-map lens,
which owns the three deliverables the whole order anchors on), **A** (the clock
lens, which found that the design's operational-truth column does not exist),
and **C-device** (which found that the derivation's only reader contradicts the
sync plane's merge model). **G, B, D, H** are deep; **E** is the vision gate.

Four structural holes keep the set from being complete:

1. **No brief defines the tree-state DATA MODEL.** Every lens touches the derived
   cache (P-04/P-07/P-13, C-2 fingerprint, A M-3 invalidation, B M-03 rebuild,
   C-3 ordering) but none specifies the schema of the derived state itself —
   the Ring/Twig/Bud/Leaf/Flower/Fruit/Adaptation/Bank rows, their fields, their
   versioning, their write semantics. That is Step 6's core deliverable and it is
   the single biggest unexamined artifact in the whole program (see IA-1).
2. **No brief examines the app's own concurrency.** Two-device is covered
   (C-device); two **tabs** on one device (a shared SQLite-WASM file, two
   derivations, two ceremony queues) is not. In-session ceremonies (a transition
   firing while the user is mid-journal on another tab) is not. (IA-9, IA-10.)
3. **The retroactive boundary is split three ways.** A C-1 and B C-02 contradict
   (single-event backdating counts vs historical-backfill-mode never counts),
   and F's lens touches the class system but never arbitrates the two. This is
   the top inter-brief contradiction (§2.1) and it decides the anti-farm core.
4. **Several briefs build on an un-locked foundation.** The identity axis
   (ACHIEVEMENT-SCAN §1.5: families → inflorescences) is still TEMPORARY per
   F-24(c), yet E DV-C1/DV-C3/DV-M9 and B C-01/M-05 write flower-layer contracts
   on it; TRAIT-SPACE.md's trait drivers are unfilled placeholders (DV-C3) yet
   DV-C1/C-01 assume the envelopes; the roadmap's M9 "no new tables /
   Analytics-Engine-derived cache from M7" premises are contradicted by six
   wave-2 CRITICALs (§2.8) and reconciled by none.

**Counts check:** A 3/8/4 · B 3/10/6 · C 14 (4/6/4) · D 3/5/4 · E 5/12/4 ·
F 10/19/9 · G 4/12/6 · H 3/5/5 = 35 CRITICAL, 77 MAJOR, 42 MINOR, 154 total.
The 35 CRITICALs are enumerated and mapped in §3.

---

## 2. INTER-BRIEF CONTRADICTIONS

Eight direct contradictions between wave-2 lenses (plus one roadmap-vs-wave-2
contradiction). Each with the arbitration path.

### 2.1 [CRITICAL] A C-1 vs B C-02 — the retroactive boundary

- **A C-1:** single manually-backdated events DO count for the occurredAt organs
  (leaves + extension volume, ring/E3 windows, **stage ticks**, the birth anchor)
  — mirror gamification's two-tier split; only the dayKey organs (twigs, RHYTHM,
  dormancy, bud momentum) exclude them.
- **B C-02:** events written in historical-backfill mode (NU4's own bound: older
  than 24h) and adopted rows **NEVER count as qualifying** for the stage clock,
  ring years, or axes — extend the import exclusion to the legal backfill
  surfaces at the predicate level.
- **The collision:** the stage clock, the ring/E3 windows, and the axes are
  exactly the organs A says backdated events advance and B says backfilled
  events never advance. Both briefs cite locked texts (A cites D097(5) +
  N-7; B cites the forbidden list + NU4's "never extends streak/check-up
  compliance" + N-7 "document, don't special-case"). Neither cites the other's
  resolution; neither is a superset of the other.
- **Arbitration (proposed, feeds §6 order step 2):** the boundary is
  **recording-path**, not age: (a) **single-event manual backdating** (yesterday's
  workout, weekend paper catch-up of real life) = A's two-tier rule — counts for
  volume/tenure organs, never for presence/streak-like organs; (b) **bulk /
  historical-mode / adopted / imported surfaces** (NU4 historical mode, M13
  adoption, J3 import) = B's exclusion — never qualifying, never stage-advancing,
  excluded from anchors and windows. The one predicate must be computable (this
  requires the missing flags — see IA-3/IA-4). One DecisionLog entry amends both
  D097's "advances honestly" and the forbidden list's blanket line; the current
  "consistent with all locks" claim is false as written (A C-1's point stands).

### 2.2 [CRITICAL] A M-5 vs F-36 (+ H-04) — does protected absence have a derivation effect?

- **A M-5:** protected-absence days (periods ∪ deload ∪ quiet-weeks ∪ rest_planned)
  are a real data input: RHYTHM counts protected weeks **neutral** (variation
  ignored), twig production treats protected months **as presence**, dormancy
  never triggers from protected days. Aligns with wave-1 B M-4 ("rhythm-neutral").
- **F-36:** quiet weeks are a **display modifier only** — "zero effect on any
  derived streak/presence semantics"; "all presence/streak/stage derivation
  ignores them." H-04 then says "derivation unchanged (B M-4 protected absence)".
- **The collision:** A M-5 makes quiet weeks move the RHYTHM axis and the twig
  clock (derivation); F-36 forbids any derived effect (display only). A week of
  protected absence is either a RHYTHM-neutral week (A) or a raw zero-activity
  week that spikes the bursty axis (F-36). The two demand opposite axis behavior.
- **Arbitration:** wave-1 B M-4 is the precedent and says rhythm-neutral — A M-5
  is the continuation; F-36's own "never shield streaks" concern is about
  **streak semantics**, which the neutral-week rule does not touch (the RHYTHM
  axis is not the streak system). Adopt A M-5's data union + neutrality, and
  F-36's copy constraint ("display modifier" for the ceremony/copy layer) as the
  H-04 shared-quiet-discipline's copy half. The distinction to lock: neutrality
  for the tree's own rhythm/dormancy math, zero shielding of gamification streaks.

### 2.3 [MAJOR] A M-4 vs C-device C-3 — the derivation's ordering key

- **A M-4:** the derivation consumes events in TOTAL order — occurredAt ASC,
  id ASC (stable across restore); the repository gains a secondary sort.
- **C-device C-3:** occurredAt is user-declared and backdatable — it must NEVER
  be the ordering key; the derivation is a **commutative fold over per-entity
  resolved final states** keyed by (writtenAt, deviceId), immune to union order.
- **The collision:** A's total order is exactly the time-ordered replay C-3 calls
  structurally unsafe under sync. They partially reconcile (A M-4's "per-type
  replay keyed by entityId makes most equal-timestamp collisions order-
  irrelevant" IS C-3's fold) but the contract must pick one as primary.
- **Arbitration:** C-3 wins the *ordering* argument (occurredAt is story time;
  the design's own trust model already names writtenAt as the operational key);
  A M-4's contribution survives as (a) the intra-entity fold's deterministic
  tie-break (id ASC) and (b) the repository query's explicit secondary sort for
  the fold's stable iteration. The ENGINE-CONTRACT states: **per-entity final-state
  fold, keyed (writtenAt, deviceId), iterated in (id ASC)** — one line, both
  briefs satisfied.

### 2.4 [MINOR] A M-8 vs C-device M-1 — the anchor's field and recomputation policy

A M-8 freezes the anchor as the counting event's **dayKey string, never
recomputed**; C-device M-1 computes MIN(occurredAt) over the merged set, **ratcheted
monotonically** (recomputed on merged-log boundary changes, only ever moving back
when the min's tombstone arrives). Different anchor basis (dayKey vs occurredAt)
and different recomputation policy. Arbitration: the anchor is stored as the
**counting event's dayKey** (A M-8, TZ-neutral, consistent with A M-1's "derivation
never uses occurredAt's absolute instant"), and C-device M-1's ratchet governs the
only legitimate mutation — the tombstone-arrives-later case. The value stored is
the dayKey; the *consensus* over devices is the ratchet.

### 2.5 [MINOR] G P-02 vs D M-3 — the petal/particle cap number

G caps the bloom-rain at **~150 shader-free petals**; D M-3 caps the particle
layer at **≤120 particles**. One number must win in the engine contract (a
petal IS a particle; a renderer cannot honor two caps). Arbitrate at the
perf-budget lock (G P-05): adopt **120** (the tighter, a11y-derived bound) as
the hero-canvas particle ceiling, with G P-02's "shader-free sprite" mechanism
as the implementation.

### 2.6 [MINOR] G P-15 vs D M-3 — the motion-tier taxonomy

G defines FULL / REDUCED / STATIC as render-budget rungs (REDUCED = LOD-0 canopy
mass + halved particles, still rendered); D defines FULL / REDUCED / NONE as
motion rungs (REDUCED = instant end-states + the three locked tolerances, bloom
rain replaced by announcement; NONE adds an in-app no-motion tier G lacks).
Different REDUCED semantics, different ladder lengths. Arbitration: unify into
**one three-rung ladder driven by BOTH the OS signal and the runtime FPS monitor**
(FULL = budgeted + particles · REDUCED = LOD-0 mass + halved particles + no
particle rain + instant end-states except the locked 300ms/2s tolerances ·
STATIC/NONE = end-state picture + announcement). D's "some life" middle-path
users fold into FULL-with-halved-particles (D's own mechanism). One ladder in
the engine contract, not two.

### 2.7 [MAJOR] B m-03 vs F-29 — the twig presence bar

B m-03 locks the twig tick as "one calendar month with **≥1 qualifying day**"
(the month granularity D088 implies). F-29 demands a "sustained" floor of "**≥N
qualifying days** (suggest N=4)" and flags that ≥1 is the anti-farm weak bar.
Direct numeric contradiction on a stage-clock tick input (SEEDLING→SAPLING reads
it). Arbitration: F-29's N≥2..4 is the honest reading of "sustained"; B m-03's
"monthly granularity" point survives as the *bucketing unit*. Lock one number in
the threshold register (§6 step 2b).

### 2.8 [MAJOR] Roadmap M9 premises vs six wave-2 CRITICALs — "no new tables," "Analytics-Engine-derived cache from M7"

Roadmap M9 (04-roadmap L1256–1259): "never a write-path entity, **no new tables**,
imports never grow it"; and L1257 "100% derived from … (Analytics-Engine-derived
cache from M7)." Six wave-2 CRITICALs each require schema: G P-04 (a persisted
**derived-cache table**), C-device C-1 (a **viewed_moments table**), C-device C-2
(a cache **fingerprint** field), C-device C-3 (**writtenAt + deviceId + syncSeq**
columns, schemaVersion 2), H-10 (**accountAnchor** field, formatVersion 3), A C-3
(**writtenAt** column). The roadmap's locked premises are dead on arrival; nobody
reconciled them. Also "Analytics-Engine-derived cache from M7" vs the briefs'
"the tree derives from the event log + H3 owners" — if the tree literally reads
M7's cache rows, the tree's correctness inherits M7's cache invalidation, its
O(1) incremental path (P-07) is impossible, and H-02's "sibling consumer of the
owners" rule is violated (see IA-8). Arbitration: the roadmap line is amended at
the engine-contract step — the tree's cache is a first-class read-model table
(D098(5) "regenerable" preserved); the tree is a **sibling consumer of H3 owners,
never a reader of M7's cache tables**.

**Reconciliations that LOOK like contradictions but are not** (recorded so the
implementer does not re-litigate): A C-3's `writtenAt` vs C-device C-3's
`writtenAt + deviceId` (converge — combine into the one additive migration);
D085's "ring closes at the year boundary" vs D090 C's "never chopped at Dec 31"
(A M-1's count-vs-visual split); the four anchor definitions (A C-2/M-8, F-04,
H-01, C-device M-1 — converge on ONE shared frozen account anchor + ratchet);
D C-1's per-organ semantics at LOD-0 vs G P-01's silhouette-only LOD-0 (D M-1's
merged hit-area/semantic map is the reconciliation: clusters ARE the semantics
at mass scale); B C-01 (one legend transformation) vs E DV-M9 (same-family
flowers must differ) — converge on rank rule + per-user morphology accents.

---

## 3. THE CONVERGENCE MAP — the shared root causes (35 CRITICALs mapped)

Eight root-cause clusters. Every CRITICAL maps to one; a few straddle. The
*meta-root* under all eight: **the locked design is a set of decisions whose
operational semantics — schema columns, numbers, data stores, ordering rules —
were never written down.** A C-3 ("the guard cannot be built"), C-device C-3
("the design's own operational-truth concept has NO column"), G P-05 ("no budget
number exists anywhere"), B C-03 ("every bound deferred to Step 8"), IA-1 (no
state model) are all the same disease in different organs.

### R1 — THE CLOCK & THE ANCHOR (one birth date, one clock, one "qualifying year") — 8 CRITICALs
**A C-2** (destructible anchor) · **A C-3** (unwritable clock guard) · **F-03**
("qualifying year" × 3 meanings) · **F-04** (birth-anchor contradiction) ·
**F-29** (twig presence bar undefined) · **F-30** (any-domain qualifying year
undefined) · **F-31** (POLE→MATURE threshold placeholder) · **H-01** (three-way
birth-date contradiction). Feeds: A M-1/M-8/m-3/m-4, B M-07/C-03/m-03, C-device
M-1/M-6, F-32. Same root as wave-1 root causes 1–4, now precisely dimensionalized
(writtenAt absent, dayKey vs occurredAt, timezone, backdating).

### R2 — THE RETROACTIVE / BACKFILL BOUNDARY (the anti-farm) — 2 CRITICALs
**A C-1** (two locked texts contradict) · **B C-02** (rings farmable via legal
backfill surfaces). Feeds: A m-1 (future-dated), B M-09 (adopted media),
B m-03. Overturns wave-1 N-7's "no tree-specific guard, documented" — the wave-1
resolution waved through exactly the farm A C-1 names.

### R3 — THE DERIVATION ENGINE (order, increment, cache, invalidation) — 4 CRITICALs
**C-device C-2** (no cross-device cache invalidation) · **C-device C-3**
(time-ordered replay vs async-merged set) · **C-device C-4** (restore × sync) ·
**G P-04** (no persisted incremental cache). Feeds: A M-3/M-4/M-6/M-7, C-device
M-1, B M-03/m-04/m-05, F-14. The wave-1 "regenerable cache" (N-2) resolved the
restore case on a single device; the merged-log dimension is new.

### R4 — THE ECONOMY WITHOUT NUMBERS (scale, caps, rarity) — 2 CRITICALs
**B C-01** (transformation layer unbounded/unranked) · **B C-03** (every bound
deferred to Step 8). Feeds: B M-01…M-10, G P-05/P-13, E DV-M9. The numbers are
load-bearing at 20 years and none exist.

### R5 — THE INPUT → ORGAN MODEL (5 branches vs 6 domains, class drift, trigger authority) — 5 CRITICALs
**F-01** (PR ceremony → non-achievement flowers) · **F-02** (body has no organ
home) · **F-05** (class 7 definitional drift) · **F-17** (domain-set mismatch) ·
**F-23** (trigger authority contradicts its own adaptation map). **H-03** straddles
R5/R6 (the mycorrhizal feed is undefined AND the input map feeds opt-ins into it).
Feeds: F-06…F-16, F-18…F-28, F-32…F-38, B C-02.

### R6 — THE PRIVACY / COPY BOUNDARY (what the tree may show) — 1 CRITICAL
**H-02** (D099's "coach_outputs facts" has no implementable referent) + **H-03**
(straddles). Feeds: H-04…H-13, F-10, A M-6. Deepens wave-1 N-6 (MINOR → CRITICAL:
the payload is text in all 9 kinds, LLM or rule).

### R7 — THE DESIGN-IDENTITY & UNIQUENESS ENVELOPE — 5 CRITICALs
**E DV-C1** (flowers/fruits outside the coherence envelope) · **E DV-C2** (bloom
palette unreconciled) · **E DV-C3** (full trait utilization not delivered) ·
**E DV-C4** (uniqueness collapses for similar lives) · **E DV-C5** (habit surface
contradicts the bud model; "Heartwood" × 4). Feeds: DV-M1…M12, DV-m1…m4, D m-2,
B M-05/M-09/M-10.

### R8 — THE SURFACE & FIRST-PAINT EXPERIENCE (a11y semantics + render budget) — 6 CRITICALs
**D C-1** (no semantics surface) · **D C-2** (no transition announcements) ·
**D C-3** (season is color-only) · **G P-01** (no LOD ladder) · **G P-02** (first
bloom unbudgeted) · **G P-03** (autumn leaf-fall catastrophic). Feeds: D M-1…M-5,
D m-1…m-4, G P-06…P-16, G m-1…m-6. The a11y and the render share one cure: the
state model drives both the semantics tree and the paint (D C-1's "one source,
two outputs" IS G P-01's LOD in the a11y domain).

### R9 — THE DEVICE-STATE / ONCE-NESS — 1 CRITICAL
**C-device C-1** (the viewed-watermark is per-install). Feeds: C-device M-2/M-3,
C-device m-1/m-4, D C-2 (announcement-once), E DV-M6. New vs wave-1 (which assumed
a single-device per-session watermark, N-1(d)).

**The 35 CRITICALs, placed:** R1 = 8 (A C-2, A C-3, F-03, F-04, F-29, F-30,
F-31, H-01) · R2 = 2 (A C-1, B C-02) · R3 = 4 (C-device C-2, C-3, C-4, G P-04) ·
R4 = 2 (B C-01, B C-03) · R5 = 5 (F-01, F-02, F-05, F-17, F-23) · R6 = 1 (H-02)
· R7 = 5 (DV-C1…C5) · R8 = 6 (D C-1, D C-2, D C-3, G P-01, P-02, P-03) ·
R9 = 1 (C-device C-1); **H-03 straddles R5/R6** — 34 + 1 = 35. ✓

---

## 4. LOCK-COVERAGE GAPS

Every lock D085–D099, every vision principle, the 7 classes, the 9 achievement
families, the stage model, and the stage×class matrix were checked against the
eight briefs. **Coverage is materially better than wave-1** (the wave-1 G-1…G-7
gaps are all closed: backup/restore is now covered by A/C-device/H, M9 placement
by E DV-M1, backdating by A C-1/B C-02, the coach mirror by H-02/F-10, the
habit-bud cap by B m-02/D C-1, L-06 by F-21). Five gaps remain:

| # | Lock / element | Who missed it | Why it matters |
|---|---|---|---|
| G-1 | **The stage×class matrix's SEED/SEEDLING "banked" cells for classes 1–5** (content/completions/measurements/dates/goals at SEED). Only class 6's banking (D092/D096 achievement buds) and the D094 strip are specified; what a "banked" journal entry, a "banked" completion, a "banked" weigh-in, a "banked" dated event, and a "banked" goal LOOK like at SEED is defined nowhere. | ALL EIGHT | The matrix's founding promise ("data is never lost or unrewarded — banked") has a manifestation contract for exactly one of seven classes. |
| G-2 | **Achievement families IV (nutrition) and VI.** E DV-C1 touches nutrition only as a Piper-anchored spadix mention; F-17 flags "VI/IX → their attachment rule" as a to-do and resolves nothing. Families IV and VI have no resolved flower identity, attachment rule, or stage schedule. | ALL EIGHT | The identity axis's completeness claim (F-24(c)) is unverifiable for two of nine families. |
| G-3 | **D098(4)'s restore "compressed re-growth" ceremony.** C-device C-4 covers restore×sync semantics, H-10 covers the anchor, G P-08 covers the rebuild — but the *designed transition* itself has no watermark momentId (C-device C-1's `viewed_moments` list omits it), no motion tier (G P-15's list omits it), no a11y announcement (D C-2's list omits it), no quiet-week copy rule (H-04). | ALL EIGHT | The one ceremony the locked contract explicitly designs (D098(4)) is invisible to the three ceremony contracts. |
| G-4 | **Constraint-register line "NO user-effort input — F-09 is the sole effort signal."** F-09's tree destination is class 3 with no destination ("the sole effort signal" — into what organ?). No brief re-verified it. | ALL EIGHT | The single locked effort signal has no tree mapping row. |
| G-5 | **The identity axis itself (ACHIEVEMENT-SCAN §1.5) is still TEMPORARY/unlocked** (F-24(c) admits it), yet E DV-C1/DV-C3/DV-M9 and B C-01/M-05 build flower-layer contracts on it. | E, B, D (build on it) | A pre-lock dependency: the flower layer's foundation is not locked, so the flower contracts float. |

Also recorded: the roadmap's M9 "no new tables / M7-cache" premises are an
unreconciled lock (contradiction 2.8), and the identity axis's approval is the
precondition for the flower-layer cluster (R7) to close.

---

## 5. NEW BLIND-SPOT FINDINGS (numbered · severity · location · proposed resolution)

Nine candidates were hunted adversarially; every one yielded a new finding
(no empty result). Ten new findings (IA-1…IA-10).

### IA-1 — CRITICAL · THE TREE-STATE DATA MODEL IS UNDEFINED ANYWHERE (Step 6's core)

**Location:** SCHEMA.md §3 ("derived cache" — one line); D098 ("regenerable
cache"); G P-04/P-07/P-13 (cache storage *costs*); C-device C-2 (cache
*fingerprint*). **What was found:** every lens assumes the derived state exists
as *something*; no doc defines the schema of the derived tree state itself — the
Ring, Branch, Twig, Bud, Leaf/LeafCluster, Flower, Fruit, Spur, Adaptation,
Bank rows: fields, types, the per-organ granularity, the version field, the
write/update semantics, the snapshot projection (G P-06 needs a *structural*
serialization), the why-panel's per-organ derived strings' source, and how the
running aggregates (P-07) map into rows. Without it: the perf budgets (≤1ms/event,
P-05), the checkpointed character (P-09), the fingerprint invalidation (C-2),
the snapshot economy (P-06), and the a11y semantics model (D C-1 — "built from
the SAME tree-state model") have no place to land; D C-1 and G P-01's shared-LOD
premise is unbuildable. **Resolution:** make the state model the FIRST deliverable
of Step 6 (engine architecture): a versioned, Drift-backed schema with (a) a
`derived_version` integer bumped by the P-09 checkpoint events (stage transition,
year boundary, annual bloom, restore) and the fingerprint (C-2); (b) a stable row
per organ family with a `snapshot_projection` flag marking the rows the D097
snapshot serializes (structural only, G P-06); (c) per-organ semantic fields
(semanticLabel/semanticStatus — D C-1) stored as derived text, NOT recomputed in
the widget layer; (d) the running-aggregate accumulators (P-07) as the cache's
base layer, with materialized organ rows on top.

### IA-2 — MAJOR · THE DERIVED-COPY ENGINE HAS NO LOCALIZATION / NON-ASCII CONTRACT

**Location:** every locked copy line is English — D094's why-panel lines, D095's
season copy, D096's bank counter, D097's narration + legend card, D099's
"resting", D C-1/D C-3's semantic labels and season-line grammar, H-05's value
law, D M-4's education ladder. **What was found:** the tree's copy is **derived**
(templated from data — the portrait sentence, "year N of your life", "12 buds in
this cluster", "2029 — your first year") and no brief examines (a) whether it is
a locale-keyed template engine or hardcoded English; (b) how dayKey-derived
month/season names, plural rules ("1 bud" vs "12 buds"), and numeric separators
localize; (c) user-authored content that is non-ASCII — goal titles (H-07 allows
goal titles on zoom, class 5), area slugs, tags, habit names — rendered in/next
to derived copy; (d) CJK/RTL text metrics on the canvas (D m-4's numbers-never-
truncate rule assumes Latin). Single-user does not mean ASCII-only or English-
only. **Resolution:** one Step-8 contract row: the derived-copy engine is a
keyed template system (locale-parameterized, plural/date/number rules); user
content renders only where the sharing-safe law (H-07) already permits it, with
text-paint metrics verified in the seeded tests for at least one non-Latin
script; the a11y semantics (D C-1) and the announcements (D C-2) read the same
localized strings.

### IA-3 — CRITICAL · B C-02'S WRITE-TIME EXCLUSION IS UNIMPLEMENTABLE: THE NU4 BACKFILL FLAG IS NOT A STORED COLUMN

**Location:** B C-02's proposed predicate-level exclusion for "historical-
backfill mode" (NU4); nutrition_logs source enum = manual / scanner / fooddb /
packed / scale (01-data-layer L203 — no `backfilled` value); the mode is a
*write-time* decision ("OLDER = historical mode"), not a stored attribute.
**What was found:** the tree's FOOD qualifyingEntry = "≥1 real logged item" on its
occurredAt day. A historical-mode meal is a `nutrition.logged` row like any
other; nothing on the row marks it backfilled, so the tree's predicate cannot
distinguish "legal backfill of real life" from "manufactured qualifying day" —
B C-02's own fix cannot be computed. **Resolution:** additive schema change —
`nutrition_logs.source` gains the value `backfilled` (or a `backfillMode` flag),
set when NU4's historical mode is used; the tree's qualifying predicate reads it;
the E3 ring and the six-domain brand then exclude backfilled food days exactly as
B C-02 intends. Same for any other backfill surface at write time (see IA-4).

### IA-4 — CRITICAL · M13 ADOPTION HAS NO ADOPTION-TIME STAMP: "QUALIFIES FROM ADOPTION DATE FORWARD" IS UNCOMPUTABLE

**Location:** B C-02/M-09's "adopted rows qualify from the adoption date forward
only"; media_attachments columns (06-media L83): `capturedAt, adopted` — no
`adoptedAt`. **What was found:** an adopted PC folder's rows ride the file's
`capturedAt` (original date, possibly years old). If the tree's MEDIA qualifying
day = the row's dayKey and the dayKey derives from `capturedAt`, adoption
backfills media-domain qualifying days across years — exactly the vector B M-09
names — and the "forward-only" fix needs an `adoptedAt`/adoption-dayKey to anchor
it. Without the column, B M-09's fix is a sentence. **Resolution:** additive
`adoptedAt` on media_attachments, set at adoption; the MEDIA qualifyingEntry
reads `max(capturedAt, adoptedAt)` for adopted rows (or, per B M-09, the adoption
day only); the why-panel's "adopted — shows in the archive, doesn't grow the tree
backward" line (B M-09) is then computable.

### IA-5 — MAJOR · THE FOUR GRADIENT AXES' IMPORT-FILTER IS UNSPECIFIED: AN IMPORTED BATCH CAN SKEW THE AXES

**Location:** SCHEMA.md §3 axes ("0.0–1.0, derived from the event log"); B C-02
covers qualifying entries only; A C-1 covers the two-tier organs. **What was
found:** the RESOURCE axis = "average logging volume per active day" and the
RHYTHM axis = "variation of weekly activity" — both read raw event volume. Imports
(J3, batches, and B C-02's surfaces) land as events; if the axes' volume terms
count imported events (nothing says they do not), a single import/restore day
spikes RESOURCE and RHYTHM ("bursty") and the tree's character shifts at the next
P-09 checkpoint from data that "never counts." The import exclusion exists at the
qualifying-entry predicate (M7) but is **never stated for the axes' raw-volume
terms**. **Resolution:** one clause in the derivation contract: every axis term
(resource volume, rhythm variation, balance distribution, tenure years) computes
over non-imported, non-backfilled, non-adopted events only — the R2 boundary
applied to the axes explicitly, not just to qualifying entries.

### IA-6 — MAJOR · THE DERIVATION'S READ SURFACE MUST EXPLICITLY EXCLUDE GAMIFICATION/ANALYTICS TABLES, AND THE SHARED PREDICATES MUST HAVE ONE OWNER

**Location:** A M-6 defines the read surface (log + a closed list of joins);
D088's trigger authority (achievements); M7's analytics cache (dayDomainPresence,
qualifyingEntry, streaks); xp_transactions and trophy rows. **What was found:**
(a) nothing states the tree never reads gamification/analytics *derived* tables
(xp_transactions, streak rows, trophy rows, M7 cache rows) — a lazy implementer
feeding the D088 trigger authority from the trophies table rather than
`achievement.unlocked` events violates D098's "pure function of the log"; (b) the
tree and the achievement engine share predicates (dayDomainPresence E6/E1,
qualifyingEntry) but each may compute them from different sources at different
bars (the tree's F-29 presence bar vs E1's bar) — the D060 parity rule ("a number
never differs") has no cross-engine corollary, and G P-14's single-cache
discipline is tree-internal only. **Resolution:** the ENGINE-CONTRACT's read
surface names the log + H3 owner outputs + the closed join list (A M-6), and
states the tree consumes the owners' *predicates* (never their cache tables, never
xp/trophy rows); one owner per shared predicate (the H3 owner), consumed by both
the achievement engine and the tree — the IA-8 sibling rule, generalized.

### IA-7 — MAJOR · THE DERIVED-CACHE / SNAPSHOT LIFECYCLE OVER DECADES IS UNDEFINED (schema migration, storage eviction, the 40-year replay arc)

**Location:** G P-04 (persisted versioned cache), G P-06/m-2 (snapshots,
~20–30 cap), B m-01 (replay pacing at 40y). **What was found:** three lifecycle
questions no brief answers: (a) **schema migration** — the cache is "versioned"
(P-04) and rebuildable (D098(5)), but every additive app update (writtenAt,
deviceId, backfilled flag, adoptedAt, the R2 flags above) bumps the *event* schema;
the cache's migration/rebuild-on-version-bump cadence across 20 years of updates
is unspecified; (b) **OS storage-pressure eviction** — on a low-storage phone the
OS may evict IndexedDB; the cache and baked pictures are regenerable, so the cost
is a surprise full rebuild (G P-08's chunked pipeline) with no "storage
regenerated" notice; (c) **the replay arc past the snapshot cap** — at 40+ years
the ~20–30 snapshot cap (m-2) drops the early decades, so the D097 "watch your
whole logged life grow" promise degrades to "watch your last 30 years" with
nothing stated. **Resolution:** contract rows — cache version = f(event schema
version), rebuild is chunked (P-08) and gated by the fingerprint; a storage-
pressure rebuild notice ("rebuilding your tree's archive — your storage was
cleared"); the snapshot cap policy states the replay's scope honestly (cap +
regen, "your first years re-derive on demand").

### IA-8 — MAJOR · ARBITRATE THE TREE'S INPUT SOURCE: ROADMAP'S "M7 CACHE" vs THE BRIEFS' "LOG + H3 OWNERS"

**Location:** roadmap M9 L1257 ("Analytics-Engine-derived cache from M7");
H-02's "sibling consumer of the owners"; C-device C-2 (fingerprint on the merged
log); G P-07 (O(1) incremental). **What was found:** the roadmap's literal reading
makes the tree derive from M7's cache — a two-level cache coupling where M7's
invalidation semantics, schema, and staleness become the tree's correctness, the
O(1) incremental path (P-07) is impossible, and H-02's "sibling, never a mirror"
rule is violated. If instead the tree is a sibling deriver from the log (the
briefs' consensus), the roadmap line must be amended. **Resolution:** the roadmap's
"Analytics-Engine-derived cache from M7" is re-read as "the tree consumes the M7
engine's H3 owner *predicates* (dayDomainPresence, qualifyingEntry, yearlyPass)
and derives its own cache from the log" — one shared predicate set (IA-6), two
sibling caches; DecisionLog entry at Step 6.

### IA-9 — MAJOR · NO IN-SESSION CEREMONY STATE MACHINE: A TRANSITION FIRING MID-COMPOSITION HAS NO INTERRUPTION RULE

**Location:** D094(3) "plays live if the app is open, else queued"; C-device C-1
(the watermark, per-device); D C-2 (announcements); G P-15 (frame budgets).
**What was found:** "the app is open" ≠ "the tree tab is in view." The annual
bloom (the year's biggest moment, calendar-guaranteed per D092(4)) can fire while
the user is mid-journal on the compose screen, mid-session on the gym tab, or
mid-settings. No brief defines: (a) whether a ceremony interrupts the active
surface (it must not), plays in a corner, or queues; (b) the pre-emption rule —
if the user navigates away mid-bloom, does the ceremony finish, freeze, or skip
(and does the watermark count it viewed)?; (c) the "grew while you were away"
card's in-session delivery; (d) the reduced-motion in-session fallback. The
ceremony state machine (queued / playing / pre-empted / viewed) is a real
engine-contract gap, and it interacts with the watermark (C-1) and the
announcement-once discipline (D C-2). **Resolution:** the D094 delivery contract
gains an explicit state machine: ceremonies render on the tree tab only;
elsewhere they queue to the D094 card (coalesced per C-device C-1/E-ux M-7);
pre-emption = the ceremony finishes its current frame-cost step and marks the
moment *viewed* only if the user watched ≥ the first step; the bloom's announcement
(D C-2) delivers in-tab regardless of surface. One row in the engine contract.

### IA-10 — CRITICAL · THE TWO-TAB RACE: ONE DEVICE, TWO FLUTTER INSTANCES, ONE SQLITE-WASM FILE — NO CONCURRENCY CONTRACT

**Location:** drift_flutter web (single sqlite3 WASM file in IndexedDB, shared
across tabs); G P-04 (persisted cache); C-device C-1 (viewed_moments, a synced
table); C-device C-3 (LWW on the merged set — two *devices*). **What was found:**
a PWA user can open two tabs/windows of the app on one device. Two Flutter
instances then share ONE sqlite3 file: (a) SQLite locking/`SQLITE_BUSY` on the
shared WASM file under concurrent writes; (b) **two derivations** — both tabs run
the incremental cache; the running aggregates (P-07) and the cache rows can
double-apply or clobber depending on write interleaving; (c) **two ceremony
queues** — both tabs read "unviewed transitions" from the watermark table and
both deliver (the C-device C-1 account-once rule is per-device by construction,
and two tabs are one device); (d) viewed_moments write races. Nothing in the docs
prevents two tabs or defines the winner. **Resolution:** either (i) enforce
single-instance (a service-worker/navigator.locks or BroadcastChannel guard —
"the app is open in another tab" with the second tab surfacing a read-only notice)
or (ii) define the concurrency contract (one writer tab holding the derivation,
other tabs read-only cache consumers; the watermark writes serialized). Recommend
(i) — single-user app, cheapest correct answer; note it in the M9 + M11 contracts
and in the PWA persistence gate's browser test (two tabs is a Playwright-checkable
boundary).

**Candidate (g) — tree-tab placement — verified as covered** (E DV-M1 owns the
meta-UI shell question; the roadmap defers nav placement to the M8-closing ordering
pass, so the lock itself is scheduled); **candidate (e) — archiving/disk growth —
verified as bounded** (G P-06/P-13/m-2 quantify snapshots to ~1.5–3MB and cap at
20–30; the residual lifecycle questions are IA-7).

---

## 6. THE RESOLUTION ORDER (what unblocks what)

Anchored on **F's three input-map artifacts** (canonical domain table, threshold
register, trigger correlation table), per the task's direction. D-numbers in
brackets are the decisions each step must mint.

**Step 0 — Arbitrate the inter-brief contradictions** (before anything else:
every downstream rule reads one of these boundaries).
- The retroactive boundary — A C-1 × B C-02 → ONE recording-path rule
  (single-event backdating = A's two tiers; bulk/historical/adopted/imported =
  B's exclusion) [D100, amends D097(5) + INPUT-INVENTORY §12].
- Protected absence — A M-5 × F-36 × H-04 → data union + neutrality for the
  tree's math, display-only for copy, zero streak shielding [D101].
- The ordering key — A M-4 × C-device C-3 → per-entity final-state fold, keyed
  (writtenAt, deviceId), iterated (id ASC) [D102, ENGINE-CONTRACT line].
- The twig bar (B m-03 × F-29), the particle cap (G P-02 × D M-3), the motion
  ladder (G P-15 × D M-3), the anchor field (A M-8 × C-device M-1) → one number /
  one ladder / one field each [fold into the threshold register, Step 2b].
- **Unblocks:** every step below reads one of these five contracts.

**Step 1 — The input map's three artifacts (F's deliverable) — the anchor of the
order.**
- **1a. The canonical domain table** (resolves R5): branch × presence-domain ×
  achievement-family × flower-attachment × twig-source × organ home — body→gym
  (F-02), media→journal leaf layer (F-17), goals presence owner (F-38), family
  IV/VI/IX attachment (G-2, F-17), class-7 sub-behaviors (F-05), class-1/2/5
  dual-feed discounts (F-07/F-08/F-19/F-18).
- **1b. The threshold register** (resolves R1's numbers + R4): every undefined
  bar with candidates for user approval — twig presence N (F-29, ≥2–4),
  any-domain STAGE-YEAR ≥300 days in a 365-day window (F-30/B M-07), DERIVED
  MATURITY candidates (F-31), TENURE floors (F-32), axis signatures (F-33),
  per-bloom budget + waves + cadence + branch capacity (B C-03), stage-year floor
  for the D089 rare layer (F-26/F-32), season-intensity bands (F-35), the
  bloom-rain particle cap (Step 0).
- **1c. The trigger correlation table** (resolves F-23/H-03/DV-C1): every
  adaptation × every achievement / derived trigger (the missing D088 deliverable),
  which also fixes the subtle-tier derived-trigger legality (F-23), the
  mycorrhizal `coachEngagement` owner's feed (H-03), and the flower-overlay
  contract (F-24: co-fire rule, family-VIII manifestation, tier-vs-family basis).
- **Unblocks:** the stage×class matrix promotion draft→contract (LOOPHOLES §8),
  the paper archetype run, and the identity axis's approval (G-5).

**Step 2 — The clock & anchor consolidation (R1).** One shared account anchor
(H-01's "THE shared anchor" + A M-8's counting-event refinement + C-device M-1's
ratchet + A C-2's monotonic existence), two clocks (A M-1/C-device M-6: render
clock = stored timezone; derivation clock = dayKeys), the additive schema columns
(A C-3/C-device C-3: writtenAt + deviceId + syncSeq), future-dating exclusion
(A C-3/m-1), the two-tier retroactive rule (Step 0). *Depends on* Step 1b (the
qualifying-year and twig bars feed the clock). *Unblocks:* the matrix cells, E3
windows, tenure, maturity, the paper archetype run, the anchor-in-backup (H-10).

**Step 3 — The derivation engine contract (R3 + IA-1/IA-5/IA-6/IA-8).** The
tree-state model schema (IA-1, first), the read surface + H3-sibling source
(A M-6/IA-6/IA-8), the commutative fold (Step 0), the O(1) incremental aggregates
(P-07), the persisted versioned cache + fingerprint invalidation (P-04/C-2),
hard-delete invalidation (A M-3), entity-oriented supersession/revokes (A M-2),
payload-validation ladder (A M-7), settings-in-the-function (F-14), the R2 flags
(IA-3/IA-4), the axes' import-filter (IA-5), the cache/snapshot lifecycle
(IA-7). *Depends on* Steps 1–2. *Unblocks:* the perf gate (P-05), the renderer,
the snapshot economy (P-06), the why-panel, the semantics surface.

**Step 4 — The device-state layer (R9 + IA-9/IA-10).** The `viewed_moments`
watermark table (C-device C-1 + m-4 + C-device M-3, account-once/delivered-per-
device), the log fingerprint + cache invalidation (C-device C-2), restore×sync
(C-device C-4), anchor-in-backup formatVersion 3 (H-10), the two-tab
single-instance or concurrency contract (IA-10), the in-session ceremony state
machine (IA-9). *Depends on* Steps 2–3 (columns, fingerprint, cache). *Unblocks:*
the M11 sync-plane contract (REQUIRED, D059), the restore UX.

**Step 5 — The privacy/copy boundary (R6 + IA-2).** H-02 payload-blindness
(amends D099 N-6), H-03's feed + never-list, H-05's why-panel value law, H-07's
sharing-safe default, H-12's one-direction citation, H-06/H-13, and the
localization contract (IA-2). *Depends on* Step 3 (the read surface). Runs in
parallel with Step 4. *Unblocks:* the engine contract's copy rows + the a11y
copy (D C-2's narration reuses the same strings).

**Step 6 — The surface & render experience (R8).** The semantics surface +
merged hit-area LOD (D C-1/M-1), the announcement contract (D C-2), the
color-only text twins + contrast floor + Paper theme (D C-3/M-5/DV-m1), the
unified LOD ladder + first-paint ordering + baked pictures + spatial LOD
(G P-01/P-10/P-16), the unified motion/degradation ladder + ceremony budgets
(G P-02/P-15 × D M-3, Step 0), mass leaf-fall + spring flush (G P-03/m-4),
small-screen states + dynamic type (D M-2/m-4), the education ladder (D M-4),
anatomy-view baking + legends (G P-11/D m-1), the keyboard map (D m-3). *Depends
on* Steps 3 (state model → paint + semantics) and 5 (copy). *Unblocks:* the
archetype mockups (Step 4 of the pipeline) — they need the palette, the contrast,
and the semantics to be real.

**Step 7 — The design-identity layer (R7).** The identity-axis approval (G-5)
then: the coherence-envelope extension to flowers/fruits (DV-C1), the bloom
palette + gold boundary (DV-C2/DV-M8), the 17-audit + trait drivers (DV-C3/
DV-M11), the per-user morphology + similarity-differentiation (DV-C4/DV-M9/
DV-M10), the habit-surface reconciliation + "Heartwood"×4 (DV-C5), the day-1 +
sparse archetype composition (DV-M6/DV-M7), the shell relationship (DV-M1,
keeping the nav-ordering deferral), the duals' surface contract (DV-M2…M5).
*Depends on* Steps 1a (domain table) and 6 (renderer). Partially parallel with
Step 6.

**Step 8 — The economy/rarity polish (R4 residual) + verification.** Mast-year
compounding + monotone bloom (B M-01/M-06), twig aging (B M-02), bloom waves +
magnitude sub-steps + legend counter (B M-04/M-05/M-10), snapshot/prune +
lifecycle (m-2/IA-7), the roadmap premise amendments (2.8/IA-8), and the
consolidated verification gate: the archetype list now REQUIRES the wave-2
archetypes (everything-user, timezone-traveler, two-device, two-tab, screen-reader,
LLM-opt-in, backfiller, adopted-media user, similar-life twins, 20-year user) +
the perf gate (P-05 + HW-GATE, m-6) + the coherence check (VISION §6) + the
matrix's class-1…7 × stage-1…6 cells re-walked (G-1) + the seeded union-order
stress archetypes (C-device C-3: delete-first, revoke-first, parallel-edit).
*Depends on* Steps 1–7. *Unblocks:* the ENGINE-CONTRACT (Step 8) can be written
with zero decision fatigue.

---

## 7. COVERAGE PROOF

- All eight wave-2 briefs read in full (154 findings); all locked records
  D085–D099 read verbatim (TEMP-PLANNING L2403–L3068); VISION, SCHEMA,
  LOOPHOLES, INPUT-INVENTORY, the roadmap M9/M11/M13 + M7 qualifyingEntry rows,
  the wave-1 meta-audit, and the live schema (events table, repositories) checked.
- Every lock, principle, class, achievement family, stage, and matrix cell
  enumerated in the task was checked against the combined findings (§4: five
  residual gaps).
- Every blind-spot candidate (a)–(i) examined (§5: ten new findings; (g) and (e)
  verified covered/bounded).
- Contradiction register: 8 pairs + 1 roadmap-vs-wave-2, each with the
  contradicting lens IDs and the arbitration path (§2).
- Convergence map: 8 root-cause clusters carrying all 35 CRITICALs (§3).
- No wave-1-resolved item re-reported: A C-1 explicitly overturns N-7 (flagged as
  a deliberate supersession, not a re-report); D C-1/C-2/C-3 supersede E-ux m-4;
  H-02 deepens N-6 from MINOR to CRITICAL.