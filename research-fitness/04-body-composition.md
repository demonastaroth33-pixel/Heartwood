# 04 — Body Composition, Physique & Weight-Trend Apps (Research Report)

Research date: Aug 2026. Purpose: inform PersonalOS BODY scope (M2/M3) — daily weigh-in with canonical first-of-day rule, 7-day rolling trend, training-phase target rates from TDEE, physique-photo timeline (D031), weight ladder with 2-consecutive-weekly checkpoints, stall detection, thin-week rule. Constraint lens: offline-first, no XP for logging, derived-only, privacy-first (body photos sensitive).

Apps covered: MacroFactor, Happy Scale, Libra, MeThreeSixty, ZOZOFIT (ZOZOSUIT), Withings Health Mate, FitTrack Dara, BodySpace, progress-photo apps (Metamorph, Progress, Progress Pics Body Tracker, Body Tracker, Photo Compare, LocalOne Gym Pics, MyFitnessPal, Hevy, Body Measurement Tracker & Log), home body-composition alternatives (Visbody, 3DLOOK, Size Stream, Naked Labs/ShapeScale, DEXA/BIA science), plus StyleScan (a dead end — see note in its section).

---

# MacroFactor

## 1. Overview

Premium (subscription-only, no free tier) nutrition + weight app by Greg Nuckols and Dr. Eric Trexler (MASS Research Review / Stronger By Science). Positioning: "the smartest macro tracker and diet coach" — an adaptive coach whose calorie targets self-correct weekly from your real weight trend and food log. Pricing: ~$11.99/mo or $71.99/yr (https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349, https://home-cooks.co.uk/pages/review-macrofactor). The weight-trend engine is its most copied feature; it underpins expenditure and the weekly calorie budget (https://help.macrofactorapp.com/en/articles/21-weight-trend).

## 2. Core paradigm

Daily weigh-in → "Trend Weight Estimate" instead of raw scale weight. Every logged day, the new point is analyzed in context of all prior weigh-ins; the trend, not the scale, drives every coaching decision (expenditure, weekly budget, check-in adjustments). Trend is deliberately **back-looking**: when gaining, trend reads below scale weight; when losing, above — users are told to read the trend as "true weight" mid-flight (https://help.macrofactorapp.com/en/articles/21-weight-trend, https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/). Philosophy: weight is a range, not a point; glycogen/food/sodium/hydration push you to the top of the range in a surplus and bottom in a deficit, so scale weight systematically misleads around phase changes. No activity-level guessing, no wearable expenditure — expenditure is back-calculated from intake + trended weight (https://macrofactor.com/macrofactor/). Adherence-neutral: corrections are based on what you actually did, with no shaming UI ("You'll never see warnings, red numbers, or shaming" — https://mwm.ai/apps/macrofactor-macro-tracker/1553503471).

## 3. Trend math (DEEP)

- Formally: "a moving average of your weight data that places greater emphasis on more recent weigh-ins" — an averaging scheme over a long time scale with heavier weight on recent values; similar-but-not-identical to an exponential moving average family (https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/, https://macrofactor.com/macrofactors-algorithms-and-core-philosophy/). The exact kernel is not published (proprietary).
- **Gap filling:** raw scale weight is linearly interpolated across missing days (151 lb Mon + 150 lb Wed ⇒ 150.5 assumed Tue) before trending. The app is "resilient to gaps" but recommends daily, or at least 3×/week, for best results (https://help.macrofactorapp.com/en/articles/21-weight-trend).
- **Noise/signal design goals** (from the designers' own writeup): (1) don't overreact to 1–3 day fluctuations; (2) do start responding by ~day 4–5 if a deviation persists or accelerates — e.g., in maintenance, a 4–5-day departure from baseline that isn't reverting starts moving the trend (https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/). This is a de facto **stall/water-jump heuristic**: transient spikes that revert are ignored; sustained deviation of ~4+ days is treated as signal.
- **Why trend, not scale, for rates:** their worked example — weigh 185 lb Sun, 187 lb next Sun, perfect adherence, goal −1 lb/wk. Week-over-week scale math would demand a >1000 kcal/day cut. Trend math (weight was averaging 187 pre-first-weigh-in and 186 pre-second) shows on-target progress → no adjustment (https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/). This is the canonical argument for 7-day averaging vs single weekly weigh-ins — directly validates PersonalOS's canonical first-of-day + rolling-average design.
- **Expenditure from trend:** rate of trend change → change in stored energy (fat:lean ratio assumed by rate) → Calories_out = Calories_in − Δstored_energy (https://macrofactor.com/macrofactor/). Monthly-rate approximation from Hacker's Diet tradition: rate/wk × 3500 kcal/lb ÷ 7 = daily surplus/deficit (https://www.fourmilab.ch/hackdiet/e4/signalnoise.html).
- **Check-in loop:** weekly (check-in day user-changeable, https://macrofactor.com/dashboard-revamp); compares expenditure, trended weight, goal → new macro targets. "Losing 0.5 kg/wk target, seeing only 0.3 kg → lower calories slightly; losing too fast → raise them" (https://nutriscan.app/blog/posts/myfitnesspal-vs-macrofactor-2026-which-paid-tracker-b86a2f0b87). Users choose preferred rate of weight change (goal + rate selection, e.g., weight-loss rates 0.1–1.5% body weight/wk — https://nutriscan.app/blog/posts/myfitnesspal-vs-macrofactor-2026-which-paid-tracker-b86a2f0b87); new-goal targets "ease into" over 1–2 weeks rather than jumping (https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/).
- **Missing-data stance:** no requirement for daily logging; algorithm resilient, but 4–5 mornings/week logged = "clean signal" worth paying for (https://nutriscan.app/blog/posts/myfitnesspal-vs-macrofactor-2026-which-paid-tracker-b86a2f0b87). Maps to PersonalOS thin-week rule (<5 days = no data).

## 4. Physique photo features

- Structure: **one front, one side, one back photo per day**, uploaded per day (https://help.macrofactorapp.com/en/articles/117-tips-for-taking-good-progress-photos).
- **Cadence guidance (official):** ~once per month for most people — weekly photos are indistinguishable (mirror problem), 3-month gaps too slow to catch bad-direction drift (e.g., gaining fat you don't want). Exceptions: start/end of every goal (even if 4 days apart), and weekly/biweekly when chasing extreme leanness (https://help.macrofactorapp.com/en/articles/117-tips-for-taking-good-progress-photos).
- **Consistency protocol (official guidance):** same time of day (morning, fasted, predictable hydration); same location/backdrop (bare wall); similar attire (undergarments or shorts/tank); consistent lighting + consistent flash use; camera far enough that cropping puts head at top and feet at bottom of frame; consistent posture + flexed-or-not; separate relaxed vs flexed sets on consecutive days (https://help.macrofactorapp.com/en/articles/117-tips-for-taking-good-progress-photos).
- **Before/after creator:** Body Metrics → See All → Progress Photo tile → "Open Gallery" → compare builder: pick Front/Side/Back, select before photo (top) and after photo (bottom) from a date-sorted filmstrip, optional eyedropper to choose plain white / dark gray / matched-tone background, share via system sheet (https://help.macrofactorapp.com/en/articles/123-how-to-create-and-share-before-and-after-photos).
- **Psychology guidance:** evaluate objectively but compassionately; when a recent window looks flat, "look further back" several months for motivation (https://help.macrofactorapp.com/en/articles/117-tips-for-taking-good-progress-photos).
- Privacy: photos are personal-account data; no public feed; the company publishes guidance rather than shaming ("only do what you're comfortable with").

## 5. Body composition estimation

MacroFactor supports up to **18 circumference measurements** plus weight (https://help.macrofactorapp.com/en/articles/118-tips-for-taking-good-body-measurements). It does NOT do BIA/body-fat estimates — it treats weight trend + measurements as the reliable layer, and derives expenditure (not body fat) from them. Official measurement-reliability protocol (excellent source for PersonalOS guidance copy):
- Frequency: weekly / biweekly / monthly is the sweet spot; daily measurements are noise (bloat, muscle pump, error ~0.5–1 cm).
- Same conditions each time: morning-before-eating for waist (intestinal contents shift waist 2–5 cm!); avoid measuring limbs when muscles are sore (pump adds 1–1.5 cm).
- Fixed tape locations with written landmark notes (birthmarks, tan lines); consistent flexed-vs-relaxed choice.
- **Practice-and-average rule:** measure until 5 consecutive reads fall within 0.5 cm (small sites) / 1 cm (large sites); then take 2 measurements per site, and if they differ, take a 3rd and average the two closest. Spring-loaded tape removes squeeze-pressure error (https://help.macrofactorapp.com/en/articles/118-tips-for-taking-good-body-measurements).
- Relevance: track only measurements that map to goals (waist = fat loss proxy; arm flexed = muscle proxy); more data for its own sake becomes a chore.

## 6. GUI layout

- **Weight Trend page** (the star screen): two lines — pale "Scale Weight" line (raw, interpolated) and deep-purple "Weight Trend" line; the current trend value is the hero number. Changing trend direction/rate is immediately visible against the flat purple line (https://help.macrofactorapp.com/en/articles/21-weight-trend, https://mwm.ai/apps/macrofactor-macro-tracker/1553503471).
- **Dashboard:** top cards for nutrition; scroll down to a "Scale Weight" tile → tap to view/edit/add raw weights per day; "Weight Changes" data over multiple periods (https://help.macrofactorapp.com/en/articles/21-weight-trend, https://mwm.ai/apps/macrofactor-macro-tracker/1553503471).
- **Habits tile:** calendar-day editor for logging/editing any past or current weight (https://help.macrofactorapp.com/en/articles/278-weight-trend-workouts).
- **Body Metrics hub:** "More" → Data Visibility → Body Metrics Visibility → per-metric toggles (photos and measurements); Body Metrics → See All → inner dashboard → Progress Photo tile, measurement tiles each with trend charts; measurement progress viewable over time (https://help.macrofactorapp.com/en/articles/119-configure-body-metric-and-progress-photo-tracking, https://help.macrofactorapp.com/en/articles/122-how-to-view-body-measurement-progress-over-time).
- **Check-in experience:** weekly coaching check-in screen surfaces expenditure change + new targets; check-in day configurable; goal ETA insights (https://macrofactor.com/dashboard-revamp, https://macrofactor.com/macrofactor/).
- **Workouts context:** weight trend available in the workout module too (https://help.macrofactorapp.com/en/articles/278-weight-trend-workouts).

## 7. Differentiators & steal-worthy features

- **Trend-over-scale everywhere.** Every coaching number derives from trend. PersonalOS: compute all BODY metrics (rate vs phase target, stall, ladder checkpoints) off the trend line, never a single weigh-in.
- **Interpolation for gaps** — trend math survives vacation/sick weeks without fake data (it *estimates*, but transparently: pale line vs purple line keeps raw and derived visually distinct). PersonalOS thin-week rule (<5 logged days = no data) is the stricter privacy/no-fake-data cousin of this.
- **4–5-day "sustained deviation" threshold** as the anti-water-jump rule — exactly the behavior PersonalOS stall detection needs (transient spikes ignored; sustained out-of-direction drift of ~4+ weeks flagged).
- **1 front / 1 side / 1 back per day + monthly cadence + goal-boundary photos** — clean, opinionated photo model that maps 1:1 to PersonalOS's monthly physique timeline (D031).
- **Before/after builder with matched backgrounds + share sheet** — low-effort milestone art.
- **Check-in day user-configurable** — weekly cadence but user-owned timing.
- **Published measurement-reliability protocol (2-of-3 averaging, landmark notes)** — if PersonalOS ever adds tape measurements, this is the canonical guidance to embed.

Sources: https://help.macrofactorapp.com/en/articles/21-weight-trend · https://www.strongerbyscience.com/macrofactor-algorithms-philosophy/ · https://macrofactor.com/macrofactors-algorithms-and-core-philosophy/ · https://macrofactor.com/macrofactor/ · https://macrofactor.com/dashboard-revamp · https://help.macrofactorapp.com/en/articles/117-tips-for-taking-good-progress-photos · https://help.macrofactorapp.com/en/articles/118-tips-for-taking-good-body-measurements · https://help.macrofactorapp.com/en/articles/119-configure-body-metric-and-progress-photo-tracking · https://help.macrofactorapp.com/en/articles/123-how-to-create-and-share-before-and-after-photos · https://help.macrofactorapp.com/en/articles/278-weight-trend-workouts · https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349 · https://nutriscan.app/blog/posts/myfitnesspal-vs-macrofactor-2026-which-paid-tracker-b86a2f0b87 · https://mwm.ai/apps/macrofactor-macro-tracker/1553503471 · https://home-cooks.co.uk/pages/review-macrofactor

---

# Happy Scale

## 1. Overview

iOS-only dedicated weight-trend app (Front Pocket Software, solo dev "Russ"; now a 3-person team — https://apps.apple.com/us/app/happy-scale/id532430574). Positioning: "Tame the scale!" — the anti-scale-anxiety app: mathematical smoothing so daily fluctuations stop being emotionally load-bearing. 4.8–4.9★ with 57K ratings; ~$1.99/mo or $11.99/yr premium over a free core (https://unimeal.reviews/weight-loss-apps/happy-scale/). The reference product for trend psychology + milestone UX.

## 2. Core paradigm

Pure daily-weigh-in + moving-average philosophy. No food logging, no workout stuff, no body-fat estimation (BMI only). The entire product thesis: weigh daily, let math find the trend, break big goals into milestone segments, predict future weights. "Weighing daily actually helps give a moving average... I can now see my real progress" (user review, https://apps.apple.com/us/app/happy-scale/id532430574?see-all=reviews). Weigh-in entry is a one-tap "+" with celebratory tally-reveal animation ("you get to 'tap' the screen to see your new tallies, for what you have lost this week, this month, this year, and all-time" — https://apps.apple.com/us/app/happy-scale/id532430574?see-all=reviews).

## 3. Trend math (DEEP)

Official support docs are unusually candid:
- **Exponential smoothing** is the default trend method; the docs say it is "simple, and good for calculating weight trends" but "poor at predicting your weight, as it tends to 'lag' and predict what you weighed days ago" (https://happyscale.com/support). I.e., Happy Scale separates *smoothing* (EMA) from *prediction* (rate-based projection) — a clean architectural distinction PersonalOS should copy.
- **Seven-day moving average** is offered as an alternative for users who prefer its simplicity; same lag caveat (https://happyscale.com/support).
- **Statistics shown:** "average low for the last 10 days" (10-day low), moving average, weekly rate, per-period totals (week/month/year/all-time) (https://www.iphonejd.com/iphone_jd/2025/01/review-happy-scale.html, https://mwm.ai/apps/happy-scale/532430574).
- **Predictions:** separate from trend; based on "current rate" and "overall rate" of loss; optional "commitment" mode where the user inputs a weekly commitment amount; event predictions ("Wedding Day" weight) computed from "the 10-day low and commitment rate" with a full "How We Got Here" explainer screen (https://www.iphonejd.com/iphone_jd/2025/01/review-happy-scale.html, https://mwm.ai/apps/happy-scale/532430574).
- **Plateau mitigation:** moving-average view means "steady progress every day" — a flat raw scale can still show a moving trend ticking toward the goal (https://apps.apple.com/us/app/happy-scale/id532430574).
- **Graph coloring — the visual water-jump handling:** "green areas above and red areas below the graph line" compare current weight to where it was N days ago (default 30, configurable via gear on the Weight Chart card): green thickness = amount lost in last 30 days, red = gained (https://happyscale.com/support). This makes a single water spike read as red sliver above a green mass — the whole point of water-jump handling, done visually.

## 4. Physique photo features

None — Happy Scale is numbers-only. Relevant lesson: a *dedicated* trend app doesn't need photos; photos live in separate products. For PersonalOS, photos attach to journal/weigh-in days (D031), so this is moot, but Happy Scale shows the value of keeping the weight screen pristine.

## 5. Body composition estimation

Only a BMI calculator with category ranges and target-weight ranges per category ("Know Your Numbers") (https://apps.apple.com/us/app/happy-scale/id532430574, https://mwm.ai/apps/happy-scale/532430574). No body-fat claims — a deliberate scope cut.

## 6. GUI layout (deep)

Screen-by-screen from store listings + UX teardown (https://mwm.ai/apps/happy-scale/532430574, https://www.iphonejd.com/iphone_jd/2025/01/review-happy-scale.html):
- **Today/Progress screen:** hero progress ring labeled "Milestone 6" (current milestone position), Weight Trends summary across periods, recent-stats line graph (smoothed), BMI meter with category ranges. Everything celebrates progress vs a milestone, not vs yesterday.
- **Weight Chart card:** line chart with date-shortcut row beneath (editable: "last X days", "since a particular day", custom ranges); gear icon → "Highlight progress over..." controls the green/red comparison banding.
- **Predictions card:** named predictions; tap → full-screen view showing exactly how each was calculated (10-day low, commitment rate) + share button.
- **Log My Weight:** circular "+" at bottom of screen; entry form with weight picker + contextual Notes field (medication, sleep, stress — "logbook notes").
- **Logbook:** chronological entries showing each day's Moving Average and Weekly Rate; "Milestone goal achieved!" celebration copy on milestone crossings.
- **Reports:** long-term trend-line graph with Goal Weight highlighted.
- **Widgets:** home-screen widget (lowest weight, upcoming event, milestone progress) and lock-screen widget (10-day-low, Moving Avg) — "progress always visible without unlocking."
- **Settings:** extensive configurability — statistics shown, chart timeframes, color themes, milestone segments, prediction commitment, Apple Health sync toggle, animations on/off.
- Personalization hook: users repeatedly cite "color schemes," "tallies circle and settle," and milestone celebrations as the emotional engine (App Store reviews).

## 7. Differentiators & steal-worthy features

- **Milestone segmentation as the primary motivational UI** (hero ring, celebration states, "how far to next milestone, % lost already" — https://apps.apple.com/nz/app/happy-scale/id532430574). PersonalOS's weight ladder (70/75/80/85/90/95/100 kg) should be exactly this: a visible ladder with named rungs, not a bare target.
- **Prediction explainer screens** ("How We Got Here") — trust through transparency; PersonalOS can show "based on 7-day trend slope" instead of a magic number.
- **Green/red 30-day comparison banding** — the best single visualization for water-jump reassurance (a spike reads as a sliver, not a crisis).
- **Weekly rate + moving average as day-to-day readouts** in the logbook — makes rate-vs-target (bulk +0.25–0.5 kg/wk) inspectable per entry.
- **Tally-reveal micro-animation on weigh-in** (week/month/year/all-time deltas) — dopamine without XP; compliant with "no XP for logging" since it's pure derived feedback.
- **Lock-screen widget with 10-day-low + moving avg** — daily glance habit formation.

Sources: https://happyscale.com/ · https://happyscale.com/support · https://apps.apple.com/us/app/happy-scale/id532430574 · https://apps.apple.com/us/app/happy-scale/id532430574?see-all=reviews · https://apps.apple.com/nz/app/happy-scale/id532430574 · https://unimeal.reviews/weight-loss-apps/happy-scale/ · https://www.iphonejd.com/iphone_jd/2025/01/review-happy-scale.html · https://mwm.ai/apps/happy-scale/532430574

---

# Libra (Weight Manager)

## 1. Overview

Free, open-data Android weight-trend app (net.cachapa.libra; https://play.google.com/store/apps/details?id=net.cachapa.libra). The Android counterpart of Happy Scale — "dedicated weight trend apps... moving average and trend calculation among the most sophisticated available in a free app" (https://dev.to/nutribalance/best-weight-tracker-apps-for-android-2026-log-weight-see-progress-charts-11h). Uniquely for this category, it **documents its exact math** — the best reference implementation for PersonalOS's 7-day trend.

## 2. Core paradigm

Daily weigh-in, trend line = moving average, forecasts extrapolated from recent trend. Weigh-in protocol guidance: "weigh yourself first thing in the morning just after waking up and using the toilet" (https://libra-app.eu/support/trend/). Heavily inspired by The Hacker's Diet (John Walker, founder of Autodesk) — the 1980s book that formalized exponential smoothing of scale weight; Libra is "inspired... more than 15 years ago" (https://libra-app.eu/support/trend/).

## 3. Trend math (DEEP) — the documented formula

From official support (https://libra-app.eu/support/trend/):

```
smoothingDays = 7            (default; adjustable in Advanced Preferences)
smoothingTime = smoothingDays * msPerDay
time = dateInMs - previousDateTime.inMs
power = 1 - e^(time / smoothingTime)
trend = previousTrend + power * (weight - previousTrend)
```

- This is **exponential smoothing indexed by elapsed time**, not by entry count — so irregular logging (missed days) degrades gracefully: a larger gap produces a larger `time`, hence a larger `power`, letting the new weight pull the trend harder (and the smoothing "adapts better to larger intervals between entries"). This is the subtle, correct answer to "how does the 7-day rolling average handle a skipped day?" — a plain 7-day window just drops the day; Libra's continuous-time EMA naturally discounts it.
- Earlier community-documented equivalent (discrete form): `current trend = Alpha × latest weight + (1 − Alpha) × previous trend`, with `Alpha = 1 / smoothingDays` (https://community.myfitnesspal.com/en/discussion/10603888/libra-weight-manager-app-settings). With smoothingDays = 7, each weigh-in moves the trend ~1/7 of the way toward the new value.
- **Forecast:** simple linear regression over the trend values inside the *forecast window* (default 7 days, configurable); the regression slope = rate of weight change; extrapolate to forecast a date's weight or the date a goal weight is reached (https://libra-app.eu/support/forecast/).
- **Settings semantics** (power-user consensus): smoothing days ↑ ⇒ flatter, less spikey line (less perturbation by single days); forecast days ↑ ⇒ slower to change the projection angle when the rate shifts (https://community.myfitnesspal.com/en/discussion/10603888/libra-weight-manager-app-settings).

**The Hacker's Diet lineage** (https://www.fourmilab.ch/hackdiet/e4/signalnoise.html) — the original treatise, worth reading in full for the PersonalOS spec:
- Simple N-day moving averages lag; weighted/EMA variants weight recent data more. Recommended practical settings: **exponentially smoothed moving average with smoothing constant 0.9** (≈20-day simple MA in lag behavior); constants 0.5–0.9 discard old data naturally so no fixed window is needed.
- **Floats and sinkers:** when the trend falls, most daily weights sit *below* the line (sinkers pulling it down); when rising, above it (floats). A plateau that looks like stagnation on the scale is often a trend line still being dragged down by below-line readings — a purely visual early-warning system for stall detection.
- **Rate extraction:** for hand calc, `(trend_end − trend_start) × 7/days` ≈ weekly rate; better, fit a straight line to the trend and use its slope. Convert to calories: `weekly rate × 3500 / 7` = daily surplus/deficit (e.g., −1.7 lb/wk ≈ −850 kcal/day).
- Warning the trend extrapolation can be fooled by long-period, high-amplitude oscillations — judge short windows (month) around trend kinks, not all-time fits.

## 4. Physique photo features

None. (Shareable weight chart as JPEG — https://play.google.com/store/apps/details?id=net.cachapa.libra.) No privacy concerns for photos because there are no photos.

## 5. Body composition estimation

BMI + basic body-composition analysis from measurements (per store listing: "Quickly get analysis based on measurements like BMI and body composition" — https://play.google.com/store/apps/details?id=net.cachapa.libra). Not a differentiator; trend is the product.

## 6. GUI layout

- **Main chart screen:** raw weights as dots above/below the smooth trend line; smooth history scrolling; dates along the axis (https://play.google.com/store/apps/details?id=net.cachapa.libra, https://softwarerecs.stackexchange.com/questions/51864/android-weight-recording-app-with-export-import).
- **Entry flow:** add-weight input (also via Health Connect sync — https://www.epnutrition.co/blog/libraguide); the trend line visibly bends with each new entry — live feedback.
- **Stats/analysis:** BMI, body composition readouts; goal setup with **planning estimate of result date** ("Set goals planning estimate results").
- **Forecast UI:** projected line extension showing when goal weight is reached; share chart as image.
- **Homescreen widget:** three quick stats (trend, current, change) (https://www.makeuseof.com/tag/track-weight-smart-libra-android).
- Settings: Advanced Preferences — smoothing days, forecast days, units, Health Connect.

## 7. Differentiators & steal-worthy features

- **The exact formula to license/adapt** for PersonalOS: time-indexed EMA (`power = 1 − e^(Δt/smoothingTime)`) is the state of the art for gap-tolerating weight trends, and it's documented, simple, and testable. A 7-day smoothingTime with continuous-time decay is a strict improvement over a naive 7-entry window for the thin-week rule edge cases.
- **Linear-regression slope over the trend window = weekly rate** — the "derived-only" way to compute rate vs phase target (bulk +0.25–0.5 kg/wk etc.) without any user math.
- **Floats/sinkers visualization** — draw raw weigh-ins as dots vs the trend line; it is the cheapest honest stall display (a "stalled" scale with sinkers below the line is not a stall).
- **Hacker's Diet calibration rule of thumb** — smoothing constant ~0.9 ≈ 20-day MA lag; for a 7-day PersonalOS trend, expect more responsiveness but noisier rate; consider showing both 7-day trend and 30-day slope in Reports.
- **Forecast-to-goal-date with explicit "past performance" disclaimer** — "The quality of the forecast is heavily dependent on the amount and quality of your recent data" (https://libra-app.eu/support/forecast/).

Sources: https://libra-app.eu/support/trend/ · https://libra-app.eu/support/forecast/ · https://www.fourmilab.ch/hackdiet/e4/signalnoise.html · https://play.google.com/store/apps/details?id=net.cachapa.libra · https://community.myfitnesspal.com/en/discussion/10603888/libra-weight-manager-app-settings · https://www.makeuseof.com/tag/track-weight-smart-libra-android · https://www.epnutrition.co/blog/libraguide · https://dev.to/nutribalance/best-weight-tracker-apps-for-android-2026-log-weight-see-progress-charts-11h · https://softwarerecs.stackexchange.com/questions/51864/android-weight-recording-app-with-export-import

---

# MeThreeSixty

## 1. Overview

Consumer 3D body-scan app by Size Stream (professional scanning company; its tech also powers B2B mobile scanning SDKs with "over 240 body measurements" — https://www.sizestream.com/mobile-scanning/). Free tier with premium: ~$4.99/mo, $29.99/yr (IAP tracker shows variants $1.99–$39.99 — https://apppricinglab.com/iap/apple/1472541261). 1M+ downloads, 4.7★ (https://mwm.ai/apps/methreesixty-3d-body-scanner/1472541261). Positioning: visual transformation tracking — "instead of fixating on weight loss... a real, tangible view of your progress" (https://www.mobileappdaily.com/product-review/methreesixty).

## 2. Core paradigm

Phone camera captures **front + side poses in tight clothing** → AI builds a smoothed 3D avatar → 14+ circumference estimates, body fat %, lean mass, BMI, plus a "Fitness Index" (body-shape-based alternative to BMI) (https://www.mobileappdaily.com/product-review/methreesixty, https://healthynexercise.com/best-body-scan-apps/methreesixty-review/). Scan comparison is the core loop: weekly/biweekly scans, compare avatars side by side over time. "Future Me": projected 3D body at goal weight (https://www.mobileappdaily.com/product-review/methreesixty). Free tier caps scan history at ~5 scans; premium unlocks full history + faster processing (https://gainframe.app/blog/methreesixty-vs-gainframe/).

## 3. Trend math

No weight-trend engine of note — it's a scan-history product. Trend = the sequence of circumference readings and avatar comparisons across scans; measurements charted over time. Relevant lesson: scan-based measurements fluctuate with pose/lighting/hydration day to day, and App Store reviews show users treating week-to-week scan drift as a bug ("results are not as consistent as they were... measurements vary from my RENPHO tape now where they were pretty close before" — https://apps.apple.com/us/app/methreesixty-3d-body-scan-bmi/id1472541261?see-all=reviews; algorithm updates in July reset readings — developer response, same URL). Implication: if PersonalOS ever adds scan-like measurements, apply the same trend math to them, or users will fixate on noise.

## 4. Physique photo features

Avatar-based comparison rather than raw photos: side-by-side scan comparisons in the app; the 3D model is the "photo". Guided scanning flow with pose instructions; consistent framing is a documented accuracy factor. "Future Me" is a motivational projection, not a real photo. Privacy: scans reportedly "process and stay on your device" (https://gainframe.app/blog/methreesixty-vs-gainframe/) — though premium features and sync imply cloud for history; verify per plan.

## 5. Body composition estimation

- Body fat calculator (manual measurement entry — bicep, stomach, thigh) plus scan-derived estimates; lean mass estimate.
- Accuracy stance: "provides a reliable estimate... not as precise as professional DEXA scans or medical-grade body analysis" (https://www.mobileappdaily.com/product-review/methreesixty). Consistency depends on lighting, pose, tight clothing, phone angle (https://healthynexercise.com/best-body-scan-apps/methreesixty-review/).
- Best scan frequency guidance: weekly or biweekly, not daily (https://healthynexercise.com/best-body-scan-apps/methreesixty-review/).
- Background: Size Stream's commercial mobile SDK claims AI measurement precision validated over "millions of scans" (https://www.sizestream.com/mobile-scanning/); competitor 3DLOOK claims 96–97% measurement accuracy, 3.5% weight-prediction error, 95% repeatability (https://3dlook.ai/) — vendor claims, treat with skepticism.

## 6. GUI layout

- **Guided scan flow:** onboarding poses (front, side), on-screen framing guides, progress/processing state.
- **3D avatar viewer:** rotatable model with circumference measurement rings (waist, hips, chest, arms, thighs...); pinch/rotate to inspect.
- **Dashboard:** weight, body fat %, Fitness Index, measurement list; custom dashboard with measurement tracking; scan history (premium: unlimited).
- **Comparison screen:** two avatars side by side (before/after), showing delta per measurement; date-stamped.
- **Future Me screen:** slider/preview of projected goal physique.
- **History/trend charts** for weight and composition over time (premium) (https://www.mobileappdaily.com/product-review/methreesixty, https://healthynexercise.com/best-body-scan-apps/methreesixty-review/).

## 7. Differentiators & steal-worthy features

- **Avatar as a privacy-safe "photo".** A 3D model sidesteps the sensitivity of real body photos — relevant to PersonalOS's privacy-first constraint (photos stored locally, never uploaded). A simple silhouette avatar derived from the photo could be the default "safe" preview.
- **Fitness Index (shape-based, not BMI)** — an alternative to BMI for lifters; a derived-only metric PersonalOS could compute from measurements.
- **Guided scan/photo protocol** — the app trains consistency through UI (pose guides), the same job a ghost-overlay photo tool does.
- **Future Me visualization** — motivational projection; controversial (body-image risk; reviews show users disturbed when it degrades — "the '-15lb' slider makes the skin go all wrinkly" — https://mwm.ai/apps/methreesixty-3d-body-scanner/1472541261). PersonalOS should skip or make opt-in.
- **Lesson in caution:** scan drift between versions/algorithm updates erodes trust; any derived metric must be stable across app versions (versioned algorithms + changelog if PersonalOS ever derives from photos).

Sources: https://www.mobileappdaily.com/product-review/methreesixty · https://healthynexercise.com/best-body-scan-apps/methreesixty-review/ · https://gainframe.app/blog/methreesixty-vs-gainframe/ · https://apps.apple.com/us/app/methreesixty-3d-body-scan-bmi/id1472541261 · https://apppricinglab.com/iap/apple/1472541261 · https://www.sizestream.com/mobile-scanning/ · https://mwm.ai/apps/methreesixty-3d-body-scanner/1472541261

---

# ZOZOFIT (ZOZOSUIT)

## 1. Overview

Hardware+app 3D body-measurement system: a polka-dot two-piece bodysuit ($98, 13 unisex sizes, US-only) with **15,000+ fiducial markers**, scanned by smartphone while the user rotates in place; app free / Premium $3.99/mo, $29.99/yr, $99.99 lifetime (https://zozofit.com/products/suit, https://gainframe.app/blog/best-body-scanning-measurement-apps/). Positioning: "democratizes 3D measuring" for fitness/weight-loss transformation tracking; enterprise-grade measurement without the booth (https://zozofit.com/blogs/news/buy-this-suit).

## 2. Core paradigm

Scan-on-a-cadence (author recommends ~monthly, multiple scans per session — https://gadgetsandwearables.com/2023/07/01/zozosuit-review/). The suit's markers make each scan consistent — the garment *is* the consistency control, replacing the "same angle/lighting every time" problem with a fixed reference frame. Produces 400+ measurements, distilled to 12 key circumference locations (neck, shoulders, chest, upper arm L/R, upper waist, lower waist, hips, thigh L/R, calf L/R) + body fat % (navy method from measurements) (https://zozofit.com/products/suit).

## 3. Trend math

None in the weight-trend sense. The app visualizes *change* between scans: "ColorMetric graphic to visualize transformation" (color-mapped 3D model showing where you shrank/grew), goal-setting feature, and measurement histories. Independent accuracy review: cross-verified circumferences nearly identical to tape, but found an impossible +2 cm calf change over 2 days — concluding "multiple scans should smoothen out these discrepancies" (https://gadgetsandwearables.com/2023/07/01/zozosuit-review/). I.e., scan noise exists and the app does NOT smooth it — users are expected to average mentally. A gap PersonalOS could own (apply trend math to measurement series).

## 4. Physique photo features

The 3D model + ColorMetric transformation visualization is the "photo comparison": 360° viewer, close-ups per body region, before/after via color deltas on the mesh. Sharing scans with doctors/coaches supported. Downloadable .OBJ export of your body mesh (https://zozofit.com/products/suit). Real photos never enter the flow — the mesh replaces them (privacy upside).

## 5. Body composition estimation

- Body fat % derived from measurements via the **Navy method** (tape-measure-derived formula) — see https://zozofit.com/blogs/news/how-does-zozofit-measure-body-fat-percentage.
- Claimed accuracy: "similar to a laser scanner. Average error of 0.15 inches" (https://help.zozofit.com/hc/en-us/articles/23193044161811-How-accurate-are-the-ZOZOFIT-measurements); note this is circumference, not body fat.
- Independent 2026 analysis: circumference trends trustworthy *if* conditions repeat (suit fit, posture, lighting, time of day); body fat % is the weakest feature — shape-derived, no published DEXA validation, typically off by "a few percentage points," worse for unusual fat distributions or high muscle mass (https://biologyinsights.com/how-accurate-is-zozofit-measurements-vs-body-fat/).
- Critical Reddit thread: "misleading claims, NOT a 3d scanner" — mesh artifacts with a corset; ZOZOFIT engineer responded that marker-tracking can fail in edge cases (https://www.reddit.com/r/3DScanning/comments/104z53d/zozofit_zozosuit_review_misleading_claims_not_a/).

## 6. GUI layout

- **Scan screen:** on-device suit-size selector (height/weight in), 360° rotate pose guide, scan-in-progress state, success screen.
- **Body view:** rotatable 3D mesh with 12 measurement callouts; tap any location for the number; close-up region inspection.
- **ColorMetric screen:** transformation view — color heatmap on the mesh highlighting where measurements changed between scans.
- **Goals screen:** goal-setting feature with progress against target measurements.
- **Timeline/history:** past scans with per-location deltas; share results; .OBJ export (https://zozofit.com/products/suit, https://gadgetsandwearables.com/2023/07/01/zozosuit-review/).

## 7. Differentiators & steal-worthy features

- **The garment-as-consistency-control insight:** for photo consistency, any fixed physical anchor (same wall mark, same tripod spot, same time) beats willpower. PersonalOS's photo tool should *enforce* a repeatable framing ritual (ghost overlay + same-spot guidance) precisely because it lacks hardware.
- **ColorMetric change-mapping** — showing *where* the body changed (waist −2 cm, chest +1 cm) is far more informative than a single number; PersonalOS's photo slider could overlay measurement deltas on the compared photos.
- **12 fixed measurement locations with names** — a stable, opinionated measurement taxonomy worth adopting for any tape/derived measurements.
- **Monthly cadence + multiple scans per session, then mentally averaging** — the app's own reviewer workflow; PersonalOS should automate the averaging (2–3 scans → median) instead of leaving it to the user.
- **Privacy-by-mesh:** a derived model never needs the raw photo anywhere except the user's device.

Sources: https://zozofit.com/products/suit · https://zozofit.com/blogs/news/buy-this-suit · https://help.zozofit.com/hc/en-us/articles/23193044161811-How-accurate-are-the-ZOZOFIT-measurements · https://gadgetsandwearables.com/2023/07/01/zozosuit-review/ · https://biologyinsights.com/how-accurate-is-zozofit-measurements-vs-body-fat/ · https://www.reddit.com/r/3DScanning/comments/104z53d/zozofit_zozosuit_review_misleading_claims_not_a/ · https://gainframe.app/blog/best-body-scanning-measurement-apps/

---

# Withings Health Mate (smart-scale ecosystem)

## 1. Overview

App + hardware ecosystem (Body, Body+, Body Cardio, Body Comp, Body Scan scales; Body Smart ≈ $130). Scales from ~£59.95 (Body) to Body Scan ~£345 (https://www.trolley.co.uk/product/withings-body-bmi-wi-fi-scale-white/TUX406, https://www.withings.com/en-us/collections/scales). Free app with optional Withings+ subscription ($9.99/mo or $99.99/yr) adding Health Improvement Score, workout videos, recipes (https://www.makeuseof.com/withings-body-smart-review). Positioning: medically-leaning home health data (weight, BMI, body composition, heart-rate/PWV on higher tiers, ECG on ScanWatch). The archetype of the *scale-first* paradigm vs the *trend-app-first* paradigm (Happy Scale/Libra).

## 2. Core paradigm

Weigh-in on hardware → auto-sync (Wi-Fi/Bluetooth) → Health Mate app → trends. Multi-user (8 profiles) with automatic user recognition; pregnancy tracker and baby mode. The app explicitly "focuses on trends rather than just data" with week/month/quarter/year views (https://www.makeuseof.com/withings-body-smart-review). Hardware-side niceties: Position Control Technology (scale guides you to stand balanced via arrows before reading — reducing within-day noise at the source), Eyes Closed mode (scale hides the weight on-device but still records it — a genuinely interesting anti-anxiety pattern for a *privacy-first* offline app: the data exists but isn't surfaced at the moment of weighing) (https://www.makeuseof.com/withings-body-smart-review, https://www.amazon.com/Withings-Nokia-Body-Composition-smartphone/dp/B072C4XB3G).

## 3. Trend math

Weakest link of the cluster: Health Mate shows trend *views* but no documented smoothing algorithm; a notable Amazon review praises a third-party app ("Monitor Your Weight") precisely because Health Mate "summarizes into a trendline" and hides the raw points at month scale (https://www.amazon.com/Withings-Nokia-Body-Composition-smartphone/dp/B072C4XB3G). Conclusion: hardware ecosystems treat trend as a reporting layer, not an analytics engine. The analytics engine (expenditure, rate-vs-target) is a separate product category — evidence that PersonalOS should be built like MacroFactor/Happy Scale, not like Health Mate.

## 4. Physique photo features

None (scale-centric). Multi-user is the privacy structure — per-profile data separation in-app.

## 5. Body composition estimation

- Multi-frequency BIA: body fat %, muscle mass, water %, bone mass, visceral fat index, BMR (https://www.makeuseof.com/withings-body-smart-review).
- Body Comp (segmental BIA, ~$199) rated the most accurate consumer scale by a 2026 physician-reviewed comparison: **±2.0–4.0% body-fat error vs DEXA**, vs ±3.5–5.0% for foot-to-foot consumer BIA (https://wearablewellnessguide.com/body-composition-tracking/smart-scales-compared). Body Scan adds segmental analysis, ECG, nerve assessment.
- Manufacturer claims "algorithms adapt to your profile for reliable readings" (https://www.withings.com/en-us/collections/scales) — vendor language for the hydration-sensitivity problem.
- Practical guidance from reviewers: weigh fasted in the morning after bathroom use; use BIA for trend, DEXA for clinical truth (https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa).

## 6. GUI layout

- **Home tab:** latest measurements from all devices (weight card with delta, BMI, composition tiles), imported Apple Health data; short articles.
- **Trend views:** per-metric charts with week/month/quarter/year selector; smooth trendline overlays (https://www.makeuseof.com/withings-body-smart-review).
- **Goal screen:** weight goal management; daily calorie guidance derived from goals.
- **Measures log:** per-date measurement editing; per-user profiles switch.
- **Withings+ layer:** Health Improvement Score, video/recipe content (subscription-gated).

## 7. Differentiators & steal-worthy features

- **"Eyes Closed" weigh-in mode** — hide the number at the moment of weighing, record anyway. For PersonalOS's no-fake-data + anti-anxiety stance: an optional "coach mode" where the scale number is hidden until trend context is available (or until the user opts to see it). Privacy-first in a new sense: protection from your own morning-brain.
- **Position-control guidance at the source** — the app cannot fix this for manual entry, but PersonalOS could prompt canonical first-of-day conditions (after bathroom, before food/drink) at weigh-in time to reduce noise.
- **Week/month/quarter/year trend selector as a standard widget** — cheap to build, high reassurance value; every app in this cluster has it.
- **Multi-user data separation** as a privacy pattern (irrelevant for single-user PersonalOS, but the *concept* — strict per-user scoping of sensitive metrics — maps to per-data-type scoping).
- **Anti-pattern to avoid:** trendline-only views that hide raw points (users revolt; they want dots AND line, à la Libra/Happy Scale).

Sources: https://www.makeuseof.com/withings-body-smart-review · https://www.withings.com/en-us/collections/scales · https://www.trolley.co.uk/product/withings-body-bmi-wi-fi-scale-white/TUX406 · https://www.amazon.com/Withings-Nokia-Body-Composition-smartphone/dp/B072C4XB3G · https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa · https://wearablewellnessguide.com/body-composition-tracking/smart-scales-compared

---

# FitTrack (Dara smart scale ecosystem)

## 1. Overview

Budget BIA smart scale + app ecosystem (Dara ≈ $89.95; also Atria smartwatch, food-scanning). 17 biometric estimates per weigh-in; up to 8 profiles; Bluetooth-only (no Wi-Fi). App: FitTrack Health/Pro dashboard with monthly charts, goals, coaching programs, FoodScan nutrition tie-in (https://medgrade.org/reviews/fittrack-dara-bmi-smart-scale-review/, https://www.zoopy.com/fittrack-dara-review/).

## 2. Core paradigm

Scale-first BIA: step on → 17 numbers → app charts. Includes non-weight metrics unusual for the category: **metabolic age**, protein rate/mass, subcutaneous fat, visceral fat index, "weight without fat," standard weight (https://www.zoopy.com/fittrack-dara-review/). Athlete mode + infant mode. No trend-smoothing engine of note; "monthly charts" and goals are the analysis layer (https://www.zoopy.com/fittrack-dara-review/).

## 3. Trend math

Not documented/meaningful — monthly chart views, no moving average or noise handling. Relevant as a contrast: numbers-first BIA apps without trend math leave users at the mercy of daily hydration noise (reviewers note "occasional inconsistencies in measurements, particularly body fat percentages" — https://pixoneye.com/fittrack-dara-reviews).

## 4. Physique photo features

None.

## 5. Body composition estimation — real-world DEXA data points

This is the cluster's most useful contribution: independent DXA-validation numbers for a consumer BIA scale.
- MedGrade 8-week, 28-adult study vs DXA: weight error ±0.2 kg; **body-fat error +4.8 percentage points vs DXA** (systematically high); lean-mass estimates deviated 3.1 kg; ranked 16/20 body-composition scales (https://medgrade.org/reviews/fittrack-dara-bmi-smart-scale-review/).
- Blogger vs DEXA: Dara said ~20% body fat, DEXA said 22% — "within 2%" (https://theadultman.com/health-and-fitness/fittrack-review/); TechRadar: tallied "almost exactly" with gym commercial scales (https://www.techradar.com/reviews/fittrack-dara).
- Marketing claims "±3% off DEXA" (https://www.zoopy.com/fittrack-dara-review/) — individual results vary; population bias can be ±5 points.
- Broader BIA science (for the report's accuracy section): hospital validation of three consumer scales vs DXA found fat-mass errors −2.2 to −4.4 kg; body-fat bias across literature −4.0 to +4.6 points (https://kcalm.app/blog/smart-scale-body-fat-accuracy-bia-vs-dxa/); hydration drives daily variance — a 2% drop in body water can shift body-fat readings 3–4 points (https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa).

## 6. GUI layout

- **Dashboard:** today's 17 metrics in grid tiles; weight hero; monthly chart views; goal progress.
- **Metrics explainer:** each metric has an in-app "how it's calculated" explanation (https://www.zoopy.com/fittrack-dara-review/) — trust-through-education pattern worth copying (PersonalOS: derived-only metrics should ship with their derivation on tap).
- **Goals/programs:** coaching guides (eat right, lose weight, sleep, exercise).
- **Profile/multi-user:** 8 profiles with auto-recognition.

## 7. Differentiators & steal-worthy features

- **Per-metric explainers ("how this is calculated")** — the single most transferable pattern; PersonalOS's TDEE (Mifflin-St Jeor) + signed additive rate and trend math should each have a tap-to-explain screen (MacroFactor's "How We Got Here" and FitTrack's explainers converge on the same UX truth).
- **Realistic expectation-setting for BIA-derived numbers:** the DEXA-comparison data above is the honest framing for any body-fat display: absolute value unreliable (±3–5 pts), direction/trend meaningful. If PersonalOS surfaces body fat at all, it should be derived-only, labeled as estimate, and trended.
- **"Metabolic age" style framing** — a single legible derived score; risky/novelty-flavored; PersonalOS already has weight ladder + rate-vs-target as its legible scores; skip.
- **Anti-pattern:** 17 numbers with no trend engine = noise theater; only trended, derived metrics survive.

Sources: https://medgrade.org/reviews/fittrack-dara-bmi-smart-scale-review/ · https://www.zoopy.com/fittrack-dara-review/ · https://theadultman.com/health-and-fitness/fittrack-review/ · https://www.techradar.com/reviews/fittrack-dara · https://kcalm.app/blog/smart-scale-body-fat-accuracy-bia-vs-dxa/ · https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa

---

# BodySpace (Bodybuilding.com)

## 1. Overview

Free social fitness app from Bodybuilding.com: workout logging + programs + community + progress tracking. Free, ad-light; being folded into the newer Bodybuilding.com app ("all the essential features you've come to rely on from our previous app are fully integrated" — https://support.bodybuilding.com/en-US/articles/bodybuildingcom-app-225629). Positioning: social accountability ("world's largest online fitness community") — the opposite pole of PersonalOS's privacy-first single-user stance.

## 2. Core paradigm

Log workouts (sets/reps/weights), log body stats, attach **progress photos**, browse community/plans; BodyCalendar with reminders keeps the habit loop. Progress = "progress photos and stats combined for accountability" (https://www.tokenpedia.com/com.bodybuilding.mobile). Social by default; photos and stats live on the public profile — a privacy posture PersonalOS explicitly rejects, but the *photo-as-accountability* mechanic is the transferable part.

## 3. Trend math

Minimal (charts of weight/measurements over time; no published smoothing). Not a trend product.

## 4. Physique photo features

Photo galleries on user profiles + attached to workout logs; used for community transformation threads. No guided consistency tooling (no ghost overlays in the category of Metamorph — review of the replacement app confirms photo tools are secondary; App Store reviews: "bring back bodyspace" — https://apps.apple.com/au/app/bodybuilding-com-fitness-app/id1389506691). Historical value: BodySpace normalized the progress-photo habit for a generation of lifters; its failure (public, unstructured, no consistency support) is the gap PersonalOS's private guided timeline fills.

## 5. Body composition estimation

Body measurements logging (waist, arms, etc.) + weight; no BIA. "Trackable health metrics" in the new app (https://shop.bodybuilding.com/blogs/training/5-reasons-to-download-the-bodybuilding-com-app).

## 6. GUI layout

- **Profile:** avatar, stats, progress photo gallery (public), transformation posts.
- **Workout log:** routine builder, exercise videos, set/rep/weight entry, BodyCalendar with reminders.
- **Programs:** community-created plans, ratings, store tie-ins.
- (Being superseded by the Bodybuilding.com app; BodySpace-specific screenshots largely historical.)

## 7. Differentiators & steal-worthy features

- **Progress photos attached to the same record as workouts/stats** — the photo is part of the log entry, not a separate album; PersonalOS's D031 attaches monthly photos to journal entries — same pattern, private.
- **Transformation threads (before → after as a social artifact)** — the private analogue is PersonalOS's side-by-side/slider compare with share-optional export.
- **BodyCalendar habit scaffolding** — scheduled reminders with visible calendar streaks; PersonalOS's weigh-in cadence reminders without XP.
- **Anti-pattern:** public-by-default body data; never default-sensitive body photos to any share surface.

Sources: https://www.tokenpedia.com/com.bodybuilding.mobile · https://support.bodybuilding.com/en-US/articles/bodybuildingcom-app-225629 · https://apps.apple.com/au/app/bodybuilding-com-fitness-app/id1389506691 · https://shop.bodybuilding.com/blogs/training/5-reasons-to-download-the-bodybuilding-com-app · https://thedroidguy.com/best-bodybuilding-apps-1096217

---

# Progress-photo apps (Metamorph, Progress, Progress Pics Body Tracker, Body Tracker, Photo Compare, LocalOne Gym Pics, MyFitnessPal, Hevy, Body Measurement Tracker & Log)

## 1. Overview

A fast-moving 2025–26 category: apps whose only job is consistent physique photos + comparison. Prices: free–$5.99/mo; several are one-time-purchase or free (https://www.resolutely.app/blog/best-progress-photo-apps, https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps). Positioning split: (a) private consistent-tracking tools (Metamorph, Progress, Progress Pics Body Tracker, LocalOne Gym Pics), (b) social-sharing collage tools (Photo Compare — "polished collages with slider and video effects," $4.99/wk — https://www.bodytrackerapp.com/blog/best-apps-for-progress-photos), (c) secondary features inside big apps (MyFitnessPal free photo-per-weigh-in; Hevy photo + 21-measurement logging).

## 2. Core paradigm

Solve the **consistency problem** — "the best progress photo app removes that guesswork. If it shows you how to match your last shot, you can trust your comparisons" (https://tinyideas.net/metamorph/blog/best-progress-photo-app-iphone). Core loop: schedule reminder → guided capture (ghost overlay of last photo to match position/angle/zoom) → store privately → compare. Category consensus on photo protocol: same lighting, background, pose, distance; front/side/back angles; timestamped; fixed camera position propped not held (https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349, https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps).

## 3. Trend math

Not applicable to photos; the equivalent is **alignment math**: ghost overlays (Metamorph, PhotoJourney), auto-alignment (Body Tracker claims "auto alignment"), and slider/divide comparison (Body Measurement Tracker & Log). Weight/measurement charts exist in Progress and Hevy but without documented smoothing.

## 4. Physique photo features (the meat)

- **Metamorph** (best-in-class per 2026 tests, https://tinyideas.net/metamorph/blog/best-progress-photo-app-iphone): guided alignment overlay = ghost of previous photo; multiple independent series (front/side/back, flexed/relaxed); schedule reminders; exports as before/after **videos, GIFs, side-by-side**; photos stay on device/iCloud, "never uploaded."
- **Progress (Lasmit)**: manual tape measurements + photos in one private journal; **photos stored inside the app, not the camera roll** ("they don't even go into the Photos app... No one at Progress can ever access your photos"); PIN lock; weekly photo reminders; side-by-side; one-time purchase (https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps).
- **Progress Pics – Body Tracker**: "Private by design. Everything is stored locally first. Lock the app behind Face ID, Touch ID, or a PIN"; side-by-side in one tap (any two check-ins); **built-in time-lapse** turning the whole journey into a video; no social feed (https://apps.apple.com/us/app/progress-pics-body-tracker/id6747368316).
- **Body Tracker: Progress Photos**: timeline organized by angle (front/side/back) + auto alignment (https://www.bodytrackerapp.com/blog/best-apps-for-progress-photos).
- **Photo Compare**: social-share-focused — pick two photos, layout/slider/text effects, export polished image or video (https://www.bodytrackerapp.com/blog/best-apps-for-progress-photos).
- **LocalOne Gym Pics**: fully offline, no account, on-device storage, automatic timestamps (https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps).
- **SnapTrack**: PIN lock + keeps photos out of the camera roll (https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps).
- **MyFitnessPal**: free progress photo attached directly to a weigh-in (More → Weight and Measurements → Weight → + → camera); can attach to a past weigh-in; private in-app; no web support; **no built-in side-by-side** (https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349).
- **Hevy**: measurement list with **left/right separations** (biceps, forearms, thighs, calves L/R) + 3 photo angles; photos a secondary feature (https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349).
- **Body Measurement Tracker & Log**: side-by-side compare with **sliding divider + before/after date stamps**, per-body-part goals, trend graphs (https://mwm.ai/apps/body-measurement-tracker-log/6748995406).
- **MacroFactor's variant** (covered above): 1 front/side/back per day, before/after builder with matched background, share sheet.

## 5. Body composition estimation

Only via manual measurements (Progress, Hevy) — no BIA/photo-derived body fat in the leading tools. Category lesson: photos + tape numbers, no fake body-fat estimates.

## 6. GUI layout

- **Capture screen:** camera viewfinder with ghost overlay (Metamorph) / framing guides (Body Measurement Tracker & Log: "quick on-screen framing so your camera body angle stays consistent"); angle selector (front/side/back); auto timestamp.
- **Timeline:** date-ordered grid grouped by angle (Body Tracker) or series (Metamorph); week-number labels.
- **Compare screen:** pick two check-ins → side-by-side; slider divider drag; date stamps; optional share/export (collage, GIF, video).
- **Detail screens:** per-check-in measurements + photo; per-body-part goal pickers; trend graphs.
- **Privacy screens:** app lock (Face ID/Touch ID/PIN — Progress, Progress Pics, SnapTrack), storage-location disclosure ("your photos live in the app on your device"), local-first badges.

## 7. Differentiators & steal-worthy features

- **Ghost-overlay alignment** is THE feature to steal for PersonalOS's physique timeline: previous-photo ghost under the live camera makes monthly consistency nearly automatic and cheap to build.
- **Photos outside the camera roll + app lock + local-only storage** — the exact privacy posture PersonalOS needs for body photos; plus "no fake data" alignment: real photos, no AI touch-ups (the AI glow-up tools in the media.io/Photo Compare lane are explicitly NOT wanted).
- **Angle-grouped timelines (front/side/back as separate series)** — matches MacroFactor's 1-per-day structure and makes slider comparisons honest.
- **Time-lapse export of the full journey** — the highest-motivation artifact; built from existing photos, derived-only, no XP involved.
- **Attach-photo-to-past-weigh-in (MFP)** — forgiving capture flow (photo taken late still lands on the right day); direct fit for D031 photo-on-journal-entry.
- **Left/right measurement separation (Hevy)** — for symmetry awareness; optional.
- **Reminder cadence as the habit engine** (Progress, Metamorph schedules) — monthly reminders for PersonalOS's monthly physique photos, weekly for weigh-ins.

Sources: https://tinyideas.net/metamorph/blog/best-progress-photo-app-iphone · https://localonelabs.com/pages/blog/best-fitness-progress-photo-apps · https://www.bodytrackerapp.com/blog/best-apps-for-progress-photos · https://www.resolutely.app/blog/best-progress-photo-apps · https://nutriscan.app/blog/posts/best-app-progress-photos-body-measurements-2026-a165923349 · https://apps.apple.com/us/app/progress-pics-body-tracker/id6747368316 · https://mwm.ai/apps/body-measurement-tracker-log/6748995406

---

# Home body-composition alternatives: Visbody, 3DLOOK, Size Stream, DEXA/BIA science

## 1. Overview

The hardware+AI tier between tape/scale and clinical DEXA: gym/clinic turntable scanners (Visbody ~$10.8–12K — https://www.accio.com/plp/3d-body-composition-analyzer), phone-camera SDK scanners (Size Stream mobile, 3DLOOK, SnapMeasureAI), and the clinical gold standard (DEXA, $100–300/scan — https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa). For PersonalOS the relevance is: what derived body-composition numbers can be trusted at home, and what accuracy labels should derived metrics carry.

## 2. Core paradigms

- **Visbody**: commercial turntable (one 32-second rotation) + depth-sensing 3D camera + AI optical reconstruction → real 3D model, 9 circumferences at "millimeter-level," segmental fat/muscle, posture analysis; combines optical 3D + multi-frequency BIA (https://visbody.com/knowledge-base/, https://visbody.com/blog/how-accurate-is-the-visbody-composition-scanner/, https://www.fit3d.com/blog/visbody-scanner-comparison).
- **3DLOOK**: SDK/API phone-camera scanning for enterprises; claims 96–97% measurement accuracy, 3.5% weight-prediction error, 95% repeatability, BMI 89% accuracy (https://3dlook.ai/).
- **Size Stream mobile**: two guided poses → 240+ measurements, "same precision as in-person systems," validated over millions of scans (https://www.sizestream.com/mobile-scanning/).
- **SnapMeasureAI**: 2 photos → 100+ measurements; claims error within half an inch on major measurements (https://snapmeasureai.com/).
- **Naked Labs / ShapeScale**: home hardware (rotating scale + mirror) and optical-scan apps in the commercial lane (https://business.shapescale.com/content/posts/scan-body-3d-guide).

## 3. Trend math

None of these do weight trending — they output measurement snapshots. The consumer-grade lesson is consistent across reviewers: **photogrammetry/optical measures are trend tools, not absolute-truth tools** ("If your waist measurement drops by an inch over two months, that trend is real, even if the starting number was slightly different" — https://biologyinsights.com/how-accurate-is-zozofit-measurements-vs-body-fat/).

## 4. Physique photo features

N/A (3D meshes replace photos).

## 5. Body composition estimation — what's worth trusting (synthesis of sources)

- **DEXA**: gold standard, ±1–2% body fat; use for baselines and program start/end verification, 2–4×/year (https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa).
- **Consumer BIA scales**: ±3–5% vs DEXA (Kyle et al. 2004 Clin Nutr, via https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa); foot-to-foot ±3.5–5%, segmental (Withings Body Comp class) ±2–4%; correlation r = 0.65–0.80 (https://wearablewellnessguide.com/body-composition-tracking/smart-scales-compared). Hospital validation: fat-mass errors −2.2 to −4.4 kg; bias −4.0 to +4.6 points across literature (https://kcalm.app/blog/smart-scale-body-fat-accuracy-bia-vs-dxa/). Hydration sensitivity: 2% water change ⇒ 3–4 point body-fat swing (https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa).
- **Arm-to-arm BIA vs DXA (college students, PMC)**: "use in estimating body composition... might be questionable due to large variations" (https://pmc.ncbi.nlm.nih.gov/articles/PMC5685086/).
- **BIA calibration**: percentile/OLS calibration against DEXA meaningfully reduces systematic error — but trunk and leg FFM don't calibrate well (https://www.sciencedirect.com/science/article/pii/S2405457725031560) — i.e., even statistical fixes fail on some segments.
- **Tape/navy method** (used by ZOZOFIT): free, no equipment; body-fat accuracy similar ballpark to BIA (population equations), but circumferences themselves are reliable with the MacroFactor 2-of-3 protocol.
- **3D optical**: circumferences within ~0.5 inch of tape typically (SnapMeasureAI claim); body fat from shape is the weakest estimate (no DEXA validation published by major vendors — https://biologyinsights.com/how-accurate-is-zozofit-measurements-vs-body-fat/).
- **Bottom line for PersonalOS**: weight trend (trust), circumferences with strict protocol (trust the change, ~0.5–1 cm noise), anything %-body-fat from consumer gear (label "estimate," trend only, expect ±3–5 pt absolute error). Judge the direction of the line, not the digits — https://gainframe.app/blog/best-body-scanning-measurement-apps/.

## 6. GUI layout

- **Visbody**: touchscreen kiosk flow (scan → report: 3D model, circumferences, segmental composition, posture) + WellnessHub app dashboards; "easy-to-understand reports" cited as a key UX feature (https://visbody.com/blog/how-accurate-is-the-visbody-composition-scanner/).
- **SDK apps (Size Stream/3DLOOK)**: guided two-pose capture → processing → measurement sheet → optional API handoff; "only measurement data is stored or transmitted," images processed securely (https://www.sizestream.com/mobile-scanning/).

## 7. Differentiators & steal-worthy features

- **The accuracy-ladder framing** (DEXA > segmental BIA > foot-to-foot BIA > tape > shape-derived) as honest labeling for any derived metric PersonalOS shows; reviewers' consensus "trend not absolute truth" should be encoded in UI copy.
- **"Standardize everything, then judge the direction"** — PersonalOS's canonical first-of-day rule + photo protocol is this principle made operational.
- **Report legibility (Visbody)** — one-page report design (model + numbers + deltas) is a good template for PersonalOS's monthly physique summary.
- **Privacy-by-architecture (Size Stream): "only measurement data is stored or transmitted"** — for PersonalOS, photos never leave the device; only derived numbers could ever sync.
- **Anti-pattern:** BIA/optical body-fat % as a hero metric (FitTrack's +4.8 pt error class of failures).

Sources: https://visbody.com/knowledge-base/ · https://visbody.com/blog/how-accurate-is-the-visbody-composition-scanner/ · https://www.fit3d.com/blog/visbody-scanner-comparison · https://www.accio.com/plp/3d-body-composition-analyzer · https://3dlook.ai/ · https://www.sizestream.com/mobile-scanning/ · https://snapmeasureai.com/ · https://business.shapescale.com/content/posts/scan-body-3d-guide · https://wearablewellnessguide.com/body-composition-tracking/bia-vs-dexa · https://wearablewellnessguide.com/body-composition-tracking/smart-scales-compared · https://kcalm.app/blog/smart-scale-body-fat-accuracy-bia-vs-dxa/ · https://pmc.ncbi.nlm.nih.gov/articles/PMC5685086/ · https://www.sciencedirect.com/science/article/pii/S2405457725031560 · https://biologyinsights.com/how-accurate-is-zozofit-measurements-vs-body-fat/ · https://gainframe.app/blog/best-body-scanning-measurement-apps/

---

# StyleScan — dead-end note

The brief listed StyleScan as a body/photo-comparison utility. Research finding: **stylescan.com is an AI virtual-dressing / visual-merchandising product for apparel e-commerce** (on-model image generation, ghost mannequins, 500+ model database — https://stylescan.com/), not a consumer body-composition or physique-tracking tool, and unrelated to body-scan apps. It converts garment 2D photos to 3D meshes for online shopping (https://3dshoes.com/news/stylescan-is-using-3d-technology-to-improve-online-shopping/). No body-tracking relevance to PersonalOS; excluded from further coverage.

---

# Synthesis: what to steal for PersonalOS BODY

1. **Trend engine = Libra's time-indexed EMA** (`power = 1 − e^(Δt/smoothingTime)`, smoothingTime = 7 days) with **Happy Scale's layering**: trend (EMA) separate from rate (regression slope over the last N trend points) separate from prediction (slope extrapolation). Gap-tolerating by construction — the thin-week rule (<5 days = no data) can safely *compute nothing* while the trend quietly tolerates short gaps (MacroFactor's interpolation is the alternative, but it fabricates data — against PersonalOS's no-fake-data rule; the EMA needs no fabrication).
2. **Stall detection = trend-slope over 4 consecutive weekly deltas** (PersonalOS spec) validated against the cluster: MacroFactor starts treating a deviation as signal at ~day 4–5; Hacker's Diet says judge only when "still quite a bit heavier/lighter by day four or five, especially if accelerating"; Happy Scale/Libra simply show the trend flattening. A 4-week out-of-direction rule is on the conservative, no-false-alarm side of everything found — good. Display it as: weekly deltas vs phase target rate (bulk +0.25–0.5, cut −0.5 kg/wk) in a "rate vs target" bar (MacroFactor pace concept + Happy Scale weekly-rate readout).
3. **Water-jump handling = 30-day green/red banding** (Happy Scale) + floats/sinkers dots (Libra/Hacker's Diet): one spike reads as a sliver; a "plateau" with sinkers below the line is visibly not a stall. The 7-day rolling average (PersonalOS canonical rule) is exactly the EMA-with-smoothingTime-7 answer.
4. **Milestone ladder = Happy Scale's milestone system** (hero ring, "Milestone 6", celebration states, % to next rung) applied to the 70/75/80/85/90/95/100 kg ladder, with **Libra's forecast-to-date** ("you'll reach 80 kg on ~date, based on current slope") and **MacroFactor's goal-boundary photos** (photo at each ladder rung's start/end). The 2-consecutive-weekly-checkpoint confirmation is stricter than anything in the cluster (all confirm on a single trend/milestone crossing) — a defensible anti-false-celebration rule; pair the celebration with "confirmed by 2 consecutive weeks" copy.
5. **Physique timeline = Metamorph ghost overlay + angle-grouped series + MacroFactor monthly cadence + Progress-style on-device storage with app lock + MFP-style attach-photo-to-past-date + slider divider compare with date stamps (Body Measurement Tracker & Log) + optional time-lapse export (Progress Pics)**. Privacy: photos never leave the device; no AI touch-ups (Photo Compare/media.io lane explicitly rejected — fake-data violation).
6. **Weigh-in UX = Happy Scale one-tap "+" with tally-reveal animation + optional Withings "Eyes Closed" mode** (hide the number, record it) + canonical first-of-day prompt (morning, post-bathroom, pre-food — Libra/Withings protocol) + weekly-rate-and-moving-average readouts in the log. No XP: all feedback is derived, per the "no XP for logging" constraint — the cluster's best apps (MacroFactor's adherence-neutral tone, Happy Scale's absence of shame) prove motivation needs no points.
7. **Trust = explainers everywhere**: MacroFactor "How We Got Here" predictions, FitTrack per-metric explanations, Libra's published formula, MacroFactor's measurement-reliability protocol (2-of-3 averaging, landmark notes). Every derived metric in PersonalOS (trend, rate, TDEE, phase targets, stall status, ladder forecasts) ships with a tap-to-explain screen. And body-fat % should be labeled per the accuracy ladder (estimate; ±3–5 pt; trust the trend only) or omitted entirely.
8. **Anti-patterns to avoid (documented failures)**: trendline-only charts that hide raw points (Withings user revolt); 17 untrended numbers (FitTrack noise theater); scan drift from algorithm updates eroding trust (MeThreeSixty); public-by-default body photos (BodySpace); prediction/visualization tools that degrade body image (MeThreeSixty Future Me, Rate My Physique AI generators — reviews show real distress).
