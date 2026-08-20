# PersonalOS — Roadmap

Milestones with exit criteria. Work only the current milestone. Every milestone
ends with: backup exported, tests green, docs updated, DecisionLog updated.
Milestone re-ordering and re-scoping in this file are the authorized edits from
docs/StructuralImpactProposal.md §7 (Stage C verdicts, 2026-08-20).

## Drive Phasing (referenced below)

- **P1 — Manual export/import (local files):** MVP. Already part of Milestone 0.
- **P2 — Backup integration:** JSON backups upload to private Google Drive folder.
- **P2.5 — Media sync after plain-data sync (see Milestone 5):** the old
  "synchronizes ONLY media_attachments metadata + thumbnails" claim is
  replaced — the full data-sync plane (Milestone 4) ships first, and P2.5
  shrinks to **big media blobs only**, using the same D019 mechanism.
- **P3 — Media Vault sync (Milestone 6):** full media blob sync; Drive becomes
  the vault for small media (photos, short clips); long vlogs are handled by the
  PC archive tier, not the 15 GB vault. Unchanged from the original P3 scope,
  but now sequenced after P2.5.

---

## Milestone 0 — Core Loop MVP

**Scope:** Dashboard, Journal (text + photos + long-form vlogs with capture-time
compression), Habits (daily check-ins + simple streaks), Export/Restore, Coach
stub (3-miss rule), storage meter + warnings.

**Includes:** the storage spike (this is where the backend is tested and locked)
per `StorageDecision.md`.

**Exit criteria:**
- PWA Persistence Test passes on iPhone (install → create data → close →
  restart device → reopen → data present).
- Camera capture + MediaRecorder vlog recording work on device.
- Core loop works offline (airplane mode): journal, habits, dashboard, export.
- Export → wipe → restore round-trip restores identical data.
- Storage meter reflects usage; 70%/90% warnings appear.
- Coach stub line appears after 3 consecutive missed habit days.
- Storage decision LOCKED in DecisionLog (before M1).

**Gate:** no later milestone may start without this passing.

---

## Milestone 1 — Goals & Tasks

**Scope:** Goals (milestone-based, deadlines), Tasks (due dates), Life Area
wiring everywhere, journal ↔ goal linking, `task.completed` events. Journal
text stays manual structured entry; journal free-text parsing is explicitly
deferred — real NLP stays out ("AI optional, never required" per DecisionLog
D004). Fitness build order: workout side (incl. phases) FIRST, macros after
(DecisionLog D041). Rule-based paste auto-assort (offline, NO AI) ships M1-or-M2.

**Goals (DecisionLog D048):** goals gain kind `generic | weight | strength`
from the start (additive nullable columns only — kind, exerciseId?,
targetValue?). Broad weight goals reuse the existing M1 `goals` system ("reach
75kg by <date>") — NOT a new system: progress auto-computed from body_metrics
rolling weight, pace = remaining kg ÷ remaining days, deadline grading.
Strength goals = an exercise FK (must be tracked) + target est-1RM + targetDate;
baseline = best est-1RM at creation; progress auto-computed; pace graded like
phases; est-1RM ≥ target → the existing goal.completed; deadline miss =
"missed by X kg". Estimates are labeled. Goal ↔ phase consistency: creating a
weight goal auto-proposes a matching phase and vice versa (one-tap link); a
conflict warning fires if the active phase contradicts the goal.

**Goal progress (DecisionLog D049):** computed ONLY — a real-time derivation,
never a stamp; one owner per goal kind (weight: rolling weight vs
start/deadline; strength: est-1RM vs target). The write-path `goal.progress`
event is RETIRED — only the rare user-declared goal.completed remains. Goal
cards also show a derived projection line (DecisionLog D050): the deadline plus
"at current pace → ~date" (weight: rolling-trend extrapolation; strength:
est-1RM regression) with honest-estimate labeling — needs ≥2wk data else "more
data", stale/deload = uncertain, always derived never stored; also a line in
the phase close report.

**Exit criteria:**
- Create goal with milestones; goal progress is computed-only via the goal-kind
  owner — no `goal.progress` event.
- Tasks complete offline and sync state remains consistent (no sync yet).
- Dashboard shows real goal/task blocks (replaces placeholders).
- Events for M1 types documented and exported in backups.

---

## Milestone 2 — Gamification & Full Coach

**Scope:** Gamification engine (XP, levels, streaks with grace, first
achievements) per `Gamification.md`; Analytics Engine; full rule-based Coach
(strictness modes, weekly check-in) per `CoachSystem.md`; journal text analysis
(English, rule-based). Weekly-review-day config, milestone-review cadence, and
the reviews-give-no-XP ruling are M2-time items (DecisionLog D059). M2 is
sequenced: features planned → Coach rule-book session → UI/UX ordering pass.
Phone↔PC parity applies from M2 (DecisionLog D060): every feature/screen exists
on both platforms EXCEPT the PC archive (folder adoption + vault browser incl.
J7 video library — PC-only, because the files live on the PC). Capture is NOT
phone-exclusive (webcam / file import). Both devices read the same H3 owners so
a number never differs; offline behaves identically on both.

**Exit criteria:**
- XP/streak rules unit-tested; no XP for app-opening or empty entries.
- Coach generates daily note, nudges, and the merged weekly check-in (the
  weekly review is a section of it, never a separate surface); strictness modes
  change thresholds and tone.
- Coach outputs stored/exported in `coach_outputs`.
- Dashboard streak/XP block live.

---

## Milestone 3 — Drive P2: Backup Integration

**Scope:** Google OAuth (personal app, no verification), Drive upload of JSON
backups, restore-from-Drive option. Cloud remains optional.

**Exit criteria:**
- Backup auto-upload on schedule + manual button; offline fails safe.
- Restore from a Drive backup into a fresh install works.
- OAuth token refresh handled; no data loss on failure.

---

## Milestone 4 — Entity Sync Plane

**Scope (required, DecisionLog D059):** true cross-device entity sync for
plain-text/stat entity data (phone ↔ PC), required before any multi-device
phase. Mechanism (DecisionLog D019): the event log is an append-only UNION of
distinct event ids; same-entity edits resolve by last-writer-wins on timestamp,
with deviceId breaking exact ties. TOMBSTONE RULE: a delete ALWAYS wins over an
earlier-timestamped edit arriving late from another device — an entity never
resurrects. The plane does NOT change the storage backend (locked at M0).
One-writer-per-device stays the base assumption; no existing behavior is
re-derived because sync exists. Settings Group 8 (sync skeleton) renders only
after this milestone ships.

**Exit criteria:**
- Phone → PC round-trip of entity edits converges via the append-only event
  UNION (distinct event ids only, no merge).
- Same-entity concurrent edits resolve deterministically (LWW by timestamp,
  deviceId tiebreak); deletions never resurrect (tombstone wins).
- Offline behaves identically on both devices; queued additions replay on
  reconnect.
- Backend decision unchanged; no new cloud architecture.

---

## Milestone 5 — Drive P2.5: Media Blob Sync

**Scope:** with plain-data sync shipped in Milestone 4, P2.5 shrinks to **big
media blobs only** — the previous "synchronizes ONLY media_attachments metadata
+ thumbnails" claim is replaced. Same D019 mechanism for both. Full media
blobs transfer across the user's devices (phone + PCs) via the lightweight
Drive data pool; deviceId-flagged foreign-device items surface as stubs (see
`MediaStorage.md`).

**Exit criteria:**
- Big media blobs sync between iPhone and a PC; plain-text/stat entity data is
  already covered by the Milestone 4 plane.
- Vault browser shows items archived on another device as view-only stubs
  ("stored on [device], not this device") — never broken links.
- Local-only mode unchanged and fully functional (cloud optionality preserved).
- Reuses P2 OAuth/token mechanics; no new cloud architecture.

---

## Milestone 6 — Drive P3: Media Vault

**Scope:** MediaRepository cloud adapter; media upload with resumable uploads;
offload workflow (uploaded → free device space); on-demand re-download; storage
meter reflects vault state; tiered handling of long vlogs (manual archive
marker; desktop archive sink); full PC vault browser for archived media (per
`MediaStorage.md`).

**Exit criteria:**
- Record → auto-sync → offload → view-back (re-download) loop works on iPhone.
- 15GB capacity plan in place (tiered retention per `MediaStorage.md`).
- Local-only mode still fully functional (cloud optionality preserved).

**P3+ (future, not built now):** a bulk "migrate everything to Drive" operation
— loop through local/PC-archived media, upload each via `CloudMediaAdapter`,
update `storageRef`/`syncState` on each row, and optionally free local/PC
storage after confirmed uploads. Requires no new architecture beyond what is
already planned; scheduled only if the user gains more Drive storage.

---

## Milestone 7 — Future Systems

**Fitness surface is CLOSED (DecisionLog D060):** no new features for the
fitness side — the surface is complete (workouts, sets, exercises, templates,
plans, phases, PR, vault, PO, cardio, volume, deload, injuries, adherence,
goals, habits bridge, check-in, phase report; media deferred). N3/N5/N6/N8 +
periodization remain park-able; rest-day patterns (F2) + recovery readiness
(N5) cover rest from M3+; add only when real usage says so.

Candidate order (decision required before each):
- **Fitness:** specified in full (see `Database.md`, `Architecture.md`,
  `Gamification.md`) — workouts/templates/sets, exercises + muscle groups, PR
  vault, volume, cardio, phases, goals; emits `workout.completed` events; maps
  to Health area. No Apple Health.
- **Study:** sessions, subjects, revision tracking; Learning area.
- **Productivity refinement:** routines, projects.
- **Nutrition:** specified in full (see `Database.md`, `Architecture.md`) —
  phases/energy balance, receipt-line meal logging, food lookup, settings. AI
  food scanner explicitly not planned.
- **AI Adapter:** optional LLM-powered reflections (never required).

Each system must: plug into the event ecosystem + Life Areas, pass the same
MVP-quality bar, and justify itself against the Core Loop.

**Idea park (recorded, NOT a spec):**
- **Life Tree (DecisionLog D071):** a dedicated full tab with a large stylized
  life-tree graphic that actively grows as everything is logged and achieved
  (Growth-Rings / 10-ring structure — one ring = one Life-Fully-Logged
  qualifying yearly window; reflects all domains and achievement tiers, Sprout
  → Grove). Confirmed premises only: 100% derived from real qualified
  non-imported history (an Analytics-Engine-derived cache, M2) — never a
  write-path entity, no new tables, imports never grow it, nothing
  user-editable, no XP anywhere; rings never shrink; no guilt UI (a thin domain
  looks young/dormant, never "failed"). Placement/wireframe/paint strategy/art
  style/interaction are all decided during the M2 build; mockup in the UI/UX
  pass. Scope: M2 — blocks nothing in M0/M1.

---

## Milestone 8 — Graph/"Brain" View (under consideration — NOT scheduled)

Obsidian-style visual graph of the life data: nodes are entities (journal
entries, habits, goals, projects, life areas); edges are explicit user links
(mentions / part-of / related) via a future `links` table — a small schema
addition, not a rewrite (DecisionLog D023).

- Placement: post-M1; no earlier milestone depends on it.
- Rendering approach OPEN: pure-Dart force-directed package vs JS interop to
  d3-force.
- Zero impact on M0 scope and on the storage decision.
- Not locked: do not build, do not design beyond the stub, until this
  milestone is explicitly scheduled.

---

## Milestones vs Principles (guardrails)

- Every milestone keeps: offline-first, data ownership (export/restore), cloud
  optionality, $0 budget, no boundary violations.
- If a milestone would require violating a non-negotiable principle, the
  milestone is wrong — redesign it.
