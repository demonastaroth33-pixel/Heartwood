# Goals & Tasks — Competitive Research Report (PersonalOS M5)

**Research date:** 2026-08-29 · **Scope:** goals with milestones + plan adherence + milestone review for a private, offline-first, single-user Flutter PWA (journal + habits + gym + nutrition + Coach). Constraints that shape every "steal" below: offline-first, privacy-first, no XP for logging, no shame language, facts-only Coach, derived-only stats, no push notifications.

**Method:** multi-query web search + official docs + deep reviews + app-store/play-store listings per app, current to 2026. All prices/versions are "as of mid/late 2026" and flagged where sources conflict.

---

# 1. Strides (habit + goal tracker with milestone charts)

**Sources:** [stridesapp.com](https://www.stridesapp.com/) · [App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817) · [MobileAppDaily review 2025](https://www.mobileappdaily.com/product-review/strides-habit-tracker-app) · [HabitNoon review 2025](https://habitnoon.app/habit-tracker-app/strides) · [Productivity Directory](https://productivity.directory/strides) · [ClickUp Learn goal-tracking comparison](https://clickup.com/learn/topic/productivity/tools/features/goal-tracking) · [Unstar 1-3★ review analysis 2026](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026) · [GoalsAndProgress 2026 roundup](https://goalsandprogress.com/best-goal-tracking-apps) · [Clockdiary roundup](https://clockdiary.com/blog/productivity/goal-tracking-apps) · [DailyHabits review](https://www.dailyhabits.xyz/habit-tracker-app/strides)

### 1. Overview
iOS-only goal & habit tracker (iPhone/iPad/Apple Watch/Mac), positioning: "Track all your Goals & Habits in one place" with SMART-goal structure built in ([stridesapp.com](https://www.stridesapp.com/)). Free tier capped at ~1–4 trackers (reports vary: App Store reviewer says 1, [Unstar 2026](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026) says 1 goal, HabitNoon says 3, GoalsAndProgress says 4); Strides Plus $4.99/mo, $39.99/yr, or ~$79.99 lifetime ([dailyhabits.xyz](https://www.dailyhabits.xyz/habit-tracker-app/strides), [unstar.app](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026)). 4.8★ App Store. Apple-only (iCloud sync); no Android. Includes 150+ tracker templates and a free goal-setting course "On the Right Path" (values → high-success-rate goals → accountability) ([productivity.directory](https://productivity.directory/strides)).

### 2. Core paradigm
One of the few consumer apps with a real **goal-vs-habit distinction as a first-class choice**: four tracker types — **Habit** (yes/no), **Target** (numeric value by date, with Pace Line), **Average** (repeating number, e.g. sleep hours), **Project** (milestones with dates, "complete sliders with pace & dates") ([mobileappdaily.com](https://www.mobileappdaily.com/product-review/strides-habit-tracker-app), [clickup.com](https://clickup.com/learn/topic/productivity/tools/features/goal-tracking)). Goal = tracker instance with a target; milestones exist only inside the Project type. No formal goal→milestone→task hierarchy — milestones are the task layer.

### 3. Goal model (deep)
- **Creation:** 3-step flow: pick/create a tracker from 150+ templates or blank; choose type (Habit/Target/Average/Project); set frequency/schedule or target value + target date ([productivity.directory](https://productivity.directory/strides)).
- **Target definition:** Target tracker = numeric goal + deadline; SMART structure "with measurable targets, deadlines, and progress percentages built into each goal entry" ([goalsandprogress.com](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Pace Line:** the standout mechanic — for Target trackers the app draws the **straight line from start value to target value across the deadline** (the required rate of progress) and plots your actual logged values against it; color-coded (green on pace, red/amber behind) "see at a glance whether you are on track" ([productivity.directory](https://productivity.directory/strides), [clockdiary.com](https://clockdiary.com/blog/productivity/goal-tracking-apps)). This is a derived statistic — no user math.
- **Progress:** **manual only** (you log values; the app computes %), "Progress Reports with everything in one place", charts of history, streak, success rate ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817)). Progress % auto-calculated from logged entries vs target; Project trackers compute milestone completion % from completed milestone dates.
- **Milestones:** Project tracker only — set simple milestones with dates; "Milestone Calendar" view shows them on a calendar; milestone sliders fill as you complete ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817), [mobileappdaily.com](https://www.mobileappdaily.com/product-review/strides-habit-tracker-app)).
- **Completion moment:** "Once a target is achieved, the app pops-up a message to congratulate and keeps the user encouraged" ([mobileappdaily.com](https://www.mobileappdaily.com/product-review/strides-habit-tracker-app)). No formal "won/expired" review state beyond this.

### 4. Task management
Not a task manager. Closest: Project trackers' milestones are dated mini-tasks ("complete sliders with pace & dates" ([mobileappdaily.com](https://www.mobileappdaily.com/product-review/strides-habit-tracker-app))). Reminders are per-tracker, unlimited. Notes can be attached to logs ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817)).

### 5. Gamification & motivation (deep)
- **Streaks** on Habit trackers with "Streak Calendars" showing consecutive success ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817)).
- **Success rate** % as a softer metric than raw streak (frequent in reviews: success rate is a headline chart) ([productivity.directory](https://productivity.directory/strides)).
- **Pace Line is the anti-abandonment mechanic**: it reframes a bad week as "behind pace" (recoverable) rather than "failed", which is the strongest slip-handling pattern in this cluster. Color-coded on/off-track status everywhere.
- **No punitive mechanics** — no HP, no reset-to-zero shame; the congrats popup is the only celebration.
- **Failure mode per 1–3★ reviews:** goal-vs-habit confusion at setup (choosing tracker type is a decision hurdle), free-tier cap frustration, Apple Health sync gaps ([unstar.app](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026)).

### 6. Integration patterns
Apple Health integration (auto-pull steps/sleep/workouts into trackers), iCloud sync across Apple devices, calendar reminders; **no Android, no Google Calendar sync, no task-manager links** ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817), [goalsandprogress.com](https://goalsandprogress.com/best-goal-tracking-apps)). Goals are siloed — the famous gap ClickUp's comparison calls out: "A goal tracker that lives in a separate app from your task manager creates a disconnect" ([clickup.com](https://clickup.com/learn/topic/productivity/tools/features/goal-tracking)).

### 7. GUI layout (deep)
- **Dashboard:** list of your trackers, each with a **color ring / progress %** and a status dot; clean, chart-forward; "two-tap daily logging from the dashboard" ([goalsandprogress.com](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Tracker detail:** big progress chart; Target trackers overlay the **Pace Line** (dashed diagonal from start to target vs your logged points); below, the log history; plus a **Milestone Calendar** (project type) showing milestone markers on month cells; plus streak calendar for habit type ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817), [productivity.directory](https://productivity.directory/strides)).
- **Create flow:** 3-step wizard (template picker first — the app pushes templates over blank starts).
- **Reports screen:** aggregated charts across all trackers ("Progress Reports with everything in one place") ([App Store](https://apps.apple.com/us/app/strides-habit-tracker-goals/id672401817)).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Pace Line (top steal).** A derived straight-line projection from first value to target over the deadline, drawn against actuals. Maps 1:1 to PersonalOS "goal pace vs plan (adherence)" and F1 goal projections — it is the classic lit-mirror-number for a weight goal ("need 0.32 kg/week to hit 82 kg by Dec 1"). Why it's ideal: it's a *derived stat* (no user effort), gives slip visibility without shame ("behind pace" ≠ "failed"), and works offline.
2. **Color-coded on/off-track status everywhere** — instant glanceable adherence; the "amber drift" pattern PersonalOS wants for plan adherence per-slot %.
3. **Milestone Calendar** — dated milestone markers on month cells; the obvious precedent for PersonalOS goal-deadline rings on calendar day cells (extend: ring = deadline, not just a marker).
4. **Target-achieved congrats popup** — the minimal "won" moment; PersonalOS's milestone review "won" state can be this + a one-line reflection.
5. **Tracker-type distinction at creation** — forces the user to decide goal-kind upfront (generic/weight/strength); the PersonalOS kind enum is the same idea, just with auto-derived progress instead of manual.

---

# 2. Way of Life (habit tracker with pattern charts)

**Sources:** [wayoflifeapp.com](https://wayoflifeapp.com/) · [App Store](https://apps.apple.com/in/app/way-of-life-habit-tracker/id393159800) · [Google Play](https://play.google.com/store/apps/details?id=com.wayoflife.app&hl=en) · [Zapier review](https://zapier.com/blog/best-habit-tracker-app) · [Macaron review 2026](https://macaron.im/blog/way-of-life-habit-tracker-review) · [Habitify comparison](https://habitify.me/compare/way-of-life-vs-streaks) · [HabitNoon review](https://habitnoon.app/habit-tracker-app/way-of-life) · [Unstar 2026](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026) · [GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps) · [Clockdiary](https://clockdiary.com/blog/productivity/goal-tracking-apps)

### 1. Overview
~15-year-old (2010) cross-platform habit tracker (iOS + Android), Denmark-based (Way of Life ApS). "An elegant habit tracker that actually works" ([wayoflifeapp.com](https://wayoflifeapp.com/)); recommended by Forbes/NYT/Healthline (Healthline "Best Motivation App of 2019") ([App Store](https://apps.apple.com/in/app/way-of-life-habit-tracker/id393159800)). Free for 3 habits; premium $4.99/mo on iOS, one-time ~$6.49 on Android ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review), [Zapier](https://zapier.com/blog/best-habit-tracker-app)); 4.7★ App Store, 4.5★ Play. "All themes gone free" in v4.2.0 (May 2025); actively maintained for iOS 18 ([App Store](https://apps.apple.com/in/app/way-of-life-habit-tracker/id393159800)).

### 2. Core paradigm
**Journal-style behavior tracking**: every habit is a journal; each day marked green (done) / red (not done) / yellow (skipped), with an optional note. The unit of truth is the **color grid over time**, not a streak counter. Explicitly anti-gamification: "less 'did I win today?' and more 'what does my month actually look like?'" ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)). Supports good and bad habits. No numeric goals, no targets, no deadlines — the goal layer is entirely "chains" (streaks with custom target lengths).

### 3. Goal model (deep)
- **Creation:** name a habit, pick a color, choose good/bad, set reminders; fastest onboarding in the category ("name a habit, pick a color, and you are done" — [goalsandprogress.com](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Target definition:** the only target is a **target chain length** (e.g. "build a 30-day chain"), configurable per habit under "Chains" during setup ([Zapier](https://zapier.com/blog/best-habit-tracker-app)).
- **Progress:** manual tap green/red/yellow; the Trend tab derives charts (completion %, weekly patterns, month heatmaps). "Progress" for a goal = your chain progress vs target chain.
- **Milestones:** none native. Archive = completed/abandoned goals can be archived (Google Play feature list: "Archive completed goals") ([Google Play](https://play.google.com/store/apps/details?id=com.wayoflife.app&hl=en)).
- **Completion moment:** reaching a target chain length is not celebrated specially — the chain just continues; the "win" is visual only.

### 4. Task management
None — not a task app. Closest: the **daily note** attached to any day's entry ("what workout I did", "why I broke the habit"), which accumulates into a per-habit journal ([Zapier](https://zapier.com/blog/best-habit-tracker-app)). Note length is limited (user complaint: "blocked because there is too much I've recorded") ([Google Play](https://play.google.com/store/apps/details?id=com.wayoflife.app&hl=en)).

### 5. Gamification & motivation (deep — the anti-shame case study)
- **Skip (yellow) does not break the chain** — the exact grace mechanic PersonalOS wants for slips ([Zapier](https://zapier.com/blog/best-habit-tracker-app)). The app's philosophy is visibility, not judgment: "It shows you what's true without editorializing" ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)).
- **No streak resets to zero** in the punishing sense — chains degrade naturally in the grid; users report "I don't feel the negative pressure I get from habit tracking apps" (Play review, Heidi Johns, Dec 2024) ([Google Play](https://play.google.com/store/apps/details?id=com.wayoflife.app&hl=en)).
- **Notes turn failure into data**: the pattern chart plus notes is a "reflective analysis" loop — the closest consumer precedent to PersonalOS's milestone-review "one-line derived reflection".
- **Failure modes:** dated UI ("hasn't changed much in years", no dynamic widgets, no Health integration, no numeric tracking, no sub-habits) ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)); Android reminder reliability flagged as occasionally failing in independent testing ([Clockdiary](https://clockdiary.com/blog/productivity/goal-tracking-apps) via [Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)); free-tier 3-habit ceiling ([Zapier](https://zapier.com/blog/best-habit-tracker-app)); manual skip marking is "cumbersome for irregular schedules" ([Clockdiary](https://clockdiary.com/blog/productivity/goal-tracking-apps)).

### 6. Integration patterns
No Apple Health/Google Fit integration; no calendar sync; CSV/JSON export; cloud backup to any Android cloud provider (premium); reminders only. It is deliberately disconnected — its privacy story is "no account, data on device" ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review), [Google Play](https://play.google.com/store/apps/details?id=com.wayoflife.app&hl=en)).

### 7. GUI layout (deep)
- **Home:** each habit is a horizontal strip of colored day-cells; a single-screen color grid per habit = glanceable month at a time; tap a cell to flip green/red/yellow, tap-hold to add a note ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)).
- **Habit detail:** the strip + chain stats + notes list; "Chains" settings to set target streak length ([Zapier](https://zapier.com/blog/best-habit-tracker-app)).
- **Trend tab:** weekly-completion charts, best/worst days, month heatmaps — "the red-block grid is more useful than a streak counter" for pattern understanding ([Macaron](https://macaron.im/blog/way-of-life-habit-tracker-review)).
- **Reminder:** per-habit time-of-day reminder with quick-check from notification.

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Yellow = skipped, doesn't break anything.** PersonalOS slip handling should implement exactly this trichotomy (done / skipped-with-grace / missed) — it's the proven no-shame pattern; skip should be a first-class, one-tap state, not buried.
2. **The color grid as the anti-streak stat.** "What does my month actually look like" is the derived-only-stats philosophy made visual; PersonalOS plan-adherence per-slot % is this grid's numeric form. Consider rendering adherence as a mini-grid rather than a percentage bar.
3. **Notes-on-every-entry as the reflection substrate.** The one-line milestone-review reflection has a direct precedent here: the note is attached to the day, dated, and later browsable — exactly the data shape a facts-only Coach needs.
4. **Archive completed goals** — a lightweight terminal state; PersonalOS "won/expired" goals should archive with their review text, never delete.
5. **Restraint as a feature**: zero celebration/lecturing mechanics kept users for a decade — evidence that PersonalOS's no-XP/no-shame constraint is commercially survivable, not just ideologically pure.

---

# 3. Streaks (Crunchy Bagel — habit goal app)

**Sources:** [streaks.app](https://streaksapp.com/) · [App Store](https://apps.apple.com/us/app/streaks/id963034692) · [Crunchy Bagel blog — Streaks 10 (2-Day Rule)](https://crunchybagel.com/now-available-streaks-10/) · [Macaron 2026 review](https://macaron.im/blog/streaks-habit-tracker-app-review-2026) · [Zapier](https://zapier.com/blog/best-habit-tracker-app) · [Unstar 2026](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026) · [Habitify comparison](https://habitify.me/compare/way-of-life-vs-streaks) · [MWM market data](https://mwm.ai/apps/streaks/963034692) · [Chudo-minimalism 2-month review](https://chudo-minimalism.com/streaks-review-my-honest-thoughts-after-2-months-of-use/)

### 1. Overview
Apple Design Award–winning habit tracker by Crunchy Bagel (Australia); "The to-do list that helps you form good habits" ([streaks.app](https://streaksapp.com/)). One-time $5.99 (iPhone/iPad/Mac/Apple Watch/Apple Vision Pro; 27k ratings, 4.8★) ([App Store](https://apps.apple.com/us/app/streaks/id963034692)). Up to **24 tasks** (raised from 12 in v10, 2024) ([Crunchy Bagel](https://crunchybagel.com/now-available-streaks-10/)). No free tier, no Android, no account/email — data on device + iCloud ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)).

### 2. Core paradigm
Pure **don't-break-the-chain**: you pick habits ("tasks"), configure their schedule (daily / specific weekdays / N× per week / N× per month / specific days of month), and the app's only job is to keep consecutive-day streaks alive. Goal = the streak itself; the circular ring grid is the interface ("completing all six rings" is the accidental gamification hook, per the Apple Developer interview with creator Quentin Zervaas — [Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)). Supports **negative habits** (tracking things to stop) ([streaksapp.com](https://streaksapp.com/)).

### 3. Goal model (deep)
- **Creation:** pick from 600+ icons (or emoji / 3-letter text in v10), choose schedule, optional reminder, done — seconds ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026), [Crunchy Bagel](https://crunchybagel.com/now-available-streaks-10/)).
- **Target definition:** not a value+deadline — a *frequency schedule*. The "goal" is maintaining the habit on scheduled days; stats include current streak, best streak, success rate, longest week/day patterns ([App Store](https://apps.apple.com/us/app/streaks/id963034692)).
- **Automatic progress (key differentiator):** **Apple HealthKit auto-tracking** — steps, heart rate, workouts, water, sleep can mark tasks complete without opening the app ("You finish your walk, the Health app records it, Streaks picks it up") ([streaksapp.com](https://streaksapp.com/), [Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)). This is the only consumer habit app in this cluster with true automatic goal progress.
- **Milestones:** none — no goal→milestone structure. The app is deliberately flat.

### 4. Task management
A "task" is a habit. Per-task: schedule, reminder, notes-per-day, statistics, widget; shared tasks; timers for timed habits; iOS 18 Control Center "Complete Task" controls; watchOS complications + Live Activities ([Crunchy Bagel](https://crunchybagel.com/now-available-streaks-10/), [App Store](https://apps.apple.com/us/app/streaks/id963034692)). There is no "today" list concept — the ring grid *is* the today view.

### 5. Gamification & motivation (deep — both the mechanism and its failure mode)
- **The streak as identity:** "day 1 you're trying to meditate, day 100 you're a meditator" ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)); the ring-fill feedback is designed to be addictive (Zervaas: adding a 6th task created compulsion to finish all rings).
- **2-Day Rule (v10, 2024) — the grace mechanic, explicitly implemented:** "gives you a single day's grace if you don't complete a task… miss Monday → marked 'skipped', streak not reset; must complete Tuesday, else 'missed' and streak resets to 0. A '2' indicator is shown above the task if you're required to complete it today" ([Crunchy Bagel](https://crunchybagel.com/now-available-streaks-10/)). This is the most explicit slip-grace UX in the cluster.
- **Loss aversion as the engine** — "Streaks breed pride, fear, and guilt… that's the whole mechanism" ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)). Documented dark side: users game the app (log habits they didn't do to preserve streaks), perfectionists spiral ("losing an 87-day streak feels worse than missing the habit"), people do habits while sick to protect the number ([Unstar](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026), [Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)).
- **Science note in reviews:** Lally et al. 2010 — missing one day doesn't materially derail habit formation; streak counters don't know that ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)) — the strongest evidence that a 2-day-rule-style grace is *correct*, not just kind.
- **Anti-abandonment:** flexible schedules (you configure "3 days/week" so a miss is impossible by design) ([streaksapp.com](https://streaksapp.com/)); statistics screen ("current and best streak, and a whole range of other statistics") ([App Store](https://apps.apple.com/us/app/streaks/id963034692)).

### 6. Integration patterns
Apple Health (auto-complete), iCloud sync, Siri Shortcuts, Apple Watch complications, widgets, iOS 18 Control Center; Apple-only everything. Negative-habit tracking doubles as a "stop" goal ([streaksapp.com](https://streaksapp.com/)). No calendar integration, no tasks.

### 7. GUI layout (deep)
- **Home:** grid of colored rings, one per task; completed = filled ring; uncompleted = hollow; the "2" badge appears on tasks where the 2-Day Rule is active and today is mandatory ([Crunchy Bagel](https://crunchybagel.com/now-available-streaks-10/)). Tap ring = complete (3 seconds).
- **Task detail:** icon, schedule picker (weekday matrix / N-per-week / days-of-month incl. "last day of month" options), reminder time, 2-Day Rule toggle, per-day notes, statistics (current streak, best, success rate, completion calendar).
- **Statistics:** per-task history calendar + aggregate stats ([App Store](https://apps.apple.com/us/app/streaks/id963034692)).
- **Apple Watch:** complications show remaining tasks; mark complete from the wrist ([streaksapp.com](https://streaksapp.com/)).
- **Onboarding:** icon library + schedule picker; no account step ([Macaron](https://macaron.im/blog/streaks-habit-tracker-app-review-2026)).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **The 2-Day Rule, verbatim, as PersonalOS slip handling.** PersonalOS's "expired: window closed" mechanics should include this exact grace: one missed window doesn't kill a goal; the app visibly flags "do it today or it counts as missed" (the "2" indicator). No shame, pure clarity.
2. **Auto-completion from first-party data.** Streaks/HealthKit proves users accept zero-tap goal progress when the data source is trusted; PersonalOS's weight/strength goals auto-advance from the weight ladder / strength standards in the same spirit.
3. **The ring grid as a dashboard pattern** — at most ~6-12 active goals; the grid is glanceable and complete-able. PersonalOS goal list could use ring-style progress (lit-mirror-number) with no percentages shown.
4. **Negative habits**: a goal kind that tracks "not doing X" — worth considering as a generic-kind option.
5. **Counter-evidence for XP:** Streaks' documented streak-gaming shows what happens when the *metric* becomes the goal — validation for PersonalOS "no XP for logging" and "derived-only stats" (progress must come from body data, not from checking boxes).

---

# 4. Todoist (task manager)

**Sources:** [todoist.com](https://www.todoist.com/) · [Wikipedia](https://en.wikipedia.org/wiki/Todoist) · [Hack'celeration pricing 2026](https://hackceleration.com/labs/todoist-pricing) · [Linktly review 2026](https://www.linktly.com/productivity-software/todoist-review) · [The Digital Project Manager review 2026](https://thedigitalprojectmanager.com/tools/todoist-review) · [ClickUp Learn comparison](https://clickup.com/learn/topic/productivity/tools/features/goal-tracking) · [Gamify.com (karma)](https://www.gamify.com/gamification-blog/7-examples-of-website-gamification) · [BloggingX (karma mechanics)](https://bloggingx.com/gamification-in-elearning) · [Giodella](https://giodella.com/goal-setting-apps) · [Top3 review 2026](https://www.top3.software/r/todoist-review)

### 1. Overview
The world's most popular task manager (~30–50M users; "trusted by 30 million people and teams" per todoist.com, 50M+ per app store listings) ([todoist.com](https://www.todoist.com/), [Linktly](https://www.linktly.com/productivity-software/todoist-review)). Free plan (5 projects, 3 filters, 1 week activity history); Pro $5/mo billed yearly ($7 monthly) after the Dec 10, 2025 price increase (was $4) — Pro annual $60; Business $8/user/mo ([Hack'celeration](https://hackceleration.com/labs/todoist-pricing)). Platforms: web, Windows, macOS, iOS, Android, browser extensions. Founded 2007 by Amir Salihefendić.

### 2. Core paradigm
**Tasks → projects → sections → subtasks**, plus labels, priorities (P1–P4), and filters. **No native goals** — goals are emulated as projects; the only goal-adjacent features are Karma (2013) and Productivity Trends ([Wikipedia](https://en.wikipedia.org/wiki/Todoist)). "Todoist's karma and productivity trends provide lightweight goal awareness but lack the specificity of a dedicated goal tracker" ([ClickUp Learn](https://clickup.com/learn/topic/productivity/tools/features/goal-tracking)).

### 3. Goal model (deep)
- **Creation:** a goal = a project (possibly with sections as milestone buckets) or a filter. The app will not compute progress; users fake progress with sub-task counts in project headers.
- **Target definition:** deadlines exist per-task (due dates, recurring due dates); there is no goal-level target value or deadline. Natural-language input ("meeting tomorrow at 3pm") is the capture mechanism ([giodella.com](https://giodella.com/goal-setting-apps)).
- **Progress tracking:** the **Productivity view** tracks daily task-completion counts and streaks (how many days in a row you hit your daily goal) ([BloggingX](https://bloggingx.com/gamification-in-elearning), [Top3](https://www.top3.software/r/todoist-review)). Not progress toward a target — progress *rate*.
- **Milestones:** via sections in projects; completion is manual checkbox.
- **Completion moment:** none for goals — a project is just archived.

### 4. Task management (deep)
- Structure: Inbox (capture), Today (due today + scheduled), Upcoming (calendar strip), Projects (with sections), Filters (query language, e.g. `@work & overdue`), Labels, Priorities P1–P4, subtasks, recurring tasks, reminders ([Linktly](https://www.linktly.com/productivity-software/todoist-review), [Top3](https://www.top3.software/r/todoist-review)).
- Review cadence: none built in — the community ritual is the weekly "Review" via filters/activity history; Pro adds activity history (30 days+) ([Top3](https://www.top3.software/r/todoist-review)).
- Completion: checkbox; completing a task can trigger a **daily-goal counter** (configurable tasks-per-day target) which feeds Karma/Productivity.
- AI: "Task Assist" + "Ramble" (brainstorming) in Pro, "auto-scheduling" suggestions ([Linktly](https://www.linktly.com/productivity-software/todoist-review), [Hack'celeration](https://hackceleration.com/labs/todoist-pricing)).

### 5. Gamification & motivation (deep)
- **Karma (2013):** points for completing tasks on time, meeting daily goals, streaks; **negative karma for postponing tasks or accumulating uncompleted tasks**; levels run Novice → … → Expert/Master/Grand Master with badges ([Wikipedia](https://en.wikipedia.org/wiki/Todoist), [BloggingX](https://bloggingx.com/gamification-in-elearning)).
- **Productivity trends:** colorful graphs of task completion over time, streaks ("Karma rewards… taps into loss aversion, and motivates customers to keep up good work, not wanting to break their positive streak") ([Gamify.com](https://www.gamify.com/gamification-blog/7-examples-of-website-gamification)).
- **Slip handling:** no shame language — an overdue task just sits in Today/Overdue; rescheduling is frictionless (drag to tomorrow). Karma's negative points are the only punishment, and they're quiet (no popup shaming).
- **Failure mode:** karma became background noise — reviews treat it as a nice-to-have, not a driver ([Top3](https://www.top3.software/r/todoist-review)); this is the canonical evidence that XP-for-logging doesn't move behavior in a serious tool, supporting PersonalOS's "no XP for logging".

### 6. Integration patterns
90+ integrations: Google Calendar (2-way), Outlook, Slack, Gmail, Zapier/IFTTT/Make, voice assistants; API/webhooks ([Linktly](https://www.linktly.com/productivity-software/todoist-review)). Calendar view (Pro) shows tasks on a calendar. Offline-first sync is a genuine strength (offline task editing syncs on reconnect) ([Linktly](https://www.linktly.com/productivity-software/todoist-review)).

### 7. GUI layout (deep)
- **Sidebar:** Inbox / Today / Upcoming / Filters & Labels / Projects; red badges for overdue.
- **Today view:** tasks due today grouped by priority/overdue, with a completion checkmark animation; the "daily goal" progress indicator at top.
- **Upcoming view:** 7-day strip of due tasks + calendar heat.
- **Project view:** task list with section headers; board (Kanban) mode for Pro.
- **Task row:** checkbox, title, due-date chip, priority flag, label chips — dense but scannable.
- **Calendar view (Pro):** tasks as blocks on a month/week grid alongside Google Calendar events.

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Natural-language capture** — the gold standard for low-friction task entry; PersonalOS task creation should parse "every Mon/Wed" and "by Dec 1" style input.
2. **Today view as a curated, not exhaustive, list** — only due+scheduled items, with overdue surfaced gently; PersonalOS's "today" for goals/tasks should follow (deadline-ring days pull their goal into today).
3. **Karma as negative evidence.** The most-used task app in the world downgraded its own points system to background noise — empirical support for "no XP for logging": if Todoist's XP can't drive behavior, PersonalOS shouldn't try.
4. **Filters as derived views** (e.g. "goals behind pace") — a query language over goals+adherence is cheap and powerful.
5. **Offline-first done right at scale** — Todoist's local-first sync model validates PersonalOS's architecture choice; users explicitly praise offline editing.

---

# 5. TickTick (all-in-one tasks + habits + calendar)

**Sources:** [ticktick.com](https://ticktick.com/) · [RememberWork review](https://rememberwork.com/tools/task-managers/ticktick) · [Toolradar 2026](https://toolradar.com/tools/ticktick) · [Lark blog — TickTick pricing/plans](https://www.larksuite.com/en_us/blog/ticktick-pricing) · [Upbase review 2025](https://upbase.io/blog/ticktick-review) · [The Digital Project Manager 2026](https://thedigitalprojectmanager.com/tools/ticktick-review/) · [ToolFinder review](https://toolfinder.co/go/ticktick) · [ProPicked 2026](https://propicked.com/saas/ticktick) · [Cloudwards 2026](https://www.cloudwards.net/ticktick-review)

### 1. Overview
All-in-one task manager + calendar + habit tracker + Pomodoro timer, by Appest (China; predecessor GTasks 2010, TickTick 2013, desktop 2016, Pomodoro/calendar/habits 2020) ([The Digital Project Manager](https://thedigitalprojectmanager.com/tools/ticktick-review/)). Every platform (web, iOS, Android, macOS, Windows, Linux, browser ext). Free tier generous (lists, tags, reminders, 2 calendar subscriptions, basic habit stats); Premium $35.99/yr (~$3/mo, "consistently ~40% cheaper than Todoist yearly") ([Lark](https://www.larksuite.com/en_us/blog/ticktick-pricing), [Hack'celeration](https://hackceleration.com/labs/todoist-pricing)). 4.7★ aggregate; noted con: China-based hosting → data concerns for privacy-minded users ([RememberWork](https://rememberwork.com/tools/task-managers/ticktick)).

### 2. Core paradigm
**Tasks, habits, and calendar in one surface** — the closest consumer analog to PersonalOS's ambition of goals+tasks+calendar integration. Habits are a separate module beside tasks; the calendar view fuses tasks and events; Pomodoro + habit stats (premium) complete the loop. No goal→milestone hierarchy; habits have per-habit daily/weekly *target counts*.

### 3. Goal model (deep)
- **Creation:** habits created with a name, icon, and **frequency + daily/weekly goal** (e.g. "drink water, 8/day"); tasks created via natural language.
- **Target definition:** habit target = count per day or week; task target = due date (recurring supported).
- **Progress:** habit streaks + completion history per habit; "Habit statistics" (premium: charts of consistency over time) ([Lark](https://www.larksuite.com/en_us/blog/ticktick-pricing)); tasks are binary.
- **Milestones:** via subtasks/checklists on tasks; no milestone timeline.
- **Completion:** check-off; habits can be checked from the calendar day cell directly.

### 4. Task management (deep)
- Lists (project-like), tags, priorities, due dates, subtasks, checklists, recurrence ("every weekday"), natural-language parsing, smart lists, Eisenhower matrix view, Kanban/calendar/timeline views ([ToolFinder](https://toolfinder.co/go/ticktick), [ProPicked](https://propicked.com/saas/ticktick)).
- **Today view** ("All" → "Today"): due tasks + due habits in one list; **calendar view** shows tasks, events, and habit completion markers on day cells ([Toolradar](https://toolradar.com/tools/ticktick)).
- Review cadence: none built in; "Focus" stats and weekly summaries (premium).
- Completion: tap; undo; habit check from notification overlay ("the overlay is very helpful rather than just a notification") ([ToolFinder](https://toolfinder.co/go/ticktick)).

### 5. Gamification & motivation
- **Streaks on habits** with "daily goal monitoring" ([ProPicked](https://propicked.com/saas/ticktick)); premium habit statistics show trend charts.
- **Pomodoro statistics** as a second motivational layer (focus minutes, sessions) ([RememberWork](https://rememberwork.com/tools/task-managers/ticktick)).
- **Slip handling:** soft — a missed habit day just doesn't extend the streak; no punishment, no shame copy; habits can be **skipped** without breaking streak (premium: "unlimited skips" per Zapier's Habitify notes; TickTick similarly allows marking a habit as done/skipped for a day).
- No XP, no levels, no social — motivation is data + streaks only.

### 6. Integration patterns
**Two-way Google Calendar sync** (tasks ↔ events, added 2020s update — "connect TickTick with Google Calendar to see tasks and events together") ([Upbase](https://upbase.io/blog/ticktick-review)); calendar subscriptions (premium); webhooks/API; email-to-task; voice input ([productivity.directory](https://productivity.directory/ticktick)). This task+calendar fusion is the direct precedent for PersonalOS "goal deadlines shown as rings on the calendar day cells".

### 7. GUI layout (deep)
- **Sidebar:** Inbox, Today, Next 7 Days, Calendar, Habits, Pomodoro, Statistics, Lists.
- **Today:** grouped task list with priority colors + habit section; check from list.
- **Calendar:** month/week/day views; tasks appear as blocks on their due day; **habit completion shown per day cell**; clicking a day shows its tasks+habits ([The Digital Project Manager](https://thedigitalprojectmanager.com/tools/ticktick-review/)).
- **Habit detail:** streak counter, calendar heatmap of completions, target editor (count/day, schedule days).
- **Statistics:** completion rate, focus time, habit consistency charts (premium).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Tasks + habits + calendar in one surface** — validation that users want goal-adjacent data on the same day cells; PersonalOS's deadline-rings-on-calendar is the same fusion with rings instead of blocks.
2. **Habit targets as count-per-day/week** — a lightweight "habit-goal" kind: PersonalOS generic goals with targetValue already cover this; the lesson is the *frequency schedule* (which days) must be a first-class field.
3. **Check-in from the calendar day cell** — zero-friction logging from the surface where deadlines are visible.
4. **Two-way calendar sync as a feature users pay for** — the calendar is where goals get seen; PersonalOS should treat its internal calendar as the primary goal-deadline surface.
5. **Privacy as a differentiator**: TickTick's China-hosting data concern is a recurring objection — directly supports PersonalOS's privacy-first, offline-first positioning.

---

# 6. Things 3 (Cultured Code — GTD task manager)

**Sources:** [PCMag review 2025](https://www.pcmag.com/reviews/things-3) · [ProductiveWithChris 2025](https://productivewithchris.com/tools/things-3/) · [TechRepublic 2024](https://www.techrepublic.com/article/things-3-review/) · [The Digital Project Manager 2026](https://thedigitalprojectmanager.com/tools/things-3-review) · [RememberWork](https://rememberwork.com/tools/task-managers/things-3) · [ToolStack](https://toolstack.io/tools/things-3) · [Productivity Blog/Medium review](https://blog.productivity.directory/things-3-review-a-premier-task-management-tool-27654c0f2875)

### 1. Overview
Apple-only GTD task manager (Mac, iPhone, iPad, Apple Watch, Vision Pro), Apple Design Award winner, built on the GTD method. **One-time purchase, no subscription**: iPhone $9.99, iPad $19.99, Mac ~$50 (total ~$80 for the set) ([RememberWork](https://rememberwork.com/tools/task-managers/things-3), [ProductiveWithChris](https://productivewithchris.com/tools/things-3/)). Privacy story: local storage, optional Things Cloud (iCloud-based) sync, no account required ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)). No web, no Windows/Android, no collaboration, no reporting dashboards ([PCMag](https://www.pcmag.com/reviews/things-3)).

### 2. Core paradigm
**Areas (ongoing responsibilities) → Projects (goals with multiple steps) → To-Dos (tasks), with Headings to structure projects into phases** ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/), [ToolStack](https://toolstack.io/tools/things-3)). "Create To-Dos as milestones toward larger Projects… a clear plan for each goal" ([ToolStack](https://toolstack.io/tools/things-3)). Projects *are* goals; headings are milestone groups; checklists inside to-dos are sub-steps.

### 3. Goal model (deep)
- **Creation:** Project = goal; quick entry anywhere (global hotkey, Quick Entry with autofill, Mail to Things, URL schemes) ([ToolStack](https://toolstack.io/tools/things-3)).
- **Target definition:** projects can have a **deadline** (and "When" start dates); there is **no numeric target** — completion is task-based.
- **Progress:** purely manual (checkbox). No %, no pace, no velocity — by design ("Limited reporting and analytics may not meet the needs of power users" — [DPM](https://thedigitalprojectmanager.com/tools/things-3-review)).
- **Milestones:** headings group tasks into phases ("divide Projects into logical sections"); checklists sub-divide tasks ([ToolStack](https://toolstack.io/tools/things-3)).
- **Completion moment:** a project "completes" when its last to-do is checked; completed items go to the **Logbook** — a permanent, browsable completion history ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/), [ToolStack](https://toolstack.io/tools/things-3)). This is the cleanest "won" archive in the cluster.

### 4. Task management (deep)
- **The four horizons of scheduling:** **Today** (due/planned today + "This Evening" sub-section), **Upcoming** (scheduled start dates + deadlines as a calendar strip), **Anytime** (unscheduled), **Someday** (ideas), **Logbook** (completed) ([ToolStack](https://toolstack.io/tools/things-3), [ProductiveWithChris](https://productivewithchris.com/tools/things-3/)).
- **Review cadence:** the **Evening Review** ritual is built into the UI ("Plan tomorrow today"); no automated review prompt — the Today view invites it ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)).
- Repeating to-dos & projects with exception handling; natural language ("tomorrow at 2pm", "every Monday", "in 3 days") ([ToolStack](https://toolstack.io/tools/things-3)); Quick Find "type travel"; tags + filtering; keyboard-first (`.`, `T`, `S`, space) ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)).
- **Deadline semantics are explicit:** each task has both "start date" (When) and "deadline" — a distinction PersonalOS's goal deadlines should borrow (deadline ≠ the day work starts).

### 5. Gamification & motivation
- **Deliberately zero gamification** — no points, streaks, or rewards; motivation is the clean Today list and the Logbook's quiet accumulation. PCMag's framing: "gets out of the way" ([PCMag](https://www.pcmag.com/reviews/things-3)).
- **Slip handling:** overdue tasks move to Today with no drama; **no archive/shame state**; a project past its deadline just stays open. The "Someday" list is the anti-abandonment tool — nothing is ever deleted, ideas stay parked.
- **Anti-abandonment:** Logbook preserves every completed item (permanent evidence of wins); repeatable projects (e.g. "Monthly review") institutionalize cadence ([ToolStack](https://toolstack.io/tools/things-3)).

### 6. Integration patterns
Apple Calendar events shown inline in Today/Upcoming (read-only fusion); iCloud sync; Shortcuts/Siri; URL scheme; AppleScript; widgets; Mail to Things. No Google anything, no Zapier. Offline-first with optional sync — "privacy-focused (no cloud required)" ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)).

### 7. GUI layout (deep)
- **Sidebar:** Inbox · Today · Upcoming · Anytime · Someday · Logbook, then Areas and Projects sections ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)).
- **Today view:** date header, task rows with checkbox + "when" chips; **"This Evening" sub-heading** for night tasks; calendar events inline in the same list ([ToolStack](https://toolstack.io/tools/things-3)).
- **Upcoming:** a calendar strip of scheduled to-dos and project deadlines — deadline days are visually marked on the strip.
- **Project page:** title + deadline chip at top; tasks grouped under **headings** (phases); drag between sections; progress implied by remaining tasks ([TechRepublic](https://www.techrepublic.com/article/things-3-review/)).
- **Task detail:** notes (Markdown), checklist, tags, when/deadline pickers.
- **Typography/whitespace-heavy design** — "a masterclass in visual communication… custom fonts, subtle color, generous whitespace, smooth animations" ([ProductiveWithChris](https://productivewithchris.com/tools/things-3/)); no themes/customization (consistency as a feature — [DPM](https://thedigitalprojectmanager.com/tools/things-3-review)).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Deadline vs start-date split.** A goal can be "due Dec 1" while work starts now; rings on calendar cells should mark the deadline distinctly from plan slots.
2. **Logbook = the won-archive.** Permanent, browsable completion history; PersonalOS milestone-review "won" entries should land in exactly this kind of archive (with the one-line reflection attached).
3. **"This Evening" micro-view** — splitting today into day/evening is a tiny UX that reduces overwhelm; applicable to PersonalOS task today-view.
4. **Areas as the umbrella above goals** — goals belong to life domains (health, work); PersonalOS's goals could carry a "domain" attribute derived from the app's structure (journal/habits/gym/nutrition) rather than free text.
5. **Restraint evidence, again:** the most praised design in task management has no gamification, no dashboard analytics — users stay for the calm. Reinforces PersonalOS's anti-shame, facts-only posture.

---

# 7. Habitica (gamified habit + goal quests)

**Sources:** [habitica.com](https://habitica.com/) · [Habitica Features page](https://habitica.com/static/features) · [Trophy.so gamification case study 2025](https://trophy.so/blog/habitica-gamification-case-study) · [Toolradar 2026](https://toolradar.com/tools/habitica) · [HabitNoon review](https://habitnoon.app/habit-tracker-app/habitica) · [AndroidGuías 2025](https://en.androidguias.com/Habitica-transforms-your-daily-tasks-into-an-epic-RPG-adventure./) · [TechRadar 2025](https://www.techradar.com/reviews/habitica) · [Unstar 2026 (1–3★ analysis)](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026) · [GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps) · [Listicler 2026](https://listicler.com/tools/habitica)

### 1. Overview
Open-source RPG habit tracker (ex-HabitRPG, 2013, Tyler Renelle; web + iOS + Android). Completing real tasks levels up a pixel avatar; missed dailies damage it. Free core; subscription $4.99/mo (cosmetics: gems, bonus items, ad-free) ([Toolradar](https://toolradar.com/tools/habitica), [HabitNoon](https://habitnoon.app/habit-tracker-app/habitica)). 4.0★ aggregate (Capterra 3.8, SourceForge 4.3) ([Toolradar](https://toolradar.com/tools/habitica)). Multiplayer: parties, guilds, quests, challenges.

### 2. Core paradigm
Three task types instead of goals: **Habits** (repeated behaviors, positive or negative), **Dailies** (recurring scheduled tasks — "daily goals"), **To-Dos** (one-time tasks) ([Trophy.so](https://trophy.so/blog/habitica-gamification-case-study), [habitica.com](https://habitica.com/static/features)). "Outcome goals" are emulated as To-Dos with checklists (milestones) ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). A "goal" is a quest, a challenge, or a big To-Do — there is no goal entity with a target value.

### 3. Goal model (deep)
- **Creation:** Habit (pos/neg, difficulty), Daily (schedule + difficulty), To-Do (one-time; can carry a **checklist**). Difficulty setting (trivial/easy/medium/hard) scales XP/gold.
- **Target definition:** no numeric targets or deadlines on goals; To-Dos get due dates; **Challenges** (community-created task lists with prize gems) are the closest thing to "goals with an endpoint and a reward" ([habitica.com](https://habitica.com/static/features)).
- **Progress:** automatic from completion — each check awards XP/gold immediately; avatar bars fill; a to-do's checklist gives partial completion.
- **Milestones:** checklist items inside a To-Do are the milestone layer ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Completion moment:** quest monsters take damage when party members complete tasks — group goal completion is *shared damage*, a genuinely different "won" moment (social, not personal) ([habitica.com](https://habitica.com/static/features), [Trophy.so](https://trophy.so/blog/habitica-gamification-case-study)).

### 4. Task management
Tags, due dates, checklists, per-task reminders, a simple list UI; filters by tag/due. No projects/areas, no subtask hierarchy beyond checklists, no calendar, no natural language. Task management is deliberately shallow — the game is the layer on top ([AndroidGuías](https://en.androidguias.com/Habitica-transforms-your-daily-tasks-into-an-epic-RPG-adventure./), [HabitNoon](https://habitnoon.app/habit-tracker-app/habitica)).

### 5. Gamification & motivation (deep — the cautionary tale)
- **Full RPG stack:** XP, gold, levels, classes, skills, equipment, pets/mounts, quests, achievements/badges, seasonal events (Grand Galas) ([Trophy.so](https://trophy.so/blog/habitica-gamification-case-study), [AndroidGuías](https://en.androidguias.com/Habitica-transforms-your-daily-tasks-into-an-epic-RPG-adventure./)).
- **Loss aversion, literal:** missed Dailies or negative habits drain HP; **at zero HP the avatar dies and loses gold + XP** ([Trophy.so](https://trophy.so/blog/habitica-gamification-case-study)). Reviews describe it as perfect for loss-aversion-motivated users, and anxiety-inducing/avoidance-triggering for others — "disabling the punitive mechanic is possible but not obvious in onboarding" ([Unstar](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026)).
- **Custom rewards:** gold buys real-world treats (user-defined: "watch an episode") — the best-in-class pattern for *delayed gratification*, and the only consumer example where the reward is chosen by the user ([Trophy.so](https://trophy.so/blog/habitica-gamification-case-study)).
- **Social accountability:** parties + guilds + shared quests ("Forgetting to floss means damage done to everyone") ([habitica.com](https://habitica.com/static/features)).
- **Failure modes (1–3★ reviews):** gamification fatigue ("the game becomes the job"), party/quest sync outages, dated 2018-era UI, avatar-death anxiety, and — most damning for PersonalOS — **users report doing tasks for the points rather than the behavior**, the exact anti-pattern PersonalOS bans with "no XP for logging" ([Unstar](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026)).
- **Research support:** Sailer et al. (*Computers in Human Behavior*) — badges/points satisfy competence needs; avatars/social features satisfy relatedness ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). Hamari et al.: gamification works but is context/user dependent.

### 6. Integration patterns
Public **API** (third-party apps, webhooks), data export; web+apps sync; no calendar/health integrations; the multiplayer layer is the integration surface ([HabitNoon](https://habitnoon.app/habit-tracker-app/habitica), [habitica.com](https://habitica.com/static/features)).

### 7. GUI layout (deep)
- **Header (persistent):** avatar with HP / XP / gold bars + level; a "today" deadline ticker; party status.
- **Main tabs:** Habits / Dailies / To-Dos; each task row shows difficulty dots, checkbox, and (for dailies) a schedule strip.
- **Task detail:** notes, checklist, tags, difficulty, due date, repeat config.
- **Rewards shop:** gear, pets, custom rewards; inventory/equipment screens.
- **Party/Guild/Quest screens:** boss HP bar fed by group task completion; chat.
- UI metaphor consistent but "visually stuck in a 2018 aesthetic" per new-user reviews ([Unstar](https://unstar.app/blog/streaks-habitica-way-of-life-strides-habit-tracking-apps-ranked-2026)).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Habitica is the anti-template for XP-for-logging.** Its own review corpus shows points-incentivized logging corrupts the behavior (task-gaming). PersonalOS's "no XP for logging" constraint is directly validated — cite this app in the DecisionLog rationale.
2. **Custom rewards bought with progress** — PersonalOS has no XP, but a *manual* "reward milestone" (user-defined treat at goal % milestones) could be a non-XP motivational layer if ever wanted; low priority given the Coach constraint.
3. **Shared-quest damage as a group "won" moment** — irrelevant for single-user, but the *design lesson* (goal completion as a visible event with narrative) maps to PersonalOS's milestone-review "won" moment: make it an event, not a stat.
4. **Checklists-as-milestones** — the cheapest possible milestone implementation; PersonalOS's milestone entity should feel as light as a checklist while carrying targetValue.
5. **Difficulty setting** — a per-goal difficulty field that modulates expectations (not rewards) could inform plan-adherence weighting in PersonalOS.

---

# 8. Notion (goals & OKR via databases/templates)

**Sources:** [Notion OKR templates roundup 2025](https://www.notionapps.com/blog/best-notion-okr-templates-2025) · [Notion goal-tracking templates 2025](https://www.notionapps.com/blog/best-notion-templates-goal-tracking-2025) · [TemplatesForNotion — OKR setup tutorial](https://templatesfornotion.com/blog/goal-tracking-and-okrs-in-notion-free-okr-template) · [Notion Marketplace — OKR templates](https://www.notion.com/templates/category/okr-tracker) · [Notion Goal Tracking System template](https://www.notion.com/templates/goal-tracking-system-okrs-dashboard) · [GoalsAndProgress Notion review](https://goalsandprogress.com/best-goal-tracking-apps) · [Notion4Management](https://www.notion4management.com/blog/goal-tracking-in-notion) · [NotionApps offline guide](https://www.notionapps.com/blog/notion-offline-how-to-use-it-what-works-and-what-doesnt)

### 1. Overview
Notion is a workspace (docs+databases) with a template economy around goals/OKRs. Free for personal use (Plus $10/mo for teams) ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). "Notion rewards people who enjoy building systems, and punishes those who do not" — setup 30–60 min vs 5 min for dedicated apps ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). Offline: cache-based partial offline; not a true offline-first app ([NotionApps](https://www.notionapps.com/blog/notion-offline-how-to-use-it-what-works-and-what-doesnt)).

### 2. Core paradigm
**Databases as the goal model.** The dominant community pattern (dozens of templates, e.g. [NotionApps 20 OKR templates](https://www.notionapps.com/blog/best-notion-okr-templates-2025)) is: an *Objectives* database and a *Key Results* database, linked by **Relation**, with progress computed by **Formula** and **Rollup** properties. Goal → sub-goals (relations), milestones as checkboxes/pages, tasks as a third linked database.

### 3. Goal model (deep)
- **Canonical OKR schema** (from the standard tutorial): Key Results have properties **Title · Timeframe (Date) · Initial Value (Number) · Current Value (Number) · Target Value (Number) · Progress (Formula) · Quarter (Select)**; progress formula: `(Current − Initial) / (Target − Initial)` formatted as percent with a progress bar; Objectives have **Status (Select) · Progress (Rollup)** averaging the linked KRs ([TemplatesForNotion](https://templatesfornotion.com/blog/goal-tracking-and-okrs-in-notion-free-okr-template)). This formula is *the* reference math for PersonalOS goal progress %.
- **Views:** table grouped by team/quarter; Kanban grouped by status; **Timeline view** for deadlines; filtered views per quarter ([TemplatesForNotion](https://templatesfornotion.com/blog/goal-tracking-and-okrs-in-notion-free-okr-template)).
- **Templates with review built in:** some paid templates add "lesson recording for future reference" (Notion VIP OKRs $5), "milestone reflection" (Life OKR System €59.90, "integrates OKR, GTD, PDCA… 21 databases, 2 dashboards"), and goals-with-sub-goals (Notion's official free "Goals" template: "define each goal with priority, status, owner; break into sub-goals") ([NotionApps](https://www.notionapps.com/blog/best-notion-okr-templates-2025)).
- **Progress:** manual edits to Current Value; rollups auto-update objective/company levels. **No automatic progress from external data** without API scripting.
- **Milestones:** checkbox properties inside goal pages, or a linked Tasks database with a milestone tag.
- **Completion moment:** status Select flips to "Completed"; the win is a status change + archived row. The commonly cited gap: **no built-in review reminder** — recurring calendar alerts must be added by hand ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).

### 4. Task management
Tasks are a linked database (Title, Due, Status, Relation→Goal). No built-in "today" view — you build a filtered view (`Due = today`). No cadence engine. Kanban/board views make tasks feel like Trello. Notion's task layer is as good as you build it ([NotionApps](https://www.notionapps.com/blog/best-notion-templates-goal-tracking-2025)).

### 5. Gamification & motivation
None natively. Motivation is external: the dashboard's progress bars and the satisfaction of a maintained system. The "Goals and OKR Tracker" template ships **no review reminder** — consistent with the ecosystem verdict that *the review cadence is the missing product* ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).

### 6. Integration patterns
Notion API (read/write), webhooks via automations, calendar sync via two-way connected calendars, strong export (Markdown/CSV/PDF), Notion AI (summarize progress notes, draft next steps) ([NotionApps](https://www.notionapps.com/blog/best-notion-okr-templates-2025), [GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). Relations/rollups are the integration pattern *inside* the app.

### 7. GUI layout (deep)
- **Goal tracker template:** a table with columns Status / Priority / Owner / Deadline / Progress bar (formula); rows expand into pages with sub-goals and linked tasks ([NotionApps](https://www.notionapps.com/blog/best-notion-okr-templates-2025)).
- **OKR dashboard:** top section = objectives with rollup bars; each objective expands to its KRs with individual progress bars; KR page shows the formula bar and a notes/history section ([TemplatesForNotion](https://templatesfornotion.com/blog/goal-tracking-and-okrs-in-notion-free-okr-template)).
- **Timeline view:** KRs as bars on a date axis — the deadline visualization of choice in templates.
- **Kanban view:** goals grouped by Status (Not Started / In Progress / Completed) — e.g. Notion's official Goal Tracker and Goals templates ([NotionApps](https://www.notionapps.com/blog/best-notion-templates-goal-tracking-2025)).

### 8. Differentiators & steal-worthy features for PersonalOS
1. **The Initial/Current/Target + formula progress model** — PersonalOS goal progress % should use exactly `(current − initial)/(target − initial)`, with initial auto-seeded from the weight ladder / strength standards at goal creation. This is the industry-standard math (also used by Gtmhub and Weekdone).
2. **Rollup: objective progress = average of KR progress** — the canonical way to aggregate milestone progress into goal progress; PersonalOS goal = average of its milestones, per the locked design.
3. **Review cadence as the missing product.** Every Notion review flags the absent review reminder — PersonalOS's milestone review at goal end is exactly this gap, solved.
4. **Status as a first-class Select with visual color** — Not Started / In Progress / Completed is a stable state machine; PersonalOS adds Won/Expired terminal states on top.
5. **Deadline visibility via Timeline view** — supports the "rings on calendar" decision: the deadline must be visible on a date surface, not just inside the goal.

---

# 9. Weekdone (OKR + weekly check-ins)

**Sources:** [weekdone.com](https://weekdone.com/) · [Weekdone Product features](https://weekdone.com/product) · [Weekdone Pricing](https://weekdone.com/prices) · [SoftwareFinder review](https://softwarefinder.com/project-management-software/weekdone) · [Capterra OKR listing](https://www.capterra.com/okr-software) · [Baserow OKR roundup 2025](https://baserow.io/blog/best-okr-software-tools-reviewed) · [Entelligence engineering-OKR roundup 2025](https://entelligence.ai/blogs/best-okr-software-engineering-teams) · [GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps) · [TrustRadius](https://www.trustradius.com/products/weekdone/reviews)

### 1. Overview
OKR software "market leader since 2013" for SMBs (10–1000 employees); quarterly OKRs + weekly progress reporting ([weekdone.com](https://weekdone.com/), [Capterra](https://www.capterra.com/okr-software)). Free up to 3 users (all features); paid per-seat (e.g. ~$2,025/mo at 401–450 people; individual pricing around $108/mo tier per TechImply) ([weekdone.com/prices](https://weekdone.com/prices), [SoftwareFinder](https://softwarefinder.com/project-management-software/weekdone)). Web + mobile apps. 4.5★ aggregate (51 reviews, 92% positive) ([SoftwareFinder](https://softwarefinder.com/project-management-software/weekdone)).

### 2. Core paradigm
**Two rhythms bolted together:** quarterly OKRs (Objectives ↔ Key Results, aligned company→department→team→personal in a hierarchy) and **weekly check-ins** (Plans / Progress / Problems — the "PPP" format), with projects/tasks linkable under OKRs ([weekdone.com/product](https://weekdone.com/product)). The weekly cadence is the product's spine: "Get a regular pulse on employee plans, progress, thoughts" ([weekdone.com](https://weekdone.com/)).

### 3. Goal model (deep)
- **Creation:** OKR Wizard + sample data for guidance; annual and quarterly OKRs; moonshot & roofshot goal types ([weekdone.com/product](https://weekdone.com/product)).
- **Target definition:** KRs are numeric with start/target values; setting one up = name the KR, attach start and target value ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Progress:** the weekly check-in screen asks you to **move each KR's percentage and mark it on/off track** — the on/off-track flag is a first-class field, not derived ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)). Progress auto-rolls up the hierarchy (auto-colored OKR progress in dashboards) ([weekdone.com/product](https://weekdone.com/product)).
- **Milestones:** projects/initiatives linked under OKRs act as milestones; visual project status tracking ([weekdone.com/product](https://weekdone.com/product)).
- **Completion moment:** quarterly cycle close + automated reports; no celebration layer.

### 4. Task management
Weekly planning form (custom templates, prioritization); assign projects & tasks to employees; link tasks/projects under OKRs; weekly personal calendar views; notifications to keep check-ins coming ([weekdone.com/product](https://weekdone.com/product)). This is a *reporting* task system, not a GTD system.

### 5. Gamification & motivation
**The cadence is the motivation**: kudos/upvotes on check-ins, praise & feedback (CFR — Conversations/Feedback/Recognition), 5-star pulse ratings, and public progress visibility ([weekdone.com](https://weekdone.com/), [weekdone.com/prices](https://weekdone.com/prices)). No streaks/XP — social recognition replaces game mechanics. The weekly check-in "keeps OKRs visible instead of forgotten" — the anti-abandonment mechanism is structural (a recurring form), not emotional ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).

### 6. Integration patterns
Slack, MS Teams, Jira, Asana, Basecamp, Google Tasks, 1,500+ via Zapier, SSO, API; weekly email digests; TV dashboard slideshows ([weekdone.com/prices](https://weekdone.com/prices), [SoftwareFinder](https://softwarefinder.com/project-management-software/weekdone)). GDPR, EU storage ([weekdone.com/prices](https://weekdone.com/prices)).

### 7. GUI layout (deep)
- **OKR hierarchy / Tree / Overview views** — "see a complete overview of goals with auto-colored OKR progress"; tree view = inline edit + export ([weekdone.com/product](https://weekdone.com/product)).
- **Weekly check-in form:** per-KR percentage slider + on/off-track toggle + PPP text fields; dated record, scanable next week ([GoalsAndProgress](https://goalsandprogress.com/best-goal-tracking-apps)).
- **Dashboards:** company/department/team/person views, KPI and weekly-progress dashboards, TV dashboard mode ([weekdone.com/product](https://weekdone.com/product)).
- **Feedback feed:** social newsfeed of kudos and check-ins.

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Per-KR percentage + on/off-track flag as the weekly review unit** — PersonalOS's plan adherence per-slot % is this exact mechanic, automated: each plan slot gets a % (computed) and an on/off-track flag (derived), reviewed at milestone boundaries.
2. **The weekly review as a built-in form, not a reminder** — the "review cadence is the product" lesson from Notion, industrialized. PersonalOS's Coach tie-in ("goal slip >20% → adjust-plan suggestion") is Weekdone's weekly re-plan loop, made automatic and facts-only.
3. **PPP (Plans / Progress / Problems)** — a minimal structured check-in; the personal analog is PersonalOS's milestone review: what did I plan (per-slot %), what happened (derived), what blocked (one-line reflection).
4. **Moonshot/roofshot goal types** — a two-tier ambition model that maps nicely to PersonalOS goal kinds (generic vs measured).
5. **Rollup hierarchy (company→team→personal)** — validates the relation/rollup aggregation pattern; PersonalOS only needs one level (goal→milestones), so the takeaway is: compute progress at the leaf, roll up, never store derived numbers.

---

# 10. Gtmhub → Quantive (data-connected OKRs) — acquired by WorkBoard

**Sources:** [GrowthEngineer profile](https://growthengineer.ai/startups/gtmhub) · [HelloStack review](https://hellostack.io/okrs/gtmhub) · [SaaSworthy listing](https://www.saasworthy.com/product/gtmhub) · [FinancesOnline review](https://reviews.financesonline.com/p/gtmhub/) · [Baserow roundup (Quantive)](https://baserow.io/blog/best-okr-software-tools-reviewed) · [DecideSoftware](https://decidesoftware.com/gtmhub/) · [Softwarereview.com](https://softwarereview.com/gtmhub)

### 1. Overview
Enterprise OKR/strategy platform founded 2015 (Denver), **rebranded Quantive Dec 2022, acquired by WorkBoard May 2025** — no longer operating independently ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)). Raised $161M (most in the category); served 500k+ users in 75+ countries (Adobe, Red Hat, Experian, Société Générale) ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)). Pricing tiers: Start $1, Scale $5, Summit $12 per user/month ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)).

### 2. Core paradigm
OKRs **with data at the center**: "At the center of Gtmhub is a powerful data platform, connecting your existing business systems and data sources with the goals" ([DecideSoftware](https://decidesoftware.com/gtmhub/)). Strategy cascades company→team→individual; 150+ integrations (CRM, ERP, warehouses, analytics) ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)).

### 3. Goal model (deep)
- **Automatic progress from data — the headline feature:** "Key results automatically update based on real-time business data, eliminating manual status updates" ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)); "automatically update their objectives and key results within Gtmhub using information coming from the other tools" ([FinancesOnline](https://reviews.financesonline.com/p/gtmhub/)). This is the only product in this cluster where goal progress is *earned by data, not entered by humans*.
- Target = numeric KR (start/target/current); progress % computed; dashboards real-time; "pivot strategy within days rather than waiting for quarterly reviews" ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)).
- Milestones: initiatives/projects under OKRs; no milestone-review ceremony (enterprise product).
- Completion: cycle close; reporting.

### 4. Task management
None of note — it ingests from Jira/Asana/etc. rather than hosting tasks ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)).

### 5. Gamification & motivation
Zero game mechanics; motivation = real-time visibility and alignment ("see exactly how their OKRs connect to company-wide success metrics"). Anti-abandonment = automated updates (goal never goes stale because someone forgot to type a number) ([GrowthEngineer](https://growthengineer.ai/startups/gtmhub)).

### 6. Integration patterns
150+ business-system integrations for automated KR updates; Slack/Jira/Salesforce/Okta/Google Analytics etc.; API; feedback topics with colleagues ([FinancesOnline](https://reviews.financesonline.com/p/gtmhub/), [HelloStack](https://hellostack.io/okrs/gtmhub)).

### 7. GUI layout (deep)
- **Real-time dashboards** of strategic priorities, cross-department progress, KPI/OKR status ([HelloStack](https://hellostack.io/okrs/gtmhub)); OKR tree/cascade views; KR cards showing auto-updated values with trend.
- Strategy tree = the main navigation; drill from company OKR to team KR to data source.

### 8. Differentiators & steal-worthy features for PersonalOS
1. **Automatic goal progress from connected data (the single most relevant feature in this whole cluster).** Gtmhub proved at enterprise scale that when a goal's progress comes from the user's real data streams, the goal can't go stale and can't be gamed. PersonalOS's weight goals auto-advance from the weight ladder and strength goals from strength standards — this is Gtmhub's model, single-user, offline.
2. **"Pivot within days, not quarters"** — Gtmhub's speed-of-course-correction argument is exactly PersonalOS's Coach "adjust-plan suggestion at >20% slip": the goal system should surface drift immediately, from data, not at review time.
3. **Goals never stale** — an anti-abandonment property derived from automation rather than psychology; PersonalOS milestone reviews are triggered by data thresholds, not by the user remembering to review.
4. **Enterprise viability evidence:** even heavyweight enterprise users needed automatic progress — the manual-% weekly update of Weekdone was the compromise Gtmhub out-engineered. PersonalOS should skip manual % entirely (constraint: derived-only stats).

---

# 11. "Goals by Google" — status: DEAD (post-mortem)

**Sources:** [FlowSavvy — Google Calendar Goals post-mortem](https://flowsavvy.app/best-google-calendar-goals-alternative) · [Killed by Google graveyard](https://killedbygoogle.com/) · [9to5Google — Area 120 history](https://9to5google.com/guides/area-120/) · [Android Police — Area 120](https://www.androidpolice.com/tag/area-120/) · [9to5Google — Tables/Area 120](https://9to5google.com/2021/06/11/google-tables-area-120-cloud) · [ExtremeTech — Tables shutdown](https://www.extremetech.com/computing/google-to-shut-down-project-tracking-app-in-december-2025) · [Reddit backlash thread](https://www.reddit.com/r/google/comments/wkpud2/google_calendar_goals_going_away/) (quoted in FlowSavvy)

### 1. Overview — verification of current state
There is **no standalone "Goals by Google" app in existence today** (2026). The name most plausibly refers to **Google Calendar "Goals"** (launched ~2016), a feature that let you say "exercise 3×/week" and had the calendar **auto-schedule the sessions** around your real events, dynamically rescheduling when conflicts arose. Google **removed it in November 2022**, telling users to use recurring events instead ([FlowSavvy](https://flowsavvy.app/best-google-calendar-goals-alternative)). The other Google goal-adjacent experiments (Area 120's Tables — a work-tracking grid, and Keen/Stack etc.) are all dead: Area 120 was wound down in the 2022–23 reorganization; Tables (promoted to Google Cloud in 2021) was shut down Dec 16, 2025 with migration to Sheets/AppSheet ([9to5Google](https://9to5google.com/2021/06/11/google-tables-area-120-cloud), [ExtremeTech](https://www.extremetech.com/computing/google-to-shut-down-project-tracking-app-in-december-2025), [rip.so](https://rip.so/google-tables.html)). Google Tasks/Keep offer no goal tracking. **Conclusion: Google has no live goal-tracking product; the auto-scheduling "Goals" concept is dead.**

### 2. Core paradigm (as it was)
Goals were **frequency commitments auto-scheduled into your calendar**: pick a goal (e.g. "learn French"), a cadence (3×/week), preferred times, and Calendar placed and re-placed the sessions ("If a conflict arose, the goal would be automatically shifted to another time") ([FlowSavvy](https://flowsavvy.app/best-google-calendar-goals-alternative)).

### 3–5. Goal model / tasks / gamification
Goal = recurring time block; progress = showing up (Calendar marked the session done when it passed); no numeric targets, no milestones, no gamification. Slip handling = automatic rescheduling — the grace mechanic was total (the goal always found a new slot, so nothing was ever "missed") ([FlowSavvy](https://flowsavvy.app/best-google-calendar-goals-alternative)).

### 6. Integration patterns
Deep calendar integration by definition; later, learning from usage patterns to suggest better times; tied to Google Assistant flows ([FlowSavvy](https://flowsavvy.app/best-google-calendar-goals-alternative)).

### 7. GUI layout
A "Goals" section in Calendar's sidebar/app; goal cards with cadence and preferred-time pickers; sessions appeared as shaded blocks on the calendar grid; long-press to complete/skip a session.

### 8. Differentiators & steal-worthy lessons for PersonalOS
1. **Death by low adoption + product focus:** Google killed Goals when Calendar became a workplace product and usage was niche ("largely based on how many users make use of… these niche tools") ([FlowSavvy](https://flowsavvy.app/best-google-calendar-goals-alternative), [ChromeUnboxed](https://chromeunboxed.com/google-calendar-goals-feature-removal)). Lesson: goal tracking must live where the user's data lives (PersonalOS: the app itself), and must serve the app's core loop — not be a bolt-on.
2. **Auto-scheduling is a trap for a passive, offline app.** Dynamic rescheduling was the loved feature (Reddit backlash: "the fact that it schedules things around gigs and events made it so I didn't have to think about it") — but it's also heavy machinery with no data source in a single-user app. PersonalOS should NOT auto-schedule; instead it should *suggest* next plan slots from adherence (Coach, facts-only) — the non-autonomous version.
3. **The grace-by-design insight survives:** Google's goals could never be "missed" (always rescheduled) — an extreme version of the 2-Day Rule. PersonalOS's slip handling sits between the two: finite grace (Streaks' 2-day rule) rather than infinite rescheduling.
4. **Recurring-events migration was a downgrade users resented** — evidence that *frequency commitments* are a real need that plain tasks don't satisfy; PersonalOS's plan slots (per-slot %) are the modern, data-driven version of that need.

---

# Cross-cutting synthesis for PersonalOS M5 (what to steal, mapped to the locked design)

**Automatic progress from data (weight/strength goals)** — Gtmhub §10.1 + Streaks/HealthKit §3.3 + Notion formula §8.3. Progress % = `(current − initial)/(target − initial)` with initial seeded from the weight ladder / strength standards at creation; current pulled from logged body weight / top lifts. Manual progress entry should not exist for kind=weight|strength (constraint: derived-only stats).

**Goal pace vs plan (adherence) + F1 projections** — Strides Pace Line §1.3. The straight line from initial to target across the deadline, drawn against actuals; F1 projection = extrapolate current trend to the deadline; adherence = actual-vs-pace per slot. Color-code on/off pace everywhere (amber drift before red).

**Slip/expiry handling without shame** — Streaks 2-Day Rule §3.5 + Way of Life yellow-skip §2.5 + Loop's decay-not-destroy habit score (adjacent). One window of grace per goal/milestone; skip ≠ missed; after grace, "expired: window closed" with a neutral, facts-only review prompt. Never "failed", never streak-shame, never XP.

**Milestone review at goal end (won: target hit + one-line reflection; expired: window closed)** — Things 3 Logbook §6.3 + Weekdone PPP weekly form §9.5 + Notion lesson-recording templates §8.3. Won = congrats event (Strides popup §1.3) + one-line reflection prompt (journal-adjacent); expired = closed window with what-happened/what-blocked; both land in a permanent archive. Facts-only Coach reads these.

**Deadline visualization (rings on calendar cells)** — Strides Milestone Calendar §1.7 + TickTick task+habit-on-day-cells §5.7 + Things 3 Upcoming strip §6.7 + Notion Timeline §8.7. The ring is the milestone/deadline marker on the day cell; plan-slot adherence renders inside the goal, not on the calendar.

**Plan adherence per-slot % + Coach adjust-plan suggestion at >20% slip** — Weekdone §9.3 (per-KR % + on/off-track + weekly re-plan loop) + Gtmhub §10.2 (pivot fast, from data). Per-slot adherence is computed; when goal-level adherence slips >20%, Coach suggests a plan adjustment — Weekdone's weekly review, automated and made facts-only (no shame, no guilt).

**Anti-patterns to avoid (evidence-backed):** XP-for-logging corrupts behavior (Habitica §7.5, Todoist karma §4.5); streak-reset shame drives abandonment (Streaks §3.5, Unstar review data); goal tracking as a disconnected silo dies (ClickUp's critique §1.6, Google Goals §11.8); manual progress entry makes goals go stale (Gtmhub §10.8); review cadence must be built in, not reminded (Notion §8.8).

---

*All prices, version numbers, and statuses verified against sources as of 2026-08-29; conflicting reports (e.g. Strides free-tier cap, Way of Life premium model) are noted per-section.*