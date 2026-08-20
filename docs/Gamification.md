# PersonalOS — Gamification

Gamification rewards **meaningful progress**: consistency, completion of
meaningful goals, and long-term improvement.

It must NOT reward:

- opening the app repeatedly
- meaningless interactions (taps, streaks from logging alone)
- artificial streak farming

Deferred to M2. The philosophy and rules are locked now so M2 has no ambiguity.

## XP Sources (locked)

| Action | XP | Why it qualifies |
|---|---|---|
| Habit completed (on plan) | X per habit | consistency is the core value |
| Milestone completed | large bonus | meaningful progress |
| Goal completed | very large bonus | the rarest, most meaningful |
| Journal entry with content (word-count threshold, e.g. ≥20 words) | small | documentation is a core loop step; capped — see Anti-Farming |
| Media captured with an entry | small | life documentation; rides the journal cap |
| PR (real session, per exercise) | small | meaningful progress; milestone tiers 1st/5th/10th; size-weighted — a +≥2.5 kg est-1RM gain counts, micro-PRs do not; zero XP for logging itself; growth displays are the centerpiece |

<!-- REMOVED (D050 / L173): the "Weekly review completed | small" row. Reviews
never give XP — the weekly review loses its small-XP reward in the docs pass;
the milestone review gets none either; all reviews are earned-honor-only. -->

XP amounts are small by design. Exact numbers are fixed at M2 and are NOT
offered as settings toggles.

Not XP sources:

- Opening the app
- Browsing screens
- Empty/blank journal saves
- Restoring old streaks artificially
- Logging itself (logging a set records history; it does not mint XP)
- Trophies/achievements — they grant ZERO XP
- Imported content — imports show history, never earn (see Anti-Farming #7)

## Anti-Farming Rules

1. **Capped streak bonuses** — no endless escalation. A bonus can grow within a
   week, but weekly; there is no infinite multiplicative curve. Farming "one
   micro-habit" to pump XP is capped by per-habit XP ceilings.
2. **Content-gated journal XP** — XP only for entries with real content
   (word-count threshold + at least one meaningful field). At most the FIRST 2
   content-gated entries per day earn XP (caps the faucet; a genuine 3rd entry
   simply earns 0). Media XP is awarded once per entry and is bounded by the
   same journal cap — photos beyond an entry never mint XP; there is no
   standalone media faucet.
3. **No XP for logging retroactively in bulk** — events carry timestamps; only
   check-ins recorded on their actual day contribute to streak/XP bonuses.
4. **XP is a signal, not a score to farm** — levels exist for a sense of
   progression, but the Coach never uses XP to judge the user.
5. **Auto-tick is real — but only when the session is real** — an auto-ticked
   habit (from a workout session save) counts as a REAL completion with full
   XP, exactly like a manual completion, ONLY when the triggering session
   passes the same anti-cheat gate as everything else. A revoked tick (session
   deleted) returns its XP via the compensating `habit.completed_revoked`
   event — no double-earn, no delete-log cycles. This rule lives in the shared
   anti-farming gate, not per-screen.
6. **XP reversal is symmetric** — any auto-tick revoke or journal-invalidation
   that returns XP is written as a NEGATIVE XP event (additive reverse), never
   a deletion or retroactive edit. The event log keeps both sides so totals
   and history always reconcile; no re-derivation, no repair jobs.
7. **Imports never earn** — the `imported` flag is global on every importable
   entity row from the start. Every derived owner and achievement predicate
   filters imported rows internally (part of the contract); the 3-question
   anti-cheat gate rejects any import that would raise or trigger a trophy.
   Imports show history, never earn.
8. **XP caps kill faucets** — the journal cap (first 2 content-gated
   entries/day), the media cap (rides the journal cap), and the small,
   size-gated PR XP exist so no single activity becomes an XP pump.

## Streaks

- Tracked per habit and per Life Area (area streak = any qualifying action that day).
- Streak data derives from the event log, never stored independently as
  user-editable state.
- **Weekly checkpoint** — the rolling-average evaluation runs at the CLOSED
  calendar week (Sunday), once per week. Thin weeks (fewer than 5 of 7 logged
  weigh-in days) neither confirm nor reset anything. Weight-ladder and Real
  Progress confirmations read the two most recent consecutive non-thin weeks'
  checkpoints.
- **Fully-logged day** — two valid paths, one concept: a routine-active day
  counts when kcal are within ±10% of the day's target AND the planned meal
  types were logged; a no-routine day counts when kcal are within ±10% AND at
  least 2 actual meal logs exist. Streaks work from day one, before any
  routine setup. The window is ONE number (±10%; the old ±20 tolerance is
  superseded — both routine and no-routine paths use ±10%). The weekly check-in
  reports the actual average daily deviation (e.g. "~180 kcal above target")
  so precision lives in the verdict, not the badge.
- **Real Progress** — trophies fire on net change from the phase's STARTING
  rolling average, in the goal direction only, at 4 stepped repeatable
  thresholds: +2.5 kg / +5 kg / +10 kg / +20 kg, with 1-week rolling
  confirmation. Fires ONLY inside an active phase; the absolute bodyweight
  ladder stays as-is.
- **On Target** — the weekly average (5/7-day floor) must sit inside ±10% of
  the day's target — the SAME ±10% band as the fully-logged window; one number
  used by both. ±10% is the default under an Advanced-only knob clamped to
  5–15%. Fires ONLY inside an active phase.
- **Weight ladder (= v2 trophy thresholds)** — system weight milestones are
  the v2 weight-gain ladder: 70 · 75 · 80 · 85 · 90 · 95 · 100 kg, confirmed
  by the 7-day rolling average across TWO consecutive weekly checkpoints.
  Weight goals insert into THIS ladder — a goal's threshold is a ladder value,
  never bespoke; trophy and goal close on the same number.
- **Grace** — a forgiveness budget of 1 grace day per 7-day window, default 1,
  editable as a setting; per-window so it cannot stack endlessly; ONE shared
  budget across all habits; applies everywhere (habit streaks and life-area
  streaks). History stays true: a missed day is still recorded as a miss;
  grace only prevents the streak break. Grace is the ONLY finite streak shield
  — quiet weeks never shield streaks. Grace NEVER shields a robot-consistency
  run: a missed day there breaks the run. Planned rest applies to
  robot-consistency runs as a freeze.
- **Perfect Month is not grace-able** — grace covers streaks only. Perfect
  Month requires every calendar day logged (28–31 / 31 real log days); a
  grace-covered miss leaves that day empty, so the trophy does NOT fire.
- **Zero-XP consistency marker** — a soft "N days fully logged" marker on the
  dashboard, built from the fully-logged-day definition. No XP.

## Levels & Achievements

- Level curve: defined at M2; must be simple (no asymptotic curves).

> **Read these before building — this section is a summary, not the source:**
> every achievement in this system comes from TWO external files, both at the
> repo root, both LIVE: `../PersonalOS-Achievements-v2.md` (THE WHAT — the
> canonical catalog: names, criteria, tiers; 131 trophies + 47 ladder rungs)
> and `../TEMP-PLANNING-Achievement-Spec.md` (THE WHEN — the E0–E13 shared
> trigger engine, per-trophy TRIGGER predicates, rung tables R1–R47, and the
> DEPENDENCIES table; every predicate and dependency quoted below is spec
> verbatim). The decisions behind both are recorded in `IntegrationLedger.md`
> (THE WHY — pins G1–G20, TENSION 1–15, E-clashes, M3–M7, counters). When v2
> and the spec disagree, the ledger decides. When building, quote the source
> files, never this summary.

### Canonical sources — three layers, one truth

- **THE WHAT — the catalog:** [PersonalOS-Achievements-v2.md](../PersonalOS-Achievements-v2.md)
  is the single canonical home: user-authored, 9 domains, **131 trophies +
  47 ladder tiers = 178 named entries**, Growth-Ring tiers Sprout / Root /
  Branch / Heartwood / Ring / Grove. It wins every naming/criteria dispute.
- **THE WHEN — the trigger layer:** [TEMP-PLANNING-Achievement-Spec.md](../TEMP-PLANNING-Achievement-Spec.md)
  is the authoritative trigger engine: shared E0–E13 engine, per-trophy
  TRIGGER predicates, rung tables R1–R47, DEPENDENCIES table. Every v2 trophy
  has exactly one spec record and vice versa.
- **THE WHY — this ledger's pins:** the guardrails below. When v2 and the spec
  disagree, the ledger decides; nothing is edited ad hoc.
- **Both files stay LIVE sources** — this doc links them; it does not restate
  the catalog. The merged-canonical draft is DEFERRED; v2 stays the live
  source. TEMP-PLANNING-Achievements.md is SUPERSEDED as catalog — only its 7
  governing rules carry over: no XP values · 3-question gate · derived-only ·
  no-app-opening · no-imports · icons at build · one-time-or-repeatable
  discipline.
- **DOCS-PASS RULES (a)–(e)** — (a) merged catalog text = v2 verbatim for
  names/criteria/tiers; (b) trigger/machinery prose = spec verbatim for
  predicates and deps (no paraphrase that changes a number); (c) every pin
  below lands as a named rule/guardrail in this doc; (d) this doc states v2 +
  spec stay LIVE sources and links both; (e) 1:1 mapping guards — 131 trophy
  records ↔ 131 spec records ↔ 47 rungs; any drift count is a drafting error.
- **Achievements grant ZERO XP** (reviews, trophies, ladders — all of it).
- **Census corrections carried (do not reintroduce pre-correction numbers):**
  NoDeviation tolerance is ±3% (the earlier ±30% was a typo and is fixed);
  stale duplicate blocks were deleted from the v2 file; "once per calendar
  year" residue was scrubbed to anchored-yearly-window wording; Rolling Tape
  is the first KEPT vlog (captured OR adopted); the push-up ladder tier was
  renamed "Fifty Push-Ups".

### Shared primitives (owners and rules)

- **Account anchor** — longevity "day one" = the MINIMUM `occurredAt` across
  all events with `imported=false` and no tombstone/deletion; computed and
  FROZEN at the moment the first real event is written; stored immutable, read
  O(1), never user-editable. It is NOT the milestone-review anchor (first
  journal entry). It survives reinstall; imports can never set or shift it.
  Rings read this anchor.
- **occurredAt is the evidence, writtenAt is the clock** — the
  robot-consistency family reads `occurredAt` (the time the user declares the
  thing happened — the system rewards the ritual, not the typing). `writtenAt`
  still exists: immutable, device clock, set once, never user-editable — but
  it is operational truth only (sync ordering, dedupe, import handling,
  audit), never trophy evidence. Guardrails kept: imports never qualify,
  same-day single entry, window exactness, family strictness.
- **Month-day matcher** — one shared `sameMonthDay(a, b, toleranceDays=1)`
  serves Same Question New Answer / One Year Same Day / Half a Decade Same
  Day; leap day (Feb 29 → Feb 28 in non-leap years) is handled inside; never
  re-implemented per trophy.
- **Six-domain presence** — `dayDomainPresence(dayKey)` is a boolean per
  domain {journal, habits, fitness, nutrition, body, media} with a real-content
  floor and importless exclusion inside the predicate. The naive per-day scan
  is accepted. CHECK-AND-FIRE: the check runs only after a WRITE affecting
  that domain (never timer/render); a trophy fires exactly ONCE when its
  condition flips not-true → true, stays silent while true, and repeatables
  re-arm per cadence; one `achievement.unlocked` event, plus an optional one
  Coach line for Ring/Grove. Imported-heavy days never paint "full".
- **Two-domain same-day joins** — PR + journal (Wrote It Down), D031 photo +
  weight milestone (Eyes on the Data), journal + vlog-in-trip (Somewhere Else,
  Still You) are composed from `dayDomainPresence` plus targeted day queries;
  each half must independently be a real, qualifying event. Built once,
  shared.
- **Qualifying entry — ONE definition** — `qualifyingEntry(domain, dayKey)` is
  the single owner every "qualifying" sentence inherits. Bars: JOURNAL —
  non-imported entry, ≥40 words, on its own `occurredAt` day (the 40-word
  floor applies everywhere, matching Ink on the Page + the anti-burst
  guardrail; it is a different floor from the journal-XP content gate above);
  FOOD — non-imported log with ≥1 real logged item (named, quantified); typed
  daily totals/placeholders/empty never count; GYM — non-imported training
  session with ≥1 real logged set (weight/reps or time; zero-set sessions
  never count); HABITS — a real completion that day (including auto-tracked);
  `completion_revoked` never counts; PLANNED REST NEVER FILLS THE SLOT (a rest
  day is honest absence — streaks still freeze, Honest Rest still fires,
  nothing is punished, the domain is simply not present); BODY — a real
  weigh-in value OR a physique-timeline photo that day (typed guesses never
  count); VLOG/MEDIA — a kept, non-imported video with measured duration,
  captured through the pipeline OR adopted. Imports NEVER count anywhere.
  Derived line 1 — "a qualifying day": ≥1 qualifying entry in that domain.
  Derived line 2 — "qualifying activity in a month": ≥1 qualifying entry in
  that month.
- **Word-trophy carve-out** — Novel-Length Life and Deep Dive read EVERY
  non-imported entry's words regardless of the 40-word floor (they sum words,
  not entry-counts); only these two. The override table lists exactly:
  Novel-Length, Deep Dive (word-trophy), Ghost (run-alive, not entry-based),
  Bookended (calendar) — no others.
- **The year is anchored, never calendar-chopped** — a "year" is a
  non-overlapping 365-day window anchored at the family's first qualifying
  log. The six-domain family has ONE global anchor: the app's first-ever
  qualifying logged event across any domain — rings begin at the app's birth.
  "Once per calendar year" is DEAD as a phrase; trophies fire once per
  anchored year, checked when the window closes (no double-fire within a
  calendar, no partial-window credit). Bookended is the single NAMED
  exception: January-1 first entry + December-31 last entry in the SAME
  calendar year (one paragraph in the spec explains why it avoids the anchored
  rule; no other trophy does). Years are labeled "Year 1/2/…/N" with real
  dates inside. Imports never qualify any year.
- **Yearly meta-streak primitive** — one generic owner pair:
  `yearlyPass(criterion, anchor)` ("the Nth yearly window passed") plus
  `consecutiveYears(booleans, N)` for the run check; the Nth window counts
  from the DOMAIN'S first qualifying anchor event. Applies to all eleven
  multi-year non-ring families. No honest-gap tolerance — a failed window
  restarts the run at the NEXT window, never partial credit; check-and-fire
  once per window completion; rings use the same generic with the
  Life-Fully-Logged criterion; all-zero history → no fire.
- **Rings and Ouroboros** — rings are count-based and stack FOREVER; every
  year clearing the full six-domain bar brands one ring; gaps never erase.
  Ouroboros is the strictest: the Life bar met in 10 CONSECUTIVE anchored
  years; a gap/rested year restarts the count at zero, but a single gap is not
  permanent death — any 10 consecutive qualifying years fire (one-time).
- **Anniversary window** — `anniversaryWindow(anchorDate, k, ±toleranceDays)`
  is true if a qualifying event exists on any day within {k×365 ± tolerance}
  of the anchor. Two trophies consume it: ONE TRIP AROUND THE SUN (anchor =
  the habit's first qualifying completion; k=1; tolerance 7) and A YEAR ON THE
  BAR (anchor = the first-ever qualifying workout; k=1; tolerance 7). The
  anchor is the first qualifying non-imported event ever — never the
  install/open date; ±7 days is exact day distance. This is a distinct query
  class from yearlyPass.
- **Turn of the Page** — `phaseStartWindow(phaseId)` is true when a qualifying
  (real-content, non-imported) journal entry exists on a dayKey within ±3 days
  of that phase's startDate; repeatable per phase transition; check-and-fire
  after the phase-creation write and after journal writes near an open
  window; fires once when the window comes true. It stays its own trophy with
  its own helper (the phase-adjacency "Turn" is separate).
- **Re-fire map** — re-fire per qualifying window for the yearly-window
  families (Full Year One Habit, 3y–5y No Missing Links, and all 11 yearlyPass
  families); THE LONG HAUL re-fires per rebuilt 500-day streak; One Week In /
  A Hundred Days / Like Clockwork / One Trip Around the Sun are strictly once
  per habit; 3y/5y chains fire at chain completion. No double-fire within a
  window. Every once-per-habit/per-window fire calls out WHICH habit earned
  it. (Supersedes v2's "once per habit" wording for the yearly-window
  families.)
- **Vacation-day union** — vacation-day counting is a DAY-LEVEL UNION: each
  calendar dayKey inside ≥1 vacation period counts AT MOST once toward any
  vacation-day total, regardless of overlapping ranges. Never a naive
  per-period addition.

### Ghost in the Machine

- **Engine** — three independent robot-consistency runs, all alive at once,
  90 consecutive days, overlapping: `runAlive(component, dayKey)` (Clock =
  in-window completion streak unbroken, ~30-min window; Schedule = weekday-
  pattern run unbroken; NoDeviation = ±3%-vs-daily-target run unbroken,
  measured in LOGGED qualifying days; alive from the moment it exists and is
  unbroken — no trophy-earned requirement) plus `robotOverlapWindow()`: a
  rolling 90-day window where EVERY day has all three runs alive; evaluated
  after a relevant write (journal/workout/food/habit event), never
  timer/render; one read, one fire.
- **Semantics** — the lookback is ONE-SHOT: retroactive credit is valid the
  first time the check runs, and it is permanently silent once Ghost fires
  (fires from the EARLIEST qualifying day; no re-fire/re-arm/re-scan). NO
  GRACE — the robot family is exempt. An UNLOGGED day is a HARD MISS, not a
  freeze: it breaks NoDeviation's run; the 90 days rebuild from the first day
  all three runs are alive, measured in LOGGED days. Planned rest FREEZES a
  run but does not count as an alive day. Imports never qualify. Coach:
  celebration line once; no repeat congrats.

### Strength standards and records

- **Standards seed (frozen, verbatim)** — strengthSnapshot is seeded with all
  five tiers (Beginner/Novice/Intermediate/Advanced/Elite, men + women
  columns) from a published gym-going-population source (percentile-anchored:
  Novice ≈20th, Intermediate ≈50th, Advanced ≈80th, Elite top ≈5%). FROZEN
  seed values (men, est-1RM ÷ rolling BW): bench 0.50/0.75/1.20/1.60/2.00;
  squat 0.75/1.00/1.65/2.20/2.75; deadlift 1.00/1.25/2.00/2.50/3.00; overhead
  press 0.35/0.50/0.65/0.90/1.20 (women ≈60–70% upper, ≈75–85% lower). SCOPE
  = 4 canonical lifts only (bench/squat/DL/OHP); the barbell row is
  ratio-display-only; non-BIG-5 exercises are ratio-only; bodyweight/rep-mode
  exercises NEVER touch the table.
- **Rank map** — the seed lists are ordered Beginner, Novice, Intermediate,
  Advanced, Elite (bench 0.50=Beginner, 0.75=Novice, 1.20=Intermediate,
  1.60=Advanced, 2.00=Elite; same positional rule for squat/DL/OHP).
  "Strength Standard Reached" fires ONLY on ranks 2, 3, 4 (Novice → Branch,
  Intermediate → Heartwood, Advanced → Grove) — per lift, per tier, no
  aggregate condition. Rank 1 and rank 5 NEVER fire a trophy (Coach/profile
  grade display only), and no future pass may "fix" them in. The overall
  level (item 19) is a display-only profile grade — never a trophy, never a
  gate.
- **Absolute ladders are actual-lift-only** — absolute-lift trophy ladders
  (bench/squat/DL/OHP/curl thresholds) fire ONLY when a REAL logged set crosses
  threshold weight ≥ threshold AND reps ≥ 1, straight from exercise_sets (or
  the rep-mode addedLoadKg path) — NO est-1RM substitution, no inflation, no
  "45 kg × 8 ≈ 50 kg" math. Est-1RM stays for PR detection and standards;
  thresholds beyond the current best stay future-earnable; "real set on real
  day" + session-verify guard against warm-up failures and mistyped rack
  numbers; no deletion can re-mint (derived from committed history).
- **Relative-to-you and standards share one metric** — the relative family
  (Bodyweight Bench, One and a Half, Double Bodyweight Pull, Press
  Three-Quarters, Triple and Four Times) measures est-1RM ÷ 7-day rolling
  bodyweight — NOT actual bar weight — the same continuous scale the standards
  seed uses, through the same Epley owner. The two families never mix:
  absolute = actual-lift-only; relative/standards = est-1RM ratio.
- **Record modes** — weight-mode PRs use best est-1RM from the best working
  set within the 1–12 rep window (one set per session); rep-count mode has NO
  12-cap — PR is the best clean rep count, with addedLoadKg breaking ties.
  Every surface renders the mode-appropriate metric.
- **Tonnage** — "tonnage" (Moved a Mountain, Heaviest Session) counts
  weight-mode sets ONLY: weightKg × reps per set, summed. Rep-mode/bodyweight
  sets contribute ZERO; addedLoadKg is not entered either (a vest is not the
  load trophies measure). Displays may SHOW both, but trophy counters stay
  strictly weight-mode.
- **PR and vault stay derived** — PR ladder / vault timeline / milestone
  history are ALWAYS derived by walking sessions chronologically (`workout.pr`
  events exist for Coach/gamification/realtime toast only, never as the truth
  for vault or achievements). When re-derivation removes a previously fired
  PR-XP (set edit/delete), the gamification engine writes a NEGATIVE XP event
  so totals stay reconciled; PR XP never resurrects without a fresh real PR.

### Cadence and window rules (G pins — named guardrails)

- **G1 (30-min slot anchor)** — a robot-consistency run (Like Clockwork / Same
  Hour Same Scale / Same Time family) anchors its slot to its FIRST qualifying
  completion; later completions must each fall within ±30 min of that anchor;
  any outside = break. No fixed clock-grid; every run re-anchors at its own
  start.
- **G2 (Same Question re-arm)** — Same Question, New Answer fires at 2, 3,
  and 5 distinct years, one-time each — no repeats at 6+ ("5+" means the final
  milestone is at 5, not "fires every year after 5").
- **G3 (Then and Now)** — the "multi-year" third threshold = 3 years (6 months
  → Branch, 1 year → Heartwood, 3 years → Grove; a photo gap ≥3 years fires
  Grove).
- **G4 (count-milestone unit)** — count milestones (Unprompted 10/50/200,
  Wrote It Down 10/50, Full Circle Day 10/50/100/365) count DISTINCT
  QUALIFYING DAYS — a day with multiple qualifying entries still counts once;
  never entry-total multiplicity.
- **G5 (Juggling Act cadence)** — fires once per CLOSED 21-day window that
  qualifies (≥14 qualifying days) — a derived exists-a-window scan (sliding
  21-day window containing ≥14 qualifying days), NOT a rolling mean;
  overlapping sliding windows do not re-fire; the next legitimate shot is a
  fresh independently-qualifying window.
- **G6 (Trifecta week)** — fires once per closed 7-day window containing all
  three PRs; overlapping scans never re-fire.
- **G7b (Back-at-It PR)** — the matched/exceeded prior PR is ANY prior PR
  across any exercise — a deadlift PR satisfies a gap behind any lift, not
  per-exercise. (The plain "G7" label never appears in the source; G7b is the
  only one.)
- **G8 (Full Year One Habit anchor)** — the 365-day window anchors at THAT
  habit's first qualifying completion (local rebuild anchor), never the
  app-global anchor.
- **G9 (Living Archive window)** — all three criteria (200 entries + 100 vlogs
  + 100 workouts) must be concurrently true inside ONE shared 365-day window
  anchored at the app's global start.
- **G10 (week definition)** — A Week Whole uses ISO Mon–Sun calendar weeks
  (literal v2 text); never drifts with the review-day or week-start setting.
  The weekly checkpoint's closed week follows the same rule.
- **G11 (calendar month)** — Frame by Frame months are true calendar months
  (1st to month-end); a photo logged April 30 cannot fill March.
- **G12 (Bookended 40% floor)** — "≥40% of that year's days" = FLOOR(0.40 ×
  days-in-that-calendar-year): 146 on a 365-day year and 146 on a leap year
  (366 × 0.40 = 146.4 → floor 146). Always floor, never round-up.
- **G13 (Eyes on the Data window)** — the "same 7-day window" is any 7-day
  band CONTAINING the weight-ladder confirmation day (containment, not
  centering — no D−3…D+3 requirement).
- **G14/G15 (active phase required)** — Real Progress AND On Target fire ONLY
  inside an active phase (the phase's starting average / target band). No
  active phase → no fire, ever; goal-only days without a phase never satisfy
  them.
- **G16 (paced 80% thin weeks)** — weeks with <5 valid logged weigh-in days
  are thin — they count NEITHER for NOR against the 80%; the ratio is computed
  over non-thin weeks only.
- **G17 (full-cycle partial weeks)** — a partial week at a phase edge counts
  as a week when it has ≥1 qualifying workout; the 80% is computed over the
  phase's spread span (startDate→endDate).
- **G18 (same-hour weigh-in anchor)** — Same Hour Same Scale and Steady Hand
  anchor BOTH the weekday AND the 30-minute slot to the FIRST qualifying
  weigh-in of the run; every later weigh-in must land on that same weekday
  within that same ±30-min slot (26 consecutive weeks for Same Hour, 12 for
  Steady Hand); any outside = break; a run re-anchors at its own first
  weigh-in, and it uses occurredAt declared time.
- **G19 (Five Strong)** — "active streak ≥7" counts STRICT CONSECUTIVE days
  only — grace-carrying weeks do NOT count as active; a grace-rescued day is
  not an active day.
- **G20 (PB-alone day one)** — "Day One" in the PB-alone family = the first-
  ever qualifying habit-completion event; verified-consistent, no pin
  required.
- **E-clash #2 — a gap, never labeled** — the source family range implies
  five E-clashes, but #2 is never labeled anywhere and none exists. This doc
  does not invent one; no drafting may label an E-clash #2.

### Schedule-run rules

- **Empty-week rule** — a week with ZERO scheduled sessions FAILS that week —
  it never passes vacuously "because nothing was planned"; same consequence as
  a logged-out-of-schedule week (it breaks the run). Applies to BOTH Trimester
  (restarts from the next meeting week) AND The Schedule Never Breaks
  (off-pattern week; a first empty week means no run starts until a real
  scheduled week; pre-pattern history doesn't count toward the 26). The ONLY
  legal skip is a declared planned-rest week (cap 1 per run); bare empty weeks
  are failures, never free passes.
- **Trimester** — the target is the weekly schedule itself: a week PASSES if
  every scheduled session was logged (the same schedule The Schedule Never
  Breaks reads; no separate target-workouts-per-week number exists or is
  added). Weeks are calendar weeks (Mon–Sun; the first day follows the app's
  week-start setting if changed). Rest weeks are a FREEZE: a declared
  planned-rest week neither advances nor breaks the 12-week run (the calendar
  extends, the run waits), capped at ONE per run — a second planned-rest week
  inside the same run breaks it. Off-pattern weeks (right days wrong week;
  wrong days right week) FAIL the week — no "that was close" rounding.
  Imports never qualify; grace never shields a missed week. Coach: one
  celebration line per closed run; repeats only when a new run closes.
- **The Schedule Never Breaks rest day** — a planned-rest event landing ON a
  scheduled weekday means that slot is RESTED (it neither breaks the 26-week
  pattern run nor counts off-pattern); only a REAL missed day (no workout AND
  no rest declared) makes an off-pattern week.
- **Unprompted's domain list** — the solitary-day list is "no habit, workout,
  food log, or vlog"; BODY is deliberately excluded — a weigh-in or physique
  photo does NOT break Unprompted (body is routine tracking, not "another
  activity").
- **Elite tier** — intentionally left out: the standards table seeds five
  tiers but only Novice/Intermediate/Advanced fire trophies; the top tier is a
  Coach-observable ceiling only, ZERO trophies read it; no future pass may fix
  it into a trophy.

### Coach tie-in

- One direction only: the Coach REACTS to gamification events
  (`achievement.unlocked`, `level.reached`) as recognition material; it NEVER
  creates trophies and NEVER grants XP.
- Loudness: ONLY Ring and Grove receive Coach appreciation — one sincere
  derived line; ALL other tiers (Sprout / Root / Recognition / Heartwood) are
  a silent in-game toast with no Coach speech. The Coach never judges XP or
  points. One Coach line AT MOST per trophy fire; celebrations fire once per
  run/landing and never repeat congratulations. Celebrations respect the
  quiet-week and facts-only privacy rules; trophy lines ride the same
  auto-written, deletable coach_outputs machinery.
- Wrist/ankle trophy bodies are outside engine scope for now (deferred with
  the door open): if legs-and-ankles tracking ever lands, it is a string-enum
  body-part extension on existing body_metrics rows — affected trophies read
  the same rows, no contract change.

## Relationships with Other Systems

- **Coach:** consumes gamification events (`achievement.unlocked`,
  `level.reached`) as recognition material only — never the reverse, never to
  grant XP (see Coach tie-in).
- **Events:** gamification reads the event log ONLY. It never writes behavior
  events; it writes derived state (`xp_transactions`, `achievements`, `streaks`
  derived views) and, on revokes, compensating NEGATIVE XP events so history
  always reconciles. Every stat has exactly ONE owner function; all surfaces
  consume the same output — rounding happens once, in the owner.
- **Dashboard:** streak/XP status is a dashboard block, secondary to habits
  and journal; the zero-XP "N days fully logged" marker lives there too.
- **Settings:** XP/achievement values, formulas, and dayActivityScore weights
  are NOT offered as toggles.

## Open Items (decide at M2)

- Exact XP numbers per source, level thresholds, per-habit XP ceiling — still
  M2-open, and NOT offered as settings toggles.
- Resolved: "Achievement list (first 10)" — no longer an open item; the
  catalog is the live v2 file (178 named entries) plus the spec trigger layer,
  linked above.
- Resolved: "Grace-day default value" — 1 grace day per 7-day window, default
  1, editable as a setting (see Streaks).