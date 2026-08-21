# M0 Scope Gap Review — 2026-08-21 (temporary review doc)

Purpose: document exactly what M0 requires (per docs), what is implemented, what
is deferred/missing, and the decision on each gap. Supersedes nothing; the UI
overhaul plan will absorb the accepted gaps. Reviewed against: Roadmap.md,
UIUX.md, MediaStorage.md, StorageDecision.md, CoachSystem.md, Database.md,
Architecture.md.

## 1. M0 scope (verbatim anchors)

Roadmap.md M0: "Dashboard, Journal (text + photos + long-form vlogs with
capture-time compression), Habits (daily check-ins + simple streaks),
Export/Restore, Coach stub (3-miss rule), storage meter + warnings."

Exit criteria: PWA persistence on iPhone; camera + MediaRecorder on device;
offline core loop; export→wipe→restore identical; storage meter real + 70/90
warnings; coach stub after 3 missed days; storage decision locked.

## 2. Implemented (verified green)

| Area | Status |
|---|---|
| Data layer: full M0 schema (v1), event log (indexed), one-write-path repositories | DONE |
| Drift + SQLite-WASM bootstrap (wasm + worker, DriftWebOptions) | DONE |
| Dashboard shell: responsive nav (bottom bar / left rail), block order per UIUX | DONE |
| Today section: habit ticks (one-tap) | DONE (no quick-capture input yet) |
| Coach daily note block (neutral or nudge line) | DONE |
| Goal progress / Today's tasks / Streak-XP placeholders (honest empty states) | DONE |
| Storage meter block (placeholder until Phase 7, now real) | DONE |
| Habits: create/edit/archive, one-tap check-off, simple streak | DONE |
| Habit detail: recent 7/30-day indicator | MISSING (small) |
| Journal: timeline grouped by day, compose (title/body/area/tags/timestamp), edit/delete (tombstones) | DONE |
| Photo capture (image_picker, camera-first) | DONE |
| Vlog capture: MediaRecorder, 720p cap, 2 Mbps cap, duration stamped once | DONE |
| Media persisted via MediaRepository (blob column), media.added/removed/vlog.deleted events | DONE |
| Export/Restore: PersonalOS-backup v2 JSON + sha256 manifest + media files, full-replace, soft failures, newer-schema refusal | DONE |
| D021 recovery: boot integrity check → recovery screen (export/restore) | DONE |
| Coach stub: idempotent habit.missed evaluator, 3-consecutive-miss rule, trailing-run only, deduped output | DONE |
| Storage meter: real usage (estimate + non-adopted media bytes), 70/90 warnings, export action | DONE |
| PWA assets: manifest, icons, standalone; release build ships service worker | DONE (iPhone verification pending) |

## 3. Gaps — M0-scoped but missing (the review decision: ALL FIXED in the UI overhaul workstream, before M0 exit)

| # | Gap | Doc anchor | Priority |
|---|---|---|---|
| G1 | Compose edit mode never loads the entry's existing attachments — saved media invisible on reopen (user-reported) | UIUX.md Journal (viewing) | HIGH (functional) |
| G2 | Journal timeline tiles show no media indication (no thumbnails/count) | UIUX.md Journal; MediaStorage opt. #4 | HIGH |
| G3 | No inline media viewing/playback — "media plays inline; object URLs resolved via MediaRepository" | UIUX.md Journal | HIGH |
| G4 | No Keep/Discard review screen after recording (with duration + optional title); discard semantics (vlog.deleted, zero trophies) | MediaStorage.md Vlog lifecycle | HIGH |
| G5 | No live camera preview during recording ("see it being recorded") | StorageDecision M0 test list #8 ("view it back") | MEDIUM (natural UX for G3/G4) |
| G6 | No thumbnail generation (background, non-blocking, ~10-20KB separate copy; thumbnailRef column exists) | MediaStorage.md opt. #4 + Tier 1 | MEDIUM |
| G7 | First-run welcome: 3-step (what PersonalOS is, create 2-3 habits, first journal entry) | UIUX.md Empty & First-Run States | MEDIUM |
| G8 | Journal quick-capture inside Today (dashboard one-tap entry) | UIUX.md Today fusion (L154) | MEDIUM |
| G9 | Habit detail: recent 7/30-day indicator (simple dots, no charts) | UIUX.md Habits | LOW |
| G10 | Coach line deletable (auto-written + deletable rule) | CoachSystem.md philosophy | LOW |
| G11 | Imported external video files preserved as-is (file picker path) | MediaStorage.md capture pipeline | LOW |

## 4. Deferred deliberately (documented decisions — NOT missing M0 scope)

| Item | Why deferred | Anchor |
|---|---|---|
| Briefing card / routine slots / macro-gap bar in Today | Routine + nutrition are M1/M2 surfaces; Today fuses what exists (habit ticks now; quick-capture G8 added) | UIUX.md L154; Database.md routine |
| Streak/XP real block (zero-XP consistency marker) | Gamification is M2 (D063 marker rides it) | Roadmap M2 |
| Settings groups 1-6 (General/Coach/Fitness/Nutrition/Calendar/Habits) | H4: groups render only when their feature data exists | UIUX.md Settings (L253) |
| Vlog local buffer nudges (3-5 day archive prompts) | PC-archive tier is P3/desktop; nudge wiring lands with the vault browser | MediaStorage.md Vlog Local Buffer |
| Light theme option | "theme-able from day one" satisfied by dark-first + swappable seed; full theme toggle in overhaul (cheap) | UIUX.md Typography |
| Migration v1→v2 path | Nothing shipped pre-v1; M1 adds the first real versioned migration | Database.md migrations |
| Archived-to-PC adapter path | Desktop vault / PC archive is P3 | MediaStorage.md Tier 3 |

## 5. Decision record

1. G1–G6 (media surface: load-existing, tiles, playback, review screen, live
   preview, thumbnails) are **M0 scope and must land before M0 exit** — they are
   folded into the UI overhaul workstream as one coherent media-surface pass.
2. G7 (first-run welcome) lands with the overhaul (it is the first-run surface).
3. G8–G11 land with the overhaul where they touch touched screens; low-priority
   ones (G10, G11) may slip to M1 if the overhaul is at risk — flagged, not
   silent.
4. Section 4 items stay deferred as documented; no re-opening without a
   DecisionLog entry.
5. Phase 8 exit criteria remain the gate; G1–G6 are pre-conditions for the
   "view it back" / persistence legs of the gate.

Supersedes: the earlier "deferred inline viewing" note in the M0 plan
(2026-08-21-m0-core-loop-mvp.md Phase 4 step 4.4). This review is the decision
record until the overhaul plan supersedes it.