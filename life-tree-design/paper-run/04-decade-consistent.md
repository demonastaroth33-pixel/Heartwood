# PAPER ARCHETYPE RUN 04 — "DECADE-CONSISTENT" (the 10-year ultimate-consistency life)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains) + Artifact 3 (trigger-correlation) + the D090–D115 records.
**Trophy conditions verified against:** ACHIEVEMENT-SCAN.md + scan-outputs/02-achievements.md
(verbatim per-trophy conditions, read in full for every trophy this walk counts).
**Cross-references:** run 01 (gym-heavy) V1–V12 · run 02 (journal-only) V1–V10 ·
run 03 (balanced) V-1…V-8 — cited where this pattern touches them. **Run note:**
the NOTES from runs 01/02 are applied: (V3) the first bloom pins to the spring
flush only if maturity lands in winter — this anchor matures in autumn, so the
pin is satisfied without use; (V4) F4 is under calibration — the walk reports the
primary reading plus the bracket; (V6) the same-day boundary is pinned (bloom =
Mar 1, bank evaluated at the bloom's opening); (V8) E6's trigger is under review —
the walk runs both readings.

---

## 0. The archetype

A 10-year user, the "ultimate consistency" life: **journal 4 days/week (~150
words) · 4 habits 6 days/week · gym 2 sessions/week · 2 meals/day · 1
weigh-in/week · 1 photo/week · 1 task/2 weeks · 1 coach check-in/2 weeks.**
Every year identical, all events in-window (written within ±3d grace, D100),
none imported, none future-dated (F10), no vacations, no misses, no backdating.
Birth anchor = **Sep 5 Y0** (the first in-window event, frozen per D090/D100/
D102). Walk = day 1 … day 3650 (Sep 5 Y10), checkpoints at Day 1 · Year 1 ·
Year 2 · Year 3 · Year 5 · Year 7 · Year 10 (each "Year N" = the N-th anchored
365-day window close, day 365×N).

| Domain | Cadence | In-window days/yr | A2 qualifying rule |
|---|---|---|---|
| Journal (`journal.created`) | 4 fixed weekdays/wk, ~150 words | 208 | ≥40 words, non-imported ✓ |
| Habits (`habit.completed`) | 4 habits × 6 days/wk (Sun = planned rest) | 312 | 1 completion ✓ |
| Gym (`workout.completed`) | Mon + Thu, 4 real sets each | 104 | ≥1 real logged set ✓ |
| Nutrition (`nutrition.logged`) | 2 meals/day | 365 | ≥1 real food-log ✓ |
| Body (`body.weighed`) | Monday, first-of-day | 52 | 1 canonical weigh-in ✓ |
| Media (`media.added`) | 1 photo, Monday | 52 | 1 add ✓ |
| Goals (`task.completed`) | 1 task / 2 weeks | 26 | task.completed ✓ |

**Key derived quantities (exact per the locks):**
- Active days/yr = **365** (nutrition daily; union of all domains) → A4 (≥200)
  passed every year → 1 stage-year/yr → **10 stage-years, B5 at day 3650**.
- Any-30-day window d1–d30: 30/30 in-window (nutrition + habits + journal +
  gym all present) → **B2 ticks day 15** (insensitive to the 15-vs-20 record
  drift, unlike run 01's 19/30).
- Events/week (presence-owner events): journal 4 + habits 36 + gym 2 + meals 14
  + weigh-in 1 + photo 1 + task 0.5 ≈ **58.5 → 8.36 events/active day**.
- Per-domain A5 ring days: journal 208 ✓ · habits 312 ✓ · gym 104 ✓ · nutrition
  365 ✓ · body 52 ✓ · media 52 ✓ · **goals 26 ✗ (< 40)** → **the canonical-7 A5
  trunk ring can NEVER close** (V-2 — the headline finding).
- Six-domain bar (VIII-5, goals EXCLUDED): all six pass every year → **10
  trophy rings brand** (V-2: the two ring definitions diverge for the first time
  in the run series).

**Assumption set (stated, then applied conservatively — every count in this run
is derivable from these):**

- **A1 — fixed weekly pattern, identical for 10 years:** journal Mon/Tue/Thu/Sun ·
  habits Mon–Sat (Sunday = planned rest, `habit.rest_planned` — protected
  presence) · gym Mon + Thu · weigh-in + photo Monday · task every other
  Wednesday · check-in every other week. (The brief pins "every year identical";
  fixed weekdays are the only way to do exact day math — run 01's A1 convention.)
- **A2 — alignment:** the two gym days are journal days AND habit days; weigh-in
  + photo land on a gym day (Monday). Consequence: the first Monday (day ~4) is a
  **full-six day** → **IX-2 Six for Six fires week 1** (the CROWN candidate); the
  full-circle days (IX-1) run at the aligned rate ≈ 2/week ≈ 104/yr. *Sensitivity
  flagged:* without alignment, IX-2 fires ~1/yr probabilistically (first at
  ~d350) and IX-1 halves to ~51/yr.
- **A3 — no fixed clock slots** → the robot-consistency set (I-4 Same Time, II-9
  Like Clockwork, V-3 Same Hour Same Scale, IV-5 No Deviation, IX-5 Ghost in the
  Machine) stays unearned — the runs 01/03 conservative convention. III-22 The
  Schedule Never Breaks (weekday-set only, no hour) DOES fire under A1.
- **A4 — PR model:** 2 sessions/week, slow linear gains → **~10 lifetime PRs/yr**
  (III-3 ×100 over 10 yr; III-4 10th at ~d365, III-5 25th at ~d912, III-6 50th at
  ~d1825, III-7 100th at **d3650 — the final checkpoint**; III-8 ×4 (10 PRs on
  each of 4 lifts); III-9 PR Season ~5/yr; III-11 A PR Every Season ~d515; III-20
  Heaviest Session ~5/yr; IX-4 journal+PR days ≈ 5.7/yr). Absolute rungs
  R1–R47 and the est1RM-ratio gates (III-12..III-18, III-13/14/15/16/17) are
  EXCLUDED — no strength profile in the brief (run 03's A4 convention).
- **A5 — planned-rest streak semantics** (scan-outputs/02-achievements.md:85:
  "streaks still freeze, Honest Rest still fires"): the weekly planned rest
  FREEZES habit streaks, so II-2 One Week In (d7), II-3 A Hundred Days (d100),
  II-4 The Long Haul (d500) fire; II-10 Honest Rest NEVER fires (its bar is an
  active streak ≥14 days on BOTH sides of the rest — a weekly rest has 6).
- **A6 — no phases, no vacations, no vlogs, no 21-day gaps** → phase-gated
  trophies (IV-3/4/8/9/12, I-14), all of VI, all of VII, I-11, II-11/13, III-23/24
  unearned; the VII family is vlog-locked per 03-V-7 (photo-only media = presence
  without flowers).
- **A7 — one live long-horizon goal (>1 yr) exists** → E8 tendrils (run 03's A7).
- **A8 — coach check-ins 26/yr** → E11 mycorrhizal open (owner threshold still
  undefined — 02-V7).

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 2 drifts)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | 40-word journal · real set · real food-log · canonical weigh-in · 1 habit · 1 media add |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ as written | **Fails gym/body/media/goals — V-4** |
| A4 | stage-year ≥200 active days | ✓ | 365/yr → 10 stage-years |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | **goals 26 < 40 → 0 trunk rings — V-2** |
| B1 | first in-window event | ✓ | Sep 5, day 1 |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | Day 15 (30/30) — insensitive to the 15-vs-20 drift |
| B3 | 1 stage-year | ✓ | Sep 5 Y1 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Sep 5 Y2 — journal 208 ≥ 90; **maturity lands in AUTUMN (in-season)** |
| B5 | ≥10 stage-years | ✓ | **Sep 5 Y10 → OLD-GROWTH** |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 60 of ~161 — overflow structural (V-1) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | The queue never drains (V-1) |
| C3 | ≥30 buds/branch → clusters | ✓ | **Habit branch ≈ 275 buds → clusters engage** |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ mechanically | Crown = IX-2; legends VIII-7 (Y4), VIII-8 (Y6) — dilution note (V-1) |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | ✓ | 12/yr on 3 branches; 108 render / 252 merged at Y10 |
| C7 | bank counter top-3 + count | ✓ | "top-3 + ~480 more" at Y10 — honest but absurd (V-1) |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | Sep 5 Y2 / Y3 / Y5 |
| E1–E14 | signatures | ✓ read | See §6 — **the E1/E2 resource boundary is the headline** |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | Sep 5 maturity ∈ autumn = growing season — the V3 winter-pin never binds |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | **0.42 primary · 0.50 per the brief's arithmetic · 0.82–0.85 set-counted — V-3/V-7** |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ | **1.0** (7 active days every week — nutrition daily) |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ | **0.84** |
| F7 | TENURE = stage-years/10 | ✓ | 0.1 → **1.0 at Y10** |
| F8 | replay ~2s/yr | ✓ | 10-yr time-lapse ≈ 20–24s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records ≥20
(02-V1, 03-V-6). This archetype is *insensitive* (30/30 in the first window) —
the drift remains unfrozen, but no longer decisive for any run so far.
**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; no trophy in ANY family is a 365-day streak (II-4 The Long Haul is
500-day; II-12 is an anniversary touch) — 03-V-4/01-V8 confirmed again (V-6).

---

## 2. The walk

### CHECKPOINT DAY 1 — Sep 5 Y0 (the seed cracks)

- **B1 tick:** first in-window event (journal, ~150 words) → SEED → SEEDLING.
  Germination ceremony (D094: 5 branch-buds on the stem).
- **Earned in week 1 (all buds, tier-marked per D096):** **I-1** Ink on the Page
  (S, d1) · **II-1** Day One (S, d1) · **III-1** First Rep Logged (S, d1) ·
  **IV-1** First Plate Logged (S, d1) · **V-1** First Measurement (S, d1) ·
  **IX-1** Full Circle Day — Sprout step (S, d1 — journal+habits+gym+nutrition
  same day ✓) · **II-2** One Week In ×4 (R, d7 — one per habit) · **III-2** The
  Basics (R, d8 — the 4 lifts logged across the first two sessions, A1) ·
  **I-2** A Week of Honesty (R, d12 — 7 consecutive qualifying journal days at
  4/wk = d12) · **IX-2** Six for Six (**Grove, d4** — the first Monday: all six
  domains on one dayKey, A2) — **the first-earned Grove ever → the CROWN
  candidate (C4)**.
- **Axes:** RESOURCE 0.42 (8.36 events/active day ÷ 20 — the stable decade
  reading, see §3) · RHYTHM 1.0 · BALANCE forming (~d30+) · TENURE 0.
- **Rings 0 · Twigs 0.** **Why-panel:** "SEEDLING · age 1 day · 12 buds (6
  Sprout, 5 Root, 1 Grove) · your first six-domain day earned the crown
  candidate · next tick: SAPLING at 15 mixed days (day 15)."

### CHECKPOINT YEAR 1 — Sep 5 Y1 (day 365) — POLE + RING 1

- **B2 tick (day 15):** 30/30 mixed → SEEDLING → SAPLING.
- **B3 tick (day 365):** stage-year 1 (365 ≥ 200) → SAPLING → POLE. Leaf
  granularity unlocks (C6). **F7 TENURE 0.1.**
- **RING 1 (trophy ring):** the six-domain window closes (journal 208 · habits
  312 · gym 104 · nutrition 365 · body 52 · media 52 — all ≥1 qualifying day) →
  **VIII-5 Life, Fully Logged (Heartwood) fires — the first ring brands** (the
  VIII ring = six-domain, goals excluded — see V-2). **VIII-11 Pith (Sprout,
  rings ≥1) fires on the trunk** — pre-maturity, banks to the first bloom.
- **Earned (cumulative ≈ 134 buds):** Sprout 7 (incl. VIII-11) · Root ~36 (I-2,
  I-6 d88, I-9-R d292 — 25k words, II-2 ×4, III-2, III-3 ×10, III-4 d365,
  III-19-R d182 — R44 100k kg tonnage, III-20 ×10, IV-2 d30, V-2 d84, IX-1-R d35,
  IX-4-R d60) · Branch ~75 (I-3 d158 — the 90-day streak-run, II-8 ×17, III-21
  ×4, III-9 ×5, III-22 ×2 (26-week exact weekday-set — A1), VIII-6 ×52 (six-
  domain weeks — 52/yr), IV-6 d180, V-5-B d183, IX-1-B d175) · Heartwood 6
  (II-3 ×4 d100 — **E7 spines texture from d100**, VIII-5, V-7 d180 — 6
  consecutive photo months) · Ring 9 (II-5 ×4 — 312 ≥ 300 completion days ✓,
  II-12 ×4 anniversary bands, VIII-1 — 3 domains in 12/12 months) · **Grove 1
  (IX-2)**.
- **I-5 Full Orbit: NOT earned — and never will be.** 300 qualifying journal
  days in an anchored year vs 208/yr. **The journal Ring tier is structurally
  dead for a 4-days/week cadence (V-5).**
- **Axes:** RESOURCE 0.42 · RHYTHM 1.0 · BALANCE **0.84** (stable) · TENURE 0.1.
- **First winter (Dec 1 Y0) passed:** winter journal entries became leaf-buds on
  the bare branches (D095(2)); winter-earned trophies (II-4 not yet — d500 =
  Jan Y2) bank to the spring flush.
- **Why-panel:** "POLE · age 1 · ring 1 (six-domain) · 134 buds · your trunk
  holds its first sliver — the seven-domain brand is a different ring (V-2) ·
  next tick: MATURITY at 2 stage-years."

### CHECKPOINT YEAR 2 — Sep 5 Y2 (day 730) — MATURITY, IN AUTUMN + THE FIRST BLOOM

- **B4 tick (day 730):** 2 stage-years AND journal's best anchored year = 208 ≥
  90 in-window days ✓ → POLE → **MATURE** (pioneer-speed ✓). **D1 floor (2)
  met.** The date: Sep 5 = 4 days into autumn (F1) — **inside the growing season
  (F2: Mar 1–Nov 30)** → the runs-01/02 V3 winter-pin is satisfied without use:
  the first bloom fires at maturity, in-season. **V3 (run 01) verified — no
  clash for any anchor from Mar 1 to Nov 30.**
- **The first bloom (D092(2), Sep 5 Y2):** the pre-maturity S/R/B/H bank ≈
  **161 buds** (Sprout 7 · Root ~61 · Branch ~85 · Heartwood ~9 — the year-2
  spring/summer earns: III-3 ×10 more, III-20 ×5, III-21 ×2, VIII-6 ×26, II-8
  ×8, IV-7 d1000 (~Jun Y2 — The Long Table, Heartwood), II-3 ×4 already in).
  **C1/C2: 15/event × 4 waves = 60 bloom this season; ~101 overflow to the
  spring Y3 flush** — no flower lost (C2 ✓ mechanically). **VIII-11 Pith bursts
  ON THE TRUNK** (Sprout, trunk attachment ✓). Ring (II-5 ×8, II-12 ×8, III-26
  ×2, VIII-1, VIII-2 — 20) and Groves (IX-2, II-4 ×4, III-11 — 6) stay banked
  (D092(4)/(5)).
- **Earned at/around the checkpoint:** **II-4 The Long Haul ×4 (Grove, d500 —
  Jan Y2, winter → banks to the Mar 1 Y3 bloom)** · **III-11 A PR Every Season
  (Grove, ~d515 — the 12th distinct month with a PR, A4)** · VIII-2 Two Years
  (Ring, d730 — same-day as maturity, V-6 boundary → participates in the next
  annual bloom) · **VIII-12 Medullary Ray (Root, d730 — rings ≥2, same-day
  boundary)** · Ring 2 brands.
- **Adaptations pending:** **THORNS** — II-4 (d500) + tenure ≥2 (D1 ✓) + SAPLING
  floor ✓ → pending, manifests at the next annual bloom (D093). (Under the
  missing-referent reading of E6 — no 365-day trophy — see V-6.)
- **Axes:** RESOURCE 0.42 · RHYTHM 1.0 · BALANCE 0.84 · TENURE **0.2**.
- **Why-panel:** "MATURE — in autumn, in-season: your first bloom burst 60 of
  161 earned flowers; the rest wait for spring. The crown Grove (Six for Six)
  and four Long Hauls bloom at the next annual bloom. The thorns are pending."

### CHECKPOINT YEAR 3 — Sep 5 Y3 (day 1095) — THE CROWN + THE EIGHT-GROVE CHAIN

- **Mar 1 Y3 — the first annual bloom of the mature tree (D092(5)/D093):**
  1. **The overflow + winter bank:** ~101 first-bloom overflow + winter Y2 earns
     (II-4 ×4, III-11, II-8 ×8, VIII-6 ×13, III-3/III-20 winter) → 60 bloom
     (4 waves), the rest rolls to Y4.
  2. **The CROWN (C4):** the first-earned Grove — **IX-2 Six for Six (d4) —
     manifests as THE transformation on the crown center** (IX = crown-center
     attachment; D112 identity check: syconium needs balance ≥0.6 → 0.84 ✓).
     The legend is once-set (legendAchievementId = IX-2).
  3. **II-4 ×4 and III-11:** large blooms, not transformations (C4's 1-legend
     cap) — four Long Hauls in one bloom is the year's biggest single visual.
  4. **THORNS manifest** on the habit branch (E6 + D1 ✓ + D093) — the armor
     grows at the spring flush, exactly as run 03 modeled.
  5. **Ring ×20 bloom** (II-5 ×8, II-12 ×8, VIII-1, VIII-2, III-26 ×2 — D092(4)).
- **Sep 5 Y3:** **Ring 3 brands** → **VIII-13 Oak (Branch)** · **the EIGHT-GROVE
  chain closes today:** II-14 Three Years No Missing Links ×4 (once per habit,
  spec-accurate — see V-9), III-27 Three Years in Iron, IV-13 Three Years on the
  Line, V-8 Three Years in Frame, V-5-G Then and Now (3-year photo gap), **VIII-7
  The Three-Year Vow** — all earned in autumn → bank to the **Mar 1 Y4 bloom,
  whose legend = VIII-7** (tiebreak per 01-V10: the Vow cluster first). I-12-H
  (same-month-day, 3rd year — A1) · VIII-5-H ×3.
- **I-16/I-17: NOT earned** — the journal Groves are Full-Orbit-gated (300
  journal days/yr) and 208 < 300 forever (**V-5** — the task brief's x3/x5 chain
  list loses the journal pair).
- **Axes:** TENURE **0.3** (D2 floor met — the buttress floor, not the gate).
- **Why-panel:** "MATURE · age 3 · crown: Six for Six · thorns grown · ring 3
  (Oak) · eight Groves banked for the spring Y4 bloom (legend: the Three-Year
  Vow) · your trunk shows no seven-domain ring yet (V-2)."

### CHECKPOINT YEAR 5 — Sep 5 Y5 (day 1825) — THE NINE-GROVE CHAIN

- **Rings 4 and 5 brand** (VIII-14 Sapwood, Y4 — Branch; VIII-15 Ironwood, Y5 —
  Heartwood). **D3 floor (5 stage-years) met Sep 5 Y5.**
- **Annual blooms:** Mar 1 Y4 = **legend VIII-7 + 7 large Groves** + the queue
  (60) · Mar 1 Y5 = queue + 9 Ring (II-5 ×4, II-12 ×4, III-26) — the queue never
  drains (V-1).
- **Sep 5 Y5 — the NINE-GROVE chain closes today:** II-15 Five Years No Missing
  Links ×4, III-28 Five Years in Iron, IV-14 Five Years on the Line, V-9 Five
  Years in Frame, VIII-3 Five Years, **VIII-8 The Five-Year Vow** — plus **I-12-G**
  (5-year same-month-day). All autumn-earned → bank to the **Mar 1 Y6 bloom,
  whose legend = VIII-8**. Also: **III-6 Fifty Beaten (Heartwood, d1825 — the
  50th PR)**, **III-19-H The Mountain Moves (Heartwood, ~d1820 — 1M kg tonnage)**,
  I-8 A Thousand Entries (Heartwood, d1755), I-9-B Novel-Length (Branch, d1168),
  I-7 Five Hundred Pages (Branch, d875), IX-1-Ring (Ring, d1280 — the 365th
  full-circle day, A2-aligned rate — blooms at the Mar 1 Y5 bloom under the V-6
  pin).
- **Axes:** RESOURCE 0.42 · RHYTHM 1.0 · BALANCE 0.84 · TENURE **0.5**.
- **Why-panel:** "MATURE · age 5 · rings 5 · stage-years 5 (of 10 to
  OLD-GROWTH) · crown: Six for Six · 24 Groves lifetime (9 closed this autumn —
  the Five-Year Vow leads the spring Y6 legend) · thorns + spines · bank:
  ~400 fires · next: B5 at 10 stage-years."

### CHECKPOINT YEAR 7 — Sep 5 Y7 (day 2555) — THE CAUDEX GATE OPENS

- **E1 CAUDEX gate OPENS today:** tenure ≥0.7 (7/10 ✓) AND resource ≤0.6 (0.42
  ✓) AND D3 floor (5 ✓) AND MATURE ✓ → pending, **manifests at the Mar 1 Y8
  annual bloom** (D093). The ancient-sparse character on the most consistent
  tree in the system — **see V-3 (the E1/E2 boundary): the same life can never
  grow buttress.**
- **Ring 7 brands** → **VIII-17 Latewood (Ring)** · VIII-16 Cambium (Heartwood,
  ring 6 — Y6) already banked. II-5/II-12 continue ×4/yr each.
- **Earned this window:** IX-4-H Wrote It Down (Heartwood, ~d3200 — no: d3200 =
  yr8.8 — NOT yet; at yr7 the count stands at ~40 of 50) — corrected: the yr7
  checkpoint holds Heartwood ~33, Ring 67, Grove 24. **B5:** 7/10.
- **Axes:** RESOURCE 0.42 · RHYTHM 1.0 · BALANCE 0.84 · TENURE **0.7**.
- **Why-panel:** "MATURE · age 7 · tenure 0.7 — the caudex grows at the spring
  bloom: seven stage-years of a sparse-per-day, never-missed life. Your trunk
  still shows no seven-domain ring; your six-domain rings brand nine (the tenth
  closes next year)."

### CHECKPOINT YEAR 10 — Sep 5 Y10 (day 3650) — OLD-GROWTH + THE DECADE GROVES

- **B5 tick:** 10 stage-years → **MATURE → OLD-GROWTH.** The OLD-GROWTH ceremony
  (D094). **F7 TENURE = 1.0** (clamped — the tree reads ancient).
- **Ring 10 brands** → **VIII-20 YEW (Grove — "the ancient tree")** · **VIII-4
  Ten Years (Grove — 90/120 months ✓)** · **VIII-9 OLD GROWTH (Grove — 10
  consecutive six-domain windows — the ceiling achievement of the system)** ·
  **VIII-10 OUROBOROS (Grove — the same 10, streak-judged, never a gap)** — four
  decade-Groves close on this exact day (autumn) → all bank to the **Mar 1 Y11
  bloom, out of the walk**. **III-25 Thousand Sessions (Grove, ~d3510 — Apr Y10:
  104 sessions/yr × 10 = 1,040 ≥ 1,000 ✓)** and **III-7 Century of PRs (Grove,
  d3650 — the 100th PR, the final checkpoint day)** join them → Mar 1 Y11.
- **Annual blooms Y7–Y10:** queue 60/season + 9 Ring/yr + VIII-18 Phloem (ring
  8, Y8) + VIII-19 Cork (ring 9, Y9) — the standing queue ≈ **400–500 pending**
  (C7: "top-3 + ~480 more"). The caudex manifested at the Mar 1 Y8 bloom; the
  tree's final structural character is set.
- **Axes — final:** RESOURCE **0.42** (mid-low — the E1/E2 boundary) · RHYTHM
  **1.0** (perfect) · BALANCE **0.84** (multi-domain stalwart) · TENURE **1.0**.
- **Rings:** **10 six-domain trophy rings** (VIII-5 ×10 — the full VIII-11..20
  ladder fired, Yew included) · **0 canonical-7 A5 trunk rings** (goals 26 < 40
  — V-2). Branch rings (D088 A): 10 on every branch (bar undefined — 01-V11).
- **Twigs:** journal 12/yr + habits 12/yr + nutrition 12/yr = 36/yr →
  **360 lifetime; 108 render individually (C5's 3-year retention), 252 merged
  into the branches' woody character** — the canopy is a 3-of-7 canopy (V-4).
- **The bank — the largest of the run series: ≈ 1,143 flower fires** (Sprout 7
  · Root 165 · Branch 800 · Heartwood 45 · Ring 96 · Grove 30). Repeatables
  (VIII-6 ×520, II-8 ×174, III-3 ×100, III-20 ×50, III-9 ×50, III-21 ×40,
  III-22 ×20 = 954) = **83% of the lifetime bank** (V-1).
- **Why-panel (year 10):** "OLD-GROWTH · age 10 · stage-years 10 · tenure 1.0 ·
  crown: Six for Six · caudex · thorns · spines · 10 six-domain rings — and a
  trunk that never branded the seven-domain ring (V-2) · 1,143 flowers earned,
  ~480 waiting · the five decade-Groves bloom with the spring."

---

## 3. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | 8.36 ÷ 20 = **0.42** (0.50 per the brief's ~10-event estimate; 0.82–0.85 if sets count as events — V-7) | mid-low — **caudex band, phyllodes knife-edge** |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | 1 − 0/7 = **1.0** | perfect (flat 7/7 — nutrition daily) |
| F6 BALANCE | Shannon evenness across the canonical 7 | **0.84** (H = 1.626 / ln 7 = 1.946) | high, multi-domain |
| F7 TENURE | stage-years ÷ 10, clamped | 10/10 = **1.0** | ancient |

Evenness detail (presence days/yr): journal 208 · habits 312 · gym 104 ·
nutrition 365 · body 52 · media 52 · goals 26 → p = (0.186, 0.279, 0.093,
0.326, 0.046, 0.046, 0.023) → H = 1.626 → E = 0.836.

**Stage ticks (B-group):** B1 day 1 · B2 day 15 · B3 Sep 5 Y1 · **B4 Sep 5 Y2
(maturity at ~year 2, in autumn = in-season — the V3 pin from runs 01/02 is
satisfied without use)** · **B5 Sep 5 Y10 → OLD-GROWTH ✓**.

**Twigs per domain (A3):**

| Domain | In-window days/30-day month | A3 bar | Twigs |
|---|---|---|---|
| Journal | 17.3 (4/wk) | 15 | 12/yr ✓ |
| Habits | 26.6 (6/wk) | 15 | 12/yr ✓ |
| Nutrition | 30 | 15 | 12/yr ✓ |
| Gym | **8.7 (2/wk)** | 15 | **0 forever** (V-4) |
| Body (forks) | 4.3 (1/wk) | 15 | **0 forever** |
| Media (forks) | 4.3 (1/wk) | 15 | **0 forever** |
| Goals | 2.2 (1/2wk) | 15 | **0 forever** |

**360 lifetime twigs, not 840** — the task brief's "12/yr × 7 domains × 10 yr"
assumes every domain grows twigs; the locked A3 bar is unreachable for 4 of 7
domains even at decade scale (V-4).

**Rings — the SPLIT (V-2):**

| Ring definition | Bar | This user | Result |
|---|---|---|---|
| A5 trunk ring (SCHEMA 2.4, D104) | canonical 7 × ≥40 in-window days | goals 26 < 40 | **0 rings in 10 years** |
| VIII-5 trophy ring (spec:844–851) | six domains × ≥1 qualifying day | all six ✓ every year | **10 rings — full VIII-11..20 ladder + Yew** |

The two ring definitions **diverge for the first time in the run series** (run
02: 0/0 · run 03: 5/5 · run 01: 0/0 — here 10/0). The task brief's "10 rings,
Yew at ring ≥10" is TRUE via the trophy ring and FALSE via the tree's A5 trunk
ring — both readings are locked documents.

**Bank by checkpoint (cumulative fires, ~):**

| Checkpoint | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| Y1 (POLE) | 7 | 36 | 75 | 6 | 9 | 1 | ~134 |
| Y2 (MATURE) | 7 | 61 | 105 | 9 | 20 | 6 | ~208 |
| Y3 | 7 | 69 | 134 | 13 | 29 | 14 | ~266 |
| Y5 | 7 | 85 | 220 | 19 | 47 | 24 | ~402 |
| Y7 | 7 | 101 | 306 | 26 | 58 | 24 | ~522 |
| **Y10 (OLD-GROWTH)** | **7** | **165** | **800** | **45** | **96** | **30** | **≈ 1,143** |

---

## 4. The bank — every earned trophy, by tier (Sep 5 Y0 → Sep 5 Y10)

| Trophy | Tier | Earned | Blooms (D092/D095) |
|---|---|---|---|
| I-1 Ink on the Page · II-1 Day One · III-1 First Rep Logged · IV-1 First Plate Logged · V-1 First Measurement · IX-1 Full Circle (Sprout step) | Sprout | d1 | first bloom Y2 ✓ |
| VIII-11 Pith (rings ≥1) | Sprout | Sep 5 Y1 | **first bloom Y2 — ON THE TRUNK** ✓ |
| I-2 A Week of Honesty | Root | d12 | first bloom Y2 ✓ |
| II-2 One Week In ×4 | Root | d7 | first bloom Y2 ✓ |
| III-2 The Basics | Root | d8 | first bloom Y2 ✓ |
| IV-2 A Month of Logging | Root | d30 | first bloom Y2 ✓ |
| V-2 Steady Hand | Root | d84 | first bloom Y2 ✓ |
| I-6 Half Century | Root | d88 | first bloom Y2 ✓ |
| I-9 Novel-Length Life (25k) | Root | d292 | first bloom Y2 ✓ |
| III-19 Moved a Mountain (R44) | Root | d182 | first bloom Y2 ✓ |
| III-3 New Number ×100 [A4] | Root | ~10/yr | on-earn post-maturity (confetti — V-1) |
| III-4 Ten Times Better (10th PR) | Root | d365 | on-earn Y1 (growing season) ✓ |
| III-20 Heaviest Session ×50 [A4] | Root | ~5/yr | on-earn (V-1) |
| VIII-12 Medullary Ray (rings ≥2) | Root | Sep 5 Y2 (same-day, V-6) | Mar 1 Y3 ✓ |
| IX-1 Full Circle (10) · IX-4 Wrote It Down (first) | Root | d35 · d60 | first bloom Y2 ✓ |
| I-3 A Season Kept | Branch | d158 | first bloom Y2 ✓ |
| IV-6 Half a Year of Fuel | Branch | d180 | first bloom Y2 ✓ |
| V-5 Then and Now (6-mo) | Branch | d183 | first bloom Y2 ✓ |
| IX-1 Full Circle (50) | Branch | d175 | first bloom Y2 ✓ |
| III-21 Trimester of Iron ×40 | Branch | 4/yr | on-earn (V-1) |
| III-22 The Schedule Never Breaks ×20 [A1] | Branch… (H) | 2/yr | on-earn (V-1) — see H |
| II-8 Juggling Act ×174 | Branch | ~17/yr | on-earn (V-1) |
| VIII-6 A Week, Whole ×520 | Branch | 52/yr | on-earn (V-1) — **the largest faucet in the run series** |
| III-9 PR Season ×50 [A4] | Branch | ~5/yr | on-earn (V-1) |
| III-8 Same Lift, Ten Times Better ×4 [A4] | Branch | by yr10 | on-earn |
| III-5 Quarter Century of PRs | Branch | d912 | on-earn Y2.5 ✓ |
| I-7 Five Hundred Pages | Branch | d875 | on-earn ✓ |
| I-9 Novel-Length Life (100k) | Branch | d1168 | on-earn ✓ |
| I-12 Same Question, New Answer (2yr) [A1] | Branch | Sep 5 Y2 | Mar 1 Y3 ✓ |
| IX-4 Wrote It Down (10) | Branch | d640 | on-earn ✓ |
| VIII-13 Oak (rings ≥3) · VIII-14 Sapwood (rings ≥4) | Branch | Y3 · Y4 | on-earn (autumn = in-season) ✓ |
| II-3 A Hundred Days ×4 | Heartwood | d100 | first bloom Y2 ✓ |
| V-7 Frame by Frame | Heartwood | d180 | first bloom Y2 ✓ |
| VIII-5 Life, Fully Logged ×10 | Heartwood | Y1…Y10 | on-earn ×9 + winter Y10 → Y11 flush |
| IV-7 The Long Table (1000 food days) | Heartwood | d1000 | on-earn Y2 (summer) ✓ |
| III-22 The Schedule Never Breaks ×20 [A1] | Heartwood | 2/yr | on-earn (V-1) |
| V-5 Then and Now (1yr) | Heartwood | d365 | on-earn ✓ |
| IX-1 Full Circle (100) | Heartwood | d350 | first bloom Y2 ✓ |
| I-12 Same Question, New Answer (3yr) [A1] | Heartwood | Sep 5 Y3 | Mar 1 Y4 ✓ |
| I-8 A Thousand Entries | Heartwood | d1755 | on-earn ✓ |
| III-6 Fifty Beaten (50th PR) | Heartwood | d1825 | on-earn ✓ |
| III-19 Moved a Mountain (R46, 1M kg) | Heartwood | ~d1820 | on-earn ✓ |
| VIII-15 Ironwood (rings ≥5) · VIII-16 Cambium (rings ≥6) | Heartwood | Y5 · Y6 | on-earn ✓ |
| IX-4 Wrote It Down (50) | Heartwood | d3200 | on-earn ✓ |
| II-5 Full Year, One Habit ×40 (4 habits × 10 yr) | Ring | yrly | annual blooms (D092(4)) ✓ |
| II-12 One Trip Around the Sun ×40 | Ring | yrly | annual blooms ✓ |
| III-26 A Year on the Bar ×10 | Ring | yrly | annual blooms ✓ |
| VIII-1 One Year In · VIII-2 Two Years | Ring | Y1 · Y2 | Y3 bloom ✓ |
| IX-1 Full Circle (365) | Ring | d1280 | Mar 1 Y5 ✓ (V-6 pin) |
| VIII-17 Latewood · VIII-18 Phloem · VIII-19 Cork | Ring | Y7 · Y8 · Y9 | next annual blooms ✓ |
| **IX-2 Six for Six** | **Grove** | **d4** | **Mar 1 Y3 — THE CROWN transformation** (C4) |
| II-4 The Long Haul ×4 [per-habit reading — V-9] | Grove | d500 (winter) | Mar 1 Y3 — large blooms ×4 ✓ |
| III-11 A PR Every Season [A4] | Grove | ~d515 (winter) | Mar 1 Y3 — large ✓ |
| II-14 Three Years, No Missing Links ×4 [V-9] | Grove | Sep 5 Y3 | Mar 1 Y4 — legend VIII-7, rest large ✓ |
| III-27 Three Years in Iron · IV-13 Three Years on the Line · V-8 Three Years in Frame · V-5 Then and Now (3yr) | Grove | Sep 5 Y3 | Mar 1 Y4 large ✓ |
| VIII-7 The Three-Year Vow | Grove | Sep 5 Y3 | **Mar 1 Y4 — the bloom's legend** ✓ |
| II-15 Five Years, No Missing Links ×4 [V-9] | Grove | Sep 5 Y5 | Mar 1 Y6 large ✓ |
| III-28 Five Years in Iron · IV-14 Five Years on the Line · V-9 Five Years in Frame · VIII-3 Five Years | Grove | Sep 5 Y5 | Mar 1 Y6 large ✓ |
| VIII-8 The Five-Year Vow | Grove | Sep 5 Y5 | **Mar 1 Y6 — the bloom's legend** ✓ |
| III-7 Century of PRs | Grove | d3650 | Mar 1 Y11 (out of walk) |
| III-25 Thousand Sessions | Grove | ~d3510 | Mar 1 Y11 (out of walk) |
| VIII-4 Ten Years · VIII-9 Old Growth · VIII-10 Ouroboros · VIII-20 Yew | Grove | Sep 5 Y10 | Mar 1 Y11 (out of walk) |

**Never fires (verified against the spec):** I-4 (no slot) · I-5/I-16/I-17
(journal 208 < 300 — **V-5**) · I-9-H/Grove (312k of 500k/1M words) · I-10
(150-word entries) · I-11 (no 21-day gap) · I-13 (nutrition is logged every day
— no day is ever solitary) · I-14 (no phases) · I-15 (Jan 1/Dec 31 not pinned —
~3 expected fires under the natural reading, excluded per the runs' convention)
· II-6 Perfect Month (6-days/week cadence — **no habit completes 31/31 —
V-9, the anti-Perfect-Month cadence**) · II-7 Five Strong (4 habits < 5) ·
II-9 (no slot) · II-10 (weekly rest has 6-day sides < 14) · II-11/13 (no gaps;
4 habits < 5) · III-10 (2 sessions/wk < 3) · III-12…III-18 (no strength profile,
A4) · III-23/24 (no phases/gaps) · IV-3/4/5/8/9/10/11/12 (no phases/targets/
deviation) · V-3 (no slot) · V-4/V-6/V-10…V-16 (flat maintainer weight) ·
VI ×4 (no vacations) · VII ×12 (vlog-locked — 03-V-7) · VIII-9's twin is earned
(both readings close at yr10) · IX-3 (the 100-vlog leg — never) · IX-5 (robot
trio) · all 47 rungs (no profile).

---

## 5. The blooms — schedule & wave distribution

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | **Sep 5 Y2** (autumn — in-season, the V3 pin never binds) | 161-bud S/R/B/H bank → **60 burst (4 waves × 15), ~101 overflow to Mar 1 Y3** · VIII-11 Pith bursts on the trunk | C1 ✓ C2 ✓ |
| Annual Y3 | Mar 1 Y3 | 60 (overflow + winter: II-4 ×4, III-11) · **IX-2 → THE CROWN transformation** · **THORNS manifest** · Ring ×20 | C4 ✓ E6 ✓ |
| Annual Y4 | Mar 1 Y4 | 60 (queue) · **legend VIII-7 + 7 large Groves** (the Y3 chain) | C4 ✓ |
| Annual Y5 | Mar 1 Y5 | 60 (queue) · IX-1-Ring · Ring ×9 | C4 ✓ |
| Annual Y6 | Mar 1 Y6 | 60 (queue) · **legend VIII-8 + 8 large Groves** (the Y5 chain) | C4 ✓ |
| Annual Y7–Y9 | Mar 1 | 60 (queue) · Ring ×9/yr · VIII-17/18/19 | C4 ✓ |
| Annual Y8 | Mar 1 Y8 | **CAUDEX manifests** (E1 — pending since Sep 5 Y7) | E1 ✓ |
| Annual Y10 | Mar 1 Y10 | 60 (queue) — the queue ≈ 400–500 pending (C7) | C2 ✓ |
| Mar 1 Y11 (out of walk) | — | 6 Groves: III-7, III-25, VIII-4, VIII-9, VIII-10, VIII-20 (legend tiebreak: Old Growth — 01-V10's rarity hierarchy) | noted |

**Wave distribution:** the season budget (60) never moves the queue — the
faucets accrue ~120–160 buds/yr (VIII-6 52, II-8 17, II-5/II-12 8, III-3 10,
III-20 5, III-9 5, III-21 4, III-22 2, on-earns) while the drain is 60. The
standing backlog grows ~60–100/yr (run 03's V-1, at decade scale).

---

## 6. Adaptations (E-group) — final state at Y10

| Adaptation | Signature (register) | This user | State |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.7 at Y7; resource 0.42 ✓ | **OPENS Sep 5 Y7 → manifests Mar 1 Y8 ✓** |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | balance 0.84 ✓; **resource 0.42 < 0.6 ✗** | **NEVER — the E1/E2 boundary (V-3)** |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | **0.42 > 0.4 — knife-edge miss** | **not earned — by one event/day (V-3)** |
| E4 cladodes | divergence ≥0.6 | 0 (no entry-free streaks) | not earned — honest |
| E5 storage leaves | media share ≥0.5 | 52 photos vs 208 entries ≈ 0.20 | not earned |
| E6 thorns | "the 365-day streak achievement" + tenure ≥2 | no 365-day trophy exists (V-6); II-4 = 500d, earned d500 | **manifests Mar 1 Y3 under the II-4 reading ✓** (referent must be fixed) |
| E7 spines | 100-day streak trophy (II-3) | II-3 ×4 at d100 | subtle texture from ~Y1 ✓ |
| E8 tendrils | live long-horizon goal | assumed (A7) | texture from ~Y1 ✓ |
| E9 reaction wood | a revival | no dormancy ever | not earned — honest |
| E10 contractile | 3 consecutive stage-years with RISING active-day counts | 365 → 365 → 365 (flat) | not earned — honest (03-V-5) |
| E11 mycorrhizal | coachEngagement ≥ threshold | 26 check-ins/yr | open — owner threshold undefined (02-V7) |
| E12 stolons | L-10 insight ≥3 monthly windows | no L-10 feed | effectively never (02-V7) |
| E13 bracts | no gate | bloom presentation | present at every bloom ✓ |
| E14 bud scales | dormant-habit state | no dormant habits (rest is planned, never dormant) | not shown |

**Manifest summary:** spines + tendrils (textures, immediate) · thorns (Mar 1
Y3) · **caudex (Mar 1 Y8)** · buttress NEVER · phyllodes a knife-edge miss. The
most balanced decade user in the system wears the **sparse-ancient** character
(caudex) and can never wear the **multi-domain stalwart** character (buttress) —
the thematically inverted result the task brief's E1/E2 flag predicts (V-3).

---

## 7. Verification (honesty, coherence, schedules, economy, budgets)

**Honesty — PASS.** Nothing farmed: every event real, same-day, in-window (D100,
A1 grace never used), non-imported, no backdating, no future-dating (F10), no
rest-planned abuse (the rest day is protected presence, and II-10 — the trophy
that would reward it — honestly never fires because the weekly rest has 6-day
sides). Nothing unrewarded: every earned trophy has a dated expression; the only
unbloomed things are unearned (I-5/16/17 by arithmetic, II-6/7/13 by the
6-day/4-habit cadence, VII by vlog-lock, IX-3 by its 100-vlog leg, the decade
Groves by the walk's edge). The dead-flat rhythm (1.0) and the absent comebacks
(E9/E10) are visible truths of a life without gaps.

**Coherence — PASS with one structural contradiction (V-2).** Contradictory
signatures impossible (caudex vs buttress: resource 0.42 vs ≥0.6 — no overlap;
phyllodes: 0.42 vs ≤0.4 — no overlap either, though knife-edge). Identity filter:
IX-2's syconium needs balance ≥0.6 → 0.84 ✓ (D112). The contradiction: **Ring-
tier flowers (II-5 ×40, II-12 ×40, VIII-17/18/19, IX-1-Ring), the VIII-13..16
ladder and the Yew Grove bloom at a trunk whose A5 ring can never form** (goals
26 < 40) while the six-domain ring ladder brands 10 rings — the split-ring
divergence (run 01's V1 wrinkle, now decisive: run 01 read 0/0, this run reads
10/0).

**Schedules — PASS.** D092: pre-maturity banking (161 buds at the first bloom)
✓; post-maturity on-earn in the growing season ✓ (autumn earns — Sep 5 — are
in-season, so the yr3/yr5 chains on-earn to the next annual bloom per the
Grove rule); Ring at the annual bloom ✓; Grove at the next annual bloom ✓.
D095: winter banking ✓ (II-4/III-11 Jan Y2 → Mar 1 Y3; the Sep-5 chains → Mar 1
Y4/Y6). D100: all in-window, no grace use. The V6 same-day boundary appears
twice (VIII-2 + VIII-12 close ON the maturity day; the yr1 ring closes on the
yr1 checkpoint) — both pinned per 02-V6: they participate in the next annual
bloom, never deferred an artificial year. The runs-01/02 V3 winter-maturity note:
**verified satisfied — a Sep 5 anchor matures in autumn, in-season; only anchors
from Sep 15 to Feb 28 land winter maturity.**

**Economy — MECHANICALLY PASS, DESIGN-STRAINED (V-1).** C1 (15/event) and C2
(4 waves = 60/season) hold at every bloom; overflow banks with nothing lost;
C7 shows the pending count. But the repeatable faucets (VIII-6 ×520 alone =
45% of the lifetime bank; 954 of 1,143 fires = 83%) flood the economy: the
first bloom shows 60 of 161 buds (37%), the queue stands at ~480 at Y10, and
the on-earn flowers micro-bloom all season so C1/C2 never bind post-maturity.
**C4 with 30 Groves and 96 Rings:** holds mechanically (crown once-set IX-2;
1 legend per bloom — VIII-7 Y4, VIII-8 Y6), but the Y4/Y6 blooms carry 7–8
large Grove blooms each — "large" is the new normal at decade scale; the rarity
gradient's visual identity dilutes.

**Budgets — PASS.** Twigs 36/yr < 12/branch cap; 108 render / 252 merged (C5
retention verified — the last 3 years individual, older merge to woody
character ✓). C3: **the habit branch ≈ 275 buds ≥ 30 → clusters unlock** (the
first run where the cluster mechanic engages). D1/D2/D3 floors met Sep 5
Y2/Y3/Y5 ✓.

---

## 8. Violations & tuning proposals

**V-1 [ECONOMY, MAJOR — confirmed at decade scale] The repeatable-faucet flood
peaks: 83% of the lifetime bank is re-fires; the queue never drains.**
VIII-6 ×520 (52/yr — a Grove-tier week bar feeding Branch forever), II-8 ×174,
III-3 ×100, III-20 ×50, III-9 ×50, III-21 ×40, III-22 ×20 = 954 of 1,143 fires.
The first bloom shows 37% of the bank; the C7 counter reads "top-3 + ~480 more"
at Y10; post-maturity on-earn flowers bypass the wave structure entirely
(01-V7/03-V-1 confirmed, now with a 10-year horizon and the largest bank of any
run — and with the run 03's dominant faucet, II-6, replaced by VIII-6 because
the 6-day cadence kills Perfect Month). **Tuning (as before): (a) cluster-merge
repeat-blooms — re-fires of one trophy within a season render as ONE flower + a
count badge (the C3 idea generalized to all repeatables — at 520 fires/yr,
VIII-6 becomes 1 flower × 10 years); (b) batch on-earn flowers into the ≤4
seasonal waves. Recommend (a) — nothing else fixes a 520-fire faucet.**

**V-2 [RINGS, MAJOR — the task brief's "10 rings" is half-true] The A5 trunk
ring (canonical 7 × ≥40 days) can never form because goals sits at 26 days/yr,
while the six-domain trophy ring (VIII-5) brands all 10.** The decade-
consistent, 7-domain life carries the full VIII-11..20 ladder + Yew + Old
Growth + Ouroboros in its trophy bank and a trunk that reads zero rings. Ring-
tier flowers bloom on a ringless trunk (run 01's V1 contradiction, now with the
two definitions *diverging* — 0 vs 10 — for the first time). **Tuning: (a) fold
A5 into the six-domain bar (drop goals from the ring set — matches the
VIII-5/VIII-6 definition and the Artifact-1 note that goals ride the goals
branch, not the trunk) → this user brands 10 A5 rings and the tree matches its
trophy bank; or (b) per-class A5 bars (weekly-class ≥30/yr; a biweekly goals
class ≥20 — the user's 26 passes; knife-edge); or (c) keep the divergence and
document it in the why-panel ("your trunk never brands the seven-domain ring —
your six-domain rings brand ten"). Recommend (a) — one ring definition, and the
"consistency compounds into rings" promise (D088 C) finally renders for the
most consistent user.**

**V-3 [THE E1/E2 BOUNDARY — the task brief's headline flag, CONFIRMED]
RESOURCE 0.42 (F4 ÷ 20) makes the most balanced decade user grow CAUDEX
(yr8) and NEVER BUTTRESS — and sit one event/day from PHYLLODES.** E1 (≤0.6 ✓)
opens at tenure 0.7 (yr7); E2 (≥0.6 ✗) never opens despite balance 0.84 — the
multi-domain stalwart character is locked out of the multi-domain stalwart life
by one calibration number. At F4 ceiling 12 (run 03's V-3 sweet spot):
8.36 ÷ 12 = 0.70 → **buttress opens (yr3 gate, Mar 1 Y4 manifest) and caudex
closes** — the character flips to the thematically correct one (the dense,
balanced, ancient tree). At ceiling 14: 0.60 — exactly on the E2 bar. And E3's
≤0.4: one fewer counted event/day (e.g., excluding the check-in) opens
phyllodes. **Tuning: (a) freeze F4's ceiling at 12 (with run 01's unit pin —
presence-owner events) → this archetype reads RESOURCE 0.70, grows BUTTRESS at
Mar 1 Y4, and the caudex goes to the genuinely sparse ancient (the journal-only
run's 0.05 user — where it belongs); (b) at minimum, document the trichotomy:
ceiling ≥14 = caudex-shaped decade user, ≤13 = buttress-shaped, and the
phyllodes boundary at 8.0 events/day. Recommend (a) — the register's own D105
deferral was written for exactly this decision.**

**V-4 [TWIGS, MAJOR — the task brief's 840 is 360] A3's ≥15/30 bar leaves the
decade tree a 3-of-7 canopy: journal/habits/nutrition grow 12 twigs/yr each,
gym/body/media/goals grow zero for 10 years.** The gym branch misses at 2/wk
(8.7/30) — below even run 01's proposed 12/30 gym bar; goals misses at 2.2/30 —
below even run 03's proposed 4/30 weekly-class bar. C5's retention (108 render /
252 merged) works; the canopy itself is lopsided. **Tuning: per-class A3 bars
(runs 01/03's proposals, extended): daily-class ≥15/30 (journal/habits/
nutrition ✓) · weekly-class ≥4/30 (gym 8.7 ✓, body 4.3 ✓, media 4.3 ✓) ·
goals-class ≥2/30 (2.2 ✓) → the tree then grows the brief's 12×7×10 = 840
twigs (280 render at Y10) and the canopy matches the life.**

**V-5 [RING/GROVE GAP — the journal Ring identity is dead] I-5 Full Orbit needs
300 journal days/yr; 4 days/week = 208 → I-5, I-16 and I-17 NEVER fire in 10
years.** The journal branch's Ring tier and its two Groves (Three Years Still
Talking, Half a Decade of Honesty — the x3/x5 chains the task brief lists) are
arithmetically impossible for a 4-days/week decade user, while the habit branch
(II-5 ×40, II-12 ×40) carries the whole Ring identity. **Tuning: (a) class-
relative Full Orbit — ≥80% of the domain's sustained cadence (208 × 0.8 = 167)
→ the 4-days/week journaler orbits at ~d335 and I-16/17 fire at yr3/yr5;
(b) accept the honest miss and add why-panel copy ("Full Orbit is a
300-day-a-year journaler's trophy; your journaling is a four-day rhythm"). The
spec's own guardrail text ("leaves room for honest gaps") argues for (a).**

**V-6 [REGISTER TEXT — inherited] E6's referent still does not exist:** "the
365-day streak achievement" is no trophy in any family (II-4 = 500-day —
03-V-4/01-V8). The thorns outcome is robust here (II-4 at d500 + tenure ≥2 →
Mar 1 Y3 either way), but the register line cannot fire as written. **Tuning:
cite II-4 explicitly ("the 500-day streak trophy, family II's long-haul tier")
or add a 365-day streak trophy.**

**V-7 [UNIT — inherited, decisive at decade scale] F4's event unit is still
unpinned:** 8.36 events/day (presence-owner) = 0.42 → caudex; ~17/day (sets
count) = 0.82–0.85 → buttress. The same 10-year log reads two opposite tree
characters (01-V4). This run's E1/E2/E3 trichotomy is decided by the counting
convention. **Tuning: pin the unit (recommend presence-owner events) and the
ceiling together in the dev tools, then re-run this archetype — V-3's ceiling
decision is meaningless without it.**

**V-8 [BOUNDARY — inherited, confirmed] The same-day boundary (02-V6/01-V9)
appears twice:** VIII-2 + VIII-12 close ON the maturity day (Sep 5 Y2) and the
yr1 ring closes on the yr1 checkpoint. Pinned per the runs' rule: the bank is
evaluated at the bloom's opening; same-day closers participate in the next
annual bloom. **No new tuning — record it in the engine contract.**

**V-9 [NOTES — cadence consequences + counting conventions] (a) The 6-days/week,
4-habit cadence kills the runs 01–03's biggest faucet (II-6 Perfect Month needs
31/31 — zero fires) and II-7/II-13 (5-habit bars) — the bank's shape flips from
II-6-dominated to VIII-6-dominated; (b) II-4/II-14/II-15 are counted ×4 (once
per habit — the spec's literal "once per habit"), vs run 03's ×1 convention:
the Grove totals rise by 9 vs run 03's counting — pick one convention and
freeze it; (c) I-15 (~3 expected fires, probabilistic Jan-1/Dec-31 alignment)
and the PR-rate trophies (III-3 ×100, III-20 ×50, III-9 ×50 — A4) are
assumption-gated; the seeded-data stress runs should sweep them; (d) IX-2's
week-1 earn rests on A2's alignment — without it the crown defers to ~d350 and
the first-ever Grove becomes II-4 (d500) instead.**

---

## 9. Verdict

**The DECADE-CONSISTENT archetype passes the tree's machinery end-to-end —
and its decade story is the most complete of the run series: OLD-GROWTH at
day 3650 (B5 ✓), TENURE 1.0, RHYTHM 1.0, BALANCE 0.84, the full six-domain
ring ladder (VIII-11..20, Yew included), the Vow cluster (VIII-7/8), Old
Growth + Ouroboros + Ten Years at the final checkpoint, the crown (IX-2),
thorns at Y3, caudex at Y8, C3 clusters engaging at last, every C1/C2/C4/C5
budget holding mechanically, and the largest honest bank in the series (1,143
fires, everything earned bloomed or scheduled).**

**The run confirms the task brief's flags and breaks two of its expectations:**
(1) **the E1/E2 boundary is real and inverted** — at the locked F4 ceiling the
most balanced user grows the sparse-ancient character (caudex) and can never
grow the multi-domain stalwart character (buttress), with phyllodes one event
away (V-3); (2) **the ring ladder and the twig canopy split from the brief** —
the "10 rings" live only in the six-domain trophy ring while the A5 trunk ring
brands zero (goals 26 < 40, V-2), and the "840 twigs" are 360 (3 of 7 domains
reach A3, V-4). The journal Ring identity is dead at 4 days/week (V-5), and
the economy strain peaks (83% re-fires, V-1).

**Priority tuning order:** F4 unit + ceiling (V-7 → V-3 — decides the tree's
character) → the A5 ring fold (V-2 — one ring definition) → A3 class bars
(V-4 — the canopy) → repeat-bloom clustering (V-1 — the queue) → I-5
class-relative (V-5) → the E6 referent text (V-6) → the per-habit Grove
counting convention (V-9b). Every one is dev-tunable per D105 — the paper
run's job was to find exactly these.

**Run verdict: CONDITIONAL PASS — the decade machine is sound and honest; the
decade tree's *character* (caudex vs buttress), its *rings* (six-domain vs
canonical-7) and its *canopy* (3-of-7) are all decided by calibration choices
the paper run now pins. Apply V-3's ceiling-12 + unit pin, V-2's ring fold,
V-4's class bars, and V-1's clustering in the dev tools; re-run this archetype
before the register freezes.**