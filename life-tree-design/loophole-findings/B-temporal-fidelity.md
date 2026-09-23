# B — TEMPORAL-FIDELITY AUDIT (Life Tree loophole hunt, pass B)

**Audit date: 2026-08-30.** Lens: the temporal-fidelity audit — every
"when can this fire vs when can the tree express it" gap across the
whole design. Sources: LOOPHOLES.md (pipeline + L-01..L-05 + §7 hot
zones), INPUT-INVENTORY.md (§1-15), ACHIEVEMENT-SCAN.md (131 trophies +
47 rungs + 3 hard clusters), SCHEMA.md, VISION.md, and the raw briefs
(scan-outputs/01-07, esp. 02-achievements E0-E13 + account anchor,
03-coach item 37, 05-uiux tint rule, 06-media scale, 07-ledger D085-D089
+ F-11).

Method: per-matrix-cell "when can this fire vs when can the tree
express it" walk, the §7 hot zones in depth, the earliest-fire walk of
every family (Sprout/Root/Branch/Heartwood/Ring/Grove + rungs + hard
clusters), the feature timeline, the seasonal/annual timeline, and the
decay/absence timeline.

---

## 0. THE EARLIEST-FIRE MAP (the audit's raw material)

Verified from 02-achievements.md conditions (E0-E13 primitives +
per-trophy predicates):

| Earliest fire | Trophies (id — tier) | Tree stage at that moment |
|---|---|---|
| DAY 1 | I-1 Sprout, II-1 Sprout, III-1 Sprout, IV-1 Sprout, V-1 Sprout, VI-1 Sprout, VII-1 Sprout, IX-1 Sprout step, IX-4 Root step, I-13 Root step, III-3 Root, III-20 Root, III-18 Branch step (Novice rank, strong user) | SEED |
| DAY 1 (Grove!) | IX-2 Six for Six (all-six day), III-18 Grove step (Advanced rank, elite user) | SEED |
| WEEK 1-2 | I-2 Root, II-2 Root, II-7 Root, III-2 Root, III-4 Root, IV-3 Root, VII-2 Root, VII-3 Root, VIII-6 Branch, III-10 HEARTWOOD (Trifecta Week), V-10/V-11 Root (heavy users), **V-13/V-14/V-15 Branch+Heartwood (a 95 kg user), V-16 GROVE (a 100 kg user, week 2)** | SEED / SEEDLING |
| DAY 30-60 | IV-5 Heartwood (30d), I-4 Heartwood (60d), II-9 Heartwood (90 comps), II-3 Heartwood (100d) | SEEDLING |
| DAY ~182-272 | III-22 Heartwood (26wk), V-3 Heartwood (26wk), **IX-5 Ghost in the Machine GROVE (earliest ~6-9 months)** | SEEDLING |
| MONTH 6-12 | IX-3 The Living Archive GROVE (~6-8 mo), III-11 A PR Every Season GROVE (12 distinct months), II-6 Branch (month 1), I-3 Branch (90d), II-8 Branch, III-21 Branch (3 mo), IV-6 Branch (6 mo) | SEEDLING / SAPLING edge |
| YEAR 1 | All Ring trophies (I-5, II-5, II-12, III-26, VII-5, VIII-1, VIII-17/18/19), VIII-11 Pith (Sprout tier, rings ≥1), VIII-5 Heartwood, VII-8 Heartwood, I-15 Heartwood (Bookended), I-12 Branch step (2y — actually year 2), II-4 Grove (500-day streak ≈ 16.5 mo) | SAPLING (per stage table) |
| YEAR 3 | All x3 chains: I-16, II-14, III-27, IV-13, V-8, VII-11, VIII-7 (Grove) | POLE (2-4) |
| YEAR 5 | All x5 chains: I-17, II-15, III-28, IV-14, V-9, VII-12, VIII-8 (Grove) | POLE/MATURE edge |
| YEAR 8-10 | VIII-18 Phloem (8 rings), VIII-9 Old Growth (10y), VIII-10 Ouroboros (10y), VIII-20 Yew, III-17 Four Times Over | MATURE → OLD-GROWTH |
| MONTHS-YEARS | Rungs R1-R47 (R1 60 kg bench: week 1-2 for a beginner, day 1 for a trained lifter; R5 140 kg bench GROVE: year 1-3 elite; R47 5M kg GROVE: year 5-10) | any stage, per banking |

Consequences used throughout: **Grove-tier trophies CAN fire on day 1
(IX-2, III-18) and week 2 (V-16)**; Heartwood fires in week 1 (III-10);
the entire Sprout+Root tier floods the first fortnight. The stage model
must answer: what does a Grove transformation mean on a 2-week-old
tree?

---

## 1. CRITICAL FINDINGS

### C-1 — THE TREE HAS TWO BIRTH DATES; "no entries = no tree" STARVES JOURNAL-LESS USERS AND DELETION SHIFTS THE BIRTH

**Location:** INPUT-INVENTORY §14 (constraint register: "The tree's
seed date follows the coach's anniversary-anchor logic (first journal
entry; deletion shifts it) — no entries = no tree") vs 02-achievements
"Account anchor" block (02-achievements.md:77) + 03-coach.md item 37
(first-journal-entry anchor, deletion shifts to next-earliest) +
04-roadmap:47/1255 ("one ring = one Life-Fully-Logged qualifying
yearly window… rings read this anchor").

**What fires when vs what the tree can express:**
- The gamification account anchor = minimum `occurredAt` across ALL
  non-imported, non-tombstoned events; **FROZEN at first real event
  write; stored immutable; deletion can never shift it. Rings read
  this anchor.** (02-achievements.md:77)
- The tree's seed date per the constraint register = the COACH's
  anniversary anchor = **first journal entry's date; deletion SHIFTS
  it to the next-earliest**; no journal entries at all → no tree.
- These diverge for any user whose first journal entry is not their
  first event (a gym-first user: account anchor = day 1 workout; seed
  date = day 90 first journal) and for every user who deletes their
  first entry (seed date jumps forward; account anchor stays frozen).
- **Deleting the first journal entry RETROACTIVELY REBIRTHS the tree**
  — the tree's birth date, stage clock, ring windows, and the "tree
  age" shown everywhere all shift. That breaks the locked
  derived-only determinism promise (VISION 4: same data → same tree;
  a live tree whose birthday moves is incoherent) and produces two
  different "year 1" moments: ring 1 closes at account-anchor+365,
  the anniversary review fires at journal-anchor+365 — months apart,
  on the same tree.
- **"No entries = no tree" violates the master principle ("EVERYTHING
  feeds the tree… data is never lost and never unrewarded," VISION 1
  + LOOPHOLES §1):** a user with 6 months of gym + nutrition + habits
  and no journal has NO TREE at all — their data is fully unrewarded.
  The seed's "first days" stage never begins, so nothing banks.

**Resolution (grounded in the locked design):** the tree is ONE
organism and must have ONE anchor. Adopt the **account anchor**
(frozen, deletion-proof, deterministic, already locked for rings) as
the tree's seed date, stage-clock origin, and ring-window origin. The
coach's journal-anchored anniversary review stays a coach-surface
cadence only (it already has its own "no review" fallback). Amend the
constraint register: "no entries = no tree" → **"no events = no tree"**
(the seed appears at the first real non-imported event write; an
all-empty log = no tree, exactly as "all-zero history → never fires"
works in E4). Deleting the first entry can no longer shift the birth.
Requires a DecisionLog entry (it amends the recorded constraint
register row — same class of change as D085-D089, tree-internal).

---

### C-2 — STAGE STARVATION: THE STAGE CLOCK, THE FIRST BLOOM, AND THE RINGS ARE ALL GATED ON THE SIX-DOMAIN LIFE-FULLY-LOGGED YEAR; SINGLE-DOMAIN USERS STARVE AT SEEDLING FOREVER

**Location:** LOOPHOLES §2 (stage table: SAPLING "~year 1-2", FIRST
BLOOM "at the flowering stage (first qualifying year)"), SCHEMA §3
(secondary-growth trigger "candidate: the first qualifying year;
qualifying = the locked Life-Fully-Logged year rules"), 04-roadmap:47
("one ring = one Life-Fully-Logged qualifying yearly window"),
02-achievements VIII-5 (six domains each ≥1 qualifying entry in one
365-day window).

**What fires when vs what the tree can express:**
- The ONLY definition of a qualifying year in the system is the
  six-domain bar (journal + habits + gym + nutrition + body + media).
- A journal-only user (or gym-only, or any profile not covering all
  six domains in one window) **never closes a qualifying year** →
  never earns rings → never triggers the secondary-growth engine →
  under the current stage gate, never reaches SAPLING → **the first
  bloom never fires — every achievement they ever earn (I-5 Full
  Orbit at year 1! — a Ring-tier trophy with a journal-only
  criterion) banks as a bud FOREVER.** The master principle's
  "nothing unrewarded" fails for the most common archetypes.
- The D088 consistency principle ("the most consistent users get the
  most beautiful trees… tenure, branch rings, canopy density, caudex
  all compound") is violated: a 5-year daily-journal user — the most
  consistent single-domain user there is — has zero rings, zero
  blooms, a pith-only trunk, and a permanently stuck stage.
- Ring-tier trophies fire on a ring-less tree: I-5 (year 1, journal
  only) blooms as a "distinctive bloom + branch-level visual event"
  on a tree with no ring to tie to.

**Resolution (split the clock from the brand):** the tree's stage
clock derives from the TREE's own tenure (age-anchored presence years
from the account anchor — see C-1), never from the six-domain bar:
- Every calendar year of the tree's life leaves a VISUAL ring (thin
  and sparse for quiet/partial years — real botany: thin rings in bad
  years). The six-domain Life-Fully-Logged year becomes the ring's
  BRAND (the dense, beautiful, achievement-counted ring — the one
  Pith/One-Year-In count).
- The stage transitions run on tenure (see C-4's exact rules), so a
  journal-only user reaches SAPLING at year 1, gets the first bloom
  (their banked buds burst on schedule), and grows rings that are
  honest but unmarked. Why-panel: "your rings are thin — Life, Fully
  Logged needs all six domains."
- This keeps E3 ("never calendar-chopped") intact for ACHIEVEMENTS
  while giving the TREE a calendar-true annual ring; the visual-ring
  vs branded-ring difference is a why-panel sentence, and the ring
  review mode shows both layers.
- The D089 structural tenure floors (see M-5) must read this same
  tree tenure, not the six-domain bar.

---

### C-3 — L-02 vs L-05 CONTRADICTION: "ALL banked buds burst at the first bloom" vs "rare achievements manifest when the stage can express it"

**Location:** LOOPHOLES §1 (first-flowering event: "all banked
achievement buds burst into the first bloom together"), L-02, L-05,
LOOPHOLES §2 stage table (MATURE = "full flowering + rare tiers";
OLD-GROWTH = "the largest visuals + transformations"), VISION 9 +
ACHIEVEMENT-SCAN §4 (Grove = the large visuals).

**What fires when vs what the tree can express:** Grove-tier trophies
fire in year 1 for real users: **IX-2 Six for Six (day 1), III-18
Advanced rank (day 1 for an elite lifter), V-16 The Estimated Ceiling
(week 2 for a 100 kg user), IX-3 The Living Archive (~6-8 months),
IX-5 Ghost in the Machine (earliest ~day 182-272), III-11 A PR Every
Season (12 distinct months), II-4 The Long Haul (~16.5 months)**. The
first bloom fires at the first qualifying year (SAPLING). If L-02's
"all banked buds burst" includes Grove buds, a 12-month-old SAPLING
sports D086 top-tier transformations — directly contradicting the
stage table (transformations = OLD-GROWTH) and VISION 5 ("years, not
months; the tree must NOT change visibly across a month"). If it
excludes them (per L-05), the "first bloom = all buds" promise is
false and the wording must be corrected. Either way, the current
design says both.

**Resolution:** reconcile the two: the **first bloom bursts Sprout →
Heartwood buds only** (the earned cherry-blossom moment keeps its
scope); **Grove-tier buds bank to MATURE (year 4+)**, and D086
top-tier transformation visuals bank to their expressible tier (the
stage table's "rare tiers" = MATURE, "largest visuals/transformations"
= OLD-GROWTH). Why-panel on every Grove bud: "blooms when your tree
reaches maturity." Nothing is unrewarded (the bud is visible, claimed,
explainable — LOOPHOLES §1 banking contract); the tree never breaks
stage coherence. This is the L-05 mechanism applied consistently —
L-02's "all" becomes "all stage-expressible buds."

---

### C-4 — THE MASTER CLOCK HAS NO TICK RULES: STAGE TRANSITIONS ARE UNDEFINED

**Location:** LOOPHOLES §2 (stage table's "When (derived)" column —
draft), PLAN Step 8 (engine contract "zero-decision-fatigue spec"),
VISION 14b (the stage is "the master clock" — but nothing defines the
clock).

**What fires when vs what the tree can express:** the entire banking
system (buds, clusters, branch-buds, first bloom) depends on knowing
which stage the tree is in on any given day, but the design has no
exact triggers: SEED = "first days" (of what?), SEEDLING = "weeks-
months", SAPLING = "~year 1-2", POLE = "years 2-4", MATURE = "years
4+", OLD-GROWTH = "decade+". The boundaries overlap (is year 2 SAPLING
or POLE? is year 4 POLE or MATURE?), and every cell of the matrix
evaluates against a stage that cannot be computed. Without exact rules
the first bloom cannot schedule, the banking tiers cannot evaluate,
and the seeded-data stress tests have nothing to assert against.

**Resolution:** define the stage clock on the tree's own tenure
(account anchor + continuous presence), and tie the boundaries to the
achievements the system already fires at those moments (the
achievement system is the trigger authority — D088 C; the stage
boundaries should read the same triggers):
- SEED: birth → 7 qualifying days of tenure.
- SEEDLING: day 8 → the first qualifying year closes (the tree's own
  tenure year — see C-2's tenure definition).
- SAPLING: first qualifying year closes → VIII-1 One Year In / Pith
  moment — the FIRST BLOOM fires here (C-3's scope).
- POLE: year 2-3 (VIII-2 Two Years).
- MATURE: year 4+ ("rare tiers" — Grove blooms directly).
- OLD-GROWTH: 10+ qualifying years (VIII-9 Old Growth — the natural
  tie: the stage's name IS the trophy's name).
Every transition = a check-and-fire on the window close (E0
discipline). The contract must state exact day counts; the paper
archetype run (LOOPHOLES §6, pipeline step 4) validates them.

---

### C-5 — "THE RING CLOSES AT THE YEAR BOUNDARY" vs THE ANCHORED 365-DAY WINDOWS: TWO RING CALENDARS, UP TO 11 MONTHS APART

**Location:** D085 (07-ledger.md:1452-1465: "the ring closes at the
year boundary (calendar-anchored heartbeat, every user, every year)")
vs E3 anchored years (02-achievements.md:65: "never calendar-chopped,
never install/open date") vs 04-roadmap:47 ("one ring = one
Life-Fully-Logged qualifying yearly window") vs 02-achievements VIII-5
(rings = anchored windows that ever passed).

**What fires when vs what the tree can express:** a user starting Aug
15, 2026: the D085 calendar heartbeat closes the ring Dec 31, 2026
(4.5 months of life — a "ring" with 137 days of data); the anchored
qualifying window closes Aug 15, 2027. If the calendar closure brands
a ring, the tree shows a fake ring (no qualifying year exists) and
Pith (rings ≥1) fires at Dec 31 on a 4-month tree. If it doesn't, the
D085 text is false ("the ring closes at the year boundary, every
user"). Every subsequent year the divergence persists (Dec 31 vs Aug
15 — the ring ceremony and the Full Orbit / One Year In fires never
coincide). The tree and the achievement system would disagree about
what "year 1" means on the same trunk.

**Resolution:** separate the two events explicitly (one sentence in
D085's record): the calendar year boundary closes the SEASON cycle
(autumn leaf-fall → winter dormancy — visual, every user, every year,
stage-gated per M-2) and marks the annual ring's LATEWOOD boundary;
the ring's BRAND (whether it counts, whether it is dense) closes at
the ANCHORED window (the E3 window the achievements already use). A
partial first year shows a thin sliver ring (honest — real botany:
thin rings in short/bad years) that the ring review labels "partial
year — no brand"; Pith and the Ring trophies read branded rings only.
The ring review mode (VISION 16) shows both layers with one why-panel
line. This is the same visual-ring/branded-ring split as C-2 and must
be written into the engine contract with the season-phase function.

---

## 2. MAJOR FINDINGS

### M-1 — THE FIRST BLOOM AND THE SPRING BLOOM ARE UNALIGNED

**Location:** LOOPHOLES §1 (first bloom at "the flowering stage (first
qualifying year)") vs D085 (spring bud break + bloom, calendar-anchored).

A qualifying year closes on its ANCHORED date — any month. A user
whose year closes February 15 would have all banked buds burst
mid-winter, the tree then enters its calendar winter immediately
after — the "cherry-blossom moment" lands in the snow, and D085's
spring bloom (April/May) fires weeks later as a separate, weaker event.
Two blooms, months apart, in the tree's first year. **Resolution:**
the first bloom fires at the NEXT spring bloom after the qualifying
year closes (the banked buds wait ≤ ~3 months; the why-panel and the
ceremony copy say "your first spring — the banked buds burst"). This
makes the first bloom literally the cherry-blossom event D085 promises
and VISION 6 demands, and unifies the two ceremonies into one. (Edge:
a user whose qualifying year closes in April gets the bloom
immediately — fine, the spring bloom IS the moment.)

### M-2 — THE SEASON CYCLE vs A NEWBORN TREE (hot zone a, expanded)

**Location:** LOOPHOLES §7(a), D085, D088 dormancy ("an inactive
branch… loses its seasonal leaves (deciduous honesty)"), VISION 6.

- A day-1-in-November user's seedling hits winter dormancy within
  weeks of planting; a SEED (0 leaves, 0 branches) has nothing to
  shed — the D085 heartbeat renders a "bare dormant tree" for a user
  whose tree is a sprout. The "is my tree dead?" moment is the
  classic early-churn failure for exactly the audience the app is
  courting.
- The autumn leaf-fall (D088) removes the LEAF SURFACE — but leaves =
  the explorable memory surface (VISION 3: "leaves = the explorable
  memory surface"). A December user's June memories vanish from the
  tree until spring if leaf-fall is data-coupled. Deletion = leaf
  fall (honest, permanent) and autumn = leaf fall (seasonal, visual)
  are two different events currently sharing one name.

**Resolution:** stage-gate the season phases (they are manifestations;
the master clock gates manifestations — 14b): SEED = phase-neutral
soil/sprout state (no calendar phase until germination completes);
SEEDLING first-winter = the branch-buds and achievement buds wrap in
**bud scales** (the D088 row-14 mechanism — the winter wrapper) and
the young leaves' fall renders into a **leaf-litter layer at the base**
(real botany, and the memory surface stays explorable all winter —
the winter memory surface). Full deciduous fall + bare dormancy
visuals apply from the first complete year. Seasonal fall is a VISUAL
STATE; deletion is a DATA EVENT; the engine contract must separate the
two (two derivation paths, one name fixed). Why-panel: "your tree is
in its first winter — its buds are wrapped in bud scales; the fallen
leaves are still your memories, under the tree."

### M-3 — THE CALENDAR TINT PATH OMITS CLASSES 5/6 AND MEDIA; THE TINT QUANTIZES GROWTH INTO 4 LEVELS

**Location:** hot zone (d); 05-uiux.md:250/289 + U:L141-147
(dayActivityScore: workout 3 cap 1/day · meal 1 cap 3/day · weigh-in 1
cap 1/day · journal 1 cap 2/day · habit 0.5 uncapped · tint
0/1-2/3-5/6+); INPUT-INVENTORY §8 + §14 (tint-only rule, "tree state
must flow through the locked H3 dayActivityScore owner — no
independent calendar presence").

- dayActivityScore has NO media class, NO goal-progress class, NO
  achievement class, NO coach-engagement class. A day with a vlog +
  a goal completion + two trophy fires scores ~2.0 (two journal
  entries) — a media day renders faint while the tree's own organ
  (storage leaf) is rich. The tree and the calendar would disagree
  about the same day.
- The weights are LOCKED non-togglable (05-uiux:190/349-354, 02-ach
  E13-adjacent) — the tree cannot re-weight the owner.
- The tint quantizes to 4 levels (0/1-2/3-5/6+): a 3-score day and a
  5-score day render identically; the habit channel is UNCAPPED at
  0.5 — a 12-habit day scores 6.0, outshining a deep-journaling day
  (2.0), which biases the tree's day-expression toward habit spam.

**Resolution:** clarify the constraint's scope: the tint-only rule
governs the CALENDAR surface (no glyphs — that is the locked intent).
The tree's growth engine reads its own class-derived derivation from
the event log (its own contract, SCHEMA §3); only calendar-facing tree
state (the day cell, the year heatmap, any future tree-on-calendar
strip) quantizes through dayActivityScore. If the intent was that the
tree's growth intensity itself reads the score, that is a DecisionLog
event: extend the owner with media + goal weights (still non-togglable
— the "keep fixed" rule stays) rather than silently underweighting
media/goal days.

### M-4 — COACH QUIET-WEEKS / PLANNED ABSENCE: THE TREE'S DORMANCY TRIGGER AND ABSENCE CLASSIFICATION ARE UNDEFINED (hot zone e)

**Location:** hot zone (e); F-11 (07-ledger.md:265-285 — "absence
classification (planned vs unplanned — reads deload_markers/periods/
planned-rest/quiet-week structures)"; "a marked/planned absence decays
differently (or not at all) vs true unplanned absence"); D088 dormancy
("an inactive branch stops growing, goes dormant… resumes from its tip
buds"); D088 row 14 (bud scales = "dormant habits' winter wrapper…
protected state during quiet periods"); 05-uiux.md:145 (quiet week
pauses coach nudges; streaks stay REAL).

- The tree has NO defined dormancy trigger (how many consecutive
  absence days before a branch goes dormant?) and NO defined
  absence-classification consumption (does a quiet week read as an
  unplanned gap?).
- Under the current draft, a quiet week (user-declared rest) reads as
  a bursty gap in the RHYTHM axis, can trigger branch dormancy, and
  taints the "steady" character — the tree punishes declared rest
  exactly when the app promises "no shame" (05-uiux:145, 03-coach
  quiet rules).
- Does a quiet week PAUSE growth? No data is logged, so no extension
  happens (honest); the question is whether the absence is PENALIZED
  (dormancy/rhythm) — it must not be.

**Resolution:** quiet-week/deload/period/planned-rest days are
**protected absence**: no dormancy trigger, no decay, no axis penalty;
habit buds wear bud scales (the D088 row-14 tie — this is exactly what
bud scales exist for); the RHYTHM axis's gap detection excludes
protected days (they read as rhythm-neutral). The dormancy trigger
(engine contract): ≥2 consecutive weeks of UNPLANNED domain-absence at
SAPLING+ (the matrix already stages absence-dormancy at SAPLING —
LOOPHOLES §3 row 7); planned absences of any length never trigger it.
The tree consumes F-11's absence-classification output directly (it is
already computed; one owner, two consumers — the H3 discipline).

### M-5 — THE D089 TENURE FLOOR READS THE SIX-DOMAIN QUALIFYING YEAR: SINGLE-DOMAIN USERS CAN NEVER EARN ANY STRUCTURAL MODIFICATION

**Location:** D089 (07-ledger.md:1496-1513 — "HARD TENURE FLOOR: none
manifest before real qualifying years exist (floor = 2+ qualifying
years…)"); D088 adaptation map rows 1/3/4/5/8 (caudex, thorns,
buttress, phyllodes, storage leaves — all structural, all
tenure-gated).

The adaptation map's structural tier includes THORNS (365-day streak
armor — a gym-only user's most iconic reward), storage leaves (media —
a daily vlogger's whole character), caudex, buttress, phyllodes. If
"qualifying years" = the six-domain Life-Fully-Logged window (the
only locked definition — C-2), a 5-year daily-gym user with a 400-day
streak has ZERO qualifying years → thorns can never manifest; the
flower-layer fallback (D088 E) leaves them a flower instead of their
structural armor forever. Same starvation as C-2, at the adaptation
layer. **Resolution:** the D089 floor reads the tree's OWN tenure
(C-2's tenure years), so structural modifications honor "genuine years
of consistency" (the D089 wording) rather than six-domain coverage;
the why-panel states the floor. Fold into the C-2 DecisionLog entry.

### M-6 — THE BUD-WITHERING / BUD-SCAR TIMELINE IS UNDEFINED; YOUNG-TREE SCAR CROWDING

**Location:** D087 (07-ledger.md:1487-1495 — "dormant when unworked;
swelling with streak momentum; bursting…; withering honestly when
abandoned; abandoned habits leave BUD SCARS"); INPUT-INVENTORY §4.

- When does a bud start withering? When does a scar form? Undefined.
- A day-3 habit (created, checked once, abandoned) leaving a scar on
  a SEEDLING's branch-bud = scar crowding: a year-1 user who tried
  and abandoned 20 habits gets 20 scars on a tiny tree — noise that
  buries the honest signal.
- Real botany resolves it: a bud that never grew **abscises cleanly**
  (the whole dormant bud drops — no scar); only a bud that actually
  grew and was then cut/removed leaves a scar.

**Resolution:** (1) a habit with zero completions abscises cleanly on
abandonment (no scar); (2) withering begins after ≥2× the schedule
interval without completion (min 14 days); (3) a scar forms only after
a habit that completed ≥1 time is abandoned ≥60 days; (4) scars are
subtle-tier detail (D089 subtle tier, close-up only), never
silhouette. Same for the branch level: D088's "no death, no scars" for
branches is already locked — the bud level now gets the same honesty
with the botany's own cleanliness rule.

### M-7 — THE ONE-NOTIFICATION CONSTRAINT'S SCOPE IS UNRESOLVED AND THE TREE'S CEREMONIES COLLIDE WITH IT (hot zone f)

**Location:** hot zone (f); the ambiguity is documented in 05-uiux.md:
269 and INPUT-INVENTORY §14, but the ledger DOES document "one
notification/day" in F-19 (:417), F-24 (:470), L-10 (:1042), C-14
(:1232) — the audit brief missed them. F-03 ceremony (07-ledger.md:
143-161 — "DESIGN LANGUAGE HELD for the Life Tree session").

- The tree's events that could collide on ONE day: the first bloom
  ceremony (M-1), the ring-brand closure (C-5), multiple trophy fires
  (multi-tier trophies fire tier-steps separately — I-9 can fire Root
  + Branch on consecutive days; IX-1's Ring step lands on the same
  anchored day as I-5/Pith — 3+ trophy fires in one day), plus the
  milestone anniversary review (journal anchor, 03-coach item 37 —
  can land on the same date).
- If "one notification/day" counts in-app ceremonies, the first bloom
  + a Ring-trophy toast + the anniversary review cannot coexist, and
  the ceremony design (F-03 — held for THIS session) has no rule.

**Resolution:** define "notification" = PUSH only (the constraint's
documented intent in F-19/F-24/L-10/C-14 is about not pushing the
user); in-app ceremonies are navigation surfaces, not notifications.
Same-day events sequence through a **ceremony queue** (one ceremony at
a time, in a fixed priority order: first bloom > ring brand > trophy
bursts > review surfaces); the first bloom ceremony ABSORBS same-day
trophy toasts (they ride its bracts — the F-03 language already ties
bracts to the bloom's presentation, D088 row 13). Coach lines stay
"one per trophy fire" (Ring/Grove only) — the merged check-in section
is the delivery surface, not a notification. Record the resolution in
the F-03 design session notes.

---

## 3. MINOR FINDINGS

### m-1 — THE FIRST-FORTNIGHT TROPHY FLOOD vs THE SEED'S BUD ROW
~15+ trophies can fire in the first two weeks (the earliest-fire map:
8 Sprout + a dozen Root + III-10 Heartwood + V-13..V-15 for heavy
users) — 15+ achievement buds on a seed that can show none of them.
The bud CLUSTERING resolves it: at SEED/SEEDLING, achievement buds
bundle by FAMILY (9 family clusters max — the §1.5 two-axis identity
axis), with count badges; individual buds open at the bloom (C-3's
scope). A seed with 15 single buds is noise; 9 family clusters are a
story.

### m-2 — THE BODYWEIGHT-MILESTONE FAMILY FIRES AT ABSOLUTE THRESHOLDS
V-10..V-16 (70/75/80/85/90/95/100 kg rolling average, ≥2 weekly
checkpoints) fire at the user's CURRENT body: a 95 kg user fires
V-13/V-14/V-15 (Branch + 2×Heartwood) in week 2 and a 100 kg user
fires V-16 (GROVE) in week 2 — no effort, no time. This is honest
(there is no "start weight" anchor in the condition) and the banking
handles the tree side (C-3), but the derived-accent system must not
treat a static state as consistency: a week-2 Grove accent must read
"your current body," not "years of discipline." Note for the engine
contract's accent derivation (D086: accents color the deterministic
core — the accent's axis read must not credit a static snapshot as
rhythm).

### m-3 — PRE-EXISTING USERS' FIRST BLOOM IS DERIVED IN THE PAST
Users with data predating the M9 tree ship: their derivation replays
the first bloom inside the time-lapse (it already happened), and the
"now" tree shows the bloomed state — but the CEREMONY (F-03, the
cherry-blossom moment) never plays for them. Resolution: at
first-open-after-ship, users whose derivation shows an unreplayed
first bloom get the ceremony once (a derived ceremony — the data
proves the moment; the time-lapse seeds it). Without this, the locked
promise "the earned cherry-blossom moment" silently skips the app's
most loyal users.

### m-4 — THE STORAGE-LEAF CHARACTER SWAPS AT YEAR 2 (BINARY)
D089 moved storage leaves to structural/rare (2+ qualifying years —
tree tenure per M-5): a daily vlogger's leaf family is ordinary for 2
years, then the WHOLE leaf family swaps to succulent at once — a
silhouette-level flip. Resolution: the succulence character morphs
continuously (succulence ∝ media-share × tenure — a trait-space
gradient, one leaf family, changing shape), or the swap is a designed
moment with a why-panel ("your media made your leaves succulent — the
tree holds its memories in storage leaves"). Also: OLD-GROWTH "full
granularity" for a decade-long daily vlogger = ~3,650 media leaves —
the renderer needs a media-leaf clustering cap (perf pillar, TRAIT-
SPACE §5) even at full granularity.

### m-5 — THE SEEDLING REVIVAL HAS NOTHING TO REVIVE
C-09 return + I-11 You Came Back fire at day 21 (a first-window
return): the tree has no twigs (twigs = one per month of sustained
presence), so the "return = twig revival moment" (INPUT-INVENTORY §3)
and D088's tip-bud revival have no structure to revive. Resolution:
stage-gate the revival expression to SAPLING+ (a branch with twigs);
early returns simply resume growth, and the gap is read honestly by
the rhythm axis. The I-11 flower banks normally (C-3).

### m-6 — THE YEARBOOK AND RING-REVIEW FOR A RING-LESS YEAR
The J5 yearbook PDF and the ring review mode (VISION 16) for a year-0
or branded-ring-less tree: the yearbook is honest as a partial-year
artifact, but both surfaces need the explicit "no ring — first
qualifying year pending" label (and the yearbook's stats page must not
imply a closed year). One line of copy, one test case.

### m-7 — THE MILESTONE-REVIEW ANNIVERSARY vs THE TREE'S YEAR 1
The coach's +1y review (journal anchor) and the tree's year 1 (account
anchor, C-1) diverge for gym-first/deletion histories. Acceptable
once C-1 lands (two surfaces, two anchors, each internally
consistent), but the review's ring-relevant sections (item 37's "the
anchor story") must not claim "ring 1" when the branded ring is
pending (C-5's label).

### m-8 — THE MULTI-TIER RE-BLOOM MECHANIC IS UNSPECIFIED
Multi-tier trophies (I-9 Root→Branch→Heartwood→Grove firing at ~month
2 / month 8 / year 3 / year 6; VII-7; III-19; IX-1; IX-4; V-5; I-12;
I-13; III-18) re-bloom the SAME flower family years apart. The two-axis
system (identity + magnitude, ACHIEVEMENT-SCAN §1.5) gives the
magnitude; the flower layer needs the rule: the family's inflorescence
grows/re-blooms larger per tier-step, never duplicates — one flower
per family, tier-steps raise its magnitude. (Matters for the first
bloom's composition: a family can have two steps banked at once.)

### m-9 — SUB-40-WORD ENTRIES = IMMATURE LEAVES ON DAY 1
The 20-vs-40 word floors (INPUT-INVENTORY §3, "leaf maturity
thresholds") mean a day-1 user writing 25-word entries grows immature
leaves for their first week. Correct and locked, but the why-panel
must explain the leaf state ("entries ≥40 words become mature leaves")
or the early experience reads as "my tree is stunted."

### m-10 — THE VACATION FAMILY'S DAY-COUNT vs THE TREE
VI-2 Took the Time (Root, 14 vacation days/year — day-level UNION) and
VI-1 Off the Grid (Sprout, day 1) are class-4 dated events → twig
anchors/seasonal moments. A user who vacations 3 weeks in year 1 gets
VI-2's Root flower (banked) — fine — but the tree's twig anchors for
"elsewhere" days have no dedicated visual until seasonal moments exist
(SAPLING per the matrix row 4). Note for the input-map step: the
vacation anchor days should feed the same anchored window (E3-style)
the trophy uses, so the tree and the trophy agree on "vacation year 1."

---

## 4. THE HOT ZONES, VERIFIED AND EXPANDED (summary)

| Hot zone (LOOPHOLES §7) | Verdict | Finding |
|---|---|---|
| (a) seasonal cycle vs newborn tree | **Real gap, expandable** | M-2 (+ the seed's phase-neutral state; leaf-litter memory surface; two "leaf fall" events) |
| (b) anniversary anchor | **CRITICAL, two anchors** | C-1 (seed date vs account anchor; deletion shifts birth; journal-less users starve) + C-4 (seed appearance = first event write) |
| (c) media scale (35 GB/yr vs 15 GB) | Real gap, narrow | m-4 (storage-leaf swap; granularity cap) + M-5 (storage leaves tenure-gated); the PC-archive is a media-availability state, not a tree-state change — leaves read metadata (stubs), so archive tier changes nothing temporally |
| (d) calendar tint rule | Real gap, scope ambiguity | M-3 (owner omits classes 5/6 + media; 4-level quantization; habit channel dominates) |
| (e) coach quiet-weeks | Real gap | M-4 (protected absence; no dormancy/decay/axis penalty; bud scales) |
| (f) one-notification constraint | Real gap, resolvable | M-7 (push-only scope; ceremony queue; first bloom absorbs trophy toasts) |

New dimensions found in (a): the seed's phase-neutral first calendar
year, the leaf-litter winter memory surface, and the deletion-vs-
seasonal leaf-fall event split. New dimension in (b): "no entries = no
tree" violates the master principle for every journal-less feature
path — the whole event spine (INPUT-INVENTORY §1) can run with zero
journal entries.

---

## 5. FINDING COUNT

| Severity | Count | IDs |
|---|---|---|
| CRITICAL | 5 | C-1, C-2, C-3, C-4, C-5 |
| MAJOR | 7 | M-1 .. M-7 |
| MINOR | 10 | m-1 .. m-10 |
| **Total** | **22** | |

## 6. CRITICAL LIST WITH LOCATIONS

1. **C-1 Two birth dates / journal-less starvation** — INPUT-INVENTORY
   §14 vs 02-achievements.md:77 (account anchor) vs 03-coach.md item
   37. Seed date must read the frozen account anchor; "no entries =
   no tree" → "no events = no tree."
2. **C-2 Stage starvation on the six-domain gate** — LOOPHOLES §2,
   SCHEMA §3, 04-roadmap.md:47, 02-achievements VIII-5. Split the
   stage clock (tree tenure) from the ring brand (Life-Fully-Logged).
3. **C-3 L-02/L-05 contradiction at the first bloom** — LOOPHOLES §1
   + L-02 + L-05 + §2. First bloom = Sprout→Heartwood buds only;
   Grove buds bank to MATURE; transformations to their tier.
4. **C-4 Undefined stage-transition triggers (the master clock has no
   tick)** — LOOPHOLES §2 "When (derived)" vs VISION 14b; PLAN Step
   8. Exact tenure rules, boundaries tied to VIII-1/VIII-2/VIII-9.
5. **C-5 Calendar ring closure vs anchored windows** — D085
   (07-ledger.md:1452) vs E3 (02-achievements.md:65) vs 04-roadmap:
   47. Season closure = visual; ring brand = anchored window; partial
   years = thin sliver, no brand.

Every resolution above is grounded in the locked design (stage-gated
manifestation, banking, D085/D086/D087/D088/D089, E0-E13, the account
anchor) and requires only DecisionLog entries at the docs pass — no
locked decision is reversed; two ambiguities (D085's "ring closes at
the year boundary," the constraint register's "no entries = no tree")
are tightened, and the L-02/L-05 overlap is disambiguated.