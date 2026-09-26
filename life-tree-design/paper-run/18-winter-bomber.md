# PAPER RUN 18 — ARCHETYPE: "WINTER-BOMBER" (the D100 backfill attack)

**Status:** design-time simulation, no code. Full hand-walk of ONE synthetic
user's life through the Life Tree timeline against the locked register — the
**D100 anti-farm attack test**: 18 months of genuine logging, then ONE weekend
of bulk backfill (an entire year of paper-log catch-up), then normal life.
The question on the table: is the tree fully immune on every vector (stage,
stage-year bar, rings, twigs, trophies, axes, anchor), does the
leaves-but-no-presence state stay honest and explainable, and does anything
still leak?

**Register verified against:** `life-tree-design/SCHEMA.md` §2.4 (A1–F10,
locked 2026-08-29; D105) + §2.3 (the canonical domain table, D104/D115) +
§2.5 (the trigger-correlation table, D106) — read in full for this run.
**Decision texts verified against:** `TEMP-PLANNING.md` (D089–D115, read in
full — D095/D097/D098/D099/D100/D101/D104/D110/D113/D114/D115 quoted) +
`loophole-findings-wave2/A-clock-integrity.md` (C-1) + `B-economics-scale.md`
(C-02, M-09) + `I-recursive-audit.md` (the axes' volume read).
**Trophy conditions verified against:** `life-tree-design/scan-outputs/
02-achievements.md` (every condition cited verbatim — the ONLY authority for
I-6/I-7/I-8/I-9, II-3/II-4/II-5/II-6/II-9/II-12, III-3/III-7/III-11/III-19,
IV-6/IV-7, IX-1/IX-4/IX-5).
**Sibling runs read:** 17-streak-machine (the register verification format,
the F4→E3 misread V1, the A3 gym-twigs V2, the E6 referent V3, the B2 15-vs-20
drift V4, the economy V6, the C4 crown V7), 12-restore-rewind (the F5-window
finding V-5, the axes' windowed reads), 04-decade-consistent (the bloom queue).
**Prior art carried (not re-litigated):** 01-V2/03-V2/06-V7/12 (A3 gym twigs —
Mon/Wed/Fri never reaches 15 days/month) · 01-V4/17-V1 (F4's ceiling makes
dense users read arid → E3 misread) · 03-V-4/17-V3 (E6's referent trophy does
not exist) · 01-V12/06-V9/08-V2 (B2 register drift: SCHEMA 15 vs D115 20) ·
12-V5 (F5's time window undefined) · 17-V6 (same-achievement aggregation) ·
17-V7 (C4 first-vs-rarest).

---

## 0. The synthetic user

A 2-year user. Pattern (months 1–18): **journal 4×/week (~17 days/month,
every entry ≥40 words, real reflections)** · **2 habits completed daily
(07:00 — the paper pair)** · **gym 3×/week (Mon/Wed/Fri, 4 real sets)** ·
**meals logged daily (breakfast/lunch/dinner)** · body/media/goals: none.
Every event **written same-day (in-window)** — a genuine, honest life. Birth
anchor = **Tue Sep 1, 2026** (the first in-window event: the 07:00
journal + habit + meal batch; frozen per D100(5)/D102).

At **month 18** the user digs out a paper log they kept in parallel and
**backfills the entire previous 12 months in one weekend** — the paper-log
catch-up attack:

| Backfill batch | Count | occurredAt spread | Qualifying? |
|---|---|---|---|
| journal entries | **350** | Mar '27–Feb '28 | yes — every entry ≥40 words |
| workouts | **200** | Mar '27–Feb '28 | yes — ≥1 real set each |
| meals | **600** | Mar '27–Feb '28 | yes — real food logs |
| habit days | **300** | Mar '27–Feb '28 | yes — the paper pair's completions |
| **TOTAL** | **1,450** | **365 distinct dayKeys** | all non-imported, all written days 544–545 |

The paper log is deliberately **denser** than the in-app cadence (350 journal
≈ 7/wk vs the real 4/wk; 200 workouts ≈ 4/wk vs the real 3/wk) — that is the
attack's inflation: a farmer overfills to maximize the reward surface. The
in-app real-time log for the same months already exists — the backfill is a
second, parallel record of the same life, typed late.

Day arithmetic (1-indexed, runs 08/17 convention; leap drift handled):
day 1 = Sep 1 '26 (Tue) · day 30 = Sep 30 '26 (Month 1 close) · day 181 =
Mar 1 '27 · day 366 = **Sep 1 '27 (Year 1 — stage-year #1 completes)** ·
day 500 = Jan 14 '28 (II-4 fires) · day 540 = Feb 22 '28 (Month 18 close) ·
**days 544–545 = Sat Feb 26 / Sun Feb 27 '28 (THE ATTACK WEEKEND)** ·
day 720 = Aug 14 '28 (Month 24) · day 731 = **Aug 31 '28 (Year 2 — stage-year
#2 completes, MATURE, the first bloom)** · day 911 = Mar 1 '29 (the annual
bloom — the verification horizon).

Fixed derived reality (constant across the life — honest numbers):

| Axis | Value | Derivation |
|---|---|---|
| F4 RESOURCE | **0.30** | avg in-window events/active day = 6.0 (2 habits + 3 meals + 0.57 journal + 0.43 gym) ÷ ceiling 20 (F4). *The register's own calibration note ("reads high — calibrated at the paper-run step") is prior-art V1 — a daily logger reads arid* |
| F5 RHYTHM | **1.00** | weekly active-day counts 7/7 every week (habits + meals daily) → stddev 0 → 1 − CV = 1.0. Perfect — the benign-axis point (see W2) |
| F6 BALANCE | **0.68** | Shannon evenness over the canonical 7 (F6/D104): presence-day vector {309, 540, 231, 540, 0, 0, 0} → H = 1.326 / ln 7 = 0.68. Mid-high: two daily domains + two strong weekly domains |
| F7 TENURE | 0.1 → **0.2** | stage-years/10, clamped (F7) |
| Active days | 365/yr | A4's 200 doubled every year — the stage clock is A4-proof |
| Twigs | journal 18 · habits 18 · nutrition 18 · **gym 0** | A3 ≥15 in-window days/30d: journal 16–18 ✓ · habits 30 ✓ · nutrition 30 ✓ · gym Mon/Wed/Fri = 12–14, structurally never 15 (prior art V2) |

---

## 1. Assumptions pinned (flagged, not register facts)

- **A1 — The first bloom fires AT maturity** (D092(2)); maturity lands day
  731 = Aug 31 '28 (in-season, growing-season end). Post-maturity on-earn
  applies in the growing season only (D092(3)+D095).
- **A2 — Modifications manifest at the NEXT annual bloom after their gates
  hold** (D093; run 01/07/08/17 reading) — the winter-bomber's adaptation
  horizon is Mar 1 '29.
- **A3 — PR cadence (pinned, program-dependent):** ~1 PR per 10 gym days →
  ~54 lifetime PRs by day 540; the backfill adds 200 workouts with **15 PRs**
  (maintenance-heavy — a farmer's log is mostly filler) → 69 by the write.
  III-7 (100 PRs, Grove) does NOT fire — pinned below the threshold so the
  residual vector is demonstrated at Branch tier, not invented at Grove.
- **A4 — The backfilled habit days belong to a SECOND paper-tracked habit**
  (habit B), so they are real content (not duplicates) — but their dayKeys
  are outside the guard, so they arm no presence and no Perfect-Month.
- **A5 — 365-day windows are leap-immune and dayKey-driven** (run 08-A8);
  the Sep 1 '26 anchor drifts +1 day at the 2028 boundary (Feb 29 '28 in
  span) — day 731 = Aug 31 '28.
- **A6 — II-4 The Long Haul re-fires per distinct 500-day run** (scan
  §II-4, "PER-WINDOW re-fire"); III-22 fires at 26-week marks from the first
  full pattern week (d97, d279, d461 — 3 fires by day 540).
- **A7 — No nutrition PHASES** (the user logs meals, no named
  phase/bulking/cutting) → the phase-gated trophies (IV-3 On Target, IV-4
  Dialed In, IV-5 No Deviation, IV-8/9) never fire — per their own
  G14/G15 guardrails, not a farmable gap.
- **A8 — Every journal entry, real AND backfilled, is ≥40 words** (A2
  qualifying floor passed by all content in this walk).

---

## 2. The D100 mechanics restated — what the guard actually does

The two-tier split (TEMP-PLANNING D100, locked; SCHEMA A1/A2; D113(1)):

1. **PRESENCE ORGANS** (twigs, qualifying days, stage-years, ring-years, the
   RHYTHM/BALANCE/TENURE axes, dormancy, bud momentum, streak trophies,
   yearly bars): a dayKey counts as presence **only if ≥1 event for it was
   written within ±3 days of that day (the A1 grace)** AND it is not
   imported AND not isBackfill (D113(1)).
2. **CONTENT ORGANS** (leaves, fruits, the anchor): read occurredAt TRUTH —
   a real entry from last March IS from last March; its leaf belongs there.
3. **F10 future-dating clamp:** occurredAt in the future is excluded from
   all math — which makes the A1 "±3" effectively **one-sided**
   (writtenAt ∈ [dayKey, dayKey+3]); an event can never arm a dayKey after
   its own write date.

The winter-bomber's arithmetic (the core of the test):

- The 1,450 events have dayKeys **K ∈ [~180 .. 545]**, written on **W ∈
  {544, 545}**.
- A dayKey K is in-guard iff |K − W| ≤ 3 → K ∈ {541..547} for W=544,
  {542..548} for W=545; the F10 future clamp cuts K > W, leaving **the
  exploitable surface = {541, 542, 543, 544, 545} — five dayKeys.**
- All five were **already present in real time** (habits + meals logged
  daily, in-window) → **marginal presence gained by the attack = 0.**
- The remaining ~360 backfilled dayKeys are **outside the guard by
  construction** — no event dated Mar '27–Feb 25 '28 was written within ±3
  days of its dayKey.

Second belt (D113(1)): a stored `isBackfill` flag rides the event row. IF
the app's bulk-backfill flow sets it, even the five in-guard dayKeys are
excluded — but the flag's arming rule is **unspecified** (W3), so the ±3
guard is the load-bearing defense and the flag is belt-and-suspenders.

---

## 3. CHECKPOINT 1 — Month 18, day 540 (Feb 22 '28) — the pre-attack state

| State | Value | Evidence |
|---|---|---|
| **Stage** | **POLE** | B1 day 1 (first in-window event) · B2 day 15 (15/15 in-window days, any-domain-mixed — 20 under D115's record, same month, V4) · B3 day 366 (stage-year #1: 365 active days ≥ A4's 200). POLE unlocks leaf granularity (C6) |
| **Stage-years** | **1** (second at 175/365) | currentWindowDays = 175 at day 540 (days 366–540 all active). The second stage-year completes at day 731 |
| **Twigs** | **54** (journal 18 · habits 18 · nutrition 18 · gym 0) | A3 per 30-day month — gym 12–14/month, never 15 (V2) |
| **Rings** | **0** | A5 per-domain bars (canonical 7): journal ~309 ✓ · habits 540 ✓ · gym ~231 ✓ · nutrition 540 ✓ · **body 0 ✗ · media 0 ✗ · goals 0 ✗** → no ring-year ever (D101 r2 / D104 / D114-F12) — the decoupling: the user matures, never brands |
| **Axes** | F4 0.30 · F5 1.00 · F6 0.68 · F7 0.1 | §0 |
| **Bank** | **~161 buds** (4 S · 64 R · 69 B · 14 H · 7 Ring · 3 Grove) | §3.1 ledger; range 140–190 (repeat-trophy cadence pins) |
| **Crown** | III-11 A PR Every Season (first-earned Grove, d360) | C4 first-earned reading (run 04/17) |

### 3.1 The pre-attack bank ledger (estimate-banded; conditions verbatim from
the scan — the runs' convention)

| Tier | Trophies | Count |
|---|---|---|
| Sprout | I-1 (d1) · II-1 (d1) · III-1 (d1–3) · IV-1 (d1) | 4 |
| Root | II-2 ×2 (d7) · I-6 (d50 — 50th qualifying non-imported entry) · III-2 (d9) · III-3 ×54 (PR repeat) · III-4 (d100) · III-19 R44/45/46 (100k/500k/1M kg, d40/d196/d390) · IV-2 (d7) · IX-1-R (d10) · IX-4-R (d10) | 64 |
| Branch | II-6 ×36 (Perfect Month ×2 habits × 18 months — not grace-able, honestly fired) · I-12-B (d366) · III-5 (d250) · III-8 ×4 · III-9 ×18 (PR Season) · III-21 ×6 · IV-6 (d180) · IX-1-B (d50) · IX-4-B (d100) | 69 |
| Heartwood | II-3 ×2 (d100) · II-9 ×2 (d90) · II-13 (d100) · III-6 (d500) · III-10 ×3 · III-22 ×3 (d97/279/461) · IX-1-H (d100) · IX-4-H (d500) | 14 |
| Ring | II-5 ×2 (d366) · II-12 ×2 (d366) · III-26 (d367) · IX-1-Ring (d366) · VIII-1 (d366) | 7 |
| Grove | **II-4 ×2 (d500)** · **III-11 (d360)** | 3 |

**Why-panel at month 18:** "POLE · age 18 months · 1 stage-year, the second
half-grown · 54 twigs across three branches · 0 rings · 161 buds banked
(3 Grove · 7 Ring · 14 Heartwood · +137 more) · your gym branch wears no
twigs — 3×/week gives 12–14 days a month, the twig bar wants 15."

---

## 4. THE ATTACK WEEKEND — days 544–545 (Sat Feb 26 – Sun Feb 27 '28)

1,450 events land in two days, occurredAt spread across 365 dayKeys
(Mar '27–Feb '28). Apply D100 exactly. **Every presence vector, swept:**

### 4.1 The vector sweep

| # | Vector | D100 application | Outcome |
|---|---|---|---|
| V1 | **The stage clock (B-group)** | B3/B4 read in-window stage-year days (A4). The backfill adds **zero in-window days** (all 365 dayKeys outside the ±3 guard; the 5 in-guard keys already present → marginal 0) | **NO TICK.** The clock stays where honest life put it: POLE, 1 stage-year, currentWindowDays 175 |
| V2 | **The stage-year bar (A4)** | currentWindowDays is a presence-day count in the anchored window (days 366–731). The backfill's dayKeys in Sep '27–Feb '28 (days 366–540) add 0 days; window #1 (closed at day 366) is immutable and cannot be retroactively inflated either | **NO ADVANCE.** 175 → 175. The second stage-year still completes only when the honest 365th day lands (day 731) |
| V3 | **Rings (A5/D101)** | A ring-year needs ≥40 in-window days in ALL 7 canonical domains. Backfilled meals/entries/habits add 0 in-window days; body/media/goals stay 0 | **NO RING CAN BE MANUFACTURED.** Even a ring-shaped attack (all 7 domains backfilled) fails — no domain crosses 40 in-window days |
| V4 | **Twigs (A3)** | A twig fires on ≥15 in-window days in a 30-day month (D107 stores twigs[{monthKey, daysPresent}] — daysPresent is a presence count). The backfilled months' in-window counts don't move | **NO TWIG FIRES.** journal/habits/nutrition stay 18 each; gym stays 0 (V2 prior art, attack-independent) |
| V5 | **The trophy bank (presence family)** | II-3/II-4/II-9/II-12 (streaks — retroactive never extends), II-6 Perfect Month (NOT grace-able — a backfilled day "leaves that day empty"), II-5/I-5/III-26/VIII-5 yearly bars (in-window days per D100(3)'s shared predicate), I-11 return (gap analysis) | **ZERO new fires in the presence/streak/yearly-bar family.** The D100 shared predicate reaches the gamification exactly as designed (D100(3): one fix, two systems) |
| V6 | **The trophy bank (VOLUME family)** | I-6/7/8/9 (qualifying non-imported entry counts), III-3/III-7 (PR counts), tonnage rungs, IV-6/7 (qualifying food-log days) read **occurredAt truth** (the two-tier split's volume side) | **THE RESIDUAL EXPLOIT — W1.** The backfill's content IS qualifying and non-imported → **I-7 Five Hundred Pages (Branch) FIRES at the write** (662 ≥ 500); III-3 ×15 more Root fires; I-8/I-9/IV-7 advance (662/1000, ~89.9k/100k words, 905/1000 food days). A larger PR-rich backfill reaches **III-7 Century of PRs (Grove)**. The bank is NOT fully unchanged |
| V7 | **The anchor (D100(5)/D102)** | Frozen at the first IN-WINDOW event (day 1). The backfill is out-of-window by construction — it cannot birth or shift the anchor | **IMMUNE.** The "pure backfill cannot birth the tree" edge holds (a backfill-first account has no anchor until its first in-window event) |
| V8 | **F4 RESOURCE** | "avg in-window events per active day" (F4 + D110(5)'s in-window, non-imported filter). Only the ≤5 in-guard dayKeys' backfilled events could count — ≈ +6 events on 5 already-active days → 6.00 → 6.02, i.e. 0.300 → 0.301. Under the isBackfill flag: zero | **IMMUNE** (≤ +0.01, or 0 under the flag) |
| V9 | **F5 RHYTHM** | 1 − CV of **weekly active-day counts**. If "active day" ≡ presence day (the D100 predicate), the backfill's 365 dayKeys are not active → weekly counts unchanged → RHYTHM stays 1.00 | **IMMUNE under the register-literal reading.** *Caveat: "active day" is undefined in F5's register row — a bursty backfiller WOULD exploit a loose "any non-imported event" reading (W2). This archetype's perfect real rhythm makes the axis benign either way* |
| V10 | **F6 BALANCE** | Shannon evenness across the 7 **presence-domains** (F6/D104) — presence-day vectors. Backfill adds 0 presence days → {309,540,231,540,0,0,0} unchanged | **IMMUNE** (0.68 → 0.68). *Caveat: must read presence DAYS, never event counts — a count-reading implementation would inflate nutrition's share with the 600 meals (folded into W2)* |
| V11 | **F7 TENURE** | stage-years/10 — stage-years unchanged | **IMMUNE** |
| V12 | **Dormancy / bud momentum / revivals** | all read in-window days; the user is continuously present; the backfill can't un-dormancy or fake a revival (E9) | **IMMUNE** |
| V13 | **The restore/import loop (D098/D109/D113)** | A restore re-derives from the log; the backfilled rows keep their flags/dayKeys → same result. The isBackfill flag rides the backup format (formatVersion 3); imports excluded everywhere (D100(4)) | **IMMUNE.** The attack is manual backfill, not import — the guard is what stops it, and the guard survives restore |

### 4.2 What the tree DOES show at the write (the content truth)

- **350 journal leaves** render at their occurredAt (Mar '27–Feb '28) —
  the canopy's leaf density for the past year roughly doubles (17 → ~46
  leaves/month in the clustered view).
- **600 meals** feed the vascular/sap render (nutrition = the trunk's
  throughput, D088) — the past year's vascular density rises; **200
  workouts** thicken the gym branch's wood character; **300 habit
  completions** render as the paper habit's bud history. All aggregate
  surfaces (vascular gradients, branch character, bud states) — **no
  per-event sprite explosion** (§7).
- **Winter '27 backfilled entries** (Dec '27–Feb '28 dayKeys) render as
  **leaf-buds** on the bare winter branches (D095) and convert at the
  spring flush (Mar '28) — a visibly denser spring canopy, honestly sourced.
- The **trunk** (stage, rings, twigs) is byte-for-byte the pre-attack
  state: POLE · 1 stage-year · 175/200 · 54 twigs · 0 rings.

---

## 5. CHECKPOINT 2 — Months 19–24 (Mar–Aug '28) — the post-attack life

The user continues normally (journal 4/wk, habits daily, gym 3/wk, meals
daily, all in-window). The attack's residue is **invisible to the tree's
growth machinery** and **visible only as content**.

| State | Value |
|---|---|
| **Stage** | POLE → **MATURE at day 731** (Aug 31 '28 — B4: 2 stage-years AND journal ≥90 in-window days in its best anchored year ✓ 309). The first bloom fires there (§6) |
| **Stage-years** | 1 → 2 (day 731). The backfill neither delayed nor accelerated a single day |
| **Twigs** | 54 → **72** (+6 each × journal/habits/nutrition; gym 0 forever — V2) |
| **Rings** | **0** — the backfilled year cannot brand one; body/media/goals still empty |
| **Axes** | F4 0.30 · F5 1.00 · F6 0.68 · **F7 0.2** (2 stage-years at day 731) |
| **Bank** | ~161 → **~180 honest + W1's manufactured increment** (I-7 Branch + III-3 ×15) |
| **Crown** | III-11 (d360, first-earned Grove) — unchanged, un-shifted |

**The honesty check (the task's core question):** the tree shows a year of
dense leaves (662 journal entries) with a thin trunk (1→2 stage-years, 0
rings). Is that coherent? **Yes — and it is exactly the two-tier split made
visible.** Leaves are content (occurredAt truth): the paper log records real
days, so the leaves belong where they are. Twigs/rings/stage are presence
(written-in-window): the farmer typed a year's paper in one weekend, so
none of it grew. The canopy says "you lived this"; the trunk says "you were
here, logging, when it happened." Both are true; neither lies. The only
incoherence risk is the **visual** one — a dense canopy next to a thin
trunk can read as broken — which the why-panel copy (§6) must pre-empt.

**RHYTHM axis, verified again at the close:** weeks remain 7/7 (real life
continues); the backfill's 365 dayKeys are not "active" (no presence), so
the weekly active-day series is untouched by the 1,450-event write. **The
axis is immune — confirmed across the full post-attack span.**

---

## 6. The why-panel copy — the leaves-but-no-presence state (drafted)

Per D110(2) the panel shows ONLY derived facts (counts, dates, presence)
and register values — no free text, no LLM narrative. Per D099(6)/D114 the
copy never shames (a quiet month says "resting," never "abandoned"). The
un-earned leaves get an **honesty line**, factual and specific:

> **Why-panel, month 24:**
> "POLE · age 2 · 1 stage-year (365/365 days active — the second completes
> at your anniversary) · 72 twigs · 0 rings.
>
> **Your canopy:** 662 journal entries. 350 were written from your paper
> log on Feb 26–27 — they record real days, and they show where they
> happened. Writing close to the day is what grows the tree: those entries
> are part of your history, but they didn't grow new twigs or rings — the
> months they fill already grew their twigs from your real-time logging.
>
> **Your branches:** journal · habits · nutrition — one twig per month of
> 15+ logged days. Your gym branch is the standing exception: 3×/week
> gives 12–14 days a month, under the 15-day bar.
>
> **Your trunk:** rings grow from a full year with all 7 life areas
> present, logged in the moment. Your 4 present areas clear their
> per-domain bars (A5); body, media, and goals are empty — no ring yet,
> honestly.
>
> **The bank:** 3 Grove · 7 Ring · 14 Heartwood · +N more."

The **non-shaming honesty line** (the same state, zoomed into a leaf
cluster over the backfilled year):

> "This month holds 46 entries — 29 written later from your paper log.
> They're yours: real days, real words. The twig beside them grew from the
> 17 days you logged in the moment that month. Both are true."

Drafting checks: every sentence is a derived fact or a register value;
"written later from your paper log" is a fact derivable from the log
(writtenAt vs occurredAt); no judgment appears; the positive reading is
offered first ("they're yours"); the spring-flush density (D095) carries the
same line ("this spring's flush is dense — your winter entries, including
the ones written later, banked as leaf-buds").

---

## 7. CHECKPOINT 3 — the horizon, day 731 (Aug 31 '28): MATURE + the first bloom

- **B4 completes honestly** (2 stage-years, journal's best anchored year
  309 ≥ 90). The first bloom (D092(2)) bursts S/R/B/H — **including the
  W1-manufactured I-7 (Branch) and the III-3 ×15**, which bloom beside the
  earned buds unless W1's fix lands first. Ring 7 + Grove 3 stay banked
  (D092(4)/(5)).
- **C1/C2 caps:** the bloom runs in waves of ≤15, ≤4 waves/season (60/season);
  overflow banks to the next spring. The backfill's ≤16 manufactured buds
  are absorbed by the cap system — the *moment* is diluted only by the
  standing V6 economy finding (the bank grows forever), not by the attack.
- **Adaptation gates** begin to read at D1 (2 stage-years): E1 caudex
  (tenure 0.2 < 0.7 → closed) · E3 phyllodes (resource 0.30 ≤ 0.4 + D1 ✓ +
  SEEDLING ✓ → **the signature HOLDS — carried V1: a daily 6-event logger
  reads arid** — would manifest Mar 1 '29) · E7 spines at d100 (already
  fired, subtle texture) · E9 revival n/a (no dormancy) · the rest closed.
- **Mar 1 '29 (day 911) annual bloom:** crown transformation (III-11, C4) +
  the V1 phyllodes + the Ring/Grove blooms + the winter bank → spring
  flush, which includes the denser canopy the backfill created.

---

## 8. The verification matrix — every vector, every verdict

| Vector | Register | Verdict | Note |
|---|---|---|---|
| Stage clock (B1–B5) | in-window days | **DEFEATED** | POLE holds; MATURE arrives day 731, the honest day |
| Stage-year bar (A4) | ≥200 in-window days/window | **DEFEATED** | 175 → 175 at the write; window #1 immutable |
| Rings (A5/D101) | ≥40 in-window days × 7 domains | **DEFEATED** | no domain crosses 40; body/media/goals stay 0 |
| Twigs (A3) | ≥15 in-window days/month | **DEFEATED** | daysPresent counts don't move |
| Trophies — presence/streak/yearly (II-3/4/5/6/9/12, I-5/11, III-26, VIII-5) | D100 shared predicate | **DEFEATED** | "retroactive never extends"; II-6 not grace-able |
| Trophies — VOLUME counts (I-6/7/8/9, III-3/7, tonnage, IV-6/7) | "qualifying, non-imported" (occurredAt truth) | **EXPLOITABLE — W1** | I-7 fires; III-3 ×15; a PR-rich backfill reaches Grove (III-7) |
| Anchor (D100(5)/D102) | first in-window event | **DEFEATED** | frozen at day 1; backfill can't birth/shift |
| F4 RESOURCE | in-window events/active day | **DEFEATED** | ≤ +0.01 (5 in-guard days) or 0 under the flag |
| F5 RHYTHM | 1 − CV(weekly active-day counts) | **DEFEATED** (spec-gap W2) | immune here (perfect real rhythm); "active day" undefined — bursty backfillers need the lock |
| F6 BALANCE | presence-domain evenness | **DEFEATED** (spec-gap W2) | presence-day vectors unchanged; must not read counts |
| F7 TENURE | stage-years/10 | **DEFEATED** | 0.1 → 0.2 on the honest schedule |
| Dormancy/revival (E9) | in-window days | **DEFEATED** | nothing to un-dormancy |
| Restore/import loop | flags ride the format | **DEFEATED** | guard survives restore; imports excluded |
| Render/economy — 1,450 events, 350 leaves at once | D107 clusters + C6 | **ABSORBED** | §7: journal leaves → cluster aggregates; meals/workouts/habits → aggregate vascular/branch/bud surfaces; ~1 cluster row/month, not 350 sprites |
| Bank counter (C7) / bloom waves (C1/C2) | top-3 + count · 15×4 | **HOLDS** | the W1 increment is ≤16 buds — absorbed by the caps, still visible in the bank |

---

## 9. Violations + tuning proposals

**W1 — [CRITICAL — THE ONE VECTOR THE BACKFILL CAN STILL EXPLOIT] The
isBackfill exclusion is scoped to presence, but the trophy bank's VOLUME
family reads occurredAt truth — and the backfill's content is qualifying.
I-7 Five Hundred Pages (Branch) FIRES at the write (662 ≥ 500); III-3
re-fires ×15; I-8 (662/1000), I-9 (~89.9k/100k words), IV-7 (905/1000 food
days) advance; a PR-rich backfill reaches III-7 Century of PRs (**Grove**).**
Root cause, verified: D113(1) says the flag excludes "rings, stage ticks,
or presence"; B C-02's fix excludes the tree's "stage clock, ring years,
or axes"; the trophy conditions (scan) say "qualifying, **non-imported**"
— no non-backfilled clause. The two-tier split's "volume reads occurredAt"
was never reconciled with the flag. The task's premise that "the bank is
unchanged" holds ONLY if the engine adopts the strongest exclusion.
**Tuning (three levers, any one closes it):**
(a) **The third clause** — extend the D100 predicate to every volume/count
trophy's read surface: "qualifying entry for any count = non-imported AND
non-backfilled (isBackfill=false)" — the natural extension of B C-02's
"extend the import exclusion to historical-backfill-mode and adopted rows
at the predicate level." Honest same-week catch-up stays (in-grace events
are not flagged).
(b) **Distinct-day counting** — count trophies count DISTINCT in-window
qualifying days (the G4 precedent already used by IX-1/IX-4) instead of raw
entries — I-6/7 become "500th in-window entry," structurally backfill-proof.
(c) **Close the gap/return side** — I-11 You Came Back and II-11 Rebuilt
read dayKey gaps; make them read **in-window** qualifying days so a backfill
cannot manufacture a false comeback.
Re-run after: the winter-bomber's bank must be byte-identical post-attack.

**W2 — [MAJOR — SPEC GAP] F5's "active day" (and F6's unit) are undefined in
the register.** The axis immunity is real for THIS archetype only because
its real rhythm is perfect (7/7 weeks). A bursty backfiller — real weekly
counts of 3–4, then 365 backfilled dayKeys — WOULD exploit a loose reading:
if "active day" means "any day with ≥1 non-imported event," the stddev of
weekly active counts collapses and RHYTHM inflates toward 1.0 (a false
steadiness), and F6 shifts if it reads event counts (600 meals balloon
nutrition's share). **Tuning:** lock "active day ≡ presence day (the D100
predicate: ≥1 in-window, non-imported, non-backfilled qualifying event)"
into F4/F5/F6's register rows; pin F6 to presence-DAY vectors (not counts);
and pin F5's time window (carried 12-V5).

**W3 — [MAJOR — the flag's arming rule is unspecified] D113(1) mandates the
isBackfill flag but never defines what sets it.** NU4's "historical backfill
mode = older than 24h" bound over-fires if reused at the tree level (an
honest Friday workout logged Sunday, D100's own worked example, is 48h old →
flagged → its presence is lost). If instead only a dedicated bulk flow sets
it, a normal date-picker backfill (THIS archetype's attack) is unflagged and
leans entirely on the ±3 guard — which is sufficient for presence but leaves
W1 open. **Tuning:** lock the arming rule — isBackfill = written via a
dedicated bulk/import-style flow OR occurredAt < writtenAt − 3d (align the
flag threshold to the A1 grace, not NU4's 24h). The ±3 guard stays the
presence arbiter; the flag is the second belt and the volume-trophy
exclusion source (W1a).

**W4 — [RECORD — carried prior art, attack-independent]** A3 gym twigs 0
(V2) · B2 15-vs-20 drift (V4) · F4 ceiling → the dense logger reads arid,
E3 phyllodes would manifest Mar 1 '29 (V1) · E6's 365-day referent doesn't
exist (V3) · F5 window (12-V5) · same-achievement aggregation (V6) · C4
first-vs-rarest (V7). Each has a standing tuning proposal in its home run;
the winter-bomber re-confirms V1 and V2 with a 4-domain daily logger.

**W5 — [MINOR — honesty UX] The leaves-but-no-presence state is coherent,
but it must be pre-empted at three surfaces:** (1) the why-panel honesty
line (§6) — derived-fact copy, never shame; (2) the D095 spring flush — a
denser canopy sourced from the backfilled winter must not read as "earned"
(the leaf-bud bank converts content, not presence — the copy says so);
(3) the first bloom — W1's manufactured I-7 will bloom beside honest buds
unless W1 lands; if W1 is deferred, the bloom's why-panel should mark
"logged later" on that flower. **Tuning:** ship the §6 copy as the
localizable string template (D110(4)) and gate the first-bloom on W1.

---

## 10. Verdict

**The D100 attack is DEFEATED on every presence vector.** The ±3
written-in-window guard is arithmetically airtight against a 1,450-event,
365-dayKey bulk backfill: the exploitable surface is exactly the five
dayKeys within the guard of the write weekend, and every one of those was
already present in this user's real life (marginal gain = 0). The stage
clock does not tick (POLE → MATURE on the honest day 731, never a day
early); the stage-year bar does not advance (175 → 175); no ring can be
manufactured (no canonical-7 domain crosses 40 in-window days); no twig
fires; the anchor is frozen; dormancy/revival and the restore/import loop
are immune; F4/F5/F6/F7 read in-window presence and are unchanged. The
**content** is honestly real — 350 leaves appear where the days happened,
the vascular and branch renders thicken, the winter bank flushes denser in
spring — and the why-panel copy carries the distinction without shaming.

**The ONE surviving vector is the trophy bank's VOLUME family (W1):** the
isBackfill flag is scoped to "rings, stage ticks, or presence" and the
trophy conditions say "qualifying, non-imported" — so the backfill's real,
qualifying content fires I-7 (Branch), re-fires III-3, and advances I-8/
I-9/IV-7; a PR-rich variant reaches a **Grove** (III-7). The task's premise
("the bank is unchanged") is **true only under the strengthened exclusion**
— the predicate must gain its third clause, or count trophies must read
distinct in-window days. The two companion gaps are W2 (F5/F6's "active
day" must be locked to the presence predicate — this archetype is a benign
case; a bursty backfiller would not be) and W3 (the isBackfill arming rule
must be defined and aligned to the ±3 grace, not NU4's 24h).

**Honesty: PASS.** The leaves-but-no-presence tree is coherent (canopy =
what happened; trunk = when it was logged), explainable (derived-fact
copy), and — once W1 closes — byte-honest. **Coherence: PASS.** The
canopy/trunk divergence is the two-tier split made visible, not a zombie
state. **Economy: PASS with W1.** The 1,450-event write is absorbed by the
cluster aggregation (a bounded set of cluster rows + aggregate vascular/
branch/bud surfaces — no per-sprite explosion); the ≤16 manufactured buds
fit inside the existing C1/C2 wave caps; the standing V6 bank-growth finding
dilutes the first bloom, not the attack.

**The winter-bomber's tree in one sentence:** a POLE→mature, perfectly
rhythmic, mid-high-balanced tree with three twiggy branches, a bare gym
stub, no rings, a dense (partly late-written) canopy, 180 honest buds plus
I-7's bloom — the D100 split working exactly as locked, with one
register-level gap (W1) to close before the engine contract.

**Fix before the engine contract (the dev-tools tuning surface, D105):** W1
(the predicate's third clause + distinct-day counting + in-window gap
reads) · W2 (lock "active day ≡ presence day"; pin F5's window) · W3 (the
isBackfill arming rule) · carry W4's standing fixes (V1/V2/V3/V4/V5/V6/V7)
· ship W5's copy template. **Re-run this archetype after W1–W3.**