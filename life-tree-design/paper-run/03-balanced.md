# PAPER ARCHETYPE RUN 03 — "BALANCED" (the 5-year ideal life)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains) + Artifact 3 (trigger-correlation) + the D090–D115 records
in TEMP-PLANNING.md (D092/D093/D095/D096/D099/D100/D101/D102/D103/D105/D114/
D115 read in full). **Trophy conditions verified against:** scan-outputs/
02-achievements.md (verbatim per-trophy conditions, families I–IX + rungs) +
ACHIEVEMENT-SCAN.md (family/tier ladders). **Cross-references:** run 01
(gym-heavy) V1–V12, run 02 (journal-only) V1–V10 — cited where they touch this
pattern. **Run note:** supersedes the earlier draft of this file; §9 lists the
corrections (per-habit Grove fires, III-22, I-12 timing, I-15 dates, the bank
recount).

---

## 0. The synthetic user

A 5-year user, the "ideal" life. Pattern (per the archetype brief): **journal
1 entry/day (~200 words), 6 habits completed/day, 3 gym sessions/week (4 real
sets each), 3 meals logged/day, 1 weigh-in/week (first-of-day), 1 photo/week,
1 task completion/week, 1 coach check-in/week.** Every event written same-day
(in-window, the D100 predicate — the A1 grace never used), none imported, none
future-dated (F10). One frozen birth anchor: **Apr 10 Y0** — the first
in-window event (the day-1 journal entry), frozen per D090 B / D100(5) / D102.
Walk = day 1 … day 1826 (Apr 10 Y5), checkpoints at Day 1 · Month 3 · Year 1 ·
Year 2 · Year 3 · Year 5 (each "Year N" checkpoint = the N-th anchored window
close, day 365×N; day numbers inclusive, 365-day years).

| Domain | Cadence | In-window days/yr | A2 qualifying rule |
|---|---|---|---|
| Journal (`journal.created`) | 1/day, ~200 words | 365 | ≥40 words, non-imported ✓ |
| Habits (`habit.completed`) | 6 habits/day | 365 | 1 completion ✓ |
| Gym (`workout.completed`) | 3/wk (Mon/Wed/Fri), 4 sets | 156 | ≥1 real logged set ✓ |
| Nutrition (`nutrition.logged`) | 3 meals/day | 365 | ≥1 real food-log ✓ |
| Body (`body.weighed`) | 1/wk, first-of-day | 52 | 1 canonical weigh-in ✓ |
| Media (`media.added`) | 1 photo/wk | 52 | 1 add ✓ |
| Goals (`task.completed`) | 1/wk | 52 | task.completed ✓ |
| Coach (check-ins) | 1/wk | — | coachEngagement feed (E11) |

**Assumption set (stated, then applied — every count in this run is derivable
from these):**

- **A1 — weekday model.** The anchor day (Apr 10 Y0) IS a Monday: the first
  gym session, weigh-in, and photo all land day 1. (Sensitivity: if the anchor
  falls on a non-gym day, IX-2 Six for Six moves to the first gym+weigh-in+
  photo day ≤ d7; the crown date shifts, the crown itself does not — it is the
  first-earned Grove by ~1.5 years under any reading.)
- **A2 — no fixed clock slots.** I-4 Same Time Every Time, II-9 Like
  Clockwork, V-3 Same Hour Same Scale, IV-5 No Deviation are NOT earned (no
  slot pinned). **Correction to the prior draft: III-22 The Schedule Never
  Breaks IS earned** — its condition is the exact weekday-SET (Mon/Wed/Fri
  forever), not a clock slot; the fixed weekday pattern satisfies it. IX-5
  Ghost in the Machine still never fires (needs II-9 + IV-5 too).
- **A3 — no phase entities** → IV-3/4/5/8/9/10/11/12, III-23, V-4, I-14,
  V-10..V-16 (weight ladder) unearned.
- **A4 — no PR numbers in the brief** → the PR/rung block (III-3..III-10,
  III-12..III-20, R1–R47, IX-4) is EXCLUDED from the primary count and
  reported as an assumption-gated supplement only (like run 01's A3/A4).
- **A5 — photos only, no vlogs** → every VII trophy is vlog-gated (VII-1…12)
  and IX-3 The Living Archive (100 vlogs/yr) never fire.
- **A6 — no vacations logged** → VI family unearned.
- **A7 — one live long-horizon goal (>1 yr, in progress)** → E8 tendrils
  opens (the brief's 1 task/week implies goals exist).
- **A8 — no gaps, no rest-plans, no dormancy** → I-11, II-10, II-11, III-24,
  E9/E10 unreachable by construction (see §6); II-6/II-8/III-21/III-22/V-2
  re-fire at their full repeatable cadence (never-breaking runs).
- **A9 — I-12 Same Question, New Answer timed per the spec's literal
  "N distinct years" reading:** the 2nd/3rd/5th distinct year with an
  Apr-10 entry → Branch d365 (Apr 10 Y1), Heartwood d730 (Apr 10 Y2), Grove
  d1461 (Apr 10 Y4). (The prior draft's "Grove at Y5" reads "5 years apart";
  the spec text reads distinct years — see §9e.)

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 2 drifts)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | 40-word journal, real set, real food-log, canonical weigh-in, 1 habit, 1 media add |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ as written | **Weekly-cadence domains can never pass — V-2** |
| A4 | stage-year ≥200 active days | ✓ | 365/yr → 1 stage-year/yr |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ | All 7 pass every year → **ring 1 at year 1** |
| B1 | first in-window event | ✓ | Apr 10 Y0, day 1 |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | Day 15 (30/30) — *insensitive to the 15-vs-20 record drift (V-6)* |
| B3 | 1 stage-year | ✓ | Apr 10 Y1 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Apr 10 Y2 (journal 365) — maturity ~year 2, IN-SEASON (spring) |
| B5 | ≥10 stage-years | n/a | 5/10 by Y5 |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 60 of a ~335-bud bank — overflow is structural (V-1) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | Holds; the queue never drains (V-1) |
| C3 | ≥30 buds/branch → clusters | n/a | 6 habit-buds < 30 |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ | Crown = IX-2 (day 1); per-bloom legends pinned (V-8) |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | ✓ | Caps at 12/yr on 3 branches; 0 on 4 (V-2) |
| C7 | bank counter top-3 + count | ✓ | "top 3 + ~300 more" at Y5 (V-1) |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | d730 / d1095 / d1826 |
| E1–E14 | signatures | ✓ read | See §6 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | Apr 10 anchor: maturity and every bloom land IN-SEASON (no winter clash — run 01's V3 never touches this pattern) |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | 0.55–0.64 — **ceiling reads high; the E2 gate hangs on the count (V-3)** |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ | 1.0 |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ | 0.85 |
| F7 | TENURE = stage-years/10 | ✓ | 0.1 → 0.5 |
| F8 | replay ~2s/yr | ✓ | 5-yr time-lapse ≈ 10s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records
≥20 (02-V1, 01-V12). This archetype is insensitive (30/30 in the first
window) — but the drift is real and must freeze (V-6).

**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; no trophy in ANY family is a 365-day streak (II-4 The Long Haul
is 500-day; II-12 is an anniversary touch). E6 has no referent as written —
**V-4** (02-V3 / 01-V8's armor-gap finding, extended: this user HAS habits,
so thorns fire under either reading — the text is still broken).

---

## 2. The walk

### CHECKPOINT DAY 1 — Apr 10 Y0 (the seed cracks)

- **B1 tick:** first in-window event (journal entry, ~200 words) → SEED →
  SEEDLING. Germination ceremony (D094: crack, root curl, stem rise, 5
  branch-buds on the stem).
- **Events:** journal 1, habits 6, gym 1 session (4 sets, Mon), meals 3,
  weigh-in 1, photo 1, task 1, coach check-in 1.
- **Earned today (buds):** I-1 Ink on the Page (S) · II-1 Day One (S) ·
  III-1 First Rep Logged (S) · IV-1 First Plate Logged (S) · V-1 First
  Measurement (S) · IX-1 Full Circle Day step 1 (S — journal+habits+gym+
  nutrition on one dayKey ✓) · **IX-2 Six for Six (GROVE — all six domains on
  one dayKey: journal, habits, gym, nutrition, body, media ✓, per A1).** Bank
  = 6 S + 1 G = **7 buds**.
- **The future crown is already in the bank:** IX-2, earned on day 1, is the
  first-earned Grove ever (the next Grove — II-4 The Long Haul — lands day
  500) → C4's crown is fixed from day 1, with a ~3-year wait to bloom (D096's
  special banked form carries it: a Grove bud visibly outranks the bank).
- **Axes:** RESOURCE 0.64 (12.7 events on 1 active day) — the axis "forms"
  over ~30 days · RHYTHM ~1.0 · BALANCE degenerate at n=1 (forms ~day 30) ·
  TENURE 0.
- **Rings 0 · Twigs 0.** **Why-panel:** "SEEDLING · age 1 day · 7 buds,
  including your legend-to-be: Six for Six, a Grove — it blooms at the first
  annual bloom after maturity."

### CHECKPOINT MONTH 3 — Jul 10 Y0 (day 91)

- **B2 tick (day 15, Apr 24):** ≥15 in-window days in the first 30-day
  window (30/30 — journal+habits+nutrition daily) → SEEDLING → SAPLING.
  Branch-buds → the first twigs.
- **Twigs (A3, ≥15 days/30-day month):** journal 3, habits 3, nutrition 3
  (Apr partial 21/21 + May + Jun — all ≥15). **Gym 0** (12–13 days/30-day
  window — 3/wk < 15). **Body-forks 0 · media-forks 0 · goals 0** (4–5
  days/30-day). **The "balanced" tree is already twig-unbalanced: 3 of 7
  presence domains grow twigs (V-2).**
- **Bank at d91 (≈57 buds):** S 6 · R 12 (I-2 d7 · I-6 d50 · II-2 ×6 d7 ·
  III-2 d5 · IV-2 d30 · V-2 Steady Hand d84 · IX-1-R d22) · B 38 (I-3 d90 ·
  II-6 ×18 (6 habits × 3 months) · II-7 Five Strong d7 · II-8 ×4 · III-21
  Trimester of Iron d84 · VIII-6 A Week Whole ×13) · G 1 (IX-2).
- **First winter (Dec 1 Y0, d236) is ahead:** winter earns (II-6 ×18, VIII-6
  ×13, II-8 ×4, III-21 week 36) bank as flower-buds (D095); pre-maturity
  springs = bud-swell, not bloom. Nothing blooms in winter.
- **Axes:** RESOURCE 0.55 (11.0 events/active day ÷ 20) · RHYTHM 1.0 · BALANCE
  0.85 (stable from ~day 30) · TENURE 0.
- **Why-panel:** "SAPLING · age 3 months · ~57 buds · your journal, habits
  and nutrition branches extend; the gym, body, media and goals branches have
  presence but no twigs — the twig bar wants 15 days in a month, your weekly
  cadences give 4–13."

### CHECKPOINT YEAR 1 — Apr 10 Y1 (day 365)

- **B3 tick:** stage-year 1 closes (365 active days ≥ 200) → SAPLING → POLE.
  Pole-rise ceremony (D094). Leaf granularity unlocks (C6).
- **FIRST RING — the task's headline question, answered: ring 1 brands at
  year 1.** The anchored ring-year closes with the CANONICAL 7 presence
  domains each ≥ 40 in-window days (journal 365 · habits 365 · gym 156 ·
  nutrition 365 · body 52 · media 52 · goals 52) → A5 passes → **ring sliver
  1 on the trunk (Apr 10 Y1)**.
  - **VIII-11 Pith (Sprout, rings ≥ 1) fires — ON THE TRUNK.** Its D092
    bloom: pre-maturity Sprout-tier → it does NOT bloom today; it banks in
    the tier-marked special form and **bursts at the first bloom (maturity,
    Apr 10 Y2)**, trunk-attached (VIII = trunk trophies) ✓.
  - VIII-12 Medullary Ray (Root, rings ≥ 2) not yet (ring 2 = Y2).
- **Same-day boundary (02-V6's pin applied):** the year-1 close hosts a
  cluster of window-closing earns ON d365 — I-5 Full Orbit, II-5 Full Year
  One Habit ×6, II-12 One Trip Around the Sun ×6, VIII-1 One Year In, VIII-5
  Life Fully Logged, I-12 Same Question New Answer-Branch — all participate
  at this checkpoint. (III-26 A Year on the Bar fires d366 inside its ±7d
  band; counted here with the boundary note.)
- **Bank at d365 (≈198 buds):** S 7 (+VIII-11) · R 13 (+I-9-R, 25k words
  d125) · B 151 (I-3 · I-12-B d365 · II-6 ×72 · II-7 · II-8 ×17 · III-21 ×4 ·
  IV-6 d180 · V-5-B d183 (photo gap ≥6 mo) · V-7 Frame by Frame d174 ·
  VIII-6 ×52 · IX-1-B d115) · H 11 (II-3 ×6 d100 · II-13 d100 · VIII-5 d365 ·
  III-22 ×2 d182/d364 · V-5-H d366, boundary) · Ring 15 (I-5 · II-5 ×6 ·
  II-12 ×6 · III-26 · VIII-1) · G 1.
- **Adaptations (textures):** E7 spines — II-3 at d100 → subtle texture from
  ~day 100 (no gate beyond the SAPLING floor ✓). E11 mycorrhizal — 52 coach
  check-ins by now (owner threshold undefined — 02-V7; see §6). E8 tendrils —
  the long-horizon goal (A7).
- **Twigs:** journal 12 · habits 12 · nutrition 12 (exactly at C5's cap);
  gym/body/media/goals 0 (V-2).
- **Why-panel:** "POLE · age 1 · ring 1 · ~198 buds (1 Grove — your crown —
  and 15 Ring) · the Pith trophy rides the trunk and bursts at the first
  bloom · next tick: MATURITY at 2 stage-years."

### CHECKPOINT YEAR 2 — Apr 10 Y2 (day 730) — MATURITY + THE FIRST BLOOM

- **B4 tick:** stage-year 2 closes (365) AND journal's best anchored year =
  365 ≥ 90 → **POLE → MATURE** (pioneer-speed, ~year 2 — the register's B4
  calibration exactly; the D115 days-based gate works as designed). **D1
  floor (2 stage-years) met. Ring 2 brands** (VIII-12 Medullary Ray, Root,
  fires today).
- **The FIRST BLOOM (D092(2) + D094 ceremony, 8–12s, soft bloom rain,
  skippable):** all banked Sprout/Root/Branch/Heartwood buds burst. **Apr 10
  is spring (Mar 1–Nov 30, F2) — the first bloom IS the spring flush; the
  run 01 winter-maturity clash (01-V3) cannot occur for this anchor.**
  - **The S/R/B/H bank at this instant ≈ 335 buds:** S 7 · R 14 (VIII-12
    included) · B ~298 · H 16 (II-3 ×6 · II-13 · VIII-5 ×2 · III-22 ×4 ·
    V-5-H · I-15 Bookended d631 — winter-earned, pre-maturity → bursts here
    per D095(1) · I-12-H d730 — same-day, participates per the 02-V6 pin).
  - **C1/C2 check (the wave math):** 15 flowers/event × 4 waves = **60 bloom
    this season**, composed in magnitude order per D099 (Heartwood 16, then
    Branch 29, then Root 14, then Sprout 1 — the top 60 of 335). **~275 buds
    overflow to the next spring (Mar 1 Y3 flush, d1055) — no flower lost;
    the bank counter shows the pending count (C7).** C1 ✓ (≤15/event) · C2 ✓
    (4 waves). Mechanically compliant — but the ceremony shows 18% of the
    bank; the cherry-blossom moment is a fraction of the earned life (V-1).
  - **VIII-11 Pith bursts ON THE TRUNK** (Sprout, trunk attachment) — the
    first-ring trophy's D092 bloom moment ✓. VIII-12 Medullary Ray bursts.
  - **Ring-tier (30) and Grove-tier (7) stay banked** (D092(2)): Ring — I-5
    ×2 · II-5 ×12 · II-12 ×12 · III-26 ×2 (yr2 band d731, boundary) · VIII-1
    · VIII-2. Grove — IX-2 (d1) · **II-4 The Long Haul ×6 (d500 — six
    habits × 500-day streaks)**.
- **Adaptations — pending:** **E6 thorns** — II-4 (the streak-trophy
  referent; the register's "365-day" text has no referent, V-4) earned d500 +
  D1 floor opens today → the habit branch enters the visible PENDING state
  ("your six 500-day streaks earned this branch's armor — the thorns grow at
  the next spring's growth", D093). Manifestation = the Mar 1 Y3 annual
  bloom. **E2 buttress: still closed** — balance 0.85 ✓ but the resource leg
  reads 0.55 (conservative count) < 0.6 at the locked ceiling (V-3); D2 (3
  stage-years) also only opens next year.
- **First fruits:** the matrix gates fruits to the first bloom +1 season →
  the first goal fruits hang autumn Y2 (D095).
- **Axes:** RESOURCE 0.55–0.64 · RHYTHM 1.0 · BALANCE 0.85 · TENURE **0.2**.
- **Why-panel:** "MATURE · age 2 · rings 2 · the first bloom burst 60 of
  ~335 flowers — ~275 wait in the bank for the spring flush · your crown
  (Six for Six) and six 500-day chains wait too · thorns pending on the
  habit branch · next: the annual bloom, Mar 1 Y3."

### CHECKPOINT YEAR 3 — Apr 10 Y3 (day 1095) — THE ANNUAL BLOOM + THE CROWN

- **Ring 3 brands** (VIII-13 Oak, Branch, d1095 — fires on earn, growing
  season).
- **The annual bloom (Mar 1 Y3 = d1055):** the winter bank → spring flush
  (D095) + the first-bloom overflow + Ring-tier + the first Grove
  transformation, one heartbeat (D093):
  1. **Overflow + winter bank:** ~275 first-bloom overflow + post-maturity
     earns since d730: I-8 A Thousand Entries (d1000, growing season → ON-
     EARN direct bloom per D092(3)), IV-7 The Long Table (d1000, on-earn),
     II-6 ×~42, VIII-6 ×~30, II-8 ×~10, III-21 ×2 winter-banked → the 60-
     flower season fills instantly again; the queue stays permanent (V-1).
  2. **Ring-tier (45 by now):** I-5 ×3 · II-5 ×18 · II-12 ×18 · III-26 ×3 ·
     VIII-1 · VIII-2 · **IX-1 Full Circle Day-Ring (d855, the 365th
     full-circle day)** — all bloom at the annual bloom (D092(4)) ✓.
  3. **THE CROWN (C4):** the first-earned Grove — **IX-2 Six for Six (day
     1) — manifests as THE transformation on the crown center** (IX =
     crown-center attachment; D112 identity check: syconium needs balance
     ≥0.6 → 0.85 ✓). Legend once-set (legendAchievementId = IX-2, D107),
     persists through winter (D115(5)).
  4. **II-4 The Long Haul ×6 (Grove, d500):** banks until the next annual
     bloom after maturity → manifest now as **LARGE blooms** (not the
     transformation — C4's 1-legend-per-bloom cap).
  5. **D093 adaptations manifest at the annual bloom:** **THORNS grow on the
     habit branch** (II-4 + tenure 2 + SAPLING floor ✓ — pending since
     d730). **Buttress: NOT YET as-locked** — resource 0.55 < 0.6 at the
     locked F4 ceiling (V-3); in the calibrated world (ceiling 16 → 0.69)
     it opens at the Mar 1 Y4 bloom.
- **The year-3 chain Groves earn TODAY (Apr 10 Y3 = d1095, AFTER the Mar 1
  Y3 bloom):** I-16 Three Years Still Talking · II-14 Three Years No Missing
  Links ×6 (per habit) · III-27 Three Years in Iron · IV-13 Three Years on
  the Line · V-8 Three Years in Frame · V-5-Grove (3-year photo pair, d1096)
  · VIII-7 The Three-Year Vow — **12 Groves on one dayKey** → bank to the
  Mar 1 Y4 bloom. **Mar 1 Y4's legend (C4, rarest of the set) = VIII-7 The
  Three-Year Vow** (the Vow cluster — the design's "hardest to fake"
  family); the other eleven manifest as large blooms (the tiebreak rule,
  V-8).
- **Bank at d1095 (≈551 buds):** S 7 · R 14 · B 444 · H 22 (I-8 · IV-7 ·
  I-15 d996 winter→spring Y4 flush · VIII-5 ×3 · III-22 ×6) · Ring 45 · G 19.
- **Axes:** TENURE **0.3** (D2 floor met). **Why-panel:** "MATURE · age 3 ·
  rings 3 · crown: Six for Six — the tree's once-in-a-lifetime
  transformation · thorns grown · the year-3 chain of 12 Groves waits for
  spring Y4 · ~300 flowers pending (C7)."

### CHECKPOINT YEAR 5 — Apr 10 Y5 (day 1826) — FINAL STATE

- **Rings 4 and 5 brand** (Apr 10 Y4 = d1461: VIII-14 Sapwood, Branch; Apr
  10 Y5 = d1826: VIII-15 Ironwood, Heartwood — on-earn, growing season).
- **Annual blooms:** Mar 1 Y4 (d1420) = legend **VIII-7** + eleven large
  chain blooms + the standing overflow · Mar 1 Y5 (d1785) = legend
  **I-12 Same Question New Answer-Grove** (d1461 — the only Grove earned
  between the Y4 and Y5 blooms; no tiebreak) + I-5(4)/II-5 ×6/II-12 ×6/
  III-26(4) Ring-tier + overflow (the queue never drains — V-1).
- **The year-5 chain Groves earn Apr 10 Y5 (d1826), AFTER the Mar 1 Y5
  bloom** → I-17 Half a Decade of Honesty · II-15 Five Years No Missing
  Links ×6 · III-28 Five Years in Iron · IV-14 Five Years on the Line · V-9
  Five Years in Frame · VIII-3 Five Years · VIII-8 The Five-Year Vow — **12
  Groves bank to spring Y6** (out of window; spring Y6's legend would be
  VIII-8, per V-8).
- **Final axes:** RESOURCE **0.55–0.64** (mid — the ideal life reads
  "mid-high" only at the optimistic count; V-3) · RHYTHM **1.0** (perfect) ·
  BALANCE **0.85** (verified below) · TENURE **0.5** (5/10; D3 floor met).
- **Twigs:** journal 12 · habits 12 · nutrition 12 in the retention window
  (36 render individually, 24 merged to woody character per C5's 3-yr
  window); **gym/body-forks/media-forks/goals: 0 twigs in 5 years** (V-2).
- **Rings: 5** — all 7 domains ≥ 40 days every anchored year. VIII-11..15
  (Sprout..Heartwood) all fired; VIII-16 Cambium (≥6) waits for Y6.
- **Lifetime bank ≈ 894 flower events:** S 7 · R 14 · B ~736 (II-6 ×360 ·
  VIII-6 ×260 · II-8 ×85 · III-21 ×21 · +10 one-times) · H 32 · Ring 73 ·
  **Grove 32** — the exact composition in §4.
- **Standing visible state:** ~1 season's blooms (ephemeral per D095) + a
  permanent pending queue of ~300+ (C7: top 3 by tier + "+N more") —
  **92% of the lifetime bank is repeatable re-fires (V-1).**
- **Why-panel (year 5):** "MATURE · age 5 · stage-years 5 (of 10 to
  OLD-GROWTH) · rings 5 · crown: Six for Six · thorns on the habit branch ·
  axes: rhythm 1.0 / balance 0.85 / resource 0.55–0.64 · bank: 32 Grove,
  73 Ring, ~790 more · your trunk brands a full ring every year — the
  canonical-7 brand, the thing the single-domain trees can never have."

---

## 3. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | **0.55–0.64** (11.0–12.7 ÷ 20: journal 1 + habits 6 + nutrition 3 = 10 base; gym 0.43 · body 0.14 · media 0.14 · goals 0.14 · coach 0.14) | mid — **the register's own D105 deferral; the E2 gate hangs on it (V-3)** |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **1.0** (7/7 every week, stddev 0) | perfect — flat by construction |
| F6 BALANCE | Shannon evenness, canonical 7 | **0.85** (p = (0.259, 0.259, 0.111, 0.259, 0.037, 0.037, 0.037) → H = 1.659 → H/ln7 = 0.853) | high, multi-domain |
| F7 TENURE | stage-years ÷ 10 | 0.1 → **0.5** | mid |

**Stage ticks (B-group):** B1 day 1 · B2 day 15 · B3 Apr 10 Y1 · **B4 Apr 10
Y2 (maturity ~year 2 — the register's pioneer-speed calibration ✓; Apr 10 =
spring, so the first bloom is naturally the spring flush — run 01's winter
clash (01-V3) is anchor-dependent, and this anchor avoids it)** · B5 at year
10 (5/10).

**Twigs per domain (A3):**

| Domain | In-window days/30-day month | A3 bar | Twigs |
|---|---|---|---|
| Journal | 30 | 15 | 12/yr ✓ |
| Habits | 30 | 15 | 12/yr ✓ |
| Nutrition | 30 | 15 | 12/yr ✓ |
| Gym | 12–13 (3/wk) | 15 | **0 forever** (V-2) |
| Body (forks) | 4.3 (1/wk) | 15 | **0 forever** |
| Media (forks) | 4.3 (1/wk) | 15 | **0 forever** |
| Goals | 4.3 (1/wk) | 15 | **0 forever** |

**Rings (A5):** journal 365 · habits 365 · gym 156 · nutrition 365 · body 52
· media 52 · goals 52 — all ≥ 40 every anchored year → **ring 1 at Apr 10 Y1
(the task's question: yes, the first ring brands at year 1) … ring 5 at Y5 —
a full canonical-7 brand.** VIII-11 Pith (Sprout, rings ≥ 1) fires at ring 1;
pre-maturity → **its D092 bloom = the first bloom at maturity (Apr 10 Y2),
trunk-attached** ✓ (run 01's V1 no-ring verdict is the other side of the same
coin: this is the user who DOES brand rings).

**Bank by year (cumulative fires):**

| Checkpoint | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| Day 1 | 6 | 0 | 0 | 0 | 0 | 1 | 7 |
| Month 3 | 6 | 12 | 38 | 0 | 0 | 1 | ~57 |
| Year 1 | 7 | 13 | 151 | 11 | 15 | 1 | ~198 |
| Year 2 (MATURE) | 7 | 14 | ~298 | 16 | 30 | 7 | ~372 |
| Year 3 | 7 | 14 | 444 | 22 | 45 | 19 | ~551 |
| Year 5 | 7 | 14 | ~736 | 32 | 73 | 32 | **~894** |

(±4 on Branch: II-8's 17/30-day window closes and III-21's week closes are
month-close rounding; the final tier composition is exact in §4.)

**The first-bloom burst (the task's headline check):** ~335 S/R/B/H buds
banked at maturity (Apr 10 Y2) → **C1: 15/event ✓ · C2: 4 waves = 60 bloom,
~275 overflow to spring Y3 ✓** — mechanically compliant, economically
strained (V-1: the ceremony shows 18% of the bank). The crown: **first-earned
Grove = IX-2 Six for Six (day 1) → the crown** — no tiebreak ambiguity in
this archetype (V-8 documents the rule the chains would need).

---

## 4. The bank — all 9 families by tier + year by year

**Every fire within the walk, by family (conditions per scan-outputs/
02-achievements.md §3.I–IX):**

| Family | S | R | B | H | Ring | Grove | Total | Never (verified) |
|---|---|---|---|---|---|---|---|---|
| **I Long Conversation** | I-1 d1 | I-2 d7 · I-6 d50 · I-9-R d125 | I-3 d90 · I-7 d500 · I-9-B d500 · I-12-B d365 | I-8 d1000 · I-15 ×4 (d631/d996/d1361/d1726 — winter→spring flush each) | I-5 ×5 (year closes) | I-12-G d1461 · I-16 d1095 · I-17 d1826 | **21** | I-4, I-10, I-11 (no gaps), I-13 (never solitary — habits+nutrition every day), I-14 (no phases), I-9-G (500k words ≈ d2500) |
| **II Unbroken Chain** | II-1 d1 | II-2 ×6 d7 | II-6 ×360 (6 habits × 12 mo × 5 yr) · II-7 d7 · II-8 ×85 (17/21-day window/yr) | II-3 ×6 d100 · II-13 d100 | II-5 ×30 (6 × 5 windows) · II-12 ×30 (6 × 5 anniversaries) | II-4 ×6 d500 · II-14 ×6 d1095 · II-15 ×6 d1826 | **538** | II-9 (no slot), II-10 (no rests), II-11 (no gaps) |
| **III Iron Ledger** | III-1 d1 | III-2 d5 | III-21 ×21 (12-wk runs) | III-22 ×10 (26-wk runs — A2 correction) | III-26 ×5 (±7d bands) | III-27 d1095 · III-28 d1826 | **40** | III-3…III-20, R1–R47 (PR block, A4), III-23 (no phases), III-24 (no gaps), III-25 (780 < 1000) |
| **IV Fuel Line** | IV-1 d1 | IV-2 d30 | IV-6 d180 | IV-7 d1000 | — | IV-13 d1095 · IV-14 d1826 | **6** | IV-3/4/5/8/9/10/11/12 (phase-gated), IV-5 (robot) |
| **V Shape of Things** | V-1 d1 | V-2 d84 (conservative — once; re-fires per 12-wk run are a possible reading) | V-5-B d183 | V-5-H d366 · V-7 d174 | — | V-5-G d1096 · V-8 d1095 · V-9 d1826 | **8** | V-3 (no slot), V-4 (phases), V-6, V-10..V-16 (no weight data) |
| **VI Elsewhere** | — | — | — | — | — | — | **0** | all (no vacations logged, A6) |
| **VII Proof of Life** | — | — | — | — | — | — | **0** | all (vlog-gated; photos only — V-7) |
| **VIII The Rings** | VIII-11 d365 | VIII-12 d730 | VIII-6 ×260 (52/yr) · VIII-13 d1095 · VIII-14 d1461 | VIII-5 ×5 (year closes) · VIII-15 d1826 | VIII-1 d365 · VIII-2 d730 | VIII-3 d1826 · VIII-7 d1095 · VIII-8 d1826 | **275** | VIII-9/10 (10-yr), VIII-16..20 (rings ≥ 6..10) |
| **IX Full Circle** | IX-1-S d1 | IX-1-R d22 | IX-1-B d115 | IX-1-H d231 | IX-1-Ring d855 | IX-2 d1 | **6** | IX-3 (100 vlogs), IX-4 (PRs), IX-5 (robot trio) |
| **TOTAL** | **7** | **14** | **~736** | **32** | **73** | **32** | **~894** |

**The repeatable-faucet share (economy):** II-6 ×360 · VIII-6 ×260 · II-8
×85 · II-5 ×30 · II-12 ×30 · II-2 ×6 · II-3 ×6 · II-4 ×6 · II-14 ×6 ·
II-15 ×6 · III-21 ×21 · III-22 ×10 = **826 of ~894 fires (~92%) are re-fires**
— the balanced life's bank is a repeatable-trophy waterfall (V-1).

---

## 5. The blooms (D092/D095 — every date pinned to the 02-V6 boundary rule)

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | **Apr 10 Y2 (d730) — spring, in-season** | ~335 S/R/B/H buds → **60 bloom (4 waves × 15: H 16, B 29, R 14, S 1, magnitude order per D099); ~275 overflow to spring Y3** · VIII-11 Pith bursts on the trunk · Ring 30 + Grove 7 stay banked | C1 ✓ · C2 ✓ · no winter clash (01-V3 n/a) |
| Annual bloom Y3 | Mar 1 Y3 (d1055) | 60 of the overflow + winter bank · **Ring 45** (incl. IX-1-R) · **IX-2 → CROWN transformation (C4)** · II-4 ×6 large blooms · **THORNS manifest (E6/D093)** · I-8 + IV-7 on-earn (growing season, D092(3)) | C4 ✓ · E6 ✓ |
| Annual bloom Y4 | Mar 1 Y4 (d1420) | 60 of the queue · **legend = VIII-7** (rarest of the 12-Grove Y3 chain — V-8) + 11 large · Ring 12 · (buttress manifests here in the calibrated-F4 world — V-3) | C4 cap ✓ |
| Annual bloom Y5 | Mar 1 Y5 (d1785) | 60 of the queue · **legend = I-12-Grove** (d1461, the only Grove before this bloom — no tiebreak) · Ring 12 · VIII-14 on-earn | C4 cap ✓ |
| Spring Y6 (out of window) | Mar 1 Y6 | the 12 Y5-chain Groves — **legend = VIII-8** (Vow cluster) + 11 large | — |

Winter earns (I-15 ×4, II-6/VIII-6/II-8/III-21 winter months) all bank as
flower-buds → spring flush (D095 ✓); winter journal entries become leaf-buds
on the bare branches (D095(2)). Post-maturity growing-season earns (I-8,
IV-7, VIII-13/14/15, I-12-H/G) bloom on-earn (D092(3) ✓).

---

## 6. The adaptations (E1–E14) — final state at Y5

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.5 → 0.7 at year 7 | **Out of window** (02-V4's wait confirmed — reachable at Y7/Y8) |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | balance 0.85 ✓ · resource 0.55–0.64 | **BORDERLINE — fails the resource leg at the locked ceiling's conservative count (V-3)**; opens at ceiling 16 (0.69–0.79) → manifest Mar 1 Y4 |
| E3 phyllodes | resource ≤0.4 | 0.55+ | No — honest (the ideal life is not sparse) |
| E4 cladodes | divergence ≥0.6 | 0 (never misses) | No — honest |
| E5 storage leaves | media share ≥0.5 | 52 photos / 1826 entries ≈ 0.03 | No — honest |
| E6 thorns | "the 365-day streak achievement" + tenure ≥2 · D1 + SAPLING | **the register's referent does not exist (V-4)**; under the real II-4 (500-day): 6 habits at d500, D1 opens d730 | **Manifests Mar 1 Y3 ✓** (both the 365- and 500-day readings agree on the date — the streaks all precede d730) |
| E7 spines | 100-day streak trophy (II-3) · SAPLING | II-3 ×6 at d100 | Subtle texture from ~day 100 ✓ |
| E8 tendrils | live long-horizon goal | A7 assumption | Texture from ~Y1 ✓ |
| E9 reaction wood + epicormic | a revival — universal | never dormant | **No — honest: the tree never fell** (02's why-panel note applies) |
| E10 contractile | 3 consecutive stage-years with RISING active days | 365 → 365 → 365 — flat | **Structurally unreachable at the ceiling (V-5)** |
| E11 mycorrhizal | coachEngagement owner ≥ threshold (H-03) | 52 check-ins/yr = 260 by Y5, zero opt-outs | **Open — the owner threshold is undefined (02-V7)**; first archetype with real coach volume — record in the H-03 owner spec: high-probability fire |
| E12 stolons | L-10 insight ≥3 monthly windows | not in the pattern | Open/effectively-never (02-V7) |
| E13 bracts | no gate (ceremony) | bloom presentation (no PRs → no F-03 flourish in primary) | Display-only ✓ |
| E14 bud scales | no gate (dormant-habit state) | no dormant habits | None ✓ |

**Structural marks in this life:** thorns (Mar 1 Y3) + spines/mycorrhizal/
tendrils (textures) + buttress (Mar 1 Y4, only in the calibrated F4 world) +
caudex (year 7, out of window). The "ideal" tree wears: 5 rings, the crown
transformation, thorns, and the subtle trio — and NO comeback adaptations
(E9/E10), which is the honest shape of a life with no comebacks (02's
journal-only walk found the same).

---

## 7. Verification (honesty, coherence, schedules, economy, budgets)

**Honesty — PASS with two register drifts.** No farming: every event real,
same-day, in-window (D100), non-imported, qualifying per A2; the anchor is
the first in-window event and never shifts (D102); F10 clean. Nothing
unrewarded: every one of the ~894 fires has a dated expression (D092) — the
only unbloomed things are unearned (I-9-Grove ≈ year 7, III-25 at 780/1000,
VIII-16+ at rings ≥ 6, the robot family, the vlog family). The dead-flat
rhythm (1.0), the missing comebacks (E9/E10), and the missing media flowers
(V-7) are visible truths of a perfect life.

**Coherence — PASS.** Contradictory signatures impossible (caudex vs
buttress both read resource; 0.55–0.64 vs ≤0.4/≥0.6 — no overlap). D112
identity filter: IX-2's syconium needs balance ≥0.6 → 0.85 ✓. The two ring
definitions agree here: A5's canonical-7 ring-year (goals included) AND
VIII-5's six-domain bar both pass every year — the split run 01 flagged as
V1 does not bite this archetype. The D115 days-based B4 gate works (gym
never grew a twig, but 156 gym days ≥ 90 carried the maturity proof).

**Schedules — PASS.** B2 d15 (insensitive to the 15-vs-20 drift — V-6, but
the drift is real). D092: pre-maturity banking → first bloom at maturity
(Y2) → Ring at the annual bloom (Y3) → Grove at the next annual bloom after
maturity (Y3) ✓. D095: winter bank → spring flush ✓ (I-15 ×4, the winter
months of II-6/VIII-6/II-8/III-21). D093: thorns pending d730 → manifest Mar
1 Y3 ✓. The first bloom lands Apr 10 (mid-spring) — run 01's winter-maturity
clash (01-V3) is anchor-dependent; this archetype proves the in-season
anchor path. The same-day boundary (02-V6/01-V9) appears three times — d365
(I-12-B + VIII-11 + I-5 + II-5 + II-12 + VIII-1 + VIII-5), d730 (I-12-H +
VIII-2 + VIII-12 + maturity + the first bloom), d1826 (the Y5 chain + ring 5
+ VIII-15 + III-26(5)) — the pinned rule ("the bank is evaluated at the
bloom's opening; buds whose windows close that day participate") holds
everywhere without an artificial year of deferral.

**Economy — MECHANICALLY PASS, DESIGN-STRAINED (V-1).** C1 (15/event) and C2
(4 waves = 60/season) hold at every bloom; overflow banks with nothing lost;
C7 shows the pending count. But **~92% of the lifetime bank is re-fires**,
the first bloom shows 60 of ~335 buds (18%), and the pending queue is
permanent (~300+ at Y5 — worse than run 01's 82%/38%). The cherry-blossom
moment is a fraction of the earned life.

**Budgets — PASS.** Twigs capped at 12/yr + 3-yr retention on the three
daily branches (C5); habit buds 6 < 30 (no clusters, C3); C4 crown once-set
(IX-2) + one legend per bloom (Y3: IX-2 · Y4: VIII-7 · Y5: I-12-G · Y6:
VIII-8) ✓; D1/D2/D3 floors d730/d1095/d1826 ✓; blooms ephemeral per season
(D095).

---

## 8. Violations & tuning proposals

**V-1 [MAJOR — economy] The repeatable-faucet flood — ~92% of the lifetime
bank is re-fires; the first bloom shows 18% of the bank.** II-6 ×360,
VIII-6 ×260, II-8 ×85, II-5 ×30, II-12 ×30, II-2/3/4/14/15 ×6, III-21 ×21,
III-22 ×10 = 826 of ~894 fires. C1/C2 hold mechanically (no rule broken),
but the design intent — the earned cherry-blossom moment, a readable bloom
economy — is violated in practice; run 01's V7 and the prior draft's V-1
confirmed, and this archetype is the WORST case yet (run 01: 82%). *Tuning:*
(a) cluster-merge repeat-blooms — re-fires of ONE trophy within a season
render as ONE flower + a count badge (the C3 idea generalized; the count
stays honest); (b) batch on-earn flowers into the ≤4 seasonal waves;
(c) per-family bloom caps so II-6/VIII-6 can't saturate. Recommend (a).

**V-2 [MAJOR — presence] The A3 twig bar (≥15 in-window days/30-day month)
is unreachable for every weekly-cadence domain — the "ideal" tree grows
twigs on 3 of 7 presence domains.** Gym = 12–13/30 (max 14 — misses by ONE
day like run 01's V2); body/media/goals = 4.3/30. Five years of the ideal
life and four branches render twig-less. The D115 days-based gates save
maturity (B4 fired on days), but A3's twig render unit was never reconciled
with weekly cadences. *Tuning:* A3 per-class bars (dev-tunable per D105):
daily-class domains (journal, habits, nutrition) keep ≥15/30; weekly-class
domains (gym, body, media, goals) use ≥4/30 (one in-window day per week
sustained). The balanced user then grows 12 twigs/yr on all seven branches
and the canopy matches the log.

**V-3 [MAJOR — calibration] F4's RESOURCE ceiling (20 events/day) makes the
ideal user read 0.55–0.64 — mid, not lush — and the E2 buttress gate (resource
≥0.6) is decided by the optimistic-vs-conservative count.** The register
defers this number to the paper run (D105: "calibrated via the dev tools at
the paper-run step"); the paper run says: the ceiling is too high. A 5-year,
all-in-window, 11–13 events/day user should read lush — the same finding run
01 made from the other side (its 0.05–0.91 unit ambiguity, 01-V4) and run 02
made from the sparse side (02-V2). *Tuning:* F4 ceiling 20 → 16 → RESOURCE
0.69–0.79 → the ideal user reads high-mid/high, the buttress signature opens
(D2 met at Y3 → manifest Mar 1 Y4). Sensitivity: a ceiling of 12 clamps the
ideal user near 1.0 — too lush; 16 is the sweet spot (prior draft's V-3
recommendation confirmed by this walk's recount).

**V-4 [MINOR — register text] E6 has no referent.** E6 says "the 365-day
streak achievement"; family II's long-haul trophy (II-4) is a **500-day**
streak and II-12 is an anniversary touch, not a streak. As written, E6
cannot fire for anyone (02-V3/01-V8's armor gap, third confirmation). This
user HAS habits — under either fixed referent the thorns land at Mar 1 Y3 —
so the bug is text-only here. *Tuning:* E6 cites II-4 explicitly ("the
500-day streak trophy, family II's long-haul tier") or adds a 365-day streak
trophy at the docs pass.

**V-5 [MINOR — signature reachability] E10 contractile (3 consecutive
stage-years with RISING active-day counts) is structurally unreachable for
ceiling users — a flat-perfect life logs 365 → 365 → 365 and can never
rise.** Combined with E9 (no revival), the ideal tree permanently lacks the
comeback arc. *Tuning (two options, pick one):* (a) keep the signature
honest — ceiling users don't earn contractile (botanically true: nothing to
contract toward); add why-panel copy so it never reads as "missed"
(recommended — the register says rising, and rising is impossible by
arithmetic, not by effort); (b) read rising as "≥ prior year AND ≥200" —
but that flattens the rarity.

**V-6 [MINOR — record drift] B2 register vs record: SCHEMA §2.4 = ≥15
in-window days; TEMP-PLANNING D115(1) = ≥20.** Two locked documents disagree
(02-V1, 01-V12). This archetype is insensitive (30/30) — but the drift must
freeze before the engine contract. *Tuning:* freeze 15 (the SCHEMA's own
gloss "the A3 month bar itself" stays true) and amend the D115 record.

**V-7 [NOTE — media] A photo-only media cadence earns media PRESENCE
(rings, balance, twig-eligible days) but ZERO VII flowers — every VII
trophy is vlog-gated, and IX-3 The Living Archive needs 100 vlogs/yr.** The
media-forks bloom nothing for 5 years (prior draft's V-7 confirmed). Not a
violation (conditions are locked), but a photo-heavy ideal user's media
branch is flower-less by construction. *Tuning:* document the vlog-only
reading (recommended — the trophy contract stays) or add photo-driven VII
steps at the docs pass.

**V-8 [NOTE — crown tiebreak] C4's "first/rarest Grove" needs a documented
tiebreak — the year-3 and year-5 chains each bundle TWELVE Groves on one
dayKey.** This archetype's crown is unambiguous (IX-2, day 1 — the first by
499 days), but the Mar 1 Y4 legend (VIII-7 vs I-16 vs II-14…) and the spring
Y6 legend (VIII-8 vs I-17 vs III-28…) need a rule. *Tuning:* crown = the
first-earned Grove; same-day earns break ties by the register's own rarity
hierarchy (the Vow/Old-Growth cluster first). Document it in the
trigger-correlation table (prior draft's V-8 confirmed; run 01's V10 is the
same gap seen from the gym side).

---

## 9. Corrections vs the earlier draft of this file (record, not register
violations)

(a) **Per-habit Grove fires restored:** II-4 (once per habit — 6 fires, not
1), II-14 and II-15 (once per habit — 6 each, not 1) → the Grove count is 32,
not 17. The spec is explicit ("repeatable, once per habit"; "one-time per
habit") and run 02's per-habit discipline for II-2/3/5/12 was already
consistent — the draft undercounted the chain family. (b) **III-22 The
Schedule Never Breaks fires (×10):** its condition is the exact weekday-SET
(Mon/Wed/Fri forever ✓), not a clock slot — the draft's A2 over-generalized
the robot family. Sensitivity: any drifted week restarts the 26-week run.
(c) **III-21 Trimester of Iron re-fires (×21),** not once at d84 — it is
repeatable per closed 12-week run. (d) **I-12 timed per the spec's distinct-
year reading:** Branch d365, Heartwood d730, Grove d1461 — the draft's
"Grove at Y5" reads "5 years apart," which the spec ("across ≥N distinct
years," G2: "fires ONCE at 2, ONCE at 3, ONCE at 5") does not support.
(e) **I-15 Bookended ×4 (d631/d996/d1361/d1726),** not ×5 — Dec 31 Y0 has no
Jan 1 Y0 pair (the user is born Apr 10), and Dec 31 Y5 (d2091) is out of
window; the draft's single I-15 fire undercounted the annual repeat. (f) **The
bank recount ≈ 894 vs ~851:** every delta traces to a stated correction
above; the final composition is fully line-listed in §4. (g) **V-5-H and
III-26(yr1) straddle the year-1 boundary (d365/d366):** counted at the Y1
checkpoint per the 02-V6 same-day pin, with the boundary noted.

---

## 10. Verdict

**The BALANCED archetype is the register's success case — and its loudest
economy alarm.** Everything the tree promises a seven-domain life delivers:
maturity at ~year 2 (B4 days-based, in-season — no winter clash), **the first
ring at year 1 and five canonical-7 rings by year 5**, the VIII-11 Pith
bursting on the trunk at the first bloom, a crown earned on DAY ONE (IX-2
Six for Six — the unambiguous first-earned Grove), thorns on the habit
branch at spring Y3, rhythm 1.0, balance 0.85, every C1/C2/C5 budget holding
mechanically, the winter bank → spring flush exact, and ~894 fires with every
single one dated and honest. The stage/schedule/budget machinery (D092/D093/
D095/D115) survives its most favorable stress test intact — the ideal life
plays the rules exactly as written.

**What fails is concentrated in the same four dev-tool surfaces runs 01/02
found, now at maximum contrast:** (1) the **repeatable-faucet flood** (V-1 —
92% re-fires; the worst archetype yet; the first-bloom ceremony shows 18% of
the bank); (2) the **A3 twig bar's weekly-cadence blindness** (V-2 — the
ideal tree renders 3 twigged branches and 4 bare ones); (3) the **F4 ceiling
miscalibration** (V-3 — the ideal user reads mid and the buttress hangs on a
counting convention); plus the standing register fixes (V-4 E6 referent,
V-6 B2 drift), the two documentation notes (V-5 contractile, V-7 vlog-gated
media, V-8 the crown tiebreak — needed HERE, where the chains bundle 12
Groves on one dayKey).

**Run verdict: CONDITIONAL PASS — the strongest pass of the three runs; the
three tuning proposals (repeat-bloom clustering, A3 class bars, F4 ceiling
16) should be applied in the dev tools and this archetype re-run before the
numbers freeze. The balanced life is exactly as beautiful as the register
promises — once the bloom economy stops lying about how much of it there is.**