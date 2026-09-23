# Life Tree — Input Map Raw Brief: DATA LAYER

Feature-scan agent output. Raw material only — no synthesis. Every input-able
thing in the PersonalOS data layer, as of 2026-08-29 (M0 implemented).

## 0. Sources & method

Read in full:
- `docs/Database.md` (400 lines) — logical schema, event log, backup format
- `docs/Architecture.md` (453 lines) — event model, owner catalog, layers
- `docs/StorageDecision.md` (121 lines) — backend locked to Drift+SQLite(WASM), D040
- `docs/MediaStorage.md` (405 lines) — media entities, tiers, limits
- Cross-checked against the IMPLEMENTED data layer (the code is the M0 truth):
  - `lib/data/database/database.dart` (Drift schema, 214 lines)
  - `lib/data/repositories/*.dart` (6 repositories)
  - `lib/data/models/*.dart` (6 models)
  - `lib/data/adapters/local_media_adapter.dart`
  - `lib/data/providers.dart`, `lib/core/constants.dart`, `lib/core/ids.dart`,
    `lib/core/device_mode.dart`
  - `lib/services/coach/coach_service.dart` (writes coach_outputs + habit.missed)

### CRITICAL DISTINCTION (read first)

Two layers of truth exist and DO NOT fully overlap:

| | Docs (`Database.md`) | Implemented code (`database.dart`) |
|---|---|---|
| Scope | FULL logical schema: 33 tables (M0 + M1 + M2 + routine + nutrition) | M0 subset: 9 tables |
| Version | `schemaVersion` monotonic int (settings) | `schemaVersion => 1` (database.dart:162) |
| Not built | goals/milestones/tasks, all health tables, routine tables, links | everything not listed in §1 |

Everything below is tagged **[IMPL]** (exists in code today) or **[DOC]**
(specified in docs, NOT in code — future input surface). The Life Tree input
map must treat [DOC] items as designed-but-not-yet-input-able.

---

## 1. Implemented Drift schema (M0) — `lib/data/database/database.dart`

DB name `personalos`; web: `sqlite3.wasm` + `drift_worker.dart.js`
(database.dart:149-159). `PRAGMA foreign_keys = ON` (database.dart:171).
Tables registered: database.dart:135-145. `tableCounts()` enumerates the 9
tables (database.dart:194-204). `integrityCheck()` = `PRAGMA integrity_check`
(database.dart:188-191).

### 1.1 `journal_entries` — [IMPL] (database.dart:8-23)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| title | TEXT | yes | |
| body | TEXT | no | |
| area | TEXT | yes | LifeArea slug |
| tagsJson | TEXT | no | JSON array of strings |
| createdAt | DATETIME | no | |
| updatedAt | DATETIME | no | |
| deletedAt | DATETIME | yes | soft-delete tombstone |
| imported | BOOL | no | default false |
| importHash | TEXT | yes | batch-import dedupe key |

Model: `lib/data/models/journal_entry.dart` (id, title, body, area, tags,
createdAt, updatedAt, deletedAt, imported, importHash; toJson/fromJson at
:69-99).

### 1.2 `media_attachments` — [IMPL] (database.dart:25-46)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| entryId | TEXT | yes | FK → journal_entries.id |
| fileName | TEXT | no | |
| mimeType | TEXT | no | video/* detection drives vlog.deleted vs media.removed |
| sizeBytes | INT | no | |
| durationSec | INT | yes | measured exactly once at first entry; corrupt → NULL, never counts |
| title | TEXT | yes | display falls back to fileName |
| capturedAt | DATETIME | no | |
| syncState | TEXT | no | default 'local-only'; canonical values: local-only / metadata-synced / fully-synced / archived-to-pc |
| storageRef | TEXT | no | default ''; runtime value 'blob:<id>' or PC-filesystem archive path |
| thumbnailRef | TEXT | yes | 'blob:thumb:<id>' |
| contentHash | TEXT | yes | sha256 dedup key |
| archivedOnDevice | TEXT | yes | stable per-install deviceId; null = not PC-archived |
| adopted | BOOL | no | default false; adopted bytes excluded from storage meter |
| blobData | BLOB | yes | the actual media bytes (M0 local storage) |
| thumbnailBlob | BLOB | yes | separate always-local thumb copy (~10-20 KB target) |

Model: `lib/data/models/media_attachment.dart` (16 fields mirror table).

### 1.3 `habits` — [IMPL] (database.dart:48-58)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| name | TEXT | no | |
| area | TEXT | yes | |
| createdAt | DATETIME | no | |
| active | BOOL | no | default true |

[DOC gap] Doc adds `cadence` (daily default) + `autoSource?` (workout / future
weigh-in) — NOT in code (Database.md:15).

### 1.4 `habit_checkins` — [IMPL] (database.dart:60-75)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| habitId | TEXT | no | FK → habits.id |
| dayKey | TEXT | no | YYYY-MM-DD |
| completedAt | DATETIME | no | |
| note | TEXT | yes | |

UNIQUE (habitId, dayKey) — one check-in per habit per day (database.dart:72-74).

### 1.5 `areas` — [IMPL] (database.dart:77-84)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK; slug |
| label | TEXT | no | |
| userDefined | BOOL | no | default false |

Seeded from code on DB create (database.dart:175-186; seed list in §9.1).

### 1.6 `settings` — [IMPL] (database.dart:86-92)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| key | TEXT | no | PK |
| value | TEXT | no | string-typed everything |

### 1.7 `events` — [IMPL] (database.dart:94-112)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| type | TEXT | no | dotted e.g. habit.completed |
| occurredAt | DATETIME | no | wall-clock action time |
| dayKey | TEXT | no | local capture date (midnight rule); nutrition backdating exception |
| area | TEXT | yes | LifeArea slug |
| entityType | TEXT | no | e.g. journal, habit, media |
| entityId | TEXT | no | |
| payloadVersion | INT | no | default 1 |
| payload | TEXT | no | JSON string, metadata-only by design |
| supersedesId | TEXT | yes | edit-chain pointer |

Indexes: `idx_events_type_day` (type, dayKey), `idx_events_area_day` (area,
dayKey), `idx_events_entity` (entityType, entityId) (database.dart:94-96).

### 1.8 `coach_outputs` — [IMPL] (database.dart:114-123)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| kind | TEXT | no | 9-kind dictionary (see §7.2) |
| dateKey | TEXT | no | |
| payload | TEXT | no | JSON string |

### 1.9 `media_manifest` — [IMPL] (database.dart:125-133)

| Field | Type | Nullable | Notes |
|---|---|---|---|
| id | TEXT | no | PK |
| mediaId | TEXT | no | |
| sha256 | TEXT | yes | |
| exportedIn | BOOL | no | default false |

Not written by any current code path — reserved for export verification.
[AMBIGUOUS] In code it is a table; the backup format's media manifest is
built ad hoc in ExportImportRepository (not from this table).

---

## 2. Doc-specified tables NOT in code (future input surface) — [DOC]

Source: `docs/Database.md:11-47`. All M1+ / health-area / routine. Any one of
these becomes input-able the day its migration ships.

### 2.1 Goals / tasks (M1) — Database.md:17-19

| Table | Fields | Rules |
|---|---|---|
| `goals` | id, title, area?, targetDate?, createdAt, kind (generic\|weight\|strength), exerciseId?, targetValue? | additive nullable kind cols ship from FIRST M1 build; weight goal target = bodyweight; strength goal = tracked exercise + target est-1RM; progress computed-only via one H3 owner per kind |
| `milestones` | id, goalId, title, targetDate?, completedAt? | |
| `tasks` | id, title, dueDate?, completedAt?, area? | |

### 2.2 Fitness / health (M1) — Database.md:26-34

| Table | Fields | Rules |
|---|---|---|
| `workouts` | id, dateKey, occurredAt, area (health), phaseId?, templateId?, kind (strength\|cardio), durationSec?, distanceKm?, avgEffort?, kcalBurned?, routineSlotLogId?, notes? | performed session = frozen copy of template rows; two-a-day allowed; weights stored kg everywhere (display-convert only); manual kcalBurned replaces MET estimate entirely |
| `exercise_sets` | id, workoutId, exerciseId, setIndex, weightKg?, reps?, addedLoadKg? | every set logged; bodyweight/rep-mode records best clean rep count, addedLoadKg breaks ties; NO RPE column (rejected L265) |
| `exercises` | id, name, category (push\|pull\|legs\|core\|cardio), userDefined, active, tracked, progressionStyle? | ~44 seeded (list in §9.2); big-5 tracked ON by default; user-extendable |
| `exercise_muscle_groups` | exerciseId, muscleGroupId, role (primary\|secondary) | tags set once per exercise; sets auto-inherit |
| `muscle_groups` | id, name, parentId?, userDefined | 2-level seeded hierarchy |
| `body_metrics` | id, dayKey, occurredAt, type (weight\|measurement_*), valueKg | canonical daily trend = FIRST weigh-in of day; later same-day rows stored but excluded from derived series; deleting first-of-day promotes next |
| `phases` | id, type (bulk\|cut\|maintain), startDate, endDate?, targetWeeklyRateMin?, targetWeeklyRateMax?, notes? | ONE active phase; baseline weight anchored at start (O3 rolling average); weekly rate signed (− = cut, + = bulk); `calorieTarget = TDEE + (rate × 7700)/7` |
| `workout_templates` | id, name, createdAt | first-class table |
| `workout_template_exercises` | id, templateId, exerciseId, order, targetSets, targetReps, pairWith? | pairWith = superset pairing, templates only |

### 2.3 Nutrition (M1) — Database.md:35-38

| Table | Fields | Rules |
|---|---|---|
| `nutrition_logs` | id, dateKey, occurredAt, mealTypeId?, recipeId?, name?, kcal, protein, carbs, fat, portionMultiplier, source | per-meal receipt lines; day total = SUM of rows, never stored day row; dateKey = ACTUAL eat date (NU4 backdating exception); portionMultiplier 1x/1.5x/2x resolved ON THE ROW; source enum: manual / scanner / fooddb / packed / scale; soft duplicate guard (same dateKey+mealTypeId+recipeId/food → non-blocking prompt); backfill: same-day/last-24h normal, OLDER = historical mode that never extends streak/compliance |
| `meal_types` | id, name, userDefined | seeded breakfast/lunch/dinner/snack; user-extendable + editable; deleting never touches rows; cosmetic only |
| `nutrition_recipe` | id, name, kcal, protein, carbs, fat, mealTypeId?, servingNotes? | copy-in at save; editing never rewrites past rows; recipeId kept for traceability |
| `nutrition_food_cache` | (regenerable lookup cache) | ONE regenerable table; NOT in backup enumeration; "saved food" DERIVED from nutrition_logs history (L091); fields unspecified [AMBIGUOUS] |

### 2.4 Deload / periods / limitations — Database.md:39-41

| Table | Fields | Rules |
|---|---|---|
| `deload_markers` | id, startDate, endDate (ANY range), reason?, journalEntryId?, notes? | days in range: adherence-quiet, volume-balance exempt, strength chart shaded; FK → journal_entries; separate table, NOT a phases type (D051) |
| `periods` | id, type (vacation\|term\|holiday\|…), title, startDate, endDate, notes?, extraEntityIds? | invisible metadata; content derived by INCLUSIVE range [start,end], never copied/owned; extraEntityIds = ONE deliberate exception (item dragged outside range); user rows survive restore (D075); vacation-day union drives streak rules |
| `limitations` | id, exerciseId?, muscleGroupId?, startDate, endDate?, note? | injury/limitation records; target = exercise OR muscle group; feeds "limited-not-lazy" Coach rule + PO suggestions (D051) |

### 2.5 Routine (day templates / week plans / performed days) — Database.md:42-47

| Table | Fields | Rules |
|---|---|---|
| `day_templates` | id, name, createdAt, updatedAt | named reusable full-day plans; edits/deletes affect FUTURE bindings only |
| `day_template_slots` | id, templateId, time, kind (meal\|pack\|workout\|activity\|rest\|sleep\|weigh-in), title, link?, notes? | link = recipeId (meal slots) or workoutTemplateId (workout slots); only meal+pack feed nutrition; kind is the extension seam |
| `week_plans` | id, name, … | routine-week binder: named 7-slot binding list + per-day override (ONE binding model); standalone fitness week_plan scheduling RETIRED (A7); fields beyond id/name unspecified [AMBIGUOUS] |
| `week_plan_slots` | id, planId, dayOfWeek (0-6), dayTemplateId? | dayTemplateId (NOT workoutTemplateId); null = rest |
| `routine_days` | id, dateKey, templateUsedId, routineUsedId? | SNAPSHOT copy of applied template, frozen |
| `routine_slot_logs` | id, dayId, templateSlotId, timeActual, status (planned\|done\|skipped\|packed\|eaten) | pack contents stay nutrition_logs rows (source='packed') consumed at eat time; not eaten = cancelled, never enters kcal; slot logs reference, never duplicate |

### 2.6 Future, NOT scheduled — `links` (Database.md:49-53)

sourceType, sourceId, targetType, targetId, linkType, id, createdAt — one row
per directed edge for the graph/"brain" view (D023, Roadmap Graph section).
Under consideration; NOT in any schema.

---

## 3. Event log — the input spine

### 3.1 Event record shape — [IMPL]

`events` table (§1.7); `EventRecord` model (`lib/data/models/event_record.dart`)
with toJson/fromJson (:43-71).

### 3.2 Event types — canonical dictionary

**[IMPL] = emitted by current code; [DOC] = specified, not yet emitted.**

| Event type | Status | Payload (metadata only) | Emitted by |
|---|---|---|---|
| `habit.completed` | IMPL | — | habit_repository.dart:78-85 (transactional with check-in row) |
| `habit.missed` | IMPL | — | coach_service.dart:41-53 (idempotent miss-evaluator, one per (habitId, dayKey), up to yesterday, occurredAt = day start) |
| `journal.created` | IMPL | {wordCount, tags, area} | journal_repository.dart:46-59 |
| `journal.edited` | IMPL | {wordCount, tags, area} + supersedesId = previous event id | journal_repository.dart:79-93 |
| `journal.deleted` | IMPL | — (tombstone; also emits media.removed/vlog.deleted per attached media) | journal_repository.dart:121-129 |
| `media.added` | IMPL | — | media_repository.dart:53-60 |
| `media.removed` | IMPL | — | media_repository.dart:93-100; journal_repository.dart:111 |
| `vlog.deleted` | IMPL | — (tombstone; tier-aware delete per MediaStorage) | media_repository.dart:95; journal_repository.dart:111 |
| `workout.completed` | DOC | exercise count, total sets, total volume — NEVER set detail | (M1) |
| `workout.pr` | DOC | exercise, new est-1RM, previous best, session ref, rolling bodyweight + ratio at PR time | Coach/toast ONLY; vault NEVER reads it (L015/L049) |
| `workout.deleted` | DOC | — (tombstone; derived state re-derives L048) | |
| `habit.completed_revoked` | DOC | — (compensating revoke, transactional L062) | habits bridge: deleting auto-tracked session cleans check-in + revokes |
| `habit.rest_planned` | DOC | occurredAt = user-chosen day; writtenAt = device clock | per-habit one-tap rest flag; streak FREEZE (L139) |
| `nutrition.logged` | DOC | mealType, kcal/macro totals, source, actual eat dateKey | pack-consumes also emit (L097); no recipe detail |
| `nutrition.removed` | DOC | — (transactional revoke L098) | |
| `body.weighed` | DOC | — | per canonical first-of-day weigh-in (L097) |
| `body.weighed_revoked` | DOC | — (transactional revoke L098) | |
| `reflection.created` | DOC (M2) | — | |
| `goal.completed` | DOC (M1) | — | rare user-declared; `goal.progress` was REMOVED (L155 → D049) |
| `task.completed` | DOC (M1) | — | |
| `study.session` | DOC (future) | — | |
| `relationship.event` | DOC (future) | — | |

### 3.3 Event rules that constrain the input map

- Immutability: edits append with `supersedesId`; deletions are tombstones
  (Database.md:278-280).
- Midnight rule (L053): dayKey = capture-time LOCAL date; exception: nutrition
  backdating files under actual eat date.
- Tombstone rule (L044): delete ALWAYS wins over earlier edit; entities never
  resurrect.
- Cross-domain revoke pattern (L098): habit → habit.completed_revoked,
  journal → journal.edited/deleted, nutrition → nutrition.removed,
  body → body.weighed_revoked. No per-set/per-slot/routine-noise events —
  exercise_sets & routine_slot_logs are entity-only.
- Negative-XP events: written by gamification engine when re-derivation
  removes an awarded PR (L246); vlog discard symmetry (C11.2).
- Journal content NEVER in events — metadata only.
- Habits bridge (L062): auto-tracked habits (autoSource) write check-in in
  same transaction as session save; manual entries win.
- Event budget assumption: ~10k events/year personal scale; revokes add ~2k
  small rows/yr.

---

## 4. Repository surfaces — [IMPL] (only DB access path, Architecture.md:331-334)

### 4.1 `EventRepository` — event_repository.dart
- `append(EventRecord)` :9-24 (insert, immutable)
- `query({type, dayKey, entityType, entityId, from})` :26-49 (ordered asc by occurredAt)
- `eventsForDay(dayKey)` :51-53
- `eventExists({type, entityId, dayKey})` :55-68 (dedupe for miss-evaluator)
- `eventsOfTypeSince(type, dayKey)` :70-72

### 4.2 `JournalRepository` — journal_repository.dart
- `create({title, body, area, tags, at})` :15-62 (entity + journal.created, one transaction; payload wordCount/tags/area)
- `update(entry)` :64-96 (entity + journal.edited with supersedesId = previous event id)
- `delete(id)` :98-131 (soft-delete tombstone; cascade-deletes attached media rows + per-media events; video → vlog.deleted, else media.removed)
- `forDay(dayKey)` :133-144 (deletedAt null, createdAt within day)
- `recent({limit=50})` :146-153 (desc, deletedAt null)
- `byId(id)` :155-160 / `byIdRow(id)` :162-165
- `wordCount(body)` :168-172 — whitespace split count, trimmed, 0 if empty

### 4.3 `HabitRepository` — habit_repository.dart
- `create({name, area, at})` :14-38
- `listActive()` :40-46
- `setActive(id, active)` :48-52
- `rename(id, name)` :54-58
- `checkIn(habitId, {at, note})` :60-87 — idempotent per (habitId, dayKey); entity + habit.completed in one transaction; manual wins
- `uncheckIn(habitId, {at})` :91-105 — deletes check-in AND its habit.completed event (compensating delete, not an event)
- `checkInsForDay(dayKey)` :107-113 / `checkInsForHabit(habitId)` :115-121
- `checkedDayKeys(habitId)` :123-126
- `streak(habitId, {today})` :128-131 — pure `computeStreak` :134-153: consecutive days ending today (if checked) else yesterday; gap → 0

### 4.4 `MediaRepository` — media_repository.dart
- `save(media, bytes)` :15-63 — sets storageRef='blob:<id>'; entity + blob (via adapter) + media.added in one transaction
- `loadBlob(id)` :65-69 — adapter.read(storageRef)
- `forEntry(entryId)` :71-77 / `byId(id)` :79-82
- `delete(id)` :84-102 — adapter.delete + row delete + vlog.deleted/media.removed event, transactional
- `setThumbnail(id, bytes)` :104-111 (thumbnailRef='blob:thumb:<id>', thumbnailBlob)
- `loadThumbnail(id)` :113-117

### 4.5 `SettingsRepository` — settings_repository.dart
- `get(key)` :8-12 / `set(key, value)` :14-19 (insertOrReplace) / `getOrSet(key, fallback)` :21-26

### 4.6 `ExportImportRepository` — export_import_repository.dart
- `exportAll()` :65-136 — full snapshot; see §8
- `restore(bundle)` :138-289 — format/formatVersion/schemaVersion validation; full-replace transactional; sha256 verify; missing/hash-mismatch → RestoreReport soft failures; refuses newer-schema backups
- `_clearAll()` :291-300 — delete order: habit_checkins, media_attachments, events, coach_outputs, journal_entries, habits, areas, settings
- Classes: `MediaManifestEntry` :13-38, `ExportBundle` :40-52, `RestoreReport` :54-59

### 4.7 Adapter: `LocalMediaAdapter` — local_media_adapter.dart
- `save(id, bytes)` :8-13 (updates blobData; returns 'blob:<id>')
- `read(ref)` :15-21 (only refs starting 'blob:')
- `delete(ref)` :23-29 (nulls blobData)
- [DOC future] `CloudMediaAdapter` interface: upload(file)→ref, download(ref)→file, delete(ref), list(prefix) — provider-agnostic, hard rule (Architecture.md:362-372)

### 4.8 Providers — `lib/data/providers.dart`
dbProvider (:15-17, overridden at startup), eventRepoProvider, journalRepoProvider,
habitRepoProvider, mediaRepoProvider (LocalMediaAdapter wired :64-70),
settingsRepoProvider, mediaCaptureProvider (WebMediaCapture), exportRepoProvider,
coachServiceProvider (:84-90). FutureProviders read settings keys: deviceMode
('dev_device_mode'), themeKey ('theme'), welcomeDone ('welcome_done').

---

## 5. Models — [IMPL]

All in `lib/data/models/`: JournalEntry, MediaAttachment, Habit, HabitCheckin,
EventRecord, CoachOutput (CoachOutput: id, kind, dateKey, payload — coach_output.dart:3-42). All carry toJson/fromJson for the backup format.

---

## 6. Media / vault — doc rules constraining input [DOC unless noted]

- Three-tier model (MediaStorage.md:135-183): Tier 1 local (thumbnails ALWAYS
  local on every device; small media file-cache), Tier 2 Drive vault (15 GB
  ceiling, small media only), Tier 3 PC folder archive (free/unlimited, long
  vlogs; access = folder open or manual re-import on that same PC ONLY).
- Archived row: blob leaves, metadata stays permanently; storageRef → PC path;
  syncState → 'archived-to-pc'; adopted files reuse same semantics (J7e).
- Duration measured exactly once (phone recorder / PC header parse); corrupt →
  NULL, never counts.
- Vlog lifecycle: Keep (row + duration + optional title) / Discard (file
  wiped, no row, zero trophies). Tier-aware delete; PC-adopted → app NEVER
  removes file, un-lists + "do-not-readopt" list.
- No silent deletion, ever.
- Storage meter: warn 70%, hard-warn 90% (MediaStorage.md:126-133); adopted
  rows excluded; vlog local buffer = rolling 3-5 days (default 5) cache,
  nudge-only (MediaStorage.md:259-268).
- Physique timeline: anchored to journal entry tagged `health` + `physique`
  (hidden system tag); queries media_attachments by tag; zero new tables.
- Dedup: contentHash (sha256) before save; remux → pluggable logical key
  (open item).
- J7 auto-adopt: one chosen folder (File System Access API), Chromium-only
  auto-scan; guardrails: never deletes/moves/renames, "file missing" stub,
  NO XP, facts-only privacy.
- Export: PC-archived = metadata-only (exported:false); restore elsewhere →
  soft-failure stubs.

---

## 7. Coach — stored interactions

### 7.1 CoachService (implemented M0 stub) — coach_service.dart
- `refresh({on})` :17-74 — miss-evaluator: for each ACTIVE habit, walks days
  from habit.createdAt to yesterday, writes idempotent `habit.missed` events
  (dedupe by existing events per habit); then CoachRuleEngine.evaluate →
  writes `coach_outputs` rows, idempotent per (kind, dateKey) — never
  overwrites/duplicates today's output.
- `todayOutput({on})` :76-83 — kind='nudge' for today, limit 1.
- `dismissToday({on})` :85-90 — DELETES today's nudge row (auto-written +
  deletable rule).
- CoachRuleEngine.evaluate (coach_rule_engine.dart): ≥3 consecutive missed
  dayKeys per habit → nudge "Three days without {habit} — what's in the way?"

### 7.2 `coach_outputs` kinds — 9-kind dictionary (Database.md:187-204, L156)

| kind | payload shape |
|---|---|
| `daily_note` | daily Coach note (habits/journal/fitness summary + one line per strictness) |
| `nudge` | habit-miss / journal-drought / meal-window catch-up pokes (quiet-week aware) |
| `briefing` | morning briefing card: today's slots + done-vs-missing + macro-gap bar |
| `check_in_weekly` | merged weekly review (replaces "weekly review" label) |
| `nutrition_checkup` | weekly nutrition stats: kcal vs target %, protein hit-rate, weekly compliance |
| `milestone_review_goal` | goal-end review card: WON or EXPIRED vintage, computed final value beside target |
| `milestone_review_anniversary` | "since you started" review anchored to first journal entry |
| `phase_close` | phase close report (derived summary + one Coach line) |
| `pattern_alert` | pattern alerts (rest-day training, stall recovery, adherence patterns) |

- Every Coach line is an auto-written, deletable coach_outputs row
  (CoachSystem.md:21). Milestone-review cadence editable ladder: +1m/3m/6m/1y/
  yearly (UIUX.md:308). Coach privacy stamp: facts-only OR text-access opt-in
  (L158/S025); never quotes journal text.

---

## 8. Backup / export artifacts — [IMPL]

### 8.1 File format (Database.md:301-361; export_import_repository.dart:114-134)

`PersonalOS-backup-YYYY-MM-DD-HHmm.json`:
- Top: format='PersonalOS-backup', formatVersion=2 (additive from 1, L042/L095),
  schemaVersion (int), exportedAt (ISO-8601), user='personalos'
- data{} — IMPL today: settings, areas, journalEntries, mediaAttachments
  (metadata only), habits, habitCheckins, events, coachOutputs
- data{} — DOC (formatVersion 2 enumeration): goals, milestones, tasks,
  weekPlans, weekPlanSlots, workoutTemplates, workoutTemplateExercises,
  workouts, exerciseSets, muscleGroups, exerciseMuscleGroups, exercises,
  bodyMetrics, phases, deloadMarkers, nutrition_logs, nutrition_recipe,
  meal-types, day_templates, day_template_slots, routine_days,
  routine_slot_logs, periods, limitations. nutrition_food_cache NOT in
  enumeration (regenerable).
- media{}: manifestVersion=1, files=[{id, fileName, mimeType, sizeBytes,
  sha256, exported}] — exported:false for missing/PC-archived blobs
- Media blobs exported as files (web: anchor/blob download), verified by
  sha256 on import; restore is FULL-REPLACE with confirmation; missing files
  = soft failure list.

### 8.2 Corruption recovery (D021, Database.md:381-399)
Launch integrity check → on failure NEVER auto-restore → recovery mode
(block writes, recovery screen) → export-what's-readable first → prompt
restore from last export.

---

## 9. Seed data (inputs that exist before user input)

### 9.1 Areas — [IMPL] `lib/core/constants.dart:1-19`
health, learning, career, relationships, projects, self_improvement, finance
(+ labels). User-extendable later (docs say so; no code path yet).

### 9.2 Exercises — [DOC] Database.md:55-76 (~44, L266, verbatim)
- Push (11): Bench Press, Incline Bench, OHP, DB OH Press, Dips, Push-ups,
  Lateral Raise, Chest Fly, Pec Deck, Triceps Pushdown, Overhead Triceps Ext.
- Legs (9): Squat, Leg Press, Hack Squat, Bulgarian Split Squat, Walking
  Lunges, Leg Extension, Hamstring Curl, RDL, Calf Raise (standing + seated)
- Pull (11): Deadlift, Barbell Row, Lat Pulldown, Seated Row, Face Pulls,
  Pull-ups, Chin-ups, Barbell Curl, DB Curl, Rear-delt Flye, Shrugs
- Core (6): Crunch, Cable Crunch, Plank, Hanging Leg Raise, Russian Twist,
  Side Plank
- Cardio (6): Treadmill Walk, Treadmill Run, Cycling, Rowing, Swim, Stairs
Big-5 profile lifts tracked ON by default: Bench Press, Squat, Deadlift, OHP,
Barbell Row. Muscle tags assigned once per exercise (2-level hierarchy:
legs/push/pull/core → children).

### 9.3 Meal types — [DOC] seeded breakfast/lunch/dinner/snack (Database.md:36)

### 9.4 M0 onboarding seeds — [IMPL] `lib/core/constants.dart`
- seedHabitNames :21-32 — 10 habits with baselines: Morning workout 0.72,
  Read 20 pages 0.65, Meditate 10 min 0.80, Drink 2L water 0.85,
  Study NEET material 0.55, Journal evening 0.60, Call family 0.40,
  Work on project 0.50, Plan tomorrow 0.70, Screens off by 11pm 0.50
  (baseline values used by onboarding/gamification, not stored in schema)
- seedEntryTemplates :34-55 — 20 journal sentence templates with {placeholders}
- seedTags :57-70 — 12 tags: focus, low-day, win, streak, rest, gym, study,
  family, project, energy, discipline, reflection
- seedFillers :72-103 — 27 placeholder dictionaries for the templates
- Device mode: 'dev_device_mode' ∈ auto|mobile|desktop (device_mode.dart:7),
  forced widths 390/1280 (device_mode.dart:22-30)
- Theme key: 'theme' (inkTheme default), welcome: 'welcome_done'

---

## 10. Settings keys (schema-relevant) — [DOC] Database.md:206-219, D003

Settings table, NOT profile fields. Keys:
- units `kg|lb` / `cm|in` — display conversion only (O8)
- height, age, sex, activity factor — Mifflin-St Jeor TDEE inputs
- manual TDEE override — freezes auto-recompute AND protein/fat g/kg basis until cleared
- protein g/kg per phase — cut 2.0 / bulk 1.8 / maintain 1.6, editable, per-Area override
- fat floor g/kg — 0.6, editable up
- food macro lookup toggle — default ON; OFF = plain manual entry (switches behavior, never deletes data)
- grace default — 1 grace day per 7-day window (streak forgiveness budget)
- PO auto-suggestions GLOBAL KILL-SWITCH — default on
- (Coach group, UIUX.md:308): milestone-review cadence ladder (1m/3m/6m/1y/yr), etc.
- [IMPL] keys in code: theme, welcome_done, dev_device_mode
- Non-togglable (NOT-OFFERED, S062): formula constants — Epley 1RM,
  Mifflin-St Jeor, Wilks/DOTS, 7700 kcal/kg (Architecture.md:207-210, 398-400)
- Other (Database.md:21): timezone, displayName, coachStrictness, storage warnings seen

---

## 11. Analytics owner catalog (derived, NO storage) — [DOC] Architecture.md:165-192

One H3 owner per derived stat; rounding once, inside owner:
rollingAvgWeight(dateKey) [7-day, thin-data guard], deriveMacros(dateKey)
[kcalTarget = baseTarget + Σ today's session burns; protein/fat/carbs
remaining; collision flag], adherenceWeek(), strengthSnapshot(exerciseId,
{asOf}) [record-mode aware L247], dayActivityScore [workout 3 cap 1/day;
meal 1 cap 3/day; weigh-in 1 cap 1/day; journal 1 cap 2/day; habit 0.5
uncapped; tint 0/1-2/3-5/6+], totalVolume [weight-mode sets only L161],
goalProgress(goalId), paceVerdict(target, rollingTrend) [ahead/on-track/
behind], sameMonthDay, dayDomainPresence, phaseStartWindow, phaseAdjacency,
yearlyPass, consecutiveYears, anniversaryWindow (±7 days), rollingWindowMean
(series, windowDays) [the ONLY rolling-average math, 7-day default/14-day
optional], est1RM [only Epley conversion; 1-12 rep guard; record-mode
routing], qualifyingEntry, robotOverlapWindow/runAlive.

Strength: est-1RM ÷ rolling bodyweight ratio; big-5 seeded tier tables;
overall level = avg of big-5 ratios (Wilks-style); records vault derived-only
(L031); strength standards are plain Dart pure functions (no deps);
progression styles: LINEAR-WEIGHT / REP-FIRST / BODYWEIGHT (L034), AUTO by
default, override at every level + global kill-switch.
Energy: Mifflin-St Jeor BMR (+5/−161) × activity factor (non-training only) →
TDEE; training expenditure DERIVED from logged sessions (cardio kcalBurned +
MET; strength tonnage/duration band), added separately (NU9); MET formula
`MET × 3.5 × bodyweightKg × minutes / 200`; Atwater factors; carbs as
remainder; no-phase fallback: weight goal → derived rate, else maintain
(TDEE, protein 1.6, fat floor, carbs remainder).
Fitness entry: auto-assort paste parser (L018, M1-or-M2, offline no AI);
last-time freshness tiers (L040): <2wk full hint, 2-4wk quieted with date,
>4wk collapsed + PO suggestions pause (~90% of last-time baseline instead of
+2.5kg extrapolation); constants configurable in settings, no schema.

---

## 12. Gamification / achievements — NO stored tables [DOC]

XP, levels, streaks, achievements are DERIVED state (Architecture.md:160,
Gamification.md per doc map). Gamification engine reads events ONLY
(Architecture.md:40-42). The ONLY stored artifacts:
- The event log itself (XP source; negative-XP events on PR re-derivation
  removal, L246; vlog trophy revocation C11.2)
- habit_checkins rows (streak source)
- coach_outputs rows (trophy lines ride coach_outputs, CoachSystem.md:373)
No achievement/claim/progress tables exist or are planned.

---

## 13. Thresholds / rules / limits summary (input-relevant)

- One check-in per habit per day (UNIQUE habitId+dayKey); habit.missed unique
  per (habitId, dayKey) — idempotent evaluator
- Journal: multiple entries/day allowed; imported entries land on ORIGINAL
  date, never earn XP; achievement/cadence counters exclude imported rows
- Media: warn 70% / hard-warn 90% storage; vlog buffer 3-5 days nudge;
  duration NULL never counts; PC-adopted bytes excluded from meter
- Weigh-ins: canonical = first of day; later rows stored, excluded from
  series; delete promotes next
- Phases: ONE active; baseline = O3 rolling average at start
- Rep guard: est-1RM validity window 1-12 reps (not a toggle); rep-mode: no
  12-cap, best clean reps, addedLoadKg breaks ties
- PR: tracked-toggle; strictly-greater; ONE credit per exercise per session
- Events: ~10k/yr budget; revokes ~2k/yr
- Day activity score caps: workout 3/1d, meals 3/d, weigh-in 1/d, journal 2/d,
  habits 0.5 uncapped
- Migrations: additive-only; never delete columns; old backups importable
  (Database.md:291-299)
- Sync semantics (future): append-only UNION of event ids; LWW by timestamp,
  deviceId tie-break; tombstone wins (D019/D059)

---

## 14. Ambiguities / notes for the Life Tree input map

1. `media_manifest` table exists but is never written by current code —
   manifest built ad hoc at export. [AMBIGUOUS]
2. `nutrition_food_cache` fields unspecified; regenerable, excluded from
   backup. [AMBIGUOUS]
3. `week_plans` fields beyond id/name unspecified in Database.md. [AMBIGUOUS]
4. Habit `cadence` + `autoSource` doc fields not in code (L062 draft-schema).
5. All [DOC] health/routine/goal tables are input-able only after their
   additive migrations ship; the Life Tree map should probably mark them as
   designed surface with no current writes.
6. Coach strictness modes (coachStrictness setting key) exist in doc but M0
   coach has no strictness — M2.
7. Seeds (areas/onboarding) are code constants, not DB rows except areas
   (seeded into DB at create; `insertOrIgnore`).
8. `body_metrics` type = weight | measurement_* — the measurement_* subclass
   is unspecified (e.g. waist, hips). [AMBIGUOUS]
9. Day templates / routine kinds have a full enum (meal|pack|workout|activity|
   rest|sleep|weigh-in) — weigh-in slots write body_metrics type=weight.
10. Gamification "negative-XP event" — no event type string is specified
    in docs (mechanism described only). [AMBIGUOUS]
11. `uncheckIn` deletes the habit.completed event rather than writing a
    compensating revoke — a deliberate M0 simplification that differs from
    the doc's habit.completed_revoked pattern. Note for input-trace fidelity.

---

## 15. Counts

- Implemented tables: 9 (journal_entries, media_attachments, habits,
  habit_checkins, areas, settings, events, coach_outputs, media_manifest)
- Doc-specified tables total: 33 (+1 future `links`, not scheduled)
- Tables documented but NOT yet implemented: 24
- Fields: 59 implemented (16 in media_attachments alone); ~141 in doc-only
  tables (≈200 total; nutrition_food_cache + week_plans partially unspecified)
- Event types: 20 specified (8 emitted by current M0 code) + 2 future
- Repositories: 6 (+1 media adapter; +1 future CloudMediaAdapter)
- Models: 6
- coach_outputs kinds: 9
- Settings keys: ~12 schema-relevant [DOC] + 3 implemented (theme,
  welcome_done, dev_device_mode) + misc (timezone, displayName,
  coachStrictness, storage-warnings-seen)
- Backup formatVersion: 2; media manifestVersion: 1
- Seeds: 7 areas, ~44 exercises, 4 meal types, 10 habit names w/ baselines,
  20 journal templates, 12 tags, 27 filler dictionaries