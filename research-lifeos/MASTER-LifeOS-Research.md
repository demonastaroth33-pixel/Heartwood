# LIFE-OS APP RESEARCH — MASTER COMPILE (Aug 2026)

Deep-dive research for **PersonalOS** (private single-user Flutter PWA:
journal + habits + gym + nutrition + coach + goals + calendar + life
tree). The FINAL research block — covers the remaining unresearched
surfaces (Goals & Tasks M5, Routine & Briefing M4, Calendar & Periods
M6, Dashboard M0+, and whole-app integration patterns) before the Life
Tree design work.

**How to read:** Part 0 = executive summary. Parts 1–5 = cluster
deep-dives. Parts 6–10 = convergence, GUI compendium, master steal-list,
gap analysis, decision-ready candidates (L-series). Part 11 = landing
map. Part 12 = reference index.
**Citation convention:** `(R01 §Todoist)` = the app's section in
`research-lifeos/01-goals-tasks.md`. PersonalOS doc refs use real paths.
**Tag legend:** `[M4]`/`[M5]`/`[M6]`/`[M0+]` = milestone fit · `[coach]`
· `[new]` · effort L/M/H.

---

## PART 0 — EXECUTIVE SUMMARY (one page)

**The 10 biggest takeaways from ~360 sources across ~40 apps/topics:**

1. **Auto-updated goal progress is the one feature no consumer app
   ships** — Gtmhub proved it at enterprise scale: goal progress must be
   auto-computed from connected data, not manually entered. PersonalOS's
   weight-ladder / strength-standards "lit mirror number" is exactly
   that model — a genuine differentiator. (R01)

2. **Streaks' "2-Day Rule" (v10, 2024) is the only explicit shipped
   grace mechanic** — one day skipped without breaking the streak, with
   a "2" indicator ("do it today or it's missed"). The exact
   slip-handling pattern for M5's goal-expiry logic. (R01)

3. **Routinery's live finish-time estimate + post-run expected-vs-actual
   step report** is a near-exact blueprint for the plan-vs-actual toggle
   (M4). The running "when will this end" clock is the most-praised
   feature for time-blind users. (R02)

4. **The no-guilt deviation stack converges on three mechanics:**
   Structured's swipe-to-resolve "Replan" with a neutral "moved 3×"
   badge · Sunsama's workload-threshold counter (actual-vs-planned
   without scoring) · SkedPal's "re-found, not dropped" habit recovery.
   All three map directly onto the locked done-differently semantics.
   (R02)

5. **Tint-only is the calendar category's own ceiling, not a
   compromise** — Fantastical's year view (single-hue heatmap, "best
   year view ever seen"), Timepage's chip-free month heatmap, and
   Google's dot-only year view all converge on glyph-less volume marks.
   The locked M6 tint-only rule is validated by every major player. (R03)

6. **Plan-vs-actual in the day feed is UNCLAIMED territory** — Sunsama,
   Reclaim, and Polarsteps each have fragments, but no calendar renders
   `[planned: gym 17:00 · actual: missed]` as a day-view line. That's
   PersonalOS's signature M6 feature — open territory, evidence-backed.
   (R03)

7. **The "vacation, not laziness" period mechanism is evidence-backed**
   — Silverman's streak research (broken streaks demotivate; "what
   counts as a streak is malleable") and Duolingo's Streak Freeze slack
   study prove periods that suspend adherence pressure are more
   persistence-optimizing than rigid rules. (R03)

8. **"Show if not empty" is the cleanest honest-empty mechanism** —
   TickTick's smart lists auto-collapse until they have signal; Samsung
   Health's hollow unsupported-widget cards and Fitbit's quarter-screen
   AI paragraphs are the cautionary proofs. (R04)

9. **The locked M2 block order matches the literature's
   "operational → analytical" rule** (the #1 dashboard error per
   Valiotti): Today/ticks/capture = the operational control room;
   heatmap/goals/strength = analytical, below, with shimmer. Only
   Apple's Trends-vs-Workouts debate suggests any order contention.
   And **70% of sessions are 5-second glances** (Gouveia et al.,
   Ubicomp 2016) — the empirical mandate for one-tap discipline. (R04)

10. **Every surviving all-in-one system converges on the architecture
    PersonalOS already has** — one date-stamped store + filtered views
    + a built-in weekly review loop; the #1 predictor of survival. The
    best cross-domain insight engine (Daylio/WHOOP) is entirely
    rule-based and privacy-safe (with/without comparisons, next-day
    lag, confidence tiers, 5+5/90-day data thresholds,
    correlation-not-causation wording). And the top abandonment cause
    is "too complex to maintain" (67%) — PersonalOS's risk is SPRAWL,
    not incompleteness. (R05)

---

## PART 1 — METHOD & SOURCE BASE

- **5 parallel research agents**, ~360 distinct sources cited inline
  (official docs, 2026 reviews, design literature, peer-reviewed
  studies, template galleries, community guides).
- **Mobbin**: Todoist (326 screens), Things 3 (166), TickTick (97),
  Google Calendar (866), Cron/Notion Calendar (110) — JSON in
  `research-lifeos/mobbin-*.json` (helper `mobbin-query.mjs`).
- Honesty notes: Vantage Calendar ≠ AI planner (documented as
  Fortyfour AB's visual calendar); Goals by Google dead (removed Nov
  2022); Gtmhub → WorkBoard acquisition.

### The five clusters
| # | Cluster | Report | Apps/topics |
|---|---|---|---|
| 01 | Goals & Tasks | `01-goals-tasks.md` | Strides, Way of Life, Streaks, Todoist, TickTick, Things 3, Habitica, Notion goals, Weekdone, Gtmhub, Goals-by-Google (dead) |
| 02 | Routine & Briefing | `02-routine-briefing.md` | Routinery, Structured, TimeTune, SplenDO, Any.do, Motion, Sunsama, Vantage, SkedPal + At a Glance / Scheduled Summary |
| 03 | Calendar & Periods | `03-calendar-periods.md` | Google Calendar, Fantastical, Cron/Notion, Apple Calendar, Timepage, Sunsama/Reclaim day-view, Polarsteps, TripIt, GitHub graph, Year-in-Pixels, Life Calendar |
| 04 | Dashboard & Glance | `04-dashboard-glance.md` | Habitify, Habitica, Streaks, Duolingo, Apple Fitness, Samsung Health, Fitbit, Things 3, TickTick, Todoist, At a Glance, widgets, dashboard literature, glance research, skeletons, empty states, Notion life-OS dashboards |
| 05 | Integration patterns | `05-integration-patterns.md` | Notion life-OS, TickTick/Any.do all-in-one, Apple/Samsung Health aggregation, Obsidian daily-note-hub, cross-domain insights, complexity tax |

---

## PART 2 — CLUSTER 01: GOALS & TASKS (M5)
*(full depth: `research-lifeos/01-goals-tasks.md`)*

### 2.1 Cluster thesis
The goal model's frontier is AUTO-UPDATED progress from connected data
(Gtmhub's enterprise proof) + GRACE in slip handling (Streaks' 2-Day
Rule) + honest expiry without shame. PersonalOS's weight-ladder /
strength-standards lit-mirror design is the consumer-market version of
the auto-progress model nobody else ships.

### 2.2 App profiles (paradigm · goal model · GUI · steals)

**Gtmhub (→ WorkBoard)** — the auto-progress precedent (R01):
- Enterprise OKR platform; the lesson: goal progress computed from
  connected data (CRM, analytics) automatically — manual progress
  entry atrophies. "The one feature no consumer app has."
- Steal: [M5] auto-progress from connected data (the lit-mirror number
  — weight ladder / strength standards); [M5] progress computed, never
  reported.

**Streaks** — the grace mechanic (R01):
- Habit-goal app with **2-Day Rule (v10, 2024)**: one skipped day
  without breaking the streak + a "2" indicator ("do it today or it's
  missed"). The only explicit shipped grace in the cluster.
- Steal: [M5] the 2-day indicator pattern for goal-expiry logic;
  [coach] the "do it today or it's missed" neutral framing (no shame).

**Strides** — goal tracker with milestone charts (R01):
- Goal types (target/range/habit), milestone chart (vertical bar chart
  with per-week markers), manual progress logging.
- Steal: [M5] milestone chart visualization for goal pace; [M5]
  goal-type taxonomy (target/range) informing kind (generic|weight|
  strength).

**Way of Life / Habitica / Todoist / TickTick / Things 3** (R01):
- Way of Life: binary yes/no streak journaling — simplicity.
- Habitica: gamified quests — but reviews document users gaming tasks
  for points (validates no-XP) and abandonment on streak-reset shame.
- Todoist: task manager reference — projects, due dates, karma
  (degraded to noise — validates no-XP).
- TickTick: tasks + habits + calendar + pomodoro all-in-one; smart
  lists ("Show if not empty" — see R04).
- Things 3: the disciplined task manager — the "today surface", areas/
  projects, disciplined omission (no calendar of its own, no composite
  score).
- Steals: [M5] Things' today surface + area/project structure (maps to
  Life Areas); [M5] TickTick's smart lists; [coach] the anti-gaming
  evidence (no XP validated); [M5] Todoist's due-date + review
  cadence patterns.

**Notion goals / Weekdone** (R01): OKR-lite templates in products —
objective + key results + progress notes; the template sprawl warning.
- Steal: [M5] objective+target+progress structure (the goals table
  shape); avoid the sprawl.

### 2.3 Cross-cutting synthesis (R01)
- Auto-progress is the frontier (Gtmhub proof) — PersonalOS's lit-mirror
  design is consumer-first.
- Grace is shipped, not theorized (Streaks' 2-Day Rule) — encode it in
  M5 expiry logic.
- No-XP is empirically validated (Habitica gaming, Todoist karma
  noise, Streaks shame).
- Goal slips need neutral mechanics (2-day indicator, done-differently),
  never shame.

---

## PART 3 — CLUSTER 02: ROUTINE & BRIEFING (M4)
*(full depth: `research-lifeos/02-routine-briefing.md`)*

### 3.1 Cluster thesis
The routine model's frontier: TIMED steps with a live finish estimate
(Routinery) + POST-RUN expected-vs-actual reports (the plan-vs-actual
blueprint) + no-guilt deviation mechanics (Replan/moved-badge/
re-found). PersonalOS's M4 locked model (routine templates + briefing
card + plan-vs-actual) is validated with concrete upgrades available.

### 3.2 App profiles

**Routinery** (R02):
- Timed routine builder: ordered steps with durations; the RUN shows a
  **live finish-time estimate** ("when will this end" — most-praised
  feature for time-blind users) and a **post-run expected-vs-actual
  step report**.
- Steal: [M4] live finish-time estimate in the running routine;
  [M4] the post-run expected-vs-actual step report (near-exact
  blueprint for plan-vs-actual).

**Structured** (R02):
- Day-planner timeline (blocks you drag); **swipe-to-resolve Replan**
  with a neutral "moved 3×" badge — deviations handled without guilt.
- Steal: [M4] swipe-to-resolve deviation handling; [M4] the neutral
  moved-count badge (never shame).

**Sunsama** (R02):
- Daily planning ritual (morning planning, evening wrap-up), calendar +
  tasks + goals; **workload-threshold counter** (actual-vs-planned
  without scoring); the in-app "wrap up your day" card = the closest
  precedent to PersonalOS's one-notification/on-app-open constraint
  (the briefing card IS the scheduled summary — echoes Apple's
  Scheduled Summary).
- Steal: [M4] the planning ritual as a morning/evening rhythm;
  [M4] workload counter without scoring; [coach] the wrap-up card as
  the on-app-open briefing model.

**TimeTune / SplenDO / Any.do / Motion / Vantage / SkedPal** (R02):
- TimeTune: routine scheduler with week patterns; SplenDO: routine +
  habit combo; Any.do: day planner + tasks + calendar; Motion: AI
  scheduling (automation erodes control — cautionary); Vantage:
  visual calendar (day-as-stacks); SkedPal: auto-scheduling with
  **habit "re-found, not dropped"** recovery after interruptions.
- Steals: [M4] week-pattern routine scheduling; [M4] re-found-not-
  dropped recovery framing; cautionary: full automation erodes the
  user's sense of control.

**OS briefing patterns** (R02): Google At a Glance (contextual info on
the home screen), Apple Scheduled Summary (digest at a scheduled time).
- Steal: [M4] the briefing card as a contextual digest, on-app-open.

### 3.3 Cross-cutting synthesis (R02)
- The running routine wants a live finish estimate.
- The post-run report is the plan-vs-actual blueprint.
- Deviations are handled with neutral mechanics (Replan, moved-badge,
  re-found) — never scored, never shamed.
- The briefing card is the notification-substitute (on-app-open only).

---

## PART 4 — CLUSTER 03: CALENDAR & PERIODS (M6)
*(full depth: `research-lifeos/03-calendar-periods.md`)*

### 4.1 Cluster thesis
Tint-only is the category's own ceiling (validated); plan-vs-actual in
the day feed is unclaimed territory (PersonalOS's signature); the
period-as-container pattern is proven in three independent products.

### 4.2 App profiles

**Google Calendar** (R03): month grid with dot-marked days (glyph-less
volume), agenda day view; the reference month grid.
- Steal: [M6] dot/tint-only day cells (validates the locked rule);
  [M6] the agenda (chronological day list) as the day-view base.

**Fantastical** (R03): "the best year view ever seen" — **single-hue
heatmap year view**; chip-free month heatmap; natural-language input.
- Steal: [M6] the single-hue year heatmap (the tint-only family's
  ceiling); [M6] chip-free month density.

**Cron / Notion Calendar** (R03): calendar + docs integration; clean
week-focused UI. Steal: [M6] the docs-linked day (journal calendar
links).

**Apple Calendar / Timepage** (R03): month grid; Timepage's month
heatmap with weather; Yearli companions add year views. Steal: [M6]
month heatmap density patterns.

**Sunsama / Reclaim** (R03): est-vs-actual per task; calendar-derived
time analytics. Steal: [M6] the est-vs-actual fragment (plan-vs-actual
precedent).

**Polarsteps** (R03): GPS travel journal — route + photos + story;
plan/track step duality; trip = range-as-container. Steal: [M6] the
period-as-container pattern (route+media+story within a range);
[M6] plan-vs-track duality.

**TripIt** (R03): itinerary aggregation — a trip as a timeline of
events. Steal: [M6] trip timeline structure.

**GitHub contribution graph / Year-in-Pixels / Life Calendar** (R03):
- GitHub graph: the canonical year heatmap — tint levels by activity
  volume, missing days EMPTY (the honest-empty pattern).
- Year-in-Pixels: mood mosaic (already C-10 skipped; pattern lives on).
- Life Calendar: the 90-weeks grid — a human life as weeks; the
  existential/life-scale visualization family (Life Tree adjacent!).
- Steals: [M6] tint-level semantics (validated); [M6] empty-missing
  days (honest); [tree] the life-scale grid family (Life Tree
  research feed).

### 4.3 Cross-cutting synthesis (R03)
- Tint-only validated by every major player (Fantastical single-hue,
  Timepage chip-free, Google dots).
- Plan-vs-actual day-view line = unclaimed territory (the signature
  feature).
- Period-as-container proven (Polarsteps, TripIt, Lifeplanr phases).
- The streak-slack evidence (Silverman, Duolingo Streak Freeze)
  validates "vacation, not laziness."

---

## PART 5 — CLUSTER 04: DASHBOARD & GLANCE (M0+)
*(full depth: `research-lifeos/04-dashboard-glance.md`)*

### 5.1 Cluster thesis
The dashboard's rules are empirical: operational → analytical order,
show-if-not-empty blocks, 5-second glance mandate, per-block skeletons
for returning users only.

### 5.2 Key findings

**The block stack** (R04):
- The locked M2 order matches the literature's "operational →
  analytical" rule (Valiotti's #1 dashboard error): Today/ticks/
  capture = operational control room; heatmap/goals/strength =
  analytical, below, with shimmer. Only Apple's Trends-vs-Workouts
  debate suggests contention (strength snapshot vs heatmap order).
- "Show if not empty" (TickTick smart lists): blocks auto-collapse
  until they have signal — the honest-empty mechanism.
- Cautionary proofs: Samsung Health's hollow unsupported-widget cards;
  Fitbit's quarter-screen AI paragraphs.

**Glance science** (R04):
- **70% of sessions are 5-second glances** (Gouveia et al., Ubicomp
  2016) — the empirical mandate for one-tap discipline and glanceable
  blocks.
- Single-metric blocks beat multi-metric; numbers > charts for glance;
  charts > numbers for analysis (the block hierarchy: glance vs
  analysis split).

**Skeletons** (R04):
- The literature has moved past "skeletons always win": geometry-
  matched per-block skeletons for RETURNING users only; never for
  locally-cached light blocks. Refines the locked shimmer rule.

**Empty states** (R04):
- Honest empties + progressive fill beat placeholders; every block
  explains what will appear there in one line (locked M0 rule —
  validated).

**Habit/health homes** (R04): Habitify (today list + streak summary),
Apple Fitness (ring glance → detail drill-down), Samsung Health
(aggregated cards), Fitbit (today dashboard). Things 3's today surface
= the disciplined reference.

### 5.3 Cross-cutting synthesis (R04)
- Operational-first order validated; only the strength-snapshot vs
  heatmap position is open (tiny).
- Show-if-not-empty is the honest-empty mechanism.
- 5-second glance is the design unit.
- Skeletons: per-block, returning-users-only, never for cached blocks.

---

## PART 6 — CLUSTER 05: INTEGRATION PATTERNS
*(full depth: `research-lifeos/05-integration-patterns.md`)*

### 6.1 Cluster thesis
Every surviving all-in-one converges on PersonalOS's architecture
(one date-stamped store + filtered views + weekly review loop); the
cross-domain insight engine is rule-based and privacy-safe; the real
risk is sprawl (67% abandonment cause), not incompleteness.

### 6.2 Key findings

**Notion life-OS** (R05): the canonical life dashboard = habit
trackers + goal databases + journal databases + linked views
(relations/rollups); what works: cross-referencing; what collapses:
the complexity tax (template overload, unbounded schema).
- Steal: [new] the Life-Areas-as-portals concept (C-07 deferred) is
  the Notion rollup pattern in one-app form.

**TickTick / Any.do all-in-one** (R05): tasks+habits+calendar+focus in
one today surface; cross-domain filters; the day-surface assembly.
- Steal: [M5/M6] the unified today surface (already the M4 briefing
  card direction).

**Apple/Samsung Health aggregation** (R05): cross-domain metrics in
one place (rings, scores, trends); the no-wearable transfer: aggregate
from YOUR domains instead of sensors.
- Steal: [M0+] the aggregation model without wearables (the Life Tree
  is the ultimate expression).

**Obsidian daily-note-hub** (R05): the daily note as the integration
point — everything surfaces in the daily note (links to goals, habits,
calendar, journal); templates-as-structure.
- Steal: [M4] the briefing card as the daily-note hub (already the
  direction — validated).

**Cross-domain insights** (R05 — the most valuable section):
- The best engine (Daylio/WHOOP) is entirely rule-based: with/without
  comparisons, next-day lag, confidence tiers, 5+5/90-day data
  thresholds, correlation-not-causation wording.
- Example: "on days you train, mood averages 4.2 vs 3.1 otherwise" —
  with N-day lags and confidence labels.
- Steal: [coach] the rule-based cross-domain insight engine — a
  weekly Coach line family (facts-only, thresholds-guarded,
  correlation-not-causation); feeds the Life Tree's branch stories.

**The complexity tax** (R05): the top abandonment cause across all
sources is "too complex to maintain" (67%); disciplined apps (Things,
Apple Health) win by OMISSION — no composite score, no unbounded
schema.
- Guardrail: [all] every new feature must pass the sprawl check (does
  it earn its place in the surface?).

### 6.3 Cross-cutting synthesis (R05)
- The architecture is already the surviving pattern (one store +
  views + weekly loop).
- The cross-domain insight engine is rule-based, privacy-safe, and
  Coach-ready.
- Sprawl is the risk; omission is the discipline.

---

## PART 7 — CONVERGENCE MATRIX

| Dimension | Consensus | Best practitioner | PersonalOS status |
|---|---|---|---|
| Goal progress | Auto-updated from data | Gtmhub (enterprise) | LOCKED (lit-mirror ladder) — validated |
| Grace in slips | 2-Day Rule, neutral indicators | Streaks | LOCKED (grace) — add the 2-day pattern L-02 |
| Deviation handling | Replan / moved-badge / re-found | Structured, Sunsama, SkedPal | LOCKED (done-differently) — validated |
| Running routine | Live finish estimate | Routinery | NEW — L-04 |
| Plan-vs-actual | Post-run report / est-vs-actual | Routinery, Sunsama | LOCKED (M4 toggle) — blueprint found |
| Calendar cells | Tint/dot-only, glyph-less | Fantastical, Google, Timepage | LOCKED (tint-only) — validated |
| Year view | Single-hue heatmap | Fantastical | LOCKED (year heatmap) — validated |
| Day view plan-vs-actual | UNCLAIMED | — | SIGNATURE FEATURE — open territory |
| Periods | Range-as-container | Polarsteps, TripIt | LOCKED (periods) — validated |
| Dashboard order | Operational → analytical | literature + locked M2 | LOCKED — validated |
| Empty blocks | Show-if-not-empty | TickTick | LOCKED (honest empties) — add L-07 |
| Glance unit | 5-second glance | Gouveia et al. | LOCKED (one-tap) — validated |
| Skeletons | Per-block, returning-users-only | literature | LOCKED (shimmer) — refine L-09 |
| Integration | One store + views + weekly loop | all survivors | LOCKED (event log + check-in) — validated |
| Cross-domain insight | Rule-based, thresholds, lag | Daylio/WHOOP | NEW — L-10 |
| Complexity | Omission wins; 67% abandon on sprawl | Things, Apple Health | GUARDRAIL — L-11 |

---

## PART 8 — GUI & LAYOUT PATTERN COMPENDIUM

### 8.1 The goal surface
- Goal list with auto-progress (lit-mirror numbers); goal detail with
  milestone chart (Strides' vertical bars) + pace line + the 2-day
  indicator for slips; expiry states neutral ("window closed" not
  "failed").

### 8.2 The routine run
- Routine editor: ordered timed steps (Routinery); the RUN view: step
  list + live finish estimate + current-step progress; post-run
  expected-vs-actual step report (blueprint for plan-vs-actual).

### 8.3 The briefing card
- Sunsama-style morning planning + evening wrap-up; the card IS the
  on-app-open digest (Google At a Glance + Apple Scheduled Summary
  family); workload counter without scoring.

### 8.4 The calendar
- Month grid: tint/dot-only day cells (validated); year heatmap:
  single-hue levels (Fantastical); day view: chronological agenda
  (Google) + the plan-vs-actual line ([planned: gym 17:00 · actual:
  missed] — signature); periods as tinted ranges (Polarsteps).

### 8.5 The dashboard
- Operational-first block order (validated); show-if-not-empty blocks;
  5-second glance units; per-block skeletons for returning users;
  honest empties with one-line explanations.

### 8.6 The cross-domain insight line
- Weekly Coach line family: with/without comparisons, next-day lag,
  confidence tiers, thresholds-guarded, correlation-not-causation.

---

## PART 9 — THE MASTER STEAL-LIST (~45 items)

### A. Goals & Tasks (M5)
1. [M5/M] Auto-progress from connected data (lit-mirror validated) R01
2. [M5/L] Streaks' 2-Day Rule pattern (slip indicator "do it today or missed") R01
3. [M5/L] Milestone chart visualization (Strides) R01
4. [M5/L] Things-style today surface + areas/projects (Life Areas tie) R01
5. [M5/M] TickTick smart lists (show-if-not-empty) R01
6. [M5/L] Neutral expiry states ("window closed", never "failed") R01
7. [M5/L] Goal-type taxonomy (target/range) informing kind R01
8. [coach/L] Anti-gaming evidence recorded (no-XP validated) R01

### B. Routine & Briefing (M4)
9. [M4/L] Live finish-time estimate in the running routine R02
10. [M4/M] Post-run expected-vs-actual step report R02
11. [M4/L] Swipe-to-resolve deviation (moved-badge) R02
12. [M4/L] Workload counter without scoring R02
13. [M4/L] Re-found-not-dropped recovery framing R02
14. [M4/L] Week-pattern routine scheduling (TimeTune) R02
15. [M4/L] Briefing card = on-app-open digest (At a Glance family) R02
16. [coach/L] Wrap-up card as the one-touch evening review R02

### C. Calendar & Periods (M6)
17. [M6/L] Single-hue year heatmap (Fantastical) R03
18. [M6/L] Chip-free month density (Timepage) R03
19. [M6/M] Plan-vs-actual day-view line (signature — unclaimed) R03
20. [M6/L] Period-as-container (Polarsteps/TripIt) R03
21. [M6/L] Tint-level semantics with empty missing days (GitHub graph) R03
22. [tree/M] Life-scale grid family (Life Calendar — Life Tree feed) R03
23. [M6/L] Calendar-docs linked day (Cron/Notion) R03

### D. Dashboard & Glance (M0+)
24. [M0+/L] Show-if-not-empty blocks R04
25. [M0+/L] Single-metric glance blocks (5-second unit) R04
26. [M0+/L] Per-block geometry-matched skeletons, returning-users-only R04
27. [M0+/L] Operational-first order (validated; strength-vs-heatmap open) R04
28. [M0+/L] Numbers > charts for glance; charts > numbers for analysis R04
29. [M0+/L] Honest empties with one-line what-appears-here R04

### E. Integration
30. [coach/M] Rule-based cross-domain insight engine (with/without, lag, tiers, correlation-not-causation) R05
31. [M4/L] Daily-note-hub briefing card (validated direction) R05
32. [M0+/L] Aggregation without wearables (Life Tree as the expression) R05
33. [new/L] Life Areas as portals (C-07 pattern validated) R05
34. [all/L] SPRAWL GUARDRAIL: every feature passes "does it earn its place" R05

### F. Documented anti-patterns
35. Manual goal-progress entry (atrophies — Gtmhub lesson) R01
36. Gamified task points (Habitica gaming, Todoist karma noise) R01
37. Streak-reset shame (Streaks reviews; Lally 2010) R01
38. Full auto-scheduling eroding user control (Motion) R02
39. Scored deviations (nothing in the cluster scores — don't start) R02
40. Hollow widget cards (Samsung Health) R04
41. Quarter-screen AI paragraphs (Fitbit) R04
42. Skeleton-everywhere (literature: returning users only) R04
43. Unbounded schema / template overload (Notion sprawl) R05
44. Composite scores in dashboards (Things/Apple omit them) R05
45. Complexity tax (67% abandonment cause) R05

---

## PART 10 — GAP ANALYSIS vs PersonalOS (ranked)

### 10.1 Tier 1 — high fit, cheap, extends locked work
1. **2-Day slip indicator for goal expiry** (Streaks) — encode the
   grace pattern in M5 expiry logic (the "do it today or it's missed"
   indicator).
2. **Live finish estimate in the running routine** (Routinery) — the
   M4 routine run gains "ends ~17:40".
3. **Post-run expected-vs-actual step report** (Routinery) — the
   plan-vs-actual toggle's data source (what was planned vs what
   happened per step).
4. **Show-if-not-empty blocks** (TickTick) — the honest-empty mechanism
   for the dashboard.
5. **Neutral deviation badges** (Structured's "moved 3×") — the
   plan-vs-actual display's tone.
6. **Numbers > charts for glance; charts > numbers for analysis** — the
   block design rule (which blocks get what).
7. **Per-block skeletons, returning-users-only** — refine the locked
   shimmer rule.

### 10.2 Tier 2 — high value, more effort
8. **The plan-vs-actual day-view line** — the signature M6 feature
   (unclaimed territory; blueprint from Routinery/Sunsama fragments).
9. **Rule-based cross-domain insight engine** (Daylio/WHOOP pattern) —
   weekly Coach lines with thresholds, lags, confidence tiers,
   correlation-not-causation.
10. **Milestone chart for goal pace** (Strides) — the M5 goal detail
    visualization.
11. **Aggregation-without-wearables dashboard model** — cross-domain
    numbers in the Life Tree's branch stories.
12. **Week-pattern routine scheduling** (TimeTune) — richer routine
    patterns beyond daily.

### 10.3 Tier 3 — deliberate decisions
13. **The strength-snapshot vs heatmap order** — the one open position
    in the locked block order (Apple's Trends-vs-Workouts debate).
14. **Life-scale grid family** (Life Calendar) — Life Tree feed.
15. **Calendar-docs linked day** (Cron/Notion) — journal entries
    surfaced in the calendar day view (the J1 strip is adjacent).

### 10.4 Explicit no-goes
- Manual goal-progress entry (auto-progress or nothing).
- Gamified task points (no XP — validated twice).
- Scored deviations (neutral badges only).
- Full auto-scheduling (erodes control).
- Composite dashboard scores (omission wins).
- Unbounded schema (the sprawl guardrail).

---

## PART 11 — DECISION-READY CANDIDATES (L-series)

| ID | Candidate | Source | Effort |
|---|---|---|---|
| L-01 | Auto-progress lit-mirror (validated — record as confirmed) | Gtmhub | L (already locked) |
| L-02 | 2-Day slip indicator for goal expiry | Streaks | L |
| L-03 | Milestone chart for goal pace | Strides | M |
| L-04 | Live finish estimate in routine run | Routinery | L |
| L-05 | Post-run expected-vs-actual report | Routinery | M |
| L-06 | Plan-vs-actual day-view line (signature) | Sunsama/Reclaim fragments | M |
| L-07 | Show-if-not-empty blocks | TickTick | L |
| L-08 | Neutral deviation badges (moved 3×) | Structured | L |
| L-09 | Per-block skeletons, returning-users-only | literature | L |
| L-10 | Rule-based cross-domain insight engine | Daylio/WHOOP | M |
| L-11 | SPRAWL GUARDRAIL (every feature earns its place) | R05 | L |
| L-12 | Numbers>charts glance / charts>numbers analysis rule | R04 | L |
| L-13 | Week-pattern routine scheduling | TimeTune | M |
| L-14 | Strength-vs-heatmap order decision | Apple debate | L |
| L-15 | Life-scale grid (Life Tree feed) | Life Calendar | tree |

**Cross-cutting constraints:** no XP · no push · quiet week wins ·
facts-only · offline-first · no new deps without DecisionLog ·
tint-only calendar · done-differently semantics · show-your-work ·
sprawl guardrail.

---

## PART 12 — LANDING MAP

| Candidate | TEMP-PLANNING section | Docs landing | Decision |
|---|---|---|---|
| L-01..L-03 | Incorporate list (LOCKED batch) | Roadmap M5; Gamification.md (grace); UIUX.md | D082+ |
| L-04, L-05, L-08, L-13 | Incorporate list (LOCKED batch) | Roadmap M4; UIUX.md (routine run, briefing) | D082+ |
| L-06, L-07, L-09, L-12, L-14 | Incorporate list (LOCKED batch) | Roadmap M6 + UIUX.md (calendar, dashboard) | D082+ |
| L-10 | Incorporate list (coach) | CoachSystem.md (rule-book session) | rule-book + D082+ |
| L-11 | GUARDRAIL — House rules | AGENTS.md/DevelopmentWorkflow | locked |
| L-15 | Life Tree feed | LIFE TREE DESIGN SYSTEM section | tree session |

---

## PART 13 — REFERENCE INDEX

**Deep-dive reports** (`research-lifeos/`):
- `01-goals-tasks.md` — Strides, Way of Life, Streaks, Todoist,
  TickTick, Things 3, Habitica, Notion goals, Weekdone, Gtmhub
- `02-routine-briefing.md` — Routinery, Structured, TimeTune,
  SplenDO, Any.do, Motion, Sunsama, Vantage, SkedPal + OS briefings
- `03-calendar-periods.md` — Google, Fantastical, Cron/Notion, Apple,
  Timepage, Sunsama/Reclaim, Polarsteps, TripIt, GitHub graph,
  Year-in-Pixels, Life Calendar
- `04-dashboard-glance.md` — Habitify, Apple Fitness, Samsung Health,
  Fitbit, Things 3, TickTick, Todoist, At a Glance, widgets, design
  literature, glance research, skeletons, empties, Notion dashboards
- `05-integration-patterns.md` — Notion life-OS, TickTick/Any.do,
  Health aggregation, Obsidian daily-note-hub, cross-domain insights,
  complexity tax

**Mobbin data** (`research-lifeos/mobbin-*.json`): Todoist (326
screens), Things 3 (166), TickTick (97), Google Calendar (866),
Cron/Notion Calendar (110); helper `mobbin-query.mjs`.

### Mobbin dataset map (pipeline-draftable)
VERBATIM-CRITICAL: drafters copy FILE PATHS + screen counts exactly.

| Dataset | App | Screens | Serves |
|---|---|---|---|
| `research-lifeos/mobbin-screens-todoist.json` | Todoist | 326 | Task/today surface patterns (L-01..L-03 context) |
| `research-lifeos/mobbin-screens-things.json` | Things 3 | 166 | Disciplined today surface, areas/projects |
| `research-lifeos/mobbin-screens-ticktick.json` | TickTick | 97 | Smart lists, all-in-one today assembly |
| `research-lifeos/mobbin-screens-gcal.json` | Google Calendar | 866 | Month grid, agenda day view (M6) |
| `research-lifeos/mobbin-screens-cron.json` | Cron/Notion | 110 | Calendar+docs day, week-focused UI |

**PersonalOS docs referenced:** Roadmap.md (M4/M5/M6), UIUX.md,
Gamification.md (grace), CoachSystem.md (check-in, rule-book),
Database.md (routine slots, periods), TEMP-PLANNING.md (L-series
triage), the LIFE TREE DESIGN SYSTEM section (L-15 feed).