import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/data/models/coach_output.dart';
import 'package:personalos/data/models/event_record.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/models/habit_checkin.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';

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
    expect(restored.id, 'je-1');
    expect(restored.title, 'T');
    expect(restored.body, 'B');
    expect(restored.area, 'health');
    expect(restored.tags, ['win']);
    expect(restored.imported, isFalse);
  });

  test('Habit JSON round-trips', () {
    final h = Habit(
      id: 'h-1',
      name: 'Read',
      area: 'learning',
      createdAt: DateTime.utc(2026, 8, 1),
      active: true,
    );
    final restored = Habit.fromJson(h.toJson());
    expect(restored.name, 'Read');
    expect(restored.area, 'learning');
    expect(restored.active, isTrue);
  });

  test('HabitCheckin JSON round-trips', () {
    final c = HabitCheckin(
      id: 'c-1',
      habitId: 'h-1',
      dayKey: '2026-08-01',
      completedAt: DateTime.utc(2026, 8, 1, 9),
      note: 'n',
    );
    final restored = HabitCheckin.fromJson(c.toJson());
    expect(restored.habitId, 'h-1');
    expect(restored.dayKey, '2026-08-01');
    expect(restored.note, 'n');
  });

  test('MediaAttachment JSON round-trips metadata fields', () {
    final m = MediaAttachment(
      id: 'ma-1',
      entryId: 'je-1',
      fileName: 'a.mp4',
      mimeType: 'video/mp4',
      sizeBytes: 2048,
      durationSec: 90,
      title: 'My vlog',
      capturedAt: DateTime.utc(2026, 8, 1, 9),
      syncState: 'local-only',
      storageRef: 'blob:ma-1',
      thumbnailRef: 'blob:thumb-ma-1',
      contentHash: 'abc',
      archivedOnDevice: null,
      adopted: false,
    );
    final restored = MediaAttachment.fromJson(m.toJson());
    expect(restored.fileName, 'a.mp4');
    expect(restored.durationSec, 90);
    expect(restored.title, 'My vlog');
    expect(restored.syncState, 'local-only');
    expect(restored.storageRef, 'blob:ma-1');
    expect(restored.contentHash, 'abc');
    expect(restored.adopted, isFalse);
  });

  test('CoachOutput JSON round-trips', () {
    final o = CoachOutput(
      id: 'co-1',
      kind: 'nudge',
      dateKey: '2026-08-04',
      payload: 'Three days without Read',
    );
    final restored = CoachOutput.fromJson(o.toJson());
    expect(restored.kind, 'nudge');
    expect(restored.dateKey, '2026-08-04');
  });

  test('EventRecord JSON round-trips incl. supersedesId', () {
    final e = EventRecord(
      id: 'ev-1',
      type: 'journal.edited',
      occurredAt: DateTime.utc(2026, 8, 1, 9),
      dayKey: '2026-08-01',
      area: 'health',
      entityType: 'journal',
      entityId: 'je-1',
      payloadVersion: 1,
      payload: '{}',
      supersedesId: 'ev-0',
    );
    final restored = EventRecord.fromJson(e.toJson());
    expect(restored.type, 'journal.edited');
    expect(restored.supersedesId, 'ev-0');
    expect(restored.area, 'health');
  });
}
