# PersonalOS — Storage Decision (LOCKED 2026-08-11)

The local storage backend was the last open architectural decision; it is now
**locked by the Milestone 0 spike results** (Sessions A/B/C). Full record:
`DecisionLog.md` D040. Raw numbers (authoritative):
`PersonalOS-spike/results/phase1_raw_drift.json` and
`phase1_raw_indexeddb.json`; reconciled summary in `StorageSpikeStatus.md`.

## Verdict: Candidate A — Drift + SQLite (WASM)

Locked 2026-08-11 (Session C) on the combined desktop + iPhone evidence.

| Criterion (StorageDecision criteria) | Drift | IndexedDB |
|---|---|---|
| iPhone PWA test list | **PASS** — persistence gate GREEN (809 rows, MATCH after force-quit + overnight, blobs 20/20, hashes match) | PASS (measured identical) |
| Export/restore simple + correct | PASS — countsMatch + blobsMatch; export 34.9s | PASS — countsMatch + blobsMatch; import 65s |
| Performance at seeded scale (10,085 rows + 100×1MB) | **PASS** — every typical query < 200ms (aggregates 4.6–11.4ms, dashboard 6–32ms) | **FAIL** — editedEvents90 283ms avg / 422ms max, the only measured >200ms violation |
| Least complexity for solo dev | one-time setup cost (codegen, WASM hosting — proven on-device at 553ms open) | simpler to start; per-query Dart-side optimization forever after (the failing query above is one such case) |
| Migration safety over years | versioned typed migrations, onUpgrade tested on v1→v2 | hand-rolled onupgradeneeded on a schema that grows to ~25 tables |

Tie-breaker applied (simplicity wins): IndexedDB's setup simplicity does not
repay the measured query-pain class. The failing query's shape — indexed
time-series aggregation on `(type, dayKey)` — is exactly what the future
system (TEMP-PLANNING.md: E0 check-and-fire engine predicates, H3 owner
functions, 365-day window walks, session-walks) runs constantly. Drift's
complexity is paid once; IndexedDB's is paid on every new aggregate. The
future-system load analysis (presented at Session C) reinforces, rather than
revises, the spike verdict.

Failure modes (both documented, neither triggered on Drift): Failure mode A
(wasm/iOS broken) is retired — Drift passed Phase 1 + 2 on iPhone Safari with
the WASM hosted locally. Failure mode B (query pain) was observed on the
IndexedDB side and was decision evidence, not a fix task. Both remain
reversible: repositories (`Architecture.md` layers) keep a later swap
contained.

---

## Historical context (what was evaluated, unchanged)

## Candidates

### A — Drift + SQLite (WASM)

- Real SQL, typed tables, real migrations, mature tooling.
- On web, backed by sqlite3 compiled to WASM.
- Known risk: WASM behavior on iOS Safari / installed PWA must be proven on
  device. May require hosting the wasm file locally and serving correct headers.
- Queries and aggregations (Coach/Analytics) are natural SQL.

### B — IndexedDB document store

- No WASM, no SQL. Objects stored via a thin layer (or a simple wrapper).
- Queries are in-code filtering; aggregates are computed in Dart.
- Simplest possible; zero exotic browser requirements.
- Weaker migrations; more manual work as schema grows.

### Requirement for both

- Must implement the logical schema in `Database.md` (entities + event log).
- Must support the export/restore format.
- Must work in the installed iPhone PWA (persistence across restarts) and in
  Chrome/Edge on Windows.

## M0 Spike Test List

Practical tests, in order, on the installed iPhone PWA **and** desktop browser:

1. **Database creation** — fresh install creates the schema cleanly.
2. **CRUD operations** — journal entries, habits, check-ins: create, read,
   update, delete; multiple entries per day.
3. **Migration testing** — schema v1 → v2 migration runs without data loss.
4. **Performance testing** — with a seeded realistic dataset (e.g., 1 year of
   data: ~5k events, ~700 entries): dashboard load, timeline scroll,
   aggregation queries within acceptable time (target: <200ms typical).
5. **Offline testing** — airplane mode: full core loop works (journal create,
   habit check-off, dashboard, export).
6. **PWA installation testing** — install, launch from home screen, standalone
   mode rendering, camera/file capture, MediaRecorder recording.
7. **iOS persistence testing** — see PWA Persistence Test below.
8. **Media test** — record a vlog clip (1–3 min), view it back, include in an
   entry, confirm storage meter reflects usage.

### PWA Persistence Test (required)

1. Install the PWA on iPhone.
2. Create journal entries and data (habits, check-ins, media).
3. Close the browser (swipe away).
4. Restart the device.
5. Reopen the PWA.
6. Verify all data persists.

Result is recorded in `DecisionLog.md` with the measured numbers.

## Decision Criteria

Lock the candidate that:

- passes the full M0 test list on iPhone PWA,
- keeps export/restore simple and correct,
- has acceptable performance at the seeded scale,
- is the least complex for a solo developer to maintain,
- scores best on migration safety over years of evolution.

Tie-breaker: simplicity and maintainability win over theoretical scalability
(per the project's reliability-over-scale principle).

## If the Spike Reveals Problems

- Failure mode A (wasm/iOS broken): fall back to B immediately — repositories
  make this a contained swap (see `Architecture.md` layering rules).
- Failure mode B (performance or query pain): reconsider A with the measured
  data in hand.
- Both failing: revisit with evidence in `DecisionLog.md` before choosing.

## Pre-Mature Decisions Rejected

- Locking Drift before device testing (rejected — assumption untested on iOS).
- Locking IndexedDB for simplicity alone (rejected — query pain may outweigh it).
- Delaying the decision past M1 (rejected — M1 adds goals/tasks on an
  unproven backend).
