# PersonalOS — Structural Impact Proposal (Stage B2 — Architect)

- **Stage:** B2 — Cross-Doc Structural Impact Analysis (Architect)
- **Date:** Thu Aug 20 2026
- **Inputs (read in full):** docs/IntegrationIntentBrief.md (177 lines) · docs/IntegrationLedger.md (284 rows L001–L284 + B1 appendix, 816 lines) · docs/IntegrationIDCensus.md (375 rows) · docs/IntegrationSequencingNotes.md (S001–S082, 151 lines) · every live doc named by any intent item's "Affected docs": Database.md, Architecture.md, CoachSystem.md, Gamification.md, UIUX.md, Roadmap.md, MediaStorage.md, DecisionLog.md, plus README.md, Vision.md, Requirements.md, DevelopmentWorkflow.md, StorageDecision.md, StorageSpikeStatus.md, StorageSpikeSessionA.md · AGENTS.md.
- **Standing rule honored:** TEMP-PLANNING 817–826 (ledger L283) — the ledger stays the single source of the target state; docs get rewritten to match it, never vice versa. ALL changes pending final user approval (TEMP 3–5, 789 → SequencingNotes S001).
- **Status:** Proposal only. NO doc was touched. STOP for human review after this file — no later stage runs.
- **Consumer notes:** Stage C (verdicts + D041+ confirmation) and the D1/D2 docs pass. Every claim is traceable to ledger row (L-###), census ID, or sequencing note (S-###); items needing a human call are marked **[Stage C]** — never silently picked. Items the drafters may not safely resolve are marked **[UNRESOLVED]** with the information that would resolve them.

---

## 0. How to read this proposal

**Type vocabulary** (used in every matrix row): `new-addition` · `extends-existing` · `renames-placeholder` · `restructures-existing` · `REMOVAL`. REMOVAL is used for surface consolidation/retirement: the row names exactly what content in the CURRENT doc is retired and where its replacement lives.

**Depends on** = other intent rows (C#.#) and/or ledger/decision IDs (L###/D###) and sequencing gates (S###) that must land first. The B1 consolidated decision proposals are cited as **D041…D076** (not yet confirmed — see §8; authoritative per-row assignment is B1's per-row table, with dual-listing notes in §8.2).

**Stage-C verdict gates**: ledger rows with source state `pending-approval` (L001–L010, 11 rows) and `draft` (L269, L271–L274, L282) REQUIRE an APPROVE/REJECT/REFER verdict before any drafting (ledger source-state legend; SequencingNotes S001/S003; intent brief C13.3). No row in this proposal pre-empts that gate.

**Do-not-build / do-not-resurrect** (binding regardless of verdicts): I6, I8, N3, N5, N6, N8, F3, Part-B #2/#3/#4/#7, RPE column, FUT-1, E-clash #2 (unlabeled gap — never invent), anything beyond the L248 closed list (intent brief §5.5; ledger L052/L054/L058/L060/L061/L064/L068/L216/L265/L270/L248).

**Doc-discipline**: StorageSpikeSessionA.md is never a target; StorageSpikeStatus.md default read-only; StorageDecision.md is verdict+criteria (no target rows); UIUX.md is a live target (ledger line 7).
**Explicit no-ops (verified, not skipped — F3/F4 review closure)**: Requirements.md and AGENTS.md are NOT targeted by any ledger row (intent brief reference table, lines 149–150) — no change expected; the build-time dependency entries (J5 PDF, NU13 USDA FDC + OpenFoodFacts, J7g auto-adopt) get their DecisionLog entries separately at build time, not via this integration. README.md / Vision.md reference-only; DevelopmentWorkflow.md receives content ONLY if Stage C item 6 picks the SequencingNotes append.

---

## 1. Intent-item × affected-doc impact matrix

One row per (intent item × affected doc). Current-state descriptions cite the docs exactly as they are on disk today (Section / line refs).

### 1.1 C1 — Fitness domain core

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C1.1 | Database.md | §Logical Schema/Entities (lines 11–28) has no workout/nutrition/body tables; event list (line 68) holds `future: workout.completed, study.session, ...` | Add health-area table groups (workouts, exercise_sets, body_metrics, nutrition, phases) following the entity+event pattern; `workout.completed` promoted to a real metadata-only event type (exercise count, total sets/volume — never set detail) | new-addition + renames-placeholder (the `future:` comment) | L001, L002; S002; [Stage C] L001–L010 verdicts; D041 |
| C1.1 | Architecture.md | §System Diagram (line 33) lists `goal.progress` and `(future: workout.completed, study.session)`; §Event Model table (57–78) | Add `workout.completed` to the diagram's event list; keep study.session future; document metadata-only payload | extends-existing | L002; D041 |
| C1.2 | Database.md | No exercise lookup; `areas` is the only seeded/user-extendable lookup precedent (line 20) | New tables: `exercises` (seeded ~44-list verbatim, user-extendable like areas, categories push/pull/legs/core/cardio, tracked/big-5 defaults), `exercise_muscle_groups` (junction, primary/secondary), `muscle_groups(parentId?)` (2-level); `rpe?` STRUCK from any draft schema; seed list verbatim-critical | new-addition | L003, L012, L013, L265, L266, L267, L130; D041; S003 (no new inventions) |
| C1.3 | Database.md | No workout template/session distinction in schema | New `workout_templates` + `workout_template_exercises` (first-class, pairWith? additive); performed sessions copy template rows (frozen, append-only); two-a-day allowed; apply-deviation (O5) folds structure only, never weights, past sessions frozen, per-template opt-out (L041); slot-done rule: a plan slot counts DONE if ANY session references it, freeform = "done differently" (S028); sessions store kg (O8); nullable routineSlotLogId? handled in C8.3 | new-addition | L009, L011, L036, L035, L045, L046, L041; D042; C8.1/C8.2/C8.3 (day-template layering, binder); S028 |
| C1.3 | Architecture.md | §Data Flow (105–117) describes one-write-path entity+event transactions | Document additive migration discipline for the template/session layer (copy, not link; edits future-only) | extends-existing | L011, L036, L053, L232; D042 |
| C1.4 | Architecture.md | §Modules table (90–103) has no strength owners; §Event Model lacks `workout.pr` | Add est1RM single-function owner (TENSION 6), strengthSnapshot(exerciseId, asOf) canonical reader, record-mode routing (weight vs rep-count); PR source-of-truth rule: ladder/vault ALWAYS derived by session-walk, workout.pr = Coach/toast ONLY; negative-XP event on re-derivation revoking PR-XP | new-addition | L014, L015, L017, L031, L117, L144, L246, L247, L049, L020, L034, L037, L047, L048; D043; S029/S030 |
| C1.4 | Gamification.md | §XP Sources (lines 14–23) has no PR row; §Levels & Achievements has no record-mode wording | Add record-mode-aware PR wording (PR XP small, milestone tiers, size-weighted ≥2.5 kg, zero XP for logging); state mode routing (rep-count mode has no 12-cap) | extends-existing | L016, L117, L037, L144; D066 / D043 |
| C1.4b | Gamification.md | No strength-standards / absolute-ladder content (achievements deferred to M2) | Strength standards = FROZEN 5-tier seed verbatim — 4 canonical lifts only (bench/squat/DL/OHP, men+women percentile-anchored, L143); "Strength Standard Reached" fires per-lift-per-tier ranks 2/3/4 ONLY — Beginner(1) and Elite(5) NEVER fire a trophy (L160, S047); MMA absolute-lift ladders fire ONLY on a real logged set, no est1RM/band substitution (L181, S049); overall level/item-19 = display-only profile grade, never a trophy or gate | new-addition | L143, L160, L181, L182; D044; S047/S049; XD-5 |
| C1.4c | Architecture.md | §Modules (90–103) lists strength owners but no formula-constants module | Document formula-constant module: Mifflin-St Jeor (BMR/TDEE), Wilks/DOTS, Epley (1RM) — plain Dart pure functions, NO package/network deps; public formulas, not licensed; constants non-togglable per Settings NOT-OFFERED (L007) | new-addition | L007; D044; C10.1 (NOT-OFFERED), C2.3 (Mifflin reuse) |
| C1.5 | Database.md | workouts would be new (C1.1); no cardio columns exist | Additive workout columns: kind strength\|cardio, durationSec?, distanceKm?, avgEffort?, kcalBurned?; MET formula verbatim-critical; manual kcalBurned replaces the strength band (NU9/B2) | new-addition + extends-existing | L033, L082, L088, L118, L131; D045; C2.3 (TDEE math) |
| C1.5 | Architecture.md | §Modules has no TDEE burn model | Document TDEE derivation split: non-training Mifflin baseline + derived training burn added separately; constants non-togglable | new-addition | L082, L088, L118, L023; D045; C2.3 |

### 1.2 C2 — Phase-aware bulk/cut spine (one cohesive package, per intent brief §2.1)

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C2.1 | Database.md | No phases table; no baseline mechanism | New `phases` (type bulk/cut/maintain, startDate, endDate? null=ongoing, targetWeeklyRateMin/Max?); ONE active phase; baseline weight anchored at start (O3 rolling average); final shape of the phase-rate↔macros feedback DEFERRED to the nutrition session — already closed (S008) | new-addition | L022, L024; D047; C2.4 (rolling owner); S008 |
| C2.1 | CoachSystem.md | §Reflection Generator lists outputs; no phase-close surface | Add phase-close report rendering (N9) as a derived output + one Coach line; coach_outputs kind `phase_close`; feeds milestone-review phase blocks (L264) | new-addition | L065; D047; C4.3 (kind dictionary) |
| C2.2 | Architecture.md | §Modules Coach pipeline (Analytics → Rule → Reflection) exists | Add paceVerdict(target, rollingTrend) shared helper; thin-data RESTATED rule (no verdict/projection from a single point, always "Adjusting" label); pace stays in the existing Analytics → Rule → Reflection pipeline (no new subsystem) | new-addition | L005, L006, L039, L165; D046; C2.4 |
| C2.2 | CoachSystem.md | §Rule Engine has goal_slip but no pace lines | Coach cites the owner verdict and quotes the number; bulk/cut pace lines (L276) as named rules | new-addition | L165, L276; D046/D051; C4.2 |
| C2.3 | Architecture.md | No energy-balance math | deriveMacros(dateKey) = THE day-target owner (H3, single owner — S035): Mifflin BMR × activity → TDEE; calorieTarget = TDEE + (rate × 7700)/7 with rate SIGNED; manual TDEE override freezes auto-recompute AND protein/fat basis (B4); protein cut 2.0 / bulk 1.8 / maintain 1.6, fat floor, carbs remainder; constants non-togglable | new-addition | L023, L078, L079, L086, L087, L120, L084, L083; D046; C2.4, C5.1 (receipt rows feed it); S035 |
| C2.3 | Database.md | settings table (line 21) has keys only (timezone, displayName, coachStrictness, ...) | Add Group-4 settings keys as schema-relevant keys (height/age/sex/activity factor, manual TDEE override, protein g/kg per phase, fat floor, food-lookup toggle) — settings keys, not profile fields (D003) | extends-existing | L026, L078, L079, L120, L257; D046/D055 |
| C2.4 | Architecture.md | No rolling-average utility | rollingWindowMean(series, windowDays) = ONLY rolling math in the engine (TENSION 7); serves phase pace, goal pace, ratios, trophies, weight-goal pace; thin-data honesty floors inside | new-addition | L038, L039, L145; D046; C2.2, C3.1, C7.2 |
| C2.4 | Database.md | body_metrics table is new (C1.1) | Document canonical-row rule: FIRST weigh-in of day = canonical daily trend; later same-day stored but excluded; deleting first row promotes next (retroactive re-derive accepted — S033) | new-addition | L080, L081; D046; C12.2 (body.weighed events); S033 |
| C2.5 | Gamification.md | §Streaks (lines 44–51) has grace and streak logic but no weekly-checkpoint/fully-logged-day/Real Progress | Add weekly-checkpoint definition (closed calendar week Sun, thin weeks <5/7 neither confirm nor reset, two consecutive non-thin weeks read); fully-logged-day definition (routine-active: kcal ±10% + planned meal types; no-routine: kcal ±10% + ≥2 actual meal logs); Real Progress thresholds +2.5/+5/+10/+20 kg in goal direction; On Target same ±10% band — ONE number, one Advanced-only knob clamped 5–15% | new-addition | L089, L119, L123, L124, L125, L127, L167; D068/D066; C5.1, C8.1 (meal slots) |
| C5.1 (cross-ref) | [see §1.5] | — | — | — | — |

### 1.3 C3 — Goals extension

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C3.1 | Database.md | goals table (line 17): id, title, area?, targetDate?, createdAt (M1) | Additive nullable cols: kind (generic\|weight\|strength), exerciseId?, targetValue?; from the START (M1 first build) | extends-existing | L025, L027, L162; D048; S013 |
| C3.1 | Roadmap.md | M1 scope (lines 47–50) lists Goals (milestone-based, deadlines) | Record the goals.kind extension + weight/strength goal reuse in M1 scope; goal↔phase one-tap consistency note | extends-existing | L025, L027, L051, L162; D048; S013 |
| C3.2 | Database.md | §Event Log (line 67): `goal.progress` listed as M1 event | **REMOVAL**: goal.progress event type dropped from the event list; only user-declared goal.completed remains; progress COMPUTED-ONLY via one H3 owner per goal kind | REMOVAL | L155; D049; S014 (docs-pass immediate) |
| C3.2 | Roadmap.md | M1 exit criteria (line 53): "Create goal with milestones; progress events flow to event log" | **REMOVAL of the claim**: replace with computed-only progress wording (owner per goal kind); add goalProgress(goalId) owner mention | REMOVAL | L155; D049; S014 |
| C3.2 | Gamification.md | No goals-related XP rows beyond §XP Sources | No content to strike here for goal.progress; verify no future wording reintroduces a write-path progress event | — (no-op, verified) | L155 |
| C3.3 | Roadmap.md | M1/M2 scope has no projection line | Add goal-card projection line ("at current pace → ~date", honest-estimate labels, needs ≥2wk data; stale/deload = uncertain) | new-addition | L066; D050; C3.2 owner |
| C3.3 | CoachSystem.md | No milestone-review surface | Milestone-review card + section of the merged check-in; milestone_review_goal kind; appears ONLY at goal end (won/expired), never mid-run; zero-blame EXPIRED vintage | new-addition | L172, L264; D050; C4.3 (merged surface), C9.2 |
| C3.3 | Gamification.md | §XP Sources (line 23): "Weekly review completed \| small" | **REMOVAL**: strike the weekly-review small-XP row; milestone review gets none either; reviews are earned-honor-only | REMOVAL | L173; D050; S019 |

### 1.4 C4 — Coach system restructure (see §2 for the full Coach map guide)

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C4.1 | CoachSystem.md | 123 lines: ## Architecture; ## MVP Coach (M0); ## Full Coach Design (M2+) (### 1 Analytics / ### 2 Rule Engine / ### 3 Reflection Generator / ### 4 Optional AI Adapter); ## Strictness (102–107); ## Data the Coach May Use; ## Validation Goals | Wholesale section restructure using the map §0–§9 as the organizing outline, rewritten in CoachSystem.md's own voice, never copied; re-anchor all 26 ⚠ of 41 map `ledger:NNN` citations to ledger Source lines; map pointers never authoritative | restructures-existing | L028–L030, L050, L056–L057, L065, L067, L137, L148, L166, L171–L172, L190, L275–L280; D051; §2.3 below |
| C4.2 | CoachSystem.md | §2 Rule Engine has 5 example rules (missed_habit_pattern, reasonable_failure, improvement_signal, goal_slip, journal_drought) | One named-rule section per rule: stallRule(phase); plan-adherence; volume balance; rest-day pattern detection; injury/limitation (limited-not-lazy); post-deload return ramp; deload suggestion; journal drought; pace/bulk lines; missed-habit warnings (Coach reflection, never calendar tint); deferred rules (N5 recovery) marked deferred | restructures-existing (Rule Engine content) | L028, L029, L030, L067, L056, L057, L148, L275, L276, L277, L060; D051; C7.2 |
| C4.3 | CoachSystem.md | §3 Reflection Generator (lines 83–89) lists "weekly review (summary of analytics...)" as an output | **REMOVAL of the standalone weekly-review surface**: the M2 Coach weekly review merges INTO the Sunday check-in (A4/H2) as a section (top: Coach weekly, bottom: fitness/nutrition); NOTHING deleted, merge only; nutrition check-up + week recap = compact sections with tap-through | REMOVAL + restructures-existing | L099, L092, L101, L243, L032, L172, L264; D052; C9.2; S063/S064 |
| C4.3 | UIUX.md | No week-recap/nutrition-check-up screens exist today (80 lines) | **REMOVAL (pre-authorized)**: do NOT author separate week-recap or nutrition check-up screens; the ledger retires them before authoring — week recap = R11 strip glance (C8.4), nutrition check-up = section of the Sunday surface | REMOVAL (of planned surface) | L243, L101, L092; D052; C8.4, C9.2 |
| C4.3 | Database.md | coach_outputs row (line 22): "daily note / nudge / weekly review (M2; stub note in MVP)" | Extend to the full 9-kind dictionary (daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert) + payload shape each; doc-only, no schema change; "weekly review" label replaced by check_in_weekly | extends-existing | L156; D051; S023 (docs-pass immediate) |
| C4.4 | CoachSystem.md | §Data the Coach May Use (109–116) covers inputs; no never-list | Add the never-list verbatim (L279); facts-only default; per-feature privacy stamps "facts only" OR "needs text access → user opt-in first"; Coach gets NO journal text | restructures-existing (§7) | L158, L279; D051; S025 |
| C4.4 | Architecture.md | §Data Flow / Event Model; Coach reads analytics + events; journal content never in events (74–76) | Repeat the privacy stamp for Coach/journal-reading features; journal-content access rule unchanged | extends-existing | L158; D051; S025 |
| C4.5 | UIUX.md | No Settings structure beyond navigation mention (line 11: tabs Dashboard, Journal, Habits, Settings) | Settings Group 2 COACH: strictness, weekly review day (default Sunday), Coach notes in calendar day view (default on), milestone-review cadence editable; weekly-window rule (evaluation window = 7 consecutive days ending the configured review day) | new-addition | L255, L280, L262; D055; C9.2, C10.1 |
| C4.5 | CoachSystem.md | ## Strictness (102–107): scales thresholds + tone, not the rule set | Keep Strictness verbatim (L280 cites :102-107); add Group-2 settings details + NOT-OFFERED list (XP/achievement values, formulas, dayActivityScore weights) as settings, never toggles | extends-existing | L280, L255, L262; D055/D051 |

### 1.5 C5 — Nutrition receipt-line model

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C5.1 | Database.md | No nutrition tables | New: `nutrition_logs` per-meal receipt rows (dateKey = ACTUAL eat date — NU4 backdating exception to I7; portion multiplier ON the row; source column), `meal_types` (seeded + user-extendable), `nutrition_recipe` (copy-in at save, never rewrite history); soft duplicate guard (NU4a) on school-end batch + morning-pack; day total = SUM of rows, never a stored day row; backfill bound: same-day/last-24h backfill = normal, OLDER dates = distinct historical-backfill mode that NEVER extends streak/check-up compliance (L090, S034); reviewed-no-change record: 00:30 snack display mismatch — logs under actual eat date, shows under previous day's slots, no rework (L128); NU status line: NU1–NU12 + add-ons locked (L268, status record) | new-addition | L072, L073, L074, L075, L076, L090, L128, L268; D062; C2.3 (targets), C8.3 (pack linkage); S034 |
| C5.2 | Architecture.md | No producer seam | Producers pattern: scanner/OCR, smart scale, food-db lookup all print the SAME receipt row; `source` column is the hook; offline forever; DEPENDENCY flag: NU13 (USDA FDC + OpenFoodFacts) needs a DecisionLog entry before formalizing (no-new-dependencies rule) | new-addition | L077, L091; D062; C12.2 events; [Stage C]/build-time entry |
| C5.2 | Database.md | No food cache table | `nutrition_food_cache` = ONE regenerable table, NOT in backup enumeration; lookups derived from nutrition_logs history ("saved food" IS a logged row) | new-addition | L091; D062; C12.2 |
| C5.3 | UIUX.md | Dashboard blocks (lines 20–33) have no briefing content | Macro-gap bar lives INSIDE the R12 briefing card (Today fusion, C9.1): protein/kcal progress vs deriveMacros target; the single daily surface | new-addition | L085, L240; D063; C2.3 owner, C8.4, C9.1 |
| C5.3 | CoachSystem.md | No meal-reminder rule | On-app-open catch-up nudge only (never push — D018); known meal windows = routine-bound meal slots, seeded defaults when no routine | new-addition | L093, L126; D063; S082 |
| C5.3 | Gamification.md | No consistency marker | Zero-XP "N days fully logged" marker on dashboard (no XP, anti-farming); fully-logged-day definitions from C2.5 | new-addition | L094, L089, L119; D063/D068; C2.5 |

### 1.6 C6 — Habits auto-track bridge

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C6.1 | Architecture.md | habit_checkins written transactionally with events (§Data Flow 105–117); no auto-source concept | Auto-tracked habits (autoSource "workout", future "weigh-in"); session save auto-writes the day's habit check-in in the SAME transaction (checkin autoCreated, manual wins); session deletion cleans up its auto check-in AND emits compensating habit.completed_revoked (transactional, metadata-only); event-log-only consumers | new-addition | L062; D064; S079; C1.3 (session save) |
| C6.1 | Database.md | habit_checkins (line 16): id, habitId, dayKey, completedAt, note? | Add additive nullable `autoCreated` flag (and autoSource? on habits per L062 process note — flag for draft schema) | extends-existing | L062, L282; D064; [Stage C] L282 |
| C6.2 | Gamification.md | §Anti-Farming Rules (lines 32–42); §Streaks grace | Auto-ticked habit = REAL completion (full XP like manual) ONLY when the triggering session is real (same anti-cheat gate); revoked tick returns XP via compensating negative-XP event; no double-earn, no delete-log cycles; rule lives in the shared anti-farming gate, not per-screen | extends-existing | L063; D064; C6.1, C1.4 (negative-XP symmetry L246/L175) |
### 1.7 C7 — Achievement catalog & trigger engine

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C7.1 | Gamification.md | §Levels & Achievements (lines 53–57) is a stub ("Achievements: sparse, meaningful...", "Achievement list (first 10)" in Open Items) | Restructure per DOCS-PASS RULES (a)–(e) (L177, verbatim in intent brief §2.2): (a) merged catalog text = v2 verbatim; (b) trigger/machinery prose = spec verbatim; (c) every ledger pin lands as a named rule/guardrail; (d) state v2 + spec stay LIVE sources and link both; (e) 1:1 mapping 131 ↔ 131 ↔ 47; 178 entries preserved; ZERO XP; TEMP-PLANNING-Achievements.md SUPERSEDED as catalog (7 governing rules carry); merged-canonical draft DEFERRED (v2 stays live) | restructures-existing | L176, L177, L136, L138, L106, L107; D065; S003; EXTERNAL: v2 + spec frozen |
| C7.2 | Gamification.md | No trigger pins documented (achievements deferred to M2) | Every pin lands as a named rule/guardrail: G1–G20 + G7b (no plain G7), TENSION 1–15 owner pins, resolve-E1–E3, E-clash #1/#3/#4/#5, M3 yearlyPass/consecutiveYears, M4 anchored years, M6 qualifyingEntry, M7 loose ends; E-clash #2 = GAP, never labeled | new-addition | L139–L153, L159–L164, L179–L210, L122–L135, L187–L189; D067/D068; C3.3, C1.4 (owners) |
| C7.2 | Architecture.md | §Modules Analytics row (line 100) says "cached aggregates"; no owner-function catalog | Owner functions added to Analytics Engine catalog: runAlive, robotOverlapWindow, yearlyPass, consecutiveYears, sameMonthDay, dayDomainPresence, phaseStartWindow, phaseAdjacency, anniversaryWindow, qualifyingEntry, rollingWindowMean, est1RM, strengthSnapshot, deriveMacros, adherenceWeek, dayActivityScore, totalVolume, goalProgress(goalId), paceVerdict (C13.5 emits the FULL consolidated catalog as the authority) | new-addition | L165, L139–L153, L163–L164, L178–L180, L187, L244; D049/D067; S024 |
| C7.3 | Gamification.md | No achievement numbering exists in doc yet | Must cite 178 named entries; carry corrected wording verbatim: NoDeviation tolerance ±3% (Ghost ±30% typo fixed), stale duplicate blocks already deleted from v2 file, "once per calendar year" residue scrubbed to anchored-year wording, Rolling Tape = first KEPT vlog (captured or adopted), "Fifty Push-Ups" rename; do NOT reintroduce pre-correction numbers | new-addition (verification duty) | L102–L107; D065; EXTERNAL: v2 edits already applied — doc must reflect, not re-edit |
| C7.4 | Gamification.md | §XP Sources has "Weekly review completed \| small" (line 23); no caps/symmetry | **REMOVAL** (weekly-review XP — struck, C3.3) + add: trophies ZERO XP; journal XP cap (first 2 content-gated entries/day); media XP rides journal cap; XP reversal symmetric via NEGATIVE XP event | REMOVAL + extends-existing | L173, L175, L227, L246; D066; C1.4, C6.2 |

### 1.8 C8 — Daily routine system

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C8.1 | Database.md | No day-template tables; week_plans not in schema yet | New: `day_templates` + `day_template_slots` (typed kinds meal\|pack\|workout\|activity\|rest\|sleep\|weigh-in); weekly routine = named 7-slot binding list (R7) + per-day override (R8) — ONE binding model, no independent per-day toggle; prompt rules (no weekly prompt on unbroken runs); delete affects future only | new-addition | L108, L109, L112, L113, L228, L229, L230, L232, L234, L235, L236; D061; C8.2 (binder) |
| C8.1 | UIUX.md | No routine/week UI | Week picker + per-day override UI; prompt discipline (S055); briefing card integration (C8.4) | new-addition | L109, L234, L235; D061; C8.4 |
| C8.2 | Database.md | week_plans not yet in schema (it appears only in drafts L282) | **REMOVAL of standalone fitness week_plans scheduling + re-purpose**: week_plans/week_plan_slots become the routine-week binder (slots reference dayTemplateId — NOT workoutTemplateId, naming per audit-B5); workout templates keep their own tables (O1); one door to edit a workout; no second calendar | REMOVAL + renames-placeholder | L114, L121, L036, L230; D061; S027 (docs-pass immediate) |
| C8.2 | Roadmap.md | M6+ "Productivity refinement: routines, projects" one-liner; no fitness-weekly-plan claim | No standalone fitness scheduler milestone is authored anywhere; routine replaces it as product scope (M2+ items) | extends-existing (authoring guard) | L114; D061; C8.1 |
| C8.2 | CoachSystem.md | No plan/scheduler flow exists | Any Coach flow that would reference standalone plans is re-wired to routine slots; no new content needed today | — (verified no-op + guard) | L114; D061 |
| C8.3 | Database.md | No performed-day model | New: `routine_days` (dateKey, templateUsedId snapshot frozen) + `routine_slot_logs` (status planned\|done\|skipped\|packed\|eaten); pack→meal linkage at TEMPLATE level; kind IS the extension seam (like nutrition's source): meal → pre-timed nutrition rows + pre-fill from recipe, pack → carry-list + lunch claim, workout → workout-template link (session day pre-fills), activity/sleep → future hooks only (L233); backfill marks slot done in THAT date's view; workouts gains nullable routineSlotLogId? | new-addition | L108, L110, L111, L116, L231, L237, L241, L233; D061; C5.1 (pack→nutrition rows), C8.1 |
| C8.4 | UIUX.md | Dashboard six-block list (lines 20–33); no briefing card | R12 briefing card = daily one-tap surface (today's slots, done-vs-missing, macro-gap bar) — fused into "Today" per C9.1; R11 week recap strip above the week grid (denominators count only days WITH the slot; strip window = displayed week); glance/verdict two display modes of ONE owner | new-addition + restructures-existing | L240, L238, L239, L242, L101; D061/D052/D053; C9.1, C9.3 |

### 1.9 C9 — Surface consolidation (multiple REMOVALs)

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C9.1 | UIUX.md | §Dashboard (MVP) lines 20–33: six blocks (habits → journal quick → coach note → goal progress → tasks → streak) | **REMOVAL of the separate briefing-card top block**: block list rewritten with "Today" = briefing + habits + capture merged at top; below, old order verbatim; render-order list (L169) paints heavier blocks after skeleton shimmer; no new schema | REMOVAL + restructures-existing | L154, L169, L243, L245; D053; S026; C1.3, C5.3, C8.4 |
| C9.2 | UIUX.md | No weekly surfaces exist today | The weekly fitness check-in IS the single Sunday surface; R11 recap + nutrition check-up + Coach weekly become COMPACT SECTIONS, not top-level screens (tap-through to detail); one canonical verdict per cadence | REMOVAL (of planned surface, pre-authorized) + new-addition | L243, L099, L101, L092; D052; S063/S064; C4.3 |
| C9.2 | CoachSystem.md | §3 Reflection Generator lists "weekly review" output | Coach weekly review merged INTO the check-in (A4/H2) as a section — merge only, nothing deleted, one pipeline, one scroll | REMOVAL + restructures-existing | L099, L243; D052; S063 |
| C9.3 | UIUX.md | No recap surface | Week recap strip = glance (gym 5/5 · packs 5/5 · weigh-ins 6/7); tapping the strip opens the merged weekly review = verdict; same H3 owner — never a competing or second surface | new-addition | L101, L239, L249; D052/D054; C8.4 |
| C9.4 | UIUX.md | No calendar section exists (nav has no Calendar tab; only Journal/Habits/Dashboard/Settings) | New calendar section authored as MEMORY MAP, never judgment: month-grid tint only (never dots/numbers/icons); tint intensity = volume via dayActivityScore; single-system filters (H4); day view = chronological derived list + plan-vs-actual toggle + year heatmap; period creation with visible confirmation (both drag + manual); missed-habit warnings live in Coach reflection, never tint | new-addition | L249, L250, L251, L252, L253; D054; C7.2 (owner), C10.1 (Group 5), C11.3 (periods/photos) |
| C9.4 | Architecture.md | No dayActivityScore owner | dayActivityScore = ONE H3 owner (workout 3 max 1/day; meals 1 cap 3/day; weigh-in 1; journal 1 cap 2/day; habit 0.5 UNCAPPED) + tintLevelFor(score) mapping; no judgment glyphs | new-addition | L250, L165; D054/D049 |

### 1.10 C10 — Settings two-tier restructure

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C10.1 | UIUX.md | No settings section (only nav mention line 11) | Author Settings per principles: H4 (a group appears only when the user has data — no Sync group until sync ships; S067); two tiers Main + Advanced; search escape hatch; restore-defaults behind confirm dialog; Groups 1 GENERAL, 2 COACH, 3 FITNESS, 4 NUTRITION, 5 CALENDAR & MEDIA, 6 HABITS, 7 DATA & STORAGE, 8 SYNC (skeleton only, renders when sync ships); NOT-OFFERED guardrails; Group 5 gains resolve-E2 vacation-day threshold knob (default 14, verbatim) | new-addition | L253–L262, L133; D055; C4.5, C9.4, C12.1 (Group 8 gate), S061; S067 |
| C10.1 | Database.md | settings table (line 21) key/value generic | Document settings keys as columns/options where schema-relevant (units kg\|lb, activity factor, TDEE override, protein per phase, food-lookup toggle, grace default, PO kill-switch...) — settings keys, never profile fields (D003) | extends-existing | L256, L257, L262, L183; D055; C2.3, C7.2 |

### 1.11 C11 — Journal & media features

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C11.1 | UIUX.md | §Journal (37–43): timeline, compose, edit/delete; no search/filter/import/quiet-week/year-book | Journal pages rewrite: J1 On-This-Day memory strip (facts-only, media stubs, leap-day via sameMonthDay); J2 search (offline, simple matching, worker if slow); J3 batch import flow (preview, imported flag, dedupe, no XP); J4 Quiet Week (user-started; streaks stay REAL — not a shield); J5 Year Book entry point (PDF artifact, media stubs); J6 tag/area filter chips; filter-aware month fact line (J-AUDIT-1) | restructures-existing + new-addition | L211, L212, L213, L214, L215, L217, L226; D056; C4.4 (quiet week in Coach), C12.2 |
| C11.1 | Database.md | journal_entries row (line 13) has tags JSON; media_attachments has no title | Additive: `imported` flag + immutable import-hash column on journal entries (dedupe; dayKey = original date; no XP); media_attachments nullable `title` (J7 naming hook) | extends-existing | L213, L218; D056/D057; C11.2 |
| C11.1 | MediaStorage.md | §Desktop Media UI (PC-only) — vault browser filters; §Multi-device metadata | J7 "My Videos" = VIDEOS HOME inside the existing Desktop vault browser (merge, don't add — D035 wording kept literally true); shared search box (J2+J7, H3-style simple matcher); adopted marker + meter exclusion; dedup via content hash; reuse archived-to-pc semantics (no new enum); backend-agnostic; auto-adopt = Chromium-only (File System Access API), others degrade to manual folder pick | extends-existing + new-addition | L218–L225, L220; D057; C11.2; D035 guardrail |
| C11.1 | Architecture.md | §Modules has no search matcher | Shared simple matcher owner (word/tag match) serving J2 + J7; one implementation, both call it (H3 discipline) | new-addition | L220; D057; L244 |
| C11.2 | MediaStorage.md | §Vlog Local Buffer + Three-Tier; no duration/lifecycle/delete tiers | Add: durationSec measured ONCE when a file first enters the library (phone capture returns finished duration; PC adoption parses MP4/MOV container header once, no ffmpeg); tier moves COPY the stored row — no re-measurement; unreadable → NULL, never counts; VLOG LIFECYCLE: every recording ends at Keep/Discard review screen (Discard = file wiped, no row, zero trophies); DELETE tier-aware: buffered/phone → row + file + vlog.deleted tombstone; Drive-vaulted → metadata row only; PC-adopted → app NEVER removes the file (folder = truth), un-list + do-not-readopt | extends-existing + new-addition | L142; D057; C11.3 |
| C11.2 | Database.md | media_attachments fields section (30–51) has durationSec? (line 14) nullable | durationSec definition resolved (measured once, NULL for unreadable); `title` col; `adopted` marker; vlog.deleted tombstone event documented in event model (C12.2 pattern) | extends-existing | L142, L218, L221; D057; C12.2 |
| C11.2 | Architecture.md | §Event Model lacks vlog.deleted | Add vlog.deleted tombstone event + negative-XP symmetry note for duration trophies on discard | new-addition | L142, L048, L175; D057/D066 |
| C11.3 | MediaStorage.md | §Physique-Photo Timeline (224–235) says "the exact field is defined with the timeline feature (P3 design)" | **Placeholder resolved**: photo anchor = journal entry tagged health+physique (hidden system tag); D031 timeline queries media_attachments by that tag; zero new tables/paths; F5 monthly nudge (default OFF) opens prefilled journal composer | renames-placeholder + extends-existing | L100, L070; D073; C11.1 (J6 filter incl. physique tag) |
| C11.3 | CoachSystem.md | No nudge rule for physique | F5 monthly nudge rule (default OFF, no nagging) | new-addition | L070; D073; S081 |

### 1.12 C12 — Entity-sync plane & backup enumeration

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C12.1 | Architecture.md | §Offline Strategy (209–215) mentions "Sync (when it exists)"; D019 LWW policy is dual-doc (DecisionLog D019 + Architecture references) | Document the entity-sync service layer as REQUIRED before the multi-device M1-phase: mechanism = D019 (event log = append-only UNION of distinct event ids; same-entity edits = LWW by timestamp, deviceId ties); TOMBSTONE RULE (delete always wins over earlier-timestamped edits — entity never resurrects); does NOT change storage backend | new-addition | L043, L044, L096, L157, L191, L283; D059; S010/S011/S012/S031; §7.3 |
| C12.1 | Roadmap.md | §Drive Phasing + M3/M4/M5; no entity-sync milestone | NEW milestone inserted BEFORE P2.5 (see §7.3); P2.5 shrinks to big media blobs only; same D019 mechanism for both | restructures-existing | L157, L191, L043, L096; D059; S010/S011 |
| C12.1 | Database.md | §Event Log (53–72) immutability/append-only; no sync semantics | Document event-union + LWW/tombstone semantics (logical-only, backend-neutral) | extends-existing | L044, L096; D058/D059; S031 |
| C12.2 | Database.md | §Backup/Restore Format (84–146): formatVersion 1, data keys list | Backup enumeration extended verbatim-critical (O6 + backup-A1 lists: weekPlans/weekPlanSlots, workoutTemplates, workoutTemplateExercises, workouts, exerciseSets, muscleGroups, exerciseMuscleGroups, exercises user rows, bodyMetrics, phases, deloadMarkers, nutrition_logs, nutrition_recipe, meal-types, day_templates, day_template_slots, routine_days, routine_slot_logs, periods, limitations); formatVersion-bumped, additive; nutrition_food_cache NOT in enumeration (regenerable) | extends-existing | L042, L095, L091, L263; D058; C1.x/C5.x/C8.x tables exist first |
| C12.2 | Architecture.md | §Event Model seeded types list (Database event list mirrors) | Add metadata-only events: nutrition.logged + body.weighed (plus revokes nutrition.removed / body.weighed_revoked); cross-domain revoke pattern; ~2k small rows/yr within ~10k/yr budget; NO per-set/per-slot/routine-noise events (exercise_sets, routine_slot_logs entity-only); engines keep reading the log only | new-addition | L097, L098, L080; D058; S032; C5.1, C2.4 |

### 1.13 C13 — Process, closure & verdict gates

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C13.1 | ALL affected docs | Every doc describes the pre-integration state | Process rule governing HOW every other row applies: ledger = single source; docs rewritten to match it, never vice versa; nothing edited ad hoc; all changes pending final user approval; every downstream doc uses QUALIFIED family labels (backup-A vs census-A vs routine-A; audit-B vs resolve-B; audit-C vs resolve-E) — see §6 | process (applies to all rows) | TEMP 789/791–813/817–826; L281; D074; S001–S003 |
| C13.2 | Roadmap.md | No feature-closure statement | Add closed-scope note for the fitness side (workouts, sets, exercises, templates, plans, phases, PR, vault, PO, cardio, volume, deload, injuries, adherence, goals, habits bridge, check-in, phase report; media deferred); N3/N5/N6/N8 + periodization stay park-able; add only when real usage says so; M2 phone↔PC parity principle: every feature/screen exists on BOTH platforms EXCEPT the PC archive (folder adoption + vault browser incl. J7 video library — PC-only, D035-consistent); capture NOT phone-exclusive; offline identical on both (L174) | new-addition | L248, L174; D060; S004 |
| C13.2 | DecisionLog.md | D001–D040 only | Record feature-list closure as a decision (D060 theme) | new-addition | L248; D060 |
| C13.3 | Database.md / Roadmap.md / DecisionLog.md | Draft schema shapes only in ledger (L282); Life Tree idea (L269); FUT-2..5 (L271–L274) | NONE of these may be drafted before Stage C APPROVE/REJECT/REFER (L269, L271–L274, L282); L282 treated as sketch with superseded columns (rpe? struck; week_plan_slots.dayTemplateId; routineSlotLogId) | gated — no drafting | L001–L010, L269, L271–L274, L282; S001/S003; C13.4 below |
| C13.4 | Database.md | coach_outputs row line 22 lists 3 kinds | Full kind dictionary section (9 kinds verbatim — see C4.3); no two labels mean the same thing | extends-existing | L156; D051; S023 |
| C13.5 | Architecture.md | No consolidated owner catalog | Analytics Engine consolidated owner-function catalog emitted during the docs pass and IS the authority there (seed list: rollingAvgWeight, deriveMacros, adherenceWeek, strengthSnapshot, dayActivityScore, totalVolume, goalProgress(goalId) + every M2/trophy owner); NO generic-aggregator meta-framework; rounding once, in the owner | new-addition (Track 2 artifact) | L165, L244, L168; D049; S024; S066 (H3 single-owner discipline) |

### 1.14 C14 — Session-UI, onboarding & lookup UX (D076 + D042-UI — added at Stage C audit)

| # | Doc | Current state | Proposed change | Type | Depends on |
|---|---|---|---|---|---|
| C14.1 | UIUX.md | No session-UI / first-run content (only the six-block MVP dashboard) | Author: daily logging flow (plan-driven + editable, freeform/paste fallback — L019); last-time hint display with freshness tiers (<2wk full / 2–4wk quieted w/ date / >4wk collapsed — L021/L040); onboarding first-run (Mifflin inputs as Group-4 settings keys + proposed first weekly plan + seeded tracked exercises, ALL replaceable/clearable from day one — L055, S078); session comparison (side-by-side vs previous same-template, per-exercise deltas + volume delta + PR flag — L059); template cloning one-tap incl. pairings (L069); copy weekly check-in / phase-close report as plain text (L071); "Track this exercise" in session menu → dashboard Your-lifts block (L129, reuses tracked toggle) | new-addition | L019, L021, L040, L055, L059, L069, L071, L129; D076; S006/S078/S022 (paint order) |
| C14.2 | Architecture.md | No auto-assort parser; no freshness-tiers owner | Auto-assort = rule-based loose-grammar paste parser (fuzzy match + "Did you mean?" confirm, inline create with muscle assignment — NEVER silent auto-create; offline, NO AI; M1-or-M2 — L018, S006); last-time freshness tiers = an owner (constants configurable in settings; >4wk PO suggests pause w/ ~90% baseline instead of +2.5 kg extrapolation — L040); manual structured entry ships M1, general NLP deferred (S007) | new-addition | L018, L040; D076; S006/S007 |

---

## 2. Coach Consolidated Map — restructuring guide for CoachSystem.md (C4.1)

The Coach map (TEMP 2439–2597) is the structural source: CoachSystem.md gets a wholesale section restructure using the map's ten subsections as the organizing outline, rewritten in CoachSystem.md's own voice — NOT copied (intent brief §2.4; ledger Track-2 #1/#2).

### 2.1 Subsection → existing/new heading mapping

Current CoachSystem.md headings (on disk): `## Architecture`, `## MVP Coach (Milestone 0)`, `## Full Coach Design (M2+)` (`### 1 Analytics Engine`, `### 2 Rule Engine`, `### 3 Reflection Generator`, `### 4 Optional AI Adapter`), `## Strictness` (lines 102–107), `## Data the Coach May Use`, `## Validation Goals for the MVP Stub`.

| Map subsection (§, TEMP) | Maps to CoachSystem.md heading today | Action | New heading needed? | Authoritative rows |
|---|---|---|---|---|
| §0 Philosophy | No dedicated heading; intro paragraphs (lines 3–4) carry a rough philosophy | Expand the intro into a "Philosophy" section; state Vision.md is the master reference and Coach follows facts-only, no-shame, context-aware posture (carry-over locks) | NEW `## Philosophy` | L166, L171, L279; D051 |
| §1 Architecture & pipeline | `## Architecture` (diagram + pipeline) and `### 1–4` under Full Coach Design | KEEP the pipeline architecture; extend with the Analytics → Rule → Reflection pace pipeline (L005) and later owner-function catalog refs; AI Adapter unchanged (D004) | Keep existing headings | L005, L168; D046 |
| §2 Event-log discipline | No dedicated heading (event log appears only in the Architecture diagram and Data the Coach May Use) | NEW section: event log = single behavior history; Coach + Gamification read the log only; ~10k events/yr budget; workout.pr Coach/toast only; per-feature revokes; one-H3-owner principle; writtenAt vs occurredAt (TENSION 15) | NEW `## Event-log discipline` | L098, L153, L246, L049, L168, L062; D051 |
| §3 Named rules | `### 2 Rule Engine`'s example-rule list (5 rules) | Keep the Rule Engine mechanics; move the definitive NAMED RULES to a top-level section, one short sub-note per rule: plan-adherence, volume balance, deload suggestion, stallRule, rest-day pattern, injury/limitation, return ramp, journal drought, pace/bulk lines, missed-habit warnings (never tint), quiet meal reminders, and the deferred N5 recovery marked deferred | NEW `## Named rules` | L028, L029, L030, L067, L148, L056, L057, L275, L276, L277, L093, L060; D051 |
| §4 Outputs & surfaces | `### 3 Reflection Generator` (lists daily note, nudge, weekly review, achievement lines) | Re-head/re-scope: outputs list = daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert; the standalone weekly review output is retired — check_in_weekly is a SECTION of the merged Sunday surface (C9.2); milestone review is never a screen | RENAME/RE-HEAD `### 3` → `## Outputs & surfaces` | L156, L099, L032, L092, L065, L172, L264; D051/D052 |
| §5 Achievement tie-in | No dedicated heading | NEW: one-direction reaction to achievement.unlocked / level.reached; loudness taxonomy — ONLY Ring and Grove get a Coach line (one sincere derived line); all other tiers silent in-game toast; ONE Coach line AT MOST per trophy fire (E12); no XP judgment; celebrations respect J4 + facts-only | NEW `## Achievement tie-in` | L166, L137, L158, L176/L177; D051 |
| §6 Context switches | No dedicated heading | NEW: when Coach quiets itself — J4 quiet week (user-started only; streaks stay REAL; quiet ≠ shield; grace is the streak shield — two shields never merge); vacation/period quiets adherence like a deload ("vacation, not laziness"); deload ranges quiet; planned-rest parsing (real-rest vs quiet-miss vs grace — rest only prevents resets, never earns) | NEW `## Context switches` | L278, L214, L263, L030, L139; D051; S068 |
| §7 Privacy & the never-list | `## Data the Coach May Use` | RENAME to `## Privacy & the never-list` (or keep heading + add never-list sub-section — **[Stage C] naming choice**); never-list verbatim-critical (L279); per-feature stamps "facts only" OR "needs text access → user opt-in first" (L158/S025) | RENAME existing heading | L279, L158; D051 |
| §8 Settings | `## Strictness` (lines 102–107) | KEEP Strictness text verbatim (L280 cites :102-107: scales thresholds + tone, never the rule set); add Settings Group 2 content (weekly review day default Sunday, Coach notes in calendar day view, milestone-review cadence editable, quiet-week range) + NOT-OFFERED list (XP/achievement values, formulas, dayActivityScore weights) | NEW `## Settings (Group 2 — Coach)` alongside Strictness | L280, L255, L262; D051/D055 |
| §9 Scheduling & rule-book session | No dedicated heading | NEW: weekly cadence (check-in day configurable — default Sunday, S15-003); milestone-review cadence ladder + smart catch-up (L264/S020); the FULL Coach rule-book = dedicated deferred session after features, before the UI/UX ordering pass (L171/S015); M2 fitness/nutrition rule catalog pending, not built (L190/S017); deferred rules note (N5/S071) | NEW `## Scheduling & rule-book session` | L171, L190, L264, L255, L060; D051; S015/S017/S020 |

### 2.2 Net structural outcome for CoachSystem.md

- **Retained (verbatim or lightly edited):** `## Architecture` + `### 1–4` (pipeline mechanics), `## MVP Coach (Milestone 0)` (D017 stub + 3-miss rule; the Rule Engine mechanics move to Named rules as the MVP rule), `## Validation Goals for the MVP Stub`.
- **Renamed (PROPOSED — pending the §2.4 / Stage C pick, not settled):** `## Data the Coach May Use` → Privacy & the never-list (§7).
- **Kept + extended:** `## Strictness` (verbatim) inside the new Settings section context (§8).
- **NEW headings:** Philosophy (§0), Event-log discipline (§2), Named rules (§3), Outputs & surfaces (§4), Achievement tie-in (§5), Context switches (§6), Settings (Group 2 — Coach) (§8), Scheduling & rule-book session (§9).
- **REMOVAL inside CoachSystem.md:** the standalone weekly-review surface (Reflection Generator's "weekly review" output) — replaced by the check_in_weekly section of the merged Sunday surface (L099, L243; C9.2). Nothing else is deleted — merge only.

### 2.3 Coach-map citation re-anchoring (reference-integrity hazard)

The map carries 41 author `ledger:NNN` citations; 26 are flagged ⚠ off-target (17 clearly off-target, 9 near-but-off; census appendix verdicts). Rule for the docs pass: NEVER quote the map's pointers as authoritative line numbers; re-anchor every citation to the ledger's `Source lines` column for that row (ledger L283, Track-2 #3; intent brief C4.1; census 558–560). The map's §2/§4 sections are organizational indexes only (§1.4 C4.1 depends on this).

### 2.4 Stage C naming decisions (CoachSystem.md)

1. Whether §7 renames `## Data the Coach May Use` or keeps it and adds the never-list as a subsection — recommended: rename, since never-list + inputs are one privacy contract.
2. Whether Named rules live as one top-level section with sub-bullets or as `###` sub-sections under a new `## Named rules` — recommended: sub-sections (each rule is a named, citable rule per DOCS-PASS rule (c)).

---

## 3. Cross-doc dependency impacts (direction matters for drafting order)

Direction: `producer → consumer`. Draft producers before consumers so docs never reference content that doesn't yet exist in the corpus (intent brief §2.5).

| # | Dependency (producer → consumer) | Evidence | Why it gates | Sequencing gate |
|---|---|---|---|---|
| XD-1 | Database.md event list → Architecture.md event model → Gamification.md / CoachSystem.md engines | L002, L097, L098, L155, L156; S032; intent brief §2.5 "Achievements depend on events" | Triggers (spec engine) and Coach recognition consume events — drafting engines before the event list is in the corpus makes the docs reference absent types (e.g., workout.completed, nutrition.logged, goal.progress removal) | S014, S023 (docs-pass immediate) → engines |
| XD-2 | Architecture.md owner catalog (L165/L244/L168) → Gamification.md thresholds → CoachSystem.md lines | L165 ("Coach always cites the owner's verdict"), L168 ("a trophy and its Coach line are literally the same number") | Coach lines and trophy shapes must quote the same owner outputs; author owners first | S024 (owner catalog emitted during docs pass) |
| XD-3 | Architecture.md owners → UIUX.md surfaces | L084/L085 (macro-gap bar calls deriveMacros), L250 (tint calls dayActivityScore), L238 (week strip calls adherenceWeek), L264 (milestone review reads H3 owners) | Surface copy must name the same owner function as Architecture.md (no re-implementation) | S024 → UIUX |
| XD-4 | Database.md phases/body_metrics schema → Gamification.md weekly-checkpoint, Real Progress/On Target, weight ladder | L022, L080, L167, L123, L124, L125, L089, L119, L127 | Gamification clauses read schema tables (phases, body_metrics canonical weigh-in) | C2 package (D046/D047) before C2.5 (D068) |
| XD-5 | Database.md workouts/exercise_sets → Gamification PR/vault/absolute ladders → Coach stall rule | L014, L015, L031, L181, L148 | PR and stall clauses read sessions via session-walk owners | C1.4 (D043) → C7.2 (D068) → Coach (D051) |
| XD-6 | Database.md nutrition_logs → deriveMacros owner → macro-gap bar + fully-logged streak | L072, L084, L085, L119, L127 | Receipt rows are the input to the day-target owner; surfaces consume owner | C5.1/D062 → C2.3/D046 → C5.3/D063 |
| XD-7 | Database.md routine tables (day_templates/routine_days) → UIUX briefing card/session preload + Coach plan-adherence/volume + R11 strip | L240, L115, L028, L029, L238 | Routine schema lands before the surfaces and Coach rules that read it | C8 (D061) → C8.4/C9.x surfaces → Coach D051 |
| XD-8 | Database.md checkin autoCreated + revoke events → Gamification auto-tick XP / negative-XP symmetry | L062, L063, L175, L246 | "REAL when real" anti-farm gate + symmetric reversal need the event machinery first | C6 (D064) after C1.3/C12.2 event rows |
| XD-9 | Gamification achievements (v2 + spec, EXTERNAL frozen) → Coach achievement tie-in | L176, L177, L166, L137 | Coach loudness taxonomy references achievement.unlocked events + v2 tiers | D065 → D051 |
| XD-10 | Event log append-only + D019 → entity-sync milestone → Settings Group 8 → Roadmap restructure | L043, L044, L096, L283, L261, L157, L191; S010/S011/S061 | Sync milestone is a real Roadmap-level change that gates Group 8 rendering and the P2.5 claim replacement | S010–S012 → Roadmap restructure (D059) |
| XD-11 | Backup enumeration + metadata/revoke events → restore guarantees | L042, L095, L097, L098 | Enumeration list must match the tables the entity docs actually define — write tables first, then enumerate | C1.x/C5.x/C8.x → C12.2/D058 |
| XD-12 | MediaStorage.md tier/lifecycle semantics → Database.md media_attachments columns (durationSec, title, adopted) → UIUX vault browser | L142, L218–L225, L100 | Database.md holds columns; MediaStorage.md owns meaning; UIUX renders the merged videos home | D057 → UIUX C11.1 |
| XD-13 | Roadmap milestones → build gates for all feature docs | L191, L157, S005–S022 | Not a content dependency — a timing/ordering dependency; milestone restructure must be agreed (Stage C) before feature docs claim milestone numbers | §7 |
| XD-14 | CoachSystem.md privacy stamps + Architecture.md journal-content rule → every Coach/journal-reading feature | L158; S025 | The stamp repeats per new feature; the rule lives in both docs | S025 (docs-pass immediate) |

---

## 4. Reference-integrity hazards & placeholder reconciliations

### 4.1 Placeholder-reconciliation register (every current-doc "future/placeholder" that resolves into a real definition)

| # | Doc (current text) | Placeholder today | Resolves to (ledger row) | Action in docs pass |
|---|---|---|---|---|
| PH-1 | Database.md line 68: `future: workout.completed, study.session, relationship.event, ...` | workout.completed | L002 — real event type (health area, metadata-only payload) | PROMOTE workout.completed to the seeded event list; study.session / relationship.event remain future (no ledger row — do not invent) |
| PH-2 | Architecture.md line 33 diagram: `goal.progress · task.completed · reflection.created · media.added · (future: workout.completed, study.session)` | goal.progress + workout.completed | L155 (goal.progress RETIRED), L002 (workout.completed promoted) | Remove goal.progress from the diagram; promote workout.completed; keep study.session future |
| PH-3 | Database.md line 67: `goal.progress, goal.completed, task.completed (M1)` | goal.progress | L155 | Drop goal.progress from the seeded event list; goal.completed stays (rare user-declared); task.completed unchanged |
| PH-4 | Gamification.md §Open Items ("Achievement list (first 10)", "grace default value", "Exact XP numbers") | deferred-to-M2 placeholders | L176/L177 (catalog = v2, 178 entries), L183 (grace default 1, settings path), L262 (XP values remain M2-open but NOT-OFFERED as toggles) | Resolve the list + grace placeholders into real content; XP numbers stay explicitly M2-open, guardrailed |
| PH-5 | MediaStorage.md line 233–235: "the exact field is defined with the timeline feature (P3 design)" | physique-photo category field | L100 (anchor = journal entry tagged health+physique, hidden system tag) | Write the anchor into §Physique-Photo Timeline; no new table/path |
| PH-6 | UIUX.md dashboard lines 29–31: "placeholder/empty state in MVP (goals arrive M1 / tasks M1 / streak-XP M2)" | dashboard placeholders | stays true for MVP; block list itself is restructured by L154 fusion (C9.1) | No conflict — placeholder text remains honest; block-list restructure is separate |
| PH-7 | UIUX.md nav line 12: "Later: Goals, Coach, (future systems)" | future nav | L170 (UI/UX ordering deferred), L245 (H4 reveal-on-first-data) | Keep aspirational; do not author fixed nav ordering now |
| PH-8 | Roadmap M6+ line 129–130: "Fitness: workouts, exercises, progression, measurements; emits workout.completed events; maps to Health area. No Apple Health." | one-line future placeholder | C1–C8 ledger rows now fully specify fitness/nutrition/routine | Replace the fitness bullet with the authored scope (see §7.2); study/productivity/AI bullets stay one-line |
| PH-9 | Roadmap Drive Phasing P2.5 (lines 10–15) + M4 (88–101): "syncs only media_attachments metadata and thumbnails" | P2.5 claim | L157 (clash #5 — full data-sync plane first; P2.5 shrinks to big media blobs only) | Replace the P2.5 description + M4 claim during the docs pass (S011) |
| PH-10 | Database.md line 25–28: future `links` table (D023, M7) | future placeholder | D023 — unchanged, still under consideration | Leave as-is (not part of ledger rework) |

### 4.2 Doc-internal stale claims that will conflict during the pass (fix or flag, never silent)

| # | Doc | Stale/conflicting claim | Ledger truth | Disposition |
|---|---|---|---|---|
| RC-1 | Gamification.md line 23 | "Weekly review completed \| small" XP | L173 — reviews NEVER give XP | REMOVAL (strike) — C3.3/C7.4 |
| RC-2 | CoachSystem.md line 85 | Reflection Generator output "weekly review (summary of analytics, one insight, one suggestion)" | L099/L243 — weekly review merges into the Sunday check-in | Re-scope output list to merged check-in section (C4.3) |
| RC-3 | Roadmap M1 line 53 | "progress events flow to event log" | L155 — computed-only owners | Rewrite M1 exit criterion (C3.2) |
| RC-4 | Roadmap M2 lines 69–70 | "Coach generates daily note, nudges, weekly review" | L099 — weekly review = merged check-in section | Adjust M2 wording (C9.2) |
| RC-5 | Roadmap M6+ line 129 | "Fitness: ... emits workout.completed events" | L002 — now a real event; fitness scope fully specified | Author real scope, keep Health area + no-Apple-Health (PH-8) |
| RC-6 | MediaStorage.md line 75–77 / 114 | LocalMediaAdapter wording references IndexedDB blob storage; storage meter "Compute used/available from IndexedDB quota API" | D040 locked Drift + SQLite WASM (2026-08-11); L224 mandates backend-agnostic logical schema | **[Stage C]**: rephrase meter/backend prose to D040 reality OR keep backend-neutral per L224 — human pick; do not silently rewrite |
| RC-7 | Database.md line 152–153 | "SQLite: PRAGMA integrity_check; IndexedDB: probe transaction..." | D040 locked Drift | Leave dual-candidate recovery prose as historical? **[Stage C]**: note D040 resolution inline vs edit — human pick (Database.md still says backend in StorageDecision.md is the verdict home) |
| RC-8 | CoachSystem.md §2 Rule Engine example `goal_slip` | "goal behind schedule >20% → adjust-plan suggestion" | L165/L155 — goal progress computed by owner; pace lines via paceVerdict | Reconcile example rule wording with owner-based pace language (C4.2) |
| RC-9 | Architecture.md line 33 | Diagram event list includes goal.progress | L155 | Remove (same as PH-2/PH-3) |
| RC-10 | Gamification.md line 71 | Open Item "Achievement list (first 10)" | L176/L177 — catalog = v2 178, live | Resolve/delete the open item (PH-4) |

### 4.3 Citation-discipline hazards (never break these while editing)

1. **Coach map ledger citations**: 41 pointers, 26 ⚠ off-target — re-anchor to ledger Source lines; never quote map line numbers as evidence (§2.3).
2. **D-series aliases**: TEMP-PLANNING 2135 says "D5 discipline" — that is D005's alias used for the D035 PC-exclusivity test (L283, L218). Cite as D035 when referring to PC-only video discipline.
3. **S-series citation codes (L284)**: `S1-006` (paceVerdict) ≠ `S10-004` (routine event-A3) ≠ `S13-011/014/016/040/045` ≠ `S15-002/003` ≠ `S20` ≠ `S21` — keep qualified when re-cited.
4. **Family labels (L281)**: backup-A1–A6 vs census-A1–A4 vs routine-A1–A7; audit-B1–B4 vs resolve-B1–B5; audit-C1–C6 vs resolve-E1–E3; spec-E0–E13. Same letter ≠ same family.
5. **E-clash #2 gap**: the range "1–5" implies five entries; #2 is never labeled anywhere — do NOT invent it during the docs pass (ledger 386–391).
6. **G7 vs G7b**: plain "G7" never appears in the source — only G7b (L198).
7. **"audit-C1"/"audit-C2" label reuse**: audit-C2 has ≥3 senses (streak window, strength-C2 ratio, J1 leap-day); audit-C1 appears for meal reminders (L126) and J2 worker note (L212) — qualify every use.

---

## 5. Sequencing-critical structures

### 5.1 Master process gates (apply to ALL rows)

- **S001 — Design-lock gate**: NOTHING in TEMP-PLANNING is applied to docs/ until the user says yes. Single global gate = user final approval (TEMP 789). D041+ IDs remain UNCONFIRMED until then (D040 "next DecisionLog number" prediction already fulfilled — L283).
- **S002 — Ledger-first workflow**: ledger finished FIRST; ONLY THEN adapt all existing docs to fit; ledger stays single source; docs rewritten to match it, never vice versa.
- **S003 — No new inventions during the docs pass**; divergence → new ledger lock entry FIRST.
- **S004 — Feature list CLOSED for the fitness side** (L248).

### 5.2 Docs-pass items marked "immediate once S002 gate opens" (do FIRST in the pass)

| Note | Item | Applies to |
|---|---|---|
| S014 | goal.progress retirement (REMOVAL) — Database event list + Roadmap M1 | L155 / PH-2, PH-3, RC-3 |
| S019 | reviews-never-give-XP strike — Gamification.md weekly-review small-XP line | L173 / RC-1 |
| S023 | coach_outputs.kind dictionary — Database.md (9 kinds + payload shapes) | L156 / C4.3 |
| S024 | Analytics Engine consolidated owner-function catalog — Architecture.md (authority) | L165 / C13.5 |
| S025 | Journal-text privacy stamps — Architecture.md + CoachSystem.md | L158 / C4.4 |
| S026 | Dashboard "Today" fusion wording — UIUX.md block list | L154 / C9.1 |
| S027 | week_plan_slots.dayTemplateId naming — schema block | L121 / C8.2 |
| S077 | `rpe?` struck from exercise_sets schema block | L265 / C1.2 |

### 5.3 Milestone / build-order gates (content timing, from SequencingNotes §B/D)

- **M1 window**: S005 (workouts first, macros after), S006 (auto-assort M1-or-M2), S007 (manual entry M1; NLP out), S009 (nutrition closed → then routine session), S013 (goals.kind from the start), S036/S037 (no-phase fallback, manual TDEE freeze), S039–S041 (account anchor, isImported, check-and-fire), S056–S058 (session→slot, strip window, backfill slot), S060 (period confirmation — day-1).
- **M2 window**: S015 (Coach rule-book dedicated session — AFTER features, BEFORE UI/UX ordering), S016 (UI/UX ordering set aside — revisits LAST), S017 (M2 fitness/nutrition rule catalog one list, pending), S018 (weekly-review-day config / milestone cadence / reviews-XP are M2-time), S019/S020 (milestone review timing + cadence), S021 (Life Tree M2 — blocks nothing M0/M1), S022 (dashboard paint order), S048/S049 (tonnage; MMA absolute), S053–S055 (weekly routine selection; future-only edits; prompt rules), S059 (glance+verdict), S063–S065 (weekly surface, one-tap day, briefing), S069 (coach tie-in).
- **Sync-plane milestone (NEW, Roadmap)** — S010/S011/S012/S031/S061: required BEFORE multi-device M1-phase; P2.5 claim replaced; Settings Group 8 renders only when it ships (§7.3).

### 5.4 Draft-row verdict gates (Stage C APPROVE/REJECT/REFER required before ANY drafting)

- **L001–L010** (11 rows, pending-approval) — C1.1/C1.2/C1.3/C2.x foundations; draft ONLY after verdicts (intent brief C13.3).
- **L269** (Life Tree, draft) — idea-recorded, NOT a spec; M2 scope; feeds Roadmap M6+ idea record (D071).
- **L271–L274** (FUT-2..5, draft) — open questions → DecisionLog open items (D070); S073/S075/S076 bound to L274/L271/L273.
- **L282** (draft schema shapes) — sketch, NOT decided; superseded columns (rpe? struck, week_plan_slots.dayTemplateId, routineSlotLogId) noted (D072).

---

## 6. Terminology conflicts (resolve by qualification, never by silent redefinition)

| Term / label | Conflicting senses | Where each lives (current docs) | Resolution |
|---|---|---|---|
| "weekly review" | (a) Coach M2 weekly output (CoachSystem.md line 85; Roadmap M2 line 70); (b) Gamification XP row (line 23); (c) merged Sunday check-in (ledger L099/L243) | CoachSystem.md, Roadmap.md, Gamification.md | Death of (a)+(b): one merged surface; Gamification row struck; CoachSystem/ Roadmap wording re-scoped (C9.2, C3.3) |
| "goal.progress" | write-path event (Database.md line 67; Roadmap line 53; Architecture diagram line 32) vs computed-only owner (L155) | Database.md, Roadmap.md, Architecture.md | REMOVAL of the event; owner goalProgress(goalId) is the only progress source (C3.2) |
| "week_plans / week_plan_slots" | standalone fitness scheduler (draft L282) vs routine-week binder (L114/L121) | Database.md (future), L282 draft | Re-purpose + rename column dayTemplateId (C8.2; S027) |
| "P2.5" | Roadmap "Metadata & Thumbnail Sync" (lines 10–15, 88–101) vs post-clash #5 "big media blobs only" after plain-data sync (L157) | Roadmap.md | Replace claim; sync milestone first (C7.3 → §7.3) |
| "full-logged day / fully-logged" | ±20% (item-25 legacy, superseded) vs ±10% single band + two paths (L089/L119/L127) | Gamification.md (to be authored), ledger only today | Write the ±10% definition verbatim; keep superseded ±20 cited as history (L089) |
| "week" (three window definitions) | ISO Mon–Sun for A Week Whole (G10, L201) vs WEEK STARTS ON display (L254) vs weekly review-day window ending configured review day (L255/L239/S15-003) | UIUX.md/Roadmap to-be-authored + settings | Every use names WHICH window: G10 is fixed ISO; week-grid first column is display-only; review window is its own owner |
| Label families | backup-A vs census-A vs routine-A; audit-B vs resolve-B; audit-C vs resolve-E; spec-E (L281) | All downstream docs | Mandatory qualification (D074); legend table carried into DecisionLog |
| "audit-C2" | 3 senses (streak window L127; strength-C2 ratio L182; J1 leap-day L211 note) | Ledger/census | Always qualify (e.g., "audit-C2 streak window") |
| "D5" | D005 alias (TEMP 2135) used for D035 PC-exclusivity test (L283/L218) | MediaStorage.md J7 prose | Cite D035 for PC-only discipline; "D5" only as a ledger alias note |
| "G7" | never appears — only G7b (L198) | — | Never author "G7" as a pin label |
| PR "event" vs "record" | workout.pr event (L015/L049) is Coach/toast ONLY; vault truth = session-walk derived (L246/L031) | Architecture.md/Gamification.md to-be-authored | Document both roles explicitly; vault never reads the event |
| "Review" kinds | milestone_review_goal vs milestone_review_anniversary vs check_in_weekly vs nutrition_checkup (L156/L172/L264) | Database.md kind dictionary | One dictionary; no two labels mean the same thing (L156) |
| "pack" vs "meal" | pack slot kind vs meal slot kind; packed food = nutrition_logs row source='packed' (L108/L231), consumed at EAT time (NU4) | Database.md to-be-authored | Slot kinds are template structure; receipts are nutrition rows; never double entered |
| "once per calendar year" | v2 residue vs anchored-year windows (L104/L185); Bookended = the single named calendar exception | Gamification.md to-be-authored | Anchored-year wording everywhere except Bookended's explicit carve-out |

---

## 7. Roadmap.md restructure — authoring NEW scope vs restructuring LOCKED milestones

Roadmap.md on disk (163 lines): `## Milestones` (M0–M6+ lines 1–137) and `## Drive Phasing` (P1–P3 lines 140–162). Two different operations apply, and they must not be conflated:

### 7.1 Restructuring LOCKED milestones (M0–M5) — edit in place, never re-scope

Locked text may be **rewritten only where the ledger supersedes or REMOVEs content** — never re-sequenced, never re-blamed, never silently extended:

| Milestone | LOCKED content affected | Ledger truth | Action |
|---|---|---|---|
| M0 (MVP) | "physical backup (file copy) / restore" (line 37–38); Coach MVP stub (D017) | D016/D040 unchanged; storage meter per §4.2 RC-6 | No structural change; only cross-ref Database.md §Backup |
| M1 (lines 44–60) | "progress events flow to event log" (line 53) | L155 — goal.progress is a computed-only owner, never an event | Rewrite exit criterion to owner-based wording (RC-3 → PH-3) |
| M1–M2 | Daily note / nudges wording | L099 — weekly review is merged into Sunday check-in | Adjust M2 wording (RC-4 → C9.2) |
| M2 (lines 62–88) | "Coach generates ... weekly review" (line 69–70) | L099/L243 — one merged check-in surface | Same as above |
| M3 (backup) / M4 (Drive) | "syncs only media_attachments metadata and thumbnails" (lines 88–101, 95) | L157 (clash #5) — plain-data entity sync ships FIRST; P2.5 shrinks to big media blobs ONLY | Replace claim (PH-9); do NOT re-order locked milestones, add the new milestone (§7.3) |
| M5 (PC) | no change | D032/D035 unchanged | No action |
| Roadmap.md "What is locked" note (lines 3–4) | — | — | Keep the lock note as-is; add a pointer that §7.1/§7.2 changes are the authorized edits |

### 7.2 Authoring NEW scope (Milestone 6+ — was a one-line placeholder)

M6+ today (lines 124–136) is a list of one-line bullets ("Fitness: workouts, exercises, progression, measurements; emits workout.completed events; maps to Health area. No Apple Health." etc.). This is **new scope authoring**, NOT a locked-milestone edit:

| Bullet today | Becomes (per ledger) | Notes |
|---|---|---|
| Fitness: workouts, exercises, progression, measurements; emits workout.completed events; maps to Health area. No Apple Health. | C1 package — workouts/templates/sets/exercises/muscle groups/PR vault/volume/cardio; `workout.completed` event; No Apple Health stays verbatim | Author as a short authored-scope bullet with pointer to Database.md/Architecture.md/Gamification.md (C1.1–C1.5, C7.x) |
| Nutrition: macros, BMR/TDEE, meal logging (in M6+ one-liner) | C2/C5 package — phases, deriveMacros, receipts, food lookup, settings | Author same pointer pattern (C2/D046, C5.1/D062) |
| Routine scheduler one-liner ("Productivity: routines …") | C8 package — day templates, routine_days, briefing, week recap | Replace one-liner with authored bullet (D061); keep "Productivity: routines, projects" promo line intact for the rest |
| Study / Productive Focus / AI (other M6+ lines) | stays one-line placeholder | NO ledger rows — do not invent |
| Life Tree idea (M6+ line ~132) | mark as idea-recorded, NOT scoped (L269) | Author as "idea park: Life Tree (L269)" with pointer to DecisionLog open item (D071) |

### 7.3 NEW milestone: entity-sync plane (inserted BEFORE P2.5) — REQUIRED, per clash #5

- **Source:** L157 (clash #5, ROADMAP ORDERING resolution): the plain-data entity-sync plane is a required NEW milestone inserted BEFORE P2.5; P2.5 in Roadmap.md (lines 10–15 / 88–101) shrinks to big media blobs only.
- **Content (D059):** event log = append-only UNION of distinct event ids; same-entity edits = LWW by timestamp, deviceId tiebreaker (D019); TOMBSTONE RULE — delete always wins over earlier-timestamped edits, entity never resurrects; logical-only, backend-neutral; does NOT change storage backend.
- **Ordering effects:** M1-phase "multi-device" claims must reference the new milestone, not P2.5; Settings Group 8 (sync) renders only when this milestone ships (S061, H4 reveal-on-first-data).
- **File:** Architecture.md §Offline Strategy + §Event Model (C12.1), Database.md event-log sync semantics (C12.1), Roadmap.md new milestone (C12.1). All three land together in the docs pass.

### 7.4 2026 change waves (drafting order for the D1/D2 docs pass)

Two waves keep interdependencies honest; nothing in either wave touches a doc until Stage C verdicts:

- **Wave D1 — spine + schema first:** §5.2 immediate items (S014/S019/S023/S024/S025/S026/S027/S077) → Database.md C1–C8 new tables + event rows → Architecture.md owners (C13.5) → Gamification.md thresholds that read them → CoachSystem.md outputs that cite owners → Roadmap.md author-new-scope + sync milestone (§7.2/§7.3) → backup enumeration (C12.2).
- **Wave D2 — surfaces + consolidation second:** UIUX.md block-list fusion (C9.1), briefing card (C8.4), week recap (C9.3), calendar (C9.4), Settings (C10.1), journal pages (C11.1), session-UI/onboarding (C14) → CoachSystem.md new headings (§2) → DecisionLog D041–D076 (§8) recorded as a batch with dual-listing notes.

---

## 8. Decision proposals D041–D076 (B1 consolidated decisions — requires Stage C confirmation)

Every B1 row carries its decision ids in the ledger appendix form `D041|D042|…`. §8.1 below is the B1 consolidated table verbatim (the only authoritative D041–D076 list). **Not yet confirmed**: Stage C approves/rejects each; the docs pass uses only approved numbers. Next free DecisionLog ID after this batch = **D077** (DecisionLog.md current max = D040).

### 8.1 B1 consolidated decision table (VERBATIM from IntegrationLedger.md appendix, lines 483–518)

The B1 appendix is the authoritative D041–D076 list; per-row assignments in the ledger's per-row table win over any theme-table entry (ledger 520–525). A first-draft B2 paraphrase of this table was independently reviewed and found to diverge: D048/D050 carried wrong themes and row sets, and D044 / D069 / D075 / D076 were dropped and mislabeled "reserved gaps" — they are REAL rows (strength standards; do-not-build records; periods model; session-UI features) and are restored here. Nothing below is "reserved" or an "invented gap."

| D-number | Theme (B1 verbatim) | Ledger rows (B1 verbatim) |
|---|---|---|
| D041 | Fitness domain core adoption (health-area entities + events + seeded lookups + M1 manual-entry scope) | L001, L002, L003, L004, L008, L010, L012, L013, L130, L266, L267 |
| D042 | Workout layering: templates + performed sessions + supersets + two-a-day + unit policy + midnight dayKey + template-deviation | L009, L011, L035, L036, L041, L045, L046, L053 |
| D043 | Strength measurement, PR system, vault source-of-truth, record modes, PO suggestions, drill-down | L014, L015, L017, L020, L031, L034, L037, L047, L048, L049, L117, L144, L246, L247 |
| D044 | Strength standards, profile grades, formula constants, absolute ladders | L007, L143, L160, L181, L182 |
| D045 | Cardio sessions + MET estimate + strength-burn kcal band + manual override | L033, L082, L088, L118, L131 |
| D046 | Energy-balance & macro derivation owners (Mifflin TDEE, sign convention, deriveMacros, rolling avg, thin-data, freezes) | L005, L006, L023, L026, L038, L039, L078, L079, L080, L081, L083, L084, L086, L087, L120, L145 |
| D047 | Phases system (model, baseline, close report, adjacency, rate↔macros feedback) | L022, L024, L065, L151 |
| D048 | Goals extension (goals.kind) + weight/strength goals + goal↔phase consistency | L025, L027, L051, L162 |
| D049 | Computed-only goal progress + Analytics owner catalog + one-owner derived math | L155, L165, L168, L244 |
| D050 | Goal projection + milestone review card + reviews-no-XP ruling | L066, L172, L173, L264 |
| D051 | Coach system restructure per Coach Consolidated Map + named rules + outputs & surfaces + privacy + tie-in | L028, L029, L030, L032, L050, L056, L057, L067, L137, L148, L156, L158, L166, L171, L190, L275, L276, L277, L278, L279, L280 |
| D052 | ONE weekly surface consolidation (H2 + A4 + A6 + nutrition check-up merged) | L092, L099, L101, L243 |
| D053 | Dashboard "Today" fusion + render order + H4 + ordering deferral | L154, L169, L170, L245 |
| D054 | Calendar = memory map (tint, filters, day view, plan-vs-actual, heatmap, periods UI) | L249, L250, L251, L252 |
| D055 | Settings two-tier restructure + Groups 1–8 + not-offered guardrails | L133, L253, L254, L255, L256, L257, L258, L259, L260, L261, L262, L280 |
| D056 | Journal features J1–J7 + quiet week + tags/filters + audits | L211, L212, L213, L214, L215, L217, L226 |
| D057 | PC video library (J7 family) + vlog duration/lifecycle + tier-aware delete | L142, L218, L219, L220, L221, L222, L223, L224, L225 |
| D058 | Backup enumeration + metadata/revoke events + tombstone rule | L042, L044, L095, L097, L098 |
| D059 | Entity-sync plane + Roadmap restructure before P2.5 | L043, L096, L157, L191 |
| D060 | Fitness feature-list closure + phone/PC parity | L174, L248 |
| D061 | Daily routine system (day templates, binding, packs, performed-day, week recap, briefing card) | L108, L109, L110, L111, L112, L113, L114, L115, L116, L121, L128, L228, L229, L230, L231, L232, L233, L234, L235, L236, L237, L238, L239, L240, L241, L242 |
| D062 | Nutrition receipt-line model + producers seam + food macro lookup | L072, L073, L074, L075, L076, L077, L090, L091, L268 |
| D063 | Macro-gap bar + quiet meal reminders (on-open) + zero-XP streak marker | L085, L093, L094, L126 |
| D064 | Habits auto-track bridge + auto-tick XP/anti-farm | L062, L063 |
| D065 | Achievement catalog relationship + census corrections + DOCS-PASS rules | L102, L103, L104, L105, L106, L107, L136, L138, L176, L177 |
| D066 | XP rulings: reviews no-XP, caps, media XP, negative-XP symmetry | L016, L173, L175, L227 |
| D067 | Achievement engine primitives (TENSION 1–15 owners, Ghost, Turn, meta-streak, anniversary) | L139, L140, L141, L146, L147, L149, L150, L152, L153, L163, L164, L178, L179, L180 |
| D068 | Trigger pins G1–G20 + resolve-B/E + E-clash + stall/checkpoint/streak definitions | L089, L119, L122, L123, L124, L125, L127, L132, L134, L135, L148, L159, L161, L167, L183, L184, L185, L186, L187, L188, L189, L192, L193, L194, L195, L196, L197, L198, L199, L200, L201, L202, L203, L204, L205, L206, L207, L208, L209, L210 |
| D069 | Rejected/skipped/declined items — do-not-build records | L052, L054, L058, L060, L061, L064, L068, L216, L265, L270 |
| D070 | Open questions / future ideas — DecisionLog open items | L271, L272, L273, L274 |
| D071 | Life Tree idea — deferred M2, not a spec | L269 |
| D072 | Draft schema shapes block — Stage C verdict required | L282 |
| D073 | Physique-photo anchor (A5) + F5 nudge | L070, L100 |
| D074 | Label-family disambiguation + citation discipline | L281, L283, L284 |
| D075 | Periods model (trip/vacation content containers) | L263 |
| D076 | Fitness session UI features (last-time hints, onboarding, comparison, cloning, copy-as-text) | L018, L019, L021, L040, L055, L059, L069, L071, L129 |

Reconciliation note (ledger 520–525): L173 cross-lists under D050 AND D066 — authoritative single assignment L173 → D050. L280 cross-lists under D051 AND D055 — authoritative → D051. L143 → D044 only. L148 cross-lists under D051 AND D068 — authoritative → D051 (Coach stall rule). Every other row's single assignment is in the per-row table.

### 8.2 Dual-listing notes

- **D041 / D042** stay separate (domain core incl. M1 manual-entry scope vs layering/copy discipline) — B1 assigned distinct row sets; no merge default.
- **D058 / D059** are deliberately separate: backup enumeration + metadata/revoke events (D058) vs entity-sync plane (D059). Do NOT merge even though both touch C12.
- **D048 (goals extension)** / **D046 (energy balance)** / **D050 (projection + milestone review)** are three distinct decisions — do not conflate goals-kind schema, macro owners, and the review card in the batch write.
- **D052 / D053** both touch "Today"/weekly surfaces; verify no duplicate wording in the batch write.
- **D065 / D066** both touch achievements/XP: D065 is the catalog relationship + census corrections (EXTERNAL frozen), D066 the XP rulings — separate DecisionLog entries so one "achievements" decision doesn't conflate them.
- **Cross-listed rows** (L173 in D050+D066, L280 in D051+D055, L148 in D051+D068): each appears in two theme rows above; the authoritative single assignment is B1's per-row table (ledger 520–525).
- **Every row in §1 with a `D###` in Depends on that is NOT listed in §8.1** is cited only as a cross-reference — do not create a decision row for it; Stage C confirmation of §8 is the gate for all.

### 8.3 Final state

This proposal is the full Stage B2 deliverable. After human review of this file (verdicts on **[Stage C]** items, §8 ID confirmation, and the S001 master gate), the D1/D2 docs pass may begin. **No doc was touched; STOP here for review.**