# Strength Standards, Powerlifting & Periodization Tools — Research Report (M2 Fitness Cluster)

Cluster: StrongLifts 5x5, Five3One / 5/3/1 apps, Liftosaur, GZCLP tools, Renaissance Periodization (RP Strength), Alpha Progression, Symmetric Strength, OpenPowerlifting, and strength-standards reference sites (strengthlevel.com, Lift Vault, Fitness Volt). Researched Aug 2026. Each section follows the 1–7 structure (overview / paradigm / progression logic / standards & rankings / PR tracking / GUI layout / steal-worthy features).

---

## 1. StrongLifts 5x5 (app + program)

### 1.1 Overview
StrongLifts is a beginner barbell strength program (created by Mehdi Hadim, running since 2007) built on the classic 5x5 scheme popularized by Reg Park, Bill Starr, Glenn Pendlay — "the simplest, most proven barbell program" (https://stronglifts.com/stronglifts-5x5/). The app is free to download with a required subscription: Pro Yearly $59.99 (7-day trial), Pro Monthly $11.99, Pro Quarterly $29.99, Pro Weekly $4.99; a $199.99 yearly tier also exists (https://apps.apple.com/us/app/stronglifts-5x5-workout-plan/id488580022). Claims 5M+ downloads, 30M+ workouts logged, 4.9 rating with 200k+ five-star reviews; cited in the British Journal of Sports Medicine (https://stronglifts.com/app/). App family: 5x5 Basic, Plus, Lite, Mini, Ultra, Ultra Max, SL5x5 Intermediate, Madcow 5x5 (https://stronglifts.com/stronglifts-5x5/).

### 1.2 Core paradigm
Linear progression: three workouts/week, at least one rest day between, alternating Workout A (Squat 5x5, Bench 5x5, Row 5x5) and Workout B (Squat 5x5, OHP 5x5, Deadlift 1x5). Add weight if you completed all sets last time; repeat if you failed any set; deload after repeated failure (https://stronglifts.com/stronglifts-5x5/workout-program/). The app plans every exercise, set and weight, runs an automatic rest timer, warm-up calculator and plate calculator so the lifter "just follows along" (https://stronglifts.com/app/).

### 1.3 Progression logic (deep)
- **Increments**: per-exercise configurable. Default +5lb on complete 5x5; frequency configurable (every 1, 2, 3 or 5 workouts). Recommended increments: Squat/Deadlift 5–10lb (2.5–5kg), Bench/OHP/Row 2.5–5lb (1.25–2.5kg) — small muscles use smaller jumps; women often 2.5lb from day one. If you enter gender/bodyweight/strength level the app auto-sets and auto-adjusts increments (e.g., dropping Deadlift to 5lb jumps as it gets heavy) (https://stronglifts.com/stronglifts-5x5/progress/, https://support.stronglifts.com/article/71-progression).
- **Failure handling**: any set with fewer reps than target = no weight increase next time ("complete the sets at the given weight before adding more"). Failed-set logging is deliberately clunky: tap the set circle repeatedly to decrement reps (https://support.stronglifts.com/article/71-progression).
- **Deload rule (the famous one)**: fail to complete all sets of an exercise 3 sessions in a row → weight drops 10% next time. Configurable: deload % (default 10%) and fail count (default 3; can be 2 or 1). Rationale: 3 fails filters out "bad days" (sleep/food/focus) (https://support.stronglifts.com/article/71-progression, https://stronglifts.com/app/).
- **Return-from-break**: auto-detects ≥1 week without lifting → "Welcome Back" card with a recommended deload % and a slider to adjust; can be ignored, disappears once workout starts (https://support.stronglifts.com/article/71-progression).
- **Manual override**: manually entering next-workout weights overrides auto-progression; deleting the scheduled workouts on the home screen resets it (https://support.stronglifts.com/article/71-progression).
- **Rest timer**: dynamic — tells you to rest longer after failed sets; Apple Watch support (https://stronglifts.com/app/).

### 1.4 Standards & rankings
StrongLifts does not compute percentile standards. It only asks experience level (untrained/trained) to calculate starting weights (https://stronglifts.com/stronglifts-5x5/workout-program/). Its value is automation of progression, not ranking — a deliberate scope choice worth noting for PersonalOS (standards belong in a separate vault view, not in the workout flow).

### 1.5 Records/PR tracking
- Exercise history shows a star every time a personal record is hit; "use the exercise history to easily find your best lifts" (https://stronglifts.com/app/).
- Progress graphs per exercise: weight lifted, estimated 1RM (e1RM, computed from sets of 1–12 reps or 5x5), volume (sets×reps×weight), total reps (https://support.stronglifts.com/article/89-graphs).
- History tab: List (all workouts, resume unfinished), Calendar (red circles per completed day — "one red circle every Mon/Wed/Fri without gaps" is an in-community consistency goal), Notes (https://support.stronglifts.com/article/72-history).
- PR celebration is minimal: a star icon + charts. A UX teardown explicitly flags the completion screen as "simple but could be more celebratory" — a gap PersonalOS trophies can fill (https://screensdesign.com/showcase/stronglifts-weight-lifting-log).

### 1.6 GUI layout (deep)
- **Onboarding**: vertical scrolling pickers for age/height/weight (engaging vs text fields), experience level input; schedule setup enforces rest days (flags "you need a rest day" before allowing completion — "smart constraints"); culminates in a projected "12-Week Progress Plan" visualization of future success; then paywall (https://screensdesign.com/showcase/stronglifts-weight-lifting-log).
- **Home screen**: the upcoming workout(s) listed directly with exercises/weights; a single dominant "Start Workout" CTA; "Welcome Back" deload card appears after a break; widgets show next workout + weekly/monthly consistency; app shortcuts to Start/Resume/History (https://support.stronglifts.com/article/177-widget, https://support.stronglifts.com/article/186-widget).
- **Workout screen**: each exercise is a row with set circles — one tap marks the set complete at target reps; multiple taps = failed set; circle shows achieved reps; tap the weight to edit, scroll down for increments/deload progression settings; warm-ups listed above working sets; rest timer auto-starts after each logged set; "finish" triggers a confirm popup if sets remain unlogged (prevents accidental early finish); note field at bottom (https://support.stronglifts.com/article/63-log-workouts, https://support.stronglifts.com/article/71-progression).
- **Exercise detail**: "Form" tab with instructions + video inline (https://screensdesign.com/showcase/stronglifts-weight-lifting-log).
- **History tab**: List / Calendar / Notes sub-tabs (https://support.stronglifts.com/article/72-history).
- **Progress tab**: tap exercise → graph; toggle metrics (weight, e1RM, volume, reps) at bottom; bookmark exercises to pin to top; only current-program exercises are graphed (deliberate decluttering) (https://support.stronglifts.com/article/89-graphs).

### 1.7 Differentiators & steals for PersonalOS
1. **The 3-fail → 10% deload rule, per exercise, configurable** — the canonical stall-handling loop (fail count + deload % as user-settable knobs). PersonalOS needs exactly this for its deload logic (docs: deloads + post-deload ramp). Why: filters bad days, prevents premature resets (https://support.stronglifts.com/article/71-progression).
2. **Per-exercise increments with frequency control** (add 5lb every workout vs every 3rd workout; disable entirely). Why: bodyweight exercises (uncapped rep-mode) and small-muscle lifts need different progression rates; the "add every 3 workouts" option is the natural bridge from LP to slower progression (https://stronglifts.com/stronglifts-5x5/progress/).
3. **"Welcome Back" return-from-break deload card with adjustable slider** — offline-first apps see long gaps; a prompt to deload 10–20% after ≥1 week off, with a slider, is a small feature with big soreness/consistency payoff (https://support.stronglifts.com/article/71-progression).
4. **One-tap set logging (tap once = completed set)** — the single highest-leverage interaction for a gym logger; failed sets are explicit multi-tap, keeping the success path frictionless (https://support.stronglifts.com/article/63-log-workouts).
5. **Dynamic rest timer that lengthens after failed sets** — cheap to compute, genuinely useful in-gym (https://stronglifts.com/app/).
6. **Exercise-history PR stars + red-circle consistency calendar** — the simplest possible PR celebration and consistency visualization; "one red circle every Mon/Wed/Fri" is a habit goal PersonalOS's journal/check-in can echo (https://stronglifts.com/app/, https://support.stronglifts.com/article/72-history).

---

## 2. Five3One & the 5/3/1 app ecosystem (Five/Three/One, 5/3/1 Workout Log, + Wendler's rules)

### 2.1 Overview
Jim Wendler's 5/3/1 (first published 2009, expanded in Beyond 5/3/1 2017 and 5/3/1 Forever 2017) is the most enduring percentage-based strength framework: four main lifts, wave loading off a submaximal Training Max, AMRAP "PR sets", slow fixed progression (https://train531.com/blog/531-program-complete-guide/, https://research.poin-t-go.com/en/guides/5-3-1-program-complete-breakdown). Two flagship iOS apps:
- **Five/Three/One** (Strong Pigeon LLC, iOS + Android): free core, paid packs (Custom Plating, Custom Assistance, Beyond 5/3/1 Pack with Joker Sets/FSL/BBB); "the app assumes you know how to do 5/3/1" — it deliberately does not teach the program; Apple Health integration, home-screen widget; 4.8★, 1.4K ratings (https://fivethreeone.app/, https://apps.apple.com/us/app/five-three-one-531-workouts/id1560266240).
- **5/3/1 Workout Logger – 531** (iOS): free with 3-week trial, then one-time purchases ($9.99 5/3/1 Pro, $3.99 Assistance, $4.99 Apple Watch); "NO Subscription, NO Registration, NO Ads, NO data selling" — explicitly privacy-first (https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690).
- Also: SaraSoft Five3One iOS logger with 4-day/3-day/2-day/Building the Monolith templates (https://www.sarasoft.nl/five3oneios/).

### 2.2 Core paradigm
Submaximal wave periodization. Training Max (TM) = 85–90% of true 1RM (Wendler moved toward 85% in Forever; 90% classic default). All percentages derive from TM, never from the true max. Three-week intensity wave + deload:
- Week 1 (5s): 65% x5, 75% x5, 85% x5+ (AMRAP)
- Week 2 (3s): 70% x3, 80% x3, 90% x3+
- Week 3 (5/3/1): 75% x5, 85% x3, 95% x1+
- Week 4 (deload): 40% x5, 50% x5, 60% x5
(https://strengthinsider.com/workout-programs/531-program/, https://pullyapp.com/en/blog/531-workout-program-guide, https://www.norma-athletics.at/guides/wendler-531/)

### 2.3 Progression logic (deep)
- **TM progression**: after each cycle add 5lb (2.5kg) to upper-body TMs (bench, OHP) and 10lb (5kg) to lower (squat, deadlift) — ~60–120lb/year (https://train531.com/blog/531-program-complete-guide/, https://research.poin-t-go.com/en/guides/5-3-1-program-complete-breakdown).
- **TM test**: you should be able to do 3–5 clean, fast reps at the TM; if not, TM is too high (https://train531.com/blog/531-training-max-calculator/).
- **AMRAP as the engine and the diagnostic**: the + set is where rep PRs happen. Week-3 1+ benchmarks: 1–2 reps = TM too high; 3–5 = appropriate; 6–8 = conservative; 9+ = too low. Stop 1–2 reps before failure ("stop with 1–2 in the tank"; NORMA: "take rep records, leave ugly reps") (https://train531.com/blog/531-program-complete-guide/, https://www.norma-athletics.at/guides/wendler-531/, https://pullyapp.com/en/blog/531-workout-program-guide).
- **Stall handling**: when AMRAPs consistently underperform (e.g., only 3 reps on a 5s week), reduce that lift's TM by 10% and rebuild — resets are a built-in feature, not failure; Wendler recommends proactive resets after 5–7 cycles even without struggling. Round TMs down to nearest 5lb (https://train531.com/blog/531-training-max-calculator/, https://www.norma-athletics.at/guides/wendler-531/).
- **Deload**: every 4th week in the classic wave (40/50/60% x5, no PR sets); Forever moved to leader/anchor blocks (2–3 leaders then 1 anchor) with the deload often built into the transition; many lifters run 7-week protocols. Skipping deloads is cited as the primary stall cause (https://research.poin-t-go.com/en/guides/5-3-1-program-complete-breakdown, https://strengthinsider.com/workout-programs/531-program/).
- **Leader vs Anchor**: Leaders = high supplemental volume (FSL 5x5, BBB), AMRAPs capped/5's PRO (all sets exactly 5, no PR set); Anchors = low volume, true AMRAPs, Joker sets allowed. TM increments +5/+10 after each block (https://train531.com/blog/531-glossary-every-term-and-acronym-explained/).
- **Supplemental templates**: BBB 5x10 @50% TM; FSL (repeat first-set weight 5x5/3x5); SSL; Widowmaker (1x20); Joker sets (1–3 extra sets at +5% jumps after a strong top set, capped at ~100% TM in calculators) (https://www.norma-athletics.at/guides/wendler-531/, https://train531.com/blog/531-glossary-every-term-and-acronym-explained/).
- **Apps**: Five/Three/One auto-generates the whole cycle from entered 1RMs, auto-creates the next cycle "adjusting the weight depending on your performance" (https://fivethreeone.app/). The 531 Logger auto-lays out weights/reps for every day, computes warm-ups, and configures TM% (https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690).

### 2.4 Standards & rankings
5/3/1 apps compute 1RM estimates (Epley-style) and derive TMs (e.g., Liftosaur's calculateTrainingMax uses Epley, then 90%); the 531 Logger charts "current 1RM" and bodyweight over time. No population percentiles — progress is judged against your own AMRAP rep records ("beating your previous rep count at the same percentage is a PR") (https://train531.com/blog/531-glossary-every-term-and-acronym-explained/, https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690).

### 2.5 Records/PR tracking
Rep PRs on the + set are the metric ("Every session gives you a chance to set a rep PR on your top set" — Wendler: "Record the exact number of reps you completed"). Progress charts visualize 1RM and bodyweight over cycles (https://train531.com/blog/531-program-complete-guide/, https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690). Five/Three/One shows PRs through progress charts + Apple Health (https://fivethreeone.app/). Notably, no 5/3/1 app celebrates PRs with ceremony — they're chart points.

### 2.6 GUI layout (deep)
- **Five/Three/One**: (1) Setup screen — enter 1RMs for the four lifts, pick template; whole cycle computed instantly ("Enter your 1RMs and your whole cycle is calculated"). (2) Day screen — sets listed with weight×reps, the + set marked; rest timer with notifications ("It's easy to go on Instagram and forget… we'll notify you once your rest is over"); per-set notes. (3) Plating — automatic plate calculation inline per weight. (4) Progress — "your progress, visualized" charts; PRs visible over time. (5) Next-cycle generation — "when you're done with your cycle, we'll create the next one for you, adjusting the weight depending on your performance". (6) Home-screen widget showing current/upcoming workouts. (7) Apple Health workout save + calorie estimates (https://fivethreeone.app/, https://apps.apple.com/us/app/five-three-one-531-workouts/id1560266240).
- **5/3/1 Logger**: workout is "automatically laid out for you" — main lift sets + auto-calculated warm-ups + BBB sets + assistance exercises; rest timer with configurable lengths; progress charts for 1RM and bodyweight; kg/lb toggle; configurable bar weight (https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690).

### 2.7 Differentiators & steals for PersonalOS
1. **Training Max (85–90% of 1RM) as the progress anchor, with a TM test (3–5 clean reps)** — the deepest insight in the cluster: submaximal bases let progression run for years. PersonalOS's est-1RM vault + deload logic should model "post-deload ramp" as re-anchoring to a conservative TM. Why: prevents the "start too heavy, stall in 2 cycles" failure (https://train531.com/blog/531-training-max-calculator/, https://research.poin-t-go.com/en/guides/5-3-1-program-complete-breakdown).
2. **AMRAP-set diagnostics with explicit rep benchmarks (1–2 = TM too high / 3–5 = OK / 6+ = conservative)** — a rep-PR ladder per exercise at a fixed % is exactly PersonalOS's "est-1RM ladder with dates" idea, but with actionable rules attached (https://pullyapp.com/en/blog/531-workout-program-guide/).
3. **The 10% TM reset** — "when a lift stalls, lower that lift's TM ~10%, rebuild with cleaner reps, let rep records climb again" — clean, per-lift reset semantics for the vault (https://www.norma-athletics.at/guides/wendler-531/).
4. **Leader/Anchor structure (5's PRO vs true AMRAP)** — the split between accumulate (volume, capped top sets) and express (intensity, PR sets) is a template for PersonalOS training phases (bulk/cut/maintain) interacting with deload weeks (https://train531.com/blog/531-glossary-every-term-and-acronym-explained/).
5. **Fixed +5/+10 per-cycle TM increments** — "progress slowly, never miss reps" is the anti-farming counterweight to LP apps; a steady-state progression mode worth supporting alongside LP (https://train531.com/blog/531-program-complete-guide/).
6. **App-store positioning lesson**: Five/Three/One sells "the app assumes you know the program" and 531 Logger sells "no subscription, no registration, no data selling" — the latter is the privacy-first positioning PersonalOS already owns (https://apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690).

---

## 3. Liftosaur

### 3.1 Overview
Open-source (AGPLv3, github.com/astashov/liftosaur) weightlifting tracker whose thesis is "flexible enough to implement pretty much any weightlifting routine… it would be a platform for your experiments in weightlifting" — any progression/deload logic via a built-in scripting language, Liftoscript (https://github.com/astashov/liftosaur/). Free tier covers almost everything; cloud backup/advanced sync and a few extras are paid; praised as "the best app… and it's free" in 2026 Reddit threads (https://www.liftosaur.com/, https://www.liftosaur.com/docs/docs). Ships built-in programs: all GZCL variants (GZCLP, P-Zero, The Rippler, VHF, VDIP, General Gainz), 5/3/1 and variations, Basic Beginner Routine, Strong Curves, recommended-routine (https://apps.apple.com/us/app/liftosaur-scriptable-workouts/id1661880849). iOS (incl. Apple Watch), Android, and a desktop web editor (https://www.liftosaur.com/).

### 2.x note — see section 3 for the program-design guidance Liftosaur also documents (the `llms/program_design.md` file below is effectively the project's progression-design handbook).

### 3.2 Core paradigm
Programmable progressive overload. Three built-in progression types, plus arbitrary `custom()` logic:
- **Linear Progression (`lp`)**: `lp(5lb, 3)` = +5lb after 3 successful attempts; optional failure args `lp(5lb, 1, 0, 15lb, 3, 0)` = +5lb per success, −15lb after 3 consecutive failed sessions ("the 15lb, 3 means 'after 3 consecutive failed sessions, reduce weight 15lb'") (https://www.liftosaur.com/doc/liftoscript, https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
- **Double Progression (`dp`)**: `dp(5lb, 8, 12)` — reps climb 8→12, then reset to 8 and +5lb (https://www.liftosaur.com/blog/posts/new-experimental-program-editor/).
- **Reps Sum (`sum`)**: add weight when total reps across sets cross a threshold (https://www.liftosaur.com/doc/liftoscript).
- **`custom()` scripting**: full if/else over `weights`, `reps`, `completedReps`, `RPE`, `completedRPE`, `timer`, `setVariationIndex`, `descriptionIndex`, state variables — can reimplement GZCLP stage cascades, nSuns tiered AMRAP, Doggcrapp rep windows, SBS-style percentage waves, RIR-driven 1RM updates, etc. (https://www.liftosaur.com/doc/liftoscript, https://www.liftosaur.com/blog/posts/combine-workout-planner-and-liftoscript/).
- **`update: custom()`**: mid-workout autoregulation — after each logged set the app can rewrite the remaining sets' weights/reps/RPE from your actual performance (e.g., RPE drift adjustments) (https://www.liftosaur.com/blog/posts/new-experimental-program-editor/).

### 3.3 Progression logic (deep)
- **Epley-based 1RM**: `calculate1RM` uses the Epley formula (wikipedia.org/wiki/One-repetition_maximum); `calculateTrainingMax` = Epley then ×0.9 — "Mostly useful for 5/3/1 variations" (https://www.liftosaur.com/docs/docs).
- **RPE multipliers**: `rpeMultiplier` uses OpenPowerlifting's plsource formulas (https://github.com/astashov/liftosaur/).
- **Set variations**: multiple schemes per exercise (e.g., GZCLP T1: 5x3 → 6x2 → 10x1), switched by a variation expression — the standard way to implement stage cascades (https://www.liftosaur.com/docs/docs).
- **Design guidance (from llms/program_design.md — the project's own handbook)**:
  - "Most sets should end 1–3 reps in reserve (RIR), i.e. RPE 7–9"; strength work at 2–4 RIR ("grinding to failure adds fatigue, not strength"); hypertrophy closer to 0–1 RIR on last sets; Squat/Deadlift volume at 2–3 RIR regardless (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
  - "The design problem is progression, not selection — you can't add 5lb to a push-up. Progress in this order: reps → harder variation → external load." Bodyweight exercises get rep ladders (3x5→3x8, +1 rep/session) then variation chains (assisted → full → weighted) — directly relevant to PersonalOS's uncapped rep-mode bodyweight tracking (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
  - "Every exercise MUST have a progression rule. A program where nothing progresses is a red flag. ALWAYS include the failure/deload arguments — stalling is guaranteed eventually."
  - "Reactive beats scheduled: research doesn't show a clear benefit to pre-planned deloads over training straight until performance stalls. Default to reactive deloading — deload when progress stalls for 2–3 weeks or joints ache persistently." For beginners, "the drop built into lp() after repeated failure IS their deload — nothing else needed" (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
  - Intermediates: weekly progression — double progression, AMRAP-driven tiered increments (nSuns-style: big beats earn big jumps, grinding earns none), or stage progression (GZCLP-style: on failure switch to denser scheme, deload only after last stage fails) (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
- **1RM is program-independent**: editing it in Exercise Stats updates it across all programs; `rm1` is writable by scripts (https://www.liftosaur.com/docs/docs).

### 3.4 Standards & rankings
No population standards/percentiles. Instead: per-exercise 1RM (Epley), RPE logging ("Log RPE per set and track how effort changes over time"), muscle-map showing activation balance across the day/program, and body measurements correlated with lift graphs (https://www.liftosaur.com/). The muscle map + exercise-substitution-by-muscles ("if you did similar sets x reps previously, it shows your last results; same for AMRAPs") are its ranking-adjacent features (https://github.com/astashov/liftosaur/).

### 3.5 Records/PR tracking
- Shows last results for similar sets×reps per exercise, and previous AMRAP results (https://github.com/astashov/liftosaur/).
- Graphs screen: visual progression per lift; configurable which graphs appear; plate-calculator prefix (`45/25/25/10 255lb`) on the progress screen; bodyweight vs lifts correlation graphs (https://github.com/astashov/liftosaur/).
- Public profile pages (optional) (https://github.com/astashov/liftosaur/).
- No trophy/milestone system — PRs are data, not celebrations.

### 3.6 GUI layout (deep)
- **Choose Program screen**: list of built-in programs (GZCLP, 5/3/1, BBR, Strong Curves…) each with a preview + playground link; clone to customize (https://www.liftosaur.com/docs/docs, https://www.liftosaur.com/programs/gzclp).
- **Workout screen**: each exercise is a header row (name, tap = open Exercise Stats / edit modal; the `rm1` link under exercise name opens the RM calculator); below it the set list — each set shows weight × reps; tapping a set marks it complete (glows green and advances focus to the next set); tapping again decrements reps; AMRAP sets open a modal to enter achieved reps; RPE-log sets open an RPE input modal; warm-up sets listed above working sets (they vanish if their weight resolves to zero — a known quirk in r/liftosaur); rest timer between sets with push notifications; edit icon per exercise opens the Edit modal with quick 1RM editing (https://www.liftosaur.com/docs/docs, https://www.reddit.com/r/liftosaur/comments/1es2d9c/warmups_missing_in_active_workout/).
- **Editor (in-app + web)**: state-variable section; sets section with `state.weight` references; Finish Day Script (Liftoscript) with a live Playground showing "State changes: weight: 50lb -> 55lb" — simulate success/failure before shipping the program (https://www.liftosaur.com/docs/docs).
- **New experimental (planner) editor**: program text like `Bench Press / 5x5 / 100lb / progress: custom() {~ if (completedReps >= reps) { weights += 5lb } ~}`; after a workout the program text visibly updates (100lb → 105lb); weekly/daily volume-per-muscle-group charts; exercise intensity/volume undulation graphs week over week; full-program mode with drag-reorder weeks/days (https://www.liftosaur.com/blog/posts/new-experimental-program-editor/).
- **Graphs screen**: per-lift progression, configurable series; muscle map; body stats (weight, biceps, chest, waist…); plate calculator (https://github.com/astashov/liftosaur/).

### 3.7 Differentiators & steals for PersonalOS
1. **Explicit progression rules as a first-class program property, with failure/deload arguments always included** — "Every exercise MUST have a progression rule… ALWAYS include the failure/deload arguments" is a design law PersonalOS should adopt for its deload logic (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
2. **Reps → harder variation → external load ordering for bodyweight lifts** — the canonical answer to PersonalOS's "rep-mode bodyweight exercises uncapped": rep ladders up a range, then variation chains, then added load. The Epley 1–12 rep guard stays clean (https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
3. **Reactive-deload default (stall 2–3 weeks or persistent joint ache) instead of scheduled deloads** — aligns with PersonalOS's "training phases + deloads + post-deload ramp" doc: deload on evidence, then ramp.
4. **Simulation playground for progression logic** — the ability to preview "what happens if I fail 3 sessions in a row" before committing. PersonalOS is offline-first with frozen tables; a tiny rule simulator is cheap and prevents logic bugs in stall/deload handling (https://www.liftosaur.com/docs/docs).
5. **1RM as a global per-exercise value (Epley), shared across programs, writable by rules** — mirrors the records vault: one canonical est-1RM per tracked exercise, updated by PR sets/AMRAPs, feeding all percentage math (https://www.liftosaur.com/docs/docs).
6. **RPE-based auto-regulation: `update: custom()` rewriting the rest of the session from actual effort** — the blueprint for in-session weight correction after a set that was harder/easier than expected (https://www.liftosaur.com/blog/posts/new-experimental-program-editor/).

---

## 4. GZCLP + the tools that run it (Boostcamp, dedicated GZCLP app, Massiv, Virtus, RepCheck, Fitloop)

### 4.1 Overview
GZCLP is Cody Lefever's (Reddit u/gzcl) linear progression program for beginners/novices, built on the GZCL method's three-tier framework (T1 heavy compound, T2 lighter compound, T3 accessories) and the 1:2:3 volume rule — for every T1 rep, ~2 T2 reps, ~3 T3 reps (https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/, https://www.liftosaur.com/programs/gzclp). Tools: **Boostcamp** (official partner — "I officially partnered with Boostcamp App to launch GZCL Program (GZCLP) into an app format for free", v5 of the GZCL app; GZCLP free, 12 weeks, 3-day and 4-day variants; Boostcamp itself free with Pro $14.99/mo or $59.99/yr) (https://www.boostcamp.app/coaches/cody-lefever/gzcl-program-gzclp, https://barbend.com/boostcamp-review/); a dedicated **GZCLP – Strength Workout Plan** Android app (com.chrisdmilner.gzclp) (https://play.google.com/store/apps/details?id=com.chrisdmilner.gzclp); Liftosaur's built-in GZCLP (fully scripted, with 5RM-retest week) (https://www.liftosaur.com/programs/gzclp); Massiv, Virtus Athlete, RepCheck, Fitloop all ship it as a built-in program (https://massiv.app/blog/gzclp-progression/, https://virtusapp.ai/blog/gzclp-program-guide/, https://repcheckapp.com/blog/gzclp-guide, https://fitloop.app/programs/NosuRoqgLY7ha6ZEG). Spreadsheet origin: GZCLP v4.1 by u/blacknoir; Lift Vault hosts the canonical spreadsheets (https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/).

### 4.2 Core paradigm
Linear progression with a built-in failure cascade per tier. Workout structure (per session: one T1, one T2, one T3):
- T1: 5x3+ (last set AMRAP), start ~85% of 5RM (~75–80% 1RM)
- T2: 3x10 (straight sets), start ~62–65% of 1RM
- T3: 3x15+ (last set AMRAP, drive to 25+ reps), <65% intensity
Four rotating workouts (A1/B1/A2/B2) across 3–4 days/week; every lift appears as both T1 and T2 on different days (https://www.boostcamp.app/coaches/cody-lefever/gzcl-program-gzclp, https://repcheckapp.com/blog/gzclp-guide, https://massiv.app/blog/gzclp-progression/).

### 4.3 Progression logic (deep)
- **Add weight every successful session**: +10lb (5kg) lower-body T1 (Squat, Deadlift), +5lb (2.5kg) upper-body T1 (Bench, OHP); same increments for T2 (https://virtusapp.ai/blog/gzclp-program-guide/, https://fitnessvolt.com/rpe-training/programs/gzclp/).
- **T1 failure cascade (volume-base model)**: fail 5x3 (base volume 15) → same weight, 6x2 (base 12); fail → 10x1 (base 10); fail → rest 2–3 days, test a new 5RM, restart at 5x3 with 85% of the new 5RM. Each lift progresses through stages independently (squat can be at 6x2 while bench is at 5x3) (https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/, https://massiv.app/blog/gzclp-progression/).
- **T2 cascade**: fail 3x10 (base 30) → 3x8 (base 24) → 3x6 (base 18) → restart 3x10 at a slightly heavier weight than the last successful 3x10 run (≤ +20lb/9kg). No 5RM retest for T2 (https://repcheckapp.com/blog/gzclp-guide, https://virtusapp.ai/blog/gzclp-program-guide/).
- **T3**: no stages — add weight only when the last AMRAP set hits 25+ reps; if you can't complete 3x15, reduce load ~10–15% (https://massiv.app/blog/gzclp-progression/, https://virtusapp.ai/blog/gzclp-program-guide/).
- **AMRAP cap**: last-set AMRAPs capped at 10 reps to preserve rep quality (https://repcheckapp.com/blog/gzclp-guide).
- **App behavior**: Boostcamp auto-calculates T1 at 85% of your entered 5RM, T2 automatically too, and auto-progresses working weights between sessions from what you logged (https://www.boostcamp.app/coaches/cody-lefever/gzcl-program-gzclp); Liftosaur's GZCLP includes a full 5RM-retest week (descriptionIndex/setVariationIndex switching, `rm1 = completedWeights[1] / rpeMultiplier(5, 10)`, restart at 85%) (https://www.liftosaur.com/programs/gzclp); Virtus approximates the retest by deloading T1 15% and restarting Stage 1 when the app can't automate a 5RM test (https://virtusapp.ai/blog/gzclp-program-guide/). AMRAP reps entered at 5x3 → if 5–10 reps on last set, add weight.

### 4.4 Standards & rankings
GZCLP tools don't do population standards. Boostcamp tracks RPE and 1RM per lift and shows performance charts; Pro adds a volume heatmap per muscle group ("a heatmap showing how much training volume each body part has received, which helps ensure your program is balanced") (https://www.garagegymreviews.com/boostcamp-review, https://apps.apple.com/us/app/boostcamp-workout-programs/id1529354455). LiftProof flags plateaus per lift ("the plateau flag catches the 'failed twice' signal automatically") (https://www.liftproof.app/programs/gzclp/).

### 4.5 Records/PR tracking
Boostcamp: log sets/reps/weight with RPE and 1RM tracking; performance charts; previous week's results shown per exercise to "try and beat your last workout" (https://barbend.com/boostcamp-review/, https://www.garagegymreviews.com/boostcamp-review/). No milestone/trophy systems beyond charts.

### 4.6 GUI layout (deep)
- **Boostcamp**: (1) Program library (130+ coach programs incl. GZCLP, nSuns, 5/3/1 BBB; 10,000+ community programs) filtered by goal/schedule/experience/equipment (https://barbend.com/boostcamp-review/). (2) GZCLP onboarding: enter 5RM for the four compounds; "be conservative… it's automatically calculated in the app" (https://www.boostcamp.app/coaches/cody-lefever/gzcl-program-gzclp). (3) Workout day screen: exercises with sets/reps/weights pre-filled, AMRAP marked, RPE targets optional, rest timer, plate calculator; after week 1, each exercise shows the previous session's numbers inline (https://www.garagegymreviews.com/boostcamp-review/). (4) Set labeling (warm-up / working / failure) so auto-progression understands effort (https://barbend.com/boostcamp-review/). (5) Progress: performance charts, muscle-volume heatmap (Pro), reschedule sessions (https://www.garagegymreviews.com/boostcamp-review/). (6) Custom program builder with multi-week periodization, exercise swaps, custom progressions (https://apps.apple.com/us/app/boostcamp-workout-programs/id1529354455). (7) Offline mode incl. plate calculator in free version (https://barbend.com/boostcamp-review/).
- **Liftosaur GZCLP**: Day screen shows tier rows (t1/t2/t3); the 5RM Test week appears as a special 1x5 set with instructions inline ("Start with the bar, do 5 reps… when you get to a set that is hard, but you do it — take that number and enter into '5RM Test' set weight. Mark it completed!"); 1RM editable via link under exercise name (https://www.liftosaur.com/programs/gzclp).
- **Dedicated GZCLP Android app** (chrisdmilner): minimalist T1/T2/T3 workout screens with program descriptions (https://play.google.com/store/apps/details?id=com.chrisdmilner.gzclp).

### 4.7 Differentiators & steals for PersonalOS
1. **The stage/failure cascade (5x3 → 6x2 → 10x1 at the same weight)** — the best stall mechanism in beginner programming: instead of deloading on first failure, drop a rep per set and add a set, extracting more progress from the same weight; deload only after the last stage fails. Perfect for the M2 deload rules (https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/).
2. **Volume-base thresholds (15/12/10 for T1; 30/24/18 for T2; 25+ AMRAP for T3)** — simple integer rules an offline engine can implement deterministically; the T3 rule (bump weight when AMRAP ≥25) is an elegant bodyweight/accessory progression rule (https://repcheckapp.com/blog/gzclp-guide).
3. **Independent per-lift stage tracking** — squat at 6x2 while bench at 5x3; per-exercise state, not per-program state — exactly the per-exercise PR ladder granularity of the records vault (https://massiv.app/blog/gzclp-progression/).
4. **AMRAP capped at 10 reps** — an anti-grinding guardrail worth encoding in PersonalOS (https://repcheckapp.com/blog/gzclp-guide).
5. **85% of 5RM restart (or app-side proxy: 15% deload + restart)** — when a stage-3 reset is needed and a true retest can't be automated, the app approximates 85%-of-new-5RM with a fixed 15% drop; honest, offline-friendly (https://virtusapp.ai/blog/gzclp-program-guide/).
6. **Previous-session values shown inline in the workout** ("try and beat your last workout") — the single highest-engagement trick in Boostcamp; PersonalOS workout screens should show last-session sets×reps×weight per exercise (https://www.garagegymreviews.com/boostcamp-review/).

---

## 5. Renaissance Periodization — RP Hypertrophy app

### 5.1 Overview
The RP Hypertrophy app, designed by Dr. Mike Israetel (RP Strength), is the hypertrophy autoregulation app built on RP's volume-landmark model (MEV/MAV/MRV) (https://rpstrength.com/pages/hypertrophy-app, https://fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/). 45+ premade templates (Full Body → Big Arms specialization), Meso Builder (2025), 250+ technique videos, 2–6 day programs. Pricing: subscriptions monthly/6-month/annual (App Store listing ~$24.99–34.99/mo range; competitors quote $34.99/mo or ~$200/yr on sale) (https://apps.apple.com/us/app/rp-hypertrophy/id1555614554, https://mesostrength.com/blog/mesostrength-vs-rp-hypertrophy). Runs on iOS native, Android, and web (PWA). No offline mode (a listed weakness) (https://mesostrength.com/blog/mesostrength-vs-rp-hypertrophy).

### 5.2 Core paradigm
Mesocycle programming with subjective-feedback autoregulation. A meso (typically 4–6 weeks) starts each muscle at MEV (minimum effective volume), adds ~1 set per muscle per week toward MAV, pushes RIR from ~3 down to 0–1 as the block unfolds, then deloads; volume increases follow the MEV→MRV corridor ("if your MEV is 10 sets/week and MRV 20, do 10→13→16→20 across 4 weeks") (https://rpstrength.com/blogs/articles/progressing-for-hypertrophy, https://arvo.guru/resources/methods/rp-training). Muscle priorities: Emphasize / Grow / Maintain per muscle group (2025 update) (https://help.rpstrength.com/hc/en-us/articles/34725726510999-RP-Hypertrophy-App-What-s-new).

### 5.3 Progression logic (deep)
- **Weight**: "weight is increased by a few percentage points each week, and if the next weight increment is outside of that range (like going from the 10lb to the 15lb dumbbells), it adds a rep to each set instead" (https://help.rpstrength.com/hc/en-us/articles/32600173777815-How-does-the-app-determine-when-to-add-weight-reps-and-sets).
- **Sets (the feedback loop)**: after each session you rate pump quality, soreness, and workload; the app adjusts future set counts continuously: weak pumps + low soreness + easy workload → more sets; great pumps + on-time soreness recovery + hard-but-ok workload → hold; amazing pumps + unhealed soreness + drowning → fewer sets. "It does these calculations continuously, such that every future session is influenced by your past feedback" (https://help.rpstrength.com/hc/en-us/articles/32600173777815-How-does-the-app-determine-when-to-add-weight-reps-and-sets).
- **RIR/RPE**: effort moves closer to failure over the meso (3 RIR early → 0–1 RIR before deload); users log set difficulty; auto deload timing based on accumulated feedback (users report pre-planning deloads at week 5–6 themselves) (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143, https://dr-muscle.com/rp-hypertrophy-app-review/).
- **Failure handling**: no % deload rules like SL; volume reduction + deload weeks are the recovery mechanism; users can manually add/remove sets if they disagree with prescriptions ("by all means manually add or delete sets") (https://help.rpstrength.com/hc/en-us/articles/32600173777815).
- **Templates**: 45+ prebuilt (incl. Nick Shaw 6-day arms/shoulders emphasis, 2025); Meso Builder lets you pick which muscles to emphasize/maintain/ignore and builds the program; finished mesos can be recreated with two clicks (https://rpstrength.com/blogs/podcasts/major-updates-to-the-rp-diet-hypertrophy-apps-rp-strength).

### 5.4 Standards & rankings
No population percentiles. The "score" is internal progression state; the community guidance is to ignore the score and watch logbook + bodyweight + photos ("are you adding a rep or a bit of load most weeks on at least some lifts for each muscle group") (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143). This is a notable philosophical contrast with standards sites — RP deliberately keeps the comparison internal.

### 5.5 Records/PR tracking
The Logbook is the PR surface: per-exercise history of weight×reps×sets week over week; progress judged by "logbook up + bodyweight trend + pics thicker" (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143). No trophy system.

### 5.6 GUI layout (deep)
- **Template picker**: choose training days (2–6), then template; "Emphasize/Grow/Maintain" muscle-priority chooser; balanced full-body setup recommended during cuts (https://help.rpstrength.com/hc/en-us/articles/41101429407255-Which-Template-Should-I-Pick).
- **Meso Builder**: muscle-by-muscle priority sliders; app builds the meso around goals; new mobile meso-planning experience in v0.31 (2025) (https://rpstrength.com/blogs/podcasts/major-updates-to-the-rp-diet-hypertrophy-apps-rp-strength, https://help.rpstrength.com/hc/en-us/articles/34725726510999).
- **Workout screen**: day's exercises with prescribed sets×reps; "the app asks questions after each set" (user quote: "The app asks questions after each set and progresses you based on your responses") — per-set difficulty/RIR input, then a post-session feedback card rating pump/soreness/workload; fully customizable on the fly (https://play.google.com/store/apps/details?id=com.rp.hypertrophy, https://help.rpstrength.com/hc/en-us/articles/32600173777815).
- **Weekly plan view**: the app shows next week's prescriptions (weight/reps/sets changes) — "Know exactly the weight and reps to hit every week for your best growth" (https://rpstrength.com/pages/hypertrophy-app).
- **Video library**: 250+ technique videos inline per exercise (https://apps.apple.com/us/app/rp-hypertrophy/id1555614554).
- **Known UX weaknesses** (user-reported): unusable offline, moving sets around is cumbersome, coarse muscle-group granularity (front/side/rear delts counted as one), no strength/social stats sharing (https://play.google.com/store/apps/details?id=com.rp.hypertrophy).

### 5.7 Differentiators & steals for PersonalOS
1. **Pump/soreness/workload feedback loop driving volume** — a subjective-ratings → next-week-set-counts pipeline that PersonalOS can mirror as a lightweight "recovery check-in" (fits the check-ins module) feeding weekly volume floors per muscle (https://help.rpstrength.com/hc/en-us/articles/32600173777815).
2. **MEV→MAV→MRV volume corridor (+1 set/week, deload at MRV)** — the exact academic scaffolding behind PersonalOS's "weekly volume floors per muscle (MRV-style)"; rules to encode: start at MEV, +1 set/week, hold when sore, deload when 2+ signals degrade (https://arvo.guru/resources/methods/rp-training, https://rpstrength.com/blogs/articles/progressing-for-hypertrophy).
3. **Muscle priorities Emphasize/Grow/Maintain per muscle group** — maps directly onto PersonalOS training phases (bulk/cut/maintain) and lets the vault's standards display weight muscles differently (https://help.rpstrength.com/hc/en-us/articles/34725726510999).
4. **Rep-instead-of-weight increments when the next plate is unavailable** — "if the next weight increment is outside the range, add a rep to each set instead"; offline-friendly and solves fractional-plate gaps (https://help.rpstrength.com/hc/en-us/articles/32600173777815).
5. **Effort honesty as a first-class input** — "If you keep marking 3 RIR but your last rep speed is crawling, the app will assume you can handle more work and hammer you" — i.e., the system only works if ratings are honest; PersonalOS's anti-farming stance (no XP for logging) should not reward fake effort ratings either (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143).
6. **Deload timing from accumulated feedback** (auto, but user-overridable with a pre-planned deload option) — combines reactive and scheduled deloading (https://ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143).

---

## 6. Alpha Progression

### 6.1 Overview
German hypertrophy-focused programming app: "Strong and Hevy are decent gym loggers… Alpha Progression does that too, but then goes one step further: it reads your logged sets and tells you exactly what to lift next, every set. Weight, reps, RIR, all calibrated to your real strength rather than a generic template" (https://alphaprogression.com/en). Pricing: free tier (full logging + 795-exercise video library + body measurements); Pro $12.99/mo or $79.99/yr (14-day trial) (https://alphaprogression.com/en/subscribe, https://push-pull.app/blog/push-pull-vs-alpha-progression). 795 exercises with trainer-filmed videos, exercise evaluations, plan generator ("over a trillion input combinations"), multiple gym profiles, plate calculator, warmup calculator, periodization + deloads, RIR tracking, PR/milestone list, CSV export, offline-capable (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression, https://www.hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany).

### 6.2 Core paradigm
RIR-based autoregulated hypertrophy programming: plan generator (equipment, experience, goals, schedule, muscle priorities) → per-set weight/rep/RIR recommendations computed from your logged performance → you log with RIR → next session's targets adjust. Periodization: cycles with planned deloads; set-count and RIR can ramp week by week within a plan (https://alphaprogression.com/en, https://www.hotelgyms.com/blog/how-to-use-alpha-progression).

### 6.3 Progression logic (deep)
- **Per-set recommendations**: "Our algorithm looks at your previous performances and tells you the weight and reps to target on each set"; "Recommendations adapt to how hard your last sessions actually were" (https://apps.apple.com/us/app/gym-workout-alpha-progression/id1462277793).
- **RIR-driven adjustments** (independently tested): logging 185lb x8 @2 RIR → next session suggested 190lb x8; higher reported RIR → more aggressive increases; RIR 0–1 → back off or hold weight while adding reps (https://agent-finder.co/reviews/alpha-progression).
- **Estimated 1RM**: computed from logged sets to calibrate recommendations ("It doesn't just say 'add 5 lbs' — it accounts for the rep range, your recent performance trend, and your proximity to failure") (https://agent-finder.co/reviews/alpha-progression).
- **Deloads**: planned deload weeks in periodized plans; recommended flow after deload is a fresh plan via the generator (https://www.hotelgyms.com/blog/how-to-use-alpha-progression).
- **Warmups**: auto-calculated from exercise type, first-set reps, experience, available weights — bigger/heavier lifts get more warmup sets (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression).
- **Plate calculator**: shows exact plates for the target weight; "If the exact weight is not possible with your setup, the next lower achievable weight is shown" (https://alphaprogression.com/en/subscribe).
- **Multiple gyms**: each gym profile defines equipment + available weights; the active gym decides exercise suggestions and recommended weights (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression).

### 6.4 Standards & rankings
No population percentiles. Instead: "strength rating" charts (a normalized strength metric), volume-per-muscle analytics ("see at a glance if your chest is getting 18 sets per week while your rear delts are at 6"), personal records, streaks, achievements (https://alphaprogression.com/en, https://agent-finder.co/reviews/alpha-progression).

### 6.5 Records/PR tracking
"Personal records and milestones are tracked automatically, so you can see your progress add up session after session"; "We make personal records, streaks, and achievements visible to keep you showing up!" — PR list per exercise, milestone collection, achievement/streak system (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression, https://alphaprogression.com/en). This is the richest PR-celebration surface in the cluster (list + streaks + achievements, though still text/icon level, not confetti).

### 6.6 GUI layout (deep)
- **Onboarding**: gym profile setup (equipment/weights toggles — "As you select and deselect options, Alpha Progression immediately updates the number of exercises you have access to"), experience, goals (https://www.hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany).
- **Plan creation**: 'Create plan' → Plan generator (Pro) or empty plan / single workout; inputs: days/week (1–7), plan duration (≤52 weeks or unlimited), muscle focus/neglect, workout length (https://www.hotelgyms.com/blog/how-to-use-alpha-progression).
- **Workout screen**: exercises listed with per-set recommendation (weight × reps @ RIR) — the target is explicit per set; rep counter + RIR tracker; rest timer; plate calculator while entering weights; auto warmups above the first working set; on-the-fly edits; set labeling (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression, https://agent-finder.co/reviews/alpha-progression).
- **Workout summary** screen after finishing; then analytics: charts for weight, strength rating, volume; PRs and milestones list; body measurements; progress photos; CSV export (https://apps.apple.com/us/app/gym-workout-alpha-progression/id1462277793, https://www.garagegymreviews.com/boostcamp-review notes the general pattern).

### 6.7 Differentiators & steals for PersonalOS
1. **Explicit per-set weight×reps×RIR recommendation computed from history** — the "what do I lift next" answer presented inline per set; PersonalOS's auto-suggested weights feature should render exactly this way (recommendation is a target, not a rule) (https://alphaprogression.com/en).
2. **RIR-based next-session deltas** (more RIR = bigger jump; 0–1 RIR = hold or add reps) — a simple, deterministic auto-regulation rule PersonalOS can implement offline with Epley + RIR input (https://agent-finder.co/reviews/alpha-progression).
3. **Warmup calculator keyed to exercise size + experience** — "Bigger exercises and heavier weights get more warm-up sets" (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression).
4. **Plate calculator that falls back to the next lower achievable weight** — the right behavior for offline gym logging when you lack fractional plates (https://alphaprogression.com/en/subscribe).
5. **Gym profiles (equipment + available weights per location)** — useful for PersonalOS if it ever needs equipment-aware suggestion; low priority for the vault but worth noting (https://play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression).
6. **PR/milestone list + streaks + achievements as a motivation layer** — the closest existing model for PersonalOS's milestone trophies (1.5x/2x bodyweight, 100th workout, tonnage); still flat UI, so trophy design headroom exists (https://alphaprogression.com/en).

---

## 7. Symmetric Strength

### 7.1 Overview
A strength-analysis site/app (web, iOS, Android; offline mode in the app) that produces a "comprehensive lifter analysis based on strength research and data from strength competitions" (https://symmetricstrength.com/about, https://symmetric-strength.apps112.com/). Inputs: sex, weight, age, plus your most difficult recent sets for the 15 supported lifts (Back/Front Squat, Deadlift/Sumo, Power Clean, Bench/Incline, Dip, OHP, Push/Snatch Press, Chin-up, Pull-up, Pendlay Row). Outputs: per-lift strength scores, overall score, color-coded muscular figure, weakness/balance analysis, progress chart, standards tables, calculators (1RM, Wilks, TDEE, ideal bodyweight), friend comparison (https://symmetric-strength.apps112.com/). Free; app has friend/account features.

### 7.2 Core paradigm
Ratio-based comparative analysis. Lifts are compared not to absolute tables but to expected ratios between lifts (squat/deadlift, bench/deadlift ratios derived from powerlifting world records per weight class; medians: men squat/DL 87%, bench/DL 65%; women 84%/57%, raw no-wraps data); other lift ratios from ExRx strength standards, world records, consensus (https://symmetricstrength.com/about). Each lift gets a "strength score" — defined as "1/4 of the lifter's hypothetical powerlifting Wilks" for that lift, plus an age adjustment (<23 or >40), such that scores are comparable across bodyweights, sexes and ages (https://symmetricstrength.com/about).

### 7.3 Progression logic
Not a progression tool — it's an analysis tool. The relevant logic is the balance/weakness computation: per-category scores are computed from your best lift in each category (not an average of all entered lifts) to avoid double-counting muscle groups ("if somebody checked Bench, Incline Bench, Dip, and Deadlift and was elite in the first three, all we can conclude is the lifter is incredibly strong at horizontal pressing… we wouldn't want to count the horizontal press three times") (https://symmetricstrength.com/about). Percentages in the weakness chart sum to ~0% (each lift relative to a lifter of your own overall score), so the chart reads as "you're X% above/below your own average" (https://symmetricstrength.com/about).

### 7.4 Standards & rankings
- Classifications (novice/intermediate/advanced/world class) derived from a combination of the above standards; the world-class women's formula is an estimate based on maximum natural FFMI ("an 1..-34 year old woman in the 99.9th percentile… having an FFMI of 1…") (https://symmetricstrength.com/about).
- Age adjustments reference published age-coefficient work; the site's dataset of self-reported gym lifts is the "gym population" that Fitness Volt now cites as its self-reported percentile source (https://fitnessvolt.com/strength-standards/how-strong-am-i/, https://fitnessvolt.com/strength-standards/stat-finder/).
- Also ships a standalone Strength Standards reference (https://symmetricstrength.com/standards) — its tables are the gym-population standards, meaningfully softer than competition-derived tables (Fitness Volt: "If our standards look harder than Strength Level, Symmetric Strength, or ExRx, that is intentional… Ours use direct percentile analysis of the largest verified competition dataset") (https://fitnessvolt.com/powerlifting/standards/).

### 7.5 Records/PR tracking
"View a detailed progress chart as you continue logging your lifts, showing how you have improved over time" (https://symmetric-strength.apps112.com/). No trophies; the metric is the score movement.

### 7.6 GUI layout (deep)
- **Entry screen**: stats (sex/weight/age) + per-lift "most difficult recent set" inputs (weight × reps); supports metric/imperial (https://symmetric-strength.apps112.com/).
- **Results screen (the signature UI)**: color-coded human figure showing per-muscle-group strength as a heat gradient (each lift mapped to muscle groups), per-lift strength scores on a scale from "subpar and untrained" to "world class", an overall strength score (fraction of hypothetical Wilks), and a weaknesses chart with each lift as a +/- percentage bar relative to your own average (https://symmetric-strength.apps112.com/, https://symmetricstrength.com/about).
- **Standards tables**: sex × bodyweight rows × classification columns (https://symmetricstrength.com/standards).
- **Calculators section**: 1RM, Wilks, TDEE, ideal bodyweight for sports (bodybuilding → MMA → marathon) (https://symmetricstrength.com/).
- **Friends**: add friends (app or web) to compare scores and stay accountable; progress chart per lift over time (https://symmetric-strength.apps112.com/).

### 7.7 Differentiators & steals for PersonalOS
1. **The color-coded muscle-group figure** — the best "strength status at a glance" visualization in the cluster; PersonalOS's standards display could render the big-3 (+OHP) as per-muscle heat instead of cold tables (https://symmetric-strength.apps112.com/).
2. **Balance analysis via expected lift ratios (squat/DL ≈ 87%, bench/DL ≈ 65%, OHP:bench ≈ 0.55–0.75)** — a lightweight "which lift is lagging" detector; Lift Vault's ratio calculator confirms the same ranges from independent data (bench:squat 0.60–0.85, DL:squat 1.10–1.30, OHP:bench 0.55–0.75) (https://symmetricstrength.com/about, https://liftvault.com/resources/strength-ratio-calculator/).
3. **Best-lift-per-category scoring to avoid double counting** — the right rule if PersonalOS ever aggregates multiple variations of one pattern (https://symmetricstrength.com/about).
4. **Strength score as "1/4 of hypothetical Wilks" with age adjustment** — a single comparable number across sexes/bodyweights; conceptually adjacent to PersonalOS's bodyweight-relative standards, minus the need for external data (https://symmetricstrength.com/about).
5. **Relative weakness percentages that sum to ~0%** — an elegant self-contained display: "you're +12% squat, −8% bench vs your own average"; no external population needed, fully offline (https://symmetricstrength.com/about).
6. **Age adjustment only outside 25–40** (matching strengthlevel.com's 25–40 baseline) — a consistent convention for PersonalOS's age handling (https://symmetricstrength.com/about, https://strengthlevel.com/about).

---

## 8. OpenPowerlifting (data layer)

### 8.1 Overview
A community project building "a permanent, accurate, convenient, accessible, open archive of the world's powerlifting data" — the largest open database of judged powerlifting results (200+ federations, ~1M+ lifters; the latest bulk CSV is 161MB / 4,005,057 rows) (https://openpowerlifting.gitlab.io/opl-csv/bulk-csv.html, https://fitnessvolt.com/strength-standards/methodology/). All competition data is contributed to the public domain; code is AGPLv3+ (https://gitlab.com/openpowerlifting/opl-data/-/tree/main). No public REST API (a long-standing feature request, GitLab issue #1325 — "we give away all the data already"), but bulk CSVs, per-lifter CSV downloads, and third-party REST wrappers exist (https://gitlab.com/openpowerlifting/opl-data/-/work_items/1325, https://github.com/wajeht/close-powerlifting). Related: plsource.org, the OpenPowerlifting-supported app/SDK source (Liftosaur's RPE multiplier table comes from plsource) (https://github.com/astashov/liftosaur/).

### 8.2 Core paradigm
Not a training method — the authoritative competition dataset. Per-entry fields: lifter name, sex, age division, equipment (raw/wraps/single-ply/multi-ply), federation, meet, date, location, bodyweight, weight class, all squat/bench/deadlift attempts, total, place, and computed coefficients (Wilks, DOTS, IPF GL) (https://denstarfitness.com/open-powerlifting/). Records and rankings are calculated off bodyweight, not weight class ("the weightclass shown is the one you 'entered'… your lifts will still count in the right places") (https://www.openpowerlifting.org/faq).

### 8.3 Progression logic
N/A for training. Relevant logic for standards builders: rankings are percentile computations over filtered cohorts (sex × equipment × weight class × federation × age division × year), sortable by squat/bench/deadlift/total/DOTS — exactly the cohort math Fitness Volt's FVCP percentiles re-run (https://www.openpowerlifting.org/, https://fitnessvolt.com/strength-standards/methodology/).

### 8.4 Standards & rankings
- The Rankings page exposes the raw material for percentile standards; all-time record lists per weight class/equipment/federation ("knowing where a national record sits tells you what 'elite' actually means in absolute terms for your class") (https://denstarfitness.com/open-powerlifting/, https://www.openpowerlifting.org/).
- Data licensing is public domain — legal to repackage into frozen tables (relevant if PersonalOS ever derives standards from real competition data rather than curated tables) (https://openpowerlifting.gitlab.io/opl-csv/).
- Caveat: competition populations are self-selected and stronger than gym populations (median raw 83kg male: 408lb squat / 276lb bench / 480lb deadlift — vs ~270lb squat median in gym self-reported data) (https://fitnessvolt.com/strength-standards/stat-finder/, https://fitnessvolt.com/strength-standards/research/powerlifting-strength-percentiles/).

### 8.5 Records/PR tracking
Lifter pages list every competition entry chronologically with per-entry lifts, bodyweight, and coefficients, plus best-lift summaries at the top and a "Download as CSV" button per lifter — effectively an all-time PR timeline per lifter with dates (https://denstarfitness.com/open-powerlifting/, https://openpowerlifting.org/u/paulwalker1). This is the closest analog to PersonalOS's "records vault: est-1RM ladder with dates, PR history timeline" — except OPL tracks judged meet results while PersonalOS tracks Epley estimates.

### 8.6 GUI layout (deep)
- **Rankings page**: filter sidebar — federation (200+), nationality, equipment class, weight class, sex, age division (Youth 5-12 → Masters 85-89), year (1964–2026), event (Full Power / Push-Pull / by Squat / Bench / Deadlift / Total / DOTS); results rendered as sortable tables (https://www.openpowerlifting.org/).
- **Lifter page**: header with best lifts (Squat/Bench/Deadlift/Total/DOTS), then a chronological Competition Results table (Place/Fed/Date/Location/Competition/Division/Age/Equip/Class/Weight/attempts/Total/Dots), with per-lifter CSV export (https://openpowerlifting.org/u/paulwalker1).
- **Records / Meets / Status pages**: record lists, meet index, and a live status page of meets entered (https://www.openpowerlifting.org/faq, https://www.openpowerlifting.org/).
- **Data service** (openpowerlifting.gitlab.io/opl-csv): bulk CSV downloads (full dataset 161MB/4M rows; openipf subset 64MB/1.5M rows), docs on format (double-quotes and in-field commas disallowed) (https://openpowerlifting.gitlab.io/opl-csv/bulk-csv.html, https://openpowerlifting.gitlab.io/opl-csv/bulk-csv-docs.html).

### 8.7 Differentiators & steals for PersonalOS
1. **The all-time PR ladder with dates, computed from bodyweight not class** — validates the vault's design: one best-ever number per lift, dated, re-ranked when bodyweight changes (https://www.openpowerlifting.org/faq).
2. **Public-domain data** — if PersonalOS later wants empirical standards (e.g., validating its frozen tables or adding percentiles), OPL CSVs are legally clean and offline-packable (161MB full; per-lift subsets far smaller) (https://openpowerlifting.gitlab.io/opl-csv/).
3. **Cohort filter semantics (sex × equipment × class × division)** — the discipline of never blending populations; Fitness Volt's dual-population display is the user-facing version of this (https://www.openpowerlifting.org/).
4. **Attempt-level data where available (all 3 attempts)** — the only dataset that records near-misses; if PersonalOS ever stores "attempted but failed" PR attempts, it can mirror this (https://denstarfitness.com/open-powerlifting/).
5. **A note of caution for the frozen-tables decision**: competition percentiles run far harder than the 1.0x-3.0x bodyweight tables PersonalOS ships (median male competitor benches 1.51x BW; a "2.0x bench" is ~95th+ percentile competition-grade) — the frozen tables and any future "you're in the top X%" claim must be labeled by population (https://fitnessvolt.com/strength-standards/research/powerlifting-strength-percentiles/).

---

## 9. Strength standards reference sites: strengthlevel.com, Lift Vault, Fitness Volt

### 9.1 Overview
- **strengthlevel.com**: data-driven standards platform (founded 2007 by Michael Clark; percentile standards since 2015). 2026 standards: 287 exercises, 195,513,376 lifts from 27,893,268 users; powerlifting standards updated July 2026 from 793,825 totals (683,384 male / 110,441 female, 2015–2026); also Body Standards (biceps/chest/waist etc. from 145,356 qualifying results of 717,401 measurements). Free web tool with account features (https://strengthlevel.com/about, https://strengthlevel.com/strength-standards).
- **Lift Vault**: the largest program/spreadsheet database (GZCLP v4.5 spreadsheets, program reviews, templates) plus a growing resources section — Strength Standards tool and Strength Ratio Calculator built on OpenPowerlifting data (https://liftvault.com/resources/strength-standards/, https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/).
- **Fitness Volt**: media site whose strength-standards hub (445 exercises, 2026) computes the FVCP (FitnessVolt Competition Percentile) from 2.5M+ OpenPowerlifting results, shown alongside gym-population percentiles and modeled level tables — populations always labeled, never blended (https://fitnessvolt.com/strength-standards/, https://fitnessvolt.com/strength-standards/methodology/).

### 9.2 Core paradigms
- **strengthlevel.com**: percentile ladder (Beginner >5%, Novice >20%, Intermediate >50%, Advanced >80%, Elite >95% of lifters, defined by sex × exact bodyweight, age-adjusted outside 25–40 baseline) computed from filtered community-entered working sets (1–10 reps converted to estimated 1RM); regression models of lift vs bodyweight (replacing the original Kilgore/ExRx-derived formulas in 2015 with models fitted on 500k+ community lifts). "This is the earliest documented use we have found of that exact Beginner-to-Elite percentile ladder for strength standards" (https://strengthlevel.com/about, https://strengthlevel.com/strength-standards).
- **Lift Vault**: competition-percentile tiers — intermediate = median competitor, advanced = top 20%, elite = top 5%, world class = top 1% per weight class, from OpenPowerlifting (https://liftvault.com/resources/strength-standards/).
- **Fitness Volt FVCP**: percentile of a 1RM within sex × equipment × bodyweight-class cohort of judged results; five tiers mapped to 5th/20th/50th/80th/95th percentiles; estimated standards for non-contested lifts via ratio derivation from base lifts (incline bench ≈ 75–80% of flat bench, etc.); age adjustment is a separate labeled model layer, never an age cohort (https://fitnessvolt.com/strength-standards/methodology/).

### 9.3 Progression logic
N/A (reference tools). Useful logic details:
- strengthlevel's 1RM conversion of working sets (1–10 reps) → the basis for "ladder" entries, same family as Epley; their overall-strength score sums Big-3 estimated totals and ranks them against same-bodyweight totals (https://buildingstrengthlevel.wordpress.com/2015/11/01/how-strength-level-calculates-your-overall-strength/).
- Lift Vault's ratio ranges (bench:squat 0.60–0.85; deadlift:squat 1.10–1.30; OHP:bench 0.55–0.75), cross-validated between Thibaudeau/Poliquin tables and millions of logged lifts — "when a coach's table and a big pile of meet data land on the same numbers, they're worth taking seriously" (https://liftvault.com/resources/strength-ratio-calculator/).

### 9.4 Standards & rankings — the numbers landscape
- **Bodyweight-relative (gym) reality check**, Fitness Volt modeled intermediates at 180lb male: bench 221lb (1.23x BW), squat 292lb (1.62x), deadlift 340lb (1.89x); ratios decline with bodyweight (250lb lifter: 1.20x/1.58x/1.80x) (https://fitnessvolt.com/strength-standards/research/state-of-strength-2026/).
- **Competition reality check** (raw, 83kg male): median squat 408lb (2.23x), bench 276lb (1.51x), deadlift 480lb (2.62x); 90th percentile ≈ 2.8x/1.9x/3.19x (https://fitnessvolt.com/strength-standards/research/powerlifting-strength-percentiles/).
- **Comparison of the two populations**: a 205lb bench at 180lb bodyweight is the 53rd percentile of gym lifters (n=24,645) but only the 10th percentile of raw competitors (n=91,546) — gym data and competition data answer different questions and must not be blended (https://fitnessvolt.com/strength-standards/how-strong-am-i/).
- **Lift Vault men's raw squat tiers** (kg): -74: Int 167.5 / Adv 195 / Elite 225 / World 250; -83: 185/215/245/270; -93: 200/230/260/287.5; -105: 210/245/280/310; women's totals (kg): -57: 280/330/385/430 (https://liftvault.com/resources/strength-standards/).
- **strengthlevel male powerlifting totals** (kg, e.g., 80kg BW): Beg 259 / Nov 322 / Int 396 / Adv 477 / Elite 562; female 60kg BW: 124/166/217/274/335 — gym-population standards run well below competition medians (https://strengthlevel.com/powerlifting-standards/kg).
- **Self-report caveat**: strengthlevel explicitly warns its population "might be, on average, stronger than the general population" because its users are dedicated lifters (https://strengthlevel.com/faq).

### 9.5 Records/PR tracking
strengthlevel: per-exercise standards show supporting lift counts publicly ("Bench Press 48,718,584 lifts / Squat 24,988,444 / Deadlift 22,978,599…") — evidence-based transparency; profiles carry overall percentile ("you are stronger than X% of users") (https://strengthlevel.com/about, https://strengthlevel.com/strength-standards/male/kg). Fitness Volt: stat-finder + "how strong am I" rank checkers that interpolate your lift between published percentile bands in both populations (https://fitnessvolt.com/strength-standards/stat-finder/).

### 9.6 GUI layout (deep)
- **strengthlevel.com**: (1) Calculator: gender, unit, bodyweight, age, lift, weight + reps → result card with percentile, Beginner-to-Elite label + star rating, and bodyweight ratio ("lift analysis: entered repetitions, estimated 1RM, age-adjusted exact-bodyweight percentile, Beginner-to-Elite rating, simple bodyweight ratio"). (2) Standards tables: per exercise, sex, bodyweight rows × five-level columns (lb and kg pages). (3) Overall strength + powerlifting calculator pages with the same table format. (4) Per-exercise pages listing supporting lift counts (https://strengthlevel.com/about, https://strengthlevel.com/strength-standards, https://strengthlevel.com/strength-standards/male/kg, https://strengthlevel.com/powerlifting-calculator).
- **Lift Vault**: (1) Strength Standards tool: sex + lift + bodyweight → tier table per weight class (intermediate/advanced/elite/world class); "add what you lifted and it tells you where you stand"; live version filterable by federation, equipment, age (https://liftvault.com/resources/strength-standards/). (2) Strength Ratio Calculator: enter S/B/D (+optional OHP) → lagging lift flagged against typical ranges (https://liftvault.com/resources/strength-ratio-calculator/). (3) Program pages: GZCLP spreadsheet v4.5 embedded, with progression instructions and per-tier rules inline (https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/).
- **Fitness Volt**: (1) Exercise pages with tabs — modeled level tables (Beginner→Elite by bodyweight + age), verified competition percentiles, gym percentiles — never blended, each labeled with source and n. (2) Methodology page (pipeline: base lifts → cohorts → percentiles → cross-validation). (3) Stat Finder: dual-population benchmark explorer (50th/90th/95th/99th percentile, bodyweight-multiple, sample sizes) + "where would your lift rank" checker. (4) Bodyweight-ratio standards pages (lifts as multiples of bodyweight) (https://fitnessvolt.com/strength-standards/, https://fitnessvolt.com/strength-standards/methodology/, https://fitnessvolt.com/strength-standards/stat-finder/).

### 9.7 Differentiators & steals for PersonalOS
1. **The Beginner/Novice/Intermediate/Advanced/Elite ladder pinned to percentiles (5/20/50/80/95)** — the format PersonalOS's frozen tables already use; strengthlevel's 2015 origin story confirms the convention and the labels' meanings (Beginner = correct technique ≥1 month; Novice = ≥6 months; Intermediate = ≥2 years; Advanced = 5+ years) (https://strengthlevel.com/about, https://strengthlevel.com/strength-standards/male/kg).
2. **Always label the population** (gym self-reported vs judged competition; modeled vs empirical) — Fitness Volt's dual-tab display is the gold standard for honesty; PersonalOS's frozen tables are modeled/gym-style and should be labeled as such in the vault UI (https://fitnessvolt.com/strength-standards/how-strong-am-i/, https://fitnessvolt.com/strength-standards/methodology/).
3. **Ratio-based standards for non-contested lifts (incline ≈ 75–80% of bench, etc.)** — the method to extend PersonalOS's big-4 frozen tables to any tracked exercise without new data (https://fitnessvolt.com/strength-standards/methodology/).
4. **Bodyweight-multiple as the universal display unit** (1.23x bench etc.) — matches PersonalOS's bodyweight-relative standards and trophy thresholds (1.5x/2x) exactly; note heavy lifters' ratios decline with BW, so multiples should be computed from current bodyweight, not a static class (https://fitnessvolt.com/strength-standards/research/state-of-strength-2026/).
5. **"Where does this lift rank?" interpolation between percentile bands** — the deliverable shape for a vault "standards" screen: enter lift → see tier + percentile within your cohort (https://fitnessvolt.com/strength-standards/stat-finder/).
6. **Public supporting-lift counts as trust signals** — "based on N lifts" footnotes make frozen tables feel live; PersonalOS can stamp its tables with the source (e.g., "standard tables, 2026, ratio-derived") (https://strengthlevel.com/about).

---

## 10. Cross-cutting synthesis for PersonalOS M2

### 10.1 The canonical stall/deload rule set (what to encode)
- LP novice path: +increment per completed session; 3 consecutive failed sessions → −10% (configurable count and %); per-exercise state (StrongLifts: https://support.stronglifts.com/article/71-progression).
- Stage cascade path: on failure, denser scheme at same weight (5x3→6x2→10x1; 3x10→3x8→3x6), deload/reset only after the last stage (GZCLP: https://liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/).
- Submaximal-anchor path: TM = 85–90% of est-1RM; fixed +5/+10 per cycle; AMRAP diagnostics; −10% TM reset when rep records underperform; scheduled deload every 4th week or reactive (5/3/1: https://train531.com/blog/531-training-max-calculator/, https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
- Reactive default: deload when stalls last 2–3 weeks or joints ache; "reactive beats scheduled" (Liftosaur: https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).
- Return-from-break: ≥1 week off → suggested 10–20% deload with slider (StrongLifts: https://support.stronglifts.com/article/71-progression).

### 10.2 Epley across the cluster
Epley is the de facto e1RM standard: Liftosaur's calculate1RM/calculateTrainingMax (Epley ×0.9 for TM) (https://www.liftosaur.com/docs/docs); StrongLifts' e1RM graphs for sets of 1–12 (https://support.stronglifts.com/article/89-graphs); strengthlevel converts 1–10-rep sets to estimated 1RM (https://strengthlevel.com/about). PersonalOS's Epley 1–12 rep guard sits squarely in the mainstream; the rep-mode bodyweight case is handled by rep ladders + variation chains (Liftosaur: https://github.com/astashov/liftosaur/blob/master/llms/program_design.md).

### 10.3 What nobody does well (headroom for PersonalOS)
- **PR celebration**: strongest existing = Alpha Progression's PR/milestone/achievement lists and StrongLifts' per-exercise PR stars; the completion screens are acknowledged as under-celebrated (https://screensdesign.com/showcase/stronglifts-weight-lifting-log, https://alphaprogression.com/en). Milestone trophies (1.5x/2x BW, 100th workout, tonnage) with ceremony are genuinely open territory.
- **All-time records vault with dates**: only OpenPowerlifting does a real dated best-lift ladder, and it's for meet results (https://openpowerlifting.org/u/paulwalker1); no gym app maintains an all-time est-1RM vault with PR history timeline and trophy milestones.
- **Standards inside a logger**: standards exist as standalone sites; no app in the cluster embeds bodyweight-relative standards + trophies into the workout flow. Symmetric Strength is the closest (analysis-only).
- **Volume floors per muscle (MRV-style) + phases (bulk/cut/maintain)**: RP ships the theory; Alpha ships volume analytics; none tie weekly volume floors to training phases with deloads and ramps the way M2 spec intends (https://arvo.guru/resources/methods/rp-training, https://agent-finder.co/reviews/alpha-progression).

---

## Source index (all URLs cited inline above)
- StrongLifts: stronglifts.com/stronglifts-5x5/, /app/, /stronglifts-5x5/progress/, /stronglifts-5x5/workout-program/; support.stronglifts.com/article/71-progression, /63-log-workouts, /72-history, /89-graphs, /177-widget, /186-widget, /98-buy-pro; apps.apple.com/us/app/stronglifts-5x5-workout-plan/id488580022; screensdesign.com/showcase/stronglifts-weight-lifting-log, /apps/stronglifts-weight-lifting-log/
- 5/3/1: fivethreeone.app/; apps.apple.com/us/app/five-three-one-531-workouts/id1560266240; apps.apple.com/us/app/5-3-1-workout-logger-531/id1114435690; sarasoft.nl/five3oneios/; train531.com/blog/531-program-complete-guide/, /531-training-max-calculator/, /531-glossary-every-term-and-acronym-explained/; strengthinsider.com/workout-programs/531-program/; muscleandfitness.com/workouts/workout-routines/jim-wendlers-5-3-1-training-program-complete-guide-to-the-proven-strength-training-system/; pullyapp.com/en/blog/531-workout-program-guide; research.poin-t-go.com/en/guides/5-3-1-program-complete-breakdown; norma-athletics.at/guides/wendler-531/
- Liftosaur: liftosaur.com/, /docs/docs, /doc/liftoscript, /programs/gzclp, /blog/posts/new-experimental-program-editor/, /blog/posts/combine-workout-planner-and-liftoscript/; github.com/astashov/liftosaur (README), /blob/master/llms/program_design.md; apps.apple.com/us/app/liftosaur-scriptable-workouts/id1661880849; reddit.com/r/liftosaur/comments/1es2d9c/
- GZCLP: liftvault.com/programs/powerlifting/gzclp-program-spreadsheets/; massiv.app/blog/gzclp-progression/; repcheckapp.com/blog/gzclp-guide; virtusapp.ai/blog/gzclp-program-guide/; liftproof.app/blog/gzclp-explained/, /programs/gzclp/; fitnessvolt.com/rpe-training/programs/gzclp/; drworkout.fitness/gzclp-program-spreadsheet-for-beginners/; boostcamp.app/coaches/cody-lefever/gzcl-program-gzclp, /methodology/gzcl; apps.apple.com/us/app/boostcamp-workout-programs/id1529354455; play.google.com/store/apps/details?id=com.chrisdmilner.gzclp; barbend.com/boostcamp-review/; garagegymreviews.com/boostcamp-review; fitloop.app/programs/NosuRoqgLY7ha6ZEG
- RP: rpstrength.com/pages/hypertrophy-app, /blogs/articles/progressing-for-hypertrophy, /blogs/podcasts/major-updates-to-the-rp-diet-hypertrophy-apps-rp-strength; help.rpstrength.com/hc/en-us/articles/32600173777815, /34725726510999, /41101429407255; apps.apple.com/us/app/rp-hypertrophy/id1555614554; play.google.com/store/apps/details?id=com.rp.hypertrophy; dr-muscle.com/rp-hypertrophy-app-review/; blog.paulmrichardson.com/how-rp-hypertrophy-transformed-my-workouts; mesostrength.com/blog/mesostrength-vs-rp-hypertrophy; fitnessaitrends.com/blog/juggernautai-vs-rp-hypertrophy-app-2026/; arvo.guru/resources/methods/rp-training; ditchnet.org/t/can-anyone-share-an-honest-rp-hypertrophy-app-review/2143
- Alpha Progression: alphaprogression.com/en, /en/subscribe, /en/glossary/gym-tracker, /en/blog/best-way-get-back-gym-routine, /en/4xvkML (shared plan example); play.google.com/store/apps/details?id=com.alphaprogression.alphaprogression; apps.apple.com/us/app/gym-workout-alpha-progression/id1462277793; hotelgyms.com/blog/alpha-progression-the-gym-logger-app-from-germany, /blog/how-to-use-alpha-progression; agent-finder.co/reviews/alpha-progression; push-pull.app/blog/push-pull-vs-alpha-progression; screensdesign.com/apps/gym-workout-alpha-progression/
- Symmetric Strength: symmetricstrength.com/, /about, /standards, /calculator/one_rep_max, /calculator/wilks; symmetric-strength.apps112.com/; fitnessvolt.com/strength-standards/stat-finder/, /how-strong-am-i/ (cite as data consumer)
- OpenPowerlifting: openpowerlifting.gitlab.io/opl-csv/, /bulk-csv.html, /bulk-csv-docs.html; gitlab.com/openpowerlifting/opl-data/-/tree/main, /work_items/1325; openpowerlifting.org/ (rankings), /u/paulwalker1, /faq; old.openpowerlifting.org/data.html; denstarfitness.com/open-powerlifting/; github.com/wajeht/close-powerlifting
- Standards sites: strengthlevel.com/about, /faq, /strength-standards, /strength-standards/male/kg, /powerlifting-standards/kg, /powerlifting-calculator; buildingstrengthlevel.wordpress.com/2015/11/01/; liftvault.com/resources/strength-standards/, /resources/strength-ratio-calculator/; fitnessvolt.com/strength-standards/, /methodology/, /powerlifting/standards/, /how-strong-am-i/, /stat-finder/, /research/state-of-strength-2026/, /research/powerlifting-strength-percentiles/