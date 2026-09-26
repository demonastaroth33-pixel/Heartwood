# PersonalOS — Database

Data model, event log, migrations, and the backup/restore format. The storage
backend itself (Drift vs IndexedDB) is decided in `StorageDecision.md`; this
document describes the logical schema that both candidates must implement.

## Logical Schema

### Entities

| Table | Fields (key) | Notes |
|---|---|---|
| `journal_entries` | id, title?, body, area?, tags (JSON), createdAt, updatedAt, deletedAt?, imported, importHash | multiple per day allowed; `imported` + immutable `importHash` set at batch import (dedupe on original date + content hash); imported entries land on their ORIGINAL date, never earn XP. The `imported` flag is global on every importable entity (workouts, nutrition_logs, body_metrics, habit_checkins) — Gamification.md Anti-Farming #7; journal entries additionally carry the dedupe `importHash`. |
| `media_attachments` | id, entryId, fileName, mimeType, sizeBytes, durationSec?, title?, capturedAt, syncState, storageRef, thumbnailRef, contentHash?, archivedOnDevice?, adopted, adoptedAt? | syncState: local-only / metadata-synced / fully-synced / archived-to-pc (see below); thumbnailRef: separate always-local thumb copy; contentHash: dedup key (see `MediaStorage.md`); archivedOnDevice: deviceId of the PC that archived the blob, null = not PC-archived; durationSec/title/adopted: see field notes below; adoptedAt? (D113 IA-4): stored adoption timestamp — adopted media counts for media presence FORWARD-ONLY from adoption, never before it |
| `habits` | id, name, area?, cadence (daily default), createdAt, active, autoSource? | autoSource (workout / future weigh-in): auto-tracked habits — draft-schema flag (L062) |
| `habit_checkins` | id, habitId, dayKey, completedAt, note?, autoCreated? | one per habit per day; autoCreated? = written by the session-save habit bridge in the same transaction; manual check-ins win |
| `goals` | id, title, area?, targetDate?, createdAt, kind (generic\|weight\|strength), exerciseId?, targetValue?, parsedFrom?, parseOutput? (M1) | additive nullable kind cols ship from the FIRST M1 goals build (no forced migration on old data later); weight goal target = bodyweight, strength goal = tracked exercise + target est-1RM; progress computed-only via one H3 owner per kind; parse-output fields (L-01 → D139) — the offline rule-based NL parser's extracted dates + units + cadences; the structured form stays for precision, the parser pre-fills it |
| `milestones` | id, goalId, title, targetDate?, completedAt? (M1) | |
| `tasks` | id, title, dueDate?, completedAt?, area?, parsedFrom?, parseOutput? (M1) | parse-output fields (L-01 → D139) — same offline rule-based parser contract as goals |
| `areas` | id, slug, label, userDefined | seed from code; user-extendable |
| `settings` | key, value | timezone, displayName, coachStrictness, storage warnings seen, etc.; schema-relevant keys listed below — settings, never profile fields (D003) |
| `coach_outputs` | id, kind, dateKey, payload | 9-kind dictionary (see below): daily_note / nudge / briefing / check_in_weekly / nutrition_checkup / milestone_review_goal / milestone_review_anniversary / phase_close / pattern_alert |
| `media_manifest` | id, mediaId, sha256?, exportedIn | aids export verification |
| `viewed_moments` | id, momentKey, viewedAt | synced user-state table (D109 C-1): which transitions/replays the user has seen; account-once + per-device delivery; user state (like settings), never a regenerable cache; rides the backup enumeration + the M11 sync plane |
| `tree_cache` | id (singleton), state (SCHEMA 2.6 lean model — D107), meta (schemaVersion, registerVersion, logFingerprint, derivedAt, anchor), updatedAt | engine-written derived cache (D107/D108) — never a user write-path entity; regenerable — deliberately NOT in the backup enumeration (D098) |

| **Health area — fitness / nutrition / body (entity+event pattern, D041)** | | |
| `workouts` | id, dateKey, occurredAt, area (health), phaseId?, templateId?, kind (strength\|cardio), durationSec?, distanceKm?, avgEffort?, kcalBurned?, routineSlotLogId?, notes? | performed session = frozen copy of a template's exercise rows (append-only history); multiple sessions per day allowed (two-a-day); weights store kg everywhere (display-convert only) |
| `exercise_sets` | id, workoutId, exerciseId, setIndex, weightKg?, reps?, addedLoadKg?, setType? (warmup\|working\|failure) | every set logged; bodyweight/rep-mode exercises record best clean rep count (addedLoadKg breaks ties); no RPE column (rejected — L265); setType (F-05 → D133) — ONE nullable enum column, explicit values at save, default `'working'`, no separate flags; volume/PR/est-1RM/adherence math reads WORKING sets only (W excluded) |
| `exercises` | id, name, category (push\|pull\|legs\|core\|cardio), userDefined, active, tracked, progressionStyle? | seeded ~44 from code (list below), user-extendable like `areas`; big-5 profile lifts tracked ON by default (Bench Press, Squat, Deadlift, OHP, Barbell Row) |
| `exercise_muscle_groups` | exerciseId, muscleGroupId, role (primary\|secondary) | muscle tags set once per exercise; sets auto-inherit, never re-logged |
| `muscle_groups` | id, name, parentId?, userDefined | 2-level seeded hierarchy (legs/push/pull/core → children), user-extendable |
| `body_metrics` | id, dayKey, occurredAt, type (weight\|measurement_*), valueKg | canonical daily trend = FIRST weigh-in of the day; later same-day rows stored but excluded from derived series (see below) |
| `phases` | id, type (bulk\|cut\|maintain), startDate, endDate?, targetWeeklyRateMin?, targetWeeklyRateMax?, notes? | ONE active phase; baseline weight anchored at start (O3 rolling average); rate↔macros feedback shape deferred to the nutrition session (see below) |
| `workout_templates` | id, name, createdAt | first-class table; written by the template designer + paste parser |
| `workout_template_exercises` | id, templateId, exerciseId, order, targetSets, targetReps, pairWith? | pairWith? = superset pairing metadata on templates only; sessions never store pairing |
| `nutrition_logs` | id, dateKey, occurredAt, mealTypeId?, recipeId?, name?, kcal, protein, carbs, fat, portionMultiplier, source, substitutedForRecipeId? | per-meal receipt lines; day total = SUM of rows, never a stored day row; dateKey = ACTUAL eat date (NU4 backdating exception to I7); substitutedForRecipeId? (N-10 → D136) = one-time recipe substitution — lives on the RECEIPT LINE (copy-in preserved, no fork), never on the recipe or the plan |
| `meal_types` | id, name, userDefined | seeded (breakfast/lunch/dinner/snack), user-extendable + editable; cosmetic grouping only |
| `nutrition_recipe` | id, name, kcal, protein, carbs, fat, mealTypeId?, servingNotes?, gramReferenceG? | copy-in at save — editing a recipe never rewrites past rows; gramReferenceG? (N-11 → D137) — the recipe's gram reference, the portion multiplier's anchor |
| `nutrition_food_cache` | (regenerable lookup cache) | ONE regenerable table — deliberately NOT in the backup enumeration; lookups derived from nutrition_logs history |
| `trivial_foods` | id, name, kcal, protein, carbs, fat, userDefined | calorie-trivial foods list (N-06 → D135): each entry carries its REAL macros — never fudged to zero; small curated seed (~20–30) + user-extendable; skipped by DEFAULT with a log-it-anyway path; daily totals footnote "N trivial items not logged" |
| `batches` | id, name, recipeId?, servings, createdAt | prepped batch — recipe × N servings, or free-form (N-05 → D134); the locked `packed` source producer's first-class flow |
| `batch_containers` | id, batchId?, name, createdAt | per-container rows (N-05 → D134): partial-consume semantics; recipe-linked AND free-form container kinds |
| `batch_container_line_items` | id, containerId, recipeId?, foodName?, kcal, protein, carbs, fat, portionMultiplier, source (packed\|fooddb\|recipe) | per-container line items (N-05 → D134): each part its own portion multiplier; per-part honest sources; consumed portions become `nutrition_logs` rows (source='packed') at eat time |
| `deload_markers` | id, startDate, endDate (ANY range), reason?, journalEntryId?, notes? | deload ranges: days in range are adherence-quiet, volume-balance exempt, strength chart shaded (CoachSystem.md §Context switches); journalEntryId? FK → journal_entries; separate table, NOT a phases type (D051); F-11 (→ D200) PO freshness decay reads it as a MARKED-absence system — marked/planned absence decays differently (or not at all) vs true unplanned absence |
| `periods` | id, type (vacation\|term\|holiday\|…), title, startDate, endDate, notes?, extraEntityIds? | invisible metadata records — content derived by INCLUSIVE date range [start, end], never copied/owned; extraEntityIds? = the ONE deliberate exception (an item dragged into a period outside its range); user rows survive restore (backup enumeration); vacation-day union drives streak rules (Gamification.md); D075; F-11 (→ D200) PO freshness decay reads it as a PLANNED-absence system (vacation/term/holiday = planned, decays differently or not at all) |
| `limitations` | id, exerciseId?, muscleGroupId?, startDate, endDate?, note? | injury/limitation records — target is an exercise OR a muscle group; feeds "limited-not-lazy" Coach rule + PO suggestions (CoachSystem.md §Named rules); D051 |
| `day_templates` | id, name, createdAt, updatedAt | named reusable full-day plans; edits/deletes affect FUTURE bindings only |
| `day_template_slots` | id, templateId, time, kind (meal\|pack\|workout\|activity\|rest\|sleep\|weigh-in), title, link?, notes? | link = recipeId for meal slots, workoutTemplateId for workout-kind slots |
| `week_plans` | id, name, ... | routine-week binder: a named 7-slot binding list + per-day override (ONE binding model); standalone fitness week_plans scheduling RETIRED (A7) |
| `week_plan_slots` | id, planId, dayOfWeek (0–6), dayTemplateId?, pattern? | slots reference DAY templates — `dayTemplateId`, NOT workoutTemplateId; null = rest; pattern? (L-13 → D140) — the day-PATTERN binding ("which days" as a first-class field: weekday/weekend variants, specific days, weekly cadence); the plain `dayOfWeek` daily case is the existing single-day binding, additive |
| `routine_days` | id, dateKey, templateUsedId, routineUsedId? | SNAPSHOT copy of the applied template, frozen |
| `routine_slot_logs` | id, dayId, templateSlotId, timeActual, status (planned\|done\|skipped\|packed\|eaten) | pack contents stay nutrition_logs rows (source='packed') consumed at eat time; slot logs reference, never duplicate |

Future, NOT M0: a `links` table (sourceType, sourceId, targetType, targetId,
linkType, id, createdAt; one row per directed edge, rendered as undirected in
the view) for the graph/"brain" view — DecisionLog D023, Roadmap.md (Graph
section, under consideration — not scheduled). Not part of the M0 schema; not
built.

### `exercises` — seeded lookup

Seeded from code (~44 exercises), user-extendable like `areas` (add/edit/delete);
user rows survive restore (O6). Each exercise carries a `category`
(`push | pull | legs | core | cardio`) that drives auto progression-style
assignment and Coach volume-balance queries, plus a `tracked` flag — the big-5
profile lifts (Bench Press, Squat, Deadlift, OHP, Barbell Row) are tracked ON by
default. Seed list (verbatim — L266):

| Category | Exercises |
|---|---|
| Push | Bench Press, Incline Bench, OHP, DB OH Press, Dips, Push-ups, Lateral Raise, Chest Fly, Pec Deck, Triceps Pushdown, Overhead Triceps Ext. |
| Legs | Squat, Leg Press, Hack Squat, Bulgarian Split Squat, Walking Lunges, Leg Extension, Hamstring Curl, RDL, Calf Raise (standing + seated). |
| Pull | Deadlift, Barbell Row, Lat Pulldown, Seated Row, Face Pulls, Pull-ups, Chin-ups, Barbell Curl, DB Curl, Rear-delt Flye, Shrugs. |
| Core | Crunch, Cable Crunch, Plank, Hanging Leg Raise, Russian Twist, Side Plank. |
| Cardio | Treadmill Walk, Treadmill Run, Cycling, Rowing, Swim, Stairs. |

(~44 total; list final — any later edit is trivial.) Muscle tags are assigned ONCE
per exercise in `exercise_muscle_groups` (primary/secondary roles); sets
auto-inherit and are never re-logged per set. The 2-level `muscle_groups`
hierarchy (legs/push/pull/core → children) is seeded + user-extendable; analytics
query both levels off the same tags.

### `workouts` — template/session layering (C1.3)

Workouts use the two-layer model: `workout_templates` + `workout_template_exercises`
are first-class tables (id, name/createdAt; templateId, exerciseId, order,
targetSets, targetReps, pairWith?); a performed session copies the source
template's rows into `exercise_sets` at save time — frozen, append-only history.
Editing a template affects future sessions only; past sessions never change.
"Apply session deviation to template" folds structure only, never weights (L041).

- **Two-a-day allowed:** multiple sessions per day are their own `workouts` rows
  (dateKey supports it). A plan slot counts DONE if ANY session references it; a
  freeform session (no slot) is "done differently", not missed (L045).
- **Unit policy (O8):** weights are STORED in kg everywhere (weightKg, addedLoadKg,
  body targets); display converts only via a settings units key (kg|lb / cm|in).
  Engines always compute in kg; no mixed paths, no stored rounding.
- **Cardio columns (additive, C1.5):** `kind` strength|cardio, `durationSec?`,
  `distanceKm?`, `avgEffort?`, `kcalBurned?`. Manual kcalBurned is always
  available, feeds the energy math directly, and REPLACES the estimate band
  entirely when present (L118). Without a manual number, cardio calories use the
  MET estimate — `MET × 3.5 × bodyweightKg × minutes / 200` (×3.5 mandatory;
  public tables) — auto-suggested during cut/weight-goal and always labeled
  estimate (L033).
- **`routineSlotLogId?`** — set at save time from the routine slot that preloaded
  the session; freeform paths keep it null and the slot stays "planned" until the
  user marks it (L116).
- **Set labels — `setType` (F-05 → D133):** `exercise_sets` carries ONE nullable
  enum column `setType` (warmup|working|failure) — explicit values written at
  save, default `'working'`, no separate flags. F = TARGET COMPLETION, not effort
  (a set to target reps = D even grinded; short of target = F — objective,
  template-relative). D and F count identically everywhere; only prescription
  completion differs (D-vs-F rationale preserved). Volume bands (F-08), tonnage,
  est-1RM, PR, and plan-adherence math read WORKING sets only — W excluded; a
  warm-up-only session is a logged session, not a trained session (it never
  satisfies qualifyingEntry(GYM), which requires "≥1 real WORKING set" — F-05
  adherence exclusion). F counts as volume; tonnage = real weight × real reps
  achieved; F can still fire a PR; progression: F = HOLD weight next time, never
  punish, never auto-deload (deloads from locked stall rules only — F-12).
- **PO suggestion freshness decay — the F-11 reads (L018 → D200):** the decay
  that lowers the suggested starting load after time off (days-since-e1RM
  multiplier; completes the locked N2 return ramp) reads EXISTING schema —
  no new columns, no stored decay factors. The reads:
  - **Last-session markers** — the decay computes days since the last session
    from `workouts.dateKey`/`occurredAt` + `exercise_sets` (the e1RM's source
    set), derived at read time; never stored, never cached on the session row.
  - **`deload_markers`** — a MARKED/planned deload range: days in range decay
    differently (or not at all) vs true unplanned absence; `reason?` may carry
    the deload kind the decay treats as planned.
  - **`periods`** — a PLANNED absence (vacation/term/holiday): days inside a
    period's inclusive range decay differently (or not at all), same rule as
    marked deloads; planned-rest + quiet week (J4) ride the same range reads.
  - **Settings knob** — decay steepness = `inactivityDecaySteepness` (settings
    key, default ~10–20% per week off; see Settings keys below).
  - **Sensitive-numbers warn** — 3+ weeks off shows a warning + explanation
    before any suggested load (Coach-side copy; the schema just supplies the
    days-since read).
  - **History/vault/PRs NEVER change** — the decay moves ONLY the suggested
    starting load; `exercise_sets` history is untouched, derived-only.
  - **Constant reconciliation (docs-pass D190/D200):** the >4wk freshness tier
    governs HINT DISPLAY (collapsed — UIUX.md); F-11's decay governs the
    SUGGESTED STARTING LOAD — three surfaces, no conflict.

### `phases` (C2.1)

- `type` bulk | cut | maintain; `startDate`; `endDate?` (null = ongoing) — planned
  OR open-ended; ONE active phase; closing is explicit (optional "how'd it go").
- Baseline weight anchored at start (O3 rolling average — shared with body_metrics
  trend and goal pace).
- `targetWeeklyRateMin?` / `targetWeeklyRateMax?` optional; default weekly-rate
  presets auto-adjust to macro-goal targets.
- The phase-rate ↔ macros feedback loop shape is DEFERRED — settled in the
  nutrition session (S008); not specified here.

### `body_metrics` — canonical weigh-in rule (C2.4, NU8)

- Multiple weigh-ins per day are allowed and all are stored.
- The canonical daily trend = FIRST weigh-in of the day (morning fasted); later
  same-day entries are stored but EXCLUDED from derived series (O3 rolling
  average, goals pace, phase pace).
- Deleting the first-of-day row PROMOTES the next same-day row; the derived series
  for that day changes retroactively — accepted display-side behavior
  (delete-and-re-derive everywhere).

### Nutrition — receipt-line model (C5.1)

- `nutrition_logs` = per-meal receipt lines with macros from the start. Day total =
  SUM of rows, NEVER a stored day row. Each row carries `dateKey` = ACTUAL eat date
  (NU4 — deliberate backdating exception to the I7 midnight rule), `occurredAt` =
  actual eat time, kcal + protein/carbs/fat, mealTypeId?, recipeId?, name?, a
  `portionMultiplier` (1x/1.5x/2x) resolved ON THE ROW — never extra recipe
  copies — and a `source` column (manual / scanner / fooddb / packed / scale).
- `meal_types` = seeded label presets (breakfast/lunch/dinner/snack),
  user-extendable + editable (rename/add/delete own). Deleting a type never touches
  existing rows. Cosmetic grouping only.
- `nutrition_recipe` = reusable "re-meals" (name, kcal, macros, mealTypeId?,
  servingNotes?); one-tap log fills a FRESH row with a fresh timestamp; editing a
  recipe NEVER rewrites past rows (copy-in at save; recipeId kept for
  traceability).
- Soft duplicate guard (NU4a): when logging a meal, a row with same dateKey +
  mealTypeId + recipeId/food selection triggers a soft non-blocking prompt
  ("Already logged X for this meal — add another?"); user decides, no hard block.
  Shared by the school-end batch and morning-briefing pack consumption.
- Backfill bound (closure 6): same-day / last-24h backfill = normal NU4; OLDER
  dates = distinct "historical backfill" mode that NEVER extends streak/check-up
  compliance.
- Reviewed-no-change record (audit-C3): a 00:30 snack logs under the ACTUAL eat
  date yet shows under the previous day's routine slots — both numbers correct,
  accepted display mismatch, no rework (L128).
- `nutrition_food_cache` = ONE regenerable lookup cache, NOT in the backup
  enumeration; "saved food" is DERIVED from nutrition_logs history (a saved food IS
  a row the user logged), no separate table (L091).
- Status: NU1–NU12 + add-ons + audit closures LOCKED (L268 — status record, no new
  content).
- **Pack model — batch → containers → line items (N-05 → D134):** prepped batches
  are first-class: a `batch` (recipe × N servings, or free-form) → `batch_containers`
  → consume-decrement. MIXED BATCHES use the FULL containers model: the containers
  table carries per-container LINE ITEMS (partial servings, mixed contents,
  multi-recipe meals — each part with its own portion multiplier). CONSUME MATH
  runs per container's own line items (partial-consume semantics, per-part honest
  sources: packed / fooddb / recipe). Both container kinds: recipe-linked AND
  free-form. Consumed portions become `nutrition_logs` rows (source='packed') at
  eat time — slot logs reference, never duplicate. Built full, nothing grows later.
- **Trivial-foods list (N-06 → D135):** a small, user-editable `trivial_foods` list
  for CALORIE-TRIVIAL foods (water, black coffee, tea, plain vegetables, herbs,
  zero-calorie drinks) that skip logging friction. INTEGRITY GUARANTEE: NOTHING is
  actually free — each entry carries its REAL macros (macro counts MUST be
  accurate — never fudged to zero); logged entries count honestly. Default seed
  small curated (~20–30) + user-extendable; skipped by DEFAULT with a log-it-anyway
  path; daily totals footnote "N trivial items not logged"; never hides calories
  (the WW failure mode explicitly avoided).
- **Gram-anchored portions (N-11 → D137):** every food carries a gram reference;
  the portion picker offers unit presets each carrying gram equivalents (1 cup =
  125g, 100g, 1 serving as packaged); `portionMultiplier` scales from the gram
  anchor (1.5× of 125g cup = 187.5g exact). Grams are the canonical entry; presets
  are shortcuts. Seed data brings FNDDS portion weights (N-02).
- **Receipt-line substitution (N-10 → D136):** a one-time recipe substitution fills
  a meal slot by ANY recipe/food as a one-time event — the substitution lives on
  the RECEIPT LINE (`nutrition_logs.substitutedForRecipeId?`), not the recipe
  (copy-in preserved, no fork, no variant) and not the plan (tomorrow's plan
  unchanged). TWO SCOPES: current-meal-only built FIRST (M3); cascade built after
  (substitute for the rest of the week — a deliberate EDIT-PLAN action with
  confirmation, never a silent side effect). ADHERENCE CONDITION: substituted meals
  count as adhered (done-differently) ONLY when the substitute lands within the
  INTENDED PLANNED MACRO RANGE; a substitute OUTSIDE the band logs honestly but does
  NOT count as adhered; gap-rebalance (N-04) suggests adjustments toward the band.
- **Veggie-tag + water source (N-16 → D138):** food records carry a `veggieTag`
  (seeded, user-adjustable); water is logged through the normal nutrition path and
  marked with `source='water'` on the receipt line. These feed the two default-OFF
  habit check-ins (veggies, water) inside the nutrition domain: veggie servings
  auto-tick from a veggie-tagged food category; water auto-ticks from logged water.
  The locked habit engine applies unchanged (daily check-ins, grace, quiet-week,
  no-shame, zero-XP for ticking); manual check-in always wins; isImported excluded.
- **Adherence-neutral compliance math — the N-03 reads (L043 → D201):** the
  weekly check-up's denominator is a READ over the existing receipt-line model —
  no new columns, no zero-fill rows, no streak storage. The schema contract:
  - **Denominator = distinct logged days** — the weekly check-up counts the week's
    distinct `nutrition_logs.dateKey` values with ≥1 receipt line; the day total is
    SUM of rows (existing rule), never a stored day row.
  - **Missed rows NEVER count as zero** — an unlogged day contributes NOTHING to
    the denominator and never gets a synthetic zero row written; unlogged days are
    treated as typical intake or excluded (Coach-side copy), never as a zero.
  - **Thin-week rule (<5 logged days)** — when the week has <5 logged days, the
    missing days are EXCLUDED from the denominator (the check-up does not report a
    compliance % for a thin week); a typical-average is used only when the week is
    otherwise complete (verbatim-critical: the threshold is <5).
  - **Compliance = logged days' performance only** — percentages are computed over
    the logged-day denominator only; no streak displays for nutrition (nothing to
    store, no streak fields on `nutrition_logs` or a nutrition-streak table).
  The check-up's denominator rules themselves live in CoachSystem.md (N-03, D191);
  Database.md carries the fields the math reads (`dateKey`, receipt-line macros).

### Routine — day templates, binder, performed days (C8.1/C8.2/C8.3)

- `day_templates` = named reusable full-day plans; `day_template_slots` carry a
  typed `kind`: meal | pack | workout | activity | rest | sleep | weigh-in. Only
  meal + pack kinds feed nutrition; the other kinds are structure future features
  hook into (kind is the extension seam, like nutrition's `source`). Slot `link`:
  recipeId for meal slots, workoutTemplateId for workout-kind slots (pack→meal
  linkage is established at TEMPLATE level).
- Binding model = ONE (R2/A6): a weekly routine is a named 7-slot binding list
  (`week_plans` / `week_plan_slots`, slots referencing `dayTemplateId`, null =
  rest) + a per-day override. No independent "switchable per day-of-week"
  mechanism, no per-day toggle.
- The workout template lives INSIDE a day template via the workout-kind slot, which
  links a workout template so the day's session screen pre-fills. Standalone
  fitness week_plans scheduling is RETIRED (A7) — one door to edit a workout, no
  second calendar.
- `routine_days` = the performed day (dateKey, templateUsedId — SNAPSHOT copy of
  the applied template, frozen); `routine_slot_logs` carry status:
  planned | done | skipped | packed | eaten. Past days stay frozen; template
  building is a copy op (never a link); template edits/deletes affect future
  bindings only, and a routine referencing a deleted template auto-falls back to
  the default (L232/L236).
- Pack (pack-kind slot) creates a "to-carry" item with calories entered at pack
  time, linked to a target meal slot; consumed at EAT time (a nutrition_logs row,
  source='packed'); not eaten = cancelled, never enters kcal (L231).
- Weigh-in slot: one tap → `body_metrics` type=weight; the NU8 first-of-day rule
  applies (R10).
- Prompt discipline (L109): NO weekly prompt on unbroken indefinite runs — the app
  asks only at first-ever setup, when a period ends, on user-opened override, or
  an explicit want-change.
- **Day-pattern binding (L-13 → D140):** the day template's binding expands from
  ONE dayKey to a day-PATTERN — "which days" is a first-class field:
  weekday/weekend variants, specific days (Mon/Wed/Fri), weekly cadence.
  `week_plan_slots.pattern?` extends the existing `dayOfWeek` column additively
  (the daily case = the existing single-day binding). M4 scope = weekday/weekend +
  specific days + weekly; MONTHLY patterns future. Pattern changes apply
  FUTURE-ONLY by default with this/all-future/all scoping choices — a template
  edited mid-week never corrupts the week. The briefing pre-loads today's
  applicable template; the NL parser (L-01) feeds cadences.

### `coach_outputs` kinds — 9-kind dictionary (C4.3, L156)

No schema change — the `kind` column enumerates the full dictionary; kinds stay
finite and no two labels mean the same thing:

| kind | payload shape |
|---|---|
| `daily_note` | daily Coach note (habits/journal/fitness summary + one line per strictness) |
| `nudge` | habit-miss / journal-drought / meal-window catch-up pokes (quiet-week aware) |
| `briefing` | morning briefing card: today's slots + done-vs-missing + macro-gap bar |
| `check_in_weekly` | merged weekly review: Coach weekly section on top, fitness/nutrition sections below — ONE surface |
| `nutrition_checkup` | weekly nutrition stats: kcal vs target %, protein hit-rate, weekly compliance |
| `milestone_review_goal` | goal-end review card: WON or EXPIRED vintage, computed final value beside target |
| `milestone_review_anniversary` | "since you started" review anchored to the shared birth anchor — the account's FIRST IN-WINDOW EVENT per D100, frozen at first write, never shifted by deletion (D102); a gym-only user gets their review on the tree's birthday |
| `phase_close` | phase close report (derived summary + the 3-5-line weekly Coach message — F-24, docs-pass D152; see CoachSystem.md §Phase-close report) |
| `pattern_alert` | pattern alerts (rest-day training, stall recovery, adherence patterns) |

The former "weekly review" label is replaced by `check_in_weekly` (L156).

<!-- REMOVED (L132 → D102): the milestone_review_anniversary anchor text "anchored
to the first journal entry" is superseded by the app-wide frozen birth anchor
(D102 — the account's FIRST IN-WINDOW EVENT per D100, frozen at first write,
never shifted by deletion). The Coach's milestone-review date may move for users
whose first event wasn't a journal entry — and it stops shifting on deletion
forever. The anchor rides in the backup format (D098) so restore and sync never
drift it. -->

### Settings keys (schema-relevant) — settings, never profile fields (C2.3, C10.1, D003)

The `settings` key/value table holds these as KEYS, not profile fields (D003).
Schema-relevant ones:

- units `kg|lb` / `cm|in` — display conversion only (O8)
- height, age, sex, activity factor — Mifflin-St Jeor TDEE inputs (Group 4)
- manual TDEE override — freezes auto-recompute (and protein/fat basis) until cleared
- protein g/kg per phase — cut 2.0 / bulk 1.8 / maintain 1.6, editable, per-Area override
- fat floor g/kg — 0.6, editable up
- food macro lookup toggle — default ON; OFF = plain manual entry (switches behavior, never deletes data)
- grace default — 1 grace day per 7-day window (streak forgiveness budget)
- PO auto-suggestions GLOBAL KILL-SWITCH — default on
- `inactivityDecaySteepness` — PO suggested-load decay per week off (F-11 → D200): ~10–20% per week off default; the settings knob the freshness decay reads (see `workouts` — PO suggestion freshness decay)

### `media_attachments` fields (media update — see `MediaStorage.md`, DecisionLog D037)

- `syncState` canonical values:
  - `local-only` — blob and thumbnail on this device only (default).
  - `metadata-synced` — metadata row + thumbnail synced across devices (Milestone 11
    entity-sync plane); full blob still device-local.
  - `fully-synced` — full blob in the Drive vault (P3).
  - `archived-to-pc` — blob moved to a PC filesystem folder outside app storage;
    metadata + thumbnail remain in the DB. `storageRef` points at the archive
    location; `archivedOnDevice` records which machine holds it.
  Transient states during transfer (e.g. `uploading`/`offloaded`) are internal
  to the sync service and never written as canonical rows.
- `contentHash` — sha256 (or chosen hash) of the original blob, computed before
  save for dedup (see `MediaStorage.md` optimizations 1/3). Indexed for
  duplicate lookup.
- `thumbnailRef` — points to the small (~10–20 KB) always-local thumbnail copy,
  distinct from the original's `storageRef`. Every device stores its own local
  thumbnail copy regardless of tier.
- `archivedOnDevice` — stable per-install deviceId (existing D019 concept; same
  id used for sync tie-breaking). `null` means "not PC-archived".
- `title` — optional display name (J7 naming hook; editable any time); display
  falls back to `fileName`.
- `adopted` — marker on PC-adopted rows: the blob lives outside app storage in the
  user's folder (folder = source of truth for the blob); adopted bytes are
  EXCLUDED from the storage meter.
- `adoptedAt` (D113 IA-4) — stored adoption timestamp: "qualifies forward-only"
  becomes computable — adopted media counts for media presence FORWARD-ONLY from
  adoption, never before it; adopted rows never backdate presence.
- `durationSec` — measured EXACTLY ONCE when the file first enters the library
  (phone capture returns the finished duration; PC adoption parses the MP4/MOV
  container header once, no ffmpeg). Later tier moves copy the stored row — no
  re-measurement, no cross-device drift. Unreadable/corrupt files store NULL and
  NEVER count (no estimates, no user-typed values).
- New columns are added with defaults (null) via versioned migration; old
  backups remain importable per the migration rules below.

### Event Log

| Table | Fields |
|---|---|
| `events` | id, type, occurredAt, dayKey, area?, entityType, entityId, payloadVersion, payload (JSON), supersedesId?, isBackfill? |

Indexes: `(type, dayKey)`, `(entityType, entityId)`, `(area, dayKey)`.

- **`isBackfill?` (D113 IA-3)** — stored flag set by historical-backfill mode.
  The D100 presence predicate reads it: a pure backfill can never arm rings,
  stage ticks, or presence; the D116 A6/S14 backfill-trophy predicate extends the
  exclusion to trophy conditions (qualifying content fires trophies only for
  in-window days).
- **Future-dating clamp (D114)** — events with `occurredAt` in the future are
  excluded from all math.
- **Written-in-window guard (D100)** — the D100 presence predicate reads dayKey
  WITH a written-in-window guard: a day counts as presence only if its events
  were written within the ±3-day grace of that day (verbatim-critical — the
  streak-grace philosophy; the exact window locks in the THRESHOLD REGISTER,
  D105 A1). Imports stay excluded everywhere (locked). Content organs (leaves,
  fruits, the anchor) read occurredAt TRUTH; presence is earned, content is real.

Event types seeded in MVP (not exhaustive — Architecture.md's event table is
the canonical list; this is the MVP launch subset):

- `habit.completed`, `habit.missed`
- `journal.created`, `journal.edited`, `journal.deleted`
- `media.added`, `media.removed`, `vlog.deleted` (tombstone)
- `reflection.created` (M2)
- `workout.completed` — health-area event type; payload = metadata only (exercise
  count, total sets, total volume), never set detail
- `goal.completed`, `task.completed` (M1)
- future: `study.session`, `relationship.event`, ...

<!-- REMOVED (L155 → D049): `goal.progress` event type. Goal progress is
computed-only via one H3 owner per goal kind (weight: rolling weight vs start /
deadline; strength: est-1RM vs target); only the rare user-declared
`goal.completed` remains as an event. -->

**Event immutability:** edits append new events with `supersedesId` pointing at
the superseded event. Deletions are tombstone events. This preserves the
behavior history the Coach depends on.

**Sync semantics (logical-only, backend-neutral — D019/D059):** across devices
the event log is an append-only UNION of distinct event ids; same-entity edits
resolve by last-write-wins on `timestamp`, with the stable per-install `deviceId`
breaking exact ties. **Tombstone rule:** a delete ALWAYS wins over an
earlier-timestamped edit arriving late from another device — an entity never
resurrects (applies to `workout.deleted`, habit revokes, and
journal/nutrition/body deletes alike). This is sync-plane semantics for the
logical event model; it does not change the storage backend.

## Format v3 — the tree-era schema set (one versioned unit)

D117 A1 names `Database.md` as the amendment home for the tree-era schema set —
NOT `StorageDecision.md`, which carries no format. This set lands as ONE
versioned migration group (INT-18 footer: one decision group for the D1/D2
executor, not six separate passes). Every field below is additive — no column is
ever deleted, new fields ship with defaults — and old backups remain importable
per the migration rules. Decision records: the tree-era fields cite
D098/D100/D102/D107/D108/D109/D113/D117; the F/N/L-era fields cite the docs-pass
schema records D133–D140 (assigned at this pass per the C-approved decision-ID
list — one shared ID per same-theme row). E-audit GAP-closing requeue: F-11
(L018 → D200) and N-03 (L043 → D201) are READ-CONTRACTS over existing schema —
no new columns, no migration entries; their detail lives in the `workouts`
section, the Settings keys, and the Nutrition section respectively.

### formatVersion 3 + `logFingerprint` (D109 C-2)

The backup format bumps to formatVersion 3. It carries a MONOTONIC
`logFingerprint` (eventCount + syncSeq) so a restored backup tells the tree
cache it is stale immediately — no blind re-derivation, no stale-tree windows
(D109 C-2). The cache itself stays OUT of the format (regenerable — D098).
formatVersion 2 enumeration stays valid for old backups (additive bump). The
tree-era fields the bump unlocks: the frozen birth anchor (below), the synced
`viewed_moments` table (below), and the cache-staleness contract on restore.

### The frozen birth anchor (D098/D102)

The backup format carries the app-wide frozen anchor — the account's FIRST
IN-WINDOW EVENT per D100, frozen at first write, never recomputed, never shifted
by deletion (D102). The tree, the Coach anniversary, the milestone reviews, and
the rings all read the same value; restore and sync never drift it (D098). The
milestone-review anniversary amendment (the `coach_outputs` kinds dictionary,
above) consumes this anchor; the anchor is a monotonicity-by-design carrier —
an older restore honestly shows fewer rings, never a silent regression.

### `isBackfill` + the event-schema notes (D113 IA-3, D100, D114)

`events.isBackfill` — the two-tier split (D100) is made implementable: the
presence predicate reads the stored flag, so historical-backfill mode can never
arm rings, stage ticks, or presence (D113 IA-3); the D116 A6/S14 backfill-trophy
predicate extends the exclusion to trophy conditions. Event-schema notes: the
FUTURE-DATING CLAMP (D114) — events with `occurredAt` in the future are excluded
from all math; the WRITTEN-IN-WINDOW GUARD (D100) — a day counts as presence only
if its events were written within the ±3-day grace of that day (verbatim-critical;
locks in the THRESHOLD REGISTER, D105 A1). Detail in the Event Log section above.

### `adoptedAt` (D113 IA-4)

`media_attachments.adoptedAt` — stored adoption timestamp: "qualifies
forward-only" becomes computable (D113 B M-09) — adopted media counts for media
presence FORWARD-ONLY from adoption, never before it; adopted rows never backdate
presence. Detail in the `media_attachments` fields section above.

### `viewed_moments` (D109 C-1)

A new SYNCED user-state table (like settings), never a regenerable cache: which
transitions/replays the user has seen. ACCOUNT-ONCE guarantee (the launch replay
plays once per account, synced across devices) + PER-DEVICE DELIVERY (a
transition seen on the phone still plays on the desktop — a delivery difference,
not a state difference). Rides the backup enumeration + the M11 sync plane.
DELIVERY/STATE SEPARATION (D109 C-4): derived facts converge on every device from
the same merged log; only DELIVERY (watermarks) and PRESENTATION (local bytes)
differ.

### `tree_cache` — the engine-written derived cache (D107/D108)

A PERSISTED, ENGINE-WRITTEN derived cache holding the tree state — never a user
write-path entity. The state model is the LEAN form (D107 / SCHEMA 2.6, shape
verbatim-critical — the engine contract's data structure): meta (schemaVersion,
registerVersion, logFingerprint, derivedAt, anchor) · stage, stageYears,
currentWindowDays · axes · bankBuds [{achievementId}] (order = earn order) ·
legendAchievementId · trunk {rings [{index, sliver}], adaptations} · branches
[{domain, dormantSince, revivals, twigs [{monthKey, daysPresent}], forks [{type,
twigs}], rings, adaptations, fruitSpurs}] · habits [{habitId, state}] · leaves
(recent granularity + cluster aggregates) · flowers [{achievementId,
bloomDateKey, state}] · fruits [{goalId, dateKey}] · periods [{type, startKey,
endKey}]. ONLY what the renderer draws + what derivation tracks incrementally;
every other fact stays in its owning system. Derivation protocol (D108):
incremental delta + ATOMIC SWAP (one transaction; the renderer never sees a
half-written tree); first-paint contract (persisted cache — first frame = the
current state blob instantly, LOD mass not detail); off-UI-thread isolate;
set-commutative fold (order-independent — the same merged log always produces
the same tree); single-writer derivation lock (two-tab) + idempotence; full
re-derivation only on first launch (D097), restore (D098), a fingerprint
mismatch, or a register-version bump. The cache is REGENERABLE — deliberately
NOT in the backup enumeration (D098), same as `nutrition_food_cache`.

### Fitness-era: `setType` (F-05 → D133)

`exercise_sets.setType` — one nullable enum column (warmup|working|failure),
explicit values at save, default `'working'`, no separate flags. The W/D/F
labels are UI; the column is the storage. Detail in the `workouts` section above.

### Nutrition-era (N-05 → D134, N-06 → D135, N-10 → D136, N-11 → D137, N-16 → D138)

- `batches` + `batch_containers` + `batch_container_line_items` (N-05 → D134) —
  the pack model: recipe → batch → containers → consume-decrement, mixed batches
  folded in from day one (per-container line items, partial-consume semantics,
  per-part honest sources).
- `trivial_foods` (N-06 → D135) — the calorie-trivial foods list; each entry
  carries its REAL macros, never fudged to zero.
- `nutrition_logs.substitutedForRecipeId?` (N-10 → D136) — one-time recipe
  substitution on the receipt line (copy-in preserved, no fork).
- `gramReferenceG` on food records + recipes (N-11 → D137) — grams as the
  canonical portion anchor; presets carry gram equivalents.
- `veggieTag` on food records + `source='water'` on receipt lines (N-16 → D138) —
  the two default-OFF habit check-ins' data sources.

All detail in the Nutrition section above.

### LifeOS-era (L-01 → D139, L-13 → D140)

- `goals` / `tasks` gain `parsedFrom?` + `parseOutput?` (L-01 → D139) — the
  offline rule-based NL parser's extracted dates + units + cadences; the
  structured form stays for precision, the parser pre-fills it; no AI, no deps.
- `week_plan_slots.pattern?` (L-13 → D140) — the day-PATTERN binding
  ("which days" as a first-class field); pattern changes apply FUTURE-ONLY by
  default. Detail in the Routine section above.

### Not drafted — the progression-edge table (F-26, SKIPPED)

The rep-mode progression-edge table is NOT added to the schema. F-26 is SKIPPED
for now (user) — recorded with its REVISIT trigger: activation = when rep-mode
exercise work starts (M2 build or later); edges seed then (the gen-2 skipped-items
record, D132). No schema is drafted at this pass (delta §4).

## Migration Strategy

- Schema has a monotonic `schemaVersion` stored in settings.
- Migrations are explicit, ordered, and versioned (migration list 1 → N).
- On restore/import: if the backup's `schemaVersion` < current, migrations run
  in order before data load. If backup is newer, import refuses with a clear
  message (upgrade the app first).
- MVP rule: never delete columns on migration; add new fields with defaults so
  old backups remain importable.
- The format v3 set (D117 A1) is ONE versioned migration group, not six passes:
  formatVersion 3 + `logFingerprint` + `birthAnchor` + the new columns (setType,
  isBackfill, adoptedAt, substitutedForRecipeId, gramReferenceG, veggieTag,
  parsedFrom, parseOutput, pattern) + the new tables (viewed_moments, tree_cache,
  batches, batch_containers, batch_container_line_items, trivial_foods). Every
  field lands additively with defaults (null/false); old backups remain
  importable; regenerable caches (tree_cache, nutrition_food_cache) are never
  part of the migration's data expectations.

## Backup / Restore Format

### Export (local, MVP)

One JSON file per backup:

```
PersonalOS-backup-YYYY-MM-DD-HHmm.json
{
  "format": "PersonalOS-backup",
  "formatVersion": 3,
  "schemaVersion": <int>,
  "logFingerprint": { "eventCount": <int>, "syncSeq": <int> },
  "birthAnchor": "ISO-8601",
  "exportedAt": "ISO-8601",
  "user": "personalos",
  "data": {
    "settings": [...],
    "areas": [...],
    "journalEntries": [...],
    "mediaAttachments": [ { ...metadata only, no blob... } ],
    "habits": [...],
    "habitCheckins": [...],
    "events": [...],
    "goals": [...], "milestones": [...], "tasks": [...],
    "coachOutputs": [...],
    "weekPlans": [...], "weekPlanSlots": [...],
    "workoutTemplates": [...], "workoutTemplateExercises": [...],
    "workouts": [...], "exerciseSets": [...],
    "muscleGroups": [...], "exerciseMuscleGroups": [...],
    "exercises": [...], "bodyMetrics": [...], "phases": [...], "deloadMarkers": [...],
    "nutrition_logs": [...], "nutrition_recipe": [...], "meal-types": [...],
    "batches": [...], "batchContainers": [...], "batchContainerLineItems": [...],
    "trivial_foods": [...],
    "day_templates": [...], "day_template_slots": [...],
    "routine_days": [...], "routine_slot_logs": [...],
    "periods": [...], "limitations": [...],
    "viewedMoments": [...]
  },
  "media": {
    "manifestVersion": 1,
    "files": [
      { "id": "...", "fileName": "...", "mimeType": "...",
        "sizeBytes": ..., "sha256": "...", "exported": true/false }
    ]
  }
}
```

- formatVersion bumped 1 → 2, additive (L042/L095): the new collections above
  enumerate weekPlans/weekPlanSlots (routine binder), workoutTemplates,
  workoutTemplateExercises, workouts, exerciseSets, muscleGroups,
  exerciseMuscleGroups, exercises (seeded-lookup user rows), bodyMetrics, phases,
  deloadMarkers, nutrition_logs, nutrition_recipe, meal-types, day_templates,
  day_template_slots, routine_days, routine_slot_logs, periods (trip records —
  user rows survive restore), limitations. `nutrition_food_cache` is NOT in the
  enumeration (regenerable, derived from nutrition_logs history).
- formatVersion bumped 2 → 3, additive (D109 C-2/D117 A1): the format carries a
  MONOTONIC `logFingerprint` (eventCount + syncSeq) — a restored backup tells the
  tree cache it is stale immediately (no blind re-derivation, no stale-tree
  windows) — plus the frozen `birthAnchor` (D098/D102: the account's FIRST
  IN-WINDOW EVENT per D100, frozen at first write, never shifted by deletion —
  the tree, the Coach anniversary, the milestone reviews, and the rings all read
  the same value; restore and sync never drift it). The new collections above
  enumerate batches/batchContainers/batchContainerLineItems (the pack model,
  N-05), trivial_foods (N-06), viewedMoments (the synced user-state table, D109
  C-1 — account-once + per-device delivery; rides the backup enumeration + the
  M11 sync plane). `tree_cache` is NOT in the enumeration (engine-written derived
  cache, regenerable — D098/D109), same as `nutrition_food_cache`. formatVersion
  2 enumeration stays valid for old backups (additive bump).
- Human-readable (documented fields, no proprietary binary encoding).
- Media blobs are exported as files alongside the JSON
  (`media/` folder next to the backup file), verified against the manifest's
  sha256 on import.
- `exported: false` entries record media that exists locally but was not
  included (e.g., huge library, or PC-archived items whose blob lives outside
  app storage on the PC filesystem — see `MediaStorage.md`); the archive still
  documents the metadata.

### Restore

1. Pick backup JSON (and media folder, if present).
2. Validate format, `formatVersion`, and `schemaVersion`.
3. Run migrations if needed.
4. Import all tables transactionally (existing data is replaced — restore is a
   full-restore operation, with a confirmation step).
5. Re-import media files: missing files are listed in a report (soft failure,
   entry metadata is preserved).

- A restore is ACCOUNT-LEVEL (D109 C-4) — it supersedes all devices; every
  device re-derives from the restored log (the D098 "no silent regression"
  guardrail extends to the fleet).
- On import, the backup's `logFingerprint` is compared against the tree cache's:
  a mismatch tells the cache it is stale immediately — no blind re-derivation,
  no stale-tree windows (D109 C-2). The tree re-derives honestly from the
  restored log; the cache is regenerable, never part of the backup's integrity
  story (D098). The frozen `birthAnchor` rides the format so restore and sync
  never drift it (D102).

### Guarantees

- Everything the app can write, export can capture; everything export captures,
  import can restore.
- No vendor lock-in: the format is JSON + files, documented, restorable into a
  fresh install or a different app.
- Backup never requires network; Drive upload (P2) is an additional copy, not a
  requirement.

### Live Database Corruption Recovery

The live local DB can corrupt (e.g., browser crash mid-write). This is distinct
from data loss and gets its own flow (DecisionLog D021, M0 deliverable):

> Note (D040): the storage backend is now locked to Drift (SQLite WASM) — see
> `StorageDecision.md`. The dual-candidate wording in step 1 is kept as the
> historical record; this flow is backend-independent and applies as written.

1. On launch, run an integrity check (SQLite: `PRAGMA integrity_check`;
   IndexedDB: probe transaction + schema-version verify).
2. On failure: do NOT auto-restore — never overwrite possibly-good data with a
   stale backup.
3. Enter recovery mode: block writes, show a clear recovery screen.
4. Attempt "export what's readable first" — salvage whatever is still readable
   before any restore.
5. Then prompt restore from the last export.

Cheap, backend-independent, and specified now because SQLite-WASM-over-OPFS is
the highest-risk infrastructure piece.
