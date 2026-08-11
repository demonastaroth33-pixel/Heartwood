# Storage Spike Status

Living status doc for the Drift vs IndexedDB M0 storage decision. Update this
file whenever a spike result changes — this is the single source of truth for
"what's current" so results don't get duplicated or misread across sessions.

## Current status: LOCKED — DRIFT (2026-08-11)

Session C locked the decision: **Candidate A — Drift + SQLite (WASM)**.
Declared in `StorageDecision.md` and `DecisionLog.md` (D040). The persistence
gate was GREEN for both candidates; Drift won the remaining criteria (desktop
performance at seeded scale, migration safety over years, and the
future-system load analysis in `TEMP-PLANNING.md`). IndexedDB remains the
documented contained fallback behind the repository layer
(`Architecture.md`).

## Where the results live

- `results/phase1_raw.json` — Drift, ORIGINAL desktop Phase 1 run. Import
  timing here (616,472.8ms) is STALE — superseded by the batching fix below.
  Kept only as before/after evidence, not as current truth.
- `results/phase1_raw_drift.json` + `run_state_drift.json` — Drift, desktop
  Phase 1 RETEST after the import batching fix. This is the current,
  authoritative Drift desktop number set.
- IndexedDB desktop Phase 1 results — same desktop harness, backend=indexeddb.
  Unaffected by the Drift fix; still current as originally measured.
- iPhone Safari — both backends completed Phase 1 + Phase 2 on device
  (both **MATCH/PASS**). Record lives in this doc; the on-device JSON lives in
  `localStorage[spike_mobile_lastresult_<backend>]` on the phone. Tracks
  persistence across app close/reopen, not performance. Tracked separately
  from desktop performance work — do not conflate the two.

## Final metrics table (desktop — reconciled, lock reference)

Reconciliation (Session C): the raw result JSONs are the authoritative number
set. This table is transcribed from `results/phase1_raw_drift.json` (retest,
post-import-fix) and `results/phase1_raw_indexeddb.json`. Early drafts of this
doc listed the Drift column as 1,944ms cold open / 82.6s media seed /
8–120ms CRUD / 39.7s export — those came from an intermediate-run
transcription and are superseded by the values below.

| Metric | Drift | IndexedDB |
|---|---|---|
| Cold open (DB + first query) | 1,732ms (external WASM boot 5,886ms) | 50ms (external 1,451ms) |
| Seed rows (9,985) | 2.6s | 13.8s |
| Seed media (100 × 1MB) | 104.9s | 22.6s |
| Dashboard queries avg | 6–32ms | 55–94ms |
| Timeline paging | 12.1ms/page | ≈0ms (cached) |
| Aggregates avg | 4.6–11.4ms | 57.8–283.3ms (editedEvents90 283ms avg / 422ms max — the only measured >200ms violation) |
| CRUD avg (ins/upd/del) | 50.7 / 24.4 / 36.5ms (max 883/142/323) | 2.7 / 3.5 / 2.2ms (max 23/12/14) |
| Export (142MB JSON) | 34.9s | 44.5s |
| Import (round-trip) | 92.5s (was 616s pre-fix) | 65.0s |
| Integrity check | ok, 38.0s (PRAGMA integrity_check) | ok, 174ms (probe) |
| Storage usage | 220.7MB | 213.5MB |
| Export/restore verify | countsMatch + blobsMatch | countsMatch + blobsMatch |

## iPhone Safari results (mobile profile — persistence gate)

Harness: mobile mode deployed to Cloudflare Pages (personalos-spike.pages.dev),
run in plain Safari (same container for both phases of a backend). Mobile
profile: 100 journal entries, 10 habits, 190 check-ins, 7 areas, 15 settings,
467 events, 20x1MB media = 809 rows.

| Result | Drift | IndexedDB |
|---|---|---|
| Phase 1 | BASELINE SAVED, all checks green (open 553ms) | BASELINE SAVED, all checks green (open 60ms) |
| Phase 2 | **MATCH — PASS** | **MATCH — PASS** |
| Baseline check | found + matches | found + matches |
| Data / hashes | counts 809/809, rowsHash + mediaHash = expected, blobs 20/20 | same, all true |
| Storage | 23.3MB used / 38.4GB quota | 23.6MB / 38.4GB |

Gap lengths are approximate (phone clock / screenshot OCR): drift crossed a
full night (~12–25h), IndexedDB ~12h (its phase1At reads
`2026-08-04T16:11:45.599Z`). Both backends survive Safari force-quit + long
idle on iOS. This is the gating criterion from `StorageDecision.md`; both
candidates satisfy it.

**Diagnosed harness collision (NOT a drift defect):** a later drift Phase 2
re-open FAILED with `VersionError: An attempt was made to open a database
using a lower version than the existing version.` Root cause: both backends
use the same IndexedDB database name `personalos_spike` (`lib/main.dart`),
raw IDB opens it at version 2 (`lib/store/indexeddb_backend/idb_store.dart`)
while drift's WASM driver opens it at version 1 (drift 2.34.3
`wasm_setup/shared.dart`). After IndexedDB Phase 1 ran in the same container,
every later drift open requested a lower version and threw. The real app runs
exactly ONE backend, so this cannot occur in production; no data was lost;
the drift MATCH above stands as the verdict. If more phone runs are ever
needed, give each backend a distinct db name (e.g.
`personalos_spike_drift` / `personalos_spike_idb`) — not done, not needed.

Minor observation: `navigator.storage.estimate()` reported 0.7MB on one
IndexedDB Phase 2 read vs 23.6MB after seed — an estimate() inconsistency,
not data loss (mediaVerify passed 20/20, hashes matched).

## Fixes already applied

- **Drift import batching fix**: `_insertFromExport()` in
  `lib/store/drift_backend/drift_store.dart` was rewritten to use
  `db.batch()`/`insertAll()` per table (matching the pattern already used in
  `seedAll()`), replacing a row-by-row loop of individually-awaited inserts.
  This dropped import time from 616s to 92.5s. Verified: flutter analyze
  clean, all 42 tests pass, countsMatch/blobsMatch both true post-fix,
  export.sizeBytes unchanged (142,131,251 bytes), all Phase 1 gates green.
  Remaining gap to IndexedDB's 65s is attributed to media-blob handling
  (base64 decode + read-back verification overhead), not batching — no
  further optimization attempted on this front, considered resolved.

## Open items (all closed by the 2026-08-11 lock)

- `editedEvents90` (IndexedDB, 283ms avg / 422ms max): NOT a fix task — it was
  decision evidence. Drift measured the same query at 11.4ms, and the future
  achievements/analytics engine (TEMP-PLANNING.md) runs exactly this query
  shape; IndexedDB is the non-chosen candidate. Closed as evidence.
- Decision lock (Session C): DONE — Drift locked (D040, `StorageDecision.md`,
  this file).

## Rules to respect

- The spike harness lives in the sibling folder `PersonalOS-spike`, NOT
  inside `Quanti_Delta` (the real app repo). Never write spike code into
  `Quanti_Delta`.
- The decision is LOCKED. `StorageDecision.md`, `DecisionLog.md` (D040), and
  this file are the lock record — do not re-open the backend question without
  new measured evidence and a new DecisionLog entry.
- The spike harness stays as the regression reference for M0 repository work;
  its raw result JSONs are authoritative for any future comparison.
- Desktop performance work and the iPhone persistence test are separate
  concerns — don't let a desktop optimization task wander into iPhone/
  Cloudflare Pages/mobile-mode territory or vice versa.
