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
Revisit: at milestone start, post-M1 (see Roadmap.md — Graph section, under
consideration, not scheduled).

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
Revisit: when the entity-sync plane (M4) lands (stubs become meaningful).

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
> **Superseded by D059 (entity-sync plane).** The milestone numbering below
> (M4 = P2.5, M5 = P3, M7 = graph) was renumbered a SECOND time by D059:
> M4 = entity-sync plane, M5 = P2.5 (media blobs only), M6 = P3, M8 = graph.
> D036's substance (metadata-before-media phasing) survives; its numbering
> does not.
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

---

## 2026-08-20 — Fitness, Nutrition, Routine & Surface Decisions (integration batch)

The batch below records the decisions confirmed at Stage C of the
TEMP-PLANNING.md integration (verdict record: 2026-08-20). The B1 consolidated
table (`IntegrationLedger.md` appendix, lines 483–518) is the authoritative
D041–D076 list; the docs pass uses only these confirmed numbers. Next free
DecisionLog ID after this batch: D077. Every entry's detail lives in the doc
named in the entry; DecisionLog carries the decision, rationale, and revisit
condition. Detailed schema/flow prose lives in the target docs; these entries
are the decisions, not a second copy of the design.

### D041 — Fitness domain core adoption (accepted)
The health area becomes a first-class domain: health-area entities
(workouts, exercise_sets, body_metrics, nutrition) follow the existing
entity+event pattern; `workout.completed` is a real metadata-only event type
(exercise count, total sets, total volume — never set detail); seeded lookups
(exercises, muscle groups, categories) mirror `areas` and stay user-extendable;
M1 ships manual structured entry only. Body.weighed and nutrition.logged are
metadata-only events.
Rationale: fitness/nutrition/body are the second behavior stream the event-log
architecture was built for; manual entry keeps the "no device APIs" and
offline-first principles (D009/D008) intact while the producers seam (D062)
matures.
Rejected: auto-import pipelines; NLP parsing at M1 (deferred, D004); anything
that would break the entity+event single-write-path pattern.
Revisit: at each milestone boundary, extending the seed lookups by user action.

### D042 — Workout layering: templates + performed sessions (accepted)
`workout_templates` + `workout_template_exercises` are first-class; performed
sessions copy template rows at save time (frozen, append-only; edits future-only,
never rewriting history); supersets via additive `pairWith` on template rows
(sessions never store pairing); two-a-day sessions allowed; units stored as kg
everywhere, display-converted only; dayKey rolls at midnight (I7); template
deviation (apply-deviation) folds structure only, never weights, and past
sessions stay frozen with a per-template opt-out.
Rationale: templates are the authoring surface, sessions are the performed
record; the copy-not-link rule keeps history honest and analytics stable.
Rejected: sessions referencing templates live (later edits would rewrite the
past); a second workout calendar (one door to edit a workout).
Revisit: with the routine system (D061) layering on top.

### D043 — Strength measurement & PR system (accepted)
Single `est1RM` owner function (Epley, TENSION 6); `strengthSnapshot(exerciseId,
asOf)` is the canonical reader; record modes route between weight and rep-count
logging; PR source-of-truth = ALWAYS derived by a session-walk (ladder/vault
never stored); `workout.pr` is Coach/toast ONLY; deletion semantics use
tombstones with a negative-XP event on re-derivation revoking PR-XP;
drill-down consumes strengthSnapshot with zero schema.
Rationale: derived-only PRs cannot drift from logged reality; the vault/ladder
stays trustworthy by construction.
Rejected: storing computed PR values as write-path data (would resurrect the
`goal.progress` class of bug D049 retires).
Revisit: with strength standards (D044) and the analytics owner catalog (D049).

### D044 — Strength standards & formula constants (accepted)
Frozen 5-tier strength-standard seed for the 4 canonical lifts only
(bench/squat/deadlift/OHP, men+women percentile-anchored); "Strength Standard
Reached" fires per-lift-per-tier ranks 2/3/4 ONLY — Beginner(1) and Elite(5)
never fire a trophy; MMA absolute-lift ladders fire ONLY on a real logged set,
no est-1RM/band substitution; the overall strength level is a display-only
profile grade, never a trophy or gate. Formula constants (Mifflin-St Jeor,
Wilks/DOTS, Epley) live in a plain Dart pure-function module — no package/network
deps, public formulas, non-togglable per the Settings NOT-OFFERED guardrail
(D055).
Rationale: public formulas with honest numbers; tier thresholds are seeded
values, not settings.
Rejected: proprietary/licensed formulas; making tier thresholds user-togglable.
Revisit: only with new measured population data justifying a reseed.

### D045 — Cardio sessions & energy-burn accounting (accepted)
Workouts gain additive columns for kind strength|cardio, durationSec,
distanceKm, avgEffort, kcalBurned; cardio MET estimate is verbatim-critical;
TDEE = non-training Mifflin baseline with training expenditure derived from
logged sessions and added separately (double-count fix); cardio calories appear
once; manual kcalBurned replaces the strength-burn band; strength-burn is a
conservative estimate band, always labeled estimate, never presented as exact.
Rationale: honest energy math without double-counting; the signed-rate spine
(D046) needs a trustworthy burn side.
Rejected: a catchall activity-factor fudge in Mifflin.
Revisit: with the deriveMacros owner (D046).

### D046 — Energy-balance & macro derivation owners (accepted)
`deriveMacros(dateKey)` is THE single day-target owner (H3): Mifflin BMR ×
activity → TDEE; calorieTarget = TDEE + (rate × 7700)/7 with the rate SIGNED
(negative = cut, positive = bulk — additive, never inverted); manual TDEE
override freezes auto-recompute and the protein/fat basis; protein g/kg per
phase (cut 2.0 / bulk 1.8 / maintain 1.6, editable), fat floor ~0.6 g/kg
(editable up), carbs as remainder; `rollingWindowMean(series, windowDays)` is
the ONLY rolling math in the engine; thin-data rule restated (no verdict or
projection from a single point — always "Adjusting"); canonical daily weigh-in
= first weigh-in of the day, later same-day entries stored but excluded from
the derived series, first-row deletion promotes the next same-day row
(retroactive re-derive accepted); constants non-togglable.
Rationale: one owner, one number, no re-implementation (H3); the signed-rate
convention replaces the old "no double-negative" framing.
Rejected: per-screen macro math; storing day totals (derived only).
Revisit: with measured use; formula constants frozen by B4 on manual TDEE.

### D047 — Phases system (accepted)
New `phases` (type bulk|cut|maintain, startDate, endDate? null=ongoing,
targetWeeklyRateMin/Max); ONE active phase; baseline weight anchored at phase
start via the rolling average; phase-close renders a full derived report
(weight trend, pace verdict, sessions, adherence, volume, PRs, achievements,
goal pace, one Coach line — coach_outputs kind `phase_close`); rate↔macros
feedback resolved by the nutrition session.
Rationale: phases give the Coach and goals a temporal container for pace,
adherence, and rate-vs-target judgement.
Rejected: treating deloads as a phase type (separate table, D051) — deloads are
markers, not phases.
Revisit: at M1 design with the roadmap milestones (D059).

### D048 — Goals extension: goals.kind + weight/strength goals (accepted)
Goals gain additive nullable columns from the start: `kind` (generic|weight|
strength), `exerciseId?`, `targetValue?`. Broad weight goals reuse the existing
goals system ("reach 75kg by <date>") — NOT a new system: progress auto-computed
from body_metrics rolling weight, pace = remaining kg ÷ remaining days, deadline
grading. Strength goals = an exercise FK (must be tracked) + target est-1RM +
targetDate; baseline = best est-1RM at creation; progress auto-computed; pace
graded like phases; est-1RM ≥ target → the existing `goal.completed`; deadline
miss = "missed by X kg"; estimates labeled. Goal ↔ phase consistency: creating a
weight goal auto-proposes a matching phase and vice versa (one-tap link); a
conflict warning fires if the active phase contradicts the goal.
Rationale: weight/strength goals are the same lifecycle as generic goals with
different progress math — one system, kind-driven owners.
Rejected: separate goal tables per kind; the invented "daily checklist pairing"
row (dropped at Stage C — L080 belongs to D046).
Revisit: at M1 with the goals build.

### D049 — Computed-only goal progress + analytics owner catalog (accepted)
Goal progress is computed ONLY — a real-time derivation, never a stamped value;
one H3 owner per goal kind (weight: rolling weight vs start/deadline; strength:
est-1RM vs target). The write-path `goal.progress` event is RETIRED — only the
rare user-declared `goal.completed` remains. The Analytics Engine publishes a
consolidated owner-function catalog (rollingAvgWeight, deriveMacros,
adherenceWeek, strengthSnapshot, dayActivityScore, totalVolume,
goalProgress(goalId), paceVerdict + every M2/trophy owner) as the authority for
"who computes what"; no generic-aggregator meta-framework; rounding happens once,
inside the owner.
Rationale: derived math cannot drift; one owner per number is the only way to
keep ~36 systems consistent.
Rejected: re-deriving goals in features; a generic aggregation framework.
Revisit: when a new derived number is proposed (catalog first).

### D050 — Goal projection + milestone review + reviews-no-XP (accepted)
Goal cards show a derived projection line: the deadline plus "at current pace →
~date" (weight: rolling-trend extrapolation; strength: est-1RM regression),
honest-estimate labels, needs ≥2wk data else "more data", stale/deload =
uncertain, always derived never stored; also a line in the phase close report.
The milestone review ("since you started", anchored to the first journal entry's
date) is a long-form counterpart of the weekly check-in on the same H2/A4
surface model — NEVER a new screen; smart cadence ladder (+1m/+3m/+6m/+1y then
yearly, editable in Settings Group 2), catch-up on first open after a due date,
once only; coach_outputs kind `milestone_review_anniversary`. Reviews give NO XP.
Rationale: the review is earned-honor; XP on reviewing rewards the review, not
the behavior it reports.
Rejected: giving weekly/milestone reviews XP (struck from Gamification); a
standalone review screen.
Revisit: at M2 with the weekly-surface merge (D052).

### D051 — Coach system restructure per the Coach Consolidated Map (accepted)
The Coach restructures to the map's §0–§9 outline in CoachSystem.md's own voice:
named rules (plan-adherence, volume balance, deload suggestion, stallRule,
rest-day pattern, injury/limitation, post-deload return ramp, journal drought,
pace/bulk lines, missed-habit warnings, quiet meal reminders, deferred N5
recovery) as citable named sections; outputs & surfaces dictionary
(daily_note, nudge, briefing, check_in_weekly, nutrition_checkup,
milestone_review_goal, milestone_review_anniversary, phase_close,
pattern_alert); privacy & never-list (facts-only default, per-feature stamps,
Coach gets NO journal text); achievement tie-in (only Ring and Grove get a Coach
line; one line max per trophy fire); strictness scales thresholds + tone, never
the rule set; Settings Group 2 (strictness, review day, milestone cadence).
Rationale: one citable, named rule per behavior; the map is the organizing
shape, CoachSystem.md the authored voice.
Rejected: a second coaching pipeline; unnamed inline rules that cannot be cited.
Revisit: at M2 with the Coach build.

### D052 — ONE weekly surface consolidation (accepted; removal)
The standalone weekly review, the weekly recap, and the nutrition check-up
merge into ONE Sunday surface: the weekly fitness check-in is the single
surface; R11 week recap and nutrition check-up become compact sections with
tap-through; Coach weekly review is a SECTION of the merged surface (merge only,
nothing deleted, one pipeline, one scroll); one canonical verdict per cadence.
Rationale: three near-identical weekly surfaces split attention; one surface
with sections preserves all content at lower cognitive cost.
Rejected: authoring separate week-recap or nutrition check-up screens (retired
before authoring); a second weekly review.
Revisit: at M2 with the check-in build.

### D053 — Dashboard "Today" fusion (accepted; removal)
The dashboard's separate briefing-card top block is removed; "Today" merges
briefing + habits + capture at the top, with the old six-block order preserved
below; render order paints heavier blocks after the skeleton shimmer; the
briefing card is the daily one-tap surface (today's routine slots, done-vs-
missing, macro-gap bar).
Rationale: one daily launchpad beats stacked blocks; the dashboard stays the
core-loop entry (D010).
Rejected: keeping the briefing as a separate top block; adding new schema.
Revisit: after M0 user feedback.

### D054 — Calendar as memory map (accepted)
The calendar is a MEMORY MAP, never judgment: month-grid tint only (never dots/
numbers/icons); tint intensity = volume via the dayActivityScore owner; filters
apply to the whole system; day view = chronological derived list + plan-vs-actual
toggle + year heatmap; period creation with visible confirmation (drag + manual);
missed-habit warnings live in the Coach reflection, never in the tint.
Rationale: the calendar communicates activity volume, not evaluation; judgment
belongs in the Coach.
Rejected: judgment glyphs in the tint; habit failure signals on the grid.
Revisit: with the periods model (D075).

### D055 — Settings two-tier restructure + Groups 1–8 (accepted)
Settings restructure into Main + Advanced tiers with a search escape hatch and
restore-defaults behind a confirm dialog; Groups: 1 GENERAL, 2 COACH,
3 FITNESS, 4 NUTRITION, 5 CALENDAR & MEDIA, 6 HABITS, 7 DATA & STORAGE,
8 SYNC (skeleton only, renders only when the entity-sync plane ships).
NOT-OFFERED as toggles (guardrails): rep guard 1–12, Epley/Mifflin/Atwater
formulas, 7700 kcal/kg, dayActivityScore weights, per-exercise progression
style, reveal-on-first-data, XP/achievement values, check-in section on/off.
Group 5 gains the resolve-E2 vacation-day threshold knob (default 14).
Rationale: settings keys, never profile fields (D003); public-formula constants
must not be toggleable.
Rejected: feature flags for math; a Sync group before sync ships.
Revisit: whenever a new setting is proposed (group assignment is a decision).

### D056 — Journal features J1–J7 (accepted)
J1 On-This-Day memory strip (facts-only, media stubs, leap-day via sameMonthDay);
J2 journal search (offline, simple matching, worker if slow); J3 batch import
(imported flag + immutable import-hash, dayKey = original date, entry-only,
never earns XP); J4 Quiet Week (user-started; streaks stay REAL — not a shield);
J5 Year Book (PDF artifact, media stubs — dependency entry pending, below); J6
tag/area filter chips; J7 PC video library family (merged into the Desktop vault
browser, D057). Search, filters, and import are offline-first.
Rationale: documentation is a core loop step; these make the journal navigable
and durable without touching the entry model.
Rejected: AI tagging; cloud search; anything that compromises offline-first.
Revisit: J5 at build time (dependency decision required).

### D057 — PC video library (J7 family) + vlog lifecycle (accepted)
J7 "My Videos" is VIDEOS HOME inside the existing Desktop vault browser (merge,
don't add — D035 wording stays literally true); shared search box (J2+J7);
adopted marker + storage-meter exclusion; dedup via content hash; reuses
archived-to-pc semantics; backend-agnostic; auto-adopt is Chromium-only (File
System Access API), others degrade to manual folder pick (dependency note
pending, below). Vlog lifecycle: durationSec measured ONCE when a file first
enters the library (phone capture returns finished duration; PC adoption parses
the container header once, no ffmpeg); every recording ends at a Keep/Discard
review screen (Discard = file wiped, no row, zero trophies); delete is
tier-aware: buffered/phone → row + file + vlog.deleted tombstone; Drive-vaulted
→ metadata row only; PC-adopted → the app NEVER removes the file (folder is
truth), un-list and do-not-readopt.
Rationale: the PC is the archival destination (D028/D030); the app must never
delete files it does not own.
Rejected: deleting PC-adopted files; re-measuring duration on tier moves.
Revisit: at P2.5/P3 with the sync plane (D059).

### D058 — Backup enumeration + metadata/revoke events + tombstone rule (accepted)
The backup enumeration is extended (verbatim-critical, additive, formatVersion-
bumped): weekPlans/weekPlanSlots, workoutTemplates, workoutTemplateExercises,
workouts, exerciseSets, muscleGroups, exerciseMuscleGroups, exercises user rows,
bodyMetrics, phases, deloadMarkers, nutrition_logs, nutrition_recipe,
meal-types, day_templates, day_template_slots, routine_days, routine_slot_logs,
periods, limitations. `nutrition_food_cache` is NOT in the enumeration
(regenerable). New metadata-only events: nutrition.logged + body.weighed with
revokes nutrition.removed / body.weighed_revoked; the cross-domain revoke
pattern is shared; ~2k small rows/yr within the ~10k/yr event budget; NO
per-set/per-slot/routine-noise events (entity-only for those tables). Tombstone
rule: a delete always wins over an earlier-timestamped edit (entity never
resurrects).
Rationale: everything the user can produce must restore; regenerable caches and
derived data are not part of the user's data.
Rejected: including regenerable caches in backup; per-set event noise.
Revisit: with each new entity table (enumeration is a decision).

### D059 — Entity-sync plane before P2.5 (accepted; roadmap restructure)
A full entity-sync milestone lands BEFORE P2.5: the data-sync plane (event log
= append-only UNION of distinct event ids; same-entity edits LWW by timestamp,
deviceId ties; tombstone rule) ships first; P2.5 shrinks to big media blobs
only, using the same D019 mechanism; P3 media vault sync follows.
Rationale: syncing metadata before data would produce references the other
device cannot resolve; the D019 mechanism is proven and cheap.
Rejected: shipping P2.5 (media-only metadata sync) before the plain-data sync
plane; full P3 before either.
Revisit: at M4/M5 design.

### D060 — Fitness feature-list closure + phone/PC parity (accepted)
The fitness side's feature list is CLOSED: workouts, sets, exercises, templates,
plans, phases, PR, vault, PO, cardio, volume, deload, injuries, adherence,
goals, habits bridge, check-in, phase report. Media is deferred. N3/N5/N6/N8 +
periodization stay park-able; add only when real usage says so. M2 phone↔PC
parity: every feature/screen exists on BOTH platforms EXCEPT the PC archive
(folder adoption + vault browser incl. the J7 video library — PC-only because
the files physically live on the PC, D035-consistent); capture is NOT
phone-exclusive; offline behavior is identical on both.
Rationale: a closed list prevents scope creep in the fitness build; the parity
principle keeps the "roughly equal phone and desktop experience" promise
(Requirements.md).
Rejected: fitness features beyond the closed list; phone-only or PC-only
features for convenience.
Revisit: only when real usage demonstrates a missing capability.

### D061 — Daily routine system (accepted)
New `day_templates` + `day_template_slots` (typed kinds meal|pack|workout|
activity|rest|sleep|weigh-in); the weekly routine is a named 7-slot binding list
plus per-day override — ONE binding model, no independent per-day toggle; prompt
rules (no weekly prompt on unbroken runs); delete affects future only;
`routine_days` (dateKey, templateUsedId snapshot frozen) + `routine_slot_logs`
(status planned|done|skipped|packed|eaten); pack→meal linkage at TEMPLATE level;
kind IS the extension seam: meal → pre-timed nutrition rows + recipe pre-fill,
pack → carry-list + lunch claim, workout → workout-template link (session day
pre-fills), activity/sleep → future hooks only; backfill marks a slot done in
that date's view. Standalone fitness week_plans scheduling is REMOVED and
re-purposed as the routine-week binder (slots reference dayTemplateId — not
workoutTemplateId); workout templates keep their own tables.
Rationale: one door to plan a day; the template layer already exists (D042) and
the binder gives it a weekly cadence without a second calendar.
Rejected: a standalone fitness scheduler (replaced by the routine as product
scope); independent per-day toggles.
Revisit: at M2+ with the routine build.

### D062 — Nutrition receipt-line model + producers seam + food macro lookup (accepted)
`nutrition_logs` are per-meal receipt rows; the day total is a SUM of rows,
never a stored day row; rows carry dateKey (ACTUAL eat date — NU4 backdating
exception to I7), occurredAt (actual eat time), portion multiplier resolved ON
the row; meal types seeded (breakfast/lunch/dinner/snack) and user-extendable;
recipes (`nutrition_recipe`) copy in at save and never rewrite history; the
producers seam makes scanner/OCR, smart scale, and food-db lookup all print the
SAME receipt row via a `source` column, offline forever; `nutrition_food_cache`
is ONE regenerable table, not in backup; lookups are derived from nutrition_logs
history ("saved food" IS a logged row); backfill bound: same-day/last-24h
normal, older dates = distinct historical-backfill mode that never extends
streak/check-up compliance. NU status line: NU1–NU12 + add-ons locked.
Rationale: every input prints the same receipt line — one model, many sources;
manual entries are ground truth, never overwritten by lookup.
Rejected: per-source data models; stored day rows; OCR/AI food recognition
(`source='estimated'` rejected).
Revisit: food-db dependencies at build time (dependency entry pending, below).

### D063 — Macro-gap bar + quiet meal reminders + zero-XP streak marker (accepted)
The macro-gap bar lives inside the R12 briefing card (protein/kcal progress vs
the deriveMacros target) — the single daily budgeting surface; meal reminders
are on-app-open catch-up nudges only (never push, D018), known meal windows =
routine-bound meal slots with seeded defaults when no routine; a zero-XP "N days
fully logged" consistency marker appears on the dashboard with NO XP (anti-
farming).
Rationale: one budgeting surface, quiet reminders, and a consistency marker that
cannot be farmed.
Rejected: push reminders; XP for the consistency marker.
Revisit: at M2 with the briefing card build.

### D064 — Habits auto-track bridge + auto-tick XP (accepted)
Habits can be AUTO-TRACKED (autoSource "workout", future "weigh-in"); a session
save auto-writes the day's habit check-in in the SAME transaction (checkin gains
`autoCreated`; manual wins); session deletion cleans up its auto check-in AND
emits a compensating `habit.completed_revoked` (transactional, metadata-only);
deload-day counting is per-habit (default counts). An auto-ticked habit is REAL
completion — full XP, like manual — ONLY when the triggering session is real
(same anti-cheat gate); a revoked tick returns XP via the compensating
negative-XP event; no double-earn, no delete-log cycles; the rule lives in the
shared anti-farming gate, not per-screen.
Rationale: auto-tracking removes duplicate entry without gaming the reward
system — real when real.
Rejected: auto-tick XP without the real-session gate; per-screen anti-farm logic.
Revisit: when a new autoSource (weigh-in) is added.

### D065 — Achievement catalog relationship + census corrections + DOCS-PASS rules (accepted)
The achievement catalog relationship is fixed: TEMP-PLANNING-Achievements-v2.md
stays the canonical catalog (178 entries, ZERO XP) and TEMP-PLANNING-
Achievement-Spec.md stays the trigger layer (E0–E13, rungs R1–R47,
DEPENDENCIES); TEMP-PLANNING-Achievements.md is SUPERSEDED as a catalog (only
its 7 governing rules carry over); the merged canonical draft is DEFERRED — v2
stays live. DOCS-PASS rules: (a) merged catalog text = v2 verbatim; (b)
trigger/machinery prose = spec verbatim; (c) every ledger pin lands as a named
rule/guardrail; (d) v2 + spec stay LIVE sources, both linked; (e) 1:1 mapping
131 ↔ 131 ↔ 47; 178 entries preserved. Census corrections carried: NoDeviation
tolerance ±3% (Ghost ±30% typo fixed), stale duplicate blocks deleted from v2,
"once per calendar year" residue scrubbed to anchored-year wording, Rolling
Tape = first KEPT vlog, "Fifty Push-Ups" rename.
Rationale: two frozen sources with one authority relationship; corrections were
applied to v2 already — the doc reflects, never re-edits.
Rejected: a merged-canonical single file now; reintroducing pre-correction
numbers.
Revisit: at M2 with the achievements build (catalog relationship reviewed then).

### D066 — XP rulings (accepted; removal)
XP rulings: weekly-review and milestone-review give NO XP (removed from
Gamification); trophies give ZERO XP; journal XP capped (first 2 content-gated
entries/day); media XP rides the journal cap; XP values fixed at M2 and NOT
settings toggles; XP reversal is symmetric via a NEGATIVE XP event; PR XP is
small, milestone-tiered (1st/5th/10th), size-weighted (a +≥2.5 kg est-1RM gain
counts, micro-PRs do not), zero XP for logging itself.
Rationale: rewards must track meaningful progress (D011), never engagement
theater; caps and reversal symmetry prevent farming and delete-log cycles.
Rejected: XP for opening the app, interactions, endless streak bonuses, or
reviews.
Revisit: at M2 when values are fixed.

### D067 — Achievement engine primitives (accepted)
The achievement engine's primitives land as named owners/principles: TENSION
1–15 owner pins, the Ghost condition, Turn, meta-streak, anniversary,
qualifying-entry, yearly-pass/consecutive-years, anchored years, loose ends,
plus runAlive, robotOverlapWindow, sameMonthDay, phaseStartWindow,
phaseAdjacency, anniversaryWindow, dayDomainPresence. These are the shared
trigger machinery (spec-E) that achievements and Coach alike call.
Rationale: one engine for all triggers, one implementation, no re-derivation.
Rejected: per-achievement bespoke logic.
Revisit: at M2 with the achievements build.

### D068 — Trigger pins G1–G20 + resolve-B/E + E-clash + streak definitions (accepted)
All achievement trigger pins land as named guardrails: G1–G20 + G7b (no plain
G7), TENSION 1–15 owner pins, resolve-B1–B5, resolve-E1–E3, E-clash #1/#3/#4/#5,
M3 yearlyPass/consecutiveYears, M4 anchored years, M6 qualifyingEntry, M7 loose
ends. E-clash #2 is a GAP — the family range implies five entries but #2 was
never labeled anywhere; it stays a gap and is NEVER invented or labeled during
the docs pass. Weekly-checkpoint definition (closed calendar week ending
Sunday; thin weeks <5/7 neither confirm nor reset; two consecutive non-thin
weeks read); fully-logged-day definition (routine-active: kcal ±10% + planned
meal types; no-routine: kcal ±10% + ≥2 actual meal logs); Real Progress
thresholds +2.5/+5/+10/+20 kg in goal direction; On Target = the same ±10% band
— ONE number, one Advanced-only knob clamped 5–15%; stall/checkpoint rules and
the Coach stall rule (authoritative single assignment L148 → D051).
Rationale: pins are citable named guardrails; gap honesty beats invented
coverage.
Rejected: inventing E-clash #2; unlabeled inline pins.
Revisit: at M2 with the achievements build.

### D069 — Rejected/skipped/declined items — do-not-build records (accepted)
The following were rejected, skipped, or declined by the user and are recorded
so they are never re-proposed without a strong new use case: I6, I8 (rejected
features), N3/N5/N6/N8 (skipped/deferred lines), F3 (session post-note —
declined), the Part-B journal prompts #2/#3/#4/#7 (declined), the RPE column
(struck from any schema), FUT-1 muscle map graphics (rejected — "not that
great", decorative overload), and any feature beyond the D060 closed list.
Each carries its original rationale in the ledger (L052, L054, L058, L060, L061,
L064, L068, L216, L265, L270).
Rationale: a recorded no keeps the design from revisiting settled ground; the
ledger holds the "why".
Rejected: resurrecting any listed item without a new use case.
Revisit: only if a genuinely new use case arrives (each is evaluated on its
merits then).

### D070 — Open questions / future ideas — DecisionLog open items (accepted)
Open items parked here, raised but not scoped: FUT-2 rest/recovery tracking
(sleep, rest days, readiness — overlaps N5/deferred lines, check overlap before
scoping); FUT-3 body measurements beyond weight (waist/chest/arms — complements
the physique-photo timeline D031); FUT-4 macro targets per phase (overlaps NU7
per-phase g/kg defaults — check NU7 overlap before scoping); FUT-5 periodization
(programs as an ordered sequence of weekly plans with loading phases W1–W4 —
the biggest item by far; revisit when the user is 12+ months of consistent
training in; a lighter alternative is week-level intensity labels without a
block layer).
Rationale: idea-recorded, not scoped; each has a stated revisit condition.
Rejected: drafting these as specs now.
Revisit: per each item's stated condition (all default to the D060 closed-list
discipline).

<!-- SUPERSEDED 2026-09-26 (gen-2 docs pass): the "Life Tree — not a spec" verdict is re-pointed to the gen-2 design chapter — the tree-7 decision records D085–D117 + the canonical spec docs/LifeTree.md (StructuralImpactProposal §4.7; Stage C REMOVES-existing sign-off APPROVED). Historical record kept below; nothing deleted. -->

### D071 — Life Tree idea — M9 spec, not an M2 idea (superseded; original "not a spec" verdict re-pointed)
> **Re-pointed 2026-09-26 (gen-2 docs pass):** the original verdict below — Life
> Tree "deferred M2, not a spec" — is SUPERSEDED by the gen-2 design chapter.
> The tree-7 design session produced a locked, fully-specified design: the
> decision records D085–D117 (this log) + the canonical spec `docs/LifeTree.md`,
> with `life-tree-design/` as the authoritative working design (the note at
> D083 that the folder is intentionally outside docs is PRESERVED — the
> external folder stays the working source; docs/LifeTree.md is the shipped
> docs-voice spec that cites it). The Life Tree is now a locked M9 milestone
> (Roadmap M9 per D117), not an idea-recorded vision. Its "no new tables"
> premise was superseded by D107/D108 (a persisted engine-written cache) +
> D109 (the synced `viewed_moments` table); its "M2 scope" line was already
> superseded by D081's M9 placement.

**Historical record (2026-08-20, kept unchanged):** The Life Tree is an
idea-recorded user vision, NOT a locked spec: a dedicated
full tab with a huge stylized life-tree graphic that actively grows as
everything is logged and achieved, incorporating the Growth-Rings / 10-ring
structure (trunk rings, Pith → Yew, one ring = one Life-Fully-Logged qualifying
yearly window) and reflecting all domains and achievement tiers. Confirmed
premises only: 100% derived from real qualified non-imported history (Analytics-
Engine-derived cache, never a write-path entity, no new tables, imports never
grow it, nothing user-editable, no XP); rings never shrink (a missed year
leaves the count untouched); no guilt UI (a thin domain looks young/dormant,
never "failed"); its own nav tab. Scope: M2 — blocks nothing in M0/M1.
Rationale: the user's vision is captured without committing the design; full
implementation is designed and built during the M2 Life Tree section.
Rejected: treating it as a spec now; any write-path or XP attachment.
Revisit: at M2 with the Life Tree section build (mockup in the UI/UX pass).
— this revisit line is superseded; the re-pointed revisit is D117's M9 launch plan.

### D072 — Draft schema shapes block — sketch, not decided (accepted)
The draft schema-shapes block in TEMP-PLANNING.md is a discussion sketch, NOT
locked schema. It is never drafted as decided schema. Superseded columns are
struck: `rpe?` (RPE rejected, D069), `week_plan_slots.dayTemplateId` (re-purposed
as the routine binder, D061), and `routineSlotLogId` (performed-day linkage,
D061). Everything the block sketches is decided by its owning decision: workout
layering (D042), exercises/muscles/categories seeds (D041/D044), receipt-line
nutrition (D062), phases (D047), body_metrics canonical weigh-in (D046),
deload_markers (D051), workout templates (D042).
Rationale: a sketch documents the shape discussion without pretending it was
decided; owning decisions carry the real content.
Rejected: drafting the sketch as schema.
Revisit: never as a block; individual tables are decided by their owners.

### D073 — Physique-photo anchor + F5 nudge (accepted; placeholder resolved)
The physique-photo timeline's anchor placeholder is resolved: the anchor is a
journal entry tagged `health+physique` (a hidden system tag); the D031 timeline
queries media_attachments by that tag; zero new tables or paths. F5 adds an
optional monthly nudge to capture a D031 photo (default OFF, no nagging) that
opens a prefilled journal composer; the nudge routes through the Coach rule
pipeline like every nudge.
Rationale: a tag-based anchor needs no schema and composes with J6 filters.
Rejected: a dedicated anchor field; a separate photo table.
Revisit: with the D031 timeline build.

### D074 — Label-family disambiguation + citation discipline (accepted)
Audit/analysis labels repeat ACROSS independent families; every downstream doc
must QUALIFY them or use section references: backup-A1–A6, census-A1–A4,
routine-A1–A7, audit-B1–B4, resolve-B1–B5, audit-C1–C6, resolve-E1–E3,
spec-E0–E13. Same letter ≠ same family — always qualify (e.g. "resolve-B3" vs
"audit-B3"; "routine-A3" vs "backup-A3"). Citation discipline: D-series and
S-series refs are verified against real DecisionLog entries; "D5" is a recorded
alias for D005; S-series codes are internal citation codes, not definitional
IDs; re-cite only qualified.
Rationale: unqualified labels silently mis-cite unrelated rows across docs.
Rejected: leaving the collisions to context.
Revisit: whenever a new family label is introduced.

### D075 — Periods model (trip/vacation content containers) (accepted)
A period is a user-created start/end date range + title + type (vacation / term
/ holiday / etc.) — an INVISIBLE METADATA RECORD (media/journal style, NOT a
journal entry). Content is collected by DATE-RANGE derivation (inclusive
[start, end], verified), never copied or owned; `extraEntityIds` is the ONE
deliberate exception (an item dragged into a period outside its range, day-1).
Content never moves or gets flagged; deleting/changing a period never orphans
content (re-range = re-slice); the trip view reuses the D031 physique/journal
timeline pattern; the app NEVER fabricates a blog post on period creation;
Coach quiets adherence like a deload ("vacation, not laziness"); the calendar
renders a period as a top band / cell tint context whose colored block opens
the trip view.
Rationale: derived content containers organize trips/vacations without a second
content model or destructive moves.
Rejected: copying/owning content into periods; auto-generated trip posts.
Revisit: at the calendar build (D054).

### D076 — Fitness session UI features (accepted)
Fitness session UI: daily logging flow (plan-driven + editable, freeform/paste
fallback); last-time hint with freshness tiers (<2wk full / 2–4wk quieted with
date / >4wk collapsed; >4wk PO suggests pause with ~90% baseline instead of
+2.5 kg extrapolation); onboarding first-run (Mifflin inputs as Group-4 settings
keys + proposed first weekly plan + seeded tracked exercises, all
replaceable/clearable from day one); session comparison (side-by-side vs the
previous same-template session, per-exercise deltas + volume delta + PR flag);
template cloning one-tap incl. pairings; copy weekly check-in / phase-close
report as plain text; "Track this exercise" in the session menu → the dashboard
Your-lifts block. Auto-assort = a rule-based loose-grammar paste parser (fuzzy
match + "Did you mean?" confirm, inline create with muscle assignment — NEVER
silent auto-create; offline, NO AI; M1-or-M2); manual structured entry ships M1,
general NLP deferred.
Rationale: the session screen is where logging happens; these make it fast
without automating away user control.
Rejected: silent auto-create on paste; AI/NLP parsing at M1.
Revisit: at M1/M2 with the session-UI build.

### Dual-listing notes (from StructuralImpactProposal.md §8.2, verbatim intent)

The following entries deliberately cover overlapping ground; they stay
separate so one decision never conflates two themes:
- **D041 / D042** stay separate (domain core incl. M1 manual-entry scope vs
  layering/copy discipline) — distinct row sets, no merge default.
- **D058 / D059** are deliberately separate: backup enumeration + metadata/
  revoke events (D058) vs entity-sync plane (D059). Do NOT merge even though
  both touch the event/backup side.
- **D048 (goals extension) / D046 (energy balance) / D050 (projection +
  milestone review)** are three distinct decisions — do not conflate
  goals-kind schema, macro owners, and the review card.
- **D052 / D053** both touch "Today"/weekly surfaces; the batch write keeps
  them free of duplicate wording.
- **D065 / D066** both touch achievements/XP: D065 is the catalog relationship
  + census corrections (EXTERNAL frozen), D066 the XP rulings — separate
  entries so one "achievements" decision doesn't conflate them.
- **Cross-listed rows** (L173 in D050+D066, L280 in D051+D055, L148 in
  D051+D068): each appears in two theme rows; the authoritative single
  assignment is B1's per-row table (ledger 520–525) — L173 → D050, L280 →
  D051, L148 → D051.
- Every row with a `D###` dependency that is NOT listed in §8.1 is cited only
  as a cross-reference — no decision row exists for it; §8 confirmation is
  the gate for the listed entries.

---

## 2026-08-21 — M0 Build — Export Integrity

### D080 — crypto package for backup sha256 manifest (accepted)
Adopt `package:crypto` (Dart team, pure Dart) for the export/restore media
manifest: each exported blob is sha256-hashed and verified on restore
(Database.md backup format; soft failure on missing/mismatched files).
Rationale: the format mandates sha256; Dart stdlib has no hash primitives;
crypto is the standard minimal dependency. Approved within the M0 plan
checkpoint (Step 5.2 specified "sha256 via crypto").
Rejected: hand-rolled hash (never); a heavier hashing library.
Revisit: none for M0.

---

## 2026-08-21 — M0 Build — Media Capture

### D079 — image_picker for journal photo capture (accepted)
Adopt `image_picker` for M0 photo capture: photos picked from the device
camera or gallery return bytes + mimeType to the compose flow, saved via
MediaRepository (blobs in the Drift BLOB column, Decision C). User-approved
at the M0 plan checkpoint (2026-08-21, Decision B).
Rationale: one dependency handles camera-on-device + file-pick on desktop +
multi-photo in a single API; the capture attribute path (raw HTML input) was
considered but image_picker's web implementation is battle-tested. Vlog
recording stays dependency-free via browser MediaRecorder (package:web).
Rejected: raw HTML file input (manual interop for multi-file + no camera
attribute guarantees); ffmpeg re-encoding (locked out, D012).
Revisit: none for M0.

---

## 2026-08-21 — M0 Build — State Management

### D078 — Riverpod as the M0 state-management layer (accepted)
Adopt `flutter_riverpod` for the M0 UI: providers wrap repositories (each
repository is exposed through a provider); engines (Coach, streaks, storage
meter) stay pure functions consumed by providers, never widgets.
Rationale: Architecture.md already names Riverpod for the real application;
providers keep widget code reactive and thin while repositories remain the
only DB access path. User-approved at the M0 plan checkpoint (2026-08-21).
Rejected: plain StatefulWidgets + service locator (diverges from the
documented plan; no reactivity for the dashboard's derived blocks);
bloc (heavier than needed at personal scale).
Revisit: none for M0; re-evaluate only if provider patterns prove awkward.

---

## 2026-08-21 — Design Lock (S001 gate)

### D077 — Design-lock gate: final approval granted (accepted)
The user's explicit final approval for the TEMP-PLANNING integration design is
granted (2026-08-21). S001's single global gate is CLOSED: docs/ are locked as
the source of truth, and Milestone 0 may begin per `Roadmap.md`. Nothing in the
design-lock changes any architecture; it converts the pending approval state
(docs/README.md "await final approval", DevelopmentWorkflow.md S001) into
approved.
Rationale: the design has passed the census, no-holes, and audit gates; the
user reviewed and approved the docs set.
Rejected: holding the gate open further.
Revisit: at M0 exit per `Roadmap.md` (each milestone ends with docs + DecisionLog
updated).

---

### Open items — build-time dependency decisions required (open; pending)
The following require a DecisionLog entry + user approval at build time before
the feature can be built (no-new-dependencies rule; AGENTS.md). They are
recorded here so they are not adopted silently:
- **J5 Year Book PDF** — PDF generation on Flutter requires a package (no
  built-in PDF writer). Decision needed before the J5 build (D056).
- **NU13 food macro lookup** — USDA FoodData Central (core, public domain) +
  OpenFoodFacts (CC0, optional second source) are open-source data dependencies.
  Decision needed before the food lookup is formalized (D062).
- **J7g auto-adopt** — auto-adopt uses the File System Access API (Chromium
  only; other browsers degrade to manual folder pick). Decision needed before
  the J7 PC-video-library build (D057).

---

## 2026-08-23 — Roadmap overhaul (user-directed re-order)

### D081 — Roadmap restructured: per-system milestones + re-ordering (accepted)
The Roadmap is overhauled per the user's explicit direction (2026-08-23).
M0 is untouched and stays first. Every large, fully-specified system now has
its own milestone in the classic M0 format (Scope / Includes / Exit criteria /
Gate), and the order changed to respect data dependencies:

- **New order:** M0 Core Loop (unchanged) → M1 Journal Features (J1–J6 +
  physique timeline) → M2 Fitness & Body → M3 Nutrition & Energy Balance →
  M4 Daily Routine & Briefing → M5 Goals & Tasks (the former M1, moved later
  so weight/strength goals ship with real body/exercise data) → M6 Calendar &
  Periods → M7 Analytics Engine & Gamification → M8 Full Coach → M9 Life Tree
  → M10 Drive P2 backup → M11 Entity Sync Plane → M12 Drive P2.5 media blobs →
  M13 Drive P3 media vault → Future candidates (Study, projects, AI adapter) +
  idea park + Graph (under consideration, unnumbered).
- **Former M2 split** into M7/M8/M9 (analytics & gamification; full coach; Life
  Tree) for build size; the locked M2 sequencing (features planned → Coach
  rule-book session → UI/UX ordering pass) is preserved inside M8.
- **Locked ordering preserved:** workouts before macros (D041), nutrition
  before routine (S009), entity sync before P2.5 before P3 (D059), P2 after
  the former-M2 phase (D005), graph under consideration (D023), fitness
  surface closed (D060).
- Nothing was dropped: all scope/exit-criteria content from the old M0–M8
  moved into the new milestones; content from other docs that had no milestone
  home (journal features J1–J6, calendar, periods, routine, nutrition, Life
  Tree placement) now has one. Renumbering map (old → new) lives at the top of
  `Roadmap.md` so S-notes and D-series references stay interpretable.
- Cross-refs updated: README.md milestone span, Database.md (Milestone 4 → 11;
  Milestone 8 → Graph section), MediaStorage.md (Milestones 4/5/6 → 11/12/13),
  D023's Roadmap pointer.
- Rejected: keeping the old numbering (stale "future systems" bucket hid fully
  specified systems); folding the sync chain into one milestone (D059 locked
  them separate).
Revisit: at each milestone boundary per `Roadmap.md`; re-ordering is always
authorized in that file with a DecisionLog entry.

---

## 2026-08-28 — AI agent skill toolchain (user-approved install)

### D082 — Skills installed: find-skills, strix, open-design atoms (accepted)
Installed into `.opencode/skills/` per user scoping (exactly these three; no
other skills this session):

- **find-skills** (Vercel Labs) — meta-skill teaching the agent to discover,
  evaluate (install counts, source reputation), and recommend registry skills
  via `npx skills` before hand-rolling prompts or adding skills. Discovery
  gate only: any candidate still needs a DecisionLog entry + user approval,
  and security vetting (several popular skills fail automated scans).
- **strix ×9** (usestrix/strix) — agent skills driving Strix autonomous
  pentesting (white-box + black-box, PoC-validated findings, no static-scan
  false positives). Runtime (Strix CLI + Docker sandbox) NOT installed —
  gated to the M3 OAuth/backup milestone. Authorized target: own app only.
- **open-design atoms ×13** (nexu-io/open-design `plugins/_official/atoms`):
  design-extract, direction-picker, token-map, critique-theater, handoff,
  diff-review, patch-edit, build-test, code-import, discovery-question-form,
  figma-extract, rewrite-plan, todo-write. Full OpenDesign needs the `od`
  daemon (desktop app / source build — manual step, not done); its MCP server
  is wired in opencode.json as disabled until the daemon exists. The full
  139-skill library was NOT installed (per-session context bloat); remaining
  skills are on-demand via find-skills.

Already present (no action): superpowers suite (14 skills), frontend-design,
impeccable, owasp-security, skill-creator, mobbin-* (5), code-simplifier +
code-reviewer subagents, Karpathy rules (AGENTS.md "Universal work rules"),
MCPs context7 / playwright / drive (opencode.json).

Rationale: find-skills enforces the no-new-deps rule as a process; strix is
the milestone-level security pass complementing the per-commit owasp-security
gate; open-design is local-first BYOK and aligns with the $0 + data-ownership
principles; only curated official atoms were installed to cap context cost.

Rejected/skipped (2026-08-28 consultation, user scoping): agent reach (cookie
credentials = secret surface, no matching need), TS LSP (Dart app), higgsfield
(video-gen product, not a skill), codeburn (spend telemetry for another
harness), graphify (revisit post-M1 when code exists), notebooklmpy
(unofficial API), n8n (overkill for offline-first single-user), context-mode
(paid), morph (paid infra), gstack / GSD / compound-engineering (ideas adopted
into process; no package install), cavemen / grill-me / feature-dev (deferred).

Revisit: strix runtime at M3 design phase; open-design daemon at the M0
dashboard UI milestone; firecrawl/exa MCPs when a concrete research job needs
them (API keys pending).

---

## 2026-08-29 — Skill additions from parallel session (retroactive entry)

### D083 — Skills: flutter-expert, security-and-hardening, security-threat-model (accepted, retroactive)
> Cross-reference (2026-09-26 gen-2 docs pass): the gen-2 ledger recorded this
> install as two records (ledger D083/D084) that collided with this entry's
> number. Per D117 H0 the ledger pair was renumbered at the docs pass — D118
> (flutter-expert) and D119 (security suite) are the canonical ledger-side
> records; this entry remains the historical record of the combined install.
Installed 2026-08-29 by a parallel session via the skills CLI (sources and
hashes recorded in `skills-lock.json`):

- **flutter-expert** (jeffallan/claude-skills) — Flutter 3+/Dart expertise:
  Riverpod/Bloc state, GoRouter, performance profiling, DevTools jank fixes.
  Rationale: perf-critical Life Tree rendering work needs Flutter-specialist
  guidance (AGENTS.md "Agent skills").
- **security-and-hardening** (addyosmani/agent-skills) — web/PWA hardening for
  auth, storage, import/export, and LLM-output handling. Rationale: same
  surfaces as the per-commit security gate (owasp-security); adds
  implementation-side hardening patterns.
- **security-threat-model** (openai/skills) — repo-grounded threat modeling:
  trust boundaries, assets, attacker capabilities, abuse paths, mitigations.
  Rationale: use at the M3 OAuth gate and for the Life Tree engine (AGENTS.md).

This entry is retroactive: the parallel session installed the skills and
encoded the SKILL-INSTALL SECURITY GATE (AGENTS.md, 2026-08-29) without a
DecisionLog entry, which violates the no-new-deps rule. User approved the
installs on 2026-08-29; entry closes the gap. Sources were vetted per the
install gate (well-known maintainers, no malicious commands found).

Note: `life-tree-design/` (Life Tree design docs) is intentionally NOT
committed per user directive 2026-08-29 — left untracked and untouched.

Revisit: none. All three skills stay on the M3 gate review path with
owasp-security.

---

## 2026-09-26 — Gen-2 Design Integration (docs pass)

The records below are confirmed at Stage C of the gen-2 TEMP-PLANNING
integration (verdict record: 2026-09-26; ledger `docs/IntegrationLedger.md`,
structural proposal `docs/StructuralImpactProposal.md`). The gen-2 ledger
families (candidate-C/F/N/L, audit, tree, engine, D-records) are the sources;
the tree-7 design session's decisions land here as the D085–D117 register, and
the gen-2 locked candidates land as the D118+ records below. Every entry's
detail lives in the doc named in the entry; DecisionLog carries the decision,
rationale, and revisit condition — not a second copy of the design.

**D-number convention (ledger L001):** house rule — every decision gets a
D-number. The implied D082+ convention was applied to every LOCKED C/F/N/L/engine
row in the gen-2 ledger; the docs pass assigns the final numbers (D118+, one
shared ID per same-theme rows). Repeated "DecisionLog (D082+)" lines in ledger
entries are redundant but harmless.

### D085 — Seasonality driver (locked)
The calendar year is the tree's botanical cycle: spring bud break + bloom,
summer full canopy, autumn fruit + color, winter honest dormancy. The ring
closes at the ANCHORED WINDOW's boundary (E3/D090 — never calendar-chopped); a
ring is never split or moved by the calendar year. INTENSITY: the user's own
data modulates the season visuals (rich journaling spring = dense bloom; heavy
gym summer = thick latewood; quiet year = sparse bloom, honestly shown).
ENGINE: a season-phase function (calendar) + intensity modifiers (data per
season); the why-panel explains both halves. "Greener winter canopy" is
SUPERSEDED by D095's leaf-bud model (a winter of logging makes the spring flush
denser — the bank — not a greener winter canopy). Botany: MASTER-Botany-
Reference.md PART 9.
Rationale: the calendar year is the universal, honest heartbeat every user
shares; data modulates it so the seasons never lie.
Rejected: a fixed decorative season loop with no data coupling; calendar-chopped
year boundaries.
Revisit: at M9 with the seasonal rendering (D095 + D111 P-03).
Detail: docs/LifeTree.md §9; life-tree-design/VISION.md §4.1 + SCHEMA.md §5.

### D086 — Super-hard achievement visual (locked; hybrid)
The hardest-tier achievements get a deterministic core + derived accents: the
achievement grants its fixed designed transformation (the SHAPE of the event —
same for every earner); the user's own data colors it (palette/accent details
derived from their domain balance). Fully deterministic + explainable; anti-farm
intact (pure function of data); the why-panel explains both halves. USER
CORRECTION (TREE-7 ADDENDUM): the Ghost-in-the-Machine family is NOT the
only/named hardest set — the rarity-tier ladder must be built from the FULL
scanned achievement list (every family, every tier); the achievement-to-tier
scan is a mandatory sub-step of Step 3.
Rationale: hard-earned visuals must stay deterministic and explainable; the
ladder must reflect the whole catalog, not one family.
Rejected: a single named family as the only "hardest"; non-deterministic
visuals.
Revisit: at M9 phase D (visuals) with the scan output.
Detail: docs/LifeTree.md §14; life-tree-design/VISION.md §4.2 + SCHEMA.md §6 +
ACHIEVEMENT-SCAN.md.

### D087 — Habit mapping — habits as buds (locked)
Every active habit = a bud on the habit branch: dormant when unworked, swelling
with streak momentum, bursting into new growth/leaves on completion, withering
honestly when abandoned. Abandoned habits leave BUD SCARS (the tree records
habit history like a real tree records its buds — botany parts 4.3/4.6.11).
Habit completions feed the extension engine (growth from the burst). ONE system
— the bud is a native part of the tree, not a second visual layer.
Rationale: the habit branch IS the bud garden; two layers would duplicate the
same state.
Rejected: a separate habit visual layer.
Revisit: at M9 phase C (buds) with D112 DV-C5 (the habit card becomes the bud's
local view).
Detail: docs/LifeTree.md §4; life-tree-design/VISION.md §4.3 + SCHEMA.md (input
map — habits rows).

### D088 — Branch system v4, duality, adaptations, coherence (locked; A–F)
A. BRANCH SYSTEM v4: 5 FIRST-ORDER BRANCHES = the 5 FIXED app sections
(journal, habits, gym, nutrition, goals) — all present from day one; no "new
domains", no domain "dies". LEADER (apical dominance): the most SUSTAINED
domain leads the crown. FORKS (second-order) derive ONLY from sustained
differentiation of genuine sub-features. TWIGS (canopy mass): one twig per
month of sustained presence per domain — canopy density IS consistency made
visible. SCALE SEPARATION: trunk+rings = years · branches = domains · forks =
sub-features · twigs = months · leaves = entries/trophies (days) · buds =
habits (streaks) · flowers = achievements (rarity) · fruits = goals
(milestones). BRANCH RINGS: each branch carries its own rings = years that
domain was ACTIVELY PRESENT. DORMANCY + REVIVAL: no death, no scars; resumes
from TIP BUDS. FRUIT SPURS = completed goals.
B. THE DUALITY PRINCIPLE: every section UI is the local view of its tree organ
— ONE derived state, ONE animation language, TWO scales (habits = bud garden;
journal = leaves; nutrition = sap monitor; gym = branch growth; goals =
orchard; achievements = garden). The app becomes one organism visually AND
structurally.
C. THE ADAPTATION LAYER: modifications = the tree's LONG-TERM ADAPTATIONS to
sustained life patterns — the rarest structural layer, slower than flowers. A
TRANSFORM layer (trunk → caudex, branches → thorns, roots → buttress, leaves →
phyllodes, wood → reaction). GOVERNING RULE (user directive): the achievement
system is the TRIGGER AUTHORITY — NO parallel trigger systems (restated/amended
by D103). THE ADAPTATION MAP: 14 rows (caudex, reaction wood + epicormic,
thorns + spines, buttress, phyllodes, cladode, tendrils, storage taproot,
contractile, mycorrhizal, stolons, storage leaves, bracts, bud scales — each
with life pattern → trigger → master ref). SCRAPPED (user): AERIAL ROOTS /
velamen. HONEST SKIPS documented (haustoria/parasitic, pitcher/bladder/snap
traps, rhizomes/bulbils/offsets, pneumatophores/knee/floating/assimilatory
roots, pseudobulb, scale leaves — no zombie forcing). The D116 D9 cadence armor
SUPERSEDES the 365-day/100-day referents (thorns = 52 consecutive weeks + tenure
≥2; spines = 26 consecutive weeks).
D. GRADIENT COHERENCE MODEL: 4 CONTINUOUS AXES (0.0–1.0), each derived from the
event log — RESOURCE (lush↔sparse), RHYTHM (steady↔bursty), BALANCE
(single-focus↔multi-domain), TENURE (young↔ancient); positions, NOT categories/
buckets; overlaps natural in the middle ranges (the MEDITERRANEAN position).
ONE CHARACTER PER ORGAN — same-organ contradictions are the hard floor, always
forbidden. CONTRADICTION BY CONSTRUCTION: each adaptation has a required
SIGNATURE on the axes (caudex tenure ≥0.7 + resource ≤0.6; buttress FINAL
balance ≥0.7 ONLY per D116 D5-amended). RANK RULE: strongest data support wins
the DOMINANT character; compatible runner-ups at SUBTLE tier. UNIVERSAL
ADAPTATIONS: reaction wood, epicormic, mycorrhizal, bracts, contractile roots,
bud scales.
E. INTEGRATION RULES: achievement-trigger + gradient-filter; FLOWER-LAYER
FALLBACK — every achievement is visualized at the flower layer at minimum, so
NO achievement is ever unrewarded; the why-panel explains both halves (trigger
+ position).
F. THE CONSISTENCY PRINCIPLE (user directive): THE MOST CONSISTENT USERS GET THE
MOST BEAUTIFUL TREES WITH THE MOST MEANINGFUL MODIFICATIONS — consistency
compounds at every layer (tenure axis, branch rings, canopy density, caudex,
reaction-wood history, winter storage).
Recording-audit follow-ups (a)–(i) close the 11 residual findings of the
2026-08-29 recording audit: the B4 register row carries the mixed-domain bar;
the CANOPY RULE (any month with ≥15 in-window days ANY-DOMAIN-MIXED grows a
twig on the month's most-active branch); the C14 branch-ring bar (an anchored
year with ≥40 in-window days in the domain); E15 dormancy threshold (≥14
consecutive quiet days); A3 calendar-month pin (twig windows are CALENDAR
months; the February dip is an honest feature); M-2 wording (leaf-buds burst at
SAPLING regardless of twigs); E2 balance-only; trigger-table stale rows
corrected (2/3/6/7/9/10 carry the D116 values + cadence armor + exclusion);
bankBuds aggregated by achievementId with the count badge.
Rationale: one organism, one derived state, one animation language; consistency
is the reward axis.
Rejected: per-domain "death"; a second visual system per section; parallel
trigger systems (re-affirmed by D103).
Revisit: at M9 phases B–F; the register freezes at the engine contract (D116).
Detail: docs/LifeTree.md §4–§6, §8, §14; life-tree-design/VISION.md §4.2–4.5 +
SCHEMA.md + TRAIT-SPACE.md §3 + research-botany/MASTER-Botany-Reference.md.

### D089 — Modification rarity split (locked; amends D088 C)
Modifications are RARE ITEMS — reserved for genuine years of consistency. THE
SPLIT: (1) RARE STRUCTURAL MODIFICATIONS (silhouette-level, visible at a
glance): caudex, buttress roots, phyllodes, cladode segments, thorns, storage
leaves — HARD TENURE FLOOR: none manifest before real qualifying years exist
(floor = 2+ qualifying years; caudex and buttress at HIGHER tenure — exact
floors in the engine contract); (2) SUBTLE CHARACTER DETAILS (close-up/anatomy
views, never the silhouette): reaction wood, epicormic shoots,
mycorrhizal/coach detail, bracts, bud scales, contractile roots, stolons,
storage-taproot detail, SPINES (100-day streaks — DEMOTED from the structural
tier; the 100-day referent SUPERSEDED by D116 D9 cadence armor: 26 consecutive
weeks). No tenure gate for subtle details — the tree's fine texture rewards
every user without diluting the structural layer's rarity. D093 refines the
tenure floor to read the tree's own stage-years.
Rationale: rarity must be earned at the structural layer; subtle texture keeps
every user rewarded without cheapening the rare layer.
Rejected: tenured gating on subtle details; a uniform rarity treatment across
both tiers.
Revisit: at M9 phase D with the engine-contract floors.
Detail: docs/LifeTree.md §14; life-tree-design/TRAIT-SPACE.md §3 + VISION.md
(principle 10).

### D090 — The master clock + anchors (locked; Resolution #1 of the loophole session)
A. ONE master stage clock, derived from growth across ANY domain:
SEED→SEEDLING (first logged event, any class); SEEDLING→SAPLING (first
sustained presence period — first twig on any branch); SAPLING→POLE (first
qualifying year, any-domain, anchored — never calendar-chopped); POLE→MATURE
(DERIVED MATURITY — a structural-growth threshold; pioneer speed; the botanical
compression); MATURE→OLD-GROWTH (decade scale ~10 qualifying years).
B. ONE frozen birth anchor: the seed date = the account's FIRST EVENT EVER,
frozen at creation; deletion never shifts it. "No events = no tree" (not "no
journal = no tree").
C. RINGS = A BRAND, not the clock: the six-domain qualifying-year ring
definition stays locked as the ring's MEANING, but rings no longer control tree
growth; single-domain users reach full maturity — they just never brand rings;
rings are calendar-neutral (anchored windows per E3).
D. CALENDAR SEASONS = VISUAL-ONLY (D085), layered on the stage clock.
E. Overhaul-independence: the clock is 100% derived from the event log; the
anchor is shared foundation; ring definitions decoupled. (D101 gives the year
types clean vocabulary; D102 makes the frozen anchor app-wide.)
Rationale: one clock, one anchor, one honest story; the ring brand stops
gating growth so single-domain lives reach maturity.
Rejected: per-domain clocks; a calendar-chopped stage year; rings gating
growth.
Revisit: at M9 phase B (stage clock B1–B5 with the D116 values).
Detail: docs/LifeTree.md §2; life-tree-design/LOOPHOLES.md (master clock) +
VISION.md (principle 14b) + SCHEMA.md (derivation contract — stage ticks).

### D091 — Flower overlay — trophies unchanged (locked)
The 131 trophy names AND the tier labels (Sprout/Root/Branch/Heartwood/Ring/
Grove) stay EXACTLY as they are — zero redo. The flower thematic is carried by
an OVERLAY: every achievement WEARS its flower identity in the Life Tree via
the identity axis (family → flower family, ACHIEVEMENT-SCAN §1.5) + tier
magnitude + derived accents (D086) + the why-panel. The flower-themed tier
relabeling proposal (LOOPHOLES §5: Petal/Blossom/Anthesis/In Full Bloom/Annual
Bloom/Bouquet) is WITHDRAWN — superseded by the overlay; the naming-collision
findings (N-3) resolved by NOT renaming.
Rationale: the earned trophy vocabulary is user-visible history; the overlay
carries the flower thematic without touching it.
Rejected: relabeling the tier names; a second trophy vocabulary.
Revisit: never unless the user renames the catalog itself.
Detail: docs/LifeTree.md §14; life-tree-design/LOOPHOLES.md §5 (withdrawn) +
ACHIEVEMENT-SCAN.md §1.5 (identity axis = the overlay).

### D092 — First-bloom contract + tier schedule (locked; Resolution #2)
(1) PRE-MATURITY (seed → pole): every earned achievement is an ACHIEVEMENT BUD
— claimed, visible, the why-panel states "blooms at the first bloom"; nothing
blooms before maturity. (2) FIRST BLOOM (at derived maturity D090): ALL banked
Sprout/Root/Branch/Heartwood buds burst together — the earned cherry-blossom
moment; magnitude by tier, identity by family (D091 overlay), accents by data
(D086); Ring/Grove stay banked. (3) POST-MATURITY: Sprout..Heartwood bloom
DIRECTLY on earn. (4) RING TIER: blooms at the next ANNUAL BLOOM (the D085
spring — calendar-guaranteed). (5) GROVE TIER: banks until the next annual
bloom after maturity = THE TRANSFORMATION (the D086 large visual);
calendar-guaranteed, rare because Grove trophies are rare. (6) MULTI-TIER
TROPHIES per own thresholds. SUPPORTING RULES: the Coach line fires at the
EARN; the bloom is a silent visual; the why-panel states the schedule;
first-bloom is a designed event. NOTHING UNREWARDED, NOTHING FLATTENED. (D095
amends rule 3: winter-earned achievements bank to the next spring's flush.)
Rationale: the bloom is earned and scheduled, never flattened or delayed past
its event.
Rejected: delaying the earner's ceremony; flattening tiers into one bloom.
Revisit: at M9 phase D with the D095/D096 banking.
Detail: docs/LifeTree.md §10, §14; life-tree-design/LOOPHOLES.md (L-02/L-05) +
SCHEMA.md §6 + TRAIT-SPACE.md.

### D093 — Modifications schedule + tenure-floor refinement (locked; amends D088 C + D089)
A modification is the STRUCTURAL form of a massive achievement. THE FOUR GATES:
(1) TRIGGER (the massive achievement/condition fires at claim-time; the trophy
system untouched); (2) TENURE FLOOR (D089 REFINED): the floor reads the TREE's
own years — the D090 stage-clock qualifying years (any-domain) — NOT the
six-domain ring brand (otherwise the D090 starvation returns); the six-domain
ring remains a separate honor (a badge, never a gate); (3) AXIS SIGNATURES
(D088): unchanged; (4) STAGE FLOOR (NEW): a modification transforms an organ
that must exist and have substance (thorns need SAPLING+, storage leaves
SEEDLING+, buttress POLE+, caudex MATURE+). MANIFESTATION MOMENT: at the NEXT
ANNUAL BLOOM (the D085 spring growth event) — ONE YEARLY HEARTBEAT hosts
flowers + structural transformations; visible PENDING STATE before. SUBTLE
DETAILS (reaction wood, epicormic, mycorrhizal, bracts, bud scales,
contractile, stolons, spines, storage-taproot): no stage floor beyond the organ
existing. THE MASSIVE-TROPHY LINK: caudex = unbroken-year trophies; thorns =
streak trophies; buttress = multi-domain trophies.
Rationale: gates, not gates-with-badges — the tree's own years decide, so no
life is starved by the ring brand.
Rejected: the six-domain ring brand as a tenure gate (starvation for
single-domain users).
Revisit: at M9 phase D with the engine-contract floors.
Detail: docs/LifeTree.md §14; life-tree-design/LOOPHOLES.md (schedules) +
TRAIT-SPACE.md + SCHEMA.md (adaptation gates).

### D094 — Stage-transition UX (locked; Resolution #3)
(1) DAY-1: the SEED is a closed package (coat + embryo + food, botany-correct)
— one beautiful stylized seed, the overview strip with the 5 domains as GHOSTED
BRANCH-BUDS ("where your branches will grow") + the bank counter; the day-1
tree must be beautiful on its own. (2) GERMINATION: the first logged event
plays the first transition (seed cracks, root curls down, tiny stem rises;
SEEDLING arrives with 5 branch-buds + the first achievement bud) — the first
log visibly grows the tree. (3) EVERY TRANSITION IS A DESIGNED MOMENT
(triggers = D090 ticks, fires live or queued; REPLAY-ON-OPEN +
VIEWED-WATERMARK — unviewed transitions play chronologically on next open, then
settle; this mechanism is the M9 launch-day replay engine (N-1)); the moments:
germination, first branch, pole-rise, MATURITY + FIRST BLOOM (biggest,
skippable, shown once, 8–12s), old-growth; notification story: no push;
reduced-motion static fallback; durations: germination ~3s, transitions ~2–4s,
first bloom ~8–12s — nothing loops, repeats, or spams. (4) THE WHY-PANEL
CARRIES THE SCHEDULE AT EVERY STAGE (stage name, age, next tick's progress,
bank count + bloom schedule). (5) THE OVERVIEW STRIP LIVES AT EVERY STAGE.
Rationale: the first log and every transition are the product's emotional
story; designed moments beat silent state changes.
Rejected: silent stage changes; loops/repeats; push notifications for
transitions.
Revisit: at M9 phase D/E with the ceremony engine (D108(5)/D109 C-1).
Detail: docs/LifeTree.md §10, §16; life-tree-design/LOOPHOLES.md (N-1
launch-day replay engine).

### D095 — Seasonal organ-state model (locked; Resolution #4; amends D092 rule 3)
The tree's year has two halves — GROWING SEASON (spring → autumn: blooms, leaf
production, growth flow) and RESTING SEASON (winter: everything banks).
PER-ORGAN STATES: (1) FLOWERS — growing season = blooms happen (post-maturity
on earn; Ring/Grove at the annual bloom); WINTER-EARNED achievements bank as
flower-buds and bloom in the next spring's flush (amends D092 rule 3); THE
BLOOM IS EPHEMERAL (holds through its flowering season, then FADES — the cherry
blossom's beauty IS its brevity; permanence lives in the why-panel, archive,
branch character/rings); (2) LEAVES — growing-season leaves; autumn leaf-fall
(deciduous honesty); WINTER ENTRIES BECOME LEAF-BUDS on the bare branches
(visible, honest, promising); (3) FRUITS — ripen in autumn; WINTER-COMPLETED
GOALS = WINTER-PERSISTENT FRUITS (crabapples/hawthorn hips), fall at spring;
(4) HABIT BUDS (D087) — winter = scale-wrapped dormant buds, alive underneath.
THE WINTER BANK → THE SPRING FLUSH (the unifying concept: everything done in
winter is STORED AS BUDS; spring converts the whole bank at once). DERIVED
OVERRIDE: a phyllode/evergreen-character tree keeps its leaves through winter.
Rationale: honest dormancy — winter work is banked, never hidden and never
lost.
Rejected: a winter that hides data; permanent blooms.
Revisit: at M9 phase C/D with the season-phase function.
Detail: docs/LifeTree.md §9; life-tree-design/LOOPHOLES.md (seasonal model) +
SCHEMA.md (seasonality system — the organ states).

### D096 — Early-fire expression contract (locked; Resolution #5)
THE GAP: rare-tier trophies can fire before the tree can express them (the
paper run REFUTED Ghost ~day 182 — the honest earliest is ~d96–97 per D116;
ceiling rungs — Dragon Slayer, The Brand — on DAY 1; Grove chains at year 3).
THE LADDER: (1) PRE-MATURITY — the earned massive trophy is not a plain bud — a
SPECIAL BANKED FORM (the bud wears the trophy's tier + family identity from day
one; a Grove bud is visibly different from a Sprout bud); why-panel: "Dragon
Slayer — Grove — this bud carries the strongest bloom your tree will ever
grow."; (2) THE BANK GROWS WITH THE TREE (a Ghost bud on a sapling looks
promising; on a pole-stage tree it looks imminent); (3) THE ANNUAL BLOOM — the
transformation manifests. SUPPORTING RULES: (1) TIER-VISIBLE BANKING (every
banked bud wears its tier's visual weight + family identity — the D091 overlay
applies to buds too); (2) THE BANK COUNTER IS A REAL SURFACE (bank composition
by tier — "5 buds: 3 Sprout, 1 Heartwood, 1 Grove"); (3) THE EARNER'S CEREMONY
IS NEVER DELAYED (Coach line + trophy claim fire at earn-time; only the visual
manifestation waits); (4) THE CEILINGS GET A SPECIAL BUD FORM (genetic-ceiling
trophies — Dragon Slayer 260kg, The Brand 5M kg — the most distinct bud in the
game). THE CLOSED LOOP: every trophy — day 1 or year 10 — has a dated, visible,
honorable expression at every moment of its life: earned → banked (tier-marked,
growing with the tree) → bloomed/transformed at its scheduled event. No trophy
ever a silent bud; no trophy ever flattened.
Rationale: day-1 earners and year-10 earners both get an honest, dated,
visible expression; the bank is a real surface.
Rejected: delaying the earn ceremony; flattening banked trophies.
Revisit: at M9 phase D with the D092/D095 banking.
Detail: docs/LifeTree.md §10, §14; life-tree-design/LOOPHOLES.md (tier
schedule) + ACHIEVEMENT-SCAN.md.

### D097 — Launch-day contract (locked; Resolution #6; resolves N-1 + N-7)
THE PROBLEM: the tree ships in M9, users log from M0; a veteran's first open
would render years of history at once. THE CONTRACT: (1) THE TREE IS DERIVED
FROM THE FULL HISTORY FROM DAY ONE (the veteran's tree is ALREADY MATURE on
first open; rings read the frozen anchor — 5 real rings, honestly; no fake
fresh start); (2) THE JOURNEY REPLAYS, ONCE, ELEGANTLY — the D094 replay engine
runs in sequence (seed, germination, then TIME-LAPSE MODE: the tree grows year
by year in a compressed ~20–40s sequence ending at the current state; why-panel
narration: "2029 — your first year — the gym branch grew. 2030 — your first
ring."); (3) THE VIEWED-WATERMARK (plays once, skippable; reduced-motion
fallback = jump straight to the current state); (4) THE PERF CONTRACT (first
frame = current state instantly — the D094 skeleton shimmer rule; the replay
streams from PRECOMPUTED YEARLY SNAPSHOTS, never live re-derivation;
background-loaded); (5) THE BACKDATING WINDOW (pre-M9 history fully derived;
manual backdating of NEW events governed by D100's two-tier split — content is
real (occurredAt truth), presence is earned (written-in-window guard) — the
tree never rewinds); (6) THE LEGEND CARD (one-time card after the replay: "Your
tree is 5 years old — 4 rings, 12 branches, 37 blooms. The rarest: Ghost in
the Machine — blooming at the next annual bloom."). The launch-day numbers
(time-lapse ~20–40s, 5 rings example, legend-card copy) are verbatim-critical.
Rationale: veterans deserve the honest full story in one elegant replay; the
perf contract keeps it instant and light.
Rejected: a fake fresh start; live re-derivation of the replay; an unwatchable
multi-year dump.
Revisit: at M9 launch (phase F + the launch gate).
Detail: docs/LifeTree.md §11; life-tree-design/LOOPHOLES.md (N-1/N-7 resolved).

### D098 — Restore/backup contract (locked; Resolution #7; resolves N-2)
THE PROBLEM: restoring an older backup could regress the tree (stage clock
rewinds, rings shrink, blooms un-bloom, scars resurrect); the deepest lock: the
tree records life; life doesn't rewind. THE CONTRACT: (1) THE TREE STATE IS A
DERIVED CACHE, NOT SOURCE DATA (event log = source of truth; tree = PURE
FUNCTION of the current log; restore replaces the log; the tree re-derives; no
separate tree state to corrupt); (2) MONOTONICITY BY DESIGN (birth anchor
frozen at account creation; the backup format carries it; rings derive from the
CURRENT log against the frozen anchor — an older restore honestly shows fewer
rings); (3) THE THREE RESTORE CASES (same-era: nothing changes; older:
re-derives honestly — fewer rings, earlier stage, banked buds un-bloom, scars
vanish; the why-panel narrates "your tree reflects your data as of [date]"; the
D094 replay engine offers the "rewind journey"; newer: re-derives forward; THE
GUARDRAIL: restore is an explicit conscious act, the why-panel stamps the
restore date, no silent regression ever); (4) THE RE-DERIVATION MOMENT IS A
DESIGNED TRANSITION; (5) THE CACHE RULE (the tree cache is REGENERABLE — never
part of the backup format's integrity story; rebuilds off-thread, shimmer-first);
(6) WHAT NEVER SHRINKS (nothing in the current log; the log is append-only in
normal life; only an explicit restore rewinds it).
Rationale: honesty over cosmetics — a restored older log shows an older tree,
and the user is told so.
Rejected: silent regression; tree state as source data.
Revisit: at M10–M13 with the sync plane (D109).
Detail: docs/LifeTree.md §12; life-tree-design/LOOPHOLES.md (N-2 resolved).

### D099 — Caps + media aggregation + mirror boundary (locked; Resolution #8; resolves N-4/N-5/N-6)
(N-4a) THE BLOOM-BURST CAP — the annual bloom manifests the bank in MAGNITUDE
ORDER (Grove first, then Ring, then the growing-season earns) with a per-bloom
VISUAL BUDGET; overflow blooms in SUCCESSIVE WAVES across the flowering season
(botanically real — the spring bloom becomes a spring SEASON of blooming); no
flower lost; the moment never floods. (N-4b) THE LIVE HABIT-BUD CAP — buds
beyond the branch's derived capacity cluster into BUD CLUSTERS (each a countable
surface — "12 habits in this cluster" — with individual buds revealed on zoom).
(N-5) THE MEDIA-AWARE AGGREGATION RULE — the leaf cluster's CHARACTER reflects
its media content (photos/vlogs render with the STORAGE-LEAF character —
thicker, richer — D088 storage leaves) even at aggregation scale. (N-6) THE
MIRROR BOUNDARY — the why-panel mirrors DERIVED FACTS ONLY — never LLM
narrative; SUPERSEDED by D110(1): the tree NEVER touches coach_outputs rows —
payload-blindness; the derived owners carry the mirror. PROTECTED-ABSENCE
branch copy: "resting" — never "abandoned".
Rationale: the bloom is a season, not a flood; the mirror is facts-only.
Rejected: unbounded bloom bursts; LLM narrative in the why-panel (re-affirmed
by D110(1)).
Revisit: at M9 phase D with the D110(1) supersession reflected.
Detail: docs/LifeTree.md §10, §14; life-tree-design/LOOPHOLES.md (N-4/N-5/N-6
resolved — pipeline CLOSED).

### D100 — The retroactive rule — the two-tier split (locked; Step-0 arbitration #1; resolves A C-1 + B C-02; overturns wave-1 N-7)
THE CONTRADICTION — "retroactive/bulk logging NEVER rewards" (gamification
forbidden list) vs "backdating advances honestly" (D097) — the tree could be
farmed. THE RESOLUTION (inherits the gamification's own two-tier split):
(1) PRESENCE ORGANS (twigs, RHYTHM axis, dormancy, bud momentum, qualifying
days) read dayKey WITH A WRITTEN-IN-WINDOW GUARD — a day counts as presence
only if its events were written within a small grace of that day (candidate:
±3 days — the streak grace philosophy; VERBATIM-CRITICAL — locks in the
THRESHOLD REGISTER, D105 A1); (2) CONTENT ORGANS (leaves, fruits, the anchor)
read occurredAt TRUTH — content is real; presence is earned; (3) THE SHARED
PREDICATE fixes BOTH systems: one rule ("an event counts as presence for a
dayKey only if written within the grace window") kills the manufacture-a-year
attack for the tree AND the gamification's yearly bars — one fix, two systems,
no tree special-case; (4) IMPORTS stay excluded everywhere (locked); (5) THE
ANCHOR EDGE: the tree's birth = the first IN-WINDOW event — a pure backfill
cannot birth the tree. Worked example: an honest Sunday catch-up (Friday's leaf
renders + counts); the attack (backfilling a whole year in one weekend) — every
dayKey outside the grace → zero qualifying days, zero twigs, zero stage ticks;
leaves render but the year cannot become a ring — honestly visible, honestly
un-earned.
Rationale: content is real; presence is earned — one predicate fixes both the
tree and the yearly bars.
Rejected: single-tier backdating (N-7); the manufacture-a-year attack.
Revisit: the ±3-day window locks in the register at the engine contract
(D105/D116).
Detail: docs/LifeTree.md §2, §11; life-tree-design/LOOPHOLES.md (R2 resolved) +
SCHEMA.md (presence predicate) + INPUT-INVENTORY.md §12.

### D101 — Qualifying-year definition — two named year types (locked; Step-0 arbitration #2; resolves F-03)
THE PROBLEM: "qualifying year" meant three different things (D090 stage tick /
Life-Fully-Logged ring / tenure+floors) and the systems mixed them. THE
RESOLUTION — TWO YEAR TYPES, NEVER CONFUSED: (1) STAGE-YEARS (any-domain): a
365-day window anchored to the frozen birth anchor (E3 — never calendar-chopped;
the literal windowed reading SUPERSEDED by D116 S2 — the CUMULATIVE-ACCRUAL
reading governs, ~13.2 months per stage-year for the sparse life) where the
user had SUSTAINED PRESENCE IN ANY DOMAIN (per the D100 predicate); (2)
RING-YEARS (six-domain, THE BRAND): the same anchored 365-day window with ALL
SIX DOMAINS present; drives ONLY the trunk rings + the ring-tier trophies. THE
THREE RULES: (1) THE STAGE CLOCK NEVER READS RING-YEARS (a single-domain user
accumulates stage-years forever — reaches maturity, blooms, grows old — they
just never brand a ring); (2) THE FLOORS READ STAGE-YEARS (D089's "2+
qualifying years" = 2+ stage-years — per D093, unambiguous); (3) ONE WINDOW
MECHANISM, TWO REQUIREMENTS. THE DEFERRED PIECE (recorded — belongs to the
THRESHOLD REGISTER, Step 1 of the input map): the RING-YEAR PER-DOMAIN
PRESENCE BAR — how many in-window days make a domain "present" for the ring
(the farmable-ring finding B C-02 needs this number; the D100 guard already
blocks manufactured years; the bar locks with its siblings: qualifying-day
floor, stage-year bar, twig bar).
Rationale: one window mechanism, two honest year types; the stage clock never
reads the brand.
Rejected: one year type serving three systems; calendar-chopped windows.
Revisit: the deferred ring-year per-domain bar locks with the register (D105)
at the engine contract.
Detail: docs/LifeTree.md §2, §5; life-tree-design/LOOPHOLES.md (R1 partial) +
SCHEMA.md (derivation contract — year types).

### D102 — The birth anchor — one shared anchor for the whole app (locked; Step-0 arbitration #3; resolves A C-2 + F-04 + H-01)
THE PROBLEM: four birth-date definitions (D090 frozen first-event, correct; the
Coach's first JOURNAL entry, SHIFTS on deletion; the input map's stale pre-D090
coach anchor; live code's daysInHeartwoodProvider — a third entity-based
anchor); a gym-only user gets a tree but never a Coach milestone review;
deleting an entry re-births the Coach's year. THE RESOLUTION: (1) D090's frozen
anchor becomes THE anchor for the entire app (the tree, the Coach, the
milestone reviews, and the rings all read the same value — the account's FIRST
IN-WINDOW EVENT per D100, frozen at first write, never recomputed, never
shifted by deletion); (2) the anchor rides in the backup format (D098) so
restore and sync never drift it; (3) the Coach's anniversary = the same anchor
(a gym-only user gets their milestone review on their tree's birthday); (4) the
input map's stale rows (§9/§14) corrected; (5) live code migrates to the shared
definition (a data migration for existing users; the Coach's shifting journal
anchor is replaced). USER-VISIBLE CHANGE: the Coach's milestone-review date may
move for users whose first event wasn't a journal entry — and it stops shifting
on deletion forever.
Rationale: one frozen anchor for the whole app; the Coach's year stops being
delete-able history.
Rejected: keeping the Coach's first-journal-entry anchor (shifts on deletion);
per-system anchors.
Revisit: at M8 (Coach anniversary amendment) with the CoachSystem.md docs-pass
change.
Detail: docs/LifeTree.md §2; docs/CoachSystem.md (anniversary = the shared
anchor — amended at the docs pass); life-tree-design/INPUT-INVENTORY.md
§9/§14.

### D103 — The trigger authority, restated (locked; Step-0 arbitration #4; resolves F-23)
THE PROBLEM: D088's rule ("the achievement system is the trigger authority — NO
parallel trigger systems") contradicts D088's own adaptation map — at least 8
of 14 adaptations fire on DERIVED triggers (reaction wood/epicormic = revival,
phyllodes = sparse-stubborn, cladodes = streak-without-entries, storage leaves
= media richness, contractile = consistency up, stolons = L-10 insights, bud
scales = dormant habits, mycorrhizal = coach engagement); only caudex,
thorns/spines, buttress, tendrils ride on achievements; the promised
achievement-scan correlation table was never produced. THE RESOLUTION — THE
RULE RESTATED, NOT BROKEN: (1) the achievement system remains the trigger
authority FOR EVERYTHING THAT HAS AN ACHIEVEMENT CONDITION (the flower tier
system, the adaptation gates, the ceremony — no feature may invent a trigger
where an achievement already encodes the condition); (2) DERIVED TRIGGERS
acknowledged as a second, legitimate family — with one discipline: they fire
only on derived patterns the achievement system does NOT cover; each gets its
own row in the TRIGGER-CORRELATION TABLE — the missing deliverable, produced in
the input map (the third artifact): every trigger (achievement AND derived),
its condition, its gate, and its visual — the whole trigger surface visible in
one place; (3) THE NO-DOUBLE-FIRE RULE: if a derived pattern AND an achievement
would both trigger something for the same condition, the ACHIEVEMENT WINS and
the derived trigger yields — one visual, one source, no double events.
Rationale: the authority restated is enforceable; the trigger-correlation table
makes the whole surface visible.
Rejected: parallel trigger systems (re-affirmed); an unbounded derived-trigger
family.
Revisit: at M9 with the trigger-correlation table (D106).
Detail: docs/LifeTree.md §6; life-tree-design/LOOPHOLES.md (R5 partial) +
SCHEMA.md (trigger-correlation table — an input-map artifact).

### D104 — The canonical domain table — the two-level model (locked; Step-0 arbitration #5; resolves F-02 + F-17)
THE PROBLEM: three domain lists fought (5 branches / 6 presence domains / 9
achievement families): the BODY domain had no organ home (family V — 16
trophies — homeless), media in the same boat (family VII — 12 trophies), GOALS
had no presence owner, and the BALANCE axis / tint owner / families each read a
different domain set. THE RESOLUTION — ONE CANONICAL TABLE, EVERY SYSTEM READS
IT: (1) THE CANONICAL PRESENCE-DOMAINS (7): journal, habits, gym, nutrition,
BODY, MEDIA, GOALS — each with a presence owner and a tree attachment; (2) THE
ATTACHMENT RULE (separation only if worth it): BODY = a sub-branch of GYM (the
physique/weight track; its 16 trophies bloom on the gym branch body-forks);
MEDIA attaches to JOURNAL (media rides on entries; media presence counts as its
own domain for rings/axes; media trophies bloom on the journal branch
media-forks); GOALS gets a presence definition (progress events / task
completions = goal presence — counts for the AXES/presence); the RING brand
reads the SIX CORE domains only (D116 D10 — goals excluded from the brand,
present in the axes — cross-referenced); (3) THE TWO-LEVEL MODEL, STATED:
PRESENCE-DOMAINS (7 — what counts in rings, axes, tint) vs BRANCHES (5 — what
the tree grows); mapping 7→5 (body→gym, media→journal, rest 1:1); every system
reads the same table (BALANCE axis, ring-years, tint owner, achievement
families attachment, twig sources).
Rationale: one table ends the three-way fight; every reader agrees on the
domain set.
Rejected: three fighting domain lists; a homeless BODY/media/goals.
Revisit: whenever a new domain or branch is proposed (the table is the single
source).
Detail: docs/LifeTree.md §3; life-tree-design/LOOPHOLES.md (R5 resolved) +
SCHEMA.md (Artifact 1 — the canonical domain table) + INPUT-INVENTORY.md (rows
corrected).

### D105 — The threshold register + dev-tools tuning surface (locked; the input map's Artifact 2; groups A–F all approved)
THE REGISTER — every number in the tree in one list (SCHEMA 2.4; EVERY register
value verbatim-critical; the D116 additions C8–C13/A6–A7/E15 amend SCHEMA 2.4):
A presence bars (A1 grace ±3d; A2 qualifying-event rule — journal ≥40 words
non-imported, gym ≥1 real logged set, nutrition ≥1 real food-log, body ≥1
canonical weigh-in, habits 1 completion, media 1 add; A3 twig bar PER-CLASS —
journal/habits/nutrition/goals ≥15 in-window days/CALENDAR month, GYM ≥8
days/month, BODY/MEDIA ≥4 active weeks/month + the CANOPY RULE (≥15 in-window
days ANY-DOMAIN-MIXED grows a twig); A4 stage-year bar ≥200 in-window days
CUMULATIVE-ACCRUAL (counter resets at 200); A5 ring-year per-domain bar ≥40
in-window days per domain over the six core domains) · B stage gates (B1
SEED→SEEDLING first in-window event; B2 →SAPLING ≥15 in-window days within any
30-day window, ANY-DOMAIN-MIXED (D115/D116 final); B3 →POLE 1 stage-year; B4
→MATURE ≥2 stage-years AND ≥90 in-window days ANY-DOMAIN-MIXED in the best
anchored year (D116 final); B5 →OLD-GROWTH ≥10 stage-years) · C capacities &
budgets (C1 bloom ≤15/event; C2 ≤4 waves/season (60 flowers/season); C3
habit-bud cluster ≥30/branch; C4 legend 1 per bloom + 1 all-time CROWN
(earliest-earned Grove, derived); C5 twigs ≤12/branch/year + 3-yr retention
window; C6 leaf-cluster granularity at POLE; C7 bank counter top-3 by tier +
count + CLOSED bucket) · D tenure floors (D1 structural ≥2, D2 buttress ≥3, D3
caudex ≥5 stage-years) · E adaptation axis signatures (the full 14-row gate
list: E1 caudex tenure ≥0.7 + resource ≤0.6; E2 buttress balance ≥0.7 ONLY; E3
phyllodes resource ≤0.4 + rhythm ≥0.5 + persist-intensity reversion; E4 cladode
streak-without-entries ≥0.6; E5 storage leaves attachment-mix ≥0.5; E6 thorns
52 consecutive weeks + tenure ≥2; E7 spines 26 consecutive weeks; E8 tendrils a
live >1y goal; E9 reaction wood/epicormic an UNPROTECTED revival; E10
contractile 3 consecutive anchored 365-day windows; E11 mycorrhizal coach
engagement threshold; E12 stolons L-10 insight ≥3 monthly windows; E13 bracts
no gate; E14 bud scales no gate; E15 dormancy ≥14 consecutive quiet days) · F
windows & formulas (F1 fixed-date seasons + render clock = stored timezone
setting; F2 growing season Mar 1–Nov 30; F3 anchored 365-day windows; F4
RESOURCE ceiling 12 + event unit pinned (per-input-class events, one count
each); F5 RHYTHM with the protected-absence discount; F6 BALANCE Shannon
evenness across the canonical-7, PRESENT OR NOT; F7 TENURE stage-years/10
clamped at 1; F8 replay ~2s/yr; F9 perf gate ≤16ms at LOD-1/2; F10
future-dating clamp). USER NOTES (locked): (1) THE DEV-TOOLS TUNING SURFACE
(user directive — important): every register value must be PLAYABLE during the
development/visual-testing phase — a dev-only debug panel that tweaks any
number and drives a live re-derivation + re-render; the archetype mockups and
the perf gate use it; NEVER shipped to users (a D117 B3 gate — MUST exist
before any visual tuning); (2) the RESOURCE normalization ceiling (20
events/day) reads high — kept as-is for now, calibrated via the dev tools at
the paper-run step (LOCKED at 12 by D116).
Rationale: every number in one list, dev-tunable, frozen at the engine
contract.
Rejected: hard-coded register values in code; shipping the tuning panel.
Revisit: the register freezes at the engine contract (D116); until then SCHEMA
2.4 is the live authority and the dev tools play every value.
Detail: docs/LifeTree.md §5; life-tree-design/SCHEMA.md 2.4 + LOOPHOLES.md (R4
resolved) + PLAN.md (Artifact 2 done).

### D106 — The trigger-correlation table + F-03 NO-BLOOM (locked; the input map's Artifact 3; D103's deliverable)
THE TABLE (SCHEMA 2.5): A the flower triggers (the D092 schedule + the D091
overlay + the D096 banking + D095 seasons + the C4 legend cap) · B the 14
adaptation triggers (each with its condition, gate (tenure floor + axis
signature + stage floor), manifest moment = the next annual bloom) · C the
structural/ceremony triggers (stage transitions, seasonal states, the first
bloom, the winter bank → spring flush, the launch-day replay, the restore
re-derivation, the annual bloom) · D the NO-DOUBLE-FIRE MAP (same-visual
collisions: the achievement wins; same-condition different-visuals: both fire;
contradictory signatures: impossible by construction; the F-03 flourish: no
conflict). THE F-03 ARBITRATION (user — NO BLOOM): the PR ceremony fires on PR
events (not achievements) — it manifests as a NON-BLOOM BRACT-STYLE FLOURISH at
the logging moment (the ceremony's sparkle), ZERO flowers — the
flower=achievement contract survives.
Rationale: the whole trigger surface visible in one place; the PR ceremony
celebrates without touching the flower contract.
Rejected: PR ceremonies producing flowers; an invisible trigger surface.
Revisit: at M9 with the trigger engine.
Detail: docs/LifeTree.md §6, §10; life-tree-design/SCHEMA.md 2.5 + LOOPHOLES.md
(R5) + PLAN.md (Artifact 3 done).

### D107 — The tree-state data model — the lean form (locked; Step-3 deliverable #1; resolves IA-1)
THE PRINCIPLE: the tree state holds ONLY what the renderer draws and what the
derivation tracks incrementally — every other fact stays in its owning system
(achievements, streaks, goal progress, media, the clock), queried on demand; no
duplication, no drift, no stale copies. THE MODEL (SCHEMA 2.6; shape
verbatim-critical — the engine contract's data structure): meta (schemaVersion,
registerVersion, logFingerprint, derivedAt, anchor) · stage, stageYears,
currentWindowDays · axes · bankBuds [{achievementId}] (order = earn order) ·
legendAchievementId · trunk {rings [{index, sliver}], adaptations} · branches
[{domain, dormantSince, revivals, twigs [{monthKey, daysPresent}], forks [{type,
twigs}], rings, adaptations, fruitSpurs}] · habits [{habitId, state}] · leaves
(recent granularity + cluster aggregates) · flowers [{achievementId,
bloomDateKey, state}] · fruits [{goalId, dateKey}] · periods [{type, startKey,
endKey}]. THE LEAN PASS (documented): dropped — bank counts (derivable from
bankBuds), tier/family on buds+flowers, streakDays, wordCount/media counts, the
season block + growingSeason (pure function of date+timezone), scaleWrapped/
persistent/alive-fallen/waveSlot, extended/firstTwigKey/woodCharacter, ringYears
(rings.length), ring passed-flags/quality, growsWithStage/earnedDateKey,
anchoredYear, the base block; changed — revivals [dateKey], adaptations on
their organ only, fruits = completed goals only, leaves = render-scale only,
crown → legendAchievementId (once-set), stageYears + currentWindowDays.
Rationale: a lean cache cannot drift; every other fact stays in its owning
system.
Rejected: a fat cache duplicating owning systems.
Revisit: at M9 phase B (state-model implementation).
Detail: docs/LifeTree.md §7; life-tree-design/SCHEMA.md 2.6 + LOOPHOLES.md
(IA-1 resolved).

### D108 — The derivation protocol (locked; Step-3 deliverable #2; resolves G P-04 + C-3 + IA-10 + IA-9)
(1) THE INCREMENTAL UPDATE — the derivation reads the DELTA (events since the
cache's logFingerprint) + the CACHE itself (the previous state) → computes the
new state → ATOMIC SWAP (one transaction; the renderer never sees a half-written
tree); full re-derivation only on: first launch (D097), restore (D098), a
fingerprint mismatch, or a register-version bump (the dev tools); incremental
cost per event bounded. (2) THE FIRST-PAINT CONTRACT (P-04) — the cache is
PERSISTED (survives app restarts); first paint = the current state blob
instantly (LOD mass, not detail); the derivation runs OFF THE UI THREAD (an
isolate); a stale cache re-derives in the background with the shimmer until it
lands; the decade-user's tab open never re-derives 200k events on the main
thread. (3) THE ORDER-INDEPENDENT DERIVATION (C-3) — a SET-COMMUTATIVE FOLD:
resolves each entity to its FINAL STATE (newest create, latest supersede,
tombstone/revoke netting) and folds the resolved set, so the same merged log
always produces the same tree regardless of arrival order (delete-before-create,
revoke-before-event, parallel supersede chains cannot resurrect or regress
organs). (4) THE TWO-TAB CONCURRENCY CONTRACT (IA-10) — a SINGLE-WRITER
DERIVATION LOCK (only one tab derives at a time; the loser defers and re-checks
the fingerprint); the derivation is IDEMPOTENT (two tabs deriving the same
delta produce the same state — the loser's result is discarded); CEREMONY
DELIVERY IS PER-TAB. (5) THE IN-SESSION CEREMONY STATE MACHINE (IA-9) —
ceremonies never interrupt an active session — they QUEUE (the D094
replay-on-open watermark covers offline); an in-session transition fires only
at a SAFE MOMENT (tree tab visible, no modal, no composition in progress); the
user's writing is never interrupted by a bloom.
Rationale: bounded incremental work, atomic results, deterministic folds, and
ceremonies that never interrupt writing.
Rejected: full re-derivation on the main thread; per-event synchronous
derivation.
Revisit: at M9 phase B (derivation engine B4).
Detail: docs/LifeTree.md §8; life-tree-design/SCHEMA.md (derivation contract) +
LOOPHOLES.md (resolutions).

### D109 — The device-state cluster (locked; Step-4; resolves R9 C-1 + C-2 + C-4)
(1) THE VIEWED-WATERMARK'S HOME (C-1) — the watermarks become a SYNCED
`viewed_moments` table — USER STATE (like settings), never a regenerable cache;
the ACCOUNT-ONCE guarantee (the launch replay plays once per account, synced
across devices) + PER-DEVICE DELIVERY (a transition seen on the phone still
plays on the desktop — a delivery difference, not a state difference). (2) THE
FINGERPRINT IN THE BACKUP FORMAT (C-2) — formatVersion 3 carries a MONOTONIC
`logFingerprint` (eventCount + syncSeq) — a restored backup tells the cache it
is stale immediately (no blind re-derivation, no stale-tree windows); the cache
itself stays OUT of the format (regenerable — D098). (3) THE RESTORE × SYNC
CONTRACT (C-4) — a restore is ACCOUNT-LEVEL — it supersedes all devices; every
device re-derives from the restored log (the D098 "no silent regression"
guardrail extends to the fleet). (4) THE DELIVERY/STATE SEPARATION
(cross-cutting rule) — DERIVED FACTS CONVERGE on every device from the same
merged log; only DELIVERY (watermarks) and PRESENTATION (local bytes) differ.
Docs-pass amendments: Database.md gains formatVersion 3 + the logFingerprint +
the viewed_moments table; Roadmap M10–M13 reference them (formatVersion 2
enumeration stays valid for old backups).
Rationale: user state is synced; derived state converges; delivery differs.
Rejected: watermarks as regenerable cache; per-device state divergence.
Revisit: at M10–M13 with the sync milestones.
Detail: docs/LifeTree.md §8, §12; docs/Database.md (formatVersion 3 set);
life-tree-design/SCHEMA.md (sync contract).

### D110 — The privacy/copy boundary + L10N (locked; Step-5; resolves H-02/H-05/H-07/IA-2/IA-5/IA-6/IA-8)
(1) THE MIRROR'S PAYLOAD-BLINDNESS (H-02 — makes D099 implementable) —
coach_outputs rows store RENDERED TEXT in all 9 kinds; THE TREE MIRRORS H3
OWNERS ONLY, NEVER coach_outputs rows (the mycorrhizal character, the "resting"
copy, and the earn-line behaviors read the derived owners); the tree's read
surface never includes coach_outputs — structurally enforced. (2) THE WHY-PANEL
VALUE LAW (H-05) — the panel may show ONLY (a) facts derivable from the event
log and (b) the register's values — NEVER (c) free text from any stored system
and never (d) LLM narrative; every why-panel row checked against the four
clauses. (3) THE SHARING-SAFE DEFAULT (H-07) — the tree is a screenshot surface
— sensitive rows (body weight trend, nutrition numbers) render their copy
COLLAPSED ("derived — see the section") unless in-app with the panel expanded;
the tree itself sharing-safe by construction. (4) THE L10N CONTRACT (IA-2) —
the why-panel copy and the ceremony narration are LOCALIZABLE STRINGS, never
inline; the tree-state model contains zero prose (verified in the lean model);
localization wraps the render layer only; the derived-copy engine (the
why-panel's sentence builder) is the single place where language lives. (5) THE
AXES' IMPORT-FILTER (IA-5) — the axis formulas (F4–F7) read IN-WINDOW,
NON-IMPORTED events only — an imported batch can never skew RESOURCE/RHYTHM/
BALANCE. (6) THE READ-SURFACE EXCLUSION (IA-6 + IA-8) — the tree's derivation
reads the EVENT LOG + its own H3 owners ONLY — never the gamification cache
tables, never coach_outputs, never goal-system internals beyond the agreed
owners; the M7 analytics cache serves the Coach's windows; the tree derives
from the log directly (its own cache), never from the M7 tables.
Rationale: a screenshot-safe, text-blind, localizable tree; the read surface is
structurally closed.
Rejected: coach_outputs as a mirror input; LLM narrative; inline prose in the
state model.
Revisit: at M9 with the read-surface contract + the M7 cache-vs-log
arbitration.
Detail: docs/LifeTree.md §13; docs/CoachSystem.md (payload-blindness
reinforced at the docs pass); life-tree-design/SCHEMA.md (read-surface
contract).

### D111 — The surface/render cluster (locked; Step-6; resolves D C-1/C-2/C-3, G P-01/P-03, D M-1/M-3/M-5)
(1) THE SEMANTICS SURFACE (D C-1) — every organ (branches, buds, leaves,
flowers, fruits, rings, the bank) gets a SEMANTIC LABEL + STATUS + TAP ACTION
built from the SAME deterministic state model that paints it (one source, two
outputs — pixels and semantics cannot diverge); plus a WHOLE-TREE PORTRAIT
summary (the screen-reader's one-liner: "the tree: 5 years old, mature, 12 buds
banked, 3 blooms this spring") and a KEYBOARD MAP (fully navigable without
touch). (2) THE TRANSITION ANNOUNCEMENTS (D C-2) — the D094 ceremonies get a
TEXT-TWIN ANNOUNCEMENT — a live-region update (in-tab, not a push) narrated as
the transition plays ("your tree's first branch grew"); the reduced-motion
static fallback gets the same announcement; the bloom is never silent for
assistive tech. (3) THE COLOR-ONLY FACTS (D C-3) — no meaning rides on color
alone (the season is announced in the strip's text line "Autumn"; tier
differences carry SIZE/MARK differences, not just glow; a DEUTERANOPIA PASS is
a locked gate in the mockup + stress-test steps). (4) THE LOD LADDER (P-01) —
exactly three render levels: LOD-1 MASS (silhouette + canopy masses — first
paint), LOD-2 STRUCTURE (branches, retention-window twigs, individual leaves at
mature granularity), LOD-3 DETAIL (per-entry leaves + organ anatomy — only on
zoom/interaction); the hero defaults to LOD-1/2 by distance and device tier —
the 45k-draw-op disaster is structurally impossible. (5) THE AUTUMN LEAF-FALL
(P-03) — a MASS RE-BAKE (the canopy re-renders as its bare state once — baked
picture) with a capped shader-free particle effect (~150–300 sprites — the
bloom-rain budget reused); the fallen leaves form the LITTER PICTURE; the fall
is a moment, not a 22k-per-frame computation. (6) THE MOTION TIERS (D M-3) —
THREE tiers: FULL (the D094 durations), REDUCED (particles off, transitions as
quick fades), NONE (static, no motion) — reduced-motion settings honored; ≥44px
hit areas.
Rationale: one deterministic source drives pixels AND semantics; performance is
a structural property, not a hope.
Rejected: pixels and semantics diverging; an unbounded draw op count;
color-only meaning.
Revisit: at M9 phase B (renderer perf spike ≤16ms at LOD-1/2) + phase D
(mockups).
Detail: docs/LifeTree.md §15; life-tree-design/LOOPHOLES.md (resolutions) +
SCHEMA.md.

### D112 — The design-identity cluster (locked; Step-7; resolves DV-C1..C5)
(1) THE FLOWER IDENTITY'S COHERENCE FILTER (DV-C1) — every inflorescence family
gets an AXIS SIGNATURE (like the adaptations — e.g., the syconium/cross-domain
identity needs balance ≥0.6; arid-compatible families need resource ≤0.6); the
D086 fallback extends to the identity axis — a flower family the axes reject
manifests instead in a COMPATIBLE SIBLING FAMILY (same tier, harmonized), the
why-panel explaining the substitution; identity is part of the coherence
envelope, not an exception to it. (2) THE HEARTWOOD PALETTE (DV-C2 — approved
WITH NOTE) — a muted ink-wash blush is the ONE allowed "saturation moment" —
the bloom palette derives from the Heartwood ink/paper tokens (dark-first), the
blush reserved for the flowering events (like gold is for streaks); USER NOTE
(locked): this palette decision is OPEN TO EDITS during implementation/visual
testing — the tokens join the dev tools' playable surface, the final blush
treatment tuned at the mockup step. (3) THE 17-AUDIT (DV-C3 — approved) — a
systematic pass at the trait-space step (PLAN Step 7) assigning EVERY trait in
the botanical master (all 25 inflorescences, 30 fruits, 46 modifications, leaf
families/margins/venation/shapes, bark types, crown types) exactly one of three
statuses: WIRED (a data driver), RESERVED-UNMAPPED (deliberately not wired,
reason documented), or STRUCTURAL (always-present anatomy); output: one table
(trait × status × driver × manifestation moment); the drivers are dev-tunable
like the register numbers (AMENDED by D113: FOUR statuses incl.
EXCLUDED-BY-DESIGN). (4) THE UNIQUENESS GUARANTEE (DV-C4) — high-dimensional
deterministic per-user morphology: the trait selection reads MORE of the log
than the 4 axes — the per-domain ORDER OF FIRST-USE (the crown's birth order),
the LIFE AREA MIX (journal areas become a real driver of leaf-family character
per area), etc. (5) DV-C5 + the Heartwood naming note — the habit card becomes
the bud's local view (the mini-plant stages are replaced by bud states); the
"Heartwood" RENAME is dropped — all three "Heartwood" names stay (the app name,
the achievement tier "Heartwood", the habit stage), the ambiguity documented,
never renamed.
Rationale: identity obeys the coherence envelope; one saturation moment keeps
the bloom special; no user-visible name changes.
Rejected: flower families outside the coherence envelope; a second saturation
color; renaming "Heartwood".
Revisit: at M9 phase D with the dev-tools tuning surface (D105).
Detail: docs/LifeTree.md §4, §14; life-tree-design/TRAIT-SPACE.md (17-audit) +
ACHIEVEMENT-SCAN.md.

### D113 — The economy residuals + the 17-audit amendment (locked; Step-8; resolves IA-3/IA-4, B M-05/M-09)
(1) IA-3 THE NU4 BACKFILL COLUMN — the event schema gains a stored `isBackfill`
flag; the D100 predicate reads it — historical-backfill mode can never arm
rings, stage ticks, or presence (B C-02's fix becomes implementable). (2) IA-4
THE M13 ADOPTED-MEDIA `adoptedAt` — the media schema gains a stored adoption
timestamp — "qualifies forward-only" becomes computable; adopted rows never
backdate presence. (3) B M-05 WITHIN-TIER MAGNITUDE VARIANCE — two trophies of
the same tier get a small DETERMINISTIC size/placement variance derived from
the achievement's own condition data (the streak length at earn, the count at
earn) — same tier, visibly distinct, still deterministic. (4) B M-09
ADOPTED-MEDIA FORWARD-ONLY — adopted media counts for media presence
FORWARD-ONLY from adoption — never before it. (5) THE 17-AUDIT AMENDMENT
(user — important) — the audit has FOUR statuses, not three:
EXCLUDED-BY-DESIGN (PERMANENT) is a distinct status: the marshy/aquatic family
(pneumatophores, knee roots, floating/assimilatory roots) and the other
purposeful exclusions (haustoria/parasitic, pitcher/bladder/snap traps,
rhizomes/bulbils) are PERMANENTLY excluded — they do not fit any life pattern;
the audit records them under EXCLUDED-BY-DESIGN with the reason, and they are
NOT "reserved-unmapped" (that status implies future availability);
RESERVED-UNMAPPED now means only "a real pattern could appear later" (e.g., the
epicormic-style future candidates); WIRED + STRUCTURAL unchanged.
Rationale: the schema flags make the anti-farm predicates implementable; the
fourth audit status keeps permanent exclusions honest.
Rejected: backfill arming the tree; adopted media backdating presence;
three-status audit blurring permanent exclusions.
Revisit: at M9 phase D (the four-status audit table).
Detail: docs/LifeTree.md §14; docs/Database.md (isBackfill + adoptedAt
columns); life-tree-design/TRAIT-SPACE.md + LOOPHOLES.md.

### D114 — The closure round (locked; the final re-audit's fixes)
THE THREE DECISIONS: (1) QUIET-WEEKS (the one true gap) — quiet-weeks do NOT
pause the tree's growth (the tree is data-derived; a quiet-week is a Coach
DELIVERY discipline, not a data state); BUT quiet-weeks EXTEND THE
PROTECTED-ABSENCE MECHANISM (periods) — the branch copy says "resting" and the
RHYTHM axis discounts them like planned rests; one mechanism, three sources
(rest flags, vacation periods, quiet-weeks). (2) THE MATURITY GATE FIX (F-11)
— SUPERSEDED by D115/D116: MATURE = ≥2 stage-years AND ≥90 in-window days
ANY-DOMAIN-MIXED in the best anchored year (the final formula — the paper run
proved the single-branch bar locked out the sparse, rotating, and body-only
lives). (3) THE RING DOMAIN SET (F-12) — SUPERSEDED BY D116 D10 (the RING
FOLD): the final ring brand = the SIX CORE domains (journal, habits, gym,
nutrition, body, media — goals and periods excluded); the canonical-7 stays for
the axes/presence only. THE MECHANICAL FIXES (applied): leaves regain the D1
tenure floor (trigger-table B5) · contractile drops the invented floor (subtle
tier, D089) · the particle cap standardizes to ~150–300 (D111) ·
INPUT-INVENTORY §9/§14 coach-anchor rows → D102 · D097's N-7 citation → D100 ·
SCHEMA §3 secondary-growth text → the D101/B4 definitions · the matrix G-1: ALL
classes bank at SEED (content, completions, measurements, dates, goals — not
just achievements; the seed's bank counter holds everything) · the FUTURE-DATING
CLAMP (events with occurredAt in the future are excluded from all math) · THE
"TREE NEVER DISSOLVES" RATCHET (existence is monotonic once born; the anchor
persists in the backup; "no events = no tree" applies only to the first birth)
· LOOPHOLES §7/§8 refreshed. THE DEFERRALS (each with a home): the DOCS-PASS
AMENDMENT REGISTER (DecisionLog D100–D113 + Gamification/CoachSystem/Roadmap/
Database amendments — executed at this pass).
Rationale: quiet weeks are delivery, not data; the maturity gate and ring brand
finalize with the paper-run evidence.
Rejected: quiet-weeks pausing growth; a single-branch maturity bar; goals in
the ring brand.
Revisit: at M9 with the D115/D116-final values.
Detail: docs/LifeTree.md (throughout); life-tree-design/LOOPHOLES.md §7/§8.

### D115 — The gate-deadlock fix + the final reconciliations (locked; the relentless audits' must-fixes)
(1) THE GATES READ DAYS, NOT TWIGS (C-1/M-1 — the deadlock fix; AMENDED BY
D116 — the paper run bound the values): B2 SEEDLING→SAPLING = ≥15 in-window
days within any 30-day window, ANY-DOMAIN-MIXED (D116 binds 15 — the register
value; the 20 in the earlier record superseded; the every-other-day 30-day
window holds exactly 15); B4 POLE→MATURE = ≥2 stage-years AND ≥90 in-window
days ANY-DOMAIN-MIXED in the best anchored year (D116 — the mixed-domain fix;
the sparse-stubborn and rotating users mature too — the caudex archetype
reaches its bloom). (2) THE FORK-ROUTING NOTE — body/media days count toward
their PARENT branch's presence (gym/journal) — the forks are RENDER STRUCTURE,
never a gate (the body-only deadlock closes). (3) THE SEEDLING'S BANKED FORM
(M-2) — at SEEDLING, banked content renders as LEAF-BUDS on the stem + the
branch-buds (the D095 winter-bud mechanism generalized); the leaf-buds burst
into clusters at SAPLING regardless of twigs (the canopy rule — a never-twig
tree still leafs); the bank counter shows the composition. (4) THE LEAF-FAMILY
ENVELOPE (M-3 — the last zombie vector) — the tree derives ONE base leaf
character from the axes; per-branch variation picks SIBLING FORMS WITHIN THAT
FAMILY ONLY, never crossing into another family's envelope. (5) THE
GROVE-TRANSFORMATION WINTER PERSISTENCE — the crown legend and a manifested
transformation PERSIST THROUGH WINTER (the ephemerality rule, D095, applies to
ordinary blooms; the legend + transformations are the tree's permanent marks).
RECONCILIATIONS (recorded — the historical records keep their text, the
reconciliations bind): D085's "ring closes at the year boundary" = the ANCHORED
window's boundary (E3/D090 — never calendar-chopped); D085's "greener winter
canopy" SUPERSEDED by D095's leaf-bud model (a winter of logging makes the
SPRING FLUSH denser — the bank — not the winter canopy).
Rationale: day-count gates end the twig deadlocks; the reconciliations bind
without editing history.
Rejected: twig-count gates; single-branch bars; forks as gates.
Revisit: at M9 phase B with the D116-final register values.
Detail: docs/LifeTree.md §2, §5, §7; life-tree-design/SCHEMA.md + LOOPHOLES.md.

### D116 — The paper-run corrections (locked; user verdicts D1–D9 + surgical fixes S1–S16)
THE DECISIONS (user verdicts, verbatim): D1 B4 MIXED-DOMAIN MATURITY
(accepted): ≥90 in-window days ANY-DOMAIN-MIXED in the best anchored year — the
sparse-stubborn, rotating, and every-other-day users all mature; D2 PER-CLASS
TWIG BARS (accepted): journal/habits/nutrition/goals ≥15 days/30d; GYM ≥8
days/30d (the register value — so the 2×/week lifter passes; the 12 in the
original text was the 3×/week assumption; the register value governs); BODY/
MEDIA ≥4 active weeks/month — the canopy never lies about a consistent domain;
D3 F4 CALIBRATION (accepted): ceiling 12 + the event unit pinned (per-input-
class events, one count each) — the 20-ceiling sparse-misread and the
character-deciding compression are dead; D4 E3 RHYTHM TERM + REVERSION
(accepted): resource ≤0.4 AND rhythm ≥0.5 (the steadily-sparse acacia, never
the bursty or the lush) + PERSIST-INTENSITY reversion (once manifested, stays;
the intensity scales with the axes at each bloom checkpoint); D5 E2 RESOURCE
LEG (accepted, AMENDED by the recording audit): ≥0.4 initially, FINAL = balance
≥0.7 ONLY — the balance leg carries the signature; the balance champion can
grow the wide-crown roots; D6 REPEAT-BLOOM AGGREGATION (accepted): the same
achievement's re-fires merge into ONE flower with a count badge, capped per
achievement per bloom; the C3 cluster surface extends to the flower-bank;
per-habit caps; D7 SPUR ECONOMY (accepted): a fruit spur = ONE PER
MILESTONE/PHASE of a goal (~54–90 for a real life) + a cluster rule — never
per-task; D8 GOALS = FRUITS ONLY (user chose Option B — NO G-family): the goals
branch carries fruits + spurs + tendrils; goal completions NEVER produce
flowers; the why-panel is the goal storyteller; D9 CADENCE ARMOR (accepted
WITH the user's rarity directive — "thorns and spines must stay rare"):
thorns = 52 consecutive weeks + tenure ≥2; spines = 26 consecutive weeks (the
365-day/100-day referents are dead).
THE SURGICAL FIXES (S1–S16): S1 B2 15-vs-20 (the register holds 15; 9 walks
flagged the drift; fatal for every-other-day users); S2 A4 accrual pin (≥200
CUMULATIVE in-window days, the counter resets at 200; the literal
365-day-window reading is dead); S3 F5/F6 pins (active day = a day with ≥1
in-window event; F6 normalizes over the canonical-7 PRESENT OR NOT; the D114
protected-absence rhythm discount moved into F5's row); S4 E1 caudex (the
double-lock dissolves with D1 + the ~8.3-year tenure cadence pinned); S5 E10
contractile pin (3 consecutive ANCHORED 365-day windows — the accrual unit
killed it for every user); S6 the winter-maturity first bloom defers to the
next spring flush (winter-exempt — the 6-walk edge); S7 the same-day boundary:
the bank is evaluated AT BLOOM OPENING; S8 the C4 crown tiebreak:
EARLIEST-EARNED; the crown is DERIVED (the restore walk proved it re-sets
honestly — never stored in the backup); S9 the never-mature manifest fallback
(C12): pending adaptations manifest at the next spring regardless — never
pending forever; S10 the empty-spring rule (C11): the quiet-spring copy; S11 E9
protected-absence exclusion: planned returns are NOT revivals (the
vacation-heavy walk fired 16 false comebacks); "Back at It" (III-24) inherits
the exclusion; S12 the Coach-line cap (C10): Ring/Grove lines capped per bloom
event (the hoarder's 1,001-line flood); S13 the legend card computes its
numbers FROM the tree state (the veteran walk proved the template shipped
visible lies — every number wrong); S14 the backfill-trophy predicate (A6): the
isBackfill exclusion extends to trophy conditions — qualifying content fires
trophies only for IN-WINDOW days (the winter-bomber's one surviving vector
closes); S15 the E5 metric pin: attachment-mix (media attachments / total
attachments — not bytes, not words); S16 (recorded — the full S1–S16 list
lives in the ledger + SCHEMA 2.4). THE REGISTER FREEZES AT THE ENGINE CONTRACT
(D116 LANDS); until then SCHEMA 2.4 is the live authority and the dev tools
play every value.
Rationale: the paper run's 19 archetype walks bound every number with
evidence; the user verdicts and surgical fixes supersede the earlier records.
Rejected: the superseded values (20-day bars, the literal 365-day window, the
20-event ceiling, the resource-leg signature).
Revisit: the register freezes at the engine contract; re-calibration only via
the dev tools with new measured evidence.
Detail: docs/LifeTree.md §5, §6, §7; life-tree-design/SCHEMA.md 2.4 (register
amendments) + LOOPHOLES.md + paper-run/.

### D117 — The development handoff plan (locked; the clean step plan to launch AT M9)
The design chapter is COMPLETE (D085–D116 + the validated register); nothing
below gates the first engine line of code. A. PRE-M9 (opportunistic — any docs
pass / adjacent milestone): A1 THE DOCS-PASS AMENDMENT REGISTER — DecisionLog
entries for D085–D117 (INCLUDING THIS RECORD — the register is never complete
without itself); Gamification.md (anchor/six-domain/qualifyingEntry);
CoachSystem.md (anniversary = the shared anchor); Roadmap.md (M7/M9 premises +
the D060 supersession — the fitness-surface closure clause, gen-2 F-series
override); Database.md (formatVersion 3 + the logFingerprint + the isBackfill
column + adoptedAt + the event schema + the viewed_moments table — NOT
StorageDecision.md, which carries no format); UIUX.md (the tree tab + the
semantics contract); A3 THE OWNER CONTRACTS groundwork (qualifyingEntry with
M7, streak with M7, goalProgress with M5, coachEngagement with M8,
dayActivityScore with M6, mediaPresence with M10–M13); A4 the emotional
copy-language pass (dormancy copy, bank counter framing, empty-spring copy,
legend card). B. M9 PHASE 0 — THE ENGINE FOUNDATION: B1 THE RENDERER PERF SPIKE
(≤16ms at LOD-1/2 on the target device tier — the F9 gate; the LOD ladder,
instanced procedural leaves, the autumn leaf-fall re-bake + capped particles);
B2 THE STATE MODEL IMPLEMENTATION (the derived cache SCHEMA 2.6, the
logFingerprint, the atomic swap, the set-commutative fold, the single-writer
lock (D108/D109)); B3 THE DEV-TOOLS TUNING SURFACE (D105 — MUST exist before
any visual tuning); B4 THE DERIVATION ENGINE (the incremental protocol, the
axes F4–F7 with the D116 pins, the stage clock B1–B5 with the D116 values, the
banking + the tier schedule D092/D095/D096). C. M9 PHASES 1–2 — THE ORGANS
(trunk/rings renderer, branches/twigs/forks with the canopy rule, buds D087,
leaves with clusters + storage-leaf character, flowers + the banking, fruits +
spurs, periods). D. M9 PHASE 3 — THE VISUALS (the trait-space 17-audit →
archetype mockups from the 19 paper-run archetypes → flower/adaptation/seasonal
visuals + ceremony + the why-panel copy engine; the L-15 grid feed's placement
is decided here, D117 D1/D2). E. M9 PHASE 4 — NAVIGATION/FEEDS (the duality
principle). F. M9 PHASE 5 — ANATOMY VIEWS (root/stem/leaf cross-sections + the
time-lapse replay). G. M9 PHASE 6 — REVIEW MODE (yearly review artifacts).
THE STANDING GATES (throughout): H0 THE D-NUMBER COLLISION NOTE — the ledger
skill-install records D083/D084 collide with the DecisionLog's already-recorded
D083 — the docs pass RENUMBERS the ledger pair (D118/D119) to avoid duplicate
IDs; H1 THE SEEDED-DATA STRESS TESTS — the CODE version of the paper run: the
19 archetypes become the test fixtures; the tests must REPRODUCE the paper run
outcomes (the stage timings, the bank schedules, the honest no-rings, the
anti-farm defeats, the restore ratchet); H2 The perf gates (F9) as milestone
gates; H3 The coherence checks (the axis signatures + identity filters across
generated trees); H4 The deuteranopia + contrast passes (D111); H5 The test
strategy acceptance criteria (the paper run fixtures ARE the acceptance
criteria).
Rationale: the handoff is a clean step plan with standing gates; the docs-pass
amendment register (A1) is executed at this pass.
Rejected: shipping M9 before the engine foundation; a design chapter that gates
the first engine line.
Revisit: at each M9 phase boundary; the docs-pass amendment register (A1) is
executed at this pass.
Detail: docs/LifeTree.md §17, §18; life-tree-design/PLAN.md (living status
record) + paper-run/.

---

### D118 — Skill install: flutter-expert (accepted; canonical record — renumbered from ledger D083)
Installed into `.opencode/skills/` per the gen-2 ledger record (the same
install event the retroactive D083 entry records, 2026-08-29): flutter-expert
(jeffallan/claude-skills) for Riverpod/Bloc state + performance profiling on
the Life Tree engine. Security pass clean (3 audits + manual SKILL.md/reference
review + on-disk scan). The skills.sh "flutter/agent-plugins@flutter-
performance" entry was REJECTED (stale index — the repo tree was verified).
Rationale: the Life Tree's perf-critical rendering work needs Flutter-specialist
guidance; the SKILL-INSTALL SECURITY GATE (AGENTS.md) was satisfied.
Rejected: the skills.sh "flutter-performance" plugin entry (stale index); a
second D-number for the same install event.
Revisit: none; stays on the M3 gate review path with owasp-security.
Cross-reference: D083 records the combined retroactive install (flutter-expert +
security-and-hardening + security-threat-model); this D118 is the canonical
ledger-side record for the flutter-expert component after the D117 H0
renumber.

### D119 — Skill install: security suite (accepted; canonical record — renumbered from ledger D084)
Installed into `.opencode/skills/` per the gen-2 ledger record (the same
install event the retroactive D083 entry records, 2026-08-29): (a)
openai/skills@security-threat-model (official OpenAI, 25.3K-star, 4.9K
installs, all 3 audits pass) for the M3 OAuth gate + the Life Tree engine
build; (b) addyosmani/agent-skills@security-and-hardening (29.3K installs,
90.5K-star, all 3 audits pass) for Flutter Web/PWA hardening.
getsentry/skills@security-review REJECTED (Snyk audit FAIL on skills.sh).
Security pass documented (per-candidate audits, no prompt injection, on-disk
re-scan clean).
Rationale: the M3 OAuth/backup milestone and the Life Tree engine need
repo-grounded threat modeling + implementation-side hardening; the install gate
was satisfied per candidate.
Rejected: getsentry/skills@security-review (failed the Snyk audit); a second
D-number for the same install event.
Revisit: none; both skills stay on the M3 gate review path.
Cross-reference: D083 records the combined retroactive install; this D119 is
the canonical ledger-side record for the security-suite components after the
D117 H0 renumber.

---

### D120 — D060 fitness-surface override — gen-2 F-series supersession (accepted; amendment of a locked closure)
The gen-2 fitness mandate (user-approved F-series) SUPERSEDES the D060
fitness-surface closure FOR THE NAMED LOCKED CANDIDATES ONLY (ledger L004;
Stage C verdict #4, 2026-09-26). Specifically: Roadmap idea-park N3 (warm-up
sets → F-05) and N5 (recovery → F-19) are RE-OPENED by those locks explicitly —
the Roadmap.md:283-288 clause saying they remain park-able is amended at the
docs pass. EVERYTHING ELSE under D060's closure stays CLOSED — no feature is
touched unless the gen-2 ledger itself decided to change it. The D060 closed
list (workouts, sets, exercises, templates, plans, phases, PR, vault, PO,
cardio, volume, deload, injuries, adherence, goals, habits bridge, check-in,
phase report) remains the fitness build's scope; the gen-2 candidates
(F-01..F-32 etc.) are the user-approved extensions recorded in D121+.
Rationale: the user approved the gen-2 F-series candidates in the ledger; an
explicit override of the locked closure was required rather than a silent
amendment.
Rejected: amending D060 silently; re-opening the whole fitness surface beyond
the named candidates.
Revisit: only if real usage demonstrates a missing capability beyond the
F-series candidates.

---

### D121 — F-series family — DecisionLog records (accepted; one shared ID for the same-theme F-series rows that land here)
The gen-2 F-series fitness candidates (F-01..F-32) are locked in the ledger;
their feature/detail drafts land in UIUX.md, Roadmap.md M2, CoachSystem.md,
Database.md, Gamification.md, and Architecture.md at the docs pass. The three
F-series rows with a DecisionLog component are recorded here under ONE shared
ID (same-theme rows, per the C-approved decision-ID list):

**F-13 — Libra EMA trend + trend/rate/prediction layers (L020).** The body
weight-trend owner replaces the naive 7-day window with a gap-tolerant
time-indexed EMA: power = 1 − e^(−Δt/smoothingTime) (Δt = days since last
weigh-in; smoothingTime = 7 days default, tunable 5–14); trend_new =
trend_old + power × (weight − trend_old); NO fabrication, NO interpolation.
RATE = the slope over the last N trend points (default 30-day window);
PREDICTION = trend + rate × days-to-go rendered as a RANGE (F-15 decision b).
Layers separate derived numbers (trend ≠ rate ≠ prediction); the chart shows
raw points + the EMA line always. The EMA replaces rollingWindowMean FOR THE
BODY TREND ONLY — the engine keeps the shared windowed utility. Doc-amendment
flags (executed at the docs pass): Architecture.md:189/:268-270 and
Roadmap.md:361 "rollingWindowMean = the ONLY rolling-average math" amend to
"the ONLY windowed rolling-average util; the body trend owner uses the
time-indexed EMA (F-13)"; pace-owner consumers read the new rate layer; Roadmap
M1 J5 gains the long-horizon yearly weight page. Long-horizon note recorded: no
defined multi-month/year weight-trend view — a follow-on, not part of this
lock. EMA math verbatim-critical.

**F-18 — Strength score — IPF DOTS over the big-5 (L025).** DOTS = total ×
100 / (a + b·BW + c·BW² + d·BW³ + e·BW⁴ + f·BW⁵) — sex-specific public
polynomial coefficients on a 500-point scale, embedded FROM THE OFFICIAL SOURCE
at build (structure stored, not guessed coefficients). BOTH readouts: per-lift
normalized est-1RM (the Epley owner) + ONE summarized meta score (default
rollup: sum of normalized big-5; exact rollup open-at-build). VAULT-ONLY
display (the dashboard keeps the locked per-lift snapshot); the score is a
SUMMARY, never a substitute; derived-only, no XP, no shame. Formula structure
verbatim-critical, coefficients verified at write time. DOTS claims the
meta-score role — F-30's composite folds.

**F-19 — Training form — CTL/ATL/TSB (L026; N5 revival).** Readiness from
logged sessions only: session load = working sets × weight × reps
(effort-weighted); ATL = 7-day exp-weighted average; CTL = 28–42-day
exp-weighted average (default 42); FORM (TSB) = CTL − ATL; windows 7/42
default, tunable in advanced settings. DISPLAY = bands primary ("Fresh /
Building / Fatigued / Recovering") + number secondary + trend arrow always;
HONESTY LABEL mandatory ("Training Form (from your logged training)" — sleep/
life stress NOT measured; trend-reliable, not absolute truth); optional
self-reports fold in later; zero new logging; derived-only; no wearable; one
notification/day; quiet week wins; facts-only. N5-DEFERRAL AMENDMENTS (executed
at the docs pass): Roadmap idea-park N5 + CoachSystem.md:352-357 read "CLOSED
by F-19"; FUT-2 constraint (sleep/rest-day/readiness hardware-style tracking
stays OUT of F-19); the session-load unit + F-20's "~8 units/week" guardrail
get their unit DEFINED at the rule-book session. CTL/ATL/TSB verbatim-critical.

Rationale: the F-series is user-approved gen-2 scope; the DecisionLog records
carry the verbatim-critical numbers + the doc-amendment flags so the amendments
stay traceable.
Rejected: re-opening the D060 closure beyond the F-series candidates (see
D120); drafting F-21/F-22 (rejected) or F-25/F-26 (skipped) as decided scope.
Revisit: at M2 with the fitness build; each candidate's revisit is its own
target doc's.
Detail: docs/Roadmap.md M2, docs/Architecture.md (owner catalog),
docs/CoachSystem.md (rules), docs/Database.md (setType), docs/UIUX.md (session
UI).

### D122 — N-02 — Food-database tiering + the online exception + the seed decision (accepted; L041+L042)
The nutrition food lookup is a THREE-TIER DATA ARCHITECTURE: TIER 1 BUNDLED
CORE (FDC SR Legacy + Foundation + FNDDS generics + quality-flagged OFF top
products, brotli-compressed at build; instant local search, airplane-mode
complete; covers 80–90% of daily eating); TIER 2 GROWING LOCAL MIRROR (EVERY
food lookup — bundled hits AND online pass-through results — cached into the
local searchable mirror; ranked by frequency + recency; converges on the user's
actual diet); TIER 3 ONLINE PASS-THROUGH (full FDC + OFF API queries for the
long-tail; every tier-3 result cached into tier 2). SEARCH PRECEDENCE: local
mirror → bundled core → online pool; provenance badges label the tier (bundled
USDA / cached / online — VERBATIM-CRITICAL). NAMESPACE RULE: a custom row can
NEVER shadow a canonical row — canonical-first always. SEED SCOPE (confirmed):
~15k bundled — FDC full generics + quality-flagged top-5k OFF branded (~10–15
MB brotli). Seed numbers (15k, 10–15 MB) and the accumulation rule (every
lookup caches, frequency+recency ranking) are VERBATIM-CRITICAL.
THE ONLINE EXCEPTION CONTRACT (verbatim): food-database network exception —
read-only, TERM-ONLY queries (food names / EANs) to public databases (USDA
FDC, OpenFoodFacts) when connected; NO account, NO diary payloads, NO personal
data, NO query logging, NO writes; offline-first unchanged; tier-3 results
cache locally; the SOLE network exception in the nutrition domain; the security
gate checks against this contract. Plus: the data licensing note (FDC CC0 / OFF
ODbL attribution in-app) + the M3b micronutrients milestone (micros get their
own milestone M3b, after M3 before M4; data already CC0 + complete in FDC;
large GUI/UIX section; Cronometer has NO mobbin screens — dedicated mobbin pull
at activation).
Rationale: speed + airplane-mode + personalization without cloud dependency;
the single explicit network exception is bounded and auditable.
Rejected: a cloud food API as the primary path; unbounded network queries;
custom rows shadowing canonical rows.
Revisit: at M3/M3b with the food-lookup build; the security gate re-checks the
contract with any nutrition network code.
Detail: docs/Database.md (seed plan + tiering + mirror), docs/Roadmap.md (M3b
milestone), docs/UIUX.md (diary + badges).

### D123 — N-07 — Implied-TDEE insight (accepted; L047+L048)
THE THREE-LAYER ARCHITECTURE: L1 FORMULA SEED (locked M3): Mifflin-St Jeor RMR
× PAL — a guess (±200–500 kcal error; Mifflin unbiased at group level, right
default); L2 ROLLING-WEIGHT RECOMPUTE (locked M3): Mifflin re-run on the
current rolling weight (the F-13 EMA trend value), weekly — PAL's frozen error
stays inside; L3 IMPLIED-TDEE INSIGHT (M3+ per D5): solved from intake +
trended weight — cancels formula/PAL/activity/adaptation error (MacroFactor
median error ~108 kcal/100 days vs formula >500). THE PIVOT: a formula TDEE is
a guess; weight trend + intake is a measurement (Calories out = Calories in −
change in stored energy). THE MATH (the complete formula set is
VERBATIM-CRITICAL): L1 RMR_Mifflin = 10·W + 6.25·H − 5·A + 5 (men) / …−161
(women); TDEE_formula = RMR × PAL (PAL ∈ {1.2, 1.375, 1.55, 1.725, 1.9});
calorieTarget = TDEE + (rate × 7700)/7 (signed: bulk +0.25–0.5, cut −0.5,
maintain 0); L3 impliedTDEE ≈ avgLoggedKcal(7–14 d) − dTrendWeight × 7700/days;
worked examples recorded (surplus +0.2 kg/wk + 3,000 kcal/d → implied 2,780;
cut −0.5 kg/wk + 2,500 → 3,050).
GUARDRAIL CONSTANTS + THE B4 CONTRACT (all constants VERBATIM-CRITICAL):
trendWindow = 20 DAYS (D1 — the change-rate inference signal; NOT the 7-day
display EMA — display vs inference separate derived layers); completenessGate =
≥6 of 7 logged intake days else HOLD; weighInGate = ≥3 weigh-ins/wk else HOLD
(D3 — a FREQUENCY NUDGE + gate, not a change to the locked first-of-day
canonical rule); updateCap = ±250 kcal/wk ABSOLUTE CEILING with TWO-STEP HEDGE
(D2 — week 1 ~half, week 2 commits if the trend holds); symmetry = 7700 both
ways (D7 FIXED — inherits the fix for MacroFactor's V3 ~80 kcal/day asymmetric
drift bug); interpolation = linear gap interpolation on missing weigh-ins; HOLD
presentation (D6): "Insufficient data - holding." THE B4 CONTRACT: L3 is
SURFACED, NEVER AUTO-APPLIED (renders in the weekly check-up; the user adopts
only via the existing manual TDEE override); adaptation arc + phase entry copy
(cut entry: expect implied TDEE to drift ~10% lower; weeks 1–3 water phase, 3+
fat-dominated convergence); AGGRESSIVE-RATE WARNING (D4): rate × 7700/7 > ~30%
of TDEE (~1% BW/wk) warns; SCOPE SPLIT (D5): M3 ships L1+L2 + all
estimate-framing copy + the weigh-in policy nudge + adaptation lines + the
aggressive-rate warning; M3+ ships the L3 insight itself. The D1–D7 verdicts +
the B4 contract clarification are recorded here (ledger L048).
Rationale: honest energy math — the pivot turns intake + trended weight into
the measurement; guardrails keep the insight surfaced-only and safe.
Rejected: auto-applying L3; hiding the estimate-framing; the asymmetric-drift
bug.
Revisit: at M3 (L1+L2) and M3+ (L3 insight); the constants freeze at the engine
contract.
Detail: docs/Architecture.md (impliedTDEE owner), docs/CoachSystem.md (check-up
block), docs/Roadmap.md (M3+), docs/UIUX.md (check-up card).

### D124 — C-03 — Auto-context capture chips + weather-chip REJECTION (accepted; L077 + L078)
Entries auto-gain context facts of their day from PersonalOS's OWN event log
(no external services; location chip excepted): media of the day · workouts
logged · habit status · body/weigh-in · return-after-gap note · location
(explicit per-entry approval) · weather (REJECTED — below). CHIPS all accepted,
each individually toggleable in Settings; default OFF; rendering BOTH (chips
under the entry body + collapsible "Day context" line in the editor); capture
FROZEN at save BUT TOMBSTONE-AWARE (each chip references the source events;
deleted/revoked events → recompute honestly on view or mark the chip
"updated"); facts-only (never text content); isImported excluded; no XP; quiet
week does NOT disable chips (they're facts, not nudges). C-03 ships WITHOUT the
weather chip; the tombstone-aware chip rule is a docs-pass constraint.
**WEATHER CHIP — REJECTED (user; Stage C verdict, 2026-09-26).** The pending
sub-item (free API key vs free open-source project + local-calc fallback) is
REJECTED because a weather data dependency conflicts with offline-first (README
principle 2) + the no-new-dependencies rule (AGENTS.md): weather is the ONE
chip that needs an external data source to be accurate, and the user's
requirement is "super accurate regional weather" — which cannot be guaranteed
offline or dependency-free. RESTING PLACE: dead — do not resurrect without a
new use case.
Rationale: chips derive from owned, on-device data — free, private, offline;
the weather chip alone would break that boundary.
Rejected: the weather chip (dependency + offline-first violation); external
context services; chips from text content.
Revisit: chips at M1+ with the journal build; the weather chip only if a
genuinely offline, dependency-free accurate source ever appears (new use case
required).
Detail: Settings (chip toggles group), docs/Database.md (event-log consumers),
docs/MediaStorage.md (media chips), docs/Roadmap.md (journal M1+).

### D125 — C-08 — Wikilinks + unlinked-mention suggestions (accepted; L083 + L084)
WIKILINKS: `[[` in the composer → autocomplete of Life Areas + recent entries
→ link embedded; linked entries gain a backlinks pane ("linked from: N
entries"); tapping a link jumps to the entry; SETTING = clear toggle in
Settings, ON by default; NO graph visualization (decorative — against
philosophy); links export as `[[name]]` in Year Book — EXPORT RECONCILIATION
RULING: the Year Book is a rendered human PDF, raw `[[wiki]]` would be dead
text — the Year Book renders links as footnote-style reference lines (name +
date), lossless meaning preserved humanly; a Markdown export (if ever added)
keeps the raw `[[name]]` form; no text analysis — matching on names/areas/tags
only (facts-safe). JUNCTION TABLE DECISION (recorded here): the link store is a
junction table (sourceType, sourceId, targetType, targetId, linkType,
createdAt — one row per directed edge, per the D023 sketch shape), never a
blob/text parse at render time.
UNLINKED-MENTION SUGGESTIONS — REFER (user; Stage C verdict, 2026-09-26). The
pending sub-item (a derived pass over the shared J2 matcher — "you mentioned
'X' in N entries — link them?") is REFERRED: it stays in the sequencing notes;
it is a natural fit for the M8 rule-book session / Coach analysis pipeline when
the pass-over mechanism exists. PRIVACY-STAMP FLAG recorded: the detection
READS entry text to find known names — this is text access, not metadata
matching; per the per-feature privacy-stamp rule (CoachSystem.md), the
mention-suggestion carries the "needs text access → user opt-in first" stamp;
the feature is gated until the M2+ text opt-in exists, OR matching is restricted
to tags/areas/dates only at activation — a decision to make at build. The
wikilink half is unaffected by the privacy stamp (user-typed `[[`, no
scanning).
Rationale: links are user-typed and facts-safe; the mention suggestion needs
text access and is therefore gated/REFER'd.
Rejected: graph visualization; raw `[[wiki]]` in the Year Book PDF (ruled:
footnote-style lines); text-scanning without the opt-in stamp.
Revisit: wikilinks at M1+ with the journal build; mention suggestions at the M8
rule-book session (or when the M2+ text opt-in exists).
Detail: docs/UIUX.md (composer + backlinks pane), docs/Database.md (junction
table), the J2 matcher.

### D126 — engine-1 — Logging-friction discipline (accepted; L005)
For ALL M2 logging work: session is the cost, data is the payoff; default path
≤2 interactions per set; pre-filled weights (F-01), steppers not keypads,
pre-filled reps, auto-suggested set labels (F-05), checkbox rows + auto rest
timer (F-02), batch ops; a FRICTION BUDGET (every live-logging field removes
more friction than it adds; optional fields go post-session); minimal mode
(pure-checkmark view).
Rationale: the discipline keeps the M2 session screen fast without automating
away user control.
Rejected: any live-logging field that adds net friction.
Revisit: every time a new M2 logging field is proposed.
Detail: docs/UIUX.md (logging screen) + docs/Roadmap.md (M2); all future
logging candidates must pass this discipline.

### D127 — engine-2 — Coach heuristic engine discipline (accepted; APPROVE-as-record per Stage C; L006)
The Coach heuristic engine commits to: ~25 named rules by M2 (gen-1 locks +
F-08/F-09/F-10/F-11/F-12/F-19/F-20/F-23/F-24; the rejected pair F-21/F-22
excluded); ONE rule-execution architecture (event → rule catalog,
condition→action, strictness-parameterized) — never scattered conditionals; H3
single-owner vocabulary; graceful degradation; LLM = VOICE LAYER only
(render-never-decide), OFF by default, offline = complete product; a concrete
test plan (determinism/table-driven/boundary/fixture/provenance) locked at the
rule-book session.
Rationale: one engine, one rule-execution path, provable behavior; the LLM
never decides anything the heuristics can't explain.
Rejected: scattered conditionals; LLM-decided behavior; per-rule bespoke
architectures.
Revisit: at the M8 rule-book session (the ~25-rule catalog + the test plan lock
there; no rule content is drafted at this pass).
Detail: docs/Architecture.md (engine), docs/CoachSystem.md (rule catalog + test
plan at the rule-book session).

### D128 — N-09 — Barcode scanner approval (accepted; L050)
EAN lookup via the native Chrome BarcodeDetector API (offline, ~94% of Chrome,
dependency-free on Flutter web) + zxing-wasm fallback; lookup against a local
OFF/FDC mirror (see D122/N-02 when triaged); scan → match → verify → add. THE
DISTINCTION: the D069 do-not-build AI food scanner is the PHOTO-AI scanner
(meal estimation — stays rejected, evidence-backed: 1/3-calorie error +
cloud-bound); EAN barcode lookup is a DIFFERENT feature, never blocked, now
approved. On-device only; no cloud; no AI estimation; no new package needed on
web (verify at build).
Rationale: barcode lookup is deterministic, offline, and dependency-free — the
D069 rejection was specifically the photo-AI estimator, not the EAN path.
Rejected: the photo-AI food scanner (unchanged from D069); cloud estimation.
Revisit: at M3 with the food-lookup build (docs already anticipate it — the
`source` column enumerates `scanner`).
Detail: docs/Roadmap.md (M3), docs/Database.md (barcode lookup against the seed
data).

### D129 — N-17 — Diet-mode re-derivation — future-capability scoped now (accepted; record-only; L058)
The re-derivation RULE any diet mode would use: fix two macros, flex one (keto
= protein fixed + carb ceiling fixed → fat remainder; low-carb = protein fixed
+ fat floor → carbs flex within a cap); the architecture does not change; the
CONSTRAINT ORDER changes per mode. FEATURE IS FUTURE — recorded so the macro
derivation engine is BORN READY (constraint-order abstraction, never
hard-coded to bulk/cut/maintain; zero extra build cost). Net-carbs and similar
per-mode displays = FUTURE decision, gated by the honest-macros rule.
Rationale: the engine abstraction is free now and prevents a hard-coded rewrite
later.
Rejected: building any diet mode now; per-mode displays now.
Revisit: when new phase types / diet modes are actually proposed.
Detail: docs/Architecture.md (macro derivation engine abstraction),
docs/Roadmap.md (M3+).

### D130 — C-09 — Gentle return + pause (accepted; L085)
GENTLE RETURN — after any gap, NO "you missed N days" messaging; a warm return
card ("welcome back") with an optional fresh-start offer; applies everywhere
streaks/misses are discussed. PAUSE MODE — the user freezes streaks for a
known-away period; pause built into Settings (habits/coach group), MOSTLY OFF
BY DEFAULT; distinct from quiet week (silences nudges) and from grace
(forgives misses): pause FREEZES streaks without forgiving anything; repair
tokens REJECTED — keep grace simple. GUARD (audit finding): "Grace is the ONLY
finite streak shield — two shields would become one unlimited shield" — PAUSE
MUST BE BOUNDED (finite durations per pause, e.g. 1–14 days; a pause still
RECORDS the away period — freezes, never hides; scheduled absence, not
forgiveness); the Grace section wording amends at the docs pass to "grace +
bounded pause are the streak shields".
Rationale: recovery without shame; a bounded pause cannot become an unlimited
shield.
Rejected: repair tokens; unbounded pauses; hiding the away period.
Revisit: at M2 with the habit/streak build.
Detail: Settings (habits/coach group), docs/Gamification.md (grace family —
amendment flagged), docs/UIUX.md (empty/return states).

### D131 — Gen-2 rejected items — do-not-build batch (accepted; D069-style; one shared ID for the 8 rejection rows)
The following gen-2 candidates were REJECTED by the user and are recorded so
they are never re-proposed without a strong new use case (each carries its
original rationale in the ledger; RESTING PLACE: dead — do not resurrect
without a new use case):
- **F-21** — six-level check-in ladder (flexibility concern; the locked
  check-in surfaces already provide cadence; engine input stays inference-based,
  F-09).
- **F-22** — one-tap post-workout feedback (same category as F-21; the engine
  gets no user effort feedback; F-09 inference from logged weight×reps is the
  sole effort signal).
- **F-31** — gym profiles / equipment presets (F-23's adapt affordance covers
  the reactive path).
- **F-32** — movement-pattern replacement (mid-session swap stays manual via
  the F-02 anatomy; the no-equipment path inside F-23 is parked with this
  rejection noted).
- **L-04** — live finish estimate in the routine run and briefing card
  (Routinery pattern; the briefing's slot list may still show planned
  end-times; the live-updating estimate itself is rejected).
- **C-01** — quick check-in (Daylio 2-tap pattern; cheap tier closed).
- **C-02** — journaling suggestions (Apple Journal zero-LLM suggestion engine;
  cheap tier closed).
- **C-04** — mood as first-class + correlations (Daylio pattern; per-area mood
  fields inside C-07 remain possible — that is NOT this candidate; L-10's
  mood-proxy acceptance references this rejection).
Rationale: a recorded no keeps the design from revisiting settled ground; the
ledger holds the "why".
Rejected: resurrecting any listed item without a new use case.
Revisit: only if a genuinely new use case arrives (each is evaluated on its
merits then).

### D132 — Gen-2 skipped items (accepted; D070-style; one shared ID for the 7 skipped rows)
The following gen-2 candidates were SKIPPED for now (user) and are recorded
with their REVISIT triggers; NOT draftable as decided at this pass:
- **F-25** — weekly streaks + earned savers (GRACE V2 FITNESS; full design
  recorded; activation trigger = when M7 gamification planning begins; the
  plan-completion / minimum-one / hybrid decision is picked then; savers at
  activation: earned at 12-week marks, max 2, settings-tunable, forgive
  genuinely skipped weeks never rest days).
- **F-26** — skill-tree progression ladder (REP-MODE; activation trigger =
  when rep-mode exercise work starts, M2 build or later; the progression-edge
  table schema is NOT drafted at this pass — recorded for future).
- **C-07** — life areas v2 — supertags with fields + portals (activation
  trigger = M7 analytics work starts, or the Life Tree branch-detail design
  needs the data; needs a DecisionLog entry + clean design when pursued).
- **C-10** — year in pixels mosaic (revisit anytime; a natural Life Tree
  annual-ring visual if the tree design wants it — the tree design is
  D085–D117).
- **C-12** — prompt library (revisit when the Coach rule-book session plans
  prompt-driven nudges, or if blank-page friction shows up in real use; NO
  scraping — Grid Diary/Stoic/Reflectly prompts are copyrighted IP).
- **C-13** — ephemeral daily review ritual (revisit after J1 ships and the
  memory strip proves itself; GUARD at activation: the review-streak reward
  must be XP-free and non-farmable — the never-list forbids rewards for
  reading/opening — the reward is the streak itself).
- **C-14** — context-timed nudges — Coach scheduling layer (revisit at the
  Coach rule-book session, M8 planning; the scheduling principle is recorded
  there).
Rationale: idea-recorded, not scoped; each has a stated revisit condition
(D070-style).
Rejected: drafting these as decided scope at this pass.
Revisit: per each item's stated trigger.

---

### Open items — refactor audit anchors (D070-style; no D-number)
The gen-2 ledger's refactor-audit checklist anchors (audit-1..audit-13) are
open checklist items — `[ ]` unchecked, NO decision yet. They are recorded here
so they are not lost; audit findings become DECISIONS only when an audit
actually runs (INT-22). Anchors: audit-1 dashboard/shell (blocks, density,
glance-value; APP MAP item 3) · audit-2 journal (compose, timeline, search,
media; APP MAP 4) · audit-3 habits (check-off, streak, review; APP MAP 5 + 12 —
routine slots are habit-adjacent) · audit-4 gym (session, history, PR,
standards; APP MAP 10) · audit-5 nutrition (log, targets, macros; APP MAP 11) ·
audit-6 body/weight (weigh-in, trends, physique; APP MAP 10 — fitness AND body
both live here) · audit-7 media (capture, archive, vault) · audit-8 settings
(groups, reachability; APP MAP 6) · audit-9 achievements/rings surface (APP
MAP 9 + 15) · audit-10 coach lines/surfaces (APP MAP 15 + 16) · audit-11
incorporate list (user picks; APP MAP 13 goals) · audit-12 unlocks & extras
(the ledger's `_TO FILL_` placeholder carries NO content — nothing drafted) ·
audit-13 LIFE TREE DESIGN SYSTEM (the main-goal audit — the tree-7 session +
D117 effectively complete the goal; completion is marked when the
docs/LifeTree.md family lands). **COMPLETED 2026-09-26 (gen-2 docs pass):** the
docs/LifeTree.md family landed (all 19 sections per the StructuralImpactProposal
§2.1 outline); the main-goal audit is marked complete — this checklist item
closes (ledger L104).
Revisit: when each audit runs (refactor phase; post-M0 per the roadmap); D070
discipline applies.

### Open items — research leftovers (D038/D039 precedent; no D-number)
The 17 gen-2 research leftovers are recorded as open deferred items (framework
default for un-decisioned material; D038/D039 precedent) — NOTED, no lock, no
rejection; evidence stays in the research-* MASTER files:
RL-1 OCR search over attached photos (extends J2 to image text; needs a PWA
OCR path decision; revisit when J2 ships) · RL-2 regex-capable search (fold
into J2's matcher design if trivial) · RL-3 command palette Ctrl+P (UI/UX
ordering pass, M8) · RL-4 atlas/map view of entries (revisit at M6) · RL-5
multiple journals vs single timeline (design pole; the recorded direction —
single timeline + Life Areas — is context, not a lock) · RL-6 default-inbox +
triage (UI/UX ordering pass) · RL-7 one-entry-per-day constraint mode (revisit
if catch-up spirals show in real use) · RL-8 smart fill backfill (revisit with
habits/grace v2) · RL-9 goal/streak progress ring in editor (UI/UX ordering
pass) · RL-10 no-fail journaling (Coach rule-book session candidate, M8) ·
RL-11 optional focus gate (Coach rule-book session candidate, M8) · RL-12
privacy-first onboarding copy (welcome/onboarding polish, M0+) · RL-13
encrypted export archives (revisit at M10 Drive P2 planning) · RL-14 YAML
frontmatter on export (fold into J5 if wanted) · RL-15 quote-your-old-self /
transclusion (revisit if C-08 links ship) · RL-16 morning/evening ritual
rhythm (Coach rule-book session candidate with C-14, M8) · RL-17 research
anti-patterns (guardrail reference — paywall nagging, punishment loops,
cloud-only memory, training-on-content; cited as documented no-goes wherever
nudges, gamification, or AI are described in CoachSystem.md + Gamification.md
at the docs pass).
Revisit: per each item's stated condition.

---

**Docs-pass D-number assignments (summary for cross-doc citation):** D118 =
flutter-expert install (ledger D083) · D119 = security suite (ledger D084) ·
D120 = D060 override · D121 = F-series family (F-13/F-18/F-19 records) · D122 =
N-02 · D123 = N-07 · D124 = C-03 (incl. weather-chip rejection) · D125 = C-08
(incl. mention-suggestion REFER) · D126 = engine-1 · D127 = engine-2 · D128 =
N-09 · D129 = N-17 · D130 = C-09 · D131 = the 8-rejection do-not-build batch ·
D132 = the 7-skip record. Audits (audit-1..13) + research leftovers (RL-1..17)
carry NO D-number (DecisionLog open items, D070/D038/D039 precedent). All
other implied rows are assigned by their target doc's drafter per the
C-approved decision-ID list (one shared ID per same-theme rows).

**Register completeness — D133–D170 (assigned by the target docs' drafters at
this docs pass; recorded here so the register is complete and cross-doc
citations resolve):** D133 = Database.md `setType` column (F-05) · D134 =
Database.md pack model — batches/containers/line items (N-05) · D135 =
Database.md trivial-foods list (N-06) · D136 = Database.md receipt-line
substitution field (N-10) · D137 = Database.md gram-reference field (N-11) ·
D138 = Database.md veggie-tag + water source (N-16) · D139 = Database.md
parse-output fields (L-01) · D140 = Database.md day-pattern binding (L-13) —
the Database schema set lands as ONE versioned group (Database.md "Format v3 —
the tree-era schema set"); D141 is UNASSIGNED (deliberate gap, no row carries
it). D142 = UIUX.md tree-tab surface family (INT-01) · D143 = UIUX.md
identity-axis filters (INT-15) · D144 = UIUX.md dev-only tuning panel (INT-04)
· D145 = UIUX.md L-10 insight-line home (L069) · D146 = UIUX.md memory
hygiene / C-05 hide-controls (L080) · D147 = UIUX.md session anatomy / F-02
(L008) · D148 = UIUX.md plate + warm-up calculators / F-04 (L010) · D149 =
UIUX.md weekly-surface copy (INT-17) · D150 = UIUX.md habit-card duality /
bud's local view (INT-06). D151 = CoachSystem.md authority re-point (INT-16) ·
D152 = CoachSystem.md weekly-message template / F-24+F-30+L-10 · D153 =
CoachSystem.md rule-book-session locking anchor (engine-2/D127) · D154 =
CoachSystem.md volume-balance schema note (F-08/F-05). D155 = Gamification.md
F-27 adherence/schedule-run planning seed (L034) · D156 = Gamification.md
weight-ladder hero ring (F-15) · D157 = Gamification.md PR celebration (F-03) ·
D158 = Gamification.md goals-only 2-day slip (L-02). D159 = Architecture.md
impliedTDEE owner (N-07) · D160 = Architecture.md training-load owner (F-19) ·
D161 = Architecture.md rollingWindowMean/bodyTrendEMA amendment (F-13) · D162 =
Architecture.md engine disciplines (engine-2) · D163 = Architecture.md
event-schema notes. D164 = DesignSystem.md ceremony tokens (INT-07) · D165 =
DesignSystem.md Life Tree palette tokens (D085/D095/D112) · D166 =
DesignSystem.md LOD render & accessibility tokens (D111) · D167 =
DesignSystem.md duality tokens (INT-06/D088) · D168 = DesignSystem.md block
presentation rule (L-12). D169 = DevelopmentWorkflow.md sprawl guardrail
(L-11) · D170 = DevelopmentWorkflow.md dev-only tooling (INT-04/D105).

**Register completeness - D171-D224 (E-audit + C2 requeue rounds; assigned by the target docs' drafters, recorded here at the G-prep):**
D171 = Roadmap.md M2 engine family (F-09/F-10/F-11 + F-12/F-23, S019/S029) - D172 = Roadmap.md M3 nutrition family (N-04/N-15/N-18 + N-07 M3+, S040) - D173 = Roadmap.md M4 routine family (L-05/L-08/L-13, S045) - D174 = Roadmap.md M1 C-06 then-and-now compare.
D180 = UIUX.md session effort detail (F-09) - D181 = UIUX.md Nutrition Diary surface family (N-04/N-12/N-15) - D182 = UIUX.md gap-bar family (N-08/N-14) - D183 = UIUX.md estimate-framing explainer (N-13, S042) - D184 = UIUX.md Settings export (N-18) - D185 = UIUX.md day-view family (L-05/L-08).
D190 = CoachSystem.md fitness progression rules (F-10 TM adjustment + F-11 PO decay) - D191 = CoachSystem.md adherence-neutral compliance math (N-03) - D192 = CoachSystem.md macro-gap bar rules (N-04/N-08/N-14) - D193 = CoachSystem.md density facts (N-12) - D194 = CoachSystem.md estimate-framing copy (N-13) - D195 = CoachSystem.md plan-vs-actual adherence (L-05/L-08) - D196 = CoachSystem.md adapted sessions (F-23, S029).
D200 = Database.md PO freshness decay reads (F-11) - D201 = Database.md adherence-neutral compliance math schema (N-03).
D205 = MediaStorage.md then-and-now compare media half (C-06).
D210 = Architecture.md e1RM effort feed owner (F-09) - D211 = Architecture.md TM owner contract (F-10) - D212 = Architecture.md derived-number provenance contract (N-13).
D213 = CoachSystem.md meal-slot substitution adherence (N-10) - D216 = Roadmap.md one-time recipe substitution milestone (N-10) - D217 = Roadmap.md M5 natural-language capture + curated Today (L-01) - D218 = Roadmap.md M5 pace line (L-03).
D219 = UIUX.md NL-capture composer surface (L-01) - D220 = UIUX.md curated-Today briefing (L-01) - D221 = UIUX.md voice-note entry type surface (C-11).
D222 = MediaStorage.md voice-note media path (C-11) - D223 = MediaStorage.md audio-container rule (C-11) - D224 = MediaStorage.md voice-note storage tiers (C-11).
Deliberately unassigned: D141 (gap), D175-D179 (Roadmap range), D186-D189 (UIUX range), D197-D199 (CoachSystem range), D202-D204 (Database range), D206-D209 (MediaStorage range), D214-D215 (CoachSystem range).
(L-11) · D170 = DevelopmentWorkflow.md dev-only tooling (INT-04/D105).
