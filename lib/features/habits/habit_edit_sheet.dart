import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habits_providers.dart';

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
    final name = _name.text.trim();
    if (name.isEmpty) return;
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
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.initialName == null ? 'New habit' : 'Edit habit',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _name,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String?>(
            initialValue: _area,
            decoration: const InputDecoration(
              labelText: 'Life area',
              border: OutlineInputBorder(),
            ),
            items: [
              const DropdownMenuItem<String?>(value: null, child: Text('None')),
              ...seedAreas.map(
                (slug) => DropdownMenuItem<String?>(
                  value: slug,
                  child: Text(areaLabels[slug] ?? slug),
                ),
              ),
            ],
            onChanged: (value) => setState(() => _area = value),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}