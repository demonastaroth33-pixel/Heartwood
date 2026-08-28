# FITNESS-APP RESEARCH — MASTER COMPILE (Aug 2026)

**Super-thorough edition.** The complete cross-industry research base for
**PersonalOS** (private single-user Flutter PWA: journal + habits + gym +
nutrition + coach) — refactor evidence for the M2 fitness/body scope,
incorporation candidates, GUI/layout intelligence, and Coach/Life-Tree
design feed.

> **How to read:** Part 0 = executive summary. Parts 1–6 = cluster
> deep-dives (per-app profiles with GUI detail). Parts 7–10 = convergence,
> GUI compendium, master steal-list, gap analysis. Part 11 = decision-ready
> candidates. Part 12 = landing map. Part 13 = reference index.
>
> **Citation convention:** `(R01 §Strong)` = the app's section in
> `research-fitness/01-gym-loggers.md` (each carries inline source URLs).
> PersonalOS doc refs use real paths (`docs/Roadmap.md`, `docs/UIUX.md`,
> …).
>
> **Tag legend:** `[M2]`=fits locked M2 scope · `[M0]`=extends built ·
> `[new]`=new surface · `[coach]`=Coach feed · `[tree]`=Life Tree feed ·
> effort L/M/H.

---

## PART 0 — EXECUTIVE SUMMARY (one page)

**The 12 biggest takeaways from ~320 sources across 44 apps:**

1. **Every "AI" fitness app is a deterministic rules engine.** Fitbod,
   JuggernautAI, Volt, Alpha Progression, RP — all run on lookup tables,
   thresholds, and decision rules (Prilepin expected-RPE tables, TM
   adjustment rules, MEV/MAV/MRV volume bands). Nothing requires an LLM.
   The entire M2 adaptive layer is stealable as pure heuristics. (R02)

2. **The single highest-leverage logging UX is the previous-session
   comparison** — last time's weight/reps inline next to today's inputs,
   PRs flagged live (Hevy, Strong, Progression all converge). This one
   feature drives progressive overload better than any algorithm. (R01)

3. **The checkbox-complete set row is the canonical logging anatomy**:
   set table + tap-to-complete + auto rest timer + stepper input.
   PersonalOS's M2 logging screen should be BORN with this anatomy, not
   retrofit. (R01)

4. **Stall/deload rules are documented and copyable**: StrongLifts LP
   3-fail → −10%, GZCLP's stage cascade (5x3→6x2→10x1, deload only after
   the last stage), 5/3/1's TM (85–90% e1RM) + AMRAP recalibration,
   reactive deloads at 2–3-week stalls, return-from-break 10–20% slider.
   (R03 §10.1)

5. **The locked MRV-style volume floors = RP's MEV/MAV/MRV bands**, with
   the exact adjustment decision table (1 set short → +2–3; 2 → +1; hold;
   4 → deload). Prime-mover sets only, per-muscle. (R02, R03)

6. **Weight trend needs a time-indexed EMA, not a 7-entry window.** Libra
   publishes the formula (`power = 1 − e^(−Δt/smoothingTime)`, 7-day
   default) — gap-tolerant by construction. Happy Scale layers trend /
   rate / prediction separately. (R04)

7. **The 2-consecutive-week milestone confirmation is stricter than
   anything in the market** — everyone else celebrates on a single trend
   crossing. A defensible differentiator; pair celebrations with
   "confirmed by 2 consecutive weeks" copy. (R04)

8. **Readiness needs no wearable.** TrainingPeaks has computed Form
   (chronic − acute load, TSB) from workout data alone since the 2000s;
   Garmin folds workout-derived recovery time into readiness. PersonalOS
   can revive the deferred N5 recovery feature as an honest "Training
   Form" from logged sessions. (R05)

9. **Weekly streaks beat daily streaks for physical training** — NRC,
   Strava, Zwift independently converge; daily streaks punish rest and
   illness. Grace for fitness should be a weekly rhythm with earned
   savers (Zwift) or rule-based restore (Strava). (R06)

10. **"No XP for logging" is a proven mass-market model** — Freeletics
    (60M users) runs on badges + Perfect Weeks + skill unlocks with zero
    XP economy; Zwift's XP-grind shows the motivation cliff. If any
    points exist, they must come from completing planned sessions, not
    raw volume. (R06)

11. **PR celebration and the all-time records vault are open territory.**
    The richest existing systems are text/icon lists (Alpha PRs,
    StrongLifts stars). A dated all-time est-1RM vault with milestone
    trophies and ceremony (1.5×/2× BW, 100th workout, tonnage) is
    genuinely unclaimed. (R03 §10.3)

12. **Standards must be population-labeled.** The same 205lb bench at
    180lb BW = 53rd percentile of gym lifters (n=24,645) but 10th of raw
    competitors (n=91,546). The frozen tables are modeled/gym-style —
    label them as such; bodyweight-multiples are the universal display
    unit, computed from current BW. (R03 §9)

---

## PART 1 — METHOD & SOURCE BASE

- **6 parallel research agents**, one per cluster, mining websearch +
  webfetch: official docs, app-store pages, 2026 reviews, published
  training methodology (program authors' own docs), Reddit — ~320
  distinct sources cited inline.
- **Mobbin** live queries: Hevy (295 screens), Fitbod (216), MacroFactor
  (402), Nike Run Club (325), Strava (709), workout-family (946) — saved
  as JSON in `research-fitness/mobbin-*.json` (helper:
  `research-fitness/mobbin-query.mjs`).
- **Honesty policy:** dead-ends flagged (StyleScan = apparel AI tool,
  excluded); state changes captured (JEFIT's 2026 periodization-AI;
  Aaptiv's employer pivot; JuggernautAI V3.0 Aug 2026 rebuild).

### The six clusters
| # | Cluster | Report | Apps |
|---|---|---|---|
| 01 | Gym loggers & strength trackers | `01-gym-loggers.md` (60 KB) | Strong, Hevy, JEFIT, FitNotes, Progression, Boostcamp, PTC, KeyLifts, Workout Builder |
| 02 | Adaptive & coaching apps | `02-adaptive-coaching.md` (83 KB) | Fitbod, Future, Freeletics, Volt, Caliber, Aaptiv, JuggernautAI, SBS, Alpha Progression, RP Hypertrophy |
| 03 | Strength standards & periodization | `03-strength-standards.md` (79 KB) | StrongLifts 5x5, Five3One, Liftosaur, GZCLP, RP, Alpha, Symmetric Strength, OpenPowerlifting, standards sites |
| 04 | Body composition & physique | `04-body-composition.md` (70 KB) | MacroFactor, Happy Scale, Libra, MeThreeSixty, ZOZOFIT, Withings, FitTrack, BodySpace, photo cluster, 3D scanners |
| 05 | Wearables, recovery & ecosystems | `05-recovery-wearables.md` (67 KB) | Whoop, Oura, Garmin, Apple Fitness, Google/Samsung, Strava, NRC, TrainingPeaks |
| 06 | Bodyweight & gamified fitness | `06-bodyweight-gamified.md` (62 KB) | Calistree, Madbarz, Freeletics, NRC, Zwift, Runna, Garmin, Strava |

**Limitations:** prices/features as of Aug 2026; mobbin covers a subset;
ratings directional. Verify current terms before build decisions.

---

## PART 2 — CLUSTER 01: GYM LOGGERS & STRENGTH TRACKERS
*(full depth: `research-fitness/01-gym-loggers.md`)*

### 2.1 Cluster thesis
The direct competitors to PersonalOS's M2 logger. 2026 convergence:
**checkbox-complete set rows, previous-session inline comparison, live PR
flagging, rest timers, plate/warm-up calculators, template ecosystems,
CSV escape hatches** — plus JEFIT's leap into periodization-AI (NSPI,
4-phase mesocycles) and the no-account/no-data posture as the beloved
privacy pole.

### 2.2 App profiles (paradigm · features · GUI · steals)

**Strong** — "Workout. Notebook. Reinvented." The category reference.
(R01 §Strong)
- *Paradigm:* template-driven logging, checkboxes + rest timers, PRs
  surfaced live with animation, lossless metric↔imperial conversion,
  assisted-bodyweight + duration exercise types, folder templates.
- *GUI (concrete):* **Log Workout screen = the heart** — scrollable
  exercise cards; each card = exercise name (drag-handle) + set table
  (set # | weight | reps | circular checkbox) + "+ Add Set" + swipe-to-
  delete + rest-timer pill auto-starting on check-off (with
  Dynamic-Island/Live Activity + Apple Watch mirror) + "Add Exercises"
  mid-session + Finish top-right (partial workouts OK). History tab =
  chronological, re-openable, save-as-template. Charts = per-exercise
  volume + e1RM lines + PR history grid. "Dense but minimal — more
  buttons than Hevy, learning curve rewards investment."
- *Steals:* [M2] checkbox-complete rows (canonical anatomy); [M2] live
  PR animation; [M2] plate calculator; [M2] bodyweight/rep-mode types;
  [M2] folder templates; [new] metric↔imperial lossless.

**Hevy** — "#1 Workout Tracker"; 295 mobbin screens. (R01 §Hevy)
- *Paradigm:* the polished logger; 15s rest-timer micro-adjust +
  per-exercise rest defaults; inline previous-session comparison
  color-coded; sets-per-muscle-week chart; routine library (fork);
  year-in-review; Strong-CSV import.
- *GUI (concrete):* tab bar Home/Log | Routines | Discover | Statistics
  | Profile. Live workout = stacked exercise cards: name + rest-timer
  pill + note at top; set rows with weight/reps inputs + right-side
  checkmark; **"Last: 100kg × 5" comparison line**; set-type badges
  (W/D/F); swap mid-session. Statistics = muscle donut, sets-per-muscle
  weekly bars, exercise performance lines, body-weight graph, streak
  calendar. Social layer folds away if unused — behaves like a private
  notebook (the privacy precedent).
- *Steals:* [M2] **inline previous-session comparison** (the #1
  progressive-overload UX); [M2] rest-timer micro-adjust; [M2]
  sets-per-muscle-week chart; [M2] warm-up calculator; [coach]
  year-in-review (derived-only).

**JEFIT** — planner + logger; 2026 periodization-AI. (R01 §JEFIT)
- *Paradigm:* 2026 v17 added **NSPI** (composite index: load + stimulus
  + movement-balance engines, EMG-based Hard-Set Equivalents) and
  **4-phase Adaptive Mesocycles** (On-Ramp → Accumulation →
  Intensification → Deload with weekly recaps).
- *GUI (concrete):* Workout tab (routines + "Find" program marketplace
  with quiz → AI plan); logging screen with set table + auto rest
  timer + muscle icons + supersets — denser/menu-heavier than
  Strong/Hevy; Analytics: 1RM lines, per-session volume, **muscle-group
  heatmap body map**, measurements, NSPI dashboard with three engine
  scores. 2026 redesign cleaned clutter; still overwhelming for
  beginners.
- *Steals:* [M2] NSPI-style composite progress score; [M2] movement-
  balance ratios; [M2] 4-phase mesocycles + "weekly recap explains what
  changed"; [M2] muscle heatmap; [new] HSE stimulus metric.

**FitNotes** — the community's most loved free OFFLINE logger. (R01
§FitNotes)
- *Paradigm:* no account, 100% free, CSV export; barbell plate counting;
  filterable calendar ("bench >80kg × ≥5"); PR grid (1RM/2RM…nRM);
  save-and-new / Log-All; bodyweight next to strength.
- *GUI (concrete):* Today/Log = exercise list with weight/reps inputs +
  checkbox completion + add-exercise bar + rest timer; white bg, large
  numbers, high contrast. Calendar tab = month grid, tap day → "Go!"
  jumps to that day's log. Analysis = muscle-volume % bars, **PR grid**,
  body-weight + strength lines, est-1RM area charts. Settings = kg/lb
  mixing, exercise-type editing, rest vibrate, screen-awake.
  "Straightforward, no gimmicks."
- *Steals:* [M2] PR grid (vault ladder presentation); [M2] plate
  counting; [M2] filterable calendar highlights; [M2] save-and-new +
  Log-All; [M0] no-account + CSV posture.

**Progression** — minimalist autoregulation logger. (R01 §Progression)
- *GUI:* logging = exercise → weight stepper → rep stepper → complete;
  previous-session indicators inline; ad-free, distraction-free,
  iOS-native widgets + Dynamic Island.
- *Steals:* [M2] **steppers over keypads** (long-press rapid scroll —
  empirically fastest); [M2] auto double-progression (weight up, reps
  down at rep cap); [M2] previous-workout comparison.

**Boostcamp** — program library + coach-program logging. (R01 §Boostcamp)
- *GUI (concrete):* Programs tab = searchable program grid (name, coach,
  muscle type, days/week, rating, athletes joined) + intake quiz + AI
  plan builder. Today = ordered exercise list with target sets/reps +
  **last week's result inline**; per-set rows with weight/reps/RPE/RIR +
  completion taps; rest timer; plate calculator mid-session; swap
  exercise. Analytics: PR lists, e1RM curves, **volume heatmap anatomy
  chart**, **Strength Score gauge**, Sunday report card, streak
  calendar.
- *Steals:* [M2] **PR reset to new baseline** (post-deload ramp);
  [M2] **IPF DOTS Strength Score** over big-5; [M2] per-muscle volume
  heatmap; [M2] set labels warm-up/working/failure; [M2] mid-session
  swap carrying weights; [new] program-variation toggles.

**PTC (Personal Training Coach)** — scriptable program engine. (R01 §PTC)
- *Steals:* [M2] programs that drive the session (guide + auto
  progression + auto deload, no AI); [M0] one-time purchase, zero data
  collection — the privacy-pole validation.

**KeyLifts** — 5/3/1 companion. (R01 §KeyLifts)
- *GUI:* session screen with pre-computed % weights (5x5 @ 65% TM),
  warm-up rows, joker/assistance sections; 150+ template browser;
  week-by-week program editor; "software art for the 5/3/1 philosophy."
- *Steals:* feeds R03's 5/3/1 rule set; [M2] pre-computed percentage
  weights in-session.

**Workout Builder (Polemics)** — "no confetti, no pop-ups, no IAP, no
ads." (R01 §Workout Builder) — the anti-noise privacy precedent; M0
marketing posture.

### 2.3 Cluster synthesis (gym loggers)
- The logging screen anatomy is settled: set table + tap-complete +
  rest timer + steppers + previous-session comparison + live PR.
- Template ecosystems are folders-lite, not program engines — seed
  templates, don't build a scheduler.
- CSV export is the de-facto interchange format (Hevy imports Strong
  CSV); escape hatch = trust.
- JEFIT validates the M2 deloads/volume/phases stack as one integrated
  "progress score" story.
- Hevy's "social folds away" precedent matters for a privacy-first app.

---

## PART 3 — CLUSTER 02: ADAPTIVE & COACHING APPS
*(full depth: `research-fitness/02-adaptive-coaching.md`)*

### 3.1 Cluster thesis
**Every "AI" here is a rules engine.** The M2 adaptive layer is fully
stealable as tables and thresholds. The biggest UX wins are
non-algorithmic: Freeletics' one-tap feedback economics, JuggernautAI's
six-level check-in ladder, Future's shame-free tone, Caliber's weekly
rhythm.

### 3.2 App profiles (GUI focus)

**Fitbod** — algorithmic generator. (R02 §Fitbod)
- *GUI (concrete):* Onboarding = **Gym Profile** (goal, experience,
  equipment checkbox list incl. specific dumbbell increments, split,
  duration, variability, supersets) + MULTIPLE switchable gym profiles
  (home/hotel/commercial). Workout tab = today's generated list
  (exercise, sets/reps, suggested weight, rest; expand → video +
  notes; "Replace Exercise" + Recommend More/Less/Don't-Recommend
  Again). **Recovery tab = color-coded muscle fatigue heatmap 0–100%**,
  both readout AND input (manual recovery override) — closest market
  analog to deload markers/readiness. Metrics: e1RM per lift,
  mStrength per muscle, Overall Strength Score, weekly "Your Workout
  Report". Max Effort Day = flagged exercises with "push to max on
  final set" callout.
- *Steals:* [M2] per-muscle recovery % with manual override + heatmap;
  [M2] AMRAP/Max-Effort-Day recalibration; [M2] inactivity decay;
  [M2] gym profiles/equipment presets; [M2] exercise preference
  learning; [M2] constraint explanations ("show your work").

**Future** — 1:1 human coach. (R02 §Future)
- *GUI:* coach discovery quiz → coach cards → FaceTime intro; home =
  messaging stream + today's workout card + weekly plan preview;
  workouts tab = week overview with completion times; active session =
  video reel + voice cues + countdown + watch remote; check-ins = text
  + voice notes + form-check videos + monthly calls.
- *Steals:* [coach] tone spec — missed workouts "noted, but not
  intimidating"; [coach] the consistent named coach presence (private
  substitute for social accountability).

**Freeletics** — AI coach (60M users, no XP economy). (R02 §Freeletics)
- *GUI (concrete):* bottom nav Community | Coach | Settings; Coach tab =
  progressive disclosure (program overview → workout days → per-exercise
  video). Workout day = duration/focus/equipment + folded warm-up + big
  **"Adapt" button** + start. Active session = minimalist (video/name +
  timer + progress + one large adapt/replace button). **Post-workout
  feedback flow (publicly documented case study):** legacy 6+ screens /
  10+ interactions → redesigned to **2–3 screens, 2 interactions** with
  a happy path of ONE: single feedback screen, segmented buttons (not
  sliders), **defaults pre-set to most-common answers** (exertion ~80%
  "OK", technique ~56% "Excellent" from behavioral data) — users only
  confirm. A "finish" button was shipped then REMOVED after forum data
  showed users failing to hit it mid-burpee — replaced by a back button
  on the next screen. First-run education screens teach what feedback
  is. Gamification: points per completed exercise → profile level,
  day streaks (≥17 min counts) + week streaks, badges.
- *Steals:* [coach] **one-tap post-workout feedback** (the design spec
  for Coach data intake — 2 interactions max); [M2] pre-session adapt
  affordance (tired/short/no equipment → rewritten session);
  [M2] session difficulty rating; [M2] Perfect Week (plan completion
  streak); [M0] no-XP badges + skill unlocks model.

**Volt Athletics** — sport-science + Cortex AI. (R02 §Volt)
- *GUI:* onboarding (goal/sport → experience → equipment → schedule →
  trial → first workout + rate difficulty); Training Calendar that
  reshapes around your dates (peaking logic); session screen with
  exercise-by-exercise video + % target weights + **Smart Sets RPE
  prompt after each loaded set** + swap button (6 same-category
  alternatives); Tablet Training Mode for gym floors; CSV export.
- *Steals:* [M2] **expected-vs-actual effort table** (Prilepin RI →
  expected RPE; ≥2 deviation → adjust e1RM — the most precise no-ML
  autoregulation); [M2] movement-pattern replacement (6 alternatives).

**Caliber** — human coach + free logger. (R02 §Caliber)
- *GUI:* thorough onboarding (criticized as long but sets real
  personalization); dashboard = today's workout + weekly plan + coach
  messages + body stats + lessons; workout screen with RPE field;
  coach chat with inline Loom check-in videos; form-review flow
  (record → upload → coach comment thread); Strength Score + Strength
  Balance cards.
- *Steals:* [coach] **weekly coach summary in a fixed rhythm**
  (review → adjust → next-week goals — template-driven, no LLM).

**Aaptiv** — audio-first + SmartCoach. (R02 §Aaptiv)
- *Steals (selective):* audio coaching format (privacy-friendly
  alternative to video libraries — voice cues over own music);
  multi-week goal programs with fixed endpoints (race-prep countdown
  blocks → phase blocks with end dates). **Cautionary:** employer pivot
  + pricing hidden behind signup destroyed trust — the data contract is
  the product.

**JuggernautAI** — expert-system periodization (V3.0 Aug 2026). (R02
§JuggernautAI)
- *Paradigm:* individualized MEV/MRV volume landmarks + periodization
  strategy + **Readiness Engine** (pre-session 1–5 questionnaire incl.
  per-muscle soreness → adjusts THAT DAY's loads only) + RPE/RIR
  autoregulation + **six-level check-in ladder** (pre-training →
  intra-session → end-of-session → end-of-week → end-of-block →
  end-of-program) + Meet Day Advisor (taper 60–70% volume, hold
  intensity).
- *GUI (V3.0):* home = daily decision hub (readiness 0–100 with zones,
  today's session, SBD totals, habit calendar, recovery metrics);
  daily readiness screen (sliders for motivation/sleep/nutrition/
  soreness + per-muscle) answered BEFORE the workout loads — the load/
  rep scheme visibly responds; global rest timer with lock-screen Live
  Activities + custom audio cues.
- *Steals:* [coach] **the six-level check-in ladder** (the definitive
  Coach adaptation-cadence spec); [M2] daily readiness + per-muscle
  soreness → same-day load override only; [coach] readiness as a
  running weighted 0–100 score with zones; [M2] MRV-informed landmarks
  computed per lifter; [M2] meet-day/end-date tapering logic for
  phases; [coach] **provenance as authority** — name the rules'
  sources (Epley, Prilepin, Israetel, Schoenfeld).
- *Caveat:* volume overshoots if RPE rated dishonestly — decide one
  coarse signal first.

**Stronger by Science** — free spreadsheet autoregulation. (R02 §SBS)
- *Steals:* [M2] **TM adjustment rules** (RTF: +0.5%/rep beat, −1%/rep
  missed; RIR: +2%/>6 sets, −5%/<4 sets; overwarm single recalibration)
  — exact copy-paste rules on top of Epley; [coach] "show your work"
  documentation pattern (each program ships an explainer PDF — education
  is part of the product); [M2] fixed + reactive deload hybrid.

**Alpha Progression** — hypertrophy autoregulation. (R02 §Alpha)
- *GUI:* onboarding (goal → experience → equipment → schedule → muscle
  focus → 6-week plan); gym profile switcher with auto plan adaptation;
  workout with RiR input per set + progress recommendations inline;
  volume charts per muscle; CSV export; expert settings (deload weeks,
  RiR toggles). "Clean and minimal — the correct number of options."
- *Steals:* [M2] RiR-based microloading as a fallback signal;
  [M2] gym profile switcher; [M2] volume analytics with landmark bands.

**RP Hypertrophy** — volume-landmark manager. (R02 §RP)
- *GUI:* Meso Builder (per-muscle priority sliders, frequency, exercise
  selection, 4–8 week blocks → week-by-week plan); daily plan with
  sets/reps/RiR targets; after-session feedback with pump/soreness/
  performance sliders; volume viz vs landmarks. Onboarding "confusing —
  powerful knobs without explanation hurt" (cautionary).
- *Steals:* [M2] **MEV/MAV/MRV bands + decision table** (1 short →
  +2–3; 2 → +1; hold; 4 → deload — prime-mover sets only);
  [M2] meso-commitment UX (named block with endpoint); [coach]
  pump/soreness/performance feedback triad; [coach] soreness reported
  PRE-session (next workout's start, when still accurate).
- *Anti-patterns:* hidden decision logic; more-is-more volume bias.

### 3.3 Cross-app synthesis (R02 §11) — the 20-item steal table
| # | Pattern | Source | Rule-based implementation note |
|---|---|---|---|
| 1 | Expected-vs-actual effort table (Prilepin RI → expected RPE; ≥2 → adjust e1RM) | Volt Smart Sets | Pure lookup + delta rule |
| 2 | TM adjustment rules (RTF/RIR) | SBS | Copy-paste on Epley |
| 3 | MEV/MAV/MRV bands + decision table | RP | THE locked MRV floors |
| 4 | Per-muscle recovery % + manual override + heatmap | Fitbod | Deterministic fatigue model |
| 5 | AMRAP / Max-Effort-Day recalibration | Fitbod, SBS | PR hook + e1RM refresh |
| 6 | Six-level check-in ladder | JuggernautAI | Coach event-trigger spec |
| 7 | Daily readiness + soreness → same-day load override | JuggernautAI | Deload markers in concrete form |
| 8 | Pre-session "adapt" affordance | Freeletics | Session-level load multiplier |
| 9 | One-tap post-workout feedback UX | Freeletics | 2 interactions max |
| 10 | Inactivity decay | Fitbod | e1RM multiplier by days-since |
| 11 | Movement-pattern replacement | Volt, Alpha | Reuses category + muscle tags |
| 12 | Session difficulty rating | Freeletics | Coarse fallback signal |
| 13 | Exercise preference learning from edits | Fitbod | Weighted preference scores |
| 14 | Weekly coach summary in fixed rhythm | Caliber | Template-driven, no LLM |
| 15 | 7-formula e1RM with mean + spread | Stronger calc | Epley default + honest spread |
| 16 | Volume analytics with landmark bands | Alpha, RP | Bar vs MEV/MAV/MRV shading |
| 17 | Fixed deload weeks + reactive markers hybrid | SBS + JuggernautAI | Rhythm + event overrides |
| 18 | Gym profiles / equipment presets | Fitbod, Alpha | Cheap, high-value |
| 19 | Tone: "noted, not intimidating" | Future | No-shame sourcing |
| 20 | Documented uncertainty + sources | SBS, Volt | Trust without AI |

### 3.4 Documented failure modes to design around
Hidden decision logic (RP) · volume bias "more is more" (RP) ·
over-conservative adaptation (Freeletics) · RPE honesty assumptions
(JuggernautAI) · platform neglect eroding trust (Aaptiv) · pricing/scope
discipline (JuggernautAI $349/yr critique).

---

## PART 4 — CLUSTER 03: STRENGTH STANDARDS & PERIODIZATION
*(full depth: `research-fitness/03-strength-standards.md`)*

### 4.1 Cluster thesis
The rules live in public programs and public data. PersonalOS's locked
choices (Epley, Beginner→Elite tables, deload markers, phases) are all
validated mainstream; the open territory is **PR ceremony and the dated
records vault** — nobody does them well.

### 4.2 The canonical stall/deload rule set (R03 §10.1 — encode this)
- **LP novice path:** +increment per completed session; 3 consecutive
  failed sessions → −10% (configurable count/%; StrongLifts).
- **Stage cascade path:** on failure, denser scheme at same weight
  (5x3→6x2→10x1; 3x10→3x8→3x6), deload/reset only after the last stage
  (GZCLP) — the strongest stall mechanic in the cluster.
- **Submaximal-anchor path:** TM = 85–90% of est-1RM; fixed +5/+10 per
  cycle; AMRAP diagnostics; −10% TM reset when rep records underperform;
  scheduled deload every 4th week or reactive (5/3/1).
- **Reactive default:** deload when stalls last 2–3 weeks or joints
  ache; "reactive beats scheduled" (Liftosaur).
- **Return-from-break:** ≥1 week off → suggested 10–20% deload with
  slider (StrongLifts) — feeds M2's N2 post-deload return ramp.
- **Design law (Liftosaur docs):** every exercise MUST have a
  progression rule; always include failure/deload arguments.

### 4.3 Standards landscape (R03 §9)
- **The Beginner→Elite ladder (5/20/50/80/95 percentiles) originated at
  strengthlevel.com (2015)** — PersonalOS's frozen tables use this
  convention. Label meanings: Beginner = technique ≥1 month, Novice =
  ≥6 months, Intermediate = ≥2 years, Advanced = 5+ years.
- **Population split:** same 205lb bench at 180lb BW = 53rd percentile
  gym (n=24,645) vs 10th raw-competition (n=91,546) — never blend;
  competition percentiles run far harder than the 1.0–3.0× BW tables
  (median male competitor benches 1.51× BW).
- **Ratio-based extension:** incline ≈ 75–80% of bench; bench:squat
  0.60–0.85; deadlift:squat 1.10–1.30; OHP:bench 0.55–0.75 —
  cross-validated between coach tables and millions of logged lifts;
  the method to extend the big-4 frozen tables to any tracked exercise.
- **Bodyweight-multiple is the universal display unit** (1.23× bench);
  ratios decline with bodyweight — compute from CURRENT BW.
- **OpenPowerlifting** CSVs (161MB full; per-lift subsets small) =
  legally clean, offline-packable empirical data if percentiles are
  ever wanted; cohort filter discipline (sex × equipment × class).
- **Epley is the de-facto e1RM standard** (Liftosaur, StrongLifts,
  strengthlevel 1–10-rep conversion) — the 1–12 guard is mainstream.

### 4.4 Headroom (R03 §10.3 — what nobody does)
- **PR celebration:** strongest = icon lists (Alpha PRs, StrongLifts
  stars); milestone trophies with ceremony are open territory.
- **All-time dated records vault:** only OpenPowerlifting (meet
  results); no gym app maintains an all-time est-1RM vault with PR
  history timeline + trophy milestones.
- **Standards inside a logger:** standards exist only as standalone
  sites (Symmetric Strength closest, analysis-only).
- **Volume floors tied to phases (bulk/cut/maintain) with deloads +
  ramps:** nobody integrates the whole M2 stack.

---

## PART 5 — CLUSTER 04: BODY COMPOSITION & PHYSIQUE
*(full depth: `research-fitness/04-body-composition.md`)*

### 5.1 Cluster thesis
Trend math is settled and public; photo-tracking UX is mature; body-fat
% from consumer gear is untrustworthy (label estimate or omit).
PersonalOS's locks (first-of-day rule, 7-day rolling, 2-week milestone
confirmation, D031 timeline) are validated — and the 2-week rule is
STRICTER than the whole market.

### 5.2 The trend engine (R04 synthesis #1-3)
- **Libra's time-indexed EMA:** `power = 1 − e^(−Δt/smoothingTime)`,
  smoothingTime = 7 days — gap-tolerant by construction; a strict
  improvement over a naive 7-entry window; the thin-week rule can
  compute nothing while the trend quietly tolerates gaps. MacroFactor's
  interpolation fabricates data — against the no-fake-data rule.
- **Happy Scale's layering:** trend (EMA) ≠ rate (regression slope over
  recent trend points) ≠ prediction (slope extrapolation) — three
  separate derived numbers.
- **Stall detection:** trend-slope over 4 consecutive weekly deltas
  (PersonalOS spec) is on the conservative side of everything found
  (MacroFactor treats deviation as signal at ~day 4–5; Hacker's Diet
  judges at day 4–5 "especially if accelerating") — no false alarms;
  display as "rate vs target" bar (bulk +0.25–0.5 / cut −0.5 kg/wk).
- **Water-jump handling:** 30-day green/red banding (Happy Scale) +
  floats/sinkers dots (Libra/Hacker's Diet) — one spike = sliver; a
  plateau with sinkers below the line is visibly NOT a stall.

### 5.3 Milestones & physique (R04 synthesis #4-6)
- **Milestone ladder:** Happy Scale's hero ring ("Milestone 6",
  celebration states, % to next rung) applied to the 70/75/80/85/90/95/
  100kg ladder + Libra's forecast-to-date ("you'll reach 80kg on ~date,
  based on current slope") + MacroFactor's goal-boundary photos (photo
  at each rung's start/end). Pair celebrations with "confirmed by 2
  consecutive weeks" copy.
- **Physique timeline:** Metamorph ghost overlay + angle-grouped series
  + MacroFactor monthly cadence + Progress-style on-device storage with
  app lock + attach-photo-to-past-date + slider-divider compare with
  date stamps (Body Measurement Tracker & Log) + optional time-lapse
  export (Progress Pics). Photos NEVER leave the device; no AI touch-
  ups (fake-data violation — Photo Compare/media.io lane explicitly
  rejected).
- **Weigh-in UX:** one-tap "+" with tally-reveal animation (Happy
  Scale) + Withings **"Eyes Closed" mode** (hide the number, record it
  — privacy-first anti-anxiety) + canonical first-of-day prompt
  (morning, post-bathroom, pre-food — Libra/Withings protocol).
- **Body-fat % accuracy ladder:** DEXA ±1–2% > segmental BIA ±2–4% >
  foot-to-foot ±3.5–5% > tape > shape-derived; hydration swings 3–4
  points; FitTrack measured +4.8pt vs DEXA. Label anything
  consumer-derived "estimate, trend only" or omit entirely.
- **Trust = explainers everywhere:** every derived metric ships a
  tap-to-explain screen ("How We Got Here" — MacroFactor precedent;
  FitTrack per-metric explanations; Libra's published formula; the
  measurement-reliability protocol 2-of-3 averaging).

### 5.4 Anti-patterns (documented)
Trendline-only charts hiding raw points (Withings user revolt) · 17
untrended numbers (FitTrack noise theater) · scan drift from algorithm
updates eroding trust (MeThreeSixty) · public-by-default body photos
(BodySpace) · prediction/visualization tools degrading body image
(MeThreeSixty Future Me, Rate My Physique AI — reviews show real
distress).

---

## PART 6 — CLUSTER 05: WEARABLES, RECOVERY & ECOSYSTEMS
*(full depth: `research-fitness/05-recovery-wearables.md`)*

### 6.1 Cluster thesis
Recovery/readiness from exercise data ALONE is fully validated
(TrainingPeaks CTL/ATL/TSB since the 2000s). PersonalOS can revive the
deferred N5 feature as an honest, hardware-free "Training Form" — and the
market's own gaps (no rest-day/deload logic in readiness scores) are
exactly what PersonalOS already has (planned-rest, deload markers, quiet
weeks).

### 6.2 Recovery signals computable without hardware (R05 synthesis)
1. **Form/readiness (TSB-style):** chronic − acute load from logged
   sessions — the only fully validated readiness concept needing zero
   hardware.
2. **Recovery-time estimate:** hours/days until "should be fresh" from
   last-session magnitude (Garmin concept, load-computed).
3. **Ramp-rate / volume-spike detection:** acute-vs-chronic ratio +
   week-over-week deltas — Coach alert "don't increase chronic load
   more than ~8 units/week" (TrainingPeaks guardrail).
4. **Rest-day pattern detection (F2):** ≥3 rest days trained in trailing
   4 weeks = pure calendar computation (already M2 scope).
5. **Deload awareness + planned-rest:** scheduling facts, not
   measurements; make deload a first-class, positively-framed event the
   Coach SCHEDULES in advance.
6. **Optional self-reports** (sleep hours, morning recovery 1–5,
   soreness, RPE): fold in when present; degrade gracefully to "Form
   (training only)" when absent. (Whoop itself is adding subjective
   readiness questions.)
7. **Presentation honesty:** label "Training Form (from your logged
   training)" — never imply physiology you didn't measure; show
   contributors (chronic 4-wk load − acute 7-day load, colored); give
   bands not false-precise verdicts (Garmin prime/moderate/low +
   green tunnel); Coach defaults to silence; "rest day is not a loss of
   fitness" doctrine as core Coach copy.

### 6.3 Gamification consensus (R05/R06)
Weekly streaks + rest legitimacy (Strava weekly streaks, Apple ring-
pause, NRC) · achievement difficulty ↔ retention (hardest-tier
retainers 74% vs 32% easiest; day-one earners +64% — Trophy data) ·
positive-only streak displays (Zwift streak-flair) · consistency crowns
> speed crowns (Strava Local Legend vs KOM) · challenges with endpoints
+ opt-in.

### 6.4 Anti-patterns (never copy)
Subscription data hostage (Whoop) · cloud-mandatory operation (Oura) ·
platform death (Google Fit shutdown; NRC China) · default-public sharing
(Strava) · daily-streak shaming + junk-activity incentives (Apple
rings) · synthetic scores presented as medical truth (universal caveat).

---

## PART 7 — CLUSTER 06: BODYWEIGHT & GAMIFIED FITNESS
*(full depth: `research-fitness/06-bodyweight-gamified.md`)*

### 7.1 Cluster thesis
Bodyweight progression models + "what survives without social/XP".
Answers: **skill-tree progression ladders, weekly streaks with earned
savers, plan-completion as the game, adapt-buttons that remove failure,
positive-only streak displays.**

### 7.2 Steal-worthy shortlist (R06 §9.2, ranked)
1. **Skill-tree / progression-ladder data model** (Calistree): explicit
   difficulty edges between exercises + your position from clean reps;
   "path to X" + "next tier" surfaced automatically — directly fits
   rep-mode exercises + the weight ladder.
2. **Perfect Week / plan-completion streak with earned savers**
   (Freeletics + Zwift): streak = completion of your own weekly
   schedule; savers earned at 12-week marks (max 2). Grace earned,
   capped, automatic.
3. **Post-session PR callout + benchmark sessions** (NRC + Freeletics
   God workouts): every session re-frames as beat-your-best; scheduled
   pre-deload test days update PRs and feed standards.
4. **Situation & adherence trophies, not volume trophies** (Garmin):
   Goal-Getter-style self-set adherence badges (3/7/30/60-day) +
   circumstance trophies (early bird, night owl) — anti-farm by design.
5. **Weekly-rolling comparison window** (Calistree's 7-day buddy XP):
   "this week vs last week" instead of lifetime totals;
   absence-forgiving.
6. **Adapt-buttons that remove failure** (Freeletics): too sore / no
   space / quiet / different session — Coach suggestions always carry a
   lighter/swap/scale option.

### 7.3 Cross-app consensus (R06 §9.1)
- Weekly streak cadence is the industry consensus (NRC, Strava, Zwift).
- Achievement difficulty ↔ retention; trophies must span easy-first-
  session wins to years-long arcs, visible from day one.
- "No XP for logging" proven (Freeletics 60M); XP-as-farmable-currency
  (Zwift) creates grind + level-cap cliff.
- Streak displays positive-only + opt-in (Zwift flair defaults off).
- Consistency crowns > speed crowns for the middle.
- **The plan is the game** (Runna zero-gamification success;
  Freeletics "with the Coach you don't have to think") — daily
  decision-removal + multi-week arc beats any badge system.
- Social accountability has a private substitute: a consistent, named,
  present Coach (NRC named-coach guided runs raise mid-session
  completion; Trophy +34% social effect is partially claimable).

### 7.4 Anti-patterns (with receipts)
Exponential level curves (Garmin level 9→10 = 52 years of marathons) ·
level caps / finite meta (Zwift level-50 cliff) · static hand-authored
difficulty jumps without per-user calibration (Madbarz) · overwarm
feedback that rings false (Runna "acted like I completed a marathon") ·
unfair streak breaks · pointsification without strategy (badges as
decoration).

---

## PART 8 — CONVERGENCE MATRIX (evidence-backed)

| Dimension | Consensus | Best practitioner | PersonalOS status |
|---|---|---|---|
| Previous-session inline comparison | Logging must show last time + flag PRs live | Hevy, Strong, Progression | MISSING — F-01 |
| Set-row anatomy | Checkbox-complete + rest timer + steppers | Strong, Hevy, FitNotes | MISSING — F-02/F-03 |
| Progressive overload rules | Documented LP/stage-cascade/TM | StrongLifts, GZCLP, 5/3/1 | LOCKED M2 — extend with cascade F-12 |
| Volume floors | MEV/MAV/MRV bands + decision table | RP | LOCKED M2 — make it THE table F-08 |
| e1RM | Epley mainstream; 7-formula spread exists | Liftosaur, SBS | LOCKED M2 — validated |
| Weight trend | Time-indexed EMA; trend/rate/prediction | Libra, Happy Scale | LOCKED — upgrade F-13 |
| Milestone celebration | Single-crossing everywhere; hero-ring UX | Happy Scale | LOCKED 2-week rule — STRICTER, differentiator + F-15 |
| Readiness | Training-load-only Form is valid | TrainingPeaks | DEFERRED N5 — revive F-19/F-20 |
| Streak cadence | Weekly + earned savers | NRC, Strava, Zwift | LOCKED grace — weekly rhythm F-25 |
| No-XP logging | Proven mass-market model | Freeletics (60M) | LOCKED — validated |
| PR ceremony + dated vault | Nobody does it well | — | OPEN TERRITORY — F-06/F-17 |
| Standards | Percentile ladder + population labeling | strengthlevel, Fitness Volt | LOCKED frozen tables — label F-17 |
| Feedback intake | One-tap post-workout + 6-level check-ins | Freeletics, JuggernautAI | MISSING — F-21/F-22 |
| Privacy | No-account, no-data, CSV escape | FitNotes, Workout Builder | LOCKED posture — validated |

---

## PART 9 — GUI & LAYOUT PATTERN COMPENDIUM (the stealable UX)

### 9.1 The logging screen (M2's most important surface — born-with)
- **Anatomy (Strong/Hevy consensus):** exercise card = name (drag-
  handle) + set table (set # | weight | reps | circular checkmark) +
  "+ Add Set" + swipe-to-delete + rest-timer pill (auto-start on
  check-off, 15s micro-adjust, per-exercise defaults, Dynamic-Island/
  Live Activity on completion).
- **Previous-session comparison inline:** "Last: 100kg × 5" under the
  exercise header; color-coded new-PR flags live during entry (Hevy).
- **Steppers over keypads** (Progression): tap-to-increment,
  long-press rapid scroll; weight + reps both.
- **Set labels** W/D/F (Boostcamp): warm-up rows excluded from volume/
  PR math; effort-tagged sets.
- **Exercise picker:** seeded lookup + search + recent/favorites +
  category tabs; mid-session swap carrying weights (Boostcamp);
  "Replace Exercise" + Recommend More/Less/Don't-Recommend-Again
  (Fitbod).
- **Plate calculator + warm-up generator** mid-session (Strong/JEFIT/
  Boostcamp) — warm-up ramp from working weight.
- **Pre-computed % weights** in-session (KeyLifts: "5x5 @ 65% TM").
- **Finish:** top-right, partial workouts OK; back-button-after-finish
  (Freeletics lesson — never a mid-exercise "finish" button).
- **Auto-assort paste** (locked M2) pairs with the stepper table.

### 9.2 Progress & vault surfaces
- **PR grid (FitNotes):** 1RM/2RM/3RM…nRM at a glance per exercise —
  the vault ladder presentation.
- **Sets-per-muscle-week chart (Hevy):** bar chart of weekly volume per
  muscle group — the MRV floor viz.
- **Volume heatmap anatomy chart (Boostcamp):** per-muscle density.
- **Filterable calendar (FitNotes):** "bench >80kg × ≥5" highlight
  queries.
- **Standards display (strengthlevel/Fitness Volt):** result card with
  percentile + Beginner→Elite label + star + bodyweight ratio; dual
  population tabs, always labeled with source + n; stat-finder
  interpolation ("where would your lift rank?").
- **Rate-vs-target bar (MacroFactor/Happy Scale):** weekly pace vs
  phase target; 30-day green/red banding; floats/sinkers dots.
- **Weekly report card (Boostcamp "Sunday report card"); Year in
  Review (Hevy).**

### 9.3 Milestone & celebration surfaces
- **Hero ring + % to next rung (Happy Scale):** milestone ladder with
  celebration states ("Milestone 6").
- **Forecast-to-date (Libra):** "reach 80kg on ~date, based on slope."
- **PR animation (Strong):** in-session banner; **post-session PR
  callout + benchmark sessions (NRC).**
- **Weekly recap (JEFIT):** "what changed and why" — trust pattern.

### 9.4 Coaching surfaces
- **Six-level check-in ladder (JuggernautAI):** pre-session readiness →
  intra-session → post-session → weekly → block → program; each level =
  distinct rule scope.
- **One-tap feedback (Freeletics):** segmented buttons, defaults pre-
  set to most-common answers, first-run education, 2 interactions max.
- **Pre-session adapt (Freeletics):** tired/short/no-equipment buttons
  that rewrite the session (Adapt button always present).
- **Readiness screen (JuggernautAI V3):** sliders answered BEFORE the
  workout loads; the plan visibly responds; 0–100 score with zones on
  the home hub.
- **Weekly coach message (Caliber):** fixed rhythm, template-driven;
  **show-your-work documentation (SBS).**

### 9.5 Body surfaces
- **Trend chart with raw points + EMA line (Libra/Happy Scale):** never
  hide the raw dots.
- **Physique compare (Metamorph/Progress):** ghost overlay, slider
  divider with date stamps, angle-grouped series, time-lapse export;
  on-device storage with app lock.
- **Eyes-Closed weigh-in (Withings):** hide the number, record it.
- **One-tap "+" weigh-in with tally-reveal (Happy Scale).**

### 9.6 Readiness surfaces
- **Readiness contributors (Oura/Garmin):** every low number explains
  itself (chronic − acute, colored).
- **Form band (Garmin):** prime/moderate/low + green tunnel — bands,
  not verdicts.
- **Muscle fatigue heatmap as readout AND input (Fitbod):** manual
  recovery override when the model disagrees.

### 9.7 Gamification surfaces
- **Streak flair, positive-only, opt-in (Zwift):** appears only on
  growth; mascot retreats "shyly" on break.
- **Perfect Week (Freeletics):** weekly plan-completion ring.
- **Skill tree (Calistree):** exercise graph with your position + next
  tier highlighted.
- **Achievement arcs visible from day one (NRC milestone ladder).**

---

## PART 10 — THE MASTER STEAL-LIST (90 items, tagged & efforted)

### A. Logging UX (M2 core)
1. [M2/L] Checkbox-complete set rows + auto rest timer (Strong/Hevy R01)
2. [M2/L] Inline previous-session comparison, color-coded, live PR flags (Hevy R01)
3. [M2/L] Stepper-based weight/reps entry, long-press scroll (Progression R01)
4. [M2/M] Plate calculator + warm-up set calculator (Strong/JEFIT R01)
5. [M2/L] Rest-timer 15s micro-adjust + per-exercise defaults (Hevy R01)
6. [M2/L] Live PR toast with animation (Strong R01)
7. [M2/L] Set labels warm-up/working/failure (Boostcamp R01)
8. [M2/M] Mid-session exercise swap carrying weights (Boostcamp R01)
9. [M2/L] Save-and-new / Log-All pre-fill (FitNotes R01)
10. [M2/M] Barbell plate counting (FitNotes R01)
11. [M2/M] Folder-organized templates (Strong R01)
12. [new/L] Metric↔imperial lossless conversion (Strong R01)
13. [M2/L] Pre-computed % target weights in-session (KeyLifts R01)

### B. Progressive overload & autoregulation (M2 engine)
14. [M2/M] Expected-vs-actual effort table (Prilepin → expected RPE; ≥2 → adjust e1RM) (Volt R02)
15. [M2/M] TM adjustment rules (+0.5%/rep beat, −1%/rep missed; RIR variants) (SBS R02)
16. [M2/M] MEV/MAV/MRV volume bands + decision table (RP R02/R03)
17. [M2/M] Auto double-progression (weight up, reps down at rep cap) (Progression R01)
18. [M2/M] AMRAP / Max-Effort-Day recalibration (Fitbod/SBS R02)
19. [M2/M] Inactivity decay (e1RM multiplier by days-since) (Fitbod R02)
20. [M2/M] PR reset to new baseline, history preserved (Boostcamp R01)
21. [M2/M] GZCLP stage-cascade stall rule (5x3→6x2→10x1) (R03)
22. [M2/L] Reactive deload rule (2–3 week stall → deload) (Liftosaur R03)
23. [M2/M] Return-from-break 10–20% suggested deload with slider (StrongLifts R03)
24. [M2/M] Fixed deload weeks + reactive markers hybrid (SBS/JuggernautAI R02)
25. [M2/M] Session difficulty rating (too easy/perfect/too hard) (Freeletics R02)
26. [M2/M] Per-muscle recovery % with manual override + heatmap (Fitbod R02)
27. [M2/M] Movement-pattern replacement (same-category alternatives) (Volt/Alpha R02)
28. [M2/L] Gym profiles / equipment presets (Fitbod/Alpha R02)
29. [M2/M] NSPI-style composite progress score (load + stimulus + balance) (JEFIT R01)
30. [M2/M] Movement-balance ratios (push/pull, squat/hinge) (JEFIT R01)
31. [M2/M] HSE hard-set-equivalent stimulus metric (JEFIT R01)
32. [M2/M] e1RM mean + spread display (7-formula) (Stronger calc R02)
33. [M2/M] Exercise preference learning from edits (Fitbod R02)
34. [M2/L] Every exercise MUST have a progression rule + failure/deload args (Liftosaur R03)

### C. Standards & vault (M2)
35. [M2/L] Population labeling on standards (gym vs competition) (Fitness Volt R03)
36. [M2/L] Bodyweight-multiple display computed from current BW (R03)
37. [M2/M] Ratio-derived standards for non-big-4 exercises (R03)
38. [M2/L] "Where does this lift rank?" interpolated percentile (stat-finder shape) (R03)
39. [M2/M] IPF DOTS Strength Score over big-5 (Boostcamp R01)
40. [M2/M] PR grid 1RM/2RM/3RM…nRM (FitNotes R01)
41. [M2/M] Filterable calendar highlights ("bench >80kg × ≥5") (FitNotes R01)
42. [M2/M] Sets-per-muscle-week chart + volume heatmap (Hevy/Boostcamp R01)
43. [M2/L] Source-stamp standards tables ("standard tables, 2026, ratio-derived") (R03)
44. [new/M] OpenPowerlifting public data as future empirical validation (R03)

### D. Body & physique (M2/M3)
45. [M2/M] Time-indexed EMA trend (Libra formula) (R04)
46. [M2/M] Trend/rate/prediction layering (Happy Scale) (R04)
47. [M2/L] Rate-vs-target weekly bar (bulk/cut pace) (MacroFactor/Happy Scale R04)
48. [M2/L] 30-day green/red banding + floats/sinkers dots (Happy Scale/Libra R04)
49. [M2/M] Milestone hero ring + % to next rung (Happy Scale R04)
50. [M2/L] Forecast-to-date ("reach 80kg on ~date") (Libra R04)
51. [M2/M] Goal-boundary photos at ladder rungs (MacroFactor R04)
52. [M2/L] "Confirmed by 2 consecutive weeks" celebration copy (R04 — differentiator)
53. [M2/M] Ghost-overlay + slider compare + angle grouping + time-lapse (Metamorph/Progress R04)
54. [M2/L] Eyes-Closed weigh-in mode (Withings R04)
55. [M2/L] One-tap weigh-in with tally-reveal (Happy Scale R04)
56. [M2/L] Tap-to-explain screens on every derived metric (MacroFactor R04)
57. [M2/L] Body-fat accuracy-ladder labeling (estimate; ±3–5pt; trend only) (R04)

### E. Recovery & readiness (coach)
58. [coach/M] CTL/ATL/TSB Training Form from logged sessions (TrainingPeaks R05)
59. [coach/M] Recovery-time estimate from last sessions (Garmin concept R05)
60. [coach/M] Ramp-rate guardrails (~8 units/week) as Coach alerts (R05)
61. [coach/L] Rest-day detection (F2 — pure calendar math) (R05 — already M2)
62. [coach/L] Deload as scheduled, positively-framed plan object (R05)
63. [coach/L] Planned-rest event auto-quiets nudges (R05 — already M2)
64. [coach/M] Optional self-reports (sleep/soreness/RPE) folding into Form (R05)
65. [coach/L] Honest labeling: "Training Form (from your logged training)" + contributors + bands (R05)
66. [coach/M] Six-level check-in ladder (JuggernautAI R02)
67. [coach/M] One-tap post-workout feedback (Freeletics R02)
68. [coach/M] Pre-session adapt affordance (Freeletics R02)
69. [coach/M] Weekly coach summary in fixed rhythm (Caliber R02)
70. [coach/L] Missed-workout tone: "noted, not intimidating" (Future R02)
71. [coach/L] Show-your-work: every Coach adjustment cites its rule (SBS R02)

### F. Gamification & streaks (fitness angle)
72. [M2/M] Weekly streak cadence + earned savers (NRC/Strava/Zwift R06)
73. [M2/M] Perfect Week / plan-completion streak (Freeletics R06)
74. [M2/M] Skill-tree progression ladder (Calistree R06)
75. [M2/M] Post-session PR callout + benchmark sessions (NRC R06)
76. [M2/M] Adherence + situation trophies, not volume trophies (Garmin R06)
77. [M2/L] Weekly-rolling comparison window (Calistree R06)
78. [M2/M] Adapt-buttons that remove failure (Freeletics R06)
79. [M2/L] Positive-only streak displays (Zwift flair R06)
80. [M2/M] Hardest-tier achievement arcs visible from day one (Trophy data R06)
81. [tree/M] 1.5×/2× BW + 100th-workout + tonnage milestone ceremony (R03 — open territory)

### G. Privacy & posture
82. [M0/L] No-account + CSV escape hatch (FitNotes R01)
83. [M0/L] "No confetti, no pop-ups, no IAP, no ads" posture (Workout Builder R01)
84. [M2/L] Photos never leave the device; only derived numbers could sync (Size Stream R04)
85. [M2/L] Strong-CSV as import/export interchange format (R01)

### H. Documented anti-patterns (never copy)
86. Hidden decision logic + more-is-more volume bias (RP) R02
87. Exponential level curves / level caps (Garmin/Zwift) R06
88. Daily-streak shaming + junk-activity incentives (Apple) R05
89. Cloud-mandatory operation + data hostage (Oura/Whoop) R05
90. Platform death risk (Google Fit/NRC China) R05
91. Body-fat % as hero metric (FitTrack +4.8pt) R04
92. AI touch-ups / fake-data visualization (Photo Compare lane) R04

---

## PART 11 — GAP ANALYSIS vs PersonalOS M2 (ranked by fit)

### 11.1 What PersonalOS has locked (M2)
Gym session logging (weight×reps, Epley 1–12, rep-mode no cap) · seeded
exercise lookup (~44, categories, muscle tags, big-5) · templates +
auto-assort paste · PR detection (strictly greater, once per session) ·
records vault (ladder, timeline, milestones, tonnage) · strength
standards (frozen tables, trophies at N/I/A) · deload markers · volume
floors (MRV-style) · plan adherence · phases (bulk/cut/maintain) ·
session comparison · post-deload return ramp (N2) · F2 rest-day
detection · body: first-of-day weigh-in, 7-day rolling, weight ladder +
2-week confirmation, physique timeline (D031) · N5 recovery deferred.

### 11.2 The gaps — Tier 1 (high fit, cheap, extends locked work)
1. **Inline previous-session comparison** (Hevy R01) — the #1
   progressive-overload UX; pure derived query, zero schema; the
   difference between "logging" and "training".
2. **Logging-screen anatomy** — checkbox-complete set rows + stepper
   input + rest timer should be BORN into M2, not retrofit
   (Strong/Hevy/FitNotes R01).
3. **Live PR toast + post-session PR callout** (Strong/NRC R01/R06) —
   ceremony for the locked once-per-session strict-greater rule; the
   delight moment is the point.
4. **Plate + warm-up calculators** (Strong/JEFIT R01) — the warm-up
   generator doubles as the return-ramp producer (feeds locked N2).
5. **Rest-timer micro-adjust + per-exercise defaults** (Hevy R01).
6. **Set labels warm-up/working/failure** (Boostcamp R01) — effort-
   tagged sets skip warm-ups in volume/PR math; same honesty discipline
   as the tombstone rule.
7. **Libra-style time-indexed EMA** (R04) — upgrade the locked 7-day
   rolling; gap-tolerant, no fabrication; directly replaces the naive
   window.
8. **Rate-vs-target weekly bar + floats/sinkers water-jump dots**
   (Happy Scale/Libra R04) — makes the locked pace + stall rules
   visible instead of hidden.
9. **Milestone hero ring + forecast-to-date + "confirmed by 2 weeks"
   copy** (Happy Scale/Libra R04) — the weight ladder's celebration
   layer; the 2-week rule is a differentiator, say it out loud.
10. **Eyes-Closed weigh-in + one-tap entry** (Withings/Happy Scale R04).
11. **Population labels + source stamps + bodyweight multiples on the
    standards vault** (R03) — honesty on the frozen tables; prevents
    "why is my bench 'Novice'?" friction.
12. **PR grid (1RM/2RM/3RM…nRM)** (FitNotes R01) — the vault ladder's
    presentation format.
13. **Weekly streak cadence + earned savers** (R06) — re-frame fitness
    grace as a weekly rhythm; daily streaks punish rest.
14. **Positive-only streak displays** (Zwift R06) — no broken-streak
    shame anywhere.

### 11.3 Gaps — Tier 2 (high value, more effort)
15. **MEV/MAV/MRV bands + adjustment decision table** (RP R02/R03) —
    make the locked MRV-style floors THE table with the
    1-short/2/hold/4-deload rules, prime-mover sets only, per-muscle.
16. **Expected-vs-actual effort table (Volt Smart Sets)** (R02) — the
    most precise no-ML autoregulation; needs an effort-input decision
    (set-level RPE/RIR vs session-difficulty-only — JuggernautAI's RPE
    honesty lesson says start coarse).
17. **TM adjustment rules (SBS)** (R02) — on top of Epley; +0.5%/rep
    beat, −1%/rep missed.
18. **Inactivity decay + PR reset-to-baseline** (Fitbod/Boostcamp R02/
    R01) — completes the post-deload return-ramp story (N2).
19. **GZCLP stage-cascade stall rule** (R03) — superior stall mechanic
    for weight-mode exercises (5x3→6x2→10x1, deload only after last
    stage).
20. **Sets-per-muscle-week chart + volume heatmap** (Hevy/Boostcamp
    R01) — the floor viz; makes volume-balance checks visible.
21. **Movement-balance ratios** (JEFIT R01) — push/pull, squat/hinge
    from muscle tags; cheap, surfaces imbalance before injury.
22. **One-tap post-workout feedback + six-level check-in ladder**
    (Freeletics/JuggernautAI R02) — the Coach's data intake; decide
    which ladder levels ship (start: post-session + weekly).
23. **Pre-session adapt affordance** (Freeletics R02) — tired/short/
    no-equipment buttons that rewrite the session; keeps adherence
    honest.
24. **Weekly coach summary in fixed rhythm** (Caliber R02) —
    template-driven "coach's message", no LLM.
25. **Training Form (CTL/ATL/TSB) — revive N5** (TrainingPeaks R05) —
    chronic − acute load from logged sessions; ramp-rate guardrails;
    labeled "training only"; the honest no-wearable readiness.
26. **Skill-tree progression ladder** (Calistree R06) — rep-mode
    exercises get "path to next tier" automatically.
27. **Adherence + situation trophies** (Garmin R06) — early bird, night
    owl, 30-day Goal-Getter; anti-farm by design, zero volume
    incentive.
28. **Filterable calendar highlights** (FitNotes R01) — "when did I
    last hit this?"
29. **Gym profiles / equipment presets** (Fitbod/Alpha R02).
30. **NSPI-style composite progress score** (JEFIT R01) — ties
    standards + volume + balance into one derived stat; meta-score
    decision (does the user want one number?).
31. **Movement-pattern replacement** (Volt/Alpha R02) — same-category
    alternatives from muscle tags.
32. **Strength Score (IPF DOTS) over big-5** (Boostcamp R01) — a
    normalized number alongside the standards tables.

### 11.4 Explicit no-goes (documented, with evidence)
- RPE/RIR-based autoregulation if effort isn't logged honestly
  (JuggernautAI volume-overshoot lesson, R02) — decide one coarse
  signal first; RPE as a field is fine, autoregulation-on-RPE is the
  risk.
- Body-fat % as hero metric; consumer BIA/3D numbers as truth
  (FitTrack +4.8pt, R04) — label estimate or omit.
- Cloud-mandatory wearables integration (Whoop/Oura patterns, R05) —
  N5 stays hardware-free; future wearable import = separate decision.
- Social features (Strava clubs/segments, R05/R06) — private substitute
  only (the named Coach).
- XP for logging in any form (validated: Freeletics 60M no-XP model,
  R06).
- AI touch-ups / prediction tools that degrade body image (R04).
- Hidden algorithm logic — show your work or don't ship it (RP
  anti-pattern, R02).
- Daily-streak shaming, junk-activity incentives, exponential level
  curves (Apple/Garmin/Zwift, R05/R06).

---

## PART 12 — DECISION-READY CANDIDATES for TEMP-PLANNING (F-series)

Same pipeline format as the journaling C-series (legend-compliant:
`- F-XX NAME (STATUS):` + labeled chunks). Full detail for the top
batch; the rest land in triage. Every candidate respects: no XP for
logging · facts-only Coach · one notification/day · quiet week wins ·
isImported excluded · no new deps without DecisionLog · offline-first ·
show-your-work · no shame · photos never leave the device.

**F-01 INLINE PREVIOUS-SESSION COMPARISON** · `[M2]` · L
- SOURCE: Hevy (R01 §Hevy); also Strong, Progression.
- PROBLEM: logging without context is data entry; logging with context
  is training. The #1 progressive-overload driver is seeing last time.
- PROPOSAL: during M2 logging, each set row shows last session's
  weight/reps ("Last: 100kg × 5"); a new PR vs last time flags live
  with color. Pure derived query over session history; zero schema.
- CONSTRAINTS: derived-only; PR flag uses the locked strict-greater +
  once-per-session rule.
- LANDS: Roadmap M2 (logging screen); UIUX.md (logging screen anatomy).

**F-02 LOGGING-SCREEN ANATOMY (checkbox rows + steppers + rest timer)**
· `[M2]` · M
- SOURCE: Strong/Hevy/FitNotes (R01).
- PROBLEM: the M2 logging screen is being designed now — it must be
  born with the market-settled anatomy, not retrofit.
- PROPOSAL: exercise card (drag-handle) + set table (set # | weight |
  reps | circular checkmark) + "+ Add Set" + swipe-delete + auto rest
  timer (15s micro-adjust, per-exercise defaults) + stepper input with
  long-press scroll + Finish top-right (partial workouts OK).
- CONSTRAINTS: set labels (warm-up/working/failure) integrate from the
  start so volume/PR math can skip warm-ups.
- LANDS: Roadmap M2; UIUX.md; Database.md (set labels column decision).

**F-03 LIVE PR TOAST + POST-SESSION PR CALLOUT** · `[M2]` · L
- SOURCE: Strong (R01), NRC (R06).
- PROPOSAL: in-session PR banner (animation, name + new number + old);
  post-session summary highlights every PR hit; benchmark sessions
  scheduled pre-deload update PRs and feed standards.
- CONSTRAINTS: once-per-session strict-greater (locked); facts-only
  copy; celebration ≠ XP.
- LANDS: Roadmap M2; Gamification.md (PR milestones).

**F-04 PLATE + WARM-UP CALCULATORS** · `[M2]` · M
- SOURCE: Strong/JEFIT (R01).
- PROPOSAL: plate calculator (entered total → plates, kg/lb); warm-up
  generator (working weight → ramp sets) — the generator doubles as the
  locked N2 return-ramp producer.
- LANDS: Roadmap M2; UIUX.md (logging screen).

**F-05 SET LABELS WARM-UP/WORKING/FAILURE** · `[M2]` · L
- SOURCE: Boostcamp (R01).
- PROPOSAL: effort-tagged set rows; warm-ups excluded from volume/
  tonnage/PR math; failure sets not over-penalized in progression.
- CONSTRAINTS: same honesty discipline as the tombstone rule;
  tonnage = weight-mode working sets only (locked).
- LANDS: Database.md (set label); Roadmap M2.

**F-06 PR GRID (1RM/2RM/3RM…nRM)** · `[M2]` · M
- SOURCE: FitNotes (R01).
- PROPOSAL: the records-vault ladder renders as a multi-rep PR grid per
  exercise — the cleanest presentation of the locked vault concept.
- LANDS: Roadmap M2 (records vault); UIUX.md (vault).

**F-07 FILTERABLE CALENDAR HIGHLIGHTS** · `[M2]` · M
- SOURCE: FitNotes (R01).
- PROPOSAL: calendar queries ("bench >80kg × ≥5") answering "when did I
  last hit this?"; derived-only.
- LANDS: Roadmap M2; UIUX.md (calendar — shares M6 calendar).

**F-08 MEV/MAV/MRV VOLUME BANDS + DECISION TABLE** · `[M2]` · M
- SOURCE: RP (R02/R03); Israetel landmarks.
- PROPOSAL: make the locked MRV-style floors THE table: per-muscle
  MEV/MAV/MRV numbers (experience-adjusted), prime-mover sets only,
  with the decision table (1 short → +2–3 sets; 2 → +1; hold; 4 →
  deload) surfaced by the Coach weekly.
- CONSTRAINTS: show-your-work (Coach cites the band + rule);
  phases adjust bands (cut runs lower — locked).
- LANDS: Roadmap M2 (volume-balance); CoachSystem.md (rule).

**F-09 EXPECTED-VS-ACTUAL EFFORT TABLE** · `[M2]` · M
- SOURCE: Volt Smart Sets (R02).
- PROPOSAL: Prilepin-style lookup (load% × reps → expected RPE); when
  actual deviates ≥2, adjust the e1RM; the most precise no-ML
  autoregulation.
- OPEN: effort-input decision — set-level RPE/RIR field (risky,
  JuggernautAI honesty lesson) vs session-difficulty-only (coarse,
  Freeletics). Recommend: start coarse, add RPE field later.
- LANDS: Roadmap M2 (engine); CoachSystem.md.

**F-10 TM ADJUSTMENT RULES ON EPLEY** · `[M2]` · M
- SOURCE: SBS (R02).
- PROPOSAL: +0.5%/rep beat, −1%/rep missed (RTF); RIR variants;
  overwarm single recalibration — on top of the locked Epley estimator.
- LANDS: Roadmap M2 (engine).

**F-11 INACTIVITY DECAY + PR RESET-TO-BASELINE** · `[M2]` · M
- SOURCE: Fitbod (R02), Boostcamp (R01).
- PROPOSAL: days-since e1RM multiplier (time off lowers starting
  loads); post-deload PR reset to a reachable baseline with history
  preserved — completes the locked N2 return ramp.
- LANDS: Roadmap M2 (N2); CoachSystem.md.

**F-12 GZCLP STAGE-CASCADE STALL RULE** · `[M2]` · M
- SOURCE: GZCLP (R03).
- PROPOSAL: on failure: denser scheme at same weight (5x3→6x2→10x1),
  deload only after the last stage — the strongest stall mechanic,
  better than a plain 3-fail→−10%.
- LANDS: Roadmap M2 (progression engine).

**F-13 LIBRA EMA TREND + TREND/RATE/PREDICTION LAYERS** · `[M2]` · M
- SOURCE: Libra/Happy Scale (R04).
- PROPOSAL: replace the naive 7-entry window with the time-indexed EMA
  (`power = 1 − e^(−Δt/7d)`); expose trend ≠ rate ≠ prediction as
  separate derived numbers; gap-tolerant by construction; no
  fabrication (thin-week rule computes nothing, trend tolerates gaps).
- LANDS: Roadmap M2 (body); Database.md (derived owners); DecisionLog.

**F-14 RATE-VS-TARGET BAR + WATER-JUMP DOTS** · `[M2]` · L
- SOURCE: Happy Scale/Libra (R04).
- PROPOSAL: weekly pace bar vs phase target rate (bulk/cut); 30-day
  banding + floats/sinkers dots so water jumps and plateaus read
  honestly; makes the locked pace/stall rules visible.
- LANDS: Roadmap M2 (body); UIUX.md.

**F-15 MILESTONE HERO RING + FORECAST + 2-WEEK COPY** · `[M2]` · M
- SOURCE: Happy Scale/Libra/MacroFactor (R04).
- PROPOSAL: weight-ladder milestones as hero rings with % to next rung;
  forecast-to-date ("reach 80kg on ~date"); goal-boundary photos;
  celebration copy states "confirmed by 2 consecutive weeks" (the
  differentiator — no one else is this strict).
- LANDS: Roadmap M2; Gamification.md (weight ladder); MediaStorage.md
  (boundary photos).

**F-16 EYES-CLOSED + ONE-TAP WEIGH-IN** · `[M2]` · L
- SOURCE: Withings/Happy Scale (R04).
- PROPOSAL: hide-the-number mode (record without seeing, anti-anxiety)
  + one-tap entry with tally-reveal; canonical first-of-day prompt.
- LANDS: Roadmap M2 (body); UIUX.md.

**F-17 STANDARDS VAULT HONESTY (population labels + BW multiples +
source stamps)** · `[M2]` · L
- SOURCE: Fitness Volt/strengthlevel/Lift Vault (R03).
- PROPOSAL: frozen tables labeled "modeled/gym-style standards, 2026,
  ratio-derived"; results shown as bodyweight-multiples computed from
  current BW; "where does this rank?" interpolation; ratio-derived
  extension for non-big-4 exercises.
- CONSTRAINTS: tables themselves stay frozen (locked) — this is
  presentation + labeling only.
- LANDS: Roadmap M2 (vault); Gamification.md (standards trophies).

**F-18 STRENGTH SCORE (IPF DOTS) OVER BIG-5** · `[M2]` · M
- SOURCE: Boostcamp (R01).
- PROPOSAL: a normalized Strength Score from the big-5 + DOTS (public
  formula), rendered beside the standards tables.
- OPEN: do we want one meta-number? (ties to F-30 decision).
- LANDS: Roadmap M2 (vault); DecisionLog.

**F-19 TRAINING FORM (CTL/ATL/TSB) — REVIVE N5** · `[coach]` · M
- SOURCE: TrainingPeaks (R05).
- PROPOSAL: revive the deferred N5 honestly: session load from logged
  volume × intensity; acute 7-day vs chronic 28–42-day exponential
  averages; Form = chronic − acute; presented as "Training Form (from
  your logged training)" with contributors + bands; disclaimer that
  sleep/life stress aren't measured; optional self-reports fold in.
- CONSTRAINTS: no wearable dependency; no cloud; label honestly; Coach
  default silence; quiet week wins.
- LANDS: CoachSystem.md (rule book); Roadmap M2 (N5 revival);
  DecisionLog.

**F-20 RAMP-RATE GUARDRAILS + RECOVERY-TIME ESTIMATE** · `[coach]` · M
- SOURCE: TrainingPeaks/Garmin (R05).
- PROPOSAL: Coach alerts on volume spikes ("don't increase chronic load
  more than ~8 units/week"); recovery-time estimate from last-session
  magnitude.
- LANDS: CoachSystem.md; Roadmap M2.

**F-21 SIX-LEVEL CHECK-IN LADDER** · `[coach]` · M
- SOURCE: JuggernautAI (R02).
- PROPOSAL: pre-session → intra-session → post-session → weekly →
  block → program; each level = separate rule scope; start with
  post-session + weekly.
- LANDS: CoachSystem.md (rule book session).

**F-22 ONE-TAP POST-WORKOUT FEEDBACK** · `[coach]` · L
- SOURCE: Freeletics case study (R02).
- PROPOSAL: segmented buttons, defaults pre-set to most-common answers,
  first-run education, 2 interactions max; the Coach's data intake.
- LANDS: CoachSystem.md; UIUX.md.

**F-23 PRE-SESSION ADAPT AFFORDANCE** · `[M2]` · M
- SOURCE: Freeletics (R02).
- PROPOSAL: tired/short/no-equipment buttons that rewrite the session
  (lighter/swap/scale) — keeps adherence honest, removes failure.
- LANDS: Roadmap M2; CoachSystem.md.

**F-24 WEEKLY COACH SUMMARY IN FIXED RHYTHM** · `[coach]` · L
- SOURCE: Caliber (R02).
- PROPOSAL: template-driven "coach's message" each week (review →
  adjust → next-week goals); no LLM; rides the existing weekly check-in
  surface (A4 merge).
- LANDS: CoachSystem.md; UIUX.md (weekly surface).

**F-25 WEEKLY STREAKS + EARNED SAVERS (grace v2 fitness)** · `[M2]` · M
- SOURCE: NRC/Strava/Zwift (R06).
- PROPOSAL: fitness streaks = weekly plan completion (Mon–Sun);
  savers earned at 12-week marks (max 2); rule-based restore (log
  within 48h); no daily pressure; positive-only displays.
- CONSTRAINTS: distinct from journal grace; quiet week wins;
  anti-farm gates.
- LANDS: Gamification.md (grace); Roadmap M7.

**F-26 SKILL-TREE PROGRESSION LADDER** · `[M2]` · M
- SOURCE: Calistree (R06).
- PROPOSAL: rep-mode exercises get explicit progression edges
  (incline → full → weighted) + your position from clean reps + "path
  to X" + next tier surfaced automatically.
- LANDS: Roadmap M2 (rep-mode); Gamification.md.

**F-27 ADHERENCE + SITUATION TROPHIES** · `[M2]` · M
- SOURCE: Garmin (R06).
- PROPOSAL: Goal-Getter-style adherence badges (3/7/30/60-day) +
  circumstance trophies (early bird, night owl) — zero volume
  incentive, anti-farm by design.
- CONSTRAINTS: joins the v2 achievement catalog (additive; catalog
  stays canonical — Gamification.md relationship map).
- LANDS: Gamification.md; v2 catalog (THE WHAT — new entries go
  through the layer map).

**F-28 SETS-PER-MUSCLE-WEEK CHART + VOLUME HEATMAP** · `[M2]` · M
- SOURCE: Hevy/Boostcamp (R01).
- PROPOSAL: the locked volume-balance feature gets its viz: weekly bars
  per muscle vs floor/ceiling + density heatmap.
- LANDS: Roadmap M2; UIUX.md.

**F-29 MOVEMENT-BALANCE RATIOS** · `[M2]` · M
- SOURCE: JEFIT (R01).
- PROPOSAL: push/pull + squat/hinge ratios from muscle tags; surfaces
  imbalance before injury; Coach line potential.
- LANDS: Roadmap M2; CoachSystem.md.

**F-30 NSPI-STYLE COMPOSITE PROGRESS SCORE** · `[M2]` · M — META
- SOURCE: JEFIT (R01).
- PROPOSAL: one derived progress number (load + volume + balance
  engines) tying standards + floors + deloads together.
- OPEN (user pick): meta-score yes/no — related to F-18; two
  meta-numbers would be one too many.
- LANDS: DecisionLog; Roadmap M2.

**F-31 GYM PROFILES / EQUIPMENT PRESETS** · `[M2]` · M
- SOURCE: Fitbod/Alpha (R02).
- PROPOSAL: switchable equipment presets (home/hotel/commercial) that
  reshape exercise suggestions; cheap, high-value for adherence.
- LANDS: Roadmap M2; Database.md (settings).

**F-32 MOVEMENT-PATTERN REPLACEMENT** · `[M2]` · M
- SOURCE: Volt/Alpha (R02).
- PROPOSAL: same-category alternatives from the seeded muscle tags
  (single query) — mid-session swap + Coach suggestions.
- LANDS: Roadmap M2; CoachSystem.md.

---

## PART 13 — LANDING MAP (where each candidate drafts)

| Candidate group | TEMP-PLANNING section | Docs landing | Decision |
|---|---|---|---|
| F-01…F-07, F-28, F-29, F-31, F-32 | Incorporate list (LOCKED batch) | Roadmap M2; UIUX.md (logging/vault); Database.md (set labels) | D082+ |
| F-08…F-12 (engine rules) | Incorporate list (LOCKED batch) | Roadmap M2 (engine); CoachSystem.md (rules) | D082+ |
| F-13…F-16 (body) | Incorporate list (LOCKED batch) | Roadmap M2/M3; MediaStorage.md (physique); Database.md (trend owners) | D082+ |
| F-17, F-18 (standards) | Incorporate list | Gamification.md (standards trophies); Roadmap M2 | D082+ |
| F-19…F-24 (coach) | Coach map + Incorporate | CoachSystem.md (rule book session) | rule-book session + D082+ |
| F-25…F-27 (gamification) | Incorporate list | Gamification.md (streaks/grace); v2 catalog (layer map) | D082+ |
| F-30 (meta-score) | Pole decision | DecisionLog | needs user pick |
| Anti-patterns | Recorded no-goes | CoachSystem.md + Gamification.md citations | docs pass |

**Cross-cutting constraints every candidate must respect:** no XP for
trophies/logging · anti-farm gates · isImported excluded · quiet week
silences ALL nudges · facts-only until the M2+ text opt-in · no new
dependencies without DecisionLog + user approval · local-first/offline
never degraded · one notification/day max · no shame language · show-
your-work on every derived metric · photos never leave the device ·
population-labeled standards.

---

## PART 14 — REFERENCE INDEX

**Deep-dive reports** (per-app detail + inline source URLs):
| Report | Size | Apps |
|---|---|---|
| `research-fitness/01-gym-loggers.md` | 60 KB | Strong, Hevy, JEFIT, FitNotes, Progression, Boostcamp, PTC, KeyLifts, Workout Builder |
| `research-fitness/02-adaptive-coaching.md` | 83 KB | Fitbod, Future, Freeletics, Volt, Caliber, Aaptiv, JuggernautAI, SBS, Alpha, RP + 20-item steal list + comparison table |
| `research-fitness/03-strength-standards.md` | 79 KB | StrongLifts, 5/3/1, Liftosaur, GZCLP, RP, Alpha, Symmetric Strength, OpenPowerlifting, standards sites + canonical stall/deload rules |
| `research-fitness/04-body-composition.md` | 70 KB | MacroFactor, Happy Scale, Libra, MeThreeSixty, ZOZOFIT, Withings, FitTrack, BodySpace, photo cluster, 3D scanners + EMA formula + accuracy ladder |
| `research-fitness/05-recovery-wearables.md` | 67 KB | Whoop, Oura, Garmin, Apple Fitness, Google/Samsung, Strava, NRC, TrainingPeaks |
| `research-fitness/06-bodyweight-gamified.md` | 62 KB | Calistree, Madbarz, Freeletics, NRC, Zwift, Runna, Garmin, Strava |

**Mobbin data** (`research-fitness/mobbin-*.json`): Hevy (295 screens),
Fitbod (216), MacroFactor (402), NRC (325), Strava (709),
workout-family (946); query helper `research-fitness/mobbin-query.mjs`.

**PersonalOS docs referenced:** `docs/Roadmap.md` (M2/M3 scope,
records vault, standards, N2, F2, N5, D031) · `docs/Database.md`
(schema: set labels, derived owners) · `docs/MediaStorage.md` (physique
photos) · `docs/Gamification.md` (standards trophies, weight ladder,
grace, XP policy, v2 layer map) · `docs/CoachSystem.md` (rule catalog,
nudges, strictness) · `docs/DecisionLog.md` (D082+; new decisions) ·
`docs/UIUX.md` (logging screen, vault, calendar) ·
`TEMP-PLANNING.md` (gen-2 Incorporate list + F-series triage).

*Research compiled Aug 2026. Prices/features as of that date; verify
current terms before build decisions. All sources cited inline in the
six deep-dive reports. Research only — no code written.*