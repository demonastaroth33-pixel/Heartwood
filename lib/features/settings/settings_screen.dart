import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/device_mode.dart';
import 'package:personalos/core/theme.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/settings/data_section.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenHeader(title: 'Settings'),
                const SearchPill(hint: 'Search settings…', fullWidth: true),
                const SizedBox(height: 26),
                const _GeneralGroup(),
                const SizedBox(height: 18),
                const _CoachGroup(),
                const SizedBox(height: 18),
                const _DataGroup(),
                const SizedBox(height: 18),
                const _DeveloperGroup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeneralGroup extends ConsumerWidget {
  const _GeneralGroup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final themeKey = ref.watch(themeKeyProvider).valueOrNull ?? 'ink';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GENERAL',
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w700,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        BlockCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Column(
            children: [
              _SetRow(
                name: 'Theme',
                desc: 'Ink is the default — Paper for daylight reading',
                trailing: Row(
                  children: [
                    _ThemeSwatch(
                      label: 'ink',
                      selected: themeKey == 'ink',
                      onTap: () => _selectTheme(ref, 'ink'),
                    ),
                    const SizedBox(width: 8),
                    _ThemeSwatch(
                      label: 'paper',
                      selected: themeKey == 'paper',
                      onTap: () => _selectTheme(ref, 'paper'),
                    ),
                  ],
                ),
              ),
              _SetRow(
                name: 'First day of week',
                trailing: Text(
                  'Monday',
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 12,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectTheme(WidgetRef ref, String key) async {
    await ref.read(settingsRepoProvider).set(kThemeKey, key);
    ref.invalidate(themeKeyProvider);
  }
}

class _ThemeSwatch extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeSwatch({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final isInk = label == 'ink';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 38,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isInk
                ? [const Color(0xFF1A1D15), const Color(0xFF0C0E0A)]
                : [const Color(0xFFF4F0E4), const Color(0xFFE4DFCC)],
          ),
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(
            color: selected ? tokens.accent : Colors.transparent,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 16,
            height: 3,
            margin: const EdgeInsets.only(left: 5, bottom: 5),
            decoration: BoxDecoration(
              color: tokens.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}

class _CoachGroup extends StatelessWidget {
  const _CoachGroup();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COACH',
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w700,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        BlockCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Column(
            children: [
              _SetRow(
                name: 'Daily note',
                desc: 'Delivered with your morning greeting',
                trailing: HeartwoodIconWidget(
                  icon: HeartwoodIcon.check,
                  size: 18,
                  color: tokens.accent,
                ),
              ),
              _SetRow(
                name: '3-miss check-in',
                desc: 'Nudge after three missed days on any habit',
                trailing: HeartwoodIconWidget(
                  icon: HeartwoodIcon.check,
                  size: 18,
                  color: tokens.accent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DataGroup extends StatelessWidget {
  const _DataGroup();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DATA & STORAGE',
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w700,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        BlockCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Column(
            children: [
              _SetRow(
                name: 'Export backup',
                desc: 'PersonalOS-backup v2 JSON · sha256 manifest · media files',
                trailing: PillButton(
                  label: 'Export',
                  icon: HeartwoodIcon.export,
                  ghost: true,
                  height: 36,
                  onPressed: () => _export(context),
                ),
              ),
              _SetRow(
                name: 'Restore from backup',
                desc: 'Full replace of current data · refuses newer schemas',
                trailing: PillButton(
                  label: 'Restore',
                  icon: HeartwoodIcon.export,
                  iconRotated180: true,
                  ghost: true,
                  height: 36,
                  onPressed: () => _restore(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _export(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final state = DataSection.of(context);
    if (state != null) await state.export();
    messenger.showSnackBar(
      SnackBar(
        backgroundColor: tokens.surfaceRaised,
        content: const Text('Backup exported.'),
      ),
    );
  }

  Future<void> _restore(BuildContext context) async {
    final state = DataSection.of(context);
    if (state == null) return;
    // Mirrors the mock's restore-confirm modal: warns before replacing data.
    final confirmed = await showBlurDialog<bool>(
      context: context,
      builder: (dialogContext) => _RestoreConfirm(
        onCancel: () => Navigator.of(dialogContext).pop(false),
        onRestore: () => Navigator.of(dialogContext).pop(true),
      ),
    );
    if (confirmed != true) return;
    await state.restore();
  }
}

class _RestoreConfirm extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onRestore;

  const _RestoreConfirm({required this.onCancel, required this.onRestore});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      width: 340,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restore from backup?',
            style: TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xFFF1EFE2),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This replaces ALL current data with the backup contents — journal, habits, events and media references. Current data is gone. This can\'t be undone.',
            style: TextStyle(
              fontSize: 12.5,
              height: 1.55,
              color: tokens.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PillButton(label: 'Cancel', ghost: true, onPressed: onCancel),
              const SizedBox(width: 10),
              PillButton(
                label: 'Restore',
                onPressed: onRestore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DeveloperGroup extends ConsumerWidget {
  const _DeveloperGroup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final mode = ref.watch(deviceModeProvider).valueOrNull ?? 'auto';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DEVELOPER',
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w700,
            color: tokens.textTertiary,
          ),
        ),
        const SizedBox(height: 10),
        BlockCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: _SetRow(
            name: 'Preview mode',
            desc: 'Force the mobile or desktop layout — auto follows the window',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ModePill(
                  label: 'Auto',
                  active: mode == 'auto',
                  onTap: () => _setMode(ref, 'auto'),
                ),
                const SizedBox(width: 6),
                _ModePill(
                  label: 'Mobile',
                  active: mode == 'mobile',
                  onTap: () => _setMode(ref, 'mobile'),
                ),
                const SizedBox(width: 6),
                _ModePill(
                  label: 'Desktop',
                  active: mode == 'desktop',
                  onTap: () => _setMode(ref, 'desktop'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _setMode(WidgetRef ref, String value) async {
    await ref.read(settingsRepoProvider).set(kDeviceModeKey, value);
    ref.invalidate(deviceModeProvider);
  }
}

class _ModePill extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _ModePill({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: active ? tokens.accentWash : tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? Colors.transparent : tokens.hairline,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            color: active ? tokens.accent : tokens.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  final String name;
  final String? desc;
  final Widget trailing;

  const _SetRow({required this.name, this.desc, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: tokens.hairline)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: tokens.textPrimary,
                  ),
                ),
                if (desc != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    desc!,
                    style: TextStyle(fontSize: 12, color: tokens.textTertiary),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          trailing,
        ],
      ),
    );
  }
}