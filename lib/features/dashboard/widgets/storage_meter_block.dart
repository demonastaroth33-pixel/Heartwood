import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/settings/data_section.dart';
import 'package:personalos/services/storage/storage_meter.dart';
import 'package:personalos/widgets/block_card.dart';

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
        data: (data) => _MeterBody(
          data: data,
          dismissed: _dismissed,
          onDismiss: () => setState(() => _dismissed = true),
        ),
      ),
    );
  }
}

class _MeterBody extends StatelessWidget {
  final StorageMeterData data;
  final bool dismissed;
  final VoidCallback onDismiss;

  const _MeterBody({
    required this.data,
    required this.dismissed,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final quota = data.quotaBytes;
    final fraction = quota <= 0 ? 0.0 : (data.usedBytes / quota).clamp(0.0, 1.0);
    final level = data.level;
    final color = switch (level) {
      StorageLevel.none => tokens.accent,
      StorageLevel.warn => tokens.warning,
      StorageLevel.hardWarn => tokens.danger,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              quota <= 0
                  ? 'Used: ${_formatBytes(data.usedBytes)}'
                  : '${_formatBytes(data.usedBytes)} of ${_formatBytes(data.quotaBytes)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (quota > 0)
              Text(
                '${(fraction * 100).toStringAsFixed(0)}%',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: color),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: LinearProgressIndicator(
            value: fraction,
            color: color,
            backgroundColor: tokens.surfaceRaised,
            minHeight: 8,
          ),
        ),
        if (data.dbMediaBytes > 0) ...[
          const SizedBox(height: AppSpace.sm),
          Text(
            'Media: ${_formatBytes(data.dbMediaBytes)}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
        ],
        if (level != StorageLevel.none && !dismissed) ...[
          const SizedBox(height: AppSpace.md),
          _WarningBanner(
            level: level,
            onDismiss: onDismiss,
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
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final hard = level == StorageLevel.hardWarn;
    final color = hard ? tokens.danger : tokens.warning;
    return Container(
      padding: const EdgeInsets.all(AppSpace.md),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.md),
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
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              IconButton(
                onPressed: onDismiss,
                icon: const Icon(Icons.close),
                tooltip: 'Dismiss',
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          if (hard)
            Padding(
              padding: const EdgeInsets.only(top: AppSpace.xs),
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