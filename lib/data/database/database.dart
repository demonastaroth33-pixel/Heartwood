import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../core/constants.dart';

part 'database.g.dart';

@DataClassName('JournalEntryRow')
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

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('MediaAttachmentRow')
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
  BlobColumn get blobData => blob().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('HabitRow')
class Habits extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get area => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('HabitCheckinRow')
class HabitCheckins extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text().references(Habits, #id)();
  TextColumn get dayKey => text()();
  DateTimeColumn get completedAt => dateTime()();
  TextColumn get note => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

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
@DataClassName('EventRow')
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

@DataClassName('CoachOutputRow')
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
      : super(
          executor ??
              driftDatabase(
                name: 'personalos',
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.dart.js'),
                ),
              ),
        );

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
