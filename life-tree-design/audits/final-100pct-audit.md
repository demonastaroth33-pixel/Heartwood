# FINAL 100% AUDIT — Life Tree paper-archetype run's correction round

**Date:** 2026-09-24
**Auditor:** final comprehensive auditor (correction-round close-out)
**Scope:** 19 walks (paper-run/01–19) → D116 record + D115/D097/D100/D113/D114
(TEMP-PLANNING.md) → SCHEMA.md §2.4/§2.5/§2.6/§3 → LOOPHOLES.md → the two
prior audits (paper-run-recording-audit.md, paper-run-recording-verification.md).
**Standard:** every numbered finding = a register row / a D116 item / a
deferral-with-home; nothing stale, nothing contradictory, nothing lost.
A false PASS is worse than a false FAIL.

---

## 0. Source inventory read (verbatim)

- 19 walk files in `life-tree-design/paper-run/` (01-gym-heavy … 19-rising-consistency), full text.
- `TEMP-PLANNING.md` D085–D116 block (L2390–3815) in full: D085/D086/D087/D090–D099,
  D100–D116, D089/D088, plus THE RECORDING-AUDIT FOLLOW-UPS (a)–(i).
- `SCHEMA.md` in full (§2.4 register, §2.5 trigger-correlation table, §2.6 tree-state
  model, §3 derivation contract, §9 D116 additions C8–C14/A6/A7/E15).
- `LOOPHOLES.md` in full (§1 master clock, §3 matrix, §7/§8 statuses).
- `audits/paper-run-recording-audit.md` (the 186-finding matrix, G1–G7, C-1..C-12).
- `audits/paper-run-recording-verification.md` (the 12 claimed closures, item-8 FAIL).

---

## 1. TASK A — THE 186-FINDING COMPLETENESS MATRIX

**Finding inventory (counted directly from the walks' numbered violation
sections):** 01:12 · 02:10 · 03:8 · 04:9 · 05:10 · 06:9 · 07:8 · 08:9 · 09:8 ·
10:11 · 11:10 · 12:13 · 13:11 · 14:12 · 15:11 · 16:10 · 17:10 · 18:5 · 19:10
= **186.** (Walk 01 §7 and walk 05 §8 are "Observations", not numbered findings —
not counted, per the prior audit's method. Walk 18's §4.1 V1–V13 are the mechanical
vector-sweep verdicts; its numbered findings are W1–W5.)

Resolution codes: **REG** = applied in a register row · **D#/S#** = recorded in D116 ·
**DEF(home)** = deferred with a recorded home · **NOTE** = walk-internal record ·
**GAP** = no resolution, no home.

### Walk 01 — gym-heavy (12)
| # | Finding | Resolution (current text) |
|---|---|---|
| V1 | Ring never forms; Ring-tier flowers on a ringless trunk; A5-vs-VIII-5 split | REG A5 (D10 six-core fold, SCHEMA L111–115) + DEF(COPY) |
| V2 | A3 kills the 3×/week gym twig (13 < 15) | REG A3 (per-class; gym now ≥8, SCHEMA L98–99) |
| V3 | Winter maturity → first bloom in the resting season | REG C13 (S6 winter deferral, SCHEMA §2.5-A + §9) |
| V4 | F4 unit-unpinned; ÷20 misreads 3×/week lifter as sparse | REG F4 (D3: ceiling 12 + per-input-class unit) |
| V5 | E2 unreachable for the 3-domain stalwart | REG E2 (D5→follow-up g: balance-only) |
| V6 | F6 norm flips a gate | REG F6 (S3: canonical-7 PRESENT OR NOT) |
| V7 | Repeatable-faucet flood (~82% re-fires) | REG C9 (D6 merge + count badge) |
| V8 | Armor gap doubled (habit-locked + cadence-blind) | REG E6/E7 (D9: 52/26 consecutive weeks, ANY domain) |
| V9 | Same-day boundary unpinned | REG C13 (S7: bank evaluated at bloom opening) |
| V10 | C4 per-bloom legend selection has no rule | REG C4 (S8: earliest-earned, derived) |
| V11 | D088-A branch-ring bar undefined | REG C14 (follow-up c; SCHEMA §9) — **closed** |
| V12 | B2 15-vs-20 drift decisive | REG B2 + D115 record (S1) |

### Walk 02 — journal-only (10)
| # | Finding | Resolution |
|---|---|---|
| V1 | B2 register 15 vs D115(1) 20 | REG B2 + D115 record (S1) |
| V2 | F4 ÷20 non-discriminating; phyllodes near-universal | REG F4 (D3) + REG E3 (D4 rhythm leg) |
| V3 | Armor unreachable for a journal-only user | REG E6/E7 (D9) |
| V4 | F7/E1 caudex reachable but late (yr7) | REG E1 (S4: ~8.3-yr cadence pinned, SCHEMA L165–168) |
| V5 | Honest no-ring outcome + branch-ring answer | D10 + REG C14 (branch-ring bar) — **closed** |
| V6 | Same-day boundary | REG C13 (S7) |
| V7 | E11/E12 owner thresholds undefined | DEF(OWN — D114 owner contracts, Step 6) |
| V8 | I-13 milestone→tier mapping ambiguous | DEF(ENG/DOCS — trophy-condition pin) |
| V9 | I-4 same-time assumption | DEF(SEED — stress tests) |
| V10 | Draft record corrections | NOTE |

### Walk 03 — balanced (8)
| # | Finding | Resolution |
|---|---|---|
| V-1 | Faucet flood worst case (~92%) | REG C9 (D6) |
| V-2 | A3 unreachable for weekly-cadence domains | REG A3 (D2 per-class; gym ≥8) |
| V-3 | F4 ceiling 20 too high; E2 gate hangs on the count | REG F4 (D3 — ceiling 12) |
| V-4 | E6 has no referent (II-4 = 500-day) | REG E6 (D9 — cadence armor replaces the referent) |
| V-5 | E10 unreachable for ceiling users | REG E10 (S5 anchored windows) + DEF(COPY) |
| V-6 | B2 register vs record drift | REG B2 + D115 record (S1) |
| V-7 | Photo-only media earns presence but zero VII flowers | REG E15 (D11 — kept photos + vlogs) |
| V-8 | C4 first/rarest Grove tiebreak | REG C4 (S8) |

### Walk 04 — decade-consistent (9)
| # | Finding | Resolution |
|---|---|---|
| V-1 | Faucet flood peaks (83%); queue never drains | REG C9 (D6) |
| V-2 | A5 canonical-7 never forms; 0-vs-10 ring split | REG A5 (D10 — goals dropped) |
| V-3 | E1/E2 boundary inverted | REG F4 + E2 (D3 + D5/follow-up g) |
| V-4 | A3 leaves 4 of 7 branches twigless; brief's 840 is 360 | REG A3 (D2 per-class; gym ≥8 closes the 2×/wk residue) |
| V-5 | Journal Ring identity dead (I-5 needs 300) | DEF(DOCS — trophy-condition amendment) |
| V-6 | E6 referent missing | REG E6 (D9) |
| V-7 | F4 event unit unpinned, decisive at decade scale | REG F4 (D3) |
| V-8 | Same-day boundary confirmed | REG C13 (S7) |
| V-9 | Per-habit counting + assumption notes | DEF(ENG — freeze one convention) + DEF(SEED) |

### Walk 05 — bursty (10)
| # | Finding | Resolution |
|---|---|---|
| 05-V1 | Winter maturity structural for Jan-born users | REG C13 (S6) |
| 05-V2 | A4 windowed-vs-cumulative deadlocks sub-200-day users | REG A4 (S2 cumulative accrual) |
| 05-V3 | RESOURCE blind to rhythm; E3 fires on feast-famine | REG E3 (D4 rhythm ≥0.5 leg) |
| 05-V4 | Armor unreachable — 90-day wall | REG E6/E7 (D9 — ANY domain incl. journal) |
| 05-V5 | Dormancy/revival threshold undefined | REG E15 (follow-up d — ≥14 days) — **closed** |
| 05-V6 | Quiet-stretch copy risk | DEF(COPY — emotional copy-language pass) |
| 05-V7 | Repeatable flood ~91% + detrain-reset | REG C9 (D6) |
| 05-V8 | Ring-tier flowers on a ringless trunk | REG A5 (D10) + DEF(COPY) |
| 05-V9 | BALANCE razor + RHYTHM clamp | REG F6 (S3) + DEF(DT/ENG — raw-CV reporting) |
| 05-V10 | B2 drift + E6 referent, 3rd recurrence | REG B2 (S1) + E6 (D9) |

### Walk 06 — mediterranean (9)
| # | Finding | Resolution |
|---|---|---|
| V1 | E3 fires on the Mediterranean position; sclerophylly unmapped | DEF(17A — D112 17-audit) + REG F4 (D3) |
| V2 | Armor gap + cadence blindness, sharpest case | REG E6/E7 (D9) |
| V3 | 4-of-7 ring near-miss | REG A5 (D10) + DEF(COPY) |
| V4 | F4 unit-unpinned (first unit-robust run) | REG F4 (D3) |
| V5 | 5-year Grove cluster on the walk's last day | DEF(COPY + SEED) |
| V6 | Dormant/thin-branch copy discipline | DEF(COPY) |
| V7 | A3 weekly-class pips | DEF(COPY — thin-but-kept render sanctioned) |
| V8 | Faucets 62% of the bank | REG C9 (D6) |
| V9 | Six inherited pins (B2, F6, C4, winter, branch-ring, I-13) | (a) S1 · (b) S3 · (c) S8 · (d) S6 · (e) C14 **closed** · (f) DEF(SEED) |

### Walk 07 — body-only (8)
| # | Finding | Resolution |
|---|---|---|
| V1 | B2 drift (2nd) | REG B2 (S1) |
| V2 | ÷20 collapses sparse vs minimal-but-perfect | REG F4 (D3) + REG E3 (D4) + DEF(COPY) |
| V3 | Armor unreachable for the 731-day weigh-in streak | REG E6/E7 (D9) |
| V4 | V-10/11/12 pre-earned rungs at d15 | DEF(COPY — walk's option (a)) |
| V5 | V-4 Real Progress gated by G14 | DEF(DOCS — trophy-condition decoupling) |
| V6 | Fork twig-attribution ambiguous | DEF(ENG — single-count rule) |
| V7 | Measurement-only tree has no foliage channel | DEF(COPY + ENG/mockup) |
| V8 | Same-day / bloom-date boundary | REG C13 (S7) |

### Walk 08 — every-other-day (9)
| # | Finding | Resolution |
|---|---|---|
| V1 | A4 anchored-window reading deadlocks | REG A4 (S2 cumulative) |
| V2 | B2 drift existential (6th) | REG B2 + D115 record (S1) |
| V3 | A3 unit/bound + B2 window-completion unpinned | REG A3 (calendar-month pin, follow-up e) — **main finding closed; the B2 window-completion-day sub-part (day 29 vs 30) REMAINS unpinned (residual R5)** |
| V4 | E3 rhythm gate insufficient for the metronome | REG E3 (D4) + REG F4 (D3) + DEF(COPY) |
| V5 | II family dark for rhythmic lives | DEF(COPY + DL — cadence trophies) |
| V6 | F6 razor 0.7000 exactly | REG F6 (S3) + DEF(ENG — rounding pin) |
| V7 | Accrual cadence → winter maturity | REG C13 (S6) |
| V8 | C5 retention window edge | DEF(ENG — C5 "candidate:" marker) |
| V9 | Record corrections + (6) dormancy threshold | NOTE + REG E15 (follow-up d) — **closed** |

### Walk 09 — rotating-logger (8)
| # | Finding | Resolution |
|---|---|---|
| V-1 | B4 ≥90-per-single-domain deadlocks the pure sampler | REG B4 (D1 — ANY-DOMAIN-MIXED, follow-up a) — **closed** |
| V-2 | A3 zero-twig canopy for the rotation | REG A3 (canopy rule, follow-up b) — **closed** |
| V-3 | E2 unreachable for the 1-event/day balance champion | REG E2 (follow-up g — balance-only; the 0.80 champion can now brace) |
| V-4 | E6 referent (4th) | REG E6 (D9) |
| V-5 | B2 drift on number AND reading (6th) | REG B2 + D115 record (S1) |
| V-6 | Brief's evenness ~0.99 false | REG F6 (S3) + DEF(COPY) |
| V-7 | Rotation starves the repeatable faucets | DEF(COPY — small clean bank) |
| V-8 | No Grove → no crown/legend surfaces dark | DEF(COPY + C7 "—" rendering) |

### Walk 10 — habit-hoarder (11)
| # | Finding | Resolution |
|---|---|---|
| V-1 | F4 saturates at 1.0 for high-volume users | REG F4 (D3 — ceiling 12 + per-class unit) |
| V-2 | Per-habit faucet flood (6,034 re-fires) | REG C9 (D6 — per-habit caps) + DEF(ENG — II-8 window) |
| V-3 | Bloom economy at scale (60 of 5,040) | REG C9 (D6) |
| V-4 | C3 cluster capacity unpinned; D107 flat lists | REG C3/C9 + §2.6 `bankBuds [{achievementId,count}]` + `habits [.., clusterRef]` (follow-up i + the C-9 closure) — **closed** |
| V-5 | Winter-maturity clash at max amplitude | REG C13 (S6 — defer-to-spring) |
| V-6 | E6 referent (5th) | REG E6 (D9) |
| V-7 | B2 drift (7th) | REG B2 (S1) |
| V-8 | C4 tiebreak — 200 same-day Groves | REG C4 (S8) |
| V-9 | Canonical-7 ring price for a 2-of-7 tree | DEF(COPY) |
| V-10 | Beauty — garish monstrosity | REG C9/C3/C7 (aggregation = the fix) |
| V-11 | Coach floods (1,001 lines) | REG C10 (S12) |

### Walk 11 — launch-day-veteran (10)
| # | Finding | Resolution |
|---|---|---|
| V-1 | D097(6) legend-card template wrong on every number | REG C7 (S13 — card computes from state) + DEF(DOCS — D097(6) example) + DEF(ENG — top-N cap) |
| V-2 | A5 canonical-7 never closes vs six-domain 5 rings | REG A5 (D10) |
| V-3 | E1/E2 boundary at first open | REG F4 + E2 (D3 + D5/follow-up g) |
| V-4 | 3-of-7 canopy; brief's "60 visible" is 108 | REG A3 (D2 per-class) |
| V-5 | B2 drift (7th) | REG B2 (S1) |
| V-6 | E6 referent (carried) | REG E6 (D9) |
| V-7 | Replay scope/beat budget unpinned | DEF(F8 mockup note + ENG — D097(4) copy) |
| V-8 | Watermark write point | DEF(ENG — walk names it with D109(1)) |
| V-9 | Queue never drains at first-open scale | REG C9 (D6) |
| V-10 | Brief-number corrections + conventions | NOTE + DEF(ENG) |

### Walk 12 — restore-rewind (13)
| # | Finding | Resolution |
|---|---|---|
| V-1 | "Rings shrink 2→0" falsified (0→0) | REG A5 (D10) + NOTE |
| V-2 | Crown "once-set" vs D098 pure function | REG C4 (S8 — derived crown, never in backup) |
| V-3 | Foreclosed chains terminal, not delayed | REG C7 (S16 — closed bucket) |
| V-4 | Winter-maturity first bloom | REG C13 (S6) |
| V-5 | RHYTHM collapse — axis window undefined | DEF(DT — dev tools/D105, named in the walk) |
| V-6 | Restore-gap revival copy | DEF(COPY) |
| V-7 | Rewind journey envelope | DEF(F8 mockup note) |
| V-8 | B2 + E6 referent (8th/7th) | REG B2 (S1) + E6 (D9) |
| V-9 | Longevity ring trophies at the gap | DEF(DOCS — age vs active-months) |
| V-10 | Same-day participation band | REG C13 (S7 — the ±0 reading is pinned) |
| V-11 | Terminal foreclosures in the counter | REG C7 (S16) |
| V-12 | Carried: A3 gym bar + F4 ceiling | REG A3 (D2) + F4 (D3) |
| V-13 | Carried: E11 owner + bank composition | DEF(OWN) + DEF(ENG) |

### Walk 13 — sparse-stubborn (11)
| # | Finding | Resolution |
|---|---|---|
| V1 | **HEADLINE:** B4 depth leg unreachable for the caudex's archetype | REG B4 (D1 mixed-domain, follow-up a) — **closed** |
| V2 | E1 caudex double-locked | REG E1 (S4 — MATURE floor dissolves with B4; ~8.3-yr cadence pinned) |
| V3 | E3 gate opens but never manifests | REG C12 (S9 — never-mature fallback) |
| V4 | B2 drift fatal for this class (8th) | REG B2 + D115 record (S1) |
| V5 | A4 anchored-window reading kills the sparse class | REG A4 (S2) |
| V6 | 42 buds, zero expressions, open-ended promise | REG C12 (S9) + DEF(COPY) |
| V7 | D092/D093/D095 presuppose maturity | REG C12/C11 (S9/S10) |
| V8 | E10 dead under the accrual unit | REG E10 (S5) |
| V9 | M-2 "with the first twigs" — never-twig leaf-loss | REG D115(3) wording (follow-up f — "regardless of twigs") — **closed** |
| V10 | F6 razor 0.6563 vs 0.7 | REG F6 (S3) + DEF(DT fixture) |
| V11 | Owner-contract pins (III-21, V-10, I-12) | DEF(OWN — walk names the owner contracts) |

### Walk 14 — media-rich (12)
| # | Finding | Resolution |
|---|---|---|
| V1 | B2 drift (re-verified) | REG B2 (S1) |
| V2 | F4 misreads media-lush as sparse → E3 fires wrong | REG F4 (D3 — 0.44 ≥ 0.4, phyllodes closes) |
| V3 | E5 metric undefined | REG E5 (S15 — attachment-mix) |
| V4 | VII family reads vlogs only vs its own census | REG E15 (D11) |
| V5 | Journal streak/Ring family daily-locked | DEF(DOCS — I-5 bar amendment) |
| V6 | Fork twig attribution + C5 across forks | DEF(ENG — single-count) |
| V7 | A3 daily-biased for the 2×/week gym | REG A3 (D2 — gym ≥8 now passes 8.7) |
| V8 | Armor gap with a real 365-day nutrition streak | REG E6/E7 (D9) |
| V9 | Buttress misses at 0.67 evenness | REG F6 (S3) + DEF(DOCS — "≥5 of 7" note) |
| V10 | I-13 anti-media by construction | DEF(DOCS — condition extension) |
| V11 | I-15 calendar sensitivity + bloom day | REG C13 (S7) + DEF(ENG — Mar 1 bloom day) |
| V12 | VII-2/VII-10 duration bars uncalibrated | DEF(DT — D105(2), mockup step) |

### Walk 15 — goal-focused (11)
| # | Finding | Resolution |
|---|---|---|
| V-1 | No goals family in the live catalog | REG A7 (D8 — user chose Option B, fruits-only) |
| V-2 | E8 tendrils + two gaps | DEF(ENG — manifest pin) + DEF(MY — mast-year) |
| V-3 | Fruit-spur mechanics unbounded (10,950 spurs) | REG C8 (D7 — one per milestone/phase) |
| V-4 | Armor blind to task streaks | REG E6/E7 (D9 — ANY domain incl. task days) |
| V-5 | E4 cladodes formula unspecified | DEF(ENG/DT — walk names engine contract + dev tools) |
| V-6 | Empty annual bloom | REG C11 (S10) |
| V-7 | Ringlessness + per-branch age marks | REG A5 (D10) + DEF(COPY) |
| V-8 | Character boundary note | NOTE |
| V-9 | B2 drift (8th) | REG B2 (S1) |
| V-10 | Fruit hang moment unpinned | DEF(ENG) |
| V-11 | First-bloom ceremony scale | DEF(ENG/mockup) |

### Walk 16 — vacation-heavy (10)
| # | Finding | Resolution |
|---|---|---|
| V1 | E9 fires 16 false revivals on protected returns | REG E9 (S11 — protected-absence exclusion) |
| V2 | A3 = 15 kills the 3×/week gym twig | REG A3 (D2 — gym ≥8) |
| V3 | A3 vacation-month placement lottery | REG A3 (calendar-month pin, follow-up e — deterministic reading) — **closed** |
| V4 | E3 fires on a non-sparse user | REG F4 (D3 — 0.43 > 0.4) |
| V5 | III-24 ×16 on planned returns | REG E9/S11 (III-24 inherits the exclusion, recorded in D116) |
| V6 | C4 tie-break unspecified | REG C4 (S8 — earliest-earned) |
| V7 | Flower economy floods | REG C9 (D6) + DEF(DT) |
| V8 | F5 discount only in D114(1), not the row | REG F5 (S3 — discount moved into the row) |
| V9 | Brief's ring numbers wrong | NOTE |
| V10 | Off-grid honest misses (VI-3/4) | DEF(COPY — no register change required) |

### Walk 17 — streak-machine (10)
| # | Finding | Resolution |
|---|---|---|
| V1 | F4 ceiling makes the densest user read arid → E3 | REG F4 (D3 — 0.54 > 0.4) |
| V2 | A3 unreachable for Mon/Wed/Fri (max 14) | REG A3 (D2 — gym ≥8) |
| V3 | E6 referent doesn't exist (catalog gap 100→500) | REG E6 (D9 — cadence armor) |
| V4 | B2 drift | REG B2 (S1) |
| V5 | Ghost does NOT fire without nutrition | RECORDED FACT (1) — Ghost refutation present in D116 |
| V6 | Bank grows forever | REG C9 (D6) |
| V7 | C4 first-vs-rarest ambiguity | REG C4 (S8) |
| V8 | II-8 repeatability | DEF(ENG — per-run semantics) |
| V9 | Three dev-tunable date pins | DEF(DT) |
| V10 | Absence notes | DEF(COPY — positive why-panel) |

### Walk 18 — winter-bomber (5)
| # | Finding | Resolution |
|---|---|---|
| W1 | **CRITICAL:** backfill exploits volume trophies (I-7; PR-rich → Grove) | REG A6 (S14 — backfill-trophy predicate) |
| W2 | F5 "active day"/F6 unit undefined | REG F5/F6 (S3) + F5-window sub-item DEF(DT) |
| W3 | isBackfill arming rule unspecified | DEF(ENG — weak home; A6/S14 land the exclusion, arming threshold unrecorded) |
| W4 | Carried prior art | Each homed in its home run (REG A3/B2/F4/E6/C9/C4) |
| W5 | Leaves-but-no-presence honesty UX | DEF(COPY — D110(4) template) + gated on A6 |

### Walk 19 — rising-consistency (10)
| # | Finding | Resolution |
|---|---|---|
| V1 | E10 clock ambiguity (2nd confirmation) | REG E10 (S5) |
| V2 | Adaptation-reversion question (E3 crossed both ways) | REG E3 (D4 — persist-intensity rule) |
| V3 | F4 ceiling character split on a rising line | REG F4 (D3) |
| V4 | Maturity-lag arithmetic (brief wrong) | DEF(COPY — three-clocks) + DEF(DT — B2 toggle) |
| V5 | A3 class bar from the rising side | REG A3 (D2) |
| V6 | B2 drift (9th) | REG B2 (S1) |
| V7 | E6 missing referent (4th) | REG E6 (D9) |
| V8 | Same-day SAPLING+POLE collision | DEF(ENG — ceremony queue) |
| V9 | Crown-order razor (III-27 24h before IX-2) | REG C4 (S8) |
| V10 | Record items + (f) dormancy threshold | NOTE + REG E15 (follow-up d) — **closed** |

### Completeness result
- **186 / 186 findings have a resolution** (REG register row, D116 decision/surgical/
  recorded-fact, or a recorded deferral home). 
- The prior audit's **11 gap-findings (G1–G7) are all closed in the current text**
  (verified: B4 mixed-domain, the canopy rule, C14 branch-ring bar, E15 dormancy
  threshold, A3 calendar-month pin, M-2 wording, E2 balance-only).
- **0 findings unresolved, 0 homeless.** (One sub-part of 08-V3 — B2's
  window-completion day — remains unpinned; see residual R5.)

---

## 2. TASK B — THE D116 VERIFICATION

### Decisions D1–D11 vs the register (current text)
| Dec | Verdict | Register carries it? |
|---|---|---|
| D1 | B4 mixed-domain (≥90 ANY-DOMAIN-MIXED) | ✓ B4 (SCHEMA L124–130) |
| D2 | Per-class twig bars | ⚠ **partial** — A3 is per-class (daily ≥15, body/media ≥4 weeks) BUT **gym = ≥8 in the register vs ≥12 in the D116 record text** (residual R3) |
| D3 | F4 ceiling 12 + per-input-class unit | ✓ F4 |
| D4 | E3 rhythm ≥0.5 + persist-intensity reversion | ✓ E3 |
| D5 | E2 resource leg ≥0.4 — **superseded by balance-ONLY per follow-up (g)** | ✓ E2 = balance ≥0.7 ONLY (matches the supersession, as the task brief states) |
| D6 | Repeat-bloom aggregation | ✓ C9 + §2.6 bankBuds count |
| D7 | Spur per milestone/phase | ✓ C8 |
| D8 | Goals = fruits only (no G-family) | ✓ A7 |
| D9 | Cadence armor — spines 26w, thorns 52w + tenure ≥2 | ✓ E6/E7 |
| D10 | Six-core ring fold | ✓ A5 |
| D11 | Media census (kept photos + vlogs) | ✓ E15 |

### Surgical fixes S1–S16
S1 B2 15 (register + amended D115 record) ✓ · S2 A4 accrual ✓ · S3 F5/F6 pins ✓ ·
S4 E1 caudex cadence (~8.3 yr now in the E1 row) ✓ · S5 E10 anchored windows ✓ ·
S6 winter deferral (C13) ✓ · S7 bloom-opening evaluation (C13) ✓ · S8 earliest-earned
derived crown (C4) ✓ · S9 never-mature fallback (C12) ✓ · S10 empty-spring (C11) ✓ ·
S11 E9 protected-absence exclusion (E9 + III-24 inheritance recorded) ✓ ·
S12 coach-line cap (C10) ✓ · S13 legend card from tree state (C7) ✓ ·
S14 backfill-trophy predicate (A6) ✓ · S15 E5 attachment-mix ✓ · S16 closed bucket (C7) ✓.
**All 16 present, all landed in the register or a recorded row.**

### Recorded facts
(1) Ghost refutation (IV-5 nutrition leg, Ghost-proof robot, earliest ~d96–97) ✓ ·
(2) ring divergence resolved by D10 ✓ · (3) paper-run verdict (tunable register values,
the D105 philosophy held) ✓.

### Follow-ups (a)–(i) — present AND claims true in the current text
| Item | Claim | Verified in current text |
|---|---|---|
| (a) | B4 register row carries the mixed-domain bar | ✓ SCHEMA L124–130 |
| (b) | Canopy rule (rotating-logger fix) | ✓ A3 L100–104 |
| (c) | C14 branch-ring bar | ✓ SCHEMA §9 |
| (d) | E15 dormancy threshold (≥14 days) | ✓ SCHEMA L204–206 |
| (e) | A3 calendar-month pin | ✓ A3 L97–98 (deterministic reading) |
| (f) | M-2 wording ("regardless of twigs") | ✓ D115(3), TEMP-PLANNING L3416–3421 |
| (g) | E2 balance-only | ✓ E2 L169–173 |
| (h) | Trigger-table stale rows corrected (2/3/6/7/9/10) | ✓ **TRUE now** — §2.5-B rows 2 (balance-only), 3 (rhythm leg), 6 (52w ANY-domain), 7 (26w ANY-domain, refuted II-3 gone), 9 (protected-absence exclusion + E15), 10 (anchored windows) — the prior verification's FAIL item is CLOSED |
| (i) | bankBuds aggregated by achievementId | ✓ §2.6 |

**The follow-ups' closing line "the register, the trigger table, and the records
agree" is false on exactly ONE number:** D116 D2's gym value (≥12) vs the register's
A3 gym value (≥8). (Residual R3.)

---

## 3. TASK C — THE REGISTER VERIFICATION, ROW BY ROW

**Group A:** A1 ±3d ✓ · A2 qualifying rules ✓ · **A3 per-class + canopy rule +
calendar-month pin — carries the D116 per-class structure and the canopy rule ✓,
but the gym value (≥8) differs from the D116 record's ≥12 (R3)** · A4 cumulative
accrual ✓ · A5 six-core ring fold ✓ · A6 backfill-trophy predicate (in §9) ✓ ·
A7 goals = fruits only (in §9) ✓.

**Group B:** B1 ✓ · B2 ≥15 ANY-DOMAIN-MIXED ✓ · B3 ✓ · B4 ≥90 ANY-DOMAIN-MIXED ✓ ·
B5 ✓.

**Group C:** C1 ≤15/event ✓ · C2 ≤4 waves, 60/season, overflow to next spring ✓ ·
C3 ≥30 clusters, individuals ≤29, honest count ✓ · C4 earliest-earned derived crown ✓ ·
C5 ≤12/yr + 3-yr retention ✓ · C6 granularity at POLE ✓ · C7 top-3 + count + CLOSED
bucket + legend card from state ✓ · C8 spur economy ✓ (§9) · C9 repeat-bloom
aggregation + count badge ✓ (§9) · C10 coach-line cap ✓ (§9) · C11 empty-spring rule
✓ (§9) · C12 never-mature fallback ✓ (§9) · C13 schedule pins (winter deferral +
bloom-opening evaluation) ✓ (§9) · C14 branch-ring bar ✓ (§9).

**Group D:** D1 2 stage-years ✓ · D2 3 ✓ · D3 5 ✓.

**Group E:** E1 caudex (tenure ≥0.7 + resource ≤0.6, ~8.3-yr cadence pinned) ✓ ·
E2 balance ≥0.7 ONLY ✓ · E3 resource ≤0.4 AND rhythm ≥0.5 + persist-intensity ✓ ·
E4 divergence ≥0.6 ✓ · E5 attachment-mix ✓ · E6 52 consecutive weeks ANY domain +
tenure ≥2 ✓ · E7 26 consecutive weeks ANY domain ✓ · E8 live >1-yr goal ✓ ·
E9 unprotected dormancy end + protected-absence exclusion ✓ · E10 3 consecutive
anchored 365-day windows ✓ · E11/E12 ✓ · E13/E14 no-gate ✓ · E15 dormancy threshold
≥14 days ✓.

**Group F:** F1 fixed seasons + render clock ✓ · F2 growing Mar1–Nov30 ✓ · F3 anchored
365-day windows ✓ · F4 ceiling 12 + per-input-class unit ✓ · F5 active-day pin + D114
discount ✓ · F6 canonical-7 PRESENT OR NOT ✓ · F7 stage-years/10 ✓ · F8 replay ~2s/yr
✓ · F9 perf gate (deferred to Step 6, recorded) ✓ · F10 future-dating clamp ✓.

**Row-by-row result: every row carries the correct D116 value EXCEPT the A3 gym
number's provenance** (register says ≥8, D116 record says ≥12 — R3). No other stale
text, contradiction, or missing value in the register rows.

---

## 4. TASK D — CROSS-DOCUMENT CONSISTENCY

| Check | Result |
|---|---|
| Register vs trigger table (E-rows vs §2.5-B rows 1–14) | ✓ **consistent** — all 14 trigger rows now carry the D116 values (the prior verification's FAIL on rows 2/7/9/10 is closed) |
| Register vs state model (§2.6) | ✓ — bankBuds aggregated, habits clusterRef, branches/forks/twigs/rings/periods present |
| Register vs D116 record | ⚠ **one numeric disagreement** — A3 gym ≥8 (register) vs D116 D2 ≥12 (record) (R3); D5's supersession by follow-up (g) is the acknowledged exception |
| Register vs LOOPHOLES | ⚠ **LOOPHOLES §1 master clock still defines rings as "the CANONICAL 7 presence-domains per D104/D114"** — contradicts A5/D116 D10's six-core fold (R2) |
| SCHEMA §3 derivation contract vs register A5 | ⚠ **§3 still says ring-years = "the anchored 365-day window with the CANONICAL 7 presence-domains present"** — contradicts the six-core fold (R1) |
| Trigger table vs walk findings | ✓ — the 365-day-streak referent, the resource leg, the dormancy gap, and the winter-deferral are all gone/added correctly |

---

## 5. TASK E — THE EARLIER FIXES' INTEGRITY

- **D097's citation fix:** D097(5) now reads "governed by D100's two-tier split"
  (TEMP-PLANNING L2751–2753) — the D115 mechanical-fix list's "D097's record citation
  -> D100" is in place. ✓
- **D100–D115 records intact:** every record header present exactly once (D085–D116 +
  D089/D088; no duplicates), full readable text, LANDS lines present, no lost lines.
- **No mangled content:** 0 replacement characters (U+FFFD) across TEMP-PLANNING,
  SCHEMA, LOOPHOLES (the "�" seen in terminal output is a display artifact of the
  arrow glyph, not file corruption).
- **Structural quirks (non-loss, non-corruption):** (1) TEMP-PLANNING L3815 ends with
  an orphan continuation line "(achievement-scan at the feature-scan step)." — the
  tail of a LANDS block, stranded after the follow-ups insert; (2) D088/D089 sit after
  D116 in the file order (a pre-existing append ordering); (3) SCHEMA §2.4's header
  note (2) still says the F4 ceiling "reads high at 20 events/day — kept for now,
  calibrated via the dev tools at the paper-run step", which the paper run has now
  done (ceiling 12) — the note is stale (R4).

---

## 6. TASK F — VERDICT

### **PASS-WITH-FIXES**

**Completeness (Task A):** 186/186 findings resolved — 0 unresolved, 0 homeless.
The prior audits' 11 gap-findings (G1–G7) and the recording-verification's FAIL
items (trigger rows 2/7/9/10, the false (h), C-8, C-9, C-10, C-11) are all closed
in the current text.

**D116 (Task B):** D1–D11, S1–S16, the three recorded facts, and follow-ups (a)–(i)
all present; every follow-up claim is TRUE except the closing "records agree" line
on one number.

**Register (Task C):** all rows carry their D116 values; no missing values, no stale
text inside the rows.

**Why not PASS (100%)?** The standard says "nothing stale, nothing contradictory".
Five concrete stale/contradictory texts remain in live (non-historical) documents:

### Exact residual list
| # | Residual | Severity | Where |
|---|---|---|---|
| **R1** | SCHEMA §3 (derivation contract) still defines ring-years as "the anchored 365-day window with the CANONICAL 7 presence-domains present, per D104/D114" — contradicts the D116 D10 / A5 six-core ring fold (goals/periods excluded). An engine reading §3 computes the ring on the wrong domain set. | HIGH | SCHEMA.md §3, L372–375 |
| **R2** | LOOPHOLES §1 (master clock) still says "Rings = a BRAND (decoupled from the clock; the CANONICAL 7 presence-domains per D104/D114…)" — same contradiction with the six-core fold. | HIGH | LOOPHOLES.md §1, L43–45 |
| **R3** | D116 D2's recorded verdict text says "GYM >=12 days/30d"; the register A3 carries "GYM >=8 days/month (2x/week passes — the audit C-11)". The register side is the correct/final value (it closes the 2×/week residue, and the task's own A3 check expects gym≥8), but the D116 record was never amended, so the follow-ups' "the register, the trigger table, and the records agree" is false on this number. | MED | TEMP-PLANNING D116 D2 (L3454) vs SCHEMA A3 (L98–99) |
| **R4** | SCHEMA §2.4 header note (2): "The RESOURCE normalization ceiling (F4) reads high at 20 events/day — kept for now, calibrated via the dev tools at the paper-run step." The paper-run step has happened; F4 is ceiling 12. Stale note contradicts its own F4 row. | LOW | SCHEMA.md §2.4, L85–87 |
| **R5** | 08-V3(3)'s sub-part — B2's window-completion day (the 15th in-window day landing on day 29 of a 29-day span vs the full 30-day window, a 1-day boundary) — remains unpinned anywhere in the register, D116, or the follow-ups. | LOW | register B2 (no text); walk 08 §9 V3(3) |
| **R6** | LOOPHOLES §8's status/deferral row was refreshed for the RESOURCE ceiling only; it still shows none of the C8–C14/A6/A7/E15 register closures D116's LANDS claims for LOOPHOLES.md (the recording-verification's C-12 "other half"). | LOW | LOOPHOLES.md §8, L227 |

**Surgical fixes for each (all are 1–3 line edits, no behavior ambiguity):**
R1 — amend SCHEMA §3 to "the SIX CORE presence-domains (A5/D116 D10 — goals and
periods excluded)". R2 — amend LOOPHOLES §1 to the same. R3 — amend D116 D2's text to
"GYM >=8 days/month (2×/week passes; the C-11 closure — the audit C-11, 2026-08-29)"
so the record matches the register. R4 — strike or update the §2.4 header note to
"calibrated at the paper-run step: ceiling 12 (D116)". R5 — add one clause to B2:
"the window completes when the 15th in-window day is within any 30-day span
(inclusive)". R6 — add the D116 register closures to LOOPHOLES §8's status row.

**Counts (for the final message):** findings resolved **186/186** (0 unresolved,
0 homeless) · register rows: all groups correct except the A3-gym provenance (R3) ·
cross-document: register↔trigger↔state↔D116 consistent except D2/≥8 (R3) ·
LOOPHOLES §1 and SCHEMA §3 carry one stale ring definition each (R1/R2) ·
minor stale text: R4/R5/R6.