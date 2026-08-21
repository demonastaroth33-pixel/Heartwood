import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/models/coach_output.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/models/habit_checkin.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';

class MediaManifestEntry {
  final String id;
  final String fileName;
  final String mimeType;
  final int sizeBytes;
  final String sha256;
  final bool exported;

  const MediaManifestEntry({
    required this.id,
    required this.fileName,
    required this.mimeType,
    required this.sizeBytes,
    required this.sha256,
    required this.exported,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'mimeType': mimeType,
        'sizeBytes': sizeBytes,
        'sha256': sha256,
        'exported': exported,
      };
}

class ExportBundle {
  final String json;
  final Map<String, Uint8List> mediaFiles;

  const ExportBundle({required this.json, this.mediaFiles = const {}});

  ExportBundle copyWith({String? json, Map<String, Uint8List>? mediaFiles}) {
    return ExportBundle(
      json: json ?? this.json,
      mediaFiles: mediaFiles ?? this.mediaFiles,
    );
  }
}

class RestoreReport {
  final List<String> missingFiles;
  final int importedRows;

  const RestoreReport({required this.missingFiles, required this.importedRows});
}

class ExportImportRepository {
  final AppDatabase db;
  ExportImportRepository(this.db);

  Future<ExportBundle> exportAll() async {
    final settings = (await db.select(db.settings).get())
        .map((r) => {'key': r.key, 'value': r.value})
        .toList();
    final areas = (await db.select(db.areas).get())
        .map((r) => {'id': r.id, 'label': r.label, 'userDefined': r.userDefined})
        .toList();
    final journalEntries = (await db.select(db.journalEntries).get())
        .map(JournalEntry.fromRow)
        .map((e) => e.toJson())
        .toList();

    final mediaAttachments = <Map<String, dynamic>>[];
    final manifest = <MediaManifestEntry>[];
    final mediaFiles = <String, Uint8List>{};
    for (final row in await db.select(db.mediaAttachments).get()) {
      final attachment = MediaAttachment.fromRow(row);
      final bytes = row.blobData;
      mediaAttachments.add(attachment.toJson());
      manifest.add(MediaManifestEntry(
        id: attachment.id,
        fileName: attachment.fileName,
        mimeType: attachment.mimeType,
        sizeBytes: attachment.sizeBytes,
        sha256: bytes == null ? '' : sha256.convert(bytes).toString(),
        exported: bytes != null,
      ));
      if (bytes != null) {
        mediaFiles['media_${attachment.id}'] = bytes;
      }
    }

    final habits = (await db.select(db.habits).get())
        .map(Habit.fromRow)
        .map((h) => h.toJson())
        .toList();
    final habitCheckins = (await db.select(db.habitCheckins).get())
        .map(HabitCheckin.fromRow)
        .map((c) => c.toJson())
        .toList();
    final events = (await db.select(db.events).get())
        .map(EventRecord.fromRow)
        .map((e) => e.toJson())
        .toList();
    final coachOutputs = (await db.select(db.coachOutputs).get())
        .map(CoachOutput.fromRow)
        .map((o) => o.toJson())
        .toList();

    final backup = {
      'format': 'PersonalOS-backup',
      'formatVersion': 2,
      'schemaVersion': db.schemaVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'user': 'personalos',
      'data': {
        'settings': settings,
        'areas': areas,
        'journalEntries': journalEntries,
        'mediaAttachments': mediaAttachments,
        'habits': habits,
        'habitCheckins': habitCheckins,
        'events': events,
        'coachOutputs': coachOutputs,
      },
      'media': {
        'manifestVersion': 1,
        'files': manifest.map((m) => m.toJson()).toList(),
      },
    };
    return ExportBundle(json: jsonEncode(backup), mediaFiles: mediaFiles);
  }

  Future<RestoreReport> restore(ExportBundle bundle) async {
    final parsed = jsonDecode(bundle.json) as Map<String, dynamic>;
    if (parsed['format'] != 'PersonalOS-backup') {
      throw const FormatException('Not a PersonalOS backup file');
    }
    if (parsed['formatVersion'] != 2) {
      throw FormatException(
        'Unsupported formatVersion: ${parsed['formatVersion']}',
      );
    }
    final schemaVersion = parsed['schemaVersion'] as int;
    if (schemaVersion > db.schemaVersion) {
      throw StateError(
        'Backup schema v$schemaVersion is newer than this app (v${db.schemaVersion}). Upgrade the app first.',
      );
    }
    final data = parsed['data'] as Map<String, dynamic>;
    final files =
        ((parsed['media'] as Map<String, dynamic>)['files'] as List)
            .cast<Map<String, dynamic>>();

    var imported = 0;
    final missing = <String>[];
    await db.transaction(() async {
      await _clearAll();

      for (final row in (data['settings'] as List).cast<Map<String, dynamic>>()) {
        await db.into(db.settings).insert(SettingsCompanion.insert(
          key: row['key'] as String,
          value: row['value'] as String,
        ));
        imported++;
      }
      for (final row in (data['areas'] as List).cast<Map<String, dynamic>>()) {
        await db.into(db.areas).insert(
          AreasCompanion.insert(
            id: row['id'] as String,
            label: row['label'] as String,
            userDefined: Value(row['userDefined'] as bool? ?? false),
          ),
          mode: InsertMode.insertOrIgnore,
        );
        imported++;
      }
      for (final row
          in (data['journalEntries'] as List).cast<Map<String, dynamic>>()) {
        final e = JournalEntry.fromJson(row);
        await db.into(db.journalEntries).insert(JournalEntriesCompanion.insert(
          id: e.id,
          title: Value(e.title),
          body: e.body,
          area: Value(e.area),
          tagsJson: jsonEncode(e.tags),
          createdAt: e.createdAt,
          updatedAt: e.updatedAt,
          deletedAt: Value(e.deletedAt),
          imported: Value(e.imported),
          importHash: Value(e.importHash),
        ));
        imported++;
      }
      for (final row
          in (data['mediaAttachments'] as List).cast<Map<String, dynamic>>()) {
        final m = MediaAttachment.fromJson(row);
        Uint8List? bytes;
        final entry = files.where((f) => f['id'] == m.id).firstOrNull;
        if (entry != null && entry['exported'] == true) {
          bytes = bundle.mediaFiles['media_${m.id}'];
          if (bytes == null) {
            missing.add(m.fileName);
          } else {
            final actual = sha256.convert(bytes).toString();
            if (actual != entry['sha256'] as String) {
              missing.add('${m.fileName} (hash mismatch)');
              bytes = null;
            }
          }
        }
        await db.into(db.mediaAttachments).insert(
          MediaAttachmentsCompanion.insert(
            id: m.id,
            entryId: Value(m.entryId),
            fileName: m.fileName,
            mimeType: m.mimeType,
            sizeBytes: m.sizeBytes,
            durationSec: Value(m.durationSec),
            title: Value(m.title),
            capturedAt: m.capturedAt,
            syncState: Value(m.syncState),
            storageRef: Value(m.storageRef),
            thumbnailRef: Value(m.thumbnailRef),
            contentHash: Value(m.contentHash),
            archivedOnDevice: Value(m.archivedOnDevice),
            adopted: Value(m.adopted),
            blobData: Value(bytes),
          ),
        );
        imported++;
      }
      for (final row in (data['habits'] as List).cast<Map<String, dynamic>>()) {
        final h = Habit.fromJson(row);
        await db.into(db.habits).insert(HabitsCompanion.insert(
          id: h.id,
          name: h.name,
          area: Value(h.area),
          createdAt: h.createdAt,
          active: Value(h.active),
        ));
        imported++;
      }
      for (final row
          in (data['habitCheckins'] as List).cast<Map<String, dynamic>>()) {
        final c = HabitCheckin.fromJson(row);
        await db.into(db.habitCheckins).insert(HabitCheckinsCompanion.insert(
          id: c.id,
          habitId: c.habitId,
          dayKey: c.dayKey,
          completedAt: c.completedAt,
          note: Value(c.note),
        ));
        imported++;
      }
      for (final row in (data['events'] as List).cast<Map<String, dynamic>>()) {
        final e = EventRecord.fromJson(row);
        await db.into(db.events).insert(EventsCompanion.insert(
          id: e.id,
          type: e.type,
          occurredAt: e.occurredAt,
          dayKey: e.dayKey,
          area: Value(e.area),
          entityType: e.entityType,
          entityId: e.entityId,
          payloadVersion: Value(e.payloadVersion),
          payload: e.payload,
          supersedesId: Value(e.supersedesId),
        ));
        imported++;
      }
      for (final row
          in (data['coachOutputs'] as List).cast<Map<String, dynamic>>()) {
        final o = CoachOutput.fromJson(row);
        await db.into(db.coachOutputs).insert(CoachOutputsCompanion.insert(
          id: o.id,
          kind: o.kind,
          dateKey: o.dateKey,
          payload: o.payload,
        ));
        imported++;
      }
    });
    return RestoreReport(missingFiles: missing, importedRows: imported);
  }

  Future<void> _clearAll() async {
    await db.delete(db.habitCheckins).go();
    await db.delete(db.mediaAttachments).go();
    await db.delete(db.events).go();
    await db.delete(db.coachOutputs).go();
    await db.delete(db.journalEntries).go();
    await db.delete(db.habits).go();
    await db.delete(db.areas).go();
    await db.delete(db.settings).go();
  }
}