import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/settings/data_section.dart';
import 'package:personalos/services/storage/storage_meter.dart';

import 'block_card.dart';

final storageMeterProvider = FutureProvider<StorageMeterData>(
  (ref) => StorageMeter(ref.watch(dbProvider)).read(),
);

String _formatBytes(int bytes) {
  if (bytes >= 1073741824) {
    return '${(bytes / 1073741824).toStringAsFixed(1)} GB';
  }
  if (bytes >= 1048576) {
    return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  }
  return '${(bytes / 1024).toStringAsFixed(1)} KB';
}

class StorageMeterBlock extends ConsumerStatefulWidget {
  const StorageMeterBlock({super.key});

  @override
  ConsumerState<StorageMeterBlock> createState() => _StorageMeterBlockState();
}

class _StorageMeterBlockState extends ConsumerState<StorageMeterBlock> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final meter = ref.watch(storageMeterProvider);
    return BlockCard(
      title: 'Storage',
      child: meter.when(
        loading: () => const SizedBox(
          height: 24,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => EmptyLine(text: 'Could not read storage: $e'),
        data: (data) {
          final quota = data.quotaBytes;
          final fraction = quota <= 0 ? 0.0 : (data.usedBytes / quota).clamp(0.0, 1.0);
          final level = data.level;
          final color = switch (level) {
            StorageLevel.none => const Color(0xFF4E7DCC),
            StorageLevel.warn => const Color(0xFFE8B45A),
            StorageLevel.hardWarn => const Color(0xFFE06C5A),
          };
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: fraction,
                color: color,
                backgroundColor: const Color(0xFF0F141E),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 8),
              Text(
                quota <= 0
                    ? 'Used: ${_formatBytes(data.usedBytes)}'
                    : 'Used ${_formatBytes(data.usedBytes)} of ${_formatBytes(data.quotaBytes)}'
                        ' (${(fraction * 100).toStringAsFixed(0)}%)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (data.dbMediaBytes > 0)
                Text(
                  'Media: ${_formatBytes(data.dbMediaBytes)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              if (level != StorageLevel.none && !_dismissed) ...[
                const SizedBox(height: 8),
                _WarningBanner(
                  level: level,
                  onDismiss: () => setState(() => _dismissed = true),
                  onExport: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text('Backup')),
                        body: ListView(
                          padding: const EdgeInsets.all(16),
                          children: const [DataSection()],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _WarningBanner extends StatelessWidget {
  final StorageLevel level;
  final VoidCallback onDismiss;
  final VoidCallback onExport;

  const _WarningBanner({
    required this.level,
    required this.onDismiss,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    final hard = level == StorageLevel.hardWarn;
    final color = hard ? const Color(0xFFE06C5A) : const Color(0xFFE8B45A);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  hard
                      ? 'Storage almost full. Export a backup now.'
                      : 'Storage getting full. Consider exporting a backup.',
                ),
              ),
              IconButton(
                onPressed: onDismiss,
                icon: const Icon(Icons.close),
                tooltip: 'Dismiss',
              ),
            ],
          ),
          if (hard)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: FilledButton(
                onPressed: onExport,
                child: const Text('Export backup now'),
              ),
            ),
        ],
      ),
    );
  }
}