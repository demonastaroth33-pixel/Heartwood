import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personalos/core/constants.dart';
import 'package:personalos/core/device_pace.dart';
import 'package:personalos/core/ids.dart';
import 'package:personalos/core/theme/tokens.dart';
import 'package:personalos/data/models/journal_entry.dart';
import 'package:personalos/data/models/media_attachment.dart';
import 'package:personalos/data/providers.dart';
import 'package:personalos/features/journal/journal_providers.dart';
import 'package:personalos/features/journal/widgets/media_thumb.dart';
import 'package:personalos/features/journal/widgets/vlog_capture.dart';
import 'package:personalos/services/media/media_capture.dart';
import 'package:personalos/services/media/thumbnail.dart';
import 'package:personalos/widgets/animated_widgets.dart';
import 'package:personalos/widgets/core_widgets.dart';
import 'package:personalos/widgets/heartwood_icon.dart';

/// Opens the journal compose as a route whose VISIBLE entrance is a live
/// frame-paced slide driven inside the page itself.
///
/// Why not a normal route transition: the compose's first paint costs up to
/// ~1s on weak GPUs, and a wall-clock route animation is eaten by that paint
/// (the slide is half-done before the first visible frame). Here the route
/// opens instantly (1ms) and a PacedAnimation slides the page 1/45 per
/// RENDERED frame — the first paint IS the first step, and every following
/// frame is a visible step of the slide at any frame rate.
///
/// Why not a raw overlay entry: dialogs pushed from inside an overlay entry
/// (delete confirm, date picker, vlog capture/review) render BELOW it — a
/// real route keeps the standard z-ordering. Returns a future that completes
/// when the compose closes.
Future<void> openComposeOverlay(BuildContext context, {JournalEntry? entry}) {
  return Navigator.of(context).push(
    PageRouteBuilder<void>(
      // opaque: false — the dashboard stays visible behind the sliding
      // compose, exactly like the reference's `.compose-panel` over the app.
      opaque: false,
      transitionDuration: const Duration(milliseconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 1),
      pageBuilder: (context, animation, secondary) =>
          _ComposeOverlayHost(entry: entry),
    ),
  );
}

/// Frame-paced slide host for the compose route.
class _ComposeOverlayHost extends StatefulWidget {
  final JournalEntry? entry;

  const _ComposeOverlayHost({required this.entry});

  @override
  State<_ComposeOverlayHost> createState() => _ComposeOverlayHostState();
}

class _ComposeOverlayHostState extends State<_ComposeOverlayHost>
    with SingleTickerProviderStateMixin {
  late final PacedAnimation _slide =
      PacedAnimation(vsync: this, targetFrames: 16);
  bool _closing = false;

  @override
  void initState() {
    super.initState();
    _slide.forward();
    _slide.addStatusListener((status) {
      if (_closing && status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _slide.dispose();
    super.dispose();
  }

  void _close() {
    if (_closing) return;
    _closing = true;
    _slide.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close();
      },
      child: AnimatedBuilder(
        animation: _slide,
        builder: (context, child) => FractionalTranslation(
          // easeOut: fast glide, soft landing (no hard snap at the top).
          translation: Offset(0, 1 - Curves.easeOut.transform(_slide.value)),
          child: child,
        ),
        child: RepaintBoundary(
          child: JournalComposeScreen(
            entry: widget.entry,
            onClose: _close,
          ),
        ),
      ),
    );
  }
}

class JournalComposeScreen extends ConsumerStatefulWidget {
  final JournalEntry? entry;

  /// When set, closes via this callback instead of Navigator.pop — used by
  /// the overlay-based compose host (frame-paced slide, see
  /// [openComposeOverlay]).
  final VoidCallback? onClose;

  const JournalComposeScreen({super.key, this.entry, this.onClose});

  @override
  ConsumerState<JournalComposeScreen> createState() =>
      _JournalComposeScreenState();
}

class _JournalComposeScreenState extends ConsumerState<JournalComposeScreen> {
  late final TextEditingController _title;
  late final TextEditingController _body;
  late String? _area;
  final List<String> _tags = [];
  late DateTime _capturedAt;
  final List<CapturedMedia> _pendingMedia = [];
  List<MediaAttachment> _existingMedia = [];
  bool _saving = false;
  bool _saved = false;

  bool get _editing => widget.entry != null;

  @override
  void initState() {
    super.initState();
    final entry = widget.entry;
    _title = TextEditingController(text: entry?.title ?? '');
    _body = TextEditingController(text: entry?.body ?? '');
    _area = entry?.area;
    _capturedAt = entry?.createdAt ?? DateTime.now();
    if (entry != null) _tags.addAll(entry.tags);
    if (_editing) {
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
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _capturedAt,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date == null || !mounted) return;
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
    final result = await runVlogCapture(context, ref.read(mediaCaptureProvider));
    if (result == null || !mounted) return;
    setState(() => _pendingMedia.add(result.media));
  }

  Future<void> _save() async {
    if (_saving) return;
    final body = _body.text.trim();
    if (body.isEmpty) return;
    setState(() => _saving = true);
    final journalRepo = ref.read(journalRepoProvider);
    final mediaRepo = ref.read(mediaRepoProvider);

    String entryId;
    if (_editing) {
      await journalRepo.update(
        widget.entry!.copyWith(
          title: _title.text.trim().isEmpty ? null : _title.text.trim(),
          body: body,
          area: _area,
          tags: _tags,
          updatedAt: DateTime.now(),
        ),
      );
      entryId = widget.entry!.id;
    } else {
      final entry = await journalRepo.create(
        title: _title.text.trim().isEmpty ? null : _title.text.trim(),
        body: body,
        area: _area,
        tags: _tags,
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
        unawaited(_generateThumbnail(saved.id, media.bytes, saved.mimeType));
      }
    }
    if (!mounted) return;
    // Success beat before closing (mirrors saveCompose in the mock).
    setState(() => _saved = true);
    await Future<void>.delayed(const Duration(milliseconds: 650));
    if (!mounted) return;
    _close();
    await refreshJournal(ref);
  }

  void _close() {
    final onClose = widget.onClose;
    if (onClose != null) {
      onClose();
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _generateThumbnail(
      String id, dynamic bytes, String mimeType) async {
    final thumb = await generateVideoThumbnail(bytes, mimeType);
    if (thumb == null) return;
    try {
      await ref.read(mediaRepoProvider).setThumbnail(id, thumb);
    } catch (_) {}
  }

  Future<void> _delete() async {
    final confirmed = await showBlurDialog<bool>(
      context: context,
      builder: (context) => _DeleteConfirm(
        onCancel: () => Navigator.of(context).pop(false),
        onDelete: () => Navigator.of(context).pop(true),
      ),
    );
    if (confirmed != true || !mounted) return;
    await ref.read(journalRepoProvider).delete(widget.entry!.id);
    if (!mounted) return;
    _close();
    await refreshJournal(ref);
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    // Mirrors validateCompose: disabled only when title AND body are empty.
    final valid =
        (_title.text.trim().isNotEmpty || _body.text.trim().isNotEmpty) &&
            !_saving;
    return Scaffold(
      backgroundColor: tokens.bg,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: tokens.hairline)),
            ),
            child: Row(
              children: [
                HoverRotate(
                  size: 36,
                  child: GestureDetector(
                    onTap: _close,
                    child: HeartwoodIconWidget(
                      icon: HeartwoodIcon.x,
                      size: 16,
                      color: tokens.textSecondary,
                    ),
                  ),
                ),
                // Mirrors `.compose-topbar` space-between: title centered
                // between the close and the action cluster.
                Expanded(
                  child: Center(
                    child: Text(
                      _editing ? 'Edit entry' : 'New entry',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: tokens.textSecondary,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_editing) ...[
                      _ComposeDeleteButton(onTap: _delete),
                      const SizedBox(width: 10),
                    ],
                    _SaveButton(
                      valid: valid,
                      saving: _saving,
                      saved: _saved,
                      onPressed: _save,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 100),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FieldInput(
                        controller: _title,
                        hint: 'Title (optional)',
                        textStyle: const TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF1EFE2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _pickDate,
                        child: Row(
                          children: [
                            HeartwoodIconWidget(
                              icon: HeartwoodIcon.rings,
                              size: 13,
                              color: tokens.accent,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '${_friendlyTimestamp(_capturedAt)} · tap to change',
                              style: TextStyle(
                                fontSize: 12,
                                color: tokens.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const FieldLabel(text: 'Entry'),
                      FieldInput(
                        controller: _body,
                        hint: 'What happened today?',
                        multiline: true,
                        autoGrow: true,
                        minLines: 5,
                        onChanged: (_) => setState(() {}),
                      ),
                      const FieldLabel(text: 'Life area'),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          LifeChip(
                            label: 'None',
                            active: _area == null,
                            onTap: () => setState(() => _area = null),
                          ),
                          for (final slug in seedAreas)
                            LifeChip(
                              label: areaLabels[slug] ?? slug,
                              active: _area == slug,
                              onTap: () => setState(() => _area = slug),
                            ),
                        ],
                      ),
                      const FieldLabel(text: 'Tags'),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final tag in _tags)
                            PopIn(key: ValueKey('tag-$tag'), child: _TagChip(tag: tag, onRemove: () {
                              setState(() => _tags.remove(tag));
                            })),
                          GestureDetector(
                            onTap: _addTag,
                            child: const _AddTagButton(),
                          ),
                        ],
                      ),
                      const FieldLabel(text: 'Media'),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final media in _existingMedia)
                            PopIn(
                              key: ValueKey('ex-${media.id}'),
                              child: _ExistingMediaThumb(
                                media: media,
                                onRemove: () async {
                                  await ref
                                      .read(mediaRepoProvider)
                                      .delete(media.id);
                                  if (mounted) {
                                    setState(() => _existingMedia
                                        .removeWhere((m) => m.id == media.id));
                                  }
                                },
                              ),
                            ),
                          for (final media in _pendingMedia)
                            PopIn(
                              key: ValueKey('pend-${media.fileName}'),
                              child: _PendingMediaThumb(
                                media: media,
                                onRemove: () => setState(
                                    () => _pendingMedia.remove(media)),
                              ),
                            ),
                          _MediaAddButton(onTap: _addPhoto),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _RecordPill(onTap: _recordVlog),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// "Today, 9:41 AM" — mirrors the mock's timestamp row copy.
  static String _friendlyTimestamp(DateTime t) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final that = DateTime(t.year, t.month, t.day);
    final diff = today.difference(that).inDays;
    final h12 = t.hour % 12 == 0 ? 12 : t.hour % 12;
    final minute = t.minute.toString().padLeft(2, '0');
    final ampm = t.hour < 12 ? 'AM' : 'PM';
    final clock = '$h12:$minute $ampm';
    if (diff == 0) return 'Today, $clock';
    if (diff == 1) return 'Yesterday, $clock';
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[t.month - 1]} ${t.day}, $clock';
  }

  void _addTag() {
    final controller = TextEditingController();
    // Blurred, scaled pop dialog (mirrors the mock's modal language).
    showBlurDialog<void>(
      context: context,
      builder: (dialogContext) => _AddTagDialog(
        controller: controller,
        onCancel: () => Navigator.of(dialogContext).pop(),
        onAdd: () {
          final t = controller.text.trim();
          if (t.isNotEmpty && !_tags.contains(t)) {
            setState(() => _tags.add(t));
          }
          Navigator.of(dialogContext).pop();
        },
      ),
    );
  }
}

class _SaveButton extends StatefulWidget {
  final bool valid;
  final bool saving;
  final bool saved;
  final VoidCallback onPressed;

  const _SaveButton({
    required this.valid,
    required this.saving,
    required this.saved,
    required this.onPressed,
  });

  @override
  State<_SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<_SaveButton> {
  bool _hover = false;

  static const _shadowIdle = [
    BoxShadow(
      color: Color(0x73A9C28C),
      blurRadius: 14,
      offset: Offset(0, 8),
    ),
  ];
  static const _shadowHover = [
    BoxShadow(
      color: Color(0x99A9C28C),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final valid = widget.valid;
    return Opacity(
      opacity: valid ? 1 : 0.38,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: valid ? widget.onPressed : null,
          child: AnimatedContainer(
            duration: DevicePace.durationForFrames(8),
            curve: AppMotion.standard,
            transform: Matrix4.translationValues(
                0, _hover && valid ? -1 : 0, 0),
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: tokens.accent,
              borderRadius: BorderRadius.circular(AppRadius.pill),
              boxShadow: valid
                  ? _hover
                      ? _shadowHover
                      : _shadowIdle
                  : null,
            ),
            child: widget.saving
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PopIn(
                        key: ValueKey('save-${widget.saved}'),
                        child: HeartwoodIconWidget(
                          icon: HeartwoodIcon.check,
                          size: 15,
                          color: tokens.accentInk,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: tokens.accentInk,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

/// Delete affordance in edit mode — rust pill that lifts on hover.
class _ComposeDeleteButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ComposeDeleteButton({required this.onTap});

  @override
  State<_ComposeDeleteButton> createState() => _ComposeDeleteButtonState();
}

class _ComposeDeleteButtonState extends State<_ComposeDeleteButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: DevicePace.durationForFrames(8),
          curve: AppMotion.standard,
          transform: Matrix4.translationValues(0, _hover ? -1 : 0, 0),
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: tokens.rustWash,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Row(
            children: [
              HeartwoodIconWidget(
                icon: HeartwoodIcon.x,
                size: 14,
                color: tokens.rust,
              ),
              const SizedBox(width: 6),
              Text(
                'Delete',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: tokens.rust,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaAddButton extends StatefulWidget {
  final VoidCallback onTap;

  const _MediaAddButton({required this.onTap});

  @override
  State<_MediaAddButton> createState() => _MediaAddButtonState();
}

class _MediaAddButtonState extends State<_MediaAddButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final accent = _hover;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: DashedBorder(
          color: accent ? tokens.accent : tokens.hairlineStrong,
          radius: AppRadius.md,
          width: 2,
          child: AnimatedContainer(
            duration: DevicePace.durationForFrames(8),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: accent ? tokens.accentWash : null,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeartwoodIconWidget(
                  icon: HeartwoodIcon.camera,
                  size: 16,
                  color: accent ? tokens.accent : tokens.textTertiary,
                ),
                const SizedBox(height: 5),
                Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                    color: accent ? tokens.accent : tokens.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// "+ Add tag" — dashed hairline pill with accent hover (mirrors
/// `.add-tag-btn`).
class _AddTagButton extends StatefulWidget {
  const _AddTagButton();

  @override
  State<_AddTagButton> createState() => _AddTagButtonState();
}

class _AddTagButtonState extends State<_AddTagButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final accent = _hover;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: DashedBorder(
        // The highlight lives INSIDE the dashed line so it matches the
        // border exactly; the line is 2px so it reads clearly.
        color: accent ? tokens.accent : tokens.hairlineStrong,
        radius: AppRadius.pill,
        width: 2,
        child: AnimatedContainer(
          duration: DevicePace.durationForFrames(8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: accent ? tokens.accentWash : null,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Text(
            '+ Add tag',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: accent ? tokens.accent : tokens.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}

/// Tag entry dialog — Fraunces title, quiet field, pill actions.
class _AddTagDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onAdd;

  const _AddTagDialog({
    required this.controller,
    required this.onCancel,
    required this.onAdd,
  });

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
          Text(
            'Add tag',
            style: TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: tokens.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'A short label for this entry.',
            style: TextStyle(fontSize: 12.5, color: tokens.textSecondary),
          ),
          const SizedBox(height: 16),
          FieldInput(controller: controller, hint: 'e.g. Garden'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PillButton(
                label: 'Cancel',
                ghost: true,
                onPressed: onCancel,
              ),
              const SizedBox(width: 10),
              PillButton(
                label: 'Add',
                onPressed: onAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String tag;
  final VoidCallback onRemove;

  const _TagChip({required this.tag, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: tokens.accentWash,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: tokens.accentDeep,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: HeartwoodIconWidget(
              icon: HeartwoodIcon.x,
              size: 9,
              color: tokens.accentDeep,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExistingMediaThumb extends StatelessWidget {
  final MediaAttachment media;
  final VoidCallback onRemove;

  const _ExistingMediaThumb({required this.media, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: MediaThumb(
              mediaId: media.id,
              mimeType: media.mimeType,
              durationSec: media.durationSec,
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: tokens.bgDeep.withValues(alpha: 0.7),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: HeartwoodIconWidget(
                  icon: HeartwoodIcon.x,
                  size: 9,
                  color: tokens.paper,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingMediaThumb extends StatelessWidget {
  final CapturedMedia media;
  final VoidCallback onRemove;

  const _PendingMediaThumb({required this.media, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    final isVideo = media.mimeType.startsWith('video/');
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: tokens.surfaceRaised,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: tokens.hairlineStrong),
            ),
            child: isVideo
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeartwoodIconWidget(
                        icon: HeartwoodIcon.camera,
                        size: 18,
                        color: tokens.accent,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${media.durationSec ?? 0}s',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontSize: 9,
                          color: tokens.textSecondary,
                        ),
                      ),
                    ],
                  )
                : HeartwoodIconWidget(
                    icon: HeartwoodIcon.leaf,
                    size: 18,
                    color: tokens.accent,
                  ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: tokens.bgDeep.withValues(alpha: 0.7),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: HeartwoodIconWidget(
                  icon: HeartwoodIcon.x,
                  size: 9,
                  color: tokens.paper,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecordPill extends StatelessWidget {
  final VoidCallback onTap;

  const _RecordPill({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: tokens.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: tokens.hairline, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: tokens.rust,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 9),
            Text(
              'Record a vlog',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: tokens.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteConfirm extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const _DeleteConfirm({required this.onCancel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppTokens>()!;
    return Dialog(
      backgroundColor: tokens.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        side: BorderSide(color: tokens.hairline),
      ),
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete entry?',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: tokens.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This removes the entry and its media. This can\'t be undone.',
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
                  label: 'Delete',
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}