import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/habit.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// Habit creation/edit — centered modal on desktop, bottom sheet on mobile,
/// one surface. Mirrors `.habit-modal` / `.habit-sheet`.
Future<void> showHabitEditSheet(BuildContext context, {Habit? habit}) {
  return showHabitEditFrom(context, habit);
}

Future<void> showHabitEditFrom(BuildContext context, Habit? habit) {
  final desktop = MediaQuery.sizeOf(context).width >= 1040;
  if (desktop) {
    return showBlurDialog<void>(
      context: context,
      builder: (_) => _HabitModal(habit: habit),
    );
  }
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).extension<AppTokens>()!.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => _HabitModal(habit: habit, inSheet: true),
  );
}

class _HabitModal extends ConsumerStatefulWidget {
  final Habit? habit;
  final bool inSheet;

  const _HabitModal({this.habit, this.inSheet = false});

  @override
  ConsumerState<_HabitModal> createState() => _HabitModalState();
}

class _HabitModalState extends ConsumerState<_HabitModal> {
  late final TextEditingController _name =
      TextEditingController(text: widget.habit?.name ?? '');
  String? _area;
  bool _saving = false;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _area = widget.habit?.area;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty || _saving) return;
    setState(() => _saving = true);
    final repo = ref.read(habitRepoProvider);
    if (widget.habit == null) {
      await repo.create(name: _name.text.trim(), area: _area);
    } else {
      await repo.rename(widget.habit!.id, _name.text.trim());
    }
    ref.invalidate(habitsProvider);
    ref.invalidate(habitStreakProvider(widget.habit?.id ?? ''));
    if (!mounted) return;
    // Success beat: icon swaps to a check with a pop, then closes (650ms,
    // mirroring the mock's saveHabit flow).
    setState(() => _saved = true);
    await Future<void>.delayed(const Duration(milliseconds: 650));
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final editing = widget.habit != null;
    final valid = _name.text.trim().isNotEmpty;
    final content = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  editing ? 'Edit habit' : 'Plant a new habit',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: tokens.textPrimary,
                  ),
                ),
              ),
              HoverRotate(
                size: 32,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: HeartwoodIconWidget(
                    icon: HeartwoodIcon.x,
                    size: 15,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: tokens.accentWash,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: tokens.surface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: HeartwoodIconWidget(
                    icon: HeartwoodIcon.sprout,
                    size: 18,
                    color: tokens.accent,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.inSheet
                        ? 'Starts as a seed — grows a stage each week its streak holds.'
                        : 'Every habit starts as a seed. It grows a stage each week you keep its streak alive.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: tokens.accentDeep,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const FieldLabel(text: 'Name'),
          FieldInput(
            controller: _name,
            hint: 'e.g. Stretch before bed',
            onChanged: (_) => setState(() {}),
          ),
          const FieldLabel(text: 'Life area'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              LifeChip(
                label: 'None',
                active: _area == null,
                onTap: () => setState(() => _area = null),
              ),
              for (final slug in seedAreas)
                LifeChip(
                  label: areaLabels[slug] ?? slug,
                  active: _area == slug,
                  onTap: () => setState(() => _area = slug),
                ),
            ],
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PillButton(
                label: 'Cancel',
                ghost: true,
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 10),
              PillButton(
                label: editing ? 'Save changes' : 'Plant habit',
                icon: HeartwoodIcon.sprout,
                success: _saved,
                disabled: !valid || _saving,
                onPressed: _save,
              ),
            ],
          ),
        ],
      ),
    );
    if (widget.inSheet) {
      return Padding(
        padding: EdgeInsets.only(
          left: 22,
          right: 22,
          top: 14,
          bottom: MediaQuery.viewInsetsOf(context).bottom + 26,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 34,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: tokens.hairlineStrong,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            content,
          ],
        ),
      );
    }
    return Dialog(
      backgroundColor: tokens.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: tokens.hairline),
      ),
      child: Container(
        width: 428,
        padding: const EdgeInsets.all(30),
        child: content,
      ),
    );
  }
}