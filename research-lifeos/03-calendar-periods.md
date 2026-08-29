# Research: Calendar & Periods — Apps, Patterns, and Steal-worthy Features for PersonalOS (M6)

Research date: 2026-08. Scope: year heatmap (tint-only), day view (derived chronological feed), plan-vs-actual toggle, goal deadline rings, on-this-day strip, periods (vacation/term/holiday containers), month-header fact lines, filter chips, week recap strip. Constraint: tint-only calendar, offline-first, no shame.

Cluster covered: Google Calendar, Fantastical (+ Flexibits patterns), Cron/Notion Calendar, Apple Calendar (+ year-view companion apps), Timepage, Sunsama + Reclaim.ai (day view / plan-vs-actual), Polarsteps, TripIt, GitHub contribution graph, Year in Pixels family, Life Calendar (90-weeks grid).

---

## 1. Google Calendar (the reference)

### 1.1 Overview
The world's default calendar: free, web + iOS + Android, tied to Google account; also the reference for personal-life scheduling (arahr.com/calendar-apps). Its event model is the industry baseline: events with start/end (timed, all-day, or multi-day), calendars (color-coded streams), tasks (Google Tasks merged in), reminders. It is the standard every other calendar is measured against — its failures (no real year view, dots-only density on mobile) are as instructive as its strengths (https://support.google.com/calendar/answer/6110849; https://kalnext.com/google-calendar-year-view).

### 1.2 Core paradigm
Week-centric on desktop, day/agenda-centric on mobile. Web views: Day, Week, Month, Year, Schedule, 4-days (https://support.google.com/calendar/answer/6110849). Mobile: agenda-first with swipe between days; month grid used as navigation (https://www.eleken.co/blog-posts/calendar-ui). 2024-2025 updates added month chips for far-future navigation (https://www.androidpolice.com/google-calendar-chips-month-navigation/) and a Material 3 Expressive redesign where month cells become rounded card-like rectangles (https://www.androidpolice.com/google-calendar-redesign-enable/).

### 1.3 Month view (DEEP)
- **Web grid anatomy**: 7 columns (Sun–Sat), 5-6 rows, day number in top-left of each cell, event chips as colored blocks with truncated title + start time. Density rule: roughly 3-4 chips visible, then "+N more" overflow; hovering/tapping a cell opens a day popover with the full list. Tasks appear alongside events in the same grid (https://bricxlabs.com/blogs/calendar-ui-examples).
- **Mobile**: month cells show a day number and up to ~4 colored dots (one per calendar with an event) — no text at all. Dots are so beloved that a Chrome extension adds the same dots to the desktop mini-calendar ("Transform your Google Calendar sidebar with visual event dots ... Just like the mobile app") (https://chromewebstore.google.com/detail/event-dots-for-google-cal/hjjlnloajchjbjlmdleheopcglglkjff).
- **Day-cell content rules**: presence (a dot) at the smallest scale; presence + count via dots per calendar; presence + identity (color) + time via chips on desktop. The mobile→desktop gap proves a hierarchy: dots signal *that something exists*, chips signal *what*.
- **2025 M3 Expressive redesign**: each date wrapped in its own rounded rectangle ("card-like, separated look") — notably it produced a Hermann grid illusion where light lines between boxes create phantom gray dots at intersections (https://www.androidpolice.com/google-calendar-redesign-enable/). Lesson for PersonalOS: cell containers must be visually separated without creating ghost artifacts; tint fills need controlled gaps.
- **Today** is always outlined/highlighted in month view — universally expected, explicitly called out as a standard element even in third-party UI (https://community.retool.com/t/calendar-month-view-show-today/46826).

### 1.4 Year view / heatmap (DEEP)
- Google DOES have a web Year view (12 mini-months), but it shows **only colored dots — no event names, no interaction, no tasks, not on mobile** (https://support.google.com/calendar/answer/6110849; https://support.google.com/calendar/thread/210501858; https://kalnext.com/google-calendar-year-view). The community answer: "Not with the current state of Google calendar :-(".
- This is the strongest evidence for the PersonalOS tint-only rule: at year scale, Google's own product collapses to *presence dots* — the market's best-funded calendar renders a year as 365 dots and still calls it a feature. Tint-only at 12-mini-month scale is not a compromise; it is where the entire category converges.
- Third-party add-ons (Kalnext, OnePageYear) sell precisely the missing layer: event names per month cell at year scale — but those become unreadable as soon as a month is busy; the dot/tint layer is what actually survives at that density (https://kalnext.com/google-calendar-year-view; https://onepageyear.com/).
- Missing days: not shown at all — empty cells are just empty. No moral valence attached to gaps in the calendar mainstream (contrast with GitHub, below).

### 1.5 Day view
- Web day view: hour-grid with event blocks sized by duration, all-day events as a top strip. Mobile day view: the same vertical flow, with agenda list below the selected date (https://www.eleken.co/blog-posts/calendar-ui). Schedule/agenda view lists events chronologically with start+end times — the "derived chronological feed" pattern PersonalOS wants, but for *calendar events*, not life data.

### 1.6 Periods & trips
No native period entity. Users fake it: dedicated vacation calendars (color-coded), all-day multi-day events, or "out of office". The system-design docs treat the event as the only time entity (https://www.systemdesignhandbook.com/guides/google-calendar-system-design). This absence is itself instructive: a single-user life app with real period entities (vacation/term/holiday) has no competition from the reference product.

### 1.7 GUI layout
- Month (desktop): toolbar (Month/Week/Day/Year/Schedule + Today + arrows) → 7-col grid → cell = number + chips (+N more) → click cell opens day popover → click event opens editor.
- Year: 12 mini-months (3 rows × 4) of dot cells; each mini-month is a 7-col grid, weekday letters faint above.
- Mobile: month grid (dots) at top, agenda below; swipe = day-to-day.

### 1.8 Differentiators & steal-worthy
1. **"+N more" overflow rule** — the canonical month-cell density law: show ~3, overflow into a popover. PersonalOS month cells show tints + deadline rings; overflow content belongs to the day view, not the cell.
2. **Dots-because-it-works**: Google's own year view proves glyph-less presence marks are sufficient at scale.
3. **Card-cell anti-pattern (Hermann grid)**: keep cell separators subtle — tinted cells with hairline gaps, not floating rounded cards.

---

## 2. Fantastical (Flexibits) — the reference for year-view heatmaps

### 2.1 Overview
The most-praised Apple-ecosystem calendar app (Mac, iPhone, iPad, Apple Watch, Windows since 2024, Vision Pro). Free tier; Flexibits Premium ~$4.99-6.99/mo or ~$57/yr (https://www.thesunrisedigest.com/focus/fantastical-review-2026/; https://efficient.app/apps/fantastical). Editors' Choice, "Mac App of the Year", Apple Design Award (https://flexibits.com/fantastical). Famous for natural-language event creation ("Lunch with Sarah at 1pm tomorrow"), calendar sets, weather, and its **heatmap Year view**.

### 2.2 Core paradigm
Event-list + grid hybrid. The **DayTicker** is its signature: a horizontal timeline of upcoming events as colored pills showing time-of-day position; swipe through days; the calendar below syncs to the selected date (https://flexibits.com/fantastical-ios/help/calendar-views). Views: DayTicker, Day, Week, Month, Quarter, Year (https://flexibits.com/blog/2022/07/hows-the-view-from-here-getting-the-most-out-of-fantasticals-calendar-views/). Month cell dots are color-coded per calendar ("how many events you have for each day indicated by color coded dots") (https://flexibits.com/fantastical-ios/help/calendar-views).

### 2.3 Month view (DEEP)
- Compact calendar with per-calendar **color dots** under/next to the day number; pull down to expand to full-screen month; below the grid, the DayTicker lists the day's events as pills arranged by time.
- The "mini-calendar + event list" split is the pattern: grid = navigation + presence, list = content. This is precisely PersonalOS's month→day relationship (tints = volume, day view = content), with the dots standing in for tints.
- Full-screen month: day cells show event chips/dots; weather forecast inline; tap-and-drag events to move.

### 2.4 Year view / heatmap (DEEP — the most important reference for PersonalOS)
- **Fantastical's Year view is a true heatmap**: "Year view uses a 'heat map' to display your events. Days with a darker color will have more events than those with a lighter color. Tap a day to instantly jump to it." (https://flexibits.com/fantastical-ios/help/calendar-views).
- Reviewers consistently single it out: "On the year view, hovering on the day shows you the scheduled dates. Fantastical uses colour intensity to show how busy your days are. The lighter the highlighter, the more relaxed your day. **This is the best year view we have ever seen in a calendar app so far.** It helps you know what days to schedule more work on, and which ones are less packed." (https://beingpaperless.com/fantastical-for-mac-complete-review-2023/).
- Anatomy: 12 mini-months; each day cell tinted by event count (darker = busier); a single hue with intensity levels (not multi-hue); hover = tooltip with dates; tap = drill to that day. **One hue, 4-5 intensity steps, zero glyphs** — this is a production proof of PersonalOS's tint-only year view, and it reads "volume" exactly as the M6 spec requires.
- Quarter view (3 months) is the intermediate zoom between month and year (https://flexibits.com/blog/2022/07/hows-the-view-from-here-getting-the-most-out-of-fantasticals-calendar-views/).

### 2.5 Day view
- Full-screen day = vertical timeline; tap-hold-drag events to reschedule, drag edges to resize (https://flexibits.com/fantastical-ios/help/calendar-views). The DayTicker pills show time-of-day position without a clock — the "derived timeline" idea in miniature.
- Travel use-case is documented by Flexibits themselves: day view as the itinerary surface for trips (flights, gate info, locations in one place) (https://flexibits.com/blog/2022/07/...calendar-views).

### 2.6 Periods & trips
No period entity; but the **DayTicker-as-itinerary** and all-day event bars spanning multiple days in Quarter view ("bars that indicate all-day events spanning over several days — that's probably the main reason to use this view", beingpaperless) show the range-visualization need that PersonalOS's period entity will own natively.

### 2.7 GUI layout
- iPhone: DayTicker (top) → mini calendar (pull down) → full-screen view (pull down again). Month: grid + selected-day event list below. Year: 12 mini-months heatmap; tap day → jumps to that day's list.
- iPad/Mac: sidebar with mini-calendar + upcoming summary; main pane switches Day/Week/Month/Quarter/Year; view buttons + right-click to customize days-per-view (https://flexibits.com/fantastical-windows/help/calendar-views).

### 2.8 Differentiators & steal-worthy
1. **Heatmap year view = the direct precedent for PersonalOS's year heatmap** (single-hue intensity, tap-to-day). PersonalOS replaces "event count" with "activity volume" and adds a per-activity hue — a strict superset.
2. **Color-coded dots as presence** in the compact month calendar (Fantastical) vs. chips (Google web): PersonalOS month = tinted cells (volume) + deadline ring, no dots needed.
3. **Hover/tooltip detail at year scale**: PersonalOS year mini-months should expose a date tooltip (e.g., "22/31 logged" per month) without glyphs in the cells.
4. **DayTicker as "on-this-day" strip precedent**: a horizontal, time-ordered, pill-based strip is the visual language for the memory strip.

---

## 3. Cron / Notion Calendar

### 3.1 Overview
Cron: 2020-2022 keyboard-first calendar by Raphael Schaad, acquired by Notion in June 2022, relaunched as Notion Calendar — free, web + desktop (macOS/Windows) + iOS/Android (https://us.acrofan.com/detail.php?number=677062; https://aisotools.com/blog/notion-calendar-review-2026). Philosophy: "The calendar should be an active instrument for time management, not a passive display" (https://blakecrosley.com/guides/design/notion-calendar). No paid tier — monetized as a Notion value-add (https://aisotools.com/blog/notion-calendar-review-2026).

### 3.2 Core paradigm
Grid + command bar. D/W/M keys for day/week/month; keys 2-9 for N-day views; Cmd/Ctrl+K command palette; week numbers toggle ("an excellent way to track your yearly progress" — https://cronhq.notion.site/Calendar-view-options-329f8bc37d8f4c509f7fd56a220a584e). Events link to Notion pages/databases: an event is "a link to the product spec, the metrics dashboard, and the decision log" (blakecrosley). Time-blocking by dragging Notion database tasks onto the grid (https://toolnerdy.com/notion-calendar-review-2026-the-free-calendar-that-makes-notion-users-unstoppable/).

### 3.3 Month view (DEEP)
- **Swiss-precision grid**: 1px grid lines at 9% opacity — "visible enough to organize but not heavy enough to compete with event content" (blakecrosley). Events are soft color fills with darker text from an 8-color palette. Monospaced time numerals in the gutter so 9:00/10:00/11:00 align perfectly.
- **Typographic hierarchy instead of decoration**: extreme scale contrast (64px headline vs 12px uppercase label headers); near-black `rgba(0,0,0,0.9)` instead of pure black; warm gray surface `rgb(247,247,245)` (blakecrosley).
- **Progressive disclosure**: "minimalism is not the absence of features but the discipline to reveal them progressively" — linked-page indicators stay small and expandable; integration available, not visible (blakecrosley).
- Month view = compact 7-col grid where day cells carry event chips (as a Google overlay); on mobile the month collapses to a navigational grid with the agenda beneath.

### 3.4 Year view / heatmap
None (day/week/month only; not a focus). Notion Calendar's "yearly progress" gesture is week numbers, not a heatmap (https://cronhq.notion.site/Calendar-view-options-329f8bc37d8f4c509f7fd56a220a584e).

### 3.5 Day view
Day view = single-column timeline, minimal chrome, keyboard-driven event creation with 15-minute snap precision click-and-drag (blakecrosley). The event is the atomic unit; day view is where editing happens.

### 3.6 Periods & trips
None — but the **event-as-link pattern** is the data-model lesson for PersonalOS: a day-view line should be a link to its source entity (journal entry, gym session, weigh-in), exactly as a Cron event links to its Notion page (blakecrosley; https://www.catchagent.ai/blog/scheduling/notion-calendar-app).

### 3.7 GUI layout
Day/week/month toggles at top of grid; view selector + `±` for N-day views; week numbers in the gutter; weekends toggle; zoom in/out for density (`shift ⌘ .` / `,`); sidebar for calendars + Notion database items; command bar overlays everything (cronhq docs). Mobile: month + agenda, less feature parity (aisotools).

### 3.8 Differentiators & steal-worthy
1. **Borders at 9% opacity**: grid structure that organizes without competing — the exact treatment for tinted month cells.
2. **Progressive disclosure** ("available, not visible"): PersonalOS day-view lines can embed type + links without making the line itself dense.
3. **Keyboard-first + command palette**: cheap to replicate in a PWA (keyboard shortcuts for view switches) and it makes the tint-only calendar fast to scan.
4. **Week numbers as "yearly progress"** — a no-shame year-progress affordance that PersonalOS's month-header fact line ("22/31 days logged") improves on.

---

## 4. Apple Calendar (+ year-at-a-glance companion apps)

### 4.1 Overview
Free, built into macOS/iOS/iPadOS; the archetype of the minimal personal calendar (arahr.com/calendar-apps). Rating ~4.9 across 1.5M ratings (App Store). Simple, clean, tightly integrated (Reminders merge in iOS 18) (https://applemagazine.com/exploring-the-new-ios-18-calendar-feature/).

### 4.2 Core paradigm
"Day/week/month/year toggle is the spine" — zoom from an afternoon to a whole year at a glance; direct manipulation (drag events, stretch durations, double-click empty space to create); color-coded calendars with sidebar checkboxes to mask/unmask streams (https://typenorm.com/apps/apple-calendar).

### 4.3 Month view (DEEP)
- **Dots, not chips, on iPhone**: iOS month view shows dates with small colored dots indicating events — deliberately minimal, "required users to tap on specific days to see what was scheduled" (applemagazine). iOS 18 added **pinch-to-zoom in month view**: zoom out = dots-only overview; zoom in = event details inline. "Prior to this update, the Month view displayed dates with small colored dots indicating events... The new gesture-based control addresses this limitation" (applemagazine).
- **Zoom-as-density-control is the key pattern**: the same month grid can be dots-only or chip-dense depending on user zoom. For PersonalOS: month grid zoom levels = tint-only → tint + day-number emphasis → tint + mini fact line.
- On macOS, the month grid shows event chips; a busy day "collapses into a stack of clipped, unreadable slivers, pushing you back to the week view to actually read anything" (typenorm) — the density ceiling of chip-based month cells.
- Apple's own developer API (UICalendarView) ships *decorations*: "show users specific dates that have additional information (for example, scheduled events) using decorations that you customize" (https://developer.apple.com/documentation/uikit/uicalendarview) — i.e., Apple's sanctioned month-cell language is a small glyph/decoration attached to the day, not a content cell.

### 4.4 Year view / heatmap
- macOS has a Year view: 12 mini-months, tiny colored dots per day, useful for spotting busy months at a glance (typenorm: "zoom ... out to a whole year at a glance"). It is a presence map — no intensity, no names.
- The gap is so felt that third-party read-only companions exist: "Year View — Year-at-a-glance calendar companion... intentionally read-only: displays events from Apple Calendar and deep-links to native apps" (https://github.com/peterjthomson/year-view), and Yearli ("Your whole year at a glance... the annual overview your calendar app is always missing", free, 4.8 rating) (https://yearli.app/). The market repeatedly rebuilds year views because the platform ones under-deliver — Fantastical's heatmap (2.4) is the ceiling; Apple's dots are the floor.

### 4.5 Day view
List/agenda under the selected day on iPhone; hour-grid on Mac. Events in day view show start times; multi-day all-day events span a band across the grid.

### 4.6 Periods & trips
None. Vacation planning in Apple-land = all-day events or shared color-coded calendars (the Yearli marketing copy explicitly sells "Vacation Planning: see your time off alongside public holidays" as the missing feature) (https://yearli.app/).

### 4.7 GUI layout
- iPhone: month grid (dots) → tap day → list below or full screen; pinch to zoom for density.
- Mac: sidebar (calendars + mini calendar) + main grid; Day/Week/Month/Year segmented control; year view = 12 mini-months of dots.

### 4.8 Differentiators & steal-worthy
1. **Pinch-to-zoom density levels in month view** — PersonalOS can implement zoom levels (tint-only → tint + deadline rings → tint + fact line) as a fixed 3-step control.
2. **Decorations API philosophy**: month cells are a canvas for one small mark (Apple) / one tint (PersonalOS) — never content containers.
3. **The companion-app vacuum**: the persistent demand for year views (Yearli, Year View, Kalnext, OnePageYear all built to fill it) validates PersonalOS's year heatmap as a differentiator, not a nice-to-have.

---

## 5. Timepage (Bonobo) — the month heatmap reference

### 5.1 Overview
Bonobo's premium calendar (iOS/iPadOS/macOS/Watch; ~$1.99/mo or $11.99/yr subscription) (https://www.calendar.com/best-calendar-app/). Positioning: "the most delightful calendar"; 60 hand-crafted themes; weather + maps + travel time merged in (https://bonobolabs.com/timepage/).

### 5.2 Core paradigm
**Timeline + Heat Map.** The Timeline is a vertical, scrollable, day-grouped stream (top day = Today or Yesterday, configurable) — an agenda of the week and beyond, not a fixed week grid (https://apps.apple.com/us/app/timepage-calendar-planner/id989178902; https://bonobolabs.com/support/timepage/navigation/navigating-heat-map/).

### 5.3 Month view (DEEP)
- The **Heat Map is the month view**: a month grid where each day cell is tinted by how many events it holds — "An intuitive month heatmap that instantly shows when you are busy and free" (App Store listing; https://bonobolabs.com/support/timepage/navigation/navigating-heat-map/). Swipe up/down to change months; press-and-hold the preview button to flick between calendars (per-calendar tint preview).
- This is the strongest evidence that **tint-only month grids work as primary UI, not just decorative accents**: Timepage ships no event chips in the month grid at all; the tint IS the month view; content lives in the Timeline beside it.
- Busy/free is the semantics — volume-of-events, single hue — directly analogous to PersonalOS's activity-volume tint, with per-activity hue as the extension.

### 5.4 Year view / heatmap
The heatmap compresses to a year view by sliding left: all 12 months visible, same tint logic, tap a month to return (https://bonobolabs.com/support/timepage/navigation/navigating-heat-map/). Month name tap or slide = year navigation. So the year view is literally the month heatmap at 1/12 scale — exactly PersonalOS's "month → year = 12 mini-months of the same activity tint".

### 5.5 Day view
Timeline day section: events as colored blocks in a scrollable stream; weather forecast and travel-time cards per day; Actions (its to-do companion) renders tasks inline. "A 10 second glance and you know what's on the day's agenda, both appointments and events, and the never-ending list of things to do right there" (App Store review).

### 5.6 Periods & trips
None (events only) — but travel time, weather, and map context per day anticipate the "range with context" idea.

### 5.7 GUI layout
Left: Heat Map (month tint grid). Right: Timeline (scrollable day stream). Press-and-hold Heat Map preview → flick through calendars. Tap month name → year view of 12 tinted mini-months. Day view = single-day Timeline section with weather cards.

### 5.8 Differentiators & steal-worthy
1. **Month heatmap as the primary month view** — the single best precedent for PersonalOS's tint-only month grid (volume semantics, no glyphs, works at year scale by scaling down).
2. **Side-by-side "tint grid + content stream"** — the exact information architecture of PersonalOS's month → day flow; the day view is one pane, not a separate screen.
3. **Press-and-hold calendar preview** — a cheap interaction for PersonalOS's filter chips (hold a chip to preview that activity's tint alone).

---

## 6. Sunsama & Reclaim.ai — day view, plan-vs-actual, time honesty

(Full Sunsama coverage lives in the planner-cluster research; here: the plan-vs-actual and day-feed patterns only.)

### 6.1 Overview
Sunsama: guided daily planner, $20/mo (annual), web/desktop/iOS/Android, "the only task manager, calendar, and daily planner for modern professionals" (https://www.sunsama.com/; https://aisotools.com/blog/sunsama-review-2026). Reclaim.ai: AI calendar assistant, free Lite / ~$10-15/user/mo, web-only (no native mobile) (https://hackceleration.com/labs/review/reclaim; https://marcandrews.com/reclaim-ai-review-2026-is-this-ai-calendar-tool-worth-it/).

### 6.2 Core paradigm
Sunsama = ritual: guided morning planning (pull tasks → estimate time → drag onto calendar → commit) + evening shutdown (review, roll forward, reflect) (https://www.asianefficiency.com/schedule-management/sunsama-review/). Reclaim = background optimization: auto-schedules tasks/habits around meetings, then **reports on how time was actually spent** (https://kripeshadwani.com/reclaim-ai-review/).

### 6.3-6.4 Month/year
Neither product emphasizes month/year grids; both are day/week tools. (Per scope, day view only.)

### 6.5 Day view (DEEP)
- **Sunsama day view**: a day-column of task cards + a right-side calendar; tasks are dragged onto the calendar to become time blocks; **planned time vs actual time** is tracked per task ("Planned vs actual time" is a listed core feature; https://juliety.com/sunsama-review). Daily Kanban shows today's cards with "Didn't get to" as an explicit bucket — **overcommitment is surfaced, not punished**: "the overcommitment warning is the standout feature — it forces you to confront an over-planned day before it starts" (asianefficiency).
- **Reclaim analytics**: time-tracking dashboard derived *from the calendar itself* — "AI Time Tracking derives all tracking data from the calendar without manual timers" (https://pipeline.zoominfo.com/sales/reclaim-ai-features); shows meetings vs deep work vs breaks, focus-time sufficiency, burnout risk, weekly balance (kripeshadwani).
- Plan-vs-actual display pattern: estimate shown at plan time; actual captured at completion; the delta is the feedback. PersonalOS's `[planned: gym 17:00 · actual: missed]` is this same honesty loop, but for routines in a life calendar — no mainstream calendar shows planned-vs-actual on the day feed; this is unclaimed territory.

### 6.6-6.7 Periods / layout
Sunsama weekly objectives connect today to the week ("Set 3-5 focus objectives that daily planning aligns to") (asianefficiency) — a week-recap-strip (R11) analog: weekly summary of what was planned vs done.

### 6.8 Differentiators & steal-worthy
1. **Planned-vs-actual as a first-class day-view display** (Sunsama est-vs-actual; Reclaim calendar-derived time analytics) — directly validates the M6 plan-vs-actual toggle; PersonalOS extends it to missed routines ("actual: missed" with no shame framing).
2. **Overcommitment warning without punishment** — the no-shame design pattern: the system surfaces reality, it never moralizes. Matches "vacation, not laziness".
3. **Calendar-derived analytics** (Reclaim): no manual timers — PersonalOS's fact lines ("22/31 days logged", week recap) derive from existing data the same way.

---

## 7. Polarsteps — the trip-as-container reference

### 7.1 Overview
Travel tracking + journaling app (iOS/Android/web): GPS-route journaling where every trip becomes a map with steps (photos + notes per location) and auto-computed stats. Free core; Polarsteps Plus €8.99/mo or €29.99/yr (3D maps, extra map styles); monetization mainly via printed Travel Books (€36-150) (https://mattsnextsteps.com/polarsteps-review-is-polarsteps-the-best-travel-tracking-app/; https://www.overlandsite.com/tools/polarsteps-review/). "All-in-one travel app... works offline, doesn't drain the battery, and offers full privacy control" (https://justuseapp.com/en/app/947925763/polarsteps/reviews). 2025-2026 added AI itinerary planning; offline-first tracking is core ("Even if you're offline, it stores the data and syncs later") (https://taleswander.blogspot.com/2026/05/polarsteps-app-review-2026-best-travel.html).

### 7.2 Core paradigm
**Trip = container; step = content.** A trip is created with name, start/end dates, cover photo, privacy level (public/followers/private). Inside it: a map with a route line; steps (locations) with photos/videos/text; a timeline of steps; aggregated stats (distance, days, countries, steps) (https://support.polarsteps.com/hc/en-us/articles/23760478173586-What-are-steps-and-how-do-I-add-or-edit-them; https://thousandtravelmiles.nl/en/travel-tip/polarsteps-app-manual).

### 7.3-7.4 Month/year
No calendar views at all — time is implicit in the step timeline. The year lives as the user's trip list (each trip = a card with dates and a mini route).

### 7.5 Day view
The **timeline** inside a trip: chronological list of steps at the bottom of the map; scroll through steps; tap to open a step (photos, notes, activities, recommended spots); the map and timeline are linked — tapping a step pans the map (https://mattsnextsteps.com/how-to-use-polarsteps-ultimate-polarsteps-tutorial/). Steps can be backfilled after the fact (import photos with location data to reconstruct a past trip) (taleswander).

### 7.6 Periods & trips (DEEP — the range-as-container pattern)
- **Trip = a date-bounded container that holds everything**: route, steps, media, notes, stats, sharing. Content is *derived* from the trip membership, not manually organized — the same derivation model as PersonalOS periods ("invisible metadata records, content derived by inclusive date range").
- **Plan/Track duality**: planned steps (future itinerary with arrival dates + nights) become tracked steps when reached ("Once you start traveling and arrive at your planned destination, a step suggestion will appear in your timeline") (https://support.polarsteps.com/hc/en-us/articles/24265886208914-How-do-I-plan-my-trip). This is the period version of plan-vs-actual: the plan tab and track tab are the same steps in two states. PersonalOS periods get this for free (period = planned; content inside = actual).
- **Recap artifacts**: auto-generated stats (distance, days, countries, flags), shareable map links, and printed Travel Books built from trip data (route + photos + text) (https://support.polarsteps.com/hc/en-us/articles/24004039312530-Generating-and-editing-a-Travel-Book-a-step-by-step-guide). A trip is a *publication*, not just a filter — the "blogging/media home" aspiration in the M6 spec is exactly this.
- **Offline + privacy**: route tracking and journaling work offline and sync later; privacy is per-trip, granular, set before departure ("Share where you've been, without broadcasting where you are" — https://www.polarsteps.com/summer-release).
- **Storytelling styles**: Polarsteps' own guidance distinguishes "everyday explorer" (daily steps) vs "long-hauler" (weekly summaries — "write summaries of a few days or even a whole week of adventures... it's more distilled") (https://www.polarsteps.com/stories/how-to-capture-your-polarsteps-trip-your-way). PersonalOS's on-this-day strip and period recaps are the same distilled-summary pattern.

### 7.7 GUI layout
- Trip list (home): trip cards (cover, name, dates, route thumbnail, stats line).
- Trip screen: full-bleed map with route polyline + step pins; stats bar (distance/days/countries); timeline strip at the bottom (step thumbnails in chronological order); + button to add current location as a step.
- Step screen: photos, date/location header, text, activities, recommended spots; edit step (location/time/order affects the route line).
- Plan tab: same map + steps but with planned/upcoming state and arrival dates.

### 7.8 Differentiators & steal-worthy
1. **Trip (period) = container with derived content** — the exact data model M6 specifies for vacation/term/holiday periods; Polarsteps proves users adopt it without any manual organizing.
2. **Plan/Track duality inside the container** — planned steps ↔ tracked steps; PersonalOS periods can hold plan-vs-actual at the period level ("planned gym schedule vs actual during vacation").
3. **Auto-generated recap artifacts** (stats line, shareable page, book) — PersonalOS's period recap (blogging/media home) should auto-compose from period membership: photos, journal lines, stats ("12 days, 3 countries"-style fact lines).
4. **Distilled storytelling** (long-hauler summaries) — the on-this-day strip and week recap are the distilled layer; don't make every line a full entry.
5. **Offline-first is non-negotiable and marketed** — Polarsteps' offline + sync is the PWA constraint validated in-market.

---

## 8. TripIt — the itinerary timeline reference

### 8.1 Overview
Travel organizer that builds a per-trip itinerary by parsing forwarded confirmation emails (plans@tripit.com). Free core; TripIt Pro ~$49/yr (real-time flight alerts, seat tracking, rewards summary) (https://www.whistleout.com/CellPhones/Apps/tripit-travel-itinerary-app; App Store shows $72.99/yr IAP). Web + iOS/Android, fully offline after sync (https://appmus.com/software/tripit).

### 8.2 Core paradigm
**Trip = chronological timeline of segments.** Everything (flights, hotels, cars, restaurant reservations, custom activities) lands on one day-by-day, time-ordered timeline. "Everything is organized chronologically, so you can scroll through your entire trip in order (morning to night, day to day) without switching between tabs" (whistleout). Sharing: one link; companions can contribute by forwarding their own emails (whistleout; thriftytraveler).

### 8.3-8.4 Month/year
None — the trip is the timeline; no calendar surface.

### 8.5 Day view (DEEP)
- The itinerary IS a day view stretched across a trip: each segment = a card (time, provider, confirmation numbers, addresses, links); day headers group the segments; custom activities slot in ("The ability to add custom activities... transforms it into a complete day-by-day planner") (appmus).
- **Offline access is the selling point**: "Once an itinerary is synced, all details are available even without an internet connection" (appmus).
- **Travel stats**: TripIt tallies days, miles, countries, trips — a lifetime summary page ("Having TripIt tally up my days, miles, countries, and trips for me is really cool" — thriftytraveler). This is the lifetime-analytics ancestor of PersonalOS's month fact lines and year totals.

### 8.6 Periods & trips
The trip entity is defined by start/end + membership; segments attach to days within. No media/journaling (explicitly a bookings organizer: "TripIt won't build you a map of recommended restaurants or suggest activities. That's not what it's for" — whistleout).

### 8.7 GUI layout
Trips list → trip screen: hero (destination, dates, progress) → timeline of day-grouped segment cards → map view of itinerary locations; share/manage buttons; stats accessible per trip and lifetime.

### 8.8 Differentiators & steal-worthy
1. **Day-grouped chronological cards** — TripIt's itinerary is literally a read-only day view of a period. PersonalOS's period detail = this layout (day headers + derived content lines), and its day view = the same card language for all activities.
2. **One-shared-view philosophy** — the period page is a single scrollable truth for the whole range; PersonalOS period recap should be one continuous scroll (day headers → derived lines → media), not tabs.
3. **Lifetime stats as motivation** — "days, miles, countries" lifetime tallies feed the year heatmap's totals and the month fact lines without shame (pure accumulation).

---

## 9. GitHub Contribution Graph — the heatmap family's ancestor

### 9.1 Overview
The "green squares" heatmap on every GitHub profile: 365 day-cells in a weeks-as-columns grid; five intensity levels of one hue (gray = zero, green 1-4); month labels along the top; weekday labels in the first column; below the graph, **total contributions, current streak, longest streak** (https://gitblend.com/kb/understanding-github-contribution-graphs). 7×52 grid (days × weeks), Sunday-top, rightmost column = current week (https://github.com/1etu/gitdraw).

### 9.2 Core paradigm
A read-only profile visualization, not a planning surface. Its influence is its form factor: any "year of daily data" app in the last decade copies the weeks-as-columns grid (see the whole `contribution-graph` topic ecosystem — theme generators, fake-commit painters, streak trackers: https://github.com/topics/contribution-graph).

### 9.3-9.4 Year view / heatmap (DEEP)
- **Five levels, one hue**: L0 gray (no contributions), L1-L4 light→dark green. Thresholds are **relative to the individual user's own distribution**, not absolute counts: GitHub uses quartiles of the user's last-365-days activity (excluding zeros, after outlier removal) — "one user might get the darkest shade of green by making 5 commits, while another user will need 50 commits" (https://github.com/orgs/community/discussions/23261; https://gitblend.com/kb/understanding-github-contribution-graphs).
  - Implementation nuance: despite the docs' word "quartile", the observed mapping divides `(0, max]` into 4 equal buckets — most days land in the lightest bucket because distributions are skewed (https://stackoverflow.com/questions/75431524/how-does-github-calculate-the-contribution-level-of-a-given-day).
  - **Design consequence for PersonalOS**: relative (per-user) scaling is the correct semantics for volume tints — "darker = busier for YOU", not "busier than everyone". This preserves the no-shame rule: tints describe your own distribution, no external norm.
- **Missing days / zero days are the same cell**: gray. Gaps are not flagged, annotated, or moralized; the graph just shows them. Combined with the streak line below, the emotional pressure is implicit (see 9.8).
- **The year-in-pixels widgetization**: tools like `github-readme-streak-stats` extract current/longest streak + totals from the graph, proving the "heatmap + derived stat line" bundle is the complete unit (https://github.com/DenverCoder1/github-readme-streak-stats).
- **The grid is paint-by-numbers for its users**: entire tool ecosystems (gitfiti, gitdraw, git-green-squares) let users *draw* on their graphs — evidence that the 7×52 grid is instantly legible as a canvas and that people emotionally invest in its "filled" state (https://github.com/topics/contribution-graph).

### 9.5 Day view
None (clicking a day shows that day's commit list — the only drill-down).

### 9.6 Periods & trips
None. But vacation-weekend-shaped gray holes are a known, visible phenomenon — the graph has no way to say "I was on holiday", which is precisely the problem PersonalOS periods solve ("vacation, not laziness").

### 9.7 GUI layout
Year heatmap (7 rows × 52 cols) with month labels top and weekday initials left; legend ("Less"→"More"); totals + current/longest streak under the grid; hover tooltip = date + count.

### 9.8 Emotional impact patterns (DEEP)
- **Streaks are the engine**: "Gray means no contributions; deeper shades of green indicate more activity" — but the streak line under the graph does the motivating. Psychology research: streaks work via **loss aversion** (losing feels ~2× worse than gaining: Kahneman/Tversky, cited in https://www.disciply.co.uk/blog/psychology-of-streaks-motivation) and the **endowed progress effect** (Nunes & Dreze car-wash study; https://xaetos.com/blog/streak-psychology). Duolingo users with 7+ day streaks are ~3.5× more likely to complete the next lesson (disciply).
- **Broken streaks are demotivating, not motivating**: Silverman (UDel) — "when people break their streaks, that is especially demotivating... they have failed in the goal of keeping their streak alive"; apps should NOT push "you broke your streak!" messages; **"what counts as a streak is malleable"** — offering slack/alternate paths keeps people engaged (https://lerner.udel.edu/seeing-opportunity/lerner-professor-researches-how-streaks-motivate-us/). Duolingo's Streak Freeze implements exactly this (Penn/UCLA slack research: "offering people a little 'slack'... can actually be more motivating than having a rigid set of rules") (https://blog.duolingo.com/how-duolingo-streak-builds-habit).
- **Streak incentives beat bigger stable rewards** in persistence: 6 preregistered studies (N=4,493) — continuity itself, not reward size, drives persistence (https://www.sciencedirect.com/science/article/pii/S0749597825000032).
- **Identity**: a 100-day streak shifts self-concept ("I have become a runner") (disciply) — the positive pole of the streak.
- **Direct implication for PersonalOS**: the no-shame constraint is evidence-backed. GitHub's gray squares + streak guilt-trip is the anti-pattern; PersonalOS should show continuity neutrally (streaks as facts), never broken-streak shaming, and periods should suspend streak pressure exactly as Duolingo's Streak Freeze does — "vacation, not laziness" is the productized version of the slack research.

### 9.9 Differentiators & steal-worthy
1. **Relative per-user intensity scaling (5 levels, 1 hue)** — the tint semantics for PersonalOS year heatmap (per-activity hue × 4-5 relative levels).
2. **Heatmap + derived fact line bundle** (totals, current/longest streak under the graph) — the direct precedent for the month-header fact line and week recap strip.
3. **Month labels + weekday initials as the only text** at year scale — PersonalOS year heatmap should keep the same restraint.
4. **Gray = zero, no annotation of gaps** — missing days need no glyph; but unlike GitHub, PersonalOS lets periods explain the gap ("vacation") instead of leaving it silent.

---

## 10. Year in Pixels — the mood-grid family

### 10.1 Overview
Bullet-journal spread born ~2016 (12 columns × 31 rows, one colored square per day) that became a genre: Mood Tracker by Pixels (Teo Vogel, 1M+ downloads, free, "one day = one colored pixel") (https://www.appbrain.com/app/mood-tracker-by-pixels/ar.teovogel.yip), Daylio (grid among stats), MoodKit (grid + widget, $39.99/yr or $79.99 lifetime), Yian, PixelDiary, and dozens more (https://moodkit.co/blog/year-in-pixels-guide/; https://moodkit.co/blog/year-in-pixels-apps/). Also Year in Color, My Year in Pixels — a crowded App Store category (https://apps.apple.com/us/app/mood-tracker-year-in-pixels/id6749025290).

### 10.2 Core paradigm
Log daily (one tap / one color) → grid paints itself → read patterns. "It solves a problem nothing else solves as elegantly: a year of feelings, visible in one glance" (MoodKit). Privacy is a selling point ("No ads, no tracking" — Pixels listing, https://apps.apple.com/us/app/pixels-mood-tracker-journal/id1668460700).

### 10.3-10.4 Year view / heatmap (DEEP)
- **Five levels is the standard**: "Five is standard and plenty: distinct colors stay readable at one-square-per-day size, and a five-level scale is fast to answer honestly every evening. More levels make prettier legends and muddier grids" (MoodKit).
- **How to read a grid** (the canonical reading method, directly transferable to activity tints): 1) **Clusters** — bad days rarely arrive solo; a clump marks an episode with a start date; 2) **Stripes** — weekly-rhythm repetition (Sunday dread column, Wednesday slump); 3) **Seasons** — compare quarters at arm's length; 4) **Transitions** — read colors before/after a life change; 5) **Blanks** — missing squares cluster in overwhelmed stretches; "the gaps are data about the logging habit itself — the fix is less friction, not more discipline" (https://moodkit.co/blog/year-in-pixels-guide/).
- **Blanks stay blank**: "Leave them blank rather than guessing — backfilled squares poison the picture. A few gaps don't hurt; the grid's patterns survive missing data" (MoodKit). PersonalOS: missing days in the year heatmap = empty cells, no remediation.
- **The empty-square motivation trick**: "An empty square tomorrow is mildly unbearable in a way 'keep your streak' notifications never quite manage. People who abandon every other tracking format sometimes keep coloring squares for years" (MoodKit). This is the year heatmap's emotional engine — and it works WITHOUT shame: the pull is filling your own picture, not avoiding a penalty.
- **"Grids raise questions, the context layer answers them"**: "a grid plus tags can be interrogated; a grid alone can only be admired" — the grid must link to day-level context (MoodKit). This is the structural justification for PersonalOS's derived day view below the heatmap.
- Dominant-mood rule from the paper community: "If you experience multiple moods in one day, use the color that reflects your dominant emotion" (https://www.mycozyplanner.com/free-printable-year-in-pixels-tracker) — the per-day aggregation rule (PersonalOS: day tint = aggregate volume of that activity).

### 10.5 Day view
Pixels/Year-in-Pixels apps log via a daily entry (mood + note); the grid is the read surface; Daylio-style apps add activity tags per day — the tags are the "why" layer for grid questions (MoodKit).

### 10.6 Periods & trips
None — but Yian (a Year-in-Pixels variant) explicitly supports "Events with recurring support for appointments, **trips**, anniversaries, milestones" as colored marks on the grid (https://apps.apple.com/us/app/mood-tracker-year-in-pixels/id6749025290) — evidence that the grid + event-period overlay is a natural combination.

### 10.7 GUI layout
- Grid screen: 12 columns (months) × 31 rows (days) OR calendar-shaped layout; legend of mood colors; tap a day to edit its color/note.
- App variants add: month/week/year/timeline calendar views (Yian), stats and charts (Pixels), home-screen widgets (MoodKit: "your year stares back every time you unlock — maximum-strength dose" of the empty-square trick).

### 10.8 Differentiators & steal-worthy
1. **Five-level color scale as the readability ceiling** — PersonalOS tints: ≤5 levels per activity.
2. **Blanks-left-blank discipline** — missing days are neutral, never backfilled, never flagged. Core to no-shame.
3. **The reading method (clusters/stripes/seasons/transitions/blanks)** — the year heatmap's value is pattern legibility; design tints to make these four reads easy (consistent hue per activity, level spacing that reads at arm's length).
4. **Grid → context handoff** ("grids raise questions") — the heatmap must link to the day view, where the context lives.
5. **Widget exposure** (MoodKit) — a PWA "year in pixels" tile on the dashboard is the passive-motivation channel.

---

## 11. Life Calendar — the 90-weeks grid family

### 11.1 Overview
Tim Urban's "Your Life in Weeks" (Wait But Why, 2014): a 90-year life as a 4,680-cell grid (90 columns of years × 52 rows of weeks), lived weeks filled, future weeks empty (https://kyrylo.org/life-calendar; https://yeohcm.github.io/YourLifeInWeeks/). Now an app genre: Lifeplanr (life calendar + journal + travel + habits), Life Grid (5,200-week 100-year grid), NFM Life Calendar, lifespanclock (AI lifespan + habit weeks), and lock-screen widgets (https://lifeecalendar.com/; https://apps.apple.com/us/app/life-grid-calendar-diary/id6752370179; https://aval-nfm-apps.web.app/app/en/flut100).

### 11.2 Core paradigm
**Time compression with existential weight**: "Drawn in years, life is only 80–90 boxes — too short and abstract. Drawn in days, it's over 30,000 boxes — too much to take in at a glance. The week is the golden ratio between them" (NFM). The grid's meaning comes from the lived/future contrast: "The visible contrast between past-lived weeks and future-empty weeks is the whole point — it makes remaining time tangible" (https://www.lifeplanr.app/faq/life-calendar).

### 11.3-11.4 Year/heatmap (DEEP)
- Three zoom levels, per Lifeplanr: **Year view (90 tiles)** = the big-picture arc, annual themes and multi-year phases; **Month view (90×12 = 1,080 cells)** = "the sweet spot... dense enough to feel finite, navigable enough to plan"; **Week view (90×52 = 4,680 tiny squares)** = "maximum density, most visceral" (https://www.lifeplanr.app/faq/life-calendar). A zoom slider interpolates between 5 weeks/row and 52 weeks/row.
- **Life stages as color bands**: weeks lived are painted by stage (childhood light green → adulthood purple, etc.) — color carries category, not intensity (kyrylo.org).
- **Phases = painted spans**: "Life phases are multi-week chapters — School, Work, Travel, Marriage, Parenthood. They paint colored bands across your calendar so you can see the shape of your life at a glance"; journal entries are weekly text/photos/mood; "phases are the context around those entries" (Lifeplanr FAQ). **This is the period-as-container pattern at life scale**: an invisible metadata range that tints a span of cells and groups its content.
- **Future is planable**: future weeks show empty until lived, but can be tagged with planned phases (sabbatical), trips that "paint colored bands forward", and FIRE-year highlights (Lifeplanr FAQ) — periods span past and future with the same entity.
- **Emotional mechanics**: memento mori framing ("Every week is a gift"), mortality-awareness → prosocial behavior and intention (kyrylo.org); the grid fights procrastination by making waste visible; gratitude for filled squares + hope in blank ones — "reframes time as opportunity rather than loss" (kyrylo.org). Note the counterbalance for PersonalOS: this family leans existential; PersonalOS's no-shame rule keeps the tone warm, not morbid — periods and fact lines should celebrate life, never count it down.

### 11.5 Day view
None — granularity is the week (journal entries keyed by week, Mon-Sun) (Lifeplanr FAQ).

### 11.6 Periods & trips (DEEP)
- **Life phases (Lifeplanr) are the mature "period" implementation**: they are metadata (name, start, end) that (a) tint a continuous span, (b) group all content inside the span, (c) work identically for past (documented) and future (planned) ranges. "Journal entries are weekly text, photos, and mood; **phases are the context around those entries**" — exactly PersonalOS's "invisible metadata records, content derived by inclusive date range".
- **Travel planning inside the life calendar** (Lifeplanr has a dedicated travel-planner feature; trips paint colored bands forward) — a period with a plan/actual duality (https://www.lifeplanr.app/features/travel-planner.html).
- Privacy posture matches PersonalOS: "the trade-off is privacy (your journal entries live inside the calendar), which we'd rather get right than rush" — no shareable links by default (Lifeplanr FAQ).

### 11.7 GUI layout
- Year grid: 1 row of ~90 year-tiles (click = that year). Month grid: 12 per year, 1,080 cells. Week grid: 52 columns per year, 4,680 cells, zoom slider, minimap in the corner, pinch-to-zoom on mobile (Lifeplanr FAQ).
- Cell states: lived (colored), current week (glows/gold), future (faint empty boxes) (NFM).
- Category coloring: per-category colors for events/habits ("Smart Color System: assign colors per category to instantly spot patterns and changes" — Life Grid).

### 11.8 Differentiators & steal-worthy
1. **Period as colored band over the calendar** (Lifeplanr phases) — the strongest precedent for PersonalOS's period overlay: months in a vacation period get a distinct treatment while content stays derived.
2. **Zoom-slider density control** across a grid family (5/row → 52/row) — PersonalOS year heatmap can offer month→year→(optional) decade zoom.
3. **Metadata-ranges with plan/future state** — periods are the same entity whether past or planned; PersonalOS periods should be creatable in advance (term starts next week) and render identically.
4. **"Phases are the context, entries are the content"** — the clean split PersonalOS needs between period entity and day-view content.
5. **Privacy-by-default (no sharing until asked)** — consistent with offline-first, private-by-design.

---

## 12. Synthesis — 4-6 steal-worthy features for PersonalOS's calendar & periods

### S1. Tint-only is validated by the entire category (no glyphs needed at scale)
Every serious player converges on glyph-less presence/volume marks: Google's year view = dots only (1.4), Fantastical's year view = single-hue heatmap ("best year view ever seen", 2.4), Timepage's month view = pure heatmap with no chips (5.3), GitHub = 5-level single-hue intensity (9.4), Year-in-Pixels = 5-color scale as the readability ceiling (10.4). PersonalOS's locked tint-only rule is not a constraint but the category's own ceiling. Steal: **4-5 relative intensity levels per activity hue, scaled per-user (GitHub quartile logic, 9.4), blanks left blank (10.4)** — a day's tint = aggregate volume of that activity; missing days = empty cell with zero moral valence.

### S2. Month → year = 12 mini-months of the same tint (Fantastical + Timepage)
Both Fantastical (year heatmap of 12 mini-months, tap-to-day) and Timepage (year view = month heatmap at 1/12 scale) prove the zoom path PersonalOS specifies: the same tint semantics survive compression. Steal: **one grid component rendered at two scales** — month cell = ~40px, year mini-month cell = ~10px; month labels + weekday initials are the only text at year scale (9.4); hover tooltip carries the detail (2.4).

### S3. Month grid = tint + one ring + fact line, never chips (Timepage discipline + Apple decorations)
Timepage shows a month grid with NO event content — tint is the content (5.3); Apple's UICalendarView sanctions one decoration per day cell (4.3); Google's chips collapse into unreadable slivers (4.3). Steal: **day cell = tint fill + deadline ring (goal rings) + tiny day number; density zoom levels (dots-only ↔ tint+rings ↔ tint+fact line) via Apple's iOS 18 pinch-zoom pattern (4.3)**; the "+N more" overflow rule means content goes to the day view, never the cell (1.3).

### S4. Period = invisible metadata range that tints a span and groups derived content (Lifeplanr phases + Polarsteps trip + TripIt timeline)
Three independent products prove the same pattern: Lifeplanr phases paint colored bands across the calendar while "phases are the context around entries" (11.6); Polarsteps trips are date-bounded containers holding route/media/stats with plan/track duality (7.6); TripIt renders a period as one day-grouped chronological timeline (8.5). Steal: **period entity (name, start, end, hue) tints its inclusive range on month + year grids, quiets Coach adherence (the Duolingo-streak-freeze research: slack > rigid rules, 9.8), and renders as a recap page = day-grouped derived lines + media + stats** (7.6, 8.2). This is the "vacation, not laziness" mechanism, evidence-backed: broken streaks demotivate, malleable streaks persist (Silverman, 9.8).

### S5. The heatmap's emotional engine without shame: derived fact lines + empty-square pull
GitHub's "totals + current/longest streak under the graph" (9.4) and Sunsama/Reclaim's calendar-derived analytics (6.5) show the fact-line bundle; Year-in-Pixels shows the pull ("an empty square tomorrow is mildly unbearable" — 10.4) works without punishment. Steal: **month-header fact line ("22/31 days logged"), week recap strip (R11: "gym 5/5 · weigh-ins 6/7"), and year totals derived from existing data, always framed as accumulation, never as deficit** — and the on-this-day strip as the distilled-storytelling layer (Polarsteps "long-hauler" summaries, 7.6).

### S6. Plan-vs-actual as a first-class day-view display — unclaimed territory
No mainstream calendar shows planned-vs-actual in the day feed; Sunsama tracks estimated-vs-actual per task (6.5), Reclaim derives time analytics from the calendar (6.5), Polarsteps has plan/track step duality inside trips (7.6). Steal: **day view renders `[planned: gym 17:00 · actual: missed]` as one derived line with a neutral state chip** — the plan is a scheduled routine slot, the actual is the logged activity; periods suspend the comparison (vacation slots show as planned-only, no penalty). This single line is the product's signature differentiation and it is supported end-to-end by the research: honesty without shame is both the ethical and the most persistence-optimizing design (9.8).

### Cross-cutting GUI takeaways (from §7 of every section)
- **Month grid**: 7-col grid; tinted day cells (hue = activity, 4-5 levels), hairline separators (9%-opacity borders à la Cron, 3.3 — avoid the Hermann-grid card-cell trap, 1.3); today = outline; deadline = ring; weekends dimmed; leading/trailing month cells ghosted; header = month name + fact line + filter chips row.
- **Year heatmap**: 12 mini-months (3×4) of the same tint; month labels + weekday initials only; hover tooltip = date + volume; tap = jump to month. Period bands visible as span tints.
- **Day view**: chronological derived feed (Timepage Timeline / TripIt itinerary language); each line = icon/hue + derived text + time; lines link to source entities (Cron event-as-link, 3.6); plan-vs-actual chip on routine lines; on-this-day strip above or below as a horizontal pill strip (DayTicker language, 2.2).
- **Trip/period view**: hero (name, dates, hue) → day-grouped derived content → stats line → media — one continuous scroll (8.7), plan/actual duality in the header ("planned 10 days · 8 days documented").
- **Layout spine**: tint grid left / content stream right (Timepage), or grid-top / list-bottom (Fantastical DayTicker + calendar) — both proven; PersonalOS should pick one per breakpoint.

---

## Source index (by topic)

- Google Calendar: https://support.google.com/calendar/answer/6110849 · https://support.google.com/calendar/thread/210501858 · https://kalnext.com/google-calendar-year-view · https://onepageyear.com/ · https://www.androidpolice.com/google-calendar-redesign-enable/ · https://www.androidpolice.com/google-calendar-chips-month-navigation/ · https://chromewebstore.google.com/detail/event-dots-for-google-cal/hjjlnloajchjbjlmdleheopcglglkjff · https://www.eleken.co/blog-posts/calendar-ui · https://bricxlabs.com/blogs/calendar-ui-examples · https://www.systemdesignhandbook.com/guides/google-calendar-system-design · https://community.retool.com/t/calendar-month-view-show-today/46826 · https://arahr.com/calendar-apps
- Fantastical: https://flexibits.com/fantastical-ios/help/calendar-views · https://flexibits.com/blog/2022/07/hows-the-view-from-here-getting-the-most-out-of-fantasticals-calendar-views/ · https://beingpaperless.com/fantastical-for-mac-complete-review-2023/ · https://flexibits.com/fantastical · https://flexibits.com/fantastical-windows/help/calendar-views · https://efficient.app/apps/fantastical · https://www.thesunrisedigest.com/focus/fantastical-review-2026/ · https://mwm.ai/apps/fantastical-calendar/718043190 · https://thesweetbits.com/tools/fantastical-review/
- Cron / Notion Calendar: https://blakecrosley.com/guides/design/notion-calendar · https://cronhq.notion.site/Calendar-view-options-329f8bc37d8f4c509f7fd56a220a584e · https://aisotools.com/blog/notion-calendar-review-2026 · https://toolnerdy.com/notion-calendar-review-2026-the-free-calendar-that-makes-notion-users-unstoppable/ · https://www.catchagent.ai/blog/scheduling/notion-calendar-app · https://us.acrofan.com/detail.php?number=677062 · https://theygotacquired.com/saas/cron-acquired-by-notion/
- Apple Calendar: https://typenorm.com/apps/apple-calendar · https://applemagazine.com/exploring-the-new-ios-18-calendar-feature/ · https://support.apple.com/guide/iphone/change-how-you-view-events-iphfd1054569/ios · https://developer.apple.com/documentation/uikit/uicalendarview · https://github.com/peterjthomson/year-view · https://yearli.app/
- Timepage: https://bonobolabs.com/support/timepage/navigation/navigating-heat-map/ · https://bonobolabs.com/timepage/ · https://apps.apple.com/us/app/timepage-calendar-planner/id989178902 · https://www.calendar.com/best-calendar-app/
- Sunsama / Reclaim: https://juliety.com/sunsama-review · https://aisotools.com/blog/sunsama-review-2026 · https://www.asianefficiency.com/schedule-management/sunsama-review/ · https://help.sunsama.com/docs/usage-guides/daily-planning · https://kripeshadwani.com/reclaim-ai-review/ · https://hackceleration.com/labs/review/reclaim · https://marcandrews.com/reclaim-ai-review-2026-is-this-ai-calendar-tool-worth-it/ · https://pipeline.zoominfo.com/sales/reclaim-ai-features
- Polarsteps: https://support.polarsteps.com/hc/en-us/articles/23760478173586-What-are-steps-and-how-do-I-add-or-edit-them · https://support.polarsteps.com/hc/en-us/articles/24265886208914-How-do-I-plan-my-trip · https://support.polarsteps.com/hc/en-us/articles/24004039312530-Generating-and-editing-a-Travel-Book-a-step-by-step-guide · https://www.polarsteps.com/stories/how-to-capture-your-polarsteps-trip-your-way · https://www.polarsteps.com/summer-release · https://mattsnextsteps.com/how-to-use-polarsteps-ultimate-polarsteps-tutorial/ · https://mattsnextsteps.com/polarsteps-review-is-polarsteps-the-best-travel-tracking-app/ · https://taleswander.blogspot.com/2026/05/polarsteps-app-review-2026-best-travel.html · https://thousandtravelmiles.nl/en/travel-tip/polarsteps-app-manual · https://justuseapp.com/en/app/947925763/polarsteps/reviews · https://www.overlandsite.com/tools/polarsteps-review/
- TripIt: https://www.whistleout.com/CellPhones/Apps/tripit-travel-itinerary-app · https://appmus.com/software/tripit · https://thriftytraveler.com/guides/travel/tripit-review · https://www.going.com/guides/tripit-review
- GitHub contribution graph: https://gitblend.com/kb/understanding-github-contribution-graphs · https://gitblend.com/kb/customize-contribution-graph-themes · https://github.com/orgs/community/discussions/23261 · https://stackoverflow.com/questions/75431524/how-does-github-calculate-the-contribution-level-of-a-given-day · https://github.com/topics/contribution-graph · https://github.com/DenverCoder1/github-readme-streak-stats · https://github.com/1etu/gitdraw
- Streak psychology: https://lerner.udel.edu/seeing-opportunity/lerner-professor-researches-how-streaks-motivate-us/ · https://www.disciply.co.uk/blog/psychology-of-streaks-motivation · https://xaetos.com/blog/streak-psychology · https://www.sciencedirect.com/science/article/pii/S0749597825000032 · https://blog.duolingo.com/how-duolingo-streak-builds-habit
- Year in Pixels: https://moodkit.co/blog/year-in-pixels-guide/ · https://moodkit.co/blog/year-in-pixels-apps/ · https://apps.apple.com/us/app/pixels-mood-tracker-journal/id1668460700 · https://www.appbrain.com/app/mood-tracker-by-pixels/ar.teovogel.yip · https://apps.apple.com/us/app/mood-tracker-year-in-pixels/id6749025290 · https://www.getonepercent.app/blog/year-in-pixels-mood-grid-method/ · https://www.mycozyplanner.com/free-printable-year-in-pixels-tracker
- Life Calendar: https://www.lifeplanr.app/faq/life-calendar · https://lifeplanr.app/your-life-in-weeks · https://kyrylo.org/life-calendar · https://lifeecalendar.com/ · https://yeohcm.github.io/YourLifeInWeeks/ · https://apps.apple.com/us/app/life-grid-calendar-diary/id6752370179 · https://aval-nfm-apps.web.app/app/en/flut100
- Cross-cutting UI: https://www.eleken.co/blog-posts/calendar-ui · https://muz.li/inspiration/calendar · https://demo.mobiscroll.com/eventcalendar/mobile-month-view · https://infoinspired.com/excel-formula/excel-calendar-heatmap-design-logic/