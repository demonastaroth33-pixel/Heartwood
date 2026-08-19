# Integration ID Census — Stage A1a

- **Stage:** A1a — ID Census (Indexer agent)
- **Date:** Wed Aug 19 2026
- **Input files (read in full, contiguous):**
  - `docs/UIUX.md` — 80 lines (lines 1–80 read; entire file)
  - `TEMP-PLANNING.md` (repo root) — 2,671 lines, read as four contiguous chunks:
    1. lines 1–1000
    2. lines 851–1550
    3. lines 1551–2250
    4. lines 2251–2671
    (chunks overlap at boundaries; every line 1–2671 was covered)
  - Consulted for disambiguation only (census data is NOT sourced from them):
    `docs/DecisionLog.md` (D-series resolution check), `docs/Roadmap.md`
    (P2.5 milestone check)
- **Primary deliverable rule:** this census enumerates every ID in every ID
  family present in the two primary files. UIUX.md contains **no** ID-family
  labels (verified by exhaustive read + pattern grep `\b[A-Z]\d+\b`); its only
  lettered tokens are roadmap milestone markers M0/M1/M2 (see "Orphan &
  cross-file analysis"). **All ID families below therefore come from
  TEMP-PLANNING.md.**
- **Methodology:**
  1. Read UIUX.md and TEMP-PLANNING.md completely (contiguous line coverage
     confirmed above).
  2. Adopted TEMP-PLANNING.md's own **LABEL FAMILIES — DISAMBIGUATION LEGEND**
     (lines 791–813) as ground truth for family boundaries. No family grouping
     was invented where the legend defines one.
  3. Verified the floor list from the stage instruction against the live file
     (all confirmed) and **added families the floor missed** (see "Families
     added beyond the floor").
  4. Cross-checked every ID occurrence with pattern greps (`\bO\d+\b`,
     `\bI\d+\b`, `\bN\d+\b`, `\bF\d+\b`, `\bNU\d+\w?\b`, `\bG\d+\w?\b`,
     `\bJ\d+\b`, `\bR\d+\b`, `\bH[1-4]\b`, `\bM[0-7]\b`, `\bA[1-7]\b`,
     `\bB[1-5]\b`, `\bC[1-6]\b`, `\bE[0-9]+\b`, TENSION/clash/E-clash,
     D-series, S-series, LOW/MED flags, audit-item refs, `[x]` items).
  5. Where the source itself cites a line range (e.g. the Coach Consolidated
     Map's `ledger:NNN` citations), the author's citation is **carried** into
     the Source lines column, spot-checked against the contiguous read, and
     flags are recorded rather than silently corrected (appendix §Coach-map
     citation spot-check).
- **Rejected/skipped/deferred/declined IDs are all retained below** with their
  resting-place status so no ID disappears from the record.

---

## Families added beyond the stage-instruction floor

The legend and live file contain families beyond the floor list. They are
included for completeness:

1. **Coach Consolidated Map — named Coach rules** (§3 of the map, lines
   2485–2517), each carrying author-sourced `ledger:` citations.
2. **Audit-item cross-reference labels** (`audit N.N`, `audit fix N`,
   `audit optimization N`, `audit LOW-NN`, `audit MED-NN`, `audit finding …`,
   `audit clash …`, `N.N RESTATED`) — referenced labels, not definitional
   IDs, but ID-like tokens that a downstream stage must not confuse with
   legend families.
3. **Referenced external families**: D-series (DecisionLog IDs cited inside
   TEMP-PLANNING.md), S-series (`S1-006` … `S13-045` section codes cited in
   the legend and list), and `P2.5` (Roadmap.md milestone). All resolve to
   real entries in their home files (verified — see appendix).
4. **`D5`** (line 2135) is shorthand for D005 (DecisionLog "Drive integration
   phased") — recorded as an alias in the D-series table.

---

## 1. Plain items 1–37 (feature reviews)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| 1 | New entities follow existing entity+event pattern (workout, exercise_sets, body metrics, nutrition, phases → `health` area) | 7–11 | "## Decided (session-scoped…)"; no status word — decided header |
| 2 | `workout.completed` event type (payload = metadata only) | 7, 12–14 | Decided |
| 3 | Exercises: seeded lookup table (user-extendable) — NOT free text | 7, 15–17 | Decided [user choice] |
| 4 | Calorie logging: log macros from the start (kcal + protein/carbs/fat) | 7, 18–19 | Decided [user choice] |
| 5 | Pace computation placement: Analytics → Rule → Reflection; no new subsystem | 7, 20–23 | Decided |
| 6 | Bulk/cut pace status on rolling 7–14d weight average | 7, 24–27 | Decided |
| 7 | Strength standards: plain Dart pure functions (Mifflin, Wilks/DOTS, Epley) | 7, 28–30 | Decided |
| 8 | Manual structured entry for M1; journal parsing deferred | 7, 31–32 | Decided (deferred NLP) |
| 9 | Workout SETUPS (templates + performed sessions, append-only history) | 270–273 | User-driven addition |
| 10 | Auto-assort paste parser (rule-based, NO AI, offline) | 274–278 | Scoped M1-or-M2 |
| 11 | Per-exercise progress tracking | 279–280 | Resolved in item 16 |
| 12 | Priority order: workout side first, macros after | 281 | User decision |
| 13 | Workout layering: day-template bindings (7 slots, per routine-A7) → frozen sessions | 285–289 | LOCKED (design-level) |
| 14 | Exercises lookup gains muscle tags (junction table) | 290–292 | LOCKED |
| 15 | Muscle-group hierarchy (seeded, 2 levels) | 293–297 | LOCKED |
| 16 | Progress metric: est 1RM (Epley, best set) + raw top-set | 298–300 | LOCKED |
| 17 | PR system: tracked toggle, derived all-time best, `workout.pr` event | 301–306 | LOCKED |
| 18 | Gamification: PR XP small, milestone tiers, growth displays centerpiece | 307–310 | LOCKED |
| 19 | STRENGTH PROFILE: est-1RM ÷ bodyweight ratio; BIG-5 tables | 311–315 | LOCKED |
| 20 | AUTO-ASSORT (rule-based, fuzzy + "Did you mean?", never silent auto-create) | 316–320 | LOCKED; M1-or-M2 |
| 21 | Daily logging flow: plan-driven + editable; plans never store weights | 321–324 | LOCKED |
| 22 | EVERY set logged; est-1RM/PR use best set within 1–12 rep guard | 325–326 | LOCKED [user-confirmed] |
| 23 | LAST-TIME HINT: previous weight/reps/est-1RM per set | 327–328 | LOCKED |
| 24 | Phases (bulk/cut/maintain) + baseline weight; one active phase | 332–336 | LOCKED |
| 25 | ENERGY-BALANCE MATH: Mifflin TDEE, (kcal−TDEE×7)/7700, rolling avg | 337–342 | LOCKED |
| 26 | Phase rate ↔ macros feedback; auto-recompute | 343–346 | Deferred final shape to Nutrition session (NU6) |
| 27 | BROAD WEIGHT GOALS: reuse M1 goals; pace = remaining kg ÷ days | 347–349 | LOCKED (NOT new) |
| 28 | TDEE BASELINE: Mifflin auto-estimate WITH manual override | 350–352 | LOCKED |
| 29 | STRENGTH GOALS (kind generic/weight/strength; exercise FK; est-1RM target) | 356–363 | COMMITTED |
| 30 | PLAN-ADHERENCE COACH: per-slot adherence, "done differently", patterns | 364–369 | COMMITTED |
| 31 | VOLUME BALANCE: seeded min-effective-set floors, imbalance checks | 370–374 | COMMITTED |
| 32 | DELOAD MARKERS: dedicated table; adherence quiet; Coach can suggest | 375–382 | COMMITTED, amended |
| 33 | RECORDS VAULT: derived-only ladder + PR history + trophies | 383–390 | COMMITTED |
| 34 | WEEKLY FITNESS CHECK-IN: one derived summary; coach_outputs pipeline | 391–396 | COMMITTED |
| 35 | CARDIO SESSIONS: kind + duration/distance/effort/kcalBurned, MET estimate | 398–408 | COMMITTED, user-shaped |
| 36 | PROGRESSIVE-OVERLOAD SUGGESTION: styles, cadence, overrides, kill-switch | 409–428 | COMMITTED, refined |
| 37 | SUPERSETS: pairWith metadata only; templates only | 430–434 | COMMITTED |

Cross-references: "item N" pointers occur throughout the ledger (e.g. 48, 64,
124, 151, 188, 280, 336, 388, 501–506, 625, 637, 764, 772, 832–860, 1053–1072,
1106–1127, 1266, 1886–1903, 2203–2312, 2334, 2400–2411, 2491–2506, 2609–2623)
and all resolve to the definitions above.

## 2. O-series (Optimizations, one-by-one) — 9 entries

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| O1 | Schema gap fix: workout_templates / workout_template_exercises first-class | 36–44, 258–262, 2302–2305 | ACCEPTED |
| O2 | Bodyweight exercises real records: clean rep count + addedLoadKg | 45–50, 213–214, 1274, 2404 | ACCEPTED |
| O3 | Bodyweight = 7-day rolling average (shared utility) incl. 3.3 RESTATED | 51–65, 170, 630, 637, 687, 1340–1344, 1901, 2233 | ACCEPTED |
| O4 | Last-time hint freshness tiers (<2wk / 2–4wk / >4wk) | 66–69, 149, 450, 457, 1901–1902, 2505 | ACCEPTED |
| O5 | One-tap "apply session deviation to template" | 70–73 | ACCEPTED |
| O6 | Backup/export addendum: new collections enumerated (amended by backup-A1) | 74–90, 729, 560 | ACCEPTED, amended by audit A1 |
| O6-ADD-ON | TRUE cross-device sync (entity sync plane; TOMBSTONE RULE; clash #5) | 92–120, 823, 1783–1786 | ACCEPTED (audit A2 user directive); changes Roadmap |
| O7 | Two-a-day rule: multiple sessions per day allowed | 121–125 | ACCEPTED |
| O8 | Unit strategy: store kg everywhere, display-convert only | 126–129, 1898 | ACCEPTED |

## 3. I-series (third sweep) — 9 entries, all statuses retained

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| I1 | Exercise drill-down: dashboard "Your lifts" + full screen | 165–176, 522, 763, 2406 | ACCEPTED |
| I2 | Deletion semantics: workout.deleted tombstone; derived state re-derives | 105, 147–152, 2223 | ACCEPTED |
| I3 | workout.pr payload enriched with bodyweight + ratio (Coach/toast only) | 131–137, 2407 | ACCEPTED |
| I4 | Actionable pace nudges: gap → kcal gap → DIET/ACTIVITY levers | 153–159 | ACCEPTED |
| I5 | Goal ↔ phase consistency: auto-propose matching phase/goal | 138–140, 647 | ACCEPTED |
| I6 | Next-week preview in check-in | 146 | REJECTED (user declined) |
| I7 | Midnight rule: dayKey = capture-time LOCAL date (+3.6 clarification) | 141–145, 584 | ACCEPTED |
| I8 | Picker ergonomics | 160 | SKIPPED (user declined) |
| I9 | Onboarding flow: first-run Mifflin inputs, proposed plan (customizable) | 161–164, 1905 | ACCEPTED, amended |

## 4. N-series (Feature reviews) — 9 entries, all statuses retained

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| N1 | Injury/limitation tagging (limitations table) | 87, 169, 438–445, 451, 522, 2500–2502 | COMMITTED |
| N2 | Post-deload return guidance (90→95→100% ramp) | 446–451, 2503–2505 | COMMITTED |
| N3 | Warm-up sets (setType column deferred) | 452–454, 530 | SKIPPED for now (user); deferred line kept |
| N4 | Session comparison (side-by-side vs previous same-template) | 175, 455–459, 523 | COMMITTED |
| N5 | Recovery readiness (recovery_log + branches deferred) | 460–462, 530–531, 2515–2517 | SKIPPED for now (user); deferred line kept |
| N6 | Exercise cues/notes (cueNotes col deferred) | 463–465, 530 | SKIPPED for now (user); deferred line kept |
| N7 | Habits bridge: auto-tracked habits (autoSource) + habit.completed_revoked | 150, 466–476, 550, 1509, 1780–1782, 1920, 2182, 2229 | COMMITTED |
| N7-sub | AUTO-TICK XP + ANTI-FARM (clash #4 — RESOLVED, user picked A) | 477–485 | RESOLVED (records full XP only from real sessions; negative XP on revoke) |
| N8 | Session media (polymorphic media anchor deferred to M2+) | 486–489, 530 | SKIPPED for now (user); deferred line kept |
| N9 | Phase close report (coach_outputs snapshot optional) | 175, 184, 490–496, 1126, 2014, 2533–2535 | COMMITTED |

## 5. F-series — 6 entries, all statuses retained

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| F1 | GOAL PROJECTION: "at current pace → ~date" line (honest-estimate) | 177–184, 523, 861, 870, 2406 | COMMITTED |
| F2 | REST-DAY PATTERN DETECTION (Coach pattern alert) | 185–192, 531, 2497–2499 | COMMITTED by user pick |
| F3 | SESSION POST-NOTE | 200 | not selected; dropped from review list |
| F4 | TEMPLATE CLONING ("Duplicate template" → variant) | 193–195 | COMMITTED by user pick |
| F5 | PHYSIQUE-PHOTO CADENCE (monthly nudge, D031 photo) | 196–197, 1118, 1901, 2375–2382 | COMMITTED by user pick |
| F6 | COPY SUMMARY AS TEXT (check-in/phase report → clipboard) | 198–199 | COMMITTED by user pick |

## 6. NU-series (Nutrition session) — 23 entries

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| NU1 | Daily entry model: per-meal receipt lines; day total = SUM of rows | 229–235, 565–571, 678 | LOCKED |
| NU2 | Meal types: seeded presets, user-extendable | 572–574 | LOCKED |
| NU3 | Recipes ("re-meals"); recipeId copy-in at save, never rewrite | 237–240, 575–581, 2320 | LOCKED |
| NU4 | Catch-up / backfill: file under ACTUAL eat date (exception to I7) | 230, 582–589, 667, 696, 767, 2211, 2252, 2268, 2280–2281 | LOCKED |
| NU4a | Soft duplicate guard (audit 3.2/8.4) | 590–595 | LOCKED (soft, non-blocking) |
| NU5 | Scanner + weigh-in seamless: "every input prints the same receipt line" | 244, 596–604, 2234 | LOCKED |
| NU6 | Macro targets derivation: TDEE spine, calorieTarget formula (AUDIT CLOSURE 1) | 608–618, 688, 1905 | LOCKED |
| NU7 | Protein g/kg per phase (cut 2.0 / bulk 1.8 / maintain 1.6) | 62, 619–626, 687, 1907, 2431 | LOCKED |
| NU8 | Weigh-in resolution: first-of-day canonical; honors O3 | 60, 545, 627–638, 2232 | LOCKED |
| NU8-sub (LOW-11) | First-of-day deletion promotes next same-day row | 632–635 | ACCEPTED (audit LOW-11) |
| NU9 | TDEE double-count fix: non-training Mifflin + derived training burn | 639–645, 653, 692, 2412–2416 | LOCKED |
| NU10 | No-phase fallback: goals → maintain default | 646–649, 687 | LOCKED |
| NU11 | Collision detector + day-target owner (deriveMacros = THE owner) | 650–659, 1912 | LOCKED |
| NU12 | Macro-gap bar (live progress line; zero storage) | 657, 676–680, 2250 | LOCKED, reinstated from audit |
| NU13 | Food macro lookup (third producer on NU5 seam; USDA FDC + OpenFoodFacts) | 705–757, 1912–1913 | LOCKED; adds external data dependency (needs DecisionLog entry) |
| ADD-ON 1 | Weekly nutrition check-up (mirrors check-in via coach_outputs) | 660–662 | LOCKED |
| ADD-ON 2 | Quiet meal reminders (on-app-open catch-up only — audit C1) | 663–671 | LOCKED (never push) |
| ADD-ON 3 | Zero-XP logging streak marker ("N days fully logged") | 672–674 | LOCKED (no XP) |
| CLOSURE (1) | Sign convention: signed weekly rate, calorieTarget = TDEE + (rate×7700)/7 | 611, 681–685 | LOCKED |
| CLOSURE (2) | Bodyweight = 7-day rolling average everywhere (per O3) | 686–687 | LOCKED |
| CLOSURE (3) | Manual TDEE freezes auto-recompute until cleared | 688–690, 1906, 2431 | LOCKED |
| CLOSURE (4) | Strength burn conservative + labeled estimate | 690–692, 2416 | LOCKED |
| CLOSURE (5) | Fully-logged-day definition for streak (±20% then C2 → ±10%) | 692–695, 2420 | LOCKED (amended by audit-C2, audit-B3) |
| CLOSURE (6) | Backfill bound: same-day/24h normal vs older "historical" mode | 695–698, 1911 | LOCKED |

## 7. backup-A1–A6 (S12 fix summary — legend: enumeration/sync/events/weekly review/physique anchor/week recap)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| backup-A1 | Backup enumeration incl. nutrition + routine tables + periods | 74, 560, 729, 776 | Locked this round (audit fix) |
| backup-A2 | TRUE cross-device entity sync (new required sync plane; D019) | 92–120, 558, 777–779, 823, 1051, 1783, 1928–1929 | Locked this round (user: true two-way sync) |
| backup-A3 | nutrition.logged + body.weighed metadata-only events | 534–561, 779 | Locked this round (user APPROVED — audit fix) |
| backup-A4 | Coach weekly review merged into Sunday check-in (one weekly surface) | 780, 1573, 1791, 1889, 1980–2000, 2362–2373, 2385–2390, 2527–2532 | Locked this round (user APPROVED — audit fix) |
| backup-A5 | Physique photos anchored to journal entry tagged health+physique (D031) | 781, 1777–1779, 2116, 2375–2382 | Locked this round (user APPROVED — audit fix) |
| backup-A6 | Week recap = glance strip + tap into weekly verdict | 782, 1810, 1859, 2187, 2384–2393 | Locked this round (user APPROVED — audit fix) |

Note: the legend (line 797) names this family "backup-A1–A6" so it is never
confused with census-A or routine-A. The detail block for **backup-A3** is the
"A3 EVENT-LOG COVERAGE FOR NUTRITION/BODY" block (534–561); the legend's
routine-family line describes the same block as "S10-004's event-A3 — NOT
backup-A3" — see §Duplicates & near-duplicates.

## 8. census-A1–A4 (S13-045 trophy-census corrections — SECOND-AUDIT CLOSE)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| census-A1 | NO DEVIATION TOLERANCE: v2 ±3% is truth (Ghost lock typo ±30% fixed) | 1596–1598, 1663 | Fixed in second audit round |
| census-A2 | DUPLICATE BLOCK: stale relative-strength duplicate + stale "Strength Standard Reached" deleted from v2 | 1599–1604 | Fixed (C2-fresh copy survives at v2:346-399) |
| census-A3 | "ONCE PER CALENDAR YEAR" residue scrubbed to M4 anchored-window wording | 1605–1609 | Fixed |
| census-A4 | ROLLING TAPE: v2 capture-pipeline-only wording → first KEPT vlog (captured OR adopted) | 1610–1611 | Fixed (M6 lock) |
| (census context) | CENSUS CORRECTION: true catalog 121 trophies + 47 ladder tiers = 168 named entries | 1578–1590 | Corrected (183 → 168; "Half Century" → "Fifty Push-Ups") |
| (census context) | RING SERIES CENSUS UPDATE: 10 ring trophies added → 131 + 47 = 178 | 1591–1595 | Updated (all claims now read 178) |

## 9. routine-A1–A7 (S20 daily-routine audit round 2 — the SECOND audit round; NOT backup-A)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| routine-A1 | Performed-day model: routine_days + routine_slot_logs (frozen history) | 1838, 2259–2269 | LOCKED (closes structural gap) |
| routine-A2 | Prompt rules: no weekly prompt on unbroken indefinite runs | 2270–2273 | LOCKED (closes R7 hole) |
| routine-A3 | Pack → meal linkage at TEMPLATE level; instance = payload | 2274–2278 | LOCKED (resolves ambiguity) |
| routine-A4 | Midnight rule: routine-day = calendar day; accepted 00:30 display mismatch | 768, 2279–2283 | LOCKED |
| routine-A5 | R1 kind list: meal \| pack \| workout \| activity \| rest \| sleep \| weigh-in (R10) | 2284–2285 | LOCKED (cross-edit) |
| routine-A6 | R2 binding: one binding model (R7 weekly routine + R8 override) | 2187, 2286–2288 | LOCKED (cross-edit) |
| routine-A7 | Single week owner — gym lives inside the routine; week_plans re-purposed | 40, 254, 285, 2289–2306, 2319 | LOCKED (closes hole #2, user-confirmed) |
| routine-A7-sub | WORKOUT SLOT → SESSION PRE-LOAD (briefing Gym tap pre-loads template) | 2296–2301 | LOCKED (user request) |
| routine-A7-sub | SESSION→SLOT LINK (audit 2.2): workouts.routineSlotLogId? nullable | 2307–2313 | LOCKED (audit 2.2) |

## 10. audit-B1–B4 (S12/S21 audit fixes — UI hierarchy section; NOT resolve-B)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| audit-B1 | PR/analytics record mode — weight vs rep-count (no 12-cap on reps) | 180, 783, 1066, 1268, 1274, 2395–2407 | user APPROVED — audit fix |
| audit-B2 | Strength kcal — manual overrides band (no double count) | 653, 784, 2409–2417 | user APPROVED — audit fix |
| audit-B3 | Fully-logged-day definition — no-routine path (2 actual meal logs) | 657, 701, 784–785, 2419–2428 | user APPROVED — audit fix |
| audit-B4 | Manual TDEE freezes ALL targets (protein/fat basis snapshot) | 63, 785, 1745, 1882, 1906, 2430–2437 | user APPROVED — audit fix |
| (summary line) | B5 week_plan_slots.dayTemplateId naming (fix list header) | 786 | Locked this round (see week_plan_slots schema, 254–256) |

## 11. resolve-B1–B5 (B1–B5 RESOLUTION ENTRY — ALL LOCKED Aug 09)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| resolve-B1 | "once per habit" vs "once per anchored year" re-fire map (7 per-trophy lines) | 1614–1641, 1697 | LOCKED (user yes, Aug 09) |
| resolve-B2 | "Real Progress" net-change thresholds: +2.5/+5/+10/+20 kg steps | 1642–1650 | LOCKED (user yes, Aug 09) |
| resolve-B3 | "On Target" band = weekly avg inside ±10% of day's target | 1651–1655 | LOCKED (user yes, Aug 09) |
| resolve-B4 | "Weekly checkpoint" = closed-calendar-week rolling-avg evaluation | 1656–1662 | LOCKED (user yes, Aug 09) |
| resolve-B5 | GHOST tolerance folded into census-A1 (±3%, fixed) | 1663 | LOCKED (folded) |

## 12. audit-C1–C6 (S11/S12 audit fixes)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| audit-C1 | Meal reminders are on-open catch-ups, never push (D018 deferral) | 663, 786, 1908, 1996 | Locked this round |
| audit-C2 | Streak window ±20%→±10% + weekly deviation reporting | 657, 699–703, 787, 1653–1655, 1909, 2425–2426 | user APPROVED |
| audit-C3 | 00:30 snack display mismatch — reviewed, no change | 766–768, 788 | REVIEWED, no change |
| audit-C4 | One-tap "track this exercise" (friction fix on session screen) | 759–764, 788 | user APPROVED |
| audit-C5 | Seed text corrected to ~44 — reviewed, no change | 769, 788 | REVIEWED, no change |
| audit-C6 | Strength kcal band conservative — reviewed, no change | 770–772, 788 | REVIEWED, no change |

## 13. resolve-E1–E3 (E1–E3 resolution entries)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| resolve-E1 | Juggling Act scan kind: count-in-window existence query (NOT rolling mean) | 1664–1670 | LOCKED naming (user yes, Aug 09) |
| resolve-E2 | Took the Time threshold = settings knob, default 14 days/vacation-year | 1677–1683 | LOCKED (user yes, Aug 09) |
| resolve-E2-sub | E2 VACATION-KEY UNION (audit E-clash #5): day-level union, never per-period add | 1684–1692 | LOCKED (audit E-clash #5) |
| resolve-E3 | Perfect Month vs grace: grace is streaks only; graceful miss = empty day = no fire | 1671–1676 | LOCKED RECORD (user yes, Aug 09) |

## 14. spec-E0–E13 (S13-016 achievement spec shared trigger engine)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| spec-E0–E13 | Shared trigger engine range (rung tables R1–R47, DEPENDENCIES table) | 811, 988–991 | Referenced as the spec's engine span; authoritative file is TEMP-PLANNING-Achievement-Spec.md |
| spec-E12 | "One Coach line AT MOST per trophy fire" — cited in Coach map | 2443, 2549 | Referenced lock |
| spec-E13 | Range endpoint only | 811, 989 | Referenced only as span end (no standalone text in this file) |

Nominal span = 14 IDs (E0–E13); explicit citations in TEMP-PLANNING.md touch
E0 (span start), E12, E13 (span end). E1–E11 appear only as span members.

## 15. TENSION 1–15

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| TENSION 1 | M2 PLANNED-REST EVENT: habit.rest_planned metadata event; streak FREEZE semantics | 1034–1051, 1360–1361 | LOCKED (user yes) |
| TENSION 2 | M2 ACCOUNT ANCHOR DATE: "day one" = MIN(occurredAt), frozen, immutable | 1022–1033 | LOCKED (user yes) |
| TENSION 3 | M2 isImported enforced at calculation time (global flag; 2 arms incl. 3-question gate) | 1008–1021 | LOCKED (user yes) |
| TENSION 4 | M2 VLOG DURATION stored field: durationSec measured once (keep/discard loop) | 1309–1336 | LOCKED (user yes) |
| TENSION 5 | M2 STRENGTH STANDARDS SEED: frozen 5-tier values for bench/squat/DL/OHP | 1052–1077, 1266, 1301–1303 | LOCKED (user yes) + THRESHOLD-TO-RANK MAP (E-clash #3, 1078–1088) |
| TENSION 6 | M2 E 1RM SINGLE-FUNCTION RULE: one est1RM(weightKg, reps) owner | 1263–1270, 1301 | LOCKED (user yes) |
| TENSION 7 | M2 ROLLING-WINDOW PRIMITIVE: rollingWindowMean(series, windowDays) | 1337–1345 | LOCKED (user yes) |
| TENSION 8 | M2 SIX-DOMAIN PRESENCE: dayDomainPresence(dayKey) + check-and-fire | 1106, 1246–1262 | LOCKED (user yes) |
| TENSION 9 | M2 WRIST/ANKLE PRESENCE — deferred-with-door-open | 1089–1097 | DEFERRED (user directed walk-through to move on; door left OPEN) |
| TENSION 10 | M2 STALL RULE: stallRule(phase), 4 weekly deltas, recovery 2 | 1110–1121 | LOCKED (user yes) |
| TENSION 11 | M2 MONTH-DAY MATCHER: sameMonthDay(a,b,toleranceDays=1) | 1098–1103 | LOCKED (user yes) |
| TENSION 12 | M2 TWO-DOMAIN SAME-DAY JOINS: dayDomainPresence + targeted day queries | 1103–1109 | LOCKED (user yes) |
| TENSION 13 | M2 PHASE-ADJACENCY: phaseAdjacency(phaseId) | 1122–1132, 1136 | LOCKED (user yes) |
| TENSION 14 | M2 YEARLY REST / META-STREAK: rings (B) count-based forever + Ouroboros (C) 10 consecutive years | 1147–1182, 1204 | LOCKED (user yes Aug 09; RING SERIES LIST 1172–1182) |
| TENSION 15 | M2 WRITTENAT: occurredAt is trophy evidence; writtenAt = operational truth only | 1036, 1209–1227, 1757 | LOCKED (user yes) |

Closeout line (1096–1097): "1–8, 10–15 LOCKED, 9 = deferred-with-door-open."

## 16. clash #1–6

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| clash #1 | DASHBOARD BLOCK ORDER: MVP order stays, EXCEPT "Today" fusion (briefing+habits+capture); RESOLVED, Option C | 911, 2323–2331 | RESOLVED, user picked Option C |
| clash #2 | M1 GOALS → PROGRESS OWNER: computed-only goal progress; goal.progress retired | 836–845 | RESOLVED, user picked A |
| clash #3 | coach_outputs.kind DICTIONARY: full kind set enumerated (doc-only list) | 846–854 | RESOLVED, user picked A |
| clash #4 | AUTO-TICK XP + ANTI-FARM: auto-ticked habit = real completion, same gate | 477–485 | RESOLVED, user picked A |
| clash #5 | ROADMAP ORDERING: full data-sync plane BEFORE old P2.5 photo sync | 114–120 | RESOLVED, user picked A |
| clash #6 | JOURNAL TEXT PRIVACY STAMP: "facts only" vs "needs text access" per feature | 1768–1776 | RESOLVED, user picked A |

## 17. audit E-clash 1–5

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| E-clash #1 | EMPTY-WEEK RULE (Trimester) + SCHEDULE-NEVER-BREAKS EMPTY WEEKS (same vacuous-pattern fix) | 1443–1451, 1565–1572 | LOCKED (user yes Aug 09) |
| E-clash #2 | — | — | **GAP:** family range "E-clashes 1-5" (994) implies five entries; #2 is never explicitly labeled anywhere in TEMP-PLANNING.md. Flagged for reconciliation. |
| E-clash #3 | THRESHOLD-TO-RANK MAP: Beginner/Novice/Intermediate/Advanced/Elite; fires only ranks 2–4 | 1078–1088 | LOCKED (user yes Aug 09) |
| E-clash #4 | TONNAGE DEFINITION: weight-mode sets ONLY (weightKg×reps); bodyweight/addedLoadKg never counted | 1271–1281 | LOCKED (user yes Aug 09) |
| E-clash #5 | E2 VACATION-KEY UNION: day-level union for vacation-day totals | 1684–1692 | LOCKED (user yes Aug 09) |

## 18. M0–M7 (existing-system audit blocks, LIVING SECTION)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| M0 (journal/media) | Journal/media touchpoint = backup-A5 only; D028–D038 unchanged | 1777–1779 | Identified (no other M0 change) |
| M0 (habits) | N7 auto-track bridge + habit.completed_revoked respected by M2 | 1780–1782 | Identified |
| M1 GOALS → goals.kind | kind + nullable exerciseId/targetValue from the START | 831–835 | STRONGLY recommended |
| M1 GOALS → PROGRESS OWNER | clash #2 — computed-only progress, single H3 owner per goal kind | 836–845 | RESOLVED, user picked A |
| (M-audit) coach_outputs.kind DICTIONARY | clash #3 — full kind set enumerated (daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert) | 846–854 | RESOLVED, user picked A |
| M1 GHOST-ACTIVE OVERLAP ENGINE | runAlive(component, dayKey) + robotOverlapWindow(); no-grace; HARD MISS | 1367–1417, 1598 | LOCKED (user yes; audit missing feature M1) |
| M2 ANALYTICS | Analytics Engine spec = one H3 owner function per stat; seeded list + full catalog | 855–871 | Locked (engine spec deferred to docs pass) |
| M2 COACH → ACHIEVEMENT RECOGNITION TIE-IN | Coach reacts only; LOUDNESS TAXONOMY (Ring/Grove only) | 872–883 | LOCKED (user yes) |
| (M2) WEIGHT LADDER = V2 TROPHY THRESHOLDS | 70·75·80·85·90·95·100 kg; v2 file is canonical (131+47=178) | 884–898 | LOCKED (user yes) |
| M2 DERIVED-ONLY GUARANTEE | one owner per stat; rounding once in owner | 899–906 | LOCKED (user yes) |
| M2 DASHBOARD BLOCKING ORDER | render order list; heavier blocks after skeleton shimmer | 907–917 | LOCKED (user yes) |
| (M2) UI/UX ORDERING SET ASIDE | nav/layout ordering deferred to end of design process | 918–922 | Deferred (user directive) |
| M2 COACH RULE BOOK | separate full session; carry-over locks enumerated | 923–933, 2590–2597 | Scheduled (user directive) |
| M2 MILESTONE-REVIEW CARD | only at goal end (won or expired); reviews NEVER give XP | 934–949, 2538–2539 | LOCKED (user yes) |
| M2 PHONE↔PC PARITY | all features both platforms except PC archive (J7) | 950–958 | LOCKED (user yes) |
| M2 ANTI-FARM AUDIT | (1) media XP rides journal cap; (2) XP reversal symmetric (negative XP event) | 959–967 | LOCKED (user yes, two patches) |
| M2 GAMIFICATION / ACHIEVEMENT CATALOG | v2 = ONE canonical home; TEMP-PLANNING-Achievements.md SUPERSEDED; 178 entries preserved; ZERO XP | 968–981, 2545, 2552 | LOCKED (user yes/confirmed) |
| (M2) ACHIEVEMENT FILE RELATIONSHIP | 3 layers, one truth; docs-pass rules (a)–(e) | 982–1007 | LOCKED (draft deferred) |
| M2 isImported ENFORCED (TENSION 3) | import-exclusion inside every H3 owner; imports never earn | 1008–1021 | LOCKED (user yes) |
| M2 ACCOUNT ANCHOR DATE (TENSION 2) | frozen MIN(occurredAt) real-event anchor | 1022–1033 | LOCKED (user yes) |
| M2 PLANNED-REST EVENT (TENSION 1) | habit.rest_planned metadata event; freeze-not-advance | 1034–1051 | LOCKED (user yes) |
| M2 STRENGTH STANDARDS SEED (TENSION 5) | frozen men/women seed values; 4 canonical lifts; per-lift per-tier trophy | 1052–1088 | LOCKED (user yes) |
| M2 WRIST/ANKLE PRESENCE (TENSION 9) | deferred-with-door-open; string-enum body-part extension later | 1089–1097 | DEFERRED |
| M2 MONTH-DAY + TWO-DOMAIN UTILITIES (TENSION 11/12) | sameMonthDay + dayDomainPresence joins | 1098–1109 | LOCKED (user yes) |
| M2 STALL RULE (TENSION 10) | stallRule(phase); "Broke the Plateau" fires once on recovery | 1110–1121 | LOCKED (user yes) |
| M2 PHASE-ADJACENCY (TENSION 13) | phaseAdjacency(phaseId); "The Turn" | 1122–1132 | LOCKED (user yes) |
| M2 TURN-OF-THE-PAGE DEPENDENCY | phaseStartWindow(phaseId) owner; query class distinct from T13 | 1133–1146 | LOCKED (user yes; audit clash C3) |
| M2 YEARLY REST / META-STREAK (TENSION 14) | rings STACK FOREVER + Ouroboros ultra; 10 named ring trophies | 1147–1182 | LOCKED (user yes Aug 09) |
| M2 YEARLY META-STREAK PRIMITIVE (audit finding M3) | yearlyPass(criterion, anchor) + consecutiveYears(booleans, N) | 1184–1208 | LOCKED (user yes) |
| M2 WRITTENAT (TENSION 15) | occurredAt = trophy evidence; writtenAt = operational truth | 1209–1227 | LOCKED (user yes) |
| M2 ANNIVERSARY WINDOW PRIMITIVE (audit finding E) | anniversaryWindow(anchorDate, k, ±toleranceDays); 2 trophies consume it | 1228–1245 | LOCKED (user yes Aug 09) |
| M2 SIX-DOMAIN PRESENCE (TENSION 8) | dayDomainPresence; naive per-day scan ACCEPTED; check-and-fire | 1246–1262 | LOCKED (user yes) |
| M2 E 1RM SINGLE-FUNCTION RULE (TENSION 6) | one est1RM owner; B1 mode routing | 1263–1270 | LOCKED (user yes) |
| M2 TONNAGE DEFINITION (E-clash #4) | weight-mode only; rep-mode contributes zero | 1271–1281 | LOCKED (user yes Aug 09) |
| (M2) MMA ABSOLUTE-LIFT MILESTONES | "ACTUAL-LIFT-ONLY" — real set ≥ threshold & reps ≥ 1; no est1RM substitution | 1282–1296 | LOCKED (user yes) |
| M2 RELATIVE-RATIO + STANDARDS METRIC (audit clash C2) | est-1RM ÷ rolling BW; same metric as standards seed | 1297–1308, 1601–1603 | LOCKED (user yes) |
| M2 VLOG DURATION (TENSION 4) | durationSec stored once; keep/discard lifecycle; tier-aware delete | 1309–1336 | LOCKED (user yes) |
| M2 ROLLING-WINDOW PRIMITIVE (TENSION 7) | rollingWindowMean; caloriePaceWindow glass added | 1337–1345 | LOCKED (user yes) |
| M2 STREAK GRACE | 1 grace day per 7-day window; shared budget; robot-consistency EXEMPT | 1346–1366, 1673 | LOCKED (user choices) + clash-fix #4 boundary |
| M2 TRIMESTER WEEKLY TARGET (audit missing feature M2) | target = schedule itself (Option A); calendar week; rest-frozen cap 1; EMPTY-WEEK E-clash #1 | 1418–1453 | LOCKED (user yes Aug 09; four decisions given) |
| M4 YEAR (audit missing feature M4) | anchored 365-day windows per domain; six-domain family = ONE global anchor; Bookended = named exception | 1454–1494, 1169, 1241, 1462–1464, 994–995, 1606 | LOCKED (user yes; Option 2) |
| M5 (year bucketing/re-arm) | rides M4: year = window index N; "Year 1/2/…/N" labels | 1489–1492 | LOCKED (rides M4) |
| M6 QUALIFYING ENTRY (audit missing feature M6) | qualifyingEntry(domain, dayKey) one definition; six bars + two derived lines; word-trophy carve-out | 1495–1543, 1611 | LOCKED (user yes; options C2/C3/C4/C5 stamps) |
| M7 LOOSE-END TRIO (audit leftovers) | Unprompted domain list (body excluded); ELITE TIER intentional no-trophy; Schedule-never-breaks rest-day + empty-week | 1544–1572 | LOCKED (user yes) |
| M2 COACH → merged | rule catalog deferred to M2; one list to be written | 1573–1576 | Pending, not built |
| (context) | MILESTONE-LEVEL: O6-A2 entity-sync plane = REQUIRED new milestone | 1783–1786 | Roadmap restructure pending approval |

## 19. G1–G20 (+G7b) — trigger pins (audit G-list; batch 1 + batch 2 + G19 correction)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| G1 | 30-MIN SLOT ANCHOR (robot-consistency runs anchor to first completion) | 1708–1712 | LOCKED (user yes Aug 09) |
| G2 | SAME-QUESTION RE-ARM: fires at 2, 3, 5 distinct years, one-time each | 1700–1702 | LOCKED |
| G3 | THEN AND NOW N: third threshold = 3 years | 1713–1715 | LOCKED |
| G4 | COUNT-MILESTONE UNIT: distinct qualifying days (never entry multiplicity) | 1716–1719 | LOCKED |
| G5 | JUGGLING ACT CADENCE: once per closed qualifying 21-day window | 1694–1697 | LOCKED |
| G6 | TRIFECTA WEEK CADENCE: once per closed 7-day window with all three PRs | 1698–1699 | LOCKED |
| G7b | BACK-AT-IT PR: any prior PR across any exercise (not per-exercise) | 1703–1705 | LOCKED (user pick) |
| G8 | FULL-YEAR-ONE-HABIT ANCHOR: 365-day window anchors at that habit's first completion | 1720–1722 | LOCKED |
| G9 | LIVING ARCHIVE WINDOW: 200 entries + 100 vlogs + 100 workouts in ONE window | 1723–1725 | LOCKED |
| G10 | WEEK DEFINITION: ISO Mon–Sun calendar weeks (A Week Whole, literal v2 text) | 1726–1728, 1882–1883 | LOCKED |
| G11 | CALENDAR MONTH: Frame by Frame = true calendar months | 1729–1730 | LOCKED |
| G12 | BOOKENDED 40% FLOOR: FLOOR(0.40 × days-in-year) — 146/146 | 1731–1735 | LOCKED |
| G13 | EYES-ON-THE-DATA WINDOW: any 7-day band containing confirmation day (containment) | 1736–1738 | LOCKED |
| G14 | ACTIVE-PHASE REQUIRED (Real Progress half) | 1739–1742 | LOCKED |
| G15 | ACTIVE-PHASE REQUIRED (On Target half) | 1739–1742 | LOCKED (co-labeled with G14) |
| G16 | PACED 80% THIN WEEKS: thin weeks count neither for nor against | 1743–1746 | LOCKED |
| G17 | FULL CYCLE PARTIAL WEEKS: ≥1 qualifying workout makes a partial week count | 1747–1750 | LOCKED |
| G18 | SAME-HOUR WEIGH-IN ANCHOR: weekday + 30-min slot anchored to first weigh-in | 1751–1757 | LOCKED |
| G19 | FIVE STRONG: STRICT CONSECUTIVE days only — grace-carrying weeks do NOT count | 1763–1767, 995 | LOCKED (user REVERSED the default) |
| G20 | PB-ALONE DAY-ONE SCOPE (verified-consistent, no pin required) | 1758–1762 | Checked — no action needed |

**G7 note:** only G7b (line 1703) exists in the file; the plain G7 label never
appears. G14/G15 are co-labeled in one line (1739). G-list batch structure
noted at 1693 ("G-LIST BATCH 1") and 1706–1707 ("G-LIST TRIGGER PINS — ALL
items of the audit G-list; batch 1 + batch 2 + G19 correction").

## 20. J1–J7 (Journal-side features, Part B) + J7 a–g + journal audit optimizations

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| J1 | "ON THIS DAY" MEMORY STRIP (pure derived; MEDIA STUBS audit fix 6; LEAP DAY audit C2) | 1102, 2030–2042 | LOCKED (user yes) |
| J2 | JOURNAL SEARCH (offline; simple matching; privacy facts-only) | 2043–2054, 2147 | LOCKED (user yes) |
| J3 | BATCH IMPORT OF PAST ENTRIES (imported flag; dedupe hash; dayKey = original date) | 1010, 1924–1926, 2055–2078, 2173 | LOCKED (user yes) |
| J4 | "QUIET WEEK" (user-marked range; guilt muted; streaks stay REAL) | 880, 930, 1046, 1353, 2079–2095, 2557–2561, 2594 | LOCKED (user yes) |
| J5 | ANNUAL "YEAR BOOK" EXPORT (PDF; pure artifact; MEDIA STUBS audit fix 3) | 1924–1926, 2096–2110, 2578–2579 | LOCKED (user yes; PDF needs DecisionLog entry) |
| J6 | JOURNAL TAG/AREA FILTER VIEW (derived only) | 2114–2118 | LOCKED (user yes) |
| J7 | PC VIDEO LIBRARY — "MY VIDEOS" (PC-only; title column; search; auto-adopt option 1) | 952, 1314–1335, 2119–2136 | LOCKED (user yes + auto-adopt option 1) |
| J7a | MERGE, DON'T ADD — videos home inside existing Desktop vault browser | 2138–2145 | user approved ALL (J7 audit fixes) |
| J7b | SHARED SEARCH UTILITY (one H3-style matcher for J2 and J7) | 2146–2148 | user approved ALL |
| J7c | ADOPTED ≠ APP-STORAGE (adopted rows excluded from storage meter) | 2149–2152 | user approved ALL |
| J7d | DEDUP STILL APPLIES (content-hash dedupe on folder scan) | 2153–2154 | user approved ALL |
| J7e | REUSE archived-to-pc STATUS (no new enum) | 2155–2157 | user approved ALL |
| J7f | BACKEND-AGNOSTIC (logical schema only) | 2158–2161 | user approved ALL |
| J7g | BROWSER COVERAGE (audit MED-16): auto-adopt requires Chromium | 2162–2165 | user approved ALL |
| J-AUDIT-1 | MONTH FACT LINE — filter-aware wording ("N days logged" vs "N days journaled") | 2167–2169 | user: apply all |
| J-AUDIT-2 | JOURNAL XP CAP — first 2 content-gated entries/day only | 2170–2172 | user: apply all |
| J-AUDIT-3 | J3 dayKey = original date (locked in J3) | 2173 | user: apply all |
| J-AUDIT-4 | J4 quiet week covers day-view drought line (locked in J4) | 2174–2175 | user: apply all |
| Part-B DECLINED #2 | Daily question prompt | 2111–2113 | DECLINED (user passed, do not re-propose) |
| Part-B DECLINED #3 | Draft tray | 2111–2113 | DECLINED (user passed, do not re-propose) |
| Part-B DECLINED #4 | Day-end one-liner | 2111–2113 | DECLINED (user passed, do not re-propose) |
| Part-B DECLINED #7 | Energy tags | 2111–2113 | DECLINED (user passed, do not re-propose) |

## 21. R1–R12 (daily routine template session)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| R1 | SCOPE: full-day templates, typed slot kinds | 2179–2182, 2284–2285 | LOCKED |
| R2 | DAY TEMPLATES: day_templates + day_template_slots | 2183–2188, 2286–2288, 2292 | LOCKED |
| R3 | WEEK BINDING: week calendar binds day templates per Mon–Sun slot | 2189–2194 | LOCKED (reframed — see R7) |
| R4 | PACK SLOTS: pack = own kind; packId → meal slotId; consumed at eat time | 2205–2211, 2265 | LOCKED |
| R5 | TEMPLATE BUILDING: copy previous day; past days frozen | 2212–2215, 2264 | LOCKED |
| R6 | TIE-INS: kind is the extension seam | 2226–2230 | LOCKED |
| R7 | WEEKLY ROUTINE SELECTION: named 7-slot binding lists; period-scoped | 2187, 2195–2204, 2287–2288 | LOCKED (user request) |
| R8 | PER-DAY OVERRIDE: single day overridden without forking routine | 2187, 2216–2220, 2287 | LOCKED (closes hole) |
| R9 | DELETE SEMANTICS: future bindings only; frozen days keep copied data | 2221–2225 | LOCKED (closes hole) |
| R10 | WEIGH-IN SLOT: new slot kind; NU8 first-of-day applies | 2231–2234, 2285 | LOCKED |
| R11 | WEEK RECAP: glance strip; denominators (audit 2.4) | 2235–2241, 2264–2265, 2335, 2384–2389, 2531–2532 | LOCKED |
| R11-sub (LOW-6) | STRIP WINDOW: strip summarizes DISPLAYED week; verdict window stays S15-003 | 2242–2247 | LOCKED (audit LOW-6) |
| R12 | MORNING BRIEFING CARD: today's slots, done-vs-missing, macro-gap bar | 2248–2250, 2264, 2318, 2326 | LOCKED |
| R12-sub (LOW-18) | BACKFILL SEMANTICS: backfilled meal marks slot done in THAT date's view | 2251–2255 | LOCKED (audit LOW-18) |

## 22. H1–H4 (UI hierarchy principle)

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| H1 | DAILY LOG = ONE TAP (layout default only) | 2317–2321 | ACCEPTED, no new work |
| H2 | ONE WEEKLY SURFACE (consolidation of check-in surfaces) | 1791, 1863, 2333–2341, 2365–2373, 2385 | user ACCEPTED — Option A |
| H3 | ONE-OWNER DERIVED MATH (single owner function per stat) | 651, 838, 855, 877, 900, 955, 1012, 1792, 1811–1856, 1933, 1953, 2005, 2146, 2169, 2343–2350, 2392, 2481 | user ACCEPTED — build discipline |
| H4 | REVEAL-ON-FIRST-DATA (no empty feature rooms; first-touch escape hatch) | 1800, 1870–1873, 1935, 1988, 2008, 2036, 2352–2360 | user ACCEPTED |

## 23. "[x]"-prefixed Remaining Open Items checklist

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| [x] RPE column | RIR/reps-in-reserve column — REMOVE rpe? from exercise_sets schema | 2601–2603 | REJECTED (user, lookups #1) |
| [x] Exercise seed list | ~44 pre-loaded lifts; categories + muscle roles + progression flags | 2604–2619 | APPROVED as proposed (user, lookups #3) |
| [x] Exercise categories | push \| pull \| legs \| core \| cardio seeded column | 2620–2623 | APPROVED (user, lookups #2) |
| [x] NUTRITION | NU1–NU12 + add-ons + audit closures locked; R1–R12 + A1–A7 separate | 2624–2629 | Fully locked |
| [x] LIFE TREE | IDEA RECORDED — huge life-tree UI; not a locked spec; confirmed premises 1–4; M2 scope | 2630–2652 | IDEA RECORDED (user vision, NOT a locked spec) |

## 24. Unscoped Future Ideas list

| ID | Short label | Source lines | Status text found |
|----|-------------|--------------|-------------------|
| FUT-1 | Muscle map / body-light-up graphics | 2656–2659 | REJECTED by user — do not resurrect without a new strong use case |
| FUT-2 | Rest/recovery tracking (sleep, rest days, readiness) | 2660–2661 | Raised, not scoped |
| FUT-3 | Body measurements beyond weight (waist/chest/arms) | 2662–2663 | Raised, not scoped |
| FUT-4 | Macro targets per phase (protein target for bulk/cut) | 2664 | Raised, not scoped |
| FUT-5 | PERIODIZATION (parked, design note) | 2665–2671 | Parked — revisit when user is 12+ months consistent |

## 25. Coach Consolidated Map — named Coach rules (author-sourced ledger citations carried verbatim)

| ID | Short label | Source lines (author's ledger citations) | Status text found |
|----|-------------|--------------|-------------------|
| Coach-rule | stallRule(phase) | ledger:1022-1033; spec:632 | Locked; catalog grows in rule-book session |
| Coach-rule | Plan-adherence (item 30) | ledger:358-363 | Locked |
| Coach-rule | Volume balance (item 31) | ledger:364-368 | Locked |
| Coach-rule | Rest-day pattern detection (F2) | ledger:182-187 | Locked |
| Coach-rule | Reasonable failure / limited-not-lazy (N1) | ledger:435-439 | Locked |
| Coach-rule | Post-deload/return ramp (N2) | ledger:440-445 | Locked |
| Coach-rule | Deload suggestion after sustained low adherence (item 32) | item 32, ledger:374 | Locked |
| Coach-rule | Journal drought | ledger:1990-1991; CoachSystem.md | Locked |
| Coach-rule | Pace/bulk lines | ledger:55-58, 606-608 | Locked |
| Coach-rule | Missed-habit warnings live in Coach reflection, never calendar tint | ledger:1739-1741 | Locked |
| Coach-rule | Deferred: recovery-readiness branches (N5) | ledger:454-455 | Deferred (revisit anytime) |
| Coach-rule | (Outputs §4) Daily note / day-view line / nudges / weekly review / phase close / milestone review / achievements | ledger:1763-1764, 1794, 648-666, 2243-2253, 646-648, 2264-2273, 484-490, 875-880, 1881-1897, 1043, 813-824, 1328, 1364, 914-916, 1465-1470, 1976-1992, 1873-1874, 369-372, 955-962, 820-822, 1679-1687, 2030, 1952, 1998, 1894-1896, 1977, 1834-1840, 864-868, 869-874 | Locked (index; nothing supersedes original locks) |

**Coach-map ledger citation spot-check (all 41 carried citations checked
against the contiguous read; verdicts below).** ⚠ = flags the author's
pointer appears to target a different passage (recorded, NOT corrected):

| Author's citation | Map claim | Verdict |
|---|---|---|
| ledger:20-23 | pace math, no new subsystem | ✓ matches (items 5, lines 20–23) |
| ledger:55-58, 606-608 | pace/bulk lines | ✓ matches (56–60; 616–618) |
| ledger:128-133 | workout.pr Coach/toast-only | ≈ (131–137 I3) |
| ledger:182-187 | rest-day pattern F2 | ✓ (185–192) |
| ledger:300, 469, 502, 525-544 | event log + compensating revokes | ≈ (301–306; 470–472; 502; 534–561) |
| ledger:358-363 | plan-adherence | ≈ (364–369; 358–363 is item 29 tail) |
| ledger:364-368 | volume balance | ≈ (370–374) |
| ledger:369-372 | deload ranges | ≈ (377–381) |
| ledger:374 | deload suggestion | ⚠ (380–381 is the "Coach can suggest a deload" line) |
| ledger:379-380, 128-133 | workout.pr is Coach/toast ONLY, not vault truth | ⚠ (the "NOT workout.pr events — Coach/toast only" text is 383–389; 379–380 is item 32's journal-side note) |
| ledger:435-439 | N1 injury family | ≈ (438–445) |
| ledger:440-445 | N2 return ramp | ≈ (446–451) |
| ledger:454-455 | N5 deferred recovery | ≈ (460–462) |
| ledger:484-490 | N9 phase close report | ✓ (490–496) |
| ledger:547 | ~10k events/yr engine budget | ⚠ (557 is the "10k/yr design budget" line) |
| ledger:648-666 | nudges non-naggy, no push | ≈ (660–671) |
| ledger:646-648 | weekly nutrition check-up | ≈ (660–662) |
| ledger:813-824 | Coach reacts, never creates/grants | ≈ (872–883) |
| ledger:820-822 | facts-only default | ⚠ (880–882 is facts-only; 820–822 is the docs-adaptation WORKFLOW note) |
| ledger:841-845 | trophy & Coach line = same number | ⚠ (903–904 is the "literally the same number" text; 841–845 is clash #3) |
| ledger:864-868 | UI/UX ordering pass timing | ⚠ (918–922 is UI/UX ORDERING SET ASIDE) |
| ledger:869-874 | carry-over locks for rule-book session | ⚠ (928–933) |
| ledger:875-880, 1881-1897 | milestone review card/cadence | ⚠ 875–880 (934–949 is milestone-review card); ✓ 1881-1897 |
| ledger:914-916 | trophies ZERO XP | ⚠ (976–977 is ZERO XP; 914–916 is dashboard blocking order) |
| ledger:955-962 | planned-rest parsing | ⚠ (1040–1051) |
| ledger:1022-1033 | stallRule | ⚠ (1110–1121; 1022–1033 is ACCOUNT ANCHOR DATE) |
| ledger:1043 | phase-adjacency helper | ⚠ (1124–1132) |
| ledger:1328, 1364 | celebrations fire once per run/landing | ⚠ (closest: 1416–1417 Ghost, 1452–1453 Trimester) |
| ledger:1465-1470 | Elite tier zero-trophy | ⚠ (1553–1558; 1465–1470 is inside M4 YEAR) |
| ledger:1679-1687 | text-analysis opt-in gate | ⚠ (1768–1776; 1679–1687 is resolve-E2) |
| ledger:1739-1741 | missed-habit warnings in Coach, not tint | ⚠ (1828–1830; 1739–1741 is G14/G15) |
| ledger:1763-1764 | day-view Coach line | ⚠ (1852–1853; 1763–1764 is G19/G20) |
| ledger:1794 | Coach notes in calendar day view (default on) | ⚠ (1887–1888) |
| ledger:1834-1840 | formulas/weights not offered as toggles | ⚠ (1931–1937) |
| ledger:1873-1874 | vacation/period quiets adherence | ⚠ (1970–1971) |
| ledger:1894-1896 | milestone-review cadence editable | ✓ (1894–1896, identical) |
| ledger:1952 | Coach gets NO journal text | ⚠ (closest: 2038 J1 facts-only, 2050–2051 J2; 1952 is Periods) |
| ledger:1977 | quiet-week range | ⚠ (2079–2080 J4 start) |
| ledger:1976-1992 | J4 quiet week | ⚠ (2079–2095) |
| ledger:1990-1991 | journal drought nudge | ⚠ (closest: 2081–2082 J4, 1853 day-view line; 1990–1991 is Milestone review cadence) |
| ledger:1998 | J5 pure artifact | ⚠ (2101–2102) |
| ledger:2030 | Coach never inspects video content | ⚠ (2133–2134) |
| ledger:2243-2253 | weekly review (A4) one surface | ⚠ (2362–2373; 2243–2253 is R11/R12) |
| ledger:2264-2273 | R11 strip = glance, A4 = verdict | ⚠ (2384–2393) |
| ledger:2443 (self) | achievement spec (E12) | n/a (self-citation of the map's own section) |

Summary: 4 exact ✓, 12 approximate ≈, 26 flagged ⚠ (17 clearly off-target,
9 near-but-off). Recommendations: re-anchor Coach-map citations during the
docs pass; do NOT treat these pointers as authoritative line numbers.

---

## Referenced external families (cross-file IDs cited inside TEMP-PLANNING.md)

### D-series (DecisionLog entries) — all resolve to real entries in docs/DecisionLog.md (verified)

| ID | Short label | Source lines | Status in DecisionLog.md |
|----|-------------|--------------|--------------------------|
| D001 | Event-first architecture | 536, 2473 | exists (D001) |
| D003 | No profile/identity system ("settings, not a profile") | 621 | exists (D003) |
| D004 | Coach rule-based, AI optional | 32, 2451, 2442 | exists (D004) |
| D005 | Drive integration phased — cited as "D5 discipline" (alias) | 2135 | exists (D005) |
| D007 | Storage backend deferred to M0 spike | 109 | exists (D007; resolved by D040) |
| D013 | Media Repository abstraction | 89, 2380 | exists (D013) |
| D017 | MVP Coach stub rule | 2460, 2442 | exists (D017) |
| D018 | Push notifications deferred | 664 | exists (D018) |
| D019 | Sync conflict policy LWW + deviceId | 86, 99–120, 143, 536, 779, 2473 | exists (D019) |
| D028–D038 | Media decisions, unchanged by ledger | 1779 | all exist (D028–D038 in DecisionLog.md) |
| D030 | Vlog local buffer | 1917 | exists (D030) |
| D031 | Physique-photo timeline | 197, 1104, 1961, 2376–2378, 2663 | exists (D031) |
| D035 | PC-exclusivity guardrail | 2120, 2144 | exists (D035) |
| D040 | "Next DecisionLog number when formally decided" | 5, 822 | **now exists** (D040 — Drift + SQLite WASM; accepted) |

### S-series (spec/section codes cited from the legend and ledger)

| ID | Short label | Source lines |
|----|-------------|--------------|
| S1-006 | phase-pace owner citation (paceVerdict) | 869 |
| S10-004 | routine-family legend citation ("its event-A3") | 801 |
| S11 | audit-C home section tag | 807 |
| S12 | backup-A / audit-B / audit-C home section tag | 797, 803, 807 |
| S13-011 | Coach carry-over list | 191 |
| S13-014 | negative XP symmetry | 513 |
| S13-016 | spec-E shared trigger engine | 811 |
| S13-040 | WEEK STARTS ON convention | 2198 |
| S13-045 | census-A trophy census | 799 |
| S15-002 | calendar week-grid first column | 1892 |
| S15-003 | weekly review-day window | 1882, 1889–1893, 2245–2246, 2368 |
| S20 | routine-A daily-routine audit round 2 | 801 |
| S21 | audit-B fixes round | 803 |

### Other external references

| ID | Short label | Source lines | Resolution |
|----|-------------|--------------|------------|
| P2.5 | Roadmap milestone (metadata & thumbnail sync) | 86, 93, 115–117 | exists in docs/Roadmap.md (Milestone 4); TEMP-PLANNING clash #5 re-sequences it |
| v2 (file) | PersonalOS-Achievements-v2.md — canonical catalog, 131 trophies + 47 rungs = 178 | 893–897, 968–981, 984–987, 1578–1611 | exists at repo root; author citations v2:199-206, v2:346-399, v2:405, v2:466-492 carried verbatim (1234, 1236, 1604, 2554) |
| spec (file) | TEMP-PLANNING-Achievement-Spec.md — trigger layer | 988–1007, 2490 (spec:632) | exists at repo root |

## Audit-item cross-reference labels (referenced labels, not definitional IDs)

| ID | Short label | Source lines | Notes |
|----|-------------|--------------|-------|
| audit 1.5 | weekly-window rule | 1888 | reference only |
| audit 1.6 | periods extraEntityIds ragged edges | 1962 | reference only |
| audit 2.2 | session→slot link | 2307 | sub-entry of routine-A7 |
| audit 2.3 | days-logged definition | 1855 | reference only |
| audit 2.4 | week-recap denominators | 2239 | sub-entry of R11 |
| audit 2.5 | known meal windows | 668 | sub-entry of NU ADD-ON 2 |
| audit 3.1 | N7 compensating event transactional | 473 | sub-entry of N7 |
| audit 3.2 | NU4a duplicate guard | 590 | sub-entry of NU4a |
| audit 3.3 / 3.3 RESTATED | phase-start thin-data rule | 56–60, 2025 | RESTATED clause (O3 block) |
| audit 3.4 | period date-range INCLUSIVE | 1952 | reference only |
| audit 3.6 | I7 under-sync clarification | 142–145 | reference only |
| audit 4.2 | revoke events transactional with row change | 549 | sub-entry of backup-A3 |
| audit 4.3 | TOMBSTONE RULE refines D019 | 102 | sub-entry of O6-ADD-ON |
| audit 4.5 | B1 record-mode rep-count path | 180 | sub-entry of audit-B1 |
| audit 5.2 | search top-N cache shape | 734 | sub-entry of NU13 |
| audit 8.1 | restore-defaults confirm dialog | 1875 | reference only |
| audit 8.2 | period creation confirmation step | 1850 | reference only |
| audit 8.3 | month-header fact line hidden in filters | 1857 | reference only |
| audit 8.4 | NU4a duplicate guard (paired with 3.2) | 590 | reference only |
| audit fix 1 | Settings Group 7 DATA & STORAGE | 1923 | sub-entry of Settings |
| audit fix 2 | J3 dedupe hash | 2067 | sub-entry of J3 |
| audit fix 3 | J5 media stubs | 2107 | sub-entry of J5 |
| audit fix 4 | J4 streaks stay real | 2085–2086 | sub-entry of J4 |
| audit fix 5 | J3 achievement/cadence exclusion | 2075 | sub-entry of J3 |
| audit fix 6 | J1 media stubs | 2039 | sub-entry of J1 |
| audit optimization 3 | J3 dayKey = original date | 2066 | sub-entry of J3 |
| audit optimization 4 | J4 day-view drought line | 2094 | sub-entry of J4 |
| audit LOW-6 | R11 strip window | 2242 | sub-entry of R11 |
| audit LOW-11 | NU8 first-of-day deletion | 632 | sub-entry of NU8 |
| audit LOW-18 | R12 backfill semantics | 2251 | sub-entry of R12 |
| audit LOW-23 | legend itself | 791 | family legend |
| audit LOW-24 | week-start display-only effect | 1880 | sub-entry of Settings Group 1 |
| audit MED-10 | saved-foods fate derived | 726 | sub-entry of NU13 |
| audit MED-13 | XP symmetry negative event | 511 | sub-entry of integrity fix |
| audit MED-16 | J7g browser coverage | 2162 | sub-entry of J7g |
| audit finding E | anniversary window primitive | 1228 | sub-entry of M2 ANNIVERSARY |
| audit finding M3 | yearly meta-streak primitive | 1185 | sub-entry of M2 META-STREAK |
| audit clash C2 | relative-ratio + standards metric | 1297–1308, 1601–1603 | sub-entry of M2 RELATIVE-RATIO |
| audit clash C3 | turn-of-the-page dependency | 1133–1134 | sub-entry of M2 TURN-OF-THE-PAGE |
| 4.4 RESTATED | dayActivityScore no hard ceiling | 1823–1830 | RESTATED clause (Calendar UI) |

---

## Duplicates, near-duplicates & ambiguous tokens

1. **A-series reuse (3 independent families)** — per the legend (791–813),
   bare `A1…A7` never disambiguates. Unsuffixed occurrences found:
   - backup-A: L74 ("audit A1"), L92 ("audit A2"), L558 ("sync (A2)"), L560
     ("A1 backup"), L1573 ("(A4)"), L1777 ("A5").
   - routine-A: L40/254/285 ("per A7"), L768 ("routine audit A4"), L1838
     ("A1 routine data"), L2187 ("per A6"), L2319 ("pre-load A7").
   - census-A: L1596–1610 (A1–A4 inside SECOND-AUDIT CLOSE), L1663 ("A1 above").
   - Non-family: L1376 "user A1" (user answer), L1155 "The ultra (C)" (option).
2. **B-series reuse (2 families)** — audit-B1–B4 vs resolve-B1–B5; legend
   example "resolve-B3" vs "audit-B3" (794). Also L783–786 mixes B1–B5 in one
   summary list (the B5 summary line is the only audit-B5 token; there is no
   audit-B5 block).
3. **C-series reuse (≥3 distinct C2s)** — the biggest collision surface:
   - audit-C2 = streak ±10% window (699, 787, 1653, 1909, 2425–2426);
   - "strength-C2" (legend 799) = est-1RM÷rolling-BW ratio (1297–1308, 1602);
   - J1 "LEAP DAY (audit C2)" (2042) = Feb-29 matching — a **fourth C2 sense**;
   - M6 stamps "user yes, C2/C3/C4/C5" (1534, 1523, 1511, 1518) = option
     stamps, not the audit family;
   - J2 "PERFORMANCE (audit C1)" (2052) conflicts with audit-C1 (meal
     reminders, 663/786) — flagged ⚠.
4. **E-series reuse (2 families)** — resolve-E1–E3 (1664–1692) vs spec-E0–E13
   (989, 811). "spec-E3" would be ambiguous with resolve-E3 — always qualify.
5. **M2-prefix density** — 31 M2-prefixed blocks plus 5 un-prefixed blocks
   within the M2 section (L846, 884, 918, 982, 1282). M3 is an audit-finding
   tag inside an M2 block, not a standalone milestone block; M5 is nested
   inside M4. No standalone M3/M5 headings exist.
6. **E-clash numbering** — family "E-clashes 1-5" (994) vs four labeled
   entries (#1, #3, #4, #5); **#2 never labeled** (gap — see family table).
7. **backup-A3 vs routine-A "event-A3"** — the SAME block (534–561,
   "A3 EVENT-LOG COVERAGE FOR NUTRITION/BODY") is the detail of backup-A3 and
   is also pointed at by the routine-A legend line ("S10-004's event-A3 …
   NOT backup-A3"). Content identical; the legend's disclaimer protects the
   routine-side citation convention, but the block itself is physically one.
8. **O6 vs O6-ADD-ON** — O6-ADD-ON (92–120) amends O6's sync claim and is
   effectively a separate ID; keep both in any downstream plan.
9. **"audit round 2" twice** — SECOND-AUDIT CLOSE (1577, census-A) vs
   Daily-routine audit round 2 (2257, routine-A); both may be cited as "round
   2" — qualify by section.
10. **Journal Part-B declined numbering** — #2/#3/#4/#7 are journal feature
    numbers (2111–2113), unrelated to plain items family.
11. **F3** (200) and **F5** (196) — F5 has two mentions ("physique-photo
    cadence" and "F5 nudge") that are the same ID; F3 is the only dropped F.
12. **"D5"** (2135) = alias for D005 — recorded.
13. **Item 25 vs closure (5)** — item 25 (energy math) and AUDIT CLOSURE (5)
    (fully-logged definition) both contain "±20%" language that audit-C2
    later tightens to ±10%; not a duplicate, but cite both when tracking the
    window tolerance.

---

## Orphan & cross-file analysis

- **UIUX.md ID families: none.** UIUX.md (80 lines, fully read) contains no
  lettered ID labels. Its only lettered tokens are phase markers: "arrive M1"
  (29–30), "arrive M2" (31), "verified in M0" (66–67). These are roadmap
  milestone references, and TEMP-PLANNING's M-series/milestone language is
  consistent with them (M0 = storage spike, M1 = goals/tasks, M2 =
  gamification/analytics).
- **Orphan references (TEMP-PLANNING IDs absent from UIUX.md): effectively
  all of them** — every ID family enumerated in this census (items, O, I, N,
  F, NU, backup-A, census-A, routine-A, audit-B, resolve-B, audit-C,
  resolve-E, spec-E, TENSION, clash, E-clash, M, G, J, R, H, [x] items,
  future ideas) never appears in UIUX.md. This is expected: UIUX.md is the
  pre-expansion UX doc and TEMP-PLANNING.md is the expansion scratchpad; the
  integration pass after user approval will adapt UIUX.md.
- **Orphan references within TEMP-PLANNING.md itself:**
  - `E-clash #2` — referenced by range (994), never labeled (gap).
  - `spec-E1…E11` — span members only (no standalone text in the ledger).
  - `G7` — only G7b exists; plain G7 label never appears.
  - `M3`/`M5` — no standalone blocks; M3 = audit-finding tag (1185), M5 =
    nested rider inside M4 (1489). `M4 P2.5` references the Roadmap milestone,
    not an M-family block.
- **Vice versa (UIUX.md concepts never mentioned in TEMP-PLANNING):** none of
  UIUX.md's UI blocks are contradicted; TEMP-PLANNING explicitly references
  UIUX.md's six-block dashboard order (2324–2331, "Adaptation note: UIUX.md's
  block list needs this merge") and theme rule (1878). No UIUX feature is
  orphaned from the planning file.
- **External reference resolution (consulted DecisionLog.md / Roadmap.md for
  disambiguation only):** all D-series citations resolve to existing
  DecisionLog.md entries (including D040, which TEMP-PLANNING line 5 predicted
  as "next" — now a real entry); P2.5 resolves to Roadmap.md Milestone 4;
  v2/spec file citations point to files that exist at repo root. No dead
  external references found.

---

## Footer — totals per family

| Family | ID count |
|---|---|
| Plain items 1–37 | 37 |
| O-series (O1–O8 + O6-ADD-ON) | 9 |
| I-series (I1–I9) | 9 |
| N-series (N1–N9 + N7-sub AUTO-TICK block) | 10 |
| F-series (F1–F6) | 6 |
| NU-series (NU1–NU13 + NU4a + 3 add-ons + 6 closures + 1 sub-note) | 24 |
| backup-A1–A6 | 6 |
| census-A1–A4 (+2 context rows) | 6 |
| routine-A1–A7 (+2 sub-rows) | 9 |
| audit-B1–B4 (+B5 summary line) | 5 |
| resolve-B1–B5 | 5 |
| audit-C1–C6 | 6 |
| resolve-E1–E3 (+E2 sub-row) | 4 |
| spec-E0–E13 (nominal 14; 4 explicit citation rows) | 14 (nominal) |
| TENSION 1–15 | 15 |
| clash #1–6 | 6 |
| audit E-clash 1–5 (incl. unlabeled #2 gap) | 5 (4 labeled + 1 gap) |
| M0–M7 blocks (M0×2, M1×3, M2-section blocks ×36 [31 M2-prefixed + 5 un-prefixed; M3 tag counted inside the META-STREAK row], M4, M5 rider, M6, M7, milestone-level note) | 46 |
| G1–G20 + G7b (G7 absent, G14/G15 co-labeled) | 21 |
| J1–J7 + J7 a–g + J-audit 1–4 + Part-B declined #2/#3/#4/#7 | 22 |
| R1–R12 (+2 sub-rows) | 14 |
| H1–H4 | 4 |
| [x] Remaining Open Items | 5 |
| Future Ideas (unscoped) | 5 |
| Coach Consolidated Map named-rule rows | 12 |
| Audit-item cross-reference labels (19 audit N.N + 6 audit fix N + 2 audit optimization N + 5 LOW + 3 MED + 2 audit finding + 2 audit clash + 3 RESTATED) | 40 |
| Referenced external families (D-series 14 + S-series 13 + P2.5 + v2/spec refs) | 30 |
| **Total enumerated rows (tables above)** | **375** |

Notes on counting: rows that are sub-entries of another ID (e.g. J7a–g,
NU8-sub, R11-sub) are counted as rows; nominal spans (spec-E0–E13) counted at
nominal width. M-table row count includes the 5 un-prefixed M-section blocks
(L846 coach_outputs.kind dictionary, L884 weight ladder, L918 UI/UX ordering
set aside, L982 achievement-file relationship, L1282 MMA absolute-lift
milestones) and the milestone-level note row.

## Coverage confirmation (footer)

- **docs/UIUX.md — full-file coverage:** lines 1–80 read in one contiguous
  pass (entire file; no truncation). No ID-family labels present.
- **TEMP-PLANNING.md — full-file coverage:** lines
  1–1000 + 851–1550 + 1551–2250 + 2251–2671 read in four contiguous,
  overlapping chunks = every line 1–2671 covered exactly once in sequence.
- **Legend honored:** "LABEL FAMILIES — DISAMBIGUATION LEGEND" (791–813) read
  as ground truth for family boundaries; qualified family names used
  throughout (backup-A, census-A, routine-A, audit-B, resolve-B, audit-C,
  resolve-E, spec-E).
- **Grep verification:** 20+ pattern sweeps run across both files (listed in
  Methodology); every match inspected and assigned to a family.
- **No source file was modified** (UIUX.md, TEMP-PLANNING.md, DecisionLog.md,
  Roadmap.md untouched). Only this census file was written.
- **Standing flags for later stages:** (1) Coach-map ledger citations need
  re-anchoring (26 ⚠ flags); (2) E-clash #2 gap; (3) "G7" absent; (4)
  usage-scope ambiguity of the L534 A3 block (backup-A3 vs routine
  event-A3); (5) C2 label collision (3+ senses); (6) audit-C1/C2 labels
  reused in Journal section (2052, 2042) with different meaning.