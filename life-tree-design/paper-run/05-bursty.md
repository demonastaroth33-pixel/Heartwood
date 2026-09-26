# PAPER ARCHETYPE RUN 05 — "BURSTY" (the 5-year seasonal maximizer)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES
§6.4 — design-time simulation, no code). **Register read:** SCHEMA.md §2.4
(the locked threshold register, groups A–F, verified verbatim for this
run) + Artifact 1 (canonical domains) + Artifact 3 (trigger-correlation) +
D090–D115 records in TEMP-PLANNING.md. **Trophy conditions verified
against:** the raw scan (scan-outputs/02-achievements.md, verbatim rows) +
ACHIEVEMENT-SCAN.md + runs 01 (gym-heavy, V1–V12), 02 (journal-only,
V1–V10), 03 (balanced, V-1–V-8), 04 (decade-consistent, V-1–V-8). **Notes
carried in from runs 01–04:** pin the first bloom to the spring flush
(01-V3); the F4 ceiling under calibration (01-V4); the same-day boundary
(02-V6); the E6 referent missing (01-V8/03-V-4).

> **Integrity note (05-00):** this file is the run's second draft. The
> first draft (written earlier today) was re-verified line-by-line
> against the register, D090–D115, and the raw trophy scan. Every number
> in THIS draft has been recomputed by hand; where the first draft's
> arithmetic or trophy reading disagreed with the sources, the corrected
> reading is used and the correction is flagged (05-C1 … 05-C9 in §7).
> No correction changes the run's verdicts — the walls, the no-ring
> outcome, and the three big violations stand; the corrections tighten
> the bank, fix six dates, and add one previously-missed trophy family.

---

## 0. The synthetic user

A 5-year user with an extreme rhythm: **3 INTENSE months/year (Jan 1 –
Mar 31: journal every day, gym 4×/week, 3 meals logged/day, all habits
daily) then 9 QUIET months (Apr 1 – Dec 31: exactly 1 journal entry/week —
never zero — nothing else).** The cycle repeats yearly, in-window, same-day.
Birth anchor = **Jan 1 Y1** (the first in-window event — the first journal
entry — frozen per D090 B / D100(5) / D102). Walk = day 1 … day 1825
(Dec 31 Y5; uniform 365-day years — leap years shift burst lengths by one
day and the stage-year closes by ~1 day, immaterial at this granularity),
checkpoints at Month 3 (Mar 31 Y1, the burst's end) · Month 6 (Jun 30 Y1,
mid-quiet) · Year 1 (d365) · Year 2 (d730) · Year 3 (d1095) · Year 5
(d1825).

| Domain | Burst (Jan 1–Mar 31, 90 days) | Quiet (Apr 1–Dec 31, 275 days) | In-window days/yr | A2 qualifying |
|---|---|---|---|---|
| Journal (`journal.created`, ~80 words) | daily (90) | 1/wk, Mondays (39) | **129** | ≥40 words, non-imported ✓ |
| Habits (`habit.completed` — 3 habits: hydration, meditation, reading) | daily, all 3 (90) | none | **90** | 1 completion ✓ |
| Gym (`workout.completed`, Tue/Thu/Sat/Sun, 4 real sets) | 4/wk (52) | none | **52** | ≥1 real logged set ✓ |
| Nutrition (`nutrition.logged` — 3 meals) | daily (90) | none | **90** | ≥1 real food-log ✓ |
| Body / Media / Goals | none | none | 0 | — |
| Periods/vacation/rest flags | **none ever** — the quiet stretch is NOT protected absence | 0 | — |

**Assumption set (stated, then applied — every count in this run is
derivable from these; all are marked [A#] wherever they feed a number):**

- **A1 — PR model.** 4 sessions/wk for 13 weeks, then a 9-month layoff.
  Year-1 (novice) → ~40 PRs; each later burst re-establishes ~24 PRs
  after detraining (est1RM drops ~10–20% over 9 months off, so the
  first ~5–7 weeks of each burst re-cross the old records), with PRs
  clustering early in the burst. Lifetime by Y5 ≈ 136 PRs. Gates
  III-3 (per-PR faucet), III-4/5/6/7, III-8, III-9/10/11, IX-4.
- **A2 — session tonnage.** ~2,000 kg/session Y1 (novice lifts), ~2,800 kg
  later → R44 (100k kg) ≈ d87 (year 1), R45 (500k) ≈ d1195 (Mar 9 Y4),
  R46 (1M) ≈ year 7.2, R47 outside any horizon. III-20 Heaviest Session:
  ~25 record days Y1, ~10 per later burst ≈ 65 by Y5.
- **A3 — habit slot.** All 3 habits at a fixed 07:00 slot during bursts →
  II-9 Like Clockwork fires per habit per burst (90-day run in one slot).
  *Sensitivity:* if the slot drifts, II-9 never fires (~15 fires lost).
  Also: the 9-month layoff detrains each lift below the III-18 Novice
  bar, so Novice re-fires per lift per burst (×20 by Y5).
- **A4 — no fixed journal hour.** I-4 Same Time Every Time (60 days ±30
  min) fires per burst under the natural reading (a daily morning ritual);
  the alternative (no pinned hour) drops it (≈5 fires). Conservatively
  pinned ON (the archetype's burst IS a ritual).
- **A5 — no phases, no weigh-ins, no media, no goals.** The user never
  opens the body/media/goal domains, never logs a vacation/rest flag,
  never creates a phase. The quiet stretch is *silence*, not a logged
  period.
- **A6 — no pinned journal prompts** → I-12 Same Question New Answer does
  NOT need a prompt: it reads `sameMonthDay` across distinct years
  (verified, scan:117) — and the recurring Jan–Mar burst makes EVERY
  burst month-day recur annually. **I-12 fires ×3 (Branch d366, Heartwood
  d731, Grove d1461)** — see 05-C2. I-15 Bookended NEVER fires: its
  ≥146-distinct-day floor (scan:120) is unreachable at 129/yr — the
  first draft's "Dec-31-is-a-Monday fluke" reasoning was wrong (05-C3).

**The stage-year reading (pinned — the register is ambiguous, see 05-V2):**
A4 says "≥200 active days in the anchored 365-day window"; D090's
calibration note ("the every-other-day archetype matures — A4 is
reachable-but-slow, ~13.2 months per stage-year") REFUTES the
strict-windowed reading — a windowed reader would never close a
stage-year for ANY sub-200-day user (183 < 200 every window → stuck
SAPLING forever → D090's note would be nonsense). Therefore:
**stage-years accrue from cumulative qualifying active days, 200 per
stage-year** (13.11 months = 200/183 ≈ the register's 13.2). Under this
reading the bursty user (129 active days/yr) accrues at
200/129 = **1.55 calendar-years per stage-year** — and because accrual is
lumpy (bursts), the individual closes land in bursts: SY1 d436, SY2
d1108, SY3 d1544 (05-C1 corrects the first draft's d1103/d1479). The
strict-windowed alternative is the "never matures" dead end (05-V2).

**Key derived quantities (exact per the locks):**

- Active days/yr = 129 (every active day is a journal day; gym/nutrition/
  habits days are a subset of the burst). **129 < 200 → 0.65 stage-years/yr.**
- Cumulative active days: end Y1 129 · Y2 258 · Y3 387 · Y4 516 · Y5 645.
  Stage-year 1 closes d436 (Mar 12 Y2) · stage-year 2 d1108 (Jan 13 Y4) ·
  stage-year 3 d1544 (Mar 25 Y5) · stage-year 5 (D3, caudex floor)
  ≈ d2653 (Apr 7 Y8, year 7.3).
- Any-30-day mixed window (Jan 1–30 Y1): journal 30/30 → **B2 ticks
  Jan 15** (register 15) or **Jan 20** (D115(1)'s 20) — the first burst,
  as the task predicted.
- Gym days per burst month: 16–18 ≥ 15 → **3 gym twigs/yr** (the
  3×/week archetype's eternal miss, 01-V2, is NOT this user's problem).
- Per-domain ring days (A5 bar 40): journal 129 ✓ · habits 90 ✓ · gym 52 ✓ ·
  nutrition 90 ✓ · body/media/goals 0 ✗ → **4 of 7 — a ring-year can never
  close in this life** (computed in §3; verified against D090 C / D101(1) /
  D104 / D114(3): rings are a brand, never the clock — this user matures,
  blooms, and grows old ringless).
- Max consecutive-day streak in ANY domain: **90** (the burst length —
  every streak dies on April 1). The 100-day wall (II-3, E7), the 500-day
  wall (II-4), and every 26-week chain are structurally dead for this
  archetype (05-V4).

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 3 drifts)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | 80-word journal / 1 real set / 1 real meal / 1 completion |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ | Burst months: journal 31/28/31, habits 31/28/31, nutrition 31/28/31, gym 16–18 → **3 twigs/yr/domain, honest**; quiet months: 4–5 journal days < 15 → no twig |
| A4 | stage-year ≥200 active days | ✓ as written | **Wording ambiguous (windowed vs cumulative) — 05-V2**; cumulative reading: 129/yr → 1 stage-year per 1.55 yr |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | 4 of 7 at ≥40 → **no ring ever (05-V8)** |
| B1 | first in-window event | ✓ | Day 1 (first journal entry, Jan 1) |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | Day 15 (journal alone) / day 20 under D115(1) — 05-V10 |
| B3 | 1 stage-year | ✓ (cumulative) | Day 436 — the first stage-year closes in 1.19 yr; the steady pace is 1.55 yr (05-V1/V2) |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Day 1108 — journal's best anchored year = 129 ≥ 90 ✓ (gym's best YEAR = 52 < 90 — the task's "48 × 2–3 = 96+" arithmetic was wrong; the ≥90 domain is journal) — **maturity mid-JANUARY, in winter (05-V1)**. Note: D114(2)'s superseded twig-version of this gate (≥6 twigs on one branch) would dead-lock this user (3 twigs/yr/domain forever) — D115(1)'s days-based fix is what lets him mature |
| B5 | ≥10 stage-years | n/a | ≈ 15.5 years — far off |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 60 of a ~300-bud bank — overflow is structural (05-V7) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | Holds; the queue takes ~4 seasons to clear (05-V7) |
| C3 | ≥30 buds/branch → clusters | ✓ | Habit branch: ~55 habit-family buds banked pre-bloom → **clusters fire** (then drain) |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ read | III-7 = the crown at the Mar 1 Y4 bloom (first-earned Grove) |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | trivially ✓ | 3/yr on 4 branches; 9 render, 6 merged at Y5 |
| C7 | bank counter top-3 + count | ✓ | "top 3 + ~238 more" at the first bloom — honest but absurd (05-V7) |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | d1108 / d1544 / ≈ d2653 (year 7.3) |
| E1–E14 | signatures | ✓ read | See §5 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | **Maturity Jan 13 = winter — the one season clash (05-V1), STRUCTURAL for Jan-born bursty users** |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | 0.21–0.28 (unit-bracketed, 05-V3) — ≤0.4 under EVERY reading → phyllodes |
| F5 | RHYTHM = 1 − CV(weekly), clamped | ✓ | **0.0 — the axis FLOORS; the bursty user IS the rhythm pole** (exact math, §3) |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ as written | **0.6884 — 0.012 below E2's 0.7 (05-V9)** |
| F7 | TENURE = stage-years/10 | ✓ | 0.1 → 0.3 |
| F8 | replay ~2s/yr | ✓ | 5-yr time-lapse ≈ 10s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1)
records ≥20 (02-V1, 03-V-6, 01-V12). Third recurrence; harmless here
(both land in the first burst, Jan 15 vs 20) but still unreconciled —
05-V10.

**Register drift 2 (E6 referent missing):** E6 cites "the 365-day streak
achievement"; no trophy in ANY family is a 365-day streak (II-4 = 500-day —
03-V-4, 01-V8). Third recurrence — 05-V4.

**Register drift 3 (A4 windowed-vs-cumulative, NEW):** the stage-year
mechanics are not stated — 05-V2.

---

## 2. The walk

### CHECKPOINT MONTH 3 — Mar 31 Y1 (day 90 — the first burst ends)

- **B1 tick (d1, Jan 1):** first in-window event → SEED → SEEDLING.
  Germination ceremony (D094).
- **B2 tick (d15 / d20):** 30/30 journal days in the first 30-day window
  ≥ 15 → SEEDLING → SAPLING. First burst ✓.
- **Earned by d90 (all buds, tier-marked per D096):** S: I-1 (d1) · III-1
  (d2) · IV-1 (d1) · II-1 (d1). R: III-2 (d2) · IX-4-R (d2 — journal+PR
  same day) · I-2 (d7) · II-2 ×3 (d7/14/21, one per habit, first-time) ·
  III-4 (d15, 10th PR) · I-6 (d50) · III-19-R44 (100k kg ≈ d87 [A2]) ·
  **III-3 ×40 (per-PR faucet [A1]) · III-20 ×25 (record days [A3])**.
  B: IX-4-B (d12, 10th journal+PR day) · III-5 (d55, 25th PR) · III-9 ×3
  (Jan/Feb/Mar PR seasons) · **III-8 ×4 (Same Lift, Ten Times Better —
  the 10th PR on each of the 4 lifts lands in burst 1; the first draft
  missed this family — 05-C4)** · I-3 (d90 — the 90-day streak completes
  **exactly on the burst's last day**) · III-21 (d84, 12-week run) ·
  IV-4 (d30+, rolling-window read) · II-6 ×9 (Jan+Feb+Mar perfect months
  × 3 habits) · II-8 ×4 (21-day windows). H: I-4 (d60 [A4]) · III-18 ×4
  (d~80 [A3]) · II-9 ×3 (d90 [A3]) · III-10 ×2 (7-day trifecta windows).
  III-6 NOT yet (50th PR ≈ d390, burst 2 [A1]).
  Bank ≈ **110 buds** (4 S · 75 R · 25 B · 6 H).
- **Axes:** RESOURCE 0.21–0.28 · RHYTHM **1.0 — a lie of youth** (13 burst
  weeks of 7/7 → CV 0; the axis has not yet SEEN a quiet week — the read
  dives to 0.0 by year end, §3) · BALANCE 0.6884 · TENURE 0.
- **Rings 0 · Twigs 0 yet** (the first month's twig fires at the month
  close — d31; counted at the next checkpoint). **Why-panel:**
  "SEEDLING · one season of fire · 110 buds — your tree's first canopy
  is a Jan–Mar event: the gym, habit and nutrition branches carry a full
  month of wood each; April begins the quiet."

### CHECKPOINT MONTH 6 — Jun 30 Y1 (day 181 — 13 weeks into the quiet)

- **Stage:** SAPLING. **Stage-years:** 0 (window 1 closes d365).
- **Twigs:** journal 3 (Jan/Feb/Mar ✓) · habits 3 · nutrition 3 · gym 3 —
  12 twigs on 4 branches, all burst-dated. April–June: journal 4–5 days/
  month < 15 → **no quiet twigs — honest**.
- **Earned by d181 (≈ 112 buds):** + I-13-R (d96 — the first solitary
  quiet Monday) · I-13-B (d~159 — the 10th). The PR faucets rest with the
  gym: nothing more fires until January. Net +2. Bank ≈ **112 buds**.
- **Axes:** RHYTHM **0.25** (13×7 + 13×1 → mean 4.0, CV 0.75 — the axis is
  *learning* the quiet) · others unchanged.
- **Rings 0.** **Why-panel:** "Half a year — one season of fire, one of
  quiet. Your twigs all carry January–March dates. The quiet is honest:
  nothing is marked 'resting' — the branches simply hold still."

### CHECKPOINT YEAR 1 — Dec 31 Y1 (day 365)

- **B3 does NOT tick.** 129 active days < 200 — the first stage-year closes
  Mar 12 Y2 (d436). **F7 TENURE 0.**
- **Earned (cumulative ≈ 110 buds):** nothing new since d181 — the
  burst's firehose (110 at d90) + I-13-R (d96) + I-13-B (d~159). III-6
  (50th PR ≈ d390 — burst 2, outside this checkpoint) · II-11 (rebuild
  completes Jan 30 Y2, d425 — outside). Count at d365: 4 S · 75 R (incl.
  III-3 ×40 [A1], III-20 ×25 [A3]) · 25 B · 6 H.
- **Axes:** RESOURCE 0.21–0.28 · **RHYTHM 0.0 — the first full-year read
  (13×7 + 39×1 → mean 2.5, CV 1.04 → clamp 0)** · BALANCE 0.6884 ·
  TENURE 0.
- **Twigs 12 · Rings 0.** VIII-1 One Year In does NOT fire (needs ≥3
  domains in ≥9 of 12 calendar months — this user has 4 domains in exactly
  3; both readings fail). I-5 Full Orbit does NOT fire (129 < 300).
  I-15 Bookended does NOT fire (129 < the 146-day floor). **III-26(yr1)
  DOES fire (Jan 1 Y2, d366 — the ±7d band around the anchor, gym active
  ✓ — Ring-tier bud on a ringless trunk: 05-V8).**
- **Why-panel:** "POLE in 71 days — your first stage-year needs 200
  active days and a year of your rhythm gives 129. Your trunk grows at
  the pace of presence, not intensity — the quiet is real."

### CHECKPOINT YEAR 2 — Dec 31 Y2 (day 730)

- **B3 tick (d436, Mar 12 Y2):** cumulative 200 active days → SAPLING →
  POLE. Leaf granularity unlocks (C6). **F7 TENURE 0.1.**
- **Earned (cumulative ≈ 188 buds):** + III-6 (50th PR ≈ d390 [A1]) ·
  III-3 ×24 (burst 2 [A1]) · III-20 ×10 (burst 2 [A3]) · II-11 ×3
  (d425 — the rebuild: 90-day streaks broken Apr 1, rebuilt to 30 by
  Jan 30 Y2, one fire per habit) · III-24 (d367 — Back at It: the 275-day
  gap ends Jan 2, PR matched within 60 days ✓) · III-21 (d~449 — the
  burst-2 trimester) · I-3 (d455) · I-4 (d~425 [A4]) · II-6 ×9 · II-8 ×4 ·
  II-9 ×3 (d~455 [A3]) · **II-12 ×3 (yr-1 anniversaries, Jan 1 Y2 = d366,
  Ring — one per habit) · III-26(yr1) (d366, Ring) · I-12-B (d366 — the
  Jan 1 month-day recurs across 2 distinct years; the first draft listed
  I-12 as never — 05-C2)** · IV-2 (d~425) · IV-4 ×~2 · IV-6 (d455 — the
  180th cumulative food-log day) · IX-4-H (d~390 — the 50th journal+PR
  day [A1]; the first draft's d65 was impossible under its own 40-PR-Y1
  model — 05-C5) · I-13-H (d~530 — the 50th solitary quiet Monday).
  Count: 4 S · 110 R · 55 B · 15 H · 4 Ring.
- **Axes:** TENURE 0.1 · RHYTHM 0.0 · others unchanged.
- **Twigs 24 (12 render) · Rings 0.**
- **Why-panel:** "POLE · stage-year 1 · every January your branches wake
  together — the habit branch's 90-day runs break every April and rebuild
  every January (II-11 — the comeback is your habit family's signature)."

### CHECKPOINT YEAR 3 — Dec 31 Y3 (day 1095) — "maturity?"

- **NOT YET — by 13 days.** Cumulative 387 → 1.94 stage-years → still
  POLE. B4's second stage-year closes **d1108 (Jan 13 Y4)** — 13 days
  after this checkpoint, in calendar WINTER (F1: winter = Dec 1).
  **The task's "Year 3 (maturity?)" — answered: maturity is year 3.04,
  and it lands in winter (05-V1).** (First draft said "8 days / d1103" —
  05-C1: d1103 is Jan 8 Y4; the honest close is Jan 13 = d1108.)
- **Earned (cumulative ≈ 266 buds):** + III-3 ×24 (burst 3 [A1]) ·
  III-20 ×10 (burst 3 [A3]) · III-24 (d732) · III-21 (d~814) · I-3 (d820)
  · I-4 (d~790) · II-11 ×3 (d~790) · II-6 ×9 · II-8 ×4 · II-9 ×3 · II-12 ×3
  (yr-2 anniversaries, d731) · III-26(yr2) (d731) · IV-2 (d~790) ·
  IV-4 ×~2 · III-18 ×4 (d~800 [A3]) · **I-9-R (25k words — event-level
  crossing d814, Mar 25 Y3: 9,150 words/yr = 7,200 burst + 1,950 quiet;
  the first draft's d998 used a uniform-rate shortcut — 05-C6)** ·
  I-13-H (d~530, counted at the Y2 checkpoint). Count: 4 S · 145 R ·
  85 B · 24 H · 8 Ring.
- **Axes:** TENURE 0.1 (1.94 accrued) · others steady.
- **Why-panel:** "POLE — your second stage-year closes in 13 days. Your
  tree will flower at 3 years and 13 days, in January: the calendar's
  resting season is the moment your life is loudest — the first bloom
  waits for the spring flush (05-V1)."

### CHECKPOINT YEAR 5 — Dec 31 Y5 (day 1825) — FINAL STATE

- **B4 tick (d1108, Jan 13 Y4):** 2 stage-years AND journal's best
  anchored year = 129 ≥ 90 ✓ → POLE → **MATURE, in winter. D1 floor met.**
  Maturity ≈ year 3.04 — the task's "~year 4–5?" guess was wide; the
  honest compute is 3.04 (and the task's "gym 48 × 2–3 = 96+" reasoning
  was wrong — gym's best YEAR is 52 < 90; the ≥90 domain is JOURNAL, 129).
- **B3's "too slow?" verdict (the mandated question):** 1.55 calendar-
  years per stage-year is the exact cumulative calibration for 129
  days/yr — the D090 note's every-other-day pace (13.1 months) extended
  to the seasonal case. **It is calibration-CONSISTENT, not a bug — but
  it is the emotional gap of this archetype (05-V1): 90 days of maximal
  life read as 'slow growth' while a 218-day steady user gets pioneer
  speed (maturity at year ~1.8). The tree reads volume, never intensity —
  the why-panel must own that sentence.**
- **Earned (cumulative ≈ 414 fires by Y5, assumption-marked):** +
  **III-7 Century of PRs (Grove, ≈ d1135 — the 100th PR, early burst Y4
  [A1], AFTER maturity → banks to the next annual bloom = Mar 1 Y4 — the
  crown)** · I-7 (500th entry ≈ d1345, early Sep Y4 — growing season,
  on-earn bloom) · **III-19-R45 (500k kg ≈ d1161, Mar 6 Y4 [A2] — the
  first draft's d1470 contradicted its own A2 "year 4"; 05-C7)** ·
  **I-12-H (d731) + I-12-G (d1461 — the Grove at the 5-year Jan 1
  month-day recurrence; 05-C2)** · II-12 ×6 more (12 total, Ring) ·
  III-26 ×2 more (4 total, Ring — the first draft's "5" over-counted by
  re-listing the yr-1 fire at two checkpoints; 05-C8) · II-6 ×18 more
  (45 total) · II-8 ×8 (20 total) · II-9 ×6 (15 total [A3]) · II-11 ×6
  (12 total — the first draft's "5" undercounted its own mechanics:
  3 habits × 4 rebuild rounds, Jan 30 Y2–Y5; 05-C9) · III-24 ×2 (4 total)
  · III-21 ×2 (5 total) · I-3 ×2 (5 total) · I-4 ×2 (5 total [A4]) ·
  IV-2 ×2 (5 total) · IV-4 ×~4 (10 total) · III-3 ×~48 (136 total [A1]) ·
  III-20 ×~20 (65 total [A3]) · III-10 ×~6 (10 total [A1]) · III-9 ×6
  (15 total [A1]) · III-18 ×8 (20 total [A3]) · IX-4 R/B/H (d2/d12/d~390
  [A1]).
  Count: **4 S · ~215 R · ~141 B · ~36 H · 16 Ring · 2 Grove ≈ 414** —
  of which ~375 are repeatable faucets (**~91%**; the first draft's 405
  total / ~81% were based on its undercounts — 05-C9). I-13-H@200 (200th
  solitary day ≈ May Y6) — just past the walk edge, noted. III-25
  Thousand Sessions: 260 < 1000 — fires ~year 19, honest. R46 (1M kg):
  ~year 7.2, honest. IV-7 (1,000 food-log days): ~year 11, honest.
- **First bloom (D092(2)):** pre-maturity bank at d1108 ≈ **271 S/R/B/H
  buds** (266 through Y3 + the burst-4 January spillover to Jan 12: III-3
  ×~4, III-20 ×~1 ≈ 5 more) + the Jan 13–Mar 1 earns (II-6 ×1, II-8 ×1,
  II-11 ×3, I-4 ×1, III-24 ×1, III-9 ×2, IV-2 ×1, III-3 ×~10, III-20 ×~4,
  III-18 ×2, IV-4 ×~1 ≈ 27) → **≈ 298 at the bloom's opening**.
  C1/C2: 15/event, 4 waves → **60 bloom, ~238 overflow** — the burst
  cannot fit one ceremony; the queue clears over ~4 seasons (05-V7).
  Ring (16) + Grove (2) stay banked (D092(2)).
- **Blooms executed (D095/D093, Mar 1 = the pinned bloom day per 02-V6):**
  - **Mar 1 Y4 (the FIRST bloom, deferred from Jan 13 by the 05-V1 pin):**
    60 from the bank's top · **III-7 = the CROWN transformation** (first-
    earned Grove, C4; D115(5): the legend persists through winter) ·
    **E3 phyllodes manifests** (D093 — gates all held at the bloom:
    D1 d1108 ✓, resource 0.21–0.28 ✓, floor SEEDLING ✓) · Ring:
    III-26(yr3) + II-12 ×3 (Jan 1 Y4 anniversaries, winter-banked →
    flush ✓) · the winter-banked burst-4 earns (Jan–Feb Y4: III-3 ×~10,
    III-20 ×~4, II-6 ×2, II-8 ×1, II-11 ×3, I-4 ×1, III-24 ×1, III-9 ×2,
    IV-2 ×1 — D095's winter bank ✓).
  - **Mar 1 Y5:** 60 from the queue + III-26(yr4) + II-12 ×3 + the
    winter-banked burst-5 earns. **On-earn (growing season):** March-Y4/
    Y5 earns (III-3, III-20, III-9, III-21 — March is growing season)
    bloom directly; Jan–Feb earns keep banking to the flush (D095 ✓ —
    the seasonal skeleton is COHERENT with the burst: the tree's densest
    moment is exactly the user's return).
- **Axes (final):** RESOURCE 0.21–0.28 · RHYTHM **0.0** · BALANCE 0.6884 ·
  TENURE **0.3** (3.2 stage-years accrued; the 4th closes ≈ d2216,
  Jan 26 Y7).
- **Twigs:** 15/domain lifetime (3/yr × 4 domains + the Y5 burst closes
  3 more within the walk) — 9 render individually, 6 merged into branch
  character (C5). **Rings: 0 — and forever (05-V8).**
- **Why-panel:** "Five years of January. Your trunk never brands a ring —
  rings are a seven-domain brand and your life is four domains, three
  months at a time. Your rings live in the pattern itself: 16 Ring-tier
  flowers, four revivals, a crown earned at three. The phyllodes
  character grew at your first bloom — and it tells the wrong story
  (05-V3)."

---

## 3. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | **0.21** (per-domain-day reading: 129 journal + 52 gym + 90 nutrition + 270 habit-completions = 541 ÷ 129 ÷ 20) — **0.28** (per-event reading, +180 meals = 721 ÷ 129 ÷ 20) | the task's hand-estimate (0.22, per-calendar-day normalization) lands inside the bracket; **≤0.4 under EVERY reading → phyllodes opens no matter how the unit is pinned** (the 01-V4 unit question does not flip this archetype) |
| F5 RHYTHM | 1 − CV(weekly active-day counts), clamped | **0.0** — exact: 13 wks × 7 + 39 wks × 1 → mean 2.5, sd 2.60, CV 1.04 → 1−CV = −0.04 → clamp 0 | the task guessed "~0.1–0.2"; the honest compute is the axis FLOOR. The bursty user IS the rhythm pole (vs steady users' 0.90–1.0 — the axis discriminates perfectly). Monthly reads: 1.0 at month 3 (the lie of youth), 0.25 at month 6, 0.0 by year 1 — the axis needs a full cycle to see a rhythm (§7) |
| F6 BALANCE | Shannon evenness, canonical 7 | **0.6884** — p = (129, 90, 52, 90, 0, 0, 0)/361 → H = 1.3395 → H/ln7 = 0.6884 | low-mid, as the task expected — and **0.012 below E2's 0.7 gate (05-V9)** |
| F7 TENURE | stage-years ÷ 10 | 0 → **0.3** (3.2 accrued at Y5) | mid |

**Stage ticks (B-group, cumulative reading):** B1 d1 · B2 d15 (register) /
d20 (D115(1)) · **B3 d436 — the first stage-year closes in 1.19 yr; the
steady pace is 1.55 yr (the mandated "too slow?" flag: calibration-
consistent, emotionally heavy — 05-V1)** · **B4 d1108 — year 3.04,
WINTER (05-V1)** · B5 ≈ 15.5 years.

**Twigs per domain (A3):**

| Domain | Burst months | Quiet months | Twigs/yr |
|---|---|---|---|
| Journal | 31/28/31 ✓ | 4–5 < 15 ✗ | **3** |
| Habits | 31/28/31 ✓ | 0 | **3** |
| Nutrition | 31/28/31 ✓ | 0 | **3** |
| Gym | 16–18 ✓ (Tue/Thu/Sat/Sun) | 0 | **3** |
| Body-forks / media-forks / goals | — | — | 0 |

12 twigs/yr across 4 branches — 3/yr/domain, honest (the task's
expectation confirmed; C5's 12/branch cap never binds).

**Rings (A5):** journal 129 ✓ · habits 90 ✓ · gym 52 ✓ · nutrition 90 ✓ ·
body 0 ✗ · media 0 ✗ · goals 0 ✗ → **4 of 7 → 0 trunk rings in 5 years,
and forever.** The task's question ("when can the first canonical-7 ring
form?") — **never, in this life as specified.** Even adding a weekly
weigh-in (52/yr) reaches 5 of 7; the ring needs 3 more domains at ≥40
days in the same anchored year. VIII-1/2/3 (3 domains × ≥9 months) never
fire (4 domains in exactly 3 months); VIII-11 Pith (rings ≥1 ever) never
fires with it. **The honest no-ring verdict stands, verified against
D090 C, D101(1), D104, D114(3) — a 4-of-7 life.** Branch rings (D088 A):
the undefined bar again (01-V11) — under an any-presence bar, journal 5,
habits 3, nutrition 3, gym 3.

**Bank by year (cumulative fires, assumption-marked [A1]–[A4]):**

| Year | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| 1 (d365) | 4 | 75 | 25 | 6 | 0 | 0 | 110 |
| 2 (d730) | 4 | 110 | 55 | 15 | 4 | 0 | 188 |
| 3 (d1095) | 4 | 145 | 85 | 24 | 8 | 0 | 266 |
| 5 (d1825, MATURE) | 4 | 215 | 141 | 36 | 16 | 2 | **414** |

**The repeatable faucets (the bank's true composition):** III-3 ×136 [A1]
+ III-20 ×65 [A3] + II-6 ×45 + II-8 ×20 + II-9 ×15 [A3] + II-12 ×12 +
III-9 ×15 + III-18 ×20 [A3] + II-11 ×12 + III-10 ×10 [A1] + III-21 ×5 +
III-24 ×4 + I-3 ×5 + I-4 ×5 [A4] + IV-2 ×5 + IV-4 ×10 + II-2 ×3 … =
**≈ 375 of 414 fires ≈ 91%** — the 01-V7/03-V-1 flood, third archetype
in a row, and here it has a NEW engine: **the annual detrain-reset
re-opens the PR faucet every January** (05-V7).

---

## 4. The bank — by family, who progresses and who hits the April wall

**Journal (I):** I-1, I-2, I-3 ×5, I-4 ×5 [A4], I-6, I-7, I-9-R, I-13 R/B/H
(+@200 just past the walk) → **progresses through Heartwood.**
NEVER: I-5 Full Orbit (129 < 300), I-8 (1,000 entries ≈ year 7.75), I-10
Deep Dive (80-word entries never cross 500-in-one), I-11 You Came Back
(the quiet rhythm is weekly — max gap 7 days, the 21-day bar is *never*
hit: this archetype never "leaves"), I-14 (no phases), I-15 Bookended
(129 < the 146-day floor), I-16/17 (Full-Orbit chains).

**Habits (II) — the family the April wall breaks:** II-1, II-2 ×3
(first-time only — no habit ever re-fires it), **II-6 Perfect Month ×45,
II-8 Juggling Act ×20, II-9 Like Clockwork ×15 [A3], II-11 Rebuilt ×12
(the return economy — this archetype's habit signature), II-12 One Trip
×12 (Ring)** → progress. NEVER: II-3 A Hundred Days (**max streak 90 —
dies on April 1, every year, by 10 days**), II-4 The Long Haul, II-5
Full Year (90 < 300), II-7 Five Strong (3 habits < 5), II-10 Honest Rest
(silence is not a rest event — and the user never logs one), II-13
Renaissance Life, II-14/15 (chains).

**Gym (III) — Root-dominated:** III-1, III-2, III-3 ×136, III-4/5/6,
**III-8 ×4** (one per lift, first-burst), III-9 ×15, III-10 ×10,
III-18 ×20 [A3 — the 9-month layoff detrains below the Novice bar, so
the same 4 lifts re-cross it every burst; the user genuinely IS a novice
again each January], III-19 R44/R45, III-20 ×65, III-21 ×5 (13-week
bursts clear the 12-week bar), **III-24 Back at It ×4 (the gap+return
trophy — PERFECTLY matched: a 275-day gap and a PR within 60 days of
every January return)**, III-26 Ring ×4. NEVER: III-11 A PR Every Season
(**PRs land in exactly 3 distinct calendar months/yr (Jan/Feb/Mar); the
12-distinct-month bar is structurally unreachable**), III-22 (26-week set
— the burst is 13), III-23 (no phases), III-25 (1000 sessions ≈ year
19), **III-27/28 (≥80 workouts/yr — 52/yr → the gym's Grove chains are
calibrated to 3×/week and this 4×/week-but-seasonal user never closes
them — the chains reward cadence, not volume)**.

**Nutrition (IV):** IV-1, IV-2 ×5, IV-4 ×~12, IV-6 → progress. NEVER:
IV-3 (phase-gated), IV-5 (robot ±3% — 90-day runs die in April), IV-7
(1000 days ≈ year 11), IV-8/9/10 (phases), IV-12 (phase adjacency),
IV-13/14 (chains).

**Body / Media / Goals (V / VII / fruit):** nothing — the user never
opens them. **Cross (IX):** IX-4 R/B/H — journal+PR days are 52/yr, all
tiers by Y2 [A1].

**Ring-tier:** III-26 ×4 + II-12 ×12 = **16 Ring-tier flowers** on a
trunk that will never brand a ring (05-V8). **Grove: two — III-7 (the
crown) + I-12-G (the Jan-1 month-day recurrence at 5 years, 05-C2).**

**Which families NEVER progress?** The streak wall (II-3/4/13, IV-5,
III-22, E6/E7 — **every streak-dependent trophy breaks every April, by
construction, and the wall is exactly the burst length (90)**), the
yearly chains (I-5/16/17, II-5/14/15, III-27/28, IV-13/14, VIII-1/2/3,
VIII-11), the distinct-months wall (III-11), the phase economy (III-23,
IV-3/8/9/10/12, I-14), the volume ceilings (III-25, IV-7, R46/47).

**Bloom schedule (D092/D093/D095; bloom day = Mar 1 per the 02-V6 pin):**

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | Jan 13 Y4 as-written — **WINTER (05-V1)**; pinned to **Mar 1 Y4** per 01-V3 | ~300-bud S/R/B/H bank vs C1 15/event + C2 60/season → 60 bloom, ~238 overflow → **the queue clears over ~4 seasons (05-V7)** | C1/C2 mechanically hold; overflow honest |
| Annual bloom Y4 | Mar 1 Y4 | 60 (bank top) · **III-7 → CROWN transformation (C4)** · **E3 phyllodes manifests (D093)** · Ring: III-26(yr3) + II-12 ×3 (winter-banked ✓) · the burst-4 winter bank (D095 flush) | C4 ✓ · E3 ✓ |
| Annual bloom Y5 | Mar 1 Y5 | 60 (queue) · III-26(yr4) · II-12 ×3 · burst-5 winter bank | C2 ✓ |
| On-earn (post-maturity, growing season) | March earns only (Mar 1–Nov 30) | III-3/III-20/III-9/III-21 March micro-blooms; **Jan–Feb earns bank to the flush (D095 ✓)** — the burst straddles the season boundary and the schedule handles it cleanly | ✓ |

**The seasonal-skeleton coherence (a genuine PASS):** the bursty user's
feast lands in calendar winter → D095's winter-bank→spring-flush converts
their Jan–Feb intensity into the March canopy; their famine lands in the
growing season → the sparse canopy is honest. The tree's densest moment
(Mar 1) coincides exactly with the user's return from quiet. **The
seasonal machinery was built for this user without knowing it** (05-V6
carries the copy caveat).

---

## 5. The adaptations (E1–E14) — verdict for this pattern

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.7 ≈ year 10.9 (7 stage-years); resource 0.21–0.28 ✓ | Reachable, far outside the walk — the ancient-sparse trait on a seasonal tree (02-V4's wait, extended) |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | **balance 0.6884 — fails by 0.012** · resource 0.21–0.28 fails | **NO — and the razor margin makes the F6 norm gate-deciding (05-V9)** |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | 0.21–0.28 ✓ under every reading; D1 met d1108 | **OPENS — manifests Mar 1 Y4. THE SEMANTIC FLAG (05-V3): feast-famine reads as drought** |
| E4 cladodes | divergence ≥0.6 | habit streaks are inside journal coverage; no streaks outside it → divergence ≈ 0 | No — honest |
| E5 storage leaves | media share ≥0.5 | 0 media | No — honest |
| E6 thorns | 365-day streak trophy + tenure ≥2 · D1 + SAPLING | no 365-day streak exists anywhere (01-V8/03-V-4 referent gap); **max streak 90** | **NEVER — the armor gap, 3rd recurrence, now with the 90-day wall (05-V4)** |
| E7 spines | 100-day streak trophy (II-3) · SAPLING | max 90 — **10 days short** | **NEVER — by 10 days, every year (05-V4)** |
| E8 tendrils | live long-horizon goal | no goals | No — honest |
| E9 reaction wood + epicormic | a revival (dormancy end) — universal | **4 revivals by Y5** — Jan 1 of Y2/Y3/Y4/Y5, each waking the gym/habit/nutrition branches after 275 days of dormancy (the first draft's "5" and the task's "5 annual revivals" both over-counted by one: the tree is BORN on Jan 1 Y1, not revived — 05-C8). Per-branch: 12 wake events | **YES — ×4 (12 branch-level), the archetype's TRUE structural signature (the comeback record). The dormancy trigger itself is unpinned (05-V5)** |
| E10 contractile | 3 consecutive stage-years with RISING active days | 129 → 129 → 129 → flat (and every stage-year closes at exactly 200) | No — honest (the task's "E10 NO" confirmed: the user's intensity is 100% seasonal, 0% trend) |
| E11 mycorrhizal | coachEngagement ≥ threshold (H-03) | none | Open/effectively-never (02-V7) |
| E12 stolons | L-10 insight ≥3 monthly windows | none | Open/effectively-never (02-V7) |
| E13 bracts | no gate (ceremony) | F-03 PR flourish ≈ ×136 [A1] | Present ✓ display-only |
| E14 bud scales | no gate (dormant-habit state) | **habits dormant Apr–Dec: scale-wrapped buds for 9 months/yr** | **YES ✓ — the quiet stretch's most honest organ** |

**Structural marks in this life: exactly one (E3 phyllodes, Mar 1 Y4) +
the universal E9 ×4 + the subtle E14.** The rare tier is dominated by
the wrong character (05-V3) and the armor gap (05-V4).

---

## 6. Verification (honesty, coherence, schedules, economy, budgets)
### + the quiet-stretch sanity check

**Honesty — PASS.** Every event real, same-day, in-window (A1/D100),
non-imported, qualifying under A2 every day it fires (80-word journals,
4 real sets, 3 real meals, 1 completion). Nothing farmed: the quiet
stretch is *never zero* (39 journal weeks) but is never logged as a
period, rest flag, or quiet-week — **the 9 quiet months are NOT
protected absence** (D114(1): protected = rest flags / vacation periods /
quiet-weeks; a 9-month silence is none of those — it has none of the
three sources), so the dormancy visuals, the RHYTHM axis, and the branch
copy treat it as honest quiet, not as "resting" — **correct**. Nothing
unrewarded: every earned bud has a dated expression; the unbloomed
things are genuinely unearned (III-25 at 260/1000, IV-7 at 450/1000,
R46 at ~650k/1M, I-13@200 at 195/200, I-15's 146-day floor).

**Coherence — ONE FAIL, two near-misses.** Contradictory signatures remain
impossible (caudex vs buttress: resource 0.21–0.28 vs 0.6 — no overlap).
FAIL (a): **E3's phyllodes manifest is semantically wrong — the axis
conflation (05-V3)**; the D095 derived override then compounds it (a
phyllode-character tree keeps leaves through winter — the bursty tree's
9-month quiet is its own winter and the phyllode character would soften
the honest dormancy the archetype was built to show). Near-miss (b):
E2's balance leg at 0.6884 vs 0.7 — the F6 norm choice decides a
rare-tier gate (05-V9). Near-miss (c): RHYTHM clamps at 0.0 — the axis
is monotone-dead for CV ≥ 1 (05-V9 note).

**Schedules — ONE clash, everything else PASSES.** D092(1) pre-maturity
banking ✓ (271 buds, nothing blooms early). D092(2) first bloom: **as
written it fires Jan 13 Y4 in winter — the third recurrence of 01-V3,
and now STRUCTURAL: a Jan 1 anchor + this pattern always matures
mid-January (05-V1)**. D092(3)+(D095): winter earns bank to spring ✓ —
and here the mechanism *shines*: the burst straddles the season boundary
(Jan–Feb → bank, March → on-earn) and the schedule handles it cleanly.
D092(4)/(5): Ring at the annual bloom ✓, the Grove at the next annual
bloom after maturity ✓ (III-7 earns ≈ d1135, blooms Mar 1 Y4 — the
02-V6 same-day boundary dissolves for this archetype: every event lands
mid-winter and banks). D093: phyllodes manifests Mar 1 Y4 ✓ (gates all
held at the bloom). D100: in-window every day ✓, anchor Jan 1 ✓, F10 n/a.

**Economy — MECHANICALLY PASS, DESIGN-STRAINED (05-V7).** C1/C2 hold at
every bloom (60/season, overflow banks with nothing lost, C7 shows the
pending count) — but the first bloom shows 60 of ~300 (20%), the pending
queue is permanent, and **~91% of the lifetime bank is re-fires**, with
a new engine: the annual detrain-reset re-opens the PR faucet (III-3
×136 + III-20 ×65 ≈ 48% of the bank alone) every January.

**Budgets — PASS.** C5: 3 twigs/yr/domain ≤ 12, retention honest (9
render, 6 merged). C3: the habit branch clusters pre-bloom (~61
habit-family buds banked at d1108 — II-1 + II-2 ×3 + II-6 ×27 + II-8 ×12
+ II-9 ×9 + II-11 ×9 — ≥ 30 ✓, the one archetype where clusters fire by
construction), then drains at the flush. C4: III-7 =
the crown, once-set ✓. C7: honest-but-absurd ("top 3 + ~238 more").
D1/D2/D3: d1108 / d1544 / ≈ d2653 ✓.

**The quiet-stretch sanity check (the mandated question) — the emotion:**
the dormancy visuals are honest (branches hold still, habit buds scale-
wrapped — E14, journal leaves thin to weekly, no "resting" label —
D114(1) reserves that word for the three protected sources). The sanity
risks found, all in the COPY, all fixable: (a) 9 months of "dormant"
copy reads as failure if the panel narrates each month in isolation — it
must narrate the PATTERN ("your gym branch sleeps every April and wakes
every January — this is your rhythm: 13 weeks on, 39 off"); (b) the
seasonal inversion must be owned ("your January is this tree's spring —
the winter bank becomes the March flush; your quiet is the honest space
between"); (c) the E9 revivals (×4) are the anti-shame structure —
every wake is reaction wood, the tree's permanent scar-story of
returning. The copy language must make the comeback the identity, not
the gap (05-V6).

---

## 7. Corrections applied to this run's first draft (05-C1 … 05-C9)

Re-verified against the register, D090–D115, and the raw trophy scan;
none changes a verdict, all tighten the numbers:

- **05-C1 — stage-year day numbers.** SY2 closes d1108 (Jan 13 Y4), not
  d1103 (Jan 8); SY3 closes d1544 (Mar 25 Y5), not d1479 (Jan 19);
  maturity = year 3.04, not 3.02; D3 ≈ year 7.2, not ~8.5.
- **05-C2 — I-12 fires, ×3.** Same Question New Answer reads
  `sameMonthDay` across distinct years (scan:117) — no pinned prompt
  needed. The recurring burst makes Jan 1 recur → Branch d366, Heartwood
  d731, Grove d1461. The first draft's "never" (and its A6) was wrong.
- **05-C3 — I-15 never fires.** Bookended's ≥146-distinct-day floor
  (scan:120) is unreachable at 129/yr. The first draft's "0–1 fires on
  Dec-31-Monday years" misread the condition.
- **05-C4 — III-8 ×4 added.** Same Lift, Ten Times Better (one-time per
  exercise): the 10th PR on each of the 4 lifts lands in burst 1.
- **05-C5 — IX-4-H date.** The 50th journal+PR day fires ≈ d375 (Jan 10
  Y2), not d65 — d65 is impossible under the run's own A1 (40 PRs Y1).
- **05-C6 — I-9-R crossing.** 25k words cross at d814 (event-level: burst
  days 80w, quiet Mondays 50w), not d998 (uniform-rate shortcut). Both
  land in Y3; the exact day is the burst one.
- **05-C7 — R45 date.** 500k kg crosses ≈ d1195 (Mar 9 Y4) under the
  run's own A2 — the first draft's d1470 contradicted its own "year 4".
- **05-C8 — revival count and Ring-tier over-counts.** E9: 4 dormancy-
  end events by Y5 (Jan 1 Y2–Y5), not 5. III-26: 4 fires, not 5;
  II-12: 12, not 15 → **Ring-tier total 16, not 20.**
- **05-C9 — re-fire undercounts.** II-11 ×12 (3 habits × 4 rebuild
  rounds), not 5; III-18 ×20 under [A3], not 5; III-24 ×4, not 5 →
  lifetime bank ≈ 414 (~91% repeatables), not 405 (~81%).

---

## 8. Observations (not violations, recorded for the cross-run ledger)

- **The RHYTHM axis's first-year lie:** 1.0 at month 3, 0.25 at month 6,
  0.0 at year 1 — a bursty user's axis read is *wrong* until a full cycle
  exists. The why-panel should not show the rhythm read before ~52 weeks
  (or should show "forming").
- **I-11's inverse:** the bursty user's journal rhythm (max gap 7 days)
  means "You Came Back" NEVER fires — the 21-day gap trophy is
  cadence-sensitive in BOTH directions (01's biweekly journaler over-fires
  it ~2×/yr; the weekly journaler can never fire it). Trophy quirk, not a
  tree problem — record for the seed-data sweeps.
- **III-18 Novice re-fire loop [A3]:** the 9-month layoff detrains the
  lifts below the novice bar, so "Novice ×4" re-fires every burst. Honest
  (the user IS a novice each January) but it inflates the Branch tier —
  a re-earn semantics decision for the engine.
- **III-27/28's calibration blind spot:** the gym Grove chains demand ≥80
  workouts/yr — calibrated to 3×/week (156/yr). This 4×/week-but-seasonal
  user (52/yr) never closes them; the only gym Grove is the PR century.
  The chains reward cadence, not volume — probably intended, worth
  stating.
- **III-11's distinct-months wall:** a 3-month/yr training life can never
  collect 12 distinct PR-months — a second, quieter calibration blind
  spot in the same family.
- **II-12/III-26 Ring-tier anniversaries are winter-pinned for a Jan-1
  anchor:** every Ring-tier fire lands in the burst and banks to the
  flush — the Ring-tier family's schedule is *defined by the anchor's
  season*; a Jul-1 anchor would spread them across the growing season.
- **E14 + D087 dovetail:** the habit branch's 9-month scale-wrapped state
  is the D087 winter-bud mechanism applied to a non-calendar dormancy —
  the seasonal model generalizes cleanly to data-derived dormancy; the
  copy must say so ("your habit buds are wrapped for the quiet").
- **The D114(2) → D115(1) B4 history matters:** the superseded twig-gate
  (≥6 twigs on one branch) would have dead-locked this archetype forever
  (3 twigs/yr/domain); the days-based gate (≥90 in-window days) lets him
  mature. The D115 fix is load-bearing for seasonal users — worth stating
  in the engine contract's rationale.

---

## 9. Violations & tuning proposals

**05-V1 — [SCHEDULE, 3rd recurrence, now STRUCTURAL] Winter maturity: a
Jan-1-born bursty user matures mid-January, every time.** Maturity lands
d1108 (Jan 13 Y4). D092(2) says the first bloom bursts AT MATURE; D095 says
winter banks. Runs 01 (Jan 15 anchor → Jan 14 Y3) and 05 (Jan 1 → Jan 13
Y4) both hit it; runs 02/03 (Mar 1 / Apr 10 anchors) never did. The bursty
pattern makes it *certain*: the birth anchor is Jan 1 by construction and
the burst is Jan–Mar, so maturity — whenever the second stage-year closes —
lands inside the burst, in calendar winter. *Tuning:* adopt 01-V3's pin
(the first bloom = the next spring flush, one-time 4-wave season, bank
evaluated at the bloom's opening) as a REGISTER LINE, not a run convention —
two of five paper archetypes need it.

**05-V2 — [CALIBRATION] A4/D101's stage-year mechanics are ambiguous
(windowed vs cumulative), and the strict-windowed reading dead-locks every
sub-200-day user.** The bursty user at 129 active days/yr: windowed →
zero stage-years forever → stuck SAPLING forever → B3/B4/B5 never tick →
the tree can never mature or bloom. The register's own calibration note
(D090/B4: every-other-day = ~13.2 months per stage-year = 200/183) proves
the cumulative reading is intended — but the text ("≥200 active days in
the anchored 365-day window") says otherwise. The B3 timing flag the task
asked for: **1.55 calendar-years per stage-year is the honest cumulative
calibration — NOT too slow, but emotionally expensive: 90 days of maximal
life read as slow growth while 218-day users get pioneer speed (~year
1.8).** *Tuning:* (a) state the cumulative accrual in A4 ("stage-years
accrue from qualifying active days, 200 per stage-year; the window is the
accrual frame, never a per-window gate"); (b) the why-panel owns the
volume-vs-intensity sentence ("your tree grows at the pace of presence,
not intensity").

**05-V3 — [CALIBRATION + SEMANTICS — the mandated phyllodes flag] The
RESOURCE axis is blind to rhythm: feast-famine reads as mild drought, and
E3 opens for the archetype that is the OPPOSITE of sparse-stubborn.**
RESOURCE = events ÷ ACTIVE days ÷ 20 — the active-day normalization hides
the 9-month void (39 quiet days at 1 event each average cleanly into the
year). A user who logs 3 meals, 3 habits, a gym session and a journal page
for 90 days straight — then goes weekly — reads 0.21–0.28, squarely under
E3's ≤0.4. The phyllode character (drought armor + D095's evergreen
override) then CONTRADICTS the archetype's honest visual: the bursty tree's
9-month quiet is its own winter; it should go bare and flush — not wear
evergreen armor. The axis model conflates "survives on little" with
"feasts and famines by calendar." *Tuning:* (a) add a RHYTHM gate to E3:
resource ≤0.4 **AND rhythm ≥0.5** (steady sparsity only — the 02/03
sparse users keep phyllodes; the bursty user loses it); (b) give the
feast-famine signature its own honest character — a rhythm-native,
subtle-tier adaptation (seasonal storage/deciduous flush — mostly visual +
copy: the dense spring flush IS the character; the why-panel says "your
tree stores its January and spends it in March"); (c) at minimum, the
phyllodes why-panel must not claim drought.

**05-V4 — [UNREACHABLE, 3rd recurrence] E6/E7 can never open — the 90-day
wall.** Max consecutive-day streak in ANY domain = the burst length (90).
II-3 (100-day) dies by 10 days, every April; II-4/13, III-22, IV-5, and
every yearly chain die with it; E6 has no referent (01-V8/03-V-4); E7's
trophy is habit-locked AND now wall-limited. The "consistency compounds"
spine of D088 C fails for the third archetype in a row. *Tuning:*
(a) cadence-relative armor (01-V8's proposal): thorns = 52 consecutive
weeks with ≥1 session; for THIS archetype that still fails (39 zero-gym
weeks/yr) — the armor must also read the journal: 52 consecutive weeks
with ≥1 entry (holds every year here ✓); (b) fix E6's referent;
(c) or document armor as daily-practice-only and give the comeback-
economy its own mark (E9 ×4 is already the honest one).

**05-V5 — [UNPINNED] The dormancy/revival trigger threshold is undefined —
and it is this archetype's load-bearing number.** E9's 4 revivals are the
user's true structural story, but the register never says when a branch
flips `dormantSince` (14 days? 30? a period of the domain's own cadence?)
— the whole revival record, the E9 signature, and the dormant copy hang on
it. *Tuning:* pin a per-class dormancy gap (e.g., ≥14 consecutive absent
days for daily-class domains, ≥30 for weekly-class) + "the revival = the
first in-window event after a dormancy"; the why-panel states both.

**05-V6 — [EMOTION — the mandated quiet-stretch flag] The honest quiet
needs pattern-aware copy, or it reads as failure for 9 months of the
year.** The dormancy visuals themselves are correct (D114(1) — no
protected absence, no "resting" label, scale-wrapped habit buds, thin
journal canopy). But three copy risks: (a) month-by-month "dormant"
narration accumulates into shame; the panel must narrate the CYCLE
("13 weeks on, 39 off — your tree knows your rhythm"); (b) the seasonal
inversion must be owned ("your January is this tree's spring; the winter
bank becomes the March flush"); (c) the revivals (E9 ×4) are the
anti-shame structure — the comeback is the identity, the gap is the
setup. *Tuning:* an emotional copy-language pass (D114's deferred item)
with the bursty pattern as a test case; never "resting" for unprotected
quiet; always the pattern.

**05-V7 — [ECONOMY, 3rd recurrence, new engine] The repeatable flood: ~91%
of the bank is re-fires, and the annual detrain-reset re-opens the PR
faucet every January.** III-3 ×136 + III-20 ×65 ≈ 48% of the lifetime
bank; the first bloom shows 60 of ~300 (20%); the pending queue is
permanent. Same fix list as 01-V7 (cluster-merge re-fires into
count-badged flowers; batch on-earn into the ≤4 waves) — plus one
archetype-specific note: the detrain-reset means the faucet is *seasonal*,
so the cluster-merge should be per-burst ("your January PR run blooms as
one flower + a count"). Also relevant: the C3 cluster mechanism (≥30 buds
→ habit clusters) fires for this user by construction — the habit
branch's 45 Perfect-Month repeatables are exactly what C3 was drawn for;
keep them pre-bloom.

**05-V8 — [COHERENCE, 3rd recurrence] 16 Ring-tier flowers (III-26 ×4,
II-12 ×12) bloom at a trunk that never brands a ring.** The no-ring
outcome is CORRECT and verified (4-of-7 life; D090 C / D101(1) / D104 /
D114(3)); the contradiction is the bank copy + the Ring-tier trophies'
family identity as before (01-V1, 02-V5). *Tuning:* carry 01-V1's three
options forward (the why-panel trunk-vs-branch split, the single ring
definition, the domain-relative partial-ring option); note the bursty
user would earn a 4/7 sliver under the partial-ring option — the
"four-domain ring" is a legible seasonal brand.

**05-V9 — [CALIBRATION] Two gate-deciding margins sit on the same axis
implementation details.** (a) BALANCE 0.6884 vs E2's 0.7 — the bursty
user misses buttress by 0.012 under the canonical-7 norm (01-V6's
unpinned norm is now razor-thin: under an observed-domains norm
(H/ln4 = 0.97) the balance leg passes and only the resource leg blocks —
the gate's shape changes with the norm). (b) RHYTHM clamps at 0.0 — CV
1.04 floors the axis; a user at CV 0.9 and a user at CV 1.5 read
identically, and the axis under-reads until a full cycle exists (§8).
*Tuning:* (a) pin the canonical-7 norm in the register (01-V6's
recommendation — this run makes it load-bearing); (b) report raw CV
alongside the clamped axis, or give the formula a soft floor, so the
why-panel can say "the most bursty rhythm the tree can read."

**05-V10 — [MINOR, 3rd recurrence] B2 15-vs-20 (register vs D115(1)) and
E6's missing referent remain unreconciled.** Harmless here (both B2
readings land in the first burst) — but the record drift is now three
runs old; freeze 15 (01-V12's recommendation) and add the missing 365-day
streak trophy or fix E6's citation.

---

## 10. Verdict

**The BURSTY user is the seasonal-coherence run: the winter-bank→spring-
flush machinery, the return economy, the rhythm pole, and the honest quiet
all work exactly as designed for a life the designers never named — and
three calibration gaps make the tree's rendered story wrong at the
moment it matters most.**

What PASSES cleanly: the stage ladder under the cumulative reading (B2 in
the first burst ✓, maturity at year 3.04 — the honest answer to "year 4–5?"
is 3.04, and the task's gym-arithmetic was wrong: the ≥90-day domain is
journal (129), never gym (52)); the twigs (3/yr/domain, honest, C5 never
binds); the 4-of-7 no-ring outcome (verified against D090 C / D101(1) /
D104 / D114(3) — a four-domain life never brands a ring, and that is the
design's stated intent); the 16 Ring-tier flowers and their winter-pinned
banking; the bloom economy (C1/C2 hold mechanically, nothing lost);
**E9's four revivals** (the comeback record — the archetype's true
structural signature); **E14's scale-wrapped habit buds** (the 9-month
quiet's most honest organ); **III-24 ×4 and II-11 ×12** (the return
trophies — the design's return-economy, perfectly matched); **the RHYTHM
axis's 0.0 pole** (perfect discrimination vs the steady archetypes); and
the D095 seasonal skeleton (the burst straddles the season boundary and
the winter-bank handles it cleanly — the tree's densest moment is exactly
the user's return).

What FAILS as written: **the first bloom fires in winter** (05-V1 — now
structural for Jan-born bursty users; two of five runs need the spring-
flush pin); **the phyllodes character** (05-V3 — the axis conflation the
task flagged: RESOURCE's active-day normalization hides the famine,
feast-famine reads as drought, and the archetype that should go bare and
flush wears evergreen armor); **the armor gap with the 90-day wall**
(05-V4); the **dormancy threshold** (05-V5 — E9's four revivals hang on an
undefined number); the **quiet-stretch copy** (05-V6); and the **~91%
repeatable flood** (05-V7 — with the January detrain-reset as a new
faucet engine). Plus the carried recurrences: Ring-tier flowers on a
ringless trunk (V8), the two gate-deciding axis margins (V9), the B2/E6
record drifts (V10).

**Run verdict: FAIL-as-written on the character and the schedule, PASS on
the skeleton and the economy.** The seasonal machinery, the return
economy, and the honest quiet are the design working as intended — the
bursty user's tree is *nearly* right. Fix, in the dev tools: the
spring-flush pin for winter maturity (V1), the A4 cumulative wording (V2),
the rhythm gate on E3 + the feast-famine character (V3), the dormancy
gap + revival pin (V5), the pattern-aware quiet copy (V6), then re-run
this archetype.

**Priority tuning order:** 05-V1 (winter maturity — register line) →
05-V3 (phyllodes semantics + rhythm gate) → 05-V5 (dormancy/revival
threshold) → 05-V2 (A4 wording) → 05-V6 (quiet copy) → 05-V7 (per-burst
faucet clustering) → 05-V9 (F6 norm + RHYTHM floor) → 05-V4 (armor) →
05-V8 (partial-ring option) → 05-V10 (record drifts).