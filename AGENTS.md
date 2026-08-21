# AGENTS.md — PersonalOS

Private, single-user life-management app (journal + habits + goals + Coach).
Built by one developer with heavy AI assistance. Flutter Web / PWA.
Planned in docs/ — implementation NOT started.

## Orientation (mandatory first step)

- Read docs/README.md first: non-negotiable principles, document map, reading order.
- Read the doc for your task from the map below — do NOT dump-read all docs.
- Never reverse or assume a decision in docs/DecisionLog.md without reading its entry.
- Storage backend is LOCKED — Drift + SQLite (WASM), DecisionLog D040 (see
  docs/StorageDecision.md + docs/StorageSpikeStatus.md). Do not re-open the
  backend question without new measured evidence and a new DecisionLog entry.
- docs/StorageSpikeStatus.md is the historical record + regression reference
  for M0 repository work; it does not reopen the (locked) backend decision.

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
- Milestone retrospectives                   -> docs/Retrospectives.md

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
- After milestone phase tests are green, before reading the diff: dispatch
  the code-simplifier subagent (only files in the current diff; flutter
  analyze/test must stay green; review its diff yourself).
- After every milestone phase, write the docs/Retrospectives.md entry and
  encode at least one lesson into AGENTS.md or DecisionLog.

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

## Browser testing (Playwright MCP)

Use the playwright MCP tools (drive installed Chrome) for the browser
boundary only:
- PWA persistence gate (M0 exit criterion): flutter run -d web-server, drive
  the UI to create data, kill the browser, relaunch, assert the data is still
  there. A repeatable regression test, not a one-time ceremony.
- Export -> wipe -> restore round-trip through the actual UI.
- Probing the running app during development (navigate, click, fill,
  screenshot, console logs).
- Anything touching the service worker, PWA install flow, or storage
  persistence across browser restarts.

Do NOT use Playwright for:
- Widget-tree assertions: Flutter web renders to canvas; accessibility
  snapshots are near-empty. Use integration_test for widget logic.
- iPhone PWA verification: always manual; nothing automates it.
- Engines, repositories, unit tests: flutter test owns those.

Ownership: flutter test owns engines, integration_test owns widget logic,
Playwright owns the browser boundary.

## Drive MCP (dev tool — NOT the app's integration)

The drive MCP authenticates as your personal Google account with
drive.readonly + drive.file scopes (writes limited to files the MCP itself
creates). Dev-side only: the app's M3-M5 Drive sync ships in-app via OAuth +
Drive REST inside CloudMediaAdapter — never through this MCP.

Use it for:
- Live-testing the P2 backup upload/restore path against /PersonalOS-dev
  with real JSON backups.
- Inspecting the vault folder tree / metadata during P3 offload work
  (read-only; drive.readonly scope).
- Fixture management (drop test backups into /PersonalOS-dev for restore
  tests).

Rules (non-negotiable):
- The drive MCP may ONLY touch the /PersonalOS-dev test folder. Never any
  other Drive path, never a user's real folder.
- Credentials live in ~/.config/google-drive-mcp/ — never in the repo,
  never committed.
- The MCP uses its own OAuth client, separate from the app's future client.

## UI milestone skills (off by default)

frontend-design + impeccable live in .opencode/skills-off/ — NOT loaded.
Before a UI milestone (M0 dashboard, journal, habits screens): move the
needed folder(s) from skills-off/ into .opencode/skills/ and restart
opencode; move them back after the milestone. When a skill conflicts with
docs/UIUX.md, the doc wins — state that in the prompt.

## Definition of done (every task)

- flutter analyze clean, flutter test green
- No boundary violations; no storage assumption without DecisionLog entry
- docs/ updated if reality diverged; DecisionLog updated for new decisions
