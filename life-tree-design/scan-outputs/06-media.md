# Life Tree — Media System Input Surface (scan brief 06)

- SOURCE DOC (primary): `docs/MediaStorage.md` (405 lines, read in full)
- CROSS-REFS (secondary, verified via grep only): `docs/Database.md:14,220`, `docs/Roadmap.md:39,124,944,1032`, `docs/DecisionLog.md:355,368-369,927`, `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:35,830`, `docs/StorageSpikeSessionA.md:157`
- SCOPE: exhaustive inventory of the media system as an input surface for the Life Tree engine. Every item carries: WHAT IS / DATA PRODUCED / THRESHOLDS-LIMITS / SOURCE(file:line).
- STATUS: M0 implementation in progress; Drive sync (M11-M13) and J7 PC-vault are designed but not built.

---

## 1. MEDIA TYPES

### T-01 Long-form vlogs
- WHAT IS: daily long-form video recordings (6-7 min typical), explicitly an **expected daily pattern, not an edge case** (Decision 9). The heaviest data type in PersonalOS. "Vlogs are an expected daily pattern... archive-to-PC is the primary destination for the majority of this user's media volume, starting immediately."
- DATA PRODUCED: video blob + audio track, `media_attachments` row (metadata: filename, thumbnail, size, date, tags, `durationSec`, optional `title`, `syncState`, `storageRef`), vlog-local-buffer cache copy, thumbnail.
- THRESHOLDS/LIMITS: ~2 Mbps combined video+audio bitrate target; 6-7 min vlog ≈ 90-110 MB; ≈35 GB/year; PC-archived after 3-5 day local buffer; Drive vault does NOT hold vlogs (bounded by 15 GB).
- SOURCE: `docs/MediaStorage.md:3,9,24-26,55-66,163-183,259-268`

### T-02 Physique photos
- WHAT IS: body-progress photos, "close visual comparison over months, not daily browsing" (Decision 13, 19).
- DATA PRODUCED: photo blob, `media_attachments` row anchored to a journal entry tagged `health`+`physique` (hidden system tag, per backup-A5); thumbnail; queryable by tag (D031).
- THRESHOLDS/LIMITS: exempt from any future general-photo lossy compression tier; low volume; kept at higher signal quality by default; F5 monthly nudge (off by default, no nagging).
- SOURCE: `docs/MediaStorage.md:3,35-36,51-53,270-285`

### T-03 Daily life photos
- WHAT IS: everyday photos (camera or file picker), stored as-is in MVP.
- DATA PRODUCED: photo blob + metadata row + thumbnail; file cache copy on device.
- THRESHOLDS/LIMITS: no re-compression in MVP; lossy resize (1600-2000px long edge) is an OPEN item (D038); small media → Tier 2 Drive vault at P3; dedup by content hash before save.
- SOURCE: `docs/MediaStorage.md:3,116-117,147,157,227-230,387-392`

### T-04 Short clips
- WHAT IS: short video clips (distinct from long-form vlogs), default resident of local blob storage.
- DATA PRODUCED: video blob + metadata row + thumbnail; full-resolution original cached locally as file cache; auto-syncs to Drive vault at P3.
- THRESHOLDS/LIMITS: "small media" class → Tier 2; device keeps file cache after offload.
- SOURCE: `docs/MediaStorage.md:97,147,157,217`

### T-05 Imported external videos
- WHAT IS: videos imported into the app (file import / PC adoption / manual re-import), **never re-encoded, never transcoded** (Decision 3).
- DATA PRODUCED: stored-as-is blob + metadata row (duration parsed from MP4/MOV container header once on PC adoption, ~50-line parse, no ffmpeg) + thumbnail + date harvested.
- THRESHOLDS/LIMITS: preserved without re-encoding; optional lossless **remux** (container-level only) is a configurable future option, NOT default; dedup by content hash applies.
- SOURCE: `docs/MediaStorage.md:12,118,191-192,236-242`

### T-06 Audio (vlog audio track only)
- WHAT IS: audio exists only as the vlog's preserved audio track. **No standalone voice-note media type exists anywhere in docs/ (verified by grep: all "voice" hits are Coach-voice rules, e.g. CoachSystem.md:15,444).**
- DATA PRODUCED: audio inside the video blob; contributes to combined bitrate math.
- THRESHOLDS/LIMITS: audio preserved at capture; "low-pass storage: no raw intermediate"; ~2 Mbps combined video+audio.
- SOURCE: `docs/MediaStorage.md:55-57,111-115` (absence of voice notes = whole-doc absence)

### T-07 Media-type discrimination mechanism
- WHAT IS: the schema discriminates media by `mimeType` column on `media_attachments` (cross-ref; MediaStorage.md itself does not enumerate a closed type list).
- DATA PRODUCED: mimeType string per row.
- SOURCE: cross-ref `docs/Database.md:14`, `docs/StorageSpikeSessionA.md:157`

---

## 2. HOW MEDIA IS ATTACHED (journal entries / standalone / vault)

### A-01 Media attaches to journal entries via `media_attachments`
- WHAT IS: blobs are saved through the local adapter and the **metadata row is created transactionally with the journal entry** — media never exists without its entry at write time.
- DATA PRODUCED: `media_attachments` row (`entryId` FK → journal entry) + blob + event log entry.
- SOURCE: `docs/MediaStorage.md:119-120`; cross-ref FK shape `docs/StorageSpikeSessionA.md:157`, `docs/Database.md:14`

### A-02 Standalone captures are possible at the schema level
- WHAT IS: `entryId` is nullable (null → not linked to a journal entry) per the spike schema.
- DATA PRODUCED: unattached media row.
- SOURCE: cross-ref `docs/StorageSpikeSessionA.md:157` (MediaStorage.md is silent on orphan/standalone rows — ambiguity AMB-05)

### A-03 MediaRepository abstraction (the ONLY interface Journal sees)
- WHAT IS: interface with methods: `save`, `load`, `delete`, `resolve(uri)`, `archiveToPc`, `vaultBrowserQuery`. Journal never touches file storage (Decision 4).
- DATA PRODUCED: none by itself — it is the boundary that produces/consumes all media data.
- SOURCE: `docs/MediaStorage.md:13,83-92`

### A-04 LocalMediaAdapter — two distinct local backing states
- WHAT IS: (a) **in local blob storage** (blob + original present in backend — default for photos/short clips/unarchived vlogs); (b) **archived to PC filesystem** (blob physically moved out of app blob storage into a plain PC folder; row keeps only metadata). Distinct adapter paths; `MediaRepository` never conflates the two.
- DATA PRODUCED: in (b) the row retains filename, thumbnail, size, date, tags; `storageRef` rewritten to the PC path; `syncState` → `archived-to-pc`.
- SOURCE: `docs/MediaStorage.md:95-101`

### A-05 Blob storage backend
- WHAT IS: blobs live in the storage backend (Drift/SQLite-WASM, locked D040) — concretely a `BLOB` column on `media_attachments` with `storageRef` = `blob:<id>`; thumbnails a separate small blob in the same table (`thumbnailRef`).
- DATA PRODUCED: blob bytes in DB; `storageRef` string.
- SOURCE: `docs/MediaStorage.md:93-94`; cross-ref `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:35`

### A-06 Metadata fields on every media row
- WHAT IS: `media_attachments` columns (cross-ref schema): `id, entryId, fileName, mimeType, sizeBytes, durationSec?, title?, capturedAt, syncState, storageRef, thumbnailRef, contentHash?, archivedOnDevice?, adopted`.
- DATA PRODUCED: `syncState` enum: `local-only / metadata-synced / fully-synced / archived-to-pc`.
- SOURCE: `docs/MediaStorage.md:94,187,328,359`; cross-ref `docs/Database.md:14,220`, `docs/DecisionLog.md:368-369` (D037)

### A-07 Physique-photo anchoring via hidden system tag
- WHAT IS: physique photos anchor to a journal entry tagged `health`+`physique` (hidden system tag, per backup-A5). The D031 timeline queries `media_attachments` by that tag. **Zero new tables, zero new media paths** — the tag rides backup/restore automatically.
- DATA PRODUCED: tag on journal entry; tag-derived timeline view.
- SOURCE: `docs/MediaStorage.md:51-53,279-283`

### A-08 Session media (workout anchoring) — DEFERRED, not built
- WHAT IS: deferred line (N8, user): widen `media_attachments` to a polymorphic entity anchor (`journal` | `workout`) via additive migration; tiers and PC-archive unchanged; M2+ timing; revisit anytime.
- DATA PRODUCED: none yet — future `entityType` discriminator.
- SOURCE: `docs/MediaStorage.md:402-404`; cross-ref `docs/Roadmap.md:1032`

### A-09 Adopted media rows (J7) — "Adopted ≠ app storage"
- WHAT IS: J7-adopted rows carry an `adopted` marker; excluded from the storage meter; reuse `archived-to-pc` semantics with **no new enum** (J7e): `storageRef` → user's folder path, `archivedOnDevice` = this PC, `exported: false` stubs in exports.
- DATA PRODUCED: `adopted` boolean; full metadata row exactly like an archived one.
- SOURCE: `docs/MediaStorage.md:49-50,180-183,130-133`

### A-10 Vlog review screen — Keep/Discard gate at attach time
- WHAT IS: every recording ends at a review screen. **Keep** → row created immediately, duration stamped, optional `title` (J7 naming hook). **Discard** → file wiped, no row, zero trophies (no farming via try-cancel loops).
- DATA PRODUCED: kept → full row + duration; discarded → nothing persists.
- SOURCE: `docs/MediaStorage.md:199-203,209`

---

## 3. VAULT FOLDER TREE & METADATA

### V-01 Three-tier storage model — exactly-one-tier invariant
- WHAT IS: three explicit tiers; each media item lives on **exactly one tier at any moment**; an offline file-cache copy of a vault/archived item MAY also exist locally; **thumbnails exist everywhere, always**.
- DATA PRODUCED: tier assignment state per item.
- SOURCE: `docs/MediaStorage.md:19-20,135-139`

### V-02 Tier 1 — Local device (phone AND PC, symmetric)
- WHAT IS: thumbnails always local on every device for every item (separate ~10-20 KB copy, never a replacement); small media (photos, short clips) also cache full-resolution originals as a **file cache** (instantly available, no network). Tier is symmetric across devices; device caches are convergent but **not synced** (local stacks, not a distributed system).
- DATA PRODUCED: per-device thumbnails + file cache.
- SOURCE: `docs/MediaStorage.md:141-153`

### V-03 Tier 2 — Drive vault (cloud)
- WHAT IS: small photos and short videos auto-sync here once full sync ships (P3). Accessible from any device, online, once synced; the app can re-fetch an evicted local original on demand.
- THRESHOLDS/LIMITS: **bounded by the 15 GB free ceiling** — exactly why it is reserved for small media, not vlogs.
- SOURCE: `docs/MediaStorage.md:155-161`

### V-04 Tier 3 — Local PC archive (a plain PC folder, NOT Drive)
- WHAT IS: long vlogs moved **out of the app's local storage entirely** into a plain folder on the PC filesystem, outside the app's DB/blob storage. "Free and unlimited" because it bypasses the Drive quota (Decision 8).
- DATA PRODUCED: blob moved off; row stays permanently in local DB with only metadata (filename, thumbnail, size, date, tags).
- SOURCE: `docs/MediaStorage.md:21-23,163-179`

### V-05 Tier-3 access model (explicit, documented)
- WHAT IS: once archived, the file is reachable ONLY by (a) opening the folder directly on that specific PC outside the app, or (b) manually re-importing it into the app on that same PC. NOT reachable from the phone, NOT from a different PC, unless manually copied by the user outside the app (USB drive, network share). The app makes no promises — vault-browser UI copy says so plainly.
- DATA PRODUCED: access-model state; UI scope note.
- SOURCE: `docs/MediaStorage.md:169-175,311-313`

### V-06 Archived row semantics
- WHAT IS: only the blob leaves; `storageRef` is rewritten to the PC-filesystem archive location; `syncState` becomes `archived-to-pc`. Adopted files reuse the same semantics.
- DATA PRODUCED: rewritten `storageRef`, `syncState=archived-to-pc`, `archivedOnDevice`, `exported:false` flag in export manifests.
- SOURCE: `docs/MediaStorage.md:176-183`

### V-07 `durationSec` — measured exactly once
- WHAT IS: additive nullable `durationSec` on `media_attachments`, measured the moment a file first enters the library: phone capture returns the finished duration from the recorder; PC adoption parses the MP4/MOV container header once (~50-line parse, no ffmpeg). Every later tier move **copies the stored row** — no re-measurement, no re-download, no cross-device drift. Consumers that sum duration read the column only.
- DATA PRODUCED: `durationSec` int (nullable).
- SOURCE: `docs/MediaStorage.md:43-45,185-197`

### V-08 Corrupt/unreadable duration = NULL, never counts
- WHAT IS: an unreadable/corrupt file stores `NULL` and never counts — absolute honesty, no estimates, no user-typed values.
- SOURCE: `docs/MediaStorage.md:196-197`

### V-09 `archivedOnDevice` (multi-device metadata, extends D019)
- WHAT IS: every archived-to-PC row tagged with which machine archived it — field `archivedOnDevice` holding a stable device id per install (existing D019 `deviceId` concept; no new sync system). Metadata crosses devices only via Drive sync; file bytes never travel automatically.
- DATA PRODUCED: `archivedOnDevice` (deviceId, nullable — null = not PC-archived).
- SOURCE: `docs/MediaStorage.md:40-42,352-371`; cross-ref `docs/DecisionLog.md:369`

### V-10 View-only stub for other-device rows
- WHAT IS: rows tagged with a different device's id show as a **view-only stub**: thumbnail, filename, size, date, plus a clear "stored on [device], not this device" state — never a broken/dead link or button.
- DATA PRODUCED: stub display state.
- SOURCE: `docs/MediaStorage.md:361-366`

### V-11 PC vault browser (the only PC-exclusive feature)
- WHAT IS: "PC local vault" browsing mode, desktop-only (Windows desktop build), dedicated screen. On phone builds it must **not render, error, or appear at all**. Filters: **All** (everything the local DB knows), **On this device** (blob on local storage), **In the Drive vault** (rows with `syncState` fully-synced, P3), **Archived on this PC** (metadata-only rows with `archivedOnDevice` = current machine). Plus **"This PC only" toggle** (restricts to items captured or archived on this machine).
- DATA PRODUCED: filtered views; persistent visible scope note: "Shows media captured or archived on this PC. Items from other devices appear here as metadata-only until Drive sync becomes available."
- SOURCE: `docs/MediaStorage.md:37-39,296-315`

### V-12 "My Videos" = videos home INSIDE the vault browser (J7a)
- WHAT IS: PC video library is not a separate screen; it is the videos home inside the vault browser with the same filters, a **thumbnail-grid default**, a **compact-list toggle**, and the J7 search box. Keeps "only PC-exclusive feature" literally true.
- DATA PRODUCED: same rows, different presentation.
- SOURCE: `docs/MediaStorage.md:46-48,317-327`

### V-13 Video naming + offline search (J7)
- WHAT IS: media rows gain a nullable `title` (optional at capture, editable any time; display falls back to `fileName`). Search by name/filename/date/month/year, fully offline, simple matching (no AI), same H3-style matcher as journal search (J2+J7).
- DATA PRODUCED: `title` column; offline search index.
- SOURCE: `docs/MediaStorage.md:328-331`

### V-14 Auto-adopt (J7 option 1)
- WHAT IS: the app remembers **one chosen folder** (File System Access API); on every app open on the PC it scans that folder; any **new video automatically enters the library** (thumbnail + date harvested), no user tap — "put a file, it appears."
- THRESHOLDS/LIMITS: requires **Chromium** (Chrome/Edge; persisted handle re-granted silently on relaunch) — audit MED-16. Other browsers degrade to a manual folder pick per session, no auto-scan.
- SOURCE: `docs/MediaStorage.md:332-339`

### V-15 PC-adopt guardrails
- WHAT IS: app **never** deletes/moves/renames files (folder = source of truth for the blob); a removed file shows an honest **"file missing" stub**; **NO XP**; privacy facts-only — the Coach never inspects video content; names + search index stay offline. Dedup still applies (J7d) — folder scan dedups by content hash; a file copied in twice appears once. Backend-agnostic (J7f): whole J7 family written against the logical `media_attachments` schema only; no IndexedDB/Drift assumption. Backup: metadata rides the usual export; blobs stay on the PC.
- DATA PRODUCED: adopted rows, thumbnails, "file missing" stub state, dedup by contentHash.
- SOURCE: `docs/MediaStorage.md:340-350`

---

## 4. STORAGE LIMITS & COMPRESSION RULES

### L-01 Vlog storage math
- WHAT IS: context numbers for why PC archive is primary destination. ~2 Mbps combined video+audio bitrate ("decent talking-head quality, modest size"); 6-7 min daily vlog ≈ **90-110 MB**; ≈ **35 GB/year** — more than double the entire 15 GB free Drive ceiling in year one even with perfect offloading.
- SOURCE: `docs/MediaStorage.md:55-66`

### L-02 Storage meter on dashboard
- WHAT IS: used/available computed from the storage backend's quota (and local DB size); dashboard block shows usage.
- THRESHOLDS/LIMITS: warn at **70%**, hard-warn at **90%**. Hard-warn prompts: export backup now, and/or offload (P3). All warnings dismissible but re-appear until resolved.
- SOURCE: `docs/MediaStorage.md:14-15,73,124-133`

### L-03 Adopted rows excluded from the meter
- WHAT IS: meter counts app-managed bytes + thumbnails only; adopted rows hold their bytes in the user's own folder, outside app storage — a huge adopted video library must never false-alarm the thresholds (J7c).
- SOURCE: `docs/MediaStorage.md:49-50,130-133`; cross-ref `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:830`

### L-04 Capture constraints (MediaRecorder)
- WHAT IS: in-app recording via browser `MediaRecorder` with reasonable constraints: capped `videoBitsPerSecond` (value decided at build; target: decent talking-head quality at modest size); capped resolution (**720p cap; 1080p only if files stay small**); audio preserved; low-pass storage: no raw intermediate. No ffmpeg.wasm, no heavy re-encoding pipeline in MVP (Decision 2).
- SOURCE: `docs/MediaStorage.md:10-11,109-115`

### L-05 Photo rule: stored as-is
- WHAT IS: photos captured via camera/file picker stored as-is, **no re-compression in MVP**.
- SOURCE: `docs/MediaStorage.md:116-117`

### L-06 Imported video rule: never transcoded
- WHAT IS: imported videos stored as-is, never transcoded in MVP (Decision 3).
- SOURCE: `docs/MediaStorage.md:12,118`

### L-07 Lossy photo compression — OPEN, explicitly NOT locked
- WHAT IS: resizing to a reasonable max dimension (**~1600-2000px long edge**) + re-encoding at capture time would meaningfully reduce storage; small usually-imperceptible quality tradeoff; the ONE non-lossless optimization. **Do not implement without an explicit decision** — tracked D038.
- SOURCE: `docs/MediaStorage.md:31-32,224-225,387-392`

### L-08 Thumbnail size budget
- THRESHOLDS/LIMITS: ~10-20 KB target per thumbnail; always-local separate copy.
- SOURCE: `docs/MediaStorage.md:102-103,143-145`

### L-09 Vlog local buffer (rolling 3-5 days)
- WHAT IS: rolling buffer of the most recent **3-5 days of vlogs cached locally** for quick rewatch; exact number configurable, **default proposed as 5**. When a vlog is older than the buffer limit, the app **actively prompts for PC-archival** (dashboard nudge plus hard-warning). The buffer **is not a deletion policy** — a prompt/nudge; older vlogs remain available until archived and are shown in the storage meter as archivable; no-silent-deletion is absolute (Decision 12).
- SOURCE: `docs/MediaStorage.md:33-34,76-77,259-268`

### L-10 Open constants
- WHAT IS: exact bitrate/resolution constants are a build-time decision; document measured results in `DecisionLog.md`.
- SOURCE: `docs/MediaStorage.md:112,393-394`

### L-11 iPhone PWA quota verification
- WHAT IS: IndexedDB/backend quota behavior verification on iPhone PWA is an M0 test (see `StorageDecision.md`); iOS PWA Safari may evict site data.
- SOURCE: `docs/MediaStorage.md:70,395-396`

---

## 5. UPLOAD / DOWNLOAD SEMANTICS

### U-01 Wi-Fi-only large transfers by default
- WHAT IS: vlog uploads to PC archive prep and any future Drive sync of large files default to **Wi-Fi-only**; user-configurable (allow cellular as an opt-in toggle).
- SOURCE: `docs/MediaStorage.md:253-255`

### U-02 Resumable uploads/downloads
- WHAT IS: any large transfer (future Drive sync) supports resume from interruption rather than restarting from zero.
- SOURCE: `docs/MediaStorage.md:256-257`

### U-03 On-demand re-fetch of evicted originals
- WHAT IS: once synced to Tier 2, the app can re-fetch an evicted local original on demand from the Drive vault.
- SOURCE: `docs/MediaStorage.md:160-161`

### U-04 Predictive preloading
- WHAT IS: while viewing an entry, the next 1-2 items' thumbnails preload quietly in the background (capped, cancelable).
- SOURCE: `docs/MediaStorage.md:249-250`

### U-05 Lazy/virtualized rendering
- WHAT IS: journal/dashboard media lists only decode and render thumbnails currently in the viewport, not the entire history at once.
- SOURCE: `docs/MediaStorage.md:246-248`

### U-06 Batched writes
- WHAT IS: multiple media items saved together (bulk import) are written as one grouped transaction, not one-by-one.
- SOURCE: `docs/MediaStorage.md:251-252`

### U-07 Metadata-only cross-device visibility
- WHAT IS: actual file bytes never travel between devices automatically. Only metadata (e.g. via Drive sync), once it exists, can be visible across devices. User must move files physically (USB stick, network share) — the app does not.
- SOURCE: `docs/MediaStorage.md:367-371`

### U-08 Capture flow returns immediately
- WHAT IS: thumbnail generation is an async background step after save; the capture flow returns immediately and never waits on it.
- SOURCE: `docs/MediaStorage.md:121-122,243-245`

---

## 6. CLOUDMEDIAADAPTER / DRIVE SYNC

### C-01 CloudMediaAdapter — provider-agnostic interface
- WHAT IS: exposes ONLY provider-agnostic operations: `upload(file)→ref`, `download(ref)→file`, `delete(ref)`, `list(prefix)`. Provider-specific concepts (OAuth flow, provider file/folder API shape, sharing semantics) never leave the adapter implementation. No feature or service may call a provider-specific method directly; "swap providers later" is a one-file change.
- DATA PRODUCED: refs (storageRef) into the cloud vault; syncState transitions.
- SOURCE: `docs/MediaStorage.md:89,105-107,287-294`

### C-02 Hard abstraction boundary
- WHAT IS: cloud integration = provider-agnostic adapter + sync service; the Journal system is not rewritten. Hard rule per `Architecture.md`.
- SOURCE: `docs/MediaStorage.md:105-107`

### C-03 Drive sync timeline (post-MVP priority, Decision 6)
- WHAT IS: entity-sync plane first — **Milestone 11**; then P2.5 media-blob sync — **Milestone 12**; then P3 full media vault — **Milestone 13**. P2.5: sync only `media_attachments` rows (metadata + thumbnails).
- SOURCE: `docs/MediaStorage.md:16-18`; cross-ref `docs/DecisionLog.md:355`, `docs/Roadmap.md:39,944`

### C-04 Tier-2 auto-sync at P3
- WHAT IS: small photos and short videos auto-sync to the Drive vault once full sync ships (P3); bounded by 15 GB free ceiling.
- SOURCE: `docs/MediaStorage.md:155-161`

### C-05 Offload workflow (P3)
- WHAT IS: upload to vault, then free device space; metadata always stays in the DB. Short-media offload removes the full original but keeps metadata + thumbnail + cloud copy.
- SOURCE: `docs/MediaStorage.md:78-79,216-217`

### C-06 Bulk "migrate everything to Drive" — future
- WHAT IS: future feature (Roadmap P3+, D039); not built.
- SOURCE: `docs/MediaStorage.md:397-398`

---

## 7. THUMBNAILS

### TH-01 Thumbnails are always local, everywhere
- WHAT IS: separate, always-local copy on every device that has opened the app, for every media item, regardless of type or tier — never a replacement for the original.
- DATA PRODUCED: thumbnail blob (`thumbnailRef` in same table).
- SOURCE: `docs/MediaStorage.md:102-104,143-145`; cross-ref `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:35`

### TH-02 Size budget ~10-20 KB per thumb
- SOURCE: `docs/MediaStorage.md:102-103,144`

### TH-03 Generated async, after save
- WHAT IS: thumbnail generation is a non-blocking background step; capture flow never waits; documented as eventually-consistent — a "generating…" state is acceptable in lists.
- SOURCE: `docs/MediaStorage.md:121-122,243-245`

### TH-04 Thumbnails ride sync metadata plane (P2.5)
- WHAT IS: P2.5 media-blob sync synchronizes ONLY `media_attachments` metadata + thumbnails (Roadmap claim).
- SOURCE: cross-ref `docs/Roadmap.md:39,944` (framed in `docs/MediaStorage.md:16-18`)

---

## 8. MEDIA PRIVACY (FACTS-ONLY RULES FOR DERIVED SURFACES)

### P-01 Coach never inspects media content
- WHAT IS: privacy is facts-only — the Coach never inspects video content (J7 guardrail). Names + search index stay offline.
- DATA PRODUCED: none — the Coach may only ever see metadata facts (duration, size, date, tags, titles, thumbnails are UI-only).
- SOURCE: `docs/MediaStorage.md:340-343`

### P-02 View-only stub = facts-only surface
- WHAT IS: cross-device/archived rows surface as stubs carrying ONLY facts: thumbnail, filename, size, date, "stored on [device], not this device" state. Never a broken/dead link or button.
- SOURCE: `docs/MediaStorage.md:361-366`

### P-03 Honest "file missing" stub
- WHAT IS: a removed/renamed file in the adopted folder shows an honest "file missing" stub — no fabrication.
- SOURCE: `docs/MediaStorage.md:341`

### P-04 Soft-failure stubs on restore
- WHAT IS: restoring a backup elsewhere yields soft-failure stubs pointing at the archive path, consistent with the access model.
- SOURCE: `docs/MediaStorage.md:378-382`

### P-05 No silent deletion, ever
- WHAT IS: every removal (offload, freeing an archived blob) is a deliberate, explicit, user-confirmed action. Tiers define where data lives, not permission to discard it.
- SOURCE: `docs/MediaStorage.md:211-219,268`

### P-06 Hidden physique system tag
- WHAT IS: `health`+`physique` hidden system tag (backup-A5) anchors physique media; rides backup/restore automatically.
- SOURCE: `docs/MediaStorage.md:51-53,279-283`

### P-07 Gamification privacy/facts touchpoints (tree-relevant)
- WHAT IS: **NO XP** on auto-adopted media; **zero trophies** on discarded recordings (anti-farming); **duration trophies read only kept recordings**. Deleting is tier-aware and can carry a `vlog.deleted` tombstone.
- SOURCE: `docs/MediaStorage.md:199-209,342`

---

## 9. MEDIA LIFECYCLE

### LC-01 Recording → review screen
- WHAT IS: every recording ends at a review screen with Keep/Discard.
- SOURCE: `docs/MediaStorage.md:199-203`

### LC-02 Keep
- WHAT IS: row created immediately, duration stamped, optional `title` (J7 naming hook).
- SOURCE: `docs/MediaStorage.md:200-201`

### LC-03 Discard
- WHAT IS: file wiped, no row, zero trophies (no farming via try-cancel loops).
- SOURCE: `docs/MediaStorage.md:202-203`

### LC-04 Delete is tier-aware (no-silent-deletion rule applies)
- WHAT IS: **buffered/phone** → row + local file + `vlog.deleted` tombstone; **Drive-vaulted** → metadata row only; never destroys the blob; **PC-adopted** → the app **never** removes the file (folder = truth, J7); it un-lists and marks a "do-not-readopt" list.
- DATA PRODUCED: tombstones / un-list state / do-not-readopt list.
- SOURCE: `docs/MediaStorage.md:204-208`

### LC-05 Retention policy
- WHAT IS: no silent deletion, ever; short media: Drive-first at P3, device keeps file cache, offload removes the full original but keeps metadata + thumbnail + cloud copy; long vlogs: local file cache holds a rolling buffer, everything older actively prompted for PC archive.
- SOURCE: `docs/MediaStorage.md:211-219`

### LC-06 Vlog buffer prompt (active nudge)
- WHAT IS: vlogs older than the buffer limit → active prompt for PC-archival (dashboard nudge + hard-warning); buffer is not a deletion policy; older vlogs remain available until archived; shown as archivable in the meter.
- SOURCE: `docs/MediaStorage.md:259-268`

### LC-07 PC archive action (Tier-3 move)
- WHAT IS: blob moved out of app storage into the PC folder; row keeps metadata permanently; storageRef rewritten; syncState → archived-to-pc.
- SOURCE: `docs/MediaStorage.md:176-183`

### LC-08 Export (safety valve, non-negotiable MVP)
- WHAT IS: export includes media files with the JSON snapshot + **sha256 manifest**; works fully offline, no Drive phase required; one tap produces the full backup (Decision 5).
- DATA PRODUCED: backup bundle (JSON + media + manifest).
- SOURCE: `docs/MediaStorage.md:14-15,75,373-383`

### LC-09 Import/restore
- WHAT IS: import verifies hashes and reports missing files as **soft failures**.
- SOURCE: `docs/MediaStorage.md:376-377`

### LC-10 PC-archived vlogs export as metadata-only
- WHAT IS: `exported: false` in the manifest — backup documents them but does not duplicate bytes; restore elsewhere yields soft-failure stubs at the archive path.
- DATA PRODUCED: `exported: false` flag per manifest entry.
- SOURCE: `docs/MediaStorage.md:378-382`

### LC-11 Tier moves copy the stored row
- WHAT IS: every later tier move copies the stored row — no re-measurement, no re-download, no cross-device drift; consumers sum `durationSec` column only.
- SOURCE: `docs/MediaStorage.md:193-195`

---

## 10. USER ACTIONS THAT PRODUCE MEDIA DATA (input-surface inventory)

- UA-01 **Record a vlog in-app** (MediaRecorder) → blob + row + thumbnail → `docs/MediaStorage.md:109-122`
- UA-02 **Capture a photo via camera** → blob stored as-is + row → `:116-117`
- UA-03 **Pick a photo via file picker** → blob stored as-is + row → `:116-117`
- UA-04 **Import an external video file** → stored as-is, never transcoded + row (optional remux later) → `:12,118,236-242`
- UA-05 **Keep a vlog at the review screen** → row immediately, duration stamped, optional title → `:200-201`
- UA-06 **Discard a vlog at the review screen** → file wiped, no row, zero trophies → `:202-203`
- UA-07 **Delete media** (tier-aware) → tombstone/un-list/do-not-readopt → `:204-208`
- UA-08 **Accept PC-archive prompt for old vlogs** (dashboard nudge) → blob to PC folder, row → archived-to-pc → `:76-77,259-268`
- UA-09 **J7 auto-adopt**: choose one folder (File System Access API) → auto-scan on every app open; new videos enter library with thumbnail + date harvested, no tap → `:332-335`
- UA-10 **J7 manual folder pick** (non-Chromium browsers) → per-session pick, no auto-scan → `:336-339`
- UA-11 **Manually re-import an archived file** on the same PC → re-enters the library → `:170-171`
- UA-12 **F5 physique-photo nudge** (optional monthly reminder, off by default, no nagging) → opens a prefilled journal composer (media then captured normally); nudge rule lives in CoachSystem.md → `:283-285`
- UA-13 **One-tap export backup** → JSON + media + sha256 manifest, offline → `:75,373-383`
- UA-14 **Import/restore a backup** → hash verify, soft failures reported → `:376-377`
- UA-15 **Bulk import of media** → batched grouped transaction → `:251-252`
- UA-16 **Offload to Drive** (P3, future) → upload to vault then free device space; metadata stays → `:78-79,217`
- UA-17 **Configure vlog buffer size** (default 5) → affects buffer/prompt window → `:261-262`
- UA-18 **Toggle cellular for large transfers** (Wi-Fi-only default) → allows uploads on cellular → `:253-255`

---

## 11. LOCKED DECISIONS (contract, all 19)

- D-01 Long-form vlogs supported in MVP, stored locally as-is — `:9`
- D-02 Capture-time compression via browser-native MediaRecorder; no ffmpeg.wasm, no heavy re-encoding in MVP — `:10-11`
- D-03 Imported external videos preserved without re-encoding — `:12`
- D-04 Media Repository abstraction — Journal never touches file storage — `:13`
- D-05 Storage meter + threshold warnings + export-as-safety-valve are non-negotiable MVP features — `:14-15`
- D-06 Drive sync is first post-MVP priority (entity-sync M11, P2.5 media-blob sync M12, P3 full vault M13) — `:16-18`
- D-07 Three-tier storage model (Tier 1 local, Tier 2 Drive vault, Tier 3 PC manual archive) — `:19-20`
- D-08 PC manual archive is NOT Drive — plain PC folder outside app blob storage, explicit access model — `:21-23`
- D-09 Vlogs are an expected daily pattern, not an edge case; archive-to-PC is the primary destination starting immediately — `:24-26`
- D-10 Lossless media optimizations approved (dedup, remux option, background thumbnails, lazy rendering, preloading, batched writes, Wi-Fi-only transfers, resumable uploads); sequence preserved — `:27-30`
- D-11 Lossy photo compression is an OPEN item; document tradeoff, no implementation without explicit later decision — `:31-32`
- D-12 Vlog local buffer — rolling ~3-5 day local cache, configurable, nudge-only (never silent deletion) — `:33-34`
- D-13 Physique-photo timeline; physique category exempt from any future general-photo compression tier — `:35-36`
- D-14 PC vault browser is the only PC-exclusive feature — `:37-39`
- D-15 Multi-device metadata tagging — `archivedOnDevice` via existing `deviceId` (extends D019); metadata crosses devices only via Drive sync, bytes never automatically — `:40-42`
- D-16 Vlog duration stored, measured once — `durationSec` on `media_attachments`; tier moves copy the stored row — `:43-45`
- D-17 PC video library ("My Videos") is the videos home inside the PC vault browser, not a separate screen (J7a) — `:46-48`
- D-18 Adopted ≠ app storage — `adopted` marker; excluded from storage meter — `:49-50`
- D-19 Physique photos anchor to a journal entry tagged `health`+`physique` (hidden system tag); D031 timeline queries by tag; zero new tables/paths — `:51-53`

---

## 12. LOSSLESS OPTIMIZATIONS (approved, all 9)

- O-01 **Content-hash deduplication** — sha256 of blob before saving any new photo/video; check existing rows; on match skip duplicate blob and point new row at existing `storageRef` — `:227-230`
- O-02 **Lossless re-encoding as available option (not default)** — strips redundant metadata/color-profile bloat without touching pixels; configurable option to design later — `:231-235`
- O-03 **Video remux for imported files** — container-level bloat cleanup (redundant tracks, added metadata), stream packets unchanged; NOT a D012 violation; **dedup must run on a pluggable logical key (not raw blob)** so remux of an already-stored video still dedups — `:236-242,399-401`
- O-04 **Background thumbnail generation after save** — non-blocking; "generating…" state acceptable — `:243-245`
- O-05 **Lazy/virtualized rendering** — viewport-only thumbnail decode/render — `:246-248`
- O-06 **Predictive preloading** — next 1-2 items' thumbnails, capped, cancelable — `:249-250`
- O-07 **Batched writes** — grouped transaction for bulk saves — `:251-252`
- O-08 **Wi-Fi-only large transfers by default** — PC-archive-prep uploads + future Drive sync; cellular = opt-in toggle — `:253-255`
- O-09 **Resumable uploads/downloads** — resume from interruption for large transfers — `:256-257`

---

## 13. OPEN ITEMS / NOT-YET-DECIDED

- OI-01 Lossy photo compression (D038) — do not implement without explicit decision — `:387-392`
- OI-02 Exact bitrate/resolution constants — build-time decision; measure + log in DecisionLog.md — `:112,393-394`
- OI-03 IndexedDB/backend quota behavior verification on iPhone PWA (M0 test) — `:395-396`
- OI-04 Bulk "migrate everything to Drive" (D039, P3+) — `:397-398`
- OI-05 Dedup logical key design (remux caveat: must not false-positive on derived copies) — `:399-401`
- OI-06 Session media (N8) — deferred; polymorphic entity anchor (`journal` | `workout`), M2+ — `:402-404`

---

## 14. AMBIGUITIES / ABSENCES (noted, not resolved)

- AMB-01 **Voice notes are absent as a media type** across all of docs/ (grep-verified). Audio exists only as a vlog track. If the Life Tree assumes voice notes exist, that assumption is unsupported by the media contract.
- AMB-02 "offload from v2" (line 214: "Every removal (offload from v2, freeing an archived blob)...") — "v2" is undefined in MediaStorage.md; no v2 offload concept is otherwise documented.
- AMB-03 Tier 1 "file cache" vs. the storage meter: whether cached full-resolution copies of vaulted/archived items count toward the meter is not spelled out (meter = "app-managed bytes + thumbnails"; cache of an archived blob may or may not be app-managed).
- AMB-04 Standalone media (nullable `entryId`) is schema-level only; MediaStorage.md never describes the UI/flow for creating unattached media. The tree should not assume every media row has an entry.
- AMB-05 `MediaRecorder` constraints ("capped videoBitsPerSecond, value decided at build") — no concrete number exists; the ~2 Mbps figure is the math assumption, not a confirmed constant.
- AMB-06 720p cap is "e.g." — the doc says "e.g., 720p cap; 1080p only if files stay small" — resolution cap wording is illustrative.
- AMB-07 "Windows desktop build" (line 298) is the only platform named for the PC vault; nothing is said about the Linux/macOS desktop story for Tier 3.
- AMB-08 The tree's media-relevant trophies are mentioned only negatively (zero trophies on discard, trophies read kept recordings, NO XP on adopted); the full gamification contract lives in Gamification.md, not this doc.

---

## 15. CROSS-REFERENCE INDEX (secondary sources, verified by grep)

- XR-01 `media_attachments` full column list + syncState enum — `docs/Database.md:14,220`
- XR-02 Blob-as-BLOB-in-table + `storageRef=blob:<id>` + `thumbnailRef` — `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:35`; `docs/StorageSpikeSessionA.md:144,157`
- XR-03 Storage meter implementation note (estimate() + sum of sizeBytes for non-adopted rows) — `docs/superpowers/plans/2026-08-21-m0-core-loop-mvp.md:830`
- XR-04 P2.5 syncs "ONLY media_attachments metadata + thumbnails" — `docs/Roadmap.md:39,944`; `docs/DecisionLog.md:355`
- XR-05 D037 schema extension (`archivedOnDevice` etc.) — `docs/DecisionLog.md:368-369`
- XR-06 D031 physique timeline / F5 nudge — `docs/Roadmap.md:124`; `docs/DecisionLog.md:927`
- XR-07 N8 session media — `docs/Roadmap.md:1032`

---

## 16. TREE-RELEVANT TAKEAWAYS (facts only, no design)

- Media rows are the substance holders: a media-rich journal entry carries blob + `sizeBytes` + `durationSec` + `mimeType` + `title` — all of it metadata facts a Coach could read without violating facts-only privacy (P-01).
- Facts available per media item: fileName, mimeType, sizeBytes, durationSec (nullable, honest NULL), title (nullable), capturedAt, syncState, storageRef, thumbnailRef, contentHash, archivedOnDevice, adopted — plus the entry's hidden tags (physique anchor).
- Duration math for tree features must use `durationSec` only (kept recordings only; NULL never counts; no estimates).
- No XP / zero trophies rules constrain any gamification the tree might attach to media actions (discard, adopt).
- Vlogs are the dominant volume: ~90-110 MB/day expected, Tier-3-first lifecycle — the tree should treat vlog presence as the norm, not a rarity.