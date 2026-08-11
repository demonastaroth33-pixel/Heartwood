# PersonalOS — Requirements

Source of truth for what is being built and what is explicitly not being built.
All decisions here were collected through structured interviews (Phase 1 —
Product Discovery) and locked during architecture review (2026-08-01).

## Project Goals

1. A private, user-owned life management system ("PersonalOS").
2. A daily dashboard that opens the day with priorities and one-tap actions.
3. A life archive: journal entries with media, timestamps, edit/delete, timeline.
4. Habit and goal execution with meaningful gamification.
5. A Coach that analyzes patterns and speaks with context, not punishment.
6. Full data ownership: export, restore, human-readable formats, no lock-in.
7. Works on iPhone (PWA) and Windows browser with roughly equal experience.

## MVP Scope (first usable version)

| System | Included |
|---|---|
| Dashboard | Yes — habits check-off, journal quick-entry, coach line, storage meter |
| Journal | Yes — text, photos, long-form vlogs, tags, Life Areas, timeline, edit/delete |
| Habits | Yes — daily check-ins, simple streaks |
| Export/Restore | Yes — full JSON snapshot + media, file-based |
| Coach | Minimal stub: one rule (3 consecutive missed habit days → gentle prompt) |
| Gamification | No (M2) |
| Goals/Tasks | No (M1) |
| Google Drive | No (P2/P3) |
| Advanced Coach / AI | No (M2+) |
| Fitness, Study, Nutrition, Productivity suite | No (future systems) |

## Core Features (full roadmap)

- **Journal / Life Documentation:** multiple entries per day, accurate
  timestamps, photos, long-form vlogs, tags, Life Areas, chronological timeline,
  edit/delete/remake, long-term archive.
- **Habits:** daily recurring habits, one-tap check-off, streaks.
- **Goals:** milestone-based targets with deadlines (M1+).
- **Tasks:** simple tasks with due dates (M1+).
- **Coach:** analytics-driven reflection, rule engine, strictness modes,
  optional AI adapter (M2+).
- **Gamification:** XP, levels, streaks, achievements — meaningful progress only (M2).
- **Backup/Sync:** local export/restore (MVP), Drive JSON backup (P2), Drive media
  vault sync (P3).
- **Future systems:** fitness, study, nutrition, relationships, projects — all
  designed to plug into the event ecosystem without core redesign.

## Non-Goals

- Multi-user accounts, sharing, social features.
- Native iOS app (no Mac, no Apple developer pipeline; PWA only).
- Apple Health / HealthKit integration (impossible in a PWA; manual entry only).
- Paid subscriptions, paid APIs, paid AI dependencies.
- AI food scanner.
- Enterprise complexity: event bus, microservices, server infrastructure.

## User Workflows

### Morning
1. Open dashboard (installed PWA on iPhone, or browser on Windows).
2. See today's habits, journal quick-entry, coach line, storage status.
3. Check off habits through the day; log journal moments.

### Evening (optional)
4. Write a reflection or longer journal entry with photos/vlogs.
5. Review coach feedback on patterns.

### Weekly
6. Review trends, adjust habits/goals, check goal progress.

### Maintenance
7. Export backup periodically (and at milestones); restore on new device.
8. Watch storage meter; export when thresholds warn.

## Constraints

- Budget: $0. No paid subscriptions or paid APIs.
- Platform: Windows development only; Flutter Web / PWA targeting iPhone + Chrome/Edge.
- Developer: single, relatively inexperienced, heavily assisted by AI coding tools.
- Storage: 15GB free Google Drive ceiling (when cloud phase arrives).
- iOS PWA limits: no reliable background uploads; possible data eviction.

## Assumptions

- Single user; no account system needed (settings table only, no profile module).
- All data entry is manual (fitness, nutrition, etc.).
- Journal language: English (enables rule-based text analysis).
- Dashboard-first navigation.
- Best-effort sync: uploads happen while the app is open.
- Google Drive is the media vault (source of truth for media) once enabled;
  text/stat data remains local-first.
- Media (physique pics, vlogs) is the most sensitive data; privacy default is
  local + private Drive. Encryption-at-rest policy (DecisionLog D020): local
  storage relies on OS/device-level security; optional passphrase-encrypted
  Drive backups arrive at P3.
- Export must be restorable (full backup), not just readable.
