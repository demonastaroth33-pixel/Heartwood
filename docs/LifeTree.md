# Life Tree — canonical spec

**Status:** authoritative spec (M9 milestone). **Source chapter:** the
tree-7 design decisions (D085–D117) consolidated from the
`life-tree-design/` working design. **Authority:** the external folder
stays the authoritative working design (`life-tree-design/VISION.md`,
`SCHEMA.md`, `LOOPHOLES.md`, `ACHIEVEMENT-SCAN.md`,
`INPUT-INVENTORY.md`, `TRAIT-SPACE.md`, `PLAN.md`, `paper-run/`,
`audits/`); this document is the shipped, docs-voice spec that cites
it. Nothing in this document re-creates the design — it consolidates
it. Every number in this document is the engine contract (the
threshold register freezes here at the engine contract; all values
are dev-tunable during development only — see §5).

The tree-1..tree-6 design-dimension skeletons that preceded this
chapter are superseded by tree-7 (D085–D117) and the
`life-tree-design/` sources; their content is absorbed into the
sections below. This document is drafted new; the skeleton records
are retired as drafting sources, with the evidence preserved in the
ledger archive and the external folder.

<!-- REMOVES-existing note (delta §4 / structural proposal §2.5): the tree-1..tree-6 skeleton records (ledger 2355–2397) are REMOVED as drafting sources — superseded by tree-7 (D085–D117) + life-tree-design/VISION.md, SCHEMA.md §2.3/§2.4/§2.5/§2.6, TRAIT-SPACE.md, D094/D095/D099, D111 + the F9 gate, and D117 (development handoff). Evidence preserved; never re-opened. -->

---

## 1. What the Life Tree is

The Life Tree is the app's living meta-surface: a single organism
that *is* the user's life data, grown with real botanical fidelity.
Every input the app records — journal entries, habit completions, gym
logs, food logs, check-ins, goals, achievements — feeds a specific
part of the tree: sections are branches, entries are leaves, habits
are buds, achievements are flowers, completed goals are fruits, and
years are rings. The tree grows slowly, over years, genuinely
mirroring how the user's life changes. Every tree is unique —
structurally and visually — because uniqueness is emergent from the
user's decisions, never chosen. The engine is deterministic: the same
data always produces the same tree. Everything is explainable: the
user can always see *why* the tree looks the way it does.

**The locked principles (D085–D117 + VISION §2), in rule voice:**

1. **Everything feeds the tree.** Every input maps to a botanical
   organ. Nothing is decorative.
2. **Real botanical fidelity.** Growth follows actual botany:
   seed → germination → seedling → sapling → pole → mature, the
   two-engine law (extension = activity volume; thickening =
   year-round consistency), and real anatomy. Authority:
   `research-botany/MASTER-Botany-Reference.md`.
3. **Derived-only + anti-farm (genetic).** The tree's state is
   derived purely from the event log; no direct input, no painting
   rings. The growth engine inherits the locked derived-only,
   facts-only, anti-farm discipline.
4. **Per-user uniqueness — structural AND visual, emergent, never
   chosen.** No skins, no user-picked traits.
5. **Years, not months.** The tree is a multi-year organism; it must
   not change visibly across a month.
6. **Seasonality is real and apparent.** The tree actively changes
   across seasons — beautifully and visibly.
7. **Composite species, not one tree.** The "species" of the user's
   tree emerges from their life.
8. **Cohesion is the single most important constraint.** The tree is
   a composite of traits; everything must look beautiful and
   cohesive (the coherence-envelope rule, §14).
9. **Super-hard achievements = large unique visuals** — a
   transformation visible at a glance, not just a small flower.
10. **Long consistency compounds.** The most consistent users get the
    most beautiful trees with the most meaningful modifications —
    tenure, branch rings, canopy density, caudex, reaction-wood
    history, and winter storage all compound consistency (D088).
11. **Transparency / explainability.** The why-panel is a derived
    explanation of every visible state.
12. **A family of trees.** Different users give different trees.
13. **UI correspondence.** Every section's UI is the local view of
    its tree organ (the duality principle, §4).
14. **Refactor-first on the schema.** The organ map is a baseline to
    attack, never a baseline to keep.
14b. **Stage-gated manifestation.** The tree's life stage is the
    master clock; every visual manifestation passes through the stage
    gate; data is never lost and never unrewarded — it is banked in
    stage-appropriate form until the tree can express it.
15. **The tree is the app's navigation surface.** The tree opens each
    section's content beautifully; it is the meta-UI the sections
    live in.
16. **Anatomical views for every organ** — the full section-view
    mode (root/stem/leaf cross-sections, trunk rings, time-lapse).
17. **Full trait utilization.** The researched variety is completely
    utilized; nothing researched sits unused.

**The explicit NOT-list:** the tree is not decoration (every element
means real data); it is not a write-path entity (the user never
writes tree state; the cache is regenerable); it grants no XP; it
carries no shame (dormant ≠ failed; "resting", never "abandoned").

**The C-15 absorption (record).** The earlier "life tree emotional
engine" candidate (Finch-style care-object growth, Daylio-style ring
visuals, 1SE-style year artifacts, Timehop-style then-and-now,
Standard-Notes-style 10-year pledge) was resolved as absorbed: its
components are locked across D085–D117 (the bank + tier-marked buds +
the ceremony language; the ring brand; the time-lapse + yearly
review; the revisit moments + C-06; the tendrils). Nothing phantom
remains to draft.

---

## 2. The master clock and the shared anchor

### 2.1 The one stage clock (D090)

One master stage clock, derived from growth across **any** domain:

| Tick | Trigger |
|---|---|
| SEED → SEEDLING | the first in-window event (any class) |
| SEEDLING → SAPLING | the first sustained presence period — the first twig on any branch (register B2: ≥15 in-window days within any 30-day window, any-domain-mixed; the window completes inclusively on the day the 15th in-window day lands) |
| SAPLING → POLE | the first qualifying year (any-domain, anchored — never calendar-chopped) |
| POLE → MATURE | derived maturity — a structural-growth threshold at pioneer speed (register B4: ≥2 stage-years AND ≥90 in-window days any-domain-mixed in the best anchored year) |
| MATURE → OLD-GROWTH | the decade scale (register B5: ≥10 stage-years) |

The clock is 100% derived from the event log. Overhaul-independence:
the clock is derived, the anchor is shared foundation, and the ring
definitions are decoupled (§2.3).

### 2.2 The frozen birth anchor (D090/D102/D114)

One frozen birth anchor: the seed date = the account's **first
in-window event ever** (D100 predicate), frozen at creation. Deletion
never shifts it; the anchor rides in the backup format (D098) so
restore and sync never drift it. "No events = no tree" applies only
to the first birth — existence is monotonic once born (the "tree
never dissolves" ratchet, D114).

D102 makes this anchor the **shared anchor for the whole app**: the
tree, the Coach anniversary, the milestone reviews, and the rings all
read the same value. The Coach's anniversary = the same anchor (a
gym-only user gets their milestone review on their tree's birthday).
User-visible consequence: the Coach's milestone-review date may move
for users whose first event was not a journal entry — and it stops
shifting on deletion forever.

### 2.3 Rings are a brand, not the clock (D090/D101/D116)

The six-domain qualifying-year ring definition stays locked as the
ring's *meaning*, but rings no longer control tree growth. Single-domain
users reach full maturity — they just never brand rings. Rings are
calendar-neutral (anchored windows, never chopped). The ring brand
reads the **six core domains** (journal, habits, gym, nutrition,
body, media — the D116 ring fold: goals and periods are excluded from
the brand, present in the axes), so the trunk rings and the trophy
ladder always agree.

### 2.4 Two named year types (D101)

"Qualifying year" meant three different things before this decision;
there are exactly two year types, never confused:

- **Stage-years (any-domain):** the anchored 365-day window (register
  F3) in which the user had sustained presence in any domain (per the
  D100 predicate), read by **cumulative accrual** — ≥200 in-window
  days complete a stage-year, the counter resets at 200 (register A4;
  the every-other-day life takes ~13.2 months per stage-year; the
  literal 365-day-window reading is dead).
- **Ring-years (six-domain, the brand):** the same anchored 365-day
  window with all six core domains present; drives only the trunk
  rings + the ring-tier trophies.

Three rules: (1) the stage clock never reads ring-years — a
single-domain user accumulates stage-years forever, reaches maturity,
blooms, grows old, and never brands a ring; (2) the tenure floors
read stage-years (D089's "2+ qualifying years" = 2+ stage-years per
D093); (3) one window mechanism, two requirements.

### 2.5 The presence predicate — the two-tier split (D100)

The retroactive/bulk-logging contradiction ("retroactive/bulk logging
NEVER rewards" vs "backdating advances honestly") is resolved with
one shared predicate that fixes both the tree and the gamification
yearly bars — no tree special-case:

- **Presence organs** (twigs, the RHYTHM axis, dormancy, bud
  momentum, qualifying days) read dayKey **with a written-in-window
  guard** — a day counts as presence only if its events were written
  within a small grace of that day (**±3 days** — the streak grace
  philosophy; register A1, verbatim-critical).
- **Content organs** (leaves, fruits, the anchor) read **occurredAt
  truth** — content is real; presence is earned.
- The rule in one line: *an event counts as presence for a dayKey
  only if written within the grace window.*
- Imports stay excluded everywhere (locked).
- The anchor edge: the tree's birth = the first in-window event — a
  pure backfill cannot birth the tree.

Worked example: an honest Sunday catch-up renders Friday's leaf and
counts it; the attack — backfilling a whole year in one weekend —
leaves every dayKey outside the grace with zero qualifying days, zero
twigs, zero stage ticks; leaves render but the year cannot become a
ring — honestly visible, honestly un-earned.

<!-- Consolidation note (D115): D085's "the ring closes at the year boundary" means the ANCHORED window's boundary (E3/D090), never calendar-chopped. D085's "greener winter canopy" is SUPERSEDED by D095's leaf-bud model (§9) — a winter of logging makes the spring flush denser (the bank), not the winter canopy greener. -->

---

## 3. The canonical domain table (D104)

One canonical table; every system reads it (the BALANCE axis, the
ring-years, the tint owner, the achievement-family attachment, the
twig sources). Two-level model: **presence-domains** (what counts in
rings, axes, tint) vs **branches** (what the tree grows). Presence =
creation events only (the D100 in-window predicate); content organs
are mutation-aware.

| # | Presence-domain | Presence owner (creation events) | Tree attachment | Twig source | Families |
|---|---|---|---|---|---|
| 1 | Journal | journal.created + reflection.created | journal branch (1:1) | journal-active days | I (17) |
| 2 | Habits | habit.completed + habit.rest_planned (protected) | habit branch (1:1) | habit-active days | II (15) |
| 3 | Gym | workout.completed (+ pr rides) | gym branch (1:1) | workout-active days | III (28 + 47 rungs) |
| 4 | Nutrition | nutrition.logged | nutrition branch (1:1) | nutrition-active days | IV (14) |
| 5 | Body | body.weighed (first-of-day canonical) | gym branch's body-forks (sub-branch); body days count toward the gym branch's presence — forks are render structure, never a gate (D115) | weigh-in days feed the body-forks' twigs | V (16) |
| 6 | Media | media.added (entry + vault) | journal branch's media-forks (sub-branch); media days count toward the journal branch's presence — forks are render structure, never a gate (D115) | media days feed the media-forks' twigs | VII (12) |
| 7 | Goals | task.completed + goal.completed | goals branch (1:1) | goal-active days | (fruits; IX is separate) |
| 8 | Periods/Vacation | logged vacation periods + habit.rest_planned (protected presence) | no branch — feeds the base + dormancy logic | none (absence is the signal) | VI (4) blooms at the base |

**Special attachments:** VI Elsewhere → the tree's base (root flare);
VIII Rings (20) → the trunk; IX Full Circle (5) → the crown center
(the integration point).

**The 7→5 mapping:** journal→journal · habits→habits · gym→gym ·
nutrition→nutrition · body→gym (body-forks) · media→journal
(media-forks) · goals→goals. Periods→base.

**Attachment rules (separation only if worth it):** BODY is a
sub-branch of GYM (the physique/weight track); its 16 trophies bloom
on the gym branch body-forks. MEDIA attaches to JOURNAL (media rides
on entries); media presence counts as its own domain for rings and
axes; media trophies bloom on the journal branch media-forks. GOALS
gets a presence definition (progress events / task completions =
goal presence) and counts for the axes and presence; the ring brand
reads the six core domains only (D116 D10 — goals excluded from the
brand, present in the axes).

---

## 4. The organ map and the duality principle (D088 A/B, D087)

### 4.1 The anatomy

- **Trunk + annual rings** — years; the only organ belonging to no
  section; girth = overall consistency.
- **5 first-order branches** = the 5 fixed app sections (journal,
  habits, gym, nutrition, goals) — all present from day one; no "new
  domains", no domain "dies".
- **Leader (apical dominance):** the most sustained domain leads the
  crown.
- **Forks (second-order):** derived only from sustained
  differentiation of genuine sub-features.
- **Twigs (canopy mass):** one twig per month of sustained presence
  per domain — canopy density *is* consistency made visible.
- **Leaves** — entries/trophies (days); media-rich entries render
  with the storage-leaf character.
- **Buds** — habits (streaks); **flowers** — achievements (rarity);
  **fruits** — goals (milestones), hanging on **fruit spurs** =
  completed goals.
- **Branch rings:** each branch carries its own rings = the years
  that domain was actively present (register C14: ≥40 in-window days
  in an anchored year).
- **Dormancy + revival:** no death, no scars; the branch resumes from
  tip buds.
- **Vascular system** — nutrition (the tree's throughput, running
  through the trunk); **wood quality** — gym consistency (dense
  latewood).
- **Scale separation:** trunk+rings = years · branches = domains ·
  forks = sub-features · twigs = months · leaves = entries/trophies
  (days) · buds = habits (streaks) · flowers = achievements (rarity) ·
  fruits = goals (milestones).

### 4.2 Habits are buds (D087)

Every active habit is a bud on the habit branch: dormant when
unworked, swelling with streak momentum, bursting into new
growth/leaves on completion, withering honestly when abandoned.
Abandoned habits leave **bud scars** (the tree records habit history
like a real tree records its buds). Habit completions feed the
extension engine. One system — the bud is a native part of the tree,
not a second visual layer.

### 4.3 The duality principle (D088 B)

Every section UI is the local view of its tree organ — one derived
state, one animation language, two scales:

| Section | Local view |
|---|---|
| Habits | the bud garden (the habit card = the bud's local view; bud states replace the mini-plant stages — D112 DV-C5) |
| Journal | leaves |
| Nutrition | the sap monitor |
| Gym | branch growth |
| Goals | the orchard |
| Achievements | the garden |

The app becomes one organism visually *and* structurally.

---

## 5. The threshold register (D105/D115/D116 — SCHEMA §2.4)

Every number in the tree, one list. All groups (A–F) approved; every
value is verbatim-critical and freezes at the engine contract. **All
values are dev-tunable** (D105): the register ships a dev-only debug
panel that tweaks any value and drives a live re-derivation +
re-render — used by the paper run, the archetype mockups, and the
perf gate — **never shipped to users** (a D117 B3 gate: the panel
must exist before any visual tuning).

### Group A — the presence bars

| ID | Bar | Value |
|---|---|---|
| A1 | grace window (written-in-window presence, D100) | ±3 days |
| A2 | qualifying-event rule | journal ≥40 words non-imported · gym ≥1 real logged set · nutrition ≥1 real food-log · body ≥1 canonical weigh-in · habits 1 completion · media 1 add |
| A3 | twig bar — per-class (D116) | journal/habits/nutrition/goals ≥15 in-window days per calendar month · GYM ≥8 days/month (2×/week passes; 3×/week = 12–13, comfortably over) · BODY/MEDIA ≥4 active weeks/month. The calendar-month reading is pinned — the February dip is an honest feature, never a lottery. **PLUS the canopy rule (D116):** any month with ≥15 in-window days any-domain-mixed grows a twig on the month's most-active branch |
| A4 | stage-year bar (D116 pin) | ≥200 in-window days, cumulative-accrual — the count accumulates from the anchor; a stage-year completes at 200, the counter resets (the every-other-day life takes ~13.2 months). Active day = a day with ≥1 in-window event |
| A5 | ring-year per-domain bar | ≥40 in-window days per domain over the six core domains (the D116 ring fold) |
| A6 | backfill-trophy predicate (D116) | the isBackfill exclusion extends to trophy conditions — qualifying content fires trophies only for in-window days |
| A7 | goals = fruits only (D116) | the goals branch carries fruits + spurs + tendrils; goal completions never produce flowers; the why-panel is the goal storyteller |

### Group B — the stage gates

| ID | Gate | Value |
|---|---|---|
| B1 | SEED → SEEDLING | the first in-window event |
| B2 | SEEDLING → SAPLING | ≥15 in-window days within any 30-day window, any-domain-mixed (the window completes inclusively on the day the 15th lands — the paper-run pin; the every-other-day 30-day window holds exactly 15) |
| B3 | SAPLING → POLE | 1 stage-year (A4) |
| B4 | POLE → MATURE | ≥2 stage-years AND ≥90 in-window days any-domain-mixed in the best anchored year (D116 — the mixed-domain fix: the sparse-stubborn, rotating, every-other-day, and body-only users all mature; no gate ever blocks on a single domain or a twig count; crown breadth is the BALANCE axis's business) |
| B5 | MATURE → OLD-GROWTH | ≥10 stage-years |

### Group C — the capacities & budgets

| ID | Capacity | Value |
|---|---|---|
| C1 | bloom budget | ≤15 flowers per bloom event (waves per D099) |
| C2 | bloom waves max | ≤4 waves per flowering season (60 flowers/season; overflow banks to the next spring — no flower lost; the bank counter always shows the pending count) |
| C3 | habit-bud cluster threshold | ≥30 buds per branch → clusters (individual buds ≤29; clusters reveal on zoom; the count stays honest) |
| C4 | legend transformations | 1 per annual bloom + 1 all-time crown (the earliest-earned Grove is the crown — D116 tiebreak; other Groves get large blooms, not the transformation; the crown is derived, never stored in the backup) |
| C5 | twig capacity | ≤12 twigs/branch/year (the monthly unit) + a retention window (candidate: the last 3 years' twigs render individually; older twigs merge into the branch's woody character) |
| C6 | leaf-cluster granularity unlock | at POLE (the stage gate, the zoom mechanic) |
| C7 | bank-counter display | top 3 by tier + the count ("+47 more"); the why-panel lists the full bank; a closed bucket shows restore-foreclosed trophies (never silence); the legend card computes its numbers from the tree state, never templates (D116) |
| C8 | spur economy (D116) | a fruit spur = one per milestone/phase of a goal (~54–90 for a real life) + a cluster rule — never per-task |
| C9 | repeat-bloom aggregation (D116) | the same achievement's re-fires merge into one flower with a count badge, capped per achievement per bloom event; the C3 cluster surface extends to the flower-bank; per-habit caps apply |
| C10 | coach-line cap (D116) | Ring/Grove Coach lines capped per bloom event (the one-line discipline extended) |
| C11 | empty-spring rule (D116) | an annual bloom with nothing earned gets the quiet-spring copy — "the tree rests this year - every year it blooms is earned" — never silence |
| C12 | never-mature manifest fallback (D116) | a pending adaptation with no annual bloom to manifest at manifests at the next spring check regardless — never pending forever |
| C13 | schedule pins (D116) | the first bloom defers to the next spring flush when maturity lands in winter (winter-exempt); the bank is evaluated at bloom opening (the same-day boundary) |
| C14 | branch-ring bar (D116) | a branch ring = an anchored year in which the domain had ≥40 in-window days (the A5 per-domain logic, no six-domain requirement) |

### Group D — the tenure floors

| ID | Floor | Value |
|---|---|---|
| D1 | structural-modification floor | ≥2 stage-years |
| D2 | buttress floor | ≥3 stage-years |
| D3 | caudex floor | ≥5 stage-years |

### Group E — the adaptation axis signatures (gates, not triggers — D103)

| ID | Adaptation | Signature (gate) |
|---|---|---|
| E1 | caudex | tenure ≥0.7 AND resource ≤0.6 (the ~8.3-year cadence pinned — D116; the MATURE floor dissolves with B4's mixed-domain bar) |
| E2 | buttress | balance ≥0.7 ONLY (D116 + the recording audit — the balance leg *is* the whole signature; at the F4 ceiling 12 the rotating logger sits at 0.083 resource, so any resource leg would exclude the balance champion) |
| E3 | phyllodes | resource ≤0.4 AND rhythm ≥0.5 (D116 — the steadily-sparse acacia, never the bursty or the lush) + persist-intensity reversion: once manifested the adaptation stays, but its visual intensity scales with the current axes at each bloom checkpoint |
| E4 | cladodes | streak-without-entries divergence ≥0.6 |
| E5 | storage leaves | media share ≥0.5 of entry content — metric = attachment-mix (media attachments / total attachments, not bytes, not words — D116) |
| E6 | thorns | 52 consecutive weeks of sustained presence in a domain (any domain — the cadence-relative armor, D116) + tenure ≥2 stage-years |
| E7 | spines (subtle) | 26 consecutive weeks of sustained presence in a domain (any domain — D116) |
| E8 | tendrils | a live long-horizon goal (>1 year, in progress) |
| E9 | reaction wood + epicormic | a revival — an unprotected dormancy ending (D116: planned returns from rests/vacations/quiet-weeks are NOT revivals — the protected-absence exclusion) |
| E10 | contractile | 3 consecutive anchored 365-day windows with rising active-day counts (D116 pin) |
| E11 | mycorrhizal | coach engagement ≥ the threshold per the coachEngagement owner (one derived owner; opt-ins/deletes never feed it) |
| E12 | stolons | a sustained L-10 insight confirmed ≥3 monthly windows in a row |
| E13 | bracts | no gate (ceremony display) |
| E14 | bud scales | no gate (the dormant-habit state) |
| E15 | dormancy threshold (D116) | a dormancy = ≥14 consecutive days with no in-window presence (a fortnight of quiet); a revival = the dormancy ends — the E9 trigger unit. The VII Proof of Life family counts kept photos + vlogs (the media trophy census, D116) |

### Group F — the time windows & formulas

| ID | Item | Value |
|---|---|---|
| F1 | season-phase | fixed dates — spring Mar 1 / summer Jun 1 / autumn Sep 1 / winter Dec 1 — and the render clock = the stored timezone setting (not the live device clock; travel never flips the seasons; the derivation uses dayKeys, never instants) |
| F2 | growing season | spring → autumn (Mar 1 – Nov 30); winter = the resting/banking season (D095) |
| F3 | anchored windows | 365 days anchored to the frozen birth anchor (never calendar-chopped; both year types share it) |
| F4 | RESOURCE | avg in-window events per active day, normalized 0–1, ceiling 12 (D116 — the 20-ceiling sparse-misread is dead) + the event unit pinned: per-input-class events, one count each (a meal = 1, a set = 1, a photo = 1) |
| F5 | RHYTHM | 1 − (stddev/mean of weekly active-day counts), clamped; active day pinned = a day with ≥1 in-window event (D116); the protected-absence discount lives here (planned rests, vacations, quiet-weeks are discounted from the weekly counts) |
| F6 | BALANCE | Shannon evenness across the canonical-7 presence-domains, present or not (D116 pin) |
| F7 | TENURE | stage-years / 10, clamped at 1 |
| F8 | replay pacing | ~2s per year (the D097 time-lapse; tunable at the mockup step) |
| F9 | perf gate | ≤16ms/frame at LOD-1/2 on the target device tier (the milestone gate numbers; the archetype perf runs measure against it) |
| F10 | future-dating clamp | events with occurredAt in the future are excluded from all math (D114) |

<!-- Supersession note (D115/D116): the earlier B2 draft value of 20 in-window days is superseded by the register value 15 (D116 S1). The A4 literal-365-day-window reading is superseded by the cumulative-accrual reading (D116 S2). The RESOURCE ceiling is locked at 12, not 20 (D105 note / D116 D3). -->

---

## 6. The trigger-correlation table (D103/D106 — SCHEMA §2.5)

Every trigger in the tree — its condition, its gate, its visual, its
schedule — visible in one place. Nothing fires twice; nothing is
hidden.

### 6.1 The trigger authority (D103, restated)

The achievement system is the trigger authority **for everything that
has an achievement condition** — the flower tier system, the
adaptation gates, the ceremony: no feature may invent a trigger where
an achievement already encodes the condition. **Derived triggers** are
a second, legitimate family, with one discipline: they fire only on
derived patterns the achievement system does not cover, and each gets
its own row in this table. **The no-double-fire rule:** if a derived
pattern AND an achievement would both trigger the same visual for the
same condition, the achievement wins and the derived trigger yields —
one visual, one source, no double events.

### 6.2 A — The flower triggers (D092 schedule + D091 overlay + D096 banking + D095 seasons + C4 legend cap)

- Every achievement → a flower at its tier magnitude + family
  identity (the D091 overlay). Pre-maturity: banked as tier-marked
  buds (D096). First bloom at maturity: Sprout → Heartwood burst
  together — with the winter deferral (D116/C13: a winter maturity
  defers the first bloom to the next spring flush). Post-maturity:
  growing-season earns bloom on-earn; winter earns bank to spring.
  Ring tier → the annual bloom. Grove → the next annual bloom as the
  transformation (C4 legend cap: 1 per bloom + 1 crown).
- **F-03 PR ceremony — NO BLOOM (user arbitration, locked):** the PR
  ceremony fires on PR events (not achievements) and manifests as a
  **non-bloom bract-style flourish** at the logging moment (the
  ceremony's sparkle) — zero flowers; the flower = achievement
  contract survives.

### 6.3 B — The 14 adaptation triggers

Each adaptation fires on its derived pattern, passes its gate (tenure
floor + axis signature + stage floor — the E-group), and manifests at
the next annual bloom (D093). The manifest moment is the one yearly
heartbeat that hosts flowers + structural transformations; a visible
pending state exists before.

| # | Adaptation | Trigger (condition) | Gate | Stage floor |
|---|---|---|---|---|
| 1 | caudex | derived — tenure ≥0.7 + resource ≤0.6 (no achievement encodes "7+ stage-years AND sparse"; cousin VIII-4 Ten Years noted, different condition — no double-fire) | D3 (5 stage-years) + E1 | MATURE |
| 2 | buttress | derived — balance ≥0.7 only | D2 + E2 | POLE |
| 3 | phyllodes | derived — resource ≤0.4 AND rhythm ≥0.5 (the steadily-sparse acacia) + persist-intensity reversion | D1 + E3 | SEEDLING (leaves exist) |
| 4 | cladodes | derived — streak-without-entries divergence ≥0.6 | D1 + E4 | SAPLING (branches exist) |
| 5 | storage leaves | derived — media share ≥0.5 of entry content | D1 + E5 (the structural-tier floor restored by D114) | SEEDLING (leaves exist) |
| 6 | thorns | derived — 52 consecutive weeks of sustained presence in a domain (any domain) + tenure ≥2 | D1 + E6 | SAPLING (branches exist). Same condition also produces the domain's flower — different visuals (armor vs bloom) — both fire |
| 7 | spines (subtle) | derived — 26 consecutive weeks of sustained presence in a domain (any domain) | no tenure gate (subtle tier, D089) | SAPLING |
| 8 | tendrils | derived — a live long-horizon goal (>1 year) | E8 | SAPLING (branches exist) |
| 9 | reaction wood + epicormic | derived — the revival event (an unprotected dormancy ends; ≥14 consecutive quiet days per E15; planned returns are NOT revivals) | universal (no gate) | the organ exists |
| 10 | contractile | derived — 3 consecutive anchored 365-day windows with rising active-day counts | no D1 floor (subtle tier per D089 — D114) | the organ exists |
| 11 | mycorrhizal | derived — coachEngagement owner ≥ the threshold | universal (no axis gate) | the organ exists |
| 12 | stolons | derived — a sustained L-10 insight (same cross-domain influence confirmed ≥3 monthly windows) | universal | the organ exists |
| 13 | bracts | display — the F-03 flourish + the bloom presentation | no gate | — |
| 14 | bud scales | derived — the dormant-habit state | no gate | — |

### 6.4 C — The structural/ceremony triggers

Stage transitions (D094 + the B-group ticks) · seasonal states (D095 +
the F-group) · the first bloom (B4) · the winter bank → spring flush
(D095) · the launch-day replay (D097) · the restore re-derivation
(D098) · the annual bloom (F2 window; waves C1/C2).

### 6.5 D — The no-double-fire map

- Same visual for the same condition: the achievement wins; the
  derived trigger yields.
- Same condition → different visuals: both fire (e.g., the 365-day
  streak earns the trophy's flower AND the branch's thorns — armor
  and bloom are distinct visuals).
- Contradictory signatures: impossible by construction (caudex vs
  buttress — the same axis numbers cannot satisfy both).
- The F-03 flourish is non-bloom — no conflict with any flower.

---

## 7. The tree-state model (D107 — SCHEMA §2.6)

The derived cache holds **only what the renderer draws and what the
derivation tracks incrementally** — every other fact stays in its
owning system (achievements, streaks, goal progress, media, the
clock), queried on demand. No duplication, no drift, no stale copies.

The lean pass is documented: dropped — bank counts (derivable from
bankBuds), tier/family on buds+flowers, streakDays, wordCount/media
counts, the season block + growingSeason (a pure function of
date+timezone), scaleWrapped/persistent/alive-fallen/waveSlot,
extended/firstTwigKey/woodCharacter, ringYears (rings.length), ring
passed-flags/quality, growsWithStage/earnedDateKey, anchoredYear, the
base block. Changed — revivals [dateKey], adaptations on their organ
only, fruits = completed goals only, leaves = render-scale only,
crown → legendAchievementId (once-set), stageYears +
currentWindowDays.

The model (the engine contract's data structure, verbatim-critical):

```
meta      { schemaVersion, registerVersion, logFingerprint, derivedAt, anchor }
stage, stageYears, currentWindowDays
axes      (resource, rhythm, balance, tenure)
bankBuds  [{ achievementId }]                      # order = earn order; aggregated by achievementId (C9)
legendAchievementId                                 # the crown, once-set
trunk     { rings: [{ index, sliver }], adaptations }
branches  [{ domain, dormantSince, revivals: [dateKey],
             twigs: [{ monthKey, daysPresent }],
             forks: [{ type, twigs }], rings, adaptations, fruitSpurs }]
habits    [{ habitId, state: dormant|swelling|bursting|scarred, clusterRef }]   # clusterRef per C3
leaves    (recent granularity rows + older cluster aggregates)
flowers   [{ achievementId, bloomDateKey, state: bud|bloomed|faded }]
fruits    [{ goalId, dateKey }]
periods   [{ type, startKey, endKey }]
```

The season phase is computed (date + the timezone setting), never
stored.

---

## 8. The derivation protocol (D108)

1. **The incremental update.** The derivation reads the delta (events
   since the cache's logFingerprint) + the cache itself (the previous
   state) → computes the new state → **atomic swap** (one transaction;
   the renderer never sees a half-written tree). Full re-derivation
   only on: first launch (D097), restore (D098), a fingerprint
   mismatch, or a register-version bump (the dev tools). Incremental
   cost per event is bounded.
2. **The first-paint contract.** The cache is persisted (survives app
   restarts); first paint = the current state blob instantly (LOD
   mass, not detail). The derivation runs **off the UI thread** (an
   isolate); a stale cache re-derives in the background with the
   shimmer until it lands. The decade-user's tab open never
   re-derives 200k events on the main thread.
3. **Order-independent derivation.** A **set-commutative fold**:
   resolve each entity to its final state (newest create, latest
   supersede, tombstone/revoke netting) and fold the resolved set —
   the same merged log always produces the same tree regardless of
   arrival order; delete-before-create, revoke-before-event, and
   parallel supersede chains cannot resurrect or regress organs.
4. **Two-tab concurrency.** A single-writer derivation lock (only one
   tab derives at a time; the loser defers and re-checks the
   fingerprint). The derivation is idempotent (two tabs deriving the
   same delta produce the same state — the loser's result is
   discarded). Ceremony delivery is per-tab.
5. **The in-session ceremony state machine.** Ceremonies never
   interrupt an active session — they queue (the D094 replay-on-open
   watermark covers offline). An in-session transition fires only at
   a safe moment (tree tab visible, no modal, no composition in
   progress). The user's writing is never interrupted by a bloom.

---

## 9. Seasonal organ states (D085/D095)

The tree's year has two halves: the **growing season** (spring →
autumn: blooms, leaf production, growth flow) and the **resting
season** (winter: everything banks). The calendar year is the tree's
botanical cycle; user data modulates the season visuals (intensity
modifiers: rich journaling spring = dense bloom; heavy gym summer =
thick latewood; quiet year = sparse bloom, honestly shown). The
engine has a season-phase function (register F1/F2) + data intensity
modifiers; the why-panel explains both halves.

Per-organ states:

- **Flowers** — growing season: blooms happen (post-maturity on earn;
  Ring/Grove at the annual bloom). Winter-earned achievements bank as
  flower-buds and bloom in the next spring's flush (amends D092 rule
  3). The bloom is **ephemeral** — blooms hold through their
  flowering season, then fade (the cherry blossom's beauty *is* its
  brevity); permanence lives in the why-panel, the archive, and the
  branch character/rings.
- **Leaves** — growing season leaves; autumn leaf-fall (deciduous
  honesty). Winter entries become **leaf-buds** on the bare branches
  (visible, honest, promising).
- **Fruits** — ripen in autumn. Winter-completed goals =
  **winter-persistent fruits** (crabapples/hawthorn hips), falling at
  spring.
- **Habit buds** (D087) — winter = scale-wrapped dormant buds, alive
  underneath.

**The winter bank → the spring flush** is the unifying concept:
everything done in winter is stored as buds; spring converts the
whole bank at once.

**Derived override:** a phyllode/evergreen-character tree keeps its
leaves through winter.

<!-- Supersession note (D095): the earlier "greener winter canopy" idea is superseded by the leaf-bud model — a winter of logging makes the spring flush denser (the bank), not the winter canopy greener. -->

---

## 10. Stage-transition UX and the ceremony language (D094/D086/D112/D106)

1. **The day-1 experience.** The seed is a closed package (coat +
   embryo + food, botany-correct): one beautiful stylized seed, the
   overview strip with the 5 domains as ghosted branch-buds ("where
   your branches will grow") + the bank counter. The day-1 tree must
   be beautiful on its own.
2. **The germination moment.** The first logged event plays the first
   transition (seed cracks, root curls down, tiny stem rises;
   SEEDLING arrives with 5 branch-buds + the first achievement bud).
   The first log visibly grows the tree — the hook.
3. **Every transition is a designed moment.** Triggers = the D090
   ticks, firing live or queued. **Replay-on-open + viewed-watermark:**
   unviewed transitions play chronologically on the next open, then
   settle — this mechanism is the M9 launch-day replay engine.
   The moments: germination, first branch, pole-rise, MATURITY +
   FIRST BLOOM (the biggest — skippable, shown once, 8–12s),
   old-growth. Notification story: no push. Reduced-motion static
   fallback. Durations: germination ~3s, transitions ~2–4s, first
   bloom ~8–12s — **nothing loops, repeats, or spams.**
4. **The why-panel carries the schedule at every stage** (stage name,
   age, next tick's progress, bank count + bloom schedule).
5. **The overview strip lives at every stage.**

**The ceremony language** is ONE shared language owned here: the F-03
PR flourish (bract-style, zero flowers — D106), the F-15 weight-ladder
hero ring, and the **ink-wash blush** as the one saturation moment
(D112 DV-C2 — the bloom palette derives from the Heartwood ink/paper
tokens, dark-first; the blush is reserved for the flowering events,
like gold is for streaks). NOT confetti. The blush palette decision is
open to edits during implementation/visual testing — the tokens join
the dev tools' playable surface, the final blush treatment tuned at
the mockup step.

**The early-fire expression contract (D096).** Rare-tier trophies can
fire before the tree can express them; the ladder: (1) pre-maturity —
the earned massive trophy is not a plain bud but a **special banked
form** (the bud wears the trophy's tier + family identity from day
one; a Grove bud is visibly different from a Sprout bud; the why-panel
explains — "Dragon Slayer - Grove - this bud carries the strongest
bloom your tree will ever grow."); (2) the bank grows with the tree
(a Ghost bud on a sapling looks promising; on a pole-stage tree it
looks imminent); (3) the annual bloom — the transformation manifests.
Supporting rules: tier-visible banking (every banked bud wears its
tier's visual weight + family identity — the D091 overlay applies to
buds too); the bank counter is a real surface (bank composition by
tier — "5 buds: 3 Sprout, 1 Heartwood, 1 Grove"); the earner's
ceremony is never delayed (the Coach line + trophy claim fire at
earn-time; only the visual manifestation waits); genetic-ceiling
trophies get the most distinct bud form (Dragon Slayer 260kg, The
Brand 5M kg). The closed loop: every trophy — day 1 or year 10 — has a
dated, visible, honorable expression at every moment of its life:
earned → banked (tier-marked, growing with the tree) → bloomed or
transformed at its scheduled event. No trophy ever a silent bud; no
trophy ever flattened.

**The first-bloom contract + tier schedule (D092):** (1) pre-maturity
(seed → pole) — every earned achievement is an achievement bud —
claimed, visible, the why-panel states "blooms at the first bloom";
nothing blooms before maturity; (2) first bloom (at derived maturity)
— all banked Sprout/Root/Branch/Heartwood buds burst together (the
earned cherry-blossom moment; magnitude by tier, identity by family,
accents by data); Ring/Grove stay banked; (3) post-maturity —
Sprout..Heartwood bloom directly on earn; (4) Ring tier — blooms at
the next annual bloom (the D085 spring, calendar-guaranteed); (5)
Grove tier — banks until the next annual bloom after maturity = the
transformation (the D086 large visual), calendar-guaranteed, rare
because Grove trophies are rare; (6) multi-tier trophies per their
own thresholds. Supporting rules: the Coach line fires at the earn;
the bloom is a silent visual; the why-panel states the schedule; the
first bloom is a designed event. Nothing unrewarded, nothing
flattened.

**The modifications schedule (D093)** — a modification is the
structural form of a massive achievement, through four gates: (1)
trigger (the massive achievement/condition fires at claim-time; the
trophy system untouched); (2) tenure floor (reads the tree's own
stage-years — not the six-domain ring brand; the ring remains a
separate honor, a badge, never a gate); (3) axis signatures (the
E-group, unchanged); (4) stage floor (a modification transforms an
organ that must exist and have substance — thorns need SAPLING+,
storage leaves SEEDLING+, buttress POLE+, caudex MATURE+).
Manifestation moment: the next annual bloom (the D085 spring growth
event) — one yearly heartbeat hosts flowers + structural
transformations; a visible pending state exists before. Subtle
details (reaction wood, epicormic, mycorrhizal, bracts, bud scales,
contractile, stolons, spines, storage-taproot): no stage floor beyond
the organ existing. The massive-trophy link: caudex = unbroken-year
trophies; thorns = streak trophies; buttress = multi-domain trophies.

---

## 11. The launch-day contract (D097, with D100)

The tree ships in M9 while users log from M0; a veteran's first open
would otherwise render years of history at once. The contract:

1. **The tree is derived from the full history from day one.** The
   veteran's tree is already mature on the first open; rings read the
   frozen anchor — 5 real rings, honestly; no fake fresh start.
2. **The journey replays, once, elegantly.** The D094 replay engine
   runs in sequence (seed, germination, then time-lapse mode): the
   tree grows year by year in a compressed **~20–40s** sequence
   ending at the current state; the why-panel narrates ("2029 - your
   first year - the gym branch grew. 2030 - your first ring.").
3. **The viewed-watermark** — plays once, skippable; the
   reduced-motion fallback jumps straight to the current state.
4. **The perf contract** — first frame = the current state instantly
   (the skeleton shimmer rule); the replay streams from
   **precomputed yearly snapshots**, never live re-derivation;
   background-loaded.
5. **The backdating window** — pre-M9 history is fully derived; manual
   backdating of NEW events is governed by D100's two-tier split —
   content is real (occurredAt truth), presence is earned
   (written-in-window guard) — the tree never rewinds.
6. **The legend card** — one-time card after the replay: "Your tree
   is 5 years old - 4 rings, 12 branches, 37 blooms. The rarest:
   Ghost in the Machine - blooming at the next annual bloom." The
   legend card computes its numbers from the tree state, never from a
   template (D116).

<!-- Consolidation note (D115): D097's backdating premise citation is re-pointed to D100 (the two-tier split). -->

---

## 12. The restore/backup contract (D098/D109)

Restoring an older backup could regress the tree (stage clock
rewinds, rings shrink, blooms un-bloom, scars resurrect). The deepest
lock: the tree records life; life doesn't rewind. The contract:

1. **The tree state is a derived cache, not source data.** The event
   log is the source of truth; the tree is a pure function of the
   current log. A restore replaces the log; the tree re-derives; there
   is no separate tree state to corrupt.
2. **Monotonicity by design.** The birth anchor is frozen at account
   creation; the backup format carries it (formatVersion 3, D109);
   rings derive from the current log against the frozen anchor — an
   older restore honestly shows fewer rings.
3. **The three restore cases.** Same-era: nothing changes. Older:
   re-derives honestly — fewer rings, earlier stage, banked buds
   un-bloom, scars vanish; the why-panel narrates "your tree reflects
   your data as of [date]"; the D094 replay engine offers the
   "rewind journey". Newer: re-derives forward. **The guardrail:**
   restore is an explicit conscious act; the why-panel stamps the
   restore date; no silent regression ever.
4. **The re-derivation moment is a designed transition.**
5. **The cache rule.** The tree cache is regenerable — never part of
   the backup format's integrity story; it rebuilds off-thread,
   shimmer-first.
6. **What never shrinks.** Nothing in the current log; the log is
   append-only in normal life; only an explicit restore rewinds it.

**The device-state cluster (D109):** the viewed-watermark's home is a
synced `viewed_moments` table — user state (like settings), never a
regenerable cache; the account-once guarantee (the launch replay
plays once per account, synced across devices) + per-device delivery
(a transition seen on the phone still plays on the desktop — a
delivery difference, not a state difference). formatVersion 3 carries
a monotonic `logFingerprint` (eventCount + syncSeq) — a restored
backup tells the cache it is stale immediately (no blind
re-derivation, no stale-tree windows); the cache itself stays out of
the format. A restore is account-level — it supersedes all devices;
every device re-derives from the restored log. The delivery/state
separation: derived facts converge on every device from the same
merged log; only delivery (watermarks) and presentation (local bytes)
differ.

---

## 13. Privacy and copy boundaries (D110)

1. **The mirror's payload-blindness.** `coach_outputs` rows store
   rendered text in all 9 kinds; the tree mirrors **H3 owners only,
   never coach_outputs rows** (the mycorrhizal character, the
   "resting" copy, and the earn-line behaviors read the derived
   owners). The tree's read surface never includes coach_outputs —
   structurally enforced.
2. **The why-panel value law.** The panel may show ONLY (a) facts
   derivable from the event log and (b) the register's values — never
   (c) free text from any stored system and never (d) LLM narrative.
   Every why-panel row is checked against the four clauses.
3. **The sharing-safe default.** The tree is a screenshot surface —
   sensitive rows (body weight trend, nutrition numbers) render their
   copy collapsed ("derived - see the section") unless in-app with
   the panel expanded. The tree itself is sharing-safe by
   construction.
4. **The L10N contract.** The why-panel copy and the ceremony
   narration are localizable strings, never inline; the tree-state
   model contains zero prose (verified in the lean model);
   localization wraps the render layer only; the derived-copy engine
   (the why-panel's sentence builder) is the single place where
   language lives.
5. **The axes' import-filter.** The axis formulas (F4–F7) read
   in-window, non-imported events only — an imported batch can never
   skew RESOURCE/RHYTHM/BALANCE.
6. **The read-surface exclusion.** The tree's derivation reads the
   event log + its own H3 owners only — never the gamification cache
   tables, never coach_outputs, never goal-system internals beyond
   the agreed owners. The M7 analytics cache serves the Coach's
   windows; the tree derives from the log directly (its own cache),
   never from the M7 tables.

<!-- Supersession note (D110(1)): D099's N-6 mirror clause ("derived coach_outputs facts do appear") is SUPERSEDED by payload-blindness — the read-surface exclusion replaces it. -->

**Protected-absence copy:** a dormant branch says "resting", never
"abandoned". Quiet-weeks do not pause the tree's growth (the tree is
data-derived; a quiet-week is a Coach delivery discipline, not a data
state), but they extend the protected-absence mechanism (periods) —
the branch copy says "resting" and the RHYTHM axis discounts them
like planned rests. One mechanism, three sources (rest flags,
vacation periods, quiet-weeks) — D114.

---

## 14. Rarity, identity, and coherence (D091/D086/D112/D113)

### 14.1 The flower overlay — trophies unchanged (D091)

The 131 trophy names and the tier labels (Sprout / Root / Branch /
Heartwood / Ring / Grove) stay **exactly as they are** — zero redo.
The flower thematic is carried by an **overlay**: every achievement
wears its flower identity in the tree via the identity axis (family →
flower family) + tier magnitude + derived accents (D086) + the
why-panel. The flower-themed tier relabeling proposals are WITHDRAWN;
the naming-collision findings are resolved by not renaming.

<!-- Supersession note (D091): the flower-themed tier relabeling proposals (Petal/Blossom/Anthesis/In Full Bloom/Annual Bloom/Bouquet) are WITHDRAWN — superseded by the overlay. -->

The identity axis (achievement family → flower family,
ACHIEVEMENT-SCAN §1.5): I. The Long Conversation (journal) →
raceme/panicle · II. The Unbroken Chain (habits) → catkin · III. The
Iron Ledger (gym) → capitulum · IV. The Fuel Line (nutrition) →
spadix · V. The Shape of Things (body) → zygomorphic flower · VI.
Elsewhere (vacations) → fascicle · VII. Proof of Life (media) →
pseudanthium · VIII. The Rings (longevity) → the yearly spring bloom
itself · IX. Full Circle (cross-domain) → syconium.

The rarity spine is the six-tier ladder (the ONLY tier system), with
the tree flower magnitude mapping (D086): Sprout = the smallest bloom
(a single common flower) · Root = a modest flower cluster · Branch = a
prominent flower family (inflorescence type) · Heartwood = a rare
flower family + a small visual accent · Ring = a distinctive bloom + a
branch-level visual event · Grove = the large visuals: full floral
events, transformations (the D086 top tier). Multi-tier trophies fire
separately at each tier as their thresholds cross — each tier-step is
its own rarity event and its own flower. The rarity-tier ladder is
built from the **full scanned achievement list** (every family, every
tier — 131 trophies + 47 rungs; distribution: Sprout 8 · Root 19 ·
Branch 28 · Heartwood 26 · Ring 10 · Grove 31 · multi-tier 9) —
Ghost-in-the-Machine is one family among several hardest sets, not
the only one (D086 correction). Coach loudness by tier (locked): only
Ring and Grove receive Coach appreciation (one sincere derived line);
all other tiers are a silent in-game toast; one Coach line at most
per trophy fire.

### 14.2 The identity coherence filter (D112 DV-C1)

Every inflorescence family gets an **axis signature** (like the
adaptations): the syconium/cross-domain identity needs balance ≥0.6;
arid-compatible families need resource ≤0.6. The D086 fallback extends
to the identity axis — a flower family the axes reject manifests in a
**compatible sibling family** (same tier, harmonized), the why-panel
explaining the substitution. Identity is part of the coherence
envelope, not an exception to it.

### 14.3 The 17-audit (D112 DV-C3, amended by D113)

A systematic pass at the trait-space step (PLAN Step 7) assigning
every trait in the botanical master (all 25 inflorescences, 30
fruits, 46 modifications, leaf families/margins/venation/shapes, bark
types, crown types) exactly one of **four** statuses:

- **WIRED** — a data driver.
- **RESERVED-UNMAPPED** — deliberately not wired, reason documented
  (the honest-skip precedent); means only "a real pattern could
  appear later" (e.g., the epicormic-style future candidates).
- **STRUCTURAL** — always-present anatomy.
- **EXCLUDED-BY-DESIGN (PERMANENT)** — the marshy/aquatic family
  (pneumatophores, knee roots, floating/assimilatory roots) and the
  other purposeful exclusions (haustoria/parasitic,
  pitcher/bladder/snap traps, rhizomes/bulbils) are permanently
  excluded — they do not fit any life pattern; recorded with the
  reason, and NOT "reserved-unmapped".

Output: one table (trait × status × driver × manifestation moment);
the drivers are dev-tunable like the register numbers.

### 14.4 The uniqueness guarantee (D112 DV-C4) + within-tier variance (D113)

High-dimensional deterministic per-user morphology: the trait
selection reads more of the log than the 4 axes — the per-domain
order of first-use (the crown's birth order), the life-area mix
(journal areas become a real driver of leaf-family character per
area), and the weekly rhythm's texture. Every dimension
deterministic, derived, explainable — two similar lives diverge in
the details. Within a tier, two trophies get a small deterministic
size/placement variance derived from the achievement's own condition
data (the streak length at earn, the count at earn) — same tier,
visibly distinct, still deterministic (D113 B M-05).

### 14.5 The modification rarity split (D089)

Modifications are rare items, reserved for genuine years of
consistency. The split: (1) **rare structural modifications**
(silhouette-level, visible at a glance): caudex, buttress roots,
phyllodes, cladode segments, thorns, storage leaves — hard tenure
floor: none manifest before real qualifying years exist (floor = 2+
stage-years; caudex and buttress at higher tenure — D2/D3); (2)
**subtle character details** (close-up/anatomy views, never the
silhouette): reaction wood, epicormic shoots, mycorrhizal/coach
detail, bracts, bud scales, contractile roots, stolons,
storage-taproot detail, spines (26 consecutive weeks — demoted from
the structural tier; the 100-day referent is superseded by the D116
cadence armor) — no tenure gate; the tree's fine texture rewards
every user without diluting the rarity of the structural layer.

---

## 15. Render and performance (D111)

1. **The LOD ladder** — exactly three render levels: LOD-1 MASS
   (silhouette + canopy masses — first paint), LOD-2 STRUCTURE
   (branches, retention-window twigs, individual leaves at mature
   granularity), LOD-3 DETAIL (per-entry leaves + organ anatomy — only
   on zoom/interaction). The hero defaults to LOD-1/2 by distance and
   device tier — the 45k-draw-op disaster is structurally impossible.
2. **The semantics surface** — every organ (branches, buds, leaves,
   flowers, fruits, rings, the bank) gets a semantic label + status +
   tap action built from the **same deterministic state model that
   paints it** (one source, two outputs — pixels and semantics cannot
   diverge); plus a whole-tree portrait summary (the screen-reader's
   one-liner: "the tree: 5 years old, mature, 12 buds banked, 3
   blooms this spring") and a keyboard map (fully navigable without
   touch).
3. **The transition announcements** — the D094 ceremonies get a
   text-twin announcement: a live-region update (in-tab, not a push)
   narrated as the transition plays ("your tree's first branch
   grew"); the reduced-motion static fallback gets the same
   announcement; the bloom is never silent for assistive tech.
4. **Color-only facts** — no meaning rides on color alone (the season
   is announced in the strip's text line "Autumn"; tier differences
   carry size/mark differences, not just glow); a deuteranopia pass
   is a locked gate in the mockup + stress-test steps.
5. **The autumn leaf-fall** — a mass re-bake (the canopy re-renders
   as its bare state once — baked picture) with a capped
   shader-free particle effect (**~150–300 sprites** — the
   bloom-rain budget reused); the fallen leaves form the litter
   picture; the fall is a moment, not a 22k-per-frame computation.
6. **The motion tiers** — three: FULL (the D094 durations), REDUCED
   (particles off, transitions as quick fades — the locked
   300ms-fade precedent), NONE (instant state changes, announcements
   only). The reduced-motion preference selects the tier; the full
   path degrades automatically on low-end devices (an FPS-based
   ladder, not binary).
7. **The contrast floor** — tree palette colors meet **≥3:1**
   non-text contrast (the design-system floor) in both themes; the
   D086 accent luminance band respected.
8. **The hit-area guarantee** — every tappable organ (even at LOD-1
   mass) has a **≥44px effective target**; the cluster map decouples
   the hit area from the painted size.

---

## 16. Surfaces and interaction (D094/D099)

The tree tab layout (hero tree + overview strip + detail panel);
placement of the tab in the nav shell is decided at the deferred
UI/UX ordering pass (the tab's existence is locked). The overview
strip lives at every stage; the why-panel carries the schedule at
every stage; the bank counter (top 3 by tier + the count, with the
closed bucket for restore-foreclosed trophies — D116) is a real
surface. Sensitive rows collapse in shared contexts (§13). The
identity-axis filter chips (flower family, tier magnitude,
branch/domain) browse the tree in the overview strip / detail panel —
derived-only, no schema, names/tiers unchanged per D091.

**The caps (D099):**

- **The bloom-burst cap** — the annual bloom manifests the bank in
  magnitude order (Grove first, then Ring, then the growing-season
  earns) with a per-bloom visual budget; overflow blooms in
  successive waves across the flowering season (register C1/C2 —
  botanically real: the spring bloom becomes a spring *season* of
  blooming). No flower lost; the moment never floods.
- **The live habit-bud cap** — buds beyond the branch's derived
  capacity cluster into bud clusters (register C3), each a countable
  surface ("12 habits in this cluster") with individual buds revealed
  on zoom.
- **The media-aware aggregation rule** — the leaf cluster's character
  reflects its media content (photos/vlogs render with the
  storage-leaf character — thicker, richer) even at aggregation
  scale.

**The branch detail** surfaces the L-10 insight line (payload-blind
mirror per D110): the rule-based cross-domain insight engine's line
lives in the weekly Coach message (one line within the F-24 3–5-line
message) + the Life Tree branch detail, nowhere else. The first
comparison set is the big five (training ↔ journal presence/word
count; training ↔ mood-proxy; sleep-proxy ↔ next-day training;
protein hit-rate ↔ next-day gym; weigh-in trend ↔ journal cadence);
mood-proxy is derived-only (journal presence, word counts, entry
length); wording is correlation-not-causation, verbatim ("correlates
with", never "caused by"); confidence tiers from sample size (the
5+5/90-day rule — ≥5 days per group OR 90 days of history).

**Dev-only surfaces.** The D105 dev-tools tuning panel is documented
as a dev-only surface: a playable register + palette driving live
re-derivation + re-render — build-time only, explicitly NEVER
shipped. DevelopmentWorkflow.md carries the tool discipline; Roadmap
M9 B3 schedules it before any visual tuning. This is the one surface
in the app documented to never exist in the product.

**Design-feed note (record-only, INT-24/L-15):** the life-scale grid
(the weeks-as-cells grid family — Life Calendar's ~4,680 weekly cells
for a human life; contribution-graph family volume-grid + the farming
lesson) is LOCKED as a DESIGN FEED for the tree session, not a
decided feature. Takeaways: (1) a spatial-meta layer could appear as
a strip or a zoomed-out mode — the tree session decides; (2) the
emotional register is the tree's own (awe without guilt); (3) the
anti-farm lesson is inherited (derived-only + anti-farm rules).
Placement in the tree section is deferred to D117 D1/D2 (the M9
trait-space + mockup step).

---

## 17. Development handoff and implementation plan (D117)

The design chapter is complete (D085–D116 + the validated register);
nothing below gates the first engine line of code.

**A. Pre-M9 (opportunistic — any docs pass / adjacent milestone):**
A1 the docs-pass amendment register (DecisionLog entries for
D085–D117 — the register is never complete without itself; plus the
Gamification anchor/six-domain/qualifyingEntry amendments, the
CoachSystem anniversary amendment, the Roadmap M7/M9 premises + the
D060 fitness-surface supersession, the Database formatVersion-3 set,
and the UIUX tree-tab + semantics contract); A3 the owner-contracts
groundwork (§18); A4 the emotional copy-language pass (dormancy copy,
bank counter framing, empty-spring copy, legend card).

**B. M9 Phase 0 — the engine foundation:**
- B1 the renderer perf spike (≤16ms at LOD-1/2 on the target device
  tier — the F9 gate; the LOD ladder, instanced procedural leaves,
  the autumn leaf-fall re-bake + capped particles);
- B2 the state-model implementation (the derived cache §7, the
  logFingerprint, the atomic swap, the set-commutative fold, the
  single-writer lock — D108/D109);
- B3 the dev-tools tuning surface (D105 — MUST exist before any
  visual tuning);
- B4 the derivation engine (the incremental protocol, the axes F4–F7
  with the D116 pins, the stage clock B1–B5 with the D116 values, the
  banking + the tier schedule D092/D095/D096).

**C. M9 Phases 1–2 — the organs:** trunk/rings renderer,
branches/twigs/forks with the canopy rule, buds (D087), leaves with
clusters + storage-leaf character, seasonal organ states (D095),
adaptation manifests (D093/D116).

**D. M9 Phase 3 — the visuals (order matters):**
- D1 the trait-space 17-audit (PLAN Step 7) — MUST precede the
  trait-driven visuals;
- D2 the archetype mockups (the visual validation from the validated
  register numbers — the 19 paper-run archetypes as the gallery; the
  heartwood language; the cohesion check D112; the deuteranopia +
  contrast gates D111);
- D3 the flowers/fruits/adaptations/seasonal-state visuals + the
  ceremony language (D094) + the why-panel copy engine.

**E. M9 Phase 4 — the navigation/feeds** (the duality principle,
D088 B). **F. M9 Phase 5 — the anatomy views** (VISION 16:
root/stem/leaf cross-sections + the time-lapse replay D097). **G. M9
Phase 6 — the review mode** (the yearly review artifacts: rings +
cross-sections + the legend card).

**The standing gates (H0–H5):**
- H0 the D-number collision note — the ledger skill-install records
  D083/D084 collide with DecisionLog's already-recorded D083; the
  docs pass renumbers the ledger pair (→D118/D119).
- H1 the seeded-data stress tests — the code version of the paper
  run: the 19 archetypes become the test fixtures; the tests must
  reproduce the paper-run outcomes (the stage timings, the bank
  schedules, the honest no-rings, the anti-farm defeats, the restore
  ratchet).
- H2 the perf gates (F9) as milestone gates.
- H3 the coherence checks (the axis signatures + identity filters
  across generated trees).
- H4 the deuteranopia + contrast passes (D111).
- H5 the test-strategy acceptance criteria (the paper-run fixtures
  ARE the acceptance criteria).

The 10-step session plan's statuses stay tracked in
`life-tree-design/PLAN.md` (the living roadmap); this section mirrors
the phase sequence for the M9 milestone.

---

## 18. The consumed H3 owners (D117 A3)

The tree consumes exactly six H3 owner functions — their exact
outputs are designed alongside their owning systems (the owner
contracts are groundwork that happens pre-M9):

| Owner | Contracted with | Tree role |
|---|---|---|
| qualifyingEntry | M7 (analytics) | the D100 qualifying-day/presence predicate; the gamification bars read the same predicate (one fix, two systems) |
| streak | M7 | bud swelling/momentum; the thorns/spines cadence armor reads streak-relative presence |
| goalProgress | M5 (goals) | fruit swelling; the spur economy (C8) |
| coachEngagement | M8 (Coach) | the mycorrhizal trigger (E11) — opt-ins/deletes never feed it |
| dayActivityScore | M6 (calendar) | the calendar tint rule — tree state flows through this owner, never independent calendar presence |
| mediaPresence | M10–M13 (media/sync) | the media-forks presence; the storage-leaf character (E5 attachment-mix) |

The tree derives from the event log directly with its own cache —
never from the M7 analytics cache tables (D110(6)). The read surface
is the event log + these owners only.

---

## 19. References

The authoritative working design lives outside docs/ and is cited,
never inline-copied:

- `life-tree-design/VISION.md` — the vision, the 17 locked
  principles, the organ-map baseline.
- `life-tree-design/SCHEMA.md` — the canonical domain table (§2.3),
  the threshold register (§2.4), the trigger-correlation table
  (§2.5), the tree-state model (§2.6), the derivation contract (§3).
- `life-tree-design/LOOPHOLES.md` — the stage model + the resolutions
  (D090–D099).
- `life-tree-design/ACHIEVEMENT-SCAN.md` — the rarity ladder, the
  identity axis (§1.5), the 47 rungs.
- `life-tree-design/INPUT-INVENTORY.md` — the feature surface, the
  constraint register (§14).
- `life-tree-design/TRAIT-SPACE.md` — the morphological dictionary,
  the coherence envelopes, the 17-audit.
- `life-tree-design/PLAN.md` — the 10-step session roadmap (living
  statuses).
- `life-tree-design/paper-run/` — the 19 archetype walks (the
  validation evidence; the H1 test fixtures).
- `life-tree-design/audits/` — the audit chain.
- `research-botany/MASTER-Botany-Reference.md` — the botanical
  authority (Parts 1–13).

The achievement-catalog files remain the live source for the trophy
names, tiers, and conditions; this document cites them, never
re-copies them. The register values in §5 freeze at the engine
contract; any future change is a DecisionLog event and an EXTERNAL
amendment to `life-tree-design/SCHEMA.md` §2.4.