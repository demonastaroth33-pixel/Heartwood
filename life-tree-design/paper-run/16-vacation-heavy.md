# PAPER ARCHETYPE RUN 16 — "VACATION-HEAVY" (4-year, the periods/protected-absence test case — the VI Elsewhere family + the D114 quiet-week philosophy under stress)

**Status:** design-time simulation, no code. Full hand-walk of ONE synthetic
user's life through the Life Tree timeline against the locked register.
**Register verified against:** `life-tree-design/SCHEMA.md` §2.3–§2.6 (the
canonical domain table D104/D115, the threshold register A1–F10 locked
2026-08-29, the trigger-correlation table D092/D093/D103/D105) — read in
full for this run. **Decision texts verified against:** `TEMP-PLANNING.md`
(D088–D115, read in full — D092/D093/D095/D099/D100/D101/D102/D103/D104/
D105/D107/D114/D115 quoted; the docs/DecisionLog.md D-series ends at D083 —
the D092+ records live in TEMP-PLANNING.md, cited from there). **Trophy
conditions verified against:** `life-tree-design/scan-outputs/
02-achievements.md` §VI (verbatim) + the I/II/III/IV/V/VII/VIII/IX family
rows — read in full for this run. **Day math:** simulated exactly
(anchor = Jun 20 2024, a Thursday; 1,461-day walk; every active day counted
by weekday grid; the 4 vacation blocks pinned to Aug 1–14, Nov 1–14,
Feb 1–14, May 1–14; anchored windows d1–365, d366–730, …; sliding 30-day
windows scanned for B2; per-domain maxima scanned over every 365-day
window). **Prior runs read for conventions and cross-references:** 13
(sparse-stubborn — the V1/V4/V5 conventions, the anchored-vs-accrual
reading of A4, the bank-format convention).

**Purpose — the question the task asks:** this archetype is the design's OWN
test case for the protected-absence machinery — a healthy, consistent user
who rests ON PURPOSE 8 weeks a year. Three questions on the table:
(1) does the tree rest honestly (D114's "resting, never abandoned" + the
RHYTHM discount + the D099 copy) or does it misfire (E9 "revivals" on
planned returns, III-24 "comebacks" on planned returns); (2) does the
vacation month sit EXACTLY on the A3 twig boundary (14 active days in a
28-day February — the placement lottery); (3) does the VI Elsewhere family
reward this user's actual life (VI-1/VI-2 yes, VI-3/VI-4 never — the
off-grid honest miss). The walk also found a fourth, deeper question the
brief did not ask: **a 3×/week gym never fires a single twig at A3 = 15.**

Per this walk: the protected-absence machinery works (resting copy,
rhythm discount, periods entity) — but it LEAKS into E9 (16 false
"revivals") and III-24 (16 false "comebacks"), the A3 boundary is a
placement lottery with a guaranteed February miss, and the phyllodes
adaptation (E3, resource ≤ 0.4) fires on a user who is NOT sparse.

---

## 0. The synthetic user

A 4-year user. Pattern: **journal 5 days/week (Mon–Fri, ~150 words — the
≥40-word bar met always), gym 3/week (Mon/Wed/Fri, 1+ real logged sets,
full-body: squat/bench/deadlift/OHP), nutrition 2 meals/day (lunch +
dinner, ≥1 real item each), habits 2 daily (H1 "2L water", H2 "read 20
min").** No body weigh-ins, no media, no goals, no phases, no coach, no
imports, no backfill, no grace use — every event written same-day
(in-window, A1). **Vacations: 4 × 2 weeks/year (Aug 1–14, Nov 1–14,
Feb 1–14, May 1–14), 56 days/year, ZERO logging during them — true
off-grid.** The vacation periods are logged in the periods entity (D075/D104
row 8) at the boundary (the day before departure). **Birth anchor = Jun 20
2024 (a Thursday; the first event = the first journal entry, frozen per
D090 B / D100(5) / D102).**

The pinned weekly grid (exactly simulated; vacation weeks = zero):

| Day | Domain | Event |
|---|---|---|
| Mon–Fri (non-vacation) | Journal | 1 entry (~150 words) |
| Mon/Wed/Fri (non-vacation) | Gym | 1 workout (full-body, 1+ real sets) |
| every day (non-vacation) | Nutrition | 2 food logs (lunch + dinner) |
| every day (non-vacation) | Habits | H1 + H2 completions (2 events) |
| — | Body / Media / Goals | none, ever |

4-year totals (simulated): **journal 880 days · gym 528 days · nutrition
1,236 days · habits 1,236 days = 3,880 domain-days over 1,461 calendar days
(309 active days/year, 4 × 14 zero days/year).**

Fixed derived reality:

| Axis | Value | Derivation |
|---|---|---|
| F4 RESOURCE | **0.26** | 5.14 in-window events/active day ÷ ceiling 20 (F4; Mon/Wed/Fri = 6 events, Tue/Thu = 5, Sat/Sun = 4 → mean 36/7 = 5.14). The brief's "~6 ÷ 20 = 0.3" is the same reading with a rounded-up numerator — see V9 |
| F5 RHYTHM | **0.80** (discounted) / **0.64** (raw) | weekly active-day counts: 40 full weeks × 7 + 8 partial weeks {5,2,3,4,3,4,4,3} + 4 zero weeks. D114(1): the RHYTHM axis discounts protected absence — the 4 full-vacation weeks excluded from the series → mean 6.42, std 1.26 → 1 − CV = 0.80. Without the discount: std 2.11 → 0.64. **The discount is +0.16 and flips the character from "moderate" to "steady" — the mechanism VERIFIED (and V8: the F5 register row does not carry the rule)** |
| F6 BALANCE | **0.69** | Shannon evenness over the canonical 7 (F6/D104): vector {journal 220, habits 309, gym 132, nutrition 309, body 0, media 0, goals 0} → H = 1.3371 / ln 7 = 0.687. A 4-domain user's evenness ceiling is ln4/ln7 = 0.712; this user sits at 0.687 — **a buttress (E2, ≥0.7) near-miss that is structurally a no** (unequal shares across 4 domains, 3 zero domains) |
| F7 TENURE | 0.0 → **0.4** | stage-years/10, clamped (F7): 1/2/3/4 stage-years by year 1/2/3/4 |
| Active days/anchored yr | **309** | every 365-day window (F3) holds exactly 4 × 14 vacation zero-days → 309 in-window days — **≥ A4's 200 every year** |
| Twigs | journal **8** · gym **0** · nutrition **11** · habits **11** = 30/yr | A3, calendar-month reading (see §6 — the gym finding + the February boundary) |
| Rings | **0, forever** | A5: journal 220, habits 309, gym 132, nutrition 309 all pass ≥40 — but body 0, media 0, goals 0 fail → no canonical-7 ring-year ever (D114 F-12). The trunk is ring-less at 4 stage-years — honest, and exactly the prompt's "no canonical-7" read (its per-domain numbers were off — V9) |

## 1. Assumptions pinned (flagged, not register facts)

- **A1 — the vacation schedule:** Aug 1–14, Nov 1–14, Feb 1–14, May 1–14,
  every year, logged as vacation periods (D075/D104 row 8, protected
  presence) the day before departure. Zero events of ANY kind inside the
  ranges (true off-grid — including no `habit.rest_planned`, no rest
  flags). Placement matters enormously at the A3 boundary (V3) — this
  placement is the "vacation at the month's head" worst case.
- **A2 — the habit set:** 2 daily habits (H1, H2), 7/7 days when not on
  vacation → 309 completion days/year each. The brief's "habits 260"
  (5/week × 52) would change the II-family outcome materially (II-2/II-5/
  II-14 never fire, max streak 5); the daily read is the honest "steady
  habits" reading of the archetype and matches the 309 non-vacation-day
  figure — flagged as a cadence choice (see V9).
- **A3 — the PR cadence:** ~24 PRs/year (2/month rotating across bench,
  squat, deadlift; OHP plateaus after year 1; est1RM progression, never
  est1RM-substituted). This drives III-3/III-4/III-5/III-6/III-9/III-10/
  III-11/IX-4 and the tonnage ladder. A slower lifter halves the flood
  (V7); the honest-arithmetic read is pinned here.
- **A4 — the tonnage cadence:** ~7,800 kg/week real weight-mode sets
  (bench 3×8@60, squat 3×8@80, DL 3×5@100, OHP 3×8@40 + ~2,000 kg
  accessories) × 46 active weeks ≈ **360k kg/yr** → R44 100k at ~week 14
  (Sep 2024), R45 500k at ~1.4 yr (Nov 2025), R46 1M at ~2.8 yr (Apr
  2027), R47 5M never.
- **A5 — no body data:** the user never weighs in → `rollingBW` is
  undefined → the BW-ratio trophies (III-12..III-18) and the entire V
  family are structurally dead (flagged as the honest miss, V10).
- **A6 — the walk's 4 anchored windows** close at d365/d730/d1095/d1460
  (Jun 20 of 2025/2026/2027/2028); the walk ends d1461 (Jun 19 2028, the
  day before the 4th birthday). Stage-year accrual: d365, d730, d1095,
  d1460 — window-based (A4 anchored; run 13's V5 accrual-vs-anchored
  question does not arise: both readings agree here, 309 ≥ 200).
- **A7 — II-5/II-14's per-habit anchored windows** close on the habit's
  own first-completion anniversary (Jun 19 of each year); III-27's on the
  first-workout anniversary (Jun 20); IV-13's on the first-food-log
  anniversary (Jun 19); VI-2's on the first-vacation-day anniversary
  (Aug 14). Calendar-mapped trophy dates (I-15, I-12) computed from the
  pinned weekday grid (verified below).

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | d1 (Jun 20 2024) | first in-window event (register B1 / D090 A) |
| B2 SEEDLING→SAPLING | **d15** (Jul 4 2024) | register B2: ≥15 in-window days within any 30-day window, any-domain-mixed — the first window (d1–30) is 30/30 active (the first vacation is Aug 1), so the 15th in-window day = d15. **Even the worst 30-day window (a vacation fully inside) holds 16 active days (30 − 14) ≥ 15 — B2 is vacation-proof at 14-day rests** |
| B3 SAPLING→POLE | **d365** (Jun 20 2025) | 1 stage-year: 309 ≥ 200 in-window days in the anchored window (A4) — the 365−56 = 309 reading from the brief, verified |
| B4 POLE→MATURE | **d730** (Jun 20 2026) | ≥2 stage-years ✓ (2nd window: 309 ≥ 200) AND ≥1 domain ≥90 in-window days in its best anchored year — nutrition/habits 309 (journal 220, gym 132 all pass) ✓. Maturity at year 2 — the brief's "year 2" verified. FIRST BLOOM same day (D092 rule 2) |
| B5 MATURE→OLD-GROWTH | NEVER | requires ≥10 stage-years (register B5) — 4-year run |

**Stage reached in 4 years: MATURE (year 2).** Stage-years: 4.

## 3. Checkpoint-by-checkpoint walk

### Month 3 — d92 (Sep 20 2024) (SEEDLING)
- **Stage:** SEEDLING (B2 at d15). **Stage-years:** 0 (POLE at d365).
- **Axes:** F4 0.26 · F5 0.80 (discounted; 0.64 raw) · F6 0.69 · F7 0.0.
- **Organs:** the 5 branch-buds on the stem (journal, habits, gym,
  nutrition, goals — body/media ride forks, D104); ~65 leaf-buds from the
  banked journal content (D115(3) M-2 — meals feed the sap system and
  habits the bud garden per the D088 duality, so the leaf-buds are the
  entries); the goals branch-bud is still empty —
  it will stay that way for all 4 years (no goals — the tree's honest
  fifth branch: a permanent bud, never a scar). **Twigs: 8** (journal 2,
  nutrition 3, habits 3, **gym 0** — the gym branch has been present on
  ~26 of 92 days and has NO twig; the A3 cadence finding, V2).
- **Bank (21 buds):** S — I-1, II-1, III-1, IV-1, VI-1 (Aug 1 — the FIRST
  vacation fires Off the Grid at month 2), IX-1-S (d1) · R — II-2 ×2 (d7),
  III-2 (d5), III-3 ×6 (Jul–Sep), I-6 (~Aug 23), VI-2 (Aug 14), IX-1-R
  (~Jul 15), IX-4-R (Jul 5) · B — II-6 ×2 (Jul 31 — both habits' first
  Perfect Month; August's is broken by the vacation). Counter (C7): "2
  Branch · 13 Root · 6 Sprout" (III-4 at ~Nov and IX-1-B at ~Oct pending).
- **Rings:** 0. **Why-panel:** "Three months of weekdays — your journal,
  habits, and meals branches are growing; your gym branch is present but
  its canopy is still bare (the 15-day twig bar)."
- **The protected absence (VERIFIED live, first occurrence):** Aug 1–14 —
  the periods entity marks `periods [{type: vacation, startKey:
  2024-08-01, endKey: 2024-08-14}]`; all 4 active branches render the
  D099/D114 "resting" copy — NEVER "abandoned"; the canopy holds (no
  autumn-style leaf-fall for a vacation); the RHYTHM axis discounts the
  two full vacation weeks. **BUT: on Aug 15 the engine logs a REVIVAL on
  every branch (E9: "a dormancy period ends") — the first of 16 false
  reaction-wood records (V1).** The tree is semi-dormant 2 weeks × 4/yr,
  by design — and the design's own revival trigger cannot tell "planned
  return" from "comeback".

### Year 1 — d365 (Jun 20 2025) (POLE)
- **Stage:** POLE (B3 at d365). **Stage-years:** 1. **C6 unlocked**
  (leaf-cluster granularity at POLE — per-entry leaves render on zoom).
- **Axes:** F4 0.26 · F5 0.80 · F6 0.69 · F7 0.1.
- **Twigs:** journal 8 · gym 0 · nutrition 11 · habits 11 = **30/yr**
  (C5 ≤ 12/branch ✓ — max 11). The February 2025 twig MISS: Feb 1–14
  vacation → Feb 15–28 = 14 active days < 15 → nutrition/habits lose
  February; journal lost all four vacation months (10–12 weekday days <
  15); gym lost every month (V2/V3).
- **Bank (~93 buds):** S 6 · R ~51 (III-3 ×24, III-20 ×10, III-4, III-2,
  II-2 ×2, I-6, I-9-R ~Feb, IV-2 ×5, IV-6 ~Jan, VI-1, VI-2, IX-1-R,
  IX-4-R, III-19-R44 ~Sep) · B ~27 (II-6 ×16, III-9 ×8, IX-1-B, IX-4-B
  ~Nov, I-12-B Jun 20) · H ~3 (III-10 ×2, IX-1-H ~Mar) · **Ring 6**
  (II-5 ×2, II-12 ×2, VIII-1, III-26 — all Jun 19/20 ± 1) — Ring stays
  banked (D092 rule 2). **Grove: 0 at this checkpoint — III-11 (the
  12th distinct PR month) lands Jul 2025, days past d365: the tree's
  first Grove bud (D096's tier-marked special form) opens year 2.**
- **Rings:** 0 (no canonical-7). **Periods:** 4 logged (Aug, Nov, Feb,
  May). **E9: 4 false revivals so far.**

### Year 2 — d730 (Jun 20 2026) (MATURE — the FIRST BLOOM)
- **Stage:** MATURE (B4 at d730 — ≥2 stage-years + nutrition 309 ≥ 90).
  **Stage-years:** 2. **D1 (structural-mod floor) met** (D093: floors read
  stage-years).
- **Axes:** F4 0.26 · F5 0.80 · F6 0.69 · F7 0.2.
- **Twigs:** 30 more (journal 8 · gym 0 · nutrition 11 · habits 11).
- **The first bloom (D092 rule 2, D099 magnitude-order + waves):** ALL
  banked Sprout/Root/Branch/Heartwood burst — **~151 buds**: S 6 · R ~83
  (III-3 now ×48, III-20 ×13, IV-2 ×9, VI-2 ×2, I-6, I-9-R, II-2 ×2,
  III-2, III-4, IV-6, VI-1, IX-1-R, IX-4-R, III-19-R44) · B 55 (II-6 ×32,
  III-9 ×16, III-5, III-8-bench, I-12-B, I-15 ×1, III-19-R45, IX-1-B,
  IX-4-B) · H 7 (III-10 ×6, IX-1-H). **C1/C2: ≤15/event, ≤4 waves (60/
  season)** → the burst takes 4 waves in the 2026 flowering season (60),
  then **~91 flowers overflow into spring 2027 and spring 2028** (C2:
  "overflow banks to the NEXT spring — no flower lost"). The bank counter
  drips "~91 pending" for a year — see V7 (the flood).
- **Ring/Grove stay banked** (D092 rules 2/4/5): II-5 ×4, II-12 ×4,
  VIII-1, VIII-2 (Jun 20 2026), III-26 ×2, IX-1-Ring (Mar 2027 — pending)
  + the III-11 Grove → the spring-2027 annual bloom.
- **E3 phyllodes signature now live** (resource 0.26 ≤ 0.4, sustained;
  D1 met) → **phyllodes pending on the tree, manifest at the spring-2027
  annual bloom (D093) — the coherence violation V4.** E9: 8 false
  revivals.
- **Why-panel:** "Your tree reached maturity — the first bloom is a
  season of blooming; 151 buds burst across four waves, ~91 more wait for
  next spring. Your trunk has no rings yet — three of the seven presence
  domains are still silent (body, media, goals)."

### Year 3 — d1095 (Jun 20 2027) (MATURE — the first ANNUAL bloom)
- **Stage:** MATURE. **Stage-years:** 3. **D2 (buttress floor) met.**
- **Axes:** F4 0.26 · F5 0.80 · F6 0.69 · F7 0.3.
- **The spring-2027 annual bloom (D085/D092/D093/D095):** the III-11
  Grove manifests as **THE TRANSFORMATION — the crown
  (legendAchievementId = III-11, the tree's first/rarest Grove, C4)** +
  13 Ring-tier flowers (II-5 ×4, II-12 ×4, VIII-1, VIII-2, III-26 ×2,
  IX-1-Ring) + the first-bloom overflow (60 of ~91) + **the phyllodes
  transformation (E3)** — a 4-wave event, within C1/C2. Winter-earned
  buds from Dec 2026–Feb 2027 bank to this flush (D095) ✓.
- **The June-2027 Grove pile-up (the C4 tie-break, V6):** II-14 ×2
  (Jun 19, 3 consecutive 309-day windows ≥ 300), IV-13 (Jun 19, 3
  consecutive 309-day windows ≥ 250), III-27 (Jun 20, 3 consecutive
  132-day windows ≥ 80) — four Groves fire within 48 hours, all banked
  to spring 2028.
- **Rings:** 0. **Periods:** 12 logged. **E9: 12 false revivals.**

### Year 4 — d1460 (Jun 19 2028) (MATURE, 4 stage-years)
- **Stage:** MATURE. **Stage-years:** 4. **F7 0.4.** D3 (caudex floor, 5
  stage-years) NOT met.
- **Axes:** F4 0.26 · F5 0.80 · F6 0.69 · F7 0.4.
- **The spring-2028 annual bloom:** 4 Groves (II-14 ×2, III-27, IV-13) —
  **ONE transformation slot (C4), three "large blooms"** — the tie-break
  is unspecified (V6) · Ring-tier: II-5 ×2 (window 3), II-12 ×2, III-26,
  IX-1-Ring if not already bloomed + the first-bloom overflow tail (~31)
  + winter-earned · I-12-H (Heartwood, Jun 20 2028 — the 3rd distinct
  year lands on a Tuesday; the 2-year band fired in 2025, the 3-year band
  took until 2028 because Jun 20 2026 (Sat) and Jun 20 2027 (Sun) fell on
  weekends — G2's "once at 2, once at 3, once at 5" schedule holds, with
  the 3-year fire delayed by the 5-day/week journal's honest weekend
  gaps) · IV-7 (Heartwood, ~Apr 2028 — the 1,000th food day) · I-15 does
  NOT fire in 2028 (Jan 1 2028 = Saturday — no entry; the 3-fire streak
  of Bookended breaks on a weekend — honest).
- **Rings:** 0. **Periods:** 16 logged (the full 56-day/year bank).
- **E9: 16 false revivals — the tree carries 16 reaction-wood records and
  epicormic shoots** it has never earned (V1).
- **Final counts:** ~319 trophy fires over 4 years (§7) · 30 twigs/yr ·
  0 rings · 4 stage-years · 1 crown (III-11) · 5 Groves (III-11, II-14
  ×2, III-27, IV-13) · phyllodes manifested (V4) · 0 revivals that should
  exist (V1).

## 4. The protected-absence verification (D114/D099/D104 row 8 — the D114 quiet-week philosophy, tested)

The mechanism, walked end to end:

| Layer | As locked | This walk | Verdict |
|---|---|---|---|
| Periods entity (D104 row 8, D107 model) | `periods [{type, startKey, endKey}]`, protected presence, NO branch, feeds base + dormancy logic | 16 periods, all logged at departure boundaries, zero in-range events | ✓ |
| Branch copy (D099/D114) | protected-absence branch says **"resting"**, never "abandoned" | all 4 active branches render "resting — vacation Aug 1–14" during every range; the goals bud is untouched | ✓ |
| Dormancy visuals | protected absence = semi-dormant rest, canopy holds | 2 weeks × 4/yr of held canopy; no leaf-fall, no scar, no "dormant since" stamp | ✓ (with the V1 leak: the *return* is mis-stamped) |
| RHYTHM discount (D114(1)) | the axis discounts protected absence "like planned rests" | full-vacation weeks excluded from the weekly series → **0.80 vs 0.64 raw (+0.16)** — the tree reads steady, never tanked | ✓ mechanism works — **V8: the F5 register row does not carry the rule; only D114(1) does** |
| A4 stage-years | in-window days only (D100 predicate) | 309 ≥ 200 every window — vacations never cost a stage-year | ✓ |
| A3 twigs | in-window days only | the February miss (V3) — protected rest does NOT protect the twig | ⚠ boundary lottery |
| E9 revival | "a dormancy period ends" — universal, no gate | fires 4×/yr on planned returns — **the leak** | ✗ V1 |
| III-24 (achievement) | gap ≥14 days zero-workouts + PR within 60 days | the 14-day vacation IS a 14-day gap → "Back at It" fires on every planned return ×16 | ✗ V5 |

**The D114 philosophy in one sentence: the tree rests, never fails — and
this walk shows the resting machinery works, except where the revival
triggers (E9) and the comeback trophies (III-24) fail to read the
periods entity. The "resting" copy is downstream of data the trigger
surface never consults.**

## 5. The axes (F4–F7)

| Axis | Value | Notes |
|---|---|---|
| F4 RESOURCE | **0.26** | 5.14 events/active day ÷ 20. The ÷20 ceiling (D105 note: "reads high, kept for now") compresses this user to the *bottom third* of the scale despite logging 5 events/day — the same compression that mis-fires E3 (V4). The brief's 0.3 estimate: numerator rounded to ~6 — the honest value is 0.26 (V9) |
| F5 RHYTHM | **0.80 / 0.64** | the 4 dips are the whole story: 8 partial weeks and 4 zero weeks per year. Discounted: 0.80 ("steady — the dips are planned"); raw: 0.64 ("moderate — the dips look like bursts"). The discount is the difference between two characters. **The F5 row needs the D114 rule written into it (V8)** |
| F6 BALANCE | **0.69** | 4 of 7 domains; evenness 0.687. The 4-domain ceiling (ln4/ln7 = 0.712) means a balanced 4-domain user caps just above the buttress bar (0.7) — this user's gym-vs-nutrition imbalance (132 vs 309) keeps them at 0.69. E2: no — and honestly so (a 4-domain vacationer is not a multi-domain integrator) |
| F7 TENURE | 0.1 → 0.4 | 4 stage-years/10, clamped at 1 |

## 6. Twigs and rings (A3/A4/A5)

**Per-domain twigs per year (A3, calendar-month reading):**

| Branch | Full months | Vacation months | Twigs/yr |
|---|---|---|---|
| Journal (5/week) | ~22 weekdays ≥ 15 ✓ (8 mo) | Feb 10 · May 12 · Aug 12 · Nov 11 — all < 15 ✗ | **8** |
| Nutrition (daily) | 28–31 ✓ (8 mo) | Feb **14** ✗ · May 17 ✓ · Aug 17 ✓ · Nov 16 ✓ | **11** |
| Habits (daily) | 28–31 ✓ (8 mo) | same as nutrition | **11** |
| Gym (3/week) | **12–14 every month — NEVER ≥ 15** | 6–8 | **0, forever** |

**V2 — the gym finding (the run's deepest):** a steady 3×/week gym = ~13
in-window days/month; at A3 = 15 the gym branch never grows a twig in 4
years of real presence (132 days/yr — 36% of the year). The "canopy
density IS consistency made visible" (D088) inverts: the most consistent
cadence of this user's life renders as the bare branch. Robust to the
month-unit choice: the sliding-30-day reading maxes at 12.86 gym days.

**V3 — the February boundary (the brief's question, answered):** a 2-week
vacation at a month's head leaves exactly 28 − 14 = **14** in-window days
in February — one day under A3's 15 → the nutrition/habits branches lose
the February twig, and the journal branch loses all four vacation months
(10–12 weekdays). Place the same 56 rest days mid-month (e.g., Jan 25–
Feb 7) and every month fires 12 twigs. **Same life, same rest, different
canopy — the twig outcome is a placement lottery.** The locked D104 row 8
says vacation periods are protected PRESENCE — but A3 reads only in-window
days, so the protection stops at the dormancy layer and never reaches the
twig. The "resting month" either twigs or not on geography.

**A4/A5:** 309 ≥ 200 every anchored window → 4 stage-years (B3/B4 timing
verified against the brief's "year 1 / year 2"). A5: 4 of 7 domains pass
≥40 → **0 ring-years, 0 rings, 0 VIII ring-family trophies** — the trunk
is a 4-year-old column with a crown and no rings. Honest (the user chose
4 domains; D114 F-12's canonical-7 ring bar does its job).

## 7. The bank (trophy fires, 4 years — the full ledger)

**Every fire traced to its condition (scan-outputs/02-achievements.md).**
Totals: **S 6 · R ~142 · B ~125 · H 18 · Ring 23 · Grove 5 = 319 fires.**

| Family | Fires | Who (tier × count) |
|---|---|---|
| I Long Conversation | 10 | I-1 S · I-6 R · I-7 B (Sep 2026) · I-9 R→B (Feb 2025, Aug 2027) · I-12 B (2025) + H (Jun 2028) · I-15 H ×3 (2025/26/27; 2028 miss) |
| II Unbroken Chain | 85 | II-1 S · II-2 R ×2 · **II-5 Ring ×8** (309 ≥ 300 every per-habit window) · **II-6 B ×64** (2 habits × 8 clean months × 4 yrs) · II-12 Ring ×8 · **II-14 Grove ×2** (year 3) |
| III Iron Ledger | ~188 | III-1 S · III-2 R · **III-3 R ×96** (24 PRs/yr) · III-4 R · III-5 B · III-6 H (Jul 2026) · III-8 B ×3 (bench/squat/DL 10th PRs) · **III-9 B ×32** · III-10 H ×12 · **III-11 Grove** (Jul 2025 — the crown) · III-19 R44 R + R45 B + R46 H · III-20 R ×15 · **III-24 B ×16 — THE FALSE COMEBACKS (V5)** · III-26 Ring ×4 · **III-27 Grove** (year 3) |
| IV Fuel Line | 21 | IV-1 S · IV-2 R ×17 · IV-6 B · IV-7 H (Apr 2028) · **IV-13 Grove** (year 3) |
| V Shape of Things | **0** | no weigh-ins — the whole family dead (V10) |
| VI Elsewhere | **5** | VI-1 S (Aug 2024 — the first vacation, duration 14 ≥ 7) · **VI-2 R ×4** (56 ≥ 14-day default threshold, once per anchored window — the threshold question from the brief: **the default is 14 days/year, user-editable; 56 crosses it 4×**) · **VI-3 · VI-4 — NEVER** (V10: zero journal/vlog on vacation — the off-grid honest miss) |
| VII Proof of Life | 0 | no media (V10) |
| VIII Rings | 2 | VIII-1 Ring (2025) · VIII-2 Ring (2026) — the longevity Rings fire; every ring-brand trophy (VIII-5+) is dead on no canonical-7 |
| IX Full Circle | 8 | IX-1 S→R→B→H (2024–2025) + Ring (Mar 2027) · IX-4 R→B→H (2024, ~Nov 2024, ~Sep 2026) — IX-2/IX-3/IX-5 never |

**Never-fires worth naming (each honest, each a data truth):** I-2/I-3
(5-day journal max streak 5 — a weekend always breaks the 7/90-day
streaks), I-5/I-16/I-17 (220 < 300 journal days), I-8/I-9-HW/Grove
(880 entries, 132k words < 1,000 / 500k), I-10 (150-word entries),
I-11 (14-day gaps < 21), **I-13 (Unprompted — NEVER: the 2-meals/day
logger has zero journal-only days; the "solitary reflection" trophy is
structurally impossible while every journal day carries nutrition
events)**, I-14/IV-3/4/5/8/9/10/11/12 (no phases), II-3/II-4 (max streak
77 — the vacations cap every habit streak below 100), II-7/II-8/II-13
(2 habits), **II-10 Honest Rest — NEVER (true off-grid: no rest events
logged, so the rest-recognition trophy can't see the rest — V10)**,
II-11 (14-day gaps < 30), II-15, III-7 (100 PRs at 4.2 yr), III-12..III-18
(no rollingBW — V10), III-21/III-22 (**the vacation-broken consistency
family: max 11 consecutive weeks between vacation ends and the next
vacation start — the 12-week Trimester can never close, and the
1-rest-week freeze (III-21) cannot bridge a 2-week vacation** — an honest
economy consequence, not a bug), III-25 (528 < 1,000 sessions), III-28,
IV-14, V-all, VII-all, VIII-3+, IX-2/3/5.

## 8. Adaptations (E-group, gates vs signatures)

| Row | Gate (D1–D3 + stage) | Signature | This user | Fires? |
|---|---|---|---|---|
| E1 caudex | D3 (5 stage-yrs) | tenure ≥0.7 AND resource ≤0.6 | tenure 0.4 | no (floor not met) |
| E2 buttress | D2 (3) + POLE | balance ≥0.7 AND resource ≥0.6 | balance 0.69 · resource 0.26 | **no — near-miss on both (the honest no)** |
| E3 phyllodes | D1 (2) + SEEDLING | **resource ≤0.4, sustained** | resource 0.26, sustained 4 yrs | **YES — spring-2027 manifest. VIOLATION (V4)** |
| E4 cladodes | D1 + SAPLING | streak-without-entries divergence ≥0.6 | no such pattern | no |
| E5 storage leaves | D1 + SEEDLING | media share ≥0.5 | media 0 | no |
| E6 thorns | D1 + SAPLING | 365-day streak + tenure ≥2 | max streak 77 | no |
| E7 spines | — | 100-day streak | max streak 77 | no |
| E8 tendrils | — | live >1yr goal | no goals | no |
| **E9 reaction wood** | universal, NO gate | **a dormancy period ends** | 16 vacation returns | **YES ×16 — VIOLATION (V1)** |
| E10 contractile | — | 3 consecutive stage-years with RISING active-day counts | 309, 309, 309, 309 — flat | no (flat is not rising; the steady vacationer never qualifies — honest) |
| E11 mycorrhizal | — | coach engagement ≥ threshold | no coach | no |
| E12 stolons | — | L-10 insight ≥3 monthly windows | none pinned | no |
| E13 bracts | — | no gate | blooms carry bracts | ✓ (ceremony display) |
| E14 bud scales | — | dormant-habit state | habits rest, never go dormant | no |

**The two fires are both wrong in different ways:** E3 fires on data that
isn't sparse (0.26 is the ÷20-scale reading of a 5-events/day logger —
V4), and E9 fires on data that isn't a comeback (V1).

## 9. Blooms, schedules, caps, economy (D092/D093/D095/D099 + C-group)

- **The schedules hold:** pre-maturity banking (D092 rule 1) ✓ · the
  first bloom at maturity bursting S/R/B/H with Ring/Grove staying banked
  (rule 2) ✓ · post-maturity direct earns in the growing season, winter
  earns banking to the spring flush (D095) ✓ — e.g., I-15 Dec 31 fires
  bank to spring; III-6 Sep 2026 blooms on earn · Ring at the annual
  bloom, Grove as the transformation (rules 4/5) ✓ · modifications at the
  next annual bloom (D093) ✓ · F-03 bract flourish: n/a (no PR-ceremony
  events defined in this archetype — PRs fire New Number flowers, not
  flourishes).
- **C1/C2 (the caps hold, and the flood shows why they exist):** the
  first bloom = ~151 buds → 4 waves in 2026 (60) + 60 in spring 2027 +
  ~31 in spring 2028 — "no flower lost" ✓, but the bank counter drips
  "~91 pending" across a full year. Post-maturity the tree blooms ~70–90
  flowers/season directly (III-3 ×24, II-6 ×16, III-9 ×8, IV-2 ×4,
  III-24 ×4, III-10 ×3 …) — the ephemerality rule (D095: blooms hold
  through their flowering season, then fade) is the only thing keeping
  the canopy readable. **V7: the economy floods at ~80 fires/year; the
  per-PR Root (III-3 ×96) and per-month Branch (II-6 ×64, III-9 ×32)
  dominate the rarity ladder's common tiers.**
- **C3:** no habit-bud clusters (2 buds ≪ 30) ✓ — nothing to cluster.
- **C4:** the crown = III-11 (the first Grove, Jul 2025) → the
  spring-2027 transformation ✓. **V6: the spring-2028 bloom carries 4
  Groves for 1 transformation slot — the "first/rarest" tie-break is
  unspecified (all four are 3-consecutive-window chains of equal rarity;
  earn order spans Jun 19–20 2027).**
- **C5:** twigs ≤12/branch/yr ✓ (max 11); the 3-year retention window
  holds (years 1–3 render individually, year-0 twigs — none — merge).
- **C7:** the bank counter shows top-3 by tier + "+N more" ✓ (the
  pre-bloom counter's honesty was verified at every checkpoint).
- **F8:** the 4-year replay ≈ 8s at ~2s/yr ✓ — the time-lapse shows 16
  resting pauses, each a held canopy, and (as locked) 16 reaction-wood
  flashes that should not be there (V1).

## 10. Violations + tuning proposals (V1–V10)

**V1 — E9 fires 16 false "revivals" on protected returns (THE headline).
** The register's E9 trigger ("a revival — a dormancy period ends",
universal, no gate) is blind to the periods entity. Every vacation return
logs reaction-wood + epicormic records on all 4 branches — a healthy,
never-lapsing user accumulates 16 trauma marks. The semantic the design
intends (the brief's own framing): the revival = an UNPROTECTED dormancy
ending; the vacation-return is a planned return, not a comeback.
**Proposal:** amend the E9 trigger text (register row 9 + trigger table
B9): "a dormancy period ends **AND the end is not a protected-absence
end** (the periods entity / rest flags / quiet-weeks cover the ending
day)" — the derivation must not set `dormantSince` for protected periods
(D107's branch state) and must not log `revivals[dateKey]` at their end.
The honest tree for this user: 0 revivals, smooth bark, "resting" stamps
only. Dev-tunable via the register surface.

**V2 — A3 = 15 kills the gym twig for the 3×/week cadence (the deepest
finding).** 13 in-window days/month, forever below 15 → the most
consistent branch of this user's life renders bare for 4 years. D088's
"canopy density IS consistency" inverts. **Proposal:** the twig bar
becomes cadence-aware — e.g., ≥12 in-window days/month (3×/week floor:
3 × 4.33 ≈ 13 ≥ 12) or a week-based alternative ("present in ≥3 of the
month's weeks") — dev-tools calibration; the bare-branch alternative
(honest but confusing) documented if 15 stays.

**V3 — the A3 vacation-month placement lottery.** 14 active days in a
28-day February (vacation at the month's head) = a guaranteed twig miss;
mid-split vacations = 12 twigs. Same life, different canopy. D104 row 8
calls vacation periods protected presence; A3 reads only in-window days.
**Proposal:** an explicit A3 protected-absence clause — either (a)
proration ("in-window days + vacation days within the month ≥ 15" — the
resting month twigs; Feb = 14 + 14 ✓) mirroring the protected-presence
status, or (b) a locked "no proration — the honest dip renders" note in
the register so the February gap is a *decision*, not a lottery.

**V4 — E3 phyllodes fires on a user who is not sparse.** resource 0.26 ≤
0.4, sustained — the ÷20 ceiling (D105: "reads high, kept for now")
compresses a 5-events/day logger into the drought band; the tree grows
the desert adaptation at the spring-2027 bloom despite a lush canopy.
**Proposal:** tighten the E3 band (~≤0.25) or add the "stubborn"
co-condition (tenure ≥0.5 — the sparse-stubborn signature IS
multi-yearness, per the run-13 caudex test case) — dev-tunable;
otherwise the phyllodes band should be re-derived from the resource
scale's real distribution at the paper-run step.

**V5 — III-24 "Back at It" ×16 on planned returns (the achievement-side
leak).** The gap owner counts the 14-day vacation as a ≥14-day
zero-workout gap; the return + a PR within 60 days = the comeback trophy,
4×/year. The same protected-absence blindness as V1, one layer up.
**Proposal:** extend D114's protected-absence mechanism to the
achievement gap owners (vacation-period days excluded from the gap count
for III-24, I-11, II-11) — or explicitly accept it as celebratory
(decide, don't drift). The tree's E9 fix (V1) without this leaves the
flower system celebrating the same non-events.

**V6 — the C4 tie-break is unspecified.** Spring 2028: 4 equal-rarity
Groves (II-14 ×2, III-27, IV-13 — all 3-consecutive-window chains,
earned Jun 19–20 2027), 1 transformation slot. **Proposal:** a
deterministic rule — the earliest-earned Grove transforms (earn order,
stable across derivations, D108 order-independence) — the others render
as large blooms; the why-panel names the choice. Add the tie-break to the
C4 row.

**V7 — the flower economy floods (~319 fires / ~151 at the first bloom /
~80 post-maturity per year).** Every fire is condition-honest, but the
per-PR Root (III-3 ×96), per-month Branch (II-6 ×64, III-9 ×32) ladders
dilute the rarity ladder's common tiers and turn the first bloom into a
3-season drip (~91 overflow days). **Proposal:** the dev tools surface
"flowers per season" as a playable budget; consider tier-density
clustering (small-tier flowers cluster at LOD-2 like C3 bud clusters, the
D113 B M-05 within-tier variance already distinguishes them) or
per-family rate caps for the repeating common tiers.

**V8 — the F5 RHYTHM discount lives only in D114(1), not in the F5
register row.** 0.80 (discounted) vs 0.64 (raw) is a character flip
("steady" vs "moderate") resting on a rule the register never states.
**Proposal:** amend the F5 row: "weekly active-day counts with
protected-absence weeks (vacation periods, rest flags, quiet-weeks —
D114) excluded from the series"; the why-panel names the discounted
weeks ("2 weeks of planned rest discounted — Feb 2025").

**V9 — the run brief's ring numbers don't match its own cadences.**
"journal 309, gym 156, nutrition 260, habits 260" vs the brief's own
"5 days/week → 220 (309 = 365−56 contradicts 5/week), 3/week minus 56
vacation days → 132 (156 = 3×52 ignores vacations), 2/day → 309 (260 =
5×52), daily habits → 309." The honest computation is this walk's; the
brief's figures were arithmetic slips (309 was computed as all non-vacation
days; 156 and 260 as full-year 5×52 without vacation subtraction).
**Proposal:** none for the register — flag so subsequent runs inherit the
honest numbers, not the brief's.

**V10 — the off-grid honest misses (the VI family's data, as the brief
asked).** VI-3 "Still Here, Even Here" and VI-4 "Somewhere Else, Still
You" **never fire** for the truest off-grid vacationer: they require a
journal entry (VI-3) or journal + vlog (VI-4) on vacation days, and this
user logs nothing — by archetype design. The family's Sprout/Root
(VI-1/VI-2) fire (5 flowers: the fascicle identity at the base, D091);
the journal-on-vacation trophies are structurally unreachable. Same
family of honest miss: II-10 Honest Rest (no rest events logged — the
56 rest days are invisible to the rest-recognition trophy), and the
BW-ratio/body/media families (III-12..18, V, VII — no weigh-ins, no
media). **Proposal (small):** keep VI-3/4 exactly as-is — the off-grid
miss IS the design intent (the trophy rewards the person who journals
through rest; the off-grid user chooses VI-1/2 instead) — but add a
why-panel line when a vacation passes with zero entries so the miss reads
as a choice, not a punishment ("you were fully off-grid — VI-3 waits for
the trip you write through"). No register change required.

## 11. Verdict

**The protected-absence machinery works where it was specified — and
leaks where it wasn't.** The periods entity marks 16 rests; the branches
say "resting," never "abandoned"; the rhythm axis discounts the dips
(0.80, not 0.64); the stage clock, rings, and twigs stay honest; the
D114 quiet-week philosophy survives its hardest test — the tree rests,
never fails. But the same machine's blind spots produce the run's four
real findings: **E9 fabricates 16 revivals on planned returns (V1), the
A3 gym bar strands a 3×/week branch at zero twigs (V2), the February twig
is a placement lottery (V3), and E3 grows the desert adaptation on a
lush, resting canopy (V4)** — with the achievement-side echo (V5, III-24
×16) and the unspecified C4 tie-break (V6) as structural neighbors. The
VI family behaved exactly as the brief predicted: Off the Grid and Took
the Time fire on schedule; Still Here / Somewhere Else never do — the
honest miss, correctly priced by the design. **Verdict: the register
passes the vacation-heavy archetype's schedules, budgets, and honesty
contract — with four tuning items (V1–V4) that must land before the
engine contract freezes, and three clarifications (V5/V6/V8) that cost
one sentence each.**