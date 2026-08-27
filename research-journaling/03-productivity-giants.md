# All-in-One & Productivity Note Giants — Research Report (2026 state)

Research for **PersonalOS** (private single-user Flutter PWA journal + habits + goals + coach). Cluster: **Notion, Evernote, Microsoft OneNote, Apple Notes, Craft, Ulysses, Bear, Standard Notes, Google Keep.** Focus: what each does that a private journal app should steal — compose, organization, search, media, review, GUI, privacy.

---

# 1. Notion

**1. Overview.** Notion (Notion Labs, San Francisco, founded 2016) is the default "all-in-one workspace": docs, wikis, databases, project management, and now AI agents in one block-based editor. Cross-platform: web, Windows, macOS, iOS, Android; freemium. Free plan = unlimited pages/blocks for a solo user; Plus $10/mo; Business $20/mo (full AI); Enterprise custom. Passed **$500M annual revenue by Sept 2025** and hit a $10B valuation in 2021 (https://www.cnbc.com/2025/09/18/notion-launches-ai-agent-as-it-crosses-500-million-in-annual-revenue.html; https://www.notion.com/pricing; https://metronome.com/pricing-index/notion). May 2025: standalone Notion AI add-on killed; AI bundled into Business tier, which split the userbase (https://saasprobe.com/insights/notion-2026-controversies). 4.8★/90K ratings on the App Store, Editors' Choice (https://apps.apple.com/us/app/notion-notes-tasks-ai/id1232780281).

**2. Core paradigm.** Pages + blocks + databases. "A block is any single piece of content… Think of your page as being made up of these building blocks" (https://www.notion.com/pricing). Pages nest inside pages without depth limit; databases (tables, boards, calendars, timelines, galleries, lists) are the structural engine — the same database renders as multiple filtered/sorted views. "You can build anything from a personal journal to a company wiki to a CRM without code" (https://clickup.com/learn/topic/productivity/tools/notion).

**3. Compose model.** Slash-command block editor (`/` opens block menu), markdown shortcuts, drag-anywhere blocks, toggles, callouts, code, embeds. Templates are a huge ecosystem (official Marketplace + community), including journaling and Quick Capture templates (https://www.notion.com/templates/easy-quick-capture). Quick capture: **Web Clipper** browser extension for Chrome/Safari/Firefox saves pages/articles to a chosen page or database (https://www.notion.com/web-clipper); Android home-screen widget (launcher-style: favorites + quick-note shortcut, no live data — https://widgetsfornotion.com/blog/notion-widgets-on-android); iOS widgets (Page / Favorites / Recents / AI shortcuts — chat, camera, voice) via the help doc (https://www.notion.com/help/mobile-widgets). iOS has no native "new note" widget; users build iOS Shortcuts ("Ask for Input" → "Create Document Without Opening") for lock-screen capture (https://www.easlo.co/blog/how-to-quick-capture-into-notion).

**4. Organization.** Left sidebar: workspace tree, Favorites, Recents, private sections; teamspaces (open/closed/private). Databases give properties, relations, rollups, filters, multiple views. Backlinks via page mentions (synced inline references). No tag system natively — tags are a text property or convention. Pinning = Favorites + sidebar.

**5. Search & retrieval.** Global quick-search (Cmd/Ctrl-P) across page text, database properties; full-text only — **no OCR on images/PDFs** (Notion can't search inside scanned images — https://smartremotegigs.com/notion-vs-evernote). Notion AI adds workspace Q&A, semantic search, AI meeting notes, database autofill (https://perplexityaimagazine.com/ai-tools/notion-ai-review-2026/). AI does not train on customer content per pricing page (https://www.notion.com/pricing).

**6. Media.** Images, video, audio files, PDFs, embeds (YouTube, Figma, Maps) as blocks; 5MB file cap on free plan, unlimited on paid (https://www.notion.com/pricing). No inline video timeline scrubbing UI beyond embeds; files are attachments, not first-class journal media. Offline mode (Aug 2025, after 6 years of requests): desktop/mobile only, first 50 database rows, one view, no embeds/AI/formulas offline (https://saasprobe.com/insights/notion-2026-controversies).

**7. Review/reflection.** No on-this-day/memories. Journaling = DIY: database with date property → calendar view; daily-notes templates; habit-tracker database templates. Community "quick capture" systems (buttons + filtered databases + callout panels) are the standard pattern (https://super.so/blog/how-to-create-quick-capture-notion).

**8. Habits/goals.** Databases with checkbox/status properties + calendar/timeline views + automations (buttons, reminders) are the canonical habit tracker; Notion Calendar (Cron) shows database deadlines. Meeting notes, forms, Notion Mail (being shut down Sept 22, 2026 — https://en.wikipedia.org/wiki/Notion_(productivity_software)).

**9. Privacy & export.** Cloud-only (local cache); encryption at rest/in transit but not E2E — Notion can read content for search/AI (https://www.atlasworkspace.ai/blog/apple-notes-alternatives). Export: Markdown/CSV/HTML/PDF per page, workspace bulk export; history 7/30/90 days by tier (https://www.notion.com/pricing).

**10. GUI layout.** Desktop: left sidebar (search, favorites, workspace tree, settings) + main canvas where a page renders blocks/database views; new page opens centered with icon/cover. Mobile: top bar with search + page menu; bottom "+" quick-add; sidebar collapsed into a hamburger menu; widgets on home screen. Database views render full-screen on mobile with horizontal scroll for table columns — a known pain; toggle sections recommended to reduce scrolling (https://locominder.com/blog/mobile-friendly-tips-for-notion-app).

**11. Differentiators & steal-worthy.**
- **Database-as-view engine**: one date-tagged store rendered as calendar/timeline/gallery — the ideal backbone for a journal with Life-Area filters and filter chips (https://clickup.com/learn/topic/productivity/tools/notion).
- **Quick-capture widget patterns**: iOS Page/Recents/AI widgets + Android launcher widget — direct model for PWA shortcut/widget capture (https://www.notion.com/help/mobile-widgets).
- **Button + callout quick-capture pages**: one-thumb capture into typed destinations (https://super.so/blog/how-to-create-quick-capture-notion).
- **Version history tiers (7/30/90 days)**: cheap versioning model a private app could outdo (unlimited, local).
- Anti-pattern to avoid: **no OCR**, unreliable offline — a journal app with media search + true offline beats Notion.

---

# 2. Evernote

**1. Overview.** The original cross-platform notes app (2008), now owned by **Bending Spoons** (acquired 2022-23) and repositioned as an AI-augmented archive. Web, Windows, macOS, iOS, Android. Pricing overhauled in 2026: Free (50 notes, 1 notebook, 20 tags, 1GB, **1 synced device**), Starter $99/yr, Advanced $249.99/yr, Enterprise custom — the steepest paid tier in note-taking, after $69→$129→$249 climbs that fueled backlash (https://productivitybrief.com/profiles/evernote-review-2026-features-pricing; https://freealternatives.to/evernote/free-plan). Bending Spoons hit $1.31B revenue/9M subscribers 2025 (https://productivitybrief.com/profiles/evernote-review-2026-features-pricing). Ratings ~4.4/5 on G2/Capterra (https://findstack.com/products/evernote/reviews).

**2. Core paradigm.** Notes in notebooks (nested since 2023), tags, Spaces (top-level containers). "Evernote organizes everything with notebooks and tags… simple, familiar, exactly how physical filing works" — the "digital filing cabinet," deliberately rigid vs Notion's Lego (https://smartremotegigs.com/notion-vs-evernote). v11 (Jan 2026) added AI Assistant, Semantic Search, AI Meeting Notes on top of that model (https://productivitybrief.com/profiles/evernote-review-2026-features-pricing).

**3. Compose model.** Freeform rich-text note editor: bold/italics, 3 heading levels, highlight, tables, code, math, horizontal dividers, inline images, to-do checkboxes, attachments, voice memo recording, sketch/drawing, PDF viewer with annotation and signature; markdown-shortcut input for speed (https://www.noteapps.ca/evernote; https://evernote.updatestar.com/). Templates library for recurring note types (meeting notes, journals, project briefs) (https://evernote.updatestar.com/). Quick capture is a legacy strength: **Web Clipper** (full page / article-with-ads-stripped / selection / screenshot, save to any notebook) (https://evernote.com/features/notes-app); mobile widgets: "Create Note," "Scan Document," "Audio Note" shortcuts, Lock-Screen widgets on iOS, keyboard already up after tap — called "the most mature widget ecosystem of any cross-platform notes app" (https://listicler.com/best/best-note-apps-ios-widgets-quick-capture).

**4. Organization.** Notebooks (hierarchical), tags (multi-tag per note), Spaces, shortcuts bar; notes can also be stacked in one notebook only (single-home constraint → tags for cross-cutting). Search can filter by notebook/tags/dates/attachments.

**5. Search & retrieval.** The killer feature: **OCR search across typed text, handwriting, images, PDFs, scanned documents** — cloud-side OCR embedded in exports too (https://en.wikipedia.org/wiki/Evernote; https://simonwillison.net/2020/Oct/16/building-evernote-sqlite-exporter). v11 adds **AI-Powered Search** (natural-language queries, direct answers) + Semantic Search (beta, Starter/Advanced) (https://productivitybrief.com/profiles/evernote-review-2026-features-pricing; https://aisotools.com/blog/evernote-review-2026).

**6. Media.** Photos, audio recordings, video files, PDFs (annotate/sign), scans via mobile camera + scanner, sketches; attachments capped (200 on free). Receipt scanning and handwriting search are the classic workflows (https://smartremotegigs.com/notion-vs-evernote).

**7. Review/reflection.** No on-this-day. Journaling = templates + a daily note habit; Home dashboard aggregates Shortcuts, recent notes, upcoming tasks, calendar, scratch pad. "Home" is Evernote's answer to daily review (https://evernote.com/features/notes-app).

**8. Habits/goals.** Built-in **Tasks** (to-dos with due dates, reminders, recurring, links to notes) — "integrated tasks help you stay on top of all your to-dos" (https://evernote.com/); tasks can live inside notes or a dedicated Tasks view. No habit tracker, no streaks.

**9. Privacy & export.** Cloud-first (server-side encrypted, not E2E; per-note passcode encryption only; employees can technically access — https://evernote.updatestar.com/). **Export: ENEX** (notebook XML bundle carrying text, attachments, tags, metadata, and OCR index); Joplin/Obsidian/Anytype/Notion all import ENEX — genuinely good escape hatch (https://freealternatives.to/evernote/free-plan; https://simonwillison.net/2020/Oct/16/building-evernote-sqlite-exporter). Offline: full offline editing + sync on reconnect.

**10. GUI layout.** Three-pane: left sidebar (Shortcuts, Notes, Notebooks, Tags, Spaces), middle note list with rich snippet cards (title, excerpt, thumbnail, date), right editor. **Home** tab = widget dashboard (scratch pad, shortcuts, recent notes, upcoming reminders, calendar). Mobile: bottom quick-capture bar (new text note, camera/scan, audio, checklist) — the capture-first affordance; iOS widgets on lock screen/home (https://listicler.com/best/best-note-apps-ios-widgets-quick-capture; https://evernote.com/features/notes-app).

**11. Differentiators & steal-worthy.**
- **OCR search over images/PDFs/handwriting** — the #1 media-search capability a media-heavy journal needs (https://smartremotegigs.com/notion-vs-evernote).
- **Home dashboard pattern**: pinned shortcuts + recent + scratch pad + calendar in one surface = a ready-made "today review" screen (https://evernote.com/features/notes-app).
- **Mobile bottom quick-capture bar** (text/camera/audio/checklist) — four-tap capture, directly transferable to a journal app (https://evernote.com/features/notes-app).
- **Web Clipper with ad-stripping article mode** — worth stealing for batch import/on-this-day enrichment.
- **ENEX export discipline**: every competitor ships an importer; being the app with a *clean escape hatch* builds trust (https://freealternatives.to/evernote/free-plan).
- Cautionary tale: paywalling basics (50-note free tier) destroyed goodwill — free-tier generosity matters for a personal tool.

---

# 3. Microsoft OneNote

**1. Overview.** Microsoft's free-form digital notebook; free with a Microsoft account (5GB OneDrive), bundled with Microsoft 365 ($6.99-10/mo tiers, 1TB). Windows, Mac, iOS, Android, web — no Linux; not for free on Windows 10 legacy app (retired, replaced by the new OneNote app). Huge education/enterprise install base; ~4.6/5 aggregate from ~3,800 G2/Capterra reviews (https://toolradar.com/tools/onenote; https://productivitybrief.com/profiles/microsoft-onenote-2026).

**2. Core paradigm.** Notebooks → Sections (with section groups) → Pages; the page itself is a **freeform canvas** — "click or tap anywhere, add text containers, draw, insert images, attach files, clip web content" (https://productivitybrief.com/profiles/microsoft-onenote-2026). "A digital desk," not a word processor; layout freedom beats structure. The hierarchy is understandable but becomes a filing cabinet nobody cleans (ibid.).

**3. Compose model.** Freeform: type anywhere, text containers, tables (merge/split), tags (custom labels incl. To Do), ink, images, audio/video recording, embedded files, page templates, screen clipping, dictation; **ink-to-text/shape and math**, ink replay (M365), audio-text sync. 2026 additions: image crop, Copilot Chat, multi-language proofing, sensitivity labels, enhanced pen styles (https://www.hubsite365.com/en-ww/crm-pages/7-new-features-in-microsoft-onenote-for-2026.htm). Quick capture: **Win+Alt+N** floating Quick Note from anywhere (or system tray icon, pen back-click), auto-saved to Quick Notes section (https://support.microsoft.com/en-us/onenote/onenote-help-and-learning/create-quick-notes; https://techcommunity.microsoft.com/discussions/microsoft365insider/enhanced-note-taking-experience-in-quick-note/3788243). Web Clipper (Edge/Chrome): Full Page, Region, Article (editable text+images), PDF page-range, YouTube; pick destination notebook/section (https://support.microsoft.com/en-us/OneNote/getting-started-with-the-onenote-web-clipper).

**4. Organization.** Notebooks/sections/subpages/section groups; page sorting by name/created/modified; **vertical tabs** mode; recent notes; search across notebooks. Links between pages/sections/notebooks for cross-reference; tags (incl. custom tag definitions with search by tag). No databases, no backlinks graph, no smart folders.

**5. Search & retrieval.** Full-text across notebooks; **handwriting recognition + OCR** on images and PDFs are first-class — the differentiator vs Notion/Obsidian (https://productivitybrief.com/profiles/microsoft-onenote-2026). Search can target audio (spoken words in recordings) per Microsoft docs (https://www.cloudwards.net/onenote-review/). Copilot (paid M365 Copilot) summarizes, extracts tasks, rewrites; on Mac/iPad context limited to the current page (https://productivitybrief.com/profiles/microsoft-onenote-2026).

**6. Media.** Photos, **audio and video recording inline with playback**, embed online videos, attach files, Microsoft Lens camera capture on Android with OCR, whiteboard photos searchable via OCR; ink sticks to images/PDFs for annotation (https://www.cloudwards.net/onenote-review/; https://maketecheasier.com/capture-information-onenote).

**7. Review/reflection.** No on-this-day, no daily-note system built in; meeting notes land via Outlook/Teams integration; templates exist for journals/planners but nothing reflective natively.

**8. Habits/goals.** To Do tags + Outlook task sync; no habit tracker; reminders via Outlook integration. OneNote is a capture/ink tool, not a goal engine.

**9. Privacy & export.** Microsoft cloud (OneDrive); E2E only for password-protected *sections* (not whole notebooks, not pages; search excludes locked sections) (https://www.cloudwards.net/onenote-review/; https://litmustools.com/review/onenote/). Export limited: PDF, .one package — a known lock-in weakness (https://litmustools.com/review/onenote/). Offline: full offline create/edit, sync on reconnect (https://productivitybrief.com/profiles/microsoft-onenote-2026).

**10. GUI layout.** Desktop: left notebook navigation pane + section tabs across the top + page list rail on the right + canvas center; collapsible panes; docked-to-side mode; vertical tabs alternative. Mobile: simplified list + bottom quick-capture bar with camera/Lens, dictation; the UI "looks and behaves differently across Windows, Mac, mobile and web" — a recurring complaint (https://litmustools.com/review/onenote/; https://www.cloudwards.net/onenote-review/).

**11. Differentiators & steal-worthy.**
- **Freeform canvas / click-anywhere composition** — the anti-fear-of-blank-page model for visual journaling and annotated photo timelines (https://productivitybrief.com/profiles/microsoft-onenote-2026).
- **Win+Alt+N system-wide Quick Note** — OS-level capture from anywhere, saved into a designated section; the best "never lose a thought" pattern on desktop (https://support.microsoft.com/en-us/onenote/onenote-help-and-learning/create-quick-notes).
- **Audio recording synced with text/ink, searchable spoken words** — directly relevant to PersonalOS long-form vlogs (https://www.cloudwards.net/onenote-review/).
- **Handwriting OCR + image OCR search** — another validation that media search is table stakes (https://productivitybrief.com/profiles/microsoft-onenote-2026).
- **Screen clipping → OCR "Copy Text from Picture"** — a cheap way to make photo-first journaling searchable (https://maketecheasier.com/capture-information-onenote).

---

# 4. Apple Notes

**1. Overview.** Apple's free, pre-installed, iCloud-synced notes app (iPhone/iPad/Mac/iCloud.com only). Effectively $0 plus iCloud storage (5GB free; $0.99/50GB; $2.99/200GB; $9.99/2TB) (https://www.atlasworkspace.ai/blog/bear-vs-apple-notes). The default capture app for hundreds of millions of Apple users; speed benchmark: cold-start capture under ~1s, beating Notion (3-5s) and Obsidian (2-4s) (https://productivitybrief.com/profiles/google-keep-tool-profile). Described as "brilliant software… a room with four walls: platform wall, format wall (no Markdown/export), structure wall, search wall" (https://storyflow.so/blog/best-apple-notes-alternatives-2026).

**2. Core paradigm.** Rich-text notes (not blocks, not markdown) in folders; documents-in-a-folder model that "fights the writing people actually want to do" (journaling, zettelkasten, logs) (https://www.notetimeapp.com/blog/apple-notes-alternatives). What it lacks in structure it makes up in instant capture and system integration.

**3. Compose model.** Freeform rich text: headings, lists, checklists (interactive), tables, inline images, sketches/ink, audio recordings, document scans, attachments; **Math Notes** (calculator/unit conversion/graphing in-note); mention (@), **>> note links** (backlinked automatically, rename-safe); Lock note. Templates via community/Shortcuts (iOS 18 "Notes templates" from Apple). Quick capture is best-in-class: **Quick Notes** from Control Center, share sheet, iPad bottom-right corner swipe, Apple Pencil lock-screen tap, Fn+Q (https://paperlike.com/blogs/paperlikers-insights/apple-notes-review; https://thesweetsetup.com/the-ultimate-guide-to-apple-notes). Widgets: pinned note/folder on home screen; share-sheet capture into Notes from any app (https://geeky-gadgets.com/apple-notes-features-2026).

**4. Organization.** Folders (nested up to ~5 levels), **tags (#hashtag anywhere in note, incl. drawings)**, **Smart Folders** = saved tag/filter queries with 11 filter types (Tags, Created, Edited, Shared, Mentions, Checklists, Attachments, Folders, Quick Notes, Pinned, Locked) combinable with AND/OR (https://support.apple.com/guide/iphone/use-smart-folders-iphc43adabc2/ios; https://iapplist.com/apple-notes-for-students). Pinned notes; "Recently Deleted"; sorting by date/edited. No databases.

**5. Search & retrieval.** Full-text + **OCR of handwriting, images, attachments** (on-device); smart folders as de-facto saved searches; no advanced syntax, no saved cross-note queries beyond smart folders (https://geeky-gadgets.com/apple-notes-smart-folders; https://toolfinder.com/alternatives/apple-notes). Apple Intelligence adds limited writing tools, not whole-library Q&A (https://storyflow.so/blog/best-apple-notes-alternatives-2026).

**6. Media.** Photos, video, audio, scans (built-in document scanner), drawings/ink (Apple Pencil), map links; media-rich note view; markup on attachments. iCloud sync of all of it.

**7. Review/reflection.** No on-this-day. Note-linking enables DIY "hub note" dashboards (pinned, with >> links) as a review surface (https://iapplist.com/apple-notes-for-students). Apple's actual reflection product is the separate **Journal app** (streaks, writing prompts, widgets, smart scheduling notifications) — evidence Apple sees journaling as a distinct surface from Notes (https://support.apple.com/guide/iphone/build-a-journaling-habit-iph70107aec2/ios).

**8. Habits/goals.** Checklists + Reminders integration; no habit tracking. People do run whole task systems in Notes via pinned checklists and smart folders (https://thesweetsetup.com/the-ultimate-guide-to-apple-notes).

**9. Privacy & export.** iCloud sync; locked notes E2E (device passcode); Advanced Data Protection extends E2E to most iCloud (https://www.atlasworkspace.ai/blog/apple-notes-alternatives). **Export is the weak wall**: no bulk export; per-note PDF (multipage PDFs lose pages), RTFD via drag-drop; third-party exporters need Full Disk Access with ~95% fidelity to HTML/Markdown (https://www.localchat.app/blog/apple-notes-export). Offline: yes, local storage + sync.

**10. GUI layout.** iPhone: folder list → note list (with search, sort, gallery/board view toggle) → note editor with bottom toolbar (delete, share, checklist, table, camera, scan, draw, lock); long-press actions; Quick Note via share sheet/Control Center. iPad: sidebar + list + editor with Pencil tools. Mac: three-pane sidebar (folders/tags), note list with snippet previews, editor; smart folder in sidebar. Widgets: pinned note/folder, plus Journal widget. Folders in Notification Center/desktop pinning on Mac (https://www.cloudwards.net/note-taking-apps-for-mac; https://paperlike.com/blogs/paperlikers-insights/apple-notes-review).

**11. Differentiators & steal-worthy.**
- **Smart Folders as saved searches** (tag/date/attachment/checkbox filters, AND/OR) — the exact pattern for PersonalOS "filter chips" and quiet-week queries (https://support.apple.com/guide/iphone/use-smart-folders-iphc43adabc2/ios).
- **Tags typed anywhere + auto-color** — zero-friction tagging vs tag-picker UIs (https://support.apple.com/en-us/102288).
- **>> link-to-note with auto-updating backlinks** — simple, discoverable linking for a "Life Areas" wiki (https://iapplist.com/apple-notes-for-students).
- **Quick Note as an OS surface** (share sheet, lock screen, corner swipe) — system-level capture a PWA can approximate with share-target API.
- **Interactive checklists synced across devices** — a habit-entry building block.

---

# 5. Craft

**1. Overview.** Craft (craft.do, German team) — "beautiful documents" app, Mac App of the Year 2021, Apple Design Award finalist; native Mac/iPad/iPhone + Windows + web; offline-first with sub-second sync ("native apps, not Electron") (https://www.craft.do/download; https://www.craft.do/compare/notion). Freemium: Free (1,500 blocks, 1GB), Plus ~$4.80-7.99/mo (AI included), Family/Team tiers (https://aisotools.com/blog/craft-review-2026; https://www.atlasworkspace.ai/blog/notion-vs-craft). 1M+ installs. Positioning: "Notion is an operating system for teams; Craft is a writing instrument for individuals" (https://www.atlasworkspace.ai/blog/notion-vs-craft).

**2. Core paradigm.** Block-based rich documents (like Notion's editor, not its databases) with pages, folders, spaces, tags, collections; **no relational databases** — collections are basic. Documents are beautiful by default; "polished solo output inside the Apple ecosystem" is the core loop (https://www.fahimai.com/notion-vs-craft).

**3. Compose model.** Slash commands + markdown shortcuts; drag-and-drop blocks; tables; nested pages; whiteboards; templates (community marketplace); **Daily Notes** (a true daily-note surface with yesterday/today/tomorrow); AI assistant (Core/Fast/Max models, metered credits — 15/mo free, 50/mo Plus) with MCP connections to Claude/ChatGPT (https://aisotools.com/blog/craft-review-2026). Quick capture: home/lock-screen **widgets** — Quick Open (any doc or **Daily Note with Yesterday/Today/Tomorrow date-switching**), Recent Documents (search + new-doc actions on medium+), Tasks widget (Inbox/Today/Document with + and inline complete), Lock Screen shortcuts (open Craft, create task, create doc, open today's daily note) (https://support.craft.do/en/integrate/widgets). Apple Shortcuts integration; share-sheet capture.

**4. Organization.** Spaces (top-level workspaces) → folders → documents; tags; collections (basic DB); backlinks on linked documents; favorites; search. Export: Markdown (lossless), TextBundle, PDF; import from Notion (databases flatten to list pages) (https://www.atlasworkspace.ai/blog/notion-vs-craft).

**5. Search & retrieval.** Full-text quick search (Cmd-K); **no OCR on images/PDFs**; AI can answer over documents within the AI Assistant. Search is not Craft's headline — writing and layout are.

**6. Media.** Images/video/audio embed inline; file attachments; PDF preview. Storage: 1GB free, unlimited Plus; 25MB media upload cap free.

**7. Review/reflection.** **Daily Notes** are the flagship reflective feature — a typed daily page; Quick Open widget keeps Today one tap away; the macOS app opens into today's note (https://www.atlasworkspace.ai/blog/notion-vs-craft; https://support.craft.do/en/integrate/widgets). No on-this-day.

**8. Habits/goals.** Embedded **Tasks** (in-document task lists, Inbox, Today view, calendar integration); no habit streaks/goals engine.

**9. Privacy & export.** E2E encryption claimed on sync; local-first storage; GDPR/SOC2-compliant infrastructure (https://www.fahimai.com/notion-vs-craft; https://www.romow.com/tool/craft). Full offline; export Markdown/TextBundle/PDF.

**10. GUI layout.** macOS: sidebar (spaces/folders/backlinks) + document list + canvas; multi-document **tabs**; opens into today's Daily Note; minimal toolbar with formatting floating near selection. iOS: document list → editor; widgets. Windows/web: same canvas, slightly less polish. Whiteboard canvas for freeform arrangement. The design language is "paper texture" calm — text-first, no database chrome (https://www.craft.do/; https://www.craft.do/compare/notion).

**11. Differentiators & steal-worthy.**
- **Daily Note with date-rolling widget** (Yesterday/Today/Tomorrow) — the cleanest daily-journal entry point in this cluster (https://support.craft.do/en/integrate/widgets).
- **Document tabs on desktop + instant open** — "loads instantly with thousands of documents while Notion lags" (https://www.craft.do/compare/notion); speed of open matters for daily habit adoption.
- **Metered AI credits inside the editor** — a simple, transparent way to offer a Coach without subscriptions (https://aisotools.com/blog/craft-review-2026).
- **Tasks embedded in documents with Inbox/Today** — journal-tied task capture worth mirroring.
- **Markdown as lossless export** — writing-file portability that Apple Notes refuses.

---

# 6. Ulysses

**1. Overview.** Ulysses (The Soulmen GbR, Apple Design Award) — the premium **distraction-free long-form writing app**, Mac/iPhone/iPad only, developed since 2003. Subscription-only: $5.99/mo or $49.99/yr (no free tier, 14-day trial) (https://toolradar.com/tools/ulysses; https://makerstack.co/reviews/ulysses-review/). 4.6★/2.1K App Store ratings; Editors' Choice. Positioning: "focus on your prose with a distraction-free editor and character, word, and page goals, then organize your documents using keywords and document groups" (https://apps.apple.com/us/app/ulysses-writing-app/id1225570693). Not a notes app for everyone — "overkill for notes" per reviewers (https://toolradar.com/tools/ulysses).

**2. Core paradigm.** Library of **sheets** (individual writing units) grouped into **groups** (projects/folders) — "on the left, groups. On the right, sheets" (https://reedsy.com/studio/resources/ulysses-writing-app-review). Sheets can be reordered, nested, split; the library is the manuscript organizer. Markdown XL, its own extended markdown (annotations `%%`, footnotes, images, comments) with inline rendering.

**3. Compose model.** Plain-text Markdown with live inline formatting; focus modes: **Composition Mode** (full screen), typewriter scrolling (active line centered), Focus Mode (dim everything but current paragraph); customizable themes (light/dark, adjustable colors); Liquid Glass redesign 2025 (https://scribecount.com/author-resource/writing-tools-for-authors/ulysses.app). No templates engine per se — groups as templates. Quick capture: not a strength; iOS share extension, no web clipper; iCloud sync means "pick up on iPhone, continue on Mac."

**4. Organization.** Groups (folders, nesting), **keywords** (tags) on sheets, **smart filters** (saved keyword/attribute queries), attachment storage; the whole library is full-text searchable (https://makerstack.co/reviews/ulysses-review/). No backlinks/graph/databases.

**5. Search & retrieval.** Fast full-text over the whole library (one unified, searchable place); keyword filters; no OCR, no AI search.

**6. Media.** Images, footnotes, attachments; export includes image handling; no audio/video embedding (media lives outside prose; no vlog support).

**7. Review/reflection.** **Writing Goals + Streaks**: per-sheet, per-session, or per-group word/character/time targets with a progress ring in the editor and **streak tracking of consecutive goal-hitting days** — "simple gamification that some authors find genuinely motivating" (https://scribecount.com/author-resource/writing-tools-for-authors/ulysses.app). No on-this-day, no daily-note system.

**8. Habits/goals.** The Goals/Streaks system *is* the habit engine — writing habit built into the editor, not a separate tracker (ibid.). Direct publishing to WordPress/Medium/Ghost/Micro.blog (https://makerstack.co/reviews/ulysses-review/).

**9. Privacy & export.** iCloud sync; proprietary internal format BUT clean export to .md, .txt, PDF, DOCX, ePub, HTML anytime; library readable read-only after cancellation (https://makerstack.co/reviews/ulysses-review/; https://scribecount.com/author-resource/writing-tools-for-authors/ulysses). Offline: full local work with sync.

**10. GUI layout.** Three-pane: left = library (groups tree), middle = sheet list of the open group with metadata (title, goal %, modified), right = editor; bottom bar shows goal progress ring; `⌘K`-style quick open; full-screen Composition Mode; iPad gets Liquid-Glass-refreshed layouts. Minimal chrome; markdown syntax visible unless rendered (https://toolradar.com/tools/ulysses; https://reedsy.com/studio/resources/ulysses-writing-app-review).

**11. Differentiators & steal-worthy.**
- **Goal + Streak progress ring in the editor** — writing habit mechanics as editor furniture; the closest thing in this cluster to PersonalOS gamification (https://scribecount.com/author-resource/writing-tools-for-authors/ulysses.app).
- **Focus Mode dimming + typewriter scrolling** — concrete distraction-free affordances for long-form vlog writing.
- **Sheets-as-chunks within groups** — journal entries as granular, reorderable units beats one giant document.
- **Proprietary-but-exportable** format philosophy: users forgive lock-in only when export is one click (ibid.).

---

# 7. Bear

**1. Overview.** Bear (Shiny Frog Ltd.) — Apple-only Markdown notes app (Mac/iPad/iPhone), Apple Design Award winner, "beautiful design + markdown simplicity" (https://toolradar.com/tools/bear). Freemium: Free (single device, no sync); **Pro $2.99/mo or $29.99/yr** (iCloud sync, all export formats, OCR search, encryption, 20+ themes, 15 icons) (https://bear.app/faq/features-and-price-of-bear-pro/). 4.5-4.7★ across stores/reviews. Positioning: "Apple Notes' design philosophy with a different editor" — markdown and tags instead of rich text and folders (https://www.notetimeapp.com/blog/apple-notes-alternatives).

**2. Core paradigm.** Single flat list of notes, organized by **nested tags** (#tag, #parent/child, "tagcons") instead of folders; markdown-first editing with live rendering. Mixed content in one note: text, photos, tables, to-do lists (https://aisotools.com/blog/bear-pro-review-2026). No databases, no blocks, no teams.

**3. Compose model.** Plain portable Markdown (headings, lists, code, tables, footnotes, LaTeX math) rendered live; fast native editor; **WikiLinks [[note]]** for cross-note linking (https://aisotools.com/blog/bear-review-2026); focus mode; Apple Pencil sketching (Pro); Siri shortcuts; share extension for quick capture; no web clipper, no Windows/Android/web app. Speed: "stays snappy even with thousands of notes" (ibid.).

**4. Organization.** Nested hashtags typed inline (the tag system *is* the hierarchy); pinning; archive; search; **no folders, no backlinks graph** (wiki-links are manual). Pro adds themes per "cozy space" philosophy.

**5. Search & retrieval.** Full-text; **Pro OCR search inside PDFs and images** (https://bear.app/faq/features-and-price-of-bear-pro/); Pro adds AI-assisted natural-language search and summarization layered on (https://aisotools.com/blog/bear-pro-review-2026); search can lag on very large libraries (https://aisotools.com/blog/bear-review-2026).

**6. Media.** Inline images, tables, to-do lists, attachments (Pro unlimited); sketches with Pencil; no audio/video recording; OCR makes images/PDFs searchable (Pro).

**7. Review/reflection.** No on-this-day, no daily notes. Journaling = user-created #journal tag + search by date; export of a tag's notes to PDF/DOCX makes period review easy (https://toolfolio.com/articles/bear-notes-review).

**8. Habits/goals.** To-do lists inside notes only; no reminders, no streaks, no goals. Purely a writing surface.

**9. Privacy & export.** Local-first; TLS in transit, AES-256 at rest; **Pro: E2E per-note encryption with user passphrase** (https://www.atlasworkspace.ai/blog/bear-vs-apple-notes); export PDF, HTML, DOCX, JPG, Jekyll, plain Markdown, TextBundle (https://bear.app/faq/features-and-price-of-bear-pro/). iCloud sync (Pro). Full offline.

**10. GUI layout.** Sidebar: note list (search + tag tree) — editor on the right; live markdown rendering with syntax visible; quick-open (Cmd+O); Focus Mode; theme switcher (28 themes); per-note lock. Mobile: list + editor, tag bar above keyboard; widget-less (no home-screen widget). Consistent, quiet, typography-first (https://toolradar.com/tools/bear; https://thesunrisedigest.com/focus/bear-notes-review-2026/).

**11. Differentiators & steal-worthy.**
- **Nested inline hashtags as the entire organization system** — zero separate tag-management UI; #area/thing convention maps directly to Life Areas (https://aisotools.com/blog/bear-review-2026).
- **Wiki-links in a plain-text app** — cheap cross-referencing for a private journal (ibid.).
- **Per-note E2E encryption keyed by passphrase** — selective privacy (lock one entry, not the whole vault) (https://www.atlasworkspace.ai/blog/bear-vs-apple-notes).
- **Typography as product identity** — writing surfaces win on feel, not features.
- Anti-pattern: **sync paywalled at Pro** ($2.99/mo for iCloud sync) is Bear's most-mocked decision — sync is table stakes.

---

# 8. Standard Notes

**1. Overview.** Standard Notes (founded 2017 by Mo Bitar, now part of Proton) — open-source, **end-to-end-encrypted-by-default** notes app: web, Windows, macOS, Linux, iOS, Android; unlimited devices; 10-year longevity pledge; self-hostable sync server (https://standardnotes.com/; https://makerstack.co/reviews/standard-notes-review/). Freemium: Standard (free: plain text, unlimited notes/devices, tags, per-note password, 2FA, daily encrypted email backups), Productivity $90/yr (Super notes, spreadsheets, folders, Web Clipper, 1-year history, **Daily Notebooks**), Professional $120/yr (100GB encrypted files, share with 5) (https://standardnotes.com/plans; https://toolradar.com/tools/standard-notes/pricing). 4.3-4.6★ reviews; niche but respected by journalists/lawyers (https://smartremotegigs.com/software/standard-notes/).

**2. Core paradigm.** A minimal, consistent note list, organized by tags and smart views; every note encrypted on-device with **XChaCha20-Poly1305** before sync — "a steel vault for your mind" (https://standardnotes.com/). No blocks, no graph, no backlinks — "a secure note store, not a PKM system" (https://smartremotegigs.com/software/standard-notes/).

**3. Compose model.** Editor-switcher model: plain text (free) → Markdown, rich text, code, checklist, spreadsheet editors (paid); **Super** editor = combined Markdown/rich-text note type (https://toolradar.com/tools/standard-notes/pricing). Themes (paid). No templates engine. Quick capture: Web Clipper (paid), email-in; mobile app with iOS/Android share; no widgets of note; capture is not the product's strength — durability is.

**4. Organization.** Flat **tags**; **Smart Views** = saved filtered collections (tag/date criteria); folders on paid plan; pinning, archiving, trash with recovery (https://standardnotes.com/features; https://makerstack.co/reviews/standard-notes-review/).

**5. Search & retrieval.** Full-text over note list; in-note search and title-only/tag filters added recently (https://play.google.com/store/apps/details?id=com.standardnotes); **no AI, no OCR, no semantic search** — deliberate: encryption prevents server-side indexing; any AI would have to run on-device (https://smartremotegigs.com/software/standard-notes/).

**6. Media.** Files stored as **encrypted attachments** (100GB on Professional); no rich media embedding; photos/videos stored but not a media-first experience.

**7. Review/reflection.** **Daily Notebooks** — "better journaling with Daily Notebooks for creating a daily journal" (https://toolradar.com/tools/standard-notes/pricing) — a daily-note/journaling surface inside the encrypted vault; the only app in this cluster whose paid pitch explicitly says "journaling."

**8. Habits/goals.** Checklist editor, tasks note type; 2FA authenticator for other services; no habit streaks/goals.

**9. Privacy & export.** The gold standard: **E2E by default, zero-knowledge, independently audited, open-source client + server, self-hostable**; note history unlimited on paid; **export in encrypted or plaintext format (one click)**, daily encrypted email backups (https://standardnotes.com/plans; https://makerstack.co/reviews/standard-notes-review/). Totally offline-capable without account (app passcode mode) (https://standardnotes.com/help/59/can-i-use-standard-notes-totally-offline).

**10. GUI layout.** Left sidebar: notes list with tag/smart-view filters — center: editor; editor-type switcher in top bar; deliberately identical across platforms ("open a note on your phone, it looks and works nearly identically to the desktop version") (https://makerstack.co/reviews/standard-notes-review/). Dated UI is the top complaint; "half the app behind a paywall" confusion noted in Play reviews (https://play.google.com/store/apps/details?id=com.standardnotes).

**11. Differentiators & steal-worthy.**
- **Encryption as default, not a feature** — the privacy baseline a private journal (esp. physique photos!) should match or exceed (https://standardnotes.com/).
- **Daily encrypted email backups** — automatic off-vault backup cadence, cheap and effective (https://standardnotes.com/plans).
- **Daily Notebooks for journaling** — evidence that journaling is a first-class paid feature (https://toolradar.com/tools/standard-notes/pricing).
- **Plaintext/encrypted dual export + self-hostable sync** — the "your data forever" contract; PersonalOS Year Book export should be equally uncompromising (https://makerstack.co/reviews/standard-notes-review/).
- **10-year longevity pledge** — a trust mechanism a personal life-log should borrow (same page).

---

# 9. Google Keep

**1. Overview.** Google's free quick-capture app: web (keep.google.com), Android, iOS, plus Chrome/Workspace side panel; no dedicated desktop app (https://www.cloudwards.net/google-keep-review). Free forever, unlimited notes; ~4.7★/247 Capterra reviews; the fastest cold-start capture in benchmarks (~1s, tied with Apple Notes) (https://productivitybrief.com/profiles/google-keep-tool-profile). Positioning: "a digital sticky-note layer: a place to catch the thing before it disappears" — deliberately not a knowledge base (ibid.).

**2. Core paradigm.** **Notes-as-cards** (sticky-note metaphor): text, checklist, image, drawing, audio, or mixed in one card; no rich-text document model, no folders, no notebooks; labels + colors + pinning instead of hierarchy (https://appmus.com/software/google-keep; https://www.cloudwards.net/google-keep-review).

**3. Compose model.** Single click "Take a note" box; each note gets color, label, pin, reminder, collaborator, drawing; checklist with progress ring; voice notes with automatic transcription; OCR text extraction from images; "Send to Docs" to graduate a note into a formatted document (https://www.cloudwards.net/google-keep-review; https://workspace.google.com/products/keep). Quick capture: Android home-screen widgets (tap once for text/checklist/voice/photo/drawing), notification-bar quick note, Chrome extension "Save to Keep," **Workspace side panel inside Gmail/Docs/Drive/Calendar** (https://productivitybrief.com/profiles/google-keep-tool-profile). Gemini: creates/summarizes/organizes notes and lists (voice → organized notes, multi-topic splitting into separate notes, announced I/O 2026) but cannot modify/delete/share/view images; requires AI training enabled (https://www.gadgets360.com/ai/news/google-i-o-2026-docs-live-gmail-keep-gemini-ai-voice-us-rollout-11520723; https://www.androidpolice.com/how-to-share-gemini-notes-with-google-keep/).

**4. Organization.** **Labels** (max 50), color coding, pinning (pinned section on top), archive (Archive drawer), search by keyword/color/label/type; no nested labels, no smart folders, no backlinks (https://crm.org/news/google-keep-review).

**5. Search & retrieval.** Full-text over notes **+ OCR of image text** + voice-note transcription search; search operators in web; no saved searches. Gemini (for AI Pro/Ultra/Workspace preview) can search and answer over Keep (https://www.gadgets360.com/ai/news/google-i-o-2026-docs-live-gmail-keep-gemini-ai-voice-us-rollout-11520723).

**6. Media.** Photos, drawings, audio recordings (transcribed), image OCR; no video embedding; no PDFs/attachments of substance.

**7. Review/reflection.** None: no on-this-day, no daily notes, no templates. Keep is front-of-funnel capture; "use Keep as the front door and move the important material elsewhere" (https://productivitybrief.com/profiles/google-keep-tool-profile).

**8. Habits/goals.** **Reminders**: time-based, repeating, and location-based (pop when you arrive somewhere), synced to Google Calendar (https://www.cloudwards.net/google-keep-review; https://crm.org/news/google-keep-review). Checklists are the closest thing to habit tracking; early-2026 reports of reminders being de-emphasized toward Google Tasks (https://productivitybrief.com/profiles/google-keep-tool-profile).

**9. Privacy & export.** Cloud-only; no E2E, no note locking, no PIN/biometric protection; Google can read content for search/AI; Gemini review data handled per Gemini privacy policy (human-review retention up to 3 years) (https://www.capterra.com/p/233847/Google-Keep/; https://terms.law/Privacy-Watchdog/ai-services/gemini/). Export only via **Google Takeout** (whole-account JSON/HTML). Offline: cached notes on mobile.

**10. GUI layout.** Web: **masonry card grid** (or list view) with pinned notes at top, label sidebar, palette, search bar, archive drawer; cards show color edge, snippet, reminder icons. Android: single-column scrolling cards, bottom "new note" FAB, home-screen widgets for one-tap note types; iOS: similar. Workspace side panel (right rail in Gmail/Docs/Drive/Calendar) with "Take a note" box. Zero chrome, zero learning curve (https://www.cloudwards.net/google-keep-review; https://workspace.google.com/products/keep).

**11. Differentiators & steal-worthy.**
- **One-tap capture widgets per note type** (text/checklist/voice/photo/drawing) — the fastest capture UX in the cluster; a PWA can mirror with share-target + widgets (https://productivitybrief.com/profiles/google-keep-tool-profile).
- **Card grid with color + pinned section** — glanceable visual scanning that beats dense list rows for daily review (https://appmus.com/software/google-keep).
- **Location-based reminders** — "remind me about this at home/gym" is a genuinely useful journal/habit trigger.
- **Voice note with automatic transcription** — the simplest vlog-capture loop (ibid.).
- **Send to Docs graduation path** — quick capture that escalates to long form; PersonalOS "quiet week → Year Book" should offer the same escalation (https://workspace.google.com/products/keep).
- Anti-pattern: **no export except Takeout, no locking** — the right things to avoid in a private journal.

---

# Cross-cluster synthesis: what a private journal app should steal

- **Media search (OCR) is table stakes**: Evernote, OneNote, Apple Notes, Bear (Pro), Keep all ship image/PDF/handwriting OCR search; Notion doesn't and it's the #1 complaint against it (https://smartremotegigs.com/notion-vs-evernote; https://productivitybrief.com/profiles/microsoft-onenote-2026).
- **Capture friction decides adoption**: Keep/Apple Notes win on <1s capture; Notion/Evernote win on widget breadth; Win+Alt+N (OneNote) and corner-swipe Quick Notes (Apple) are the OS-level gold standard (https://productivitybrief.com/profiles/google-keep-tool-profile; https://support.microsoft.com/en-us/onenote/onenote-help-and-learning/create-quick-notes).
- **Daily-note surfaces are the reflection engine**: only Craft (Daily Notes + Today widget) and Standard Notes (Daily Notebooks) make journaling a named feature; Apple splits it into the Journal app; Ulysses adds streak/goal rings (https://support.craft.do/en/integrate/widgets; https://scribecount.com/author-resource/writing-tools-for-authors/ulysses.app).
- **Encryption-by-default + local-first wins trust for private data** (Standard Notes); every other player offers at most per-note locks (Bear, Evernote) or nothing (Keep).
- **Free-tier generosity is a strategy**: Notion's unlimited solo free plan and OneNote's free full app built goodwill; Evernote's 50-note free tier destroyed it (https://freealternatives.to/evernote/free-plan).
- **Smart folders/saved searches (Apple Notes) = the "filter chips" pattern**; **notebook→section→page (OneNote) and sheet→group (Ulysses) = the timeline-grouping pattern**; **card grid (Keep) = the glanceable review pattern**; **database views (Notion) = the Life-Area/filter-chips engine**.
