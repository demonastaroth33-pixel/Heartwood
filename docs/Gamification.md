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
| Journal entry with content (word-count threshold, e.g. ≥20 words) | small | documentation is a core loop step |
| Media captured with an entry | small | life documentation |
| Weekly review completed | small | reflection step |

Not XP sources:

- Opening the app
- Browsing screens
- Empty/blank journal saves
- Restoring old streaks artificially

## Anti-Farming Rules

1. **Capped streak bonuses** — no endless escalation. A bonus can grow within a
   week, but weekly; there is no infinite multiplicative curve. Farming "one
   micro-habit" to pump XP is capped by per-habit XP ceilings.
2. **Content-gated journal XP** — XP only for entries with real content
   (word-count threshold + at least one meaningful field).
3. **No XP for logging retroactively in bulk** — events carry timestamps; only
   check-ins recorded on their actual day contribute to streak/XP bonuses.
4. **XP is a signal, not a score to farm** — levels exist for a sense of
   progression, but the Coach never uses XP to judge the user.

## Streaks

- Tracked per habit and per Life Area (area streak = any qualifying action that day).
- **Grace:** a small forgiveness allowance (configurable, default e.g. 1 grace
  day per week) — misses inside grace do not break streaks. This is not farming:
  it exists so reasonable failures (sick days, travel) don't distort history.
- Streak data derives from the event log, never stored independently as
  user-editable state.

## Levels & Achievements

- Level curve: defined at M2; must be simple (no asymptotic curves).
- Achievements: sparse, meaningful (e.g., "30-day consistent on a habit",
  "First goal completed", "100 documented days"). No achievement for tapping.

## Relationships with Other Systems

- **Coach:** consumes gamification events (`achievement.unlocked`,
  `level.reached`) as recognition material. Never the reverse.
- **Events:** gamification reads the event log ONLY. It never writes behavior
  events; it writes derived state (`xp_transactions`, `achievements`,
  `streaks` derived views).
- **Dashboard:** streak/XP status is a dashboard block, secondary to habits
  and journal.

## Open Items (decide at M2)

- Exact XP numbers per source, level thresholds, per-habit XP ceiling.
- Grace-day default value.
- Achievement list (first 10).
