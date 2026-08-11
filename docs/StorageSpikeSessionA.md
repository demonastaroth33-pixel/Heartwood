# PersonalOS — Storage Spike: Session A (Desktop Gate)

> Status: **APPROVED**. Execute as its own fresh session (new context).
> This document is the complete contract. It is **self-contained** — everything
> needed to build and run the spike is embedded below. Do not read any other
> file during execution. Do not open or reference anything inside
> `C:\Users\dell\Desktop\Quanti_Delta` at execution time, including
> `lib/core/constants.dart` and `docs/` — all seed data, schema, and decisions
> are reproduced here.
>
> Companion: `docs/StorageDecision.md` (the decision this spike serves) and
> `docs/Roadmap.md` Milestone 0 (the gate). Both are background context; you
> may read them, but nothing in Session A depends on them.
>
> After Session A completes: **STOP**. Report results. Session B (iPhone PWA
> gate, per `StorageDecision.md`) starts only after the user reviews this
> session's report.

---

## 1. Mission

Run the desktop leg of the M0 storage spike on Windows in **Chrome**:

1. Implement both storage candidates against the same logical M0 schema:
   - **A — Drift + SQLite WASM** (via `drift_flutter`, OPFS-backed)
   - **B — IndexedDB** document store (via `package:web` bindings)
2. Seed both with ~10,000 rows of realistic 1-year data + **100 × 1MB media
   blobs (~100MB)**, byte-identical workload on both.
3. Run an identical benchmark suite on both and produce a comparison table
   (target: typical queries <200ms per `StorageDecision.md`).
4. Prove **binary media persistence** (blobs survive close + overnight +
   possible machine power-off).
5. Prove **export → import round-trip** in-app (D026 format).
6. Produce `results/SessionA-report.md` and stop.

## 2. Hard Constraints (non-negotiable)

- **Harness location:** `C:\Users\dell\Desktop\PersonalOS-spike` — a sibling
  folder of Quanti_Delta. Create it fresh with `flutter create`. The name
  `PersonalOS-spike` is not a valid Dart package name, so create with an
  explicit project name:
  `flutter create --platforms web --project-name personalos_spike .`
- **Quanti_Delta is untouchable:** no edits to its `lib/`, `pubspec.yaml`,
  `web/`, `test/`, `docs/`, or `DecisionLog.md` — ever, in any phase. You do
  not even read it (except optionally the two companion docs above).
- **Dependencies:** exactly the approved spike set (DecisionLog D024):
  - runtime: `drift ^2.34.3`, `drift_flutter ^0.3.1`, `sqlite3 ^3.5.0`,
    `web ^1.1.1`
  - dev: `flutter_test`, `flutter_lints ^6.0.0`, `drift_dev ^2.34.5`,
    `build_runner ^2.15.1`
  - **No other packages.** IndexedDB, `navigator.storage.estimate()`, and
    SHA-256 (`crypto.subtle`) all come from `package:web`. If you hit a gap,
    fix it with web-platform APIs, not new packages. A new dependency requires
    user approval — treat "no new deps" as absolute for this session.
- **No Riverpod** in the harness (D027). Plain `StatefulWidget`s + a services
  container.
- **Media blobs live inside the storage candidate** (D025): BLOB column for
  Drift, JS `Blob` values in the IndexedDB media store.
- **Export format (D026):** single JSON document, media embedded base64 —
  in-app in-memory round-trip only (no file pickers in Session A; Windows →
  iPhone transfer mechanics are Session B).
- **No comments in code** unless asked (project code rule).
- `flutter analyze` clean and `flutter test` green in the spike project before
  the report is written.

## 3. Environment & Run Mechanics

- Browser: **Chrome** (user-confirmed). Same default profile for both phases —
  never incognito.
- **Pin the dev-server port so the origin never changes between phases.**
  IndexedDB/OPFS/localStorage are origin-scoped (scheme + host + **port**).
  Use `flutter run -d chrome --web-port=8080` in BOTH phases. If 8080 is busy,
  pick another fixed port and use it for both phases; record it in the report.
- Query params drive the run: `http://localhost:8080/?backend=drift&phase=1`.
  The app reads `Uri.base.queryParameters` at startup.
- **Results channel:** the app `print()`s a single marked JSON block per run:
  `===SPIKE_RESULT_BEGIN===` … `===SPIKE_RESULT_END===`. In debug mode this
  appears in the `flutter run` terminal and is greppable. The app also renders
  the JSON on screen (selectable) as a fallback.
- All timings via `Stopwatch`, milliseconds, min/avg/max across repetitions
  (3× for composite queries, 5× for aggregates, per-op stats for CRUD).
  Runs happen in debug mode; both backends are measured identically, so
  results are comparative. Note the debug-mode overhead caveat in the report.
- Timing includes one-time costs (WASM download/boot for A, DB open for B)
  reported separately as `coldOpen` — not folded into per-query numbers.

## 4. Spike Project Layout

```
C:\Users\dell\Desktop\PersonalOS-spike\
  pubspec.yaml            (deps per §2)
  lib\
    main.dart             (reads query params, drives phases, renders UI)
    core\seed.dart        (embedded seed data + deterministic generator)
    core\bench.dart       (timing helpers, min/avg/max accumulation)
    core\spike_json.dart  (D026 export/import serializer + verifier)
    store\spike_store.dart      (backend interface + result types)
    store\drift_backend\drift_tables.dart   (Drift table definitions)
    store\drift_backend\drift_store.dart    (DriftBackend impl)
    store\indexeddb_backend\idb_store.dart  (IndexedDbBackend impl)
    ui\run_screen.dart    (minimal progress + results view)
  test\
    seed_test.dart        (exact counts per §6/§7)
    spike_json_test.dart  (serializer/round-trip consistency)
  results\                (created by this session; raw JSON + report)
```

Run order during development: `flutter pub get` →
`dart run build_runner build --delete-conflicting-outputs` (Drift codegen) →
`flutter analyze` → `flutter test` → browser runs.

## 5. Backend Schema (both candidates implement exactly this)

Schema version **2**. Both backends must implement the v1 → v2 migration
(adding `events` and `media_attachments`) and verify it in a test, but the
seeded runs always start at v2 fresh.

### 5.1 Drift (candidate A)

- DB name: `personalos_spike` via `driftDatabase(name: 'personalos_spike')`
  (OPFS on web; `sqlite3.wasm` served by drift_flutter).
- `schemaVersion = 2`; `onCreate`: create all + seed areas; `onUpgrade`
  v1→v2: create `events` + `media_attachments`; `beforeOpen`:
  `PRAGMA foreign_keys = ON`.
- Tables exactly as in 5.3. Indexes:
  - `idx_events_type_day` on events(type, dayKey)
  - `idx_events_area_day` on events(area, dayKey)
  - `idx_events_entity` on events(entityType, entityId)
  - UNIQUE(habitId, dayKey) on habit_checkins
- Reset for a clean phase 1: delete the DB (drift_flutter's delete API or
  delete the OPFS file) so seeding starts empty.

### 5.2 IndexedDB (candidate B)

- DB name: `personalos_spike`, version **2**, via `package:web` `indexedDB`.
- One object store per table (7 stores); `keyPath: 'id'` for stores with text
  PKs, `keyPath: 'key'` for settings.
- Store indexes: events stores `idx_events_type_day`, `idx_events_area_day`,
  `idx_events_entity` (non-unique, multi-entry where array keys); checkins
  stores `by_habit_day` **unique** on `[habitId, dayKey]`.
- v1→v2 `onupgradeneeded` migration: create `events` + `media_attachments`
  stores (mirror of Drift).
- Media blobs stored as JS `Blob` values in the `media_attachments` row.
- Reset: `indexedDB.deleteDatabase('personalos_spike')`.

### 5.3 Logical tables (identical on both)

| Table | Columns | PK |
|---|---|---|
| `journal_entries` | id, title (null), body, area (null), tagsJson, createdAt, updatedAt, deletedAt (null) | id |
| `habits` | id, name, area (null), createdAt, active (bool, default true) | id |
| `habit_checkins` | id, habitId → habits, dayKey, completedAt, note (null); UNIQUE(habitId, dayKey) | id |
| `areas` | id, label, userDefined (bool, default false) | id |
| `settings` | key, value | key |
| `events` | id, type, occurredAt, dayKey, area (null), entityType, entityId, payloadVersion (int, default 1), payload (JSON text), supersedesId (null) | id |
| `media_attachments` | id, entryId (null → journal_entries), fileName, mimeType, sizeBytes (int), durationSec (int null), capturedAt, syncState (default 'local'), storageRef (default ''), blob (BLOB null / Blob null) | id |

Timestamps as millis-since-epoch; dayKey = `YYYY-MM-DD` local date string.

## 6. Seed Dataset (deterministic, ~10,000 rows)

PRNG: Dart `Random` with fixed seed `20260801`. Same seed on both backends →
identical bytes and rows. Exact row target: **10,085 rows** (contract: 10k).
Record the exact achieved counts in the report.

| Table | Count | Notes |
|---|---|---|
| journal_entries | **1,600** | 365-day window 2025-08-02 → 2026-08-01 (~4.4/day); entry `n` uses template `n % 20` from §A, fillers chosen from §C via PRNG, tags 1–3 from §B; id `entry-0001`…; title null; deletedAt null |
| habits | **10** | from §A habit list; id `habit-<slug>`; createdAt spread over 400 days before window start; active true |
| habit_checkins | **2,290** | per-habit exact counts from §6.1; day selection deterministic (any exact scheme: e.g., sort window days by PRNG draw, take first `count_i`); completedAt = random hour 6–23 on the day; id `checkin-<habitId>-<day>` |
| media_attachments | **100** | metadata + blob per §7; capturedAt spread over the window; entryId links to a random non-deleted entry; syncState 'local' |
| areas | **7** | §A area list; userDefined false; id = slug |
| settings | **15** | fixed list in §6.2 |
| events | **6,063** | see §6.3 |
| **Total** | **10,085** | |

### 6.1 Per-habit checkin counts (exact — sum = 2,290)

| Habit (id slug) | p (inclusion) | count (round p × 365) |
|---|---|---|
| morning-workout | 0.72 | 263 |
| read-20-pages | 0.65 | 237 |
| meditate-10-min | 0.80 | 292 |
| drink-2l-water | 0.85 | 310 |
| study-neet-material | 0.55 | 201 |
| journal-evening | 0.60 | 219 |
| call-family | 0.40 | 146 |
| work-on-project | 0.50 | 183 |
| plan-tomorrow | 0.70 | 256 |
| screens-off-by-11pm | 0.50 | 183 |

### 6.2 Settings (15 rows, fixed)

`schemaVersion=2`, `timezone=Asia/Kolkata`, `displayName=PersonalOS user`,
`coachStrictness=medium`, `storageWarn70Seen=false`, `storageWarn90Seen=false`,
`theme=system`, `weekStartsOn=1`, `journalReminderTime=21:00`,
`habitReminderTime=20:00`, `backupFrequencyDays=7`, `deviceName=spike-desktop`,
`appVersion=0.1.0`, `lastBackupAt=2026-07-01T08:00:00.000Z`,
`seededAt=<phase-1 run ISO time>` (the only non-fixed value).

### 6.3 Events (6,063 rows)

| type | count | payload / semantics |
|---|---|---|
| journal.created | 1,600 | one per entry; occurredAt = entry createdAt; supersedesId null |
| journal.edited | 533 | every 3rd entry (deterministic); occurredAt = updatedAt (day after createdAt + hour); supersedesId = that entry's journal.created event id |
| journal.deleted | 160 | every 10th entry; **that entry gets `deletedAt` set** (soft delete, row remains); supersedesId null |
| habit.completed | 2,290 | one per checkin; occurredAt = completedAt; entityType habit, entityId habit id |
| habit.missed | 1,360 | one per (habit, day) NOT checked in (3,650 − 2,290); occurredAt = day 21:00 |
| media.added | 100 | one per media row; occurredAt = capturedAt |
| media.removed | 20 | first 20 media ids; occurredAt = capturedAt + 1 day; media rows remain |

Events: id `event-0001`…; dayKey from occurredAt; payload = JSON string
(e.g. `{"entryId":"entry-0001"}`); payloadVersion 1; area matches entity's
area where present, else null. All event types listed are the only ones used.

**Deleted entries rule for benchmarks:** dashboard/timeline/aggregate queries
must exclude `deletedAt IS NOT NULL` (1,600 − 160 = 1,440 live entries), the
same way the real app would.

## 7. Media Blobs (100 × 1MB, both backends)

- Each blob: exactly **1,048,576 bytes** of deterministic PRNG bytes (same
  seed → identical blobs on both backends, verifiable byte-for-byte).
- fileName `media-0001.img`…, mimeType `image/jpeg` (bytes are synthetic;
  mimeType is metadata only).
- Write all 100 through the store's media API (one row per blob).
- **Verification:** byte-compare read-back against the in-memory originals
  (chunk-wise to bound memory). SHA-256 per blob via browser
  `crypto.subtle.digest` (`package:web`) for the report and D026 manifest —
  no crypto package.
- ~100MB per backend write + read. This is the binary-persistence proof;
  photos/videos are a core M0 requirement (MediaStorage.md).

## 8. SpikeStore Contract

One interface, two implementations. Methods (timings returned alongside
results where relevant):

- `Future<OpenResult> open({bool fresh})` — open DB; `fresh` resets first
  (delete + recreate); returns coldOpen ms + boot details.
- `Future<void> seedAll()` — rows (§6) then media (§7); returns per-part
  timings and exact row counts.
- `Future<Map<String,int>> counts()` — per-table row counts.
- `Future<void> crudBench()` — 100 inserts / 100 updates / 100 deletes of
  journal entries (new rows, then update, then delete), per-op stats.
- `Future<Map<String,TimedResult>> dashboardBench()` — composite per §9.5.
- `Future<TimedResult> timelineBench()` — §9.6.
- `Future<Map<String,TimedResult>> aggregateBench()` — §9.7.
- `Future<TimedResult> mediaVerify()` — read all blobs, byte-compare, §9.8.
- `Future<Map<String,String>> integrity()` — per-backend check, §9.10.
- `Future<ExportResult> exportJson()` / `importJson(String)` — D026 format,
  round-trip into a second fresh instance `personalos_spike_rt`, §9.9.
- `Future<SizeResult> sizeInfo()` — `navigator.storage.estimate()` usage
  before/after; OPFS file size best-effort for A.
- `Future<void> close()`.

Backends are isolated behind this interface; UI and bench driver never touch
backend APIs directly.

## 9. Benchmark Suite (identical on both backends)

Report ms values as min/avg/max. Flag any typical value ≥ 200ms.

1. **coldOpen** — construct backend + first `counts()` query. A includes WASM
   fetch/boot; note the caveat.
2. **seedRows** — all non-media rows (9,985). Batched/transactional per
   table; total + per-table.
3. **seedMedia** — 100 blobs; total + per-blob avg.
4. **crud** — per-op min/avg/max for insert/update/delete (100 ops each).
5. **dashboard** — composite, 3×: (a) 30 latest live entries ordered by
   createdAt desc; (b) today's checkins with habit names; (c) total live
   entry count; (d) per-habit completion count for the last 30 days; (e)
   `navigator.storage.estimate()`.
6. **timeline** — 3×: 20 pages × 25 live entries (ORDER BY createdAt DESC
   LIMIT 25 OFFSET n); per-page avg + total.
7. **aggregates** — 5× each: (a) live entries grouped by dayKey, last 90
   days; (b) per-habit completion rate (completed vs total days) last 90
   days; (c) live entries per area; (d) count of `journal.edited` events in
   the last 90 days via the (type, dayKey) index.
8. **mediaRead** — read all 100 blobs + byte-verify: total + per-blob avg;
   then a second warm pass, total.
9. **exportImport** — build D026 JSON (metadata + base64 blobs): size + time;
   import into fresh `personalos_spike_rt` instance of the same backend:
   time; verify per-table counts identical + all 100 blobs byte-identical.
   Report pass/fail.
10. **integrity** — A: `PRAGMA integrity_check` (expect `['ok']`); B: probe
    transaction across all stores + schemaVersion check. Result + time.
11. **size** — whole-origin `navigator.storage.estimate()` usage delta per
    backend run + OPFS file size for A (best-effort) + exported JSON size
    (logical-size proxy; browser API has no per-DB breakdown — state this in
    the report).

## 10. Phase 1 (day 1)

1. `flutter run -d chrome --web-port=8080` (Chrome, default profile).
2. URL `http://localhost:8080/?backend=drift&phase=1` → app resets DB fresh,
   runs §9.1–9.11, prints the marked result JSON, saves it to
   `window.localStorage['spike_baseline']` (per-backend key), renders it.
3. Hot-restart with `?backend=indexeddb&phase=1` (or relaunch) and repeat.
4. Capture both result blocks from the terminal into
   `results/phase1_raw.json` (both backends in one file, labeled).
5. **Close the browser.** Record the exact phase-1 completion timestamp.

## 11. Overnight (wait)

- Browser stays closed. The machine may be powered off — that is expected and
  makes the test stronger.
- Do not clear site data, do not switch Chrome profiles, do not change the
  port. Nothing runs until the next morning.

## 12. Phase 2 (next morning)

1. Same command: `flutter run -d chrome --web-port=8080` — **same port**.
2. `?backend=drift&phase=2` → app opens the EXISTING DB (no reset, no seed),
   reads `localStorage['spike_baseline']`, then:
   - counts() vs baseline — must match exactly (10,085 rows)
   - mediaVerify — all 100 blobs byte-identical (full verify, not a sample)
   - spot-checks: latest entry title, a known habit's checkin count, a
     settings value
   - cold timings: dashboard + aggregates + integrity
   - prints the phase-2 marked JSON block (including diff verdict)
3. Repeat for `?backend=indexeddb&phase=2`.
4. Capture into `results/phase2_raw.json`.
5. If data is missing → **record FAILED with evidence** (estimate usage,
   check port/origin, note anything the user did in between). Never
   fabricate or re-seed to "pass". A true failure is a finding.
6. Write `results/SessionA-report.md` per §13.

## 13. Results Report (`results/SessionA-report.md`)

- Header: date, session start/end, machine (OS version, CPU/RAM), Chrome
  version (userAgent), Flutter/Dart versions, port used, debug-mode caveat.
- Dataset: exact seeded counts per backend (must be 10,085 both).
- Per-backend tables for §9.1–9.11: min/avg/max ms, sizes, pass/fail.
- **Persistence verdict:** phase-2 evidence per backend (counts match,
  blobs verified, spot-checks) — PASS/FAIL with numbers.
- **Media verdict:** write/read times, size, byte-verification result.
- **Round-trip verdict:** export size/time, import time, verify result.
- **Comparison summary:** clear "A vs B" rows for every benchmark; note any
  ≥200ms violations; note risk observations (WASM boot time, storage
  estimate accuracy, eviction warnings, OPFS quirks).
- **Draft DecisionLog entry** (D0XX placeholder, clearly marked DRAFT, with
  the headline numbers) — for the user to paste into Quanti_Delta's
  `docs/DecisionLog.md` after Session B. **Session A never writes it.**
- Final line: what the user should check before starting Session B.

## 14. Definition of Done

- [ ] `PersonalOS-spike` created; `flutter analyze` clean; `flutter test`
      green (seed exact-count tests + round-trip tests).
- [ ] Both backends seeded: 10,085 rows + 100MB media, identical bytes.
- [ ] Full benchmark tables recorded for both backends.
- [ ] Overnight persistence verified with evidence (or an honest FAIL).
- [ ] Media byte-verification and export/import round-trip results recorded.
- [ ] `results/phase1_raw.json`, `results/phase2_raw.json`,
      `results/SessionA-report.md` written.
- [ ] Quanti_Delta untouched (verify: no file changes there).
- [ ] No new dependencies added.
- [ ] **STOPPED.** Session B not started; report handed to the user.

## 15. STOP Rules

- After the report is written: stop. Do not start Session B (iPhone gate) —
  it begins only after the user reviews this report.
- Do not modify Quanti_Delta under any circumstance.
- Do not add dependencies, do not change the spike's decisions, do not write
  into Quanti_Delta's DecisionLog.
- If a build/API problem arises, fix it inside the spike project (web search
  allowed for `drift_flutter`, `package:web` IndexedDB, OPFS, `sqlite3.wasm`
  APIs). If genuinely blocked (e.g., Chrome missing), report and stop with a
  clear blocker statement.

---

## Appendix A — Embedded Reference Data

Areas (id / label / userDefined=false):

```
health / Health
learning / Learning
career / Career
relationships / Relationships
projects / Projects
self_improvement / Self Improvement
finance / Finance
```

Habits (id slug / name / p):

```
morning-workout / Morning workout / 0.72
read-20-pages / Read 20 pages / 0.65
meditate-10-min / Meditate 10 min / 0.80
drink-2l-water / Drink 2L water / 0.85
study-neet-material / Study NEET material / 0.55
journal-evening / Journal evening / 0.60
call-family / Call family / 0.40
work-on-project / Work on project / 0.50
plan-tomorrow / Plan tomorrow / 0.70
screens-off-by-11pm / Screens off by 11pm / 0.50
```

Entry templates (20, cycled by `n % 20`; `{token}` filled from Appendix C
via PRNG):

```
1.  Worked on {topic} today. Progress was {adverb}, but consistent.
2.  Had a {adj} day. Main win: {win}. Tomorrow: {next}.
3.  Studied {topic} for {hours} hours. Focus was {focus}.
4.  Training day. {exercise} felt {feeling}. Body is {body_state}.
5.  Quiet day. Spent time on {topic} and on rest. Notes: {note}.
6.  Met with {person}. Talked about {topic}. Good {outcome}.
7.  Energy {level} today. What helped: {help}. What hurt: {hurt}.
8.  Journal check-in. Current goal: {goal}. Honest status: {status}.
9.  Documented {topic}. It matters because {why}.
10. Slow morning, strong evening. Finished {win}.
11. Reflecting on this week: {week_note}. Adjustment: {next}.
12. Pushed through {hardship} today. It was worth it.
13. Built {thing} for the project. Next step: {next}.
14. Noticed pattern: {pattern}. Plan: {plan}.
15. Grateful for {gratitude}. Learned: {lesson}.
16. Deep work on {topic}. Distractions: {distraction}.
17. Body check: {body_state}. Recovery needed: {recovery}.
18. Read about {topic}. Key takeaway: {takeaway}.
19. Phone time was {screen_time}. Tomorrow: {next}.
20. End of day. Today was {overall}.
```

Tags (pick 1–3 per entry via PRNG):

```
focus, low-day, win, streak, rest, gym, study, family, project, energy,
discipline, reflection
```

Appendix C — fillers (values chosen uniformly by PRNG):

```
topic: coding, math, physics, english, fitness plan, the book, portfolio, habits
adverb: slowly, steadily, well, inconsistently, surprisingly well
adj: long, full, hard, calm, productive, messy
win: the workout, deep focus block, family call, chapter read, project milestone, early start
next: start earlier, finish the chapter, one more rep set, prep meals, plan the week
hours: 2, 3, 1.5, 4, 2.5
focus: high, medium, low, scattered, sharp after coffee
exercise: squats, bench, deadlifts, pull-ups, run, abs work
feeling: strong, heavy but good, lighter, mechanical, energized
body_state: recovering well, sore but fine, tired, leaner, needs more sleep
person: a friend, family, a colleague, an old classmate
outcome: conversation, plan, catch-up, decision
level: high, moderate, low
help: early sleep, music, sunlight, a walk, planning
hurt: phone scrolling, late night, skipped breakfast, noise
goal: the current one, the habit streak, the project, the study plan
status: on track, slipping, ahead, starting over, consistent
why: it compounds, future me needs it, it is the plan, discipline
week_note: busy, solid, uneven, surprisingly good
hardship: tiredness, motivation dip, a long commute, distractions
thing: a small tool, the routine, a draft, the plan
pattern: late nights kill mornings, good after gym, cravings at 10pm
plan: move sleep earlier, protect the workout, snack smarter
gratitude: health, the streak, quiet time, support, small wins
lesson: consistency beats intensity, rest is part of training, start ugly
distraction: low today, social media, noise, erratic schedule
recovery: an earlier night, a lighter session, a walk
takeaway: do it badly first, compound interest, show up daily
screen_time: bad, okay, better than yesterday, high
overall: a win, a draw, fine, hard but good, quiet
```

Note: template 5 references a `{note}` token with no appendix entry — treat
`{note}` as empty when it appears (the template reads naturally without it).
