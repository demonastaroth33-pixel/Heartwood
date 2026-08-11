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

@TableIndex(name: 'idx_events_type_day', columns: {#type, #dayKey})
class _EventsIndex1 extends TableIndex on Events {
  @override
  String get indexName => 'idx_events_type_day';
}

@TableIndex(name: 'idx_events_area_day', columns: {#area, #dayKey})
class _EventsIndex2 extends TableIndex on Events {
  @override
  String get indexName => 'idx_events_area_day';
}

@TableIndex(name: 'idx_events_entity', columns: {#entityType, #entityId})
class _EventsIndex3 extends TableIndex on Events {
  @override
  String get indexName => 'idx_events_entity';
}

class MediaAttachments extends Table {
  TextColumn get id => text()();
  TextColumn get entryId =>
      text().nullable().references(JournalEntries, #id)();
  TextColumn get fileName => text()();
  TextColumn get mimeType => text()();
  IntColumn get sizeBytes => integer()();
  IntColumn get durationSec => integer().nullable()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get syncState => text().withDefault(const Constant('local'))();
  TextColumn get storageRef => text().withDefault(const Constant(''))();
  BlobColumn get blob => blob().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [
  JournalEntries,
  Habits,
  HabitCheckins,
  Areas,
  Settings,
  Events,
  MediaAttachments,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.open({QueryExecutor? executor})
      : super(executor ?? driftDatabase(name: 'personalos'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedAreas();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(events);
            await m.createTable(mediaAttachments);
          }
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
    final tables = <String, TableInfo<dynamic, dynamic>>{
      'settings': settings,
      'areas': areas,
      'journal_entries': journalEntries,
      'habits': habits,
      'habit_checkins': habitCheckins,
      'media_attachments': mediaAttachments,
      'events': events,
    };
    final result = <String, int>{};
    for (final entry in tables.entries) {
      result[entry.key] = await entry.value.count().getSingle();
    }
    return result;
  }
}
