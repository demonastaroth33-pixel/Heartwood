import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/data/repositories/export_import_repository.dart';
import 'package:personalos/services/web/files.dart';

class RecoveryScreen extends ConsumerWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data recovery')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your local database failed its integrity check. '
              'Writes are blocked so nothing is overwritten.',
            ),
            const SizedBox(height: 8),
            const Text(
              'Step 1: export whatever is still readable. '
              'Step 2: restore from your latest backup.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                FilledButton.icon(
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
                  icon: const Icon(Icons.download_outlined),
                  label: const Text('Export what is readable'),
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    final picked = await pickFiles(multiple: true);
                    final jsonFile =
                        picked.where((f) => f.name.endsWith('.json')).firstOrNull;
                    if (jsonFile == null) return;
                    final mediaFiles = <String, Uint8List>{};
                    for (final file in picked) {
                      if (file.name.startsWith('media/')) {
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
                  icon: const Icon(Icons.upload_outlined),
                  label: const Text('Restore from backup'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}