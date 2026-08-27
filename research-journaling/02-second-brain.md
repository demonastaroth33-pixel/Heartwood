# Second Brain & Networked-Note Apps — Research Dossier

**Project:** PersonalOS (private single-user Flutter PWA: journal + habits + goals + coach)
**Cluster:** Second brain & networked notes — Obsidian, Logseq, Roam Research, RemNote, Reflect, Capacities, Mem, Tana, Anytype, AFFiNE
**Date of research:** August 27, 2026 (all pricing/state claims reflect mid-2026 sources)
**Purpose:** Mine 10 competitor apps for journaling UX patterns, review/reflection mechanics, media handling, and "steal-worthy" features for PersonalOS.

Cross-cutting observations up front (details per app below):

- **The daily note is the universal capture surface** — every app in this cluster (except Anytype and AFFiNE, which added it late) defaults to a date-stamped note per day. Journaling is not a feature; it's the entry point.
- **Block/outliner transclusion** (reference a bullet anywhere, edits propagate) is the single most copied idea since Roam (Roam → Logseq → RemNote portals → Tana @references → Capacities block references).
- **"On this day" memory strips are rare.** Capacities has the closest analog (date-referenced timeline + calendar day view), but no app in this cluster ships a polished timehop-style memory strip — that's a genuine gap PersonalOS can own.

---

# Obsidian

Sources: skiln.co/blog/obsidian-review-2026 · aiproductivity.ai/pricing/obsidian · obsidian.md/help/plugins/daily-notes · obsidian.md/help/plugins/graph · obsibrain.com/blog/obsidian-daily-notes-documentation · obsdn.org/obsidian-guide-2026-knowledge-vault · dsebastien.net/2022-05-15-maps-of-content · github.com/mathisgauthey/obsidian-workflow-template · forum.obsidian.md/t/what-prompts-do-you-use-for-your-daily-notes-or-journal/55066 · community.obsidian.md/plugins/maps-of-content · amerpie.lol/2024/03/29/my-daily-note.html

## 1. Overview
Positioning: the default local-first knowledge management app; "the most honest piece of software" per a 3-year-daily-use reviewer (skiln.co, Apr 2026). Points at a folder ("vault") on disk; every note is a plain `.md` file you own forever. Platforms: Windows/macOS/Linux/iOS/Android, all free — core app became free for personal AND commercial use in 2025 (commercial $50/user/yr license quietly dropped). Pricing 2026: app $0; Sync add-on $4/mo (E2E, 10 GB/vault, 1-yr version history, unlimited devices — skiln) though aiproductivity.ai lists $5/mo Standard/1 GB (pricing pages disagree; both cited); Publish $8–10/mo. Ecosystem: 2,700+ community plugins, 200+ themes (skiln; other trackers claim 4,300+). Local-first by default; Sync is an optional add-on. Base is the flagship new feature (database views) that landed for everyone in 2025–26, plus a preview CLI.

## 2. Core paradigm
Pages = documents (not blocks), linked via `[[wikilinks]]`, with backlinks computed bidirectionally and a global graph view. Deliberately page/markdown-first: "Obsidian is page-first: you write documents and link them" (aisotools Logseq review). Daily Notes is a core plugin that opens/creates today's date-named file. No mandatory structure — folders, tags, properties (YAML frontmatter), links, and MOCs are all optional layers. "Bases" adds Notion-style database views natively (aiproductivity.ai). Canvas (core) provides spatial/infinite-canvas layout of linked cards. Outlining exists only via plugins (Outliner, Mindmap) — the core is a document model, which is why long-form prose is its comfort zone.

## 3. Compose model
Plain Markdown with live-preview editing (WYSIWYG-ish; source mode toggle). Typing `[[` triggers autocomplete of existing notes (creates on demand). Emphasized by reviewers: zero lock-in, notes open "instantly" even years later (skiln). Slash commands are minimal in core — the community fills in (`/` via QuickAdd/Buttons; obsibrain recommends Buttons for mobile capture). Templates: core plugin inserts `{{date}}` placeholders; Templater adds scripting (`<% tp.date.now(...) %>`). Properties pane = structured frontmatter. Reading view renders wikilinks, embeds, callouts. No native real-time multiplayer — Sync is single-user multi-device (skiln: "If two people need to edit the same note at the same time, Obsidian is the wrong tool").

## 4. Organization
Folders AND tags AND links coexist; community consensus is "link profusely, folder minimally, use properties for metadata" (github.com/Delphine-L/claude_global best-practices). MOCs (Maps of Content) — a note that primarily links to other notes, popularized by Nick Milo — serve as "folders on steroids"; many MoCs can point at one note, which folders can't (dsebastien.net). Daily-note convention: `YYYY-MM-DD` filenames, optionally auto-nested `YYYY/MMMM/YYYY-MMM-DD`, with Yesterday/Tomorrow links at top of each day for chronological navigation (obsibrain). PARA structure (Projects/Areas/Resources/Archive) is the dominant template (mathisgauthey workflow template). Queries via Dataview plugin turn the vault into a database (`LIST FROM #habit WHERE status="done"`).

## 5. Search & retrieval
Core: instant full-text search with operators (`path:`, `tag:`, `line:`), Quick Switcher (Ctrl+O fuzzy note jump), Tag pane, Backlinks pane (shows every incoming link + unlinked mentions), Outgoing links pane, and global Graph view with filters/groups/color-by-search, plus Local Graph from any note (obsidian.md/help/plugins/graph). The backlink pane is the primary retrieval surface — "the true power becomes visible in the Graph View" (obsdn.org). Advanced: community plugins (Graph Insight for 5k–50k-note vaults, Dataview queries, Smart Connections AI semantic search).

## 6. Media
All files live in the vault; attachments folder is configurable. Embed syntax `![[file]]` inlines images, PDFs (with page preview), audio (inline player), and video inline (obsidian.md/help/embedding-files). Embeds can target headings (`#heading`) and blocks (`#^block`). Canvas supports images/video/audio on an infinite board. This is the strongest *raw-file* media story in the cluster — media is just files, so it's versionable, syncable, and searchable by filename. No built-in media timeline or photo-grid views — that's a gap PersonalOS's physique-photo timeline would fill.

## 7. Review/reflection
Daily Notes core plugin: settings for date format, new-file location, and template file; ribbon icon + command palette access (obsibrain; obsidian.md/help/plugins/daily-notes). Community stack makes it a full review system: **Periodic Notes** (weekly/monthly/quarterly/yearly rollup notes), **Templater** (dynamic dates, week numbers), **Calendar** (clickable month view creating daily notes on demand), **Obsidian Journals** (auto folder tree `10 - Journal/01 - Daily/2025/08 - Aug/...` with weekly/monthly/quarterly/yearly notes and navigation blocks — github.com/souravas/obsidian-daily-note-templates), **QuickAdd** (hotkey appends timestamped entries to today's note), **Dataview** (aggregate mood/sleep/productivity correlations across days). Habit tracking inside notes is plugin territory (Habit Tracker, Period Tracker) — a forum thread shows users building daily journal prompts with Dataview ("What went well? What needs attention tomorrow?" — forum.obsidian.md/t/55066; obsibrain recommends exactly this 3-section template: Today's Focus / Tasks / Log + End-of-day review).

## 8. Habits/goals integration
No native tasks — Markdown checkboxes `- [ ]` are the substrate. **Tasks plugin** adds due dates, recurrence (auto-rollover), and completion history on top of checkboxes; Todoist sync via plugin. Goals: community plugins (Obsidian Goals), Dataview dashboards that filter `status: active` properties. The workflow-template vault demonstrates journaling + workout logging + media tracking + read-it-later all as markdown (mathisgauthey). This is fully DIY — the pattern, not the feature, is what's steal-worthy.

## 9. Privacy & export
Maximum local-first: vault is plain files; no account required; no telemetry of note content. Sync: BYO (git, Syncthing, iCloud, Dropbox) or official E2E Sync. Export = copy the folder; markdown is the interchange format (import from Notion/Evernote/Roam exists). AI only via plugins with your own API key. Learning curve is the main cost (skiln: "5 hours up front").

## 10. GUI layout
Desktop: three-pane layout — far-left ribbon (icon column: vault switcher, quick switcher, graph, daily notes, command palette), left sidebar (File explorer | Search | Favorites | Tags | Outgoing/Backlinks | Outline tabs), central editor area with draggable tabs and split panes (side-by-side notes), right sidebar (Backlinks, Outgoing links, Properties). Daily-note flow: click calendar icon in ribbon → today's note opens in editor with template content; Yesterday/Tomorrow wikilinks in the template give chronological paging. Graph view opens as a full-pane overlay with physics-based node clustering, group colors, and click-to-open notes; Local Graph appears in a corner pane. Mobile: same vault, hamburger toggles the left sidebar; daily note via a dedicated bottom-bar item; editing is full-featured but smaller panes; plugins mostly work.

## 11. Differentiators & steal-worthy features
Differentiators: plain-file durability, plugin ecosystem scale, free core. For PersonalOS, steal:
1. **Wikilink autocomplete + instant backlinks pane** — typing `[[` in a daily entry and seeing a live "mentioned in" panel is the cheapest way to give a journal a memory. Why: turns tags into first-class navigation without a tag manager.
2. **Daily-note template + Yesterday/Tomorrow links** — chronological adjacency navigation built into the day view; PersonalOS's grouped-by-date timeline should offer prev/next-day paging exactly this way.
3. **Properties (frontmatter) as a queryable layer** — Dataview-style aggregation ("mood last 30 days") without building a database UI; maps directly to PersonalOS check-in metrics.
4. **Local Graph / backlink-pane-at-a-glance** — surface *unlinked mentions* (obsdn.org argues links are structure, folders are cleanup), i.e., auto-suggest connections between journal entries that mention the same Life Area.
5. **Command palette (Ctrl+P)** as universal navigation — every action (new entry, jump to date, filter tag) reachable from one fuzzy search; proven friction-reducer (skiln).

---

# Logseq

Sources: logseq.com · aisotools.com/blog/logseq-review-2026 · toolchase.com/tool/logseq · bellingcat.gitbook.io/toolkit/more/all-tools/logseq · discuss.logseq.com/t/whats-new-with-logseq-db-may-16th-2026/35020 · discuss.logseq.com/t/whats-new-with-logseq-db-april-26-2026/34977 · aitoolpick.org/blog/logseq-review-2026 · augmentedscholars.com/tools/logseq · logseq.github.io/marketplace

## 1. Overview
Positioning: "the closest thing to Obsidian but open source" — a privacy-first, open-source knowledge base, frequently described as a local-first Roam clone (toolchase). Since 2020; runs Windows/macOS/Linux/iOS/Android. Core app free forever, open source (AGPL; source on GitHub — toolchase); the only paid option is **Logseq Sync ~$5/mo** (E2E encrypted, cross-device, funds the team); DIY sync via iCloud/Dropbox/Git/Syncthing is free. Local-first: notes stored as plain Markdown **or Org-mode** files. Popularity: strong among researchers, Zettelkasten practitioners, Roam refugees; smaller but loyal community. 2025–26 caveat: an ongoing migration to a new **database-backed engine (DB graph)** — betas add reliability, sync, and collaboration, with a markdown-projection mirror that writes a plain-md copy of every block to disk with stable IDs in comments (discuss.logseq.com May 2026). Whiteboards exist but were disabled for DB graphs in Aug 2024 and only partly restored (github.com/logseq/logseq/issues/11877).

## 2. Core paradigm
**Outliner-first**: every piece of content is a nestable "block" (bullet), not a document (aisotools). Pages exist but are just named collections of blocks. `[[wikilinks]]` connect pages; `((block refs))` reference individual blocks anywhere with live-update transclusion. The app opens to a **daily journal page** by default — "the heart of the Logseq workflow is the daily journal: the app opens to a dated page each day" (aisotools). Graph view shows the block/page network. Queries (Datalog-style) act as a lightweight database layer. Built-in flashcards/spaced repetition and PDF annotation distinguish it from Obsidian (toolchase).

## 3. Compose model
Bullet-first editor: Enter creates a new block, Tab indents, Tab-out demotes. `/` slash commands (and a command menu) insert block types: todo, code, quote, latex, diagram (Mermaid), image, video, audio, embed, PDF block, query. Markdown inside blocks is live-rendered; also supports Org-mode syntax in Org graphs. Block references `((uuid))` inline-embed content that stays in sync with the source (like Roam's). Whiteboards (tldraw-based) let blocks become cards on an infinite canvas. Keyboard-driven; the "capture-first" loop is: type in today's journal, `[[tag]]` as you go, structure emerges via backlinks (logseq.com).

## 4. Organization
Deliberately folder-free (except an assets dir for files). Organization = pages + tags (`#tag`) + **namespaces** (`parent/child` page hierarchy) + block-level queries. The journal itself is the filing system: date-stamped pages per day, queries pull tasks/flashcards across days. Queries ("show all tasks tagged #project/work not yet done") create dynamic views (aitoolpick). Plugins add kanban, calendars, and table views. This is the "bottom-up, non-hierarchical" model — the opposite of Obsidian's folder-first comfort (aitoolpick).

## 5. Search & retrieval
Global search spans blocks and pages with fuzzy matching; each page shows a **Linked References / Block References panel** (all incoming links, incl. from inside blocks). Graph view visualizes connections with filters. Queries (Datalog-ish syntax) are the power retrieval tool — dynamic saved searches embedded anywhere. Find-and-replace across the whole database via plugin (logseq.github.io marketplace). Bellingcat's toolkit notes retrieval value for timeline construction: "use the journaling feature to create event timelines" (bellingcat.gitbook.io) — directly relevant to PersonalOS's chronological timeline.

## 6. Media
Images/video/audio attach to blocks (files stored in the graph's assets folder). **PDF annotation is first-class**: upload a PDF, highlight, and highlights become referenceable blocks/notes (toolchase; augmentedscholars: "highlights made in the app become referenceable blocks"). Zotero integration for citations. Whiteboards host images/shapes/text blocks spatially. Media files are plain files on disk, so they're portable, but there's no media gallery/timeline view.

## 7. Review/reflection
The **Journal is built-in and always-on** — no plugin to enable; templates apply via the built-in Templates plugin (per-page templates with `{{date}}`, etc.). Journal page layout: date at top, then a daily plan section, scheduled items, and free bullets. Tasks (NOW/LATER/DONE) with scheduled/deadline dates roll naturally into the daily view — the app shows "Scheduled and deadlines for today" blocks. **Flashcards + spaced repetition are native** (flashcard blocks schedule themselves) — Logseq is the only journal-first tool with built-in SRS (toolchase). Plugins extend review: calendar view, daily planner, habits, periodic reviews (weekly/monthly rollup pages exist as community workflows, e.g., the "journaling" plugin and page templates on logseq.com marketplace).

## 8. Habits/goals integration
Native task workflow: `TODO/NOW/LATER/DONE` state cycling, scheduled/deadline dates, recurring via plugins; task queries aggregate across days ("task management integration: built-in task workflows... an efficient project management tool within their notes" — bellingcat). Habit tracking is plugin territory (habit-tracker, pomodoro, kanban, daily-planner plugins on marketplace). No goals module; goal tracking is done via queries over tagged blocks.

## 9. Privacy & export
Local markdown/Org files, no analytics, no account for core use; "no data is sent to Logseq's servers by default" (aitoolpick). Sync: DIY (Git/iCloud/Dropbox/Syncthing) or paid E2E Sync. DB-graph mode writes a markdown projection to disk as an escape hatch (discuss.logseq.com). Import/export subsystem supports file↔DB conversion (deepwiki.com/logseq/logseq/6-extension-and-integration). Plugin system is sandboxed JS/TS.

## 10. GUI layout
Desktop: left sidebar (nav: Journal, Graph view, All pages, Favorites, Recent; search bar top; bottom has settings/plugins) — collapsible; main area shows the daily journal (single column of blocks with indentation guides and a thin left "fold" bar to collapse/expand hierarchies); **right sidebar** opens pages/blocks side-by-side (linked references, block detail, PDF viewer) — the canonical "write while referencing" layout. Top bar: search field, command palette (`/`), graph button. Journal flow: open app → today's page is there → type bullets → `[[` autocompletes pages → `((` embeds a block → items surface later via linked-references panel or queries. Mobile: functional but less polished/slower, sync edge cases reported (aisotools). DB-graph betas also ship a CLI (discuss.logseq.com Apr 2026).

## 11. Differentiators & steal-worthy features
Differentiators: open-source local files, journal-first default, native SRS + PDF annotation. For PersonalOS:
1. **Journal-first launch: the app *is* today's page** — zero navigation between "open app" and "write in journal"; PersonalOS's home screen should BE the day view.
2. **Block references/transclusion with live sync** — quote last week's entry inline in today's entry; edits propagate. Great for reflection prompts ("a year ago you wrote…").
3. **PDF-highlight-to-note** — annotations become first-class notes; applicable to PersonalOS's Year Book PDF export and to attaching receipts/screenshots to journal entries.
4. **Datalog-style queries over blocks** — "all entries tagged #anxiety from last month" without a query-language UI; PersonalOS full-text search + filter chips could implement the visible 10% of this.
5. **Collapse/expand outliner + journal-as-timeline** — indentation-based structure within a day entry; the bellingcat case shows event-timeline construction in a journal is a real investigative pattern.

---

# Roam Research

Sources: roamresearch.com · aisotools.com/blog/roam-research-review-2026 · makerstack.co/reviews/roam-research-review · toolchase.com/tool/roam-research · roamdocs.fyi/help/journaling · nesslabs.com/roam-research-workflow-tips · nesslabs.com/notion-to-roam · 1337skills.com/cheatsheets/roam-research · sheetly.org/cheatsheets/roam-research · mind.li/explore/29660-roam-research-fundamentals-blocks-pages-and-references

## 1. Overview
The app that invented the category: launched 2019 by Conor White-Sullivan, "essentially created the modern 'tools for thought' category" (makerstack) — bidirectional links, block references, and daily notes all went mainstream here. Positioning: networked thought for researchers/academics/writers. **Cloud-hosted** graph (no local files, no offline-first — "everything lives in the cloud"; toolfinder notes no-internet = no notes). Pricing 2026: Pro $15/mo or $165/yr; Believer $500 one-time for 5 years (~$8.33/mo); 31-day free trial, no permanent free tier (makerstack, aisotools). Platforms: web app + iOS/Android apps with offline writing (toolchase); no Linux desktop; mobile apps widely panned ("Mobile experience is poor" — aitoolpick). Popularity: passionate but much smaller than 2020–21 peak; reviews call development slowed while Obsidian/Logseq/Tana absorbed its audience (toolchase, makerstack).

## 2. Core paradigm
Outliner of **blocks**; every bullet is a block with a UUID; pages are collections of blocks. **Daily notes are the default entry point** — the app opens to today's page; "capture first, organize later" (makerstack). Networked thought = `[[page references]]` (bidirectional) + `((block references))` (embed one block anywhere; edits propagate to all embeds — single source of truth, mind.li) + graph view + queries. Everything is non-hierarchical/bottom-up: "structure emerges through linking rather than upfront folder planning" (aisotools). No folders at all.

## 3. Compose model
Keyboard-first outliner: Enter = new block, Tab = indent, Shift+Tab = outdent, Alt+Up/Down = move block; `Shift+Enter` = soft line break inside a block (nesslabs). Slash `/` command menu inserts block types: `/todo`, headings, code block, LaTeX, table, embed (URL/block), date picker, kanban, pomodoro, Mermaid diagram (1337skills). Formatting: `**bold**`, `__italic__`, `^^highlight^^`, `~~strike~~`, `$$latex$$` (sheetly). Page refs `[[ ]]`, tags `#tag`, aliases, attributes (`Status:: In Progress`). Templates via `{{[[template]]}}` with date variables. `Ctrl+Shift+9` copies a block reference; `{{embed: ((uid))}}` live-embeds. Time-stamping supports interstitial journaling (`Ctrl+Shift+Enter` inserts current time — nesslabs/notion-to-roam).

## 4. Organization
No folders — pages emerge from `[[links]]` and tags; **Linked References and Unlinked References** at the bottom of every page are the implicit taxonomy (mind.li: "browsing the linked references... you uncover unexpected relationships"). Attributes (`attr:: value`) add structured metadata per block. Queries `{{[[query]]: {and: [[TODO]] [[Project]]}}}` build living lists (sheetly). The **sidebar** lets you open many pages simultaneously for cross-referencing research (nesslabs). Roam is the purest expression of "organization = backlinks"; reviewers consistently say the mental model is the product.

## 5. Search & retrieval
`Ctrl+U` fuzzy search across pages AND blocks (the "search/navigate" palette is Roam's signature interaction; also `Ctrl+K`); `Ctrl+Shift+D` jumps to today's daily notes (1337skills). Each page shows Linked References (explicit `[[ ]]`) + Unlinked References (raw mentions) — the latter is still unique-ish and powerful (nesslabs filtering tips). `{{mentions: [[Page]]}}` pulls that reference list inline into any block (nesslabs). Graph overview with filtering. Queries serve as saved searches. Weakness: performance degrades on large graphs (5k notes → laggy, 10s graph load — toolfinder via makerstack).

## 6. Media
Images, video, audio, and files drop into blocks; PDFs embed via a pdf widget; LaTeX renders natively. Files are stored in Roam's cloud (size-limited by plan). No media timeline/gallery; media is a block type, not a collection concept. Audio: voice-memo-style recording exists in mobile; reviewer sentiment: media handling is adequate but not a strength (toolchase).

## 7. Review/reflection
Daily Notes auto-created per day; daily note templates (`/template`) inject structure — the community's standard journal template includes habits checklist, gratitude, and plan sections (reddit r/RoamResearch workflow threads; roamdocs.fyi/help/journaling). **Interstitial journaling is the signature pattern**: timestamped blocks throughout the day inside the daily note (nesslabs). `{{[[TODO]]}}`/`{{[[DONE]]}}` task blocks integrate with daily notes; queries show open tasks. Templates can embed queries so each new day auto-lists "tasks from yesterday", etc. (sheetly). Weekly/monthly reviews are template+query constructions, not a built-in feature.

## 8. Habits/goals integration
Block-level tasks (`{{[[TODO]]}}`) with keyboard toggle (`Ctrl+Enter`), queries by project/date range (`{between: [[Yesterday]] [[Today]]}` — sheetly). Habit tracking = checkbox blocks in the daily template + a query aggregating them; spaced repetition via community `roam/js` scripts (e.g., Roam SRD decks for med students — 1337skills). No native goals/tasks module; roam/js lets power users build almost anything (toolchase: "Roam templates and roam/js for extensive customization").

## 9. Privacy & export
Cloud-only; NOT end-to-end encrypted (aisotools comparison table: "Roam is not E2E"); history of outages and data scares (toolchase cons). Export: JSON/EDN/Markdown export exists (used by the "notion-to-roam" style switchers). No self-hosting. For a private journal this is the worst privacy profile in the cluster — reviewers now explicitly flag it.

## 10. GUI layout
Desktop web: left sidebar (graph picker, Search, All pages, Daily notes, starred "menu" pages), main editor column (outline of blocks with indentation guides), **right sidebar** opened via `Ctrl+\` or Shift+Click on a link — pages stack there side-by-side, fully editable, for multi-page research windows (nesslabs). Bottom bar: word count/block count, help, user menu. Block-level breadcrumb shows parent context. Journaling flow: open → today's note → type; `[[` autocomplete; `((` search-and-embed; reference items in sidebar while writing; star frequently used pages into the left menu. Mobile apps: stripped-down daily-note capture, offline writing, but reviewers rate them weak (aitoolpick, toolchase).

## 11. Differentiators & steal-worthy features
Differentiators: the original block-reference engine, daily-notes-first workflow, query syntax, passionate academic base. For PersonalOS:
1. **Unlinked references** — surfacing *mentions that were never linked* ("you wrote about X 3 times without tagging it"); perfect engine for PersonalOS's planned auto-suggested tags/connections.
2. **Block-level embeds with live propagation** — re-use a line from a past entry inside today's; edit once, updates everywhere. Directly supports "quote my old self" reflection features.
3. **`{{mentions: [[page]]}}` inline panels** — embed a live backlink list *inside* a journal entry (e.g., a "work" section that always shows all past entries mentioning work).
4. **Interstitial journaling timestamps** — `Ctrl+Shift+Enter` timestamps while writing; a cheap, powerful addition to PersonalOS's entry composer.
5. **Daily-note template with embedded queries** — the daily page is pre-populated with dynamic content (overdue tasks, yesterday's open items) at creation time; PersonalOS daily view should hydrate the day with "unfinished from yesterday / on this day last year".

---

# RemNote

Sources: remnote.com · beta.remnote.com/feature/annotate-pdf · help.remnote.com/en/articles/6752031-daily-documents · help.remnote.com/en/articles/6030742-portals · help.remnote.com/en/articles/6752161-managing-tasks-with-todos · remnote.com/feature/portals · forum.remnote.io/t/portals-tags-daily-documents-and-workflow/6804 · thetoolsverse.com/tools/remnote · tldv.io/blog/remnote · techbloat.com/remnote-vs-roam-comparison.html

## 1. Overview
Positioning: "notes + flashcards + PDF annotation in one app" — a learning-first PKM used by 1M+ students (med, law, language learners; help.remnote.com). Founded ~2019 (SF); freemium: **Free** (unlimited notes & flashcards, 3 annotated PDFs, 5 image-occlusion cards, 100 AI credits/mo), **Pro $8/mo** (or $6/mo EDU annual; unlimited PDFs, exam scheduler, handwritten notes), **Pro with AI $18–20/mo** (AI flashcards/quizzes, lecture recorder, 20k AI credits) — prices per thetoolsverse/tldv; a one-time $395 Life-Long Learner tier exists (thetoolsverse). Platforms: Windows/macOS/Linux desktop, web, iOS, Android; sync + offline. Cloud-hosted (proprietary, no local-first, no E2E claims). Positioning vs Roam: same outliner DNA, but built for "measurable retention" rather than free-form thinking (techbloat comparison).

## 2. Core paradigm
Hierarchical outliner of **Rems** (units of knowledge). Every rem can become a **flashcard with spaced repetition** — "your notes and your flashcards are the same thing" (thetoolsverse). Key structural concepts: **documents** (top-level hierarchical containers) and **folders** (doc collections), **Rem References** `[[ ]]`, **tags** `#`, **portals** (live embedded views of another rem — "update your process once, see it everywhere", remnote.com/feature/portals), **daily documents** (auto date pages). Backlinks automatically computed. No graph view of note connections (navigation relies on hierarchy + portals + backlinks — techbloat). "Reference tagging" creates the web of knowledge.

## 3. Compose model
Outliner editor with rich formatting, `/` slash commands, markdown shortcuts, cloze deletion (highlight → blank → flashcard), latex, tables, code blocks, todo blocks. **Portals** are the standout: insert a portal to another rem into any document; it shows live content; edits inside portal propagate to the source; "1 hidden" button reveals nested content (help.remnote.com portals). Handwritten notes with text conversion. Keyboard-first with extensive shortcuts. Rem refs can be created by typing `[[`; quick-capture `!!` adds references into daily docs (help.remnote.com daily documents).

## 4. Organization
Documents (tree hierarchy) + folders + daily documents + tags/references/portals. The community debate (forum.remnote.io/t/6804) resolves to: daily documents for capture → then move/promote content into permanent documents; portals aggregate related rems across days; references for inline mentions. Portals are effectively **"folders-lite"** — the exact concept PersonalOS's Life Areas want. Search portals allow building a dynamic doc from search results (help.remnote.com). No graph; structure is deliberate hierarchy + live aggregation (techbloat: "RemNote's structure is more intentional").

## 5. Search & retrieval
Global search (title/content), tag browser, backlinks on every rem, **portals as retrieval** (embed a live search or a rem's content), search portals (help center: "search portals" article). Flashcards create a second retrieval axis: the review queue resurfaces content by schedule, not by search. No graph view, no full-text operators as rich as Obsidian.

## 6. Media
**PDF & slide annotation is core**: highlight, freehand draw, text, shapes/sticky notes; **one-click highlight → spaced-repetition flashcard**; AI summaries, AI chat with citations, auto-quizzes (beta.remnote.com/feature/annotate-pdf; remnote.com/blog/how-to-annotate-a-pdf). Images/videos embed in rems; handwritten notes; text-to-speech for notes and PDFs (remnote.com/feature/text-reader); audio playback on flashcards. This is the cluster's strongest learning-media story: documents as study material, not just attachments.

## 7. Review/reflection
**Daily Documents** are automatic date pages with a **week strip across the top** for jumping between days, a **Daily Doc Template button**, and pre-built sections for **goals and scratch notes** (help.remnote.com daily documents — screenshot description). Students use them for schedules, class questions, assignments → todos. The **review queue** (spaced repetition scheduler) + **Exam Scheduler** (V2 in v1.27, Jul 2026 — stork.ai) form the review system. Templates support journaling; the Daily Doc template can inject goals/habits. Daily docs double as a capture inbox: anything that "doesn't fit anywhere else" goes there, later moved into the hierarchy (help.remnote.com).

## 8. Habits/goals integration
**Todo power-up**: bullets become completable tasks with due dates; todos can be scheduled into daily docs ("Whenever you get an assignment, open or reference the daily doc, write it in and make it a to-do" — help center). Daily Doc "goals" section is native. Flashcards give a *review habit* engine. No dedicated habit-tracker or goal module; study-orientation means this axis is thinner than Tana/Capacities.

## 9. Privacy & export
Cloud sync (proprietary), no local-first, no stated E2E. Export to Markdown supported; PDFs can be downloaded annotated. Free tier caps are generous for notes but PDF/AI-gated. For a privacy-hardline journal this is a non-starter as a home, but its *patterns* (PDF→flashcards, daily doc template) transfer.

## 10. GUI layout
Desktop: left sidebar (home: documents/folders tree, collections, tags, recent; search bar top; queue/review button), center editor (outliner columns with indentation), right sidebar (backlinks, portals, rem info, related), top bar (search, settings, AI). Daily doc view: date + week strip + template sections (goals/scratch) + free bullets; todo and flashcard badges inline. Mobile: full-featured apps (typed + handwritten), offline mode, but iOS had bugs fixed only Apr 2026 (tldv). Review flow: open app → "Review" queue → flashcard or PDF-sourced cards; notes flow: daily doc capture → promote to documents via move.

## 11. Differentiators & steal-worthy features
Differentiators: unified notes+SRS, PDF→flashcard pipeline, portals. For PersonalOS:
1. **Daily Doc week strip + template button** — a compact 7-day strip atop the day view for jumping between journal days; trivial to build, high navigation value.
2. **Portals = Life Areas as live windows** — "folders-lite" that aggregate content from many days into one always-current view; PersonalOS Life Areas should be portals, not folders.
3. **Highlight/quote → review item** — one click turns any line of a past entry into a "reflect on this" item; the on-this-day strip could be fed by this.
4. **Daily Doc template with goals/scratch sections** — structure without forcing prose; maps to PersonalOS daily journal scaffolds.
5. **Cloze deletion for journal prompts** — "On [date] I felt ___" as a fill-in-the-blank reflection prompt; a lovely micro-interaction.

---

# Reflect

Sources: reflect.app · aisotools.com/blog/reflect-review-2026 · aitoolscoop.com/tool/reflect · toolradar.com/tools/reflect · otio.ai/blog/reflect-app-review · producthunt.com/posts/reflect-notes · toolify.ai/tool/reflect-ai

## 1. Overview
Positioning: "fast, encrypted, networked notes" — the polished, opinionated middle path between Roam (networked backlinks) and Apple Notes (speed), with built-in AI. Positioning line: "faster, more private alternative to Roam Research and Notion" (aisotools). Pricing: **no free tier**; Personal $10/mo annual ($120/yr) or $15/mo monthly; 14-day trial; single flat price includes all AI (aisotools, toolradar). Platforms: macOS, iOS, web (reflect.app); no Android app mentioned in sources; Chrome extension. **End-to-end encryption by default** (unique in this cluster's hosted tier), instant sync across desktop/iOS/web. Popular with professionals for meeting notes + journaling; Product Hunt reviews praise speed and minimalism, note no-folder structure and price (producthunt.com/posts/reflect-notes).

## 2. Core paradigm
Page-based (not block-outliner) networked notes: `[[backlinks]]` auto-computed, daily notes default, unlinked references, graph view. Editor is rich-text with markdown, not an outliner — "outliner editor is useful for brainstorming" is listed as a *feature* (otio), indicating page-paragraph model with occasional outline use. AI is native: **GPT-4 + Whisper** for voice transcription, summaries, outlines, action-item extraction (aisotools). Calendar integration auto-creates a daily note scaffolded with the day's meetings (Google Calendar/Outlook).

## 3. Compose model
Clean, minimal editor; markdown shortcuts; `[[` backlink autocomplete; slash menu; **voice notes transcribed via Whisper** (reflect.app; otio). AI prompts (built-in + custom) run inside notes — grammar, style, outlines, summaries; Zapier/Readwise integration; web clipper + Kindle highlights import (toolify). Daily note templates. Deliberately no plugins: "you get transcription, outlines, and summarization, not an open-ended AI agent" (aisotools). Reviewers call it "opinionated": backlink-first structure does not suit folder thinkers (producthunt summary).

## 4. Organization
No folders — links/backlinks only, plus daily notes as the spine and tags. Unlinked references surface mentions. Graph view shows the network. Calendar is the main time-axis: meeting-note capture via calendar integration removes a manual step competitors leave to users (aisotools). "Personal CRM" usage documented (people pages via backlinks — producthunt reviewer).

## 5. Search & retrieval
Instant global search ("frictionless search" — toolify); **semantic search** via AI ("find relevant information without remembering exact keywords" — Product Hunt reviewer); backlinks pane + unlinked references on every page; graph view. No query language; retrieval = search + AI chat + backlinks.

## 6. Media
Images, PDFs, links embed in notes; voice notes (transcribed audio stored); Kindle/web snippets; attachments hosted in the encrypted cloud. Media handling is functional but thin — no gallery, no timeline; not a strength (aisotools cons: web clipper "thinner than dedicated read-it-later tools").

## 7. Review/reflection
**Daily Notes** are the centerpiece: auto-created, template-able, and when calendar-integrated, pre-stocked with the day's meetings (aisotools; reflect.app). AI "daily note" summaries pull the day together; meeting notes with action-item extraction are the flagship review flow. Weekly review is user-constructed (queries/backlinks), not built-in. Voice capture makes journaling-as-you-go practical (otio).

## 8. Habits/goals integration
Checkbox tasks inside notes; AI can extract action items from meeting notes into todos; no native task manager, habit tracker, or goals module. Reminders not first-class in sources. This axis is the cluster's thinnest here — Reflect is a writing/thinking tool, not a systems tool.

## 9. Privacy & export
**E2E encryption by default** — notes encrypted on-device before sync; Reflect cannot read content (aisotools: "stronger privacy than most networked note apps, including Roam and most cloud-synced Obsidian setups"). Caveat: AI features require sending content to OpenAI — "If content needs to remain private, users should avoid using AI features" (otio). Hosted-only, no self-hosting, no local vault; export exists but reviewers call it limited (toolradar cons).

## 10. GUI layout
Desktop: three-column — left sidebar (search, daily notes list, favorites/stars, tags, calendar entry), center editor (clean white/dark, generous typography), right panel (backlinks, AI panel); bottom-left quick capture. Instant open; the app is designed for "open → type → done" in under a second (producthunt). Daily-note flow: click today in calendar/sidebar → note appears with meeting scaffolds → dictate voice note → AI transcribes → backlinks accrue on people/topics pages. Mobile: iOS app mirrors desktop; offline with instant sync-on-reconnect (aisotools).

## 11. Differentiators & steal-worthy features
Differentiators: E2E + native AI + instant sync in a polished hosted package. For PersonalOS:
1. **Calendar-scaffolded daily note** — the day's page pre-structured by the day's events; PersonalOS could scaffold by *life-area routines* instead of meetings.
2. **E2E by default** — even in a private PWA, "encrypted before it syncs" as the default posture (PersonalOS is offline-first; export encryption matters).
3. **Voice-note → transcription → entry** — Whisper-class transcription of voice journaling is table stakes for vlog-style entries; PersonalOS's long-form vlogs should reuse the pattern for audio-only entries.
4. **AI action-item extraction from entries** — "from this journal entry, what did I commit to?"; a Coach-friendly feature.
5. **Minimalism discipline** — the fastest apps in this cluster are the ones with no plugins and one opinionated layout; worth emulating in PersonalOS's single-purpose journal UI.

---

# Capacities

Sources: capacities.io · docs.capacities.io/reference/use-cases/daily-notes · docs.capacities.io/reference/dates-and-daily-notes · capacities.io/whats-new/release-8 · aisotools.com/blog/capacities-review-2026 · litmustools.com/review/capacities · toolchase.com/tool/capacities · saner.ai/blogs/capacities-review

## 1. Overview
Positioning: **object-based** PKM ("a studio for your mind") — replaces folders AND tags with typed Objects (Person, Book, Project, Meeting, custom types) with properties (capacities.io). Berlin-based (Capacities Labs GmbH), launched 2022, deliberately VC-free, ~50,000 knowledge workers, Product Hunt 4.8/198 reviews (capacities.io). Pricing: Free (unlimited spaces/objects/types, daily notes, backlinks, 5 GB media, sync; no AI/queries/calendar), **Pro $11.99/mo or $9.99/mo annual** (AI assistant, smart queries, calendar, Readwise/Kindle, API, formulas, unlimited uploads), Believer $14.99/mo (roadmap access) (litmustools, toolchase). Cloud-hosted on EU servers, GDPR, encrypted at rest; **not local-first** (litmustools: offline "✗", export markdown). Positioning: "between Notion (powerful but setup-heavy) and Obsidian/Roam (fast capture, minimal built-in structure)" (aisotools).

## 2. Core paradigm
Everything is a typed **Object** with properties and bidirectional links; queries surface objects by property. **Daily notes are the universal inbox**: "A daily note is one page per calendar day... use it for general capture" (docs.capacities.io daily notes). "Related Content" auto-scans for unlinked mentions and surfaces connections you never made — "It felt magical the first time a connection surfaced that I hadn't made consciously" (capacities.io). Graph view + collections (tag-like groups) + tags. Block references (embed a block of one object in another). Time is a first-class dimension: calendar, date properties, date links, timeline (docs.capacities.io dates).

## 3. Compose model
Rich-text block editor (no markdown syntax to memorize — capacities.io), inline slash menu, `+` to create objects from a line ("append `#{type name}` to convert inline"), `@`/`[[` linking, to-do blocks, date picker with natural language ("now", "in 1 hour"), templates per object type (docs.capacities.io daily notes). Capture integrations append straight into today's daily note: WhatsApp, Telegram (incl. voice → audio objects), email-to-note, Raycast, share sheet (docs).

## 4. Organization
**Objects instead of folders**: no folder tree, no "where does this go?" — you create/link objects as you write (capacities.io; "No more deciding which folder something belongs in"). Collections for manual grouping; tags for themes; queries (Pro: smart queries, AI) as dynamic views; tasks with context properties. Custom Journal object types for structured daily metrics ("for structured metrics over time — mood, sleep, habit scores — a custom Journal object type with date properties may fit better" — docs.capacities.io daily notes). This is the strongest "Life Areas = object types" mapping in the cluster.

## 5. Search & retrieval
Full-text search + command palette (docs reference: "Search & Command Palette"); **backlinks vs mentions** distinction (docs); **Related Content** auto-surfacing unlinked mentions (capacities.io); queries (basic free, smart/AI on Pro); Calendar as retrieval by date ("Day view incorporates all available information for that day... a timeline that visualizes everything that happened throughout the day" — docs). Graph view (capacities.io/whats-new/release-5).

## 6. Media
Files/PDFs/images attach to any object (100 MB/file Pro; 5 GB free media pool); **media analysis** (AI tagging of images — features list, docs.capacities.io); audio objects from voice messages; media embedded in blocks; Readwise/Kindle highlight import (Pro). Wall view for bookmarks. No physique-photo timeline view — but a "Photo" object type + calendar would trivially build one (pattern, not feature).

## 7. Review/reflection
Daily notes 2.0 (capacities.io/whats-new/release-8): **Week Overview** (plan/review a week, drag-drop blocks between days, move to-dos) and **Month Overview** (all daily notes at a glance, zoom via preview modal), daily note templates, dashboard mode vs page view, "created on day" info, Yesterday/Today/Tomorrow shortcuts. The docs codify a **capture → review loop**: capture daily, triage weekly ("Is this useful now? Interesting now or later?") — delete noise, turn commitments into tasks, link/create objects, tag or leave (docs.capacities.io daily notes). Calendar Day view + timeline is the closest thing in the cluster to an "on this day" memory feature (docs.capacities.io dates). No true timehop strip — gap.

## 8. Habits/goals integration
**Task management embedded in notes** (Pro): task objects with Context property (task appears on the person/project/meeting page + Tasks tab), scheduling via date (appears on calendar), deadlines, priorities (`!` `!!` `!!!` or "Prepare report !! Friday"), recurring tasks, subtasks, inbox/calendar/dashboard views, GTD tutorial (docs.capacities.io daily notes; capacities.io/product). Todoist/Things/TickTick/Apple Reminders/Google Tasks sync (capacities.io). Habit tracking via custom Journal types + queries. Strongest task-story in the cluster after Tana.

## 9. Privacy & export
Cloud (EU certified data centers), GDPR, 2FA, encrypted servers; "Export everything. Always... Full export to standard formats. No lock-in" (capacities.io) — Markdown + media export (litmustools). Not local-first, no self-host, no E2E claim. AI optional w/ your own key (litmustools: connect OpenAI/Anthropic/Mistral/Perplexity).

## 10. GUI layout
Desktop/web: left sidebar (search, Calendar entry, Daily note, spaces/collections, tags), center editor (object page with property header, blocks, to-do blocks), right panel (Backlinks | Related content | object properties | graph sidebar — screenshot on capacities.io shows "Daily note view with connected objects visible in the graph sidebar"). Calendar views: Month/Week/Three-days/Day; Day view stacks quick-create buttons, the daily note, date references, and a timeline; mini month-calendar sidebar with green dots marking days that have notes (docs.capacities.io dates). Daily flow: open app → today's note (dashboard mode shows week/month overviews) → capture via typing or input integrations → weekly review triages into objects/tasks. Mobile: iOS/Android apps (dedicated "add to daily note" jump), but reviewers note mobile is more limited than desktop (saner.ai).

## 11. Differentiators & steal-worthy features
Differentiators: objects+properties without database setup; Related Content; the capture→review doctrine. For PersonalOS:
1. **Related Content (unlinked-mention auto-surface)** — "surface places you wrote about something but never linked" (capacities.io); directly implements PersonalOS's planned filter-chips/connections.
2. **Custom Journal object types with date properties** — the documented pattern for mood/sleep/habit metrics; PersonalOS check-ins are exactly this.
3. **Week/Month overview + dashboard-mode daily note** — review cadence built into the daily-note UI; a perfect weekly-review screen for PersonalOS.
4. **Calendar Day view with timeline of the day** — everything that happened on a date (created objects, mentions, timed entries) in one scroll; near to the on-this-day memory strip, minus the "N years ago" magic.
5. **Capture integrations appending to today's note** — WhatsApp/email/voice → daily note; PersonalOS could do the same with a share-extension/PWA-push capture URL.

---

# Mem

Sources: mem.ai · makerstack.co/reviews/mem-ai-review · aisotools.com/blog/mem-review-2026 · aisotools.com/blog/mem-ai-review-2026 · blog.saner.ai/mem-ai-reviews · aiindigo.com/blog/mem-ai-review-2026 · gappsy.com/tools/mem

## 1. Overview
Positioning: the **AI-first, self-organizing notes** app — "you should never have to organize your notes" (makerstack). Founded 2017/2021, SF; backed by a16z, Founders Fund, OpenAI Startup Fund; ~$28.6M raised (makerstack, gappsy). **Mem 2.0** — a ground-up rewrite (2025–26) — fixed the 1.0 slowness and repositioned from "capture" to "recall": "a note is worthless unless it comes back to you at the right moment" (makerstack). Pricing: Free (25 notes/mo, 25 chats/mo, 25 PDF pages/mo), **Pro $12/mo** (unlimited, Deep Search, AI chat, PDF, email, API), **Proactive $99/mo** (Mem Agent: proactive briefings/reminders), Teams custom (makerstack; aisotools lists $14.99/mo annual — tiers shifted late 2025; both cited). Cloud-only, proprietary storage ("you're trusting a venture-backed startup with your second brain" — makerstack); no Android app as of 2026 (saner.ai). Free tier widely judged too small to evaluate ("most serious users hit the wall within a week" — makerstack).

## 2. Core paradigm
**No folders, no tags, no manual structure** — write into a stream; AI reads notes, auto-tags, auto-links related notes, and resurfaces them ("AI connects, tags, and resurfaces them automatically" — makerstack). Semantic retrieval is the core: Deep Search finds notes *by meaning*, and AI chat synthesizes answers from multiple notes with inline citations (aisotools). Bidirectional linking exists but is AI-discovered rather than manual (aisotools comparison). Collections (manual grouping) and shared team workspaces exist but the pitch is zero-maintenance. No graph view UI of note connections (weak for structured PKM — makerstack).

## 3. Compose model
Fast minimal editor; **Smart Templates** (meeting notes, weekly reviews, daily journals) that pull history into new notes ("Smart Write can reference all of that history when helping you write" — saner.ai); AI chat inline; Voice Mode (dictate → structured notes); Mem Chat Q&A; browser extension clipper; email-in capture. No markdown-flavored power; basic formatting only ("no highlighting, no scroll bar on long notes" — saner.ai cons).

## 4. Organization
None manual by design — "there are no folders" is the headline (aisotools). Organization = AI relationships + Collections + spaces (team). The cost: "exporting to another tool gives you raw text without the relationship graph" (aisotools); "AI connections can be noisy... occasionally unreliable tagging" (makerstack, aisotools). For a *structured* journal, Mem's model is the anti-pattern, but its retrieval UX is the benchmark.

## 5. Search & retrieval
**Deep Search** (semantic, natural-language, works on your own words, not keywords — aisotools); AI chat over the knowledge base with citations; Daily digest (AI summary of what's relevant today); proactive Mem Agent pushes content (Proactive tier). Retrieval quality reportedly improves once a few hundred notes exist; sparse vaults underperform (aisotools). No backlink panels, no graph.

## 6. Media
PDFs (limited pages/mo on free), images, web clips, links; voice notes. Media is a second-class citizen — no galleries, no PDF annotation, no inline video timeline (aisotools: "Basic image support"; Mem comparison table rates media ⚠️).

## 7. Review/reflection
**Daily digest** (AI-curated recap of notes/calendar — "Daily Mem reminders and smart suggestions" — saner.ai); templates for daily journals and weekly reviews (saner.ai: meeting notes, weekly reviews, project briefs, daily journals are the canonical template set); Mem Agent (Proactive) sends pre-meeting briefings and deadline reminders. Reflection is AI-driven, not structure-driven; there's no on-this-day or periodic-note system (that's Mem's gap).

## 8. Habits/goals integration
Not a task/habit tool: "there are no tasks, timelines, or structured databases" (aisotools teams FAQ). Mem Agent tracks "details, decisions, and open loops" and reminds (makerstack) — the closest thing to goal support. Journal templates exist, habit tracking doesn't.

## 9. Privacy & export
Cloud-only, proprietary format; offline limited (Mem 2.0 is described as "offline-first" in some sources — makerstack — but aisotools rates offline ⚠️ cloud-first; conflicting, cited as-is). Export possible but loses the AI relationship layer (aisotools). No self-host, no E2E claim. AI necessarily sees content.

## 10. GUI layout
Desktop/web: three-pane minimal UI — left sidebar (search bar, collections, templates, settings), center editor (clean prose view), **right context pane (related notes, AI chat, connections)**; command palette (⌘K). Capture flow: type or paste or clip → AI quietly links → later, Deep Search or chat retrieves. Mobile: iOS app good for capture/read, weaker for editing (aisotools); no Android. Daily flow: open app → Today/feed → type into daily note or journal template → digest each morning summarizes.

## 11. Differentiators & steal-worthy features
Differentiators: fully automated organization, semantic retrieval, agentic assistant. For PersonalOS:
1. **Deep Search (semantic, by meaning)** — "search for a concept in your own words, even if you never used those exact words" (aisotools); the right north star for PersonalOS's planned full-text search.
2. **AI daily digest** — a morning "here's what's relevant from your past" briefing; the natural engine behind the on-this-day memory strip.
3. **Smart Templates that hydrate from history** — new daily/weekly notes pre-populated with relevant past content (saner.ai); beats blank-page templates.
4. **Chat-with-notes with inline citations** — Q&A over a private journal ("what did I do about X?") with source links; Coach's memory.
5. **Zero-capture-friction posture** — remove every filing decision at write time; PersonalOS's journal should default to "everything goes to today, structure later."

---

# Tana

Sources: tana.inc · outliner.tana.inc · outliner.tana.inc/learn/tutorials/tana-systems-lab-daily-review · toolchase.com/tool/tana · aiindigo.com/tool/tana · aitoolscoop.com/tool/tana · aigregator.com/tools/tana · magpieai.store/tools/tana

## 1. Overview
Positioning: the AI-native outliner with **Supertags** — "tag any bullet with #project or #person and that bullet gains structured fields and can be queried, filtered, and displayed as a database view" (toolchase). Founded by Stian Håklev (Norway), bootstrapped, exited beta 2023 (aitoolscoop). **Important 2025–26 pivot**: the company now markets **Tana as an agentic meeting platform** ("Agents create documents, file issues, and update your context graph... during native video calls" — tana.inc), while the notes product is branded **Tana Outliner** (outliner.tana.inc) — a separate product line. Pricing (outliner): Free (500 AI credits, 3 workspaces), Plus $8/mo annual, Pro $14/mo annual; 14-day trials (toolchase, aitoolscoop). Cloud-first (weak offline: "primarily online-first with weak offline support" — toolchase); web + macOS/Windows/Linux desktop; **mobile apps listed as coming soon** (aigregator). GDPR, EU data residency, SOC2 in progress (magpieai). No E2E.

## 2. Core paradigm
Everything is a **node** in an outliner; **supertags** give nodes typed structure (fields like status/owner/due date) — "your daily notes double as structured databases" (toolchase). **Live search nodes** — dynamic queries embedded anywhere that update in real time ("A node showing 'all open tasks tagged #project/Alpha due this week' updates in real time" — aitoolscoop). **@ references** pull any node in as a mirrored live copy (edits propagate — outliner.tana.inc). Daily Notes with customizable dashboard (live searches pulling tasks/projects). AI is deeply integrated: extract structure from unstructured text (**Tana Paste**), summarize, generate (aitoolscoop). Backlinks + graph (bib-directional links; "a true graph of connected knowledge" — aitoolscoop).

## 3. Compose model
Keyboard-first outliner (Workflowy/Roam lineage): Tab/Shift+Tab nesting, collapse/zoom into nodes, `/` commands, `@` mention/reference, `#` supertag, voice input with live transcription on desktop (outliner.tana.inc), templates per supertag, **Tana Capture** (clip web/screen/voice offline, quick capture — tana.tenereteam.com). AI commands run on structured data ("summarize all action items from meetings in Q1" — aitoolscoop). The outliner is deliberately the text editor — no markdown mode.

## 4. Organization
Supertags + fields + live searches replace folders; workspaces for separation. Daily notes auto-link supertagged items. Tags exist as lightweight supertags. No file/folder tree (outliner.tana.inc). The community pattern is "systems" — templates + live-search dashboards (e.g., the Tana Systems Lab daily review tutorial: outliner.tana.inc/learn/tutorials/tana-systems-lab-daily-review).

## 5. Search & retrieval
Global search; **live search nodes** (the killer retrieval feature — embedded, always-current query results); backlinks; graph view; AI chat over workspace. Retrieval is *constructed* (you build live-search dashboards) plus *interrogative* (AI). No full-text operator language.

## 6. Media
Images/files attach to nodes; Tana Capture handles screenshots, videos, voice memos; meeting notetaker transcribes meetings into nodes with summaries (outliner.tana.inc). Media is incidental — no PDF annotation, no gallery, no inline media timeline. Mobile absent means photo-on-the-go capture is weak.

## 7. Review/reflection
**Daily Notes** = "a fresh notepad to start your day with planning, reflection or journaling," customizable as a dashboard pulling tasks for review, open projects, etc., via live searches (outliner.tana.inc). The official daily-review tutorial treats the daily note as the substrate for an AI-assisted review ("AI workflows get better with better context... what has happened across your day" — tana-systems-lab). Weekly/monthly review via templates + live searches (community norm). Voice + transcription supports interstitial capture.

## 8. Habits/goals integration
Tasks are supertagged nodes (task management, kanban-style via live searches/table views); integrations: Google Calendar, Todoist, Readwise, Zapier, Slack, GitHub, Linear, Jira, HubSpot, Zoom (aigregator); CRM-like person nodes. Habit tracking is DIY via supertags + queries. This is the cluster's most complete "notes = task database" story alongside Capacities.

## 9. Privacy & export
Cloud (EU), GDPR, no E2E; offline weak; export available; open API + MCP ("Let AI tools work directly with your knowledge" — outliner.tana.inc; magpieai rates API+MCP). Proprietary storage.

## 10. GUI layout
Desktop: left sidebar (workspaces, search, daily notes, tags, fields, inbox), center outliner column with indentation guides and **node zoom** (click a node to make it the page — outliner navigation), right sidebar (search results, node details, AI panel, calendar). Live search blocks render as tables/cards inside the outline. Daily flow: open daily note (dashboard of live searches) → capture nodes → supertag as you go → AI Paste structures messy input → live searches aggregate into projects/tasks. No mobile app yet — desktop/tablet only (aigregator).

## 11. Differentiators & steal-worthy features
Differentiators: supertags (structure without databases), live search nodes, Tana Paste AI structuring, @-mirror references. For PersonalOS:
1. **Supertags = Life Areas with fields** — a #health supertag with mood/sleep fields turns daily journal bullets into queryable check-ins; the cleanest "folders-lite + structure" concept in the cluster.
2. **Live search nodes as dashboard blocks** — embed "last 30 days of #health entries" as a live block inside the day view; PersonalOS filter chips can render as embedded query blocks.
3. **@-references (mirrored content)** — pull a Life Area's overview into today's entry as a live view; edits sync back.
4. **Tana Paste** — paste messy text (or a transcript) and AI structures it into typed nodes; ideal for importing batch journals or vlog transcripts.
5. **Daily-note-as-dashboard** — the day page pre-assembles everything relevant (open habits, unfinished entries, today's plan) at open time (outliner.tana.inc; tana-systems-lab).

---

# Anytype

Sources: anytype.io · doc.anytype.io · doc.anytype.io/anytype/data/sync-and-backup/local-only · aisotools.com/blog/anytype-review-2026 · freealternatives.to/anytype/review · toolchase.com/tool/anytype · toolradar.com/tools/anytype · recatools.com/ai-directory/anytype · creatoreconomytools.com/tool/anytype

## 1. Overview
Positioning: "the everything app for those who celebrate trust & autonomy" — a **local-first, end-to-end-encrypted, offline-first** Notion alternative (creatoreconomytools). Berlin, founded 2019, "Any Association"; client source-available ("Any Source Available License 1.0" — freealternatives calls it source-available, not OSI-open-source, though many sources say open source); based in Switzerland per freealternatives (sources conflict: Berlin vs CH — both cited as-is; the *product* runs anywhere). Platforms: Windows/macOS/Linux/iOS/Android desktop apps; **no web app** (freealternatives). Pricing: Free (unlimited local objects, E2E, 100 MB remote sync storage, 10 shared spaces), Plus $4/mo (1 GB), Pro $8/mo (10 GB), Ultra $16/mo (100 GB); paid tiers buy sync storage, not features (freealternatives, toolchase); Builder $9.99/mo alt naming (aisotools). Sync over **AnySync**, an open-source P2P protocol (doc.anytype.io); fully self-hostable sync node. Multiplayer (real-time E2E collaboration) since 2024, less polished than Notion (toolchase).

## 2. Core paradigm
**Object-based**: a note, task, person, book, or project is a typed *object* with *relations* to other objects; you assemble *sets/views* (table, kanban, calendar, list, gallery) over types "the way you would in a database" (freealternatives). Spaces = vaults. Backlinks + graph view (anytype docs; creatoreconomytools). **Local-first ≠ local-only**: "local-only means it works offline with no syncing; local-first means it works offline, syncs with end-to-end encryption across multiple devices" (doc.anytype.io). No daily-notes-first paradigm — it's a general object workspace; journaling is user-constructed via templates.

## 3. Compose model
Block-based editor with markdown shortcuts (Notion-style), slash commands, toggles, callouts, code, tables, embedded widgets; templates; no markdown *files* (freealternatives "Not included: Markdown notes"). Relations editor on every object (add relation → link to another object). No web clipper (freealternatives; though recatools notes API + MCP server now let scripts/AI create pages, tasks, bookmarks programmatically).

## 4. Organization
Spaces → objects → relations; sets/collections as query views; tags; types with property schemas; no folders (recatools: "the object-and-relation model has a real learning curve"). Graph view traverses relations. This is the closest open-source analogue to Capacities' object model.

## 5. Search & retrieval
Global search across objects ("Finder" is Anytype's local search — not detailed in sources but search exists), backlinks on objects, graph view. No semantic/AI search (AI explicitly deferred: "piping encrypted data through OpenAI would break the privacy model" — toolchase). Retrieval is structural (relations, sets, filters), not semantic.

## 6. Media
Files (images, PDFs, audio, video) attach as object files/blocks with storage quota on remote sync (local storage unlimited); media blocks embed inline. No PDF annotation, no gallery views beyond collection views of file objects. Fine for photo journaling at object level (each entry = object with image relation).

## 7. Review/reflection
No built-in daily notes (a notable absence in this cluster); journaling is template-based (a "Journal" object type with date relations is a community pattern). Review/periodic notes are DIY. This is the weakest review story of the ten apps.

## 8. Habits/goals integration
Tasks as objects (relations to projects/people, status fields) with kanban/list/calendar sets; reminders exist (recatools lists "missing formulas, reminders" among gaps — sources conflict; toolchase confirms limited reminders). Habit tracking = custom objects + sets + templates. Widget dashboard (home screen with widgets) exists on desktop for at-a-glance sets.

## 9. Privacy & export
The strongest privacy profile: E2E by default (Signal/ProtonMail model; company cannot read content), recovery phrase (lost phrase = lost data, even Anytype can't recover — toolchase), local-first, offline fully functional, P2P sync, self-hostable sync node (doc.anytype.io/anytype/data/sync-and-backup/local-only; aisotools). Export: Markdown or Protobuf per space/object — relations flatten to plain links on export (freealternatives). No E2E web access.

## 10. GUI layout
Desktop: left sidebar (spaces list, search, sets/collections, types, tags, trash), center editor (object page: title + relation header + block body), right panel (object details: relations, backlinks, properties), top bar; home dashboard with widgets. Mobile: iOS/Android apps, offline-first, but reviewers report feature lag vs desktop (recatools, toolradar cons). Journaling flow (DIY): open a Journal object → create today's entry object → attach relations (mood, photos) → view in calendar set.

## 11. Differentiators & steal-worthy features
Differentiators: E2E + offline-first + self-host + object model in one package. For PersonalOS:
1. **E2E + recovery-phrase model** — the gold standard for "private by construction"; PersonalOS (local-first PWA) should at least encrypt export archives and make backup-restore a first-class ritual.
2. **Objects + relations instead of tags** — relations (entry ↔ Life Area ↔ habit) beat string tags for structured queries; PersonalOS's Life Areas should be relations, not tags.
3. **Sets/views over types** — table/kanban/calendar views of the same type without database setup; directly reusable for PersonalOS's planned filter chips + timeline variants.
4. **P2P self-hosted sync option** — a zero-cost, no-cloud sync story; relevant if PersonalOS ever leaves the single-device PWA shell.
5. **Offline as architecture, not feature** — "works on a flight, syncs when you reconnect" (recatools use-case); PersonalOS's offline-first ambition should copy this posture exactly.

---

# AFFiNE

Sources: affine.pro · affine.pro/vs/obsidian · tolodora.com/blog/affine-review-2026 · tooliverse.ai/tools/affine · aisotools.com/blog/affine-review-2026 · freealternatives.to/affine/review · checkthat.ai/brands/affine

## 1. Overview
Positioning: open-source, local-first workspace merging **docs + whiteboard ("Edgeless") + databases + AI** in one tool — "like Notion docs and a Miro whiteboard fused" (tolodora). TOEVERYTHING PTE. LTD. (Singapore); MIT-licensed client, 70k+ GitHub stars, 200k+ Pro users, used in 100+ countries (affine.pro; tooliverse). Platforms: Windows/macOS/Linux/web + iOS/Android (mobile lags). Pricing: Free (self-host unlimited; cloud tier 10 GB, 3 members, 3 devices, 7-day version history), Pro ~$6.75–10/mo (freealternatives lists $6.75; tooliverse $6+), lifetime $499.99, AI and enterprise tiers (freealternatives, tooliverse). Local-first with optional cloud sync and self-hosting (affine.pro/vs/obsidian). Not focused on PKM/notes-graph per se — it's an all-in-one workspace; daily notes were only added in **0.12.0 (2026)** ("Daily Notes & Bookmarks: AFFiNE 0.12.0 Debut" — tooliverse).

## 2. Core paradigm
**One document, two modes**: a doc's blocks can toggle between linear **Page** mode and spatial **Edgeless** canvas mode — the same content is both a document and a whiteboard (freealternatives; aisotools: "switch instantly between a linear Page view and a spatial Edgeless canvas view for the same content"). Block-based (Notion-like); database blocks for structured data; "Linked doc" references; AI (summarize, mind-map generation); templates. No native backlinks/graph-view ecosystem (checkthat.ai positions it against Obsidian on that axis) — organization is collections + tags + databases.

## 3. Compose model
Block editor with slash commands, drag-and-drop blocks, markdown shortcuts, toggles, mind-map mode, kanban; edgeless mode places blocks as movable cards with connectors/arrows and freehand drawing (tldraw-based; "much more fluid than Miro for quick sketches" — Product Hunt review via tooliverse). Templates library. AI assistant inline (summarize docs, generate mind maps — tooliverse).

## 4. Organization
Workspaces + collections (folder-like grouping) + tags + database blocks; no notes-graph/MOC culture. Daily notes (0.12.0) land in a journal-ish area with bookmarks. Organizational gravity is visual (collections/workspaces), not networked.

## 5. Search & retrieval
Global quick search; linked-doc references; no backlink panels or graph view (versus Obsidian's graph — affine.pro/vs/obsidian). Retrieval is search + collections + database filters + AI Q&A.

## 6. Media
Images, PDFs (viewer), video embeds, and files in blocks; canvas hosts images/drawings; media is embedded as blocks. No media gallery/timeline; no physique-photo-track concept — but the Edgeless canvas is an obvious place to lay out a photo timeline spatially.

## 7. Review/reflection
Daily notes are new (0.12.0, 2026) and minimal; templates cover journals; AI can summarize; no periodic-notes system, no on-this-day, no review cadence features. Journaling is a bolt-on here, not a philosophy.

## 8. Habits/goals integration
Task blocks + database views (kanban/table) + templates + AI; habit tracking DIY. No goals module. Weakest review/habit axis of the cluster alongside Anytype.

## 9. Privacy & export
Open source (MIT client; server dir separate license — freealternatives), local-first, self-hostable (affine.pro/self-host); cloud optional; free tier generous. Export: markdown + PDF (reviewers note PDF export limited/complex — tooliverse "Export options for complex formats like PDF are currently limited"). No E2E claim for cloud sync in sources. AI sends content to third-party AI vendors when used (tooliverse FAQ).

## 10. GUI layout
Desktop: left sidebar (workspace switcher, search, collections, tags), center block editor with tabbed pages, right sidebar (AI chat, doc info), and the **mode toggle (Page ⇄ Edgeless)** at the top of each doc — the signature interaction (freealternatives). Edgeless = infinite canvas with cards, arrows, sticky notes; mind-map mode auto-lays out blocks. Daily flow (new): open Daily notes → today's page → write or sketch; canvas mode for spatial plans. Mobile apps lag: "mobile application currently lacks the full feature set... particularly for canvas editing" (tooliverse).

## 11. Differentiators & steal-worthy features
Differentiators: page↔canvas duality on the same blocks, MIT open source, self-host. For PersonalOS:
1. **Page ⇄ Edgeless duality** — the same journal content rendered as a linear timeline OR a spatial board; PersonalOS's physique-photo timeline and Year Book could be *views of the same entries*, not separate features.
2. **Block-level media on canvas** — laying photos on an infinite canvas with arrows/captions is the fastest route to a "year in review" wall (Year Book PDF export).
3. **Mind-map mode from blocks** — auto-arrange journal topics into a map; a delightful filter-chip alternative visualization.
4. **Self-host + MIT posture** — trust by construction; the PersonalOS spirit.
5. **Templates + AI summary of long docs** — the "AI summarizes your journal month" pattern (tooliverse users cite doc summarization as the top AI use).

---

# Synthesis: what to steal, ranked for PersonalOS

1. **Daily note as the app's home screen** (Logseq, Roam, Capacities, Reflect, Tana) — zero-friction entry to writing is the single most repeated winning pattern.
2. **On-this-day / day timeline** (Capacities calendar Day view + timeline; nowhere is a true timehop strip) — genuine white space; PersonalOS's memory strip has no direct competitor UX to copy, only calendar+timeline building blocks.
3. **Unlinked mentions auto-surface** (Roam, Capacities Related Content, Obsidian unlinked mentions) — powers auto-tagging and connection suggestions.
4. **Life Areas as typed objects/supertags/portals, not folders** (Capacities object types, Tana supertags, RemNote portals) — "folders-lite" with queryable fields.
5. **Live query blocks inside the day view** (Tana live searches, Dataview, RemNote search portals) — the day page hydrates itself (yesterday's open items, streak status, N-years-ago).
6. **Interstitial timestamps + capture integrations** (Roam Ctrl+Shift+Enter; Capacities WhatsApp/email → daily note) — cheap, high-value capture plumbing.
7. **Review cadence built into the product** (Capacities week/month overview + dashboard mode; RemNote week strip) — review should be a screen, not a plugin.
8. **Semantic retrieval** (Mem Deep Search) — the upgrade path for PersonalOS full-text search.
9. **E2E/export posture** (Anytype, Reflect, Obsidian) — encryption + full export as baseline guarantees.
10. **Block transclusion** (Roam, Logseq, Tana @, RemNote portals) — "quote my old self" reflection mechanics.

**Marked gaps across all ten apps** (opportunities for PersonalOS): no app combines (a) private journal-first daily notes with (b) rich inline media (photos + vlog playback) with (c) a timehop memory strip with (d) habit/goal engines and (e) a coach — the second-brain cluster is *text-first*; the journaling-with-media space is served only by photo-journaling apps outside this cluster. PersonalOS's media-rich daily notes + memory strip + review cadence would differentiate it from every app above.
