# PersonalOS — Roadmap

Milestones with exit criteria. Work only the current milestone. Every milestone
ends with: backup exported, tests green, docs updated, DecisionLog updated.

Authorized edits: (1) `docs/StructuralImpactProposal.md` §7 (Stage C verdicts,
2026-08-20) — the original re-scope mandate; (2) the user-directed overhaul of
2026-08-23 (DecisionLog D081): every large, fully-specified system got its own
milestone (journal features, fitness, nutrition, routine, calendar, Life Tree),
Goals & Tasks moved later (weight/strength goals need the fitness data from M2),
the former M2-phase was split into Analytics & Gamification → Full Coach →
Life Tree, and the Drive chain kept its locked order (P2 → entity sync → P2.5 →
P3). Renumbering map — older references (S-notes, D-series, other docs) stay
interpretable through it:

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

M0's in-flight UI overhaul (gaps G1–G11, `docs/M0ScopeGapReview-2026-08-21.md`)
lands before M0 exit, per that review — M0's scope and exit criteria are
untouched.

## Drive Phasing (referenced below)

- **P1 — Manual export/import (local files):** MVP. Already part of Milestone 0.
- **P2 — Backup integration:** JSON backups upload to private Google Drive folder
  (Milestone 10).
- **P2.5 — Media sync after plain-data sync (see Milestone 12):** the old
  "synchronizes ONLY media_attachments metadata + thumbnails" claim is
  replaced — the full data-sync plane (Milestone 11) ships first, and P2.5
  shrinks to **big media blobs only**, using the same D019 mechanism.
- **P3 — Media Vault sync (Milestone 13):** full media blob sync; Drive becomes
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

## Milestone 1 — Journal Features (J1–J6 + physique-photo timeline)

**Scope:** completes the "Record" leg of the core loop — the Journal surface
past M0's timeline/compose (DecisionLog D056, D073). All offline-first,
facts-only, no new tables.

- **J1 On-This-Day memory strip:** a small card on the Calendar (memory-map
  screen, renders once M6 ships) + a tiny line at the top of the Journal view
  showing what was logged exactly N years ago today (nearest past year with
  data first: 1y → 2y → 5y…). Pure derived query — zero new storage/schema/
  screens; tap opens the entry normally. Rules: H4 (no data → strip does not
  render), NO XP, facts-only (never reads text content), no notifications;
  honest media stubs for PC-archived media (thumbnail + "archived to desktop");
  leap day: Feb-29 entries match Feb 28 in non-leap years (the shared
  `sameMonthDay` utility).
- **J2 Journal search:** entry points on the Journal page + Calendar; finds
  entries by plain word/keyword/tag, filterable by Life Area; results
  newest-first with the matching term highlighted; tap → full entry. Fully
  offline, airplane-safe; zero new storage (no index table at personal scale);
  simple whole-word + tag matching, no fuzzy/AI — ONE shared matcher also
  serves the J7 video search (Architecture.md §Shared search matcher; H3
  discipline); run in a worker if it ever feels slow. Privacy: finds your
  words, never shares, never gives the Coach text access.
- **J3 Batch import of past entries:** Settings → Data → "Import entries" — one
  plain-text file with a documented format (date | title | text per block) →
  preview list with dates ("47 entries, 2019–2021") → confirm → rows added as
  normal, backdated. Entries ONLY — importing NEVER creates habit check-ins,
  weights, or any other data (no fake history). `imported` flag + immutable
  `importHash` (columns already in the M0 schema); dedupe on (original date +
  body-content-hash) captured AT IMPORT TIME — re-import of the same file is
  blocked, and editing an imported entry later can never re-enable a duplicate;
  preview reports "N already imported, M new". DayKey = the ORIGINAL date.
  No XP for imported content; achievement/cadence counters exclude imported
  rows (engine-side enforcement lands with M7).
- **J4 Quiet Week:** user marks a date range (Settings → Coach) during which the
  Coach pauses nudges (habit-miss lines, journal-drought pokes, streak
  warnings) — the guilt loop is muted. ONLY the user starts it (never
  auto-detected); history stays TRUE; streaks stay REAL — quiet weeks do NOT
  shield streaks (the streak shield is the Grace setting, M7). Includes the
  calendar day-view drought line — every drought poke routes through the Coach
  rule pipeline (full Coach rule integration completes with M8).
<!-- AMENDED 2026-09-26 (gen-2 docs pass; C-05/L080): the J5 "packages a copy" clause is amended to EXCLUDE hidden memories — C-05 memory hygiene (hide controls) applies EVERYWHERE memories surface, including exports / Year Book PDFs (a hidden memory is really hidden; display-level flag only, data never deleted). Superseding source: C-05 (memory hygiene — hide controls only). -->
- **J5 Year Book export:** Settings → Data → "Year book" → pick a year → a
  READABLE human PDF: journal entries in date order, embedded photos/vlogs, a
  small stats page (days journaled, habits, gym sessions, milestones).
  READ-ONLY — packages a copy, never moves or rewrites real data; honest media
  stubs for PC-archived items; no Coach/XP — pure artifact. Hidden memories
  (C-05 hide controls) are EXCLUDED from the Year Book — hidden-ness applies
  everywhere memories surface, including exports / PDFs. **Build gate:** PDF
  generation on Flutter requires a package — DecisionLog entry + user approval
  at build time (no-new-dependencies rule; recorded open item).
- **J6 Tag/area filter chips:** on the Journal page, filter chips for #tags and
  Life Area (incl. physique-tagged A5 entries) — turns search and the
  calendar's Journal filter into a one-tap findable list. Derived only.
- **D031 Physique-photo timeline:** dedicated comparison view (side-by-side /
  slider across time) over media_attachments anchored to journal entries tagged
  `health`+`physique` (hidden system tag) — zero new tables, zero new media
  paths. This category is exempt from any future general-photo compression
  tier. The F5 monthly nudge rule (default OFF, no nagging) ships with the Full
  Coach milestone (M8).

**Includes:** Settings Group 7 (DATA & STORAGE) already anchors the import and
year-book homes (M0); Group 2 (COACH) gains the quiet-week range; Group 5
gains the calendar-media defaults that M6 consumes.

**Exit criteria:**
- Search + filters work fully offline; the J2/J7 shared matcher is one
  implementation.
- Batch import round-trip: preview, confirm, dedupe (same file re-import
  blocked by stored hash), dayKey = original date, imported rows never earn XP.
- On-This-Day strip renders only when data exists, shows honest media stubs,
  handles leap day via the shared utility.
- Quiet week silences the M0 Coach-stub nudges; streaks are unaffected by it.
- Year book produces a readable PDF with embedded media + honest stubs
  (dependency decision recorded before build).
- Physique timeline shows tagged photos over time; the F5 nudge exists as a
  documented Coach rule (built in M8).

---

## Milestone 2 — Fitness & Body

**Scope:** the workout side FIRST (fitness build order, DecisionLog D041 —
macros follow in M3). The health area becomes a first-class domain (D041):
workouts/templates/sets, exercises + muscle groups, PR + records vault, cardio,
phases, body metrics + weigh-ins, deloads, injuries, habits bridge. Manual
structured entry only (D041); no NLP; no Apple Health; no device APIs (D009).

- **Workouts & templates (D042):** two-layer model — `workout_templates` +
  `workout_template_exercises` (first-class; `pairWith?` superset pairing on
  template rows only); performed sessions copy template rows at save (frozen,
  append-only history); edits affect future only; "apply session deviation to
  template" folds structure only, never weights (per-template opt-out); two-a-
  day allowed (own rows; a plan slot counts DONE if any session references it;
  freeform = "done differently"); units STORED in kg everywhere, display-
  converts via the Group 3 units key (kg|lb / cm|in — O8); midnight rule:
  dayKey = capture-time local date; `routineSlotLogId` set at save from the
  routine slot that preloaded the session (M4) — freeform paths keep it null.
- **Exercises (D041/D044):** seeded ~44-exercise lookup (verbatim list in
  `Database.md`), user-extendable like `areas`; categories push|pull|legs|core|
  cardio; 2-level muscle-group hierarchy (junction, primary/secondary roles
  assigned ONCE per exercise — sets auto-inherit, never re-logged); big-5
  profile lifts (Bench, Squat, Deadlift, OHP, Barbell Row) tracked ON by
  default.
- **Session UI (D076):** daily logging flow (plan-driven pre-fill + editable;
  add/remove/swap freely; freeform + paste fallback; plans never store
  weights); last-time hint with freshness tiers (<2wk full · 2–4wk quieted with
  date · >4wk collapsed AND progressive-overload suggestions pause — ~90% of
  last-time starting baseline instead of +2.5 kg extrapolation; constants
  configurable in settings); session comparison (N4) vs the previous
  same-template session (per-exercise weight/reps/est-1RM deltas, volume delta,
  PR flag; stale/deload/injury contexts annotated, never judged; reachable from
  history, calendar day, records vault); template cloning (F4) one-tap incl.
  pairings; "Track this exercise" in the session menu → dashboard "Your lifts"
  block; copy weekly check-in / phase-close report as plain text (F6).
- **Auto-assort paste parser (D076):** rule-based loose-grammar paste
  ("4x8@60kg") → exercises/sets/reps/weight assigned; fuzzy match + "Did you
  mean?" confirm; inline create flow with muscle assignment; NEVER silent
  auto-create; offline, NO AI (timing heritage: M1-or-M2; lands here).
- **Strength & PR (D043):** single `est1RM` owner (Epley from the BEST working
  set — zero max attempts; 1–12 rep guard); `strengthSnapshot(exerciseId, asOf)`
  is the canonical reader; record modes (weight-mode → est-1RM within 1–12;
  rep-count mode → best clean rep count, NO 12-cap, `addedLoadKg` breaks ties);
  PR = strictly-greater est-1RM/rep best beats the all-time best; ONE PR credit
  per exercise per session; PR ladder / vault / milestone history ALWAYS
  derived by walking sessions — `workout.pr` events exist for Coach/gamification/
  toast ONLY, never the truth for vault or achievements; deleting/editing a
  session simply re-derives everything; negative-XP symmetry handled by M7.
- **Records vault:** derived-only view — all-time est-1RM ladder per tracked
  exercise (with dates), PR history timeline from the session-walk, milestone
  trophies (1st/5th/10th PR, 1.5×/2× bodyweight, 100th workout, all-time tonnage
  per group, yearly counts — fired by M7's achievement engine), lifetime totals
  (workouts, sets, tonnage, phase training days).
- **Exercise drill-down (I1):** dashboard "Your lifts" block (tracked exercises
  only: est-1RM sparkline, record, status dot, deload/injury aware) + full
  drill-down screen (est-1RM curve, top-set trend, PR markers, deload/injury
  bands shaded, ratio overlay from the 7-day rolling bodyweight, every logged
  set); untracked exercises reachable from within a session only (plus the
  one-tap "Track this exercise"). Pure read-path aggregation, zero schema.
- **Strength standards (D044):** frozen 5-tier seed (Beginner/Novice/
  Intermediate/Advanced/Elite, men + women columns) for the 4 canonical lifts
  ONLY (bench/squat/deadlift/OHP — verbatim values in `Gamification.md`);
  barbell row stays ratio-display-only; non-BIG-5 exercises ratio-only;
  bodyweight/rep-mode exercises NEVER touch the table. Rank map: "Strength
  Standard Reached" fires ONLY on ranks 2/3/4 (Novice→Branch, Intermediate→
  Heartwood, Advanced→Grove) via M7; ranks 1 and 5 never fire (Coach/profile
  grade only). Overall level = display-only profile grade (avg of big-5 ratios,
  Wilks-style) — never a trophy, never a gate. Absolute-lift trophy ladders
  fire ONLY on a real logged set (threshold weight ≥ threshold AND reps ≥ 1,
  straight from exercise_sets — NO est-1RM substitution, no inflation).
  Formula constants (Mifflin-St Jeor, Wilks/DOTS, Epley) = plain Dart pure
  functions, public formulas, non-togglable.
- **Progressive overload (PO):** per-exercise progression styles — LINEAR-WEIGHT
  (compounds), REP-FIRST double progression (accessories: +1–2 reps first, reps
  > target by 2 across sets THEN weight bump), BODYWEIGHT (reps/sets/added
  load, no fake kg); AUTO by default (styles auto-seeded by category; the
  suggestion auto-generates each session); override at EVERY level
  (per-session accept/change, per-exercise style + step, GLOBAL KILL-SWITCH in
  Group 3, default on); conservative, deload-aware, suggestion-only, never XP;
  increments user-configurable (2.5 kg step default, +2 rep-first threshold).
- **Cardio (D045):** workouts gain kind strength|cardio + additive
  durationSec?/distanceKm?/avgEffort?/kcalBurned?; cardio types
  Run/Cycle/Row/Swim/Walk/Stairs; MET estimate verbatim — `MET × 3.5 ×
  bodyweightKg × minutes / 200` (the ×3.5 is mandatory; public tables) —
  auto-suggested when a cut phase / weight goal is active, ALWAYS labeled;
  manual kcalBurned always available and wins (feeds the energy math directly);
  cardio slots feed adherence; weekly cardio minutes + type split in analytics;
  cardio seed entries in the exercise lookup.
- **Phases (D047):** type bulk|cut|maintain; startDate; endDate? (planned OR
  open-ended; ONE active phase; close explicitly, optional "how'd it go");
  baseline weight anchored at start (rolling average); targetWeeklyRateMin/Max
  presets auto-adjust to macro targets (M3); phase close renders the full
  derived report (weight trend via rolling avg, pace verdict vs target rate,
  sessions count, adherence %, volume totals + group volume, PRs with margins,
  achievements, goal pace) — the Coach line section + `phase_close`
  `coach_outputs` snapshot land with M8; `phaseAdjacency` helper shared with the
  Turn achievement (M7).
- **Body metrics & weigh-ins (D046, NU8):** `body_metrics` typed rows
  (weight | measurement_*); multiple weigh-ins/day allowed and stored, FIRST
  of the day = canonical daily trend (later same-day rows stored but EXCLUDED
  from derived series); deleting the first row promotes the next (retroactive
  re-derive accepted); 7-day rolling average (`rollingAvgWeight`) shared with
  goals (M5) and the engine; thin-data rule (<7 weigh-ins → "Adjusting" label,
  never a verdict/projection from a single point); the R10 routine weigh-in
  slot ships with M4.
- **Deload markers (D051):** `deload_markers` table (any range, reason?,
  journalEntryId?, notes?); days in range = adherence-quiet, volume-balance
  exempt, strength chart shaded; PRs always stay real. Separate table, NOT a
  phases type. Coach can suggest a deload after sustained low adherence (M8).
- **Injuries / limitations (N1):** `limitations` table (exerciseId? OR
  muscleGroupId?, startDate, endDate?, note); while active: PO suggestions
  quiet, PR framing softened, volume floors suspended (like deload), swap
  suggestions from the same muscle group, adherence learns limited-not-lazy;
  healed = instant restore, history kept ("limited 3× this year"); no medical
  claims — user-declared flag + behavior changes.
- **Volume balance:** seeded min-effective-sets-per-week floors per muscle
  group (MRV-style, settings-editable — Group 3 Advanced); weekly under-floor
  + imbalance checks (chest 18 vs back 3); phase-adjusted floors (cut may run
  lower); advisory only — never XP/penalty. Coach pattern lines land with M8.
- **Plan adherence:** per-slot adherence % derived from sessions vs plan slots;
  free-training deviations = "done differently", not missed; single reasonable
  miss vs pattern ("skipped chest 3 of 4 weeks"); deload-tagged weeks exempt.
  Coach rules land with M8.
- **Habits bridge (D064):** habits gain `autoSource` ("workout"; "weigh-in" is
  a future producer); session save auto-writes the day's habit check-in in the
  SAME transaction (`autoCreated`; manual entries win); session deletion cleans
  up its auto check-in AND emits `habit.completed_revoked` transactionally;
  deload-day counting per habit (Group 6, default counts). Auto-tick XP
  real-when-real + revoke symmetry land with M7's anti-farming gate.
- **First-run fitness onboarding (I9, D076):** captures Mifflin inputs
  (height/age/sex/activity — Group 4 settings keys) and proposes a first weekly
  plan + seeded tracked exercises — user can customize/replace/clear ALL from
  day one; nothing forced; energy math alive day 1 (macros land in M3); the
  proposed weekly plan binds when the Routine milestone ships (M4).
<!-- AMENDED 2026-09-26 (gen-2 docs pass; D120): the D060 fitness-surface closure is OVERRIDDEN FOR THE NAMED LOCKED CANDIDATES ONLY — idea-park N3 is RE-OPENED by F-05 (setType) and N5 by F-19 (Training Form); EVERYTHING ELSE under the closure stays CLOSED. Superseding decision: D120 (D060 fitness-surface override — gen-2 F-series supersession). -->
- **Fitness surface CLOSED (D060), amended by the gen-2 override (D120):** no
  new features for the fitness side beyond the gen-2 F-series candidates the
  user approved (recorded in D121+; drafted into M2 above + its target docs) —
  the surface is complete (workouts, sets, exercises, templates, plans, phases,
  PR, vault, PO, cardio, volume, deload, injuries, adherence, goals, habits
  bridge, check-in, phase report; media deferred). Specifically: idea-park
  **N3** (warm-up sets → F-05 `setType`) and **N5** (recovery → F-19 Training
  Form) are RE-OPENED by those locks; N6/N8 + periodization remain park-able
  (Idea Park); rest-day patterns (F2) cover rest from this milestone onward;
  add only when real usage says so.

**Includes:** Settings Group 3 (FITNESS: units, PO kill-switch, weight step,
rep-first threshold, physique-photo nudge OFF, rolling pace window 7d/14d;
Advanced: freshness tiers, MRV floors) + Group 6 (HABITS: auto-track per habit,
deload-day counting) + Mifflin inputs as Group 4 keys; health-area events
(`workout.completed`, `workout.pr`, `workout.deleted`) documented and exported
in backups (the formatVersion-2 enumeration in `Database.md`).

**Exit criteria:**
- Session round-trip: template-preloaded logging (or freeform/paste) saves
  frozen session rows; editing a template never changes past sessions.
- PR detection matches the session-walk derivation exactly (edit/delete a
  session → ladder re-derives, no stale PR); `workout.pr` fires per real PR for
  Coach/toast only.
- Record-mode routing (est-1RM vs clean reps), 1–12 guard, one-credit-per-
  session, tonnage = weight-mode only — unit-tested.
- Phase create → pace verdicts (ahead/on-track/behind) with "Adjusting" on thin
  data; phase close renders the full report.
- Weigh-ins: first-of-day canonical rule verified; rolling average drives pace.
- Cardio MET estimate labeled; manual kcalBurned overrides; no double-count
  with M3's deriveMacros.
- Auto-tracked habit check-in writes transactionally with the session; deleting
  the session revokes it (single compensating event).
- Auto-assort: paste → assign → "Did you mean?" → never silent auto-create;
  works offline.
- No Apple Health, no device APIs, no NLP — manual entry only (D009/D041).

## Milestone 3 — Nutrition & Energy Balance

**Scope:** macros after the workout side (fitness build order, D041). Receipt-
line nutrition + the energy-balance math core (DecisionLog D046, D062, D063).

- **Receipt-line model (D062, NU1–NU12):** `nutrition_logs` per-meal rows (kcal
  + protein/carbs/fat logged FROM THE START); day total = SUM of rows, never a
  stored day row; dateKey = ACTUAL eat date (NU4 backdating — the deliberate
  exception to the midnight rule); occurredAt = actual eat time; mealTypeId?/
  recipeId?/name?; portionMultiplier resolved ON THE ROW (1x/1.5x/2x — never
  extra recipe copies); `source` column (manual | scanner | fooddb | packed |
  scale) — the producers seam: every input prints the same receipt line,
  offline forever.
- **Meal types (NU2):** seeded breakfast/lunch/dinner/snack, user-extendable +
  editable (rename/add/delete own; deleting a type never touches existing
  rows); cosmetic grouping only.
- **Recipes (NU3):** `nutrition_recipe` (name, kcal, macros, mealTypeId?,
  servingNotes?); one-tap log fills a FRESH row (copy-in at save; recipeId kept
  for traceability — editing a recipe NEVER rewrites past rows); favorites/
  recents bar of top-logged recipes; "re-log since <date>" batch back-fill =
  future opt-in, never auto-rewrite history.
- **Catch-up / backfill (NU4, NU4a):** meals file under the ACTUAL eaten date;
  gentle "you logged a meal for yesterday" nudge against double-counting;
  school-end batch flow ("lunch to school + afternoon snack" in one flow); soft
  duplicate guard (same dateKey + mealTypeId + recipeId/food selection →
  non-blocking "Already logged X — add another?"; user decides; shared by the
  school-end batch and the morning pack, M4); backfill bound: same-day/last-24h
  = normal, OLDER dates = distinct "historical backfill" mode that NEVER extends
  streak/check-up compliance.
- **Energy math (D046):** Mifflin-St Jeor BMR (+5 male / −161 female) ×
  NON-TRAINING activity factor → TDEE baseline (height/age/sex/activity as
  Group 4 settings keys, never profile fields — D003); training expenditure
  DERIVED from logged sessions and ADDED SEPARATELY (cardio kcalBurned/MET from
  M2; strength burn = conservative labeled estimate band; manual kcalBurned
  replaces the band entirely — no double count, NU9); signed weekly rate:
  `calorieTarget = TDEE + (rate × 7700)/7` (minus = cut, plus = bulk; additive,
  never inverted; 7700 kcal/kg is an honest estimate, non-togglable);
  `deriveMacros(dateKey)` = THE single day-target owner (H3) — kcalTarget +
  protein/fat/carbs remaining + collision flag (protein + fat grams exceed the
  kcal budget → "raise kcal or lower protein"; default: keep protein, drop fat
  to the floor); no silent NaN/negative; protein g/kg per phase (cut 2.0 /
  bulk 1.8 / maintain 1.6, editable, per-Area override), fat floor ~0.6 g/kg
  (editable up), carbs as remainder (Atwater 4/9/4); no-phase fallback (goals
  first → "maintain" default; targets stay elevated); manual TDEE override
  FREEZES auto-recompute AND the protein/fat g/kg basis until cleared (B4);
  <!-- AMENDED 2026-09-26 (gen-2 docs pass; D121 F-13): the absolute "only rolling-average math" claim is superseded — the engine keeps the shared windowed util; the body weight-trend owner uses the time-indexed EMA. Superseding decision: D121 (F-13 — Libra EMA trend). -->
  `rollingWindowMean` = the only windowed rolling-average util in the engine;
  the body trend owner uses the time-indexed EMA (F-13).
- **Events (D058):** `nutrition.logged` (mealType, kcal/macro totals, source,
  actual eat dateKey — no recipe detail) + `nutrition.removed`; `body.weighed`
  (per canonical first-of-day weigh-in) + `body.weighed_revoked`; all written
  transactionally with the row change, metadata-only; pack-consumes also emit
  `nutrition.logged` (M4); no per-set/per-slot/routine-noise events.
- **Food macro lookup (NU13, D062):** USDA FoodData Central (core, public
  domain) + OpenFoodFacts (CC0, optional second source) behind ONE normalized
  macro model; a curated OFFLINE set (common foods + the user's own saved
  foods/recipes — covers ~90% of daily logging, zero network) is always
  available; the bigger search list loads only online and is CACHED (top-N
  results, only picked rows downloaded); `nutrition_food_cache` = ONE
  regenerable table (NOT in the backup enumeration); saved-food list DERIVED
  from nutrition_logs history (a saved food IS a row the user logged — restore
  can never wipe it); manual entries are ground truth — lookup only pre-fills a
  NEW row the user confirms, never mutates a logged value; NO AI/photo-scan
  (source='estimated' rejected); toggle in Group 4, default ON (OFF = plain
  manual entry, behavior switch, never deletes data). **Build gate:** open-
  source DATA dependency — DecisionLog entry + user approval before
  formalizing (recorded open item).
- **Settings Group 4 (NUTRITION):** Mifflin inputs · manual TDEE override ·
  protein g/kg per phase · fat floor · quiet meal reminders (default on — the
  mechanism lands with M4's meal windows; seeded defaults work before any
  routine) · Advanced: fully-logged streak window (±10% default, Advanced-only
  knob clamped 5–15%), backfill bound, macro-collision priority, food lookup
  toggle.

**Includes:** the macro-gap bar (D063) is specified here but RENDERS inside the
R12 briefing card — it lands with the Routine milestone (M4); the zero-XP
"N days fully logged" consistency marker lands with M7.

**Exit criteria:**
- Log a meal (manual + recipe + portion multiplier) → day total = SUM of rows;
  backdated meals land on the ACTUAL eat date; soft duplicate guard prompts,
  never blocks.
- deriveMacros: targets match TDEE + signed-rate math; collision flag +
  priority render; no-phase fallback works; manual TDEE freezes kcal AND
  protein/fat basis.
- Food lookup: offline curated set works with zero network; looked-up foods
  cached and reusable offline; manual rows never overwritten.
- Nutrition/body events + revokes write transactionally; exported in backups;
  the Coach (M8) reads the food/weight story from the log.
- The 00:30-snack display mismatch is documented and accepted (logs under the
  actual date, shows under the previous day's routine slots — both numbers
  correct).

---

## Milestone 4 — Daily Routine & Briefing

**Scope:** nutrition closed → routine session (S009). The daily planning
surface: day templates, the weekly binder, performed days, the briefing card,
the week recap (DecisionLog D061, D063).

- **Day templates (D061, R2):** `day_templates` + `day_template_slots` with
  typed kinds: meal | pack | workout | activity | rest | sleep | weigh-in
  (kind IS the extension seam, like nutrition's `source`); named reusable
  full-day plans ("School Day", "Weekend", "Holiday"); slot `link` (recipeId
  for meal slots, workoutTemplateId for workout-kind slots); template building
  = copy ops (import yesterday's / copy previous day, then tweak) — past days
  stay frozen, edits affect future only; delete affects future bindings only
  (a routine referencing a deleted template auto-falls back to the default);
  user-defined slot kinds anytime.
- **Weekly binder (R7/R8):** `week_plans`/`week_plan_slots` RE-PURPOSED as the
  routine-week binder (slots reference `dayTemplateId`, NOT workoutTemplateId;
  null = rest); a weekly routine = a named 7-slot binding list + per-day
  override ("this Thursday = Holiday Day") WITHOUT forking the routine — ONE
  binding model, no independent per-day toggle; at the START of the calendar
  week (first day per WEEK STARTS ON, Group 1) the user picks the routine for
  that week (or "continue current"); routines can be assigned FOR a period
  (start→end week, e.g. a school term) with automatic fallback to the DEFAULT
  routine; otherwise they continue indefinitely; prompt discipline: no weekly
  prompt on unbroken runs — the app asks only at first-ever setup, when a
  period ends, on user-opened override, or an explicit want-change.
- **Performed days (routine-A1):** `routine_days` (dateKey, templateUsedId —
  SNAPSHOT copy of the applied template, frozen) + `routine_slot_logs` (status
  planned | done | skipped | packed | eaten); past days stay frozen; pack→meal
  linkage at TEMPLATE level (a pack's Home = its target meal slot), pack
  CONTENTS per date are day-instance data; pack items carry calories entered
  at pack time (honest numbers — bag in front of you), consumed at EAT time
  (nutrition_logs row, source='packed' — never double entered); not eaten =
  cancelled, never enters kcal; weigh-in slot (R10): one tap → `body_metrics`
  type=weight (the NU8 first-of-day rule applies); midnight rule: routine-day
  = calendar day boundary (the 00:30 snack display mismatch is accepted and
  documented).
- **Briefing card (R12, D053/D063):** the dashboard "Today" section becomes the
  single daily surface: today's slots in order (per the chosen routine +
  overrides), done-vs-missing markers, the NU12 macro-gap bar ("protein
  168/168g · kcal 2120/2875" — deriveMacros, zero storage), one-tap log/pack
  actions; quiet meal reminders point here (on-app-open catch-up only, never
  push — D018; seeded meal windows work before any routine); session pre-load
  (A7): the Gym slot TAP opens the session screen pre-loaded with that day's
  linked workout template (exercises, target sets/reps in order, last-time
  hints, PO suggestions ready) — logging = confirm/adjust/execute; workouts
  gains `routineSlotLogId` set at save from the preloading slot (freeform =
  null; the slot stays "planned" — the user marks done / done-differently
  explicitly); backfill semantics: a backfilled meal marks its slot done in
  THAT date's view, never today's; the macro-gap bar always sums the day's
  target vs the day's full receipt — display may lag, numbers never disagree.
- **Week recap (R11/A6):** week-view strip above the displayed week grid —
  glance: gym X/Y · packs eaten · weigh-ins X/7 · PR count · protein hit-rate;
  denominators count only days that HAVE the slot (single owner
  `adherenceWeek()`); strip window = the DISPLAYED week (explicitly labeled vs
  the review-day verdict window, M8); tapping the strip opens the merged
  weekly review (M8) — glance and verdict are two display modes of ONE owner.
- **Quiet meal reminders (D063):** on-app-open catch-up nudges; known meal
  windows = routine-bound meal slots, seeded defaults (breakfast/lunch/dinner/
  snack) when no routine.
- **Settings:** Group 1 (GENERAL) week-start · Group 5 (CALENDAR & MEDIA):
  vlog rewatch buffer days (3–5, default 5 — ties to the vlog local buffer
  nudge, M13), plan-vs-actual default (Both), month-header fact line (on).

**Exit criteria:**
- Build a routine from day templates, bind it to a week, override a single
  day; next week re-binds normally; past days frozen; prompt discipline holds
  (no prompt on unbroken runs).
- Briefing card shows today's slots + macro-gap bar + one-tap log/pack;
  backfilled meals mark the slot done in THAT date's view.
- Gym slot pre-loads the session screen with the linked template; freeform
  sessions stay slot-independent.
- Pack → "ate it" consumes a receipt row at eat time; a skipped pack never
  enters kcal.
- Weigh-in slot writes body_metrics; the first-of-day canonical rule holds.
- Week strip numbers match adherenceWeek() denominators exactly; glance vs
  verdict windows are labeled.

---

## Milestone 5 — Goals & Tasks

**Scope:** (former M1 — moved here so weight/strength goals ship with real
body/exercise data; user-directed re-order). Goals (milestone-based,
deadlines), Tasks (due dates), Life Area wiring everywhere, journal ↔ goal
linking, `task.completed` events. Journal text stays manual structured entry;
journal free-text parsing is explicitly deferred — real NLP stays out ("AI
optional, never required" per D004). Rule-based paste auto-assort shipped with
M2.

- **Goals (D048):** goals gain kind `generic | weight | strength` from the
  FIRST goals build (additive nullable columns only — kind, exerciseId?,
  targetValue?; no forced migration on years-old data later). Broad weight
  goals reuse the existing `goals` system ("reach 75kg by <date>") — NOT a new
  system: progress auto-computed from body_metrics rolling weight, pace =
  remaining kg ÷ remaining days, deadline grading. Strength goals = an exercise
  FK (must be tracked) + target est-1RM + targetDate; baseline = best est-1RM
  at creation; progress auto-computed; pace graded like phases; est-1RM ≥
  target → the existing `goal.completed`; deadline miss = "missed by X kg".
  Estimates are labeled. Goal ↔ phase consistency: creating a weight goal
  auto-proposes a matching phase and vice versa (one-tap link); a conflict
  warning fires if the active phase contradicts the goal.
- **Goal progress (D049):** computed ONLY — a real-time derivation, never a
  stamp; one owner per goal kind (`goalProgress(goalId)`: weight → rolling
  weight vs start/deadline; strength → est-1RM vs target). The write-path
  `goal.progress` event is RETIRED — only the rare user-declared
  `goal.completed` remains. Goal cards also show a derived projection line
  (D050): the deadline plus "at current pace → ~date" (weight: rolling-trend
  extrapolation; strength: est-1RM regression) with honest-estimate labeling —
  needs ≥2wk data else "more data", stale/deload = uncertain, always derived
  never stored; also a line in the phase close report (M2).
- **Tasks:** simple tasks with due dates; complete offline; `task.completed`
  events documented and exported in backups.
- **Dashboard:** goal progress + today's tasks blocks become real (replace the
  M0 placeholders); goal deadlines ring calendar cells once the Calendar ships
  (M6).
- **Goal-end review card (`milestone_review_goal`, D050):** appears ONLY at
  goal end — won (computed final value beside the target; the declaration is
  only the trigger) or expired (zero blame, "window closed, here's where you
  started") — never mid-run. The card machinery ships with the Full Coach
  milestone (M8); goals completed before then simply have no card yet.

**Exit criteria:**
- Create goal with milestones; goal progress is computed-only via the goal-kind
  owner — no `goal.progress` event.
- Weight/strength goals track real body/exercise data; pace + projection lines
  render with honest labels; deadline grading correct.
- Tasks complete offline and sync state remains consistent (no sync yet).
- Dashboard shows real goal/task blocks (replaces placeholders).
- Events for M5 types documented and exported in backups.

## Milestone 6 — Calendar & Periods

**Scope:** the Calendar = the app's MEMORY MAP, never a judgment surface
(DecisionLog D054) + the periods model (D075). Everything derives from existing
H3 owner functions — zero new storage, zero writes (it navigates to the day
view / real screens only).

- **Month grid tint (L250):** day cells show a TINT, never dots/numbers/icons.
  FILTER MODE = single system (Journal | Fitness | Nutrition | Body | Habits) —
  the whole day cell shades in that system's color (filters render only for
  systems that have data, H4). FILTER MODE = All — one neutral tint whose
  STRENGTH = how much happened (1 thing = faint, 6+ = strongest), a single
  gradient of activity intensity. Tint intensity = volume via ONE H3 owner
  `dayActivityScore` + `tintLevelFor`: workout/session = 3 (max 1/day) · meals
  = 1 each (CAP 3/day) · daily weigh-in = 1 (max 1/day) · journal entries = 1
  each (CAP 2/day) · habit completed = 0.5 each (UNCAPPED — more habits done is
  the completeness signal itself; meals/journal cap because volume ≠ activity).
  Missed habits contribute 0 — no negative/red state (missed-habit warnings
  live in the Coach reflection, never the tint). Today = separate border ring;
  selected = accent outline; future days dimmed/desaturated. No glyphs, emojis,
  or numbers on the grid.
- **Day view (L251):** tap any day → chronological derived list of everything
  that day (weigh-in, meals, gym session, journal entries, habits), every line
  derived, links to the real screens, filter chips apply; PLAN-vs-ACTUAL split
  toggle (Actual / Plan / Both) pairing routine slots against what actually
  happened ([planned: gym 17:00 · actual: missed]); GOAL DEADLINES ring the day
  cell in the goal color (day view lists "deadline: reach 75kg" first — renders
  once goals exist, M5); Coach outputs render as a quiet line under the day's
  events (Coach notes in calendar day view — default on).
- **Year heatmap:** month → year = 12 mini-months of the same tint
  (GitHub-contribution style), same owner, no new data.
- **Month-header fact line:** "N days logged" (All view) / "N days journaled"
  (Journal filter) — one small derived fact (dayActivityScore > 0), not a
  verdict; filter-aware wording; renders only in the All view.
- **Week grid ↔ calendar month:** linked by tapping a week (the M4 planning
  grid connects through the week↔month toggle).
- **On-This-Day strip card (J1, M1)** renders here (the memory-map screen).
- **Periods (D075):** user-created start/end date range + title + type
  (vacation | term | holiday | …) — an INVISIBLE METADATA record, NOT a journal
  entry; content collected by DATE-RANGE derivation (inclusive [start, end]),
  never copied or owned; `extraEntityIds` = the ONE deliberate exception (an
  item dragged into a period outside its range); deleting/changing a period
  NEVER orphans content (re-range = re-slice instantly); creation BOTH ways
  (drag a range on the calendar / manual date picker from trips) ends in a
  visible confirmation step ("Create period [start → end]?") — an accidental
  drag never silently creates a range; trip view = journal+media timeline
  scoped to the period (reuses the D031/journal timeline pattern); the app
  NEVER fabricates a blog post on period creation; period renders as a top
  band / cell tint context whose colored block opens the trip view; vacation/
  period quiets Coach adherence like a deload ("vacation, not laziness" — rule
  lands with M8); periods ride the backup enumeration (user rows survive
  restore).
- **Settings Group 5 (CALENDAR & MEDIA):** default filter (All) · plan-vs-
  actual default view (Both) · month-header fact line (on) · vacation-day
  threshold knob for "Took the Time" (default 14 days per vacation year —
  resolve-E2; day-level UNION counting consumed by M7) · Advanced: tint
  weights/caps (as locked — keep fixed).

**Exit criteria:**
- Calendar renders tint-only (no glyphs); All-intensity and single-system
  filters match dayActivityScore exactly; year heatmap works.
- Day view lists derived events + plan-vs-actual; goal deadline rings appear
  once goals exist.
- Periods: create (drag + manual), confirmation step, trip view, re-range
  re-slices content; deleting a period never touches entities.
- Month fact line correct per filter; week↔month linking works.

---

## Milestone 7 — Analytics Engine & Gamification

**Scope:** (former M2, first third — the M2-phase was split for build size).
The Analytics Engine owner catalog, XP/streaks/levels, the full achievement
engine (178 entries), the zero-XP consistency marker. Phone↔PC parity applies
from this milestone onward (DecisionLog D060): every feature/screen exists on
BOTH platforms EXCEPT the PC archive (folder adoption + vault browser incl.
the J7 video library — PC-only, because the files physically live on the PC,
M13). Capture is NOT phone-exclusive (webcam / file import). Both devices read
the same H3 owners so a number never differs; offline behaves identically on
both.

- **Analytics Engine (D049):** the consolidated H3 owner-function catalog —
  every derived stat has exactly ONE owner; ALL views call it, never
  re-implement; rounding happens once, inside the owner; no generic-aggregator
  meta-framework. Catalog: `rollingAvgWeight` · `deriveMacros` (M3) ·
  `adherenceWeek` · `strengthSnapshot` (M2) · `dayActivityScore` (M6) ·
  `totalVolume` (weight-mode sets only) · `goalProgress(goalId)` (M5) ·
  `paceVerdict` (shared by phase/goal pace + projections; the Coach cites it,
  M8) · `sameMonthDay` · `dayDomainPresence` · `phaseStartWindow` ·
  `phaseAdjacency` · `yearlyPass`/`consecutiveYears` · `anniversaryWindow` ·
  `rollingWindowMean` · `est1RM` (M2) · `qualifyingEntry` ·
  `robotOverlapWindow`/`runAlive`. (Full catalog authority: Architecture.md.)
- **Gamification (D011/D066):** XP, levels, streaks with grace — meaningful
  progress only. No XP for app-opening, browsing, empty entries, logging
  itself, imported content, reviews, or trophies (trophies grant ZERO XP). XP
  values are fixed HERE and are NOT offered as settings toggles. Journal XP
  capped (first 2 content-gated entries/day); media XP rides the journal cap;
  PR XP small + milestone-tiered (1st/5th/10th) + size-weighted (a +≥2.5 kg
  est-1RM gain counts; micro-PRs don't); auto-tick XP is real-when-real (an
  auto-tracked habit = full XP ONLY when the triggering session is real — the
  shared anti-cheat gate; revoked ticks return XP via the compensating
  negative-XP event; no double-earn, no delete-log cycles); XP reversal is
  SYMMETRIC (negative-XP events, never deletion or retroactive edits); imported
  rows never earn (`isImported` enforced INSIDE every owner predicate — it is
  part of the contract — and the 3-question anti-cheat gate rejects any import
  that would raise or trigger a trophy; imports show history, never earn).
- **Streaks (D068):** per habit + per Life Area, derived from the event log.
  Grace = 1 grace day per 7-day window (default 1, editable, ONE shared budget,
  applies everywhere — habit AND life-area streaks; a missed day is still
  recorded as a miss; grace only prevents the break; grace NEVER shields a
  robot-consistency run). Planned rest (`habit.rest_planned` — per-habit
  one-tap rest flag, created ONLY by explicit user choice, never from silence;
  delete/edit writes the compensating `_revoked` event): a rest day FREEZES the
  streak (neither resets nor advances — a neutral hole); rests never earn
  anything; NOT grace, NOT quiet week, NOT an infinite shield (resting 30 days
  straight earns nothing). Weekly checkpoint: the rolling-average evaluation at
  the CLOSED calendar week (Sunday), once per week; thin weeks (<5/7 logged
  weigh-in days) neither confirm nor reset; weight-ladder and Real Progress
  read the two most recent consecutive non-thin weeks. Fully-logged day (two
  valid paths, one concept): routine-active day = kcal within ±10% of the
  day's target AND the planned meal types logged; no-routine day = kcal ±10%
  AND ≥2 actual meal logs; ONE number (±10% default, Advanced-only knob clamped
  5–15%); the weekly check-in reports the actual average daily deviation.
  Perfect Month is NOT grace-able. The zero-XP "N days fully logged"
  consistency marker (D063) lives on the dashboard. Vacation-day counting =
  day-level UNION (each calendar dayKey inside ≥1 vacation period counts at
  most once — resolve-E2; knob default 14/year).
- **Achievements (D065/D067/D068):** the full engine per the TWO LIVE external
  files — `PersonalOS-Achievements-v2.md` (THE WHAT: 131 trophies + 47 ladder
  tiers = 178 named entries, Growth-Ring tiers Sprout / Root / Branch /
  Heartwood / Ring / Grove) and `TEMP-PLANNING-Achievement-Spec.md` (THE WHEN:
  E0–E13 shared trigger engine, per-trophy TRIGGER predicates, rung tables
  R1–R47, DEPENDENCIES); 1:1 mapping guards (131 ↔ 131 ↔ 47); ZERO XP on every
  trophy. Shared primitives (each a single owner, never re-implemented):
  account anchor (MIN(occurredAt) across all non-imported, non-tombstoned
  events — computed and FROZEN at the moment the first real event is written;
  stored immutable, read O(1), never user-editable, survives reinstall; imports
  can never set or shift it; rings read it) · occurredAt = the evidence vs
  writtenAt = the clock (the robot-consistency family reads occurredAt — the
  ritual, not the typing; writtenAt is operational truth only: sync, dedupe,
  import handling) · `sameMonthDay` (leap-day safe) · `dayDomainPresence`
  (six domains {journal, habits, fitness, nutrition, body, media}, real-content
  floor, importless inside the predicate; naive per-day scan accepted;
  CHECK-AND-FIRE: only after a WRITE affecting that domain, never timer/render;
  fires exactly ONCE on flip not-true→true; silent while true; repeatables
  re-arm per cadence; one `achievement.unlocked` event + optional one Coach
  line for Ring/Grove) · `qualifyingEntry` (ONE definition per domain: JOURNAL
  = non-imported ≥40 words on its own occurredAt day; FOOD = ≥1 real logged
  item; GYM = ≥1 real logged set; HABITS = a real completion that day incl.
  auto-tracked — `completion_revoked` never counts, PLANNED REST NEVER FILLS
  THE SLOT (honest absence); BODY = a real weigh-in OR a physique-timeline
  photo; VLOG/MEDIA = a kept non-imported video with measured duration,
  captured OR adopted; word-trophy carve-out: Novel-Length Life + Deep Dive
  only) · anchored years (non-overlapping 365-day windows from each family's
  first qualifying log; the six-domain family = ONE global anchor — the app's
  first-ever qualifying logged event; "once per calendar year" is DEAD;
  Bookended = the single NAMED calendar-year exception) ·
  `yearlyPass`/`consecutiveYears` (one generic pair, eleven multi-year
  families, no honest-gap tolerance) · `anniversaryWindow` (±7 days exact day
  distance, k=1: One Trip Around the Sun + A Year on the Bar) · rings +
  Ouroboros (rings stack FOREVER, one per Life-Fully-Logged year, gaps never
  erase; Ouroboros = 10 CONSECUTIVE anchored years — a gap restarts the count,
  any 10 consecutive qualifying years fire, one-time) · `phaseStartWindow`
  (Turn of the Page, ±3 days, per phase transition) · Ghost in the Machine
  (three independent robot runs alive 90 overlapping days: Clock / Schedule /
  NoDeviation ±3%; lookback ONE-SHOT; NO grace; an unlogged day = HARD MISS;
  planned rest freezes but never counts; imports never qualify) · re-fire map
  (per-window re-fire for the yearly families; The Long Haul re-fires per
  rebuilt 500-day streak; One Week In / A Hundred Days / Like Clockwork / One
  Trip Around the Sun strictly once per habit; 3y/5y chains at chain
  completion; every once-per-habit/per-window fire names the habit).
- **Trigger pins (D068):** G1–G20 + G7b (30-min slot anchor · Same-Question
  re-arm at 2/3/5 · Then and Now 3y · count milestones = DISTINCT qualifying
  days · Juggling Act closed-window scan · Trifecta week · Back-at-It any
  prior PR · Full-Year-One-Habit local anchor · Living Archive shared window ·
  A Week Whole ISO weeks · Frame by Frame calendar months · Bookended 40%
  floor = 146 · Eyes-on-the-Data containment window · Real Progress / On
  Target active-phase-only · paced 80% non-thin weeks · full-cycle partial
  weeks · same-hour weigh-in anchors · Five Strong strict-consecutive ·
  PB-alone day-one verified) — full definitions in `Gamification.md`. Weight
  ladder = 70 · 75 · 80 · 85 · 90 · 95 · 100 kg (7-day rolling average, TWO
  consecutive weekly checkpoints; weight goals insert into THIS ladder). Real
  Progress = +2.5/+5/+10/+20 kg net from the phase-start rolling average, in
  the goal direction, 1-week rolling confirmation, active phase only. On
  Target = weekly average (5/7-day floor) inside ±10% of the day's target,
  active phase only. Strength-standards rank map + absolute-lift ladders +
  relative family (est-1RM ÷ rolling BW) consume the M2 data. Schedule-run
  rules: Trimester target = the weekly schedule itself; rest weeks FREEZE
  (capped at ONE per run); EMPTY weeks FAIL (the only legal skip is a declared
  planned-rest week); The Schedule Never Breaks rest-day + empty-week rules;
  Unprompted's domain list excludes body; Elite tier never fires a trophy.
- **Dashboard render order (L169):** [Today section, calendar/heatmap strip,
  habits card, goals progress, strength snapshot, weekly review/Coach note,
  journal capture] — the list controls home-screen card paint sequencing only;
  every feature screen renders instantly; heavier derived blocks render after
  a skeleton shimmer, never blocking first paint. Streak/XP block + zero-XP
  marker live here.
- **Event-log discipline:** gamification reads the event log ONLY
  (habit.completed/missed/rest_planned/completed_revoked · journal.created/
  edited/deleted · nutrition.logged/removed · body.weighed/_revoked ·
  workout.completed/pr/deleted · goal.completed (M5) · achievement.unlocked ·
  level.reached); it never writes behavior events — derived state + negative-XP
  events only. The Coach tie-in (M8) reacts to achievement events; Gamification
  never creates trophies and the Coach never grants XP.

**Exit criteria:**
- XP/streak rules unit-tested; no XP for app-opening, empty entries, logging,
  imports, reviews, or trophies.
- Every owner function has exactly one implementation; all views consume it
  (no re-derivation anywhere).
- Achievements fire per the v2 + spec files (census-matched 131↔131↔47),
  check-and-fire semantics, once-only fires, imports never trigger.
- Account anchor frozen at the first real event; survives reinstall.
- Grace / planned-rest / quiet-week interactions unit-tested (rest freezes,
  grace forgives, quiet week never shields, ghost no-grace hard-miss).
- Dashboard streak/XP block + "N days fully logged" marker live.

---

## Milestone 8 — Full Coach

**Scope:** (former M2, second third). The full rule-based Coach per
`CoachSystem.md`, replacing the M0 stub: Analytics Engine → Rule Engine →
Reflection Generator → Optional AI Adapter (OFF by default, never required,
never degrades the app). Sequencing holds: features planned → Coach rule-book
session → UI/UX ordering pass (S015/S016). The complete rule catalog is a
DEDICATED deep session run at the START of this milestone — carry-over locks it
must honor: facts-only speech, the achievements loudness tiers, J4 quiet-week
respect, no-shame language, reviews-give-no-XP, auto-written + deletable
outputs, on-open delivery never push, no-human-judgment voice; the session also
fixes the voice-rule wording.

- **Rule Engine + strictness (D051):** declarative condition → action rules;
  strictness (supportive | balanced | strict — default balanced) scales
  thresholds + tone only, never the rule set; the Coach always stays
  contextual. Named rules (each a citable section in `CoachSystem.md`):
  `stallRule(phase)` (4 consecutive weekly deltas outside the direction =
  stall; recovery = next 2 inside; "Broke the Plateau" fires once on recovery;
  deload weeks exempt; thin week = "no data", never a stall; never scolds
  during a stall) · plan adherence (per-slot %; single reasonable miss vs
  pattern; deload exempt) · volume balance (under-floor + imbalance; advisory
  only) · rest-day pattern detection (F2: ≥3 rest days trained in trailing 4
  wks or 3-in-a-row → pattern alert + suggest moving volume or a deload;
  occasional = silent; never fires inside a period/vacation) · injury/
  limitation (limited-not-lazy; swap suggestions; history kept) · post-deload
  return ramp (N2: 90% → 95% → 100% across 2–3 sessions; PR framing quiet;
  half-strength volume floors the first return week) · deload suggestion
  (after sustained low adherence) · journal drought (no entries in 7 days →
  nudge; every drought poke routes through the rule pipeline so quiet weeks
  silence all) · pace/bulk lines (gaining-too-fast caution; slow-loss-is-muscle;
  calm water-jump line during "Adjusting") · pace nudges (I4: gap → kcal gap
  ×7700 → DIET lever −kcal/day or ACTIVITY lever +1 cardio session/MET kcal;
  heavily-behind = recalibration not crash; ahead-in-cut cautious; advisory
  only, never auto-adjusts the phase) · missed-habit warnings (Coach
  reflection, NEVER the calendar tint) · quiet meal reminders (on-open
  catch-up; meal windows from M4) · physique-photo nudge (F5 — default OFF,
  monthly, no nagging; opens a prefilled journal composer tagged
  health+physique).
- **One weekly surface — merged check-in (D052/H2/A4):** the weekly fitness
  check-in IS the single Sunday review surface; the day is configurable
  (default Sunday; evaluation window = the 7 consecutive days ENDING the
  configured review day — ONE owner consumed by the strip's weekly verdict and
  the Coach weekly aggregate alike). Coach weekly section (habits, journaling,
  life notes) on top, fitness/nutrition sections below (gym X/Y · packs ·
  weigh-ins X/7 · protein hit-rate — compact sections with tap-through); one
  pipeline, one scroll; nothing deleted, merge only. The R11 strip (M4) is the
  glance; this is the verdict — same `adherenceWeek()` owner, so they can never
  disagree. Copy summary as plain text (F6).
- **Outputs (coach_outputs — 9-kind dictionary, D051):** `daily_note` · `nudge`
  · `briefing` (M4) · `check_in_weekly` · `nutrition_checkup` ·
  `milestone_review_goal` · `milestone_review_anniversary` · `phase_close`
  (M2) · `pattern_alert`. All auto-written + deletable, stored, exported with
  backups; the daily dashboard note (1–3 sentences) or a neutral "day on
  track" placeholder.
<!-- AMENDED 2026-09-26 (gen-2 docs pass; D102): the milestone-review anchor is no longer the FIRST journal entry's date — it is the app-wide shared birth anchor (the account's FIRST IN-WINDOW EVENT per D100, frozen at first write, never shifted by deletion; a gym-only user gets their review on the tree's birthday). Superseding decision: D102 (the birth anchor — one shared anchor for the whole app). -->
- **Milestone review (D050):** the long-form "since you started" anniversary
  review — anchored to the app-wide shared birth anchor (D102: the account's
  first in-window event, frozen, never shifts on deletion; derived, not
  stored);
  cadence ladder +1m · +3m · +6m · +1y · then yearly — editable in Settings
  Group 2 (enable/disable individual milestones or a flat interval); smart
  catch-up (an anniversary passing while away generates the review on the
  first open after the due date — once only, no overdue nag); idempotent
  (never re-minted); window = since the previous review; content sections
  appear only where data exists; phase blocks per phase open in the window
  (one-by-one, never blended, closure summaries for ended phases); FACTS ONLY
  (entry dates, word counts, tags — never journal text). Plus the goal-end
  card (`milestone_review_goal`): won vintage (computed final value shown next
  to target — the declaration is only the trigger) or expired vintage (zero
  blame), never mid-run. Reviews give NO XP.
- **Achievement tie-in (D051):** one-direction only — the Coach REACTS to
  `achievement.unlocked` / `level.reached` as recognition material; it NEVER
  creates trophies and NEVER grants XP. Loudness taxonomy: ONLY Ring and Grove
  receive Coach appreciation — one sincere derived line from H3 owner results,
  never hype; ALL other tiers (Sprout / Root / Recognition / Heartwood) are a
  silent in-game toast with NO Coach speech. One Coach line AT MOST per trophy
  fire; celebrations fire once per run/landing, never repeat congratulations;
  respect quiet-week + facts-only privacy; trophy lines ride the same
  auto-written + deletable `coach_outputs` machinery; Ouroboros: the single
  line fires only when the run lands or ends; phase-transition line shares the
  `phaseAdjacency` helper.
- **Context switches (L278):** J4 quiet week (M1) — user-started only, quiets
  nudges (habit-miss, drought, streak warnings); vacation/period (M6) quiets
  adherence like a deload; deload ranges (M2) quiet adherence; planned-rest
  parsing (real-rest vs quiet-miss vs grace — rest only prevents resets, never
  earns anything).
- **Journal text analysis (opt-in):** English rule-based text analysis (mood/
  topics) gated behind the user opt-in — the privacy stamp applies per feature:
  "facts only" OR "needs text access → user opt-in first"; the Coach NEVER
  quotes journal text and NEVER inspects media/video content (facts-only by
  default: entry dates, word count, tags, area).
- **Settings Group 2 (COACH):** strictness · weekly review day (default
  Sunday) · Coach notes in calendar day view (default on) · milestone-review
  cadence · quiet-week range. NOT offered as toggles: XP/achievement values,
  formulas, `dayActivityScore` weights (settings, never toggles).
- **M2-phase items (D050/D052/D055/D066):** weekly-review-day config ·
  milestone-review cadence · the reviews-give-no-XP ruling (locked in the
  docs; implemented here).
<!-- AMENDED 2026-09-26 (gen-2 docs pass; D117 D2): the "includes the Life Tree mockup (M9)" clause is SUPERSEDED — the archetype mockups defer to M9 phase D2 (the in-M9 trait-space + mockup step, D117 D1/D2); the M8-closing UI/UX ordering pass handles the Life Tree tab's NAV PLACEMENT only. Superseding decision: D117 (the development handoff plan). -->
- **UI/UX ordering pass (L170):** the deferred navigation-bar + layout
  ordering decision happens at the END of this milestone — after ALL features
  are planned (dashboard ordering, nav placement, toolbar/drawer); the last
  design item in the project; closes M8 with the Life Tree tab's NAV PLACEMENT
  only (the archetype mockups themselves land in M9 phase D2).

**Exit criteria:**
- Rule-book session completes; every named rule exists as a citable,
  unit-tested section (engines pure).
- Merged weekly check-in renders on the configured day with all sections; the
  strip and the verdict never disagree (same owner).
- Milestone reviews generate once (idempotent), smart catch-up works, FACTS
  ONLY; goal-end cards appear only at goal end (won or expired).
- Strictness changes thresholds + tone, never the rule set.
- Coach outputs stored in `coach_outputs`, deletable, exported.
- Text analysis runs only with the user opt-in; the Coach never quotes journal
  text.
- AI adapter interface exists, OFF by default; the app is fully functional
  without it.
- UI/UX ordering pass complete (nav/layout ordering locked).

## Milestone 9 — Life Tree

**Scope:** a dedicated full tab with a large stylized life-tree graphic that
ACTIVELY GROWS as everything is logged and achieved — the big review surface
of the user's logged life. The gen-2 design chapter makes this a fully
specified, locked milestone (D071's "idea-recorded" verdict is re-pointed:
the tree-7 decision records D085–D117 in DecisionLog + the canonical spec
`docs/LifeTree.md`, with `life-tree-design/` as the authoritative working
design). Blocks nothing in M0–M8. It incorporates the ring brand (trunk rings
— one ring per Life-Fully-Logged qualifying yearly window; D090/D101/D116 D10)
and reflects ALL domains + achievement tiers (Sprout → Grove). The build
follows D117's clean step plan; the design chapter is COMPLETE — nothing here
gates the first engine line.

- **A. Pre-M9 (opportunistic — any docs pass / adjacent milestone):** A1 the
  docs-pass amendment register (this pass: DecisionLog D085–D117 records; the
  Gamification / CoachSystem / Roadmap / Database / UIUX amendments); A3 the
  owner-contract groundwork (qualifyingEntry + streak with M7, goalProgress
  with M5, coachEngagement with M8, dayActivityScore with M6, mediaPresence
  with M10–M13); A4 the emotional copy-language pass (dormancy copy, bank
  counter framing, empty-spring copy, legend card).
- **B. Phase 0 — engine foundation:** B1 the renderer perf spike (≤16 ms at
  LOD-1/2 on the target device tier — the F9 gate; the LOD ladder, instanced
  procedural leaves, the autumn leaf-fall re-bake + capped particles); B2 the
  state-model implementation (the derived cache, the logFingerprint, the
  atomic swap, the set-commutative fold, the single-writer lock — D107/D108/
  D109); **B3 the dev-tools tuning surface (D105 — MUST exist before any
  visual tuning):** a dev-only debug panel that plays every register/palette
  value and drives a live re-derivation + re-render; build-time only, NEVER
  shipped to users; B4 the derivation engine (the incremental protocol, the
  axes with the D116 pins, the stage clock with the D116 values, the banking +
  the tier schedule D092/D095/D096).
- **C. Phases 1–2 — the organs:** trunk/rings renderer; branches/twigs/forks
  with the canopy rule; buds (D087); leaves with clusters + storage-leaf
  character; flowers + the banking; fruits + spurs; periods.
- **D. Phase 3 — the visuals (order matters):** **D1 the trait-space 17-audit
  (D112/D113 — every trait WIRED / RESERVED-UNMAPPED / STRUCTURAL /
  EXCLUDED-BY-DESIGN) MUST precede the trait-driven visuals;** D2 the archetype
  mockups — the visual validation from the validated register numbers, the 19
  paper-run archetypes as the gallery (the mockup is produced HERE, in M9 — not
  in the M8-closing UI/UX ordering pass, which handles nav placement only); the
  L-15 grid feed's placement is decided here (D117 D1/D2); D3 the
  flower/adaptation/seasonal visuals + the ceremony language + the why-panel
  copy engine.
- **E. Phase 4 — navigation/feeds:** the duality principle — every section UI
  is the local view of its tree organ (one derived state, one animation
  language, two scales).
- **F. Phase 5 — anatomy views:** root/stem/leaf cross-sections + the
  time-lapse replay (D097 — from PRECOMPUTED YEARLY SNAPSHOTS, ~20–40 s, once,
  skippable; first frame = the current state instantly).
- **G. Phase 6 — review mode:** the yearly review artifacts.

**Schema note (supersedes the placeholder's "no new tables" premises):** the
tree's state is a PERSISTED, engine-written derived cache (D107/D108) + the
synced `viewed_moments` user-state table (D109) — the tree DOES add tables
(Database.md, the formatVersion 3 set). This is NOT a write-path entity: the
user never writes tree state, the cache is regenerable and never part of
backup integrity, imports never grow the tree, nothing user-editable, no XP
anywhere.

**Standing gates (D117 H0–H5, throughout):**
- **H0 — D-number collision note:** the ledger skill-install pair D083/D084
  collides with DecisionLog's D083 — renumbered D118/D119 at the docs pass.
- **H1 — seeded-data stress tests:** the CODE version of the paper run — the
  19 archetypes become the test fixtures; the tests must REPRODUCE the
  paper-run outcomes (stage timings, bank schedules, honest no-rings,
  anti-farm defeats, restore ratchet).
- **H2 — perf gates (F9) as milestone gates.**
- **H3 — coherence checks:** the axis signatures + identity filters across
  generated trees (incl. the botanical-contradiction check).
- **H4 — deuteranopia + contrast passes (D111).**
- **H5 — test-strategy acceptance criteria:** the paper-run fixtures ARE the
  acceptance criteria.

**Exit criteria:**
- Tree renders from the event log + its own H3 owner FUNCTIONS (qualifyingEntry,
  streak, goalProgress, coachEngagement, dayActivityScore, mediaPresence —
  D117 A3); it NEVER reads the M7 cache tables (D110(6)); rings = count of
  Life-Fully-Logged anchored years; tiers = earned achievement tiers; imports
  never grow it. (The placeholder's "renders fully derived from the M7 owner
  catalog" premise is re-pointed: owner FUNCTIONS yes, cache TABLES never.)
- Rings never shrink across missed years; no guilt copy anywhere (a thin domain
  looks young/dormant, never "failed").
- No user-write-path entity, no XP, nothing user-editable; the only new tables
  are the engine-written tree cache (D107/D108) + `viewed_moments` (D109).
- Launch-day contract: full-history derivation from day one (a veteran's tree
  is already mature on first open); the journey replays ONCE via time-lapse
  mode from PRECOMPUTED YEARLY SNAPSHOTS; first frame = current state
  instantly; the legend card; manual backdating of NEW events per D100's
  two-tier split (D097).
- Restore/backup contract: tree state is a derived cache, never source data;
  the three restore cases (same-era / older / newer) all honest with
  why-panel narration + a restore-date stamp; re-derivation is a designed
  transition; the cache is regenerable, never part of backup integrity (D098).
- Perf budget (D111): ≤16 ms at LOD-1/2 (the F9 gate); the LOD ladder
  (mass / structure / detail) makes the 45k-draw-op disaster structurally
  impossible; motion tiers (FULL/REDUCED/NONE) + reduced-motion fallbacks.
- Standing gates H0–H5 pass — incl. the seeded-data stress tests reproducing
  the 19 paper-run archetypes (H1/H5).
- Nav tab live on both platforms (phone↔PC parity, D060); render performance
  acceptable on the phone.

---

## Milestone 10 — Drive P2: Backup Integration

**Scope:** Google OAuth (personal app, no verification), Drive upload of JSON
backups, restore-from-Drive option. Cloud remains optional.

**Exit criteria:**
- Backup auto-upload on schedule + manual button; offline fails safe.
- Restore from a Drive backup into a fresh install works.
- OAuth token refresh handled; no data loss on failure.

---

## Milestone 11 — Entity Sync Plane

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

## Milestone 12 — Drive P2.5: Media Blob Sync

**Scope:** with plain-data sync shipped in Milestone 11, P2.5 shrinks to **big
media blobs only** — the previous "synchronizes ONLY media_attachments metadata
+ thumbnails" claim is replaced. Same D019 mechanism for both. Full media
blobs transfer across the user's devices (phone + PCs) via the lightweight
Drive data pool; deviceId-flagged foreign-device items surface as stubs (see
`MediaStorage.md`).

**Exit criteria:**
- Big media blobs sync between iPhone and a PC; plain-text/stat entity data is
  already covered by the Milestone 11 plane.
- Vault browser shows items archived on another device as view-only stubs
  ("stored on [device], not this device") — never broken links.
- Local-only mode unchanged and fully functional (cloud optionality preserved).
- Reuses P2 OAuth/token mechanics; no new cloud architecture.

---

## Milestone 13 — Drive P3: Media Vault

**Scope:** MediaRepository cloud adapter (provider-agnostic `CloudMediaAdapter`
— upload/download/delete/list only; provider specifics fully contained, D034);
media upload with resumable uploads; offload workflow (uploaded → free device
space); on-demand re-download; storage meter reflects vault state; tiered
handling of long vlogs (manual archive marker; desktop archive sink); full PC
vault browser for archived media incl. the J7 "My Videos" videos home (per
`MediaStorage.md`): PC-only per the D035 physically-true test (the files live
on the PC's disk); filters All / On this device / In the Drive vault / Archived
on this PC + "This PC only" toggle; thumbnail-grid default + compact-list
toggle + the J7 search box (the shared J2 matcher); auto-adopt of ONE chosen
folder (File System Access API — Chromium only; other browsers degrade to a
manual folder pick per session) — "put a file, it appears"; adopted rows carry
the `adopted` marker and are EXCLUDED from the storage meter; dedup via content
hash; the app NEVER deletes/moves/renames files in the folder (folder = source
of truth); honest "file missing" stubs; "do-not-readopt" list for removed
files; vlog local-buffer nudges (rolling 3–5 day rewatch buffer, configurable,
nudge-only — never silent deletion) wire into the vault browser here; export
documents PC-archived blobs as `exported: false` stubs.

**Exit criteria:**
- Record → auto-sync → offload → view-back (re-download) loop works on iPhone.
- 15GB capacity plan in place (tiered retention per `MediaStorage.md`).
- Local-only mode still fully functional (cloud optionality preserved).
- PC vault browser renders only on desktop; foreign-device items are view-only
  stubs, never broken links.

**P3+ (future, not built now):** a bulk "migrate everything to Drive"
operation — loop through local/PC-archived media, upload each via
`CloudMediaAdapter`, update `storageRef`/`syncState` on each row, and
optionally free local/PC storage after confirmed uploads. Requires no new
architecture beyond what is already planned; scheduled only if the user gains
more Drive storage.

---

## Future Systems (candidate order — decision required before each)

Each system must: plug into the event ecosystem + Life Areas, pass the same
MVP-quality bar, and justify itself against the Core Loop. A DecisionLog entry
+ user decision is required before any is scheduled.

- **Study:** sessions, subjects, revision tracking; Learning area. Not yet
  specified (no ledger rows) — decision + spec before scheduling.
- **Productivity refinement:** projects (routines already shipped with M4).
  Not yet specified.
- **AI Adapter:** optional LLM-powered reflections (DeepSeek API, local models,
  or any LLM later) — never required, OFF by default, must never degrade the
  app; the app must function completely forever without it.

## Idea Park (recorded, NOT a spec)

- **FUT-2 — Rest/recovery tracking** (sleep, rest days, readiness) — overlaps
  the deferred N5 line; check overlap before scoping.
- **FUT-3 — Body measurements beyond weight** (waist/chest/arms) — complements
  the D031 physique-photo timeline.
- **FUT-4 — Macro targets per phase** — overlaps NU7 per-phase g/kg defaults;
  check NU7 overlap before scoping.
- **FUT-5 — Periodization** — programs = ordered sequence of weekly plans with
  loading phases (W1 normal → W2 added sets → W3 heavy low-rep → W4 deload);
  new programs table + block-scheduling layer; every analytics view gains a
  block dimension; the biggest item by far — revisit when the user is 12+
  months of consistent training in. Light alternative noted: week-level
  intensity labels (deload/heavy/medium) without a full block layer.
<!-- AMENDED 2026-09-26 (gen-2 docs pass; D120/D121): the idea-park N3 "skipped, door open" line is RE-OPENED and LOCKED by F-05 — extended from two to three values (warmup|working|failure). Superseding decisions: D120 (D060 override) + D121 (F-05). -->
- **N3 — Warm-up sets** (setType warmup|working|failure column + exclusions
  from volume/PR/est-1RM/adherence) — RE-OPENED and LOCKED by F-05 (D120/D121):
  the `setType` column + W-set exclusions ship with the M2 build (see M2 above;
  Database.md schema entry).
<!-- AMENDED 2026-09-26 (gen-2 docs pass; D120/D121): the idea-park N5 "skipped, door open" line is CLOSED by F-19 (Training Form, training-load only); the FUT-2 non-duplication note is carried forward, not repealed. Superseding decisions: D120 (D060 override) + D121 (F-19). -->
- **N5 — Recovery readiness** (morning 1–5 recovery_log + PO/Coach branches +
  M2 correlation analysis + deload trigger + check-in line) — CLOSED by F-19
  (D120/D121): Training Form (CTL/ATL/TSB) from logged sessions ships with the
  M2 build (rule + copy in CoachSystem.md). FUT-2 (sleep/rest-day/readiness
  hardware-style tracking) stays OUT of F-19 — the do-not-duplicate note is
  carried forward, not repealed.
- **N6 — Exercise cues/notes** (cueNotes text column, dimmed at block top,
  editable everywhere) — skipped, door open.
- **N8 — Session media** (widen `media_attachments` to a polymorphic entity
  anchor journal|workout via additive migration; tiers/PC-archive unchanged) —
  skipped, door open.
- **Wrist/ankle trophy bodies** — deferred with the door open: if legs-and-
  ankles tracking ever lands, it is a string-enum body-part extension on
  existing `body_metrics` rows; affected trophies read the same rows, no
  contract change.
- **Do-not-build records (D069):** I6 (next-week preview in check-in), I8
  (picker ergonomics), F3 (session post-note), Part-B journal prompts #2/#3/#4/
  #7, the RPE column (struck from any schema), FUT-1 muscle-map graphics, AI
  food scanner, anything beyond the D060 closed list — revisit only with a
  genuinely new use case.

---

## Graph/"Brain" View (under consideration — NOT scheduled)

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