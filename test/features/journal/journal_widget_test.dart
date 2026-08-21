import 'dart:typed_data';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalos/app.dart';
import 'package:personalos/data/database/database.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/services/media/media_capture.dart';

class FakeVlogSession implements VlogSession {
  @override
  Future<CapturedMedia> stop() async {
    return CapturedMedia(
      bytes: Uint8List.fromList(List.filled(256, 2)),
      mimeType: 'video/webm',
      durationSec: 90,
      fileName: 'vlog.webm',
    );
  }
}

class FakeMediaCapture implements MediaCaptureService {
  @override
  Future<CapturedMedia?> pickPhoto() async {
    return CapturedMedia(
      bytes: Uint8List.fromList(List.filled(64, 1)),
      mimeType: 'image/jpeg',
      fileName: 'photo.jpg',
    );
  }

  @override
  Future<VlogSession?> startVlog() async => FakeVlogSession();
}

void main() {
  late AppDatabase db;
  late FakeMediaCapture capture;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    capture = FakeMediaCapture();
  });
  tearDown(() => db.close());

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          dbProvider.overrideWithValue(db),
          mediaCaptureProvider.overrideWithValue(capture),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> openJournalAndCompose(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.book_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();
  }

  Future<void> saveEntry(WidgetTester tester) async {
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
  }

  testWidgets('compose a text entry → appears in the timeline', (tester) async {
    await pumpApp(tester);
    await openJournalAndCompose(tester);

    await tester.enterText(
        find.byKey(const Key('compose-body')), 'First entry body');
    await saveEntry(tester);

    expect(find.text('First entry body'), findsOneWidget);
    final entries = await db.select(db.journalEntries).get();
    expect(entries, hasLength(1));
    final events =
        await db.select(db.events).get();
    expect(events.map((e) => e.type), contains('journal.created'));
  });

  testWidgets('attach photo + vlog → media rows persist with the entry',
      (tester) async {
    await pumpApp(tester);
    await openJournalAndCompose(tester);

    await tester.tap(find.text('Add photo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Record vlog'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Stop'));
    await tester.pumpAndSettle();
    expect(find.text('photo.jpg'), findsOneWidget);
    expect(find.text('vlog.webm'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('compose-body')), 'Entry with media');
    await saveEntry(tester);

    final media = await db.select(db.mediaAttachments).get();
    expect(media, hasLength(2));
    expect(media.map((m) => m.mimeType),
        containsAll(['image/jpeg', 'video/webm']));
    expect(media.every((m) => m.blobData != null), isTrue);
    expect(media.firstWhere((m) => m.mimeType == 'video/webm').durationSec, 90);
  });

  testWidgets('edit appends journal.edited; delete removes the entry',
      (tester) async {
    await pumpApp(tester);
    await openJournalAndCompose(tester);
    await tester.enterText(
        find.byKey(const Key('compose-body')), 'Version one');
    await saveEntry(tester);
    expect(find.text('Version one'), findsOneWidget);

    await tester.tap(find.text('Version one'));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const Key('compose-body')), 'Version two');
    await saveEntry(tester);
    await tester.pumpAndSettle();
    expect(find.text('Version two'), findsOneWidget);

    final events =
        await db.select(db.events).get();
    expect(events.map((e) => e.type),
        containsAll(['journal.created', 'journal.edited']));

    await tester.tap(find.text('Version two'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Version two'), findsNothing);
    final deleted =
        await db.select(db.events).get();
    expect(deleted.map((e) => e.type), contains('journal.deleted'));
  });
}