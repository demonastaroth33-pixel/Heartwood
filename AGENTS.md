# AGENTS.md — PersonalOS

Private, single-user life-management app (journal + habits + goals + Coach).
Built by one developer with heavy AI assistance. Flutter Web / PWA.
Planned in docs/ — implementation NOT started.

## Orientation (mandatory first step)

- Read docs/README.md first: non-negotiable principles, document map, reading order.
- Read the doc for your task from the map below — do NOT dump-read all docs.
- Never reverse or assume a decision in docs/DecisionLog.md without reading its entry.
- Storage backend is NOT decided — read docs/StorageDecision.md before any storage
  code; do not assume Drift, SQLite, or IndexedDB. Lock happens at M0, before M1.
- Before any storage-decision work (Drift vs IndexedDB), read
  docs/StorageSpikeStatus.md first for current metrics and open items.

## Doc-read map

- Journal, habits, check-ins, backup/export  -> docs/Database.md, docs/Architecture.md
- Media, storage limits, compression         -> docs/MediaStorage.md
- Coach rules, strictness, AI adapter        -> docs/CoachSystem.md
- Gamification (XP, streaks, anti-farming)   -> docs/Gamification.md
- Goals, tasks, milestones                   -> docs/Roadmap.md (M1+; not built)
- UI, navigation, dashboard blocks           -> docs/UIUX.md
- Milestones, what is/isn't built            -> docs/Roadmap.md
- Project philosophy, core loop              -> docs/Vision.md
- Any decision rationale                     -> docs/DecisionLog.md

## Layer boundaries (non-negotiable)

features/ (UI, Riverpod providers)
  -> repositories/   ONLY way to touch storage
  -> services/       media, coach, gamification engines
  -> store           NEVER referenced outside data/

- UI never queries storage directly — always through repositories.
- Services never touch widgets; engines never touch repositories.
- Journal never touches media files directly — only via MediaRepository.
- Event log written only through the single event API, transactionally with
  entity writes.
- Schema changes go through versioned migrations, never ad-hoc.
- No boundary-crossing "quick fixes."

## Code rules

- No new dependencies without a docs/DecisionLog.md entry and user approval.
- No comments unless the user asks.
- Match existing file conventions; work one layer at a time.
- After any change, read the full diff yourself.
- Security gate: before any commit touching auth, storage, or import/export,
  load the owasp-security skill, review the diff, and read its findings;
  then present them and get user approval before the commit goes through.
  Never commit those layers silently.
- Always use context7 (query-docs / resolve-library-id) for library/API docs
  or version-specific code examples — never answer from memory on drift,
  riverpod, drift_flutter, sqlite3, or Flutter APIs.

## Universal work rules (Karpathy)

1. THINK BEFORE CODING — state every assumption aloud. If a doc is ambiguous,
   present the interpretations and ask — never pick silently. If a simpler
   path exists, say so. Silent assumptions are the exact failure mode the
   DecisionLog exists to catch.
2. SIMPLICITY FIRST — minimum code that satisfies the doc: no features no one
   asked for, no speculative abstractions or "flexibility" flags, no error
   handling for impossible scenarios. If 200 lines could be 50, rewrite. Test:
   "would a senior engineer call this overcomplicated?"
3. SURGICAL CHANGES — every changed line must trace to the task. Don't improve
   adjacent code, comments, or formatting; match existing style even if you'd
   write it differently. Mention unrelated dead code, don't delete it; do clean
   up orphans your own change created.
4. GOAL-DRIVEN EXECUTION — turn tasks into verifiable goals: write the failing
   test first, then make it pass. For multi-step work, state `step -> verify`
   checks and don't claim done until each passes (flutter analyze / flutter
   test).

Tradeoff: these rules bias toward caution over speed — trivial fixes use
judgment.

## Commands

- flutter test       (engines, repositories, export/restore round-trip)
- flutter analyze    (must be clean before commit)

## Definition of done (every task)

- flutter analyze clean, flutter test green
- No boundary violations; no storage assumption without DecisionLog entry
- docs/ updated if reality diverged; DecisionLog updated for new decisions
