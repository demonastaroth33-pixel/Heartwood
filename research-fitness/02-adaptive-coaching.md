# Adaptive & Coaching Fitness Apps — Deep Research (2026)

**Scope:** Fitbod, Future, Freeletics, Volt Athletics, Caliber, Aaptiv, JuggernautAI, Stronger by Science (program tools), Alpha Progression ("Alphastrength" class), + RP Hypertrophy App (discovered during research — the single most relevant extra for PersonalOS's MRV-style volume floors).

**Method:** 12+ web searches + webfetch synthesis across official help docs, company blogs, App Store listings, and ~30 independent 2025–2026 reviews (Garage Gym Reviews, Fitness Drum, SensAI, Agent Finder, Good Housekeeping, Forbes, Men's Health, Gear Patrol, Calisthenics Worldwide, etc.). All URLs cited inline. This is a research file only — no code, no implementation decisions.

**Top-line takeaway for PersonalOS:** every "AI" in this cluster is actually a **rules engine** — recovery percentages, expected-vs-actual RPE tables, RIR-based training-max adjustments, readiness scores, volume landmarks. NONE of it requires an LLM. Everything steal-worthy below is implementable as deterministic heuristics, which matches D004 (AI optional, never required) exactly.

---

# 1. Fitbod

## 1.1 Overview

- **Positioning:** "Personal trainer in your pocket" — the best-known algorithmic workout *generator*. Not a human-coach app, not a class library. Sells on adaptive, recovery-aware program generation built on a large logged-workout dataset (400M+ logged workouts claimed 2026; 2.6B sets / 840K benchmark lifts claimed in another post). (https://fitbod.me/blog/fitbod-algorithm/, https://fitbod.me/blog/how-fitbod-personalizes-your-workout-plan-using-smart-training-algorithms/)
- **Platform:** iOS, Android, Apple Watch, Wear OS. 1,600+ exercise library with HD video demos (1,600+ per help center; 800+ per the algorithm blog — library has grown). (https://fitbod.zendesk.com/hc/en-us/articles/360004429814-How-Fitbod-Creates-Your-Workout, https://www.sensai.fit/blog/fitbod-review-2026)
- **Pricing (2026):** $15.99/mo or $95.99/yr (raised from $12.99/$79.99 in 2026; legacy subscribers grandfathered). 7-day trial that auto-renews; **no permanent free tier** — after trial/3 workouts the app locks workout generation. Occasional lifetime offers. HSA/FSA-eligible. (https://app.fitbod.me/, https://www.sensai.fit/blog/fitbod-review-2026, https://fitbod.zendesk.com/hc/en-us/articles/30542136101527-How-the-Trial-Works, https://fitnessdrum.com/fitbod-review/)
- **Popularity:** consistently top-of-category in strength-app reviews; Fitness Drum gives 4.9/5, SensAI 7.5/10 (price concern post-hike); widely used across its decade of existence. (https://fitnessdrum.com/fitbod-review/, https://www.sensai.fit/blog/fitbod-review-2026)

## 1.2 Core paradigm

Two engines, per Fitbod's own docs (https://fitbod.me/blog/fitbod-algorithm/):
1. **Exercise Selector** (what you do) — scores all exercises in the library each time a workout is generated. The score is a weighted combination of:
   - **Muscle recovery status:** each muscle group carries a 0–100% recovery score derived from training history; Fitbod prioritizes muscles not heavily trained in the last 48–72h (cites Schoenfeld 2010). Accessory muscles limited to 1–2 exercises/session; recovery applies to main groups.
   - **Feedback history:** every exercise you add/remove/replace/rate ("Recommend More/Less/Exclude") shifts future selection. Skipped sessions count.
   - **Training-split compatibility:** if you run Push/Pull/Legs the algorithm enforces it; a "Recovery-Focused mode" drops the split and maximizes muscle freshness instead.
   - **Available equipment:** only exercises matching your selected equipment; bodyweight-only mode excludes all weighted work. Constraint example from help docs: there are no true bodyweight-only bicep exercises, so limited gear can starve a muscle group. (https://help.fitbod.me/hc/en-us/articles/16254175592215-Fitbod-s-Algorithm-Q-A)
   - **Exercise variability setting** (More Consistent / Balanced / More Variability) controls how much of last week's exercises are retained vs rotated.
2. **Capability Recommender** (how much: sets, reps, weight):
   - Rep schemes keyed to goal: Strength = 1–6 reps at ~85–100% est. 1RM with 3–5 min rests (cites Grgic 2018); Hypertrophy = 6–12 reps targeting 10–20 working sets/muscle/week (cites Schoenfeld 2017); Lean/General = higher reps, shorter rest.
   - **e1RM estimation via Epley formula** from logged sets, refined every session; "mStrength" muscle-group strength scores; overall strength score = average of mStrength.
   - **mStrength™ dynamic variation:** intensity/volume deliberately alternates across sessions (heavy/low-rep days vs light/high-rep days) — non-linear periodization baked in.
   - **Max Effort Days:** every few workouts one or two exercises are flagged; you take the last set to AMRAP. This is the primary recalibration signal — pushes e1RM accuracy directly.
   - **Inactivity decay:** time off automatically lowers suggested starting weights ("ease back in" after breaks).
   - **Conservative starting weights:** new exercises seeded from population data (87M+ workouts at the time of the help article) on the conservative side.

## 1.3 The coaching loop

- After each logged workout Fitbod updates muscle recovery percentages, e1RM, mStrength, and volume trends; the *next* workout is then regenerated from scratch — nothing is carried over as a static plan.
- **RiR logging:** after each set you can log reps in reserve; RiR directly influences next-session loading aggressiveness (sweet spot 1–2 RiR cited for hypertrophy, 2–3 for strength).
- **Manual overrides are training data:** adjusting weight up/down, swapping exercises, editing reps/sets — all feed back in. Help center is explicit: "your manual inputs now have a more important role in shaping future recommendations."
- **External activity import** (Apple Health, Health Connect, Fitbit, Strava): cardio/other activity is converted into muscle-fatigue impact, so recovery estimates stay calibrated on active recovery days.
- No conversational coaching, no explanations of decisions — SensAI's critique: "doesn't explain decisions; no real coaching dialogue." (https://www.sensai.fit/blog/fitbod-review-2026)
- Personalization warm-up: Fitbod itself says ~10–15 logged workouts (a few weeks) before the model of you is dialed in. (https://www.sensai.fit/blog/fitbod-review-2026)

## 1.4 Exercise & set prescription

- **Presentation:** video demos for 1,600+ exercises (multi-angle, "hi-res"), text instructions, equipment tags, muscle-group tags; searchable by muscle/equipment/keyword. (https://play.google.com/store/apps/details?hl=en&id=com.fitbod.fitbod)
- **Workout screen:** full session with sets/reps/rest suggestions; plate-math targets ("plate-by-plate set targets" per SensAI); superset/circuit options; warm-up & cool-down toggles; ~7 exercises typical for a 1-hour session, fewer with limited equipment. (https://www.sensai.fit/blog/fitbod-review-2026, https://help.fitbod.me/hc/en-us/articles/16254175592215-Fitbod-s-Algorithm-Q-A)
- **Rest timing:** rest intervals prescribed per goal (3–5 min for strength); in-app rest timer flow.
- **RPE/RiR handling:** RiR rating per set (as above); Max Effort Days for recalibration; user-adjustable weights with "Added Weight" field for vests/ankle weights.
- **Progressive overload logic:** "if you consistently complete an exercise with ease, the app will gradually increase weight or reps; if you struggle, it adjusts future recommendations." Combined with deliberate loading-zone cycling to avoid accommodation. (https://fitbod.zendesk.com/hc/en-us/articles/360004429814-How-Fitbod-Creates-Your-Workout)

## 1.5 Human vs AI coaching

Pure AI — explicitly compared against human-coach apps (Ladder, Future) in Fitbod's own marketing blog: "Fitbod is built as an adaptive strength-training system... Ladder is built more like a coach-led experience." Fitbod positions itself as solving "what should I do today?" algorithmically, with no human check-ins. (https://fitbod.me/blog/fitbod-vs-ladder/)

## 1.6 GUI LAYOUT (deep detail)

- **Onboarding / Gym Profile:** after download you immediately configure the **Gym Profile**: fitness goal, experience level (Beginner/Intermediate/Advanced), available equipment (checkbox list incl. specific dumbbell weight increments you own), training split (Full Body / Upper-Lower / Push-Pull-Legs / bodybuilding splits), workout duration, warm-up/cool-down preferences, cardio preference, exercise variability, supersets/circuits. **Multiple gym profiles** (home / hotel / commercial) are switchable in seconds — a travel-friendly pattern. (https://fitnessdrum.com/fitbod-review/, https://www.hotelgyms.com/blog/review-of-fitbod-how-to-take-your-fitness-with-you, https://tech.yahoo.com/wearables/articles/fitbod-app-review-personal-trainer-175654685.html)
- **Workout tab (main screen):** today's generated workout list — exercise name, sets/reps, suggested weight, rest; each exercise row expands to video + notes; "Replace Exercise" and per-exercise "..." menu with **Recommend More / Recommend Less / Don't Recommend Again**; manual add/remove of exercises edits the session in place. (https://help.fitbod.me/hc/en-us/articles/16254175592215-Fitbod-s-Algorithm-Q-A)
- **Recovery / Body tab:** always reachable at the bottom nav; **heat-map visualization of muscle fatigue** — color-coded body with 0–100% per muscle; used both as a readout and an input (you can manually adjust recovery % when the model disagrees with how you feel). This is the closest analog to PersonalOS's "deload markers / readiness" concept in the market. (https://fitbod.me/blog/how-fitbod-personalizes-your-workout-plan-using-smart-training-algorithms/, https://fitbod.me/blog/how-fitbods-ai-knows-exactly-when-you-should-lift-heavier-and-when-to-recover/)
- **Results/metrics screens:** e1RM estimates per lift, mStrength per muscle group, Overall Strength Score, weekly "Your Workout Report"; Trends screen (top-right) shows history per exercise; Log tab for past workouts. (https://fitbod.me/blog/how-fitbods-ai-knows-exactly-when-you-should-lift-heavier-and-when-to-recover/, https://play.google.com/store/apps/details?hl=en&id=com.fitbod.fitbod)
- **Max Effort Day UI:** flagged exercises with explicit "push to max on final set" callout — a single high-value prompt rather than a separate screen.
- Design language: "very clean, intuitive" (Fitness Drum); Yahoo review: "intuitive set of goals, clean UI, excellent Apple Watch companion app."

## 1.7 Pricing / engagement

- 7-day trial → auto-renew; no free tier; annual ≈ half of monthly ($8/mo effective). Cancellation through store, not app. (https://fitbod.zendesk.com/hc/en-us/articles/30542136101527-How-the-Trial-Works)
- Retention mechanics: **algorithmic sunk cost** (the more data you log, the better it gets — switching apps resets the model); Max Effort Days create a "don't skip" obligation; streak of progress in mStrength charts; watch integration for frictionless logging.

## 1.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **Per-muscle recovery percentage (0–100) with manual override + heat-map body view** — a deterministic fatigue model any rule-based Coach can maintain from logged sessions; the manual override ("had a hard weekend hike") is the key design point: user input corrects the model cheaply. PersonalOS maps directly onto this for deload markers and weekly volume floors.
2. **Max Effort Day as periodic recalibration** — instead of re-testing 1RM constantly, flag 1–2 exercises every few sessions for an AMRAP set and re-derive e1RM. This is the cleanest PR-detection + 1RM-estimate refresh loop in the cluster.
3. **Inactivity decay of suggested loads** — "time off lowers your starting point"; trivially implemented as a per-exercise multiplier on e1RM based on days since last session. Steals directly to the M2 post-deload return ramp and missed-workout handling.
4. **Manual edits as training signal** — swap/rate/exclude inputs permanently reshape future recommendations; no "override and forget." A Coach can implement this as weighted preference scores per exercise.
5. **Conservative seeding + explainable adjustment** — new exercises start from population baselines (conservative), then converge on personal data; the learning-curve expectation ("~10–15 sessions before it sharpens") is communicated up front, managing user expectations honestly.
6. **Equipment-constrained generation with explicit constraint feedback** — when a muscle can't be hit with current gear (e.g., no bodyweight bicep work), the app *says why* instead of silently omitting it. Valuable pattern: surface the constraint, don't hide it.

---

# 2. Future (1:1 human coach)

## 2.1 Overview

- **Positioning:** the premium "real human coach in your pocket" app. Certified trainers write weekly bespoke plans, monitor wearable data, and message you daily. Founded 2019 (Garage Gym Reviews), $199/mo standing price. (https://future.co/, https://www.garagegymreviews.com/future-app-review)
- **Platform:** iOS + Android; Apple Watch (S3+/S4+) is central (also WearOS 3.0+ per 2026 reviews); 2,000+ exercise video library. App Store 4.9/5 with 10,000+ ratings. (https://future.co/, https://www.weightlossrankings.org/reviews/future-fitness, https://www.goodhousekeeping.com/health-products/a69169032/future-app-review/)
- **Pricing (2026):** $50 first month promo, then $199/mo; prepay discounts: 3-mo $537 ($179/mo), 6-mo $1,014 ($169/mo), 12-mo $1,788 ($149/mo); 30-day money-back guarantee (no free trial); HSA/FSA via Truemed; US-only (payment + phone). (https://future.co/, https://www.weightlossrankings.org/reviews/future-fitness)
- **Popularity:** ~200+ certified trainers on roster; "98% say they're more consistent within 4 weeks" (own claim); reviewed heavily across 2024–2026 (Forbes, Men's Health, Good Housekeeping, Gear Patrol, Garage Gym Reviews).

## 2.2 Core paradigm

- **Human programming, AI telemetry.** The coach builds and adjusts the plan; the app's algorithm layer ingests Apple Watch data (heart rate, activity, calories, completion, recovery) so the coach sees *actual effort*, closing "the dishonesty gap" of self-reported logging. (https://fitnesstoolsreviewed.com/app-reviews/future-app-review-is-ai-personal-training-worth-it/)
- Weekly cadence: plans drop every week (typically by Sunday evening for the coming week); the coach adjusts next week based on what was/wasn't completed. (https://www.garagegymreviews.com/future-app-review, https://onbetterliving.com/future-app/)
- No auto-generation: no deload algorithm, no volume math in-app — all coaching judgment is the human's, informed by data.

## 2.3 The coaching loop

- **Onboarding call:** ~25-minute video/FaceTime consultation (fitness history, goals, medical/mobility issues, equipment, schedule) — then the coach builds week one within ~12–24h.
- **Daily accountability:** coaches message before/after workouts, ask how you feel, offer schedule swaps; proactive nudges if you miss sessions ("if Reyes sees I've missed a day or two... he'll fire over a comical gif accompanied by nudging words") — Gear Patrol describes the stream of communication as "constant and vital." (https://www.gearpatrol.com/fitness/a44569159/future-training-app-review/, https://onbetterliving.com/future-app/)
- **Missed workouts handled without shame:** "if you miss one, it's noted—but not in an intimidating way!" (Good Housekeeping). Coaches explicitly teach clients to trust their body ("Kaya taught me to trust my instincts—and my body!—if showing up wasn't in the cards").
- **Form feedback:** record yourself performing a lift and send it; coach replies with pointers.
- **Injury adaptation:** coaches sub rehab movements directly into the program (band work for a strained lat "so I didn't have to do the rehab separately" — Men's Health).
- **Monthly/periodic video calls** to re-baseline goals.

## 2.4 Exercise & set prescription

- **Video-reel workout player:** during a session a video loop demos each exercise; **audio cues** (toggleable) and **coach-recorded voice notes** attached to specific exercises ("knees slightly bent on staggered dumbbell RDL", "remind me to limit range of motion") — personalized cueing inside a standard video demo. (https://www.menshealth.com/fitness/a46295733/future-fit-app-review/, https://www.gearpatrol.com/fitness/a44569159/future-training-app-review/)
- 360° video views; "Hear Guide" button for extra instruction; exercises are timed or rep-counted; auto-count reps via Apple Watch for some moves; watch acts as remote (advance exercises, adjust weight via crown, flag painful movements). (https://www.goodhousekeeping.com/health-products/a69169032/future-app-review/, https://www.gearpatrol.com/fitness/a44569159/future-training-app-review/)
- **Rest timing:** session starts a countdown clock with audio tones + watch buzzes ("I've never stuck to work:rest ratios so well"); each session labeled with expected duration.

## 2.5 Human vs AI coaching (the "being coached" UX)

- Coach **selection matters and is user-controlled**: 3-minute matching quiz → 4 recommended coaches with bios → user can also browse the full roster and pick; granular preference questions ("drill sergeant vs hand-holding"). (https://onbetterliving.com/future-app/, https://www.gearpatrol.com/fitness/a44569159/future-training-app-review/)
- The relationship is the product: daily messages, check-ins, gifs, lifestyle/nutrition chat ("Reyes will message me to check on hydration... shares snaps of what he's eating"). The watch data makes the coach's interest feel informed, not stalkery.
- Coach switch is easy (Profile → Account → Switch coach); coaches have caseloads but reviews report responsive, personalized attention.
- Weaknesses: no live real-time form correction; $199/mo; watch strongly recommended (Android experience notably worse); coaches can only schedule one workout/day (Good Housekeeping).

## 2.6 GUI LAYOUT (deep detail)

- **Coach discovery:** quiz → coach cards (photo, credentials, specialty, vibe) → "Train With" → schedule FaceTime intro.
- **Home screen:** messaging stream (chat threads with coach), today's workout card, weekly plan preview.
- **Workouts tab:** "Overview" of the week — each day's session with exercises, minutes, reps, weights; each workout clearly labeled with expected completion time; past workouts browsable. (https://onbetterliving.com/future-app/)
- **Active session screen:** video reel per exercise + voice cues + countdown timer + watch remote controls; pause for water; manual rep adjustment.
- **Check-in surface:** text messaging primarily; voice notes; video form-check uploads; monthly video calls scheduled in-app.
- **Progress:** watch-synced stats (calories, HR, workout completion) visible to both user and coach; monthly check-ins for recalibration.
- No iPad/Apple TV native app — reviewers screen-mirror instead (Gear Patrol complaint).

## 2.7 Pricing / engagement

- $50 first month (≈75% off) + 30-day money-back = effectively a risk-free trial without a free tier; prepay anchors long-term commitment ($149/mo at 12-mo).
- Retention = **human accountability** + sunk cost of the coaching relationship; watch gamification (movement goals, badges).
- Corporate wellness channel exists (GGR mentions); heavy affiliate/influencer promo engine.

## 2.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **Coach voice notes attached to exercises** — in PersonalOS the "coach" can't record audio, but the pattern translates: per-exercise coach notes/tips pre-attached to exercises in the seeded library (form cues, "start light today"), surfaced in the session screen. A rule-based Coach can attach canned, situation-aware cues.
2. **Missed-workout handling without shame** — "noted, but not intimidating"; explicit framing that skipping is data, not failure. This is a *tone spec* for PersonalOS's no-shame-language constraint, directly sourced from a real product.
3. **The pre-session check-in as conversation** — coach messages arrive before and after workouts; the rhythm (before: plan/expectation, after: debrief) is reproducible as scheduled rule-based check-in prompts.
4. **Form-check video loop** — user sends a set video, coach comments. Offline variant: the app could prompt self-review against a checklist ("knees tracking, back neutral") — rules, no human.
5. **Watch as remote + effort telemetry** — even without a coach, automatic rep counting and session timers materially improve logging accuracy; worth considering for PWA (hard on web; note as future).
6. **Injury substitution into the plan** — when an exercise is flagged painful, replace it with a same-pattern alternative (bands for the strained muscle) rather than dropping the movement. Maps to Volt's replacement network (see §4).

---

# 3. Freeletics (AI Coach)

## 3.1 Overview

- **Positioning:** "The AI Coach for busy people" — adaptive bodyweight/HIIT/calisthenics-first training (some gym/weights now), 900+ exercises, 8,500+ … (no—that's Aaptiv; Freeletics: 700–900+ exercises), Journeys (6–16-week themed programs), nutrition coach add-on, running coach, community. Claims 60M users, 400k+ five-star reviews. (https://www.freeletics.com/en/, https://agent-finder.co/reviews/freeletics, https://calisthenicsworldwide.com/apps/freeletics-app-review/)
- **Platform:** iOS + Android (10M+ Play downloads, 280k+ combined ratings); Apple Watch integration with step-by-step workout control; Apple Health/Health Connect/Strava sync. (https://calisthenicsworldwide.com/apps/freeletics-app-review/)
- **Pricing (2026):** Free tier (limited: ~30 static workouts, ads); Coach €12.99/mo or €79.99/yr (~$14/mo, $86/yr); Coach+Gear €17.99/mo; quarterly ~€3.85/wk; lifetime €299.99–469.99 (frequent promos, 20–50% off codes). Some sources list $34.99/mo — pricing varies by region/store; ~$1.44–1.83/wk on annual deals is the common claim. (https://agent-finder.co/reviews/freeletics, https://calisthenicsworldwide.com/apps/freeletics-app-review/, https://www.hotelgyms.com/blog/the-freeletics-fitness-app-review, https://www.corahealth.app/uk/compare/freeletics)

## 3.2 Core paradigm

- **AI Coach generates a weekly schedule** ("Journey") from onboarding inputs (sex, age, weight, goals, fitness level, training days, equipment, location). Journeys are 6–16 week blocks (Muscle Gain, Shred & Burn, Bodyweight Athlete, etc.) with warm-up → main session → cool-down structure. (https://agent-finder.co/reviews/freeletics)
- **Adaptation is self-report-driven, not biometric:** after each workout you rate difficulty (too easy / perfect / too hard) and technique (good/bad); the Coach adjusts the *following week* ("typically for one week after the feedback"). Explicitly **no HRV/sleep/readiness inputs** — a key differentiator vs Cora-type apps. (https://www.corahealth.app/uk/compare/freeletics)
- **Pre-session adaptation:** before a workout you can tell the Coach how you feel today, if you're short on time ("Adapt session" — swap for a shorter one), or if equipment/limitations changed; the Coach rewrites the session on the spot. (https://calisthenicsworldwide.com/apps/freeletics-app-review/, https://fitnessdrum.com/freeletics-review/)
- **In-session adaptation:** mid-workout "too hard" / disability / limitation flags produce alternative exercises.
- **Progression logic:** difficulty adjustments via harder exercise *variations* (calisthenics progressions) rather than added weight; deload weeks triggered if you rate multiple sessions "too hard" or skip workouts; volume/intensity increases if you finish under target times and rate "too easy." (https://agent-finder.co/reviews/freeletics)
- **Daily Athlete Score (DAS):** analyzes 100+ data points from the last 3 months into a near-real-time fitness snapshot. (https://fitnessdrum.com/freeletics-review/)

## 3.3 The coaching loop

- Intake → plan → train → post-workout feedback (exertion + technique) → Coach adjusts next week. The loop is weekly, not session-to-session, and is explicitly acknowledged as "AI, not a real coach."
- Review findings: adaptation accurate ~82% of the time in one 4-week test; misses were usually the Coach being too conservative (not increasing intensity fast enough after "too easy" ratings); exercise substitutions sometimes suboptimal (marked a barbell hip thrust uncomfortable → substituted a dumbbell RDL, different muscle groups — "human trainers would have chosen better alternatives"). (https://agent-finder.co/reviews/freeletics)
- **Onboarding quiz:** ~6 quick questions (fitness level scale, top-3 goals, preferred training style, equipment, days/week) — under a minute; then 4 "Journeys" + 16 programs offered; plan generation takes a few minutes. (https://calisthenicsworldwide.com/apps/freeletics-app-review/, https://fitnessdrum.com/freeletics-review/)

## 3.4 Exercise & set prescription

- 900+ exercises with multi-angle form videos + "common mistakes" annotations; **audio coaching cues during sessions** ("chest touches the ground" for push-ups). (https://agent-finder.co/reviews/freeletics)
- Session UI is a **reel of exercises on a timer** — countdown per exercise (bottom-left), "what's next" preview, progress through the session; rest built into the session structure. (https://fitnessdrum.com/freeletics-review/, https://calisthenicsworldwide.com/apps/freeletics-app-review/)
- Prescription units are time/reps/rounds (HIIT-style), not weight percentages; 12% longer real durations than estimates on average (rest variability). (https://agent-finder.co/reviews/freeletics)
- No RPE/RiR — the difficulty rating is session-level, not set-level.

## 3.5 Human vs AI coaching

No humans. The Coach is a rules/ML engine; the "Coach" brand voice is deliberate marketing (reviews repeatedly note "it's not a real coach"). (https://fitnessdrum.com/freeletics-review/)

## 3.6 GUI LAYOUT (deep detail)

- **Bottom nav: Community / Coach / Settings.** The Coach tab is the information-dense hub: program overview (which days are training days), per-day workout cards, per-exercise drill-down pages with video + description. Information is revealed progressively: "the program overview focuses on when your workouts are, the workout days focus on what the workouts are, and only if you click on an individual exercise are you presented with how to do it." (https://calisthenicsworldwide.com/apps/freeletics-app-review/)
- **Workout day screen:** session duration, focus, equipment needed, warm-up (folded), then the session with exercises/rounds/reps; big "Adapt" button always present; start button.
- **Active session:** minimalist — just the exercise video/name + timer + progress; one large button to adapt/replace the current exercise mid-session. (https://calisthenicsworldwide.com/apps/freeletics-app-review/, https://forum.freeletics.com/t/update-to-the-app-training-flow-ab-test-android-only/6051)
- **Post-workout feedback flow (publicly documented UX case study — https://www.ffritz.design/case-flow):** this is the standout design artifact in the whole cluster. Legacy flow: 6+ screens and 10+ interactions per workout. Redesigned to **2–3 screens, 2 interactions** with a happy path of *one*: a single feedback screen with segmented buttons (not sliders), **default selections pre-set to the most common answers** (exertion feedback ~80% "OK", technique ~56% "Excellent" from behavioral data), so users only confirm. Education screens teach first-time users what feedback is and why it matters. A "finish" button was shipped then removed after forum data showed users failing to hit it mid-burpee (hard to tap, glasses off, out of energy) — replaced with a back button on the next screen.
- **Gamification:** points per completed exercise → profile level (harder to level up over time; harder exercises worth more); day streaks (≥17 min counts) and week streaks; badges. (https://calisthenicsworldwide.com/apps/freeletics-app-review/)
- **Travel/limitation input:** pre-week setup asks about limitations (soreness areas) and adjusts sessions.

## 3.7 Pricing / engagement

- Freemium with aggressive upgrade prompts; frequent promo codes (20–50% off, lifetime sales) as the main acquisition lever; 14-day money-back guarantee; quarterly/yearly/lifetime SKUs.
- Retention: Journeys with clear endpoints (repeatable), gamification (levels/streaks), community feed + challenges, Hell Week test weeks inside Journeys, DAS score.

## 3.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **The one-tap post-workout feedback screen** (segmented buttons, defaulted happy path, education on *why* feedback matters) — the single best UX pattern in this research for a rule-based Coach that lives or dies by honest self-report. PersonalOS should copy the interaction economics: fewer taps, defaults, and first-run education.
2. **Pre-session "adapt" affordance** — telling the Coach you're tired/short on time/low on equipment *before* starting produces a rewritten session. Cheap to implement as rules (load multiplier, shorter session variant) and directly serves the "gentle, no-shame" coach voice.
3. **Difficulty as a session-level signal** (too easy/perfect/too hard) driving next-week intensity — coarse-grained but robust for users who won't log RPE; a good fallback signal alongside richer ones.
4. **Calisthenics-style progression variations as the adaptation currency** — when you master an exercise, the Coach promotes you to a harder variation of the *same pattern* rather than adding weight. Perfect for an offline app with a seeded exercise library: encode variation ladders per movement pattern.
5. **Journeys with explicit endpoints** + repeatability — 6–16 week blocks give structure and completion moments; a rule-based Coach can generate phase blocks (bulk/cut/maintain!) the same way.
6. **Publicized feedback-loop education** — the Coach explains why ratings matter on first run; reduces garbage-in for the adaptation engine.

---

# 4. Volt Athletics

## 4.1 Overview

- **Positioning:** sport-science strength & conditioning, born as team/school software (Volt Coach Platform), now also a B2C Training App. "Programs built by CSCS-certified coaches for 40+ sports" + Cortex® AI adapts them. 3,000+ movement library. (https://voltathletics.com/individuals, https://voltathletics.com/training-app/)
- **Platform:** iOS + Android app; Apple Health sync (duration + calories); 1M+ users claim; App Store "What's New" shows active 2026 development (v23.8.0, Jun 2026). (https://apps.apple.com/us/app/volt-gym-home-workout-plans/id1189345596)
- **Pricing (2026):** Monthly $19.99 (3-day trial), Quarterly $39.99 (7-day trial), Annual $129.99 (14-day trial); no free tier beyond trials; Coach Platform is quote-based (teams/schools/tactical). (https://voltathletics.com/individuals, https://healthynexercise.com/ai-workouts/volt-athletics-review/)

## 4.2 Core paradigm

- **Cortex® AI** = the adaptive engine. Components: **Smart Sets™**, **Strength Numbers** (e1RM per movement), **Movement Replacements**, and a **Training Calendar** that auto-adjusts sessions so you peak on a target date. (https://help.voltathletics.com/what-is-cortex)
- **Smart Sets™ (the crown jewel — fully documented, fully rule-based):** after each set of a loaded movement, Cortex asks "How hard was that set?" on a **7-point RPE scale** (10 Max Effort → 1–4 Very Easy). Cortex compares your actual RPE to the **expected RPE for that load×reps combination from Prilepin's relative-intensity chart** (e.g., 80% × 1 rep ≈ "Moderate"/RPE 6; 58% × 8 ≈ "Light"). If actual ≈ expected → no change. If actual is 2+ RPE higher than expected → e1RM is adjusted *down* (the set was harder than your estimated max implies). If actual is lower → e1RM rises. This is expected-vs-actual autoregulation with zero ML. (https://help.voltathletics.com/how-do-smart-sets-work)
- Precision caveat documented by Volt: Smart Sets is most accurate on heavier loads/fewer reps (RPE is easier to judge near max); at light loads the signal is noisy — they tell you how to recalibrate (do more reps at the weight).
- **Strength Numbers:** user enters/establishes e1RM per movement; loads are prescribed as % of Strength Numbers.
- **Movement Replacement / Movement Mesh Network:** any exercise can be swapped; the app recommends **6 replacements in the same movement category** (movement pattern + muscles), so effectiveness is preserved; also used for equipment adaptation (travel, home gym). (https://help.voltathletics.com/what-is-cortex, https://voltathletics.com/individuals)
- **Periodization:** programs are long-term plans with phases, peaking, and built-in recovery; workouts "build on the last" (vs random generators); calendar input (e.g., a meet date) reshapes the whole plan in real time. (https://apps.apple.com/us/app/volt-gym-home-workout-plans/id1189345596, https://help.voltathletics.com/what-is-cortex)
- **Readiness surveys** (sleep, mood, soreness, stress, energy) tracked for coach-platform athletes; RPE + feedback reporting; CSV export. (https://voltathletics.com/individuals, https://healthynexercise.com/ai-workouts/volt-athletics-review/)

## 4.3 The coaching loop

- Log sets/reps/difficulty → Cortex updates e1RM per movement → next set's weight changes **in real time, set-to-set** (the only app in this cluster that adjusts mid-session from set-level RPE) → workouts in the plan evolve weekly → programs adapt around your calendar.
- Readiness surveys feed the coach platform; individual-app users rate difficulty post-session.
- No human coaches in the B2C app; the "coach" is the combination of CSCS-authored program structure + Cortex adjustments.

## 4.4 Exercise & set prescription

- HD demo videos + technique cues + audio guidance during sessions; equipment-aware programming (bodyweight/band/dumbbell/kettlebell/home programs exist as named tracks); warm-ups, primers, finishers, conditioning, drills as optional add-on modules (50+ ready routines). (https://voltathletics.com/individuals, https://apps.apple.com/us/app/volt-gym-home-workout-plans/id1189345596)
- Exact weights prescribed from Strength Numbers (no plate math on the user); reps/sets/% targets per session.
- Smart Sets RPE prompt after loaded sets (bodyweight excluded); rest not heavily featured.

## 4.5 Human vs AI coaching

None in B2C. But Volt's origin as coach software means the AI is *auditable* and prescriptive — the "voice" is sport-coach-like (peaking, readiness, movement categories), which reads as more competent than consumer AI coaches. (https://healthynexercise.com/ai-workouts/volt-athletics-review/)

## 4.6 GUI LAYOUT (deep detail)

- **Onboarding:** pick goal/sport (40+ options incl. Strength & Size, Weight Loss, tactical roles) → experience level → equipment (home vs commercial vs minimal) → schedule (days/week, session length) → trial plan → first workout. "Complete your first workout and rate difficulty so the AI can adapt." (https://healthynexercise.com/ai-workouts/volt-athletics-review/)
- **Training Calendar:** sessions laid out on a calendar; the program reshapes itself around your dates (peaking logic); per-session cards with exercise lists.
- **Session screen:** exercise-by-exercise with video, sets/reps/% target weight, Smart Sets RPE prompt after each loaded set, exercise swap button (6 alternatives in the movement category), session progress.
- **Reports:** workout summaries, trends, estimated 1RM per movement, readiness/wellness entries; raw data CSV export (pro-user feature).
- **Tablet Training Mode** for weight rooms (team-side) — big-touch interface for gym floor use.
- Reviews describe setup as "refreshingly straightforward" and the app as wrapping "a lot of complexity in a simple experience." (https://healthynexercise.com/ai-workouts/volt-athletics-review/)

## 4.7 Pricing / engagement

- Trial lengths scale with commitment (3/7/14 days) — a nice pattern: longer trials for longer plans. No free tier. Quarterly/annual discounts.
- Retention: long-term periodized plans (sunk cost of progression), peaking events, weekly plan evolution, team/school ecosystem.

## 4.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **Expected-RPE vs actual-RPE comparison against a Prilepin-style table** — the single most implementable autoregulation algorithm in this research: a lookup table (load% × reps → expected RPE) + a delta rule (|actual−expected| ≥ 2 → adjust e1RM). No ML, no LLM, deterministic, and it self-corrects. PersonalOS's Coach can own this table wholesale for its est-1RM engine.
2. **Movement replacement with 6 same-category alternatives** — encode the exercise library with movement-pattern + muscle tags (PersonalOS already plans categories + muscle tags!) and generate replacements by category matching. Same infrastructure, new query.
3. **Set-to-set adjustment from set-level feedback** — adjust *within* the session, not just between sessions; a mid-workout "next set -10%" rule is trivial and feels magical.
4. **Calendar-driven peaking** — user declares a target date (meet/race/goal); the system lays out blocks backward from it. PersonalOS phases (bulk/cut/maintain) + deload scheduling can be calendar-anchored the same way.
5. **Documented recalibration guidance** — Volt tells you *why* Smart Sets might be noisy (light loads) and how to fix it (lift more reps). A Coach that explains its own uncertainty builds trust — and costs nothing.

---

# 5. Caliber

## 5.1 Overview

- **Positioning:** "science-based fitness coaching" — strength-training-first with real credentialed human coaches (top-1%-of-applicants claim), plus a genuinely robust **free-forever self-guided tier** (rare in this cluster). "Mastery over variety" methodology. (https://caliberstrong.com/, https://sports-nerd.com/brand/caliber/)
- **Platform:** iOS + Android (reviews note iOS-first polish; Android exists but lagged). 500–600+ exercise library with video tutorials. App Store 4.8/5, 5,000+ reviews. (https://thesoftwarefeatures.com/caliber-app-review-2026/, https://sports-nerd.com/brand/caliber/)
- **Pricing (2026):** Free (full app, ad-free, no coach); Pro $19/mo (group coaching: 4 programs — beginner, intermediate/advanced, weight loss, bodyweight); Premium from $200/mo (1:1 coaching, packages: ~$600/$800/$1,400 per 3 months by coaching level); 7-day Pro trial; 30-day money-back guarantee on Premium. (https://www.garagegymreviews.com/caliber-app-review, https://sports-nerd.com/brand/caliber/)

## 5.2 Core paradigm

- **Human coach + data platform.** Onboarding questionnaire (goals, current lifts, equipment, schedule, injury history) → manual coach match → coach writes a periodized multi-week block (typically changed every few weeks, not weekly — deliberate "mastery over variety"). (https://thesunrisedigest.com/move/caliber-review-2026/)
- Coach sees every logged set, adjusts the block every 1–2 weeks based on actual performance, session feel, and where you are in the block.
- Unique metrics: **Strength Score** (overall, updated weekly) and **Strength Balance** (imbalance between muscle groups or sides). (https://thesoftwarefeatures.com/caliber-app-review-2026/)
- Weekly educational lessons + habit coaching; nutrition coach included at Premium (macros, not medical).

## 5.3 The coaching loop

- **Weekly asynchronous video check-in** — the standout mechanic: the coach records a Loom-style video reviewing your last week's lifts, notes, and feedback, then sets next week's goals. No scheduling friction. Optional weekly/monthly Zoom strategy calls per package. (https://sports-nerd.com/brand/caliber/, https://www.garagegymreviews.com/caliber-app-review)
- **Form-check videos:** record a set in-app, send to coach, get specific feedback ("the video review feature... is a real differentiator and works better than I expected").
- In-app chat with ~near-real-time responsiveness ("often replying within minutes"); coaches message proactively when they have something to say — not on a fixed cadence, "enough to feel accountable, not enough to feel surveilled."
- First coach match isn't always right (communication style/specialty); swap is supported, most users do it once. (https://thesunrisedigest.com/move/caliber-review-2026/)
- Coaching intensity levels scale the package (check-in frequency, calls) — price tiering by coaching intensity, not features.

## 5.4 Exercise & set prescription

- Video + text instructions for 500+ exercises, multi-step tutorials for complex lifts (deadlift/bench setup), "key takeaways" per exercise; exercise history per movement.
- App supports logging sets/reps/weight/RPE/notes, rest timers, 1RM estimators, progress graphs — but the *plan itself* is coach-written; the logger is tuned to the coaching workflow ("not best-in-class as a logger — Strong is faster — but clean, functional"). (https://thesoftwarefeatures.com/caliber-app-review-2026/, https://thesunrisedigest.com/move/caliber-review-2026/)

## 4.5→5.5 Human vs AI coaching

Human-only at Premium; the free tier is a competent self-guided logger (Fitbod-class library, no generation). The category verdict from reviewers: "The weekly adjustments are the most important feature and the thing no library-based app or AI app does well... Adaptive AI apps like Fitbod approximate this; human coaches doing it in real time are better." (https://thesunrisedigest.com/move/caliber-review-2026/)

## 5.6 GUI LAYOUT (deep detail)

- **Onboarding:** notably thorough questionnaire (goals, experience, equipment, schedule, injuries) — reviewers call it "long" but say it sets up genuine personalization; ends by routing to a sales call for pricing (criticized UX — pricing hidden until consultation). (https://www.garagegymreviews.com/caliber-app-review, https://sports-nerd.com/brand/caliber/)
- **Dashboard:** today's workout; weekly plan; coach messages; body stats; lessons feed.
- **Workout screen:** session with exercises, sets/reps/weight, video demos, RPE field, rest timer.
- **Coach chat tab:** threaded messaging with media (video uploads one-at-a-time — clunky, noted); Loom check-in videos play inline; Calendly booking for calls.
- **Form-review flow:** record → upload → coach comment thread.
- **Analytics:** Strength Score + Strength Balance cards, body measurement tracking, progress photos, cardio logs, Apple Health/Cronometer sync.
- Clean, motivating interface; "not flashy" is the consensus.

## 5.7 Pricing / engagement

- Freemium done right: free tier is genuinely usable (full library, logging, pre-built plans) — the free tier is Caliber's top-of-funnel and its main differentiator vs Future. Pro $19/mo, Premium $200+/mo with 30-day guarantee.
- Retention: coach relationship + weekly video rhythm + group communities (Run/Hike/Cycling interest groups, private training groups) + habit lessons.

## 5.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **The weekly "coach's video" format, replaced by a generated weekly summary** — a rule-based Coach can emit a *structured weekly review* (what you hit, what you missed, what changed next week and why) in the same Loom-video rhythm: delivered Monday, skimmable, references your actual numbers. The format (review → adjust → set next goals) is the steal, not the video.
2. **Asynchronous, bounded check-in cadence** — "not a strict checkin schedule; coach messages when there's something to say." A rule-based Coach should message on *events* (new PR, missed week, deload start, volume-floor warning) rather than on a fixed nagging cadence. Fewer, meaningful messages beat daily pings.
3. **Coach match is iterative** — Caliber accepts the first match may miss and makes swapping first-class. Analog: PersonalOS coach "personality" or strictness settings should be adjustable without resetting history.
4. **Strength Balance metric** — left/right and push/pull imbalance surfaced as data; a rules engine can compute this from logged volume per muscle and flag it as a gentle nudge (no shame language: "your left leg volume is 40% lower").
5. **Free tier as honest product** — even if PersonalOS never charges, the lesson stands: the tracker itself must be valuable independent of the coach layer.
6. **Periodization cadence of "every few weeks, not weekly"** — blocks give the coach time to accumulate data before adjusting; reduces reactivity. Matches RP/MEV-MRV mesocycle thinking (§10) and PersonalOS phase-based training.

---

# 6. Aaptiv

## 6.1 Overview

- **Positioning:** the audio-first fitness app — trainer-led audio workouts over curated music, "no screen needed," 10,000+ on-demand classes (2026) across running, treadmill, strength, yoga, pilates, cycling, boxing, stretching, meditation, sleep; plus **SmartCoach** AI plan generation; heart-rate zone training. Founded as consumer app; now heavily pivoted to employer/insurance benefits with a 19,500+-gym network (Aaptiv Access — employer-only). (https://aaptiv.com/, https://thesoftwarefeatures.com/aaptiv-review-2026/, https://www.topconsumerreviews.com/best-online-fitness-programs/reviews/aaptiv.php)
- **Platform:** iOS + Android; Apple Watch / Bluetooth HR monitors; Apple Health, Google Fit, Strava sync (reportedly buggy lately).
- **Pricing (2026):** $14.99/mo or $99.99/yr (~$8.33/mo); 7-day trial on annual; 30-day money-back on annual; no free tier; corporate pricing separately. (https://thesoftwarefeatures.com/aaptiv-review-2026/, https://www.garagegymreviews.com/aaptiv-fitness-app-review)
- **Popularity:** long-standing top audio fitness brand; ratings still "above average" but sliding (2026 complaints: glitches, music-selection screen blocking workouts, integrations breaking, employer-pivot neglect of core app). (https://www.topconsumerreviews.com/best-online-fitness-programs/reviews/aaptiv.php, https://play.google.com/store/apps/details?hl=en_US&id=com.aaptiv.android)

## 6.2 Core paradigm

- **SmartCoach:** short quiz (age, physical ability, goals) → assembles a personalized plan that adapts "as you progress." Goal-oriented multi-week programs (5K/10K/half-marathon race training, weight loss, strength, flexibility, maternity) with progressive overload built into the program structure. (https://thesoftwarefeatures.com/aaptiv-review-2026/, https://play.google.com/store/apps/details?hl=en_US&id=com.aaptiv.android)
- **Heart-rate zone training:** paired with a wearable, workouts give real-time zone feedback — the closest thing to objective intensity in an audio format.
- Adaptation is plan-level, not set-level; no recovery/fatigue model, no deload logic documented. (https://www.corahealth.app/uk/compare/freeletics — same assessment pattern: content + plan assembly vs true adaptation)

## 6.3 The coaching loop

- Quiz → SmartCoach plan → complete classes → stats/badges tracked → plan continues. Feedback is passive (completion data), not per-set ratings. No human coaching; community feed + team challenges provide accountability. (https://youraifinder.com/tool/aaptiv)

## 6.4 Exercise & set prescription

- **Audio-first coaching:** trainers call pace, form cues, encouragement over music; "Move Sync" clips and some video added for strength/pilates where visuals genuinely help. Music genre choice or voice-only mode for your own music. (https://youraifinder.com/tool/aaptiv, https://www.garagegymreviews.com/aaptiv-fitness-app-review)
- Classes have clear structure (work:rest ratios, intervals) but no per-set prescription UI for lifting; strength content is guided classes, not a logger. Accessibility win: audio-first is notably more accessible for visually impaired users and cramped spaces. (https://youraifinder.com/tool/aaptiv)

## 6.5 Human vs AI coaching

Pure AI/content. No 1:1.

## 6.6 GUI LAYOUT (deep detail)

- **Onboarding:** notably *short* for a coaching app — reviewers expected a long quiz given the Coach feature and were pleasantly surprised ("you might expect a long onboarding quiz—this is not the case"). (https://www.garagegymreviews.com/aaptiv-fitness-app-review)
- **Library/home:** classes browsable in ~16 categories (treadmill, walking, pilates, elliptical, strength, cycling, etc.); program cards; community feed ("sweaty selfies", team challenges); stats dashboard; achievements/badges.
- **Class player:** audio with optional video clip; music selector pre-play (and the 2026 bug reports revolve around this screen: off-center music selection blocking progression — a cautionary UI tale); HR zone display when paired.
- **Stats:** personal dashboard of completion, metrics, improvement over time.

## 6.7 Pricing / engagement

- $14.99/$99.99 + 7-day trial (annual) + 30-day guarantee; community challenges and monthly challenges for engagement; employer distribution is now the growth engine. 2026 trajectory is a caution: pivoting business model while letting core UX rot ("the app frequently defaults to offline mode without explanation", HR tracking unreliable) — trust erosion, exactly what a private personal app must never do.

## 6.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **Audio coaching format** — for a private life app, voice-guided sessions ("start your warm-up set, 5 reps at RPE 6") are a *privacy-friendly* alternative to video libraries: no video files to store/serve, works offline, and cue delivery is higher-bandwidth than text. Worth scoping as optional for PersonalOS.
2. **Heart-rate zone training as objective intensity** — even without a wearable, the pattern (target zones, real-time feedback) can be approximated with RPE-anchored zones; with a watch it's a genuine autoregulation input.
3. **Multi-week goal programs with fixed endpoints** — race-prep style countdown programs create commitment; PersonalOS phases could ship as analogous countdown blocks (e.g., 8-week cut block with a mid-point check-in).
4. **Anti-pattern documented:** the pivot-and-rot case — changing the product's core contract (gym network benefits only for employers, pricing hidden behind signup) destroyed trust with existing users. Lesson for PersonalOS: the data contract with the user (privacy-first, no upsells) is the product.
5. **Music/voice-only mode** — letting users bring their own media while coaching audio runs on top; a "voice-only" mode for a coach that respects the user's environment.

---

# 7. JuggernautAI

## 7.1 Overview

- **Positioning:** the elite powerlifting/powerbuilding autoregulation app — Chad Wesley Smith's (and Max Aita's) Juggernaut Method + *Scientific Principles of Strength Training* (co-authored with Dr. Mike Israetel) encoded as an expert system. "The smartest program for you." For serious lifters, not beginners. (https://aitoolsbakery.com/blog/juggernautai-review/, https://www.garagegymreviews.com/juggernautai-review)
- **Platform:** iOS + Android; 300+ exercises with video demos; 4.9-star ratings across 250,000+ users (claimed); MWM sentiment: praised for adaptive programming, criticized for cost, some bugs, volume excess. (https://aigearbase.com/tool/juggernautai, https://mwm.ai/apps/juggernautai/1515756471)
- **Pricing (2026):** $34.99/mo or $349.99/yr; 2-week free trial; 10% off codes around. Programs: Powerlifting, Powerbuilding, PowerCombo (v2.5, mid-2025 — hybrid hypertrophy→strength→peak), strongman-ish options, competition prep mode. (https://agent-finder.co/reviews/juggernautai, https://fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/)

## 7.2 Core paradigm

- **Expert-system periodization engine:** onboarding inputs (current PRs, training history, weak points, recovery capacity, goals, 2–6 days/week, session length, exercise variations like high-bar vs low-bar squat, sumo vs conventional DL) → the AI computes **individualized volume landmarks (MEV/MRV), frequency, and periodization strategy** and generates a multi-week block (accumulation → intensification → peaking). (https://aigearbase.com/tool/juggernautai, https://www.garagegymreviews.com/juggernautai-review)
- **Readiness Engine:** pre-session questionnaire (1–5: motivation, sleep, nutrition, overall soreness/fatigue + per-muscle-group soreness) → the app adjusts *that day's* loads and rep schemes (a sore-quads report drops squat load for the session only, not the block). (https://www.garagegymreviews.com/juggernautai-review, https://help.jtsstrength.com/en/articles/3-how-juggernautai-is-individualized-to-you)
- **RPE/RIR autoregulation:** log RPE/RIR after top sets and back-down sets; the AI adjusts next sets intra-session, then next week's volume/intensity. Verified in an 8-week test: "the AI correctly reduced squat volume in week 4 after we logged multiple RPE 9+ sets (we were overreaching)"; e1RM estimates within 5–10 lb of tested maxes. (https://agent-finder.co/reviews/juggernautai)
- **v2.5 (mid-2025):** updated volume algorithms, re-configured Readiness Engine (better at detecting accumulated fatigue → deload sooner), PowerCombo. (https://fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/)
- **V3.0 (Aug 2026):** full rebuild — standardized 0–100 readiness scoring with zones, habit tracker (full-year view), recovery metrics (sleep, bodyweight trends), SBD + total tracking on home screen, full-block view, faster daily check-in, global rest timer (main lifts vs accessory, custom audio cues, lock-screen Live Activities on iOS Liquid Glass). (https://www.juggernautai.app/blog/juggernautai-v3-0-is-here)
- **Meet Day Advisor:** competition date input → program peaks 1–2 weeks out (taper reduces volume 60–70% while keeping intensity), programs openers/attempts. (https://agent-finder.co/reviews/juggernautai, https://aigearbase.com/tool/juggernautai)

## 7.3 The coaching loop — the multi-level check-in ladder

Explicitly documented as **six levels of adaptation** (https://help.jtsstrength.com/en/articles/3-how-juggernautai-is-individualized-to-you):
1. **Pre-training readiness questionnaire** — daily.
2. **Intra-session performance** — top set/back-down set RPE entered mid-session, next sets tweaked.
3. **End-of-session check-in** — feeds a running, weighted **readiness score**.
4. **End-of-week check-in** — fine-tunes next week.
5. **End-of-block check-in** — significant adjustments for the next phase (hypertrophy/strength/peaking).
6. **End-of-program check-in** — after meet/mock meet, feedback informs the *next* program's volume/frequency choices.

This ladder is the cleanest articulation in the cluster of "what happens between sessions."

## 7.4 Exercise & set prescription

- Focused on squat/bench/deadlift + variations + minimal accessories ("main lifts, supplemental work, and minimal accessories"); waves, deload weeks, intensity peaks; sessions 60–90 min typical.
- 300+ exercise videos with coaching cues; warm-up planner and plate-math calculator built in; RPE entered after working sets; per-day loads written as % of training maxes.
- No Apple Health/Garmin integration (documented gap: extra-cardio fatigue can't be accounted for; you compensate via RPE). (https://aitoolsbakery.com/blog/juggernautai-review/)
- Volume can overshoot recovery if you rate RPE dishonestly (MRV model assumes calibrated RPE) — common complaint. (https://aitoolsbakery.com/blog/juggernautai-review/)

## 7.5 Human vs AI coaching

No humans. But "built by an elite coach" branding means the AI's authority comes from methodology provenance — reviews consistently say "it felt like it was written by someone who actually competes." The Juggernaut ecosystem adds community, seminars, Q&As as subscription perks.

## 7.6 GUI LAYOUT (deep detail)

- **Onboarding:** full assessment (name/age/weight/height, training load, years trained, style, days/week, goals, PRs, weak points, recovery, exercise variations). "Thoroughness of the fitness assessment" praised. (https://www.garagegymreviews.com/juggernautai-review)
- **V3.0 home screen = daily decision hub:** readiness score (0–100 with zones), today's session, SBD totals, habit calendar, recovery metrics, training articles feed. (https://www.juggernautai.app/blog/juggernautai-v3-0-is-here)
- **Pre-V3 tabs:** Dashboard (program progress + week overview), Workouts (follow-along session), Exercises (demo videos + written cues). "Dashboard initially feels somewhat overwhelming... blue-on-black design can be tough to read." (https://www.garagegymreviews.com/juggernautai-review)
- **Daily readiness screen:** sliders/scales for motivation, sleep, nutrition, soreness/fatigue overall + per muscle group — answered before the workout loads, and the load/rep scheme visibly responds.
- **Session screen:** warmup ramping, working sets with % targets, RPE entry after sets, rest timer (V3: global vs accessory presets, lock-screen Live Activity, voice cues/beeps/silent modes).
- **Graphs/calendar:** overhauled charts, calendar view of cycles, meet-day prep views; utility suite (warm-up planner, plate math).

## 7.7 Pricing / engagement

- $34.99/mo — justified by reviews *only* for competitive lifters; annual $349.99; 2-week trial. Retention: meet-prep deadlines, long periodized blocks, community/education ecosystem.
- The pricing critique is itself instructive: "at $349.99/yr... for a recreational lifter it's $420 a year for a tool that will prescribe more volume than you want." Scope discipline matters.

## 7.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **The six-level check-in ladder (pre-session → intra-session → post-session → weekly → block → program)** — the definitive spec for a Coach's adaptation cadence. PersonalOS can implement all six as rule triggers; each level has a distinct data source and a distinct adjustment scope.
2. **Daily readiness with per-muscle soreness → same-day load adjustment** — "squat is scheduled but quads/glutes are wrecked → drop squat load for today only, leave the block intact." A single-day override rule, exactly the deload-marker behavior PersonalOS wants.
3. **Readiness score as a running weighted average** (V3: normalized 0–100 with zones) — a Coach can keep a fatigue index that gates volume increases and flags deloads.
4. **MRV-informed volume landmarks computed per lifter at program generation** — PersonalOS's "weekly volume floors (MRV-style)" should ship as explicit MEV/MAV/MRV numbers per muscle (see §10 for the canonical tables) with the Coach adjusting *between* blocks, not every session.
5. **Meet-day peaking as a first-class feature** — calendar-anchored tapers (volume −60–70%, intensity held) are pure rules; a "goal date" input for PersonalOS phases (e.g., end-of-cut date) could reuse the same taper logic.
6. **Provenance as authority** — "the program quality is elite because the methodology is Chad Wesley Smith's." A rule-based Coach should name its sources (Epley, Prilepin, Israetel volume landmarks, Schoenfeld) so users can trust deterministic logic instead of mystery AI.

---

# 8. Stronger by Science (program tools)

## 8.1 Overview

- **Positioning:** not an app — the evidence-based training site (Greg Nuckols) whose free **spreadsheet program bundle** is the reference implementation of autoregulated programming. Plus the **28 Programs** (single-lift templates) and a growing tool ecosystem (MacroFactor sibling; SBS coaches for paid 1:1). (https://www.strongerbyscience.com/, https://www.strongerbyscience.com/program-bundle/)
- **Pricing:** the Program Bundle (6 programs + Program Builder) is **completely free** via email signup; 28 Programs free via newsletter; coaching paid separately. (https://liftvault.com/programs/strength/stronger-by-science-sbs-program-bundle-by-greg-nuckols/)
- **Platform:** Google Sheets workbook (excel-in-browser); Boostcamp hosts the beginner version; Nuckols has hinted at a future SBS workout app (newsletter signup mention: "Greg's latest projects, including the workout app"). (https://liftvault.com/programs/powerlifting/greg-nuckols-28-programs-spreadsheet/, https://www.strongerbyscience.com/newsletter/)

## 8.2 Core paradigm — the canonical autoregulation rules (directly stealable)

The bundle = six 21-week programs (three 7-week blocks; **weeks 7/14/21 are deload weeks**), configurable 3–6 days/week. All autoregulate the training max from performance. The rules, exactly as published (https://liftvault.com/programs/strength/stronger-by-science-sbs-program-bundle-by-greg-nuckols/):

- **RTF (Reps to Failure)** — "the most popular variant on Reddit": 4 normal sets + final set to failure. **Beat the rep target → training max +~0.5% per extra rep. Miss by 2+ reps → −~1% per missed rep. Hit it exactly → no change.**
- **RIR (Reps in Reserve)** — sets stop at a prescribed RIR (higher RIR at low %1RM, lower at high %). **Complete more sets than the upper threshold (default 6) → TM +2%; fewer than the lower threshold (default 4) → TM −5%.**
- **Overwarm single** — optional heavy single at RPE 8 (~90% true 1RM) before working sets; **logging it recalibrates the training max on the fly** (460 lb overwarm single with TM set at 490 → TM adjusts). Daily autoregulation on top of weekly.
- **Hypertrophy Template:** 3 sets + 1 to failure, intensity capped ~82.5% of 1RM, higher rep ranges; same autoregulation.
- **Novice variants:** SBS Linear Progression (fixed sets/reps, near-weekly weight jumps) and Novice Hypertrophy — simpler rules for new lifters.
- **Program Builder:** mix progression schemes per lift (RTF for squat, RIR for bench, etc.), custom exercises, from-scratch autoregulated programs.

Also: the **28 Programs** — 3 lifts × 3 experience levels × 3 frequencies (+1 deadlift variant) = 28, 4-week cycles ending in a **1RM test that resets the percentages for the next cycle** — the simplest possible periodization loop. (https://liftvault.com/programs/powerlifting/greg-nuckols-28-programs-spreadsheet/)

## 8.3 The coaching loop

Spreadsheet-native: you log reps/AMRAP/RIR, the sheet computes the next week's loads. Feedback is numeric (reps hit, sets completed, RPE of the overwarm single); "the weight naturally adjusts based on honest reporting" (community verdict). No app, no UI, no messages — but the *rules* are the most battle-tested autoregulation logic in the field, and the r/weightroom results (e.g., +75 kg to combined TMs in 9 weeks on 6-day RTF) are the best evidence in this research that deterministic autoregulation works as well as it does.

## 8.4 Exercise & set prescription

- Percentages of a training max per exercise; rep targets per block; intensity climbs across blocks while reps drop; RIR targets scale with % (higher RIR at low %). No rest timing, no video, no logging UI — it's a program, not a player. Its "GUI" is the spreadsheet's conditional formatting (targets vs your entered reps) and the calculator cells.

## 8.5 Human vs AI coaching

None (except the optional paid SBS coach service). The tools are "here's the algorithm, you execute it."

## 8.6 GUI LAYOUT

- Not applicable in the app sense — but the *documentation pattern* is the steal: each program ships with a PDF explaining how to choose between configurations (frequency × experience), what autoregulation does, and why the rules exist. Education is part of the product.

## 8.7 Pricing / engagement

Free; engagement via newsletter, research reviews, and the MacroFactor ecosystem. The 21-week block + deload structure is the retention mechanic — you always know where you are in a plan.

## 8.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **The exact TM-adjustment rules (RTF: +0.5%/extra rep, −1%/missed; RIR: +2%/>6 sets, −5%/<4 sets)** — copy-paste-ready heuristics for PersonalOS's est-1RM and progressive overload engine. They're simple, monotonic, and self-correcting.
2. **Overwarm single as a daily recalibration probe** — a non-exhaustive way to sanity-check the training max mid-block; pairs perfectly with PersonalOS's PR detection (an overwarm single that beats the TM IS a PR signal).
3. **Fixed deload weeks on a schedule (7/14/21) rather than felt-need deloads** — periodization rhythm beats reaction when data is noisy; combine with reactive markers (RP/JuggernautAI) for hybrid behavior.
4. **1RM test at the end of every cycle resets percentages** — the 28-Programs loop: 4 weeks of %-based work, test, re-baseline, repeat. Simple, motivating, honest.
5. **Novice variants with *simpler* rules** — linear progression for beginners, autoregulation for intermediates. A Coach should tier its own rule complexity by experience level (also matches Fitbod's beginner-conservative seeding and JuggernautAI's "not for beginners" stance).
6. **Documentation as product** — SBS's explainer PDFs are why the free spreadsheets became legendary. PersonalOS's Coach should be able to explain every rule it applies (cites included).

**Bonus tooling (adjacent, same community):** the Stronger app's **1RM Calculator** computes **seven formulas (Epley, Brzycki, Lander, Lombardi, Mayhew, O'Conner, Wathen), headlines the mean, and shows the spread** — "a tight spread means the formulas agree; a wide spread is a built-in uncertainty signal." It also adds RiR to completed reps before estimating (a 5-rep set with 2 in reserve is treated as a 7-rep set). This is the gold standard for PersonalOS's est-1RM display: Epley is the default, but showing the spread is honest uncertainty communication. (https://www.strongermobileapp.com/tools/1rm-calculator)

---

# 9. Alpha Progression ("Alphastrength" class)

## 9.1 Overview

- **Positioning:** the focused hypertrophy app — RIR-based programming engine, auto-progression lift-by-lift, muscle-group volume analytics. German-built (2019, Benjamin Schnabel & Marwin Sinapius). "The best AI-powered hypertrophy training app for intermediate lifters" per Agent Finder's 4-week test (8/10). (https://agent-finder.co/reviews/alpha-progression, https://fitnessdrum.com/alpha-progression-app-review/)
- **Platform:** iOS + Android; 700+ exercises with video demos; App Store 4.9/5 (1,700+ reviews), Google Play 4.7/5 (18,000+). (https://www.hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany)
- **Pricing (2026):** Freemium — free tier (1 AI plan, limited progression); Pro $12.99/mo or $79.99/yr (some sources list $9.99/$59.99; pricing varies by region/date — the July 2026 App Store snapshot says $12.99/$79.99); 14-day trial; frequent 20% codes. (https://push-pull.app/blog/push-pull-vs-alpha-progression, https://agent-finder.co/reviews/alpha-progression, https://fitnessdrum.com/alpha-progression-app-review/)

## 9.2 Core paradigm

- **RIR-based autoregulation per lift:** after each set you rate RiR; the engine converts it to an **e1RM per exercise** and suggests the exact next weight. Observed behavior in testing: bench 185×8 @ RIR 2 → next session suggested 190×8 (a sensible microload); higher RiR (easier) → more aggressive increase; RIR 0–1 → maintain weight, target more reps. (https://agent-finder.co/reviews/alpha-progression)
- **Plan generator:** experience level, training frequency, equipment, goals (muscle building / max strength / strength endurance), muscle preferences → periodized plan with sensible splits (PPL etc.) and 12–20 sets/week for priority muscles.
- **Volume analytics:** weekly sets per muscle group visualized (chest 18 vs rear delts 6 at a glance) — the MAV-style check PersonalOS wants.
- **Deload weeks** (expert settings) + periodization tools; **gym profiles** (multiple equipment presets — hotel gym, home, commercial — plan adapts to the active profile). (https://www.hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany)
- **Substitution engine:** equipment-aware — "if your gym doesn't have a cable machine, it suggests dumbbell alternatives that hit the same muscles." (https://agent-finder.co/reviews/alpha-progression)

## 9.3 The coaching loop

- Log set + RiR → e1RM updates → next session's weight/rep targets recalculated → volume analytics accumulate → plan is periodized in blocks with deloads. Session-to-session adaptation via RiR; no readiness/HRV inputs; no messages. Effectively the cleanest "micro-adjustment" loop in the consumer cluster.

## 9.4 Exercise & set prescription

- Set-by-set weight AND rep recommendations ("precise recommendation of how much weight and how many reps to go for"); rest timer support; 10RM tracking relevant for German Volume Training; charts and CSV export; in-session guidance to adapt on the fly. No video *during* sets — library videos for learning.

## 9.5 Human vs AI coaching

None. Positioning is "plan generator + progression coach" — explicitly compared to a spreadsheet-replacement ("takes the guesswork out").

## 9.6 GUI LAYOUT (deep detail)

- **Onboarding:** goal → experience → equipment → schedule (days/week, duration) → muscle focus priorities → plan generated with a set duration (e.g., 6 weeks); "clean and minimal interface with just the correct number of options" — reviewers consistently call the UI a strength. (https://www.hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany)
- **Gym profile switcher:** equipment presets changeable in seconds; plan adapts automatically.
- **Workout screen:** exercise list with sets/reps/target weights, RiR input after each set, rest timer; progress recommendations inline.
- **Analytics:** volume charts per muscle group, strength/bodyweight/body-fat trends, graphical insights; CSV export.
- **Expert settings:** deload weeks, RiR tracking toggles.

## 9.7 Pricing / engagement

- Freemium with a genuinely usable free tier; $12.99/$79.99; 14-day trial; discount codes ubiquitous (FD20, HOTELGYMS 20%). Retention: auto-progression (app thinks for you) + volume analytics (insight loop).

## 9.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **RiR→e1RM→next-load microloading rule set** — the exact behavior a Coach needs for "log your set, get the next weight": RiR ≥3 → bump load more; RiR 0–1 → hold load, push reps; mid-range → small increment. Simple decision table, no ML. (Same family as Volt's Smart Sets but coarser and easier to explain.)
2. **Muscle-group volume analytics as the weekly report** — "you can see at a glance if your chest is getting 18 sets while your rear delts get 6." This *is* PersonalOS's weekly-volume-floor feature; the steal is making it a visual, per-muscle bar chart with landmark bands (MEV/MAV/MRV).
3. **Multiple gym profiles with plan adaptation** — equipment presets are cheap to implement and massively increase plan adherence across contexts (home/gym/travel).
4. **Set-duration plans** (e.g., 6-week blocks) with tweak-on-the-fly — plan horizon plus flexibility; matches PersonalOS training phases.
5. **RiR as a beginner-friendly intensity language** — "how many reps did you have left?" is more intuitive than RPE scales; Alpha Progression proves it works as the *primary* signal rather than a pro feature.

---

# 10. RP Hypertrophy App (discovered — highest relevance to PersonalOS)

## 10.1 Overview

- **Positioning:** Dr. Mike Israetel's (Renaissance Periodization) hypertrophy app — the commercial implementation of the **MEV/MAV/MRV volume-landmark framework**. A "volume management tool," not a workout generator: it decides how many sets per muscle per week and adjusts week to week. (https://rpstrength.com/pages/hypertrophy-app, https://fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/)
- **Platform:** web app (browser, any device — "save to home screen") + iOS app; US Google Play "shortly" per RP Strength page; 45+ templates + Meso Builder (custom mesocycles with per-muscle priority). (https://rpstrength.com/pages/hypertrophy-app)
- **Pricing (2026):** $34.99/mo, ~$200/yr on sale (6-mo $199.99, annual $299.99); 14-day trial; 30-day money-back; no free tier. App Store reviews skew "worth it but the price is offensive" — the pricing lesson. (https://dr-muscle.com/rp-hypertrophy-app-for-strength-training-expert-review/, https://apps.apple.com/us/app/rp-hypertrophy/id1555614554?platform=iphone&see-all=reviews)

## 10.2 Core paradigm — the volume-landmark framework (canonical numbers)

From RP Strength's own articles (https://rpstrength.com/blogs/articles/training-volume-landmarks-muscle-growth) and the calculator ecosystem built on it (https://peakcalcs.com/training/workout-volume, https://mesostrength.com/tools/volume-landmarks-calculator):

- **MV (Maintenance):** ~6 working sets/muscle/week (at 2× weekly frequency) — keeps muscle.
- **MEV (Minimum Effective):** where growth starts — beginners ≈ MV, widens with experience.
- **MAV (Maximum Adaptive):** the growth sweet spot — e.g., chest/back 12–20 sets/wk, quads 10–18, shoulders 8–16, hamstrings 8–14, biceps 8–14, triceps 6–12, calves 8–16 (per Schoenfeld 2017 + Israetel et al. 2019).
- **MRV (Maximum Recoverable):** the ceiling — chest 22–26, back 22–25, shoulders 18–22, quads 20–24, hamstrings 16–20, biceps 16–20, triceps 14–18, calves 18–22.
- **Mesocycle structure:** start near MEV, add sets weekly (1–2/muscle/wk) toward MAV/MRV by the final week, then **deload to MEV or below**, repeat with fresh exercises.
- **Adjustment rules (from the app's feedback model):** performance 1s (improved) on a muscle + low soreness → add 2–3 sets next week; mixed 1–2s → add 1 set; no change + moderate soreness → maintain; performance 4 (crash) → recovery session or deload.
- Direct-volume counting convention: only sets where the muscle is prime mover or isolated count (indirect stimulus pre-factored).

## 10.3 The coaching loop

- Per-session feedback: **pump, soreness, performance, "disruption" (fatigue/strength loss), joint pain** — logged after sessions (or soreness pre-session, per user requests); the app recomputes next week's per-muscle set counts. It does NOT use RPE as the primary signal (pump/soreness/performance instead) and does **not prescribe rest periods** (a documented gap users request).
- Users report it drives volume higher than they'd choose ("more is more" bias for non-enhanced lifters) and hides its reasoning ("interface often hides the logic behind its decisions... makes it feel random"). Community advice: run defaults for one meso, then adjust between mesos, not during. (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143)

## 10.4 Exercise & set prescription

- Templates autofill exercises; exercises fully user-customizable (Meso Builder: priorities, frequency, per-muscle sets); rep ranges + RiR targets per week (app pushes closer to failure as the meso progresses: 2–3 RiR early → 0–1 late); no rest timer; no video library depth (web-first).

## 10.5 Human vs AI coaching

None; the "coach" is the framework itself. The fitnessaitrends verdict applies broadly: "Neither is doing anything that deserves the word 'AI' in its name. They are well-designed autoregulation systems with clean UX. Calling them AI apps is marketing." (https://fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/)

## 10.6 GUI LAYOUT (deep detail)

- **Meso Builder:** per-muscle priority sliders, frequency, exercise selection, block length (4–8 weeks); generates a week-by-week plan.
- **Daily plan screen:** exercises with sets/reps/RiR targets; after-session feedback screen with the pump/soreness/performance sliders.
- **Volume visualization:** per-muscle weekly set counts vs landmarks.
- Onboarding "confusing, especially with all the sliders and auto stuff" (user consensus) — the cautionary tale: powerful knobs without explanation hurt.

## 10.7 Pricing / engagement

$34.99/mo or ~$200/yr sale; 14-day trial; retention = mesocycle commitment (you can see the block to its end) + results ("Best gains of my life" reviews).

## 10.8 Differentiators & steal-worthy features (for a rule-based offline Coach)

1. **The MEV/MAV/MRV table as a first-class, per-muscle data structure** — PersonalOS's locked "weekly volume floors (MRV-style)" should BE this table, tuned by experience level, with the Coach exposing floors (MEV) and ceilings (MRV) and tracking where you are in the band. Direct-count convention (prime-mover sets only) is the implementable detail.
2. **The volume-adjustment decision table** (performance 1s→+2–3 sets; 2s→+1; no change→hold; 4→deload) — deterministic, explainable, and exactly the "gentle nudge" behavior the PersonalOS Coach wants ("you've been under your chest floor 2 weeks running — add a set").
3. **Meso-commitment UX** — a named block with an endpoint the app won't let you abandon reflexively; users credit it with fixing their consistency. PersonalOS training phases (bulk/cut/maintain) + post-deload ramp fit this shape.
4. **Pump/soreness/performance as the feedback triad** — an alternative to RPE that lay users find more intuitive; combining both (RP signals for volume, RiR for load) is the most complete rule-based feedback stack in the market.
5. **Anti-pattern documented twice:** (a) volume bias toward "more is more" and (b) hidden decision logic. A rule-based Coach must show its work ("chest at 10 sets vs your 12–20 target; adding 1 set next week") — transparency is a differentiator even for free.
6. **Soreness reported pre-session** (user-requested change) — collecting the previous session's feedback at the START of the next workout (when it's still accurate) beats end-of-session sliders when users are pumped/exhausted.

---

# 11. Cross-app synthesis: what a rule-based Coach (no LLM) should steal

Ranked by leverage for PersonalOS M2 (gym logging, est-1RM Epley, seeded exercises with categories + muscle tags, templates, PR detection, strength standards, deload markers, weekly volume floors, plan adherence, training phases, post-deload return ramp):

| # | Pattern | Source | Implementation notes (rule-based, offline) |
|---|---|---|---|
| 1 | **Expected-vs-actual effort table** (Prilepin relative intensity → expected RPE; deviate ≥2 → adjust e1RM) | Volt Smart Sets | Pure lookup table + delta rule; the most precise no-ML autoregulation in the market. |
| 2 | **Training-max adjustment rules** (RTF: +0.5%/rep beat, −1%/rep missed; RIR: +2%/>6 sets, −5%/<4 sets; overwarm single recalibration) | SBS Program Bundle | Exact copy-paste rules; combine with Epley e1RM as the estimator. |
| 3 | **MEV/MAV/MRV volume bands per muscle + adjustment decision table** (1s→+2–3 sets, 2s→+1, hold, 4→deload) | RP Hypertrophy / Israetel | The locked MRV-style weekly floor feature; expose bands, count prime-mover sets only. |
| 4 | **Per-muscle recovery % with manual override + heat-map view** | Fitbod | Deterministic fatigue model from logged sessions; user can correct it (hike, sick day). |
| 5 | **Max Effort Day / AMRAP recalibration every few sessions** | Fitbod, SBS (RTF), 28 Programs (cycle-end 1RM test) | PR detection hook AND e1RM refresh in one; flag 1–2 exercises per N sessions. |
| 6 | **Six-level check-in ladder** (pre-session readiness → intra-session → post-session → weekly → block → program) | JuggernautAI | The spec for PersonalOS Coach event triggers; each level = separate rule scope. |
| 7 | **Daily readiness + per-muscle soreness → same-day load override only** | JuggernautAI | "Deload markers" in concrete form: adjust today's session, not the block. |
| 8 | **Pre-session "adapt" affordance** (tired/short on time/no equipment → rewritten session) | Freeletics | Session-level load multiplier + shorter variant + equipment-constrained selection. |
| 9 | **One-tap post-workout feedback UX** (segmented buttons, defaulted happy path, first-run education) | Freeletics case study | The interaction design spec for the Coach's data intake; 2 interactions max. |
| 10 | **Inactivity decay** (time off lowers starting loads) | Fitbod | Per-exercise e1RM multiplier by days-since; directly serves the post-deload return ramp. |
| 11 | **Movement-pattern replacement** (6 same-category alternatives; equipment-aware) | Volt Movement Mesh, Alpha Progression | Reuses PersonalOS's planned category + muscle tags; single query type. |
| 12 | **Session-level difficulty rating** (too easy/perfect/too hard → next-week intensity) | Freeletics | Coarse fallback signal for users who won't log RiR. |
| 13 | **Exercise preference learning from edits** (swap/rate/exclude reshape future selection) | Fitbod | Weighted preference scores updated on every manual edit. |
| 14 | **Weekly coach summary in a fixed rhythm** (review → adjust → next-week goals) | Caliber weekly Loom | Generated, template-driven "coach's message" — no LLM needed. |
| 15 | **7-formula e1RM with mean + spread display** (RiR added to reps before estimating) | Stronger app calculator | Epley as default; show the spread as honest uncertainty. |
| 16 | **Volume analytics per muscle with landmark bands** | Alpha Progression, RP | The weekly report visual: bar chart vs MEV/MAV/MRV shading. |
| 17 | **Fixed deload weeks on schedule (7/14/21) combined with reactive markers** | SBS + JuggernautAI/RP | Rhythm default + event overrides; the hybrid deload system. |
| 18 | **Gym profiles (equipment presets) with auto plan adaptation** | Fitbod, Alpha Progression | Cheap, high-value for plan adherence. |
| 19 | **Tone spec: missed workouts "noted, but not intimidating"** | Future (Good Housekeeping) | Direct sourcing for the no-shame-language constraint. |
| 20 | **Documented uncertainty and sources** (explain rules, cite them) | SBS docs, Volt recalibration guide | Trust without AI; "show your work" is the Coach's voice. |

**Cross-cutting findings worth flagging:**
- Every adaptive app here converges on the same core: *a recovery/fatigue state model + effort feedback + deterministic adjustment rules*. The "AI" branding is cosmetic. PersonalOS can implement the entire M2 adaptive layer as tables and thresholds.
- The biggest UX wins are not algorithmic: Freeletics' feedback-screen economics, Fitbod's constraint explanations, RP's meso commitment, Caliber's weekly rhythm, JuggernautAI's check-in ladder.
- Documented failure modes to design around: hidden decision logic (RP), volume bias toward "more is more" (RP), over-conservative adaptation (Freeletics), poor substitution relevance (Freeletics), RPE honesty assumptions (JuggernautAI), pricing/scope discipline (JuggernautAI, RP), platform neglect eroding trust (Aaptiv).

---

# Appendix: comparison table (2026)

| App | Paradigm | Adaptive core | Feedback signals | Price (2026) | Free tier |
|---|---|---|---|---|---|
| Fitbod | Algorithmic generator | Recovery % per muscle, e1RM (Epley), Max Effort Days | RiR, edits, exercise ratings | $15.99/mo, $95.99/yr | No (7-day trial) |
| Future | 1:1 human coach | Human judgment + wearable telemetry | Daily messages, watch data | $199/mo ($50 first month) | No (30-day guarantee) |
| Freeletics | AI Coach, journeys | Session difficulty → next week; pre-session adapt | Too easy/perfect/too hard | €12.99/mo, €79.99/yr | Limited (~30 workouts) |
| Volt Athletics | Sport-science + Cortex AI | Smart Sets (Prilepin expected-vs-actual RPE), e1RM | Set-level RPE | $19.99/mo, $129.99/yr | No (3/7/14-day trials) |
| Caliber | Human coach + free logger | Coach-adjusted periodized blocks | Weekly video check-ins, form videos | Free / $19 Pro / $200+ Premium | Yes (full, ad-free) |
| Aaptiv | Audio content + SmartCoach | Plan-level adaptation, HR zones | Completion stats | $14.99/mo, $99.99/yr | No (7-day trial) |
| JuggernautAI | Expert-system periodization | Readiness engine, RPE/RiR, MEV/MRV, peaking | Pre/intra/post-session, weekly, block, program | $34.99/mo, $349.99/yr | No (2-week trial) |
| Stronger by Science | Free spreadsheet autoregulation | RTF/RIR TM rules, overwarm single, deloads | Reps hit, sets, RPE | Free | Yes (full) |
| Alpha Progression | Hypertrophy autoregulation | RiR→e1RM microloading, volume analytics, deloads | Set-level RiR | $12.99/mo, $79.99/yr | Yes (limited) |
| RP Hypertrophy | Volume-landmark manager | MEV/MAV/MRV adjustment table | Pump/soreness/performance | $34.99/mo, ~$200/yr sale | No (14-day trial) |