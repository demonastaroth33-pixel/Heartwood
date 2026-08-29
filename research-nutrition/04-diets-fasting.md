# Diet-Specific, Fasting & Metabolic-Health Apps — Research Report

Research for **PersonalOS** nutrition scope (M3): per-meal receipt-line logging
(kcal/protein/carbs/fat), TDEE-derived targets with signed rate (bulk +0.25–0.5
kg/wk / cut −0.5), protein g/kg per phase (cut 2.0 / bulk 1.8 / maintain 1.6,
editable), fat floor ~0.6 g/kg, carbs as remainder, macro-gap bar, weekly
nutrition check-up with one Coach line per strictness, quiet meal reminders (no
push), zero-XP logging streak; training phases (bulk/cut/maintain) and a
rule-based Coach (facts-only, no shame, one notification/day, quiet week wins).
Constraints: offline-first, privacy-first, no XP for logging.

Cluster researched: Carb Manager, Lifesum, MyNetDiary, Zero, Fastic, Levels
Health, Signos, Nutrisense, WeightWatchers (WW), the "Glucose Goddess"
continuous-glucose-insights angle, and the "diet mode" preset pattern across
macro trackers. All 2026-state; sources cited inline.

---

## Carb Manager (keto/low-carb macro tracker)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: the default keto/low-carb calorie + macro tracker for nearly a
  decade; "built from the ground up for keto," net carbs are the core feature
  rather than an afterthought (https://www.caloriescanai.com/blog/carb-manager-keto-app-review,
  https://www.intakenutrition.io/blog/15-best-apps-for-tracking-net-carbs-on-keto-in-2026).
- Pricing: free tier (ad-supported) + Premium ~$59.99/yr — pricier than Lose It!
  ($39.99) and Cronometer ($54.95) (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).
- Food database: 3M+ foods with net carbs and sugar alcohols; heavy keto-niche
  coverage (bone broths, MCT oils, fat bombs, low-carb branded products)
  (https://apps.apple.com/us/app/carb-manager-keto-macro-log/id410089731,
  https://www.caloriescanai.com/blog/carb-manager-keto-app-review).
- Evidence-base: not a research-backed "method"; it is a tracking tool. Its
  value claim is that ketosis demands precise carb accounting — users who track
  consistently stay within ~5% of carb target vs 30–50% error when estimating
  (source is MyNetDiary's keto marketing, quoted below, but the same argument
  underwrites Carb Manager's entire pitch).
- 2026 status: still "the keto app to beat" but niche is shrinking — general
  trackers added net-carbs, AI-first photo loggers eat market share; UI is
  widely described as dated/cluttered (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).
  Rated 4.7/5 (22K ratings) on the AU App Store (https://apps.apple.com/au/app/carb-manager-keto-macro-log/id410089731?platform=iphone&see-all=reviews).

### 2. Core paradigm
- Optimizes **ketosis** → the primary metric is **net carbs** (total carbs −
  fiber − variable sugar alcohols), computed and displayed by default, no
  configuration (https://www.caloriescanai.com/blog/carb-manager-keto-app-review,
  https://www.intakenutrition.io/blog/15-best-apps-for-tracking-net-carbs-on-keto-in-2026).
- This changes logging: net carbs are a first-class dashboard number; fiber
  accuracy matters more than in general trackers; the food search flags
  keto-friendly items; high-fat macro splits are the norm (fat often set high,
  protein moderate, carbs capped).
- Adds keto-specific tracking: electrolytes (sodium/potassium/magnesium) shown
  by default with keto-appropriate targets (3,000–5,000 mg sodium), ketone
  logging (blood/urine/breath) with native graphs, and glucose logging for
  low-carb diabetics (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).

### 3. Simplification model
- The core simplification: **one number (net carbs) replaces calorie+macro
  juggling for keto eaters.** The dashboard leads with net carb count; "see net
  carbs left" is the entire feedback loop (https://www.intakenutrition.io/blog/15-best-apps-for-tracking-net-carbs-on-keto-in-2026).
- Tradeoffs made: overspecified for keto — "if you're keto sometimes and
  not-keto other times, Carb Manager feels overspecified"; keto framing is
  everywhere (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).
- What's worth stealing for a plain macro app: **"remaining budget at a glance"
  as the headline number**; the automatic net-carbs subtraction (which PersonalOS
  should treat as an optional display mode, not a whole diet); curated
  keto-staple tagging in food search; default electrolyte targets (relevant to a
  cut phase with the fat floor — sodium/potassium naturally drop when carbs are
  cut).

### 4. Glucose/CGM angle
- Carb Manager logs **blood/urine/breath ketones and glucose** as manual
  readings integrated into the daily view alongside food — useful clinically for
  low-carb diabetics (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).
- It is manual-entry, not CGM-connected; no continuous-glucose analytics.

### 5. Fasting
- No fasting-window engine; fasting is out of scope (it's a keto tracker). Its
  absence is instructive: a phase-based macro app that does fasting needs a
  separate window/timer concept, not just food logging.

### 6. Diet-preset UX
- Single-diet identity (keto). You pick keto; you don't switch diets. This is
  the opposite of the "diet mode" pattern — and the review critiques it: "if
  you're keto sometimes and not-keto other times… the keto framing is
  everywhere" (https://www.caloriescanai.com/blog/carb-manager-keto-app-review).

### 7. GUI layout
- Dashboard leads with the **net-carb count** and remaining carb budget; macros
  (fat/protein/carbs), electrolytes, calories around it; food diary by meal;
  ketone/glucose graphs. Reviewers describe it as "functional but cluttered,"
  "hiding tools in submenus," heavy ad placement on free tier (https://www.caloriescanai.com/blog/carb-manager-keto-app-review,
  https://apps.apple.com/gr/app/carb-manager-keto-macro-log/id410089731). The
  2021 redesign moved analysis/benchmark tools into submenus — a cautionary
  example of feature-burial breaking a "simple" product (App Store review,
  https://apps.apple.com/gr/app/carb-manager-keto-macro-log/id410089731).

### 8. Differentiators & steal-worthy features
Differentiators: net carbs done right without config; default electrolytes;
keto-specific database; ketone logging; 10,000+ pre-macro'd keto recipes.
Steal-worthy for a phase-based macro app:
1. **Net-carbs-as-default display** — as an optional mode, "total − fiber (−
   sugar alcohols)" is one stored formula; cheap and satisfies keto-phase users.
2. **Remaining-budget-is-the-headline** — the "net carbs left" loop maps 1:1 to
   PersonalOS's macro-gap bar.
3. **Pre-computed macros on recipes/meals** — "don't math your way through
   recipes"; PersonalOS's per-meal receipt-line templates should carry macros.
4. **Phase-appropriate electrolyte defaults** — during a cut, surface sodium/
   potassium/magnesium targets alongside the macro-gap bar.

---

## Lifesum (diet-plan macro tracker)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: the design-first, "diet plan in an app" tracker — Swedish (Stockholm,
  founded 2012), 65M users; "most people don't want a blank calorie ledger, they
  want a plan" (https://www.bentobunny.app/reviews/lifesum-review,
  https://calorie-trackers.com/reviews/lifesum/, https://home-cooks.co.uk/pages/review-lifesum).
- Pricing: free tier (calorie logging + barcode only); Premium $44.99–$99.99/yr
  (regional pricing experiments; list often $99.99, promos $44.99); quarterly
  $21.99–29.99 (https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c).
- Evidence-base: not itself studied; cites a 2025 Nutrition Reviews umbrella
  finding that digital diet-tracking improves outcomes via self-monitoring
  (Abeltino et al., 2025, https://pubmed.ncbi.nlm.nih.gov/38722240/). Rated
  4.6/5 across ~149K aggregated reviews (https://justuseapp.com/en/app/286906691/lifesum-diet-macro-tracker/reviews).

### 2. Core paradigm
- Optimizes **adherence to a named diet plan**, not a single macro identity.
  Its differentiator: 50+ evidence-informed diet programs (keto, Mediterranean,
  high-protein, 5:2/6:1 intermittent fasting, vegan, clean eating, Scandinavian,
  climatarian) each with daily meal templates drawn from its recipe library,
  shopping lists, and step-by-step prep (https://best-nutrition-apps.com/reviews/lifesum/,
  https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c,
  https://justuseapp.com/en/app/286906691/lifesum-diet-macro-tracker/reviews).
- How it changes logging: you log within a plan; meal ratings/feedback per meal;
  macro breakdowns and custom macro targets are Premium-gated (https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c).
  "Life Score" test personalizes recommendations.

### 3. Simplification model
- Simplification = **the plan does the meal-decision work.** A named plan with
  meal suggestions "converts an abstract budget into decisions" (https://www.bentobunny.app/reviews/lifesum-review).
- Tradeoffs: free tier is thin; diet-specific features are Premium-gated;
  database accuracy/reliability complaints (duplicate entries, US-centric
  measurements, inconsistent barcode results) — UK Trustpilot: "You can have
  three entries for the same food but different calorie counts so I don't trust
  it" (https://home-cooks.co.uk/pages/review-lifesum).
- Worth stealing: **the "named plan = meal templates + grocery list" bundle.**
  PersonalOS's phase (bulk/cut/maintain) is exactly a "named plan" — attach
  editable meal templates and (optionally) a shopping list to a phase, not just
  macro numbers.

### 4. Glucose/CGM angle
- None — no CGM/glucose features. Its fasting plans pair windows with meal
  suggestions but don't measure glucose.

### 5. Fasting
- Intermittent-fasting plans: 16:8 morning/evening, 14:10, 5:2 (fast 2 days),
  6:1 (fast 1 day) with meal suggestions inside windows (https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c,
  https://justuseapp.com/en/app/286906691/lifesum-diet-macro-tracker/reviews).
  Fasting is one plan among many, not a system-wide state.

### 6. Diet-preset UX
- **Strongest example of the diet-switch pattern in this cluster.** Switch the
  plan → the app re-derives meal templates, recipes, and targets for the new
  diet. Custom macro targets sit behind Premium; preset macro distributions are
  the free-ish path (https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c,
  https://nutrola.app/en/blog/diet-app-comparison-chart-2026). Dietary-support
  nuance: "There is a meaningful difference between an app that has a dedicated
  'Keto Mode'… versus an app where you can manually set your carbs to 20g and
  figure out the rest yourself" (https://nutrola.app/en/blog/diet-app-comparison-chart-2026).

### 7. GUI layout
- Consistently rated the best-looking tracker UI: "warm, encouraging, far less
  spreadsheet-like"; meals rated as you log; visual summaries and charts for
  motivation; clean dashboard. Data-visualization is a praised motivator
  (https://www.bentobunny.app/reviews/lifesum-review,
  https://calorie-trackers.com/reviews/lifesum/,
  https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c).

### 8. Differentiators & steal-worthy features
Differentiators: plan-variety + design + grocery-list generation + Life Score.
Steal-worthy:
1. **Plan = templates + targets bundle** (bulk/cut/maintain should each carry
   meal templates and a grocery list, not just macros).
2. **Rate meals as you log** — light-touch per-meal feedback (maps to PersonalOS
   weekly check-up, but per-meal is quieter).
3. **Grocery list from plan** — cheap if templates are structured; high perceived
   value.
4. **"Plan" as an identity that re-derives everything** — the diet-switch flow
   (see §6) is the model for phase-switch re-derivation.

---

## MyNetDiary (diet-preset macro tracker)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: long-established, full-featured tracker with verified (non-
  crowdsourced) food database; broad health coverage incl. diabetes/GLP-1 tools;
  32M+ users; dietitian-built (RDN team) (https://www.mynetdiary.com/,
  https://www.mynetdiary.com/keto-diet.html,
  https://www.intakenutrition.io/blog/mynetdiary-vs-macrofactor-which-nutrition-tracker-fits-serious-goals-in-2026).
- Pricing: generous free tier (barcode, macro tracking, shopping list, voice
  logging, no ads); Premium $59.99/yr; Premium Plus adds AI Coach/Meal Scan/
  Menu Scan (https://www.mynetdiary.com/keto-diet.html,
  https://www.mynetdiary.com/premium.html).
- Evidence-base: claims a January 2026 controlled test (127 identical food
  entries) where MyNetDiary took 711 actions vs 1,003 Cronometer / 1,035
  MyFitnessPal — i.e., up to 46% less logging effort — plus a self-published
  "Diet App Scorecard" (https://www.mynetdiary.com/). Database built on USDA/NCC
  sources, reviewed 2,500–3,500 foods/day; 2,165,000 foods / 108 nutrients in
  keto mode (https://www.mynetdiary.com/keto-diet.html).

### 2. Core paradigm
- Optimizes **accurate multi-diet tracking** with presets: "MyNetDiary Premium
  lets you select from preset macro distributions for popular eating plans
  (low-carb, keto, low-fat, and more). Choose one… under Diet Tools > My Diet"
  (https://www.mynetdiary.com/macronutrient-tracker.html).
- Changes logging: in keto mode, net carbs replace calories "on every screen";
  keto dashboard shows net carbs/protein/calories; "Keto Food Grade" flags
  better keto choices instantly; ketone logging (blood/urine/breath) with charts
  (https://www.mynetdiary.com/keto-diet.html).

### 3. Simplification model
- Simplification = **"the math invisible"**: log a meal, see net carbs in real
  time, know remaining budget before eating. Explicitly framed against the
  30–50% estimation error on keto (https://www.mynetdiary.com/keto-diet.html).
- Tradeoffs: preset macro distributions still require Premium; custom macro
  targets Premium-only. Free version tracks 11 nutrients vs 108 premium.
- Worth stealing: **the "set two macro targets, third fills the gap" model**:
  "You can even fix two macro targets (e.g., protein and fat), which allows the
  third macronutrient (carbohydrates) to flex and fill the gaps" — this is
  *exactly* PersonalOS's design (protein g/kg fixed, fat floor fixed, carbs as
  remainder). Steal the explicit UX framing: allow fixing any two of three.
  (https://www.mynetdiary.com/macronutrient-tracker.html)

### 4. Glucose/CGM angle
- Manual blood-glucose logging, ketone logging; no CGM integration. AI Meal Scan
  + AI Menu Scan (premium) give restaurant/smart-swap suggestions
  (https://www.mynetdiary.com/keto-diet.html, https://www.mynetdiary.com/).

### 5. Fasting
- No fasting-window engine; "fasting" appears only as an IF-style plan concept
  in competitors. Not a fasting app.

### 6. Diet-preset UX
- **The clearest "preset distributions" implementation in a general tracker.**
  Diet Tools > My Diet → pick preset (low-carb/keto/low-fat); or set fixed gram
  targets; or **Macro Cycling** — "set custom targets for each day… under
  'Cycling' in My Weight Goal & Plan" (carb-cycling); plus **Exercise Macros** —
  a different macro split for exercise calories added to the budget
  (https://www.mynetdiary.com/macronutrient-tracker.html).
- Switch flow is a settings change, not a re-planning ceremony: presets re-derive
  the split from your existing calorie budget; fixed grams lock targets that
  don't shift when budget changes (https://www.mynetdiary.com/macronutrient-tracker.html).

### 7. GUI layout
- Customizable dashboard; keto dashboard shows net carbs + macros at a glance;
  food log by meal with per-meal macro info; "remaining budget before you eat"
  visible during logging; reports/drill-downs praised as "kill every other app"
  (https://www.mynetdiary.com/keto-diet.html,
  https://www.mynetdiary.com/macronutrient-tracker.html).

### 8. Differentiators & steal-worthy features
Differentiators: verified curated database, speed of logging, preset diets +
macro cycling, GLP-1 companion, dietitian-built content.
Steal-worthy:
1. **Fix-two-flex-third macro targeting** — the exact PersonalOS model, with a
   proven UX pattern to copy (My Weight Goal & Plan > Macros).
2. **Diet presets under one "My Diet" screen** — phase presets (cut/bulk/
   maintain) belong in one re-derivation screen.
3. **Macro Cycling** — per-day targets; useful if a user wants training-day vs
   rest-day splits within a phase.
4. **Exercise Macros** — a separate split for exercise calories; relevant to
   gym-focused PersonalOS (workout-day carb bump).
5. **"Remaining budget before you eat" inline during logging** — maps to the
   macro-gap bar at log time, not just on the dashboard.

---

## Zero (fasting timer + food tracker)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: "the #1 fasting & protein app"; world's most popular IF tracker;
  featured in Women's Health, Fortune, Men's Health, JRE; Elon Musk mention
  (https://zerolongevity.com/, https://home-cooks.co.uk/pages/review-zero,
  https://play.google.com/store/apps/details?id=com.zerofasting.zero&hl=en).
- Pricing: free tier is genuinely functional (timer, zones, streaks, journal,
  mood); Zero Plus ~$69.99–$70/yr (US) / ~£55 (UK) after a 2024 switch from free
  to paid that generated backlash (https://healthfitpublishing.com/is-zero-fasting-app-worth-it-2026-pricing-features,
  https://home-cooks.co.uk/pages/review-zero).
- Evidence-base: not a clinical program; the app's fasting-zones educational
  layer is the "science" (ketosis/autophagy timelines). IF itself has a solid
  evidence base (e.g., dropout 38% on alternate-day fasting vs 29% on daily
  calorie restriction; Vasim et al. 2022 https://pmc.ncbi.nlm.nih.gov/articles/PMC8839325/,
  cited via https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5).
  Rated 4.8/5, 445K ratings (https://apps.apple.com/us/app/zero-fasting-food-tracker/id1168348542).

### 2. Core paradigm
- Optimizes **fasting-window consistency** — "start a fast with a single tap and
  track your progress in real time with a timer designed to keep you focused"
  (https://zerolongevity.com/). Explicitly markets "no counting calories or
  dieting" (https://play.google.com/store/apps/details?id=com.zerofasting.zero&hl=en).
- How it changes logging: the day is organized around the fast, not meals.
  Premium adds food logging with **protein front and center** via a personal
  "Protein Score" — "balances your daily calorie needs with the ideal amount of
  protein… one clear number" (https://zerolongevity.com/,
  https://mwm.ai/apps/zero-fasting-food-tracker/1168348542). Meal logging by
  photo ("Snap it") returns macros (e.g., "54g protein / 443 cal") overlaid on
  the image (https://mwm.ai/apps/zero-fasting-food-tracker/1168348542).

### 3. Simplification model
- Simplification: **the timer replaces the log.** "No food scales. No macro
  math. No logging fatigue" (https://zerolongevity.com/). The eating window is
  deliberately untracked — the famous critique: Zero "tracks only the fasting
  window and stays completely silent on the eating window, which is where most
  of the metabolic action happens" (https://theunhacked.com/zero-fasting-app-review-intermittent-fasting-tracker/).
- Tradeoffs: food/protein tracking is basic vs dedicated trackers; premium is
  widely felt overpriced for "a fancy timer" (Fortune 3.5/5: "limited support
  for calorie and macronutrient tracking") (https://home-cooks.co.uk/pages/review-zero).
- Worth stealing: **window as a state, not a plan** — the eating/fasting window
  is a first-class object with start/end/reminders, and food logging is scoped
  *inside* the eating window. For PersonalOS: make fasting an optional overlay
  state that constrains when meal reminders fire and when receipt-lines are
  expected (quiet reminders inside eating windows only).

### 4. Glucose/CGM angle
- Zero's Premium content covers glucose-aware fasting education; users can log
  glucose manually. No CGM integration. The fasting zones are the closest thing
  to "glucose insight" (fed/fasting/ketosis/autophagy stages) — used purely as
  motivation, not measurement.

### 5. Fasting
- **Best-in-class window tracking in this cluster.** Circular progress ring
  ("dynamic circular timer displaying TOTAL FAT BURN duration"), clearly
  labeled fast presets ("16:8 Fast", "20:4 Fast"), count-up *or* count-down
  mode (users who count down "want to eat as soon as it hits 0:00"; count-up
  makes fasts extendable), one-off custom fasts without saving presets, pause/
  resume, Apple Watch app (https://mwm.ai/apps/zero-fasting-food-tracker/1168348542,
  https://apps.apple.com/us/app/zero-fasting-food-tracker/id1168348542,
  https://home-cooks.co.uk/pages/review-zero). Protocols: 16:8, circadian (13h),
  18:6, 20:4, OMAD (23:1), custom up to 7 days. Streaks, badges, mood journal,
  mood graphing; syncs Apple Health/Google Fit (https://home-cooks.co.uk/pages/review-zero,
  https://play.google.com/store/apps/details?id=com.zerofasting.zero&hl=en).
- **Interplay with macros:** protein target adapts to weight/goals; meals logged
  count toward the Protein Score during the eating window (https://zerolongevity.com/).
  This is the "fasting window as phase-like state" that PersonalOS can borrow:
  the phase (cut/bulk/maintain) sets protein g/kg; the window sets *when* the
  app expects logs.

### 6. Diet-preset UX
- Diet-agnostic: "reach your healthy weight goals no matter what diet you
  follow — from keto or low carb to paleo" (https://play.google.com/store/apps/details?id=com.zerofasting.zero&hl=en).
  Fasting presets (not diet presets) are the switchable thing.

### 7. GUI layout
- Home = the **fasting ring/timer**: circular progress ring showing elapsed time
  + "TOTAL FAT BURN"; preset fast buttons below; tap-to-end. Fasting-zone
  visualization shows metabolic stage. Separate protein gauge ("Personalized
  Protein Score" on a gauge), water progress bar ("80 oz toward 120 oz"),
  habit grid, challenges, streak counters. User reviews confirm the count-up/
  down ring and presets as the core interaction (https://mwm.ai/apps/zero-fasting-food-tracker/1168348542,
  https://apps.apple.com/us/app/zero-fasting-food-tracker/id1168348542,
  https://home-cooks.co.uk/pages/review-zero).

### 8. Differentiators & steal-worthy features
Differentiators: ring timer UX, fasting zones, streaks/badges, protein-first
food logging, journal/mood graphing, strong free tier.
Steal-worthy:
1. **Circular progress ring as the headline "state" widget** — a ring is the
   natural metaphor for PersonalOS's weekly phase target or today's macro-gap
   (filled vs remaining), and for any fasting overlay.
2. **Window-scoped logging + quiet reminders** — food logging expected *inside*
   the eating window; reminders fire only then. Direct fit for "quiet meal
   reminders (no push)."
3. **Count-up-or-down timer choice** — small UX liberty that materially changes
   behavior (extension vs quitting at zero). Reusable in a "fasting window"
   overlay.
4. **One clear number ("Protein Score")** — reduces macro fatigue to a single
   target; relevant to PersonalOS's protein-g-per-kg being the fixed anchor.
5. **Streaks on binary-ish states** — fasting streaks work because a fast is
   binary; PersonalOS's zero-XP logging streak is the same pattern.

---

## Fastic (fasting-first + food tracker)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: German-built IF app, very large user base (12.5M+ downloads),
  centered on a fasting timer that "visualises the metabolic phases of a fast,
  and nudges you through the hungry hours"; around that core: water, steps,
  education (Fastic Academy), challenges, fasting buddies, and increasingly food
  logging with an AI photo scanner (https://www.bentobunny.app/reviews/fastic-review,
  https://mwm.ai/apps/fastic-weight-loss-fasting/1459260306).
- Pricing: free tier (timer, water/steps, limited food logging); **Fastic Plus
  up to $79.99/yr**, with 10 concurrent US SKUs from $12.99–$79.99 and frequent
  promos (some paid $24/yr); aggressive paywall placement criticized
  (https://nutriscan.app/blog/posts/fastic-pricing-2026-free-vs-plus-trial-refund-e13d2834f0,
  https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5,
  https://marlvel.ai/apps/fastic-weight-loss-fasting).
- Evidence-base: no primary studies; "Protein Fasting mode backed by clinical
  research" (higher-protein IF for muscle retention) is the closest claim
  (https://www.dietright.ai/tools/fastic/, https://nutriscan.app/blog/posts/fastic-pricing-2026-free-vs-plus-trial-refund-e13d2834f0).
  Store rating 4.2–4.5/5 across ~421K Google Play reviews; polarized (aggressive
  paywall/ads/billing complaints) (https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5,
  https://mwm.ai/apps/fastic-weight-loss-fasting/1459260306).

### 2. Core paradigm
- Optimizes **fasting-window consistency + motivation** — "the fasting window is
  the product, and food tracking is the supporting act" (https://www.bentobunny.app/reviews/fastic-review).
  Adds a **Fastic Score** blending fasting/hydration/sleep metrics and a body-
  status tracker (https://www.dietright.ai/tools/fastic/).
- Changes logging: food logging exists but is shallow ("the database is thinner,
  the logging flow is slower, the AI scanner sits behind Plus"); calorie/macro
  depth is limited (https://www.bentobunny.app/reviews/fastic-review).

### 3. Simplification model
- Simplification: **phase visualization makes a 16-hour fast feel like progress
  rather than deprivation** — the timer + body-stage view carries the motivation
  so logging can stay light. Streak mechanics suit fasting because "a fast is
  binary in a way a diet isn't" (https://www.bentobunny.app/reviews/fastic-review).
- Tradeoffs: finite course library = "engagement you spend down" (vs an
  adaptive coach); paywall hides the sticky features; social feed (Fasting
  Buddies) had moderation problems (https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5).
- Worth stealing: **binary-state streaks** (fast complete/missed) — the clean
  pattern behind PersonalOS's zero-XP logging streak; and **"phases as
  visualization"** — showing metabolic stage during a fast is the same trick as
  showing "cutting phase day 12/84" progress.

### 4. Glucose/CGM angle
- None. Its "body status" is the fasting-phase timeline (fed → fat-burning →
  ketosis → deep ketosis), estimated by time, not measured (https://www.bentobunny.app/reviews/fastic-review,
  https://mwm.ai/apps/fastic-weight-loss-fasting/1459260306).

### 5. Fasting
- Protocols: 16:8, 18:6, OMAD and more; timer with **body-stage visualization**
  ("shows what your body is doing at each phase of a fast"); reminders through
  the hungry hours; water + step tracking; stats on fasting streaks, weight
  trend, habits (https://www.bentobunny.app/reviews/fastic-review,
  https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5).
  **Protein Fasting** pairs high-protein recipes with fasting for muscle-sparing
  fat loss (https://www.dietright.ai/tools/fastic/).

### 6. Diet-preset UX
- Diet-agnostic fasting; meal/recipe content is fasting-schedule-tailored
  (4,500+ recipes "tailored to your fasting schedule") rather than macro-
  diet-preset (https://nutriscan.app/blog/posts/fastic-pricing-2026-free-vs-plus-trial-refund-e13d2834f0).

### 7. GUI layout
- Timer-first home with phase visualization; body-status tracker showing
  metabolic stage; Fastic Score gauge; water/step progress; courses/challenges
  tabs; AI food scanner entry (Plus). Reviews emphasize the clear timer and
  phase view as the appeal, and ad/paywall density as the pain
  (https://www.bentobunny.app/reviews/fastic-review,
  https://mwm.ai/apps/fastic-weight-loss-fasting/1459260306,
  https://nutriscan.app/blog/posts/best-fastic-alternatives-2026-fasting-apps-courses-0a855ec7a5).

### 8. Differentiators & steal-worthy features
Differentiators: body-stage visualization, Academy courses, challenges/buddies
social, Protein Fasting mode, Fastic Score.
Steal-worthy:
1. **Body-stage / phase visualization** — narrate *why* the current phase matters
   (cut = muscle-sparing protein, bulk = surplus) with a progress timeline; a
   Coach line can sit on top of a phase visualization, facts-only.
2. **Binary streaks** — fast/didn't; same shape as PersonalOS's zero-XP logging
   streak (no XP, just continuity).
3. **"Score" as a composite** — a Fastic-style single score (fasting+hydration+
   sleep) is a candidate for the weekly check-up summary; caution: PersonalOS's
   facts-only Coach should avoid gamer-y scores unless it's a quiet, private one.
4. **Hunger-hour nudges** — timed gentle reminders during the hard part of a
   fast; maps to "quiet meal reminders (no push)."

---

## Levels Health (CGM + food logging, self-directed)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: the reference "learn from your own glucose" platform; CGM +
  labs + app. Memberships: Classic (glucose only, self-guided) $24/mo ($288/yr);
  Core (2 lab panels, clinician review 2×/yr, AI insights) $41/mo ($499/yr);
  Complete (2 comprehensive labs, 2 mo CGM, nutritionist session, concierge)
  $167/mo ($1,999/yr) (https://www.levels.com/how-it-works,
  https://www.levels.com/). Uses FreeStyle Libre sensors; integrates Oura, Whoop,
  Garmin, Apple Health (https://glucoseforge.com/nutrisense-review).
- Evidence-base: runs its own "Levels Glucose and Lifestyle Data Patterns in the
  General Population Study" (https://apps.apple.com/us/app/levels-metabolic-health/id1481511675);
  publishes guides citing CGM cohorts (e.g., 8,315 non-diabetic Israeli adults,
  mean morning fasting glucose 96.2 ± 12.87 mg/dL) (https://www.levels.com/blog/what-should-my-glucose-levels-be-ultimate-guide).
  The broader CGM-in-non-diabetics evidence is nuanced (see CGM section below).

### 2. Core paradigm
- Optimizes **glucose stability**, measured via a **stability score** and Time-
  in-Range; food logging exists to *explain* the glucose curve — "CGM shows what
  happened, food logs explain why" (https://www.levels.com/blog/food-logging-missing-link-cgm-care).
- Changes logging: meals get logged with photo or natural language AND get a
  **meal score** ("This meal scored 8/10. Your glucose response was stable");
  meals overlay the glucose timeline for immediate cause-and-effect
  (https://www.levels.com/blog/food-logging-missing-link-cgm-care).

### 3. Simplification model
- Simplification: **one stability number replaces macro-optimization** — the
  user optimizes "was my glucose stable?" rather than hitting grams. Food
  logging becomes lightweight (photo/description) because the outcome metric is
  the glucose response, not the macro math (https://www.levels.com/blog/food-logging-missing-link-cgm-care).
- Tradeoffs: requires a CGM + subscription; without labs/CGM the app is a food
  diary. Self-directed = no coach, user must interpret.

### 4. Glucose/CGM angle
- The deepest food↔glucose UX in the cluster: meal timestamps + photos appear on
  the same timeline as the glucose response; practitioners get AI meal summaries
  ("high-protein breakfasts correlated with stable glucose; evening carb-heavy
  snacks drove spikes") (https://www.levels.com/blog/food-logging-missing-link-cgm-care).
- **Value without a CGM:** Levels' own framing — food order, protein-first
  breakfasts, post-meal movement — are behavioral levers learnable without a
  sensor (see Glucose Goddess section; the same evidence underlies both). A
  CGM-free PersonalOS can still surface "spike-mitigating" heuristics (fiber/
  protein first, vinegar, post-meal walk) as Coach facts.

### 5. Fasting
- Fasting (time-restricted eating) is a supported intervention in its library,
  evaluated *by its glucose effect* (fasting glucose trends, overnight pattern)
  rather than by a ring/timer (https://www.levels.com/blog/the-2024-levels-guide-to-metabolic-health-interventions).

### 6. Diet-preset UX
- No diet presets; the "diet" is whatever keeps your glucose stable — a
  metabolic outcome rather than a macro template (https://www.levels.com/).

### 7. GUI layout
- Glucose curve as the central graph (24-h trace); meals as markers/photos on
  the trace; stability score and time-in-range; AI insight cards; optional
  sleep/activity overlay. Reviewers: "app sophistication best in class" but a
  ​$288/yr entry cost and "self-directed" interpretation burden
  (https://glucoseforge.com/nutrisense-review,
  https://apps.apple.com/us/app/levels-metabolic-health/id1481511675).

### 8. Differentiators & steal-worthy features
Differentiators: meal-scored glucose timeline, stability score, labs + clinician
review, best-in-class data design.
Steal-worthy:
1. **Cause-and-effect overlay** — logs and outcomes on one timeline. For
  PersonalOS: overlay logged meals on the weekly phase target/gap chart so the
  user sees "which days' meals drove the gap."
2. **Per-meal score as feedback** — an 8/10 "stable" rating is a quiet, no-shame
  Coach-style signal; PersonalOS's per-meal receipt-line logging could carry a
  light "on-target" tag.
3. **Single stability-style summary number** — a dashboard-level "how close to
  phase targets this week" is the macro-app analogue of the stability score.

---

## Signos (CGM + AI weight-management, first FDA-cleared)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: first FDA-cleared AI-driven app + CGM for weight management/
  wellness; combines Dexcom Stelo OTC biosensor with an AI platform focused on
  weight loss and metabolism (https://www.signos.com/,
  https://www.bioworld.com/articles/723195-signos-adds-ai-to-cgm-to-drive-weight-loss?v=preview,
  https://www.facebook.com/signoshealth/).
- Pricing: membership ~$127/mo with hardware included (marketed against "doing
  it on your own" $800+/mo); CGM included; RD support included
  (https://www.signos.com/, https://www.signos.com/plans).
- Evidence-base: FDA clearance via an 786-participant trial showing statistically
  significant mean weight loss 5.2% body weight / 12 weeks vs 1.8% control
  (https://www.glucoseintel.com/services/). Cites Ehrhardt & Al Zaghal (2020,
  Clin Diabetes) that 87% of CGM users change food choices based on glucose
  feedback; ~90% say CGM helps healthier lifestyle (https://www.signos.com/).
  86% of members report success in their 1st month (marketing metric)
  (https://www.signos.com/). FDA approval Aug 2025 (CNBC) (https://www.signos.com/).

### 2. Core paradigm
- Optimizes **glucose stability for weight loss** — "Signos uses your body's
  most important metabolic signal, glucose, to help you achieve and maintain
  real results" (https://www.signos.com/). Sensor reads every 5 min, syncs to
  phone every 15 min (https://www.signos.com/plans).
- Changes logging: meals, movement, weight logged; when a food spikes glucose,
  the app suggests "the right type and intensity of movement (based on your
  history) to bring it back down" — i.e., **reactive, activity-first guidance**
  rather than macro targets (https://www.signos.com/).

### 3. Simplification model
- Simplification: **turn simple daily decisions into predictable progress** —
  the AI converts glucose data into concrete prompts (eat X, walk Y) so users
  never compute macros. Signos markets this as replacing a $800+/mo stack of
  devices/apps/dietitians with one membership (https://www.signos.com/).
- Tradeoffs: hardware + subscription lock-in; not for macro precision; the
  "spike = bad" framing is where the clinical evidence is weakest (see CGM
  section).

### 4. Glucose/CGM angle
- Direct CGM insight: glucose is the only signal that matters for its guidance;
  predicts food/movement responses from "hundreds of millions of data points";
  syncs Apple Health, Google Health Connect, smartwatches, smart scales
  (https://www.signos.com/). Running a 20,000-participant 3-yr IRB study
  (NCT05121844) estimated to complete fall 2026 (https://www.signos.com/blog/cgms-for-weight-loss).

### 5. Fasting
- Fasting education present; not the core mechanic. No fasting-ring UI
  described; glucose control is the lever.

### 6. Diet-preset UX
- No macro diet presets; diet guidance emerges from glucose responses + AI
  prompts (https://www.signos.com/).

### 7. GUI layout
- Glucose trace as the primary visual (spike visualization with meals); current
  glucose value + trend; meal/movement logs; weight trend; actionable prompt
  cards ("walk now to flatten this spike"). Screenshots show the spike graph and
  "glucose + weight" dashboard (https://www.signos.com/).

### 8. Differentiators & steal-worthy features
Differentiators: first FDA-cleared AI+CGM, proactive movement prompts, bundled
RD support.
Steal-worthy:
1. **Prompt-not-lecture guidance** — concrete, immediate suggestions ("this
   meal spiked you; walk for 10 min") — the behavioral shape of PersonalOS's
   one-per-day Coach line (facts-only, actionable, no shame).
2. **"Stable glucose = success" as a quiet win** — a flat glucose day is
   celebrated; analogous to PersonalOS's "quiet week wins."
3. **Hardware/sensor abstraction** — the app treats glucose as a pluggable
   signal; PersonalOS can treat a fasting window or phase similarly (optional
   overlay, not required).

---

## Nutrisense (CGM + 1:1 dietitian coaching)

### 1. Overview: positioning, pricing, evidence-base
- Positioning: the only CGM subscription pairing glucose sensors with **registered
  dietitian coaching**; "guided CGM platform" vs Levels' self-directed
  (https://glucoseforge.com/nutrisense-review,
  https://www.bettervitals.com/product/nutrisense).
- Pricing: 12-month $2,700 ($225/mo); 6-month $149–152/mo; 3-month $178–179/mo;
  1-month $212–215/mo; Dexcom Stelo (15-day wear, reads every 5 min); includes
  1:1 RD + "Nora AI" insights (https://optimizebiomarkers.com/cgm-providers/nutrisense,
  https://healthrx.com/brands-nutrisense/pricing-analysis).
- Evidence-base: no head-to-head trial of coaching model vs self-directed CGM
  published as of May 2026; app analytics/scoring not FDA-reviewed (sensors are)
  (https://healthrx.com/brands-nutrisense/pricing-analysis). Positions itself
  for prediabetics/metabolically at-risk (https://healthrx.com/brands-nutrisense/pricing-analysis).

### 2. Core paradigm
- Optimizes **glucose stability via guided interpretation** — the RD layer
  accelerates insight discovery; 1-on-1 coaching (in-app messaging/video) +
  AI (Nora) for users new to glucose monitoring (https://www.bettervitals.com/product/nutrisense,
  https://optimizebiomarkers.com/cgm-providers/nutrisense,
  https://www.glucoseintel.com/services/).
- Changes logging: food logs feed RD interpretation; meal scoring/analysis;
  integrates Apple Health, Fitbit, Oura, Google Fit, Garmin
  (https://optimizebiomarkers.com/cgm-providers/nutrisense).

### 3. Simplification model
- Simplification: **expert interprets the data so the user doesn't have to** —
  the value is the human/AI explanation layer on top of a confusing trace; "the
  expert guidance layer accelerates insight discovery" (https://www.bettervitals.com/product/nutrisense).
- Tradeoffs: highest cost tier ($150–$399/mo); analytics not clinically
  validated; complexity of two apps (sensor app + Nutrisense) (https://healthrx.com/brands-nutrisense/pricing-analysis).

### 4. Glucose/CGM angle
- Representative of the "glucose + coaching" tier: 24/7 interstitial readings,
  trend analysis over 7/14/30-day windows, meal scores, RD interpretation
  (https://www.glucoseintel.com/services/). Same evidence-base caveats as all
  non-diabetic CGM use (see next sections).

### 5. Fasting
- Fasting discussed as a coaching topic; no fasting-ring mechanic (https://www.nutrisense.io/blog/best-cgm-programs).

### 6. Diet-preset UX
- No diet presets; RD guidance is personalized per user (https://www.nutrisense.io/products/cgm-plans).

### 7. GUI layout
- Glucose curve + meal markers; daily glucose score/trend; RD chat thread;
  AI insight cards; wearable sync. Rated "good" app sophistication vs Levels'
  "best in class" (https://glucoseforge.com/nutrisense-review).

### 8. Differentiators & steal-worthy features
Differentiators: bundled RD coaching, Nora AI, prediabetes focus.
Steal-worthy:
1. **Human/AI interpretation layer** — a rule-based Coach (PersonalOS's model)
   is the offline, privacy-first analogue of Nutrisense's RD: turn raw logs into
   one explainable line, facts-only.
2. **"One line per week" cadence** — Nutrisense's RD interaction is high-touch
   but sparse; PersonalOS's weekly check-up with one Coach line per strictness
   is the same "interpret, don't nag" pattern.

---

## WeightWatchers (WW) — points system + zero-point foods

### 1. Overview: positioning, pricing, evidence-base
- Positioning: the original simplification of diet tracking; Points introduced
  1998 to "take complex nutritional data and turn it into a single, easy-to-
  understand number"; now a hybrid app + telehealth/GLP-1 clinic (https://prettysweet.com/weight-watchers-point-system/,
  https://www.houstonweightloss.com/blog/weight-watchers).
- Pricing: Digital ~$23/mo; Digital+Workshops ~$43/mo; coaching ~$40–50/mo;
  GLP-1 program separate; promos as low as $10/mo (https://www.mealift.app/blog/weight-watchers-app-review,
  https://nutrola.app/en/blog/is-weightwatchers-still-worth-it-2026,
  https://prettysweet.com/weight-watchers-point-system/).
- Evidence-base: the most-studied commercial weight program. WW group lost
  ~2.6 kg more than DIY at 12 months (JAMA Network Open, https://pmc.ncbi.nlm.nih.gov/articles/PMC9382439/,
  via https://www.justaveragejen.com/2026-guide-weightwatchers.html); ~3–5% body
  weight over 12 months among engaged users (https://www.mealift.app/blog/weight-watchers-app-review);
  WW cites a 6-mo RCT (n=376) showing 3.5× weight loss vs standard guidance
  (Palacios et al., AJCN 2025, https://www.weightwatchers.com/us/blog/what-are-points).

### 2. Core paradigm
- Optimizes **staying within a daily Points budget**, where Points are a single
  number computed from six factors: calories, saturated fat, and added sugar
  *increase* points; fibre, protein, and unsaturated fats *decrease* them
  (https://www.weightwatchers.com/au/how-it-works/points,
  https://www.mealift.app/blog/weight-watchers-app-review).
- Changes logging: **you count points, not calories or macros.** Each food shows
  a Points value; the day is budgeted (Daily Points + Weekly Points). ZeroPoint
  foods are **not logged at all** (see §3). Point budget = "~23–35 points/day
  for women, more for men," personalized by age/height/weight/sex/goals
  (https://prettysweet.com/weight-watchers-point-system/).

### 3. Simplification model (DEEP — the most valuable in this cluster)
- **The two-tier log: "track the few, ignore the many."** ZeroPoint foods
  (350+ in 2026: fruits, vegetables, eggs, fish/shellfish, lean meats incl.
  newly-added lean pork/beef and dark-meat poultry, beans/peas/lentils, corn/
  popcorn, oats, potatoes/starchy veg, yogurt/cottage cheese, tofu/tempeh)
  "don't need to be tracked or measured" (https://theholymess.com/weight-watchers-zero-point-foods-2025/,
  https://www.weightwatchers.com/us/how-it-works/zeropoint-foods,
  https://prettysweet.com/weight-watchers-zero-point-foods).
  The theory: you're unlikely to overeat plain chicken breast or steamed
  broccoli, so tracking them is wasted effort (https://www.mealift.app/blog/weight-watchers-app-review).
- **Tradeoffs made (critical to steal with eyes open):**
  - *ZeroPoint ≠ zero calories.* "A large banana is about 120 calories; a
    chicken breast is 165." Users who eat large quantities of ZeroPoint foods
    can exceed their calorie target while within points — WW acknowledges this
    and hasn't fully resolved it (https://www.mealift.app/blog/weight-watchers-app-review,
    https://theholymess.com/weight-watchers-zero-point-foods-2025/). WW's own
    framing: "these are zero points, not 'free' foods… meant to be eaten to
    satisfaction, not overeaten" (https://theholymess.com/weight-watchers-zero-point-foods-2025/).
  - *Nutritional literacy is hidden.* "The points system abstracts real
    nutritional data behind a proprietary number"; users never learn actual
    calories/macros, making transition to self-managed eating hard; WW only
    recently added a macros display at the bottom of My Day
    (https://nutrola.app/en/blog/is-weightwatchers-still-worth-it-2026,
    https://theholymess.com/weight-watchers-2025/).
  - *Proprietary lock-in.* Your food knowledge is tied to WW's platform
    (https://www.mealift.app/blog/weight-watchers-app-review).
- **What's worth stealing for a plain macro app:**
  1. **The "free foods" list = zero-point foods, adapted.** For PersonalOS, a
     user-editable **free-foods list** (e.g., water, black coffee, most non-
     starchy veg, sugar-free drinks — and optionally user-flagged "not worth
     logging" items) can drop logging burden without dropping macro integrity,
     *provided* the free list is small and calorie-trivial. The key safeguard WW
     missed: free lists must stay calorie-trivial, otherwise the macro-gap bar
     lies.
  2. **Daily + weekly budget with a rollover "cushion."** WW's Weekly Points
     (up to 4 unused daily points roll over; weeklies reset on weigh-in day)
     remove the "I failed today" spiral (https://www.weightwatchers.com/us/blog/what-are-points,
     https://prettysweet.com/weight-watchers-point-system/). A macro app can
     offer a weekly macro "cushion" (e.g., ±a few hundred kcal to spend on
     social days) without abandoning grams.
  3. **"Use the full budget, don't undereat" guidance.** WW actively tells
     members to hit their Daily budget, warning that undereating causes nutrient
     gaps/slower metabolism — anti-extremism coaching that aligns with
     PersonalOS's no-shame Coach (https://prettysweet.com/weight-watchers-point-system/).
  4. **No food is off-limits; it's a budget, not a ban.** "Can you eat anything
     on WW? Yes. No food is completely off-limits, but higher-Point foods use
     more of your daily budget" (https://prettysweet.com/weight-watchers-point-system/).
     This is the honest-simplification stance PersonalOS's facts-only Coach
     should mirror.

### 4. Glucose/CGM angle
- ZeroPoint selection is partly glucose-justified — "ZeroPoint foods… are less
  likely to impact your blood sugar levels" (US News, https://health.usnews.com/wellness/food/articles/breaking-down-the-weightwatchers-points-system).
  But WW has no CGM integration; the points formula itself is the glucose proxy.

### 5. Fasting
- No fasting engine in the Points program (fasting appears in the GLP-1 track's
  appetite-drop scenario). Points is time-agnostic.

### 6. Diet-preset UX
- **Diet variation is handled by ZeroPoint list variation, not macro presets.**
  PersonalPoints personalize the ZeroPoint list by user assessment; there are
  special lists (e.g., Menopause ZeroPoint list, Diabetic plan) — i.e., the
  *free-foods list* is the thing that changes per plan, not the macro split
  (https://www.weightwatchers.com/us/blog/zeropoint-foods-list,
  https://theholymess.com/weight-watchers-2025/). This is a distinct and clever
  pattern: **"switch the plan → swap the free-foods list."** For PersonalOS's
  diet-mode presets (low-carb/keto/paleo/Mediterranean as *optional* free-lists
  + macro overrides), this is the model.

### 7. GUI layout
- **My Day** is the hub: three headline numbers — **"Daily Used" (top right),
  "Daily Remaining" (middle), "Weekly Remaining" (top left)** — as tappable
  stats that drill into that day's per-meal log (https://www.weightwatchers.com/us/blog/how-smartpoints-work,
  https://www.facebook.com/groups/1102293830698807/posts/1970125127249002/).
  Users describe "rings" that close through the day (Apple-watch-style progress
  rings), plus fruit/veg serving counters (https://www.facebook.com/groups/1102293830698807/posts/1858787971716052/).
  Macros + recommended calories now appear at the bottom of My Day (2026)
  (https://theholymess.com/weight-watchers-2025/). Food diary organized by meal
  (breakfast/lunch/dinner/snacks); barcode scanner; recipes with per-serving
  Points; Connect social feed; weekly weigh-ins (https://www.mealift.app/blog/weight-watchers-app-review).
  Rollover notifications appear on My Day (https://www.weightwatchers.com/us/blog/understanding-your-smartpoints-budget).

### 8. Differentiators & steal-worthy features
Differentiators: Points abstraction, 350+ ZeroPoint foods, weekly flex + rollover,
community/workshops, GLP-1 program, unmatched clinical evidence base.
Steal-worthy (the 4–6 the brief asked for, with why):
1. **Zero-point / "free foods" list** — drops logging burden to near-zero for
   high-frequency staples; the single highest-value simplification in this
   cluster. Why: PersonalOS's per-receipt-line logging is friction-heavy; a
   small, user-editable, calorie-trivial free list preserves macro integrity
   while removing the "log my broccoli" tax. (https://www.weightwatchers.com/us/how-it-works/zeropoint-foods,
   https://www.mealift.app/blog/weight-watchers-app-review)
2. **Daily + weekly budget with rollover cushion** — eliminates all-or-nothing
   failure days; directly supports "no shame, no XP-punishment" philosophy.
   Why: matches the anti-extremism of PersonalOS's Coach. (https://www.weightwatchers.com/us/blog/what-are-points)
3. **"Fill the budget, don't starve" default guidance** — an opinionated, safe
   default that prevents undereating; a free Coach line with zero computation.
   Why: PersonalOS's facts-only Coach needs positive guardrails like this.
   (https://prettysweet.com/weight-watchers-point-system/)
4. **Plan = a different free-foods list (+ targets)** — diet switches re-derive
   which foods are free and which macros matter. Why: gives PersonalOS's phase
   system (cut/bulk/maintain) a visible "what changed" story on switch.
   (https://www.weightwatchers.com/us/blog/zeropoint-foods-list)
5. **Three-number heads-up display (used / remaining / weekly)** — tappable,
   at-a-glance, drills into the day. Why: a direct blueprint for the macro-gap
   bar + weekly check-up placement. (https://www.weightwatchers.com/us/blog/how-smartpoints-work)
6. **Honest-simplification stance: abstraction is a tradeoff, not a win.** WW's
   own documented failure (hidden nutrition, lock-in, zero-point overeating) is
   the cautionary counter-model: PersonalOS should never hide the underlying
   grams. Why: it validates the brief's "plain macro app with honesty."

---

## The "Glucose Goddess" continuous-glucose-insights angle (Jessie Inchauspé)

### 1. Overview: positioning, evidence-base
- Positioning: Jessie Inchauspé (biochemist; books *Glucose Revolution* 2022,
  *The Glucose Goddess Method*) popularized **behavioral hacks to blunt post-meal
  glucose spikes**, driven by her own CGM experiments; viral Instagram/TikTok
  following (https://www.mannahealth.ai/blog/glucose-goddess-method-jessie-inchauspe-hacks-review,
  https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence).
- Evidence-base (reviewed independently): three of the four headline hacks have
  genuine peer-reviewed support; the framing claim does not:
  - **Food order (veg/fiber first, carbs last):** strong — mixed meals with
    fiber/protein/fat blunt glucose response; Shukla et al. 2015 (*Diabetes
    Care*), and eating fiber+protein before carbs cuts postprandial spikes
    30–40% (https://www.mannahealth.ai/blog/glucose-goddess-method-jessie-inchauspe-hacks-review,
    https://healthcarediscovery.ai/continuous-glucose-monitors-metabolic-health-non-diabetic-research-2026).
  - **Post-meal walking:** strongest-supported — 10–15 min walk before/after
    the expected peak reduces glucose/insulin/C-peptide; contractions pull
    glucose into muscle via GLUT4; 20–30% spike reduction
    (https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence,
    https://healthcarediscovery.ai/continuous-glucose-monitors-metabolic-health-non-diabetic-research-2026).
  - **Savory/protein breakfast:** moderate — higher-protein breakfasts produce
    smaller, shorter excursions ("second-meal effect") (https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence).
  - **Vinegar before starchy meals:** moderate — acetic acid lowers postprandial
    glucose/insulin (meta-analysis https://pubmed.ncbi.nlm.nih.gov/28292654/),
    effect greatest on high-GI meals, modest magnitude, tooth-enamel/reflux
    caveats (https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence,
    https://www.mannahealth.ai/blog/glucose-goddess-method-jessie-inchauspe-hacks-review).
  - **"Spikes are inherently dangerous for healthy people":** NOT established —
    "the framing risk is pathologising normal glycemic variability"
    (https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence).

### 2–5. What the angle means for a macro app (no CGM required)
- **Value WITHOUT a CGM is real but modest:** the four hacks are behavioral and
  free — implementable by a rule-based Coach as facts (fiber/protein first,
  post-meal walk, protein breakfast, vinegar with high-GI meals). The CGM adds
  *personalization* (which foods spike *you*), not the existence of the levers.
  A 2–4-week CGM trial captures ~80% of long-term benefit; after that the data
  is repetitive (https://sugarminder.com/advice/continuous-glucose-monitors-non-diabetics-2026-wellness-trend).
- **Glycemic-index / -load heuristics are the CGM-free proxy:** GI/GL-per-serving
  can be attached to foods at log time (e.g., Swoodie's "estimated Glycemic
  Load next to a meal's calories and macros" — https://swoodie.app/blog/best-keto-low-carb-apps-2026).
  Weaknesses: individual response varies enormously (Weizmann 2015 *Cell*,
  n=800: a banana can spike one person 15 mg/dL and another 50 mg/dL), so GI is
  a population heuristic, not a personal truth (https://sugarminder.com/advice/continuous-glucose-monitors-non-diabetics-2026-wellness-trend).
- **Privacy concerns (matters for privacy-first PersonalOS):** consumer health
  apps + CGM manufacturers are generally **not HIPAA-covered entities**; glucose
  data to a manufacturer cloud or third-party wellness app can fall entirely
  outside HIPAA. FTC Health Breach Notification Rule (finalized 2024) partially
  fills the gap; WA My Health My Data Act (2023) adds a private right of action;
  actual fines exist (Italy fined a US company $45,000 in 2022). Anonymized data
  can be re-identified; users often lack opt-out controls
  (https://journals.sagepub.com/doi/10.1177/19322968261455365,
  https://www.vively.com.au/post/can-you-use-a-cgm-without-diabetes-everything-australians-need-to-know,
  https://www.techrepublic.com/article/news-otc-glucose-monitors-wearable-tech/).
  **Implication for PersonalOS:** any glucose data stays on-device; if a CGM
  integration is ever added (M5+), it must be a local import, never a cloud
  sync. Also note the clinical reality: physicians' consensus (2025 Mass General
  Brigham study; Jan 2026 Johns Hopkins, Elizabeth Selvin: "all the clinical
  information about how to interpret CGM is for people with diabetes") is that
  CGM adds little for metabolically healthy optimizers and can cause
  misinterpretation/orthorexia (~8% of non-diabetic CGM users developed mild
  orthorexic tendencies, 2023 *Eating Behaviors*)
  (https://topdoctormagazine.com/doctor/continuous-glucose-monitoring-non-diabetics,
  https://sugarminder.com/advice/continuous-glucose-monitors-non-diabetics-2026-wellness-trend).
- **Steal-worthy:** surface the four evidence-backed hacks as optional Coach
  facts (fiber-first plate order, post-meal walk, protein breakfast, vinegar) —
  but keep the Coach "facts-only, no shame": never pathologize a normal spike,
  and never show a user a "spike score" that implies danger. This is exactly the
  discipline the Glucose Goddess brand fails at (https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence).

---

## Diet-mode presets across macro trackers (cross-cutting)

### The pattern
- **What "diet mode" means:** a named preset (low-carb, keto, paleo,
  Mediterranean, high-protein, vegan) that re-derives macro targets, food
  filtering, and plan content from your existing calorie budget — vs "manually
  set carbs to 20g and figure out the rest" (https://nutrola.app/en/blog/diet-app-comparison-chart-2026).
  The distinction is the criterion used by reviewers to judge "real support"
  (https://nutrola.app/en/blog/diet-app-comparison-chart-2026).
- **Implementations in this cluster:**
  - MyNetDiary: preset distributions under Diet Tools > My Diet; fixed-gram
    targets; macro cycling (per-day); exercise macros (https://www.mynetdiary.com/macronutrient-tracker.html).
  - Lifesum/Yazio: diet = meal-plan + recipe + grocery-list bundle; targets
    re-derived around it; both Premium-gated (https://nutrola.app/en/blog/diet-app-comparison-chart-2026,
    https://www.bentobunny.app/reviews/lifesum-review).
  - Swoodie: "diet-style macros — you pick keto and it reshapes your protein,
    carb and fat targets to match, no manual maths"; keto caps carbs at 20–50 g
    and re-splits protein/fat around them; adds Glycemic Load estimate per meal
    (https://swoodie.app/blog/best-keto-low-carb-apps-2026).
  - MacroHero: "adaptive, net-carb-friendly macro goals that evolve with your
    progress and preferences" (https://macrohero.app/).
  - MacroFactor: **adaptive TDEE** — recalculates calorie/macro targets weekly
    from weight trend, the strongest "self-maintaining" mode; subscription-only
    (https://www.intakenutrition.io/blog/15-best-apps-for-tracking-net-carbs-on-keto-in-2026,
    https://www.fettle.fit/insights/macro-calculator-app-updates-targets-body-changes).
  - WW: the "diet" is a *different ZeroPoint free-foods list* + budget, not
    macro presets (https://www.weightwatchers.com/us/blog/zeropoint-foods-list).
- **Re-derivation mechanics worth stealing:** (1) presets express ratios/
  gram-rules against the *same* calorie engine, so a phase switch never orphans
  logged history (Nutrola's point about data continuity when switching diets:
  https://nutrola.app/en/blog/best-recipe-apps-specific-diets-keto-vegan-diabetic-2026);
  (2) "fix two, flex the third" targeting (MyNetDiary) is the cleanest
  re-derivation rule and matches PersonalOS exactly (protein fixed by g/kg, fat
  floor fixed, carbs = remainder); (3) weekly re-derivation only — avoid daily
  over-reaction to water/glycogen noise (https://www.fettle.fit/insights/macro-calculator-app-updates-targets-body-changes);
  (4) preset granularity matters: per-day cycling (training days) and per-phase
  (bulk/cut/maintain) are both "diet mode," just on different timescales.
- **Privacy angle for diet modes:** none of these presets need cloud data;
  PersonalOS's offline-first diet modes are strictly local, which is a genuine
  differentiator versus every app above (all sync/telemetry to vendor clouds —
  see Carb Manager's App Store privacy section listing linked health/location/
  usage data: https://apps.apple.com/us/app/carb-manager-keto-macro-log/id410089731).

---

## Synthesis: what to steal for a phase-based macro app (top picks)

1. **Free-foods list (WW ZeroPoint, adapted + safeguarded)** — small,
   user-editable, calorie-trivial "not worth logging" list; the biggest logging-
   friction win in the cluster; must stay trivial or the macro-gap bar lies
   (WW's documented failure mode) (https://www.weightwatchers.com/us/how-it-works/zeropoint-foods,
   https://www.mealift.app/blog/weight-watchers-app-review).
2. **Fix-two-flex-third targeting (MyNetDiary)** — protein g/kg fixed, fat floor
   fixed, carbs as remainder; also "fixed grams that don't shift when budget
   changes" and per-day cycling (https://www.mynetdiary.com/macronutrient-tracker.html).
3. **Fasting window as a phase-like state (Zero/Fastic)** — an optional overlay
   that scopes when meal reminders fire (eating window only) and when logs are
   expected; ring/timer + count-up-or-down; binary streaks with zero XP
   (https://theunhacked.com/zero-fasting-app-review-intermittent-fasting-tracker/,
   https://www.bentobunny.app/reviews/fastic-review).
4. **Diet-mode re-derivation of targets (Lifesum/Swoodie/MyNetDiary)** — phase
   switch re-derives targets + free-lists + templates from one calorie engine,
   never orphaning history; "named plan = templates + targets + grocery list"
   (https://www.bentobunny.app/reviews/lifesum-review,
   https://swoodie.app/blog/best-keto-low-carb-apps-2026,
   https://www.mynetdiary.com/macronutrient-tracker.html).
5. **Honest simplification (WW cautionary model + Glucose Goddess evidence
   review)** — never hide underlying grams behind an opaque number; budget-with-
   cushion ("no all-or-nothing days"); "use the full budget, don't undereat";
   facts-only, no shame, don't pathologize normal variability
   (https://nutrola.app/en/blog/is-weightwatchers-still-worth-it-2026,
   https://prettysweet.com/weight-watchers-point-system/,
   https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence).
6. **Per-meal outcome feedback (Levels/Signos)** — light "on-target" tag per
   receipt-line + cause-and-effect overlay (meals on the phase-target timeline),
   delivered as a quiet one-line Coach note, one per day max
   (https://www.levels.com/blog/food-logging-missing-link-cgm-care,
   https://www.signos.com/).
7. **CGM-free glucose heuristics** — optional GI/GL estimate per meal + the four
   evidence-backed behavioral facts (fiber/protein first, post-meal walk,
   protein breakfast, vinegar), strictly local; glucose data never leaves device
   (https://swoodie.app/blog/best-keto-low-carb-apps-2026,
   https://superpower.com/guides/emerging-health-topics/glucose-goddess-method-hacks-reviewed-evidence,
   https://journals.sagepub.com/doi/10.1177/19322968261455365).

---

*Research window: August 2026. Sources: ~60 primary links (official sites, App
Store listings, independent reviews, peer-reviewed citations) cited inline
above. Fasting/IF adherence caveat: apps are habit tools, not medical guidance;
IF dropout is protocol-dependent (38% ADF vs 29% CR; Vasim et al. 2022).*
