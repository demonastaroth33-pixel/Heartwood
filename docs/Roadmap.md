# PersonalOS — Roadmap

Milestones with exit criteria. Work only the current milestone. Every milestone
ends with: backup exported, tests green, docs updated, DecisionLog updated.

## Drive Phasing (referenced below)

- **P1 — Manual export/import (local files):** MVP. Already part of Milestone 0.
- **P2 — Backup integration:** JSON backups upload to private Google Drive folder.
- **P2.5 — Metadata & thumbnail sync (new, see Milestone 4):** synchronize only
  `media_attachments` metadata rows and thumbnail blobs (~10–20 KB each) via a
  lightweight Drive data pool. Cheap enough to ship before full media sync, and
  it alone solves the "phone and PC show different local state" problem. The
  multi-device metadata visibility from `MediaStorage.md` (deviceId-flagged
  items shown as stubs on other devices) depends on this phase, not on P3.
- **P3 — Media Vault sync (Milestone 5):** full media blob sync; Drive becomes
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
wiring everywhere, journal ↔ goal linking, `goal.progress`, `task.completed`
events.

**Exit criteria:**
- Create goal with milestones; progress events flow to event log.
- Tasks complete offline and sync state remains consistent (no sync yet).
- Dashboard shows real goal/task blocks (replaces placeholders).
- Events for M1 types documented and exported in backups.

---

## Milestone 2 — Gamification & Full Coach

**Scope:** Gamification engine (XP, levels, streaks with grace, first
achievements) per `Gamification.md`; Analytics Engine; full rule-based Coach
(strictness modes, weekly review) per `CoachSystem.md`; journal text analysis
(English, rule-based).

**Exit criteria:**
- XP/streak rules unit-tested; no XP for app-opening or empty entries.
- Coach generates daily note, nudges, weekly review; strictness modes change
  thresholds and tone.
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

## Milestone 4 — Drive P2.5: Metadata & Thumbnail Sync

**Scope:** lightweight Drive data pool that syncs only `media_attachments`
metadata rows and thumbnail blobs across the user's devices (phone + PCs). Full
media blobs stay device-local. Introduces the `metadata-synced` syncState and
surfaces deviceId-flagged foreign-device items (see `MediaStorage.md`).

**Exit criteria:**
- Media metadata + thumbnails sync between iPhone and a PC; full-size blobs do
  not transfer in this phase.
- Vault browser shows items archived on another device as view-only stubs
  ("stored on [device], not this device") — never broken links.
- Local-only mode unchanged and fully functional (cloud optionality preserved).
- Reuses P2 OAuth/token mechanics; no new cloud architecture.

---

## Milestone 5 — Drive P3: Media Vault

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

## Milestone 6+ — Future Systems

Candidate order (decision required before each):
- **Fitness:** workouts, exercises, progression, measurements; emits
  `workout.completed` events; maps to Health area. No Apple Health.
- **Study:** sessions, subjects, revision tracking; Learning area.
- **Productivity refinement:** routines, projects.
- **Nutrition:** calorie/macro manual logging (AI food scanner explicitly
  not planned).
- **AI Adapter:** optional LLM-powered reflections (never required).

Each system must: plug into the event ecosystem + Life Areas, pass the same
MVP-quality bar, and justify itself against the Core Loop.

---

## Milestone 7 — Graph/"Brain" View (under consideration — NOT scheduled)

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
