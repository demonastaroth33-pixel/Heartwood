# PersonalOS — Milestone 0: Core Loop MVP — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship a working offline-first core loop (Dashboard → Journal → Habits → Coach stub → Export/Restore → Storage meter) on the locked Drift + SQLite-WASM backend, proving the M0 exit criteria.

**Architecture:** Layered (features → repositories → services → store), event-first, one write path. Every entity write happens in the same Drift transaction as its event. UI reads only through repositories; engines (Coach, streak, storage meter) are pure functions over repository/event inputs. Media touches storage only via `MediaRepository` → `LocalMediaAdapter`.

**Tech Stack:** Flutter Web / PWA, Drift 2.34 + drift_flutter + sqlite3 (WASM), Riverpod (state — **pending approval**, see Decision A), package:web (MediaRecorder/storage interop), build_runner (codegen).

## Global Constraints

- **Storage is LOCKED to Drift + SQLite-WASM** (DecisionLog D040, `StorageDecision.md`). Do NOT re-open the backend question; repositories keep a later swap contained.
- **Layer boundaries are non-negotiable:** features/ → repositories/ → services/ → store. UI never touches the DB. Services never touch widgets. Engines never touch repositories. Journal never touches media files directly — only via `MediaRepository`.
- **One write path:** entity + event in a single transaction; entities and events can never diverge. Events are immutable; edits append events with `supersedesId`; deletes are tombstones.
- **No new dependencies without a `docs/DecisionLog.md` entry + user approval** (AGENTS.md). Decisions A–C below are the M0 dependency/design gates.
- **No comments in code unless asked.** Match existing style.
- **TDD on every feature/bugfix:** failing test first. Core loop requires repository + integration coverage; engines get full unit coverage; UI is dashboard smoke only (D022).
- **flutter analyze clean + flutter test green** before claiming any task done (verification-before-completion: show the output).
- **Security gate before any commit touching storage / import-export / auth:** load `owasp-security`, review the diff, present findings, get user approval.
- **After each phase's tests are green:** run `code-simplifier` on the diff only, then the user reads the diff.
- **After each phase:** write a `docs/Retrospectives.md` entry and encode ≥1 lesson into AGENTS.md or DecisionLog.
- **Git commit/push, flutter run/build, and every file edit require explicit user approval** (permission gates). Do not batch past them.
- **Playwright owns:** (a) PWA persistence test, (b) export→wipe→restore round-trip through the real UI. NOT widget assertions (that is `integration_test`). iPhone PWA verification is manual, always.
- **UIUX.md wins over frontend-design/impeccable on any conflict — say so explicitly if one comes up.**
- Dates in `YYYY-MM-DD`; `dayKey` = capture-time **local** date (midnight rule, L053).

---

## Decision Points (CONFIRMED 2026-08-21 — user review)

- **Decision A — Riverpod: APPROVED.** Add `flutter_riverpod` (DecisionLog D078 entry + `flutter pub add flutter_riverpod`) before Phase 2. Providers wrap repositories; engines stay pure.
- **UI skills toggle: DEFERRED to Phase 2 start (user confirmed 2026-08-21).** Move `frontend-design` + `impeccable` from `.opencode/skills-off/` → `.opencode/skills/` and restart opencode immediately before Phase 2 (UI) begins; move them back OFF after Phase 4. Not toggled during plan review / Phases 0–1.
- **Decision B — Media capture: CONFIRMED — `image_picker` package.** Vlog = browser `MediaRecorder` via package:web (already in pubspec, no new dep). Photo capture = `image_picker` (new dependency — needs its own DecisionLog entry + user approval at Phase 4; handles web capture + multiple files in one API). The `image_picker_web` implementation may not offer a real camera on desktop — camera-on-device is verified on the iPhone PWA (manual, Step 4.6); desktop uses file-pick fallback.
- **Decision C — Media blob storage: CONFIRMED.** Blobs live in a Drift `BLOB` column on `media_attachments` (matches the spike evidence D025 + existing stub + MediaStorage.md "blobs in the storage backend"); `storageRef` = `blob:<id>`. Thumbnails are a separate small blob in the same table (`thumbnailRef`).
- **Decision D — `habit.missed` emission: CONFIRMED — idempotent daily miss-evaluator.** On dashboard load: for each active habit and each past day (up to yesterday) with no check-in and no existing `habit.missed` event, write one `habit.missed` event (unique per (habitId, dayKey) so re-runs never duplicate). Coach scans these.
- **Decision E — Streak (M0 "simple"):** current streak = consecutive days with a check-in, ending today (if today checked) or yesterday (if today not yet checked); any earlier gap resets. Grace/quiet-week/vacation shields are M2 (Gamification.md) — out of M0 scope.
- **Decision F — Schema version:** nothing has shipped; the stub never deployed. Reset to `schemaVersion = 1` = full M0 schema in `onCreate`. Future changes are additive migrations 1→N.

---

## File Structure

```
lib/
  core/
    constants.dart          (exists — keep as-is)
    ids.dart                (exists — keep as-is)
    theme.dart              (new — dark-first theme, M0)
  data/
    database/
      database.dart         (modify — full M0 schema + migrations + integrity check)
      database.g.dart       (generated by build_runner)
    models/
      journal_entry.dart    (new)
      habit.dart            (new)
      habit_checkin.dart    (new)
      media_attachment.dart (new)
      coach_output.dart     (new)
      event_record.dart     (new — wraps the events row)
    repositories/
      journal_repository.dart    (new)
      habit_repository.dart      (new)
      media_repository.dart      (new — interface)
      event_repository.dart      (new — single event write API, transactional)
      settings_repository.dart   (new)
      export_import_repository.dart (new)
    adapters/
      local_media_adapter.dart   (new — Drift BLOB backing)
  services/
    coach/
      coach_rule_engine.dart     (new — 3-miss rule, pure)
      coach_service.dart         (new — evaluates on dashboard load, writes coach_outputs)
    media/
      media_capture.dart         (new — MediaRecorder + photo input interop)
    storage/
      storage_meter.dart         (new — estimate() + DB bytes)
  features/
    dashboard/
      dashboard_screen.dart
      widgets/ (today_section, coach_note_block, storage_meter_block, placeholders)
    journal/
      journal_screen.dart
      journal_compose_screen.dart
    habits/
      habits_screen.dart
    settings/
      settings_screen.dart
      data_screen.dart           (export / restore UI)
  widgets/
    nav_shell.dart               (bottom bar mobile / left rail desktop)
  app.dart                       (provider scope, theme, routes)
  main.dart                      (modify — bootstrap DB, run app)
test/
  data/repositories/…            (mirror lib/)
  services/coach/…               (engines — full unit coverage)
  services/media/…               (streak + storage math)
  export_restore_roundtrip_test.dart (integration)
```

---

## Phase 0 — Build repair + AGENTS.md hygiene

**Files:**
- Modify: `AGENTS.md` (remove the stale "storage backend is NOT decided" line; state the Drift + SQLite-WASM lock, pointing to `StorageDecision.md` D040)
- Modify: `lib/data/database/database.dart` (see Phase 1 — this phase only gets it to compile via codegen)
- Run: `dart run build_runner build --delete-conflicting-outputs`

- [ ] **Step 0.1: Regenerate code and restore a clean analyze baseline**

Run: `dart run build_runner build --delete-conflicting-outputs`
Run: `flutter analyze`
Expected: clean (0 issues). If `database.g.dart` generation surfaces stub-only issues (e.g. `BlobColumn` is spike-only, `schemaVersion` 2), they are fixed in Phase 1, not here — but the build must at least pass codegen.

- [ ] **Step 0.2: AGENTS.md storage-lock doc hygiene (user-approved edit)**

Edit `AGENTS.md` "Orientation" section: replace
`Storage backend is NOT decided — read docs/StorageDecision.md before any storage
code; do not assume Drift, SQLite, or IndexedDB. Lock happens at M0, before M1.`
with
`Storage backend is LOCKED — Drift + SQLite (WASM), DecisionLog D040 (see
docs/StorageDecision.md + docs/StorageSpikeStatus.md). Do not re-open the
backend question without new measured evidence and a new DecisionLog entry.`
Also update the "Before any storage-decision work" line: point to
`docs/StorageSpikeStatus.md` only as historical record + regression reference.

- [ ] **Step 0.3: Commit (user approval)**

```bash
git add AGENTS.md
git commit -m "docs: AGENTS.md reflects locked Drift + SQLite-WASM storage decision (D040)"
```

---

## Phase 1 — Data layer skeleton (repositories only, no UI)

Repositories are the only DB access path. Each repository writes entity + event in ONE Drift transaction.

**Files:**
- Modify: `lib/data/database/database.dart`
- Create: `lib/data/models/*.dart`
- Create: `lib/data/repositories/*.dart`
- Test: `test/data/repositories/*_test.dart`

### Task 1.1: Full M0 schema + codegen

**Interfaces:**
- Consumes: existing `lib/core/constants.dart` (seed areas), `lib/core/ids.dart`
- Produces: `AppDatabase` with tables: `journal_entries`, `media_attachments`, `habits`, `habit_checkins`, `areas`, `settings`, `events`, `coach_outputs`, `media_manifest`; `schemaVersion = 1`; `integrityCheck()`; `tableCounts()`

- [ ] **Step 1.1.1: Write the schema test (generation smoke)**

Create `test/data/database/schema_test.dart`:

```dart
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';

void main() {
  test('M0 schema creates cleanly and seeds areas', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await db.customStatement('PRAGMA foreign_keys = ON');
    final counts = await db.tableCounts();
    expect(counts['areas'], seedAreas.length);
    expect(counts['events'], 0);
  });

  test('integrity check passes on a fresh DB', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final result = await db.integrityCheck();
    expect(result, isNotEmpty);
    expect(result.first, 'ok');
  });
}
```

Run: `flutter test test/data/database/schema_test.dart` — Expected: FAIL (no generated code / tables).

- [ ] **Step 1.1.2: Rewrite the schema per Database.md**

In `lib/data/database/database.dart`:

```dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../core/constants.dart';

part 'database.g.dart';

class JournalEntries extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().nullable()();
  TextColumn get body => text()();
  TextColumn get area => text().nullable()();
  TextColumn get tagsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  BoolColumn get imported => boolean().withDefault(const Constant(false))();
  TextColumn get importHash => text().nullable()();
}

class MediaAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get entryId => text().nullable().references(JournalEntries, #id)();
  TextColumn get fileName => text()();
  TextColumn get mimeType => text()();
  IntColumn get sizeBytes => integer()();
  IntColumn get durationSec => integer().nullable()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get syncState => text().withDefault(const Constant('local-only'))();
  TextColumn get storageRef => text().withDefault(const Constant(''))();
  TextColumn get thumbnailRef => text().nullable()();
  TextColumn get contentHash => text().nullable()();
  TextColumn get archivedOnDevice => text().nullable()();
  BoolColumn get adopted => boolean().withDefault(const Constant(false))();
  BlobColumn get blobData => blob().nullable();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Habits extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get area => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}

class HabitCheckins extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text().references(Habits, #id)();
  TextColumn get dayKey => text()();
  DateTimeColumn get completedAt => dateTime()();
  TextColumn get note => text().nullable()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {habitId, dayKey},
      ];
}

class Areas extends Table {
  TextColumn get id => text()();
  TextColumn get label => text()();
  BoolColumn get userDefined => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@TableIndex(name: 'idx_events_type_day', columns: {#type, #dayKey})
@TableIndex(name: 'idx_events_area_day', columns: {#area, #dayKey})
@TableIndex(name: 'idx_events_entity', columns: {#entityType, #entityId})
class Events extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get dayKey => text()();
  TextColumn get area => text().nullable()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  IntColumn get payloadVersion => integer().withDefault(const Constant(1))();
  TextColumn get payload => text()();
  TextColumn get supersedesId => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CoachOutputs extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()();
  TextColumn get dateKey => text()();
  TextColumn get payload => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MediaManifest extends Table {
  TextColumn get id => text()();
  TextColumn get mediaId => text()();
  TextColumn get sha256 => text().nullable()();
  BoolColumn get exportedIn => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [
  JournalEntries,
  MediaAttachments,
  Habits,
  HabitCheckins,
  Areas,
  Settings,
  Events,
  CoachOutputs,
  MediaManifest,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.open({QueryExecutor? executor})
      : super(executor ?? driftDatabase(name: 'personalos'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedAreas();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  Future<void> _seedAreas() async {
    for (final slug in seedAreas) {
      await into(areas).insert(
        AreasCompanion.insert(
          id: slug,
          label: areaLabels[slug] ?? slug,
          userDefined: const Value(false),
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  Future<List<String>> integrityCheck() async {
    final rows = await customSelect('PRAGMA integrity_check').get();
    return rows.map((r) => r.data.values.first.toString()).toList();
  }

  Future<Map<String, int>> tableCounts() async {
    const tableNames = <String>[
      'settings',
      'areas',
      'journal_entries',
      'media_attachments',
      'habits',
      'habit_checkins',
      'events',
      'coach_outputs',
      'media_manifest',
    ];
    final result = <String, int>{};
    for (final name in tableNames) {
      final row = await customSelect(
        'SELECT COUNT(*) AS c FROM $name',
      ).getSingle();
      result[name] = row.read<int>('c');
    }
    return result;
  }
}
```

- [ ] **Step 1.1.3: Regenerate and verify**

Run: `dart run build_runner build --delete-conflicting-outputs`
Run: `flutter test test/data/database/schema_test.dart` — Expected: PASS
Run: `flutter analyze` — Expected: clean

- [ ] **Step 1.1.4: Commit (user approval)**

```bash
git add lib/data/database test/data/database
git commit -m "feat(data): full M0 Drift schema (schemaVersion 1) + area seed + integrity check"
```

### Task 1.2: Domain models

**Files:**
- Create: `lib/data/models/journal_entry.dart`, `habit.dart`, `habit_checkin.dart`, `media_attachment.dart`, `coach_output.dart`, `event_record.dart`
- Test: `test/data/models/models_test.dart`

- [ ] **Step 1.2.1: Write failing model tests (JSON round-trip + dayKey helpers)**

```dart
// test/data/models/models_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/models/journal_entry.dart';

void main() {
  test('JournalEntry JSON round-trips title/body/area/tags/imported', () {
    final e = JournalEntry(
      id: 'je-1',
      title: 'T',
      body: 'B',
      area: 'health',
      tags: const ['win'],
      createdAt: DateTime.utc(2026, 8, 1),
      updatedAt: DateTime.utc(2026, 8, 1),
      imported: false,
      importHash: null,
    );
    final restored = JournalEntry.fromJson(e.toJson());
    expect(restored.body, 'B');
    expect(restored.tags, ['win']);
  });
}
```

- [ ] **Step 1.2.2: Implement models**

`JournalEntry` (id, title?, body, area?, List<String> tags, createdAt, updatedAt, imported, importHash?) with `toJson`/`fromJson` (tags serialized as JSON array), plus `JournalEntry.fromRow(JournalEntryRow row)`. `Habit` (id, name, area?, createdAt, active). `HabitCheckin` (id, habitId, dayKey, completedAt, note?). `MediaAttachment` (id, entryId?, fileName, mimeType, sizeBytes, durationSec?, title?, capturedAt, syncState, storageRef, thumbnailRef?, contentHash?, archivedOnDevice?, adopted). `CoachOutput` (id, kind, dateKey, payload). `EventRecord` (id, type, occurredAt, dayKey, area?, entityType, entityId, payloadVersion, payload, supersedesId?).

- [ ] **Step 1.2.3: Run tests + analyze**

Run: `flutter test test/data/models/models_test.dart` — PASS
Run: `flutter analyze` — clean

- [ ] **Step 1.2.4: Commit (user approval)**

### Task 1.3: EventRepository — single event write API

**Interfaces:**
- Consumes: `AppDatabase`, `ids.dart` (`newId`, `dayKey`), `EventRecord`
- Produces: `EventRepository`:
  - `Future<void> append(EventRecord event)` — insert (immutable)
  - `Future<List<EventRecord>> query({String? type, String? dayKey, String? entityType, String? entityId, DateTime? from})`
  - `Future<List<EventRecord>> eventsForDay(String dayKey)` — used by dashboard/Coach
  - `Future<bool> eventExists({required String type, required String entityId, required String dayKey})` — used by the idempotent miss-evaluator
  - `Future<List<EventRecord>> eventsOfTypeSince(String type, String dayKey)` — 3-miss scan

- [ ] **Step 1.3.1: Failing test — append + query + immutability + indexes used**

```dart
// test/data/repositories/event_repository_test.dart
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/repositories/event_repository.dart';

void main() {
  late AppDatabase db;
  late EventRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = EventRepository(db);
  });
  tearDown(() => db.close());

  test('append then query by type+day', () async {
    final e = EventRecord(
      id: 'ev-1', type: 'habit.completed',
      occurredAt: DateTime(2026, 8, 1, 9), dayKey: '2026-08-01',
      entityType: 'habit', entityId: 'h-1', payloadVersion: 1, payload: '{}',
    );
    await repo.append(e);
    final rows = await repo.query(type: 'habit.completed', dayKey: '2026-08-01');
    expect(rows, hasLength(1));
    expect(rows.first.entityId, 'h-1');
  });

  test('eventExists dedupes per (type, entityId, dayKey)', () async {
    final e = EventRecord(
      id: 'ev-1', type: 'habit.missed',
      occurredAt: DateTime(2026, 8, 1, 9), dayKey: '2026-08-01',
      entityType: 'habit', entityId: 'h-1', payloadVersion: 1, payload: '{}',
    );
    await repo.append(e);
    expect(await repo.eventExists(type: 'habit.missed', entityId: 'h-1', dayKey: '2026-08-01'), isTrue);
    expect(await repo.eventExists(type: 'habit.missed', entityId: 'h-1', dayKey: '2026-08-02'), isFalse);
  });
}
```

- [ ] **Step 1.3.2: Implement** — thin wrappers over `db.events` with the indexed columns; `eventExists` uses a select on `(type, entityId, dayKey)`.

- [ ] **Step 1.3.3: Run tests + analyze — PASS, clean. Commit (user approval).**

### Task 1.4: JournalRepository + MediaRepository + LocalMediaAdapter

**Interfaces:**
- Consumes: `AppDatabase`, `EventRepository`, models, `ids.dart`
- Produces:
  - `JournalRepository.create({title?, body, area?, tags}) → JournalEntry` (writes entity + `journal.created` event in one transaction; payload = `{wordCount, tags, area}`)
  - `JournalRepository.update(entry)` (entity + `journal.edited` with `supersedesId` = previous event id)
  - `JournalRepository.delete(id)` (soft: set `deletedAt` + `journal.deleted` tombstone)
  - `JournalRepository.forDay(String dayKey)`, `JournalRepository.recent({int limit})`, `JournalRepository.byId(id)`
  - `MediaRepository.save(MediaAttachment, Uint8List bytes)` — persists via adapter + `media.added` event, transactional with the entry if `entryId` set
  - `MediaRepository.loadBlob(id) → Uint8List?`, `MediaRepository.forEntry(entryId)`, `MediaRepository.delete(id)` (row + `media.removed`/`vlog.deleted`)
  - `LocalMediaAdapter.save(String id, Uint8List bytes) → String ref`, `LocalMediaAdapter.read(String ref) → Uint8List?`, `LocalMediaAdapter.delete(String ref)` (ref format `blob:<id>`)

- [ ] **Step 1.4.1: Failing test — journal create writes entity + event atomically; delete is a tombstone; media save+load round-trip**

```dart
// test/data/repositories/journal_repository_test.dart
test('create writes entity and journal.created event in one transaction', () async {
  final entry = await journalRepo.create(body: 'Today I…', area: 'health', tags: const ['win']);
  expect(entry.id, isNotEmpty);
  final events = await eventRepo.query(type: 'journal.created', entityId: entry.id);
  expect(events, hasLength(1));
  final payload = jsonDecode(events.first.payload) as Map<String, dynamic>;
  expect(payload['wordCount'], greaterThan(0));
});

test('delete is a soft tombstone + journal.deleted event', () async {
  final entry = await journalRepo.create(body: 'x');
  await journalRepo.delete(entry.id);
  expect(await journalRepo.forDay(dayKey(DateTime.now())), isEmpty);
  final deletes = await eventRepo.query(type: 'journal.deleted', entityId: entry.id);
  expect(deletes, hasLength(1));
});

// test/data/repositories/media_repository_test.dart
test('save persists blob and media.added event; loadBlob round-trips', () async {
  final entry = await journalRepo.create(body: 'with media');
  final bytes = Uint8List.fromList(List.filled(2048, 7));
  final media = await mediaRepo.save(
    MediaAttachment(
      id: newId('ma'), entryId: entry.id, fileName: 'a.mp4',
      mimeType: 'video/mp4', sizeBytes: bytes.length, capturedAt: DateTime.now(),
      syncState: 'local-only', storageRef: '', adopted: false,
    ),
    bytes,
  );
  final loaded = await mediaRepo.loadBlob(media.id);
  expect(loaded, bytes);
  final evs = await eventRepo.query(type: 'media.added', entityId: media.id);
  expect(evs, hasLength(1));
});
```

- [ ] **Step 1.4.2: Implement** — `LocalMediaAdapter` writes `blobData` via `MediaAttachmentsCompanion(... blobData: Value(bytes))` and sets `storageRef = 'blob:<id>'`; `MediaRepository` delegates and appends events through `EventRepository` in the same transaction.

- [ ] **Step 1.4.3: Run tests + analyze — PASS, clean.**

- [ ] **Step 1.4.4: SECURITY GATE** — this task touches storage. Load `owasp-security`, review the diff (blob handling, no path traversal, no injection into JSON payloads), present findings to the user, get approval.

- [ ] **Step 1.4.5: Commit (user approval).**

### Task 1.5: HabitRepository + SettingsRepository

**Interfaces:**
- Consumes: `AppDatabase`, `EventRepository`, models, `ids.dart`
- Produces:
  - `HabitRepository.create({name, area?}) → Habit`; `HabitRepository.listActive()`; `HabitRepository.setActive(id, bool)`; `HabitRepository.rename(id, name)`
  - `HabitRepository.checkIn(habitId, {DateTime? at})` — writes `habit_checkins` row + `habit.completed` event, one transaction (manual wins; `note?` nullable)
  - `HabitRepository.checkInsForDay(dayKey)`, `HabitRepository.checkInsForHabit(habitId)`
  - `HabitRepository.streak(habitId, {DateTime? today}) → int` — **Decision E** simple streak: consecutive days ending today (if checked) else yesterday; a gap resets. Pure function over check-in dayKeys — unit-testable without a DB.
  - `SettingsRepository.get(key)`, `SettingsRepository.set(key, value)`, `SettingsRepository.getOrSet(key, fallback)`

- [ ] **Step 1.5.1: Failing test — streak pure function**

```dart
// test/services/habits/streak_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/repositories/habit_repository.dart';

void main() {
  test('streak counts consecutive days ending today or yesterday', () {
    final days = {'2026-08-01', '2026-08-02', '2026-08-03'};
    expect(computeStreak(days, today: '2026-08-03'), 3);   // today checked
    expect(computeStreak(days, today: '2026-08-04'), 3);   // today not yet checked, alive
    final broken = {'2026-08-01', '2026-08-03', '2026-08-04'};
    expect(computeStreak(broken, today: '2026-08-04'), 2); // gap resets
    expect(computeStreak(const {}, today: '2026-08-04'), 0);
  });
}
```

Implement `int computeStreak(Set<String> checkedDayKeys, {required String today})` as a top-level pure function in `habit_repository.dart`.

- [ ] **Step 1.5.2: Failing test — check-in writes entity + event transactionally; streak via repository**

```dart
// test/data/repositories/habit_repository_test.dart
test('checkIn writes checkin row + habit.completed event', () async {
  final habit = await habitRepo.create(name: 'Read');
  await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
  expect((await habitRepo.checkInsForDay('2026-08-01')), hasLength(1));
  final evs = await eventRepo.query(type: 'habit.completed', entityId: habit.id);
  expect(evs, hasLength(1));
});

test('duplicate check-in for same habit+day is idempotent (unique key)', () async {
  final habit = await habitRepo.create(name: 'Read');
  await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 8));
  await habitRepo.checkIn(habit.id, at: DateTime(2026, 8, 1, 20));
  expect(await habitRepo.checkInsForDay('2026-08-01'), hasLength(1));
});
```

- [ ] **Step 1.5.3: Implement** — check-in uses `insertOnConflictUpdate`/`insertOrIgnore` on the `(habitId, dayKey)` unique key so manual re-check is idempotent.

- [ ] **Step 1.5.4: Run tests + analyze — PASS, clean. Commit (user approval).**

### Phase 1 verification

- [ ] **Step 1.V: Full test run**

Run: `flutter test` — all green. Run: `flutter analyze` — clean.
Write `docs/Retrospectives.md` entry (Phase 1), encode ≥1 lesson (e.g. codegen must run before analyze can pass; repositories must own transactions). Commit (user approval).

---

## Phase 2 — Dashboard shell + navigation (empty-state blocks per UIUX.md)

**Precondition:** Decision A approved. frontend-design + impeccable toggled ON (deferred to Phase 2 start — move folders + restart opencode; user confirmed). **Mobbin integrated 2026-08-21:** the 5 `mobbin-*` skills (search, prompts, visuals, capture, flow-architect) moved from `.opencode/skills-off/` → `.opencode/skills/` — active after the next opencode restart; CLI `mobbin-mcp` v1.0.19 with `auth`/`skill`/`skills` commands; auth = user-run browser login (`mobbin-mcp auth`, cookie paste) — never in repo. UIUX.md wins on conflicts — state it if one arises.

**Mobbin usage rule (all UI phases):** request 3–5 real screens per UI block being built (nav shell, streak display, diary list, storage meter, compose flow) via the `mobbin-*` skills and use them as evidence in the implementation prompt; never dump whole libraries into context. Best-effort reference (unofficial API) — UIUX.md remains the arbiter.

**Files:**
- Create: `lib/app.dart`, `lib/core/theme.dart`, `lib/widgets/nav_shell.dart`, `lib/features/dashboard/dashboard_screen.dart`, `lib/features/dashboard/widgets/*.dart`, `lib/features/settings/settings_screen.dart`
- Modify: `lib/main.dart`, `pubspec.yaml`
- Test: `test/features/dashboard/dashboard_smoke_test.dart` (widget smoke only, D022)

- [ ] **Step 2.0: Add Riverpod (DecisionLog D078 + user-approved dependency)** — DONE 2026-08-21 (commit 257fab7).

- [ ] **Step 2.0b: Gather Mobbin reference screens (nav shell + dashboard blocks)**

Before building the shell, run the mobbin workflow: 3–5 real screens for (a) bottom-nav/rail app shells, (b) dashboard home with habit ticks + storage meter. Capture the findings into the implementation prompt as evidence (layout patterns, touch-target sizing, meter presentation). If auth is not yet completed, mark this step blocked-until-auth and proceed with UIUX.md + frontend-design guidance alone, then revisit.

- [ ] **Step 2.1: Write failing smoke test — dashboard renders nav shell + empty-state blocks**

```dart
// test/features/dashboard/dashboard_smoke_test.dart
testWidgets('dashboard shows Today, Coach note, placeholders and storage meter blocks',
    (tester) async {
  await tester.pumpWidget(ProviderScope(overrides: [], child: const App()));
  expect(find.text('Today'), findsOneWidget);
  expect(find.text('Coach'), findsWidgets);          // Coach daily note block
  expect(find.text('Goal progress'), findsOneWidget); // placeholder
  expect(find.text('Today’s tasks'), findsOneWidget); // placeholder
  expect(find.text('Streak / XP'), findsOneWidget);   // placeholder
  expect(find.textContaining('Storage'), findsOneWidget);
});
```

- [ ] **Step 2.2: Implement `NavShell` + `App` + theme**

`NavShell`: mobile = `NavigationBar` with 4 tabs (Dashboard, Journal, Habits, Settings); desktop (width ≥ 800) = `NavigationRail` with the same 4 items (UIUX.md navigation shell). Dashboard is the default tab. Theme: dark-first (`ColorScheme.fromSeed(brightness: Brightness.dark)`), system fonts, ≥44px touch targets. Routes via simple `IndexedStack` (no go_router dependency in M0 — Karpathy simplicity).

- [ ] **Step 2.3: Implement dashboard blocks as honest empty states**

Per UIUX.md order: **Today** (briefing card + habit ticks + journal quick-capture, fused — placeholders in this phase, wired in Phases 3–4), **Coach daily note** (neutral "day on track" placeholder), **Goal progress** (empty placeholder), **Today's tasks** (empty placeholder), **Streak/XP** (empty placeholder), plus always-visible **Storage meter** block (placeholder in this phase; real usage in Phase 7). Empty states are honest, one line, non-judgmental, no guilt UI.

- [ ] **Step 2.4: Run tests + analyze — smoke green, analyze clean.**

- [ ] **Step 2.5: Browser smoke (playwright)** — `flutter run -d web-server`, navigate, screenshot the dashboard shell. This is a smoke check only; widget assertions are the widget test above.

- [ ] **Step 2.6: Commit (user approval). Retrospective entry + lesson.**

---

## Phase 3 — Habits (check-ins + simple streaks)

**Precondition:** Phase 1 repositories + Phase 2 shell exist.

**Files:**
- Create: `lib/features/habits/habits_screen.dart`, `lib/features/habits/habit_list_tile.dart`, `lib/features/habits/habit_edit_sheet.dart`
- Modify: `lib/features/dashboard/widgets/today_section.dart` (habit ticks), `lib/features/habits/habits_providers.dart`
- Test: `test/features/habits/habits_widget_test.dart` (widget smoke) + repository tests already cover the engine

- [ ] **Step 3.1: Failing widget test — create habit, check it off, streak shows**

```dart
testWidgets('create habit → check off → streak of 1', (tester) async {
  // Provider overrides point at an in-memory AppDatabase
  await tester.pumpWidget(ProviderScope(overrides: [dbProvider.overrideWithValue(inMemoryDb)], child: const App()));
  await tester.tap(find.byIcon(Icons.add));
  await tester.enterText(find.byType(TextField), 'Read 20 pages');
  await tester.tap(find.text('Save'));
  await tester.pumpAndSettle();
  expect(find.text('Read 20 pages'), findsOneWidget);
  await tester.tap(find.byKey(const Key('check-habit')));
  await tester.pumpAndSettle();
  expect(find.text('1-day streak'), findsOneWidget); // simple streak display
});
```

- [ ] **Step 3.2: Implement Habits screen** — list active habits (one-tap check-off, `Key('check-habit')`), create/edit sheet (name, optional Life Area, daily cadence fixed), streak line per habit (uses `computeStreak`), recent 7/30-day dots (simple, no charts — UIUX.md). Archive = `setActive(false)`.

- [ ] **Step 3.3: Wire the Today section habit ticks** — today's habits with one-tap check-off (the fused Today block).

- [ ] **Step 3.4: Run tests + analyze — green, clean. Browser smoke (playwright) — create a habit, check it, screenshot.**

- [ ] **Step 3.5: Commit (user approval). Retrospective entry + lesson.**

---

## Phase 4 — Journal (text → photos → vlog + capture-time compression)

**Precondition:** Decision B (capture) + Decision C (blob storage) confirmed.

**Files:**
- Create: `lib/services/media/media_capture.dart` (MediaRecorder interop + photo file input), `lib/features/journal/journal_screen.dart`, `lib/features/journal/journal_compose_screen.dart`, `lib/features/journal/journal_providers.dart`
- Modify: `lib/data/adapters/local_media_adapter.dart` (thumbnail generation hook)
- Test: `test/services/media/media_capture_test.dart` (pure parts), `test/features/journal/journal_widget_test.dart` (smoke)

- [ ] **Step 4.1: MediaCapture — MediaRecorder + image_picker (DecisionLog entry + user-approved dependency)**

Use `package:web` (already a dependency) to drive browser `MediaRecorder` with capped `videoBitsPerSecond` (build-time value, documented in DecisionLog; target ~2 Mbps decent talking-head quality per MediaStorage.md) and capped resolution (720p cap). Photos via `image_picker` (DecisionLog D079 entry + `flutter pub add image_picker` + user approval before this step; web uses its federated implementation; desktop falls back to file-pick). Blobs returned as `Uint8List` + mimeType + duration (finished duration stamped once — D057).

> **Photo compression — stated explicitly (resolves the plan review ambiguity):** capture-time compression applies to **vlogs only**. Photos are stored **as-is, no re-compression** per MediaStorage.md §Capture Pipeline ("Photos captured via camera/file picker, stored as-is (no re-compression in MVP)") and Decision 11. Lossy photo compression (resize/re-encode at capture) is an **open item (D038)** — explicitly NOT to be implemented without a separate later decision. The M0 scope phrase "photos + long-form vlogs with capture-time compression" reads "capture-time compression" as modifying vlogs only; this is the documented, intentional reading, not an omission.

- [ ] **Step 4.2: Journal screen — chronological timeline, grouped by date** (UIUX.md). Entry tiles show title/body preview + media count; tap → compose/read.

- [ ] **Step 4.3: Compose flow — text + photos + vlogs + tags + Life Area picker**; timestamp defaults to now (editable). Media saved through `MediaRepository` (never directly). Edit/delete supported (edits append `journal.edited`; delete = soft tombstone).

- [ ] **Step 4.4: Widget tests + repository round-trip tests** (text entry with photo + vlog attachment; edit appends event; delete tombstones). Run tests + analyze — green, clean.

- [ ] **Step 4.5: SECURITY GATE** — media/blob path touches storage + user input. Load `owasp-security`, review (blob sizes, mime validation, no XSS via media URLs, JSON payload injection), present findings, get approval.

- [ ] **Step 4.6: On-device verification (manual, iPhone PWA)** — camera capture + MediaRecorder vlog recording work on device (M0 exit criterion). Toggle `frontend-design` + `impeccable` BACK OFF after this phase.

- [ ] **Step 4.7: Commit (user approval). Retrospective entry + lesson.**

---

## Phase 5 — Export → wipe → restore round-trip

**Files:**
- Create: `lib/data/repositories/export_import_repository.dart`
- Modify: `lib/features/settings/data_screen.dart` (export / restore UI), `lib/main.dart` (corruption-recovery boot check, D021)
- Test: `test/export_restore_roundtrip_test.dart` (integration — the D022 core-loop bar)

- [ ] **Step 5.1: Failing integration test — export all → wipe → restore → identical data**

```dart
// test/export_restore_roundtrip_test.dart
test('export → wipe → restore yields identical data', () async {
  final dbA = AppDatabase(NativeDatabase.memory());
  await seed(dbA); // journal entries + media blobs + habits + checkins + events + settings
  final json = await exportRepo.exportJson(dbA);
  final manifest = await exportRepo.buildMediaManifest(dbA); // id → sha256

  final dbB = AppDatabase(NativeDatabase.memory()); // fresh install = wipe
  await exportRepo.restore(dbB, json, manifest: manifest);

  final a = await snapshot(dbA); // ordered table dumps
  final b = await snapshot(dbB);
  expect(b, equals(a)); // identical rows incl. events and media hashes
});
```

- [ ] **Step 5.2: Implement the export format per Database.md** — one `PersonalOS-backup-YYYY-MM-DD-HHmm.json` file, `formatVersion: 2`, `schemaVersion`, `exportedAt`, `user: "personalos"`, `data: {settings, areas, journalEntries, mediaAttachments (metadata only), habits, habitCheckins, events, coachOutputs}`, `media: {manifestVersion: 1, files: [{id, fileName, mimeType, sizeBytes, sha256, exported}]}`. Media blobs exported alongside as files under `media/` (web: download via anchor/blob URL; sha256 via `crypto`). Restore: validate format/version/schemaVersion, run migrations if needed, replace all rows transactionally, re-import media, verify sha256, report missing files as soft failures. **No `nutrition_food_cache`-style derived tables in M0.**

- [ ] **Step 5.3: D021 corruption-recovery boot check** — on launch: `integrityCheck()`; on failure: recovery screen (block writes, offer export-what's-readable, then prompt restore). Widget smoke test for the recovery screen.

- [ ] **Step 5.4: Run tests + analyze — green, clean.**

- [ ] **Step 5.5: SECURITY GATE** — import/export touches storage + user files. Load `owasp-security`, review (path traversal on media filenames, JSON deserialization safety, no formula injection, zip-slip on media extraction), present findings, get approval.

- [ ] **Step 5.6: Playwright round-trip through the real UI** — create data in the running app → export → wipe (clear site data) → restore → assert identical data present.

- [ ] **Step 5.7: Commit (user approval). Retrospective entry + lesson.**

---

## Phase 6 — Coach stub (3-miss rule)

**Files:**
- Create: `lib/services/coach/coach_rule_engine.dart` (pure), `lib/services/coach/coach_service.dart` (evaluates on dashboard load)
- Modify: `lib/features/dashboard/widgets/coach_note_block.dart`
- Test: `test/services/coach/coach_rule_engine_test.dart` (full unit coverage)

- [ ] **Step 6.1: Failing unit test — 3 consecutive misses → reflection; 1–2 misses → silence**

```dart
// test/services/coach/coach_rule_engine_test.dart
test('3 consecutive missed days produces a gentle line; fewer days silence', () {
  // missedDayKeys = last 3 days for habit A
  final output = CoachRuleEngine.evaluate(missesByHabit: {'h-1': ['2026-08-01','2026-08-02','2026-08-03']});
  expect(output, hasLength(1));
  expect(output.first.kind, 'nudge');
  expect(output.first.payload, contains('Three days without'));

  final quiet = CoachRuleEngine.evaluate(missesByHabit: {'h-1': ['2026-08-03']});
  expect(quiet, isEmpty);
});
```

- [ ] **Step 6.2: Implement rule engine (pure) + service**

`CoachRuleEngine.evaluate(missesByHabit)` — for each habit with ≥3 consecutive missed `dayKeys`, emit a `coach_outputs` row (`kind: 'nudge'`, `dateKey: today`, payload = `"Three days without {habit} — what's in the way?"`). **Decision D:** `CoachService.refresh()` on dashboard load: run the miss-evaluator (write idempotent `habit.missed` events for active habits with no check-in on past days, up to yesterday), then group them into consecutive runs and call the rule engine, persisting outputs. Never overwrite/duplicate an output already written for today (`coach_outputs` idempotency by (kind, dateKey) — S020 discipline). No XP, no punishment, no strictness modes (M2).

- [ ] **Step 6.3: Wire the Coach daily-note block** — renders today's `coach_outputs` row or the neutral "day on track" placeholder. Deletable per CoachSystem.md.

- [ ] **Step 6.4: Run tests + analyze — green, clean. Playwright: create a habit, miss 3 days (backdate), reload → Coach line appears.**

- [ ] **Step 6.5: Commit (user approval). Retrospective entry + lesson.**

---

## Phase 7 — Storage meter + warnings (70% / 90%)

**Files:**
- Create: `lib/services/storage/storage_meter.dart`
- Modify: `lib/features/dashboard/widgets/storage_meter_block.dart`
- Test: `test/services/storage/storage_meter_test.dart`

- [ ] **Step 7.1: Failing unit test — threshold logic**

```dart
// test/services/storage/storage_meter_test.dart
test('warning levels: below 70 none, 70+ warn, 90+ hard warn', () {
  expect(warningLevel(used: 50, quota: 100), StorageLevel.none);
  expect(warningLevel(used: 70, quota: 100), StorageLevel.warn);
  expect(warningLevel(used: 90, quota: 100), StorageLevel.hardWarn);
});
```

- [ ] **Step 7.2: Implement `StorageMeter`** — used bytes = `navigator.storage.estimate()` (via package:web) + in-DB media blob bytes (sum of `media_attachments.sizeBytes` for non-adopted rows — **adopted rows excluded**, J7c) ; quota from `estimate().quota`. Pure `warningLevel(used, quota)` function.

- [ ] **Step 7.3: Wire the dashboard storage block** — used/available bar; dismissible warning banner at ≥70%, hard-warn at ≥90% prompting "Export backup now" (navigates to Settings → Data). Warnings re-appear until resolved (MediaStorage.md).

- [ ] **Step 7.4: Playwright** — insert large blob(s) to cross 70%/90%, screenshot the warnings, dismiss, confirm re-appearance.

- [ ] **Step 7.5: Run tests + analyze — green, clean. Commit (user approval). Retrospective entry + lesson.**

---

## Phase 8 — M0 exit verification (no new feature code)

- [ ] **Step 8.1: Offline core loop (airplane mode)** — `flutter run -d web-server` + serve locally; block network in the browser; journal create, habit check-off, dashboard, export all work with zero network (exit criterion).
- [ ] **Step 8.2: PWA Persistence Test (playwright, desktop Chrome)** — install/serve the PWA, create data (journal + habits + media), kill the browser, relaunch, assert data survived. (iPhone PWA persistence is the manual user check — StorageDecision.md gate was already green; re-verify the real app on iPhone.)
- [ ] **Step 8.3: Full M0 gate sweep** — `flutter analyze` clean, `flutter test` green (evidence shown), export→wipe→restore identical, storage meter real + 70/90 warnings, Coach stub after 3 misses, on-device camera/MediaRecorder (manual), AGENTS.md lock text present.
- [ ] **Step 8.4: M0 close-out** — write `docs/Retrospectives.md` M0 entry; encode ≥1 lesson; add any new decisions to DecisionLog; ensure all open DecisionLog build-time items are either resolved or explicitly carried.

---

## Exit Criteria Traceability (Roadmap M0)

| Exit criterion | Where it lands |
|---|---|
| PWA Persistence Test on iPhone | Step 8.2 (playwright desktop) + manual iPhone re-verify |
| Camera + MediaRecorder on device | Phase 4 (Step 4.6 manual) |
| Offline core loop | Phase 8 (Step 8.1) |
| Export → wipe → restore identical | Phase 5 (Step 5.1 test + Step 5.6 playwright) |
| Storage meter real + 70/90 warnings | Phase 7 |
| Coach stub after 3 misses | Phase 6 |
| Storage decision LOCKED in DecisionLog | Already locked (D040) — Phase 0 confirms AGENTS.md |
| AGENTS.md updated (lock text) | Phase 0 (Step 0.2) |

**Gate: M1 cannot start until every box above is checked (Roadmap.md).**
