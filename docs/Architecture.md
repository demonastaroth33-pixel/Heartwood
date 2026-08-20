# PersonalOS — Architecture

System design: event-first, layered, local-first. This is the core architectural
document. Storage backend specifics are decided in `StorageDecision.md`.

## Architecture Principles

1. **Event-first** — meaningful life actions are recorded as immutable behavior
   events; analytics, gamification, and future modules consume them.
2. **Local-first** — all reads and writes go to the local store; the UI never
   depends on the network. Cloud is backup, never a dependency.
3. **Simple over impressive** — no event bus, no streams, no projections in MVP.
   A single event table and pull-based aggregation is enough at personal scale.
4. **One write path** — every operation writes its entity and its event in a
   single transaction. Entities and events can never diverge.
5. **Platform parity** — phone and desktop builds must remain roughly equal
   (Requirements.md goal 7). A feature may be platform-exclusive only when
   blocked by something physically true (see Platform Parity guardrail below).

## System Diagram

```
┌─────────────── THE CORE LOOP ───────────────────────────────┐
│  Open Dashboard → Understand priorities → Execute → Record  │
│        → Reflect → Coach feedback → Improve tomorrow        │
└─────────────────────────────────────────────────────────────┘
                                 │ every meaningful step emits:
                                 ▼
┌──────────────────────────────────────────────────────────────┐
│              BEHAVIOR EVENT LOG  (append-only)              │
│  habit.completed · habit.missed · journal.created ·         │
│  task.completed · reflection.created · media.added ·        │
│  workout.completed · (future: study.session)                │
│  Event: { type, occurredAt, area?, entityRef, payload,      │
│           dayKey }  payload is versioned JSON               │
└──────────┬──────────────────────────────┬───────────────────┘
           │                              │
┌──────────▼──────────┐        ┌──────────▼───────────────────┐
│  ANALYTICS ENGINE   │        │  GAMIFICATION ENGINE        │
│  pure aggregations  │        │  pure rules → XP/streaks    │
│  over event window  │        │  reads events ONLY          │
└──────────┬──────────┘        └─────────────────────────────┘
           ▼
┌──────────────────────────────────────────────────────────────┐
│  COACH                                                      │
│  Rule Engine (strictness modes) → Reflection Generator      │
│  → optional AI Adapter (OFF by default)                     │
└──────────────────────────────────────────────────────────────┘
           │
┌──────────▼──────────────────────────────────────────────────┐
│  DATA LAYER                                                 │
│  Entities (journal, habits, goals, tasks) + LifeArea links  │
│  Local store → JSON Export/Restore → (P2/P3) Drive          │
└─────────────────────────────────────────────────────────────┘
```

## Event Model

The event log is the foundation everything else reads. Contract:

| Field | Type | Notes |
|---|---|---|
| `id` | string | unique |
| `type` | string | dotted, e.g. `habit.completed` |
| `occurredAt` | ISO-8601 | wall-clock time of the action |
| `dayKey` | `YYYY-MM-DD` | derived, for fast day aggregation |
| `area` | string? | LifeArea slug (see below) |
| `entityRef` | `{type, id}` | what the event refers to |
| `payload` | JSON | versioned per event type via `payloadVersion` |

**Seeded event types** (core + fitness/nutrition additions):

| Type | Payload (metadata only) | Notes |
|---|---|---|
| `habit.completed` / `habit.missed` | — | core |
| `journal.created` / `journal.edited` / `journal.deleted` | word count, tags, area | content lives in the entity |
| `task.completed` | — | core |
| `reflection.created` | — | core |
| `media.added` | — | core |
| `vlog.deleted` | — | tombstone; tier-aware vlog delete (C11.2) |
| `workout.completed` | exercise count, total sets/volume — never set detail | promoted from future to real type (L002) |
| `workout.pr` | exercise, new est-1RM, previous best, session ref; plus rolling bodyweight + ratio at PR time | Coach/toast ONLY — vault never reads it (L015, L049) |
| `workout.deleted` | — | tombstone; derived state re-derives (L048) |
| `habit.completed_revoked` | — | compensating revoke, transactional (L062) |
| `habit.rest_planned` | occurredAt = user-chosen day; writtenAt = device clock | per-habit one-tap rest flag only; streak FREEZE (L139) |
| `nutrition.logged` | mealType, kcal/macro totals, source, actual eat dateKey | no recipe detail; pack-consumes also emit (L097) |
| `nutrition.removed` | — | transactional revoke (L098) |
| `body.weighed` | — | per canonical first-of-day weigh-in (L097) |
| `body.weighed_revoked` | — | transactional revoke (L098) |

**Rules:**
- Events are immutable once written (edits create new events; corrections are
  new events with a `supersedes` reference).
- Journal content is never stored in events — only metadata (word count, tags,
  area). Content lives in the entity. This keeps the log cheap and the Coach
  informed without holding media or long text.
- **Midnight rule (L053):** `dayKey` is always the capture-time **local** date
  of the action. Under sync, `dayKey` is computed per device at capture time;
  LWW (below) resolves conflicting writes. Exception: nutrition backdating
  files under the **actual eat date**, not the capture date.
- **Tombstone rule (L044):** a delete ALWAYS wins over an earlier-timestamped
  edit arriving late from another device — an entity never resurrects if the
  incoming write's timestamp predates the tombstone. Applies to
  `workout.deleted`, habit revokes, and journal/nutrition/body deletes alike.
- **Cross-domain revoke pattern (L098):** deleting or correcting a row writes
  its compensating event **transactionally** with the row change: habit →
  `habit.completed_revoked`, journal → `journal.edited`/`journal.deleted`,
  nutrition → `nutrition.removed`, body → `body.weighed_revoked`. No
  per-set/per-slot/routine-noise events exist — `exercise_sets` and
  `routine_slot_logs` are entity-only. Cost is ~2k small rows/yr inside the
  ~10k/yr event budget; engines keep reading the log only.
- **PR/vault source-of-truth (L246, L031, L049):** the PR ladder and records
  vault are ALWAYS derived by walking sessions chronologically — never from
  `workout.pr` events. `workout.pr` exists for Coach/gamification/toast ONLY.
  When re-derivation removes a previously-awarded PR, the gamification engine
  writes a **negative-XP event**; PR XP never resurrects without a fresh real
  PR.
- **Vlog deletion symmetry (C11.2):** `vlog.deleted` is a tombstone event; a
  discarded or deleted vlog that previously earned duration-based trophies
  revokes them via the same negative-XP event symmetry as PR re-derivation.
- **Habits bridge (L062):** when a habit is auto-tracked
  (`autoSource: "workout"`, future `"weigh-in"`), saving a session
  auto-writes that day's habit check-in in the **same transaction**
  (`autoCreated`; manual entries win). Deleting the session cleans up its
  auto check-in and emits `habit.completed_revoked` in the same transaction.
- **Privacy stamp (L158 / S025):** every Coach/journal-reading feature is
  stamped per feature — "facts only" OR "needs text access → user opt-in
  first" (journal text analysis is opt-in, M2+). Coach never quotes journal
  text.
- **Goal progress is computed, never an event (L155):** `goal.progress` is
  retired; progress is computed only via one owner per goal kind
  (`goalProgress(goalId)`).
- Future modules plug in by emitting events through the single event API and
  tagging a LifeArea. No core redesign required.

## Life Areas

A universal, small abstraction so future systems (fitness, study, relationships,
projects) attach without schema changes.

- Seed set: `health`, `learning`, `career`, `relationships`, `projects`,
  `self_improvement`, `finance` (user-extendable later).
- Any entity or event may carry a nullable `area`.
- The Coach analyzes patterns per area (e.g., "Health consistency is declining").

## Modules

| Module | Reads | Writes | Status |
|---|---|---|---|
| Event Log | — | events (single API) | Core |
| Journal | — | entities + events + media refs | MVP |
| Habits | — | entities + events | MVP |
| Dashboard | entities + cached aggregates | — | MVP |
| Export/Restore | all | backup files | MVP |
| Goals/Tasks | — | entities + events | M1 |
| Workouts | — | entities + events | M1 |
| Nutrition | — | entities + events | M1 |
| Analytics Engine | event log | cached aggregates + owner catalog | M2 |
| Coach | analytics + events | coach output rows | M2 (stub in MVP) |
| Gamification | event log only | derived state | M2 |
| Records Vault | event log (derived) | — | M2 |
| Entity Sync | event log (append-only UNION) | sync service layer | before multi-device M1-phase |
| Drive backup/vault | — | backups + media | P2/P3 |

### Analytics Engine owner catalog

Every derived stat has exactly **one H3 owner function**; all views call it —
never re-implement the math, never a per-view hack. Rounding happens once,
inside the owner. There is no generic-aggregator meta-framework; each stat has
a named owner. The catalog below is the consolidated authority (C13.5 / S024):

| Owner | Responsibility |
|---|---|
| `rollingAvgWeight(dateKey)` | shared 7-day rolling bodyweight; thin-data guards inside |
| `deriveMacros(dateKey)` | THE day-target owner; collision detection (L084) |
| `adherenceWeek()` | weekly adherence; denominators count days WITH the slot |
| `strengthSnapshot(exerciseId, {asOf})` | canonical strength reader; record-mode aware (L247) |
| `dayActivityScore` | per-day activity score for calendar tint (L250) |
| `totalVolume` | tonnage: weight-mode sets only (L161) |
| `goalProgress(goalId)` | computed-only goal progress per goal kind (L155) |
| `paceVerdict(target, rollingTrend)` | ahead / on-track / behind verdict (L005, L006) |
| `sameMonthDay` | leap-day-safe month-day matcher (L149) |
| `dayDomainPresence` | six-domain presence check (L146) |
| `phaseStartWindow` | phase-start window check (L178) |
| `phaseAdjacency` | strict phase adjacency (L151) |
| `yearlyPass` | anchored-year window pass (L179) |
| `consecutiveYears` | consecutive anchored years (L179) |
| `anniversaryWindow` | ±7 days exact-day distance (L180) |
| `rollingWindowMean(series, windowDays)` | the ONLY rolling-average math in the engine (L145) |
| `est1RM` | the only Epley conversion; record-mode routing (L144) |
| `qualifyingEntry` | ONE qualifying-entry definition per domain (L187) |
| `robotOverlapWindow` / `runAlive` | robot-consistency run anchoring (L192, L208) |

### Day activity score

- **dayActivityScore (C9.4):** ONE H3 owner — workout/session logged = 3 (max
  1/day); meals = 1 each, CAP 3/day; daily weigh-in = 1 (max 1/day); journal
  entries = 1 each, CAP 2/day; habit completed = 0.5 each, UNCAPPED.
  `tintLevelFor(score)`: 0 = white, 1–2 = faint, 3–5 = medium, 6+ = strongest.
  The score has NO hard ceiling by design; it communicates VOLUME only —
  missed habits contribute 0, no negative/red state, and no glyphs, emojis,
  or numbers are rendered on the calendar grid (missed-habit warnings live in
  the Coach reflection, never the tint).

### Strength measurement & records

- **Formula constants (L007 / C1.4c):** strength standards are plain Dart
  pure functions with no package/network deps: Mifflin-St Jeor (BMR/TDEE),
  Wilks/DOTS, Epley (1RM). Public formulas, not licensed. Constants are
  **non-togglable** (Settings NOT-OFFERED, S062).
- **Every set logged (L020):** volume analytics need every set; est-1RM/PR
  use only the best set within the 1–12 rep guard. The guard is a validity
  window, **not** a settings toggle.
- **est1RM (L014, L144):** single Epley owner from the BEST working set (zero
  max attempts), shown alongside the raw top-set; PR = est-1RM beats the
  all-time best.
- **Record modes (L117):** weight-mode → Epley est-1RM within 1–12;
  rep-count mode → best clean rep count, no 12-cap, `addedLoadKg` breaks
  ties. `strengthSnapshot()` reports the mode; PR events carry the
  mode-appropriate value.
- **PR system (L015):** tracked-toggle; strictly-greater; ONE PR credit per
  exercise per session; `workout.pr` event → Coach + gamification (see Event
  Model for the source-of-truth rule).
- **Strength profile (L017):** est-1RM ÷ rolling bodyweight ratio; BIG-5
  seeded tier tables; others ratio-only; overall level = avg of big-5 ratios
  (Wilks-style). Fully derived, never stale; display-only.
- **Records vault (L031):** derived-only view — all-time est-1RM ladder per
  tracked exercise, PR history from session-walk re-derivation, milestone
  trophies, lifetime totals. Zero schema change.
- **Drill-down (L047):** "Your lifts" entry block + full screen
  (`buildExerciseDrilldown`): est-1RM curve, top-set trend, PR markers,
  deload/injury bands, ratio overlay. Pure read-path; zero schema.
- **Progressive-overload suggestion (L034):** per-exercise progression style
  (LINEAR-WEIGHT / REP-FIRST / BODYWEIGHT); conservative, deload-aware,
  suggestion-only, never XP; AUTO by default, override at every level +
  GLOBAL KILL-SWITCH in settings.

### Energy balance & macro derivation

- **Mifflin baseline (L023, L082):** Mifflin-St Jeor BMR (+5 male / −161
  female) × activity factor → TDEE. The activity factor is "non-training"
  only — training expenditure is DERIVED from logged sessions (cardio
  kcalBurned + MET; strength via tonnage/duration band) and ADDED SEPARATELY
  (NU9 double-count fix). 7700 kcal/kg is an honest estimate, non-togglable.
- **Sign convention (L086):** weekly rate is signed — minus = cut, plus =
  bulk. `calorieTarget = TDEE + (rate × 7700)/7`, rate additive, never
  inverted.
- **deriveMacros(dateKey) (L084, L078):** THE single day-target owner;
  returns kcalTarget = baseTarget + Σ(today's session burns),
  protein/fat/carbs remaining, and a collision flag when protein + fat grams
  exceed the kcal budget → UI "raise kcal or lower protein" (default: keep
  protein, drop fat to floor). No silent NaN/negative.
- **Protein per phase (L079):** 1) protein g/kg — cut 2.0 / bulk 1.8 /
  maintain 1.6 (editable, per-Area setting override); 2) fat floor ~0.6
  g/kg; 3) carbs as remainder. Atwater factors. Basis = rolling bodyweight.
- **No-phase fallback (L083):** no active phase → goals first (weight goal →
  its derived rate); no goal → "maintain" default (TDEE, protein 1.6, fat
  floor, carbs remainder). Targets stay elevated when phase absent.
- **Manual TDEE freeze (L087, L120):** a manual override FREEZES
  auto-recompute AND the protein/fat g/kg basis until cleared — no silent
  overwrite of a real measurement.
- **Strength burn (L088, L118, L131):** tight estimate band, always LABELED
  estimate; manual `kcalBurned` REPLACES the band entirely. Reviewed — no
  change; error absorbs over ~2 weeks.

### Rolling weight, thin data & pace

- **rollingWindowMean (L145, L038):** the only rolling-average math in the
  engine; serves phase pace, goal pace, ratios, trophies, weight-goal pace.
  7-day default, 14-day optional for pace.
- **Thin-data rule (L039 RESTATED):** with <7 weigh-ins the rolling average
  uses available days (min 1) and always carries "Adjusting"; NO
  verdict/projection/pace line from a single point.
- **Pace (L005, L006):** pace lives in the existing Coach pipeline —
  Analytics Engine computes → Rule Engine decides → Reflection Generator
  phrases. No new subsystem. Bulk/cut pace status = rolling 7–14 day weight
  average vs phase target weekly rate → ahead / on-track / behind.

### Fitness data entry

- **Auto-assort (L018):** rule-based loose-grammar paste parser; fuzzy match
  + "Did you mean?" confirm; inline create with muscle assignment; NEVER
  silent auto-create; offline, NO AI. M1-or-M2.
- **Last-time freshness tiers (L040):** <2wk full hint · 2–4wk quieted with
  date · >4wk collapsed AND PO suggestions pause (~90% of last-time starting
  baseline instead of +2.5kg extrapolation). Constants configurable in
  settings; no schema.

### Nutrition producers seam

- **Producers pattern (L077):** scanner/OCR, smart scale, and food-db lookup
  all print the SAME receipt row — kcal/macros + `source` column (one
  nullable hook). "Every input prints the same receipt line." Works offline
  forever.

### Shared search matcher

- **Simple matcher (L220):** one word/tag matcher implementation serves both
  journal search (J2) and video search (J7); H3 discipline — both call it.

## Data Flow

1. **Action:** user checks a habit → repository writes `habit_checkin` entity
   **and** `habit.completed` event, one transaction. The same one-write-path
   holds for sessions: saving a workout writes entities **and**
   `workout.completed`, and auto-writes any auto-tracked habit check-in in the
   same transaction (habits bridge, L062).
2. **Content:** journal text/media live in entities; the `journal.created` event
   carries metadata only.
3. **Engines:** pull model — analytics/gamification recompute on demand or via a
   per-day cache. No event bus in MVP. Personal scale (~10k events/year) makes
   day-keyed scans instant. Nutrition/body revoke events add ~2k small rows/yr
   inside that budget (L098).
4. **Coach:** analytics output + recent events → rules → reflection → dashboard
   note / weekly review. Privacy stamp applies per feature: "facts only" OR
   "needs text access → user opt-in first" (L158 / S025).
5. **Ownership:** export = versioned JSON snapshot (entities + events + media
   manifest) + media files. Restore = import snapshot + media.
6. **Migration discipline (C1.3):** schema additions are additive; the
   template/session layer copies rows at save time (copy, not link) — past
   sessions stay frozen, edits affect future only.
7. **Deletion semantics (L048, L044):** deleting a session writes a
   `workout.deleted` tombstone event; derived state re-derives (all-time best,
   last-time hints, volume/tonnage/adherence, auto habit check-ins, vault/PR
   ladder). The tombstone rule wins over late edits — entities never resurrect.

## Layering Rules

```
presentation (features/ UI)
    → repositories (per entity; ONLY way code touches the store)
    → services (media, drive, coach, gamification engines)
    → store (local DB; see StorageDecision.md)
```

- Repositories are the single data-access gate. UI and services never touch
  storage directly. This keeps AI-generated code safe and makes swapping the
  storage backend a contained change.
- Engines (Coach, Gamification) are pure functions over event/aggregate inputs —
  unit-testable, no I/O.
- **One owner per derived stat (L168, L244 / S066):** every derived
  statistic has exactly one owner function in the Analytics Engine; ALL views
  call it, never re-implement. A new aggregate is written once in the engine
  first, then consumed. Rounding happens once, inside the owner — no per-view
  hacks.

## Media Repository Abstraction

The Journal must never manage files directly.

```
Journal feature
    → MediaRepository (interface)
    → LocalMediaAdapter (MVP)
    → CloudMediaAdapter (future, Drive vault)
```

Future Google Drive integration replaces the adapter, not the Journal system.
Details in `MediaStorage.md` (including the LocalMediaAdapter's two backing
states: in-blob-storage vs archived-to-PC-filesystem).

### Cloud provider abstraction discipline (hard rule)

`CloudMediaAdapter` exposes only provider-agnostic operations:
`upload(file) → ref`, `download(ref) → file`, `delete(ref)`, `list(prefix)`.
Provider-specific concepts — OAuth flow, the provider's file/folder API shape,
provider-specific sharing semantics — must be fully contained inside the adapter
implementation and must never leak into Journal, Coach, or any other feature
code. **If any future code outside the adapter ever calls a provider-specific
method directly, that is an architecture violation: flag and fix it
immediately.** It breaks the "swap providers later = write one new adapter"
promise this abstraction exists to provide. (DecisionLog D034.)

## Platform Parity (PC-exclusivity guardrail)

A feature may only be PC-exclusive if it is blocked by **something physically
true** — e.g., a large file that literally only exists on that PC's disk —
never for implementation convenience. This protects the locked
"roughly equal phone/desktop experience" requirement (Requirements.md, goal 7)
from eroding as new features get added.

Currently, the **only** legitimately PC-exclusive feature is the vault browser's
access to PC-archived files (see `MediaStorage.md`, "Desktop Media UI"); on
phone builds that screen must not render, error, or appear at all. Everything
else must remain fully functional on both platforms. Any proposed phone-only or
PC-only feature must pass this test before it is scoped. (DecisionLog D035.)

## Settings, Not Profile

No identity/profile module. A minimal `settings` table holds only what the app
needs to function: timezone, display name (for greetings), coach strictness mode.
The Coach understands the user through behavior history, goals, habits, journal
entries, events, and patterns — never through a maintained profile.

Fitness/nutrition inputs are settings keys, not profile fields (D003): Mifflin
inputs (height, age, sex, activity factor) drive the auto-estimate, and a
manual TDEE override freezes auto-recompute AND the protein/fat g/kg basis
until the user clears it (L026, L087, L120). Formula constants — Epley 1RM,
Mifflin-St Jeor, Wilks/DOTS, 7700 kcal/kg — are non-togglable (L007, L020,
L023; Settings NOT-OFFERED, S062).

## Proposed File Structure (for build time)

```
lib/
  core/            theme, routing, constants, LifeArea seed list
  data/
    database/      schema + migrations (single source of truth)
    models/        domain models
    repositories/  per-entity repositories (only DB access path)
  services/
    media/         media_repository, local_media_adapter,
                   cloud_media_adapter (interface + future)
    drive/         OAuth, vault upload, backup upload (P2/P3)
    coach/         analytics, rule engine, reflection generator, ai adapter
    gamification/  XP, levels, streaks, achievements (pure functions)
  features/
    dashboard/  journal/  habits/  goals/  coach/  tasks/  settings/
  widgets/         shared UI
test/              mirrors lib/ (engines first)
docs/              this documentation set
```

## Storage Backend

OPEN — deferred to the M0 spike. See `StorageDecision.md`. Candidates:
A) Drift + SQLite (WASM), B) IndexedDB document store. Must be locked before M1.

## Offline Strategy

- All core operations (journal create/edit, habit check-off, dashboard viewing,
  export/restore) work with zero network.
- Cloud layers are only ever added on top; they must fail safe when offline.
- Sync (when it exists) is queue-based and best-effort: uploads happen while the
  app is open. iOS PWAs cannot upload in the background — accepted constraint.

### Entity-sync plane (L043, L044, L096 / C12.1 / S010)

A general entity-sync service layer is **required before any multi-device
M1-phase** (phone ↔ PC, plain-text/stat entity data). It does **not** change
the storage backend decision (D007 stays pending M0 Session C). Mechanism
(D019):

- Event log = append-only **UNION of distinct event ids** — no merge needed.
- Same-entity edits = last-writer-wins by timestamp; `deviceId` breaks exact
  ties.
- TOMBSTONE rule: a delete ALWAYS wins over an earlier-timestamped edit
  arriving late from another device; the entity never resurrects.

Everything else in the design assumes one-writer-per-device and stays valid
unchanged (S012).
