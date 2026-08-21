import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/models/coach_output.dart';
import 'package:personalos/data/providers.dart';

import 'block_card.dart';

final coachTodayProvider = FutureProvider<CoachOutput?>((ref) async {
  final service = ref.watch(coachServiceProvider);
  await service.refresh();
  final db = ref.watch(dbProvider);
  final today = dayKey(DateTime.now());
  final q = db.select(db.coachOutputs)
    ..where((t) => t.kind.equals('nudge') & t.dateKey.equals(today))
    ..limit(1);
  final row = await q.getSingleOrNull();
  return row == null ? null : CoachOutput.fromRow(row);
});

class CoachNoteBlock extends ConsumerWidget {
  const CoachNoteBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final output = ref.watch(coachTodayProvider);
    final line = switch (output.valueOrNull) {
      null => const EmptyLine(text: 'Day on track.'),
      final CoachOutput o => EmptyLine(text: o.payload),
    };
    return BlockCard(title: 'Coach', child: line);
  }
}