import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/models/coach_output.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/widgets/block_card.dart';

final coachTodayProvider = FutureProvider<CoachOutput?>((ref) async {
  final service = ref.watch(coachServiceProvider);
  await service.refresh();
  return service.todayOutput();
});

class CoachNoteBlock extends ConsumerWidget {
  const CoachNoteBlock({super.key});

  Future<void> _dismiss(WidgetRef ref) async {
    await ref.read(coachServiceProvider).dismissToday();
    ref.invalidate(coachTodayProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final output = ref.watch(coachTodayProvider);
    final line = switch (output.valueOrNull) {
      null => const EmptyLine(text: 'Day on track.'),
      final CoachOutput o => EmptyLine(text: o.payload),
    };
    return BlockCard(
      title: 'Coach',
      trailing: output.valueOrNull == null
          ? null
          : IconButton(
              onPressed: () => _dismiss(ref),
              icon: const Icon(Icons.close, size: 15),
              tooltip: "Dismiss today's note",
              visualDensity: VisualDensity.compact,
            ),
      child: line,
    );
  }
}