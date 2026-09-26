# PersonalOS — UI / UX

Design rules for the interface. The experience must be roughly equal on iPhone
(installed PWA) and Windows desktop browser — responsive is first-class, not a
mobile afterthought.

## Navigation Shell

- **Mobile (iPhone PWA):** bottom navigation bar.
- **Desktop (Windows):** same items in a left rail.
- Tabs (MVP): Dashboard, Journal, Habits, Settings.
- **Life Tree tab** — the tree surface (INT-01; D094/D099; spec owner
  `docs/LifeTree.md` §16). The tab's EXISTENCE is locked; its PLACEMENT in the
  shell is decided at the deferred UI/UX ordering pass — do not re-open tab
  existence, do not fix the position now.
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
- **Coach weekly section = the 3–5-line message (F-24, L031; INT-17; docs-pass
  D149):** the merged check-in's Coach section renders the short
  template-driven message — review (the week's numbers) → adjust (engine
  decisions, rule-cited) → next-week goal (one concrete target). The F-30
  readouts (LOAD / STIMULUS / BALANCE) live ONLY inside this message; the L-10
  insight line (L069/D145) rides inside as ONE line (the same line the Life
  Tree branch detail surfaces — nowhere else). Same derived facts, same
  surface, same day; template + interpolation, no LLM; facts-only;
  show-your-work; one notification/day; quiet week wins; no shame. The weekly
  volume fact line renders F-28's chart as the data visualization (the
  interactive chart lives in the fitness area; F-30's "no fitness-area display"
  = no additional readout cards beyond that chart).

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

## Life Tree — Tree Tab

A NEW surface (INT-01; D094/D099/D111; docs-pass D142). The canonical spec
owner is **`docs/LifeTree.md`** (the tree-7 decisions D085–D117 + the
life-tree-design/ sources): this section carries the SURFACE copy — layout,
states, filters, render rules — and never re-specifies the engine (the
register, the state model, the derivation protocol, the ceremony mechanics
live in LifeTree.md §5/§7/§8/§10).

<!-- D142 (UIUX tree-tab family, docs-pass): the tree tab + semantics surface +
LOD/motion render states + seasonal render states + sensitive-row collapse +
ceremony refs. Superseding sources: INT-01/INT-09/INT-14/INT-08/INT-07 +
D085–D117 + LifeTree.md §10/§15/§16. -->

### Layout (D094/D099)

- **Three zones:** hero tree (the organism) + overview strip (stage name, age,
  next tick's progress, bank count + bloom schedule) + detail panel (organ
  detail on selection). The overview strip lives at EVERY stage; the why-panel
  carries the schedule at every stage.
- **Bank counter** — a real surface: top 3 by tier + the count ("+47 more"),
  with the closed bucket for restore-foreclosed trophies (D116) — never
  silence; the why-panel lists the full bank.
- **Day-1 seed state:** the seed is a closed package (coat + embryo + food,
  botany-correct) — one beautiful stylized seed, the overview strip with the 5
  domains as GHOSTED BRANCH-BUDS ("where your branches will grow") + the bank
  counter. The day-1 tree must be beautiful on its own.
- **Germination moment:** the first logged event plays the first transition
  (seed cracks, root curls, tiny stem rises; SEEDLING arrives with 5
  branch-buds + the first achievement bud) — the first log visibly grows the
  tree, the hook (D094).
- **Empty/dormant states:** honest and non-judgmental — dormant ≠ failed;
  protected-absence copy says "resting", never "abandoned" (D110). Follows
  reveal-on-first-data (H4): no events → the tab appears on first touch only;
  no empty "feature room".
- **The why-panel value law (D110(2)):** the panel shows ONLY (a) facts
  derivable from the event log and (b) the register's values — never free text
  from any stored system, never LLM narrative. Every row is checked against the
  four clauses.
- **Sensitive-row collapse (D110(3)):** the tree is a screenshot surface —
  sensitive rows (body weight trend, nutrition numbers) render their copy
  collapsed ("derived — see the section") unless in-app with the panel
  expanded. Sharing-safe by construction.

### The caps (D099)

- **Bloom-burst cap:** the annual bloom manifests the bank in MAGNITUDE ORDER
  (Grove first, then Ring, then the growing-season earns) with a per-bloom
  visual budget; overflow blooms in SUCCESSIVE WAVES across the flowering
  season (register C1 ≤15 flowers per bloom event; C2 ≤4 waves per season).
  No flower lost; the moment never floods.
- **Bud-cluster cap:** buds beyond the branch's derived capacity cluster into
  bud clusters (register C3 ≥30 buds per branch → clusters) — each a countable
  surface ("12 habits in this cluster") with individual buds revealed on zoom.
- **Media-aware aggregation (D099 N-5):** the leaf cluster's character reflects
  its media content (photos/vlogs render with the storage-leaf character —
  thicker, richer) even at aggregation scale.

### Identity-axis filters (D112; INT-15; docs-pass D143)

Filter chips in the overview strip / detail panel browse the tree by identity
axis — derived-only, no schema, names/tiers unchanged per D091:

- **Flower family** — the identity axis (achievement family → flower family,
  ACHIEVEMENT-SCAN §1.5): I. The Long Conversation → raceme/panicle · II. The
  Unbroken Chain → catkin · III. The Iron Ledger → capitulum · IV. The Fuel
  Line → spadix · V. The Shape of Things → zygomorphic flower · VI. Elsewhere →
  fascicle · VII. Proof of Life → pseudanthium · VIII. The Rings → the yearly
  spring bloom itself · IX. Full Circle → syconium.
- **Tier magnitude** — the rarity ladder filters (Sprout → Root → Branch →
  Heartwood → Ring → Grove; the ONLY tier system). The 131 trophy names + the 6
  tier labels stay EXACTLY as they are (D091).
- **Branch/domain** — journal, habits, gym, nutrition, goals (+ the body/media
  forks).

The **17-audit statuses** (D112 DV-C3 amended by D113) are the trait-status
vocabulary the filters and why-panel reference: WIRED (a data driver) ·
RESERVED-UNMAPPED (deliberately not wired, reason documented; a real pattern
could appear later) · STRUCTURAL (always-present anatomy) ·
EXCLUDED-BY-DESIGN (PERMANENT) (the marshy/aquatic + parasitic families — do
not fit any life pattern; recorded with the reason, NOT "reserved"). A flower
family renders only when its trait is WIRED; the why-panel explains the status
when it matters. Filtering is display-only — the tree state never changes.

### The L-10 insight line home (L069; docs-pass D145)

The **branch detail panel** surfaces the L-10 insight line — the rule-based
cross-domain insight engine's ONE line (payload-blind mirror per D110). It
lives in the Life Tree branch detail + the weekly Coach message (one line
within the F-24 3–5-line message) — NOWHERE else. First comparison set: the
big five (training ↔ journal presence/word count · training ↔ mood-proxy ·
sleep-proxy ↔ next-day training · protein hit-rate ↔ next-day gym · weigh-in
trend ↔ journal cadence). Wording is correlation-not-causation, verbatim
("correlates with", never "caused by"); confidence tiers from the 5+5/90-day
rule (≥5 days per group OR 90 days of history).

### Rings and the shared birth anchor (D090/D101/D102/D116 D10)

- The tree's **birthday = the account's first in-window event**, frozen at
  creation, never recomputed, never shifted by deletion (D090/D102) — the same
  anchor the Coach anniversary, milestone reviews, and the rings read. A
  gym-only user's tree birthday IS their milestone-review date.
- **Rings are a brand, not the clock:** the ring brand reads the SIX CORE
  domains (journal, habits, gym, nutrition, body, media — D116 D10; goals and
  periods excluded from the brand, present in the axes). Anchored windows,
  never calendar-chopped.
- **Two year types, never confused (D101):** the overview strip / why-panel
  label them explicitly — stage-years (any-domain, the stage clock) vs
  ring-years (six-domain brand, the rings). A single-domain user reaches full
  maturity, blooms, grows old — and never brands a ring; the UI never implies
  a missing ring is a failure.

### Render states — the LOD ladder and motion (D111)

- **LOD-1 MASS** (silhouette + canopy masses — first paint) · **LOD-2
  STRUCTURE** (branches, retention-window twigs, leaves at mature granularity)
  · **LOD-3 DETAIL** (per-entry leaves + organ anatomy — only on
  zoom/interaction). First frame = the current state instantly; detail lands
  after shimmer — the 45k-draw-op disaster is structurally impossible.
- **Mobile (iPhone PWA):** the hero defaults to LOD-1/2 by distance and device
  tier; the detail panel is a bottom sheet/overlay; zoom/interaction reveals
  LOD-3.
- **Desktop (Windows):** hero + detail panel side-by-side; LOD-2 default,
  LOD-3 on selection/zoom. Responsive is first-class, not an afterthought.
- **Seasonal render states (INT-08; D085/D095):** autumn leaf-fall (a mass
  re-bake with capped particles, ~150–300 sprites — the fall is a moment, not
  a per-frame computation), winter leaf-buds on the bare branches, spring
  flush. Winter = everything banks; the spring flush converts the bank.
- **Motion tiers (D111 M-3):** FULL (D094 durations) · REDUCED (particles off,
  quick fades — the 300ms-fade precedent) · NONE (instant changes,
  announcements only). The reduced-motion preference selects the tier; the
  full path degrades automatically on low-end devices.
- **Semantics surface (D111):** every organ (branches, buds, leaves, flowers,
  fruits, rings, the bank) gets a semantic label + status + tap action built
  from the SAME deterministic state model that paints it — pixels and
  semantics cannot diverge; whole-tree portrait one-liner + keyboard map.
  Transition announcements: the ceremonies get a live-region text twin so a
  bloom is never silent for assistive tech.
- **Hit areas:** every tappable organ has a ≥44px effective target even at
  LOD-1 mass (the cluster map decouples hit area from painted size).

### Ceremony references (INT-07; D106/D094)

The session screen's F-03 PR flourish (bract-style, ZERO flowers — the
no-bloom arbitration) and the weight-ladder F-15 hero ring point at the ONE
shared ceremony language owned by LifeTree.md §10; NOT confetti. The
ink-wash blush is the one saturation moment (D112 DV-C2), reserved for the
flowering events like gold is for streaks; the ceremony tokens live in
DesignSystem.md.

### Dev-only surfaces (D105; INT-04; docs-pass D144)

The D105 dev-tools tuning panel — **a dev-only surface: every register value
playable** (presence bars, stage gates, capacities, tenure floors, axis
signatures, windows & formulas) + the palette/blush tokens, driving a live
re-derivation + re-render. Used by the paper run, the archetype mockups, and
the perf gate.

> **SHIPPED-PRODUCT EXCLUSION (locked):** this panel must NEVER be shipped to
> users. It is build-time only (D117 B3 — it MUST exist before any visual
> tuning), documented as the one surface in the app that never exists in the
> product. DevelopmentWorkflow.md carries the build-time tool discipline;
> Roadmap M9 B3 schedules it. Any future attempt to expose it is a
> DecisionLog-level violation.

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
  §Shared primitives). MEMORY HYGIENE (C-05; docs-pass D146): "Never show this
  again" per-memory hide on the strip + "Hide a year" (date range); hidden-ness
  applies EVERYWHERE memories surface — including exports and Year Book PDFs (a
  hidden memory is really hidden). Data is NEVER deleted — display-level flag,
  derived, reversible. Inner rejection (verbatim): reply-to-your-past-self
  (StoryPad pattern) — not wanted, do not resurrect.
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
  READ-ONLY — packages a copy minus hidden memories (C-05/J5 amendment, docs-pass
  D146); never moves or rewrites real data. No Coach/XP — pure artifact. MEDIA
  STUBS: PC-archived items print an honest stub (thumbnail + "archived to
  desktop [date], file: …") — never a silent blank. Build-time dependency: PDF
  generation on Flutter requires a package — DecisionLog entry + user approval
  before build (no-new-dependencies rule).

<!-- REMOVES-existing note (C-05/L080, docs-pass D146): the J5 "packages a copy"
clause is amended to EXCLUDE hidden memories — memory hygiene (C-05) applies
EVERYWHERE memories surface, including exports and Year Book PDFs; a hidden
memory is really hidden (display-level flag only, data never deleted). -->

- **Auto-context capture chips (C-03, D124):** entries auto-gain context facts
  of their day from PersonalOS's OWN event log (no external services; location
  chip excepted): media of the day · workouts logged · habit status ·
  body/weigh-in · return-after-gap note · location (explicit per-entry
  approval). CHIPS all accepted, each individually toggleable in Settings
  (chip-toggles group — see Settings); default OFF; rendering BOTH (chips under
  the entry body + collapsible "Day context" line in the editor); capture
  FROZEN at save but TOMBSTONE-AWARE (each chip references the source events;
  deleted/revoked events → recompute honestly on view or mark the chip
  "updated"); facts-only (never text content); isImported excluded; no XP; quiet
  week does NOT disable chips (they're facts, not nudges).
  <!-- REMOVES-existing note (D124, Stage C REJECTED 2026-09-26): the weather
  chip is NOT drafted — REJECTED by the user (weather data dependency vs
  offline-first + the no-new-dependencies rule). C-03 ships WITHOUT it; the
  rejection is recorded in DecisionLog D124 with the do-not-resurrect contract.
  No weather chip, no weather toggle. -->
- **Wikilinks + backlinks pane (C-08, D125):** `[[` in the composer →
  autocomplete of Life Areas + recent entries → link embedded; linked entries
  gain a backlinks pane ("linked from: N entries"); tapping a link jumps to the
  entry. SETTING = clear toggle in Settings (JOURNAL & CONTEXT group), ON by
  default. NO graph visualization (decorative — against philosophy). Links
  export as `[[name]]` in Year Book — EXPORT RECONCILIATION: the Year Book is a
  rendered human PDF, raw `[[wiki]]` would be dead text — links render as
  footnote-style reference lines (name + date), lossless meaning preserved
  humanly; a Markdown export (if ever added) keeps the raw `[[name]]` form. No
  text analysis — matching on names/areas/tags only (facts-safe); the junction
  table decision is recorded (D125).
  <!-- REFER note (L084, Stage C REFER 2026-09-26): the unlinked-mention
  suggestions sub-item is NOT drafted — REFERRED to the M8 rule-book session /
  Coach analysis pipeline when the pass-over mechanism exists; it carries the
  "needs text access → user opt-in first" privacy stamp and is gated until the
  M2+ text opt-in exists OR matching is restricted to tags/areas/dates only
  (decision at build). The wikilink half is unaffected (user-typed `[[`, no
  scanning). -->
- **Gentle return + pause (C-09, D130):** after any gap, NO "you missed N days"
  messaging — a warm return card ("welcome back") with an optional fresh-start
  offer; applies everywhere streaks/misses are discussed (see Empty & First-Run
  States). PAUSE MODE lives in Settings (HABITS group) — user freezes streaks
  for a known-away period; mostly OFF by default; bounded (finite 1–14-day
  durations); a pause still RECORDS the away period — freezes, never hides;
  scheduled absence, not forgiveness. Distinct from quiet week (silences
  nudges) and from grace (forgives misses).

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

**The habit card is the bud's local view (INT-06 duality; D112 DV-C5; docs-pass
D150).** The habits-as-buds MAPPING (every active habit = a bud on the habit
branch, dormant when unworked, swelling with streak momentum, bursting into
growth on completion, withering honestly when abandoned; bud scars record
abandoned habits) is owned by LifeTree.md §4.2 (D087) — UIUX carries the
surface half: the habit card renders as the bud's local view in the ONE shared
animation language, TWO scales (the section UI is the local view of its tree
organ). The mini-plant stages are REPLACED by bud states (dormant / swelling /
bursting / scarred); the habit card and the tree's habit branch never
disagree (one derived state). Gentle-return + pause surfaces land in Empty &
First-Run States and Settings (C-09, D130).

## Session UI & Fitness Logging

- **Daily logging flow — session anatomy (F-02, L008; docs-pass D147):** the
  day pre-fills the template's exercises with target sets/reps (plan
  pre-fill); logging = confirm/adjust/execute against a set table: exercise
  card + set rows with circular checkboxes, "+ Add Set", swipe-to-delete, swap
  mid-session; SET ROWS use tap-to-type escape steppers (default path steppers,
  not keypads); REST TIMER IN (silent + haptic default, 15s micro-adjust,
  per-exercise defaults, in-app only — D018 untouched); set-label chips
  (W/D/F); finish top-right (partial workouts OK); warm-up rows folded by
  default; plate/warm-up calculators reachable mid-session. Freeform + paste
  fallback stay available. Everything compounds — no locked logic changed.
  Plans never store weights (structure only) — Database.md §workouts —
  template/session layering.

<!-- REMOVES-existing note (F-02/L008, docs-pass D147): the "user types actual
weight × reps" mechanism is REPLACED by the F-02 session anatomy (set table,
rest timer, W/D/F chips, partial-workout finish). Superseded by F-02; the old
mechanism text is removed per the REMOVES-existing discipline. Staleness
ruling carried: >4wk collapse applies to per-set hint inputs; F-01's
card-level comparison stays visible, staleness-labeled. -->

- **Plate + warm-up calculators (F-04, L010; docs-pass D148):** reachable
  mid-session from the logging sheet — plate calculator (total → plates, both
  directions) + warm-up generator (working weight → ramp sets; doubles as the
  locked N2 return-ramp producer). Math ABSOLUTELY SOLID (bar 20 kg standard,
  kg stored everywhere per O8, no rounding drift, hand-verifiable); FLEXIBLE
  (custom bar weight, kg/lb, microloading plates, per-exercise defaults);
  offline; no deps. Calculator settings keys land in Settings → FITNESS (below).
- **PR celebration ceremony (F-03, L009; INT-07):** the session screen's PR
  celebration points at the ONE shared ceremony language owned by LifeTree.md
  §10 — the F-03 bract-style flourish, ZERO flowers (D106 no-bloom
  arbitration); the weight-ladder F-15 hero ring uses the same language. NOT
  confetti. Functional rules: celebration moments = first-ever PR per
  exercise; milestone PRs defer to locked trophy rules; return-after-gap PR
  gets a distinct softer mark; NO celebration for matching records, warm-up
  sets (F-05 W), imported data; anti-noise guard (one at a time; stacked PRs
  queue + collapse into the post-session summary card "3 records set today").
  Facts-only copy; no XP; no shame.
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
   group (CoachSystem.md §Named rules — volume balance). CALCULATOR SETTINGS
   KEYS (F-04, L010; docs-pass D148): plate-calculator bar weight (standard
   20 kg, custom per-exercise) · kg/lb display (O8) · microloading plates ·
   per-exercise calculator defaults (offline, no deps). Schema-relevant keys
   live in Database.md §Settings keys (schema-relevant).
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
   habit, default counts). (L259.) PAUSE MODE (C-09, D130; docs-pass group
   habits/coach): freeze streaks for a known-away period — mostly OFF by
   default, bounded (finite 1–14-day durations per pause); a pause RECORDS the
   away period (freezes, never hides; scheduled absence, not forgiveness);
   distinct from quiet week (silences nudges) and from grace (forgives misses);
   repair tokens REJECTED.
7. **DATA & STORAGE** — manual backup/export/restore (Database.md §Backup /
   Restore Format) · storage meter (MediaStorage.md §Storage Meter & Warnings) ·
   batch journal import (J3) · year-book export (J5). "Settings → Data" from
   J3/J5 anchors here. (audit fix 1, L260.)
8. **SYNC** — skeleton only: sync on/off, Wi-Fi-only, last-sync time. Renders
   ONLY when the entity-sync plane ships (H4; Architecture.md §Entity-sync
   plane). (L261.)
9. **JOURNAL & CONTEXT** — the auto-context capture chips group (C-03, D124):
   each chip individually toggleable, default OFF — media of the day ·
   workouts logged · habit status · body/weigh-in · return-after-gap note ·
   location (explicit per-entry approval). WIKILINKS toggle (C-08, D125): ON by
   default. NO weather chip toggle — the weather chip is REJECTED (D124,
   do-not-resurrect; weather data dependency vs offline-first + the
   no-new-dependencies rule). Tombstone-aware chip rule applies (each chip
   references its source events; deleted/revoked events → recompute honestly on
   view or mark the chip "updated"). (NEW group — C-03/L077+L078 + C-08/L083;
   appended at the end so the existing 1–8 group numbers are untouched.)

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
- **Gentle return (C-09, D130):** after any gap, NO "you missed N days"
  messaging anywhere — a warm return card ("welcome back") with an optional
  fresh-start offer. Applies everywhere streaks/misses are discussed (journal
  drought, habit gaps, session absences). Pause mode (streak freeze) lives in
  Settings → HABITS (see Settings).

## GUI Research References (UI/UX ordering pass lookup)

Lookup material for the deferred UI/UX ordering pass and for any candidate's
GUI research (INT-20/INT-21; Track 2). This is a REFERENCE section — the
datasets are cited, never embedded; the JSON contents are never inlined.
Screen counts and file paths are VERBATIM-CRITICAL (copied exactly; do not
paraphrase or re-derive).

### Milestone → GUI-research lookup

The milestone→research table rows are carried verbatim from the Track 2
source (the UI/UX DEVELOPMENT REFERENCE table in the gen-2 ledger source
range 2157–2190) at the D2 executor / ordering pass — this section holds the
citation blocks and the per-candidate refs recorded in the ledger rows; the
verbatim milestone table rows are NOT re-derived here (Track 2 discipline:
never paraphrase).

Per-candidate MOBBIN REFS recorded in the ledger rows:

| Candidate | Surface | Mobbin refs (ledger-cited) |
|---|---|---|
| F-06 (PR grid) | records vault | `research-fitness/mobbin-screens-hevy.json` + `mobbin-screens-workout.json` (PR/grid presentation) |
| F-17 (standards vault) | vault standards | population-label presentation refs (fitness dataset family) |
| N-01 (history ribbon) | diary | nutrition dataset family (recent-first logging refs) |
| N-02 (food lookup) | diary + badges | **Cronometer has NO mobbin screens** — dedicated mobbin pull at activation (M3b) |
| N-07 (implied TDEE) | check-up card | nutrition dataset family (check-up / trend refs) |
| N-13 (explainer sheet) | explainer + footnotes | nutrition dataset family (estimate-framing refs) |
| L-06 (plan-vs-actual) | day view | LifeOS dataset family (day-view / schedule refs) |
| L-15 (life-scale grid) | tree design feed | design-feed only — placement deferred to D117 D1/D2 (see LifeTree.md §16) |

### Mobbin dataset maps (INT-21)

The three dataset maps + the three `mobbin-query.mjs` helpers — file paths and
screen counts EXACT (the ledger's Track 2 block):

**Fitness** (`research-fitness/`):

| File | Screens |
|---|---|
| `mobbin-screens-hevy.json` | 295 |
| `mobbin-screens-fitbod.json` | 216 |
| `mobbin-screens-macrofactor.json` | 402 |
| `mobbin-screens-nrc.json` | 325 |
| `mobbin-screens-strava.json` | 709 |
| `mobbin-screens-workout.json` | 946 |
| `mobbin-query.mjs` | helper |

**Nutrition** (`research-nutrition/`):

| File | Screens |
|---|---|
| `mobbin-screens-mfp.json` | 290 |
| `mobbin-screens-noom.json` | 529 |
| `mobbin-screens-yazio.json` | 276 |
| `mobbin-screens-lifesum.json` | 345 |
| `mobbin-screens-zero.json` | 139 |
| `mobbin-query.mjs` | helper |

**LifeOS** (`research-lifeos/`):

| File | Screens |
|---|---|
| `mobbin-screens-todoist.json` | 326 |
| `mobbin-screens-things.json` | 166 |
| `mobbin-screens-ticktick.json` | 97 |
| `mobbin-screens-gcal.json` | 866 |
| `mobbin-screens-cron.json` | 110 |
| `mobbin-query.mjs` | helper |

**Journaling** (`research-journaling/` — paths carried from the Track 2
table; counts live in the source table, not re-derived):

| File | Notes |
|---|---|
| `mobbin-screens-stoic.json` | journaling candidate refs (C-series) |
| `mobbin-screens-finch.json` | journaling candidate refs (C-series) |
| `mobbin-screens-evernote.json` | journaling candidate refs (C-series) |
| `mobbin-query.mjs` | helper |

Research MASTER files (the citation roots): `research-fitness/MASTER-Fitness-Research.md` ·
`research-nutrition/MASTER-Nutrition-Research.md` · `research-lifeos/MASTER-LifeOS-Research.md` ·
`research-journaling/MASTER-Journaling-Research.md` · `research-botany/MASTER-Botany-Reference.md`
(cited by LifeTree.md). Never inline dataset JSON; cite these paths.

## Open Items (build-time)

- Exact palette/theme values; dark vs light default.
- Dashboard block sizes on small screens (scrolling vs compact sections).
- Bottom sheet vs full-screen composer on mobile.
- Navigation/layout ordering — deferred to the END of the design process (L170).
