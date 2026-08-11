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
│  goal.progress · task.completed · reflection.created ·      │
│  media.added · (future: workout.completed, study.session)   │
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

**Rules:**
- Events are immutable once written (edits create new events; corrections are
  new events with a `supersedes` reference).
- Journal content is never stored in events — only metadata (word count, tags,
  area). Content lives in the entity. This keeps the log cheap and the Coach
  informed without holding media or long text.
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
| Analytics Engine | event log | cached aggregates | M2 |
| Coach | analytics + events | coach output rows | M2 (stub in MVP) |
| Gamification | event log only | derived state | M2 |
| Drive backup/vault | — | backups + media | P2/P3 |

## Data Flow

1. **Action:** user checks a habit → repository writes `habit_checkin` entity
   **and** `habit.completed` event, one transaction.
2. **Content:** journal text/media live in entities; the `journal.created` event
   carries metadata only.
3. **Engines:** pull model — analytics/gamification recompute on demand or via a
   per-day cache. No event bus in MVP. Personal scale (~10k events/year) makes
   day-keyed scans instant.
4. **Coach:** analytics output + recent events → rules → reflection → dashboard
   note / weekly review.
5. **Ownership:** export = versioned JSON snapshot (entities + events + media
   manifest) + media files. Restore = import snapshot + media.

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
