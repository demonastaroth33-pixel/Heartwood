# PersonalOS — UI / UX

Design rules for the interface. The experience must be roughly equal on iPhone
(installed PWA) and Windows desktop browser — responsive is first-class, not a
mobile afterthought.

## Navigation Shell

- **Mobile (iPhone PWA):** bottom navigation bar.
- **Desktop (Windows):** same items in a left rail.
- Tabs (MVP): Dashboard, Journal, Habits, Settings.
- Later: Goals, Coach, (future systems).

Rules:

- Dashboard is the default tab and the app opens to it.
- One-tap actions from the dashboard wherever the loop allows.
- No buried settings; storage meter and export are reachable in ≤2 taps.
- **Ordering is set aside (L170):** navigation-bar and layout ordering is
  deferred to the END of the design process — after ALL features are planned.
  Do not re-open dashboard ordering or nav charts now; revisits last.

## Dashboard (MVP)

Blocks, in priority order (all required by the user; this is the vertical
order). The block list is restructured by the "Today" fusion (clash #1, L154):
the briefing card is NOT a separate top block — it FUSES with habit ticks +
journal quick-capture into ONE **Today** section at the top; below, everything
else keeps its old order verbatim:

1. **Today** — one section fusing the briefing card (R12) + habit ticks +
   journal quick-capture (L154). Details in "Today — Briefing Card & Daily Log"
   below.
2. **Coach daily note** — the stub rule output (gentle line, e.g., missed-habit
   prompt) or a neutral "day on track" placeholder.
3. **Goal progress** — placeholder/empty state in MVP (goals arrive M1);
   progress is computed-only via one H3 owner per goal kind
   (`goalProgress(goalId)` — Architecture.md §Analytics Engine owner catalog).
4. **Today's tasks** — placeholder/empty state in MVP (tasks arrive M1).
5. **Streak/XP status** — placeholder in MVP (gamification arrives M2); the
   zero-XP "N days fully logged" consistency marker lives here too
   (Gamification.md §Streaks).

Plus, always visible: **storage meter** (used/available + warnings at 70%/90%).

Empty states must be honest and non-judgmental — no guilt UI.

**M2 render order (L169):** the list above only controls home-screen card paint
sequencing on open — every feature screen renders instantly and never waits on
this list. M2 render order = [Today section (briefing + habit ticks + capture,
the clash #1 fusion), calendar/heatmap strip, habits card, goals progress,
strength snapshot, weekly review/Coach note, journal capture]. Heavier derived
blocks (strength snapshot, weekly review) render after a skeleton shimmer — they
NEVER block first paint.

**Reveal-on-first-data (H4, L245):** an area does NOT render until it has data
or the user explicitly first-touches it (e.g. create a deload → deload
surfaces). Areas with no history stay concealed day-to-day — dashboard and
navigation stay lean, no empty "feature rooms", no dead cards. The full surface
is built and always reachable once it exists or via the searchable create action
(first touch = escape hatch). Applies to settings too.

## Today — Briefing Card & Daily Log

The **briefing card (R12, L240)** is the single daily surface: today's slots in
order (per the chosen weekly routine + per-day overrides — Database.md §Routine
— day templates, binder, performed days), done-vs-missing markers, the NU12
macro-gap bar, and one-tap log/pack actions. Quiet meal reminders point here
(CoachSystem.md §Named rules — quiet meal reminders).

- **One-tap daily log (H1, L242):** opening the app lands on the dashboard with
  the briefing card already listing today's slots; log/pack/session actions are
  one tap from there (session pre-load below, one-tap meal). Fidelity over
  friction — the daily path should never require a menu. Layout default only; no
  new feature.
- **Macro-gap bar (NU12, L085):** a live progress line in the card — e.g.
  "protein 168/168g · kcal 2120/2875" — updating as meals are logged (receipt
  rows summed vs `deriveMacros(dateKey)` targets — Architecture.md §Energy
  balance & macro derivation). Zero storage (derived); the single
  highest-visibility budgeting surface; home for reminders + Coach nudge; no XP.
- **Session pre-load (A7, L115):** the card's Gym slot TAP opens the session
  screen pre-loaded with that day's linked workout template (exercises, target
  sets/reps in order, last-time hints, PO suggestions ready) — logging =
  confirm/adjust/execute. The workout-kind slot links a workout template
  (Database.md §Routine).
- **Backfill semantics (L241):** a meal backfilled to an earlier date (NU4)
  marks its slot done in THAT date's routine view, never today's; the macro-gap
  bar always sums the day's target vs the day's full receipt via
  `deriveMacros(dateKey)` — display may lag, numbers never disagree.
- **Prompt discipline (routine-A2, L109):** no weekly prompt on unbroken
  indefinite runs; the app asks only at first-ever setup, when a period ends
  (falls to the default), on user-opened override, or an explicit want-change.
  Otherwise silent continue.
- **Week picker + per-day override (R7/R8, L234/L235):** at the start of the
  calendar week (first day per WEEK STARTS ON — Settings Group 1) the user picks
  which weekly routine governs that week (or "continue current"); inside a
  routine, any single day can be overridden to a different day template without
  forking the routine. One binding model — no independent per-day toggle
  (Database.md §Routine).

## Weekly Surfaces

- **ONE weekly surface (H2, L243 / A4, L099):** the weekly fitness check-in IS
  the single Sunday surface. The R11 week recap and the nutrition check-up are
  NOT separate top-level screens — they are COMPACT SECTIONS inside the check-in
  (e.g. "gym 5/5 · packs 5/5 · weigh-ins 6/7 / protein on-target 6/7") with
  tap-through to detail. One canonical verdict per cadence — kills the "which
  one do I open" tax. The surface IS the merged Coach weekly review: Coach
  weekly section (habits, journaling, life notes) on top, fitness/nutrition
  sections below; nothing deleted, merge only, one pipeline, one scroll
  (CoachSystem.md §Outputs & surfaces — One weekly surface).
- **Week recap = glance + verdict (A6, L101):** both exist, one is a glance, one
  is the verdict. The R11 strip stays on the week calendar as a tiny glance (gym
  5/5 · packs 5/5 · weigh-ins 6/7); tapping the strip opens the single merged
  weekly review (A4) — the deep read. Same H3 owner (`adherenceWeek()` —
  Architecture.md §Analytics Engine owner catalog) so they can never disagree;
  never a competing weekly surface.
- **Strip window (R11-sub, L239):** the strip always summarizes the DISPLAYED
  week (the grid it sits above — first column per WEEK STARTS ON; glance = the
  week you see). The weekly verdict / merged check-in uses the configured
  review-day window (Settings Group 2) and the strip labels those dates
  explicitly — glance and verdict never silently mixed.
- **Strip denominators (audit 2.4, L238):** X/Y and X/7 count only days that
  HAVE the slot in the bound template (workout-kind / weigh-in); days without
  one are excluded from both sides. Single owner: `adherenceWeek()`.
- **Copy summary as text (L071):** the weekly check-in / phase-close report can
  be copied to the clipboard as plain text for journaling.

## Calendar — Memory Map

The calendar is the app's MEMORY MAP (browse/what-happened), NOT a judgment
surface (L249): verdicts live only in the weekly check-in; the calendar derives
everything from existing H3 owner functions — zero new storage, zero writes
(navigates to the day view / real screens only).

- **Month grid tint (L250):** day cells show a TINT, never dots/numbers/icons.
  FILTER MODE = single system (Journal | Fitness | Nutrition | Body | Habits) —
  the whole day cell shades in that system's color (filters render only for
  systems with data, H4). FILTER MODE = All — one neutral tint whose STRENGTH =
  how much happened (1 thing = faint, 6 = stronger), a single gradient of
  activity intensity. Tint INTENSITY = volume, computed by ONE H3 owner
  `dayActivityScore` + `tintLevelFor(score)` (Architecture.md §Day activity
  score): 0 = white, 1–2 = faint, 3–5 = medium, 6+ = strongest. The score has NO
  hard ceiling by design (habits are UNCAPPED at 0.5; meals/journal are capped).
  Missed habits contribute 0 — no negative/red state; missed-habit warnings live
  in the Coach reflection, never the tint (CoachSystem.md §Named rules —
  missed-habit warnings). Today = a separate border ring; selected = accent
  outline; future days = dimmed/desaturated. No glyphs/emojis/numbers on the
  grid.
- **Day view (L251):** tap any day → chronological list of everything that day
  (weigh-in, meals, gym session, journal entries, habits), every line derived;
  links to the real screens; filter chips apply. "PLAN-vs-ACTUAL" split toggle
  Actual / Plan / Both — routine slots (planned, from `routine_slot_logs` —
  Database.md §Routine) pair against what actually happened:
  [planned: gym 17:00 · actual: missed], [planned: rest · actual: cardio].
  GOAL DEADLINES: goal/completion target rows ring the day cell in the goal
  color; the day view lists "deadline: reach 75kg" as the first line. Coach
  outputs render as a quiet line under the day's events (Coach notes in calendar
  day view — Settings Group 2). No glyphs.
- **Year heatmap:** month → year = 12 mini-months of the same tint
  (GitHub-contribution style), same owner, no new data.
- **Month-header fact line (audit 2.3/8.3):** e.g. "22/31 days logged this
  month" — one small derived fact, not a verdict; days logged =
  `dayActivityScore > 0` (same H3 owner); renders ONLY in the All filter view,
  hidden in single-system filters. Filter-aware wording (J-AUDIT-1, L226): "N
  days logged" only in the All view; in the Journal filter the line reads "N
  days journaled" (derived from entry dates). Same H3 owner, display-only.
- **Week grid (A6 planning glance) ↔ calendar month:** linked by tapping a week.
- **Period creation (L252):** both creation methods — (1) drag a range on the
  calendar, (2) manual date picker from trips/trip creation — end in a visible
  confirmation step ("Create period [start → end]?") before commit; an
  accidental drag must never silently create a range. Periods render as a top
  band / cell tint context whose colored block IS the tap event → opens the trip
  view (periods model — Database.md §Backup / Restore Format enumeration;
  DecisionLog D075).

## Journal

- Chronological timeline; multiple entries per day grouped under the date.
- Compose flow: text + photos + vlogs (MediaRecorder with compression
  constraints), tags, Life Area picker, timestamp defaults to now (editable).
- Edit/delete/remake supported; edits append events (see `Database.md`).
- Viewing: media plays inline; object URLs resolved via MediaRepository.

Journal features (J1–J7 family, D056):

- **On-This-Day memory strip (J1, L211):** small card on the Calendar
  (memory-map screen) + tiny line at the top of the Journal view showing what
  was logged exactly N years ago today (nearest past year with data first: 1y →
  2y → 5y…). Pure derived query ("entry with date = today minus N years"); zero
  new storage/schema/screens. Rules: H4 — no data → the strip doesn't render; NO
  XP; FACTS ONLY (never reads text content — privacy stamp, CoachSystem.md
  §Privacy & the never-list); no notifications. MEDIA STUBS: PC-archived media
  of that past entry shows an honest stub (thumbnail + "archived to desktop, tap
  for details") — never a broken play button. LEAP DAY: Feb-29 entries match
  Feb 28 in non-leap years (the shared `sameMonthDay` utility — Gamification.md
  §Shared primitives).
- **Search (J2, L212):** entry point on the Journal page + Calendar; finds
  entries by plain word/keyword/tag, filterable by Life Area; results
  newest-first, matching term highlighted; tap → full entry. FULLY OFFLINE
  (airplane-safe); ZERO new storage (no index table at personal scale —
  re-evaluate only if it slows); PRIVACY: finds YOUR words, never shares, never
  gives the Coach text access (facts-only stamps unchanged). SIMPLE MATCHING
  only (whole words + tags; no fuzzy/AI) — one shared matcher also serves J7
  video search (Architecture.md §Shared search matcher). Run in a worker if it
  feels slow on low-end phones.
- **Tag/area filter view (J6, L217):** filter chips for #tags and Life Area on
  the Journal page (including physique-tagged A5 entries — MediaStorage.md
  §Physique-Photo Timeline), turning search and the calendar's Journal filter
  into a one-tap findable list. Derived only; no new table.
- **Quiet week (J4, L214):** user marks a date range in Settings → Coach; during
  it the Coach pauses nudges (habit-miss lines, journal-drought pokes, streak
  warnings) — the guilt loop is muted. ONLY the user starts it (never
  auto-detected); history stays TRUE (missed days still log); the streak stays
  REAL — quiet weeks do NOT shield streaks; the streak shield is the Grace
  setting (Gamification.md §Streaks). Includes the calendar day-view
  journal-drought line — every drought poke routes through the Coach rule
  pipeline so quiet weeks silence all (CoachSystem.md §Context switches — Quiet
  week).
- **Batch import (J3, L213):** Settings → Data → "Import entries" — one
  plain-text file (documented format: date | title | text per block) → preview
  list with dates ("47 entries, 2019–2021") → confirm → rows added as normal,
  backdated. Entries ONLY (never creates habit check-ins/weights/any other
  data); `imported` flag; NO XP for imported content. DayKey = the ORIGINAL date
  (calendar tint/heatmap/history land on true dates). Dedupe: re-import of the
  same file is BLOCKED by (original date + body-content-hash captured AT IMPORT
  TIME, stored immutable next to the flag — editing an imported entry later can
  never re-enable a duplicate); the preview reports "N already imported, M new".
  Achievement/cadence counters EXCLUDE imported rows (Database.md §Logical
  Schema — journal_entries).
- **Year book (J5, L215):** Settings → Data → "Year book" → pick a year →
  READABLE human PDF: journal entries in date order, embedded photos/vlogs, a
  small stats page (days journaled, habits, gym sessions, milestones).
  READ-ONLY — packages a copy; never moves or rewrites real data. No Coach/XP —
  pure artifact. MEDIA STUBS: PC-archived items print an honest stub (thumbnail
  + "archived to desktop [date], file: …") — never a silent blank. Build-time
  dependency: PDF generation on Flutter requires a package — DecisionLog entry +
  user approval before build (no-new-dependencies rule).

## Habits

- Today's list with one-tap check-off.
- Habit detail: simple streak, recent 7/30 days indicator (simple, no charts in
  MVP unless trivially cheap).
- Create/edit/archive habits; each habit has a name, optional Life Area,
  daily cadence (MVP: daily only).
- Auto-tracked habits (autoSource "workout", future "weigh-in" — Database.md
  §Logical Schema): a session save auto-writes the day's check-in in the same
  transaction; manual check-ins win; session deletion cleans up the auto
  check-in with a compensating revoke (Architecture.md §Event Model — Habits
  bridge). Per-habit controls live in Settings Group 6.

## Session UI & Fitness Logging

- **Daily logging flow (L019):** the day pre-fills the template's exercises with
  target sets/reps; the user types actual weight × reps; add/remove/swap freely;
  freeform + paste fallback. Plans never store weights (structure only) —
  Database.md §workouts — template/session layering.
- **Last-time hint (item 23, L021):** the previous session's weight + reps +
  est-1RM shown faintly per set; logging = confirm-or-bump. Freshness tiers
  (O4/L040): <2wk full hint · 2–4wk quieted with date · >4wk collapsed AND
  progressive-overload suggestions pause (~90% of last-time starting baseline
  instead of +2.5 kg extrapolation). Constants configurable in settings —
  Architecture.md §Fitness data entry.
- **Session comparison (N4, L059):** "Compare" on any past session →
  side-by-side vs the previous same-template session (per-exercise weight/reps/
  est-1RM deltas, volume delta, PR flag); stale gaps (O4)/deload/injury contexts
  annotated, never judged. Reachable from history, calendar day, records vault.
  Pure derived UI, no schema; reads `strengthSnapshot(exerciseId, asOf)` —
  Architecture.md §Strength measurement & records.
- **Template cloning (F4, L069):** one-tap "Duplicate template" → variant copy
  (exercises/sets/reps/order/pairings) for new phases or splits.
- **"Track this exercise" (L129):** the session screen's exercise menu gains one
  tap → the exercise appears in the dashboard "Your lifts" block; reuses the
  tracked toggle (Architecture.md §Strength measurement & records — drill-down).
- **Auto-assort paste (item 20, L018):** rule-based loose-grammar paste parser
  with fuzzy match + "Did you mean?" confirm and inline create with muscle
  assignment — NEVER silent auto-create; offline, NO AI; M1-or-M2
  (Architecture.md §Fitness data entry).

**Recorded, never built:** picker ergonomics tweaks (I8) were declined by the
user and stay a do-not-build item (L054, D069).

## Settings

Settings follow locked principles (L253):

- **H4 applies to settings too** — a group appears only when the user has data
  for it; there is no "Sync" group until sync ships.
- **Two tiers:** Main (plain-English, things actually touched) + Advanced
  (collapsed drawer for thresholds/constants).
- **Search at top** — the H4 escape hatch.
- **"Restore defaults" per group** — always behind a confirm dialog naming what
  will reset.
- No other fluff.

Groups (L254–L261, D055):

1. **GENERAL** — display name · timezone · theme (dark default; theme-able from
   day one) · WEEK STARTS ON (Monday default; display-only — routines stay
   stored by weekday index). Effect (audit-LOW-24): shifts the calendar
   week-grid first column ONLY — display. The weekly checkpoint close day stays
   owned by the review-day window (Group 2) and the closed ISO week (G10 —
   Gamification.md §Cadence and window rules); A Week Whole keeps ISO Mon–Sun
   regardless.
2. **COACH** — strictness (supportive/balanced/strict, default balanced) ·
   weekly review day (default Sunday) · Coach notes in calendar day view
   (default on) · milestone-review cadence (editable ladder: 1m / 3m / 6m / 1y /
   yearly, per milestone, or flat interval) · quiet-week range (user-started).
   Weekly-window rule (audit 1.5): the evaluation window = the 7 consecutive
   days ENDING the configured review day — a single owner consumed by the merged
   check-in, the strip's weekly-verdict portion, and the Coach weekly aggregate
   alike (CoachSystem.md §Settings (Group 2 — Coach)).
3. **FITNESS** — units kg|lb / cm|in (display-convert only — O8; Database.md
   §workouts) · GLOBAL KILL-SWITCH for PO auto-suggestions (default on) ·
   default weight step (2.5 kg) · rep-first threshold (+2) · physique-photo
   nudge (default OFF, monthly — F5) · rolling pace window (7d, 14d optional).
   ADVANCED: last-time hint freshness tiers (O4) · MRV volume floors per muscle
   group (CoachSystem.md §Named rules — volume balance).
4. **NUTRITION** — height/age/sex/activity factor (Mifflin inputs — settings
   keys, never profile fields; Architecture.md §Settings, Not Profile) · MANUAL
   TDEE override (freezes auto-recompute + the protein/fat basis until cleared —
   Architecture.md §Energy balance & macro derivation) · protein g/kg per phase
   (cut 2.0 / bulk 1.8 / maintain 1.6) · fat floor g/kg (0.6, editable up) ·
   quiet meal reminders (default on — CoachSystem.md §Named rules). ADVANCED:
   fully-logged streak window (±10% default — Advanced-only knob clamped 5–15%;
   Gamification.md §Streaks) · backfill bound (normal ≤24h vs historical —
   Database.md §Nutrition) · macro-collision priority (default keep protein,
   drop fat to floor) · FOOD MACRO LOOKUP (default ON; OFF = plain manual entry
   — the toggle switches behavior, never deletes data). Schema-relevant keys
   live in Database.md §Settings keys (schema-relevant).
5. **CALENDAR & MEDIA** — default filter (All) · plan-vs-actual default view
   (Both) · month-header fact line (on) · vlog rewatch buffer days (3–5,
   default 5 — MediaStorage.md §Vlog Local Buffer) · vacation-day threshold knob
   for "Took the Time" (default 14 days per vacation year — resolve-E2, L133;
   counts via the day-level UNION — Gamification.md §Shared primitives).
   ADVANCED: tint weights/caps (dayActivityScore, as locked — keep fixed;
   Architecture.md §Day activity score).
6. **HABITS** — auto-track from workout (per habit) · deload-day counting (per
   habit, default counts). (L259.)
7. **DATA & STORAGE** — manual backup/export/restore (Database.md §Backup /
   Restore Format) · storage meter (MediaStorage.md §Storage Meter & Warnings) ·
   batch journal import (J3) · year-book export (J5). "Settings → Data" from
   J3/J5 anchors here. (audit fix 1, L260.)
8. **SYNC** — skeleton only: sync on/off, Wi-Fi-only, last-sync time. Renders
   ONLY when the entity-sync plane ships (H4; Architecture.md §Entity-sync
   plane). (L261.)

**NOT offered as toggles (L262):** rep guard 1–12, Epley/Mifflin/Atwater
formulas, 7700 kcal/kg (public-formula constants — toggling breaks "absolutely
solid" math) · dayActivityScore weights (H3 owner; Advanced-only if ever) ·
per-exercise progression style (per-exercise data, not a global toggle) ·
reveal-on-first-data H4 (principle, not a preference) · XP/achievement values
(M2 open items) · check-in section on/off (one surface, no section chopping).

## Typography & Visual Rules

- Dark-first theme preferred for a life archive; must remain readable in
  sunlight on phone. (Decide theme at build; keep it theme-able from day one.)
- Large touch targets (≥44px), thumb-reachable primary actions on mobile.
- No clutter: one primary action per screen.
- Fonts: system fonts (no paid font licenses, no heavy webfonts).

## PWA Requirements

- Installable: manifest + service worker; icons for iOS home screen.
- Standalone display mode; status bar handling on iOS.
- Offline: core loop must render and function with zero network
  (verified in M0 — see `StorageDecision.md`).
- Camera/file capture verified on device in M0.

## Empty & First-Run States

- First run: 3-step welcome (what PersonalOS is, create first 2–3 habits, make
  first journal entry) — then straight to the dashboard. The fitness onboarding
  (I9, L055) then captures Mifflin inputs (height/age/sex/activity — Settings
  Group 4 keys) and proposes a first weekly plan + seeded tracked exercises —
  BUT the user can customize/replace/clear all from day one; nothing forced;
  energy math is alive day 1. No profile, no account, no signup — ever (see
  `Architecture.md` §Settings, Not Profile).
- Empty states for every block explain what will appear there, in one line.
- **Reveal-on-first-data (H4, L245):** areas don't render until data or first
  touch (see Dashboard).

## Open Items (build-time)

- Exact palette/theme values; dark vs light default.
- Dashboard block sizes on small screens (scrolling vs compact sections).
- Bottom sheet vs full-screen composer on mobile.
- Navigation/layout ordering — deferred to the END of the design process (L170).
