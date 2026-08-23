import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/widgets/app_field.dart';
import 'package:personalos/widgets/pill_button.dart';

const kWelcomeDoneKey = 'welcome_done';

/// First-run 3-step welcome: what PersonalOS is → create 2–3 habits →
/// first journal entry → dashboard. No skip; back allowed.
class WelcomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onDone;

  const WelcomeScreen({super.key, required this.onDone});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  int _step = 0;
  final _habitName = TextEditingController();
  final _entryBody = TextEditingController();
  final List<String> _habits = [];
  bool _saving = false;

  @override
  void dispose() {
    _habitName.dispose();
    _entryBody.dispose();
    super.dispose();
  }

  Future<void> _addHabit() async {
    final name = _habitName.text.trim();
    if (name.isEmpty) return;
    await ref.read(habitRepoProvider).create(name: name);
    _habitName.clear();
    setState(() => _habits.add(name));
  }

  Future<void> _finish() async {
    if (_saving) return;
    setState(() => _saving = true);
    final body = _entryBody.text.trim();
    if (body.isNotEmpty) {
      await ref.read(journalRepoProvider).create(body: body);
    }
    await ref.read(settingsRepoProvider).set(kWelcomeDoneKey, 'true');
    if (!mounted) return;
    widget.onDone();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xxl),
              child: AnimatedSwitcher(
                duration: AppMotion.fast,
                switchInCurve: AppMotion.standard,
                switchOutCurve: AppMotion.standard,
                child: KeyedSubtree(
                  key: ValueKey(_step),
                  child: _step == 0
                      ? _Intro(onNext: () => setState(() => _step = 1))
                      : _step == 1
                          ? _HabitSetup(
                              controller: _habitName,
                              habits: _habits,
                              onAdd: _addHabit,
                              onNext: () => setState(() => _step = 2),
                            )
                          : _FirstEntry(
                              controller: _entryBody,
                              saving: _saving,
                              onChanged: () => setState(() {}),
                              onDone: _finish,
                            ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.xl),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  return AnimatedContainer(
                    duration: AppMotion.fast,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _step ? 10 : 8,
                    height: i == _step ? 10 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _step ? tokens.accent : tokens.hairline,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  final VoidCallback onNext;

  const _Intro({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('PersonalOS', style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: AppSpace.lg),
        Text(
          'A private place for your days — habits you keep, entries you write, and a quiet coach that notices when life drifts.',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: tokens.textSecondary, height: 1.6),
        ),
        const SizedBox(height: AppSpace.xl),
        PillButton(label: 'Start', onPressed: onNext),
      ],
    );
  }
}

class _HabitSetup extends ConsumerWidget {
  final TextEditingController controller;
  final List<String> habits;
  final VoidCallback onAdd;
  final VoidCallback onNext;

  const _HabitSetup({
    required this.controller,
    required this.habits,
    required this.onAdd,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Create your first habits',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpace.md),
        Text(
          'Start with 2–3 things you already do — you can change them anytime.',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: tokens.textSecondary),
        ),
        const SizedBox(height: AppSpace.xl),
        AppField(
          controller: controller,
          hint: 'e.g. Read 20 minutes',
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onAdd(),
          ),
        ),
        const SizedBox(height: AppSpace.md),
        for (final name in habits)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpace.xs),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 18, color: tokens.accent),
                const SizedBox(width: AppSpace.sm),
                Text(name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        const SizedBox(height: AppSpace.xl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButton(
              label: 'Continue',
              onPressed: habits.isEmpty ? null : onNext,
            ),
          ],
        ),
      ],
    );
  }
}

class _FirstEntry extends StatelessWidget {
  final TextEditingController controller;
  final bool saving;
  final VoidCallback onChanged;
  final VoidCallback onDone;

  const _FirstEntry({
    required this.controller,
    required this.saving,
    required this.onChanged,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Write your first entry',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AppSpace.md),
        Text(
          'One line is enough. This is your space.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).extension<AppTokens>()!.textSecondary,
              ),
        ),
        const SizedBox(height: AppSpace.xl),
        AppField(
          controller: controller,
          hint: 'What happened today?',
          multiline: true,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: AppSpace.xl),
        PillButton(
          label: 'Done',
          loading: saving,
          onPressed: controller.text.trim().isEmpty || saving ? null : onDone,
        ),
      ],
    );
  }
}