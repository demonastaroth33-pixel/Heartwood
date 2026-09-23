# INPUT-INVENTORY — every feature, classified (Life Tree input map, Step 3)

**Scan date 2026-08-29. Revised 2026-08-29 (recursive audit passes 1-2 —
all CRITICAL/MAJOR findings fixed).** The complete feature surface of
PersonalOS, inventoried from the real docs and classified into the 7
input classes (SCHEMA §2.1). Each item: what it is, its input class,
and its tree mapping. Raw field-level detail lives in
`scan-outputs/` (7 briefs); this document is the tree-facing
classified inventory — exhaustive in coverage, nothing summarized.

> **The 7 input classes (the locked future-proofing rule):**
> 1 CONTENT ENTRIES (→ leaves; media-rich → storage leaves)
> 2 COMPLETIONS (→ bud bursts + extension growth)
> 3 MEASUREMENTS (→ vascular/sap system + branch wood quality)
> 4 DATED EVENTS (→ twig anchors / seasonal moments)
> 5 GOAL PROGRESS (→ fruit swelling / tendrils)
> 6 ACHIEVEMENT UNLOCKS (→ flowers, auto-tiered; see ACHIEVEMENT-SCAN.md)
> 7 PRESENCE/ABSENCE (→ rhythm axes, dormancy, twig production)

---

## 1. THE EVENT SPINE (the input backbone — 23 event types)

Every input lands in the event log; the tree reads the log, not the
UI. Event payloads are metadata-only (facts, never content).

| Event type | Status | Class | Tree mapping |
|---|---|---|---|
| habit.completed | IMPL | 2 completions | bud burst + extension |
| habit.missed | IMPL | 7 presence/absence | bud wither state, rhythm axis |
| habit.completed_revoked | DOC | 7 | bud state correction |
| habit.rest_planned | DOC | 4 dated event | streak freeze; bud scale (protected state) |
| journal.created | IMPL | 1 content | new leaf |
| journal.edited | IMPL | 1 content | leaf state update |
| journal.deleted | IMPL | 7 | leaf fall (honest) |
| media.added | IMPL | 1 content | leaf's media substance (storage-leaf character) |
| media.removed | IMPL | 7 | leaf media state |
| vlog.deleted | IMPL | 7 | leaf media state (tier-aware) |
| workout.completed | DOC | 2+3 | extension + gym branch wood quality |
| workout.pr | DOC | 4 dated event | branch girth event; strength-standards feed |
| workout.deleted | DOC | 7 | re-derivation; correction |
| nutrition.logged | DOC | 3 measurement | vascular/sap: meal → phloem; macros → sap composition; eating windows (N-15) → vascular fasting state |
| nutrition.removed | DOC | 7 | vascular correction |
| body.weighed | DOC | 3 measurement | vascular + branch wood density; weigh-in trend (canonical first-of-day) |
| body.weighed_revoked | DOC | 7 | correction |
| reflection.created | DOC (M2) | 1 content | leaf (journal family) |
| goal.completed | DOC (M1) | 5 goal progress | fruit on the branch's spur |
| task.completed | DOC (M1) | 2 completions | extension; fruit spur feeder |
| study.session | DOC (future) | 2+3 | classified when shipped |
| relationship.event | DOC (future) | 4+1 | classified when shipped |

Rules that constrain: immutable log, compensating revokes, tombstone
deletes; uncheckIn currently hard-deletes (M0 deviation — noted in the
data-layer brief); goal.progress was REMOVED (D049) — goal progress is
DERIVED, only goal.completed exists as a rare user-declared event.

## 2. DATA-LAYER ENTITIES (tables as input surfaces)

### 2.1 Implemented (M0, writable today)
journal_entries (occurredAt, words, tags, area, isImported, mood-free),
media_attachments (16 fields — sizeBytes, durationSec, mimeType,
title, contentHash, archivedOnDevice, adopted, syncState…), habits
(templates, schedules, patterns), habit_checkins, areas, settings,
events, coach_outputs, media_manifest (vestigial — never written).

### 2.2 Doc-specified, not yet in code (designed input surface)
Goals/tasks (M1), fitness/health (M1 — workouts, exercises, sets,
phases), nutrition (M1 — food log, macros, meals), deload/periods/
limitations, routine (day templates/week plans/performed days),
future links table (Graph view — alongside C-08 wikilinks, the
user-authored relationship surfaces).

## 3. JOURNAL SURFACE (locked C-series — ALL 6 + the M1 roadmap)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| Entry create/edit/delete (word count, tags, area) | IMPL | 1 | leaves |
| **C-03 AUTO-CONTEXT CAPTURE** — entries auto-gain context chips of the day from the event log (media of the day, workouts logged, habit status, body/weigh-in, return-after-gap, location (explicit per-entry), weather (pending sub-item)) | LOCKED | 1 | leaf metadata: the chip facts enrich the leaf's derived state |
| **C-05 MEMORY HYGIENE** — hide controls only (no destructive prompts) | LOCKED | 7 | leaf presentation state |
| **C-06 THEN & NOW SELFIE COMPARE** — physique photo compare (past vs present) | LOCKED | 1+3 | leaf + measurement: the body-domain leaf character |
| **C-08 WIKILINKS + UNLINKED-MENTION SUGGESTIONS** — user-authored links between entries | LOCKED | 1 | leaf relationship metadata (the tree's relationship surface alongside the future links table) |
| **C-09 GENTLE RETURN + PAUSE** — return-after-gap note ("first entry in 3 days", celebrates return, no shame); repair tokens REJECTED; pause states | LOCKED | 7 | return = twig revival moment; pause = honest dormancy state |
| **C-11 VOICE-NOTE ENTRY TYPE** — audio entries (audio now, transcription future) | LOCKED | 1 | leaf with audio substance (a leaf type, not a scrapped concept) |
| Import (journal import; isImported flag) | IMPL/DOC | 7 | NEVER counts as growth (import exclusion GLOBAL) |
| NL parser for capture (L-01, NOT C-03 — the ledger's NL feature is L-01) | LOCKED | 1 | leaf metadata (parsed facts) |
| Photo journaling (M1 J-family) | LOCKED | 1 | storage-leaf character (media-rich) |
| Physique photo timeline (M1) | LOCKED | 3 | branch character (body domain) |
| Yearbook (M1) | LOCKED | 4 | annual review artifact feed |
| Word counts: 20-word XP floor vs 40-word qualifying floor | LOCKED | 3 | leaf maturity thresholds |
| Areas (journal areas/domains) | IMPL | 4 | leaf placement |

## 4. HABITS SURFACE (D087 — habits are BUDS)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| Habit create/edit (template, schedule, pattern) | IMPL | 7 | new bud on the habit branch |
| Habit check-in (checkin row + habit.completed event, transactional) | IMPL | 2 | bud burst |
| Miss evaluation (habit.missed, idempotent) | IMPL | 7 | bud wither state |
| Uncheck-in (hard-deletes event — M0 deviation, noted) | IMPL | 7 | bud state correction |
| Planned rest flag (rest_planned, streak FREEZE) | DOC | 4 | bud scale (protected state) |
| Streak mechanics (1-day grace per 7-day window; grace-carried days never count for streaks) | LOCKED | 7 | bud swelling intensity |
| Week patterns (L-13: weekday/weekend, specific days, weekly cadence) | LOCKED | 7 | bud placement/cadence |
| Habit abandonment | derived | 7 | bud scar (honest record) |
| N-16 veggie servings + water habit check-ins (nutrition-surface habits) | LOCKED | 2 | bud bursts (nutrition branch) |

## 5. GYM / FITNESS SURFACE (ALL 25 locked F-series + M2 — D060 superseded by gen-2)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| **F-01 INLINE PREVIOUS-SESSION COMPARISON** | LOCKED | 3 | gym branch: last-session facts on the logging surface |
| **F-02 LOGGING-SCREEN ANATOMY** | LOCKED | 3 | the logging surface structure |
| **F-03 PR CELEBRATION CEREMONY** — functional rules locked; DESIGN LANGUAGE HELD for the Life Tree session | LOCKED | 6+4 | feeds the flower ceremony + bracts (the tree session owns the language) |
| **F-04 PLATE + WARM-UP CALCULATORS** | LOCKED | 3 | measurement aid (math must be solid) |
| **F-05 SET LABELS WARM-UP/WORKING/FAILURE** — the single most important honesty input (feeds F-08, F-12, F-10, adherence, coach vocabulary) | LOCKED | 3 | wood quality per set type |
| **F-06 PR GRID 1RM/2RM/3RM.nRM** | LOCKED | 3 | branch girth record |
| **F-07 FILTERABLE CALENDAR HIGHLIGHTS** | LOCKED | 7 | display only (calendar tint-only rule applies) |
| **F-08 MEV/MAV/MRV VOLUME BANDS + DECISION TABLE** — canonical numbers | LOCKED | 3 | volume bands → branch growth allocation |
| **F-09 EXPECTED-VS-ACTUAL EFFORT TABLE** — silent by default | LOCKED | 3 | the sole effort signal (F-21/F-22 rejected) |
| **F-10 TM ADJUSTMENT RULES ON EPLEY** — canonical numbers | LOCKED | 3 | training-max mechanics |
| **F-11 INACTIVITY DECAY + PR RESET-TO-BASELINE** | LOCKED | 7 | absence → branch dormancy; PR baseline resets |
| **F-12 GZCLP STAGE-CASCADE STALL RULE** | LOCKED | 3 | program-stage mechanics |
| **F-13 LIBRA EMA TREND + TREND/RATE/PREDICTION LAYERS** — "CRITICAL" input | LOCKED | 3 | the branch-girth metric candidate (F-18 DOTS claims the meta-score role) |
| **F-14 RATE-VS-TARGET BAR + WATER-JUMP DOTS** | LOCKED | 3 | weigh-in trend visualization (display) |
| **F-15 MILESTONE HERO RING + FORECAST RANGE + 2-WEEK COPY** | LOCKED | 4+6 | milestone events; hero-ring visual language (tree-adjacent) |
| **F-16 EYES-CLOSED + ONE-TAP WEIGH-IN** | LOCKED | 3 | frictionless weigh-in → body.weighed |
| **F-17 STANDARDS VAULT HONESTY** — population labels + BW multiples + source | LOCKED | 3 | strength-standards honesty (the lit mirror number) |
| **F-18 STRENGTH SCORE — IPF DOTS OVER THE BIG-5** — the ONLY meta score (F-30 folded) | LOCKED | 3 | branch girth meta-metric |
| **F-19 TRAINING FORM — CTL/ATL/TSB** (N5 revival, honest) | LOCKED | 3+7 | training load → growth vs rest balance |
| **F-20 RAMP-RATE GUARDRAILS + RECOVERY-TIME ESTIMATE** | LOCKED | 3+7 | recovery state → dormancy/revival timing |
| **F-23 PRE-SESSION ADAPT AFFORDANCE** | LOCKED | 2 | session-start affordance |
| **F-24 WEEKLY COACH MESSAGE DEPTH** (3-5 lines) | LOCKED | 7 | coach output cadence |
| **F-28 SETS-PER-MUSCLE-WEEK CHART + VOLUME HEATMAP** | LOCKED | 3 | volume heatmap → branch density display |
| **F-29 MOVEMENT-BALANCE RATIOS** | LOCKED | 3 | movement balance → fork structure (push/pull/legs differentiation) |
| **F-30 NSPI-STYLE COMPOSITE — FOLDED** (DOTS is the ONLY meta score) | LOCKED | 3 | no second meta-score |
| Strength standards (the lit mirror number) | LOCKED | 3 | gym branch girth trend |
| Bulk/cut/maintenance phases (user-named; N-17 diet-mode scopes re-derivation NOW) | LOCKED (concept) | 3+4 | phase states → wood character (bulking = growth season, cutting = density); the schema's phase mapping rows |
| Warm-up sets (N3→F-05) | LOCKED | 3 | set-type character |
| Recovery (N5→F-19) | LOCKED | 7 | dormancy/recovery state |
| Strength-vs-heatmap order (L-14) | LOCKED | 7 | branch display order (heatmap vs strength view) |
| Fitness inputs are FINITE as of M2 (D060 closure, gen-2 supersession) | LOCKED | — | the gym surface has a closed input budget |

## 6. NUTRITION SURFACE (ALL 18 locked N-series — the vascular system, user-wired)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| **N-01 HISTORY/RECENT-FIRST LOGGING + PROVENANCE BADGES** | LOCKED | 3 | sap entry provenance |
| **N-02 USDA FDC SEED + PRIVATE NAMESPACE — TIERED DATA ARCHITECTURE** (local mirror accumulation + online pass-through) | LOCKED | 3 | sap data quality tiers |
| **N-03 ADHERENCE-NEUTRAL COMPLIANCE MATH** | LOCKED | 3 | neutral math — no shame signals |
| **N-04 PLAN-CONFIRM LOGGING + GAP REBALANCE** | LOCKED | 3+5 | plan-vs-actual at the meal level |
| **N-05 PACK MODEL — RECIPE → BATCH → CONTAINERS → CONSUME** (mixed-unit) | LOCKED | 3 | the pack pipeline feeds sap quantity |
| **N-06 FREE-FOODS LIST** | LOCKED | 3 | low-friction logging → sap entry |
| **N-07 IMPLIED-TDEE INSIGHT** (D1–D7 approved) | LOCKED | 3 | the tree's metabolic budget |
| **N-08 EXERCISE KCAL DISPLAY-ONLY** | LOCKED | 3 | display-only measurement |
| **N-09 BARCODE SCANNER** (APPROVED; photo-AI scanner rejected, D069) | LOCKED | 3 | logging friction → sap entry |
| **N-10 ONE-TIME RECIPE SUBSTITUTION** | LOCKED | 3 | sap variety |
| **N-11 GRAM-ANCHORED PORTION STEPPER UX** | LOCKED | 3 | portion precision → sap accuracy |
| **N-12 DENSITY FACTS AS NEUTRAL COACH LINES** | LOCKED | 3 | density → sap composition facts |
| **N-13 ESTIMATE-FRAMING + TAP-TO-EXPLAIN** | LOCKED | 3 | the why-panel precedent (tap-to-explain) |
| **N-14 PER-MEAL PROTEIN PACING COACH FACTS** | LOCKED | 3 | protein pacing → sap composition |
| **N-15 EATING-WINDOW AWARENESS** (fasting) | LOCKED | 3+4 | vascular fasting state (window ring/timer patterns) |
| **N-16 VEGGIE SERVINGS + WATER HABIT CHECK-INS** | LOCKED | 2+3 | bud bursts (nutrition branch) + sap volume |
| **N-17 DIET-MODE RE-DERIVATION — FUTURE-CAPABILITY SCOPED NOW** (bulk/cut/maintenance) | LOCKED | 3+4 | THE phase system: diet modes → wood/vascular character |
| **N-18 VENDOR-RESILIENT EXPORT FOR FOODS/RECIPES** | LOCKED | 7 | export robustness, no growth |
| Micronutrients (M3b milestone) | LOCKED | 3 | sap richness detail |
| Meal plans/recipes (surface) | LOCKED | 3 | sap variety |

## 7. GOALS / TASKS SURFACE (M5/M1 — fruits on spurs + tendrils)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| Goal create (title, target, deadline, milestone breakdown) | LOCKED (M5) | 5 | spur appears; tendril reaches (long-horizon) |
| Goal progress (AUTO-UPDATED from connected data — the derived model; goal.progress event REMOVED, D049) | LOCKED | 5 | fruit swelling (derived) |
| Goal completion (goal.completed, rare user-declared) | LOCKED | 5 | fruit hangs on the spur |
| Task completion (task.completed) | LOCKED | 2 | extension + spur feeder |
| Milestones (within goals) | LOCKED | 5 | fruit stages |
| Pace line visualization (L-03) | LOCKED | 5 | fruit's pace: on/off-track states |
| Post-run expected-vs-actual report (L-05) | LOCKED | 5 | plan-vs-actual → growth vs plan |
| Plan-vs-actual day-view line (L-06 — the signature feature) | LOCKED | 5+7 | the day line |
| Neutral deviation badges (L-08) | LOCKED | 5+7 | deviation shown neutrally |
| 2-day slip indicator + logbook won-archive (L-02) | LOCKED | 2+5 | slip handling; won-archive = fruit history |
| 10-year pledge / long-horizon goals | LOCKED (concept) | 5 | tendrils reaching outward |

## 8. ROUTINE / PERIODS / CALENDAR SURFACE (M4/M6 — the seasonal layer)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| Day templates / week plans (M4 routine; L-13 week-pattern scheduling) | LOCKED | 7 | branch cadence structure |
| Performed days (plan-vs-actual) | LOCKED | 5+7 | day-line; growth vs plan |
| Briefing card (pre-loads today's template) | LOCKED | 7 | twig anchors |
| Calendar month/day/year views (M6; TINT-ONLY rule — no glyphs on day cells) | LOCKED | 4+7 | the calendar feeds DATED EVENTS; tree state must flow through the locked H3 dayActivityScore owner, never independent presence |
| Year heatmap (M6) | LOCKED | 7 | ring/year summary surface |
| Periods (deload/periods/limitations) | DOC | 3+7 | seasonal rhythm |

## 9. COACH SURFACE (117 inventoried items → classes; mycorrhizal symbiosis feed)

| Input group | Class | Tree mapping |
|---|---|---|
| Check-ins (types, fields, cadence) | 2 completions | mycorrhizal engagement; bud-like interactions |
| Coach outputs — the 9 REAL kinds (verbatim from the brief): daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert | 7 (output, not user input) | the symbiont's voice; the tree mirrors H3 OWNERS ONLY — it NEVER touches coach_outputs rows (D110 payload-blindness) |
| User actions toward coach (delete, quiet-week, rest-flag, goal-declaration, opt-ins, annotate, tap) | 2+4 | the coachEngagement owner (H-03/D110): opt-ins, deletes, annotates NEVER feed it - check-ins + taps only |
| Coach-generated metrics/summaries (analytics windows, strictness modes) | 3 | ONLY the derived owners feed the tree (engagement, check-in dates, the anniversary) - never the outputs' text (D110) |
| Anniversary anchor (D102: THE SHARED frozen anchor — the first in-window event; never shifts; the Coach's milestone review and the tree's birth read the SAME value) | 4 | one birthday for the whole app (D102/D114) |
| L-10 rule-based cross-domain insight engine (locked) | 7 (derived) | STOLONS: cross-domain influences made structural (D088 row 11) |
| CONSTRAINTS: coach never sees journal text (even with M2 opt-in — metadata only); no ratings/replies/follow-ups; one coach line at most per trophy fire; quiet-week silences | — | the tree inherits the same facts-only discipline |

## 10. MEDIA SURFACE (PROOF OF LIFE — leaves hold the memory's substance)

| Item | Class | Tree mapping |
|---|---|---|
| Photos attached to entries | 1 | leaf substance (storage-leaf character) |
| Vlogs (video — tier-aware delete) | 1 | leaf media |
| VOICE-NOTE ENTRIES (C-11 — LOCKED; audio entries are a real input surface) | 1 | leaf with audio substance |
| Vault folder tree + metadata (rich fact surface: sizeBytes, durationSec, mimeType, title, contentHash, archivedOnDevice, adopted, syncState) | 3+1 | media state on leaves |
| Storage limits + compression (15 GB Drive ceiling; vlogs ~35 GB/yr → PC-archive primary) | 3 | media presence bounds |
| Thumbnails | 3 | leaf preview state |
| Adopted media (adopted flag; adopted = no XP) | 7 | leaf adoption state |
| Discard wipes / corrupt duration = NULL "never counts" / no estimates | 7 | honesty rules: stubs never fabricate |
| Media stubs in derived surfaces (view-only / file-missing / soft-failure) | 7 | the tree shows stubs, never content |
| Quick captures (photos/voice rapid capture — C-11 voice included) | 1 | leaf character (capture style) |
| Drive sync (CloudMediaAdapter — M3-M5) | 3 | media availability state |

## 11. CHECK-INS / SETTINGS / BACKUP (misc inputs)

| Item | Class | Tree mapping |
|---|---|---|
| Habit check-ins (the check-in surface) | 2 | bud bursts |
| Settings edits (15+ keys: strictness, coach opt-ins, units…) | 7 | never growth; tree ignores |
| Backup/export (formatVersion 2; restore) | 7 | restores the life — the tree re-derives from the restored log; NEVER growth itself |
| Weigh-in canonical rule (first-of-day wins) | 3 | measurement canonicalization |
| MET calorie formula / 7700 kcal/kg (hard-coded, non-togglable) | 3 | derived measurement constants |

## 12. UI INTERACTIONS (≈40 data-producing interactions — the capture surfaces)

Interactions that PRODUCE data: entry compose/save, photo attach,
voice/quick capture (C-11), habit check/uncheck, workout set entry,
PR moment, meal log, barcode scan, eating-window start/end, weigh-in,
goal declaration, task complete, check-in respond, rest-flag, import,
media add/remove, capture from vault, wikilink creation (C-08), etc.
— each already classified by its feature row above. Interactions that
NEVER produce growth (by the locked forbidden list): opening the app,
browsing, empty saves, retroactive logging, imported content,
settings edits, cosmetic actions.

## 13. FUTURE SURFACE (M1–M13 + future systems — classified now, mapped on arrival)

Planned milestones: M1 journal features (J1–J6 + physique photos),
M2 fitness & body, M3 nutrition & energy balance, M4 routine &
briefing, M5 goals & tasks, M6 calendar & periods, M7 analytics
engine & gamification, M8 full coach, **M9 Life Tree (the tree itself
— roadmap lines 876–901)**, M10–M13 Drive backup/media sync/vault,
future systems (candidate order pending), idea park (recorded, not a
spec), Graph/"Brain" view (under consideration — the links table is a
user-authored relationship surface alongside C-08 wikilinks).
Skipped-but-reopenable inputs: C-07, C-10, C-12, C-13, C-14, F-25,
F-26, F-27 (agreed-in-principle), N3/N5 already re-opened (→F-05,
F-19). Pending: C-15 (deferred to the tree section).

### 13.1 The L-series display/governance surface (applies to the tree's OWN UI)

| Feature | Status | Class | Tree mapping |
|---|---|---|---|
| **L-07 SHOW-IF-NOT-EMPTY BLOCKS** | LOCKED | 7 | display rule — the tree's own blocks collapse/disappear per show-if-not-empty (the dashboard precedent) |
| **L-09 PER-BLOCK SKELETONS, RETURNING-USERS-ONLY** | LOCKED | 7 | the shimmer rule — the tree render is exactly the "heavier derived block → skeleton shimmer, never blocks first paint" class |
| **L-11 SPRAWL GUARDRAIL** (the three checks: surface-worthiness, schema discipline, sprawl test) | LOCKED | 7 | governance — applies INSIDE the tree (every tree feature must earn its place; D088 forks, adaptations, and UI elements all pass it) |
| **L-12 NUMBERS>CHARTS GLANCE / CHARTS>NUMBERS ANALYSIS** | LOCKED | 7 | display preference — the tree's glance = numbers-led, analysis = charts-led |
| **L-15 LIFE-SCALE GRID** | LOCKED (design feed) | 7 | DESIGN FEED for the tree session (weeks-as-cells grid family; placement decision deferred to the tree design session) |

### 13.2 L-01 placement note
L-01 (natural-language capture + curated today) is the goals-domain
capture surface (not journal) — it sits at §7/§13.1 territory; its
class is 1+2 (content + completions).

CLASSIFICATION RULE (locked): every future feature classifies its
inputs into the 7 classes at design time — inherited mapping, zero new
decisions. New achievements auto-tier via ACHIEVEMENT-SCAN.md. Only a
genuinely unprecedented input class is a DecisionLog event.

## 14. THE CONSTRAINT REGISTER (what the tree CANNOT read)

- NO mood tracking (C-04 REJECTED — mood-proxy derived-only; L-10
  uses journal presence/word counts as proxies; pitcher/snap-trap
  adaptations remain underivable for this reason)
- NO user-effort input (F-21/F-22 rejected — F-09 expected-vs-actual
  is the sole effort signal)
- NO meal-estimation from photos (D069: photo-AI scanner rejected;
  barcode approved only)
- Imported content NEVER counts as growth (global exclusion)
- Coach never sees journal text (even with opt-in — metadata only)
- The tree never shows content: media stubs, facts-only, no journal
  text, no media in derived surfaces
- Gold = streaks only (never achievements)
- Calendar is tint-only: tree state flows through the locked H3
  dayActivityScore owner — no independent calendar presence
- Zero XP for trophies; derived-only everything; no claim tables
- The one-notification constraint is NOT documented in UIUX/Coach
  docs (flagged ambiguity — verify at the input map step)
- Quick-capture style: aerial-roots adaptation is SCRAPPED (user) —
  quick captures feed leaves only
- The tree's seed date = THE SHARED frozen anchor (D102 — the first
  in-window event; never shifts; the Coach reads the SAME anchor) —
  no events = no tree (first birth only; existence is monotonic once
  born, D114)

## 15. CLASSIFICATION SUMMARY

| Class | Major feeds | Tree destination |
|---|---|---|
| 1 content entries | journal (C-03/C-06/C-08/C-11), media, vlogs, voice notes, reflection | leaves (+ storage-leaf character) |
| 2 completions | habits, tasks, check-ins, N-16 check-ins, F-23 | buds, extension |
| 3 measurements | gym (F-01…F-30), nutrition (N-01…N-18), body, phases | vascular/sap + wood quality |
| 4 dated events | PRs, rest flags, milestones, anniversary, F-15 | twig anchors, seasonal moments |
| 5 goal progress | goals, tasks, plan-vs-actual (L-02/03/05/06/08) | fruits, tendrils, spurs |
| 6 achievement unlocks | all 131 trophies + 47 rungs + F-03 ceremony | flowers (ACHIEVEMENT-SCAN.md) |
| 7 presence/absence | everything's absence, C-05/C-09, F-11, quiet weeks | axes, dormancy, twigs |

## 16. RAW SOURCES

scan-outputs/01-data-layer.md (34 KB) · 02-achievements.md (89 KB) ·
03-coach.md (36 KB) · 04-roadmap.md (85 KB) · 05-uiux.md (37 KB) ·
06-media.md (38 KB) · 07-ledger.md (116 KB) — the raw briefs hold
every field, line reference, and ambiguity. This inventory + the
briefs are the complete Step-3 output, audited recursively
(scan-audit-2026-08-29.md passes 1-2; pass 2: PASS-WITH-FIXES, all findings fixed; see audits/).
