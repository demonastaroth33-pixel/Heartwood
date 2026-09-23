# Feature Scan 05 — UI Surfaces Raw Brief (UIUX.md + DesignSystem.md)

Sources read in full:
- `docs/UIUX.md` (390 lines)
- `docs/DesignSystem.md` (475 lines, status DRAFT v3 — awaiting user approval; UIUX.md wins on conflict — no conflicts found per DesignSystem.md L5)

Scope: exhaustive inventory of every UI surface, interaction that produces data,
display surface that could show tree-corresponding data, navigation structure,
empty states, responsive behavior, and UI rules that constrain the Life Tree's own UI.

Line refs: `U:` = docs/UIUX.md, `D:` = docs/DesignSystem.md.

---

## 0. CRITICAL FINDING — the Life Tree tab is NOT documented anywhere

- `docs/UIUX.md` L11: "Tabs (MVP): Dashboard, Journal, Habits, Settings. Later:
  Goals, Coach, (future systems)." — **No Life Tree tab exists in any doc.**
- The tree would land in "(future systems)" — placement is a gap. The only
  hard constraint is U:L170: navigation/layout ordering is deferred to the END
  of the design process — "Do not re-open dashboard ordering or nav charts now;
  revisits last."
- The requested "shimmer rule" DOES exist: U:L52-54 — heavier derived blocks
  (strength snapshot, weekly review) render after a skeleton shimmer, NEVER
  block first paint. Direct precedent for a derived tree render.
- The requested "one-notification constraint" — **NOT FOUND in either doc.**
  Notification rules live in CoachSystem.md (out of scope for this scan; the
  only UIUX references: quiet-week silences coach nudges U:L211-219, and
  DesignSystem G10 dismiss semantics D:L255-256). Ambiguity: "one-notification
  constraint" likely refers to the Coach single-output constraint documented
  elsewhere (CoachSystem.md) — flagged for the tree input map to verify there.
- The requested "tint-only rule for calendar" EXISTS: U:L137-149 (full detail
  in §5.1 below) — the tree must NOT add dots/numbers/icons/glyphs to calendar
  day cells.
- Theme-palette precedent for a tree: DesignSystem tokens (§2.1) — accent
  `#8FBF72` leaf green, gold reserved for streaks ONLY (D:L34, D:L81, D:L190).

---

## 1. Navigation Shell (U:L7-21, D:L152-166, D:L219-224, D:L404-413)

| Item | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Bottom nav bar (mobile, <800px) | NavigationBar 76px, surface @96% + hairline top border, backdrop blur 8px, sliding accentDim pill indicator (52×30), active icon+label accent / inactive textSecondary, labels 11px | tap = tab switch (fade-through durFast) | 4 tabs: Dashboard, Journal, Habits, Settings | U:L9, D:L157, D:L219-222 |
| Left nav rail (desktop, ≥800px) | NavigationRail 80px, surface fill + hairline right border, 48px pill indicator, icons 22px | tap = tab switch | same 4 tabs | U:L10, D:L157, D:L223-224 |
| Future tabs | — | — | Goals, Coach, (future systems) — Life Tree's documented slot | U:L12 |
| Dashboard default tab | app opens to Dashboard | — | — | U:L16 |
| Nav ordering rule | — | — | Ordering deferred to END of design process (L170); do not re-open | U:L19-21 |
| Nav switching animation | — | — | fade-through durFast; pill slides curveEmphasis via AnimatedAlign (layout-driven, no manual index math) | D:L164-166 |
| Content column | max 640px centered, padding spaceXl, scrollable | — | desktop; mobile = full-width, padding 16 | D:L159, D:L404-413 |
| App shell stack | Stack: AtmosphereLayer (z0) → Scaffold (nav + content) → FAB → ComposeOverlay / MediaViewer / Sheets (elevOverlay) | — | — | D:L152-162 |

## 2. Dashboard (U:L23-61, D:L301-314)

Block order (vertical, priority): Today → Coach daily note → Goal progress →
Today's tasks → Streak/XP status → storage meter (always visible). Empty
states honest, non-judgmental, no guilt UI (U:L46).

| Block | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| **Today** (clash #1 fusion) | ONE section fusing briefing card (R12) + habit ticks + journal quick-capture | habit one-tap check-off; quick-capture text (Enter → compose pre-filled with today's timestamp); one-tap log/pack/session actions | today's slots in order, done-vs-missing markers, macro-gap bar, habit ticks | U:L31-33, U:L65-99, D:L307-308 |
| Briefing card | the single daily surface | week picker (start of calendar week per WEEK STARTS ON: pick weekly routine or "continue current"); per-day override to a different day template; one-tap log/pack; Gym slot TAP → session screen pre-loaded | today's slots in order (per chosen weekly routine + per-day overrides), done-vs-missing markers, macro-gap bar, one-tap actions; quiet meal reminders point here | U:L65-99 |
| Macro-gap bar (NU12) | live progress line in card, derived zero-storage | — (receipt rows summed vs deriveMacros(dateKey) targets) | "protein 168/168g · kcal 2120/2875", updating as meals logged; home for reminders + Coach nudge; NO XP | U:L76-80 |
| Session pre-load (A7) | Gym slot tap opens session screen pre-loaded with that day's linked workout template | confirm/adjust/execute the session | exercises, target sets/reps in order, last-time hints, PO suggestions ready | U:L81-85 |
| Backfill semantics | meal backfilled to earlier date marks THAT date's slot done, never today's; macro-gap sums day target vs day full receipt | — | display may lag, numbers never disagree | U:L86-89 |
| Coach daily note | stub rule output | ghost X dismiss (24×24) → confirm dialog "Dismiss today's note?" → deletes today's coach_outputs row; surfaces again tomorrow | gentle line (e.g., missed-habit prompt) or neutral "day on track" placeholder | U:L34-35, D:L253-256 |
| Goal progress | placeholder/empty state MVP (goals M1) | — | computed-only via H3 owner `goalProgress(goalId)` | U:L36-38 |
| Today's tasks | placeholder/empty state MVP (tasks M1) | — | — | U:L39 |
| Streak/XP status | placeholder MVP (gamification M2); zero-XP "N days fully logged" consistency marker lives here | — | streak + XP | U:L40-42 |
| Storage meter | always visible BlockCard | (no input; banner has "Export backup now" pill → Settings → Data at ≥90%) | "Storage" + "1.2 GB / 4.5 GB" tabularFigures; 8px track, accent → warning (≥70%) → danger (≥90%); ≥70% dismissible banner "Storage at 70% — free space by removing media"; ≥90% hard-warn + "Export backup now" pill; banners re-appear next load until resolved | U:L44, D:L226-233 |
| M2 render order | paint sequencing on open: [Today section, calendar/heatmap strip, habits card, goals progress, strength snapshot, weekly review/Coach note, journal capture]; every feature screen renders instantly, never waits | — | heavier derived blocks (strength snapshot, weekly review) render after skeleton shimmer — NEVER block first paint (**shimmer rule**) | U:L48-54 |
| Reveal-on-first-data (H4) | an area does NOT render until it has data or explicit first touch (e.g. create a deload → deload surfaces); full surface built + reachable via searchable create action (first touch = escape hatch); applies to settings too | first-touch create action | concealed day-to-day areas; lean dashboard/nav, no dead cards | U:L56-61, U:L382-383 |

## 3. Today — Briefing Card & Daily Log detail (U:L63-99)

Already itemized in §2 (briefing card, macro-gap, session pre-load, backfill).
Additional rules that constrain data surfaces:

| Item | What it is | Inputs | Displays | Source |
|---|---|---|---|---|
| One-tap daily log (H1) | opening app lands on dashboard with briefing card already listing today's slots; log/pack/session actions one tap from there | one-tap meal, one-tap session | layout default only, no new feature | U:L71-75 |
| Prompt discipline (routine-A2) | no weekly prompt on unbroken indefinite runs; app asks only at first-ever setup, period end (falls to default), user-opened override, explicit want-change | — | otherwise silent continue | U:L90-93 |
| Week picker + per-day override (R7/R8) | at start of calendar week user picks weekly routine (or "continue current"); any single day overridable to a different day template without forking routine | selection input | one binding model — no independent per-day toggle | U:L94-99 |

## 4. Weekly Surfaces (U:L101-127)

| Item | What it is | Inputs | Displays | Source |
|---|---|---|---|---|
| ONE weekly surface (H2/A4) | the weekly fitness check-in IS the single Sunday surface; R11 week recap + nutrition check-up are COMPACT SECTIONS inside it, tap-through to detail; the surface IS the merged Coach weekly review (Coach weekly section on top — habits, journaling, life notes; fitness/nutrition below) | tap-through to detail | one canonical verdict per cadence; e.g. "gym 5/5 · packs 5/5 · weigh-ins 6/7 / protein on-target 6/7" | U:L103-111 |
| Week recap = glance + verdict (A6) | R11 strip on week calendar = glance; tap opens merged weekly review = deep read; same H3 owner `adherenceWeek()` so they never disagree | tap | tiny strip "gym 5/5 · packs 5/5 · weigh-ins 6/7"; never a competing weekly surface | U:L112-117 |
| Strip window (R11-sub) | strip always summarizes the DISPLAYED week (grid it sits above, first column per WEEK STARTS ON); weekly verdict/merged check-in uses configured review-day window (Settings Group 2) with explicit date labels | — | glance and verdict never silently mixed | U:L118-122 |
| Strip denominators (audit 2.4) | X/Y and X/7 count only days that HAVE the slot in the bound template (workout-kind / weigh-in); days without excluded from both sides | — | single owner `adherenceWeek()` | U:L123-125 |
| Copy summary as text | weekly check-in / phase-close report → clipboard as plain text for journaling | copy action | plain text | U:L126-127 |

## 5. Calendar — Memory Map (U:L129-175, D:)

The calendar is the app's MEMORY MAP (browse/what-happened), NOT judgment;
verdicts live only in the weekly check-in; calendar derives everything from
existing H3 owner functions — zero new storage, zero writes (navigates to day
view / real screens only).

### 5.1 Month grid (U:L137-149)

| Item | What it is | Inputs | Displays | Source |
|---|---|---|---|---|
| Day cell tint | TINT ONLY — never dots/numbers/icons (**tint-only rule**) | — | FILTER MODE single system (Journal | Fitness | Nutrition | Body | Habits): whole cell shades in that system's color; filters render only for systems with data (H4). FILTER MODE All: one neutral tint, STRENGTH = how much happened (1 thing = faint, 6 = stronger), single gradient of activity intensity | U:L136-141 |
| Tint intensity | computed by ONE H3 owner `dayActivityScore` + `tintLevelFor(score)`: 0 = white, 1–2 = faint, 3–5 = medium, 6+ = strongest; NO hard ceiling (habits UNCAPPED at 0.5; meals/journal capped); missed habits contribute 0 — no negative/red state; missed-habit warnings live in Coach reflection, never tint | — | — | U:L141-147 |
| Today / selected / future | — | — | Today = separate border ring; selected = accent outline; future days = dimmed/desaturated; no glyphs/emojis/numbers on grid | U:L147-149 |
| Year heatmap | month → year = 12 mini-months of the same tint (GitHub-contribution style), same owner, no new data | — | — | U:L160-161 |
| Month-header fact line | one small derived fact, not a verdict: "22/31 days logged this month" (days logged = `dayActivityScore > 0`); renders ONLY in All filter view; filter-aware wording — Journal filter reads "N days journaled" (derived from entry dates); same H3 owner, display-only | — | — | U:L162-167 |

### 5.2 Day view (U:L150-159)

| Item | What it is | Inputs | Displays | Source |
|---|---|---|---|---|
| Day view | tap any day → chronological list of everything that day; every line derived; links to real screens; filter chips apply | tap-through to real screens | weigh-in, meals, gym session, journal entries, habits | U:L150-151 |
| PLAN-vs-ACTUAL split toggle | Actual / Plan / Both | toggle input | routine slots (planned, from routine_slot_logs) pair against what actually happened: [planned: gym 17:00 · actual: missed], [planned: rest · actual: cardio] | U:L152-155 |
| GOAL DEADLINES | goal/completion target rows ring the day cell in goal color | — | day view lists "deadline: reach 75kg" as FIRST line | U:L156-158 |
| Coach outputs line | quiet line under the day's events | — | Coach notes in calendar day view (Settings Group 2, default on) | U:L158-159, U:L307-308 |
| Journal-drought line | part of day view (J4) | — | every drought poke routes through Coach rule pipeline so quiet weeks silence all | U:L216-219 |

### 5.3 Calendar interactions (U:L168-175)

| Item | What it is | Inputs | Displays | Source |
|---|---|---|---|---|
| Week grid ↔ calendar month link | tapping a week opens the calendar month (A6 planning glance) | tap | — | U:L168 |
| Period creation — drag | drag a range on the calendar | drag gesture | — | U:L169-172 |
| Period creation — manual | manual date picker from trips/trip creation | date picker | — | U:L169-172 |
| Period confirmation step | BOTH methods end in visible confirmation "Create period [start → end]?" before commit; accidental drag must never silently create a range | confirm/cancel | — | U:L171-173 |
| Period rendering | periods render as top band / cell tint context; colored block IS the tap event → opens trip view | tap | periods model (Database.md §Backup/Restore Format enumeration; DecisionLog D075) | U:L173-175 |

## 6. Journal (U:L177-238, D:L316-343, D:L195-210, D:L275-293)

| Item | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Timeline | chronological, newest-first, grouped by day under sticky date headers; entries within a day time-descending; media-first tiles; "Today"/"Yesterday" naming, older days by date; first group margin spaceLg, groups spaceXl | tap entry → compose read mode (edit allowed) | sticky day label + "2 entries" count; media-first tile: 16:9 media row (1 hero thumb or 2–3 thumbs 3-up with count pill), body preview 2 lines, footer time + Life Area (accent-tinted 60%); thumbs fade durFast on decode; placeholder gradient wash + "generating…"; text-only entries: body preview leads | U:L179, D:L195-210, D:L323-329 |
| Compose flow | full-screen overlay (elevOverlay); top bar close X left, "New entry" title, Save pill right (disabled until body/title/media exists) | title pill field; body multiline field (min 130px, lineHeight 1.5, responds to content via AnimatedSize); timestamp row editable → date/time picker (defaults now); Life Area segmented control; tags chips (surfaceRaised pills, "+ Add tag" ghost); media attach | — | U:L181, D:L331-343, D:L248-251, D:L280-293 |
| Photos | attach photos to entry | file picker/camera capture | 16:9 thumb strip (radiusMd) + "+ Add" dashed pill | U:L181, D:L340 |
| Vlogs | MediaRecorder with compression constraints | record button (G5 dialog: live video preview srcObject, red-dot pulse 600ms); stop → review screen (G4): duration + optional title + Keep/Discard pills; Keep = row created immediately, duration stamped; Discard = file wiped, no row, zero trophies | recording preview; review | U:L181, D:L338-342 |
| Edit/delete/remake | edits append events | edit, delete, remake | — | U:L182 |
| Media viewing | media plays inline | — | object URLs resolved via MediaRepository | U:L183 |
| On-This-Day memory strip (J1) | small card on Calendar (memory-map screen) + tiny line at top of Journal view | — | what was logged exactly N years ago today (nearest past year with data first: 1y → 2y → 5y…); pure derived query; H4: no data → no render; NO XP; FACTS ONLY (never reads text content); no notifications; MEDIA STUBS: PC-archived media = thumbnail + "archived to desktop, tap for details" (never broken play button); LEAP DAY: Feb-29 matches Feb 28 via shared `sameMonthDay` utility | U:L187-197 |
| Search (J2) | entry point on Journal page + Calendar | plain word/keyword/tag query; filterable by Life Area | results newest-first, matching term highlighted, tap → full entry; FULLY OFFLINE; ZERO new storage; simple matching (whole words + tags, no fuzzy/AI); shared matcher also serves J7 video search; worker if slow | U:L198-206 |
| Tag/area filter view (J6) | filter chips for #tags and Life Area on Journal page (incl. physique-tagged A5 entries — MediaStorage.md §Physique-Photo Timeline) | chip taps | search + calendar's Journal filter become one-tap findable list; derived only, no new table | U:L207-210 |
| Quiet week (J4) | user marks a date range in Settings → Coach | range selection | pauses Coach nudges (habit-miss lines, journal-drought pokes, streak warnings) — guilt loop muted; ONLY user starts it (never auto-detected); history stays TRUE; streaks stay REAL (shield = Grace setting); includes calendar day-view journal-drought line | U:L211-219 |
| Batch import (J3) | Settings → Data → "Import entries" | one plain-text file (date | title | text per block) | preview list with dates ("47 entries, 2019–2021"); confirm → rows added backdated; entries ONLY (never habit check-ins/weights/etc.); `imported` flag; NO XP; DayKey = ORIGINAL date; dedupe blocked by (original date + body-content-hash at import time); preview reports "N already imported, M new"; achievement/cadence counters EXCLUDE imported rows | U:L220-230 |
| Year book (J5) | Settings → Data → "Year book" → pick a year | year picker | READABLE human PDF: entries in date order, embedded photos/vlogs, stats page (days journaled, habits, gym sessions, milestones); READ-ONLY (packages a copy, never moves/rewrites real data); no Coach/XP; MEDIA STUBS: PC-archived items print "archived to desktop [date], file: …"; PDF gen needs package → DecisionLog + approval | U:L231-238 |

## 7. Habits (U:L240-251, D:L184-193, D:L345-354, D:L184-193)

| Item | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Today's list | habit tiles in one BlockCard group | one-tap check-off (pop scale 1→1.15→1, streak fades durFast, gold 300ms) | tile: 44×44 check circle (checked = accent fill + onAccent check), name tileTitle + streak line bodySmall (≥3 → gold), 7-day dot row (6px pills; checked accent, unchecked hairline, today = accent ring 1.5px) | U:L242, D:L184-191 |
| Habit detail | tap name → expand | tap | 30-day dot grid (5×6, same dot grammar) — G9, no charts; simple streak + recent 7/30 day indicator (no charts MVP unless trivially cheap) | U:L243-244, D:L192-193 |
| Create/edit/archive | name, optional Life Area, daily cadence (MVP: daily only) | tile menu (desktop hover chevron / mobile long-press): edit, archive (archive → confirm dialog); add = FAB → bottom sheet (name field, Life Area picker, Save pill) | bottom sheet (radiusXl top corners, drag handle, max 92% height) | U:L245-246, D:L239, D:L347-352 |
| Auto-tracked habits | autoSource "workout" (future "weigh-in") | session save auto-writes day's check-in in same transaction; manual check-ins win; session deletion cleans up auto check-in with compensating revoke | per-habit controls in Settings Group 6 | U:L247-251 |

## 8. Session UI & Fitness Logging (U:L253-282, D:)

| Item | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Daily logging flow | day pre-fills template's exercises with target sets/reps | type actual weight × reps per set; add/remove/swap exercises freely; freeform + paste fallback | plans never store weights (structure only) — template/session layering | U:L255-258 |
| Last-time hint | previous session's weight + reps + est-1RM shown faintly per set | confirm-or-bump | freshness tiers: <2wk full hint · 2–4wk quieted with date · >4wk collapsed AND progressive-overload suggestions pause (~90% baseline instead of +2.5kg extrapolation); constants configurable in settings | U:L259-264 |
| Session comparison (N4) | "Compare" on any past session | tap | side-by-side vs previous same-template session: per-exercise weight/reps/est-1RM deltas, volume delta, PR flag; stale gaps/deload/injury annotated, never judged; reachable from history, calendar day, records vault; pure derived UI, no schema; reads `strengthSnapshot(exerciseId, asOf)` | U:L265-270 |
| Template cloning (F4) | one-tap "Duplicate template" | tap | variant copy (exercises/sets/reps/order/pairings) for new phases/splits | U:L271-272 |
| "Track this exercise" | session screen's exercise menu | one tap | exercise appears in dashboard "Your lifts" block; reuses tracked toggle | U:L273-275 |
| Auto-assort paste | rule-based loose-grammar paste parser | paste text | fuzzy match + "Did you mean?" confirm + inline create with muscle assignment — NEVER silent auto-create; offline, NO AI; M1-or-M2 | U:L276-279 |
| Do-not-build | picker ergonomics tweaks (I8) declined by user (L054, D069) | — | — | U:L281-282 |

## 9. Settings (U:L284-354, D:L356-364)

Locked principles: H4 applies to settings too (a group appears only when user
has data; no "Sync" group until sync ships); two tiers Main + Advanced
(collapsed drawer); search at top (H4 escape hatch); "Restore defaults" per
group behind confirm dialog naming what will reset; no other fluff.

| Group | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Search field | top of Settings, filters group labels | text | — | U:L291, D:L358 |
| 1. GENERAL | display name · timezone · theme (dark default, theme-able day one) · WEEK STARTS ON (Monday default, display-only; routines stay stored by weekday index) | text fields; theme picker segmented Ink/Paper (proves registry swap); week-start selection | effect: shifts calendar week-grid first column ONLY; weekly checkpoint close day owned by review-day window (Group 2) + closed ISO week; A Week Whole keeps ISO Mon–Sun regardless | U:L299-305, D:L359-361 |
| 2. COACH | strictness (supportive/balanced/strict, default balanced) · weekly review day (default Sunday) · Coach notes in calendar day view (default on) · milestone-review cadence (editable ladder: 1m/3m/6m/1y/yearly, per milestone, or flat interval) · quiet-week range (user-started) | selections | Weekly-window rule: evaluation window = 7 consecutive days ENDING configured review day — single owner consumed by merged check-in, strip's weekly-verdict portion, Coach weekly aggregate alike | U:L306-313 |
| 3. FITNESS | units kg|lb / cm|in (display-convert only, O8) · GLOBAL KILL-SWITCH for PO auto-suggestions (default on) · default weight step (2.5 kg) · rep-first threshold (+2) · physique-photo nudge (default OFF, monthly — F5) · rolling pace window (7d, 14d optional). ADVANCED: last-time hint freshness tiers (O4) · MRV volume floors per muscle group | toggles, selects, numbers | — | U:L314-319 |
| 4. NUTRITION | height/age/sex/activity factor (Mifflin inputs — settings keys, NEVER profile fields) · MANUAL TDEE override (freezes auto-recompute + protein/fat basis until cleared) · protein g/kg per phase (cut 2.0/bulk 1.8/maintain 1.6) · fat floor g/kg (0.6, editable up) · quiet meal reminders (default on). ADVANCED: fully-logged streak window (±10% default, clamped 5–15%) · backfill bound (normal ≤24h vs historical) · macro-collision priority (default keep protein, drop fat to floor) · FOOD MACRO LOOKUP (default ON; OFF = plain manual entry; toggle switches behavior, never deletes data) | numeric inputs, toggles, selects | schema-relevant keys in Database.md §Settings keys | U:L320-331 |
| 5. CALENDAR & MEDIA | default filter (All) · plan-vs-actual default view (Both) · month-header fact line (on) · vlog rewatch buffer days (3–5, default 5) · vacation-day threshold knob for "Took the Time" (default 14 days per vacation year; counts via day-level UNION). ADVANCED: tint weights/caps (dayActivityScore, as locked — keep fixed) | selects, toggles, knobs | — | U:L332-338 |
| 6. HABITS | auto-track from workout (per habit) · deload-day counting (per habit, default counts) | per-habit toggles | — | U:L339-340 |
| 7. DATA & STORAGE | manual backup/export/restore · storage meter · batch journal import (J3) · year-book export (J5); "Settings → Data" from J3/J5 anchors here | export/restore actions; file import | — | U:L341-344, D:L361-362 |
| 8. SYNC | skeleton only: sync on/off, Wi-Fi-only, last-sync time; renders ONLY when entity-sync plane ships (H4) | toggles | — | U:L345-347 |
| Advanced tier | collapsed drawer for thresholds/constants | — | M0: none; flagged | D:L363, U:L290 |
| Restore defaults | per group | confirm dialog naming what will reset | — | U:L293-294 |
| NOT offered as toggles | rep guard 1–12, Epley/Mifflin/Atwater formulas, 7700 kcal/kg (public-formula constants) · dayActivityScore weights (H3 owner; Advanced-only if ever) · per-exercise progression style (per-exercise data, not a global toggle) · reveal-on-first-data H4 (principle, not a preference) · XP/achievement values (M2 open items) · check-in section on/off (one surface, no section chopping) | — | — | U:L349-354 |

## 10. Empty & First-Run States (U:L372-383, D:L365-371, D:L243-246)

| Item | What it is | Inputs captured | Displays | Source |
|---|---|---|---|---|
| Welcome (3-step, G7) | first run, full-screen, bg + washes (NO image layer), 3 pill dots progress (active = accent fill), no skip, back allowed | step 1 "Start" pill; step 2 create first 2–3 habits (habit add rows + "Continue"); step 3 first journal entry (compose-lite: body field + "Done" pill) | (1) what PersonalOS is — display line + 2 lines body; (2) habit creation; (3) journal entry | U:L374, D:L365-371 |
| Fitness onboarding (I9) | after welcome | Mifflin inputs (height/age/sex/activity — Settings Group 4 keys); propose first weekly plan + seeded tracked exercises | user can customize/replace/clear ALL from day one; nothing forced; energy math alive day 1; no profile, no account, no signup — EVER | U:L376-380 |
| Block empty states | every block explains what will appear there, in one line; centered in-card column: one line body textSecondary + optional accent pill action ("Create your first habit"); no illustration in M0; honest, non-judgmental; empty screen = invitation to act | optional pill action | — | U:L381, D:L243-246 |

## 11. PWA & Responsive (U:L3-5, U:L364-370, D:L400-413)

| Item | What it is | Source |
|---|---|---|
| Responsive parity | experience roughly equal on iPhone (installed PWA) and Windows desktop browser — responsive first-class, not mobile afterthought | U:L3-5 |
| Breakpoint | <800 mobile (bottom nav) / ≥800 desktop (left rail); content column desktop: centered max 640px, padding spaceXl; touch targets ≥44 everywhere; one primary action per screen | D:L297-299, D:L404 |
| Mobile | full-width content padding 16; FAB above bar; no hover; tap-to-focus; hidden scrollbar; one column always | D:L404-413 |
| Desktop | 640px column + rail; ghost buttons accentDim wash, tiles raise 1px, cursor pointer; keyboard ring 2px accent; visible thin scrollbar (8px, hairline thumb); placeholders may pair (Goal/Tasks) only when both empty | D:L404-413 |
| PWA requirements | installable (manifest + service worker + iOS icons); standalone display; iOS status bar handling; offline: core loop renders/functions zero network (verified M0); camera/file capture verified on device in M0 | U:L365-370 |
| Density | same component grammar, same tokens, same motion — layout adapts, identity doesn't | D:L413 |

## 12. Global UI rules constraining ANY surface incl. a Life Tree UI

### 12.1 Theme & tokens (D:L44-106, D:L356-363)
- UI code references semantic tokens ONLY, never raw hexes; theme registry (Ink #1, Paper #2 ships with picker); settings swap, never a rewrite; widgets never rebuild — tokens theme-stable by construction.
- Ink (dark default): bg #0D110F, surface #141A16, surfaceRaised #1C241E, textPrimary #E8EDE9, textSecondary #93A29A, textDisabled #55615A, accent #8FBF72 leaf green, onAccent #0D110F, accentDim #8FBF72@22%, gold #E8B45A (streaks ONLY), danger #E06C5F, warning #D9A441 (70% storage), hairline #FFFFFF@7%.
- Paper (light): bg #F2F5F1, surface #FFFFFF, surfaceRaised #FAFBF9, textPrimary #1A211C, textSecondary #5C6B61, textDisabled #A8B2AB, accent #4E7A35, accentDim @14%, gold #8A6A1F, danger #B3382A, warning #8F6A12, hairline #1A211C@10%.
- Type: system fonts only; display 34/40 w600, headline 24/30 w600, title 18/24 w600, tileTitle 15/22 w600, body 15/22 w400, bodySmall 13/18 w400, label 12/16 w500, button 14/20 w600; tabularFigures for numbers (meter, streaks).
- Motion: durInstant 120ms, durFast 200ms, durSlow 320ms, curveStandard easeOutCubic, curveEmphasis easeInOutCubic; reduced motion → all durations 0, drift off, loader static.

### 12.2 Restraint contract (D:L34-42) — applies to the tree's UI
1. One ambience moment per screen (Journal = atmospheric image; Dashboard = gradient washes only; Habits = neither). Never two.
2. Max two accent-colored elements per viewport at rest.
3. Content surfaces ≥96% opaque; ambience never touches text.
4. No gradient text, no glow, no blur-frosted panels, no drop-shadow text.
5. Gold on streaks and nothing else.
6. Every screen has exactly one primary action; everything else is quiet.

### 12.3 Atmosphere (D:L107-136)
- Wash layer on EVERY screen: two radial gradient washes (accentDim top-left + faint warm top-right); Ink drift ±14px translateY over 7s (only continuous motion in the app); off in Paper and reduced motion.
- Image layer OPTIONAL, ONE surface per theme only — the Journal screen (ambience home). Opacity ≤12% Ink / ≤8% Paper + bg scrim gradient; blurred 2–4px. Other screens = washes only. All atmosphere z0, pointer-events none, content cards opaque on top.

### 12.4 Shell & components (D:L152-293)
- FAB 56px accent pill: visible on Journal + Habits only; hidden (fade+scale .7) on Dashboard (quick-capture owns the action) and Settings (Export owns it).
- Pill signature: inverted pill buttons (accent fill, onAccent, StadiumBorder, 48 mobile/40 desktop, pressed scale .97); secondary ghost2 pill (surfaceRaised + hairline + textPrimary); one primary per screen; loading = spinner in-pill.
- BlockCard: surface fill, radiusLg, elevFlat, padding spaceLg; optional title row (title + quiet accent link bodySmall); dashboard blocks stack spaceXl apart.
- Text inputs: layered surfaces, NOT boxes — surfaceRaised fill, radiusMd (title = radiusPill), hairline border, focus → accent 1.5px, persistent quiet label above OR meaningful placeholder (never both); error = danger border + danger message; desktop hover wash #202A22; cursor text.
- Dialogs: radiusXl, surface, title + body, actions ≥44px (Cancel = ghost2 pill, destructive = danger text pill).
- Bottom sheet: radiusXl top corners, 32×4 hairline drag handle, max 92% height (habit edit/add, media viewer caption).
- Media viewer: full-screen bg sheet, photo BoxFit.contain, close pill top-right, caption bar bottom.
- Segmented control: surfaceRaised track radiusPill, active pill = surface + hairline + textPrimary (compose Life Area, theme picker).
- Loader: 2.0s solid brand moment, cold start only (never tab switches); pill-outline brand mark draws itself → accent dot pops → wordmark fades → three breathing dots pulse; waits for first frame; reduced motion = static mark 300ms fade, still 2s.
- Quick-capture: 48px radiusPill row, "What happened today?" placeholder, trailing 36px accent send pill (disabled until text), focus ring hairline→accent, Enter → compose pre-filled with today's timestamp.
- Coach note block: BlockCard "Coach", bodySmall textSecondary, ghost X top-right → confirm → deletes today's coach_outputs row, surfaces again tomorrow.

### 12.5 Accessibility (D:L390-398)
- All interactive targets ≥44×44 logical px; contrast textSecondary on surface ≥4.5:1 (Ink ≈7:1), accent-on-bg ≈4.6:1, gold only bodySmall+ with text labels; keyboard focus 2px accent outline desktop; NO color-only semantics (streaks = gold + text; storage = color + numbers; dots = semantic tooltips); reduced motion handled.

### 12.6 Rules relevant to the Life Tree tab specifically (recap)
- **Shimmer rule:** heavier derived blocks render after skeleton shimmer, never block first paint (U:L52-54). A tree render is exactly this class of block.
- **Tint-only calendar rule:** the tree must not put glyphs/dots/numbers on calendar day cells (U:L137-149); tree state would have to map into the neutral tint + intensity via `dayActivityScore` (H3 owner) — tree has no independent calendar presence.
- **H4 reveal-on-first-data:** tree areas with no data stay concealed; first-touch create action is the escape hatch (U:L56-61).
- **One primary action per screen** (D:L42, D:L299); **no new dependencies** without DecisionLog + approval (U:L237-238, AGENTS.md); **no account/profile ever** (U:L379-380).
- **Gold = streaks only** — a tree's achievements must not use gold (D:L34, D:L81).
- **Memory-map calendar = zero writes, zero storage** — tree-derived calendar visuals must derive from H3 owners (U:L131-134).
- **Nav ordering deferred (U:L19-21):** tree tab placement must NOT be finalized now; do not re-open dashboard/nav ordering.
- **Coach weekly surface merge (U:L103-111):** any weekly tree verdict must live INSIDE the one weekly surface, never a competing weekly surface.

## 13. Open items (build-time) (U:L385-390)

- Exact palette/theme values; dark vs light default.
- Dashboard block sizes on small screens (scrolling vs compact sections).
- Bottom sheet vs full-screen composer on mobile.
- Navigation/layout ordering — deferred to END of design process.
- Atmosphere image asset decision deferred (procedural ink-wash fallback built first; user decides after reviewing built UI; slot stays in architecture regardless) (D:L471-475).

## 14. Ambiguities / gaps flagged (not resolved in these two docs)

1. **Life Tree tab: no existence in either doc.** Only slot: "(future systems)" U:L12. Placement, icon, name, and whether it replaces/joins the 4 tabs are ALL undocumented. Nav ordering rule (U:L19-21) forbids finalizing now.
2. **"One-notification constraint":** not found in UIUX.md or DesignSystem.md. Likely lives in CoachSystem.md (Coach single-output rules) — tree input map must verify there. UIUX's only notification-adjacent rules: quiet week silences nudges (U:L211-219), no notifications for On-This-Day (U:L196).
3. **Dashboard "Your lifts" block** (from "Track this exercise" U:L273-275) is referenced but NOT in the dashboard block list (U:L25-44) — appears to be a session-screen-driven addition not in the block order; ambiguity whether it sits inside Today or is a new block.
4. **Coach weekly section contents** referenced (habits, journaling, life notes — U:L109-110) but detail lives in CoachSystem.md.
5. **Physique-photo timeline (A5)** referenced in J6 (U:L208) — its surface detail lives in MediaStorage.md.
6. DesignSystem.md is DRAFT v3 awaiting user approval (D:L3) — tokens above are the working contract but not yet ratified; UIUX.md wins on conflict.
7. MVP tab set (4 tabs) vs DesignSystem shell (D:L158 "mobile: Column [ContentColumn, NavigationBar]") — consistent; no extra surfaces.
8. Storage meter banner "Export backup now" pill at ≥90% (D:L232) is the only dashboard-level navigation INTO Settings — noteworthy for tree's settings anchoring if it ever needs one.

## 15. Interaction → data inventory (consolidated, every input that produces/derives data)

Text inputs: quick-capture (dashboard), journal compose title/body, habit name, settings search, settings display name, journal search query, session weight×reps typing, freeform/paste entry, auto-assort paste, batch-import file, Mifflin numeric fields (height/age/activity), TDEE override, protein g/kg, fat floor, backfill bound %, default weight step, rep-first threshold, vlog rewatch buffer, vacation threshold, milestone ladder.
Toggles/switches: PO kill-switch, physique-photo nudge, rolling pace window, quiet meal reminders, food macro lookup, theme picker (Ink/Paper), Coach notes in calendar day view, per-habit auto-track, per-habit deload counting, sync on/off + Wi-Fi-only, restore defaults.
Selections: week picker (weekly routine / continue current), per-day override template, Life Area (compose + habit + filters), tags, timestamp edit (date/time picker), strictness, weekly review day, milestone cadence, units kg|lb/cm|in, week starts on, plan-vs-actual view toggle, calendar filter mode, period range (drag) / period dates (picker), year picker (year book), quiet-week range, theme.
Taps/actions that create data: habit check-off, session save (auto-writes habit check-in + meal receipt linkage), meal log/pack actions, session compare, duplicate template, track-this-exercise, export backup, restore, copy-summary-as-text, keep/discard vlog, dismiss coach note (deletes coach_outputs row), archive habit, delete/remake entry, media attach.
Captures: photos (camera/file), vlogs (MediaRecorder with compression constraints), paste fallback.
Derived-only surfaces (zero storage, display-only): macro-gap bar, adherence strip, weekly verdict, calendar tints + day view + year heatmap + month fact line, last-time hints, session comparison, On-This-Day strip, search results, streak/XP display, "N days fully logged" marker, goal progress, today's tasks.

## 16. Display surfaces that could show tree-corresponding data (cross-ref for the tree input map)

- Dashboard blocks (Today, Coach note, Goal progress, Streak/XP) — tree life stats could mirror into these per duality.
- Calendar day tint + day view + year heatmap (tree growth intensity = dayActivityScore territory — but score is a locked H3 owner).
- Habits tile dots (7-day row, 30-day grid) — per-habit growth; tree could map habit health.
- Journal timeline tiles (media-first, count pills) — life-notes feed.
- Coach note block / weekly merged surface — tree reflections would go through the single weekly surface rule (U:L103-111).
- Storage meter — not tree-related (media only) but part of dashboard hierarchy.
- Week strip glance (gym 5/5 · packs 5/5 · weigh-ins 6/7).
- Streak/XP block (M2) — gamified tree nutrients would collide with gold-only-for-streaks and zero-XP consistency marker rules (U:L40-42).