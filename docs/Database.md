# PersonalOS — Database

Data model, event log, migrations, and the backup/restore format. The storage
backend itself (Drift vs IndexedDB) is decided in `StorageDecision.md`; this
document describes the logical schema that both candidates must implement.

## Logical Schema

### Entities

| Table | Fields (key) | Notes |
|---|---|---|
| `journal_entries` | id, title?, body, area?, tags (JSON), createdAt, updatedAt, deletedAt?, imported, importHash | multiple per day allowed; `imported` + immutable `importHash` set at batch import (dedupe on original date + content hash); imported entries land on their ORIGINAL date, never earn XP. The `imported` flag is global on every importable entity (workouts, nutrition_logs, body_metrics, habit_checkins) — Gamification.md Anti-Farming #7; journal entries additionally carry the dedupe `importHash`. |
| `media_attachments` | id, entryId, fileName, mimeType, sizeBytes, durationSec?, title?, capturedAt, syncState, storageRef, thumbnailRef, contentHash?, archivedOnDevice?, adopted | syncState: local-only / metadata-synced / fully-synced / archived-to-pc (see below); thumbnailRef: separate always-local thumb copy; contentHash: dedup key (see `MediaStorage.md`); archivedOnDevice: deviceId of the PC that archived the blob, null = not PC-archived; durationSec/title/adopted: see field notes below |
| `habits` | id, name, area?, cadence (daily default), createdAt, active, autoSource? | autoSource (workout / future weigh-in): auto-tracked habits — draft-schema flag (L062) |
| `habit_checkins` | id, habitId, dayKey, completedAt, note?, autoCreated? | one per habit per day; autoCreated? = written by the session-save habit bridge in the same transaction; manual check-ins win |
| `goals` | id, title, area?, targetDate?, createdAt, kind (generic\|weight\|strength), exerciseId?, targetValue? (M1) | additive nullable kind cols ship from the FIRST M1 goals build (no forced migration on old data later); weight goal target = bodyweight, strength goal = tracked exercise + target est-1RM; progress computed-only via one H3 owner per kind |
| `milestones` | id, goalId, title, targetDate?, completedAt? (M1) | |
| `tasks` | id, title, dueDate?, completedAt?, area? (M1) | |
| `areas` | id, slug, label, userDefined | seed from code; user-extendable |
| `settings` | key, value | timezone, displayName, coachStrictness, storage warnings seen, etc.; schema-relevant keys listed below — settings, never profile fields (D003) |
| `coach_outputs` | id, kind, dateKey, payload | 9-kind dictionary (see below): daily_note / nudge / briefing / check_in_weekly / nutrition_checkup / milestone_review_goal / milestone_review_anniversary / phase_close / pattern_alert |
| `media_manifest` | id, mediaId, sha256?, exportedIn | aids export verification |

| **Health area — fitness / nutrition / body (entity+event pattern, D041)** | | |
| `workouts` | id, dateKey, occurredAt, area (health), phaseId?, templateId?, kind (strength\|cardio), durationSec?, distanceKm?, avgEffort?, kcalBurned?, routineSlotLogId?, notes? | performed session = frozen copy of a template's exercise rows (append-only history); multiple sessions per day allowed (two-a-day); weights store kg everywhere (display-convert only) |
| `exercise_sets` | id, workoutId, exerciseId, setIndex, weightKg?, reps?, addedLoadKg? | every set logged; bodyweight/rep-mode exercises record best clean rep count (addedLoadKg breaks ties); no RPE column (rejected — L265) |
| `exercises` | id, name, category (push\|pull\|legs\|core\|cardio), userDefined, active, tracked, progressionStyle? | seeded ~44 from code (list below), user-extendable like `areas`; big-5 profile lifts tracked ON by default (Bench Press, Squat, Deadlift, OHP, Barbell Row) |
| `exercise_muscle_groups` | exerciseId, muscleGroupId, role (primary\|secondary) | muscle tags set once per exercise; sets auto-inherit, never re-logged |
| `muscle_groups` | id, name, parentId?, userDefined | 2-level seeded hierarchy (legs/push/pull/core → children), user-extendable |
| `body_metrics` | id, dayKey, occurredAt, type (weight\|measurement_*), valueKg | canonical daily trend = FIRST weigh-in of the day; later same-day rows stored but excluded from derived series (see below) |
| `phases` | id, type (bulk\|cut\|maintain), startDate, endDate?, targetWeeklyRateMin?, targetWeeklyRateMax?, notes? | ONE active phase; baseline weight anchored at start (O3 rolling average); rate↔macros feedback shape deferred to the nutrition session (see below) |
| `workout_templates` | id, name, createdAt | first-class table; written by the template designer + paste parser |
| `workout_template_exercises` | id, templateId, exerciseId, order, targetSets, targetReps, pairWith? | pairWith? = superset pairing metadata on templates only; sessions never store pairing |
| `nutrition_logs` | id, dateKey, occurredAt, mealTypeId?, recipeId?, name?, kcal, protein, carbs, fat, portionMultiplier, source | per-meal receipt lines; day total = SUM of rows, never a stored day row; dateKey = ACTUAL eat date (NU4 backdating exception to I7) |
| `meal_types` | id, name, userDefined | seeded (breakfast/lunch/dinner/snack), user-extendable + editable; cosmetic grouping only |
| `nutrition_recipe` | id, name, kcal, protein, carbs, fat, mealTypeId?, servingNotes? | copy-in at save — editing a recipe never rewrites past rows |
| `nutrition_food_cache` | (regenerable lookup cache) | ONE regenerable table — deliberately NOT in the backup enumeration; lookups derived from nutrition_logs history |
| `deload_markers` | id, phaseId?, dateKey, reason (adherence\|volume\|user), weightDropKg? | records deload events — Coach deload suggestion + manual entry; drives deload ranges (CoachSystem.md §Context switches) |
| `periods` | id, dateKey, startDate, endDate?, kind (period\|vacation\|planned-rest), note? | trip/quiet-range records — user rows survive restore (backup enumeration); vacation-day union drives streak rules (Gamification.md) |
| `limitations` | id, dateKey, exerciseId?, limitation (injury\|soreness\|other), note?, resolvedAt? | records injuries/limitations — feeds "limited-not-lazy" Coach rule + PO suggestions (CoachSystem.md §Named rules) |
| `day_templates` | id, name, createdAt, updatedAt | named reusable full-day plans; edits/deletes affect FUTURE bindings only |
| `day_template_slots` | id, templateId, time, kind (meal\|pack\|workout\|activity\|rest\|sleep\|weigh-in), title, link?, notes? | link = recipeId for meal slots, workoutTemplateId for workout-kind slots |
| `week_plans` | id, name, ... | routine-week binder: a named 7-slot binding list + per-day override (ONE binding model); standalone fitness week_plans scheduling RETIRED (A7) |
| `week_plan_slots` | id, planId, dayOfWeek (0–6), dayTemplateId? | slots reference DAY templates — `dayTemplateId`, NOT workoutTemplateId; null = rest |
| `routine_days` | id, dateKey, templateUsedId, routineUsedId? | SNAPSHOT copy of the applied template, frozen |
| `routine_slot_logs` | id, dayId, templateSlotId, timeActual, status (planned\|done\|skipped\|packed\|eaten) | pack contents stay nutrition_logs rows (source='packed') consumed at eat time; slot logs reference, never duplicate |

Future, NOT M0: a `links` table (sourceType, sourceId, targetType, targetId,
linkType, id, createdAt; one row per directed edge, rendered as undirected in
the view) for the graph/"brain" view — DecisionLog D023, Roadmap.md Milestone 8
(under consideration). Not part of the M0 schema; not built.

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
| `milestone_review_anniversary` | "since you started" review anchored to the first journal entry |
| `phase_close` | phase close report (derived summary + one Coach line) |
| `pattern_alert` | pattern alerts (rest-day training, stall recovery, adherence patterns) |

The former "weekly review" label is replaced by `check_in_weekly` (L156).

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

### `media_attachments` fields (media update — see `MediaStorage.md`, DecisionLog D037)

- `syncState` canonical values:
  - `local-only` — blob and thumbnail on this device only (default).
  - `metadata-synced` — metadata row + thumbnail synced to Drive (P2.5 phase);
    full blob still device-local.
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
| `events` | id, type, occurredAt, dayKey, area?, entityType, entityId, payloadVersion, payload (JSON), supersedesId? |

Indexes: `(type, dayKey)`, `(entityType, entityId)`, `(area, dayKey)`.

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

## Migration Strategy

- Schema has a monotonic `schemaVersion` stored in settings.
- Migrations are explicit, ordered, and versioned (migration list 1 → N).
- On restore/import: if the backup's `schemaVersion` < current, migrations run
  in order before data load. If backup is newer, import refuses with a clear
  message (upgrade the app first).
- MVP rule: never delete columns on migration; add new fields with defaults so
  old backups remain importable.

## Backup / Restore Format

### Export (local, MVP)

One JSON file per backup:

```
PersonalOS-backup-YYYY-MM-DD-HHmm.json
{
  "format": "PersonalOS-backup",
  "formatVersion": 2,
  "schemaVersion": <int>,
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
    "day_templates": [...], "day_template_slots": [...],
    "routine_days": [...], "routine_slot_logs": [...],
    "periods": [...], "limitations": [...]
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
