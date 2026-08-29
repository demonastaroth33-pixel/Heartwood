MISS: LANDS: Roadmap M4; Database.md (routine  MISS: LANDS: UIUX.md (dashboard); DesignSystem MISS: LANDS: CoachSystem.md (rule-book session # TEMP-PLANNING — Generation 2 (refactor & Life Tree design)

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
D084 SKILL INSTALL - SECURITY SUITE x2 (LOCKED, user yes - 2026-08-29):
    WHAT: installed (a) openai/skills@security-threat-model (official
      OpenAI, 25.3K-star repo, 4.9K installs, ALL 3 audits pass) -
      repo-grounded AppSec threat modeling with evidence anchors and
      an output contract; serves the M3 OAuth gate + the engine build.
      (b) addyosmani/agent-skills@security-and-hardening (29.3K
      installs, 90.5K-star repo, ALL 3 audits pass) - web security
      hardening for the Flutter Web/PWA surface (input validation,
      auth, storage, import/export, LLM output handling, supply
      chain) + its security-checklist.md reference fetched.
    REJECTED: getsentry/skills@security-review (14.8K installs) -
      Snyk audit FAIL on skills.sh; content read and clean, but the
      audit fail fails the preference standard (Gen Agent Trust Hub +
      Socket passed). Suite already covers review lenses (owasp +
      strix x9 + hardening).
    SECURITY PASS: skills.sh audits verified per candidate; actual
      SKILL.mds + reference files read (no prompt injection, no
      malicious commands); on-disk re-scan of all installed files
      clean; the shared checklist reference was fetched from the
      source repo and scanned clean.
D083 SKILL INSTALL - FLUTTER-EXPERT (LOCKED, user yes - 2026-08-29):
    WHAT: installed jeffallan/claude-skills@flutter-expert into
      .opencode/skills/ (project-level; the skills CLI defaulted to
      .agents/skills/ and the folder was moved). Riverpod/Bloc state
      management + performance profiling references - the app's exact
      stack (Riverpod, Flutter); supports the Life Tree engine build
      (off-UI-thread derivation via compute(), RepaintBoundary render
      isolation, DevTools profiling).
    SECURITY PASS (mandatory for every skill install - see AGENTS.md
      skill-vet rule): 3 independent audits passed on skills.sh (Gen
      Agent Trust Hub, Socket, Snyk) + full manual review of SKILL.md
      and all 6 reference files - no prompt injection, no malicious
      code, no suspicious file/network operations; on-disk scan after
      install clean. The skills.sh entry "flutter/agent-plugins@
      flutter-performance" was REJECTED - stale index (the official
      repo contains no such skill - verified against the repo tree).
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

- N-09 BARCODE SCANNER (LOCKED, user yes - gen-2 approval; D069 distinction recorded):
    SOURCE: R02 R6 (research-nutrition); user approval; docs already
      anticipate it - `source` column enumerates `scanner` (Roadmap.md:326).
    WHAT: EAN lookup via the native Chrome BarcodeDetector API (offline,
      ~94% of Chrome, dependency-free on Flutter web) + zxing-wasm fallback;
      lookup against a local OFF/FDC mirror (see N-02 when triaged); scan ->
      match -> verify -> add.
    DISTINCTION (verbatim): the D069 do-not-build AI food scanner is the
      PHOTO-AI scanner (meal estimation - stays rejected, evidence-backed:
      1/3-calorie error + cloud-bound); EAN barcode lookup is a DIFFERENT
      feature, never blocked, now approved.
    CONSTRAINTS: on-device only; no cloud; no AI estimation; no new package
      needed on web (verify at build); DecisionLog entry records the approval
      + D069 distinction.
    LANDS: DecisionLog (D082+); Roadmap M3; Database.md (barcode lookup
      against the seed data).
- N-01 HISTORY/RECENT-FIRST LOGGING + PROVENANCE BADGES (LOCKED,
  user yes - all decision points accepted):
    SOURCE: MacroFactor (R01) + Cronometer (R01) + DAI audit (R02).
    WHAT: (a) the diary opens on YOUR foods - recent/history/
      favorites ribbon, 2 taps to log (the <30 s/meal, 2-3 tap
      retention bar); (b) persistent nutrition banner (plate totals,
      swipeable to day-remaining) = the macro-gap bar's home;
      (c) provenance badges on every food row + daily totals
      (verified/custom/source) - the locked `source` column made
      visible; (d) producer-switcher row (Manual / Food DB / Pack /
      Scale / Scanner) mirroring the locked source producers.
    DECISIONS (accepted): history ribbon = top-12 recent + pinned
      favorites · badges always-visible tiny chips (trust is
      glanceable).
    UI NOTE (user, verbatim): UI/UX candidate - current suggestions
      recorded; FUTURE UI DEVELOPMENT STAGES may change or keep them.
    CONSTRAINTS: no single-macro quick-add; facts-only.
    LANDS: UIUX.md (diary); Database.md (source display); Roadmap M3;
      MOBBIN REFS: research-nutrition/mobbin-screens-mfp.json (290) -
      diary/search/food-detail anatomy.
- N-03 ADHERENCE-NEUTRAL COMPLIANCE MATH (LOCKED, user yes):
    SOURCE: MacroFactor (R01).
    WHAT: weekly check-up denominator rules - missed rows NEVER count
      as zero (unlogged days = typical intake or excluded); compliance
      = logged days' performance only; no streak displays for
      nutrition.
    DECISIONS (my take, pending user confirm at walkthrough): missing
      days EXCLUDED from the denominator when <5 logged days (thin-
      week rule); typical-average only when the week is otherwise
      complete. [REVIEW - user accepted the candidate; confirm this
      decision point or adjust]
    LANDS: CoachSystem.md (weekly check-up denominator); Database.md.
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — the adherence-neutral check-in card reference (N-03).
- N-11 GRAM-ANCHORED PORTION STEPPER UX (LOCKED, user yes):
    SOURCE: USDA FDC/FNDDS (R02 R4) + Cronometer.
    WHAT: every food carries a gram reference; portion picker offers
      unit presets each carrying gram equivalents (1 cup = 125g, 100g,
      1 serving as packaged); portionMultiplier scales from the gram
      anchor (1.5x of 125g cup = 187.5g exact); text-based portion
      input (evidence: beats image-based); seed data brings FNDDS
      portion weights (N-02).
    DECISIONS (my take, pending user confirm): grams as canonical
      entry, presets as shortcuts. [REVIEW - confirm or adjust]
    LANDS: UIUX.md (food detail); Database.md (gram reference field);
      Roadmap M3.
    MOBBIN REFS (verbatim): research-nutrition/mobbin-screens-mfp.json
      (290) — food-detail/portion-picker anatomy (N-11).
- N-18 VENDOR-RESILIENT EXPORT FOR FOODS/RECIPES (LOCKED, user yes):
    SOURCE: R03 (vendor extinction - PlateJoy shut July 2025,
      PlanEatMore defunct).
    WHAT: dedicated human-readable export for the nutrition namespace
      - foods + recipes (name, macros, servings, gram references) as
      readable/re-importable docs; rides the existing export machinery.
    LANDS: Roadmap M3 (export); UIUX.md (settings).
- N-02 USDA FDC SEED + PRIVATE NAMESPACE - TIERED DATA ARCHITECTURE (LOCKED, user yes - all four decisions confirmed):
    SOURCE: R02 R1/R2 + R01 (Cronometer architecture); user goal: the
      nutrition section must genuinely compete with industry gold
      standards (MacroFactor, Cronometer).
    THE REFRAME (verbatim - the design premise): we never BUILD a food
      database - the honest data exists free (USDA FDC = CC0,
      OpenFoodFacts = ODbL); the work is curation, licensing hygiene,
      and tiered distribution. Accuracy leaders win on ARCHITECTURE
      (verified-default + provenance + sandboxed customs), not size
      (Cronometer 98% verified / 0.9% error vs MFP 23% error).
    THE TIERED ARCHITECTURE (accepted - the data design):
      TIER 1 BUNDLED CORE (verbatim): FDC SR Legacy + Foundation +
        FNDDS generics + quality-flagged OFF top products, brotli-
        compressed at build; instant local search, airplane-mode
        complete; the SPEED tier. Covers 80-90% of daily eating.
      TIER 2 GROWING LOCAL MIRROR (verbatim - the accumulation
        rule, USER-CLARIFIED): EVERY food lookup - bundled hits AND
        online pass-through results - is cached into the local
        searchable mirror. The mirror is the accumulation of ALL
        lookups, ranked by frequency + recency, so items that become
        REGULAR surface first. Online pass-through (likely the most
        common path once the app is in daily use) feeds the mirror
        on every single lookup - a niche item looked up once is
        cached; if it becomes regular, it ranks up automatically.
        Over months the mirror CONVERGES ON THE USER'S ACTUAL DIET:
        offline coverage approximately equals real eating, and the
        app's offline experience IMPROVES with use. This is the
        personalization no cloud app can offer (they serve a global
        DB; the user grows a personal one).
      TIER 3 ONLINE PASS-THROUGH (verbatim - when connected): full
        FDC + OFF API queries for the long-tail (niche brands, new
        products, obscure EANs); barcode scans (N-09) hit the mirror
        first, then the online pool; EVERY tier-3 result is cached
        into tier 2 per the accumulation rule above.
      SEARCH PRECEDENCE (verbatim): local mirror -> bundled core ->
        online pool. Provenance badges (N-01) label the result tier:
        bundled USDA / cached / online. Coverage is honest too - the
        badge explains why an item is missing offline.
    THE ONLINE EXCEPTION (accepted - user: fine; DecisionLog entry
      records it verbatim): food-database network exception - read-
      only, TERM-ONLY queries (food names / EANs) to public databases
      (USDA FDC, OpenFoodFacts) when connected. NO account, NO diary
      payloads, NO personal data, NO query logging, NO writes.
      Offline-first unchanged; tier-3 results cache locally (the
      accumulation rule). The SOLE network exception in the nutrition
      domain; the security gate checks against this contract.
    NAMESPACE RULE (Cronometer's, verbatim): a custom row can NEVER
      shadow a canonical row in search - canonical-first always; My
      Foods one tap away; provenance badges label every result tier.
    SEED SCOPE (CONFIRMED - user yes): ~15k bundled - FDC full
      generics (SR Legacy + Foundation + FNDDS) + quality-flagged
      top-5k OFF branded products (~10-15 MB brotli). Rationale:
      the mirror (tier 2) makes bigger bundles unnecessary - the
      bundle is the SPEED tier, the mirror is the PERSONAL tier, the
      online pool is the DEPTH tier.
    MICRONUTRIENTS - SEPARATE MILESTONE M3b (CONFIRMED - user yes):
      micros get their own milestone (M3b, after M3 before M4 -
      needs the M3 diary foundation, self-contained after that); data
      already CC0 + complete in FDC (the same root Cronometer uses -
      the work is UI/UX + display science, NOT data); the milestone
      includes a LARGE GUI/UIX SECTION pulled from mobbin research
      (nutrient report cards, deficiency flags, %DV, adequacy
      coloring, per-nutrient trends). MOBBIN CAVEAT (recorded):
      Cronometer - the micro-UI gold standard - has NO mobbin
      screens (query returned only its app index); M3b needs a
      dedicated mobbin pull + research pass at activation; the
      nutrition report's Cronometer GUI descriptions (84-nutrient
      profile, adequacy coloring, deficiency flags) seed the
      reference until then.
    DRAFTER NOTES (critical - draft this cleanly):
      (1) DATABASE.md drafts: the tiering plan (bundled core tables
        + local mirror table + source/provenance columns + gram-
        reference field per N-11); the seed scope numbers (15k,
        10-15 MB) are VERBATIM-CRITICAL; the accumulation rule
        (every lookup caches, frequency+recency ranking) is
        VERBATIM-CRITICAL.
      (2) DECISIONLOG drafts: D-number entry recording (a) the
        online exception contract VERBATIM (read-only, term-only,
        no account, no diary payloads, no query logging, no writes,
        sole nutrition-domain exception), (b) the data licensing
        note (FDC CC0 / OFF ODbL attribution in-app), (c) the
        seed-data bundle decision.
      (3) ROADMAP drafts: the M3b milestone entry (micronutrients,
        after M3 before M4, mobbin-caveat note included).
      (4) UIUX drafts: diary surfaces per N-01 (history-first,
        provenance badges, producer switcher) - the tier badge
        labels (bundled USDA / cached / online) are VERBATIM-
        CRITICAL.
      (5) The security gate references the online-exception
        contract when reviewing any nutrition network code.
    LANDS: Database.md (seed plan + tiering + mirror); DecisionLog
      (online exception + licensing + seed decision); Roadmap (M3b
      milestone); UIUX.md (diary + badges).
    MOBBIN REFS (verbatim): research-nutrition/mobbin-screens-mfp.json
      (290) — search/verified-badge + diary anatomy (N-02 tiering
      context); research-nutrition/mobbin-screens-noom.json (529) —
      density/trust surface patterns.
- N-04 PLAN-CONFIRM LOGGING + GAP REBALANCE (LOCKED, user yes - both decision points my takes accepted):
    SOURCE: Eat This Much (R03).
    WHAT: logging by CONFIRMING the plan: template-bound days show
      planned meals; logging = one-tap confirm (or log-all-planned);
      the locked batch catch-up becomes the confirm flow. GAP
      REBALANCE: a skipped/swapped meal's macro gap reshapes the
      REMAINING meals' suggested composition so the day lands near
      target - the macro-gap bar made proactive (report card ->
      steering wheel).
    DECISIONS (verbatim): (a) rebalance = SUGGESTED adjustments,
      user confirms - NEVER auto-applied (the plan is the user's;
      same principle as the locked PO kill-switch and F-08's
      report-never-auto-change) Â· (b) confirm is a MODE, not a
      template feature - applies to free-form days too (catch-up
      unified).
    LANDS: Roadmap M3 (batch catch-up v2); CoachSystem.md (gap bar);
      UIUX.md (diary plan view).
- N-05 PACK MODEL - RECIPE -> BATCH -> CONTAINERS -> CONSUME, WITH
  MIXED BATCHES FOLDED IN FROM DAY ONE (LOCKED, user yes - mixed
  batches included by user decision):
    SOURCE: R03 (open territory - no app ships it fully).
    WHAT: prepped batches as first-class: recipe x N servings ->
      BATCH -> CONTAINERS -> consume-decrement; the locked packed`r
      source producer gets its first-class flow; composes with
      N-04 (a packed meal IS a confirmed plan meal).
    MIXED BATCHES - FOLDED IN (user decision, verbatim): NOT the
      simple count-per-batch model - the FULL containers model from
      day one:
      (1) CONTAINERS TABLE with per-container LINE ITEMS (a mini
        receipt per container): partial servings (a 2-serving
        container), mixed contents (chicken+rice vs chicken+veggies
        in one prep session), multi-recipe meals (recipe A + recipe
        B + food item C in one container, each part with its own
        portion multiplier).
      (2) CONSUME MATH per container's OWN line items: partial-
        consume semantics (ate half the 2-serving container), per-
        part honest sources (each part keeps its source: packed /
        fooddb / recipe).
      (3) UI: a container LIST (each with contents + remaining -
        an editor, not a badge).
      (4) SCHEMA: batch entity + containers table with line items
        - built full, nothing grows later.
    DECISIONS (verbatim): (a) mixed batches INCLUDED (user) - the
      complexity is accepted knowingly (schema: batch + containers
      + per-container line items; partial-consume semantics; per-
      part sources) Â· (b) both container kinds: recipe-linked (for
      accuracy) AND free-form (for leftovers) - agreed.
    LANDS: Database.md (batch/containers/line-items schema -
      DecisionLog schema entry); Roadmap M3/M4 (scope placement);
      UIUX.md (pack view).
- N-10 ONE-TIME RECIPE SUBSTITUTION (LOCKED, user yes - two-scope
  cascade + macro-range adherence condition):
    SOURCE: Portions (R03).
    WHAT: a meal slot fills by ANY recipe/food as a one-time event -
      the substitution lives on the RECEIPT LINE, not the recipe
      (copy-in preserved, no fork, no variant) and not the plan
      (tomorrow's plan unchanged). Flexibility lives at the USE
      level, never the DEFINITION level; the escape valve that keeps
      confirm-mode (N-04) sustainable without guilt. History honest:
      today's line says the substitute with a facts-only note
      (substituted for planned X).
    DECISIONS (verbatim): (a) TWO SCOPES - (1) CURRENT-MEAL-ONLY
      built FIRST (M3): affects today's slot, nothing else; (2)
      CASCADE built AFTER it (user wants it): substitute for the
      rest of the week - a deliberate EDIT-PLAN action with
      confirmation, never a silent side effect of substitution;
      cascade = separate feature with its own semantics. (b)
      ADHERENCE CONDITION (user, verbatim): substituted meals
      count as adhered (done-differently) ONLY WHEN the substitute
      lands within the INTENDED PLANNED MACRO RANGE (the meal
      slot's planned macro band, e.g., dinner 600-750 kcal); a
      substitute OUTSIDE the band logs honestly but does NOT count
      as adhered (unplanned deviation, not done-differently); the
      gap-rebalance (N-04) suggests adjustments toward the band.
    LANDS: Roadmap M3 (substitution) + M3+ (cascade); Database.md
      (receipt-line substitution field); CoachSystem.md (adherence
      semantics - done-differently + macro-range rule).
- N-06 FREE-FOODS LIST (LOCKED, user yes - both decision points agreed):
    SOURCE: WW ZeroPoint lesson (R04) - the demand is real, the
      broken part is hidden calories.
    WHAT: a small, user-editable list of CALORIE-TRIVIAL foods
      (water, black coffee, tea, plain vegetables, herbs, zero-
      calorie drinks) that skip logging friction - with the
      integrity guarantee: NOTHING is actually free - each entry
      carries its REAL macros (user clarification, verbatim: MACRO
      COUNTS MUST BE ACCURATE - never fudged to zero); logged
      entries count honestly. Small (not WW's 350), user-editable,
      calorie-trivial - the demand met with integrity intact.
    DECISIONS (verbatim): (a) default seed = small curated default
      (~20-30: water, black coffee, tea, plain veg, herbs) + user-
      extendable - agreed Â· (b) skipped by DEFAULT (that is the
      point) with a log-it-anyway path for completeness days; the
      daily totals footnote: N trivial items not logged - agreed.
    CONSTRAINTS: never hides calories (the WW failure mode is
      explicitly avoided); macro accuracy required on every entry.
    LANDS: UIUX.md (diary); Roadmap M3; Database.md (list table -
      trivial-foods flag or separate list).
    MOBBIN REFS (verbatim): research-nutrition/mobbin-screens-mfp.json
      (290) — diary/one-screen patterns (N-06 context).
- N-15 EATING-WINDOW AWARENESS (LOCKED, user yes - both decision
  points agreed):
    SOURCE: Yazio (R04 - the diary and the window coexist) + Zero.
    WHAT: OPTIONAL fasting-window indicator on the diary - the
      window band shows fasting/window state; logged meals appear
      inside/outside it with a NEUTRAL marker (facts, no judgment).
      In-app only (no push, no timers nagging - the no-push rule
      untouched), quiet-week aware, default OFF (opt-in). It is a
      DISPLAY AWARENESS LAYER, NOT a fasting product: no window
      coaching, no window trophies, no streak pressure, no
      notifications. Composes with N-04 (window-aware plans place
      meals inside the window - optional).
    DECISIONS (verbatim): (a) schedule model = SIMPLE DAILY WINDOW
      (start/end, or two windows) WITH PER-DAY EXCEPTIONS - user
      agreed Â· (b) outside-window marker = neutral facts-only line,
      NEVER a warning color (no-shame applies to fasting too) -
      agreed.
    LANDS: UIUX.md (diary); Roadmap M3; Settings (toggle).
    MOBBIN REFS (verbatim): research-nutrition/mobbin-screens-yazio.json
      (276) — diary+fasting-window coexistence; mobbin-screens-zero.json
      (139) — fasting ring/timer patterns (N-15).
- N-17 DIET-MODE RE-DERIVATION - FUTURE-CAPABILITY SCOPED NOW (LOCKED,
  user yes - both decision points agreed):
    SOURCE: MyNetDiary (R04 - ships the exact fix-two-flex-one model
      in production).
    WHAT: the re-derivation RULE any diet mode would use - fix two
      macros, flex one (the same shape as the locked architecture):
      keto = protein g/kg fixed + carb ceiling fixed -> fat as
      remainder; low-carb = protein fixed + fat floor -> carbs flex
      within a cap. The architecture does not change; the CONSTRAINT
      ORDER changes per mode. FEATURE IS FUTURE - recorded now so the
      macro derivation engine is BORN READY: written with the
      constraint-order abstraction (protein-fixed + floor-fixed +
      remainder-flex), never hard-coded to bulk/cut/maintain; zero
      extra build cost.
    DECISIONS (verbatim): (a) record-the-abstraction-now, feature-
      later (free door-open) - agreed Â· (b) net-carbs and similar
      per-mode displays = FUTURE decision, gated by the honest-
      macros rule (net-carbs is a display convention, never a stored
      data change) - agreed.
    REVISIT: when new phase types / diet modes are actually proposed.
    LANDS: Architecture.md (macro derivation engine abstraction);
      Roadmap M3+; DecisionLog.
- N-12 DENSITY FACTS AS NEUTRAL COACH LINES (LOCKED, user yes -
  both decision points my takes accepted):
    SOURCE: Noom lesson (R05) - color-coded density = food
      moralization (ED-safety flag per clinical reviewers).
    WHAT: the density heuristic RESTATED NEUTRALLY as facts-only
      Coach lines - never colors, never good/bad framing, never
      Life-Score composites: "This meal is 2.1 kcal/g - a dense
      option." The fact is the same; the judgment is absent. This
      is the ONLY legitimate form of the feature under the locked
      no-shame rule.
    DECISIONS (verbatim): (a) fires on SPECIFIC meals when the
      Coach has a factual density outlier to state - never a
      constant label on everything - agreed (b) RELATIVE framing
      (dense/lighter vs the user's typical meals) rather than
      absolute cutoffs - relative avoids moral tiers entirely -
      agreed.
    CONSTRAINTS: facts-only; derived + explainable (show-your-
      work); no shame.
    LANDS: CoachSystem.md (rule-book); UIUX.md (diary).
- N-14 PER-MEAL PROTEIN PACING COACH FACTS (LOCKED, user yes - both
  decision points my takes accepted):
    SOURCE: R06 (per-meal protein distribution evidence).
    WHAT: facts-only Coach lines about protein DISTRIBUTION over
      the locked daily g/kg target: "Protein so far: 40g - 60g
      across the remaining meals keeps the 1.8 g/kg pace." Rides
      the macro-gap bar's protein line - a pacing NARRATIVE over
      the existing number; zero new logging (derived from existing
      protein rows).
    DECISIONS (verbatim): (a) once daily, evening, when the pattern
      is visible - never nagging - agreed (b) pace-neutral
      phrasing ("keeps the pace"), never "you're behind" - the
      no-shame boundary - agreed.
    LANDS: CoachSystem.md (rule-book); UIUX.md (gap bar).
- N-16 VEGGIE SERVINGS + WATER HABIT CHECK-INS (LOCKED, user yes -
  both decision points my takes accepted):
    SOURCE: R05 (habit-based nutrition evidence; meta-analyses).
    WHAT: veggie servings + hydration become habit check-ins
      INSIDE the nutrition domain - the locked habit engine (daily
      check-ins, grace, quiet-week, no-shame, zero-XP) applies
      unchanged; nutrition data sources auto-tick them.
    DECISIONS (verbatim): (a) auto-tick rules - veggie servings
      auto-tick from a veggie-tagged food category (seeded, user-
      adjustable); water auto-ticks from logged water - agreed
      (b) scope - seed TWO habits (veggies, water) as DEFAULTS-
      OFF, user-enabled, never forced - agreed.
    CONSTRAINTS: zero XP for ticking (locked); manual check-in
      always wins; isImported excluded.
    LANDS: Gamification.md (habits); Roadmap M3; Database.md (food
      veggie-tag + water source).
    MOBBIN REFS (verbatim): research-nutrition/mobbin-screens-lifesum.json
      (345) — habit-tied nutrition surfaces (N-16).
- N-08 EXERCISE KCAL DISPLAY-ONLY (LOCKED, user yes - both decision points agreed):
  candidate fully explained):
    SOURCE: R06 double-count evidence; MacroFactor philosophy.
    WHAT: exercise kcal (NU9 band + cardio MET) renders in the
      macro-gap bar as DISPLAY-ONLY and NEVER expands the day's
      targets (PAL already embeds exercise; wearables overestimate
      27%+; eating-back silently stalls cuts / bloats bulks).
    DECISIONS (verbatim - agreed): (a) SHOW the burn as a labeled
      fact (honesty is the product; the label prevents misuse) (b)
      weekly check-up mentions it as a fact line only, never an
      adjustment - agreed.
    LANDS: CoachSystem.md (NU9 rule); UIUX.md (gap bar).
- N-07 IMPLIED-TDEE INSIGHT (LOCKED, user yes - ALL decision points D1-D7 approved; the TDEE deep-dive, complete design):
    SOURCE: R06 (macro-science report, ~85 sources); MacroFactor's
      predictor-corrector expenditure model; Carbon's rule-based weekly
      check-in precedent.
    CONTEXT - THE THREE-LAYER ARCHITECTURE (recorded):
      L1 FORMULA SEED (locked, M3): Mifflin-St Jeor RMR x PAL - a guess
        (+-200-500 kcal error; R06 1.1: >10% error in 20-30% of users;
        Mifflin unbiased at group level, right default).
      L2 ROLLING-WEIGHT RECOMPUTE (locked, M3): Mifflin re-run on current
        rolling weight (F-13 EMA trend value), weekly - better, but the
        PAL multiplier's frozen error stays inside the number (R06 1.2:
        PAL = the single biggest error source - self-report overestimation
        ~80% of users, 1-MET baseline wrong by 10-35%, errors multiply,
        questionnaires poor at individual level, body-size bias).
      L3 IMPLIED-TDEE INSIGHT (this candidate; M3+ per D5): SOLVED from
        intake + trended weight - cancels formula/PAL/activity/adaptation
        error (MacroFactor median error ~108 kcal/100 days vs formula >500).
      THE PIVOT (verbatim): a formula TDEE is a guess; weight trend +
        intake is a measurement. Energy-balance identity rearranged:
        Calories out = Calories in - change in stored energy.
    THE MATH (verbatim - complete formula set):
      L1: RMR_Mifflin = 10*W + 6.25*H - 5*A + 5 (men) / ...-161 (women);
        TDEE_formula = RMR x PAL (PAL in {1.2,1.375,1.55,1.725,1.9});
        calorieTarget = TDEE + (rate x 7700) / 7 (signed weekly rate:
        bulk +0.25-0.5, cut -0.5, maintain 0).
      L3: impliedTDEE ~= avgLoggedKcal(7-14 d) - dTrendWeight x 7700 / days
        Worked example (MacroFactor's own): trend +0.2 kg/wk (surplus),
        avg intake 3,000 kcal/d -> surplus = 0.2 x 7700/7 = +220 kcal/d ->
        implied TDEE = 3,000 - 220 = 2,780 kcal/d. Cut example: -0.5 kg/wk
        trend + 2,500 logged -> implied = 2,500 + 550 = 3,050.
    GUARDRAIL CONSTANTS (verbatim - D1, D2, D3, D6 approved):
      trendWindow = 20 DAYS (D1 - the change-rate inference signal; NOT
        the 7-day display EMA - display vs inference are separate derived
        layers, no conflict, recorded); F-13 EMA stays the display trend.
      completenessGate = >=6 of 7 logged intake days, else HOLD.
      weighInGate = >=3 weigh-ins/wk, else HOLD (D3 - a FREQUENCY NUDGE +
        gate, NOT a change to the locked first-of-day canonical weigh-in
        rule; the app nudges toward daily weigh-ins - evidence: daily
        weighing correlates with better outcomes; richer data = better
        estimates).
      updateCap = +/-250 kcal/wk ABSOLUTE CEILING with TWO-STEP HEDGE (D2):
        week 1 moves ~half, week 2 commits if the trend holds.
      symmetry = gain/loss energy content SYMMETRIC (7700 both ways) -
        D7 FIXED (not a knob): inherits the fix for MacroFactor's V3
        ~80 kcal/day asymmetric drift bug; a lean-aware variant would
        reintroduce exactly that drift; the locked signed additive rate
        (rate x 7700/7) is symmetric by construction.
      interpolation = linear gap interpolation on missing weigh-ins.
      HOLD presentation (D6): insufficient data -> "Insufficient data -
        holding." No guess, no silent change (pause-don't-guess,
        MacroFactor guardrail verbatim).
    THE B4 CONTRACT (non-negotiable, preserved verbatim): L3 is SURFACED,
      NEVER AUTO-APPLIED. The implied TDEE renders in the weekly check-up
      as: "Your data suggests maintenance ~ X kcal (from N logged days,
      trend +-Y kg/wk)." The user adopts it ONLY via the existing manual
      TDEE override (B4 freeze stays absolute). The recompute pipeline
      keeps running in the background; the check-up shows implied-from-
      your-data vs locked-value so a freeze is CONSCIOUS, never forgotten.
    ADAPTATION ARC + PHASE ENTRY (the trust lines, verbatim):
      cut entry (phase screen, one line): "Your body will fight the
      deficit - expect implied TDEE to drift ~10% lower over the first
      weeks; that's physiology, not a bug." (metabolic adaptation,
      R06 3.4: ~10-15% TEE reduction beyond mass-based expectation on
      deficits). Bulk entry: mirror image (transient upward read as
      glycogen loads). The check-up teaches the arc: weeks 1-3 = early
      water phase (7700 reads wrong), weeks 3+ = fat-dominated
      convergence. The #1 cause of users distrusting the math -
      pre-announced, it becomes a feature.
    AGGRESSIVE-RATE WARNING (D4 - included): when rate x 7700/7 exceeds
      ~30% of TDEE (~1% BW/wk equivalent): "Aggressive - the
      literature associates >1%/wk with greater lean-mass and hormonal
      cost; consider the slower option." Keeps the math signed-
      additive while importing the %-based safety envelope (R06 6.3).
    SCOPE SPLIT (D5 - approved): M3 ships L1+L2 (already locked) + ALL
      estimate-framing copy (N-13) + the weigh-in policy nudge + the
      adaptation lines + the aggressive-rate warning (cheap, protects
      the math immediately). M3+ ships the L3 implied-TDEE insight
      itself (needs accumulated logging data to mean anything).
    DRAFTER NOTES (critical): (1) ARCHITECTURE.md drafts the owner
      catalog entry (impliedTDEE owner; trendWindow 20-day inference
      signal separate from the F-13 display EMA); (2) COACHSYSTEM.md
      drafts the weekly check-up block (implied-vs-locked display, HOLD
      states, adaptation arc copy); (3) DECISIONLOG records the D1-D7
      verdicts + the B4 contract clarification (surfaced-only); (4)
      ROADMAP M3+ schedules the insight; (5) all constants (20-day,
      6/7 gate, 3/wk gate, +/-250 cap, hedge, symmetric 7700) are
      VERBATIM-CRITICAL.
    LANDS: Architecture.md (impliedTDEE owner); CoachSystem.md (check-up);
      DecisionLog (D082+); Roadmap M3+; UIUX.md (check-up card).
- N-13 ESTIMATE-FRAMING + TAP-TO-EXPLAIN (LOCKED, user yes - part of
  the approved TDEE deep-dive):
    SOURCE: R06 (error-framing evidence; explainable-math mandate).
    WHAT: every derived nutrition number carries honest error framing +
      a tap-to-explain sheet (formula, inputs, constants, sources).
      Converts the app's biggest weakness (formula error) into a trust-
      building feature.
    THE FRAMING COPY TABLE (verbatim - exact lines):
      TDEE (formula): "TDEE from Mifflin-St Jeor: +-10-15% typical
        error (+-200-350 kcal for you) - refines as your weight data
        accumulates."
      7700 kcal/kg: "approx. energy content of 1 kg of fat tissue
        (Wishnofsky 1958); early weeks and water/glycogen swings can
        diverge 30-40%+; judge rates over 2+ week trends."
      Exercise kcal: "+-25-50% estimate; your target already
        assumes this training - the weekly trend is the only adjustment
        authority." (double-count proof by construction - target
        embeds PAL; N-08 display-only rule).
      Implied TDEE (M3+): "your data suggests maintenance ~ X kcal
        (from N logged days, trend +-Y kg/wk) - +-100-150 kcal typical."
      Fat floor: absolute grams with rationale (0.6 g/kg = 45 g @ 75 kg,
        inside the 40-60 g/d sex-hormone band; Trexler's evidence-graded
        floor table; carb-crowding warning when a deep cut leaves carbs
        very low: consider raising fat toward 0.8-1.0 g/kg).
      Protein: phase values with WHY (cut 2.0 / bulk 1.8 / maintain 1.6
        - validated by the literature; cut > bulk > maintain documented;
        very-lean users up to 2.4 g/kg BW; g/kg FFM = future precision
        upgrade if body fat % is ever captured).
      Per-meal pacing (N-14 tie): soft guidance, never a hard target
        (long-term evidence mixed; >=0.25-0.4 g/kg per meal across 3-4
        meals supports ~25% higher 24-h muscle synthesis).
    CONSTRAINTS: facts-only; every number explainable; no fake
      precision; the framing is the product.
    DRAFTER NOTES: UIUX.md drafts the explainer sheet component + the
      footnote copy (VERBATIM-CRITICAL); CoachSystem.md drafts the
      check-up lines; the framing table above is verbatim-critical.
    LANDS: UIUX.md (explainer sheet + footnotes); CoachSystem.md
      (check-up copy); Architecture.md (derived-number provenance).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) - check-up/strategy-tab framing surfaces (N-13).

- L-01 NATURAL-LANGUAGE CAPTURE + CURATED TODAY (LOCKED, user yes - both decision points my takes accepted):
    SOURCE: Todoist (R01 section 4) + Things 3 (R01 section 6).
    WHAT: (a) a single NL input field parses plain text into M5
      structure - "Hit 82kg by Dec 1" -> goal kind=weight, target=82,
      deadline; "Every Mon/Wed bench" -> cadence; the parser is
      RULE-BASED and OFFLINE (patterns + units + date parsing - no AI,
      no deps); the structured form stays for precision, the parser
      pre-fills it. (b) the curated Today view - only due + scheduled
      items; overdue surfaced gently (no drama, no archive/shame
      state); deadline-ring days (M6) pull their goal into Today;
      "This Evening" micro-view (Things) splits today into day/evening.
    DECISIONS (verbatim - agreed): (a) NL parser scope at M5 = dates +
      units + cadences (weight/strength targets, "by X", "every Y");
      free-text-to-goal parsing is future - agreed. (b) curated Today
      DEFAULT with an "all" toggle - mirrors the dashboard's
      show-if-not-empty discipline - agreed.
    CONSTRAINTS: offline rule-based parser; no new deps without
      DecisionLog; derived-only; facts-only.
    LANDS: Roadmap M5; UIUX.md (goal/task surfaces); Database.md
      (parse-output fields - schema decision).
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-todoist.json
      (326) - NL capture + today surface; mobbin-screens-things.json
      (166) - curated Today + This-Evening + areas/projects (L-01).
- L-02 2-DAY SLIP INDICATOR + LOGBOOK WON-ARCHIVE (LOCKED, user yes -
  decision (a) accepted; (b) noted with future-UI caveat):
    SOURCE: Streaks 2-Day Rule (R01 section 3) + Things 3 Logbook
      (R01 section 6).
    WHAT: (a) the 2-DAY SLIP INDICATOR for goal cadences - one skipped
      day doesn't break the run; a "2" indicator shows with the neutral
      line "do it today or it's missed" (recoverable, never shame).
      (b) the LOGBOOK - a permanent, browsable won-archive where
      milestone-review "won" cards land with their one-line reflection
      (the quiet accumulation of wins; Things' reference design).
    DECISIONS (verbatim): (a) goals only at M5 - habits already have
      grace; the indicator is the goal-expiry-specific mechanic -
      AGREED. (b) placement SUGGESTION recorded (inside the goals
      surface as a "Won" archive section, reachable from vault-adjacent
      views); FUTURE UI DEVELOPMENT STAGES will likely affect this -
      noted, not locked.
    CONSTRAINTS: facts-only; neutral framing; no shame; expired goals
      keep the locked "window closed" framing.
    LANDS: Roadmap M5; Gamification.md (grace family); CoachSystem.md
      (milestone review); UIUX.md (goal surfaces).
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-things.json
      (166) - Logbook/won-archive reference (L-02).
- L-03 PACE LINE GOAL VISUALIZATION (LOCKED, user yes - decision (a)
  accepted; (b) recorded for future UI):
    SOURCE: Strides (R01 section 1).
    WHAT: the locked goal-pace + F1 projection rendered as a derived
      PACE LINE - dashed straight line from start value to target
      across the deadline (the required rate), actuals plotted against
      it, on/off-track status; "behind pace" = recoverable, never
      "failed". Derived stat, zero user effort, fully offline.
      Composes with the lit-mirror ladder (the target IS a ladder
      value), F1 projections, and the milestone chart for
      milestone-bearing goals.
    DECISIONS (verbatim): (a) Pace Line for ALL dated numeric goals
      (weight/strength AND generic targets - the math is the same) -
      AGREED. (b) on/off-track COLORS - suggestion recorded (amber for
      behind - the neutral drift color from plan-adherence; red
      reserved for genuinely-expired); LEFT FOR FUTURE UI DEVELOPMENT
      to decide - recorded, not locked.
    CONSTRAINTS: derived-only; offline; no shame language.
    LANDS: Roadmap M5 (goal detail); Architecture.md (owner);
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-todoist.json (326) + mobbin-screens-things.json (166) - goal/today surface patterns (L-03 context)
      UIUX.md (goal chart).
- - L-04 LIVE FINISH ESTIMATE (REJECTED (user) - skipped):
    WHAT WAS: Routinery's running finish-time estimate in the routine
      run and briefing card.
    RESTING PLACE: dead - do not resurrect without a new use case.
      (The briefing's slot list may still show planned end-times; the
      live-updating estimate itself is rejected.)
- L-05 POST-RUN EXPECTED-VS-ACTUAL REPORT (LOCKED, user yes - both
  decision points my takes accepted):
    SOURCE: Routinery (R02 section 1) - "a near-exact blueprint for
      the plan-vs-actual toggle."
    WHAT: after a routine/day runs, a per-step report - expected vs
      actual minutes per slot ("gym 45 planned · 52 actual · +7"),
      feeding the plan-vs-actual toggle's data source; the CLOSE of
      the plan-vs-actual loop (planned -> ran -> compared).
    DECISIONS (verbatim - agreed): (a) BOTH - the per-step minute-
      delta report (the data) AND the per-slot summary (done/skipped/
      different - the glance); (b) lands in the DAY VIEW + the
      briefing's EVENING CLOSE (the wrap-up card pattern).
    CONSTRAINTS: neutral tone (never scores); done-differently
      semantics; no shame.
    LANDS: Roadmap M4; UIUX.md (day view + briefing evening close);
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-todoist.json (326) - today/task list patterns (L-05 context)
      CoachSystem.md (adherence semantics).
- L-08 NEUTRAL DEVIATION BADGES (LOCKED, user yes - both decision
  points my takes accepted):
    SOURCE: Structured (R02 section 2) - "moved 3x" badge; the
      swipe-to-resolve Replan pattern.
    WHAT: deviations (rescheduled/skipped/done-differently) render as
      NEUTRAL badges - plain factual counts with zero moral valence;
      the plan-vs-actual day view shows them on affected slots; the
      evening close lists them silently.
    DECISIONS (verbatim - agreed): (a) badges ALWAYS-ON in the day
      view (facts are facts); the evening close SUMMARIZES them -
      agreed; (b) moved-count PER-SLOT ("moved 3x" on that slot);
      day-total only in the close - agreed.
    CONSTRAINTS: never scored; no color-coded guilt; done-differently
      semantics.
    LANDS: UIUX.md (day view); CoachSystem.md; Roadmap M4.
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-gcal.json (866) - day-view line rendering context (L-08)
- L-13 WEEK-PATTERN ROUTINE SCHEDULING (LOCKED, user yes - both
  decision points my takes accepted):
    SOURCE: TimeTune (R02) + TickTick frequency-schedule lesson
      (R01 section 5).
    WHAT: routine patterns beyond daily - weekday/weekend variants,
      specific days (Mon/Wed/Fri), weekly cadence; "which days" as a
      first-class field; the day template's binding expands from one
      dayKey to a day-PATTERN; the briefing pre-loads today's
      applicable template; NL parser (L-01) feeds cadences.
    DECISIONS (verbatim - agreed): (a) M4 scope = weekday/weekend +
      specific days + weekly; MONTHLY patterns future - agreed;
      (b) pattern changes apply FUTURE-ONLY by default with the
      this/all-future/all scoping choices (the Structured recurrence-
      edit lesson - a template edited mid-week never corrupts the
      week) - agreed.
    LANDS: Roadmap M4; Database.md (routine pattern field - schema
      decision); UIUX.md (routine editor).
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-todoist.json (326) - recurrence/cadence input patterns (L-13 context)
- L-06 PLAN-VS-ACTUAL DAY-VIEW LINE (LOCKED, user yes - the signature
  feature; decision (c) accepted; (a)+(b) recorded with future-UI
  caveat):
    SOURCE: UNCLAIMED territory (R03 synthesis - no calendar ships
      it); blueprints: Routinery post-run report (R02), Sunsama
      planned-vs-actual counter (R02), Polarsteps plan/track duality
      (R03), Structured neutral badges (R02).
    WHAT: in the M6 day view, every planned slot renders its actual
      outcome as a neutral derived line:
        [planned: gym 17:00 · actual: done 17:15]
        [planned: meal 12:30  · actual: skipped]
        [planned: rest       · actual: cardio]
      Interleaved with the day's other derived lines (weigh-in, meals,
      journal, habits); derived from routine_slot_logs + the day's
      events; NEVER scored, NEVER judged. The locked plan-vs-actual
      toggle becomes the RENDERING of this data; the L-05 post-run
      report feeds it; L-08 badges tone it; the evening close
      summarizes it silently.
    DECISIONS (verbatim): (a) LINE PLACEMENT - my take recorded
      (interleaved in the day view's chronological feed, the
      signature; L-05 report + evening close as the summary surfaces;
      no separate screen); FUTURE UI DESIGN MAY CHANGE IT - noted,
      not locked. (b) STATUS COLOR SEMANTICS - my take recorded (done
      = neutral fill consistent with the activity tint; missed/skipped
      = neutral outline; done-differently = the L-08 badge; NO
      red-as-failure anywhere - red reserved for genuinely-expired
      goals per L-03's pending decision); FUTURE UI DESIGN MAY CHANGE
      IT - noted, not locked. (c) PERIOD-LEVEL DUALITY - INCLUDED
      (Polarsteps' plan/track model inside vacation/term periods:
      "planned schedule vs actual during the trip") - ACCEPTED.
    CONSTRAINTS: tint-only compliance; done-differently semantics;
      no shame; derived-only; offline.
    LANDS: Roadmap M6; UIUX.md (day view); CoachSystem.md (adherence
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-gcal.json (866) - agenda/day-view anatomy (L-06); mobbin-screens-cron.json (110) - calendar+docs day
      semantics); Database.md (routine_slot_logs reads).
- L-07 SHOW-IF-NOT-EMPTY BLOCKS (LOCKED, user yes - my takes accepted;
  subject to future UI/UX development changes - noted):
    SOURCE: TickTick smart lists (R04); cautionary proofs: Samsung
      Health hollow cards, Fitbit quarter-screen AI paragraphs.
    WHAT: dashboard blocks render ONLY when they have data (or a
      pending signal); otherwise they COLLAPSE entirely. A new user
      sees Today + capture + habits + storage - no empty strength/
      goals/weekly cards. The locked one-line what-appears-here
      explanation survives only for soon-to-fill blocks (or inside
      the collapsed state's disclosure).
    DECISIONS (verbatim - agreed): (a) FULL collapse (no compact
      placeholders); the placeholder line survives only in a
      "what's coming" disclosure if the user asks - agreed.
      (b) the heatmap strip ALSO collapses at zero data (a zero-data
      heatmap is a moral-less blank; it appears with the first
      activity week) - agreed. FUTURE UI/UX DEVELOPMENT MAY CHANGE
      THIS - noted, not locked.
    LANDS: UIUX.md (dashboard); Roadmap M0+.
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-ticktick.json (97) - smart-list/show-if-not-empty reference (L-07)
- L-12 NUMBERS>CHARTS GLANCE / CHARTS>NUMBERS ANALYSIS (LOCKED, user
  yes - recorded; future UI/UX may change - noted):
    SOURCE: glance research (R04; Gouveia et al. 5-second mandate;
      Apple rings glance->detail consensus).
    WHAT: the block presentation rule - glance blocks lead with a
      SINGLE number (streak "14", storage "62%", protein
      "168/168g"); analysis surfaces (weekly review, strength
      snapshot, goal detail) get the charts; the macro-gap bar is
      the hybrid (live number + capacity context - locked).
    DECISIONS (verbatim): recorded with my takes - (a) dashboard
      top half (Today, habits, capture, storage) = number-led;
      bottom half (goals, strength, weekly) = chart-enabled with
      number-led headlines; (b) the heatmap strip is the EXCEPTION
      (a chart that IS a glance - tint volume at a glance, validated
      by the calendar research). FUTURE UI/UX MAY CHANGE THIS -
      noted, not locked.
    LANDS: UIUX.md (dashboard); DesignSystem.md.
- L-14 STRENGTH-VS-HEATMAP ORDER (LOCKED - decision (a) accepted;
  (b) HELD for the UI/UX ordering pass):
    SOURCE: Apple Trends-vs-Workouts debate (R04).
    WHAT: the one open position in the locked M2 block order:
      strength snapshot (analytical, heavier, shimmer) vs
      calendar/heatmap strip (glance-level volume). Evidence: the
      heatmap is a glance surface (volume language, 5-second
      readable - L-12's exception); the strength snapshot is
      analysis and belongs below the glance line.
    DECISIONS (verbatim): (a) CONFIRM the locked order (heatmap
      ABOVE strength snapshot) with this evidence - ACCEPTED.
      (b) the final resolution is HELD for the deferred UI/UX
      ordering pass - the evidence note above is what that pass
      inherits; not reopened blindly.
    LANDS: UIUX.md (dashboard blocking order) - carried to the
      UI/UX ordering pass.
- L-09 PER-BLOCK SKELETONS, RETURNING-USERS-ONLY (LOCKED, user yes -
  all UI details recorded; may change during future UI passes -
  noted):
    SOURCE: skeleton literature (R04) - "skeletons don't always
      win."
    WHAT (plain): the locked shimmer rule refined with three rules
      about WHEN the gray placeholder ghost shows:
      (1) NO ghost for brand-new users - a ghost outline of a block
        they've never seen means nothing; new users see the empty
        state (L-07) or nothing instead. The ghost only helps people
        who know what's about to appear.
      (2) NO ghost for fast blocks - Today, habit ticks, storage,
        capture read instantly from local data; flashing a loading
        shimmer for something ready instantly FEELS slower. No
        shimmer for locally-cached light blocks, ever.
      (3) GEOMETRY-MATCHED ghosts - the gray outline matches the
        block's final shape exactly (number on top, chart below), so
        real content slides in without jumping (the "geometry-
        matched" rule = same shape, no layout shift).
    DECISIONS (verbatim): all three rules ACCEPTED - the locked M2
      shimmer discipline is refined: per-block skeletons for
      RETURNING users only; never for locally-cached light blocks;
      shapes match final geometry. FUTURE UI PASSES MAY CHANGE THIS -
      noted, not locked.
    LANDS: UIUX.md (dashboard shimmer rule); Roadmap M0+.
    MOBBIN REFS (verbatim): research-lifeos/mobbin-screens-ticktick.json (97) + mobbin-screens-things.json (166) - block-loading patterns (L-09 context)

- L-10 RULE-BASED CROSS-DOMAIN INSIGHT ENGINE (LOCKED, user yes - all
  three decision points accepted; STRESS-TESTING REQUIRED - noted):
    SOURCE: Daylio/WHOOP pattern (R05) - the best cross-domain
      insight engine is entirely rule-based and privacy-safe.
    WHAT: the Coach computes cross-domain insights with pure logic -
      the mechanics, all rule-based:
      (1) WITH/WITHOUT COMPARISONS: split days into "with X" vs
        "without X", compare a second metric ("on days you train,
        journal word count averages 140 vs 90 on rest days").
      (2) NEXT-DAY LAG: today's habit affects tomorrow's outcome
        (sleep -> next-day gym performance); comparisons include a
        lag window.
      (3) CONFIDENCE TIERS: every insight carries a confidence label
        from sample size ("based on 14 training days vs 9 rest
        days") - never stated as truth without the n.
      (4) DATA THRESHOLDS: insights compute only with enough data -
        the 5+5/90-day rule (>=5 days in each group OR 90 days of
        history); a 2-day coincidence never becomes a pattern.
      (5) CORRELATION-NOT-CAUSATION wording, verbatim: the insight
        always says "correlates with", never "caused by".
    DECISIONS (verbatim - all accepted): (a) the insight line lives
      in the weekly Coach message (F-24, ONE line per week) + the
      Life Tree branch detail; NOWHERE else (no dashboard block, no
      notifications - one-notification discipline). (b) FIRST
      COMPARISON SET = the big five: training <-> journal
      presence/word count; training <-> mood-proxy; sleep-proxy <->
      next-day training; protein hit-rate <-> next-day gym
      performance; weigh-in trend <-> journal cadence - each with
      thresholds. (c) MOOD-PROXY ACCEPTED: since C-04 (mood
      tracking) was rejected, mood-family comparisons use DERIVED
      PROXIES (journal presence, word counts, entry length) - honest
      data, safe under the correlation wording.
    STRESS-TESTING REQUIREMENT (user directive, verbatim): the
      engine must be EXTENSIVELY STRESS-TESTED with SEEDED DATA -
      synthetic histories designed to produce known patterns,
      edge cases (tiny samples, lopsided groups, seasonal effects,
      missing data), and the full threshold/confidence matrix -
      before it ever ships a real insight; test fixtures become part
      of the engine's test suite (per the COACH HEURISTIC ENGINE
      testing discipline - engine-2).
    CONSTRAINTS: facts-only; thresholds-guarded; correlation wording;
      quiet week silences; no shame; derived-only; offline.
LANDS: CoachSystem.md (rule-book session); Architecture.md
      (owner + test fixtures); TEMP-PLANNING engine-2 (testing
      discipline tie).
    MOBBIN REFS (verbatim): research-fitness/mobbin-screens-macrofactor.json
      (402) — weekly check-in surfaces (L-10 presentation).

- L-11 SPRAWL GUARDRAIL (LOCKED, user yes - all my takes passed):
    SOURCE: R05 - the top abandonment cause across all sources is
      "too complex to maintain" (67%), not missing features;
      disciplined apps (Things 3, Apple Health) win by OMISSION.
    WHAT: a standing guardrail, not a feature - every proposed
      feature must pass "does it earn its place in the surface?"
      before it locks. THREE CHECKS (verbatim - accepted):
      (1) SURFACE-WORTHINESS: does it earn real estate on a screen
        (or collapse/disappear per show-if-not-empty)?
      (2) SCHEMA DISCIPLINE: does it extend the existing model
        additively, or demand a new unbounded entity?
      (3) SPRAWL TEST: if every future feature of this kind shipped,
        would the app survive? (One composite score is fine; a
        score SYSTEM is sprawl.)
    DECISIONS (verbatim - accepted): (a) recorded in the ledger's
      House rules + carried to DevelopmentWorkflow at the docs pass -
      accepted; (b) the three checks as the standard, verbatim -
      accepted.
    LANDS: House rules (TEMP-PLANNING); DevelopmentWorkflow.md;
      AGENTS.md.
- L-15 LIFE-SCALE GRID (LOCKED as a DESIGN FEED - user: feed only;
  tree-session placement decision):
    SOURCE: Life Calendar (R03 section 11) - the 90-weeks-per-year
      life grid (a human life as ~4,680 weekly cells); the
      contribution-graph family's volume-grid + farming lesson.
    WHAT: a research feed for the LIFE TREE DESIGN SYSTEM session,
      NOT a locked feature: the weeks-as-cells grid family as the
      tree's quantitative twin (the tree = organic metaphor,
      trunk/rings/branches; the grid = the whole life as cells,
      filled by weeks lived + weeks logged). Takeaways: (1) the
      spatial-meta layer could appear as a strip or a zoomed-out
      mode - TREE SESSION DECIDES; (2) the emotional register is
      the tree's own (awe without guilt - life-scale apps monetize
      the epiphany moment); (3) the anti-farm lesson (fake-commit
      painters prove volume-grids attract gaming - the tree's
      derived-only + anti-farm rules inherit this defense).
    DECISIONS (verbatim): (a) FEED ONLY - the tree session decides
      whether the grid appears (strip, zoom mode, or not at all) -
      ACCEPTED; (b) PLACEMENT in the tree section (tree-2 anatomy /
      tree-5 render reference notes) MUST BE DECIDED DURING THE
      LIFE TREE DESIGN SESSION - recorded, deferred.
    LANDS: LIFE TREE DESIGN SYSTEM section (tree session).

## Incorporate list (journaling C-series - all candidates decided except C-15, deferred to the Life Tree section)

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
| M3 Nutrition | `research-nutrition/MASTER-Nutrition-Research.md` PART 9 (logging flow, day summary, check-up, recipe/plan surfaces, trust surfaces) + per-report GUI sections (01 §7 per app, 02 §3.8, 03 §8) + mobbin: MFP/Noom/Yazio/Lifesum/Zero + MacroFactor (fitness set, 402 screens) |
| M4 Routine & Briefing | `research-lifeos/MASTER-LifeOS-Research.md` PART 8 (routine run, briefing card) + R02 report GUI (Routinery run, Structured replan) · R05 Ohai briefing · R04 Stoic ritual · R01 Day One Today tab |
| M5 Goals & Tasks | `research-lifeos/MASTER-LifeOS-Research.md` PART 8 (goal surface, today surface) + R01 report GUI (Things 3 today, Strides milestone chart) · mobbin: Todoist (326), Things 3 (166), TickTick (97) |
| M6 Calendar & Periods | `research-lifeos/MASTER-LifeOS-Research.md` PART 8 (month grid, year heatmap, day view, periods) + R03 report GUI (Fantastical year, Google agenda) · mobbin: Google Calendar (866), Cron (110) |
| M7 Analytics & Gamification | R04 Daylio stats/Year-in-Pixels · R04 1SE missed-day grid · R03 Ulysses progress ring · R04 Finch streak displays |
| M8 Coach | R05 AI journals (suggestion cards, briefing, opt-in controls) · R04 wellness (care-based streaks, no-nag returns) · R04 Stoic prompt surfaces · PART 9 §9.6 |
| M9 Life Tree | R04 Finch birdhouse (care-object home) · R04 Daylio mosaic · R04 1SE mashup · R04 Timehop then-&-now · R01 Day One Today tab · PART 9 §9.6-9.7 · L-15 Life Calendar grid (lifeos R03) |
| Settings & trust surfaces | R03 Standard Notes · R01 Daylio privacy onboarding · PART 9 §9.7 · mobbin: Finch (671 screens), stoic. (303), Evernote (352) |

Mobbin data: `research-journaling/mobbin-*.json` (Finch, stoic.,
Evernote, Apple Notes, Notion, 5 Minute Journal, Bloom, Otter AI) + `research-fitness/mobbin-*.json` (Hevy, Fitbod, MacroFactor, NRC, Strava, workout-family; helper `research-fitness/mobbin-query.mjs`) + `research-nutrition/mobbin-*.json` (MFP, Noom, Yazio, Lifesum, Zero; helper `research-nutrition/mobbin-query.mjs`) + `research-lifeos/mobbin-*.json` (Todoist, Things 3, TickTick, Google Calendar, Cron; helper `research-lifeos/mobbin-query.mjs`). No uncovered milestone GUI rows remain.

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

### Nutrition mobbin dataset map (pipeline-draftable design references)

VERBATIM-CRITICAL reference block: drafters copy the FILE PATHS and screen counts exactly (never inline JSON contents — datasets are large reference inventories, cited not embedded). Each dataset serves the listed M3 surfaces; the N-candidate LANDS lines carry the per-candidate mobbin refs.

| Dataset (file) | App | Screens | Serves (M3 surface / candidates) |
|---|---|---|---|
| `research-nutrition/mobbin-screens-mfp.json` | MyFitnessPal | 290 | Diary anatomy (meal-type tabs), search sheet, food detail, macro ring (N-01, N-11) |
| `research-nutrition/mobbin-screens-noom.json` | Noom | 529 | Check-in + lesson surfaces, density display patterns (N-12 — neutral restatement) |
| `research-nutrition/mobbin-screens-yazio.json` | Yazio | 276 | Meal-plan/recipe surfaces, fasting window patterns (N-15) |
| `research-nutrition/mobbin-screens-lifesum.json` | Lifesum | 345 | Habit-tied nutrition, weekly review surfaces (N-16) |
| `research-nutrition/mobbin-screens-zero.json` | Zero | 139 | Fasting window ring/timer patterns (N-15) |
| `research-fitness/mobbin-screens-macrofactor.json` | MacroFactor | 402 | The M3 logging/check-up gold standard (N-01/N-03/N-13 context) |
| `research-nutrition/mobbin-query.mjs` | — | — | Query helper for future mobbin pulls |

Pipeline note: all datasets are committed repo files (research-nutrition/, research-fitness/), readable by drafters at their paths; the GUI-table M3 row above plus this map are the two drafting entry points for nutrition mobbin content.

### LifeOS mobbin dataset map (pipeline-draftable design references)

VERBATIM-CRITICAL reference block: drafters copy the FILE PATHS and screen counts exactly (never inline JSON contents — datasets are large reference inventories, cited not embedded). Each dataset serves the listed M4/M5/M6 surfaces; the L-candidate LANDS lines carry the per-candidate mobbin refs.

| Dataset (file) | App | Screens | Serves (surface / candidates) |
|---|---|---|---|
| `research-lifeos/mobbin-screens-todoist.json` | Todoist | 326 | Task/today surface patterns, filters (L-01 context) |
| `research-lifeos/mobbin-screens-things.json` | Things 3 | 166 | Disciplined today, areas/projects, Logbook won-archive (L-02) |
| `research-lifeos/mobbin-screens-ticktick.json` | TickTick | 97 | Smart lists show-if-not-empty (L-07), all-in-one today assembly |
| `research-lifeos/mobbin-screens-gcal.json` | Google Calendar | 866 | Month grid, agenda day view, year dots (M6 / L-06) |
| `research-lifeos/mobbin-screens-cron.json` | Cron/Notion | 110 | Calendar+docs day, week-focused UI (M6) |
| `research-lifeos/mobbin-query.mjs` | — | — | Query helper for future mobbin pulls |

Pipeline note: all datasets are committed repo files (research-lifeos/), readable by drafters at their paths; the GUI-table M4/M5/M6 rows above plus this map are the two drafting entry points for LifeOS mobbin content.

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
