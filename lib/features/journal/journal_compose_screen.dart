import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/features/journal/widgets/media_thumb.dart';
import 'package:personalos/services/media/media_capture.dart';
import 'package:personalos/services/media/thumbnail.dart';
import 'package:personalos/services/web/video_view.dart';
import 'package:personalos/widgets/app_field.dart';

class JournalComposeScreen extends ConsumerStatefulWidget {
  final JournalEntry? entry;

  const JournalComposeScreen({super.key, this.entry});

  @override
  ConsumerState<JournalComposeScreen> createState() =>
      _JournalComposeScreenState();
}

class _JournalComposeScreenState extends ConsumerState<JournalComposeScreen> {
  late final TextEditingController _title;
  late final TextEditingController _body;
  late final TextEditingController _tags;
  late String? _area;
  late DateTime _capturedAt;
  final List<CapturedMedia> _pendingMedia = [];
  List<MediaAttachment> _existingMedia = [];
  bool _saving = false;

  bool get _editing => widget.entry != null;

  @override
  void initState() {
    super.initState();
    final entry = widget.entry;
    _title = TextEditingController(text: entry?.title ?? '');
    _body = TextEditingController(text: entry?.body ?? '');
    _tags = TextEditingController(text: entry?.tags.join(', ') ?? '');
    _area = entry?.area;
    _capturedAt = entry?.createdAt ?? DateTime.now();
    if (_editing) {
      // G1: edit mode loads the entry's existing attachments.
      Future.microtask(() async {
        final media = await ref
            .read(mediaRepoProvider)
            .forEntry(widget.entry!.id);
        if (mounted) setState(() => _existingMedia = media);
      });
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    _tags.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _capturedAt,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    if (!mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_capturedAt),
    );
    if (time == null) return;
    setState(() {
      _capturedAt = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<void> _addPhoto() async {
    final media = await ref.read(mediaCaptureProvider).pickPhoto();
    if (media == null || !mounted) return;
    setState(() => _pendingMedia.add(media));
  }

  Future<void> _addVideo() async {
    final media = await ref.read(mediaCaptureProvider).pickVideo();
    if (media == null || !mounted) return;
    setState(() => _pendingMedia.add(media));
  }

  Future<void> _recordVlog() async {
    final session = await ref.read(mediaCaptureProvider).startVlog();
    if (session == null || !mounted) return;
    // G5: live preview bound to the recording stream while recording.
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) return;
          try {
            await session.stop();
          } catch (_) {}
          if (dialogContext.mounted) {
            Navigator.of(dialogContext).pop();
          }
        },
        child: AlertDialog(
          title: const Text('Recording…'),
          content: SizedBox(
            width: 320,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: LivePreview(
                streamHandle: session.previewHandle,
                fallback: Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.videocam, size: 40),
                      const SizedBox(height: AppSpace.sm),
                      Text(
                        'Live preview unavailable',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () async {
                CapturedMedia? media;
                try {
                  media = await session.stop();
                } catch (_) {}
                if (!dialogContext.mounted) return;
                Navigator.of(dialogContext).pop();
                if (media == null) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Recording failed.')),
                  );
                  return;
                }
                // G4: Keep/Discard review after recording.
                await _reviewCaptured(media);
              },
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }

  /// G4: post-recording review — duration + optional title, Keep or Discard.
  /// Discard wipes the file (never stored); Keep creates the pending row.
  Future<void> _reviewCaptured(CapturedMedia media) async {
    if (!mounted) return;
    final title = TextEditingController();
    final keep = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Review vlog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.videocam,
                    size: 16,
                    color: Theme.of(context)
                        .extension<AppTokens>()!
                        .textSecondary),
                const SizedBox(width: AppSpace.sm),
                Text(
                  '${media.durationSec ?? 0}s recorded',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpace.md),
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Title (optional)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Discard'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Keep'),
          ),
        ],
      ),
    );
    if (keep != true || !mounted) return;
    setState(() {
      _pendingMedia.add(CapturedMedia(
        bytes: media.bytes,
        mimeType: media.mimeType,
        durationSec: media.durationSec,
        fileName: title.text.trim().isEmpty
            ? media.fileName
            : title.text.trim(),
      ));
    });
  }

  Future<void> _save() async {
    if (_saving) return;
    final body = _body.text.trim();
    if (body.isEmpty) return;
    setState(() => _saving = true);
    final tags = _tags.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();
    final journalRepo = ref.read(journalRepoProvider);
    final mediaRepo = ref.read(mediaRepoProvider);

    String entryId;
    if (_editing) {
      await journalRepo.update(
        widget.entry!.copyWith(
          title: _title.text.trim().isEmpty ? null : _title.text.trim(),
          body: body,
          area: _area,
          tags: tags,
          updatedAt: DateTime.now(),
        ),
      );
      entryId = widget.entry!.id;
    } else {
      final entry = await journalRepo.create(
        title: _title.text.trim().isEmpty ? null : _title.text.trim(),
        body: body,
        area: _area,
        tags: tags,
        at: _capturedAt,
      );
      entryId = entry.id;
    }
    for (final media in _pendingMedia) {
      final saved = await mediaRepo.save(
        MediaAttachment(
          id: newId('ma'),
          entryId: entryId,
          fileName: media.fileName,
          mimeType: media.mimeType,
          sizeBytes: media.bytes.length,
          durationSec: media.durationSec,
          capturedAt: _capturedAt,
          syncState: 'local-only',
          storageRef: '',
          adopted: false,
        ),
        media.bytes,
      );
      if (saved.mimeType.startsWith('video/')) {
        // G6: background thumbnail generation — never blocks the save.
        unawaited(_generateThumbnail(saved.id, media.bytes, saved.mimeType));
      }
    }
    if (!mounted) return;
    Navigator.of(context).pop();
    await refreshJournal(ref);
  }

  Future<void> _generateThumbnail(String id, Uint8List bytes, String mimeType) async {
    final thumb = await generateVideoThumbnail(bytes, mimeType);
    if (thumb == null) return;
    try {
      await ref.read(mediaRepoProvider).setThumbnail(id, thumb);
    } catch (_) {
      // Thumbnail is a nicety — failure never fails the entry.
    }
  }

  Future<void> _delete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete entry?'),
        content: const Text('This removes the entry and its media.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await ref.read(journalRepoProvider).delete(widget.entry!.id);
    if (!mounted) return;
    Navigator.of(context).pop();
    await refreshJournal(ref);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final canSave = _body.text.trim().isNotEmpty && !_saving;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tokens.surface,
        title: Text(_editing ? 'Edit entry' : 'New entry'),
        actions: [
          if (_editing)
            TextButton(
              onPressed: _delete,
              child: const Text('Delete'),
            ),
          FilledButton(
            onPressed: canSave ? _save : null,
            child: _saving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpace.lg),
        children: [
          AppField(
            key: const Key('compose-title'),
            controller: _title,
            hint: 'Title (optional)',
          ),
          const SizedBox(height: AppSpace.md),
          AppField(
            key: const Key('compose-body'),
            controller: _body,
            hint: 'What happened today?',
            multiline: true,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: AppSpace.md),
          _AreaSelector(
            selected: _area,
            onChanged: (v) => setState(() => _area = v),
          ),
          const SizedBox(height: AppSpace.md),
          AppField(
            key: const Key('compose-tags'),
            controller: _tags,
            hint: 'Tags, comma-separated',
          ),
          const SizedBox(height: AppSpace.sm),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
            leading: Icon(Icons.schedule, color: tokens.textSecondary),
            title: Text(
              '${_capturedAt.year}-${_capturedAt.month.toString().padLeft(2, '0')}-${_capturedAt.day.toString().padLeft(2, '0')} ${_capturedAt.hour.toString().padLeft(2, '0')}:${_capturedAt.minute.toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: const Text('Tap to change'),
            onTap: _pickDate,
          ),
          const SizedBox(height: AppSpace.sm),
          Wrap(
            spacing: AppSpace.sm,
            children: [
              FilledButton.icon(
                onPressed: _addPhoto,
                icon: const Icon(Icons.photo_camera_outlined, size: 18),
                label: const Text('Add photo'),
              ),
              FilledButton.icon(
                onPressed: _recordVlog,
                icon: const Icon(Icons.videocam_outlined, size: 18),
                label: const Text('Record vlog'),
              ),
              FilledButton.icon(
                onPressed: _addVideo,
                icon: const Icon(Icons.video_file_outlined, size: 18),
                label: const Text('Import video'),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.sm),
          for (final media in _existingMedia)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                width: 48,
                height: 48,
                child: MediaThumb(
                  mediaId: media.id,
                  mimeType: media.mimeType,
                  durationSec: media.durationSec,
                ),
              ),
              title: Text(media.fileName,
                  style: Theme.of(context).textTheme.bodyMedium),
              subtitle: media.durationSec == null
                  ? null
                  : Text('${media.durationSec}s'),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Remove attachment',
                onPressed: () async {
                  await ref.read(mediaRepoProvider).delete(media.id);
                  if (mounted) {
                    setState(() =>
                        _existingMedia.removeWhere((m) => m.id == media.id));
                  }
                },
              ),
            ),
          for (final media in _pendingMedia)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                media.mimeType.startsWith('video/')
                    ? Icons.videocam
                    : Icons.image,
                color: tokens.textSecondary,
              ),
              title: Text(media.fileName,
                  style: Theme.of(context).textTheme.bodyMedium),
              subtitle: media.durationSec == null
                  ? null
                  : Text('${media.durationSec}s'),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () =>
                    setState(() => _pendingMedia.remove(media)),
              ),
            ),
        ],
      ),
    );
  }
}

class _AreaSelector extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onChanged;

  const _AreaSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpace.sm, bottom: AppSpace.xs),
          child: Text(
            'Life area',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: tokens.textSecondary),
          ),
        ),
        Wrap(
          spacing: AppSpace.sm,
          runSpacing: AppSpace.sm,
          children: [
            _AreaChip(
              label: 'None',
              active: selected == null,
              onTap: () => onChanged(null),
            ),
            ...seedAreas.map(
              (slug) => _AreaChip(
                label: areaLabels[slug] ?? slug,
                active: selected == slug,
                onTap: () => onChanged(slug),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AreaChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _AreaChip({
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
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.lg, vertical: AppSpace.sm),
        decoration: BoxDecoration(
          color: active ? tokens.accent : tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: active ? tokens.accent : tokens.hairline,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: active ? tokens.onAccent : tokens.textSecondary,
              ),
        ),
      ),
    );
  }
}