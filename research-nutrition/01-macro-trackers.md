# 01 — Macro Trackers & Calorie Counters: Deep Research Report

Research for **PersonalOS M3 nutrition scope** (per-meal receipt-line logging, TDEE = Mifflin-St Jeor + signed additive rate, protein g/kg per phase, portion multiplier, macro-gap bar, weekly check-up, quiet on-app-open nudges, no push, no XP, no photo-AI/fake-data lanes). Apps covered: **MyFitnessPal, Cronometer, Lose It!, MyNetDiary, Lifesum, FatSecret, Yazio, MacroFactor** (nutrition angle: food-logging UX + expenditure model).

Benchmark context used across the report (2026 validation studies): the DAI six-app validation study (DAI-VAL-2026-01, May 2026) measured weighed-reference MAPE — PlateLens ±0.9%, Cronometer ±5.2%, MacroFactor ±6.8%, Lose It! ±9.7%, Lifesum ±13.2%, Yazio ±15.1%, FatSecret ±16.8%, MyFitnessPal ±18% (photo path) / ±18.4% (manual). Sources: https://clinicalnutritionreport.com/reviews/macrofactor/ , https://nutrition-apps-ranked.com/en/reviews/fatsecret/ , https://nutrition-apps-ranked.com/en/reviews/lose-it/ . The DAI database-provenance audit (Feb 2026) scored median analytical/verified share: MyFitnessPal 40%, Cronometer 80%, MacroFactor 80%, Lose It! 60%: https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/ .

---

# MyFitnessPal (MFP)

## 1. Overview
- Positioning: the category incumbent — "database-breadth leader and the most-cited consumer calorie tracker in published behavioral weight-management RCTs"; launched 2005, acquired by Under Armour 2015 (trust eroded since). iOS + Android + full-parity web app. https://clinicalappreport.com/en/reviews/myfitnesspal/
- Pricing 2026: free ad-supported tier (diary, calories, database); Premium $19.99/mo or $79.99/yr (barcode scan, Meal Scan photo, Voice Log, custom macros, fasting tracker, ad-free); Premium+ $24.99/mo or $99.99/yr adds Meal Planner + grocery-list sync. Prices verified July 2026. https://www.weightlossrankings.org/reviews/myfitnesspal , https://clinicalnutritionreport.com/reviews/myfitnesspal/
- Popularity: largest tracker by user count; "users log more than 6,000 meals a minute"; database 14M–20.5M entries (claims vary; official tutorial says 19.2M). https://blog.myfitnesspal.com/meal-scan/ , https://best-nutrition-apps.com/reviews/myfitnesspal/
- Free-tier erosion is the 2026 story: barcode scanning (free for years) moved behind Premium; features once free now paywalled. https://www.fitness-tracking.com/reviews/myfitnesspal/ , https://www.weightlossrankings.org/reviews/myfitnesspal/

## 2. Core paradigm
- Search-and-log diary with meal slots (Breakfast/Lunch/Dinner/Snacks + customizable). Logging methods: text search, barcode scan (Premium), Meal Scan photo-AI (Premium, Passio-powered), Voice Log (Premium, added 2025 winter release), Quick Add calories/macros, saved Meals + Favorites, recipe importer (URL paste, Premium). https://support.myfitnesspal.com/hc/en-us/articles/360032622491-Quick-Log , https://blog.myfitnesspal.com/winter-release/ , https://blog.myfitnesspal.com/make-food-logging-effortless/
- "Meal Scan" evolution: originally snap-a-photo → now live hover-scan with Passio; works best for clearly visible single-ingredient plates; mixed/blended foods (soups, smoothies) officially recommended for Voice Log instead. Camera data is not saved/uploaded. https://blog.myfitnesspal.com/meal-scan/

## 3. Logging flow (deep)
- Fast path (search): Diary → blue "+" → pick meal → type food → results list with "+" on each row → tap "+" logs it instantly at current portion (Quick Log, app ≥22.5.0). Keep tapping to add more without leaving search. To change portion first: tap row → adjust → checkmark. https://support.myfitnesspal.com/hc/en-us/articles/360032622491-Quick-Log
- Fast path (barcode, Premium): "+" → Food → barcode icon → point camera → product resolves → confirm serving → checkmark. ~2 seconds for packaged foods; 94% hit rate in one 200-product test (second-highest tested). https://eathealthy365.com/myfitnesspals-log-it-button-explained-for-beginners/ , https://best-nutrition-apps.com/reviews/myfitnesspal/
- Quick Add: Diary → "Quick Tools" under a meal (web) or 3-dot menu / "Quick Add" action button under search (mobile) → enter calories only (free) or calories + fat/protein/carbs (Premium). No food name required — the "I don't know what it was" lane. https://support.myfitnesspal.com/hc/en-us/articles/360032621971-What-is-Quick-Add
- Portion handling: two fields — "Serving Size" (choose unit: g, oz, cup, tbsp, "1 medium", etc.) and "Number of Servings" (decimal: 0.5 bar, 100 g at "1 oz" unit). Multipliers are expressed as number-of-servings, not a separate multiplier control. Time-stamps (Premium) record when you ate. https://eathealthy365.com/myfitnesspals-log-it-button-explained-for-beginners/
- Recipes/saved meals: "My Meals" tab under search → + logs the whole meal; copy items to another meal/date from edit screen. Repeat-food suggestions and Favorites reduce weekday logging to seconds. https://blog.myfitnesspal.com/make-food-logging-effortless/
- Accuracy ceiling: bounded by the database entry; crowdsourced entries frequently wrong (2024 NCBI study: saturated fat underestimated 13–40%, cholesterol 26–60%; ±3.8% calorie accuracy claimed on average but per-entry variance huge; same Greek yogurt found with 3 different calorie counts). Verified checkmark = USDA or licensed source; "Only" filter narrows results to verified. https://www.trygaya.com/review/myfitnesspal-review , https://www.fitness-tracking.com/reviews/myfitnesspal/ , https://clinicalnutritionreport.com/reviews/myfitnesspal/

## 4. Food database
- Largest in category: 14M+ (company claim; some 2026 sources say 20.5M; official tutorial says 19.2M). Mix of licensed (USDA, chain restaurants) + open user submissions; no per-item provenance display; duplicates rife ("apple" → 48 entries with materially different values per DAI audit). Median analytical/verified share of top-5 results: only ~40%. https://clinicalappreport.com/en/reviews/myfitnesspal/ , https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/ , https://best-nutrition-apps.com/reviews/myfitnesspal/
- Chain-restaurant coverage is the moat: best US chain coverage in the category, including UK/EU branded inventory. https://clinicalappreport.com/en/reviews/myfitnesspal/
- Offline: food database unreachable without internet; changes made offline don't sync until reconnected. Recents/custom foods work offline; new searches fail; ~28/50 common foods matched from cache in airplane-mode test; sync can duplicate entries. https://support.myfitnesspal.com/hc/en-us/articles/360032622851-Can-I-access-MyFitnessPal-when-I-don-t-have-an-internet-connection , https://calorietrackerlab.com/bestof/best-calorie-tracker-offline-no-internet-2026/ , https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026
- Free alternatives: USDA FoodData Central API; fatsecret Platform API (2.3M verified items, free basic tier); Open Food Facts. MFP itself is the benchmark other DBs are compared against. https://platform.fatsecret.com/platform-api

## 5. Targets & tracking
- Static calorie target from profile (no adaptive engine). Macro goals: free tier gives basic macro visibility; custom macro targets are Premium. Per-meal macro goals (Premium). Quick Add Macros (Premium) for uncounted foods. Net carb tracking = Premium toggle (fiber + sugar alcohols entries in Quick Add when "Track Net Carbs" on). https://support.myfitnesspal.com/hc/en-us/articles/360032621971-What-is-Quick-Add , https://clinicalnutritionreport.com/reviews/myfitnesspal/
- "Calories remaining" banner on diary; exercise calories added back to budget by default (works against deficit unless manually excluded — a documented anti-pattern). Macro screen and calorie screen can disagree (documented on Lose It!, similar risk class). https://fuelnutrition.app/reviews/lose-it-review
- 18 nutrients tracked (free 14–18) vs Cronometer 84 — clinically shallow. https://best-nutrition-apps.com/reviews/myfitnesspal/

## 6. Reports/analytics
- Daily nutrition view: totals, macro breakdown, nutrient list; weekly email summary; trends on web ("Reports" → nutrition/exercise/progress); complete-diary flow gives a 5-week weight projection. Premium adds detailed dashboards + export. No coaching layer at all — "tracking tool, full stop." https://www.youtube.com/watch?v=I9cdBAcuhXU , https://www.trygaya.com/review/myfitnesspal-review , https://www.weightlossrankings.org/reviews/myfitnesspal/

## 7. GUI layout
- **Diary (home)**: meal slots (Breakfast/Lunch/Dinner/Snacks + optional more), each with items + per-meal totals; top: "Calories Remaining" banner (goal − consumed, updated live per entry); water tracking section; exercise section; date arrows for backdating/pre-logging; swipe-left on item to delete. Nutrition section at bottom → full daily nutrient table. https://eathealthy365.com/myfitnesspals-log-it-button-explained-for-beginners/ , https://www.youtube.com/watch?v=I9cdBAcuhXU
- **Search screen**: search bar top; "Best Match" row (dietitian-curated, complete serving options) then results; green checkmark = verified entry; "Only" (verified filter) + Most Recent/Frequent/All sorts; action buttons row under search bar (Scan Meal, Barcode, Quick Add — swipe left to reveal); My Meals tab; "+" quick-log per row. https://www.youtube.com/watch?v=I9cdBAcuhXU
- **Food detail**: name, serving size selector, number of servings stepper, meal assignment, timestamp (Premium), full nutrient panel, favorite star, "Log" checkmark top-right. https://eathealthy365.com/myfitnesspals-log-it-button-explained-for-beginners/
- **Day summary**: diary bottom "Nutrition" → macro ring/bar + per-nutrient list vs goals; "Complete Diary" button. https://www.youtube.com/watch?v=I9cdBAcuhXU
- Overall UI is dated vs 2024+ competitors; ads on free tier are persistent. https://www.fitness-tracking.com/reviews/myfitnesspal/

## 8. Privacy/export
- 2018 breach exposed 150M+ accounts; data shared with marketing/advertising partners; past Under Armour data-sharing controversies. https://www.trygaya.com/review/myfitnesspal-review
- Export: Premium-only CSV export (3 files — Nutrition, Progress, Exercise) emailed as zip; free users can print/share diary. https://support.myfitnesspal.com/hc/en-us/articles/360032273352-Export-your-nutrition-progress-and-exercise-data
- Offline: weak (see §4). Account deletion available but ad-partner data sharing is the structural privacy weakness.

## 9. Differentiators & steal-worthy
- Differentiators: unmatched database breadth + chain-restaurant moat; 50+ integrations; web app parity; most-cited in research; 20 years of UX maturity. https://clinicalappreport.com/en/reviews/myfitnesspal/
- **Steal-worthy for PersonalOS:**
  1. **Quick Log "+" per search row** — logging at default portion without leaving search; a one-tap receipt-line insert. (https://support.myfitnesspal.com/hc/en-us/articles/360032622491-Quick-Log)
  2. **Quick Add calories/macros** as a deliberate "unknown" lane — but PersonalOS *rejected* fake data; the lesson is the opposite: if you offer it, it must be visibly flagged (source='quickadd') and not pollute analysis. MFP's lesson is that an unflagged quick-add corrupts data silently.
  3. **Verified-checkmark filter** (green check + "Only" toggle) — provenance display at point of use; the DAI audit recommends per-entry source flags for all trackers. https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/
  4. **Copy meal/items to another meal or date** — the fastest backdating/pre-logging primitive; maps directly to PersonalOS "backdating with dayKey = actual eat date."
  5. **Favorite Meals + pre-logging culture** — repeat-meal logging in seconds; PersonalOS recipes (copy-in at save) replicate this with the immutability guarantee MFP lacks.
  6. **Exercise calories NOT auto-added to the deficit budget** — MFP's default is a documented anti-pattern; PersonalOS should keep calorieTarget decoupled from exercise entirely.

---

# Cronometer

## 1. Overview
- Positioning: accuracy-first tracker, "the gold standard for micronutrient tracking"; founded 2011 (Revelstoke, Canada, independently owned). iOS + Android + web. Trusted by dietitians, keto communities, researchers; Cronometer Pro used by clinics (84–92 nutrients). https://best-nutrition-apps.com/reviews/cronometer/ , https://www.promealplan.com/en/blog/cronometer-review-2026
- Pricing 2026: Free tier is genuinely comprehensive (all 84 nutrients, verified DB, barcode scan, no ads, unlimited logging); Gold $10.99/mo or $54.95–$59.99/yr (custom targets, fasting timer, Photo/Voice Log, Crono Coach, custom charts, diary sharing). https://calorie-trackers.com/reviews/cronometer/ , https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23
- Popularity: 1.1M-food database claim; ~970K–800K+ entries by other 2026 counts; "the only major tracker with a fully ad-free free tier." https://cronometer.com/blog/small-is-better/ , https://clinicalappreport.com/en/reviews/macrofactor/

## 2. Core paradigm
- Diary with diary groups (meals), four logging methods: Food Search, Barcode Scanner (free!), Photo Logging (Gold), Voice Logging (Gold) — all funnel into the same editable diary entry flow. Every method is editable before logging; photo/voice return suggestions with ingredient-suggestion hints (e.g., "butter on toast"). https://cronometer.com/blog/4-ways-to-log-food-on-cronometer/
- Barcode of an unknown product → app prompts photo of label/packaging, auto-fills nutrition label, creates Custom Food immediately, submits to staff review queue for the public DB. https://cronometer.com/blog/log-food-fast/
- Philosophy: "bigger isn't better" — curated 1.1M verified foods over crowdsourced tens-of-millions; every user submission reviewed by staff. https://cronometer.com/blog/small-is-better/

## 3. Logging flow (deep)
- Fast path: Diary → "+" (or home-screen long-press quick action "Add Food") → type name → ranked results (name-match + popularity) → tap entry → bottom sheet: serving size dropdown, quantity, diary group (meal), timestamp (Gold) → "Add to Diary". Keyboard-first on web: Tab auto-selects top hit → amount → measure → Enter. https://support.cronometer.com/hc/en-us/articles/360018193011-Add-a-Food , https://cronometer.com/blog/log-food-fast/
- Multi-Add (mobile): orange filter icon → toggle → check multiple foods from search → review → add all at once (or build a Custom Recipe). https://cronometer.com/blog/log-food-fast/
- Custom Meals: group several foods → one-tap diary add; swipe-right on Custom Food/Recipe lists to add straight to diary. https://cronometer.com/blog/log-food-fast/
- Portion handling: exact serving units per database source (g, oz, ml, cups, standardized portions); quantity is a decimal multiplier. "Grams matter" app — no portion "eyeball" shortcuts; measured 18–45 s per entry (average ~45 s in one test; 18 s in another). https://neura.health/insight/cronometer-app-hands-on-review , https://best-nutrition-apps.com/reviews/cronometer/
- Favorites: star an entry → Favorites tab; favorite foods/recipes log "with just a tap." https://cronometer.com/blog/logging-food-matters/
- Accuracy tradeoff: strictness is the UX — you must pick the right source, the right serving unit, the right grams; no AI portion guessing in free tier. Photo Log (Gold) is designed to be corrected. https://cronometer.com/blog/4-ways-to-log-food-on-cronometer/

## 4. Food database
- Sources: NCCDB (U Minnesota, 17,000+ foods, 70+ nutrients, bulk of DB), USDA SR28/FoodData Central (8,000+ foods), CFCD (Cronometer Food Composition Database — compiled from peer-reviewed sources), CNF (Canada), IFCDB (Ireland), plus Nutritionix/USDA branded UPC data for barcodes; ~10+ sources total. Zero user-submitted nutrient values in the verified tier; user submissions staff-reviewed. https://support.cronometer.com/hc/en-us/articles/360018239472-Data-Sources , https://cronometer.com/features/accurate-databases.html
- Per-entry provenance visible (source label); DAI audit: 80% median analytical/verified share; single/few entries per common food (no duplicate noise). https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/
- Gaps: niche restaurant dishes, regional cuisines, small-brand packaged goods; chain coverage via licensed data where available. https://calorie-trackers.com/reviews/cronometer/
- Offline: common foods cached, custom recipes always available offline; new searches need internet; barcode scan queues for lookup on reconnect; sync clean (timestamps authoritative). Ranked #3 in offline tests (22/50 foods from cache) but with the cleanest sync recovery. https://calorietrackerlab.com/bestof/best-calorie-tracker-offline-no-internet-2026/ , https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026

## 5. Targets & tracking
- Target wizard from profile (age/sex/height/weight/activity) — standard equation baseline; macro settings three modes: **Macro Ratios** (kcal or gram ratios; targets auto-update when energy target changes with logged exercise/weight), **Fixed Targets** (fixed grams/day; RDA defaults), **Keto Calculator** (dynamic: protein from LBM multiplier — rigorous ~1.0 g/kg LBM, moderate ~1.5 g/kg LBM; max carbs by program; fat = remainder; Athletic Bonus adds 1 g carb per 50 kcal exercise). https://support.cronometer.com/hc/en-us/articles/360060119292-Edit-Macronutrient-Targets , https://support.cronometer.com/hc/en-us/articles/33231740763796-Mobile-Keto-Calculator
- Net carbs: Track Carbs as Net or Total — Net = Total − Fiber − Sugar Alcohols (configurable). https://support.cronometer.com/hc/en-us/articles/360060119292-Edit-Macronutrient-Targets
- Micronutrient targets: per-nutrient custom daily target + max threshold; Oracle Nutrient Search (Gold) finds foods to fill gaps. 84 nutrients free / ~95 Gold. https://cronometer.com/blog/how-to-set-your-macro-and-micronutrient-targets/
- "Remaining" displays: diary shows consumed vs target per nutrient with target bars; dynamic energy target recalculates as you log. https://neura.health/insight/cronometer-app-hands-on-review

## 6. Reports/analytics
- Daily Report: macro + nutrient bars vs targets; Nutrition Report (weekly averages, nutrient adequacy, top food sources); Trends (weight, energy, macros over time); free tier limits reports to a 7-day window (a known free-tier cap); Gold unlocks full history + custom charts + cross-variable charting. https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23 , https://best-nutrition-apps.com/reviews/cronometer/

## 7. GUI layout
- **Diary (home)**: date strip; "Diary Groups" (Breakfast/Lunch/Dinner/Snacks by default, editable) each with + button; per-food rows with serving/calories; live target bars (calories + macros + selected micronutrients) at top; biometrics + exercise sections. Dense, clinical, information-first. https://neura.health/insight/cronometer-app-hands-on-review
- **Food search**: search field with tabs (All / Favorites) + gear → filters (Source — NCCDB/USDA/etc.; Category; Language); results ranked by match + popularity; keyboard-friendly on web. https://support.cronometer.com/hc/en-us/articles/360018193011-Add-a-Food
- **Add Food to Diary sheet**: serving dropdown, quantity field, diary group, timestamp (Gold), star-to-favorite; "Add To Diary" button. https://support.cronometer.com/hc/en-us/articles/360018193011-Add-a-Food
- **Food detail**: name, source label, full nutrient profile (84) with amounts + %DV, deficiencies flagged with color indicators; per-entry provenance visible. https://best-nutrition-apps.com/reviews/cronometer/
- **Day/Week summary**: Daily Report + Nutrition Report with adequacy coloring; the UI is the least "pretty" in the category but the most legible for data work. https://calorie-trackers.com/reviews/cronometer/

## 8. Privacy/export
- Export: Account → Export Data → CSV (diary entries, exercises, biometrics, notes, nutrition summaries, date-range selectable); Bulk Delete; Delete Account (irreversible). https://support.cronometer.com/hc/en-us/articles/360018760151-Account-Settings
- Privacy: "We Do Not Sell Your Personal Information"; no ad-partner data sharing; CCPA compliance section; sharing opt-out via More → Sharing. https://beta.cronometer.com/privacy/
- Offline: functional but not optimized (see §4).

## 9. Differentiators & steal-worthy
- Differentiators: verified-only DB with per-entry provenance; 84+ nutrient depth; generous free tier; dietitian/clinical trust; strict data model (timestamps authoritative → clean sync). https://best-nutrition-apps.com/reviews/cronometer/ , https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23
- **Steal-worthy for PersonalOS:**
  1. **Source labels on every entry + source filter in search** — exactly the provenance discipline PersonalOS's `source` column implies; the DAI audit's headline recommendation. https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/
  2. **Keto-style dynamic macro model (protein from LBM, carbs capped, fat = remainder)** — structurally identical to PersonalOS "carbs as remainder" with protein g/kg per phase; Cronometer proves the pattern works in production. https://support.cronometer.com/hc/en-us/articles/33231740763796-Mobile-Keto-Calculator
  3. **Multi-Add → build meal then log once** — batch receipt-line entry; maps to PersonalOS batch catch-up.
  4. **Barcode-unknown → photo-label autofill → staff review queue** — a "verified-by-human" growth loop without polluting the canonical DB; PersonalOS's no-new-dependencies constraint means this is a future item, but the queue pattern is the right shape.
  5. **Net carbs as configurable display (Total − Fiber − Sugar Alcohols)** — cheap to compute from receipt lines; PersonalOS could offer it as a display toggle on the macro-gap bar.
  6. **Max-threshold on nutrient targets** — targets with an upper bound (like a fat floor in reverse); the "fat floor ~0.6 g/kg" concept as a floor/ceiling pair.

---

# Lose It!

## 1. Overview
- Positioning: "the friendliest tracker in the category, the best value in the value tier" — the app people switch to after MyFitnessPal. Launched 2008 (FitNow, Boston); iOS + Android + web; 50M+ downloads. https://nutrition-apps-ranked.com/en/reviews/lose-it/ , https://nutrola.app/en/blog/lose-it-review-2026
- Pricing 2026 (chaotic): long-reported Premium $39.99/yr; NutriScan (Feb 2026) documents a **price doubling to $79.99/yr**, no monthly plan, Lifetime $299.99 ($229.99 for existing Premium, $149.99 on Black Friday sales); other 2026 sources still cite $39.99 or $19.99/mo. Free tier: calorie diary, 47M+ DB, basic macros, weight; 25 diary entries/day cap; **2026 paywall shift moved Snap It, Scan It, and custom macro targets behind Premium for new free accounts.** https://nutriscan.app/blog/posts/lose-it-pricing-2026-free-vs-premium-2b4e921555 , https://fuelnutrition.app/reviews/lose-it-review , https://www.best-diet-apps.com/reviews/lose-it/
- Popularity: top-5 mainstream by installs; clinical reviews: 75–82/100. https://clinicalappreport.com/en/reviews/lose-it/

## 2. Core paradigm
- Daily calorie budget with goal pacing (0.5–2 lb/week) + three logging shortcuts: **Scan It** (barcode), **Snap It** (photo, Premium), **Say It** (voice, Premium), plus search and manual entry. Weekly calorie budgets (calorie cycling) on Premium. Meal-suggestion learning: after ~2 weeks the app suggests meals based on patterns. https://www.trygaya.com/pt/review/lose-it-review , https://best-diet-apps.com/reviews/lose-it/
- Gamification layer: streaks, badges, Milestone Challenges, weekly challenges. https://fuelnutrition.app/reviews/lose-it-review

## 3. Logging flow (deep)
- Fast path (search): Diary → "Add Food" under a meal slot → search → tap entry → serving size → confirm. Measured ~22 s/meal average manual; with suggestions, <15 s by week four. https://best-diet-apps.com/reviews/lose-it/
- Fast path (barcode, free): scan → product resolves (90% hit rate in 2026 benchmark) → serving confirm → logged. Premium moved Scan It behind paywall for new accounts in 2026. https://www.calorietrackerguide.com/reviews/lose-it , https://nutriscan.app/blog/posts/lose-it-pricing-2026-free-vs-premium-2b4e921555
- Snap It: photo → on-device CV identifies plate → estimate + edits. Independent benchmarks: 68.7% ID rate, ±22% portion error, 11.2 s latency; Macro Tracker Lab: 77.6% ID, ±8.9% portion, 1.83 s. Works well for single items (banana, chicken breast), fails on mixed plates/sauces. "Usable as a search shortcut, not a primary input mode." https://fuelnutrition.app/reviews/lose-it-review , https://www.macro-trackers.com/reviews/lose-it , https://nutrition-apps-ranked.com/en/reviews/lose-it/
- Portion handling: serving-size selection with unit variants + quantity (decimal servings); no explicit multiplier concept beyond servings. Weekly budget mode: days can be over/under within a weekly total.
- Known math flaw (FeastGood): macro targets can total 2,630 kcal against a 1,902 kcal calorie goal with no warning; protein recommendations skew low for active users (72 g suggested for 160 lb active person). https://fuelnutrition.app/reviews/lose-it-review
- Offline: **best-in-category offline** — cached DB (47/50 common foods matched in airplane mode), recents always available, Snap It captures offline with deferred processing, recently scanned barcodes cached; but sync-on-reconnect has user-reported entry-loss cases. https://calorietrackerlab.com/bestof/best-calorie-tracker-offline-no-internet-2026/ , https://clinicalappreport.com/en/rankings/best-calorie-tracker-offline-no-internet-2026/ , https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026

## 4. Food database
- ~47M entries (largest claims in marketing) but materially smaller than MFP in practice — "high single-digit millions"; brand-partner data + user submissions (DAI: 60% median verified share; duplicates exist). US chain coverage decent; regional/international thin. https://nutriscan.app/blog/posts/lose-it-pricing-2026-free-vs-premium-2b4e921555 , https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/ , https://nutrition-apps-ranked.com/en/reviews/lose-it/
- Verified-entry filter on Premium ("Verified Food Priority"). Crowdsourced variance → ±8.1–9.7% MAPE overall; ±13.9% on mixed/restaurant dishes. https://nutriscan.app/blog/posts/lose-it-pricing-2026-free-vs-premium-2b4e921555 , https://www.calorietrackerguide.com/reviews/lose-it

## 5. Targets & tracking
- Calorie budget from goal pace; custom macro targets (Premium); macro ring charts; exercise calories add back to budget by default (must toggle "Exclude From Total" per workout — anti-pattern documented); weekly calorie cycling (Premium); ~15 nutrients on Premium; water + fasting timer. https://fuelnutrition.app/reviews/lose-it-review , https://www.amyfoodjournal.com/blog/lose-it-app-review

## 6. Reports/analytics
- Daily budget tracker ("the clearest remaining display we tested"); weekly summary emails (avg daily deficit, projected weight loss, over-budget days); Patterns engine (Premium) surfaces correlations — e.g., "Wednesday evening overshoot" alerts, positive patterns (which meals correlate with lower rest-of-day intake). Free tier sees totals, not insights. https://best-diet-apps.com/reviews/lose-it/ , https://fuelnutrition.app/reviews/lose-it-review

## 7. GUI layout
- **Home/Diary**: daily calorie budget number, meal slots (Breakfast/Lunch/Dinner/Snacks) with suggested-calorie ranges per meal, quick-add buttons per meal, under/over remaining number, macro ring charts + weekly bar graphs, weight/milestones, water. "Everything on one screen without scrolling." https://www.lemon8-app.com/experience/lose-it-food-log-screen?region=us , https://www.amyfoodjournal.com/blog/lose-it-app-review , https://www.trygaya.com/pt/review/lose-it-review
- **Search**: large food list with quick access to recents; camera button for Snap It; frequent foods. https://www.trygaya.com/pt/review/lose-it-review
- **Quick action menu**: record weight, log exercise, log food, scan barcodes, edit home screen, share, Face ID. https://www.lemon8-app.com/experience/lose-it-food-log-screen?region=us
- **Dashboard**: protein/carbs/fat/calories as ring charts with weekly bar graphs. https://screensdesign.com/showcase/lose-it-calorie-counter , https://www.trygaya.com/pt/review/lose-it-review
- Cleanest onboarding in the category (time-to-first-meal <9 min, #1 in beginner tests). https://clinicalappreport.com/en/reviews/lose-it/

## 8. Privacy/export
- Export: Premium includes meal-export/CSV; free tier limited. Data shared with ads on free tier (moderate density); Fitbit/Garmin/Withings/Apple Health/Google Fit sync. No breach history of MFP's scale; "stable, profitable company — free tier hasn't degraded the way MFP's has" (as of early 2026 reviews; the 2026 paywall shift partially contradicts this). https://nutrition-apps-ranked.com/en/reviews/lose-it/ , https://nutriscan.app/blog/posts/lose-it-pricing-2026-free-vs-premium-2b4e921555

## 9. Differentiators & steal-worthy
- Differentiators: cleanest UX/onboarding, best offline story, smart meal suggestions, gamified streaks, weekly calorie budgets. https://clinicalappreport.com/en/reviews/lose-it/
- **Steal-worthy for PersonalOS:**
  1. **Suggested calorie ranges per meal slot** — a soft guardrail (like PersonalOS's macro-gap bar but preemptive); "gentle guardrail, not a rule." https://www.lemon8-app.com/experience/lose-it-food-log-screen?region=us
  2. **Smart repeat-meal suggestions from history** — local-only pattern (safe offline-first); the "Monday lunch = turkey sandwich" shortcut is exactly the recent/favorites fast path PersonalOS wants for recipes.
  3. **Weekly calorie budget (cycling)**: over/under days within a weekly envelope — matches PersonalOS's weekly check-up cadence (kcal vs target %), though PersonalOS's per-day sum-of-rows model makes weekly totals trivial to compute.
  4. **Offline capture with deferred processing** — photos as placeholders; PersonalOS's quiet catch-up nudge is the offline-appropriate equivalent (no server round-trip needed).
  5. **The anti-pattern to avoid**: exercise auto-added to budget + unbalanced macro/calorie targets with no validation — PersonalOS's target math (TDEE + rate×7700/7, protein g/kg, fat floor, carbs remainder) should validate internally at save time (like Cronometer's ratios).
  6. **Patterns engine → "positive patterns"** — which meals correlate with better days; PersonalOS's weekly check-up Coach line could compute this from receipt lines without any server.

---

# MyNetDiary

## 1. Overview
- Positioning: "the tracker dietitians recommend most often" — curated staff-verified database, clinical workflows (diabetes, GLP-1), ad-free free tier with no account required. US company; iOS + Android + web dashboard. https://caloriappdirectory.com/reviews/mynetdiary-review/ , https://fuelnutrition.app/reviews/mynetdiary-review
- Pricing 2026: Free (ad-free, no account required, barcode scan, macros); Premium $8.99/mo or $59.99/yr (108 nutrients, AutoPilot adaptive targets, recipe import, GLP-1 Companion, diabetes mode); Premium Plus adds AI layer (AI Coach, AI meal suggestions, AI restaurant menu scan, AI voice logging) ~$14.99/mo or $99.99/yr; Lifetime Premium $179.99 (Dec 2025). PRO app legacy ($3.99, $114.99/yr — no reason to buy). https://nutriscan.app/blog/posts/mynetdiary-pricing-2026-free-vs-premium-plans-86ac2cbe24 , https://feastgood.com/mynetdiary-premium-review/
- Popularity: not the largest, but "recommended by clinical nutrition staff more often than any other tracker except Cronometer." https://caloriappdirectory.com/reviews/mynetdiary-review/

## 2. Core paradigm
- Search + barcode diary with meal slots; dietitian-curated database (no unverified user submissions); diabetes mode (blood glucose, insulin, meds, carb ratios, GI data); GLP-1 Companion (protein-first dashboard, symptom tracker, medication reminders); AutoPilot (adaptive calorie adjustment — "analogous to MacroFactor's adaptive algorithm"); recipe URL import; custom trackers. https://feastgood.com/mynetdiary-premium-review/ , https://caleyefit.com/blog/mynetdiary-vs-myfitnesspal-diabetes/
- Meal Scan photo AI (Premium) — ±4.8% calorie accuracy in one 2026 test; functional, not class-leading. https://calorie-trackers.com/reviews/mynetdiary/

## 3. Logging flow (deep)
- Fast path: Diary → + → search or barcode → entry → serving → log. Reviewers consistently call it "the fastest tracker" they've used; entry screen includes a calorie-edit trick: tap the calorie number and type desired kcal — app auto-adjusts portion to match (a unique inversion). https://nutriscan.app/blog/posts/mynetdiary-pricing-2026-free-vs-premium-plans-86ac2cbe24 , https://apps.apple.com/au/app/diabetes-tracker-by-mynetdiary/id541478695
- Barcode: free, daily-updated database ("THE DATABASE IS UPDATED DAILY" per App Store listing). https://apps.apple.com/au/app/diabetes-tracker-by-mynetdiary/id541478695
- Recipes: manual ingredient input + URL import (paste recipe URL → ingredients/instructions imported); 600+ dietitian-designed recipes on Premium. https://feastgood.com/mynetdiary-premium-review/
- Portion handling: standard serving units + grams; quick-add shortcuts; customizable water cup sizes. Timestamps on entries. Meal-level carb alerts: set per-meal carb target (e.g., 45 g) → alert when meal exceeds it — "real-time check at the meal level rather than retrospective daily review." https://caleyefit.com/blog/mynetdiary-vs-myfitnesspal-diabetes/
- Offline: **works offline on the free plan** (per 2026 comparison); "Need an app that works offline" is an explicit MyNetDiary pick criterion vs Cronometer. https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23

## 4. Food database
- ~2M foods (some sources: 1.1M), 100% staff-verified, sourced from USDA Standard Reference + Nutrition Coordinating Center research data; coverage US/Canada/UK/Australia. "MFP almost always has an entry; MyNetDiary almost always has the right entry." Up to 108 nutrients per entry (Premium) — more than any other consumer app per MyNetDiary's own claims. https://fuelnutrition.app/reviews/mynetdiary-review , https://calorie-trackers.com/reviews/mynetdiary/
- Gaps: thinner on niche/regional/restaurant items than MFP; no independent third-party weighed-reference validation in the literature — trusted on dietitian word-of-mouth. https://caloriappdirectory.com/reviews/mynetdiary-review/

## 5. Targets & tracking
- Custom macro/nutrient targets in grams or % of calories; calorie and macro cycling by day of week; **AutoPilot**: auto-adjusts daily calorie budget from actual weight changes and progress to goal date (MacroFactor-style adaptation, with Step Bonus to avoid double-counting exercise); total vs net carbs toggle; GI/GL data for a subset of foods (Sydney University International GI database); CGM integration via Apple Health (Dexcom/Libre 3); eAG→A1C estimation. https://feastgood.com/mynetdiary-premium-review/ , https://caleyefit.com/blog/mynetdiary-vs-myfitnesspal-diabetes/ , https://nutriscan.app/blog/posts/mynetdiary-pricing-2026-free-vs-premium-plans-86ac2cbe24

## 6. Reports/analytics
- Daily Analysis (fiber, saturated/trans fat, sodium vs guidelines); Food Grades (A–D per food); Day Timeline stacking glucose, insulin, medications, exercise, food on one axis; weekly nutrient averages, macro distribution charts, weight trend; top-food-sources-per-nutrient analysis; customizable dashboard. https://feastgood.com/mynetdiary-premium-review/ , https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23

## 7. GUI layout
- **Diary**: meal-grouped log with running totals; per-meal carb counters; clean, professional, "2018-web-app" aesthetic — dated but legible; customizable dashboard widgets (weight, water, steps, macros). https://caloriappdirectory.com/reviews/mynetdiary-review/ , https://feastgood.com/mynetdiary-premium-review/
- **Food entry**: search + barcode + serving/quantity + optional timestamp; calorie-tap-to-set inversion; Carbs Quick View (see carb count during entry without opening nutrition panel). https://apps.apple.com/au/app/diabetes-tracker-by-mynetdiary/id541478695 , https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23
- **GLP-1 / diabetes dashboards**: blood glucose dashboard beside food log; out-of-range readings highlighted yellow/red; protein-first dashboard; Day Timeline report. https://nutriscan.app/blog/posts/mynetdiary-vs-cronometer-2026-c6acd5aa23
- **Web**: "web dashboard works well for desktop logging." https://caloriappdirectory.com/reviews/mynetdiary-review/

## 8. Privacy/export
- Free tier: no ads, no account required to start; unlimited data history on free plan. Export: CSV via reports; professional sharing via Professional Connect (client log sharing with dietitians). https://nutriscan.app/blog/posts/mynetdiary-pricing-2026-free-vs-premium-plans-86ac2cbe24 , https://fuelnutrition.app/reviews/mynetdiary-review
- No breach/controversy history of MFP's scale; privacy posture is "clean clinical tool." https://caloriappdirectory.com/reviews/mynetdiary-review/

## 9. Differentiators & steal-worthy
- Differentiators: staff-verified database; diabetes/GLP-1 clinical workflows; AutoPilot adaptive targets; no-account ad-free free tier; offline on free plan. https://caloriappdirectory.com/reviews/mynetdiary-review/
- **Steal-worthy for PersonalOS:**
  1. **Tap-calorie-to-set-portion inversion** ("edit Calories on the Food Entry Screen... automatically adjust the portion size to match") — a powerful portion-multiplier UX: PersonalOS's 1x/1.5x/2x could be generalized as "type target kcal → multiplier computed." https://apps.apple.com/au/app/diabetes-tracker-by-mynetdiary/id541478695
  2. **Per-meal carb alert (threshold per meal slot)** — maps directly to PersonalOS meal-type targets; the meal-level check is more actionable than a day-end review. https://caleyefit.com/blog/mynetdiary-vs-myfitnesspal-diabetes/
  3. **AutoPilot + Step Bonus** — an adaptive layer on top of a sum-of-rows day model; PersonalOS's signed additive rate (rate × 7700/7) is the static version of this; AutoPilot shows the shape of a future adaptive upgrade.
  4. **No-account, ad-free, offline-capable free tier** — proves a tracker can be private-by-default; PersonalOS's local-first model exceeds it.
  5. **Day Timeline (glucose/food/meds on one axis)** — the receipt-line model already supports this: any entity (meals, meds, weigh-ins) as timestamped rows.
  6. **Food Grades (A–D)** — a per-entry quality heuristic; PersonalOS could derive a "logging completeness" grade for the weekly check-up from its own rows.

---

# Lifesum

## 1. Overview
- Positioning: "the best-looking calorie tracker on the market" — Stockholm design (founded 2012/2013), lifestyle brand framing nutrition as habits and diet plans, not numbers; "sells a lifestyle experience." iOS + Android + web. https://nutrola.app/en/blog/lifesum-review-2026 , https://calorie-trackers.com/reviews/lifesum/
- Pricing 2026 (opaque): free tier (thin, ad-supported); Premium $9.99/mo, $21.99/3-mo, $44.99–$99.99/yr (region/device/signup-time pricing experiments — real average below headline); Family $59.99/yr (up to 5 users); 12% price increase April 2026. https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c , https://nutrition-app-rankings.com/reviews/lifesum
- Popularity: 50+ million users (marketing); scores 6.5–7.6/10 in 2026 reviews. https://calorie-trackers.com/reviews/lifesum/

## 2. Core paradigm
- Diet-plan-led: 15+ (some say 50+) structured plans (keto, Mediterranean, vegan, paleo, high-protein, low-carb, 5:2, DASH, low-FODMAP) — each with daily meal templates from a 400-recipe library, shopping lists, adjusted macro targets. Logging is secondary to following the plan. https://calorierankings.com/reviews/lifesum/ , https://best-nutrition-apps.com/reviews/lifesum/
- **Life Score (1–100)**: daily food-quality grade from micronutrient diversity, macro balance, processing level — rewards broccoli over hitting 1,800 kcal of junk. Meal ratings (green/yellow/red) per meal. https://calorierankings.com/reviews/lifesum/
- Logging: manual search + barcode only — **no AI photo, no voice logging** (a noted 2026 gap for a design-forward app). https://nutrola.app/en/blog/lifesum-review-2026

## 3. Logging flow (deep)
- Fast path: Diary → meal slot → search → entry → serving → log; measured ease-of-use 84/100 but slower than Lose It/MFP; ±6.5% calorie accuracy in lab protocol (DB variance). https://www.calorietrackerguide.com/reviews/lifesum , https://calorie-trackers.com/reviews/lifesum/
- Portion handling: standard serving sizes + quantity; no multiplier concept; no portion-estimation shortcuts. Photo logging: Macro Tracker Lab measured 61.8% ID / ±10.6% portion / 2.74 s — "fine if you want a nudge, not if you want a number." https://www.macro-trackers.com/reviews/lifesum
- Meal plans are templates — "they do not adapt in real time based on what you ate yesterday or your current weight trend." https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c
- Free tier: real tracker (log, barcode, calories, daily summary) but custom macro targets, meal plans, favorites/recipes, detailed nutrients, ad-free all Premium. https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c

## 4. Food database
- ~2M entries, mixed verified + user-submitted (crowdsourced core); 22–24 nutrients tracked; DB smaller than MFP/FatSecret; some entries lack complete nutrient profiles; no independent verification for clinical use. https://calorie-trackers.com/reviews/lifesum/ , https://best-nutrition-apps.com/reviews/lifesum/
- Offline: minimal — "hardest-hit in airplane mode" tier along with Cal AI/Noom; core features need connection. https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026

## 5. Targets & tracking
- Calorie goal free; custom macro targets Premium (grams or %); keto plan tracks net carbs; hydration + sleep tracked in a combined daily wellness dashboard; wearable activity (Apple Health, Google Fit, Garmin, Fitbit) feeds calorie budget. https://calorie-trackers.com/reviews/lifesum/ , https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c

## 6. Reports/analytics
- Weekly health score; data visualization 83/100 (best-in-class among its tier); Life Score aggregate; habit tracking; insights are plan-based rather than personalized coaching. https://www.calorietrackerguide.com/reviews/lifesum , https://calorie-trackers.com/reviews/lifesum/

## 7. GUI layout
- **Diary**: colorful, illustration-driven, warm; meal slots with ratings (green/yellow/red); daily Life Score; macro progress display "clear and well-suited to general fitness goals"; gradual color transitions; the least clinical look in the category. https://calorie-trackers.com/reviews/lifesum/
- **Search**: standard search + barcode; sparse US barcode coverage noted (vs European). https://www.macro-trackers.com/reviews/lifesum
- **Plan screens**: multi-week program views with daily meal suggestions, recipes, check-ins; curated recipe cards with full macros. https://calorierankings.com/reviews/lifesum/
- **Dashboard**: Life Score ring + hydration + sleep + step cards. Android version lags iOS in polish/features. https://best-nutrition-apps.com/reviews/lifesum/

## 8. Privacy/export
- Privacy 72/100 in one scorecard — no breach history; data linked to account; ad-supported free tier. Export/CSV: not a differentiator; premium pricing experiments noted as a trust issue ("pricing inconsistency is a UX downside"). https://calorierankings.com/reviews/lifesum/ , https://nutriscan.app/blog/posts/lifesum-premium-worth-it-2026-meal-plans-macros-cost-6ffc879a6c

## 9. Differentiators & steal-worthy
- Differentiators: best-in-category design; structured diet-plan library; Life Score/meal ratings; family plan. https://calorierankings.com/reviews/lifesum/
- **Steal-worthy for PersonalOS:**
  1. **The Life Score concept** — a single daily quality aggregate; PersonalOS's weekly compliance % is the data-honest version of this (computed from rows, not a magic score).
  2. **Meal-level ratings (green/yellow/red)** — instant visual feedback without opening numbers; maps to PersonalOS's macro-gap bar color states (protein hit / kcal % / over target).
  3. **Design as adherence infrastructure** — "an app you enjoy opening is one you're more likely to use consistently"; the strongest evidence that UI polish is a retention feature, relevant to PersonalOS's heartwood design contract.
  4. **Plan → targets → recipes coherence** — when you pick a plan, targets AND recipes AND food suggestions all align; PersonalOS's per-phase (cut/bulk/maintain) protein settings are the seed of this.
  5. **Anti-pattern to avoid**: pricing opacity (regional experiments, promo roulette) — PersonalOS is free/local; never charge is the safe posture.
  6. **Anti-pattern to avoid**: free tier that gates macro targets — PersonalOS's g/kg targets must be editable at any time (per spec).

---

# FatSecret

## 1. Overview
- Positioning: the "fully-free" tracker — launched 2007 (Melbourne, Australia), the whole feature surface free with ads; monetizes mainly via the **Platform API** (2.3M+ verified items, 58 country datasets, 26 languages, 50,000+ developers, 700M API calls/month, barcode coverage >90% globally) and optional Premium. iOS + Android + web at parity. https://www.fatsecret.com/ , https://platform.fatsecret.com/platform-api
- Pricing 2026 (varies by source/region): free (everything core: calories, macros, barcode, recipes, exercise, community); Premium $2.99–$6.99/mo / $38.99–$59.99/yr (ad removal, Smart Food Scan AI photo, Smart Assistant voice, meal plans, export, advanced reports). The most honest free tier in the category — "Premium is mostly ad removal." https://calorierankings.com/reviews/fatsecret/ , https://nutrola.app/en/blog/fatsecret-review-2026 , https://nutrition-apps-ranked.com/en/reviews/fatsecret/

## 2. Core paradigm
- Search-and-pick diary + free barcode scanner + community-first (food diary sharing, forums, challenges, community recipes with calculated nutrition). No AI photo logging on free (Smart Food Scan exists on Premium; accuracy inconsistent). Exercise diary + weight tracker + meal-plan calendar in the free tier. https://nutrition-apps-ranked.com/en/reviews/fatsecret/ , https://nutrola.app/en/blog/fatsecret-review-2026
- The database is also a **platform**: fatsecret's API powers third-party trackers (GAYA, many others) — "the same verified database used by healthcare applications." https://www.trygaya.com/review/fatsecret-review

## 3. Logging flow (deep)
- Fast path: Diary → meal → search or barcode → entry → serving → log; measured ~30–35 s/manual entry (oldest UX in the category, no modern shortcuts). https://nutrition-apps-ranked.com/en/reviews/fatsecret/
- Community recipes are the hidden gem: instead of logging a chicken stir-fry ingredient-by-ingredient, find a community recipe with computed nutrition → log a serving. https://nutrola.app/en/blog/fatsecret-review-2026
- Portion handling: standard servings + grams; multiple serving options per food; no multipliers, no photo portioning on free tier.
- Offline: spotty — "offline logging works, sync stable but partial history"; barcode offline not supported. Bottom tier alongside Yazio/Lifesum for offline. https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026

## 4. Food database
- 2.3M+ human-verified items (manufacturer-label imports + community submissions with dietitian review); strongest international packaged-goods coverage outside the EU; localized country datasets (UK, AU, DE, ES, BR, JP...); open API with the longest history in the category. Per-entry noise still real (crowdsourced long tail; verification flag easy to miss); ±16.8% MAPE — weakest in the recommended top-8. https://platform.fatsecret.com/platform-api , https://calorierankings.com/reviews/fatsecret/ , https://nutrition-apps-ranked.com/en/reviews/fatsecret/
- As an **open alternative**: the FatSecret Platform API is free to register and is precisely the kind of licensed DB a small offline-first app could embed (though PersonalOS is locked to local SQLite with no new deps — noted as future item). https://platform.fatsecret.com/platform-api

## 5. Targets & tracking
- Calorie/macro goals free; advanced macro tracking, food timing, diet tools on Premium; ~12 nutrients on Premium (shallow); weight/measurement tracking; meal plans (IF, keto) on Premium. https://nutrition-apps-ranked.com/en/reviews/fatsecret/ , https://www.trygaya.com/review/fatsecret-review

## 6. Reports/analytics
- Daily/weekly reports, calendar view, exercise diary; "reports only — no daily insights or coaching"; the community feed provides accountability that replaces in-app coaching. https://www.trygaya.com/review/fatsecret-review , https://nutrientmetrics.com/en/apps/fatsecret

## 7. GUI layout
- **Diary**: meal-grouped food log with daily totals; calendar; weight chart. **Search**: standard list, verification flag present but easy to miss. **Community**: forum feed, recipe sharing, challenges. Overall: "feels frozen in 2018 — dated typography, dense screens, inconsistent visual hierarchy"; functional but unattractive. https://nutrition-apps-ranked.com/en/reviews/fatsecret/ , https://nutrola.app/en/blog/fatsecret-review-2026
- Functional parity web app; ads moderate (cleaner than MFP free). https://nutrition-apps-ranked.com/en/reviews/fatsecret/

## 8. Privacy/export
- Ad-supported model = some data used for ads (privacy posture weaker than Nutrola/Cronometer); CSV export on Premium (per Calorie Rankings — "adds export"); account-based; no breach history of MFP scale. https://www.trygaya.com/review/fatsecret-review , https://calorierankings.com/reviews/fatsecret/

## 9. Differentiators & steal-worthy
- Differentiators: the most usable free tier; open API platform; international localization; community recipes. https://calorierankings.com/reviews/fatsecret/
- **Steal-worthy for PersonalOS:**
  1. **Community recipes as logging shortcuts** — the insight: a recipe library (with computed nutrition) is a logging-speed feature, not a content feature; PersonalOS's own recipes (copy-in at save) capture this without a network.
  2. **Free-tier generosity as retention** — FatSecret's no-paywall stance is its identity; PersonalOS (free, local, private) should treat every paywall idea as off-model.
  3. **The API-as-business-model** — fatsecret monetizes the database, not the user; PersonalOS's equivalent is the seed-pack (seeded meal types + base food DB) being complete enough to never need the cloud.
  4. **Anti-pattern to avoid**: "verification flag easy to miss" — provenance must be unmissable in PersonalOS's source column display (Cronometer's visible source labels are the bar).
  5. **Anti-pattern to avoid**: letting UX rot — FatSecret's 2018 UI costs it accuracy perception and retention; PersonalOS's heartwood contract keeps UI as a first-class deliverable.

---

# Yazio

## 1. Overview
- Positioning: German-built (YAZIO GmbH, Erfurt; launched 2014), Europe's most-downloaded mainstream tracker, 50M+ users; "the strongest tracker for European users" with the **best integrated intermittent-fasting timer** in the category. iOS + Android (web exists but limited; some reviews call it mobile-only). https://clinicalappreport.com/en/reviews/yazio/ , https://calorie-trackers.com/reviews/yazio/
- Pricing 2026 (regional variance): free tier (limited — no macro tracking on free, a category outlier); Pro $4.99–$9.99/mo or $34.99–$44.99/yr ($39.99 typical US; €44.99 annual EU; €6.99/mo EU). https://nutrition-apps-ranked.com/en/reviews/yazio/ , https://nutrola.app/en/blog/is-yazio-still-worth-it-2026 , https://clinicalnutritionreport.com/reviews/yazio/
- Popularity: top-5 by install base across continental Europe; weaker in US. Scores 67–77/100 in 2026 reviews. https://clinicalnutritionreport.com/reviews/yazio/

## 2. Core paradigm
- Standard search-and-pick diary + barcode + recipe analyzer + **first-class IF timer** (protocols 16:8, 18:6, 20:4, OMAD, 5:2; diary integrates with fasting window; timer even on free tier) + curated meal plans with shopping lists. Photo-AI exists but rudimentary (±25–30% portion error band). https://calorierankings.com/reviews/yazio/ , https://nutrition-apps-ranked.com/en/reviews/yazio/
- Free tier unusual: macro breakdown hidden on free — "you read that correctly — the free version does not let you see protein/fat/carb breakdown," a feature virtually every competitor gives free. https://nutrola.app/en/blog/is-yazio-still-worth-it-2026

## 3. Logging flow (deep)
- Fast path: Diary → meal → search (or barcode) → serving → log; ~25–30 s/manual; DB is strong for European products (Aldi/Lidl/Rewe/Carrefour store brands); barcode coverage solid in Europe, thin in US. https://nutrition-apps-ranked.com/en/reviews/yazio/ , https://www.macro-trackers.com/reviews/yazio
- Recipe analyzer among "the most usable" in the category; recipe import works well on German-language recipe sites; recipe library well-curated with full nutritional breakdowns. https://calorierankings.com/reviews/yazio/ , https://nutrition-apps-ranked.com/en/reviews/yazio/
- Portion handling: standard serving units + grams; quantity; no multiplier shortcut. Accuracy weakest in the top-8 (±15.1% MAPE; ±9.7% portion in MTL bench). https://nutrition-apps-ranked.com/en/reviews/yazio/ , https://www.macro-trackers.com/reviews/yazio
- Offline: recents only; no offline barcode; partial history; stable sync. https://nutrola.app/en/blog/offline-calorie-trackers-which-actually-work-2026

## 4. Food database
- ~2.5M foods; German/Austrian/Swiss coverage best-in-class; UK/Nordic/Mediterranean decent; US chain coverage thin; crowdsourced long tail with duplicates; verified filter exists but opt-in. https://calorie-trackers.com/reviews/yazio/ , https://nutrola.app/en/blog/is-yazio-still-worth-it-2026

## 5. Targets & tracking
- Calorie target free; custom macro goals Pro; ~12 nutrients on Pro (shallow); fasting integration adjusts daily dashboard/diary around eating window; hydration tracking; "fasting window respects your intake." https://calorie-trackers.com/reviews/yazio/ , https://nutrition-apps-ranked.com/en/reviews/yazio/

## 6. Reports/analytics
- Daily/weekly views; weekly reports on Pro; fasting statistics feeding the weekly report; macro tracking covers protein/carbs/fat/sugar/fiber with daily+weekly views; no protein-distribution view; limited recipe-level macro analysis. https://clinicalnutritionreport.com/reviews/yazio/ , https://calorierankings.com/reviews/yazio/

## 7. GUI layout
- **Diary**: clean, modern, minimal learning curve; meal slots; "design polish consistently above the category average"; the fasting timer and diary coexist so logged meals are visible against the fasting window. https://calorierankings.com/reviews/yazio/ , https://clinicalnutritionreport.com/reviews/yazio/
- **Search**: standard list; European-product first results; barcode icon. **Recipe screens**: curated cards, shopping lists, step-by-step. **IF screens**: protocol templates, timer, fasting stats. Ads on free; Pro removes. https://nutrition-apps-ranked.com/en/reviews/yazio/ , https://calorie-trackers.com/reviews/yazio/

## 8. Privacy/export
- Privacy 78/100 in one scorecard (mid-pack); ads on free tier; EU data protection posture (German company, GDPR); no export differentiator documented; account-based sync. https://calorierankings.com/reviews/yazio/

## 9. Differentiators & steal-worthy
- Differentiators: European DB depth; integrated IF timer; design polish; price (cheapest serious tier at $34.99). https://clinicalappreport.com/en/reviews/yazio/
- **Steal-worthy for PersonalOS:**
  1. **Time-structure as a first-class axis** — the IF timer proves users value meal-time context (fasting window, meal type) beyond raw sums; PersonalOS's mealTypeId + dayKey already model this; quiet on-app-open catch-up nudges are the privacy-safe version of fasting reminders.
  2. **Regional DB depth as a moat** — Yazio wins in Europe by curating local products; PersonalOS's seeded meal types + user-extensible DB should seed *local* defaults per user, not a generic global set.
  3. **Recipe analyzer usability** — "among the most usable in the category"; the copy-in-at-save recipe model must make create→log friction near-zero.
  4. **Anti-pattern to avoid**: hiding macros on the free tier — PersonalOS's macro-gap bar is the core UI; gating it would be self-defeating.
  5. **Anti-pattern to avoid**: aggressive paywalling reputational damage ("synonymous with aggressive paywalling" per Nutrola 2026) — the single-user local app has no equivalent pressure, keep it that way.
  6. **Insight**: fasting windows + calorie tracking in one app reduced app-switching; PersonalOS consolidating journal/habits/gym/nutrition in one app is the same consolidation bet, and the "quiet catch-up nudge on app open" is its privacy-respecting reminder form.

---

# MacroFactor (nutrition angle)

## 1. Overview
- Positioning: algorithmic macro-coaching tracker built by the Stronger by Science team (Greg Nuckols et al.), launched 2021; "the strongest macro-coaching app in the consumer category... the only product whose adaptive calorie engine is clinically reasonable out of the box." iOS + Android only — **no web app**. https://clinicalnutritionreport.com/reviews/macrofactor/ , https://calorietrackerlab.com/reviews/macrofactor/
- Pricing: **no free tier** — 7–14 day trial, then $11.99/mo, $71.99/yr ($5.99/mo effective); price unchanged for six years (unusual); 4.8 stars across 400,000+ users. https://fuelnutrition.app/reviews/macrofactor-review , https://clinicalnutritionreport.com/reviews/macrofactor/
- Popularity: the Reddit-community darling for bulking/macro tracking ("best macro tracker per Reddit 2026"); 90/100 in the Clinical Nutrition Report 2026 cycle. https://clinicalappreport.com/en/reviews/macrofactor/ , https://clinicalnutritionreport.com/reviews/macrofactor/

## 2. Core paradigm
- Manual-entry tracking + **adaptive TDEE engine**: the app estimates your real expenditure from the divergence between logged intake and observed weight trend, then **recalibrates calorie/macro targets weekly at the Check-In**. Starts from a Mifflin-St Jeor-style initial estimate, converges on true expenditure in ~2–3 weeks of consistent logging. https://rdrecommended.com/articles/macrofactor-in-clinical-practice-2026-review/ , https://fuelnutrition.app/reviews/macrofactor-review
- **Three program styles**: Coached (targets fully automated), Collaborative (weekly calorie budget you allocate across days), Manual (full manual control, no auto changes). https://fuelnutrition.app/reviews/macrofactor-review
- **Adherence-neutral philosophy**: missed days assumed as typical intake (not zero); refeeds/diet breaks don't break the math; no streaks, no badges, no judgment — "just useful data, clearly presented." https://fuelnutrition.app/reviews/macrofactor-review , https://fitnesstoolsreviewed.com/app-reviews/macrofactor-review-is-this-nutrition-app-worth-it/
- Five unified logging methods: barcode/label scan, food search, Quick Add, **Describe** (AI photo+text breakdown into editable ingredient entries from the verified DB — April 2025 release), custom foods/recipes. https://help.macrofactorapp.com/en/articles/215-how-to-log-food-in-macrofactor , https://fuelnutrition.app/reviews/macrofactor-review

## 3. Logging flow (deep)
- **The Plate metaphor**: all logging modes funnel into a "Plate" (meal assembly). Add foods from any mode (scan one, search another, quick-add a third) → review the Plate's nutrition banner → "Log Foods" logs the whole meal at once. This is the key speed primitive — you never relaunch the logger between items. https://macrofactor.com/new-food-logger/
- Fast path (single item): Dashboard → "+" → Search → Favorites/Recent/Quick Add row → tap favorite → serving already saved → "Log Foods". Claimed fastest food logger on the market (they analyzed 20 competing loggers). https://help.macrofactorapp.com/en/articles/215-how-to-log-food-in-macrofactor
- **Multi-Add**: on search results, a "+" on each tile adds the default serving directly to the plate without leaving search — the MFP Quick Log pattern, but with the plate for batching. https://help.macrofactorapp.com/en/articles/219-how-to-configure-your-food-logger
- **Serving entry**: custom keyboard for rapid serving selection; favorite weight/volume units pinned (g, oz, lb, ml, cups, tbsp); quantities update the plate live; entries with weight/volume auto-convert to all standard servings. https://help.macrofactorapp.com/en/articles/219-how-to-configure-your-food-logger , https://macrofactor.com/new-food-logger/
- **Favorites with saved serving sizes**: save "16oz latte" and "12oz latte" as separate favorites; tap-to-plate at the saved size. "Hourly go-tos" (smart time-of-day picks) + Latest foods auto-load before you type. https://macrofactor.com/favorite-foods/ , https://help.macrofactorapp.com/en/articles/215-how-to-log-food-in-macrofactor
- **Describe**: photo or text ("two cups of chicken stir fry with rice and broccoli") → app deconstructs into editable ingredient entries from the verified DB, grouped as recipes that can be exploded; still ±6.8% MAPE photo path — fine but not class-leading. https://screensdesign.com/showcase/macrofactor-macro-tracker , https://clinicalnutritionreport.com/reviews/macrofactor/
- Quick Add: ephemeral kcal/macro entry, not saved for future search — "if you expect to log it again, create a custom food or recipe." https://help.macrofactorapp.com/en/articles/215-how-to-log-food-in-macrofactor
- Backdating: log to any day/time via the calendar icon in the logger; timeline supports editing past days. https://help.macrofactorapp.com/en/articles/215-how-to-log-food-in-macrofactor
- Offline: ranked #4 offline (73/100) — decent for home logging, cached recents/custom foods; heavier lifters log mostly from home. https://calorietrackerlab.com/bestof/best-calorie-tracker-offline-no-internet-2026/

## 4. Food database
- USDA + curated submissions (DAI audit: 80% median verified share, provenance visible, user submissions sandboxed); "branded items trace cleanly in our 200-item audit"; breadth trails MFP and Cronometer on regional brands — UK/EU gaps are the most common international complaint. Barcode scan fast with verified-entry prioritization. https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/ , https://clinicalnutritionreport.com/reviews/macrofactor/ , https://calorietrackerlab.com/reviews/macrofactor/

## 5. Targets & tracking
- **Targets are the product**: weekly Check-In adjusts calories/macros from expenditure change + goal rate + smoothing (hedges 500-cal swings to 200–300). Protein scales with body weight ±1–2 g/day per check-in; body-composition category changes adjust protein. Goal ring tracks progress to goal completion date. https://help.macrofactorapp.com/en/articles/222-how-does-macrofactor-make-adjustments-for-a-weight-gain-or-weight-loss-goal , https://macrofactor.com/dashboard-revamp/
- Check-In can be up to 2 days early; check-in day changeable; Fast Check-In mode (skip coaching modules) for advanced users. https://help.macrofactorapp.com/en/articles/124-change-your-check-in-day , https://help.macrofactorapp.com/en/articles/247-introduction-to-check-ins-and-coaching-modules
- Macro UX: "the strongest in the category — daily targets, per-meal breakdowns, ratio sliders, fiber and sugar visibility, trend rather than snapshot." Micronutrients intentionally shallow (~60 nutrients tracked but shallow vs Cronometer). https://calorietrackerlab.com/reviews/macrofactor/ , https://clinicalnutritionreport.com/reviews/macrofactor/
- Weekly intake analytics treat each week as self-contained — no "catch-up" nagging when behind on rate. https://help.macrofactorapp.com/en/articles/222-how-does-macrofactor-make-adjustments-for-a-weight-gain-or-weight-loss-goal

## 6. Reports/analytics
- Dashboard four sections: Nutrition & Targets (week bars, consumed/remaining toggle, Food Log Focus); Insights & Analytics (Expenditure chart — the "how many calories do I burn" number — Weight Trend, Goal Progress); Habits (logging/weighing consistency); Nutrition (nutrient monitoring, top food sources, custom targets). Expenditure history over months shows metabolic adaptation during cuts. No gamification anywhere. https://help.macrofactorapp.com/en/articles/22-get-to-know-your-dashboard , https://fitnesstoolsreviewed.com/app-reviews/macrofactor-review-is-this-nutrition-app-worth-it/

## 7. GUI layout
- **Dashboard**: customizable widget grid; top section = weekly intake bars (tap day → day detail; deselect → week totals); target lines highlight when met; large legible numbers in Food Log Focus. https://macrofactor.com/dashboard-revamp/ , https://help.macrofactorapp.com/en/articles/22-get-to-know-your-dashboard
- **Food logger**: unified interface — toolbar ribbon (Search / Barcode / Quick Add / Library / Describe) + persistent Nutrition Banner (plate totals, swipeable to day-remaining) + Plate below the fold + Actions Sheet; Food Detail View with custom serving keyboard and live day-impact; "optimize for speed" vs "optimize for context" logger modes. https://macrofactor.com/new-food-logger/ , https://help.macrofactorapp.com/en/articles/219-how-to-configure-your-food-logger
- **Food Log (timeline)**: entries by day/hour, edit quantities in place, view nutrient values. **Strategy tab**: New/Edit Goal, New Program, Check-In panel with days-until-next-check-in, goal ring, module cards. **More**: settings depth — toolbar shortcuts, dashboard layout, logger tiles, favorite units. https://help.macrofactorapp.com/en/articles/22-get-to-know-your-dashboard , https://macrofactor.com/dashboard-revamp/
- Clean, calm, ad-free, no upsell friction; "colorful yet adherence-neutral." https://calorietrackerlab.com/reviews/macrofactor/ , https://macrofactor.com/dashboard-revamp/

## 8. Privacy/export
- Data Export: More → Data Management → Data Export (Granular Export per-collection spreadsheets; Quick Export = progress incl. expenditure, weight trend, scale weight, calories, macros, targets, date-ranged). Account & Data Deletion in-app. https://help.macrofactorapp.com/en/articles/68-export-your-data , https://macrofactor.com/privacy/
- Privacy: unified MacroFactor ID (Firebase) across nutrition + workouts apps; data via Apple Health/Fitbit/Google Fit/Health Connect only with grant; data kept until deletion; data portability via spreadsheet generation. No ad partners — subscription-only business model. https://macrofactor.com/privacy/ , https://macrofactor.com/app-personal-data-protection-information/

## 9. Differentiators & steal-worthy
- Differentiators: adaptive TDEE (only consumer implementation worth the name); adherence-neutral philosophy; plate-based logging; evidence-based defaults; paid-only honesty. https://clinicalnutritionreport.com/reviews/macrofactor/
- **Steal-worthy for PersonalOS (this is the most important app for the M3 design):**
  1. **The Plate → Log Foods batch pattern** — the fastest multi-item meal logging in the category; PersonalOS's receipt-line model + batch catch-up flow should adopt "add several rows, log once" as the primary fast path. https://macrofactor.com/new-food-logger/
  2. **Favorites pinned with saved serving sizes** (16oz latte vs 12oz latte as separate entries) — the exact shape of PersonalOS's portionMultiplier×food favorites; "no fiddling with portion sizes each time" is the goal state. https://macrofactor.com/favorite-foods/
  3. **Weekly Check-In as product structure** — a single weekly review moment where targets get updated; PersonalOS's "weekly nutrition check-up (kcal vs target %, protein hit-rate, weekly compliance, one Coach line per strictness)" is this cadence, minus the auto-adjustment (PersonalOS keeps the signed additive rate manual — correct for a privacy-first logger).
  4. **Adherence-neutrality** — missed days = typical intake, no streaks/badges/shame; this validates PersonalOS's zero-XP logging decision and quiet-nudge philosophy; MacroFactor proves engagement survives without gamification.
  5. **Missed-day assumption instead of zero** — "assumes typical intake on missed days so refeeds and diet breaks don't break the math"; directly relevant to PersonalOS's weekly compliance computation (define: missing rows → not counted, not counted as zero).
  6. **Describe/photo → editable DB-backed entries** — MacroFactor refused to ship photo-AI until it resolved against the verified DB (April 2025); this is the honest middle ground between MFP's wild photo guesses and PersonalOS's rejection of the estimated-photo lane — if PersonalOS ever adds photo capture, it must resolve against local rows only, never invented numbers.

---

# Cross-app synthesis for PersonalOS (M3 nutrition scope)

- **Day total = sum of rows** is confirmed as the industry norm (MFP, Cronometer, Lose It, MacroFactor all compute daily totals from logged items; none store day totals). The only edge case: MacroFactor's manual "Nutrition" override on the dashboard (documented to override the day's log — an anti-pattern to avoid). https://help.macrofactorapp.com/en/articles/22-get-to-know-your-dashboard
- **Protein g/kg / phase targets**: Cronometer's keto calculator proves LBM-based protein with fat-as-remainder in production; MyNetDiary AutoPilot proves adaptive adjustment; MacroFactor proves weekly recalibration cadence. PersonalOS's cut 2.0 / bulk 1.8 / maintain 1.6 editable targets sit comfortably within these precedents. https://support.cronometer.com/hc/en-us/articles/33231740763796-Mobile-Keto-Calculator
- **Macro-gap bar**: MFP's "calories remaining" banner, Lose It's under/over number, MacroFactor's consumed/remaining toggle, and Lifesum's meal ratings all validate a live single-line target-vs-consumed display; MacroFactor's "target line highlights when met" is the nicest state treatment. https://macrofactor.com/dashboard-revamp/
- **Provenance is the emerging differentiator**: DAI audit recommends per-entry source flags at point of use; Cronometer (source labels) and MacroFactor (sandboxed submissions) lead; MFP/FatSecret lose trust. PersonalOS's `source` column (with unmissable display) is the right call and was validated by every accuracy study in this report. https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/
- **Offline**: Lose It (cached DB + deferred photo), Cronometer (clean sync), MyNetDiary (offline free plan) show offline is achievable; all are online-first under the hood. PersonalOS's fully-local SQLite model is strictly stronger than anything in this category. https://calorietrackerlab.com/bestof/best-calorie-tracker-offline-no-internet-2026/
- **No push / quiet nudge**: nothing in the category does this (all use push/notification-driven retention); the closest analogues are Yazio's fasting-window-aware diary and MyNetDiary's meal-level carb alerts — both in-app. PersonalOS's on-app-open catch-up nudge is a genuine category gap. https://caleyefit.com/blog/mynetdiary-vs-myfitnesspal-diabetes/
- **Barcode scanning as future item**: MFP (94% hit), Lose It (90%), Cronometer (free, label-autofill → staff queue), fatsecret API (>90% global barcode) all prove barcode is the highest-value logging shortcut; Cronometer's "scan unknown → autofill label → user creates food locally" pattern is the blueprint for a dependency-free local implementation later. https://cronometer.com/blog/log-food-fast/