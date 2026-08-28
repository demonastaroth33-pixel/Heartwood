# Gym Loggers & Strength Trackers — Deep Research (2026)

**Cluster:** Strong, Hevy, JEFIT, FitNotes, Progression, Boostcamp, Personal Training Coach (PTC), KeyLifts, Workout Builder (Polemics).
**Purpose:** Input for PersonalOS M2 fitness milestone — a private, single-user, offline-first Flutter PWA gym logger (sets×reps, Epley est-1RM, seeded exercise lookup, PR detection, records vault, standards, deloads, volume floors, phases, comparison, return ramp). This report captures what the best-in-class consumer apps actually do, with a heavy focus on concrete GUI layout (section 7) and which ideas are worth stealing for a **private offline-first** logger (section 9).
**Note on scope:** Fitbod is covered by another cluster; it is only referenced for comparison here.

---

# 1. Strong — "Workout. Notebook. Reinvented."

## 1. Overview
- Positioning: the archetypal **minimalist, routine-based strength logger**. Launched 2014; `strong.app` self-reports 5M+ users, 30M+ workouts, 4.9★ (125K App Store reviews), 4.9★ Google Play. Described as "the Toyota Camry of workout trackers" — reliable, fast, no AI, no social, no nutrition. (https://www.strong.app/, https://prpath.app/blog/strong-app-review-2026.html)
- Platform: iOS + Android + a rebuilt Apple Watch app (v6.2, March 2026) and Wear OS. No web app (teased, not shipped as of April 2026). (https://prpath.app/blog/strong-app-review-2026.html)
- Pricing: Free tier capped at **3 custom routines/templates**; Strong PRO $4.99/mo, $29.99/yr, lifetime "PRO Forever" ~$99.99 (regional legacy prices $79.99). No ads in core flow. (https://apps.apple.com/us/app/strong-workout-tracker-gym-log/id464254577, https://prpath.app/blog/strong-app-review-2026.html)
- Philosophy: "doesn't generate programs — you bring the program" (routine model). It's a **log, not a coach**. (https://www.corahealth.app/compare/strong)

## 2. Core paradigm
- **Routine/template-first:** you build named workout templates (e.g. "Push Day"), then each session is "start from template." You can also "Start Empty Workout" and add exercises on the fly. (https://help.strongapp.io/article/105-about-templates, https://help.strongapp.io/article/229-my-first-workout)
- A session = an ordered list of exercises, each with one or more sets. Sets are **completed by tapping a checkbox**; completed sets trigger the rest timer. (https://help.strongapp.io/article/229-my-first-workout)
- Rest timer: built-in Auto Countdown timer to record rest breaks; rest timer **auto-starts when you complete a set**; notifications when it finishes. (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/, https://prpath.app/blog/strong-app-review-2026.html)
- Supersets / grouped exercises supported; exercises can be grouped so two movements appear together. (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/)
- No auto-advance in the "wizard" sense; you tap through sets yourself. "Opening a session, logging sets, and moving on takes seconds." (https://www.corahealth.app/compare/strong)
- Apple Watch can log sets, run rest timers, and track the workout **without the phone** — "one of the best in the category." (https://www.corahealth.app/compare/strong)

## 3. Compose / logging model
- Set entry: weight × reps entered per set, then **checkbox to complete**. Set types: tag sets as **Warm Up, Failure, or Drop Sets** (drop sets auto-log the weight drop). (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/, https://help.strongapp.io/category/165-logging-a-workout)
- Exercise types: strength (weight×reps), **Assisted Bodyweight** and **Duration** exercise types — bodyweight/duration exercises are first-class citizens (relevant to PersonalOS's rep-mode/no-cap rule). (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/)
- **Plate Calculator** (PRO) shows which plates to load for a target weight; **Warm-up Calculator** (PRO) generates a ramp of warm-up sets from your working weight. (https://help.strongapp.io/category/165-logging-a-workout, https://prpath.app/blog/strong-app-review-2026.html)
- Add/delete sets: "Add Set" button per exercise; **swipe-to-delete** a set; drag-and-drop to reorder exercises. (https://help.strongapp.io/article/229-my-first-workout)
- Exercise picker: built-in library (~700 exercises) + create custom exercises; exercise instructions with a growing library of **animated videos**. (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/)
- Metric/imperial toggle; historical data auto-converts when you switch units (a frequently cited power-user win). (https://apps.apple.com/us/app/strong-workout-tracker-gym-log/id464254577)

## 4. Organization
- **Folders of routines** ("+Template" inside a folder); free tier caps at 3 templates, PRO unlimited. Save any performed workout "as Template" from History; or prompted to save at end of a session. Templates are distinct from workouts: no completion checkboxes, no rest timer, no date. (https://help.strongapp.io/article/105-about-templates)
- No programs/splits engine, no periodization, no deload planner — "No advanced programming tools." (https://prpath.app/blog/strong-app-review-2026.html)

## 5. Progress & analytics
- **PR detection surfaces in real time during a session** with satisfying animations; detailed PR history per exercise (all-time best per lift, progression over months). (https://www.corahealth.app/compare/strong, https://prpath.app/blog/strong-app-review-2026.html)
- Advanced Statistics: personal records, progression, **1RM calculation** (est-1RM), and total weight lifted. (https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/)
- Volume tracking (weight×reps) per exercise, per workout, per muscle group. Graphs for **Volume and 1RM Progression**; PRO adds more chart types and time filtering. (https://prpath.app/blog/strong-app-review-2026.html, https://setgraph.app/ai-blog/hevy-vs-strong)
- Body measurements (weight, body fat, custom); PRO adds progress photos. (https://prpath.app/blog/strong-app-review-2026.html)
- Analytics described as "functional but basic compared to newer apps." (https://prpath.app/blog/strong-app-review-2026.html)

## 6. Standards / periodization
- **None built in.** No program generator, no progression schemes, no auto-weight suggestion. "Strong won't create workouts for you; you build your own templates." (https://prpath.app/blog/strong-app-review-2026.html, https://www.corahealth.app/compare/strong)

## 7. GUI layout (deep detail)
- **Start Workout tab:** list of saved templates + "+Template" button and folders; "Empty Workout" option. Clean native iOS aesthetic (ScreensDesign has a UI breakdown of the log screen: https://screensdesign.com/showcase/strong-workout-tracker-gym-log).
- **Log Workout screen (the heart of the app):** scrollable vertical list of exercises. Each exercise is a **card** with:
  - Exercise name at top (drag-handle for reorder).
  - Below it a table of set rows: columns for **set #, weight, reps, and a circular checkbox** (tap-to-complete).
  - "+ Add Set" under the table; swipe a row to delete.
  - A rest-timer pill near the top of the exercise that auto-starts a countdown when a set is checked; on-screen + Live Activity/Dynamic-Island style notification when rest ends (Apple Watch mirrors this).
  - "Add Exercises" button to append more movements from the library or custom picker mid-session.
  - **Finish** button top-right ends the session (partial workouts OK) and stores it in History. (https://help.strongapp.io/article/229-my-first-workout, https://prpath.app/blog/strong-app-review-2026.html)
- **History tab:** chronological list of past sessions; open any session to edit it later; save-as-template; share. (https://help.strongapp.io/article/105-about-templates, https://help.strongapp.io/category/165-logging-a-workout)
- **Charts:** per-exercise volume and e1RM line graphs; PR history grid. Mobile-first, thumb-reachable; dark mode via system. (https://prpath.app/blog/strong-app-review-2026.html, https://setgraph.app/ai-blog/hevy-vs-strong-app-comparison-2026)
- Overall: dense but minimal; "more buttons and menus than Hevy, has a learning curve but rewards investment." (https://setgraph.app/es/ai-blog/hevy-vs-strong-app-comparison-2026)

## 8. Export / backup
- Cloud Sync for account backup (free tier syncs too). CSV export exists; "CSV and backup tools" cited as a Strong differentiator vs Hevy's "basic export." (https://setgraph.app/es/ai-blog/hevy-vs-strong-app-comparison-2026, https://prpath.app/blog/strong-app-review-2026.html)
- Hevy offers **direct import of Strong CSV files** — evidence that Strong's CSV is the de-facto interchange format in the category. (https://www.sensai.fit/blog/hevy-review-2026)

## 9. Differentiators & steal-worthy features
- **The checkbox-complete set row** is the canonical fast logging pattern (set table + tap-to-complete + auto rest timer). **Why:** fastest possible in-session UX; PersonalOS logging screen should mirror this exact anatomy.
- **Plate Calculator + Warm-up Calculator.** **Why:** removes mental math; warm-up calculator is directly relevant to PersonalOS's "post-deload return ramp" (generate ramp sets from working weight).
- **PR surfaced live during the session with animation.** **Why:** matches PersonalOS "strictly greater, once per session" PR detection; the delight moment is the point.
- **Metric↔imperial auto-conversion** of all history. **Why:** offline-first single-user app should treat unit switching as a first-class, lossless operation.
- **Assisted-bodyweight & duration exercise types.** **Why:** validates PersonalOS's "bodyweight/rep-mode exercises have no cap" design — the logger must support exercises that have no weight axis.
- **Folder-organized templates.** **Why:** cheap, powerful organization for a growing template library without a heavy program engine.

---

# 2. Hevy — "#1 Workout Tracker & Gym Log"

## 1. Overview
- Positioning: modern, fast, **social-first** strength logger ("Instagram met a workout tracker"); huge free tier; self-reports **15+ million athletes**, 4.9★ on both stores. (https://www.hevyapp.com/, https://prpath.app/blog/hevy-app-review-2026.html)
- Platform: iOS, Android, **Web app**, Apple Watch, Wear OS. (https://setgraph.app/es/ai-blog/hevy-vs-strong-app-comparison-2026)
- Pricing: Free (unlimited logging; caps: 4 saved routines, 3 months history, 7 custom exercises); Pro $2.99/mo, $23.99/yr, **$74.99 lifetime** — cheapest paid tier in category. (https://www.sensai.fit/blog/hevy-review-2026, https://prpath.app/blog/hevy-app-review-2026.html)
- 2026 additions: **Hevy Trainer** (Feb 2026, algorithmic program generator with auto weight progression), **HevyGPT** (custom GPT that can read your training history), Hevy Coach (coach-side platform). (https://prpath.app/blog/hevy-app-review-2026.html, https://www.sensai.fit/blog/hevy-review-2026)

## 2. Core paradigm
- **Template ("routine") model:** create named routines (folders supported, "Routine Library" with community-created programs to fork), or "Start Empty Workout." Logging flow: select exercise → input weight/reps → **tap checkmark on the right of each set** → moves to next. ~15s per set claimed. (https://www.hevyapp.com/use-cases/strength-training-app/, https://prpath.app/blog/hevy-app-review-2026.html)
- **Automatic rest timer** per exercise: appears near top of each movement below the notes; 5s–5min range; **auto-triggers when you complete a set**; notify when done; **±15-second adjust buttons** mid-session; global "Default Rest Timer" setting (Profile → Settings → Workouts). Timer can be set to "off." (https://www.hevyapp.com/features/workout-rest-timer/)
- **Supersets, drop sets, warm-up sets, failure sets, RPE** all supported; set types labeled. (https://www.hevyapp.com/features/, https://www.hevyapp.com/features/workout-set-types/)
- Live Activity / Dynamic Island shows in-progress workout; home-screen widgets. (https://www.hevyapp.com/features/live-activity/, https://www.hevyapp.com/features/home-screen-widgets/)

## 3. Compose / logging model
- Set entry: weight × reps with previous-session values shown inline (**"Previous Workout Values"**) — color-coded vs your last session. (https://www.hevyapp.com/features/track-exercises/, https://prpath.app/blog/hevy-app-review-2026.html)
- **Weight Plate Calculator** and **Warm-Up Set Calculator** (free). (https://www.hevyapp.com/features/weight-plate-calculator/, https://www.hevyapp.com/features/warm-up-set-calculator/, https://www.hevyapp.com/best-workout-tracker-app/)
- **RPE logging** (free). **Set types**: warm-up, working, failure, drop sets. (https://www.hevyapp.com/features/how-to-calculate-rpe/, https://www.hevyapp.com/features/workout-set-types/)
- Exercise library ~400–700; animated exercise videos; **custom exercises** (7 free / unlimited Pro); exercise notes per movement. (https://www.hevyapp.com/use-cases/strength-training-app/, https://www.hevyapp.com/features/exercise-library/)
- Mark set complete via **right-hand checkmark** — the canonical interaction. (https://www.hevyapp.com/use-cases/strength-training-app/)

## 4. Organization
- **Folders + Gym Routines** to group templates; community **Routine Library** to import others' routines; 12 workout settings (defaults: rest timer, RPE on/off, etc.). (https://www.hevyapp.com/features/gym-routines/, https://www.hevyapp.com/features/workout-settings/)
- No true periodization engine; **Hevy Trainer** (Pro) generates plans algorithmically and auto-progresses weights from logged performance — but does NOT take sleep/HRV/readiness as inputs. (https://www.sensai.fit/blog/hevy-review-2026)

## 5. Progress & analytics
- **Live PR notifications** the moment you hit a new best (free). (https://www.hevyapp.com/features/live-pr/)
- **Gym Performance / exercise performance**: per-exercise trends; muscle distribution chart; **sets per muscle group per week** chart; monthly report; **Year in Review** recap; consistency streaks; body measurements + progress photos. (https://www.hevyapp.com/features/, https://www.hevyapp.com/features/sets-per-muscle-group-per-week/, https://www.hevyapp.com/features/monthly-report)
- Volume calculations automatic and visual (total volume lifted, graphical representation). (https://www.hevyapp.com/use-cases/strength-training-app/, https://prpath.app/blog/hevy-app-review-2026.html)
- Free tier limits history charts to 3 months; Pro unlocks full graph history. (https://www.sensai.fit/blog/hevy-review-2026)

## 6. Standards / periodization
- No built-in 5x5/5/3/1 schemes; **Hevy Trainer** = algorithmic program generator (Pro) with auto weight progression, launched Feb 2026. Free tier gets community programs from the Routine Library (incl. popular splits as templates). (https://prpath.app/blog/hevy-app-review-2026.html, https://www.sensai.fit/blog/hevy-review-2026)

## 7. GUI layout (deep detail)
- **Tab bar:** Home/Log, Routines, (Discover/Community feed), Statistics, Profile. Clean modern UI; "minimal and clean, good for beginners." (https://setgraph.app/es/ai-blog/hevy-vs-strong-app-comparison-2026)
- **Live workout screen:** stacked exercise cards. Each card: exercise name, **rest timer pill** + note field at top, then set rows each with weight / reps inputs and a **checkmark button on the right**; a small "last session" comparison line (e.g. "Last: 100kg × 5") rendered under the exercise or inline; set-type badge per row (W, D, F); + Add Set; + Add Exercise; swap exercise mid-session. "input the number of sets and reps, then add the weight of each set. Once completed, tap the checkmark on the right-hand side." (https://www.hevyapp.com/use-cases/strength-training-app/, https://www.hevyapp.com/features/workout-rest-timer/)
- **Routines tab:** folder list of named templates; template editor sets exercises, set/rep targets, rest timers per exercise; fork from library. (https://www.hevyapp.com/features/gym-routines/)
- **Statistics tab:** muscle-group donut/bar distribution, sets-per-muscle-per-week bars, exercise performance lines, body weight graph, streak/consistency calendar. (https://www.hevyapp.com/features/gym-progress/, https://www.hevyapp.com/features/training-chart/)
- Social layer folds away if unused — behaves like a private notebook (important precedent for a privacy-first app). (https://www.sensai.fit/blog/hevy-review-2026)
- Dark mode via system theme; web app for desktop browsing/history.

## 8. Export / backup
- **Cloud backup** included free; export workouts & measurements; **imports direct Strong CSV files** (and general CSVs from other apps) — explicitly positioned as reducing lock-in. (https://www.sensai.fit/blog/hevy-review-2026)
- Shares workouts to social/Strava; summary illustrations/photo cards exportable. (https://www.hevyapp.com/best-workout-tracker-app/)

## 9. Differentiators & steal-worthy features
- **Inline "previous session" comparison with color-coded PR indicators during logging.** **Why:** the single highest-leverage progressive-overload UX; PersonalOS should render last-session weight/reps next to the input and flag new PRs live.
- **±15s rest-timer micro-adjust + per-exercise rest defaults.** **Why:** matches real gym behavior (felt fatigue); cheap to build, high value.
- **Sets-per-muscle-group-per-week chart.** **Why:** directly analogous to PersonalOS's "weekly volume floors per muscle group" (MRV-style) — the same data viz proves whether floors are met.
- **Warm-Up Set Calculator + Plate Calculator free.** **Why:** both map to PersonalOS return-ramp and plate math.
- **Routine Library (fork others' programs) with folders.** **Why:** gives a seeded template ecosystem without building a program engine; PersonalOS could seed ~44 lifts with a few default templates instead.
- **Year in Review / monthly reports.** **Why:** cheap, motivating, derived-only stats that fit PersonalOS's "derived stats only" constraint.

---

# 3. JEFIT — Workout Planner, Gym App

## 1. Overview
- Positioning: the **feature-depth / exercise-database king**: 1,400+ exercises with HD video/animations, thousands of community plans, and (since 2026) an AI progressive-overload engine. 10M+ users; 4.7–4.8★ across stores. (https://justuseapp.com/en/app/449810000/jefit-workout-planner-gym-log/reviews, https://www.jefit.com/)
- Platform: iOS, Android, **web**, Apple Watch (watch app historically buggy per reviews). (https://apps.apple.com/hu/app/jefit-gym-workout-planner/id449810000, https://getbraceai.com/reviews/jefit/)
- Pricing: Free with ads; **Elite ~$9.99–$13/mo or ~$39.99–$69.99/yr** (region-dependent; ~$3.33/mo annual UK). Elite = ad-free + full analytics + advanced programming. (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/, https://getbraceai.com/reviews/jefit/)
- 2026 v17 era: introduced **Adaptive Plan, AI Progressive Overload, NSPI score, Adaptive Mesocycle Training** (Elite). (https://prpath.app/blog/best-progressive-overload-trackers-2026.html)

## 2. Core paradigm
- **Routine-driven logging:** build routines (days of exercises), then log sets/reps/weight during a session. Rest timer with **auto-start** when you complete a set. (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/)
- Offline logging supported; syncs when back online (useful for basement gyms). (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/)
- Programs: 850+ pre-built plans in a community marketplace, importable with one tap; plus full custom routine builder. (https://prpath.app/blog/best-progressive-overload-trackers-2026.html)

## 3. Compose / logging model
- Standard weight×reps set rows; **plate calculator** (Elite); set labels (warm-up/working/drop); supersets; rest timer. (https://prpath.app/blog/best-progressive-overload-trackers-2026.html, https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/)
- Huge exercise picker with animated demos and muscle-group tagging; custom exercises supported; each exercise logs to muscle-group analytics automatically. (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/)
- Complaints in reviews: first set sometimes not saved (Apple Health sync bugs); interval timer lost audio cue; clunky custom-exercise creation flow. (https://justuseapp.com/en/app/449810000/jefit-workout-planner-gym-log/reviews)

## 4. Organization
- Deep routine builder with bodybuilding-style splits; **muscle-group heatmaps** showing which muscles trained most/least (imbalance spotting); movement-balance analytics (push/pull, squat/hinge ratios). (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/, https://www.jefit.com/wp/jefit-news-product-updates/the-new-era-of-jefit-the-progressive-overload-system/)
- Adaptive Mesocycle Training organizes training into 3 mesocycles × 4 phases (**On-Ramp → Accumulation → Intensification → Deload**) with **built-in deloads** and weekly performance-driven adjustment (Elite). Goals: Bulking, Cutting, Strength, General Fitness (+ Power Q3 2026). (https://www.jefit.com/wp/jefit-news-product-updates/adaptive-mesocycle-training-jefits-smarter-way-to-progress/)

## 5. Progress & analytics
- **NSPI (North Star Progress Index):** a single 0-100-ish progression score combining three engines: **Strength Engine** (load progression), **Stimulus Engine** (volume via "Hard-Set Equivalents," EMG-based modeling of set quality), and **Movement Balance Engine** (push/pull, squat/hinge ratios). (https://www.jefit.com/wp/jefit-news-product-updates/the-new-era-of-jefit-the-progressive-overload-system/, https://www.jefit.com/blog/the-north-star-progress-index-nspi)
- Per-exercise charts: 1RM progression, volume per session, PR history; body measurement tracking. Muscle recovery breakdown (per-muscle recovery %) advertised. (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/, https://www.jefit.com/)
- Weekly Recap screen explaining what changed and why ("we increased volume because your load progression was strong in squat and bench"). (https://www.jefit.com/wp/jefit-news-product-updates/adaptive-mesocycle-training-jefits-smarter-way-to-progress/)

## 6. Standards / periodization
- **The most developed periodization in the cluster** (2026): AI **Adaptive Plan** generator, **Adaptive Progressive Overload** with weekly load/volume/balance adjustments, automatic **deload** scheduling inside mesocycles, linear-progression plans for beginners (recommended before mesocycles). (https://www.jefit.com/wp/jefit-news-product-updates/the-new-era-of-jefit-the-progressive-overload-system/, https://www.jefit.com/wp/jefit-news-product-updates/adaptive-mesocycle-training-jefits-smarter-way-to-progress/)
- No chat coaching (algorithmic only).

## 7. GUI layout (deep detail)
- **Workout tab:** routine list, "Find" (program marketplace with onboarding quiz → AI plan generation), start routine → logging screen. (https://www.jefit.com/wp/jefit-news-product-updates/adaptive-mesocycle-training-jefits-smarter-way-to-progress/)
- **Logging screen:** exercise list; per exercise a set table (weight, reps) with completion tap and **auto-starting rest timer**; muscle-group icons; add/superset options. Denser and more menu-heavy than Strong/Hevy ("a busier interface with more menus and more to configure"). (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/, https://getbraceai.com/reviews/jefit/)
- **Analytics screens:** 1RM progression line charts per exercise; total volume per session; **muscle-group heatmap** (body map colored by training frequency/volume); body measurements; NSPI dashboard with the three engine scores. (https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/, https://www.jefit.com/)
- 2026 redesign "cleaned up a lot of the old clutter," but reviews still call it overwhelming for beginners. (https://prpath.app/blog/best-progressive-overload-trackers-2026.html, https://getbraceai.com/reviews/jefit/)
- Dark mode, kg/lb, Apple Watch (watch app historically unreliable).

## 8. Export / backup
- Cloud sync via account; **web access** for planning on desktop. Data lock-in concerns voiced (a reviewer lost ~70 unsynced sessions after a login/logout bug). (https://justuseapp.com/en/app/449810000/jefit-workout-planner-gym-log/reviews)

## 9. Differentiators & steal-worthy features
- **NSPI — a single composite progression index (load + volume + balance).** **Why:** PersonalOS already wants strength standards + volume floors + deloads; a single derived "progress score" tying them together is exactly the kind of derived-only stat the spec allows and is hugely motivating.
- **Movement-balance engine (push/pull, squat/hinge ratios).** **Why:** cheap to compute from muscle-tagged logs; surfaces imbalances before injury.
- **Built-in 4-phase mesocycles with scheduled deloads (On-Ramp → Accumulation → Intensification → Deload).** **Why:** a ready-made model for PersonalOS's deload markers + return ramp; the "weekly recap explains what changed" pattern keeps the user trusting the algorithm.
- **Muscle-group heatmap / recovery breakdown.** **Why:** natural companion to MRV-style volume floors — visualize which muscles are under/over-served.
- **Hard-Set-Equivalent (HSE) stimulus metric (load-relative, effort-weighted).** **Why:** a more principled volume than raw tonnage; a lighter-weight version could power PersonalOS's "weekly volume floor" checks.

---

# 4. FitNotes — Gym Workout Log (Android)

## 1. Overview
- Positioning: the **free, offline, no-account, no-ads Android workhorse** — "the gym log I wish I'd found years ago"; a log, not a coach, with no periodization. 4.8★ with 30.6K+ reviews; 1M+ downloads. (https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes, https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review)
- Platform: Android only (original by James Gay; "FitNotes 2" iOS port by Evgeny Uralsky exists but is a separate app with a 12-workout free cap). (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review, https://mwm.ai/apps/fitnotes-2-gym-workout-log/1538896016)
- Pricing: **100% free, no ads, no IAP, no subscription, no account** — the gold standard for privacy/offline. (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review)
- Development slow (last big update 2025) but app is "done" and stable. (https://prpath.app/blog/best-progressive-overload-trackers-2026.html)

## 2. Core paradigm
- **Calendar/date-based logging:** open a day, add exercises, log sets. No forced template flow — it's a diary with "today" at the center. (http://www.fitnotesapp.com/, https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review)
- **Rest timer** (with vibration + screen-on during countdown so it survives screen-off); **auto-increment** options between workouts. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html, https://justuseapp.com/en/app/1059245195/fitnotes-workout-tracker/reviews)
- "Log All" from a routine creates an empty set row for every planned exercise to fill in later — matches the "input sets before doing them, check off as you go" pattern some users love. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)

## 3. Compose / logging model
- Two exercise types: **Resistance (weight×reps)** and **Cardio (distance×time)**. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- **Barbell weight counting** — a featured, beloved option that auto-adds the bar's weight so you enter only the plates (explicitly praised by reviews: "Love the feature of counting the barbell weight"). (https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes)
- 'Save and New' to quickly add a new exercise; on-the-fly exercise creation mid-session; exercise notes; rest timer per exercise. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html, https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes)
- Big, clear numbers and large tap targets (explicitly cited by older lifters: "large, clear numbers... my eyesight is getting bad"). (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)

## 4. Organization
- **Routines:** create a routine, assign exercises to named days ("Monday", "Chest Day", "Workout A"), pick one exercise or "Log All"; multiple routines via dropdown; remembers last-selected routine. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- **Calendar:** highlights days with logged training; tap a day to see a popup of exercises; **filterable highlighting** — e.g. "highlight days where I did bench press >80kg for ≥5 reps" or "ran >3 miles in <20 minutes." (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- Bodyweight tracker alongside workouts (strength-vs-bodyweight context). (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review)

## 5. Progress & analytics
- **Analysis view:** training volume by muscle group as a percentage; full exercise history with **personal bests highlighted** for any movement. (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review)
- **PR grid:** "View all of your current PRs (1RM, 2RM, etc.) within a single, scrollable grid." (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- Volume/reps/sets stats by month/week/day; est-1RM (1RM calculator); goals per exercise; weekly total weight moved; graphs and history log. (https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes, https://mwm.ai/apps/fitnotes-2-gym-workout-log/1538896016)
- No coaching, no AI, no pre-made programs. (https://prpath.app/blog/best-progressive-overload-trackers-2026.html)

## 6. Standards / periodization
- **None.** "It's a log, not a coach"; users pair it with external plans. Auto-increment is the only progression automation (set your own increment/rep rules). (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review, https://justuseapp.com/en/app/1059245195/fitnotes-workout-tracker/reviews)

## 7. GUI layout (deep detail)
- **Today/Log screen:** exercise list with set rows; each row shows weight + reps inputs and (in later versions) checkbox-style completion; add-exercise bar; rest timer; back-button returns to today. White background, large numbers, high contrast. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- **Calendar tab:** month grid with activity highlights; tap → day popup → "Go!" jumps to that day's log. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- **Analysis/Charts tab:** muscle-volume percentage bars; per-exercise PR grid (1RM/2RM/…); line graphs for body weight and strength; est-1RM area charts (FitNotes 2). (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review, https://mwm.ai/apps/fitnotes-2-gym-workout-log/1538896016)
- **Settings:** kg/lb mixing (mix lbs and kg easily), exercise type editing, rest-timer vibrate, screen-awake during rest. (https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- Functional-not-fancy design; users describe it as "straightforward, no gimmicks." (https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes)

## 8. Export / backup
- **CSV export** (spreadsheet-analyzable) and **backup/restore to device, Dropbox, or Google Drive** (via installed apps). **No cloud sync** — history lives on-device; you must remember to back up. (https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review, https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html)
- FitNotes 2 (iOS) imports original FitNotes database + FitNotes CSV and exports CSV back — explicitly "No lock-in." (https://mwm.ai/apps/fitnotes-2-gym-workout-log/1538896016)

## 9. Differentiators & steal-worthy features
- **CSV export + no-account architecture.** **Why:** personal-data-ownership is the model for a privacy-first PersonalOS; offline-first with a one-tap export is the correct posture (and maps to PersonalOS backup/export).
- **Barbell-weight counting (enter plates, bar added automatically).** **Why:** small but beloved ergonomic detail — trivially implementable.
- **Filterable calendar highlighting ("bench >80kg × ≥5")** . **Why:** an effortless way to answer "when did I last hit this?" — a nice derived-stat companion to the records vault / PR ladder timeline.
- **PR grid (1RM/2RM/…/nRM at a glance).** **Why:** the cleanest way to present multi-rep PR ladders — PersonalOS's PR ladder timeline should look like this.
- **'Save and New' / Log All pre-fill patterns.** **Why:** both speed up session start; "Log All" lets you plan sets ahead and check them off, matching the checkbox-complete UX.
- **Bodyweight next to strength history.** **Why:** directly enables bodyweight-relative strength standards (Beginner→Elite tables) with zero extra modeling.

---

# 5. Progression (Workout Tracker) — iOS

## 1. Overview
- Positioning: a **minimalist, one-tap, weight-based strength logger** for iPhone — "MOTIVATION ISN'T A TRAINING STRATEGY"; designed for speed, no clutter, iOS-native (Widgets, Dynamic Island, Health sync). 4.5★, ~10K+ downloads. (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896, https://mwm.ai/apps/progression-workout-tracker/1090687896)
- Platform: iPhone (also Mac/Apple Vision via Catalyst); 24 languages. (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896)
- Pricing: Free core (2-workout cap before Pro per some reviews); Pro $6.99 (or one-time $12.99–$99.99 tiers historically). (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)

## 2. Core paradigm
- **Build a training plan or pick a program → log every set in seconds → app suggests when to increase weight.** Logged with **one tap**; stepper buttons instead of keypad to avoid distractions. (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896, https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)
- Built-in **rest timer**; templates for recurring workouts; full history & PRs. (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896)

## 3. Compose / logging model
- **Stepper (+/−) buttons for weight and reps** rather than a numeric keypad — an explicit design decision to minimize friction ("use the stepper buttons to log your weight and reps instead of the keypad"). (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)
- Progress indicators compare to previous workout (fixed in a 2026 update: "progress indicators compared to your previous workout were no longer shown" bug). (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896)

## 4. Organization
- Templates for recurring workouts; build your own training plan or pick a built-in program (5x5-friendly). (https://apps.apple.com/us/app/progression-workout-tracker/id1090687896)

## 5. Progress & analytics
- **Automatic weight increases:** "automatically increase the weight and decrease the rep count after you reach your max reps" — a built-in **double-progression rule** (a rep-range set: hit top of range → weight up, reps reset). User sets preferred rep range and weight increment in settings. (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)
- Clear charts/statistics; training plateaus insight; Health sync; PR tracking; long-term charts (Pro). (https://mwm.ai/apps/progression-workout-tracker/1090687896, https://apps.apple.com/us/app/progression-workout-tracker/id1090687896)

## 6. Standards / periodization
- **Auto double-progression** (weight up / reps down at rep-cap) is the core scheme — simple, effective, user-configurable ranges. No full periodization engine. (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)

## 7. GUI layout (deep detail)
- Minimalist, ad-free, distraction-free; iOS-native widgets and Dynamic Island; quick actions. Ultra-fast logging with minimal interaction. (https://mwm.ai/apps/progression-workout-tracker/1090687896)
- Logging screen: exercise → weight stepper → rep stepper → complete; previous-session comparison indicators inline. (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)

## 8. Export / backup
- Health sync; **no cloud backup in the paid tier** (a commonly requested missing feature in reviews). (https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews)

## 9. Differentiators & steal-worthy features
- **Stepper-based weight/reps entry instead of keypad.** **Why:** empirically the fastest in-session input; PersonalOS should default to steppers with a long-press for rapid scrolling (tap-to-increment is already in the spec).
- **Configurable auto double-progression (weight up, reps down at rep cap).** **Why:** matches the spec's "auto-weight-suggestion" / progressive overload without an AI layer; the user configures rep range + increment.
- **Previous-workout comparison indicators** inline during logging. **Why:** same as Hevy/Strong — the core progressive-overload nudge.

---

# 6. Boostcamp — Free Workout Tracker & Program App

## 1. Overview
- Positioning: **program-library-first logger** — "the only app with Reddit's most popular programs built in" (nSuns, GZCLP, 5/3/1, Reddit PPL, PHUL, PHAT) plus 130+ coach-designed programs and **11,000+ community programs**. 1.2M+ users, 120M+ workouts logged, 4.8★. (https://www.boostcamp.app/, https://apps.apple.com/jp/app/boostcamp-workout-programs/id1529354455)
- Platform: iOS + Android (no native watch app, but HealthKit HR on iOS; works offline once program loaded). (https://www.boostcamp.app/features, https://barbend.com/boostcamp-review/)
- Pricing: **Free version is genuinely free** (full tracker, RPE/RIR, plate calculator, PR/e1RM, program library, custom builder — no cap). Pro from $4.99/mo (annual $59.99): 20+ exclusive coach programs, **Strength Score**, per-muscle volume heatmap, personalized programs. (https://www.boostcamp.app/features, https://www.garagegymreviews.com/boostcamp-review)
- GGR names Boostcamp "Best Workout App Overall" 2026; BarBend's tester has used it 2+ years. (https://www.garagegymreviews.com/best-workout-apps, https://barbend.com/boostcamp-review/)

## 2. Core paradigm
- **Follow a structured program day-by-day**; each day lists planned exercises with set/rep targets; after week one, each workout shows **last session's sets/reps/weight** so you try to beat it. (https://www.garagegymreviews.com/boostcamp-review)
- Logging with built-in **rest timers**; set-by-set completion; supersets, drop sets, **customizable warmup templates**; RPE and RIR on every set. (https://www.boostcamp.app/features)
- **Mid-workout exercise swap** that carries your weights to the substitute ("swap chest press machine → alternate; apply to today or future workouts"). (https://www.garagegymreviews.com/boostcamp-review, https://www.boostcamp.app/features)
- Offline mode (free) — log, access programs, and use the plate calculator without internet. (https://barbend.com/boostcamp-review/)

## 3. Compose / logging model
- Set rows with weight × reps + **RPE (5–10) and RIR fields**; label sets warm-up / working / failure so auto-progression understands effort. (https://www.boostcamp.app/features, https://barbend.com/boostcamp-review/)
- **Plate calculator** tells you exactly which plates to load per side (explicitly praised: "tells you how many plates you need to add to each side"). (https://www.garagegymreviews.com/boostcamp-review)
- Exercise library with demos; custom exercises; equipment-aware program filtering. (https://barbend.com/boostcamp-review/)

## 4. Organization
- Program library filterable by experience level, goal, days/week; programs forkable (custom program builder supports multi-week mesocycles, supersets, drop sets, **training-max waves**, custom exercises, and publishing/sharing). (https://www.boostcamp.app/features)
- Programs include coach variation toggles (e.g. Alberto Nuñez Upper-Lower: pick "Arms and Delts Dominant / Chest and Back Dominant / Quad Dominant / Glute-Ham Dominant"). (https://www.garagegymreviews.com/boostcamp-review)

## 5. Progress & analytics
- **PR tracking automatic** across types: max weight, max volume, max reps at a weight, lifetime bests, and an **e1RM curve** — flagged the moment you hit them. (https://www.boostcamp.app/features)
- **Strength Score (Pro): a single 0–100 score across the big-five lifts using the IPF DOTS formula** (squat, bench, deadlift, OHP, row). (https://www.boostcamp.app/features)
- **Per-muscle volume heatmap (Pro): an anatomy chart heat-mapped by volume** — "you can add any neglected muscle groups to your routine." (https://www.garagegymreviews.com/boostcamp-review)
- Weekly **Sunday reports** and **year-end Wrapped** recap (free). (https://www.boostcamp.app/features)
- **PR reset to a new baseline** (recent update) so every workout shows a reachable target while full PR history stays safe — directly relevant to deload/return-ramp UX. (https://apps.apple.com/jp/app/boostcamp-workout-programs/id1529354455)

## 6. Standards / periodization
- **Auto-progression** on many coach programs: enter starting lifts → app tells you weight each week; programs implement linear progressions (GZCLP, 5/3/1 for Beginners, Starting Strength), periodized hypertrophy (PHUL/PHAT, Alberto Nuñez), and peaking blocks (Sheiko, Smolov, Candito). (https://barbend.com/boostcamp-review, https://www.garagegymreviews.com/boostcamp-review)
- Custom program builder supports training-max waves (periodization authoring). (https://www.boostcamp.app/features)
- No individualized coaching/community accountability (by design). (https://www.garagegymreviews.com/boostcamp-review)

## 7. GUI layout (deep detail)
- **Programs tab:** searchable grid of program cards (name, coach, muscle type, days/week, rating, athletes joined); intake quiz to find a program; AI plan builder. (https://www.garagegymreviews.com/boostcamp-review)
- **Today/Workout screen:** ordered exercise list; each exercise card shows target sets/reps + **last week's result** inline; per-set rows with weight/reps/RPE/RIR inputs and completion taps; rest timer; plate calculator reachable mid-session; swap-exercise affordance. (https://www.garagegymreviews.com/boostcamp-review, https://www.boostcamp.app/features)
- **Analytics:** PR lists, e1RM curves per lift, volume heatmap anatomy chart, Strength Score gauge, Sunday report card, streak calendar. (https://www.boostcamp.app/features, https://www.garagegymreviews.com/boostcamp-review)
- Streamlined and consistent across mobile and desktop; custom program builder has a small learning curve. (https://barbend.com/boostcamp-review)
- Dark mode; clean modern UI; ad-free.

## 8. Export / backup
- Cloud sync of sessions (offline → sync later). No explicit CSV export documented on the features page (reviews emphasize import/export less than Strong/Hevy). (https://www.boostcamp.app/features)

## 9. Differentiators & steal-worthy features
- **Strength Score using IPF DOTS across the big five.** **Why:** a principled, normalized strength measure — nearly identical to PersonalOS's "big-5 profile lifts + strength standards"; DOTS is a proven normalization for comparing across bodyweight/sex.
- **Per-muscle volume heatmap.** **Why:** the definitive viz for MRV-style weekly volume floors.
- **Auto-progression with set labels (warm-up/working/failure).** **Why:** shows how to make progression rules robust — effort-tagged sets let the engine skip warm-ups and not over-penalize failure sets (matches PersonalOS "1–12 rep guard, addedLoadKg tiebreak" philosophy).
- **Mid-workout exercise swap carrying weights to the substitute.** **Why:** offline-first users with limited gyms need graceful exercise substitution without losing the session flow.
- **PR reset to a new baseline (history preserved).** **Why:** perfect for post-deload return ramps — keep the vault intact but show a reachable target.
- **Coach-program variation toggles** (pick a dominant-focus variant). **Why:** seeded programs can offer tiny, high-value variation without a full program engine.

---

# 7. Personal Training Coach (PTC) — Get stronger, build muscle

## 1. Overview
- Positioning: a **program-driven strength app with built-in proven programs (StrongLifts 5x5, Wendler 5/3/1, GreySkull LP, PPL, GZCLP, nSuns)** and heavy customization — beloved for its **one-time purchase** and responsive solo developer. 4.7★, ~212 ratings; iOS + Apple Watch. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- Platform: iPhone, iPad, Apple Watch (watch can log with or without phone), Mac/Vision. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- Pricing: Free core; **one-time "Personal Training Coach" unlock $29.99** (also monthly $6.99 / yearly $19.99 options). Dev collects **no data**. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 2. Core paradigm
- **Pick a program → app walks you through each session step by step**, telling you exercise, weight, sets, reps; you log and it auto-tracks. "Takes you through each step without you having to manually track everything." (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- Rest-period focus ("keeping you focused during rest periods is a great feature"). Auto weight increments and **deloads** built in ("preventing plateaus"). (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- Start an empty workout and add exercises on the fly; edit/reorder exercises mid-program; flexibility for busy/irregular schedules (no forced days of week). (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 3. Compose / logging model
- Standard set logging (weight×reps); **warmup sets (Pro)** and **smart warm-ups** (personalized warm-up routines, Pro); **RPE** tracking; kg/lb; light/dark mode. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- **Time-based exercises** added in 2025 (e.g. planks) — non-weight exercises supported. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)
- Program modification lets you swap exercises to fit available equipment. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 4. Organization
- Program library (StrongLifts, 5/3/1, GreySkull LP, PPL, GZCLP, nSuns, Boring But Big, etc.); custom workout creation (Pro) and program modification; schedule-flexible (days not locked). (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 5. Progress & analytics
- Graphs/charts for strength and muscle growth; history; PR tracking. Analytics are "basic statistics" per a 7-year user but consistently motivating. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 6. Standards / periodization
- **Built-in progression schemes with auto increments and auto deloads** inside the named programs (5x5 linear, 5/3/1, GreySkull LP) — set-and-forget for the user. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 7. GUI layout (deep detail)
- Program list → session-by-session guide; logging screen with exercise, target, set rows, rest timer; notes per workout day (users request per-exercise notes); graphs in history; RPE field; dark mode. Functional over flashy — "could use a facelift" per a long-time reviewer. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 8. Export / backup
- Not documented; no cloud account (dev collects no data) — data on-device; iCloud/HealthKit integration for workouts/weight. (https://apps.apple.com/us/app/personal-training-coach/id1325495597)

## 9. Differentiators & steal-worthy features
- **One-time purchase, zero data collection.** **Why:** the strongest validation that privacy-first + offline-first is a viable, beloved product position for a strength logger.
- **Programs that drive the session (guide + auto progression + auto deload).** **Why:** proves a logger can carry progression logic without an AI dependency — the model for PersonalOS's training phases and deloads.
- **Schedule-flexible programming (no locked days).** **Why:** matches a single-user life app where sessions happen irregularly; PersonalOS should never force weekday slots.

---

# 8. KeyLifts — 5/3/1 & Percentage-Based Strength Training App

## 1. Overview
- Positioning: **the specialist percentage-program runner** — "the only app built from the ground up to run percentage-based programs like 5/3/1." Removes all TM math; 4.8★, ~830 ratings; iOS, Android, Apple Watch. (https://keylifts.com/, https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)
- Pricing: Free (plan a 5/3/1 cycle, PR alerts, warm-ups, rest timer, 150+ templates, assistance/joker sets); Pro ~$4.99/mo or ~$29.99/yr (auto TM progression, cloud backup/sync, plate calculator, graphs). (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 2. Core paradigm
- **Enter training maxes → one button press plans an entire cycle** with every set's weight pre-calculated from percentages. No manual percentage math; sessions show weights ready. (https://keylifts.com/, https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)
- Rest timer; warm-up sets; PR alerts; track Joker sets + assistance work; delete/swap exercises mid-workout. (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 3. Compose / logging model
- Set-by-set logging of prescribed percentages; **plate calculator** (Pro) shows exact plates; percent-based set sheet per session. (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461, https://builds.io/apps/health-lifestyle/keylifts_531_strength_training)
- Custom template editor: build percentage-based programs from **1 to 52 weeks**. (https://keylifts.com/)

## 4. Organization
- **150+ prebuilt templates** from the 5/3/1 books (Forever/Beyond variants) + user-savable custom templates; every template page shows structure, duration, user feedback; filter by goal/frequency. (https://keylifts.com/, https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 5. Progress & analytics
- **Auto TM progression** (Pro): training maxes advance per 5/3/1 rules (some accuracy complaints re: 10lb vs 5lb lower-body bumps). **PR alerts** when new records hit. **1RM graphs over time** (Pro). (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)
- e1RM automatically calculated across primary lifts, charted in Profile tab. (https://appshunter.io/ios/app/keylifts-531-workout-log/id1437949461/reviews)

## 6. Standards / periodization
- **5/3/1 done right**: training-max waves, percentage-scheduled sets, deload/leader-anchor structures, Joker sets, assistance work — the deep periodization model. Verified templates across common goals/frequencies. (https://keylifts.com/, https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 7. GUI layout (deep detail)
- **Session screen:** ordered list of movements each showing the pre-computed percentage weights for that day (e.g. 5x5 @ 65% TM); per-set completion with rest timer; warm-up rows; joker/assistance sections; swap/delete mid-session. (https://keylifts.com/ screenshots "Workout in progress", https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)
- **Templates browser:** grid/list of 150+ templates with metadata (structure, duration, feedback). (https://keylifts.com/)
- **Program editor:** week-by-week percentage builder (1–52 weeks). (https://keylifts.com/)
- **Stats/Profile:** 1RM graphs, e1RM charts per lift. (https://appshunter.io/ios/app/keylifts-531-workout-log/id1437949461/reviews)
- Praised as "silky smooth, intuitive, outstandingly reliable"; described as software art for the 5/3/1 philosophy. (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 8. Export / backup
- Pro cloud backup/sync across devices; Apple Health sync (weight + workouts). (https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461)

## 9. Differentiators & steal-worthy features
- **Training-max + percentage pre-computation.** **Why:** the cleanest way to run a strength program offline with zero math; directly relevant to PersonalOS est-1RM-derived working sets and phase-based percentages.
- **Automatic training-max progression + PR alerts.** **Why:** a simple, rule-based progression (5/3/1-style TM bumps) that needs no AI — a strong pattern for PersonalOS's auto-weight-suggestion.
- **Warm-up sets as first-class rows.** **Why:** reinforces return-ramp design.
- **1-week-to-52-week program builder.** **Why:** shows how much periodization depth is possible with a simple week-grid data model.

---

# 9. Workout Builder — "Workout Training Tracker & Fitness Log" (Polemics Applications)

## 1. Overview
- Positioning: a **bare-bones, private, ad-free, single-purchase workout log** — "No frills, no social media, no random congratulations and digital confetti, no pop-up motivation alerts, no advertising, no in-app purchases just you and your workout data." Sold historically as a ~$0.99 iOS app. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)
- Platform: iOS (iPhone/iPad). Small niche install base. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 2. Core paradigm
- **Program builder + log:** create fully customizable workout programs (arm day, leg day, cardio day, swimming), then log workouts against them; charts track progress over reps, weights, and times. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 3. Compose / logging model
- Logs reps, weights, and times (time-based exercises supported); fully customizable plans. No IAP, no account — pure offline local logging. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 4. Organization
- User-built programs organized around your schedule; multi-modal (weights, cardio, swimming). (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 5. Progress & analytics
- Progress charts with reps, weights, and times; minimal otherwise (no PR engine, no AI, no standards). (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 6. Standards / periodization
- None — manual customization only. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 7. GUI layout (deep detail)
- Simple list/log UI; program list → workout session with set entries; charts view for progress. Documentation is thin (small app), but the design language is explicitly "no confetti, no pop-ups" — the most minimal logger in the cluster. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 8. Export / backup
- Not documented; on-device data, no account, no cloud. (https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/)

## 9. Differentiators & steal-worthy features
- **The anti-bloat manifesto as a product.** **Why:** validates the "no XP for logging, no confetti, derived stats only" constraint — a non-trivial cohort of users actively wants the bare logger. For PersonalOS the lesson is tonal: celebrate quietly and data-first.
- **Multi-modal logging (weights + time-based + cardio) in one program builder.** **Why:** confirms PersonalOS's need to mix weight exercises, rep-mode bodyweight, and time-based cardio in the same session model.

---

# Cross-cutting synthesis for PersonalOS M2

**Consensus "table stakes" every real logger ships:** checkbox-to-complete set rows; previous-session values shown inline during logging; automatic rest timer triggered by set completion; PR detection surfaced live; est-1RM (Epley is the de-facto formula — see FITIV's documented `weight × (1 + reps/30)`); plate calculator; warm-up set handling; per-exercise set labels (warm-up / working / failure / drop); supersets; CSV/JSON export to avoid lock-in; dark mode.

**Features that map 1:1 onto the locked M2 spec:**
- PR detection "strictly greater, once per session" → Strong/Hevy/Boostcamp live PR flagging (Strong §5, Hevy §5, Boostcamp §5).
- Epley est-1RM with 1–12 rep guard → FITIV documents Epley explicitly (https://fitiv.co/features/workout-builder) and JEFIT/Boostcamp use e1RM curves.
- Bodyweight/rep-mode exercises with no cap → Strong's "Assisted Bodyweight" and "Duration" exercise types (Strong §3) and PTC's time-based exercises (PTC §3).
- "Big-5" profile lifts → Boostcamp's Strength Score over exactly Bench/Squat/Deadlift/OHP/Row using IPF DOTS (Boostcamp §5).
- Records vault / PR ladder → FitNotes' PR grid (1RM/2RM/…/nRM) (FitNotes §5); Boostcamp's PR reset-to-baseline preserves history for return ramps (Boostcamp §5).
- Bodyweight-relative strength standards → JEFIT NSPI + Boostcamp DOTS show normalized scoring; FitNotes pairs bodyweight alongside strength history (FitNotes §4).
- Deload markers that quiet adherence → JEFIT's 4-phase mesocycles with scheduled deloads + weekly recap (JEFIT §6); PTC/KeyLifts auto-deload (PTC §2, KeyLifts §6).
- Weekly volume floors per muscle group → Boostcamp per-muscle volume heatmap (Boostcamp §5) and Hevy's sets-per-muscle-per-week chart (Hevy §5).
- Training phases with kcal/protein targets → JEFIT goal-specific mesocycles (Bulking/Cutting/Strength/General) (JEFIT §6).
- Session comparison → Hevy/Boostcamp inline last-session vs now; Progression's auto double-progression (Progression §5).
- Post-deload return ramp → Strong's Warm-up Calculator (Strong §3), Boostcamp's PR baseline reset (Boostcamp §5).

**Biggest anti-patterns to avoid in a private offline logger:** JEFIT's forced onboarding (BMI/goal-weight shaming) and login/sync data-loss bugs; Strong/Hevy subscription paywalls on history; cloud-account dependence for core logging; social/gamification noise (Hevy's social layer, Boostcamp's confetti) — the "anti-bloat" position of Workout Builder (Polemics) is the strongest precedent for the privacy-first posture.

---

## Source index (key URLs)
- Strong: https://www.strong.app/ · https://prpath.app/blog/strong-app-review-2026.html · https://www.corahealth.app/compare/strong · https://help.strongapp.io/article/229-my-first-workout · https://help.strongapp.io/article/105-about-templates · https://strong-workout-tracker-and-training-log-bodybuilding-weightl.appstor.io/ · https://screensdesign.com/showcase/strong-workout-tracker-gym-log
- Hevy: https://www.hevyapp.com/features/ · https://www.hevyapp.com/features/workout-rest-timer/ · https://www.hevyapp.com/use-cases/strength-training-app/ · https://www.sensai.fit/blog/hevy-review-2026 · https://prpath.app/blog/hevy-app-review-2026.html · https://www.hevyapp.com/best-workout-tracker-app/
- JEFIT: https://www.jefit.com/wp/jefit-news-product-updates/the-new-era-of-jefit-the-progressive-overload-system/ · https://www.jefit.com/wp/jefit-news-product-updates/adaptive-mesocycle-training-jefits-smarter-way-to-progress/ · https://fitnesstoolsreviewed.com/app-reviews/jefit-review-the-best-workout-tracker-app/ · https://getbraceai.com/reviews/jefit/ · https://prpath.app/blog/best-progressive-overload-trackers-2026.html · https://justuseapp.com/en/app/449810000/jefit-workout-planner-gym-log/reviews
- FitNotes: https://play.google.com/store/apps/details?id=com.github.jamesgay.fitnotes · http://www.fitnotesapp.com/ · https://www.whistleout.com/CellPhones/Apps/fitnotes-app-review · https://www.androidblip.com/android-apps/com.github.jamesgay.fitnotes.html · https://mwm.ai/apps/fitnotes-2-gym-workout-log/1538896016
- Progression: https://apps.apple.com/us/app/progression-workout-tracker/id1090687896 · https://mwm.ai/apps/progression-workout-tracker/1090687896 · https://justuseapp.com/en/app/1090687896/progression-gym-logger/reviews
- Boostcamp: https://www.boostcamp.app/features · https://www.garagegymreviews.com/boostcamp-review · https://barbend.com/boostcamp-review/ · https://www.boostcamp.app/ · https://apps.apple.com/jp/app/boostcamp-workout-programs/id1529354455
- PTC: https://apps.apple.com/us/app/personal-training-coach/id1325495597
- KeyLifts: https://keylifts.com/ · https://apps.apple.com/us/app/keylifts-531-workout-log/id1437949461 · https://appshunter.io/ios/app/keylifts-531-workout-log/id1437949461/reviews
- Workout Builder (Polemics): https://myhealthyapp.com/product/workout-training-tracker-fitness-log-polemics-applications-llc/
- Supporting (method/formula): https://fitiv.co/features/workout-builder (Epley, PR taxonomy, set logging patterns)
