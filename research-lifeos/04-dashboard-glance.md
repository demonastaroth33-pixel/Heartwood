# 04 — Dashboard & Glance Design: Research Report

Research for **PersonalOS** (private single-user offline-first Flutter PWA life app: journal + habits + gym + nutrition + coach). Scope: the dashboard block stack (Today section = briefing + habit ticks + capture, calendar/heatmap strip, habits card, goals progress, strength snapshot, weekly review/Coach note, journal capture, storage meter), M2 blocking order, shimmer-first loading for derived blocks, one-tap actions, zero-XP "N days fully logged" marker, empty-state honesty. All findings below cite sources inline.

Research window: Aug 2026. Sources: official product docs/help centers, Apple/Google developer documentation, design/UX literature (Nielsen Norman Group, Smashing, Stephen-Few-school dashboard guides), peer-reviewed glanceability research, and current press/reviews.

---

# 1. Habitify (habit dashboard app)

## 1.1 Overview

Habitify (Unstatic Ltd, iOS/Android/Mac/Watch/web, ~2.5M users) is a structure-first habit tracker built around one loop: pick a habit, schedule it, check it off. Its home surface is the **"Journal"** — a chronological today list of every habit scheduled for today, grouped by time-of-day "Areas" (Morning/Afternoon/Evening or custom areas like Gym), with quick check-in swipes. Habitify explicitly sells the home screen as "a calendar… ordered chronologically, so you can see your day measured out in goals" (https://habitify.me/, https://www.techradar.com/computing/websites-apps/habitify, https://makeheadway.com/blog/habitify/).

## 1.2 The block stack (deep)

The mobile Journal view, top to bottom:

1. **Header bar** — journal name (editable, e.g. "My Daily Plan"/"Today's Focus"), a "Tip to Master" help collection, and a **sort button** (by reminder time or alphabetically) (https://intercom.help/habitify-app/en/articles/12520095-understanding-your-journal-view-ios-android-apps).
2. **Area bar** — a horizontal filter strip: All Habits (default) / Morning / Afternoon / Evening / custom areas. This is the block-order control: the day is pre-sliced by time-of-day so the list is never one overwhelming pile (https://intercom.help/habitify-app/en/articles/12520095-understanding-your-journal-view-ios-android-apps; https://www.techradar.com/computing/websites-apps/habitify).
3. **Auto-grouped habit list** — the core block. Habits are *automatically* sectioned by goal period and status:
   - Daily good habits (top, "primary focus for the day") → daily bad habits → This Week → This Month → This Year.
   - Interacted habits move to status sections at the bottom: **Completed / Skipped / Failed**.
   - Result: the list always shows *what's left to do* first; done items sink out of view without being deleted (https://intercom.help/habitify-app/en/articles/12520095-understanding-your-journal-view-ios-android-apps).
4. **Check-in affordances** — swipe left = complete, swipe right = options (note, skip/fail), press-and-hold for options; a tap on the habit opens Single Progress view. On the web/desktop the bright check-in button has a 3-dot menu for other statuses (https://www.habitify.me/onboarding-instruction/log-check-in, https://intercom.help/habitify-app/en/articles/6113651-habitify-web-desktop-app).

The **Progress screen is a separate tab, not part of the home stack** — "a dedicated dashboard… holistic picture… across all routines at once" (monthly consistency, productive time-of-day, life-area balance), split into Good Habits / Bad Habits tabs, with an all-habit table (daily score + sparkline, total, average, completion count, mini-heatmap) and an all-Area table (https://intercom.help/habitify-app/en/articles/14718310-progress-screen-introduction, https://intercom.help/habitify-app/en/articles/14885639-progress-screen-the-good-habits-report-on-website-desktop). **Key pattern: the daily surface is a list; the dashboard (charts) is deliberately one tap away.** Habitify's heatmap (full-year grid), streaks, success-rate, and daily-average live on that second surface.

**Block independence:** high — each area filter isolates a block; sections move on interaction (completed sinks); the Progress tab is fully independent of the Journal.

**Small screens:** the design is phone-first; desktop/web mirrors the Journal with a profile/areas column; the Area bar acts as the degradation mechanism (filter instead of scroll).

## 1.3 Today-surface patterns

- "Today" = every habit scheduled for today, ordered by area/time-of-day, **not by user priority** — the day is the unit.
- The auto-categorization (daily → weekly → monthly → yearly) is a *deferral* mechanism: weekly/monthly habits are present but ranked below daily ones, so the eye lands on what must happen today.
- Status sections (Completed/Skipped/Failed) are a **progress ledger** at the bottom: an honest record, not a reward.
- Omitted from the today surface: stats, streaks, charts, notes, mood — those are per-habit (Single Progress) or global (Progress tab). The today surface carries exactly one job: check in.

## 1.4 Glance-value design

- The Journal's glance unit is the **row**: icon + habit name + one button. One glance answers "what's left today?" (by scanning the un-completed sections at top) and "what have I done?" (the Completed group).
- Streak/consistency data is **not** on the today list — it's pushed to Single Progress and Progress views. Habitify's own copy cites research that "tracking your progress meaningfully improves your odds of sticking with a habit" — but it deliberately separates *tracking* from *checking* (https://makeheadway.com/blog/habitify/).
- Numbers appear only where they carry decisions: success rate, current streak, average (Progress view). The Journal uses status/color (complete/skip/fail) instead of numbers.

## 1.5 Empty & first-run states

- Onboarding is preset-driven (choose from preset habits, custom areas) so the Journal is never empty at first run; the app steers users to "start small — two-minute habits" (https://www.techradar.com/computing/websites-apps/habitify).
- The Today surface handles "nothing left" by showing all sections as Completed — no fanfare, no guilt copy; streaks are protected by Skip (a "day off" that doesn't break the streak), which is an explicit anti-judgment mechanism (https://www.habitify.me/onboarding-instruction/log-check-in).

## 1.6 Loading & perf

No notable skeleton usage documented in the mobile app; web/desktop is a thin client over synced data. The notable perf pattern is *reduced re-render scope*: the status sections mutate locally on check-in (optimistic, no full-list reload), keeping the loop sub-second.

## 1.7 GUI layout (assembled)

Journal screen: [Header: name + help + sort] / [Area chips: All · Morning · Afternoon · Evening · Gym…] / sections "Good Habits (Daily Goal)" → "Bad Habits (Daily Goal)" → "This Week" → "This Month" → "This Year" → "Completed / Skipped / Failed" (moved-here rows), each row = icon + name + state button; bottom tab bar with Journal / Progress / (Friends) / Settings. Progress tab: monthly calendar, full-year heatmap, current streak + success rate counters, daily-average chart vs target line (https://makeheadway.com/blog/habitify/).

## 1.8 Differentiators & steal-worthy for PersonalOS

- **Auto-sink sections (Completed/Skipped/Failed move down)** — the list is self-decluttering *without hiding history*. Directly reusable for PersonalOS's habit ticks block: checked ticks collapse below a fold/divider; nothing is deleted, nothing nags.
- **Skip ≠ Fail** — a protected "day off" status keeps streaks honest yet non-judgmental; matches PersonalOS's "no judgment" constraint better than binary check/fail.
- **Time-of-day area slicing** — pre-filters today's list by when things happen; a cheap block-level filter for the dashboard habit card.
- **Separate the journal surface from the stats dashboard** — Habitify proves the daily surface should carry *zero* analytics; PersonalOS's storage meter / weekly review blocks must not creep into the Today section.

---

# 2. Habitica (gamified habit dashboard)

## 2.1 Overview

Habitica (iOS/Android/web) turns tasks into an RPG: habits, dailies, and to-dos feed a pixel-art avatar with HP/XP/gold. The home screen is a **dashboard of avatar state + the day's task categories** — the app's "homepage features a dashboard displaying your avatar's health and experience points, along with your initial objectives" (https://geekculture.co/app-of-the-month-habitica-october-2024/, https://lifehacker.com/tech/habitica-productivity-app-review).

## 2.2 The block stack (deep)

1. **Avatar/party header** — avatar, HP/XP/mana, level, gold, gems; when in a party quest, a **boss health bar** appears ("a giant boss appeared on our dashboard with a long health bar we had to chip away at together") (https://www.androidpolice.com/gamifying-daily-habits/).
2. **Category tabs/segments — Habits | Dailies | To-Dos | Rewards** — the primary navigation of the home surface. Habits = flexible +/- counters (add for good, minus for bad, e.g. doomscrolling); Dailies = recurring with deadlines (missed dailies damage the avatar's HP); To-Dos = one-off; Rewards = the shop where gold is spent (https://www.androidpolice.com/gamifying-daily-habits/, https://geekculture.co/app-of-the-month-habitica-october-2024/).
3. **Task lists within each tab** — checkboxes with +/- counters, sorted by user; completing triggers XP/gold/loot drops (variable rewards: eggs, potions) (https://screensdesign.com/showcase/habitica-gamified-taskmanager).

**Why this order:** the avatar block is the glance anchor (state = motivation: HP loss punishes, level-ups celebrate); tasks below are the action surface. Gamification is the *wrapper*, not the content. A mixed-methods UX study (eye tracking + usability testing) of Habitica found onboarding confusion, "gamification motivates some users but overwhelms others," and that "participants completed tasks more efficiently when interface elements were visually clear and navigation required fewer decisions" — i.e., the avatar stack adds cognitive load that hurts the task surface (https://github.com/heyshantanugupta/understanding-user-adoption-in-gamified-productivity-apps).

**Block independence:** low-medium — dailies tick states feed HP/XP in the header block (a cross-block data dependency), which is why missed dailies punish *globally*. PersonalOS's "no XP for logging" constraint is a direct rejection of this coupling (block independence is cheaper and less coercive).

**Small screens:** category tabs + scroll per tab; the app has been criticized for "sheer number of shops and item types" overwhelming new users (https://screensdesign.com/showcase/habitica-gamified-taskmanager).

## 2.3 Today-surface patterns

- "Today" is assembled as: (a) state header (HP/XP/gold — your history in one glance), (b) the three task categories as parallel lists, (c) rewards as the sink. There is no "briefing"; the avatar *is* the brief ("my character lost health" = the day went badly).
- Omitted: any summary, any heatmap, any calendar on the home surface — those live on the web (https://habitica.com). The mobile home is deliberately shallow.

## 2.4 Glance-value design

- The HP bar and boss bar are **pure glance graphics**: status (green→red) with no number required; XP/level is the number counter.
- The +/- counters for Habits (good and bad) are glanceable *actions*, not metrics — a "glanceable behavioral feedback" case (see §15): abstract state + immediate action in one element.
- Trade-off documented in the literature: converting state into character loss "trades information complexity for efficiency" (Schmid 2026, https://doi.org/10.1177/13548565261442032) — the glance reads "good/bad day" but explains nothing.

## 2.5 Empty & first-run states

- Onboarding is a guided character creation (choose username, customize avatar, ~3 minutes), then tasks are added via prompts — "Justin" the mascot gives contextual tutorials as overlays when features are first encountered (contextual, not forced) (https://screensdesign.com/showcase/habitica-gamified-taskmanager, https://lifehacker.com/tech/habitica-productivity-app-review).
- Empty task lists are simply empty — the emptiness is offset by the always-populated avatar block.

## 2.6 Loading & perf

Nothing notable documented; the app is criticized for slow feature updates rather than slow UI (https://lifehacker.com/tech/habitica-productivity-app-review).

## 2.7 GUI layout (assembled)

Home: [avatar + HP/XP/gold + level bar (and party boss bar if in quest)] → [Habits tab: +/- rows] → [Dailies tab: checkbox rows with due status] → [To-Dos] → [Rewards/shop]. Bottom nav: Home / Quests / (market / guilds / party on web). Level-ups play a full-screen celebration (https://screensdesign.com/showcase/habitica-gamified-taskmanager).

## 2.8 Differentiators & steal-worthy for PersonalOS

- **One persistent state block at top of the stack** — the avatar/HP header is always-there context for the list below. PersonalOS's briefing card plays this role but should stay *non-gamified* (no XP), per the locked constraint.
- **Variable rewards + celebration moments** are proven engagement hooks (https://screensdesign.com/showcase/habitica-gamified-taskmanager) — PersonalOS's "N days fully logged" marker can be the celebration moment without a points economy.
- **Anti-pattern to avoid:** cross-block coupling (missed dailies → global HP loss) and overwhelming feature sprawl; the Habitica UX study's top recommendation was "reduce unnecessary visual clutter and emphasize primary actions" (https://github.com/heyshantanugupta/understanding-user-adoption-in-gamified-productivity-apps) — exactly PersonalOS's "one primary action per screen."

---

# 3. Streaks (radical-minimal habit app)

## 3.1 Overview

Streaks (iOS/Apple Watch, one-time $5.99, Apple Design Award) is "a habit-tracking app… displays up to 24 habits as visual circles that fill as tasks complete, with streaks counting consecutive days." Its home is a **circular grid of habit rings on black — nothing else**. "No navigation menus, no settings screens cluttering the main view — just habits and their streaks" (https://gummble.com/showcase/streaks-ios/, https://calmevo.com/streaks-app-review/, https://daringfireball.net/linked/2016/06/03/streaks).

## 3.2 The block stack (deep)

1. **Habit ring grid** (up to 24 habits, max 12 shown per screen) — each habit = icon in a colored circle that **fills as you complete it**; completed habits "glow," incomplete "wait patiently." Rings can carry a count goal (e.g., "3× this week").
2. **Streak counter** — each habit shows its consecutive-day number; the number is the only text in the main view.
3. **Widget/companion surfaces** — home screen + lock screen widgets (the Verge's favorite iOS 16 widget: "a meter that slowly fills up as I approach that number… a subtle reminder every single time I look at my phone"), Apple Watch app + complication (one tap on the complication → one tap on the task) (https://www.theverge.com/23347903/ios-16-review-iphone-apple, https://daringfireball.net/linked/2016/06/03/streaks, https://daringfireball.net/linked/2024/11/30/streaks-and-little-streaks).

**Why this order:** there is no order — the grid *is* the stack. The design philosophy: "reduce until only the essential remains" (https://gummble.com/showcase/streaks-ios/). The 24-habit cap is a deliberate constraint ("forces prioritization that unlimited apps cannot").

**Block independence:** complete — every ring is its own block; one habit's failure affects nothing else. This is the cleanest known implementation of the independence PersonalOS wants.

**Small screens:** grid degrades by scrolling to the next 12; the Apple Watch app is the *primary* small-screen surface (check off without unlocking the phone).

## 3.3 Today-surface patterns

- "Today" = the grid's current fill state. There is no list, no briefing, no capture (capture happens via HealthKit auto-completion or Siri Shortcuts voice — "Hey Siri, I took my vitamins").
- The assembly is **gestalt**: today's progress is the overall glow of the grid, not any single element.
- **Omitted:** stats, charts, notes, mood, planning. Streaks "does one thing and does it perfectly" — the absence is the product (https://calmevo.com/streaks-app-review/, https://chudo-minimalism.com/streaks-review-my-honest-thoughts-after-2-months-of-use/).

## 3.4 Glance-value design

- The single glance question: **"what's left today?"** — answered by which rings are un-filled. Secondary glance: streak numbers.
- Ring fill is a *progress* encoding (state), not a number; only streaks are numeric. This matches the "numbers vs progress vs status" question: status (filled/not) is the fastest encoding; the number (streak) is the loss-aversion hook (https://gummble.com/showcase/streaks-ios/).
- Ring completion animation + haptic = micro-reward (https://gummble.com/showcase/streaks-ios/). "It's a to-do list… what kills most of them is friction" — one tap to mark done (https://daringfireball.net/linked/2016/06/03/streaks).

## 3.5 Empty & first-run states

- First run: choose habits from curated lists; the grid populates immediately — emptiness is impossible by construction.
- No "0 streak" shame states; rings simply sit unfilled.

## 3.6 Loading & perf

- Local-first (no account, no cloud beyond iCloud sync); "lightweight and fast"; the widget updates from HealthKit without opening the app (https://calmevo.com/streaks-app-review/).

## 3.7 GUI layout (assembled)

Black screen, 4×3 grid of 44pt+ circular icons; top area shows current streak ("best" streak record); tap ring → fill animation + haptic; long-press → habit detail. Widgets: ring grid (medium) / single-habit meter (small, lock screen). Apple Watch: complication + app with same ring language (https://gummble.com/showcase/streaks-ios/, https://www.theverge.com/23347903/ios-16-review-iphone-apple).

## 3.8 Differentiators & steal-worthy for PersonalOS

- **Progress-as-fill (ring/gauge) beats progress-as-number** for the glance layer — a direct precedent for PersonalOS's habit ticks and "fully logged" marker: *state encoding, not counting*.
- **One-tap completion with delightful feedback** (fill animation + haptic) — the gold standard for PersonalOS's one-tap actions.
- **Auto-completion from sensed data** (HealthKit) removes logging friction entirely — PersonalOS's gym/nutrition blocks can pre-fill from stored data and ask for confirmation instead of blank input.
- **Constraint as feature (24 habits)** — supports PersonalOS's no-clutter constraint: cap what the dashboard shows rather than compressing more in.
- **Widgets as the glance layer, app as the action layer** — the dashboard should be able to go all the way down to a 1×1 ring; the same block must degrade from full block → compact strip → single marker.

---

# 4. Duolingo (habit-loop home screen, bonus)

## 4.1 Overview

Duolingo's home screen is the best-studied habit-loop dashboard in consumer software: a **guided path** (linear series of lesson nodes) with a persistent top bar of streak/XP/league state. Redesigned Nov 2022 explicitly "to give you a clear path to follow — so you can be confident that each step you take in Duolingo is truly the best step" (https://blog.duolingo.com/new-duolingo-home-screen-design/).

## 4.2 The block stack (deep)

1. **Top bar (state strip)** — streak count, XP/league, gems; the streak is the dominant glance element.
2. **The path (main block)** — lesson nodes as circles; your position is a glowing current node; practice sessions and stories are woven *into* the path (no separate tabs); unit headers label the upcoming concepts; a floating arrow button returns you to your spot after scrolling (https://blog.duolingo.com/new-duolingo-home-screen-design/).
3. **Bottom tab bar** — Learn / Quests (chest) / Practice Hub (Super) / profile. Quests (daily 3-quest set, Friends Quests, monthly challenges) are a *secondary* surface, not on the path (https://blog.duolingo.com/new-duolingo-home-screen-design/).
4. **The streak widget** — the team's design research is explicit: "the only relevant data point we could show learners was whether or not they had done a lesson that day, and the length of their current streak… We don't need to complicate this with a bunch of other stats or context." The widget's mascot escalates desperation as midnight approaches if the lesson isn't done (https://blog.duolingo.com/widget-feature/).

**Why this order:** state strip first (motivation context), path second (single next-action), quests third (optional goals). The 2022 redesign collapsed a multi-tab structure into one linear surface — the same consolidation Apple did with Fitness (see §5) — because scattered tabs defeated the daily loop.

**Block independence:** medium — path progress feeds the streak block; but daily quests are independent of the path.

## 4.3 Today-surface patterns

- "Today" = one question: *have I done today's lesson?* The path highlights exactly one actionable node; everything else (stories, practice, quests) is deferred into the path or tabs.
- The briefing analog is the state strip (streak at risk vs safe), rendered *visually* (mascot mood) rather than textually.
- Omitted from home: calendar, statistics, leaderboard detail — all pushed to profile/webs.

## 4.4 Glance-value design

- Streak = the single number that matters; everything else is encoded as position along the path (progress encoding).
- The "at risk" state is the highest-glance element: the widget literally changes appearance hour by hour (https://blog.duolingo.com/widget-feature/).

## 4.5 Empty & first-run states

- First-run onboarding picks a language then drops the user directly onto the path with one ready lesson — the path is never empty (https://blog.duolingo.com/new-duolingo-home-screen-design/).

## 4.6 Loading & perf

- The path renders from cached progress; lessons stream content; the widget is timeline-driven (offline-friendly) (https://blog.duolingo.com/widget-feature/). No documented skeletons on home; the path layout is stable, so content swap is cheap.

## 4.7 GUI layout (assembled)

[Streak · XP · league top bar] → [vertically scrolling path of nodes, current node glowing, unit headers] → [floating jump-to-current button] → bottom tabs [Learn · Quests · Practice Hub · Profile]. Post-lesson: celebratory confetti + streak milestone interstitial (https://blog.duolingo.com/new-duolingo-home-screen-design/).

## 4.8 Differentiators & steal-worthy for PersonalOS

- **"One relevant data point" discipline** — the widget team's finding ("we don't need to complicate this with a bunch of other stats") is the strongest published justification for PersonalOS's zero-XP "N days fully logged" marker: a single, streak-derived, non-gamified consistency signal.
- **Streak-at-risk visual escalation** — the consistency marker can carry gentle urgency (e.g., day count approaching a milestone) without XP or judgment.
- **Path = one next action** — the dashboard's Today section should visually answer "what's next" once, not enumerate options.

---

# 5. Apple Fitness (rings + Summary dashboard)

## 5.1 Overview

Fitness on iOS is the reference health dashboard: the **Summary tab** is "a dashboard view that could give a quick high-level look at the current state of your activity… The History, Trends, Workouts, and Awards tabs… all merged into this single dashboard with brief summaries for each of these sections" (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/). The Activity rings are the glance core.

## 5.2 The block stack (deep)

Summary tab, top to bottom:

1. **Activity rings block** — Move (red, calories), Exercise (green, minutes), Stand (blue, hourly stands). Always on black background, never decorative, never used as branding; "an overlapping ring means you exceeded your goal. Tap the Activity rings to see details" (https://developer.apple.com/design/human-interface-guidelines/activity-rings, https://support.apple.com/guide/iphone/see-your-activity-summary-iph4c34a8a95/ios).
2. **Workouts summary** — last 3 workouts; "Show More" → full list with monthly aggregates (count/time/calories) and type filter (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).
3. **Trends section** — rolling 90-day averages for 8 trends; shows all 8 even when empty (a documented flaw: "they still all show up on the Summary page… This doesn't make much sense, and I hope to see Apple filter unused trends out") (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).
4. **Awards section** — top 3 most relevant awards (e.g., "20 out of its 21 necessary requirements" on the monthly challenge — a near-miss teaser), Show More for the rest (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).
5. **Edit Summary** — user can add/edit/move/remove metric categories (https://support.apple.com/guide/iphone/see-your-activity-summary-iph4c34a8a95/ios).

**Why this order:** today (rings) → recent evidence (workouts) → trajectory (trends) → achievements (awards). This is the canonical **state → evidence → trend → reward** ordering, and the author's review explicitly notes "the Trends summary section should be above the Workouts summary, which makes me think that the sections should just be made user-sortable" — even Apple's ordering is debated (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).

**Block independence:** each section is a self-contained card with its own "Show More" → drill-down. **Interactions are progressive disclosure, not navigation** — "the same level of detail… is one tap away for any section."

**Small screens:** the Summary is phone-native; blocks stack vertically with Show-More collapsing each into full screens.

## 5.3 Today-surface patterns

- The rings are the entire "today" — three statuses, one glance. The rest of the page is *context around today* (recent workouts, long-term trends, awards).
- Hierarchy of today information: (1) goal progress (rings), (2) what I did (workouts), (3) am I improving (trends). Omitted: plans, tasks, advice.

## 5.4 Glance-value design

- The rings are the most researched glance graphic in consumer software: peer-reviewed analysis (Schmid 2026) documents that glanceable design "channels attention into minute interactions" and trades "informational complexity for efficiency," with three documented trade-offs: **low information resolution, reductionism, fragmented interaction** (https://doi.org/10.1177/13548565261442032).
- Numbers vs progress: rings show *progress-to-goal* (fill), with calories as the one number inside Move. Apple's own HIG codifies constraints (black background, margins, never crop, never decorate) — the ring is protected as a pure information object (https://developer.apple.com/design/human-interface-guidelines/activity-rings).
- HIG guidance: rings appear "when they're relevant to the purpose of your app" and on workout/summary screens — i.e., glance graphics belong on the surface whose *job* is the glance (https://developer.apple.com/design/human-interface-guidelines/activity-rings).

## 5.5 Empty & first-run states

- Rings initialize to zero with goals set in onboarding; trends show empty states that *should* be filtered but aren't (documented flaw) — evidence that even Apple ships honest-but-noisy empties (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).
- Without a Watch, iOS shows only the Move ring (approximation from phone sensors) — a graceful data-source degradation (https://developer.apple.com/design/human-interface-guidelines/activity-rings).

## 5.6 Loading & perf

- Summary is local-first (HealthKit); no skeleton documented; the "animated loading bar at the top" sync pattern is a Fitbit trait (§7). Apple's approach: rings render instantly from cached metrics; drill-downs load detail lazily.

## 5.7 GUI layout (assembled)

Fitness Summary: [Rings card (black circle, 3 rings, today's date, move calories number)] → [Workouts: 3 recent cards + Show More] → [Trends: 8 metric rows with arrows + Show More] → [Awards: 3 tiles + Show More] → [See All Categories at bottom]. Two tabs only: Summary / Sharing (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/).

## 5.8 Differentiators & steal-worthy for PersonalOS

- **The state → evidence → trend → reward block order** is the strongest precedent for PersonalOS's locked order (Today → calendar strip → habits → goals → strength → weekly review). Apple puts *today's* state first and defers *derived* analytics (trends) lower — exactly the "light blocks first, heavy derived blocks after shimmer" logic.
- **One glance graphic, protected by HIG rules** — PersonalOS should define its own "ring-equivalent" (e.g., the habit-tick meter / fully-logged marker) with strict visual invariants (never decorative, never cropped, fixed colors).
- **User-editable summary sections** (Edit Summary) — block reordering is the escape hatch Apple offers instead of custom layouts.
- **Anti-pattern:** empty derived blocks shown anyway (Trends) — PersonalOS's honest-empty constraint says *hide or explain* a block with no data, never show a hollow card.

---

# 6. Samsung Health (2026 redesign)

## 6.1 Overview

Samsung Health's June 2026 overhaul (One UI 9 era) rebuilt the home from a famously cluttered single scroll ("all thrown around in a haphazard manner… the amount of vertical scrolling needed was a key issue") into **a widget dashboard plus five silo tabs** (Activity, Sleep, Vitals, Mindfulness, Nutrition) with a top shortcut bar (https://www.slashgear.com/2205926/new-samsung-health-app-updates-have-users-split-love-hate-useful-or-not/, https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/).

## 6.2 The block stack (deep)

1. **Top shortcut bar** — Activity / Sleep / Vitals / Mindfulness / Nutrition + Dashboard (home). "These silos keep all relevant features and information in their respective sections, reducing the time spent hunting for each metric across the entire app" (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/).
2. **Dashboard widget grid** — reorderable and **resizable** widgets ("scooting health widgets around the dashboard, expanding and shrinking them… reminiscent of smartly designed weather apps"); includes daily wellness tips and an AI Energy Score up front (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/, https://www.androidheadlines.com/2026/06/samsung-health-app-ai-redesign-update-2026-galaxy-watch.html).
3. **Vitals tab** — baseline-derived nightly metrics presented like an **audio equalizer** so out-of-range bars are immediately visible (https://www.slashgear.com/2205926/new-samsung-health-app-updates-have-users-split-love-hate-useful-or-not/).

**Why this order:** shortcuts first (navigation), widgets second (personalized glance), tabs third (depth). The redesign's stated purpose: highlight key features, reduce hunting.

**Block independence:** widgets are independent by construction (each is its own card, size-scalable). **Documented flaw:** unsupported-feature widgets appear by default on devices that can't use them and "reappear" after removal — the reviewer concludes "for a health app, honesty about hardware limits matters almost as much as the data itself" (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/, https://journalarta.com/en/tech/samsung-health-redesign-2026-layout-navigation/).

**Small screens:** the dashboard is mobile-first; widgets collapse/stack.

## 6.3 Today-surface patterns

- Today = widget grid (Energy Score, sleep, steps, exercise, water…), reordered by the user. The AI Energy Score is a *single synthesized number* standing in for a briefing.
- Omitted from home: history, trends (pinch-to-zoom charts live inside tabs).

## 6.4 Glance-value design

- Widgets use big numbers + color; the redesign was criticized for color excess ("garish ombre background… tooth-achingly bright widget cards") — a caution: glance contrast ≠ saturation (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/).
- The Vitals equalizer is a pure-status encoding (bars out of range = immediate attention) (https://www.slashgear.com/2205926/new-samsung-health-app-updates-have-users-split-love-hate-useful-or-not/).

## 6.5 Empty & first-run states

- Unsupported/empty widgets are *shown anyway* (see flaw above) — the opposite of PersonalOS's honest-empty rule; the press explicitly recommends hiding or labeling them (https://journalarta.com/en/tech/samsung-health-redesign-2026-layout-navigation/).

## 6.6 Loading & perf

- No notable skeleton documentation; data is watch/phone-synced. The dashboard is lightweight (widgets render cached values).

## 6.7 GUI layout (assembled)

Home: [shortcut pill bar (5 silos + dashboard)] → [Energy Score + daily tip card] → [resizable widget grid: sleep, activity, steps, heart, water, body composition…] → bottom nav to tabs (Activity/Sleep/Vitals/Mindfulness/Nutrition/Discover). Discover hosts ads — pushed to the last tab (https://www.slashgear.com/2205926/new-samsung-health-app-updates-have-users-split-love-hate-useful-or-not/).

## 6.8 Differentiators & steal-worthy for PersonalOS

- **Shortcut bar as silo navigation** — the opposite of a dashboard: for PersonalOS, this validates *keeping the dashboard a dashboard* and moving depth into dedicated screens (goals/strength/weekly-review all have deeper screens behind dashboard blocks).
- **Resizable widgets** — proof that block sizes should be a layout token (compact/full) even if PersonalOS doesn't expose editing.
- **Anti-pattern (steal the lesson):** never render a block the user's data can't populate — hide or label it. Also: color restraint — bright ≠ glanceable.

---

# 7. Fitbit app (Today view, 2025-26 redesign)

## 7.1 Overview

Fitbit's app (Android/iOS) restructured into **four tabs — Today, Fitness, Sleep, Health** — with a Material 3 Expressive redesign (2025-26) and a Gemini-powered Coach. The Today tab is the glance surface: "The top portion is now more compact with the main circular metric at the left and three stats next to it" (https://9to5google.com/2025/08/20/fitbit-app-coach-redesign/, https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).

## 7.2 The block stack (deep)

1. **Today metric row** — big circular donut (cardio load progress toward *weekly* goal) + three focus stats (steps/active minutes) at right; "the top few metrics… have always been configurable" (https://lifehacker.com/health/fitbit-new-app-preview-impressions).
2. **AI Coach / insight blocks** — large AI-generated paragraphs; the reviewer's main complaint: "I was seeing massive paragraphs that took up a quarter of the display… unless you're hunting for this information, it's a ton to take in… my eyes just wanted to glaze over it" — recommendation: "condense the AI summaries in the main UI to a sentence or two" (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).
3. **Sleep/Fitness/Health tabs** — sleep score, exercise days chart (day-of-week icons colored in when workouts completed; workout-plan icons morph the shape), readiness, etc. (https://www.androidauthority.com/android-app-design-3631537/).
4. **Floating action button** — the Coach chat bubble, plus per-metric "ask coach" shortcuts; FAB collapses to a smaller state on scroll (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/, https://www.androidauthority.com/android-app-design-3631537/).

**Why this order:** today metrics (glance) → AI insight (interpretation) → tabs (depth). The redesign's explicit goal: "the UI as a whole shows a lot more information at a glance, rather than making you dig for it" — and the press verdict is that it over-corrected into "information overload" (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).

**Block independence:** metric row is independently configurable; Coach is an overlay (doesn't block content); sync is a top progress bar, not a blocking spinner.

**Small screens:** single-column stack; FAB minimizes on scroll (https://www.androidauthority.com/android-app-design-3631537/).

## 7.3 Today-surface patterns

- Today = focus metrics (goals in progress) + cardio-load donut (weekly progress, replacing the old daily metric — "a welcome change" because weekly goals "didn't correspond to reality" as daily measures) (https://lifehacker.com/health/fitbit-new-app-preview-impressions).
- The "Morning Brief" (watch app) is the briefing analog: sleep score, cardio load readiness, weather — "better emphasis on the sleep score, and a larger weather icon" (https://www.androidauthority.com/fitbit-app-pixel-watch-material-3-expressive-3587305/).

## 7.4 Glance-value design

- Donut = progress-to-goal (weekly); three stats = numbers with remaining emphasis (the steps tile "emphasizes the remaining steps instead of the achieved ones" — remaining > achieved for glance actionability) (https://www.androidauthority.com/fitbit-app-pixel-watch-material-3-expressive-3587305/).
- **Animation as glance feedback:** "a circle chart is smoothly spinning into place… simple shapes at the top… each filled with a tastefully chosen color… text size carefully selected to give hierarchy" — the redesign won praise for making glance *motion* feel alive (https://www.androidauthority.com/android-app-design-3631537/).
- The AI insight blocks fail glance: paragraphs are the wrong encoding for glance surfaces (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).

## 7.5 Empty & first-run states

- Sync-first: "The app quickly syncs the latest data from your smartwatch… shown by an animated loading bar at the top" — partial data renders while sync completes (https://www.androidauthority.com/android-app-design-3631537/).
- First-run onboarding is device-pairing driven; the Today tab fills as the device reports.

## 7.6 Loading & perf

- **Non-blocking sync** (top bar) + per-chart entrance animations = perceived speed without skeletons; "Fitbit feels snappy. There's no lag when switching between app screens, and most screens have micro animations" (https://www.androidauthority.com/android-app-design-3631537/).

## 7.7 GUI layout (assembled)

Today: [compact metric header: cardio donut + 3 stats] → [AI insight card(s)] → [activity/health summary rows] → FAB (coach) bottom-right, collapsing on scroll. Tabs: Today / Fitness / Sleep / Health. Pull-to-refresh with M3 animation (https://www.androidauthority.com/android-app-design-3631537/).

## 7.8 Differentiators & steal-worthy for PersonalOS

- **Weekly goal progress beats daily** for derived metrics — supports PersonalOS's weekly review/Coach block and the R11 recap strip: show week-shaped progress on the dashboard, not raw daily numbers.
- **Remaining > achieved** encoding for goal blocks (strength snapshot, goals progress): render "2 of 3 sessions left" not "1 done."
- **Coach as overlay, not a block** — Fitbit's mistake (AI paragraphs in the main flow) is the cautionary tale: PersonalOS's Coach note must be a *compact* block (1-2 sentences, expandable) — the press recommendation verbatim (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).
- **Non-blocking sync indicator** — for offline-first PersonalOS: storage/backup status as a thin strip, never a modal.

---

# 8. Things 3 (Today surface)

## 8.1 Overview

Things 3 (Cultured Code, Apple-only) is "the most beautifully designed task manager" — a GTD app whose **Today view is its daily command surface**, "ordered the way your brain actually wants to think about a day: scheduled items in order, followed by other items" (https://thesunrisedigest.com/focus/things-3-review-2026/, https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/).

## 8.2 The block stack (deep)

Today view: **scheduled (time-ordered) tasks → "This Evening" section → unscheduled/remaining** (manual pulls). The dual-date model ("When" vs "Deadline") drives it: tasks you scheduled for today sit at top in time order; tasks you pulled in manually follow; "Someday" holds pressure-free backlog that *never* clogs Today (https://blakecrosley.com/guides/design/things, https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/).

**Why this order:** intention first (when will I do it), deadline separate (must be done). The review's core insight: "Most apps conflate these… 'Someday' isn't a failure state — it's a pressure release valve" (https://blakecrosley.com/guides/design/things).

**Block independence:** complete — Today/Evening/Someday/Deadline are independent buckets; nothing auto-punishes.

**Small screens:** same list; Quick Entry (natural-language capture) works from anywhere; on macOS Slim Mode compresses rows.

## 8.3 Today-surface patterns

- Today = **intention-ordered list**, not due-date dump. "It shows only what matters today, separates scheduled tasks from tasks you have pulled in manually, and maintains a clean visual hierarchy that does not overwhelm" (https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/).
- **Omitted:** priorities/urgency flags on the Today surface (they're a deadline affordance), project context, notes. The Today view is deliberately "not overwhelming" — "Competing apps add information density in the name of features but lose the clarity" (https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/).

## 8.4 Glance-value design

- Color is semantic only: yellow = Today, red = Deadline/Overdue, indigo = Evening — "the interface is 95% neutral… when everything is colorful, nothing stands out" (https://blakecrosley.com/guides/design/things).
- Completion as reward: the check animation (fill → checkmark → "plink" + haptic, ~500ms) "delivers dopamine" — completion is the moment of delight (https://blakecrosley.com/guides/design/things).
- Glance question: "what's next today?" answered by the topmost unfinished scheduled row.

## 8.5 Empty & first-run states

- Empty Today is the *goal*: "Todoist Zero"-style — an empty Today view is a success state, not an empty state; nothing special is drawn (https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs describes the same philosophy for Todoist).

## 8.6 Loading & perf

- Local-first native; instant; no skeletons (nothing async).

## 8.7 GUI layout (assembled)

Today: [date header] → "Scheduled" section (time chips on rows) → "This Evening" (indigo text) → remaining pulled tasks → + FAB. Sidebar: Inbox / Today / Upcoming / Anytime / Someday / Logbook / Trash + Areas & Projects (https://blakecrosley.com/guides/design/things, https://thesunrisedigest.com/focus/things-3-review-2026/).

## 8.8 Differentiators & steal-worthy for PersonalOS

- **"When" vs "Deadline" separation** → PersonalOS's briefing card should distinguish *today's plan* from *due dates*; the dashboard shows the plan.
- **Semantic-only color** — the dark-first theme should reserve accent color for exactly one meaning per block (e.g., streak-at-risk, storage full).
- **Empty Today as success** — the "N days fully logged" marker is this idea made positive: emptiness is achievement, celebrated with a marker, not a message.
- **Someday/pressure-release** → the journal capture block: "capture now, process later" keeps the dashboard a place you *want* to open.

---

# 9. TickTick (Today smart list)

## 9.1 Overview

TickTick is a GTD-aligned all-in-one (tasks + calendar + habits + Pomodoro). Its **Today view is the daily command center**: "My day starts with the 'Today' view: tasks from all lists pulled into one screen alongside my habits and calendar. That is my command center" (https://muratesmer.com/blog/ticktick-review/). The Today *widget* (interactive checkboxes on the home screen) is a signature feature (https://tidbits.com/2025/08/14/ticktick-provides-a-focused-daily-task-list-and-more/).

## 9.2 The block stack (deep)

1. **Today list** — tasks + imported calendar events, sorted by time; user-draggable order ("the 'bula board' concept… scheduling specific times… on busy days I drag them into the sequence in which I want to complete them") (https://tidbits.com/2025/08/14/ticktick-provides-a-focused-daily-task-list-and-more/).
2. **Habits section** — habit checkmarks render *below* the task list in the Today view ("a section below the [tasks]… habits…") (https://tidbits.com/2025/08/14/ticktick-provides-a-focused-daily-task-list-and-more/).
3. **Smart lists** — Today / Tomorrow / Next 7 Days / Inbox / Assigned to Me, each with display options **Show / Hide / Show if not empty** (https://help.ticktick.com/articles/7055782283059396608).
4. **Suggested Tasks (💡)** — a derived block on Today: Recently Added / Postponed (sorted by reschedule count) / Long Overdue / Upcoming, with "+ Add to Today" one-tap promotion (https://help.ticktick.com/articles/7401564165023727616).
5. **Calendar + Pomodoro + Eisenhower** — separate views/tabs; calendar unifies tasks and events (https://muratesmer.com/blog/ticktick-review/, https://au.pcmag.com/productivity/94753/ticktick).

**Why this order:** time-ordered tasks first, habits below (supporting), suggested tasks as an on-demand derived block. Notable: TickTick treats **habits as a subordinate block inside the Today surface** — precedent for PersonalOS's habits card below the Today section.

**Block independence:** smart lists can be hidden (incl. "show if not empty" — the exact honest-empty pattern); habits independent of tasks.

**Small screens:** mobile is primary; desktop is 3-pane.

## 9.3 Today-surface patterns

- Today = tasks + events + habits, unified by time; the user reorders; the day is a *sequence* not a dump.
- Omitted from Today: project metadata, notes, Pomodoro state (all drill-downs).

## 9.4 Glance-value design

- The interactive widget is the glance layer: "The widget is live—tapping checkboxes marks tasks as done… I keep it front and center on my iPhone's Home Screen so I can't ignore it" (https://tidbits.com/2025/08/14/ticktick-provides-a-focused-daily-task-list-and-more/).
- Numbers: completion counts appear in list headers (e.g., "3/7 done" in the section header) — progress numbers attached to sections, not floating.

## 9.5 Empty & first-run states

- "Show if not empty" smart-list option = the cleanest honest-empty mechanism in productivity apps: a block that *disappears* when it has nothing to say (https://help.ticktick.com/articles/7055782283059396608).

## 9.6 Loading & perf

- Offline-capable with sync; daily briefing push notification ("a push notification with a briefing of all tasks due today or overdue… appears daily at a time you set") is the briefing pattern (https://au.pcmag.com/productivity/94753/ticktick).

## 9.7 GUI layout (assembled)

Today tab: [date + completion count] → time-ordered task rows (checkbox + time chip) → calendar events inline → Habits section (checkmark rows) → bottom bar (Today/Calendar/Inbox/…). Widget: medium interactive checklist.

## 9.8 Differentiators & steal-worthy for PersonalOS

- **"Show if not empty"** — the single most steal-worthy empty-state mechanism for the dashboard: blocks (weekly review, Coach note, storage meter warnings) should auto-hide until they have signal.
- **Habits nested under Today** — validates PersonalOS's habits card placement directly below the Today section.
- **Suggested Tasks as an explicit derived block** (computed from reschedule counts/overdueness) — precedent for the Coach note/weekly review: *derived* content, computed in place, one-tap actionable.
- **Briefing push** — the "N days fully logged" marker's sibling: a scheduled daily digest keeps the dashboard default-tab habit alive without a new surface.

---

# 10. Todoist (Today view)

## 10.1 Overview

Todoist's **Today view is the app's landing page** ("On launch, the user is greeted by the 'Today' page") — "every task scheduled for today across all your projects… a realistic plan… without feeling overwhelmed" (https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18, https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs). It is the reference for "dashboard = default tab."

## 10.2 The block stack (deep)

1. **Priority layer** — P1 tasks pinned at top in red: "What are the 3 most important tasks you need to complete today? Mark those as priority 1 so they'll show up at the top of your Today view in red" (https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs).
2. **Time-ordered / grouped task list** — sort by time or group by project; overdue tasks surface first (or in the Plan sidebar).
3. **Calendar layout (optional Display mode)** — drag tasks onto hours; "time blocking takes the guesswork out of when you have to work on a specific task" (https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs).
4. **Empty state (no tasks due)** — "a playful illustration" (https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18).

**Why this order:** P1 → scheduled → reschedulable. The official practice doc is explicit about *downsizing*: "Have too many scheduled for the day?… reschedule some tasks for later in the week… end every day at Todoist Zero. It's not cheating — it's about being flexible" (https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs).

**Block independence:** Today/Inbox/Next-7-Days are independent smart surfaces; drag-to-bottom = postpone-to-tomorrow gesture.

**Small screens:** list layout default; calendar layout for larger screens.

## 10.3 Today-surface patterns

- Today = dated tasks across projects + rescheduling affordances. "Only tasks with a date appear in Today" — **undated tasks are deliberately absent** (the capture-vs-plan split) (https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs).
- The + FAB on Today auto-dates new tasks "for today's date" — capture defaults to today (https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18).
- Omitted: goals, habits, stats, weather — the Today surface is pure task focus.

## 10.4 Glance-value design

- Design system: single brand color (red) used *only* for CTA/priority — "restricting red to the moments that matter ensures that the eye is drawn precisely where it needs to go" (https://blakecrosley.com/guides/design/todoist).
- Opacity-based text hierarchy (100/66/49/18/7% of one base color) — a documented, transferable glance-hierarchy recipe (https://blakecrosley.com/guides/design/todoist).
- Glance question: "what's most important today?" answered by the red P1 cluster.

## 10.5 Empty & first-run states

- Playful illustrated empty state with helper text ("All clear — Looks like everything's organized and in the right place. Tap + to add a task") (https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18).
- An empty Today = success ("Todoist Zero"); the design celebrates emptiness rather than treating it as absence.

## 10.6 Loading & perf

- Web-first; local cache + sync; no skeletons on Today (list renders from cache instantly).

## 10.7 GUI layout (assembled)

Today: [header: "Today" + date in largest font] → [P1 red tasks] → [remaining tasks, time-grouped, drag-to-postpone] → + FAB (orange circle, haptic on tap). Quick Actions on long-press icon (Add Task / Today / Upcoming). Bottom toolbar: Inbox / Today / Search / Browse (https://ixd.prattsi.org/2024/01/design-critique-todoist-ios-app/, https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18).

## 10.8 Differentiators & steal-worthy for PersonalOS

- **Dashboard = default tab, proven at scale** — Todoist's landing-Today is direct evidence for "app opens to dashboard."
- **One saturated accent used for exactly one meaning** (red = priority/CTA) — the exact discipline for PersonalOS's dark-first dashboard (accent reserved for "at risk"/primary action only).
- **Capture defaults to today** — the journal capture block should default its date/context to now.
- **Drag-to-postpone as a no-guilt rescheduling gesture** — "it's not cheating" — matches the non-judgmental constraint; the weekly review block can absorb "what slipped" without blame framing.
- **Opacity-based hierarchy over gray scales** — a token-level recipe for glance hierarchy in the dark theme.

---

# 11. Google At a Glance (widget home screen)

## 11.1 Overview

At a Glance is the permanent top-of-home widget on Pixel (mandatory — "Google still won't let you turn it off"), showing date, weather, and **a rotating single message**: alerts, upcoming calendar events, commute/time-to-leave, food orders, travel (https://www.theverge.com/news/671539/at-a-glance-shrinks-google-pixel-widget-android-16-material-3-expressive, https://9to5google.com/2023/10/06/at-a-glance-widget-redesign-pixel/).

## 11.2 The block stack (deep)

1. **Pill container, 5×1** — left: date + one rotating context card; right: current temperature + condition icon in a scalloped Material You shape; three-dot overflow → "About this content / Hide this content / Not useful" (https://9to5google.com/2023/10/06/at-a-glance-widget-redesign-pixel/).
2. **Rotation list** — the left pane scrolls through Alerts (severe weather), Upcoming, Food/household orders, Commute, Time to leave, Travel — "a list view with no snapping… for a somewhat odd, in-between look" (https://9to5google.com/2024/01/11/at-a-glance-scroll/).
3. **Per-content controls** — each pane has Hide-this-content (user-level curation) and settings toggles per category (https://9to5google.com/2023/10/06/at-a-glance-widget-redesign-pixel/).
4. **Style variants** — semi-transparent / transparent-outline / solid; 2026 adds a **high-contrast mode** (translucent dark background, full-width, rounded) for readability on light wallpapers (https://9to5google.com/2026/02/06/google-pixel-starts-adding-high-contrast-design-for-at-a-glance-widget/).

**Why this order:** the widget is single-message-by-design — one glance, one card; weather is permanent (always relevant), everything else rotates by time/context.

**Block independence:** total — each pane is independent, individually hidable.

**Small screens / degradation:** in Android 16's M3 Expressive update the widget *shrank* to give back an app row — "Making it smaller will at least go some way to appeasing Pixel owners who've long hoped for… flexibility" (https://www.theverge.com/news/671539/at-a-glance-shrinks-google-pixel-widget-android-16-material-3-expressive). The widget is 5×1 but padding-adjustable.

## 11.3 Today-surface patterns

- "Today" = date + the single most *time-relevant* item. The system picks what today's brief is (weather is the only permanent element; everything else is contextual — calendar before meetings, commute before leaving, travel before a trip).
- **Omitted:** everything not currently relevant — the whole design is omission.
- The built-in Pixel Launcher version uses indicator dots for multiple panes; the standalone widget lacks even that cue (documented usability gap) (https://9to5google.com/2024/01/11/at-a-glance-scroll/).

## 11.4 Glance-value design

- Glance question: **"what do I need to know right now?"** — one answer at a time. The rotating single-message pattern is the purest implementation of glance discipline (1 item, zero scanning).
- Numbers are used minimally (temperature); the message is mostly text+icon, kept to one line.
- Contrast is treated as a *feature*: the 2026 high-contrast setting exists because "the transparent widget can be a little tough to read on some lighter wallpapers" (https://9to5google.com/2026/02/06/google-pixel-starts-adding-high-contrast-design-for-at-a-glance-widget/).

## 11.5 Empty & first-run states

- With no events/alerts, the widget shows just date+weather (a minimal honest state — no fake content); per-pane "Hide this content" is the user's empty-state control.

## 11.6 Loading & perf

- Timeline-driven, offline-cached (weather cached, events from local calendar); the widget never shows a spinner — it shows last-known data (a private-first pattern for PersonalOS).

## 11.7 GUI layout (assembled)

Pixel home: [At a Glance pill (date + rotating pane | temp + condition)] → app grid → [Google search bar]. Pane rotation is scrollable, not snapped (https://9to5google.com/2024/01/11/at-a-glance-scroll/).

## 11.8 Differentiators & steal-worthy for PersonalOS

- **The briefing card should be one rotating message, not a digest** — At a Glance proves a single contextual line ("2 habits left · gym at 18:00 · storage 61%") out-glances any multi-item header. PersonalOS's briefing card = date + weather-like status + one contextual line, with the rest of Today as the always-visible list below.
- **Hide-this-content per item** — the privacy-first equivalent: the briefing must never show a block the user hid.
- **Cached-last-known rendering (no spinners)** — directly applicable to the offline-first PWA: blocks render last-known values and mark staleness instead of blocking.
- **Contrast as a first-class setting** — dark-first theme should include a high-contrast variant of the dashboard.

---

# 12. iOS widgets, Smart Stacks & weather widgets (glance systems)

## 12.1 Overview

iOS Home Screen/Lock Screen widgets are the platform's glance system: small/medium/large cards showing "glanceable" non-interactive info; **Smart Stacks** rotate widgets contextually; Lock Screen widgets (iOS 16+) are monochrome, watchOS-complication-style modules — "the Lock Screen is the part of your iPhone you actually glance at dozens (hundreds?) of times during the day" (https://www.macstories.net/stories/ios-16-the-macstories-review/5/, https://developer.apple.com/videos/play/wwdc2020/10103/).

## 12.2 The block stack (deep)

1. **Smart Stack** — several widgets in one slot; **Smart Rotate** surfaces the most relevant at the right moment (weather in the morning, calendar on the commute, music en route home). Widgets signal relevance via `TimelineEntryRelevance` (score + duration) and via donated app intents; score ≤ 0 = "no relevant information… should not be surfaced" (https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks, https://developer.apple.com/videos/play/wwdc2020/10194/, https://developer.apple.com/videos/play/wwdc2021/10049/).
2. **Widget Suggestions** — the system can insert a widget the user doesn't have when behavior matches (https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks).
3. **Three sizes, three depths** — small = "the most useful piece of content… a single tap target"; medium/large = more content + multiple tap targets with deep links; the layout either *expands* across sizes (Weather: adds forecast detail per size) or *recomposes* (News) (https://developer.apple.com/videos/play/wwdc2020/10103/).
4. **Weather widgets** — the standout: current temp + high/low + condition; "we surface unique weather events such as high wind, thunderstorms, and if and when it's going to start raining. And if it does we can contextually increase the resolution of the next hour's forecast" — *contextual resolution* (https://developer.apple.com/videos/play/wwdc2020/10103/). Apple Weather's Lock Screen set: big readout (temp/condition/high-low), air quality, UV, temperature (https://www.macrumors.com/guide/ios-16-weather/).
5. **Lock Screen widgets (iOS 16)** — inline (string+glyph), circular (indicators/gauges — e.g., Streaks' step meter: "a meter that slowly fills up as I approach that number"), rectangular; monochrome by platform constraint "so you're going to have a hard time making an iOS 16 Lock Screen that looks bad" (https://www.macstories.net/stories/ios-16-the-macstories-review/5/, https://www.theverge.com/23347903/ios-16-review-iphone-apple).

**Why this order:** the stack is a *time-ordered* dashboard — the platform itself implements "block order by relevance/time."

**Block independence:** every widget is independent; the stack is the only aggregation.

**Small screens:** widgets are the small-screen layer (watch complications are the smallest); the app is the fallback.

## 12.3 Today-surface patterns

- "Today" is assembled by the OS: weather (always relevant) → calendar/commute (time-of-day relevant) → everything else (event-driven). The pattern is **contextual prioritization with a permanent anchor** — the same shape as PersonalOS's briefing + Today section.
- Omitted: anything not currently relevant; score-0 widgets stay buried (https://developer.apple.com/videos/play/wwdc2021/10049/).

## 12.4 Glance-value design

- Apple's design guidance: widgets "provide timely and glanceable information with obvious value," one primary question per widget; "ask yourself 'What are people looking for when they launch my app?' and find distinct items of information people find useful" (https://developer.apple.com/videos/play/wwdc2020/10103/, https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks).
- **Progress encodings dominate** (rings, gauges, meters) over numbers; monochrome lock-screen constraint forces hierarchy via size/opacity, not color (https://www.macstories.net/stories/ios-16-the-macstories-review/5/).
- The critical critique (MacStories, The Verge): widgets are non-interactive — "I'd rather them be tiny apps" — which is why interactive widgets (TickTick's checklist, Streaks' rings) were the leap forward: glance surfaces *gain* by allowing one-tap action (https://www.macstories.net/stories/ios-16-the-macstories-review/5/, https://www.theverge.com/23347903/ios-16-review-iphone-apple, https://daringfireball.net/linked/2024/11/30/streaks-and-little-streaks).

## 12.5 Empty & first-run states

- Widgets show placeholders during timeline generation (system-managed); an empty widget family is simply not surfaced (score 0). CARROT Weather's 20+ lock-screen widget configs show how a *single app* can offer granular empty-free glance options (https://www.macstories.net/stories/ios-16-the-macstories-review/5/).

## 12.6 Loading & perf

- WidgetKit timelines are pre-computed and cached — the widget never waits on the network; the platform's whole design is offline-first rendering (https://developer.apple.com/videos/play/wwdc2020/10103/).

## 12.7 GUI layout (assembled)

Exemplar stack: [Smart Stack: At a Glance-style weather → calendar next-event → streaks rings] on Home; Lock Screen: [inline: temperature + calendar line] + [circular: Streaks step meter] + [rectangular: CARROT 3-day forecast]. Monochrome, consistent corner radii, guaranteed margins (https://www.macstories.net/stories/ios-16-the-macstories-review/5/).

## 12.8 Differentiators & steal-worthy for PersonalOS

- **Contextual resolution** (weather widget: more detail when it matters) → PersonalOS blocks can be *denser when relevant*: the heatmap strip expands this week; the Coach note expands when a goal slips.
- **Score-0 = don't surface** → the exact rule for honest empties: a block with nothing to say renders nothing (or its compact shell), never a hollow card.
- **Three-size degradation per block** → each dashboard block should define compact/medium/full renderings (mirrors the M2 "heavier derived blocks after shimmer" and small-screen behavior).
- **Interactive glance (one-tap)** — the platform's own evolution (static → interactive widgets) validates PersonalOS's one-tap actions on dashboard blocks.
- **Relevance-duration** — a "time-to-leave"-style rule for the briefing: show the gym-session block only within its window.

---

# 13. Dashboard-design literature (block order, hierarchy, density)

## 13.1 Overview

The BI/analytics literature converges on a small set of principles directly transferable to a life-app dashboard: define the surface's purpose; order by decision value; cap visible widgets; protect the data-ink ratio; use consistent composite cards; default answers must work at a glance; interactions earn their keep *after* the glance answers.

## 13.2 The block stack (deep)

- **Purpose first (Rule 1, Valiotti):** dashboards split into operational (drives immediate action — "the digital control room") vs analytical (drives understanding). "Mixing them by accident is the most common dashboard problem" — an executive opens an analytical view and finds noisy operational metrics (https://valiotti.com/dashboard-design-rules/). PersonalOS's dashboard is operational by this taxonomy: the Today section is the control room; heatmap/trends are analytical and belong lower.
- **Lay out the information flow (Rule 4):** "Top-left of the screen draws the eye first… place the most important information there. Group related items" (https://valiotti.com/dashboard-design-rules/). The F-pattern scan (top-left → bottom-right) places "primary KPIs in the top-left viewport, not scattered wherever there's open space" (https://uxmagic.ai/blog/dashboard-ui-design).
- **Composite widgets with a consistent internal structure (Rule 5):** "Title in the top-left. View/action controls in the top-right. Content in the middle. When every widget follows the same structure, the reader's eye learns it once and reads the rest of the dashboard fast" (https://valiotti.com/dashboard-design-rules/).
- **The 5-7 widget cap (Rule 7) and Rule of 6:** "limit any single visual group to a maximum of six widgets… Past six, the group stops being a scannable summary and becomes a wall"; "5-7 widgets per view; interactions earn their keep" (https://valiotti.com/dashboard-design-rules/, https://uxmagic.ai/blog/dashboard-ui-design).
- **Four-zone layout (Desisle):** Zone 1 header (title/filters/actions) → Zone 2 primary KPIs (3-6 metric cards, "large numbers (48px+)… comparison context… color-coded status") → Zone 3 primary charts (1-3, time-series, drill-down) → Zone 4 secondary data (tables/detail) (https://www.desisle.com/resources/saas-dashboard-design-guidelines).
- **Metric → trend → detail order (UI Syntax):** "preserve metric → trend → detail order to match scan behavior… limit top-level KPI cards to 3… Headline metrics should be at least 1.6× larger than supporting values, and trend deltas should sit immediately adjacent to the metrics they explain" (https://ui-syntax.com/playbooks/dashboard-ux-principles).
- **Decision metrics over vanity metrics:** "Vanity metrics can quietly sabotage dashboard adoption… 'Total Registered Users'… rarely trigger a real decision… Decision metrics belong there instead" (https://uxmagic.ai/blog/dashboard-ui-design).
- **Six IA principles (GoodData):** structure, navigation, hierarchy, grouping, labeling, filtering — "visual and logical hierarchies must work together… If they work against each other, the dashboard becomes cluttered" (https://www.gooddata.ai/blog/six-principles-of-dashboard-information-architecture/).
- **Interactions rule (2026 update, Valiotti):** "defaults must be answerable on a glance; interactions earn their keep when the answer-on-glance is already there" — the drill-down is the sanctioned deepening mechanism, and "the long-scroll critique holds" (https://valiotti.com/dashboard-design-rules/).
- **Progressive disclosure absorbs overflow:** "beyond that, progressive disclosure (tabs, drill-downs) should absorb additional detail rather than adding more charts to the main view" (https://uxmagic.ai/blog/dashboard-ui-design).

## 13.3 Today-surface patterns

Not directly applicable (analytics literature), but the **"answer-on-glance first"** principle is the today-surface rule: the surface's first screenful must answer the surface's purpose question; everything else is drill-down.

## 13.4 Glance-value design

- 5-second rule: "An effective dashboard presents critical data in a structured visual hierarchy so users extract insight and make an operational decision within five seconds" (https://uxmagic.ai/blog/dashboard-ui-design); UI Syntax: "a dashboard is a five-second decision brief" (https://ui-syntax.com/playbooks/dashboard-ux-principles).
- **Encoding hierarchy:** "Build visual comparisons on spatial position and bar length rather than angles, areas, or 3D volumes… avoid pie charts and gauges in the large majority of cases… Reserve pie charts for binary, two-slice comparisons" — a caution for ring/heatmap choices: rings are acceptable for *status*, bars/lines for *comparison* (https://uxmagic.ai/blog/dashboard-ui-design).
- **Preattentive attributes:** "spatial position, bar length, controlled saturation to highlight outliers instead of relying on decorative color" (https://uxmagic.ai/blog/dashboard-ui-design).
- **Data-ink ratio / chartjunk:** "Strip away redundant gridlines, dark card borders, background gradients… a chart with heavy borders and decorative icons isn't more informative, it's just louder" (https://uxmagic.ai/blog/dashboard-ui-design, https://www.desisle.com/resources/saas-dashboard-design-guidelines).
- **Density is a product decision:** "Power users need higher density… casual users need more spacing… a compact toggle paired with a calm default layout protects usability" (https://ui-syntax.com/playbooks/dashboard-ux-principles).

## 13.5 Empty & first-run states

- Literature splits states into three audiences: new user (needs orientation + example + one action), returning user with legitimately empty screen (needs calm confirmation), error/filtered-away (needs explanation + recovery) — "The placeholder framing without the context is dishonest, and users notice" (https://137foundry.com/articles/how-to-design-empty-states-that-earn-trust).
- NN/g: never default to blank; empty states communicate system status, teach (pull revelations), and provide direct pathways to populate (https://www.nngroup.com/articles/empty-state-interface-design/).
- Smashing: first-use empties are onboarding surfaces — "show or tell," drive one action, keep them visually simple, bake in personality; never dead-end (https://www.smashingmagazine.com/2017/02/user-onboarding-empty-states-mobile-apps/).
- Ghost-row pattern: "a low-opacity version of what a populated row would look like, with a CTA inline… the user immediately understands the structure of the page"; first-use vs user-cleared variants must differ; sample-data seeding lifts first-action rates 15-30% (https://www.72technologies.com/blog/empty-states-as-onboarding-surface).
- "One sentence of value, one sentence of how. That's it" — copy rule for empties (https://www.72technologies.com/blog/empty-states-as-onboarding-surface).

## 13.6 Loading & perf

- See §16 (skeleton literature) — the dashboard-specific findings: skeletons belong on full-page loads of predictable layout; per-block loading scoping beats full-page spinners ("Scope your loading indicators to the component that is actually waiting, and leave everything else interactive" — 137Foundry, https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens); mismatched skeletons are worse than none.

## 13.7 GUI layout (assembled)

The consensus dashboard: [header: title + global filters] → [3-4 KPI scorecards, top-left, large numbers, adjacent delta badges] → [1-3 primary trend charts] → [secondary tables/feeds], 12-column grid, consistent card anatomy, ≤6 widgets per group, every metric with an explicit comparison (https://www.desisle.com/resources/saas-dashboard-design-guidelines, https://uxmagic.ai/blog/dashboard-ui-design, https://valiotti.com/dashboard-design-rules/).

## 13.8 Differentiators & steal-worthy for PersonalOS

- **Operational vs analytical split** → the locked order is already correct: Today/habits/ticks (operational, light) at top; heatmap/goals-trends/strength trends (analytical, heavy) below with shimmer; weekly review/storage (periodic, derived) last. The literature says this is *the* most common dashboard error, and the locked design avoids it.
- **Consistent card anatomy** (title TL, controls TR, content middle) → one block template for all dashboard cards.
- **≤6 blocks per group** → PersonalOS's 8-block stack should be grouped (Today+strip = glance group; habits+goals+strength = progress group; review+capture+storage = reflection group) so no single group exceeds ~4.
- **Every metric needs an explicit comparison** → goals progress and strength snapshot blocks need a delta ("vs last week") adjacent to the number, not floating.
- **Answer-on-glance defaults; drill-down earns interaction** → the storage meter's detail (what's eating space) is the drill-down; the glance is "61% used."

---

# 14. Information scent & progressive disclosure

## 14.1 Overview

Two NN/g concepts explain *why* dashboard block order works and how to design drill-downs: information scent (users choose where to go based on estimated value per effort) and progressive disclosure (show few core options; disclose specialized ones on request).

## 14.2 The block stack (deep)

- **Information scent (NN/g, Budiu 2020):** "The information scent of a source… represents the user's imperfect estimate of the value that the source will deliver… derived from a representation of the source." Components: the label, accompanying content, context, prior knowledge (https://www.nngroup.com/articles/information-scent/). Applied to dashboards: each block is a "link" whose *label + preview* must emit the right scent for its content — a block titled "Habits" with 3/5 ticks tells the user exactly what drilling in will yield.
- **Two consequences for dashboard blocks:** (1) summary/preview content must "convey the gist of that information source and add detail to the label" — the block preview *is* the scent; (2) "not providing sufficient context soon enough… users quickly decide that the page is not worth exploring… and leave" — the first screenful of the dashboard must emit enough scent to justify scrolling (https://www.nngroup.com/articles/information-scent/).
- **Progressive disclosure (NN/g, Nielsen 2006):** "Initially, show users only a few of the most important options. Offer a larger set of specialized options upon request… the very fact that something appears on the initial display tells users that it's important." Improves learnability, efficiency, error rate. **Critical constraints:** get the split right (disclose everything frequently needed up front), make progression obvious, label it with clear expectations (strong information scent), and never exceed ~2 disclosure levels (https://www.nngroup.com/articles/progressive-disclosure/).

## 14.3 Today-surface patterns

- The today surface is the disclosure level-1 of the app: it must contain everything needed *frequently*, and its blocks must each emit scent toward level-2 screens (journal editor, gym detail, storage breakdown).
- Staged disclosure caveat: single-screen designs work only when all elements are used together — "more features you can defer, the simpler your design" (https://www.nngroup.com/articles/progressive-disclosure/).

## 14.4 Glance-value design

- Scent is the glance: the preview must answer the glance question *and* promise the depth. A block whose preview shows a single ambiguous number emits no scent and gets ignored (right-rail-blindness analog: blocks that look like decoration get skipped) (https://www.nngroup.com/articles/information-scent/).

## 14.5 Empty & first-run states

- Empty states are scent failures when they're blank: NN/g's guidance that empty states must explain what *could* be there is literally about restoring information scent to an empty container (https://www.nngroup.com/articles/empty-state-interface-design/).

## 14.6 Loading & perf

- Skeleton screens are a scent mechanism too: they preview structure, preserving the mental model of the page during load (see §16).

## 14.7 GUI layout (assembled)

Not a layout literature — the operative layout rule: level-1 surface shows only blocks whose content is frequently needed; every block's header is a scent-bearing label.

## 14.8 Differentiators & steal-worthy for PersonalOS

- **Every dashboard block needs a scent-bearing preview:** ticks (3/5 done) for habits, a mini-sparkline for strength, a delta for goals — the preview is the drill-down's promise.
- **Two-level disclosure cap:** dashboard block → one detail screen. No dashboard-level second scroll of settings.
- **The briefing card must justify scroll:** if the first screenful doesn't emit enough scent (today's plan + at-risk signals), users won't reach the storage meter — the locked order respects this by putting the highest-scent blocks first.
- **Hide-this-block curation is scent management:** letting users remove blocks they never drill into keeps remaining scent high.

---

# 15. Glance-value research (peer-reviewed)

## 15.1 Overview

The academic foundation: activity-tracker usage is dominated by **glances — brief ~5-second sessions with no further interaction (over 70% of sessions)** — so the dashboard's design target is the glance, not the session (Gouveia, Pereira, Karapanos, Munson & Hassenzahl, Ubicomp 2016, https://dl.acm.org/doi/10.1145/2971648.2971754; Gouveia et al., "You have 5 seconds," UbiComp 2015 adjunct, https://dl.acm.org/doi/10.1145/2800835.2809437).

## 15.2 The block stack (deep)

The design-space study generated **21 glanceable-feedback concepts with 6 design qualities** (https://dl.acm.org/doi/10.1145/2971648.2971754):
1. **Abstract** — the feedback need not be literal data (rings, fills, meters).
2. **Integrating with existing activities** — the glance lives where the user already is (watch face, home screen, dashboard top).
3. **Supporting comparisons to targets and norms** — progress-to-goal encoding.
4. **Being actionable** — the glance can trigger the action (check-in).
5. **Leading to checking habits** — the glance is repeatable, becoming a ritual.
6. **Acting as a proxy to further engagement** — the glance pulls into deeper sessions.

Deployed prototypes showed "significant differences among the prototypes… highlighting the surprisingly strong effect glanceable feedback has on individuals' behaviors" (https://dl.acm.org/doi/10.1145/2971648.2971754).

## 15.3 Today-surface patterns

- Design direction: "increasing the frequency of glances, increasing the impact of glances on physical activity, and promoting moments of exploration and learning" (https://dl.acm.org/doi/10.1145/2800835.2809437). The today surface should maximize glance frequency (place it where the user already is) and glance impact (make each glance answer a question).

## 15.4 Glance-value design

- Schmid (2026, Convergence) analyzes the Apple Watch Activity Rings as the canonical glanceable system and identifies **three trade-offs: low information resolution, reductionism, and fragmented interaction** — glanceable interfaces "trade informational complexity for efficiency," normalizing behavior through brief interaction (https://doi.org/10.1177/13548565261442032).
- Blascheck et al.'s glanceable-cue framework (cited therein): "Presence and Access," "Simplicity and Understandability," "Suitability and Purpose" — the three checks for any glance element (https://doi.org/10.1177/13548565261442032).
- Numbers vs progress vs status: the literature consistently favors *status encoding* (fill, ring, color) for the glance layer and reserves numbers for the *comparison* layer — consistent with Apple HIG rings and Streaks (§3.4).

## 15.5 Empty & first-run states

- Not directly covered; the closest analog is "the capacity to lead to checking habits" — a glance with no data (empty state) can't form a checking habit, hence honest empties must still emit *structure* (ghost rows, §13.5).

## 15.6 Loading & perf

- Glance systems must render instantly (the glance has a ~5s budget — a loading block is an unread glance).

## 15.7 GUI layout (assembled)

Not layout research; the deployment implication: glance elements should be placed in *stable, predictable positions* so the glance is a muscle memory (watch-face position analog).

## 15.8 Differentiators & steal-worthy for PersonalOS

- **Design the dashboard for the 5-second glance first, the session second** — every block must answer its question within 5 seconds; anything requiring longer belongs one tap away.
- **Six quality checklist as a block review gate** — before shipping a dashboard block, verify: abstract? integrated? compares to target? actionable? ritual-forming? deep-linking? Blocks failing "actionable" (e.g., a passive storage meter) should still deep-link.
- **Status encoding beats numbers for the glance layer** — ticks/fills/rings for today; numbers for deltas and trends.
- **The 70% glance statistic justifies the one-tap discipline:** if 7 of 10 sessions are 5-second glances, the dashboard must complete its loop (check in, log, capture) in one tap — otherwise the glance is wasted.

---

# 16. Skeleton shimmer & perceived performance (literature)

## 16.1 Overview

The loading-state literature is directly load-bearing for PersonalOS's "heavier derived blocks render after skeleton shimmer, never blocking first paint." The current (2026) consensus is more nuanced than the 2013-2018 "skeletons always win" default: skeletons win only in a narrow band, and **per-block loading scoping beats full-page skeletons**.

## 16.2 The block stack (deep)

- **NN/g (2023):** skeleton screens are for full-page loads; they build a mental model of structure, reduce perceived wait, prevent "the site isn't working" abandonment; best under 10s; frame-only skeletons (no content wireframe) are *not* recommended; under ~1s they're pointless and annoying (https://www.nngroup.com/articles/skeleton-screens/).
- **The contested evidence:** Viget's 2017 study (n=136) found skeleton users *estimated longer waits* and rated worse than spinners; the 2018 ACM ECCE study found skeletons won on perceived speed but spinners won on first-visit task completion. Reconciliation: "Skeleton screens may score better on perceived speed for **returning users** who have an established mental model… spinners may perform better for **first-time users**" (https://www.codexical.com/posts/2026-05-09-skeleton-screens-vs-spinners-science).
- **The 2026 decision guide (72Technologies):** skeletons win when: load 400ms–3s; layout predictable; **skeleton matches real layout closely** (same rows, sizes, rhythm); content-heavy page. Failures: "a skeleton that doesn't match the real layout is worse than no skeleton, because it sets an expectation and breaks it… if your content is genuinely variable, either generate skeletons from a cached shape on the previous visit, or use a spinner" (https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026).
- **Per-block scoping (137Foundry):** "Scope your loading indicators to the component that is actually waiting, and leave everything else interactive" — the anti-pattern is the full-page spinner (https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens).
- **Content-first streaming:** "Render the shell and any cached or fast data immediately. Stream slower regions in as they resolve. Use a skeleton only for the regions that are still pending after ~400ms" — three strategies on one page (https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026).
- **Geometry contracts & CLS:** skeleton dimensions must match final content to avoid layout shift on swap; shimmer must respect `prefers-reduced-motion`; contrast ≥1.5:1 against background (https://anmshpndy.com/cases/skeleton-screens-perceived-speed/, https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens).
- **Labor-perception theory (Buell & Norton, 2011):** visible effort reduces frustration — "users become observers of a process rather than victims of a black box" (https://anmshpndy.com/cases/skeleton-screens-perceived-speed/).

## 16.3 Today-surface patterns

- The today surface is exactly the "content-first" case: light blocks (ticks, capture, briefing) render from local state instantly; heavy derived blocks (heatmap aggregation, coach analysis) resolve later in place.

## 16.4 Glance-value design

- Loading states are themselves glance elements: "a blank white screen for two seconds feels much longer than a skeleton screen for three" (https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens); a shimmering block says "derived content coming" while the glanceable blocks stay interactive.

## 16.5 Empty & first-run states

- "Design explicit edge-case states before handoff" — every loading state must have a paired error state (timeout, offline); offline-first apps must distinguish "loading" from "never had data" (https://uxmagic.ai/blog/dashboard-ui-design, https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens).

## 16.6 Loading & perf

- "Skeletons are a patch on a slow experience… if you're reaching for them constantly, the question isn't 'how do I make better skeletons,' it's 'why is so much of my UI async?'" — for offline-first PersonalOS, most blocks should render from cache with zero loading states; skeletons apply to *derived* blocks only (https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026).

## 16.7 GUI layout (assembled)

Consensus dashboard load: [render cached/light blocks immediately] → [skeleton per pending derived block, geometry-matched, shimmer off under reduced motion] → [blocks swap in place with no layout shift] → [stale-data markers instead of spinners for offline data].

## 16.8 Differentiators & steal-worthy for PersonalOS

- **The locked M2 design is validated:** "heavier derived blocks render after skeleton shimmer, never blocking first paint" is exactly the literature's content-first streaming + per-block scoping pattern — with the refinement that the *skeleton must match the final block geometry* (derive skeleton shapes from the block templates).
- **Returning-user vs first-user nuance:** shimmer skeletons are for returning users with a mental model; first-run users get ghost-rows/empty-state structure instead (pair the skeleton system with the empty-state system).
- **Never skeleton the light blocks** (ticks, capture): render from local cache; a shimmer on today's habits would violate the 5-second glance (§15).
- **Reduced-motion:** shimmer disabled → static skeleton; accessibility tokens in the design system.
- **Staleness over blocking:** offline-first means "render last-known + mark stale," never a spinner while checking storage.

---

# 17. "Life OS" dashboards (Notion life-dashboard templates)

## 17.1 Overview

Notion "Life OS" templates are the closest existing artifact to PersonalOS's ambition: a single home surface aggregating tasks, goals, habits, notes, projects. The category is mature (multiple marketplace templates, $0-$129, PARA-based) and its conventions are the market's answer to "what does a life dashboard contain and in what order" (https://www.notion.com/templates/life-os-dashboard, https://www.notion.com/templates/lifeos-all-in-one-personal-dashboard, https://www.notion.com/templates/life-os-dashboard-for-goals-projects-tasks).

## 17.2 The block stack (deep)

The dominant template structure (Toolswithoutcode's free/pro template and Clarity Mastery's guide agree):

1. **Navigation rail (left column)** — pages per life area: Tasks Hub, Goals Hub, Habits, Finance, Learning, Events (https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step).
2. **Middle column — the "today" zone:** "The middle column should answer one simple question the moment you open Notion: **What should I work on today?**" — today's tasks (filtered to due/overdue/not-done — "nothing disappears just because a deadline passed"), active goals **with live progress percentages**, today's habit checklist, active projects, unprocessed inbox count — "all on one screen, no digging required" (https://www.toolswithoutcode.com/notion-life-os-template/, https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step).
3. **Right column — reference zone:** clock/quote, upcoming payments, events this week/next, daily auto-report ("tasks done vs remaining… review your day in seconds") (https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step).
4. **Ritual buttons** — "Start Today" (creates dated entry: morning check-in prompt + top-3 priorities + evening reflection, ~2 min) and one-click **Weekly Review** (6 prompted sections: completed / not-finished-and-why / habits / inbox / priorities for next week) — the "Get Back on Track" page is a six-step, **judgment-free** recovery checklist (https://www.toolswithoutcode.com/notion-life-os-template/).

**Why this order:** today-answer center, reference right, navigation left; rituals are buttons on the dashboard because "every session starts on the Home Dashboard — that's the whole point of having one" (https://www.toolswithoutcode.com/notion-life-os-template/).

**Block independence:** each database view is independent; hidden via "Show if not empty"-style filters.

**Small screens:** Notion is desktop-first; the mobile experience is scrolling database views (a known weakness — the community's advice is to keep 5-7 databases max to stay manageable) (https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step).

## 17.3 Today-surface patterns

- Today = tasks + goals + habits + inbox count, filtered to *actionable-now*; the "daily auto-report" (done vs remaining) is the day's summary block.
- The guided Daily Log (morning check-in, top-3, evening reflection) is a *structured capture ritual* — the closest market analog to PersonalOS's journal capture + briefing fusion.
- **Omitted:** raw archives, notes dumps, long-term analytics — filtered views only.

## 17.4 Glance-value design

- Numbers/progress: goals show **progress percentages**; habits are checklists; inbox is a count. The "one glance answers what?" per block: tasks → "what's left today"; goals → "am I on pace"; habits → "what's done"; inbox → "what's unprocessed."
- The templates are text-heavy (Notion's limitation) — the glance value is *structure*, not graphics; PersonalOS's graphic advantage (ticks, heatmap, rings) is exactly the upgrade path.

## 17.5 Empty & first-run states

- Setup guidance is explicit and honest: "Don't migrate everything you own into it on day one. Add this week's tasks… let the rest wait"; start with 3 habits; set one goal per area — **progressive fill as a first-run strategy** (https://www.toolswithoutcode.com/notion-life-os-template/).
- The "Get Back on Track" page is a designed *recovery* empty state for lapsed users ("No catching up required") (https://www.toolswithoutcode.com/notion-life-os-template/).

## 17.6 Loading & perf

- Notion is slow by reputation; templates mitigate with filtered views and cached pages — the life-OS category's known weakness, which validates PersonalOS's offline-first local rendering.

## 17.7 GUI layout (assembled)

Notion Life OS home: [left: area nav] [center: Today's Focus (tasks filter) · Goals (progress bars) · Habit checklist · Projects · Inbox count + Start Today / Weekly Review buttons] [right: clock/quote · upcoming payments · events · daily report]. (https://www.toolswithoutcode.com/notion-life-os-template/, https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step)

## 17.8 Differentiators & steal-worthy for PersonalOS

- **"One goal per area" + "add this week's tasks only"** — the progressive-fill first-run discipline PersonalOS should mirror (empty dashboard → one habit, one goal, one note; blocks fill as life fills).
- **Guided Weekly Review with prompted sections** — the exact shape for the weekly review/Coach block: prompt-structured, non-judgmental ("what you didn't finish and *why*", not "what you failed").
- **Daily auto-report (done vs remaining)** — the R11 week-recap strip's daily counterpart.
- **Judgment-free recovery page** — "Get Back on Track: no catching up required" — a designed answer to lapsed streaks that PersonalOS's honest-empty constraint should include for the "N days fully logged" marker (streak broke → what now? — a calm recovery path, not a punishment).
- **The central column answers one question** ("What should I work on today?") — the clearest one-sentence mission for a dashboard, and the exact mission of PersonalOS's Today section.

---

# 18. Synthesis: what PersonalOS should steal (and omit)

## 18.1 The block stack, validated

The locked M2 order — **Today section → calendar/heatmap strip → habits card → goals progress → strength snapshot → weekly review/Coach note → journal capture → storage meter** — matches every strong precedent found, mapped to the literature's "state → evidence → trend → reward" and "operational-then-analytical" rules:

| PersonalOS block | Precedent | Glance question | Encoding |
|---|---|---|---|
| Today: briefing card | Daybreak "one card" (weather+day+focus); At a Glance rotating single message | "What do I need to know right now?" | 1 contextual line + date + status |
| Today: habit ticks | Streaks rings; Habitify auto-sink sections | "What's left today?" | fill/status, not numbers |
| Today: capture | Todoist "+" defaults to today; Things Quick Entry | "Quick note now?" | one tap |
| Calendar/heatmap strip | Habitify year heatmap; GitHub-contribution analog | "How's my week shaping up?" | position/brightness (comparison) |
| Habits card | TickTick habits-under-today; Habitify area slicing | "Which habits are slipping?" | ticks + mini status |
| Goals progress | Notion live progress %; Todoist P1 | "Am I on pace?" | delta + progress bar |
| Strength snapshot | Fitbit cardio donut (weekly goal); Apple rings | "Did I train enough this week?" | weekly progress-to-goal |
| Weekly review/Coach note | Notion guided Weekly Review; Fitbit coach (1-2 sentences!) | "What did this week say?" | prompted summary, expandable |
| Journal capture | Notion Daily Log ritual; Daybreak ritual | "What happened today?" | single CTA |
| Storage meter | Fitbit sync bar (non-blocking) | "Am I safe offline?" | % + status color |

**Order rules from the literature:** top-left = highest-scent operational blocks (Today), derived/analytical blocks descend (heatmap → goals → strength), periodic/reflective blocks last (weekly review → journal → storage) — which is the locked order. The one-order debate to note: Apple's MacStories reviewer wanted trends above workouts (https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/) — i.e., *derived* blocks are sometimes better above *evidence* blocks when they're more glance-relevant; PersonalOS's heatmap strip directly under Today is the right compromise (it's light-weight derived, unlike coach analysis).

## 18.2 Glance hierarchy (steal)

1. **Status > progress > numbers** for the glance layer (rings/ticks/fills first; deltas adjacent; raw numbers last) — §3.4, §5.4, §15.4.
2. **One saturated accent, one meaning** (Things 3 yellow/red; Todoist red; UI Syntax "controlled saturation") — dark-first theme: accent = at-risk/primary action only (https://blakecrosley.com/guides/design/todoist, https://blakecrosley.com/guides/design/things, https://uxmagic.ai/blog/dashboard-ui-design).
3. **Opacity hierarchy over gray scale** (Todoist 100/66/49/18/7% of one base color) as the dark-theme token recipe (https://blakecrosley.com/guides/design/todoist).
4. **1.6× headline-to-support contrast** for block metrics (https://ui-syntax.com/playbooks/dashboard-ux-principles).
5. **Remaining > achieved** for goal blocks (Fitbit steps tile) (https://www.androidauthority.com/fitbit-app-pixel-watch-material-3-expressive-3587305/).
6. **Consistent card anatomy** (title TL / controls TR / content middle) so the eye learns once (https://valiotti.com/dashboard-design-rules/).

## 18.3 Empty-state design (steal)

- Three-state taxonomy: first-run (high-information: name the block, ghost-row preview, one CTA), user-cleared (calm confirmation — "all clear" Todoist style), no-data-because (explain + recovery path) — never one template for all (https://137foundry.com/articles/how-to-design-empty-states-that-earn-trust, https://www.72technologies.com/blog/empty-states-as-onboarding-surface).
- **"Show if not empty"** as the default block visibility rule (TickTick) — the strongest single mechanism for PersonalOS's honest-empty constraint: blocks with no signal collapse to nothing (https://help.ticktick.com/articles/7055782283059396608).
- **Progressive fill on first run** (Notion: one habit, one goal, one task; never migrate everything day one) (https://www.toolswithoutcode.com/notion-life-os-template/).
- Empty Today = success, marked positively by the zero-XP "N days fully logged" marker (Things 3/Todoist Zero + Duolingo's single-relevant-data-point finding) (https://blog.duolingo.com/widget-feature/, https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/).

## 18.4 Shimmer & loading (steal, with the literature's corrections)

- Keep the locked rule but implement it as **per-block skeletons only for derived blocks, geometry-matched to the final card** (same rows/rhythm), shimmer disabled under reduced motion, blocks swap in place with zero layout shift (https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026, https://anmshpndy.com/cases/skeleton-screens-perceived-speed/).
- Light blocks (ticks, capture, briefing, storage meter) render from local cache instantly — **no skeletons for local data**; skeletons are only for derived computation (heatmap aggregation, coach analysis) (https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026).
- Staleness marker beats spinner for offline data (Fitbit's non-blocking sync bar as the pattern) (https://www.androidauthority.com/android-app-design-3631537/).

## 18.5 One-tap discipline (steal)

- The 70%-glances statistic (§15) is the mandate: check-in, capture, and the briefing's primary action must be single-tap from the dashboard; everything else is drill-down (progressive disclosure, ≤2 levels) (https://dl.acm.org/doi/10.1145/2800835.2809437, https://www.nngroup.com/articles/progressive-disclosure/).
- Completion feedback must be tactile/delightful (Streaks ring fill; Things 500ms check animation) — the marker of a well-designed tap (https://gummble.com/showcase/streaks-ios/, https://blakecrosley.com/guides/design/things).

## 18.6 What to OMIT (anti-patterns found)

1. **AI/insight paragraphs in the main flow** — Fitbit's documented failure ("a quarter of the display… my eyes just wanted to glaze over it"); coach output must be 1-2 sentences, expandable (https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/).
2. **Hollow blocks for unsupported/empty data** — Samsung Health's unsupported-widget failure; hide or explain, never show a dead card (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/, https://journalarta.com/en/tech/samsung-health-redesign-2026-layout-navigation/).
3. **Cross-block coupling/punishment** — Habitica's HP loss for missed dailies; PersonalOS's no-XP constraint is the right rejection (https://github.com/heyshantanugupta/understanding-user-adoption-in-gamified-productivity-apps).
4. **Color excess** — Samsung Health's "tooth-achingly bright" cards; glance contrast ≠ saturation (https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/).
5. **Raw date-dumps without intention ordering** — the "when vs deadline" split (Things 3) and "only dated tasks in Today" (Todoist) show the today surface must be *curated by intention* (https://blakecrosley.com/guides/design/things, https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs).
6. **More than ~6 blocks per visual group** (Rule of 6) — group PersonalOS's 8 blocks into ≤4-block groups (https://uxmagic.ai/blog/dashboard-ui-design, https://valiotti.com/dashboard-design-rules/).
7. **Decorating the glance graphic** — Apple HIG's ring protection: the "N days fully logged" marker and tick meter must never be decorative or repurposed (https://developer.apple.com/design/human-interface-guidelines/activity-rings).

---

## Source index (by section)

- Habitify: https://habitify.me/ · https://www.techradar.com/computing/websites-apps/habitify · https://makeheadway.com/blog/habitify/ · https://intercom.help/habitify-app/en/articles/12520095-understanding-your-journal-view-ios-android-apps · https://intercom.help/habitify-app/en/articles/14718310-progress-screen-introduction · https://intercom.help/habitify-app/en/articles/14885639-progress-screen-the-good-habits-report-on-website-desktop · https://intercom.help/habitify-app/en/articles/6113651-habitify-web-desktop-app · https://www.habitify.me/onboarding-instruction/log-check-in
- Habitica: https://geekculture.co/app-of-the-month-habitica-october-2024/ · https://lifehacker.com/tech/habitica-productivity-app-review · https://www.androidpolice.com/gamifying-daily-habits/ · https://screensdesign.com/showcase/habitica-gamified-taskmanager · https://github.com/heyshantanugupta/understanding-user-adoption-in-gamified-productivity-apps
- Streaks: https://gummble.com/showcase/streaks-ios/ · https://calmevo.com/streaks-app-review/ · https://daringfireball.net/linked/2016/06/03/streaks · https://daringfireball.net/linked/2024/11/30/streaks-and-little-streaks · https://chudo-minimalism.com/streaks-review-my-honest-thoughts-after-2-months-of-use/ · https://www.theverge.com/23347903/ios-16-review-iphone-apple
- Duolingo: https://blog.duolingo.com/widget-feature/ · https://blog.duolingo.com/new-duolingo-home-screen-design/ · https://blog.duolingo.com/core-tabs-redesign/
- Apple Fitness: https://developer.apple.com/design/human-interface-guidelines/activity-rings · https://support.apple.com/guide/iphone/see-your-activity-summary-iph4c34a8a95/ios · https://www.macstories.net/stories/the-new-fitness-app-in-ios-14/ · https://doi.org/10.1177/13548565261442032
- Samsung Health: https://www.androidauthority.com/samsung-health-app-2026-update-hands-on-3679261/ · https://www.androidauthority.com/samsung-health-app-overhaul-arrives-3678471/ · https://www.slashgear.com/2205926/new-samsung-health-app-updates-have-users-split-love-hate-useful-or-not/ · https://www.androidheadlines.com/2026/06/samsung-health-app-ai-redesign-update-2026-galaxy-watch.html · https://journalarta.com/en/tech/samsung-health-redesign-2026-layout-navigation/
- Fitbit: https://9to5google.com/2025/08/20/fitbit-app-coach-redesign/ · https://9to5google.com/2025/08/24/fitbit-app-redesign-impressions/ · https://lifehacker.com/health/fitbit-new-app-preview-impressions · https://www.androidauthority.com/android-app-design-3631537/ · https://www.androidauthority.com/fitbit-app-pixel-watch-material-3-expressive-3587305/
- Things 3: https://thesunrisedigest.com/focus/things-3-review-2026/ · https://appiod.com/things-3-review-2026-the-gtd-app-worth-every-penny/ · https://blakecrosley.com/guides/design/things · https://www.pcmag.com/reviews/things-3 · https://www.wired.com/2017/05/things-might-prettiest-list-app-ever/
- TickTick: https://help.ticktick.com/articles/7055782283059396608 · https://help.ticktick.com/articles/7401564165023727616 · https://tidbits.com/2025/08/14/ticktick-provides-a-focused-daily-task-list-and-more/ · https://au.pcmag.com/productivity/94753/ticktick · https://muratesmer.com/blog/ticktick-review/
- Todoist: https://www.todoist.com/help/articles/plan-your-day-with-the-today-view-UVUXaiSs · https://medium.com/design-bootcamp/todoist-reviewed-30e951e6de18 · https://ixd.prattsi.org/2024/01/design-critique-todoist-ios-app/ · https://blakecrosley.com/guides/design/todoist
- At a Glance: https://9to5google.com/2023/10/06/at-a-glance-widget-redesign-pixel/ · https://9to5google.com/2024/01/11/at-a-glance-scroll/ · https://9to5google.com/2026/02/06/google-pixel-starts-adding-high-contrast-design-for-at-a-glance-widget/ · https://www.theverge.com/news/671539/at-a-glance-shrinks-google-pixel-widget-android-16-material-3-expressive
- iOS widgets/Smart Stack/weather: https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks · https://developer.apple.com/videos/play/wwdc2020/10103/ · https://developer.apple.com/videos/play/wwdc2020/10194/ · https://developer.apple.com/videos/play/wwdc2021/10049/ · https://www.macstories.net/stories/ios-16-the-macstories-review/5/ · https://www.macrumors.com/guide/ios-16-weather/ · https://arstechnica.com/gadgets/2022/09/ios-16-review-customization-unlocked/
- Dashboard literature: https://valiotti.com/dashboard-design-rules/ · https://uxmagic.ai/blog/dashboard-ui-design · https://ui-syntax.com/playbooks/dashboard-ux-principles · https://www.gooddata.ai/blog/six-principles-of-dashboard-information-architecture/ · https://www.desisle.com/resources/saas-dashboard-design-guidelines
- Info scent / disclosure: https://www.nngroup.com/articles/information-scent/ · https://www.nngroup.com/articles/progressive-disclosure/
- Glance research: https://dl.acm.org/doi/10.1145/2971648.2971754 · https://dl.acm.org/doi/10.1145/2800835.2809437 · https://doi.org/10.1177/13548565261442032
- Skeleton/perf: https://www.nngroup.com/articles/skeleton-screens/ · https://www.codexical.com/posts/2026-05-09-skeleton-screens-vs-spinners-science · https://www.72technologies.com/blog/skeleton-screens-vs-spinners-2026 · https://anmshpndy.com/cases/skeleton-screens-perceived-speed/ · https://137foundry.com/articles/how-to-design-loading-states-skeleton-screens
- Empty states: https://www.nngroup.com/articles/empty-state-interface-design/ · https://www.smashingmagazine.com/2017/02/user-onboarding-empty-states-mobile-apps/ · https://137foundry.com/articles/how-to-design-empty-states-that-earn-trust · https://www.72technologies.com/blog/empty-states-as-onboarding-surface
- Life OS: https://www.notion.com/templates/life-os-dashboard · https://www.notion.com/templates/lifeos-all-in-one-personal-dashboard · https://www.notion.com/templates/life-os-dashboard-for-goals-projects-tasks · https://www.toolswithoutcode.com/notion-life-os-template/ · https://www.claritymastery.co/blog/how-to-build-a-life-dashboard-in-notion-step-by-step
- Briefings: https://getslime.app/features/briefings · https://repbud.app/features/the-brief · https://dimension.dev/morning-briefing · https://apps.apple.com/tm/app/daybreak-ai-morning-briefing/id6779929934 · https://dailystack.ai/