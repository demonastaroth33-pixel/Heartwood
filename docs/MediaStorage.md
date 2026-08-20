# PersonalOS — Media Storage

Media is the heaviest and most sensitive data in PersonalOS: physique photos,
daily life photos, and long-form vlogs. This document defines the media
pipeline, the repository abstraction, and the storage-limits strategy.

## Decisions (locked)

1. **Long-form vlogs are supported in the MVP**, stored locally as-is.
2. **Capture-time compression** via browser-native MediaRecorder — no
   ffmpeg.wasm, no heavy re-encoding pipeline in MVP.
3. **Imported external videos are preserved without re-encoding.**
4. **Media Repository abstraction** — Journal never touches file storage.
5. **Storage meter + threshold warnings + export-as-safety-valve** are
   non-negotiable MVP features (long videos consume local storage).
6. **Drive sync is the first post-MVP priority** (P2.5 metadata/thumbnail sync,
   then P3 full media vault — see `Roadmap.md`).
7. **Three-tier storage model** — Tier 1 local working set/thumbnails, Tier 2
   Drive vault, Tier 3 PC manual archive (see Three-Tier Storage Model below).
8. **PC manual archive is NOT Drive** — a plain folder on the PC's filesystem,
   outside the app's blob storage, with an explicit access model (folder open or
   manual re-import on that same PC only; nothing the app carries across devices).
9. **Vlogs are an expected daily pattern, not an edge case** — archive-to-PC is
   the primary destination for the majority of this user's media volume,
   starting immediately.
10. **Lossless media optimizations approved** (dedup, remux option, background
    thumbnails, lazy rendering, preloading, batched writes, Wi-Fi-only
    transfers, resumable uploads). Sequence preserved as written in
    "Performance Optimizations (lossless)".
11. **Lossy photo compression is an OPEN item** — document the tradeoff, do not
    implement without an explicit later decision (see Open Items).
12. **Vlog local buffer** — rolling ~3-5 day local cache for recent vlogs,
    configurable, nudge-only (never silent deletion).
13. **Physique-photo timeline** — dedicated comparison view; physique category
    is exempt from any future general-photo compression tier.
14. **PC vault browser is the only PC-exclusive feature** (physically true:
    PC-archived files only exist on that machine's disk — see `Architecture.md`
    platform-parity guardrail).
15. **Multi-device metadata tagging** — `archivedOnDevice` via the existing
    `deviceId` (extends D019; metadata crosses devices only via Drive sync, file
    bytes never travel automatically).
16. **Vlog duration is stored, measured once** — `durationSec` on
    `media_attachments`, measured the moment a file first enters the library;
    later tier moves copy the stored row (see Vlog duration & lifecycle below).
17. **PC video library ("My Videos") is the videos home inside the PC vault
    browser** — not a separate screen (J7a merge); the vault browser remains the
    one PC-exclusive feature (see Desktop Media UI below).
18. **Adopted ≠ app storage** — J7-adopted rows carry an `adopted` marker and
    are excluded from the storage meter (see Storage Meter & Warnings).
19. **Physique photos anchor to a journal entry** tagged `health`+`physique`
    (hidden system tag) — the D031 timeline queries `media_attachments` by that
    tag; zero new tables or media paths (see Physique-Photo Timeline).

## Vlog Storage Math (context)

At a conservative combined video+audio bitrate of ~2 Mbps (matching the existing
"decent talking-head quality, modest size" MVP target), a 6–7 minute daily vlog
is roughly **90–110 MB**. Recorded daily, that is approximately **35 GB/year**
— more than double the entire 15 GB free Google Drive ceiling, in year one
alone, even with perfect offloading.

**Implication:** archiving long vlogs to PC is not an edge case — it is the
**primary destination for the majority of this user's media volume, starting
immediately.** The retention strategy below is written for a designed-for,
expected *daily* pattern, not a rare occurrence.

## Tradeoff (documented, accepted)

Long videos consume local storage. On iOS PWA, storage is limited and Safari may
evict site data. Mitigations, in order:

1. Storage meter on dashboard (used / available).
2. Warning thresholds (e.g., warn at 70%, hard warning at 90%).
3. Export is the primary safety mechanism — one tap produces the full backup.
4. Vlog local buffer prompt → PC archive (see Vlog Local Buffer) — an active
   nudge, not a passive warning.
5. Offload workflow once Drive sync lands (P2.5/P3): upload to vault, then free
   device space; metadata always stays in the DB.

## Media Repository Abstraction

```
Journal feature
    → MediaRepository   (interface: save, load, delete, resolve(uri),
                         archiveToPc, vaultBrowserQuery)
    → LocalMediaAdapter     (MVP: local blob storage +
                             PC-filesystem archive sink on desktop)
    → CloudMediaAdapter   (future: provider-agnostic cloud vault)
```

- The Journal depends only on `MediaRepository`.
- Local adapter stores blobs in the storage backend (see `StorageDecision.md`)
  with metadata rows in `media_attachments` (`syncState`, `storageRef`).
- **`LocalMediaAdapter` distinguishes two local backing states:**
  - **in local blob storage** (blob + original present in the backend) — the
    default for photos/short clips and unarchived vlogs;
  - **archived to PC filesystem** — blob physically moved out of the app's blob
    storage into a plain folder on that PC; the `media_attachments` row keeps
    only metadata locally (filename, thumbnail, size, date, tags). This is a
    distinct adapter path; `MediaRepository` never conflates the two.
- Thumbnails are a **separate, always-local copy** (small, ~10–20 KB target) on
  every device that has opened the app, regardless of media type — never a
  replacement for the original.
- Cloud integration = provider-agnostic adapter + sync service; the Journal
  system is not rewritten. This is a hard abstraction boundary (see
  `Architecture.md` — cloud provider abstraction discipline is a hard rule).

## Capture Pipeline (MVP)

- In-app recording uses browser `MediaRecorder` with **reasonable constraints**:
  - capped `videoBitsPerSecond` (value decided at build; target: decent
    talking-head quality at modest size)
  - capped resolution (e.g., 720p cap; 1080p only if files stay small)
  - audio preserved; low-pass storage: no raw intermediate
- Photos captured via camera/file picker, stored as-is (no re-compression in
  MVP).
- Imported videos: stored as-is, never transcoded in MVP.
- Blobs are saved through the local adapter; metadata row is created
  transactionally with the journal entry.
- **Thumbnail generation is an async background step after save** — the capture
  flow returns immediately and never waits on it (see lossless optimizations).

## Storage Meter & Warnings

- Compute used/available from the storage backend's quota (and local DB size).
- Dashboard block shows usage; thresholds warn (70%) and hard-warn (90%).
- Hard-warn prompts: export backup now, and/or offload (P3).
- All warnings are dismissible but re-appear until resolved.
- **Adopted rows are excluded from the meter.** The meter counts app-managed
  bytes + thumbnails only — adopted rows (`adopted` marker) hold their bytes in
  the user's own folder, outside app storage, so a huge adopted video library
  must never false-alarm the thresholds (J7c).

## Three-Tier Storage Model

Storage is organized in three explicit tiers. Each media item lives on exactly
one tier at any moment (an offline file-cache copy of a vault/archived item may
also exist locally; thumbnails exist everywhere, always).

### Tier 1 — Local device (any device: phone AND PC)

- **Thumbnails are always stored locally on every device, for every media item,
  regardless of type or tier.** They are a small (~10–20 KB), separate copy —
  never a replacement for the original.
- Small media (photos, short clips) also cache their full-resolution original
  locally as a **file cache** — instantly available, no network needed.
- This tier is **symmetric across devices** — it is not phone-specific or
  PC-specific. Every device that has ever opened the app caches its own
  thumbnails/file cache independently. Device caches are convergent (same items)
  but not synced yet (see Part-8 multi-device note: metadata crosses devices via
  Drive sync once P2.5 ships; Tier-1 copies are local stacks, not a distributed
  system).

### Tier 2 — Drive vault (cloud)

- Small photos and short videos auto-sync here once full sync ships (P3).
- **Bounded by the 15 GB free ceiling** — this is exactly why it is reserved
  for small media, not vlogs.
- Accessible from any device, online, once synced — the app can re-fetch an
  evicted local original on demand.

### Tier 3 — Local PC archive (a PC folder — NOT Drive)

- Long vlogs are moved **out of the app's local storage entirely** into a plain
  folder on the PC filesystem, **outside the app's own database/blob storage**.
- This is why it is "free and unlimited": it bypasses the Drive quota entirely,
  using local disk space instead.
- **Access model (documented, explicit):** once archived here, the file is only
  reachable by (a) opening the folder directly on that specific PC outside the
  app, or (b) manually re-importing it back into the app on that same PC. It is
  **NOT reachable from the phone**, and **NOT reachable from a different PC**,
  unless manually copied by the user outside the app (e.g. USB drive, network
  share). The app makes no promises about this — UI copy in the vault browser
  says so plainly.
- **The metadata row for an archived vlog stays in the local database
  permanently** (filename, thumbnail, size, date, tags) — only the video blob
  leaves. Its `storageRef` is rewritten to point at the PC-filesystem archive
  location; `syncState` becomes `archived-to-pc`.
- **Adopted files reuse the same `archived-to-pc` semantics — no new enum
  (J7e).** A J7-adopted video row is written exactly like an archived one:
  `storageRef` → the user's folder path, `archivedOnDevice` = this PC,
  `exported: false` stubs in exports.

### Vlog duration & lifecycle

- `media_attachments` gains an additive nullable `durationSec` column.
- Duration is measured **exactly once**, the moment a file first enters the
  library:
  - phone capture returns the finished duration from the recorder;
  - PC adoption (J7) parses the MP4/MOV container header once (a ~50-line parse,
    no ffmpeg).
- Every later tier move **copies the stored row** — no re-measurement, no
  re-download, no cross-device drift. Consumers that sum duration read the
  column only.
- An unreadable/corrupt file stores `NULL` and **never counts** (absolute
  honesty: no estimates, no user-typed values).
- **Vlog lifecycle:**
  1. Every recording ends at a **review screen**:
     - **Keep** — row created immediately, duration stamped, optional `title`
       (J7 naming hook);
     - **Discard** — file wiped, no row, zero trophies (no farming via
       try-cancel loops).
  2. **Delete is tier-aware** (the no-silent-deletion rule applies):
     - buffered/phone — row + local file + `vlog.deleted` tombstone;
     - Drive-vaulted — metadata row only; never destroys the blob;
     - PC-adopted — the app **never** removes the file (folder = truth, J7);
       it un-lists and marks a "do-not-readopt" list.
  3. Duration trophies read only **kept** recordings.

### Retention policy

- **No silent deletion, ever.** Every removal (offload from v2, freeing an
  archived blob) is a deliberate, explicit, user-confirmed action. The tiers
  above define where data lives, not permission to discard it.
- Short media: Drive-first at P3; device keeps file cache; offload removes the
  full original but keeps metadata + thumbnail + cloud copy.
- Long vlogs: local file cache holds a rolling buffer (see Vlog Local Buffer);
  everything older is actively prompted for PC archive.

## Performance Optimizations (lossless)

All optimizations below are lossless — none touches pixel or audio data. They
are approved for implementation. The **one** lossy option (photo resize) is
explicitly NOT included; it is an open item (see Open Items).

1. **Content-hash deduplication** — before saving any new photo or video,
   compute a hash (e.g. sha256 of the blob) and check existing
   `media_attachments` rows. If a match exists, skip storing a duplicate blob
   and point the new row at the existing `storageRef`.
2. **Lossless re-encoding as an available option (not a default)** — some
   re-encoding tools exist that strip redundant metadata / color-profile bloat
   without touching pixel data. Documented as a middle-ground between "store
   as-is" and lossy resize. **Not a default; flagged as a configurable option
   to design later.**
3. **Video remux for imported files** — cleaning container-level bloat
   (redundant tracks, added metadata) without touching the actual video/audio
   encoding. This is distinct from re-encoding and is **not** a violation of the
   "no re-encoding" decision (D012): remuxing copies stream packets unchanged;
   only container headers are rewritten. Because the on-disk blob differs after
   a remux, dedup hashing must run on a pluggable logical key (not the raw
   blob) so a remux of an already-stored video still dedups (see Open Items).
4. **Thumbnail generation in the background, after save** — non-blocking;
   capture flow never waits on thumbnails. The thumb is documented as
   eventually-consistent (a "generating…" state is acceptable in lists).
5. **Lazy / virtualized rendering** — journal/dashboard media lists only decode
   and render thumbnails currently in the viewport, not the entire history at
   once.
6. **Predictive preloading** — while viewing an entry, the next 1–2 items'
   thumbnails preload quietly in the background (capped, cancelable).
7. **Batched writes** — when multiple media items are saved together (bulk
   import), write them as one grouped transaction rather than one-by-one.
8. **Wi-Fi-only large transfers by default** — vlog uploads to PC archive prep
   and any future Drive sync of large files default to Wi-Fi-only;
   user-configurable (allow cellular as an opt-in toggle).
9. **Resumable uploads/downloads** — any large transfer (future Drive sync)
   supports resume from interruption rather than restarting from zero.

## Vlog Local Buffer

- Keep a rolling buffer of the **most recent 3–5 days of vlogs cached locally**
  for quick rewatch (exact number configurable; default proposed as 5).
- When a vlog is older than the buffer limit, the app **actively prompts for
  PC-archival** (dashboard nudge plus hard-warning), rather than relying only on
  the passive 70%/90% storage-threshold warnings.
- The buffer **is not a deletion policy** — it is a prompt/nudge. Older vlogs
  remain available until archived, and are shown in the storage meter as
  archivable. The no-silent-deletion principle is absolute here.

## Physique-Photo Timeline

- New dedicated comparison view for physique photos specifically:
  side-by-side or slider (before/after or over-time) comparison.
- This category's purpose is close visual comparison over months, not daily
  browsing — so its default behavior is **not** to be subject to whatever the
  general daily-photo compression tier ends up being (lossy resize, see Open
  Items). Keep physique photos at higher signal quality by default; its low
  volume makes that cheap.
- The timeline is a UI/view derivative over existing media attachments
  **anchored to a journal entry tagged `health` + `physique`** (a hidden system
  tag, per backup-A5). The D031 timeline queries `media_attachments` by that
  tag — zero new tables, zero new media paths; the tag rides backup/restore
  automatically. The F5 physique-photo nudge (an optional monthly reminder, off
  by default, no nagging) opens a prefilled journal composer; the nudge rule
  itself lives in `CoachSystem.md`.

## Cloud Provider Abstraction

See `Architecture.md`. The hard rule: `CloudMediaAdapter` exposes only
provider-agnostic operations (`upload(file)→ref`, `download(ref)→file`,
`delete(ref)`, `list(prefix)`). Provider-specific concepts (OAuth flow, the
provider's file/folder API shape, provider sharing semantics) never leave the
adapter implementation. No feature or service may call a provider-specific
method directly. This is how "swap providers later" stays a one-file change.

## Desktop Media UI (PC-only)

- A **"PC local vault"** browsing mode, accessible only when running on desktop
  (Windows desktop build), and surfaced as a dedicated screen.
  - On phone builds this screen must **not render, error, or appear at all** —
    a phone has no PC-archive folder to read from.
  - Shows all local media with filters:
    - **All** (everything the local database knows about)
    - **On this device** (blob on local storage)
    - **In the Drive vault** (rows whose `syncState` is fully-synced,
      P3)
    - **Archived on this PC** (metadata-only rows whose `archivedOnDevice` equals
      the current machine)
  - **"This PC only" toggle** — restricts the view to items captured or archived
    on this machine (see Multi-device metadata below).
  - Must include a persistent, visible scope note in the UI, e.g.: "Shows media
    captured or archived on this PC. Items from other devices appear here as
    metadata-only until Drive sync becomes available."
- This is the **only** platform-exclusive feature in PersonalOS (see
  `Architecture.md`, platform-parity guardrail).

### PC Videos — "My Videos" (J7)

- The PC video library is **not a separate screen** (J7a): it is the **videos
  home inside this vault browser**. The same filters apply (All / On this
  device / In the Drive vault / Archived on this PC + the "This PC only"
  toggle), with a **thumbnail-grid default**, a **compact-list toggle**, and
  the J7 search box. The "only PC-exclusive feature" claim above stays
  literally true — the vault browser is the one home.
- **PC-only per the D035 physically-true test** — video files live only on that
  PC's disk; on phone builds this view does not render at all (same discipline
  as the vault browser).
- **Naming** — media rows gain a nullable `title` (optional at capture,
  editable any time; display falls back to `fileName`).
- **Search** — finds by name/filename/date/month/year, fully offline, simple
  matching (no AI). Uses the same H3-style matcher as journal search (J2+J7).
- **Auto-adopt (option 1)** — the app remembers **one chosen folder** (File
  System Access API); on every app open on the PC it scans that folder, and any
  **new video automatically enters the library** (thumbnail + date harvested),
  no user tap — "put a file, it appears."
- **Browser coverage (audit MED-16)** — auto-adopt (persisted folder +
  auto-scan) requires **Chromium** (Chrome/Edge; the persisted handle is
  re-granted silently on relaunch). Other browsers degrade to a manual folder
  pick per session, no auto-scan.
- **Guardrails** — the app **never** deletes/moves/renames files (the folder is
  the source of truth for the blob); a removed file shows an honest **"file
  missing" stub**; **NO XP**; privacy is facts-only — the Coach never inspects
  video content; names + search index stay offline.
- **Dedup still applies** (J7d) — the folder scan dedups by content hash; a
  file copied into the folder twice appears once.
- **Backend-agnostic** (J7f) — the whole J7 family (metadata rows, thumbnails,
  `adopted` marker, meter math) is written against the **logical
  `media_attachments` schema only**; no IndexedDB/Drift assumption — it holds
  for whichever backend Session C locked.
- **Backup** — metadata rides the usual export; blobs stay on the PC.

## Multi-device metadata (extends D019 — deviceId)

The user expects multiple PCs over time and wants a "this PC only" filter,
because browsing from a different PC than the archiving one is a **view-only**
situation.

- Every archived-to-PC media row is tagged with **which machine archived it**
  (field `archivedOnDevice` on `media_attachments`, holding a stable device id
  per install — the existing D019 deviceId concept; **no new sync system**).
- The vault list (above) filters/presents based on this field:
  - rows where `archivedOnDevice` matches the current device → fully openable
    (open original file);
  - rows tagged with a **different** device's id → show as a **view-only
    stub**: thumbnail, filename, size, date, plus a clear "stored on
    [device], not this device" state — never a broken/dead link or button.
- **Explicit limit:** actual file bytes never travel between devices
  automatically. Only metadata (e.g. via Drive sync), once it exists, can be
  visible across devices. If the user wants the file physically on Device B,
  they must move it themselves (USB stick, network share) — the app does not do
  this for them.

## Export & Bundle for Backup

- Export includes media files with the JSON snapshot + sha256 manifest
  (see `Database.md`). Import verifies hashes and reports missing files as
  soft failures.
- PC-archived vlogs are exported as **metadata-only** (`exported: false` in the
  manifest): their blob lives outside the app's storage on the PC filesystem,
  so the backup documents them but does not duplicate the bytes. Restoring the
  backup elsewhere yields soft-failure stubs pointing at the archive path,
  consistent with the access model above.
- Export works fully offline and does not require the Drive phase.

## Open Items

- **Lossy photo compression (OPEN, explicitly NOT locked):** currently photos
  are "stored as-is". Resizing to a reasonable max dimension (e.g. ~1600–2000px
  long edge) and re-encoding at capture time would meaningfully reduce storage.
  It carries a small, usually-imperceptible quality tradeoff and is the one
  optimization that is not lossless. **Do not implement without an explicit
  decision**; tracked in the DecisionLog open items (D038).
- Exact bitrate/resolution constants (build-time decision; document measured
  results in `DecisionLog.md`).
- IndexedDB/backend quota behavior verification on iPhone PWA (M0 test — see
  `StorageDecision.md`).
- **Bulk "migrate everything to Drive"** operation — future feature, see
  `Roadmap.md` P3+ (DecisionLog D039).
- Dedup logical key design (with the remux-identical-video caveat above:
  optimizations 1 and 3 interact; the key must not false-positive on derived
  copies).
- **Session media — SKIPPED for now (N8, user); deferred line kept:** widen
  `media_attachments` to a polymorphic entity anchor (`journal` | `workout`) via
  additive migration; tiers and PC-archive unchanged; M2+ timing. Revisit
  anytime.