# Integration Sequencing Notes — TEMP-PLANNING.md (gen-2 ledger)

Stage A3 (Sequencer, Track 3) output. Source: `TEMP-PLANNING.md` (the gen-2
ledger, 3,922 lines, frozen). Framework: `doc draft framework/
Pipeline-Framework-v7-Gen2-Delta.md` read first (where it disagrees with
v6-final it wins). Every row below is a HOW/WHEN instruction — how or when
something is built, prototyped, tested, or decided — NOT product content
(that is Track 1/2 territory).

This file is NOT drafted into product docs. It is a standing reference; the
human decides in Stage C whether to append it to DevelopmentWorkflow.md as a
"sequencing notes from TEMP-PLANNING.md integration" section or keep it as
its own file.

GEN-2 focus areas, extracted with precision:
- D117 (the development handoff, lines 3831–3919) — the M9 launch sequence:
  phase order engine foundation → organs → visuals → navigation → anatomy →
  review; the trait-space 17-audit + archetype-mockup step (D1/D2) runs in
  M9 against the real renderer (L-15's deferred placement lands here); the
  19 archetypes become the seeded-data test fixtures (H1).
- D105 (lines 3019–3044) — the dev-tools tuning surface: every register
  value playable in a dev-only debug panel — "build with the engine, never
  ship."
- The paper-run validation discipline (D116 + D117 H1/H5, lines 3459–3565,
  3909–3919): the 19 archetype walks are the regression fixtures for the
  derivation engine.
- "Research leftovers" (lines 2104–2155): every item with a timing/gating
  condition is extracted below; items with no timing language are left in
  the ledger.

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |
|---|---|---|---|---|
| S001 | Every decision gets `(LOCKED, user yes)` + a D-number (D082+) written into docs/DecisionLog.md; no silent assumptions — state them, get a yes. | All ledger entries (general process) | Immediate — at every decision | 25–26 |
| S002 | Divergence discovered while building: DecisionLog entry first, then docs. | All build work (general process) | Immediate — when divergence is discovered during building | 27–28 |
| S003 | No new dependencies without a DecisionLog entry + user approval. | Any new dependency (general process) | Immediate — before adding any dependency | 29 |
| S004 | New achievement work follows the layer map (Gamification.md v2 = THE WHAT, Achievement-Spec = THE WHEN, ledger = THE WHY); this file restates nothing. | Achievements / gamification work | Immediate — for any new achievement work | 30–33 |
| S005 | When this batch matures → run the integration pipeline once, then this file gets archived like gen-1 (audits/ date-suffixed). | Ledger lifecycle (general process) | When the batch matures / a pipeline run starts | 34–37 |
| S006 | Source freeze applies from the moment a pipeline run starts. | Ledger + docs (general process) | When a pipeline run starts | 38 |
| S007 | Entry format + status discipline: first line `- FAMILY-ID NAME (STATUS, user yes — note):`; statuses LOCKED / SKIPPED (REVISIT line) / REJECTED (RESTING PLACE line) / AGREED IN PRINCIPLE / PENDING; rejected = do-not-resurrect contract, skipped = trigger that re-opens them — both must survive any docs pass. | All ledger entries (drafting process) | Immediate (standing); enforced at the docs pass | 44–69 |
| S008 | LANDS convention: D082+ is implied for every LOCKED entry across ALL series (C/F/N/L + tree-7); the docs pass assigns the final D-numbers per row. | All LOCKED ledger entries | Docs pass (Stage B/C) | 94 |
| S009 | Installed skills security-threat-model + security-and-hardening serve the M3 OAuth gate + the Life Tree engine build. | D084 (skill installs); M3 OAuth / Life Tree engine | M3 OAuth gate; Life Tree engine build | 95–99 |
| S010 | flutter-expert skill supports the Life Tree engine build (off-UI-thread derivation via compute(), RepaintBoundary render isolation, DevTools profiling). | D083 (skill install); Life Tree engine | Life Tree engine build (M9 Phase 0) | 115–122 |
| S011 | D060 supersession: the gen-2 F-series supersedes D060 (fitness surface CLOSED) for the named locked candidates; the closure list is amended at the docs pass (DecisionLog D082+ entry records the override); Roadmap.md:283-288's N3/N5 park-able clause is amended — they are re-opened, not park-able. | F-series candidates; Roadmap.md | Docs pass | 131 |
| S012 | F-03 PR-celebration DESIGN LANGUAGE is HELD until the Life Tree design session — F-03 adopts whatever the Life Tree defines; only the functional rules lock now. | F-03; DesignSystem.md ceremony tokens | Life Tree design session (tree-7, complete) → ceremony language lands in M9 Phase 3 (D117 D3) | 255–261 |
| S013 | engine-1 logging friction discipline applies to ALL M2 logging work: default path ≤2 interactions/set, everything pre-fillable pre-filled, friction budget (every new live-logging field must remove more friction than it adds; optional input goes to the post-session review, never mid-session), minimal mode. | engine-1; all M2 logging UI | All M2 logging work | 324–343 |
| S014 | engine-2 Coach heuristic engine: ~25 named rules committed by M2; ONE rule-execution architecture (event → rule catalog, condition→action, strictness-parameterized), never scattered ad-hoc conditionals; the concrete test plan locks at the Coach rule-book session (test oracle = determinism + explainability; table-driven tests; per-rule boundary tests; fixture-based regression; provenance-as-authority). | engine-2; CoachSystem.md rule catalog | Rules by M2; test plan at the Coach rule-book session | 344–368 |
| S015 | engine-2 LLM role: voice layer only, render-never-decide, OFF by default, offline = complete product; access mechanics deliberately unspecified — decided when/if it ever ships. | engine-2; Optional AI Adapter | When/if the LLM layer ships | 369–376 |
| S016 | F-05 adherence exclusion: W-set-only sessions never count toward plan adherence and never satisfy qualifyingEntry(GYM); Gamification.md:209-211 must read "≥1 real WORKING set". | F-05; Gamification.md | Docs pass | 313–320 |
| S017 | F-08: verify the seed volume-band numbers (MEV/MAV/MRV) against RP's published tables at build (rpstrength.com volume-landmarks, peakcalcs.com). | F-08; M2 volume-balance engine | At M2 build | 487–489 |
| S018 | F-08 schema-amendment flag: CoachSystem.md:277 ("volume balance = Settings keys only; zero core schema change") becomes FALSE via F-05's setType — the docs pass amends to "settings keys + the setType column (F-05)". | F-08; CoachSystem.md | Docs pass | 492–496 |
| S019 | F-12 default-style reconciliation: the docs pass records the amended default "weight-mode = linear progression with GZCLP stage-cascade on failure (F-12)". | F-12; Roadmap.md PO-style default | Docs pass | 444–450 |
| S020 | F-13 long-horizon weight view (full-history EMA + per-month markers + J5 yearly weight page + Life Tree body-domain presence) is a follow-on design item, NOT part of F-13's lock; the J5 yearly page is a J5 spec change. | F-13; Roadmap M1 J5 | Follow-on design item; J5 spec change at M1 | 553–564 |
| S021 | F-13 doc-amendment flags: Architecture.md:189/268-270 + Roadmap.md:361 "rollingWindowMean = the ONLY rolling-average math" claims become FALSE — amend to "the ONLY windowed rolling-average util; the body trend owner uses the time-indexed EMA"; the pace-owner consumers (phase/goal pace, ratios, trophies, weight-goal pace) read the new rate layer. | F-13; Architecture.md; Roadmap.md | Docs pass | 572–584 |
| S022 | F-14: UI details (rate-vs-target bar, water-jump dots) may be improved/changed during the UI design phase (recorded, not locked). | F-14; UIUX.md weight chart | UI design phase | 597–600 |
| S023 | F-15: celebration visual language DEFERRED to the Life Tree ceremony session (same as F-03); forecast = RANGE, never a single date; UI suggestions may change at the UI implementation phase. | F-15; DesignSystem.md ceremony tokens | Life Tree ceremony session → M9 Phase 3; UI implementation phase | 616–620 |
| S024 | F-16: UI suggestions noted — future UI implementation may change them. | F-16; UIUX.md weight screen | Future UI implementation | 638–639 |
| S025 | F-17: rank interpolation is derived from the frozen tables now, labeled modeled; OpenPowerlifting public CSVs remain the FUTURE empirical upgrade (offline-packable). | F-17; vault standards screen | Future — when OPL data is adopted | 666–669 |
| S026 | F-18: IPF DOTS coefficients are embedded FROM THE OFFICIAL SOURCE at build (never invented, verified at write time — same discipline as the frozen standards tables); the exact meta-score rollup is open-at-build detail. | F-18; strength profile engine | At M2 build | 691–707 |
| S027 | F-19/F-20: the session-load unit ("tonnage-equivalents" or "set-load points") is DEFINED AT THE RULE-BOOK SESSION before the engine is built; the ~8/week ramp guardrail is anchored to that unit. | F-19, F-20; Architecture.md load owner | Coach rule-book session, before the engine is built | 751–756 |
| S028 | F-19 N5-deferral amendments: Roadmap idea-park N5 (Roadmap.md:1027-1029) + CoachSystem.md:352-357 must read "CLOSED by F-19" at the docs pass; FUT-2 hardware-style readiness tracking stays OUT of F-19 (separate item, carried forward). | F-19; Roadmap.md; CoachSystem.md | Docs pass | 762–766 |
| S029 | F-23: M2 ships TIRED + SHORT-ON-TIME (load multiplier + condensed variants); the no-equipment path comes LATER (parked — F-32 rejected 2026). | F-23; M2 session screen | M2 ships the subset; no-equipment later | 796–798 |
| S030 | F-24 one-line amendments: the docs' "one Coach line per strictness" in FOUR places (check_in_weekly CoachSystem.md:171, nutrition_checkup :177, phase_close :185, milestone-review :236) all amend to the 3–5-line message at the docs pass. | F-24; CoachSystem.md | Docs pass | 841–845 |
| S031 | F-25 REVISIT: activation trigger — when M7 gamification planning begins (or fitness-streak work starts); the weekly-streak (a)/(b)/(c) decision + savers (12-week marks, max 2) are picked then; v2 streak trophies read the re-framed streak (catalog-level decision via the layer map). | F-25 (SKIPPED); Gamification.md grace family | M7 gamification planning / fitness-streak work starts | 877–880 |
| S032 | F-26 REVISIT: activation trigger — when rep-mode exercise work starts (M2 build or later); progression-edge seeds + user-extendable chains design decided then (schema decision). | F-26 (SKIPPED); rep-mode exercises | Rep-mode exercise work starts (M2 build or later) | 899–901 |
| S033 | F-27 ACTIVATION: the full proposal is documented; planning is ACTIVATED at the M7 gamification/achievement milestone (or any trophy-catalog work); the deferred adapted-session question (do F-23 adapted sessions count as adhered?) + the schedule-run trophy cap are decided at activation. | F-27 (AGREED IN PRINCIPLE); trophy catalog | M7 gamification/achievement milestone / any trophy-catalog work | 928–937 |
| S034 | N-09: no new package needed on web (verify at build — native Chrome BarcodeDetector API + zxing-wasm fallback); DecisionLog entry records the approval + D069 distinction. | N-09; M3 barcode scanning | At M3 build | 1033–1037 |
| S035 | N-01: UI suggestions recorded (history ribbon top-12, badges always-visible); future UI development stages may change or keep them. | N-01; UIUX.md diary | Future UI development stages | 1052–1053 |
| S036 | N-02 micronutrients: separate milestone M3b (after M3, before M4 — needs the M3 diary foundation, self-contained after that); includes a LARGE GUI/UIX section; M3b needs a dedicated mobbin pull + research pass at activation (Cronometer has no mobbin screens). | N-02; Roadmap M3b | M3b activation (after M3, before M4) | 1147–1160 |
| S037 | N-02 drafter notes: the docs pass drafts the tiered architecture (bundled core / growing mirror / online pass-through; seed numbers 15k, 10–15 MB; accumulation rule) with verbatim-critical fidelity; the security gate references the online-exception contract when reviewing any nutrition network code. | N-02; Database.md; DecisionLog; security gate | Docs pass; security gate on nutrition network code | 1161–1181 |
| S038 | N-10 substitution built in two scopes: CURRENT-MEAL-ONLY first (M3, affects today's slot, nothing else); CASCADE built AFTER it (M3+), a deliberate EDIT-PLAN action with confirmation, never a silent side effect of substitution. | N-10; M3 + M3+ substitution | M3 then M3+ | 1250–1255 |
| S039 | N-17: record-the-abstraction-now, feature-later — the macro derivation engine is BORN READY with the constraint-order abstraction (protein-fixed + floor-fixed + remainder-flex), never hard-coded to bulk/cut/maintain (zero extra build cost); REVISIT when new phase types / diet modes are actually proposed. | N-17; Architecture.md macro derivation engine | Engine build (M3); revisit when new modes proposed | 1317–1328 |
| S040 | N-07 scope split (D5): M3 ships L1+L2 (already locked) + ALL estimate-framing copy (N-13) + the weigh-in policy nudge + the adaptation lines + the aggressive-rate warning; M3+ ships the L3 implied-TDEE insight itself (needs accumulated logging data to mean anything). | N-07; Roadmap M3 / M3+ | M3 then M3+ | 1466–1470 |
| S041 | N-07 drafter notes: Architecture.md drafts the impliedTDEE owner (trendWindow 20-day inference signal separate from the F-13 display EMA); CoachSystem.md drafts the check-up block (implied-vs-locked display, HOLD states, adaptation arc copy); DecisionLog records D1-D7 verdicts + the B4 contract (surfaced-only); Roadmap M3+ schedules the insight; all constants verbatim-critical. | N-07; Architecture.md; CoachSystem.md; DecisionLog; Roadmap M3+ | Docs pass / M3+ scheduling | 1471–1479 |
| S042 | N-13 drafter notes: UIUX.md drafts the explainer sheet component + footnote copy (verbatim-critical framing table); CoachSystem.md drafts the check-up lines. | N-13; UIUX.md; CoachSystem.md | Docs pass | 1515–1519 |
| S043 | L-02: Logbook (won-archive) placement is a recorded suggestion — future UI development stages will likely affect it (noted, not locked). | L-02; goals surface | Future UI development stages | 1558–1561 |
| S044 | L-03: on/off-track colors left for future UI development to decide (amber for behind, red reserved for genuinely-expired — suggestion recorded, not locked). | L-03; goal chart | Future UI development | 1581–1584 |
| S045 | L-13: M4 scope = weekday/weekend + specific days + weekly; MONTHLY patterns future; pattern edits apply FUTURE-ONLY by default with this/all-future/all scoping (a template edited mid-week never corrupts the week). | L-13; M4 routine editor | M4; monthly patterns future | 1637–1642 |
| S046 | L-06: line placement (interleaved chronological feed) + status color semantics are recorded takes — FUTURE UI DESIGN MAY CHANGE THEM (not locked); period-level duality (Polarsteps) is accepted. | L-06; M6 day view | Future UI design | 1664–1673 |
| S047 | L-07: full collapse (no compact placeholders) + zero-data heatmap collapse accepted — FUTURE UI/UX DEVELOPMENT MAY CHANGE (not locked). | L-07; dashboard blocks | Future UI/UX development | 1691–1697 |
| S048 | L-12: numbers>charts glance / charts>numbers analysis rule recorded — FUTURE UI/UX MAY CHANGE (not locked). | L-12; dashboard + DesignSystem.md | Future UI/UX | 1709–1715 |
| S049 | L-14: the final strength-vs-heatmap block order is HELD for the deferred UI/UX ordering pass; the evidence note (heatmap = glance surface, strength snapshot = analysis below the glance line) is what that pass inherits — not reopened blindly. | L-14; dashboard block order | UI/UX ordering pass | 1726–1732 |
| S050 | L-09: per-block skeleton rules accepted (returning-users-only ghosts, no ghosts for locally-cached light blocks, geometry-matched shapes) — FUTURE UI PASSES MAY CHANGE (not locked). | L-09; dashboard shimmer rule | Future UI passes | 1752–1756 |
| S051 | L-10 stress-testing requirement: the insight engine must be EXTENSIVELY STRESS-TESTED with SEEDED DATA (synthetic histories producing known patterns; edge cases: tiny samples, lopsided groups, seasonal effects, missing data; full threshold/confidence matrix) BEFORE it ever ships a real insight; the test fixtures become part of the engine's test suite (per engine-2). | L-10; CoachSystem.md insight line | Before the first L-10 insight ships | 1792–1799 |
| S052 | L-11 sprawl guardrail: a standing guardrail, not a feature — every proposed feature passes "does it earn its place in the surface?" (surface-worthiness / schema discipline / sprawl test); carried to DevelopmentWorkflow at the docs pass. | L-11; DevelopmentWorkflow.md | Docs pass; standing rule for every proposed feature | 1808–1825 |
| S053 | L-15: PLACEMENT DEFERRED to D117 D1/D2 — the M9 trait-space + mockup step, where the spatial-meta layer (life-scale grid) is designed against the real renderer; feed-only scope (strip, zoom mode, or not at all — tree session decides). | L-15 (DESIGN FEED); tree-2/tree-5 placement | M9 Phase 3 (trait-space + archetype mockup step) | 1826–1851 |
| S054 | C-03: the weather chip ships WITHOUT it (PENDING SUB-ITEM inside a LOCKED entry) — the chip activates only after the DecisionLog dependency decision (free API key or free accurate open-source setup + approval). | C-03; weather chip | After the DecisionLog dependency decision | 1874–1881 |
| S055 | C-05: J5 must exclude hidden memories at the docs pass — hidden-ness in Year Book PDFs changes the J5 spec ("packages a copy"); hidden applies EVERYWHERE memories surface, including exports/PDFs. | C-05; Roadmap M1 J5 | Docs pass (M1 J5) | 1911–1914 |
| S056 | C-08: the unlinked-mention suggestion carries the "needs text access → user opt-in first" privacy stamp — gated until the M2+ text opt-in exists OR matching is restricted to tags/areas/dates only at activation (decision at build; PENDING SUB-ITEM); wikilinks (user-typed) are unaffected. | C-08; J2 matcher | At build; gated on the M2+ text opt-in / matching restriction | 1949–1959 |
| S057 | C-09: LANDS must amend the Grace section wording to "grace + bounded pause are the streak shields" (pause bounded 1–14 days, records the away period — never hides). | C-09; Gamification.md grace family | Docs pass | 1979–1980 |
| S058 | C-11: transcription + time-sync (tap transcript → scrub audio) = FUTURE-ONLY optional addition, NOT now; needs an STT engine decision (DecisionLog + approval) when/if pursued; raw audio always kept; on-device only. | C-11; voice-note entry type | When/if STT is pursued | 1990–1998 |
| S059 | C-11 audio-duration note: the voice-note path needs an audio container rule (e.g., M4A/MP4 header parse for adopted files) + tier rules — recommended at build: same tier logic as vlog, buffer exempt. | C-11; MediaStorage.md | At build (voice-note entry) | 1999–2005 |
| S060 | C-07 REVISIT: activation when M7 analytics work starts, or when the Life Tree branch-detail design needs the data (per-area fields, opt-in, invisible until used). | C-07 (SKIPPED); Life Areas v2 | M7 analytics work / Life Tree branch-detail design | 2025–2028 |
| S061 | C-12 REVISIT: activation when the Coach rule-book session plans prompt-driven nudges, or if blank-page friction shows up in real use (J2 search + memory strip ship first); hand-written core + LLM expansion curated at build time; NO scraping (copyrighted IP). | C-12 (SKIPPED); prompt library | Coach rule-book session / blank-page friction in real use | 2042–2044 |
| S062 | C-13 REVISIT: after J1 ships and the memory strip proves itself in real use — then decide the ritual on/off; GUARD at activation: the review-streak reward must be XP-free and non-farmable (never-list forbids rewards for reading/opening). | C-13 (SKIPPED); J1 memory strip ritual | After J1 ships + strip proves itself in real use | 2057–2062 |
| S063 | C-14 REVISIT: belongs to the deferred Coach rule-book session — raise the scheduling layer there as a named rule. | C-14 (SKIPPED); Coach scheduling layer | Coach rule-book session (M8 planning) | 2071–2075 |
| S064 | C-10 REVISIT: anytime — a natural Life Tree annual-ring visual if the tree design wants it. | C-10 (SKIPPED); Year-in-Pixels mosaic | Life Tree design (M9) wants it | 2091–2092 |
| S065 | Research leftovers pipeline: items land in docs/DecisionLog.md as OPEN ITEMS (category = deferred, D038/D039 precedent) — do NOT scatter into feature docs as decided scope. | Research leftovers (all NOTED items) | Docs pass | 2109–2111 |
| S066 | OCR SEARCH over attached photos: revisit when J2 ships; needs a PWA OCR path decision (local WASM vs defer). | Research leftover; J2 search | J2 ships | 2113–2116 |
| S067 | REGEX-CAPABLE SEARCH: fold into J2's matcher design if trivial; no separate decision. | Research leftover; J2 matcher | J2 matcher design | 2117–2118 |
| S068 | COMMAND PALETTE (Ctrl+P): belongs to the UI/UX ordering pass. | Research leftover (GUI) | UI/UX ordering pass | 2119–2120 |
| S069 | ATLAS / MAP VIEW OF ENTRIES: revisit at M6 (pairs with M6 periods/travel + physique timeline). | Research leftover; M6 periods/travel | M6 | 2121–2123 |
| S070 | MULTIPLE JOURNALS vs SINGLE TIMELINE: recorded so the docs pass doesn't re-open it silently (current direction = single timeline + Life Areas). | Research leftover (design pole) | Docs pass guard | 2124–2127 |
| S071 | DEFAULT-INBOX + TRIAGE: belongs to the UI/UX ordering pass. | Research leftover (capture GUI) | UI/UX ordering pass | 2128–2129 |
| S072 | ONE-ENTRY-PER-DAY CONSTRAINT MODE: revisit if catch-up spirals show in real use. | Research leftover (pole) | Catch-up spirals in real use | 2130–2131 |
| S073 | SMART FILL BACKFILL: revisit with habits/grace v2 work. | Research leftover; habits/grace v2 | Habits/grace v2 work | 2132–2133 |
| S074 | GOAL/STREAK PROGRESS RING IN EDITOR: belongs to UI/UX ordering pass. | Research leftover (GUI) | UI/UX ordering pass | 2134–2135 |
| S075 | NO-FAIL JOURNALING ("journal three lines, decline without recording"): Coach rule-book session candidate. | Research leftover (coach) | Coach rule-book session | 2136–2137 |
| S076 | OPTIONAL FOCUS GATE (app-blocking during reflection): Coach rule-book session candidate. | Research leftover (coach) | Coach rule-book session | 2138–2139 |
| S077 | PRIVACY-FIRST ONBOARDING COPY ("we never see your data"): belongs to welcome/onboarding polish. | Research leftover (UX) | Welcome/onboarding polish work | 2140–2141 |
| S078 | ENCRYPTED EXPORT ARCHIVES: revisit with backup/export v2 (M10 Drive P2 planning). | Research leftover; export/backup v2 | M10 Drive P2 planning | 2142–2143 |
| S079 | YAML FRONTMATTER ON EXPORT: fold into Year Book export format if wanted; no separate decision. | Research leftover (J5 detail) | Year Book export format work | 2144–2145 |
| S080 | QUOTE-YOUR-OLD-SELF / TRANSCLUSION: if C-08 links ship and reflection wants it, extend links with an "insert quote from" action — revisit then. | Research leftover; C-08 family | C-08 links ship + reflection wants it | 2146–2148 |
| S081 | MORNING/EVENING RITUAL RHYTHM: Coach rule-book session candidate (with C-14). | Research leftover (coach) | Coach rule-book session | 2149–2150 |
| S082 | RESEARCH ANTI-PATTERNS: the docs pass cites these (paywall nagging, punishment loops, cloud-only memory, training on content) as documented no-goes wherever nudges, gamification, or AI are described. | Research leftovers (guardrail) | Docs pass | 2151–2155 |
| S083 | UI/UX DEVELOPMENT REFERENCE: consult at EVERY milestone's UI/UX work (implementation, the UI/UX ordering pass, and any design drafting) — table is a lookup, not a lock; pipeline routes it via B2 Structural Impact Proposal + D2 executor, not the per-row D1 path. | UI/UX reference table (M0–M9 rows) | Every milestone's UI/UX work | 2157–2171 |
| S084 | Mobbin dataset maps: VERBATIM-CRITICAL — drafters copy the FILE PATHS and screen counts exactly, never inline JSON contents; the GUI-table milestone rows + these maps are the two drafting entry points for mobbin content. | Fitness/nutrition/LifeOS mobbin maps | Docs pass drafting | 2192–2237 |
| S085 | APP MAP: the Life Tree sits on top of analytics feeds (M7) + rings data — its design assumes those locks, nothing earlier. | Life Tree; M7 analytics + rings | Tree design/build depends on M7 analytics + rings locks | 2341–2342 |
| S086 | tree-4: the tree tab's navigation placement is decided at the deferred UI/UX ordering pass (tab existence locked gen-1). | tree-4; Life Tree tab | UI/UX ordering pass | 2386–2387 |
| S087 | tree-7 session plan steps 4–9 (the build order): 4 archetype mockups DEFERRED to the M9 milestone (D117 D2); 6 engine architecture (derivation cache, state model, renderer design + perf budgets, test harness); 7 trait space + visual design (mockups feed this); 8 engine contract (zero-decision-fatigue spec); 9 build sequencing (phase 0 = renderer perf spike, then organs → visuals → navigation → anatomy → review mode); 10 record + docs pass. | tree-7 session plan; PLAN.md | Steps 4–9 at M9; step order per PLAN.md | 2404–2412 |
| S088 | D094: the replay-on-open + viewed-watermark mechanism (unviewed transitions play in chronological order on next open, then settle) IS the M9 launch-day replay engine (N-1) — a veteran user's first open replays their whole journey seed → today. | D094; D097 launch-day contract | M9 launch-day (engine built in M9 Phase 5/F + used at launch) | 2605–2613 |
| S089 | D097 launch-day contract: the tree derives from FULL history from day one (a veteran's tree is already mature on first open — no fake fresh start); the journey replays ONCE, elegantly, as a time-lapse (~20–40s) from PRECOMPUTED YEARLY SNAPSHOTS, never live re-derivation, background-loaded; first frame = current state instantly (perf contract); viewed-watermark once (skippable; reduced-motion fallback = jump to current state); backdating of new events governed by D100's two-tier split (the tree never rewinds); legend card after the replay. | D097; tree-5 perf; D094 replay engine | M9 launch (tree ships in M9; users log from M0) | 2728–2768 |
| S090 | D098: the tree cache is REGENERABLE — never part of the backup format's integrity story; rebuilds on restore off-thread, shimmer-first (same as D097 — the rebuild stacks on the heaviest import, streams, never blocks). | D098; restore/backup contract | M9 engine build + restore flow | 2804–2807 |
| S091 | D101: the ring-year per-domain presence bar is DEFERRED — belongs to the THRESHOLD REGISTER (Step 1 of the input map) where all numbers lock together; it locks with its siblings (qualifying-day floor, stage-year bar, twig bar). | D101; SCHEMA 2.4 threshold register | Threshold-register lock-step (register freezes at the engine contract, D116) | 2908–2914 |
| S092 | D102: live code migrates to the shared birth anchor (a data migration for existing users — the anchor = first in-window event, frozen; the Coach's shifting journal anchor is replaced); CoachSystem.md anniversary = the shared anchor — amend at the docs pass; the anchor rides in the backup format. | D102; birth anchor; CoachSystem.md | Implementation (data migration); docs pass | 2940–2949 |
| S093 | D105 dev-tools tuning surface: every register value must be PLAYABLE during the development/visual-testing phase — a dev-only debug panel that tweaks any number and drives a live re-derivation + re-render; the archetype mockups and the perf gate use it; NEVER shipped to users. The RESOURCE normalization ceiling (20 events/day) is calibrated via the dev tools at the paper-run step. | D105; SCHEMA 2.4 register | Development/visual-testing phase; MUST exist before any visual tuning (D117 B3) | 3035–3042 |
| S094 | D108 derivation protocol: incremental delta updates with ATOMIC SWAP; full re-derivation ONLY on first launch (D097), restore (D098), fingerprint mismatch, or register-version bump (dev tools); cache PERSISTED (first paint = current state instantly); derivation off-UI-thread (isolate); set-commutative fold (order-independent); single-writer lock (two-tab concurrency); ceremonies QUEUE — never interrupt an active session. | D108; SCHEMA 2.6; engine architecture | M9 Phase 0 (B2 state model / B4 derivation engine) | 3107–3144 |
| S095 | D109: formatVersion 3 (monotonic logFingerprint) + the viewed_moments table belong to the M10–M13 sync milestones — drafted at the docs pass. | D109; M10-M13 sync | Docs pass; M10–M13 sync work | 3158–3175 |
| S096 | D110: the tree's read surface = the event log + its own H3 owners ONLY — never the M7 analytics cache tables, never coach_outputs, never goal internals beyond the agreed owners; the M7 cache-vs-log arbitration happens at the docs pass. | D110; tree read-surface contract | Docs pass (M7 milestone arbitration) | 3210–3221 |
| S097 | D111: a DEUTERANOPIA PASS is a locked gate in the mockup + stress-test steps (no meaning rides on color alone — season announced in the strip's text line, tiers carry size/mark differences). | D111; tree-5; mockup + stress tests | M9 mockup + stress-test steps | 3239–3243 |
| S098 | D112: the blush palette decision is OPEN TO EDITS during implementation/visual testing — the tokens join the dev tools' playable surface (like the register numbers); the final blush treatment is tuned at the mockup step. | D112; TRAIT-SPACE.md palette | Implementation/visual testing; mockup step (M9 Phase 3) | 3286–3294 |
| S099 | D112/D113 17-audit: a systematic pass at the trait-space step (PLAN Step 7) assigning EVERY trait exactly one of four statuses — WIRED (data driver + manifestation moment), RESERVED-UNMAPPED (deliberately not wired, reason documented), STRUCTURAL (always-present anatomy), EXCLUDED-BY-DESIGN (permanent, D113); drivers are dev-tunable like register numbers; MUST precede the trait-driven visuals (D117 D1). | D112 + D113; TRAIT-SPACE.md | Trait-space step (PLAN Step 7) → M9 Phase 3 D1 | 3295–3308, 3349–3360 |
| S100 | D112 DV-C5: the Heartwood rename is DROPPED (all three "Heartwood" names stay) — the ambiguity is DOCUMENTED as a naming note at the docs pass, never renamed. | D112; Heartwood naming | Docs pass | 3323–3329 |
| S101 | D114 deferrals each carry a home: docs-pass amendment register (home: PLAN step 10); owner contracts (home: Step 6); perf-gate numbers F9/F10 (home: register at Step 6); mast-year + within-tier variance calibration (home: the paper run with the dev tools); test-strategy acceptance criteria (home: Step 9); emotional copy-language pass (home: the mockup step); terminology glossary (home: the docs pass). | D114; PLAN.md steps 6–10 | Per-home step (see each home) | 3403–3414 |
| S102 | D116: the register (SCHEMA 2.4, with all D116 amendments + additions C8-C13/A6-A7/E15) FREEZES at the engine contract — no further tuning after. | D116; SCHEMA 2.4 register | Engine contract (PLAN Step 8) → M9 Phase 0 | 3562–3565 |
| S103 | D088 verification: the archetype mockups + seeded-data stress tests include a botanical-contradiction check — a generated tree must pass every adaptation's axis signature or the engine does not ship. | D088; adaptation layer | M9 (engine does not ship until it passes) | 3770–3773 |
| S104 | D117 A1: the docs-pass amendment register — DecisionLog entries for D085–D117 (including this record; never complete without itself); Gamification.md (anchor/six-domain/qualifyingEntry); CoachSystem.md (anniversary = shared anchor); Roadmap.md (M7/M9 premises + the D060 supersession closure clause); Database.md (formatVersion 3 + logFingerprint + isBackfill + adoptedAt + event schema + viewed_moments — NOT StorageDecision.md, which carries no format); UIUX.md (tree tab + semantics contract). Home: the docs pass (PLAN step 10). | D117 A1; all amended docs | Docs pass (PRE-M9, opportunistic — any docs pass / adjacent milestone) | 3838–3850 |
| S105 | D117 A3: owner-contracts groundwork designed alongside their systems — qualifyingEntry (with M7 analytics), streak (with M7 gamification), goalProgress (with M5), coachEngagement (with M8 coach), dayActivityScore (calendar tint owner, M6), mediaPresence (with M10–M13 media). | D117 A3; H3 owner contracts | Alongside each owner's milestone (PRE-M9 opportunistic) | 3851–3856 |
| S106 | D117 A4: the emotional copy-language pass (dormancy copy, bank counter framing, empty-spring copy, legend card) happens with the UI copy work. | D117 A4; why-panel copy | With the UI copy work (PRE-M9 opportunistic) | 3857–3859 |
| S107 | D117 B1 (M9 Phase 0 — the engine foundation, the milestone's first phase): the RENDERER PERF SPIKE — prove the perf budget (≤16ms at LOD-1/2 on the target device tier, the F9 gate) with a minimal derived tree on a real device; the LOD ladder (LOD-1 mass / LOD-2 structure / LOD-3 detail), instanced procedural leaves, autumn leaf-fall re-bake + capped particles. | D117 B1; tree-5 perf | M9 Phase 0 (first) | 3860–3867 |
| S108 | D117 B2: the state model implementation — the derived cache (SCHEMA 2.6), logFingerprint, atomic swap, set-commutative fold, single-writer lock (D108/D109). | D117 B2; SCHEMA 2.6 | M9 Phase 0 | 3868–3870 |
| S109 | D117 B3: the dev-tools tuning surface (D105) — the debug panel that tweaks any register value and drives a live re-derivation + re-render; MUST exist before any visual tuning. | D117 B3; D105 dev tools | M9 Phase 0, before any visual tuning | 3871–3873 |
| S110 | D117 B4: the derivation engine — incremental protocol, axes (F4–F7 with the D116 pins), stage clock (B1–B5 with the D116 values), banking + tier schedule (D092/D095/D096). | D117 B4; derivation engine | M9 Phase 0 | 3874–3877 |
| S111 | D117 C (M9 Phase 1–2 — the organs): trunk/rings renderer, branches/twigs/forks (canopy rule), buds (D087), leaves (clusters + storage-leaf character), seasonal organ states (D095), adaptation manifests (D093/D116). | D117 C; organ renderers | M9 Phases 1–2 | 3878–3882 |
| S112 | D117 D (M9 Phase 3 — the visuals, order matters): D1 the trait-space 17-audit (Step 7) MUST precede the trait-driven visuals; D2 the archetype mockups — visual validation from the validated register numbers, the 19 paper-run archetypes as the gallery (gym-heavy year 6, sparse-stubborn's honest bare branches, balanced's first bloom, decade's old-growth, Mediterranean thin-by-design), heartwood language, cohesion check (D112 identity filters), deuteranopia + contrast gates (D111); D3 flowers/fruits/adaptations/seasonal-state visuals + ceremony language (D094) + why-panel copy engine. | D117 D1/D2/D3; L-15 placement (S053) | M9 Phase 3; D1 before D2 | 3883–3895 |
| S113 | D117 E (M9 Phase 4 — the navigation/feeds): the duality principle (D088 B) — each section UI as the local view of its organ (bud garden, sap monitor, orchard, garden). | D117 E; duality principle | M9 Phase 4 | 3896–3898 |
| S114 | D117 F (M9 Phase 5 — the anatomy views, VISION 16): root/stem/leaf cross-sections + the time-lapse replay (D097 yearly snapshots, the launch-day journey). | D117 F; anatomy views | M9 Phase 5 | 3899–3901 |
| S115 | D117 G (M9 Phase 6 — the review mode): the yearly review artifacts (rings + cross-sections + legend card). | D117 G; review mode | M9 Phase 6 | 3902–3903 |
| S116 | D117 H0: D-number collision — the ledger skill-install records D083/D084 collide with DecisionLog's already-recorded D083; the docs pass RENUMBERS the ledger pair (→ D118/D119) to avoid duplicate IDs. | D117 H0; DecisionLog numbering | Docs pass | 3905–3908 |
| S117 | D117 H1 (standing gate): seeded-data stress tests — the CODE version of the paper run: the 19 archetypes become the test fixtures; the tests must REPRODUCE the paper-run outcomes (stage timings, bank schedules, honest no-rings, anti-farm defeats, restore ratchet). | D117 H1; 19 archetypes as fixtures | M9 engine build (standing gate throughout) | 3909–3913 |
| S118 | D117 H2 (standing gate): the perf gates (F9) are milestone gates. | D117 H2; F9 perf gate | M9 milestone gates | 3914 |
| S119 | D117 H3 (standing gate): the coherence checks (axis signatures + identity filters across generated trees). | D117 H3; coherence checks | Throughout M9 | 3915–3916 |
| S120 | D117 H4 (standing gate): the deuteranopia + contrast passes (D111). | D117 H4; D111 | Throughout M9 | 3917 |
| S121 | D117 H5 (standing gate): the test strategy's acceptance criteria — the paper-run fixtures ARE the acceptance criteria. | D117 H5; test strategy | M9 test strategy (PLAN Step 9) | 3918–3919 |

---

## Footer

- **Line ranges covered (contiguous):** full ledger `TEMP-PLANNING.md`
  (lines 1–3922) read in full; instructions extracted from the contiguous
  span **lines 25–3919** (non-instruction spans — WHAT/product content —
  excluded). The D117 handoff tail (lines 3920–3922, LANDS) contains no
  separate instructions beyond those listed.
- **Total instruction count: 121** (S001–S121).
- **Milestone/unbuilt-gate-dependent instructions (kept here with their
  target milestone — NOT dropped as "future"):**
  - **M9 (Life Tree milestone) — the largest cluster:** S053 (L-15
    placement → M9 Phase 3), S087 (session-plan steps 4–9), S088/S089
    (launch-day replay + contract), S090 (cache rebuild), S093/S094
    (dev tools + derivation protocol), S097 (deuteranopia gate), S098
    (blush tuning), S099 (17-audit), S102 (register freeze), S103
    (botanical-contradiction check), S107–S115 (the M9 phase order:
    engine foundation → organs → visuals → navigation → anatomy →
    review), S117–S121 (standing gates H1–H5), and S104/S105/S106
    (PRE-M9 opportunistic: docs-pass register, owner contracts, copy
    pass).
  - **M7 (Analytics & Gamification):** S031 (F-25), S033 (F-27), S060
    (C-07), S085 (tree depends on M7 feeds), S105 (qualifyingEntry +
    streak owners with M7).
  - **Coach rule-book session (M8 planning):** S014 (engine-2 test
    plan), S015 (LLM access mechanics), S027 (F-19/F-20 load unit),
    S061 (C-12), S063 (C-14), S075, S076, S081 (leftover coach
    candidates).
  - **M3 / M3+ / M3b (Nutrition):** S034 (N-09 at build), S036 (M3b
    milestone), S038 (N-10 two-scope build order), S039 (N-17
    born-ready engine), S040 (N-07 scope split).
  - **M6 (Calendar & Periods):** S069 (atlas leftover), S105
    (dayActivityScore owner with M6).
  - **M5 (Goals & Tasks):** S105 (goalProgress owner with M5).
  - **M4 (Routine & Briefing):** S045 (L-13 scope + future-only edits).
  - **M1 (Journal):** S020 (J5 long-horizon page), S055 (J5 hidden
    memories), S062 (C-13 after J1 ships).
  - **M10–M13 (Drive P2/P2.5/P3):** S078 (encrypted export), S095
    (formatVersion 3 + viewed_moments), S105 (mediaPresence owner).
  - **UI/UX ordering pass (planned pass, not a milestone):** S049
    (L-14), S068 (command palette), S071 (default-inbox), S074 (goal
    ring), S086 (tree tab placement).
  - **Real-use-triggered (no milestone):** S072 (one-entry-per-day —
    catch-up spirals in real use), S073 (smart-fill — habits/grace v2
    work), S080 (quote-old-self — C-08 links ship).