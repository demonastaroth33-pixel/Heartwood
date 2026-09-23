# F — RECURSIVE META-AUDIT (Life Tree loophole-hunt pipeline, pass F)

**Audit date:** 2026-08-30 · **Auditor:** recursive auditor (meta-lens)
**Inputs:** A-stage-class-matrix (33 findings) · B-temporal-fidelity (22) ·
C-botanical-coherence (21) · D-gamification-timeline (17) · E-ux-stage-surfaces (16)
**Authorities re-checked:** LOOPHOLES.md (§1–§8), VISION.md (17 principles),
SCHEMA.md, ACHIEVEMENT-SCAN.md, TEMP-PLANNING tree-7 (D085–D089),
docs/Database.md (backup/restore), scan-outputs/04-roadmap.md (M9),
INPUT-INVENTORY.md (§7/§9/§14 constraint register).

---

## 1. VERDICT ON THE HUNTS: **PARTIAL — WITH GAPS**

The five hunts are **strong within their lenses but not complete as a set**.
A (matrix), B (temporal), and D (gamification) are genuinely load-bearing; C
(botany) and E (UX) are solid. Three structural gaps keep the set from being
complete:

1. **No brief reads the tree as a system that already exists in the user's
   timeline.** The hunts all assume the tree's life starts at the M9 ship
   date. The roadmap's locked placement (M9 = "100% derived from real
   qualified non-imported history" over data logged since M0) means every
   existing user's tree renders its ENTIRE history on first open — backdated
   growth — which no brief treats as a first-class problem (B m-3 touches only
   the first-bloom ceremony replay).
2. **No brief examines backup/export/restore** against the tree state, despite
   the locked backup contract ("everything export captures, import can
   restore"; "regenerable caches NOT in backup") directly constraining how a
   derived tree may be persisted.
3. **No brief examines LOOPHOLES §5** — the flower-themed tier relabeling
   proposal that sits in the very file they audited and collides with the
   banking vocabulary they all use.

Additionally, four briefs (B, C, D, E) **contradict each other on the single
most-promised moment in the design** (the first bloom's stage) and on the
day-1 seed render — the contradictions are material, not cosmetic (see §2).

**Counts:** 109 findings total (A 33 · B 22 · C 21 · D 17 · E 16). ~85% are
independently verifiable against the locked docs; the five contradiction
pairs below are where the set needs arbitration, plus 7 new findings from the
blind-spot scan (§5).

---

## 2. CONTRADICTIONS BETWEEN BRIEFS

### CONTRADICTION 1 — CRITICAL · Where does the first bloom live? Three answers.

| Brief | First-bloom stage | Years |
|---|---|---|
| B C-4, D C-01 | SAPLING | ~year 1 (first qualifying-year close; "first spring after 365 days") |
| E C-3 | SAPLING | first spring at/after SAPLING |
| C C-1 | **POLE** | years 2–4 (MASTER 13.1: "POLE → MATURE") |
| A C-01 | **MATURE**, min. POLE→MATURE boundary; "never SAPLING" | years 4+ |

A and C agree the bloom must leave SAPLING; B, D, and E keep it at SAPLING.
This is not a wording dispute — it changes the "earned cherry-blossom moment"
(VISION, L-02, D085) from a year-1 event to a year-4 event, and the stage-name
definitions themselves diverge across briefs (A/C read the stage table
literally; B/D redefine SAPLING via tenure). **Root cause is B C-4's own
finding (the master clock has no tick rules) — the briefs could not agree on
stage definitions because none exists.** Resolution order must fix the stage
clock first (see §6, step 1); the bloom placement then falls out. Note:
C's POLE placement and A's MATURE placement agree with each other's botany
authority (MASTER 13.1) — the B/D/E SAPLING position is the outlier against
the declared botanical authority.

### CONTRADICTION 2 — CRITICAL · Does the SEED render branch-buds? A/C vs E.

- A M-04: "the seed is a bare seed; the 5 branch-buds appear on the first stem
  at germination/seedling".
- C C-2: "the SEED visual is a closed package; the plumule's latent shoot is
  visible only in an anatomy/cross-section view… The 5 branch-buds appear on
  the stem at the SEEDLING stage".
- E C-1 resolution: "SEED = the seed in soil + two cotyledons + the 5
  branch-buds rendered as a stylized POTENTIAL crown (small, ghosted-but-real
  nubs at the shoot apex — the 'architecture preview' the L-03 lock intends)",
  why-panel: "your five branches are set from day one".

A and C (botany-grounded, citing P1.2/P4.3) say buds exist only from
germination; E (UX-grounded) explicitly renders nubs on the seed. E quotes
L-03's "architecture is set" language as a SEED fact; C and A both argue it is
a SEEDLING fact. **The day-1 spec cannot be written until this is arbitrated**
(E C-1's own C-1 finding depends on it).

### CONTRADICTION 3 — MAJOR · Does a first-winter SEEDLING shed leaves?

- A M-29: SEEDLING = "first dormancy (first leaf shed, honest winter)".
- C M-8: season cycle begins at SEEDLING at capacity scale — "a seedling
  autumn drops its handful of leaves honestly; a seedling winter is a tiny
  bare skeleton… a lovely first-winter moment".
- E C-3: "no leaf-shedding visuals before the tree has seasonal leaves";
  young stages render season as growth-modulation only ("resting, not
  failed").
- B M-2: middle position — first winter = bud scales + leaf-litter layer at
  the base; "full deciduous fall + bare dormancy visuals apply from the first
  complete year"; frames the bare-silhouette winter as an early-churn risk
  ("is my tree dead?"), directly contradicting C M-8's "lovely first-winter
  moment" framing.

A and C say the seedling sheds honestly; E says it doesn't shed at all;
B hedges with the leaf-litter compromise. One consistent season-phase
function is required (the task's hot-zone (a), still unresolved after five
hunts).

### CONTRADICTION 4 — MAJOR · When do twigs exist? A vs D.

- A M-09/M-11/M-19 (and the stage table): twigs begin at **SAPLING**; months
  1–12 of a consistent user bank as branch-bud swelling; SEEDLING has no
  twigs (apical dominance).
- D m-02: accepts D088's monthly twig feed at face value — "Five qualifying
  events/month = 60 twigs/year — the same silhouette as the design's own
  'consistent user ~10 twigs/year' example" — implying month-1 twigs with no
  pre-SAPLING banking form.

D never contests the stage gate; it just ignores the early-fire gap A names.
The twig clock must be settled as one decision (A's banking form is the
botany-honest option).

### CONTRADICTION 5 — MINOR · Post-bloom directness vs the tier schedule.

- A M-25: "from the first flowering stage onward, blooms are direct" (no
  unnecessary banking delay).
- B C-3 / D C-02: Ring-tier buds ride the **yearly** bloom after their year
  closes — i.e., not direct at the first flowering stage.

Soft tension, reconcilable (A's "direct" = "at the next expressible moment"),
but the contract must state one rule.

**No other direct contradictions found.** Where the briefs touch the same
lock (D085/D086/D087/D088/D089, banking, L-02/L-05), they agree or
complement.

---

## 3. CONVERGENCE MAP — the shared root causes

Independent hunts arriving at the same root cause = high-confidence finding.
Nine root causes:

1. **The master clock has no tick rules** (B C-4; D C-01's "candidate"
   wording; A M-01/M-02; E C-2) — the stage definitions, boundaries, and
   triggers are undefined, which is WHY the briefs contradict each other on
   the bloom's stage (CONTRADICTION 1).
2. **The first-bloom trigger is double-locked and its tier scope is
   contradictory** — "first qualifying year" (LOOPHOLES §1/SCHEMA §3) vs the
   stage table's unconditional SAPLING bloom; "ALL banked buds" (L-02) vs
   stage-expressible (L-05) (B C-2/C-3; D C-01/C-02; C C-1; E C-3; A M-25/
   M-27).
3. **The tree has two birth dates and two year-1s** — journal-anchored seed
   date vs frozen account anchor vs calendar year boundary (B C-1/C-5; E
   M-1/M-8; D M-03; B m-7).
4. **The six-domain Life-Fully-Logged year is overloaded** — used as the
   stage gate, the ring brand, and the D089 floor simultaneously; single-
   domain users starve at every layer (B C-2/M-5; D C-01/M-03).
5. **The stage table contradicts the locked decisions it sits under** — D089
   floors vs stage-gated modifications; D088's monthly twig feed vs the
   matrix; D085's year-one seasons vs deferred seasonality (A M-08/M-09/M-12/
   M-21/M-29/M-30/M-31; C M-9; E C-3; B M-2).
6. **The early-fire trophy flood has no expression contract at young stages**
   — Grove fires on day 1, Heartwood in week 1, 15+ buds in a fortnight; the
   banking exists, the tier schedule and bud-clustering don't (B earliest-fire
   map + C-3 + m-1; D C-02/M-05; A M-27).
7. **The botanical compression is asserted, never stated** — "botany
   satisfied" without the time-lapse framing sentence (C M-2/m-2; A M-01).
8. **The day-1 / first-run experience is unspecced** — the SEED render, the
   bank's visibility, the germination moment, the interaction map (E C-1/C-2/
   M-6/m-5; A M-04/M-28; C C-2).
9. **The reproductive axis is two stages too early** and the fruit pipeline is
   compressed into one stage (A C-01…C-03/M-22/M-26; C C-1/M-10) — briefs
   converge on the defect, diverge on the target stage (contradiction 1).

---

## 4. LOCK-COVERAGE GAPS — which locks NO brief examined

Covered locks (verified across the five): D085 (B, C, D, E, A), D086 (D, B,
C), D087 (A, B, D, E), D088 (A, C, B, D, E), D089 (A, B, C, D), principle
14b (all), the 7 input classes (A matrix, M-18), all 131 trophies + 47 rungs
(D, B), all 14 adaptations (C + A + B + E), the L-series display rules
(L-02/L-03/L-04/L-05/L-07/L-09/L-11/L-12/L-14/L-15 across B/C/D/E/A).

**Locks NO brief examined:**

| # | Lock / locked record | Who missed it | Why it matters |
|---|---|---|---|
| G-1 | **LOOPHOLES §5 flower-themed relabeling proposal** (Bud/Bloom/Blossom/Flower/Flowering/Inflorescence) — temporary, pending approval | ALL FIVE | The briefs treat the tier names as locked and none read §5; the proposal collides with the banking vocabulary every brief uses (see N-3). |
| G-2 | **Backup/restore contract** (Database.md: "everything export captures, import can restore"; "regenerable caches NOT in backup"; roadmap: "never a write-path entity, no new tables") | ALL FIVE | The tree is a pure derivation — its persistence, rebuild, and rewind behavior on restore are entirely unexamined (see N-2). |
| G-3 | **M9 ship-date placement** (roadmap: tree ships years after M0, derives from M0-era data; "rings never shrink") | B m-3 only (ceremony replay) | Backdated growth — the single biggest blind spot (see N-1). |
| G-4 | **Event-log backdating window** (manual backdated entries; anti-farm: "retroactive/bulk logging" never rewards) | ALL FIVE | Can a backdating session advance the stage clock? (see N-7). |
| G-5 | **Coach-output mirror boundary** (INPUT-INVENTORY §7: coach outputs = "derived facts the tree may mirror" — but 4 of the 9 kinds are LLM narrative text) | ALL FIVE | facts-only vs mirrored LLM text on the mycorrhizal adaptation and the why-panel (see N-6). |
| G-6 | **D087 live habit-bud count cap** (buds = every active habit; B M-6 covers scars only) | B partial | Unbounded bud count on the habit branch (folded into N-4). |
| G-7 | **L-06/L-08 routine planned-vs-actual semantics as class-7 input** (routine_slot_logs; neutral deviation badges) | B M-4 partial (coach quiet-weeks only) | Planned-but-unperformed routine slots are a presence/absence input with no tree rule (minor; fold into the B M-4 resolution). |

---

## 5. NEW FINDINGS FROM THE BLIND-SPOT SCAN

### N-1 — CRITICAL · M9 BACKDATED GROWTH: the tree's first day is every user's "final day"

**Location:** 04-roadmap.md M9 ("100% derived from real qualified non-imported
history… rings never shrink… consumes ALL six domains' qualifying events +
achievement tiers + rings"); VISION 5 ("the stage transitions are the early
milestones"); E C-2/C-3; B m-3.

**The gap:** The tree ships in M9, years after M0. On first open, a
5-year user's derivation renders MATURE/OLD-GROWTH-adjacent state in one
frame: 5+ rings, full granularity canopy, all tiers of flowers, every
adaptation D089 allows. Concretely unexamined:
1. **The early journey never plays for existing users.** The entire SEED→
   SAPLING experience (E C-1's spec, A M-28's imbibition, the germination
   ceremony) is invisible to them; the design's most-invested moments (the
   "early milestones") bypass the app's most loyal users. B m-3 covers only
   the first-bloom ceremony; germination, first-branch, and ring-close
   ceremonies (E C-2's list) have no replay rule for pre-M9 data, and E M-7's
   "most recent unviewed transition only" means a launch-day user replays one
   moment while the other 9 transitions sit unplayed.
2. **The first frame is the performance worst case** — full history, full
   granularity, every banked flower that was expressible, in one render, on
   launch day, on possibly underpowered devices; the perf agreement has no
   worst-case-first-frame clause.
3. **The "does the tree fake growth?" answer is "no — but it fakes the
   journey".** Derived-only keeps it honest, but the emotional contract
   ("years, not months", the cherry-blossom ceremony) silently skips the
   ship-day population.
4. **The viewed-watermark semantics (E M-7) have no launch-day rule** — is
   all pre-M9 history pre-viewed?

**Resolution:** Design the **launch-day derivation replay as a first-class
onboarding event**: (a) first open = one bounded, skippable time-lapse
walkthrough (the data proves the moments — VISION's own principle), with the
stage-transition ceremony queue (E C-2's contract) replaying key transitions
in sequence, capped and coalesced; (b) the renderer renders the final state
statically first, then layers history (worst-case-frame budget in the perf
agreement); (c) the why-panel states "your tree grew from your whole history —
here's the time-lapse"; (d) all pre-M9 transitions are stamped viewed after
the walkthrough; (e) the seeded-data stress tests must include the
"5-year-history, first-open" archetype (it is the pipeline's missing paper
archetype). DecisionLog entry at the docs pass.

### N-2 — MAJOR · BACKUP/RESTORE × TREE: restore-rewind regresses the stage clock and resurrects dead buds

**Location:** docs/Database.md backup contract ("restore is a full-restore
operation, existing data is replaced"; "regenerable caches NOT in backup");
roadmap ("rings never shrink", "never a write-path entity, no new tables");
E M-1's ratchet; D087 bud scars.

**The gap:** The tree is derived-only and regenerable — restore rebuilds it by
re-deriving the restored event log. Three unexamined consequences:
1. **Restore-rewind:** restoring an older backup over a live tree rewinds the
   event log; the derivation replays to an earlier state → stages visibly
   regress (MATURE → SAPLING) and rings disappear — the locked "rings never
   shrink" is violated by construction, and the ratchet (E M-1) is a
   grow-only guarantee that restore bypasses. The tree has no stated behavior
   for a log rewind (vs deletion, which B C-1/E M-1 handle).
2. **Resurrection:** habit buds that were abandoned (scarred, D087) and
   branches that went dormant (D088) re-derive as alive; deleted entries'
   leaves return. The tombstone rule protects sync, not restore. A restored
   tree shows "revived" organs the user deleted.
3. **Worst-moment derivation:** the regenerable-cache rebuild (tree state) is
   excluded from backup by the locked cache rule — the heaviest derivation run
   lands on the import path (import already takes ~90s at M0 scale; a 5-year
   tree derivation stacks on top).

**Resolution:** (a) engine contract: the tree treats restore as a
**rebirth-from-history** — the derived state renders from the restored log
(no special-casing of "live" state), and the UI's restore confirmation gains
one line ("your tree will re-derive from this backup's history"); (b) the
"rings never shrink" promise is scoped to natural log evolution, stated as
such in the DecisionLog; (c) the derivation rebuild runs off-UI-thread with a
progress surface, and the restored tree's first render follows N-1's
static-first rule; (d) if the team wants restore to preserve the live tree
against rewind, that is a DecisionLog event (tree state becomes a
backup-enumerated table — reversing the locked "no new tables" premise) —
present both options.

### N-3 — MAJOR · THE §5 FLOWER-THEMED RELABELING COLLIDES WITH THE BANKING VOCABULARY (and with itself)

**Location:** LOOPHOLES §5 (Bud/Bloom/Blossom/Flower/Flowering/Inflorescence
for Sprout/Root/Branch/Heartwood/Ring/Grove, pending approval); the banking
forms (§1: buds, clusters, branch-buds); D087 habit buds; the identity axis
(ACHIEVEMENT-SCAN §1.5: families = inflorescences); the first-bloom event;
A/B/D's tier-schedule language.

**The gap:** The relabeling renames the Sprout tier "BUD" — the exact word
the banking system uses for the pre-bloom form of Sprout-tier achievements
("a BUD-tier achievement is banked as a bud until the first bloom"). Bloom/
Flower/Flowering collide with the bloom events and the flowering stage; the
Grove label "INFLORESCENCE" collides with the identity axis's core concept
(family → inflorescence). The user-facing sentence "your BLOOM-tier bud
blooms at the first bloom" is self-referential. L-01's own justification —
"the tiers ARE already tree parts" — is the argument AGAINST renaming them
with more tree-part names. None of the five briefs read §5; A/B/D/C/E all
write tier-schedule resolutions in the original names, so the contract would
be written against a vocabulary the UI then changes.

**Resolution:** Before the input-map step (the tier schedule is a contract
row), arbitrate §5: either (a) keep Sprout→Grove (recommended — the banking
language stays unambiguous; the flower visual already carries the botany per
L-01), or (b) if the user approves the relabeling, re-derive the banking
terms to non-colliding names (e.g., "sheathed buds", "unfurled", "open
blooms") — the collision is the audit's evidence for the approval decision.
Also note: "BLOOM"/"FLOWERING" as tier labels vs the D085 spring bloom and
the "flowering stage" — three meanings of "bloom" in one UI.

### N-4 — MAJOR · THE BANKED-BUD UNBOUNDEDNESS: the MATURE bloom burst and the habit-bud count have no caps

**Location:** B C-3/D C-02 tier schedule (Grove buds bank to MATURE); B m-1
(clustering at SEED/SEEDLING only); D087 (every active habit = a bud);
D M-04; E m-1 (shimmer at heavy stages); the perf agreement (TRAIT-SPACE §5).

**The gap:** B/D resolve the EARLY bank (clusters at seed) but not the LATE
burst: a decade-consistent user banks every Grove-tier achievement earned
years 1–4; at MATURE, the tier schedule bursts them all — 30+ Grove flowers
(each the "large visual" class) on one crown in one ceremony, with no
flower-count cap, no cluster rule for the bloom itself, no render budget for
the burst frame. Second: D087's live habit-bud count is unbounded — a
habit-hoarding user carries 50+ buds on the habit branch at SAPLING (B M-6
caps scars, not live buds). Third: D M-04's coach coalescing caps lines, not
visuals.

**Resolution:** (a) a flower-layer cap + dominance rule at the bloom
(mirroring the D088 rank rule C M-3b proposes for families: the dominant
family's flowers render full; runner-ups render at the subtle tier —
extending an existing locked mechanism, not a new one); (b) a D087 live-bud
cap with overflow aggregation (the bud garden clusters habits past N buds —
the D087 duality surface needs the same cap); (c) the burst renders as a
staged wave with a frame budget, not a single frame.

### N-5 — MINOR · MEDIA HIDES IN EARLY CLUSTERS: the leaf-cluster mechanic has no media-aware aggregation rule

**Location:** L-04 (clusters aggregate "a twig's worth of entries"; per-entry
granularity at POLE); VISION 15 (opening a leaf shows the memory);
B m-4/C m-4 (caps); 06-media scan.

**The gap:** Media entries (vlogs, photos) are the most personal content and
the heaviest artifacts; under L-04 they are invisible inside a cluster until
POLE (years 2–4). No brief defines: does a vlog weigh one leaflet or more?
Is a media-rich early cluster individually explorable (the memory surface
promise) while text aggregates? The media-scale hot zone (B) and the cluster
mechanic (A/C) were audited separately — never at their intersection.

**Resolution:** one input-map row: media entries aggregate into clusters but
clusters containing media expose a media thumbnail strip (the memory surface
at the cluster level); cluster weight counts media entries at ≥1 leaflet each;
storage-leaf character (D089) applies per-leaf on the same gradient B m-4
proposes.

### N-6 — MINOR · THE WHY-PANEL / COACH-MIRROR BOUNDARY: facts-only vs LLM narrative text

**Location:** facts-only rule (05-uiux L249/L254; INPUT-INVENTORY §14);
INPUT-INVENTORY §7 (coach outputs = "derived facts the tree may mirror");
D088 adaptation 10 (mycorrhizal/coach symbiosis); E M-5 (four-state display
taxonomy).

**The gap:** The tree's why-panel copy proposed across the briefs stays
factual (verified — no brief's copy quotes content). But the mycorrhizal
adaptation's feed is the coach_outputs table, and 4 of its 9 kinds
(daily_note, nudge, briefing, milestone reviews) are LLM-generated narrative —
not derived facts. Nothing states whether the tree may mirror coach
narrative text (a daily_note can contain personal narrative) in the root
section's why-panel. Secondary: the why-panel for protected absence (quiet
weeks) needs its own line — E M-5 covers habit-bud "resting" copy, but the
BRANCH-level protected-absence line (B M-4's resolution) is undefined.

**Resolution:** the tree mirrors only the derived/structural coach facts
(phase state, milestone counts, engagement tenure), never LLM narrative;
the why-panel's absence copy reads "resting (planned)" from F-11's
absence-classification output — one owner, two consumers, per the H3
discipline.

### N-7 — MINOR · THE EVENT-LOG BACKDATING WINDOW: can a backdating session advance the stage clock?

**Location:** anti-farm (retroactive/bulk logging never rewards —
ACHIEVEMENT-SCAN §5); event log occurredAt; B C-4's proposed tenure rules.

**The gap:** Conditional on the app allowing manual backdating (dayKey is
fixed for imports, but yesterday's-workout logging is a real pattern): the
stage clock proposed by B C-4 derives from event-date tenure — a user who
catches up a paper log over a weekend could instantly age the tree months,
advancing stage transitions ("fake growth" via the only path the anti-farm
rules don't cover, since imports are excluded but manual backdating is a
legitimate entry pattern). The achievement system shares the property (its
dayDomainPresence reads occurredAt), so this is consistent-with-locks — but
the tree must state it.

**Resolution:** one contract line: the stage clock reads event-date tenure
(same as achievements — consistency wins), and the anti-farm note records
that backdating advances the clock exactly as it advances achievements —
no tree-specific guard, documented rather than special-cased.

### BLIND-SPOT ITEMS VERIFIED AS ALREADY COVERED (no new finding)

- **(f) Duality at early stages** — covered by E M-2 (stage-scaled dual
  readout; three-state sap monitor ladder). Residual: the sap monitor's
  SEED-state line is still unspecified — track inside E M-2's contract row.
- **(g) SEED-stage beauty** — covered by E C-1 (first-run spec) + A M-28
  (imbibition) + E m-2 (hero = the ambience carve-out). Residual: no
  brief-derived mockup validates the seed/seedling renders against the
  "beautiful on day 1" bar — the archetype mockups (pipeline step 4) own it;
  add the day-1 archetype explicitly.
- **(e) Perf vs banking, twig scale** — covered by B m-2/m-4, C m-4, D m-02;
  the un-covered slice is N-4 (the burst).

---

## 6. THE RESOLUTION ORDER (what unblocks what)

1. **The master clock + the anchors (B C-4, B C-1, B C-5, E M-1/M-8, D C-01's
   decoupling, D M-03).** Define the stage transitions exactly, unify the
   birth anchor (frozen account anchor; "no events = no tree"), and split the
   visual ring from the branded ring. **Unblocks:** every other finding —
   the briefs cannot agree on the bloom's stage (contradiction 1) until this
   exists; the tier schedule, the banking, the ring ceremonies all read the
   clock.
2. **The first-bloom contract (A C-01 + C C-1 arbitration; B C-3/D C-02 tier
   schedule; B M-1/D M-01 spring alignment; A M-25; D M-06 Pith; E C-2
   ceremony).** One decision on the bloom's stage (the contradiction), one
   tier→stage banking schedule, one ceremony contract. **Depends on:** 1.
   **Unblocks:** the season-phase function's young-tree rules (contradiction
   3), the day-1 spec (contradiction 2 is independent — can run parallel).
3. **The stage-capacity table reconciliation with the locked decisions
   (A C-02…C-05 + M-04…M-31; C C-2/M-1/M-3/C-3/M-6/M-9; D M-05).** The
   botany corrections (reproductive axis, seed anatomy, modifications →
   D089 floors, twig clock, missing gym channel) are mostly independent of 1
   and can run in parallel with it; the twig-clock cell depends on 1's stage
   definitions. **Unblocks:** the input-map step (Step 5) can then fill cells
   without re-litigating botany.
4. **Season × young-tree, ONE consistent function (arbitrate contradiction 3:
   A M-29/C M-8 vs E C-3, via B M-2's leaf-litter compromise; plus A M-21/
   M-29, B M-2, E C-3, C M-8).** **Depends on:** 1, 2. **Unblocks:** the
   engine's season-phase function and the first-winter UX.
5. **The early-fire expression contract (B m-1 clustering, D M-04 coach
   coalescing, B M-7 ceremony queue, E M-7 replay scope, N-1's launch-day
   replay).** **Depends on:** 1, 2. **Unblocks:** the notification/ceremony
   design and the M9 launch-day experience.
6. **The NEW-finding decisions that gate the engine contract (Step 8):**
   N-3 (relabeling — arbitrate BEFORE writing the tier schedule in contract
   language), N-1 (launch-day replay + worst-frame budget), N-2 (restore
   semantics — before the state model is frozen), N-4 (burst/bud caps —
   before the renderer budget), N-6/N-7 (contract lines, cheap), N-5
   (input-map row). **Depends on:** 1–3 for N-1/N-4; independent for N-2/N-3.
7. **The paper archetype run (pipeline step 4) gains three mandatory
   archetypes:** the M9-launch-day 5-year user (N-1), the restore-rewind user
   (N-2), the habit-hoarder at MATURE bloom (N-4) — the existing archetype
   list covers none of them.

---

## 7. COVERAGE PROOF

- All five briefs read in full (109 findings).
- All locked decisions verified against TEMP-PLANNING tree-7 (D085–D089),
  VISION, SCHEMA, ACHIEVEMENT-SCAN, INPUT-INVENTORY §14, the L-series ledger
  records, the roadmap M9 block, and docs/Database.md backup contract.
- Every lock enumerated in the task checked against the combined findings
  (§4 table; seven locks/records with zero or partial coverage identified).
- Every blind-spot candidate (a)–(h) from the task examined (§5; two
  verified covered).
- Contradiction register: 5 pairs, each with the contradicting brief IDs and
  the arbitration path.