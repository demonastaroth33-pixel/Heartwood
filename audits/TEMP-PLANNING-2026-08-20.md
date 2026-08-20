# TEMP PLANNING — fitness/body-tracking vision expansion (scratchpad)

> **CLOSED (2026-08-20) — fully integrated into `docs/`.** The TEMP-PLANNING
> integration pipeline (Stages A1a–G) is complete: ledger L001–L284, census
> 375 rows, sequencing notes S001–S082, and decisions D041–D076 are all
> drafted into the docs set, which is now the source of truth. This file and
> the pipeline artifacts are archived at `audits/` for provenance. Per
> Sequencing Note S001, the design-lock gate still awaits the user's final
> approval — nothing here is locked until then; D077 is the next DecisionLog
> number when formally decided.

ONLY FILE AUTHORIZED FOR WRITE DURING THIS PLANNING SESSION.
Nothing is locked or applied to docs/ until the user says yes.
Next DecisionLog number when formally decided: D040.

## Decided (session-scoped, pending final user approval)

1. New entities follow the existing entity+event pattern: workouts,
   exercise_sets, body metrics, nutrition, phases. All mapped to `health`
   area (seed list already exists).
2. `workout.completed` event type (already foreshadowed in Database.md /
   Architecture.md as a future type). Event payload = metadata only
   (exercise count, total sets/volume), never the set detail.
3. Exercises: SEEDED LOOKUP TABLE (like `areas`: seeded from code,
   user-extendable) — NOT free text. Enables clean per-exercise progress
   queries. [user choice]
4. Calorie logging: LOG MACROS FROM THE START (kcal + protein/carbs/fat),
   not just a single kcal value. [user choice]
5. Pace computation placement: Analytics Engine computes (rolling average
   vs phase target) → Rule Engine decides whether Coach says anything →
   Reflection Generator phrases it. Same separation of concerns as the
   existing Coach system. No new subsystem.
6. Bulk/cut pace status: compare rolling 7–14 day weight average (NOT raw
   daily weigh-ins — water/sodium/glycogen noise) vs phase's target weekly
   rate; surface as ahead / on-track / behind. Consistent with
   Gamification.md "meaningful, non-engagement-farming" philosophy.
7. Strength standards: plain Dart pure functions, no package/network deps.
   Mifflin-St Jeor (BMR/TDEE), Wilks/DOTS (bodyweight-relative strength),
   Epley (1RM from submax sets). Public formulas, not licensed.
8. Manual structured entry for M1. Journal free-text parsing explicitly
   deferred (real NLP problem; "AI optional, never required" per D004).

## Optimizations (O-series, one-by-one)

O1 (ACCEPTED) — Schema gap fix: templates become first-class storage.
   + workout_templates (id, name, createdAt, updatedAt)
   + workout_template_exercises (id, templateId FK, exerciseId FK,
     order, targetSets, targetReps, pairWith?)
   Weekly plan slots reference DAY templates (per A7 — workout templates
   are reached via day-template workout-kind slots); sessions copy
   template rows into own set rows (frozen history). Template designer +
   paste parser write
   this table. Additive migration.
O2 (ACCEPTED) — Bodyweight exercises get real records: record = best
   clean REP COUNT (no Epley, no fake kg); optional addedLoadKg per set
   (belt/vest) → record can show bodyweight+load. PR events, vault
   ladder, and rep-first suggestions (item 36) all work for bodyweight
   lifts. exercise_sets gains addedLoadKg? (nullable). No strength band
   for these (no published tables) — ratio-only ranking but with a trend.
O3 (ACCEPTED) — Bodyweight for profile ratios/trophies/weight-goal pace
   = 7-day ROLLING AVERAGE (shared utility with phase pace; 14d optional
   for pace). Raw today's weigh-in still visible on scale card. PR
events unaffected (pure bar math). "Adjusting" label while thin
    (<7 days). Known ~7-day lag during fast cuts/bulks — accepted.
    3.3 RESTATED (phase-start / thin data): with fewer than 7 weigh-ins
    the rolling average uses the AVAILABLE days (minimum 1) and always
    carries the "Adjusting" label; NO verdict (ahead/on-track/behind),
    projection, or pace line is computed from a single point; the
    Coach's calm bulk water-jump line (NU8) fires with the adjusting
    state visible — never implying a full window exists. ONE shared
    definition — rollingAvgWeight(dateKey) — used by O3 pace, NU7
    protein g/kg basis, B4 snapshots, and the phase baseline alike
    (missed-then-caught item 4 re-checked against this rewrite: no
    conflict — same mechanism everywhere, single owner).
O4 (ACCEPTED) — Last-time hint freshness tiers: <2wk full hint ·
   2–4wk quieted with date · >4wk collapsed AND PO suggestions pause
   (suggest ~90% of last-time as a starting baseline instead of a
   +2.5kg extrapolation). Constants configurable in settings. No schema.
O5 (ACCEPTED) — One-tap "apply session deviation to template": when a
   session differs from its source template, quiet prompt offers to fold
   the change into the template (structure only — never weights); past
   sessions frozen; per-template "never ask" opt-out.
O6 (ACCEPTED, amended by audit A1) — Backup/export addendum: new
    collections enumerated in the backup JSON: weekPlans /
    weekPlanSlots (routine binder), workoutTemplates,
    workoutTemplateExercises, workouts, exerciseSets, muscleGroups,
    exerciseMuscleGroups, exercises (seeded-lookup user rows),
    bodyMetrics, phases, deloadMarkers, nutrition_logs, nutrition_
    recipe, meal-types lookup, day_templates, day_template_slots,
    routine_days, routine_slot_logs, periods (trip records — user rows
    survive restore). Lookups export via the
    "user rows survive restore" rule (areas + exercises + meal types,
    all seeded-and-extendable); events already covered;
    formatVersion-bumped, additive. Fitness data is metadata-size →
    rides P2.5 Drive pool + D019 deviceId policy for cross-device;
    limitations table (N1) added to enumeration — injuries must
    survive restore; NO media tiering (correctly unnecessary); any
    session media must go through MediaRepository only (D013
    discipline).

O6-ADD-ON (audit A2, user: TRUE cross-device sync) — This O6 claim was
    inspected against the docs: P2.5 per Roadmap.md syncs only
    media_attachments metadata + thumbnails; nothing syncs entity rows
    (workouts, nutrition, body_metrics, journal) phone ↔ PC. The user
    WANTS true two-way sync, not one-writer-per-device. CONSEQUENCE:
    a general ENTITY SYNC PLANE is needed — sync plain-text/stat
    entity data between iPhone PWA and Windows (same repo, same
    single event log). Mechanism is already defined by D019: event
    log = append-only UNION of distinct event ids (no merge needed);
    same-entity edits = LWW per entity by timestamp, deviceId breaks
    exact ties. TOMBSTONE RULE (audit 4.3, refines D019): a delete
    ALWAYS wins over an earlier-timestamped edit arriving late from
    another device — the entity never resurrects if the incoming write's
    timestamp predates the tombstone (applies to workout.deleted I2,
    habit revokes, and journal/nutrition/body deletes alike). This makes
    the "connection first" — a real milestone,
    not a wording tweak. It does NOT change the storage backend
    decision (D007 stays pending M0 Session C); it adds a sync service
    layer documented as REQUIRED before we ship multi-device M1-phase.
    Effort note for later: the entity-sync plane is a first milestone
    addition (Roadmap restructure when approved) — everything else in
    this ledger assumes one-writer-per-device and remains valid.
    ROADMAP ORDERING (clash #5 — RESOLVED, user picked A): the FULL
    data-sync plane is a NEW milestone that goes BEFORE the old P2.5
    photo sync; P2.5 does not vanish — it shrinks to "big media blobs
    only" (since plain data now has its own sync). Roadmap M4 P2.5's
    "synchronizes ONLY media_attachments metadata + thumbnails" claim
    is replaced during the docs pass with: plain-data sync milestone
    first, media sync after. Same D019 mechanism for both.
O7 (ACCEPTED) — Two-a-day rule stated: multiple sessions per day
   allowed (own workouts rows; dateKey already supports it); a plan slot
   counts DONE if any session references it; freeform sessions = "done
   differently" (item 30); PR per exercise per session already safe;
   volume/tonnage sum naturally. No schema change.
O8 (ACCEPTED) — Unit strategy: STORE kg everywhere (weightKg,
   addedKg, body targets), display-convert only (settings key
   unitSystem kg|lb for kg→lb / cm→in); engines always compute in kg;
   no mixed paths, no stored rounding, backups pristine.
I-series (third sweep):
I3 (ACCEPTED) — workout.pr payload enriched with bodyweight (rolling
   avg) + ratio at PR time — for Coach/toast ONLY. Vault rows show
   "Bench 100 est @ 78kg (1.28×)" rendered at VIEW TIME via
   strengthSnapshot(exerciseId, asOf) with the 7-day bodyweight average
   anchored at that session's date — never read from the event
   ("without recompute" RETRACTED per the PR/vault source-of-truth fix).
   Payload-versioned, additive.
I5 (ACCEPTED) — Goal ↔ phase consistency: creating a weight goal
   auto-proposes a matching phase and vice versa (one-tap link);
   conflict warning if active phase contradicts the goal.
I7 (ACCEPTED) — Midnight rule: dayKey always = capture-time LOCAL
   date of the session; kills day-boundary bugs. (3.6 clarification:
   under sync, dayKey is computed per-device at capture time; LWW (D019)
   resolves conflicting writes — a documentation clarification, not a
   bug fix.)
I6 — REJECTED (next-week preview in check-in; user declined).
I2 (ACCEPTED) — Deletion semantics: deleting a session writes a
   workout.deleted tombstone event and DERIVED STATE RE-DERIVES —
   per-exercise all-time best, last-time hints (O4), volume/tonnage/
   adherence aggregates for affected days, N7 auto habit check-ins,
   vault/PR ladder re-render. Best is derived (item 17) so this is
   inherently safe; cheap at personal scale.
I4 (ACCEPTED) — Actionable pace nudges: gap (actual − target kg/wk)
   → kcal gap (×7700) → 220-kcal-day style split into DIET lever
   (−kcal/day) and ACTIVITY lever (+1 cardio session/MET kcal);
   never "push harder in the gym" on a training-recovery context;
   heavily-behind asks recalibration not crash; ahead-in-cut sounds
   cautious (slow loss = muscle). Advisory only, in check-in + phase
   report, no XP, never auto-adjusts phase.
I8 — SKIPPED (picker ergonomics; user declined).
I9 (ACCEPTED, amended) — Onboarding flow: first-run captures Mifflin
   inputs (height/age/sex/activity), proposes a first weekly plan and
   seeded tracked exercises — BUT user can customize/replace/clear all
   of it from day one; nothing forced. Energy math alive day 1.
I1 (ACCEPTED) — Exercise drill-down: dashboard "Your lifts" entry block
   (tracked exercises only — tiny est-1RM sparkline, record, status
    dot, deload/injury aware) + full drill-down SCREEN (est-1RM curve,
    top-set trend, PR markers from derived session-walk (audit round),
    deload (32) + injury (N1)
   bands shaded, ratio overlay from O3 rolling bodyweight, every logged
   set). Untracked exercises: drill-down reachable from within a
   session only. Architecture: pure read-path aggregation
   (buildExerciseDrilldown in analytics engine; UI → repo → engine;
   view-model out; no cache needed at personal scale). Deep-links from
vault (33), comparison (N4), check-in (34), phase report (N9).
    Zero schema change.
F1 GOAL PROJECTION (COMMITTED): goal card shows the deadline AND the
    derived "at current pace → ~date" line (weight: rolling-trend
    extrapolation; strength: est-1RM regression — the projection metric
    switches by the exercise's B1 record mode (audit 4.5: rep-count-mode
    uses the clean-rep trend, never est-1RM); honest-estimate
    labeling; needs ≥2wk data else "more data" tag; stale/deload
    periods = uncertain tag; always derived, never stored; also a line
    in phase close report (N9). Tiny.
F2 REST-DAY PATTERN DETECTION (COMMITTED by user pick): sustained
    rest-day training (≥3 rest days trained in trailing 4 wks, or 3-in-
    a-row) → Coach pattern alert + suggest moving volume to a training
    day or a deload (item 32); occasional = silent/neutral; advisory
    only, no XP/no punishment; lands in check-in (34) + calendar week
    view; routes through the quiet-week/period-quiet preconditions like
    every Coach rule (S13-011 carry-over list) — rest-day training inside
    a period/vacation never fires a pattern alert. Zero schema.
F4 TEMPLATE CLONING (COMMITTED by user pick): one-tap "Duplicate
    template" → variant copy (exercises/sets/reps/order/pairings) for
    new phases or splits. Trivial.
F5 PHYSIQUE-PHOTO CADENCE (COMMITTED by user pick): optional monthly
    nudge to add a D031 timeline photo (off by default, no nagging).
F6 COPY SUMMARY AS TEXT (COMMITTED by user pick): weekly check-in /
    phase close report → plain-text clipboard copy for journaling.
F3 SESSION POST-NOTE — not selected; dropped from review list.

## Draft schema shapes (discussion draft — NOT locked)

```
workouts (sessions)
- id, dateKey, occurredAt, area (health), phaseId?, templateId?, kind
  (strength|cardio), durationSec?, distanceKm?, avgEffort?, kcalBurned?,
  routineSlotLogId? (2.2 — set at save from the slot that preloaded the
  session; null = freeform), notes?

exercise_sets
- id, workoutId (FK → workouts), exerciseId (FK → exercises),
  setNumber, reps, weightKg, addedLoadKg? (O2 — bodyweight only)

exercises (seeded lookup)
- id, name, category?, userDefined, active, progressionStyle?,
  stepOverrideKg?, tracked (bool)

exercise_muscle_groups (junction)
- exerciseId, muscleGroupId, role (primary/secondary)

muscle_groups
- id, name, parentId? (null = broad group), userDefined

body_metrics
- id, dateKey, occurredAt, type (weight | measurement_waist | ...),
  value, unit, phaseId?, notes?

nutrition_logs (RECEIPT LINES — per-meal rows; day total = SUM of rows, never stored)
- id, dateKey (ACTUAL eat date — backdating allowed, see NU4), occurredAt
  (actual eat-time, not save-time), mealTypeId?, recipeId?, name? (free text),
  kcal, proteinG, carbsG, fatG, source (manual | recipe | scanner |
  fooddb | packed), packedFromDateKey?, notes?
- portion multiplier lives ON THE ROW (1x/1.5x/2x resolved at save), not 5
  recipe copies.

nutrition_recipe (one-time setup for everyday meals)
- id, name, kcal, proteinG, carbsG, fatG, mealTypeId?, servingNotes?
- "re-log since" batch back-fill optional (future UX), never auto-rewrite
  history.

weigh-ins — SAME pattern as goals: body_metrics type=weight rows; scanner/
scale later just writes one of THE SAME rows automatically (see nutrition
session NU5: "every input prints the same receipt line").

phases
- id, type (bulk | cut | maintain), startDate, endDate? (null = ongoing),
  targetWeeklyRateMin, targetWeeklyRateMax, notes?

week_plans
- id, name, createdAt

week_plan_slots
- planId, dayOfWeek 0-6, dayTemplateId? (null = rest) — see A7: after gym
  moved inside the routine, the binder references DAY templates, NOT
  workout templates. deload? n/a — see deload_markers

workout_templates (O1)
- id, name, createdAt, updatedAt

workout_template_exercises (O1)
- id, templateId, exerciseId, order, targetSets, targetReps, pairWith?

deload_markers
- id, startDate, endDate, reason?, journalEntryId?, notes?
```

## Session 2 — workout side expansion (user-driven additions)

9. Workout SETUPS (routines/templates): create, store, actively edit
   reusable workout setups; ALL performed workouts accumulate as stored
   history. Two-layer model: templates + performed sessions (copy,
   append-only history). "Routine templates" future idea pulled in.
10. AUTO-ASSORT PASTE PARSER: paste a workout text block → app
    auto-assigns exercises/sets/reps/weight in the UI. Scoped as
    RULE-BASED structured parser, NO AI, offline. Refines the earlier
    "parsing deferred" stance: feature WANTED; general NLP still out.
    Timing: M1-or-M2.
11. Per-exercise progress tracking: user designates specific exercises.
    (Resolved in item 16.)
12. Priority order (user): workout side (incl. phases) FIRST, macros after.

## Session 3 — workout side LOCKED (design-level)

13. Workout layering: named day-template bindings (7 slots, per A7 —
    the weekly routine binds day templates; workout templates are
    reached via workout-kind slots) →
    performed SESSIONS (copy of that day's template; frozen, append-only
    history). Plans editable/switchable anytime; edits affect future only.
14. Exercises lookup (seeded, user-extendable like areas) gains muscle
    tags assigned ONCE per exercise (primary + secondary, via junction
    table) — sets auto-inherit, never re-logged per set.
15. Muscle-group hierarchy (seeded, user-extendable, 2 levels):
    legs → quads/hamstrings/glutes/calves · push → chest/shoulders/
    triceps · pull → back/biceps/FOREARMS/rear delts · core → abs/
    obliques/lower back. Analytics queries BOTH levels off same tags
    (specific "quad sets" + rollup "all legs sets").
16. Progress metric: est 1RM (Epley from BEST working set — zero max
    attempts, safe) + raw top-set shown alongside. PR detection = est 1RM
    beats all-time best.
17. PR system: TRACKED exercises toggle; per session the BEST set's est
    1RM (Epley) vs ALL-TIME derived best (no stored counter — derived
    from history, deleting sessions can't re-mint PRs). Strictly-greater;
    1–12 rep guard (>12 reps excluded); ONE PR credit per exercise per
    session. `workout.pr` event (exercise, new est, previous best,
    session ref) → Coach + gamification consume from the log.
18. Gamification: full suite; PR XP intentionally SMALL ("personal
    milestone"); milestone tiers (1st/5th/10th); size-weighted (+≥2.5kg
    counts, micro-PRs don't); zero XP for logging itself. Growth displays
    (curve, deltas, volume trends) are the centerpiece, not XP.
19. STRENGTH PROFILE (LOCKED): per tracked exercise — est-1RM ÷ current
    bodyweight ratio; BIG-5 (bench/squat/deadlift/OHP/row) get seeded
    beginner/intermediate/advanced tables; other exercises ratio-only.
    PLUS overall level = average of big-5 ratios (Wilks-style). Fully
    derived → auto-updates on every workout/weigh-in, never stale.
20. AUTO-ASSORT (LOCKED): rule-based, loose grammar ("4x8@60kg",
    "4 sets of 8 @ 60kg", "4×8 60kg", "60kg - 4 sets x 8 reps").
    Unknown/typo'd names → fuzzy match + "Did you mean?"
    confirm; new names → inline create flow with muscle assignment.
    Never silent auto-create. Built M1-or-M2.
21. Daily logging flow: PLAN-DRIVEN + editable — day pre-fills template
    exercises with target sets/reps; user types actual weight × reps per
    set. Add/remove/swap freely; freeform + paste as fallback. Plans
    never store weights (structure only).
22. EVERY set logged (volume analytics need all); est-1RM/PR use ONLY the
    best set = highest-estimate set within 1–12 rep guard. [user-confirmed]
23. LAST-TIME HINT: previous session's weight + reps + est-1RM faintly per
    set — logging = confirm-or-bump.

## Session 3e — PHASES LOCKED + energy-balance math core

24. Phases: type bulk/cut/maintain; startDate; endDate OPTIONAL (user
    chooses planned date OR open-ended; one active phase; close
    explicitly, optional "how'd it go" step). BASELINE WEIGHT anchored
    at start. Default weekly-rate presets exist BUT auto-adjust to
    macro-goal targets (item 27).
25. ENERGY-BALANCE MATH ("absolutely solid"): Mifflin-St Jeor BMR
    (+5 male / −161 female) × activity factor → TDEE. Expected weekly
    weight change (kg) = (logged kcal − TDEE×7) / 7700. Compare
    PREDICTED vs ACTUAL via the 7–14 day rolling weight average (never
    daily — water/glycogen/noise). 7700 kcal/kg is an estimate; UI shows
    honest margin, no false precision; converges over ~2+ weeks.
26. Phase rate ↔ macros feedback: set phase rate → app derives
    calorie/macro targets from TDEE; set macro targets → app derives
    weekly rate. Auto-recomputes. (Final shape lands in NUTRITION
    session — deferred.)
27. BROAD WEIGHT GOALS: reuse existing M1 `goals` system — "reach 75kg by
    <date>"; progress auto-computed from body_metrics rolling weight;
    pace = remaining kg ÷ remaining days; deadline grading. NOT new.
28. TDEE BASELINE: BOTH — Mifflin-St Jeor auto-estimate (height/age/sex/
    activity as settings keys; "settings not profile" intact) WITH manual
    TDEE override.

## Session 4 — fitness feature expansion (one-by-one reviews)

29. STRENGTH GOALS (COMMITTED): goals gain kind (generic|weight|strength).
    Strength goal = exercise FK (must be tracked) + target est-1RM +
    targetDate; baseline = best est-1RM at creation; progress
    auto-computed from the strength curve; pace graded
    ahead/on-track/behind (same pipeline as phases); est-1RM ≥ target →
    existing goal.completed event; deadline miss = "missed by X kg".
    Schema: additive nullable cols on goals (kind, exerciseId?,
    targetValue?). Estimates labeled.
30. PLAN-ADHERENCE COACH (COMMITTED): per-slot adherence % derived from
    sessions vs plan slots; free-training deviations = "done differently"
    (not missed); Coach rule distinguishes single reasonable miss vs
    pattern ("skipped chest 3 of 4 weeks"); deload-tagged weeks exempt.
    Analytics computes weekly aggregate → Rule Engine filters patterns →
    Reflection phrases. No schema change; optional derived cache row.
31. VOLUME BALANCE (COMMITTED): seeded min-effective-sets-per-week
    baselines per muscle group (MRV-style, settings-editable); weekly
    under-floor + imbalance checks (chest 18 vs back 3); phase-adjusted
    floors (cut may run lower); advisory only — never XP/penalty.
    Settings keys only; zero core schema change.
32. DELOAD MARKERS (COMMITTED, amended): dedicated table deload_markers
    (id, startDate, endDate — ANY range, reason?, journalEntryId? FK →
    journal_entries, notes?). Days within range: adherence quiet,
    volume-balance exempt, strength chart shaded; PRs always real.
    Journal side unmodified — reverse reference rendered by querying
    markers for the entry (cheap at personal scale). Coach can suggest a
    deload after sustained low adherence. Separate table, NOT a phases
    type (a deload can occur mid-phase; keeps phase semantics clean).
33. RECORDS VAULT (COMMITTED): derived-only view — all-time est-1RM
    ladder per tracked exercise (with dates), PR history timeline from
    session-walk re-derivation (audit round: NOT from workout.pr events —
    events are Coach/toast only), milestone trophies (1st/5th/10th
    PR, 1.5×/2× bodyweight, 100th workout, all-time tonnage per group,
    yearly counts) with small XP per item 18, lifetime totals (workouts,
    sets, tonnage, phase training days). Zero schema change; trophy
    definitions seeded like achievements.
34. WEEKLY FITNESS CHECK-IN (COMMITTED): one derived summary on a
    configurable day — rolling weight trend vs phase baseline, pace
    status, adherence + pattern flags, volume snapshot + balance, PRs/
    records, goal pace, + one Coach line per strictness mode. Generated
    via coach_outputs (existing pattern); analytics→rules→reflection
    pipeline; read-only, annotatable. No new tables.
35. CARDIO SESSIONS (COMMITTED, user-shaped): workouts gain kind
    (strength|cardio) + nullable durationSec?, distanceKm?, avgEffort?,
    kcalBurned? — additive columns, one session concept. Cardio entry:
    type (Run/Cycle/Row/Swim/Walk/Stairs), duration, distance optional,
    effort /10 optional. MANUAL kcalBurned always available (machine/
    watch) and feeds energy-balance math directly; MET estimate
    (MET × 3.5 × bodyweightKg × minutes / 200 — the ×3.5 is part of the
standard MET method, never omitted; public tables) auto-suggested
    when a cut phase / weight goal is active — manual always overrides,
    estimate always labeled. Exercises lookup gains cardio seed entries.
    Cardio slots feed adherence; weekly cardio minutes + type split in
    analytics/check-in. Highly valuable during cuts.
36. PROGRESSIVE-OVERLOAD SUGGESTION (COMMITTED, refined): per-exercise
    progression style — LINEAR-WEIGHT (compounds, weight steps),
    REP-FIRST double progression (accessories: +1–2 reps first; reps
    > target by 2 across sets THEN weight bump + reset reps),
    BODYWEIGHT (reps/sets/added load, no fake kg). Stage-derived
    cadence (beginner per-session → intermediate weekly → advanced
    3–4 wk/rep-creep) auto-derived from strength bands + workout
    history. INCREMENTS USER-CONFIGURABLE: global settings default
    (2.5kg step, +2 rep-first threshold) + per-exercise override
    (e.g. deadlift +5kg, microplates, pull-ups rep-only). Conservative
    by default; session effort can veto; deload-aware (lighter/none);
    always suggestion-only, never XP. AUTO BY DEFAULT with zero setup:
    styles auto-seeded by exercise type (compounds → linear-weight,
    accessories/machines → rep-first, bodyweight → reps) and the
    suggestion auto-generates each session. OVERRIDE AT EVERY LEVEL:
    per-session (tap to accept/change the suggested number), per-exercise
    (style + step), and GLOBAL KILL-SWITCH in settings (auto-suggestions
    off → static last-time hint only). Effectively no schema change —
    exercises gain progressionStyle + step overrides (additive; settings
    gain toggle + defaults).

37. SUPERSETS (COMMITTED): pair control in template designer (adjacent
    exercises); session screen mirrors back-and-forth rhythm; pairing =
    ordering metadata only — never skews est-1RM/volume/PR math; additive
    pairWith column on template rows; sessions don't store the pairing.
    Templates only; freeform/paste stay unpair-aware.

## Feature reviews (N-series, one-by-one)

N1 INJURY/LIMITATION TAGGING (COMMITTED): limitations table
   (target: exerciseId OR muscleGroupId, startDate, endDate?, note).
   While active: PO suggestions quiet, PR framing softened, volume
   floors suspended (like deload), SWAP SUGGESTIONS from same muscle
   group ("Squat limited — leg press instead?" via muscle tags),
   adherence patterns learn limited-not-lazy. Healed = instant restore;
    history kept (Coach: "limited 3× this year"). No medical claims —
    user-declared flag + behavior changes.
N2 POST-DELOAD RETURN GUIDANCE (COMMITTED): stale-activity return ramp
   — first-session suggestion ~90% of last time, ramp 90% → 95% → 100%
   → normal PO logic across 2–3 sessions of that exercise; PR framing
   quiet during ramp; volume floors half-strength for first return week;
   reuses O4 staleness tiers; applies to deload rebounds AND injury
    healing exits (N1). Constant editable. No schema.
N3 WARM-UP SETS — SKIPPED for now (user). Deferred line: setType
    (working|warmup) column + exclusions from volume/PR/est-1RM/
    adherence. Not lost, revisit anytime.
N4 SESSION COMPARISON (COMMITTED): "Compare" on any past session →
    side-by-side vs previous same-template session: per-exercise
    weight/reps/est-1RM deltas, volume delta, PR flag; stale gaps (O4)/
    deload/injury contexts annotated, never judged; reachable from
    history, calendar day, and records vault. Pure derived UI, no schema.
N5 RECOVERY READINESS — SKIPPED for now (user). Deferred line:
    morning 1–5 recovery_log + PO/Coach branches + M2 correlation
    analysis + deload trigger + check-in line. Revisit anytime.
N6 EXERCISE CUES/NOTES — SKIPPED for now (user). Deferred line:
    cueNotes text col on exercises, dimmed at block top, editable
    everywhere, swap-suggestion reuse. Revisit anytime.
N7 HABITS BRIDGE (COMMITTED): habits can be AUTO-TRACKED
    (autoSource: "workout", future "weigh-in"); session save
    auto-writes the day's habit check-in in the same transaction
    (checkin gains autoCreated flag); no double entries (manual wins),
    session deletion cleans up its auto check-in AND emits a compensating
    habit.completed_revoked event (referencing the superseded
    habit.completed, metadata-only like the original, written
    transactionally with the checkin delete — audit 3.1); deload-day
    counting is a per-habit choice (default: counts). No new tables.
    Gamification/Coach continue reading the event log only, per
    Architecture.
AUTO-TICK XP + ANTI-FARM (clash #4 — RESOLVED, user picked A): an
    auto-ticked habit counts as a REAL completion — full XP, like a
    manual tick — but ONLY when the triggering session is real (runs
    the same anti-cheat gate as everything else; nothing can mint XP
    from fabricated/fake session data). A revoked tick (session
    deletion) returns the XP with the compensating
    habit.completed_revoked event — points are never double-earned and
    log-delete-log cycles can't farm. Rule lives in the shared
    anti-farming gate, not per-screen.
N8 SESSION MEDIA — SKIPPED for now (user). Deferred line: widen
    media_attachments to polymorphic entity anchor (journal|workout)
    via additive migration; tiers/PC-archive unchanged; M2+ timing.
    Revisit anytime.
N9 PHASE CLOSE REPORT (COMMITTED): closing a phase renders a full
    report — weight trend (+kg via rolling avg), pace verdict vs
    target rate, sessions count (strength/cardio), adherence %, volume
    totals + group volume, PRs (list with margins), achievements,
    goal pace, + one Coach line. All derived from existing data (items
    17/24/25/29/30/31/33); snapshot optional into coach_outputs like
    the weekly check-in. No new entity — integration work only.

## Audit round (user: "set in stone + fatal flaws + optimization + only-if-needed features")

Integrity fix — PR/vault SOURCE OF TRUTH unification (closes a contradiction):
CONTEXT: item 17/I2 say all-time best is DERIVED from sessions (delete-proof),
but item 33 says the vault timeline reads `workout.pr` EVENTS. If a PR came
from a session that is later deleted (or edited), the event remains in the log
→ stale PR shown. Also sessions are "frozen append-only" yet users WILL fix a
typo'd set, and no edit semantics exist; the vault event-derived view breaks.
RULE (supersedes item 33 wording): PR ladder / vault timeline / milestone
history = ALWAYS DERIVED by walking sessions chronologically (per-exercise
running best). workout.pr events exist for Coach/gamification/realtime toast
ONLY — never the truth for vault or achievements. Consequence (in-place edits
are safe): editing a session's sets OR deleting it simply re-derives everything;
no event surgery, no stale PR. XP SYMMETRY (audit MED-13): when re-derivation
removes a previously-fired PR-XP (session set edit/delete), the gamification
engine writes a NEGATIVE XP EVENT (S13-014 symmetry, analogous to
habit.completed_revoked) so totals stay reconciled; PR XP never resurrects
without a fresh real PR. Do-not-veto-this lightly — contradicts nothing
else once unified.

Naming/architecture optimization — ONE canonical strength entry point:
Don't scatter per-view aggregation. Define a single reader function
  strengthSnapshot(exerciseId, {asOf}) -> { bestEst1Rm, topSet, curve, ratio,
  bands, progressionStyle, context(lastTime, fresh/deload/injury/stale) }
The locked read-views then ALL consume it: drill-down (I1), ladder/vault (N1
TIMELINE above), session comparison (N4), goals (29), projection (F1),
strength profile (19), PO suggestion (36). One implementation, many views,
no view-specific drift.

No new features to add — the surface is complete (workouts, sets, exercises,
templates, plans, phases, PR, vault, PO, cardio, volume, deload, injuries,
adherence, goals, habits bridge, check-in, phase report, media deferred).
N3/N5/N6/N8 and periodization remain park-able future items; rest-day patterns
(F2) and recovery readiness (N5) cover rest enough for M3+. Recommendation:
features list is CLOSED for the fitness side; add only when real usage says so.

A3 EVENT-LOG COVERAGE FOR NUTRITION/BODY (user APPROVED — audit fix):
Architecture mandates "every meaningful action → one behavior event log,
written transactionally" (D001/D019), yet the ledger only defined
workout.completed / workout.pr. Meals and weigh-ins were entity-only rows —
food is the user's core mission (bulking) yet invisible to the Coach, and
the "single behavior history" principle was silently breached where it
matters most. FIX: add two METADATA-ONLY event types, same pattern as
journal.created / workout.completed (summary in event, truth in entity):
    + nutrition.logged — per logged meal (mealType, kcal/macro totals,
      source, actual eat dateKey); pack-consumes also emit this (they
      become nutrition rows). No recipe detail in the event.
    + body.weighed — per canonical daily weigh-in (first-of-day, NU8);
      value stays entity-side; event says it happened + rolling context.
    + nutrition.removed / body.weighed_revoked — REVOKE events for
      meal/weigh-in deletion or correction, written transactionally with
      the row change (audit 4.2). CROSS-DOMAIN DECISION, ONE pattern:
      habit → habit.completed_revoked (N7), journal → journal.edited/
      .deleted (existing), nutrition → nutrition.logged/.removed, body →
      body.weighed/_revoked. Every domain's delete/undo writes a
      compensating metadata event; Gamification/Coach keep reading the
      event log only — no per-domain bespoke fix.
No per-set, per-slot, or routine-noise events — exercise_sets history and
routine_slot_logs remain entity-only. Cost: ~2k small rows/yr, trivial
vs the ~10k/yr design budget; payloads additive-versioned. BENEFIT: Coach
sees the food/weight story; sync (A2) merges events as append-only UNION
with zero conflict — the more core data lives in the log, the easier true
cross-device sync becomes. A1 backup "events already covered" now holds
for nutrition/body too.

## Nutrition session (LOCKED core)

NU1 DAILY ENTRY MODEL (LOCKED): per-meal receipt lines (nutrition_logs);
day total = SUM of rows, never a stored day row. "Single row per day" is
just a day with one entry — NO schema mode switch, no split query paths.
Meal rows carry dateKey (ACTUAL eat date), occurredAt (ACTUAL eat time —
backdating is central, not an afterthought), mealTypeId? (label), recipeId?,
name? (free), kcal, macros, portion multiplier (1x/1.5x/2x resolved on the
row, never more recipe copies — keeps eating packed diff sizes cheap).
NU2 MEAL TYPES (LOCKED): seeded label presets (breakfast/lunch/dinner/
snack) user-extendable + editable (rename/add/delete own; deleting a type
never touches existing rows). Cosmetic grouping only.
NU3 RECIPES ("re-meals" for everyday food like shakes) (LOCKED):
nutrition_recipe table (name, kcal, macros, mealTypeId?, servingNotes?);
one-tap log fills a fresh ROW with timestamp now; favorites/recents bar
shows top-logged recipes for 1-tap daily logging; portion multiplier on the
row; editing a recipe NEVER rewrites past rows (copy-in at save; recipeId
kept for traceability) — but note as future: a "re-log since <date>" option
in recipe editor could bulk-rescan past dateKeys (opt-in).
NU4 CATCH-UP / BACKFILL (LOCKED, user reality: phone NOT always with you —
school): meals file under ACTUAL eaten date (NOT capture date — this is a
deliberate EXCEPTION to the I7 midnight rule, flagged); logging anytime
later in the day still belongs to that meal slot; gentle "you logged a meal
for yesterday" nudge to prevent double-counting next-day breakfast; batch
school-end screen = "lunch to school + afternoon snack" in one flow; daily
routine pre-filler NOT yet decided — carried to routine-designer session,
separated as an NU-open (see open items below).
NU4a SOFT DUPLICATE GUARD (audit 3.2/8.4): when logging a meal, if a
row already exists with the same dateKey + mealTypeId + recipeId/food
selection, a soft NON-blocking prompt shows ("Already logged X for this
meal — add another?") — the user decides, no hard block. The school-end
catch-up batch and the morning-briefing pack consumption share THIS one
check — same mechanism, not a separate guard.
NU5 SCANNER + WEIGH-IN SEAMLESS (LOCKED, integrity principle): scanning
(photo/OCR/recognition) is NOT its own data model — a scan PRODUCES the same
receipt row (kcal/macros + source='scanner'). Architecture allows a future
scanner to be a new producer that emits the same standard log; no schema
change needed to accept it later, works offline forever. SAME for a smart
scale / weigh-in (source='scale') — today's weigh-in stays manual; later an
auto-import just writes body_metrics type=weight rows. Rule that keeps this
simple: "every input prints the same receipt line." A `source` column is the
hook — cost is one nullable column.
Daily routine template (packing, school meal slots) — DELAYED by user
decision; will be a separate design session AFTER nutrition section is
fully closed, not folded into nutrition now.
NU6 MACRO TARGETS DERIVATION (LOCKED): TDEE (Mifflin, auto-recomputed on
rolling weight; inputs/activity as settings, manual override honored) is the
spine. calorieTarget = TDEE + (rate × 7700)/7 — rate is SIGNED and
ADDITIVE (−cut / +bulk), the canonical form per AUDIT CLOSURE (1); the
old "± surplus/deficit" framing is retired here. Either user input
drives the other (set rate → target; set target →
implied rate). Presets per phase with per-KG defaults (bulk emphasis —
user's main focus for the year). Auto-recalibrates as weight moves so pace
stays constant; no re-tuning needed. Coach voices the bulk-side caution
("gaining too fast = fat") alongside locked cut-side caution (ahead-in-cut
slow-loss-is-muscle).
NU7 PROTEIN g/kg PER PHASE (LOCKED): fixed order split — 1) protein
g-per-kg on bodyweight (phase-defaults: cut 2.0, bulk 1.8, maintain 1.6 —
editable, per-Area SETTING override — D003: settings, not a profile),
2) fat floor ~0.6 g/kg (hormone
floor, editable up), 3) CARBS AS REMAINDER (kcal − protein×4 − fat×9)/4.
Reversible: setting macros yourself derives the implied weekly rate ("two-
way like item 26"). Public formulas (4kcal/g protein, 9kcal/g fat, 4 carbs
— standard Atwater).
NU8 WEIGH-IN RESOLUTION (LOCKED): multiple per day allowed and STORED, but
the canonical daily trend may be FIRST weigh-in of the day (morning fasted
— consistent); later same day entries logged but excluded from derived
series; honors O3 rolling average; no new storage schema since weigh-ins
already typed rows (all stored).
FIRST-OF-DAY DELETION (audit LOW-11): deleting the canonical first row
promotes the next same-day row; the derived series for that day changes
retroactively — accepted display-side behavior, consistent with
delete-and-re-derive everywhere.
Bulk reality: first 1–2 wks of a bulk show a water/glycogen jump on the
scale — handled by the locked 7–14d rolling average (item 24/O3) + calm
Coach line; no seam-growth caveat.
NU9 TDEE DOUBLE-COUNT FIX (LOCKED, answers NU6 tension): Mifflin activity
factor stops being a catchall — TDEE = non-training Mifflin baseline;
TRAINING expenditure is DERIVED from logged sessions (cardio kcalBurned +
MET estimates; strength given an estimate via tonnage/duration) and ADDED
SEPARATELY. Cardio calories never double-count: they appear once, as
sessions. Settings activity = "non-training" (job/school/hobby) only.
Official "absolute solid": honest by construction.
NU10 NO-PHASE FALLBACK (LOCKED): if no phase is active, macro targets
derive from GOALS first (weight goal → its derived rate, I5); no goal →
"maintain" default (TDEE, protein 1.6, fat floor, carbs remainder).
Targets stay elevated when phase absent.
NU11 COLLISION DETECTOR + DAY-TARGET OWNER (LOCKED): deriveMacros(
dateKey) is THE single owner of the day's numbers (H3). It returns
kcalTarget = baseTarget + Σ(today's session burns — cardio exact/MET,
strength manual-or-band per B2/NU9), protein/fat/carbs remaining, and a
collision flag when protein + fat grams exceed the kcal budget → UI
shows "raise kcal or lower protein" and a priority to drop (default:
keep protein, drop fat to the floor). EVERY consumer — macro-gap bar
(NU12), fully-logged streak window (C2/B3), weekly nutrition check-up,
phase report, Coach nudges — calls THIS function; none re-implements
the math independently. No silent NaN/negative.
NUTRITION ADD-ONS (LOCKED): 1) WEEKLY NUTRITION CHECK-UP — mirrors the
fitness check-in (34) via coach_outputs: kcal vs target %, protein hit-rate,
weekly compliance, one Coach line per strictness; zero new tables. 2) QUIET
MEAL REMINDERS — ON-APP-OPEN catch-up nudge only (audit C1: NO push
notifications — D018 deferral, iOS PWA; a "ping" cannot reach the user
while the app is closed, especially at school): when the app opens and
a known meal window has passed unlogged, quietly offer the batch
catch-up flow (NU4) — never a real notification, always in-app,
non-naggy, honors school reality. Known meal windows (audit 2.5): when
a day has a routine-bound template, its meal slots define the windows;
with NO routine bound, seeded defaults count — breakfast/lunch/dinner/
snack — so the nudge works from day one, before any routine setup.
3) ZERO-XP LOGGING STREAK — a soft "N days fully logged" consistency marker,
shows on dashboard, NO XP (anti-farming discipline). "Source='estimated'"
photo lane REJECTED by user.

NU12 MACRO-GAP BAR (LOCKED, reinstated from audit): live progress line
each day — "protein 168/168g · kcal 2120/2875" — updates as meals are
logged (NU1 sum against targets from NU6/NU7). Zero storage (derived);
single highest-visibility budgeting surface; natural home for reminders
(NU-add-ons) + Coach nudge; no XP.
AUDIT CLOSURES (LOCKED, no new tables): (1) SIGN CONVENTION: weekly rate
is signed — rate −0.5 = cut/loss, +0.25 = bulk; formula is exactly
calorieTarget = TDEE + (rate × 7700)/7 (signed rate is ADDITIVE:
minus = cut, plus = bulk — never inverted; "no double-negative" was the
artifact of the old inversion and is dropped). (2)
BODYWEIGHT = 7-day rolling average everywhere a bodyweight is used for
NU7 protein g/kg + NU10 fallback (per O3); never a single raw today. (3)
MANUAL TDEE: a manual override FREEZES the auto-recompute (NU6/Mifflin)
until the user clears it — "absolute solid" holds, no silent overwrite of
a real measurement. (4) STRENGTH BURN conservative: strength kcal only
from a tight estimate band, always LABELED estimate, never presented as
exact; cardio keeps exact kcalBurned/MET path (NU9). (5) FULLY-LOGGED-DAY
DEFINITION for the streak: kcal within ±20% of the day's target AND the
day's planned meal types — else the day doesn't count toward the streak
(anti-farming, matches user reality). (6) BACKFILL BOUND: same-day/
last-24h backfill = normal NU4; OLDER dates = distinct "historical
backfill" mode that does NOT extend the streak/check-up compliance
(no fake consistency); gentle nudge stays.
AUDIT C2 (user APPROVED): ±20% window was ~±700 kcal on bulk targets —
a "consistency marker" wasn't consistent. Tightened to ±10% of the
day's target (both routine and no-routine paths, B3); weekly check-in
reports the actual average daily deviation (e.g. "~180 kcal above
target") so precision lives in the verdict, not the badge.

NU13 FOOD MACRO LOOKUP (LOCKED — a third producer on the NU5 seam):
weigh the food, pick it from a food database, and the app computes the
macros from the weight (per-100g × grams: protein/carbs/fat/kcal) into
the SAME nutrition_logs receipt row as any other input, tagged
source='fooddb'. New producer only — no schema change.

  SOURCES (user approved): USDA FoodData Central = the core (public
  domain, raw ingredients); OpenFoodFacts (CC0) = OPTIONAL second source
  for branded packaged foods. One normalized macro model behind both —
  the app never knows which source served the numbers.

  OFFLINE SHAPE (user approved): NOT a giant bundled DB. A curated
  offline set (common foods + the user's own saved foods/recipes — covers
  ~90% of daily logging, zero network) is ALWAYS available; a bigger
  search list loads only when online and is CACHED so looked-up foods
  work offline afterwards. No network dependency — manual entry always
  reachable. The "massive dataset" lives online; lookup results live
  local.

  SAVED/SMART LIST: anything ever logged floats to the top of the search
  (local muscle memory, MyFitnessPal-style, but entirely local).
  SAVED-FOODS FATE (audit MED-10): the saved list is DERIVED from
  nutrition_logs history — a user's "saved food" IS a row they actually
  logged (macros copied from the source at log time); no separate table,
  so backup fate is automatic (nutrition_logs rides the O6/A1
  enumeration) and restore can never wipe a saved food. The
  nutrition_food_cache stays regenerable-only — nothing user-authored
  ever lives there.

  SEARCH SHAPE (audit 5.2): results are capped top-N (≈20–50); the app
  downloads only picked rows; lookups cache into ONE table
  (nutrition_food_cache — single owner; a regenerable cache, NOT in the
  backup enumeration, re-fetches on demand). The full dataset is NEVER
  bundled into the PWA; no background prefetch.

  TOGGLE: Settings Group 4 — "Food macro lookup" (default ON). OFF =
  plain manual entry, exactly as before. Toggle switches behavior, never
  deletes data.

  EDGE CASE (user REQUIRED): manual entries are the ground truth — a
  manually-typed row is NEVER overwritten or "corrected" by a lookup. If
  a saved food / previously-logged item already exists, manually entered
  macros win forever (no auto-clobber). The lookup only PRE-FILLS a new
  row, which the user confirms before it saves; it never mutates an
  existing logged value.

  GUARDRAILS (own rules hold): stays a manual search → confirm → row
  flow; NO AI/photo-scan OCR (source='estimated' photo lane still
  rejected); recorded database values are 1:1, not derived.

  DEPENDENCY NOTE: adds an open-source DATA dependency (USDA FDC +
  OpenFoodFacts) — requires a DecisionLog entry when formalized (user's
  rule); to be written with the docs write.

AUDIT C4 (user APPROVED): new exercises start untracked → drill-down
only reachable inside a session (friction: just logged a new lift, can't
check its progress from home). FIX: the session screen's exercise menu
gains "Track this exercise" (one tap → immediately appears in the
dashboard Your-lifts block, I1). Reuses the existing tracked toggle
(item 17); no new schema.

AUDIT C3 (REVIEWED, no change): a 00:30 snack logs under its actual
eat date (NU4) but shows under the previous day's routine slots — display
mismatch already accepted (routine audit A4); both numbers correct, no
rework. AUDIT C5 (REVIEWED, no change): seed text corrected to ~44
(actual count). AUDIT C6 (REVIEWED, no change): strength kcal band is
conservative, always labeled, and weekly pace-vs-expected absorbs its
error over ~2 weeks (item 25 convergence) — honesty by design.

## End of full-ledger audit (A/B/C series complete)

Fixes locked this round: A1 backup enumeration incl. nutrition + routine
tables + periods (trip records); A2 TRUE cross-device entity sync (new
required sync plane,
mechanism per D019); A3 nutrition.logged + body.weighed metadata-only
events (single behavior log honored); A4 Coach weekly review merged into
the Sunday check-in (one weekly surface); A5 physique photos anchored to
journal + health/physique tags; A6 week recap = glance strip + tap into
weekly verdict; B1 weight vs rep-count record modes (no 12-cap on reps);
B2 manual kcalBurned overrides strength band (no double count); B3
fully-logged-day no-routine path; B4 manual TDEE freezes protein/fat
basis; B5 week_plan_slots.dayTemplateId naming; C1 meal reminders are
on-open catch-ups, never push; C2 streak ±20%→±10% + weekly deviation
reporting; C4 one-tap "track this exercise". C3/C5/C6 reviewed-only.
ALL CHANGES ARE PENDING FINAL USER APPROVAL before any docs/ write.

## LABEL FAMILIES — DISAMBIGUATION LEGEND (audit LOW-23)

Audit labels repeat ACROSS independent families in this file; citations
must qualify them (e.g. "resolve-B3" vs "audit-B3") or use section
references. Families:

- backup-A1–A6    S12 fix summary (enumeration / sync / events / weekly
                  review / physique anchor / week recap)
- census-A1–A4    S13-045 trophy-census corrections (incl. its strength-C2
                  reference — the est-1RM÷rolling-BW ratio definition)
- routine-A1–A7   S20 daily-routine audit round 2 + S10-004's event-A3
                  (nutrition/body event coverage) — NOT backup-A3
- audit-B1–B4     S12/S21 audit fixes (record modes / strength kcal /
                  fully-logged / TDEE freeze)
- resolve-B1–B5   B1–B5 resolution entry (re-fire map / Real Progress /
                  On Target / weekly checkpoint / ghost tolerance)
- audit-C1–C6     S11/S12 audit fixes (meal reminders / streak window /
                  C3+C5+C6 reviewed-only / track-this / seeds / band)
- resolve-E1–E3   E1–E3 resolution entries (count-in-window / settings
                  knob / Perfect Month)
- spec-E0–E13     S13-016 achievement spec shared trigger engine

Same letter ≠ same family — always qualify.

## M0/M1/M2 existing-system audit (LIVING SECTION — ledger-informed notes)

WORKFLOW (user-confirmed): FIRST fully finish this ledger — every
design decision locked and satisfactory. ONLY THEN adapt ALL existing
architecture in docs/ (Architecture, Database, Requirements, Roadmap,
DecisionLog, CoachSystem, Gamification, MediaStorage, UIUX) to fit
everything the ledger now contains — schema, events, surfaces, sync,
milestones, D040+ DecisionLog entries, and any Roadmap restructure the
ledger implies (incl. the O6-A2 entity-sync plane). The ledger stays the
single source of the target state; docs get rewritten to match it, not
vice versa. Nothing in this section edits docs — it only collects
proposals for that later adaptation pass.

Already-identified items (from the full-ledger audit + gamification
discussion, recorded as a starter set):

- M1 GOALS → goals.kind (generic | weight | strength) + nullable
  exerciseId/targetValue from the START (item 27 weight goals + item 29
  strength goals "reuse the existing goals system"; additive columns
  now = no forced migration on years-old data later). STRONGLY
  recommended.
- M1 GOALS → PROGRESS OWNER (clash #2 — RESOLVED, user picked A):
  goal progress is COMPUTED ONLY — a real-time derivation, never a
  stamp. Single H3 owner per goal kind (weight: rolling weight vs
  start/deadline; strength: est-1RM vs target). The write-path
  `goal.progress` event is RETIRED — no per-progress stamps; only the
  rare user-declared `goal.completed` event remains. Adaptation:
  Database.md event list + Roadmap M1 ("progress events flow to the
  event log") must be adjusted during the docs pass to drop
  goal.progress; anything needing a progress SERIES reads the derived
  owner function instead.
- coach_outputs.kind DICTIONARY (clash #3 — RESOLVED, user picked A):
  Database.md documents `coach_outputs (id, kind, dateKey, payload)`
  with only "daily note / nudge / weekly review". The full kind set the
  ledger uses MUST be enumerated during the docs pass as a single
  dictionary (kind + payload shape each): daily_note, nudge, briefing,
  check_in_weekly, nutrition_checkup, milestone_review_goal,
  milestone_review_anniversary, phase_close,
  pattern_alert. No schema change; a documentation-only list so the
  kinds stay finite and no two labels mean the same thing.
- M2 ANALYTICS → the Analytics Engine spec = "one H3 owner function per
  stat, all views consume" (the ledger's list: rollingAvgWeight,
  deriveMacros, adherenceWeek, strengthSnapshot, dayActivityScore,
  totalVolume, goalProgress(goalId) — the single weight/strength goal
  owner: linear start→target interpolation anchored on the goal's
  baseline via rollingAvgWeight; item 27's deadline grading (remaining ÷
  remaining days) is its sub-view; F1's projection line derives from the
  same roll). No generic-aggregator meta-framework — the list above is
  the SEED; the full consolidated owner-function catalog (incl. every
  M2/trophy owner: sameMonthDay, dayDomainPresence, phaseStartWindow,
  phaseAdjacency, yearlyPass, consecutiveYears, anniversaryWindow,
  rollingWindowMean, est1RM, qualifyingEntry, robotOverlapWindow/
  runAlive) is emitted in the Analytics Engine spec during the docs pass
  and is the authority there. Pace language: one shared helper
  paceVerdict(target, rollingTrend) serves phase pace (S1-006), goal
  pace (goalProgress), and F1 projections; the Coach always cites the
  owner function's verdict and quotes the number.
- M2 COACH → ACHIEVEMENT RECOGNITION TIE-IN (LOCKED, user yes):
  one-direction only — the Coach reacts to gamification events
  (achievement.unlocked, level.reached) as recognition material; it
  NEVER creates trophies or grants its own XP. LOUDNESS TAXONOMY
  FINALIZED (user directive): ONLY Ring and Grove receive Coach
  appreciation — one sincere, derived line, always from H3 owner
  results, never hype. ALL other tiers (Sprout / Root / Recognition /
  Heartwood) get a silent in-game toast, NO Coach speech. Coach NEVER
  judges XP/points. Celebrations respect J4 quiet-week and facts-only
  privacy — Coach speaks stats, never quotes journal text. Trophy
  lines ride the same auto-written+deletable coach_outputs machinery;
  nothing is ever forced to stay on screen.
- WEIGHT LADDER = V2 TROPHY THRESHOLDS (LOCKED, user yes): the
  system's weight milestones ARE the v2 weight-gain ladder, one
  threshold per trophy, no overlap: 70 · 75 · 80 · 85 · 90 · 95 ·
  100 kg (7-day rolling average, TWO consecutive weekly checkpoints
  for confirmation — v2's Real Progress-family guardrail). Weight
  goals (M1 goals.kind=weight) insert into THIS ladder — a goal's
  threshold is a ladder value, never a bespoke number, so the trophy
  and the goal close on the lit mirror number; single source of
  truth, two projections (milestone card + trophy). THE
  TEMP-PLANNING-Achievements sub-file's old draft catalog and reward
  classes are SUPERSEDED: the canonical achievement catalog = the
  v2 file (PersonalOS-Achievements-v2.md, 9 domains, 131 trophies
  + 47 ladder tiers = 178 named entries, Growth-Ring tiers) + the 7 governing rules kept. USE THE V2 FILE.
  Merge/rewrite of the merged canonical catalog is NOT yet drafted —
  deferred (pending user).
- M2 DERIVED-ONLY GUARANTEE (LOCKED, user yes): every stat has
  exactly ONE H3 owner function; all surfaces (Coach lines, dashboard,
  achievements, month facts, streak card) consume that same output.
  No view ever re-derives a stat with its own copy of the logic.
  Achievements trigger and Coach lines fire off the SAME owner output,
  so a trophy and its Coach line are literally the same number.
  Rounding happens once, in the owner; no per-view display hacks.
  (Analytics Engine = the owner-function catalog, clash-resolved above.)
- M2 DASHBOARD BLOCKING ORDER (LOCKED, user yes): the order ONLY
  controls home-screen card paint sequencing on open; every feature
  screen (gym session, planner, food log, settings) renders itself
  instantly and never waits on this list. Render order =
  [Today section (briefing + habit ticks + capture, the clash #1
  fusion), calendar/heatmap strip, habits card, goals progress,
  strength snapshot, weekly review/Coach note, journal capture].
  Every block independent (cheap single owner-function read, thanks to
  the derived-only guarantee); the heavier derived blocks (strength
  snapshot, weekly review) render after a skeleton shimmer and NEVER
  block first paint.
- UI/UX ORDERING SET ASIDE (user directive): navigation bar + layout
  ordering (top of screen, bottom bar, toolbar/drawer placement) is
  DEFERRED to the end of the design process — after ALL features are
  planned. Do not re-open dashboard ordering or nav charts now; the
  ledger keeps only feature-level facts above. Revisit last.
- M2 COACH RULE BOOK — SEPARATE FULL SESSION (user directive): the
  complete, detailed, all-encompassing Coach rule catalog is a DEDICATED
  deep session, scheduled AFTER all features are planned and BEFORE
  the UI/UX ordering pass (Coach surfaces affect layout, so it feeds
  that pass). Not to be compressed or rushed into the current feature
  sweep. Carry-over rules already locked that the rule book must
  include: facts-only speech, achievements tie-in loudness tiers,
  J4 quiet-week respect, no-shame language, reviews-give-no-XP,
  auto-written + deletable outputs, on-open delivery never push,
  no-human-judgment voice. The rule book session also decides the
  voice rule (facts + plain reflection; no implied human judgment).
- M2 MILESTONE-REVIEW CARD (LOCKED, user yes): the card appears ONLY
  at goal end — either after the user-declared goal.completed (won
  goals) or on deadline expiry WITHOUT completion (expired goals);
  NEVER mid-run (that belongs to the weekly/monthly report types).
  Two vintages: WON-goal card follows the facts (computed final value
  always shown next to target — the user declaration is only the trigger,
  the computed value is the fact; dates, one-line derived reflection —
  all stats, no text quoting); EXPIRED-goal
  card = "window closed, here's where you started, here's what to carry
  forward" with ZERO blame language. milestone_review_goal is an
  auto-written coach_outputs row, deletable like any Coach line. XP
  ruling (kills
  contradiction #3): REVIEWS NEVER GIVE XP — weekly review loses its
  small-XP reward in the docs pass and milestone review gets none
  either; all reviews are earned-honor-only, no coinage. Gamification.md
  "weekly review completed = small XP" line must be struck.
- M2 PHONE↔PC PARITY (LOCKED, user yes): every feature/screen exists
  on both platforms EXCEPT ONE: the PC archive (folder adoption +
  vault browser incl. J7 video library) is PC-ONLY because the files
  live on the PC. Capture is NOT phone-exclusive — pics and vlogs are
  plausible on PC too (webcam / file import), not just phone camera.
  Both devices read the same H3 owners so a number never differs
  between surfaces; offline behaves identically on both (same stored
  facts, same queued additions on reconnect). No curated feature
  missing on either side outside the one archive exception.
- M2 ANTI-FARM AUDIT (LOCKED, user yes, two patches):
  (1) MEDIA XP RIDES THE JOURNAL CAP — media XP is only ever awarded
  once per journal entry and the journal cap (first 2 content-gated
  entries/day) bounds it; photos attached beyond an entry never mint
  XP. No standalone media faucet. (2) XP REVERSAL IS SYMMETRIC — any
  auto-tick revoke / journal-invalidation that returns XP is written
  as a NEGATIVE XP EVENT (additive reverse), never a deletion or
  retroactive edit; the event log keeps both sides so totals and
  history always reconcile. No re-derivation, no repair jobs.
- M2 GAMIFICATION → the full ACHIEVEMENT CATALOG has ONE canonical
  home: PersonalOS-Achievements-v2.md (user-authored; 9 domains, 131
  trophies + 47 ladder tiers = 178 named entries, Growth-Ring tiers Sprout/Root/Branch/Heartwood/Ring/Grove — unique to
  that file). TEMP-PLANNING-Achievements.md is SUPERSEDED as catalog
  (its draft entries and reward classes are dead — see the WEIGHT
  LADDER lock); only its 7 governing rules carry over (no XP values,
  3-question gate, derived-only, no-app-opening, no-imports, icons at
  build, one-time-or-repeatable discipline). All 178 entries PRESERVED
  (user directive) — ladders are NOT collapsed. Achievements grant
  ZERO XP (user confirmed) — a trophy is its own reward, seen by the
  Ring/Grove-only Coach treatment above. Draft of the merged canonical
  catalog file is DEFERRED; v2 stays the live source. 3-question
  anti-cheat gate locked (user yes). Also keep: derived-only-from-
  history discipline (session-walk), never from workout.pr events.
- ACHIEVEMENT FILE RELATIONSHIP (for the future docs draft — what
  lives where, who wins on what): three layers, one truth:
  1. PersonalOS-Achievements-v2.md = THE WHAT (canonical catalog):
     names, criteria, tiers, guardrails, repeat cadence phrasing,
     ring series, ladder thresholds, anti-cheat rules. User-authored;
     wins every naming/criteria dispute.
  2. TEMP-PLANNING-Achievement-Spec.md = THE WHEN (trigger layer):
     E0-E13 shared engine, per-trophy TRIGGER predicates, rung tables
     R1-R47, section totals, DEPENDENCIES table. Every trophy in v2
     MUST have exactly one spec record; every spec record MUST trace
     to a v2 trophy (verified 131/131 + 47/47, audit green).
  3. TEMP-PLANNING.md = THE WHY (decision layer): ledger pins
     (G1-G20, E-clashes 1-5, M3/M4), counters that alter trigger
     wording (strict-consecutive G19, anchors M4, tonnage M2), and the
     Coach map. When v2 and spec disagree, the LEDGER (or a new lock
     entry) decides; nothing is edited ad hoc.
  DOCS-PASS RULES when drafting the official docs (Gamification.md
  etc.): (a) merged catalog text = v2 verbatim for names/criteria/
  tiers; (b) trigger/machinery prose = spec verbatim for predicates
  and deps (no paraphrase that changes a number); (c) every pin the
  ledger added lands as a named rule/guardrail in the doc; (d) the
  doc must state v2 + spec stay LIVE sources (per the DEFERRED
  merged-canonical note above) and link both; (e) 1:1 mapping
  guards: 131 trophy records ↔ 131 spec records ↔ 47 rungs —
  any drift count is a drafting error. No new inventions during the
  docs pass; if reality diverged, the ledger gets a lock entry first.
- M2 isImported ENFORCED AT CALCULATION TIME (LOCKED, user yes —
  TENSION item 3): the `imported` flag DECLARED GLOBAL — not just
  journal_entries (J3's original home); every entity row that can be
  batch-imported (journal, workouts, nutrition, body_metrics, habits)
  carries it from the START. Two enforcement arms: (a) EVERY H3 owner
  function and every achievement predicate filters imported rows
  INTERNALLY (rule: no owner function may omit the import-exclusion
  clause — it's part of the contract, never a cleanup step run at
  import time); (b) the 3-question anti-cheat gate rejects any import
  that would RAISE or TRIGGER a trophy (no activate-on-import
  semantics — imports can only ever show history, never earn). This is
  what keeps "100 documented days", PR counts, tonnage sums, and v2's
  thresholds from flickering when an old batch lands. (Ties to the
  spec file Rule 5.)
- M2 ACCOUNT ANCHOR DATE (LOCKED, user yes — TENSION item 2): the
  longevity tier's "day one" = MIN(occurredAt) across ALL events with
  imported=false and no tombstone/deletion, computed and FROZEN at the
  moment the first real event is written; a stored immutable value,
  readable O(1) by the engine, never user-editable (there is no
  "reset day one" reset — that would mint trophies). NOT the
  milestone-review anchor (first journal entry — different anchor,
  different trophies); vs reinstall it does NOT move (event log
  survives reinstall; first real event is historical). Imports:
  import-flagged rows can never set or shift the anchor (they are
  typed after day one by definition). Longevity tier (The Rings) reads
  this anchor.
- M2 PLANNED-REST EVENT (LOCKED, user yes — TENSION item 1): new
  metadata-only event kind `habit.rest_planned` (payload: habitId,
  dateKey, note?; writtenAt = device clock, per TENSION item 15;
  occurredAt = user-chosen day; created ONLY by the explicit per-habit
  one-tap rest flag — never from silence). No entity table, same
  pattern as nutrition.logged/body.weighed; delete/edit writes the
  compensating `_revoked` event transactionally. STREAK SEMANTICS
  (Option B, user-confirmed): a rest day FREEZES the streak — it
  neither resets NOR advances the counter; it is a neutral hole in the
  run. Rests therefore never feed any streak-length trophy (A Hundred
  Days, etc.) — "absence alone must never earn anything" — they only
  prevent resets. NOT Grace (which forgives misses after the fact),
  NOT quiet week (settings-wide silence, J4), NOT infinite shield
  (resting 30 days straight earns nothing — the run isn't alive).
  Serves the v2 "Honest Rest" trophy (rest event inside an otherwise
  active ≥14-day streak, either side) and the Coach's real-rest vs
  quiet-miss vs grace parsing. SYNC: rides the standard append-only
  event UNION (A2).
- M2 STRENGTH STANDARDS SEED (LOCKED, user yes — TENSION item 5):
  completes the item 19 "seeded tables" promise — `strengthSnapshot`
  is seeded with ALL FIVE tiers (Beginner/Novice/Intermediate/
  Advanced/Elite, men + women columns) taken from a published
  gym-going-population source (percentile-anchored: Novice ≈ 20th,
  Intermediate ≈ 50th, Advanced ≈ 80th, Elite top ≈5%). FROZEN SEED
  VALUES (men, est-1RM ÷ rolling BW): bench 0.50 / 0.75 / 1.20 /
  1.60 / 2.00; squat 0.75 / 1.00 / 1.65 / 2.20 / 2.75; deadlift
  1.00 / 1.25 / 2.00 / 2.50 / 3.00; overhead press 0.35 / 0.50 /
  0.65 / 0.90 / 1.20; (women ~60–70% upper, ~75–85% lower — full
  column in the seed). SCOPE = 4 CANONICAL LIFTS ONLY: bench, squat,
  deadlift, OHP. Barbell row stays ratio-display-only (no tier table,
  no trophy) — user confirmed no row table needed. Non-BIG-5 tracked
  exercises: ratio-only, unchanged (item 19). Bodyweight/rep-mode
  exercises (B1) NEVER touch this table — rep ladders earn their own
  trophies. The v2 "Strength Standard Reached" trophy reads this seed
  (first-cross, per lift, per tier: Novice→Branch, Intermediate→
  Heartwood, Advanced→Grove); bodyweight = 7-day rolling (locked).
  NOTE: the trophy is PER-LIFT, PER-TIER only — it fires when ONE
  lift first crosses ONE tier (bench Advanced does not wait for
  anything else; no aggregate condition anywhere). The item 19
  OVERALL LEVEL (avg of the 5 big-lift ratios, Wilks-style) remains a
  DISPLAY-ONLY profile grade — NOT a trophy, not a gate, nothing
  gates the Achievement; the two never meet. Row keeps its ratio in
  the overall-level average but has no tier table of its own (see
  scope above).
  - THRESHOLD-TO-RANK MAP (LOCKED, user yes Aug 09 — audit E-clash
    #3): the frozen seed lists are ordered Beginner, Novice,
    Intermediate, Advanced, Elite — i.e. for bench 0.50=Beginner,
    0.75=Novice, 1.20=Intermediate, 1.60=Advanced, 2.00=Elite (same
    positional rule for squat/DL/OHP). "Strength Standard Reached"
    fires ONLY on ranks 2, 3, 4 (Novice 0.75→Branch, Intermediate
    1.20→Heartwood, Advanced 1.60→Grove). Rank 1 (Beginner) and
    rank 5 (Elite) NEVER fire a trophy — they are Coach/profile
    grade display only (Elite carve-out already recorded in the
    SECOND-AUDIT note). No future pass may "fix" rank 1 or 5 into
    trophies; the v2 catalog carries the same explicit map.
- M2 WRIST/ANKLE PRESENCE (DEFERRED from TENSION item 9 — no
  leader-churn on the catalog): the v2 catalog's wrist/ankle bodies
  stay OUT of the ledger-engine scope for now (user directed the
  walk-through to move on; door deliberately left OPEN). When/if
  legs-and-ankles tracking ever lands, it's a string-enum body-part
  extension on existing `body_metrics` rows — the affected trophies
  read the same rows, no contract in this ledger changes. Recorded
  here for completeness so the TENSION closeout reads: 1–8, 10–15
  LOCKED, 9 = deferred-with-door-open.
- M2 MONTH-DAY + TWO-DOMAIN UTILITIES (LOCKED, user yes — TENSION
  items 11 & 12): (a) MONTH-DAY MATCHER — one shared
  `sameMonthDay(a, b, toleranceDays=1)` utility used by Same Question
  New Answer / One Year Same Day / Half a Decade Same Day; leap-day
  (Feb 29 → Feb 28 in non-leap years) handled inside, per the J1
  lock; never re-implemented per trophy. (b) TWO-DOMAIN SAME-DAY
  JOINS — PR+journal (Wrote It Down), D031 photo + weight-milestone
  (Eyes on the Data), journal+vlog-in-trip (Somewhere Else, Still
  You) — all composed from `dayDomainPresence(dayKey)` (item 8) plus
  targeted day queries; each half must independently be a real,
  qualifying event; no new tables. Both are pure engine utilities,
  M2 scope, built once and shared (anti-copypaste rule as items 6/7).
- M2 STALL RULE (LOCKED, user yes — TENSION item 10): named Coach
  engine rule `stallRule(phase)` — ONE shared vocabulary (trophy,
  Coach line, phase report all read it, no per-feature drift).
  Definition: STALL = 4 consecutive WEEKLY deltas of rollingWindowMean
  (item 7) outside the phase progress direction (bulk: < +0.1kg/wk;
  cut: > −0.1kg/wk); RECOVERY = the next 2 weekly deltas inside the
  phase pace band. "Broke the Plateau" fires ONCE when recovery
  confirms (item-8 check-and-fire; the same 6-week window never re-
  triggers). Deload weeks exempt (F5); thin week (<5/7 logged days) =
  "no data", never a stall. Coach never scolds during the stall — the
  trophy celebrates recovery only (no-shame locks). Pure delta math;
  zero schema; lives in the Coach rule catalog.
- M2 PHASE-ADJACENCY (LOCKED, user yes — TENSION item 13): ONE
  function over the EXISTING phases table (item 24; zero
  schema change) — `phaseAdjacency(phaseId)`: order phases by
  startDate, walk the chain, return the predecessor phase IF
  predecessor.endDate is explicitly closed (N9 phase-close sets it),
  start dates are CONSECUTIVE (±1-day tolerance like item 12), types
  DIFFER (bulk→bulk is not a turn), and NO other phase sits between
  (a gap-phase breaks adjacency; strict, no loosening to "weeks
  later"). Serves "The Turn" trophy (first bulk → cut handover) and
  the Coach's phase-transition line — both call the SAME helper; no
  per-feature adjacency copies.
- M2 TURN-OF-THE-PAGE DEPENDENCY (LOCKED, user yes — audit clash
  C3): "The Turn of the Page" (v2 journal, 3-day window on a phase
  entity's startDate) needed a journal × phase-start proximity join
  the TENSION list never named (TENSION 13 governed only the
  phases-only "The Turn" bulb). OWNER FUNCTION (M2 engine, one
  place): `phaseStartWindow(phaseId)` — a QUALIFYING (real-content,
  non-imported, rule-2/5-compliant) journal entry exists on a
  dayKey within ±3 days of that phase's startDate. Repeatable per
  phase transition (a new phase start = a new window, once per
  phase entity); check-and-fire (item-8 semantics) — evaluated
  after the phase-creation write AND after journal writes near an
  open phase window; fires once when the window "comes true." Zero
  schema, one pure function; both The Turn (adjacency) and this
  stay their own trophies and call their own helper.
- M2 YEARLY REST / META-STREAK (LOCKED, user yes — TENSION item 14):
  THE TWIST IS B + C. Rings vs Ouroboros: rings (B) = COUNT-based
  forever — every year that clears the FULL six-domain bar (Life,
  Fully Logged, same criteria as Old Growth: all six domains each with
  ≥1 qualifying non-imported entry) brands ONE ring of that year;
  rings STACK FOREVER, gaps never erase (ring series trophy list
  below, superseding the earlier "Third Ring at 3/5/10 rings"
  proposal; earlier proposal of
  "one gap = grave" REJECTED). The ultra (C) = "Ouroboros" (NEW
  achievement added to v2 catalog, right after Old Growth): the ring
  that never opens — LIFE bar met in 10 CONSECUTIVE calendar years.
  RESTART SEMANTICS (user change, LOCKED): a gap or rested year
  anywhere restarts the count at zero; NO permanent death for a
  single gap — any 10 consecutive qualifying years, whenever they
  land, fires the trophy (one-time once earned, never taken back;
  gap before 10 just resets the attempt; visible as an honest closed
  streak — no shame, no trophy, Coach's ONE line only when it lands
  or ends). Ouroboros is ONE ultra: strictest in the whole catalog —
  the "decade unbroken" capstone; rings give forgiveness, Ouroboros
  gives streak truth (a gap resets the run, it never walls off
  future decades). Both read the same
  per-year real content + import rules (rules 2/5 of spec; imports
  never qualify a year), by anchored yearly windows (M4 LOCK —
  supersedes earlier "calendar year" phrasing), via
  `dayDomainPresence`-per-domain aggregate. No XP on any of them.
  RING SERIES LIST (LOCKED, user yes Aug 09 — 10 named trophies, one
  per lifetime ring count, one-time each, gaps never erase, in
  anatomical order from pith to bark):
  ring count 1 = "Pith" (Sprout) · 2 = "Medullary Ray" (Root) ·
  3 = "Oak" (Branch) · 4 = "Sapwood" (Branch) · 5 = "Ironwood"
  (Heartwood) · 6 = "Cambium" (Heartwood) · 7 = "Latewood" (Ring) ·
  8 = "Phloem" (Ring) · 9 = "Cork" (Ring) · 10 = "Yew" (Grove).
  Engine: one count — the lifetime total of Life Fully Logged passes,
  ever (same read as the ring count). The earlier "Third Ring at
  3/5/10" proposal is void — the v2 catalog now carries all 10 named
  entries.

- M2 YEARLY META-STREAK PRIMITIVE (LOCKED, user yes — THREE YEARLY
  FAMILIES SHARE ONE ENGINE; audit finding M3): ONE generic owner
  pair in the Analytics Engine — `yearlyPass(criterion, anchor)` →
  boolean ("the Nth yearly window passed"), plus `consecutiveYears(
  booleans, N)` for the run check. ANCHOR SEMANTICS (user chose
  Option A): yearly N = the Nth non-overlapping 365-day window
  counting from the DOMAIN'S FIRST QUALIFYING ANCHOR EVENT — gym
  years count from the first logged workout, journal years from the
  first qualifying entry, etc. — never calendar-chopped, so a
  October start doesn't gift or steal partial years. APPLIES TO ALL
  eleven multi-year, non-rings families (journal 300d / habits 300c
  / gym 80w / food 250d / body 40w-weeks / media 300d-cam +
  everything that reuses them). Each family feeds its own criterion
  into the SAME `yearlyPass` — the per-year booleans are the only
  per-family part; the streak-over-booleans part is shared. SUB-
  DECISIONS (locked): (a) imports never qualify a year (rule 2/5);
  (b) no honest-gap tolerance — a failed window restarts the run at
  the NEXT window, never partial credit; (c) check-and-fire once per
  window completion (item-8 semantics), the same
  `achievement.unlocked` single event; (d) the rings (six-domain bar,
  TENSION 14) use this same generic with the Life-Fully-Logged
  criterion — bookkeeping, not a second abstraction; (e) all-zero
  history → no fire. THE OLD "one-off per ach; bigger version of
  day-streak" fear (v2 TENSION line) is answered: it's now one tiny
  spec'd reuse.
- M2 WRITTENAT (LOCKED, user yes — TENSION item 15): the robot-
  consistency family (Same Time Every Time, Like Clockwork, The
  Schedule Never Breaks, Same Hour Same Scale, No Deviation, Ghost
  in the Machine) reads `occurredAt` — the time the USER DECLARES
  the thing happened — NOT the typing moment (user's real-world
  reflection: weighing in at 7:00 but logging at 9:00, then logging
  at the exact moment one day, would break a writtenAt-based run on
  the MOST disciplined day — system must reward the ritual, not the
  typing). `writtenAt` STILL EXISTS on the event row: immutable,
  device clock, set once at write, never user-editable — but its job
  is OPERATIONAL TRUTH ONLY: sync ordering, dedupe, import handling,
  "when was this row actually written" audit. NOT trophy evidence.
  Single-user trust model (friend, not court): a user backdating a
  declared time is faking only to themselves; consistent with the
  anti-farm findings already accepted (TZ/declaration quirks fine in
  personal mode). Guardrails KEPT: imports never qualify (spec rule
  2/5), same-day single entry, window exactness, family strictness
  2/5), same-day single entry, window exactness, family strictness
   (missing the window breaks the run).
- M2 ANNIVERSARY WINDOW PRIMITIVE (LOCKED, user yes Aug 09 — audit
  finding E): new engine primitive `anniversaryWindow(anchorDate, k,
  +-toleranceDays)` → boolean: true if a qualifying event exists on
  any day within the anniversary band {k*365 +/- toleranceDays} of
  the anchor Date (k = the anniversary ordinal, e.g. k=1 for the
  first anniversary of the anchor date). Two trophies consume it:
  ONE TRIP AROUND THE SUN (v2 ~:199-206; anchor = that habit's first
  qualifying completion; k=1; tolerance = 7 days) and A YEAR ON THE
  BAR (v2 :466-492; anchor = first-ever qualifying workout; k=1;
  tolerance = 7 days). Anchor semantics: same REAL-EVENT rules as
  every other owner (first qualifying, non-imported ever; never
  install/open date); the ±7 days is EXACT day distance, so the band
  is the anchor-anniversary day +-7 days, 365-day spacing — no yearlyPass
  windowing. The M3/M4 yearlyPass machinery is untouched; this is a
  distinct query class (event-near-anniversary-dates vs windows
  passed). Nothing else consumes it today; check-and-fire only after
  a write affecting the consuming domain (habit complete / workout
  logged), same single `achievement.unlocked` event, no XP.
- M2 SIX-DOMAIN PRESENCE (LOCKED, user yes — TENSION item 8):
  `dayDomainPresence(dayKey)` — boolean per domain {journal, habits,
  fitness, nutrition, body, media}, real-content floor + importless
  exclusion inside the predicate (rules 2/5 of the spec). NAIVE VERSION
  ACCEPTED (user choice): multi-year trophies run a plain per-day scan
  (365 × dayDomainPresence for a year's judgment) — accepted as
  milliseconds-cheap at the ledger's ~10k rows/yr event budget; no
  range-bucketing optimization, no derived cache unless real-world
  usage ever shows it stalls. CHECK-AND-FIRE SEMANTICS (locked): the
  check runs only after a WRITE affecting that domain (never a timer,
  never a render); a trophy fires exactly ONCE when its condition
  flips not-true → true (the year's wall "came true today"); while
  conditions stay true after owning → silent (no re-fire, no re-arm),
  repeatable trophies re-arm only per their cadence (window/year).
  The single event is `achievement.unlocked` + optional one Coach
  line for Ring/Grove; imported-heavy days can never paint "full."
  No new tables; one pure function; engine scope (M2).
- M2 E 1RM SINGLE-FUNCTION RULE (LOCKED, user yes — TENSION item 6):
  one pure `est1RM(weightKg, reps)` function is the ONLY place the
  Epley conversion exists. EVERY consumer (PR vault, strength profile,
  item 5 standards table, goals, rep-aware logic) calls it — copies
  mandated-out; no per-feature variants, no re-implementations. Mode
  routing stays B1 (weight-mode → est1RM; rep-mode/bodyweight → clean
  reps + addedLoadKg, NEVER Epley). Guardrails hold: best working set
  only, 1–12 rep window, one set per session.
- M2 TONNAGE DEFINITION (LOCKED, user yes Aug 09 — audit E-clash #4):
  "tonnage" (Moved a Mountain, Heaviest Session) = weight-mode sets
  ONLY: `weightKg × reps` per set, summed. Rep-mode/bodyweight sets
  (clean reps + optional addedLoadKg, O2/B1 record) contribute ZERO
  to every tonnage total — no fake kg, no bodyweight estimate, never
  multiplied. addedLoadKg is NOT entered into tonnage either (a vest
  is not the load the trophies measure — weight-mode bar loads only).
  Push/pull/dip ladders and the rep-record families still earn their
  own trophies; tonnage families stay purely weighted. Same rule for
  any future tonnage display (workout cards may SHOW both, but the
  trophy counters are strictly weight-mode).
- MMA ABSOLUTE-LIFT MILESTONES — "ACTUAL-LIFT-ONLY" (LOCKED, user
  yes): the absolute-lift trophy ladders (bench/squat/deadlift/OHP/
  curl thresholds from the v2 file, e.g. 60/80/100/120 kg bench)
  fire ONLY when a REAL logged SET crosses the threshold
  weight ≥ threshold AND reps ≥ 1, straight from exercise_sets (or
  rep-mode addedLoadKg path), with NO est1RM substitution, NO e1RM
  inflation, NO "45kg×8 ≈ 50kg" math. Est1RM/e2 formula remains for
  PR detection + standards/relative-ratio trophies, but the absolute
  ladders are brute-force honest: if the log says you lifted 100kg on
  a bar, the 100kg trophy fires; if it never logs that combination,
  nothing fires. Thresholds beyond current best stay future-earnable
  (they simply require the real lift when you get there). Guardrail:
  warm-up failure, spot-overs, or rack numbers typed by mistake are
  protected by the existing "real set on real day" + session-verify
  rules; no deletion can re-mint (derived from committed history).
- M2 RELATIVE-RATIO + STANDARDS METRIC (LOCKED, user yes — audit
  clash C2): the Relative-to-you family (Bodyweight Bench, One and
  a Half, Double Bodyweight Pull, Press Three-Quarters, Triple and
  Four Times) measures in EST-1RM ÷ 7-day rolling bodyweight —
  NOT actual bar weight. Same single Epley owner (TENSION 6). The
  strength-standards seed (TENSION 5) is the SAME metric — one
  continuous scale across both families; e1RM guardrails apply
  (best working set, 1–12, one set/session). Contrast stays strict:
  ABSOLUTE ladders use ACTUAL-LIFT-ONLY real sets (see MMA lock);
  the two metrics never mix. v2 text updated to est-1RM ÷ rolling
  BW everywhere in the relative + standards sections (audit text
  pass C2).
- M2 VLOG DURATION = STORED FIELD, MEASURED ONCE (LOCKED, user yes —
  TENSION item 4): `media_attachments` gains additive nullable
  `durationSec`. NEVER a scan/re-probe model: duration is measured
  EXACTLY ONCE the moment a file first enters the library — (a) phone
  capture: the recording session itself returns the finished duration;
  (b) PC adoption (J7): ~50-line pure MP4/MOV container-header parse
  done alongside the existing thumbnail/date harvest, no ffmpeg
  dependency. Every later tier move (buffer → Drive vault, phone →
  PC archive) COPIES THE STORED ROW — no re-measurement, no
  re-download, no cross-device drift (re-probing the same blob on two
  devices would give different milliseconds; stored canonical kills
  it). Owner sums (vlog hour tiers, 10/60-min thresholds) read the
  column only: SUM(durationSec). Unreadable/corrupt files → NULL, and
  NULL NEVER COUNTS toward any duration trophy (absolute honesty, no
  estimates, no user-typed values). VLOG LIFECYCLE (LOCKED): 1) EVERY
  recording ends at a REVIEW SCREEN with two choices: "Keep" (row is
  created NOW, duration stamped, optional title question — the J7
  naming hook — fileName fallback) or "Discard" (file wiped, no row
  ever exists, zero trophies — no phantom data, no farming via
  try-cancel loops). 2) DELETE is tier-aware: buffered/phone rows →
  delete row + local file + write vlog.deleted tombstone (history
  re-derives); Drive-vaulted copies → app deletes ONLY its metadata
  row, never destroys the uploaded blob file; PC-adopted files → the
  app NEVER removes the actual file on disk (folder = truth per J7),
  it un-lists the row AND marks it on a small "do-not-readopt" file
  list so an existing disk file doesn't silently re-enter the library
  on the next scan. 3) Integrity: duration trophies read only
  kept-recordings (Keep screen), never discarded-then-reopened.
- M2 ROLLING-WINDOW PRIMITIVE (LOCKED, user yes — TENSION item 7):
  ONE shared `rollingWindowMean(series, windowDays)` is the ONLY
  rolling-average math in the engine — no per-feature copies. Weight
  pace (O3, 7-day default, 14 optional) and calorie pacing (7-day)
  both call it; thin per-domain wrappers attach honesty floors
  (e.g. calorie: ≥5 logged days in the window before answer), guards
  live INSIDE the engine, never ad hoc in a trophy. Weight rolling
  (O3) already locked; calorie rolling (caloriePaceWindow) is the new
  glass added here. No schema change; pure function.
- M2 STREAK GRACE (LOCKED, user choices): forgiveness budget applied to
  streaks — size = 1 grace day per 7-day window, DEFAULT 1, editable as
  a SETTING (user: "set a default and changeable setting choice");
  per-window so it can't stack endlessly. ONE SHARED budget across all
  habits (user choice: shared), and applies EVERYWHERE (habit streaks
  AND life-area streaks). History stays true: a missed day is still
  recorded as a miss; grace only prevents the streak break. Grace is
  the ONLY finite streak shield — quiet weeks (J4) never shield
  streaks (boundary locked in clash-fix #4). GRACE NEVER SHIELDS A
  ROBOT-CONSISTENCY RUN (LOCKED, user yes — audit self-review
  clash): the six robot-consistency achievements — Same Time Every
  Time, Like Clockwork, Same Hour Same Scale, No Deviation, The
  Schedule Never Breaks, Ghost in the Machine — are EXEMPT from
  grace entirely; a missed day there BREAKS the run, exactly as
  v2's "no honest-gap tolerance" promises. Planned rest (TENSION
  1) still applies to them as a FREEZE: a declared rest day
  neither advances nor breaks that run (user intent, not
  forgiveness). Quiet weeks also never shield them (already
so). Default lives in settings;
   Gamification.md open item "grace default value" now has its numbers
   with the setting path.
- M1 GHOST-ACTIVE OVERLAP ENGINE (LOCKED, user yes — audit missing
  feature M1, all three edges decided): Ghost in the Machine needs an
  "in-progress run" concept no other achievement needs — three
  independent robot-consistency runs all ALIVE at once, for 90
  consecutive days, overlapping. Engine shape: TWO owner functions,
  zero schema change:
    - `runAlive(component, dayKey)` → bool. Component = one of the
      three runs. NO trophy-earned requirement — a run counts as
      alive from the moment it exists and is unbroken, regardless of
      whether its own trophy has fired yet (user A1: "alive is
      fine" — day 14 of a 30-day No Deviation streak is alive).
      - Clock (Like Clockwork, gym habit): alive = the current
        in-window completion streak of that habit is unbroken —
        same ~30-minute window each day.
      - Schedule (The Schedule Never Breaks): alive = the current
        weekday-pattern run is unbroken (pattern, not calendar
        completion; per locked weekday-pattern rules).
      - NoDeviation (No Deviation): alive = the current ±3%-vs-
        daily-target run is unbroken — but measured in LOGGED
        qualifying days.
    - `robotOverlapWindow()` → the CHECK: is there a rolling 90-day
      window in history where EVERY day has all three runs alive?
      Evaluated after a relevant write (journal/workout/food/
      habit event), never on a timer/render; check-and-fire's ONE
      read, ONE fire.
  - LOOKBACK IS ONE-SHOT (user note: "shouldn't falsely always
    look back once the trophy is earned"): retroactive credit is
    valid the FIRST time the check runs — e.g. a 90-day window that
    closed March–May fires in June, honestly. But the check goes
    permanently silent once Ghost has fired: one-time trophy, fires
    exactly once (from the EARLIEST qualifying day, so it never
    depends on when you noticed), then the predicate is retired
    forever. No re-fire, no re-arm, no re-scan. Retroactive
    hunting ends at the moment of the award.
  - NO-GRACE, PER PLAN (already locked in STREAK GRACE): Ghost is
    in the robot-consistency family — exempt from grace entirely.
  - UNLOGGED-DAY SEMANTICS (user chose HARD MISS, NOT freeze): a
    zero-log day during the window BREAKS No Deviation's run — no
    freeze. The whole 90-day must rebuild from the first day
    all three runs are alive again, measured in LOGGED days (unlogged
    days cannot be part of the window; they kill it). This is
    steeper than planned rest and it is intended: the Ghost window
    survives only when all three runs are logged day-in, day-out.
    Rest (planned) still FREEZES a run — it does not break — but
    a rest day likewise does not COUNT as an alive day for the
    Ghost window (it neither advances nor breaks on that day;
    the window stretches across it).
  - Imports: never qualify (this is a living-in-the-app
    trophy — imported entries do not enter any alive run).
  - Coach recognition: fires the celebration line once; no repeat
    congrats.
- M2 TRIMESTER WEEKLY TARGET (LOCKED, user yes — audit missing
  feature M2; all four decisions given): Trimester of Iron's
  "configured weekly-workout target" has ONE owner — no new setting,
  no fixed constant:
  - TARGET = the weekly schedule itself (Option A, user pick): a week
    PASSES if every session scheduled for that week was logged. The
    same schedule The Schedule Never Breaks reads; no separate
    "target workouts/week" number exists anywhere in the app, and
    none is added.
  - WEEK = the CALENDAR week (Mon–Sun; first day follows the app's
    week-start setting if the user changed it) — user pick: calendar
    week, not rolling 7-day windows.
  - REST WEEKS = FREEZE (user pick): a week where the user declared
    planned rest (PLANNED-REST WEEK) neither advances the 12-week
    run nor breaks it — the calendar extends, the run waits, exactly
    like rest freezes streaks.
  - CAP: rest-frozen weeks are capped at ONE per run (user cap):
    a second planned-rest week inside the same 12-week run BREAKS
    the run — it restarts from the next meeting week. No unlimited
    free skips.
  - Off-pattern weeks (right days, wrong week; wrong days, right
    week) still FAIL the week — no rounding "that was close"
    behavior (matches kwargs locked for The Schedule Never Breaks).
- Imports never qualify; grace never shields a missed week (a
     frozen rest week is the ONLY allowed skip, hard cap 1).
   - EMPTY-WEEK RULE (LOCKED, user yes Aug 09 — audit E-clash #1
     vacuous-pattern farm vector): a week with ZERO scheduled
     sessions FAILS that week — it never passes vacuously "because
     nothing was planned". Empty week = off-pattern week semantics:
     it breaks the run (restarts from the next meeting week), the
     same consequence as a logged-out-of-schedule week. The ONLY
     legal skip in the whole system is a declared planned-rest week
     (cap 1 per run); bare empty weeks are failures, never free
     passes. No "schedule-less = trivially true" path exists.
   - Coach: one celebration line per closed run; repeats only when a
    new run closes.
- M4 YEAR (LOCKED, user yes — audit missing feature M4; "tracking
  starts when I start recording is the goal"): ONE definition of
  "year" across the whole app. User chose the anchored-window
  model, Option 2:
  - YEAR = non-overlapping 365-day window anchored at the family's
    first qualifying log: gym years from the first logged workout,
    journal years from the first qualifying entry, habits from the
    first completion, food from the first qualifying log, body from
    the first weighing, media from the first kept file (per-domain
    anchor, exactly the M3 primitive's `yearlyPass(criterion,
    anchor)`).
  - SIX-DOMAIN FAMILY (Life Fully Logged → rings → Ouroboros) has
    ONE anchor — the app's first-ever qualifying logged event
    across ANY of the six domains (user note: "tracking after I
    start recording something would be optimal" — global start, not
    per-domain, so the rings window begins at the app's actual
    birth).
  - "ONCE PER CALENDAR YEAR" IS DEAD as a phrase: all v2 trophies
    reading "once per calendar year" (Full Orbit, Full Orbit On
    Camera, The Living Archive, Took the Time, Life Fully Logged,
    etc.) now fire ONCE PER ANCHORED YEAR — the check runs when the
    window closes. No double-fire within a calendar (two anchored
    windows can't close in one calendar year), no partial-window
    credit.
  - "CONSECUTIVE CALENDAR YEARS" wording in the older T14/Ouroboros
    ledger line is SUPERSEDED by this lock: Ouroboros fires after
    10 CONSECUTIVE ANCHORED WINDOWS (each the app's global start +
    N×365 days), restart semantics unchanged. (The rings entry
    keeps its count-based behavior; only the "window" wording
    tightens.)
  - BOOKENDED is the single NAMED EXCEPTION — its success is
    January-1-first-entry + December-31-last-entry in the SAME
    calendar year, definitionally calendar. Stays calendar by
    special carve-out, one paragraph in the spec saying exactly
    why it avoids the anchored rule; no other trophy does.
  - M5 (year bucketing/re-arm) rides on this: a year = window
    index N (Year 1 = your first 365 days from the app's start);
    the app can label it "Year 1/2/.../N" with the real dates
    inside; nothing else changes.
  - Imports never qualify any year (rule 2) — already locked,
    repeated for the anchored model.
- M6 QUALIFYING ENTRY — THE ONE DEFINITION (LOCKED, user yes — audit
  missing feature M6; "qualifying" appears ~57x across ~35 trophies,
  zero definitions; now ONE block, six bars + two derived lines):
  `qualifyingEntry(domain, dayKey)` → bool is the single owner every
  "qualifying" sentence in v2 inherits. A qualifying entry is:
  - JOURNAL: non-imported entry, ≥ 40 words, on its own occurredAt
    day (user picked: 40-word floor APPLIES EVERYWHERE, matching Ink
    on the Page + the anti-burst guardrail note; option A).
  - FOOD: non-imported log with ≥ 1 real logged item (named,
    quantified) — typed daily totals, placeholder rows, empty logs
    never count.
  - GYM: non-imported training session with ≥ 1 real logged set
    (weight/reps or time) — "went gym, whatever" sessions with zero
    sets never count.
  - HABITS: a real habit completion that day (incl. N7 auto-tracked
    completions). completion_revoked never counts. PLANNED REST
    NEVER FILLS THE SLOT (user yes, C4): a rest day is honest
    absence, not activity — "absence alone must never earn
    anything" (already stone) means an empty day can't score the
    six-domain counters; streaks still freeze on it, Honest Rest
    still fires, nothing is punished — the domain is simply NOT
    present that day.
  - BODY: a real weigh-in value OR a physique-timeline photo that
    day (user yes, C5: photos fill the body slot, else camera
    users starve the rings artificially). Typed guesses never
    count.
  - VLOG/MEDIA: a kept, non-imported video with measured duration,
    captured through the pipeline OR adopted from the phone
    (user yes, C3: both; adoption = testimony, proof-of-life is
    the family's point). Imports NEVER count anywhere. An adopted
    first vlog therefore still fires Rolling Tape; capture-only
    would have left "first vlog" possibly dead forever.
  - DERIVED LINE 1 — "a qualifying day": a dayKey with ≥ 1
    qualifying entry in that domain (powers A Season Kept, Same
    Time, Full Orbit, No Deviation day sets, A Month of Logging
    per-day, etc.).
  - DERIVED LINE 2 — "qualifying activity in a month": a month with
    ≥ 1 qualifying entry in that domain (powers One Year In /
    Two-Five-Ten Years ≥ 9-of-12 / ≥ 75%-of-months presence).
  - WORD-TROPHY CARVE-OUT (user yes, C2): Novel-Length Life and
    Deep Dive read EVERY non-imported entry's words regardless of
    the 40-word floor (they sum/measure words, not entry-counts —
    forcing them through the floor would silently delete the small
    daily fragments that ARE the novel). Only these two carry the
    exemption; every other trophy inherits the bars.
  - Exceptions only via explicit override line in the spec; the
    override table at write time lists exactly: Novel-Length,
    Deep Dive (word-trophy), Ghost (run-alive, not entry-based),
    Bookended (calendar), and no others.
- M7 LOOSE-END TRIO (LOCKED, user yes — audit leftovers): three small
  decisions gone in one go:
  - UNPROMPTED DOMAIN LIST (user yes, audit Part 4 note): the
    catalog's solitary-day list is "no habit, workout, food log, or
    vlog" — BODY IS DELIBERATELY EXCLUDED: a weigh-in or physique
    photo on the same day does NOT break Unprompted. Rationale: body
    is routine tracking, not "another activity" — the trophy polices
    the four effort domains; body is invisible to it (matches
    catalog text as-is, now explicit).
  - ELITE TIER (user yes — "intentionally left out"): the strength
    standards table seeds five tiers in v2 (only Novice /
    Intermediate / Advanced fire trophies) — confirmed INTENTIONAL:
    the top tier exists as a Coach-observable ceiling only, ZERO
    trophies read it. Recorded so no future pass "fixes" it into a
    trophy.
  - SCHEDULE-NEVER-BREAKS REST DAY (user yes): a planned-rest event
    landing ON a scheduled weekday means that slot is RESTED — it
    neither breaks the 26-week pattern run nor counts as off-pattern
    (the slot freezes, same rest semantics as the whole family).
    Only a REAL missed day (no workout AND no rest declared) makes
    an off-pattern week.
  - SCHEDULE-NEVER-BREAKS EMPTY WEEKS (LOCKED, user yes Aug 09 —
    audit E-clash #1, same vacuous-pattern fix as Trimester): a week
    with zero scheduled sessions is an OFF-PATTERN week — it breaks
    the run. The pattern can never be trivially true by having no
    pattern; an empty week does not infer "no weekdays", it fails
    like any missed week. First week empty = no run starts until a
    real scheduled week arrives. Pre-pattern history doesn't count
    toward the 26.
- M2 COACH → already merged into the one surface (A4); the
  rule catalog for fitness/nutrition (adherence, volume balance, deload/
  period quiet, PO gating, phase messaging) to be written as ONE list at
  M2 (pending, not built).
- SECOND-AUDIT CLOSE (audit round 2 — all four "first-sweep misses" fixed):
  - CENSUS CORRECTION (revised): the true catalog = 121 trophies +
    47 ladder tiers = 168 named entries (verified by header
    enumeration: every `**`-headed line minus the 10 ladder-category
    headers, minus the 8 NOTES headings, minus one stray mid-paragraph
    bold; cross-checked by `^- Criteria:` line count = 118 headers,
    +3 from multi-entry headers "Two/Five/Ten Years" and "Paced
    Bulk/Paced Cut"). The earlier "136 trophies + 47 = 183" figure
    was itself an overcount — it treated ladder-category headers,
    NOTES paragraphs, and the stray bold as trophies; the old
    "170"/"169" claims were likewise wrong. 183 is now corrected to
    168 everywhere. The push-up ladder 50 tier was
    renamed "Fifty Push-Ups" (originally *Half Century* — collided with
    the journal Half Century trophy; renamed, no overlap anywhere).
  - RING SERIES CENSUS UPDATE (user yes Aug 09): the 10 ring trophies
    (Pith → Yew, see M2 YEARLY REST ring list) were added to the v2
    catalog after the count above — catalog is now 131 trophies +
    47 ladder tiers = 178 named entries; all census claims in this
    file now read 178.
  - NO DEVIATION TOLERANCE (A1): the v2 ±3% is the truth — the Ghost
    lock line said ±30% (a typo carried in); now fixed to ±3% in
    the M1 GHOST block above (NoDeviation component alignment).
  - DUPLICATE BLOCK (A2): v2.file contained a stale duplicate of the
    relative-strength family + a stale "Strength Standard Reached"
    with OLD text ("most-recent logged bodyweight" — pre-C2 metric),
    which CONTRADICTED the locked est-1RM÷rolling-BW C2 definition.
    The duplicate block was deleted (v2 file now has ONE copy of
    each; the C2-fresh version at v2:346-399 survives).
  - "ONCE PER CALENDAR YEAR" RESIDUE (A3): scrubbed in v2 to match
    the M4 anchored-window lock: Full Orbit, Full Orbit On Camera, The Living Archive, Took the Time, Life Fully Logged,
    Vow/Old Growth/Ouroboros all now say "anchored yearly window".
    Bookended retains the calendar-year carve-out (the lone exception,
    explicitly noted in v2 text).
  - ROLLING TAPE (A4): v2 capture-pipeline-only wording replaced with
    the M6 lock (first KEPT vlog — captured OR adopted). Aligned.
- B1-B5 RESOLUTION ENTRY — ALL LOCKED (user approved Aug 09; each
  item below carries its own decision stamp):
  - B1 "once per habit" vs "once per anchored year" — **LOCKED
    (user yes, Aug 09): re-fire per qualifying window.** It is a
    repeatable achievement: EVERY time a habit passes its criterion
    inside a window (e.g. ≥ 300 completions in a 365-day anchored
    window), the trophy fires again (annual-anniversary-style). The
    v2 wording "repeatable, once per habit" is SUPERSEDED for the
    yearly-window families (Full Year, One Habit / 3y-5y No Missing
    Links + all 11 yearlyPass families): per-year boolean = the
    trophy fire itself, not merely engine input. No double-fire
    WITHIN a window (one close = one fire); a failed window fires
    nothing. 3y/5y chains unchanged (their own fire at chain
    completion). PLUS, by explicit user pick: THE LONG HAUL (500-day
    unbroken streak) also re-fires every time a 500-day streak is
    rebuilt/crossed again — the endurance top is treatable like a
    yearly merit. One Week In (7d) and A Hundred Days (100d) stay
    STRICTLY once per habit (unchanged, v2 wording stands).
    COMPLETE PER-TROPHY MAP (all 7 "once per habit" lines, user
    confirmed Aug 09): One Week In = once per habit; A Hundred Days
    = once per habit; The Long Haul = RE-FIRES per rebuilt 500d;
    Full Year, One Habit = RE-FIRES per qualifying window; Like
    Clockwork = once per habit (explicit user pick); One Trip Around
    the Sun = once per habit (explicit user pick); 3y/5y No Missing
    Links = fire at chain completion.
    UI NOTE (user pick, Aug 09): every once-per-habit / per-window
    trophy fire must call out, in a small way, WHICH habit earned it
    (e.g. "A Hundred Days — journal"). Applies to all the habit-
    themed fires in the map above; spec display line carries the
    habit label.
  - B2 "Real Progress" thresholds were undefined (v2: "meaningful
    cumulative net-change thresholds" only). **LOCKED (user yes,
    Aug 09): net change from the phase's starting rolling average,
    in the goal direction only — user's own direction is GAIN
    (bulk); 4 stepped repeatable fires: +2.5kg / +5kg / +10kg /
    +20kg.** (Celebrate at each step; the 1-week rolling
    confirmation is already locked. The bodyweight ladder [absolute
    milestones] stays as-is — Real Progress is the net-change
    mirror.)
  - B3 "On Target" target band was undefined — **LOCKED (user yes,
    Aug 09): the weekly average (5/7-day floor) must sit inside
    ±10% of the day's target — same ±10% band as C2 (fully-logged
    day tolerance). One number, used by both — (±10% default; same
    Advanced-only knob as C2, clamp 5–15%).**
  - B4 "weekly checkpoint" was undefined — **LOCKED (user yes,
    Aug 09): a weekly checkpoint = the rolling-average evaluation
    at the CLOSED calendar week (Sun), once per week. Thin weeks
    (<5/7 logged weigh-in days) do not count as checkpoints (they
    neither confirm nor reset). Weight-ladder and Real Progress
    confirmations read the two most recent consecutive non-thin
    weeks' checkpoints.**
  - B5 GHOST tolerance — folded into A1 above (±3%, fixed).
- E1 JUGGLING ACT SCAN KIND (LOCKED naming, user yes Aug 09):
  Juggling Act ("≥ 3 distinct habits same-day on 14 such days within
  any 21-day window") reads a DERIVED exists-a-window scan: does any
  sliding 21-day window contain ≥ 14 qualifying days? NOT a rolling
  average/mean primitive — a count-in-window existence query. No
  engine change; the spec must name it as this exact query kind so
  triggers cannot drift (distinct from the M3 averaging windows).
- E3 PERFECT MONTH vs GRACE (LOCKED RECORD, user yes Aug 09):
  grace covers STREAKS ONLY — a grace-covered miss is still recorded
  as a miss (grace lock, M2 GRACE). Perfect Month requires every
  calendar day of the month logged (28-31/31 real log days); a
  graceful miss means that day is empty → the trophy does NOT fire.
  The spec must never write "grace saves Perfect Month."
- E2 TOOK THE TIME THRESHOLD (LOCKED, user yes Aug 09): the
    "configured healthy-balance threshold" = a SETTINGS KNOB in
    Settings → Group 5, default 14 days per vacation year,
    user-editable (matches the existing vlog-buffer / grace setting
    precedent). Data side costs nothing: vacation days are derived
    from the existing `periods` entity (type vacation, date-range
    join) — no new entity, no new storage.
  - E2 VACATION-KEY UNION (LOCKED, user yes Aug 09 — audit E-clash
    #5): vacation-day counting is a DAY-LEVEL UNION, never a naive
    per-period addition. Each calendar dayKey inside at least one
    vacation period counts AT MOST ONCE toward any vacation-day
    total (Took the Time's yearly counter + the healthy-balance
    knob), regardless of how many overlapping period ranges contain
    it. Overlapping ranges never inflate the count; dayLevel union
    (set of dayKeys inside any vacation range) is the only correct
    shape the spec may write.
- G-LIST BATCH 1 (LOCKED, user yes Aug 09): repeat-cadence pins.
  - G5 JUGGLING ACT CADENCE: fires once per CLOSED 21-day window that
    qualifies (≥ 14 qualifying days); overlapping sliding windows do
    not re-fire; the next legitimate shot is a fresh, independently
    qualifying 21-day window (B1 per-window logic).
  - G6 TRIFECTA WEEK CADENCE: fires once per closed 7-day window
    containing all three PRs; overlapping scans never re-fire.
  - G2 SAME-QUESTION RE-ARM: Same Question, New Answer fires at 2, 3,
    and 5 distinct years, one-time each — NO repeats at 6+. "5+" means
    "the final milestone is at 5", not "fires every year after 5".
  - G7b BACK-AT-IT PR (user pick): the matched/exceeded prior PR is
    ANY prior PR across any exercise — a deadlift PR satisfies a
    gap behind any lift. Not per-exercise.
- G-LIST TRIGGER PINS (LOCKED, user yes Aug 09 — ALL items of the
  audit G-list; batch 1 + batch 2 + G19 correction):
  - G1 30-MIN SLOT ANCHOR: a robot-consistency run (Like Clockwork /
    Same Hour Same Scale / Same Time family) anchors its slot to the
    FIRST qualifying completion of that run — later completions must
    each fall within ±30 min of that anchor slot; any outside = break.
    No fixed clock-grid slots; every run re-anchors at its own start.
  - G3 THEN AND NOW N: the "multi-year" third threshold = 3 years
    (6 months → Branch, 1 year → Heartwood, 3 years → Grove; a photo
    gap ≥ 3 years fires Grove).
  - G4 COUNT-MILESTONE UNIT: count milestones (Unprompted 10/50/200,
    Wrote It Down 10/50, Full Circle Day 10/50/100/365) count
    DISTINCT QUALIFYING DAYS — a day with multiple qualifying entries
    still counts once. Never entry-total multiplicity.
  - G8 FULL-YEAR-ONE-HABIT ANCHOR: the 365-day window anchors at THAT
    HABIT's first qualifying completion (rebuild-anchor local to the
    habit), never the app-global anchor.
  - G9 LIVING ARCHIVE WINDOW: all three criteria (200 entries + 100
    vlogs + 100 workouts) must be concurrently true inside ONE shared
    365-day window anchored at the app's global start anchor.
  - G10 WEEK DEFINITION: A Week Whole uses ISO Mon–Sun calendar weeks,
    literal v2 text; never drifts with the review-day or week-start
    setting.
  - G11 CALENDAR MONTH: Frame by Frame months = true calendar months
    (1st–month-end); a photo logged April 30 cannot fill March.
  - G12 BOOKENDED 40% FLOOR: "≥ 40% of that year's days" — the
    threshold = FLOOR(0.40 × days-in-that-calendar-year): 146 on a
    365-day year, 146 on a leap year (366 × 0.40 = 146.4 → floor 146).
    Always floor, never round-up; per-year day count uses that year's
    real length.
  - G13 EYES-ON-THE-DATA WINDOW: the "same 7-day window" = any 7-day
    band CONTAINING the weight-ladder-confirmation day (containment,
    not centering — no D−3…D+3 requirement).
  - G14/G15 ACTIVE-PHASE REQUIRED: Real Progress and On Target fire
    ONLY inside an active phase (phase's starting average / target
    band). No active phase → no fire, ever. Goal-only days without a
    phase never satisfy them.
  - G16 PACED 80% THIN WEEKS: weeks with <5 valid logged weigh-in days
    are thin — they count NEITHER for NOR against the 80% (identical
    to the B4 thin-week exclusion). The 80% ratio is computed over
    non-thin weeks only.
  - G17 FULL CYCLE PARTIAL WEEKS: a partial week at a phase edge
    counts as a week when it has ≥ 1 qualifying workout; the 80% is
    computed over the phase's spread span (startDate→endDate), a
    partial week included as one week if it has a qualifying workout.
  - G18 SAME-HOUR WEIGH-IN ANCHOR: Same Hour Same Scale and Steady
    Hand anchor BOTH the weekday AND the 30-minute slot to the FIRST
    qualifying weigh-in of the run — every later weigh-in must land on
    that same weekday within that same ±30-min slot (26 consecutive
    weeks for Same Hour, 12 for Steady Hand); any outside = break.
    A run re-anchors at its own first weigh-in, never a fixed
    clock-grid. Uses occurredAt declared time (TENSION 15).
  - G20 PB-ALONE DAY-ONE SCOPE (checked — no action needed): "Day
    One" in the PB-alone family = the first-ever qualifying
    habit-completion event (Section II "first" reading); no
    head-on collision between the two phrasings — recorded as
    verified-consistent, no pin required.
  - G19 FIVE STRONG (user REVERSED the default): "active streak ≥ 7"
    counts STRICT CONSECUTIVE days ONLY — grace-carrying weeks do NOT
    count as active. A grace-rescued day is not an active day for
    Five Strong; streaks must be unbroken by real consecutive
    completions.
- JOURNAL TEXT PRIVACY STAMP (clash #6 — RESOLVED, user picked A):
  every Coach/journal-reading feature must be stamped in the docs pass as
  either "facts only" (entry dates, word count, tags, area — no text) or
  "needs text access → user opt-in first". The milestone review and all
  cadence lines are FACTS ONLY. Anything reading actual words (mood,
  topics) stays gated behind the existing M2+ text-analysis opt-in. Stamp
  bears in Architecture.md + CoachSystem.md ("journal content read only
  if user opts in") and is repeated per new feature so no feature silently
  assumes text access.
- M0 JOURNAL/MEDIA → A5 (physique photos = journal entry tagged health+
  physique) is the ONLY journal-side touchpoint; no other M0 change
  identified. Media D028–D038 unchanged by the ledger.
- M0 HABITS → N7 auto-track bridge + habit.completed_revoked event
  pattern (already locked in ledger; M2 gamification must be written to
  respect it).
- MILESTONE-LEVEL (not feature-level): the O6-A2 entity-sync plane is a
  REQUIRED new milestone (Roadmap restructure, pending approval); the
  weekly-review-day config, milestone review cadence, and the
  "reviews: tiny XP or no XP" decision are M2-time items.

## Calendar UI (LOCKED — browse surface, never a verdict)

Role: the calendar is the app's MEMORY MAP (browse/what-happened), NOT a
judgment surface. Verdicts live only in the weekly check-in (H2/A4). It
derives everything from existing H3 owner functions — zero new storage,
zero writes (it only navigates to day view / real screens).

- Month grid: each day cell shows a TINT, never dots/numbers/icons.
- FILTER MODE = single system (`Journal | Fitness | Nutrition | Body |
  Habits`): the whole day cell SHADES in that system's color — full
  tinted block. A Fitness-filtered month reads as one continuous heat
  pattern (days with workouts vs blank days). Filters only render for
  systems that have data (H4).
- FILTER MODE = All: one NEUTRAL tint whose STRENGTH = how much happened
  that day (1 thing = faint, 6 things = stronger). No rainbow — a single
  gradient of activity intensity. Tap the day → day view lists systems.
- Tint INTENSITY = volume (deepening with more entries in scope).
- Today = separate border ring. Selected day = accent outline.
- FUTURE DAYS = dimmed/desaturated (no "why is this blank?" — it hasn't
  happened). Today = ring; past = full; future = disabled look. [user OK]
- CALENDAR FURNITURE (locked, user OK): month-name header, swipe/arrows
  between months, a "Today" jump button, and a week↔month view toggle
  (the A6 planning grid and the month calendar connect through it).
- dayActivityScore = ONE H3 owner function (same module as the weekly
  check-in; pure; no independent scoring anywhere):
    workout/session logged = 3 (one per day max)
    meals = 1 each, CAP 3/day (3rd+ meal contributes 0)
    daily weigh-in = 1 (one per day max)
    journal entries = 1 each, CAP 2/day
    habit completed = 0.5 each, UNCAPPED (more habits done = the
    completeness signal itself; meals/journal stack is NOT proportional
    activity, so it caps.)
  and tintLevelFor(score): 0 = white, 1–2 = faint, 3–5 = medium, 6+ =
  strongest.
  (Per user: prevent volume-logging inflation — many meals shouldn't
  beat a workout day in tint. 4.4 RESTATED, NO CHANGE: the score has no
  hard ceiling by design — habits are UNCAPPED at 0.5 each, so a
  high-habit day can reach the 6+ "strongest" bucket and match a workout
  day. That is the user's own locked rule: more habits done IS the
  completeness signal; meals/journal cap because volume ≠ activity. Caps
  stay as locked.) MISSED habits contribute 0 (no negative/
  red state) — the tint communicates activity VOLUME only; missed-habit
  warnings live in the Coach reflection prompt, never the tint.
- No glyphs/emojis/numbers on the grid — only paper background, tint,
  and the today/selection rings.
- Day view (tap any day) = chronological list of everything that day
  (weigh-in, meals, gym session, journal entries, habits), every line
  derived; links to the real screens. Filter chips apply here too.
- "PLAN-vs-ACTUAL" toggle in day view (user OK): a split toggle —
  Actual / Plan / Both. Routine slots (planned) pair up against what
  actually happened (derived from A1 routine data + sessions):
  [planned: gym 17:00 · actual: missed], [planned: rest · actual:
  cardio], etc. Derived, no storage.
- GOAL DEADLINES: goal/completion target rows ring the day cell in the
  goal color (deadline ring), day view lists "deadline: reach 75kg" first
  line. No glyphs.
- YEAR HEATMAP (zoom): month → year = 12 mini-months of the same tint
  (GitHub-contribution style). Same owner function, no new data.
- PERIOD creation methods (both): (1) drag a range on the calendar; (2)
  manual date picker from the trips/trip creation — pick two dates,
  everything in between IS the period (same periods entity). BOTH end in
  a visible confirmation step — "Create period [start → end]?" — before
  commit (audit 8.2; critical now that drag-add is day-1 — an accidental
  drag must never silently create a range).
- Coach outputs in day view: a quiet line under the day's events
  ("Coach: 'three days without journal — what's in the way?'").
- Month-header fact line: e.g. "22/31 days logged this month" — one small
  derived fact, not a verdict. Definition (audit 2.3): days logged =
  dayActivityScore > 0 — same H3 owner as the tint. Renders ONLY in the
  All filter view (audit 8.3); hidden in single-system filters so the
  count never reads as a per-system verdict.
- Week grid (A6 planning glance) ↔ calendar month link by tapping a week.
- Texture: "the calendar is a heatmap of your life; filters turn it into
  a heatmap of one thing." Clean, minimal, single-color-at-a-time.
- DELIBERATELY NOT: any monthly report / monthly verdict — that would be
  a new verdict surface (H2 violation); the long-view review exists as
  the MILESTONE REVIEW (anchored to first journal entry — see its
  section below), which lands as a section in the check-in, never a new
  screen.

## Settings tab (LOCKED — generalized settings surface)

Principles: H4 applies to settings too (a group appears only when the
user has data for it — no "Sync" group until sync ships); TWO TIERS:
Main (plain-English, things actually touched) + Advanced (collapsed
drawer for thresholds/constants); SEARCH at top (H4 escape hatch);
"Restore defaults" per group — always behind a confirm dialog naming
what will reset (audit 8.1); no other fluff.

Group 1 GENERAL (extends existing settings): display name · timezone ·
theme (dark default, UIUX "theme-able from day one") · WEEK STARTS ON
(Monday default; display-only — routines stay stored by weekday index).
Effect (audit LOW-24): shifts the calendar week-grid first column ONLY
— display; the weekly checkpoint close day stays owned by the review-day
window (S15-003) and B4's closed ISO week (G10); A Week Whole keeps ISO
Mon–Sun regardless (G10).

Group 2 COACH: strictness (supportive/balanced/strict, default balanced)
· WEEKLY REVIEW DAY (default Sunday — item 34 "configurable day") ·
Coach notes in calendar day view (default on). Weekly-window rule
(audit 1.5): the evaluation window = the 7 consecutive days ENDING the
configured review day — single owner; the merged check-in (H2/A4), the
strip's weekly-verdict portion, and the Coach weekly aggregate all
consume it; the calendar
week-grid's first column follows WEEK STARTS ON (S15-002); the
evaluation window and the checkpoint close day are unaffected.
Milestone-review cadence
(editable ladder: 1m / 3m / 6m / 1y / yearly, per milestone, or flat
interval — see Milestone review section).

Group 3 FITNESS: units kg|lb / cm|in (O8) · GLOBAL KILL-SWITCH for PO
auto-suggestions (default on; item 36) · default weight step (2.5kg) ·
rep-first threshold (+2) · physique-photo nudge (default OFF, monthly —
F5) · rolling pace window (7d, 14d optional — O3). ADVANCED: last-time
hint freshness tiers (O4, as locked) · MRV volume floors per muscle
group (item 31, settings-editable).

Group 4 NUTRITION: height/age/sex/activity factor (NU6/I9 settings keys)
· MANUAL TDEE OVERRIDE (closure 3 + B4 freeze) · protein g/kg per phase
(cut 2.0 / bulk 1.8 / maintain 1.6 — NU7) · fat floor g/kg (0.6, editable
up) · quiet meal reminders (default on — C1 on-open catch-up).
ADVANCED: fully-logged streak window (C2, ±10% default — Advanced-only
knob, clamped 5–15%) · backfill bound
(normal ≤24h vs historical — closure 6) · macro-collision priority
(default keep protein, drop fat — NU11) · FOOD MACRO LOOKUP (default ON —
NU13; OFF = plain manual entry).

Group 5 CALENDAR & MEDIA: default filter (All) · plan-vs-actual default
view (Both) · month-header fact line (on) · vlog rewatch buffer days
(3–5, default 5 — D030). ADVANCED: tint weights/caps (dayActivityScore,
as locked — keep fixed).

Group 6 HABITS: auto-track from workout (per habit, N7) · deload-day
counting (per habit, default counts).

Group 7 DATA & STORAGE (audit fix 1): manual backup/export/restore ·
storage meter · batch journal import (J3) · year-book export (J5).
"Settings → Data" in J3/J5 NOW POINTS HERE — this is their real home
(it existed in name only before this audit).

Group 8 SYNC (A2): skeleton only — sync on/off, Wi-Fi-only, last-sync
time. Renders only when the entity-sync plane ships.

NOT OFFERED AS TOGGLES (guardrails): rep guard 1–12, Epley/Mifflin/
Atwater formulas, 7700 kcal/kg (public-formula constants — toggling
breaks "absolutely solid" math) · dayActivityScore weights (H3 owner;
Advanced-only if ever) · per-exercise progression style (per-exercise
data, not a global toggle) · reveal-on-first-data H4 (principle, not a
preference) · XP/achievement values (M2 open items) · check-in section
on/off (one surface, no section chopping).

## Periods (LOCKED — derived content containers, "the blog/media trip")

Periods = a user-created start/end date range + title + type (vacation /
term / holiday / etc.). A PERIOD IS AN INVISIBLE METADATA RECORD (in the
media/journal style, but NOT a journal entry itself — Option A, user
approved). It collects content by DATE-RANGE derivation, never by
copying or owning it.

- Model: a small periods record (id, type, title, startDate, endDate,
  notes?, extraEntityIds? — nullable JSON list of entity refs, audit
  1.6) — schema addition on the media/journal side, NOT the fitness
  graph. Content itself never moves or gets flagged: journal entries,
  photos, vlogs, and (transitively) weigh-ins/workouts with dateKeys
  inside [start, end] (INCLUSIVE, audit 3.4) belong to the period
  DERIVED at view time (H3 pattern). Date ranges are the join by
  default; extraEntityIds is the ONE deliberate, documented exception
  (an item dragged into a period outside its range, day-1) — not an
  oversight, and the only place a period holds a reference.
- No new storage for content; nothing is double-written; deleting or
  changing a period NEVER orphans/loses content — re-range and everything
  re-slices instantly.
- Trip view = the journal+media timeline scoped to the period (reuses the
  D031 physique-timeline / journal timeline pattern), shows all content
  automatically by date. Ragged edges (day-1, audit 1.6): the user may
  drag a stray item into a period even if outside its date range; the
  reference is stored in extraEntityIds on the periods record (single
  owner) and survives re-ranges. Deleting the period drops the reference
  only — the entity itself is never touched.
- Nothing is created in the user's journal: the user can still write a
  normal journal entry during a trip and it appears automatically (it
  carries a date). App NEVER fabricates a blog post on period creation.
- Coach side: a vacation/period quiets adherence expectations like a
  deload does (dips expected, non-naggy) — "vacation, not laziness".
- Calendar: period renders as the top band / cell tint context
  (per the calendar UI), and its colored block IS the tap event → opens
  the "trip view".
- This is the "blogging/media" home for vacation trips etc. — the sole
  new entity is the small `periods` record.

## Milestone review (LOCKED — "since you started" review, anchored to first blogging)

The long-form counterpart to the weekly check-in, on the same H2/A4
surface model — NEVER a new screen. This is the realization of the
calendar section's own note ("a lifetime-flex summary, if ever wanted,
becomes a section in the check-in").

- ANCHOR (derived, not stored): the FIRST journal entry's date = "day
  one". If that exact entry is deleted, the anchor falls back to the
  next-earliest journal entry (stable derived value, not a stored pivot;
  H4: no journal entries at all → no milestone review, nothing to
  reveal).
- CADENCE (smart): default ladder off the anchor — +1 month · +3 months
  · +6 months · +1 year · then yearly. Settings Group 2 (Coach) makes it
  EDITABLE: enable/disable individual milestones or set a flat interval
  (e.g. only 3m / 6m). Smart catch-up: if the anniversary passes while
  the user is away, the review is generated the first time the app opens
  after the due date — one-tap opens it; once only, no overdue nag (mirrors
  C1 catch-up semantics).
- DELIVERY: user-approved design — a `coach_outputs` row, kind =
  "milestone_review_anniversary", same analytics → rules → reflection
  pipeline; it
  renders as a SECTION of the merged Sunday check-in (H2/A4) when due,
  never a standalone screen. Dashboard shows a "your N-month review is
  ready" card → check-in section. Rides backup/export/sync like every
  coach_outputs row.
- WINDOW = since the previous milestone review (or day one for the
  first). Everything derived from existing H3 owners — rollingAvgWeight,
  adherenceWeek, strengthSnapshot, deriveMacros, habits/journal cadence —
  zero new entity tables.
- CONTENT (H4 per-data): journaling cadence (from journal entries —
  the anchor story), habits, gym (adherence/volume/PRs), body (weight
  trend), nutrition (food vs targets), goals. Sections appear only if
  the user has that data; empty areas get a single honest line, not a
  dead block.
- PHASE AWARENESS (user-approved): for EACH phase that was open during
  the window, the review renders a phase block in the style of the N9
  phase-close report — type + date range, pace vs target, weight trend,
  adherence — or a closure summary when a phase ENDED inside the window.
  Phases are reported one-by-one, never blended, so multi-phase periods
  don't double-count. No phase open → the block simply doesn't render.
- TONE/RULES intact: advisory only, NO XP, coach-line-per-strictness,
  honest labels (same "absolutely solid" math, same owner functions).
  THE missing monthly/cadence statutory — the weekly surface stays the
  only weekly verdict; the milestone review is the app's cadence-based
  long view within it.
- EDGE RULES: milestone already generated for this date → never re-mint
  (idempotent); deleted anchor handled above; partial-window rule (3.3)
  and ±-deviation honesty apply when window data is thin.

## Journal-side features (Part B — LOCKED one-by-one, user-confirmed)

J1 "ON THIS DAY" MEMORY STRIP (LOCKED, user yes): a small card on the
    Calendar (memory-map screen) + a tiny line at the top of the Journal
    view, showing what was logged exactly N years ago today (nearest
    past year with data first: 1y → 2y → 5y...). Tap → opens that past
    entry normally (reuses existing entry view). PURE DERIVED query —
    "entry with date = today minus N years"; zero new storage, zero new
    schema, zero new screens. RULES: H4 — no data → strip does not
    render (no empty card, no guilt); NO XP (reading is never a point
    source); facts-only (never reads text content); no notifications.
    MEDIA STUBS (audit fix 6): if that past entry's media is
    PC-archived, the strip shows an honest STUB (thumbnail + "archived
    to desktop, tap for details") — never a broken play button. LEAP
    DAY (audit C2): Feb-29 entries match Feb 28 in non-leap years.
J2 JOURNAL SEARCH (LOCKED, user yes): a search entry point (journal
    page + calendar) that finds entries by plain word/keyword/tag and
    filters by Life Area; results newest-first with the matching term
    highlighted; tap → opens the full entry. FULLY OFFLINE — reads the
    entries on the device; no network, airplane-safe. ZERO new storage
    (match over existing text/tags; no index table needed at personal
    scale — re-evaluate only if it ever slows). PRIVACY: search finds
    YOUR words but never shares them and never gives the Coach text
    access (facts—privacy stamps unchanged). SIMPLE MATCHING only
    (whole words + tags; no fuzzy/AI). PERFORMANCE (audit C1):
    run the search in a worker if it ever feels slow on low-end
    phones — no index table at personal scale.
J3 BATCH IMPORT OF PAST ENTRIES (LOCKED, user yes): Settings (Data)
    → "Import entries" → one plain-text file with a documented format
    (date | title | text per block) → preview list with dates (e.g.
    "47 entries, 2019–2021") → confirm → rows added as normal,
    backdated journal entries. HONESTY RULES: entries only — importing
    NEVER creates habit check-ins, weights, or any other data (no fake
    history); imported entries carry a tiny "imported" flag so future
    views know they were typed later; NO XP for imported content (the
    content-gate rewards new writing, not dumped history). No new
    tables — existing entry columns + one flag + one immutable
    import-hash column. DAYKEY = the ORIGINAL
    date (calendar tint/heartmap/history land on true dates, never the
    import day — audit optimization 3). DEDUPE (audit fix 2): re-import
    of the same file is BLOCKED by (original date + body-content-hash);
    the hash is captured AT IMPORT TIME and stored in one immutable
    column next to the `imported` flag — dedupe always checks the stored
    value, never the live body, so editing an imported entry later can
    never re-enable a duplicate import. Preview reports "N already
    imported, M new" and only the new M rows are added; the same memory
    can never exist twice.
    ACHIEVEMENT/CADENCE EXCLUSION (audit fix 5): anything counting
    "documented days", journal cadence, or journal-driven counters
    EXCLUDES rows carrying the `imported` flag — a historical import
    never mints months of history the user didn't personally keep.
J4 "QUIET WEEK" (LOCKED, user yes): the user marks a date range
    (Settings → Coach) as quiet; during it the Coach pauses nudges
    (habit-miss lines, journal-drought pokes, streak warnings) —
    journaling/gym guilt loop muted. This is the journal twin of the
    gym deload + "vacation, not laziness" rule. HONESTY RULES: ONLY the
    user starts a quiet week (never auto-detected from skips); history
    stays TRUE — missed days still log; the STREAK STAYS REAL
    (audit fix 4 — user-approved): quiet weeks do NOT shield habit
    streaks; breaks still register. Quiet week silences the GUILT only
    (nudges/Coach lines), never the facts. Streak-shield for exams/
    trips = the Grace setting (finite, configurable), not quiet weeks —
    two shields would become one unlimited shield. Affects nudge/Coach
    rules only, never body/gym metrics. No new tables — a settings
    range + a rule precondition. INCLUDES the calendar day-view
    journal-drought line — every drought poke routes through the Coach
    rule pipeline so quiet weeks silence all of them (audit
    optimization 4).
J5 ANNUAL "YEAR BOOK" EXPORT (LOCKED, user yes; format = PDF, user
    preference): Settings → Data → "Year book" → pick a year → a
    READABLE, human PDF: journal entries in date order, embedded
    photos/vlogs, a small stats page (days journaled, habits, gym
    sessions, milestones). READ-ONLY — packages a copy; never moves or
    rewrites real data. No Coach/XP — pure artifact. Reuses export
    machinery (the JSON+media format) with a PDF presentation layer.
    DEPENDENCY NOTE: PDF generation on Flutter requires a package as
    no built-in PDF writer exists — needs a DecisionLog entry + user
    approval at build time, per the no-new-dependencies rule. PDF is
    more build work than HTML-first; locked anyway per user choice.
    MEDIA STUBS (audit fix 3): the PDF embeds everything locally
    present; PC-archived items print an honest STUB instead (thumbnail
    + "archived to desktop [date], file: …"), mirroring export's
    `exported: false` for offline blobs — never a silent blank.
DECLINED (Part B — user passed, do not re-propose): daily question
    prompt (#2), draft tray (#3), day-end one-liner (#4), energy tags
    (#7). Revisit only with a strong new use case.
J6 JOURNAL TAG/AREA FILTER VIEW (LOCKED, user yes): on the Journal
    page, filter chips for #tags and Life Area (incl. physique-tagged
    A5 entries) — turns search (J2) and the calendar's Journal filter
    into a one-tap findable list. Derived only; no new table (filters
    over existing tags/area fields).
J7 PC VIDEO LIBRARY — "MY VIDEOS" (LOCKED, user yes + auto-adopt
    option 1): a PC-ONLY media library view (passes the D035
    physically-true test — the video files live only on that PC).
    NAMING: media rows gain a nullable `title` — optional at capture
    ("what do we call it?"), editable any time later; display falls
    back to fileName. SEARCH (user request): finds by name/filename/
    date/month/year, offline, simple matching (no AI). AUTO-ADOPT
    (user: option 1): the app remembers ONE chosen folder (File System
    Access API); every time the PC app opens it SCANS the folder and
    ANY new video found automatically enters the library (thumbnail +
    date harvested), with NO user tap — "put a file, it appears."
    GUARDRAILS: the app NEVER deletes, moves, or renames files in the
    folder (folder = source of truth for the blob); a video whose file
    was later removed on disk shows an honest "file missing" stub; NO
    XP; privacy: facts-only, Coach never inspects video content;
    record names and search-index offline. On phone builds this view
    doesn't render at all (D5 discipline). Backup: same as archived-to-
    PC — metadata rides the usual export; blobs stay on PC.
J7 AUDIT FIXES (user approved ALL):
    a) MERGE, DON'T ADD — "My Videos" is NOT a separate screen: it is
    the VIDEOS HOME inside the existing Desktop vault browser (which
    already does All / On this device / In the Drive vault / Archived
    on this PC + "This PC only" toggle). Thumbnail grid default +
    compact list toggle + the J7 search box + name/date/duration live
    THERE. Result: one PC media surface, and MediaStorage.md's "only
    PC-exclusive feature" claim stays literally true (D035 wording
    kept; vault browser = the one home).
    b) SHARED SEARCH UTILITY — one H3-style simple matcher serves
    BOTH J2 (journal) and J7 (videos): offline word/tag match, called
    by both; change once, both update.
    c) ADOPTED ≠ APP-STORAGE — adopted rows carry an `adopted` marker
    (bytes live outside app storage, in the user's folder) and are
    EXCLUDED from the storage meter (meter = app-managed bytes +
    thumbnails only — a huge video folder must never false-alarm 70%).
    d) DEDUP STILL APPLIES — the folder scan dedups via content hash;
    a file copied into the folder twice appears ONCE.
    e) REUSE archived-to-pc STATUS — adopted files use the existing
    archived-to-pc semantics (storageRef → folder path, archivedOnDevice
    = this PC, exported: false stubs). NO new enum.
    f) BACKEND-AGNOSTIC — all of J7 (metadata rows, thumbnails,
    adopted marker, meter math) is written against the LOGICAL schema
    (media_attachments); no IndexedDB/Drift assumption — holds for
    whichever backend Session C locks.
    g) BROWSER COVERAGE (audit MED-16) — AUTO-ADOPT (persisted folder +
    auto-scan) requires Chromium (File System Access API — Chrome/Edge;
    the persisted handle is re-granted silently on relaunch); other
    browsers degrade to manual folder pick per session, no auto-scan.
JOURNAL AUDIT OPTIMIZATIONS (user: apply all):
    1) MONTH FACT LINE — filter-aware wording: "N days logged" only in
    the All view; in the Journal filter the line reads "N days
    journaled" (derived from entry dates). Same H3 owner, display-only.
    2) JOURNAL XP CAP — at most the FIRST 2 content-gated entries/day
    earn XP (mirrors the dayActivityScore cap; keeps anti-farm
    absolute). A genuine 3rd entry simply earns 0.
    3) J3 dayKey = original date (locked in J3 above).
    4) J4 quiet week covers the day-view drought line (locked in J4
       above).

## Daily routine template session (LOCKED)

R1 SCOPE (LOCKED, full-day): day templates are FULL-DAY with typed slots
(kind: meal | pack | workout | activity | rest | sleep) — nutrition only
reads meal + pack kinds; other kinds are structure that future features
(habits N7, sleep, focus) hook into without rebuilding.
R2 DAY TEMPLATES (LOCKED): named reusable day plans ("School Day",
"Weekend", "Holiday") = day_templates (id, name, createdAt, updatedAt) +
day_template_slots (id, templateId, time, kind, title, link — e.g.
recipeId for meal slots, workoutTemplateId for workout-kind slots,
notes?). Binding: weekly routine (R7) + per-day override (R8) per A6 —
no independent per-day toggle.
R3 WEEK BINDING (LOCKED, reframed — see R7): the week calendar binds
DAY TEMPLATES per Mon–Sun slot (a "weekly routine" = one 7-slot binding
list, e.g. [School,School,School,School,School,Weekend,Weekend]). The
workout template lives INSIDE a day template (R2 workout-kind slot) so no
separate per-slot workout/routine kind is needed on the week — keep slotKIND
later if you want standalone workout-less background, NOT required now.
R7 WEEKLY ROUTINE SELECTION (LOCKED, user request): "weekly routines" are
named, reusable 7-slot binding lists ("Term 1 School Routine" = Mon–Fri
School Day + weekend). At the START OF THE CALENDAR WEEK (first day per
WEEK STARTS ON, S13-040 convention) the user PICKS which
weekly routine governs that week (or "continue current"). A routine can be
assigned FOR A SPECIFIC PERIOD (start week → end week, e.g. a school term
or holiday block) → after the period ends, falls back to the DEFAULT
routine (or asks). Otherwise a routine CONTINUES INDEFINITELY until
changed. Direct lift from phases (item 24) semantics: startDate + endDate?
(null = ongoing) + one active rule; no new pattern invented.
R4 PACK SLOTS (LOCKED): pack is its OWN kind (separate from meal). Morning
PACK LUNCH slot creates a "to-carry" item (recipe/manual/scan, calories
entered at pack time — bag is in front of you, honest numbers), which
LINKS to a target meal slot further down (packId → meal slotId). At
lunch — the row shows ✓Packed; one tap "ate it" consumes it. If not eaten
(skipped) the pack item can be "cancelled" (doesn't enter kcal until
consumed — log-entry at EAT time, consistent with NU4 actual-eat-date).
R5 TEMPLATE BUILDING (LOCKED): while assigning days, "import yesterday's /
copy previous day" = copy slot times/tasks then tweak (a copy op, not a
link); past day slots stay frozen like sessions — editing a template
affects future only; user-defined slot kinds anytime.
R8 PER-DAY OVERRIDE (LOCKED, closes hole): inside a chosen weekly routine,
any single day can be overridden to a different day template ("this
Thursday = Holiday Day") WITHOUT changing the routine. Next week that day
slots normally (routine's usual template). Stops tiny real-life exceptions
from forking an entire routine.
R9 DELETE SEMANTICS (LOCKED, closes hole): deleting a day template affects
FUTURE week bindings only; already-frozen days never lose their copied
slot data (tombstone discipline, mirrors workout I2/weeks). A weekly
routine referencing a deleted template auto-falls back to the default
routine on future slots. Nothing retroactive.
R6 TIE-INS (LOCKED): kind is the extension seam (like nutrition's source):
meal → pre-timed nutrition rows + pre-fill from recipe; pack → carry-list
+ lunch claim; workout → links workout template (session day pre-fills);
activity/sleep → future hooks only (N7 habits, recovery). Health area
mapping intact.
R10 WEIGH-IN SLOT (LOCKED): new slot kind weigh-in — routine expects a
morning weigh-in (one tap → body_metrics type=weight; NU8 first-of-day
rule applies; feeds O3 rolling avg / goals / phase pace). Missing flag in
the day view. Natural home for the future smart scale (NU5 auto-writer).
R11 WEEK RECAP (LOCKED): week view strip above the displayed week grid
— derived
summary: gym adherence X/Y, packs eaten ✓, weigh-ins X/7, PRs count,
protein hit-rate. Zero logging added, analytics-only, mirrors item 34.
Denominators (audit 2.4): X/Y and X/7 count only days that HAVE the
slot in the bound template (workout-kind / weigh-in); days without one
are excluded from both sides. Single owner: adherenceWeek().
STRIP WINDOW (audit LOW-6): the strip always summarizes the DISPLAYED
week (the grid it sits above — first column per WEEK STARTS ON; glance =
the week you see); the
weekly verdict / merged check-in uses the configured review-day window
(S15-003) and the strip labels those dates explicitly — glance and
verdict never silently mixed.
R12 MORNING BRIEFING CARD (LOCKED): dashboard daily card — today's slots
in order (per chosen routine + overrides), done-vs-missing markers,
NU12 macro-gap bar, one-tap log/pack; quiet reminders point here; the
single daily surface. BACKFILL SEMANTICS (audit LOW-18): a meal
backfilled to an earlier date (NU4) marks its slot done in THAT date's
routine view, never today's; the macro-gap bar always sums the day's
target vs the day's full receipt via deriveMacros(dateKey) — display may
lag, numbers never disagree.

## Daily routine — audit round 2 (scrutiny fixes, LOCKED)

A1 PERFORMED-DAY MODEL (LOCKED, closes the structural gap): the schedule
needs HISTORY, not just a plan. Added: routine_days (dateKey,
routineUsedId?, templateUsedId — SNAPSHOT copy of the applied template,
frozen) + routine_slot_logs (dayId, templateSlotId (copied), timeActual,
status: planned | done | skipped | packed | eaten). This is the home of
"past days stay frozen" (R5), done-vs-missing (R12), weigh-in missing flag
(R10), pack produced/eaten (R4), and the week recap (R11). Reserved
slot/schedules only describe the plan; routine_days is the record of what
actually happened. Packed-food data stays as nutrition_logs rows
(source='packed', consumed at EAT time per NU4 — never double entered);
routine_slot_logs reference them, not duplicate.
A2 PROMPT RULES (LOCKED, closes R7 hole): NO weekly prompt on unbroken
indefinite runs — no interruption when nothing changed. The app asks only:
first-ever setup / a period ends (falls to default) / user opens override /
explicit want-change. When nothing to change → silent continue.
A3 PACK→MEAL LINKAGE (LOCKED, resolves ambiguity): the pack→meal link is
established at TEMPLATE level (design-time: "this pack's Home = the 12:30
meal slot"). But the pack's CONTENTS per date are day-instance data (what
you actually packed Monday vs Tuesday differs). Template = the pointing;
instance = the payload.
A4 MIDNIGHT RULE (LOCKED): routine-day = calendar day boundary for the
day label; ALL data timestamps (meals etc.) remain per NU4 actual eat
date. If a 00:30 snack logs to Tue under NU4 but the routine shows
under Mon's slots — that mismatch is ACCEPTED and documented (display
side, not logic).
A5 R1 KIND LIST (LOCKED, cross-edit): R1 kinds now = meal | pack | workout
| activity | rest | sleep | weigh-in (R10).
A6 R2 BINDING (LOCKED, cross-edit): "switchable per day-of-week" removed as
a separate mechanism — BINDING MODEL = ONE (R7 weekly routine + R8
per-day override); there is no independent per-day toggle.
A7 SINGLE WEEK OWNER — GYM LIVES INSIDE THE ROUTINE (LOCKED, closes hole
#2, user-confirmed): the weekly routine is the ONE weekly planner.
Standalone fitness week_plans scheduling is RETIRED — workouts are a
slot kind inside day templates (R2 workout-kind slot, 17:00 Gym →
links a workout template). Fitness HISTORY (sessions, PRs, volume,
vault) untouched and separate — scheduling changed, history not.
No second calendar, no precedence law, one door to edit a workout.
WORKOUT SLOT → SESSION PRE-LOAD (LOCKED, user request): when a day
arrives, the briefing card's Gym slot TAP opens the SESSION SCREEN
pre-loaded with that day's linked workout template (exercises, target
sets/reps in order, last-time hints (item 23), PO suggestions (36)
ready) — "set a time for gym in my daily system → the session straight
loads up what's for that day". Logging = confirm/adjust/execute.
Schema consequence (additive, aligns O1): week_plans/week_plan_slots
RE-PURPOSED as the routine-week binder — each slot references a DAY
template (dayTemplateId) instead of a workout template; workout
templates keep their own tables (O1) and are reached via day-template
workout-kind slots. No table fork; one binder.
SESSION→SLOT LINK (audit 2.2): workouts gains nullable routineSlotLogId?,
set at save time from the slot that preloaded it (the briefing-card Gym
tap knows its slot id). Fallback for paths WITHOUT a slot — freeform
sessions, paste, "Track this exercise" — stays routineSlotLogId = null
and the slot stays "planned" (NOT auto-done); the user marks a slot
done / done-differently (item 30) explicitly in the day view. No
template+day fuzzy matching, ever.

## UI hierarchy principle (user-led audit, points one-by-one)

H1 DAILY LOG = ONE TAP (ACCEPTED, no new work): opening the app lands on
the dashboard with the briefing card (R12) already listing today's slots;
log/pack/session actions are one tap from there (session pre-load A7,
one-tap/log meal NU3). Fidelity over friction — the daily path should
never require a menu. No feature: layout default only.

DASHBOARD BLOCK ORDER (clash #1 — RESOLVED, user picked Option C): the
MVP fixed order (UIUX.md, six blocks, bottom-up: habits → journal
quick → coach note → goal progress → tasks → streak) stays, EXCEPT the
briefing card (R12) is NOT a separate top block. It FUSES with the
habit tick and journal quick-capture into ONE "Today" section at the
top: briefing day-plan → habit ticks → journal capture inside that one
section. Below, everything else keeps its old order verbatim. Adaptation
note: UIUX.md's block list needs this "Today = briefing + habits +
capture" merge during the docs pass. No new schema; pure layout.

H2 ONE WEEKLY SURFACE (user ACCEPTED — Option A, consolidation): the
weekly fitness check-in (item 34) is THE single Sunday surface. Week
recap (R11) + nutrition check-up (add-on) are NOT separate top-level
screens — they become COMPACT SECTIONS inside the check-in ("gym 5/5 ·
packs 5/5 · weigh-ins 6/7 / protein on-target 6/7"), with tap-through to
their own detail (per-day macros, per-day slot status). Rationale: three
overlapping weekly surfaces compute slightly-different answers and erode
trust + triple the build cost; one canonical verdict per cadence. Kills
the "which one do I open" tax at the Sunday habit.

H3 ONE-OWNER DERIVED MATH (user ACCEPTED — build discipline): every
derived stat has exactly ONE owner function (stored in the analytics
library: strengthSnapshot, deriveMacros, totalVolume, adherenceWeek,
weekly averages, etc.); ALL views (dashboard, drill-down, session summary,
weekly check-in, phase report, projections) CALL that function — never
re-implement the calculation. Change a formula = change one place; screens
can't disagree (protects H2 trust). New aggregate → write it once in the
engine first, then consume it. No schema / UX change; pure build rule.

H4 REVEAL-ON-FIRST-DATA (user ACCEPTED): an area does NOT render in the UI
until it has data or the user explicitly first-touches it (create a
deload → deload surfaces from then on). Areas with no history (injury,
body measurements, physique, deloads, …) stay concealed day-to-day →
dashboard and navigation stay lean/finished, no empty "feature rooms",
no dead cards. NOT hiding functionality — the full surface is built,
always reachable once it exists or via the searchable create action
(first touch = escape hatch so features you haven't used are still
discoverable). Build rule for every new area.

A4 WEEKLY REVIEW MERGED INTO ONE SUNDAY SURFACE (user APPROVED — audit
fix): the Coach system already plans a global "weekly review"
(coach_outputs weekly, per CoachSystem.md M2) SEPARATE from the fitness/
nutrition Sunday check-in (34/H2). Two weekly summaries = the exact
double-surface trust problem H2 kills, at the whole-app level. RULE: the
fitness check-in IS the weekly review — one weekly review surface (the
day is configurable — Sunday is only the default, S15-003), one pipeline:
top = Coach weekly section (habits, journaling, life notes), bottom =
fitness/nutrition sections (gym, weight, food, PRs, macro gaps). Nothing
is deleted; the Coach's weekly review becomes a section inside the
check-in instead of a competing screen. One scroll, one "how was the
week." Same fix as H2, applied app-wide. No new build — merge only.

A5 PHYSIQUE PHOTO ANCHOR (user APPROVED — audit fix): F5 (monthly
physique cadence) and D031 (physique timeline) need a defined home for
the photo. RULE: physique photos attach to a JOURNAL ENTRY tagged
health + physique (hidden system tag); the D031 timeline queries
media_attachments by that tag. Zero new tables, zero new media paths —
reuses journal+media model, respects D013 MediaRepository only, and the
tag rides backup/restore automatically. F5 nudge → opens a journal
composer prefilled with the tags.

A6 WEEK RECAP = GLANCE + VERDICT (user APPROVED — audit fix): R11
(calendar strip) and H2/A4 (one Sunday surface) were both locked but
read as the recap living in two places. RULE: BOTH exist, one is a
glance, one is the verdict — (1) the R11 strip stays on the week
calendar as a tiny glance (gym 5/5 · packs 5/5 · weigh-ins 6/7) exactly
where the user already looks when planning the week; (2) tapping the
strip opens the single merged weekly review (A4) — the deep read.
Same numbers, two display modes; one leads to the other; no competing
weekly surfaces. Both consume the same H3 owner function, so they can
never disagree.

B1 PR/ANALYTICS RECORD MODE — WEIGHT vs REP-COUNT (user APPROVED — audit
fix): the 1–12 rep guard exists for Epley est-1RM validity, but rep-mode
exercises (bodyweight: pull-ups/push-ups/dips + rep-first accessories)
legitimately pass 12 reps — a literal guard would block real PRs. RULE:
every exercise has a record mode, seeded from its auto progressionStyle
(item 36), no schema change:
  weight-mode (compounds/machines): Epley est-1RM, 1–12 window, PR =
  best est-1RM. Guard unchanged.
  rep-count-mode (bodyweight/rep-first): NO 12-cap; PR = best clean rep
  count; addedLoadKg (O2) breaks ties (more load at same reps wins).
strengthSnapshot() gains a "mode" in its result so vault / ladder /
drill-down (I1) / projections (F1) / PR detection all render the right
metric per exercise. PR events (17/I3) carry the mode-appropriate value.

B2 STRENGTH kcal — MANUAL OVERRIDES BAND (user APPROVED — audit fix):
cardio already has "manual kcalBurned always wins, estimate labeled"
(item 35). Strength sessions now also have kcalBurned? (schema) AND the
NU9 strength burn band (estimate from tonnage/duration). Without a rule,
both could add to daily energy math = double count (bulk targets
inflated). RULE: manual kcalBurned on a strength session REPLACES the
band estimate entirely — no band shown, no double add. Identical to the
cardio rule. NU9 closure (4) "labeled estimate" still applies when no
manual number exists.

B3 FULLY-LOGGED-DAY DEFINITION — NO-ROUTINE PATH (user APPROVED — audit
fix): closure (5) requires "kcal ±20% AND the day's planned meal types" —
but "planned meal types" only exists when a day template is bound.
Holiday / first day / travel / off-template day = the day could NEVER
count toward the streak, silently. RULE (two valid paths, one concept):
  routine-active day → kcal ±10% AND planned meal types logged (strict,
  as locked — ±10% per C2).
  no-routine day → kcal ±10% AND at least 2 actual meal logs (per C2).
Streak works from day one, before any routine setup; holiday logging
still counts honestly.

B4 MANUAL TDEE FREEZES ALL TARGETS (user APPROVED — audit fix): closure
(3) froze the kcal target on manual TDEE, but NU7 protein/fat g/kg still
tracked rolling weight — "kcal frozen but protein creeping" reads as
broken. RULE: a manual TDEE override also FREEZES the protein/fat g/kg
basis at the override moment (snapshot of rolling bodyweight). Clearing
the override unfreezes everything (kcal + protein track again). Manual
protein entry always overrides per-phase defaults regardless. Predictable
"froze the numbers = everything frozen" behavior.

## COACH SYSTEM — CONSOLIDATED FUNCTIONALITY MAP (all references reconciled)

Master reference for every Coach capability locked across the ledger,
docs/CoachSystem.md, docs/Vision.md, DecisionLog (D004/D017), UIUX.md,
and the achievement spec (E12). Nothing here supersedes an original lock;
it is the index. The full rule CATALOG itself is still a separate,
deferred session (see §9).

### 0. Philosophy (Vision.md + CoachSystem.md opening)
The Coach is what makes PersonalOS feel like a coach instead of a
tracker: it analyzes context, does NOT blindly punish, and adjusts
strictness to the situation. Never punish-first; the rule-based pipeline
IS the product (D004 — AI always optional, never required, app must
function fully without paid APIs).

### 1. Architecture & pipeline
- Four layers (CoachSystem.md): Analytics Engine (pure aggregations) →
  Rule Engine (condition→action, strictness-aware) → Reflection Generator
  (templates + interpolation) → Optional AI Adapter (LLM; OFF by default,
  never required, never degrades the app). Dart pure functions; no new
  subsystem for pace math (ledger:20-23).
- MVP stub (M0, D017): ONE rule — habit missed 3 consecutive days →
  gentle reflection prompt (coach_outputs row + dashboard quiet line);
  evaluated on dashboard load; exists only to validate the
  event→rule→output→dashboard loop and prove the engine is swappable.
- Inputs (CoachSystem.md "Data the Coach May Use"): event log (primary),
  analytics aggregates (primary), journal METADATA (tags, word counts,
  area — facts only), settings (strictness/timezone — presentation
  only). NEVER: media blobs, passwords, anything outside documented
  inputs, journal text without opt-in.

### 2. Event-log discipline
- The event log IS the single behavior history the Coach depends on
  (Database.md:72); app-wide rule: every meaningful action writes one
  behavior event, transactionally (D001/D019).
- Coach + Gamification read ONLY the event log (workout.pr,
  journal.created, nutrition.logged, body.weighed, habit.completed,
  achievement.unlocked, level.reached …) — never entities, never
  per-domain bespoke reads; compensating revoke events keep totals
  honest (ledger:300, 469, 502, 525-544). Engine budget ~10k events/yr —
  Coach reads are cheap scans (ledger:547).
- workout.pr is Coach/toast ONLY (never the source of vault truth —
  ledger:379-380, 128-133). One H3 owner function per stat; Coach lines,
  trophies, and dashboard read the SAME owner output — a trophy and its
  Coach line are literally the same number (ledger:841-845).

### 3. Named rules (locked so far; catalog grows in the rule-book session)
- stallRule(phase) — ONE shared vocabulary (trophy + Coach + phase
  report): 4 consecutive weekly deltas outside direction = stall;
  recovery = next 2 inside; Coach never scolds during a stall, trophy
  celebrates recovery only; thin week (<5/7 logged) = "no data", never
  a stall (ledger:1022-1033; spec:632).
- Plan-adherence (item 30): per-slot adherence %; single reasonable
  miss vs pattern ("skipped chest 3 of 4 weeks"); deload weeks exempt
  (ledger:358-363).
- Volume balance (item 31): weekly under-floor + imbalance checks
  (chest 18 vs back 3); phase-adjusted floors; advisory only — never
  XP/penalty (ledger:364-368).
- Rest-day pattern detection (F2): ≥3 rest days trained in trailing 4
  weeks or 3-in-a-row → pattern alert + suggest moving volume to a
  training day or a deload (ledger:182-187).
- Reasonable failure / limited-not-lazy (N1): injury/limited flags →
  swap suggestions, adherence patterns, "limited 3× this year" history
  line, instant heal-restore, no medical claims (ledger:435-439).
- Post-deload/return ramp (N2): 90% → 95% → 100% ramp, PR framing
  quiet during ramp, half-strength volume floors first return week,
  reuses O4 staleness tiers (ledger:440-445).
- Deload suggestion after sustained low adherence (item 32, ledger:374).
- Journal drought: no entries in 7 days → nudge; EVERY drought poke
  routes through the Coach rule pipeline so quiet weeks silence all of
  them (ledger:1990-1991; CoachSystem.md).
- Pace/bulk lines: bulk-side caution "gaining too fast = fat", cut-side
  slow-loss-is-muscle, calm water-jump line during "Adjusting" weeks
  (ledger:55-58, 606-608).
- Missed-habit warnings live in the Coach reflection, NEVER in the
  calendar tint (ledger:1739-1741).
- Deferred (revisit anytime): recovery-readiness branches (N5 —
  morning recovery_log → PO/Coach branches + M2 correlation + deload
  trigger, ledger:454-455).

### 4. Outputs & surfaces (all stored as coach_outputs rows — auto-written,
deletable like any Coach line, history reviewable/exportable)
- Daily dashboard note (1-3 sentences) + quiet day-view Coach line
  ("three days without journal — what's in the way?") (ledger:1763-1764;
  UIUX.md) + Coach notes in calendar day view (default on, ledger:1794).
- Nudges (rule-triggered): habit-miss, drought, meal catch-up
  (on-app-open only — never push), macro-gap bar nudge; all quiet,
  non-naggy, no push notifications (ledger:648-666).
- Weekly review (A4) = ONE Sunday surface: Coach weekly section
  (habits, journaling, life notes) on top, fitness/nutrition check-in
  below (ledger:2243-2253); weekly nutrition check-up mirrors it via
  coach_outputs — kcal vs target %, protein hit-rate, weekly compliance,
  one Coach line per strictness (ledger:646-648); R11 strip = glance,
  A4 = verdict (ledger:2264-2273).
- Phase close report (N9): trend, pace verdict, sessions, adherence,
  volume, PRs, achievements, goal pace + ONE Coach line; optional
  coach_outputs snapshot (ledger:484-490).
- Milestone review: "since you started" long-form, FACTS ONLY — entry
  dates/word count/tags, never text; cadence ladder +1m/3m/6m/1y then
  yearly, smart catch-up on late open; milestone card ONLY at goal end
  (won or expired), never mid-run (ledger:875-880, 1881-1897).
- Achievement recognition lines (see §5). Phase-transition line shares
  the ONE phase-adjacency helper (ledger:1043).

### 5. Achievement tie-in (M2, locked)
- One-direction: Coach REACTS to achievement.unlocked / level.reached;
  it NEVER creates trophies and NEVER grants XP (ledger:813-824).
- Loudness taxonomy: ONLY Ring + Grove get Coach appreciation — one
  sincere derived line, never hype; ALL other tiers (Sprout / Root /
  Recognition / Heartwood) = silent in-game toast, NO Coach speech.
- One Coach line AT MOST per trophy fire (spec E12); celebrations fire
  once per run/landing, never repeat congrats (ledger:1328, 1364);
  Coach's ONE line only when Ouroboros lands or its run ends (1075).
- Coach never judges XP/points; trophies grant ZERO XP (ledger:914-916).
- Elite strength tier is a Coach-observable display ceiling only, ZERO
  trophies read it — do not "fix" (ledger:1465-1470; v2:405).

### 6. Context switches (when Coach quiets itself)
- J4 Quiet Week (Settings → Coach): user-marked range pauses nudges
  (habit-miss, drought, streak warnings). ONLY the user starts it;
  history stays true, streaks stay real (quiet ≠ shield); affects
  nudge/Coach rules only, never metrics; grace (finite, configurable)
  is the streak shield — two shields never merge (ledger:1976-1992).
- Vacation/period quiets adherence like a deload — "vacation, not
  laziness" (ledger:1873-1874). Deload ranges: adherence quiet, volume
  balance exempt, chart shaded (ledger:369-372).
- Planned-rest parsing: real-rest vs quiet-miss vs grace — rest only
  prevents resets, never earns anything (ledger:955-962).

### 7. Privacy & the never-list
- Facts-only by default: Coach speaks stats, never quotes journal text
  (ledger:820-822); every Coach/journal-reading feature gets a stamp in
  the docs pass — "facts only" OR "needs text access → user opt-in
  first"; mood/topics stay gated behind the M2+ text-analysis opt-in
  (ledger:1679-1687). Coach never inspects media/video content
  (ledger:2030). Coach gets NO journal text (ledger:1952).
- NEVER: XP (grants or judgments), punishment, "you failed" framing,
  human-judgment voice (facts + plain reflection only), push
  notifications, auto-detected quiet weeks, scolding during stalls,
  rewards for reading/opening, Coach lines in Year Book export (J5 —
  pure artifact, ledger:1998).

### 8. Settings (Group 2 — Coach)
- coachStrictness (supportive | balanced | strict; default balanced) —
  scales thresholds + tone templates, never the rule set (CoachSystem.md
  :102-107). Milestone-review cadence editable (enable/disable or flat
  interval, ledger:1894-1896). Quiet-week range (ledger:1977).
- NOT offered as toggles: XP/achievement values (M2 open items),
  formulas, dayActivityScore weights (ledger:1834-1840).

### 9. Scheduling & the rule-book session
- M2: full Coach (rules + strictness + reflections). Rule-book catalog =
  a DEDICATED session after all features are planned and BEFORE the
  UI/UX ordering pass (Coach surfaces affect layout — ledger:864-868).
  Carry-over locks the session must honor: facts-only speech, loudness
  tiers (§5), J4 quiet-week respect, no-shame language,
  reviews-give-no-XP, auto-written + deletable outputs, on-open delivery
  never push, no-human-judgment voice (ledger:869-874). The session also
  fixes the voice rule wording.

## Remaining open items

- [x] RPE column — REJECTED (user, lookups #1): no RIR/reps-in-reserve
      tap. est-1RM/PR/PO math works on weight × reps alone (items
      16/22/36); REMOVE rpe? from exercise_sets schema (schema block).
- [x] Exercise seed list (user, lookups #3, APPROVED as proposed): pre-loaded
      ~44 common lifts so the picker isn't blank day-1; editable/addable/
      deletable like areas; entries carry category + muscle roles + auto
      progression style + tracked flags (big-5 = the profile lifts: Bench,
      Squat, Deadlift, OHP, BB Row — tracked on by default). Works WITH
      auto-assort paste (item 20) — paste fuzzy matches against seed names.
      List: Push: Bench Press, Incline Bench, OHP, DB OH Press, Dips,
      Push-ups, Lateral Raise, Chest Fly, Pec Deck, Triceps Pushdown, Overhead
      Triceps Ext. Legs: Squat, Leg Press, Hack Squat, Bulgarian Split Squat,
      Walking Lunges, Leg Extension, Hamstring Curl, RDL, Calf Raise
      (standing + seated). Pull: Deadlift, Barbell Row, Lat Pulldown, Seated
      Row, Face Pulls, Pull-ups, Chin-ups, Barbell Curl, DB Curl, Rear-delt
      Flye, Shrugs. Core: Crunch, Cable Crunch, Plank, Hanging Leg Raise,
      Russian Twist, Side Plank. Cardio: Treadmill Walk, Treadmill Run,
      Cycling, Rowing, Swim, Stairs. (~44 total; list final — any later edit
      trivial).
- [x] Exercise categories (push/pull/legs/cardio…) in lookup (user,
      lookups #2): YES — seeded column; drives auto progression-style
      assignment (item 36) + Coach push/pull/legs volume-balance queries
      (item 31). Categories: push | pull | legs | core | cardio.
- [x] NUTRITION (fully locked: NU1–NU12 + add-ons + audit closures):
      entry model, meal types, recipes, backdating, scanner/weigh-in
      seams, macro derivation, protein g/kg, first-of-day weigh-in,
      TDEE/sign/backfill closures, macro-gap bar. Routine session done
      separately (R1–R12 + A1–A7). Macro logging UX details out of
      scope of planning.
- [x] LIFE TREE (IDEA RECORDED — user vision, NOT a locked spec; full
      implementation & all functionality to be designed and built
      during the Life Tree section build, M2): a dedicated full tab
      with a huge stylized life-tree graphic that ACTIVELY GROWS over
      time as everything is logged and achieved across all areas —
      the biggest UI-heavy feature, essentially a big review surface of
      the user's logged life. It incorporates the Growth-Rings / 10-ring
      structure (trunk rings, Pith → Yew, per v2 locked definition:
      one ring = one Life, Fully Logged qualifying yearly window) into
      a cool UI system. The tree reflects ALL domains and the
      achievements/tiers earned (Sprout → Grove, ring series).
      CONFIRMED PREMISES ONLY (carried from already-locked project
      rules, nothing new invented here): (1) 100% derived from real
      qualified non-imported history — Analytics-Engine-derived cache
      (M2, per the open-item text above), never a write-path entity,
      no new tables; imports never grow it; nothing user-editable; no
      XP anywhere. (2) Rings never shrink — a missed year leaves the
      ring count untouched (v2 ring rules). (3) No guilt UI — a thin
      domain looks young/dormant, never "failed". (4) His own nav tab;
      exact placement/wireframe/paint strategy/art style/interaction
      details (taps, detail sheets, render cost, theme) = ALL decided
      during the Life Tree section build in M2, mockup in the UI/UX
      pass. Scope: M2 — blocks nothing in M0/M1.

## Future ideas raised, not yet scoped

- Muscle map / body-light-up graphics for workouts — REJECTED by user (felt
  "not that great"; decorative overload even in high-merit spots; topology
  comes from existing muscle hierarchy anyway). Do not resurrect without a
  new strong use case.
- Rest/recovery tracking (sleep, rest days, readiness) — could correlate
  PRs/performance; synergizes with deload markers and cardio
- Body measurements beyond weight (waist/chest/arms) — complements
  physique-photo timeline (D031)
- Macro targets per phase (protein target for bulk/cut) — nutrition session
- PERIODIZATION (parked, design note): programs = ordered sequence of
  weekly plans with loading phases (W1 normal → W2 added sets → W3 heavy
  low-rep → W4 deload); new programs table + block-scheduling layer; every
  analytics view gains a block dimension; biggest item by far — revisit
  when the user is 12+ months of consistent training in. Light alternative
  noted: week-level intensity labels (deload/heavy/medium) without a full
  block layer.
