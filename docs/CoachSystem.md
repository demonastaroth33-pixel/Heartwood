# PersonalOS — Coach System

The Coach is the system that makes PersonalOS feel like a coach instead of a
tracker: it analyzes context, does not blindly punish, and adjusts strictness.

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

### One weekly surface — the merged check-in

The M2 Coach weekly review is NOT a standalone surface. It merges INTO the
Sunday check-in as one surface (L099): the Coach weekly section (habits,
journaling, life notes) sits on top, the fitness/nutrition sections below.
Nothing is deleted — merge only, one pipeline, one scroll. The day is
configurable, Sunday default (L255). The dashboard's glance strip (R11) is
exactly that: a glance; the verdict lives here (L101).

### Weekly fitness check-in (`check_in_weekly`)

One derived summary on the configured day: rolling weight vs phase baseline,
pace status, adherence + pattern flags, volume snapshot and balance,
PRs/records, goal pace, plus one Coach line per strictness. Read-only,
annotatable, zero new tables (L032).

### Nutrition check-up (`nutrition_checkup`)

A compact section of the merged weekly surface mirroring the fitness check-in:
kcal vs target %, protein hit-rate, weekly compliance, one Coach line per
strictness (L092).

### Phase-close report (`phase_close`)

Closing a phase renders the full report: weight trend (+kg via rolling avg),
pace verdict vs target rate, sessions count (strength/cardio), adherence %,
volume totals + group volume, PRs (list with margins), achievements, goal
pace, plus one Coach line. All derived; a snapshot may land in `coach_outputs`
like a weekly check-in (L065). Phase-close also feeds the milestone-review
phase blocks.

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

- **Anchor** (derived, not stored): the FIRST journal entry's date = "day one";
  if that entry is deleted the anchor falls back to the next-earliest. No
  journal entries at all → no milestone review.
- **Cadence**: default ladder off the anchor — +1 month · +3 months · +6
  months · +1 year · then yearly. Settings Group 2 (Coach) makes it editable:
  enable/disable individual milestones or a flat interval.
- **Smart catch-up**: an anniversary that passes while away generates the
  review the first time the app opens after the due date — one tap opens it;
  once only, no overdue nag.
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
- **Tone/rules**: advisory only, NO XP, coach-line-per-strictness, honest
  labels (same "absolutely solid" math, same owners).

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

### Volume balance

Seeded minimum-effective-sets-per-week baselines per muscle group (MRV-style,
settings-editable), with weekly under-floor and imbalance checks and
phase-adjusted floors (L029). Advisory only — never XP, never a penalty.
Settings keys only; zero core schema change.

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

### Missed-habit warnings

Missed-habit warnings live in the Coach reflection, NEVER in the calendar tint
— the tint communicates activity volume only (L277).

### Quiet meal reminders

On-app-open catch-up nudge only, NEVER push (D018 — a "ping" cannot reach a
closed app). App opens → a known meal window passed unlogged → quietly offer a
batch catch-up; always in-app, non-naggy (L093, L126). Known meal windows are
the routine-bound meal slots; no routine → seeded defaults (breakfast/lunch/
dinner/snack) so it works day one.

### Physique-photo nudge (F5)

Optional monthly nudge to add a D031 timeline photo — OFF by default, no
nagging (L070). The photo anchors to a journal entry tagged health+physique.

### Deferred: recovery readiness (N5)

Skipped for now; the deferred line keeps: a morning 1–5 recovery log + PO/
Coach branches + M2 correlation analysis + deload trigger + check-in line
(L060). Revisit anytime, together with rest/recovery tracking (FUT-2, L271) —
whenever scoped, this must not be duplicated.

## Achievement tie-in

The Coach reacts to gamification events — it NEVER creates trophies and NEVER
grants XP (L166).

- One direction only: the Coach consumes `achievement.unlocked` /
  `level.reached` as recognition material.
- **Loudness taxonomy**: ONLY Ring and Grove receive Coach appreciation — one
  sincere derived line from H3 owner results, never hype. All other tiers
  (Sprout / Root / Recognition / Heartwood) are silent in-game toasts with NO
  Coach speech.
- One Coach line AT MOST per trophy fire; celebrations never repeat congrats
  (L137).
- Celebrations respect the quiet-week and facts-only privacy rules.
- Trophy lines ride the same auto-written + deletable `coach_outputs`
  machinery as everything else.

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
- **Deferred rules** ride the ledger: N5 recovery readiness (L060) with
  FUT-2 (L271).

## Validation Goals for the MVP Stub

- Event log → rule → output → dashboard render loop works end to end.
- Output is human-readable, gentle, and stored in `coach_outputs`.
- The engine is swappable (interface) so M2's full engine replaces the stub
  without touching the dashboard.