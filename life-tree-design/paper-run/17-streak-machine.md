# PAPER RUN 17 — ARCHETYPE: "STREAK-MACHINE" (2-year, same-time robot)

**Status:** design-time simulation, no code. Full hand-walk of ONE synthetic
user's life through the Life Tree timeline against the locked register.
**Purpose:** this is the **armor-gap test (E6/E7) AND the Ghost-in-the-
Machine probe** — the hardest achievements' schedule, walked against a user
who is *built* to earn them. The question on the table: does the perfect
same-time machine actually fire the robot-consistency capstone, when, and
what does its tree honestly look like?

**Register verified against:** `life-tree-design/SCHEMA.md` §2.4 (A1–F10,
locked 2026-08-29; D105) + §2.3 (the canonical domain table, D104/D115) +
§2.5 (the trigger-correlation table, D106) — read in full for this run.
**Decision texts verified against:** `TEMP-PLANNING.md` (D089–D115, read in
full — D090/D092/D093/D095/D096/D099/D100/D101/D103/D104/D114/D115 quoted).
**Trophy conditions verified against:** `life-tree-design/scan-outputs/
02-achievements.md` (the raw brief — every condition verbatim; the ONLY
authority for IX-5's legs) + `ACHIEVEMENT-SCAN.md` (the ladder).
**Sibling runs read:** 01-gym-heavy (III-family cadences, the A3 zero-twigs
finding V2, the phyllodes misread V4, the E6 armor gap V8), 03-balanced
(V-4: no 365-day trophy), 04-decade-consistent (the E6-referent drift, the
C4 crown precedent, the bloom queue V-1), 08-every-other-day (the B2 15-vs-20
deadlock, the day-arithmetic conventions), 12-restore-rewind, 13-sparse-
stubborn, 14-media-rich (the armor gap V8), 15-goal-focused (the armor
blindness V-4). **Audit:** the loop-closure-verification finding #2 (B2's
"in ANY domain" ambiguity) and the register drift (SCHEMA 15 vs D115 20)
are carried as prior art (01-V12 / 06-V9 / 08-V2).

---

## 0. The synthetic user

A 2-year user. Pattern: **5 habits completed at the SAME TIME every day
(07:00 ± 30 min — all five within the anchored 30-min slot), every single
day for 730 days; zero misses; zero rest flags; zero grace used.** Plus:
**journal daily (~100 words, qualifying ≥40), also at 07:00.** Plus: **gym
3×/week, Mon/Wed/Fri, 4 real sets each, weight-mode, same weekday-set
forever.** No nutrition, no body, no media, no goals, no coach, no phases,
no vacations, no planned rests. Every event **written same-day (in-window)** —
zero backfill, zero imports. Birth anchor = **Tue Sep 1, 2026** (the first
in-window event: the first 07:00 batch — journal + 5 habits; frozen per
D090 B / D100(5) / D102).

Day arithmetic (1-indexed, run 08's convention; leap drift handled): day 1 =
Sep 1 '26 · day 30 = Sep 30 '26 (Month 1 close) · day 91 = Dec 1 '26
(Month 3) · day 97 = **Dec 7 '26** · day 366 = **Sep 1 '27 (Year 1)** ·
day 486 = Dec 31 '27 · day 731 = **Aug 31 '28 (Year 2 — the 730-day mark)**
· day 732 = Sep 1 '28 (the anchor anniversary, +1 leap drift) · day 911 =
**Mar 1 '29 (the next annual bloom — the verification horizon)**.

Fixed derived reality (constant across the whole life — honest numbers):

| Axis | Value | Derivation |
|---|---|---|
| F4 RESOURCE | **0.33** | avg in-window events per active day = 6.5 (5 habit completions + 1 journal + 3/7 gym ≈ 0.43 + PR events ≈ 0.1) ÷ ceiling 20 (F4). *The task's hand-estimate "~8/day → 0.4" overcounts (reflection/PR rides are not in this user's day); either way — 0.33 or 0.4 — the value is ≤ 0.4. That robustness matters: see V1* |
| F5 RHYTHM | **1.00** | weekly active-day counts: 7/7 every week, every week → stddev 0 → 1 − CV = 1.0, clamped. Perfect rhythm — the machine's axis |
| F6 BALANCE | **0.49** | Shannon evenness over the canonical 7 (F6/D104): presence-day vector {journal 730, habits 730, gym 156, 0, 0, 0, 0} → H = 0.944 / ln 7 = 0.485. *The task's "3 domains — mid" is close; exact: mid-LOW (two dominant + a thin third, vs run 08's 0.70 for three equal)* |
| F7 TENURE | 0.0 → **0.2** | stage-years/10, clamped (F7) — 0.2 at the yr-2 close |
| Active days/yr | 365 | A4's 200 is doubled every year — the machine is A4-proof |
| Twigs | journal 12/yr · habits 12/yr · **gym 0 — forever** | A3's ≥15 in-window days per 30-day month: journal/habits 30/30 every month; gym at Mon/Wed/Fri = **12–14 days/month, structurally never 15** (see V2) |

---

## 1. Assumptions pinned (flagged, not register facts)

- **A1 — The annual bloom date = Mar 1** (the first day of the growing
  season, F1/F2; run 02-V6/07-V8/08-A1 convention — the engine contract must
  pin it).
- **A2 — The first bloom fires AT maturity** (D092(2)); post-maturity
  on-earn applies in the growing season only (D092(3)+D095). Maturity lands
  day 731 (Aug 31 '28) — the summer→autumn boundary, in-season; the first
  bloom fires immediately with waves through autumn (no winter clash).
- **A3 — Modifications manifest at the NEXT annual bloom after their gates
  hold** (D093; run 01/07/08 reading). E3's phyllodes and E6's thorns both
  land Mar 1 '29 for this user.
- **A4 — PR cadence (pinned, program-dependent):** novice linear
  progression on a Mon/Wed/Fri rotation — **1 PR event per ~10 days** →
  ~73 lifetime PRs by day 731 (III-3 ×73 · III-4 at the 10th ~d100 · III-5 at
  the 25th ~d250 · III-6 at the 50th ~d500). Tonnage: ~6,000 kg/session
  (4 lifts × 3 sets × 8 reps × ~62.5 kg) → R44 at ~d40, R45 at ~d196,
  R46 at ~d390, R47 never (beyond the walk). Sensitivity: the Root/Heartwood
  repeat counts scale with this pin (V6's aggregation fix absorbs it).
- **A5 — III-21's weekly target = 3** (the user's own cadence — run 08-A5's
  convention) → every week meets it → III-21 fires at each 12-week mark
  (d84, 168, 252, 336, 420, 504, 588, 672 — 8 fires).
- **A6 — III-22's weekday-set = {Mon, Wed, Fri}, never drifts.** The run
  starts at the FIRST FULL PATTERN WEEK (the week of Sep 7 '26 — the
  anchor week Aug 31–Sep 6 is partial: {Wed, Fri} only; "pre-pattern
  history doesn't count toward the 26") → 26 weeks close **Dec 7 '26 = day
  97**, re-firing at 26-week marks d279, d461, d643 (4 fires by yr 2). *The
  run-01/08 convention (first fire at d182 — 26 weeks from day 1) shifts
  these to d182/364/546/728; the difference is the partial-first-week
  semantics — dev-tunable pin, V9.*
- **A7 — Anniversary trophies fire on the band's center day** (II-12/
  III-26: run 08-A7's convention) — d366 and d731/732.
- **A8 — 365-day windows are leap-immune and dayKey-driven** (run 08-A8);
  the Sep 1 '26 anchor drifts +1 day at the 2028 boundary (Feb 29 '28 in
  span) — day 731 = Aug 31 '28, day 732 = the anchor anniversary.
- **A9 — II-4 The Long Haul is counted per habit** (5 fires at d500 — run
  04-V-9's per-habit reading; the brief's "fires at ~500 days?" confirmed).
- **A10 — II-8 Juggling Act fires once per closed qualifying 21-day
  window** (the register's words) → ~34 fires by day 731; the G5
  anti-overlap clause is ambiguous — the per-RUN reading gives ~1–2 (V8).

---

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | Day 1 (Sep 1 '26) | first in-window event (register B1 / D090 A) — the 07:00 journal + 5 habits |
| B2 SEEDLING→SAPLING | **Day 15** (Sep 15 '26) | register B2: ≥15 in-window days within any 30-day window, ANY-DOMAIN-MIXED — the machine is 15/15 by day 15. *D115(1)'s record text says ≥20 → day 20 — same month (V4; the drift is decisive only for sparse archetypes)* |
| B3 SAPLING→POLE | **Day 366** (Sep 1 '27) | 1st stage-year: 365 in-window days ≥ A4's 200 — the machine passes at 1.825× the bar. POLE also unlocks leaf granularity (C6) and the pole-rise ceremony (D094) |
| B4 POLE→MATURE | **Day 731** (Aug 31 '28) | ≥2 stage-years (365 + 365) AND ≥1 domain with ≥90 in-window days in its best anchored year — journal 365 ✓ habits 365 ✓ gym 156 ✓. **THE PIONEER-SPEED CONFIRMATION: a hyper-consistent user matures at exactly year 2** (register B4's own note). **FIRST BLOOM fires here** |
| B5 MATURE→OLD-GROWTH | day ~3650 | 10 stage-years — beyond the walk |

Maturity is NOT gated by the canonical-7 brand (D090 C, D101 r1 — the
machine has 3 of 7 domains and matures anyway: the decoupling holds), NOT
gated by twigs (D115), NOT gated by the II-family ladder. **The machine's
tree: 2 stage-years, zero rings (below).**

---

## 3. The trophy bank — the hard-trophy schedule (verified against the raw brief)

Every condition below was checked verbatim against scan-outputs/
02-achievements.md. Earn dates are day-1-indexed; every trophy is an
ACHIEVEMENT BUD pre-maturity (D092(1)), tier-marked (D096).

### 3.1 The robot-consistency family — the walk's spine

| Trophy | Tier | Condition (verbatim) | This user | Fires |
|---|---|---|---|---|
| **I-4 Same Time, Every Time** | Heartwood | 60 consecutive calendar days with an entry within ±30 min of the run's first entry time | journal at 07:00 daily, forever | **d60** ✓ (once — one unbroken run) |
| **II-9 Like Clockwork** | Heartwood | a habit's 90 consecutive completions inside the run's anchored 30-min slot | all 5 habits at 07:00, in-slot every day | **d90 ×5** ✓ (once per habit — the run never breaks) |
| **III-22 The Schedule Never Breaks** | Heartwood | the EXACT same weekday-set for 26 consecutive weeks; zero off-pattern weeks | {Mon,Wed,Fri} forever | **d97** (first full pattern week Sep 7 → 26 weeks → Dec 7 '26), re-fires d279/d461/d643 — **4 fires** |
| **IV-5 No Deviation** | Heartwood | 30 consecutive logged days, each ≥1 food log, each within ±3% of the phase's fixed calorie target | **no nutrition — ZERO food logs ever** | **NEVER** |
| **IX-5 Ghost in the Machine** | Grove | **Like Clockwork (any habit) + The Schedule Never Breaks + No Deviation — ALL independently active at once, overlapping within the same 90-day span** | two of three legs alive from d90/d97; the third (IV-5) never starts | **NEVER — see §6 (the headline)** |
| II-3 A Hundred Days | Heartwood | 100-day habit streak | d100 ×5 ✓ | 5 buds |
| E7 spines (gate) | subtle | the 100-day streak achievement (II-3) | d100 ✓ SAPLING+ ✓ (d15) | **spines at d100** — immediate texture (D093 subtle details) |

### 3.2 The rest of the bank (honest ledger at the yr-2 close, d731)

| Tier | Trophies | Count |
|---|---|---|
| Sprout | I-1 (d1) · II-1 (d1) · III-1 (d2 — the first workout, Wed Sep 2) | 3 |
| Root | I-2 (d7) · I-6 (d50 — 50th entry) · II-2 ×5 (d7) · III-2 (d9 — the four main lifts) · III-3 ×73 (1 PR/~10d) · III-4 (d100) · III-19-R44 (d40 — 100k kg) · IX-4-R (d10 — journal ≥40w + PR same day) | 84 |
| Branch | I-3 (d90 — 90-day journal streak) · I-7 (d500) · I-12-B (d366 — same month-day across 2 years) · **II-6 ×120** (every calendar month × 5 habits, d30…d730 — NOT grace-able, never needed) · II-7 (d7 — 5 habits × 7-day streaks) · **II-8 ×34** (d21, then every closed 21-day window — A10) · III-5 (d250) · III-8 ×4 (10th PR per lift) · III-9 ×20 (PR Season — monthly) · III-19-R45 (d196 — 500k kg) · III-21 ×8 (12-week runs) · IX-4-B (d100) | 194 |
| Heartwood | I-4 (d60) · I-12-H (d732 — the 3rd-year match, at the walk edge) · I-15 (d486 — Bookended: Jan 1 + Dec 31 '27 + 365 distinct days ✓) · II-3 ×5 (d100) · II-9 ×5 (d90) · II-13 (d100 — all 5 habits at 100 simultaneously) · III-6 (d500) · III-10 ×35 (Trifecta Week — S+B+D PRs in a 7-day window; A4) · III-19-R46 (d390 — 1M kg) · III-22 ×4 (d97+) · IX-4-H (d500) | 56 |
| Ring | I-5 ×2 (d366, d731 — yearlyPass ≥300 journal days) · II-5 ×10 (Full Year One Habit — d366 + d731, per habit) · II-12 ×10 (One Trip Around the Sun — d366 + d731, per habit) · III-26 ×2 (d367, d732 — A Year on the Bar, the band center) · VIII-1 (d366 — 365 days + 3 domains in 9/12 months ✓) · VIII-2 (d731 — 2 years + 18/24 months ✓) | 26 |
| Grove | **II-4 The Long Haul ×5 (d500 — the 500-day streak, once per habit)** · **III-11 A PR Every Season (d360 — 12 distinct months with ≥1 PR)** | 6 |

**TOTAL ≈ 369 buds at maturity** (3 S + 84 R + 194 B + 56 H + 26 Ring +
6 Grove). Range 330–430 — the spread is PR-cadence (III-3/III-10/III-9) and
II-8 semantics (V8). **The first-earned Grove is III-11 (d360); II-4 ×5
follows at d500.**

### 3.3 Honest absences (never fires — and why, each verified)

- **II-10 Honest Rest / II-11 Rebuilt / I-11 You Came Back / III-24 Back at
  It** — no rests, no breaks, no gaps, nothing to rebuild. The machine never
  pauses: zero revival, zero reaction wood (E9 — the brief's "any gap? NO" ✓).
- **I-13 Unprompted** — structurally unattainable: every journal day has 5
  habit completions, so "a day with ZERO qualifying events in habits" never
  exists. The reflection-for-its-own-sake trophy is closed to the perfect
  habit user by construction (a note, not a violation — but the why-panel
  should know).
- **I-14 The Turn of the Page / III-23 Full Cycle** — no nutrition phases.
- **IX-1 Full Circle Day / IV family / V family / VII family / VIII-5
  Life-Fully-Logged / VIII-6 / VIII-11…VIII-20** — nutrition/body/media
  domains are empty (IX-1 needs a 4-domain day; the VIII ring-chain needs
  rings — see §4). **No rings, no Pith, no Yew** — honest for a 3-of-7 tree.
- **II-14/II-15, I-16/I-17, VIII-3+** — beyond the 2-year walk.

---

## 4. Checkpoint-by-checkpoint walk

### Month 3 — Day 91, Dec 1 '26 (SAPLING, age 3 months)
- **Stage:** SAPLING (B2 at d15). **Stage-years:** 0. **Rings:** 0.
- **Axes:** F4 0.33 · F5 1.00 · F6 ~0.49 (forming) · F7 0.0.
- **Twigs:** journal 3 (Sep/Oct/Nov, 30/30 each) · habits 3 · **gym 0**
  (13 gym days in each of the first three months — the A3 bar 15 is
  structurally unreachable for {Mon,Wed,Fri}; V2). The journal + habits
  branches wear their first twigs (the D094 "first branch" moment fired in
  October); the gym branch is the extended-but-twigless stub (run 01's
  "extends first — no twig yet" precedent).
- **Tree:** seedling with M-2 leaf-buds (D115(3)) — 90 banked entries as a
  leaf-bud cluster on the stem; 2 twiggy branches; the 5 habit chain-buds
  all bursting; the gym stub bare. The first winter (Dec 1) arrives: winter
  entries become leaf-buds, winter earns bank (D095) — pre-maturity, so the
  spring Y2 is bud-swell, not bloom (D095 hot-zone resolution).
- **Bank:** ~30 buds (3 S · 18 R · 3 B · 6 H — I-4 d60, II-9 ×5 d90). **E7
  spines: 9 days out** (II-3 at d100). III-22 fires in 6 days (d97) — the
  week's walk: two robot legs (II-9, III-22) are already alive; the third
  (IV-5) will never start.
- **Why-panel:** "SAPLING · age 3 months · 30 buds banked · your journal and
  habit branches wear their first twigs · your gym branch is waiting: the
  twig bar wants 15 days in a month, your 3×/week cadence gives 13."

### Year 1 — Day 366, Sep 1 '27 (POLE, age 1)
- **Stage:** POLE (B3 at d366 — the pole-rise ceremony, D094). **Stage-
  years:** 1. **Rings:** 0.
- **Axes:** F4 0.33 · F5 1.00 · F6 0.49 · F7 0.1.
- **Twigs:** journal 12 · habits 12 · gym 0. Leaf granularity unlocks (C6).
- **Tree:** a pole-stage tree with two lush branches (24 twigs), a bare gym
  stub, leaf-buds for the winter of '27. The trunk: no rings (3/7 domains —
  A5 per-domain bars: journal ✓ habits ✓ gym 156 ✓, but nutrition/body/
  media/goals = 0 → no ring-year; D101's decoupling holds: the machine
  accumulates stage-years and matures — it just never brands).
- **Bank:** ~198 buds (3 S · 47 R · 102 B · 32 H · 13 Ring · 1 Grove —
  III-11 at d360). **The D096 test runs HERE for real:** the first Grove
  (III-11, d360) banks as a tier-marked Grove bud — "the strongest bloom
  your tree will ever grow" — visibly larger, capitulum-marked, growing
  with the tree. II-4 ×5 is 140 days out. **The 365-day data streak is
  REAL (d365) — and invisible to the armor: no 365-day trophy exists (V3);
  E6's referent is a catalog gap; the armor waits for II-4.**
- **Ring tier fires d366:** II-5 ×5, II-12 ×5, I-5, III-26, VIII-1 — 13 Ring
  buds banked (bloom at the next annual bloom post-maturity — D092(4)).
- **Why-panel:** "POLE · age 1 · 198 buds · 13 Ring, 1 Grove — the Grove
  bud carries your tree's legend · your armor is growing unseen: the
  365-day streak has no trophy yet."

### Year 2 — Day 731, Aug 31 '28 (MATURE — the first bloom) + Day 911, Mar 1 '29 (the annual bloom — the verification horizon)
- **Stage:** MATURE (B4 at d731 — maturity + first bloom, the D094
  ceremony). **Stage-years:** 2. **Tenure 0.2.** **Rings:** 0. **Twigs:**
  journal 24 · habits 24 · gym 0.
- **THE BANK AT MATURITY: ~369 buds** (the §3.2 ledger). The first bloom
  (D092(2)) bursts **S/R/B/H only — 337 buds** (Ring 26 + Grove 6 stay
  banked). D099's magnitude order (Heartwood first) + C1/C2 caps:
  **autumn Y3 = 4 waves × 15 = 60 flowers** (Heartwood 56 + Branch 4);
  **277 buds remain banked.** The cherry-blossom moment delivers 60 of 369 —
  the rest wait (V6).
- **The annual bloom, Mar 1 '29 (day 911):** the transformation + the
  armor. **CROWN (C4 — run 04's first-earned reading): III-11 A PR Every
  Season** — the tree's one legend transformation. II-4 ×5 + the other
  Groves → large blooms (C4's "other Groves get large blooms"). **RING ×26
  bloom.** **E6 THORNS manifest** (II-4 earned d500 + D1 tenure ≥2 at
  d731 → next annual bloom — the register's schedule holds; both the armor
  AND II-4's own flowers fire — D103's different-visuals rule). **E3
  PHYLLODES manifest at the same spring — the dense-user misread (V1).**
  Budget: 60/season — Grove 6 + Ring 26 + winter bank (~52) + the 277
  overflow: ~301 buds still banked after spring Y4. The flush horizon:
  **~5–6 springs, and the bank never empties** (accrual ~170/yr vs 60/yr
  flush — V6).
- **Why-panel (C7 — top 3 by tier + count):** "MATURE · 2 stage-years ·
  the bank: 6 Grove · 26 Ring · 56 Heartwood · +281 more · your crown
  blooms next spring: A PR Every Season · your armor grows there too: the
  500-day chains earned your thorns · your gym branch still wears no twigs
  (the 15-day bar) · your tree shows the drought adaptation — derived from
  a resource reading of 0.33 (see the F4 calibration note)."

---

## 5. The Ghost-in-the-Machine schedule — THE honest computation

The brief's hypothesis: "if the gym is Mon/Wed/Fri always, III-22 fires at
26 weeks; the 90-day triple overlap → **GHOST FIRES in year 1**."

**The register refutes it. The Ghost's three legs are fixed: Like Clockwork
(II-9, any habit) + The Schedule Never Breaks (III-22) + NO DEVIATION
(IV-5 — nutrition: 30 consecutive logged days within ±3% of a fixed
calorie target).** The third leg is **not** I-4 Same Time Every Time — that
trophy is a member of the robot family but not a Ghost leg. Verified
verbatim: "Like Clockwork (any habit), The Schedule Never Breaks, and No
Deviation are ALL independently active at once, overlapping within the same
90-day span" (02-achievements.md:277; v2:992–1003; spec:928–933).

This user's legs:

| Leg | Condition | Machine | Alive from |
|---|---|---|---|
| II-9 Like Clockwork | 90 in-slot completions | ✓ 5× at d90 | day 1 (run starts at the first completion) |
| III-22 The Schedule Never Breaks | 26 exact weekday-set weeks | ✓ d97 (first full pattern week Sep 7 → Dec 7) | day 7 (the run's first week) |
| IV-5 No Deviation | 30 consecutive ±3% food-log days | **✗ ZERO nutrition events** | **never** |

**The three-way overlap can never complete 90 days — the Ghost DOES NOT
FIRE.** The hardest trophy in the system is unattainable for a perfect
same-time machine that does not also log nutrition. The Ghost is a
**cross-domain capstone (habits + gym + nutrition)** — "robot" in the
register's sense means the full same-window/same-weekday/same-calorie
triad, and the machine holds only two of three. The register is **coherent
— no false fire**; the D096 early-fire contract is simply **not exercised
by this archetype**: there is no Grove-earn for the D096 ladder to bank.

Schedule corrections along the way (honest):
1. **III-22's fire date is d97, not d182.** The 26-week run is measured in
   ISO weeks from the first FULL pattern week (the anchor week is partial:
   day 1 = Tue; only Wed+Fri fall in it — off-pattern). D096's "~day 182"
   and the run-01/08 d182 convention both count 26 weeks from day 1; the
   partial-first-week reading is the register-literal one ("pre-pattern
   history doesn't count toward the 26"). Dev-tunable pin (V9).
2. **The earliest possible Ghost (for a robot WITH nutrition from day 1):
   ~d96**, not "~day 182" (D096's example): the legs are alive from
   max(d0, d7, d1) = d7 (III-22's run start) → 90 days → fires ~d96–97.
   D096's "~day 182" is the calendar-naive 26-weeks-from-day-0 reading.
3. **No Ghost → no Ghost crown, no Ghost legend card.** The D097(6)
   legend-card example ("The rarest: Ghost in the Machine — blooming at the
   next annual bloom") is generic template copy; for this machine the legend
   is III-11 (the first-earned Grove) or II-4 (the rarer) per C4's reading.

---

## 6. The armor (E6/E7) — the gate verification

| Adaptation | Gate (register) | This user | Outcome |
|---|---|---|---|
| **E6 thorns** | the 365-day streak ACHIEVEMENT + tenure ≥2 (D1) + SAPLING floor | 365-day streak real at d365 (data); **no trophy encodes it — II-4 is 500-day** (V3 — carried from 03-V-4/01-V8/04-V-6/15-V-4) | **manifests Mar 1 '29 under the II-4 reading** — d500 (II-4 earned, the trigger) + D1 (d731) + the annual bloom. The armor WORKS for this archetype — but only because II-4 exists at 500; a d365–499 user has the data-streak with no trigger (the armor gap) |
| **E7 spines** | the 100-day streak achievement (II-3) + SAPLING | II-3 ×5 at d100 ✓ | **spines at d100** — immediate subtle texture (D093: subtle details manifest when sustained, no bloom wait) ✓ |
| E9 revival | a dormancy end | none — the machine never sleeps | none — honest (no reaction wood, no epicormic) ✓ |
| E1 caudex | tenure ≥0.7 + resource ≤0.6 + D3 (5 stage-years) | tenure 0.2 | closed ✓ |
| E2 buttress | balance ≥0.7 + resource ≥0.6 + D2 | balance 0.49, resource 0.33 | closed ✓ |
| **E3 phyllodes** | resource ≤0.4 + D1 + SEEDLING | **resource 0.33 ≤ 0.4 — the signature HOLDS** | **VIOLATION — V1: the densest daily user in the catalog reads ARID. Phyllodes (the drought survival form) would manifest Mar 1 '29 on a 730-day perfect machine** |
| E4 cladodes / E5 storage leaves / E8 tendrils / E10 contractile / E11 mycorrhizal / E12 stolons | | divergence 0 · media 0 · no goals · 2 equal stage-years · no coach · no insights | all closed ✓ |
| E13 bracts / E14 bud scales | display / dormant-habit state | with the blooms · no dormant habits | n/a ✓ |

---

## 7. Caps, waves, budgets — the first bloom's wave math

- **C1 ≤15 flowers per bloom event** — respected: waves of 15.
- **C2 ≤4 waves per season (60)** — respected: autumn Y3 = 4 waves = 60;
  overflow banks to the next spring ("no flower lost").
- **The honest economy finding (V6):** the 369-bud bank at maturity vs the
  60/season flush vs **~170/yr post-maturity accrual** (II-6 ×60, II-8 ×17,
  III-3 ×36, III-10 ×35, III-9 ×12, III-21 ×4, III-22 ×2, the Ring yearly
  passes ×8, I-8/I-9-B at d1000…) — **the bank grows forever**: ~301 still
  pending after spring Y4, ~410 by spring Y6, and the flush horizon is 5–6
  springs for a bank that never empties. The cherry-blossom moment (D092)
  delivers 60 of 369. "No flower lost" holds; the *moment* is diluted.
- **C3 habit-bud cluster (≥30)** — 5 bursting habits < 30 → no clusters ✓.
- **C4 legend** — 1 crown (III-11, first-earned) + 1 legend per annual
  bloom; II-4 ×5 + other Groves = large blooms ✓ (the first/rarest
  ambiguity: V7).
- **C5 twigs ≤12/branch/yr** — journal 12, habits 12 (exactly at the cap),
  gym 0 forever (the cap never binds there — V2).
- **C6 granularity at POLE** — unlocks d366 ✓. **C7 bank counter** — top-3
  by tier + "+281 more" ✓.

---

## 8. Register verification table (A–F)

| Row | Requirement | Verdict | Note |
|---|---|---|---|
| A1 | grace ±3d | ✓ unused | zero grace needed — every day written in-window |
| A2 | qualifying events | ✓ | journal 100w ≥40 · gym ≥1 real set · habits 1 completion |
| A3 | twig bar ≥15 days/30d | **✗ for gym — V2** | journal/habits 30/30 ✓; gym 13–14/month, **structurally never 15** (Mon/Wed/Fri in any month: max 14 — a 31-day month gives 5+5+4) |
| A4 | stage-year ≥200 | ✓ 365×2 | doubled every year |
| A5 | ring-year per-domain ≥40 | ✓ where present | 3 of 7 domains present → **no ring-year ever** (V-note: honest, but the why-panel must say why) |
| B1–B4 | stage gates | ✓ | d1 · d15 (d20 under D115 — V4) · d366 · d731 — pioneer speed confirmed |
| B5 | 10 stage-years | n/a | beyond |
| C1/C2 | 15/event · 4 waves | ✓ as written | **the 369-bud bank vs the 60/season flush — V6** |
| C3/C4/C5/C6/C7 | clusters/legend/twigs/granularity/counter | ✓ | crown = III-11 (V7: first vs rarest) |
| D1/D2/D3 | tenure floors | ✓ | 2 stage-years at d731 (D1 ✓; D2/D3 not) |
| E1–E14 | adaptation gates | **E3 misfires (V1)** · E6 via II-4 (V3) · E7 ✓ | see §6 |
| F1/F2/F3 | fixed seasons / growing Mar1–Nov30 / anchored 365d | ✓ | maturity Aug 31 '28 (in-season); the annual bloom Mar 1 '29 |
| F4 | RESOURCE ÷20 | **0.33 — the misread (V1)** | the register's own calibration note ("reads high — calibrated at the paper-run step") is now CONFIRMED with a concrete victim |
| F5 | RHYTHM 1−CV | 1.00 ✓ | perfect |
| F6 | BALANCE evenness(7) | 0.49 ✓ | mid-low |
| F7 | TENURE ÷10 | 0.2 ✓ | |
| F8 | replay ~2s/yr | ✓ | a 2-year replay ≈ 4s + transitions |
| F10 | future-dating clamp | ✓ n/a | nothing future-dated |

---

## 9. Violations + tuning proposals

**V1 — [MAJOR, CONFIRMED PRIOR ART — 01-V4] F4's ceiling (20 events/day)
makes the densest daily user read ARID → E3 phyllodes fires on the
streak-machine.** resource 0.33 (even the brief's generous 0.4) ≤ 0.4 →
phyllodes (the drought-survival adaptation) would manifest Mar 1 '29 on a
730-day, zero-miss tree — botanically absurd and why-panel-hostile ("your
tree shows drought adaptation" to a perfect same-time user). The register's
own note ("RESOURCE reads high — calibrated at the paper-run step") is the
standing authorization to fix it. **Tuning:** sublinear normalization
(sqrt: √6.5/√20 ≈ 0.57 — correctly mid; a genuinely sparse user at 1.5
events/day ≈ 0.27 still fires phyllodes ✓) or a ceiling raise (20 → 40);
re-verify runs 05/13 (sparse) still fire and runs 01/06 (weekly lifters)
read mid.

**V2 — [MAJOR, CONFIRMED PRIOR ART — 01-V2/03-V2/06-V7/12] A3's 15-day bar
is structurally unreachable for the canonical Mon/Wed/Fri cadence: gym
twigs = 0 FOREVER.** Verified arithmetically: no month of any length gives
{Mon,Wed,Fri} ≥15 days (max 14: a 31-day month starting Mon gives 5+5+4).
The machine's gym branch — 312 perfect workouts — never wears a twig, never
contributes a canopy, and reads thinner than an every-other-day user's (15
exactly). The branch-extension milestone and the "consistency made visible"
promise (D088) both fail for the most common real-world gym cadence.
**Tuning (run 01's, adopted): per-class A3 bars — daily-class domains keep
≥15/30; gym ≥12/30 (13 ✓); weekly-class domains (body/media/goals) ≥4/30.**

**V3 — [MAJOR, CONFIRMED PRIOR ART — 03-V-4/01-V8/04-V-6/15-V-4] E6's
referent does not exist: "the 365-day streak achievement" is no trophy in
any family.** Verified against the full catalog: family II has II-3 (100d,
Heartwood), II-4 (500d, Grove), II-14/15 (3/5-yr chains); II-12/II-5 are
Ring yearly-passes — II-12 is an anniversary touch (±7-day band, "not an
unbroken streak" — the design audit's "365-day streak (II-12/III-22
family)" is loose language, relentless-design-audit L174). The machine's
365-day streak is REAL DATA at d365 and invisible to the armor until II-4
(d500). **Tuning:** (a) add "II-16 A Full Year, Unbroken" (365-day
consecutive, Heartwood/Grove) to family II and key E6 to it — closing the
catalog's 100→500 gap; or (b) make E6 derived (the log's 365-day
consecutive streak) per D103's derived-trigger family. Either way the
register's E6 row, D093's trigger table, and D089's "thorns stay
structural 365-day" all name a nonexistent trophy — one line of the
catalog, three documents.

**V4 — [RECORD, CONFIRMED PRIOR ART — 01-V12/06-V9/08-V2] B2 register
drift: SCHEMA §2.4 says ≥15; D115(1) records ≥20.** For the machine both
fire in month 1 (d15 vs d20) — harmless here; the drift is decisive for the
every-other-day archetype (run 08: 15 passes, 20 never leaves SEEDLING).
**Tuning:** lock ONE number in the register (15, matching the A3 cross-ref
in B2's own text and run 08's reachability proof).

**V5 — [NEW — THE HEADLINE] The Ghost in the Machine does NOT fire for a
perfect same-time machine without nutrition.** The third leg is IV-5 No
Deviation (30 consecutive ±3% food-log days), not I-4 — verified verbatim.
The brief's "GHOST FIRES in year 1" hypothesis is **refuted by honest
computation**: two of three legs alive (d90, d97), the third never starts;
the 90-day three-way overlap can never complete. The register is COHERENT
(no false fire — the capstone stays rare); the D096 early-fire contract is
NOT exercised by this archetype (no Grove-earn); and the honest earliest
Ghost (for a robot WITH nutrition) is ~d96–97, not D096's "~day 182".
**Tuning:** none for the register — this is the system working. But the
paper-run record must note: (a) the "robot-consistency" capstone is a
cross-domain (habits+gym+NUTRITION) trophy — the scan's §4 "three-way
overlap" phrasing without naming the legs misleads (the scan's own §4 list
suggests any triple); (b) D096's "~day 182" example should be corrected to
the ISO-week computation; (c) the why-panel for Ghost-adjacent users should
explain which leg is missing ("your nutrition domain is empty — the Ghost
needs No Deviation").

**V6 — [NEW — ECONOMY] The bank grows forever for hyper-consistent users:
369 buds at maturity vs 60/season flush vs ~170/yr accrual.** The
cherry-blossom moment delivers 60 of 369; the flush horizon is 5–6 springs
and the counter climbs ~110/yr even after maturity. "No flower lost"
(D099) holds; the *moment* is diluted (run 04-V-1's queue, extended).
**Tuning (two levers):** (a) tenure/stage-scaled season budget (MATURE: 8–
10 waves, 120–150/season); (b) **SAME-ACHIEVEMENT AGGREGATION — the
repeatability engine multiplies buds**: II-6's 120 fires = 5 flowers with a
"×24" count badge (why-panel carries the 120); II-8 ×34, III-3 ×73, III-10
×35, III-9 ×20, III-21 ×8 collapse the same way. The tree's honest surface
is per-achievement with counts — the machine's bank drops from ~369 to
~70–80 buds, and the first bloom becomes a moment again.

**V7 — [MINOR — AMBIGUITY] C4's "the first/rarest Grove":** the machine's
crown candidates are III-11 (first-earned, d360) and II-4 (rarer, d500).
Run 04's precedent (crown = first-earned — IX-2) gives the crown to III-11;
01-V10's rarity-hierarchy tiebreak would give it to II-4. **Tuning:** lock
one reading in the register (either is defensible — "first-earned" is
deterministic and explainable; the D097 legend-card copy presumes the Ghost
and should be generic).

**V8 — [MINOR — AMBIGUITY] II-8 Juggling Act repeatability:** "once per
closed qualifying 21-day window" + G5's anti-overlap clause → ~34 fires
(per-window) vs ~1–2 (per-run) by the walk's end. **Tuning:** per-run
semantics (like I-3/II-9) — collapses the Branch-tier repeat flood.

**V9 — [MINOR — PINS] Three dev-tunable date pins:** III-22's run anchor
(partial-first-week reading: d97 vs the runs' d182 convention — shifts the
machine's 4 fires and the earliest-possible Ghost); II-4's re-fire on
unbroken runs (d1000 ambiguous — "every time a NEW 500-day streak is
crossed"); III-26's second fire at the walk edge (d732).

**V10 — [MINOR — ABSENCE NOTES, not violations]** I-13 Unprompted is
structurally closed to the perfect habit user (habits every day); the
VIII ring-chain never fires (3/7 domains — honest); II-10/II-11/I-11 never
fire (no rests/breaks — honest). The why-panel should carry each as a
positive ("your tree never rested — nothing to rebuild").

---

## 10. Verdict

**Honesty: PASS — mechanically.** Every presence day is earned in-window
(zero grace, zero backfill, zero imports); the axes are honest (rhythm
1.00, balance 0.49, tenure 0.2); no rings (3/7 domains — the decoupling
holds: the machine matures and blooms unringed); no Ghost (the register
never lies). The two coherence breaks are both register-side, both
prior-art-confirmed, both with standing tuning authorization: **F4→E3
(V1: the densest user reads arid)** and **A3 (V2: the gym branch never
wears a twig)** — plus the standing E6 referent gap (V3).

**The Ghost-in-the-Machine probe: the task's hypothesis is REFUTED — and
that is the register WINNING.** The capstone's third leg is nutrition
(IV-5 No Deviation), so the perfect same-time machine — two of three legs
alive from d90/d97 — never fires the hardest trophy. The robot-consistency
family is a cross-domain triad, not a same-time test; the D096 early-fire
contract is not exercised by this archetype because there is no Grove-earn.
The honest schedule: III-22 at d97 (not d182), the earliest-possible Ghost
~d96–97 for a nutrition-inclusive robot (not "~day 182").

**The armor: PASS — with the carried gap.** Spines at d100 (immediate
texture ✓). Thorns: the 365-day data-streak exists (d365), the trigger
resolves to II-4 (d500), D1 completes (d731), and the armor manifests at
the Mar 1 '29 annual bloom alongside the crown — the register's full
schedule fires correctly for THIS archetype. The E6 referent (a nonexistent
365-day trophy) remains the standing catalog gap (V3) — the armor works for
the machine only because II-4 exists at 500 days.

**Economy: the run's new headline besides the Ghost.** A 369-bud bank at
maturity vs a 60/season flush vs ~170/yr accrual: the machine's bank grows
forever (~301 pending after spring Y4, ~410 by spring Y6) and the first
bloom delivers 60 of 369. Same-achievement aggregation (V6b) collapses the
bank to ~70–80 and restores the moment; the wave caps otherwise hold.

**The machine's tree in one sentence:** a 2-year, perfectly rhythmic,
mid-low-balanced pole→mature tree with two lush branches (48 twigs), a bare
gym stub (V2), no rings, ~369 buds banked, a 60-flower first bloom, a
spring-Y4 crown (III-11) + armor (thorns) — and an unjustified drought
adaptation (V1) waiting at the same spring.

**Fix before the engine contract (the dev-tools tuning surface, D105):**
F4's unit/ceiling (V1) · the per-class A3 bars (V2) · E6's referent (V3) ·
B2's 15-vs-20 (V4) · same-achievement aggregation + the season budget (V6)
· C4's first-vs-rarest lock (V7) · II-8 per-run semantics (V8) · the three
date pins (V9). Re-run this archetype after.