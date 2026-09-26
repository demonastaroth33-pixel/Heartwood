# JOURNALING-APP RESEARCH — MASTER COMPILE (Aug 2026)

**Super-thorough edition.** The complete cross-industry research base for
**PersonalOS** (private single-user Flutter PWA: journal + habits + goals +
coach) — refactor evidence for existing features, incorporation candidates,
GUI/layout intelligence, and Life-Tree/Coach design feed.

> **How to read this file:** Part 0 gives the executive summary and reading
> order. Parts 1–6 are the six cluster deep-dives (per-app profiles with
> evidence). Parts 7–11 are the syntheses: convergence matrix, GUI pattern
> compendium, master steal-list, gap analysis, and decision-ready candidates.
> Part 12 is the Life-Tree + Coach design feed. Part 13 cross-references
> every candidate to its landing doc. Part 14 is the reference index.
>
> **Citation convention:** `(R01 §Day One)` = the app's section in
> `research-journaling/01-daily-journals.md`. Every claim traces to a
> deep-dive report, which carries the inline source URLs. PersonalOS doc
> references use real paths (`docs/UIUX.md`, `docs/CoachSystem.md`, …).
>
> **Tag legend:** `[M0]`=extends built work · `[M1]`=extends planned work ·
> `[new]`=new surface · `[coach]`=Coach feed · `[tree]`=Life Tree feed ·
> `[effort: L/M/H]` = implementation effort at personal scale.

---

## PART 0 — EXECUTIVE SUMMARY (one page)

**The 12 biggest takeaways from ~340 sources across 43 apps:**

1. **On This Day is table stakes — and interactive now.** Every serious
   journal ships a throwback (Day One, Diarium, Daylio, Diaro, Momento,
   Timehop, Journey, 1SE). The frontier is *replying to your past self*
   (StoryPad) and *ephemeral daily ritual* with memory hygiene (Timehop).
   PersonalOS's planned J1 strip can own this pattern — nobody ships it as
   a first-class strip with replies. (R01, R02 synthesis, R04)

2. **The blank-page killers need no LLM.** Apple Journal's suggestion
   engine runs on-device heuristics over photos/workouts/locations. Day One
   "Moments" and Mem's related-entries use retrieval, not generation. A
   rule-based "what to journal" engine over PersonalOS's event log is the
   single highest-value, lowest-risk feature in this entire research.
   (R05 §Apple Journal, §Mem; R01 §Day One)

3. **Capture friction decides adoption.** Daylio proves 2-tap capture
   ("journal without typing"); Drafts proves open-to-blank compose; Keep
   proves capture-type widgets; OneNote/Apple prove OS-level quick capture.
   The formula: open → cursor ready → redundant capture paths (widget,
   hotkey, share-target, voice). (R03, R06 §8.8)

4. **Streaks as courtesy beat streaks as contract.** Finch (4.9★) uses
   earned repair tokens, Pause Mode, gentle returns; Habitica (4.3★) uses
   HP-punishment. Care-based motivation (a pet, a tree, a year-mosaic)
   outlasts performance-based. This is the Life Tree's emotional engine.
   (R04 §Finch, §Habitica, synthesis)

5. **The review is the reward.** Daylio's correlations ("your best days
   cluster around…"), 1SE's annual movie, Reflectly's pattern graphs,
   Timehop's feed — users stay for what the data gives back. PersonalOS's
   check-in stats + Coach should serve this narrative, not XP. (R04)

6. **Media search (OCR) is table stakes.** Evernote, OneNote, Apple Notes,
   Bear Pro, Keep all ship image/PDF/handwriting OCR search; Notion's lack
   of it is its #1 complaint. J2 search should plan for image-text
   indexing. (R03 synthesis)

7. **Escape-hatch exports build trust.** JSON/MD/PDF/CSV/plaintext + media
   folders everywhere (Diarium, Momento, Day One, Standard Notes, Zettlr
   frontmatter). The Year Book PDF (J5) is the retention driver — printed
   output motivates capture (Polarsteps books, Qeepsake albums).
   (R03, R06 §10.2)

8. **Mood as first-class data.** One-gesture mood capture correlated with
   activities (Daylio), logged to Health (Apple State of Mind), with
   mood-conditional prompt routing (Moodnotes, Reflectly) — all rule-based.
   (R01, R04)

9. **Auto-context enrichment is the "type less, preserve more" promise.**
   Weather, location, calendar events, camera-roll photos auto-attached
   (Day One, Diarium). PersonalOS can mirror this from its OWN event log —
   no external APIs needed. (R01)

10. **The daily note is the winning home screen.** Logseq, Roam, Capacities,
    Reflect, Tana, Craft all open onto today's page. (R02 synthesis #1)
    PersonalOS's dashboard today-section is the seed; deepen it to
    day-scope with yesterday/tomorrow paging + unfinished-from-yesterday +
    on-this-day.

11. **Privacy is the product, not a feature.** Local-first/E2E/"we never
    see your data" is the strongest differentiator in every cluster
    (Daylio onboarding, Presently, Finch, Standard Notes, Anytype,
    Memento). Anti-patterns documented: training on content (Rosebud ToS),
    cloud-only memory (companion graveyard 2025), paywall nagging
    (Reflectly), punishment loops (Habitica). (R04, R05 synthesis)

12. **Genuine white space for PersonalOS:** no app combines (a) private
    journal-first daily notes with (b) rich inline media (photos + vlog
    playback) with (c) an interactive memory strip with (d) habit/goal
    engines and (e) a rule-based Coach. The second-brain cluster is
    text-first; the media-journal space lacks structure. PersonalOS's
    media-rich daily notes + memory strip + Coach + Life Tree is a
    differentiated combination nobody else ships. (R02 synthesis)

---

## PART 1 — METHOD & SOURCE BASE

### 1.1 How the research was run
- **6 parallel research agents**, one per app cluster, each instructed to
  mine websearch + webfetch: official docs, app-store listings, 2026
  reviews, release notes — ≥3–4 distinct sources per app, primary sources
  preferred.
- **~340 distinct sources** cited inline across the 6 deep-dive reports.
- **Mobbin** (real-app UI reference database): live queries pulled
  screen/flow inventories for Finch (671 screens), Evernote (352),
  stoic. (303), plus Apple Notes, Notion, 5 Minute Journal, Bloom,
  Otter AI — saved as JSON in `research-journaling/mobbin-*.json`
  (query helper: `research-journaling/mobbin-query.mjs`).
- **Honesty policy:** where an app name was ambiguous or unfindable
  (StoryDays → story-diary family; Ohai → different product than assumed),
  the reports say so explicitly and cover the verifiable nearest family.
  Nothing was fabricated.

### 1.2 The six clusters
| # | Cluster | Report | Apps |
|---|---|---|---|
| 01 | Daily journals & diaries | `01-daily-journals.md` (56 KB) | Day One, Diarium, Apple Journal, Daylio, Grid Diary, Reflectly, Diaro, Pencil Journal, Momento, StoryPad-family |
| 02 | Second brain / networked notes | `02-second-brain.md` (72 KB) | Obsidian, Logseq, Roam, RemNote, Reflect, Capacities, Mem, Tana, Anytype, AFFiNE |
| 03 | Productivity giants | `03-productivity-giants.md` (47 KB) | Notion, Evernote, OneNote, Apple Notes, Craft, Ulysses, Bear, Standard Notes, Keep |
| 04 | Wellness, mood & habit | `04-wellness-mood-habit.md` (71 KB) | Finch, Stoic, Presently, Moodnotes, Reflectly, Daylio, 1SE, Timehop, Memento DB, Habitica |
| 05 | AI-first journals & memory | `05-ai-journals.md` (53 KB) | Memento AI, Ohai, Reflect, Mem, Notion AI, Saner, Rosebud, Journey, Apple Journal AI, Replika |
| 06 | Capture-first, handwriting, emerging | `06-capture-handwriting-emerging.md` (59 KB) | Drafts, Twos, GoodNotes, Notability, Nebo, Zettlr, Quick Note, Keep, innovation watch |

### 1.3 Limitations (read before trusting)
- Prices/features as of **Aug 2026**; subscription tiers churn (Day One
  split Basic/Silver/Gold in Mar 2026; Evernote's free tier cut to 50
  notes). Verify current terms before any build decision.
- Mobbin covers a subset of apps; screen inventories are best-effort
  reference, not exhaustive.
- App-store ratings are directional, not evidence of design quality —
  used with the written reviews.

---

## PART 2 — CLUSTER 01: DAILY JOURNALS & DIARIES
*(full depth: `research-journaling/01-daily-journals.md`)*

### 2.1 Cluster thesis
The mature, category-defining family. The 2026 convergence: **timeline +
auto-context + On This Day + streaks + escape-hatch exports**, priced from
free to $75/yr, with trust as the loudest signal (Day One's E2EE-by-default,
indie one-time purchases, "we never see your data" positioning).

### 2.2 App profiles (paradigm · key features · GUI · steals)

**Day One (Automattic)** — the category-defining digital journal; ~15M+
downloads, 200–300K five-star ratings. (R01 §Day One)
- *Paradigm:* timeline-first, date-and-time-stamped entries; every entry
  auto-captures time, date, location, weather, moon phase — "type less,
  preserve more." 2026 added a **Today tab** (single-day dashboard with
  quick links to Entries, On This Day, Daily Chat, Moments).
- *Features:* unlimited journals + Journal Collections (2026.15/16);
  per-journal toggles "Show in Today View / On This Day"; tags, favorites;
  Map view; Media view; book printing (hardcover/paperback); Gold tier =
  Daily Chat (conversational AI entry generation, voice mode), Entry
  Summaries, Go Deeper prompts, image generation. E2EE on ALL plans.
- *GUI:* bottom/sidebar tabs **Today | Journals | Timeline | Calendar |
  More**; Journal Drawer for quick journal switching; single-column
  timeline grouped under date headers with photo thumbnails; full-screen
  focused editor; month calendar with dot counts + mini previews;
  three-pane desktop (journal list | timeline | entry). Feel: serene,
  photo-forward, "gallery of your life."
- *Steals:* [M1] On This Day as first-class per-journal surface; [new]
  Today tab + Moments (prime the entry from your own data); [M0]
  automatic context capture; [M1] E2EE posture + book printing as
  long-horizon trust.

**Diarium (Timo Partl)** — the Windows-first, no-account, one-time-purchase
power journal; Microsoft Store Award 2024. (R01 §Diarium)
- *Paradigm:* calendar + timeline hybrid, **enrichment-first** — automatic
  integrations stuff context into each day (weather, camera roll, system
  calendar, health data, GitHub commits, Last.fm, Untappd, sunrise/lunar,
  "Days of the Year").
- *Features:* unlimited attachments of ANY file type; tags reusable as
  trackers (mood/weight/metrics); people, ratings, locations; templates;
  photo EXIF → auto location; import from Day One/Diaro/Journey/Daylio/
  Evernote/Apple Journal; export Word/HTML/JSON/text; BYO-cloud sync
  (OneDrive/GDrive/Dropbox/iCloud/WebDAV); optional full database
  encryption (V5).
- *GUI:* classic desktop three-pane (sidebar Calendar/Timeline/Map/
  Attachments/On This Day/Search | entry list | rich-text editor); mobile
  bottom nav; month-grid calendar with count badges; **Map view** =
  dot-clustered world map of every entry ("a soft visual log of two years
  of life"); Attachments view = all media in one scroll; dark/light +
  accent + custom font. Feel: calm, utilitarian, "closest thing to a paper
  notebook."
- *Steals:* [M1] BYO-cloud sync ethos (maps to backup/export);
  [new] Map view as life-log (pairs with periods/travel, physique
  timeline); [M1] migration imports (extends J3); [M1] auto-context
  integrations (from OWN data only).

**Apple Journal (iOS 17.2+)** — free, built-in, suggestion-first. (R01
§Apple Journal)
- *Paradigm:* opens to a **wall of auto-curated "Moments"** (grouped
  outings, photos, workouts, music, locations, people) you pick from —
  "never have to start with a blank page." Below: chronological recent
  entries + Reflection prompt cards.
- *Features:* inline media in flowing text (photos/videos/places/state of
  mind/audio w/ transcription/handwriting); multiple journals w/ icons;
  bookmarks + filters (photos/videos/places/bookmarked); backdating;
  Insights (streaks, days journaled, fun stats); schedule + reminders;
  **Journaling Suggestions** ingest workout/music/contacts/photos/
  locations/state-of-mind — all on-device; State of Mind + Mindful Minutes
  → Health; E2EE in iCloud, on-device suggestions, secondary lock.
- *GUI:* home = suggestion cards with prompts under each ("What was the
  highlight of your trip?"); top-right filter chips; keyboard-top toolbar
  (moments, photo, voice, location); bright, card-based, scrapbook feel.
- *Steals:* [M0] the on-device suggestion engine (zero-LLM proof);
  [coach] Reflections = curated positive-psychology prompts; [M0] mood as
  first-class (State of Mind); [M0] inline media in flowing text;
  [new] widgets for streak + rotating prompts; [coach] per-category opt-in
  + skip/clear privacy controls.

**Daylio (Habitics)** — "the journal without typing"; 20M+ users, 4.8★.
(R01 §Daylio)
- *Paradigm:* **mood-first micro-journaling** — pick a mood emoji, tap
  activity icons, optional note/photo/voice. Sub-30-second capture.
- *Features:* customizable moods/activities (2000+ icon library); note
  templates; photo/voice attachments; goals (daily/weekly/monthly) +
  habit tracking inside the flow; **mood↔activity correlations** ("does
  good sleep improve your mood?"); **Year in Pixels**; weekly/monthly/
  yearly stats; On This Day (2026); 100% local, backups to your encrypted
  Drive/iCloud; CSV free / PDF Premium export.
- *GUI:* check-in screen IS the app — mood emoji carousel → activity icon
  grid → optional note → save; bottom tabs today/stats/calendar/entries;
  11-screen onboarding leads with privacy; game-like, bright,
  ADHD-friendly.
- *Steals:* [M0] two-tap capture benchmark ("under 30s, zero typing");
  [M1] Year in Pixels; [coach] activity↔mood correlations (rule-based);
  [M0] goals inside the journal flow; [M0] privacy as marketing in
  onboarding.

**Grid Diary (Sumi Interactive)** — structured/guided journal; Google Play
Best of 2020. (R01 §Grid Diary)
- *Paradigm:* **the grid** — each day = a customizable grid of prompted
  cells ("What am I grateful for?", "What did I get done today?"); Mandala
  9-cell layout (center + 8 ring cells); day/week/month/year diaries
  connected as a "personal growth system."
- *Features:* cell = short answer + markdown + inline image + checklist;
  template library; habit check-ins inside entries; multiple journals;
  tags + mood stickers; HealthKit integration; prompt library user-editable.
- *GUI:* home = month calendar heatmap → tap day → card grid of prompt
  cells; time-scale switcher Day/Week/Month/Year; calm, airy,
  "personal-development planner" look.
- *Steals:* [new] the grid as an optional compose mode (blank-page cure);
  [tree] mandala layout ≈ Life Areas as grid cells; [M1] day→week→month→
  year connected system (Year Book); [M0] habits inside the daily grid;
  [M1] multi-format export PDF/MD/JPG.

**Reflectly (Kodeon)** — "the world's first intelligent journal"; AI-guided
mood journaling, 12.5M+ downloads. (R01 §Reflectly)
- *Paradigm:* mood-check-in-first guided journaling; personalized follow-up
  questions based on mood + past entries; morning motivation + daily
  challenges; evening insights.
- *Features:* mood slider → factors → titled entry; prompt routing; mood
  graphs after 5 days; habit tracker tied to positivity cycle; streak
  tracking; daily challenges (draw/affirm/compliment).
- *GUI:* warm gradient "best friend" aesthetic; home = date + mood prompt +
  quote + challenge cards + big +; feed tab = chronological.
- *Steals:* [coach] personalized follow-up questions (rule-based version);
  [coach] daily challenges; [M0] mood-first compose flow; [coach] morning/
  evening rhythm; **cautionary:** aggressive upsell (67%-off nagging,
  countdown timers) erodes trust — never copy.

**Diaro** — mature cross-platform manual diary; 5M+ downloads; PRO ~$6/yr.
(R01 §Diaro)
- *Paradigm:* classic date-keyed diary; calendar view, timeline, world map
  (Atlas), folders, tags, mood, weather, location. "Calm by
  no-integration."
- *Features:* unlimited photos per entry; photo strip header; voice-to-text
  dictation; text-to-speech read-aloud; 17 fonts; collage maker; image
  editor; stickers; OCR text recognition; templates; **Diaro Online** (a
  real full-featured web editor).
- *GUI:* bottom nav Calendar | Timeline | Folders | Tags | Atlas | Media
  Gallery; entry screen = title + date/weather/mood header + swipeable
  photo strip + rich text body; Atlas = world map pins.
- *Steals:* [new] Atlas map; [new] Diaro Online pattern (PersonalOS IS a
  web app already); [M1] photo-strip header (evaluate vs inline);
  **the anti-context-design pole:** serene manual vs auto-enrichment —
  a deliberate choice to make (§11).

**Pencil Journal (iPad)** — handwriting-first, one page per day; free.
(R01 §Pencil Journal)
- *Paradigm:* one dated page per day; Apple Pencil handwriting + sketch +
  typed text mixed; calendar keeps the chain.
- *Features:* 50+ prompts / 100+ quotes; page backgrounds (dot/line/blank);
  export/import via system share sheet (AirDrop/Files/Mail/iCloud/Drive).
- *Steals:* [new] one-page-per-day + calendar chain as an alternate daily
  view; [new] motivational quote per page; **"no OCR by design"** honesty
  stance (cf. Pennen) — document the handwriting≠searchable tradeoff.

**Momento (iOS)** — the auto-import life-log. (R01 §Momento)
- *Paradigm:* unified day-grouped timeline mixing manual moments with
  auto-imported feeds (Facebook/Twitter/Instagram/Flickr/Swarm/Spotify/
  RSS); browse by day/month/year/on-this-day; group into Events;
  day/month/year summaries.
- *Features:* people/places/tags as first-class explore surfaces; 3D Touch
  quick capture; streaks + custom reminders; export plain text + media
  folders with granular period filters.
- *Steals:* [new] "diary that exists even when you don't write" — the
  event log can auto-populate day summaries; [M1] unified day timeline
  interleaving manual + auto items; [new] people/places/tags explore;
  [M1] day/month/year summaries → Year Book.

**StoryPad-family (story diaries)** — story-unit, multi-page entries.
(R01 §StoryDays note)
- *Paradigm:* one entry holds multiple pages/chapters (daily note + longer
  reflection + photos); unified single timeline, no folders ("you don't
  live in categories"); one-time purchase / open-source / BYO-Drive
  backup; image auto-compression toggle; **throwback with REPLY**
  (StoryPad 1/2/3-year throwbacks).
- *Steals:* [new] multi-page entries; [M1] interactive throwback (reply to
  your past self); [M1] image auto-compression (media storage);
  [new] single-timeline-no-folders stance (debate vs Life Areas).

### 2.3 Cluster synthesis (daily journals)
- On This Day is non-negotiable and should be interactive + filterable.
- Auto-context is the "type less, preserve more" promise — mirror from own
  event log.
- Trust (E2EE/local-first/escape-hatch) is the category's loudest signal.
- Pricing spectrum: free tiers are usable; the market punishes aggressive
  upsell (Reflectly) and rewards transparency.

---

## PART 3 — CLUSTER 02: SECOND BRAIN & NETWORKED NOTES
*(full depth: `research-journaling/02-second-brain.md`)*

### 3.1 Cluster thesis
The text-first knowledge family. Its gifts to a journal app: **daily-note
as home, backlinks/unlinked-mentions, queryable structure (properties/
supertags/objects), live query blocks, review cadence, command palette,
block transclusion, E2E/export posture.** Its gap: media. Nobody here ships
rich photo/vlog entries with a memory strip — PersonalOS's combination is
genuine white space.

### 3.2 App profiles

**Obsidian** — local files, wikilinks, graph; fully free since 2025;
2,700+ plugins; new "Bases" database feature. (R02 §Obsidian)
- *Paradigm:* vault of Markdown files; bidirectional links; graph view.
- *GUI:* three-pane desktop — far-left ribbon (quick switcher, graph, daily
  notes, command palette), left sidebar (File explorer/Search/Favorites/
  Tags/Backlinks/Outline), center editor with draggable tabs + split
  panes, right sidebar (Backlinks/Outgoing/Properties). Daily-note flow:
  calendar icon → today's note with template content; Yesterday/Tomorrow
  wikilinks in template = chronological paging. Graph view as overlay.
  Mobile: same vault, hamburger sidebar, daily note via bottom bar.
- *Steals:* [M0] wikilink autocomplete + backlinks pane; [M1] properties/
  frontmatter as queryable layer (Dataview: "mood last 30 days");
  [new] local graph / unlinked-mention surface; [new] command palette
  (Ctrl+P) as universal navigation.

**Logseq** — journal-first open-source outliner; native SRS + PDF workflow.
(R02 §Logseq)
- *Paradigm:* the app IS today's page; bullet outline; `[[` autocomplete,
  `((` block embeds; linked references panel.
- *Steals:* [new] journal-first launch (home = day view); [new] block
  references/transclusion with live sync ("quote last week's entry");
  [M1] PDF-highlight-to-note; [M1] Datalog-style queries (visible 10% =
  filter chips + search); [new] collapse/expand outliner in a day entry.

**Roam Research** — the original block-reference engine; $15/mo; widely
judged stagnant. (R02 §Roam)
- *Steals:* [new] unlinked references ("you wrote about X 3 times without
  tagging it") — the engine for auto-suggested tags; [new] block-level
  embeds with live propagation; [new] `{{mentions}}` inline panels;
  [M0] interstitial journaling timestamps (Ctrl+Shift+Enter);
  [new] daily-note template with embedded queries (hydrate the day:
  unfinished-from-yesterday + on-this-day-last-year).

**RemNote** — notes + spaced-repetition flashcards. (R02 §RemNote)
- *Steals:* [M1] Daily Doc week strip + template button (compact 7-day
  strip atop day view); [new] **portals = Life Areas as live windows**
  ("folders-lite" that aggregates); [new] highlight/quote → review item;
  [new] cloze-deletion journal prompts ("On [date] I felt ___").

**Reflect** — E2E + native AI, "open → type → done" under a second.
(R02 §Reflect)
- *Steals:* [new] calendar-scaffolded daily note (day page pre-structured
  by the day's events — PersonalOS could scaffold by routines);
  [M1] E2E-by-default posture; [new] voice-note → transcription → entry
  (vlog-adjacent); [coach] AI action-item extraction from entries;
  [new] minimalism discipline (no plugins, one opinionated layout).

**Capacities** — objects, not notes; Related Content; calendar Day view.
(R02 §Capacities)
- *Paradigm:* objects with properties; daily note; week/month overview;
  dashboard mode; capture integrations (WhatsApp/email → daily note).
- *Steals:* [new] Related Content (unlinked-mention auto-surface);
  [M1] custom journal object types with date properties (mood/sleep/habit
  metrics = check-ins); [M1] week/month overview + dashboard-mode daily
  note (weekly-review screen); [M1] calendar Day view with day timeline —
  closest thing to a memory strip anywhere ("near to the on-this-day
  memory strip, minus the N-years-ago magic" — the white space);
  [new] capture integrations appending to today's note.

**Mem** — AI notes, zero filing. (R02 §Mem)
- *Steals:* [M1] semantic search as the north star for J2; [M1] AI daily
  digest ("here's what's relevant from your past") — engine behind the
  memory strip; [new] smart templates hydrated from history (beats blank
  pages); [coach] chat-with-notes with inline citations; [M0]
  zero-capture-friction posture ("everything goes to today, structure
  later").

**Tana** — supertags + live search nodes. (R02 §Tana)
- *Steals:* [M0] **supertags = Life Areas with fields** (#health carrying
  mood/sleep fields turns bullets into queryable check-ins — the cleanest
  "folders-lite + structure" concept); [new] live search nodes as
  dashboard blocks (filter chips as embedded query blocks);
  [new] @-references (mirrored content — pull a Life Area's overview into
  today's entry); [M1] Tana Paste (paste messy text → AI structures it —
  for batch import/vlog transcripts); [new] daily-note-as-dashboard
  (day page pre-assembles everything relevant at open).

**Anytype** — E2E local-first objects + relations; source-available.
(R02 §Anytype)
- *Steals:* [M1] E2E + recovery-phrase model (encrypted export archives;
  backup-restore as first-class ritual); [new] relations instead of tags
  (entry → Life Area → habit as relations); [new] sets/views over types
  (calendar/table/kanban views of same type); [new] P2P self-hosted sync
  option; [M0] offline-as-architecture posture.

**AFFiNE** — page ↔ edgeless duality on the same blocks; MIT OSS.
(R02 §AFFiNE)
- *Steals:* [M1] the same content as linear timeline OR spatial board
  (physique timeline + Year Book as VIEWS of same entries, not separate
  features); [tree] block-level media on canvas (year-in-review wall);
  [new] mind-map mode from blocks; [M1] AI summary of long docs (month
  recap pattern).

### 3.3 Cluster synthesis (second brain) — R02's ranked list
1. **Daily note as home screen** — the most repeated winning pattern.
2. **On-this-day / day timeline** — genuine white space; we can own it.
3. **Unlinked mentions auto-surface** — powers auto-tagging/connections.
4. **Life Areas as typed objects/supertags/portals, not folders.**
5. **Live query blocks inside the day view** — the day hydrates itself.
6. **Interstitial timestamps + capture integrations.**
7. **Review cadence built into the product** (review = a screen, not a
   plugin).
8. **Semantic retrieval** — the upgrade path for J2.
9. **E2E/export posture** as baseline guarantees.
10. **Block transclusion** — "quote my old self" reflection mechanics.

---

## PART 4 — CLUSTER 03: PRODUCTIVITY GIANTS
*(full depth: `research-journaling/03-productivity-giants.md`)*

### 4.1 Cluster thesis
Scale + maturity lessons: **OCR search is table stakes, capture friction
decides adoption, and journaling is NOT first-class anywhere in this
cluster** — only Craft (Daily Notes + Yesterday/Today/Tomorrow widget) and
Standard Notes (Daily Notebooks) even name it. A purpose-built private
journal has a real gap to fill.

### 4.2 App profiles

**Notion** — pages + databases, all-in-one; offline only since Aug 2025
(50-row database sync cap, no embeds/AI offline); **zero OCR search** —
its #1 complaint. (R03 §Notion)
- *Steals:* [M1] database-as-view engine (one date-tagged store rendered as
  calendar/timeline/gallery — the backbone for Life-Area filters + chips);
  [new] quick-capture widget patterns (iOS Page/Recents/AI widgets);
  [M1] version-history tiers (7/30/90 days — we can outdo with unlimited
  local); [M1] button + callout quick-capture pages.
- *Anti-steal:* no OCR + weak offline = exactly what a journal must not be.

**Evernote** — classic notes + the best OCR; but now the most expensive
note app ($249.99/yr Advanced; free tier cut to 50 notes/one device);
under Bending Spoons with genuinely good v11 AI (Semantic Search, AI
Meeting Notes). (R03 §Evernote)
- *Steals:* [M1] **OCR search** over images/PDFs/handwriting — the #1 media
  search capability; [new] home dashboard pattern (pinned shortcuts +
  recent + scratch pad + calendar in one surface); [new] mobile bottom
  quick-capture bar (text/camera/audio/checklist); [M1] Web Clipper with
  ad-stripping article mode (batch import / on-this-day enrichment);
  [M1] **ENEX export discipline** — every competitor ships an importer;
  being the app with a clean escape hatch builds trust.

**OneNote** — freeform canvas notebooks; free. (R03 §OneNote)
- *Steals:* [M1] freeform canvas / click-anywhere composition (anti-blank-
  page for visual journaling + annotated photo timelines);
  [new] **Win+Alt+N system-wide Quick Note** (OS-level capture);
  [M0] audio recording synced with text/ink, searchable spoken words
  (vlogs!); [M1] handwriting OCR + image OCR search; [M1] screen clipping
  → OCR "Copy Text from Picture" (photo-first journaling becomes
  searchable).

**Apple Notes** — rich quick notes, smart folders. (R03 §Apple Notes)
- *Steals:* [M1] Smart Folders as saved searches (tag/date/attachment
  filters, AND/OR — the exact pattern for filter chips + quiet-week
  queries); [M0] tags typed anywhere + auto-color (zero-friction tagging);
  [new] `>>` link-to-note with auto-updating backlinks;
  [new] Quick Note as OS surface (share sheet, corner swipe — PWA: share
  target); [M0] interactive checklists.

**Craft** — beautiful docs + the best daily journal entry point. (R03
§Craft)
- *Steals:* [M1] **Daily Note with date-rolling widget (Yesterday/Today/
  Tomorrow)** — the cleanest daily-journal entry point in the cluster;
  [M0] document tabs on desktop + instant open ("loads instantly with
  thousands of documents while Notion lags" — speed of open matters for
  daily habit adoption); [coach] metered AI credits inside the editor
  (simple transparent AI without subscriptions); [new] tasks embedded in
  documents with Inbox/Today; [M1] Markdown as lossless export.

**Ulysses** — distraction-free long form with gamification-in-editor.
(R03 §Ulysses)
- *Steals:* [M0] **goal + streak progress ring in the editor** (writing-
  habit mechanics as editor furniture — closest to PersonalOS
  gamification); [M0] Focus Mode dimming + typewriter scrolling;
  [new] sheets-as-chunks within groups (journal entries as granular,
  reorderable units); [M1] proprietary-but-exportable philosophy (users
  forgive lock-in only when export is one click).

**Bear** — nested hashtags as THE organization system. (R03 §Bear)
- *Steals:* [M0] **nested inline hashtags `#area/thing` as the entire org
  system** — zero separate tag-management UI; maps directly to Life
  Areas; [new] wiki-links in a plain-text app; [M1] markdown export
  lossless; OCR search (Pro).

**Standard Notes** — E2E by default; the trust gold standard. (R03
§Standard Notes)
- *Steals:* [M1] **encryption as default, not a feature** (esp. with
  physique photos); [M1] daily encrypted email backups (off-vault backup
  cadence); [M1] Daily Notebooks for journaling (journaling as first-class
  paid feature); [M1] plaintext/encrypted dual export + self-hostable
  sync; [M1] **10-year longevity pledge** (trust mechanism for a life-
  log).

**Google Keep** — the capture front door. (R03 §Keep)
- *Steals:* [new] **one-tap capture widgets per note type**
  (text/checklist/voice/photo/drawing — PWA can mirror with share-target +
  widgets); [new] card grid with color + pinned section (glanceable
  visual scanning beats dense list rows); [new] location-based reminders;
  [M0] voice note with automatic transcription; [M1] "Send to Docs"
  graduation path (quick capture escalates to long form — quiet week →
  Year Book should offer the same escalation).

### 4.3 Cluster synthesis (giants)
- **Media search (OCR) is table stakes**: Evernote, OneNote, Apple Notes,
  Bear Pro, Keep all ship it; Notion doesn't and it's the #1 complaint.
- **Capture friction decides adoption**: Keep/Apple Notes win on <1s
  capture; widgets breadth matters; OS-level quick capture is the gold
  standard (PWA approximation: share-target + widget + hotkey).
- **Journaling isn't first-class anywhere here** — the gap is ours to own.

---

## PART 5 — CLUSTER 04: WELLNESS, MOOD & HABIT
*(full depth: `research-journaling/04-wellness-mood-habit.md`)*

### 5.1 Cluster thesis
The emotional-engagement family. Core lesson (R04 synthesis): **care-based
motivation beats performance-based; the review is the reward; depth is
optional; trust is the moat; one notification per day max.** This cluster
is the Life Tree's design laboratory.

### 5.2 App profiles

**Finch** — self-care pet, streaks-as-courtesy; 4.9★. (R04 §Finch)
- *Paradigm:* a bird you care for by completing goals/check-ins; growth you
  nurture, not numbers you chase.
- *Features:* streak repair with EARNED tokens (not bought); Pause Mode
  freezes streaks; gentle return flow (no "you missed 5 days" nag);
  no-fail journaling (prompt-guided, "journal three lines", decline
  without recording); Micropet Lab (reward bound to ONE specific goal
  completed N times); 645 screens catalogued on dezzayn as the gamified-
  wellbeing reference library.
- *GUI:* birdhouse home — birb center (tap mood, drag to pet), daily goals
  checklist below, Adventure button when energized; tabs Home/Quests/Shop/
  Friends/Bag/Birb; onboarding = name bird → few questions → auto-seeded
  starter goals → notification prompt → widget setup → "real check-ins on
  day one"; empty states reframed as care ("your birb is waiting").
- *Steals:* [M0] streak-as-courtesy (repair tokens + pause — complements
  grace); [tree] care-object motivator ("my bird is waiting" — the Life
  Tree's emotional engine, nurture → visible growth); [tree] Micropet Lab
  mechanic (specific trophy → leaf bloom); [M0] no-fail journaling;
  [M0] gentle return flow (for quiet-week aftermath).

**Stoic** — philosophy-guided journaling; 120-second sessions. (R04 §Stoic)
- *Steals:* [M0] **time-boxed sessions (120 seconds)** — explicit answer to
  "how long is the minimum viable journal entry?"; [coach] ritual framing
  (morning prep / evening review — two fixed daily touchpoints with
  different content: intent vs retrospection); [coach]
  philosophy-as-prompt-engine (prompts teach a reusable cognitive move —
  Life-Area prompts with question frameworks); [new] app-blocking during
  reflection (optional focus gate); [M0] template library for life
  scenarios (scenario-scoped entry types).

**Presently** — gratitude, one-entry-per-day, open-source, free. (R04
§Presently)
- *Steals:* [new] calendar-grid-as-home-screen (the entire state of your
  practice visible without any dashboard — perfect for streak/consistency
  display); [new] one-entry-per-day constraint mode (removes the
  catch-up-missed-days spiral; the streak can't be repaired by
  retro-filling, so the habit stays honest); [M0] open-source + local-only
  as trust features; [new] quote-of-the-day widget.

**Moodnotes** — progressive deepening; effectively dead (Bending Spoons,
last update Oct 2024, $14.99/mo). (R04 §Moodnotes)
- *Steals:* [M0] **progressive deepening** — one swipe logs a mood; five
  taps reach a full CBT worksheet. The single most transferable compose
  pattern for PersonalOS (quick check-in → optional structured
  reflection); [coach] mood-conditional prompt routing (negative moods →
  analysis prompts; positive → gratitude) — rule-based, no AI;
  [coach] thought-trap engine with reframe-and-rerate loop; [M0] face
  slider over emoji grid.
- *Cautionary:* Bending Spoons acquisition → paywall + stalled development
  + loosened privacy label — local-first + no forced migration is a
  durable moat.

**Reflectly** — mood-first AI-lite. (R04 §Reflectly — see also R01)
- *Steals:* [coach] mood-conditional prompt selection (the interaction
  model — mood first, prompt second, question tailored — reproducible
  with rule-based logic); [coach] pattern surfacing without asking
  (weekly graphs + correlation hints as the return value justifying the
  daily check-in: "Sundays are lower for you"); [new] widgets as streak
  guardians.
- *Anti-patterns:* lifetime-offer anchoring, countdown timers, paywalling
  features after purchase.

**Daylio** — (see Part 2 §2.2; also R04). Killer analytics: activity↔mood
correlations; goals inside journal flow; Year in Pixels.

**1 Second Everyday (1SE)** — 1-second video/day; 10M+ downloads. (R04 §1SE)
- *Steals:* [tree] **the annual mashup as year-in-review** — a 1-second/day
  auto-stitched movie is the most emotional retrospective artifact in the
  cluster (auto-compose "year in seconds" from the vlog library → Year
  Book); [M1] Smart Fill / retrospective backfill (catch up a month from
  camera roll — grace for imperfect capture without lying);
  [new] missed-day calendar visibility (holes visible = motivation
  system, combined with Finch-style no-shame messaging);
  [tree] constraint-based capture (photo-a-day mode; 1-second snippet as
  an entry type); [new] Journal + Freestyle project split (continuous
  life timeline vs event-scoped collections).

**Timehop** — the on-this-day ritual. (R04 §Timehop)
- *Steals:* [M1] **on-this-day as the daily hook** — copy the ritual
  design: one daily feed, ephemeral, streaks rewarding the review habit
  itself; [M1] **hide bad memories** — per-memory "never show this again"
  + hide-a-year (emotional-safety control, essential for grief/loss
  years); [new] 24-hour ephemerality (daily-only feed vs browsable
  archive creates urgency without notifications); [M1] **Then & Now
  comparisons** ("snap a new selfie to show off just how much your hair
  has changed") — pairs perfectly with the physique timeline.
- *Anti-patterns:* notification spam (cap at one/day), interleaved ads in
  a memory feed, product rot post-acquisition.

**Memento Database** — local, powerful, anti-Finch. (R04 §Memento DB)
- Lesson: maximum power + minimum warmth = learning curve complaints;
  upgrade banners annoy. Not a model to copy beyond local-only + export.

**Habitica** — RPG gamified habits. (R04 §Habitica)
- *Anti-steal (documented):* HP-punishment loops, pixel-art-aging UX,
  heavy onboarding (time-to-first-value 2/5), "psychologically anchors
  your identity to the system" (class choice) — performance-based
  gamification loses to care-based (4.3★ vs Finch 4.9★). Softened
  takeaways: spendable custom rewards concept; identity-anchoring as a
  retention lever (use ethically).

### 5.3 Cluster synthesis (wellness) — why check-ins feel GOOD vs naggy
1. **No punishment for absence** (Finch, Presently, 1SE): shame-free
   returns, repairable/freezable streaks, fill-in calendars instead of
   broken-chain shaming.
2. **Care-based motivation beats performance-based** (Finch, 1SE): growth
   you nurture outlasts numbers you chase.
3. **The review is the reward** (Daylio correlations, 1SE annual movie,
   Reflectly pattern graphs, Timehop's feed).
4. **Depth is optional, not required** (Moodnotes, Daylio): every entry
   model must degrade gracefully to its fastest form.
5. **Trust is the moat** (Presently, Daylio, Diarium, 1SE private-by-
   default; vs Reflectly's premium trust problem, Timehop's breach,
   Memento's export paywall).
6. **One notification per day, max.**

---

## PART 6 — CLUSTER 05: AI-FIRST JOURNALS & MEMORY
*(full depth: `research-journaling/05-ai-journals.md`)*

### 6.1 Cluster thesis
The 2024–2026 breakthrough is the **conversational AI partner**, not more
features (Rosebud, MIT 2025 Resonance RCT n=55). But PersonalOS's D004 lock
(rule-based pipeline is the product; AI optional, never required; facts-only
by default) reframes the whole cluster: **what can be recreated WITHOUT an
LLM**, and **what needs the future text opt-in gate**.

### 6.2 App profiles

**Memento (AI)** — on-device AI journal; ZERO cloud. (R05 §Memento)
- *Features:* everything on-device; speech → reminders/actions (date
  detection); speaker diarization + segment-tap playback; model-agnostic
  AI layer ("choose an LLM that fits"); periodic summaries as local
  computation.
- *Steals:* [M0] on-device-everything as the headline; [coach] reminder/
  action extraction from speech; [M0] segment-tap playback for vlogs;
  [coach] model-agnostic AI layer (matches D004 exactly); [M1] periodic
  summaries as local computation (month recap).

**Ohai** — household assistant (text/SMS, human-in-the-loop); NOT Snap's
companion (that's My AI; flagged honestly in R05). (R05 §Ohai)
- *Steals:* [coach] the morning **"briefing" home screen** ("Your Day
  Ahead" — a 10-second answer to "what does today look like");
  [coach] conflict detection with plain-language framing;
  [coach] "conversation turns into action" (extract tasks/reminders);
  [coach] human-in-the-loop escalation (low confidence → defer to
  silence).
- *Cautionary:* no-E2EE + human staff reading content — never for a
  private journal.

**Reflect (AI)** — E2E notes + native AI. (R05 §Reflect)
- *Steals:* [coach] **"AI is opt-in and per-selection, core writing stays
  yours"** — steal wholesale for the future text-access gate;
  [new] daily-note-as-default-journal + backlinks for lateral recall;
  [coach] custom saved prompts (user-editable prompt library);
  [M1] calendar-sync meeting notes (journal + schedule together);
  [coach] ship rule-based reflection by default, avoid the
  E2EE-vs-AI contradiction explicitly.

**Mem** — AI notes. (R05 §Mem — see also R02)
- *Steals:* [M0] **"related notes surface while you write" (auto-linking)**
  — the single most transferable idea; [M1] daily digest = today's
  writing + relevant older memories; [coach] grounded Q&A with citations;
  [coach] Heads Up (context before you start — maps to the Coach daily
  note on app-open).

**Notion AI** — AI inside databases. (R05 §Notion AI)
- *Steals:* [M0] the **3–5 property daily template**
  (Date/Mood/Energy/Gratitude/Tags) as the "don't overbuild" scaffold;
  [coach] **weekly-review-as-a-habit** ("name the week, one pattern, one
  carry-forward"); [M1] database-property auto-fill (AI derives structured
  fields — rule-based version: auto-tag from entry content).
- *Anti-pattern:* paywalling AI and making it required for value.

**Saner.ai** — AI notes+mail+calendar. (R05 §Saner)
- *Steals:* [coach] **context-timed nudges** ("AI reminds you at the right
  time" — vs fixed nagging); [coach] **traceability as a design
  requirement** ("can you trace it back to the source?") — mirrors the
  facts-only stamp; [coach] auto-structured tasks from a thought.
- *Anti-pattern:* identity sprawl (notes+email+calendar+planner) — stay
  single-purpose.

**Rosebud** — the AI journal companion; $6M seed 2025; $12.99/mo. (R05
§Rosebud)
- *Features:* long-term memory + cross-entry synthesis ("connects today's
  entry to one from 3 months ago"); weekly Personal Growth Insights as a
  fixed named surface; adaptive follow-up questions ("Go Deeper"); custom
  personas ("silent vault" → "best friend"); voice journaling; Ask Rosebud
  historical search; Call Mode.
- *GUI:* journal-centric, AI woven in (NOT a chat app): daily check-in
  screen; compose with AI responses after the entry; journals library
  (multiple custom journals); insights screen (weekly reports, patterns,
  goals); create-custom-journal flow.
- *Steals:* [coach] **long-term memory + cross-entry synthesis** (rule-
  based version: "a year ago you wrote about X" via retrieval);
  [coach] weekly Personal Growth Insights (maps 1:1 to the weekly
  check-in); [coach] adaptive follow-ups — ship a TEMPLATE version now
  (after saving: "last time you journaled about X, how did it go?");
  [coach] custom personas = the Coach strictness dial (supportive/
  balanced/strict).
- *CAUTIONARY (must avoid):* ToS allows training on anonymized journal
  content; long-term memory paywalled; cloud-only memory dies with the
  vendor (2025 companion graveyard: Dot shut down same-day as launch
  cohort). The strongest external argument for offline-first, user-owned,
  rule-based-by-default.

**Journey** — classic journal + AI; Odyssey AI opt-out-by-default with
per-use consent. (R05 §Journey)
- *Steals:* [new] entry via email/WhatsApp (any channel → one timeline);
  [new] Atlas location map; [M1] throwback/on-this-day as table stakes
  (validates J1); [M1] ePUB/DOCX/PDF export + print;
  [coach] **opt-out-by-default AI with per-use agree-to-terms** — a
  real-world precedent for the text-access gate.

**Apple Journal (AI angle)** — the suggestion engine, zero LLM. (R05
§Apple Journal — see also R01)
- *Steals:* [M0] **the "what to journal" suggestion engine is the biggest
  steal** — Apple proves a suggestion engine over photos/workouts/location
  works on-device with heuristics; [coach] per-data-category opt-in for
  suggestions; [coach] "skip suggestions" + "clear history" as privacy
  controls.

**Replika (companion angle)** — (R05 §Replika)
- *Steals:* [M1] editable memory as a visible first-class surface
  (facts-only version for milestone review); [M1] AI-written
  "diary-of-our-relationship" (milestone-review anniversary letter,
  rule-based version).
- *Anti-patterns, hard:* cloud-only memories, model changes that erase
  personality, companion death — the graveyard argument belongs in
  PersonalOS docs: rule-based Coach + local data survive any vendor.

### 6.3 Cluster synthesis (AI) — what to build
**Rule-based NOW (no LLM, matches D004 + facts-only default):**
- Apple-Journal-style moment suggestions on compose from the event log
  (photos taken, habit streaks, first-entry-in-days, new Life Areas) —
  the flagship no-AI feature.
- "Related entries" auto-surfacing while composing (Mem-style) via
  tags/Life Areas/date-neighbor search — pure retrieval.
- Weekly check-in + pattern alerts (Rosebud-style insights) from metadata
  (cadence, tags, mood selector, word counts) — already designed in
  `docs/CoachSystem.md`.
- Daily "briefing" on open (Ohai-style) from the event log; journal
  drought nudge; throwback + milestone-review anniversary ladder.
- Static curated reflection prompt library, categorizable + refreshable
  (Apple Reflections).
- Coach strictness modes as the "persona" dial (Rosebud personas /
  CoachSystem.md).
- Per-feature opt-in + skip/clear privacy controls (Apple), per-use
  consent for any AI (Journey Odyssey pattern).

**Behind the M2+ text opt-in gate (needs user consent + LLM/local):**
- "Ask your journal" grounded Q&A with citations (Mem/Rosebud).
- True adaptive follow-ups generated from entry content (Rosebud).
- Weekly AI narratives that quote/interpret your words — never in
  facts-only mode.
- Text-level mood/theme extraction; action-item extraction from entries.
- Model-agnostic adapter (Memento / CoachSystem.md `LLMBacked`) — user
  picks cloud, local, or off; off must be a complete product.

**Avoid (documented):** training on content (Rosebud), no-E2EE + human
readers (Ohai), cloud-only memory (2025 graveyard), chatbot "Coach AI"
(Journey), paywalling core memory (Rosebud/Mem).

---

## PART 7 — CLUSTER 06: CAPTURE-FIRST, HANDWRITING & EMERGING
*(full depth: `research-journaling/06-capture-handwriting-emerging.md`)*

### 7.1 Cluster thesis
Three gifts: **the capture-first formula** (open-to-blank, default-inbox,
redundant capture paths), **ink/audio-as-media lessons** (time-synced,
searchable), and **the innovation watch** (conversational AI partners,
auto-collected life journals, print as retention).

### 7.2 App profiles

**Drafts** — capture-first inbox; the editor IS the home screen.
(R06 §Drafts)
- *GUI:* iPhone/iPad open directly into the editor (blank page, keyboard
  ready); draft list one swipe away; Mac = floating capture window bound
  to a global hotkey over any app + three-pane main window; Apple Watch =
  dictation-first capture.
- *Steals:* [M0] **open-to-blank compose** (new entry, cursor focused,
  zero navigation); [new] **global capture hotkey / floating capture
  window** on desktop; [M0] default-inbox + flag/tag/archive triage
  (capture flat, sort later — maps to timeline + tags + Life Areas);
  [new] share sheet / import pipeline (photos, text, links from any
  source); [new] actions-as-routing (route this to X: export a day,
  append to a goal's log, send to backup).

**Twos** — "things + thoughts" quick capture; the day-page model.
(R06 §Twos)
- *Steals:* [M1] daily list / day-page as the default capture target
  (today's entry space, not a global blank page — validates the timeline
  design); [M0] type-prefix quick-entry (`#tag`, `!task`, `+photo` tokens
  parsed while typing); [new] one-tap widget capture (new entry, today's
  date preselected); [new] auto-linking / gentle suggestions (mention a
  past person/place → offer link).

**GoodNotes 6** — digital ink notebooks. (R06 §GoodNotes)
- *Steals:* [M1] search over handwriting (OCR + index — future "scan a
  paper page into an entry"); [new] ink as selectable media (drawing/
  doodle into entries as vector strokes, lasso tool); [M0]
  per-page/entry templates (lined, grid, planner blocks — entry as
  structured form or free canvas); [M0] audio connected to ink/text
  (tap a word → jump to the recorded moment).

**Notability** — ink + audio. (R06 §Notability)
- *Steals:* [M0] **audio-to-notes time-sync** — record a vlog; each typed
  line/photo gets a timestamp; playback scrubs by tapping text;
  [M0] live audio transcription with AI summary (voice journals →
  bullet takeaways; keep the raw audio — APA Nov 2025 advisory: AI is
  adjunct, not therapy); [M0] one-tap new entry, no folder ceremony;
  [new] actionable recognized content (URLs/dates/places in any entry
  become tappable actions).

**Nebo (MyScript)** — handwriting → text. (R06 §Nebo)
- *Steals:* [new] live recognition preview (interpretation shown inline
  while writing, errors caught in-flow); [M1] ink/scan → editable
  searchable text; [new] gesture-based quick editing (swipe/scratch to
  delete).

**Zettlr** — Zettelkasten desktop; academic. (R06 §Zettlr)
- *Steals:* [M0] **a true "inbox" capture rail** (un-filed jottings
  surfaced for weekly triage — aligns with batch import + quiet week);
  [M1] YAML/metadata frontmatter on export (date, tags, life-area, mood
  in a parseable header — Year Book + backup path); [new] wiki-link/
  backlink between entries (link a vlog to a goal's log); [M0]
  distraction-free compose + writing stats (streak/goal meters for word
  counts — feeds gamification); [M1] regex-capable search from day one.

**Apple Quick Note** — OS-level capture overlay. (R06 §Quick Note)
- *Steals:* [new] quick-compose overlay (floating new-entry composer
  available anywhere in the app, today's date + location + optional
  media pre-filled); [new] keyboard shortcut + assignable trigger (PWA:
  global hotkey + home-screen widget); [new] auto-attach context (capture
  from an entry/view carries that context); [M0] voice-in with on-device
  transcription as a first-class entry type.
- *Caveat:* iPadOS 26 repurposed corner swipes — OS gestures are fragile;
  don't rely on them.

**Google Keep** — (R06 §Keep; see also R03). Quick-capture widget with
input-type buttons (text/photo/voice → journal entry, today's date);
automatic OCR indexing of every attached photo; voice memo → transcribed +
auto-structured text, original audio kept; reminders on entries
("nudge me about this on X"); color/label visual language (color = life
area) even without folders.

### 7.3 Innovation watch (the genuinely new 2024–2026)

**The conversational AI partner** (Rosebud + MIT 2025 Resonance RCT):
journaling shifts from monologue to dialogue — AI reads your actual entry,
remembers prior ones, asks context-aware follow-ups. Blueprint for the
Coach; CAUTION: Rosebud's ToS training clause is a counter-example for a
private app. (R06 §10.1)

**Auto-collected life journals** (Momento social-import; Polarsteps GPS):
the strongest innovation is lowering the cost of a complete record to
zero — the journal fills in around you and you ANNOTATE rather than
author. PersonalOS lessons: (a) auto-import from the user's own camera
roll/location history into candidate entries; (b) photo-suggested grouping
by date/place ("here are today's photos — want to journal them?");
(c) visual summaries (day/month/year) as a review surface; (d) **printed/
physical output as a retention driver** — Polarsteps books (€36–150) and
Qeepsake albums prove print motivates capture (validates Year Book PDF).
(R06 §10.2)

**Capture-by-text-message / one-second-a-day / gratitude micro-patterns**
(Qeepsake SMS prompts — the app initiates, you reply; 1SE one-second
constraint + Smart Fill; 5 Minute Journal fixed morning/evening template):
all attack the HABIT, not the feature set — reduce the "what do I write"
decision. (R06 §10.3)

### 7.4 Cluster synthesis (capture-first formula)
Open-to-blank keyboard-ready (Drafts) · defer every decision to triage
(default-inbox) · redundant capture paths (widget/hotkey/share/voice) ·
capture types as discrete big buttons (Keep).

---

## PART 8 — CONVERGENCE MATRIX (evidence-backed)

What the top apps agree on — with evidence and the best practitioner:

| Dimension | Consensus | Best practitioner | PersonalOS status |
|---|---|---|---|
| On This Day / throwback | Table stakes; interactive frontier | Day One (filterable), Timehop (ritual), StoryPad (replies) | J1 planned — expand: replies, hide, ritual |
| Zero-friction capture | <2 taps / <30s; open-to-blank | Daylio, Drafts, Keep | Quick check-in candidate §11-1 |
| Auto-context enrichment | Weather/location/calendar/photo auto-attach | Day One, Diarium | Candidate §11-3 (own event log only) |
| Suggestions beat blank pages | Heuristics over your data, no LLM needed | Apple Journal, Day One Moments | Candidate §11-2 |
| Streaks as courtesy | Repair/pause/gentle return | Finch | Grace v2 candidate §11-9 |
| Media search (OCR) | Table stakes | Evernote, OneNote, Keep | J2 extension candidate §11-16 |
| Escape-hatch exports | JSON/MD/PDF/CSV/plaintext + media | Diarium, Momento, Standard Notes | J5 aligned; add frontmatter |
| Mood as first-class | 1-gesture, correlated | Daylio, Apple State of Mind | Candidate §11-4 |
| Privacy as the product | Local-first/E2E headline | Daylio, Presently, Standard Notes | Already PersonalOS's posture |
| Daily-note-as-home | The app IS today | Logseq, Craft, Capacities | Dashboard today-section seed |
| Structured prompts | Grids/templates beat blank page | Grid Diary, Stoic | Candidate §11-12 |
| Review cadence built in | Day→week→month→year rollups | Grid Diary, Momento | J5 + weekly check-in |
| Year-in-X artifacts | Pixels, mashup, printed books | Daylio, 1SE, Polarsteps | J5 + Life Tree rings |

**The white space (own it):** a TRUE interactive memory strip with media —
no app combines private journal-first daily notes + rich inline media +
memory strip + habits/goals + a rule-based Coach. (R02 synthesis, R01)

---

## PART 9 — GUI & LAYOUT PATTERN COMPENDIUM (the stealable UX)

### 9.1 Home & day surfaces
- **Daily-note-as-home** (Logseq/Roam/Capacities/Reflect/Tana/Craft): open
  → today's page, cursor ready. PersonalOS: deepen the dashboard
  today-section into a day-scope surface.
- **Suggestion wall** (Apple Journal): cards of ready-made moments with a
  prompt under each; toggleable for freeform writers.
- **Today tab** (Day One 2026): single-day dashboard — entries, on-this-
  day, moments, calendar/location/photos of the day.
- **Calendar-grid-as-home** (Presently, Pencil Journal): whole practice
  state in one month grid; keep-the-chain visual.
- **Week strip + yesterday/tomorrow paging** (RemNote, Craft widget):
  compact 7-day strip atop the day view.

### 9.2 Timeline & lists
- **Day-grouped single-column timeline** with thumbnails (Day One) — the
  PersonalOS model; differentiate with the **unified day timeline**
  interleaving manual + auto items (Momento).
- **Photo-strip entry header** (Diaro) vs **inline-in-text** (Apple
  Journal) — a deliberate pole choice (§11).
- **Card grid + color + pin** (Keep) for glanceable review.
- **Three-pane desktop** (Day One/Diarium): journal list | timeline |
  selected entry.

### 9.3 Composer patterns
- **Open-to-blank** (Drafts); **type-prefix tokens** (Twos); **capture-type
  big buttons** (Keep); **progressive deepening** (Moodnotes);
  **inline media in flowing text** (Apple Journal); **audio↔text
  time-sync** (Notability/GoodNotes); **interstitial timestamps** (Roam);
  **auto-attach context** (Quick Note); **goal ring in editor** (Ulysses).

### 9.4 Navigation & organization
- **Command palette** (Obsidian Ctrl+P); **nested inline hashtags** (Bear);
  **supertags with fields** (Tana); **portals/live windows** (RemNote);
  **smart folders = saved searches** (Apple Notes); **unlinked mentions**
  (Roam/Capacities/Obsidian); **Map/Atlas** (Diaro/Day One/Journey);
  **Year in Pixels** (Daylio).

### 9.5 Reflection surfaces
- **On-This-Day ritual** (Timehop): one daily ephemeral feed, streaks
  reward the review; **hide bad memories**; **Then & Now**;
  **weekly rollup templates** (Grid Diary/Momento); **weekly-review-as-a-
  habit** (Notion AI/Rosebud); **progress ring** (Ulysses).

### 9.6 Gamification surfaces (care-based)
- **Streak repair + pause** (Finch); **care object** (Finch birb);
  **Micropet goal-bound rewards**; **daily challenges** (Reflectly);
  **no-fail journaling**; **gentle return**.

### 9.7 Trust surfaces
- **Privacy-first onboarding** (Daylio: "we never see your data" first);
  **encryption default + daily encrypted backups** (Standard Notes);
  **recovery-phrase ritual** (Anytype); **10-year pledge** (Standard
  Notes); **no-account local-first** (Presently/Finch/Memento).

### 9.8 Mobile vs desktop discipline (from all clusters)
- Desktop = three-pane (list | content | context); mobile = bottom nav +
  capture FAB + widget paths; PWA share-target approximates OS capture;
  OS gestures are fragile (iPadOS 26 corner-swipe lesson); speed of open
  is a feature (Craft vs Notion); offline-as-architecture, not feature
  (Anytype, Reflect, PersonalOS already).

---

## PART 10 — THE MASTER STEAL-LIST (≈120 items, tagged & efforted)

> Tags: `[M0]`=extends built · `[M1]`=extends planned · `[new]`=new ·
> `[coach]` · `[tree]` · effort L/M/H at personal scale. Evidence trails
> to the report cited.

### A. Capture & compose
1. [M0/L] Two-tap quick check-in beside long-form compose — benchmark
   "under 30s, zero typing" (Daylio R01/R04).
2. [new/L] Open-to-blank compose: cursor focused, no folder ceremony
   (Drafts R06).
3. [M0/L] Quick-capture widget with input-type buttons → new entry,
   today's date (Keep R03/R06).
4. [new/M] Global capture: PWA share-target + desktop hotkey + home-screen
   widget (OneNote Win+Alt+N, Drafts, Quick Note R03/R06).
5. [new/L] Type-prefix tokens: `#tag`, `!task`, `+photo` (Twos R06).
6. [M0/M] Voice memo → transcription → entry, original audio kept (Keep,
   Reflect, Nebo R03/R05/R06).
7. [M0/M] Audio↔text time-sync in vlog capture; scrub-by-tap (Notability,
   GoodNotes R06).
8. [new/M] Share sheet / email / WhatsApp capture → appended to today's
   note (Capacities, Journey, Momento R02/R05).
9. [M0/L] Progressive deepening: mood/fact first, reflection optional
   (Moodnotes R04).
10. [new/L] Auto-attach context on capture (Quick Note R06).
11. [M0/L] Interstitial timestamps while writing (Roam R02).
12. [coach/M] Personalized follow-up questions, rule-based version
    (Reflectly, Rosebud R01/R04/R05).
13. [coach/L] Mood-conditional prompt routing (Moodnotes, Reflectly R04).
14. [coach/L] Daily challenges (draw/affirm/compliment) (Reflectly R04).
15. [new/L] Prompt library, user-editable, per Life Area with question
    frameworks (Stoic, Grid Diary, Reflect R01/R02/R04).
16. [M0/L] Inline media in flowing text vs photo-strip header — pick a
    pole (Apple Journal vs Diaro R01).
17. [new/L] Widget capture: one tap → composer with date+location
    pre-filled (Quick Note R06).
18. [tree/M] Care-object motivation: nurture → visible growth (Finch R04).

### B. Memory & resurfacing
19. [M1/L] On This Day as first-class per-area surface (Day One R01).
20. [M1/M] Interactive throwback: reply to your past self (StoryPad R01).
21. [M1/L] Hide bad memories: never-again + hide-a-year (Timehop R04).
22. [M1/L] Then & Now comparisons → physique timeline (Timehop R04).
23. [M1/M] Daily digest/briefing = today + relevant older memories (Mem,
    Ohai R02/R05).
24. [coach/M] Weekly personal growth insights, fixed named surface
    (Rosebud R05).
25. [new/M] Ephemeral on-this-day feed, streak rewards the review (Timehop
    R04).
26. [M0/M] Automatic context capture from own event log (Day One,
    Diarium R01).
27. [M1/L] Day/month/year auto-summaries (Momento R01).

### C. Search & retrieval
28. [M1/M] OCR search over attached photos (Evernote/OneNote/Keep/Bear
    R03) — effort note: PWA OCR path needed; park as future or local
    WASM.
29. [M1/L] Regex-capable search from day one (Zettlr R06).
30. [M1/L] Search filters: tag/area/date/media-type/star (Day One, Apple
    Notes smart folders R01/R03).
31. [new/M] Unlinked-mention auto-surface ("you wrote about X without
    tagging it") (Roam, Capacities, Obsidian R02).
32. [new/M] Wikilinks `[[ ]]` + backlinks pane (Obsidian R02).
33. [new/M] Backlink/live-query blocks in the day view ("on this day you
    also wrote about…") (RemNote portals, Tana R02).
34. [new/L] Command palette (Ctrl+P) universal navigation (Obsidian R02).
35. [M1/M] Properties/frontmatter as queryable layer (Obsidian R02).
36. [new/M] Atlas/map view of entries (Diaro/Day One/Journey R01/R05).

### D. Organization
37. [M0/M] Nested inline hashtags `#area/thing` as THE org system (Bear
    R03) — evaluate vs current tag UI.
38. [new/M] Supertags with fields: Life Areas carrying mood/sleep fields
    (Tana R02).
39. [new/M] Life Areas as portals/live windows, not folders (RemNote,
    Capacities, Tana R02).
40. [new/M] Relations over tags: entry → Life Area → habit (Anytype R02).
41. [M1/L] Smart folders = saved searches, AND/OR (Apple Notes R03).
42. [M1/M] Multiple journals / collections with per-journal on-this-day
    toggles (Day One R01) — evaluate vs single timeline.
43. [M1/M] Same type rendered as calendar/timeline/gallery views (Notion,
    Anytype, AFFiNE R02/R03) — physique timeline + Year Book as VIEWS.
44. [M0/L] Default-inbox + flag/tag/archive triage (Drafts, Momento R06).

### E. Reflection & review
45. [M1/M] Day→week→month→year connected rollups (Grid Diary R01).
46. [M1/L] Year in Pixels annual grid, exportable image (Daylio R04).
47. [tree/M] 1SE-style annual mashup movie from vlogs (1SE R04).
48. [M1/L] Weekly-review-as-a-habit template: "name the week, one pattern,
    one carry-forward" (Notion AI, Rosebud R05).
49. [coach/L] Morning motivation + evening insight rhythm (Stoic,
    Reflectly R01/R04).
50. [new/L] Ritual framing: morning prep / evening review (Stoic R04).
51. [coach/L] Pattern surfacing without asking ("Sundays are lower for
    you") (Reflectly, Daylio R04).
52. [M1/L] Book printing / physical artifact (Day One, Polarsteps,
    Qeepsake R01/R06).
53. [M1/L] Milestone-recall with editable memory surface, facts-only
    version (Replika R05).
54. [coach/M] "Quote your old self": transclusion of past entries (Logseq,
    Roam R02).

### F. Habits, mood & gamification (care-based)
55. [M0/M] Streak-as-courtesy: earned repair + pause (Finch R04).
56. [M0/L] Gentle return flow, no nag (Finch R04) — quiet-week aftermath.
57. [tree/M] Micropet-style goal-bound rewards (Finch R04).
58. [M0/M] Mood as first-class data + correlations (Daylio R04).
59. [M1/M] Activity↔mood correlations as Coach analytics (Daylio R04).
60. [new/L] One-entry-per-day constraint mode (Presently R04).
61. [M1/M] Smart Fill backfill from camera roll, honest (1SE R04).
62. [new/L] Calendar grid with visible holes (1SE, Presently R04).
63. [M0/L] Goal/streak progress ring in editor (Ulysses R03).
64. [coach/L] No-fail journaling: three lines, decline without recording
    (Finch R04).
65. [coach/L] Optional focus gate during reflection (Stoic R04).
66. [tree/L] Missed-day visibility + no-shame messaging (1SE + Finch R04).

### G. Privacy, trust & export
67. [M0/L] Privacy as marketing in onboarding (Daylio R01/R04).
68. [M1/M] Encrypted export archives; backup-restore as ritual (Anytype,
    Standard Notes R02/R03).
69. [M1/L] Escape-hatch exports JSON/MD/PDF/CSV/plaintext + media folders
    (Diarium, Momento R01).
70. [M1/M] Import from other apps — extends J3 (Diarium imports 8+ R01).
71. [M0/M] E2E posture for sync; encryption at rest (Standard Notes,
    Anytype R03/R02).
72. [coach/M] AI opt-in per-selection + skip/clear controls (Apple,
    Journey R05) — the text-access gate precedent.
73. [M1/L] YAML frontmatter on export (Zettlr R06).
74. [M0/L] On-device-everything headline (Memento, Presently R05/R04).

### H. Coach-specific (rule-based, no LLM)
75. [coach/M] The "what to journal" suggestion engine — zero-LLM proof
    (Apple Journal R05).
76. [coach/M] Context-timed nudges, not fixed nagging (Saner R05).
77. [coach/L] Traceability: every Coach line traces to source (Saner R05).
78. [coach/L] Human-in-the-loop escalation = defer to silence (Ohai R05).
79. [coach/M] Conflict detection in plain language (Ohai R05).
80. [coach/M] Reminder/action extraction from entries (Reflect, Saner,
    Memento R05).
81. [coach/L] 120-second minimum journal session framing (Stoic R04).
82. [coach/L] Philosophy-as-prompt-engine: cognitive moves (Stoic R04).
83. [coach/M] Model-agnostic AI layer, off by default (Memento R05) —
    matches D004.
84. [coach/M] Anti-patterns never to copy: paywall nagging, punishment
    loops, cloud-only memory, training on content (R04/R05).

### I. Life Tree feeds
85. [tree] Care-object / nurture-to-growth engine (Finch R04).
86. [tree] Year in Pixels as annual-ring visual DNA (Daylio R04).
87. [tree] Missed-day grid honesty + no-shame (1SE + Finch R04).
88. [tree] Then & Now comparisons in ring detail (Timehop R04).
89. [tree] Annual mashup artifacts (1SE R04).
90. [tree] Micropet-style goal-bound rewards → leaf bloom (Finch R04).
91. [tree] Editable memory surface, facts-only (Replika R05).
92. [tree] 10-year longevity pledge — the tree IS the Pith→Yew decade
    story (Standard Notes R03).

---

## PART 11 — GAP ANALYSIS vs PersonalOS (ranked by fit)

### 11.1 What PersonalOS has today (M0)
Compose (text+photos+vlogs w/ compression) · day-grouped timeline · tags ·
Life Areas · edit/delete with event history · inline media playback ·
offline-first · dark theme · dashboard (today + habits + capture + storage
meter) · habits with grace · coach stub · export/restore.

### 11.2 What PersonalOS has planned (M1)
J1 on-this-day strip · J2 full-text search · J3 batch import · J4 quiet
week · J5 Year Book PDF · J6 filter chips · D031 physique timeline.

### 11.3 The gaps — Tier 1 (high fit, high value, cheap)
1. **Quick two-tap check-in** (Daylio) — fast mood/one-line capture beside
   long-form; fits dashboard today-section. *Why:* friction kills
   journaling (R01/R04 convergence). *Constraint:* no XP for logging
   (Gamification.md lock); quiet-week respected.
2. **On-device journaling suggestions** (Apple Journal) — "what to
   journal" cards from OUR event log (workout today, photos today,
   N-years-ago). *Why:* zero-LLM proof, facts-only privacy-compatible,
   feeds J1 directly. *Constraint:* per-category opt-in + skip/clear;
   never reads text.
3. **Auto-context capture from own event log** (Day One/Diarium) —
   weather/location/step/camera-roll-of-day as facts-only chips.
   *Constraint:* internal data only; nothing external.
4. **Mood as first-class + correlations** (Daylio) — 1-tap mood in
   check-in; rule-based "your best days cluster around…" in stats/Coach.
   *Constraint:* rule-based only; no LLM.
5. **OCR search on attached photos** (Evernote/Keep) — extends J2 to
   image text. *Effort:* medium; PWA OCR path decision (local WASM vs
   deferred) — park as future item with a decision gate.
6. **Streak-as-courtesy + gentle return** (Finch) — repair tokens/pause
   complement grace; NO nag messaging anywhere.
7. **Interactive throwback with replies** (StoryPad) — extend J1.
8. **Hide bad memories** (Timehop) — per-memory hide + hide-a-year;
   emotional safety for J1.
9. **Then & Now compare** (Timehop) — pairs with D031.
10. **Year in Pixels mosaic** (Daylio) — J5 artifact + Life Tree ring
    visual.

### 11.4 Gaps — Tier 2 (high value, more effort)
11. **Daily-note-as-home / Today tab deepening** (Day One 2026, Logseq) —
    day-scope default with yesterday/tomorrow paging, unfinished-from-
    yesterday, on-this-day (today-section seed exists).
12. **Nested hashtags / supertag fields** (Bear, Tana) — Life Areas v2.
13. **Backlinks/wikilinks + unlinked mentions** (Obsidian/Roam/
    Capacities) — auto-suggested connections.
14. **Life Areas as portals/live views** (RemNote/Tana).
15. **Activity↔mood correlation analytics** (Daylio) — Coach feed.
16. **Prompt library user-editable + question frameworks** (Stoic/Grid
    Diary).
17. **Ephemeral on-this-day ritual with review-streak** (Timehop) — J1 as
    daily ritual.
18. **Voice memo → transcription → entry, audio kept** (Keep/Reflect).
19. **Audio↔text time-sync for vlogs** (Notability).
20. **Smart folders = saved searches** (Apple Notes) — filter chips v2
    with AND/OR.

### 11.5 Gaps — Tier 3 (deliberate pole decisions)
21. **Auto-context vs calm-by-no-integration** (Day One/Diarium vs Diaro):
    recommendation — enrich from OUR OWN event log only; keeps privacy
    AND adds value; external integrations are a hard no.
22. **Inline media in text vs photo-strip header** (Apple Journal vs
    Diaro): recommendation — inline (Apple) for prose flow, with gallery
    view as a filter (Media view like Day One).
23. **Multiple journals vs single timeline** (Day One vs Momento):
    recommendation — single timeline + Life Areas (folders-lite with
    portal views); journals add ceremony.
24. **One-entry-per-day mode** (Presently): optional constraint, off by
    default.
25. **Grid/prompt compose as optional mode** (Grid Diary): optional
    compose surface, off by default.

### 11.6 Explicit no-goes (documented, with evidence)
- LLM-chat-first journaling (Rosebud/Replika) — contradicts D004; the
  suggestion-engine pattern is ours, not chat.
- Cloud-only memory / training on content (Rosebud ToS, 2025 companion
  graveyard) — dealbreaker.
- Punishment gamification (Habitica HP) — proven worse (4.3★ vs 4.9★).
- Paywall nagging / countdown timers (Reflectly) — trust erosion.
- Social feeds (Momento-style external) — no social; auto-import stays
  relevant only as batch import.
- OCR/handwriting ink (GoodNotes/Notability) — future item only if ink is
  ever added; the audio-sync pattern transfers regardless.

---

## PART 12 — DECISION-READY CANDIDATES for TEMP-PLANNING

Each candidate: problem → evidence → proposal → constraints → open
questions. Landing section in `TEMP-PLANNING.md` noted.

**C-01 Quick Check-in (mood + one line + optional photo)** · `[M0]` · L
- *Problem:* long-form compose is high-friction; days without entries are
  the norm (Daylio's entire premise).
- *Evidence:* Daylio 2-tap (R01/R04); Moodnotes progressive deepening
  (R04); Daylio 11-screen onboarding leads with privacy (R04).
- *Proposal:* a "quick check-in" card on the dashboard today-section and
  inside Journal: one-tap mood (5 faces, customizable), one-line note,
  optional photo — saves as a real entry with a `quick` kind flag; long-
  form compose unaffected. Deepening path (3–5 taps) leads to the full
  composer (progressive deepening).
- *Constraints:* no XP for logging (Gamification.md); mood is facts-only
  data (fine); quiet week silences its nudges; isImported excluded.
- *Open:* does quick-check-in mood feed the Coach correlations (§C-04)?
  Yes — same event log.
- *Lands:* TEMP-PLANNING → Refactor/Incorporate; UIUX.md dashboard blocks.

**C-02 Journaling Suggestions (on-device, event-log-driven)** ·
`[M0]/[coach]` · M
- *Problem:* blank-page paralysis kills entries.
- *Evidence:* Apple Journal suggestion engine = zero-LLM proof (R01/R05);
  Day One Moments (R01); Mem related-entries (R02/R05).
- *Proposal:* a "Today" suggestion strip on compose: cards assembled from
  the event log — photos taken today, workout logged, habit streak
  milestones, first-entry-in-days, N-years-ago memory, new Life Area.
  Tap → entry pre-anchored. Per-category opt-in + "skip/clear" controls
  (Apple pattern).
- *Constraints:* NEVER reads text content (facts-only stamp — led
  clash #6); no AI; suggestions are derived, never stored.
- *Open:* placement (compose sheet vs dashboard strip); how many cards.
- *Lands:* TEMP-PLANNING Incorporate; CoachSystem.md (rule catalog).

**C-03 Auto-context capture (own event log only)** · `[M0]` · M
- *Problem:* entries lack richness; "type less, preserve more" promise.
- *Evidence:* Day One auto-context (R01); Diarium integrations (R01);
  Diaro's calm-pole counterpoint (R01).
- *Proposal:* optional per-entry context chips auto-attached at save:
  weather (if we ever have it — local calc), day's photos count,
  workouts logged, habits completed, location (if user allows). Stored as
  facts, rendered as chips; OFF by default.
- *Constraints:* internal data only; privacy-first; quiet week neutral.
- *Open:* weather source (offline calc vs none).
- *Lands:* TEMP-PLANNING; Database.md event log consumers.

**C-04 Mood as first-class + activity correlations** · `[M0]/[coach]` · M
- *Problem:* no mood data exists; correlations are the killer analytics
  ("your best days cluster around…").
- *Evidence:* Daylio (R01/R04); Apple State of Mind (R01); Reflectly
  pattern surfacing (R04).
- *Proposal:* mood captured in C-01 becomes a first-class event
  (mood.logged); stats + Coach compute rule-based correlations
  (habit-completion day vs mood, activity vs mood) and surface one line
  weekly ("Sundays are lower for you — pattern, not judgment").
- *Constraints:* rule-based only; no shame language; no XP.
- *Lands:* TEMP-PLANNING; CoachSystem.md rules; Gamification.md stats.

**C-05 Memory hygiene + interactive throwback (J1 extension)** · `[M1]` · M
- *Problem:* on-this-day strips can hurt (grief years, bad memories);
  passive strips under-engage.
- *Evidence:* Timehop hide-bad-memories + ephemeral ritual (R04);
  StoryPad reply-to-past-self (R01).
- *Proposal:* J1 strip gains: per-entry "never show again" + hide-a-year;
  reply-to-past-self (the reply becomes a normal entry linked to the
  original); optional review-streak (rewards checking the strip).
- *Constraints:* facts-only; one notification/day max; quiet week silences.
- *Lands:* TEMP-PLANNING J1 scope; UIUX.md.

**C-06 Then & Now selfie compare (D031 companion)** · `[M1]` · L
- *Evidence:* Timehop Then&Now (R04); D031 already planned (Roadmap M1).
- *Proposal:* inside the physique timeline, "snap a new one" pairs the
  current photo against the selected historical one (side-by-side/
  slider — already the D031 design); add a dated "compare" action.
- *Lands:* Roadmap M1 D031; MediaStorage.md.

**C-07 Life Areas v2: supertags with fields + portals** · `[new]` · M
- *Problem:* Life Areas are folder-lite tags; not queryable.
- *Evidence:* Tana supertags (R02); Capacities objects (R02); RemNote
  portals (R02); Bear nested hashtags (R03); Anytype relations (R02).
- *Proposal:* Life Areas gain optional fields (mood, energy, weight,
  custom) making them queryable ("#health mood last 30 days"); portal
  views aggregate an area's content across dates into one always-current
  view; tag-typing inline (`#area`).
- *Constraints:* no schema lock without DecisionLog; additive only.
- *Lands:* TEMP-PLANNING; Database.md; DecisionLog (new D-number).

**C-08 Wikilinks + unlinked-mention suggestions** · `[new]` · M
- *Evidence:* Obsidian/Roam/Capacities (R02).
- *Proposal:* `[[ ]]` in entries links to entries/areas; a backlinks pane
  in the entry view; auto-suggested connections ("you wrote about X 3
  times — link?") as a derived suggestion, never auto-applied.
- *Constraints:* derived-only; no text analysis without opt-in (mention
  matching on tags/areas/names is facts-safe).
- *Lands:* TEMP-PLANNING; J2 search shares the matcher.

**C-09 Gentle return + streak repair tokens (grace v2)** · `[M0]` · M
- *Evidence:* Finch earned repair + Pause + no-nag return (R04); 1SE
  Smart Fill (R04).
- *Proposal:* grace system gains: earned repair token (granted for N
  perfect weeks), pause mode (freezes streaks — distinct from quiet
  week), and a gentle-return card after gaps (no "you missed N days").
- *Constraints:* quiet week ≠ shield (J4 lock); streaks stay real;
  anti-farm gates.
- *Lands:* TEMP-PLANNING; Gamification.md grace; UIUX.md empty states.

**C-10 Year in Pixels mosaic** · `[M1]/[tree]` · L
- *Evidence:* Daylio (R01/R04); 1SE missed-day grid (R04).
- *Proposal:* annual mosaic (mood-colored days, or activity/presence
  colors) as an exportable image inside the Year Book (J5) and as the
  Life Tree's annual-ring visual layer.
- *Lands:* Roadmap J5; Life Tree design (TEMP-PLANNING main section).

**C-11 Voice-note entry type with transcription (audio kept)** · `[M0]` · M
- *Evidence:* Keep voice→text+audio (R03/R06); Reflect (R05); Notability
  transcription (R06).
- *Proposal:* beside vlog capture, a voice-note entry type: record →
  on-device transcription (decision needed: engine) → entry with audio
  kept + transcript; taps on transcript scrub the audio (time-sync).
- *Constraints:* on-device; no cloud STT without decision; raw audio kept
  (APA advisory).
- *Lands:* TEMP-PLANNING; MediaStorage.md; DecisionLog (STT engine dep).

**C-12 Prompt library, user-editable, per Life Area** · `[M0]/[coach]` · L
- *Evidence:* Stoic (R04); Grid Diary (R01); Reflect saved prompts (R05);
  Apple Reflections (R01).
- *Proposal:* curated prompt library + user-editable; prompts scoped per
  Life Area; each prompt optionally carries a question framework
  (Stoic's cognitive-move design); surfaced in compose + Coach.
- *Lands:* TEMP-PLANNING; CoachSystem.md.

**C-13 Ephemeral daily review ritual** · `[M1]` · M
- *Evidence:* Timehop (R04).
- *Proposal:* optional daily "today in your life" review surface (J1
  strip as a ritual): one feed, today's memories, review-streak; 24h
  ephemerality toggle; hide controls (C-05).
- *Lands:* UIUX.md; J1 scope.

**C-14 Context-timed nudges (Coach v2)** · `[coach]` · M
- *Evidence:* Saner (R05); Apple Journal suggestion timing (R05); Reflectly
  anti-pattern (R04).
- *Proposal:* Coach nudges fire at contextually-right moments (after a
  workout, at the day's first open, after 3 quiet days) instead of fixed
  nag times; one notification/day max; quiet week wins always.
- *Lands:* CoachSystem.md rule catalog (deferred session already).

**C-15 Life Tree emotional engine** · `[tree]` · H
- *Evidence:* Finch care-object (R04); Daylio Year-in-Pixels (R04); 1SE
  mashup (R04); Timehop comparisons (R04); Standard Notes 10-year pledge
  (R03); Rosebud weekly insights (R05).
- *Proposal:* the Life Tree (TEMP-PLANNING main section) design feeds:
  nurture→growth metaphor (rings close, branches extend, leaves bloom on
  real milestones); annual ring visual inspired by Year-in-Pixels;
  year-review opens the annual mashup movie; ring detail includes
  Then&Now compare + facts-only memory; the 10-ring Pith→Yew ladder is
  the decade story.
- *Lands:* TEMP-PLANNING LIFE TREE DESIGN SYSTEM (main goal).

---

## PART 13 — CROSS-REFERENCES: WHERE EVERYTHING LANDS

| Candidate | TEMP-PLANNING section | Docs landing | Decision needed |
|---|---|---|---|
| C-01 Quick Check-in | Incorporate list | UIUX.md (dashboard blocks); Database.md (entry kinds) | D082+ |
| C-02 Suggestions | Incorporate list | CoachSystem.md (rules); Architecture.md (event-log consumers) | D082+ |
| C-03 Auto-context | Incorporate list | Database.md (event log); UIUX.md (entry chips) | D082+ |
| C-04 Mood+collations | Incorporate list | CoachSystem.md; Gamification.md (stats) | D082+ |
| C-05 Memory hygiene | J1 scope | UIUX.md; Roadmap M1 | J1 lock extension |
| C-06 Then & Now | J1/D031 scope | MediaStorage.md; Roadmap M1 | D031 companion |
| C-07 Life Areas v2 | Refactor proposals | Database.md (schema); DecisionLog | NEW D-number + user yes |
| C-08 Wikilinks | Refactor proposals | Database.md; J2 matcher | NEW D-number |
| C-09 Grace v2 | Incorporate list | Gamification.md (grace) | NEW D-number |
| C-10 Year in Pixels | J5 scope + Life Tree | Roadmap J5; Life Tree design | J5 lock extension |
| C-11 Voice-note | Incorporate list | MediaStorage.md; DecisionLog (STT) | STT engine dep |
| C-12 Prompt library | Incorporate list | CoachSystem.md | NEW D-number |
| C-13 Daily review ritual | J1 scope | UIUX.md | J1 extension |
| C-14 Context nudges | Coach map (§3) | CoachSystem.md rule book | rule-book session |
| C-15 Life Tree engine | LIFE TREE DESIGN SYSTEM | Roadmap M9; UIUX.md | main-goal session |

**Cross-cutting locked constraints every candidate must respect:**
- No XP for trophies; zero XP for logging (Gamification.md locks).
- Anti-farm gates; isImported excluded everywhere; quiet week silences
  ALL nudges; facts-only until the M2+ text opt-in; no new dependencies
  without DecisionLog + user approval; local-first/offline never
  degraded; one notification/day max; no shame language anywhere.

---

## PART 14 — REFERENCE INDEX

### Deep-dive reports (per-app detail + inline source URLs)
| Report | Size | Apps |
|---|---|---|
| `research-journaling/01-daily-journals.md` | 56 KB | Day One, Diarium, Apple Journal, Daylio, Grid Diary, Reflectly, Diaro, Pencil Journal, Momento, StoryPad-family |
| `research-journaling/02-second-brain.md` | 72 KB | Obsidian, Logseq, Roam, RemNote, Reflect, Capacities, Mem, Tana, Anytype, AFFiNE + synthesis |
| `research-journaling/03-productivity-giants.md` | 47 KB | Notion, Evernote, OneNote, Apple Notes, Craft, Ulysses, Bear, Standard Notes, Keep + synthesis |
| `research-journaling/04-wellness-mood-habit.md` | 71 KB | Finch, Stoic, Presently, Moodnotes, Reflectly, Daylio, 1SE, Timehop, Memento DB, Habitica + synthesis |
| `research-journaling/05-ai-journals.md` | 53 KB | Memento AI, Ohai, Reflect, Mem, Notion AI, Saner, Rosebud, Journey, Apple Journal AI, Replika + synthesis |
| `research-journaling/06-capture-handwriting-emerging.md` | 59 KB | Drafts, Twos, GoodNotes, Notability, Nebo, Zettlr, Quick Note, Keep + innovation watch |

### Mobbin data (real-app UI inventories)
- `research-journaling/mobbin-screens-finch.json` (671 screens) ·
  `mobbin-screens-evernote.json` (352) · `mobbin-screens-stoic.json`
  (303) · `mobbin-<app>-apps.json` (Apple Notes, Notion, 5 Minute Journal,
  Bloom, Otter AI, Bear)
- Query helper: `research-journaling/mobbin-query.mjs`
  (`node research-journaling/mobbin-query.mjs screens|flows|apps "<query>" [platform] [limit]`)

### PersonalOS docs referenced
- `docs/UIUX.md` — nav shell, dashboard blocks, typography, PWA rules
- `docs/CoachSystem.md` — Coach architecture, strictness, data use
- `docs/Gamification.md` — XP policy, grace, achievement catalog map
- `docs/Roadmap.md` — M0–M13 milestones (J1–J6, D031, M7 gamification,
  M8 coach, M9 Life Tree)
- `docs/DecisionLog.md` — D-numbers (next: D082+); locked decisions
- `docs/MediaStorage.md` — media paths, compression, vlog rules
- `docs/Architecture.md` — event log, layer boundaries
- `docs/Database.md` — schema, repositories
- `TEMP-PLANNING.md` — generation-2 scratchpad (Refactor/Incorporate/
  Unlocks/Life-Tree sections)

---

*Research compiled Aug 2026. Prices/features as of that date; verify
current terms before build decisions. All sources cited inline in the six
deep-dive reports. Research only — no code written.*
