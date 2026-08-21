import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/data/repositories/export_import_repository.dart';
import 'package:personalos/services/web/files.dart';

class DataSection extends ConsumerWidget {
  const DataSection({super.key});

  Future<void> _export(BuildContext context, WidgetRef ref) async {
    final repo = ref.read(exportRepoProvider);
    final bundle = await repo.exportAll();
    final stamp = DateTime.now();
    final fileName =
        'PersonalOS-backup-${stamp.year}-${stamp.month.toString().padLeft(2, '0')}-${stamp.day.toString().padLeft(2, '0')}-${stamp.hour.toString().padLeft(2, '0')}${stamp.minute.toString().padLeft(2, '0')}.json';
    downloadBytes(fileName, utf8.encode(bundle.json));
    for (final entry in bundle.mediaFiles.entries) {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      downloadBytes(entry.key, entry.value);
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Backup exported (${bundle.mediaFiles.length} media files).')),
    );
  }

  Future<void> _restore(BuildContext context, WidgetRef ref) async {
    final picked = await pickFiles(multiple: true);
    final jsonFile =
        picked.where((f) => f.name.endsWith('.json')).firstOrNull;
    if (jsonFile == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pick the backup .json file to restore.')),
      );
      return;
    }
    final mediaFiles = <String, Uint8List>{};
    for (final file in picked) {
      if (file.name.startsWith('media_')) {
        mediaFiles[file.name] = file.bytes;
      }
    }
    final repo = ref.read(exportRepoProvider);
    try {
      final report = await repo.restore(
        ExportBundle(json: utf8.decode(jsonFile.bytes), mediaFiles: mediaFiles),
      );
      if (!context.mounted) return;
      final missing = report.missingFiles.isEmpty
          ? ''
          : '\nMissing media: ${report.missingFiles.join(', ')}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Restored ${report.importedRows} rows.$missing',
          ),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Restore failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DATA & STORAGE', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Backup & restore'),
          subtitle: Text('Export everything as JSON + media, or restore a backup.'),
        ),
        Wrap(
          spacing: 8,
          children: [
            FilledButton.icon(
              onPressed: () => _export(context, ref),
              icon: const Icon(Icons.download_outlined),
              label: const Text('Export backup'),
            ),
            OutlinedButton.icon(
              onPressed: () => _restore(context, ref),
              icon: const Icon(Icons.upload_outlined),
              label: const Text('Restore backup'),
            ),
          ],
        ),
      ],
    );
  }
}