# Ledger Consistency Audit — TEMP-PLANNING.md (Generation 2)

Date: 2026-09-26 · Lens: FULL-LEDGER CONSISTENCY (no section off-limits)
Method: TEMP-PLANNING.md read in full (3,899 lines, no skimming); series
completeness enumerated (C-01…C-15, F-01…F-32, N-01…N-18, L-01…L-15, D083–D117);
every D-record cross-checked against its neighbors and the tree-7 decisions;
prior audit `audits/ledger-audit-2026-08-28.md` (32 + 10 findings) re-verified
against the current text. No files edited.

Severity scale: CRITICAL = a contradiction that would mislead the drafting
pipeline · MAJOR = stale/ambiguous text needing a decision or cross-reference ·
MINOR = cosmetic/mechanical.

**Counts: 6 CRITICAL · 21 MAJOR · 14 MINOR (41 total)**

---

## CRITICAL (6)

### C-1. Line 1 is corrupted — search-tool fragments glued onto the H1 title
**Location:** line 1.
**Text:** `MISS: LANDS: Roadmap M4; Database.md (routine  MISS: LANDS: UIUX.md (dashboard); DesignSystem MISS: LANDS: CoachSystem.md (rule-book session # TEMP-PLANNING — Generation 2 (refactor & Life Tree design)`
**Problem:** three `MISS: LANDS:` fragments (remnants of a "find entries missing LANDS" search/replace pass) are prepended to the document title; the real title survives only at the end of the garbage. The document's first line is unparseable and the fragments describe nothing in the file.
**Fix:** restore line 1 to `# TEMP-PLANNING — Generation 2 (refactor & Life Tree design)`; delete the three `MISS: LANDS:` fragments entirely (they were never entries — the LANDS lines they resemble already exist at their home entries).

### C-2. C-15 PENDING is never resolved — its promised decision home (tree-7) closed without deciding it
**Location:** header line 1848; entry lines 2088-2092; tree-7 lines 2388-3899 (absent).
**Problem:** the C-series header claims "all candidates decided **except C-15, deferred to the Life Tree section**" and C-15's entry says "Decided inside the LIFE TREE DESIGN SYSTEM section, not here." The Life Tree design session is COMPLETE (D117: "the design chapter is COMPLETE - D085-D116"), yet tree-7 (D085-D117) never mentions C-15 or any of its five components (care-object growth, ring visuals, year artifacts, then-&-now, 10-year pledge). Prior audit flagged this (E-4, "the pointer remains hollow"); it is STILL unresolved after the tree-7 additions. The docs pass has no closure for C-15 and no D-number for it.
**Fix:** add a resolution line to C-15's entry mapping each component to its tree-7 decision (e.g., care-object growth → D087 bud system; ring visuals → D091 overlay; year artifacts → D097 time-lapse replay; then-&-now → D094/D097 ceremony + C-06 feed; 10-year pledge → D088 adaptation 7 TENDRILS), or explicitly convert C-15 to REJECTED/SKIPPED with a REVISIT line. Also correct the header's "all candidates decided except C-15" phrasing to reflect the resolution.

### C-3. N-03 is LOCKED but its DECISIONS chunk still says "pending user confirm" + [REVIEW]
**Location:** lines 1053-1063 (status line 1053; DECISIONS 1059-1063).
**Text:** status `(LOCKED, user yes)`; DECISIONS: `(my take, pending user confirm at walkthrough): missing days EXCLUDED from the denominator when <5 logged days (thin-week rule); typical-average only when the week is otherwise complete. [REVIEW - user accepted the candidate; confirm this decision point or adjust]`
**Problem:** the status token (authoritative per the legend) and the decision text directly contradict each other. A drafter copying DECISIONS verbatim would carry "pending user confirm" + an unresolved [REVIEW] marker into the Coach doc.
**Fix:** resolve the decision point (or flip the entry to IN DISCUSSION). If LOCKED stands, delete the `[REVIEW ...]` marker and rewrite DECISIONS as decided text.

### C-4. N-11 is LOCKED but its DECISIONS chunk still says "pending user confirm" + [REVIEW]
**Location:** lines 1067-1076 (status line 1067; DECISIONS 1075-1076).
**Text:** `DECISIONS (my take, pending user confirm): grams as canonical entry, presets as shortcuts. [REVIEW - confirm or adjust]`
**Problem:** same class as C-3 — LOCKED status vs pending-confirm content. This is the same failure mode the prior audit's F-1/F-28 finding closed for F-28 ("user confirmed at lock"); N-11 was never fixed.
**Fix:** as C-3.

### C-5. F-23's locked decision names REJECTED F-32 as the delivery vehicle for its no-equipment variant
**Location:** F-23 lines 780-797, decision (a) at 790-792; F-32 lines 1012-1015.
**Text:** F-23 (a): `M2 ships TIRED + SHORT-ON-TIME (load multiplier + condensed); no-equipment later with F-32` — F-32 status: `REJECTED (user)` with RESTING PLACE: "Mid-session swap stays manual via the F-02 anatomy."
**Problem:** a LOCKED decision promises "no-equipment later with F-32" while F-32 is dead. The docs pass would write a phantom "no-equipment replacement with F-32" into Roadmap M2+ scope, or silently drop the promised variant — neither is recorded.
**Fix:** amend F-23 (a): record that the no-equipment variant is HELD/deferred with no home (F-32 rejected) and that mid-session swap stays manual per F-32's RESTING PLACE, or explicitly fold the variant into F-02's anatomy.

### C-6. Buttress/E2 axis signature — three locked records with three conflicting formulas
**Location:** D088 §D worked example lines 3729-3731; D116 D5 lines 3466-3468; D088 recording-audit (g) lines 3806-3808.
**Texts:**
- D088 §D: `buttress requires balance>=0.7 + resource>=0.6`
- D116 D5: `E2 RESOURCE LEG (recommendation accepted): >=0.4 - the balance leg carries the signature; the balance champion can grow the wide-crown roots`
- D088 (g) (later, post-D116): `the audit's arithmetic proved the rotating logger sits at 0.083 resource at the ceiling 12 - ANY resource leg excludes the balance champion; E2 = balance >=0.7 ONLY`
**Problem:** three locked records disagree on whether the buttress (E2) signature has a resource leg (>=0.6 vs >=0.4 vs none). D088 (g) is the latest and refutes D116 D5's >=0.4 leg, but no reconciliation note links them; the D088 record contradicts itself (§D vs (g)). The docs pass drafting SCHEMA's axis signatures has no authoritative in-ledger ruling.
**Fix:** add an explicit reconciliation note on D116 D5 and D088 §D: "E2 = balance >=0.7 ONLY per the recording audit (D088 (g)); the resource leg is dropped — any resource leg excludes the balance champion." Keep the historical texts, bind the ruling.

---

## MAJOR (21)

### M-1. D089 "SPINES (100-day streaks)" + D088 row 3 "SPINES (100-day)" vs D116 D9 (26 consecutive weeks)
**Location:** D089 lines 3568-3569; D088 adaptation map row 3 lines 3658-3659; D116 D9 lines 3480-3487.
**Problem:** D116 D9 re-locks SPINES = 26 consecutive weeks (subtle tier) and THORNS = 52 consecutive weeks + tenure >=2 stage-years; the D089 and D088 records still carry the superseded "100-day" figure with no cross-reference. Same class as the D115 "20 was superseded" fix that WAS applied to B2 — this one was not.
**Fix:** amend D089's split and D088 row 3 to "SPINES = 26 consecutive weeks (D116 D9)" or add a D116 cross-ref line.

### M-2. D096 "Ghost in the Machine ~day 182" vs D116's Ghost refutation (~d96-97)
**Location:** D096 lines 2673-2677 (example at 2676); D116 RECORDED FACTS (1) lines 3538-3542.
**Problem:** D096 uses "~day 182" as its day-1-too-early example; D116 records "THE GHOST REFUTATION ... the honest earliest Ghost is ~d96-97". The D096 figure is refuted by the later record and was never amended or cross-referenced.
**Fix:** amend D096's example to cite D116's refutation (~d96-97) or add "Ghost timing corrected by D116".

### M-3. D097 header claims "resolves N-1 + N-7" but D100 overturns wave-1 N-7
**Location:** D097 header line 2721; D100 header lines 2837-2839; D114 fix 3379-3380; D115 fix 3438.
**Problem:** D097's header still claims N-7 resolved; D100 records "overturns wave-1 N-7" and D114/D115 both apply the fix "D097's N-7 citation -> D100" — yet D097's header resolution claim was never amended. Two records claim N-7 (resolved / overturned).
**Fix:** amend D097's header to "resolves N-1; N-7 re-arbitrated by D100" (the record's own (5) already carries the D100 citation).

### M-4. Ring domain set: D114 (3) "CANONICAL 7" + D104 (2) "so the rings can count it honestly" vs D116 D10 (six core, goals excluded)
**Location:** D114 (3) lines 3370-3374; D104 (2) GOALS lines 2997-2999; D116 D10 lines 3488-3492.
**Problem:** D114 (3) locks the ring-year to the canonical 7 presence-domains and says the VIII-family six-domain trophies align to that set; D116 D10 (later, the paper run) folds the ring brand to SIX CORE DOMAINS (goals and periods excluded) — "the trunk rings and the trophy ladder ALWAYS agree; the canonical-7 stays for the axes/presence." D104 (2)'s "GOALS ... so the rings can count it honestly" is also superseded. No reconciliation note links them.
**Fix:** add a D116 cross-ref to D114 (3) and D104 (2): "ring-year + VIII-family conditions = the six core domains (D116 D10); goals/periods excluded from the ring brand; canonical-7 governs axes/presence only."

### M-5. D099 (N-6) "the Coach's derived coach_outputs facts do [mirror]" vs D110 (1) "NEVER touches coach_outputs"
**Location:** D099 N-6 lines 2827-2833; D110 (1) lines 3169-3177.
**Problem:** D099's mirror boundary says the why-panel mirrors "the Coach's derived coach_outputs facts"; D110 (1) later establishes that coach_outputs rows store RENDERED TEXT ("'derived coach_outputs facts' had no referent") and the tree is "structurally enforced (not 'reads facts from it' - NEVER touches it)". D099's N-6 was never amended/cross-referenced — the pipeline could draft "mirror coach_outputs facts" into the why-panel contract.
**Fix:** amend D099 N-6: the why-panel reads H3 derived owners only, never coach_outputs (D110 (1)).

### M-6. D101 "STAGE-YEARS: a 365-day window" vs D116 S2 "the literal 365-day-window reading is dead"
**Location:** D101 (1) lines 2880-2883; D116 S2 lines 3500-3503.
**Problem:** D101 defines stage-years as "a 365-day window ... sustained presence"; D116 S2 pins the accrual at ">=200 CUMULATIVE in-window days, the counter resets at 200; the literal 365-day-window reading is dead". D101's record text still states the dead reading with no cross-ref.
**Fix:** add "accrual per D116 S2 (>=200 cumulative in-window days, reset at 200)" to D101 (1).

### M-7. Maturity gate — three formulations across D105 / D114 (2) / D115 B4
**Location:** D105 register B line 3016; D114 (2) lines 3365-3369; D115 B4 lines 3409-3412.
**Texts:**
- D105: `->MATURE >=3 branches + >=2 stage-years`
- D114 (2): `MATURE = >=2 stage-years AND >=1 branch extended to a STRUCTURAL DEPTH (>=6 twigs)`
- D115 B4: `POLE->MATURE = >=2 stage-years AND >=90 in-window days ANY-DOMAIN-MIXED in the best anchored year`
**Problem:** three locked formulations of the same gate, with no explicit "X supersedes Y" note. D115 B4's 90-day mixed bar and D114's >=6-twigs structural depth are different conditions (a sparse-stubborn user may satisfy neither fully); the register (SCHEMA 2.4) binds, but the records disagree.
**Fix:** add a reconciliation line to D115 B4 (or D114 (2)): "B4 = >=2 stage-years AND >=90 in-window days ANY-DOMAIN-MIXED in the best anchored year (D115/D116 D1); the D114 '>=1 branch >=6 twigs' formulation is superseded" — and amend D105's register summary row to match.

### M-8. L-10 (a) "ONE line per week" contradicts F-24's 3–5-line message — and F-24's ONE-LINE-AMENDMENTS list omits L-10
**Location:** L-10 (a) line 1778; F-24 lines 818-824; F-24 ONE-LINE-AMENDMENTS lines 836-840.
**Problem:** L-10 says the insight "lives in the weekly Coach message (F-24, ONE line per week)"; F-24 locks a 3–5-line template. F-24's amendment list covers the four CoachSystem.md sites (171/177/185/236) but not L-10's ledger phrase — so the docs pass would draft L-10's "ONE line per week" verbatim against F-24's 3–5 lines.
**Fix:** amend L-10 (a) to "one insight line within F-24's 3–5-line weekly message" and add L-10 to F-24's ONE-LINE-AMENDMENTS list.

### M-9. engine-2's rule roster "F-19…F-24" includes REJECTED F-21 and F-22
**Location:** engine-2 lines 341-374, roster at 344-345.
**Text:** `~25 named rules committed by M2 alone (gen-1 locks + F-08/F-09/F-10/F-11/F-12 + F-19…F-24)`
**Problem:** F-21 and F-22 are REJECTED (dead); the engine-2 count and roster include them, overstating the committed rule set.
**Fix:** change the roster to `F-19/F-20/F-23/F-24` and re-derive the "~25" count.

### M-10. tree-1…tree-6 still carry "SKELETON … no lock" while the design session is complete (D117) and the D-records LANDS point into them
**Location:** tree-1 line 2345; tree-2 2350; tree-3 2361; tree-4 2371; tree-5 2379; tree-6 2384; session-plan step 10 line 2402; D117 lines 3813-3899.
**Problem:** every skeleton says "filled at the Life Tree design session; no lock", but the session is DONE (D085-D117, "design chapter is COMPLETE"). The session plan's own step 10 ("Record into TEMP-PLANNING tree-1..tree-6") was never executed in this file — D085-D117's LANDS repeatedly cite "tree-1 (visual cycle)", "tree-3 (season-phase feed)", etc., into sections that remain empty stubs. A pipeline enumerator sees "no lock" and drops the entire design-system content from the draft.
**Fix:** fill tree-1..tree-6 with the locked decisions (or add a banner: "DESIGN SESSION COMPLETE — tree-7 (D085-D117) is the authoritative record; the docs pass populates these sections from it"), and mark session-plan step 10 DONE.

### M-11. tree-2 "Branches: one per achievement domain" contradicts D088's locked 5-app-section branch system
**Location:** tree-2 line 2353; D088 §A lines 3580-3587; D104 (3) lines 3000-3005.
**Problem:** the skeleton says branches are "one per achievement domain"; D088 locks 5 first-order branches = the 5 fixed app sections (journal, habits, gym, nutrition, goals), and D104 locks the two-level model (7 presence-domains -> 5 branches). Achievements are flowers, not branches. Stale pre-session text.
**Fix:** correct tree-2 to "5 first-order branches = the 5 app sections (D088); achievements bloom as flowers (D091/D092)".

### M-12. tree-3 "M2 Analytics-Engine derived cache" + tree-6 "M2 scope" vs the locked M9 milestone and D110 (6)'s log-derived-only rule
**Location:** tree-3 line 2365; tree-6 line 2385; APP MAP item 17 lines 2308-2310; D110 (6) lines 3200-3208; D117 (M9 launch).
**Problem:** tree-3 names an "M2 Analytics-Engine derived cache" (the analytics engine is M7, and D110 (6) locks that the tree derives from the event log with its OWN cache, never the M7 tables); tree-6 says "M2 scope" while the Life Tree milestone is M9 (APP MAP item 17, D117 header).
**Fix:** tree-3 -> "the tree's own derived cache (D108/D110 — derives from the log directly, never the M7 tables; M9)"; tree-6 -> "M9 scope, build order per D117".

### M-13. tree-7 session-plan statuses are stale: step 3 "NEXT" vs D115 "Step 3 done"; steps 4-10 unmarked
**Location:** session plan lines 2389-2402 (step 3 at 2393); D115 mechanical fixes line 3442-3443.
**Problem:** the plan says "3. Feature scan ... - NEXT" while D115 records "PLAN.md statuses (Step 3 done; 19 archetypes)" — the statuses were updated in PLAN.md but not in this file's copy. Steps 4-10 carry no status at all despite D085-D117 completing the whole design chapter.
**Fix:** mark steps 1-8 DONE with their D-number citations (per D117's "design chapter complete"), step 9 DONE (D117), step 10 OPEN (docs pass), and note the PLAN.md home.

### M-14. Legend's tree family row says "tree-1 … tree-6" while the document contains tree-7
**Location:** legend line 60; tree-7 heading line 2388.
**Problem:** the legend (pipeline ground truth for ID enumeration, per lines 40-54) omits tree-7 — Stage A1a enumeration scoped by the legend would miss the entire decision record.
**Fix:** extend the legend row: `tree-1 … tree-7` (tree-7 = the design-session decision record, D085-D117).

### M-15. L-15's deferred placement decision was never made by the tree session
**Location:** L-15 lines 1825-1846, decision (b) at 1843-1845.
**Problem:** L-15 (b) records "PLACEMENT in the tree section (tree-2 anatomy / tree-5 render reference notes) MUST BE DECIDED DURING THE LIFE TREE DESIGN SESSION - recorded, deferred." The session is complete (D085-D117) and no record mentions the weeks-as-cells grid. Same hollow-pointer class as C-15.
**Fix:** add a resolution line to L-15 (grid appears as [strip / zoom mode / not at all] per the session's decision, or explicitly carry the grid as a reference-only material with the placement left to the UI/UX ordering pass).

### M-16. N-08's entry carries an orphaned fragment "candidate fully explained):"
**Location:** lines 1378-1379.
**Text:** `- N-08 EXERCISE KCAL DISPLAY-ONLY (LOCKED, user yes - both decision points agreed):` followed by line 1379: `  candidate fully explained):`
**Problem:** a dangling fragment from a past edit (probably once part of the status line, e.g. "- both decision points agreed - candidate fully explained):"). The entry then jumps straight to SOURCE.
**Fix:** delete line 1379 (or restore it into the status line).

### M-17. L-03 / L-05 / L-06 — LANDS chunks split by a MOBBIN REFS line inserted mid-sentence
**Location:** L-03 lines 1583-1585; L-05 lines 1606-1608; L-06 lines 1675-1677.
**Problem:** past edits inserted MOBBIN REFS between two halves of each entry's LANDS chunk: L-03 (`LANDS: Roadmap M5 (goal detail); Architecture.md (owner);` / MOBBIN / `UIUX.md (goal chart).`), L-05 (`LANDS: Roadmap M4; UIUX.md (day view + briefing evening close);` / MOBBIN / `CoachSystem.md (adherence semantics).`), L-06 (`LANDS: Roadmap M6; UIUX.md (day view); CoachSystem.md (adherence` / MOBBIN / `semantics); Database.md (routine_slot_logs reads).`). L-06's LANDS is broken mid-word. Every other L-entry keeps LANDS whole.
**Fix:** move the MOBBIN REFS line after the complete LANDS chunk in all three entries (restore the LANDS sentences).

### M-18. F-11's CONSTRAINTS line is mangled: "breaks are safCONSTANT RECONCILIATION"
**Location:** lines 410-411.
**Text:** `CONSTRAINTS: ... no punishment framing (breaks are saf` glued to `CONSTANT RECONCILIATION (audit finding - recorded, corrected):`
**Problem:** the constraint sentence lost its closing "e)." and the next block's heading lost its line break — one merged word "safCONSTANT". Corruption from a past edit.
**Fix:** restore `...no punishment framing (breaks are safe).` + line break + `CONSTANT RECONCILIATION (audit finding — recorded, corrected):` as a new block.

### M-19. F-18 LANDS omit the two superseded "Wilks-style average" lines (prior-audit C-3 residual)
**Location:** F-18 lines 677-716 (LANDS 713-716); superseded wording quoted in WHAT at 682-684.
**Problem:** the prior audit (C-3, PARTIAL) flagged that Roadmap.md:215-216 and Architecture.md:225 ("overall level = avg of big-5 ratios, Wilks-style") become false via F-18's DOTS upgrade and are not named in LANDS or any DOC-AMENDMENT note. Still unfixed — the docs pass would leave the Wilks-style wording alive in two docs.
**Fix:** add to F-18 LANDS: "Roadmap.md:215-216 + Architecture.md:225 (overall-level wording) amend to DOTS at the docs pass."

### M-20. D117 A1's docs-pass register is partial — scattered amendment flags are not consolidated
**Location:** D117 A1 lines 3820-3828; scattered flags: D060 line 128 · F-08 lines 487-491 · F-12 lines 439-445 · F-13 lines 567-579 · F-19 lines 757-761 · F-24 lines 836-840 · C-05 lines 1906-1909 · C-08 lines 1936-1941 · C-09 lines 1968-1975 · D102 line 2939-2940 · D109 lines 3163-3165 · D110 lines 3209-3211 · D112 lines 3317-3319 · D114 lines 3389-3400 · D115 lines 3431-3444 · D116 lines 3548-3551 · L-10 (new, M-8 above).
**Problem:** D117 A1 lists DecisionLog D085-D116 plus a short doc list (Gamification/CoachSystem/Roadmap/Database/UIUX/StorageDecision). It omits at least: D060's Roadmap.md:283-288 closure-clause amendment + N3/N5 re-open, F-08's CoachSystem.md:277 volume-balance amendment, F-12's progression-default amendment, F-13's three rolling-window-claim amendments (Architecture.md:189/268-270, Roadmap.md:361), F-19's N5 deferral lines (Roadmap.md:1027-1029, CoachSystem.md:352-357), F-24's one-line x4, C-05's J5, C-08's J5 Year Book links, C-09's Grace wording, D114's mechanical-fix list, D115's mechanical-fix list (LOOPHOLES six-domain lines, SCHEMA §3, INPUT-INVENTORY, ACHIEVEMENT-SCAN), D101's threshold-register deferred bar, D110's M7 cache arbitration. A docs pass run from A1 alone would miss roughly half the amendments.
**Fix:** make D117 A1 either exhaustive or an explicit index: "the authoritative amendment list = D117 A1 + every 'docs pass' / 'amend at the docs pass' / DOC-AMENDMENT-FLAG marker in TEMP-PLANNING.md (see ledger lines: ...)" — the ledger must be the single checklist.

### M-21. DecisionLog (D082+) convention stated only for the F-series — C/N/L entries mostly un-flagged (prior-audit C-1 residual)
**Location:** LANDS CONVENTION line 91 (scoped "entries below"); C-series LANDS lines 1890-1892, 1906-1909, 1920, 1942-1943, 1976-1977, 1992-1993; N-series LANDS; L-series LANDS.
**Problem:** the convention note covers the F-series section only; the C-series header (1848-1856) restates the format but not the D082+ implication, and most C/N/L LOCKED entries name no DecisionLog landing (C-03, C-05, C-06, C-11-with-note, N-01, N-03, N-04, N-05, N-06, N-08, N-10, N-11, N-12, N-14, N-15, N-16, N-18, L-01…L-15). The house rule requires a D-number per decision; the per-row flag is missing for ~25 entries. Meanwhile F-13 (562), F-18 (714), N-09 (1031), N-07 (1478), C-09 (1977) still repeat "DecisionLog (D082+)" despite the convention saying entries below do not repeat it.
**Fix:** extend the LANDS CONVENTION note to the whole file (or restate it in the C/N/L sections), and let the docs pass assign D-numbers per row uniformly.

---

## MINOR (14)

### m-1. "Â·" mojibake (double-encoded middle dot) — 5 occurrences
**Location:** lines 1197, 1230, 1275, 1298, 1320 (N-04, N-05, N-06, N-15, N-17).
**Fix:** replace `Â·` with ` · ` (U+00B7) to match the rest of the document.

### m-2. N-05 stray backtick "packed`r"
**Location:** line 1207 (`the locked packed`r source producer`).
**Fix:** restore `the locked packed source producer` (drop the `r).

### m-3. L-04 double bullet marker "- - L-04"
**Location:** line 1586.
**Fix:** single `- L-04`.

### m-4. D-record ordering anomalies
**Location:** D084 before D083 (lines 92 / 112); D089 and D088 placed AFTER D116 (lines 3552 / 3578) though D093/D101/D114/D115/D116 amend them.
**Fix:** reorder records numerically (D083, D084 … D088, D089, D090 … D116, D117) so amendments read after their bases.

### m-5. Session-plan step 1: "The 6 open decisions - DONE (D085-D088)" — range/count mismatch
**Location:** line 2391. The six open decisions are D085-D090 (6 records); the citation covers only D085-D088 (4).
**Fix:** cite `D085-D090`.

### m-6. F-series header status list incomplete/inconsistent
**Location:** lines 86-88. Defines `IN DISCUSSION` (never used anywhere) and omits `AGREED IN PRINCIPLE` (used by F-27).
**Fix:** align the header list with the legend (add AGREED IN PRINCIPLE/PENDING; keep or drop IN DISCUSSION consistently).

### m-7. D112 (3) "three statuses" vs D113 (5) four-status amendment — no cross-reference
**Location:** D112 (3) lines 3285-3298; D113 (5) lines 3339-3350.
**Fix:** add "amended by D113 (5): EXCLUDED-BY-DESIGN (PERMANENT) added" to D112 (3).

### m-8. D090 B "FIRST EVENT EVER" vs D100/D102 "first IN-WINDOW event" — no cross-ref
**Location:** D090 B lines 2477-2480; D100 (5) 2858-2861; D102 (1) 2920-2924.
**Fix:** add "(per D100: first IN-WINDOW event)" to D090 B.

### m-9. Open-state sections vs the generation's declared completion
**Location:** open-items checklist lines 68-82 (audit-13 unchecked though D117 completes the main goal); "Unlocks & extras" lines 2229-2233 (`_TO FILL_`); "Refactor proposals" lines 2235-2238 (`_TO FILL during audits_`).
**Fix:** mark audit-13 done, and either fill or explicitly defer the two placeholder sections at the docs pass.

### m-10. Duplicate mechanical fix: "D097's citation -> D100" listed in both D114 and D115
**Location:** D114 lines 3379-3380; D115 line 3438.
**Fix:** keep one (D114) and drop the repeat in D115, or note "(also recorded in D114)".

### m-11. D117's LANDS omit DecisionLog for D117 itself
**Location:** D117 LANDS lines 3897-3899 (PLAN.md, SCHEMA.md, LOOPHOLES.md, M9 rows, docs pass — no DecisionLog).
**Fix:** add `DecisionLog (D117 entry)` so D117 itself gets recorded per the house rule.

### m-12. GUI-reference preamble still claims "The GUI research lives in research-journaling/" (prior-audit D-1 residual)
**Location:** lines 2151-2153. The milestone table and the Mobbin paragraph (2179-2180) correctly span all four research folders; only the preamble sentence is stale.
**Fix:** change to "lives across research-journaling/ + research-fitness/ + research-nutrition/ + research-lifeos/".

### m-13. Two headings both named "Group A — logging UX" (prior-audit NEW-7 residual)
**Location:** lines 90 ("decided batch") and 182 ("all decided").
**Fix:** merge or rename the second (e.g., "Group A — logging UX (cont.)"); F-06 (vault) and F-07 (calendar query) are not logging-UX anyway.

### m-14. N-series and L-series lack their own "Incorporate list" section headers
**Location:** N-series begins at line 1017 directly after F-32 (no header); L-series begins at line 1520 directly after N-13 (no header). The F-series (84) and C-series (1848) have headers with legend/format notes.
**Fix:** add "## Incorporate list — NUTRITION SERIES (N-candidates; research: research-nutrition/MASTER-Nutrition-Research.md)" and the LifeOS equivalent, including the D082+ convention note (see M-21).

---

## Prior-audit residual verification (audits/ledger-audit-2026-08-28.md)

20 residual action items from round 2 were re-checked against the current file:

| Item | Round-2 status | Now |
|---|---|---|
| A-8 / NEW-1 (F-11 freshness-tier ruling) | PARTIAL | ADDRESSED — "CONSTANT RECONCILIATION (… corrected)" now aligns with F-01's ruling (but the line is mangled, see M-18) |
| C-1 (DecisionLog convention scope) | PARTIAL | RESIDUAL — see M-21 |
| C-2 (F-13 LANDS J5) | PARTIAL | ADDRESSED — J5 now in LANDS (line 563-564) |
| C-3 (F-18 Wilks-style lines) | PARTIAL | RESIDUAL — see M-19 |
| D-1 (GUI preamble + gap fragment) | PARTIAL | PARTIAL — fragment gone; preamble claim remains (m-12) |
| E-1 (tree IDs/status tokens; legend range) | PARTIAL | PARTIAL — status tokens added; legend still "tree-1 … tree-6" (M-14) |
| E-2 (engine-2 NOTED token) | PARTIAL | ADDRESSED — legend now defines engine-2 NOTED (line 61) |
| E-4 (C-15 hollow pointer) | PARTIAL | RESIDUAL — worse: tree-7 closed without deciding C-15 (C-2) |
| F-2 (F-30 vs F-28) | PARTIAL | ADDRESSED — F-30 now carries the F-28 carve-out cross-ref (line 1002) |
| F-3 (F-28 heatmap claim) | PARTIAL | ADDRESSED — "an M6 unbuilt milestone" (line 940) |
| NEW-2 (F-19 FUT-2) | NEW | ADDRESSED — FUT-2 constraint recorded (line 761) |
| NEW-3 (F-13 rate vs F-17 O3) | NEW | ADDRESSED — INTERACTION NOTE added (lines 653-657) |
| NEW-4 (D060's own N3/N5 clause) | NEW | ADDRESSED — clause flagged (line 128) |
| NEW-5 (F-25/F-26 REVISIT lines) | NEW | ADDRESSED — both carry REVISIT (872, 894) |
| NEW-6 (legend audit-1…10) | NEW | ADDRESSED — legend reads audit-1…audit-13 (line 59) |
| NEW-7 (two Group A headings) | NEW | RESIDUAL — m-13 |
| NEW-8 (legend F-series row) | NEW | ADDRESSED — candidate-F row exists (line 58) |
| NEW-9 (C-08 PENDING marker) | NEW | ADDRESSED — PENDING SUB-ITEM marker added (line 1952) |
| NEW-10 (audit-1/8 shell note) | NEW | ADDRESSED — both checklist lines carry the shell note (70, 77) |
| (fresh) N-03/N-11 [REVIEW] markers | — | NEW — C-3/C-4 (never flagged by the prior audit) |

---

## Series completeness (verified)

- C-01…C-15: all 15 present; statuses LOCKED 7 (03,05,06,08,09,11 + 07-SKIPPED…) — C-01/02/04 REJECTED (RESTING PLACE ✓), C-07/10/12/13/14 SKIPPED (REVISIT ✓), C-15 PENDING (unresolved — C-2).
- F-01…F-32: all 32 present; F-21/22/31/32 REJECTED (RESTING PLACE ✓), F-25/26 SKIPPED (REVISIT ✓), F-27 AGREED IN PRINCIPLE (activation trigger ✓), rest LOCKED.
- N-01…N-18: all 18 present; all LOCKED; N-03/N-11 carry stale [REVIEW] markers (C-3/C-4).
- L-01…L-15: all 15 present; L-04 REJECTED (RESTING PLACE ✓), rest LOCKED; L-15 feed-only (M-15).
- D-records: D083, D084, D085-D117 all present; D082 lives in DecisionLog.md per the header note (not a ledger record — acceptable). Ordering anomalies in m-4.
- Legend families vs usage: candidate-C/F, audit-1…13, engine-1/2, tree-1…7 (legend stale at 6 — M-14), N/L series unlisted by design (candidates carry their own prefixes; not a legend violation since the legend names the research-candidate families only — see m-14 for the missing section headers).

---

## Doc-amendment flags inventory (what the docs pass must do)

Consolidated from every "docs pass" / "amend at the docs pass" / DOC-AMENDMENT-FLAG / LANDS-amendment marker in the ledger. D117 A1 covers only the underlined core; the rest are scattered (see M-20):

1. DecisionLog: entries for D083-D117 (D117 itself — m-11); D060 override entry; N-02 online-exception + licensing + seed; N-07 D1-D7 + B4 clarification; F-18 coefficient embedding; F-05 setType schema entry; N-05 batch/containers schema entry; C-08 junction table; C-09 pause; C-11 STT (only when pursued); D-number per C/N/L row (M-21).
2. Roadmap.md: 283-288 D060 clause + N3/N5 re-open (D060); 175-177 hint-collapse interplay (F-01/F-02/F-11); 221-228 PO default styles — weight-mode = linear + GZCLP cascade (F-12); 361 rolling-mean claim (F-13); 559-560 tint-only F-07 rendering (recorded); 1027-1029 N5 -> CLOSED by F-19; M3b milestone (N-02); J5 hidden-memories exclusion (C-05); J5 Year Book link rendering (C-08); M7/M9 premises + formatVersion 3 + viewed_moments (D117 A1); 215-216 Wilks-style line (F-18 — M-19); D114/D115 mechanical-fix rows.
3. CoachSystem.md: 277 volume-balance "settings keys + setType" (F-08); 171/177/185/236 one-line x4 -> 3-5 lines (F-24); 352-357 N5 deferral -> CLOSED by F-19; anniversary = shared anchor (D102); 209-211 qualifyingEntry ">=1 real WORKING set" (F-05); 394-395/113-114 Grace wording "grace + bounded pause" (C-09); L-10 insight line placement (M-8); rule-book-session deferrals (engine-2, F-08/09/10/19/20/24/28/29/30, L-10/14, C-12/14, F-25/26/27).
4. Architecture.md: 189/268-270 rolling-mean claim (F-13); 269-270 pace-owner consumers read the rate layer (F-13); 225 Wilks-style line (F-18 — M-19); impliedTDEE owner + 20-day trendWindow (N-07); macro-derivation abstraction (N-17); L-10 owner + test fixtures.
5. Database.md: setType column (F-05); tiering/mirror/gram-reference/accumulation rule (N-02); barcode lookup (N-09); batch/containers/line-items (N-05); parse-output fields (L-01); routine pattern field (L-13); trivial-foods list (N-06); veggie-tag + water source (N-16); isBackfill + adoptedAt + event schema (D113/D117 A1).
6. Gamification.md: 113-114 Grace wording (C-09); 209-211 qualifyingEntry (F-05); anchor/six-domain/qualifyingEntry (D117 A1); v2 catalog layer map for F-25/F-27; weight ladder copy (F-15); standards trophy copy (F-18).
7. UIUX.md: logging-screen anatomy (F-02); session screen (F-03/F-23); weight screens (F-13/14/15/16); vault standards (F-17); calendar (F-07); diary surfaces (N-01/N-02/N-04/N-06/N-11/N-15); goal surfaces (L-01/02/03); day view (L-05/06/08); dashboard rules (L-07/09/12/14); tree tab + semantics contract (D117 A1); explainer sheet (N-13).
8. MediaStorage.md: voice-note audio container rule + tier applicability (C-11); boundary photos (F-15).
9. DesignSystem.md: celebration tokens with Life Tree (F-03/F-15); Heartwood naming note (D112 (5)).
10. StorageDecision.md: formatVersion 3 (D117 A1).
11. LOOPHOLES.md / life-tree-design artifacts: resolution stamps + refresh of §7/§8 (D114); register freeze at the engine contract (D116); D115 mechanical fixes (six-domain lines, SCHEMA §3 BALANCE 5->7, INPUT-INVENTORY coach_outputs rows, PLAN.md statuses, ACHIEVEMENT-SCAN "NOT locked" line).
12. Tree sections: fill tree-1..tree-6 from tree-7 (M-10); session-plan statuses (M-13).
13. AGENTS.md / DevelopmentWorkflow.md: L-11 sprawl guardrail (carried at the docs pass).