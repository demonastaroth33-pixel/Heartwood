# PersonalOS — Development Workflow

Rules for developing PersonalOS as a solo developer heavily assisted by AI
coding tools. The architecture must stay understandable and maintainable by a
human — AI writes code, but the boundaries protect the design.

## Stack (locked at build start)

- Flutter (Web target; PWA on iPhone + Windows Chrome/Edge).
- State management: Riverpod.
- Storage: candidate per `StorageDecision.md` (locked at M0).
- Engines (Coach, Gamification): pure Dart functions, no I/O.
- No paid services, no subscriptions.

## Layer Boundaries (non-negotiable)

```
features/ (UI, Riverpod providers, widgets)
    → repositories/   ONLY way to touch storage
    → services/       media, coach, gamification, (drive later)
    → store           Drift/IndexedDB — never referenced outside data/
```

Rules for both human and AI code:

1. UI never queries storage directly — always through repositories.
2. Services never touch widgets; engines never touch repositories.
3. The Journal never touches media files directly — only via MediaRepository.
4. The event log is written through the single event API, transactionally with
   entity writes.
5. Schema changes go through the versioned migration list, never ad-hoc.
6. No "quick fixes" that cross a boundary — refactor properly or don't.

## Working With AI Assistants

- Give the AI the relevant docs (`docs/` is the contract) before asking for code.
- Ask for code at ONE layer at a time (e.g., "a repository for habits that
  matches Database.md", not "the whole app").
- Demand: no new dependencies without a `DecisionLog.md` entry; no comments
  unless requested; match existing file conventions.
- After every AI task: read the diff yourself. You are the maintainer.
- If an AI proposes architecture changes → it must be routed through this doc
  and `DecisionLog.md`, not adopted silently.

## Tests

Priority order:

1. **Engines** (Coach rules, XP/streak functions, analytics aggregations) —
   pure unit tests. Most value per effort.
2. **Repositories** — CRUD + migration behavior with in-memory store.
3. **Export/restore** — round-trip test (export → import → identical state).
4. **Dashboard widget test** — one smoke test per block.

Coverage bar: **core loop (journal CRUD, habits, event-log integrity,
export/restore round-trip) requires repository + integration coverage; engines
get full unit coverage; UI is dashboard smoke only; everything else best-effort**
(DecisionLog D022).

Command (standard Flutter): `flutter test`. No exotic test frameworks.

## Verification Checklist (before every commit)

- [ ] `flutter analyze` clean (warnings fixed, not suppressed)
- [ ] `flutter test` passes
- [ ] No boundary violations (repositories rule)
- [ ] Schema changes have a migration + DecisionLog entry
- [ ] Works offline (core loop) — spot-check after every milestone
- [ ] Export/restore round-trip still green
- [ ] No new dependency without approval + DecisionLog entry

## Commit Conventions

- Conventional Commits style: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`.
- One logical change per commit.
- Decision-affecting commits reference the `DecisionLog.md` entry.

## Milestone Discipline

- Work only on the current milestone (`Roadmap.md`).
- Each milestone ends with its exit criteria met — no exceptions.
- Between milestones: export a backup, run full tests, update docs/ if reality
  diverged from it, update `DecisionLog.md`.
