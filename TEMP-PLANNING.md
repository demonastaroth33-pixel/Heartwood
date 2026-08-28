# TEMP-PLANNING — Generation 2 (refactor & Life Tree design)

Generation-1 planning is COMPLETE and archived: `audits/TEMP-PLANNING-2026-08-20.md`
(frozen history — never edit). All gen-1 decisions now live in `docs/`
(see `docs/README.md` doc map). New decisions continue DecisionLog numbering
from **D082** onward.

## Purpose (this generation)

1. **REFACTOR** — audit every existing feature against majorly successful
   apps in its area (journal, habits, gym, nutrition, body/weight, media,
   dashboard, settings, achievements, coach); keep what works, adopt
   proven patterns, kill weak ones. Research via the mobbin workflow
   (search/capture/flow-architect skills) + any other reference evidence.
2. **INCORPORATE** — features the user likes from those apps, deliberately
   listed with rationale per item.
3. **UNLOCKS** — a few unlock/earn mechanics and extras (list below).
4. **MAIN GOAL — LIFE TREE DESIGN SYSTEM**: fully and cleanly design the
   Life Tree in detail (visual system, growth data, surfaces, states,
   render/perf, implementation plan) so M2 implementation is smooth.
   This is the deliverable that ends this generation.

## House rules (same as gen-1)

- Every decision gets `(LOCKED, user yes)` + a D-number (D082+) written
  into docs/DecisionLog.md. No silent assumptions — state them, get a yes.
- Docs are live truth; this file is the scratchpad. Divergence discovered
  while building → DecisionLog entry first, then docs.
- No new dependencies without a DecisionLog entry + user approval.
- Achievement catalog relationship already drafted: docs/Gamification.md
  :129-141 (v2 = THE WHAT, TEMP-PLANNING-Achievement-Spec.md = THE WHEN,
  ledger = THE WHY) — this file restates nothing; new achievement work
  follows that map.
- Pipeline re-run readiness: this file keeps the canonical name
  TEMP-PLANNING.md so the integration pipeline agents (A1a→G, runbook in
  `doc draft framework/RUNBOOK.md`) work unchanged. When this batch
  matures → run the pipeline once, then this file gets archived like gen-1.
- Source freeze applies from the moment a pipeline run starts.

## LABEL FAMILIES — DISAMBIGUATION LEGEND (pipeline ground truth)

Read this before any ID enumeration (Stage A1a depends on it). Family
boundaries are defined here; never invent a new grouping where the legend
defines one. Format rule for every entry in this file: the FIRST line is
`- <FAMILY>-<ID> <NAME> (<STATUS>, user yes — note):` — the status token
is always in the parentheses right after the name. Statuses: LOCKED =
accepted (user yes) · SKIPPED for now (user) = parked with REVISIT line ·
REJECTED (user) = dead with RESTING PLACE line.
Chunk-label convention: SOURCE / WHAT / DECISIONS / CONSTRAINTS / LANDS
are the umbrella defaults; decision chunks may instead be individually
named (e.g., AUTO-SUGGEST, SCHEMA, ENGINE CONSEQUENCES, THE MATH) and
simple accepted entries may state their decision inside WHAT without a
separate DECISIONS chunk — both variants are compliant.

| Family | IDs | Meaning |
|---|---|---|
| candidate-C | C-01 … C-15 | Research-incorporation candidates from research-journaling/MASTER-Journaling-Research.md (never conflate with backup-C, audit-C, or spec-E families from gen-1 — those are archived) |
| candidate-F | F-01 … F-32 | Fitness research candidates from research-fitness/MASTER-Fitness-Research.md (new gen-2 family) |
| audit | audit-1 … audit-13 | Refactor-audit checklist anchors (open-items checklist incl. incorporate/unlocks/life-tree; maps to APP MAP areas) |
| tree | tree-1 … tree-6 | Life Tree DESIGN SYSTEM subsections (main goal; design dims; SKELETON status until the design session fills them) |
| engine | engine-1, engine-2 | Cross-cutting discipline blocks (logging friction; Coach heuristic engine — engine-2 token: NOTED = required-discipline flag, details locked at the rule-book session) |
| — | AGREED IN PRINCIPLE · PENDING | Additional status tokens in use: AGREED IN PRINCIPLE = concept approved, full setup deferred to its activation milestone (F-27); PENDING = deferred to another section's decision (C-15 → Life Tree). Both carry an activation/revisit note; neither is draftable as decided content. |

Rejected entries carry a RESTING PLACE line (do-not-resurrect contract).
Skipped entries carry a REVISIT line (trigger that re-opens them). Both
must survive any docs pass.

## Open items checklist

- [ ] audit-1 Refactor audit: dashboard (blocks, density, glance-value) (incl. shell-level concerns - see APP MAP note)
- [ ] audit-2 Refactor audit: journal (compose, timeline, search, media)
- [ ] audit-3 Refactor audit: habits (check-off, streak, review)
- [ ] audit-4 Refactor audit: gym (session, history, PR, standards)
- [ ] audit-5 Refactor audit: nutrition (log, targets, macros)
- [ ] audit-6 Refactor audit: body/weight (weigh-in, trends, physique)
- [ ] audit-7 Refactor audit: media (capture, archive, vault)
- [ ] audit-8 Refactor audit: settings (groups, reachability) (incl. shell-level concerns - see APP MAP note)
- [ ] audit-9 Refactor audit: achievements/rings surface
- [ ] audit-10 Refactor audit: coach lines/surfaces
- [ ] audit-11 Incorporate list (user picks, per item: app + why + what to copy)
- [ ] audit-12 Unlocks & extras list (user picks)
- [ ] audit-13 LIFE TREE DESIGN SYSTEM (main goal — see below)

## Incorporate list — FITNESS SERIES (F-candidates; research: `research-fitness/MASTER-Fitness-Research.md`)

Same legend format as the C-series. Statuses: LOCKED (user yes) ·
SKIPPED for now (user) · REJECTED (user) · IN DISCUSSION (user wants a
dedicated talk — scheduled, not dead).

### Group A — logging UX (decided batch)
LANDS CONVENTION (audit finding - recorded): the house rule requires a D-number per decision (D082+); entries below do not repeat "DecisionLog (D082+)" in every LANDS - READ IT AS IMPLIED for every LOCKED entry; the docs pass assigns D-numbers per row.
D060 SUPERSESSION (recorded - Roadmap.md:283-288 fitness surface CLOSED (D060): no new features, revisit only with real usage): the gen-2 fitness mandate (user-approved F-series) SUPERSEDES D060 for the named locked candidates below; the closure list is amended at the docs pass (DecisionLog D082+ entry records the override). Roadmap idea-park items touched by the series (N3 warm-up sets -> F-05, N5 recovery -> F-19) are re-opened by those locks explicitly. Roadmap.md:283-288 itself contains a clause that N3/N5 remain park-able - that clause is amended at the docs pass (they are re-opened, not park-able).
- F-01 INLINE PREVIOUS-SESSION COMPARISON (LOCKED, user yes):
    SOURCE: Hevy (R01 §Hevy).
    WHAT: during M2 logging, every exercise card shows last session's
      weight×reps ("Last: 100kg × 5"); a new PR vs last time flags
      live/color-coded during entry. The #1 progressive-overload UX.
    DECISIONS (verbatim): ALWAYS show, with STALENESS LABELING (old
      sessions labeled, e.g. "2 weeks ago") · CUSTOMIZABLE in the
      Settings tab (toggleable — user) · derived-only, zero schema.
    CONSTRAINTS: PR flag uses locked strict-greater + once-per-session
      rule; facts-only.
    LANDS: Roadmap M2 (logging screen); UIUX.md; Settings (toggle
      group).
- F-04 PLATE + WARM-UP CALCULATORS (LOCKED, user yes — math must be
  solid):
    SOURCE: Strong/JEFIT (R01).
    WHAT: plate calculator (total → plates, both directions) +
      warm-up generator (working weight → ramp sets); the generator
      doubles as the locked N2 return-ramp producer.
    DECISIONS (verbatim): calculation/math must be ABSOLUTELY SOLID —
      well-established formulas from existing setups (bar 20kg
      standard, kg stored everywhere per O8 unit policy) · FLEXIBLE
      (custom bar weight, kg/lb, microloading plates, per-exercise
      defaults) · no rounding drift; shown math can be verified by
      hand.
    CONSTRAINTS: offline; no deps; unit policy O8 (kg stored,
      display-converted).
    LANDS: Roadmap M2; UIUX.md (logging sheet); Database.md (settings
      keys).
- F-06 PR GRID 1RM/2RM/3RM…nRM (LOCKED, user yes):
    SOURCE: FitNotes (R01).
    WHAT: the records vault renders as a multi-rep PR grid per
      exercise — best lift per rep count, each with its date. The
      vault's "wall of records."
    CONSTRAINTS: derived-only; all-time dates from session history.
    LANDS: Roadmap M2 (records vault); UIUX.md (vault).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-hevy.json
      + mobbin-screens-workout.json — PR/grid presentation patterns
      (F-06).
- F-07 FILTERABLE CALENDAR HIGHLIGHTS (LOCKED, user yes):
    SOURCE: FitNotes (R01).
    WHAT: calendar queries ("bench >80kg × ≥5") — "when did I last
      hit this?"; derived-only; shares the M6 calendar surface and the
      J2 search matcher.
    LANDS: Roadmap M6 (audit finding — corrected from M2: the
      calendar surface is an M6 milestone); UIUX.md (calendar);
      shares J2 matcher.
    TINT-ONLY RECONCILIATION (audit finding — recorded): the locked
      M6 grid is tint-only ("no glyphs, emojis, or numbers" —
      Roadmap.md:559-560, UIUX.md:148-149); F-07's query-highlight
      must render as tint/banding variations on the day cells, never
      glyphs — the query result is a derived tint state, details in
      the day view.

### Group A — logging UX (all decided)
- F-02 LOGGING-SCREEN ANATOMY (LOCKED, user yes — comparison talk
  done; compound-not-disrupt confirmed):
    SOURCE: Strong/Hevy/FitNotes (R01).
    CONTEXT — what the docs ALREADY lock (the compound base, untouched
      by this candidate): L019 daily logging flow (day pre-fills
      template's exercises with target sets/reps; add/remove/swap
      freely; plans never store weights) · L021 last-time hint
      (faint last-session weights per set, confirm-or-bump, freshness
      tiers) · L018 auto-assort paste · A7 session pre-load · N4
      session comparison · PO suggestions + kill-switch · F-05 set
      labels · F-01 previous-session comparison · F-04 plate/warm-up
      calculators.
WHAT: the INTERACTION LAYER (the docs specify data flow, not
      the physical row model; F-02 fills exactly that, changing NO
      locked logic):
      - Exercise card: name + drag-handle; set table (set # | kg |
        reps | circular checkbox ✓); "+ Add Set"; swipe-to-delete;
        swap exercise mid-session (L019's verbs, physical form).
      - SET ROWS: steppers with TAP-TO-TYPE ESCAPE (user confirmed) —
        steppers pre-filled from the last-time hint (L021
        confirm-or-bump; the 90% case is one tap), long-press rapid
        scroll; tapping the number opens the keypad (the override
        path, preserving L019's "types actual weight"). Default path =
        2 interactions per set (friction discipline).
      - REST TIMER (user confirmed IN): auto-starts on set check-off;
        15s micro-adjust; per-exercise defaults; SILENT + haptic by
        default (quiet-week friendly); easily dismissed; IN-APP ONLY
        (no push — D018 untouched).
      - Set label chips (W/D/F) in the row header, auto-suggested,
        override one tap (F-05's surface here).
      - Finish top-right: partial workouts OK, nothing lost.
      - Warm-up rows folded by default (F-05 W sets); plate/warm-up
        calculator reachable mid-session (F-04).
    DECISIONS (verbatim): rest timer IN with silent-default +
      per-exercise presets + dismissible · steppers with tap-to-type
      escape as the input model · everything compounds — no locked
      logic changed.
    F-01 OVERLAP NOTE (recorded): F-01's base (previous-session
      comparison) already exists as L021 last-time hint; F-01 adds the
      live PR-vs-last-time flag + Settings toggle only. No conflict —
      compounding.
    STALENESS INTERACTION (audit finding — recorded): "ALWAYS show"
      (F-01) vs the locked >4wk-collapsed tier (Roadmap.md:175-177) —
      RULING: the >4wk collapse applies to the PER-SET hint inputs;
      F-01's CARD-LEVEL comparison stays visible, staleness-labeled
      ("2 weeks ago") — the two surfaces disagree nowhere.
LANDS: UIUX.md (Session UI section — replaces "the user types
      actual weight × reps" mechanism); Roadmap M2; Database.md
      (setType already via F-05).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-hevy.json
      (295) — the reference logging-screen anatomy (F-02).
- F-03 PR CELEBRATION CEREMONY (LOCKED, user yes — functional rules;
  DESIGN LANGUAGE DEFERRED to the Life Tree design session):
    SOURCE: Strong/NRC (R01/R06); open territory (nobody does PR
      celebration well).
    WHAT: the moments around a PR — in-session recognition + post-
      session summary.
    DECISIONS — FUNCTIONAL (locked, verbatim): celebration moments =
      first-ever PR per exercise (any new all-time best) · milestone
      PRs DEFER to the locked trophy rules (1.5×/2× BW, 100th
      workout, tonnage — the trophy is the bigger moment) ·
      return-after-gap PR (post-deload/break) gets a distinct softer
      mark · NO celebration for: matching (not strictly-greater)
      records, warm-up sets (F-05 W), imported data (isImported
      exclusion). Anti-noise guard: one celebration at a time;
      stacked PRs in a session QUEUE quietly and COLLAPSE into the
      post-session summary card ("3 records set today — details in
      the vault"). Summary card lives on the session-finish screen +
      the records vault.
    DEFERRED — DESIGN LANGUAGE (user directive, verbatim): the
      visual/animation system for celebration is HELD until the Life
      Tree design session — the Life Tree gives the fundamental
      understanding of what the app is trying to be; one shared
      ceremony language (candidate concept noted: paper/ink stamp +
      vault-cell glow, quiet-archival; NOT confetti — violated the
      Heartwood vibe). F-03 adopts whatever the Life Tree defines.
    CONSTRAINTS: facts-only copy ("PR: 100×5, previous 97.5"); no XP
      (celebration is its own reward); no shame language.
    LANDS: Roadmap M2; UIUX.md (session screen); Gamification.md (PR
      milestones); DesignSystem.md (celebration tokens — with Life
      Tree).
- F-05 SET LABELS WARM-UP/WORKING/FAILURE (LOCKED, user yes — all
  open points resolved; full design):
    SOURCE: Boostcamp (R01); revisits gen-1 N3 (deferred setType
      column — this is N3's upgrade from two to three values).
    WHAT: every set row carries a label chip — W (warm-up), D
      (working), F (failure). Manual override always; one tap.
    DEFINITION (verbatim — the crux): F tracks TARGET COMPLETION, not
      effort. A set completed to target reps = D even if grinded at
      high effort; a set ending SHORT of target reps = F. Objective,
      template-relative, no subjectivity.
    AUTO-SUGGEST (verbatim): suggested, never silent-auto — reps
      logged < template target → app suggests "mark as failure?" one
      tap confirm / one tap dismiss. Global setting: auto-suggest F
      ON/OFF (manual-only mode) for users who find suggestions noisy.
      Behavior is naturally per-person (true-failure trainers get F
      suggested often; others rarely) — no tuning needed.
    SCHEMA (point 4, decided): ONE nullable enum column `setType`
      (warmup|working|failure) — N3's own deferred shape extended;
      explicit values written at save (default 'working'); queries
      never guess; no separate flags (impossible combos, redundant
      validation).
    ENGINE CONSEQUENCES OF F (decided — the rules F sets obey):
      volume floors: F counts as volume (real effort) · tonnage: F
      counts as real weight × real reps achieved (4/5 @ 100 = 400kg)
      · est-1RM: F still contributes best-set estimates · PR
      detection: an F set can still fire a PR (best-ever nRM) ·
      PROGRESSION: F = HOLD the weight next time, never punish, never
      auto-deload (deloads come from the locked stall rules only).
    COACH COPY RULE: F is data, never judgment — weekly summary
      phrases as "3 sets held at target," never "3 failures"; no-shame
      rule applies; the show-your-work rule explains the hold.
    WHY: protects progression rules from misreading reality (a failed
      5×5 must not read as completed and bump the weight — GZCLP
      cascade depends on honest F data).
D-VS-F RATIONALE (user Q&A, documented): the taxonomy is W = not
      training (excluded from volume/tonnage/PR/est-1RM) · D and F =
      real training (counted identically everywhere) · the ONE
      difference is prescription completion: D = all target reps done
      (progression bump logic applies), F = short of target (hold
      logic applies). D is not rewarded - D is truth: the training
      log exists to answer "did the prescription work?", and every
      next-step rule (bump, hold, stall detection, volume adjustment,
      weekly summary) reads that answer. Dropping the label = engine
      bumps weight on a lie = stalling or grinding. Effort/stimulus
      (RPE/RIR) is a SEPARATE question - post-session, optional, per
      the friction budget; D/F is completion, in the live log.
      ADHERENCE EXCLUSION (audit finding — restored from N3's
      original list): N3 excluded W sets from "volume/PR/est-1RM/
      ADHERENCE" — my F-05 record dropped the adherence term.
      RESTORED: W-set-only sessions NEVER count toward plan
      adherence, and NEVER satisfy qualifyingEntry(GYM) ("≥1 real
      logged set" — Gamification.md:209-211 must read "≥1 real
      WORKING set"); a warm-up-only session is a logged session,
      not a trained session.
    LANDS: Database.md (setType column — schema change, DecisionLog
      entry); Roadmap M2 (engine filters); UIUX.md (chip + suggest
      UX); CoachSystem.md (copy rule).
- engine-1 LOGGING FRICTION DISCIPLINE (LOCKED, user yes — applies to ALL M2
  logging work, documented here):
    PRINCIPLE: the session is the cost, the data is the payoff — the
      logger's default path must be ≤2 interactions per set, and
      everything pre-fillable is pre-filled.
    RULES: (1) weights pre-filled from last session (F-01 data);
      steppers not keypads (adjust = 1–2 taps). (2) reps pre-filled
      from template targets; only deviation is typed. (3) set labels
      auto-suggested (F-05) — confirm, don't choose. (4) checkbox
      rows + auto rest timer (F-02 anatomy). (5) batch operations:
      "add 2.5kg to all sets," copy-set, Log-All (plan ahead, check
      off later), auto-assort paste (locked). (6) FRICTION BUDGET:
      every new live-logging field must remove more friction than it
      adds; anything optional goes to the post-session review (2
      taps), never mid-session (e.g., RPE belongs post-session, not
      in the live log). (7) MINIMAL MODE: a pure-checkmark, zero-
      typing view for low-attention days — depth is optional (same
      principle as journaling's progressive deepening).
    LANDS: UIUX.md (logging screen); Roadmap M2; all future logging
      candidates must pass this discipline.
- engine-2 COACH HEURISTIC ENGINE — REQUIRED DISCIPLINE (NOTED — needed;
  details locked later at the Coach rule-book session):
    THE NEED (user-stated, agreed): the Coach's brain is the heuristic
      engine — ~25 named rules committed by M2 alone (gen-1 locks +
      F-08/F-09/F-10/F-11/F-12 + F-19…F-24). It must be a really
      solid, well-tested, super thorough engine — the rules ARE the
      product (research: every "AI" fitness app is a rules engine,
      cosmetic AI branding).
    ARCHITECTURE REQUIREMENT (state of need): ONE rule-execution
      architecture (event → rule catalog, condition→action,
      strictness-parameterized; the CoachSystem.md shape built as the
      core subsystem) — never scattered ad-hoc conditionals; rules
      share ONE vocabulary via the H3 single-owner discipline (locked
      gen-1) so trophy/Coach/phase-report can never disagree; graceful
      degradation ("no data" over guessing, thin-week rule).
    TESTING DISCIPLINE (NEEDED — my suggestions, not yet locked):
      determinism + explainability as the test oracle (every Coach
      line traces to inputs+rule+constants) · table-driven tests over
      the decision tables (F-08's 4-row table, F-10's formulas, F-09's
      lookup — natural oracles) · per-rule boundary tests · fixture-
      based regression (realistic session histories → expected lines) ·
      provenance-as-authority (each rule cites its source: Epley,
      Prilepin, Israetel, SBS). Lock the concrete test plan at the
      rule-book session.
    LLM ROLE (NOTED — future, optional): the LLM is a VOICE LAYER,
      never the brain — it may NEVER make a decision the heuristics
      can't explain; it can only word, in better language, what the
      engine already computed (render-never-decide). Receives derived
      facts only; never emits a number the engine didn't compute;
      OFF by default; offline = complete product. Access mechanics
      deliberately unspecified here — decided when/if it ever ships.
      Fits the existing Optional AI Adapter slot (CoachSystem.md).
    LANDS: Architecture.md (engine); CoachSystem.md (rule catalog +
      test plan at rule-book session).
- F-09 EXPECTED-VS-ACTUAL EFFORT TABLE (LOCKED, user yes — silent by
  default, optionally visible):
    SOURCE: Volt Smart Sets (R02).
    WHAT: Prilepin-style lookup (load% × reps → expected effort);
      actual noticeably harder than expected (≥2 off) → e1RM adjusts
      down; easier → up. Quiet autoregulation — no extra logging;
      weight×reps is enough; the engine's numbers stay honest without
      trusting self-rated RPE (JuggernautAI's documented failure
      mode).
    DECISIONS (verbatim): SILENT by default (engine-internal) ·
      OPTIONALLY VISIBLE as a derived detail ("this set inferred ~RPE
      8") — never a logging burden.
    CONSTRAINTS: pure lookup + delta rule; feeds the locked Epley
      e1RM owner (confirm/correct, never replace).
    LANDS: Roadmap M2 (engine); Architecture.md (e1RM owner);
      UIUX.md (optional derived detail).
- F-11 INACTIVITY DECAY + PR RESET-TO-BASELINE (LOCKED, user yes —
  correlated with the existing off-week/vacation/deload systems;
  sensitive numbers warn):
    SOURCE: Fitbod (R02) + Boostcamp (R01).
    WHAT: time off lowers suggested starting loads (days-since e1RM
      multiplier); post-deload PR reset to a reachable baseline with
      history preserved. Completes the locked N2 return ramp (decay =
      where the ramp STARTS; reset = what today's target IS).
    DECISIONS (verbatim — user additions): DECAY CORRELATES WITH the
      already-built absence systems — deload_markers, periods
      (vacation/term/holiday), planned-rest, quiet week (J4) — a
      marked/planned absence decays differently (or not at all) vs
      true unplanned absence; the engine reads the existing docs'
      structures, never invents a parallel one · decay steepness =
      settings knob (research defaults: ~10–20% per week off) ·
      Coach explains the decay ("2 weeks off → starting at 90%,
      ramping to full by session 3") · SENSITIVE NUMBERS WARN: large
      drops (e.g., 3+ weeks off) show a warning + explanation before
      any suggested load, so a big decay never lands silently.
    CONSTRAINTS: history/vault/PRs NEVER change — only suggested
      starting loads; no punishment framing (breaks are safCONSTANT RECONCILIATION (audit finding - recorded, corrected): the
      locked freshness tier says ">4wk COLLAPSED AND PO suggestions
      pause (~90% of last-time starting baseline)" (Roadmap.md:175-
      177, UIUX.md:261-263) while F-11 decays ~10-20%/week (4 weeks =
      60-80%). RULING (corrected): the freshness tier governs the
      HINT DISPLAY (what's shown when logging) - at >4wk the per-set
      hint is COLLAPSED (hidden); the ~90% figure is the PO-
      suggestion BASELINE, not a display value. F-11's decay governs
      the SUGGESTED STARTING LOAD (what's proposed on return).
      Interaction: the suggestion uses F-11's decay; the display uses
      the tier's collapse rule; F-01's card-level comparison stays
      visible, staleness-labeled - three surfaces, no conflict.
    LANDS: Roadmap M2 (N2); CoachSystem.md (rule + copy);
      Database.md (reads deload_markers/periods).
- F-12 GZCLP STAGE-CASCADE STALL RULE (LOCKED, user yes — both
  decision points agreed):
    SOURCE: GZCLP (R03).
    WHAT: on failure, denser scheme at the SAME weight (5x3→6x2→
      10x1), deload/reset only after the last stage; reactive-deload
      complement (2–3 week stall → deload). Keeps the lifter working
      at the challenging weight instead of dropping it too fast.
      Triggered by F sets (F-05) — the label is the cascade's input.
    DECISIONS (verbatim): cascade DEFAULT for weight-mode exercises
      with per-exercise override · Coach ANNOUNCES the cascade
      ("5×5 failed → next session 6×2 at the same weight") — the most
      valuable Coach line in the system.
    CONSTRAINTS: F = hold/cascade, never punish; deloads only from
      stall rules (locked).
    DEFAULT-STYLE RECONCILIATION (audit finding — recorded): the
      locked PO style list names LINEAR-WEIGHT as the compound
      default (Roadmap.md:221-228); F-12 makes the stage cascade the
      FAILURE BEHAVIOR for weight-mode — the two are compatible (LP
      progression with cascade-on-failure), but the docs pass must
      record the amended default: "weight-mode default = linear
      progression with GZCLP stage-cascade on failure (F-12)".
    LANDS: Roadmap M2 (progression engine); CoachSystem.md (rule).
- F-08 MEV/MAV/MRV VOLUME BANDS + DECISION TABLE (LOCKED, user yes —
  canonical numbers recorded):
    SOURCE: RP Hypertrophy / Israetel et al. 2019 (R02 §10.2);
      Schoenfeld 2017. Makes the locked MRV-style floors a complete
      system.
    WHAT: per-muscle weekly volume bands (MEV/MAV/MRV) + the weekly
      adjustment decision table, rendering the locked MRV-style
      floors as a self-correcting system.
    THE BANDS (working sets per muscle per week; prime-mover +
      isolation sets only — direct-count convention, indirect
      stimulus pre-factored; per experience tier, beginner bands
      start near MV and widen):
      - MV (Maintenance): ~6 sets/wk at 2× weekly frequency.
      - MEV (Minimum Effective — growth starts): beginners ≈ MV,
        widens with experience.
      - MAV (Maximum Adaptive — the sweet spot): chest/back 12–20 ·
        quads 10–18 · shoulders 8–16 · hamstrings 8–14 · biceps
        8–14 · triceps 6–12 · calves 8–16.
      - MRV (Maximum Recoverable — the ceiling): chest 22–26 · back
        22–25 · shoulders 18–22 · quads 20–24 · hamstrings 16–20 ·
        biceps 16–20 · triceps 14–18 · calves 18–22.
    MESOCYCLE SHAPE (verbatim): start near MEV, add 1–2 sets per
      muscle per week toward MAV/MRV by the final week, then DELOAD
      to MEV or below, repeat with fresh exercises (feeds the locked
      deload markers + phases; cut phases run lower — locked).
    ADJUSTMENT DECISION TABLE (verbatim — the weekly engine rule):
      performance improved (1s) + low soreness → +2–3 sets next week ·
      mixed (1–2s) → +1 set · no change + moderate soreness →
      maintain · performance crash (4) → recovery session or DELOAD.
      Performance = the weekly D/F pattern from F-05 labels.
    DECISIONS (user): Coach REPORTS + SUGGESTS, never auto-changes
      the plan (the plan is the user's; the Coach advises with the
      band + rule cited — show-your-work).
    CONSTRAINTS: counts read F-05 working sets only (W excluded);
      numbers are evidence-based estimates, tunable per-muscle
      settings; verify seed numbers against RP's published tables at
      build (sources: rpstrength.com volume-landmarks article,
      peakcalcs.com/mesostrength calculators).
    LANDS: Roadmap M2 (volume-balance); CoachSystem.md (weekly
      rule); Database.md (working-set counting via setType).
    SCHEMA-AMENDMENT FLAG (audit finding — recorded):
      CoachSystem.md:277 ("volume balance = Settings keys only;
      zero core schema change") becomes FALSE via F-05's setType
      column — the docs pass must amend to "settings keys + the
      setType column (F-05)".
- F-10 TM ADJUSTMENT RULES ON EPLEY (LOCKED, user yes — canonical
  numbers recorded):
    SOURCE: Stronger by Science (R02 §8); validated RTF/RIR method.
    WHAT: TM movement rules on top of the locked Epley estimator —
      the documented decision procedure for when the working number
      moves.
    THE MODEL: e1RM (locked Epley estimator) = the MEASUREMENT;
      TM (Training Max) = the DECISION number programs/progression
      are written around; TM anchored at 85–90% of e1RM.
    RTF MODE (hypertrophy — DEFAULT, user decision): beat target
      reps → TM +0.5% per rep beaten · miss target reps → TM −1%
      per rep missed.
    RIR MODE (strength blocks — activates only if optional post-
      session RIR logging is ever added, user decision): sets with
      6+ RIR → TM +2% · fewer than 4 RIR → TM −5% · 4–6 RIR →
      hold.
    OVERWARM SINGLE: scheduled hard single = TM recalibration event
      (crisp → up; fight → down).
    FEED: F sets (F-05) feed the miss logic; Coach line each week
      cites the rule ("3 reps beaten → TM 100 → 101"); next week's
      suggested weights derive from the new TM (PO suggestions,
      F-02 pre-fill).
    CONSTRAINTS: TM derived-only; history never rewritten; rules
      are the same procedure coaches use — verifiable by hand.
    LANDS: Roadmap M2 (engine); Architecture.md (e1RM/TM owners);
      CoachSystem.md (rule).
- F-13 LIBRA EMA TREND + TREND/RATE/PREDICTION LAYERS (LOCKED, user
  yes — questions answered; long-horizon gap recorded):
    SOURCE: Libra (R04) — published time-indexed EMA; Happy Scale
      layering (R04).
    WHAT: replaces the naive 7-day window in the locked weight-trend
      owner with a gap-tolerant time-indexed EMA.
    THE MATH (verbatim — the concrete formula):
      power = 1 − e^(−Δt / smoothingTime)     [Δt = days since last
        weigh-in; smoothingTime = 7 days default]
      trend_new = trend_old + power × (weight − trend_old)
      → each weigh-in moves the trend by a weight proportional to
        the TIME gap since the last one (2 days moves it more than
        12 hours; a missed week counts as a longer gap, never a
        distortion). NO fabrication, NO interpolation (MacroFactor
        interpolates = fake data; violates the no-fake-data rule).
      RATE = slope of the trend over the last N trend points
        (default: 30-day window) — the kg/week number the locked
        pace logic reads (bulk +0.25–0.5 / cut −0.5 vs phase
        target).
      PREDICTION = trend + rate × days-to-go — but rendered as a
        RANGE with honest uncertainty (see F-15 decision b).
      LAYERS ARE SEPARATE DERIVED NUMBERS (Happy Scale): trend ≠
        rate ≠ prediction — never conflated in display.
    DECISIONS (user Q&A):
      (a) smoothingTime: 7-day default (Libra's), TUNABLE in
          settings (higher = smoother/slower to react; lower =
          more reactive/noisier). Recommended band: 5–14 days.
      (b) CHART SHOWS RAW POINTS + EMA LINE — always both; raw
          dots never hidden (the Withings revolt lesson); 30-day
          banding optional per F-14.
    LONG-HORIZON NOTE (recorded — the gap): the CURRENT locked
      system is short-horizon only — rollingWindowMean (7-day,
      Architecture.md L145/L038) is the only rolling-average math;
      the ladder milestones are the long-horizon GOALS; phase
      baselines are mid-horizon; Year Book stats are yearly but
      milestone-based; D031 photos are the visual long record. There
      is NO defined multi-month/year weight-trend view. F-13's EMA
      is time-indexed so it spans ANY horizon naturally (no window
      distortion over years) — the long view = full-history EMA +
      per-month markers + a yearly weight page in the Year Book (J5)
      + the Life Tree body-domain presence. This long view is a
      follow-on design item, not part of F-13's lock.
    LANDS: Roadmap M2 (body); Database.md (trend owner replaces
rollingWindowMean for body only — engine keeps the shared
      window util); Architecture.md (owner catalog); DecisionLog
      (D082+); Roadmap M1 (J5 — the long-horizon yearly weight page
      is a J5 spec change, flagged in the LONG-HORIZON NOTE above).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — trend chart + raw-points displays (F-13).
    DOC-AMENDMENT FLAGS (audit finding — recorded): (1)
      Architecture.md:189/268-270 "rollingWindowMean = the ONLY
      rolling-average math in the engine" becomes FALSE — the
      time-indexed EMA joins the engine's math family (the docs
      pass must amend the absolute claim to "the ONLY windowed
      rolling-average util; the body trend owner uses the
      time-indexed EMA"); (2) the pace-owner input changes beyond
      "body only" — F-13's RATE is "the kg/week number the locked
      pace logic reads," so the pace/paceVerdict owner consumers
      (Architecture.md:269-270: phase pace, goal pace, ratios,
      trophies, weight-goal pace) all read the new rate layer ·
      (3) Roadmap.md:361 repeats the "only rolling-average math"
      claim — amend there too.
- F-14 RATE-VS-TARGET BAR + WATER-JUMP DOTS (LOCKED, user yes):
    SOURCE: Happy Scale 30-day banding + Libra floats/sinkers (R04).
    WHAT: makes the locked pace + stall rules VISIBLE.
      RATE-VS-TARGET BAR: weekly bar of actual rate (F-13 rate
        layer) vs the phase target band (green zone) — one glance:
        on-track / drifting. DISPLAYED ON BOTH: the weight screen
        AND the weekly Coach line — integrates with whatever Coach
        logic exists (user decision a).
      WATER-JUMP DOTS: every weigh-in is a dot on the trend chart;
        floats (single spikes above the band) read as water, not
        fat; sinkers (dots drifting below the trend) prove a
        "plateau" is not a stall. 30-day green/red banding.
    DECISIONS (user): (a) both surfaces — weight screen + Coach
      weekly line (Coach integration recorded) · (b) floats/sinkers
      + banding ON by default; UI details may be improved/changed
      during the UI design phase (noted).
LANDS: Roadmap M2 (body); UIUX.md (weight chart); CoachSystem.md
      (weekly line).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — rate/target + banding visuals (F-14).
- F-15 MILESTONE HERO RING + FORECAST RANGE + 2-WEEK COPY (LOCKED,
  user yes):
    SOURCE: Happy Scale hero ring + Libra forecast + MacroFactor
      boundary photos (R04).
    WHAT: the locked weight ladder (70/75/80/85/90/95/100 with
      2-consecutive-week confirmation) gains anticipation +
      celebration: hero ring (current rung, % to next), FORECAST AS
      A DATE RANGE (user decision b — honest uncertainty, e.g.,
      "80kg around Nov 10–18"), boundary photos (D031 protocol
      anchored at rung start/end), and celebration copy stating the
      differentiator: "80kg — confirmed by 2 consecutive weeks."
    DECISIONS (user): (a) celebration visual language DEFERRED to
      the Life Tree ceremony session (same as F-03) · (b) forecast =
      RANGE, never a single date · ALL UI suggestions recorded as
      suggestions — the UI implementation phase may change them
      (noted).
LANDS: Roadmap M2 (body); Gamification.md (weight ladder);
      MediaStorage.md (boundary photos); DesignSystem.md (ceremony
      tokens with Life Tree).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — milestone/forecast/celebration states (F-15).
- F-16 EYES-CLOSED + ONE-TAP WEIGH-IN (LOCKED, user yes):
    SOURCE: Withings Eyes-Closed + Happy Scale one-tap (R04).
    WHAT: the daily weigh-in ritual becomes 3 seconds and
      emotionally safe. ONE-TAP: big "+" on the weight screen, type,
      tally-reveal, saved; canonical first-of-day prompt (locked
      protocol) at the right moment. EYES-CLOSED: toggleable mode
      where the number is recorded WITHOUT being displayed — the
      user interacts with the trend, never the digits.
    DECISIONS (user, verbatim): Eyes-Closed OFF BY DEFAULT ·
      well-visible toggle in the SETTINGS section · raw numbers
      hidden ONLY during Eyes-Closed mode (trend-first display is
      NOT the default philosophy — raw values stay visible normally)
      · UI suggestions noted — future UI implementation may change
      them.
LANDS: Roadmap M2 (body); UIUX.md (weight screen + Settings
      toggle); CoachSystem.md (first-of-day prompt interplay).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — weigh-in flow patterns (F-16).
- F-17 STANDARDS VAULT HONESTY — POPULATION LABELS + BW MULTIPLES +
  SOURCE STAMPS (LOCKED, user yes — both decision points agreed):
    SOURCE: Fitness Volt / strengthlevel / Lift Vault (R03 §9).
    WHAT: the presentation layer around the FROZEN standards tables
      (tables unchanged — presentation only). Three mechanisms:
      (1) POPULATION LABELS: every standards display carries its
          source label — "Modeled gym-style standards, 2026,
          ratio-derived" — NEVER presented as competition-grade
          truth. Why (the research's golden rule): never blend
          populations — the same 205lb bench @ 180lb BW ranks ~53rd
          percentile of gym lifters (n=24,645) but ~10th of judged
          competitors (n=91,546); competition percentiles run far
          harder than the 1.0–3.0× BW tables.
      (2) BODYWEIGHT-MULTIPLES as the display unit: every result
          shows "1.23× bodyweight," computed from CURRENT bodyweight
          (the locked 7-day rolling avg — O3), never a static class; INTERACTION NOTE: O3 rollingWindowMean stays the current-BW basis — F-13's EMA replaces the TREND owner, not the windowed current-BW read
          — because ratios DECLINE as bodyweight rises (a 250lb
          lifter's multiples sit lower than a 180lb lifter's); the
          multiple stays honest as you grow.
      (3) SOURCE STAMPS + RANK INTERPOLATION: each table carries a
          provenance footnote ("standard tables, 2026, ratio-
          derived"); the vault's standards screen answers "where do
          I rank?" via interpolation between the frozen table bands,
          LABELED as modeled (user decision a — OpenPowerlifting
          public CSVs remain the FUTURE empirical upgrade, legally
          clean + offline-packable, per R03 §9.3).
    DECISIONS (user): (a) rank interpolation derived from the frozen
      tables now, labeled modeled; OPL stays future · (b) YES — the
      tier label's time/technique meaning shows inline on first view
      (Beginner = technique ≥1 month · Novice = ≥6 months ·
      Intermediate = ≥2 years · Advanced = 5+ years — so "Novice"
      reads as time-and-technique, never an insult).
    CONSTRAINTS: frozen tables themselves untouched (locked);
      derived-only; no new deps.
LANDS: Roadmap M2 (records vault); UIUX.md (vault standards
      screen); Gamification.md (standards trophies copy).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-workout.json
      (946) — vault/standards presentation patterns (F-17).
- F-18 STRENGTH SCORE — IPF DOTS OVER THE BIG-5 (LOCKED, user yes —
  both readouts: per-lift + one meta score; vault-only display):
    SOURCE: Boostcamp (R01) — IPF DOTS normalization; public formula
      family (same rule as Epley/Wilks: public formulas only, no
      licensed code).
    WHAT: upgrades the locked strength profile ("overall level =
      average of big-5 ratios, Wilks-style") to the validated IPF
      DOTS normalization over the big-5 (Bench, Squat, Deadlift,
      OHP, Barbell Row — exactly the locked profile lifts).
    THE FORMULA (structure — verbatim): DOTS = total × 100 /
      (a + b·BW + c·BW² + d·BW³ + e·BW⁴ + f·BW⁵) — sex-specific
      public polynomial coefficients on a 500-point scale, from the
      published IPF DOTS coefficient table; coefficient values
      embedded FROM THE OFFICIAL SOURCE at build (same discipline
      as the frozen standards tables — never invented, verified at
      write time; this record deliberately stores the formula
      structure, not guessed coefficients).
    DECISIONS (user — "do both"): (a) DOTS provides BOTH readouts —
      (1) PER-LIFT NORMALIZED READOUTS: each big-5 lift's est-1RM
      (locked Epley owner) normalized by the same coefficient family
      (same-age-sex-bodyweight curve), rendered as separate numbers
      so per-lift story stays visible, AND (2) ONE SUMMARIZED META
      SCORE: the big-5 normalized values roll into a single
      Strength Score (default rollup: sum of normalized big-5 —
      total-style; exact rollup = build detail, recorded as
      open-at-build) · (b) VAULT-ONLY display — the dashboard keeps
      its locked per-lift strength snapshot, the meta score lives in
      the vault (user: "only vault show").
    DESIGN GUARDRAIL (verbatim): the score is a SUMMARY, never a
      substitute — per-lift detail stays primary in the vault; the
      meta score is secondary, derived-only, no XP, no shame.
    F-30 NOTE (recorded for the F-30 review): the meta-score role is
      now CLAIMED by F-18's DOTS; F-30's NSPI-style composite would
      be redundant AS A SCORE — its value survives only as three
      separate Coach readouts (load + volume + balance). Flagged so
      F-30's review can fold it or reject it.
    LANDS: Roadmap M2 (strength profile / vault); Architecture.md
      (strengthSnapshot owner extension); DecisionLog (D082+ —
      coefficient embedding); Gamification.md (standards trophy
      copy unaffected).
- F-19 TRAINING FORM — CTL/ATL/TSB (LOCKED, user yes — N5 revival,
  honest, hardware-free):
    SOURCE: TrainingPeaks (R05) — the validated load model.
    WHAT: readiness computed from logged sessions alone — the
      chronic-minus-acute load model.
    THE MATH (verbatim): session load = per-session number from
      logged volume × intensity (working sets × weight × reps,
      effort-weighted) · ATL (acute) = 7-day exponentially-weighted
      average of session loads · CTL (chronic) = 28–42-day
      exponentially-weighted average (default 42) · FORM (TSB) =
      CTL − ATL. Same time-decay family as the F-13 EMA. Form
      positive = building/fresh · trending down = fatigue
      accumulating · deep negative = deload/rest territory.
    DECISIONS: (a) windows = standard defaults (7/42), tunable in
      advanced settings (my take, accepted) · (b) DISPLAY — bands
      primary + number secondary + trend arrow (see user Q&A
      below): the primary readout is a ZONE ("Fresh / Building /
      Fatigued / Recovering") because bands invite interpretation
      while numbers invite false precision (Garmin/Oura/Whoop
      consensus); the exact number is a tap-away derived detail
      (optional display); a trend arrow (direction over 1–2 weeks)
      always shows — direction matters more than level.
    HONESTY LABEL (mandatory): "Training Form (from your logged
      training)" — sleep/life stress NOT measured; trend-reliable,
      not absolute truth. Optional self-reports (sleep, morning
      recovery 1–5, soreness) fold in later if ever added; degrade
      gracefully to training-only when absent.
    CONSTRAINTS: zero new logging; derived-only; no wearable; one
      notification/day; quiet week wins; facts-only.
    LOAD-UNIT NOTE (audit finding — recorded): F-19's session-load
      unit ("working sets × weight × reps, effort-weighted") and
      F-20's "~8 units/week" guardrail have no defined unit — the
      unit (e.g., "tonnage-equivalents" or "set-load points") is
      DEFINED AT THE RULE-BOOK SESSION before the engine is built;
      the ~8/week ramp limit is anchored to that unit.
LANDS: Roadmap M2 (N5 revival); CoachSystem.md (rule);
      Architecture.md (load owner); DecisionLog.
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-fitbod.json
      (216) — readiness/heatmap surfaces; mobbin-screens-strava.json
      (709) — activity summary displays (F-19).
    N5-DEFERRAL AMENDMENTS (audit finding — recorded): the revival
      makes two parked lines stale — Roadmap idea-park N5
      (Roadmap.md:1027-1029) and CoachSystem.md:352-357 (Deferred:
      recovery readiness N5) — both must read "CLOSED by F-19" at
      the docs pass; no double-recorded deferral. FUT-2 constraint (Roadmap.md:1013, 1029; CoachSystem.md:356, 490): F-19's scope is the TRAINING-LOAD Form only (chronic - acute from logged sessions); sleep/rest-day/readiness hardware-style tracking stays OUT of F-19 (separate FUT-2 item, unaffected) - the non-duplication note is carried forward, not repealed.
- F-20 RAMP-RATE GUARDRAILS + RECOVERY-TIME ESTIMATE (LOCKED, user
  yes — both decision points my takes):
    SOURCE: TrainingPeaks (R05) + Garmin recovery-time concept.
    WHAT: (1) RAMP GUARDRAIL — the validated limit: don't increase
      chronic load more than ~8 units/week; Coach alerts on
      week-over-week chronic-load deltas ("Volume up 15% — past the
      ramp limit; that's how overreaching starts") — the volume-
      spike detector, rule cited (show-your-work). (2) RECOVERY-
      TIME ESTIMATE — from last-session magnitude vs chronic
      baseline, a Garmin-style "~48h recovery" estimate; labeled
      estimate, knows nothing about sleep (honesty label); pairs
      with the locked rest-day logic (F2) + "rest day is not a loss
      of fitness" doctrine.
    DECISIONS (my takes, accepted): (a) ~8 units/week = validated
      default, tunable in advanced settings · (b) Coach LINE only
      (one channel; quiet week wins; no session-start hints).
    CONSTRAINTS: alerts, not screens; facts-only; no shame.
    LANDS: CoachSystem.md (rules); Roadmap M2; Architecture.md.
- F-23 PRE-SESSION ADAPT AFFORDANCE (LOCKED, user yes — my takes
  accepted):
    SOURCE: Freeletics (R02).
    WHAT: one "Adapt" button always on the session screen; taps →
      situation-aware variants: TIRED (session-level load
      multiplier, ~85% of planned — keeps volume, drops intensity) ·
      SHORT ON TIME (condensed variant — fewer sets or superset
      pairing, pairWith already locked) · NO EQUIPMENT (movement-
      pattern replacement — later, with F-32) · adapted sessions log
      honestly with an "adapted" marker.
    DECISIONS (my takes, accepted): (a) M2 ships TIRED +
      SHORT-ON-TIME (load multiplier + condensed); no-equipment
      later with F-32 · (b) adapted session auto-marks "done
      differently" in adherence (maps to the LOCKED plan-adherence
      semantics) — never a miss, never scolded.
    CONSTRAINTS: honest logging; no shame; quiet week wins.
    LANDS: Roadmap M2; UIUX.md (session screen — with F-02);
      CoachSystem.md (adherence semantics).
- F-21 SIX-LEVEL CHECK-IN LADDER (REJECTED (user) — flexibility
  concern; rejected after discussion):
    WHAT WAS: JuggernautAI's six-level adaptation ladder (pre/
      intra/post/weekly/block/program) as Coach rule scopes.
    RESTING PLACE: dead — do not resurrect without a new use case.
      The existing locked check-in surfaces (weekly check-in,
      phase-close N9, milestone review) already provide the cadence;
      the engine's input stays inference-based (F-09 expected-vs-
      actual from weight×reps) with NO user-facing check-in ladder.
- F-22 ONE-TAP POST-WORKOUT FEEDBACK (REJECTED (user) — same category
  as F-21):
    WHAT WAS: Freeletics' 2-interaction post-workout feedback screen
      (segmented buttons, defaults pre-set).
    RESTING PLACE: dead — do not resurrect without a new use case.
      The engine does not get user effort feedback; F-09 inference
      from logged weight×reps is the sole effort signal.
- F-24 WEEKLY COACH MESSAGE DEPTH (LOCKED, user yes — 3–5 lines):
    SOURCE: Caliber (R02); the docs' existing `check_in_weekly`
      (CoachSystem.md:167-172) + merged one-Sunday surface (A4/H2)
      stay the home — NOT a new surface.
    WHAT: DEPTH UPGRADE of the existing weekly Coach line into a
      short template-driven message, 3–5 LINES (user decision):
      review (the week's numbers: sessions, volume vs bands, PRs,
      sets held, form) → adjust (the engine's decisions, rule-
      cited) → next-week goal (one concrete target). Same derived
      facts, same surface, same day; template + interpolation (the
      Reflection Generator's flagship output); no LLM.
    DECISIONS (verbatim): 3–5 lines + one goal · the reply-to-
      weekly idea (free-text note feeding next week) NOT taken —
      recorded as a possible future add, not decided.
    CONSTRAINTS: facts-only; show-your-work (rule citations); one
      notification/day (rides the weekly surface, no new channel);
      quiet week wins; no shame.
LANDS: CoachSystem.md (weekly message template — rule-book
      session); UIUX.md (weekly surface copy).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-strava.json
      (709) + mobbin-screens-nrc.json (325) — weekly/summary card
      patterns (F-24).
    ONE-LINE-AMENDMENTS (audit finding — recorded): the docs say
      "one Coach line per strictness" in FOUR places —
      check_in_weekly (CoachSystem.md:171), nutrition_checkup
      (:177), phase_close (:185), milestone-review (:236) — all
      amend to the 3–5-line message at the docs pass.
- F-25 WEEKLY STREAKS + EARNED SAVERS — GRACE V2 FITNESS (SKIPPED for
  now (user) — recorded for future, full design):
    SOURCE: NRC / Strava / Zwift (R06) — weekly cadence consensus;
      Zwift savers.
    WHAT: re-frames the fitness streak from a daily habit-style
      counter to a WEEKLY cadence: "the week is alive if the
      routine's scheduled sessions got done." Rest days are
      structurally invisible (see the docs grounding — this is NOT
      a change to rest semantics, it is a change to the streak
      clock).
    DOCS GROUNDING (verified — the current system already treats
      rest as routine): plan adherence counts sessions vs plan
      slots, done-differently not missed (CoachSystem.md:265-268) ·
      adherenceWeek() denominators count days WITH the slot — rest
      days have no slot, never in the metric (Architecture.md:176)
      · planned rest = explicit user choice, FREEZES the streak
      (neutral hole, never resets, never earns) (CoachSystem.md:
      409-415) · routine_slot_logs statuses (Database.md:47).
      Following the routine WITH its rest days already advances
      adherence; F-25 extends that to the STREAK.
    THE OPEN DECISION (deferred with the feature — user picks when
      activated): what advances the weekly streak — (a) PLAN-
      COMPLETION (all scheduled sessions done, done-differently
      counts — Perfect Week style; anti-farm by construction;
      recommended) · (b) MINIMUM-ONE (≥1 session — loose, farmable)
      · (c) HYBRID (all-scheduled default, ≥1 on heavy-slot weeks).
    SAVERS (decided at activation): earned at 12-week marks, max 2,
      settings-tunable — forgive GENUINELY skipped weeks, never rest
      days (rest never needed saving); earned-capped-automatic
      (anti-farm). Positive-only streak displays (Zwift flair —
      no broken-chain shaming).
    REVISIT: activation trigger - when M7 gamification planning begins (or fitness-streak work starts); the (a)/(b)/(c) decision is picked then.
    TOUCHPOINT (flagged for activation): v2 streak trophies read the
      fitness streak — weekly re-frame needs the catalog-level
      decision via the layer map (v2 = THE WHAT).
    LANDS (when activated): Gamification.md (grace family);
      Roadmap M7; v2 catalog.
- F-26 SKILL-TREE PROGRESSION LADDER — REP-MODE (SKIPPED for now
  (user) — recorded for future, full design):
    SOURCE: Calistree (R06).
    WHAT: rep-mode exercises (pull-ups/push-ups/dips — locked, no
      rep cap) get explicit progression chains with difficulty
      edges (e.g., push-ups: incline → full → deficit → weighted;
      pull-ups: negatives → banded → full → weighted); the engine
      computes position from clean-rep history (locked best-rep
      logic) and surfaces "path to X" + "next tier" automatically.
      Turns rep-mode training from "do more reps" into a visible
      path — the cleanest non-XP motivation mechanic in the cluster.
    DESIGN (decided at activation): seeded edges for the core
      rep-mode families + user-extendable chains (same pattern as
      the exercise lookup) · display: exercise detail primary,
      vault ladder secondary · composes with F-05 set labels
      (clean reps from working sets) and the v2 bodyweight ladder.
    REVISIT: activation trigger - when rep-mode exercise work starts (M2 build or later); edges seed then.
    LANDS (when activated): Roadmap M2 (rep-mode); Database.md
      (progression-edge table — schema decision); Gamification.md.
- F-27 ADHERENCE + SITUATION TROPHIES (AGREED IN PRINCIPLE (user) —
  FULL PROPOSAL DOCUMENTED; planning to be ACTIVATED at the
  achievement/gamification milestone — not set up in this pass):
    SOURCE: Garmin (R06) + Trophy platform data.
    THE WHY: the v2 catalog (131 trophies) is performance-trophy-
      heavy; adherence trophies incentivize CONSISTENCY with zero
      volume incentive (anti-farm by construction — you can't farm
      adherence to your own plan); research retention data:
      hardest-tier achievers retain 74% vs 32% easiest; day-one
      earners +64%.
    THE PROPOSAL (full feature proposal for future me to decide):
      (1) ADHERENCE TROPHIES — Goal-Getter shape: 3/7/30/60-day
      runs of meeting your OWN plan (Perfect Week family; the goal
      is your own schedule — structurally unfarmable).
      (2) SITUATION TROPHIES — circumstance-based: Early Bird
      (first session before 8am) · Night Owl (after 9pm) ·
      Comeback (post-deload return) · Weatherproof (consistent
      through an unbroken stretch) — small, honest, fun.
      (3) CATALOG DISCIPLINE: new entries go through the locked
      layer map (v2 = THE WHAT + spec triggers = THE WHEN); each
      trophy needs its trigger record.
      (4) LOUDNESS: these are Sprout/Branch-tier → silent in-game
      toasts only (locked Ring/Grove-only Coach speech).
      (5) DECISION DEFERRED: do adapted sessions (F-23) count as
      "adhered"? (draft answer at activation: yes — done-
      differently, never skipped).
    ACTIVATION TRIGGER: the M7 gamification/achievement milestone
      (or any trophy-catalog work) — this record is the planning
      seed.
      DEFERRED QUESTION EXTENSION (audit finding — recorded): the
      adapted-session question must also name the schedule-run
      trophies (Trimester / The Schedule Never Breaks —
      Gamification.md:429-443): an adapted-everything week staying
      "adhered" could farm the strictest trophies; decide at
      activation whether adapted sessions cap those trophies' count
      (e.g., max N adapted weeks per run).
- F-28 SETS-PER-MUSCLE-WEEK CHART + VOLUME HEATMAP (LOCKED, user
  yes):
    SOURCE: Hevy / Boostcamp (R01).
    CONTEXT — verified, NOT a duplicate: the volume DATA exists (the
      weekly check-in's "volume snapshot and balance" fact line +
      the volume-balance rule's under-floor/imbalance checks —
CoachSystem.md:170, 272-275) but ONLY as numbers in text;
      the calendar year-heatmap (activity tint - Roadmap:569, an
      M6 unbuilt milestone) is unrelated to muscle volume — there
      is NO muscle-volume visualization anywhere in the app;
      lib/ has zero fitness code (M2 not built). F-28 is
      the MISSING VISUALIZATION LAYER over existing data.
    WHAT: (1) SETS-PER-MUSCLE-WEEK BARS — one bar per muscle group
      of working sets this week, with the F-08 band overlaid (MEV
      floor line, MRV ceiling line, MAV sweet-spot shading);
      "week so far" fills live as sessions log. (2) VOLUME
      HEATMAP — the spatial muscle-grid density version of the
      same data (nice-to-have complement).
    DECISIONS (user confirmed at lock — my takes accepted): bars
      primary · live "week so far" view in the fitness area + verdict
      in the weekly check-in · heatmap optional complement.
    DISPLAY RECONCILIATION with F-30 (recorded — audit finding):
      F-30 locks the STIMULUS readout (working-set volume vs F-08
      bands) to "live ONLY inside the weekly message; NO fitness-
      area display." F-28's fitness-area bars ARE the same data
      visualized. RULING: F-28's chart is the data VISUALIZATION
      (interactive, explorable, in the fitness area); F-30 governs
      the Coach's weekly READOUT TEXT (the message line) — two
      surfaces, one data source, both locks stand; F-30's "no
      fitness-area display" is interpreted as "no additional
      readout cards beyond F-28's chart."
    CONSTRAINTS: pure derived rendering of F-08 data (working sets
      only, F-05 labels); zero new storage; advisory (never XP/
      penalty); deload/period-quiet exempt (locked semantics).
LANDS: Roadmap M2 (fitness area + weekly check-in); UIUX.md
      (chart components); Architecture.md (owner reuse);
      CoachSystem.md (weekly-check-in volume section — the chart
      renders there too).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-hevy.json
      (295) — sets-per-muscle bars + heatmap viz (F-28).
- F-29 MOVEMENT-BALANCE RATIOS (LOCKED, user yes — my takes on both
  decision points):
    SOURCE: JEFIT (R01).
    WHAT: movement-pattern balance ratios computed from the LOCKED
      muscle-tagged session history: PUSH:PULL and SQUAT:HINGE —
      two ratios, same derived math (my take, accepted); advisory
      only, never XP/penalty; Coach line when a ratio drifts out of
      range ("Push volume is 2.2× pull this month — pulls protect
      the shoulder; add a pulling day").
    DECISIONS (my takes, accepted): (a) both ratios (push:pull +
      squat:hinge) · (b) alert threshold = fixed default (e.g.,
      >1.7:1) + settings-tunable, consistent with all other knobs.
    CONSTRAINTS: derived-only (muscle tags, primary/secondary roles);
      no new logging; no shame.
    LANDS: Roadmap M2 (fitness area); CoachSystem.md (Coach line);
      Architecture.md (owner).
- F-30 NSPI-STYLE COMPOSITE — FOLDED (LOCKED, user yes): DOTS is the
  ONLY meta score; readouts live ONLY in the weekly message:
    SOURCE: JEFIT NSPI (R01) — decomposed, not composited.
    WHAT: the three separate progress readouts (load/stimulus/
      balance) as Coach report content — explicitly NOT a score.
    CONTEXT: user's F-18 decision claimed the meta-score role for
      DOTS; user confirms the fold-in (recalls DOTS folding in the
      three areas).
    DECISIONS (verbatim): KEEP DOTS ONLY for the meta score (F-18 —
      no composite number, ever) · the three SEPARATE readouts —
      LOAD (est-1RM trend across big-5) · STIMULUS (working-set
      volume vs F-08 bands) · BALANCE (F-29 ratios + muscle
      imbalance) — live ONLY inside the weekly message (F-24);
      NO fitness-area display, no dashboard surface (F-28 carve-out: the sets-per-muscle chart IS the data visualization; this lock governs the Coach's readout text - see F-28 DISPLAY RECONCILIATION).
    WHY: three transparent readouts > one opaque index (the RP
      hidden-logic + more-is-more lessons); all three already exist
      as derived data — zero new computation.
    LANDS: CoachSystem.md (weekly message template — rule-book
      session); no schema.
- F-31 GYM PROFILES / EQUIPMENT PRESETS (REJECTED (user)):
    WHAT WAS: switchable equipment profiles reshaping suggestions.
    RESTING PLACE: dead — do not resurrect without a new use case.
      (F-23's adapt affordance covers the reactive path.)
- F-32 MOVEMENT-PATTERN REPLACEMENT (REJECTED (user)):
    WHAT WAS: derived same-pattern substitutes via muscle tags.
    RESTING PLACE: dead — do not resurrect without a new use case.
      (Mid-session swap stays manual via the F-02 anatomy.)

## Incorporate list (journaling C-series — all candidates decided except C-15, deferred to the Life Tree section)

Research source: `research-journaling/MASTER-Journaling-Research.md`
(candidates C-01…C-15, evidence + references). Entry format follows the
legend: `- C-XX NAME (STATUS, user yes — note):` then labeled chunks
SOURCE / WHAT / DECISIONS / CONSTRAINTS / LANDS (locked entries) +
REVISIT (skipped) or RESTING PLACE (rejected). DECISIONS chunks are
verbatim-critical — the docs draft must copy them exactly, never
paraphrase numbers or toggles.

- C-03 AUTO-CONTEXT CAPTURE (LOCKED, user yes — shaping done):
    SOURCE: Day One / Diarium (R01) — "type less, preserve more."
    WHAT: entries auto-gain context facts of their day from
      PersonalOS's OWN event log (no external services; location chip
      excepted).
    CHIPS (all accepted; each individually toggleable in Settings):
      media of the day ("2 photos · 1 vlog") · workouts logged
      ("2 workouts · 3 sets bench") · habit status ("4/5 habits ·
      14-day streak") · body/weigh-in (weigh-in value / physique photo
      taken) · return-after-gap note ("first entry in 3 days" —
      celebrates return, no shame) · location (user-chosen; only with
      explicit per-entry approval) · weather (WANTED — user: super
      accurate regional weather; future weather-oriented UI/design
      planned; source = OPEN DECISION: free API key or free accurate
      open-source project/setup, DecisionLog entry + approval before
      any dependency; local calc fallback if offline; STATUS NOTE —
      audit finding: the weather chip is a PENDING SUB-ITEM inside a
      LOCKED entry — C-03 ships without it; the chip activates only
      after the DecisionLog dependency decision).
    DECISIONS (verbatim): default OFF (chips appear only after user
      enables them in Settings) · rendering BOTH (chips under entry
      body in entry view + collapsible "Day context" line in editor) ·
      capture FROZEN at save (snapshot of the day) BUT TOMBSTONE-AWARE
      (each chip references the source events it summarizes; when an
      underlying event is deleted/revoked — habit, vlog, workout,
      weigh-in, the compensating revoke events — the chip must not
      show a stale lie: recompute honestly on view or mark the chip
      "updated"; exact rule = implementation detail,
      tombstone-reads-chip).
    CONSTRAINTS: facts-only (never text content) · isImported rows
      excluded · no XP anywhere · quiet week does NOT disable chips
      (they're facts, not nudges).
    LANDS: Settings (chip toggles group) · Database.md (event-log
      consumers) · MediaStorage.md (media chips) · Roadmap (journal
      M1+).
- C-05 MEMORY HYGIENE (LOCKED, user yes — hide controls only):
    SOURCE: Timehop (R04).
    WHAT: safety controls for the J1 on-this-day strip.
    DECISIONS (verbatim): "Never show this again" — per-memory hide on
      the strip; that entry never resurfaces · "Hide a year" — hide a
      date range (e.g., 2020); nothing from that range ambushes
      on-this-day · hidden-ness applies EVERYWHERE memories surface —
      including exports / Year Book PDFs (a memory that's hidden is
      really hidden) · data is NEVER deleted — display-level flag,
      derived, reversible.
    REJECTED (verbatim): reply-to-your-past-self (StoryPad pattern) —
      not wanted; do not resurrect without a new use case.
    CONSTRAINTS: facts-only; no XP.
    LANDS: J1 scope (Roadmap M1) · UIUX.md (strip controls) ·
      Roadmap M1 J5 + UIUX.md J5 (audit finding — recorded:
      hidden-ness in Year Book PDFs changes the J5 spec "packages
      a copy" — J5 must exclude hidden memories at the docs pass).
- C-06 THEN & NOW SELFIE COMPARE (LOCKED, user yes):
    SOURCE: Timehop (R04).
    WHAT: companion to D031 physique-photo timeline. Inside the
      physique timeline: "snap a new one" pairs the current photo
      against any selected historical one (side-by-side / slider — the
      D031 comparison already designed); a dated "compare" action per
      historical photo.
    DECISIONS (verbatim): nearly free — D031 already has side-by-side/
      slider; adds the snap-now-with-prompt action · feeds the Life
      Tree "then & now" layer later.
    LANDS: Roadmap M1 (D031) · MediaStorage.md.
- C-08 WIKILINKS + UNLINKED-MENTION SUGGESTIONS (LOCKED, user yes —
  Settings toggle, ON by default):
    SOURCE: Obsidian / Roam / Capacities (R02).
    WHAT: journal grows a connection web. WIKILINKS: `[[` in the
      composer → autocomplete of Life Areas + recent entries → link
      embedded; linked entries gain a backlinks pane ("linked from: N
      entries"); tapping a link jumps to the entry. UNLINKED-MENTION
      SUGGESTIONS: derived pass over the shared J2 matcher — "you
      mentioned 'X' in N entries — link them?" — suggestion card,
      one-tap apply, NEVER automatic.
DECISIONS (verbatim): SETTING = clear toggle in Settings, ON by
      default (user) · NO graph visualization (decorative - against
      philosophy) · links export as `[[name]]` in Year Book (lossless)
      · no text analysis - matching is on names/areas/tags only
      (facts-safe).
    EXPORT RECONCILIATION (audit finding - recorded): the Year Book
      is a rendered human PDF (Roadmap.md:113-119) - raw `[[wiki]]`
      syntax would be dead text. RULING: Year Book renders links as
      footnote-style reference lines (name + date) - lossless meaning
      preserved humanly; a Markdown export (if ever added) keeps the
      raw `[[name]]` form.
    LANDS: DecisionLog (junction table decision) · J2 matcher ·
      UIUX.md (composer + backlinks pane).
    PRIVACY-STAMP FLAG (audit finding — recorded): unlinked-mention
      detection ("you mentioned 'X' in N entries") READS entry text
      to find known names — this is text access, not metadata
      matching. Per the per-feature privacy-stamp rule
      (CoachSystem.md:437-441), C-08's mention-suggestion carries
      the "needs text access → user opt-in first" STAMP (decided
      here: the stamp applies; the feature is gated until the M2+
      text opt-in exists, OR matching is restricted to tags/areas/
      dates only at activation — a decision to make at build; PENDING SUB-ITEM - same convention as C-03's weather chip, the mention-suggestion ships only after this decision).
      Wikilinks themselves (user-typed `[[`) are unaffected —
      user-initiated, no scanning.
- C-09 GENTLE RETURN + PAUSE (LOCKED, user yes — repair tokens
  REJECTED):
    SOURCE: Finch (R04) — "streaks are a courtesy, not a contract."
    WHAT: GENTLE RETURN — after any gap, NO "you missed N days"
      messaging; a warm return card ("welcome back") with optional
      fresh-start offer. Applies everywhere streaks/misses are
      discussed (dashboard, habits, Coach lines). PAUSE MODE — user
      freezes streaks for a known-away period.
    DECISIONS (verbatim): pause built into Settings (habits/coach
      group), MOSTLY OFF BY DEFAULT · distinct from quiet week
      (silences nudges) and from grace (forgives misses): pause
      FREEZES streaks without forgiving anything · repair tokens
      REJECTED — keep grace simple.
    GUARD (audit finding — recorded): "Grace is the ONLY finite
      streak shield — two shields would become one unlimited shield"
      (Gamification.md:113-114, CoachSystem.md:394-395). PAUSE MUST
      BE BOUNDED — finite durations per pause (e.g., 1–14 days),
      and a pause still RECORDS the away period (it freezes, never
      hides); pause is a scheduled absence, not a forgiveness
      mechanism; LANDS must amend the Grace section wording
      ("grace + bounded pause are the streak shields").
    LANDS: Settings; Gamification.md (grace family — amendment
      flagged); UIUX.md (empty/return states); DecisionLog (D082+).
- C-11 VOICE-NOTE ENTRY TYPE (LOCKED, user yes — audio now,
  transcription future-only):
    SOURCE: Keep / Reflect / Notability (R03/R05/R06).
    WHAT: third entry type beside text and vlog. NOW: record
      (hold/release), audio preserved ON-DEVICE as a media item (same
      media path as vlog, MediaRepository), inline playback in the
      entry; entry stores the audio + small metadata (duration, date).
    DECISIONS (verbatim): transcription + time-sync (tap transcript →
      scrub audio) = FUTURE-ONLY optional addition, NOT now; needs an
      STT engine decision (DecisionLog + approval) when/if pursued ·
      raw audio always kept (APA advisory: AI is adjunct) ·
      on-device only (no cloud STT without a decision) · no XP ·
      media storage rules apply (compression/limits per
      MediaStorage.md).
    LANDS: MediaStorage.md · composer entry types · DecisionLog (only
      when STT is pursued).
    AUDIO-DURATION NOTE (audit finding — recorded): MediaStorage.md:
      190-191 defines durationSec via "phone capture returns the
      finished duration; PC adoption parses the MP4/MOV container
      header" — vlog-only; the voice-note path needs an audio
      container rule (e.g., M4A/MP4 header parse for adopted files)
      + which tier rules apply to voice notes (recommended at build:
      same tier logic as vlog, buffer exempt).
- C-07 LIFE AREAS V2 — SUPERTAGS WITH FIELDS + PORTALS (SKIPPED for
  now (user) — recorded for future):
    SOURCE: Tana / Capacities / RemNote (R02).
    WHAT: Life Areas gain optional data fields (3 types only:
      faces/mood, number, short text) defined per area in Settings →
      Life Areas → "Add fields"; fields render as quick pills when
      tagging an entry (2 taps each, skippable); the area's filter
      view becomes a self-filling PORTAL — every entry of that area
      from all time, grouped by date, always current, with a small
      summary strip on top ("Health this month: mood avg, sleep avg" —
      the first computed chart the journal produces). Areas without
      fields behave exactly as today.
    UNLOCKS: structured data for the M7 analytics engine (sleep/mood
      trends — numbers, not word counts) · facts-only Coach lines
      ("sleep field below 6h for 5 days") · Life Tree branch detail
      panels · C-03-style chips from area fields.
    WHY SKIPPED: schema change (field definitions + entry field
      values) + a form-builder UI in Settings — needs a DecisionLog
      entry and a clean design; not needed for M0/M1.
    REVISIT: when M7 analytics work starts, or when the Life Tree
      branch-detail design needs the data. NOT mood-as-global-feature
      (C-04, rejected) — fields are per-area, opt-in, invisible until
      used.
- C-12 PROMPT LIBRARY (SKIPPED for now (user) — recorded for future):
    SOURCE: Stoic / Grid Diary / Reflect (R01/R02/R04).
    WHAT: curated + user-editable writing prompts, scoped per Life
      Area, each prompt optionally teaching a cognitive move (Stoic
      style: "what's within your control?" > "how do you feel?");
      surfaces as a "stuck? try one" chip in compose and via the
      Coach.
    SOURCING (decided): hand-written core (~25–40) + LLM-generated
      expansion curated at build time; user-editable on top; NO
      scraping (Grid Diary/Stoic/Reflectly prompts are copyrighted
      IP).
    WHY SKIPPED: pure data + UI, no urgency; compose is fine without
      prompts for M0/M1.
    REVISIT: when the Coach rule-book session plans prompt-driven
      nudges, or if blank-page friction shows up in real use (J2
      search + memory strip ship first).
- C-13 EPHEMERAL DAILY REVIEW RITUAL (SKIPPED for now (user) —
  recorded for future):
    SOURCE: Timehop (R04).
    WHAT: the J1 on-this-day strip upgraded to a Timehop-style ritual
      — memories surface as one daily feed that EXPIRES at midnight
      (urgency without notifications), a small "review streak" rewards
      checking memories daily, and C-05 hide-controls apply to
      everything in the feed. The permanent J1 strip stays as the
      utility layer; the ritual is the emotional layer. Off by
      default.
    WHY SKIPPED: J1 doesn't exist yet; the ritual builds on it and on
      C-05. Sequencing matters.
    REVISIT: after J1 ships and the memory strip proves itself in real
      use — then decide ritual on/off. GUARD at activation (audit
      finding — recorded): the review-streak reward must be XP-free
      and non-farmable (the never-list forbids "rewards for
      reading/opening" — CoachSystem.md:445-446); the reward is the
      streak itself, nothing more.
- C-14 CONTEXT-TIMED NUDGES — COACH SCHEDULING LAYER (SKIPPED for now
  (user) — recorded for future):
    SOURCE: Saner / Apple Journal (R05).
    WHAT: a rule about WHEN the Coach speaks — nudges attach to
      natural moments (after a workout, after checking memories, after
      3 quiet days, first open of the day) instead of fixed app-open
      scans. Same rule content, same caps (1 notification/day, quiet
      week wins, never push, facts-only) — purely the timing layer.
    WHY SKIPPED: belongs to the deferred Coach rule-book session
      (ledger lock); the scheduling principle is recorded here so that
      session inherits it.
    REVISIT: the Coach rule-book session (M8 planning) — raise it
      there as a named rule.
- C-01 QUICK CHECK-IN (REJECTED (user) — cheap tier closed):
    WHAT: Daylio 2-tap pattern — mood + one line + optional photo
      quick capture beside long-form compose.
    RESTING PLACE: dead — do not resurrect without a new use case.
- C-02 JOURNALING SUGGESTIONS (REJECTED (user) — cheap tier closed):
    WHAT: Apple Journal zero-LLM suggestion engine over the event log.
    RESTING PLACE: dead — do not resurrect without a new use case.
- C-04 MOOD AS FIRST-CLASS + CORRELATIONS (REJECTED (user)):
    WHAT: Daylio mood tracking + activity correlations.
    RESTING PLACE: dead — do not resurrect without a new use case.
      (Note: per-area mood fields inside C-07 remain possible — that
      is NOT this candidate.)
- C-10 YEAR IN PIXELS MOSAIC (SKIPPED (user) — recorded for future):
    WHAT: Daylio annual mosaic — was to feed J5 Year Book + Life Tree
      rings.
    REVISIT: anytime; it is a natural Life Tree annual-ring visual if
      the tree design wants it.
- C-15 LIFE TREE EMOTIONAL ENGINE (PENDING — feeds the main-goal
  section): care-object growth (Finch), ring visuals (Daylio mosaic),
  year artifacts (1SE mashup), then-&-now comparisons (Timehop),
  10-year pledge (Standard Notes). Decided inside the LIFE TREE DESIGN
  SYSTEM section, not here.

## Research leftovers — recorded, NO decision yet (nothing lost)

Items the research surfaced that were never candidates; recorded so the
docs pass and future sessions see them. Status: NOTED (no lock, no
rejection). Each keeps its evidence trail in the master doc.
PIPELINE (self-directed): LANDS = docs/DecisionLog.md as OPEN ITEMS,
category = deferred (framework default for un-decisioned material,
D038/D039 precedent). Do not scatter into feature docs as decided scope.

- OCR SEARCH OVER ATTACHED PHOTOS (NOTED — future): Evernote/OneNote/
  Keep/Bear pattern (master steal #28; gap Tier 1 #5). Extends J2 to
  image text. Effort M; needs a PWA OCR path decision (local WASM vs
  defer). Revisit when J2 ships.
- REGEX-CAPABLE SEARCH (NOTED — J2 detail): Zettlr pattern (#29).
  Fold into J2's matcher design if trivial; no separate decision.
- COMMAND PALETTE (Ctrl+P) (NOTED — GUI): Obsidian pattern (#34).
  Universal fuzzy navigation. Belongs to the UI/UX ordering pass.
- ATLAS / MAP VIEW OF ENTRIES (NOTED — future): Diaro/Day One/Journey
  pattern (#36). Spatial life-log; pairs with M6 periods/travel and the
  physique timeline. Revisit at M6.
- MULTIPLE JOURNALS vs SINGLE TIMELINE (NOTED — design pole, #42):
  Day One journals vs Momento single timeline. Current direction: single
  timeline + Life Areas (folders-lite). Recorded so the docs pass
  doesn't re-open it silently.
- DEFAULT-INBOX + TRIAGE (NOTED — capture GUI, #44): Drafts/Momento.
  Capture flat, structure later. Belongs to the UI/UX ordering pass.
- ONE-ENTRY-PER-DAY CONSTRAINT MODE (NOTED — pole, #60): Presently.
  Optional honesty mode; revisit if catch-up spirals show in real use.
- SMART FILL BACKFILL (NOTED — future, #61): 1SE camera-roll backfill.
  Grace-adjacent; revisit with habits/grace v2 work.
- GOAL/STREAK PROGRESS RING IN EDITOR (NOTED — GUI, #63): Ulysses.
  Gamification-as-furniture; belongs to UI/UX ordering pass.
- NO-FAIL JOURNALING (NOTED — coach, #64): Finch "journal three lines,
  decline without recording." Coach rule-book session candidate.
- OPTIONAL FOCUS GATE (NOTED — coach, #65): Stoic app-blocking during
  reflection. Coach rule-book session candidate.
- PRIVACY-FIRST ONBOARDING COPY (NOTED — UX, #67): Daylio "we never
  see your data" first screen. Belongs to welcome/onboarding polish.
- ENCRYPTED EXPORT ARCHIVES (NOTED — future, #68): Anytype/Standard
  Notes. Revisit with backup/export v2 (M10 Drive P2 planning).
- YAML FRONTMATTER ON EXPORT (NOTED — J5 detail, #73): Zettlr. Fold
  into Year Book export format if wanted; no separate decision.
- QUOTE-YOUR-OLD-SELF / TRANSCLUSION (NOTED — C-08 family, #54):
  Logseq/Roam block embeds. If C-08 links ship and reflection wants it,
  extend links with an "insert quote from" action — revisit then.
- MORNING/EVENING RITUAL RHYTHM (NOTED — coach, #49-50): Stoic/Reflectly.
  Coach rule-book session candidate (with C-14).
- RESEARCH ANTI-PATTERNS (NOTED — guardrail reference): paywall nagging
  (Reflectly), punishment loops (Habitica), cloud-only memory
  (companion graveyard), training on content (Rosebud ToS). The docs
  pass should cite these as documented no-goes wherever nudges,
  gamification, or AI are described.

## UI/UX DEVELOPMENT REFERENCE — GUI RESEARCH PER MILESTONE

CONSULT THIS AT EVERY MILESTONE'S UI/UX WORK (during implementation,
the UI/UX ordering pass, and any design drafting). The GUI research
lives in `research-journaling/`; the compendium is
`MASTER-Journaling-Research.md` PART 9 (GUI & layout pattern
compendium) + each report's per-app GUI sections + the mobbin screen
inventories. This table maps milestones to the reference material that
applies; nothing here is a lock, it is a lookup.
PIPELINE (self-directed): LANDS = docs/UIUX.md as a "GUI research
references" LOOKUP SECTION (Track 2 — organizational shape / lookup
material, not a single fact; route via B2 Structural Impact Proposal +
D2 executor, not the per-row D1 path). Table rows and all
research-journaling/ file paths are VERBATIM-CRITICAL — drafters must
copy the table and paths exactly, never paraphrase or re-derive them.

| Milestone / surface | GUI research to consult |
|---|---|
| M0-M1 Journal: compose, timeline, editor | R01 GUI (Day One 3-pane/calendar, Apple Journal suggestion wall + inline media, Diaro photo-strip, Pencil one-page-per-day) · R06 GUI (Drafts open-to-blank, Keep capture buttons) · mobbin: Evernote/Apple Notes/Notion |
| M1 J1 memory strip | R01 On-This-Day surfaces · R04 Timehop ephemeral feed GUI · PART 9 §9.5 reflection surfaces |
| M1 J5 Year Book | R01 Day One calendar/print · R04 1SE grid + mosaic · PART 9 §9.2 |
| M1 D031 physique timeline | R04 Timehop Then-&-Now · R01 Diaro Atlas · PART 9 §9.5 |
| M2 Fitness | `research-fitness/MASTER-Fitness-Research.md` PART 9 (logging anatomy, vault, coaching surfaces) + per-report GUI sections (01 §7, 02 §1.6/3.6/7.6, 04 §6, 05 §1.5) + mobbin: Hevy/Fitbod/MacroFactor/NRC/Strava |
| M3 Nutrition | NOT COVERED by either research pass — needs its own reference pass when M3 UI begins |
| M4 Routine & Briefing | R05 Ohai morning-briefing GUI · R04 Stoic ritual framing · R01 Day One Today tab |
| M5 Goals & Tasks | R04 Daylio goals-in-flow · R04 Habitica (cautionary) · R03 Notion database views |
| M6 Calendar & Periods | R01 Day One Calendar/Map · R01 Diaro Atlas · R04 Presently calendar-grid home · R02 Capacities calendar Day view |
| M7 Analytics & Gamification | R04 Daylio stats/Year-in-Pixels · R04 1SE missed-day grid · R03 Ulysses progress ring · R04 Finch streak displays |
| M8 Coach | R05 AI journals (suggestion cards, briefing, opt-in controls) · R04 wellness (care-based streaks, no-nag returns) · R04 Stoic prompt surfaces · PART 9 §9.6 |
| M9 Life Tree | R04 Finch birdhouse (care-object home) · R04 Daylio mosaic · R04 1SE mashup · R04 Timehop then-&-now · R01 Day One Today tab · PART 9 §9.6-9.7 |
| Settings & trust surfaces | R03 Standard Notes · R01 Daylio privacy onboarding · PART 9 §9.7 · mobbin: Finch (671 screens), stoic. (303), Evernote (352) |

Mobbin data: `research-journaling/mobbin-*.json` (Finch, stoic.,
Evernote, Apple Notes, Notion, 5 Minute Journal, Bloom, Otter AI) + `research-fitness/mobbin-*.json` (Hevy, Fitbod, MacroFactor, NRC, Strava, workout-family; helper `research-fitness/mobbin-query.mjs`). Only M3 NUTRITION GUI remains uncovered (see table row) — schedule a research pass when M3 UI begins.

### Fitness mobbin dataset map (pipeline-draftable design references)

VERBATIM-CRITICAL reference block: drafters copy the FILE PATHS and screen counts exactly (never inline JSON contents — the datasets are large reference inventories, cited not embedded). Each dataset serves the listed M2 surfaces; the F-candidate LANDS lines carry the per-candidate mobbin refs.

| Dataset (file) | App | Screens | Serves (M2 surface / candidates) |
|---|---|---|---|
| `research-fitness/mobbin-screens-hevy.json` | Hevy | 295 | Logging screen anatomy (F-02), previous-session comparison (F-01), rest timer, stats charts (F-28) |
| `research-fitness/mobbin-screens-fitbod.json` | Fitbod | 216 | Generated-workout presentation, recovery/heatmap surfaces (F-19 context), session pre-load (A7) |
| `research-fitness/mobbin-screens-macrofactor.json` | MacroFactor | 402 | Body surfaces — trend chart, rate-vs-target, milestone/forecast, weigh-in flow (F-13/F-14/F-15/F-16) |
| `research-fitness/mobbin-screens-nrc.json` | Nike Run Club | 325 | PR callout + benchmark sessions, streak/achievement surfaces (F-03, F-25 context) |
| `research-fitness/mobbin-screens-strava.json` | Strava | 709 | Streak/challenge displays, activity summary surfaces (F-24 weekly context), positive-only gamification |
| `research-fitness/mobbin-screens-workout.json` | Workout family | 946 | Cross-app logging/progress patterns — charts, dashboards, achievements, calendars (general M2 reference) |
| `research-fitness/mobbin-query.mjs` | — | — | Query helper (screens | flows | apps) for future mobbin pulls |

Pipeline note: all six datasets are committed repo files (research-fitness/), readable by drafters at their paths; the GUI-table M2 row above plus this map are the two drafting entry points for mobbin content.

## Unlocks & extras (user picks)

_TO FILL — unlock/earn mechanics and small extras the user wants; each
item states its interaction with the XP/trophy rules already locked (no
XP for trophies, anti-farm gates)._

## Refactor proposals (per area)

_TO FILL during audits — each proposal: current behavior, reference
evidence, proposed change, decision status._

---

## APP MAP — all major parts/sections

The app as one map: every major part, its build status, and its
milestone home (Roadmap M0–M13). Refactor audits hang off this list —
each area below is the anchor for its audit checklist item.

### A. Built / in progress (M0–M1)
1. **Core shell & navigation** — tabs (Dashboard, Journal, Habits,
   Settings), bottom bar mobile / left rail desktop, theme system
   (dark-first tokens, DesignSystem.md), responsive layout. Audit
   anchor: shell-level concerns (no checklist item — see map note).
2. **Welcome / onboarding** — 3-step first run (what PersonalOS is,
   first habits, first journal entry). Audit: reference onboarding
   flows.
3. **Dashboard** — BUILT: today section (briefing + habit ticks +
   capture), Coach note, goals/tasks placeholders, streak ring,
   storage card, habit rows. PLANNED (not built): calendar/heatmap
   strip (M6), strength snapshot (M2), weekly review/Coach note
   block (M2+). Audit #1 anchor.
4. **Journal** — compose (text + photos + vlogs), chronological
   timeline, tags, Life Areas, edit/delete with event history, media
   thumbs + vlog capture. M1 expansion pending (J1–J6 +
   physique-photo timeline). Audit #2 anchor.
5. **Habits** — today's list, one-tap check-off, habit detail sheet
   (streak, 7/30-day indicator), edit/create/archive, Life Areas.
   Audit #3 anchor.
6. **Settings & data** — settings groups, export/restore, recovery
   screen, storage meter + data section. Audit #8 anchor.

### B. Services & data layers (cross-cutting)
7. **Data layer** — drift/sqlite WASM database, models, repositories
   (the ONLY storage touchpoint), adapters, event log (single behavior
   history), isImported flags. Boundary rules per AGENTS.md.
8. **Services** — storage, media (MediaRepository; blob handling),
   web, coach stub (M0 rule: 3-missed-days line), growth
   (`growth_stage.dart` — the Life Tree seed).
9. **Achievements catalog (cross-cutting, lives at repo root)** — v2
   = THE WHAT, TEMP-PLANNING-Achievement-Spec.md = THE WHEN (E0–E13,
   131 trophies + 47 rungs), Gamification.md = THE WHY. Audit #9
   anchor (achievements/rings surface once it renders).

### C. Planned (milestone homes; audits can pre-plan, not pre-build)
10. **Fitness & Body (M2)** — gym sessions, templates, exercises,
    PR/est-1RM (Epley), standards, records vault, deload, body
    metrics, physique timeline. Audit anchors: audit-4 (gym) +
    audit-6 (body/weight — corrected: fitness AND body both live
    here; audit-6 is not orphaned).
11. **Nutrition (M3)** — food log, meals, recipes, macros (kcal/
    protein/carbs/fat), targets (TDEE), weigh-in resolution,
    macro-gap bar, weekly check-up. Audit #5 anchor.
12. **Routine & Briefing (M4)** — daily routine templates, briefing
    (today at a glance). Audit anchor: audit-3 (habits — routine
    slots are habit-adjacent; corrected from the old #6 mis-map).
13. **Goals & Tasks (M5)** — goals with milestones/tasks, plan
    adherence, projections. Audit anchor: audit-11 (incorporate
    review — corrected; no checklist item owns goals; see map
    note).
14. **Calendar & Periods (M6)** — year heatmap, day view,
    plan-vs-actual, vacation/trip periods. Audit #1/#8 surface ties.
15. **Analytics Engine & Gamification (M7)** — H3 owner functions,
    XP policy (locked), streak grace, day activity score, trophy
    engine (achievement.unlocked events), Coach tie-in loudness.
    Audit #9/#10 anchors.
16. **Full Coach (M8)** — rule catalog session (deferred by design),
    coach_outputs weekly review, strictness, reflections.
    Audit #10 anchor.
17. **LIFE TREE (M9 — MAIN GOAL of this generation)** — dedicated
    tab, huge stylized growing tree, 10-ring trunk, domain branches,
    tier foliage; design system spec = this file's main section.
18. **Drive P2/P2.5/P3 (M10–M13)** — backup, entity sync, media blob
    sync, media vault. No refactor audits planned; contracts only.

### Map notes
- Audit numbering matches the open-items checklist (1–10, plus
  audit-11/12/13 for incorporate/unlocks/life-tree); audits
  target areas that exist or render first, planned areas get
  pre-planned proposals only.
- Anchor correction record (audit finding): item 12 no longer
  claims audit-6 (body/weight) — it maps to audit-3; item 13 no
  longer claims a shared #6/#7 — goals map to audit-11; the shell
  (item 1) has no dedicated checklist item — shell concerns fold
  into audit-1 (dashboard) + audit-8 (settings).
- ACCURACY CORRECTION (audit finding): the dashboard block stack
  as BUILT in lib/ = Today section (briefing + habit ticks +
  capture), Coach note, goals/tasks placeholders, streak ring,
  storage card, habit rows — the calendar/heatmap strip,
  strength-snapshot placeholder, and weekly-review block are
  PLANNED (M6/M2/M2+), not built; marked as planned, not "built /
  in progress".
- The Life Tree sits on top of analytics feeds (M7) + rings data —
  its design section (below) assumes those locks, nothing earlier.

---

## LIFE TREE DESIGN SYSTEM (MAIN GOAL)

Idea recorded gen-1 (archived ledger): dedicated tab, huge stylized tree
that actively grows as everything is logged/achieved across all areas;
biggest UI-heavy feature; big review surface; Growth-Rings/10-ring
structure built into the graphic; implementation deferred to M2.

This section is the working design space. Dimensions to lock, in order:

### tree-1 Vision & metaphor (SKELETON — design dim, filled at the Life Tree design session; no lock)
- What the tree IS (life archive as a growing organism), what it is NOT
  (decoration — every element must mean real data).
- Tone: awe without guilt; dormant ≠ failed.

### tree-2 Tree anatomy (visual system) (SKELETON — design dim, filled at the Life Tree design session; no lock)
- Trunk + the 10-ring structure (Pith → Yew; one ring = one Life, Fully
  Logged qualifying yearly window — locked definition, v2).
- Branches: one per achievement domain (which domains exactly, how they
  fork, how length/canopy encode yearly presence + trophies).
- Foliage/trophies: Sprout → Grove tier mapping, leaf/bud/twig per tier,
  trophy density, "new" states.
- Space & scale: how the tree grows in the viewport over years (decade
  scale without cramping); iPhone PWA ↔ desktop responsive behavior.
- Theme: dark-first tokens, ring/leaf palettes, seasonal or state tints.

### tree-3 Growth data (100% derived — never write-path) (SKELETON — design dim, filled at the Life Tree design session; no lock)
- Exact H3 owner feeds: ring count, dayDomainPresence per domain,
  per-tier claim counts, yearly presence, milestone dates.
- Mapping table: data → visual element (every pixel traces to a number).
- Refresh/caching semantics (M2 Analytics-Engine derived cache; when the
  tree re-computes; shimmer vs incremental growth animation rules).
- Growth animation language: what animates (ring closing, branch
  extending, leaf appearing), triggers (unlock event, open tab), and
  duration/rhythm — celebratory but never spammy.

### tree-4 Surfaces & interaction (SKELETON — design dim, filled at the Life Tree design session; no lock)
- Full tab layout: hero tree, overview strip, detail panel.
- Tapping a ring/branch/leaf → derived facts-only detail (domain yearly
  presence, trophy list, ring history); no journal text, no media.
- First-run / sprout state, empty states, dormant-domain states.
- Navigation: tab existence (gen-1), placement per the deferred UI/UX
  ordering pass.

### tree-5 Render & performance (SKELETON — design dim, filled at the Life Tree design session; no lock)
- Heaviest derived block in the app: paint strategy (canvas vs layers),
  skeleton shimmer, never blocking first paint; decade-scale data cost
  bounds; reduced-motion accessibility.

### tree-6 Implementation plan (SKELETON — design dim, filled at the Life Tree design session; no lock)
- M2 scope, build order (data owners → mock render → polish), test
  strategy (widget tests for states, perf gate), mockup in the UI/UX pass.
