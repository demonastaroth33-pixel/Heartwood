# PAPER ARCHETYPE RUN 09 — "ROTATING-LOGGER" (the D115 rotating test case)

**Date:** 2026-09-23 · **Instrument:** the paper archetype run (LOOPHOLES §6.4 —
design-time simulation, no code). **Register read:** SCHEMA.md §2.4 (the locked
threshold register, groups A–F, verified verbatim for this run) + Artifact 1
(canonical domains, D104/D115) + Artifact 3 (trigger-correlation) + the
D090–D115 records in TEMP-PLANNING.md (D092/D093/D095/D099/D100/D101/D102/D114/
D115 read in full). **Trophy conditions verified against:**
scan-outputs/02-achievements.md (verbatim per-trophy conditions, families I–IX)
+ ACHIEVEMENT-SCAN.md. **Purpose:** this archetype is the D115 rotating-logger
test case — the loop-closure gate's instance 1 (audits/loop-closure-
verification.md finding 2: "the rotating daily logger — no domain ≥15/30 —
stays SEEDLING-locked under the per-domain reading"). The task: verify the
ANY-DOMAIN-MIXED fix unblocks him, then walk the whole register against his
365-days-a-year rotation. **Cross-references:** run 01 (gym-heavy), run 02
(journal-only), run 03 (balanced), run 05 (bursty), run 07 (body-only) — cited
where they touch this pattern.

---

## 0. The synthetic user

A 2-year user who logs **EVERY day** — the app's maximum-consistency citizen —
but rotates the domain daily:

| Weekday | Domain | In-window days/yr (anchor = Monday) | A2 qualifying rule |
|---|---|---|---|
| Mon | Journal (`journal.created`, ~200 words) | 53 (Y1) / 52 (Y2) | ≥40 words, non-imported ✓ |
| Tue | Gym (`workout.completed`, ≥1 real set) | 52 (Y1) / 53 (Y2) | ≥1 real logged set ✓ |
| Wed | Nutrition (`nutrition.logged`, 1 real food-log) | 52 / 53 | ≥1 real food-log ✓ |
| Thu | Habits (`habit.completed`, 1 habit) | 52 | 1 completion ✓ |
| Fri | Journal | 52 | ≥40 words ✓ |
| Sat | Gym | 52 | ≥1 real logged set ✓ |
| Sun | Body (`body.weighed`, first-of-day) | 52 | 1 canonical weigh-in ✓ |

Journal totals **105 (Y1) / 104 (Y2)** · gym **104 (Y1) / 105 (Y2)** · nutrition
**52 / 53** · habits **52** · body **52** · **media 0 · goals 0.** Every event
written same-day (in-window, the D100 predicate — the A1 grace never used),
none imported, none future-dated (F10). One frozen birth anchor: **Oct 1 Y0** —
the first in-window event (the day-1 journal entry), frozen per D090 B /
D100(5) / D102. Walk = day 1 … day 730 (Oct 1 Y2), checkpoints at **Month 1
(Oct 31 Y0, d31) · Month 3 (Dec 31 Y0, d91) · Year 1 (Oct 1 Y1, d365) ·
Year 2 (Oct 1 Y2, d730)** — each "Year N" checkpoint = the N-th anchored
365-day window close (F3, never calendar-chopped).

**Assumption set (stated, then applied — every count in this run is derivable
from these):**

- **A1 — weekday pin.** The anchor day (Oct 1 Y0) IS a Monday; the rotation is
  locked to the calendar week (Mon journal, Tue gym, Wed nutrition, Thu
  habits, Fri journal, Sat gym, Sun body). Day map: d1 Mon Oct 1 · d2 Tue ·
  d3 Wed · d4 Thu · d5 Fri · d6 Sat · d7 Sun. (Sensitivity: any anchor weekday
  just permutes the day numbers; the per-year domain counts are invariant —
  each domain gets 52 days + 0–1 extra per year.)
- **A2 — one habit, no clock slots.** The user maintains exactly 1 habit
  (completed every Thursday). I-4 Same Time Every Time, II-9 Like Clockwork,
  V-3 Same Hour Same Scale never fire (no slot pinned). II-7 Five Strong and
  II-13 Renaissance Life need ≥5 habits — never fire (1 habit).
- **A3 — no PR numbers in the brief** → the PR/rung block (III-3..III-20,
  R1–R47, IX-4) is EXCLUDED from the primary count (like runs 01/03's
  assumption) and reported as assumption-gated only. The Big-4 lifts (squat,
  bench, deadlift, OHP) are assumed rotated across the Tue/Sat sessions, so
  III-2 The Basics fires when the last of the four firsts lands (d13).
- **A4 — no media, no goals, no coach, no vacations, no phases.** No photos/
  vlogs (VII dead, media presence 0), no task/goal events (goals presence 0,
  E8 closed), no coach check-ins (E11 closed), no VI family, no phase-gated
  trophies (III-23, IV-3/4/5/8/9/10/11/12, V-4).
- **A5 — no weight values** → the V-10..V-16 weight ladder is excluded (only
  canonical weigh-ins exist; V-2 Steady Hand reads the day pattern, not
  weight).
- **A6 — 365-day anchored years**, no leap-day in the span's math (F3/D101
  anchored windows are dayKey-driven; the weekday rotation is anchor-locked).
- **A7 — repeatables at their full repeat rate** (scan-authoritative: V-2 and
  III-21 say "repeatable"); run 03's conservative single-fire reading for V-2
  is noted in §4 but the scan's text is followed.

---

## 1. Register verification (against SCHEMA §2.4 — all confirmed, 2 drifts)

| # | Locked value | Verified | Note for this archetype |
|---|---|---|---|
| A1 | grace ±3d | ✓ | Never used (same-day writer) |
| A2 | qualifying rules | ✓ | All five logged domains qualify every logged day |
| A3 | twig bar ≥15 in-window days / 30-day month | ✓ as written | **Impossible for every domain — 8.6/30 max (V-2)** |
| A4 | stage-year ≥200 active days | ✓ | 365/yr → 1 stage-year/yr |
| A5 | ring ≥40 days/domain, canonical 7 | ✓ as written | 5 of 7 domains pass (52–105); **media 0 + goals 0 fail → NO ring ever (honest — V-6)** |
| B1 | first in-window event | ✓ | Oct 1 Y0, day 1 |
| B2 | ≥15 days/30-day window, ANY-DOMAIN-MIXED | ✓ | Day 15 (15/15 in the Oct 1–30 window) — **the D115 rotating fix VERIFIED (§2)** |
| B3 | 1 stage-year | ✓ | Oct 1 Y1 |
| B4 | ≥2 stage-years + ≥1 domain ≥90 days | ✓ | Oct 1 Y2 — journal 105 (best year) ≥ 90 ✓ **and** gym 105 ✓ — **maturity in-season (autumn) — the brief's "MATURITY NEVER" is arithmetically false (V-1)** |
| B5 | ≥10 stage-years | n/a | 2/10 by Y2 |
| C1 | ≤15 flowers/bloom event | ✓ | First bloom: 30 buds in 2 waves (15+15) |
| C2 | ≤4 waves/season (60); overflow → next spring | ✓ | 30 ≤ 60 — **zero overflow, zero queue** |
| C3 | ≥30 buds/branch → clusters | n/a | 1 habit-bud < 30 |
| C4 | 1 legend/bloom + 1 all-time crown | ✓ mechanically | **No Grove ever → no crown, no legend (V-8)** |
| C5 | ≤12 twigs/branch/yr + 3-yr retention | ✓ | 0 twigs ≤ 12 — the cap never engages |
| C7 | bank counter top-3 + count | ✓ | "5 Heartwood, 9 Branch, 11 Root (+5 Sprout)" at Y2 |
| D1/D2/D3 | 2 / 3 / 5 stage-years | ✓ | d730 / d1095 (out) / d1826 (out) |
| E1–E14 | signatures | ✓ read | See §6 |
| F1/F2/F3 | fixed seasons, growing Mar1–Nov30, anchored 365d | ✓ | Oct 1 anchor: maturity + the first bloom land IN-SEASON (autumn) — no winter clash (run 05's V1 cannot occur here) |
| F4 | RESOURCE = avg events/active day ÷ 20 | ✓ as written | **0.05 — the E2 resource leg is unreachable (V-3)** |
| F5 | RHYTHM = 1 − CV(weekly) | ✓ | 1.0 (7/7 every week, stddev 0) |
| F6 | BALANCE = Shannon evenness, canonical 7 | ✓ as written | **0.80 — the brief's ~0.99 is false (V-6)** |
| F7 | TENURE = stage-years/10 | ✓ | 0.2 |
| F8 | replay ~2s/yr | ✓ | 2-yr time-lapse ≈ 4s |
| F10 | future-dating clamp | ✓ | None |

**Register drift 1 (B2, 15 vs 20):** SCHEMA §2.4 B2 = ≥15; D115(1) records
≥20 (02-V1, 01-V12, 03-V6, 05-V10, 07-V1 — the 6th recurrence). For this
archetype the tick shifts d15 → d20 (both October) — the tick itself is
insensitive. Still must freeze (V-5).

**Register drift 2 (E6 referent missing):** E6 says "the 365-day streak
achievement"; family II's long-haul trophy (II-4) is a **500-day** streak and
II-12 is an anniversary touch, not a streak — no referent exists (01-V8,
02-V3, 03-V4 — the 4th recurrence). Here it is **load-bearing in reverse**: no
streak of ANY length ever fires for the rotating logger (his habit is weekly),
so thorns stay closed under every reading (V-4, text-only for others, real for
him).

---

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | Day 1 (Oct 1 Y0) | first in-window event (register B1 / D090 A) |
| B2 SEEDLING→SAPLING | **Day 15 (Oct 15 Y0)** | register B2: ≥15 in-window days in any 30-day window, **ANY-DOMAIN-MIXED** — 15/15 days of the Oct 1–30 window (every day logs SOMETHING). **THE D115 ROTATING FIX VERIFIED: the rotating logger is unblocked — he passes on the mixed reading at d15 (d20 under D115(1)'s record text).** The loop-closure gate's instance 1 is closed: a user with ZERO domains ≥15/30 still ticks, because the gate reads days, not twigs, and reads them ACROSS domains (D115(1) + the register's own gloss "the A3 month bar itself — days not twigs"). **The per-domain reading (the ambiguity the loop-closure audit flagged) would leave him SEEDLING-LOCKED FOREVER — no domain ever reaches 15/30 (max 8.6/30). The register's "ANY-DOMAIN-MIXED" wording is the load-bearing fix, and it must never be re-ambiguated at the docs pass (V-5's amendment)** |
| B3 SAPLING→POLE | Oct 1 Y1 | 1st stage-year closes (365/365 in-window ≥ A4's 200) |
| B4 POLE→MATURE | **Oct 1 Y2 (d730)** | ≥2 stage-years AND journal's best anchored year = **105 ≥ 90** ✓ (gym's = 105 ✓ — the gate is met TWICE over). **The D115 days-based B4 works for the rotation.** *Note: the brief's claim "NO domain reaches 90 (each ~48–52/yr)" is arithmetically FALSE for the written rotation — journal (Mon+Fri) and gym (Tue+Sat) each log ~104–105 days/yr, not 48–52; only the once-a-week domains (nutrition, habits, body) sit at 52. The "each domain ~13% of days" parenthetical describes a DIFFERENT archetype — the 7-domain × 1-day/week pure sampler — and THAT one is B4-locked forever (52 < 90). See V-1 for the residual deadlock class.* Maturity lands Oct 1 = AUTUMN — inside the growing season (F2) → the first bloom plays in-season (no winter clash, run 05's V1 n/a) |
| B5 MATURE→OLD-GROWTH | ≥10 stage-years | not reached in 2 years |

**The maturity headline, stated plainly:** the rotating logger — the app's
most consistent user, 730 logged days in 730 days — **MATURES at year 2, on
schedule**, because B4's depth bar is days-based (D115) and his journal/gym
rotations each clear 90 days. Maturity is NOT gated by the canonical-7 brand
(D090 C / D101 r1 — no rings here, ever), NOT gated by twigs (D115 — ZERO
twigs across both years; the D115 principle "no gate ever blocks on a twig
count" holds at its most extreme: a tree with an entirely bare canopy matures).

---

## 3. Checkpoint-by-checkpoint walk

### CHECKPOINT MONTH 1 — Oct 31 Y0 (day 31)

- **B1 tick (day 1, Oct 1):** first in-window event (journal, ~200 words) →
  SEED → SEEDLING. Germination ceremony (D094: crack, root curl, stem rise, 5
  branch-buds on the stem).
- **Events:** exactly 31 events — one per day, one domain per day. All
  qualifying per A2. Every day is solitary: journal days carry ONLY journal,
  gym days ONLY gym — no day ever co-occurs with a second domain.
- **Earned today (buds):** I-1 Ink on the Page (S, d1) · III-1 First Rep
  Logged (S, d2) · IV-1 First Plate Logged (S, d3) · II-1 Day One (S, d4) ·
  V-1 First Measurement (S, d7) · **III-2 The Basics (R, d13 — the 4th
  session completes the Big-4 firsts, per A3)**. Bank = **6 buds (5 S + 1 R)**.
- **The bank's shape is already visible:** all five domain "firsts" fired
  (the Sprout-family firsts across every logged domain — the brief's
  expectation ✓); IX-1 Full Circle Day NEVER fires (needs ≥2 domains on one
  dayKey — the rotation guarantees 1/day); IX-2 Six for Six NEVER fires (6
  domains in a day). The rotation makes the tree's richest family (IX) dead
  on arrival.
- **Axes:** RESOURCE 0.05 (1.0 event/active day ÷ 20 — the sparse end by
  construction) · RHYTHM ~1.0 · BALANCE forming (stable ~d14) · TENURE 0.
- **Twigs 0 · Rings 0.** **Why-panel:** "SEEDLING · age 1 month · 6 buds · all
  five branches have presence but none has a twig — the twig bar wants 15 days
  in a month in ONE domain; your rotation gives every domain 4–9."

### CHECKPOINT MONTH 3 — Dec 31 Y0 (day 91)

- **B2 tick (day 15, Oct 15):** ≥15 in-window days in the Oct 1–30 window
  (15/15 — every day logs, mixed domains) → SEEDLING → SAPLING. Branch-buds
  extend; **D115(3) M-2: the banked-content leaf-buds (Oct's journal entries)
  burst into leaf clusters with the first twigs — but there are NO twigs, so
  the canopy stays a bare stem with clusters hanging on nothing** (see V-2 for
  what this means for the seedling's visible form).
- **Winter starts Dec 1 Y0 (d62):** everything earned in winter (III-21 d84,
  V-2 d84 — both winter-earned) banks as flower-buds (D095) → they burst at
  the first bloom, pre-maturity (D092(2)); winter journal entries become
  leaf-buds on the bare branches (D095(2)).
- **Earned by d91:** I-13-R Unprompted (R, d33 — the 10th solitary journal
  day: every journal day is solitary, so the "reflection for its own sake"
  family fires on schedule) · III-21 Trimester of Iron (B, d84 — 12
  consecutive weeks at the Tue+Sat schedule target) · V-2 Steady Hand (R, d84
  — 12 consecutive Sunday weigh-ins). Bank = **9 buds (5 S · 3 R · 1 B)**.
- **Axes:** RESOURCE 0.05 · RHYTHM 1.0 · BALANCE 0.80 (stable) · TENURE 0.
- **Twigs 0 · Rings 0.** **Why-panel:** "SAPLING · age 3 months · 9 buds · you
  have logged every single day and the tree still has no twigs — the twig bar
  counts days per domain, and your rotation never concentrates any domain.
  The Unprompted family celebrates that your journal days are pure reflection."

### CHECKPOINT YEAR 1 — Oct 1 Y1 (day 365)

- **B3 tick:** stage-year 1 closes (365 active days ≥ 200) → SAPLING → POLE.
  Pole-rise ceremony (D094). Leaf granularity unlocks (C6).
- **Rings: 0 — and NEVER.** The ring-year (A5/D101/D114(3)) needs ALL
  canonical-7 domains ≥ 40 in-window days. The five logged domains all pass
  (journal 105 · gym 104 · nutrition 52 · habits 52 · body 52) — **media (0)
  and goals (0) fail** → no ring brands, VIII-11 Pith (rings ≥ 1) never fires,
  VIII-5 Life Fully Logged (six-domain year) never fires, VIII-6 A Week Whole
  (six-domain week) never fires. **The ring is the canonical-7 brand, and the
  rotation's two absent domains are the honest reason (D090 C / D101 r1: rings
  are a brand, never a gate — this user is MATURE-eligible at year 2 with zero
  rings).** Note: the single biggest repeatable faucet of the balanced run
  (VIII-6 ×52/yr in run 03) is media-gated and dead here — the rotating
  logger's economy is the opposite of run 03's flood (V-7).
- **Earned by d365:** I-6 Half Century (R, d173 — the 50th journal entry) ·
  I-13-B Unprompted (B, d173 — the 50th solitary day; same day, same count) ·
  III-21 ×4 (d84/d168/d252/d336) · V-2 ×4 (d84/d168/d252/d336) · III-22 The
  Schedule Never Breaks (H, d182 — the Tue+Sat weekday-set held 26 weeks; the
  rotation is a robot family's dream: the set never drifts) · III-22 again
  (H, d364 — run 2 closes) · VIII-1 One Year In (Ring, d365 — 365 days +
  activity in ≥3 domains in ≥9 of 12 months: 5 domains in 12/12 ✓; same-day
  boundary per the 02-V6 pin). Bank = **20 buds (5 S · 7 R · 5 B · 2 H ·
  1 Ring)**.
- **II-12 One Trip Around the Sun and III-26 A Year on the Bar both land
  JUST past the checkpoint** (d368/d367 — the habit's and gym's 1-year
  anniversaries, ±7d bands; both inside).
- **Axes:** RESOURCE 0.05 · RHYTHM 1.0 · BALANCE 0.80 · TENURE 0.1.
- **Twigs 0** (journal/gym 8.6/30, the rest 4.3/30 — all < A3's 15) — **the
  canopy is bare after 365 days of perfect logging** (V-2).
- **Why-panel:** "POLE · age 1 · ring 0 · 20 buds · your trunk will never
  brand a ring while media and goals are absent — the ring is the 7-domain
  brand, and you log 5 · next tick: MATURITY at 2 stage-years, which your
  journal alone already proves."

### CHECKPOINT YEAR 2 — Oct 1 Y2 (day 730) — MATURITY + THE FIRST BLOOM

- **B4 tick:** stage-year 2 closes (365) AND journal's best anchored year =
  105 ≥ 90 ✓ (gym 105 ✓) → **POLE → MATURE**. D1 floor (2 stage-years) met
  same day. Ring 0 stands (media/goals still absent). VIII-2 Two Years (Ring,
  d730 — 75% of 24 months: 24/24 ✓) fires same-day → stays banked (Ring tier,
  D092(2)).
- **The FIRST BLOOM (D092(2) + D094 ceremony, 8–12s, skippable):** all banked
  Sprout/Root/Branch/Heartwood buds burst. **Oct 1 Y2 is autumn — in the
  growing season (Mar 1–Nov 30, F2) — the first bloom plays in-season; the
  winter-maturity clash (05-V1) cannot occur for this anchor.**
  - **The S/R/B/H bank at this instant = 30 buds:** S 5 · R 11 (I-13-R d33 ·
    III-2 d13 · I-6 d173 · V-2 ×8 d84..d672) · B 9 (I-13-B d173 · III-21 ×8
    d84..d672) · H 5 (III-22 ×4 d182/d364/d546/d728 · I-13-H d698 — the 200th
    solitary journal day).
  - **C1/C2 check (the wave math):** 30 flowers ≤ 60/season → **2 waves of
    15 (≤15/event ✓, ≤4 waves ✓), composed in magnitude order per D099 (wave 1
    = H 5 + B 9 + R 1; wave 2 = R 10 + S 5). ZERO overflow, ZERO pending
    queue — the bank counter empties completely at the first bloom (C7 reads
    4 Ring banked for the next annual bloom).** The economy alarm of runs 01/03 (the permanent ~300-bud queue)
    is ABSENT — this bank is small and honest (V-7).
  - **Ring 4 stay banked** (II-12 d368 · III-26 d367 · VIII-1 d365 · VIII-2
    d730) → they bloom at the next annual bloom (Mar 1 Y3 — out of window).
  - **NO Grove, NO crown, NO transformation (C4):** no achievement in the
    Grove tier ever fires for the rotation (II-4 needs a 500-day streak,
    II-14/15 need 3/5 years of ≥300 habit days, III-25 needs 1000 workouts,
    IV-13/14 need 250 food-days/year, VIII-7/8 need six-domain years, IX-2
    needs 6 domains in a day, the V-8/9 chains need 3/5 years). **The bank has
    no legend; the tree's rarest surface stays permanently dark (V-8).**
- **Adaptations — pending:** **E3 phyllodes OPENS at maturity** (resource
  0.05 ≤ 0.4 ✓ + D1 floor d730 ✓ + stage floor SEEDLING ✓) — the sparse-
  stubborn signature — **the balance champion is a desert tree**. Manifest
  moment = the next annual bloom (Mar 1 Y3, out of window) → the walk reports
  the visible PENDING state on the branches from d730 (D093). **E2 buttress
  stays CLOSED** (balance 0.80 ✓ but resource 0.05 < 0.6 — the resource
  boundary again; D2 at 3 stage-years is also unmet until Y3) — the
  multi-domain balance signature the register's own D093 calls "the
  multi-domain trophies" cannot manifest for the most balanced logger (V-3).
  All other adaptations closed (§6).
- **Axes:** RESOURCE **0.05** · RHYTHM **1.0** · BALANCE **0.80** · TENURE
  **0.2**.
- **Why-panel:** "MATURE · age 2 · ring 0 · the first bloom burst all 30 of
  your flowers — nothing waits · four Ring buds wait for the spring flush ·
  your branches entered the phyllode state: the tree reads your life as
  sparse-stubborn, because one event a day is a thin stream however wide it
  spreads · the canopy is still bare — no domain ever reached 15 days in a
  month."

---

## 4. The computed numbers

**Axes (F4–F7):**

| Axis | Formula | Value | Read |
|---|---|---|---|
| F4 RESOURCE | avg in-window events/active day ÷ 20 | **0.05** (1.0 ÷ 20) | extreme-sparse — the 1-event/day rotation sits at the register's floor; the E2 gate is arithmetically closed (V-3) |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **1.0** (7/7 every week, stddev 0) | perfect — flat by construction |
| F6 BALANCE | Shannon evenness, canonical 7 (D104's list) | **0.80** (p = (0.288, 0.285, 0.142, 0.142, 0.142, 0, 0) → H = 1.549 → H/ln7 = 0.796) | high — the balance champion, BUT the brief's ~0.99 is false: the two absent domains (media, goals) cap canonical evenness at 0.80 (0.96 under a 5-present-domain normalization — see V-6) |
| F7 TENURE | stage-years ÷ 10 | **0.2** | low |

**Stage ticks (B-group):** B1 day 1 · B2 day 15 (the D115 mixed-domain fix
VERIFIED) · B3 Oct 1 Y1 · **B4 Oct 1 Y2 — MATURITY, in-season autumn — the
rotating logger is NOT locked at POLE** (the brief's premise corrected, V-1) ·
B5 at year 10.

**Twigs per domain (A3) — the bare-canopy check:**

| Domain | In-window days/30-day month | A3 bar (15/30) | Twigs in 2 years |
|---|---|---|---|
| Journal (Mon+Fri) | 8.6 | 15 | **0** |
| Gym (Tue+Sat) | 8.6 | 15 | **0** |
| Nutrition (Wed) | 4.3 | 15 | **0** |
| Habits (Thu) | 4.3 | 15 | **0** |
| Body (Sun) | 4.3 | 15 | **0** |
| Media | 0 | 15 | **0** |
| Goals | 0 | 15 | **0** |

**730 days logged, zero twigs — the canopy is entirely bare.** The register's
own D115(1) note ("a rotating logger honestly has fewer twigs") normalizes a
ZERO-twig canopy for the app's most consistent user (V-2).

**Rings (A5):** journal 105 · gym 104 · nutrition 52 · habits 52 · body 52 —
every logged domain ≥ 40 ✓ — but media 0 and goals 0 fail the canonical-7
ring-year (D101(2) as amended by D114(3)) → **0 rings in 2 years**. VIII-11
Pith never fires; the trunk stays unbranded — honest for the brand (the ring
IS the 7-domain statement; the rotation is a 5-domain statement).

**Bank by checkpoint (cumulative fires):**

| Checkpoint | Sprout | Root | Branch | Heartwood | Ring | Grove | Total |
|---|---|---|---|---|---|---|---|
| Month 1 (d31) | 5 | 1 | 0 | 0 | 0 | 0 | 6 |
| Month 3 (d91) | 5 | 3 | 1 | 0 | 0 | 0 | 9 |
| Year 1 (d365) | 5 | 7 | 5 | 2 | 1 | 0 | 20 |
| Year 2 (d730, MATURE) | 5 | 11 | 9 | 5 | 4 | 0 | **34** |

**The first-bloom burst:** 30 S/R/B/H buds → **2 waves × 15 = 30 flowers —
C1 ✓ · C2 ✓ · ZERO overflow, ZERO queue** (the bank counter empties; only the
4 Ring buds wait for Mar 1 Y3). The reverse of run 03's 18%-of-bank ceremony:
this first bloom shows 100% of the eligible bank (V-7).

---

## 5. The bank — all 9 families by tier (conditions per scan-outputs/
02-achievements.md, verified verbatim)

| Family | S | R | B | H | Ring | Grove | Never (verified) |
|---|---|---|---|---|---|---|---|
| **I Long Conversation** | I-1 d1 | I-6 d173 · I-9-R d435 (25k words @ 200/entry) · I-13-R d33 | I-13-B d173 | I-13-H d698 | — | — | I-2 (7 consecutive days — max 3-day journal streak), I-3 (90-day streak), I-5 (300 journal days/yr — ~105), I-7 (500th entry ~4.8 yr), I-9-B (100k words), I-12 (Oct 1 falls Tue/Wed in Y1/Y2 — the anchor-day vs rotation-day alignment kills it, V-6), I-15 (Jan 1/Dec 31 journal + 146 days — neither boundary is a journal day), I-16/17 (3/5 yr), I-4 (slot), I-10/11 (no gaps), I-14 (no phases) |
| **II Unbroken Chain** | II-1 d4 | — | — | — | II-12 d368 (anniversary band) | — | II-2/II-3 (7/100-day streaks — weekly habit, max streak 1), II-5 (300 habit days/yr — 52), II-6 (full-month completions), II-7/II-13 (≥5 habits), II-8 (≥3 habits/day), II-9 (slot), II-10/11 (no rests/gaps), II-14/15 (3/5 yr) |
| **III Iron Ledger** | III-1 d2 | III-2 d13 (Big-4 firsts, per A3) | III-21 ×8 (12-wk runs: d84..d672) | III-22 ×4 (26-wk weekday-set runs: d182/d364/d546/d728) | III-26 d367 (anniversary band) | — | III-3..III-20, R1–R47 (PR block, A3), III-23 (phases), III-24 (gaps), III-25 (1000 sessions — 208/2yr), III-27/28 (3/5 yr) |
| **IV Fuel Line** | IV-1 d3 | — | — | — | — | — | IV-2 (30 CONSECUTIVE days — weekly), IV-6 (180 cumulative days ~3.5 yr), IV-7 (1000 days), IV-13/14 (3/5 yr), IV-3/4/5/8/9/10/11/12 (phases) |
| **V Shape of Things** | V-1 d7 | V-2 ×8 (12-wk runs: d84..d672) | — | — | — | — | V-3 (slot), V-4 (phases), V-5/V-7 (photos — no media), V-8/9 (3/5 yr), V-10..16 (weight ladder, A5) |
| **VI Elsewhere** | — | — | — | — | — | — | all (no vacations, A4) |
| **VII Proof of Life** | — | — | — | — | — | — | all (vlog-gated, A4) |
| **VIII The Rings** | — | — | — | — | VIII-1 d365 · VIII-2 d730 | — | VIII-5 (six-domain year — media absent), VIII-6 (six-domain week — media absent), VIII-7/8 (six-domain chains), VIII-11..20 (rings ≥1..10 — no ring ever brands), VIII-3 (5 yr) |
| **IX Full Circle** | — | — | — | — | — | — | IX-1 (≥2 domains/day — the rotation guarantees 1/day), IX-2 (6 domains/day), IX-3 (vlogs), IX-4 (PRs), IX-5 (robot trio) |
| **TOTAL** | **5** | **11** | **9** | **5** | **4** | **0** | **34** |

**The repeatable share (economy):** III-21 ×8 · III-22 ×4 · V-2 ×8 = 20 of 34
fires (~59%) are re-fires — the LOWEST repeatable share of any run so far
(run 03: ~92%; run 01: ~82%). The rotating logger's bank is dominated by
one-time trophies because the repeatable faucets that flood the balanced run
(II-6, VIII-6, II-8, II-5, II-12 ×N) are all streak-, six-domain-, or
media-gated — all dead here. **The rotation starves the repeatable economy in
the opposite direction: the bank is honest, small, and drains completely at
the first bloom (V-7).**

---

## 6. The blooms (D092/D095 — every date pinned to the 02-V6 boundary rule)

| Bloom | Date | Contents | Checks |
|---|---|---|---|
| **First bloom** (D092(2)) | **Oct 1 Y2 (d730) — autumn, in-season** | 30 S/R/B/H buds → **2 waves × 15 (H 5 → B 9 → R 11 → S 5, magnitude order per D099); ZERO overflow** · Ring 4 (II-12, III-26, VIII-1, VIII-2) stay banked → next annual bloom (Mar 1 Y3, out of window) | C1 ✓ · C2 ✓ · no winter clash (01-V3/05-V1 n/a — autumn anchor) |
| Annual bloom Y3 (out of window) | Mar 1 Y3 | the 4 Ring buds · **phyllodes manifest (E3/D093, pending since d730)** | C4 cap: no Grove → no legend in either event |

Winter earns (Y0: III-21 d84, V-2 d84; Y1: I-9-R d435, III-21 d504, V-2 d504)
all bank as flower-buds → burst at the first bloom (D095 ✓, pre-maturity
D092(2)). Post-maturity earns: only the same-day VIII-2 (d730, Ring → annual
bloom). Winter journal entries become leaf-buds on the bare branches
(D095(2)) — the ONLY foliage the rotation ever shows.

---

## 7. The adaptations (E1–E14) — final state at Y2

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · D3 + MATURE | tenure 0.2 · resource 0.05 | **Closed** (tenure — year 7+ out of window) |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | balance 0.80 ✓ · **resource 0.05 < 0.6** | **CLOSED on the resource leg — the balance champion can't grow buttress (V-3)**; D2 opens Y3 but the signature stays closed at any tenure |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | resource 0.05 ✓ · D1 d730 ✓ | **OPENS at maturity (Oct 1 Y2) → PENDING → manifest Mar 1 Y3** — the sparse-stubborn adaptation is the rotation's one structural mark |
| E4 cladodes | divergence ≥0.6 | 0 (never misses) | Closed — honest |
| E5 storage leaves | media share ≥0.5 | 0 media / 0 content | Closed (no media at all) |
| E6 thorns | "the 365-day streak achievement" + tenure ≥2 | **no streak of any length ever fires (weekly habit) — and the register's referent doesn't exist (V-4)** | Closed under every reading |
| E7 spines | the 100-day streak trophy (II-3) | weekly habit → never | Closed — honest |
| E8 tendrils | live long-horizon goal | no goals (A4) | Closed |
| E9 reaction wood + epicormic | a revival — universal | never dormant | Closed — honest: the tree never falls |
| E10 contractile | 3 consecutive stage-years with RISING active days | 365 → 365 — flat | Structurally unreachable at the ceiling (03-V5) + only 2 stage-years |
| E11 mycorrhizal | coachEngagement owner ≥ threshold | 0 check-ins | Closed |
| E12 stolons | L-10 insight ≥3 monthly windows | not in the pattern | Closed/effectively-never (02-V7) |
| E13 bracts | no gate (ceremony) | the first bloom's presentation (no PRs → no F-03 flourish) | Display-only ✓ |
| E14 bud scales | no gate (dormant-habit state) | 1 habit, never dormant | None ✓ |

**Structural marks in this life: phyllodes (pending d730, manifest Mar 1
Y3) — and nothing else.** The most balanced axis profile in the register
(0.80 evenness, rhythm 1.0) yields ONE adaptation, and it is the desert
adaptation. The coherence envelope holds: E2 (resource ≥0.6) and E3 (≤0.4)
are contradictory by construction — resource 0.05 can only open E3, and the
tree honestly renders the sparse-stubborn character while the BALANCE axis
says "breadth champion." The why-panel must carry that tension (V-3/V-6).

---

## 8. Verification (honesty, coherence, schedules, economy, budgets)

**Honesty — PASS.** No farming: every event real, same-day, in-window (D100),
qualifying per A2, non-imported, no future dates (F10); the anchor is the
first in-window event and never shifts (D102). Nothing unrewarded: every one
of the 34 fires has a dated expression (D092); the unbloomed things are
unearned (the streak family, the six-domain family, the Grove family, the PR
block). The bare canopy (0 twigs), the unbranded trunk (0 rings), and the
desert adaptation are all visible truths of the rotation. The D115 promise
holds at its most extreme: a zero-twig, zero-ring, 730/730-day user matures —
because gates read days, and days are earned.

**Coherence — PASS.** Contradictory signatures impossible (E2 vs E3 both read
resource: 0.05 ≤ 0.4 and < 0.6 — only E3 opens; no double-fire). D112
identity filter: the syconium/cross-domain family needs balance ≥0.6 → 0.80 ✓
— but no IX family ever fires (1 domain/day), so the identity filter never
engages. The two ring definitions agree (A5's canonical-7 ring-year AND
VIII-5's six-domain bar both fail on media — one honest story). B4's
days-based gate and A3's twig render unit are now cleanly decoupled: the tree
can be MATURE with zero twigs — the D115 design intent, verified at its
extreme.

**Schedules — PASS.** B2 d15 (d20 under D115(1)'s record — the drift is real,
V-5). D092: pre-maturity banking → first bloom at maturity (Oct 1 Y2,
in-season) → Ring at the next annual bloom (Mar 1 Y3, out of window) ✓. D095:
winter earns bank to spring ✓ (the winter fires listed in §6). D093: phyllodes
pending d730 → manifest Mar 1 Y3 ✓. The same-day boundary (02-V6) appears
once — d730 (maturity + the first bloom + VIII-2, Ring → stays banked) — and
the pin holds. The rotation-alignment accidents (I-12's Oct 1 landing on
Tue/Wed, I-15's boundaries landing on gym/nutrition days) are honest calendar
facts, not schedule failures (V-6's note).

**Economy — PASS, and the anti-flood case.** C1 (15/event) ✓ · C2 (2 waves ≤
4) ✓ · the first bloom shows 30 of 30 eligible buds — 100%, zero overflow,
zero permanent queue — the cleanest bloom economy of any run (runs 01/03's
queue is structurally impossible here). The 59% re-fire share is the lowest
in the series. The flip side: the bank is SMALL (34 fires in 2 years vs run
03's ~372) because the rotation starves every repeatable faucet (V-7).

**Budgets — PASS.** Twigs 0 ≤ 12 (C5 — the cap never engages, the 3-yr
retention n/a); habit buds 1 < 30 (C3 — no clusters); C4 never engages (no
Grove — V-8); D1 d730 ✓, D2/D3 out of window; blooms ephemeral per D095.

---

## 9. Violations & tuning proposals

**V-1 [MAJOR — the brief's headline, corrected] B4's ≥90-per-single-domain
bar still deadlocks the pure-sampler class — the mixed-domain philosophy was
never extended from B2 to B4.** The written rotation (Mon+Fri journal, Tue+Sat
gym) clears B4 TWICE over (journal 105, gym 105 — the brief's "48–52/yr"
arithmetic applies only to the once-a-week domains) and matures at year 2,
in-season. But the brief's own parenthetical describes the real residual
deadlock: a 7-domain × 1-day/week pure sampler (each domain 52/yr < 90) is
**locked at POLE forever** — the D115 fix unblocked his B2 (mixed days) and
left B4's single-domain depth bar as the residue of the old twig thinking
(one deep branch). *Tuning (pick one, dev-tunable per D105):* (a) **B4 =
≥2 stage-years AND the top-2 domains' in-window days SUM ≥ 90 in the best
anchored year** — the sampler passes (52+52 = 104), the body-only/every-
other-day users still pass (their single domain ≥90 alone), nothing regresses;
(b) a mixed structural bar (≥150 in-window days across ≥5 domains); (c) keep
the single-domain bar but document the sampler as deliberately POLE-capped.
Recommend (a) — it extends the ANY-DOMAIN-MIXED principle B2 already locked.

**V-2 [MAJOR — presence] The A3 twig bar produces a ZERO-twig canopy for the
app's most consistent user — 730 logged days, no twigs.** Journal/gym sit at
8.6/30, the rest 4.3/30 — no domain ever reaches 15/30. D115(1)'s "a rotating
logger honestly has fewer twigs" normalizes a canopy of NOTHING; the seedling
canopy (D115(3) M-2's leaf-buds) bursts into clusters "with the first twigs" —
clusters with no twig home. *Tuning (run 03's V-2 proposal, now with a
rotation-specific option):* (a) per-class bars (daily-class ≥15/30; weekly-
class ≥4/30 — one in-window day per week sustained); (b) **a rotation-aware
twig = "≥15 in-window days across ANY domains in the month"** (the B2
philosophy extended to the canopy render unit — the rotating logger then
grows 12 mixed-character twigs/yr). Recommend (b) for this archetype class —
it makes the canopy match the log without touching the daily/weekly classes.

**V-3 [MAJOR — adaptation economics] E2 buttress is unreachable for any
1-event/day user — the balance champion (0.80 evenness, the register's most
balanced axis profile) can never grow the adaptation whose own signature the
register calls "sustained multi-domain balance."** F4's volume-normalized
resource (1.0 event/day ÷ 20 = 0.05) reads the rotation as extreme-sparse,
and E2's resource leg (≥0.6) is arithmetically closed at every tenure — the
same E1/E2 resource boundary runs 01/02/03 flagged, now at its sharpest: the
tree whose BALANCE axis exists to earn buttress is disqualified by its own
RESOURCE axis. *Tuning:* (a) buttress reads a **balance-weighted resource**
(avg events/day × evenness — the rotation scores 0.05×... still low: 1.0/day
is 1.0/day); (b) lower the E2 resource leg to ~0.4 (D105 dev-tunable) so the
balance leg carries the signature — a 1-event/day multi-domain logger is a
legitimate buttress candidate botanically (broad, shallow roots); (c) read
resource per-domain-minimum (≥1 event/day in ≥4 domains ≥ ~60 days each) as
the E2 resource leg. Recommend (b) — the other adaptations' resource
boundaries (E1 ≤0.6, E3 ≤0.4) stay intact; E2's intent is breadth, not volume.

**V-4 [MINOR — register text, 4th recurrence] E6 has no referent.** "The
365-day streak achievement" does not exist (II-4 is a 500-day streak). Here it
is not text-only: NO streak ever fires for the rotation, so thorns stay closed
under every reading — but the text must still cite II-4 explicitly at the
docs pass (01-V8 / 02-V3 / 03-V4, fourth confirmation).

**V-5 [MINOR — record drift, 6th recurrence] B2 register vs record: SCHEMA
§2.4 = ≥15 ANY-DOMAIN-MIXED; D115(1) = ≥20 "in ANY domain".** Two locked
documents disagree on BOTH the number and the reading. This archetype is the
proof that the SCHEMA's mixed reading is the load-bearing one — the D115
record must be amended to match (freeze 15 + ANY-DOMAIN-MIXED) so the
loop-closure gate's instance-1 ambiguity can never resurface (02-V1, 01-V12,
03-V6, 05-V10, 07-V1 — sixth confirmation).

**V-6 [MINOR — the brief's balance claim + a rotation-alignment note] The
brief's "evenness ~0.99" is arithmetically false: with media and goals absent,
canonical-7 evenness = 0.80 (0.96 only under a 5-present-domain normalization
the register does not state).** The axis is honest — the balance champion logs
5 of 7 domains. *Tuning:* document the canonical-7 zero-inclusive reading in
the F6 formula gloss (and why-panel copy: "you log 5 of 7 domains — your
balance is high because those five are nearly equal, and capped because two
are absent"). Related rotation-alignment facts worth why-panel copy: I-12
(Oct 1 journal) never fires because Oct 1 lands on Tue (Y1) / Wed (Y2), and
I-15's boundaries land on gym/nutrition days — the anchor-day vs rotation-day
alignment shapes the bank; honest, but the panel should say why.

**V-7 [NOTE — economy shape] The rotation starves every repeatable faucet —
the bank is 34 fires (vs run 03's ~372) and the first bloom drains it 100%,
with zero overflow.** VIII-6 (the weekly six-domain faucet) and VIII-5 are
media-gated; II-6/II-8 and the streak family are daily-gated. The cleanest
bloom economy in the series is also the emptiest. Not a violation (every
condition is locked and honestly unearned) — but the D115(1) note's "fewer
twigs" language should be extended: "a rotating logger has a smaller, cleaner
bank" so the why-panel never reads "missed."

**V-8 [NOTE — no legend] No Grove ever fires → no crown, no transformation —
C4's surfaces stay permanently dark for the rotation.** The first bloom has no
centerpiece; the bank counter shows no Grove bud; the legend card (D097) has
nothing to announce. Not a violation (Grove = rare by design) — but the
why-panel should state "no legend yet" explicitly, and the register's C7
counter should render the Grove row as "—" rather than silence.

---

## 10. Verdict

**The D115 rotating promise is VERIFIED — and the brief's maturity deadlock
is arithmetically false for the archetype as written.** B2's ANY-DOMAIN-MIXED
reading unblocks the rotating logger at day 15 (the loop-closure gate's
instance 1 is closed — the register's "days not twigs, mixed not per-domain"
wording is the load-bearing fix, and it must survive the docs pass, V-5); B4
clears on journal (105) and gym (105) days at year 2; maturity lands Oct 1
Y2, in-season, with the first bloom bursting all 30 eligible buds — zero
overflow, zero queue, the cleanest bloom economy in the paper-run series. The
stage/schedule machinery survives its most extreme consistency stress test
intact.

**What fails is three structural surfaces, now at maximum contrast:**
(1) **the B4 residual deadlock** (V-1 — the ≥90-per-single-domain bar still
locks the pure 7×1 sampler class at POLE forever; the ANY-DOMAIN-MIXED
philosophy was never extended from B2 to B4 — top-2-sum ≥90 fixes it without
regressing the body-only/every-other-day users); (2) **the A3 twig bar's
canopy blindness** (V-2 — 730 logged days, zero twigs; the register's own D115
note normalizes a bare canopy for the most consistent user — a mixed-domain
monthly twig makes the canopy match the log); (3) **the E2 resource boundary**
(V-3 — the balance champion can never grow buttress at resource 0.05, while
his E3 phyllodes signature opens the desert adaptation at the same instant —
a coherent but visually brutal portrait: the broadest tree is a desert tree).
Plus the standing register fixes (V-4 E6 referent, V-5 the B2 drift, 4th and
6th recurrences) and two honest-shape notes (V-6 the 0.80-not-0.99 balance
reading, V-7 the small clean bank, V-8 the absent legend).

**Run verdict: CONDITIONAL PASS — the D115 fix's headline claim holds, the
brief's central flag (B4 maturity deadlock) is corrected to the sampler class
it actually describes, and the three tuning proposals (B4 top-2-sum, A3
mixed-domain twig, E2 resource leg) should be applied in the dev tools and
this archetype re-run before the numbers freeze. The rotating logger's tree
is honest to the register in every organ: mature at 2, ringless, twigless,
desert-leaved — the most consistent life in the app renders as the most
austere tree, and that portrait is exactly what the register as written
promises. The question for the tuning pass is whether that portrait is the
one the register means.**