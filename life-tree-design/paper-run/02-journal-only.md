# PAPER RUN 02 — ARCHETYPE: "JOURNAL-ONLY" (6-year, single-domain)

**Status:** design-time simulation, no code. Full hand-walk of ONE synthetic
user's life through the Life Tree timeline against the locked register.
**Register verified against:** `life-tree-design/SCHEMA.md` §2.4 (A1–F8, locked
2026-08-29; D105) — read in full for this run. **Decision texts verified
against:** `TEMP-PLANNING.md` (D089–D115, read in full). **Trophy conditions
verified against:** `TEMP-PLANNING-Achievement-Spec.md` §I (lines 130–235) and
§VIII (lines 828–890) + `ACHIEVEMENT-SCAN.md` (family/tier ladders).
**Run note:** supersedes the earlier draft of this file; §9 lists the
corrections (first-bloom count, I-15 day, the Ring/Grove same-day boundary
rule, branch rings).

---

## 0. The synthetic user

A 6-year user. Pattern: **a qualifying journal entry EVERY day (~250 words),
written same-day (in-window), NO other domain ever** — no habits, gym,
nutrition, body, media, goals. Birth anchor = **Mar 1 yr0** (the first
in-window event, frozen per D090 B / D100(5) / D102).

Fixed derived reality (constant across the whole life):

| Axis | Value | Derivation |
|---|---|---|
| F4 RESOURCE | **0.05** | 1 in-window event/active day ÷ ceiling 20 (F4) |
| F5 RHYTHM | **1.00** | every week = 7 active days → stddev 0 → 1 − CV, clamped (F5) |
| F6 BALANCE | **0.00** | Shannon evenness over the canonical 7 presence-domains (F6/D104) → 1 domain holds everything |
| F7 TENURE | 0.1→0.6 | stage-years/10, clamped (F7) — 0.6 at the year-6 checkpoint |
| Active days/yr | 365 | A4 (≥200 in-window days) passed every year → 1 stage-year/yr |
| Twigs | 12/yr | A3 (≥15 in-window days per 30-day month): every month 30/30 → exactly at the C5 cap, never over |

## 1. Assumptions pinned (flagged, not register facts)

- **A1 — The annual bloom date = Mar 1** (the first day of the growing
  season, F1/F2). The register pins the season window (Mar 1–Nov 30) but not
  the bloom's exact date; D092(4)/(5) and D093 say "the next annual bloom."
  For this user (logs every day), every reading gives the same date — the
  engine contract must pin it (see V6).
- **A2 — Same-day participation at the boundary:** a Ring/Grove bud whose
  window closes ON a bloom day (Mar 1) participates in that bloom; the window
  closes at day-end and the bloom opens the same day. This is the rule I
  derive from D092(4) ("calendar-guaranteed… never stuck") + D099 ("no flower
  lost") — the alternative (strict next-bloom) defers by one year; the engine
  must pick one (V6).
- **A3 — 365-day years:** all day-numbers assume no leap day in the 6-year
  span. Trophy schedules are dayKey/window-driven and leap-immune; only
  calendar-mapped dates (I-15's Dec 31, I-9-H's August date) shift by ±1 day
  under a leap year. I-12's matcher already handles Feb 29 (spec §I: "Feb 29
  recognized as Feb 28"), I-15's floor is G12-pinned (146 days).
- **A4 — I-4 Same Time, Every Time fires:** 60 consecutive days each within
  ±30 min of the run's first entry time-of-day (E8/G1). The archetype pins
  volume and cadence, not the hour — I take the natural reading (a fixed
  evening ritual) and flag the alternate (V9).
- **A5 — I-13's tier mapping:** Root@1, Branch@10, Heartwood@50, Heartwood@200
  (4 fires, 3 tiers — the spec's "first occurrence then 10/50/200" is
  ambiguous; see V8).

## 2. Stage timeline (locked register B1–B5, D115 days-based gates)

| Gate | When | Evidence |
|---|---|---|
| B1 SEED→SEEDLING | Day 1 (Mar 1 yr0) | first in-window event (register B1 / D090 A) |
| B2 SEEDLING→SAPLING | Day 15 (Mar 15 yr0) | register B2: ≥15 in-window days in any 30-day window, any-domain-mixed (the A3 month bar itself). *Note: D115(1)'s record says ≥20 — see V1.* Both readings land in March yr0 |
| B3 SAPLING→POLE | Mar 1 yr1 | 1st stage-year closes (365/365 in-window ≥ A4's 200) |
| B4 POLE→MATURE | **Mar 1 yr2** | ≥2 stage-years AND journal ≥90 in-window days in its best anchored year (365) — **maturity lands Year 2** (pioneer-speed, SCHEMA B4 note; D090 A). D115(2) days-based gate; D114(2)'s older 6-twig phrasing is superseded by D115 |
| B5 MATURE→OLD-GROWTH | Mar 1 yr10 | ≥10 stage-years — not reached in 6 years |

Maturity is NOT gated by the six/canonical-7 brand (D090 C, D101 rule 1) — a
single-domain user matures on schedule. ✓

## 3. Checkpoint-by-checkpoint walk

### Day 1 — Mar 1 yr0 (SEED → SEEDLING on the first event)
- **Stage:** SEEDLING (B1 ticks same instant as birth). **Stage-years:** 0.
- **Axes:** F4 0.05 · F5 ~1.0 (one week of data) · F6 0.00 · F7 0.0.
- **Organs:** 5 branch-buds on the stem (journal, habits, gym, nutrition,
  goals — body/media ride forks, D104); the first entry banks as a **leaf-bud**
  on the stem (D115(3) M-2 / D114's G-1: ALL classes bank at SEED).
- **Bank (achievement buds):** I-1 Ink on the Page (Sprout) · I-13 Unprompted
  (Root — the first solitary day; every journal day is solitary, M7 pin).
  Counter: 2.
- **Rings:** 0. **Why-panel:** "You were born. Your first entry is a leaf-bud
  — it bursts into foliage when the branch extends."

### Week 4 — Mar 28 yr0 (SAPLING)
- **Stage:** SAPLING (B2 at day 15). **Stage-years:** 0.
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 0.0.
- **Twigs:** 1 (March: 31/31 in-window days ≥ A3's 15). Journal branch
  extended — the tree's only branch. Leaf clusters (L-04).
- **Bank:** I-1 (S) · I-2 A Week of Honesty (R, d7) · I-13-R (d1) ·
  I-13-Branch (d10). Counter: 4.
- **Rings:** 0. **Why-panel:** "Your journal branch is the leader. Four buds
  are waiting for the first bloom."

### Month 6 — Sep 1 yr0 (SAPLING)
- **Stage:** SAPLING. **Stage-years:** 0 (first window closes Mar 1 yr1).
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 0.0.
- **Twigs:** 6 (Mar–Aug). Leaves + clusters.
- **Bank:** 1S (I-1) · 4R (I-13-R d1, I-2 d7, I-6 Half Century d50, I-9-R
  Novel-Length 25k d100) · 2B (I-13-B d10, I-3 A Season Kept d90) · 2H
  (I-13-H d50, I-4 Same-Time d60) → **9 buds**. (I-3 fires once — repeatable
  only per streak-run; this run never breaks, so it never re-arms.)
- **Rings:** 0. **Why-panel:** "Half a season kept. Your flowers stay buds
  until the tree matures — every one is claimed and counted."

### Year 1 — Mar 1 yr1 (POLE)
- **Stage:** POLE (B3: 1st stage-year). **Stage-years:** 1.
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 **0.1**.
- **Twigs:** 12 (12 months ≥ A3). Per-entry leaf granularity unlocks (C6).
- **Bank:** 1S · 4R · 2B (I-3, I-13-B) · 3H (I-13-H×2, I-4) · **1 Ring bud:
  I-5 Full Orbit** (d365 — window 1 closes with 365/365 ≥ 300 qualifying
  days; anchor = first qualifying journal entry, spec §I). Counter: 10 + the
  Ring. (I-9-B, 100k words @ d400, not yet — next year.)
- **VIII-1 One Year In does NOT fire** — it needs ≥3 distinct domains in ≥9
  of 12 calendar months after the anchor (spec §VIII). Honest miss: the brand
  is multi-domain. ✓
- **Rings (trunk):** 0. **Branch ring on the journal branch:** 1 (D088 A —
  branch rings = years the domain was actively present; 365/365).
- **Why-panel:** "A full year of pages. The Ring-tier Full Orbit is banked —
  it blooms at the first annual bloom after the first bloom."

### Year 2 — Mar 1 yr2 (MATURE — the FIRST BLOOM)
- **Stage:** MATURE (B4). **Stage-years:** 2. D1 floor (≥2) met.
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 **0.2**.
- **Twigs:** 24 (12 render — retention window = last 3 yrs per C5).
- **Bank pre-maturity (every S/R/B/H earned d1→d731; D092(1) — nothing blooms
  before maturity):**
  - S: I-1 (1) · R: I-13-R d1, I-2 d7, I-6 d50, I-9-R d100 (4) ·
    B: I-13-B d10, I-3 d90, **I-9-B d400 (Apr 4 yr1)**, **I-7 Five Hundred
    Pages d500 (Jul 13 yr1)**, I-12-B (Mar 1 yr2, same-day boundary) (5) ·
    H: I-13-H d50, I-4 d60, I-13-H d200, I-15 Bookended d671 (Dec 31 yr1 —
    winter-earned, D095 banks to spring) (4).
  - **= 14 buds** (≤ C1's 15 ✓). The earlier draft of this file listed 12
    and mislabeled I-9-B/I-7 "on-earn" — they earn PRE-maturity and burst
    here (D092(1)); the only true on-earn this year is I-8 (below).
  - **Ring stays banked (D092(2)):** I-5(yr1) · I-5(yr2) (window 2 closes
    today) · **VIII-2 Two Years** (Mar 1 yr2 — 24/24 months ≥ 18/24, spec
    §VIII). 3 ring buds.
- **FIRST BLOOM (D092(2)): 14 S/R/B/H buds burst — one wave (≤ C1, ≤ C2).**
  Ring/Grove stay banked.
- **On-earn (post-maturity, growing season Mar 1–Nov 30, D092(3)):** I-8 A
  Thousand Entries @ d1000 (Nov 25 yr2) → blooms directly. (15th bloom this
  year — still ≤ 15/event, one wave.)
- **Adaptations:** phyllodes signature sustained since d1 (resource 0.05 ≤
  0.4, E3) + D1 floor met today → **pending**, manifests at the annual bloom
  (D093) — boundary: the first bloom itself or the yr3 bloom, see V6.
- **Rings (trunk):** 0. **Branch ring:** 2. **Why-panel:** "You matured — the
  tree's flowering stage. Fourteen earned flowers burst at once. The Rings
  and the future Grove stay banked until the annual bloom — then yours."

### Year 3 — Mar 1 yr3 (MATURE — the first ANNUAL BLOOM)
- **Stage:** MATURE. **Stage-years:** 3. D2 floor (≥3) met.
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 **0.3**.
- **Grove earned today:** I-16 Three Years, Still Talking (3 consecutive Full
  Orbit windows close exactly today, spec §I). **"The next annual bloom after
  maturity" = the yr3 spring bloom = Mar 1 yr3 — the same day it earns**
  (A1/A2). First Grove → **the CROWN / legend** (C4: 1 per bloom + 1 all-time;
  D115(5): the legend persists through winter).
- **Annual bloom yr3 (7 flowers, one wave):** Ring — I-5(yr1) + I-5(yr2) +
  VIII-2 + I-5(yr3) (window 3 closes today, same-day rule) (4) · **I-16 Grove
  TRANSFORMS (the legend)** (1) · I-15 (Dec 31 yr2, winter-banked → spring
  flush, D095) (1) · I-12 Heartwood (Mar 1 yr3, same-day on-earn) (1).
- **Rings (trunk):** 0. **Branch ring:** 3. **Why-panel:** "Three years, still
  talking — the tree's once-in-a-lifetime crown. Your trunk shows no ring:
  rings are the seven-domain brand (A5); your years grew the canopy and the
  journal branch's own rings, not the trunk's mark."

### Year 5 — Mar 1 yr5 (MATURE)
- **Stage:** MATURE. **Stage-years:** 5. D3 floor (≥5) met.
- **Axes:** F4 0.05 · F5 1.00 · F6 0.00 · F7 **0.5**.
- **Groves earned today:** I-17 Half a Decade of Honesty (5 consecutive Full
  Orbit windows) · I-12 Same Question, New Answer **Grove** (5-year
  same-month-day) · VIII-3 Five Years (60/60 months ≥ 45/60, spec §VIII).
- **Annual bloom yr5 (5 flowers):** the 3 Groves get **large blooms, not
  transformations** (the crown is taken — C4) + I-5(yr5) Ring + I-15(Dec 31
  yr4) flush. One wave.
- **On-earn:** I-9 Novel-Length **Heartwood** @ d2000 (500k words ≈ Aug 23
  yr5, growing season) → blooms directly. (6th bloom this year.)
- **Rings (trunk):** 0. **Branch ring:** 5. **Why-panel:** "Half a decade of
  honesty — three Grove flowers at once. The first remains the legend; these
  bloom big and fade honestly at the season's end."

### Year 6 — Mar 1 yr6 (MATURE — final checkpoint)
- **Stage:** MATURE. **Stage-years:** 6. **Axes:** F4 0.05 · F5 1.00 ·
  F6 0.00 · F7 **0.6** — caudex signature still short (E1 needs tenure ≥0.7 →
  holds at yr7).
- **Twigs:** 72 lifetime (36 render individually — last 3 years; 36 merged
  into the branch's woody character — C5).
- **Annual bloom yr6 (2 flowers):** I-5(yr6) Ring (window 6 closes today) +
  I-15(Dec 31 yr5) flush. One wave.
- **Bank after the yr6 bloom: EMPTY.** Every trophy earned so far has a dated
  expression; the bank counter (C7) reads 0 pending. The archive/why-panel
  holds the lifetime composition (S1 · R4 · B5 · H11 · Ring7 · Grove4 = 32).
- **Rings (trunk):** **0 — can a ring EVER form? No.** Ring-year = the
  canonical 7 presence-domains each ≥40 in-window days (A5, D101/D104/D114(3)).
  This user holds 1 of 7, forever. **Verdict: honest — verified.** D090 C
  ("they just never brand rings"), D101 rule 1 (the stage clock never reads
  ring-years — stage-years accumulate forever), D104 (canonical 7),
  D114(3) (the ring domain set). The user matures, blooms every spring, grows
  old — and never brands a ring. Corollary: the VIII-11→20 ring-series (rings
  ≥1…10) never fires either — internally consistent.
  **BUT the aged look is not lost:** D088 A gives every branch its OWN rings
  (the years that domain was actively present) — the journal branch carries
  6 branch rings by yr6. The trunk is bare; the canopy's branch is ringed.
  See V5 for the why-panel copy.
- **Why-panel:** "Six years, every day. Your trunk never brands a ring —
  rings are a seven-domain brand. Your years live in the journal branch's
  rings, its 72 twigs, and two structural marks. The caudex grows next year."

## 4. The bank — every earned trophy, by tier (Mar 1 yr0 → Mar 1 yr6)

| Trophy | Tier | Earned | Blooms (D092/D095) |
|---|---|---|---|
| I-1 Ink on the Page | Sprout | d1 | first bloom yr2 ✓ |
| I-13 Unprompted | Root | d1 | first bloom yr2 ✓ |
| I-2 A Week of Honesty | Root | d7 | first bloom yr2 ✓ |
| I-13 Unprompted | Branch | d10 | first bloom yr2 ✓ |
| I-6 Half Century | Root | d50 | first bloom yr2 ✓ |
| I-13 Unprompted | Heartwood | d50 | first bloom yr2 ✓ |
| I-4 Same Time, Every Time | Heartwood | d60 [A4] | first bloom yr2 ✓ |
| I-3 A Season Kept | Branch | d90 | first bloom yr2 ✓ |
| I-9 Novel-Length Life | Root | d100 (25k words) | first bloom yr2 ✓ |
| I-13 Unprompted | Heartwood | d200 | first bloom yr2 ✓ |
| I-5 Full Orbit | **Ring** | d365 (yr1) | yr3 annual bloom ✓ (D092(4)) |
| I-9 Novel-Length Life | Branch | d400 (100k) | first bloom yr2 ✓ (pre-maturity bank) |
| I-7 Five Hundred Pages | Branch | d500 | first bloom yr2 ✓ (pre-maturity bank) |
| I-15 Bookended | Heartwood | d671 (Dec 31 yr1, winter) | first-bloom spring flush yr2 ✓ (D095) |
| I-12 Same Question, New Answer | Branch | Mar 1 yr2 | first bloom yr2 ✓ |
| I-5 Full Orbit | **Ring** | Mar 1 yr2 | yr3 bloom ✓ |
| VIII-2 Two Years | **Ring** | Mar 1 yr2 | yr3 bloom ✓ |
| I-8 A Thousand Entries | Heartwood | d1000 (Nov 25 yr2) | on-earn yr2 ✓ (growing season) |
| I-15 Bookended | Heartwood | d1036 (Dec 31 yr2, winter) | yr3 spring flush ✓ |
| I-16 Three Years, Still Talking | **Grove** | Mar 1 yr3 | **yr3 bloom — THE CROWN transformation** ✓ (C4) |
| I-5 Full Orbit | **Ring** | Mar 1 yr3 | yr3 bloom ✓ (same-day) |
| I-12 Same Question, New Answer | Heartwood | Mar 1 yr3 | yr3 bloom ✓ (on-earn, same-day) |
| I-15 Bookended | Heartwood | d1401 (Dec 31 yr3, winter) | yr4 flush ✓ |
| I-5 Full Orbit | **Ring** | Mar 1 yr4 | yr4 bloom ✓ |
| I-15 Bookended | Heartwood | d1766 (Dec 31 yr4, winter) | yr5 flush ✓ |
| I-17 Half a Decade of Honesty | **Grove** | Mar 1 yr5 | yr5 large bloom ✓ (C4 cap) |
| I-12 Same Question, New Answer | **Grove** | Mar 1 yr5 | yr5 large bloom ✓ |
| VIII-3 Five Years | **Grove** | Mar 1 yr5 | yr5 large bloom ✓ |
| I-5 Full Orbit | **Ring** | Mar 1 yr5 | yr5 bloom ✓ |
| I-9 Novel-Length Life | Heartwood | d2000 (500k, ≈ Aug 23 yr5) | on-earn yr5 ✓ |
| I-15 Bookended | Heartwood | d2131 (Dec 31 yr5, winter) | yr6 flush ✓ |
| I-5 Full Orbit | **Ring** | Mar 1 yr6 | yr6 bloom ✓ (same-day) |

**Tallies (yr6):** Sprout 1 · Root 4 · Branch 5 · Heartwood 11 · Ring 7 ·
Grove 4 = **32 trophy-fires**, all bloomed. Bank at the checkpoint: 0 pending
(C7 shows the empty state; the why-panel lists the lifetime composition).

**"Do ALL their trophies bloom on schedule?"** Yes. Every earn has a dated
expression: S/R/B/H burst at the first bloom (yr2) or on-earn/winter-flush
post-maturity; Ring buds at the next annual bloom (D092(4) — calendar-
guaranteed, rings or not); the Grove at the next annual bloom after maturity
= Mar 1 yr3, the same day I-16 earns (A1/A2); winter-earned flowers flush in
spring (D095(1)). Only genuinely unearned things stay unbloomed: I-9-Grove
(1M words ≈ Feb 3 yr11 — beyond the walk), I-10 Deep Dive **never** (~250-word
entries never clear the 500-word single-entry bar — spec §I), I-11 You Came
Back **never** (no 21-day gap), VIII-1 One Year In **never** (3-domain gate),
the VIII-11→20 ring series **never** (no trunk ring). Nothing unrewarded,
nothing flattened (D092).

## 5. The schedules (D092 / D093 / D095 / D100 — verified)

- **D092(1) pre-maturity banking:** all 15 S/R/B/H earns before Mar 1 yr2 are
  tier-marked buds (D096); none blooms early ✓.
- **D092(2) first bloom:** 14 S/R/B/H burst at maturity; Ring/Grove stay
  banked ✓.
- **D092(3)+(D095) post-maturity:** I-8 (Nov 25 yr2) and I-9-H (Aug 23 yr5)
  bloom on-earn — both inside the growing season (Mar 1–Nov 30, F2) ✓.
- **D092(4) Ring tier:** every I-5 + VIII-2/3 blooms at an annual bloom ✓.
- **D092(5) Grove:** I-16 transforms at the next annual bloom after maturity
  (yr3) ✓; I-17/I-12-G/VIII-3 large-bloom at yr5 ✓.
- **D093 modifications:** phyllodes pending at yr2, caudex pending at yr7 —
  both manifest at the annual bloom (V6 pins the boundary) ✓.
- **D095 winter banking:** all five I-15 earns land Dec 31 (winter per F1) →
  spring flush ✓; the tree's winter entries become leaf-buds on the bare
  branch (D095(2)) — until the phyllode character manifests (D095's derived
  override: a phyllode-character tree keeps leaves through winter).
- **D100 in-window predicate:** every day written same-day → 365/365 presence
  days; no grace use; no backfill; no imports (A2's 40-word bar + non-import
  exclusion hold every day); anchor = the first in-window event ✓. F10
  future-dating clamp: n/a.

## 6. The rings — the honest no-ring outcome (the user's question)

**Confirmed correct, against all four citations:**
- D090 C: "Single-domain users reach full maturity — they just never brand
  rings."
- D101 rule 1: the stage clock never reads ring-years — this user accumulates
  stage-years forever (6 by yr6).
- D104: the canonical 7 presence-domains — the user holds 1 of 7.
- D114(3): the ring-year domain set = the canonical 7.

The user matures (yr2), blooms every spring, reaches tenure 0.6, grows the
journal branch to 72 twigs — and never brands a ring. A5's per-domain ≥40
in-window days fails for 6 of 7 domains forever. **This is the intended
honest outcome, not a bug** — with one caveat (V5): the bare trunk reads
"young." The caveat is mostly dissolved by D088 A's **branch rings** (the
journal branch's own 6 rings render the aged canopy), which the earlier draft
of this file missed.

## 7. The adaptations (E1–E14) — verdict for this pattern

| Adapt | Signature (register) | This user | Verdict |
|---|---|---|---|
| E1 caudex | tenure ≥0.7 + resource ≤0.6 · gate D3 (≥5 stage-yrs) + MATURE | tenure 0.6 at yr6 → **0.7 at yr7**; resource 0.05 | **Reachable at yr7**; manifests at the yr7 annual bloom (or yr8 under strict-next reading — V6). Sane lifetime ✓ |
| E2 buttress | balance ≥0.7 + resource ≥0.6 · D2 + POLE | 0.00 / 0.05 | Impossible — honest (a single-domain tree has nothing to brace) |
| E3 phyllodes | resource ≤0.4 · D1 + SEEDLING | 0.05 since d1; D1 met yr2 | **Reachable — the archetype's true structural character** (sparse-stubborn). Sanity: thematically right (survives on little per day), BUT the ÷20 ceiling makes the bar near-universal — rarity broken until V2 is calibrated. D095's derived override: the phyllode character softens winter's bare-branch honesty |
| E4 cladodes | divergence ≥0.6 · D1 + SAPLING | 0.0 (never misses) | No — honest |
| E5 storage leaves | media share ≥0.5 · D1 + SEEDLING | 0 media | No — honest |
| E6 thorns | 365-day streak trophy + tenure ≥2 · D1 + SAPLING | streak trophies are habit-family (II-4) — no habits | **VIOLATION — V3 (the armor gap)** |
| E7 spines | 100-day streak trophy (II-3) · SAPLING (subtle tier, no tenure gate) | habit-family — no habits | **VIOLATION — V3** |
| E8 tendrils | live long-horizon goal | no goals | No — honest |
| E9 reaction wood + epicormic | a revival (dormancy end) — universal | never dormant | No — and honest: the tree never fell, so it never grew reaction wood. The why-panel should say so |
| E10 contractile | 3 consecutive stage-years with RISING active-day counts | 365/365/365 — flat, not rising | No — honest (subtle tier, no D1 floor per D114) |
| E11 mycorrhizal | coachEngagement owner ≥ threshold (H-03) | owner undefined | Open — see V7; a daily journaler plausibly maxes it |
| E12 stolons | L-10 insight ≥3 monthly windows | no cross-domain reference (single-domain) | Open/effectively-never — see V7 |
| E13 bracts | no gate (ceremony) | bloom presentation | Present at every bloom ✓ |
| E14 bud scales | no gate (dormant-habit state) | no habits | None ✓ |

**Structural marks reachable in this life: exactly two — phyllodes (yr2/3)
and caudex (yr7→bloom).** Everything else in the rare tier is locked to
domains this user doesn't touch. Mostly honest (buttress, storage leaves,
tendrils, cladodes, reaction wood are legitimately multi-domain or
fall/rebound signals) — with one genuine unfairness: **the armor** (V3).

## 8. Caps, budgets, economy

- **C1 (≤15 flowers/bloom event):** first bloom 14 ✓; yr3 = 7 · yr4 = 2 ·
  yr5 = 5 (+1 on-earn) · yr6 = 2 ✓ — never near the cap.
- **C2 (≤4 waves/season):** every bloom is one wave ✓.
- **C3 habit-bud clusters (≥30):** no habits — N/A.
- **C4 (1 legend + 1 crown):** I-16 = the crown at yr3 ✓; I-17/I-12-G/VIII-3
  get large blooms, not transformations ✓. Holds even for a single-domain
  user.
- **C5 (≤12 twigs/yr + 3-yr retention):** 12/yr on the journal branch —
  exactly at the cap, never over ✓; 36 render / 36 merged at yr6 ✓.
- **C7 bank counter:** top-3 by tier + count; empty at the yr6 checkpoint
  (everything bloomed) — the honest end state ✓.
- **D1/D2/D3 floors:** 2/3/5 stage-years ✓ all met on schedule (yr2/yr3/yr5).
- **F4 RESOURCE ceiling (÷20):** reads high — see **V2** (the D105(2)
  calibration this paper run exists to settle).
- **Economy:** 32 fires, 32 dated expressions, 0 lost, 0 flattened, 0 pending
  at the checkpoint; the only unbloomed things are unearned (I-9-Grove ≈ yr11,
  I-10/I-11/VIII-1/ring-series never) ✓.

## 9. Violations & tuning proposals

**V1 — B2 gate: two locked sources disagree (register 15 vs D115(1) 20).**
SCHEMA 2.4 B2 = ≥15 in-window days/30-day window (identical to A3);
D115(1)'s record text says ≥20. The register is the single source the engine
reads, but the records contradict. *Tuning:* reconcile to ONE number
(recommend 15 — the A3 month bar, any-domain-mixed) and amend D115's record;
for this archetype SAPLING moves by 5 days (irrelevant for perfect users,
decisive for borderline ones).

**V2 — F4 RESOURCE: the ÷20 ceiling makes the axis non-discriminating and
phyllodes near-universal (rarity broken).** A daily journaler reads 0.05; a
heavy multi-domain user ~0.75–1.0; but phyllodes' bar (≤0.4) equals ≤8
events/active-day — most multi-domain users sit under it, so a D089 RARE
structural modification is effectively common, and the lush↔sparse axis
collapses 0.05–0.35 into one visual state. This run's baseline numbers:
1 entry/day → 0.05; the archetype exists to calibrate this (D105(2)). *Tuning
options:* (a) keep the ceiling, tighten phyllodes to ≤0.15 (≤3 events/day);
(b) lower the ceiling to ~6–8 events/day so daily journaling reads ~0.13 and
the scale discriminates; (c) count entry-CLASSES (journal/habits/gym/
nutrition/body/media/goals presence), so 1 journal/day = 1/7 ≈ 0.14.
Recommendation: (b) or (c) — the axis should tell "a rich life vs a sparse
one," not "one entry vs two-dozen raw log events."

**V3 — E6 thorns / E7 spines are structurally unreachable for a journal-only
user (the armor gap).** The 100-day (II-3) and 365-day (II-4) streak trophies
are habit-domain. This archetype holds the system's longest possible streak —
**2,190 consecutive qualifying journal days by yr6** — and can never earn the
streak trophies, so its branch never grows thorns or spines. That contradicts
the "consistency compounds" spine of D088 C for the exact user it was written
for (and D093's own example text uses "your 400-day gym streak" — a gym
example, but the same principle). *Tuning:* (a) add journal-side streak
trophies (e.g., "A Year of Pages" — 365 consecutive qualifying journal days,
feeding E6; "A Hundred Pages" — 100, feeding E7); (b) generalize the E6/E7
triggers to ANY-domain day-streaks; or (c) document the habit-only armor as
intentional (thorns = the *habit* streak's metaphor). Recommend (a) or (b) —
otherwise the most consistent user in the system is also the only one who
can never armor up.

**V4 — F7 TENURE /10 + E1's 0.7: reachable, but late.** Caudex first holds at
yr7 (0.7), manifesting at the yr7/8 bloom — the ONLY structural mark besides
phyllodes. Reachable in a sane lifetime (the every-other-day archetype
reaches 0.7 in ~8 years per D090's ~13.2-month stage-year note), so it is
fair, but the wait is long. *Tuning:* consider E1 at tenure ≥0.6 (yr6) with
0.7 reserved for a harder tier if wanted. The /10 formula itself is fair (it
mirrors B5's decade scale; only OLD-GROWTH reads 1.0).

**V5 — The honest no-ring outcome (confirmed correct) + the branch-ring
answer.** Rings never form for a single-domain user (A5's canonical 7,
D090 C / D101 r1 / D104 / D114(3)) — verified, and the "bare trunk reads
young" caveat is mostly solved by D088 A's **branch rings**: the journal
branch shows 6 rings by yr6. The earlier draft of this file missed this.
*Tuning:* (a) the why-panel must be explicit on the trunk-vs-branch ring
distinction ("your trunk never brands a ring — rings are a seven-domain
brand; your journal branch carries its own six"); (b) mockup-stage decision
only: if a bare trunk still reads young at 6 years, consider a thin
per-stage-year sliver on the trunk (precedent: D090 C's partial-year sliver
is already visual-only). Not a contract violation.

**V6 — The same-day boundary is unpinned (three places, one rule).** (a) The
annual bloom's date is not in the register (F2 gives the season window, not
the bloom day) — I pinned Mar 1 (A1); (b) a Ring/Grove whose window closes ON
the bloom day (Mar 1) participates in that bloom (A2 — I-5(yr3) blooms at
yr3, I-5(yr6) at yr6, I-16 transforms at yr3) vs a strict-next reading that
defers each by a year; (c) D093's modifications: phyllodes' D1 floor and the
first bloom share Mar 1 yr2 — the modification rides the first bloom or
waits for yr3. The earlier draft mixed readings (its I-5 lag-2 schedule made
VIII-2 bloom yr3 but I-5(yr2), earned the same day, bloom yr4 — inconsistent).
*Tuning:* pin in the engine contract — "the annual bloom = the first day of
the growing season; the bank is evaluated at the bloom's opening, so buds
whose windows close that day participate; a modification whose gates all hold
at the bloom evaluates at that bloom." Recommended so the first bloom carries
the phyllodes (the tree's first flowering IS its first adaptation) and no
ring waits an artificial extra year.

**V7 — E11/E12 are uncomputable until their owners land.** coachEngagement
(H-03) and the L-10 monthly-window owner have no defined thresholds, so this
archetype's mycorrhizal/stolon status is "unknown," not "no." *Tuning:* not a
violation — a D114-deferred owner contract; record the archetype's expected
outcome in the owner spec (mycorrhizal: high-probability for daily journalers;
stolons: effectively never — the L-10 insight is cross-domain by definition).

**V8 — I-13 Unprompted's milestone→tier mapping is ambiguous**
("first occurrence then 10/50/200" over Root→Branch→Heartwood = 4 fires, 3
tiers). For this user every day is solitary, so I-13 fires 4× (d1/d10/d50/
d200). I used Root@1, Branch@10, Heartwood@50 and @200 (A5). *Tuning:* pin it
(e.g., that mapping) or compress to 10/50/100. Low severity.

**V9 — I-4 (Same Time, Every Time) rests on an assumption.** The archetype
specifies volume and cadence, not a fixed hour; I-4's 60-day ±30-min bar
(E8/G1) fires only under a consistent writing ritual. If the user varies, the
first-bloom H-count drops by one (13 buds) and the "robot-consistency" flower
never appears. Not a violation — flagging the assumption so the seeded-data
stress tests decide whether to pin a writing time.

**V10 — Record corrections to the earlier draft of this file** (not register
violations, but they change the walk): (a) the first bloom holds **14 buds**,
not 12 — I-9-B (d400) and I-7 (d500) earn pre-maturity and burst at the first
bloom (D092(1)); they are not "on-earn" (only I-8, d1000, is — Nov 25 yr2,
post-maturity, growing season); (b) I-15 fires at **d671** (Dec 31 yr1), not
d670; (c) I-9-H lands ≈ Aug 23 yr5 (365-day years), not Aug 21; (d) the Ring
bloom schedule is a consistent "next bloom after earn" (V6), so nothing is
banked at the yr6 checkpoint.

## 10. Verdict

The journal-only archetype is **coherent and honest under the locked
register.** Its shape — one deep leader branch, 12 twigs/yr at the cap, a
0.05 / 1.00 / 0.00 / 0.6 axis character, phyllodes (yr2) then caudex (yr7) as
its two structural marks, a legendary crown at yr3 and three large Grove
blooms at yr5, a trunk that never brands a ring but a journal branch ringed
six times over — is exactly what D090/D101/D104/D115 promise a single-domain
user. The no-ring outcome is **confirmed correct** against D090 C, D101 r1,
D104, D114(3): the user matures and blooms and never brands a ring, and that
is the design's stated intent. All 32 earned trophies bloom on schedule;
nothing unrewarded; nothing flattened; all budgets hold; the bank is empty
and honest at yr6.

Two real defects must be fixed before the register freezes: **V2** (RESOURCE
calibration — the axis can't tell a daily journaler from a ghost, and
phyllodes stops being rare) and **V3** (the armor gap — the most consistent
user in the system can never grow thorns or spines because the streak
trophies are habit-locked). **V1** (B2 15-vs-20) is a record-consistency
must-fix. **V6** (the same-day boundary) is the one contract gap the run
surfaced — pin it before the engine is written. V4/V5/V8/V9 are tuning-surface
and spec-pinning decisions this run was designed to surface; V5's honest
no-ring outcome is confirmed correct, and the branch rings (D088 A) already
answer the "does a single-domain tree ever look aged?" question.