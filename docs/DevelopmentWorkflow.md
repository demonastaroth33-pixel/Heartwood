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
    → store           Drift (SQLite WASM) — never referenced outside data/
```

Rules for both human and AI code:

1. UI never queries storage directly — always through repositories.
2. Services never touch widgets; engines never touch repositories.
3. The Journal never touches media files directly — only via MediaRepository.
4. The event log is written through the single event API, transactionally with
   entity writes.
5. Schema changes go through the versioned migration list, never ad-hoc.
6. No "quick fixes" that cross a boundary — refactor properly or don't.

## Sprawl Guardrail (D169)

A standing guardrail, not a feature (gen-2 ledger L070 / L-11, LOCKED;
docs-pass D169; gen-2 sequencing note S052): every proposed feature must pass
"does it earn its place in the surface?" before it locks — for human and AI
proposals alike, sitting alongside the Layer Boundaries above. The three
checks (verbatim-accepted):

1. **SURFACE-WORTHINESS** — does the feature earn its place in the surface?
2. **SCHEMA DISCIPLINE** — additive (a column/table where one exists) vs a
   new unbounded entity; prefer the additive shape.
3. **SPRAWL TEST** — if every future feature of this kind shipped, would the
   app survive? If the surface collapses under its own weight, the feature
   does not lock.

Recorded in the ledger's House rules; carried to this doc at the gen-2 docs
pass. There is no separate "sprawl" feature — the guardrail is the process.

## Working With AI Assistants

- Give the AI the relevant docs (`docs/` is the contract) before asking for code.
- Ask for code at ONE layer at a time (e.g., "a repository for habits that
  matches Database.md", not "the whole app").
- Demand: no new dependencies without a `DecisionLog.md` entry; no comments
  unless requested; match existing file conventions.
- After every AI task: read the diff yourself. You are the maintainer.
- If an AI proposes architecture changes → it must be routed through this doc
  and `DecisionLog.md`, not adopted silently.
- Every decision gets a `(LOCKED, user yes)` + a D-number written into
  `docs/DecisionLog.md`; no silent assumptions — state them, get a yes (gen-2
  sequencing note S001).
- Divergence discovered while building: DecisionLog entry first, then docs —
  never an ad-hoc edit (gen-2 sequencing note S002).
- Research anti-patterns are documented no-goes wherever nudges, gamification,
  or AI are described: paywall nagging, punishment loops, cloud-only memory,
  training on content (RL-17; DecisionLog open items — cite, never build).

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

## Dev-Only Tooling (build-time only, never shipped) (D170)

Build-time tools exist to develop and visually test the product — they are
development surfaces, never user surfaces. The Life Tree's dev-tools tuning
surface is the standing example (D105; docs-pass D170; gen-2 sequencing note
S093): a dev-only debug panel that plays every threshold-register value and
the blush palette tokens, driving a live re-derivation + re-render; the
archetype mockups and the perf gate use it, and the register's
resource-normalization ceiling is calibrated with it at the paper-run step.
It MUST exist before any visual tuning (D117 B3) and is NEVER shipped to
users. Every dev-only tool follows the same rule: documented as build-time,
excluded from the shipped product.

## Sequencing notes from TEMP-PLANNING.md integration

_Folded verbatim from the standalone docs/IntegrationSequencingNotes.md (Stage A3 - Sequencer); at Stage C (2026-08-20) it was resolved to append here as a section, and the standalone file stops being an artifact. Headings are demoted one level to fit this document._

### Integration Sequencing Notes — Stage A3 (Sequencer)

- **Stage:** A3 — Process/Sequencing Extraction (Sequencer, Track 3)
- **Date:** Wed Aug 19 2026
- **Inputs (read in full, contiguous):** docs/IntegrationLedger.md (284 rows, L001–L284, lines 1–467) · docs/IntegrationIDCensus.md (375 enumerated rows, lines 1–805) · docs/IntegrationIntentBrief.md (lines 1–177) · TEMP-PLANNING.md (repo root, 2,671 lines, read in four contiguous chunks: 1–850, 851–1600, 1601–2300, 2301–2671) · docs/README.md (74 lines)
- **Purpose:** extract every HOW/WHEN instruction in TEMP-PLANNING.md — process prescriptions, ordering constraints, milestone gates, build order, dependency order, phase transitions, verification cadences, and timing/sequencing language. Each note is reconciled against the ledger (exact row IDs cited); unbound (orphan) notes are flagged. Identification only — no decisions, no fixes, no edits to any source doc.
- **Standing rule honored:** TEMP-PLANNING 817–826 — the ledger stays the single source of the target state; docs get rewritten to match it, never vice versa. ALL changes pending final user approval (TEMP 3–5, 789).
- **Placement note (per stage instruction):** this file is NOT drafted into product docs. Whether it is appended to DevelopmentWorkflow.md as a "sequencing notes from TEMP-PLANNING.md integration" section or kept as its own file is a human decision at Stage C. Extraction is complete either way.
- **For Stage B1:** consume the Applies-to column directly — every note carries a ledger row ID, an intent-brief ID, or an explicit Stage C "verify" flag. This file is the implementer's WHEN/HOW reference only; do not draft its prose into Database.md / CoachSystem.md / UIUX.md / Roadmap.md etc.

---

### 1. Sequencing notes

#### A. Master process gates (apply to ALL rows)

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S001 | Design-lock gate: NOTHING in TEMP-PLANNING is locked or applied to docs/ until the user says yes; ALL changes are pending final user approval before any docs/ write; D040 is the next DecisionLog number when formally decided. **Gate OPENED at Stage C (2026-08-20); next DecisionLog number after the D041–D076 batch is D077.** **Integration pipeline CLOSED 2026-08-20 (Stage G): the TEMP-PLANNING census gate cleared (L050/I4 resolved in CoachSystem.md §Pace nudges (I4)) and the no-holes gate cleared; TEMP-PLANNING.md and the pipeline artifacts are archived in `audits/`; docs/ are now the source of truth. GATE CLOSED 2026-08-21: the user's final approval was granted and recorded as DecisionLog D077 — the design is locked and Milestone 0 may begin.** | ALL ledger rows (L001–L284); intent brief C13.1 | User final approval (single global gate) — GRANTED 2026-08-21 (D077) | 3–5, 789 |
| S002 | Ledger-first workflow: FIRST fully finish the ledger — every design decision locked and satisfactory; ONLY THEN adapt ALL existing architecture docs (Architecture, Database, Requirements, Roadmap, DecisionLog, CoachSystem, Gamification, MediaStorage, UIUX) to fit; the ledger stays the single source of the target state; docs get rewritten to match it, never vice versa. Nothing in the audit section edits docs — it only collects proposals for the later adaptation pass. | ALL ledger rows; intent brief C13.1, 2.3 (removals) | Ledger complete + user approval (S001); then docs-adaptation pass | 815–827 |
| S003 | No new inventions during the docs pass; if reality diverges from the ledger, the ledger gets a NEW lock entry FIRST — nothing is edited ad hoc. | L177 (DOCS-PASS rules), L281 (label-qualification rule), L248; intent brief C13.1 | Docs pass; any detected divergence | 1006–1007 |
| S004 | Features list is CLOSED for the fitness side (workouts, sets, exercises, templates, plans, phases, PR, vault, PO, cardio, volume, deload, injuries, adherence, goals, habits bridge, check-in, phase report; media deferred); add new features ONLY when real usage says so. N3/N5/N6/N8 and periodization stay park-able; rest-day patterns (F2) + recovery readiness (N5) cover rest for M3+. | L248 (binds L058, L060, L061, L064, L067, L274) | Real-usage evidence justifying an addition (no automatic re-open) | 527–532 |

#### B. Build order & milestone timing

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S005 | Priority order (user): workout side (incl. phases) FIRST, macros after. | L010 (sequencing note row) | M1 feature-build ordering | 281 |
| S006 | Auto-assort paste parser timing: M1-or-M2. Item 20's LOCKED variant supersedes item 10's scoping but keeps the timing; rule-based, NO AI, offline; general NLP stays out. | L018 (folds items 10 + 20) | M1-or-M2 build window | 274–278, 316–320 |
| S007 | Manual structured entry ships for M1; journal free-text parsing explicitly deferred (real NLP; "AI optional, never required" per D004). | L008 | M1 scope; NLP re-visit only on user request | 31–32 |
| S008 | Item 26 (phase rate ↔ macros feedback) final shape DEFERRED to the NUTRITION session — "auto-recomputes" stays, but the final shape lands in NU6 + AUDIT CLOSURE (1). | L024 (deferred row), L078, L086 | Resolved already (nutrition session locked NU8–NU Abstract) | 343–346, 608–618 |
| S009 | Daily-routine template design DELAYED by user decision: a separate design session AFTER the nutrition section is fully closed, NOT folded into nutrition now. | L075 (NU4 pre-filler NU-open), L228; intent brief C8.1 | Nutrition section fully closed, then routine session | 605–607 |
| S010 | Entity-sync plane is a REAL milestone ("connection first", not a wording tweak): a sync service layer is documented as REQUIRED before shipping multi-device M1-phase; it does NOT change the storage backend decision (D007 stays pending M0 Session C). | L043, L044, L096, L157, L191, L224; intent brief G4/C12.1 | Before multi-device M1-phase; storage decision independent at M0 Session C | 92–113 (esp. 107–110) |
| S011 | ROADMAP ORDERING (clash #5 — user picked A): the FULL data-sync plane is a NEW milestone that goes BEFORE the old P2.5 photo sync; P2.5 does not vanish — it shrinks to "big media blobs only" (plain-data sync first, media sync after); Roadmap M4 P2.5 claim is replaced during the docs pass; same D019 mechanism for both. | L157, L096, L043; intent brief C12.1 | Roadmap restructure approved → milestone order (sync plane → P2.5) | 114–120 |
| S012 | One-writer-per-device base assumption preserved: the sync plane is a first-milestone addition (Roadmap restructure WHEN approved); everything ELSE in the ledger assumes one-writer-per-device and remains valid — no row is retroactively re-derived because sync exists. | L043 (process note), L096, L191 | When Roadmap restructure is approved; unchanged for all other rows | 111–113 |
| S013 | M1 GOALS → goals.kind (generic \| weight \| strength) + nullable exerciseId/targetValue FROM THE START (M1 goals build); additive columns now = no forced migration on years-old data later. STRONGLY recommended. | L162, L025, L027 | M1 goals build (first build of the goals schema) | 831–835 |
| S014 | M1 GOALS → PROGRESS OWNER (clash #2): goal progress COMPUTED ONLY via one H3 owner per goal kind; write-path `goal.progress` event RETIRED; Database.md event list + Roadmap M1 ("progress events flow to the event log") adjusted DURING THE DOCS PASS. | L155; intent brief C3.2 (REMOVAL) | Docs pass (design-adaptation phase) — immediate once S002 gate opens | 836–845 |
| S015 | M2 COACH RULE BOOK — separate dedicated session: scheduled AFTER all features are planned and BEFORE the UI/UX ordering pass (Coach surfaces affect layout); not to be compressed or rushed into the current feature sweep; carry-over locks enumerated (facts-only speech, achievements loudness tiers, J4 respect, no-shame, reviews-give-no-XP, auto-written+deletable outputs, on-open never push, no-human-judgment voice); session also fixes the voice-rule wording. | L171; Coach map §9; intent brief 2.4 | Features planned → rule-book session → UI/UX ordering pass | 923–933, 2589–2597 |
| S016 | UI/UX ORDERING SET ASIDE: navigation bar + layout ordering DEFERRED to the END of the design process — after ALL features are planned; do not re-open dashboard ordering or nav charts now; revisit last. | L170 | After all features planned (and after the rule-book session per S015) | 918–922 |
| S017 | M2 fitness/nutrition Coach rule catalog: written as ONE list at M2 (pending, not built); already merged into the one surface (A4). | L190 | M2 | 1573–1576 |
| S018 | MILESTONE-LEVEL (not feature-level): the O6-A2 entity-sync plane is a REQUIRED new milestone (Roadmap restructure, pending approval); weekly-review-day config, milestone-review cadence, and "reviews: tiny XP or no XP" are M2-time items. | L191, L255, L172/L173 | M2 for the config items; sync milestone on Roadmap restructure | 1783–1786 |
| S019 | Milestone-review card timing: appears ONLY at goal end — after user-declared goal.completed (won) OR deadline expiry without completion (expired); NEVER mid-run. Reviews NEVER give XP (weekly small-XP line struck from Gamification.md in the docs pass). | L172, L173 | Goal-end event (won or expired) | 934–949 |
| S020 | Milestone review cadence + delivery: default ladder off the first-journal-entry anchor (+1m/+3m/+6m/+1y then yearly), editable in Settings Group 2; smart catch-up — if the anniversary passes while away, the review is generated the FIRST time the app opens after the due date; one-tap, once only, no overdue nag (mirrors C1 catch-up); milestone already generated for that date → never re-mint (idempotent). | L264; Coach map §4 | Due date passes → first app open after; idempotency on re-render | 1978–2026 (1990–1996, 2024–2026) |
<!-- REMOVES-existing (gen-1 S021 row — superseded by D117; Stage C REMOVES-existing sign-off APPROVED 2026-09-26): the gen-1 M2-bound Life Tree sequencing note ("LIFE TREE: full implementation and all functionality designed and built DURING the Life Tree section build, M2; mockup in the UI/UX pass; Scope: M2 — BLOCKS NOTHING in M0/M1", bound to the gen-1 ledger row L269, source lines 2630–2652) is REMOVED. Superseded by D117 — the Life Tree design launches AT M9, not M2, via D117's phase plan (A pre-M9 amendment register → B phase-0 engine foundation → C organs → D visuals → E navigation/feeds → F anatomy views → G review mode; standing gates H0–H5). See Roadmap.md "Milestone 9 — Life Tree" and docs/LifeTree.md §17 (Development handoff and implementation plan). The sequencing-notes block stays as archived history; this row's dead content is not kept inline. -->
| S022 | M2 DASHBOARD BLOCKING ORDER: the order ONLY controls home-screen card paint sequencing ON OPEN; every feature screen renders itself instantly and never waits on this list; heavier derived blocks (strength snapshot, weekly review) render after a skeleton shimmer and NEVER block first paint. | L169 | On dashboard open (M2) | 907–917 |

#### C. Docs-pass timing (design-adaptation phase — "immediate" once S002 gate opens)

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S023 | coach_outputs.kind DICTIONARY: the full kind set MUST be enumerated during the docs pass as a single dictionary (kind + payload shape each): daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert. Documentation-only — no schema change; kinds stay finite. | L156; intent brief C13.4/C4.3 | Docs pass | 846–854 |
| S024 | M2 ANALYTICS owner catalog: the full consolidated owner-function catalog (rollingAvgWeight, deriveMacros, adherenceWeek, strengthSnapshot, dayActivityScore, totalVolume, goalProgress(goalId) + every M2/trophy owner) is emitted in the Analytics Engine spec DURING THE DOCS PASS and is the authority there; seed list = no generic-aggregator meta-framework. | L165; intent brief C13.5/Track 2 item 5 | Docs pass | 855–871 |
| S025 | Journal text privacy stamp (clash #6): every Coach/journal-reading feature gets stamped during the docs pass — "facts only" OR "needs text access → user opt-in first"; milestone review + all cadence lines are FACTS ONLY; stamp bears in Architecture.md + CoachSystem.md. | L158; Coach map §7 (L279) | Docs pass | 1768–1776, 2568–2574 |
| S026 | Dashboard "Today" fusion (clash #1): MVP block order stays EXCEPT the briefing card fuses with habit ticks + journal quick-capture into ONE "Today" section at top; below, everything else keeps old order verbatim; UIUX.md block list merge during the docs pass; no new schema (pure layout). | L154; intent brief C9.1 | Docs pass | 2323–2331 |
| S027 | Naming adaptation: week_plan_slots gains dayTemplateId (NOT workoutTemplateId) reflecting the re-purposed routine binder (audit-B5); carried into the schema block during the docs pass. | L121, L036, L114; intent brief C8.2 | Docs pass | 786, 254–256, 2302–2305 |

#### D. Feature WHEN-conditions, behavioral gates & verification cadences

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S028 | Two-a-day done rule: a plan slot counts DONE if ANY session references it; freeform sessions = "done differently" (item 30); PR per exercise per session already safe; volume/tonnage sum naturally. | L045 | Per-session logging (multi-session days) | 121–125 |
| S029 | Deletion semantics: deleting/editing a session writes a workout.deleted tombstone event; DERIVED STATE RE-DERIVES (per-exercise all-time best, O4 last-time hints, volume/tonnage/adherence aggregates, N7 auto habit check-ins, vault/PR ladder re-render). Best is derived, so delete is safe; cheap at personal scale. | L048, L246 | On session delete/edit | 147–152, 500–516 |
| S030 | PR/vault source-of-truth unification: PR ladder / vault timeline / milestone history = ALWAYS DERIVED by walking sessions chronologically; workout.pr events exist for Coach/gamification/realtime toast ONLY — never the truth for vault or achievements; editing or deleting sessions simply re-derives everything (no event surgery, no stale PR). XP SYMMETRY: when re-derivation removes a previously-fired PR-XP, the gamification engine writes a NEGATIVE XP EVENT (S13-014, analogous to habit.completed_revoked); PR XP never resurrects without a fresh real PR. | L246, L015, L031, L049, L175; intent brief C1.4 | Every session set edit/delete (re-derivation) | 500–516 |
| S031 | Sync conflict ordering (D019 + tombstone): event log = append-only UNION of distinct event ids (no merge needed); same-entity edits = LWW per entity by timestamp, deviceId breaks exact ties; a DELETE ALWAYS wins over an earlier-timestamped edit arriving late from another device — the entity never resurrects if the incoming write's timestamp predates the tombstone (applies to workout.deleted, habit revokes, journal/nutrition/body deletes alike). | L043, L044, L096, L283 (D019); intent brief C12.1 | Multi-device sync active (post-sync-milestone) | 92–107 |
| S032 | Nutrition/body event coverage (backup-A3): nutrition.logged (per logged meal — metadata only + pack-consumes emit it) and body.weighed (per canonical daily first-of-day weigh-in) written; revoke events nutrition.removed / body.weighed_revoked written transactionally with the row change; ~2k small rows/yr within the ~10k/yr design budget; NO per-set/per-slot/routine-noise events (exercise_sets, routine_slot_logs stay entity-only). | L097, L098, L095; intent brief C12.2 | Meal/weigh-in write and delete/undo | 534–561 |
| S033 | First-of-day weigh-in (NU8): multiple weigh-ins per day allowed and stored; the canonical daily trend = FIRST weigh-in of the day (morning fasted); later same-day entries are logged but EXCLUDED from derived series; deleting the canonical first row PROMOTES the next same-day row and the derived series changes retroactively — accepted display-side behavior (delete-and-re-derive everywhere). | L080, L081 | Weigh-in writes/deletes | 627–635 |
| S034 | Backfill bound (closure 6): same-day / last-24h backfill = normal NU4; OLDER dates = distinct "historical backfill" mode that does NOT extend the streak/check-up compliance (no fake consistency); gentle nudge stays. | L090 | Logging a meal older than 24h | 695–698 |
| S035 | deriveMacros single owner (NU11): deriveMacros(dateKey) is THE single owner of the day's numbers; EVERY consumer — macro-gap bar (NU12), fully-logged streak window (C2/B3), weekly nutrition check-up, phase report, Coach nudges — calls THIS function; none re-implements the math; no silent NaN/negative. | L084, L085, L244 (H3) | Any day-target consumption | 650–659, 2343–2350 |
| S036 | No-phase fallback precedence (NU10): no active phase → macro targets derive from GOALS first (weight goal → its derived rate, I5); no goal → "maintain" default (TDEE, protein 1.6, fat floor, carbs remainder); targets stay elevated when phase absent. | L083 | deriveMacros for a day with no active phase | 646–649 |
| S037 | Manual TDEE freeze: a manual override FREEZES the auto-recompute (NU6/Mifflin) AND the protein/fat g/kg basis (audit-B4 — snapshot of rolling bodyweight at override moment) until the user clears it; clearing unfreezes everything; manual protein entry always overrides per-phase defaults. | L087, L120 | Set manual TDEE → frozen; clear → unfreeze | 688–690, 2430–2437 |
| S038 | Planned-rest event gate (TENSION 1): habit.rest_planned created ONLY by the explicit per-habit one-tap rest flag — never from silence; delete/edit writes a compensating `_revoked` event transactionally; a rest day FREEZES the streak (neither resets NOR advances); rests never feed any streak-length trophy; rides the append-only event UNION (A2). | L139 | Explicit user rest flag | 1034–1051 |
| S039 | Account anchor freeze (TENSION 2): "day one" = MIN(occurredAt) across all events with imported=false and no tombstone/deletion; computed and FROZEN at the moment the FIRST real event is written; stored immutable; imports can never set/shift it; survives reinstall. | L140 | First real (non-imported) event write | 1022–1033 |
| S040 | isImported enforced at calculation time (TENSION 3): `imported` flag GLOBAL from the START on every importable entity row (journal, workouts, nutrition, body_metrics, habits); (a) EVERY H3 owner + achievement predicate filters imported rows INTERNALLY — part of the contract, never a cleanup step run at import time; (b) the 3-question anti-cheat gate rejects any import that would RAISE or TRIGGER a trophy (imports show history, never earn). | L141; intent brief C7.2 | From schema start + every owner calculation | 1008–1021 |
| S041 | Check-and-fire timing (engine-wide): checks run only after a WRITE affecting that domain (never a timer, never a render); a trophy fires exactly ONCE when its condition flips not-true → true; silent while true (no re-fire/re-arm); repeatable trophies re-arm only per their cadence. Applies to: six-domain presence (TENSION 8), turn-of-the-page (journal writes near an open phase window), yearly meta-streak (once per window completion), anniversary window (after a write affecting the consuming domain), ghost overlap (after a journal/workout/food/habit event). | L146, L178, L179, L180, L163 | Post-write evaluation per consuming domain | 1246–1262, 1133–1146, 1184–1208, 1228–1245, 1387–1391 |
| S042 | Ghost lookback is ONE-SHOT: retroactive credit is valid the FIRST time the check runs (a 90-day window that closed months ago fires honestly on the first check); the check goes PERMANENTLY SILENT once Ghost has fired; fires from the EARLIEST qualifying day; no re-fire, no re-arm, no re-scan — retroactive hunting ends at the moment of the award. | L164 | First false→true flip; then retired forever | 1392–1400 |
| S043 | Ghost unlogged-day semantics: a zero-log day during the window = HARD MISS (breaks No Deviation's run — no freeze; the whole 90-day rebuilds from the first day all three runs are alive, measured in LOGGED days); planned rest FREEZES a run but does NOT count as an alive day (the window stretches across it). | L164 | Daily log review during an active ghost window | 1401–1413 |
| S044 | Trimester + empty-week rules: Trimester week = the CALENDAR week (Mon–Sun, per week-start setting); target = the weekly schedule itself (no separate number); rest-frozen weeks FREEZE the run, capped at ONE per run (a second planned-rest week BREAKS the run); a week with ZERO scheduled sessions FAILS — never passes vacuously (E-clash #1, applies to Trimester AND The Schedule Never Breaks); the ONLY legal skip anywhere is a declared planned-rest week (cap 1); grace never shields a missed week; imports never qualify. | L184, L159, L189, L183 | Each week evaluation during a 12-week / 26-week run | 1418–1453, 1443–1451, 1544–1572 |
| S045 | M4 anchored years: "year" = non-overlapping 365-day window anchored at the family's first qualifying log (global anchor for the six-domain family); "ONCE PER CALENDAR YEAR" is DEAD — trophies fire ONCE PER ANCHORED YEAR, the check runs when the window closes; no partial-window credit; Bookended = the single NAMED calendar exception; imports never qualify; M5 year bucketing rides on it (nothing else changes). | L185, L186, L104; intent brief C7.3 | Window close | 1454–1494 |
| S046 | Vlog duration measured ONCE (TENSION 4): durationSec measured EXACTLY ONCE the moment a file FIRST enters the library (phone capture returns finished duration; PC adoption parses the container header once, no ffmpeg); every later tier move COPIES the stored row — no re-measurement, no re-download, no cross-device drift; unreadable → NULL, NEVER counts. Lifecycle: EVERY recording ends at a Keep/Discard REVIEW SCREEN (Discard = file wiped, no row, zero trophies — no farming via try-cancel loops; duration trophies read only kept-recordings); delete is tier-aware: buffered/phone → row + local file + vlog.deleted tombstone; Drive-vaulted → metadata row only, never destroys the blob; PC-adopted → app NEVER removes the file (folder = truth), un-lists + marks a "do-not-readopt" list. | L142 | File first enters library; each later tier move copies; recording end (Keep/Discard); delete per tier | 1309–1336 |
| S047 | Strength standards firing gate (TENSION 5 + E-clash #3): "Strength Standard Reached" fires on first-cross, per lift, per tier, ranks 2/3/4 ONLY (Novice→Branch, Intermediate→Heartwood, Advanced→Grove); rank 1 (Beginner) and rank 5 (Elite) NEVER fire a trophy (Coach/profile display only); no future pass may "fix" rank 1 or 5 into trophies; bodyweight/rep-mode exercises NEVER touch the table; overall level (item 19) is DISPLAY-ONLY, never a gate. | L143, L160, L189 | First-cross of a seed tier; ranks 2–4 only | 1052–1088, 1553–1558 |
| S048 | Tonnage definition (E-clash #4): "tonnage" = weight-mode sets ONLY (weightKg × reps per set, summed); rep-mode/bodyweight sets and addedLoadKg contribute ZERO to every tonnage total; trophy counters stay strictly weight-mode (displays may SHOW both). | L161; intent brief C1.4 | Every tonnage computation (M2+) | 1271–1281 |
| S049 | MMA absolute lifts — ACTUAL-LIFT-ONLY: absolute-lift trophy ladders fire ONLY when a REAL logged SET crosses threshold (weight ≥ threshold AND reps ≥ 1) straight from exercise_sets — no est1RM substitution, no e1RM inflation; no deletion can re-mint (derived from committed history); thresholds beyond current best stay future-earnable. | L181 | Real set logged | 1282–1296 |
| S050 | Weekly checkpoint cadence (resolve-B4): rolling-average evaluation at the CLOSED calendar week (Sun), once per week; thin weeks (<5/7 logged weigh-in days) neither confirm nor reset; weight-ladder and Real Progress confirmations read the TWO most recent consecutive non-thin weeks' checkpoints. | L125, L167, L123 | Closed calendar week (Sun) | 1656–1662 |
| S051 | Achievement cadence pins (G-batch): G5 Juggling Act fires once per CLOSED qualifying 21-day window (overlapping windows never re-fire); G6 Trifecta fires once per closed 7-day window containing all three PRs; G2 Same Question fires at 2, 3, and 5 distinct years, one-time each — NO repeats at 6+; G19 Five Strong counts STRICT CONSECUTIVE days only (grace-rescued days never count); G14/G15 Real Progress + On Target fire ONLY inside an active phase (no phase → no fire, ever). | L196, L197, L193, L209, L205 | Per closed window / per year milestone / per active phase | 1694–1702, 1739–1742, 1763–1767 |
| S052 | Robot-consistency anchoring (G1/G18): runs (Like Clockwork / Same Hour Same Scale / Same Time family) anchor their slot to the FIRST qualifying completion or weigh-in of the run — later completions must each fall within that anchored weekday + ±30-min slot; any outside = break; no fixed clock-grid; a run re-anchors at its own start; uses occurredAt declared time (TENSION 15), never writtenAt. | L192, L208, L153 | Run start (re-anchor); each subsequent completion checked | 1708–1712, 1751–1757 |
| S053 | Weekly routine selection (R7): at the START OF THE CALENDAR WEEK (first day per WEEK STARTS ON, S13-040) the user PICKS which weekly routine governs that week (or "continue current"); a routine assigned for a specific period falls back to the DEFAULT routine (or asks) when the period ends; otherwise continues indefinitely until changed. | L234 | Each calendar-week start; period end | 2195–2204 |
| S054 | Routine template edits affect FUTURE ONLY: past day slots/sessions stay frozen (copy, not link); editing a day template affects future bindings only; deleting a day template affects future bindings only and auto-falls back to the default routine; NOTHING retroactive (mirrors workout I2/weeks). | L232, L236, L011 (item 13 layering) | Template edit/delete | 2212–2215, 2221–2225, 285–289 |
| S055 | Routine prompt rules (routine-A2): NO weekly prompt on unbroken indefinite runs; the app asks only: first-ever setup / a period ends (falls to default) / user opens override / explicit want-change; otherwise silent continue. | L109 | Weekly-routine decision points | 2270–2273 |
| S056 | Session→slot link (audit 2.2): workouts gains nullable routineSlotLogId? SET AT SAVE TIME from the slot that preloaded the session; freeform/paste/"track-this" paths stay null and the slot stays "planned" (NOT auto-done); the user marks done / done-differently explicitly in the day view; no template+day fuzzy matching, ever. | L116 | Session save | 2307–2313 |
| S057 | Strip window vs verdict window (audit LOW-6): the week-recap strip always summarizes the DISPLAYED week (the grid it sits above — first column per WEEK STARTS ON); the weekly verdict / merged check-in uses the configured review-day window (S15-003) and the strip labels those dates explicitly — glance and verdict never silently mixed. | L239, L101, L243 | Week-recap render + weekly-review render | 2242–2247, 2384–2393 |
| S058 | Backfill slot semantics (audit LOW-18): a meal backfilled to an earlier date (NU4) marks its slot done in THAT date's routine view, never today's; the macro-gap bar always sums the day's target vs the day's full receipt via deriveMacros(dateKey) — display may lag, numbers never disagree. | L241 | Backfilled meal log | 2251–2255 |
| S059 | Week recap = glance + verdict (backup-A6): BOTH exist — the R11 strip stays on the week calendar as a tiny glance (gym 5/5 · packs 5/5 · weigh-ins 6/7); tapping the strip opens the single merged weekly review (A4) — the deep read; same H3 owner so they can never disagree; no competing weekly surfaces. | L101; intent brief C9.3 | Week view + weekly review surfaces | 2384–2393 |
| S060 | Period creation confirmation (audit 8.2): BOTH period creation methods (drag a range / manual date picker) end in a visible confirmation step — "Create period [start → end]?" — before commit; critical now that drag-add is day-1 (an accidental drag must never silently create a range). | L252 | Period creation — day-1 behavior | 1846–1851 |
| S061 | Settings H4 + Sync group gate: H4 applies to settings — a group appears only when the user has data for it; no "Sync" group until sync ships; Group 8 SYNC is a skeleton only (sync on/off, Wi-Fi-only, last-sync time) and renders ONLY when the entity-sync plane ships. | L253, L261, L191 | Sync milestone ships (S010/S011 gate) | 1870–1875, 1928–1929 |
| S062 | NOT-OFFERED guardrails: rep guard 1–12, Epley/Mifflin/Atwater formulas, 7700 kcal/kg (public-formula constants — toggling breaks "absolutely solid" math), dayActivityScore weights, per-exercise progression style, H4, XP/achievement values (M2 open items), check-in section on/off — never offered as toggles. | L262, L007, L020, L023 | Settings design/build (all milestones) | 1931–1937 |
| S063 | Coach weekly review merged into the Sunday check-in (backup-A4): the fitness check-in IS the weekly review — ONE weekly review surface (day configurable, Sunday default, S15-003), one pipeline; top = Coach weekly section (habits, journaling, life notes), bottom = fitness/nutrition sections; NOTHING is deleted (merge only); NO new build. | L099, L243 (H2); intent brief C9.2 | M2 weekly-surface build | 2362–2373, 2333–2341 |
| S064 | H2 ONE WEEKLY SURFACE: weekly fitness check-in (item 34) is THE single Sunday surface; week recap (R11) + nutrition check-up (add-on) are NOT separate top-level screens — COMPACT SECTIONS inside the check-in with tap-through to detail; one canonical verdict per cadence; kills the "which one do I open" tax. | L243, L092, L101; intent brief C9.2 | M2 weekly-surface build | 2333–2341 |
| S065 | H1 DAILY LOG = ONE TAP: opening the app lands on the dashboard with the briefing card (R12) already listing today's slots; log/pack/session actions one tap from there (session pre-load A7, one-tap meal NU3); layout default only — no feature. | L242, L115, L240 | App open (daily path) | 2317–2321, 2296–2301 |
| S066 | H3 build discipline: every derived stat has exactly ONE owner function; ALL views call it — never re-implement; a NEW aggregate → write it once in the engine FIRST, then consume it; rounding once, in the owner. | L244, L168 (M2-DERIVED-ONLY) | Every new derived stat / aggregate build | 2343–2350 |
| S067 | H4 REVEAL-ON-FIRST-DATA: an area does NOT render until it has data or the user explicitly first-touches it; first touch = escape hatch; full surface always built once reachable; applies to settings too. | L245, L253 | Every new area build (all milestones) | 2352–2360 |
| S068 | Coach quiet context switches (Coach map §6): J4 quiet week pauses nudges — ONLY the user starts it (history stays true, streaks stay real, quiet ≠ shield; grace is the streak shield — two shields never merge); vacation/period quiets adherence like a deload ("vacation, not laziness"); deload ranges: adherence quiet, volume-balance exempt, chart shaded; planned-rest parsing: real-rest vs quiet-miss vs grace — rest only prevents resets, never earns. | L278, L214, L263, L030 | Coach rule evaluation with an active context flag | 2556–2566, 2079–2095, 1939–1976 |
| S069 | Coach achievement tie-in timing: Coach REACTS to gamification events (achievement.unlocked, level.reached) — one-direction; NEVER creates trophies, NEVER grants XP; LOUDNESS TAXONOMY: ONLY Ring and Grove get a Coach line — one sincere derived line; ALL other tiers = silent in-game toast, no Coach speech; ONE Coach line AT MOST per trophy fire (E12); celebrations fire once per run/landing, never repeat congrats; Coach never judges XP/points. | L166, L137; intent brief C4.4 | achievement.unlocked / level.reached events (M2) | 872–883, 2443, 2549–2551 |

#### E. Deferred / revisit items (parked with gated reopening — NOT dropped as "future")

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S070 | N3 WARM-UP SETS — SKIPPED for now; deferred line kept: setType (working\|warmup) column + exclusions from volume/PR/est-1RM/adherence; not lost, revisit anytime. | L058 | Revisit anytime (no trigger) | 452–454 |
| S071 | N5 RECOVERY READINESS — SKIPPED for now; deferred line kept: morning 1–5 recovery_log + PO/Coach branches + M2 correlation analysis + deload trigger + check-in line; listed as a deferred Coach rule; revisit anytime. | L060; Coach map §3 deferred line | Revisit anytime; M2 correlation if built | 460–462, 2515–2517 |
| S072 | N6 EXERCISE CUES/NOTES — SKIPPED for now; deferred line kept: cueNotes text col on exercises, dimmed at block top, editable everywhere, swap-suggestion reuse; revisit anytime. | L061 (skipped, locked); park-able via L248 | Revisit anytime (no trigger) | 463–465, 530 |
| S073 | PERIODIZATION (FUT-5) — parked design note: programs = ordered sequence of weekly plans with loading phases (W1 normal → W2 added sets → W3 heavy low-rep → W4 deload); new programs table + block-scheduling layer; every analytics view gains a block dimension — biggest parked item. Revisit ONLY when the user is 12+ months of consistent training in AND asks; light alternative = week-level intensity labels (deload/heavy/medium) without a full block layer. | L274 (FUT-5, draft — Stage C verdict required); L248 park-able language | 12+ months of consistent training in + user request | 2665–2671 |
| S074 | Muscle map / body-light-up graphics (FUT-1) — REJECTED by user (decorative overload even in high-merit spots; topology already derivable from the muscle hierarchy). Do NOT resurrect without a new strong use case. | L270 (FUT-1, rejected, locked) | Only a new strong use case (user-driven) | 2656–2659 |
| S075 | Rest/recovery tracking (FUT-2) — raised, not scoped: could correlate PRs/performance; synergizes with deload markers + cardio. Partial overlap with the N5 recovery-readiness deferred line (S071 / L060) — treat as a sibling and revisit together; if ever scoped, must not duplicate N5. | L271 (FUT-2, draft — Stage C verdict required); overlap L060, S071 | Revisit anytime — with S071 (N5); no independent trigger | 2660–2661, 2515–2517 |
| S076 | Macro targets per phase (FUT-4) — protein target for bulk/cut; raised IN the nutrition session and overlaps NU7 (per-phase g/kg defaults already editable). Raised, not scoped; no separate build timing. If ever scoped, check NU7 overlap first. | L273 (FUT-4, draft — Stage C verdict required); overlap NU7 per L273's own note | Nutrition session already closed; no further trigger unless scoped | 2664 |
| S077 | RPE column — REJECTED (user, lookups #1): no RIR/reps-in-reserve tap; est-1RM/PR/PO math works on weight × reps alone (items 16/22/36); `rpe?` REMOVED from exercise_sets during the docs pass (schema block); draft-schema shapes (L282) already carry the strike. | L265 ([x]-RPE, rejected, locked); L282 draft-schema strike | Docs pass — schema block (immediate once S002 gate opens) | 2601–2603 |

#### F. Post-review supplement — WHEN-conditions missed in the original pass (S078–S082, added after compaction review)

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|----|-------------|-----------------------------------------------|----------------|--------------|
| S078 | I9 ONBOARDING — FIRST-RUN TIMING: onboarding captures Mifflin inputs (height/age/sex/activity as settings keys) and proposes a first weekly plan + seeded tracked exercises at FIRST RUN; user can customize/replace/clear all from day one; nothing forced. | L055 | App first run (onboarding) | 161–164 |
| S079 | N7 HABIT AUTO CHECK-IN — ON SESSION SAVE: session save AUTO-WRITES the day's habit check-in IN THE SAME TRANSACTION (checkin gains autoCreated); no double entries (manual wins); session deletion side handled by S029. | L062, L063 | Session save (workout) | 150, 466–476 |
| S080 | N9 PHASE CLOSE — REPORT RENDER TIMING: closing a phase renders the full phase close report (weight trend via rolling avg, pace verdict, sessions count, adherence %, volume totals + group volume, PRs with margins, achievements, goal pace, + one Coach line); all derived; snapshot optional into coach_outputs like the weekly check-in. | L065 | Phase close | 490–496 |
| S081 | F5 PHYSIQUE-PHOTO CADENCE: optional MONTHLY nudge to add a D031 timeline photo — OFF by default, no nagging; nudge lands in Coach; photo anchor per backup-A5 (journal entry tagged health+physique). | L070 | Monthly cadence (only if enabled) | 196–197 |
| S082 | QUIET MEAL REMINDERS — ON-APP-OPEN CATCH-UP ONLY (audit C1: NO push, D018): app opens + a known meal window passed unlogged → quietly offer batch catch-up (NU4); known meal windows = routine template meal slots (audit 2.5), seeded defaults (breakfast/lunch/dinner/snack) when NO routine bound; always in-app, non-naggy. | L093, L126 | App open (window passed unlogged) | 663–671 |

---

### 2. Contradictions flagged

- **None unresolved.** No contradiction between TEMP-PLANNING.md and the ledger surfaced during this extraction. Every clash/tension the source itself names (clash #1–#6, TENSION 1–15, E-clash #1/#3/#4/#5, audit/resolve family fixes) is already RESOLVED inside the ledger; the notes above record each resolution's WHEN/HOW side, not the clash itself.
- **Orphan / semi-bound flags (carry to Stage C, never drop):**
  - S073 (FUT-5 periodization), S075 (FUT-2 rest/recovery), S076 (FUT-4 macro targets): bound to DRAFT ledger rows L274 / L271 / L273 — Stage C verdicts required before the docs pass may treat them as binding.
  - S021 (Life Tree): bound to L269 (draft) — same verdict requirement.
  - S070 / S071 / S072 (N3/N5/N6 park lines): bound to L058 / L060 / L061 via L248's park-able list; Coach-map §3 (2515–2517) re-lists N5 independently — one fact, two surfaces, already reconciled.
  - Deliberately NOT extracted: FUT-3 (L272, body measurements beyond weight) — carries no timing or gating condition in the source (2662–2663); stays a ledger-only item. Closing-section [x] items: RPE → S077; seed list (L266 + adjacent categories row) APPROVED = M1 build fact that must work WITH auto-assort paste (L018) — no independent sequencing gate.

### 3. Footer

- **Line ranges covered (contiguous):** TEMP-PLANNING.md 1–2671 in full (this stage re-read it in four contiguous chunks 1–850 / 851–1600 / 1601–2300 / 2301–2671; the ledger records its own six-chunk read); docs/IntegrationLedger.md 1–467 (L001–L284, full); docs/IntegrationIDCensus.md 1–805 (full); docs/IntegrationIntentBrief.md 1–177 (full); docs/README.md 1–74 (full).
- **Total instruction count: 82 (S001–S082).** By section: A Master process gates S001–S004 (4); B Build order & milestone timing S005–S022 (18); C Docs-pass timing S023–S027 (5); D Feature WHEN-conditions, behavioral gates & verification cadences S028–S069 (42); E Deferred / revisit items S070–S077 (8); F Post-review supplement S078–S082 (5).
- **Post-review supplement provenance (S078–S082):** added after Stage A3 completion, when a post-compaction coverage check (ledger-row IDs vs note citations) found five WHEN-conditions present in the ledger but absent from the original extraction: L055 (S078), L062/L063 (S079), L065 (S080), L070 (S081), L093/L126 (S082). Each verified against TEMP-PLANNING source lines above. Borderline candidates (L122 re-fire map folds into S045; L235 R8 "next week resets"; L063 anti-farm gate) left un-extracted — Stage C to judge.
- **Unbuilt-milestone WHENs (kept here, target milestone noted — NOT dropped as "future"):**
  - Global user-approval gate (Stage C verdict): S001 — applies to every row; draft-row verdicts for L269 / L271–L274 / L282 feed S021 / S073 / S075 / S076.
  - Storage backend lock — M0 Session C (D007/D040): S010 (the sync plane does NOT change the backend decision).
  - Docs pass — design-adaptation phase (immediate once S002 gate opens): S002, S003, S014, S019, S023, S024, S025, S026, S027, S077.
  - M1 build window: S005, S006 (M1-or-M2), S007, S008 (gate met — nutrition session closed), S009 (gate met — nutrition section closed), S013, S036, S037, S039, S040, S041 (applies at each domain's first write, from M1), S056, S057, S058, S060.
  - M2 design/build window: S015 (rule-book session — before UI/UX pass), S016 (UI/UX ordering — after rule-book), S017, S018, S019, S020, S021 (Life Tree — blocks nothing M0/M1), S022, S048, S049, S053, S054, S055, S059, S063, S064, S065, S069.
  - Sync-plane milestone (Roadmap restructure, pending approval; required before multi-device M1-phase): S010, S011, S012, S031, S061.
  - Usage-gated (no milestone): S073 (12+ months of consistent training), S074 (new strong use case), S070 / S071 / S072 / S075 (revisit anytime), S076 (no trigger — closed session).
- **For Stage B1:** consume the Applies-to column directly; each note cites its ledger row ID / intent ID / free-text scope plus contiguous TEMP-PLANNING source lines. The four draft-bound rows (S021, S073, S075, S076 ↔ L269, L274, L271, L273) are valid as timing facts now but need Stage C verdicts before becoming binding requirements. Placement — append to DevelopmentWorkflow.md vs standalone file — is a human decision at Stage C; do not draft this content into product docs.

## Sequencing notes from the gen-2 TEMP-PLANNING integration

_Folded verbatim from the standalone docs/IntegrationSequencingNotes.md (Stage A3 - Sequencer, gen-2 ledger); at Stage C (2026-09-26) it was resolved to append here as a section (Stage C verdict #5, gen-1 precedent), and the standalone file stops being an artifact. This is the gen-2 integration output — the 121 HOW/WHEN instructions S001–S121 below are the standing reference for the gen-2 ledger (TEMP-PLANNING.md, 3,922 lines, frozen; tree-7 D085–D117). NUMBERING NOTE: the gen-2 S-numbers are a FRESH sequence, independent of the gen-1 S001–S082 block above — never cross-read IDs between the two blocks. The gen-1 block remains archived history except the S021 supersession (D117). Headings are demoted one level to fit this document._

### Integration Sequencing Notes — TEMP-PLANNING.md (gen-2 ledger)

Stage A3 (Sequencer, Track 3) output. Source: `TEMP-PLANNING.md` (the gen-2
ledger, 3,922 lines, frozen). Framework: `doc draft framework/
Pipeline-Framework-v7-Gen2-Delta.md` read first (where it disagrees with
v6-final it wins). Every row below is a HOW/WHEN instruction — how or when
something is built, prototyped, tested, or decided — NOT product content
(that is Track 1/2 territory).

This file is NOT drafted into product docs. It is a standing reference; the
human decides in Stage C whether to append it to DevelopmentWorkflow.md as a
"sequencing notes from TEMP-PLANNING.md integration" section or keep it as
its own file.

GEN-2 focus areas, extracted with precision:
- D117 (the development handoff, lines 3831–3919) — the M9 launch sequence:
  phase order engine foundation → organs → visuals → navigation → anatomy →
  review; the trait-space 17-audit + archetype-mockup step (D1/D2) runs in
  M9 against the real renderer (L-15's deferred placement lands here); the
  19 archetypes become the seeded-data test fixtures (H1).
- D105 (lines 3019–3044) — the dev-tools tuning surface: every register
  value playable in a dev-only debug panel — "build with the engine, never
  ship."
- The paper-run validation discipline (D116 + D117 H1/H5, lines 3459–3565,
  3909–3919): the 19 archetype walks are the regression fixtures for the
  derivation engine.
- "Research leftovers" (lines 2104–2155): every item with a timing/gating
  condition is extracted below; items with no timing language are left in
  the ledger.

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|---|---|---|---|---|
| S001 | Every decision gets `(LOCKED, user yes)` + a D-number (D082+) written into docs/DecisionLog.md; no silent assumptions — state them, get a yes. | All ledger entries (general process) | Immediate — at every decision | 25–26 |
| S002 | Divergence discovered while building: DecisionLog entry first, then docs. | All build work (general process) | Immediate — when divergence is discovered during building | 27–28 |
| S003 | No new dependencies without a DecisionLog entry + user approval. | Any new dependency (general process) | Immediate — before adding any dependency | 29 |
| S004 | New achievement work follows the layer map (Gamification.md v2 = THE WHAT, Achievement-Spec = THE WHEN, ledger = THE WHY); this file restates nothing. | Achievements / gamification work | Immediate — for any new achievement work | 30–33 |
| S005 | When this batch matures → run the integration pipeline once, then this file gets archived like gen-1 (audits/ date-suffixed). | Ledger lifecycle (general process) | When the batch matures / a pipeline run starts | 34–37 |
| S006 | Source freeze applies from the moment a pipeline run starts. | Ledger + docs (general process) | When a pipeline run starts | 38 |
| S007 | Entry format + status discipline: first line `- FAMILY-ID NAME (STATUS, user yes — note):`; statuses LOCKED / SKIPPED (REVISIT line) / REJECTED (RESTING PLACE line) / AGREED IN PRINCIPLE / PENDING; rejected = do-not-resurrect contract, skipped = trigger that re-opens them — both must survive any docs pass. | All ledger entries (drafting process) | Immediate (standing); enforced at the docs pass | 44–69 |
| S008 | LANDS convention: D082+ is implied for every LOCKED entry across ALL series (C/F/N/L + tree-7); the docs pass assigns the final D-numbers per row. | All LOCKED ledger entries | Docs pass (Stage B/C) | 94 |
| S009 | Installed skills security-threat-model + security-and-hardening serve the M3 OAuth gate + the Life Tree engine build. | D084 (skill installs); M3 OAuth / Life Tree engine | M3 OAuth gate; Life Tree engine build | 95–99 |
| S010 | flutter-expert skill supports the Life Tree engine build (off-UI-thread derivation via compute(), RepaintBoundary render isolation, DevTools profiling). | D083 (skill install); Life Tree engine | Life Tree engine build (M9 Phase 0) | 115–122 |
| S011 | D060 supersession: the gen-2 F-series supersedes D060 (fitness surface CLOSED) for the named locked candidates; the closure list is amended at the docs pass (DecisionLog D082+ entry records the override); Roadmap.md:283-288's N3/N5 park-able clause is amended — they are re-opened, not park-able. | F-series candidates; Roadmap.md | Docs pass | 131 |
| S012 | F-03 PR-celebration DESIGN LANGUAGE is HELD until the Life Tree design session — F-03 adopts whatever the Life Tree defines; only the functional rules lock now. | F-03; DesignSystem.md ceremony tokens | Life Tree design session (tree-7, complete) → ceremony language lands in M9 Phase 3 (D117 D3) | 255–261 |
| S013 | engine-1 logging friction discipline applies to ALL M2 logging work: default path ≤2 interactions/set, everything pre-fillable pre-filled, friction budget (every new live-logging field must remove more friction than it adds; optional input goes to the post-session review, never mid-session), minimal mode. | engine-1; all M2 logging UI | All M2 logging work | 324–343 |
| S014 | engine-2 Coach heuristic engine: ~25 named rules committed by M2; ONE rule-execution architecture (event → rule catalog, condition→action, strictness-parameterized), never scattered ad-hoc conditionals; the concrete test plan locks at the Coach rule-book session (test oracle = determinism + explainability; table-driven tests; per-rule boundary tests; fixture-based regression; provenance-as-authority). | engine-2; CoachSystem.md rule catalog | Rules by M2; test plan at the Coach rule-book session | 344–368 |
| S015 | engine-2 LLM role: voice layer only, render-never-decide, OFF by default, offline = complete product; access mechanics deliberately unspecified — decided when/if it ever ships. | engine-2; Optional AI Adapter | When/if the LLM layer ships | 369–376 |
| S016 | F-05 adherence exclusion: W-set-only sessions never count toward plan adherence and never satisfy qualifyingEntry(GYM); Gamification.md:209-211 must read "≥1 real WORKING set". | F-05; Gamification.md | Docs pass | 313–320 |
| S017 | F-08: verify the seed volume-band numbers (MEV/MAV/MRV) against RP's published tables at build (rpstrength.com volume-landmarks, peakcalcs.com). | F-08; M2 volume-balance engine | At M2 build | 487–489 |
| S018 | F-08 schema-amendment flag: CoachSystem.md:277 ("volume balance = Settings keys only; zero core schema change") becomes FALSE via F-05's setType — the docs pass amends to "settings keys + the setType column (F-05)". | F-08; CoachSystem.md | Docs pass | 492–496 |
| S019 | F-12 default-style reconciliation: the docs pass records the amended default "weight-mode = linear progression with GZCLP stage-cascade on failure (F-12)". | F-12; Roadmap.md PO-style default | Docs pass | 444–450 |
| S020 | F-13 long-horizon weight view (full-history EMA + per-month markers + J5 yearly weight page + Life Tree body-domain presence) is a follow-on design item, NOT part of F-13's lock; the J5 yearly page is a J5 spec change. | F-13; Roadmap M1 J5 | Follow-on design item; J5 spec change at M1 | 553–564 |
| S021 | F-13 doc-amendment flags: Architecture.md:189/268-270 + Roadmap.md:361 "rollingWindowMean = the ONLY rolling-average math" claims become FALSE — amend to "the ONLY windowed rolling-average util; the body trend owner uses the time-indexed EMA"; the pace-owner consumers (phase/goal pace, ratios, trophies, weight-goal pace) read the new rate layer. | F-13; Architecture.md; Roadmap.md | Docs pass | 572–584 |
| S022 | F-14: UI details (rate-vs-target bar, water-jump dots) may be improved/changed during the UI design phase (recorded, not locked). | F-14; UIUX.md weight chart | UI design phase | 597–600 |
| S023 | F-15: celebration visual language DEFERRED to the Life Tree ceremony session (same as F-03); forecast = RANGE, never a single date; UI suggestions may change at the UI implementation phase. | F-15; DesignSystem.md ceremony tokens | Life Tree ceremony session → M9 Phase 3; UI implementation phase | 616–620 |
| S024 | F-16: UI suggestions noted — future UI implementation may change them. | F-16; UIUX.md weight screen | Future UI implementation | 638–639 |
| S025 | F-17: rank interpolation is derived from the frozen tables now, labeled modeled; OpenPowerlifting public CSVs remain the FUTURE empirical upgrade (offline-packable). | F-17; vault standards screen | Future — when OPL data is adopted | 666–669 |
| S026 | F-18: IPF DOTS coefficients are embedded FROM THE OFFICIAL SOURCE at build (never invented, verified at write time — same discipline as the frozen standards tables); the exact meta-score rollup is open-at-build detail. | F-18; strength profile engine | At M2 build | 691–707 |
| S027 | F-19/F-20: the session-load unit ("tonnage-equivalents" or "set-load points") is DEFINED AT THE RULE-BOOK SESSION before the engine is built; the ~8/week ramp guardrail is anchored to that unit. | F-19, F-20; Architecture.md load owner | Coach rule-book session, before the engine is built | 751–756 |
| S028 | F-19 N5-deferral amendments: Roadmap idea-park N5 (Roadmap.md:1027-1029) + CoachSystem.md:352-357 must read "CLOSED by F-19" at the docs pass; FUT-2 hardware-style readiness tracking stays OUT of F-19 (separate item, carried forward). | F-19; Roadmap.md; CoachSystem.md | Docs pass | 762–766 |
| S029 | F-23: M2 ships TIRED + SHORT-ON-TIME (load multiplier + condensed variants); the no-equipment path comes LATER (parked — F-32 rejected 2026). | F-23; M2 session screen | M2 ships the subset; no-equipment later | 796–798 |
| S030 | F-24 one-line amendments: the docs' "one Coach line per strictness" in FOUR places (check_in_weekly CoachSystem.md:171, nutrition_checkup :177, phase_close :185, milestone-review :236) all amend to the 3–5-line message at the docs pass. | F-24; CoachSystem.md | Docs pass | 841–845 |
| S031 | F-25 REVISIT: activation trigger — when M7 gamification planning begins (or fitness-streak work starts); the weekly-streak (a)/(b)/(c) decision + savers (12-week marks, max 2) are picked then; v2 streak trophies read the re-framed streak (catalog-level decision via the layer map). | F-25 (SKIPPED); Gamification.md grace family | M7 gamification planning / fitness-streak work starts | 877–880 |
| S032 | F-26 REVISIT: activation trigger — when rep-mode exercise work starts (M2 build or later); progression-edge seeds + user-extendable chains design decided then (schema decision). | F-26 (SKIPPED); rep-mode exercises | Rep-mode exercise work starts (M2 build or later) | 899–901 |
| S033 | F-27 ACTIVATION: the full proposal is documented; planning is ACTIVATED at the M7 gamification/achievement milestone (or any trophy-catalog work); the deferred adapted-session question (do F-23 adapted sessions count as adhered?) + the schedule-run trophy cap are decided at activation. | F-27 (AGREED IN PRINCIPLE); trophy catalog | M7 gamification/achievement milestone / any trophy-catalog work | 928–937 |
| S034 | N-09: no new package needed on web (verify at build — native Chrome BarcodeDetector API + zxing-wasm fallback); DecisionLog entry records the approval + D069 distinction. | N-09; M3 barcode scanning | At M3 build | 1033–1037 |
| S035 | N-01: UI suggestions recorded (history ribbon top-12, badges always-visible); future UI development stages may change or keep them. | N-01; UIUX.md diary | Future UI development stages | 1052–1053 |
| S036 | N-02 micronutrients: separate milestone M3b (after M3, before M4 — needs the M3 diary foundation, self-contained after that); includes a LARGE GUI/UIX section; M3b needs a dedicated mobbin pull + research pass at activation (Cronometer has no mobbin screens). | N-02; Roadmap M3b | M3b activation (after M3, before M4) | 1147–1160 |
| S037 | N-02 drafter notes: the docs pass drafts the tiered architecture (bundled core / growing mirror / online pass-through; seed numbers 15k, 10–15 MB; accumulation rule) with verbatim-critical fidelity; the security gate references the online-exception contract when reviewing any nutrition network code. | N-02; Database.md; DecisionLog; security gate | Docs pass; security gate on nutrition network code | 1161–1181 |
| S038 | N-10 substitution built in two scopes: CURRENT-MEAL-ONLY first (M3, affects today's slot, nothing else); CASCADE built AFTER it (M3+), a deliberate EDIT-PLAN action with confirmation, never a silent side effect of substitution. | N-10; M3 + M3+ substitution | M3 then M3+ | 1250–1255 |
| S039 | N-17: record-the-abstraction-now, feature-later — the macro derivation engine is BORN READY with the constraint-order abstraction (protein-fixed + floor-fixed + remainder-flex), never hard-coded to bulk/cut/maintain (zero extra build cost); REVISIT when new phase types / diet modes are actually proposed. | N-17; Architecture.md macro derivation engine | Engine build (M3); revisit when new modes proposed | 1317–1328 |
| S040 | N-07 scope split (D5): M3 ships L1+L2 (already locked) + ALL estimate-framing copy (N-13) + the weigh-in policy nudge + the adaptation lines + the aggressive-rate warning; M3+ ships the L3 implied-TDEE insight itself (needs accumulated logging data to mean anything). | N-07; Roadmap M3 / M3+ | M3 then M3+ | 1466–1470 |
| S041 | N-07 drafter notes: Architecture.md drafts the impliedTDEE owner (trendWindow 20-day inference signal separate from the F-13 display EMA); CoachSystem.md drafts the check-up block (implied-vs-locked display, HOLD states, adaptation arc copy); DecisionLog records D1-D7 verdicts + the B4 contract (surfaced-only); Roadmap M3+ schedules the insight; all constants verbatim-critical. | N-07; Architecture.md; CoachSystem.md; DecisionLog; Roadmap M3+ | Docs pass / M3+ scheduling | 1471–1479 |
| S042 | N-13 drafter notes: UIUX.md drafts the explainer sheet component + footnote copy (verbatim-critical framing table); CoachSystem.md drafts the check-up lines. | N-13; UIUX.md; CoachSystem.md | Docs pass | 1515–1519 |
| S043 | L-02: Logbook (won-archive) placement is a recorded suggestion — future UI development stages will likely affect it (noted, not locked). | L-02; goals surface | Future UI development stages | 1558–1561 |
| S044 | L-03: on/off-track colors left for future UI development to decide (amber for behind, red reserved for genuinely-expired — suggestion recorded, not locked). | L-03; goal chart | Future UI development | 1581–1584 |
| S045 | L-13: M4 scope = weekday/weekend + specific days + weekly; MONTHLY patterns future; pattern edits apply FUTURE-ONLY by default with this/all-future/all scoping (a template edited mid-week never corrupts the week). | L-13; M4 routine editor | M4; monthly patterns future | 1637–1642 |
| S046 | L-06: line placement (interleaved chronological feed) + status color semantics are recorded takes — FUTURE UI DESIGN MAY CHANGE THEM (not locked); period-level duality (Polarsteps) is accepted. | L-06; M6 day view | Future UI design | 1664–1673 |
| S047 | L-07: full collapse (no compact placeholders) + zero-data heatmap collapse accepted — FUTURE UI/UX DEVELOPMENT MAY CHANGE (not locked). | L-07; dashboard blocks | Future UI/UX development | 1691–1697 |
| S048 | L-12: numbers>charts glance / charts>numbers analysis rule recorded — FUTURE UI/UX MAY CHANGE (not locked). | L-12; dashboard + DesignSystem.md | Future UI/UX | 1709–1715 |
| S049 | L-14: the final strength-vs-heatmap block order is HELD for the deferred UI/UX ordering pass; the evidence note (heatmap = glance surface, strength snapshot = analysis below the glance line) is what that pass inherits — not reopened blindly. | L-14; dashboard block order | UI/UX ordering pass | 1726–1732 |
| S050 | L-09: per-block skeleton rules accepted (returning-users-only ghosts, no ghosts for locally-cached light blocks, geometry-matched shapes) — FUTURE UI PASSES MAY CHANGE (not locked). | L-09; dashboard shimmer rule | Future UI passes | 1752–1756 |
| S051 | L-10 stress-testing requirement: the insight engine must be EXTENSIVELY STRESS-TESTED with SEEDED DATA (synthetic histories producing known patterns; edge cases: tiny samples, lopsided groups, seasonal effects, missing data; full threshold/confidence matrix) BEFORE it ever ships a real insight; the test fixtures become part of the engine's test suite (per engine-2). | L-10; CoachSystem.md insight line | Before the first L-10 insight ships | 1792–1799 |
| S052 | L-11 sprawl guardrail: a standing guardrail, not a feature — every proposed feature passes "does it earn its place in the surface?" (surface-worthiness / schema discipline / sprawl test); carried to DevelopmentWorkflow at the docs pass. | L-11; DevelopmentWorkflow.md | Docs pass; standing rule for every proposed feature | 1808–1825 |
| S053 | L-15: PLACEMENT DEFERRED to D117 D1/D2 — the M9 trait-space + mockup step, where the spatial-meta layer (life-scale grid) is designed against the real renderer; feed-only scope (strip, zoom mode, or not at all — tree session decides). | L-15 (DESIGN FEED); tree-2/tree-5 placement | M9 Phase 3 (trait-space + archetype mockup step) | 1826–1851 |
| S054 | C-03: the weather chip ships WITHOUT it (PENDING SUB-ITEM inside a LOCKED entry) — the chip activates only after the DecisionLog dependency decision (free API key or free accurate open-source setup + approval). | C-03; weather chip | After the DecisionLog dependency decision | 1874–1881 |
| S055 | C-05: J5 must exclude hidden memories at the docs pass — hidden-ness in Year Book PDFs changes the J5 spec ("packages a copy"); hidden applies EVERYWHERE memories surface, including exports/PDFs. | C-05; Roadmap M1 J5 | Docs pass (M1 J5) | 1911–1914 |
| S056 | C-08: the unlinked-mention suggestion carries the "needs text access → user opt-in first" privacy stamp — gated until the M2+ text opt-in exists OR matching is restricted to tags/areas/dates only at activation (decision at build; PENDING SUB-ITEM); wikilinks (user-typed) are unaffected. | C-08; J2 matcher | At build; gated on the M2+ text opt-in / matching restriction | 1949–1959 |
| S057 | C-09: LANDS must amend the Grace section wording to "grace + bounded pause are the streak shields" (pause bounded 1–14 days, records the away period — never hides). | C-09; Gamification.md grace family | Docs pass | 1979–1980 |
| S058 | C-11: transcription + time-sync (tap transcript → scrub audio) = FUTURE-ONLY optional addition, NOT now; needs an STT engine decision (DecisionLog + approval) when/if pursued; raw audio always kept; on-device only. | C-11; voice-note entry type | When/if STT is pursued | 1990–1998 |
| S059 | C-11 audio-duration note: the voice-note path needs an audio container rule (e.g., M4A/MP4 header parse for adopted files) + tier rules — recommended at build: same tier logic as vlog, buffer exempt. | C-11; MediaStorage.md | At build (voice-note entry) | 1999–2005 |
| S060 | C-07 REVISIT: activation when M7 analytics work starts, or when the Life Tree branch-detail design needs the data (per-area fields, opt-in, invisible until used). | C-07 (SKIPPED); Life Areas v2 | M7 analytics work / Life Tree branch-detail design | 2025–2028 |
| S061 | C-12 REVISIT: activation when the Coach rule-book session plans prompt-driven nudges, or if blank-page friction shows up in real use (J2 search + memory strip ship first); hand-written core + LLM expansion curated at build time; NO scraping (copyrighted IP). | C-12 (SKIPPED); prompt library | Coach rule-book session / blank-page friction in real use | 2042–2044 |
| S062 | C-13 REVISIT: after J1 ships and the memory strip proves itself in real use — then decide the ritual on/off; GUARD at activation: the review-streak reward must be XP-free and non-farmable (never-list forbids rewards for reading/opening). | C-13 (SKIPPED); J1 memory strip ritual | After J1 ships + strip proves itself in real use | 2057–2062 |
| S063 | C-14 REVISIT: belongs to the deferred Coach rule-book session — raise the scheduling layer there as a named rule. | C-14 (SKIPPED); Coach scheduling layer | Coach rule-book session (M8 planning) | 2071–2075 |
| S064 | C-10 REVISIT: anytime — a natural Life Tree annual-ring visual if the tree design wants it. | C-10 (SKIPPED); Year-in-Pixels mosaic | Life Tree design (M9) wants it | 2091–2092 |
| S065 | Research leftovers pipeline: items land in docs/DecisionLog.md as OPEN ITEMS (category = deferred, D038/D039 precedent) — do NOT scatter into feature docs as decided scope. | Research leftovers (all NOTED items) | Docs pass | 2109–2111 |
| S066 | OCR SEARCH over attached photos: revisit when J2 ships; needs a PWA OCR path decision (local WASM vs defer). | Research leftover; J2 search | J2 ships | 2113–2116 |
| S067 | REGEX-CAPABLE SEARCH: fold into J2's matcher design if trivial; no separate decision. | Research leftover; J2 matcher | J2 matcher design | 2117–2118 |
| S068 | COMMAND PALETTE (Ctrl+P): belongs to the UI/UX ordering pass. | Research leftover (GUI) | UI/UX ordering pass | 2119–2120 |
| S069 | ATLAS / MAP VIEW OF ENTRIES: revisit at M6 (pairs with M6 periods/travel + physique timeline). | Research leftover; M6 periods/travel | M6 | 2121–2123 |
| S070 | MULTIPLE JOURNALS vs SINGLE TIMELINE: recorded so the docs pass doesn't re-open it silently (current direction = single timeline + Life Areas). | Research leftover (design pole) | Docs pass guard | 2124–2127 |
| S071 | DEFAULT-INBOX + TRIAGE: belongs to the UI/UX ordering pass. | Research leftover (capture GUI) | UI/UX ordering pass | 2128–2129 |
| S072 | ONE-ENTRY-PER-DAY CONSTRAINT MODE: revisit if catch-up spirals show in real use. | Research leftover (pole) | Catch-up spirals in real use | 2130–2131 |
| S073 | SMART FILL BACKFILL: revisit with habits/grace v2 work. | Research leftover; habits/grace v2 | Habits/grace v2 work | 2132–2133 |
| S074 | GOAL/STREAK PROGRESS RING IN EDITOR: belongs to UI/UX ordering pass. | Research leftover (GUI) | UI/UX ordering pass | 2134–2135 |
| S075 | NO-FAIL JOURNALING ("journal three lines, decline without recording"): Coach rule-book session candidate. | Research leftover (coach) | Coach rule-book session | 2136–2137 |
| S076 | OPTIONAL FOCUS GATE (app-blocking during reflection): Coach rule-book session candidate. | Research leftover (coach) | Coach rule-book session | 2138–2139 |
| S077 | PRIVACY-FIRST ONBOARDING COPY ("we never see your data"): belongs to welcome/onboarding polish. | Research leftover (UX) | Welcome/onboarding polish work | 2140–2141 |
| S078 | ENCRYPTED EXPORT ARCHIVES: revisit with backup/export v2 (M10 Drive P2 planning). | Research leftover; export/backup v2 | M10 Drive P2 planning | 2142–2143 |
| S079 | YAML FRONTMATTER ON EXPORT: fold into Year Book export format if wanted; no separate decision. | Research leftover (J5 detail) | Year Book export format work | 2144–2145 |
| S080 | QUOTE-YOUR-OLD-SELF / TRANSCLUSION: if C-08 links ship and reflection wants it, extend links with an "insert quote from" action — revisit then. | Research leftover; C-08 family | C-08 links ship + reflection wants it | 2146–2148 |
| S081 | MORNING/EVENING RITUAL RHYTHM: Coach rule-book session candidate (with C-14). | Research leftover (coach) | Coach rule-book session | 2149–2150 |
| S082 | RESEARCH ANTI-PATTERNS: the docs pass cites these (paywall nagging, punishment loops, cloud-only memory, training on content) as documented no-goes wherever nudges, gamification, or AI are described. | Research leftovers (guardrail) | Docs pass | 2151–2155 |
| S083 | UI/UX DEVELOPMENT REFERENCE: consult at EVERY milestone's UI/UX work (implementation, the UI/UX ordering pass, and any design drafting) — table is a lookup, not a lock; pipeline routes it via B2 Structural Impact Proposal + D2 executor, not the per-row D1 path. | UI/UX reference table (M0–M9 rows) | Every milestone's UI/UX work | 2157–2171 |
| S084 | Mobbin dataset maps: VERBATIM-CRITICAL — drafters copy the FILE PATHS and screen counts exactly, never inline JSON contents; the GUI-table milestone rows + these maps are the two drafting entry points for mobbin content. | Fitness/nutrition/LifeOS mobbin maps | Docs pass drafting | 2192–2237 |
| S085 | APP MAP: the Life Tree sits on top of analytics feeds (M7) + rings data — its design assumes those locks, nothing earlier. | Life Tree; M7 analytics + rings | Tree design/build depends on M7 analytics + rings locks | 2341–2342 |
| S086 | tree-4: the tree tab's navigation placement is decided at the deferred UI/UX ordering pass (tab existence locked gen-1). | tree-4; Life Tree tab | UI/UX ordering pass | 2386–2387 |
| S087 | tree-7 session plan steps 4–9 (the build order): 4 archetype mockups DEFERRED to the M9 milestone (D117 D2); 6 engine architecture (derivation cache, state model, renderer design + perf budgets, test harness); 7 trait space + visual design (mockups feed this); 8 engine contract (zero-decision-fatigue spec); 9 build sequencing (phase 0 = renderer perf spike, then organs → visuals → navigation → anatomy → review mode); 10 record + docs pass. | tree-7 session plan; PLAN.md | Steps 4–9 at M9; step order per PLAN.md | 2404–2412 |
| S088 | D094: the replay-on-open + viewed-watermark mechanism (unviewed transitions play in chronological order on next open, then settle) IS the M9 launch-day replay engine (N-1) — a veteran user's first open replays their whole journey seed → today. | D094; D097 launch-day contract | M9 launch-day (engine built in M9 Phase 5/F + used at launch) | 2605–2613 |
| S089 | D097 launch-day contract: the tree derives from FULL history from day one (a veteran's tree is already mature on first open — no fake fresh start); the journey replays ONCE, elegantly, as a time-lapse (~20–40s) from PRECOMPUTED YEARLY SNAPSHOTS, never live re-derivation, background-loaded; first frame = current state instantly (perf contract); viewed-watermark once (skippable; reduced-motion fallback = jump to current state); backdating of new events governed by D100's two-tier split (the tree never rewinds); legend card after the replay. | D097; tree-5 perf; D094 replay engine | M9 launch (tree ships in M9; users log from M0) | 2728–2768 |
| S090 | D098: the tree cache is REGENERABLE — never part of the backup format's integrity story; rebuilds on restore off-thread, shimmer-first (same as D097 — the rebuild stacks on the heaviest import, streams, never blocks). | D098; restore/backup contract | M9 engine build + restore flow | 2804–2807 |
| S091 | D101: the ring-year per-domain presence bar is DEFERRED — belongs to the THRESHOLD REGISTER (Step 1 of the input map) where all numbers lock together; it locks with its siblings (qualifying-day floor, stage-year bar, twig bar). | D101; SCHEMA 2.4 threshold register | Threshold-register lock-step (register freezes at the engine contract, D116) | 2908–2914 |
| S092 | D102: live code migrates to the shared birth anchor (a data migration for existing users — the anchor = first in-window event, frozen; the Coach's shifting journal anchor is replaced); CoachSystem.md anniversary = the shared anchor — amend at the docs pass; the anchor rides in the backup format. | D102; birth anchor; CoachSystem.md | Implementation (data migration); docs pass | 2940–2949 |
| S093 | D105 dev-tools tuning surface: every register value must be PLAYABLE during the development/visual-testing phase — a dev-only debug panel that tweaks any number and drives a live re-derivation + re-render; the archetype mockups and the perf gate use it; NEVER shipped to users. The RESOURCE normalization ceiling (20 events/day) is calibrated via the dev tools at the paper-run step. | D105; SCHEMA 2.4 register | Development/visual-testing phase; MUST exist before any visual tuning (D117 B3) | 3035–3042 |
| S094 | D108 derivation protocol: incremental delta updates with ATOMIC SWAP; full re-derivation ONLY on first launch (D097), restore (D098), fingerprint mismatch, or register-version bump (dev tools); cache PERSISTED (first paint = current state instantly); derivation off-UI-thread (isolate); set-commutative fold (order-independent); single-writer lock (two-tab concurrency); ceremonies QUEUE — never interrupt an active session. | D108; SCHEMA 2.6; engine architecture | M9 Phase 0 (B2 state model / B4 derivation engine) | 3107–3144 |
| S095 | D109: formatVersion 3 (monotonic logFingerprint) + the viewed_moments table belong to the M10–M13 sync milestones — drafted at the docs pass. | D109; M10-M13 sync | Docs pass; M10–M13 sync work | 3158–3175 |
| S096 | D110: the tree's read surface = the event log + its own H3 owners ONLY — never the M7 analytics cache tables, never coach_outputs, never goal internals beyond the agreed owners; the M7 cache-vs-log arbitration happens at the docs pass. | D110; tree read-surface contract | Docs pass (M7 milestone arbitration) | 3210–3221 |
| S097 | D111: a DEUTERANOPIA PASS is a locked gate in the mockup + stress-test steps (no meaning rides on color alone — season announced in the strip's text line, tiers carry size/mark differences). | D111; tree-5; mockup + stress tests | M9 mockup + stress-test steps | 3239–3243 |
| S098 | D112: the blush palette decision is OPEN TO EDITS during implementation/visual testing — the tokens join the dev tools' playable surface (like the register numbers); the final blush treatment is tuned at the mockup step. | D112; TRAIT-SPACE.md palette | Implementation/visual testing; mockup step (M9 Phase 3) | 3286–3294 |
| S099 | D112/D113 17-audit: a systematic pass at the trait-space step (PLAN Step 7) assigning EVERY trait exactly one of four statuses — WIRED (data driver + manifestation moment), RESERVED-UNMAPPED (deliberately not wired, reason documented), STRUCTURAL (always-present anatomy), EXCLUDED-BY-DESIGN (permanent, D113); drivers are dev-tunable like register numbers; MUST precede the trait-driven visuals (D117 D1). | D112 + D113; TRAIT-SPACE.md | Trait-space step (PLAN Step 7) → M9 Phase 3 D1 | 3295–3308, 3349–3360 |
| S100 | D112 DV-C5: the Heartwood rename is DROPPED (all three "Heartwood" names stay) — the ambiguity is DOCUMENTED as a naming note at the docs pass, never renamed. | D112; Heartwood naming | Docs pass | 3323–3329 |
| S101 | D114 deferrals each carry a home: docs-pass amendment register (home: PLAN step 10); owner contracts (home: Step 6); perf-gate numbers F9/F10 (home: register at Step 6); mast-year + within-tier variance calibration (home: the paper run with the dev tools); test-strategy acceptance criteria (home: Step 9); emotional copy-language pass (home: the mockup step); terminology glossary (home: the docs pass). | D114; PLAN.md steps 6–10 | Per-home step (see each home) | 3403–3414 |
| S102 | D116: the register (SCHEMA 2.4, with all D116 amendments + additions C8-C13/A6-A7/E15) FREEZES at the engine contract — no further tuning after. | D116; SCHEMA 2.4 register | Engine contract (PLAN Step 8) → M9 Phase 0 | 3562–3565 |
| S103 | D088 verification: the archetype mockups + seeded-data stress tests include a botanical-contradiction check — a generated tree must pass every adaptation's axis signature or the engine does not ship. | D088; adaptation layer | M9 (engine does not ship until it passes) | 3770–3773 |
| S104 | D117 A1: the docs-pass amendment register — DecisionLog entries for D085–D117 (including this record; never complete without itself); Gamification.md (anchor/six-domain/qualifyingEntry); CoachSystem.md (anniversary = shared anchor); Roadmap.md (M7/M9 premises + the D060 supersession closure clause); Database.md (formatVersion 3 + logFingerprint + isBackfill + adoptedAt + event schema + viewed_moments — NOT StorageDecision.md, which carries no format); UIUX.md (tree tab + semantics contract). Home: the docs pass (PLAN step 10). | D117 A1; all amended docs | Docs pass (PRE-M9, opportunistic — any docs pass / adjacent milestone) | 3838–3850 |
| S105 | D117 A3: owner-contracts groundwork designed alongside their systems — qualifyingEntry (with M7 analytics), streak (with M7 gamification), goalProgress (with M5), coachEngagement (with M8 coach), dayActivityScore (calendar tint owner, M6), mediaPresence (with M10–M13 media). | D117 A3; H3 owner contracts | Alongside each owner's milestone (PRE-M9 opportunistic) | 3851–3856 |
| S106 | D117 A4: the emotional copy-language pass (dormancy copy, bank counter framing, empty-spring copy, legend card) happens with the UI copy work. | D117 A4; why-panel copy | With the UI copy work (PRE-M9 opportunistic) | 3857–3859 |
| S107 | D117 B1 (M9 Phase 0 — the engine foundation, the milestone's first phase): the RENDERER PERF SPIKE — prove the perf budget (≤16ms at LOD-1/2 on the target device tier, the F9 gate) with a minimal derived tree on a real device; the LOD ladder (LOD-1 mass / LOD-2 structure / LOD-3 detail), instanced procedural leaves, autumn leaf-fall re-bake + capped particles. | D117 B1; tree-5 perf | M9 Phase 0 (first) | 3860–3867 |
| S108 | D117 B2: the state model implementation — the derived cache (SCHEMA 2.6), logFingerprint, atomic swap, set-commutative fold, single-writer lock (D108/D109). | D117 B2; SCHEMA 2.6 | M9 Phase 0 | 3868–3870 |
| S109 | D117 B3: the dev-tools tuning surface (D105) — the debug panel that tweaks any register value and drives a live re-derivation + re-render; MUST exist before any visual tuning. | D117 B3; D105 dev tools | M9 Phase 0, before any visual tuning | 3871–3873 |
| S110 | D117 B4: the derivation engine — incremental protocol, axes (F4–F7 with the D116 pins), stage clock (B1–B5 with the D116 values), banking + tier schedule (D092/D095/D096). | D117 B4; derivation engine | M9 Phase 0 | 3874–3877 |
| S111 | D117 C (M9 Phase 1–2 — the organs): trunk/rings renderer, branches/twigs/forks (canopy rule), buds (D087), leaves (clusters + storage-leaf character), seasonal organ states (D095), adaptation manifests (D093/D116). | D117 C; organ renderers | M9 Phases 1–2 | 3878–3882 |
| S112 | D117 D (M9 Phase 3 — the visuals, order matters): D1 the trait-space 17-audit (Step 7) MUST precede the trait-driven visuals; D2 the archetype mockups — visual validation from the validated register numbers, the 19 paper-run archetypes as the gallery (gym-heavy year 6, sparse-stubborn's honest bare branches, balanced's first bloom, decade's old-growth, Mediterranean thin-by-design), heartwood language, cohesion check (D112 identity filters), deuteranopia + contrast gates (D111); D3 flowers/fruits/adaptations/seasonal-state visuals + ceremony language (D094) + why-panel copy engine. | D117 D1/D2/D3; L-15 placement (S053) | M9 Phase 3; D1 before D2 | 3883–3895 |
| S113 | D117 E (M9 Phase 4 — the navigation/feeds): the duality principle (D088 B) — each section UI as the local view of its organ (bud garden, sap monitor, orchard, garden). | D117 E; duality principle | M9 Phase 4 | 3896–3898 |
| S114 | D117 F (M9 Phase 5 — the anatomy views, VISION 16): root/stem/leaf cross-sections + the time-lapse replay (D097 yearly snapshots, the launch-day journey). | D117 F; anatomy views | M9 Phase 5 | 3899–3901 |
| S115 | D117 G (M9 Phase 6 — the review mode): the yearly review artifacts (rings + cross-sections + legend card). | D117 G; review mode | M9 Phase 6 | 3902–3903 |
| S116 | D117 H0: D-number collision — the ledger skill-install records D083/D084 collide with DecisionLog's already-recorded D083; the docs pass RENUMBERS the ledger pair (→ D118/D119) to avoid duplicate IDs. | D117 H0; DecisionLog numbering | Docs pass | 3905–3908 |
| S117 | D117 H1 (standing gate): seeded-data stress tests — the CODE version of the paper run: the 19 archetypes become the test fixtures; the tests must REPRODUCE the paper-run outcomes (stage timings, bank schedules, honest no-rings, anti-farm defeats, restore ratchet). | D117 H1; 19 archetypes as fixtures | M9 engine build (standing gate throughout) | 3909–3913 |
| S118 | D117 H2 (standing gate): the perf gates (F9) are milestone gates. | D117 H2; F9 perf gate | M9 milestone gates | 3914 |
| S119 | D117 H3 (standing gate): the coherence checks (axis signatures + identity filters across generated trees). | D117 H3; coherence checks | Throughout M9 | 3915–3916 |
| S120 | D117 H4 (standing gate): the deuteranopia + contrast passes (D111). | D117 H4; D111 | Throughout M9 | 3917 |
| S121 | D117 H5 (standing gate): the test strategy's acceptance criteria — the paper-run fixtures ARE the acceptance criteria. | D117 H5; test strategy | M9 test strategy (PLAN Step 9) | 3918–3919 |

---

### Footer

- **Line ranges covered (contiguous):** full ledger `TEMP-PLANNING.md`
  (lines 1–3922) read in full; instructions extracted from the contiguous
  span **lines 25–3919** (non-instruction spans — WHAT/product content —
  excluded). The D117 handoff tail (lines 3920–3922, LANDS) contains no
  separate instructions beyond those listed.
- **Total instruction count: 121** (S001–S121).
- **Milestone/unbuilt-gate-dependent instructions (kept here with their
  target milestone — NOT dropped as "future"):**
  - **M9 (Life Tree milestone) — the largest cluster:** S053 (L-15
    placement → M9 Phase 3), S087 (session-plan steps 4–9), S088/S089
    (launch-day replay + contract), S090 (cache rebuild), S093/S094
    (dev tools + derivation protocol), S097 (deuteranopia gate), S098
    (blush tuning), S099 (17-audit), S102 (register freeze), S103
    (botanical-contradiction check), S107–S115 (the M9 phase order:
    engine foundation → organs → visuals → navigation → anatomy →
    review), S117–S121 (standing gates H1–H5), and S104/S105/S106
    (PRE-M9 opportunistic: docs-pass register, owner contracts, copy
    pass).
  - **M7 (Analytics & Gamification):** S031 (F-25), S033 (F-27), S060
    (C-07), S085 (tree depends on M7 feeds), S105 (qualifyingEntry +
    streak owners with M7).
  - **Coach rule-book session (M8 planning):** S014 (engine-2 test
    plan), S015 (LLM access mechanics), S027 (F-19/F-20 load unit),
    S061 (C-12), S063 (C-14), S075, S076, S081 (leftover coach
    candidates).
  - **M3 / M3+ / M3b (Nutrition):** S034 (N-09 at build), S036 (M3b
    milestone), S038 (N-10 two-scope build order), S039 (N-17
    born-ready engine), S040 (N-07 scope split).
  - **M6 (Calendar & Periods):** S069 (atlas leftover), S105
    (dayActivityScore owner with M6).
  - **M5 (Goals & Tasks):** S105 (goalProgress owner with M5).
  - **M4 (Routine & Briefing):** S045 (L-13 scope + future-only edits).
  - **M1 (Journal):** S020 (J5 long-horizon page), S055 (J5 hidden
    memories), S062 (C-13 after J1 ships).
  - **M10–M13 (Drive P2/P2.5/P3):** S078 (encrypted export), S095
    (formatVersion 3 + viewed_moments), S105 (mediaPresence owner).
  - **UI/UX ordering pass (planned pass, not a milestone):** S049
    (L-14), S068 (command palette), S071 (default-inbox), S074 (goal
    ring), S086 (tree tab placement).
  - **Real-use-triggered (no milestone):** S072 (one-entry-per-day —
    catch-up spirals in real use), S073 (smart-fill — habits/grace v2
    work), S080 (quote-old-self — C-08 links ship).