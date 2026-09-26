# PAPER ARCHETYPE RUN 10 — "HABIT-HOARDER" (the C3 bud-cluster + per-habit faucet stress test)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains, D104) + Artifact 3 (trigger-correlation) + the D090–D115
records in TEMP-PLANNING.md (D092/D093/D095/D096/D099/D100/D101/D103/D104/D105/
D107/D114/D115 read in full). **Trophy conditions verified against:**
scan-outputs/02-achievements.md (verbatim per-trophy conditions, families I–IX)
+ ACHIEVEMENT-SCAN.md (tier ladders). **Cross-references:** run 03 (balanced —
the habit-family re-fire precedents), run 09 (rotating-logger — the canonical-7
evenness reading), run 05 (bursty — the winter-maturity clash), the
relentless-logic-audit §(b) (the habit-hoarder at 60 habits — this run walks the
200-habit extreme), the final-adversarial-audit finding 89–90 (C3's absent D107
representation).

**Purpose:** this archetype is **D099 N-4b / register C3's test case** — the
bud-cluster surface at scale. The questions on the table: (1) what does the
clustering math actually produce for 200 habit-buds (how many clusters + how
many individuals, and does the count stay honest)? (2) what does the per-habit
repeatable faucet (II-2/3/5/6/12/4 × 200 habits) do to the bank, the bloom
economy, the Coach, and the derived cache? (3) what does the F4 RESOURCE ceiling
do when a user exceeds it ~10×? (4) is the resulting tree a beautiful honest
reflection or a garish monstrosity — and which register numbers make it one?

---

## 0. The synthetic user

A 2-year user with **200 habits** (drink water, stand up, breathe — trivial but
REAL logged completions). Pattern: **every one of the 200 habits completed
every day** (200 check-ins/day — comfortably over the "100+" floor), **journal 1
entry/week** (~150 words, qualifying), **no other domain ever**. Every event
written same-day (in-window, the D100 predicate — the A1 grace never used), none
imported, none future-dated (F10). One frozen birth anchor: **Jan 1 Y0** — the
first in-window event (a habit completion; the first journal entry lands the
same day), frozen per D090 B / D100(5) / D102. Walk = day 1 … day 730 (Jan 1 Y2),
checkpoints at **Week 4 (Jan 28 Y0, d28) · Month 3 (Apr 1 Y0, d91) · Year 1
(Jan 1 Y1, d365) · Year 2 (Jan 1 Y2, d730)** — each "Year N" checkpoint = the
N-th anchored 365-day window close (F3, never calendar-chopped).

| Domain | Cadence | In-window days/yr | A2 qualifying rule |
|---|---|---|---|
| Habits (`habit.completed`) | **200 habits × every day** | 365 | 1 completion ✓ (×200) |
| Journal (`journal.created`) | 1/week (~150 words) | 53 (Y0) / 52 (Y1) | ≥40 words, non-imported ✓ |
| Gym · Nutrition · Body · Media · Goals | 0 | 0 | — |

**Assumption set (stated, then applied — every count in this run is derivable
from these):**

- **A1 — all 200 habits completed daily.** The "100+ check-ins/day" floor is
  met at 200/day. *Sensitivity:* if exactly ~100 of the 200 were daily, every
  per-habit trophy count halves (II-6 ×2400, II-2/3/5/12 ×100, II-4 ×100) and
  the other 100 buds sit dormant (E14 bud scales would fire) — every conclusion
  below (saturation, flood, clusters, thorns, the queue) is shape-identical. The
  all-200 reading is walked because the brief's "200 habits × re-fire" requires
  all 200 active.
- **A2 — journal weekly, pinned to the anchor weekday.** Entries on days
  1, 8, 15, … (~150 words, every entry qualifies). Journal days: 53 (Y0) / 52
  (Y1) = 105 total.
- **A3 — no clock slots pinned.** I-4 Same Time Every Time, II-9 Like Clockwork,
  V-3 Same Hour Same Scale, IV-5 No Deviation, IX-5 Ghost in the Machine NEVER
  fire (the robot family needs a 30-min slot / weekday-set / ±3% target; the
  hoarder taps habits at random hours). II-9's absence also kills the Ghost
  capstone.
- **A4 — no other domains, no vacations, no phases, no coach, no goals, no
  PRs.** III/IV/V/VI/VII/IX families dead; E8 tendrils closed; E11/E12 closed;
  I-14, I-16/17, III-21..28, IV-13/14, V-8/9, VII-11/12, VIII-3..20, II-14/15
  unreachable in-window.
- **A5 — no rest events, no gaps, no dormancy.** II-10 Honest Rest, II-11
  Rebuilt, I-11, III-24, E9 never fire (the hoarder never misses, never falls).
- **A6 — 365-day years** (no leap day in the span; trophy windows are
  dayKey-driven and leap-immune).
- **A7 — II-8 Juggling Act counted once per non-overlapping 21-day window** (the
  G5 anti-double-fire intent; every day qualifies, so a literal "span ending on
  each day" scan would fire ~daily — the reading is ambiguous and is itself a
  faucet-amplitude finding, V-2e).
- **A8 — the same-day boundary (02-V6).** Earns whose window closes ON the
  maturity day (d730) — month 23's II-6 batch, II-5 (yr2), II-12 (yr2), VIII-2 —
  count into the bank as of d730 (pre-maturity where applicable).
- **A9 — the first bloom fires AT maturity even in winter** (D092(2) is the
  literal first-bloom contract; D095 amends rule 3's on-earn, not rule 2) — the
  boundary is unpinned and flagged (V-5).

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 3 drifts/gaps)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | habits 1 completion (×200) · journal ≥40 words, non-imported |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ | Habits 30/30 → 12 twigs/yr at the C5 cap; **journal 4.3/30 → 0 twigs** |
| A4 | stage-year ≥200 active days | ✓ | 365/yr → 1 stage-year/yr |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | habits 365 + journal 53 pass; **5 of 7 absent → NO ring ever (honest — V-9)** |
| B1 | first in-window event | ✓ | Jan 1 Y0, day 1 |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | Day 15 (30/30 habit days) — *insensitive to the 15-vs-20 record drift (V-7)* |
| B3 | 1 stage-year | ✓ | Jan 1 Y1 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Jan 1 Y2 (habits 365 ≥ 90) — **maturity lands WINTER (the first-bloom clash, V-5)** |
| B5 | ≥10 stage-years | n/a | 2/10 by Y2 |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 60 of a **5,040-bud S/R/B/H bank** — the overflow is the story (V-3) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | Holds; **the queue is permanent and GROWING** (V-3) |
| C3 | ≥30 buds/branch → clusters | ✓ as written | **The cluster CAPACITY is unpinned — 200 buds = ? clusters + ? individuals is undefined (V-4)** |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ mechanically | Crown = II-4 (the first-earned Grove, d500); **200 identical earns — tiebreak unpinned (V-8)** |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | ✓ | Habit branch 12/yr exactly; journal 0 |
| C7 | bank counter top-3 + count | ✓ | "4600 Perfect Month · 400 Full Year · 400 One Trip (+641 more)" |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | d730 / d1095 (out) / d1826 (out) |
| E1–E14 | signatures | ✓ read | See §7 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | Jan 1 anchor: maturity + the first bloom land WINTER — run 05's clash, at maximum amplitude (V-5) |
| F4 | RESOURCE = avg events/active day ÷ 20 | **SATURATED** | 200.14 ÷ 20 = **10.0 → clamped 1.0 from day 1** (V-1) |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ | 1.0 (7/7 every week, stddev 0) |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ | **0.19** — the most single-focus axis in the series (habits 730 · journal 105 · five zeros) |
| F7 | TENURE = stage-years/10 | ✓ | 0.0 → 0.2 |
| F8 | replay ~2s/yr | ✓ | 2-yr time-lapse ≈ 4s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records
≥20 (02-V1, 01-V12, 03-V6, 05-V10, 07-V1, 09-V5 — the **7th recurrence**).
Insensitive here (30/30), but it must freeze.

**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; no trophy in any family is a 365-day streak (II-4 The Long Haul is
**500-day**; II-12 is an anniversary touch) — 01-V8 / 02-V3 / 03-V4 / 09-V4, the
**5th recurrence**. Here it is load-bearing in reverse: the hoarder's habits hold
**730-day streaks** — the intent condition is met under any reading, but the
register's cited referent does not exist (V-6).

**Register gap 3 (C3 cluster capacity unpinned — the headline of this run):**
C3 pins the threshold (≥30) and the honesty rule ("individual buds ≤29; clusters
reveal on zoom; the count stays honest") but NOT the cluster capacity — how many
buds per cluster, how many clusters for 200, and whether the flower-BANK
(5,040+ buds) clusters the same way. D099 N-4b says clusters form for "buds
beyond the branch's derived capacity" — the capacity is never defined. V-4.

---

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | Day 1 (Jan 1 Y0) | first in-window event (a habit completion — register B1 / D090 A) |
| B2 SEEDLING→SAPLING | Day 15 (Jan 15 Y0) | register B2: ≥15 in-window days in any 30-day window, any-domain-mixed (30/30 habit days). (D115(1)'s record text says ≥20 — d20, insensitive, V-7) |
| B3 SAPLING→POLE | Jan 1 Y1 | 1st stage-year closes (365/365 in-window ≥ A4's 200) |
| B4 POLE→MATURE | **Jan 1 Y2 (d730)** | ≥2 stage-years AND habits ≥90 in-window days in the best anchored year (365) → **MATURITY. D1 floor (2 stage-years) met same day.** **Maturity lands JAN 1 = WINTER** — the D094 first-bloom ceremony collides with D095's "nothing blooms in winter" (V-5). Run 05's winter-maturity clash, now with a 5,040-bud bank behind it |
| B5 MATURE→OLD-GROWTH | ≥10 stage-years | not reached in 2 years |

**The maturity headline:** the habit-hoarder — 730 days, 146,105 events, 200
habits — **matures at year 2 on schedule** (B4's days-based depth bar: habits 365
≥ 90). No gate ever blocks on a twig count (D115(1)); no ring ever brands
(canonical-7, V-9); the tree is MATURE with a zero-ring trunk and a bare
journal branch — the D115 decoupling at its most extreme, but now the maturity
moment carries a bank the economy cannot drain.

---

## 3. Checkpoint-by-checkpoint walk

### CHECKPOINT WEEK 4 — Jan 28 Y0 (day 28)

- **B1 tick (d1):** first habit completion (200 habits born, first journal
  entry) → SEED → SEEDLING. Germination ceremony (D094). The habit branch-bud
  is immediately the loudest organ on the stem — 200 habit-buds already form a
  cluster (C3 is true from day 1).
- **B2 tick (d15):** 30/30 in-window days in the Jan 1–30 window → SEEDLING →
  SAPLING. D115(3) M-2: the banked-content leaf-buds (Jan's journal entries —
  only 4) burst into leaf clusters at SAPLING "with the first twigs" — the
  journal branch's 4 leaves hang on a twig-less branch (run 09's V-2 shape, at
  low volume here).
- **Events:** 200 completions/day × 28 = 5,600 + 4 journal entries = 5,604.
  All in-window, all qualifying.
- **Earned today (buds):** II-1 Day One (S, d1) · I-1 Ink on the Page (S, d1) ·
  **II-2 One Week In (R) ×200 (d7 — all 200 habits cross their first 7-day
  streak the same day)** · II-7 Five Strong (B, d7 — ≥5 habits with streak ≥7
  simultaneously: all 200). Bank = **203 buds (2 S · 200 R · 1 B)**.
- **The bank's shape is already visible:** 200 of the first 203 buds are one
  trophy fired once per habit. The per-habit faucet is open from week 1.
- **Axes:** RESOURCE **1.0 (SATURATED — 200/day ÷ 20 ceiling)** · RHYTHM ~1.0 ·
  BALANCE forming (stable ~0.19 by the month's end) · TENURE 0.
- **Twigs:** habit branch **1** (Jan 28/30 ≥ 15) · journal 0. **Rings 0.**
- **Why-panel:** "SEEDLING→SAPLING · age 4 weeks · 203 buds — 200 of them One
  Week In across your 200 habits. Your habit branch is a bud garden that fills
  a bank before the first month ends; the register's cluster rule is already
  in force — zoom the habit branch to count them honestly."

### CHECKPOINT MONTH 3 — Apr 1 Y0 (day 91)

- **Spring starts Mar 1 Y0 (d60):** growing season open; everything earned in
  Jan–Feb (all 203) sits banked as pre-maturity buds (D092(1) — nothing blooms
  before maturity regardless of season).
- **Earned by d91:** **II-6 Perfect Month (B) ×600 (d31/d59/d90 — the month
  closes, all 200 habits complete every calendar day of Jan, Feb, Mar)** ·
  II-8 Juggling Act (B) ×4 (the d21/d42/d63/d84 window closes; every window
  qualifies, per A7). Bank = **807 buds (2 S · 200 R · 605 B)**.
- **Axes:** RESOURCE 1.0 (saturated) · RHYTHM 1.0 · BALANCE 0.19 · TENURE 0.
- **Twigs:** habit **3** (Jan/Feb/Mar 30/30) · journal **0**. **Rings 0.**
- **Why-panel:** "SAPLING · age 3 months · 807 buds. Six hundred of them are
  Perfect Months — your 200 habits complete every calendar day, every month, so
  the trophy re-fires 200× a month. The count is honest; the flood is real. The
  journal branch still has no twig — once a week is too thin."

### CHECKPOINT YEAR 1 — Jan 1 Y1 (day 365)

- **B3 tick:** stage-year 1 closes (365 active days ≥ 200) → SAPLING → POLE.
  Pole-rise ceremony (D094). C6 leaf-cluster granularity unlocks at POLE — the
  journal branch's 53 leaves become individually addressable (52/yr is under the
  leaf-cluster aggregation scale, so granularity is real, not cosmetic).
- **The II-6 faucet runs through the year:** months 1–12 × 200 = **2,400 Perfect
  Months** by d365. II-8 ×17 by d365 (A7).
- **Earned by d365:** II-3 A Hundred Days (H) **×200 (d100)** · II-13 Renaissance
  Life (H, d100 — the 5th distinct habit reaches 100 days; one-time) ·
  I-6 Half Century (R, d344 — the 50th journal entry) · I-12-B Same Question,
  New Answer (B, d365 — a second distinct year shares the Jan-1 entry) ·
  **II-5 Full Year, One Habit (Ring) ×200 (d365 — each habit's first anchored
  365-day window closes at ≥300 completion days)** · **II-12 One Trip Around the
  Sun (Ring) ×200 (d365±7 band — each habit still practiced ~a year later)**.
  Bank = **3,223 buds (2 S · 201 R · 2,419 B · 201 H · 400 Ring · 0 Grove)**.
- **Axes:** RESOURCE 1.0 (saturated) · RHYTHM 1.0 · BALANCE 0.19 · TENURE 0.1.
- **Twigs:** habit **12** (the C5 cap exactly) · journal **0**. **Rings 0** —
  A5's canonical-7 ring-year needs all 7 ≥ 40 days; 5 domains are absent
  (V-9). VIII-1 One Year In (Ring) never fires — it needs ≥3 domains present in
  9/12 months; the hoarder has 2 (honest miss).
- **Why-panel:** "POLE · age 1 · the habit branch is the tree — 12 twigs, a
  200-bud cluster, and a bank that passed 3,200 including 400 Ring-tier. Four
  hundred Coach-worthy earns this year alone. The trunk brands no ring — seven
  domains are the ring's price and you pay in two. The first bloom is one year
  away, and the bank is not going to fit in it."

### CHECKPOINT YEAR 2 — Jan 1 Y2 (day 730) — MATURITY + THE FIRST BLOOM, IN WINTER

- **B4 tick:** stage-year 2 closes AND habits 365 ≥ 90 → **POLE → MATURE**. D1
  floor met same day. **Maturity lands Jan 1 = WINTER.**
- **Earned by d730:** II-6 ×4,600 total (months 1–23, the month-23 batch closing
  ON d730 — same-day, per A8) · II-8 ×34 · **II-4 The Long Haul (Grove) ×200
  (d500 — every habit crosses a 500-day streak)** · II-5 ×400 (yr-2 window
  closes d730) · II-12 ×400 (yr-2 band d730±7) · **VIII-2 Two Years (Ring,
  d730 — activity in ≥75% of months: 24/24)** · I-12-B (d365).
  Bank = **6,041 buds (2 S · 201 R · 4,636 B · 201 H · 801 Ring · 200 Grove)** —
  **the biggest bank in the paper-run series, ~16× run 03's ~372** (V-2).
- **The FIRST BLOOM (D092(2) + D094 ceremony, 8–12s, skippable):**
  - The S/R/B/H bank at this instant = **5,040 buds** (H 201 · B 4,636 · R 201 ·
    S 2).
  - **C1/C2 check (the wave math):** ≤15 flowers/bloom event, ≤4 waves/season =
    60 flowers. **The first bloom bursts 60** (magnitude order per D099 N-4a:
    H 15 → B 45), **overflow 4,980 banks to successive waves + the next spring**.
    The bank counter reads ~4,980 pending the instant the ceremony ends.
  - **801 Ring buds** (II-5 ×400 · II-12 ×400 · VIII-2) → the next ANNUAL BLOOM
    (Mar 1 Y2 — 59 days later, out of the walk) per D092(4).
  - **200 Grove buds** (II-4 ×200) → the next annual bloom after maturity
    (Mar 1 Y2) as **THE TRANSFORMATION — the C4 CROWN** (the first-earned Grove;
    200 identical earns on one day, tiebreak unpinned — V-8). D115(5): the
    crown + manifested transformations persist through winter.
  - **Winter clash (V-5):** the first bloom is D092(2)'s designed stage ceremony
    (D094: "the biggest: buds burst family by family"), and it lands on Jan 1 —
    mid-winter, when D095 says nothing blooms. The 60 flowers that burst are the
    register's own contradiction made visible; the boundary must be pinned.
- **Adaptations at maturity (d730):**
  - **E4 cladodes OPENS** — streak-without-entries divergence = (730 − 105)/730 =
    **0.86 ≥ 0.6** · D1 d730 ✓ · SAPLING floor ✓. **The habit branch lives
    leafless — 200 buds bursting daily and no leaves to show for it — and the
    cladode character (flattened photosynthetic stems, a functional leafless
    branch) is the CORRECT botanical adaptation for this life.** Pending →
    manifests at the next annual bloom (Mar 1 Y2, D093).
  - **E6 thorns OPENS** — 730-day streaks exist on all 200 habits + tenure 0.2
    (2 stage-years) · D1 ✓ · SAPLING ✓. Pending → Mar 1 Y2. (Referent gap, V-6.)
  - **E7 spines opens d100** — II-3 A Hundred Days ×200 (subtle tier, no tenure
    gate, SAPLING floor ✓) — manifest when the condition sustains (D093): the
    habit branch has worn spines since d100.
  - All others closed (§7).
- **Axes:** RESOURCE **1.0 (SATURATED)** · RHYTHM **1.0** · BALANCE **0.19** ·
  TENURE **0.2**.
- **Why-panel:** "MATURE · age 2 · the first bloom burst 60 of your 5,040
  flowers — the rest wait in waves, and your habits keep minting them. The count
  is honest: 200 habits, every one completed every day. The habit branch grew
  thorns and spines and is going leafless — this is a tree of pure action with
  almost no reflection, and the cladodes (next spring) say so without shame.
  The trunk carries no ring; the crown — your first Grove, The Long Haul ×200 —
  transforms at the spring bloom. Your tree is a flower factory. The register
  built the factory; the register also gets to cap its output."

---

## 4. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20, clamped 0–1 | **1.0** (200.14 ÷ 20 = 10.0 → clamp) | **SATURATED from day 1.** The ceiling's calibration intent (a "rich life" ~0.5–0.7, D105 note 2) is dead above ~20 events/day; the axis can no longer distinguish "rich" from "absurd." Even the brief's own ~101/day reads 5× the ceiling → clamped. The axis's discriminator power collapses for every high-volume user (V-1) |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **1.0** (7/7 every week, stddev 0) | perfect — flat by construction |
| F6 BALANCE | Shannon evenness, canonical 7 (D104) | **0.19** (p = (730, 105, 0, 0, 0, 0, 0) → H = 0.378 → H/ln7) | the most single-focus profile in the series — the zero-inclusive canonical-7 reading (run 09's V-6), now at 2-of-7 |
| F7 TENURE | stage-years ÷ 10 | **0.2** | low |

**Stage ticks (B-group):** B1 day 1 · B2 day 15 (d20 under D115(1)'s record) ·
B3 Jan 1 Y1 · **B4 Jan 1 Y2 — MATURITY, IN WINTER** (V-5) · B5 at year 10.

**Twigs per domain (A3):**

| Domain | In-window days/30-day month | A3 bar (15/30) | Twigs in 2 years |
|---|---|---|---|
| Habits | 30/30 | 15 | **24** (12/yr — the C5 cap exactly, never over) |
| Journal | 4.3 (1/week) | 15 | **0** |
| Gym/Nutrition/Body/Media/Goals | 0 | 15 | 0 |

**Rings (A5, canonical 7):** habits 730 + journal 105 ≥ 40; **5 of 7 absent →
0 rings in 2 years.** VIII-11 Pith never fires; the trunk stays unbranded —
honest for the brand (V-9).

**Bank by checkpoint (cumulative fires):**

| Checkpoint | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| Week 4 (d28) | 2 | 200 | 1 | 0 | 0 | 0 | 203 |
| Month 3 (d91) | 2 | 200 | 605 | 0 | 0 | 0 | 807 |
| Year 1 (d365) | 2 | 201 | 2,419 | 201 | 400 | 0 | 3,223 |
| Year 2 (d730, MATURE) | 2 | 201 | 4,636 | 201 | 801 | 200 | **6,041** |

**The first-bloom burst:** 5,040 S/R/B/H buds → **60 flowers (4 waves × 15) —
C1 ✓ · C2 ✓ mechanically — but 4,980 overflow into successive waves and the
spring bank.** The reverse of run 09's 100%-drained bank: this ceremony shows
**1.2%** of the eligible bank. The queue is permanent and GROWING (the II-6
faucet adds 200/month while the economy drains 60/season) — V-3.

---

## 5. The bank — all 9 families by tier (conditions per scan-outputs/
02-achievements.md, verified verbatim)

| Family | S | R | B | H | Ring | Grove | Never (verified) |
|---|---|---|---|---|---|---|---|
| **I Long Conversation** | I-1 d1 | I-6 d344 | I-12-B d365 | — | — | — | I-2/I-3 (journal is weekly — max 1-day streak), I-4 (no slot), I-5 (52/yr ≪ 300), I-7/I-8 (500th/1,000th entry — ~yr 10), I-9 (15.6k words < 25k), I-10 (150-word entries), I-11 (no gaps), I-13 (**zero solitary days — every journal day co-occurs with 200 habits**), I-14 (no phases), I-15 (52 ≪ 146 days/yr), I-16/17 (need Full Orbit), I-12-H/G (yr 3/5) |
| **II Unbroken Chain** | II-1 d1 | II-2 **×200** d7 | II-7 d7 · II-6 **×4,600** (monthly) · II-8 ×34 | II-3 **×200** d100 · II-13 d100 | II-5 **×400** d365/d730 · II-12 **×400** d365/d730 | II-4 **×200** d500 | II-9 (no slot), II-10 (no rests), II-11 (never breaks), II-14/15 (yr 3/5) |
| **III Iron Ledger** | — | — | — | — | — | — | all (no gym, A4) |
| **IV Fuel Line** | — | — | — | — | — | — | all (no nutrition, A4) |
| **V Shape of Things** | — | — | — | — | — | — | all (no body, A4) |
| **VI Elsewhere** | — | — | — | — | — | — | all (no vacations, A4) |
| **VII Proof of Life** | — | — | — | — | — | — | all (no media, A4) |
| **VIII The Rings** | — | — | — | — | VIII-2 d730 | — | VIII-1 (needs ≥3 domains), VIII-5…10 (six/seven-domain bars), VIII-11…20 (no ring ever brands), VIII-3 (5 yr) |
| **IX Full Circle** | — | — | — | — | — | — | IX-1 (needs 4 domains/day — 2 present), IX-2 (6 domains), IX-3 (media/workouts), IX-4 (PRs), IX-5 (II-9 + III-22 + IV-5) |
| **TOTAL** | **2** | **201** | **4,636** | **201** | **801** | **200** | **6,041** |

**The repeatable share (economy):** II-6 ×4,600 · II-5 ×400 · II-12 ×400 ·
II-2 ×200 · II-3 ×200 · II-4 ×200 · II-8 ×34 = **6,034 of 6,041 fires
(~99.9%) are per-habit re-fires.** The single largest faucet (II-6 Perfect
Month, ×4,600) is **76% of the entire bank.** Run 03's flood (~92% repeatable,
~372 fires) is the same mechanism at 6 habits; this run is the register's
per-habit cadence evaluated at 200 habits — the repeatable faucet explosion the
brief predicted, and the biggest bank in the series by ~16× (V-2).

**The crown (C4):** the first-earned Grove = II-4 (d500, all 200 same-day). One
becomes the CROWN transformation at the Mar 1 Y2 annual bloom; the other 199 get
large blooms. The 200-way tie needs a deterministic tiebreak (V-8).

---

## 6. The blooms (D092/D095 — every date pinned to the 02-V6 boundary rule)

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | **Jan 1 Y2 (d730) — WINTER** | 5,040 S/R/B/H buds → **60 flowers (4 waves × 15; H 15 → B 45 — magnitude order per D099 N-4a)** · overflow **4,980** → successive waves + the spring bank · Ring 801 + Grove 200 stay banked (D092(4)/(5)) | C1 ✓ · C2 ✓ · **winter-maturity clash (run 05 V1, at maximum amplitude — V-5)** |
| Annual bloom Y2 (out of walk) | Mar 1 Y2 | Ring 801 · **II-4 ×200 → THE CROWN transformation (C4, D115(5) winter persistence)** · the spring flush (winter bank) · **E4 cladodes + E6 thorns manifest (D093)** | C4 cap ✓ (1 legend) · the 199 non-crown Groves → large blooms, in-wave (the budget again) |

Winter earns (Y0: II-2 d7, II-7 d7, I-1 d1; Y1: II-3 d100, II-13 d100, II-6
monthly, I-6 d344, I-12-B d365, II-4 d500; Y2: II-5/II-12 yr-2, VIII-2 d730) all
bank as flower-buds (D092(1) pre-maturity; D095 winter) → the first bloom at
maturity (60 of them) + the spring flush (the rest). Post-maturity earns (month
24's II-6 ×200 at d760, II-5/II-12 yr-3 in the next window) are out of the walk,
winter → bank to spring per D095. The bloom economy at this scale is the run's
headline problem: **the queue drains at 60/season against a 200/month refill —
it is un-drainable by construction** (V-3).

---

## 7. The adaptations (E1–E14) — final state at Y2

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.2 · **resource 1.0** | **Closed on both legs** — and resource 1.0 means caudex is closed FOREVER at any tenure (V-1) |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | **balance 0.19 < 0.7** · resource 1.0 ✓ | **Closed on the balance leg** — the resource leg passes for once, and it does no good (V-1) |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | **resource 1.0** | **Closed — the anti-phyllode tree**: maximum volume, zero sparseness (V-1) |
| E4 cladodes | divergence ≥0.6 · D1 + SAPLING | divergence **0.86** (730 habit days vs 105 journal days) · D1 d730 ✓ | **OPENS at maturity → PENDING → Mar 1 Y2.** The leafless-action life is EXACTLY the cladode signature; the flattened-stem adaptation is the botanically correct mark for a branch that bursts buds but never grows leaves (V-10) |
| E5 storage leaves | media share ≥0.5 | 0 media / 0 | Closed (no media at all) |
| E6 thorns | "the 365-day streak achievement" + tenure ≥2 · D1 + SAPLING | 730-day streaks on all 200 habits · tenure 2 ✓ | **OPENS at maturity → PENDING → Mar 1 Y2.** Referent gap stands (V-6) |
| E7 spines | the 100-day streak trophy (II-3) · SAPLING | II-3 ×200 d100 ✓ | **OPENS d100** (subtle, no tenure gate — the habit branch wears spines from the 100th day) |
| E8 tendrils | live long-horizon goal | no goals (A4) | Closed |
| E9 reaction wood + epicormic | a revival — universal | never dormant | Closed — honest: the tree never falls |
| E10 contractile | 3 consecutive stage-years with RISING active days | 365 → 365 — flat | Structurally unreachable at the ceiling (03-V5) + only 2 stage-years |
| E11 mycorrhizal | coachEngagement owner ≥ threshold | 0 check-ins | Closed |
| E12 stolons | L-10 insight ≥3 monthly windows | not in the pattern | Closed/effectively-never (02-V7) |
| E13 bracts | no gate (ceremony) | no PRs (no F-03 flourish) | Display-only ✓ |
| E14 bud scales | no gate (dormant-habit state) | **all 200 habits active daily** | None — nothing dormant to wrap (A1's sensitivity: ~100 dormant habits would fire it) |

**Structural marks in this life: thorns + spines + cladodes (all on the habit
branch) + the II-4 crown transformation.** Three of the rarest structural
adaptations plus the crown — but they all grow on ONE branch while the journal
branch stays a bare twig-less stick with 104 leaves. The coherence envelope
holds: E1/E2/E3 are all resource-gated and the hoarder's resource (1.0) slams
each of them differently — E3 closed by volume, E1 closed by volume+tenure, E2
closed by balance. The D112 identity filter: the syconium/cross-domain identity
needs balance ≥0.6 → 0.19 rejects it — the II-family catkins (habits) are the
identity, and no IX flower ever fires anyway. Consistent.

---

## 8. Caps, budgets, economy

- **C1 (≤15 flowers/bloom event):** first bloom 15/wave ✓ mechanically — the
  first bloom shows **60 of 5,040** (1.2%).
- **C2 (≤4 waves/season, 60/season; overflow → next spring):** holds; the
  consequence is the **permanent, growing queue** (4,980 overflow + a 200/month
  refill against a 60/season drain) — V-3.
- **C3 (≥30 buds/branch → clusters; individuals ≤29; count honest):** the habit
  branch crosses the threshold on day 1 (200 buds). **The clustering math — the
  run's test case.** Under a proposed bounded-cluster capacity (mirroring the
  register's own threshold — **capacity 30/bud-cluster**, dev-tunable per D105):
  **200 = 29 individual buds + 171 clustered = 6 clusters (30, 30, 30, 30, 30,
  21).** Visible surfaces at LOD-1: 35. On zoom: all 200, honestly (29 + 6×30 =
  209? No — 29 + 5×30 + 21 = 200 ✓). Under the alternative single-mass model
  ("buds beyond capacity aggregate like leaf clusters"): 29 individual + 1
  cluster of 171. **The register does not say which — the cluster CAPACITY is
  unpinned, and the flower-BANK (5,040 buds) has no cluster rule at all** — V-4.
- **C4 (1 legend/bloom + 1 crown):** the Mar 1 Y2 annual bloom hosts the crown
  (II-4) + 199 II-4 large blooms (in-wave — the 60/season budget applies even
  to Groves; they too queue) + the 801 Ring. C4's cap itself is fine; the
  in-budget reality is the queue (V-3, V-8).
- **C5 (≤12 twigs/branch/yr + 3-yr retention):** habit branch 12/yr exactly —
  at the cap, never over; 24 render / 0 merged at Y2 ✓. Journal 0.
- **C6 leaf-cluster granularity (POLE):** unlocks at POLE — the journal branch's
  105 leaves become per-entry addressable ✓.
- **C7 bank counter (top-3 by tier + count):** "**4,600 Perfect Month · 400 Full
  Year, One Habit · 400 One Trip Around the Sun (+641 more)**" ✓ — the counter
  survives the flood; the WHY-PANEL and the bank surface are what must carry the
  honesty (V-10).
- **D1/D2/D3 floors:** D1 d730 ✓ · D2 (3 stage-years) Y3 · D3 (5) Y5 — out.
- **F4 RESOURCE ceiling:** **saturated — V-1** (the calibration this run exists
  to force, per D105 note 2).
- **Economy:** 6,041 fires, ~99.9% per-habit re-fires, 1.2% of the pre-maturity
  bank shown at the first bloom, an un-drainable queue, and 1,001 Ring/Grove
  earns flooding the Coach (V-2/V-3/V-11). The tree-state cache (`bankBuds` as a
  flat `[{achievementId}]` list, D107) holds 6,041 entries — 4,600 of them the
  same achievementId with per-habit attribution — an unbounded cache + render
  entry (V-4).

---

## 9. Violations & tuning proposals

**V-1 [MAJOR — the F4 saturation, the calibration the register deferred to this
step] RESOURCE clamps at 1.0 from day 1 for any high-volume user — 200
events/day ÷ 20 = 10.0× the ceiling.** The register's own D105 note 2 admitted
the ceiling "reads high" and deferred calibration to the paper run — this run is
the extreme case, and the axis is not merely high: it is **flattened**. The
hoarder's resource is 1.0; run 03's balanced rich life is 0.6; a journaler is
0.05 — the axis can distinguish "sparse" from "rich" but collapses everything
above ~20 events/day into a single value. The adaptation gates that read
resource become structurally locked: **E3 phyllodes (≤0.4) is impossible for any
high-volume user; E1 caudex (≤0.6) is impossible forever at any tenure; E2's
resource leg (≥0.6) is trivially satisfied yet useless when balance fails.** The
axis loses its discriminator power exactly where the hoarder lives. *Tuning
(dev-tunable per D105, pick one or combine):* (a) **per-input-class normalization
— count entry-CLASSES per day, not raw events: 2 classes/day (completions +
content) ÷ 7 = 0.29**, which restores the axis's semantic ("a rich life vs a
sparse one") and un-locks E1/E3 for hoarder-like lives; (b) a log scale
(ln(1+n)/ln(21)) so 200/day reads ~0.9 instead of 1.0 and 20/day reads ~0.6; (c)
raise the ceiling materially (~200) and document that saturation MEANS
"maximum lush volume." Recommend (a) — it matches the 7-class input framework
(§2.1) the tree already locked.

**V-2 [MAJOR — the per-habit faucet flood] The repeatable economy at 200 habits
is 6,034 per-habit re-fires (~99.9% of the bank), led by II-6 Perfect Month
×4,600 (76%).** The scan's re-fire map ("One Week In / A Hundred Days / Like
Clockwork / One Trip Around the Sun are strictly once per habit") was written for
a handful of habits and has **no cap on the number of habits** — every per-habit
trophy multiplies by the roster size. This is the farming vector the scan's own
"trivial habits" note warns about: a user can create 200 trivial habits and mint
4,600 Branch + 400 Ring + 200 Grove + 200 Heartwood flowers in two years, every
one literally real. Trophies grant zero XP (locked), so the XP economy survives;
the FLOWER economy does not. *Tuning (dev-tunable):* (a) **a per-branch flower
budget** — the C3/D099 N-4b cluster mechanism extends to the flower-bank: "N
Perfect Months in this cluster" is one countable flower-cluster, not N flowers
(keeps the count honest, kills the visual flood); (b) **a per-habit-trophy
count cap** — II-6/II-2/II-3/II-5/II-12/II-4 fire for at most the top-N habits
(N dev-tunable, e.g., 10) per season, the rest banking as cluster counts;
(c) a roster-size guard on the per-habit cadence. Recommend (a) + (b): the
cluster surface keeps the truth, the cap keeps the economy. *(Sub-item 2e:*
II-8 Juggling Act's "span ending on each day" scan with all days qualifying is
readable as ~daily fires (A7 counts 34; a literal scan counts ~700) — the
sliding-window cadence needs a pin either way.)

**V-3 [MAJOR — the bloom economy at scale] The first bloom shows 60 of 5,040
buds (1.2%), and the queue is permanent and GROWING: the II-6 faucet refills 200/
month against a 60/season drain.** C1/C2's 60-flower season budget (D099 N-4a)
was designed to pace a normal bank; against the hoarder it manufactures an
un-drainable backlog — the bank counter will read 5,000+ forever, the C7 "+N
more" becomes the whole story, and "nothing unrewarded" (D092) is technically
honored while visually everything waits. Run 01/03's permanent-queue finding, at
maximum amplitude. *Tuning:* (a) apply V-2's per-habit caps so the bank stops
outgrowing the budget; (b) raise the seasonal wave budget for clustered floods
(dev-tunable); (c) let a flower-cluster (V-2a) count as ONE wave unit so 4,600
Perfect Months drain as 4,600-count clusters rather than 4,600 individual
flowers. Recommend (a) + (c) together.

**V-4 [MAJOR — the C3 cluster math, the run's test case] The register pins the
cluster THRESHOLD (≥30) and the honesty rule, but not the cluster CAPACITY —
"200 buds = how many clusters + how many individuals?" is undefined, and the
flower-BANK has no cluster rule at all.** Walked results: under a capacity-30
model, 200 habit-buds = **29 individual + 6 clusters (30,30,30,30,30,21)** —
35 visible surfaces, 200 on zoom, count honest. Under the single-mass model, 29
+ 1 cluster of 171. The register must choose. Separately, **D107's tree-state
model has no cluster field**: `habits [{habitId, state}]` is a flat 200-row
list, `bankBuds [{achievementId}]` is a flat 6,041-row list (4,600 of one ID,
each with per-habit attribution per the re-fire map) — the final-adversarial
audit flagged the C3 gap in D107 (finding 89–90); this run proves it bites at
the render and cache level. *Tuning:* (a) pin the cluster capacity in the
register (dev-tunable; recommend ~30, mirroring the threshold, with multi-level
cluster-of-clusters aggregation above ~900); (b) extend the cluster surface to
the flower-bank (per-achievementId aggregates — "II-6 ×4,600" as one countable
flower-cluster); (c) amend D107: `habits [{habitId, state, cluster?}]` + the
bank as `bankBuds [{achievementId, count}]` aggregates (the honesty lives in the
zoom surface, not the flat list).

**V-5 [MAJOR — the winter-maturity clash, run 05 V1 at maximum amplitude] The
Jan 1 anchor puts maturity AND the first bloom on Jan 1 Y2 — mid-winter, when
D095 says nothing blooms.** D092(2) fires the first bloom at maturity; D095 says
winter earns bank to spring. The hoarder is the first archetype where the
5,040-bud bank sits behind both rules at once: 60 flowers "burst" in winter while
the register simultaneously says winter flowers don't bloom. *Tuning (pin the
boundary):* (a) the first bloom is a **winter-exempt stage ceremony** (D092(2) +
D094 literal; the D095 amendment touches rule 3's on-earn, not rule 2) — walk as
A9; or (b) a winter maturity defers the first bloom to the spring flush (Mar 1),
in which case maturity's "biggest moment" is delayed ~2 months. Recommend (a)
with the seasonal wave budget applying to the burst — the ceremony is the D094
design intent; the economy is the wave math.

**V-6 [MINOR — register text, 5th recurrence] E6's referent still does not
exist.** "The 365-day streak achievement" is not a trophy in any family (II-4 is
500-day). Here it is not text-only: the hoarder holds 730-day streaks and thorns
OPEN under the intent reading — but the register text must cite II-4 explicitly
(and the docs-pass amendment should consider adding a 365-day streak trophy as
the armor's natural referent, per run-01 V8 / run-02 V3 / run-03 V4).

**V-7 [MINOR — record drift, 7th recurrence] B2 register 15 vs D115(1) 20.**
Insensitive here (30/30) — but six prior runs have now flagged it; the record
must be amended to the register's value and reading before the docs pass
(09-V5's amendment text).

**V-8 [MINOR — C4 tiebreak, run-01 V10 recurrence] 200 II-4 Groves fire the same
day (d500); the "first/rarest Grove" crown needs a deterministic tiebreak.**
The crown is the first-earned Grove — all 200 are first-earned simultaneously.
The engine contract must pick (e.g., the lowest habitId, or the highest streak,
or "the first" by log order) and the why-panel must name the crown's habit.

**V-9 [NOTE — the canonical-7 ring price] The hoarder's trunk never brands a
ring — 2 of 7 domains present, honest.** VIII-1 One Year In (needs ≥3 domains)
also never fires despite 365 days of flawless presence. Not a violation (the
ring IS the seven-domain brand, D090 C / D101 r1) — but the why-panel copy
("seven domains are the ring's price and you pay in two") should be standardized
so a MATURE, ringless, flower-factory tree doesn't read as failure.

**V-10 [NOTE — the beauty question, this walk's headline] Is the hoarder's tree
a beautiful honest reflection or a garish monstrosity? The register as written
renders a garish monstrosity — and that is the register's fault, not the life's.**
Every one of the 6,041 fires is real, derived, in-window, same-day — the tree is
HONEST. But the register's own D088 promise ("the most consistent users get the
most beautiful trees") fails in the RENDER: 5,040 flower-buds, 200 clustered
habit-buds, 24 twigs, and a saturated resource axis on one branch is noise, not
beauty. The fix is the surfaces already half-locked: C3 clusters (V-4), the C7
countable bank (V-3), the wave economy (V-3), and the why-panel narration
("a flower factory — the count is honest"). With those, the tree is beautiful in
a different register: a massive, leafless, armored habit branch (spines since
d100, thorns + cladodes pending) carrying a crown, against a thin journal branch
— the honest portrait of a life of pure action. Without them, it is confetti.

**V-11 [NOTE — the Coach floods] 1,001 Ring/Grove earns in 2 years (801 Ring +
200 Grove) → up to 1,001 Coach appreciation lines (one per fire, D092(2)/E12),
~400 on a single day (II-5 + II-12 yr-1) and 200 on d500.** "One sincere derived
line; never repeat congratulations" breaks at scale — the Coach's log becomes a
wall of near-identical per-habit congratulations. *Tuning:* aggregate per-habit
floods into one derived line ("200 habits completed their year — Full Year One
Habit ×200"), or cap Coach lines per day (dev-tunable) with the bank counter
carrying the rest.

---

## 10. Verdict

**The C3 / D099 N-4b test case is PROVEN — the clustering surface is
indispensable at scale, and the register's per-habit cadence is the run's
structural villain.** The hoarder matures on schedule (B4 days-based: habits 365
≥ 90), hits every stage tick, and produces **6,041 real, dated, honest trophy
fires in 730 days — ~16× the previous largest bank in the series** — of which
~99.9% are per-habit re-fires led by II-6 Perfect Month ×4,600. The tree is
honest in every organ: saturated resource (the register's ceiling, now visibly
broken), balance 0.19 (a 2-of-7 life), a zero-ring trunk, a leafless armored
habit branch (spines d100, thorns + cladodes at the spring bloom), a bare
journal branch, and the first Grove (II-4 ×200, d500) as the crown. No boundary
violation anywhere: every event real, same-day, in-window, non-imported (D100),
the anchor frozen at the first in-window event (D102), every fire dated (D092).

**What fails is the economy's ability to carry a 200-habit life, and it fails at
three points, all flagged:** (1) **F4 saturation** (V-1 — the ÷20 ceiling
flattens every high-volume user to 1.0 and locks E1/E3 shut by volume; per-class
normalization restores the axis's meaning); (2) **the per-habit faucet** (V-2 —
6,034 re-fires with no cap on roster size; the C3 cluster surface extended to
the flower-bank + a per-habit cap bounds it); (3) **the bloom queue** (V-3 — 60/
season against a 200/month refill is un-drainable; clustered waves fix the
render and the backlog). Plus the C3 cluster math itself (V-4 — the unpinned
cluster capacity and the absent D107 representation), the winter-maturity clash
(V-5), and the standing register fixes (V-6 E6 referent, V-7 the B2 drift, V-8
the crown tiebreak).

**Run verdict: CONDITIONAL PASS — the register's botany and stage machinery
survive the most extreme life the scan can construct (the gates, the axes, the
adaptation signatures all hold and read coherently), but the register's ECONOMY
was never built for a user who outruns the F4 ceiling, the per-habit cadence,
and the C2 budget simultaneously.** The hoarder's tree is an honest reflection
of a real (if trivial) life; whether it renders as a garish monstrosity or a
clustered, countable, leafless flower-factory with a crown is decided by V-1,
V-2, V-3, and V-4 — the four tuning proposals that must land in the dev tools
(D105) and this archetype be re-run before the numbers freeze. The question for
the tuning pass is not whether the hoarder's life is real (it is); it is whether
the tree is allowed to say "200 habits" honestly without drowning in its own
flowers.