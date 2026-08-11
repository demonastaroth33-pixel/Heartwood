# PersonalOS — Decision Log

Every architectural decision: accepted and rejected, with rationale. Before
reversing any decision, read its entry. Every new decision gets an entry on the
day it is made.

Format: date | decision | rationale | alternatives considered/rejected | revisit.

---

## 2026-08-01 — Initial Architecture Lock

### D001 — Event-first architecture (accepted)
Rationale: analytics, gamification, Coach, and future systems (fitness, study,
relationships) consume one behavior log; new modules plug in without core
redesign.
Rejected: purely module-driven design — each system would re-implement
history/analysis; the Coach would have no unified view.
Revisit: none — this is foundational.

### D002 — Life Area abstraction (accepted)
Rationale: future modules (fitness → Health, study → Learning) attach to a
universal small taxonomy instead of hardcoded module tables.
Rejected: hardcoding future modules into the database; tag-only organization
(no structure for the Coach).
Revisit: extend seed list only by user action.

### D003 — No profile/identity system (accepted)
Rationale: the Coach understands the user through behavior history, goals,
habits, journal entries, events, and patterns — not maintained manual profiles.
A minimal `settings` table covers timezone, display name, strictness.
Rejected: manual profile module — dead weight, user must maintain it.
Revisit: only if Coach quality demands explicit user input (record evidence
first).

### D004 — Coach: rule-based, AI optional (accepted)
Rationale: $0 budget, privacy, offline-first, "AI as assistant, not
dependency". Architecture: Analytics → Rule Engine → Reflection Generator →
optional AI Adapter (off by default).
**Rejected: mandatory AI API coach** — paid dependency, privacy leak, breaks
offline principle, unverifiable behavior.
Revisit: AI adapter may be implemented at M5+, never required.

### D005 — Drive integration phased (accepted: P1 local → P2 backup → P3 vault)
Rationale: cloud is backup, never dependency; MVP must ship and prove itself
without OAuth complexity.
**Rejected: premature Drive dependency in MVP** — OAuth, upload queues, and
token handling would block the core loop from shipping.
Revisit: P2 after M2, P3 after P2 (first post-MVP priority per media needs).

### D006 — MVP scope reduced to Core Loop (accepted)
Scope: Dashboard, Journal, Habits, Export/Restore, Coach stub.
**Rejected: larger MVP (goals/tasks/gamification/Drive included)** — too much to
finish, risks never shipping a usable foundation.
Revisit: goals/tasks at M1, gamification/Coach at M2.

### D007 — Storage backend deferred to M0 spike (accepted)
Candidates: A) Drift+SQLite/WASM, B) IndexedDB doc store. Locked before M1 by
on-device tests (see `StorageDecision.md`).
Rejected: locking Drift pre-testing (iOS WASM unproven); locking IndexedDB for
simplicity alone (query pain); delaying past M1 (goals/tasks need a proven
backend).
Revisit: RESOLVED 2026-08-11 — Drift + SQLite (WASM) locked at M0 (Session C);
full record in D040.

### D008 — Offline-first principle (accepted)
Rationale: core loop must work with zero network; cloud = backup/sync layers.
Rejected: cloud-dependent design.
Revisit: never.

### D009 — Manual data entry only (accepted)
Rationale: no Apple Health (impossible in PWA — HealthKit requires native app +
Mac), no device APIs; manual entry is free, reliable, private.
Rejected: HealthKit integration; auto-import pipelines.
Revisit: only if a native companion app is ever built.

### D010 — Dashboard-first UX (accepted)
Rationale: morning open → understand priorities → execute is the core loop's
entry.
Rejected: journal-first, check-in-first, feature-list home.
Revisit: after M0 user feedback.

### D011 — Gamification: meaningful progress only (accepted)
Rationale: consistency, meaningful goal completion, long-term improvement.
**Rejected: XP for app-opening / interaction farming / endless streak bonuses** —
rewards engagement theater, distorts behavior, poisons Coach data.
Revisit: values at M2; philosophy locked.

### D012 — Media: local-first, capture-time compression, no re-encode (accepted)
Rationale: long-form vlogs supported in MVP; browser-native MediaRecorder with
capped bitrate/resolution compresses at source; imported files preserved.
Rejected: ffmpeg.wasm re-encoding pipeline in MVP (heavy ~30MB wasm, mobile CPU
cost, complexity for marginal gain); photos-only MVP (user requirement: long-form
vlogs + compression).
Revisit: re-encode evaluation only if Drive vault economics demand it.

### D013 — Media Repository abstraction (accepted)
Journal → MediaRepository → LocalMediaAdapter (MVP) / CloudMediaAdapter (future).
Rationale: Drive integration replaces an adapter, not the Journal system.
Rejected: Journal managing files directly.
Revisit: none — hard boundary.

### D014 — Storage meter + export as media safety valve (accepted)
Rationale: long videos consume local storage; iOS may evict site data; export is
the primary protection until Drive vault exists.
Rejected: silent retention/deletion policies.
Revisit: with P3 design.

### D015 — Journal language: English-only analysis (accepted)
Rationale: enables free rule-based text analysis; mixed-script analysis is weak
and costly.
Rejected: multi-language NLP (paid or unreliable).
Revisit: if user language habits change.

### D016 — Full restorable backup (accepted)
Rationale: "user's life data belongs to the user" — export must restore
everything (JSON + media manifest, sha256-verified).
Rejected: readable-archives-only exports.
Revisit: format versioned; no lock-in ever.

### D017 — MVP Coach stub rule (accepted)
3 consecutive missed habit days → gentle reflection prompt. Purpose: validate
the Coach architecture (event → rule → output → dashboard), not to coach.
Rejected: no Coach in MVP (core loop's final step missing); full Coach in MVP
(blocks foundation).
Revisit: superseded by M2 full Coach.

### D018 — Push notifications deferred (accepted)
In-app + dashboard-first only in MVP; web push (FCM + service worker, iOS 16.4+)
deferred.
Rationale: complexity trap; dashboard-first reduces need.
Revisit: post-M1, with explicit user request.

### D019 — Sync conflict policy: last-write-wins + deviceId tiebreaker (accepted; activates at P3)
The event log itself is exempt from conflict resolution: it is append-only and
immutable, so sync is a pure union of distinct event ids — no merge needed.
The real collision is same-entity edits from two devices. LWW per entity by
timestamp is sufficient for a single user; deviceId breaks timestamp ties
(device clock drift).
Note: P1/MVP is manual export/import, where restore is a deliberate
full-replace — this policy is documented now but only activates when real sync
lands (P3).
Rejected: merge/CRDT machinery — overengineering for one user.
Revisit: confirm at P3 design before implementing sync.

### D020 — Encryption-at-rest policy: OS-level local, optional Drive passphrase at P3 (accepted)
Local storage (SQLite/IndexedDB) relies on OS/device-level security (iPhone data
protection, Windows device encryption) — documented, not assumed. App-level
WebCrypto keys would live in IndexedDB anyway (weak against the device they run
on), and passphrase loss causes permanent data loss — worse than the threat it
mitigates. The Drive backup is where data leaves the device: optional
client-side passphrase encryption there at P3, user opt-in.
Rejected: app-level encryption of local storage from M0 (key-management and
lockout risk).
Revisit: at P3 with the Drive phase.

### D021 — Live DB corruption recovery (accepted; M0 deliverable)
The live local DB can corrupt (e.g., browser crash mid-write); this is distinct
from data loss and gets its own flow: integrity check on launch (SQLite:
`PRAGMA integrity_check`; IndexedDB: probe transaction + schema-version verify)
→ on failure, NO auto-restore (never overwrite possibly-good data with a stale
backup) → recovery mode (block writes) → attempt "export what's readable
first" (salvage before restoring) → then prompt restore from the last export.
Rejected: silent auto-restore; relying on full wipe/reinstall.
Revisit: refined with the storage backend choice (M0).

### D022 — Testing coverage bar (accepted)
One-line bar: core loop (journal CRUD, habits, event-log integrity,
export/restore round-trip) requires repository + integration coverage; engines
get full unit coverage; UI is dashboard smoke only; everything else best-effort.
Rationale: prevents solo-dev time being burned over-testing peripheral code
while guaranteeing the core loop's safety.
Revisit: if a critical bug escapes coverage.

### D023 — Graph/"brain" view: under consideration, NOT scoped (stub)
Obsidian-style visual graph: nodes are entities (journal entries, habits,
goals, projects, life areas); edges are explicit user links via a future
`links` table (sourceType, sourceId, targetType, targetId, linkType, id,
createdAt; one row per directed edge, rendered as undirected in the view) —
a small schema addition, not a rewrite. linkType seed (mentions / part-of /
related) is explicitly left open, as is the rendering approach:
pure-Dart force-directed package vs JS interop to d3-force (Flutter Web-only
consideration).
Zero impact on M0 scope and on the storage decision. Not locked; not built.
Revisit: at milestone start, post-M1 (see Roadmap.md Milestone 7).

### D024 — Spike dependencies for candidate A evaluation (accepted, spike-scoped only)
drift, drift_flutter, sqlite3, web (runtime); drift_dev, build_runner (dev) —
added to run the M0 storage spike per StorageDecision.md.
Rationale: candidate A (Drift + SQLite WASM) requires these by definition; the
web package for MediaRecorder/storage-estimate interop.
Rejected: none — these are the minimum for the spike.
Note: NOT locked for the application. The final dependency set is approved
after spike results, before M1.
Revisit: at the M0 spike result (D007).

### D025 — Spike media storage: blobs in DB BLOB columns (accepted, spike-only)
The spike stores media blobs inside the storage candidate being tested (Drift
BLOB column) behind the MediaRepository abstraction.
Rationale: it answers the real question the spike exists for — binary media
persistence across restarts on each candidate — without pre-building a separate
IndexedDB blob store that MediaStorage.md doesn't lock until the Drive phase.
The abstraction keeps the final media location swappable.
Rejected: full IndexedDB blob store in the spike (complexity not required to
answer the persistence question); ffmpeg re-encode (unchanged, D012).
Revisit: real M0 media implementation; MediaStorage.md remains authoritative.

### D026 — Spike export format: single JSON with base64 media (accepted, spike-only)
The spike exports one JSON file embedding media as base64, deviating from the
Database.md format (JSON + media files + manifest).
Rationale: single-file transfer Windows → iPhone for the persistence test;
the round-trip is what the spike must prove. The Database.md format remains
authoritative for the real app (M1).
Rejected: implementing the final files+manifest format in the spike (extra
complexity not needed to test persistence).
Revisit: M1 export implementation.

### D027 — No Riverpod in the spike harness (accepted, spike-only)
The spike uses plain StatefulWidgets plus a services container.
Rationale: the storage spike does not test state management; introducing
Riverpod now would preempt the real M0 UI decision and add a dependency.
Riverpod remains the plan for the real application (Architecture.md).
Rejected: adopting Riverpod in the spike (premature; violates "spike asks one
question").
Revisit: M0 real UI build.

---

## 2026-08-03 — Media System & Cross-Device Update

### D028 — Three-tier media storage model (accepted)
Tier 1: local device — thumbnails always stored locally on every device for
every item (small separate copy, never a replacement); small media caches its
full-resolution original as a working set; symmetric across devices. Tier 2:
Drive vault — small photos/short videos auto-sync at P3; bounded by the 15 GB
free ceiling. Tier 3: PC manual archive — long vlogs move out of app storage
entirely into a plain folder on the PC filesystem, outside the app's DB/blob
storage ("free and unlimited" because it uses local disk, not the Drive quota).
Access model is explicit: archived files are reachable only by opening the
folder directly on that PC or manually re-importing into the app on that same
PC — never from the phone or another PC unless the user copies them manually;
the metadata row (filename, thumbnail, size, date, tags) stays in the DB
permanently; only the blob leaves.
Rationale: at ~2 Mbps a 6–7 min daily vlog is ~90–110 MB → ~35 GB/year, more
than double the entire 15 GB Drive ceiling in year one even with perfect
offloading. Archive-to-PC is therefore the designed-for, expected daily
destination for most media volume — not an edge case.
Rejected: Drive-only retention (quota bust); compressing vlogs down to fit the
vault (violates the locked no-re-encoding boundary, D012); any retention that
deletes long vlogs (no silent deletion, ever).
Revisit: with P3 design details; storage tier targets unchanged by the backend
decision (D007, still pending M0).

### D029 — Lossless media optimizations (accepted)
Nine lossless optimizations approved for implementation: content-hash
deduplication, optional lossless re-encoding (metadata/color-profile strip, NOT
default), container-level video remux for imported files (explicitly distinct
from re-encoding — stream packets copied unchanged, D012 unaffected),
background non-blocking thumbnail generation, lazy/virtualized rendering,
predictive thumbnail preloading, batched writes for bulk saves, Wi-Fi-only
large transfers by default (user-configurable), resumable uploads/downloads.
Rationale: they cut storage and latency without touching pixel/audio data; the
remux/dedup interaction is flagged as an open design item (logical dedup key).
Rejected: implementing lossy photo compression now (quality tradeoff — open
item D038); ffmpeg re-encoding (unchanged, D012); skipping the bundle (daily
vlog volume makes storage savings mandatory).
Revisit: dedup key design; remux default state.

### D030 — Vlog local buffer (accepted)
Rolling local buffer keeps the most recent 3–5 days of vlogs cached for quick
rewatch (exact count configurable). Vlogs older than the buffer are actively
prompted for PC archive (dashboard nudge + hard warning) instead of relying
only on the passive 70%/90% thresholds.
Rationale: rewatch window + proactive archive beats passive warnings for a
daily-vlog workload; follows the no-silent-deletion principle — it is a
prompt/nudge, never automatic removal.
Rejected: automatic eviction of old vlogs (silent deletion); unlimited local
cache (defeats the purpose of archiving).
Revisit: exact buffer size at implementation with measured vlog sizes.

### D031 — Physique-photo timeline (accepted)
Dedicated comparison view for physique photos — side-by-side or slider across
time. This category exists for close visual comparison over months, not daily
browsing, so it is exempt by default from whatever general daily-photo
compression tier ends up being decided (see open item D038); kept at
higher/original quality because its low volume makes that cheap.
Rationale: comparison fidelity is the entire point of the category; volume is
too low for the storage savings of compression to matter.
Rejected: subjecting physique photos to the general compression tier.
Revisit: with the D038 decision, if it ever lands.

### D032 — PC-only vault browser (accepted, desktop-exclusive)
A dedicated desktop-only media browsing screen: filters for All / On this
device / Drive vault / Archived on this PC, a "This PC only" toggle, and a
persistent visible scope note ("Shows media captured or archived on this PC.
Items from other devices appear here as metadata-only until Drive sync becomes
available."). On the phone build the screen must not render, error, or appear
at all — a phone has no PC-archive folder to read from.
Rationale: multiple PCs + PC archives need a coherent browse surface; the
persistent scope note prevents mistaking the view for a cross-device catalog
before P3 sync exists.
Rejected: showing the screen on phone builds (broken/dead UI, violates the
platform-parity guardrail D035); shipping without the scope note (false
expectations).
Revisit: when P2.5 metadata sync lands (stubs become meaningful).

### D033 — Multi-device metadata via deviceId (accepted; extends D019)
Every archived-to-PC media row is tagged with the archiving machine's
deviceId (`archivedOnDevice`, nullable — null = not PC-archived). The vault
browser presents rows matching the current device as fully openable; rows from
other devices as view-only stubs (thumbnail, filename, size, date, clear
"stored on [device], not this device" state — never a broken/dead link).
Explicit limit: file bytes never travel between devices automatically; only
metadata can be visible across devices (via Drive sync once it exists); moving
a file to another device is a manual user action (USB, network share).
Rationale: reuses the existing D019 deviceId concept — no new sync system for a
single user; honest view-only semantics across multiple PCs.
Rejected: automatic file transfer between devices (a sync system the user
explicitly does not want yet); broken links for foreign-device items.
Revisit: at P2.5 design, confirming the deviceId source per install.

### D034 — Cloud provider abstraction discipline (accepted, hard rule)
`CloudMediaAdapter` exposes only provider-agnostic operations: `upload(file) →
ref`, `download(ref) → file`, `delete(ref)`, `list(prefix)`. Provider-specific
concepts (OAuth flow, provider file/folder API shape, provider-specific
sharing semantics) are fully contained inside the adapter implementation and
never leak into Journal, Coach, or other feature code. Any future code outside
the adapter calling a provider-specific method directly is an architecture
violation to flag and fix immediately.
Rationale: the user may switch cloud providers; the abstraction only keeps its
"swap providers = write one new adapter" promise if nothing leaks around it.
Rejected: provider-specific calls tolerated "temporarily" (leaks are permanent).
Revisit: never — hard boundary (see `Architecture.md`).

### D035 — PC-exclusivity guardrail (accepted)
A feature may only be PC-exclusive if it is blocked by something physically
true (e.g., a large file that literally only exists on that PC's disk) — never
for implementation convenience. Protects the locked "roughly equal phone and
desktop experience" (Requirements.md) from eroding as features are added.
Currently the only legitimate PC-exclusive feature is the vault browser's
access to PC-archived files (D032); everything else must remain fully
functional on both platforms.
Rationale: convenience-only platform gating silently breaks the equal-experience
promise; the physically-true test is objective.
Rejected: platform gating for build convenience.
Revisit: every time a new phone-only or PC-only feature is proposed.

### D036 — Drive phasing split: P2.5 metadata sync before P3 (accepted)
New lighter phase P2.5 (new Milestone 4): sync only `media_attachments` rows
and thumbnail blobs (~10–20 KB each) through a lightweight Drive data pool.
P3 becomes Milestone 5, unchanged in media-vault scope. Milestones renumbered:
M4 = P2.5, M5 = P3, M6+ = future systems, M7 = graph view (references in
D023, `Database.md`, `README.md` updated). Multi-device metadata visibility
(D033) depends on P2.5, not full P3.
Rationale: metadata/thumbnail sync is cheap and solves the "phone and PC show
different local state" problem immediately; full media sync is expensive and
quota-sensitive — no reason to gate the cheap win on it.
Rejected: waiting for full P3 to ship any cross-device visibility; shipping
full media sync first (expensive, quota risk).
Revisit: at P2.5 design (still confirms D019 sync policy).

### D037 — Schema extension: media_attachments fields + syncState (accepted)
`media_attachments` gains: `archivedOnDevice` (deviceId, nullable — null means
not PC-archived), `thumbnailRef` (a thumbnail storageRef distinct from the
original's), `contentHash` (dedup key, indexed). `syncState` canonical values:
local-only / metadata-synced / fully-synced / archived-to-pc (transient
uploading/offloaded states stay internal to the sync service). Columns added
with null defaults via versioned migration (old backups remain importable).
Rationale: every new field maps 1:1 to a locked decision (D028/D033/D029); the
single storageRef design could not express always-local thumbnails or the
archive location.
Rejected: a separate thumbnail table (overkill; one nullable column + ref is
enough); collapsing archive state into storageRef alone (unqueryable).
Revisit: at migration time with the chosen backend (D007).

### D038 — Lossy photo compression: under consideration, NOT decided (open)
Candidate: resize photos to a reasonable max dimension (e.g. ~1600–2000 px long
edge) and re-encode at capture time; currently photos are stored as-is. Would
meaningfully reduce storage with a small, usually-imperceptible quality
tradeoff. The only non-lossless optimization in the media update.
**Not locked. Do not implement without an explicit decision.** Physique photos
are exempt by default if it ever lands (D031).
Revisit: with measured storage numbers after M0, alongside the bitrate
constants decision.

### D039 — Bulk "migrate everything to Drive": under consideration, future P3+ (open)
Candidate feature (not built): loop through local/PC-archived media, upload
each via `CloudMediaAdapter`, update `storageRef`/`syncState` per row, and
optionally free local/PC storage after confirmed uploads. Requires no new
architecture beyond what is already planned; useful once the user has more
Drive storage than the 15 GB free ceiling.
Revisit: post-P3, with an explicit user request.

---

## 2026-08-11 — M0 Storage Decision Locked (Session C)

### D040 — Storage backend: Drift + SQLite (WASM) (accepted; resolves D007)
The M0 storage spike concluded (Sessions A/B/C, harness in
`PersonalOS-spike`). Persistence gate GREEN on iPhone Safari for both
candidates; Drift wins on every remaining criterion. Measured evidence:
raw JSON in `PersonalOS-spike/results/` is authoritative; the reconciled
table lives in `StorageDecision.md` + `StorageSpikeStatus.md`.
Rationale:
- iPhone PWA gate: both candidates MATCH/PASS after force-quit + overnight
  (809 rows, blobs 20/20, hashes match expected, 23.3/23.6MB used). The
  wasm/iOS risk (Failure mode A) is retired with evidence.
- Desktop at seeded scale (10,085 rows + 100×1MB): every Drift typical query
  < 200ms (aggregates 4.6–11.4ms, dashboard 6–32ms); IndexedDB aggregates
  58–283ms with `editedEvents90` at 283ms avg / 422ms max — the only measured
  violation of the 200ms target, on the exact query shape (indexed
  time-series aggregation on `(type, dayKey)`) the future system runs
  constantly (TEMP-PLANNING.md: E0 check-and-fire predicates, H3 owner
  functions, 365-day window walks, session-walks — evaluated at Session C).
- CRUD and blob-write speed favor IndexedDB (2–4ms per op; 4.6× faster media
  seed) — imperceptible at human logging speeds, and retired as moot by the
  media tiering model (D028: blobs leave the DB, only thumbnails stay).
- Migration safety over the planned ~25-table schema with dozens of additive
  migrations (TEMP-PLANNING.md): Drift's versioned typed migrations (tested
  v1→v2) beat hand-rolled `onupgradeneeded`.
- Export/restore parity: Drift export 34.9s vs 44.5s; import 92.5s post-fix
  (was 616s) vs 65s; countsMatch + blobsMatch true on both.
Rejected: locking IndexedDB — setup simplicity does not repay the measured
query-pain class, engine-side in-Dart aggregation, or the migration burden
on a growing schema. A swap stays contained behind repositories
(`Architecture.md` layers) if real-world evidence ever favors it.
Note: D024's spike dependency set is APPROVED for the real app M0 (drift,
drift_flutter, sqlite3, web; drift_dev + build_runner as dev).
Revisit: only with measured evidence of a Drift-side failure in production.
