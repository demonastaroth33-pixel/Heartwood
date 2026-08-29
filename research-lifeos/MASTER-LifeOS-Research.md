# LIFE-OS APP RESEARCH — MASTER COMPILE (Aug 2026)

**Super-thorough edition.** The complete cross-industry research base for
**PersonalOS** (private single-user Flutter PWA: journal + habits + gym +
nutrition + coach + goals + calendar + life tree). The FINAL research
block — covers the remaining unresearched surfaces (Goals & Tasks M5,
Routine & Briefing M4, Calendar & Periods M6, Dashboard M0+, and
whole-app integration) before the Life Tree design work.

> **How to read:** Part 0 = exec summary. Parts 1–5 = cluster deep-dives
> (per-app profiles with GUI detail). Parts 6–10 = convergence, GUI
> compendium, master steal-list, gap analysis, decision-ready candidates
> (L-series). Part 11 = landing map. Part 12 = reference index.
>
> **Citation convention:** `(R01 §Strides)` = app section in
> `research-lifeos/01-goals-tasks.md` (each carries inline URLs).
> **Tag legend:** `[M4]`/`[M5]`/`[M6]`/`[M0+]` = milestone · `[coach]` ·
> `[tree]` · effort L/M/H.

---

## PART 0 — EXECUTIVE SUMMARY (one page)

**The 10 biggest takeaways from ~360 sources across ~40 apps/topics:**

1. **Auto-updated goal progress is the one feature no consumer app
   ships** — Gtmhub proved it at enterprise scale: goal progress must be
   auto-computed from connected data, not manually entered. PersonalOS's
   weight-ladder / strength-standards "lit mirror number" is exactly
   that model — a genuine consumer-first differentiator. (R01)

2. **Strides' Pace Line is the goal-visualization steal** — a derived
   straight line from start value to target across the deadline, drawn
   against actuals, color-coded on/off-track ("behind pace" recoverable,
   never "failed"). Maps 1:1 onto the locked goal-pace + F1 projection.
   (R01 §Strides)

3. **Things 3's Logbook is the "won-archive" reference** — permanent,
   browsable completion history; the milestone-review "won" state should
   land in exactly this kind of archive with the one-line reflection.
   Its deadline-vs-start-date split is the calendar-ring precedent. (R01
   §Things 3)

4. **Streaks' "2-Day Rule" (v10, 2024) is the only explicit shipped
   grace mechanic** — one day skipped without breaking the streak, with
   a "2" indicator ("do it today or it's missed"). The exact
   slip-handling pattern for M5's goal-expiry logic. (R01 §Streaks)

5. **Routinery's live finish-time estimate + post-run expected-vs-actual
   step report** is a near-exact blueprint for the plan-vs-actual toggle
   (M4). The running "when will this end" clock is the most-praised
   feature for time-blind users. Skip is "a designed, neutral action —
   consistency not perfection" (the single most-cited retention factor).
   (R02 §Routinery)

6. **The no-guilt deviation stack converges on three mechanics:**
   Structured's swipe-to-resolve "Replan" with a neutral "moved 3×"
   badge · Sunsama's workload-threshold counter (actual-vs-planned
   without scoring) + the 5-step Daily Planning ritual + the in-app
   "Wrap up your day" card · SkedPal's "re-found, not dropped" habit
   recovery. All map directly onto the locked done-differently
   semantics and the one-notification/on-app-open constraint. (R02)

7. **Tint-only is the calendar category's own ceiling, not a
   compromise** — Google's own year view collapses to 365 presence dots
   ("the market's best-funded calendar renders a year as dots and still
   calls it a feature"); Fantastical's single-hue 4–5-step heatmap year
   view is "the best year view ever seen"; Timepage is chip-free. The
   locked M6 tint-only rule is validated by every major player. (R03)

8. **Plan-vs-actual in the day feed is UNCLAIMED territory** — Sunsama
   (est-vs-actual per task), Reclaim (calendar time analytics), and
   Polarsteps (plan/track step duality) each have fragments, but no
   calendar renders `[planned: gym 17:00 · actual: missed]` as a
   day-view line. That's PersonalOS's signature M6 feature. (R03)

9. **The period-as-container pattern is proven in three products** —
   Polarsteps' trip (date-bounded container with derived content,
   plan/track duality, auto-generated recap artifacts, printed books),
   TripIt's itinerary timeline, Lifeplanr phases. PersonalOS's locked
   periods model is the same thing, with the "blogging/media home"
   already specified. The "vacation, not laziness" mechanism is
   evidence-backed (Silverman streak research, Duolingo Streak Freeze).
   (R03)

10. **"Show if not empty" + operational-first order + 5-second glances**
    validate the locked dashboard: TickTick's smart lists auto-collapse
    until they have signal; the M2 block order matches the literature's
    "operational → analytical" rule (the #1 dashboard error per
    Valiotti); 70% of sessions are 5-second glances (Gouveia et al.,
    Ubicomp 2016). Skeletons: geometry-matched per-block, returning-
    users-only. And every surviving all-in-one converges on PersonalOS's
    architecture (one date-stamped store + filtered views + weekly
    review loop); the best cross-domain insight engine (Daylio/WHOOP)
    is entirely rule-based; the real risk is SPRAWL (67% abandonment
    cause), not incompleteness. (R04, R05)

---

## PART 1 — METHOD & SOURCE BASE

- **5 parallel research agents**, ~360 distinct sources cited inline
  (official docs, 2026 reviews, design literature, peer-reviewed
  studies, template galleries, community guides).
- **Mobbin**: Todoist (326 screens), Things 3 (166), TickTick (97),
  Google Calendar (866), Cron/Notion Calendar (110) — JSON in
  `research-lifeos/mobbin-*.json` (helper `mobbin-query.mjs`).
- Honesty notes: Vantage Calendar ≠ AI planner (documented as Fortyfour
  AB's visual calendar); Goals by Google dead (removed Nov 2022);
  Gtmhub → WorkBoard acquisition.

### The five clusters
| # | Cluster | Report | Apps/topics |
|---|---|---|---|
| 01 | Goals & Tasks | `01-goals-tasks.md` | Strides, Way of Life, Streaks, Todoist, TickTick, Things 3, Habitica, Notion goals, Weekdone, Gtmhub, Goals-by-Google (dead) |
| 02 | Routine & Briefing | `02-routine-briefing.md` | Routinery, Structured, TimeTune, SplenDO, Any.do, Motion, Sunsama, Vantage, SkedPal + At a Glance / Scheduled Summary |
| 03 | Calendar & Periods | `03-calendar-periods.md` | Google, Fantastical, Cron/Notion, Apple, Timepage, Sunsama/Reclaim, Polarsteps, TripIt, GitHub graph, Year-in-Pixels, Life Calendar |
| 04 | Dashboard & Glance | `04-dashboard-glance.md` | Habitify, Habitica, Streaks, Duolingo, Apple Fitness, Samsung Health, Fitbit, Things 3, TickTick, Todoist, At a Glance, widgets, dashboard literature, glance research, skeletons, empties, Notion dashboards |
| 05 | Integration patterns | `05-integration-patterns.md` | Notion life-OS, TickTick/Any.do, Health aggregation, Obsidian daily-note-hub, cross-domain insights, complexity tax |

---

## PART 2 — CLUSTER 01: GOALS & TASKS (M5)
*(full depth: `research-lifeos/01-goals-tasks.md`)*

### 2.1 Cluster thesis
The goal model's frontier is AUTO-UPDATED progress from connected data
(Gtmhub's enterprise proof) + GRACE in slip handling (Streaks' 2-Day
Rule) + honest expiry without shame (Things' Logbook). PersonalOS's
lit-mirror ladder design is the consumer-market version of the
auto-progress model nobody else ships.

### 2.2 App profiles (paradigm · goal model · GUI · steals)

**Strides** — goal tracker with milestone charts (R01 §Strides):
- *Paradigm:* four tracker types — Habit (yes/no), Target (numeric by
  date, with Pace Line), Average (repeating number), Project
  (milestones with dates). SMART structure built in.
- *The Pace Line (the steal):* a derived straight line from start value
  to target across the deadline, plotted against actuals, color-coded
  on/off-track. "Behind pace" = recoverable, never "failed". Maps 1:1
  onto goal-pace + F1 projections ("need 0.32 kg/week to hit 82 kg by
  Dec 1").
- *GUI:* dashboard = tracker list with color ring / progress % +
  status dot, two-tap daily logging; tracker detail = big progress
  chart + Pace Line overlay + log history + Milestone Calendar (dated
  milestone markers on month cells — the goal-deadline-ring precedent);
  create flow = 3-step wizard pushing templates.
- *Steals:* [M5] Pace Line (top steal — derived, offline, no shame);
  [M5] color-coded on/off-track status everywhere (amber drift for
  plan-adherence %); [M5] Milestone Calendar (extend: ring = deadline);
  [M5] target-achieved congrats popup (the minimal "won" moment);
  [M5] tracker-type distinction at creation (the kind enum).

**Way of Life** (R01): binary yes/no streak journaling; pattern charts.
Steal: [M5] the binary-simplicity check (don't overbuild goals).

**Streaks** (R01): habit-goal app with the **2-Day Rule (v10, 2024)**:
one skipped day without breaking the streak + a "2" indicator ("do it
today or it's missed"). The only explicit shipped grace in the cluster.
Steal: [M5] the 2-day indicator for goal-expiry logic; [coach] the
neutral "do it today" framing. Anti-pattern evidence: streak-reset
shame drives abandonment (Lally 2010: one missed day doesn't derail
habit formation).

**Todoist** (R01): the most-used task manager (~30-50M users);
Tasks→Projects→Sections→Subtasks; no native goals; **Karma (2013)** =
points with negative points for postponing — degraded to background
noise (the canonical no-XP evidence). GUI: sidebar (Inbox/Today/
Upcoming/Filters/Projects), Today = curated due+scheduled with daily-
goal counter, Upcoming = 7-day strip, project view with sections,
task row dense-but-scannable.
- *Steals:* [M5] natural-language capture ("every Mon/Wed", "by Dec 1");
  [M5] Today as curated-not-exhaustive; [M5] filters as derived views
  ("goals behind pace"); [M0+] offline-first done right at scale
  (validates the architecture); [coach] Karma as negative evidence.

**TickTick** (R01): tasks + habits + calendar + pomodoro in one; the
closest consumer analog to PersonalOS's integration ambition. Habit
targets as count-per-day/week; **smart lists (show-if-not-empty)**;
calendar view fuses tasks + events + habit markers on day cells;
check-in from the calendar day cell. GUI: sidebar (Inbox/Today/Next 7
Days/Calendar/Habits/Pomodoro/Statistics), Today grouped with habit
section, calendar with tasks as blocks + habit completion per day cell.
- *Steals:* [M5] tasks+habits+calendar one-surface fusion (deadline
  rings precedent); [M5] habit targets as count/day + frequency
  schedule first-class; [M5] check-in from the calendar day cell;
  [M0+] smart lists (show-if-not-empty); [M0+] privacy-as-
  differentiator (China-hosting concern validates offline-first).

**Things 3** (R01): Apple Design Award GTD manager; **Areas →
Projects → To-Dos with Headings as phases**; deadline + start-date
split; **Logbook = the won-archive** (permanent browsable completion
history); zero gamification by design ("gets out of the way"); the
Evening Review ritual built into the Today view. GUI: sidebar
(Inbox/Today/Upcoming/Anytime/Someday/Logbook), Today with "This
Evening" sub-heading + inline calendar events, Upcoming calendar strip
with deadline days marked, project page with headings.
- *Steals:* [M5] **Logbook as the won-archive** (milestone-review "won"
  entries land here with the one-line reflection); [M5] deadline-vs-
  start-date split (calendar rings mark deadlines distinctly);
  [M5] "This Evening" micro-view; [M5] Areas = domains above goals
  (goals carry a domain attribute); [M0+] restraint evidence again.

**Habitica** (R01): gamified quests; reviews document users gaming
tasks for points + abandonment on streak-reset shame — the no-XP
evidence. Anti-steal (softened): spendable custom rewards concept.

**Notion goals / Weekdone / Gtmhub** (R01):
- Notion: OKR via databases/templates — the template sprawl warning.
- Weekdone: OKR + weekly check-ins — the review cadence precedent.
- **Gtmhub (→ WorkBoard): auto-updated goal progress from connected
  data — the enterprise proof that manual progress entry atrophies.**
- Steals: [M5] auto-progress (the lit-mirror validated); [M5] weekly
  check-in cadence (Weekdone); avoid Notion's sprawl.

**Goals by Google** (R01): DEAD (removed Nov 2022) — post-mortem: even
Google couldn't sustain a standalone goals product; goals live inside
products with data (the PersonalOS lesson: goals attach to domains
with real data — weight ladder, strength standards).

### 2.3 Cross-cutting synthesis (R01)
- Auto-progress is the frontier (Gtmhub proof; Goals-by-Google's death
  = goals-without-data die) — PersonalOS's lit-mirror design is
  consumer-first.
- Grace is shipped, not theorized (Streaks' 2-Day Rule).
- No-XP is empirically validated (Habitica gaming, Todoist karma noise,
  Streaks shame).
- The won-archive (Things Logbook) is the milestone-review home.
- Natural-language capture + curated Today are the task-surface
  standards.

---

## PART 3 — CLUSTER 02: ROUTINE & BRIEFING (M4)
*(full depth: `research-lifeos/02-routine-briefing.md`)*

### 3.1 Cluster thesis
The routine model's frontier: TIMED steps with a live finish estimate
(Routinery) + POST-RUN expected-vs-actual reports (the plan-vs-actual
blueprint) + no-guilt deviation mechanics (Replan/moved-badge/
re-found) + the briefing card as the notification-substitute (Sunsama
wrap-up, Apple Scheduled Summary family).

### 3.2 App profiles

**Routinery** (R02 §Routinery):
- *Paradigm:* timed routine builder with ordered steps + durations;
  the RUN shows a **live finish-time estimate** ("when will this end" —
  the most-praised feature for time-blind users) and a **post-run
  expected-vs-actual step report** feeding an analysis streak view.
- *GUI:* home = routine cards (icon, title, day chips, "X habits · Y
  min", Start); running view = central countdown + step name + progress
  + control strip (cluttered — the control-surface lesson); Minimize
  Mode = floating pill/Live Activity; editor = step list with drag
  handles + context + duration; checklist widget completes routines
  from home.
- *Steals:* [M4] live finish-time estimate (briefing shows "expected
  end" per slot, updating as slots slip); [M4] post-run plan-vs-actual
  step report (direct model for routine_slot_logs); [M4] skip as a
  designed neutral action ("consistency not perfection" — the most-cited
  retention factor); [M4] auto-advance + one-tap start-day-template.

**Structured** (R02 §Structured):
- *Paradigm:* visual day timeline (hour-labeled vertical line, colored
  pill blocks, all-day band above).
- *GUI:* day timeline with drag-to-resize blocks; tap → detail sheet
  (notes, subtasks, color, icon, repeat, energy); **Energy Monitor
  widget** (pill gauge "19 of 30 Energy Points used" — energy as a
  budget function); **Replan swipe-quadrant** (reschedule/inbox/done/
  delete + skip/undo) with a neutral "moved 3×" badge.
- *Steals:* [M4] **Replan swipe-quadrant + moved-badge** (no-guilt
  deviation handling); [M4] **Energy Monitor as day-capacity**
  (the briefing's capacity indicator replacing guilt with a budget);
  [M4] all-day band (non-time-bound slots); [M4] recurrence edit
  scoping (this/all-future/all — the cleanest template-edit model;
  a day template edited mid-week doesn't corrupt the week).

**Sunsama** (R02 §Sunsama):
- *Paradigm:* the daily planning ritual (morning plan, evening wrap);
  calendar + tasks + goals in one; **workload-threshold counter**
  (actual-vs-planned without scoring); **Daily Shutdown ritual +
  Highlights journal**; the in-app **"Wrap up your day" card** = the
  closest precedent to the one-notification/on-app-open constraint.
- *GUI:* left nav (Daily Planning/Today/Backlog/Weekly); day columns
  with task cards + workload counter pinned; calendar with timeboxed
  sessions + dotted overlay (actual vs planned); Daily Planning modal
  (5 stages with progress + workload warning); Focus Mode; Daily
  Highlights with AI summaries (editable).
- *Steals:* [M4] the **5-step Daily Planning flow** (morning briefing:
  reflect on yesterday → slots pre-loaded → check capacity (macro-gap
  bar, storage meter) → finalize → go); [M4] planned-vs-actual as a
  neutral counter (three modes, threshold warnings, never a score);
  [M4] the evening close (what got logged, what was skipped (silent),
  one line of journal prompt); [coach] wrap-up card instead of push.

**TimeTune / SplenDO / Any.do / Motion / Vantage / SkedPal** (R02):
- TimeTune: week-pattern routine scheduling; SplenDO: routine + habit
  combo; Any.do: day planner + tasks + calendar; Motion: AI scheduling
  (calibration burden + loss of agency = cautionary; steal the
  mechanics — recurring-before-one-off, chunking, flexible-hours
  override, deadline-risk warnings — not the paradigm); Vantage:
  visual calendar (day-as-stacks); SkedPal: habit "re-found, not
  dropped" after interruptions.
- Steals: [M4] week-pattern routines; [M4] re-found-not-dropped
  recovery framing; [coach] deadline-risk warnings instead of shame
  (flag risk, offer actions, never moralize).

**OS briefing patterns** (R02): Google At a Glance (contextual home-
screen info), Apple Scheduled Summary (digest at a scheduled time).
- Steal: [M4] the briefing card as a contextual on-app-open digest.

### 3.3 Cross-cutting synthesis (R02)
- The running routine wants a live finish estimate; the post-run
  report is the plan-vs-actual blueprint.
- Deviations are handled with neutral mechanics (Replan, moved-badge,
  re-found, workload counters) — never scored, never shamed.
- The briefing card IS the notification-substitute (on-app-open only).
- Full automation erodes control — steal mechanics, not paradigms.

---

## PART 4 — CLUSTER 03: CALENDAR & PERIODS (M6)
*(full depth: `research-lifeos/03-calendar-periods.md`)*

### 4.1 Cluster thesis
Tint-only is the category's own ceiling (Google dots, Fantastical
heatmap, Timepage chip-free — all validated); plan-vs-actual in the day
feed is unclaimed territory (PersonalOS's signature); the
period-as-container pattern is proven in three products.

### 4.2 App profiles

**Google Calendar** (R03 §1):
- *Month view:* web = day number + event chips (3-4 then "+N more"
  overflow into a day popover); mobile = day number + up to ~4 colored
  dots (no text) — **dots signal that something exists, chips signal
  what**; the 2025 M3 Expressive redesign produced a Hermann grid
  illusion (ghost dots at intersections) — the cell-separator lesson;
  Today always outlined.
- *Year view:* web-only, **365 dots, no interaction** — "the market's
  best-funded calendar renders a year as dots and still calls it a
  feature". The strongest evidence for the locked tint-only rule.
- *Day view:* hour-grid with duration-sized blocks + all-day strip;
  agenda = chronological feed.
- *No period entity* — users fake vacations with color-coded all-day
  events. PersonalOS's real period entity has no competition from the
  reference product.
- *Steals:* [M6] "+N more" overflow rule (month cells show tints +
  rings; overflow lives in the day view); [M6] dots-because-it-works
  (glyph-less presence marks suffice at scale); [M6] card-cell
  anti-pattern (Hermann grid) — keep cell separators subtle; [M6]
  Today outline as a universal standard.

**Fantastical** (R03 §2):
- *The year view:* a TRUE heatmap — **one hue, 4-5 intensity steps,
  zero glyphs**; "the best year view we have ever seen"; hover tooltip
  = dates; tap = drill to that day. A production proof of the tint-only
  year view reading "volume" exactly as the M6 spec requires.
- *Month view:* compact calendar with per-calendar color dots +
  DayTicker (horizontal pill timeline of upcoming events — the
  "derived timeline" in miniature); mini-calendar + event list split =
  grid as navigation/presence, list as content (exactly PersonalOS's
  month→day relationship).
- *Quarter view:* the intermediate zoom (3 months).
- *Steals:* [M6] single-hue intensity heatmap (replace event count
  with activity volume + per-activity hue — a strict superset);
  [M6] hover/tooltip at year scale ("22/31 logged" per month, no
  glyphs); [M6] DayTicker = the on-this-day strip's visual language
  (horizontal time-ordered pills); [M6] quarter zoom.

**Cron / Notion Calendar** (R03 §3): calendar + docs integration;
clean week-focused UI. Steal: [M6] the docs-linked day (journal
entries surfaced in the calendar day — the J1 strip adjacency).

**Apple Calendar / Timepage** (R03 §4-5): month grid with dot density;
Timepage = the month heatmap reference (weather inline, chip-free).
Steals: [M6] month heatmap density; [M6] weather-adjacent fact lines
(optional).

**Sunsama / Reclaim** (R03 §6): est-vs-actual per task (Sunsama),
calendar-derived time analytics (Reclaim). Steals: [M6] the
est-vs-actual fragment (plan-vs-actual precedent).

**Polarsteps** (R03 §7):
- *Paradigm:* **Trip = container; step = content** — a date-bounded
  trip holds route, steps, photos, text, stats; content DERIVED from
  membership (the exact periods derivation model); **Plan/Track
  duality** (planned steps become tracked steps on arrival — the
  period-level plan-vs-actual); **auto-generated recap artifacts**
  (stats line, shareable page, printed Travel Books — the
  "blogging/media home"); offline + granular privacy marketed.
- *Steals:* [M6] period-as-container with derived content;
  [M6] plan/track duality inside the container; [M6] auto-composed
  period recaps (photos + journal lines + fact stats);
  [M6] distilled storytelling (long-hauler weekly summaries — the
  on-this-day strip layer); [M0+] offline-first marketed as a feature.

**TripIt** (R03 §8): itinerary aggregation — a trip as a timeline of
events. Steal: [M6] trip timeline structure.

**GitHub contribution graph** (R03 §9):
- *The heatmap family's ancestor:* 7x52 weeks-as-columns grid, five
  intensity levels of one hue, **missing days EMPTY (no moral valence
  on gaps in the calendar mainstream)**; below: totals + current
  streak + longest streak. The entire contribution-graph ecosystem
  (theme generators, fake-commit painters) proves the form factor's
  cultural power — and its farming problem (validates anti-farm).
- *Steals:* [M6] weeks-as-columns + intensity levels (validated);
  [M6] empty-missing-days honesty; [tree] the form factor's emotional
  resonance (Life Tree adjacency).

**Year in Pixels** (R03 §10): the mood-grid family — each day a
mood-colored cell; the C-10 skipped pattern; feeds Life Tree rings.

**Life Calendar** (R03 §11):
- *The 90-weeks grid:* a human life as weeks (90 years × 52 weeks);
  life-scale visualization with existential impact; paid apps
  (LifeCalendar.app, 90weeks.app) monetize the epiphany moment.
- *Steals:* [tree] the life-scale grid family — the Life Tree's
  spatial-meta layer (weeks-as-cells of a lifetime); the emotional
  register is exactly the tree's (awe without guilt).

### 4.3 Cross-cutting synthesis (R03)
- Tint-only validated by every major player; single-hue intensity is
  the ceiling (Fantastical).
- Plan-vs-actual day-view line = unclaimed territory (the signature
  feature; blueprints in Routinery/Sunsama fragments).
- Period-as-container proven (Polarsteps, TripIt, Lifeplanr phases).
- The streak-slack evidence (Silverman, Duolingo Streak Freeze)
  validates "vacation, not laziness."
- The calendar mainstream shows no moral valence on empty days — the
  tint family is volume-language, not judgment.

---

## PART 5 — CLUSTER 04: DASHBOARD & GLANCE (M0+)
*(full depth: `research-lifeos/04-dashboard-glance.md`)*

### 5.1 Cluster thesis
The dashboard's rules are empirical: operational → analytical order
(validated), show-if-not-empty blocks, 5-second glance mandate,
per-block skeletons for returning users only.

### 5.2 Key findings

**The block stack** (R04):
- The locked M2 order matches the literature's "operational →
  analytical" rule (Valiotti's #1 dashboard error): Today/ticks/capture
  = the operational control room; heatmap/goals/strength = analytical,
  below, with shimmer. Only Apple's Trends-vs-Workouts debate suggests
  contention (strength snapshot vs heatmap position — the L-14
  decision).
- **"Show if not empty"** (TickTick smart lists): blocks auto-collapse
  until they have signal — the honest-empty mechanism. Cautionary
  proofs: Samsung Health's hollow unsupported-widget cards, Fitbit's
  quarter-screen AI paragraphs.

**Glance science** (R04):
- **70% of sessions are 5-second glances** (Gouveia et al., Ubicomp
  2016) — the empirical mandate for one-tap discipline and
  single-metric glanceable blocks.
- Numbers > charts for glance; charts > numbers for analysis (the
  block design rule: glance vs analysis split).
- Habitify/Apple Fitness/Samsung Health/Fitbit homes: ring glance →
  detail drill-down is the health-dashboard consensus; Things 3's
  today = the disciplined reference.

**Skeletons** (R04):
- The literature has moved past "skeletons always win": geometry-
  matched per-block skeletons for RETURNING users only; never for
  locally-cached light blocks (refines the locked shimmer rule).

**Empty states** (R04):
- Honest empties + progressive fill beat placeholders; every block
  explains what will appear there in one line (locked M0 rule —
  validated); the "show if not empty" collapse is the mechanism.

### 5.3 Cross-cutting synthesis (R04)
- Operational-first order validated; only the strength-snapshot vs
  heatmap position is open (tiny — L-14).
- Show-if-not-empty is the honest-empty mechanism (L-07).
- 5-second glance is the design unit; numbers-for-glance is the block
  rule (L-12).
- Skeletons: per-block, returning-users-only, never for cached blocks
  (L-09).

---

## PART 6 — CLUSTER 05: INTEGRATION PATTERNS
*(full depth: `research-lifeos/05-integration-patterns.md`)*

### 6.1 Cluster thesis
Every surviving all-in-one converges on PersonalOS's architecture (one
date-stamped store + filtered views + weekly review loop); the
cross-domain insight engine is rule-based and privacy-safe; the real
risk is sprawl (67% abandonment cause), not incompleteness.

### 6.2 Key findings

**Notion life-OS** (R05): the canonical life dashboard = habit
trackers + goal databases + journal databases + linked views
(relations/rollups); what works: cross-referencing; what collapses:
the complexity tax (template overload, unbounded schema). Steal:
[new] the Life-Areas-as-portals concept (C-07 deferred) is the Notion
rollup pattern in one-app form.

**TickTick / Any.do all-in-one** (R05): tasks+habits+calendar+focus in
one today surface; cross-domain filters. Steal: [M5/M6] the unified
today surface (the M4 briefing card direction, validated).

**Apple/Samsung Health aggregation** (R05): cross-domain metrics in
one place (rings, scores, trends); the no-wearable transfer: aggregate
from YOUR domains instead of sensors. Steal: [M0+] the aggregation
model without wearables (the Life Tree is the ultimate expression).

**Obsidian daily-note-hub** (R05): the daily note as the integration
point — everything surfaces in the daily note (links to goals, habits,
calendar, journal); templates-as-structure. Steal: [M4] the briefing
card as the daily-note hub (already the direction — validated).

**Cross-domain insights** (R05 — the most valuable section):
- The best engine (Daylio/WHOOP) is entirely rule-based: with/without
  comparisons, next-day lag, confidence tiers, 5+5/90-day data
  thresholds, correlation-not-causation wording.
- Example: "on days you train, mood averages 4.2 vs 3.1 otherwise" —
  with N-day lags and confidence labels.
- Steal: [coach] the rule-based cross-domain insight engine — a weekly
  Coach line family (facts-only, thresholds-guarded,
  correlation-not-causation); feeds the Life Tree's branch stories.

**The complexity tax** (R05): the top abandonment cause across all
sources is "too complex to maintain" (67%); disciplined apps (Things,
Apple Health) win by OMISSION — no composite score, no unbounded
schema. Guardrail: [all] every new feature must pass the sprawl check
(does it earn its place in the surface?).

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
| Goal visualization | Pace Line (derived, no shame) | Strides | LOCKED (goal pace + F1) — blueprint L-03 |
| Won-archive | Permanent completion history | Things Logbook | NEW — L-02 tie (milestone-review home) |
| Grace in slips | 2-Day Rule, neutral indicators | Streaks | LOCKED (grace) — add L-02 |
| Task capture | Natural language + curated Today | Todoist, Things | NEW — L-01 context |
| Deviation handling | Replan / moved-badge / re-found | Structured, Sunsama, SkedPal | LOCKED (done-differently) — validated |
| Running routine | Live finish estimate | Routinery | NEW — L-04 |
| Plan-vs-actual | Post-run report / est-vs-actual | Routinery, Sunsama | LOCKED (M4 toggle) — blueprint L-05 |
| Calendar cells | Tint/dot-only, glyph-less | Fantastical, Google, Timepage | LOCKED (tint-only) — validated |
| Year view | Single-hue heatmap, 4-5 steps | Fantastical | LOCKED (year heatmap) — validated |
| Day view plan-vs-actual | UNCLAIMED | — | SIGNATURE FEATURE — L-06 |
| Periods | Range-as-container + plan/track | Polarsteps, TripIt | LOCKED (periods) — validated |
| Dashboard order | Operational → analytical | literature + locked M2 | LOCKED — validated (L-14 open) |
| Empty blocks | Show-if-not-empty | TickTick | LOCKED (honest empties) — L-07 |
| Glance unit | 5-second glance, numbers > charts | Gouveia et al. | LOCKED (one-tap) — L-12 |
| Skeletons | Per-block, returning-users-only | literature | LOCKED (shimmer) — L-09 |
| Integration | One store + views + weekly loop | all survivors | LOCKED (event log + check-in) — validated |
| Cross-domain insight | Rule-based, thresholds, lag | Daylio/WHOOP | NEW — L-10 |
| Complexity | Omission wins; 67% abandon on sprawl | Things, Apple Health | GUARDRAIL — L-11 |

---

## PART 8 — GUI & LAYOUT PATTERN COMPENDIUM

### 8.1 The goal surface
- Goal list with color-ring progress + status dots (Strides); the
  **Pace Line** overlay (dashed start→target vs actuals, on/off-track
  colors); **Milestone Calendar** (dated markers — extend to rings);
  target-achieved congrats popup; the **Logbook** won-archive (Things);
  the 2-day slip indicator (Streaks); neutral expiry ("window closed").

### 8.2 The routine run
- Routine editor: ordered timed steps with drag handles (Routinery);
  the RUN view: central countdown + step name + progress + **live
  finish-time estimate**; Minimize Mode floating pill; post-run
  expected-vs-actual step report; the day timeline with all-day band
  (Structured); **Replan swipe-quadrant** with moved-badge; Energy
  Monitor gauge; recurrence edit scoping (this/all-future/all).

### 8.3 The briefing card
- Sunsama's 5-step Daily Planning modal (reflect → slots pre-loaded →
  capacity check → finalize → go) with workload-threshold warnings;
  the **wrap-up card** as the on-app-open evening close (what got
  logged, what was skipped (silent), one journal line); At a Glance /
  Scheduled Summary as the digest family.

### 8.4 The calendar
- Month grid: tinted cells + deadline rings (with the Hermann-grid
  separator lesson — subtle hairlines, not floating cards); Today
  outlined; "+N more" overflow into the day view. Year heatmap:
  single-hue 4-5 intensity steps (Fantastical) + hover tooltip
  ("22/31 logged"); quarter zoom. Day view: chronological agenda +
  the **plan-vs-actual line** (signature); DayTicker-style pills for
  the on-this-day strip; periods as tinted ranges (Polarsteps) with
  plan/track duality and auto-composed recaps.

### 8.5 The dashboard
- Operational-first block order (validated); show-if-not-empty blocks;
  5-second glance units (numbers > charts for glance); per-block
  geometry-matched skeletons for returning users; honest empties with
  one-line what-appears-here; the storage meter + macro-gap bar as
  capacity gauges.

### 8.6 The cross-domain insight line
- Weekly Coach line family: with/without comparisons, next-day lag,
  confidence tiers, thresholds-guarded, correlation-not-causation.

---

## PART 9 — THE MASTER STEAL-LIST (~45 items)

### A. Goals & Tasks (M5)
1. [M5/M] Auto-progress from connected data (lit-mirror validated — Gtmhub) R01
2. [M5/L] Pace Line (derived start→target line vs actuals, no shame) R01
3. [M5/L] 2-Day Rule slip indicator (Streaks) R01
4. [M5/L] Logbook won-archive (Things) R01
5. [M5/L] Deadline vs start-date split (Things) R01
6. [M5/L] Milestone Calendar (extend to deadline rings) R01
7. [M5/L] Natural-language capture ("by Dec 1", "every Mon/Wed") R01
8. [M5/L] Curated Today view (due + scheduled, overdue gentle) R01
9. [M5/L] Filters as derived views ("goals behind pace") R01
10. [M5/L] Neutral expiry states ("window closed") R01
11. [M5/M] Habit targets as count/day + frequency schedule (TickTick) R01
12. [M5/L] Check-in from the calendar day cell (TickTick) R01
13. [M5/L] Areas = domains above goals (Things) R01
14. [M5/L] "This Evening" micro-view (Things) R01
15. [coach/L] Anti-gaming evidence recorded (no-XP validated) R01

### B. Routine & Briefing (M4)
16. [M4/L] Live finish-time estimate in the running routine (Routinery) R02
17. [M4/M] Post-run expected-vs-actual step report (Routinery) R02
18. [M4/L] Skip as designed neutral action ("consistency not perfection") R02
19. [M4/L] Swipe-to-resolve Replan + moved-badge (Structured) R02
20. [M4/L] Energy Monitor day-capacity gauge (Structured) R02
21. [M4/L] Recurrence edit scoping this/all-future/all (Structured) R02
22. [M4/L] Workload counter without scoring (Sunsama) R02
23. [M4/L] 5-step Daily Planning flow (Sunsama) R02
24. [M4/L] Wrap-up card instead of push (Sunsama) R02
25. [M4/L] Week-pattern routine scheduling (TimeTune) R02
26. [M4/L] Re-found-not-dropped recovery framing (SkedPal) R02
27. [M4/L] Recurring-before-one-off slot rule (Motion) R02
28. [M4/L] Flexible-hours override with visual blocking (Motion) R02
29. [coach/L] Deadline-risk warnings instead of shame (Motion) R02
30. [M4/L] All-day band for non-time-bound slots (Structured) R02

### C. Calendar & Periods (M6)
31. [M6/L] Single-hue 4-5-step heatmap year view (Fantastical) R03
32. [M6/L] "+N more" overflow rule (Google) R03
33. [M6/M] Plan-vs-actual day-view line (signature — unclaimed) R03
34. [M6/L] Period-as-container with derived content (Polarsteps) R03
35. [M6/L] Plan/track duality inside the container (Polarsteps) R03
36. [M6/M] Auto-composed period recaps (Polarsteps) R03
37. [M6/L] Distilled storytelling (long-hauler summaries) R03
38. [M6/L] Hermann-grid cell-separator lesson (Google) R03
39. [M6/L] Hover tooltip at year scale ("22/31 logged") R03
40. [M6/L] DayTicker pill strip (on-this-day language) R03
41. [M6/L] Calendar-docs linked day (Cron/Notion) R03
42. [M6/L] Quarter zoom (Fantastical) R03
43. [M6/L] Empty-missing-days honesty (GitHub graph) R03
44. [tree/M] Life-scale 90-weeks grid (Life Calendar — tree feed) R03

### D. Dashboard & Glance (M0+)
45. [M0+/L] Show-if-not-empty blocks (TickTick) R04
46. [M0+/L] Single-metric glance blocks (5-second unit) R04
47. [M0+/L] Numbers > charts for glance; charts > numbers for analysis R04
48. [M0+/L] Per-block geometry-matched skeletons, returning-users-only R04
49. [M0+/L] Operational-first order (validated; strength-vs-heatmap open) R04
50. [M0+/L] Honest empties with one-line what-appears-here R04

### E. Integration
51. [coach/M] Rule-based cross-domain insight engine (with/without, lag, tiers, correlation-not-causation) R05
52. [M4/L] Daily-note-hub briefing card (validated direction) R05
53. [M0+/L] Aggregation without wearables (Life Tree as the expression) R05
54. [new/L] Life Areas as portals (C-07 pattern validated) R05
55. [all/L] SPRAWL GUARDRAIL: every feature passes "does it earn its place" R05

### F. Documented anti-patterns
56. Manual goal-progress entry (atrophies — Gtmhub; Goals-by-Google death) R01
57. Gamified task points (Habitica gaming, Todoist karma noise) R01
58. Streak-reset shame (Streaks reviews; Lally 2010) R01
59. Full auto-scheduling eroding user control (Motion) R02
60. Scored deviations (nothing in the cluster scores — don't start) R02
61. Hollow widget cards (Samsung Health) R04
62. Quarter-screen AI paragraphs (Fitbit) R04
63. Skeleton-everywhere (literature: returning users only) R04
64. Unbounded schema / template overload (Notion sprawl) R05
65. Composite scores in dashboards (Things/Apple omit them) R05
66. Complexity tax (67% abandonment cause) R05

---

## PART 10 — GAP ANALYSIS vs PersonalOS (ranked)

### 10.1 Tier 1 — high fit, cheap, extends locked work
1. **2-Day slip indicator for goal expiry** (Streaks) — encode the
   grace pattern in M5 expiry logic ("do it today or it's missed").
2. **Pace Line for goal visualization** (Strides) — the locked
   goal-pace + F1 projection gets its visual: derived start→target
   line vs actuals, on/off-track colors, "behind pace" not "failed".
3. **Logbook as the milestone-review won-archive** (Things) — "won"
   entries land in a permanent browsable archive with the one-line
   reflection.
4. **Live finish estimate in the running routine** (Routinery) — the
   M4 routine run gains "ends ~17:40", updating as slots slip.
5. **Post-run expected-vs-actual step report** (Routinery) — the
   plan-vs-actual toggle's data source.
6. **Show-if-not-empty blocks** (TickTick) — the honest-empty
   mechanism for the dashboard.
7. **Neutral deviation badges** (Structured's "moved 3×") — the
   plan-vs-actual display's tone.
8. **Natural-language capture** (Todoist) — "by Dec 1", "every
   Mon/Wed" for M5 tasks.
9. **Numbers > charts for glance; charts > numbers for analysis** —
   the block design rule.
10. **Per-block skeletons, returning-users-only** — refine the locked
    shimmer rule.

### 10.2 Tier 2 — high value, more effort
11. **The plan-vs-actual day-view line** — the signature M6 feature
    (unclaimed territory; blueprints from Routinery/Sunsama/Polarsteps
    fragments).
12. **Rule-based cross-domain insight engine** (Daylio/WHOOP pattern)
    — weekly Coach lines with thresholds, lags, confidence tiers,
    correlation-not-causation.
13. **Milestone chart for goal pace** (Strides) — the M5 goal-detail
    visualization.
14. **Auto-composed period recaps** (Polarsteps) — the M6
    blogging/media home: photos + journal lines + fact stats from
    period membership.
15. **Week-pattern routine scheduling** (TimeTune) — richer routine
    patterns beyond daily.
16. **Aggregation-without-wearables dashboard model** — cross-domain
    numbers in the Life Tree's branch stories.

### 10.3 Tier 3 — deliberate decisions
17. **The strength-snapshot vs heatmap order** — the one open position
    in the locked block order (Apple's Trends-vs-Workouts debate).
18. **Life-scale grid family** (Life Calendar) — Life Tree feed.
19. **Calendar-docs linked day** (Cron/Notion) — journal entries
    surfaced in the calendar day view (the J1 strip is adjacent).
20. **DayTicker strip** — the on-this-day strip's visual language
    (horizontal time-ordered pills).

### 10.4 Explicit no-goes
- Manual goal-progress entry (auto-progress or nothing — Gtmhub +
    Goals-by-Google death).
- Gamified task points (no XP — validated twice).
- Scored deviations (neutral badges only).
- Full auto-scheduling (erodes control).
- Composite dashboard scores (omission wins).
- Unbounded schema (the sprawl guardrail).

---

## PART 11 — DECISION-READY CANDIDATES (L-series)

Same pipeline format as C/F/N-series: `- L-XX NAME (STATUS):` + labeled
chunks. Full detail for the top batch; the rest land in triage.
Every candidate respects: no XP · no push · quiet week wins · facts-
only · offline-first · tint-only calendar · done-differently · no new
deps without DecisionLog · sprawl guardrail.

**L-01 NATURAL-LANGUAGE CAPTURE + CURATED TODAY (M5)** · L
- SOURCE: Todoist (R01 §4), Things 3 (R01 §6).
- PROBLEM: task/goal creation and the today surface are the daily
  contact points; friction there compounds.
- PROPOSAL: (a) natural-language parsing for M5 goals/tasks ("by Dec
  1", "every Mon/Wed", "every weekday") — the gold standard for
  low-friction entry; (b) a curated Today view (due + scheduled +
  deadline-ring days pulling their goal in; overdue surfaced gently).
- CONSTRAINTS: offline parser (rule-based, no AI); derived-only.
- LANDS: Roadmap M5; UIUX.md (goal/task surfaces); Database.md (parse
  output fields).

**L-02 2-DAY SLIP INDICATOR + LOGBOOK (M5)** · L
- SOURCE: Streaks (R01 §3), Things 3 (R01 §6).
- PROBLEM: M5 goal expiry needs grace + a won-archive.
- PROPOSAL: (a) the 2-day slip indicator for goal cadences ("do it
  today or it's missed" — neutral, never shame); (b) the Logbook —
  a permanent browsable won-archive where milestone-review "won"
  entries land with their one-line reflection.
- LANDS: Roadmap M5; Gamification.md (grace family); CoachSystem.md
  (milestone review); UIUX.md (goal surfaces).

**L-03 PACE LINE GOAL VISUALIZATION (M5)** · M
- SOURCE: Strides (R01 §1).
- PROPOSAL: the locked goal-pace + F1 projection rendered as a derived
  Pace Line (start→target dashed line vs actuals, on/off-track
  colors); "behind pace" framing (recoverable), never "failed".
- CONSTRAINTS: derived-only; offline; no shame language.
- LANDS: Roadmap M5 (goal detail); Architecture.md (owner);
  UIUX.md (goal chart).

**L-04 LIVE FINISH ESTIMATE (M4)** · L
- SOURCE: Routinery (R02 §1).
- PROPOSAL: the running routine/briefing shows "expected end" per slot,
  updating as slots slip (time-blind users' most-praised mechanic).
- LANDS: Roadmap M4; UIUX.md (routine run + briefing card).

**L-05 POST-RUN EXPECTED-VS-ACTUAL REPORT (M4)** · M
- SOURCE: Routinery (R02 §1).
- PROPOSAL: the plan-vs-actual toggle's data source — a post-run step
  report (expected vs actual minutes per slot), feeding the locked
  routine_slot_logs.
- LANDS: Roadmap M4; UIUX.md (day view toggle).

**L-06 PLAN-VS-ACTUAL DAY-VIEW LINE (M6 — the signature)** · M
- SOURCE: unclaimed territory (R03 synthesis; fragments in Sunsama/
  Reclaim/Polarsteps).
- PROPOSAL: `[planned: gym 17:00 · actual: missed]` as a day-view
  line — neutral, tint/tone-coded, never scored; the feature no
  calendar ships.
- CONSTRAINTS: tint-only compliance; done-differently semantics;
  no shame.
- LANDS: Roadmap M6; UIUX.md (day view); CoachSystem.md (adherence
  semantics).

**L-07 SHOW-IF-NOT-EMPTY BLOCKS (M0+)** · L
- SOURCE: TickTick smart lists (R04).
- PROPOSAL: dashboard blocks auto-collapse until they have signal —
  the honest-empty mechanism (validated by Samsung Health's hollow
  cards as the cautionary).
- LANDS: UIUX.md (dashboard); Roadmap M0+.

**L-08 NEUTRAL DEVIATION BADGES (M4)** · L
- SOURCE: Structured (R02 §2).
- PROPOSAL: the plan-vs-actual display's tone — a neutral "moved 3×"
  badge; deviations handled by swipe-to-resolve, never scored.
- LANDS: UIUX.md (day view); CoachSystem.md.

**L-09 PER-BLOCK SKELETONS, RETURNING-USERS-ONLY (M0+)** · L
- SOURCE: skeleton literature (R04).
- PROPOSAL: refine the locked shimmer rule — geometry-matched per-block
  skeletons for returning users only; never for locally-cached light
  blocks.
- LANDS: UIUX.md (dashboard); Roadmap M0+.

**L-10 RULE-BASED CROSS-DOMAIN INSIGHT ENGINE (coach)** · M
- SOURCE: Daylio/WHOOP pattern (R05).
- PROPOSAL: weekly Coach lines computed rule-based across domains:
  with/without comparisons, next-day lag, confidence tiers, 5+5/90-day
  data thresholds, correlation-not-causation wording ("on days you
  train, mood averages 4.2 vs 3.1 otherwise"). Feeds the Life Tree's
  branch stories.
- CONSTRAINTS: facts-only; thresholds-guarded; never a score.
- LANDS: CoachSystem.md (rule-book session); Architecture.md (owner).

**L-11 SPRAWL GUARDRAIL (all)** · L
- SOURCE: R05 (67% abandonment cause).
- PROPOSAL: every new feature passes "does it earn its place in the
  surface" before locking; omission is the discipline.
- LANDS: House rules; DevelopmentWorkflow.

**L-12 NUMBERS>CHARTS GLANCE / CHARTS>NUMBERS ANALYSIS (M0+)** · L
- SOURCE: glance research (R04).
- PROPOSAL: the block design rule — glance blocks lead with a single
  number; analysis surfaces get the charts.
- LANDS: UIUX.md (dashboard); DesignSystem.md.

**L-13 WEEK-PATTERN ROUTINE SCHEDULING (M4)** · M
- SOURCE: TimeTune (R02).
- PROPOSAL: routine patterns beyond daily (weekday/weekend/weekly
  variants) — the locked template model's scheduling enrichment.
- LANDS: Roadmap M4; Database.md (routine patterns).

**L-14 STRENGTH-VS-HEATMAP ORDER DECISION (M0+)** · L
- SOURCE: Apple Trends-vs-Workouts debate (R04).
- PROPOSAL: the one open position in the locked block order — resolve
  strength snapshot vs calendar/heatmap strip placement at the UI/UX
  ordering pass (recorded now so it's not reopened blindly).
- LANDS: UIUX.md (dashboard blocking order).

**L-15 LIFE-SCALE GRID (tree — Life Tree feed)** · tree
- SOURCE: Life Calendar (R03 §11).
- PROPOSAL: the 90-weeks-per-year life-scale grid family as the Life
  Tree's spatial-meta layer — the emotional register (awe without
  guilt) is exactly the tree's.
- LANDS: LIFE TREE DESIGN SYSTEM section (tree session).

---

## PART 12 — LANDING MAP

| Candidate | TEMP-PLANNING section | Docs landing | Decision |
|---|---|---|---|
| L-01, L-02, L-03 | Incorporate list (LOCKED batch) | Roadmap M5; Gamification.md (grace); UIUX.md; Database.md | D082+ |
| L-04, L-05, L-08, L-13 | Incorporate list (LOCKED batch) | Roadmap M4; UIUX.md (routine run, briefing, day view) | D082+ |
| L-06, L-07, L-09, L-12, L-14 | Incorporate list (LOCKED batch) | Roadmap M6 + UIUX.md (calendar, dashboard); CoachSystem.md | D082+ |
| L-10 | Incorporate list (coach) | CoachSystem.md (rule-book session); Architecture.md | rule-book + D082+ |
| L-11 | GUARDRAIL — House rules | AGENTS.md / DevelopmentWorkflow | locked |
| L-15 | Life Tree feed | LIFE TREE DESIGN SYSTEM section | tree session |

---

## PART 13 — REFERENCE INDEX

**Deep-dive reports** (`research-lifeos/`):
- `01-goals-tasks.md` — Strides, Way of Life, Streaks, Todoist,
  TickTick, Things 3, Habitica, Notion goals, Weekdone, Gtmhub,
  Goals-by-Google post-mortem
- `02-routine-briefing.md` — Routinery, Structured, TimeTune, SplenDO,
  Any.do, Motion, Sunsama, Vantage, SkedPal + OS briefing patterns
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

### Mobbin dataset map (pipeline-draftable design references)
VERBATIM-CRITICAL: drafters copy the FILE PATHS + screen counts
exactly (never inline JSON). Each dataset serves the listed surfaces;
L-candidate LANDS carry per-candidate refs at triage.

| Dataset (file) | App | Screens | Serves (surface / candidates) |
|---|---|---|---|
| `research-lifeos/mobbin-screens-todoist.json` | Todoist | 326 | Task/today surface patterns (L-01 context), filters |
| `research-lifeos/mobbin-screens-things.json` | Things 3 | 166 | Disciplined today, areas/projects, Logbook (L-02) |
| `research-lifeos/mobbin-screens-ticktick.json` | TickTick | 97 | Smart lists (L-07), all-in-one today assembly |
| `research-lifeos/mobbin-screens-gcal.json` | Google Calendar | 866 | Month grid, agenda day view, year dots (M6/L-06) |
| `research-lifeos/mobbin-screens-cron.json` | Cron/Notion | 110 | Calendar+docs day, week-focused UI (M6) |
| `research-lifeos/mobbin-query.mjs` | — | — | Query helper for future pulls |

**PersonalOS docs referenced:** Roadmap.md (M4/M5/M6), UIUX.md,
Gamification.md (grace), CoachSystem.md (check-in, rule-book,
milestone review), Database.md (routine slots, periods), Architecture.md
(owner catalog), TEMP-PLANNING.md (L-series triage), the LIFE TREE
DESIGN SYSTEM section (L-15 feed).