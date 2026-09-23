# Life Tree Feature Scan — Roadmap (raw brief)

Source: `docs/Roadmap.md` (1068 lines, read in full, two passes)
Scan date: 2026-08-29
Purpose: inventory EVERY milestone/feature/idea-park item so the Life Tree can map
current inputs now and classify future features later. NO SUMMARIZATION — every
named item is listed with its source lines.

---

## 0. Cross-cutting facts every Life Tree input-classification must respect

### 0.1 Renumbering map (lines 16–27) — older docs use OLD numbers
| Old numbering | New numbering |
|---|---|
| M0 — Core Loop MVP | M0 (unchanged, untouched) |
| M1 — Goals & Tasks | M5 — Goals & Tasks |
| M2 — Gamification & Full Coach | M7 (Analytics & Gamification) + M8 (Full Coach) + M9 (Life Tree) |
| M3 — Drive P2 | M10 |
| M4 — Entity Sync Plane | M11 |
| M5 — Drive P2.5 | M12 |
| M6 — Drive P3 | M13 |
| M6+ — Future Systems | split: Fitness → M2, Nutrition → M3, routine → M4; Study / projects / AI stay candidates |
| M7 — Graph/"Brain" | Graph section (under consideration, unnumbered) |
| (new) | M1 — Journal Features · M6 — Calendar & Periods |

Ambiguity: docs written before 2026-08-23 (DecisionLog D081) reference old numbers;
a feature cited as "M1" or "M2-phase" must be re-mapped per the table above.

### 0.2 Drive phasing (lines 33–45)
- P1 — Manual export/import (local files) — part of Milestone 0.
- P2 — Backup integration: JSON backups to private Google Drive folder (M10).
- P2.5 — Media sync AFTER plain-data sync (M12): the old "synchronizes ONLY
  media_attachments metadata + thumbnails" claim is REPLACED — full data-sync
  plane (M11) ships first, P2.5 shrinks to BIG MEDIA BLOBS ONLY, same D019 mechanism.
- P3 — Media Vault sync (M13): full media blob sync; Drive becomes the vault for
  small media (photos, short clips); long vlogs → PC archive tier, not 15 GB vault.

### 0.3 The six Life Tree-relevant domains (from M7, line 681)
`dayDomainPresence` six domains = {journal, habits, fitness, nutrition, body, media},
real-content floor, importless inside the predicate.

### 0.4 Life Tree's own roadmap placement (M9 + M8, lines 876–893, 856–859)
- M9 is its own milestone (D071, idea-recorded user vision; former M2-phase scope);
  biggest UI-heavy feature; BLOCKS NOTHING in M0–M8.
- The tree incorporates Growth-Rings / 10-ring structure (trunk rings, Pith → Yew;
  one ring = one Life-Fully-Logged qualifying yearly window) and reflects ALL
  domains + achievement tiers (Sprout → Grove).
- CONFIRMED PREMISES ONLY (locked, nothing new invented): 100% derived from real
  qualified non-imported history (an Analytics-Engine-derived cache from M7 —
  never a write-path entity, no new tables, imports never grow it, nothing
  user-editable, no XP anywhere); rings never shrink; no guilt UI; own nav tab.
- Placement/wireframe/paint strategy/art style/interaction ALL decided during the
  M9 build; the mockup is produced in the UI/UX ordering pass that CLOSES M8 (L170).
- Exit criteria (895–901): tree renders fully derived from M7 owner catalog
  (rings = count of Life-Fully-Logged anchored years; tiers = earned achievement
  tiers); imports never grow it; rings never shrink across missed years; no guilt
  copy; no write-path entity, no new tables, no XP, nothing user-editable; nav tab
  live on both platforms; render performance acceptable on the phone.

### 0.5 Global rules the Life Tree must keep (lines 3–4, 1063–1068)
- Every milestone ends with: backup exported, tests green, docs updated,
  DecisionLog updated.
- Every milestone keeps: offline-first, data ownership (export/restore), cloud
  optionality, $0 budget, no boundary violations. If a milestone would violate a
  non-negotiable principle, the milestone is wrong — redesign it.
- M0 is the GATE: no later milestone may start without M0 passing (line 68).
- Phone↔PC parity applies from M7 onward (D060): every feature/screen on BOTH
  platforms EXCEPT the PC archive (folder adoption + vault browser incl. J7 video
  library — PC-only because files physically live on the PC, M13); capture is NOT
  phone-exclusive (webcam / file import); both devices read the same H3 owners so
  a number never differs; offline behaves identically (lines 613–619).
- M0's in-flight UI overhaul (gaps G1–G11, docs/M0ScopeGapReview-2026-08-21.md)
  lands before M0 exit; M0 scope + exit criteria untouched (lines 29–31).

### 0.6 Build gates / dependency approvals (recorded open items)
- J5 Year Book PDF: PDF generation on Flutter needs a package — DecisionLog entry
  + user approval at build time (no-new-dependencies rule) (lines 117–119, 142–143).
- NU13 Food macro lookup: open-source DATA dependency (USDA/OpenFoodFacts) —
  DecisionLog entry + user approval before formalizing (lines 378–380).

### 0.7 Settings groups referenced across milestones (anchor map)
Group 1 GENERAL (week-start) · Group 2 COACH (strictness, review day, calendar
coach notes, milestone cadence, quiet-week range) · Group 3 FITNESS (units, PO
kill-switch, weight step, rep-first threshold, physique-photo nudge OFF, rolling
pace window, Advanced: freshness tiers, MRV floors) · Group 4 NUTRITION (Mifflin
inputs, TDEE override, protein g/kg per phase, fat floor, quiet meal reminders,
Advanced: streak window ±10%, backfill bound, collision priority, food lookup
toggle) · Group 5 CALENDAR & MEDIA (default filter, plan-vs-actual default,
month-header fact line, vacation-day threshold, vlog rewatch buffer, Advanced:
tint weights/caps fixed) · Group 6 HABITS (auto-track per habit, deload-day
counting) · Group 7 DATA & STORAGE (import + year-book homes) · Group 8 sync
skeleton (renders only after M11 ships) (lines 130–132, 290–295, 381–386,
469–471, 592–596, 849–852, 927–928).

---

## 1. Milestone 0 — Core Loop MVP (lines 49–68)

Status: **built / in-progress** (M0 is the current milestone; exit gate pending;
in-flight UI overhaul gaps G1–G11 before M0 exit). Storage backend LOCKED here
(Drift + SQLite WASM, D040 — see StorageDecision.md).

Scope statement (51–53): Dashboard, Journal (text + photos + long-form vlogs with
capture-time compression), Habits (daily check-ins + simple streaks),
Export/Restore, Coach stub (3-miss rule), storage meter + warnings.

### M0-1 Dashboard
- What: home surface; per M7 L169 render order later: [Today section, calendar/
  heatmap strip, habits card, goals progress, strength snapshot, weekly review/
  Coach note, journal capture] (731–736).
- Status: built (M0); dashboard goal/task blocks are M0 placeholders, made real in M5 (522–524).
- Inputs: reads everything; itself produces none.
- Source: Roadmap.md:51–53, 522–524, 731–736

### M0-2 Journal (text + photos + long-form vlogs, capture-time compression)
- What: core "Record" leg. Timeline/compose (D056, D073). Entries can carry
  photos and vlogs (media_attachments), vlogs compressed at capture time.
- Status: built (M0 core); J1–J6 features complete it in M1.
- Inputs (now): journal entries (text), photo attachments, vlog recordings
  (media), capture-time local date (dayKey), Life Area (areas exist from M0 —
  referenced by M1 J2/J6 filtering), hidden system tags arrive with D031's
  `health`+`physique` tagging (M1).
- Source: Roadmap.md:51–53, 74–76

### M0-3 Habits (daily check-ins + simple streaks)
- What: habit definitions + daily check-in (completed/missed); simple streaks.
- Status: built (M0); streaks-with-grace land in M7 (D068); autoSource bridge in M2 (D064).
- Inputs (now): habit completion/miss per day (habit.completed / missed events);
  (future, M2) auto-tracked check-ins via workout sessions; (future, M7) planned
  rest flags (habit.rest_planned).
- Source: Roadmap.md:51–53, 272–277, 646–666

### M0-4 Export/Restore
- What: P1 manual export/import of local files (JSON backups).
- Status: built (M0).
- Inputs: backup JSON files (export/restore round-trip).
- Source: Roadmap.md:35, 63, 1065

### M0-5 Coach stub (3-miss rule)
- What: single line appears after 3 consecutive missed habit days; replaced by
  the full rule-based Coach in M8.
- Status: built (M0); full Coach replaces it in M8.
- Inputs: none — reads habit misses.
- Source: Roadmap.md:52, 65, 761–770

### M0-6 Storage meter + warnings
- What: storage usage meter; 70%/90% warnings; later (M13) reflects vault state.
- Status: built (M0); extended by M13.
- Inputs: none — reads media storage.
- Source: Roadmap.md:53, 64, 971–972

### M0-7 Storage spike (process item)
- What: backend tested and locked here (Drift + SQLite WASM, D040); the
  milestone "includes" the spike.
- Status: completed (storage decision LOCKED in DecisionLog before M1 — line 66).
- Inputs: none.
- Source: Roadmap.md:55–56, 66, 925

Exit criteria (58–68): PWA persistence on iPhone; camera + MediaRecorder vlog on
device; offline core loop; export→wipe→restore identical; storage meter + 70/90%
warnings; coach stub after 3 missed days; storage decision locked.

---

## 2. Milestone 1 — Journal Features (J1–J6 + physique-photo timeline) (lines 72–147)

Status: **planned** (not built). All offline-first, facts-only, no new tables.
Completes the "Record" leg of the core loop (D056, D073).

### M1-J1 On-This-Day memory strip
- What: small card on the Calendar (memory-map screen, renders once M6 ships) +
  tiny line at top of Journal view showing what was logged exactly N years ago
  today (nearest past year with data first: 1y → 2y → 5y…). Pure derived query,
  zero new storage/schema/screens; tap opens the entry. Rules: H4 no-data → no
  strip; NO XP; facts-only (never reads text content); no notifications; honest
  media stubs for PC-archived media (thumbnail + "archived to desktop"); leap day:
  Feb-29 matches Feb 28 in non-leap years (shared `sameMonthDay` utility).
- Status: planned (M1).
- Inputs: consumes journal entry dates (occurredAt) — no new user input.
- Source: Roadmap.md:78–86, 576

### M1-J2 Journal search
- What: entry points on Journal page + Calendar; finds entries by plain
  word/keyword/tag, filterable by Life Area; results newest-first, matching term
  highlighted; tap → full entry. Fully offline, airplane-safe; zero new storage
  (no index table at personal scale); simple whole-word + tag matching, no
  fuzzy/AI — ONE shared matcher also serves the J7 video search (Architecture.md
  §Shared search matcher; H3 discipline); run in a worker if slow. Privacy:
  finds your words, never shares, never gives the Coach text access.
- Status: planned (M1).
- Inputs: consumes journal text/tags/Life Area. (The shared matcher is reused by
  J7 video search — J7 itself is NOT milestone-placed in this doc; see
  Ambiguities §A1.)
- Source: Roadmap.md:87–94

### M1-J3 Batch import of past entries
- What: Settings → Data → "Import entries": one plain-text file with documented
  format (date | title | text per block) → preview list with dates ("47 entries,
  2019–2021") → confirm → rows added as normal, backdated. Entries ONLY — NEVER
  creates habit check-ins, weights, or any other data (no fake history).
  `imported` flag + immutable `importHash` (columns already in M0 schema); dedupe
  on (original date + body-content-hash) captured AT IMPORT TIME; re-import of
  same file blocked; editing an imported entry later can never re-enable a
  duplicate; preview reports "N already imported, M new". DayKey = ORIGINAL date.
  No XP for imported content; achievement/cadence counters exclude imported rows
  (engine-side enforcement lands with M7).
- Status: planned (M1).
- Inputs: import file (date | title | text blocks) → backdated journal rows with
  `imported` flag + `importHash`. CRITICAL for Life Tree: imported rows never
  grow the tree (importless predicates, M7).
- Source: Roadmap.md:95–105, 641–645, 886–889

### M1-J4 Quiet Week
- What: user marks a date range (Settings → Coach) during which the Coach pauses
  nudges (habit-miss lines, journal-drought pokes, streak warnings) — guilt loop
  muted. ONLY the user starts it (never auto-detected); history stays TRUE;
  streaks stay REAL — quiet weeks do NOT shield streaks (the streak shield is the
  Grace setting, M7). Includes calendar day-view drought line — every drought
  poke routes through the Coach rule pipeline (full Coach rule integration
  completes with M8).
- Status: planned (M1; Coach-rule integration completes M8).
- Inputs: quiet-week date range (Settings Group 2). No data-domain input.
- Source: Roadmap.md:106–112, 839–840

### M1-J5 Year Book export
- What: Settings → Data → "Year book" → pick a year → READABLE human PDF: journal
  entries in date order, embedded photos/vlogs, small stats page (days journaled,
  habits, gym sessions, milestones). READ-ONLY — packages a copy, never moves or
  rewrites real data; honest media stubs for PC-archived items; no Coach/XP —
  pure artifact. BUILD GATE: PDF package needs DecisionLog entry + user approval.
- Status: planned (M1, gated on dependency approval).
- Inputs: none (read-only artifact; consumes journal/habit/gym/milestone stats).
- Source: Roadmap.md:113–119

### M1-J6 Tag/area filter chips
- What: on the Journal page, filter chips for #tags and Life Area (incl.
  physique-tagged A5 entries) — turns search and the calendar's Journal filter
  into a one-tap findable list. Derived only.
- Status: planned (M1).
- Inputs: journal #tags (user-applied to entries) + Life Area assignment.
- Source: Roadmap.md:120–122

### M1-D031 Physique-photo timeline
- What: dedicated comparison view (side-by-side / slider across time) over
  media_attachments anchored to journal entries tagged `health`+`physique`
  (hidden system tag) — zero new tables, zero new media paths. This category is
  EXEMPT from any future general-photo compression tier. The F5 monthly nudge
  rule (default OFF, no nagging) ships with M8.
- Status: planned (M1; F5 nudge in M8).
- Inputs: physique photos inside journal entries tagged health+physique (hidden
  system tag). Body-domain input (BODY qualifying entry includes a
  physique-timeline photo, M7 line 690–691).
- Source: Roadmap.md:123–128

Includes (130–132): Settings Group 7 anchors import + year-book homes; Group 2
gains quiet-week range; Group 5 gains calendar-media defaults that M6 consumes.

Exit criteria (134–145): search+filters offline with ONE shared J2/J7 matcher;
import round-trip with dedupe/dayKey/no-XP; On-This-Day H4 + media stubs + leap
day; quiet week silences M0 stub, streaks unaffected; year book PDF with media +
stubs; physique timeline + F5 documented.

---

## 3. Milestone 2 — Fitness & Body (lines 149–314)

Status: **planned** (not built). Workout side FIRST (build order D041); health
area becomes first-class domain. Manual structured entry ONLY (D041); no NLP; no
Apple Health; no device APIs (D009).

### M2-1 Workouts & templates (D042)
- What: two-layer model — `workout_templates` + `workout_template_exercises`
  (first-class; `pairWith?` superset pairing on template rows only); performed
  sessions copy template rows at save (frozen, append-only history); edits affect
  future only; "apply session deviation to template" folds structure only, never
  weights (per-template opt-out); two-a-day allowed (own rows; a plan slot counts
  DONE if any session references it; freeform = "done differently"); units STORED
  in kg everywhere, display-converts via Group 3 units key (kg|lb / cm|in — O8);
  midnight rule: dayKey = capture-time local date; `routineSlotLogId` set at save
  from the routine slot that preloaded the session (M4) — freeform paths keep it null.
- Status: planned (M2).
- Inputs (future): workout templates (structure only, never weights — exercises,
  sets, reps targets, pairings); performed sessions = frozen copies: exercises,
  sets, reps, weight in kg, date.
- Source: Roadmap.md:157–166

### M2-2 Exercises (D041/D044)
- What: seeded ~44-exercise lookup (verbatim list in Database.md), user-extendable
  like `areas`; categories push|pull|legs|core|cardio; 2-level muscle-group
  hierarchy (junction, primary/secondary roles assigned ONCE per exercise — sets
  auto-inherit, never re-logged); big-5 profile lifts (Bench, Squat, Deadlift,
  OHP, Barbell Row) tracked ON by default.
- Status: planned (M2).
- Inputs (future): user-created exercises (name, category, muscle groups); seed
  lookup rows. Cardio seed entries added here too (line 236).
- Source: Roadmap.md:167–172, 236

### M2-3 Session UI (D076)
- What: daily logging flow (plan-driven pre-fill + editable; add/remove/swap
  freely; freeform + paste fallback; plans never store weights); last-time hint
  with freshness tiers (<2wk full · 2–4wk quieted with date · >4wk collapsed AND
  progressive-overload suggestions pause — ~90% of last-time starting baseline
  instead of +2.5 kg extrapolation; constants configurable in settings); session
  comparison (N4) vs previous same-template session (per-exercise weight/reps/
  est-1RM deltas, volume delta, PR flag; stale/deload/injury contexts annotated,
  never judged; reachable from history, calendar day, records vault); template
  cloning (F4) one-tap incl. pairings; "Track this exercise" in session menu →
  dashboard "Your lifts" block; copy weekly check-in / phase-close report as
  plain text (F6).
- Status: planned (M2).
- Inputs (future): performed sets/reps/weights per exercise per session; template
  clones; "track this exercise" selection (dashboard lift block membership).
- Source: Roadmap.md:173–183

### M2-4 Auto-assort paste parser (D076)
- What: rule-based loose-grammar paste ("4x8@60kg") → exercises/sets/reps/weight
  assigned; fuzzy match + "Did you mean?" confirm; inline create flow with muscle
  assignment; NEVER silent auto-create; offline, NO AI (timing heritage:
  M1-or-M2; lands here).
- Status: planned (M2).
- Inputs (future): pasted text (sets/reps/weight strings) → structured set rows.
- Source: Roadmap.md:184–187

### M2-5 Strength & PR (D043)
- What: single `est1RM` owner (Epley from the BEST working set — zero max
  attempts; 1–12 rep guard); `strengthSnapshot(exerciseId, asOf)` = canonical
  reader; record modes (weight-mode → est-1RM within 1–12; rep-count mode → best
  clean rep count, NO 12-cap, `addedLoadKg` breaks ties); PR = strictly-greater
  est-1RM/rep best beats all-time best; ONE PR credit per exercise per session;
  PR ladder / vault / milestone history ALWAYS derived by walking sessions —
  `workout.pr` events exist for Coach/gamification/toast ONLY, never the truth
  for vault or achievements; deleting/editing a session re-derives everything;
  negative-XP symmetry handled by M7.
- Status: planned (M2; M7 hooks later).
- Inputs (future): est-1RM (derived), PR events (derived).
- Source: Roadmap.md:188–196

### M2-6 Records vault
- What: derived-only view — all-time est-1RM ladder per tracked exercise (with
  dates), PR history timeline from the session-walk, milestone trophies
  (1st/5th/10th PR, 1.5×/2× bodyweight, 100th workout, all-time tonnage per
  group, yearly counts — fired by M7's achievement engine), lifetime totals
  (workouts, sets, tonnage, phase training days).
- Status: planned (M2; trophy firing M7).
- Inputs: none (derived from sessions).
- Source: Roadmap.md:197–201

### M2-7 Exercise drill-down (I1)
- What: dashboard "Your lifts" block (tracked exercises only: est-1RM sparkline,
  record, status dot, deload/injury aware) + full drill-down screen (est-1RM
  curve, top-set trend, PR markers, deload/injury bands shaded, ratio overlay
  from the 7-day rolling bodyweight, every logged set); untracked exercises
  reachable only from within a session (plus one-tap "Track this exercise").
  Pure read-path aggregation, zero schema.
- Status: planned (M2).
- Inputs: none (derived).
- Source: Roadmap.md:202–207

### M2-8 Strength standards (D044)
- What: frozen 5-tier seed (Beginner/Novice/Intermediate/Advanced/Elite, men +
  women columns) for the 4 canonical lifts ONLY (bench/squat/deadlift/OHP —
  verbatim values in Gamification.md); barbell row stays ratio-display-only;
  non-BIG-5 exercises ratio-only; bodyweight/rep-mode exercises NEVER touch the
  table. Rank map: "Strength Standard Reached" fires ONLY on ranks 2/3/4
  (Novice→Branch, Intermediate→Heartwood, Advanced→Grove) via M7; ranks 1 and 5
  never fire (Coach/profile grade only). Overall level = display-only profile
  grade (avg of big-5 ratios, Wilks-style) — never a trophy, never a gate.
  Absolute-lift trophy ladders fire ONLY on a real logged set (threshold weight ≥
  threshold AND reps ≥ 1, straight from exercise_sets — NO est-1RM substitution,
  no inflation). Formula constants (Mifflin-St Jeor, Wilks/DOTS, Epley) = plain
  Dart pure functions, public formulas, non-togglable.
- Status: planned (M2; rank-map trophy firing M7).
- Inputs: none (derived from logged sets).
- Source: Roadmap.md:208–220, 729–731

### M2-9 Progressive overload (PO)
- What: per-exercise progression styles — LINEAR-WEIGHT (compounds), REP-FIRST
  double progression (accessories: +1–2 reps first, reps > target by 2 across
  sets THEN weight bump), BODYWEIGHT (reps/sets/added load, no fake kg); AUTO by
  default (styles auto-seeded by category; suggestion auto-generates each
  session); override at EVERY level (per-session accept/change, per-exercise
  style + step, GLOBAL KILL-SWITCH in Group 3, default on); conservative,
  deload-aware, suggestion-only, never XP; increments user-configurable (2.5 kg
  step default, +2 rep-first threshold).
- Status: planned (M2).
- Inputs: none (suggestion generator; consumes session history).
- Source: Roadmap.md:221–228

### M2-10 Cardio (D045)
- What: workouts gain kind strength|cardio + additive durationSec?/distanceKm?/
  avgEffort?/kcalBurned?; cardio types Run/Cycle/Row/Swim/Walk/Stairs; MET
  estimate verbatim — `MET × 3.5 × bodyweightKg × minutes / 200` (the ×3.5 is
  mandatory; public tables) — auto-suggested when a cut phase / weight goal is
  active, ALWAYS labeled; manual kcalBurned always available and wins (feeds
  energy math directly); cardio slots feed adherence; weekly cardio minutes +
  type split in analytics; cardio seed entries in exercise lookup.
- Status: planned (M2).
- Inputs (future): cardio sessions (type, duration, distance?, effort?, kcal?).
- Source: Roadmap.md:229–236

### M2-11 Phases (D047)
- What: type bulk|cut|maintain; startDate; endDate? (planned OR open-ended; ONE
  active phase; close explicitly, optional "how'd it go"); baseline weight
  anchored at start (rolling average); targetWeeklyRateMin/Max presets
  auto-adjust to macro targets (M3); phase close renders full derived report
  (weight trend via rolling avg, pace verdict vs target rate, sessions count,
  adherence %, volume totals + group volume, PRs with margins, achievements,
  goal pace) — Coach line section + `phase_close` `coach_outputs` snapshot land
  with M8; `phaseAdjacency` helper shared with the Turn achievement (M7).
- Status: planned (M2; M3/M7/M8 hooks later).
- Inputs (future): phase declarations (type, start/end dates, optional close
  comment). Consumes weigh-ins for pace.
- Source: Roadmap.md:237–245

### M2-12 Body metrics & weigh-ins (D046, NU8)
- What: `body_metrics` typed rows (weight | measurement_*); multiple weigh-ins/
  day allowed and stored, FIRST of the day = canonical daily trend (later
  same-day rows stored but EXCLUDED from derived series); deleting the first row
  promotes the next (retroactive re-derive accepted); 7-day rolling average
  (`rollingAvgWeight`) shared with goals (M5) and the engine; thin-data rule
  (<7 weigh-ins → "Adjusting" label, never a verdict/projection from a single
  point); the R10 routine weigh-in slot ships with M4.
- Status: planned (M2; M4 weigh-in slot, M5 goal reuse later).
- Inputs (future): weigh-ins (weight, timestamp; first-of-day canonical),
  measurement_* rows. BODY domain input (qualifying = real weigh-in OR
  physique-timeline photo — M7 lines 690–691).
- Source: Roadmap.md:246–253

### M2-13 Deload markers (D051)
- What: `deload_markers` table (any range, reason?, journalEntryId?, notes?);
  days in range = adherence-quiet, volume-balance exempt, strength chart shaded;
  PRs always stay real. Separate table, NOT a phases type. Coach can suggest a
  deload after sustained low adherence (M8).
- Status: planned (M2).
- Inputs (future): deload date ranges (reason?, optional journal link, notes).
- Source: Roadmap.md:254–257

### M2-14 Injuries / limitations (N1)
- What: `limitations` table (exerciseId? OR muscleGroupId?, startDate, endDate?,
  note); while active: PO suggestions quiet, PR framing softened, volume floors
  suspended (like deload), swap suggestions from same muscle group, adherence
  learns limited-not-lazy; healed = instant restore, history kept ("limited 3×
  this year"); no medical claims — user-declared flag + behavior changes.
- Status: planned (M2).
- Inputs (future): limitation declarations (exercise or muscle group, start/end,
  note).
- Source: Roadmap.md:258–263

### M2-15 Volume balance
- What: seeded min-effective-sets-per-week floors per muscle group (MRV-style,
  settings-editable — Group 3 Advanced); weekly under-floor + imbalance checks
  (chest 18 vs back 3); phase-adjusted floors (cut may run lower); advisory only
  — never XP/penalty. Coach pattern lines land with M8.
- Status: planned (M2).
- Inputs: none (derived from sets; floors configured in settings).
- Source: Roadmap.md:264–267

### M2-16 Plan adherence
- What: per-slot adherence % derived from sessions vs plan slots; free-training
  deviations = "done differently", not missed; single reasonable miss vs pattern
  ("skipped chest 3 of 4 weeks"); deload-tagged weeks exempt. Coach rules land M8.
- Status: planned (M2).
- Inputs: none (derived from sessions vs routine plan slots, M4).
- Source: Roadmap.md:268–271

### M2-17 Habits bridge (D064)
- What: habits gain `autoSource` ("workout"; "weigh-in" is a FUTURE producer);
  session save auto-writes the day's habit check-in in the SAME transaction
  (`autoCreated`; manual entries win); session deletion cleans up its auto
  check-in AND emits `habit.completed_revoked` transactionally; deload-day
  counting per habit (Group 6, default counts). Auto-tick XP real-when-real +
  revoke symmetry land with M7's anti-farming gate.
- Status: planned (M2; M7 anti-cheat hooks later).
- Inputs (future): auto-created habit completions (with revoke symmetry) —
  HABITS domain input; NOTE "weigh-in" as future autoSource producer.
- Source: Roadmap.md:272–277

### M2-18 First-run fitness onboarding (I9, D076)
- What: captures Mifflin inputs (height/age/sex/activity — Group 4 settings
  keys) and proposes a first weekly plan + seeded tracked exercises — user can
  customize/replace/clear ALL from day one; nothing forced; energy math alive
  day 1 (macros land in M3); the proposed weekly plan binds when the Routine
  milestone ships (M4).
- Status: planned (M2).
- Inputs (future): height/age/sex/activity (Mifflin inputs), accepted weekly
  plan, tracked-exercise selection.
- Source: Roadmap.md:278–282

### M2-CLOSED Fitness surface CLOSED (D060)
- What: no new features for the fitness side — surface complete (workouts, sets,
  exercises, templates, plans, phases, PR, vault, PO, cardio, volume, deload,
  injuries, adherence, goals, habits bridge, check-in, phase report; media
  DEFERRED). N3/N5/N6/N8 + periodization remain park-able (Idea Park); rest-day
  patterns (F2) + recovery readiness (N5) cover rest from this milestone onward;
  add only when real usage says so.
- Status: CLOSED surface (2026-08-20 verdict, D060) — explicit closure note for
  the Life Tree: fitness inputs are FINITE as of M2.
- Inputs: none (closure note).
- Source: Roadmap.md:283–288

Includes (290–295): Settings Group 3 (FITNESS: units, PO kill-switch, weight
step, rep-first threshold, physique-photo nudge OFF, rolling pace window 7d/14d;
Advanced: freshness tiers, MRV floors) + Group 6 (HABITS: auto-track per habit,
deload-day counting) + Mifflin inputs as Group 4 keys; health-area events
(`workout.completed`, `workout.pr`, `workout.deleted`) documented and exported
in backups (formatVersion-2 enumeration in Database.md).

Exit criteria (297–314): session round-trip; PR detection matches session-walk;
record-mode routing unit-tested; phase create → pace verdicts with "Adjusting"
on thin data; weigh-in first-of-day canonical; cardio MET labeled + manual
override + no double-count with M3 deriveMacros; auto-tracked habit transactional
+ revoke; auto-assort paste workflow offline; NO Apple Health/device APIs/NLP.

---

## 4. Milestone 3 — Nutrition & Energy Balance (lines 316–405)

Status: **planned** (not built). Macros after the workout side (build order
D041). Receipt-line nutrition + energy-balance math core (D046, D062, D063).

### M3-1 Receipt-line model (D062, NU1–NU12)
- What: `nutrition_logs` per-meal rows (kcal + protein/carbs/fat logged FROM THE
  START); day total = SUM of rows, never a stored day row; dateKey = ACTUAL eat
  date (NU4 backdating — deliberate exception to the midnight rule); occurredAt =
  actual eat time; mealTypeId?/recipeId?/name?; portionMultiplier resolved ON THE
  ROW (1x/1.5x/2x — never extra recipe copies); `source` column (manual | scanner
  | fooddb | packed | scale) — the producers seam: every input prints the same
  receipt line, offline forever.
- Status: planned (M3).
- Inputs (future): per-meal logs (kcal + P/C/F), actual eat date/time,
  mealType/recipe/name, portion multiplier, source. NUTRITION domain input.
- Source: Roadmap.md:321–328

### M3-2 Meal types (NU2)
- What: seeded breakfast/lunch/dinner/snack, user-extendable + editable
  (rename/add/delete own; deleting a type never touches existing rows); cosmetic
  grouping only.
- Status: planned (M3).
- Inputs (future): user-defined meal types.
- Source: Roadmap.md:329–331

### M3-3 Recipes (NU3)
- What: `nutrition_recipe` (name, kcal, macros, mealTypeId?, servingNotes?);
  one-tap log fills a FRESH row (copy-in at save; recipeId kept for traceability
  — editing a recipe NEVER rewrites past rows); favorites/recents bar of
  top-logged recipes; "re-log since <date>" batch back-fill = future opt-in,
  never auto-rewrite history.
- Status: planned (M3).
- Inputs (future): recipe definitions (name, kcal, macros); recipe logs (copy-in).
- Source: Roadmap.md:332–336

### M3-4 Catch-up / backfill (NU4, NU4a)
- What: meals file under the ACTUAL eaten date; gentle "you logged a meal for
  yesterday" nudge against double-counting; school-end batch flow ("lunch to
  school + afternoon snack" in one flow); soft duplicate guard (same dateKey +
  mealTypeId + recipeId/food selection → non-blocking "Already logged X — add
  another?"; user decides; shared by school-end batch and morning pack, M4);
  backfill bound: same-day/last-24h = normal, OLDER dates = distinct "historical
  backfill" mode that NEVER extends streak/check-up compliance.
- Status: planned (M3).
- Inputs (future): backdated meal rows (actual eat date).
- Source: Roadmap.md:337–343

### M3-5 Energy math (D046)
- What: Mifflin-St Jeor BMR (+5 male / −161 female) × NON-TRAINING activity
  factor → TDEE baseline (height/age/sex/activity as Group 4 settings keys, never
  profile fields — D003); training expenditure DERIVED from logged sessions and
  ADDED SEPARATELY (cardio kcalBurned/MET from M2; strength burn = conservative
  labeled estimate band; manual kcalBurned replaces the band entirely — no double
  count, NU9); signed weekly rate: `calorieTarget = TDEE + (rate × 7700)/7`
  (minus = cut, plus = bulk; additive, never inverted; 7700 kcal/kg honest
  estimate, non-togglable); `deriveMacros(dateKey)` = THE single day-target owner
  (H3) — kcalTarget + protein/fat/carbs remaining + collision flag (protein + fat
  grams exceed kcal budget → "raise kcal or lower protein"; default: keep
  protein, drop fat to floor); no silent NaN/negative; protein g/kg per phase
  (cut 2.0 / bulk 1.8 / maintain 1.6, editable, per-Area override), fat floor
  ~0.6 g/kg (editable up), carbs as remainder (Atwater 4/9/4); no-phase fallback
  (goals first → "maintain" default; targets stay elevated); manual TDEE override
  FREEZES auto-recompute AND protein/fat g/kg basis until cleared (B4);
  `rollingWindowMean` = the only rolling-average math in the engine.
- Status: planned (M3).
- Inputs: none (derived; consumes weigh-ins, sessions, settings).
- Source: Roadmap.md:345–361

### M3-6 Events (D058)
- What: `nutrition.logged` (mealType, kcal/macro totals, source, actual eat
  dateKey — no recipe detail) + `nutrition.removed`; `body.weighed` (per canonical
  first-of-day weigh-in) + `body.weighed_revoked`; all written transactionally
  with the row change, metadata-only; pack-consumes also emit `nutrition.logged`
  (M4); no per-set/per-slot/routine-noise events.
- Status: planned (M3).
- Inputs: none (event emission; consumed by M7 gamification, M8 Coach).
- Source: Roadmap.md:362–366

### M3-7 Food macro lookup (NU13, D062)
- What: USDA FoodData Central (core, public domain) + OpenFoodFacts (CC0,
  optional second source) behind ONE normalized macro model; curated OFFLINE set
  (common foods + the user's own saved foods/recipes — covers ~90% of daily
  logging, zero network) always available; bigger search list loads only online
  and is CACHED (top-N results, only picked rows downloaded); `nutrition_food_cache`
  = ONE regenerable table (NOT in backup enumeration); saved-food list DERIVED
  from nutrition_logs history (a saved food IS a row the user logged — restore
  can never wipe it); manual entries are ground truth — lookup only pre-fills a
  NEW row the user confirms, never mutates a logged value; NO AI/photo-scan
  (source='estimated' rejected); toggle in Group 4, default ON (OFF = plain
  manual entry, behavior switch, never deletes data). BUILD GATE: open-source
  DATA dependency — DecisionLog entry + user approval before formalizing.
- Status: planned (M3, gated on dependency approval).
- Inputs (future): looked-up food selections (pre-fill only); saved foods (derived).
- Source: Roadmap.md:367–380

### M3-8 Settings Group 4 (NUTRITION)
- What: Mifflin inputs · manual TDEE override · protein g/kg per phase · fat
  floor · quiet meal reminders (default on — mechanism lands with M4's meal
  windows; seeded defaults work before any routine) · Advanced: fully-logged
  streak window (±10% default, Advanced-only knob clamped 5–15%), backfill
  bound, macro-collision priority, food lookup toggle.
- Status: planned (M3).
- Inputs: settings only.
- Source: Roadmap.md:381–386

Includes (388–390): macro-gap bar (D063) specified here but RENDERS inside the
R12 briefing card (M4); the zero-XP "N days fully logged" consistency marker
lands with M7.

Exit criteria (392–405): log meal → day total = SUM; backdated meals on actual
date; soft duplicate guard prompts never blocks; deriveMacros math + collision +
no-phase fallback + manual TDEE freeze; food lookup offline curated set; events +
revokes transactional + exported; the 00:30-snack display mismatch documented
and accepted (logs under actual date, shows under previous day's routine slots —
both numbers correct).

---

## 5. Milestone 4 — Daily Routine & Briefing (lines 409–485)

Status: **planned** (not built). Nutrition closed → routine session (S009).
Daily planning surface (D061, D063).

### M4-1 Day templates (D061, R2)
- What: `day_templates` + `day_template_slots` with typed kinds: meal | pack |
  workout | activity | rest | sleep | weigh-in (kind IS the extension seam, like
  nutrition's `source`); named reusable full-day plans ("School Day", "Weekend",
  "Holiday"); slot `link` (recipeId for meal slots, workoutTemplateId for
  workout-kind slots); template building = copy ops (import yesterday's / copy
  previous day, then tweak) — past days stay frozen, edits affect future only;
  delete affects future bindings only (a routine referencing a deleted template
  auto-falls back to the default); user-defined slot kinds anytime.
- Status: planned (M4).
- Inputs (future): day template definitions (named slot lists with kinds + links).
- Source: Roadmap.md:415–423

### M4-2 Weekly binder (R7/R8)
- What: `week_plans`/`week_plan_slots` RE-PURPOSED as the routine-week binder
  (slots reference `dayTemplateId`, NOT workoutTemplateId; null = rest); a
  weekly routine = a named 7-slot binding list + per-day override ("this
  Thursday = Holiday Day") WITHOUT forking the routine — ONE binding model, no
  independent per-day toggle; at the START of the calendar week (first day per
  WEEK STARTS ON, Group 1) the user picks the routine for that week (or
  "continue current"); routines can be assigned FOR a period (start→end week,
  e.g. a school term) with automatic fallback to the DEFAULT routine; otherwise
  they continue indefinitely; prompt discipline: no weekly prompt on unbroken
  runs — the app asks only at first-ever setup, when a period ends, on
  user-opened override, or an explicit want-change.
- Status: planned (M4).
- Inputs (future): weekly routine bindings (7-slot list), per-day overrides,
  routine-for-period assignments, default routine choice.
- Source: Roadmap.md:424–434

### M4-3 Performed days (routine-A1)
- What: `routine_days` (dateKey, templateUsedId — SNAPSHOT copy of the applied
  template, frozen) + `routine_slot_logs` (status planned | done | skipped |
  packed | eaten); past days stay frozen; pack→meal linkage at TEMPLATE level (a
  pack's Home = its target meal slot), pack CONTENTS per date are day-instance
  data; pack items carry calories entered at pack time (honest numbers — bag in
  front of you), consumed at EAT time (nutrition_logs row, source='packed' —
  never double entered); not eaten = cancelled, never enters kcal; weigh-in slot
  (R10): one tap → `body_metrics` type=weight (the NU8 first-of-day rule
  applies); midnight rule: routine-day = calendar day boundary (the 00:30 snack
  display mismatch is accepted and documented).
- Status: planned (M4).
- Inputs (future): pack declarations (contents + calories per date), slot
  statuses (done/skipped/packed/eaten), one-tap weigh-ins via slot.
- Source: Roadmap.md:435–445

### M4-4 Briefing card (R12, D053/D063)
- What: the dashboard "Today" section becomes the SINGLE daily surface: today's
  slots in order (chosen routine + overrides), done-vs-missing markers, the NU12
  macro-gap bar ("protein 168/168g · kcal 2120/2875" — deriveMacros, zero
  storage), one-tap log/pack actions; quiet meal reminders point here
  (on-app-open catch-up only, never push — D018; seeded meal windows work before
  any routine); session pre-load (A7): the Gym slot TAP opens the session screen
  pre-loaded with that day's linked workout template (exercises, target sets/reps
  in order, last-time hints, PO suggestions ready) — logging =
  confirm/adjust/execute; workouts gains `routineSlotLogId` set at save from the
  preloading slot (freeform = null; the slot stays "planned" — the user marks
  done / done-differently explicitly); backfill semantics: a backfilled meal
  marks its slot done in THAT date's view, never today's; the macro-gap bar
  always sums the day's target vs the day's full receipt — display may lag,
  numbers never disagree.
- Status: planned (M4).
- Inputs: none (surface; consumes routine slots, nutrition logs, sessions).
- Source: Roadmap.md:446–459

### M4-5 Week recap (R11/A6)
- What: week-view strip above the displayed week grid — glance: gym X/Y · packs
  eaten · weigh-ins X/7 · PR count · protein hit-rate; denominators count only
  days that HAVE the slot (single owner `adherenceWeek()`); strip window = the
  DISPLAYED week (explicitly labeled vs the review-day verdict window, M8);
  tapping the strip opens the merged weekly review (M8) — glance and verdict are
  two display modes of ONE owner.
- Status: planned (M4).
- Inputs: none (derived).
- Source: Roadmap.md:460–465

### M4-6 Quiet meal reminders (D063)
- What: on-app-open catch-up nudges; known meal windows = routine-bound meal
  slots, seeded defaults (breakfast/lunch/dinner/snack) when no routine.
- Status: planned (M4).
- Inputs: none (nudge surface).
- Source: Roadmap.md:466–468

### M4-7 Settings (Group 1 + Group 5 additions)
- What: Group 1 (GENERAL) week-start · Group 5 (CALENDAR & MEDIA): vlog rewatch
  buffer days (3–5, default 5 — ties to the vlog local buffer nudge, M13),
  plan-vs-actual default (Both), month-header fact line (on).
- Status: planned (M4).
- Inputs: settings only.
- Source: Roadmap.md:469–471

Exit criteria (473–485): routine from day templates bound to week + per-day
override + re-bind + frozen past + prompt discipline; briefing card slots +
macro-gap bar + one-tap log/pack + backfill slot-marking in THAT date's view;
gym slot pre-loads session; pack "ate it" consumes receipt row at eat time,
skipped pack never enters kcal; weigh-in slot writes body_metrics first-of-day
rule; week strip matches adherenceWeek() denominators; glance vs verdict windows
labeled.

---

## 6. Milestone 5 — Goals & Tasks (lines 489–538)

Status: **planned** (not built). (Former M1 — moved here so weight/strength goals
ship with real body/exercise data; user-directed re-order.) Journal free-text
parsing explicitly deferred — real NLP stays out (D004); rule-based paste
auto-assort shipped with M2. Journal text stays manual structured entry.

### M5-1 Goals (D048)
- What: goals gain kind `generic | weight | strength` from the FIRST goals build
  (additive nullable columns only — kind, exerciseId?, targetValue?; no forced
  migration on years-old data later). Broad weight goals reuse the existing
  `goals` system ("reach 75kg by <date>") — NOT a new system: progress
  auto-computed from body_metrics rolling weight, pace = remaining kg ÷ remaining
  days, deadline grading. Strength goals = an exercise FK (must be tracked) +
  target est-1RM + targetDate; baseline = best est-1RM at creation; progress
  auto-computed; pace graded like phases; est-1RM ≥ target → the existing
  `goal.completed`; deadline miss = "missed by X kg". Estimates are labeled.
  Goal ↔ phase consistency: creating a weight goal auto-proposes a matching
  phase and vice versa (one-tap link); a conflict warning fires if the active
  phase contradicts the goal.
- Status: planned (M5).
- Inputs (future): goal declarations (kind, target value, deadline, optional
  exercise FK); goal↔phase links; goal.completed events.
- Source: Roadmap.md:499–510

### M5-2 Goal progress (D049)
- What: computed ONLY — a real-time derivation, never a stamp; one owner per goal
  kind (`goalProgress(goalId)`: weight → rolling weight vs start/deadline;
  strength → est-1RM vs target). The write-path `goal.progress` event is
  RETIRED — only the rare user-declared `goal.completed` remains. Goal cards also
  show a derived projection line (D050): the deadline plus "at current pace →
  ~date" (weight: rolling-trend extrapolation; strength: est-1RM regression) with
  honest-estimate labeling — needs ≥2wk data else "more data", stale/deload =
  uncertain, always derived never stored; also a line in the phase close report (M2).
- Status: planned (M5).
- Inputs: none (derived).
- Source: Roadmap.md:511–519

### M5-3 Tasks
- What: simple tasks with due dates; complete offline; `task.completed` events
  documented and exported in backups.
- Status: planned (M5).
- Inputs (future): task definitions (title, due date), task completion.
- Source: Roadmap.md:520–521

### M5-4 Dashboard (goal/task blocks)
- What: goal progress + today's tasks blocks become real (replace M0
  placeholders); goal deadlines ring calendar cells once the Calendar ships (M6).
- Status: planned (M5; calendar integration M6).
- Inputs: none (surface).
- Source: Roadmap.md:522–524

### M5-5 Goal-end review card (`milestone_review_goal`, D050)
- What: appears ONLY at goal end — won (computed final value beside the target;
  the declaration is only the trigger) or expired (zero blame, "window closed,
  here's where you started") — never mid-run. The card machinery ships with the
  Full Coach milestone (M8); goals completed before then simply have no card yet.
- Status: planned (M5 spec; machinery M8).
- Inputs: none (review surface; goal.completed trigger).
- Source: Roadmap.md:525–529

Exit criteria (531–538): goals with milestones; progress computed-only (no
goal.progress event); weight/strength goals track real data with labeled pace +
projection; tasks offline + consistent state (no sync yet); dashboard real
blocks; M5 events documented + exported.

---

## 7. Milestone 6 — Calendar & Periods (lines 540–605)

Status: **planned** (not built). The Calendar = the app's MEMORY MAP, never a
judgment surface (D054) + the periods model (D075). Everything derives from
existing H3 owner functions — zero new storage, zero writes (navigates to day
view / real screens only).

### M6-1 Month grid tint (L250)
- What: day cells show a TINT, never dots/numbers/icons. FILTER MODE = single
  system (Journal | Fitness | Nutrition | Body | Habits) — whole day cell shades
  in that system's color (filters render only for systems that have data, H4).
  FILTER MODE = All — one neutral tint whose STRENGTH = how much happened (1
  thing = faint, 6+ = strongest), a single gradient of activity intensity. Tint
  intensity = volume via ONE H3 owner `dayActivityScore` + `tintLevelFor`:
  workout/session = 3 (max 1/day) · meals = 1 each (CAP 3/day) · daily weigh-in =
  1 (max 1/day) · journal entries = 1 each (CAP 2/day) · habit completed = 0.5
  each (UNCAPPED — more habits done is the completeness signal itself; meals/
  journal cap because volume ≠ activity). Missed habits contribute 0 — no
  negative/red state (missed-habit warnings live in the Coach reflection, never
  the tint). Today = separate border ring; selected = accent outline; future days
  dimmed/desaturated. No glyphs, emojis, or numbers on the grid.
- Status: planned (M6).
- Inputs: none (derived — consumes ALL domain activity; this is a primary visual
  summary of the six domains' per-day presence).
- Source: Roadmap.md:547–560

### M6-2 Day view (L251)
- What: tap any day → chronological derived list of everything that day (weigh-in,
  meals, gym session, journal entries, habits), every line derived, links to real
  screens, filter chips apply; PLAN-vs-ACTUAL split toggle (Actual / Plan / Both)
  pairing routine slots against what actually happened ([planned: gym 17:00 ·
  actual: missed]); GOAL DEADLINES ring the day cell in the goal color (day view
  lists "deadline: reach 75kg" first — renders once goals exist, M5); Coach
  outputs render as a quiet line under the day's events (Coach notes in calendar
  day view — default on).
- Status: planned (M6).
- Inputs: none (derived).
- Source: Roadmap.md:561–568

### M6-3 Year heatmap
- What: month → year = 12 mini-months of the same tint (GitHub-contribution
  style), same owner, no new data.
- Status: planned (M6).
- Inputs: none (derived).
- Source: Roadmap.md:569–570

### M6-4 Month-header fact line
- What: "N days logged" (All view) / "N days journaled" (Journal filter) — one
  small derived fact (dayActivityScore > 0), not a verdict; filter-aware
  wording; renders only in the All view.
- Status: planned (M6).
- Inputs: none (derived).
- Source: Roadmap.md:571–573

### M6-5 Week grid ↔ calendar month
- What: linked by tapping a week (the M4 planning grid connects through the
  week↔month toggle).
- Status: planned (M6).
- Inputs: none (navigation).
- Source: Roadmap.md:574–575

### M6-6 On-This-Day strip card (J1, M1)
- What: renders here (the memory-map screen) — M1's J1 card.
- Status: planned (M6 render; M1 feature).
- Inputs: none (M1 J1 consumes journal dates).
- Source: Roadmap.md:576

### M6-7 Periods (D075)
- What: user-created start/end date range + title + type (vacation | term |
  holiday | …) — an INVISIBLE METADATA record, NOT a journal entry; content
  collected by DATE-RANGE derivation (inclusive [start, end]), never copied or
  owned; `extraEntityIds` = the ONE deliberate exception (an item dragged into a
  period outside its range); deleting/changing a period NEVER orphans content
  (re-range = re-slice instantly); creation BOTH ways (drag a range on the
  calendar / manual date picker from trips) ends in a visible confirmation step
  ("Create period [start → end]?") — an accidental drag never silently creates a
  range; trip view = journal+media timeline scoped to the period (reuses the
  D031/journal timeline pattern); the app NEVER fabricates a blog post on period
  creation; period renders as a top band / cell tint context whose colored block
  opens the trip view; vacation/period quiets Coach adherence like a deload
  ("vacation, not laziness" — rule lands with M8); periods ride the backup
  enumeration (user rows survive restore).
- Status: planned (M6).
- Inputs (future): period declarations (start/end date + title + type;
  extraEntityIds drags). Feeds M7 vacation-day counting (day-level UNION,
  resolve-E2) + "Took the Time" knob.
- Source: Roadmap.md:577–591

### M6-8 Settings Group 5 (CALENDAR & MEDIA)
- What: default filter (All) · plan-vs-actual default view (Both) · month-header
  fact line (on) · vacation-day threshold knob for "Took the Time" (default 14
  days per vacation year — resolve-E2; day-level UNION counting consumed by M7) ·
  Advanced: tint weights/caps (as locked — keep fixed).
- Status: planned (M6).
- Inputs: settings only.
- Source: Roadmap.md:592–596

Exit criteria (598–605): tint-only calendar matching dayActivityScore exactly;
year heatmap; day view + plan-vs-actual + goal deadline rings once goals exist;
periods create/confirm/trip-view/re-range, delete never touches entities; month
fact line per filter; week↔month linking.

---

## 8. Milestone 7 — Analytics Engine & Gamification (lines 609–755)

Status: **planned** (not built). (Former M2, first third.) Analytics Engine owner
catalog, XP/streaks/levels, full achievement engine (178 entries), zero-XP
consistency marker. Phone↔PC parity applies from this milestone onward (D060).

### M7-1 Analytics Engine (D049)
- What: the consolidated H3 owner-function catalog — every derived stat has
  exactly ONE owner; ALL views call it, never re-implement; rounding happens
  once, inside the owner; no generic-aggregator meta-framework. Catalog:
  `rollingAvgWeight` · `deriveMacros` (M3) · `adherenceWeek` · `strengthSnapshot`
  (M2) · `dayActivityScore` (M6) · `totalVolume` (weight-mode sets only) ·
  `goalProgress(goalId)` (M5) · `paceVerdict` (shared by phase/goal pace +
  projections; the Coach cites it, M8) · `sameMonthDay` · `dayDomainPresence` ·
  `phaseStartWindow` · `phaseAdjacency` · `yearlyPass`/`consecutiveYears` ·
  `anniversaryWindow` · `rollingWindowMean` · `est1RM` (M2) · `qualifyingEntry` ·
  `robotOverlapWindow`/`runAlive`. (Full catalog authority: Architecture.md.)
- Status: planned (M7). THE Life Tree's data backbone (M9 derives from this
  catalog, lines 895–901).
- Inputs: none (derived owners).
- Source: Roadmap.md:621–631

### M7-2 Gamification (D011/D066)
- What: XP, levels, streaks with grace — meaningful progress only. No XP for
  app-opening, browsing, empty entries, logging itself, imported content,
  reviews, or trophies (trophies grant ZERO XP). XP values fixed HERE, NOT
  offered as settings toggles. Journal XP capped (first 2 content-gated entries/
  day); media XP rides the journal cap; PR XP small + milestone-tiered
  (1st/5th/10th) + size-weighted (a +≥2.5 kg est-1RM gain counts; micro-PRs
  don't); auto-tick XP is real-when-real (an auto-tracked habit = full XP ONLY
  when the triggering session is real — the shared anti-cheat gate; revoked ticks
  return XP via the compensating negative-XP event; no double-earn, no
  delete-log cycles); XP reversal is SYMMETRIC (negative-XP events, never
  deletion or retroactive edits); imported rows never earn (`isImported` enforced
  INSIDE every owner predicate — part of the contract — and the 3-question
  anti-cheat gate rejects any import that would raise or trigger a trophy;
  imports show history, never earn).
- Status: planned (M7).
- Inputs: none (derived XP from real events).
- Source: Roadmap.md:632–645

### M7-3 Streaks (D068)
- What: per habit + per Life Area, derived from the event log. Grace = 1 grace
  day per 7-day window (default 1, editable, ONE shared budget, applies
  everywhere — habit AND life-area streaks; a missed day is still recorded as a
  miss; grace only prevents the break; grace NEVER shields a robot-consistency
  run). Planned rest (`habit.rest_planned` — per-habit one-tap rest flag, created
  ONLY by explicit user choice, never from silence; delete/edit writes the
  compensating `_revoked` event): a rest day FREEZES the streak (neither resets
  nor advances — a neutral hole); rests never earn anything; NOT grace, NOT quiet
  week, NOT an infinite shield (resting 30 days straight earns nothing). Weekly
  checkpoint: the rolling-average evaluation at the CLOSED calendar week (Sunday),
  once per week; thin weeks (<5/7 logged weigh-in days) neither confirm nor
  reset; weight-ladder and Real Progress read the two most recent consecutive
  non-thin weeks. Fully-logged day (two valid paths, one concept): routine-active
  day = kcal within ±10% of the day's target AND the planned meal types logged;
  no-routine day = kcal ±10% AND ≥2 actual meal logs; ONE number (±10% default,
  Advanced-only knob clamped 5–15%); the weekly check-in reports the actual
  average daily deviation. Perfect Month is NOT grace-able. The zero-XP "N days
  fully logged" consistency marker (D063) lives on the dashboard. Vacation-day
  counting = day-level UNION (each calendar dayKey inside ≥1 vacation period
  counts at most once — resolve-E2; knob default 14/year).
- Status: planned (M7).
- Inputs: none (derived; consumes habit.rest_planned user flags).
- Source: Roadmap.md:646–666

### M7-4 Achievements (D065/D067/D068)
- What: the full engine per the TWO LIVE external files —
  `PersonalOS-Achievements-v2.md` (THE WHAT: 131 trophies + 47 ladder tiers =
  178 named entries, Growth-Ring tiers Sprout / Root / Branch / Heartwood / Ring
  / Grove) and `TEMP-PLANNING-Achievement-Spec.md` (THE WHEN: E0–E13 shared
  trigger engine, per-trophy TRIGGER predicates, rung tables R1–R47,
  DEPENDENCIES); 1:1 mapping guards (131 ↔ 131 ↔ 47); ZERO XP on every trophy.
  Shared primitives (each a single owner, never re-implemented):
  - account anchor (MIN(occurredAt) across all non-imported, non-tombstoned
    events — computed and FROZEN at the moment the first real event is written;
    stored immutable, read O(1), never user-editable, survives reinstall;
    imports can never set or shift it; rings read it)
  - occurredAt = the evidence vs writtenAt = the clock (robot-consistency family
    reads occurredAt — the ritual, not the typing; writtenAt is operational truth
    only: sync, dedupe, import handling)
  - `sameMonthDay` (leap-day safe)
  - `dayDomainPresence` (six domains {journal, habits, fitness, nutrition, body,
    media}, real-content floor, importless inside the predicate; naive per-day
    scan accepted; CHECK-AND-FIRE: only after a WRITE affecting that domain,
    never timer/render; fires exactly ONCE on flip not-true→true; silent while
    true; repeatables re-arm per cadence; one `achievement.unlocked` event +
    optional one Coach line for Ring/Grove)
  - `qualifyingEntry` (ONE definition per domain: JOURNAL = non-imported ≥40
    words on its own occurredAt day; FOOD = ≥1 real logged item; GYM = ≥1 real
    logged set; HABITS = a real completion that day incl. auto-tracked —
    `completion_revoked` never counts, PLANNED REST NEVER FILLS THE SLOT (honest
    absence); BODY = a real weigh-in OR a physique-timeline photo; VLOG/MEDIA =
    a kept non-imported video with measured duration, captured OR adopted;
    word-trophy carve-out: Novel-Length Life + Deep Dive only)
  - anchored years (non-overlapping 365-day windows from each family's first
    qualifying log; the six-domain family = ONE global anchor — the app's
    first-ever qualifying logged event; "once per calendar year" is DEAD;
    Bookended = the single NAMED calendar-year exception)
  - `yearlyPass`/`consecutiveYears` (one generic pair, eleven multi-year
    families, no honest-gap tolerance)
  - `anniversaryWindow` (±7 days exact day distance, k=1: One Trip Around the Sun
    + A Year on the Bar)
  - rings + Ouroboros (rings stack FOREVER, one per Life-Fully-Logged year, gaps
    never erase; Ouroboros = 10 CONSECUTIVE anchored years — a gap restarts the
    count, any 10 consecutive qualifying years fire, one-time)
  - `phaseStartWindow` (Turn of the Page, ±3 days, per phase transition)
  - Ghost in the Machine (three independent robot runs alive 90 overlapping days:
    Clock / Schedule / NoDeviation ±3%; lookback ONE-SHOT; NO grace; an unlogged
    day = HARD MISS; planned rest freezes but never counts; imports never
    qualify)
  - re-fire map (per-window re-fire for the yearly families; The Long Haul
    re-fires per rebuilt 500-day streak; One Week In / A Hundred Days / Like
    Clockwork / One Trip Around the Sun strictly once per habit; 3y/5y chains at
    chain completion; every once-per-habit/per-window fire names the habit).
- Status: planned (M7). DIRECT Life Tree dependency: Growth-Ring tiers + rings
  ARE the tree's trunk/tier structure (M9).
- Inputs: none (fires from real logged events; user-facing only via
  achievement.unlocked).
- Source: Roadmap.md:667–710

### M7-5 Trigger pins (D068)
- What: G1–G20 + G7b (30-min slot anchor · Same-Question re-arm at 2/3/5 · Then
  and Now 3y · count milestones = DISTINCT qualifying days · Juggling Act
  closed-window scan · Trifecta week · Back-at-It any prior PR · Full-Year-One-
  Habit local anchor · Living Archive shared window · A Week Whole ISO weeks ·
  Frame by Frame calendar months · Bookended 40% floor = 146 · Eyes-on-the-Data
  containment window · Real Progress / On Target active-phase-only · paced 80%
  non-thin weeks · full-cycle partial weeks · same-hour weigh-in anchors · Five
  Strong strict-consecutive · PB-alone day-one verified) — full definitions in
  Gamification.md. Weight ladder = 70 · 75 · 80 · 85 · 90 · 95 · 100 kg (7-day
  rolling average, TWO consecutive weekly checkpoints; weight goals insert into
  THIS ladder). Real Progress = +2.5/+5/+10/+20 kg net from the phase-start
  rolling average, in the goal direction, 1-week rolling confirmation, active
  phase only. On Target = weekly average (5/7-day floor) inside ±10% of the
  day's target, active phase only. Strength-standards rank map + absolute-lift
  ladders + relative family (est-1RM ÷ rolling BW) consume the M2 data.
  Schedule-run rules: Trimester target = the weekly schedule itself; rest weeks
  FREEZE (capped at ONE per run); EMPTY weeks FAIL (the only legal skip is a
  declared planned-rest week); The Schedule Never Breaks rest-day + empty-week
  rules; Unprompted's domain list excludes body; Elite tier never fires a trophy.
- Status: planned (M7).
- Inputs: none (trigger predicates over event log).
- Source: Roadmap.md:711–730

### M7-6 Dashboard render order (L169)
- What: [Today section, calendar/heatmap strip, habits card, goals progress,
  strength snapshot, weekly review/Coach note, journal capture] — the list
  controls home-screen card paint sequencing only; every feature screen renders
  instantly; heavier derived blocks render after a skeleton shimmer, never
  blocking first paint. Streak/XP block + zero-XP marker live here.
- Status: planned (M7).
- Inputs: none (surface).
- Source: Roadmap.md:731–736

### M7-7 Event-log discipline
- What: gamification reads the event log ONLY (habit.completed/missed/
  rest_planned/completed_revoked · journal.created/edited/deleted ·
  nutrition.logged/removed · body.weighed/_revoked · workout.completed/pr/deleted
  · goal.completed (M5) · achievement.unlocked · level.reached); it never writes
  behavior events — derived state + negative-XP events only. The Coach tie-in
  (M8) reacts to achievement events; Gamification never creates trophies and the
  Coach never grants XP.
- Status: planned (M7).
- Inputs: none (read-only consumer). THE canonical event list for the Life Tree's
  input classes.
- Source: Roadmap.md:737–743

Exit criteria (745–755): XP/streak rules unit-tested; no XP for app-opening,
empty entries, logging, imports, reviews, trophies; every owner has exactly one
implementation, all views consume it; achievements fire per v2 + spec files
(census-matched 131↔131↔47), check-and-fire, once-only, imports never trigger;
account anchor frozen at first real event + survives reinstall; grace/planned-
rest/quiet-week interactions unit-tested (rest freezes, grace forgives, quiet
week never shields, ghost no-grace hard-miss); dashboard streak/XP block + "N
days fully logged" marker live.

---

## 9. Milestone 8 — Full Coach (lines 759–874)

Status: **planned** (not built). (Former M2, second third.) Full rule-based Coach
per CoachSystem.md, replacing the M0 stub: Analytics Engine → Rule Engine →
Reflection Generator → Optional AI Adapter (OFF by default, never required,
never degrades the app). Sequencing holds: features planned → Coach rule-book
session → UI/UX ordering pass (S015/S016). Carry-over locks: facts-only speech,
achievements loudness tiers, J4 quiet-week respect, no-shame language,
reviews-give-no-XP, auto-written + deletable outputs, on-open delivery never
push, no-human-judgment voice.

### M8-1 Rule Engine + strictness (D051)
- What: declarative condition → action rules; strictness (supportive | balanced |
  strict — default balanced) scales thresholds + tone only, never the rule set;
  the Coach always stays contextual. NAMED RULES (each a citable section in
  CoachSystem.md):
  - `stallRule(phase)` (4 consecutive weekly deltas outside the direction =
    stall; recovery = next 2 inside; "Broke the Plateau" fires once on recovery;
    deload weeks exempt; thin week = "no data", never a stall; never scolds
    during a stall)
  - plan adherence (per-slot %; single reasonable miss vs pattern; deload exempt)
  - volume balance (under-floor + imbalance; advisory only)
  - rest-day pattern detection (F2: ≥3 rest days trained in trailing 4 wks or
    3-in-a-row → pattern alert + suggest moving volume or a deload; occasional =
    silent; never fires inside a period/vacation)
  - injury/limitation (limited-not-lazy; swap suggestions; history kept)
  - post-deload return ramp (N2: 90% → 95% → 100% across 2–3 sessions; PR
    framing quiet; half-strength volume floors the first return week)
  - deload suggestion (after sustained low adherence)
  - journal drought (no entries in 7 days → nudge; every drought poke routes
    through the rule pipeline so quiet weeks silence all)
  - pace/bulk lines (gaining-too-fast caution; slow-loss-is-muscle; calm
    water-jump line during "Adjusting")
  - pace nudges (I4: gap → kcal gap ×7700 → DIET lever −kcal/day or ACTIVITY
    lever +1 cardio session/MET kcal; heavily-behind = recalibration not crash;
    ahead-in-cut cautious; advisory only, never auto-adjusts the phase)
  - missed-habit warnings (Coach reflection, NEVER the calendar tint)
  - quiet meal reminders (on-open catch-up; meal windows from M4)
  - physique-photo nudge (F5 — default OFF, monthly, no nagging; opens a
    prefilled journal composer tagged health+physique)
- Status: planned (M8).
- Inputs: none (rules consume all domains' derived stats).
- Source: Roadmap.md:772–797

### M8-2 One weekly surface — merged check-in (D052/H2/A4)
- What: the weekly fitness check-in IS the single Sunday review surface; day
  configurable (default Sunday; evaluation window = the 7 consecutive days
  ENDING the configured review day — ONE owner consumed by the strip's weekly
  verdict and the Coach weekly aggregate alike). Coach weekly section (habits,
  journaling, life notes) on top, fitness/nutrition sections below (gym X/Y ·
  packs · weigh-ins X/7 · protein hit-rate — compact sections with tap-through);
  one pipeline, one scroll; nothing deleted, merge only. The R11 strip (M4) is
  the glance; this is the verdict — same `adherenceWeek()` owner, so they can
  never disagree. Copy summary as plain text (F6).
- Status: planned (M8).
- Inputs: none (surface).
- Source: Roadmap.md:798–807

### M8-3 Outputs (coach_outputs — 9-kind dictionary, D051)
- What: `daily_note` · `nudge` · `briefing` (M4) · `check_in_weekly` ·
  `nutrition_checkup` · `milestone_review_goal` · `milestone_review_anniversary`
  · `phase_close` (M2) · `pattern_alert`. All auto-written + deletable, stored,
  exported with backups; the daily dashboard note (1–3 sentences) or a neutral
  "day on track" placeholder.
- Status: planned (M8).
- Inputs: none (output artifacts).
- Source: Roadmap.md:808–813

### M8-4 Milestone review (D050)
- What: the long-form "since you started" anniversary review — anchored to the
  FIRST journal entry's date (derived, not stored; falls back to the
  next-earliest if deleted; no journal entries → no review); cadence ladder +1m ·
  +3m · +6m · +1y · then yearly — editable in Settings Group 2 (enable/disable
  individual milestones or a flat interval); smart catch-up (an anniversary
  passing while away generates the review on the first open after the due date —
  once only, no overdue nag); idempotent (never re-minted); window = since the
  previous review; content sections appear only where data exists; phase blocks
  per phase open in the window (one-by-one, never blended, closure summaries for
  ended phases); FACTS ONLY (entry dates, word counts, tags — never journal
  text). Plus the goal-end card (`milestone_review_goal`): won vintage (computed
  final value shown next to target — the declaration is only the trigger) or
  expired vintage (zero blame), never mid-run. Reviews give NO XP.
- Status: planned (M8).
- Inputs: none (derived review surface).
- Source: Roadmap.md:814–827

### M8-5 Achievement tie-in (D051)
- What: one-direction only — the Coach REACTS to `achievement.unlocked` /
  `level.reached` as recognition material; it NEVER creates trophies and NEVER
  grants XP. Loudness taxonomy: ONLY Ring and Grove receive Coach appreciation —
  one sincere derived line from H3 owner results, never hype; ALL other tiers
  (Sprout / Root / Recognition / Heartwood) are a silent in-game toast with NO
  Coach speech. One Coach line AT MOST per trophy fire; celebrations fire once
  per run/landing, never repeat congratulations; respect quiet-week + facts-only
  privacy; trophy lines ride the same auto-written + deletable `coach_outputs`
  machinery; Ouroboros: the single line fires only when the run lands or ends;
  phase-transition line shares the `phaseAdjacency` helper.
- Status: planned (M8).
- Inputs: none (reacts to achievement events).
- Source: Roadmap.md:828–838

### M8-6 Context switches (L278)
- What: J4 quiet week (M1) — user-started only, quiets nudges (habit-miss,
  drought, streak warnings); vacation/period (M6) quiets adherence like a
  deload; deload ranges (M2) quiet adherence; planned-rest parsing (real-rest vs
  quiet-miss vs grace — rest only prevents resets, never earns anything).
- Status: planned (M8).
- Inputs: none (context consumed from M1/M2/M6 features).
- Source: Roadmap.md:839–843

### M8-7 Journal text analysis (opt-in)
- What: English rule-based text analysis (mood/topics) gated behind the user
  opt-in — the privacy stamp applies per feature: "facts only" OR "needs text
  access → user opt-in first"; the Coach NEVER quotes journal text and NEVER
  inspects media/video content (facts-only by default: entry dates, word count,
  tags, area).
- Status: planned (M8, opt-in).
- Inputs: none (analyzes journal text only with opt-in).
- Source: Roadmap.md:844–848

### M8-8 Settings Group 2 (COACH)
- What: strictness · weekly review day (default Sunday) · Coach notes in calendar
  day view (default on) · milestone-review cadence · quiet-week range. NOT
  offered as toggles: XP/achievement values, formulas, `dayActivityScore` weights
  (settings, never toggles).
- Status: planned (M8).
- Inputs: settings only.
- Source: Roadmap.md:849–852

### M8-9 M2-phase items (D050/D052/D055/D066)
- What: weekly-review-day config · milestone-review cadence · the
  reviews-give-no-XP ruling (locked in the docs; implemented here).
- Status: planned (M8).
- Inputs: none.
- Source: Roadmap.md:853–855

### M8-10 UI/UX ordering pass (L170)
- What: the deferred navigation-bar + layout ordering decision happens at the END
  of this milestone — after ALL features are planned (dashboard ordering, nav
  placement, toolbar/drawer); the last design item in the project; INCLUDES THE
  LIFE TREE MOCKUP (M9).
- Status: planned (M8; produces the M9 mockup).
- Inputs: none.
- Source: Roadmap.md:856–859

Exit criteria (861–874): rule-book session completes, every named rule citable +
unit-tested (engines pure); merged weekly check-in renders on configured day,
strip and verdict never disagree; milestone reviews idempotent + smart catch-up +
FACTS ONLY; goal-end cards only at goal end; strictness scales thresholds + tone
never rule set; coach_outputs stored/deletable/exported; text analysis opt-in
only, Coach never quotes; AI adapter interface exists OFF by default, app fully
functional without it; UI/UX ordering pass complete.

---

## 10. Milestone 9 — Life Tree (lines 876–901)

Status: **planned** (not built; own milestone, D071; biggest UI-heavy feature;
blocks nothing in M0–M8). Detail in §0.4 above.
- What: dedicated full tab with a large stylized life-tree graphic that ACTIVELY
  GROWS as everything is logged and achieved — essentially a big review surface
  of the user's logged life. Growth-Rings / 10-ring structure (trunk rings,
  Pith → Yew — one ring = one Life-Fully-Logged qualifying yearly window) and
  reflects ALL domains + achievement tiers (Sprout → Grove). CONFIRMED PREMISES
  ONLY: 100% derived from real qualified non-imported history (Analytics-Engine-
  derived cache from M7 — never a write-path entity, no new tables, imports never
  grow it, nothing user-editable, no XP anywhere); rings never shrink (missed
  year leaves ring count untouched); no guilt UI (a thin domain looks
  young/dormant, never "failed"); its own nav tab. Placement/wireframe/paint
  strategy/art style/interaction (taps, detail sheets, render cost, theme) ALL
  decided during this build — mockup produced in the UI/UX ordering pass that
  closes M8.
- Inputs: consumes ALL six domains' qualifying events (journal, habits, fitness,
  nutrition, body, media) + achievement tiers + rings. Produces no user inputs.
- Source: Roadmap.md:876–901

Exit criteria (895–901): see §0.4.

---

## 11. Milestone 10 — Drive P2: Backup Integration (lines 905–913)

Status: **planned** (future, scheduled; requires OAuth). Cloud remains optional.
- What: Google OAuth (personal app, no verification), Drive upload of JSON
  backups, restore-from-Drive option.
- Exit criteria (910–913): backup auto-upload on schedule + manual button;
  offline fails safe; restore from Drive backup into fresh install works; OAuth
  token refresh handled; no data loss on failure.
- Inputs: none (infrastructure; backup files move to Drive).
- Source: Roadmap.md:905–913

---

## 12. Milestone 11 — Entity Sync Plane (lines 917–937)

Status: **planned** (future, scheduled; REQUIRED, D059).
- What: true cross-device entity sync for plain-text/stat entity data (phone ↔
  PC), required before any multi-device phase. Mechanism (D019): the event log is
  an append-only UNION of distinct event ids; same-entity edits resolve by
  last-writer-wins on timestamp, deviceId breaking exact ties. TOMBSTONE RULE: a
  delete ALWAYS wins over an earlier-timestamped edit arriving late from another
  device — an entity never resurrects. The plane does NOT change the storage
  backend (locked at M0). One-writer-per-device stays the base assumption; no
  existing behavior is re-derived because sync exists. Settings Group 8 (sync
  skeleton) renders only after this milestone ships.
- Inputs: none (infrastructure).
- Source: Roadmap.md:917–937

---

## 13. Milestone 12 — Drive P2.5: Media Blob Sync (lines 941–956)

Status: **planned** (future, scheduled).
- What: with plain-data sync shipped (M11), P2.5 shrinks to BIG MEDIA BLOBS ONLY
  — the previous "synchronizes ONLY media_attachments metadata + thumbnails"
  claim is REPLACED. Same D019 mechanism for both. Full media blobs transfer
  across the user's devices (phone + PCs) via the lightweight Drive data pool;
  deviceId-flagged foreign-device items surface as stubs (MediaStorage.md).
- Exit criteria (950–956): big blobs sync iPhone ↔ PC (plain data already
  covered by M11); vault browser shows foreign-device items as view-only stubs
  ("stored on [device], not this device") — never broken links; local-only mode
  unchanged; reuses P2 OAuth/token mechanics; no new cloud architecture.
- Inputs: none (infrastructure; media blobs + deviceId metadata).
- Source: Roadmap.md:941–956

---

## 14. Milestone 13 — Drive P3: Media Vault (lines 960–993)

Status: **planned** (future, scheduled).
- What: MediaRepository cloud adapter (provider-agnostic `CloudMediaAdapter` —
  upload/download/delete/list only; provider specifics fully contained, D034);
  media upload with resumable uploads; offload workflow (uploaded → free device
  space); on-demand re-download; storage meter reflects vault state; tiered
  handling of long vlogs (manual archive marker; desktop archive sink); full PC
  vault browser for archived media incl. the J7 "My Videos" videos home (per
  MediaStorage.md): PC-only per the D035 physically-true test (files live on the
  PC's disk); filters All / On this device / In the Drive vault / Archived on
  this PC + "This PC only" toggle; thumbnail-grid default + compact-list toggle +
  the J7 search box (the shared J2 matcher); auto-adopt of ONE chosen folder
  (File System Access API — Chromium only; other browsers degrade to a manual
  folder pick per session) — "put a file, it appears"; adopted rows carry the
  `adopted` marker and are EXCLUDED from the storage meter; dedup via content
  hash; the app NEVER deletes/moves/renames files in the folder (folder = source
  of truth); honest "file missing" stubs; "do-not-readopt" list for removed
  files; vlog local-buffer nudges (rolling 3–5 day rewatch buffer, configurable,
  nudge-only — never silent deletion) wire into the vault browser here; export
  documents PC-archived blobs as `exported: false` stubs.
- Exit criteria (981–986): record → auto-sync → offload → view-back loop on
  iPhone; 15GB capacity plan (tiered retention per MediaStorage.md); local-only
  mode functional; PC vault browser desktop-only; foreign-device items view-only
  stubs.
- Inputs: media uploads/adoptions (adopted rows EXCLUDED from storage meter —
  note for Life Tree: adopted media DOES qualify as VLOG/MEDIA qualifying entry,
  M7 line 691–692 "captured OR adopted").
- Source: Roadmap.md:960–986

### M13-P3+ Bulk "migrate everything to Drive" (future, NOT built now)
- What: loop through local/PC-archived media, upload each via CloudMediaAdapter,
  update `storageRef`/`syncState` on each row, optionally free local/PC storage
  after confirmed uploads. Requires no new architecture; scheduled only if the
  user gains more Drive storage.
- Status: future (not scheduled).
- Inputs: none (infrastructure).
- Source: Roadmap.md:988–993

---

## 15. Future Systems (candidate order — decision required before each) (lines 997–1009)

Status: **future/candidate** (not scheduled). Each must: plug into the event
ecosystem + Life Areas, pass the same MVP-quality bar, justify itself against
the Core Loop. A DecisionLog entry + user decision required before any is
scheduled.

### FUT-A Study
- What: sessions, subjects, revision tracking; Learning area. Not yet specified
  (no ledger rows) — decision + spec before scheduling.
- Status: future (unspecified).
- Inputs (future, speculative): study sessions, subjects, revision logs — new
  domain(s) beyond the six; would need Life Tree input-class extension.
- Source: Roadmap.md:1003–1004

### FUT-B Productivity refinement
- What: projects (routines already shipped with M4). Not yet specified.
- Status: future (unspecified).
- Inputs (future, speculative): project entities, project tasks.
- Source: Roadmap.md:1005–1006

### FUT-C AI Adapter
- What: optional LLM-powered reflections (DeepSeek API, local models, or any LLM
  later) — never required, OFF by default, must never degrade the app; the app
  must function completely forever without it.
- Status: future (optional, OFF by default).
- Inputs: none (read-only reflection generator; consumes derived stats, not raw
  text without opt-in).
- Source: Roadmap.md:1007–1009

---

## 16. Idea Park (recorded, NOT a spec) (lines 1011–1043)

Status: **future/deferred** — recorded only; not specs. Every item needs the
same "DecisionLog + user decision before scheduling" discipline.

### IP-1 FUT-2 — Rest/recovery tracking
- What: sleep, rest days, readiness — overlaps the deferred N5 line; check
  overlap before scoping.
- Inputs (future): sleep/rest/readiness logs.
- Source: Roadmap.md:1013–1014

### IP-2 FUT-3 — Body measurements beyond weight
- What: waist/chest/arms — complements the D031 physique-photo timeline.
- Inputs (future): body measurements (measurement_* typed rows already exist in
  M2 body_metrics schema — additive, no schema change).
- Source: Roadmap.md:1015–1016

### IP-3 FUT-4 — Macro targets per phase
- What: overlaps NU7 per-phase g/kg defaults; check NU7 overlap before scoping.
- Inputs (future): per-phase macro target configuration.
- Source: Roadmap.md:1017–1018

### IP-4 FUT-5 — Periodization
- What: programs = ordered sequence of weekly plans with loading phases (W1
  normal → W2 added sets → W3 heavy low-rep → W4 deload); new programs table +
  block-scheduling layer; every analytics view gains a block dimension; the
  biggest item by far — revisit when the user is 12+ months of consistent
  training in. Light alternative noted: week-level intensity labels
  (deload/heavy/medium) without a full block layer.
- Inputs (future): program definitions (ordered weekly plans), block/loading
  phases.
- Source: Roadmap.md:1019–1024

### IP-5 N3 — Warm-up sets
- What: setType working|warmup column + exclusions from volume/PR/est-1RM/
  adherence — skipped, door open.
- Inputs (future): warmup-set marks.
- Source: Roadmap.md:1025–1026

### IP-6 N5 — Recovery readiness
- What: morning 1–5 recovery_log + PO/Coach branches + M2 correlation analysis +
  deload trigger + check-in line — skipped, door open; do not duplicate with
  FUT-2.
- Inputs (future): daily 1–5 recovery ratings.
- Source: Roadmap.md:1027–1029

### IP-7 N6 — Exercise cues/notes
- What: cueNotes text column, dimmed at block top, editable everywhere —
  skipped, door open.
- Inputs (future): exercise cue notes.
- Source: Roadmap.md:1030–1031

### IP-8 N8 — Session media
- What: widen `media_attachments` to a polymorphic entity anchor
  journal|workout via additive migration; tiers/PC-archive unchanged — skipped,
  door open.
- Inputs (future): workout session photos/videos (would extend MEDIA domain
  qualifying entries to fitness).
- Source: Roadmap.md:1032–1034

### IP-9 Wrist/ankle trophy bodies
- What: deferred with the door open: if legs-and-ankles tracking ever lands, it
  is a string-enum body-part extension on existing `body_metrics` rows; affected
  trophies read the same rows, no contract change.
- Inputs (future): wrist/ankle measurements.
- Source: Roadmap.md:1035–1038

### IP-10 Do-not-build records (D069)
- What: I6 (next-week preview in check-in), I8 (picker ergonomics), F3 (session
  post-note), Part-B journal prompts #2/#3/#4/#7, the RPE column (struck from
  any schema), FUT-1 muscle-map graphics, AI food scanner, anything beyond the
  D060 closed list — revisit only with a genuinely new use case.
- Status: CLOSED (do-not-build; revisit only with a genuinely new use case).
- Inputs: NONE — explicitly closed; must never appear in the Life Tree input
  model.
- Source: Roadmap.md:1039–1043

---

## 17. Graph/"Brain" View (under consideration — NOT scheduled) (lines 1047–1059)

Status: **under consideration** (not locked; do not build, do not design beyond
the stub, until explicitly scheduled).
- What: Obsidian-style visual graph of the life data: nodes are entities (journal
  entries, habits, goals, projects, life areas); edges are explicit user links
  (mentions / part-of / related) via a future `links` table — a small schema
  addition, not a rewrite (D023).
- Placement: post-M1 (AMBIGUOUS numbering — see §A4); no earlier milestone
  depends on it. Rendering approach OPEN: pure-Dart force-directed package vs JS
  interop to d3-force. Zero impact on M0 scope and the storage decision.
- Inputs (future): explicit user links (mentions / part-of / related) between
  entities — the ONLY planned user-link input surface in the entire roadmap.
- Source: Roadmap.md:1047–1059

---

## 18. Milestones vs Principles (guardrails) (lines 1063–1068)

- Every milestone keeps: offline-first, data ownership (export/restore), cloud
  optionality, $0 budget, no boundary violations.
- If a milestone would require violating a non-negotiable principle, the
  milestone is wrong — redesign it.
- Source: Roadmap.md:1063–1068

---

## 19. Cross-milestone deferred/closed items (explicit notes)

- Journal free-text parsing EXPLICITLY DEFERRED (M5 scope, lines 494–497): real
  NLP stays out (D004); journal text stays manual structured entry; rule-based
  paste auto-assort shipped with M2.
- Fitness surface CLOSED (D060, lines 283–288): see M2-CLOSED.
- Do-not-build records (D069, lines 1039–1043): see IP-10.
- "once per calendar year" achievement counting is DEAD (lines 694–696):
  anchored-years model instead.
- `goal.progress` write-path event RETIRED (lines 511–518): computed-only.
- P2.5 old claim REPLACED (lines 38–41): big media blobs only.
- Quiet weeks do NOT shield streaks — the shield is the M7 Grace setting
  (lines 110–111).
- Imported rows never earn XP / never grow achievements or the Life Tree
  (lines 104–105, 641–645, 886–889).
- "weigh-in" is a FUTURE habits autoSource producer (line 272) — not built in M2.
- Adopted (PC-folder) media qualifies as MEDIA-domain qualifying entries
  ("captured OR adopted", lines 691–692, 971–972) but is EXCLUDED from the
  storage meter.
- Trophies grant ZERO XP (line 634); reviews give NO XP (line 827); Coach never
  grants XP (lines 742–743).
- The 00:30-snack display mismatch is accepted and documented (lines 403–405,
  444–445).

---

## 20. Counts

- Milestones scheduled with scope: 14 (M0–M13).
- Milestone-0 features: 6 (Dashboard, Journal, Habits, Export/Restore, Coach
  stub, Storage meter + warnings) — built/in-progress; plus process items
  (storage spike, UI overhaul gaps G1–G11).
- Planned milestone features (M1–M9): 70
  (M1: 7 · M2: 18 · M3: 8 · M4: 7 · M5: 5 · M6: 7 · M7: 7 · M8: 10 · M9: 1).
- Future scheduled features (M10–M13): 5 (M10: 1 · M11: 1 · M12: 1 · M13: 1 ·
  P3+ bulk migrate: 1).
- Total scheduled-milestone items: 81.
- Future/candidate/idea-park/consideration: 14 (Future Systems: 3 · Idea Park:
  10 · Graph: 1).
- TOTAL listed items: 95.
- Built: 6 (M0, still in flight — UI overhaul pending, exit gate not passed).
- Planned (scheduled, not built): 75.
- Future/unscheduled/deferred/closed-but-recorded: 14.
- Explicitly CLOSED surfaces: 2 (Fitness surface D060; Do-not-build records
  D069) + 1 retired event (goal.progress) + 1 replaced claim (P2.5 scope).

## 21. Ambiguities & surprises (for the Life Tree classification step)

- A1. **J7 is referenced but never milestone-placed in this doc**: the shared
  J2/J7 matcher ships in M1 (lines 92–93), the J7 "My Videos" videos home +
  search box render in the M13 PC vault browser (lines 967–973), but no milestone
  defines the J7 video library itself. Presumed to live in Architecture.md /
  MediaStorage.md — verify there.
- A2. **F2 (rest-day patterns) appears twice**: as the M2 closure note ("rest-day
  patterns (F2) + recovery readiness (N5) cover rest from this milestone onward",
  lines 287–288) and as a named M8 Coach rule (line 781). F2 is ALIVE; F3 is dead.
- A3. **F5 physique-photo nudge** is specified in M1 (lines 127–128) but ships
  with M8 (lines 795–797) — default OFF, monthly, no nagging.
- A4. **Graph placement "post-M1"** (line 1054) uses stale numbering: in OLD
  numbering M1 = Goals & Tasks (now M5); in NEW numbering M1 = Journal Features.
  Unresolved which is meant.
- A5. **Idea Park items N3/N5/N6/N8 are "skipped, door open"** — NOT closed; the
  Life Tree should treat their potential future inputs as open slots
  (e.g., recovery_log 1–5 scale, warmup-set marks, session media).
- A6. **"weigh-in" autoSource is a declared future producer** (line 272) — habit
  auto-creation from weigh-ins will arrive later than M2.
- A7. The Roadmap's achievement files (v2 + TEMP-PLANNING spec, lines 668–672)
  are the authoritative 178-entry list — the Life Tree's tier structure
  (Sprout/Root/Branch/Heartwood/Ring/Grove) and rings (Pith → Yew) come from
  there, NOT from this doc.
- A8. Life Tree consumes the M7 event-log discipline list (lines 737–743) as its
  canonical input-class source; note MEDIA domain has no dedicated event in that
  list (media rides journal.created / adoption), worth reconciling.
- A9. Milestone 1's J3 import is the ONLY bulk historical-data entry point;
  imports must never grow the tree (multiple locks, lines 104–105, 641–645,
  886–889).
- A10. Only ONE user-link input surface exists in the whole roadmap: the Graph
  view's future `links` table (mentions / part-of / related, line 1051) — if the
  Life Tree ever wants explicit user-authored relationships, that is the seam.