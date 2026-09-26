# Integration ID Census — TEMP-PLANNING.md (gen-2 ledger)

**Stage:** A1a — ID Census (Indexer) · **Framework:** TempPlanning-Integration-Framework-v6-final + Pipeline-Framework-v7-Gen2-Delta (where the delta disagrees with v6-final, the delta wins) · **Date:** 2026-09-26 · **Source:** `TEMP-PLANNING.md` (3922 lines, generation-2 ledger — refactor & Life Tree design) · **Artifact:** this file, `docs/IntegrationIDCensus.md`

**Method (per the A1a prompt):**
1. `docs/UIUX.md` read in full FIRST (390 lines — held in context for later stages).
2. `TEMP-PLANNING.md` read in full in seven contiguous chunks covering every line (ranges confirmed in the footer).
3. The ledger's own disambiguation legend ("LABEL FAMILIES — DISAMBIGUATION LEGEND", lines 40–69) treated as ground truth for family boundaries — no family groupings invented where the legend defines one.
4. Every ID enumerated per family, INCLUDING REJECTED / SKIPPED / DECLINED / NOTED entries (they need a documented resting place downstream, not disappearance).
5. The gen-1 families (plain items 1–37, O/I/NU-series, backup-A…spec-E, TENSION, clash, G/J/R/H, M0–M7…) are ARCHIVED — not hunted for. The live families are the gen-2 families below.
6. Author-cited line ranges in the ledger's entries were carried/trusted and spot-checked against the live docs/ files (24 checks — report below); none flagged as wrong.

---

## Disambiguation legend (reproduced from TEMP-PLANNING.md lines 40–69 — ground truth, not re-derived)

| Family | IDs | Meaning |
|---|---|---|
| candidate-C | C-01 … C-15 | Research-incorporation candidates from research-journaling/MASTER-Journaling-Research.md (never conflate with backup-C, audit-C, or spec-E families from gen-1 — those are archived) |
| candidate-F | F-01 … F-32 | Fitness research candidates from research-fitness/MASTER-Fitness-Research.md (new gen-2 family) |
| candidate-N | N-01 … N-18 | Nutrition research candidates from research-nutrition/MASTER-Nutrition-Research.md (gen-2 family) |
| candidate-L | L-01 … L-15 | LifeOS research candidates from research-lifeos/MASTER-LifeOS-Research.md (gen-2 family) |
| audit | audit-1 … audit-13 | Refactor-audit checklist anchors (open-items checklist incl. incorporate/unlocks/life-tree; maps to APP MAP areas) |
| tree | tree-1 … tree-7 | Life Tree DESIGN SYSTEM subsections (tree-1..tree-6 = the design dims - FILLED BY tree-7 decision records D085-D117; tree-7 = the DESIGN SESSION DECISIONS - the authoritative record) |
| engine | engine-1, engine-2 | Cross-cutting discipline blocks (logging friction; Coach heuristic engine — engine-2 token: NOTED = required-discipline flag, details locked at the rule-book session) |
| D-records | D085 … D117 | The decision-log records (33 headers in the body — the tree-7 decision records; D060 exists only as a supersession cross-ref, D082+ implied for LOCKED entries) |
| — | AGREED IN PRINCIPLE · PENDING | Additional status tokens in use: AGREED IN PRINCIPLE = concept approved, full setup deferred to its activation milestone (F-27); PENDING = deferred to another section decision (example: C-15 was deferred to the Life Tree section and is now RESOLVED-ABSORBED — the PENDING token is no longer in active use, every candidate is decided). Both carry an activation/revisit note; neither is draftable as decided content. |

Format rule for every entry in the source: the FIRST line is `- <FAMILY>-<ID> <NAME> (<STATUS>, user yes — note):` — the status token is always in the parentheses right after the name. Rejected entries carry a RESTING PLACE line (do-not-resurrect contract). Skipped entries carry a REVISIT line (trigger that re-opens them). Both must survive any docs pass.

---

## Table 1 — candidate-C (journaling research candidates; C-01 … C-15)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| candidate-C | C-01 | QUICK CHECK-IN | 2076–2079 | REJECTED (user) — cheap tier closed; RESTING PLACE: dead — do not resurrect without a new use case |
| candidate-C | C-02 | JOURNALING SUGGESTIONS | 2080–2082 | REJECTED (user) — cheap tier closed; RESTING PLACE: dead |
| candidate-C | C-03 | AUTO-CONTEXT CAPTURE | 1863–1897 | LOCKED, user yes — shaping done; PENDING SUB-ITEM inside the LOCKED entry: weather chip (line 1879, ships only after the DecisionLog dependency decision) |
| candidate-C | C-04 | MOOD AS FIRST-CLASS + CORRELATIONS | 2083–2087 | REJECTED (user); RESTING PLACE: dead (per-area mood fields inside C-07 remain possible — not this candidate) |
| candidate-C | C-05 | MEMORY HYGIENE | 1898–1914 | LOCKED, user yes — hide controls only; inner REJECTED (verbatim): reply-to-your-past-self (StoryPad pattern) |
| candidate-C | C-06 | THEN & NOW SELFIE COMPARE | 1915–1925 | LOCKED, user yes |
| candidate-C | C-07 | LIFE AREAS V2 — SUPERTAGS WITH FIELDS + PORTALS | 2006–2028 | SKIPPED for now (user) — recorded for future; REVISIT: when M7 analytics work starts, or when the Life Tree branch-detail design needs the data |
| candidate-C | C-08 | WIKILINKS + UNLINKED-MENTION SUGGESTIONS | 1926–1959 | LOCKED, user yes — Settings toggle, ON by default; PENDING SUB-ITEM inside the LOCKED entry: unlinked-mention suggestion (line 1957, privacy-stamp gated) |
| candidate-C | C-09 | GENTLE RETURN + PAUSE | 1960–1982 | LOCKED, user yes — repair tokens REJECTED (verbatim inner rejection; keep grace simple) |
| candidate-C | C-10 | YEAR IN PIXELS MOSAIC | 2088–2092 | SKIPPED (user) — recorded for future; REVISIT: anytime; natural Life Tree annual-ring visual if the tree design wants it |
| candidate-C | C-11 | VOICE-NOTE ENTRY TYPE | 1983–2005 | LOCKED, user yes — audio now, transcription future-only |
| candidate-C | C-12 | PROMPT LIBRARY | 2029–2044 | SKIPPED for now (user) — recorded for future; REVISIT: when the Coach rule-book session plans prompt-driven nudges, or if blank-page friction shows up in real use |
| candidate-C | C-13 | EPHEMERAL DAILY REVIEW RITUAL | 2045–2062 | SKIPPED for now (user) — recorded for future; REVISIT: after J1 ships and the memory strip proves itself |
| candidate-C | C-14 | CONTEXT-TIMED NUDGES — COACH SCHEDULING LAYER | 2063–2075 | SKIPPED for now (user) — recorded for future; REVISIT: the Coach rule-book session (M8 planning) |
| candidate-C | C-15 | LIFE TREE EMOTIONAL ENGINE | 2093–2102 | RESOLVED - ABSORBED, user yes - 2026-09-26; the components are locked across D085-D117 (was the legend's PENDING example; now resolved) |

## Table 2 — candidate-F (fitness research candidates; F-01 … F-32)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| candidate-F | F-01 | INLINE PREVIOUS-SESSION COMPARISON | 132–143 | LOCKED, user yes |
| candidate-F | F-02 | LOGGING-SCREEN ANATOMY | 186–236 | LOCKED, user yes — comparison talk done; compound-not-disrupt confirmed |
| candidate-F | F-03 | PR CELEBRATION CEREMONY | 237–266 | LOCKED, user yes — functional rules; DESIGN LANGUAGE DEFERRED to the Life Tree design session |
| candidate-F | F-04 | PLATE + WARM-UP CALCULATORS | 144–159 | LOCKED, user yes — math must be solid |
| candidate-F | F-05 | SET LABELS WARM-UP/WORKING/FAILURE | 267–323 | LOCKED, user yes — all open points resolved; full design |
| candidate-F | F-06 | PR GRID 1RM/2RM/3RM…nRM | 160–169 | LOCKED, user yes |
| candidate-F | F-07 | FILTERABLE CALENDAR HIGHLIGHTS | 170–183 | LOCKED, user yes |
| candidate-F | F-08 | MEV/MAV/MRV VOLUME BANDS + DECISION TABLE | 452–496 | LOCKED, user yes — canonical numbers recorded |
| candidate-F | F-09 | EXPECTED-VS-ACTUAL EFFORT TABLE | 379–394 | LOCKED, user yes — silent by default, optionally visible |
| candidate-F | F-10 | TM ADJUSTMENT RULES ON EPLEY | 497–522 | LOCKED, user yes — canonical numbers recorded |
| candidate-F | F-11 | INACTIVITY DECAY + PR RESET-TO-BASELINE | 395–429 | LOCKED, user yes — correlated with the existing off-week/vacation/deload systems; sensitive numbers warn |
| candidate-F | F-12 | GZCLP STAGE-CASCADE STALL RULE | 430–451 | LOCKED, user yes — both decision points agreed |
| candidate-F | F-13 | LIBRA EMA TREND + TREND/RATE/PREDICTION LAYERS | 523–584 | LOCKED, user yes — questions answered; long-horizon gap recorded |
| candidate-F | F-14 | RATE-VS-TARGET BAR + WATER-JUMP DOTS | 585–604 | LOCKED, user yes |
| candidate-F | F-15 | MILESTONE HERO RING + FORECAST RANGE + 2-WEEK COPY | 605–625 | LOCKED, user yes |
| candidate-F | F-16 | EYES-CLOSED + ONE-TAP WEIGH-IN | 626–643 | LOCKED, user yes |
| candidate-F | F-17 | STANDARDS VAULT HONESTY — POPULATION LABELS + BW MULTIPLES + SOURCE STAMPS | 644–681 | LOCKED, user yes — both decision points agreed |
| candidate-F | F-18 | STRENGTH SCORE — IPF DOTS OVER THE BIG-5 | 682–721 | LOCKED, user yes — both readouts: per-lift + one meta score; vault-only display |
| candidate-F | F-19 | TRAINING FORM — CTL/ATL/TSB | 722–766 | LOCKED, user yes — N5 revival, honest, hardware-free |
| candidate-F | F-20 | RAMP-RATE GUARDRAILS + RECOVERY-TIME ESTIMATE | 767–784 | LOCKED, user yes — both decision points my takes |
| candidate-F | F-21 | SIX-LEVEL CHECK-IN LADDER | 803–811 | REJECTED (user) — flexibility concern; rejected after discussion; RESTING PLACE: dead — do not resurrect without a new use case |
| candidate-F | F-22 | ONE-TAP POST-WORKOUT FEEDBACK | 812–818 | REJECTED (user) — same category as F-21; RESTING PLACE: dead |
| candidate-F | F-23 | PRE-SESSION ADAPT AFFORDANCE | 785–802 | LOCKED, user yes — my takes accepted |
| candidate-F | F-24 | WEEKLY COACH MESSAGE DEPTH | 819–845 | LOCKED, user yes — 3–5 lines |
| candidate-F | F-25 | WEEKLY STREAKS + EARNED SAVERS — GRACE V2 FITNESS | 846–882 | SKIPPED for now (user) — recorded for future, full design; REVISIT: activation trigger — when M7 gamification planning begins (or fitness-streak work starts) |
| candidate-F | F-26 | SKILL-TREE PROGRESSION LADDER — REP-MODE | 883–901 | SKIPPED for now (user) — recorded for future, full design; REVISIT: when rep-mode exercise work starts (M2 build or later) |
| candidate-F | F-27 | ADHERENCE + SITUATION TROPHIES | 902–937 | AGREED IN PRINCIPLE (user) — FULL PROPOSAL DOCUMENTED; planning to be ACTIVATED at the achievement/gamification milestone; ACTIVATION TRIGGER: the M7 gamification/achievement milestone (or any trophy-catalog work) |
| candidate-F | F-28 | SETS-PER-MUSCLE-WEEK CHART + VOLUME HEATMAP | 938–977 | LOCKED, user yes |
| candidate-F | F-29 | MOVEMENT-BALANCE RATIOS | 978–993 | LOCKED, user yes — my takes on both decision points |
| candidate-F | F-30 | NSPI-STYLE COMPOSITE — FOLDED | 994–1012 | LOCKED, user yes: DOTS is the ONLY meta score; readouts live ONLY in the weekly message |
| candidate-F | F-31 | GYM PROFILES / EQUIPMENT PRESETS | 1013–1016 | REJECTED (user); RESTING PLACE: dead — do not resurrect without a new use case |
| candidate-F | F-32 | MOVEMENT-PATTERN REPLACEMENT | 1017–1020 | REJECTED (user); RESTING PLACE: dead — do not resurrect without a new use case |

## Table 3 — candidate-N (nutrition research candidates; N-01 … N-18)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| candidate-N | N-01 | HISTORY/RECENT-FIRST LOGGING + PROVENANCE BADGES | 1038–1057 | LOCKED, user yes - all decision points accepted |
| candidate-N | N-02 | USDA FDC SEED + PRIVATE NAMESPACE - TIERED DATA ARCHITECTURE | 1092–1188 | LOCKED, user yes - all four decisions confirmed |
| candidate-N | N-03 | ADHERENCE-NEUTRAL COMPLIANCE MATH | 1058–1071 | LOCKED, user yes (decision body: "my take, CONFIRMED at the N-series walkthrough — the series closed LOCKED with user approval; the marker below was pre-walkthrough text") |
| candidate-N | N-04 | PLAN-CONFIRM LOGGING + GAP REBALANCE | 1189–1205 | LOCKED, user yes - both decision points my takes accepted |
| candidate-N | N-05 | PACK MODEL - RECIPE -> BATCH -> CONTAINERS -> CONSUME | 1206–1238 | LOCKED, user yes - mixed batches included by user decision |
| candidate-N | N-06 | FREE-FOODS LIST | 1266–1287 | LOCKED, user yes - both decision points agreed |
| candidate-N | N-07 | IMPLIED-TDEE INSIGHT | 1393–1481 | LOCKED, user yes - ALL decision points D1-D7 approved; the TDEE deep-dive, complete design |
| candidate-N | N-08 | EXERCISE KCAL DISPLAY-ONLY | 1382–1392 | LOCKED, user yes - both decision points agreed |
| candidate-N | N-09 | BARCODE SCANNER | 1022–1037 | LOCKED, user yes - gen-2 approval; D069 distinction recorded |
| candidate-N | N-10 | ONE-TIME RECIPE SUBSTITUTION | 1239–1265 | LOCKED, user yes - two-scope cascade + macro-range adherence condition |
| candidate-N | N-11 | GRAM-ANCHORED PORTION STEPPER UX | 1072–1084 | LOCKED, user yes (decision body: "my take, CONFIRMED at the N-series walkthrough — the series closed LOCKED with user approval; the marker below was pre-walkthrough text") |
| candidate-N | N-12 | DENSITY FACTS AS NEUTRAL COACH LINES | 1331–1349 | LOCKED, user yes - both decision points my takes accepted |
| candidate-N | N-13 | ESTIMATE-FRAMING + TAP-TO-EXPLAIN | 1482–1521 | LOCKED, user yes - part of the approved TDEE deep-dive |
| candidate-N | N-14 | PER-MEAL PROTEIN PACING COACH FACTS | 1350–1363 | LOCKED, user yes - both decision points my takes accepted |
| candidate-N | N-15 | EATING-WINDOW AWARENESS | 1288–1308 | LOCKED, user yes - both decision points agreed |
| candidate-N | N-16 | VEGGIE SERVINGS + WATER HABIT CHECK-INS | 1364–1381 | LOCKED, user yes - both decision points my takes accepted |
| candidate-N | N-17 | DIET-MODE RE-DERIVATION - FUTURE-CAPABILITY SCOPED NOW | 1309–1330 | LOCKED, user yes - both decision points agreed; REVISIT: when new phase types / diet modes are actually proposed |
| candidate-N | N-18 | VENDOR-RESILIENT EXPORT FOR FOODS/RECIPES | 1085–1091 | LOCKED, user yes |

## Table 4 — candidate-L (LifeOS research candidates; L-01 … L-15)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| candidate-L | L-01 | NATURAL-LANGUAGE CAPTURE + CURATED TODAY | 1523–1545 | LOCKED, user yes - both decision points my takes accepted |
| candidate-L | L-02 | 2-DAY SLIP INDICATOR + LOGBOOK WON-ARCHIVE | 1546–1567 | LOCKED, user yes - decision (a) accepted; (b) noted with future-UI caveat |
| candidate-L | L-03 | PACE LINE GOAL VISUALIZATION | 1568–1588 | LOCKED, user yes - decision (a) accepted; (b) recorded for future UI |
| candidate-L | L-04 | LIVE FINISH ESTIMATE | 1589–1594 | REJECTED (user) - skipped; RESTING PLACE: dead - do not resurrect without a new use case. NOTE: the header line uses a double dash "- - L-04" (format quirk, recorded — not silently corrected) |
| candidate-L | L-05 | POST-RUN EXPECTED-VS-ACTUAL REPORT | 1595–1611 | LOCKED, user yes - both decision points my takes accepted |
| candidate-L | L-06 | PLAN-VS-ACTUAL DAY-VIEW LINE | 1646–1680 | LOCKED, user yes - the signature feature; decision (c) accepted; (a)+(b) recorded with future-UI caveat |
| candidate-L | L-07 | SHOW-IF-NOT-EMPTY BLOCKS | 1681–1699 | LOCKED, user yes - my takes accepted; subject to future UI/UX development changes - noted |
| candidate-L | L-08 | NEUTRAL DEVIATION BADGES | 1612–1627 | LOCKED, user yes - both decision points my takes accepted |
| candidate-L | L-09 | PER-BLOCK SKELETONS, RETURNING-USERS-ONLY | 1733–1758 | LOCKED, user yes - all UI details recorded; may change during future UI passes - noted |
| candidate-L | L-10 | RULE-BASED CROSS-DOMAIN INSIGHT ENGINE | 1760–1806 | LOCKED, user yes - all three decision points accepted; STRESS-TESTING REQUIRED - noted |
| candidate-L | L-11 | SPRAWL GUARDRAIL | 1808–1825 | LOCKED, user yes - all my takes passed |
| candidate-L | L-12 | NUMBERS>CHARTS GLANCE / CHARTS>NUMBERS ANALYSIS | 1700–1716 | LOCKED, user yes - recorded; future UI/UX may change - noted |
| candidate-L | L-13 | WEEK-PATTERN ROUTINE SCHEDULING | 1628–1645 | LOCKED, user yes - both decision points my takes accepted |
| candidate-L | L-14 | STRENGTH-VS-HEATMAP ORDER | 1717–1732 | LOCKED - decision (a) accepted; (b) HELD for the UI/UX ordering pass |
| candidate-L | L-15 | LIFE-SCALE GRID | 1826–1851 | LOCKED as a DESIGN FEED - user: feed only; tree-session placement decision; PLACEMENT DEFERRED to D117 D1/D2 (the M9 trait-space + mockup step). NOTE: the token "LOCKED as a DESIGN FEED" is not one of the legend's standard tokens (LOCKED/SKIPPED/REJECTED/AGREED IN PRINCIPLE/PENDING) — the entry body defines it as the standard LOCKED with a feed-only scope note; recorded for the pipeline |

## Table 5 — audit (refactor-audit checklist anchors; audit-1 … audit-13)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| audit | audit-1 | Refactor audit: dashboard (blocks, density, glance-value) (incl. shell-level concerns - see APP MAP note) | 73 | Open-items checklist — `[ ]` unchecked (no decision yet; anchor for APP MAP item 3) |
| audit | audit-2 | Refactor audit: journal (compose, timeline, search, media) | 74 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 4) |
| audit | audit-3 | Refactor audit: habits (check-off, streak, review) | 75 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP items 5 and 12 — routine slots are habit-adjacent) |
| audit | audit-4 | Refactor audit: gym (session, history, PR, standards) | 76 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 10) |
| audit | audit-5 | Refactor audit: nutrition (log, targets, macros) | 77 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 11) |
| audit | audit-6 | Refactor audit: body/weight (weigh-in, trends, physique) | 78 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 10 — fitness AND body both live here) |
| audit | audit-7 | Refactor audit: media (capture, archive, vault) | 79 | Open-items checklist — `[ ]` unchecked |
| audit | audit-8 | Refactor audit: settings (groups, reachability) (incl. shell-level concerns - see APP MAP note) | 80 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 6) |
| audit | audit-9 | Refactor audit: achievements/rings surface | 81 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP items 9 + 15) |
| audit | audit-10 | Refactor audit: coach lines/surfaces | 82 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP items 15 + 16) |
| audit | audit-11 | Incorporate list (user picks, per item: app + why + what to copy) | 83 | Open-items checklist — `[ ]` unchecked (anchor for APP MAP item 13 — goals) |
| audit | audit-12 | Unlocks & extras list (user picks) | 84 | Open-items checklist — `[ ]` unchecked (the "Unlocks & extras" section at lines 2239–2243 is still `_TO FILL_`) |
| audit | audit-13 | LIFE TREE DESIGN SYSTEM (main goal — see below) | 85 | Open-items checklist — `[ ]` unchecked (main-goal audit; the tree-7 session + D117 effectively complete this goal — prior ledger audits noted the checkbox was never ticked; recorded as-is) |

## Table 6 — tree (Life Tree DESIGN SYSTEM subsections; tree-1 … tree-7)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| tree | tree-1 | Vision & metaphor | 2355–2359 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + life-tree-design/VISION.md - see the decision records; superseded |
| tree | tree-2 | Tree anatomy (visual system) | 2360–2370 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + SCHEMA 2.3/2.4/2.5 - see the decision records; superseded |
| tree | tree-3 | Growth data (100% derived - never write-path) | 2371–2380 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + SCHEMA 2.6 + D108 - see the decision records; superseded |
| tree | tree-4 | Surfaces & interaction | 2381–2388 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + D094/D095/D099 - see the decision records; superseded |
| tree | tree-5 | Render & performance | 2389–2393 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + D111 + the F9 gate - see the decision records; superseded |
| tree | tree-6 | Implementation plan | 2394–2397 | SKELETON - design dim; FILLED BY tree-7 (D085-D117) + D117 the development handoff - see the decision records; superseded |
| tree | tree-7 | DESIGN SESSION DECISIONS (the schema session record — D-numbers per LANDS) | 2398–3922 (session plan at 2399–2412; the D085–D117 records below) | Authoritative record — the 10-step SESSION PLAN with statuses (life-tree-design/PLAN.md), plus the D085–D117 decision records (Table 8) |

## Table 7 — engine (cross-cutting discipline blocks; engine-1, engine-2)

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| engine | engine-1 | LOGGING FRICTION DISCIPLINE | 324–343 | LOCKED, user yes — applies to ALL M2 logging work, documented here |
| engine | engine-2 | COACH HEURISTIC ENGINE — REQUIRED DISCIPLINE | 344–378 | NOTED — needed; details locked later at the Coach rule-book session (required-discipline flag; the token NOTED is defined in the legend row) |

## Table 8 — D-records (tree-7 decision records; D085 … D117 — 33 headers)

All 33 headers are `LOCKED, user yes` in the source. D082+ is the implied convention for every LOCKED entry across all series (LANDS CONVENTION, line 94). D060 exists only as a supersession cross-ref, NOT a ledger header. D083/D084 are ledger skill-install records inside the range-adjacent numbering — they collide with DecisionLog's already-recorded D083 and are renumbered (→D118/D119) at the docs pass (D117 H0, delta §3). The file records D089 and D088 AFTER D116 (out of numeric order) — ordering quirk only, recorded not corrected.

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| D-records | D085 | SEASONALITY DRIVER | 2413–2430 | LOCKED, user yes - Option C layered |
| D-records | D086 | SUPER-HARD ACHIEVEMENT VISUAL | 2431–2448 (+ TREE-7 ADDENDUM 2449–2456, a plan amendment, not a separate header) | LOCKED, user yes - Option C hybrid |
| D-records | D087 | HABIT MAPPING | 2457–2470 | LOCKED, user yes - Option C, habits as BUDs |
| D-records | D088 | LIFE TREE BRANCH SYSTEM + ADAPTATION LAYER + GRADIENT COHERENCE | 3594–3830 (recorded after D116 in the file) | LOCKED, user yes - recorded in absolute detail (includes the RECORDING-AUDIT FOLLOW-UPS a–i, lines 3802–3830) |
| D-records | D089 | MODIFICATION RARITY SPLIT | 3566–3593 (recorded after D116 in the file) | LOCKED, user yes - amends D088 C |
| D-records | D090 | THE MASTER CLOCK + ANCHORS | 2471–2504 | LOCKED, user yes - 2026-08-29; Resolution #1 of the loophole session |
| D-records | D091 | FLOWER OVERLAY, TROPHIES UNCHANGED | 2505–2517 | LOCKED, user yes - 2026-08-29 |
| D-records | D092 | FIRST-BLOOM CONTRACT + TIER SCHEDULE | 2518–2547 | LOCKED, user yes - 2026-08-29; Resolution #2 of the loophole session |
| D-records | D093 | MODIFICATIONS SCHEDULE + TENURE-FLOOR REFINEMENT | 2548–2588 | LOCKED, user yes - 2026-08-29; amends D088 C + D089 |
| D-records | D094 | STAGE-TRANSITION UX | 2589–2639 | LOCKED, user yes - 2026-08-29; Resolution #3 of the loophole session |
| D-records | D095 | SEASONAL ORGAN-STATE MODEL | 2640–2682 | LOCKED, user yes - 2026-08-29; Resolution #4 of the loophole session; amends D092 rule 3 |
| D-records | D096 | EARLY-FIRE EXPRESSION CONTRACT | 2683–2727 | LOCKED, user yes - 2026-08-29; Resolution #5 of the loophole session |
| D-records | D097 | LAUNCH-DAY CONTRACT | 2728–2768 | LOCKED, user yes - 2026-08-29; Resolution #6 of the loophole session; resolves N-1 + N-7 (N-7 premise OVERTURNED by D100) |
| D-records | D098 | RESTORE/BACKUP CONTRACT | 2769–2813 | LOCKED, user yes - 2026-08-29; Resolution #7 of the loophole session; resolves N-2 |
| D-records | D099 | THE CAPS + MEDIA AGGREGATION + MIRROR BOUNDARY | 2814–2844 | LOCKED, user yes - 2026-08-29; Resolution #8 of the loophole session; resolves N-4, N-5, N-6 |
| D-records | D100 | THE RETROACTIVE RULE - THE TWO-TIER SPLIT | 2845–2880 | LOCKED, user yes - 2026-08-29; Step-0 arbitration #1 of the wave-2 session; resolves A C-1 + B C-02; overturns wave-1 N-7 |
| D-records | D101 | THE QUALIFYING-YEAR DEFINITION - TWO NAMED YEAR TYPES | 2881–2916 | LOCKED, user yes - 2026-08-29; Step-0 arbitration #2; resolves F-03 |
| D-records | D102 | THE BIRTH ANCHOR - ONE SHARED ANCHOR FOR THE WHOLE APP | 2917–2949 | LOCKED, user yes - 2026-08-29; Step-0 arbitration #3; resolves A C-2 + F-04 + H-01 |
| D-records | D103 | THE TRIGGER AUTHORITY, RESTATED | 2950–2984 | LOCKED, user yes - 2026-08-29; Step-0 arbitration #4; resolves F-23 |
| D-records | D104 | THE CANONICAL DOMAIN TABLE - THE TWO-LEVEL MODEL | 2985–3018 | LOCKED, user yes - 2026-08-29; Step-0 arbitration #5; resolves F-02 + F-17 |
| D-records | D105 | THE THRESHOLD REGISTER + DEV-TOOLS TUNING SURFACE | 3019–3044 | LOCKED, user yes - 2026-08-29; the input map's Artifact 2; groups A-F all approved |
| D-records | D106 | THE TRIGGER-CORRELATION TABLE + F-03 NO-BLOOM | 3045–3066 | LOCKED, user yes - 2026-08-29; the input map's Artifact 3; D103's deliverable |
| D-records | D107 | THE TREE-STATE DATA MODEL - THE LEAN FORM | 3067–3103 | LOCKED, user yes - 2026-08-29; Step-3 deliverable #1 of the wave-2 session; resolves IA-1 |
| D-records | D108 | THE DERIVATION PROTOCOL | 3104–3147 | LOCKED, user yes - 2026-08-29; Step-3 deliverable #2; resolves G P-04 + C-3 + IA-10 + IA-9 |
| D-records | D109 | THE DEVICE-STATE CLUSTER | 3148–3175 | LOCKED, user yes - 2026-08-29; Step-4 of the wave-2 session; resolves R9 C-1 + C-2 + C-4 |
| D-records | D110 | THE PRIVACY/COPY BOUNDARY + L10N | 3176–3221 | LOCKED, user yes - 2026-08-29; Step-5 of the wave-2 session; resolves H-02, H-05, H-07, IA-2, IA-5, IA-6, IA-8 |
| D-records | D111 | THE SURFACE/RENDER CLUSTER | 3222–3274 | LOCKED, user yes - 2026-08-29; Step-6 of the wave-2 session; resolves D C-1/C-2/C-3, G P-01/P-03, D M-1/M-3/M-5 |
| D-records | D112 | THE DESIGN-IDENTITY CLUSTER | 3275–3329 | LOCKED, user yes - 2026-08-29; Step-7 of the wave-2 session; resolves DV-C1..C5 |
| D-records | D113 | THE ECONOMY RESIDUALS + THE 17-AUDIT AMENDMENT | 3330–3363 | LOCKED, user yes - 2026-08-29; Step-8 of the wave-2 session; resolves IA-3, IA-4, B M-05, B M-09 |
| D-records | D114 | THE CLOSURE ROUND | 3364–3414 | LOCKED, user yes - 2026-08-29; the final re-audit's fixes; resolves the consistency + adversarial audits' findings |
| D-records | D115 | THE GATE-DEADLOCK FIX + THE FINAL RECONCILIATIONS | 3415–3458 | LOCKED, user yes - 2026-08-29; the relentless audits' must-fixes |
| D-records | D116 | THE PAPER-RUN CORRECTIONS | 3459–3565 | LOCKED, user yes - 2026-08-29; the 19-archetype run's full correction set (D1–D11, S1–S16, recorded facts) |
| D-records | D117 | THE DEVELOPMENT HANDOFF PLAN | 3831–3922 | LOCKED, user yes - 2026-08-29; the clean step plan to launch AT the Life Tree milestone (M9); includes H0 the D-number collision note (D083/D084 → D118/D119) |

**Ledger D-number records OUTSIDE the D085–D117 header family (recorded for the docs pass, NOT census headers):**

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| D-records (ledger note) | D082+ | LANDS CONVENTION (audit finding — recorded, GENERALIZED) | 94 | The house rule requires a D-number per decision (D082+, continuing through D117) — READ IT AS IMPLIED for every LOCKED entry across ALL series (C/F/N/L + the tree-7 decisions) |
| D-records (ledger note) | D083 | SKILL INSTALL - FLUTTER-EXPERT | 115–130 | LOCKED, user yes - 2026-08-29; collides with DecisionLog's already-recorded D083 — the docs pass RENUMBERS the ledger pair (→D118) per D117 H0 / delta §3 |
| D-records (ledger note) | D084 | SKILL INSTALL - SECURITY SUITE x2 | 95–114 | LOCKED, user yes - 2026-08-29; collides with DecisionLog's already-recorded D083 — renumbered (→D119) at the docs pass |
| D-records (ledger note) | D060 | SUPERSESSION (recorded — Roadmap.md:283-288 fitness surface CLOSED) | 131 | RECORDED cross-ref only — NOT a ledger header; the gen-2 fitness mandate (user-approved F-series) SUPERSEDES D060 for the named locked candidates; the closure list is amended at the docs pass (D082+ entry records the override) |

## Table 9 — Research leftovers (recorded, NO decision yet — section header at lines 2104–2111)

Section self-directs (lines 2109–2111): LANDS = docs/DecisionLog.md as OPEN ITEMS, category = deferred (framework default for un-decisioned material, D038/D039 precedent). Status token used: NOTED (no lock, no rejection).

| Family | ID | Short label | Source lines | Status text found |
|---|---|---|---|---|
| Research leftovers | (RL-1) | OCR SEARCH OVER ATTACHED PHOTOS | 2113–2116 | NOTED — future; Evernote/OneNote/Keep/Bear pattern (master steal #28; gap Tier 1 #5); revisit when J2 ships |
| Research leftovers | (RL-2) | REGEX-CAPABLE SEARCH | 2117–2118 | NOTED — J2 detail; Zettlr pattern (#29); fold into J2's matcher design if trivial |
| Research leftovers | (RL-3) | COMMAND PALETTE (Ctrl+P) | 2119–2120 | NOTED — GUI; Obsidian pattern (#34); belongs to the UI/UX ordering pass |
| Research leftovers | (RL-4) | ATLAS / MAP VIEW OF ENTRIES | 2121–2123 | NOTED — future; Diaro/Day One/Journey pattern (#36); revisit at M6 |
| Research leftovers | (RL-5) | MULTIPLE JOURNALS vs SINGLE TIMELINE | 2124–2127 | NOTED — design pole, #42; current direction: single timeline + Life Areas; recorded so the docs pass doesn't re-open it silently |
| Research leftovers | (RL-6) | DEFAULT-INBOX + TRIAGE | 2128–2129 | NOTED — capture GUI, #44; belongs to the UI/UX ordering pass |
| Research leftovers | (RL-7) | ONE-ENTRY-PER-DAY CONSTRAINT MODE | 2130–2131 | NOTED — pole, #60; revisit if catch-up spirals show in real use |
| Research leftovers | (RL-8) | SMART FILL BACKFILL | 2132–2133 | NOTED — future, #61; revisit with habits/grace v2 work |
| Research leftovers | (RL-9) | GOAL/STREAK PROGRESS RING IN EDITOR | 2134–2135 | NOTED — GUI, #63; belongs to UI/UX ordering pass |
| Research leftovers | (RL-10) | NO-FAIL JOURNALING | 2136–2137 | NOTED — coach, #64; Coach rule-book session candidate |
| Research leftovers | (RL-11) | OPTIONAL FOCUS GATE | 2138–2139 | NOTED — coach, #65; Coach rule-book session candidate |
| Research leftovers | (RL-12) | PRIVACY-FIRST ONBOARDING COPY | 2140–2141 | NOTED — UX, #67; belongs to welcome/onboarding polish |
| Research leftovers | (RL-13) | ENCRYPTED EXPORT ARCHIVES | 2142–2143 | NOTED — future, #68; revisit with backup/export v2 (M10 Drive P2 planning) |
| Research leftovers | (RL-14) | YAML FRONTMATTER ON EXPORT | 2144–2145 | NOTED — J5 detail, #73; fold into Year Book export format if wanted |
| Research leftovers | (RL-15) | QUOTE-YOUR-OLD-SELF / TRANSCLUSION | 2146–2148 | NOTED — C-08 family, #54; revisit if C-08 links ship and reflection wants it |
| Research leftovers | (RL-16) | MORNING/EVENING RITUAL RHYTHM | 2149–2150 | NOTED — coach, #49-50; Coach rule-book session candidate (with C-14) |
| Research leftovers | (RL-17) | RESEARCH ANTI-PATTERNS | 2151–2155 | NOTED — guardrail reference (paywall nagging, punishment loops, cloud-only memory, training on content); docs pass should cite these as documented no-goes |

*(The RL-1…RL-17 numbering is this census's own enumeration key for the unnumbered section items — the source itself carries no IDs there; keep the family prefix "Research leftovers" when referencing downstream.)*

---

## Table 10 — Drafting inputs (life-tree-design sources; NOT IDs — source files + section anchors)

The Life Tree design's authoritative detail lives OUTSIDE the ledger and is PART of the drafting surface (delta §1, §6). Drafters read these alongside tree-7's decision records. Files confirmed to exist at the listed paths.

| Source file | Section anchors (from the ledger's own pointers) | Referenced by |
|---|---|---|
| `life-tree-design/VISION.md` | §2 (17 principles), §3 (organ map), §4.1–4.5 (resolved sections: seasonality D085, super-hard visual D086, habits-as-buds D087, branch system D088, consistency principle D088 F) | tree-1; D085/D086/D087/D088/D089 LANDS |
| `life-tree-design/SCHEMA.md` | §2.3 canonical domain table (D104 Artifact 1), §2.4 threshold register (D105 Artifact 2 + D116 amendments A6-A7/C8-C13/E15), §2.5 trigger table (D103/D106 Artifact 3), §2.6 state model (D107/D108 the lean form + derivation protocol), §3 derivation contract (D090 stage ticks, D101 year types, D100 presence predicate) | tree-2/tree-3; D090–D117 LANDS |
| `life-tree-design/LOOPHOLES.md` | the resolutions (N-1..N-7, R1-R9, IA-1..IA-10, P-04, C-3, F-02/F-03/F-04/F-17/F-23, DV-C1..C5, D C-1..C3, G P-01/P-03, D M-1/M-3/M-5, B M-05/M-09, etc.) + the stage model + the matrix | D090–D117 LANDS |
| `life-tree-design/ACHIEVEMENT-SCAN.md` | the rarity ladder + the identity axis (§1.5 flower family → family) | D091/D092/D096 LANDS |
| `life-tree-design/INPUT-INVENTORY.md` | the feature surface; §12 the forbidden list (D100's mirror); §9/§14 coach-anchor rows corrected to D102 | D100/D102/D104 LANDS |
| `life-tree-design/paper-run/` | the 19 archetype walks — the validation evidence (D116's correction set derives from them; the code-version test fixtures per D117 H1) | D116; D117 H1 |
| `life-tree-design/audits/` | the audit chain (scan-audit-2026-08-29, relentless-logic/design audits, paper-run recording audits, loop-closure/final-gate/final-consistency/final-adversarial/final-100pct audits) | D114 ("the consistency + adversarial audits' findings") |
| `research-botany/MASTER-Botany-Reference.md` | botanical citation root — parts cited per D088 adaptation rows (4.3/4.5/4.6.x/5.4/5.6.x/6.5.x/7.2/7.4/9.2/9.5), PART 9 seasons per D085, MASTER 4.1/4.4 canopy per D088 | D085/D087/D088/D089 |
| `research-journaling/MASTER-Journaling-Research.md` | C-series citation root (evidence + references; PART 9 GUI & layout pattern compendium for the UI/UX lookup table) | C-01…C-15; UI/UX DEVELOPMENT REFERENCE table (lines 2157–2190) |
| `research-fitness/MASTER-Fitness-Research.md` | F-series citation root (per-report R01–R06 + PART 9 + mobbin inventories) | F-01…F-32; M2 GUI row |
| `research-nutrition/MASTER-Nutrition-Research.md` | N-series citation root (per-report R01–R06 + PART 9 + mobbin inventories) | N-01…N-18; M3 GUI row |
| `research-lifeos/MASTER-LifeOS-Research.md` | L-series citation root (per-report R01–R05 + PART 8 + mobbin inventories) | L-01…L-15; M4/M5/M6 GUI rows |

Mobbin dataset maps (committed repo files, VERBATIM-CRITICAL file paths + screen counts) live at lines 2192–2237 and are drafting references, not IDs: `research-fitness/mobbin-screens-*.json` (Hevy 295, Fitbod 216, MacroFactor 402, NRC 325, Strava 709, workout 946 + `mobbin-query.mjs`), `research-nutrition/mobbin-screens-*.json` (MFP 290, Noom 529, Yazio 276, Lifesum 345, Zero 139 + `mobbin-query.mjs`), `research-lifeos/mobbin-screens-*.json` (Todoist 326, Things 3 166, TickTick 97, Google Calendar 866, Cron 110 + `mobbin-query.mjs`).

---

## Author-citation spot-check (sample of the ledger's own doc citations)

The ledger cites docs/ line ranges extensively inside entries. Per the A1a instruction, the author's own pointers were trusted and carried, then spot-checked. **24 checks — all ACCURATE, none flagged as wrong:**

| # | Citation in source | Cited claim | Verdict |
|---|---|---|---|
| 1 | Roadmap.md:283-288 (D060 supersession, line 131) | Fitness surface CLOSED (D060) + N3/N5 park-able clause | ✅ ACCURATE |
| 2 | CoachSystem.md:167-172 (F-24, line 820) | `check_in_weekly` with "one Coach line per strictness" at :171 | ✅ ACCURATE |
| 3 | CoachSystem.md:177 (F-24 ONE-LINE-AMENDMENTS, line 843) | `nutrition_checkup` "one Coach line per strictness" | ✅ ACCURATE |
| 4 | CoachSystem.md:185 (F-24 amendments) | `phase_close` "plus one Coach line" | ✅ ACCURATE |
| 5 | CoachSystem.md:236 (F-24 amendments) | milestone-review "coach-line-per-strictness" | ✅ ACCURATE |
| 6 | Gamification.md:113-114 + CoachSystem.md:394-395 (C-09 GUARD, line 1974) | "Grace is the ONLY finite streak shield" (:113) + "two shields would become one unlimited shield" (:394-395) | ✅ ACCURATE (compound citation — both halves verified at their cited locations) |
| 7 | Architecture.md:176 (F-25 DOCS GROUNDING, line 860) | `adherenceWeek()` denominators count days WITH the slot | ✅ ACCURATE |
| 8 | UIUX.md:148-149 (F-07 TINT-ONLY, line 180) | "No glyphs/emojis/numbers on the grid" | ✅ ACCURATE |
| 9 | MediaStorage.md:190-191 (C-11 AUDIO-DURATION NOTE, line 1999) | durationSec: phone capture returns finished duration; PC adoption parses MP4/MOV header | ✅ ACCURATE |
| 10 | Roadmap.md:113-119 (C-08 EXPORT RECONCILIATION, line 1941) | J5 Year Book = rendered human PDF | ✅ ACCURATE |
| 11 | Roadmap.md:175-177 (F-02 STALENESS, line 227) | >4wk collapsed + PO suggestions pause (~90% baseline) | ✅ ACCURATE |
| 12 | Roadmap.md:221-228 (F-12 DEFAULT-STYLE, line 444) | PO style list names LINEAR-WEIGHT as compound default | ✅ ACCURATE |
| 13 | Roadmap.md:326 (N-09, line 1024) | `source` column enumerates `scanner` | ✅ ACCURATE |
| 14 | Roadmap.md:559-560 (F-07 TINT-ONLY) | M6 grid tint-only, "No glyphs, emojis, or numbers" | ✅ ACCURATE |
| 15 | Architecture.md:189 (F-13 DOC-AMENDMENT, line 572) | `rollingWindowMean` = "the ONLY rolling-average math in the engine" | ✅ ACCURATE |
| 16 | Architecture.md:268-270 (F-13 amendments) | same claim + pace-owner consumers list | ✅ ACCURATE |
| 17 | Gamification.md:209-211 (F-05 ADHERENCE EXCLUSION, line 316) | qualifyingEntry(GYM) "≥1 real logged set" | ✅ ACCURATE |
| 18 | CoachSystem.md:265-268 (F-25 DOCS GROUNDING, line 857) | plan adherence counts sessions vs plan slots; done-differently not missed | ✅ ACCURATE |
| 19 | CoachSystem.md:437-441 (C-08 PRIVACY-STAMP, line 1952) | per-feature privacy-stamp rule | ✅ ACCURATE |
| 20 | CoachSystem.md:445-446 (C-13 GUARD, line 2060) | never-list forbids "rewards for reading/opening" | ✅ ACCURATE |
| 21 | Gamification.md:429-443 (F-27 DEFERRED EXTENSION, line 931) | Trimester / The Schedule Never Breaks schedule-run trophies | ✅ ACCURATE |
| 22 | CoachSystem.md:352-357 (F-19 N5-DEFERRAL, line 763) | Deferred: recovery readiness (N5) + FUT-2 note at :356 | ✅ ACCURATE |
| 23 | Roadmap.md:1027-1029 (F-19 N5-DEFERRAL) | idea-park N5 "skipped, door open; do not duplicate with FUT-2" | ✅ ACCURATE |
| 24 | Roadmap.md:361 (F-13 DOC-AMENDMENT #3, line 583) | "`rollingWindowMean` = the only rolling-average math in the engine" | ✅ ACCURATE |

**Source-format quirks recorded (not citation errors, not silently corrected — handoff notes for A1b/B1/E):**
1. **L-04 header** uses a double dash `- - L-04` (line 1589) — violates the legend's first-line format rule.
2. **D089/D088 recorded out of numeric order** (after D116, lines 3566/3594) — file ordering quirk; D-number identity is authoritative.
3. **L-15's token "LOCKED as a DESIGN FEED"** is not one of the legend's standard tokens; the body defines it as standard LOCKED with a feed-only scope (recorded for the pipeline).
4. **C-03 weather chip + C-08 mention-suggestion** are PENDING SUB-ITEMs inside LOCKED entries (lines 1879, 1957) — neither is draftable as decided content; A1b should split them into own rows with a pending-approval source state so Stage C verdicts them.
5. **F-series section legend (line 90)** lists an `IN DISCUSSION` status that no F entry uses; the legend table (line 65) defines AGREED IN PRINCIPLE + PENDING instead.
6. **"Unlocks & extras" (2239–2243) and "Refactor proposals (2245–2248)** remain `_TO FILL_` placeholders — nothing to draft; audit-12 stays an open item.
7. **N-03/N-11** carry confirmation notes ("CONFIRMED at the N-series walkthrough") — the [REVIEW] markers were resolved as of the 2026-09-26 re-audit (delta §4).

---

## Footer — totals & coverage confirmation

### Total ID count per family

| Family | Count |
|---|---|
| candidate-C (C-01 … C-15) | 15 |
| candidate-F (F-01 … F-32) | 32 |
| candidate-N (N-01 … N-18) | 18 |
| candidate-L (L-01 … L-15) | 15 |
| audit (audit-1 … audit-13) | 13 |
| tree (tree-1 … tree-7) | 7 |
| engine (engine-1, engine-2) | 2 |
| D-records (D085 … D117 headers) | 33 |
| Research leftovers (recorded, no decision) | 17 |
| **Total census IDs** | **152** |
| *(+ 4 ledger D-number notes outside the header family: D082+ convention, D083, D084, D060 cross-ref — recorded, not counted as headers)* | |
| Drafting-input files (Table 10, not IDs) | 12 sources + 16 mobbin dataset files/helpers |

### Full-file coverage confirmation (contiguous line ranges read)

- **`docs/UIUX.md`** — lines **1–390** read in full, one contiguous chunk (390/390 lines; held in context per the A1a prompt).
- **`TEMP-PLANNING.md`** — lines **1–3922** read in seven contiguous chunks covering every line:
  - 1–806 · 807–1406 · 1407–2006 · 2007–2606 · 2607–3206 · 3207–3806 · 3807–3922
  - Coverage: 3922/3922 lines — no gaps, no skips.
- **Framework docs** (read to execute the stage): `doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md` (1–121, full) + `doc draft framework/TempPlanning-Integration-Framework-v6-final.md` (1–673, full).
- **Verification greps** run over TEMP-PLANNING.md for `^- (C|F|N|L)-\d+`, `^### tree-\d`, `^- (engine|audit)-\d+`, `^- D\d+` — all family sets match the tables above.
- **Citation spot-check:** 24 of the ledger's own doc citations verified against live `docs/` files — 24/24 ACCURATE, 0 flagged.

**Effort note:** the MAX effort assigned to A1a proved sufficient — no flag.

---

*Stage A1a complete. Artifact: `docs/IntegrationIDCensus.md`. STOP — do not proceed to any later stage (A1b or beyond) without human review.*