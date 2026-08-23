import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/settings/data_section.dart';
import 'package:personalos/widgets/app_field.dart';
import 'package:personalos/widgets/block_card.dart';
import 'package:personalos/widgets/screen_header.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
          children: [
            const ScreenHeader(title: 'Settings'),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
              child: AppField(
                controller: _search,
                hint: 'Search settings',
                onChanged: (v) => setState(() => _query = v.trim().toLowerCase()),
                trailing: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: () {
                          _search.clear();
                          setState(() => _query = '');
                        },
                      ),
              ),
            ),
            if (_query.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
                child: _GeneralCard(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
                child: _DataCard(),
              ),
            ],
            if (_query.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(AppSpace.xl),
                child: EmptyLine(
                  text: 'No settings match "$_query" — clear the search to see all.',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GeneralCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final themeKey = ref.watch(themeKeyProvider).valueOrNull ?? 'ink';
    return BlockCard(
      title: 'General',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            'Ink is the quiet default. Paper for daylight.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
          const SizedBox(height: AppSpace.md),
          _ThemePicker(
            selected: themeKey,
            onSelected: (key) async {
              await ref.read(settingsRepoProvider).set(kThemeKey, key);
              ref.invalidate(themeKeyProvider);
            },
          ),
        ],
      ),
    );
  }
}

class _ThemePicker extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const _ThemePicker({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ThemeOption(
            label: 'Ink',
            active: selected == 'ink',
            onTap: () => onSelected('ink'),
          ),
          _ThemeOption(
            label: 'Paper',
            active: selected == 'paper',
            onTap: () => onSelected('paper'),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _ThemeOption({
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
        duration: AppMotion.fast,
        curve: AppMotion.standard,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.lg, vertical: AppSpace.sm),
        decoration: BoxDecoration(
          color: active ? tokens.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? tokens.hairline : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: active ? tokens.textPrimary : tokens.textSecondary,
              ),
        ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard();

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return BlockCard(
      title: 'Data & storage',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your entries stay on this device unless you export them.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
          const SizedBox(height: AppSpace.md),
          const DataSection(),
        ],
      ),
    );
  }
}