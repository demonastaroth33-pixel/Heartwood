# Cluster 03 — Meal planning, recipes & prep apps (research report)

Target: PersonalOS nutrition scope (M3) — per-meal receipt-line logging with
portionMultiplier, seeded + user-extendable meal types, copy-in recipes, meal
templates/routines (R1-R12), macro-gap bar, batch catch-up, quiet in-app meal
reminders. Constraints: offline-first, privacy-first, no XP for logging.

Method: 25+ web searches + direct fetches of official docs/reviews, current
2026 state. ~55 distinct sources cited inline. Apps: Mealime, Paprika Recipe
Manager, Eat This Much, PlateJoy, Samsung Food (ex-Whisk), PlanEatMore,
MealPrepPro, FitMenCook, MyMacros+, plus the "pack"/prep-container concept
(JUSTCOOK, Portions, Plenish, Plan to Eat leftovers/frozen tracking).

---

## 1. Mealime

### 1. Overview
Recipe-library meal planner for busy singles/couples/families; "plan the week,
get an aisle-sorted grocery list, cook in ~30 min". iOS/Android (web version
"almost read-only" — you cannot search recipes or add grocery items on web).
Free tier + Pro $2.99/mo (in-app, older pricing) raised to $5.99/mo / $49.99/yr
in 2026; Pro unlocks full recipe library, nutrition data, calorie/macro filter,
recipe notes, plan history, grocery-delivery integrations. 1,200+ curated
recipes, 5M+ users, 4.8★ App Store. Acquired by Albertsons 2022; since then
updates = new recipes + bug fixes ("maintenance mode"; no AI features).
Sources: https://thesunrisedigest.com/eat/mealime-review-2026/,
https://www.mealime.com/, https://apps.apple.com/us/app/mealime-meal-plans-recipes/id1079999103,
https://mealthinker.com/blog/mealime-alternative, https://eathealthy365.com/a-breakdown-of-mealime-meal-plan-pricing/,
https://mealfan.com/best-meal-planning-services/, https://marlvel.ai/apps/com-mealime-mobile-app

### 2. Core paradigm
recipe → week plan (you pick from curated library filtered by diet/allergies/
dislikes) → consolidated grocery list → step-by-step cooking. There is no
logging at all — Mealime is a planner, not a tracker; users pair it with
Cronometer/PlateLens. No pantry awareness, no memory of what you cooked; every
week starts from zero.

### 3. Recipe model (deep)
- Ingredient entry: no user ingredient parsing — everything is curated. Users
  cannot add recipes at all (a widely requested missing feature).
- Serving scaling: the most criticized limit. Serving sizes come in increments
  of 2 (2 or 4 only) — no 3, no 5, no arbitrary amounts. MealThinker reviewer:
  "Serving sizes come in increments of 2… If you're cooking for five people, or
  meal prepping for the week, you're out of luck." The "1,200 recipes" pool
  shrinks fast after filtering + excluding meals already cooked this month.
- Nutrition: kcal/macros/micros per recipe (Pro-only). Nutrition data paywalled
  behind Pro since 2026 restructure.
- Copy/edit semantics: recipes are fixed; users can add per-recipe notes (Pro)
  but cannot fork/modify.
- Multi-user: household size is an input at plan generation; no per-person
  profiles.

### 4. Meal planning
Fastest in category: opening app → week's dinners planned in under 3 minutes.
Plan = list of chosen recipe cards for the week; you swap individual meals.
Dietary preference handling incl. multi-preference households (one veg, one
omnivore); 119 individually dislikable ingredients; allergy filters. Pro adds
calorie-customization filters and past-plan history ("greatest hits" weeks).

### 5. Prep & packs
None, beyond scaling to 4 servings. Reviewer note: no leftovers, no batch
cooking, no "what's already in the kitchen".

### 6. Grocery
The signature feature: all chosen recipes' ingredients merged into one list
grouped by store aisle (produce, dairy, meat, pantry, frozen), which measurably
reduces backtracking and duplicate buys (~8-12% less waste, ~10% less spend in
one 4-week test). Pro: send to Instacart/Amazon Fresh/Walmart/Kroger. Grocery
handoff is the adherence engine — the plan's payoff is a list you can execute.

### 7. GUI layout
- Onboarding: personalization screens (diet type, allergies, 119 dislikes,
  household size). Plan screen: horizontal week strip; each day = recipe card
  (photo, name, tag); tap card → recipe detail (ingredients, steps, nutrition
  if Pro). Grocery list: aisle-grouped checklist with tap-to-check. Cooking
  mode: step-by-step, hands-free (screen stays awake), ingredients checked off.
- Known complaints: steps over-described/out of order; some ingredients lack
  amounts; app "too big" to fit large phones in shop-online flow; ads in free.

### 8. Differentiators & steal-worthy
- Curated-minimalism: doing one job (plan+shop) well, no feature creep — a
  strong counterpoint to PersonalOS scope discipline.
- Aisle-grouped consolidated list with quantities summed across recipes
  (Paprika-style, see below) — proven adherence + waste lever.
- Week template = implicit: "7 dinners + grocery" — PersonalOS R1-R12 templates
  should ship this as the default shape.
- Paywalling nutrition data is a widely felt pain point — PersonalOS nutrition
  should never be gated.

---

## 2. Paprika Recipe Manager

### 1. Overview
One-time-purchase recipe manager + meal planner + grocery list. Apps sold per
platform (iOS, Android, Mac, Windows; each version sold separately); Android
free tier limited to 50 recipes + no cloud sync. Local-first: "All of your data
is stored locally. No internet connection is required to view your recipes."
Cloud Sync is an optional backup/multi-device layer (its own account, not
iCloud). 4.8★ App Store. The gold standard for recipe capture/scaling; offline
by design — closest architectural cousin to PersonalOS.
Sources: https://www.paprikaapp.com/, https://www.paprikaapp.com/help/ios/ (full guide),
https://www.paprikaapp.com/help/mac/, https://www.paprikaapp.com/help/android/,
http://www.paprikaapp.com/windows/, https://apps.apple.com/us/app/paprika-recipe-manager-3/id1303222868,
https://play.google.com/store/apps/details?id=com.hindsightlabs.paprika.android.v3,
https://eathealthy365.com/is-the-paprika-recipe-manager-worth-it/,
https://paprikaapp.zendesk.com/hc/en-us/articles/9589428844567-What-s-New-on-Mac-Paprika-3,
https://github.com/aarons22/paprika-tools/blob/main/openapi.yaml

### 2. Core paradigm
recipe (captured from web or manual) → optional meal plan (day/week/month
calendars) → grocery list (consolidated by aisle) → cook mode (cross-off
ingredients, highlight steps, timers). Menus = reusable groups of recipes
(multi-day meal templates). Pantry tracks what you own; pantry items are
auto-unchecked when adding recipes to the grocery list.

### 3. Recipe model (deep)
- Ingredient entry: built-in browser + Download button parses name, ingredients
  (with exact quantities), directions, nutrition, comments from hundreds of
  sites; manual clipboard tools as fallback; manual entry is free text per
  line. **Critical: ingredients are NOT structured** — Paprika stores each
  ingredient as a text blob and parses `quantity unit ingredient` on the fly
  for scaling/grocery math (confirmed by paprika-recipes tool: "ingredient
  amounts are not parsed… Paprika stores ingredients as a single blob of text").
  Ingredient headings by ending a line with a colon ("Sauce:"). NLP parsing is
  English-only; aisle assignment English-only.
- Serving scaling: Scale & Convert popover; scale by whole number, decimal, or
  fraction (ex: 3, 0.25, 1/3), arbitrary percentages, and quantity ranges with
  en dash ("1-2 cups"); scaled amounts feed the grocery list unchanged; unit
  conversion metric↔imperial per-recipe. Scaling preserves alternative
  measurements ("1 cup (200g)") and case-sensitive units (1t vs 1T); scale
  state syncs across devices.
- Nutrition: free-text "Nutritional Info" field captured from sites that
  provide it — **not computed from ingredients**. No macro math.
- Copy/edit semantics: recipes are editable in place; a Duplicate action
  creates a copy (snapshot) — the copy-in primitive. Recipe linking via
  `recipe:Name` in text. Deleted recipes go to a Trash (soft delete).
- Multi-user: personal library; sharing via .paprikarecipes email/AirDrop
  import, or a shared Cloud Sync account.

### 4. Meal planning
Daily/weekly/monthly calendar views (segmented control). Add meal via wizard
(Recipe | Note | Menu → date → meal type Breakfast/Lunch/Dinner/Snack or custom
meal types — users can add/rename/reorder meal types). iPad drag-and-drop from
recipe sidebar onto days or into meal-type rows. Edit mode: drag handles move
meals between days/types; Move/Copy to another date; change meal type via label
button. **Menus**: reusable multi-day structures — set Number of Days (e.g. 7),
each day is a Day-1…Day-N heading, fill recipes per day, then "Add Menu to
planner" picks a start date and fills the calendar — an exact R1-R12
template mechanism (Paprika calls menus "reusable weekly meal plans").

### 5. Prep & packs
No batch/prep layer. Closest: menu = a whole week's structure you can reuse
for recurring prep weeks; pantry + grocery-list interplay; scale-to-4 for
batch cooking. No container/pack logging.

### 6. Grocery
Add recipe → ingredient picker (check/uncheck per ingredient; pantry items
pre-unchecked) → list consolidates similar items with quantities summed
(`2 eggs` + `3 eggs` = `5 eggs`, displayed with ⊕; consolidation toggleable)
→ aisle-sorted (custom aisles, reorderable) or recipe-sorted → check off →
"Move to Pantry" (all/purchased only) tracks ownership; export to Reminders/
email/print; Siri "add milk to my grocery list in Paprika". Multiple named
lists supported.

### 7. GUI layout
- Side panel: Recipes, Browser, Groceries, Meals, Pantry, Menus, Settings.
- Recipe list: category pane left + list/grid right; search by name/ingredient/
  directions/source; sort by name/rating/most-recent.
- Recipe detail (iPad): ingredients left column, info (name, difficulty,
  servings, prep/cook/total, rating, categories, source, notes) near top,
  directions right; nutrition below ingredients; photos gallery; Scale &
  Convert popover under Ingredients heading with current-scale badge.
- Cook mode: tap ingredient to cross off; tap step to highlight; detected
  times highlighted → tap to start timer; pinned recipes keep cross-off state.
- Meal planner: segmented Daily/Weekly/Monthly; + wizard; edit mode with drag
  handles; Actions (add to grocery, export to Calendar, email, print).
- Menus screen: menu list + day headings inside; + adds recipe/note per day.

### 8. Differentiators & steal-worthy
- **Scale = free-form multiplier (fraction/decimal/%) preserved through
  grocery list** — the portionMultiplier math PersonalOS needs (a `scale`
  field exists in the sync schema: string, nullable).
- **Menus (multi-day templates) with start-date application** — the direct
  blueprint for R1-R12 routine templates.
- **Duplicate action = copy-in recipe semantics**; editable-in-place default.
- **Ingredients-as-text + on-the-fly parsing**: zero-structure capture is why
  web import is so robust; PersonalOS copy-in of receipt lines can store raw
  text + parsed structure.
- **Pantry auto-uncheck on grocery add** — frictionless inventory integration.
- Custom meal types (add/rename/reorder) — matches PersonalOS seeded +
  user-extendable meal types.

---

## 3. Eat This Much (ETM)

### 1. Overview
Automatic meal planner driven by calorie/macro targets. Set 1,800 kcal, 120 g
protein, no nuts, ≤30 min prep → algorithm generates a day (free) or a week
(Premium ~$5/mo annual, $14.99 monthly) of meals. 6,000+ recipes, 1,000,000+
foods database, 4.7★ iOS / 4.6★ Android. Launched 2014. Barcode scanning food
logging built in ("when life happens"). Privacy-relevant detail: the Android
app computes plans deterministically on-device (ILP solver, locally cached
USDA SR Legacy + NIH FNDDS v5.1, no cloud AI inference) — "100% offline
accuracy from deterministic constraint solving". MFP sync via OAuth delta sync.
Sources: https://www.eatthismuch.com/how-it-works/, https://www.eatthismuch.com/meal-planner/,
https://www.eatthismuch.com/macro-tracker-app, https://www.eatthismuch.com/how-to/,
https://www.promealplan.com/en/blog/eat-this-much-review-2026,
https://www.pann-app.com/blog/eat-this-much-review,
https://lifetips.alibaba.com/tech-efficiency/eat-this-much-brings-automatic-meal-planning-to-android

### 2. Core paradigm
targets (nutrition profile: kcal, g carbs/fat/protein, min fiber, max sodium/
cholesterol) → constraint-solver generates meals per slot (breakfast/lunch/
dinner/snack layout customizable) → lock/favorite meals, swap/regenerate others
and the solver rebalances the remaining slots to still land on targets →
grocery list auto-synced to plan → pantry deducts as you eat. "The plan is the
tracker": if you follow it, intake is already logged; you only log deviations.

### 3. Recipe model (deep)
- Ingredient entry: curated DB (foods searchable, 14 nutrient fields per food,
  per-gram basis internally: kcal/g, protein/g, net carbs/g, fiber/g, sat fat/g,
  sodium/mg). Users can create custom foods (nutrition entered per serving
  name) and custom recipes.
- Serving scaling: portion sizes and per-meal calories are solver outputs;
  changing a meal's servings triggers **nutrition-aware regeneration** — e.g.
  if the day is at 1,800/2,000 kcal and you refresh a 200-cal meal, the new
  suggestion lands ~400 cal to close the gap.
- Nutrition: authoritative curated data ("not unverified user-submitted
  entries"), USDA-based; per-serving and per-meal; net-carbs convention for
  keto/diabetic users.
- Copy/edit semantics: foods/recipes are snapshot entities; the generator
  composes them per plan. Editing a food changes future generations, not past
  plan rows (plans are regenerated, not rewritten) — effectively copy-in.
- Multi-user: personal; Premium adds multi-person household plans (Android
  premium tier).

### 4. Meal planning
- Weekly generator auto-runs the day before your grocery day, so you review
  Monday's plan on shopping day; manual "Regenerate entire week…" anytime.
- Recurring Foods: set a food to recur "often" or "always"; per-meal checkbox
  "Only use recurring foods for this meal" forces the generator to use your
  subset — an explicit template/routine primitive.
- Per-day targets (carb cycling, refeed days) — different macros per weekday.
- Locking: lock a meal you like; solver reshuffles the rest and rebalances.
- Ratings teach preference ("more of / less of"); ingredient blocklists.
- Known weaknesses: repetition by week 3-4; plans can read like "foods to
  assemble"; cooking instructions are thin (it decides, doesn't guide).

### 5. Prep & packs
No prep containers. But pantry is consumption-aware: "Foods will be removed
from the pantry the day after you're supposed to have eaten them (either
automatically when the weekly generator runs, or if you hit 'update pantry')";
"when you go grocery shopping and add foods to your pantry, the planner will
automatically deduct ingredients from the pantry as you eat them"; meals
viewable by "which you can make with your pantry" and drag+drop into plan.
This deduct-as-consumed model is the inventory half of the pack concept.

### 6. Grocery
Plan → grocery list auto-syncs on every meal swap; aisle-grouped; pantry
check-off (items you own pre-marked); delivery via Instacart/AmazonFresh
(Premium). Known issue: weekly lists can run near 2× the app's cost estimate
(each meal pulls different ingredients).

### 7. GUI layout
- Planner view: list of day cards, each with meal rows (name, photo, kcal);
  per-row buttons: swap (regenerate one meal), lock, "List alternative meals"
  (web), delete; day totals bar with targets.
- Nutrition Profile editor: kcal + grams or % macros + min/max extras; opens
  the calorie calculator (Mifflin-St-Jeor BMR × activity; 20% deficit / 15%
  surplus suggestions).
- Grocery list page: grouped by aisle, "Update pantry" button; Stats & progress
  page: adherence vs targets over time; Food Bank: search foods/recipes,
  Pantry tab showing what you have, recurring foods management.
- Mobile: barcode scanner, recipe viewing, plan adjustment — "the whole
  workflow runs from your phone".

### 8. Differentiators & steal-worthy
- **Gap-filling regeneration**: regenerate one meal → solver rebalances the
  rest to hit the day's targets. This is the macro-gap bar + batch catch-up
  logic in one: PersonalOS's catch-up ("log missed meal as planned") should
  rebalance remaining meals to close the gap.
- **Per-day nutrition profiles (carb cycling)** — day-level target variance,
  not just a single daily target.
- **Recurring foods + "only use recurring for this meal"** — template-lite:
  a routine expressed as a forced meal pool, applicable to R1-R12.
- **Pantry deducts as eaten, day-after automatic** — the "plan-implied
  consumption" pattern; for packs: eating a planned pack = container
  decremented automatically.
- Deterministic on-device solving = offline-first credibility (no cloud
  dependency for plan math).

---

## 4. PlateJoy

### 1. Overview
"Personal meal planning assistant": deep personalization quiz → nutritionist-
designed plans + smart grocery lists. iOS/Android/web. Pricing: $12/mo, $69/6
mo, $99/yr (~$8.25/mo); 10-day trial; no free tier. 14+ diets (vegan, keto,
paleo, Mediterranean, low-FODMAP, diabetic-friendly, kosher, low-sodium,
pregnant/nursing). **SHUT DOWN: app removed from Google Play March 2025,
service closed 1 July 2025, platejoy.com no longer resolves (2026); recipes
folded into the Wellos app.** Included here as the cautionary tale + the
strongest "batch meals" precedent.
Sources: https://www.deliveryrank.com/reviews/platejoy,
https://www.frugalforless.com/platejoy-review/, https://mealfan.com/best-meal-planning-services/,
https://mealthinker.com/blog/platejoy-alternative, https://swoodie.app/blog/mealime-vs-platejoy-vs-swoodie-2026,
https://www.fitness-reviewed.com/categories/meal-planning-apps/,
https://www.garagegymreviews.com/platejoy-review, https://hiwavemakers.com/blog/ai-meal-planning-apps-families-2026-comparison/

### 2. Core paradigm
50+-question onboarding quiz (dietary restrictions, medical conditions, family
size, cooking skill, appliances owned, time budget, disliked ingredients incl.
write-ins) → algorithm filters a fixed recipe DB → weekly plan → auto grocery
list (Instacart/Amazon Fresh handoff) → pantry tracking week to week (incl.
past Instacart orders). Calories/macros visible per day if you use PlateJoy for
all meals, but you cannot customize recipes to macro ratios. No logging of
off-plan meals.

### 3. Recipe model (deep)
- All recipes dietitian-designed/curated (RD-reviewed DB) — "most medically
  reliable option" per family-planning comparison; user-contributed data
  absent, which its reviewers valued (Harvard study: user-submitted recipe
  calories off by 15-30%).
- Nutrition: per-recipe + daily totals; macro caps on low-carb/paleo plans.
- No user recipe entry/editing; personalization via filters and "Use Up
  Ingredients" + marking recipes "not used".
- Copy/edit semantics: static DB; quiz answers editable; preference learning
  from accept/reject.
- Multi-user: household profile; partners held separate accounts (no joint
  generation); per-person profiles in family plans.

### 4. Meal planning
Plans organized into Breakfast, Lunch, Dinner, Snacks & desserts, and —
notably — **Batch meals** (a first-class meal-type slot for batch cooking).
Weekly plan generated from profile; "Use Up Ingredients" mode schedules meals
around what's already in the pantry; pantry-aware pairing ("pairs meals with
similar ingredients to minimize what you buy"); calendar sync to
Outlook/Google/iCloud; batch cooking guidance (cook a week's meals ahead,
freeze).

### 5. Prep & packs
Batch meals category + batch-cook/freeze guidance + pantry tracking. No
container-level logging — the "Batch meals" meal type is the notable idea:
batch cooking gets its own planning slot rather than being bolted on.

### 6. Grocery
Auto list from menu; "Send to Instacart" button at top of list (web only —
app does not sync with Instacart); pantry-aware subtraction; claims
measurable waste/spend cuts (test households: 12-18% fewer items per trip when
shopping from a generated list; one user $200/mo savings). Post-acquisition
bug: recipe/list ingredient mismatches (unfixed, pre-shutdown).

### 7. GUI layout
- Onboarding: page-by-page quiz — meat level slider (vegan→no restrictions),
  dietary needs, ingredient-avoid list (pre-filled common allergens + raw
  onion, cilantro, spicy; write-ins), appliance icons (food processor, Instant
  Pot, stovetop, blender), goals.
- Recipe browse: recommended recipes grouped by meal-type headers (Breakfast/
  Lunch/Dinner/Snacks/Batch meals); tap to add to menu.
- Menu: weekly grid of chosen recipes; settings → Meal Preferences (portions,
  goals); My Ingredients list; My Table for household members.
- Grocery: aisle list + purple "Send to Instacart / Amazon Fresh" button.

### 8. Differentiators & steal-worthy
- **Batch meals as a first-class meal slot** — directly informs PersonalOS
  meal types + pack workflows.
- **Use Up Ingredients / pantry-first planning** — plan around what exists
  before generating grocery needs.
- **50-question quiz ceiling**: static personalization rots; quiz answers
  can't track evolving taste — a caution for PersonalOS's seeded defaults
  (must be user-editable, extendable, and must not become a one-time contract).
- **Shutdown lesson**: a closed personal-data service destroys user trust and
  work; offline-first local storage (PersonalOS) is the counter-position.
- RD-reviewed curated data quality is a trust differentiator — seed PersonalOS
  recipe nutrition carefully and label sources.

---

## 5. Samsung Food (ex-Whisk)

### 1. Overview
All-in-one recipe hub + meal planner + smart shopping list, built on Whisk
(acquired 2019 by Samsung, relaunched 2023 as Samsung Food; 104 countries, 8
languages, 240,000+ recipes (124,000 fully guided), 6M+ users by 2024). Free
with ads; Food+ $6.99/mo or $59.99/yr (removes ads; unlocks AI-personalized
plans, recipe customization, pantry automation, Vision AI, SmartThings
appliance integration). 4.8★ App Store. The category's best free web-import +
grocery merge.
Sources: https://home-cooks.co.uk/pages/review-whisk, https://www.pann-app.com/blog/samsung-food-whisk-review,
https://www.plantoeat.com/blog/2026/01/samsung-food-review-pros-and-cons/,
https://samsungfood.com/, https://www.savortheapp.com/blog/food-tracking-apps/samsung-food-app-review/,
https://www.androidauthority.com/samsung-food-3517054/, https://mindwobble.com/software/samsung-food-app-smart-meal-planning-and-recipe-manager/,
https://www.blinner.com/WhatsCookingBlog/we-tried-whisk-so-you-dont-have-to-an-honest-meal-planner-review

### 2. Core paradigm
save recipes from anywhere (browser extension/paste/share → structured fields:
ingredients, steps, photo, cook time, nutrition) → organize in collections →
drag recipes onto a 7-day calendar (3 meals + snacks per day) → one-tap smart
shopping list (merged, de-duplicated, aisle-grouped) → cook mode (site
redirect, step-by-step, or AI Smart Cook Mode). Community layer: feeds,
collections, "mark as cooked + notes", likes/reviews per recipe. Food+ adds
AI weekly plans, Vision AI (photo ingredient scan → pantry update + recipe
suggestions), pantry/food-list automation, appliance handoff (send preheat +
cook time to Bespoke ovens).

### 3. Recipe model (deep)
- Ingredient entry: best-in-class web import ("strips out the recipe cleanly…
  pieces apart ingredients, method, description, cooking time into individual
  fields"); strict-metric unit conversion at tap; manual Recipe Builder exists
  but is "an afterthought" (platform is import-first). Recipe editing is
  clunky ("swap ingredients, adjust instructions… feels like more effort than
  it's worth") — a known pain point.
- Serving scaling: scale servings 4→8 recalculates all quantities
  automatically; planning the same recipe multiple times in one week auto-
  adjusts the shopping list for larger total quantities (batch-cook pattern).
- Nutrition: per-recipe nutrition + Health Score (0-10 nutrient-density
  score) + macro dashboard; imported-recipe nutrition "not always accurate…
  double-check everything" (known weakness).
- Copy/edit semantics: recipes are saved snapshots; you can note when you've
  cooked something and roughly how many servings are left (planning aid, not
  a logger); Food+ recipe customization (swap ingredients/adjust servings/
  tweak nutrition) creates variants.
- Multi-user: shared account/device sync; community sharing; single-store
  shopping list limitation.

### 4. Meal planning
Weekly planner: 7-day layout, meals for the three main meals + snacks;
drag-and-drop recipes to days; mark recipes as cooked + notes afterwards;
"plan the same recipe multiple times in one week" supported (auto-quantity).
Food+ AI-personalized weekly plans aligned to health goals. Reviewers note:
planning assumes you start from a recipe (discovery-first, not
ingredient-first); Home vs Explore tab confusion; suggested plans didn't
reflect dietary preferences (Plan to Eat's test).

### 5. Prep & packs
Closest Whisk-era feature: mark cooked + servings-left tracking; "collections"
like "Batch Cooking Favorites"; batch scale (4→8) with week-quantity math.
No container logging; no frozen/leftover/batch-cooked tracking (explicit gap
called out by Plan to Eat's review: "I didn't find a way to track leftovers,
frozen meals, or batch-cooked recipes").

### 6. Grocery
One-click list from any recipe or full plan; merges ingredients across
saved recipes and de-duplicates ("not buying onions twice"); grouped by aisle;
"favorites" for frequent items; manual reorganize needed almost weekly (the
list's most cited annoyance); groceries via retail partners in some regions;
Lists tab holds master pantry-ish list. The grocery merge is the adherence
win: "Save four recipes… merges… groups sensibly… de-duplicates the obvious
overlaps".

### 7. GUI layout
- Home tab: discovery feed (curated + community recipes, collections,
  suggestions); Explore tab: search with granular filters (diet, cuisine,
  method, sub-15-minute, ingredients).
- Recipe detail: imported recipe (photo, ingredient list, steps), Health
  Score badge, nutrition block, Add to Shopping List / Add to Meal Plan
  buttons, review/notes by other users.
- Meal Planner: 7-day grid; each day = breakfast/lunch/dinner/snack slots;
  drag recipe cards onto slots; tap meal → cook mode options (original site /
  step-by-step / Smart Cook Mode with per-step times).
- Lists tab: shopping list(s) + master/pantry list; check-off in store.
- Recipe box: saved recipes, collections, tags; searchable.

### 8. Differentiators & steal-worthy
- **Web-import-to-structured-fields is the fastest path to a full recipe
  library** — PersonalOS copy-in UX should mirror "paste URL → parsed card"
  even if parsing is offline/NLP-lite.
- **Week-quantity math when the same recipe appears twice** (batch cook
  Monday lunch–Thursday): the grocery list multiplies quantities per
  occurrence — the same math packs need (N containers × recipe nutrition).
- **Health Score** (per-recipe nutrient-density score) — a cheap, privacy-safe
  "is this good for my goals" signal that PersonalOS could compute locally
  from its own DB.
- **Mark-as-cooked + servings-left** — a soft "pack" acknowledgment: plans
  stay honest about what's actually in the fridge.
- **Vision AI pantry scan (Food+)** — worth noting only as contrast:
  PersonalOS has no camera dependency; skip.

---

## 6. PlanEatMore

### 1. Overview
**Status as of 2026: defunct.** planseatmore.com does not resolve (transport
error, verified 2026-08); no App Store/Play listing remains (iTunes search
returns only unrelated apps); Tracxn lists a London company "Plan Eat Meal"
(2020, unfunded, app-based smart meal planning) as the only trace.
Historically it was a web-first meal planner with recipe import, weekly
calendar, and an automatically generated grocery list — the minimal
plan→list→shop loop with no tracking layer. Because it is dead, this section
documents what little is verifiable rather than deep-diving a product users
can no longer evaluate.
Sources: https://planseatmore.com (dead — connection refused),
https://itunes.apple.com/search?term=planeatmore&entity=software&limit=5 (no match),
https://tracxn.com/d/companies/planeatmeal/__qdzGOFm4U2XF4O7dciX8dzPpctLQTsr7t9tJh1OQOXc

### 2. Core paradigm (as documented pre-shutdown)
recipe import → weekly meal calendar (drag/drop) → consolidated grocery list.
Same recipe→day→week→list pipeline as Mealime/Paprika without nutrition or
logging.

### 3-7. Not applicable / unverifiable
No current documentation, reviews, or GUI captures are retrievable. Known
differentiation claims from listings-era marketing: simplicity and shopping
list automation only.

### 8. Lessons for PersonalOS
- A minimal planner with no retention hook (no logging, no data ownership
  story, no differentiation) is indistinguishable and expendable — the
  category's graveyard includes both PlateJoy (acquired + killed) and
  PlanEatMore (unfunded + vanished). PersonalOS's offline data ownership and
  integration with the rest of life-tracking is the durable moat.
- Design against disappearance: templates/routines stored in user-owned
  local DB (PersonalOS) survive their vendor.

---

## 7. MealPrepPro

### 1. Overview
The meal-prep-native planner: weekly meal plan auto-adapted to your calorie/
macro needs, recipes designed for batch cooking (freeze/reheat notes per
recipe), one-tap "mark as eaten" logging, aisle-organized auto grocery list,
family/partner plans. iOS + Android; 7-day free trial; ~$5/mo (most popular
plan; App Store IAPs $9.99/$29.99/$59.99/$229.99 tiers); 4.7★ iOS (12K
ratings), 4.6★ Android; 15+ meal plan types (high-protein, low-carb, vegan,
pescatarian, Mediterranean, custom macros, allergies/dislikes). Built by
Nibble Apps (also FitMenCook). "The only meal planner built specifically for
meal prep."
Sources: https://www.mealpreppro.com/, https://apps.apple.com/us/app/mealpreppro-planner-recipes/id1249805978,
https://play.google.com/store/apps/details?id=com.nibbleapps.meal_prep_pro,
https://apps.apple.com/us/app/mealpreppro-planner-recipes/id1249805978?platform=iphone&see-all=reviews,
https://mwm.ai/apps/mealpreppro-planner-recipes/1249805978, https://factchecktool.com/en/tools/health-fitness/mealpreppro

### 2. Core paradigm
profile (goal, calories, macros, diet, allergies, dislikes) → AI plan for the
week (all meals pre-selected) → grocery list of exactly what the plan needs →
prep (batch-cook Sunday or per-day) → **mark meals as eaten → logging done**
(calories + macros recorded automatically; Apple Health sync). Plans adapt
portion sizes to calorie/macro targets; the plan is the tracker (like ETM but
prep-first).

### 3. Recipe model (deep)
- Ingredient entry: library recipes only (1,000s, new monthly); **users cannot
  add their own recipes** (top requested feature: "add recipes of my own and
  have the algorithm work around those macros… like FitMenCook").
- Serving scaling: "portions and the grocery list adjust to portions and
  calorie choices"; portion/calorie adjustments per meal; quirk: changing a
  day's calories then applying the meal to other days can reset portions
  (documented user bug).
- Nutrition: full per-recipe macros (kcal, fat, carbs, protein) from "trusted
  nutrition databases"; per-meal macro selection not supported (only calories)
  — users requested meal-level macros; some recipes flagged inaccurate
  (audit process exists).
- Copy/edit semantics: static library; calorie-matching proposal engine;
  freeze/reheat instructions baked into recipes (prep-specific metadata).
- Multi-user: partner/family profiles — add people with their own goals,
  join for specific meals or whole plan, shared login.

### 4. Meal planning
Plan creator: choose week days to prep for, choose prep day (slider to move
prep day); recipes swappable; calorie adjustments per meal; "eating out" mode
suggests what to order + how much. New recipes monthly to fight repetition.
Plan review complaints: can't change which meals a day contains in some
builds; day/meal editing bugs historically.

### 5. Prep & packs (its home turf)
- Batch prep workflows front and center: prep day selection, batch-cook-once
  patterns, leftovers next-day, freeze batches ("Freeze a batch of blueberry
  muffins… for easy grabs"), per-recipe freeze/reheat instructions.
- Mark-as-eaten logging: after eating, tap the meal → macros logged; because
  meals are portioned by the plan, one tap = one serving logged. This is
  container-adjacent logging (serving = unit) without named containers.
- No explicit "pack inventory" (which containers are in the fridge) — the
  gap PersonalOS's packs fill.

### 6. Grocery
Auto list from plan, aisle-organized, check-off in store, personal items
addable; Instacart integration (recent update); export options (Google Keep)
on roadmap. Criticisms: 69-ingredient lists for 4 meals early on (spices,
garlic cloves + garlic paste duplicates) — consolidation quality matters.

### 7. GUI layout
- Plan creator wizard: goal/calories → diet type → meal plan type → week-day
  selection grid → prep-day slider → generated week.
- Plan screen: 7-day grid of meal cards (photo, kcal, macros); tap meal →
  recipe detail (ingredients, steps, freeze/reheat note); swap button per
  meal; "eaten" toggle per meal for logging.
- Grocery screen: aisle-grouped checklist with per-item check; add-custom.
- Partner/family screens: member list, per-member goals + meal frequency.
- Complaints: "UI layout is a bit bulky when selecting the days you're meal
  prepping for"; no photos on own recipes (can't add own recipes at all).

### 8. Differentiators & steal-worthy
- **Prep day as a first-class planning input** (which days you cook; batch
  on Sunday, eat all week) — PersonalOS routines should know the prep day.
- **Freeze/reheat metadata per recipe** — prepped-food lifecycle info;
  packs should carry storage type (fridge/freezer) + reheat note.
- **One-tap mark-as-eaten = auto logging** — the lowest-friction log
  primitive; PersonalOS's "log planned meal" should be one tap.
- **Calorie/macro-adapted portioning**: the planner proposes portions that
  hit targets — the portionMultiplier resolved-at-save idea, automated.
- Eating-out suggestions sized to remaining calories — a real-world
  macro-gap application.

---

## 8. FitMenCook

### 1. Overview
Recipe app from influencer Kevin Curry (1M+ social following) built with Nibble
Apps; 750-800+ recipes (new monthly), mostly video-guided; meal prep is a core
tag and philosophy ("designate two days as your main cooking days"). iOS/
Android; app ~$2.99 one-time historically, now free + optional Meal Planner
subscription $0.99/mo / $5.99/yr (planning features); 4.9★ iOS (16K ratings),
4.8★ Android (5.7K). Notably: same developer (Nibble Apps) as MealPrepPro.
Sources: https://fitmencook.com/app/, https://apps.apple.com/us/app/fitmencook-healthy-recipes/id980368562,
https://play.google.com/store/apps/details?id=com.nibbleapps.fitmencook&hl=en,
https://www.iphonelife.com/content/eat-healthy-yet-deliciously-recipe-meal-planning-app,
https://www.citymac.com/blog/2015/11/20/app-review-fitmencook, https://www.shortmotivation.com/2017/02/app-review-fit-men-cook/

### 2. Core paradigm
recipe library (curated, tagged: Low carb, Meal prep, Vegan, Budget,
Post-workout, High Protein, Snacks & Sweets) → per-recipe serving scaling →
shopping list (by aisle or by recipe) → step-by-step video cook-along →
nutrition logged to Apple Health/Google Fit (servings eaten). Weekly meal plan
(premium) auto-generated from goals/calorie limit or user-picked; meal prep
calendar with recipes per day → grocery list for the week.

### 3. Recipe model (deep)
- Ingredient entry: curated library only; no user recipe creation; search by
  ingredient ("Egg Avocado" → recipes containing both) — pantry-driven
  discovery.
- Serving scaling: +/− steppers on the recipe view adjust servings; units
  toggle metric↔imperial; "Scale a recipe up or down… see the new ingredient
  list"; automatic portion-size adjustments propagate to shopping cart.
- Nutrition: kcal/protein/carbs/fat per recipe; one-tap add to Apple Health
  with number of servings eaten.
- Copy/edit semantics: static recipes + user notes per recipe; no fork/edit.
- Multi-user: personal; share recipes via Message/Mail/Facebook/Notes.

### 4. Meal planning
Premium: auto plan from goal or calorie limit, or pick recipes yourself;
meal prep calendar (add recipes to days) → weekly grocery list; favorites;
tags organize. Minimal template machinery — no routines/menus.

### 5. Prep & packs
- Meal prep is a content philosophy ("Preparing food in advance is
  important"; Meal Prep tag with 400+ prep recipes + videos), not a software
  model: no containers, no batch distribution, no pack logging. The app
  preps you to prep; it doesn't track prepped inventory.
- Closest pack-adjacent feature: serving-scaled shopping quantities (cook 8
  servings Sunday, eat 4 days).

### 6. Grocery
Per-recipe "Add X ingredients to shopping" (uncheck items you already own
first — per-ingredient checkmarks before adding); list sorted by aisle or by
recipe; manual additions; Apple Watch tick-off (force-touch aisle/recipe
view); share list by email.

### 7. GUI layout
- Tab 1 Recipes: top slider of "collections" (meal prep favorites, budget
  friendly…); below, tag chips; All Recipes grid with photos.
- Recipe detail: hero photo + tags; actions row (Add Note, Share, Favorite);
  description; ingredient list with +/− serving steppers and units toggle and
  per-ingredient checkmarks; "Add __ ingredients to shopping" button; steps
  (video embedded, step-by-step); nutrition block with "add servings eaten to
  Apple Health".
- Shopping list: sort by Aisle or Recipe; check-off; add custom items.
- Meal planner (premium): weekly calendar; add recipe per day; grocery
  generation from plan.

### 8. Differentiators & steal-worthy
- **Uncheck-before-add grocery pattern**: per-ingredient checkboxes in the
  recipe before it enters the list — beats post-hoc deletion (Paprika does
  the same; Mealime does not).
- **Ingredient search ("type Egg Avocado")** — cheap, offline-safe discovery
  that supports "use what I have" without any inventory model.
- **Video-first cook mode** — content, not architecture; skip for PersonalOS
  (no media deps needed).
- Nibble Apps runs both FitMenCook and MealPrepPro — two pricing models
  (tiny subscription for planning add-on vs core prep planner) worth noting
  for feature packaging.

---

## 9. MyMacros+ (MM+)

### 1. Overview
Macro-tracking app (not a meal planner) with the strongest custom-food/recipe
infrastructure and a real (if manual) meal-prep workflow culture. iOS, iPadOS,
Android, Apple Watch; free tier (3 micros), Pro ~$2.99/mo or $14.99/yr (all
macros, unlimited meal names, web access, spreadsheet export, advanced
analysis); optional Macro Coach AI subscription. 1M+ users; 4.7★; built by a
professional bodybuilder; offline: "Works offline — hundreds of thousands of
preloaded foods… ready when you are." 5M+ item database + barcode + nutrition
label scan + AI photo scan (Fast Track + AI, 2025-2026).
Sources: https://www.getmymacros.com/, https://www.getmymacros.com/tutorials.html,
https://apps.apple.com/us/app/my-macros-macro-tracker/id475249619,
https://play.google.com/store/apps/details?id=mymacros.com.mymacros,
https://appviewable.com/apps/app-my-macros/, https://feastgood.com/mymacros-app-review/,
https://corporette.com/how-to-use-the-macro-tracking-app-mm/

### 2. Core paradigm
Day screen with "remaining macros counter" at top → meals (unlimited,
user-named — "No more being stuck with only Breakfast, Lunch, Dinner and
Snack") → foods per meal (search 5M DB, barcode, label scan, custom) →
serving-size selection per entry → totals per day/meal/food. Unlimited macro
goals (carb cycling, high/low days, refeeds). Recipes: user-built food
compositions with per-serving nutrition. No meal planning at all — but its
recipe/serving model is the most relevant to PersonalOS receipt lines.

### 3. Recipe model (deep)
- Ingredient entry: custom food = label entry (per-serving name + macros;
  **calories auto-computed from P/C/F if left blank** — 4 kcal/g protein &
  carb, 9 kcal/g fat); recipes = ingredients with weights + servings count;
  editing a recipe's ingredient weights re-derives per-serving macros.
- Serving semantics (the key mechanic): "My Macros+ calculates and saves each
  food item as 1 of the serving name that you enter. This is to allow you to
  track this food in any serving size you want moving forward." — i.e. every
  food stores per-serving macros; at log time you pick any serving amount
  (grams/oz via instant unit conversion, or a fraction of the recipe).
- Nutrition: per-gram-derived; the app "converts and stores it properly for
  you to make using it in any serving size quick and easy".
- Copy/edit semantics: custom foods/recipes are editable; friends/coach can
  **copy custom foods, meals, and recipes straight into your own library**
  (My Circle) — explicit copy-in.
- Multi-user: My Circle social layer; personal data otherwise local.

### 4. Meal planning
None ("the app doesn't have a meal plan generator… you build your own plan
from scratch"). Meal Timer exists: "set reminders so you never miss your next
meal" — an in-app-only reminder (matches PersonalOS quiet reminders; MM+ has
no push-notification dependence).

### 5. Prep & packs (the power-user pattern — deeply documented)
From Corporette's MM+ meal-prep guide (the best-documented "pack" workflow in
any tracker):
- **Portion recipe pattern**: "I have a 'recipe' just called 'aaPortion'… When
  I cook one I'll add the raw weight and select how many servings. Then for
  the next few days when I eat it I'll just add the meat from the aaPortion
  recipe." Weigh raw → decide servings → recipe = container; each meal =
  log 1 (or N) servings of the container.
- **Serve-from-recipe pattern**: enter the total cooked weight as the serving
  size on the recipe; at each meal weigh the portion and log it — gram-accurate
  pack logging without a pack entity.
- **Composed meal recipes**: build "recipes" from custom foods for repeated
  meals; spices excluded from recipes because they carry no macros — logging
  precision over recipe fidelity.
- Weigh meat raw (cooked weight differs); freeze note: "write the macro
  information on the bag, or reflect that you've frozen two servings".
- **Restaurant/one-off entries**: Fast Track one-time custom food (estimate
  macros, no serving persistence).
This is exactly the pack concept reduced to "recipe with servings count,
consumed incrementally" — PersonalOS should make it a first-class object
instead of a naming hack.

### 6. Grocery
None (not a planner). Food database quality: 5M items but reviews split —
power users prefer building custom foods over the DB; barcode "hit or miss"
historically, improved; fresh foods thin. Nutrition label scan recommended
over barcode by power users.

### 7. GUI layout
- Daily meals page: remaining-macros bar at top (kcal/P/C/F remaining for
  the day); meals as expandable sections (user-named); swipe right → left
  food menu (Search, By Brand, Custom & Favs, Add Custom Food, scanners,
  Fast Track, Recent).
- Add Custom Food: serving-name field + P/C/F fields (+ optional kcal; auto-
  calc if blank); food-type dropdown; Save → appears in Custom & Favs.
- Serving selection screen: serving size + instant grams↔ounces conversion
  button.
- Recipe builder: ingredient list from foods with weights, servings count,
  per-serving nutrition output; ingredient order preserved.
- Reports: daily/meal/per-food breakdowns; weight graph; Diet Summary
  (Pro); CSV export (Pro).
- Meal Timer: per-meal reminder.

### 8. Differentiators & steal-worthy
- **Food stored as "1 serving" + any serving size at log time** — the
  per-serving/per-gram duality PersonalOS needs for portionMultiplier: a
  receipt line's nutrition should resolve to per-unit (gram/container) and
  the log records multiplier × unit.
- **Portion-recipe pattern (aaPortion)** — empirical proof that users model
  prepped containers as "recipe + servings count"; PersonalOS packs should
  be exactly that with explicit naming, counts, and consume-decrement.
- **Calories auto-derived from P/C/F** — error-proofing (user can't enter
  contradictory data); applies to recipe-line entry.
- **In-app Meal Timer (quiet reminders, no push)** — precedent that
  reminder-only-in-app is acceptable and even preferred in this niche.
- **My Circle copy (foods/recipes into own library)** — social copy-in
  proves snapshot-copy semantics scale to sharing.

---

## 10. The "pack" concept — prepped-container logging (cross-app)

Beyond FitMenCook (philosophy only) and MyMacros+ (hack pattern), three
2025-2026 apps ship real pack/prep-container models, and two established
planners have partial support:

### JUSTCOOK (https://just-cook.app/)
"Smart Meal Prep: batch cook once, eat well all week."
- **Prep Day Scheduling**: designate your batch cooking day.
- **Portion Control**: split recipes into exact serving sizes.
- **Smart Distribution**: spread portions across your week automatically.
- **Mix & Match**: combine multiple preps so every day is different.
- Meal prep flows into the weekly calendar: "Your distributed portions show
  up automatically" on their scheduled days; grocery list scales by batch
  quantity; nutrition auto-tracked from the plan.
This is the pack model as a first-class pipeline: recipe → batch (prep day) →
portions (containers) → distribution across week slots → logging by eating.

### Portions (https://apps.apple.com/us/app/portions-meal-planner/id6744140502)
- **Leftover Planning**: "cook once, eat across the week, with the plan that
  supports it."
- **One-Time Substitutions**: swap an ingredient for one meal *without
  forking the recipe* — copy-in semantics done right: the plan row carries
  the substitution, the recipe stays canonical. Custom recipes "fork from
  the library"; nutrition stays accurate per row.
- Kitchen Inventory with amounts; grocery list subtracts inventory
  ("you only buy the difference"); real-time list on any plan change.
- Multi-profile household: one meal for everyone or different meals per
  profile, single coherent week + single shopping trip.

### Plenish (https://useplenish.com/)
"Plans built around what's already prepped": log what you've prepped or
bought (fridge/freezer/pantry/snacks) with AI-assisted nutrition estimates →
"Personalized weekly meal plans built around what you've already prepped —
no more guessing what to eat next"; 1-4 week plans prioritize freshest items;
macro tracking (kcal, protein, fiber) daily + weekly; GLP-1-journey
positioning. Prep-first planning: the plan is generated *from* the pack
inventory, not the other way around.

### Plan to Eat (https://www.plantoeat.com/, https://play.google.com/store/apps/details?id=com.plantoeat.mobile)
Long-running planner (since 2009, 40,000+ families) with the only
established-planner leftovers/frozen support: "You can scale servings,
reschedule recipes, **plan leftovers, and track frozen meals**." Also: recipe
queue (holding spot before calendar), staples list, multi-store list
memory, calendar feed export, AI substitutions, beginner mode; 14-day trial,
$5.95/mo or $49/yr. Its grocery consolidation ("two recipes calling for
onions become a single line") is category-best alongside Paprika.

### Whisk/Samsung Food (see §5)
"Note when you've cooked something and roughly how many servings you have
left" — partial.

### Synthesis: the pack primitive across apps
recipe/meal × prep-day × container-count × per-container servings ×
distribution slots × consume-decrement (manual or plan-implied) × storage
type (fridge/freezer) × reheat info (MealPrepPro) × inventory-first planning
(Plenish/PlateJoy pantry) — every one of these exists in at least one app;
no single app has them all. PersonalOS can be the first to unify them in one
privacy-local model.

---

## Steal-worthy features for PersonalOS (ranked)

1. **Copy-in recipe semantics (Paprika Duplicate, Portions One-Time
   Substitutions, MyMacros+ My Circle copy, ETM snapshot foods).** The
   winning pattern: recipe stays canonical; every use (plan row, meal slot,
   receipt line) snapshots nutrition at save time; per-use substitutions
   live on the row, never the recipe. Portions' "swap an ingredient for one
   meal without forking" is the exact UX PersonalOS should implement for
   "editing a recipe never rewrites past rows."
2. **Free-form serving multiplier resolved at save (Paprika scale, MM+
   per-serving foods, ETM gap-regeneration).** Paprika proves arbitrary
   multipliers (fraction/decimal/%) that propagate to grocery math;
   MM+ proves storing food as "1 serving" with any serving size at log time
   (grams↔ounces instant conversion); ETM proves regenerating meals to close
   a calorie/macro gap — together they define portionMultiplier: store
   per-unit nutrition (per serving AND per gram), record multiplier at log
   time, and after catch-up logging, rebalance remaining slots against
   targets.
3. **Prep containers as first-class objects (JUSTCOOK distribution, Portions
   leftover planning, MyMacros+ aaPortion pattern, MealPrepPro freeze/reheat,
   Plenish inventory-first planning).** Pipeline: recipe → prep-day batch →
   N containers × servings each → distribute across week slots → eat = log
   container serving (one tap) → decrement; storage type + reheat note per
   container; plan generation can be prep-first (what's in the fridge)
   and grocery lists compute "plan needs − inventory".
4. **Template-driven day structures (Paprika Menus, ETM recurring + per-day
   profiles, MealPrepPro prep-day, PlateJoy Batch meals slot).** Paprika's
   Menus (N-day reusable structure applied to a start date) is the direct
   blueprint for R1-R12; ETM adds per-day-of-week targets and forced meal
   pools per slot; PlateJoy's "Batch meals" as a first-class meal type
   legitimizes a prep slot inside the day grid.
5. **Aisle-consolidated grocery math (Paprika 2+3=5 consolidation, Mealime
   aisle grouping, Samsung Food week-quantity, Plan to Eat single-line
   merge).** Sum quantities across plan rows per ingredient, group by aisle,
   pre-uncheck pantry items, multiply by batch occurrence count. Grocery is
   the adherence engine of every app studied — PersonalOS's plan→list is
   worth the effort even single-user.
6. **One-tap eat-logging + quiet reminders (MealPrepPro mark-as-eaten,
   MM+ Meal Timer).** Logging a planned meal = one tap (plan-implied
   consumption, ETM-style); reminders exist in-app only (Meal Timer) —
   no push needed, aligning with PersonalOS constraints. No XP anywhere in
   this cluster; none of the 10 apps gamify logging.

## Cross-cutting observations

- The plan-is-the-tracker pattern (ETM, MealPrepPro, JUSTCOOK, Portions) is
  the dominant 2025-2026 direction: planning and logging share one data
  model, and logging happens by confirming the plan. PersonalOS's
  receipt-line logging should treat a scheduled meal as a pre-filled receipt.
- Nutrition accuracy is the recurring trust differentiator (PlateJoy
  RD-reviewed vs Harvard's finding of 15-30% error in user-submitted data;
  ETM's curated USDA/FNDDS; MealPrepPro audits; Samsung Food's admitted
  import inaccuracy). PersonalOS should compute recipe nutrition from its own
  seeded food DB (per gram) rather than accept user-typed per-recipe totals.
- Offline/local-first is rare in this category and valued (Paprika "all data
  stored locally"; ETM on-device solving; MM+ offline food cache; Platua's
  offline mode praised by a prepper) — a genuine differentiator PersonalOS
  already owns.
- Failures worth citing in docs/DecisionLog or retrospectives: Mealime's
  2-or-4-only serving increments; MealPrepPro's portion-reset bug; Samsung
  Food's weekly grocery re-sorting burden; ETM's 2× grocery bills; Whisk-era
  editing friction; PlateJoy and PlanEatMore both dead — vendor extinction
  is a real category risk.