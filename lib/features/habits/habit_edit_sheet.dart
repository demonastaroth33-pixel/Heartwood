import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';
import 'package:personalos/widgets/app_field.dart';

Future<void> showHabitEditSheet(
  BuildContext context, {
  String? initialName,
  String? initialArea,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => _HabitEditSheet(
      initialName: initialName,
      initialArea: initialArea,
    ),
  );
}

class _HabitEditSheet extends ConsumerStatefulWidget {
  final String? initialName;
  final String? initialArea;

  const _HabitEditSheet({this.initialName, this.initialArea});

  @override
  ConsumerState<_HabitEditSheet> createState() => _HabitEditSheetState();
}

class _HabitEditSheetState extends ConsumerState<_HabitEditSheet> {
  late final TextEditingController _name;
  String? _area;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initialName ?? '');
    _area = widget.initialArea;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    final name = _name.text.trim();
    if (name.isEmpty) return;
    setState(() => _saving = true);
    final repo = ref.read(habitRepoProvider);
    if (widget.initialName == null) {
      await repo.create(name: name, area: _area);
    } else {
      final habits = await repo.listActive();
      final habit = habits.where((h) => h.name == widget.initialName).firstOrNull;
      if (habit != null) await repo.rename(habit.id, name);
    }
    if (!mounted) return;
    Navigator.of(context).pop();
    await refreshHabits(ref);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpace.xl,
        right: AppSpace.xl,
        top: AppSpace.sm,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpace.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.initialName == null ? 'New habit' : 'Edit habit',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpace.lg),
          AppField(
            controller: _name,
            label: 'Name',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: AppSpace.md),
          Text(
            'Life area',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
          const SizedBox(height: AppSpace.xs),
          Wrap(
            spacing: AppSpace.sm,
            runSpacing: AppSpace.sm,
            children: [
              _AreaChip(
                label: 'None',
                active: _area == null,
                onTap: () => setState(() => _area = null),
              ),
              ...seedAreas.map(
                (slug) => _AreaChip(
                  label: areaLabels[slug] ?? slug,
                  active: _area == slug,
                  onTap: () => setState(() => _area = slug),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.lg),
          FilledButton(
            onPressed: _name.text.trim().isEmpty || _saving ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _AreaChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _AreaChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.lg, vertical: AppSpace.sm),
        decoration: BoxDecoration(
          color: active ? tokens.accent : tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? tokens.accent : tokens.hairline,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: active ? tokens.onAccent : tokens.textSecondary,
              ),
        ),
      ),
    );
  }
}