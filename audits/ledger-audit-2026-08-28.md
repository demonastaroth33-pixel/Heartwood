# Ledger Audit — TEMP-PLANNING.md (generation 2) vs live docs

Date: 2026-08-28 · Auditor: independent audit agent (fresh context)
Method: TEMP-PLANNING.md read in full (1289 lines); docs/README-ordered docs read in
full (Roadmap, CoachSystem, Database, Architecture, Gamification, UIUX,
MediaStorage, DecisionLog-skim); lib/ tree cross-checked (glob + grep);
referenced research masters / achievement files / RUNBOOK existence-checked.
No files edited. FINDING = confirmed problem · RISK = needs human decision.

---

## A. CLASHES — ledger entries that contradict a locked doc statement

- [HIGH] TEMP-PLANNING.md:283-288 vs TEMP-PLANNING.md:88-847 — Roadmap.md:283-288
  locks "Fitness surface CLOSED (D060): no new features for the fitness side…
  add only when real usage says so." F-01/F-02/F-04/F-05/F-06/F-07/F-08/F-09/F-10/
  F-11/F-12/F-13/F-14/F-15/F-16/F-17/F-18/F-19/F-20/F-23/F-24/F-28/F-29/F-30 add
  ~24 fitness features as LOCKED without a single LANDS chunk recording the D060
  amendment. The generation mandate implicitly supersedes D060, but the
  contradiction is never stated — DecisionLog will end up holding both "closed"
  (D060) and the new locks with no explicit override record. — Why it matters:
  a future reader following D060's "revisit only with real usage" would judge
  the whole F-series out of order. — Fix: one LANDS/DecisionLog note per batch:
  "D060 superseded for these named features (gen-2, user yes); closure list
  amended."

- [MED] TEMP-PLANNING.md:603-633 vs Roadmap.md:1027-1029 + CoachSystem.md:352-357 —
  F-19's own title says "N5 revival" while Roadmap idea-park N5 (Roadmap.md:1027-1029)
  and CoachSystem.md:352-357 ("Deferred: recovery readiness (N5)… Skipped for now;
  the deferred line keeps…") both still read as parked/deferred. The revival is
  recorded in F-19's header but no LANDS chunk flags the two lines that become
  false (idea-park N5 entry + CoachSystem deferred-N5 section). — Why: the docs
  pass would leave N5 double-recorded (deferred AND locked). — Fix: add
  "Roadmap idea-park N5 → closed by F-19; CoachSystem §Deferred N5 → moved" to
  F-19's LANDS.

- [MED] TEMP-PLANNING.md:428-473 vs Architecture.md:189/268-270 + Roadmap.md:361 —
  F-13 replaces rollingWindowMean with a time-indexed EMA; the LANDS (TEMP:470-473)
  records "trend owner replaces rollingWindowMean for body only — engine keeps the
  shared window util," but (a) Architecture.md:189 and :268-270 state
  "the ONLY rolling-average math in the engine" (an absolute claim that becomes
  false), (b) Architecture.md:269-270 lists the owner's consumers ("serves phase
  pace, goal pace, ratios, trophies, weight-goal pace") and F-13's RATE
  (TEMP:444-446) is "the kg/week number the locked pace logic reads" — so the
  pace-owner input changes beyond "body only", (c) Roadmap.md:361 (M3) repeats
  the "only rolling-average math" claim and is not in LANDS at all. — Why:
  three doc lines will silently contradict the lock. — Fix: LANDS must name
  Architecture.md owner-catalog rows + Roadmap.md:361 + the paceVerdict input
  change explicitly.

- [MED] TEMP-PLANNING.md:362-401 vs CoachSystem.md:277 — F-08's working-set
  counting depends on F-05's `setType` column (TEMP:251-253: "Database.md (setType
  column — schema change)"), while CoachSystem.md:277 says volume balance =
  "Settings keys only; zero core schema change." The contradiction is only
  implied via F-05's LANDS; CoachSystem.md:277's amendment is not flagged. — Why:
  a reader of the Coach doc gets a false "no schema" promise. — Fix: F-08 LANDS
  should name CoachSystem.md §Volume balance amendment (schema change via F-05).

- [MED] TEMP-PLANNING.md:686-704 vs CoachSystem.md:171/177/185/236 — F-24 upgrades
  the weekly Coach line into a 3–5-line message; the docs say "one Coach line per
  strictness" in four places (check_in_weekly :171, nutrition_checkup :177,
  phase_close :185, milestone-review :236). F-24 records the upgrade but LANDS
  only says "CoachSystem.md (weekly message template — rule-book session)" — the
  four singular-line phrasings are not named. — Fix: LANDS should list the
  "coach-line-per-strictness" lines to amend.

- [MED] TEMP-PLANNING.md:941-955 vs Gamification.md:113-114 + CoachSystem.md:394-395 —
  C-09's PAUSE MODE "freezes streaks for a known-away period" (TEMP:947-953) is a
  streak shield, while Gamification.md:113-114 locks "Grace is the ONLY finite
  streak shield — quiet weeks never shield streaks" and CoachSystem.md:394-395
  rejects a second shield ("two shields would become one unlimited shield").
  C-09 draws the pause-vs-grace-vs-quiet-week distinctions but never flags that
  "Grace is the ONLY finite streak shield" becomes false, nor that planned-rest
  (CoachSystem.md:411-413) already provides a per-habit freeze mechanism pause
  overlaps. — Why: an unlimited-count pause could become the exact "unlimited
  shield" the locked doc forbids (MOSTLY OFF helps, but the guard is unrecorded). —
  Fix: LANDS must name the Gamification Grace section + add a cap/guard (e.g.,
  pause durations bounded, or "pause ≠ shield, still records the away period").

- [MED] TEMP-PLANNING.md:899-912 vs Roadmap.md:113-119 + UIUX.md:231-238 — C-05
  locks "hidden-ness applies EVERYWHERE memories surface — including exports /
  Year Book PDFs" (TEMP:905-908), which changes J5 Year Book's spec ("packages a
  copy"; Roadmap.md:113-119, UIUX.md:231-238). C-05 LANDS covers only "J1 scope
  (Roadmap M1) · UIUX.md (strip controls)" — the J5 change is never flagged. —
  Why: the docs pass would ship a Year Book that leaks hidden memories. — Fix:
  add Roadmap M1 J5 + UIUX.md J5 to C-05 LANDS.

- [MED] TEMP-PLANNING.md:324-346 vs Roadmap.md:175-177 + UIUX.md:261-263 — locked
  freshness tier: ">4wk collapsed AND PO suggestions pause (~90% of last-time
  starting baseline instead of +2.5 kg)"; F-11 locks a ~10–20%/week decay
  (TEMP:338-339), which at 4 weeks yields ~60–80% — a different curve for the
  same surface. F-11 says it "completes the locked N2 return ramp" but never
  reconciles the two constants. — Why: two locked numbers for one starting-load
  suggestion. — Fix: record which wins (flat 90% floor vs weekly decay) and the
  interaction window.

- [MED] TEMP-PLANNING.md:123-128 vs Roadmap.md:540-606 — F-07's WHAT says "shares
  the M6 calendar surface" but its LANDS says "Roadmap M2" — the calendar is an
  M6 milestone (Roadmap.md:540+); the surface cannot land in M2. Additionally the
  M6 grid is locked tint-only, "no glyphs, emojis, or numbers" (Roadmap.md:559-560,
  UIUX.md:148-149) and F-07's query-highlight mechanism ("bench >80kg × ≥5") is
  not reconciled with tint-only. — Why: wrong milestone + un-reconciled visual
  rule. — Fix: LANDS → Roadmap M6; add a tint-only-compliant rendering note.

- [MED] TEMP-PLANNING.md:924-940 vs CoachSystem.md:437-441 — C-08's UNLINKED-
  MENTION SUGGESTIONS ("you mentioned 'X' in N entries — link them?", TEMP:931-933)
  requires scanning entry text to detect mentions, contradicting its own decision
  "no text analysis — matching is on names/areas/tags only (facts-safe)"
  (TEMP:936-938) and the per-feature privacy-stamp rule (CoachSystem.md:437-441:
  every journal-reading feature gets "facts only" OR "needs text access → opt-in
  first"). C-08's LANDS (TEMP:939-940) has no privacy-stamp statement. — Why: an
  unstamped text-reading feature ships against the locked privacy model. — Fix:
  either define mention detection on metadata only, or record the
  "needs text access → user opt-in first" stamp in LANDS.

- [LOW] TEMP-PLANNING.md:936 vs Roadmap.md:113-119 — C-08: "links export as
  `[[name]]` in Year Book (lossless)" — the Year Book is a rendered human PDF
  (Roadmap.md:113-119, UIUX.md:231-238); raw `[[wiki]]` syntax inside a PDF is
  dead text, not lossless. — Why: an impossible export format promise. — Fix:
  reconcile (markdown export? footnote-style links in PDF?) and record.

- [LOW] TEMP-PLANNING.md:88-99 vs Roadmap.md:175-177 — F-01's "ALWAYS show, with
  STALENESS LABELING" vs the locked >4wk-collapsed tier. The F-01 OVERLAP NOTE
  (TEMP:168-171) asserts "no conflict — compounding" without addressing
  "always show" vs "collapsed". — Why: two surfaces may disagree on staleness. —
  Fix: state the interaction (collapse applies to per-set hints; F-01's card-level
  comparison stays visible, stale-labeled).

- [LOW] TEMP-PLANNING.md:956-971 vs MediaStorage.md:190-191 — C-11 stores audio
  "same media path as vlog" and "media storage rules apply," but durationSec is
  specified to be measured via "phone capture returns the finished duration; PC
  adoption parses the MP4/MOV container header" (MediaStorage.md:190-191) — no
  audio container path; vlog-only rules (local buffer nudge, PC-archive prompt,
  tier-aware delete) have no stated audio applicability. — Why: build ambiguity
  for the third entry type. — Fix: LANDS should note audio duration handling +
  which tier rules apply to voice notes.

- [LOW] TEMP-PLANNING.md:347-361 vs Roadmap.md:221-228 — F-12 locks "cascade
  DEFAULT for weight-mode exercises" while Roadmap.md:221-228 locks
  LINEAR-WEIGHT as the compound default style; the change of default is decided
  but not reconciled with the PO styles list. — Why: two defaults on record. —
  Fix: LANDS note "PO default styles amended for weight-mode exercises (F-12)".

- [LOW] TEMP-PLANNING.md:1011-1024 vs CoachSystem.md:445-446 — C-13's "small
  'review streak' rewards checking memories daily" (TEMP:1016) is a reward for
  reading/checking — the never-list forbids "rewards for reading/opening"
  (CoachSystem.md:445-446). Skipped today, but the reward mechanism is not
  pre-defined as XP-free. — Why: a future activation would collide with the
  never-list. — Fix: record the reward as XP-free/no-farm at activation.

## B. LOOPHOLES — rules with missing guards

- [MED] TEMP-PLANNING.md:239-240 vs Roadmap.md:1025-1026 + Gamification.md:209-211 —
  F-05's D-vs-F rationale excludes W sets from "volume/tonnage/PR/est-1RM"
  (TEMP:239-240), but N3's original idea-park exclusion list (Roadmap.md:1025-1026)
  was "volume/PR/est-1RM/adherence" — the adherence exclusion is dropped, and the
  GYM qualifying-entry definition ("≥1 real logged set", Gamification.md:209-211)
  does not exclude W sets. A warm-up-only session could count as a GYM qualifying
  day and an adhered plan slot. — Why: a hole in the facts pipeline F-05 exists
  to protect. — Fix: extend F-05 engine consequences: W-set-only sessions never
  count for adherence or qualifyingEntry(GYM) (or decide the opposite explicitly).

- [LOW] TEMP-PLANNING.md:664-666 vs Gamification.md:429-443 — F-23 locks adapted
  sessions as "done differently… never a miss," but the schedule-run trophies
  (Trimester / The Schedule Never Breaks, Gamification.md:429-443) — which F-27
  later defers to — define no adapted-session handling; adapting every session to
  ~85% stays "adhered." F-27 records the deferral (TEMP:782-784) but not this
  specific interplay. — Why: a farmable "adhered" state for the strictest trophies. —
  Fix: extend F-27's deferred question to name schedule-run trophies.

- [LOW] TEMP-PLANNING.md:608-615/640-641 — F-19's session-load unit
  ("working sets × weight × reps, effort-weighted") and F-20's ramp guardrail
  ("~8 units/week") have no defined unit — the "validated limit" is unanchored.
  — Why: build-time ambiguity for the CTL/ATL engine. — Fix: define the load unit
  at the rule-book session (F-19/F-20 LANDS already point there).

- [LOW] TEMP-PLANNING.md:867-898 vs 879-882 — C-03 is LOCKED with a fully open
  sub-decision inside: the weather chip's source ("OPEN DECISION: free API key or
  free open-source project… DecisionLog entry + approval before any dependency").
  The status token does not reflect the pending sub-item. — Why: a LOCKED entry
  that cannot fully ship, risking silent assumption during the docs pass. — Fix:
  mark the weather chip as a PENDING sub-item in the status line.

## C. GAPS — ledger landings that fail to flag needed doc changes

- [MED] TEMP-PLANNING.md:25-26 vs 88-847 — house rule: "Every decision gets
  (LOCKED, user yes) + a D-number (D082+) written into docs/DecisionLog.md."
  DecisionLog.md's last entry is D082 (skills); zero F/C-series entries exist.
  Only ~5 of 30+ LOCKED entries carry a DecisionLog mention in LANDS (F-13:472,
  F-18:600, F-19:633, F-05:251, C-08:939); ~25 LOCKED entries (F-01/02/03/04/06/
  07/08/09/10/11/12/14/15/16/17/20/23/24/28/29/30, C-03/05/06/09/11) name no
  DecisionLog need at all. — Why: the pipeline's per-row D1 path has no flag to
  hang D-numbers on for those rows; some decisions could fall out of the
  DecisionLog. — Fix: uniform LANDS discipline — every LOCKED entry lists
  "DecisionLog (D082+)" like F-13/F-18 do.

- [MED] TEMP-PLANNING.md:467 vs 470-473 — F-13's LONG-HORIZON NOTE proposes "a
  yearly weight page in the Year Book (J5)" — a J5 (M1) spec change — but LANDS
  only lists Roadmap M2/Database/Architecture/DecisionLog. — Why: the J5 change
  would be missed by the docs pass. — Fix: add Roadmap M1 (J5) to F-13 LANDS.

- [LOW] TEMP-PLANNING.md:568-571 vs Roadmap.md:215-216 + Architecture.md:224-226 —
  F-18's "upgrades the locked strength profile… to IPF DOTS" is explicit, but the
  two lines stating "overall level = avg of big-5 ratios (Wilks-style)"
  (Roadmap.md:215-216, Architecture.md:225) are not named in LANDS ("Roadmap M2
  (strength profile / vault); Architecture.md (strengthSnapshot owner
  extension)"). — Why: the superseded wording survives verbatim in two docs. —
  Fix: name the two overall-level lines in F-18 LANDS.

## D. REFERENCE ERRORS — citation spot-checks (15+ examined)

- [MED] TEMP-PLANNING.md:1136 + 1149 — "M2 Fitness: NOT COVERED by this research
  (fitness apps out of scope) — needs its own reference pass when M2 UI begins"
  and "Fitness/nutrition GUI references are a known gap — schedule a research
  pass for M2/M3." FALSE: research-fitness/MASTER-Fitness-Research.md:687 has
  "PART 9 — GUI & LAYOUT PATTERN COMPENDIUM", and every fitness report has
  per-app GUI sections (01-gym-loggers.md §7 "GUI layout (deep detail)",
  02-adaptive-coaching.md §1.6, 04-body-composition.md §6, 05-recovery §1.5,
  06-bodyweight §1.5…). The GUI table also states its research base is
  research-journaling/ only (TEMP:1118-1121), ignoring the fitness master. —
  Why: the M2 UI pass would re-do research that exists. — Fix: point the M2 row
  at research-fitness PART 9 + per-report GUI sections; delete the "known gap"
  note (TEMP:1146-1149).

- [MED] TEMP-PLANNING.md:1173-1174 vs 1181 — "1. Core shell & navigation…
  Audit #1 anchor" AND "3. Dashboard… Audit #1 anchor" — two areas claim the
  same audit anchor (checklist item 1 = dashboard, TEMP:67). — Fix: give the
  shell its own anchor or drop one claim.

- [MED] TEMP-PLANNING.md:1211-1214 vs 70-71 — app-map audit mapping errors:
  item 12 Routine claims "Audit #6 anchor" (checklist #6 = body/weight, TEMP:72);
  item 13 Goals claims "Audit #6/#7 shared" (#6 = body/weight, #7 = media);
  item 10 "Fitness & Body" claims only "Audit #4 anchor" (checklist #4 = gym)
  leaving body/weight (#6) with no anchor. Map note (TEMP:1231-1233) promises
  "Audit numbering matches the open-items checklist." — Fix: re-map areas 10/12/13
  to the checklist numbers.

- [LOW] Verified-correct citations (spot-check pass, for the record): TEMP:30-31
  → Gamification.md:129-141 ✓ · TEMP:717 → CoachSystem.md:265-268 ✓ · TEMP:719 →
  Architecture.md:176 ✓ · TEMP:721-722 → CoachSystem.md:409-415 ✓ · TEMP:722 →
  Database.md:47 ✓ · TEMP:688 → CoachSystem.md:167-172 ✓ · TEMP:794 →
  CoachSystem.md:170 ✓ · TEMP:795 → CoachSystem.md:272-275 ✓ · TEMP:796 →
  Roadmap.md:569 ✓ · TEMP:3 → audits/TEMP-PLANNING-2026-08-20.md exists ✓ ·
  TEMP:57/81 → both MASTER research files exist ✓ · TEMP:30-33 → v2/spec files
  exist at repo root ✓ · TEMP:1198 → lib/services/growth/growth_stage.dart
  exists ✓ · TEMP:1066-1068 → D038/D039 "under consideration, NOT decided (open)"
  precedent ✓ · TEMP:4-6 → DecisionLog continues from D082 ✓. Result: 15/18
  checked citations correct; the 3 errors are listed above (D-1…D-3).

## E. OPTIMIZATIONS — structural issues hurting the pipeline census / drafting

- [HIGH] TEMP-PLANNING.md:58-59 vs 67-79 + 1239-1289 — the legend defines
  families `audit-#1…audit-#10` and `tree-1…tree-6`, but ZERO entries in the file
  use those ID tokens: the open-items checklist (TEMP:67-76) is plain `- [ ]`
  prose lines, and the LIFE TREE section (TEMP:1239-1289) uses unnumbered
  headings with no status tokens. Stage A1a enumerates IDs by family — both
  families enumerate nothing. — Why: audit anchors and the main-goal deliverable
  fall out of the pipeline census. — Fix: assign `audit-#N` IDs to the checklist
  lines and `tree-N` IDs + status tokens to the six Life Tree subsections.

- [HIGH] TEMP-PLANNING.md:254 + 274 — two LOCKED decisions carry no family-ID at
  all: "LOGGING FRICTION DISCIPLINE (LOCKED…)" and "COACH HEURISTIC ENGINE —
  REQUIRED DISCIPLINE (NOTED…)" — both contain locked content that needs D-numbers
  and docs landings. Format rule (TEMP:44-48) requires `- <FAMILY>-<ID> <NAME>
  (<STATUS>)` as the first line. — Why: the two entries are invisible to ID
  enumeration; also "NOTED" is a status defined only for research leftovers
  (TEMP:1064), used here inside the F-series section. — Fix: give both entries
  IDs + legend-conformant status tokens.

- [MED] TEMP-PLANNING.md:759 vs 46-48/83-85 — F-27's status token
  "AGREED IN PRINCIPLE (user)" is in neither legend (C-series legend lists
  LOCKED/SKIPPED/REJECTED; F-series legend adds IN DISCUSSION); C-15's "PENDING"
  (TEMP:1055) is likewise undefined; F-28 is LOCKED with "my takes, pending user
  confirm" in its DECISIONS (TEMP:805). — Why: ambiguous status tokens corrupt the
  pipeline's status parse. — Fix: extend the legend with AGREED IN PRINCIPLE /
  PENDING and their pipeline meaning; align F-28's token.

- [MED] TEMP-PLANNING.md:857 vs 1055-1059 — heading "journaling C-series — all
  candidates decided" contradicts C-15 (PENDING); C-15's decision is deferred to
  "the LIFE TREE DESIGN SYSTEM section" which never actually decides its five
  components (care-object growth, ring visuals, year artifacts, then-&-now,
  10-year pledge) — that section is a design-dimension skeleton (TEMP:1239-1289).
  — Why: a PENDING item claims a decision home that doesn't decide it. — Fix:
  correct the heading; decide C-15 in the tree section or move it to the
  research-leftovers / open-items sections with a REVISIT line.

## F. INTERNAL CONSISTENCY — the ledger against itself

- [HIGH] TEMP-PLANNING.md:788-812 — F-28 is marked LOCKED (user yes) but its
  DECISIONS read "(my takes, pending user confirm): bars primary…" (TEMP:805).
  A pending decision is not a locked one; the status token and the content
  contradict. — Why: the pipeline would draft F-28's "bars primary" as decided. —
  Fix: complete the user confirm and record it, or flip to IN DISCUSSION.

- [HIGH] TEMP-PLANNING.md:805-807 vs 838-842 — F-28 locks "live 'week so far'
  view in the fitness area" of working-set volume vs the F-08 bands; F-30 locks
  the STIMULUS readout ("working-set volume vs F-08 bands", TEMP:839-841) to
  "live ONLY inside the weekly message (F-24); NO fitness-area display, no
  dashboard surface" (TEMP:841-842). The same data, contradictory display locks,
  no cross-reference between the two entries. — Why: the docs pass would draft
  both verbatim and ship a contradiction. — Fix: F-30 needs an F-28 carve-out or
  F-28's fitness-area bars need an explicit exemption ruling.

- [MED] TEMP-PLANNING.md:1178-1181 vs lib/ — app map claims the dashboard
  "block stack" includes "calendar/heatmap strip", "strength snapshot
  (placeholder)", "weekly review/Coach note", "journal capture";
  lib/features/dashboard/dashboard_screen.dart implements Today, Coach note,
  Goals & tasks placeholder, streak ring, storage card, habit rows — no
  calendar/heatmap strip, no strength-snapshot placeholder, no weekly-review
  block (grep-verified). Also F-28's CONTEXT claim "the only heatmap in the app
  today is the calendar year-heatmap" (TEMP:795-796) is false — the calendar is
  an unbuilt M6 feature (no features/calendar in lib/). — Why: "Built / in
  progress" status overstates reality; refactor audits would target blocks that
  don't exist. — Fix: mark missing blocks as planned in the map, or drop them.

- [LOW] Verified-consistent (note, not a finding): F-30's "no composite number,
  ever" (TEMP:838) vs F-18's DOTS meta score is reconciled by the F-30 NOTE in
  F-18 (TEMP:594-598) — the fold-in is recorded on both sides. No action.

---

## TOP 10 (ranked)

1. **E-1 [HIGH]** — Legend families `audit-#1…10` and `tree-1…6` are defined but
   never used as IDs anywhere (checklist + Life Tree section are ID-less);
   pipeline A1a census silently misses both families.
2. **E-2 [HIGH]** — "LOGGING FRICTION DISCIPLINE" and "COACH HEURISTIC ENGINE"
   are LOCKED decisions with no family-ID and (in one case) an out-of-section
   status token — invisible to enumeration.
3. **A-1 [HIGH]** — ~24 F-candidates LOCKED against Roadmap.md:283-288 "Fitness
   surface CLOSED (D060)" with no recorded D060 supersession; N5's deferral
   lines (Roadmap idea-park, CoachSystem §Deferred N5) go stale un-flagged.
4. **F-2 [HIGH]** — F-28 (fitness-area bars vs F-08 bands) and F-30 ("STIMULUS…
   NO fitness-area display") lock contradictory display homes for the same data.
5. **F-1 [HIGH]** — F-28 marked LOCKED while its own DECISIONS say "pending user
   confirm" — the pipeline would draft undecided choices as decided.
6. **A-2 [MED]** — F-13's EMA contradicts "rollingWindowMean = the ONLY
   rolling-average math in the engine" (Architecture.md:189/268-270,
   Roadmap.md:361) and changes the pace-owner input; only partially flagged.
7. **A-5 [MED]** — C-09's pause is a second streak shield vs "Grace is the ONLY
   finite streak shield" (Gamification.md:113-114) and the "two shields become
   one unlimited shield" rationale (CoachSystem.md:394-395) — un-flagged.
8. **B-1 [MED]** — F-05 drops N3's adherence exclusion: W-set-only sessions can
   count as GYM qualifying days and adhered slots (Gamification.md:209-211).
9. **A-9 [MED]** — C-08's unlinked-mention suggestions scan entry text, breaking
   its own "no text analysis (facts-safe)" claim and the per-feature privacy
   stamp (CoachSystem.md:437-441) — no stamp recorded in LANDS.
10. **C-1 [MED]** — House rule requires a D-number per decision; ~25 of 30+
    LOCKED entries name no DecisionLog landing in LANDS, so the docs pass has
    no per-row flag to attach D082+ numbers to.

---

## Summary

Total findings: **32** (HIGH 6 · MED 15 · LOW 11) + 2 verified-consistent notes.
Breakdown — A. Clashes: 15 · B. Loopholes: 4 · C. Gaps: 3 · D. Reference errors:
3 (of 18 spot-checked; 15 correct) · E. Optimizations: 4 · F. Internal
consistency: 3 (+1 note).

---

## ROUND 2 (2026-08-28, second-round audit)

Method: TEMP-PLANNING.md re-read in full (1444 lines); all 32 round-1 findings
checked against the current text; every fix's new citation spot-verified
against the docs (Roadmap.md, CoachSystem.md, Architecture.md, Gamification.md,
UIUX.md, MediaStorage.md, Database.md) and the research-fitness files
(01-gym-loggers.md §7, 02-adaptive-coaching.md §1.6/3.6/7.6, 04-body-
composition.md §6, 05-recovery-wearables.md §1.5, MASTER-Fitness-Research.md
PART 9 — all exist, all verified). No files edited.

### (1) Verification table — round-1 findings vs current text

| ID | Status | Evidence |
|---|---|---|
| A-1 | ADDRESSED | TEMP:91 D060 SUPERSESSION note records the batch override ("gen-2 fitness mandate SUPERSEDES D060 for the named locked candidates; closure list amended at the docs pass; DecisionLog D082+ records the override"); N3→F-05 / N5→F-19 re-openings named. |
| A-2 | ADDRESSED | TEMP:701-705 N5-DEFERRAL AMENDMENTS names both stale lines (Roadmap.md:1027-1029 + CoachSystem.md:352-357) → "CLOSED by F-19". (FUT-2 overlap omitted — see NEW-2.) |
| A-3 | ADDRESSED | TEMP:522-534 DOC-AMENDMENT FLAGS covers all three sub-points: Architecture.md:189/268-270 amended wording, pace/paceVerdict consumers (Architecture.md:269-270), Roadmap.md:361. (Residual trend/rate conflation — see NEW-3.) |
| A-4 | ADDRESSED | TEMP:445-449 SCHEMA-AMENDMENT FLAG: CoachSystem.md:277 → "settings keys + the setType column (F-05)". |
| A-5 | ADDRESSED | TEMP:777-781 ONE-LINE-AMENDMENTS lists all four singular-line sites (171/177/185/236; all verified in CoachSystem.md). |
| A-6 | ADDRESSED | TEMP:1071-1078 GUARD: pause bounded 1–14 days, records the away period, "grace + bounded pause" LANDS amendment flagged (Gamification.md:113-114 + CoachSystem.md:394-395 cited correctly). |
| A-7 | ADDRESSED | TEMP:1009-1012 LANDS adds "Roadmap M1 J5 + UIUX.md J5" with the packages-a-copy amendment. |
| A-8 | PARTIAL | Ruling exists (TEMP:370-380) and records which-wins, but "a stale hint still displays at ~90% baseline per the locked tier" (TEMP:377-378) misreads the locked tier (>4wk = COLLAPSED; the 90% is the PO-suggestion baseline, Roadmap.md:175-177 / UIUX.md:261-263) and contradicts F-01's own ruling (TEMP:185-186) — two round-1 fixes now disagree with each other (NEW-1). |
| A-9 | ADDRESSED | TEMP:132-140 LANDS corrected to Roadmap M6 + TINT-ONLY RECONCILIATION (Roadmap.md:559-560, UIUX.md:148-149 verified). |
| A-10 | ADDRESSED | TEMP:1047-1057 PRIVACY-STAMP FLAG: stamp "needs text access → user opt-in first" decided, feature gated until M2+ opt-in; Wikilinks carved out. (Open sub-decision without PENDING marker — see NEW-9.) |
| A-11 | ADDRESSED | TEMP:1039-1044 EXPORT RECONCILIATION: Year Book renders footnote-style links; Markdown keeps `[[name]]`. |
| A-12 | ADDRESSED | TEMP:184-188 STALENESS INTERACTION ruling recorded (collapse → per-set hints; card-level stays visible). (Clashes with F-11's ruling — see NEW-1.) |
| A-13 | ADDRESSED | TEMP:1097-1103 AUDIO-DURATION NOTE: audio container rule + tier applicability recorded (MediaStorage.md:190-191 verified vlog-only). |
| A-14 | ADDRESSED | TEMP:397-403 DEFAULT-STYLE RECONCILIATION (Roadmap.md:221-228 verified; amended-default sentence prescribed). |
| A-15 | ADDRESSED | TEMP:1156-1160 GUARD at activation: XP-free + non-farmable, never-list cited (CoachSystem.md:445-446 verified). |
| B-1 | ADDRESSED | TEMP:268-275 ADHERENCE EXCLUSION restored from N3's original list (volume/PR/est-1RM/adherence — Roadmap.md:1025-1026 verified); W-only sessions never count for adherence or qualifyingEntry(GYM); Gamification.md:209-211 amendment prescribed. Engine-consequences + D-VS-F chunks (TEMP:243-267) are consistent with the restored list. |
| B-2 | ADDRESSED | TEMP:865-871 DEFERRED QUESTION EXTENSION names Trimester / The Schedule Never Breaks (Gamification.md:429-443 verified). |
| B-3 | ADDRESSED | TEMP:693-698 LOAD-UNIT NOTE: unit defined at the rule-book session, ~8/week anchored to it. |
| B-4 | ADDRESSED | TEMP:976-979 STATUS NOTE: weather chip marked PENDING SUB-ITEM; C-03 ships without it. |
| C-1 | PARTIAL | TEMP:90 LANDS CONVENTION is scoped to the F-series section ("entries below"); the C-series section (TEMP:951+) carries no convention and LOCKED C-03 (993-995), C-05 (1009-1012), C-06 (1023), C-11 (1095-1096) still name no DecisionLog landing (only C-08/C-09 do). |
| C-2 | PARTIAL | TEMP:506-517 LONG-HORIZON NOTE records the J5 yearly weight page but as a "follow-on design item, not part of F-13's lock"; F-13's LANDS (518-521) still omits "Roadmap M1 (J5)" and no revisit/action pointer exists — the round-1 fix (add J5 to LANDS) was not applied. |
| C-3 | PARTIAL | F-18 (624-663) quotes the superseded "overall level = avg of big-5 ratios (Wilks-style)" but neither Roadmap.md:215-216 nor Architecture.md:225 (both verified) is named in LANDS (660-663) or any DOC-AMENDMENT note (unlike F-13's flags). |
| D-1 | PARTIAL | M2 row fixed (TEMP:1272) and every new citation verified (01 §7, 02 §1.6/3.6/7.6, 04 §6, 05 §1.5, MASTER PART 9); but the "known gap" note was half-replaced — TEMP:1284-1285 is a broken fragment ("Fitness/nutrition Only M3 NUTRITION GUI remains uncovered … schedule a research pass for M2/M3", stale M2 mention), and the GUI-table preamble (1253-1257) still claims the research base is research-journaling/ only. |
| D-2 | ADDRESSED | TEMP:1307-1310 shell claim dropped; map note (1377-1381) records the fold-in into audit-1 + audit-8. |
| D-3 | ADDRESSED | TEMP:1342-1346 (10 → audit-4 + audit-6), 1350-1352 (12 → audit-3), 1353-1356 (13 → audit-11) + map note (1373-1381). |
| E-1 | PARTIAL | Checklist audit-1…13 (69-81) and tree-1…6 headings (1403-1444) now carry IDs; but (a) the six tree subsections still carry NO status tokens (round-1 asked for them), (b) the legend row (TEMP:58) still says "audit-1 … audit-10" vs the 13-item checklist (NEW-6). |
| E-2 | PARTIAL | engine-1 (TEMP:279) LOCKED ✓; engine-2 (TEMP:299) has its ID but keeps "NOTED" — a status the file itself defines only for research leftovers (TEMP:1200-1201); its content ("user-stated, agreed… details locked later at the rule-book session") is exactly the legend's new AGREED IN PRINCIPLE semantics (TEMP:61). |
| E-3 | ADDRESSED | TEMP:61 legend row defines AGREED IN PRINCIPLE + PENDING with pipeline meaning; F-27 (836), C-15 (1191), F-28 (889-891, user-confirmed) all aligned. |
| E-4 | PARTIAL | Heading corrected (TEMP:951); but C-15 (1191-1195) still claims "Decided inside the LIFE TREE DESIGN SYSTEM section" while tree-1…6 (1394-1444) decide none of the five components — the pointer remains hollow. |
| F-1 | ADDRESSED | TEMP:889-891 "user confirmed at lock — my takes accepted". |
| F-2 | PARTIAL | Exemption ruling exists in F-28 (TEMP:892-901), but F-30's own verbatim DECISIONS still say "NO fitness-area display, no dashboard surface" (TEMP:935-936) with no F-28 cross-reference, and F-28's LANDS (905-906) omit CoachSystem.md — where F-30's verbatim line is drafted — so the reconciliation never lands beside the text it reinterprets. |
| F-3 | PARTIAL | Dashboard map fixed (1314-1318) + ACCURACY CORRECTION note (1382-1388); but F-28's CONTEXT claim "the only heatmap in the app today is the calendar year-heatmap" (TEMP:879-880) is still false — the calendar is an unbuilt M6 feature, exactly what round-1 flagged. |

### (2) NEW findings (round 1 missed; incl. contradictions introduced by the fixes)

- [MED] NEW-1 — TEMP-PLANNING.md:377-378 vs TEMP-PLANNING.md:185-186 vs Roadmap.md:175-177 /
  UIUX.md:261-263. F-11's CONSTANT RECONCILIATION ruling says "a stale hint still
  displays at ~90% baseline per the locked tier" — but the locked tier says ">4wk
  COLLAPSED" (the ~90% is the PO-suggestion baseline, not a hint display), and F-01's
  STALENESS INTERACTION ruling (the A-12 fix) says the >4wk collapse applies to the
  per-set hint inputs. The two round-1 fixes contradict each other on the same surface;
  F-11's ruling also misattributes the 90% to display. Fix: align F-11's interaction
  line with the collapse (hint hidden at >4wk; 90% baseline belongs to the suggestion,
  which F-11's decay overrides — already recorded).
- [LOW] NEW-2 — TEMP-PLANNING.md:701-705 vs Roadmap.md:1013/1029 + CoachSystem.md:356/490.
  F-19's N5-DEFERRAL AMENDMENTS names the two stale lines but omits the FUT-2
  do-not-duplicate constraint that rides them ("FUT-2 — Rest/recovery tracking (sleep,
  rest days, readiness) — overlaps the deferred N5 line; check overlap before scoping",
  Roadmap.md:1013; "do not duplicate with FUT-2", Roadmap.md:1029; CoachSystem.md:356 +
  490). F-19's HONESTY LABEL optional self-reports (sleep, morning recovery 1–5,
  soreness, TEMP:686-690) are exactly FUT-2's scope — the revival must record the
  FUT-2 overlap or the docs pass erases it when the deferred lines flip to "CLOSED".
- [LOW] NEW-3 — TEMP-PLANNING.md:528-532 vs TEMP-PLANNING.md:603. F-13's DOC-AMENDMENT
  FLAGS says the pace-owner consumers (phase pace, goal pace, RATIOS, trophies,
  weight-goal pace) "all read the new rate layer" — but the rate is a slope (kg/week);
  F-17's bodyweight multiples read "the locked 7-day rolling avg (O3)" (a level).
  The O3/multiples consumer's post-EMA source is unrecorded; F-17's record was not
  touched by the F-13 fix.
- [LOW] NEW-4 — TEMP-PLANNING.md:91 vs Roadmap.md:283-288. The D060 SUPERSESSION note
  flags the idea-park N3/N5 entries but not the N3/N5 mention INSIDE the D060 line
  itself ("N3/N5/N6/N8 + periodization remain park-able (Idea Park)") — a third site
  that becomes false once F-05/F-19 reopen N3/N5; not named for amendment.
- [LOW] NEW-5 — TEMP-PLANNING.md:782-817 + 818-835 vs TEMP-PLANNING.md:47/63-64. F-25 and
  F-26 are SKIPPED entries with no REVISIT line (F-25 has only TOUCHPOINT 813-815;
  F-26 has "DESIGN (decided at activation)" with no trigger), violating the file's own
  format rule ("Skipped entries carry a REVISIT line (trigger that re-opens them)").
- [LOW] NEW-6 — TEMP-PLANNING.md:58 vs 69-81. Legend row still reads "audit | audit-1 …
  audit-10" while the checklist now carries audit-1…audit-13 — an A1a enumeration
  scoped by the legend would miss audit-11/12/13.
- [LOW] NEW-7 — TEMP-PLANNING.md:89 vs 142. Two headings both named "### Group A —
  logging UX" ("decided batch" vs "all decided") bracket the LANDS CONVENTION + D060
  SUPERSESSION notes, making their scope ambiguous; F-06 (vault) and F-07 (calendar
  query) are also not "logging UX".
- [LOW] NEW-8 — TEMP-PLANNING.md:55-61. The legend table defines candidate-C / audit /
  tree / engine but no F-series row — the file's rule "never invent a new grouping
  where the legend defines one" leaves the largest family outside the legend.
- [LOW] NEW-9 — TEMP-PLANNING.md:1052-1055 vs 976-979. C-08's PRIVACY-STAMP FLAG ends
  in "a decision to make at build" (gate the feature vs restrict matching to
  tags/areas/dates) — an open sub-decision inside a LOCKED entry without a PENDING
  marker, the same class the C-03 weather-chip fix (B-4) required marking.
- [LOW] NEW-10 — TEMP-PLANNING.md:1377-1381 vs 69/76. The D-2 fix's shell fold-in
  ("shell concerns fold into audit-1 (dashboard) + audit-8 (settings)") is recorded
  only in the map note; the checklist lines audit-1 (69) and audit-8 (76) don't mention
  shell/navigation in their scopes.

### (3) Summary counts

Round-1 findings: **32** → ADDRESSED **22** · PARTIAL **10** (A-8, C-1, C-2, C-3, D-1,
E-1, E-2, E-4, F-2, F-3) · unaddressed 0.
NEW findings (round 2): **10** (MED 1 · LOW 9) — NEW-1…NEW-10.
Residual action items after this round: **20** (10 PARTIAL + 10 NEW).