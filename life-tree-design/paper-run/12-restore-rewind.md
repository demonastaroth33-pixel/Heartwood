# PAPER ARCHETYPE RUN 12 — "RESTORE-REWIND" (the D098 restore contract against a 3-year balanced-lite life)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains, D104/D115) + Artifact 3 (trigger-correlation) + the D090–D115
records in TEMP-PLANNING.md (D092/D093/D094/D095/D096/D097/D098/D099/D100/D101/
D102/D103/D105/D107/D108/D109/D110/D113/D114/D115 read in full). **Trophy
conditions verified against:** scan-outputs/02-achievements.md (verbatim per-trophy
conditions) + ACHIEVEMENT-SCAN.md (the tier ladder). **Cross-references:** run 11
(launch-day-veteran — this run reuses its D097/D098/D109 conventions and V-series
vocabulary) · run 03 (balanced — the full-7-domain variant this run is "lite"
against) · run 10 (habit-hoarder — the winter-maturity first-bloom convention A9
adopted verbatim) · run 02 (journal-only — the same-day boundary pin V6) · run 05
(bursty — the winter-maturity clash, the root of V-4). **Run note (the brief's
locked framing):** the D098 restore contract — the tree is a pure function of the
current log; an older restore re-derives honestly (fewer rings, earlier stage — the
"rewind journey" via the D094 engine); the existence ratchet (D114) means the tree
never dissolves once born; the restore stamp (D098); the fingerprint (D109). This
run walks a 3-year user's older restore end to end and checks the brief's own
hypotheses ("MATURE? rings? rings shrink 2 → 0?") against the register.

---

## 0. The archetype

A 3-year user, "balanced-lite": **journal 1 entry/day (~200 words) · 4 habits
completed/day · gym 3 sessions/week (3 real sets each) · 3 meals/day.** Every event
written same-day (in-window — the D100 predicate; the A1 ±3d grace never used),
none imported, none future-dated (F10), no backdating. One frozen birth anchor:
**Feb 1 Y0** — the first in-window event (the day-1 journal entry), frozen per
D090 B / D100(5) / D102, carried by the backup (D102(2), D098(2)). At the end of
year 1 (Feb 1 Y1) the user exports a backup. At **year 3, Mar 8 Y3** — a week after
the Mar 1 Y3 annual bloom — they restore that year-1 backup. Then they continue
logging the exact same cadence for two more years (through Feb 1 Y5).

| Domain | Cadence | In-window days/yr | A2 qualifying rule |
|---|---|---|---|
| Journal (`journal.created`) | 1/day, ~200 words | 365 | ≥40 words, non-imported ✓ |
| Habits (`habit.completed`) | 4 habits/day | 365 | 1 completion ✓ |
| Gym (`workout.completed`) | 3/wk (Mon/Wed/Fri), 3 sets | 156 | ≥1 real logged set ✓ |
| Nutrition (`nutrition.logged`) | 3 meals/day | 365 | ≥1 real food-log ✓ |
| Body / Media / Goals (presence) | none | 0 / 0 / 0 | — (body/media/goals NEVER present) |

**The calendar** (365-day years, no leap days — run 02's A3):

| Event | Day | Date |
|---|---|---|
| Anchor — first journal entry | d0 | Feb 1 Y0 |
| B2 SAPLING | d15 | Feb 16 Y0 |
| **Year-1 close — the BACKUP is taken** | d365 | Feb 1 Y1 |
| Maturity (B4) | d730 | Feb 1 Y2 (WINTER) |
| First bloom + the annual bloom | d730 / d759 | Feb 1 Y2 / Mar 1 Y2 |
| Annual bloom (year 3) | d1124 | Mar 1 Y3 |
| **THE RESTORE** | **d1131** | **Mar 8 Y3** |
| Re-grown maturity (B4 re-tick) | d1460 | Feb 1 Y4 (WINTER) |
| Re-grown year-5 close | d1825 | Feb 1 Y5 |

**Assumption set (stated, then applied — every count below is derivable from
these):**

- **A1 — weekday model.** The anchor day (Feb 1 Y0) is a Monday; gym lands
  Mon/Wed/Fri. The first full-circle day (journal+habits+gym+nutrition) = d3
  (Wed Feb 3 Y0). (Sensitivity: a gym-day anchor moves IX-1-S to d1; nothing else
  in the walk changes — the crown's identity is PR-derived, not day-derived.)
- **A2 — 4 habits, no clock slots.** The robot-consistency family (I-4, II-9, V-3,
  IV-5, IX-5) never fires (no slots pinned). **II-7 Five Strong never fires** (needs
  ≥5 distinct habits; this user has 4). **III-22 The Schedule Never Breaks DOES
  fire** — the exact weekday-set (Mon/Wed/Fri forever) satisfies it, per run 03's A2
  correction. II-6 Perfect Month, II-8 Juggling Act re-fire as their faucets.
- **A3 — PR model.** Slow linear gains, ~8 PRs/yr (~1 per 6 weeks, spread across the
  four calendar seasons): III-3 (first, d45) · III-4 (10th, d450) · III-5 (25th,
  d1150) · III-8 (per-lift ×10, ~d600) · III-9 PR Season (occasional months) ·
  **III-11 A PR Every Season — a PR in every calendar season of a year — fires Feb 28
  Y1 (d392).** Rungs R1–R47 + the strength-ratio gates EXCLUDED (no strength
  profile — run 03's A4 convention).
- **A4 — no phases, no vacations, no vlogs, no body weigh-ins.** VI ×4 and VII ×12
  unearned; body and media presence stay 0. ONE live long-horizon goal (>1 yr, in
  progress) exists — E8 tendrils — but no `task.completed` events are logged →
  goals presence stays 0 (the goal rides the goals branch as fruit-spur structure
  only). VIII-5 Life Fully Logged and VIII-6 A Week Whole (six-domain bars) are
  unreachable by construction.
- **A5 — no gaps in the pre-restore 3 years.** Every event same-day, in-window; the
  ±3d grace never used; none imported; none future-dated; no backdating.
- **A6 — the backup.** formatVersion 3 (D109(2)); taken at the year-1 close (Feb 1
  Y1); carries the **frozen anchor** (D102(2)), the **monotonic logFingerprint**
  (eventCount ≈ 3,076 + syncSeq), the `viewed_moments` table (USER STATE, D109(1)),
  settings, and the event log through d365. **The derived tree cache is NOT in the
  format** (regenerable — D098(5)).
- **A7 — the restore act.** Explicit (the existing confirmation flow), account-level
  (single device here; the fleet rule verified per D109(3)). Date: **Mar 8 Y3
  (d1131)**, one week after the Mar 1 Y3 annual bloom — deliberately in-season so the
  un-blooming is visible on holding flowers.
- **A8 — after the restore**, the user resumes the identical cadence from Mar 8 Y3.
  The 2-year gap (Feb 1 Y1 → Mar 8 Y3) is NOT backfilled (D100's ±3d predicate +
  D113's `isBackfill` flag block it anyway) and NOT logged as vacation periods.
- **A9 — the same-day boundary + the winter first bloom** (run 02's V6 pin + run 10's
  A9, adopted verbatim): earns whose window closes ON a bloom day participate in that
  bloom; the first bloom fires AT maturity even in winter (D092(2) literal; D095
  amends rule 3's on-earn, not rule 2) — the boundary is unpinned and flagged (V-4).
- **A10 — the goal entity rides the backup** (it existed at year 1), so tendrils
  survive the restore.

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 2 standing drifts + 2 archetype-killers)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | 40-word journal · real set · real food-log · 1 habit |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ as written | **Gym never passes (13/30) — V-12a (3-of-4 canopy)** |
| A4 | stage-year ≥200 active days | ✓ | 365/yr → 1 stage-year/window |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | **Body/media/goals = 0 → 0 A5 rings, EVER — the run's headline (V-1)** |
| B1 | first in-window event | ✓ | Feb 1 Y0, d0 |
| B2 | ≥15 days/30-day window, any-domain-mixed | ✓ | d15 (30/30) — insensitive to the 15-vs-20 drift (V-8a) |
| B3 | 1 stage-year | ✓ | Feb 1 Y1 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Feb 1 Y2 (journal 365) — **maturity in WINTER (V-4)**; re-grown Feb 1 Y4 (journal 329) |
| B5 | ≥10 stage-years | ✓ | 3/10 — never in walk |
| C1 | ≤15 flowers/bloom event | ✓ mechanically | First bloom: 60 of ~150 — overflow structural |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ mechanically | Holds pre- and post-restore; the queue re-derives |
| C3 | ≥30 buds/branch → clusters | ✓ | 4 habit-buds < 30 (the habit branch stays under) |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ mechanically | Crown = III-11 (first Grove, d392); **the crown UN-SETS on restore and re-sets at Mar 1 Y5 (V-2)** |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | ✓ | 12/yr × 3 branches; gym 0 |
| C7 | bank counter top-3 + count | ✓ | Composition shifts across the restore (V-11) |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | Feb 1 Y2 / Feb 1 Y3 / never; re-grown: Feb 1 Y4 / Feb 1 Y5 / never |
| E1–E14 | signatures | ✓ read | See §6 — the restore flips E6 and creates E9 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | Feb 1 anchor → every maturity lands WINTER (V-4) |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | **0.42 — the E1/E2 boundary hangs on the ceiling (V-12b)** |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ as written | 1.0 pre-restore; **≈0.16 lifetime after the gap (V-5)** |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ | **0.69** (4 of 7 domains) |
| F7 | TENURE = stage-years/10 | ✓ | 0.3 → 0.1 → 0.3 |
| F8 | replay ~2s/yr | ✓ | Rewind journey ≈ 27–34s (V-7's compression rule) |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records ≥20
(02-V1, 03-V-6, 05-V10, 07-V1, 09-V5, 11-V-5 — the **8th recurrence**). Insensitive
here (30/30). V-8a.

**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; no trophy in any family is a 365-day streak (II-4 = 500-day) —
01-V8/02-V3/03-V4/04-V6/09-V4/11-V-6, **7th recurrence**. LOAD-BEARING here: under
every reading the thorns trigger dies with the restore (V-8b).

**Archetype-killer 1 (the ring brand):** the canonical-7 A5 ring-year (D104/
D114(3)) needs body ≥40, media ≥40, goals ≥40 in-window days/yr. This life has 0/0/0.
**Zero A5 rings pre-restore AND post-restore** — the brief's "rings shrink (2 → 0?)"
is falsified; it is 0 → 0 (V-1).

**Archetype-killer 2 (the twig bar):** A3's ≥15 days/30-day-month is unreachable
for weekly cadences (gym 13/30) — the standing finding (03-V2, 04-V4, 11-V-4), at
4-domain scale. Gym never grows a twig in 5 years (V-12a).

---

## 2. The walk

### CHECKPOINT YEAR 1 — Feb 1 Y1 (d365) — THE STATE AT BACKUP TIME

- **B1 tick d0** (first journal entry) → SEED → SEEDLING. Germination ceremony
  (D094: crack, root curl, stem rise, 5 branch-buds). **B2 tick d15** (30/30) →
  SEEDLING → SAPLING. **B3 tick d365** → stage-year 1 closes (365 ≥ 200) →
  SAPLING → **POLE**. Pole-rise ceremony; leaf granularity unlocks (C6).
- **Rings: 0.** The year-1 anchored window has journal 365 · habits 365 · gym 156 ·
  nutrition 365 · **body 0 · media 0 · goals 0** → A5 fails → no trunk ring. No
  VIII-11 Pith (rings ≥1) — the whole VIII ring ladder is dead for this life (V-1).
- **Twigs: 36.** Journal 12 · habits 12 · nutrition 12 (exactly at C5's cap); gym 0
  (13 days/30-day window < 15 — A3, V-12a). The "balanced-lite" canopy is already
  3-of-4.
- **The bank (pre-maturity — every trophy an ACHIEVEMENT BUD, D092(1)) ≈ 102:**
  5 Sprout (I-1, II-1, III-1, IV-1, IX-1-S d3) · 12 Root (I-2 d7, I-6 d50, I-9-R
  d125, II-2 ×4 d7, III-2 d21, III-3 d45, IV-2 d30, IX-1-R d24, IX-4-R d60) · ~69
  Branch (I-3 d90, I-12-B d365, II-6 ×44, II-8 ×17, III-21 ×4, IV-6 d180, IX-1-B
  d120) · 6 Heartwood (II-3 ×4 d100, III-22 ×2 d182/d364) · 10 Ring (VIII-1 d365,
  II-5 ×4 d365, II-12 ×4 d365, III-26 d365) · **0 Grove** (III-11 fires d392 and
  II-4 fires d500 — both AFTER the year-1 close). The crown slot is EMPTY in the
  backup (V-2).
- **Adaptations (textures):** E7 spines from ~d100 (II-3 — in the backup) · E8
  tendrils (the long-horizon goal, A10 — in the backup). Nothing else (no
  dormancy, no streak-without-entries divergence, media 0).
- **Axes:** RESOURCE 0.42 (8.43 ÷ 20) · RHYTHM 1.0 · BALANCE 0.69 · TENURE 0.1.
- **THE BACKUP ACT (A6):** the user exports at the year-1 close. The format carries
  the frozen anchor (Feb 1 Y0), the logFingerprint (≈ 3,076 events), the
  `viewed_moments` table, settings, and the event log through d365. The derived
  cache stays OUT (D098(5)). Fingerprint ≈ 3,076.
- **Why-panel (D094(4)):** "POLE · age 1 · stage-years 1 · 36 twigs · 0 rings · ~100
  buds banked · your crown is still to come · next tick: MATURITY at 2 stage-years."

### CHECKPOINT YEAR 3 — Mar 8 Y3 (d1131) — THE PRE-RESTORE STATE (the brief's "MATURE? rings?")

- **B4 tick Feb 1 Y2 (d730):** stage-year 2 closes (365) AND journal's best
  anchored year = 365 ≥ 90 → **POLE → MATURE** (pioneer-speed, year 2 — the B4
  calibration exactly). **D1 floor (2 stage-years) met same day. Maturity lands
  FEB 1 = WINTER** — the D094 first-bloom ceremony collides with D095's "nothing
  blooms in winter" (run 05 V1 / run 10 V5 — **V-4**). Adopted run 10's A9: the
  first bloom fires at maturity, winter-exempt; the wave budget applies.
- **Stage-years: 3** (windows 1–3 all 365 ≥ 200) → **F7 TENURE = 0.3**. B5 (10)
  pending.
- **Rings: 0 — and never.** Three anchored window closes, and A5 still fails on
  body/media/goals = 0. The trunk is ringless under the locked register (V-1). The
  six-domain trophy ring (VIII-5) is equally dead (body+media 0). **There is no ring
  to shrink.**
- **Axes:** RESOURCE 0.42 · RHYTHM 1.0 · BALANCE 0.69 · TENURE 0.3. The tree's
  character is the run 11 E1/E2 boundary (V-12b).
- **The blooms so far (3 events, ≈ 180 flowers):**
  1. **First bloom — Feb 1 Y2 (WINTER, per A9):** the S/R/B/H bank (≈ 150
     pre-first-bloom) → **60 burst** (magnitude order H→B→R→S per D099); overflow
     ≈ 90 to the Mar 1 Y2 spring + the winter bank. C1 ✓ C2 ✓.
  2. **Annual bloom — Mar 1 Y2 (d759):** Ring 12 (VIII-1, VIII-2, II-5 ×4, II-12
     ×4, III-26) + **GROVE: III-11 → THE CROWN transformation** (C4 once-set —
     the first-earned Grove, d392) + II-4 large (d500, the second Grove) + the
     overflow → 60. The crown persists through winter (D115(5)).
  3. **Annual bloom — Mar 1 Y3 (d1124):** 4 chain Groves (I-16, II-14, III-27,
     IV-13 — all winter-earned at the Feb 1 Y3 window close → spring flush) + Ring
     9 (II-5 ×4, II-12 ×4, III-26 yr-2) + the standing overflow → 60. **These 60
     are HOLDING (spring, in-season) at the restore.**
  - On-earn micro-blooms (growing season): I-8 (d1000, Oct Y2), IV-7 (d1000, Oct
    Y2); I-12-H (d730 — same-day, winter → banks to Mar 1 Y2); I-15 (Dec 31 Y1 —
    pre-maturity → bursts at the first bloom; Dec 31 Y2 — winter → banks to Mar 1
    Y3).
- **Adaptations:** E6 THORNS **manifested Mar 1 Y2** (II-4 at d500 + D1 at Feb 1
  Y2 + SAPLING floor → gate opens Feb 1 Y2 → manifest at the next annual bloom) ·
  E7 spines (from ~Y1) · E8 tendrils · E13 bracts at every bloom. E2 buttress never
  (resource 0.42 < 0.6 · balance 0.69 < 0.7) · E3 phyllodes knife-edge (0.42 > 0.4 —
  V-12b) · E9/E10 never (no dormancy; flat 365/365/365).
- **Bank ≈ 210 earned** (the II-6/II-8 repeatable faucets dominate — run 04/11's
  V-9 at 4-domain scale) · ≈ 30 pending + the on-earns.
- **Why-panel:** "MATURE · age 3 · stage-years 3 · tenure 0.3 · 0 rings · 108 twigs ·
  crown: A PR Every Season · thorns on the habit branch · 60 flowers holding from
  the spring bloom."

### THE RESTORE MOMENT — Mar 8 Y3 (d1131) — THE LOG REWINDS

The user restores the Feb 1 Y1 backup (explicit, confirmed, account-level — A7).
The pipeline (D098(4)/(5) + D108(1) + D109(2)):

1. **Fingerprint check:** the restored logFingerprint (≈ 3,076) is SMALLER than the
   current one (≈ 9,230) → the persisted cache is immediately stale (D109(2)) → no
   stale-tree window. Shimmer first (D094 skeleton), then the re-derivation.
2. **Re-derivation (off-thread, ≈ 3,076 events ≈ 0.1s at run 11's P-07 arithmetic):**
   the tree is a pure function of the restored log — the incremental cache is
   discarded, the fold re-runs (D098(1), D108(1)). The order-independent fold
   (D108(3)) converges to the same state on every device; the fleet re-derives from
   the restored log, never re-merging the live log over it (D109(3)).
3. **The re-derived state — what the tree honestly becomes:**
   - **Stage: MATURE → POLE.** Stage-years 3 → 1 (only window 1 qualifies now).
     The brief's "MATURE → POLE?" — **CONFIRMED.**
   - **Rings: 0 → 0.** The brief's "rings shrink (2 → 0?)" — **FALSIFIED; there
     never was a ring** (V-1). The honest shrink is everywhere else: stage-years
     3 → 1, tenure 0.3 → 0.1, twigs 108 → 36, flowers 180 → 0.
   - **Blooms un-bloom:** the 60 holding flowers (Mar 1 Y3) withdraw in the rewind;
     the 120 faded flower records (Mar 1 Y2 ×2) vanish — the achievements that made
     them are not in the log. The flowers[] array re-derives to empty.
   - **Buds un-bank:** the bank re-derives to the year-1 set ≈ 102 buds (the
     achievements earned AFTER Feb 1 Y1 are simply not earned in the restored log).
   - **The CROWN un-sets:** III-11 (earned d392 — after the Feb 1 Y1 cut) is gone;
     `legendAchievementId` clears. The brief's "buds un-bank" extends to the legend
     slot itself (V-2).
   - **The thorns un-manifest:** II-4 (d500) is gone → E6's trigger is gone → the
     habit branch's armor recedes. The tree is a pure function; structural
     adaptations re-derive like everything else (V-8b).
   - **The ratchet holds (D114):** the backup carried the frozen anchor (Feb 1 Y0)
     → the tree is re-born at the SAME anchor → **it never dissolves**. Age stays 3
     (anchor-monotonic); stage-years honestly read 1. "No events = no tree" applies
     only to the first birth — verified.
4. **The rewind journey (D094 language, F8 pacing — the brief's "compressed
   re-growth"):**
   - Reverse rewind (optional, D098(3) "if the user wants to watch"): the 60
     holding flowers withdraw, the crown's marks recede, the trunk's stage visually
     drops (MATURE → POLE), the Y2/Y3 twigs recede (108 → 36), the bank grows
     younger — ≈ 6–8s (2 years × 2s + ceremony beats).
   - The restored-state settle + the stamp.
5. **The STAMP (D098(3)):** the why-panel stamps the tree with the restore date and
   narrates: **"your tree reflects your data as of Feb 1 Y1 — restored Mar 8 Y3. The
   two years between are not in the backup."** The legend card notes it. No silent
   regression: the restore was explicit; nothing in the CURRENT (post-restore,
   append-only) log ever shrinks again (D098(6)).

**The restored state (Mar 8 Y3):** POLE · age 3 · stage-years 1 · 0 rings · 36 twigs ·
tenure 0.1 · bank ≈ 102 buds · 0 blooms · crown empty · thorns gone · spines +
tendrils SURVIVE (II-3 and the goal were in the backup) · the 2-year gap now reads
as DORMANCY (bare branches, E14 scale-wrapped habit buds).

### THE REWIND JOURNEY — the D094 compressed re-growth (optional watch, D098(3))

The forward half of the journey replays the restored log and then the re-growth:
germination → POLE (the year-1 log, ≈ 5s) → the dormancy stretch (Feb 1 Y1 → Mar 8
Y3 — the bare, dormant tree) → **the Mar 8 Y3 REVIVAL** (the first new in-window
event after the gap → E9 reaction wood + epicormic at the branch bases — universal,
no gate) → re-maturity Feb 1 Y4 (the 8–12s first-bloom ceremony) → the Mar 1 Y5
crown. Total rewind journey ≈ 27–34s — inside D097's ~20–40s envelope, with run 11's
V-7 annual-bloom-compression caveat (the annual blooms compress into the 2s beats).

### CHECKPOINT YEAR 4 — Feb 1 Y4 (d1460) — THE RE-GROWN MATURITY

- **Window 4 (Feb 1 Y3 → Jan 31 Y4) qualifies:** logging resumed Mar 8 Y3 → 329
  in-window days ≥ 200 → **stage-year 4** at the window close. Stage-years now
  {1, 4} = 2.
- **B4 RE-TICK Feb 1 Y4:** ≥2 stage-years AND journal's best anchored year = 329 ≥
  90 → **POLE → MATURE, re-grown** — one full year later than the pre-restore
  maturity anniversary (Feb 1 Y3), because the gap honestly deleted stage-years 2
  and 3. **The tree does not snap back to its pre-restore maturity; it re-grows
  it.** Winter again (Feb 1) → the V-4 first-bloom convention applies again.
- **The re-first-bloom (Feb 1 Y4):** the re-banked S/R/B/H (year-1 bank ≈ 96 S/R/B/H
  + 11 months of re-earns: II-6 ×44, II-8 ×17, III-21 ×4, III-22 ×2, II-3 ×4 at the
  100-day re-streaks, I-3 re-run at d90 of the new streak) → 60 burst; overflow →
  Mar 1 Y4. **The un-bloomed flowers' re-scheduling is fully re-derived** — the C2
  wave math re-runs on the honest re-grown bank; nothing lost, nothing double-counted
  (V-11).
- **Adaptations at the re-grown maturity:** E9 reaction wood + epicormic PRESENT
  (the restore-gap revival — the only adaptation the restore CREATES) · E14 bud
  scales shown through the gap (habits dormant) · thorns STILL absent (II-4
  foreclosed — V-8b) · spines + tendrils still present.
- **Ring-tier re-fires:** II-5 ×4, II-12 ×4, III-26 — the W4 windows close Feb 1 Y4
  (winter) → bank to the Mar 1 Y4 annual. **VIII-2 Two Years never re-earns** (needs
  ≥75% active months since the anchor — 12/24 = 50% after the gap) — V-9.
- **Twigs: 69 lifetime** (36 + 33; the Mar 8–31 Y3 partial month counts — 24 days).
- **Why-panel:** "MATURE · age 4 · stage-years 2 · 0 rings · your tree re-grew
  maturity a year late — the two quiet years are honestly missing · reaction wood at
  the revive · next: the crown, at the next annual bloom."

### CHECKPOINT YEAR 5 — Feb 1 Y5 (d1825) + the Mar 1 Y5 crown beat

- **Window 5 (Feb 1 Y4 → Jan 31 Y5) qualifies** (365 ≥ 200) → **stage-years {1, 4,
  5} = 3** → **TENURE 0.3 again** — a full two-stage-year recovery gap that never
  closes: the re-grown tree at 3 stage-years is a year "younger" than the pre-restore
  tree at the same calendar age (which had 3 by Feb 1 Y3). The missed years are
  honest and permanent.
- **Rings: 0** (A5 still fails on body/media/goals — V-1). **Twigs: 105 lifetime,
  69 visible** (C5's 3-year retention merges window 1). **Axes:** RESOURCE 0.42 ·
  RHYTHM ≈ **0.16** (lifetime — the gap's ~104 zero-activity weeks are inside the CV;
  V-5) · BALANCE 0.69 · TENURE 0.3.
- **The re-grown crown re-sets — Mar 1 Y5 (d1854):** **III-11 A PR Every Season
  re-earns Feb 28 Y4** (d1493 — the first-earned Grove of the re-grown log) and, 4
  days too late for the Mar 1 Y4 bloom (V-10), transforms at the **Mar 1 Y5 annual
  bloom**: the crown's identity SURVIVES the restore (the same trophy), but its
  transformation date moves from **Mar 1 Y2 → Mar 1 Y5**. C4's "once-set" is per-log;
  the restore re-derived it (V-2).
- **The foreclosed chains, honestly absent:** I-16 Three Years Still Talking, II-14,
  III-27, IV-13 (three-consecutive-window chains — broken by the gap) and **II-4 The
  Long Haul** (500-day streak — broken) NEVER re-earn. They are closed, not pending
  (V-3). IX-1's Ring step (365 full-circle days) is also unreachable (156 gym days/yr).
- **The Mar 1 Y5 annual:** crown III-11 transforms + Ring 9 (II-5 ×4, II-12 ×4,
  III-26 — W5 closes Feb 1 Y5, winter → bank to spring) + the re-banked overflow →
  60. The blooms' economy is clean and permanent: ≈ 180 re-grown blooms across 3
  events, no double-count, nothing lost.
- **Why-panel:** "MATURE · age 5 · stage-years 3 · 0 rings · tenure 0.3 · your crown:
  A PR Every Season (re-grown) · reaction wood marks the two quiet years · the
  three-year chains closed, not pending · the rhythm axis reads the whole log."

---

## 3. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Pre-restore (Mar 8 Y3) | Restored (Mar 8 Y3) | Re-grown (Feb 1 Y5) |
|---|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | 8.43 ÷ 20 = **0.42** | 0.42 | 0.42 |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **1.0** | 1.0 (year-1 log) | **≈ 0.16** (lifetime — the gap's zero weeks; V-5) |
| F6 BALANCE | Shannon evenness, canonical 7 | **0.69** (H 1.338 / ln 7) | 0.69 | 0.69 |
| F7 TENURE | stage-years ÷ 10 | **0.3** | **0.1** | **0.3** |

**Stage ticks (B-group):**

| Tick | Gate | This user | Date |
|---|---|---|---|
| B1 SEED→SEEDLING | first in-window event | journal d0 | Feb 1 Y0 |
| B2 SEEDLING→SAPLING | ≥15 days/30-day window | 30/30 | d15 |
| B3 SAPLING→POLE | 1 stage-year | 365 ≥ 200 | Feb 1 Y1 (d365) |
| B4 POLE→MATURE | ≥2 stage-years + ≥1 domain ≥90 | 2 + journal 365 | **Feb 1 Y2 (d730) — WINTER (V-4)** |
| B4 RE-TICK (re-grown) | same | {1,4} + journal 329 | **Feb 1 Y4 (d1460) — WINTER** |
| B5 MATURE→OLD-GROWTH | 10 stage-years | 3/10 | never |

**Stage-years across the walk:** 3 (W1+W2+W3) → **1 (W1)** at restore → 3 (W1+W4+W5)
at Feb 1 Y5. Windows 2–3 (the gap) are empty and never come back — the honest,
permanent regression.

**Twigs per domain (A3, ≥15 days/30-day month):**

| Domain | Days/30-day month | Pre-restore (3 yr) | Restored (1 yr) | Re-grown (Feb 1 Y5) |
|---|---|---|---|---|
| Journal | 30 | 36 (12/yr) | 12 | 36 |
| Habits | 30 | 36 | 12 | 36 |
| Nutrition | 30 | 36 | 12 | 36 |
| Gym | 13 | **0** (V-12a) | 0 | 0 |
| **Total** | | **108** | **36** | **105 (69 visible)** |

**Rings — the brief's headline hypothesis, settled (V-1):**

| Ring definition | Bar | This user | Pre-restore | Post-restore |
|---|---|---|---|---|
| A5 trunk ring (SCHEMA 2.4, D104/D114(3)) | canonical 7 × ≥40 in-window days | body/media/goals = 0 | **0 rings** | **0 rings** |
| VIII-5 six-domain trophy ring (spec:844–851) | six domains × ≥1 qualifying day | body/media 0 | **0 rings** | **0 rings** |

**The brief's "rings shrink (2 → 0?)" is FALSE for this archetype — it is 0 → 0.**
The D098 ring-shrink leg needs the full-7-domain life to bite (V-1's tuning).

**Event log:** year-1 backup ≈ 3,076 events · pre-restore 3 years ≈ 9,230 ·
re-grown 5 years ≈ 8,900. The restore re-derivation ≈ 3,076 events ≈ 0.1s off-thread
(run 11's P-07 arithmetic) — a perf non-event.

---

## 4. The bank — composition by checkpoint (the faucets dominate; ≈ per the run series' convention)

| Checkpoint | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| **Year 1 (IN THE BACKUP)** | 5 | 12 | ~69 | 6 | 10 | **0** | **≈ 102** |
| **Year 3 pre-restore** | 5 | 12 | ~154 | ~15 | ~21 | 6 | ≈ 210 (≈180 bloomed · ≈30 pending) |
| **Restored (Mar 8 Y3)** | 5 | 12 | ~69 | 6 | 10 | 0 | **≈ 102** |
| **Re-grown Feb 1 Y5** | 5 | 12+ | ~180 | ~15 | ~16 | 1 (III-11) | ≈ 230 (≈180 bloomed · ~50 pending) |

Key moves: the 6 pre-restore Groves (III-11, II-4, I-16, II-14, III-27, IV-13)
collapse to 0 at the restore; the re-grown life re-earns exactly ONE (III-11 — the
rest are foreclosed, V-3). The Ring tier re-fires on the re-grown windows but VIII-2
never re-earns (V-9). The bank's composition honesty: the engine contract must fix
the exact per-wave composition (run 11's V-10f, carried); the paper run pins the shape.

---

## 5. The blooms — schedule, un-bloom, and the re-scheduling

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| First bloom (pre-restore) | **Feb 1 Y2 (WINTER — A9)** | 60 S/R/B/H of ~150 · overflow ≈ 90 → Mar 1 Y2 | C1 ✓ C2 ✓ (V-4) |
| Annual Y2 | Mar 1 Y2 | Ring 12 + **CROWN III-11 transforms** + II-4 large + overflow → 60 | C4 ✓ (crown once-set) |
| Annual Y3 | Mar 1 Y3 | 4 chain Groves (I-16/II-14/III-27/IV-13) + Ring 9 + overflow → 60 | C4 ✓ |
| **THE RESTORE** | **Mar 8 Y3** | **the 60 holding flowers un-bloom; the 120 faded records vanish; the crown un-sets; the bank re-derives to ≈ 102** | D098 ✓ |
| Re-first-bloom | **Feb 1 Y4 (WINTER)** | 60 of the re-banked S/R/B/H · overflow → Mar 1 Y4 | C1 ✓ C2 ✓ |
| Annual Y4 | Mar 1 Y4 | Ring 9 (II-5/II-12/III-26 re-fires) + overflow → 60 · **no crown** (III-11 re-earns 4 days late — V-10) | C4 ✓ (crown slot empty) |
| Annual Y5 | Mar 1 Y5 | **CROWN re-transforms: III-11** + Ring 9 + overflow → 60 | C4 ✓ (crown re-set in the re-grown log) |

**The un-bloomed flowers' re-scheduling (the brief's economy question):** the C2
overflow math re-runs cleanly on the re-grown bank — the 60-budget seasons, the
wave caps, the "no flower lost" guarantee all re-derive automatically (D098's pure
function). Nothing is double-counted (the pre-restore blooms are simply not in the
restored log). The re-scheduling is honest in TWO directions: temporarily-re-earnable
flowers (the S/R/B/H, III-11, the Ring re-fires) re-schedule to the re-grown tree's
spring flushes; the chain/streak Groves (II-4, I-16, II-14, III-27, IV-13) re-schedule
to **never** — they are closed, not delayed (V-3).

---

## 6. Adaptations (E-group) — pre-restore vs re-grown

| Adaptation | Signature (register) | Pre-restore (Mar 8 Y3) | Re-grown (Feb 1 Y5) |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | never (tenure 0.3) | never |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | never (0.69/0.42 — the E1/E2 boundary, V-12b) | never |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | knife-edge miss (0.42 > 0.4 — V-12b) | same |
| E4 cladodes | divergence ≥0.6 | never (no entry-free streaks) | same |
| E5 storage leaves | media share ≥0.5 | never (media 0) | never |
| E6 thorns | "the 365-day streak achievement" (no referent — V-8b) + tenure ≥2 | **MANIFESTED Mar 1 Y2** (II-4 d500 + D1 Feb 1 Y2) | **UN-MANIFESTED at the restore — II-4 foreclosed, never re-manifests** |
| E7 spines | 100-day streak (II-3) | subtle texture from ~Y1 | **SURVIVES the restore** (II-3 was in the backup) ✓ |
| E8 tendrils | live long-horizon goal | present (A10) | **SURVIVES** ✓ |
| E9 reaction wood | a revival (universal, no gate) | none (no dormancy) | **PRESENT — the restore-gap revival (Mar 8 Y3) — the adaptation the restore CREATES (V-6)** |
| E10 contractile | 3 consecutive stage-years with RISING active days | never (365/365/365 flat) | never (365/328/365 not rising-consecutive) |
| E11 mycorrhizal | coachEngagement ≥ threshold | n/a (owner threshold undefined — 02-V7, carried) | n/a |
| E12 stolons | L-10 insight ≥3 windows | never | never |
| E13 bracts | no gate | every bloom ✓ | every bloom ✓ |
| E14 bud scales | dormant-habit state | none (no dormancy) | **PRESENT through the gap** (habits dormant) → revive Mar 8 Y3 |

**Manifest summary:** the restore flips E6 (thorns un-manifest and die with II-4),
creates E9 (reaction wood from the gap's revival), keeps E7/E8 (backup-carried), and
adds E14 through the dormancy stretch. The tree's character (resource 0.42, balance
0.69) is unchanged across the restore — the gap is a RHYTHM/TENURE scar, not a
character re-roll.

---

## 7. Verification — the D098 contract end to end (honesty, coherence, schedules, economy, budgets)

**D098(1) — the tree is a pure function of the current log:** ✓ PASS. Restore
replaces the log; the tree re-derives from the 3,076-event year-1 log; there is no
separate tree state to corrupt. The derived cache is regenerable and was rebuilt
off-thread behind the shimmer (D098(5)).

**D098(2) — monotonicity by design:** ✓ PASS. The anchor (Feb 1 Y0) rode the backup
and never moved; rings derive from the CURRENT log against it. The log says years
2–3 didn't happen → the tree honestly shows 1 stage-year, POLE, 36 twigs — the
honest regression, exactly as designed. (Here there are no rings to shrink — V-1.)

**D098(3) — the three restore cases + the guardrail:** ✓ PASS (the OLDER case
exercised end to end). Same-era/newer are defined and unchanged. The older restore
regressed stage (MATURE→POLE), stage-years (3→1), blooms (180→0), the crown (set→
empty), and thorns (manifested→gone); the why-panel narrated "your tree reflects your
data as of Feb 1 Y1 — restored Mar 8 Y3"; the legend card noted it; the restore was
explicit and never automatic. **No silent regression.**

**D098(4) — the re-derivation moment is a designed transition:** ✓ PASS. The
restore played through the D094 language (shimmer → reverse rewind ≈ 6–8s → the
optional rewind journey ≈ 27–34s total, inside the ~20–40s envelope with run 11's
V-7 wave-compression rule). Never a silent snap.

**D098(5) — the cache rule:** ✓ PASS. The cache stayed out of the backup; the rebuild
streamed off-thread on the heaviest import path.

**D098(6) — what never shrinks:** ✓ PASS. Nothing in the CURRENT log shrank after
the restore — the post-restore log is append-only (the resume on Mar 8 Y3 and the two
re-grown years); only the explicit restore rewound it; no background process ever
rewinds the tree.

**D109(2) — the fingerprint:** ✓ PASS. The restored logFingerprint (≈3,076) is
smaller than the cache's (≈9,230) → immediate invalidation, no stale-tree window.

**D109(3) — restore × sync:** ✓ PASS. Account-level; the untouched device re-derives
from the restored log rather than re-merging its live log over the restore — the
fleet can't resurrect the wiped years.

**D114 — the existence ratchet:** ✓ PASS — the brief's key verified. The anchor
persists in the backup; the tree was re-born at the SAME anchor and never dissolved;
"no events = no tree" applies only to the first birth. The tree at its lowest is POLE
with a monotonic age of 3 — a born tree, never a dissolved one.

**Honesty — PASS.** Nothing farmed: the pre-restore 3 years are same-day in-window;
the gap is not backfilled (D100's ±3d predicate + D113's isBackfill would block it);
the re-grown tree shows the missed years as a visible dormancy scar with reaction
wood, not as smooth recovery. The un-blooming, the crown's vacancy, the foreclosed
chains, the RHYTHM collapse — every one is a visible, explained truth of the data.

**Coherence — PASS with the standing ring/legend tension (V-1/V-2).** Contradictory
adaptation signatures remain impossible (resource 0.42 cannot satisfy both E1's ≤0.6
and E2's ≥0.6). The identity filter holds (the syconium-family crown III-11 needs
balance ≥0.6 → 0.69 ✓). The tension: the trunk is ringless under the locked A5 while
the pre-restore tree's legend (III-11) is a Grove the log can no longer justify —
the crown re-derives rather than resurrecting (V-2's recommendation).

**Schedules — PASS.** D092: pre-maturity banking ✓ (the year-1 bank = buds); the
first bloom at maturity ✓ (winter-exempt per A9 — V-4); post-maturity on-earn ✓;
Ring at the annual bloom ✓; Grove at the next annual bloom ✓ (the crown re-transforms
Mar 1 Y5). D093: thorns manifested at the next annual bloom pre-restore (Mar 1 Y2) ✓
and honestly un-manifested on restore. D095: winter banking ✓ (the Feb 1-earned Ring
and chain Groves bank to the Mar 1 flushes; the re-grown winter earns bank the same
way); ephemerality ✓ (the Mar 1 Y3 bloom was holding and visibly withdrew at the
restore). D100: all in-window. D108(5): the restore's ceremonies queue if the user
isn't in-app.

**Economy — MECHANICALLY PASS, with the terminal-foreclosure honesty gap (V-3/V-11).**
C1 (15/event) and C2 (4 waves = 60/season) hold at every bloom pre- and post-restore;
overflow banks with nothing lost; the re-scheduling re-derives cleanly. The gap: the
4 un-bloomed chain Groves are never re-scheduled — the C7 counter must render them
"closed, not pending" or the bank's composition silently lies.

**Budgets — PASS.** Twigs 105 lifetime / 69 visible ≤ C5's 12/yr/branch ✓; the habit
branch stays under C3's 30-bud cluster threshold ✓; C4's crown slot is once-set per
log (re-set on the re-grown log) ✓; D1/D2/D3 floors re-met at Feb 1 Y4/Y5 ✓; the
restore re-derivation ≈ 0.1s off-thread ✓.

---

## 8. Violations & tuning proposals

**V-1 [RINGS — MAJOR, the brief's headline hypothesis falsified] The brief's "rings
shrink (2 → 0?)" is not derivable from the locked register for this archetype: the
A5 ring-year needs the canonical 7 presence-domains each ≥40 in-window days
(D104/D114(3)), and balanced-lite touches 4 (body/media/goals = 0). The trunk is
ringless under EVERY reading (A5 and the six-domain VIII-5) pre- AND post-restore:
**0 → 0.** The honest shrink happens at stage-years (3→1), stage (MATURE→POLE),
twigs (108→36), blooms (180→0), the crown, and the adaptations. **Tuning: (a) to
exercise the D098 ring-shrink leg, run the FULL-7-domain variant (run 03's cadence)
as the restore archetype — the ring then honestly shrinks 2→1 at the restore; or (b)
fold A5 into the six-domain bar (run 04/11's V-2 proposal — drop goals from the ring
set), or (c) per-class A5 bars. The register stays locked; the paper run only proves
reachability — and for THIS archetype the ring brand is unreachable by design.**

**V-2 [THE CROWN — MAJOR, C4's "once-set" vs D098's pure function] The crown is
derived (`legendAchievementId`, D107): III-11 (earned d392, after the Feb 1 Y1 cut)
is wiped by the restore → the legend slot un-sets; it re-sets to III-11 again at the
Mar 1 Y5 annual (the re-grown first Grove). C4's "once-set" is per-log, not eternal —
and the restore can even change the crown's identity (if the pre-restore first Grove
had been the only one, the re-grown crown would differ). **Tuning: (a) document that
the crown is re-derivable (pure-function, D098) and have the why-panel + legend card
narrate the regression ("your legend was earned from data no longer in the log");
(b) do NOT put the crown in the backup — a restored crown the log can't explain breaks
D098's purity.** This is the crown-level "blooms un-bloom": honest, but it must be
stamped.

**V-3 [THE FORECLOSED CHAINS — MAJOR, the restore's long tail] The gap permanently
forecloses every consecutive-window/streak Grove the user owned: II-4 The Long Haul
(500-day streak), I-16 Three Years Still Talking, II-14, III-27, IV-13 (3-consecutive-
window chains), plus IX-1's Ring step (365 full-circle days) and VIII-2/VIII-3
(≥75% active months). They are closed forever — not delayed — and the D098 contract
does not distinguish "re-scheduled" from "terminal." **Tuning: the why-panel's restore
narration lists the foreclosed chains explicitly ("these closed — the chain broke at
the gap"); the C7 bank counter must NOT show them as pending buds (V-11).**

**V-4 [WINTER-MATURITY FIRST BLOOM — MAJOR, run 05 V1 / run 10 V5, at the 5th+ scale
recurrence] The Feb 1 anchor puts maturity AND the first bloom on Feb 1 Y2/Y4 —
mid-winter, when D095 says nothing blooms.** D092(2) fires the first bloom at
maturity; D095 says winter earns bank to spring. Adopted run 10's A9 (the ceremony is
winter-exempt; the wave budget applies) and flagged. **Tuning (run 10's V-5, recommend
(a)): pin the boundary — the first bloom is a winter-exempt stage ceremony (D092(2) +
D094 literal; the D095 amendment touches rule 3's on-earn, not rule 2), recorded in
the trigger-correlation table.**

**V-5 [THE RHYTHM COLLAPSE — the axis window is undefined] The 2-year gap makes the
lifetime RHYTHM ≈ 0.16 (the ~104 zero-activity weeks sit inside the CV) vs 1.0 before
the restore — an honest read, but it is an artifact of F5's unspecified time window
and it visibly "punishes" a user whose rhythm post-restore is perfect again.**
**Tuning: pin F5's window (trailing 12 months / last N stage-years) in the dev tools
(D105), or keep the lifetime read and copy it honestly ("the rhythm axis reads your
whole log").**

**V-6 [THE RESTORE-GAP REVIVAL — NEW, the adaptation the restore CREATES] The gap is
genuine dormancy (bare branches, E14 scale-wrapped buds); the Mar 8 Y3 resumption is a
revival → E9 reaction wood + epicormic manifest (universal, no gate). Correct and
honest — but D098 never mentions restore-created adaptations. **Tuning: the restore
stamp/why-panel explains the new reaction wood ("this is where the log went quiet for
two years"); add the restore-gap to the adaptation explanations.**

**V-7 [THE REWIND JOURNEY'S ENVELOPE — run 11's V-7 carried] The rewind journey
(reverse ≈ 6–8s + year-1 replay ≈ 5s + the re-growth ≈ 16–21s) ≈ 27–34s, inside the
~20–40s envelope — but only if the annual blooms compress into the 2s year beats and
only the first bloom gets the 8–12s ceremony. **Tuning: pin the per-year beat budget
(run 11's rule) before the mockup step.**

**V-8 [REGISTER TEXT — carried, 8th/7th recurrences] (a) B2 ≥15 (SCHEMA 2.4) vs ≥20
(D115(1)) — insensitive here (30/30), must freeze; (b) E6's "365-day streak
achievement" has no referent (II-4 = 500-day) — and here it is DECISIVE: the thorns
flip with II-4 across the restore, so the trigger's referent must be pinned. Tuning:
cite II-4 explicitly or add a 365-day streak trophy.**

**V-9 [THE LONGevity RING TROPHIES AT THE GAP — NEW] VIII-2 Two Years (≥75% active
months since the anchor: 12/24 = 50% after the gap) and VIII-3 Five Years never re-earn
— the "longevity" family is the victim of a data-formula the tree's age (3) no longer
matches. Honest (data-driven), but the trophy's intent ("you're 2 years in") collides
with its formula after a restore. **Tuning: separate "tree age" (anchor-monotonic)
from "active months" in the VIII-1..4 conditions, or document that a restore rewinds
the age-claims too.**

**V-10 [THE SAME-DAY BOUNDARY AT THE RE-BLOOM — 02-V6 recurrence] III-11 re-earns
Feb 28 Y4 — 4 days before the Mar 1 Y4 bloom opens — and banks to Mar 1 Y5. The 02-V6
pin ("closes ON a bloom day") is exact-day only; the participation band is unpinned.
**Tuning: pin the participation window (exact-day ±0, or ±7d) in the engine contract.**

**V-11 [THE BANK COUNTER'S TERMINAL FORECLOSURES — NEW, economy] After the restore,
the C7 counter's pending count drops permanently by the ~5 foreclosed Groves with no
visual distinction from "temporarily re-scheduled" buds — the composition silently
misreads. **Tuning: render foreclosed chains in a separate "closed — not pending"
bucket in the bank counter + why-panel.**

**V-12 [CARRIED — F4 calibration + the A3 twig bar] (a) The A3 bar kills the gym
branch's canopy (13 days/30-day month < 15) — a 3-of-4 twig canopy for a life that
gyms 3×/week (run 11's V-4, at 4-domain scale). (b) F4's ÷20 ceiling keeps RESOURCE
0.42 → the balanced-lite tree is caudex-shaped and never buttress, with phyllodes one
event/day away (run 04/11's V-3); at ceiling 12 → 0.70 → buttress. **Tuning: freeze
F4's ceiling + event unit (presence-owner events) in the dev tools; per-class A3 bars
(weekly ≥4/30 — gym 13 ✓).**

**V-13 [CARRIED — minor] (a) E11 mycorrhizal's coachEngagement owner threshold is
undefined (02-V7); (b) the paper bank composition wobbles ±30% at the repeatable tiers
(II-6/II-8 dominate) — the engine contract must fix the exact per-wave composition
(run 11's V-10f).**

---

## 9. Verdict

**The RESTORE-REWIND archetype passes the D098 restore contract's machinery end to
end — and the walk pins exactly where the restore is honest and where its long tail
needs copy and contract pins.**

**What works (verified):** the tree is a pure function of the restored log — the
fingerprint invalidates the cache immediately, the 3,076-event log re-derives off-
thread in ~0.1s, and the tree honestly regresses: MATURE → POLE, stage-years 3 → 1,
tenure 0.3 → 0.1, twigs 108 → 36, 180 blooms → 0, the crown un-set, the thorns
un-manifested. The existence ratchet holds: the backup carried the frozen Feb 1 Y0
anchor, the tree re-born at the same anchor never dissolves, age stays monotonic at 3.
The stamp + legend note + explicit-confirm guardrail mean no silent regression; the
fleet re-derives from the restored log (D109(3)); nothing in the append-only
post-restore log ever shrinks again (D098(6)). The re-grown tree then re-matures
honestly — a FULL YEAR LATER (Feb 1 Y4) than the wiped maturity anniversary, because
stage-years 2–3 are genuinely missing — re-blooms through the same C1/C2 wave economy
(nothing lost, nothing double-counted), re-sets its crown (III-11 → Mar 1 Y5), and
wears the gap as an honest scar: reaction wood at the revive, E14 bud scales through
the dormancy, RHYTHM 0.16, and the chain Groves closed forever.

**What fails (the violations):** the brief's "rings shrink 2 → 0" hypothesis is
FALSIFIED — a 4-domain life never brands an A5 ring, so the ring-shrink leg is 0 → 0
and needs the full-7-domain variant or the A5 fold to bite (V-1); C4's "once-set"
crown is re-derivable and can change identity across a restore (V-2); the restore's
long tail is terminal for every consecutive-window/streak Grove and the age-claims
(VIII-2/3), and the bank counter must render "closed, not pending" (V-3/V-9/V-11);
the RHYTHM axis's undefined window punishes the gap (V-5); the winter-maturity
first-bloom clash recurs at the Feb 1 anchor (V-4); the restore-created reaction wood
needs stamp copy (V-6); the rewind journey needs the wave-compression rule (V-7); the
two register text drifts and the F4/A3 calibrations stand (V-8/V-12/V-13).

**Priority tuning order:** the crown/legend restore semantics (V-2 — the walk's most
surprising honest artifact) → the foreclosed-chains copy + counter bucket (V-3/V-11) →
the A5 ring reachability decision (V-1 — decide whether any archetype is allowed to
ring) → F4's unit + ceiling (V-12b — decides the tree's character) → the F5 window
(V-5) → the first-bloom winter boundary (V-4) → per-class A3 bars (V-12a) → the two
register text drifts (V-8) → the same-day participation band (V-10) → the rewind
compression rule (V-7). Every one is dev-tunable per D105.

**Run verdict: CONDITIONAL PASS.** The D098 machinery is honest end to end — the
rewind re-derives rather than faking, the ratchet holds, the stamp prevents silent
regression, and the re-grown tree's recovery is genuine (and a year late, honestly).
The restore's long tail — a foreclosed chain is not a delayed bud, a re-derived crown
is not the old crown, a 2-year gap is a rhythm scar — is all honest data, but it must
be COPYED and COUNTED as such, or the C7 counter and the legend card silently tell a
different story than the tree.