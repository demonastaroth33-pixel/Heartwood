# Scan Brief 03 — COACH SYSTEM as an input surface for the Life Tree engine

Source: `docs/CoachSystem.md` (497 lines, read in full).
Purpose: exhaustive inventory of everything the Coach produces or consumes that
could be an input to the Life Tree (mycorrhizal/coach-symbiosis adaptation).

Every item: name / what it is / data it produces / thresholds-rules-limits /
source line. NO summarization. Ambiguities are flagged `[AMBIG]`.

---

## A. Coach personality & delivery posture (fixed philosophy)

1. **Facts-only speech**
   - What: The Coach quotes numbers and derived verdicts only; never quotes
     journal text, never guesses at intent.
   - Data: numeric stats + derived verdicts.
   - Limit: no journal text, no intent guessing.
   - Source: CoachSystem.md:12-13.

2. **No-shame language**
   - What: No "you failed", no punishment, no human-judgment voice; plain
     reflection and one honest question.
   - Data: tone constraint on all output.
   - Source: CoachSystem.md:14-15.

3. **Context-aware posture**
   - What: single misses, holidays, injuries, quiet weeks are read as context
     before anything is said; the Coach quiets itself when the user's life
     demands it.
   - Data: context classification of misses/events.
   - Source: CoachSystem.md:16-18.

4. **Always advisory**
   - What: the Coach never grants/withholds XP, never touches achievements,
     never auto-adjusts anything. It suggests; the user decides.
   - Data: suggestion-only outputs.
   - Source: CoachSystem.md:19-20.

5. **Auto-written, deletable outputs**
   - What: every Coach line is a `coach_outputs` row the user can delete;
     nothing forced on the dashboard.
   - Data: per-line rows, deletable.
   - Source: CoachSystem.md:21-22.

6. **On-open delivery, never push**
   - What: the Coach speaks when the app opens; it never pushes to a closed
     app.
   - Data: delivery trigger = app open event.
   - Source: CoachSystem.md:23-24.
   - NOTE re "one-notification constraint" (prompt): this doc has NO explicit
     one-notification-per-day rule. Closest constraints: (a) never push
     (above); (b) "One Coach line AT MOST per trophy fire" (item 46);
     (c) on-open catch-up nudges only for meal windows (item 42). If a
     one-notification constraint exists elsewhere it is NOT in this doc
     `[AMBIG]`.

## B. Architecture components

7. **Analytics Engine**
   - What: pure aggregations over the event log.
   - Data: aggregate snapshot consumed by the Rule Engine. No I/O, fully
     unit-testable.
   - Source: CoachSystem.md:30, 109-110.

8. **Rule Engine**
   - What: condition → action rules, strictness-aware.
   - Data: rule firings/decisions on the analytics snapshot.
   - Source: CoachSystem.md:31, 112-130.

9. **Reflection Generator**
   - What: templates filled with analytics + rule outputs.
   - Data: all Coach text output.
   - Source: CoachSystem.md:32, 132-137.

10. **Optional AI Adapter (LLMBacked)**
    - What: future; OFF by default, never required. Interface
      `ReflectionGenerator` with two implementations — `RuleBased` and
      `LLMBacked`. `LLMBacked` is a thin translator: receives the SAME
      aggregate snapshot the rule engine uses, renders reflections in the same
      slots.
    - Data: identical snapshot + slot contract as rule-based path.
    - Limits: OFF by default; must never degrade the app when unavailable;
      budget rule: never a requirement.
    - Candidates (future): DeepSeek API (low cost, not free — needs EXPLICIT
      user opt-in), local models, any LLM.
    - Source: CoachSystem.md:33, 139-148.

11. **Owner-stat discipline (no re-derivation)**
    - What: every stat consumed by the Coach has exactly one H3 owner function
      in Architecture.md; the Coach consumes owner outputs, never re-derives
      with its own copy. A trophy and its Coach line are literally the same
      number; rounding happens once, in the owner.
    - Data: single-source-of-truth stats (e.g. `paceVerdict`).
    - Source: CoachSystem.md:40-45 (L005, L168).

## C. Event-log discipline (Coach's read surface)

12. **Event log = the single behavior history**
    - What: the Coach reads the event log only; it never touches storage
      directly. Coach and Gamification both read the event log only — entities
      are written through repositories, engines never write.
    - Limit: budget ~10k events/yr ceiling; event kinds additive-versioned;
      revoke events stay transactional with the row change.
    - Source: CoachSystem.md:47-54 (L098).

13. **Coach-relevant event kinds**
    - What: the event types the Coach consumes.
    - List: `workout.completed`, `habit.missed`, `habit.completed_revoked`,
      `nutrition.logged` / `.removed`, `body.weighed` / `_revoked`,
      `journal.edited` / `.deleted`, `achievement.unlocked`, `level.reached`,
      `habit.rest_planned`.
    - Source: CoachSystem.md:56-59 (L098, L139).

14. **`workout.pr` event**
    - What: exists for the Coach, the toast, and realtime recognition ONLY —
      never the source of truth for vaults or achievements (those re-derive by
      walking sessions).
    - Data: payload carries bodyweight and ratio at PR time for Coach/toast
      use only.
    - Source: CoachSystem.md:60-63 (L246, L049).

15. **`writtenAt` vs `occurredAt`**
    - What: `writtenAt` (immutable device clock) is operational truth only —
      sync, dedupe, import handling. `occurredAt` (time the user declares the
      thing happened) is what ANY Coach behavior reads.
    - Source: CoachSystem.md:64-66 (L153).

16. **Auto-tracked habits via sessions**
    - What: habits can be auto-tracked by sessions
      (`autoSource: "workout"`): session save writes the day's habit check-in
      in the same transaction; manual entries win; deletion cleans up with a
      compensating `habit.completed_revoked`. The Coach recognizes these via
      events like any other.
    - Source: CoachSystem.md:67-70 (L062).

## D. MVP Coach (M0)

17. **MVP Coach stub**
    - What: minimal rule engine implementation used to validate the Coach
      architecture; intentionally designed to expand.
    - Source: CoachSystem.md:72-79.

18. **Initial MVP rule**
    - What: `IF a habit is missed for 3 consecutive days THEN generate a
      gentle reflection prompt (coach_outputs row + dashboard line)`.
    - Trigger: evaluated daily (on dashboard load), scanning `habit.missed`
      events.
    - Output: a short, non-judgmental line (e.g. "Three days without
      {habit} — what's in the way?") plus optional reflection prompt in the
      Journal.
    - Limits: no XP, no punishment, no strictness modes yet (those arrive in
      M2).
    - Source: CoachSystem.md:81-92.

19. **Do-not-build: next-week preview**
    - What: a "next-week preview" inside the weekly check-in was REJECTED by
      the user and stays a do-not-build item.
    - Source: CoachSystem.md:94-95 (L052, D069).

## E. Full Coach Design (M2+) — Analytics Engine inputs/outputs

20. **Analytics event windows**
    - What: pure functions over event windows — last 7/30/90 days, per-area.
    - Source: CoachSystem.md:101.

21. **Habit completion rates and trends**
    - What: completion rate + trend (delta vs previous window).
    - Data: rate + trend delta.
    - Source: CoachSystem.md:103.

22. **Streak lengths and break context**
    - What: streak lengths; break context — was it a holiday? busy day?
      pattern?
    - Data: streak length, break classification.
    - Source: CoachSystem.md:104.

23. **Goal velocity vs plan**
    - What: goal velocity vs plan (M1+).
    - Data: velocity metric.
    - Source: CoachSystem.md:105.

24. **Journal cadence and content indicators**
    - What: journal cadence and content indicators — word count, tags, mood
      words.
    - Data: cadence, word count, tags, mood words.
    - Note: mood words gated behind M2+ text-analysis opt-in (see item 62).
    - Source: CoachSystem.md:106.

25. **Reasonable-failure signals**
    - What: single misses vs patterns, context tags.
    - Data: failure classification.
    - Source: CoachSystem.md:107.

26. **Aggregate snapshot output**
    - What: the Analytics Engine's output — an aggregate snapshot the Rule
      Engine consumes. No I/O, fully unit-testable.
    - Source: CoachSystem.md:109-110.

## F. Rule Engine — strictness mechanics

27. **Strictness modes (3)**
    - What: rules are declarative `condition → action`, parameterized by
      strictness.
    - Table:
      - Supportive: lenient thresholds (e.g., warn at 5 misses); tone gentle,
        curious.
      - Balanced (default): moderate (warn at 3); tone direct but kind.
      - Strict: tight (warn at 2, escalate fast); tone firm, challenge.
    - Source: CoachSystem.md:112-120.

28. **Rule firing mechanics**
    - What: rules fire on the analytics snapshot, must respect strictness,
      always phrase through the Reflection Generator.
    - Limit: a pace line never computes its own verdict — it cites the owner's
      `paceVerdict` and quotes the number.
    - Source: CoachSystem.md:122-127 (L165, L039).

29. **Thin-data "Adjusting" state**
    - What: thin-data weeks carry the "Adjusting" state instead of any
      verdict.
    - Source: CoachSystem.md:126-127 (L039).

30. **Rule engine tone rule**
    - What: the Coach never says "You failed." It asks why, checks context,
      and proposes an adjustment.
    - Source: CoachSystem.md:129-130.

## G. Outputs & surfaces — `coach_outputs` kinds

31. **`coach_outputs` row kinds (enumeration)**
    - What: all Coach output is derived through analytics → rules → reflection
      pipeline and stored as `coach_outputs` rows — every line auto-written
      and deletable.
    - Kinds: `daily_note`, `nudge`, `briefing`, `check_in_weekly`,
      `nutrition_checkup`, `milestone_review_goal`,
      `milestone_review_anniversary`, `phase_close`, `pattern_alert`.
    - Source: CoachSystem.md:150-156 (L166).

32. **Merged weekly surface (one weekly surface)**
    - What: the M2 Coach weekly review is NOT a standalone surface — it merges
      INTO the Sunday check-in as one surface. Coach weekly section (habits,
      journaling, life notes) sits on top; fitness/nutrition sections below.
      Nothing is deleted — merge only, one pipeline, one scroll.
    - Day: configurable, Sunday default.
    - Dashboard glance strip (R11) is exactly that: a glance; the verdict
      lives here.
    - Source: CoachSystem.md:158-165 (L099, L255, L101).

33. **Weekly fitness check-in (`check_in_weekly`)**
    - What: one derived summary on the configured day.
    - Data/fields: rolling weight vs phase baseline, pace status, adherence +
      pattern flags, volume snapshot and balance, PRs/records, goal pace, plus
      one Coach line per strictness.
    - Limits: read-only, annotatable, zero new tables.
    - Source: CoachSystem.md:167-172 (L032).

34. **Nutrition check-up (`nutrition_checkup`)**
    - What: a compact section of the merged weekly surface mirroring the
      fitness check-in.
    - Data/fields: kcal vs target %, protein hit-rate, weekly compliance, one
      Coach line per strictness.
    - Source: CoachSystem.md:174-178 (L092).

35. **Phase-close report (`phase_close`)**
    - What: closing a phase renders the full report.
    - Data/fields: weight trend (+kg via rolling avg), pace verdict vs target
      rate, sessions count (strength/cardio), adherence %, volume totals +
      group volume, PRs (list with margins), achievements, goal pace, plus one
      Coach line.
    - Limits: all derived; a snapshot may land in `coach_outputs` like a
      weekly check-in. Phase-close also feeds the milestone-review phase
      blocks.
    - Source: CoachSystem.md:180-187 (L065).

36. **Milestone-review card (`milestone_review_goal`)**
    - What: appears ONLY at goal end — after a user-declared `goal.completed`
      (won) or deadline expiry without completion (expired) — NEVER mid-run.
    - WON: computed final value always shown next to the target; the user
      declaration is only the trigger; the computed value is the fact; dates,
      a one-line derived reflection, all stats, no text quoting.
    - EXPIRED: "window closed, here's where you started, here's what to carry
      forward" — zero blame language.
    - Limits: auto-written `coach_outputs` row, deletable; reviews give NO XP.
    - Source: CoachSystem.md:189-201 (L172).

37. **Milestone-review anniversary (`milestone_review_anniversary`)**
    - What: the long-form "since you started" review — counterpart of the
      weekly check-in on the same surface model, NEVER a new screen.
    - Anchor (derived, NOT stored): FIRST journal entry's date = "day one";
      if that entry is deleted, falls back to the next-earliest; no journal
      entries at all → no milestone review.
    - Cadence: default ladder off the anchor — +1 month · +3 months ·
      +6 months · +1 year · then yearly. Settings Group 2 (Coach) makes it
      editable: enable/disable individual milestones or a flat interval.
    - Smart catch-up: an anniversary that passes while away generates the
      review the first time the app opens after the due date — one tap opens
      it; once only, no overdue nag.
    - Idempotency (S020): a milestone already generated for that date is never
      re-minted — no duplicate review on re-render or re-open.
    - Thin-data honesty (3.3): partial-window rule and thin-deviation honesty
      apply — rolling averages use available days, always carry "Adjusting";
      no verdict/projection from a single point.
    - Delivery: a `coach_outputs` row through the same pipeline; renders as a
      SECTION of the merged Sunday check-in when due; dashboard card points to
      the check-in section; rides backup/export/sync like every
      `coach_outputs` row.
    - Window: since the previous review (or day one); everything derived from
      existing H3 owners, zero new entity tables.
    - Content sections (appear only where data exists — empty areas get one
      honest line, never a dead block): journaling cadence (the anchor story),
      habits, gym (adherence/volume/PRs), body, nutrition, goals.
    - Phase awareness: for EACH phase open during the window, a phase block in
      the style of the phase-close report (type + date range, pace vs target,
      weight trend, adherence), or a closure summary when a phase ENDED inside
      the window. Phases reported one-by-one, never blended; no phase open →
      no block renders.
    - Tone/rules: advisory only, NO XP, coach-line-per-strictness, honest
      labels (same "absolutely solid" math, same owners).
    - Privacy stamp: FACTS ONLY (L158) — cadence lines and stats only, never
      journal text.
    - Source: CoachSystem.md:203-240 (L264, S020, 3.3, L158).

38. **Pattern alerts (`pattern_alert`)**
    - What: pattern alerts (e.g. rest-day pattern detection) land in the
      check-in AND the calendar week view.
    - Source: CoachSystem.md:242-245 (L067).

## H. Named rules (advisory only unless stated; none grant/withhold XP)

39. **`stallRule(phase)`**
    - What: one shared vocabulary (trophy, Coach line, phase report).
    - STALL = 4 consecutive weekly deltas of the rolling window mean outside
      the phase's progress direction (bulk: < +0.1 kg/wk; cut: > −0.1 kg/wk).
    - RECOVERY = the next 2 weekly deltas inside the phase pace band.
    - "Broke the Plateau" fires ONCE when recovery confirms (check-and-fire);
      the same 6-week window never re-triggers.
    - Deload weeks are exempt; a thin week (<5/7 logged days) is "no data",
      never a stall.
    - The Coach never scolds during a stall — the trophy celebrates recovery
      only.
    - Source: CoachSystem.md:252-263 (L148).

40. **Plan adherence rule**
    - What: per-slot adherence % derived from sessions vs plan slots.
    - Free-training deviations are "done differently", not missed.
    - A single reasonable miss is context; a pattern ("skipped chest 3 of 4
      weeks") is a warning.
    - Deload-tagged weeks are exempt.
    - Analytics → rules → reflection; no schema change.
    - Source: CoachSystem.md:265-270 (L028).

41. **Volume balance rule**
    - What: seeded minimum-effective-sets-per-week baselines per muscle group
      (MRV-style, settings-editable), with weekly under-floor and imbalance
      checks and phase-adjusted floors.
    - Limits: advisory only — never XP, never a penalty; settings keys only;
      zero core schema change.
    - Source: CoachSystem.md:272-277 (L029).

42. **Rest-day pattern detection**
    - What: sustained rest-day training (≥3 rest days trained in the trailing
      4 weeks, OR 3 in a row) → pattern alert + suggest moving volume to a
      training day or a deload. Occasional rest-day training stays
      silent/neutral.
    - Limits: advisory only, no XP; lands in the check-in + calendar week
      view; routes through quiet-week/period-quiet preconditions — rest-day
      training inside a period or vacation never fires.
    - Source: CoachSystem.md:279-286 (L067).

43. **Injury / limitation (limited-not-lazy)**
    - What: while a limitation is active (exercise or muscle group):
      progressive-overload suggestions quiet, PR framing is softened, volume
      floors suspend (like deload), swap suggestions come from the same muscle
      group, and adherence learns limited-not-lazy.
    - Healed = instant restore; history is kept ("limited 3× this year").
    - Limit: no medical claims.
    - Source: CoachSystem.md:288-294 (L056).

44. **Post-deload return ramp**
    - What: stale-activity return guidance: first-session suggestion ~90% of
      last time, then 90% → 95% → 100% across 2–3 sessions.
    - PR framing is quiet during the ramp; volume floors run at half strength
      the first return week; reuses the staleness tiers.
    - Applies to deload rebounds AND injury-healing exits. Constant editable.
    - Source: CoachSystem.md:296-302 (L057).

45. **Deload suggestion**
    - What: the Coach can suggest a deload after sustained low adherence.
    - Deload ranges are their own markers: days in range are adherence-quiet,
      volume-balance exempt, strength chart shaded; PRs always stay real.
    - Source: CoachSystem.md:304-308 (L030).

46. **Journal drought**
    - What: no journal entries in 7 days → a gentle nudge.
    - Limit: every drought poke routes through the Coach rule pipeline so
      quiet weeks silence all of them.
    - Source: CoachSystem.md:310-313 (L275).

47. **Pace / bulk lines**
    - What: bulk side: "gaining too fast = fat" caution. Cut side:
      slow-loss-is-muscle. Thin-data "Adjusting" weeks get a calm water-jump
      line, not a projection.
    - Source: CoachSystem.md:315-319 (L276, L039).

48. **Pace nudges (I4)**
    - What: when a goal pace is off, the Coach turns the gap into concrete
      levers — never "push harder in the gym".
    - Gap = actual − target (kg per week, rolling 7–14d vs target).
    - Kcal gap = gap × 7700 → DIET lever (−kcal/day) or ACTIVITY lever (+1
      cardio session / MET kcal).
    - Heavily behind → recalibration, not crash; ahead-in-cut → cautious,
      never aggressive.
    - Limits: advisory only; lands in the check-in + phase report; no XP;
      never auto-adjusts the phase.
    - Source: CoachSystem.md:321-332 (L050).

49. **Missed-habit warnings**
    - What: missed-habit warnings live in the Coach reflection, NEVER in the
      calendar tint — the tint communicates activity volume only.
    - Source: CoachSystem.md:334-337 (L277).

50. **Quiet meal reminders**
    - What: on-app-open catch-up nudge only, NEVER push (D018 — a "ping"
      cannot reach a closed app). App opens → a known meal window passed
      unlogged → quietly offer a batch catch-up; always in-app, non-naggy.
    - Known meal windows are the routine-bound meal slots; no routine → seeded
      defaults (breakfast/lunch/dinner/snack) so it works day one.
    - Source: CoachSystem.md:339-345 (L093, L126, D018).

51. **Physique-photo nudge (F5)**
    - What: optional monthly nudge to add a D031 timeline photo — OFF by
      default, no nagging. The photo anchors to a journal entry tagged
      health+physique.
    - Source: CoachSystem.md:347-350 (L070).

52. **Deferred: recovery readiness (N5)**
    - What: skipped for now. The deferred line keeps: a morning 1–5 recovery
      log + PO/Coach branches + M2 correlation analysis + deload trigger +
      check-in line.
    - Revisit together with rest/recovery tracking (FUT-2); when scoped, must
      not be duplicated.
    - Source: CoachSystem.md:352-357 (L060, FUT-2, L271).

## I. Achievement tie-in (Coach consumes gamification)

53. **Coach reacts to gamification events**
    - What: one direction only — the Coach consumes `achievement.unlocked` /
      `level.reached` as recognition material. It NEVER creates trophies and
      NEVER grants XP.
    - Source: CoachSystem.md:359-365 (L166).

54. **Loudness taxonomy for Coach appreciation**
    - What: ONLY Ring and Grove receive Coach appreciation — one sincere
      derived line from H3 owner results, never hype. All other tiers (Sprout
      / Root / Recognition / Heartwood) are silent in-game toasts with NO
      Coach speech.
    - Source: CoachSystem.md:366-369.

55. **One line at most per trophy fire**
    - What: one Coach line AT MOST per trophy fire; celebrations never repeat
      congrats.
    - Limit: celebrations respect the quiet-week and facts-only privacy rules.
    - Source: CoachSystem.md:370-372 (L137).

56. **Trophy lines storage**
    - What: trophy lines ride the same auto-written + deletable
      `coach_outputs` machinery as everything else.
    - Source: CoachSystem.md:373-374.

57. **Phase-transition line (`phaseAdjacency`)**
    - What: phase transitions get one line from the shared `phaseAdjacency`
      helper — the same helper the Turn achievement uses; no second adjacency
      computation.
    - Source: CoachSystem.md:375-377 (L151).

58. **Ouroboros line timing**
    - What: the Coach's single line fires only when the run lands or ends —
      no interim commentary on a live run.
    - Source: CoachSystem.md:378-379.

## J. Context switches (times the Coach quiets itself)

59. **Quiet week (J4)**
    - What: the user marks a date range in Settings → Coach; during it the
      Coach pauses nudges (habit-miss lines, journal-drought pokes, streak
      warnings) — the guilt loop is muted.
    - ONLY the user starts a quiet week — never auto-detected.
    - History stays TRUE: missed days still log.
    - The streak stays REAL: quiet weeks do NOT shield streaks; breaks still
      register. The streak shield for exams/trips is the Grace setting
      (finite, configurable) — two shields would become one unlimited shield.
    - Quiet weeks quiet GUILT only (nudges/Coach lines) — never facts.
    - Affects nudge/Coach rules only, never body/gym metrics.
    - Source: CoachSystem.md:385-397 (L278, L214).

60. **Vacation / period**
    - What: a period quiets adherence like a deload — "vacation, not
      laziness". Rest-day training inside a period/vacation never fires
      pattern alerts.
    - Source: CoachSystem.md:399-402 (L263, L067).

61. **Deload ranges (context switch)**
    - What: days inside a deload range: adherence quiet, volume balance
      exempt, strength chart shaded.
    - Source: CoachSystem.md:404-407 (L030).

62. **Planned rest (`habit.rest_planned`)**
    - What: per-habit one-tap rest flag — created ONLY by an explicit user
      choice, never from silence.
    - A rest day FREEZES the streak (neither resets nor advances — a neutral
      hole); rest never earns anything.
    - The Coach parses real-rest vs quiet-miss vs grace; rest is not Grace,
      not a quiet week, not an infinite shield.
    - Source: CoachSystem.md:409-415 (L139).

## K. Privacy & data access

63. **Data the Coach may use**
    - Event log (behavior history) — primary.
    - Analytics aggregates — primary.
    - Journal metadata (tags, word counts, area) — for context; content is
      only read if the user opts into text analysis (M2+).
    - Settings (strictness, timezone) — presentation only.
    - NEVER: media blobs, passwords, or anything outside its documented
      inputs.
    - Source: CoachSystem.md:419-426.

64. **Privacy stamp (L158)**
    - What: every Coach/journal-reading feature carries the stamp: either
      "facts only" (entry dates, word count, tags, area — no text) or "needs
      text access → user opt-in first".
    - Milestone review and all cadence lines are FACTS ONLY. Anything that
      reads actual words stays gated behind the M2+ text-analysis opt-in.
    - The stamp bears in Architecture.md as well and repeats for every new
      feature (S025).
    - Source: CoachSystem.md:428-433 (L158, S025).

65. **The never-list**
    - Facts-only by default — the Coach speaks stats, never quotes journal
      text.
    - Every Coach/journal-reading feature gets a stamp in the docs pass.
    - Mood/topics stay gated behind the M2+ text-analysis opt-in.
    - The Coach never inspects media/video content.
    - The Coach gets NO journal text.
    - NEVER: XP (grants or judgments), punishment, "you failed" framing,
      human-judgment voice (facts + plain reflection only), push
      notifications, auto-detected quiet weeks, scolding during stalls,
      rewards for reading/opening, Coach lines in the Year Book export (J5 —
      pure artifact).
    - Source: CoachSystem.md:435-446.

## L. Strictness storage

66. **`coachStrictness` setting**
    - What: stored in `settings` (`coachStrictness`: supportive | balanced |
      strict). Default: balanced.
    - Strictness scales rule thresholds and tone templates, NOT the rule set —
      the Coach always stays contextual, even in strict mode.
    - Source: CoachSystem.md:448-453 (L280).

## M. Settings (Group 2 — Coach)

67. **Strictness setting** — as above; never changes the rule set.
    - Source: CoachSystem.md:457 (L280).

68. **Weekly review day setting**
    - What: default Sunday; the merged check-in day is configurable.
      Evaluation window = the 7 consecutive days ENDING on the configured
      review day — one single owner for the strip's weekly verdict and the
      Coach weekly aggregate alike.
    - Source: CoachSystem.md:458-461 (L255).

69. **Coach notes in the calendar day view**
    - What: default on.
    - Source: CoachSystem.md:462 (L255).

70. **Milestone-review cadence setting**
    - What: editable ladder (+1 month · +3 months · +6 months · +1 year ·
      yearly): enable/disable individual milestones or a flat interval.
    - Source: CoachSystem.md:463-465 (L264).

71. **Quiet-week range setting**
    - What: user-started date range.
    - Source: CoachSystem.md:466 (L214).

72. **NOT offered as toggles**
    - What: XP/achievement values (M2 open items), formulas,
      `dayActivityScore` weights — these are settings, never toggles.
    - Source: CoachSystem.md:468-469 (L280).

## N. Scheduling

73. **Weekly cadence**
    - What: the merged check-in runs on the configured day (Sunday default);
      the Coach weekly aggregate consumes the same weekly-window owner as the
      verdict.
    - Source: CoachSystem.md:473-474 (L255).

74. **Milestone-review cadence**
    - What: the anchor ladder with smart catch-up.
    - Source: CoachSystem.md:476 (L264).

75. **No standalone-plan reference**
    - What: Coach flows never reference standalone plans — planner content is
      routine-bound slots; no new scheduler content.
    - Source: CoachSystem.md:477-478 (L114).

76. **Dedicated deferred deep session (rule catalog)**
    - What: the complete Coach rule catalog is a DEDICATED deferred deep
      session, scheduled AFTER all features are planned and BEFORE the UI/UX
      ordering pass — Coach surfaces affect layout.
    - Carry-over locks the session must honor: facts-only speech, the
      achievements loudness tiers, J4 quiet-week respect, no-shame language,
      reviews-give-no-XP, auto-written + deletable outputs, on-open delivery
      never push, no-human-judgment voice. The session also fixes the
      voice-rule wording.
    - Source: CoachSystem.md:479-485 (L171).

77. **M2 fitness/nutrition rule catalog (pending)**
    - What: adherence, volume balance, deload/period quiet, PO gating, phase
      messaging — written as ONE list at M2 — pending, not built.
    - Source: CoachSystem.md:486-488 (L190).

78. **Deferred rules ledger**
    - What: N5 recovery readiness rides the ledger with FUT-2.
    - Source: CoachSystem.md:489-490 (L060, L271).

## O. User actions toward the Coach (interaction inputs)

79. **Delete a Coach line**
    - What: user can delete any `coach_outputs` row (nothing forced).
    - Source: CoachSystem.md:21-22, 200, 374.

80. **Start a quiet week**
    - What: user marks a date range in Settings → Coach; ONLY the user starts
      a quiet week, never auto-detected.
    - Source: CoachSystem.md:387, 391.

81. **One-tap rest flag on a habit**
    - What: explicit user choice creates `habit.rest_planned` (never from
      silence).
    - Source: CoachSystem.md:411 (L139).

82. **Goal completion declaration**
    - What: user-declared `goal.completed` triggers the milestone-review card
      (trigger only — computed value is the fact).
    - Source: CoachSystem.md:191-192.

83. **Text-analysis opt-in (M2+)**
    - What: user opt-in required before any Coach feature reads actual journal
      words (mood words, content indicators).
    - Source: CoachSystem.md:423-424, 431-432.

84. **LLM opt-in (future)**
    - What: enabling the AI adapter (e.g. DeepSeek) needs explicit user
      opt-in; OFF by default.
    - Source: CoachSystem.md:146-147.

85. **Annotating the weekly check-in**
    - What: weekly fitness check-in is read-only but annotatable.
    - Source: CoachSystem.md:172.

86. **Smart catch-up tap**
    - What: an overdue anniversary review opens with one tap; once only, no
      overdue nag.
    - Source: CoachSystem.md:214-216.

87. **Absent interaction surfaces `[AMBIG]`**
    - What: NO rating of Coach lines, NO follow-up/reply mechanism, NO
      thumbs-up/down, NO "dismiss/stop this topic" control documented in this
      file. If those exist, they live in other docs. Also no explicit
      one-notification-per-day constraint (see item 6).

## P. Coach-generated metrics & summaries (output data — Life Tree input candidates)

88. **Aggregate snapshot** — the Analytics Engine's windowed aggregate (7/30/90
    days, per-area) consumed by the Rule Engine. CoachSystem.md:109-110.

89. **Habit completion rate + trend delta** — vs previous window.
    CoachSystem.md:103.

90. **Streak lengths + break context class** — holiday/busy/pattern.
    CoachSystem.md:104.

91. **Goal velocity vs plan** — M1+. CoachSystem.md:105.

92. **Journal cadence + content indicators** — word count, tags, mood words
    (mood gated). CoachSystem.md:106.

93. **Reasonable-failure signals** — single miss vs pattern, context tags.
    CoachSystem.md:107.

94. **Pace verdict** (`paceVerdict` owner stat) — cited, not re-derived.
    CoachSystem.md:125-126 (L165).

95. **Thin-data "Adjusting" state** — replaces verdicts on thin weeks.
    CoachSystem.md:126-127, 219-222.

96. **Stall/RECOVERY state machine** — 4-delta stall, 2-delta recovery,
    one-time "Broke the Plateau". CoachSystem.md:256-260.

97. **Per-slot adherence %** — sessions vs plan slots. CoachSystem.md:267.

98. **Volume under-floor / imbalance flags** — per muscle group, phase-adjusted
    floors. CoachSystem.md:274-275.

99. **Rest-day training pattern signal** — ≥3 rest days trained in trailing 4
    weeks or 3 in a row. CoachSystem.md:281-282.

100. **Injury/limitation active flag + history** — "limited 3× this year".
     CoachSystem.md:290-293.

101. **Staleness tiers + return-ramp percentages** — 90% → 95% → 100% over
     2–3 sessions. CoachSystem.md:298-301.

102. **Sustained low adherence → deload suggestion**. CoachSystem.md:306.

103. **Journal-drought state** — 7 days without entries. CoachSystem.md:311.

104. **Pace gap + kcal gap levers** — gap × 7700; diet/activity levers.
     CoachSystem.md:326-328.

105. **Meal-window missed flags** — routine-bound slots or seeded defaults
     (breakfast/lunch/dinner/snack). CoachSystem.md:342-345.

106. **Trophy-fire appreciation lines** — Ring/Grove only, one line max.
     CoachSystem.md:366-372.

107. **Phase-transition line via `phaseAdjacency`**. CoachSystem.md:375-377.

108. **Ouroboros run line** — on run land/end only. CoachSystem.md:378-379.

109. **Quiet-week active flag** — user-started date range; mutes nudge/Coach
     lines only. CoachSystem.md:385-397.

110. **Period/vacation active flag** — quiets adherence. CoachSystem.md:399-402.

111. **Deload-range day flags** — adherence-quiet, volume-exempt, chart-shaded.
     CoachSystem.md:404-407.

112. **Rest-vs-miss-vs-grace classification** — parsed by the Coach.
     CoachSystem.md:414-415.

## Q. Storage & schema notes

113. **`coach_outputs`** — the ONLY Coach storage entity named in this doc.
     Rows per line/kind; auto-written; user-deletable; reviewable;
     exportable; rides backup/export/sync. Kinds enumerated in item 31.
     Sources: CoachSystem.md:21-22, 85, 135-136, 150-156, 200, 223-225,
     373-374.

114. **`settings.coachStrictness`** — supportive | balanced | strict.
     CoachSystem.md:450.

115. **Settings Group 2 (Coach) keys** — strictness, weekly review day, coach
     notes in calendar day view, milestone-review cadence, quiet-week range.
     CoachSystem.md:455-466.

116. **Zero-new-table guarantees** — weekly fitness check-in: zero new tables
     (L032); milestone anniversary review: zero new entity tables
     (CoachSystem.md:227); volume balance: settings keys only, zero core
     schema change (L277); plan adherence: no schema change (L270).
     `[AMBIG]`: no explicit `coach_outputs` table schema (columns/fields) is
     given in this file — only kinds and behaviors.

## R. Cross-document references observed (L-number citations)

The doc cites other docs by line refs (Architecture.md / Roadmap.md etc.).
Observed: L005, L028, L029, L030, L032, L039, L049, L050, L052, L056, L057,
L060, L062, L065, L067, L070, L092, L093, L098, L099, L101, L114, L126, L137,
L139, L148, L151, L153, L158, L165, L166, L168, L171, L172, L190, L214, L246,
L255, L263, L264, L271, L275, L276, L277, L278, L280. Plus decision/rule refs:
D018, D069, S020, S025, I4, J4, N5, F5, J5, FUT-2, 3.3, R11, O3.

- **L-10 insight engine `[AMBIG]`**: there is NO explicit "L-10" or
  "insight engine" label in this document. The L-references above are
  cross-doc line citations. The closest thing to a rule-based insight engine
  is the Rule Engine (item 8) + Named rules (items 39-52). If "L-10" refers
  to a specific Architecture.md section (e.g. `L010` = "Last 10 days"?), it is
  not resolvable from this file alone.

## S. Validation goals (MVP stub acceptance criteria — relevant to scope)

117. Event log → rule → output → dashboard render loop works end to end.
118. Output is human-readable, gentle, and stored in `coach_outputs`.
119. The engine is swappable (interface) so M2's full engine replaces the stub
     without touching the dashboard.
     Sources: CoachSystem.md:492-497.

---

## Item count

117 numbered items above (A–S sections). Input surfaces for the Life Tree:
all Coach outputs (items 88-112) and Coach-consumed signals (items 12-29,
39-52, 53-58, 59-62, 79-87).

## Notable / surprising

1. **No one-notification constraint in this file** — the prompt's
   "one-notification constraint" maps to on-open-only delivery + one-line-max
   rules, but no single daily-notification cap is documented here.
2. **No schema for `coach_outputs`** — kinds and lifecycle are specified;
   fields are not.
3. **Coach gets NO journal text ever (even with opt-in)** — the M2+ opt-in
   only unlocks metadata-level content indicators (word count, tags, mood
   words), per the never-list (item 65).
4. **No user ratings/replies to Coach lines** — the only user actions are
   delete, quiet-week, rest-flag, goal-declaration, opt-ins, annotate, tap.
5. **Strictness scales thresholds/tone, never the rule set** — and some
   thresholds are only exemplified (warn at 5/3/2), not fully enumerated.
6. **Anniversary anchor is derived, not stored** — first-journal-entry date;
   deletion shifts the anchor; no entries → no review. A fragile, data-driven
   identity.
7. **Everything rides one merged surface** — no standalone Coach screens;
   surfaces affect layout ordering (dedicated deferred session).
8. **L-10 reference not present** — noted as ambiguity rather than assumed.