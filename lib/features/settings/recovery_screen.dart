import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/data/repositories/export_import_repository.dart';
import 'package:personalos/services/web/files.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// D021 boot-integrity recovery surface — Heartwood treatment. Mirrors
/// `.recovery-panel` / `.recovery-card`.
class RecoveryScreen extends ConsumerWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Scaffold(
      backgroundColor: tokens.bgDeep,
      body: Center(
        child: Container(
          width: 430,
          padding: const EdgeInsets.all(34),
          decoration: BoxDecoration(
            color: tokens.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(color: tokens.rust.withValues(alpha: 0.35)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: tokens.rustWash,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: HeartwoodIconWidget(
                  icon: HeartwoodIcon.moon,
                  size: 20,
                  color: tokens.rust,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your archive needs attention',
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF1EFE2),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The database didn\'t pass its boot integrity check, so Heartwood stopped before touching anything. Your data file is untouched and nothing has been lost.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.65,
                  color: tokens.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Export a safety copy first if you can — then restore from your latest backup.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.65,
                  color: tokens.textSecondary,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: tokens.bgDeep,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  'integrity: sha256 mismatch · schema v1 · recovery mode',
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 10.5,
                    color: tokens.textTertiary,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  PillButton(
                    label: 'Export backup',
                    icon: HeartwoodIcon.export,
                    ghost: true,
                    onPressed: () async {
                      final bundle =
                          await ref.read(exportRepoProvider).exportAll();
                      downloadBytes(
                        'PersonalOS-recovery-${DateTime.now().millisecondsSinceEpoch}.json',
                        utf8.encode(bundle.json),
                      );
                      for (final entry in bundle.mediaFiles.entries) {
                        downloadBytes(entry.key, entry.value);
                      }
                    },
                  ),
                  PillButton(
                    label: 'Restore',
                    icon: HeartwoodIcon.export,
                    onPressed: () async {
                      final picked = await pickFiles(multiple: true);
                      final jsonFile =
                          picked.where((f) => f.name.endsWith('.json')).firstOrNull;
                      if (jsonFile == null || !context.mounted) return;
                      final mediaFiles = <String, Uint8List>{};
                      for (final file in picked) {
                        if (file.name.startsWith('media_')) {
                          mediaFiles[file.name] = file.bytes;
                        }
                      }
                      try {
                        await ref.read(exportRepoProvider).restore(
                              ExportBundle(
                                json: utf8.decode(jsonFile.bytes),
                                mediaFiles: mediaFiles,
                              ),
                            );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Restore complete. Restart the app.'),
                          ),
                        );
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Restore failed: $e')),
                        );
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Relaunch',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: tokens.textTertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}