# PersonalOS — Coach System

The Coach is the system that makes PersonalOS feel like a coach instead of a
tracker: it analyzes context, does not blindly punish, and adjusts strictness.

## Authority

This document IS the Coach's authority (gen-2 delta §5): there is no separate
Coach Consolidated Map in gen-2 — the v6-final cross-check does not exist and
is dropped. The Coach is governed by this document + the L-10 record (the
rule-based cross-domain insight engine — its one insight line lives inside the
weekly message, §The weekly Coach message, AND the Life Tree branch detail,
nowhere else) + the tree decisions:

- **D103 — trigger authority:** the achievement system wins over derived
  triggers — no feature invents a trigger where an achievement already encodes
  the condition; the no-double-fire rule (one visual, one source).
- **D110 — payload-blindness, why-panel, read-surface exclusion:** the tree
  NEVER reads `coach_outputs` (structurally enforced — see §Outputs &
  surfaces); the why-panel shows only event-log facts + register values, never
  free text from any stored system, never LLM narrative.
- **D111 — semantics surface:** the tree's pixels and semantics come from the
  same deterministic state model (one source, two outputs).
- **engine-2 (D127) — the rule-book session** (§Scheduling & rule-book
  session) locks the ~25 named rules committed by M2 + the concrete test plan;
  ONE rule-execution architecture; LLM = voice layer only (render-never-decide),
  OFF by default, offline = complete product.

The Life Tree branch detail hosts the L-10 insight line (payload-blind mirror
per D110; LifeTree.md §13/§16).

<!-- Authority re-point (INT-16/INT-13, docs-pass D151): gen-2 has NO Coach
Consolidated Map — the v6-final §cross-check is DROPPED (delta §5). The Coach's
authority is CoachSystem.md + the L-10 record (L069/D145) + the tree decisions
D103/D110/D111 + the engine-2 rule-book session (D127). Payload-blindness
(INT-13/D110(1)): coach_outputs rows are rendered text and are NEVER a tree
input; the LLM render-never-decide rule is reinforced. -->

## Philosophy

The Coach's posture is fixed before any rule is written: it speaks facts,
never shames, and adapts to context. Vision.md is the master reference for
this philosophy; the Coach only ever operationalizes it.

- **Facts-only speech** — the Coach quotes numbers and derived verdicts, never
  journal text, never guesses at intent.
- **No-shame language** — no "you failed", no punishment, no human-judgment
  voice. Plain reflection and one honest question is always enough.
- **Context-aware** — single misses, holidays, injuries, quiet weeks are all
  read as context before anything is said; the Coach quiets itself when the
  user's life demands it.
- **Always advisory** — the Coach never grants or withholds XP, never touches
  achievements, never auto-adjusts anything. It suggests; the user decides.
- **Auto-written, deletable** — every Coach line is a `coach_outputs` row the
  user can delete. Nothing is ever forced on the dashboard.
- **On-open delivery, never push** — the Coach speaks when the app opens; it
  never pushes to a closed app.

## Architecture

```
Coach System
├── Analytics Engine        pure aggregations over the event log
├── Rule Engine             condition → action rules, strictness-aware
├── Reflection Generator    templates filled with analytics + rule outputs
└── Optional AI Adapter     future; OFF by default, never required
```

The application must function completely without paid AI APIs. The rule-based
pipeline is the product; AI is a possible enhancement later (DeepSeek API, other
LLMs, local models — all optional).

Pace computation follows the same separation of concerns with no new subsystem:
the Analytics Engine computes, the Rule Engine decides, the Reflection
Generator phrases (L005). Every stat consumed by the Coach has exactly one H3
owner function in Architecture.md; the Coach consumes owner outputs and never
re-derives a stat with its own copy — a trophy and its Coach line are literally
the same number, and rounding happens once, in the owner (L168).

## Event-log discipline

The event log is the single behavior history. The Coach reads it; it never
touches storage directly.

- The Coach and Gamification both read the event log only — entities are
  written through repositories, engines never write.
- Budget: ~10k events/yr is the ceiling; event kinds are additive-versioned
  and revoke events stay transactional with the row change (L098).
- Coach-relevant event kinds: `workout.completed`, `habit.missed`,
  `habit.completed_revoked`, `nutrition.logged` / `.removed`, `body.weighed` /
  `_revoked`, `journal.edited` / `.deleted`, `achievement.unlocked`,
  `level.reached`, `habit.rest_planned` (L098, L139).
- `workout.pr` exists for the Coach, the toast, and realtime recognition ONLY —
  it is never the source of truth for vaults or achievements; those re-derive
  by walking sessions (L246). Its payload carries bodyweight and ratio at PR
  time for Coach/toast use only (L049).
- `writtenAt` (immutable device clock) is operational truth only — sync,
  dedupe, import handling. `occurredAt` (the time the user declares the thing
  happened) is what any Coach behavior reads (L153).
- Habits can be auto-tracked by sessions (`autoSource: "workout"`): the session
  save writes the day's habit check-in in the same transaction, manual entries
  win, and deletion cleans up with a compensating `habit.completed_revoked`.
  The Coach recognizes these via events like any other (L062).

## MVP Coach (Milestone 0)

The MVP Coach is intentionally minimal: it exists to validate the architecture,
the event log contract, and the dashboard integration — not to be a real coach.
Documented as:

> "MVP Coach contains a minimal rule engine implementation used to validate the
> Coach architecture. The system is intentionally designed to expand."

**Initial MVP rule:**

```
IF a habit is missed for 3 consecutive days
THEN generate a gentle reflection prompt (coach_outputs row + dashboard line)
```

- Trigger: evaluated daily (on dashboard load), scanning `habit.missed` events.
- Output: a short, non-judgmental line (e.g., "Three days without {habit} —
  what's in the way?") plus optional reflection prompt in the Journal.
- No XP, no punishment, no strictness modes yet. Those arrive with the full
  engine in M2.

**Recorded, never built:** a "next-week preview" inside the weekly check-in was
REJECTED by the user and stays a do-not-build item (L052, D069).

## Full Coach Design (M2+)

### 1. Analytics Engine

Pure functions over event windows (last 7/30/90 days, per-area):

- habit completion rates and trends (delta vs previous window)
- streak lengths, break context (was it a holiday? busy day? pattern?)
- goal velocity vs plan (M1+)
- journal cadence and content indicators (word count, tags, mood words)
- reasonable-failure signals: single misses vs patterns, context tags

Output: an aggregate snapshot the Rule Engine consumes. No I/O, fully
unit-testable.

### 2. Rule Engine

Rules are declarative: `condition → action`, parameterized by strictness.

| Mode | Thresholds | Tone |
|---|---|---|
| Supportive | lenient (e.g., warn at 5 misses) | gentle, curious |
| Balanced (default) | moderate (warn at 3) | direct but kind |
| Strict | tight (warn at 2, escalate fast) | firm, challenge |

The definitive named rules live as their own citable sections in
`## Named rules`. The mechanics stay here: rules fire on the analytics
snapshot, must respect strictness, and always phrase through the Reflection
Generator. A pace line, for example, never computes its own verdict — it cites
the owner's `paceVerdict` and quotes the number (L165) — and thin-data weeks
carry the "Adjusting" state instead of any verdict (L039).

The Coach never says "You failed." It asks why, checks context, and proposes an
adjustment.

### 3. Reflection Generator

Templates + interpolation fill every Coach slot from the analytics snapshot and
rule outputs. All output is stored as `coach_outputs` rows so history is
reviewable, exportable, and deletable. The outputs and surfaces are enumerated
in `## Outputs & surfaces`.

### 4. Optional AI Adapter

- Interface: `ReflectionGenerator` with two implementations — `RuleBased` and
  `LLMBacked`.
- `LLMBacked` is a thin translator: it receives the same aggregate snapshot the
  rule engine uses and renders reflections in the same slots.
- OFF by default; must never degrade the app when unavailable.
- When enabled (future), candidates: DeepSeek API (low cost, not free — needs
  explicit user opt-in), local models, or any LLM later. Budget rule: this must
  never become a requirement.

## Outputs & surfaces

All Coach output is derived through the analytics → rules → reflection
pipeline and stored as `coach_outputs` rows — every line auto-written and
deletable (L166). `coach_outputs` kinds: `daily_note`, `nudge`, `briefing`,
`check_in_weekly`, `nutrition_checkup`, `milestone_review_goal`,
`milestone_review_anniversary`, `phase_close`, `pattern_alert`.

`coach_outputs` rows are RENDERED TEXT — the Coach's output store and nothing
else. They are NEVER a Life Tree input: the tree mirrors H3 owners only and its
read surface never includes `coach_outputs` (payload-blindness, D110(1),
structurally enforced — LifeTree.md §13). The LLM is a voice layer only:
render-never-decide, OFF by default, offline = complete product (engine-2,
D127); the LLM may never make a decision the heuristics cannot explain.

### One weekly surface — the merged check-in

The M2 Coach weekly review is NOT a standalone surface. It merges INTO the
Sunday check-in as one surface (L099): the Coach weekly section (habits,
journaling, life notes) sits on top, the fitness/nutrition sections below.
Nothing is deleted — merge only, one pipeline, one scroll. The day is
configurable, Sunday default (L255). The dashboard's glance strip (R11) is
exactly that: a glance; the verdict lives here (L101).

### The weekly Coach message (F-24) — the 3–5-line template

The Coach weekly section is NOT one line per strictness — it is ONE
template-driven message, 3–5 lines (F-24; the gen-2 upgrade of the old
one-line rule; INT-17):

1. **Review** — the week's numbers: sessions, volume vs bands, PRs, sets held,
   the Form zone.
2. **Adjust** — the engine's decisions, rule-cited (show-your-work).
3. **Next-week goal** — one concrete target.

Template + interpolation — the Reflection Generator's flagship output. No LLM
(render-never-decide); same derived facts, same surface, same day; facts-only;
show-your-work; one notification/day; quiet week wins; no shame (F-24). The
surface copy renders in UIUX.md §Weekly Surfaces (docs-pass D149); this
section carries the template rules.

**What rides inside (and ONLY inside):**

- **F-30's three readouts** — LOAD (est-1RM trend across the big-5), STIMULUS
  (working-set volume vs the F-08 bands), BALANCE (F-29 ratios + muscle
  imbalance) — live ONLY inside this message: no fitness-area display, no
  dashboard surface (F-30). The F-28 carve-out: the sets-per-muscle-week chart
  IS the data visualization (interactive, in the fitness area) — F-30's "no
  fitness-area display" means no additional readout cards beyond that chart.
- **The L-10 insight line** (D145) — ONE line within this message, the same
  line the Life Tree branch detail surfaces; NOWHERE else. Rule-based
  cross-domain comparisons (pure-logic with/without, the next-day lag window),
  confidence tiers from sample size (never truth without the n), data
  thresholds (5+5/90-day rule — ≥5 days per group OR 90 days of history);
  correlation-not-causation wording verbatim ("correlates with", never "caused
  by"); mood-proxy is derived-only (journal presence, word counts, entry
  length — C-04 rejection referenced); the first comparison set = the big five
  (training ↔ journal presence/word count · training ↔ mood-proxy ·
  sleep-proxy ↔ next-day training · protein hit-rate ↔ next-day gym · weigh-in
  trend ↔ journal cadence). Stress-testing is a user directive: synthetic
  seeded histories become part of the engine's test suite (engine-2
  discipline).
- **N-13's estimate-framing lines, F-08's band verdict, F-14's
  rate-vs-target, F-19's Form zone, F-20's ramp alert, F-29's balance
  ratios** — each rule's detail locks at the rule-book session (§Scheduling &
  rule-book session); this message is their home.

<!-- Weekly-message template restructure (INT-17/F-24/F-30/L-10, docs-pass
D152): the one-line-per-strictness rule is REPLACED by the 3–5-line template
(review → adjust → next-week goal); F-30's readouts + the L-10 insight line
(D145) live ONLY inside it; the four "one Coach line per strictness" places
(check_in_weekly, nutrition_checkup, phase_close, milestone-review) amend to
this template. -->

### Weekly fitness check-in (`check_in_weekly`)

One derived summary on the configured day: rolling weight vs phase baseline,
pace status, adherence + pattern flags, volume snapshot and balance (the
sets-per-muscle-week chart renders here as the data visualization — F-28;
F-30's readouts live only inside the weekly message), PRs/records, goal pace,
plus the 3–5-line weekly Coach message (§The weekly Coach message). Read-only,
annotatable, zero new tables (L032).

### Nutrition check-up (`nutrition_checkup`)

A compact section of the merged weekly surface mirroring the fitness check-in:
kcal vs target %, protein hit-rate, weekly compliance, plus the 3–5-line
weekly Coach message (§The weekly Coach message) (L092).

**Adherence-neutral compliance math (N-03, docs-pass D191)** — the weekly
check-up's denominator rules make compliance a neutral fact, never a
punishment metric:

- Missed rows NEVER count as zero: unlogged days are typical intake or
  excluded; compliance = logged days' performance only.
- Missing days are EXCLUDED from the denominator when <5 logged days
  (thin-week rule); a typical-average is used only when the week is
  otherwise complete.
- No streak displays for nutrition — the check-up reports compliance, never
  a streak.

**Estimate-framing copy (N-13, docs-pass D194)** — every derived nutrition
number carries honest error framing; the explainer sheet and footnotes live
in UIUX.md, the check-up carries these lines (verbatim):

| Number | Framing |
|---|---|
| TDEE (formula) | "±10–15% typical error (±200–350 kcal for you) — refines as your weight data accumulates" |
| 7700 kcal/kg | "(Wishnofsky 1958); early weeks and water/glycogen swings can diverge 30–40%+; judge rates over 2+ week trends" |
| Exercise kcal | "±25–50% estimate; your target already assumes this training — the weekly trend is the only adjustment authority" |
| Implied TDEE (M3+) | "±100–150 kcal typical" |

- **Fat floor** — absolute grams with rationale: 0.6 g/kg = 45 g @ 75 kg,
  inside the 40–60 g/d sex-hormone band; carb-crowding warning included.
- **Protein phase values with WHY** — cut 2.0 / bulk 1.8 / maintain 1.6
  g/kg; very-lean users up to 2.4 g/kg; g/kg FFM = a future precision
  upgrade.
- **Per-meal pacing (N-14 tie)** — soft guidance: ≥0.25–0.4 g/kg per meal
  across 3–4 meals.

<!-- E-audit GAP-closing requeue: L043 (N-03) + L054 (N-13) drafted into the
check-up, docs-pass D191 + D194. The framing table is verbatim-critical; the
ledger's ASCII "+-" renders as "±" here (doc typography), numbers unchanged. -->

### Phase-close report (`phase_close`)

Closing a phase renders the full report: weight trend (+kg via rolling avg),
pace verdict vs target rate, sessions count (strength/cardio), adherence %,
volume totals + group volume, PRs (list with margins), achievements, goal
pace, plus the 3–5-line weekly Coach message (§The weekly Coach message). All
derived; a snapshot may land in `coach_outputs` like a weekly check-in (L065).
Phase-close also feeds the milestone-review phase blocks.

### Milestone-review card (`milestone_review_goal`)

The card appears ONLY at goal end — after a user-declared `goal.completed`
(won) or deadline expiry without completion (expired) — NEVER mid-run (L172).

- **WON**: the computed final value is always shown next to the target. The
  user declaration is only the trigger — the computed value is the fact; dates,
  a one-line derived reflection, all stats, no text quoting.
- **EXPIRED**: "window closed, here's where you started, here's what to carry
  forward" — zero blame language.

Auto-written `coach_outputs` row, deletable like any Coach line. Reviews give
NO XP.

### Milestone-review anniversary (`milestone_review_anniversary`)

The long-form "since you started" review — the counterpart of the weekly
check-in on the same surface model, NEVER a new screen (L264).

- **Anchor** (derived, not stored): the app-wide shared birth anchor (D102) —
  the account's FIRST IN-WINDOW EVENT per D100, frozen at first write, never
  recomputed, never shifted by deletion. The Coach anniversary, the milestone
  reviews, the tree, and the rings all read the same value (LifeTree.md §2.2);
  a gym-only user gets their milestone review on their tree's birthday. No
  in-window events at all → no milestone review (the anchor never exists).

<!-- REMOVES-existing note (D102, docs-pass): the "FIRST journal entry = day
one" anchor is SUPERSEDED by the app-wide shared birth anchor (D102). The
Coach's year stops shifting on deletion; user-visible change: the
milestone-review date may move for users whose first event was not a journal
entry. -->
- **Cadence**: default ladder off the anchor — +1 month · +3 months · +6
  months · +1 year · then yearly. Settings Group 2 (Coach) makes it editable:
  enable/disable individual milestones or a flat interval.
- **Smart catch-up**: an anniversary that passes while away generates the
  review the first time the app opens after the due date — one tap opens it;
  once only, no overdue nag.
- **Idempotency (S020)**: a milestone already generated for that date is never
  re-minted — no duplicate review on re-render or re-open.
- **Thin-data honesty (3.3)**: when the window's data is thin, the partial-
  window rule and thin-deviation honesty apply — same O3/3.3 shared rule
  (rolling averages use available days, always carry "Adjusting"); no
  verdict/projection from a single point.
- **Delivery**: a `coach_outputs` row through the same pipeline; renders as a
  SECTION of the merged Sunday check-in when due; dashboard card points to the
  check-in section; rides backup/export/sync like every `coach_outputs` row.
- **Window**: since the previous review (or day one); everything derived from
  existing H3 owners, zero new entity tables.
- **Content** (sections appear only where data exists — empty areas get one
  honest line, never a dead block): journaling cadence (the anchor story),
  habits, gym (adherence/volume/PRs), body, nutrition, goals.
- **Phase awareness**: for EACH phase open during the window, a phase block in
  the style of the phase-close report (type + date range, pace vs target,
  weight trend, adherence), or a closure summary when a phase ENDED inside the
  window. Phases are reported one-by-one, never blended; no phase open → no
  block renders.
- **Tone/rules**: advisory only, NO XP, the 3–5-line weekly Coach message
  template (§The weekly Coach message), honest labels (same "absolutely solid"
  math, same owners).

Privacy stamp: FACTS ONLY (L158) — cadence lines and stats only, never
journal text.

### Pattern alerts (`pattern_alert`)

Pattern alerts (e.g. rest-day pattern detection) land in the check-in and the
calendar week view (L067).

## Named rules

One named, citable rule per section. All rules are advisory only unless stated;
none grant or withhold XP. Rules marked **deferred** are not built.

### `stallRule(phase)`

One shared vocabulary (trophy, Coach line, phase report) (L148).

- **STALL** = 4 consecutive weekly deltas of the rolling window mean outside
  the phase's progress direction (bulk: < +0.1 kg/wk; cut: > −0.1 kg/wk).
- **RECOVERY** = the next 2 weekly deltas inside the phase pace band.
- "Broke the Plateau" fires ONCE when recovery confirms (check-and-fire); the
  same 6-week window never re-triggers.
- Deload weeks are exempt; a thin week (<5/7 logged days) is "no data", never
  a stall.
- The Coach never scolds during a stall — the trophy celebrates recovery only.

### Plan adherence

Per-slot adherence % derived from sessions vs plan slots (L028). Free-training
deviations are "done differently", not missed. A single reasonable miss is
context; a pattern ("skipped chest 3 of 4 weeks") is a warning. Deload-tagged
weeks are exempt. Analytics → rules → reflection; no schema change.

**Post-run expected-vs-actual (L-05, docs-pass D195):** after a routine/day
runs, the Coach reports per-step — expected vs actual minutes per slot
("gym 45 planned · 52 actual · +7") — feeding the plan-vs-actual toggle's
data source. This closes the plan-vs-actual loop (planned → ran → compared):
BOTH the per-step minute-delta report (the data) AND the per-slot summary
(done/skipped/different — the glance), landing in the day view + the
briefing's evening close (the wrap-up card pattern). Neutral tone (never
scores); done-differently semantics; no shame.

**Neutral deviation badges (L-08, docs-pass D195):** deviations
(rescheduled/skipped/done-differently) render as NEUTRAL badges — plain
factual counts with zero moral valence. The plan-vs-actual day view shows
them on affected slots; the evening close lists them silently. Badges are
ALWAYS-ON in the day view (facts are facts); the evening close SUMMARIZES
them — moved-count PER-SLOT ("moved 3x" on that slot), day-total only in the
close. Never scored; no color-coded guilt; done-differently semantics.

**Adapted sessions (F-23, docs-pass D196):** an adapted session (TIRED /
SHORT-ON-TIME) logs honestly with an "adapted" marker and auto-marks "done
differently" in adherence — never a miss, never scolded.

**Meal-slot substitutions (N-10, docs-pass D213):** a one-time substitution
fills a meal slot by ANY recipe/food as a one-time event. The substitution
lives on the receipt line (`nutrition_logs.substitutedForRecipeId?` — the
schema half is Database.md D136: copy-in preserved, no fork, no variant),
never on the recipe and never on the plan — tomorrow's plan is unchanged.
Adherence for a substituted meal is measured against the PLANNED macro range
of the slot it fills, not the substitute's own macros:

- **Adhered = inside the band.** A substituted meal counts as adhered —
  done-differently, never a miss — ONLY when the substitute lands within the
  intended planned macro range of the slot it fills (e.g., dinner
  600–750 kcal).
- **Outside the band logs honestly, does NOT count as adhered.** A substitute
  outside the range keeps its real macros on the receipt line and is reported
  as-is — a neutral deviation, never a miss, never a scold.
- **Gap-rebalance suggests toward the band.** After an outside-band substitute,
  the macro-gap bar's gap-rebalance (N-04, §Macro-gap bar rules) suggests
  adjustments toward the band — suggested, user confirms, never auto-applied.

Build order (S038): current-meal-only first (M3); cascade after (M3+ — a
deliberate EDIT-PLAN action with confirmation, never a silent side effect of a
substitution).

<!-- E-audit GAP-closing requeue (C2 cross-audit MISMATCH): L051 (N-10) — the
CoachSystem adherence half (macro-range rule) — drafted into Plan adherence,
docs-pass D213. The schema half is Database.md D136 (receipt-line substitution
field); the M3/M3+ build-order halves live in Roadmap/Database (S038). -->
<!-- E-audit GAP-closing requeue: L064 (L-05) + L067 (L-08) drafted, docs-pass
D195 (shared — plan-vs-actual adherence semantics); the S029/L030 CoachSystem
portion (adapted-session adherence) drafted, docs-pass D196. -->

### Volume balance

Seeded minimum-effective-sets-per-week baselines per muscle group (MRV-style,
settings-editable), with weekly under-floor and imbalance checks and
phase-adjusted floors (L029). Advisory only — never XP, never a penalty.
Settings keys + the F-05 `setType` column (working-set counting reads the
W/D/F labels; the setType schema change is F-05's — see Database.md schema
set). The weekly check-in's volume fact line renders F-28's sets-per-muscle-
week chart as its data visualization (interactive, in the fitness area);
F-30's readouts (LOAD/STIMULUS/BALANCE) live only inside the weekly message
(§The weekly Coach message).

<!-- REMOVES-existing note (F-08/F-05, docs-pass D154): "Settings keys only;
zero core schema change" is SUPERSEDED — F-05 adds the setType column
(Database schema set, D133–D140); the volume-balance claim amends to
"settings keys + the setType column (F-05)". -->
<!-- Display reconciliation (F-28/F-30, docs-pass D152): F-28's chart IS the
data visualization (interactive, in the fitness area); F-30's readouts live
ONLY inside the weekly message. -->

### Training-max (TM) adjustment (F-10)

The est-1RM/TM split is the Coach's progression vocabulary (L017): e1RM
(locked Epley) is the measurement; TM (Training Max) is the decision number
anchored at 85–90% of e1RM. The Epley formula set lives in Architecture's
est-1RM owner — the Coach carries the rule and cites the owner's number,
never re-derives it.

- **RTF mode (hypertrophy, DEFAULT):** beat target reps → TM +0.5%/rep;
  miss → TM −1%/rep.
- **RIR mode (strength blocks — only if optional post-session RIR logging is
  ever added):** 6+ RIR → +2%; <4 RIR → −5%; 4–6 → hold.
- **Overwarm single** = a TM recalibration event.
- **F sets feed the miss logic** (F-05): a failure set counts as the miss
  that adjusts TM down.
- The Coach line cites the rule (show-your-work); derived-only; history
  never rewritten; verifiable by hand.

<!-- E-audit GAP-closing requeue: L017 (F-10) drafted, docs-pass D190. -->

### PO suggestion freshness decay (F-11)

Inactivity lowers the suggested starting load (days-since-e1RM multiplier);
after a deload, PR resets to a reachable baseline with history preserved
(L018). This completes the locked N2 return ramp: the return ramp (§Post-
deload return ramp) rules the ramp back up; F-11 rules the starting
suggestion itself.

- **Decay correlates with the existing absence systems** (deload_markers,
  periods, planned-rest, quiet week J4): marked/planned absence decays
  differently (or not at all) vs true unplanned absence.
- **Decay steepness = settings knob** (~10–20% per week off defaults).
- **The Coach explains decay** — the suggestion says why when decay applies.
- **Sensitive numbers warn:** 3+ weeks off shows a warning + explanation
  before any suggested load.
- **History/vault/PRs NEVER change** — only suggested starting loads move;
  no punishment framing.

**Constant reconciliation (docs-pass D190):** the >4wk freshness tier governs
HINT DISPLAY (collapsed); F-11's decay governs the SUGGESTED STARTING LOAD —
three surfaces, no conflict.

<!-- E-audit GAP-closing requeue: L018 (F-11) drafted, docs-pass D190 (shared
with L017 — the fitness-progression theme). -->

### Rest-day pattern detection

Sustained rest-day training (≥3 rest days trained in the trailing 4 weeks, or
3 in a row) → pattern alert + suggest moving volume to a training day or a
deload. Occasional rest-day training stays silent/neutral (L067). Advisory
only, no XP; lands in the check-in + calendar week view; routes through
quiet-week/period-quiet preconditions — rest-day training inside a period or
vacation never fires.

### Injury / limitation (limited-not-lazy)

While a limitation is active (exercise or muscle group): progressive-overload
suggestions quiet, PR framing is softened, volume floors suspend (like deload),
swap suggestions come from the same muscle group, and adherence learns
limited-not-lazy (L056). Healed = instant restore; history is kept ("limited
3× this year"). No medical claims.

### Post-deload return ramp

Stale-activity return guidance: first-session suggestion ~90% of last time,
then 90% → 95% → 100% across 2–3 sessions (L057). PR framing is quiet during
the ramp; volume floors run at half strength the first return week; reuses the
staleness tiers. Applies to deload rebounds AND injury-healing exits. Constant
editable.

### Deload suggestion

The Coach can suggest a deload after sustained low adherence (L030). Deload
ranges are their own markers: days in range are adherence-quiet, volume-balance
exempt, strength chart shaded; PRs always stay real.

### Journal drought

No journal entries in 7 days → a gentle nudge (L275). Every drought poke
routes through the Coach rule pipeline so quiet weeks silence all of them.

### Pace / bulk lines

Bulk side: "gaining too fast = fat" caution. Cut side: slow-loss-is-muscle.
Thin-data "Adjusting" weeks get a calm water-jump line, not a projection
(L276, L039).

### Pace nudges (I4)

When a goal pace is off, the Coach turns the gap into concrete levers — never
"push harder in the gym":

- Gap = actual − target (kg per week, rolling 7–14d vs target).
- Kcal gap = gap × 7700 → DIET lever (−kcal/day) or ACTIVITY lever (+1 cardio
  session / MET kcal).
- Heavily behind → recalibration, not crash; ahead-in-cut → cautious, never
  aggressive.
- Advisory only: lands in the check-in + phase report; no XP; never auto-
  adjusts the phase (L050).

### Missed-habit warnings

Missed-habit warnings live in the Coach reflection, NEVER in the calendar tint
— the tint communicates activity volume only (L277).

### Quiet meal reminders

On-app-open catch-up nudge only, NEVER push (D018 — a "ping" cannot reach a
closed app). App opens → a known meal window passed unlogged → quietly offer a
batch catch-up; always in-app, non-naggy (L093, L126). Known meal windows are
the routine-bound meal slots; no routine → seeded defaults (breakfast/lunch/
dinner/snack) so it works day one.

### Macro-gap bar rules (N-04 / N-08 / N-14)

The macro-gap bar is the diary's Coach surface; the Coach's rules for it
(docs-pass D192):

- **Gap rebalance (N-04):** a skipped/swapped meal's macro gap reshapes the
  REMAINING meals' suggested composition — the bar is a steering wheel, not
  just a report card. Rebalance = SUGGESTED adjustments, the user confirms —
  NEVER auto-applied (report-never-auto-change, shared with the PO
  kill-switch and F-08).
- **Exercise kcal display-only (N-08, the NU9 rule):** exercise kcal (NU9
  band + cardio MET) renders in the bar as DISPLAY-ONLY and NEVER expands the
  day's targets — PAL already embeds exercise; wearables overestimate 27%+;
  eating-back silently stalls cuts / bloats bulks. SHOW the burn as a labeled
  fact; the weekly check-up mentions it as a fact line only, never an
  adjustment.
- **Per-meal protein pacing (N-14):** facts-only lines about protein
  DISTRIBUTION over the locked daily g/kg target, riding the bar's protein
  line as a pacing narrative over the existing number — zero new logging;
  once daily, evening, when the pattern is visible; never nagging;
  pace-neutral phrasing ("keeps the pace"), never "you're behind".

<!-- E-audit GAP-closing requeue: L044 (N-04) + L049 (N-08) + L055 (N-14)
drafted, docs-pass D192 (shared — the macro-gap bar theme). -->

### Density facts (N-12)

The density heuristic is RESTATED NEUTRALLY as facts-only Coach lines —
never colors, never good/bad framing, never Life-Score composites: "This
meal is 2.1 kcal/g — a dense option." This is the ONLY legitimate form
under the locked no-shame rule (docs-pass D193).

- Fires on SPECIFIC meals when the Coach has a factual density outlier —
  never a constant label.
- RELATIVE framing (dense/lighter vs the user's typical meals), not
  absolute cutoffs.
- Facts-only; derived + explainable (show-your-work); no shame.

<!-- E-audit GAP-closing requeue: L053 (N-12) drafted, docs-pass D193. -->

### Physique-photo nudge (F5)

Optional monthly nudge to add a D031 timeline photo — OFF by default, no
nagging (L070). The photo anchors to a journal entry tagged health+physique.

### Recovery readiness (N5) — CLOSED by F-19 (D121)

The N5 deferral is CLOSED: F-19 locks training-load Form (CTL/ATL/TSB — the
readiness signal from logged sessions only; display = bands primary + number
secondary + trend arrow, with the mandatory honesty label "Training Form (from
your logged training)" — sleep/life stress NOT measured; zero new logging;
derived-only; no wearable; one notification/day; quiet week wins; facts-only).
The full rule detail (windows, constants, the session-load unit + F-20's
"~8 units/week" guardrail) locks at the rule-book session (§Scheduling &
rule-book session); the load owner lives in Architecture.md. The deferred
line's old content (a morning 1–5 recovery log, PO/Coach branches, M2
correlation analysis, a deload trigger, a check-in line — L060) is superseded.
FUT-2 (sleep/rest-day/readiness hardware-style tracking) stays OUT of F-19 and
is carried forward as a separate non-duplication note (L271): whenever scoped,
it must not duplicate F-19.

<!-- REMOVES-existing note (F-19/D121, docs-pass): the "Deferred: recovery
readiness (N5)" line is CLOSED by F-19 (D121) — training-load Form is locked;
the deferred line's content is superseded; FUT-2 hardware-style readiness
tracking stays OUT of F-19 and is carried forward (L271). -->

## Achievement tie-in

The Coach reacts to gamification events — it NEVER creates trophies and NEVER
grants XP (L166).

- One direction only: the Coach consumes `achievement.unlocked` /
  `level.reached` as recognition material.
- **Loudness taxonomy**: ONLY Ring and Grove receive Coach appreciation — one
  sincere derived line from H3 owner results, never hype. All other tiers
  (Sprout / Root / Branch / Heartwood) are silent in-game toasts with NO
  Coach speech.
- One Coach line AT MOST per trophy fire; celebrations never repeat congrats
  (L137).
- Celebrations respect the quiet-week and facts-only privacy rules.
- Trophy lines ride the same auto-written + deletable `coach_outputs`
  machinery as everything else.
- Phase transitions get one line from the shared `phaseAdjacency` helper
  (L151) — the same helper the Turn achievement uses; no second adjacency
  computation.
- Ouroboros: the Coach's single line fires only when the run lands or ends —
  no interim commentary on a live run.

## Context switches

Times the Coach quiets itself (L278).

### Quiet week (J4)

The user marks a date range in Settings → Coach; during it the Coach pauses
nudges (habit-miss lines, journal-drought pokes, streak warnings) — the guilt
loop is muted (L214).

- ONLY the user starts a quiet week — never auto-detected.
- History stays TRUE: missed days still log.
- The streak stays REAL: quiet weeks do NOT shield streaks; breaks still
  register. The streak shield for exams/trips is the Grace setting (finite,
  configurable) — two shields would become one unlimited shield.
- Quiet weeks quiet GUILT only (nudges/Coach lines) — never facts.
- Affects nudge/Coach rules only, never body/gym metrics.

### Vacation / period

A period quiets adherence like a deload — "vacation, not laziness" (L263).
Rest-day training inside a period/vacation never fires pattern alerts (L067).

### Deload ranges

Days inside a deload range: adherence quiet, volume balance exempt, strength
chart shaded (L030).

### Planned rest

`habit.rest_planned` exists per habit one-tap rest flag — created ONLY by an
explicit user choice, never from silence (L139). A rest day FREEZES the streak
(neither resets nor advances — a neutral hole); rest never earns anything. The
Coach parses real-rest vs quiet-miss vs grace; rest is not Grace, not a quiet
week, not an infinite shield.

## Privacy & the never-list

### Data the Coach may use

- Event log (behavior history) — primary
- Analytics aggregates — primary
- Journal metadata (tags, word counts, area) — for context; content is only
  read if the user opts into text analysis (M2+)
- Settings (strictness, timezone) — presentation only
- Never: media blobs, passwords, or anything outside its documented inputs

Every Coach/journal-reading feature carries the privacy stamp (L158): either
**"facts only"** (entry dates, word count, tags, area — no text) or **"needs
text access → user opt-in first"**. Milestone review and all cadence lines are
FACTS ONLY. Anything that reads actual words stays gated behind the M2+
text-analysis opt-in. The stamp bears in Architecture.md as well and repeats
for every new feature (S025).

<!-- Privacy-stamp citation (L084/C-08, docs-pass re-cite): the per-feature
privacy-stamp rule lives in the paragraph above ("facts only" OR "needs text
access → user opt-in first") + the never-list below; external citations should
target THIS paragraph + the never-list (the ledger's older :437-441 range was
~4 lines off the current text). The mention-suggestion sub-item (D125) carries
this stamp — gated until the M2+ text opt-in exists, or matching is restricted
to tags/areas/dates only (decision at build). -->

### The never-list

- Facts-only by default — the Coach speaks stats, never quotes journal text.
- Every Coach/journal-reading feature gets a stamp in the docs pass — "facts
  only" OR "needs text access → user opt-in first".
- Mood/topics stay gated behind the M2+ text-analysis opt-in.
- The Coach never inspects media/video content.
- The Coach gets NO journal text.
- NEVER: XP (grants or judgments), punishment, "you failed" framing,
  human-judgment voice (facts + plain reflection only), push notifications,
  auto-detected quiet weeks, scolding during stalls, rewards for
  reading/opening, Coach lines in the Year Book export (J5 — pure artifact).

## Strictness

- Stored in `settings` (`coachStrictness`: supportive | balanced | strict).
- Default: balanced.
- Strictness scales rule thresholds and tone templates, not the rule set —
  the Coach always stays contextual, even in strict mode.

## Settings (Group 2 — Coach)

- **Strictness** — as above; never changes the rule set (L280).
- **Weekly review day** — default Sunday; the merged check-in day is
  configurable. Evaluation window = the 7 consecutive days ENDING on the
  configured review day — one single owner for the strip's weekly verdict and
  the Coach weekly aggregate alike (L255).
- **Coach notes in the calendar day view** — default on (L255).
- **Milestone-review cadence** — editable ladder (+1 month · +3 months ·
  +6 months · +1 year · yearly): enable/disable individual milestones or a
  flat interval (L264).
- **Quiet-week range** — user-started date range (L214).

**NOT offered as toggles** (L280): XP/achievement values (M2 open items),
formulas, `dayActivityScore` weights. These are settings, never toggles.

## Scheduling & rule-book session

- **Weekly cadence**: the merged check-in runs on the configured day (Sunday
  default); the Coach weekly aggregate consumes the same weekly-window owner
  as the verdict (L255).
- **Milestone-review cadence**: the anchor ladder with smart catch-up (L264).
- Coach flows never reference standalone plans — planner content is
  routine-bound slots (L114); no new scheduler content.
- **The rule-book session is the locking anchor for engine-2 (D127,
  APPROVE-as-record):** ~25 named rules commit by M2 (gen-1 locks + F-08/F-09/
  F-10/F-11/F-12/F-19/F-20/F-23/F-24; the rejected pair F-21/F-22 excluded);
  ONE rule-execution architecture (event → rule catalog, condition→action,
  strictness-parameterized) — never scattered conditionals; H3 single-owner
  vocabulary; graceful degradation; LLM = voice layer only (render-never-
  decide), OFF by default, offline = complete product; the concrete test plan
  (determinism/table-driven/boundary/fixture/provenance) locks HERE. No rule
  content is drafted at this pass (D127) — the named-rule sections above stay
  as they are until the session writes the catalog. L-10's insight engine is
  stress-tested with synthetic seeded histories (known patterns, tiny samples,
  lopsided groups, seasonal effects, missing data — the full
  threshold/confidence matrix) BEFORE any real insight ships; the fixtures
  become part of the engine's test suite (user directive, engine-2).
- **The complete Coach rule catalog is a DEDICATED deferred deep session**
  (L171): scheduled AFTER all features are planned and BEFORE the UI/UX
  ordering pass — Coach surfaces affect layout. Carry-over locks the session
  must honor: facts-only speech, the achievements loudness tiers, J4 quiet-week
  respect, no-shame language, reviews-give-no-XP, auto-written + deletable
  outputs, on-open delivery never push, no-human-judgment voice. The session
  also fixes the voice-rule wording.
- **M2 fitness/nutrition rule catalog** (adherence, volume balance,
  deload/period quiet, PO gating, phase messaging) is written as ONE list at
  M2 — pending, not built (L190).
- **Deferred rules** ride the ledger: N5 recovery readiness is CLOSED by F-19
  (D121) — the F-19 Form rule is locked; FUT-2 (hardware-style readiness
  tracking) stays out of F-19 and rides the ledger (L271) as a separate
  non-duplication note. Revisit inputs recorded at this session: C-12 prompt
  library, C-14 context-timed nudges, RL-10 no-fail journaling (D132 skipped /
  research leftovers — revisit triggers only, not drafted).

<!-- Rule-book session locking anchor (engine-2/D127, docs-pass D153): the M8
session is the locking anchor for engine-2's ~25-rule catalog + the concrete
test plan (determinism/table-driven/boundary/fixture/provenance).
APPROVE-as-record at this pass — no rule content is drafted (D127 Revisit). -->

## Validation Goals for the MVP Stub

- Event log → rule → output → dashboard render loop works end to end.
- Output is human-readable, gentle, and stored in `coach_outputs`.
- The engine is swappable (interface) so M2's full engine replaces the stub
  without touching the dashboard.