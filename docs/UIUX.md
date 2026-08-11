# PersonalOS — UI / UX

Design rules for the interface. The experience must be roughly equal on iPhone
(installed PWA) and Windows desktop browser — responsive is first-class, not a
mobile afterthought.

## Navigation Shell

- **Mobile (iPhone PWA):** bottom navigation bar.
- **Desktop (Windows):** same items in a left rail.
- Tabs (MVP): Dashboard, Journal, Habits, Settings.
- Later: Goals, Coach, (future systems).

Rules:

- Dashboard is the default tab and the app opens to it.
- One-tap actions from the dashboard wherever the loop allows.
- No buried settings; storage meter and export are reachable in ≤2 taps.

## Dashboard (MVP)

Blocks, in priority order (all six were required by the user; this is the
vertical order):

1. **Today's habits** — one-tap check-off, today's status.
2. **Journal quick-entry** — capture button + indicator of today's entries.
3. **Coach daily note** — the stub rule output (gentle line, e.g., missed-habit
   prompt) or a neutral "day on track" placeholder.
4. **Goal progress** — placeholder/empty state in MVP (goals arrive M1).
5. **Today's tasks** — placeholder/empty state in MVP (tasks arrive M1).
6. **Streak/XP status** — placeholder in MVP (gamification arrives M2).

Plus, always visible: **storage meter** (used/available + warnings at 70%/90%).

Empty states must be honest and non-judgmental — no guilt UI.

## Journal

- Chronological timeline; multiple entries per day grouped under the date.
- Compose flow: text + photos + vlogs (MediaRecorder with compression
  constraints), tags, Life Area picker, timestamp defaults to now (editable).
- Edit/delete/remake supported; edits append events (see `Database.md`).
- Viewing: media plays inline; object URLs resolved via MediaRepository.

## Habits

- Today's list with one-tap check-off.
- Habit detail: simple streak, recent 7/30 days indicator (simple, no charts in
  MVP unless trivially cheap).
- Create/edit/archive habits; each habit has a name, optional Life Area,
  daily cadence (MVP: daily only).

## Typography & Visual Rules

- Dark-first theme preferred for a life archive; must remain readable in
  sunlight on phone. (Decide theme at build; keep it theme-able from day one.)
- Large touch targets (≥44px), thumb-reachable primary actions on mobile.
- No clutter: one primary action per screen.
- Fonts: system fonts (no paid font licenses, no heavy webfonts).

## PWA Requirements

- Installable: manifest + service worker; icons for iOS home screen.
- Standalone display mode; status bar handling on iOS.
- Offline: core loop must render and function with zero network
  (verified in M0 — see `StorageDecision.md`).
- Camera/file capture verified on device in M0.

## Empty & First-Run States

- First run: 3-step welcome (what PersonalOS is, create first 2–3 habits,
  make first journal entry) — then straight to dashboard.
- Empty states for every block explain what will appear there, in one line.
- No profile, no account, no signup — ever (see `Architecture.md`).

## Open Items (build-time)

- Exact palette/theme values; dark vs light default.
- Dashboard block sizes on small screens (scrolling vs compact sections).
- Bottom sheet vs full-screen composer on mobile.
