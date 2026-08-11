# PersonalOS — Vision

## What PersonalOS Is

PersonalOS is a private, personal operating system for managing one life. It
combines life documentation (journal with media), habit and goal execution,
productivity, fitness, study, and self-reflection into a single system that
behaves like a personal coach.

It is a personal project, not a startup product. The user is the only customer
and the only stakeholder. Success is measured by whether the user actually uses
it for years and improves because of it.

## The Core Loop

Everything in PersonalOS exists to serve this loop:

```
Open Dashboard
    ↓
Understand priorities (what matters today)
    ↓
Execute (habits, tasks, goals)
    ↓
Record (journal entries, media, progress)
    ↓
Reflect (review, understand context)
    ↓
Coach feedback (support or push, with context)
    ↓
Improve tomorrow
```

**Rule:** a feature that does not support this loop does not belong in the MVP,
and must justify itself before entering a milestone.

## The Coach Philosophy

PersonalOS is not a punish-first tracker. The Coach:

- analyzes why something happened before judging it
- distinguishes reasonable failure from pattern failure
- decides whether to encourage or push harder based on context
- avoids blindly punishing missed streaks
- adjusts strictness (supportive / balanced / strict)

The MVP Coach is a minimal rule engine that validates this architecture. The
full Coach adds analytics, richer rules, generated reflections, and — optionally
— AI. The system must work completely without paid AI.

## Non-Negotiable Principles

See `README.md`. In short:

1. **Data ownership** — data belongs to the user, always exportable and restorable.
2. **Offline-first** — cloud is backup, never a dependency.
3. **Core loop priority** — features justify themselves against the loop.
4. **Cloud optionality** — cloud integration is phased and optional.
5. **AI optionality** — AI is an enhancement, never a requirement.

## What Success Looks Like

- The user opens PersonalOS daily without forcing it.
- Life documentation is captured consistently (text, photos, vlogs).
- Habits and goals are executed with improving consistency.
- The Coach correctly identifies patterns — including reasonable failures that
  should not be punished.
- The life archive survives device changes, browser purges, and the test of years.
- The data can be exported, read, and restored at any time.

## What PersonalOS Is Not

- Not a social app. No sharing, no leaderboards, no public profiles.
- Not a subscription. No paid tiers, no vendor lock-in.
- Not an enterprise system. Simple and maintainable beats complex and impressive.
- Not an AI-dependent product. AI may enhance it, never gate it.
