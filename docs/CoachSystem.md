# PersonalOS — Coach System

The Coach is the system that makes PersonalOS feel like a coach instead of a
tracker: it analyzes context, does not blindly punish, and adjusts strictness.

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

Example rules:

- `missed_habit_pattern`: 3+ misses of same habit in 7 days → pattern warning.
- `reasonable_failure`: miss preceded by high-activity day or tagged context
  (`#travel`, `#sick`) → supportive note, no penalty framing.
- `improvement_signal`: completion rate up 20% vs last window → recognition.
- `goal_slip`: goal behind schedule >20% → adjust-plan suggestion, not blame.
- `journal_drought`: no entries in 7 days → nudge to capture.

The Coach never says "You failed." It asks why, checks context, and proposes an
adjustment.

### 3. Reflection Generator

Templates + interpolation:

- daily dashboard note (1–3 sentences)
- nudge (triggered by rules)
- weekly review (summary of analytics, one insight, one suggestion)
- achievement/recognition lines (from Gamification events)

All output is stored as `coach_outputs` rows so history is reviewable and
exportable.

### 4. Optional AI Adapter

- Interface: `ReflectionGenerator` with two implementations — `RuleBased` and
  `LLMBacked`.
- `LLMBacked` is a thin translator: it receives the same aggregate snapshot the
  rule engine uses and renders reflections in the same slots.
- OFF by default; must never degrade the app when unavailable.
- When enabled (future), candidates: DeepSeek API (low cost, not free — needs
  explicit user opt-in), local models, or any LLM later. Budget rule: this must
  never become a requirement.

## Strictness

- Stored in `settings` (`coachStrictness`: supportive | balanced | strict).
- Default: balanced.
- Strictness scales rule thresholds and tone templates, not the rule set —
  the Coach always stays contextual, even in strict mode.

## Data the Coach May Use

- Event log (behavior history) — primary
- Analytics aggregates — primary
- Journal metadata (tags, word counts, area) — for context; content is only
  read if the user opts into text analysis (M2+)
- Settings (strictness, timezone) — presentation only
- Never: media blobs, passwords, or anything outside its documented inputs

## Validation Goals for the MVP Stub

- Event log → rule → output → dashboard render loop works end to end.
- Output is human-readable, gentle, and stored in `coach_outputs`.
- The engine is swappable (interface) so M2's full engine replaces the stub
  without touching the dashboard.
