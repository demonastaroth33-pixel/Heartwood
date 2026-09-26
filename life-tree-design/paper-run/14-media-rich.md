# PAPER RUN 14 — ARCHETYPE: "MEDIA-RICH" (3-year, photo-heavy journal + gym + nutrition)

**Status:** design-time simulation, no code. Full hand-walk of ONE synthetic
user's life through the Life Tree timeline against the locked register.
**Register verified against:** `life-tree-design/SCHEMA.md` §2.4 (A1–F10, locked
2026-08-29; D105) — read in full for this run. **Decision texts verified
against:** `TEMP-PLANNING.md` (D092–D115, read in full). **Trophy conditions
verified against:** `TEMP-PLANNING-Achievement-Spec.md` §I, §III, §IV, §VII,
§VIII, §IX + `ACHIEVEMENT-SCAN.md` (family/tier ladders). **Run purpose:** the
E5 storage-leaves + the media-domain test case (D104: media attaches to the
journal branch's media-forks; media days count toward the journal branch's
presence — D115). **Run note:** carries run 02's V1/V6 pins (B2 register
reading; the same-day bloom boundary) — re-verified against the same records.

---

## 0. The synthetic user

A 3-year user. Pattern: **a qualifying journal entry 5 days/week (Mon–Fri,
~50 words — above the A2 40-word floor), each entry photo-heavy (3 kept photos
added same-day), plus 1 kept vlog/week (Wednesdays, 3–8 min, avg 5)**. Gym
**2×/week (Mon + Thu, full-body barbell: squat/bench/deadlift/OHP/curl, 3 sets
of 5)**. Nutrition **2 meals/day logged, every day**. **No habits, no goals,
no coach, no weigh-ins, no vacations.** All in-window, media added same-day
(D100). Birth anchor = **Aug 15 yr0** (the first in-window event = the first
entry + its photos + the first meals, frozen per D090 B / D100(5) / D102).

Fixed derived reality (constant across the whole life):

| Axis | Value | Derivation |
|---|---|---|
| F4 RESOURCE | **0.26** | 37 in-window events/week ÷ 7 days = 5.29/day ÷ ceiling 20 (F4). Weekly breakdown: Mon 7 (entry+3 photos+2 meals+gym) · Tue 6 · Wed 7 (+vlog) · Thu 7 (+gym) · Fri 6 · Sat 2 · Sun 2 |
| F5 RHYTHM | **1.00** | every week = 7 active days (meals every day) → stddev 0 → 1 − CV, clamped (F5) |
| F6 BALANCE | **0.67** | Shannon evenness over the canonical 7 presence-domains (F6/D104): journal 260 · gym 104 · nutrition 365 · media 260 · habits/body/goals 0 → H=1.307 / ln7=1.946 → 0.672 |
| F7 TENURE | 0.1→0.3 | stage-years/10, clamped (F7) |
| Active days/yr | 365 | A4 (≥200 in-window days) passed every year — meals make every day active |
| Twigs | 11→12/yr | A3 on journal/nutrition/media (21–30 days/month ✓); **gym 8.7/month ✗ — never** |

Presence days per domain per anchored year: journal **260** (5/wk) · media
**260** (photos on entry days; vlog days are journal days) · gym **104** · nutrition
**365** · habits 0 · body 0 · goals 0.

---

## 1. Assumptions pinned (flagged, not register facts)

- **A1 — The annual bloom date = Mar 1** (the F1 spring start), carried from
  run 02's V6 pin; the register pins the season window (Mar 1–Nov 30, F2) but
  not the bloom day. For this anchor (Aug 15) the first bloom is a SEPARATE
  one-time event at maturity (D092(2)); the annual bloom is Mar 1 each year.
- **A2 — Same-day boundary (run 02 V6):** a Ring/Grove/adaptation whose gates
  all hold at a bloom's opening participates in that bloom; a modification
  whose gates hold manifests at the next annual bloom (D093).
- **A3 — Calendar-month twigs:** A3's "≥15 in-window days per 30-day month"
  is read over CALENDAR months (C5's "monthly unit"); partial months at the
  anchor edges (Aug yr0, Aug yr3) yield no twig. Rolled-window reading would
  give the same count at steady state — see V7.
- **A4 — Vlog duration: 3–8 min, avg 5 min** (unscripted weekly check-in).
  This closes VII-2 (≥10 min) and VII-10 (≥60 min); VII-7's 10h lands at ~2.3
  years. The bank is duration-sensitive — see V12.
- **A5 — Lifting reality (2×/week, 65 kg bodyweight, 3×5 barbell):** PRs
  decay after the novice year (52 PRs yr1, ~26 yr2, ~10 yr3 — ~88 total);
  tonnage ≈ 3,900 kg/session (≈7,800 kg/week); rung ceilings R3/R8/R13/R17/R22
  (100 kg bench / 140 squat / 180 DL / 60 OHP / 40 curl) NOT reached in 3
  years; III-7 (100 PRs) not reached. III-12/13/15/16 (strength-relative) and
  III-14 (2×BW deadlift) fire on optimistic-but-plausible years-2/3 pins —
  each flagged.
- **A6 — I-15 Bookended calendar luck:** the synthetic calendar is chosen so
  Jan 1 and Dec 31 fall on journal days in yr0–yr3 (~1/4 chance per year pair
  in reality); I-15 fires each year. Calendar-sensitive — see V11.
- **A7 — I-12 fires at 2 and 3 years:** Aug 15 yr2/yr3 land within ±1 day of
  the anchor's month-day on a journal day (A6's weekday luck). Flagged.
- **A8 — Photos are entry attachments** (3 per entry, added same-day via the
  entry's media attachment flow) — counted as `media.added` (entry) events per
  D104; no standalone vault adds. Vault adds would change the media-fork twig
  math only when they land on non-journal days (see V6).
- **A9 — I-13's M7 exclusion list includes media**: every journal day carries
  media → Unprompted can never fire. Verified against the spec (M7 pin); see V10.

---

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | Day 1 (Aug 15 yr0) | first in-window event (register B1 / D090 A) |
| B2 SEEDLING→SAPLING | **Aug 29 yr0** (register) / Sep 3 yr0 (D115(1)) | register B2: ≥15 in-window days in any 30-day window, any-domain-mixed; D115(1)'s record text says ≥20 (run 02 V1 — see V1). Nutrition makes every day active; either reading lands in yr0 |
| B3 SAPLING→POLE | Aug 14 yr1 | 1st stage-year closes (365/365 in-window ≥ A4's 200) |
| B4 POLE→MATURE | **Aug 14 yr2** | ≥2 stage-years AND ≥1 domain ≥90 in-window days in its best anchored year (nutrition 365; media 260) — D115(2) days-based gate. Pioneer-speed (SCHEMA B4 note) |
| B5 MATURE→OLD-GROWTH | not in 3 years | ≥10 stage-years |

Maturity is NOT gated by the ring brand (D090 C / D101 rule 1) — a 4-of-7
domain user matures on schedule. ✓

---

## 3. Checkpoint-by-checkpoint walk

### Day 1 — Aug 15 yr0 (SEED → SEEDLING on the first event)
- **Stage:** SEEDLING (B1 ticks same instant as birth). **Stage-years:** 0.
- **Axes:** F4 0.26 · F5 ~1.0 (one week) · F6 0.67 · F7 0.0.
- **Organs:** 5 branch-buds (journal, habits, gym, nutrition, goals; body/media
  ride forks — D104); the day's content banks as leaf-buds on the stem
  (D115(3)); the journal branch's media-forks are born with the branch
  (D104 — fork = render structure, never a gate, D115(2)).
- **Bank:** I-1 Ink on the Page (S) · IV-1 First Plate (S) · VII-1 Rolling Tape
  (S, first kept vlog, first Wed — day 4) · III-1 First Rep (S, first gym day
  Mon Aug 17) · IX-1 Full Circle Day (S, first gym day has journal+gym+nutrition
  same day). Counter: 5.
- **Leaf clusters already render STORAGE-LEAF character** (D099 N-5 — the
  cluster's media content is visible at aggregation scale, before C6's
  granularity unlock). Media-rich history is visible from day 1 ✓.
- **Rings:** 0. **Why-panel:** "You were born. Your entries carry their
  memories — the leaf clusters already show the storage-leaf character of a
  photo-rich life."

### Month 3 — Nov 15 yr0 (SAPLING)
- **Stage:** SAPLING (B2 at Aug 29 yr0). **Stage-years:** 0.
- **Axes:** F4 0.26 · F5 1.00 · F6 0.67 · F7 0.0.
- **Twigs:** journal 2 (Sep, Oct — Aug partial month: 11 journal days < A3's 15
  → no twig) · media-forks 2 (same days) · nutrition 2 · gym **0** (8.7
  days/month < 15 — the gym branch shows no canopy despite 2 real sessions/
  week — V7). **Media-fork attribution verified (D104/D115):** media days feed
  the media-forks' twigs AND count toward the journal branch's presence — the
  two channels coincide here (photos land on journal days, A8) — V6.
- **Bank (S/R/B/H buds, ~15):** I-1, IV-1, VII-1, III-1, IX-1-S · I-6 (50th
  entry, ~d63), III-2 The Basics (week 1), III-3 New Number, III-4 (10 PRs),
  III-20 Heaviest Session ×1, IV-2 A Month of Logging (d30), R44 The Quarry
  Opens (100,000 kg, ~d90), R1 First Press (60 kg, ~d60), R6 First Descent
  (80 kg), R11 Ground Zero (100 kg), R20 First Curl (20 kg), IX-1-R (10th
  4-domain day), IX-4-R Wrote It Down (first journal+PR day, d10) · III-8 Same
  Lift ×10, III-9 PR Season (1 fire), III-21 Trimester of Iron (12 weeks ≥2,
  ~d84), IX-4-B (10 PR days), IX-1-B (50th 4-domain day, ~d175 — just past
  the checkpoint). Counter: ~20.
- **Rings:** 0. **Why-panel:** "Two months of a rich journal branch. The gym
  branch grows no twigs — its cadence is two days a week; the canopy reads
  your daily domains."

### Year 1 — Aug 14 yr1 (POLE)
- **Stage:** POLE (B3: 1st stage-year). **Stage-years:** 1. C6 unlocks
  per-entry leaf granularity.
- **Axes:** F4 0.26 · F5 1.00 · F6 0.67 · F7 **0.1**.
- **Twigs:** journal 11 (Sep–Jul; Aug yr0 partial = none) · media-forks 11 ·
  nutrition 11 · gym 0. 33 twigs on the tree, all on the daily domains.
- **Bank (pre-maturity, S/R/B/H):** + I-9 Novel-Length R (25k words — not yet;
  entry #500 ≈ Jul yr2) · + III-5 Quarter Century (25 PRs, ~yr1) · III-10
  Trifecta Week (~yr1) · III-12 Bodyweight Bench (~yr1) · III-22 The Schedule
  Never Breaks (26 weeks of Mon+Thu, ~d182) · III-18 Standard ×3 (Novice tier,
  yr1) · R45 The Rockslide (500,000 kg, ~d450) · R2 Two Plates Deep (80 kg) ·
  R7 Century Squat (100 kg) · R12 The Pull (140 kg) · R16 First Overhead
  (40 kg) · IV-6 Half a Year of Fuel (180th food day, Feb yr1) · IX-1-H
  (100th 4-domain day, ~d350) · **I-15 Bookended (Dec 31 yr0 — winter-earned,
  banks)** · **I-15 (Dec 31 yr1 — winter-earned, banks)** · III-6 Fifty Beaten
  (50 PRs, ~d560) · III-16 Triple Bodyweight Club (~yr2 pin) · III-18
  Intermediate ×2 (yr2 pin) · VII-8 One Year Same Day (vlog month-day match,
  ~yr2 pin) · IV-7 The Long Table (1,000th food day, ~d1000 = May yr2).
- **Rings earned today:** **VIII-1 One Year In** (365 days + ≥3 domains in ≥9/12
  months — journal/media/gym/nutrition every month ✓) · **III-26 A Year on the
  Bar** (Aug 17 yr1, ±7d anniversary band ✓). Both RING tier → banked.
- **Grove earned this year:** **III-11 A PR Every Season** (12th distinct month
  with a PR, ~Sep yr1) — the archetype's first Grove → banked (D096 special
  banked form).
- **I-5 Full Orbit does NOT fire** — journal has 260 distinct days < 300
  (spec §I). **VII-5 Full Orbit, on Camera does NOT fire** — 52 vlog days < 300
  (spec §VII). Honest misses — but see **V4/V5**.
- **Rings (trunk):** 0 (4 of 7 domains; habits/body/goals at 0 — A5 honest).
  **Branch rings:** journal 3→1 so far (yr1: 260 journal + 260 media days ≥
  A5's 40 ✓) · nutrition 1 · gym 1 (104 ≥ 40 ✓) · media-fork 1.
- **Why-panel:** "One year of proof. The trunk brands no ring — four of seven
  domains, honestly. The journal branch carries its own ring; your first Grove
  bud (a PR every season) waits in the bank."

### Year 2 — Aug 14 yr2 (MATURE — the FIRST BLOOM)
- **Stage:** MATURE (B4). **Stage-years:** 2. D1 floor (≥2) met.
- **Axes:** F4 0.26 · F5 1.00 · F6 0.67 · F7 **0.2**.
- **Twigs:** journal 23 (11 + 12) · media-forks 23 · nutrition 23 · gym 0.
  C5 retention: 12 render per source (last 3 years — all of them).
- **Bank pre-maturity (every S/R/B/H earned d1→d729; D092(1) — nothing blooms
  before maturity):**
  - **S (5):** I-1 · VII-1 · III-1 · IV-1 · IX-1-S.
  - **R (15):** I-6 · I-9 (25k words, day ~701 — same day as I-7) · III-2 ·
    III-3 · III-4 · III-20 ×2 · IV-2 · IX-1-R · IX-4-R · R1 · R6 · R11 · R20 ·
    R44.
  - **B (19):** I-7 Five Hundred Pages (entry #500, ~Jul 15 yr2 — pre-maturity
    bank) · III-5 · III-8 · III-9 · III-12 · III-13 One and a Half (~yr2 pin) ·
    III-15 Press Three-Quarters (~yr2 pin) · III-18 Novice ×3 · III-21 · IV-6 ·
    IX-1-B · IX-4-B · R2 · R7 · R12 · R16 · R45.
  - **H (11):** I-15 (Dec 31 yr0) · I-15 (Dec 31 yr1) · III-6 · III-10 ·
    III-16 · III-18 Intermediate ×2 · III-22 · IV-7 · VII-8 · IX-1-H.
  - **= 50 buds.** C1's ≤15/event is EXCEEDED as a single burst — the D099
    N-4a wave mechanism engages (see §8).
  - **Ring stays banked (D092(2)):** VIII-1 · III-26 · **VIII-2 Two Years**
    (Aug 15 yr2 — 24/24 months ≥ 18/24 ✓). 3 ring buds.
  - **Grove stays banked (D092(2)):** III-11 (the crown candidate).
- **FIRST BLOOM (D092(2)): 50 S/R/B/H buds burst — FOUR waves (15+15+15+5)
  across the flowering season Aug 14–Nov 30 yr2 (D099 N-4a, magnitude order
  within the burst; C1/C2 hold — see §8).** Ring/Grove stay banked.
- **On-earn (post-maturity, growing season):** I-12 Same Question **Branch**
  (Aug 15 yr2, same-day boundary — the tree's first on-earn bloom) · III-20
  ×1 (later record days) — individual blooms, each ≤15 ✓.
- **Adaptations pending:** **storage leaves (E5)** — media share 0.76 ≥ 0.5 of
  entry content (under every reading — see V3), D1 met today, SEEDLING floor
  ✓ → PENDING, manifests at the next annual bloom (D093 = Mar 1 yr3).
  **phyllodes (E3)** — resource 0.26 ≤ 0.4, D1 met, SEEDLING ✓ → ALSO PENDING —
  **the coherence flag (V2):** the media-LUSH archetype qualifies for the
  sparse-stubborn adaptation because the ÷20 ceiling reads its 5.3 events/day
  as sparse. The leaf-family envelope (D115(4)) allows one base character —
  the rank rule must pick storage leaves as dominant and the phyllode
  signature must be re-gated (V2).
- **Rings (trunk):** 0. **Branch rings:** journal 2 · nutrition 2 · gym 2 ·
  media-fork 2. **Why-panel:** "You matured — two full years, and the tree's
  flowering stage. Fifty earned flowers burst in four waves. The Rings and the
  Grove stay banked; the storage-leaf character is pending for the spring."

### Year 3 — Mar 1 yr3 (MATURE — the first ANNUAL BLOOM)
- **Stage:** MATURE. **Stage-years:** 2 (the 3rd closes Aug 14 yr3). D2 floor
  (≥3) not yet — holds Aug 14 yr3.
- **Axes:** F4 0.26 · F5 1.00 · F6 0.67 · F7 0.2.
- **Annual bloom (6 flowers, one wave):** Ring — VIII-1 + III-26 + VIII-2 (3) ·
  **III-11 A PR Every Season TRANSFORMS — THE CROWN** (the first/rarest Grove,
  C4 legend; D115(5) winter persistence) (1) · winter flush (D095) — I-15
  (Dec 31 yr2, winter-banked) + R46 The Mountain Moves (1,000,000 kg, ~Feb 1
  yr3 — winter-earned, flushes) (2).
- **ADAPTATIONS MANIFEST (D093 — the annual bloom hosts everything):**
  **storage leaves** — the journal branch's leaf family grows the succulent
  storage-leaf character, the tree's signature adaptation (E5 + D1 + SEEDLING,
  all held since Aug 14 yr2). **phyllodes does NOT manifest** — held by the
  rank rule pending V2's re-gate; the pending state is visible and explained
  (D093's pending-state rule).
- **On-earn (Mar–Aug yr3, growing season):** III-14 Double Bodyweight Pull
  (~May yr3 pin) · III-18 Intermediate ×2 (yr3 pins) · VII-8 (yr3 fire) ·
  VII-7 The Archive Grows **Root** (10h cumulative vlog duration, ~mid-yr3 —
  the media family's first on-earn) · III-20 ×1 · I-12 Same Question
  **Heartwood** (Aug 15 yr3, same-day boundary).
- **Rings (trunk):** 0. **Branch rings:** journal 2 (yr3 not closed) ·
  nutrition 2 · gym 2 · media-fork 2.
- **Why-panel:** "The first spring of maturity: your three Rings, your crown —
  a PR in every season — and the tree's true adaptation: storage leaves. Your
  entries hold the memories; the leaves hold them thicker."

### Final checkpoint — Aug 15 yr3 (MATURE, 3 stage-years)
- **Stage:** MATURE (yr3 closes Aug 14 yr3). **Stage-years:** 3. D2 floor met
  today.
- **Axes:** F4 0.26 · F5 1.00 · F6 0.67 · F7 **0.3**.
- **Twigs:** journal 35 (11+12+12) · media-forks 35 · nutrition 35 · gym 0.
  Lifetime 105 twigs on the daily domains; the gym branch remains twigless
  (V7).
- **Groves earned at the window close (Aug 14 yr3):** **III-27 Three Years in
  Iron** (3 consecutive windows × 104 ≥ 80 workouts ✓) · **IV-13 Three Years
  on the Line** (3 consecutive windows × 365 ≥ 250 food days ✓) — both bank
  (D092(5): the next annual bloom = Mar 1 yr4 — beyond the walk; calendar-
  guaranteed, never stuck).
- **Bank at the checkpoint (C7):** 2 Grove buds pending (III-27, IV-13 —
  tier-marked special forms per D096), + III-26's yr3 anniversary (Aug 17 yr3,
  ±7d band — 2 days after the checkpoint, noted) and I-15 (Dec 31 yr3) next
  year. Counter: "2 Grove pending."
- **Rings (trunk):** **0 — forever for this user.** 4 of 7 domains present
  (habits/body/goals at 0). Verified honest: A5 + D090 C + D101 rule 1 + D104 +
  D114(3). The VIII-11→20 ring series never fires; VIII-5/6/7/8/9/10 never
  fire. The tree's age lives in the branch rings: **journal 3 · nutrition 3 ·
  gym 3 · media-fork 3** (D088 A).
- **Why-panel:** "Three years of proof. Your trunk never brands a ring — the
  ring is a seven-domain brand, and you hold four honestly. Your three branches
  are ringed three times each; two more Groves wait for next spring."

---

## 4. The bank — every earned trophy, by tier (Aug 15 yr0 → Aug 15 yr3)

| Trophy | Tier | Earned | Blooms (D092/D095) |
|---|---|---|---|
| I-1 Ink on the Page | Sprout | d1 | first bloom yr2 ✓ |
| IV-1 First Plate Logged | Sprout | d1 | first bloom yr2 ✓ |
| VII-1 Rolling Tape | Sprout | d4 (first vlog) | first bloom yr2 ✓ |
| III-1 First Rep Logged | Sprout | d3 (first gym) | first bloom yr2 ✓ |
| IX-1 Full Circle Day | Sprout | d3 (journal+gym+nutrition) | first bloom yr2 ✓ |
| I-6 Half Century | Root | d63 | first bloom yr2 ✓ |
| IX-4 Wrote It Down | Root | d10 (journal+PR day) | first bloom yr2 ✓ |
| III-2 The Basics | Root | week 1 | first bloom yr2 ✓ |
| III-3 New Number | Root | week 1–2 | first bloom yr2 ✓ |
| III-4 Ten Times Better | Root | yr0 | first bloom yr2 ✓ |
| III-20 Heaviest Session | Root | ×2 (yr0/1) + ×1 (yr3, on-earn) | first bloom ×2 ✓ · on-earn ✓ |
| IV-2 A Month of Logging | Root | d30 | first bloom yr2 ✓ |
| R44 The Quarry Opens | Root | ~d90 (100,000 kg) | first bloom yr2 ✓ |
| R1 / R6 / R11 / R20 | Root | yr0 (60 bench / 80 squat / 100 DL / 20 curl) | first bloom yr2 ✓ |
| IX-1 Full Circle Day | Root | 10th 4-domain day, ~d45 | first bloom yr2 ✓ |
| IX-4 Wrote It Down | Branch | 10 PR days, ~d120 | first bloom yr2 ✓ |
| I-9 Novel-Length Life | Root | d701 (25k words = entry #500) | first bloom yr2 ✓ (pre-maturity bank) |
| VII-7 The Archive Grows | Root | ~mid-yr3 (10h vlogs) | on-earn yr3 ✓ |
| I-7 Five Hundred Pages | Branch | d701 (entry #500) | first bloom yr2 ✓ (pre-maturity bank) |
| III-5 Quarter Century of PRs | Branch | ~yr1 | first bloom yr2 ✓ |
| III-8 Same Lift ×10 | Branch | yr0 (bench) | first bloom yr2 ✓ |
| III-9 PR Season | Branch | yr0 (1 fire) | first bloom yr2 ✓ |
| III-21 Trimester of Iron | Branch | ~d84 | first bloom yr2 ✓ |
| III-12 Bodyweight Bench | Branch | ~yr1 [A5] | first bloom yr2 ✓ |
| III-13 One and a Half | Branch | ~yr2 [A5] | first bloom yr2 ✓ |
| III-15 Press Three-Quarters | Branch | ~yr2 [A5] | first bloom yr2 ✓ |
| III-18 Strength Standard | Branch | Novice ×3 (yr1) | first bloom yr2 ✓ |
| R45 The Rockslide | Branch | ~d450 (500,000 kg) | first bloom yr2 ✓ |
| R2 / R7 / R12 / R16 | Branch | yr1–2 (80 bench / 100 squat / 140 DL / 40 OHP) | first bloom yr2 ✓ |
| IV-6 Half a Year of Fuel | Branch | d180 | first bloom yr2 ✓ |
| IX-1 Full Circle Day | Branch | 50th day, ~d175 | first bloom yr2 ✓ |
| I-12 Same Question, New Answer | Branch | Aug 15 yr2 (2-yr month-day) | on-earn yr2 ✓ (same-day) |
| I-15 Bookended | Heartwood | Dec 31 yr0 (winter) | first-bloom burst yr2 ✓ (D095) |
| I-15 Bookended | Heartwood | Dec 31 yr1 (winter) | first-bloom burst yr2 ✓ (D095) |
| I-15 Bookended | Heartwood | Dec 31 yr2 (winter) | Mar 1 yr3 spring flush ✓ (D095) |
| III-6 Fifty Beaten | Heartwood | ~d560 (50 PRs) [A5] | first bloom yr2 ✓ |
| III-10 Trifecta Week | Heartwood | ~yr1 | first bloom yr2 ✓ |
| III-16 Triple Bodyweight Club | Heartwood | ~yr2 [A5] | first bloom yr2 ✓ |
| III-18 Strength Standard | Heartwood | Intermediate ×2 (yr2) + ×2 (yr3, on-earn) | first bloom ×2 ✓ · on-earn ×2 ✓ |
| III-22 The Schedule Never Breaks | Heartwood | ~d182 (26 Mon+Thu weeks) | first bloom yr2 ✓ |
| IV-7 The Long Table | Heartwood | ~d1000 (1,000th food day) | first bloom yr2 ✓ |
| VII-8 One Year, Same Day | Heartwood | yr2 + yr3 (vlog month-day match) | first bloom ✓ · on-earn yr3 ✓ |
| IX-1 Full Circle Day | Heartwood | 100th day, ~d350 | first bloom yr2 ✓ |
| R46 The Mountain Moves | Heartwood | ~Feb 1 yr3 (1,000,000 kg) | Mar 1 yr3 flush ✓ (D095 winter) |
| R21 Gun Show | Heartwood | ~yr3 (30 kg curl) [A5] | on-earn yr3 ✓ |
| I-12 Same Question, New Answer | Heartwood | Aug 15 yr3 (3-yr month-day) | on-earn yr3 ✓ (same-day) |
| III-14 Double Bodyweight Pull | Heartwood | ~May yr3 [A5] | on-earn yr3 ✓ |
| VIII-1 One Year In | **Ring** | Aug 15 yr1 | Mar 1 yr3 annual bloom ✓ (D092(4)) |
| III-26 A Year on the Bar | **Ring** | Aug 17 yr1 | Mar 1 yr3 annual bloom ✓ |
| VIII-2 Two Years | **Ring** | Aug 15 yr2 | Mar 1 yr3 annual bloom ✓ |
| III-11 A PR Every Season | **Grove** | ~Sep yr1 | **Mar 1 yr3 — THE CROWN transformation** ✓ (C4) |
| III-27 Three Years in Iron | **Grove** | Aug 14 yr3 | banked — Mar 1 yr4 (beyond walk, calendar-guaranteed) |
| IV-13 Three Years on the Line | **Grove** | Aug 14 yr3 | banked — Mar 1 yr4 (beyond walk, calendar-guaranteed) |

**Tallies (yr3):** Sprout 5 · Root 16 · Branch 20 · Heartwood 19 · Ring 3 ·
Grove 3 = **66 trophy-fires**. Expressed by the checkpoint: 64 (60 S/R/B/H
bloomed + 3 Ring at the yr3 annual bloom + the III-11 crown); **2 Grove buds
banked** for Mar 1 yr4 (D092(5)). Bank counter (C7): "2 Grove pending."

**"Do ALL their trophies bloom on schedule?"** Yes. Every earn has a dated
expression: 50 S/R/B/H buds burst in 4 waves at the first bloom (yr2) or
on-earn/winter-flush post-maturity; the 3 Ring buds bloom at the first annual
bloom (Mar 1 yr3); the first Grove transforms as the crown at the same bloom;
the two yr3-closing Groves bank to Mar 1 yr4. Nothing unrewarded, nothing
flattened. **The unearned are honest:** I-5/I-16/I-17 (260 journal days <
300's bar — V5), I-2/I-3/I-4 (5-day pattern breaks the streak family — V5),
I-10 (50-word entries), I-13 (media on every day — V10), VII-2/VII-10
(vlog length — A4/V12), VII-3/VII-4 (1 vlog/wk), VII-5/VII-11/VII-12 (52 vlog
days ≪ 300 — V4), VII-6 (~19 years), VII-9 (5-year match), VIII-3+ and the
whole ring series (no ring), all of II/V/VI (domains at 0), IX-2 (6-domain
day), IX-3 (52 vlogs < 100's bar — V4), III-7 (88 PRs < 100), III-23/III-24
(no phases/gaps), III-25 (104 sessions/yr), III-28, IV-3/4/5/8/9/10/11/12
(no phases), IV-14.

---

## 5. The schedules (D092 / D093 / D095 / D100 — verified)

- **D092(1) pre-maturity banking:** all 50 S/R/B/H earns before Aug 14 yr2 are
  tier-marked buds (D096); none blooms early ✓.
- **D092(2) first bloom:** 50 buds burst at maturity in **4 waves** (D099
  N-4a, see §8); Ring/Grove stay banked ✓.
- **D092(3)+(D095) post-maturity:** on-earn fires land inside the growing
  season (Aug 14–Nov 30 yr2; Mar 1–Nov 30 yr3) — I-12-B (Aug 15 yr2), III-14,
  III-18×2, VII-8, VII-7-R, III-20, I-12-H ✓. Winter earns bank to spring:
  R46 (Feb 1 yr3) and I-15 (Dec 31 yr2) flush at Mar 1 yr3 ✓.
- **D092(4) Ring tier:** VIII-1, III-26, VIII-2 all bloom at the first annual
  bloom after maturity (Mar 1 yr3) ✓ — calendar-guaranteed, rings or not.
- **D092(5) Grove:** III-11 transforms at the next annual bloom after maturity
  (Mar 1 yr3) ✓; III-27/IV-13 (earned at the yr3 window close) bank to Mar 1
  yr4 — same-day boundary per A2 ✓.
- **D093 modifications:** storage leaves pending at Aug 14 yr2 (gates all
  held) → manifest at the Mar 1 yr3 annual bloom ✓; phyllodes held pending the
  rank rule (V2). The pending state is visible with why-panel copy ✓.
- **D095 winter banking:** I-15 (Dec 31 yr0/yr1/yr2) + R46 (Feb 1 yr3) bank as
  flower-buds and flush at the next spring event ✓; winter entries become
  leaf-buds on the bare branches — the storage-leaf character keeps the
  canopy honest through winter once manifested (D095's derived override is a
  phyllode/evergreen note; storage leaves get the same winter-keep question —
  see V3).
- **D100 in-window predicate:** every event written same-day → 365/365
  presence days; no grace use, no backfill, no imports (A2's 40-word bar +
  non-import exclusions hold every day); anchor = the first in-window event ✓.
  F10 future-dating clamp: n/a.
- **D099 N-5 media-aware aggregation:** the journal branch's leaf clusters
  render storage-leaf character from day 1 (media content at aggregation
  scale) ✓; C6's per-entry granularity unlocks at POLE (yr1) and shows the
  same character per entry — coherent with E5's later manifest (same visual
  family, D115(4)). Why-panel copy must distinguish the N-5 render rule from
  the E5 adaptation (minor, noted).

---

## 6. The rings — the honest no-ring outcome (verified)

**Confirmed correct, against the same four citations as run 02:** D090 C
(single/multi-domain users mature; rings are separate), D101 rule 1 (the
stage clock never reads ring-years — 3 stage-years accumulate), D104 (the
canonical 7 presence-domains — this user holds 4 of 7), D114(3) (the ring
domain set = the canonical 7). A5's per-domain ≥40 in-window days: journal
260 ✓ · media 260 ✓ · gym 104 ✓ · nutrition 365 ✓ · habits 0 ✗ · body 0 ✗ ·
goals 0 ✗ → **4/7, no ring-year, no trunk ring, no ring series (VIII-11→20),
no VIII-5/6/7/8/9/10 — forever.** Honest by construction; the aged look is
carried by D088 A's branch rings: journal 3, nutrition 3, gym 3, media-fork 3
by yr3. **Notable:** the media domain DOES contribute to the ring count as its
own presence-domain (D104(2)) — this user's ring would need habits+body+goals,
not more media. A user adding just body weigh-ins + 1 habit + 1 goal would
flip to a 7/7 ring-year; the media-rich user's photos are not the missing
piece — the zero-effort domains are. Honest.

---

## 7. The adaptations (E1–E14) — verdict for this pattern

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 (≥5 stage-yrs) + MATURE | tenure 0.3 at yr3 | Not in the walk; holds at yr7 — reachable in a sane lifetime ✓ |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | balance **0.67** (3 domains at 0 drag it under) · resource 0.26 | **Misses by 0.03 on balance — V9** (a genuinely 4-domain-consistent user reads just under the bar) |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | resource **0.26 ≤ 0.4**, D1 met yr2 | **WRONG-READ VIOLATION — V2:** the media-LUSH archetype qualifies for the sparse-stubborn adaptation; the ÷20 ceiling makes 5.3 events/day read sparse. Held by the rank rule pending the re-gate |
| E4 cladodes | divergence ≥0.6 · D1 + SAPLING | 0 (never misses a logged day) | No — honest |
| E5 storage leaves | media share ≥0.5 of entry content · D1 + SEEDLING | media share **0.76** (3 photos vs 1 text body; 2,652 media events vs 780 content events — every reading passes, **V3**) · D1 yr2 | **YES — the archetype's signature adaptation.** Pending at yr2, manifests at the Mar 1 yr3 annual bloom ✓ |
| E6 thorns | 365-day streak trophy + tenure ≥2 · D1 + SAPLING | streak trophies are habit-family (II-4); **the user holds a real 365-day NUTRITION streak** | **VIOLATION — V8 (the armor gap, run 02 V3 extended):** the year-long nutrition streak earns no armor |
| E7 spines | 100-day streak trophy (II-3) · SAPLING | habit-family; real 100-day nutrition streak held | **VIOLATION — V8** |
| E8 tendrils | live long-horizon goal | no goals | No — honest |
| E9 reaction wood + epicormic | a revival (dormancy end) — universal | never dormant | No — and honest |
| E10 contractile | 3 consecutive stage-years with RISING active-day counts | 365/365/365 — flat | No — honest |
| E11 mycorrhizal | coachEngagement owner ≥ threshold (H-03) | no coach | Open — the owner's threshold is D114-deferred (run 02 V7) |
| E12 stolons | L-10 insight ≥3 monthly windows | no cross-domain insight owner | Open/effectively-never — run 02 V7 |
| E13 bracts | no gate (ceremony) | blooms | Present at every bloom ✓ |
| E14 bud scales | no gate (dormant-habit state) | no habits | None ✓ |

**Structural marks reachable in this life: exactly two — storage leaves (the
true character, yr3) and the WRONG-READ phyllodes (V2 — must be re-gated).**
Caudex (yr7) is reachable-but-late (run 02 V4); buttress misses by 0.03 (V9);
the armor never grows despite two real year-long streaks (V8).

---

## 8. Caps, budgets, economy

- **C1 (≤15 flowers/bloom event):** the first bloom holds **50 buds** — as a
  single burst that EXCEEDS C1; the D099 N-4a wave mechanism splits it into
  **4 waves of 15/15/15/5** (each event ≤15 ✓). The Mar 1 yr3 annual bloom = 6
  ✓. Every on-earn is an individual event ≤15 ✓. **The wave mechanism is the
  load-bearing budget here — without it, 50 flowers at once.** Verified: no
  flower lost, no moment floods ✓.
- **C2 (≤4 waves/season, 60 flowers/season):** the first bloom uses all 4
  waves (50 ≤ 60 ✓); the Mar 1 yr3 bloom is 1 wave ✓. At the cap, but within.
- **C3 habit-bud clusters (≥30):** no habits — N/A.
- **C4 (1 legend + 1 crown):** III-11 = the crown at Mar 1 yr3 ✓; III-27/IV-13
  get large blooms (not transformations) at Mar 1 yr4 ✓. Holds.
- **C5 (≤12 twigs/branch/yr + 3-yr retention):** journal 12 ✓ · nutrition 12 ✓
  · media-forks 12 ✓ · gym 0. **The fork question — V6:** the journal branch
  renders 12 branch twigs + 12 media-fork twigs = 24 on one branch; the cap's
  "per branch" reading is ambiguous across fork boundaries.
- **C7 bank counter:** top-3 by tier: "2 Grove pending" at the yr3 checkpoint
  (tier-marked special forms, D096) ✓.
- **D1/D2/D3 floors:** D1 (≥2 stage-yrs) at yr2 ✓ (storage leaves/phyllodes
  gates) · D2 (≥3) at yr3 ✓ (buttress — balance still fails) · D3 (≥5) not
  reached.
- **F4 RESOURCE (÷20):** reads **0.26** for a life with 5.3 events/day — the
  V2 calibration finding (run 02 V2, now with a concrete lush-user flip).
- **Economy:** 66 fires, 64 dated expressions in-walk, 2 Grove buds
  calendar-guaranteed for Mar 1 yr4, 0 lost, 0 flattened, 0 pending-past-
  schedule. **The bank's shape:** gym 39 fires (tonnage + PR + rung families),
  journal 9, nutrition 5, media **4** (VII-1, VII-7-R, VII-8×2), cross 7,
  Ring 3, Grove 3. **The media-rich life's trophies are nearly all locked —
  V4.**

---

## 9. Violations & tuning proposals

**V1 — B2 gate: the register (15) vs D115(1)'s record (20) still disagree.**
Re-verified; carried from run 02 V1. For this user both land in yr0 (Aug 29
vs Sep 3) — cosmetic here, decisive for borderline users. *Tuning:* reconcile
to ONE number (recommend 15 — the A3 month bar, any-domain-mixed) and amend
D115's record text.

**V2 — F4 RESOURCE misreads a media-lush life as sparse → E3 phyllodes opens
for the wrong archetype (a coherence violation).** 5.3 in-window events/day
(entry + 3 photos + 2 meals + gym/vlog) ÷ 20 = **0.26 ≤ 0.4** — the user who
grows the media-rich storage-leaf character ALSO qualifies for phyllodes,
the drought/sparse adaptation. Contradiction by construction is supposed to
prevent this (D088 D); the ÷20 ceiling makes it structurally possible. Run 02
found the same ceiling collapse from the sparse side; this run proves the
lush side flips too. *Tuning (from run 02 V2's options, now with evidence):*
(a) recalibrate the ceiling (e.g., ÷8 — this user reads 0.66, a daily
journaler 0.13 — the axis discriminates); AND (b) re-gate E3: phyllodes =
resource ≤0.4 **AND media share <0.5** (a sparse user who is ALSO media-poor)
so the drought adaptation cannot grow on a water-rich leaf life. The rank
rule (D088 D) held it this run; the register should make the rank unnecessary.

**V3 — E5's metric is undefined: "media share ≥0.5 of entry content."** Three
defensible readings give three numbers: (a) media events ÷ (content events +
media events) = 2,652/(780+2,652) = **0.77**; (b) media attachments per entry
÷ (attachments + text) = 3/4 = **0.75**; (c) media bytes vs words ≈ **1.0**.
All pass HERE (the archetype's point), but a borderline user (2 photos +
150-word entry) flips between readings (b): 2/3 = 0.67 pass vs (c): fail. The
register must pin ONE formula before the engine is written, and decide
whether vault-only adds (standalone media.added) count into the share, and
whether the share is computed per-entry (then averaged) or over the whole log.
*Tuning:* pin reading (b) — per qualifying entry, media attachments ÷ (media
attachments + 1 text body) — the "entry content" the register names; vault
adds excluded from E5 (they are presence, not entry content); document the
derivation. Also note: D095's winter override text names phyllodes/evergreen;
storage leaves should inherit the same winter-keep (a succulent doesn't drop
its leaves) — one line in the engine contract.

**V4 — The media trophy family reads VLOGS ONLY while its own census line
says "vlogs & photos"; at 1 vlog/week the media-heavy archetype earns almost
nothing from its own family.** VII-5 Full Orbit on Camera (Ring, ≥300 vlog
days/window) needs ~6 vlogs/week; VII-6 The Full Reel (Grove, 1,000 vlogs)
≈ 19 years at this pace; VII-11/12 (3/5 consecutive 300-day windows)
impossible; IX-3 The Living Archive (Grove: ≥200 journal entries AND ≥100
vlogs AND ≥100 workouts in one window) misses by 2× (52 vlogs). The family's
own scan line promises "media archive: vlogs & photos" — every trigger reads
only vlogs. **The bank finding: 3 of 12 VII trophies are reachable in this
life (VII-1, VII-7-R, VII-8×2), and even the photo-adjusted VII-5 bar (260
photo days < 300) misses.** *Tuning:* (a) VII-5/VII-11/VII-12 read the
MEDIA-DOMAIN bar (kept vlog OR photo, per E1's media bar) at ≥200 distinct
media days per window — this user's 260 passes, the realistic photo-heavy
cadence (5/wk) is honored, and the A5 ring bar (≥40) already sets the
per-domain precedent; (b) IX-3's vlog leg reads "kept vlogs OR photos"
(100 media days/yr — this user passes); (c) keep VII-6/7 (vlog-count and
vlog-duration) as the pure-vlog Groves — the family keeps its vlog identity
without starving its photo members.

**V5 — The journal streak/Ring family is daily-locked: the 5-day journal
pattern (the most common real cadence) can never earn I-2 (7-day), I-3
(90-day), I-4 (60-day same-time), I-5 Full Orbit (300 days/window), or the
I-16/I-17 Grove chain.** This user journals 260 days/yr — a 71% presence — and
gets ZERO journal Ring/Grove trophies; VIII-1/2 (calendar-month based) fire
instead. Run 02's daily journaler got the whole family; the 5-day journaler —
arguably the realistic one — gets none. *Tuning:* (a) I-5's bar to ≥250
distinct days/window (the 5-day cadence, still honest: 260 passes, a 4-day
pattern at 208 fails); or (b) add a "5-day orbit" reading; recommend (a) —
the number stays strict (250/365) and the family opens to the real pattern.
Same question for I-2/I-3 (keep as daily-streak trophies and document, or
add a 5-of-7 window reading) — at minimum the why-panel must say why a
Mon–Fri journaler never grows the streak family.

**V6 — The media-fork twig attribution + C5 cap across fork boundaries is
unpinned.** Verified working as designed (D104: media days feed the
media-forks' twigs AND the journal branch's presence via D115(2)) — but with
co-located days the journal branch renders 12 branch twigs + 12 media-fork
twigs = **24 twigs on one branch**, and C5's "≤12 twigs/branch/year" is
ambiguous: does the cap cover the branch including forks, or per twig-source?
And when media days EXCEED journal days (vault adds on off-days), the fork
could outgrow the branch. *Tuning:* pin "the C5 cap applies per twig-source
(branch + each fork independently)" and confirm 24-on-the-journal-branch is
the intended render; record the fork's own branch-ring reading (D088 A) —
this user's media-fork carries 3 rings by yr3.

**V7 — A3's twig bar (≥15 days/month) is daily-domain-biased: the gym branch
(8.7 days/month — a healthy 2×/week cadence) NEVER grows a twig in 3 years.**
The gym branch reads twigless beside the daily domains' dense canopies, and
run 08's every-other-day user would read the same. The presence is real (104
days/yr, branch rings 3, A5 ✓); the canopy lies about it. *Tuning:* per-domain
twig bars (e.g., gym-class domains ≥8 days/month, journal/nutrition ≥15) or a
density-weighted twig — D105(2)'s dev tools exist precisely to calibrate this.

**V8 — The armor gap (run 02 V3, extended): E6 thorns / E7 spines read
family-II habit trophies only; this user holds a REAL 365-day nutrition
streak and a real 100-day nutrition streak and can never grow armor.**
Same contradiction as run 02's journal-only user — now with a non-habit
streak that the register's own consistency spine (D088 C) exists to reward.
*Tuning:* run 02's options (a)/(b): add journal/nutrition-side streak
trophies feeding E6/E7, or generalize the E6/E7 triggers to ANY-domain
day-streaks. Recommend (b) — the day-streak is a domain-agnostic fact; the
armor should read it wherever it grows.

**V9 — Buttress misses at 0.67 evenness: the zero-count domains (3 of 7 at 0)
drag a genuinely balanced 4-domain life under E2's 0.7 bar.** This user IS
the buttress archetype (sustained multi-domain balance — 4 domains, every
month, 3 years) and sits 0.03 under the gate. *Tuning:* (a) evenness over
PRESENT domains only (4 present → 1.0 evenness — a different, harsher
tradeoff), or (b) keep the 7-domain reading and document that buttress
demands ≥5 of 7 domains (a strict multi-domain honor), or (c) lower E2's bar
to ≥0.6. Recommend (b) with explicit why-panel copy — but the current
near-miss must be a deliberate number, not an accident of the formula.

**V10 — I-13 Unprompted is anti-media by construction: M7's exclusion list
includes media, and entry-attached photos count as media presence — the
media-rich user NEVER earns the solitary-day family.** The media-rich
archetype is the app's most journal-faithful user; every one of its days is
"solitary" in spirit (only the entry + its own photos) and none qualifies.
*Tuning:* entry-attached media (the day's own photos on its own entry) does
not break Unprompted; only STANDALONE vault adds (media.added without an
entry) do. The M7 pin already excludes body photos for exactly this reason —
extend the same logic to the entry's own media.

**V11 — I-15's calendar sensitivity + the unpinned bloom boundary (run 02
V6).** I-15 (Jan 1 + Dec 31 entries + ≥146 days) depends on weekend luck
(A6) — a 5-day journaler with a Sunday Jan 1 simply loses the year. And the
annual bloom date is still unpinned in the register (I carry Mar 1 from run
02). *Tuning:* pin the bloom day in the engine contract (Mar 1 per F1), and
either accept I-15's calendar honesty or add a ±1-day boundary tolerance to
the Jan-1/Dec-31 legs. Low severity.

**V12 — VII-2/VII-10's duration bars are uncalibrated against realistic vlog
lengths; the bank is duration-sensitive.** Pinned at 3–8 min (A4), VII-2
(≥10 min) and VII-10 (≥60 min) never fire; a user whose vlogs run 10–12 min
gains VII-2 on day 4 and VII-7's 10h at ~1.4 years instead of ~2.3. The 60-min
"Long Take" is a rare format (a film/vlog-length record) — that may be the
intent, but the 10-min "Behind the Scenes" bar vs a typical 5-min check-in is
a near-miss by construction. *Tuning:* dev-tools calibration of the duration
thresholds against the observed vlog-length distribution at the mockup step
(D105(2)); document the family's intent (VII-2 = "your vlogs became a
practice," VII-10 = "you filmed a documentary").

---

## 10. Verdict

The media-rich archetype is **coherent and honest at the presence level, and
exposes four real defects in the rarity economy.** Verified against the locked
register: the stage clock (SEEDLING d1 → SAPLING d15 → POLE yr1 → MATURE yr2,
all days-based per D115), the axes (0.26 / 1.00 / 0.67 / 0.1→0.3 — a steady,
4-domain, photo-lush character), the twigs (35 on each daily domain, gym 0),
the honest no-ring outcome (4 of 7 domains — the trunk stays bare while every
branch rings 3×), the D099 wave economy (50 first-bloom buds in 4 waves — C1
and C2 hold only because the wave mechanism exists), and 66 trophy-fires with
64 dated expressions in-walk and 2 Groves calendar-guaranteed for Mar 1 yr4.
The E5 storage-leaf adaptation — the archetype's signature — manifests on
schedule at the yr3 annual bloom; the media-forks' twig attribution works as
D104/D115 designed.

**Four defects must be fixed before the register freezes:** **V2** (the
RESOURCE axis misreads a lush media life as sparse, and E3 phyllodes opens on
the wrong archetype — the ÷20 ceiling fails on BOTH sides of the axis now),
**V4** (the media family's trophies read vlogs only while its own census
promises photos — the media-heavy life earns 3 of 12 of its own trophies,
and its Ring/Grove tier is structurally unreachable), **V5** (the journal
streak/Ring family is daily-locked — the 5-day journaler, the most common
real cadence, gets no journal Ring/Grove ever), and **V8** (the armor gap —
a real 365-day nutrition streak earns no thorns). **V3** (the E5 metric
definition) must be pinned before the engine is written. V6/V7 (twig
attribution + the gym twig bar), V9 (buttress at 0.67), V10 (Unprompted
anti-media), V11/V12 (calendar and duration calibration) are tuning-surface
decisions this run exists to surface. The bank is exactly as the prompt
predicted: journal/gym/nutrition-heavy, media-starved — and the media
trophies are slow to the point of unreachability. That, not the tree's
honesty, is the finding that matters.