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
Revisit: at milestone start, post-M1 (see Roadmap.md Milestone 8).

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

### D071 — Life Tree idea — deferred M2, not a spec (accepted; idea-recorded)
The Life Tree is an idea-recorded user vision, NOT a locked spec: a dedicated
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
