# RECURSIVE AUDIT — Life Tree Feature Scan (Step 3 synthesis)

**Audit date:** 2026-08-29 · **Auditor:** recursive audit pass
**Targets:** `life-tree-design/ACHIEVEMENT-SCAN.md` · `life-tree-design/INPUT-INVENTORY.md`
**Sources:** the 7 raw briefs in `life-tree-design/scan-outputs/` (01-data-layer, 02-achievements, 03-coach, 04-roadmap, 05-uiux, 06-media, 07-ledger) + SCHEMA.md §2.1 class standard
**Method:** full re-read of all 7 briefs (≈446 KB) and both targets; line-by-line cross-check of the achievement ladder, per-brief feature extraction vs the inventory, classification spot-checks against SCHEMA §2.1, constraint-register verification, containment scan, structure check.

---

## EXECUTIVE VERDICT: **FAIL**

The **ACHIEVEMENT-SCAN.md is clean** (task 1: all 131 trophies, all 47 rungs, all 9 families, all tiers, all 3 hard clusters verified — see Appendix A; no superseded-draft leakage; the only defects are cosmetic).

The **INPUT-INVENTORY.md is not exhaustive and contains material errors**. Three CRITICAL findings: the entire C-series of locked features is missing or misattributed (0 of 6 correctly present); the locked C-11 voice-note entry type is missing **and actively contradicted** ("NO voice notes"); and 23 of the 25 locked F-series features are absent from a document that claims "exhaustive in coverage, nothing summarized." A false PASS here would seed the input map (Step 5) with wrong assumptions — the C-11 contradiction alone would have gated out a locked input surface.

---

## FINDINGS

### CRITICAL (missing / incorrect content)

**C-1. C-series locked features: 0 of 6 correctly present; two rows are misattributed to fabricated features.**
Location: INPUT-INVENTORY.md §3 (journal surface).
- The row **"NL parser for entries (C-03 locked)"** misattributes C-03. Per 07-ledger.md:22–41, **C-03 is AUTO-CONTEXT CAPTURE** (entries auto-gain context chips: media of the day, workouts logged, habit status, weigh-in, return-after-gap note, location, weather — with a documented Life Tree relevance). No "NL parser for entries" feature exists anywhere in the 7 briefs: journal NLP is explicitly deferred (04-roadmap.md §19, "real NLP stays out (D004)"), and the only NL parser is **L-01** (goals/tasks capture, 07-ledger.md:885–901). The name is fabricated, the citation is wrong, and C-03 itself never appears.
- The row **"Voice/quick capture (C-06)"** misattributes C-06. Per 07-ledger.md:55–61, **C-06 is THEN & NOW SELFIE COMPARE** (companion to the D031 physique timeline, explicit Life Tree tie). The dashboard "quick capture" that does exist (05-uiux.md §2/§15) is a **text** row ("What happened today?"); no "voice" quick capture exists. C-06's real content is absent.
- **C-05 Memory Hygiene** (07-ledger.md:43–53, memory-hide flags that tree surfaces must respect) — **missing entirely**.
- **C-08 Wikilinks + unlinked-mention suggestions** (07-ledger.md:63–79, entry↔entry link graph) — **missing entirely** (the §13 "links table" row refers to the different Graph-view future table, 04-roadmap.md §17).
- **C-09 Gentle Return + Pause** (07-ledger.md:81–94, pause records; "pause/gap/return events shape streak-derived visuals (buds, streaks)") — **missing entirely**.

**C-2. C-11 voice-note entry type (LOCKED) is missing AND contradicted.**
Location: INPUT-INVENTORY.md §10 ("Vlogs (video — the ONLY audio; voice notes DO NOT exist in docs — verified)") and §14 ("NO voice notes (does not exist in docs — verified by grep; only vlogs)").
07-ledger.md:96–109 records **C-11 VOICE-NOTE ENTRY TYPE — LOCKED, user yes** (third journal entry type; on-device audio media item; "A journal entry type the tree's leaf mapping must account for (audio entries)"). It is repeated in D088's fork definitions ("journal photo/voice (C-11)/text", 07-ledger.md:1534) and the ledger's own input summary ("entries (text/photo/vlog/voice — C-11)", 07-ledger.md:1909). The 06-media.md:43 grep claim ("No standalone voice-note media type exists anywhere in docs/") is **scoped to docs/MediaStorage.md + docs/ only** — it never covered TEMP-PLANNING.md, which is one of the 7 scanned sources. The synthesis promoted a scoped negative to a global lock, contradicting a scanned source and dropping a locked input. The D088 journal fork (photo/voice/text) is thereby also left without its voice branch.

**C-3. F-series: 23 of 25 locked features absent.**
Location: INPUT-INVENTORY.md §5 (GYM / FITNESS SURFACE).
Only **F-05** (setType W/D/F) and **F-19** (Recovery, N5→F-19) appear. Absent: **F-01** (inline previous-session comparison), **F-02** (logging-screen anatomy), **F-03** (PR celebration ceremony — "the celebration VISUAL/ANIMATION LANGUAGE IS HELD until the Life Tree design session", 07-ledger.md:143–161), **F-04** (plate/warm-up calculators), **F-06** (PR grid), **F-07** (filterable calendar highlights), **F-08** (MEV/MAV/MRV volume bands + decision table), **F-09** (expected-vs-actual effort table — the sole effort signal, engine-internal), **F-10** (TM adjustment on Epley), **F-11** (inactivity decay + absence classification — "absence/period structures are already-read inputs"), **F-12** (GZCLP stage cascade), **F-13** (Libra EMA trend/rate/prediction — "INPUTS PRODUCED (CRITICAL)"), **F-14** (rate-vs-target bar), **F-15** (milestone hero ring + forecast range + boundary photos — "direct Life Tree tie"), **F-16** (eyes-closed one-tap weigh-in), **F-17** (standards vault honesty — population labels + BW multiples), **F-18** (Strength Score IPF DOTS — "a strong candidate for a gym-domain / branch-girth derived metric"), **F-20** (ramp-rate guardrails + recovery estimate), **F-23** (pre-session Adapt affordance — "adapted" marker feeds adherence), **F-24** (weekly Coach message depth 3–5 lines), **F-28** (sets-per-muscle chart), **F-29** (movement-balance ratios — "potential tree balance signal"), **F-30** (NSPI composite — folded). The section title claims "(F-series + M2…)" coverage and the doc's header claims exhaustive coverage; the D060-closure row ("fitness inputs are FINITE as of M2") appears to have been used as license to skip enumeration.

### MAJOR (incomplete)

**M-1. N-series: 11 of 18 locked features absent.**
Location: INPUT-INVENTORY.md §6.
Present: N-01, N-02, N-07, N-13, N-15, N-16 (+ M3b micros as a milestone). Absent: **N-03** (adherence-neutral compliance math — "relevant to any nutrition-derived tree input"), **N-04** (plan-confirm logging + gap rebalance — meal-slot adherence), **N-05** (pack model with containers/line-items — "a full meal-prep input stream"), **N-06** (free-foods list + honesty footnotes), **N-08** (exercise kcal display-only), **N-10** (one-time recipe substitution), **N-11** (gram-anchored portion stepper), **N-12** (density facts as neutral Coach lines), **N-14** (per-meal protein pacing facts), **N-17** (diet-mode re-derivation abstraction), **N-18** (vendor-resilient export).

**M-2. L-series: 9 of 14 locked features absent.**
Location: INPUT-INVENTORY.md §4/§5/§9.
Present: L-05, L-06, L-10, L-13, L-14 (L-02 only partially — the won-archive half appears in §7; the 2-day slip indicator is absent). Absent: **L-01** (NL capture + curated Today — the source of NL-parsed goal rows, and the only legitimate "NL parser" in the system), **L-03** (pace-line visualization), **L-07** (show-if-not-empty — its own brief notes a "no data" input state "incl. any tree surfaces"), **L-08** (neutral deviation badges), **L-09** (per-block skeletons), **L-11** (sprawl guardrail — D088 explicitly applies it inside the tree), **L-12** (numbers>charts), **L-15** (life-scale grid — "a research feed for the LIFE TREE DESIGN SYSTEM session").

**M-3. Coach-output 9-kind enumeration is invented.**
Location: INPUT-INVENTORY.md §9 ("Coach outputs (9 kinds: message, toast, summary, insight, question…)").
The actual 9 kinds, verbatim in 01-data-layer.md §7.2, 03-coach.md item 31, and 04-roadmap.md M8-3, are: `daily_note`, `nudge`, `briefing`, `check_in_weekly`, `nutrition_checkup`, `milestone_review_goal`, `milestone_review_anniversary`, `phase_close`, `pattern_alert`. None of "message / toast / summary / insight / question" appears anywhere in the 7 briefs (grep-verified, 0 hits). The count (9) is right; the enumeration is fabricated — a containment violation on a row the tree's symbiosis mapping reads.

### MINOR (cosmetic / small inaccuracies)

1. **§1 header "23 event types" vs 22 rows.** The event table lists 22 types (8 IMPL + 12 DOC + 2 future), matching the brief's own count ("20 specified (8 emitted by current M0 code) + 2 future", 01-data-layer.md §15). The header number is off by one.
2. **§2.2 milestone labels use stale numbering.** "Goals/tasks (M1), fitness/health (M1…), nutrition (M1…)" — per 04-roadmap.md §0.1 (D081 renumbering), these are M5/M2/M3; §13 of the same inventory uses the new numbering. Internally inconsistent (faithful to the data-layer brief's source doc, but confusing).
3. **§10 "Drive sync (CloudMediaAdapter — M3–M5)"** — old-numbering label; §13 correctly says M10–M13 (04-roadmap.md §0.1). Contradicts the sibling section.
4. **§15 class-3 row lists "gym sets/PRs"** while the event table (§1) and §5 classify `workout.pr` as class 4 (dated event) — internal inconsistency on the summary table.
5. **§3 "Areas (journal areas/domains) | 4 dated event"** — a Life Area is a taxonomy, not a dated event; class 1 (content attribute) or 7 fits better.
6. **§8 "Periods (menstrual etc.) | 3+7"** — periods are dated ranges; class 4+7 fits better than 3 (measurement).
7. **§5 "Day-plan line (L-06) | 5+7" and §8 "Performed days (plan-vs-actual) | 5+7"** — plan-vs-actual is not goal progress (class 5); 2+7 (completion vs presence) fits better. Classification stretch, not fatal.
8. **§12 interactions "fasting start/end", "check-in respond", "capture from vault"** — N-15 is explicitly "NOT a fasting product… no timers" (07-ledger.md:723–739) so there is no start/end logging; the coach brief records "NO follow-up/reply mechanism" (03-coach.md item 87) so "check-in respond" is questionable; the vault browser is browse/search, not capture. Minor misleading wording.
9. **§14 one-notification flag is honest but incomplete.** The flag ("NOT documented in UIUX/Coach docs — flagged ambiguity") is accurate for 05-uiux and 03-coach, but the ledger — also a scanned source — documents "one notification/day" in **F-19** (07-ledger.md:417), **F-24** (:470), **L-10** (:1042), **C-14** (:1232). The inventory could have partially resolved the ambiguity it flagged.
10. **§7 "Gtmhub model"** — zero hits in all 7 briefs (grep-verified). Invented external reference; harmless to mapping but a containment violation.
11. **ACHIEVEMENT-SCAN.md mojibake** — double-encoded em-dashes "â€" at ≥7 locations (lines 1, 12, 18, 24, 32, 41, 44). Cosmetic; INPUT-INVENTORY.md is clean.
12. **ACHIEVEMENT-SCAN.md §4 secondary-axes list is incomplete** — the brief's cross-domain coincidence list has 6 items (02-achievements.md §8: Wrote It Down, Eyes on the Data, Somewhere Else Still You, The Turn of the Page, Six for Six, The Living Archive); the scan lists 4, omitting Somewhere Else, Still You and The Turn of the Page. Illustrative list, no mapping impact.
13. **ACHIEVEMENT-SCAN.md §3 rung table has duplicated header rows** (lines 254–255 and 275–276) splitting R25–R43 and R44–R47 with repeated table headers. Cosmetic.

---

## Appendix A — ACHIEVEMENT-SCAN verification (task 1) — PASS

- **Families:** all 9 present with exact census names and counts (I 17, II 15, III 28, IV 14, V 16, VI 4, VII 12, VIII 20, IX 5 = 131) — matches 02-achievements.md §1 census.
- **All 131 trophies:** cross-checked individually (id + name + tier) against 02-achievements.md §3.I–3.IX. Zero missing, zero misnamed, zero wrong tier.
- **Multi-tier trophies (9):** I-9 (Root→Branch→Heartwood→Grove), I-12 (B→H→G), I-13 (R→B→H), III-18 (Branch/Heartwood/Grove), III-19 (R→B→H→G), V-5 (B→H→G), VII-7 (R→B→H→Ring→G), IX-1 (Sprout→R→B→H→Ring), IX-4 (R→B→H) — all match the brief's tier annotations exactly.
- **Distribution claim** "Sprout 8 · Root 19 · Branch 28 · Heartwood 26 · Ring 10 · Grove 31 · multi-tier 9" — independently recounted from the scan's own tables: 8+19+28+26+10+31+9 = 131 ✓ (counting method differs from the brief's approximate "per top tier" distribution but is internally consistent and complete).
- **All 47 rungs:** R1–R24 (absolute lift), R25–R43 (bodyweight), R44–R47 (tonnage) — exercise, threshold, name, tier, spec source all match the brief's §4 tables, including the census-corrected "Fifty Push-Ups" name.
- **Hard clusters:** robot-consistency family (I-4, II-9, III-22, V-3, IV-5, IX-5 — no-grace/hard-miss/planned-rest-freeze semantics verbatim); Vow/Old Growth cluster (VIII-7/8/9/10 with "hardest to fake" and "ceiling achievement" quotes); Ghost in the Machine (IX-5, 90-day three-way overlap, "odds effectively zero" quote). ✓
- **Superseded draft:** §6 exclusion note correct; zero ACH-F/J/H/FS/FB/N/G/P/U/L entries leak into the ladder; ~80-entry count and family list match 02-achievements.md §10.
- **Constraints §5:** derived-only, forbidden list, 1-day/7-day grace + 2-day-rule heritage, 20-vs-40 word floors, no claim tables (01-data-layer.md §12 "No achievement/claim/progress tables exist or are planned"), gold streaks-only — all trace to sources.
- Minor defects only: items 11–13 above.

## Appendix B — Constraint register verification (task 4)

| Constraint | Verdict | Source |
|---|---|---|
| C-04 rejection (no mood) | ✓ | 07-ledger.md §5; L-10(c) proxies; D088 honest skips |
| F-21/F-22 rejection; F-09 sole effort signal | ✓ | 07-ledger.md §5 |
| Voice notes absence | ✗ **WRONG** (C-11 LOCKED) | 07-ledger.md:96–109 — see CRITICAL-2 |
| D069: barcode approved / photo-AI rejected | ✓ | 07-ledger.md N-09 + D069 |
| Gold = streaks only | ✓ | 05-uiux.md §0 (D:L34, D:L81, D:L190) |
| Calendar tint-only, dayActivityScore owner | ✓ | 05-uiux.md §5.1; 04-roadmap.md M6-1 |
| Coach never sees journal text | ✓ | 03-coach.md items 64–65 + surprise 3 |
| No claim tables | ✓ | 01-data-layer.md §12 |
| One-notification ambiguity flag | ✓ (but ledger evidence missed) | 03-coach.md items 6/87; 05-uiux.md §0; ledger F-19/F-24/L-10/C-14 |
| Aerial-roots scrapped | ✓ | 07-ledger.md §9C (SCRAPPED) |

## Appendix C — Classification spot-checks (task 3, 40+ checked)

Correct: habit.completed→2, habit.missed→7, goal.completed→5, task.completed→2, workout.pr→4, body.weighed→3, nutrition.logged→3, media.added→1, habit.rest_planned→4, reflection.created→1, fasting windows→3+4, setType→3, check-ins→2, L-10→7(derived), won-archive→5, calendar→4+7, anniversary anchor→4.
Questionable (see MINOR 4–7): Areas→4, Periods→3+7, plan-vs-actual→5+7, §15 "PRs" under class 3.

## Appendix D — Structure (task 6)

Both docs: coherent numbered sections, no placeholders, no broken pointers; INPUT-INVENTORY references scan-outputs/ correctly and notes the audits/ location. Defects limited to MINOR 11–13.

---

**Bottom line:** ACHIEVEMENT-SCAN.md can be accepted as-is (cosmetic fixes only). INPUT-INVENTORY.md must be revised before Step 5: re-extract the C/F/N/L locked-feature surface from 07-ledger.md (63 features), correct the C-03/C-06 misattributions, restore C-11 (and reconcile the "no voice notes" constraint), fix the coach 9-kind enumeration, and re-audit.

---

# PASS 2 — verification after fixes (recursive audit, 2026-08-29)

**Method:** full re-read of the revised INPUT-INVENTORY.md (306 lines) and ACHIEVEMENT-SCAN.md (346 lines); per-finding re-verification against 07-ledger.md §1–§13 (census lines 1965–1981), 03-coach.md item 31 (lines 235–237), F-23/N-04/N-15 ledger detail; byte-level encoding checks on both targets (UTF-8 strict decode + Latin-1 double-encode scan); grep checks for Gtmhub, the invented coach enumeration, "NO voice notes" claims, and placeholders.

## EXECUTIVE VERDICT: **PASS-WITH-FIXES**

All 3 CRITICALs are FIXED and verified verbatim against the ledger. M-1 and M-3 are FIXED. **M-2 is NOT FIXED — 6 of the 14 locked L-series features are still absent** (L-07, L-09, L-11, L-12, L-14, L-15), two of which (L-11 sprawl guardrail, L-15 life-scale grid) have explicit tree relevance. The mojibake is partially fixed (1 instance remains at ACHIEVEMENT-SCAN.md:31). The revised doc's own header claim "all CRITICAL/MAJOR findings fixed" (INPUT-INVENTORY.md:3–4) and §16's "pass 1 → PASS-WITH-FIXES" (:305) are therefore inaccurate and must be corrected together with the M-2 completion. Targeted fixes required before Step 5 consumes this document.

## PER-FINDING STATUS (pass 1 → pass 2)

| Finding | Status | Evidence |
|---|---|---|
| **C-1** C-series 0/6 | ✅ **FIXED** | All 6 locked C-series rows present with correct attributions (§3:78–83): C-03 AUTO-CONTEXT CAPTURE (chip list matches 07-ledger.md:22–41 — media/workouts/habits/weigh-in/return-after-gap/location/weather-pending), C-06 THEN & NOW SELFIE COMPARE (ledger :55–61), C-05 Memory Hygiene (:43–53), C-08 Wikilinks + unlinked-mention suggestions (:63–79), C-09 Gentle Return + Pause (:81–94), C-11 Voice-note LOCKED (:96–109). NL-parser row now explicitly "(L-01, NOT C-03…)" (§3:85). |
| **C-2** C-11 missing + contradicted | ✅ **FIXED** | C-11 restored as LOCKED in §3:83, §10:211 ("VOICE-NOTE ENTRIES (C-11 — LOCKED…)") and §10:218, §12:234. Constraint register §14 no longer contains any "NO voice notes" claim (grep: 0 hits). D088's voice branch is thereby restorable. |
| **C-3** F-series 23/25 absent | ✅ **FIXED** | All 25 present (§5:110–134 = F-01…F-20, F-23, F-24, F-28, F-29, F-30; count verified 25/25) — matches census 07-ledger.md:1970. F-03 row correctly notes "DESIGN LANGUAGE HELD for the Life Tree session" (ledger :143–161); F-13 "CRITICAL", F-18 DOTS "ONLY meta score (F-30 folded)", F-30 FOLDED rows all match ledger :303/:379/:505. |
| **M-1** N-series 11/18 absent | ✅ **FIXED** | All 18 present (§6:145–162 = N-01…N-18; count verified 18/18) — matches census 07-ledger.md:1973. |
| **M-2** L-series 9/14 absent | ❌ **NOT FIXED (partial: 8/14)** | Now present: L-01 (§3:85), L-02 incl. 2-day slip (§7:179), L-03 (§7:175), L-05 (§7:176), L-06 (§7:177), L-08 (§7:178), L-10 (§9:202), L-13 (§4:102, §8:186). **Still absent: L-07 SHOW-IF-NOT-EMPTY BLOCKS (ledger :973 — its brief notes a "no data" input state incl. any tree surfaces), L-09 PER-BLOCK SKELETONS (:1013), L-11 SPRAWL GUARDRAIL (:1064 — ledger :1076/:1531 applies it INSIDE the tree: "no templates, no made-up splits"), L-12 NUMBERS>CHARTS (:1079), L-14 STRENGTH-VS-HEATMAP ORDER (:1093), L-15 LIFE-SCALE GRID (:1106 — "a research feed for the Life Tree design session").** Census: 07-ledger.md:1974. |
| **M-3** coach 9-kind enumeration invented | ✅ **FIXED** | §9:198 now lists the 9 REAL kinds verbatim: daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert — byte-identical to 03-coach.md:235–237 and 01-data-layer.md §7.2. Grep: 0 hits for the old invented "message/toast/summary/insight/question" enumeration. |
| Minor 10 (Gtmhub) | ✅ **FIXED** | 0 hits in both targets (grep-verified). |
| Minor 11 (mojibake) | ⚠️ **PARTIALLY FIXED** | Em-dash double-encoding gone (0 "â€"" hits; byte scan clean). ONE instance remains: ACHIEVEMENT-SCAN.md:31 "Rootâ†'Branchâ†'Heartwoodâ†'Grove" — double-encoded U+2192 arrows, must read "Root→Branch→Heartwood→Grove". Header (lines 1–17) is clean. |
| Minors 1–9, 12, 13 | ⏸️ **UNCHANGED (cosmetic)** | See "Still-open pass-1 minors" below — not part of the pass-1 fix contract (pass-1 bottom line: ACHIEVEMENT-SCAN accepted as-is; inventory required the C/F/N/L + coach fixes), but recorded for completeness. |

## COMPLETENESS RE-CHECK (task 2 — ledger's full locked list, 63 features)

Ledger census (07-ledger.md:1965–1981) = 6 C + 25 F + 18 N + 14 L = **63 locked feature decisions**. Revised inventory: **57/63 present** — C 6/6, F 25/25, N 18/18, L **8/14**. All 57 verified present exactly once as their own row; benign cross-section references exist for C-11 (§3 + §10 + §12), N-16 (§4 + §6), L-13 (§4 + §8) — dual-surface items, no contradiction, no double-count in the summary (§15 lists each class's feeds once). The 6 absent features are all L-series (see M-2). Also unenumerated: **engine-1** (ledger counts "63 locked feature decisions + engine-1", :1976/:1979) — the locked event→rule execution architecture — and tree-7's 5 locked D-decisions D085–D089 (tree-internal; only D087/D088 are referenced, §4 header and §9 L-10 row). Minor.

## CLASSIFICATION SPOT-CHECKS (task 3 — 10 NEW, not in pass 1)

| Feature | Inventory class | Verdict |
|---|---|---|
| C-05 memory hygiene | 7 | ✅ correct (display state flag) |
| C-11 voice-note entry | 1 | ✅ correct (content leaf, audio substance) |
| C-08 wikilinks | 1 | ✅ correct (leaf relationship metadata) |
| F-09 effort table | 3 | ✅ correct (sole effort signal) |
| F-11 inactivity decay | 7 | ✅ correct (absence → dormancy) |
| F-16 eyes-closed weigh-in | 3 | ✅ correct |
| F-18 DOTS | 3 | ✅ correct (derived meta-metric) |
| N-08 exercise kcal | 3 | ✅ correct (display-only measurement) |
| N-11 portion stepper | 3 | ✅ correct |
| F-23 adapt affordance | 2 | ✅ acceptable ("adapted" marker modifies workout.completed) |

Stretches observed (same family as pass-1 minor #7, not fatal): F-03 "6+4" (PR is class 4; the 6 is flower-language adjacency — D086-adjacent but PRs are not trophies), N-04 "3+5" (meal-slot adherence is completion/presence by the doc's own convention), L-02 "2+5" (slip indicator is presence → 7). Also: §12 "eating-window start/end" is now judged **defensible** — ledger N-15 (:723–739) does have a start/end window schedule with per-day exceptions; pass-1 minor #8 over-read "no timers". "Check-in respond" (coach brief records no follow-up/reply mechanism) and "capture from vault" (browse/search only) remain questionable wording.

## STRUCTURE CHECK (task 4)

Both documents well-formed: coherent numbered sections, no placeholders (grep: 0 hits for TODO/TBD/XXX/FIXME/lorem), section pointers resolve (scan-outputs/, ACHIEVEMENT-SCAN.md cross-refs, audits/ path). Two **NEW accuracy defects** in INPUT-INVENTORY.md's own meta-claims: (1) header :3–4 "all CRITICAL/MAJOR findings fixed" is false while M-2 stands; (2) §16:305 "pass 1 → PASS-WITH-FIXES → fixed" misstates the pass-1 verdict (it was FAIL) and overclaims completion.

## NEW FINDINGS (pass 2)

- **N-1 (MAJOR, = M-2 open):** 6 locked L-series features absent — L-07, L-09, L-11, L-12, L-14, L-15 (§5/§7/§8/§13 candidates; L-11 and L-15 are explicitly tree-relevant per ledger :1076/:1531/:1106). Compound defect: the doc's "all fixed" claims (header + §16) are inaccurate until this lands.
- **N-2 (MINOR):** L-01 placed in §3 (journal surface) with "leaf metadata (parsed facts)" mapping — it is the M5 goals-domain NL capture producing NL-parsed goal/task rows (ledger :885–901); sensible home is §7/§13 with a fruit-domain mapping. Attribution is correct (the pass-1 C-1 requirement); placement/mapping is off.
- **N-3 (MINOR):** engine-1 locked block and tree-7's D085–D089 not referenced anywhere in the inventory (ledger counts them in its locked total).
- **N-4 (MINOR):** strict "exactly once" violated for C-11/N-16/L-13 (benign cross-section references — required by C-2's own restoration demand, so not a regression).

## STILL-OPEN PASS-1 MINORS (cosmetic; unchanged)

#1 §1:22 "23 event types" vs 22 table rows · #2 §2.2 stale M1 labels vs §13's M5/M2/M3 · #3 §10:219 "Drive sync (CloudMediaAdapter — M3-M5)" vs §13's M10–M13 · #4 weakened: §15:292 "gym (F-01…F-30)" blanket (F-03/07/11/15/19/20/23/24 are not pure class 3) · #5 Areas→4 (§3:90) · #6 Periods→3+7 (§8:191) · #7 5+7 plan-vs-actual convention (unchanged, accepted) · #8 partially valid (check-in respond, capture from vault; fasting start/end now cleared) · #9 one-notification flag still uncited to ledger F-19/F-24/L-10/C-14 · #12 ACHIEVEMENT-SCAN §4 secondary axes 4/6 (missing Somewhere Else, Still You + The Turn of the Page) · #13 ACHIEVEMENT-SCAN rung-table duplicated headers (:254–255, :275–276).

**Bottom line (pass 2):** The revision closed all three CRITICALs and two of three MAJORs with verbatim-verified content — the inventory is no longer misattributing or contradicting locked features. One MAJOR gap remains (6 L-series rows; L-11 and L-15 are tree-relevant) plus one remaining mojibake byte and the now-false "all fixed" header claims. **Verdict: PASS-WITH-FIXES** — land the 6 L-series rows (§7/§8/§13, ~30 min), fix ACHIEVEMENT-SCAN.md:31, correct the header/§16 claims, then Step 5 may consume this document. ACHIEVEMENT-SCAN.md remains acceptable as-is apart from the line-31 mojibake.
## PASS 3 (mechanical verification, 2026-08-29) - all pass-2 findings closed

- M-2 (6 missing L-series rows) - FIXED: L-07, L-09, L-11, L-12, L-14,
  L-15 now present (INPUT-INVENTORY 13.1 + section 5 for L-14); L-11
  governance + L-15 design feed explicitly tree-relevant.
- ACHIEVEMENT-SCAN.md:31 arrow mojibake - FIXED (3 double-encoded
  arrows replaced; 25 clean arrows verified, 0 remnants).
- N-1 (false header claims) - FIXED: header now says "recursive audit
  passes 1-2"; section 16 updated to "passes 1-2; pass 2:
  PASS-WITH-FIXES, all findings fixed".
- N-2 (L-01 placement) - FIXED: L-01 placement note added (13.2).
- N-3 (engine-1 / D085-D089) - noted: engine-1 recorded in ledger
  section 8 of the brief; D085-D089 are the tree's own session
  decisions (tree-7), referenced by the input map where relevant.
- N-4 (benign cross-refs for C-11/N-16/L-13) - accepted as cross-refs,
  not omissions.

VERDICT: PASS (all CRITICAL/MAJOR findings from passes 1-2 resolved;
9 pass-1 cosmetic minors remain as cosmetic-only, tracked in the
pass-1 report).

The Step-3 scan is complete: 7 raw briefs + INPUT-INVENTORY.md + 
ACHIEVEMENT-SCAN.md + this 3-pass recursive audit trail.
