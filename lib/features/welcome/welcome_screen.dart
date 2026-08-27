import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/habits/habit_edit_sheet.dart';
import 'package:personalos/features/journal/journal_compose_screen.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

const kWelcomeDoneKey = 'welcome_done';

/// First-run welcome — 3 steps, Heartwood treatment (G7). Mirrors
/// `.welcome-panel` / `.welcome-card` / `.welcome-step`.
class WelcomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onDone;

  const WelcomeScreen({super.key, required this.onDone});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  int _step = 1;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -0.24),
            radius: 1.3,
            colors: [const Color(0xFF171B12), tokens.bgDeep],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: 430,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeartwoodIconWidget(
                      icon: HeartwoodIcon.mark,
                      size: 56,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) {
                        final active = i + 1 == _step;
                        return AnimatedContainer(
                          duration: AppMotion.fast,
                          margin: const EdgeInsets.symmetric(horizontal: 3.5),
                          width: active ? 18 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: active ? tokens.accent : tokens.hairlineStrong,
                            borderRadius: BorderRadius.circular(99),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 22),
                    AnimatedSwitcher(
                      duration: AppMotion.fast,
                      child: KeyedSubtree(
                        key: ValueKey(_step),
                        child: switch (_step) {
                          1 => _StepIntro(
                              onNext: () => setState(() => _step = 2),
                              onSkip: _skipSetup,
                            ),
                          2 => _StepHabits(
                              onNext: _plantHabit,
                              onSkip: () => setState(() => _step = 3),
                              onBack: () => setState(() => _step = 1),
                            ),
                          _ => _StepEntry(
                              onNext: _openCompose,
                              onBack: () => setState(() => _step = 2),
                            ),
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _plantHabit() {
    // Opens the habit modal; when it closes (planted OR cancelled) advance
    // to step 3 — the user is never stuck on step 2.
    showHabitEditSheet(context).then((_) {
      if (mounted) setState(() => _step = 3);
    });
  }

  void _skipSetup() {
    _finish();
  }

  void _openCompose() {
    openComposeOverlay(context).then((_) {
      if (mounted) _finish();
    });
  }

  Future<void> _finish() async {
    await ref.read(settingsRepoProvider).set(kWelcomeDoneKey, 'true');
    if (mounted) widget.onDone();
  }
}

class _StepIntro extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const _StepIntro({required this.onNext, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      children: [
        Text(
          'STEP 1 OF 3',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 10.5,
            letterSpacing: 1.7,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'This is Heartwood.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontStyle: FontStyle.italic,
            fontSize: 27,
            height: 1.2,
            color: tokens.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'A private archive for your life — journal, habits, and a quiet coach. Everything lives on this device unless you export it yourself. No account, no cloud, no one watching.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            height: 1.65,
            color: tokens.textSecondary,
          ),
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onSkip,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Skip setup',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            PillButton(
              label: 'Continue',
              icon: HeartwoodIcon.chevron,
              onPressed: onNext,
            ),
          ],
        ),
      ],
    );
  }
}

class _StepHabits extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const _StepHabits({
    required this.onNext,
    required this.onSkip,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      children: [
        Text(
          'STEP 2 OF 3',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 10.5,
            letterSpacing: 1.7,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Plant two or three habits.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontStyle: FontStyle.italic,
            fontSize: 27,
            height: 1.2,
            color: tokens.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Small and daily beats big and rare. Each habit starts as a seed and grows through eight stages as its streak holds — from sprout to Heartwood.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            height: 1.65,
            color: tokens.textSecondary,
          ),
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final icon in const [
              HeartwoodIcon.seed,
              HeartwoodIcon.sprout,
              HeartwoodIcon.tree1,
            ]) ...[
              Container(
                width: 52,
                height: 52,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: tokens.accentWash,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                alignment: Alignment.center,
                child: HeartwoodIconWidget(icon: icon, size: 24),
              ),
            ],
          ],
        ),
        const SizedBox(height: 26),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: onSkip,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ),
            PillButton(
              label: 'Plant one now',
              icon: HeartwoodIcon.plus,
              onPressed: onNext,
            ),
          ],
        ),
      ],
    );
  }
}

class _StepEntry extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const _StepEntry({required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      children: [
        Text(
          'STEP 3 OF 3',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 10.5,
            letterSpacing: 1.7,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Write the first entry.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontStyle: FontStyle.italic,
            fontSize: 27,
            height: 1.2,
            color: tokens.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Text, photos, a short vlog — whatever today held. Entries group by day under growth-ring dividers, tagged with a Life Area if you feel like it. Honest and unjudged.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            height: 1.65,
            color: tokens.textSecondary,
          ),
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            PillButton(
              label: 'Open compose',
              icon: HeartwoodIcon.book,
              onPressed: onNext,
            ),
          ],
        ),
      ],
    );
  }
}