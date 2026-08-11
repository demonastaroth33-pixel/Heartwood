# PersonalOS — Database

Data model, event log, migrations, and the backup/restore format. The storage
backend itself (Drift vs IndexedDB) is decided in `StorageDecision.md`; this
document describes the logical schema that both candidates must implement.

## Logical Schema

### Entities

| Table | Fields (key) | Notes |
|---|---|---|
| `journal_entries` | id, title?, body, area?, tags (JSON), createdAt, updatedAt, deletedAt? | multiple per day allowed |
| `media_attachments` | id, entryId, fileName, mimeType, sizeBytes, durationSec?, capturedAt, syncState, storageRef, thumbnailRef, contentHash?, archivedOnDevice? | syncState: local-only / metadata-synced / fully-synced / archived-to-pc (see below); thumbnailRef: separate always-local thumb copy; contentHash: dedup key (see `MediaStorage.md`); archivedOnDevice: deviceId of the PC that archived the blob, null = not PC-archived |
| `habits` | id, name, area?, cadence (daily default), createdAt, active | |
| `habit_checkins` | id, habitId, dayKey, completedAt, note? | one per habit per day |
| `goals` | id, title, area?, targetDate?, createdAt (M1) | |
| `milestones` | id, goalId, title, targetDate?, completedAt? (M1) | |
| `tasks` | id, title, dueDate?, completedAt?, area? (M1) | |
| `areas` | id, slug, label, userDefined | seed from code; user-extendable |
| `settings` | key, value | timezone, displayName, coachStrictness, storage warnings seen, etc. |
| `coach_outputs` | id, kind, dateKey, payload | daily note / nudge / weekly review (M2; stub note in MVP) |
| `media_manifest` | id, mediaId, sha256?, exportedIn | aids export verification |

Future, NOT M0: a `links` table (sourceType, sourceId, targetType, targetId,
linkType, id, createdAt; one row per directed edge, rendered as undirected in
the view) for the graph/"brain" view — DecisionLog D023, Roadmap.md Milestone 7
(under consideration). Not part of the M0 schema; not built.

### `media_attachments` fields (media update — see `MediaStorage.md`, DecisionLog D037)

- `syncState` canonical values:
  - `local-only` — blob and thumbnail on this device only (default).
  - `metadata-synced` — metadata row + thumbnail synced to Drive (P2.5 phase);
    full blob still device-local.
  - `fully-synced` — full blob in the Drive vault (P3).
  - `archived-to-pc` — blob moved to a PC filesystem folder outside app storage;
    metadata + thumbnail remain in the DB. `storageRef` points at the archive
    location; `archivedOnDevice` records which machine holds it.
  Transient states during transfer (e.g. `uploading`/`offloaded`) are internal
  to the sync service and never written as canonical rows.
- `contentHash` — sha256 (or chosen hash) of the original blob, computed before
  save for dedup (see `MediaStorage.md` optimizations 1/3). Indexed for
  duplicate lookup.
- `thumbnailRef` — points to the small (~10–20 KB) always-local thumbnail copy,
  distinct from the original's `storageRef`. Every device stores its own local
  thumbnail copy regardless of tier.
- `archivedOnDevice` — stable per-install deviceId (existing D019 concept; same
  id used for sync tie-breaking). `null` means "not PC-archived".
- New columns are added with defaults (null) via versioned migration; old
  backups remain importable per the migration rules below.

### Event Log

| Table | Fields |
|---|---|
| `events` | id, type, occurredAt, dayKey, area?, entityType, entityId, payloadVersion, payload (JSON), supersedesId? |

Indexes: `(type, dayKey)`, `(entityType, entityId)`, `(area, dayKey)`.

Event types seeded in MVP:

- `habit.completed`, `habit.missed`
- `journal.created`, `journal.edited`, `journal.deleted`
- `media.added`, `media.removed`
- `reflection.created` (M2)
- `goal.progress`, `goal.completed`, `task.completed` (M1)
- future: `workout.completed`, `study.session`, `relationship.event`, ...

**Event immutability:** edits append new events with `supersedesId` pointing at
the superseded event. Deletions are tombstone events. This preserves the
behavior history the Coach depends on.

## Migration Strategy

- Schema has a monotonic `schemaVersion` stored in settings.
- Migrations are explicit, ordered, and versioned (migration list 1 → N).
- On restore/import: if the backup's `schemaVersion` < current, migrations run
  in order before data load. If backup is newer, import refuses with a clear
  message (upgrade the app first).
- MVP rule: never delete columns on migration; add new fields with defaults so
  old backups remain importable.

## Backup / Restore Format

### Export (local, MVP)

One JSON file per backup:

```
PersonalOS-backup-YYYY-MM-DD-HHmm.json
{
  "format": "PersonalOS-backup",
  "formatVersion": 1,
  "schemaVersion": <int>,
  "exportedAt": "ISO-8601",
  "user": "personalos",
  "data": {
    "settings": [...],
    "areas": [...],
    "journalEntries": [...],
    "mediaAttachments": [ { ...metadata only, no blob... } ],
    "habits": [...],
    "habitCheckins": [...],
    "events": [...],
    "goals": [...], "milestones": [...], "tasks": [...],
    "coachOutputs": [...]
  },
  "media": {
    "manifestVersion": 1,
    "files": [
      { "id": "...", "fileName": "...", "mimeType": "...",
        "sizeBytes": ..., "sha256": "...", "exported": true/false }
    ]
  }
}
```

- Human-readable (documented fields, no proprietary binary encoding).
- Media blobs are exported as files alongside the JSON
  (`media/` folder next to the backup file), verified against the manifest's
  sha256 on import.
- `exported: false` entries record media that exists locally but was not
  included (e.g., huge library, or PC-archived items whose blob lives outside
  app storage on the PC filesystem — see `MediaStorage.md`); the archive still
  documents the metadata.

### Restore

1. Pick backup JSON (and media folder, if present).
2. Validate format, `formatVersion`, and `schemaVersion`.
3. Run migrations if needed.
4. Import all tables transactionally (existing data is replaced — restore is a
  full-restore operation, with a confirmation step).
5. Re-import media files: missing files are listed in a report (soft failure,
  entry metadata is preserved).

### Guarantees

- Everything the app can write, export can capture; everything export captures,
  import can restore.
- No vendor lock-in: the format is JSON + files, documented, restorable into a
  fresh install or a different app.
- Backup never requires network; Drive upload (P2) is an additional copy, not a
  requirement.

### Live Database Corruption Recovery

The live local DB can corrupt (e.g., browser crash mid-write). This is distinct
from data loss and gets its own flow (DecisionLog D021, M0 deliverable):

1. On launch, run an integrity check (SQLite: `PRAGMA integrity_check`;
   IndexedDB: probe transaction + schema-version verify).
2. On failure: do NOT auto-restore — never overwrite possibly-good data with a
   stale backup.
3. Enter recovery mode: block writes, show a clear recovery screen.
4. Attempt "export what's readable first" — salvage whatever is still readable
   before any restore.
5. Then prompt restore from the last export.

Cheap, backend-independent, and specified now because SQLite-WASM-over-OPFS is
the highest-risk infrastructure piece.
