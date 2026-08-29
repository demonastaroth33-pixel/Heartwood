# NUTRITION-APP RESEARCH — MASTER COMPILE (Aug 2026)

**Super-thorough edition.** The complete cross-industry research base for
**PersonalOS** (private single-user Flutter PWA: journal + habits + gym +
nutrition + coach) — refactor evidence for the M3 nutrition scope,
incorporation candidates, GUI/layout intelligence, and Coach design feed.

> **How to read:** Part 0 = executive summary. Parts 1–6 = cluster
> deep-dives (per-app profiles with GUI detail). Parts 7–11 = convergence,
> GUI compendium, master steal-list, gap analysis. Part 12 = decision-ready
> candidates (N-series). Part 13 = landing map. Part 14 = reference index.
>
> **Citation convention:** `(R01 §MyFitnessPal)` = the app's section in
> `research-nutrition/01-macro-trackers.md` (each carries inline URLs).
> PersonalOS doc refs use real paths (`docs/Roadmap.md`, …).
>
> **Tag legend:** `[M3]`=fits locked M3 scope · `[new]`=new surface ·
> `[coach]`=Coach feed · effort L/M/H.

---

## PART 0 — EXECUTIVE SUMMARY (one page)

**The 12 biggest takeaways from ~400 sources across ~45 apps/topics:**

1. **The entire category is online-first under the hood** — MFP and
   Cronometer both fail new-food searches offline; only Lose It! caches
   enough to match 47/50 common foods in airplane mode. PersonalOS's
   local SQLite model is **strictly stronger than anything in the
   market** — the offline-first constraint is a feature, not a
   compromise. (R01)

2. **Provenance is the 2026 accuracy battleground.** A DAI audit found
   MFP's search for "apple" returns 48 divergent entries (median
   verified share 40%); Cronometer's verified-default canonical DB +
   sandboxed user submissions achieves 98% verified, ~0.9% error.
   PersonalOS's `source` column + no-fake-data rule already enforce the
   winning model. (R01, R02)

3. **The photo-lane rejection is strongly validated.** A 2026
   NIDDK/NIH study of 4 photo apps found calories underestimated
   ~250–345 kcal/meal (~⅓), and photo analysis is structurally
   cloud-bound (Lose It's Snap It ships photos with EXIF/geotags to
   AWS, permits model-training retention). Privacy + accuracy converge
   on "no estimated logging." (R02)

4. **The data-source strategy is settled: seed from USDA FoodData
   Central (CC0) + filtered OpenFoodFacts (ODbL, barcodes), keep user
   foods in a private marked namespace.** FDC is public domain,
   gram-anchored (foodPortions + ~22k FNDDS portion weights — maps 1:1
   onto `portionMultiplier`); OFF is ODbL with massive barcode
   coverage. A single-user app can replicate Cronometer's architecture
   for free. (R02 R1/R2)

5. **Barcode scanning is APPROVED (user, gen-2) and dependency-free on
   Flutter web** — the native `BarcodeDetector` API ships
   enabled-by-default in Chrome 134 (2026, ~94% of Chrome, offline)
   with zxing-wasm as fallback; ML Kit is mobile-only. The docs'
   `source` column already enumerates `scanner` as a producer
   (Roadmap.md:326). IMPORTANT DISTINCTION: the D069 do-not-build was
   the **AI food scanner** (photo estimation — stays rejected,
   evidence-backed); barcode EAN-lookup is a different feature, never
   blocked, now approved. (R02 R6, docs)

6. **MacroFactor's adherence-neutrality validates the zero-XP, quiet-
   nudge design** — no streaks, missed days assumed as "typical
   intake" not zero, weekly Check-In cadence. The subtle detail:
   **weekly compliance math must not count missing rows as zero.**
   (R01)

7. **The plan-is-the-tracker pattern dominates meal-prep apps** (Eat
   This Much, MealPrepPro, JUSTCOOK): logging happens by *confirming
   the plan*, and ETM's lock/swap logic rebalances remaining meals to
   close macro gaps — the exact machinery for the macro-gap bar +
   batch catch-up. (R03)

8. **The pack model (recipe → batch → containers → consume-decrement)
   is wanted but no app ships it fully** — MyMacros+ power users hack
   "portion recipes" to fake packs; Portions' "one-time substitution
   without forking the recipe" is the perfect copy-in-recipe semantic
   for receipt lines. (R03)

9. **MyNetDiary ships PersonalOS's exact target architecture in
   production** — "fix two macros (protein, fat), let carbs flex and
   fill the gaps" is literally the protein g/kg + fat floor +
   carbs-as-remainder design, validated at scale. (R04)

10. **The zero-point/free-foods model is the cluster's best
    simplification AND its most documented failure** — WW's 350+
    ZeroPoint foods cut logging burden but aren't zero-calorie and
    users out-eat budgets. The fix: a small, user-editable,
    **calorie-trivial** free-foods list (preserves macro integrity
    where WW's doesn't). (R04)

11. **The state-conditional reminder is the universal answer to no-push
    coaching** — Simple fires reminders on logged state ("haven't
    logged water → remind"), Lark runs a 24/7 thread, WAG's "pure
    pull" failed until it added radio-silent detection with gentle
    outreach. All three converge on M3's on-app-open catch-up. (R05)

12. **The locked TDEE math is sound; the highest-value upgrade is an
    intake-aware "implied TDEE."** Mifflin is best but ~20–30% of
    individuals off by >10%; Wishnofsky's 7700 is directionally wrong
    for lean users (5,900–7,700+ kcal/kg by body fat); MacroFactor's
    predictor-corrector from intake + 20-day trended weight achieves
    median error ≈108 kcal/100 days. A rule-based offline intake-aware
    model, guarded by logging-completeness gates and capped changes,
    surfaced but NEVER auto-applied, preserves the B4 manual-freeze
    contract. (R06)

---

## PART 1 — METHOD & SOURCE BASE

- **6 parallel research agents**, ~400 distinct sources cited inline
  (official docs, 2026 reviews, peer-reviewed studies, DAI/NIDDK
  audits, developer documentation).
- **Mobbin**: MFP (290 screens), Noom (529), Yazio (276), Lifesum
  (345), Zero (139) + app-index queries — JSON in
  `research-nutrition/mobbin-*.json` (helper `mobbin-query.mjs`).
- Honesty notes: PlanEatMore defunct, PlateJoy shut down July 2025 —
  vendor-extinction warnings for a privacy-first local app.

### The six clusters
| # | Cluster | Report | Apps/topics |
|---|---|---|---|
| 01 | Macro trackers & calorie counters | `01-macro-trackers.md` | MFP, Cronometer, Lose It!, MyNetDiary, Lifesum, FatSecret, Yazio, MacroFactor |
| 02 | Databases, barcode & scanning tech | `02-databases-scanning.md` | OpenFoodFacts, USDA FDC, barcode UX, photo recognition, portion estimation, data quality, ingredient parsing |
| 03 | Meal prep, recipes & packs | `03-meal-prep-recipes.md` | Mealime, Paprika, Eat This Much, PlateJoy, Samsung Food, PlanEatMore, MealPrepPro, FitMenCook, MyMacros+, pack apps |
| 04 | Diet-specific, fasting & glucose | `04-diets-fasting.md` | Carb Manager, Lifesum, MyNetDiary, Zero, Fastic, Levels, Signos, Nutrisense, WW, Glucose Goddess |
| 05 | Behavior & coaching nutrition | `05-behavior-coaching.md` | Noom, WW, Rise, WAG/Macrostax, Simple, Lark, habit-based patterns |
| 06 | Macro science & energy | `06-macro-science.md` | TDEE equations, 7700 kcal/kg, adaptive expenditure, macro distribution, MET accuracy, weigh-in interaction |

---

## PART 2 — CLUSTER 01: MACRO TRACKERS & CALORIE COUNTERS
*(full depth: `research-nutrition/01-macro-trackers.md`)*

### 2.1 Cluster thesis
The giants. 2026 reality: online-first under the hood, provenance-driven
accuracy wars, adherence-neutrality emerging as the trust signal.
PersonalOS's local model + source column + zero-XP is structurally
stronger on every axis that matters for a private user.

### 2.2 App profiles (paradigm · logging flow · GUI · steals)

**MyFitnessPal** — the category giant (200M+ users, largest database).
(R01 §MFP)
- *Paradigm:* barcode-first logging + massive branded database; fast
  path = scan/search → quick-add; premium pushes photo scanning, macro
  coaching, barcode-in-food-search.
- *Logging flow:* barcode scan → food match → serving picker (grams/
  cups/units) → add; search with recent/favorites/frequent; meal
  assignment via meal-type tabs; quick-add for single macros (calories
  only — the accuracy trap).
- *The accuracy problem (2026):* DAI audit — "apple" search returns 48
  divergent entries, median verified share 40%; MFP's own blog admits
  same-food entries disagree.
- *GUI (concrete):* **Diary (home)** = meal slots (Breakfast/Lunch/
  Dinner/Snacks) each with items + per-meal totals; top "Calories
  Remaining" banner (goal − consumed, live); water + exercise
  sections; date arrows for backdating/pre-logging; swipe-left to
  delete; bottom nutrition table. **Search** = search bar; "Best
  Match" row (dietitian-curated, complete servings); green checkmark =
  verified; "Only" (verified filter) + Most Recent/Frequent/All sorts;
  action buttons row (Scan Meal, Barcode, Quick Add — swipe-left to
  reveal); My Meals tab; "+" quick-log per row. **Food detail** = name,
  serving selector, servings stepper, meal assignment, timestamp,
  nutrient panel, favorite star, "Log" checkmark. **Day summary** =
  macro ring/bar + per-nutrient list. Dated UI vs 2024+ competitors;
  persistent ads on free.
- *Steals:* [M3] barcode-first fast path (now approved — R02 R6);
  [M3] recent/favorites/frequent in search; [M3] meal-type tabbed diary
  (matches locked meal types); [coach] the macro-ring day summary;
  ANTI-STEAL: quick-add single-macro logging (the fake-data trap).

**Cronometer** — the gold standard for accuracy. (R01 §Cronometer)
- *Paradigm:* verified-default canonical database (USDA FDC + NCCDB +
  CRDB), user submissions sandboxed behind human curation, per-entry
  provenance tags; 98% verified, ~0.9% error.
- *Logging flow:* search → the canonical entry (verified) → serving
  picker with gram-anchored portions → add; custom foods in a separate
  private namespace.
- *GUI (concrete):* **Diary** = date strip; Diary Groups
  (Breakfast/Lunch/Dinner/Snacks, editable) with + buttons; per-food
  rows with serving/calories; live target bars (calories + macros +
  selected micros) at top. **Search** = tabs (All/Favorites) + filters
  (Source — NCCDB/USDA/etc.), results ranked; keyboard-friendly.
  **Add sheet** = serving dropdown, quantity, diary group, timestamp,
  favorite. **Food detail** = name, SOURCE LABEL, full 84-nutrient
  profile with %DV, deficiencies flagged, provenance visible. "Least
  pretty, most legible."
- *Steals:* [M3] THE architecture to replicate (verified default +
  private namespace + provenance display); [M3] gram-anchored portions;
  [M3] per-entry source flags made visible; [coach] report cards with
  confidence framing.

**Lose It!** — the offline winner. (R01 §Lose It!)
- *Paradigm:* cached DB (47/50 common foods match in airplane mode),
  deferred photo processing, barcode + photo scan (Snap It = cloud —
  privacy deal-breaker for us).
- *GUI (concrete):* **Home/Diary** = daily calorie budget number, meal
  slots with suggested-calorie ranges per meal, quick-add buttons,
  under/over remaining, macro rings + weekly bars, weight/milestones,
  water — "everything on one screen without scrolling." **Search** =
  large food list, quick access to recents, camera button. **Quick
  action menu** = record weight, log exercise, log food, scan
  barcodes. Cleanest onboarding in the category (time-to-first-meal
  <9 min, #1 in beginner tests).
- *Steals:* [M3] offline-cached common-food picker (validates the
  model); [M3] budget ring as day summary; [M3] deferred photo attach
  (log now, photo later) — local camera only, never cloud; [M3] the
  one-screen diary.

**MyNetDiary** — the target-architecture twin. (R01 §MyNetDiary)
- *Paradigm:* diet presets, barcode, photo scan; **"fix two macros,
  let the third flex"** — the exact protein g/kg + fat floor + carbs-
  remainder design, validated in production; cleanest diet-mode
  re-derivation in the field.
- *GUI:* meal-grouped diary with running totals; per-meal carb
  counters; **Carbs Quick View** (see carb count during entry without
  opening the nutrition panel — a fast-path detail); customizable
  dashboard widgets; clean, dated, legible; GLP-1/diabetes dashboards
  with protein-first views.
- *Steals:* [M3] validation of the locked macro architecture (cite in
  docs); [M3] diet-preset switching with clean target re-derivation;
  [M3] Carbs Quick View inline-entry detail; [M3] per-day trend views.

**Lifesum** — diet-plan + habit app. (R01 §Lifesum)
- *GUI:* colorful, illustration-driven, warm; meal slots with
  ratings (green/yellow/red — the moralization anti-pattern); daily
  "Life Score" ring; plan screens with recipes + check-ins; the least
  clinical look in the category.
- *Steals:* [coach] habit-tied nutrition patterns (water, veggie
  servings); ANTI-STEAL: the color ratings + Life Score composite
  (moralization + score framing — both rejected by the discipline).

**FatSecret** — free, database-heavy. (R01 §FatSecret) — food journal +
weight + exercise + community; "feels frozen in 2018"; verification
flag present but easy to miss. Steals: [M3] food journaling with photo
entries (local-only).

**Yazio** — keto/IF focus. (R01 §Yazio)
- *GUI:* clean, modern, minimal learning curve; **the fasting timer
  and diary coexist — logged meals visible against the fasting
  window**; recipe screens with shopping lists; IF protocol templates.
- *Steals:* [M3] recipe + fasting-window coexistence pattern (N-15);
  [M3] recipe screens with full macros.

**MacroFactor (nutrition angle)** — the adherence-neutral gold standard.
(R01 §MacroFactor)
- *Paradigm:* expenditure-driven (R06); food log with NO streaks,
  missed days assumed as "typical intake" not zero, weekly Check-In
  cadence; foods quick-add from history; recent foods as the fast
  path; logo scanning.
- *GUI (concrete):* **Dashboard** = customizable widget grid; weekly
  intake bars (tap day → detail); target lines highlight when met;
  large legible numbers. **Food logger** = unified interface —
  toolbar ribbon (Search / Barcode / Quick Add / Library / Describe) +
  persistent Nutrition Banner (plate totals, swipeable to
  day-remaining) + Plate below the fold + Actions Sheet; Food Detail
  with custom serving keyboard and live day-impact; "optimize for
  speed" vs "optimize for context" logger modes. **Strategy tab** =
  Check-In panel with days-until-next-check-in, goal ring, module
  cards. Clean, calm, ad-free, "colorful yet adherence-neutral."
- *Steals:* [M3] **history/recent-first logging** (your foods = fastest
  path — perfect for a single-user app); [M3] adherence-neutral framing
  (missed rows ≠ zero in compliance math); [M3] persistent nutrition
  banner (the macro-gap bar's home); [coach] weekly Check-In cadence
  (matches M3's weekly check-up); [M3] speed-vs-context logger modes;
  [M3] logo scanning (barcode family).

### 2.3 Cluster synthesis
- Online-first is universal; local-first wins by default for a private
  single user.
- Provenance display is the trust surface (verified/custom badges).
- History/recent-first logging beats search-first for return users.
- Adherence neutrality beats streaks for nutrition (no XP, no shame).
- The one-screen diary + budget ring is the day-summary consensus.

---

## PART 3 — CLUSTER 02: DATABASES, BARCODE & SCANNING TECH
*(full depth: `research-nutrition/02-databases-scanning.md`)*

### 3.1 OpenFoodFacts deep-dive
- ~3M+ products, 180+ countries, community-curated; **ODbL license**
  (attribution + share-alike — manageable for a private app that seeds
  data and credits in-app); nutriments completeness uneven; barcode
  coverage is the strongest open source (70%+ of scanned EANs hit);
  API online; offline packaging = curated subset dumps (OFF 7–8 GB
  parquet full; subsets feasible); quality: user-edited, requires
  verification display. Verdict: OFF = barcode coverage source; FDC =
  canonical macro source.

### 3.2 USDA FoodDataCentral deep-dive
- SR Legacy (~7,800 foods) + Foundation (~250) + FNDDS (~7,000, with
  ~22k portion weights); API + bulk downloads; **public domain (CC0)**;
  gram-anchored portions (foodPortions: "1 cup = 125 g"); macro
  completeness high. Verdict: THE seed source — canonical, licensed,
  offline-packable, gram-anchored.

### 3.3 Barcode UX + tech (R02)
- Scan flow: scan → match → verify → add; speed is the metric;
  product-mismatch handling (wrong EAN → manual search fallback);
  barcode = label-accurate (~±2–5%).
- **Flutter web reality:** ML Kit = mobile-only; native
  `BarcodeDetector` API enabled-by-default in Chrome 134 (2026, ~94%
  of Chrome, offline, NO package needed); zxing-wasm fallback. A
  future scan is dependency-free. **USER DECISION (gen-2): barcode
  scanner APPROVED.** The docs already anticipate it — `source`
  column enumerates `scanner` (Roadmap.md:326). The D069 "AI food
  scanner" do-not-build is the PHOTO-AI scanner only — stays rejected
  (evidence-backed in §3.4); EAN lookup is a separate feature.

### 3.4 Photo recognition — the validated rejection
- 2026 NIDDK/NIH study: 4 photo apps underestimated calories ~250–345
  kcal/meal (~⅓); photo analysis is cloud-bound (EXIF/geotag shipping,
  model-training retention — Lose It's ToS); SnapCalorie's UX =
  "one estimate to accept-or-edit" — estimated numbers presented as
  truth, the exact rejected pattern. Privacy + accuracy converge on
  the rejection; now evidence-backed twice over.

### 3.5 Portion estimation
- Text-based portion input beats image-based aids (evidence: Wiley
  J. Hum. Nutr. Diet. study); hand presets decent at group level;
  camera/AI portion is worst AND privacy-poisoned. FNDDS portion
  weights = the serving reference. The model: store gram reference per
  food, offer unit presets (each carrying grams), `portionMultiplier`
  does the rest.

### 3.6 Data quality (R02)
- "Garbage in garbage out": MFP 40% median verified vs Cronometer
  98%/0.9% error; mitigations = verified-default canonical DB,
  sandboxed user namespace, per-entry provenance, canonical merging.
  PersonalOS's `source` column + no-estimates rule replicate the
  winning model for free.

### 3.7 Ingredient parsing / recipe math
- Whisk pipeline: parse → normalize to grams → per-100g × quantity →
  sum → /servings (solved); ETM's accept-matches confirmation pattern;
  FDC gram weights as the normalization table; human confirms parsed
  lines before save. If an ML parser is ever wanted — DecisionLog +
  dependency question, not M3.

### 3.8 GUI (scan/search/detail)
- Scan overlay → result card (photo + name + serving) → portion
  picker → add; search list with verified badges; food detail sheet
  with per-serving macros + portion stepper; add-to-log with meal-type
  assign; Cronometer's confidence badges = the trust pattern;
  MFP's action row (Scan/Barcode/Quick-Add) = the producer switcher.

### 3.9 Steal-worthy strategy (R02 R1-R6)
1. **R1:** Two-layer data source — FDC (CC0, gram-anchored) + filtered
   OFF (ODbL, barcodes), offline-bundled curated subsets.
2. **R2:** Cronometer architecture — verified canonical + private
   sandboxed user namespace; never let a custom row shadow canonical.
3. **R3:** Provenance tagging + completeness/confidence surfacing at
   point of use (DAI's #1 recommendation, ~zero cost).
4. **R4:** Gram-anchored portion model — gram reference + unit presets
   + portionMultiplier; no photo portion estimation.
5. **R5:** Recipe lane with on-device parse-and-confirm (human always
   confirms parsed lines; FDC grams as normalization table).
6. **R6:** Barcode lane — build branded-product lookup + local-mirror
   plumbing now (approved); camera UI = later DecisionLog item if any
   package needed (BarcodeDetector may avoid it entirely).
   Cross-cutting: reject photo logging permanently (two evidence
   axes); **speed is a feature — <30 s/meal, 2–3 taps to log.**

---

## PART 4 — CLUSTER 03: MEAL PREP, RECIPES & PACKS
*(full depth: `research-nutrition/03-meal-prep-recipes.md`)*

### 4.1 Cluster thesis
The plan-is-the-tracker pattern: logging by confirming the plan;
recipes as copy-in snapshots; packs (prepped containers) wanted but
never fully shipped — PersonalOS's model can own it.

### 4.2 App profiles

**Mealime** — meal plans + recipes + grocery; plan → cook → log flows;
serving scaling, dietary filters. Steals: [M3] recipe → meal → week
structure; [M3] dietary-filtered recipe seeds.

**Paprika** — the recipe manager reference: ingredients as UNPARSED
text, free-form scaling multipliers, pantry/meal plan/grocery
integration; offline-first (a kindred spirit). Steals: [M3] the
copy-in semantic (recipes snapshot at use); [M3] free-form serving
multipliers (portionMultiplier validation); [M3] offline recipe model.

**Eat This Much** — auto meal planning with lock/swap: **logging by
confirming the plan; locked meals rebalance remaining meals to close
macro gaps** (the exact macro-gap-bar machinery). Steals: [M3] plan-
confirm logging; [M3] rebalance-on-swap (macro-gap closure);
[coach] the "remaining meals absorb the gap" logic for batch catch-up.

**PlateJoy** — shut down July 2025 (vendor extinction). Lesson:
local-first + no subscription lock-in = resilience.

**Samsung Food (ex-Whisk)** — recipe + grocery + meal planning;
ingredient parsing; AI features. Steals: [M3] ingredient parsing as a
future; [M3] recipe nutrition per serving.

**MealPrepPro / FitMenCook / MyMacros+** — prep containers, "portion
recipes" hacks (raw weight → servings count) to fake packs — proof the
pack model is wanted but absent. Steals: [M3] the PACK MODEL:
recipe → batch → containers → consume-decrement (never fully shipped —
open territory).

**JUSTCOOK / Portions / Plan to Eat** — prepped-container logging:
Portions' "one-time substitution without forking the recipe" = the
perfect copy-in-recipe semantic for receipt lines. Steals: [M3]
one-time substitution (a meal swap that doesn't rewrite the recipe or
history); [M3] container consume-decrement logging.

### 4.3 Cluster synthesis
- Recipe = snapshot at save (copy-in) — validated everywhere.
- Plan-confirm logging + gap-rebalancing = macro-gap bar + batch
  catch-up machinery.
- The pack model (recipe → batch → containers → consume) is open
  territory PersonalOS can own.
- Vendor extinction is the norm — local-first is the resilience play.

---

## PART 5 — CLUSTER 04: DIET-SPECIFIC, FASTING & GLUCOSE
*(full depth: `research-nutrition/04-diets-fasting.md`)*

### 5.1 Cluster thesis
Simplification patterns (zero-point foods, fasting windows, diet
modes) + the glucose-tracking cautionary. The stealable core: small
free-foods lists, clean diet-mode target re-derivation, fasting-window
awareness for meal templates — and four evidence-backed glucose facts
as Coach lines, never a spike score.

### 5.2 App profiles & patterns

**WW ZeroPoint foods** — 350+ free foods cut logging burden to near
zero; BUT not zero-calorie; users out-eat budgets (WW admits it; only
recently added macros). THE lesson: a small, user-editable,
calorie-trivial free-foods list preserves macro integrity where WW's
doesn't.

**Carb Manager / Lifesum / MyNetDiary diet modes** — preset switching
with clean target re-derivation; MyNetDiary's fix-two-flex-one is the
locked architecture validated (see R01).

**Zero / Fastic** — fasting windows as first-class timers; integration
with meal logs (eating window = when logging counts); window-aware
reminders. GUI: the fasting ring/timer visible against the diary
(Yazio does this best — logged meals coexist with the window).
Steals: [M3] eating-window awareness for meal templates (optional;
in-app only, respects the no-push rule).

**Levels / Signos / Nutrisense (CGM)** — continuous glucose; spikes
visualization; consumer CGM data often outside HIPAA; privacy
concerns; the "spikes are dangerous for healthy people" premise NOT
established by 2026 physician consensus (Johns Hopkins/Mass General
Brigham). Steals: [coach] the four evidence-backed behavioral facts as
Coach lines (food order — veg first, post-meal walking, protein
breakfast, vinegar — 30–40% spike reduction support) as facts-only
tips, NEVER a spike score; no CGM integration.

**Glucose Goddess angle** — same four hacks, evidence-backed but
framing contested; restate neutrally.

### 5.3 Cluster synthesis
- Free-foods list: small + calorie-trivial + user-editable (macro
  integrity preserved).
- Diet modes: clean target re-derivation (fix two, flex one).
- Fasting: window awareness optional, no push.
- Glucose: four behavioral Coach facts, never a score, never CGM.

---

## PART 6 — CLUSTER 05: BEHAVIOR & COACHING NUTRITION
*(full depth: `research-nutrition/05-behavior-coaching.md`)*

### 6.1 Cluster thesis
The coaching evidence: logging IS the intervention (Noom's strongest
outcome predictor = dinner-logging frequency, OR 10.69); state-
conditional reminders are the no-push answer; single-number + band
framing beats composite scores; color-coded food moralization is an
ED-safety flag.

### 6.2 App profiles & patterns

**Noom** — psychology-based: color system (green/yellow/red density),
daily lessons, human coaches, CBT. 2026 RCT outcomes real; the color
system criticized as food-moralization (ED-safety). Steals: [coach]
the density heuristic RESTATED NEUTRALLY (calorie-density facts, not
colors) — "this meal is 2.1 kcal/g — a dense option"; [coach] logging
cadence as the core lever (validate receipt-line logging); NOT the
moralizing colors.

**WW Points** — single-number simplification with a bank that absorbs
off-days silently. Steals: [coach] the budget-bank concept (weekly
flexibility without daily guilt — aligns with weekly check-up
framing).

**Rise Science** — refuses composite scores entirely ("doesn't tell
you what to change tonight"); "under 5 hours, zero is ideal" band
framing. Steals: [coach] single-number + band framing for the weekly
check-up (one number, one band, one actionable line).

**WAG / Macrostax** — coach-client macro coaching; WAG's "pure pull"
failed until it added radio-silent detection with gentle outreach.
Steals: [coach] radio-silent detection = the on-app-open catch-up
nudge (validates M3's quiet meal reminders); [coach] macro coaching as
weekly rhythm.

**Simple** — IF + habit: state-conditional reminders ("if you haven't
logged water, we remind"), directional score instead of calories.
Steals: [coach] state-conditional reminders (in-app, no push);
[coach] directional simplification (band framing).

**Lark Health** — 24/7 AI text coach (CDC DPP). Steals: the concept of
a persistent coaching thread — but as a WEEKLY message (the F-24
pattern), never 24/7 (privacy + quiet-week).

**Habit-based nutrition** — meal-timing consistency, hydration, veggie
servings as habits (meta-analysis evidence). Steals: [M3] veggie
servings + water as habit check-ins inside the nutrition domain
(habits already exist).

### 6.3 Cluster synthesis
- Logging is the intervention → make logging frictionless (already the
  M3 design).
- State-conditional, in-app, radio-silent-aware reminders = the
  no-push coaching answer.
- Single number + band + one actionable line per week.
- No food moralization; density facts restated neutrally.

---

## PART 7 — CLUSTER 06: MACRO SCIENCE & ENERGY
*(full depth: `research-nutrition/06-macro-science.md`)*

### 7.1 TDEE equations
- Mifflin-St Jeor best (validation), but ~20–30% of individuals off by
  >10%; PAL activity multiplier is the biggest error source; the
  locked "manual TDEE override freezes everything" (B4) is validated —
  freezing on manual input is correct because auto-recompute can't see
  activity changes.

### 7.2 The 7700 kcal/kg assumption
- Wishnofsky 1958 origin; varies 5,900–7,700+ kcal/kg by initial body
  fat (Hall's model: leaner people lose MORE weight per deficit);
  CALERIE showed 4,858 kcal/kg at week 4; works operationally on
  TRENDED weight (MacroFactor median error ≈108 kcal/100 days).
- Implication: present as estimate framing; the signed additive rate
  is symmetric by construction — immune to MacroFactor's V3 ~80
  kcal/day asymmetric drift (validates the locked canonical form).

### 7.3 Adaptive expenditure (the key section)
- MacroFactor: predictor-corrector from intake + 20-day trended
  weight; 80–85% logging-completeness gate; capped adjustments; V3
  fixed an ~80 kcal/day asymmetric drift.
- Carbon: simpler weekly check-in loop (rule-based precedent).
- PersonalOS upgrade path: an intake-aware "implied TDEE" insight —
  intake − trend-derived energy balance → expenditure estimate,
  weekly, guarded by logging-completeness gates, capped ±150–250
  kcal/wk, surfaced but NEVER auto-applied (preserves B4). Single
  highest-value M3+ upgrade.

### 7.4 Macro distribution
- Protein g/kg per phase validated (cut 2.0 / bulk 1.8 / maintain
  1.6); fat floor 0.6 g/kg = ~45g @ 75kg, inside the 40–60 g/d
  sex-hormone band; carbs-as-remainder logic sound; per-meal protein
  distribution research supports meal pacing (spread protein across
  meals).

### 7.5 Exercise energy accuracy
- MET method decent for cardio (band estimates); strength estimates
  rough (Nuckols ~6 kcal/min heuristic); **the double-count problem is
  severe** — wrist wearables overestimate EE by 27%+ (up to 93%); PAL
  multipliers already embed exercise; expanding daily targets on
  logged workouts double-counts. THE RULE: the macro-gap bar treats
  exercise kcal as DISPLAY-ONLY, never expands targets (MacroFactor's
  philosophy — validate the NU9 band's "labeled estimate" + display
  role).

### 7.6 Weigh-in/TDEE interaction
- Daily weigh-in ideal, 20-day trend signal; water noise handled by
  trend; the signed-rate model validated vs percentage models.

### 7.7 Steal-worthy (R06)
1. Implied-TDEE insight as the M3+ upgrade (guarded, capped,
   surfaced-only).
2. Error-framing copy for all targets ("estimate ±10%" — honest
   numbers).
3. Per-meal protein pacing guidance (Coach facts line).
4. Exercise kcal display-only (never expand targets).
5. Weekly recompute cadence for TDEE from rolling weight (locked) +
   future intake-aware adjustment.
6. Atwater 4/9/4 constants + MET formulas stay (public, verified).

---

## PART 8 — CONVERGENCE MATRIX (evidence-backed)

| Dimension | Consensus | Best practitioner | PersonalOS status |
|---|---|---|---|
| Fast path to log | History/recent-first > search-first | MacroFactor | LOCKED (receipt lines) — add history-first N-01 |
| Data provenance | Verified-default + source flags | Cronometer | LOCKED (source column) — display it N-01 |
| Offline | Everyone fails except Lose It (partial) | — | LOCKED local-first = stronger than market |
| Serving UX | Gram-anchored portions | FDC/Cronometer | LOCKED (portionMultiplier) — seed grams N-02 |
| Data seed | FDC CC0 + OFF barcodes | — | NEW — N-02 (approved direction) |
| Barcode scanning | Dependency-free on web (Chrome 134) | — | APPROVED (user, gen-2) — N-09; D069 AI-photo stays rejected |
| Photo logging | REJECTED (⅓ error + cloud) | — | LOCKED rejection — validated |
| Adherence neutrality | No streaks, missed ≠ zero | MacroFactor | LOCKED zero-XP — add missed≠zero N-03 |
| Plan-is-tracker | Confirm-the-plan logging + rebalance | Eat This Much | LOCKED (batch catch-up) — extend N-04 |
| Recipe copy-in | Snapshot at use, one-time substitution | Paprika, Portions | LOCKED (copy-in) — validated |
| Packs | Wanted, never shipped fully | — | OPEN TERRITORY — N-05 |
| Free-foods list | WW: powerful + broken; small+trivial+editable | — | NEW — N-06 |
| Target arch | Fix two, flex one | MyNetDiary | LOCKED — validated |
| Reminders | State-conditional, in-app | Simple, WAG | LOCKED (on-app-open) — validated |
| Coaching framing | Single number + band + one line | Rise | LOCKED (weekly check-up) — validated |
| Food moralization | ED-safety flag | Noom | NEVER — neutral density facts |
| Expenditure | Intake-aware, guarded, capped | MacroFactor | FUTURE — N-07 (implied TDEE) |
| Exercise kcal | Display-only, never expand targets | MacroFactor | LOCKED NU9 — make explicit N-08 |

---

## PART 9 — GUI & LAYOUT PATTERN COMPENDIUM (the stealable UX)

### 9.1 The logging flow
- **History/recent-first** (MacroFactor): today's log opens on YOUR
  foods — the fast path is repetition, not search; persistent
  Nutrition Banner (plate totals, swipeable to day-remaining).
- **Search sheet** with recent/favorites/frequent + verified badges
  (Cronometer confidence); MFP's "Best Match" row + verified filter;
  typed-search with instant results.
- **Food detail sheet**: name + per-serving macros + gram-anchored
  portion stepper + meal-type assign; add = one tap; live day-impact
  preview (MacroFactor's custom serving keyboard).
- **Meal-type tabbed diary** (MFP/Cronometer/Lose It): breakfast/lunch/
  dinner/snack tabs — the locked meal types as the diary anatomy; the
  one-screen diary with budget number + rings (Lose It).
- **Producer switcher row** (MFP): Scan / Barcode / Quick Add buttons
  under the search bar — maps to the locked `source` producers
  (manual | scanner | fooddb | packed | scale).
- **Quick-add**: ONLY full-macro quick-add from history (never
  single-macro estimates — MFP anti-pattern).
- **Deferred capture**: "log now, add photo later" — local camera
  only, never cloud (Lose It pattern, privacy-safe).

### 9.2 The day summary
- **Budget ring** (Lose It/MFP): ring of consumed vs target with
  macros — the macro-gap bar's visual home.
- **Remaining display** (macro-gap bar): "protein 168/168g · kcal
  2120/2875" — locked; validated placement + display-only exercise
  kcal.
- **Carbs Quick View** (MyNetDiary): inline carb count during entry —
  the fast-path detail worth copying.

### 9.3 Weekly check-up
- **Check-In card** (MacroFactor): weekly cadence card — kcal vs
  target %, protein hit-rate, compliance with missed-rows-not-zero;
  one number + band + one actionable line (Rise framing).
- **Adherence-neutral tone**: no streak displays for nutrition.

### 9.4 Recipe & meal-plan surfaces
- **Recipe editor**: name, servings, per-serving macros, ingredient
  list (text or future-parsed); copy-in semantics; on-device
  parse-and-confirm (R02 R5).
- **Plan view**: day/week meal grid; confirm-to-log; swap with
  rebalance (remaining meals absorb the gap — ETM).
- **Pack view** (open territory): recipe → batch → containers →
  consume-decrement; container icons with remaining servings.

### 9.5 Trust surfaces
- **Provenance badges**: "verified" / "custom" / "entry source" on
  every food (Cronometer Data Confidence).
- **Estimate framing** on all targets: "±10% estimate" footnotes
  (R06 error-framing).
- **Explanation screens**: tap-to-explain on TDEE, targets, gap bar
  (the show-your-work discipline).

### 9.6 Reminder/coaching surfaces
- **State-conditional catch-up** (Simple/WAG): on-app-open, if a known
  meal window passed unlogged → quiet offer (locked M3 behavior —
  validated).
- **Density facts, neutral** (Noom lesson): "this meal is 2.1 kcal/g"
  — never green/yellow/red colors.
- **Fasting window** (optional): window ring/indicator on the diary
  (Yazio's coexistence pattern) — in-app only, no push.

---

## PART 10 — THE MASTER STEAL-LIST (52 items, tagged & efforted)

### A. Logging UX
1. [M3/L] History/recent-first logging (MacroFactor R01)
2. [M3/L] Recent/favorites/frequent in search (MFP R01)
3. [M3/L] Meal-type tabbed diary (MFP R01 — locked meal types as anatomy)
4. [M3/L] Provenance badges on foods (verified/custom/source) (Cronometer R01)
5. [M3/L] Quick-add only from history with full macros (MFP anti-pattern avoided)
6. [M3/M] Deferred photo attach — local camera only, never cloud (Lose It pattern, privacy-safe R01/R02)
7. [M3/L] Gram-anchored portion stepper (FDC/Cronometer R02)
8. [M3/M] Common-food offline quick picker (Lose It R01)
9. [coach/L] Adherence-neutral day framing — missed rows ≠ zero (MacroFactor R01)
10. [M3/L] Producer-switcher row (Scan/Barcode/Quick-Add → source producers) (MFP R01)
11. [M3/L] Carbs Quick View inline during entry (MyNetDiary R01)
12. [M3/L] Live day-impact preview on the food detail (MacroFactor R01)

### B. Data & accuracy
13. [M3/M] Seed canonical foods from USDA FDC (CC0, gram-anchored) (R02)
14. [M3/M] OFF barcode coverage as the scan source (ODbL) (R02)
15. [M3/L] Private marked namespace for user foods (Cronometer R02)
16. [M3/L] Duplicate/canonical merging discipline (R02)
17. [new/M] Barcode via Chrome BarcodeDetector + zxing-wasm fallback — dependency-free (R02 — APPROVED, user)
18. [M3/L] Estimate-framing copy on all targets (±10%) (R06)
19. [M3/L] Tap-to-explain screens (TDEE, targets, gap bar) (R06/R01)
20. [M3/L] Source display on every receipt line (locked column made visible) (R01/R02)

### C. Targets & math
21. [M3/L] Fix-two-flex-one macro display (validated — MyNetDiary R01/R04)
22. [M3/M] Implied-TDEE insight (intake-aware, guarded, capped, surfaced-only) (R06)
23. [M3/L] Exercise kcal display-only — never expands targets (R06)
24. [M3/L] Weekly TDEE recompute from rolling weight (locked — validated) (R06)
25. [M3/L] Per-meal protein pacing as Coach facts line (R06)
26. [M3/L] 7700 kcal/kg presented as estimate (R06)
27. [M3/L] Symmetric signed rate — immune to asymmetric drift (locked — validated) (R06)

### D. Recipes & plans
28. [M3/L] Copy-in recipe snapshot semantics (validated — Paprika R03)
29. [M3/M] One-time substitution without forking the recipe (Portions R03)
30. [M3/M] Plan-confirm logging + remaining-meals rebalance (Eat This Much R03)
31. [M3/M] PACK MODEL: recipe → batch → containers → consume-decrement (R03 — open territory)
32. [M3/L] Serving scaling with free-form multipliers (Paprika R03)
33. [new/M] Ingredient parsing as a future (Samsung Food R03)
34. [M3/L] On-device parse-and-confirm recipe lane (R02 R5)

### E. Simplification & diets
35. [M3/M] Small user-editable calorie-trivial free-foods list (WW lesson R04)
36. [M3/M] Diet-mode target re-derivation (fix two, flex one) (R04)
37. [M3/L] Eating-window awareness for meal templates — optional, in-app (R04)
38. [coach/L] Four glucose facts as neutral Coach lines (food order, post-meal walk, protein breakfast, vinegar) — never a spike score (R04)

### F. Coaching & behavior
39. [coach/L] State-conditional on-app-open catch-up (validated — Simple/WAG R05)
40. [coach/L] Single number + band + one actionable line weekly (Rise R05)
41. [coach/L] Density facts restated neutrally — no color moralization (Noom R05)
42. [coach/L] Budget-bank framing (weekly flex without daily guilt) (WW R05)
43. [coach/L] Radio-silent detection with gentle outreach (WAG R05)
44. [M3/M] Veggie servings + water as habit check-ins (R05)
45. [coach/L] Logging cadence as the core lever — frictionless logging is the intervention (Noom R05)

### G. Privacy & posture
46. [M0/L] Local-first as the structural differentiator (R01)
47. [M0/L] No cloud photo processing, ever (R02)
48. [M3/L] Vendor-extinction resilience (local + export) (R03)
49. [M3/L] No subscription lock-in for the data (R03)

### H. Documented anti-patterns
50. Single-macro quick-add (MFP) — fake data R01
51. Photo estimation (⅓ error + cloud) — validated rejection R02
52. WW-style unlimited zero-point foods (budget overrun) R04
53. Color-coded food moralization (Noom) — ED safety R05
54. Expanding targets on exercise kcal (double-count) R06
55. Composite coaching scores (Rise says no) R05
56. Counting missed rows as zero in compliance (MacroFactor says no) R01

---

## PART 11 — GAP ANALYSIS vs PersonalOS M3 (ranked by fit)

### 11.1 What PersonalOS has locked (M3)
Receipt-line logging (kcal/protein/carbs/fat + portionMultiplier +
source) · meal types · recipes copy-in · TDEE Mifflin + signed rate
7700 · protein g/kg per phase · fat floor · carbs remainder · macro-gap
bar · weekly check-up (kcal%, protein hit-rate, compliance, one Coach
line) · quiet meal reminders (on-app-open, no push) · batch catch-up ·
backdating dayKey · zero-XP streak · NU9 strength band + cardio MET ·
source column enumerating scanner (Roadmap.md:326).

### 11.2 The gaps — Tier 1 (high fit, cheap, extends locked work)
1. **History/recent-first logging** (MacroFactor) — the fast path is
   your own foods; pure UI over existing rows; the single biggest
   logging-speed win (<30 s/meal is the retention bar).
2. **Provenance badges** (Cronometer) — display the locked source
   column (verified/custom/estimated-flag) per entry; trust surface;
   ~zero cost (DAI's #1 recommendation).
3. **Adherence-neutral compliance math** — missed rows are NOT zero
   (weekly check-up denominator rule; MacroFactor's missed-rows-as-
   typical-intake pattern).
4. **Gram-anchored portion stepper** — serving picker from grams ×
   multiplier; the portionMultiplier UX; FNDDS portion weights as the
   serving reference.
5. **Estimate-framing copy** — ±10% footnotes on TDEE/targets/gap bar;
   honest numbers (R06 error-framing).
6. **Exercise kcal display-only** — make the NU9 display-only rule
   explicit (never expand targets; the double-count evidence is
   damning).
7. **One-tap quick-add from history with full macros** (no single-macro
   estimates).
8. **Free-foods list** — small, user-editable, calorie-trivial (WW's
   model fixed).
9. **State-conditional catch-up framing** — the locked on-app-open
   reminder validated + the missed-rows-never-zero denominator.
10. **Density facts as neutral Coach lines** (kcal/g, no colors —
    Noom's moralization avoided).

### 11.3 Gaps — Tier 2 (high value, more effort)
11. **FDC seed database + private user namespace** — canonical
    public-domain seed (CC0) + OFF barcodes (ODbL) + the Cronometer
    architecture, free (R02 R1/R2).
12. **Pack model** — recipe → batch → containers → consume-decrement
    (open territory; M3-or-M4 scope decision).
13. **Plan-confirm logging + gap rebalance** — extend batch catch-up
    with remaining-meals-absorb-the-gap (ETM).
14. **One-time substitution** — swap a recipe for a meal without
    forking the recipe or rewriting history (Portions).
15. **Diet-mode re-derivation** — clean target re-derivation if phase
    presets ever expand beyond bulk/cut/maintain (MyNetDiary).
16. **Per-meal protein pacing Coach facts** (spread protein across
    meals — R06 evidence).
17. **Eating-window awareness** — optional fasting-window indicator on
    the diary (Yazio's coexistence; in-app only).
18. **Habit-tied nutrition** — veggie servings + water as habit
    check-ins.
19. **Vendor-resilience framing** — export story for recipes/foods
    (local + human-readable).

### 11.4 Gaps — Tier 3 (future, dependency-gated)
20. **Barcode scanning** — APPROVED (user, gen-2); Chrome BarcodeDetector
    + zxing-wasm fallback (dependency-free); FDC gram-anchored data
    ready; D069 AI-photo scanner stays rejected (different feature).
    Build the branded-product lookup + local-mirror plumbing now so a
    future scan hits a local DB (R02 R6).
21. **Implied-TDEE insight** — intake-aware expenditure, guarded
    (completeness gates), capped (±150–250 kcal/wk), surfaced-only,
    preserves B4. Single highest-value M3+ upgrade.
22. **Ingredient parsing** for recipes (future; parse-and-confirm now,
    ML parser = DecisionLog + dependency question).

### 11.5 Explicit no-goes (documented)
- Photo food estimation, ever (⅓ error + cloud — validated twice).
- Single-macro quick-add (fake data).
- WW-style unlimited zero-point foods.
- Color-coded food moralization.
- Expanding daily targets on exercise kcal (double-count).
- Composite coaching scores.
- CGM integration / spike scores.
- Cloud photo processing (EXIF/geotag shipping).
- The D069 AI food scanner (photo estimation) — rejection unchanged.

---

## PART 12 — DECISION-READY CANDIDATES (N-series)

Same pipeline format as C/F-series: `- N-XX NAME (STATUS):` + labeled
chunks. Full detail for the top batch; the rest land in triage.
Every candidate respects: no XP for logging · no push · quiet week
wins · isImported excluded · facts-only Coach · no new deps without
DecisionLog (photo gated; barcode approved — dependency-free path) ·
offline-first · no fake data · show-your-work · one notification/day.

**N-01 HISTORY/RECENT-FIRST LOGGING + PROVENANCE BADGES** · `[M3]` · L
- SOURCE: MacroFactor (R01), Cronometer (R01), DAI audit (R02).
- PROBLEM: the fast path to a logged meal is repetition — search-first
  slows every returning user; trust needs visible sources.
- PROPOSAL: (a) today's log opens on YOUR foods (history/recent/
  favorites) with the persistent nutrition banner; (b) every food row
  and daily total displays a provenance badge (verified/custom/source)
  — the locked `source` column made visible; (c) the producer-switcher
  row (manual | fooddb | packed | scale | scanner) mirrors the locked
  producers.
- CONSTRAINTS: no single-macro quick-add; <30 s/meal target;
  facts-only.
- LANDS: UIUX.md (diary); Database.md (source display); Roadmap M3.

**N-02 USDA FDC SEED + PRIVATE NAMESPACE** · `[M3]` · M
- SOURCE: R02 R1/R2 (FDC CC0; OFF ODbL; Cronometer architecture).
- PROBLEM: a food logger without a seed database is a blank box.
- PROPOSAL: seed canonical foods from USDA FDC (SR Legacy + Foundation
  + FNDDS gram-anchored portions; curated subset fits the PWA);
  OpenFoodFacts filtered subset for barcode coverage (ODbL
  attribution in-app); user foods/recipes live in a separate marked
  private namespace — never shadow canonical rows; provenance tags +
  completeness surfacing (R3).
- CONSTRAINTS: offline-packable subsets; license hygiene (CC0/ODbL
  attribution); no cloud.
- LANDS: Database.md (seed data plan); DecisionLog (D082+ — data
  licensing note); Roadmap M3.

**N-03 ADHERENCE-NEUTRAL COMPLIANCE MATH** · `[M3]` · L
- SOURCE: MacroFactor (R01).
- PROBLEM: the weekly check-up's compliance denominator could count
  missing rows as zero — punishing unlogged days and corrupting the
  picture.
- PROPOSAL: missed rows are "typical intake" (previous-day average or
  excluded), NEVER zero; compliance = logged days' performance vs
  target; no streak displays for nutrition.
- LANDS: CoachSystem.md (weekly check-up); Database.md (denominator
  rule).

**N-04 PLAN-CONFIRM LOGGING + GAP REBALANCE** · `[M3]` · M
- SOURCE: Eat This Much (R03).
- PROPOSAL: the batch catch-up flow becomes confirm-the-plan: a
  template/routine-bound day shows planned meals; logging = confirm;
  a swap rebalances remaining meals so the macro-gap bar closes
  ("remaining meals absorb the gap").
- LANDS: Roadmap M3 (batch catch-up); CoachSystem.md (gap bar);
  UIUX.md (diary).

**N-05 PACK MODEL — RECIPE → BATCH → CONTAINERS → CONSUME** · `[M3]` · M
- SOURCE: R03 (open territory — nobody ships it fully).
- PROPOSAL: a prepped batch (recipe × N servings) produces containers;
  logging a container consume-decrements it; container icons show
  remaining servings; the `packed` source producer (already in the
  locked source column) gets its first-class flow.
- LANDS: Database.md (pack/batch model — schema decision);
  Roadmap M3/M4; UIUX.md (pack view).

**N-06 FREE-FOODS LIST (small, trivial-calorie, editable)** · `[M3]` · L
- SOURCE: WW lesson (R04).
- PROPOSAL: a user-editable list of calorie-trivial foods (e.g.,
  water, black coffee, most vegetables) that skip logging friction —
  NOT zero-point-as-free (WW's budget-overrun failure); each entry
  carries its real (trivial) macros; the list is small and
  user-editable.
- CONSTRAINTS: macro integrity preserved (nothing is actually free);
  facts-only.
- LANDS: UIUX.md (diary); Roadmap M3.

**N-07 IMPLIED-TDEE INSIGHT** · `[M3+]` · M — FUTURE
- SOURCE: R06 (MacroFactor predictor-corrector; Carbon precedent).
- PROPOSAL: intake-aware expenditure estimate — intake −
  trend-derived energy balance → implied TDEE, weekly; guarded by
  logging-completeness gates (80–85%); capped ±150–250 kcal/wk;
  SURFACED but NEVER auto-applied (B4 manual-freeze contract intact).
- REVISIT: M3+ activation; the single highest-value upgrade.
- LANDS: Architecture.md (owner); DecisionLog; Roadmap M3+.

**N-08 EXERCISE KCAL DISPLAY-ONLY (explicit NU9 rule)** · `[M3]` · L
- SOURCE: R06 (double-count evidence; MacroFactor philosophy).
- PROPOSAL: the locked NU9 strength band + cardio MET estimates are
  DISPLAY-ONLY in the macro-gap bar — they never expand daily targets
  (PAL already embeds exercise; wearables overestimate 27%+).
- LANDS: CoachSystem.md (NU9); UIUX.md (gap bar).

**N-09 BARCODE SCANNER — APPROVED (user, gen-2)** · `[M3]` · M
- SOURCE: R02 R6; user approval; docs' source column already
  enumerates `scanner` (Roadmap.md:326).
- PROPOSAL: EAN lookup via Chrome BarcodeDetector (offline, ~94% of
  Chrome) + zxing-wasm fallback — dependency-free on Flutter web;
  lookup against the local OFF/FDC mirror (N-02); scan → match →
  verify → add. DISTINCTION (recorded): the D069 "AI food scanner"
  do-not-build is the PHOTO-AI scanner (estimation) — stays rejected;
  EAN lookup is a different feature, never blocked.
- CONSTRAINTS: on-device only; no cloud; no AI estimation; DecisionLog
  entry records the approval + D069 distinction.
- LANDS: DecisionLog; Roadmap M3; Database.md (barcode lookup).

**N-10 ONE-TIME RECIPE SUBSTITUTION** · `[M3]` · M
- SOURCE: Portions (R03).
- PROPOSAL: swap a recipe for a meal WITHOUT forking the recipe or
  rewriting history — the substitution is a receipt-line event, the
  original recipe untouched.
- LANDS: Roadmap M3 (recipes); Database.md (copy-in semantics).

**N-11 GRAM-ANCHORED PORTION STEPPER UX** · `[M3]` · L
- SOURCE: FDC/FNDDS (R02 R4).
- PROPOSAL: serving picker = unit presets (each carrying gram
  equivalents) × portionMultiplier; text-based portion input (beats
  image-based — evidence); no photo portion estimation.
- LANDS: UIUX.md (food detail); Database.md (gram reference).

**N-12 DENSITY FACTS AS NEUTRAL COACH LINES** · `[coach]` · L
- SOURCE: Noom lesson (R05).
- PROPOSAL: calorie-density facts stated neutrally ("this meal is 2.1
  kcal/g — a dense option"); NO green/yellow/red colors, NO
  moralization (ED-safety), no Life-Score composites.
- LANDS: CoachSystem.md (rule-book); UIUX.md (diary).

**N-13 ESTIMATE-FRAMING + TAP-TO-EXPLAIN** · `[M3]` · L
- SOURCE: R06 (error-framing), R01 (explainers).
- PROPOSAL: ±10% estimate footnotes on TDEE/targets/gap bar;
  tap-to-explain screens on every derived number (show-your-work).
- LANDS: UIUX.md; CoachSystem.md (check-up copy).

**N-14 PER-MEAL PROTEIN PACING COACH FACTS** · `[coach]` · L
- SOURCE: R06 (meal-pacing evidence).
- PROPOSAL: facts-only Coach lines on protein distribution ("protein
  so far: 40g — 60g across the remaining meals keeps the 1.8 g/kg
  pace").
- LANDS: CoachSystem.md (rule-book).

**N-15 EATING-WINDOW AWARENESS (optional, in-app)** · `[M3]` · L
- SOURCE: Yazio/Zero (R04).
- PROPOSAL: optional fasting-window indicator on the diary — logged
  meals visible against the window; in-app only, no push, quiet-week
  aware.
- LANDS: UIUX.md (diary); Roadmap M3.

**N-16 VEGGIE SERVINGS + WATER HABIT CHECK-INS** · `[M3]` · M
- SOURCE: R05 (habit evidence).
- PROPOSAL: veggie servings + hydration as habit check-ins inside the
  nutrition domain (habits already exist; auto-tick patterns apply).
- LANDS: Gamification.md (habits); Roadmap M3.

**N-17 DIET-MODE RE-DERIVATION (future presets)** · `[M3+]` · M — FUTURE
- SOURCE: MyNetDiary (R04).
- PROPOSAL: if phase presets ever expand beyond bulk/cut/maintain,
  clean target re-derivation (fix two, flex one) per diet mode.
- REVISIT: when new phase types are proposed.
- LANDS: Roadmap M3+; DecisionLog.

**N-18 VENDOR-RESILIENT EXPORT** · `[M3]` · L
- SOURCE: R03 (vendor extinction).
- PROPOSAL: human-readable export for foods/recipes (not just the
  backup) — the data-escape story.
- LANDS: Roadmap M3 (export); UIUX.md (settings).

---

## PART 13 — LANDING MAP

| Candidate group | TEMP-PLANNING section | Docs landing | Decision |
|---|---|---|---|
| N-01, N-03, N-06, N-08, N-11, N-13, N-18 | Incorporate list (LOCKED batch) | UIUX.md (diary), Database.md (denominator rule, gram refs), CoachSystem.md (check-up), Roadmap M3 | D082+ |
| N-02, N-05, N-10 | Incorporate list (LOCKED batch) | Database.md (seed data, pack model, substitution), Roadmap M3/M4 | D082+ |
| N-04 | Incorporate list | Roadmap M3 (batch catch-up), CoachSystem.md (gap bar) | D082+ |
| N-12, N-14, N-15, N-16 | Incorporate list | CoachSystem.md (rule-book), Gamification.md (habits), UIUX.md | D082+ + rule-book |
| N-09 barcode | APPROVED (user, gen-2) | DecisionLog (approval + D069 distinction), Roadmap M3 | D082+ entry |
| N-07, N-17 | M3+ future (SKIPPED for now) | Architecture.md (owner), DecisionLog | activation at M3+ |

---

## PART 14 — REFERENCE INDEX

**Deep-dive reports** (`research-nutrition/`):
- `01-macro-trackers.md` — MFP, Cronometer, Lose It!, MyNetDiary,
  Lifesum, FatSecret, Yazio, MacroFactor
- `02-databases-scanning.md` — OFF, USDA FDC, barcode, photo, portions,
  quality, parsing (incl. R1-R6 recommendations)
- `03-meal-prep-recipes.md` — Mealime, Paprika, ETM, PlateJoy, Samsung
  Food, MealPrepPro, FitMenCook, MyMacros+, pack apps
- `04-diets-fasting.md` — Carb Manager, Lifesum, MyNetDiary, Zero,
  Fastic, Levels, Signos, Nutrisense, WW, Glucose Goddess
- `05-behavior-coaching.md` — Noom, WW, Rise, WAG/Macrostax, Simple,
  Lark, habit patterns
- `06-macro-science.md` — TDEE, 7700, adaptive expenditure, macros,
  MET, weigh-in

**Mobbin data** (`research-nutrition/mobbin-*.json`): MFP (290
screens), Noom (529), Yazio (276), Lifesum (345), Zero (139); helper
`mobbin-query.mjs`.

### Mobbin dataset map (pipeline-draftable design references)
VERBATIM-CRITICAL: drafters copy the FILE PATHS + screen counts
exactly (never inline JSON). Each dataset serves the listed M3
surfaces; N-candidate LANDS carry per-candidate refs at triage.

| Dataset (file) | App | Screens | Serves (M3 surface / candidates) |
|---|---|---|---|
| `research-nutrition/mobbin-screens-mfp.json` | MyFitnessPal | 290 | Diary anatomy (meal-type tabs), search sheet, food detail, macro ring (N-01, N-11) |
| `research-nutrition/mobbin-screens-noom.json` | Noom | 529 | Check-in + lesson surfaces, density display patterns (N-12 — neutral restatement) |
| `research-nutrition/mobbin-screens-yazio.json` | Yazio | 276 | Meal-plan/recipe surfaces, fasting window patterns (N-15) |
| `research-nutrition/mobbin-screens-lifesum.json` | Lifesum | 345 | Habit-tied nutrition, weekly review surfaces (N-16) |
| `research-nutrition/mobbin-screens-zero.json` | Zero | 139 | Fasting window ring/timer patterns (N-15) |
| `research-nutrition/mobbin-query.mjs` | — | — | Query helper for future mobbin pulls |

**PersonalOS docs referenced:** Roadmap.md (M3; source column :326;
D069 :1042), Database.md (schema), CoachSystem.md (weekly check-up,
rules), Gamification.md (zero-XP, habits), UIUX.md (diary), DecisionLog.md (D082+), TEMP-PLANNING.md (N-series triage).