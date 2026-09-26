# PAPER ARCHETYPE RUN 01 — "GYM-HEAVY" (the 6-year gym lifter)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains) + Artifact 3 (trigger-correlation) + D090–D115 records in
TEMP-PLANNING.md. **Trophy conditions verified against:** ACHIEVEMENT-SCAN.md
(family/tier ladders, all 47 rungs) + scan-outputs/02-achievements.md §3.III/V
(verbatim conditions) + Gamification.md (streak/ring/qualifying definitions).
**Run note:** supersedes the earlier draft of this file; §8 lists the
corrections. **Cross-references:** run 02 (journal-only) findings V1–V10,
run 03 (balanced) findings V-1…V-8 — cited where they touch this pattern.

---

## 0. The synthetic user

A 6-year user. Pattern: **3 gym sessions/week (Mon+Wed strength, Fri cardio,
4 real sets each, weight-mode), 1 weigh-in/week (Sunday, first-of-day),
journal 2 entries/month (~80 words), NO nutrition, NO goals, NO media, NO
habits, NO vacations, NO phases.** Every event written same-day (in-window,
D100 predicate, A1 grace never used), none imported, none future-dated (F10).
Birth anchor = **Jan 15 Y1** (the first in-window event — the first workout —
frozen per D090 B / D100 / D102). Walk = day 1 … day 2190 (Jan 14 Y7), with
checkpoints at Day 1 · Week 4 · Month 6 · Year 1 · Year 2 · Year 3 · Year 5 ·
Year 6 (each "Year N" checkpoint = the N-th anchored window close, day 365×N).

| Domain | Cadence | In-window days/yr | A2 qualifying rule |
|---|---|---|---|
| Gym (`workout.completed`) | Mon+Wed strength, Fri cardio, 4 real sets each | 156 | ≥1 real logged set ✓ |
| Body (`body.weighed`) | Sunday, first-of-day | 52 | 1 canonical weigh-in ✓ |
| Journal (`journal.created`) | 2/month, ~80 words | ~24 | ≥40 words, non-imported ✓ |
| Nutrition / Media / Goals / Habits | NONE | 0 | — |

**Assumption set (stated, then applied — every count in this run is derivable
from these):**

- **A1 — fixed weekdays.** The 3 sessions are Mon/Wed/Fri every week (the only
  way to do exact 30-day-day math; the brief pins "3/week" but not the days).
  With it: gym days per 30-day month = 12–13, max 14. Consequence: III-22 The
  Schedule Never Breaks (26-wk exact weekday-set) fires and re-fires.
  *Sensitivity:* if weekdays drift, III-22 never fires (−12 Heartwood fires).
- **A2 — no fixed clock slots.** Weigh-in day is Sunday but the hour is not
  pinned → the robot-consistency set (V-3, I-4, IX-5) stays unearned, per the
  conservative convention run 03 adopted. *Sensitivity:* if the user holds a
  slot, V-3 (26-wk weekday+slot) fires.
- **A3 — PR model.** Progressive overload with a novice year then slow linear
  gains: lifetime PR events (a set's est1RM > prior best, III-3) ≈
  40 (Y1) + 25 (Y2) + 15 (Y3) + 12 (Y4) + 10 (Y5) + 8 (Y6) = **110**. This
  gates III-4/5/6/7, III-8/9/10/11 and IX-4; III-7 (100th PR) lands mid-Y5.
  *Sensitivity:* a stepwise-only progression (no rep-jitter PRs) halves this
  and pushes III-7 out of the window.
- **A4 — strength profile** (8 strength sets/week = 2 per lift; 8-rep working
  weights, kg; bodyweight steady 80 ±1 kg — a maintainer, no phases):

  | Lift | Y1 end | Y2 | Y3 | Y4 | Y5 | Y6 |
  |---|---|---|---|---|---|---|
  | Bench | 55 | 60 | 65 | 70 | 75 | 80 |
  | Squat | 85 | 95 | 105 | 112.5 | 120 | 125 |
  | Deadlift | 110 | 120 | 130 | 140 | 147.5 | 155 |
  | OHP | 35 | 40 | 42.5 | 45 | 47.5 | 50 |

  est1RM (Epley, ×1.2667 at 8 reps) → gates III-12…III-17, III-18 and the
  absolute rungs R1–R24 (actual-lift-only, never est1RM).
- **A5 — cardio = rep-mode machine work** (row/cycle — weight-mode tonnage
  and bodyweight rungs never touch it) → R25–R43 (bodyweight) never fire;
  curls (R20–R24) are not in the log. *Sensitivity:* push-up/pull-up/dip
  cardio would add R25/R30/R35 (Root).
- **A6 — no pinned journal dates** → I-12 Same Question New Answer (~60%
  two-year-match chance at this cadence) is NOT assumed; I-15 Bookended is
  impossible (146-day floor); I-11 You Came Back fires ~2×/yr because
  biweekly journaling naturally produces 21-day gaps (a trophy quirk, not a
  tree problem — see §7).

**Key derived quantities (exact per the locks):**
- Active days/yr ≈ 156 + 52 + ~10 unique journal days ≈ **218** (≥ A4's 200
  every year, every reading — even with all journal days colliding: 208).
- Any-30-day mixed window (d1–d30): 13 gym + 4 weigh-ins + 2 journal =
  **19 days ≥ 15** → B2 ticks day 26 (Feb 9).
- Gym days per 30-day month: 12–13, **max 14 — always < 15** (A3 per-domain
  bar; V2).
- Per-domain ring days (A5 bar 40): gym 156 ✓ · body 52 ✓ · journal ~24 ✗ ·
  nutrition/habits/media/goals 0 ✗ → **the canonical-7 ring-year can never
  close** (V1).

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 2 drifts)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | ≥1 real set / 1 canonical weigh-in / ≥40-word journal |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ as written | **Fails the canonical 3×/week cadence by ONE day — V2** |
| A4 | stage-year ≥200 active days | ✓ | 218/yr → 1 stage-year/yr |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | 4 of 7 domains at 0 → no ring ever — honest (V1) |
| B1 | first in-window event | ✓ | Day 1 (first workout) |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | Day 26 (19 mixed days) — *sensitive to the 15-vs-20 record drift (V12)* |
| B3 | 1 stage-year | ✓ | Day 365 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Day 730 — gym 156 ≥ 90 ✓ — **maturity at the Year-2 close, in WINTER (V3)** |
| B5 | ≥10 stage-years | n/a | 6/10 by year 6 |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 15 of a 159-bud bank — overflow is structural (V7) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | Holds; the queue never drains (V7) |
| C3 | ≥30 buds/branch → clusters | n/a | No habits |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ read | **Per-bloom legend selection unpinned — V10** |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | trivially ✓ | 0 twigs forever — the cap never binds (V2) |
| C7 | bank counter top-3 + count | ✓ | "top 3 + ~N more" at Y6 (queue ~60–90) — honest but absurd (V7) |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | d730 / d1095 / d1825 |
| E1–E14 | signatures | ✓ read | See §6 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | **Maturity Jan 14 = winter — the one season clash (V3)** |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | 0.05 primary · 0.88–0.91 if sets count — **unit-unpinned (V4)** |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ | ~0.90 |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ as written | **0.43 (canonical norm) vs 0.76 (observed norm) — unpinned (V6)** |
| F7 | TENURE = stage-years/10 | ✓ | 0.1→0.6 |
| F8 | replay ~2s/yr | ✓ | 6-yr time-lapse ≈ 12s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records
≥20 (02-V1, 03-V-6). This archetype is the first run that is *sensitive* to
it: 19 mixed days in the first window → SAPLING d26 at 15, ~d33 at 20. V12.

**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; no trophy in ANY family is a 365-day streak (II-4 The Long Haul
is 500-day; II-12 is an anniversary touch). E6 has no referent as written —
03-V-4 confirmed, and for this user it compounds (V8).

---

## 2. The walk

### CHECKPOINT DAY 1 — Jan 15 Y1 (the seed cracks)

- **B1 tick:** first in-window event (first workout, 4 real sets) →
  SEED → SEEDLING. Germination ceremony (D094: 5 branch-buds on the stem).
- **Events:** 1 workout. **Earned (buds):** III-1 First Rep Logged (Sprout).
  Bank = 1.
- **Axes:** RESOURCE 0.05 (1 event / 1 active day ÷ 20) · RHYTHM ~1.0 (one
  week of data) · BALANCE n/a (1 domain — the axis "forms" ~30 days) ·
  TENURE 0.
- **Rings 0 · Twigs 0.** **Why-panel:** "SEEDLING · age 1 day · 1 bud (III-1
  First Rep Logged) · next tick: SAPLING at 15 mixed days."

### CHECKPOINT WEEK 4 — Feb 11 Y1 (day 28)

- **B2 tick (day 26, Feb 9):** 19 mixed days (13 gym + 4 weigh-in + 2
  journal) ≥ 15 in the first 30-day window → SEEDLING → SAPLING.
- **Earned by d28 (all buds, tier-marked per D096; the checkpoint window is
  approximate — a few fire by week 8):** III-1 (S) · V-1 First Measurement
  (S, d5) · I-1 Ink on the Page (S, d11) · III-2 The Basics (R, d3 —
  squat/bench/DL/OHP all logged) · III-3 New Number ×3 (R) · I-13
  Unprompted-Root (R, d11 — solitary journal day: Saturday, no gym) ·
  III-18 Novice ×4 (B, months 1–2: bench est ≥ 40, squat ≥ 60, DL ≥ 80,
  OHP ≥ 28 — vs 0.5/0.75/1.0/0.35 × 80 kg BW). Bank ≈ **12** (3 S · 5 R ·
  4 B).
- **Axes:** RESOURCE 0.05 (19 events / 19 active days ÷ 20) · RHYTHM ~0.89
  (weeks of 4–5 active days, CV ≈ 0.11) · BALANCE ~0.35 (forming) · TENURE 0.
- **Rings 0 · Twigs 0** (13 gym days in the window — A3 bar 15, V2).
- **Why-panel:** "SAPLING · age 4 weeks · 12 buds · your gym branch extends
  first — no twig yet: the twig bar wants 15 days in a month, your cadence
  gives 13."

### CHECKPOINT MONTH 6 — Jul 15 Y1 (day 181)

- **Earned by d181 (cumulative ≈ 67 buds):** + III-4 Ten Times Better (R,
  ~d75 — 10th PR) · III-5 Quarter Century of PRs (B, ~d165 — 25th PR) ·
  III-8 Same Lift ×10 (B, ×2: two lifts' 10th PR) · III-9 PR Season ×5 (B) ·
  III-16 Triple Bodyweight Club (H, ~d90 — est-total 69.7+107.7+139.3 =
  316.7 ≥ 3.0×80 = 240) · III-10 Trifecta Week ×2 (H) · III-21 Trimester of
  Iron (B, d84 — 12 consecutive weeks at target; re-fires every 12 weeks) ·
  III-19-Moved a Mountain-Root (R44, ~d180 — tonnage ≈ 100k kg: ~3,920 kg/wk
  × 26 wks) · III-20 Heaviest Session ×10 (R) · III-3 ×30 (R) · I-11 You
  Came Back (R, ~d90 — first 21-day journal gap) · IX-4 Wrote It Down-Root
  (R, ~d130 — journal + PR same day) · V-2 Steady Hand (R, d84 — 12
  consecutive Sunday weigh-ins). Count: 3 S · 47 R · 14 B · 3 H.
- **Axes:** RESOURCE 0.05 · RHYTHM 0.90 · BALANCE 0.43 (canonical-7 norm;
  0.76 observed-3 — V6) · TENURE 0.
- **Twigs 0 · Rings 0.** **Why-panel:** "SAPLING · half a season · 67 buds
  (the PR faucet is flowing) · your branch grows latewood, not twigs — the
  rung ladder is your wood."

### CHECKPOINT YEAR 1 — Jan 14 Y2 (day 365)

- **B3 tick:** 1st stage-year closes (218 active days ≥ 200) →
  SAPLING → POLE. Leaf granularity unlocks (C6). **F7 TENURE 0.1.**
- **Earned (cumulative ≈ 107 buds):** + **III-11 A PR Every Season**
  (**Grove**, ~d340 — the 12th distinct calendar month with ≥1 PR) ·
  III-8 ×4 total (B, all four lifts' 10th PR by ~d240) · III-9 ×10 (B) ·
  III-21 ×4 (B) · **III-22 The Schedule Never Breaks ×2** (H, d182 + d364 —
  26-wk exact weekday-set runs; A1) · III-10 ×4 (H) · III-3 ×40 (R) ·
  III-20 ×20 (R) · R6 First Descent (R, ~d270 — squat 80 on the bar) ·
  R11 Ground Zero (R, ~d200 — DL 100) · I-11 ×2 (R) · I-13-Branch (B,
  ~d266 — 10th solitary journal day) · IX-4-Root (R, ~d130 — one fire, the
  milestone trophy) · **VIII-1 One Year In (Ring, d365)** — 3 domains
  present in 12/12 months ✓ · **III-26 A Year on the Bar (Ring, d366 — the
  ±7d band around the d1 anniversary; counted at this checkpoint, boundary
  note)**. Count: 3 S · 70 R · 24 B · 7 H · 2 Ring · 1 Grove.
- **Rings (trunk): 0.** **Branch rings (D088 A): 1 each** on gym, body-forks
  and journal branches (all present all year — the bar is undefined, see V11).
- **Why-panel:** "POLE · age 1 · stage-year 1 · your first Grove is banked
  (III-11 — a PR every season) · two Ring-tier buds on a trunk that has no
  ring yet — rings are the seven-domain brand (A5)."

### CHECKPOINT YEAR 2 — Jan 14 Y3 (day 730) — MATURITY, IN WINTER

- **B4 tick (d730):** 2 stage-years AND gym's best anchored year = 156 ≥ 90
  in-window days ✓ → POLE → **MATURE** (pioneer-speed, per B4's note —
  "~year 2 for hyper-consistent users" ✓). **D1 floor (2) met.**
- **The task's "Year 3 (maturity?)" question — answered:** maturity lands at
  the Year-2 close (d730). What is *actually* in question is not the stage
  but its DATE: **Jan 14 is winter** (F1: winter = Dec 1). D092(2) says the
  first bloom bursts AT MATURE; D095 says winter is the resting/banking
  season and winter-earned trophies are flower-buds banked to spring. The
  register has no season guard on the maturity bloom → **V3** (see §5).
- **Earned (cumulative ≈ 165 buds):** + III-6 Fifty Beaten (H, ~d425 — 50th
  PR) · III-13 One and a Half (B, ~d700 — squat est 120.3 ≥ 1.5×80;
  borderline) · **III-17 Four Times Over (Grove, ~d610 — est-total
  76+120.3+152 = 348 ≥ 4×80 = 320; profile-sensitive, bracket Y1–Y3)** ·
  III-9 ×6 (B) · III-21 ×4 (B) · III-22 ×2 (H) · III-10 ×2 (H) · III-3 ×25
  (R) · III-20 ×10 (R) · I-11 ×2 (R) · R1 First Press (R, ~d410 — bench 60) ·
  R16 First Overhead (R, ~d425 — OHP 40) · **VIII-2 Two Years (Ring, d730 —
  same-day as maturity, V6 boundary)** · III-26(yr2) (Ring, d731). Count:
  3 S · 109 R · 35 B · 12 H · 4 Ring · 2 Grove.
- **First bloom (D092(2)):** the pre-maturity S/R/B/H bank at d730 ≈ **159
  buds** (Sprout 3 · Root 109 · Branch 35 · Heartwood 12). C1/C2: 15/event,
  4 waves → **60 bloom this season, ~99 overflow to spring Y4** — the burst
  cannot fit one ceremony (V7). Ring (VIII-1, VIII-2, III-26 ×2) and Groves
  (III-11, III-17) stay banked (D092(4)/(5)).
- **Adaptations:** **E3 phyllodes gate OPENS today** (resource 0.05 ≤ 0.4 ✓,
  D1 met ✓, floor SEEDLING ✓) → pending, manifests at the annual bloom
  (D093) = Mar 1 Y3 (V3/V6 pin). **E2 buttress still closed** (V5).
- **Axes:** RESOURCE 0.05 · RHYTHM 0.90 · BALANCE 0.43 · TENURE **0.2**.
- **Rings 0 · Twigs 0.** **Why-panel:** "MATURE — in winter. Your tree's
  flowering stage has arrived in the resting season: 159 earned flowers wait
  for the spring flush; the crown Grove (III-11) and the Rings bloom at the
  annual bloom."

### CHECKPOINT YEAR 3 — Jan 14 Y4 (day 1095)

- **First annual bloom (Mar 1 Y3 = d776, per the V6 pin):** 60 flowers (4
  waves: the top of the 159-bud bank + winter-Y3 earns: III-19-Branch R45
  ~d760, I-6 ~d750, III-26(yr3) d1096? — no: III-26(yr3) = d1096, AFTER this
  bloom; III-26(yr2) d731 banks here) · **Ring ×4 bloom here (VIII-1, VIII-2,
  III-26 ×2 — D092(4))** · **III-11 = the CROWN transformation (the
  first-earned Grove, C4)** · III-17 = large bloom (C4 cap) · **E3 phyllodes
  manifests** (D093 — rides this bloom under the V6 boundary pin).
- **On-earn (growing season, D092(3)):** III-18 Intermediate squat/DL/OHP
  (~d880–960 — est 133/164.7/53.8 ≥ 132/160/52) and III-12 Bodyweight Bench
  (d~830 — est 82.3 ≥ 80) bloom immediately — single-flower micro-blooms
  (V7 confetti).
- **Earned (cumulative ≈ 213 buds):** + III-14 Double Bodyweight Pull (H,
  ~d880 — DL est 164.7 ≥ 160) · III-18-Int ×3 (H, ~d880–960 — squat/DL/OHP
  est 133/164.7/53.8 ≥ 132/160/52) · III-19-R45 (B, ~d760 — tonnage 500k) ·
  I-6 Half Century (R, ~d756 — the 50th journal entry, winter Y3 — banks to
  the Mar 1 Y3 flush) · **III-27 Three Years in Iron (Grove, d1095 — 3
  windows × 156 ≥ 80 workouts)** · **V-8 Three Years in Frame (Grove, d1095
  — 3 windows × 52 ≥ 40 weigh-in weeks)** · III-9 ×4 · III-21 ×4 · III-22 ×2
  · III-3 ×15 · III-20 ×10 · I-11 ×2 · R7 Century Squat (R, ~d930 — squat
  100). Count: 3 S · 138 R · 45 B · 19 H · 4 Ring · 4 Grove.
- **Axes:** TENURE **0.3** (D2 floor met). **Rings 0 · Twigs 0.**
- **Why-panel:** "MATURE · age 3 · the crown: A PR Every Season — the tree's
  once-in-a-lifetime transformation · phyllodes grew (the why-panel must say
  WHY, and it is wrong — see V4) · two new Groves banked for the spring
  bloom."

### CHECKPOINT YEAR 5 — Jan 14 Y6 (day 1825)

- **Earned (cumulative ≈ 286 buds):** + **III-7 Century of PRs (Grove,
  ~d1670 — the 100th PR; borderline under A3)** · III-15 Press Three-Quarters
  (B, ~d1670 — OHP est 60.2 ≥ 60; borderline) · III-19-R46 The Mountain Moves
  (H, ~d1340 — tonnage 1M kg) · I-13-Heartwood (H, ~d1330 — 50th solitary
  day) · III-10 ×1 (H, ~d1300) · III-9 ×5 · III-21 ×9 · III-22 ×4 ·
  III-3 ×22 · III-20 ×18 ·
  I-11 ×4 · R12 The Pull (R, ~d1340 — DL 140) · III-26(yr4/yr5) (Ring ×2) ·
  **VIII-3 Five Years (Grove, d1825)** · **V-9 Five Years in Frame (Grove,
  d1825)** · **III-28 Five Years in Iron (Grove, d1825)** — the three
  five-year chains close together on this checkpoint. IX-4-Branch: NOT
  earned (the 10th journal+PR day: ~9.4 expected by d2190 — just misses
  under A3). Count: 3 S · 183 R · 60 B · 26 H · 6 Ring · **8 Grove**.
- **Annual blooms:** Mar 1 Y5: 60 from the standing queue (the overflow never
  drains — V7). **Groves banked this year bloom at the NEXT annual bloom
  (D092(5)):** III-27/V-8 → Mar 1 Y4 ✓ (already counted); III-7 (earned
  ~mid-Y5, growing season but Grove-tier → next annual bloom = Mar 1 Y6);
  VIII-3/V-9/III-28 (closed in winter → Mar 1 Y6 flush, D095).
- **Axes:** TENURE **0.5** (D3 floor met — the caudex floor, not the gate).
  **Rings 0 · Twigs 0.**
- **Why-panel:** "MATURE · age 5 · stage-years 5 · three Groves closed this
  winter (VIII-3, V-9, III-28) and the Century (III-7) landed mid-year ·
  your trunk still shows no ring — four domains have never spoken. The gym
  branch carries its own six branch rings."

### CHECKPOINT YEAR 6 — Jan 14 Y7 (day 2190) — FINAL STATE

- **B5:** needs 10 stage-years — far off (6/10). **F7 TENURE 0.6.**
- **Earned at the walk's edge:** VIII-3 Five Years (**Grove**, d1825) ·
  V-9 Five Years in Frame (**Grove**, d1825) · III-28 Five Years in Iron
  (**Grove**, d1825) — all three close on the year-5 checkpoint, winter → all
  bank to the Mar 1 Y6 annual bloom, where III-7 joins them (4 Groves in one
  bloom). III-26(yr6) = d2191 — 1 day past the final checkpoint (noted).
  III-25 Thousand Sessions: **936 < 1000 → fires ~month 77 (d2340), outside
  the walk** ✓ honest. III-19-Grove (R47, 5M kg): never (1.67M).
- **Annual blooms:** Mar 1 Y6: 60 from the queue + the 4 Groves (III-7,
  VIII-3, V-9, III-28 — legend tiebreak unpinned, V10) + III-26(yr5) Ring +
  III-18 Intermediate bench (d~1930, on-earn, borderline: est 101.3 ≥ 96).
- **Final bank ≈ 314 fires:** Sprout 3 · Root ~201 · Branch ~66 · Heartwood
  ~29 · Ring 7 · Grove 8. ~60–90 buds still pending in the queue (C7: "top 3
  + ~N more"). The repeatable faucets = ~82% of the lifetime bank (V7).
- **Rings (trunk): 0 — can a ring EVER form? No.** A5's canonical-7 × ≥40
  in-window days: gym 156 ✓, body 52 ✓, journal ~24 ✗, and 4 domains at 0,
  forever. **Verdict: the honest no-ring outcome is CORRECT — verified
  against D090 C ("single-domain users reach full maturity — they just never
  brand rings"; this is a 3-of-7 user), D101 rule 1 (the stage clock never
  reads ring-years — 6 stage-years accumulate freely), D104 (the canonical 7
  are the ring set), D114(3) (the ring-year domain set = the canonical 7).**
  The VIII-11→20 ring series (which reads VIII-5's six-domain windows —
  zero here) never fires either: internally consistent. The aged look is not
  lost: D088 A branch rings — gym 6, body-forks 6, journal 6 (V11 flags the
  undefined bar). **But the why-panel contradiction stands (V1):** Ring-tier
  flowers (VIII-1, VIII-2, III-26 ×5) and the VIII-3 Grove bloom at a trunk
  that shows no ring.
- **Why-panel:** "Six years, 936 sessions, 312 weigh-ins, 144 pages — and
  your trunk never brands a ring: rings are a seven-domain brand. Your years
  live in the gym branch's six rings, its latewood (7 rungs + 1.67M kg), the
  phyllode character (see V4), and the crown earned at three. The caudex
  grows next year (tenure 0.7 at d2555)."

---

## 3. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | **0.05** (232 events / 218 active days ÷ 20) — **0.88–0.91 if sets count as events** (3,744 sets + 232 presence events → 3,976/218 = 18.2 ÷ 20) | unit-dependent: 0.05 → sparse (phyllodes + caudex fire); 0.91 → lush (buttress leg fires) — V4 |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **0.90** (weeks of 4–5 days; mean ≈ 4.21, CV ≈ 0.10) | steady |
| F6 BALANCE | Shannon evenness, canonical 7 | **0.43** (canonical-7 norm, zeros included: p = (156, 52, 24, 0,0,0,0)/232 → H = 0.8366 → H/ln7) — **0.76** (observed-3 norm: H/ln3) | **unpinned — V6** |
| F7 TENURE | stage-years ÷ 10 | 0 → **0.6** | mid |

**Stage ticks (B-group):** B1 day 1 · B2 day 26 · B3 day 365 · **B4 day 730
(maturity at ~year 2 — matches the register's pioneer-speed calibration; the
DATE is the problem, not the pace: V3)** · B5 at year 10 (not reached).

**Twigs per domain (A3):**

| Domain | In-window days/30-day month | A3 bar | Twigs |
|---|---|---|---|
| Gym | 12–13 (max 14) | 15 | **0 forever — misses by ONE day (V2)** |
| Body (forks) | 4.3 (1/wk) | 15 | 0 forever |
| Journal | 2–3 | 15 | 0 forever |
| Nutrition/habits/media/goals | 0 | 15 | 0 |

**Rings (A5):** gym 156 ≥ 40 ✓ · body 52 ✓ · journal ~24 ✗ · 4 domains 0 ✗ →
**0 trunk rings in 6 years, and forever — the honest outcome, verified (V1).**
Branch rings (D088 A): 6 on each present branch (bar undefined — V11).

**Bank by year (cumulative fires):**

| Year | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| 1 (d365) | 3 | 70 | 24 | 7 | 2 | 1 | 107 |
| 2 (d730, MATURE) | 3 | 109 | 35 | 12 | 4 | 2 | 165 |
| 3 (d1095) | 3 | 138 | 45 | 19 | 4 | 4 | 213 |
| 5 (d1825) | 3 | 183 | 60 | 26 | 6 | 8 | 286 |
| 6 (d2190) | 3 | 201 | 66 | 29 | 7 | 8 | **314** |

**The rung ladder milestones (R1–R47, actual-lift-only):**

| Rung | Threshold | Fires | When |
|---|---|---|---|
| R6 First Descent | squat 80 kg | ✓ Root | ~d270 |
| R11 Ground Zero | DL 100 kg | ✓ Root | ~d200 |
| R1 First Press | bench 60 kg | ✓ Root | ~d410 |
| R16 First Overhead | OHP 40 kg | ✓ Root | ~d425 |
| R7 Century Squat | squat 100 kg | ✓ Root | ~d930 |
| R12 The Pull | DL 140 kg | ✓ Root | ~d1340 |
| R2 Two Plates Deep | bench 80 kg | ✓ Root | ~d1870 |
| R44/R45/R46 (III-19) | 100k / 500k / 1M kg tonnage | ✓ R / B / H | ~d180 / ~d760 / ~d1340 |
| R3–5, R8–10, R13–15, R17–19 | Branch–Grove absolute | ✗ never | profile tops out below them |
| R20–24 (curls), R25–43 (bodyweight) | — | ✗ never | not in the log (A5) |
| R47 The Brand | 5M kg | ✗ never | 1.67M at Y6 (≈ year 17.5) |

**Honest rung verdict:** 7 of the 24 absolute rungs fire, ALL Root-tier; the
tonnage ladder reaches Heartwood. No Branch/Grove rung in 6 years of
consistent training — the rung system's upper tiers are intensity-gated, and
8 sets/week is maintenance volume. Rarity preserved; not a violation.

---

## 4. The bank — III Iron Ledger by tier + the blooms (D092/D095)

**Earned bank by tier (all fires within the walk; assumption-gated counts
marked):**

| Tier | Trophies | Count |
|---|---|---|
| Sprout | III-1 (d1) · V-1 (d5) · I-1 (d11) | 3 |
| Root | III-2 · III-4 · III-3 ×110 [A3] · III-20 ×~65 [A3] · III-19-R44 · I-11 ×~12 [A6] · I-13-R · V-2 · IX-4-R · rungs R6/R11/R1/R16/R7/R12/R2 (7) | ~201 |
| Branch | III-5 · III-8 ×4 · III-9 ×~26 [A3] · III-21 ×26 · III-18-Novice ×4 · III-12 · III-13 · III-15 · III-19-R45 · I-13-B | 66 |
| Heartwood | III-6 · III-10 ×~8 [A3] · III-18-Intermediate ×4 · III-14 · III-16 · III-22 ×12 [A1] · III-19-R46 · I-6 · I-13-H | 29 |
| Ring | VIII-1 (d365) · VIII-2 (d730) · III-26 ×5 (d366/731/1096/1461/1826) | 7 |
| Grove | III-11 (d~340 — **the CROWN**) · III-17 (d~610) · III-27 (d1095) · V-8 (d1095) · III-7 (d~1670) · VIII-3 (d1825) · V-9 (d1825) · III-28 (d1825) | 8 |

**Never fires (verified):** everything in IV (no nutrition), II (no habits),
VI (no vacations), VII (no media) · I-2/3/4/5/7/8/9/10/15/16/17 (journal
cadence) · I-12 (assumed no, A6) · III-23/24 (no phases, no gaps — the
return-economy is absent by construction, honest) · III-25 (936 < 1000; fires
~month 77, outside the walk) · III-18-Advanced ×4 (profile tops below 128/176/
200/72) · V-3/4/5/6/7 (no slots/phases/photos) · V-10/11/13–16 (steady 80 kg;
V-12 Eighty borderline ~Y1, assumption-gated) · VIII-5…10, VIII-11…20 (no
six-domain windows, no rings — both ring definitions agree at zero) ·
IX-1/2/3 (needs 4–6 domains same day) · IX-5 (robot trio incomplete).

**Bloom schedule (D092/D095; bloom day = Mar 1 per the V6 pin):**

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | **Jan 14 Y3 — WINTER** | 159-bud S/R/B/H bank vs C1 15/event + C2 60/season → **V3: a winter bloom or an undefined deferred ceremony; the burst takes ~3 seasons to clear** | C1/C2 mechanically hold at 60; overflow honest |
| Annual bloom Y3 | Mar 1 Y3 | 60 (bank top) · Ring ×4 (VIII-1, VIII-2, III-26 ×2) · **III-11 → CROWN transformation (C4)** · III-17 large · **E3 phyllodes manifests (D093)** | C4 ✓ · E3 ✓ |
| Annual bloom Y4 | Mar 1 Y4 | 60 (queue) · **III-27 legend** (first-earned of the Jan 14 Y4 pair; tiebreak unpinned — V10) · V-8 large | C4 cap ✓ |
| Annual bloom Y5 | Mar 1 Y5 | 60 (queue) — queue never drains (V7) | C2 ✓ |
| Annual bloom Y6 | Mar 1 Y6 | 60 (queue) · **4 Groves: III-7, VIII-3, V-9, III-28 — one legend, three large (tiebreak unpinned, V10)** | C4 cap ✓ |
| On-earn (post-maturity, growing season) | every PR/record/rung day | single-flower micro-blooms: III-3, III-20, III-21, III-22, III-18-Int, III-12/14/15/16-earns | **V7: the wave structure never binds post-maturity** |

Winter earns (III-26 re-fires, VIII-2/3, V-8/9, III-27/28, III-19-R45, I-6)
all bank as flower-buds → spring flush (D095 ✓). Winter journal entries
(~6/yr) become leaf-buds on the bare branches (D095(2)).

---

## 5. The adaptations (E1–E14) — verdict for this pattern

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.6 at Y6 → **0.7 at d2555**; resource 0.05 ✓ | **Reachable at year 7 — outside the walk; manifests at the Y8 bloom.** The ancient-sparse trait on a never-dormant tree — the wait is long (02-V4) |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | balance 0.43 (0.76 alt) · resource 0.05 (0.91 alt) | **UNREACHABLE — every consistent reading fails one leg (V5).** The multi-domain stalwart adaptation can never open for the 3-domain stalwart |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | 0.05 ✓; D1 met d730 | **OPEN — manifests Mar 1 Y3. Semantically the WRONG character (V4): sparse-stubborn armor on a 230-day/year lifter** |
| E4 cladodes | divergence ≥0.6 | 0 (no entry-free streaks by design — 3/wk forever) | No — honest |
| E5 storage leaves | media share ≥0.5 | 0 media | No — honest |
| E6 thorns | "the 365-day streak achievement" + tenure ≥2 | no streak trophy exists anywhere (II-4 = 500d — 03-V-4); the 3×/week pattern has NO consecutive-day streaks (max ~4 days) | **UNREACHABLE twice over — V8 (the armor gap, extended)** |
| E7 spines | 100-day streak trophy (II-3, habit-family) | habit-locked; no 100-day streak possible at this cadence | **UNREACHABLE — V8** |
| E8 tendrils | live long-horizon goal | no goals | No — honest |
| E9 reaction wood + epicormic | a revival (dormancy end) — universal | never dormant, zero gaps | **No — honest: the tree never fell, so it never grew reaction wood. The why-panel must say so** |
| E10 contractile | 3 consecutive stage-years with RISING active days | 218 → 218 → 218 — flat | No — honest (03-V-5: ceiling users cannot rise; here the pattern is flat by construction) |
| E11 mycorrhizal | coachEngagement ≥ threshold (H-03) | no coach interaction in the archetype | Open — the owner threshold is undefined (02-V7); conservatively closed |
| E12 stolons | L-10 insight ≥3 monthly windows | no L-10 feed | Open/effectively-never (02-V7) |
| E13 bracts | no gate (ceremony) | F-03 PR flourish fires ~110× | Present ✓ display-only |
| E14 bud scales | no gate (dormant-habit state) | no habits | None ✓ |

**Structural marks reachable in this life: exactly one (E3 phyllodes, Mar 1
Y3) + one pending at the walk's edge (E1 caudex, year 8).** Everything else
is locked to domains/cadences this user doesn't touch — and the ONE
adaptation that fires is semantically wrong for him (V4).

---

## 6. Verification (honesty, coherence, schedules, economy, budgets)

**Honesty — PASS.** Nothing farmed: every event real, same-day, in-window
(A1/D100), non-imported, ≥1 real logged set per session (A2) ✓. Nothing
unrewarded: every earned bud has a dated expression (D092) — the only
unbloomed things are unearned (III-25 at 936/1000, R47 at 1.67M/5M,
IX-4-B at ~9.4/10; III-7's earn is assumption-sensitive but dated) ✓.
III-24 and E9 correctly never fire for the
never-gapping user — the return-economy is absent by construction.

**Coherence — PASS with one why-panel lie.** Contradictory signatures
impossible (caudex vs buttress: 0.05 vs 0.6 — no overlap) ✓. **BUT:** (a) the
phyllodes manifest makes the why-panel tell a 6-year 3×/week lifter his tree
"grew sparsity armor because your logging is thin per day" — false (V4);
(b) Ring-tier flowers and the VIII-3 Grove bloom at a trunk whose rings can
never form (V1); (c) both ring definitions (A5 canonical-7 vs VIII-5
six-domain) agree at zero here, but they are two different bars — the split
stands (V1 note).

**Schedules — PASS with one winter clash.** All events in-window; fixed
seasons F1/F2 respected everywhere EXCEPT the maturity bloom date (Jan 14 =
winter, V3). D092 pre-maturity banking ✓, post-maturity on-earn in the
growing season ✓ (III-18-Int etc.), winter banking ✓ (III-26/VIII-2/3/V-8/9/
III-27/28), Ring at the annual bloom ✓, Grove at the next annual bloom ✓.
The same-day boundary (02-V6) appears three times: d730 (VIII-2 + maturity),
d731 (III-26), d776 (the bloom day) — pinned per 02's recommendation.

**Economy — MECHANICALLY PASS, DESIGN-STRAINED (V7).** C1 (15/event) and C2
(4 waves = 60/season) hold at every bloom; overflow banks with nothing lost;
C7 shows the pending count. But repeatable faucets (III-3 ×110, III-20 ×65,
III-21 ×26, III-22 ×12, III-9 ×26, III-10 ×8, I-11 ×12 = 259 of 314 fires,
**~82% of the lifetime bank**; the PR/record pair alone = 56%) dominate: the
first bloom shows 60 of 159 buds (38%); the pending queue is permanent
(~60–90 at Y6) — same structural strain run 03 flagged as V-1.

**Budgets — PASS.** Twigs 0/12 (C5 trivially satisfied — it never binds,
V2); C3 n/a; C4: crown once-set (III-11) ✓, per-bloom legend cap held by
construction but the SELECTION rule is unpinned (V10); C7 honest-but-absurd
counter (V7); D1/D2/D3 floors met d730/d1095/d1825 ✓.

---

## 7. Observations (not violations, recorded for the cross-run ledger)

- **I-11 quirk (02's note confirmed):** biweekly journaling produces ~2
  21-day gaps/yr, so "You Came Back" false-celebrates ~12× in 6 years — a
  trophy-level quirk (the trophy reads "you returned", but the user never
  left anything except journaling).
- **III-24 / E9 (03's note confirmed):** the never-gapping user earns neither
  — the return-economy is dead by construction; the why-panel should say
  "the tree never fell" rather than leave it silent.
- **V-12 Eighty borderline:** a steady-80kg maintainer's rolling average
  crosses 80 at some point — a "weight-gain" ladder trophy fires
  accidentally for a non-gainer. Trophy-quirk, not a tree problem.
- **III-17 / III-7 / IX-4-B / III-18-Adv-DL (196.3 vs 200 est) are
  profile-sensitive:** the strength profile (A4) decides Grove-vs-not for
  III-17 (bracket Y1–Y3) and III-7, and the IX-4 Branch step (expected ~9.4
  journal+PR days vs the 10-bar). Stated assumptions; the engine seed-data
  runs should sweep them.
- **B2 (15-vs-20 drift) is REAL for this archetype:** 19 mixed days in the
  first window → SAPLING d26 at 15, ~d33 at 20. First run sensitive to the
  record drift (V12).

---

## 8. Violations & tuning proposals

**V1 — [PERMANENT, COHERENCE] The trunk ring can never form (A5/D101), and
Ring-tier flowers bloom on the ringless trunk.** A5's canonical-7 × ≥40
in-window days: this user caps at 232 domain-days (156+52+24), journal is
permanently < 40, four domains sit at 0. The no-ring outcome itself is
**CORRECT and verified** (D090 C, D101 rule 1, D104, D114(3) — the journal-only
walk's V5 verdict holds for a 3-of-7 user). The contradiction is the
**why-panel and trophy bank**: VIII-1, VIII-2, III-26 ×5 (Ring-tier) and
VIII-3 (Grove) bloom at a trunk that shows no ring, while D088's
"consistency compounds into rings" promise renders zero rings for the
system's most consistent gym archetype. Split-ring wrinkle: the tree's A5
ring (canonical 7 × 40 days) and the trophy ring (VIII-5's six-domain
windows) are different bars — both read zero here, but the definitional
split stands. *Tuning:* (a) why-panel copy must separate trunk rings
(seven-domain brand) from branch rings (D088 A — the gym branch carries its
own 6); (b) decide the ring bar ONCE (fold A5 into the VIII-5 definition, or
vice versa); (c) dev-tool option: a domain-relative ring (≥40 days in ≥4 of
7 domains brands a partial/sliver ring — 7/7 brands the full ring) so the
3-domain stalwart earns a partial ring.

**V2 — [PERMANENT, PRESENCE] Zero twigs (A3): the canonical 3×/week gym
pattern misses the bar by ONE day, forever.** Gym = 12–13 days/30-day month
(max 14 in a 31-day month with 5 Mondays + 5 Wednesdays + 4 Fridays) < 15;
body-forks 4.3; journal 2–3. Six years of wood (rungs → latewood) and zero
extension growth — the branch renders bare; C5 (12/yr + 3-yr retention)
never binds. Root cause: A3 is one bar doing two jobs (B2's stage gate —
correctly 15, any-domain-mixed — and the per-domain twig bar) without
re-calibration for weekly cadences (03-V-2 confirmed). *Tuning:* per-class
A3 bars (dev-tunable per D105): daily-class domains keep ≥15/30; gym ≥12/30
(a 3×/week month = 13 ≥ 12 fires); weekly-class domains (body/media/goals)
≥4/30. The gym branch then grows 12 twigs/yr and the canopy matches the log.

**V3 — [SCHEDULE] Winter maturity: the first bloom can land in the resting
season (D092(2) vs D095).** A Jan 15 anchor matures Jan 14 Y3 — winter per
F1. D092's "first bloom at MATURE" has no season guard; D095 makes winter
the banking season. Either a winter bloom (breaks the season rule) or an
undefined deferred ceremony. **Any anchor from Sep 15 to Feb 28 lands winter
maturity — ~5 months of the year** (runs 02/03 never hit it: anchors Mar 1
and Apr 10 mature in-season). Comorbid: the 159-bud bank vs C1/C2's 60 →
the "burst" needs 3 seasons to clear. *Tuning:* pin D092 — the first bloom =
the next spring flush (F1/F2 guard), granted a one-time 4-wave season (60);
evaluate the bank at the bloom's opening (02-V6's boundary rule).

**V4 — [CALIBRATION, THE BIG ONE] F4 RESOURCE is unit-unpinned AND
misclassifies session-based logging (the register's own D105 deferral).**
The same event log reads **0.05** under presence-owner events
(workout.completed = 1 event/session → 232 events/yr ÷ 218 active days ÷ 20)
and **0.88–0.91** under set-level events (3,744 sets → ~18.2/day ÷ 20). The
two readings bracket the tree's entire character: 0.05 fires phyllodes
(sparse-stubborn) + caudex; 0.91 fires buttress's resource leg. And the
0.05 reading equals the journal-only walk's 0.05 — the axis cannot
discriminate a daily journaler from a 3×/week lifter (02-V2 confirmed and
strengthened: here the ambiguity is WITHIN one domain, not just across
users). *Tuning:* (a) pin the event unit (count set/unit-level volume —
measurements class already maps sets to the vascular system); (b) lower the
ceiling 20 → ~5–8; (c) or count class-presence (3 domains → 3/7 ≈ 0.43 —
mid, honest for a 230-day user). The phyllodes verdict flips on this number
alone; it must be frozen before the engine contract.

**V5 — [UNREACHABLE] E2 buttress can never open for the archetype it
describes.** Balance leg: 0.43 (canonical-7 norm) — fails; resource leg:
0.05 (primary) — fails; alt-readings swap which leg fails (0.76 balance /
0.91 resource — but never both together). D2 + POLE floor are met. The
"multi-domain stalwart" adaptation is structurally impossible for a 3-domain
stalwart at ANY tenure (02's single-domain buttress verdict generalized).
*Tuning:* cascade from V4/V6 — once F4's unit is pinned and F6's norm is
chosen, re-derive E2's legs (the 03 run's ceiling-16 calibration makes the
balanced user read 0.69–0.79; a set-counted gym-heavy reads 0.88 — the two
archetypes then discriminate and buttress becomes reachable-for-some, which
is the rarity intent).

**V6 — [UNPINNED] F6 BALANCE normalization flips a gate.** Canonical-7
norm (zeros included, the register's own wording) → 0.43; observed-domains
norm → 0.76. Runs 02/03 are insensitive (0.00 with one domain; 0.85 with
all seven) — **this archetype is the one that exposes the formula choice**:
E2's balance leg is decided by an implementation detail. *Tuning:* pin the
canonical-7 norm (zeros included) in the register — a gate whose
open/closed state is an implementation detail is not a locked gate.

**V7 — [ECONOMY] Repeatable-faucet flood: ~82% of the lifetime bank is
re-fires; post-maturity on-earn blooms bypass the wave structure
(D092/D099).** III-3 ×110, III-20 ×65, III-21 ×26, III-22 ×12, III-9 ×26,
III-10 ×8, I-11 ×12 = 259 of 314 fires. The first bloom shows 38% of the
bank; the pending queue is permanent; on-earn PR/record flowers micro-bloom all
season so C1/C2 never bind post-maturity and the rarity gradient's VISUAL
identity (rare = big) is drowned in PR confetti (03-V-1 confirmed). *Tuning:*
(a) cluster-merge repeat-blooms (re-fires of one trophy within a season
render as ONE flower + a count badge — the C3 idea generalized); (b) batch
on-earn flowers into the ≤4 seasonal waves (per-trophy honesty stays in the
why-panel); (c) per-trophy-family bloom caps so one faucet can't dominate.

**V8 — [THE ARMOR GAP, EXTENDED] E6/E7 are unreachable twice over — and the
task's question ("should E6/E7 read ANY domain's 365d/100d streak?") gets a
two-part answer.** (a) The streak trophies are habit-family (02-V3): this
user has no habits. (b) **NEW — cadence blindness:** a 3×/week pattern has
NO consecutive-day streaks at all (max ~4 days: Fri→Sun). Even a
generalized any-domain trigger could never fire — the armor adaptations are
gated on a DAILY-practice concept that weekly-cadence domains cannot
produce. (c) E6's referent is missing: no 365-day streak trophy exists in
any family (II-4 = 500-day; 03-V-4). Net: a 6-year, 312-consecutive-week
lifter grows zero armor under every current reading. *Tuning:* (a) add
cadence-relative armor: thorns = 52 consecutive weeks with ≥1 session (this
user: 312 ✓); spines = 26 consecutive weeks; (b) fix E6's referent (cite
II-4's 500-day or add a 365-day trophy); (c) or document armor as
daily-practice-only. The "consistency compounds" spine of D088 C is
currently false for the gym archetype.

**V9 — [UNPINNED] The same-day boundary (02-V6) appears three times in this
walk.** d730: VIII-2's window closes ON the maturity day (winter — collides
with V3); d731: III-26's band; d776: the annual-bloom day (bank-evaluation
moment). *Tuning:* adopt 02's pinned rule — bloom = Mar 1 (first day of the
growing season); the bank is evaluated at the bloom's opening, so buds whose
windows close that day participate; a modification whose gates hold at the
bloom evaluates at that bloom. Do not defer ring/Grove buds an artificial
year.

**V10 — [UNPINNED] C4's per-bloom legend selection has no rule (and runs 02
and 03 read C4 differently).** 02 (journal-only) denies transformations to
post-crown Groves ("the crown is taken"); 03 (balanced) grants one legend
per bloom (VIII-7 transforms at Y4 despite the crown being once-set at Y3).
The register says "1 per annual bloom + 1 all-time CROWN" — the two runs
disagree on what that means, and this walk needs a tiebreak: III-27 and V-8
both close Jan 14 Y4; III-7/VIII-3/V-9/III-28 all bloom Mar 1 Y6. *Tuning:*
pin — one legend per annual bloom = that bloom's first-earned Grove (ties
broken by rarity hierarchy: the 5-year chains / vow-cluster first); the
crown = the first-earned Grove ever, once-set (03's reading — matches the
register text). Re-run 02's Y5 under this pin (its "crown is taken" denial
becomes "a legend + large blooms").

**V11 — [MINOR] D088 A's branch-ring bar is undefined.** The journal-only
walk counted branch rings at 365/365 (a daily journaler). This user's gym
branch is "actively present" 156/365 — under an A4-like bar (≥200) it rings
6×; under a domain-relative bar also 6×; under a daily bar it never rings.
The register never says. *Tuning:* define the branch-ring bar (recommend the
domain's own sustained cadence: ≥ its canonical presence — a branch rings the
years it was genuinely kept).

**V12 — [MINOR, RECORD] B2 15-vs-20 drift is decisive for this archetype**
(19 mixed days in the first window: SAPLING d26 vs ~d33). 02-V1/03-V-6
recommended freezing 15 — this run's sensitivity makes the fix a
must-reconcile, not cosmetic.

---

## 9. Corrections vs the earlier draft (record, not register violations)

(a) **F4 recomputed:** the draft's 0.19 mixed counting assumptions; the
primary reading is 0.05 (presence-owner events) with a stated 0.88–0.91
set-level bracket (V4). (b) **Bank recount ≈ 314 vs ~225:** every delta
traces to a stated assumption (A3 PR model: III-3 ×110; III-20 ≈ 65
record-days; III-9 ×26; III-21 ×26 — the draft undercounted its own
repeatables). (c) **The rung ladder added** (7 absolute rungs + R44–46
tonnage, all Root/Branch/Heartwood — the draft's R9/R14/R18 guesses were
above this profile). (d) **III-17 placed ~Y2** (profile-sensitive bracket
Y1–Y3) vs the draft's "y6 borderline". (e) **The winter-maturity analysis is
now explicit** (V3) instead of a footnote. (f) **No-ring verdict cited
against the four records** like run 02's V5, and the VIII-5-vs-A5 split-ring
definitional wrinkle separated out. (g) **C4's legend ambiguity surfaced as
V10** — the draft (and 02) silently read "crown-only"; 03 reads "one per
bloom"; the register text supports 03.

---

## 10. Verdict

**The GYM-HEAVY user is the system's flagship consistency story — 6 years,
936 sessions, 312 weigh-ins, ~314 earned trophies, 6 stage-years, RHYTHM
0.90 — and the locks render him a bare, mis-charactered tree.** Stage ladder
exact (maturity at the Year-2 close, pioneer-speed ✓, days-based B4 works
exactly as D115 designed). Bank economy holds (nothing lost, nothing
farmed, nothing flattened; III-25 at 936/1000 stays honestly unearned). The
no-ring outcome is **confirmed correct** against D090 C / D101 r1 / D104 /
D114(3) — the honest fate of any non-seven-domain life (02-V5). What fails
is concentrated in six numbers + two schedule gaps: **A3** (twigs miss by
one day — V2), **A5/vs-VIII-5** (ring definition + ring-tier flowers on a
ringless trunk — V1), **F4** (unit-unpinned, 0.05↔0.91, misclassifies a
3×/week lifter as sparse — V4), **E2's resource leg** (unreachable — V5),
**F6's norm** (gate-deciding, unpinned — V6), **D092's maturity guard**
(winter bloom — V3), **D099's waves** (confetti — V7), and the **armor gap
doubled** (habit-locked AND cadence-blind — V8). One adaptation fires in six
years, and it is semantically the wrong one (phyllodes on the steadiest
archetype).

**Priority tuning order:** F4 unit + ceiling (V4 — flips the tree's whole
character) → D092 winter-maturity guard (V3) → A3 class bars (V2) → E6/E7
cadence-relative armor (V8) → F6 pin (V6) → E2 legs re-derived (V5) → C4
legend rule (V10) → D099 batching + repeat-bloom clustering (V7) → the
ring-definition fold (V1) → the branch-ring bar (V11). Every one is
dev-tunable per D105 — the paper run's job was to find exactly these.

**Run verdict: FAIL-as-written, PASS-as-tunable — the stage/schedule/budget
machinery is sound; the tree's rendered truth for the gym archetype is not,
until the F4 unit, the A3 classes, the winter-maturity guard, and the armor
cadence are fixed in the dev tools and this archetype re-run.**