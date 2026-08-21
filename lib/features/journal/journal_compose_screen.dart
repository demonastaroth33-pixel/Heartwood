import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/services/media/media_capture.dart';

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

  Future<void> _recordVlog() async {
    final session = await ref.read(mediaCaptureProvider).startVlog();
    if (session == null || !mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Recording…'),
        content: const Text('Recording your vlog. Tap stop when done.'),
        actions: [
          FilledButton(
            onPressed: () async {
              final media = await session.stop();
              if (!context.mounted) return;
              Navigator.of(context).pop();
              setState(() => _pendingMedia.add(media));
            },
            child: const Text('Stop'),
          ),
        ],
      ),
    );
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
      await mediaRepo.save(
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
    }
    if (!mounted) return;
    Navigator.of(context).pop();
    await refreshJournal(ref);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_editing ? 'Edit entry' : 'New entry'),
        actions: [
          if (_editing)
            TextButton(
              onPressed: _delete,
              child: const Text('Delete'),
            ),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            key: const Key('compose-title'),
            controller: _title,
            decoration: const InputDecoration(
              labelText: 'Title (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('compose-body'),
            controller: _body,
            minLines: 6,
            maxLines: 14,
            decoration: const InputDecoration(
              labelText: 'What happened today?',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String?>(
            initialValue: _area,
            decoration: const InputDecoration(
              labelText: 'Life area',
              border: OutlineInputBorder(),
            ),
            items: [
              const DropdownMenuItem<String?>(value: null, child: Text('None')),
              ...seedAreas.map(
                (slug) => DropdownMenuItem<String?>(
                  value: slug,
                  child: Text(areaLabels[slug] ?? slug),
                ),
              ),
            ],
            onChanged: (value) => setState(() => _area = value),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('compose-tags'),
            controller: _tags,
            decoration: const InputDecoration(
              labelText: 'Tags (comma-separated)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.schedule),
            title: Text(
              '${_capturedAt.year}-${_capturedAt.month.toString().padLeft(2, '0')}-${_capturedAt.day.toString().padLeft(2, '0')} ${_capturedAt.hour.toString().padLeft(2, '0')}:${_capturedAt.minute.toString().padLeft(2, '0')}',
            ),
            subtitle: const Text('Tap to change'),
            onTap: _pickDate,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: _addPhoto,
                icon: const Icon(Icons.photo_camera_outlined),
                label: const Text('Add photo'),
              ),
              OutlinedButton.icon(
                onPressed: _recordVlog,
                icon: const Icon(Icons.videocam_outlined),
                label: const Text('Record vlog'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (final media in _pendingMedia)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                media.mimeType.startsWith('video/')
                    ? Icons.videocam
                    : Icons.image,
              ),
              title: Text(media.fileName),
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