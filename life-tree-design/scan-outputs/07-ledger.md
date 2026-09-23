# Feature Scan Output 07 — TEMP-PLANNING Ledger (Generation-2 Feature Surface)

Source file: `TEMP-PLANNING.md` (2,693 lines, read in full). This brief is the
generation-2 feature surface that defines what INPUTS exist for the Life Tree
engine. Format per item: series/id, name, status, what it IS, the inputs it
produces, ledger line/section.

Status tokens (legend, lines 40-66): LOCKED = accepted (user yes) · SKIPPED =
parked with REVISIT line · REJECTED = dead with RESTING PLACE line · AGREED IN
PRINCIPLE = concept approved, activation deferred (F-27) · PENDING = deferred
to another section (C-15 → Life Tree) · NOTED = required-discipline flag
(engine-2) · SKELETON = design dim, filled at the Life Tree design session
(tree-1..tree-6) · NOTED (no lock, no rejection) = research leftovers.

---

## 1. LOCKED FEATURE DECISIONS — C-SERIES (journaling)

Section: "Incorporate list (journaling C-series — all candidates decided
except C-15, deferred to the Life Tree section)" (lines 1848-2092).

### C-03 AUTO-CONTEXT CAPTURE (LOCKED, user yes — shaping done) — line 1858
- WHAT: entries auto-gain context facts of their day from PersonalOS's OWN
  event log (no external services; location chip excepted). Chips (each
  individually toggleable in Settings, default OFF): media of the day
  ("2 photos · 1 vlog"), workouts logged ("2 workouts · 3 sets bench"),
  habit status ("4/5 habits · 14-day streak"), body/weigh-in (weigh-in
  value / physique photo taken), return-after-gap note ("first entry in 3
  days" — celebrates return, no shame), location (user-chosen, explicit
  per-entry approval), weather (WANTED by user; PENDING SUB-ITEM — ships
  only after a DecisionLog dependency decision; local calc fallback if
  offline). Capture FROZEN at save but TOMBSTONE-AWARE (chip references
  source events; deleted/revoked underlying events → chip recomputed
  honestly on view or marked "updated").
- INPUTS PRODUCED: journal entry ↔ event-log linkage (workouts, habits,
  weigh-ins, media, vlog, location, weather — all consumed by C-03's
  chips). Life Tree relevance: chips summarize the day's cross-domain
  activity; return-after-gap signal; C-03-style chips from area fields
  listed as an unlock of C-07.
- CONSTRAINTS: facts-only (never text content); isImported rows excluded;
  no XP; quiet week does NOT disable chips.

### C-05 MEMORY HYGIENE (LOCKED, user yes — hide controls only) — line 1893
- WHAT: safety controls for the J1 on-this-day strip: per-memory hide
  ("Never show this again"), hide-a-year (date range, e.g., 2020),
  hidden-ness applies EVERYWHERE memories surface (including exports /
  Year Book PDFs); data NEVER deleted (display-level flag, derived,
  reversible). REJECTED inside: reply-to-your-past-self (StoryPad pattern).
- INPUTS PRODUCED: memory-hide flag per entry / per date range — a derived
  filter over journal entries. Life Tree relevance: ring/memory surfaces
  must respect hidden-ness (hidden memories never resurface in tree
  surfaces either).
- CONSTRAINTS: facts-only; no XP.

### C-06 THEN & NOW SELFIE COMPARE (LOCKED, user yes) — line 1910
- WHAT: companion to the D031 physique-photo timeline: inside the physique
  timeline, "snap a new one" pairs the current photo against any selected
  historical one (side-by-side / slider); dated "compare" action per
  historical photo.
- INPUTS PRODUCED: physique photos (D031) + compare actions. Explicit
  Life Tree tie: "feeds the Life Tree 'then & now' layer later."

### C-08 WIKILINKS + UNLINKED-MENTION SUGGESTIONS (LOCKED, user yes — Settings
  toggle, ON by default) — line 1921
- WHAT: journal connection web: `[[` autocomplete of Life Areas + recent
  entries in composer; linked entries gain backlinks pane; tapping a link
  jumps to the entry. UNLINKED-MENTION SUGGESTIONS: derived pass over the
  shared J2 matcher — "you mentioned 'X' in N entries — link them?" —
  suggestion card, one-tap apply, NEVER automatic. NO graph visualization;
  links export as `[[name]]` in Year Book (lossless); matching on
  names/areas/tags only (no text analysis).
- INPUTS PRODUCED: entry↔entry + entry↔Life-Area link graph (junction
  table — schema decision); mentions. PRIVACY-STAMP FLAG: mention
  suggestions read entry text → per-feature privacy stamp applies; gated
  until the M2+ text opt-in exists OR matching restricted to tags/areas/
  dates at activation (PENDING SUB-ITEM, same convention as C-03 weather).
  Wikilinks themselves unaffected (user-initiated, no scanning).
- Life Tree relevance: the link graph is a journal-domain structure the
  tree could surface (branch detail / leaf detail).

### C-09 GENTLE RETURN + PAUSE (LOCKED, user yes — repair tokens REJECTED) —
  line 1955
- WHAT: GENTLE RETURN — after any gap, NO "you missed N days" messaging;
  warm return card ("welcome back") with optional fresh-start offer;
  applies everywhere streaks/misses are discussed (dashboard, habits,
  Coach lines). PAUSE MODE — user freezes streaks for a known-away period
  (Settings, habits/coach group, MOSTLY OFF BY DEFAULT; distinct from
  quiet week and from grace; pause FREEZES streaks without forgiving
  anything). Repair tokens REJECTED (keep grace simple).
- INPUTS PRODUCED: pause records (finite durations 1-14 days, a scheduled
  absence that freezes streaks, never hides). Life Tree relevance: pause/
  gap/return events shape streak-derived visuals (buds, streaks) and
  return-after-gap notes (C-03).
- GUARD: "Grace is the ONLY finite streak shield" — pause MUST be bounded.

### C-11 VOICE-NOTE ENTRY TYPE (LOCKED, user yes — audio now, transcription
  future-only) — line 1978
- WHAT: third journal entry type beside text and vlog: record
  (hold/release), audio preserved ON-DEVICE as a media item (same media
  path as vlog, MediaRepository), inline playback in the entry; entry
  stores audio + small metadata (duration, date). Transcription +
  time-sync = FUTURE-ONLY (needs an STT engine decision); raw audio always
  kept; on-device only; no XP; media storage rules apply.
- INPUTS PRODUCED: voice-note media items (M4A/MP4 container rule needed
  for adopted files — audit finding; same tier logic as vlog, buffer
  exempt recommended). A journal entry type the tree's leaf mapping must
  account for (audio entries).
- AUDIO-DURATION NOTE: MediaStorage.md:190-191 is vlog-only; voice-note
  path needs an audio container rule at build.

---

## 2. LOCKED FEATURE DECISIONS — F-SERIES (fitness)

Section: "Incorporate list — FITNESS SERIES (F-candidates)" (lines 84-1015).
Group A "logging UX (decided batch)" + "Group A — logging UX (all decided)".

### F-01 INLINE PREVIOUS-SESSION COMPARISON (LOCKED) — line 129
- WHAT: during M2 logging, every exercise card shows last session's
  weight×reps ("Last: 100kg × 5"); a new PR vs last time flags
  live/color-coded during entry. ALWAYS show with STALENESS LABELING
  ("2 weeks ago"); CUSTOMIZABLE via Settings toggle; derived-only, zero
  schema. PR flag uses locked strict-greater + once-per-session rule.
- INPUTS PRODUCED: none new (derived from session history) — displays
  session history. Overlap with locked L021 last-time hint (F-01 adds the
  live PR-vs-last-time flag + Settings toggle).

### F-02 LOGGING-SCREEN ANATOMY (LOCKED — comparison talk done) — line 183
- WHAT: the physical interaction layer of the M2 session logger: exercise
  card (name + drag-handle; set table set# | kg | reps | circular
  checkbox; "+ Add Set"; swipe-to-delete; swap exercise mid-session);
  SET ROWS = steppers with TAP-TO-TYPE ESCAPE (steppers pre-filled from
  last-time hint; long-press rapid scroll; tapping the number opens the
  keypad — default path = 2 interactions per set); REST TIMER IN
  (auto-starts on set check-off; 15s micro-adjust; per-exercise defaults;
  SILENT + haptic by default; easily dismissed; IN-APP ONLY, no push —
  D018 untouched); set label chips (W/D/F) in the row header auto-
  suggested, override one tap; Finish top-right (partial workouts OK);
  warm-up rows folded by default; plate/warm-up calculator reachable
  mid-session. Everything compounds — no locked logic changed.
- INPUTS PRODUCED: none new (interaction layer over L019/L021 flows).

### F-03 PR CELEBRATION CEREMONY (LOCKED — functional rules; DESIGN LANGUAGE
  DEFERRED to the Life Tree design session) — line 234
- WHAT: the moments around a PR — in-session recognition + post-session
  summary. Celebration moments = first-ever PR per exercise (any new
  all-time best); milestone PRs DEFER to locked trophy rules (1.5×/2× BW,
  100th workout, tonnage); return-after-gap PR gets a distinct softer
  mark; NO celebration for: matching records, warm-up sets (F-05 W),
  imported data (isImported). Anti-noise: one celebration at a time;
  stacked PRs queue and COLLAPSE into the post-session summary card
  ("3 records set today — details in the vault"). Summary card lives on
  the session-finish screen + the records vault.
- INPUTS PRODUCED: PR events (exercise, value, date, first-ever vs
  milestone vs return-after-gap). DIRECT Life Tree tie: the celebration
  VISUAL/ANIMATION LANGUAGE IS HELD until the Life Tree design session —
  "the Life Tree gives the fundamental understanding of what the app is
  trying to be; one shared ceremony language" (candidate concept noted:
  paper/ink stamp + vault-cell glow, quiet-archival; NOT confetti).
- CONSTRAINTS: facts-only copy ("PR: 100×5, previous 97.5"); no XP
  (celebration is its own reward); no shame language.

### F-04 PLATE + WARM-UP CALCULATORS (LOCKED — math must be solid) — line 141
- WHAT: plate calculator (total → plates, both directions) + warm-up
  generator (working weight → ramp sets); the generator doubles as the
  locked N2 return-ramp producer. Math must be ABSOLUTELY SOLID (bar 20kg
  standard, kg stored everywhere per O8 unit policy); FLEXIBLE (custom
  bar weight, kg/lb, microloading plates, per-exercise defaults); no
  rounding drift; shown math verifiable by hand. Offline; no deps.
- INPUTS PRODUCED: none (pure calculators).

### F-05 SET LABELS WARM-UP/WORKING/FAILURE (LOCKED — full design) — line 264
- WHAT: every set row carries a label chip — W (warm-up), D (working),
  F (failure); manual override always, one tap. F tracks TARGET
  COMPLETION not effort (a set short of target reps = F, objective and
  template-relative). AUTO-SUGGEST (never silent-auto): reps < template
  target → app suggests "mark as failure?" one-tap confirm/dismiss;
  global setting auto-suggest F ON/OFF. SCHEMA: ONE nullable enum column
  `setType` (warmup|working|failure), explicit values written at save
  (default 'working'); queries never guess.
- ENGINE CONSEQUENCES (the rules F sets obey): F counts as volume (real
  effort); tonnage = real weight × real reps achieved (4/5 @ 100 = 400kg);
  est-1RM: F still contributes best-set estimates; PR detection: an F set
  can still fire a PR; PROGRESSION: F = HOLD the weight next time, never
  punish, never auto-deload. COACH COPY RULE: F is data, never judgment
  ("3 sets held at target," never "3 failures"). ADHERENCE EXCLUSION
  (restored): W-set-only sessions NEVER count toward plan adherence and
  NEVER satisfy qualifyingEntry(GYM) ("≥1 real WORKING set");
  warm-up-only = logged session, not trained session.
- INPUTS PRODUCED (CRITICAL for the tree): per-set completion labels —
  the weekly D/F pattern is the performance signal for F-08's decision
  table, F-12's cascade trigger, F-10's TM feed, and the coach heuristic
  engine's primary honesty input.
- D-VS-F RATIONALE: W = not training (excluded from volume/tonnage/PR/
  est-1RM); D and F = real training (counted identically everywhere);
  the ONE difference is prescription completion (D = bump logic applies,
  F = hold logic applies).

### F-06 PR GRID 1RM/2RM/3RM…nRM (LOCKED) — line 157
- WHAT: the records vault renders as a multi-rep PR grid per exercise —
  best lift per rep count, each with its date ("wall of records").
  Derived-only; all-time dates from session history.
- INPUTS PRODUCED: PR grid data (per exercise, per rep count, best lift +
  date) — a records vault surface.

### F-07 FILTERABLE CALENDAR HIGHLIGHTS (LOCKED) — line 167
- WHAT: calendar queries ("bench >80kg × ≥5") — "when did I last hit
  this?"; derived-only; shares the M6 calendar surface and the J2 search
  matcher. TINT-ONLY RECONCILIATION: the locked M6 grid is tint-only (no
  glyphs/emojis/numbers); F-07 query-highlights render as tint/banding
  variations on day cells, details in the day view.
- INPUTS PRODUCED: none new (query rendering over session history).

### F-08 MEV/MAV/MRV VOLUME BANDS + DECISION TABLE (LOCKED — canonical numbers
  recorded) — line 447
- WHAT: per-muscle weekly volume bands + the weekly adjustment decision
  table, rendering the locked MRV-style floors as a self-correcting
  system. BANDS (working sets per muscle per week; prime-mover +
  isolation only; per experience tier): MV (Maintenance) ~6 sets/wk at
  2× weekly frequency; MEV (Minimum Effective) beginners ≈ MV, widens
  with experience; MAV (Maximum Adaptive): chest/back 12-20, quads
  10-18, shoulders 8-16, hamstrings 8-14, biceps 8-14, triceps 6-12,
  calves 8-16; MRV (Maximum Recoverable): chest 22-26, back 22-25,
  shoulders 18-22, quads 20-24, hamstrings 16-20, biceps 16-20, triceps
  14-18, calves 18-22. MESOCYCLE SHAPE: start near MEV, add 1-2 sets per
  muscle per week toward MAV/MRV, then DELOAD to MEV or below, repeat
  (feeds locked deload markers + phases; cut phases run lower).
- ADJUSTMENT DECISION TABLE (weekly engine rule): performance improved
  (1s) + low soreness → +2-3 sets next week · mixed (1-2s) → +1 set · no
  change + moderate soreness → maintain · performance crash (4) →
  recovery session or DELOAD. Performance = the weekly D/F pattern from
  F-05 labels. Coach REPORTS + SUGGESTS, never auto-changes the plan.
- INPUTS PRODUCED: volume bands (derived); the D/F pattern as the
  performance signal (F-05). SCHEMA-AMENDMENT FLAG: CoachSystem.md:277
  ("volume balance = Settings keys only; zero core schema change")
  becomes FALSE via F-05's setType column.

### F-09 EXPECTED-VS-ACTUAL EFFORT TABLE (LOCKED — silent by default) — line 375
- WHAT: Prilepin-style lookup (load% × reps → expected effort); actual
  noticeably harder than expected (≥2 off) → e1RM adjusts down; easier →
  up. Quiet autoregulation — no extra logging; weight×reps is enough;
  engine numbers stay honest without self-rated RPE. SILENT by default
  (engine-internal); OPTIONALLY VISIBLE as a derived detail ("this set
  inferred ~RPE 8") — never a logging burden. Pure lookup + delta rule;
  feeds the locked Epley e1RM owner (confirm/correct, never replace).
- INPUTS PRODUCED: inferred effort per set (e1RM adjustment signal) —
  a derived, engine-internal input.

### F-10 TM ADJUSTMENT RULES ON EPLEY (LOCKED — canonical numbers recorded) —
  line 492
- WHAT: TM movement rules on top of the locked Epley estimator. THE
  MODEL: e1RM = the MEASUREMENT; TM (Training Max) = the DECISION number
  programs/progression are written around; TM anchored at 85-90% of
  e1RM. RTF MODE (hypertrophy — DEFAULT): beat target reps → TM +0.5%
  per rep beaten; miss target reps → TM −1% per rep missed. RIR MODE
  (strength blocks — only if optional post-session RIR logging is ever
  added): 6+ RIR → TM +2%; fewer than 4 RIR → TM −5%; 4-6 RIR → hold.
  OVERWARM SINGLE: scheduled hard single = TM recalibration event. FEED:
  F sets (F-05) feed the miss logic; Coach line each week cites the rule
  ("3 reps beaten → TM 100 → 101"); next week's suggested weights derive
  from the new TM. TM derived-only; history never rewritten.
- INPUTS PRODUCED: TM (decision number for programs/progression) —
  derived from e1RM + F-05 labels + rep-beaten/missed counts.

### F-11 INACTIVITY DECAY + PR RESET-TO-BASELINE (LOCKED — correlated with
  off-week/vacation/deload systems; sensitive numbers warn) — line 391
- WHAT: time off lowers suggested starting loads (days-since e1RM
  multiplier); post-deload PR reset to a reachable baseline with history
  preserved. Completes the locked N2 return ramp (decay = where the ramp
  STARTS; reset = what today's target IS). DECAY CORRELATES WITH the
  already-built absence systems — deload_markers, periods (vacation/term/
  holiday), planned-rest, quiet week (J4) — a marked/planned absence
  decays differently (or not at all) vs true unplanned absence; decay
  steepness = settings knob (research defaults ~10-20% per week off);
  Coach explains the decay ("2 weeks off → starting at 90%, ramping to
  full by session 3"); SENSITIVE NUMBERS WARN: large drops (3+ weeks off)
  show a warning + explanation before any suggested load. History/vault/
  PRs NEVER change — only suggested starting loads; no punishment framing.
- INPUTS PRODUCED: absence classification (planned vs unplanned — reads
  deload_markers/periods/planned-rest/quiet-week structures) + decayed
  suggested loads. Life Tree relevance: absence/period structures are
  already-read inputs.
- CONSTANT RECONCILIATION: freshness tier (>4wk collapse) governs the
  HINT DISPLAY; ~90% figure = PO-suggestion BASELINE; F-11 decay governs
  the SUGGESTED STARTING LOAD — three surfaces, no conflict.

### F-12 GZCLP STAGE-CASCADE STALL RULE (LOCKED — both decision points agreed)
  — line 425
- WHAT: on failure, denser scheme at the SAME weight (5x3→6x2→10x1),
  deload/reset only after the last stage; reactive-deload complement
  (2-3 week stall → deload). Keeps the lifter working at the challenging
  weight instead of dropping it too fast. Triggered by F sets (F-05) —
  the label is the cascade's input. Cascade DEFAULT for weight-mode
  exercises with per-exercise override; Coach ANNOUNCES the cascade
  ("5×5 failed → next session 6×2 at the same weight") — the most
  valuable Coach line in the system. F = hold/cascade, never punish;
  deloads only from stall rules (locked).
- INPUTS PRODUCED: cascade state (per exercise: current stage) — derived
  from F-05 labels + history.
- DEFAULT-STYLE RECONCILIATION: weight-mode default = linear progression
  with GZCLP stage-cascade on failure (F-12).

### F-13 LIBRA EMA TREND + TREND/RATE/PREDICTION LAYERS (LOCKED — questions
  answered; long-horizon gap recorded) — line 518
- WHAT: replaces the naive 7-day window in the locked weight-trend owner
  with a gap-tolerant time-indexed EMA. THE MATH: power = 1 − e^(−Δt /
  smoothingTime) [smoothingTime = 7 days default, tunable 5-14];
  trend_new = trend_old + power × (weight − trend_old). NO fabrication,
  NO interpolation (MacroFactor interpolates = fake data). RATE = slope
  of the trend over the last N trend points (default 30-day window) —
  the kg/week number the locked pace logic reads (bulk +0.25-0.5 / cut
  −0.5 vs phase target). PREDICTION = trend + rate × days-to-go — as a
  RANGE with honest uncertainty. LAYERS ARE SEPARATE DERIVED NUMBERS
  (trend ≠ rate ≠ prediction). CHART SHOWS RAW POINTS + EMA LINE — always
  both (the Withings revolt lesson).
- INPUTS PRODUCED (CRITICAL): weigh-ins + time-indexed EMA trend + rate
  + prediction layers. LONG-HORIZON NOTE: there is NO defined
  multi-month/year weight-trend view; the long view = full-history EMA +
  per-month markers + a yearly weight page in the Year Book (J5) + "the
  Life Tree body-domain presence" — an explicit tree tie.
- DOC-AMENDMENT FLAGS: (1) Architecture.md:189/268-270 "rollingWindowMean
  = the ONLY rolling-average math" becomes FALSE (F-13's EMA joins); (2)
  the pace-owner input changes beyond "body only" — RATE feeds phase
  pace, goal pace, ratios, trophies, weight-goal pace; (3) Roadmap.md:361
  repeated claim amended.

### F-14 RATE-VS-TARGET BAR + WATER-JUMP DOTS (LOCKED) — line 580
- WHAT: makes the locked pace + stall rules VISIBLE. RATE-VS-TARGET BAR:
  weekly bar of actual rate (F-13 rate layer) vs the phase target band
  (green zone) — on-track / drifting; DISPLAYED ON BOTH the weight screen
  AND the weekly Coach line. WATER-JUMP DOTS: every weigh-in is a dot on
  the trend chart; floats (single spikes above the band) read as water,
  not fat; sinkers (dots drifting below the trend) prove a "plateau" is
  not a stall. 30-day green/red banding. Floats/sinkers + banding ON by
  default.
- INPUTS PRODUCED: none new (rendering of F-13 rate layer).

### F-15 MILESTONE HERO RING + FORECAST RANGE + 2-WEEK COPY (LOCKED) — line 600
- WHAT: the locked weight ladder (70/75/80/85/90/95/100 with
  2-consecutive-week confirmation) gains anticipation + celebration: hero
  ring (current rung, % to next), FORECAST AS A DATE RANGE (honest
  uncertainty, e.g., "80kg around Nov 10-18"), boundary photos (D031
  protocol anchored at rung start/end), celebration copy stating the
  differentiator: "80kg — confirmed by 2 consecutive weeks." (a)
  celebration visual language DEFERRED to the Life Tree ceremony session
  (same as F-03); (b) forecast = RANGE, never a single date.
- INPUTS PRODUCED: ladder progress + forecast range + boundary photos —
  direct Life Tree tie (ceremony language deferred to the tree session).

### F-16 EYES-CLOSED + ONE-TAP WEIGH-IN (LOCKED) — line 621
- WHAT: the daily weigh-in ritual becomes 3 seconds and emotionally safe.
  ONE-TAP: big "+" on the weight screen, type, tally-reveal, saved;
  canonical first-of-day prompt at the right moment. EYES-CLOSED:
  toggleable mode where the number is recorded WITHOUT being displayed —
  the user interacts with the trend, never the digits. OFF BY DEFAULT;
  well-visible toggle in Settings; raw numbers hidden ONLY during
  Eyes-Closed mode (trend-first display is NOT the default philosophy).
- INPUTS PRODUCED: weigh-in rows (unchanged input, new ritual surfaces).

### F-17 STANDARDS VAULT HONESTY — POPULATION LABELS + BW MULTIPLES + SOURCE
  STAMPS (LOCKED — both decision points agreed) — line 639
- WHAT: the presentation layer around the FROZEN standards tables (tables
  unchanged): (1) POPULATION LABELS — every standards display carries its
  source label ("Modeled gym-style standards, 2026, ratio-derived") —
  NEVER competition-grade truth (never blend populations); (2)
  BODYWEIGHT-MULTIPLES as the display unit — every result shows "1.23×
  bodyweight" computed from CURRENT bodyweight (the locked 7-day rolling
  avg — O3; F-13's EMA replaces the TREND owner, not the windowed
  current-BW read — ratios DECLINE as bodyweight rises); (3) SOURCE
  STAMPS + RANK INTERPOLATION — each table carries provenance footnote;
  "where do I rank?" answered via interpolation between frozen table
  bands, LABELED as modeled (OpenPowerlifting public CSVs remain the
  FUTURE empirical upgrade). (b) tier label's time/technique meaning shows
  inline on first view (Beginner = technique ≥1 month · Novice = ≥6
  months · Intermediate = ≥2 years · Advanced = 5+ years).
- INPUTS PRODUCED: per-lift strength ratios vs bodyweight (current-BW
  multiple), rank percentile (modeled) — vault/standards surfaces.

### F-18 STRENGTH SCORE — IPF DOTS OVER THE BIG-5 (LOCKED — both readouts:
  per-lift + one meta score; vault-only display) — line 677
- WHAT: upgrades the locked strength profile to the validated IPF DOTS
  normalization over the big-5 (Bench, Squat, Deadlift, OHP, Barbell Row
  — exactly the locked profile lifts). THE FORMULA: DOTS = total × 100 /
  (a + b·BW + c·BW² + d·BW³ + e·BW⁴ + f·BW⁵) — sex-specific public
  polynomial coefficients on a 500-point scale, embedded FROM THE
  OFFICIAL SOURCE at build. DECISIONS ("do both"): (1) PER-LIFT
  NORMALIZED READOUTS (each big-5 lift's est-1RM normalized by the same
  coefficient family, rendered separately), AND (2) ONE SUMMARIZED META
  SCORE (the Strength Score; default rollup = sum of normalized big-5 —
  exact rollup open-at-build); (b) VAULT-ONLY display (dashboard keeps
  its locked per-lift strength snapshot; meta score lives in the vault).
  The score is a SUMMARY, never a substitute; derived-only, no XP, no
  shame.
- INPUTS PRODUCED (CRITICAL for the tree): normalized per-lift scores +
  one meta Strength Score — a strong candidate for a gym-domain /
  branch-girth derived metric.
- F-30 NOTE: the meta-score role is now CLAIMED by F-18's DOTS; F-30's
  NSPI-style composite would be redundant AS A SCORE.

### F-19 TRAINING FORM — CTL/ATL/TSB (LOCKED — N5 revival, honest,
  hardware-free) — line 717
- WHAT: readiness computed from logged sessions alone — the chronic-minus-
  acute load model. THE MATH: session load = per-session number from
  logged volume × intensity (working sets × weight × reps,
  effort-weighted); ATL (acute) = 7-day exponentially-weighted average of
  session loads; CTL (chronic) = 28-42-day exponentially-weighted average
  (default 42); FORM (TSB) = CTL − ATL. Same time-decay family as the
  F-13 EMA. Form positive = building/fresh · trending down = fatigue
  accumulating · deep negative = deload/rest territory. Windows standard
  defaults (7/42), tunable in advanced settings. DISPLAY: bands primary
  (ZONE: "Fresh / Building / Fatigued / Recovering") + number secondary
  (tap-away derived detail) + trend arrow always (direction matters more
  than level). HONESTY LABEL (mandatory): "Training Form (from your
  logged training)" — sleep/life stress NOT measured. Optional
  self-reports (sleep, morning recovery 1-5, soreness) fold in later if
  ever added; degrade gracefully to training-only when absent. Zero new
  logging; derived-only; no wearable; one notification/day; quiet week
  wins; facts-only.
- INPUTS PRODUCED (CRITICAL for the tree): readiness/form state (zone +
  trend) derived from session loads — the fatigue/freshness signal the
  tree's "conditions/health" language can read.
- LOAD-UNIT NOTE: session-load unit ("working sets × weight × reps,
  effort-weighted") and F-20's "~8 units/week" guardrail have no defined
  unit — unit DEFINED AT THE RULE-BOOK SESSION before the engine is
  built.
- N5-DEFERRAL AMENDMENTS: Roadmap idea-park N5 + CoachSystem.md:352-357
  both read "CLOSED by F-19". FUT-2 constraint: F-19's scope is the
  TRAINING-LOAD Form only; sleep/rest-day/readiness hardware-style
  tracking stays OUT (separate FUT-2 item).

### F-20 RAMP-RATE GUARDRAILS + RECOVERY-TIME ESTIMATE (LOCKED — both
  decision points my takes) — line 762
- WHAT: (1) RAMP GUARDRAIL — don't increase chronic load more than ~8
  units/week; Coach alerts on week-over-week chronic-load deltas ("Volume
  up 15% — past the ramp limit; that's how overreaching starts") — the
  volume-spike detector, rule cited; ~8 units/week = validated default,
  tunable in advanced settings. (2) RECOVERY-TIME ESTIMATE — from
  last-session magnitude vs chronic baseline, a Garmin-style "~48h
  recovery" estimate; labeled estimate, knows nothing about sleep
  (honesty label); pairs with the locked rest-day logic (F2) + "rest day
  is not a loss of fitness" doctrine. Coach LINE only (one channel;
  quiet week wins; no session-start hints). Alerts, not screens;
  facts-only; no shame.
- INPUTS PRODUCED: recovery-time estimate (derived) + ramp alarms.

### F-23 PRE-SESSION ADAPT AFFORDANCE (LOCKED — my takes accepted) — line 780
- WHAT: one "Adapt" button always on the session screen; taps →
  situation-aware variants: TIRED (session-level load multiplier, ~85%
  of planned — keeps volume, drops intensity) · SHORT ON TIME (condensed
  variant — fewer sets or superset pairing, pairWith already locked) ·
  NO EQUIPMENT (movement-pattern replacement — later, with F-32 —
  NOTE: F-32 REJECTED, so no-equipment variant is affected) · adapted
  sessions log honestly with an "adapted" marker. M2 ships TIRED +
  SHORT-ON-TIME. Adapted session auto-marks "done differently" in
  adherence (maps to locked plan-adherence semantics) — never a miss,
  never scolded.
- INPUTS PRODUCED: "adapted" marker per session → feeds adherence
  semantics (done-differently, never skipped) — relevant to any
  adherence-derived tree input (F-27's open question).

### F-24 WEEKLY COACH MESSAGE DEPTH (LOCKED — 3-5 lines) — line 814
- WHAT: DEPTH UPGRADE of the existing weekly Coach line into a short
  template-driven message, 3-5 LINES: review (the week's numbers:
  sessions, volume vs bands, PRs, sets held, form) → adjust (the
  engine's decisions, rule-cited) → next-week goal (one concrete
  target). Same derived facts, same surface (check_in_weekly + merged
  one-Sunday surface A4/H2), same day; template + interpolation (the
  Reflection Generator's flagship output); no LLM. The reply-to-weekly
  idea (free-text note feeding next week) NOT taken — possible future
  add. Facts-only; show-your-work; one notification/day; quiet week
  wins; no shame.
- INPUTS PRODUCED: none new (renders derived facts).
- ONE-LINE-AMENDMENTS: docs say "one Coach line per strictness" in FOUR
  places (check_in_weekly :171, nutrition_checkup :177, phase_close
  :185, milestone-review :236) — all amend to the 3-5-line message.

### F-28 SETS-PER-MUSCLE-WEEK CHART + VOLUME HEATMAP (LOCKED) — line 933
- WHAT: (1) SETS-PER-MUSCLE-WEEK BARS — one bar per muscle group of
  working sets this week, with the F-08 band overlaid (MEV floor line,
  MRV ceiling line, MAV sweet-spot shading); "week so far" fills live as
  sessions log. (2) VOLUME HEATMAP — the spatial muscle-grid density
  version (nice-to-have complement). Bars primary; live "week so far"
  view in the fitness area + verdict in the weekly check-in; heatmap
  optional complement. The MISSING VISUALIZATION LAYER over existing
  data (no muscle-volume visualization anywhere in the app). Pure
  derived rendering of F-08 data (working sets only, F-05 labels); zero
  new storage; advisory (never XP/penalty); deload/period-quiet exempt.
- INPUTS PRODUCED: none new (visualization of F-08/F-05 data).
- DISPLAY RECONCILIATION with F-30: F-28's chart is the data
  VISUALIZATION (fitness area); F-30 governs the Coach's weekly READOUT
  TEXT — two surfaces, one data source, both locks stand.

### F-29 MOVEMENT-BALANCE RATIOS (LOCKED — my takes on both decision points)
  — line 973
- WHAT: movement-pattern balance ratios computed from the LOCKED
  muscle-tagged session history: PUSH:PULL and SQUAT:HINGE — two ratios,
  same derived math; advisory only, never XP/penalty; Coach line when a
  ratio drifts out of range ("Push volume is 2.2× pull this month — pulls
  protect the shoulder; add a pulling day"). Alert threshold = fixed
  default (e.g., >1.7:1) + settings-tunable. Derived-only (muscle tags,
  primary/secondary roles); no new logging; no shame.
- INPUTS PRODUCED: push:pull + squat:hinge ratios (derived) — balance
  readouts for the coach + potential tree balance signal.

### F-30 NSPI-STYLE COMPOSITE — FOLDED (LOCKED): DOTS is the ONLY meta score;
  readouts live ONLY in the weekly message — line 989
- WHAT: the three separate progress readouts (load/stimulus/balance) as
  Coach report content — explicitly NOT a score: LOAD (est-1RM trend
  across big-5) · STIMULUS (working-set volume vs F-08 bands) · BALANCE
  (F-29 ratios + muscle imbalance) — live ONLY inside the weekly message
  (F-24); NO fitness-area display, no dashboard surface (F-28 carve-out).
  WHY: three transparent readouts > one opaque index.
- INPUTS PRODUCED: none new (renders F-18/F-08/F-29 derived data).

### engine-1 LOGGING FRICTION DISCIPLINE (LOCKED — applies to ALL M2 logging
  work) — line 321
- WHAT: the session is the cost, the data is the payoff — logger default
  path ≤2 interactions per set; everything pre-fillable is pre-filled.
  RULES: (1) weights pre-filled from last session (F-01); steppers not
  keypads. (2) reps pre-filled from template targets; only deviation is
  typed. (3) set labels auto-suggested (F-05) — confirm, don't choose.
  (4) checkbox rows + auto rest timer (F-02). (5) batch operations:
  "add 2.5kg to all sets," copy-set, Log-All, auto-assort paste. (6)
  FRICTION BUDGET: every new live-logging field must remove more friction
  than it adds; anything optional goes to the post-session review (2
  taps), never mid-session (e.g., RPE belongs post-session). (7) MINIMAL
  MODE: pure-checkmark, zero-typing view for low-attention days — depth
  is optional (same principle as journaling's progressive deepening).
- INPUTS PRODUCED: no direct inputs; governs the shape of all M2 logging
  inputs (keeps the logger lean).

### engine-2 COACH HEURISTIC ENGINE — REQUIRED DISCIPLINE (NOTED — needed;
  details locked later at the Coach rule-book session) — line 341
- THE NEED: the Coach's brain is the heuristic engine — ~25 named rules
  committed by M2 alone (gen-1 locks + F-08/F-09/F-10/F-11/F-12 +
  F-19…F-24). ONE rule-execution architecture (event → rule catalog,
  condition→action, strictness-parameterized) — never scattered ad-hoc
  conditionals; rules share ONE vocabulary via the H3 single-owner
  discipline so trophy/Coach/phase-report can never disagree; graceful
  degradation ("no data" over guessing, thin-week rule). TESTING
  DISCIPLINE: determinism + explainability as the test oracle; table-
  driven tests; per-rule boundary tests; fixture-based regression;
  provenance-as-authority (each rule cites its source: Epley, Prilepin,
  Israetel, SBS). LLM ROLE: the LLM is a VOICE LAYER, never the brain —
  render-never-decide; receives derived facts only; OFF by default;
  offline = complete product.
- INPUTS PRODUCED: none directly (the engine consuming all derived
  facts); its testing discipline (fixture-based regression) matters for
  the Life Tree engine's own test harness.

---

## 3. LOCKED FEATURE DECISIONS — N-SERIES (nutrition)

Section: "Incorporate list — NUTRITION SERIES" (the N-entries are interleaved
in the fitness section, lines 1017-1518).

### N-09 BARCODE SCANNER (LOCKED, user yes — gen-2 approval; D069 distinction
  recorded) — line 1017
- WHAT: EAN lookup via the native Chrome BarcodeDetector API (offline,
  ~94% of Chrome, dependency-free on Flutter web) + zxing-wasm fallback;
  lookup against a local OFF/FDC mirror (N-02); scan → match → verify →
  add. DISTINCTION (verbatim): the D069 do-not-build AI food scanner is
  the PHOTO-AI scanner (meal estimation — stays rejected, evidence-
  backed: 1/3-calorie error + cloud-bound); EAN barcode lookup is a
  DIFFERENT feature, never blocked, now approved. On-device only; no
  cloud; no AI estimation; no new package needed on web (verify at
  build); DecisionLog entry records the approval + D069 distinction.
- INPUTS PRODUCED: food log rows with source=scanner (the locked `source`
  column enumerates `scanner` — Roadmap.md:326 anticipated it).

### N-01 HISTORY/RECENT-FIRST LOGGING + PROVENANCE BADGES (LOCKED — all
  decision points accepted) — line 1033
- WHAT: (a) the diary opens on YOUR foods — recent/history/favorites
  ribbon (top-12 recent + pinned favorites), 2 taps to log (the <30
  s/meal, 2-3 tap retention bar); (b) persistent nutrition banner (plate
  totals, swipeable to day-remaining) = the macro-gap bar's home; (c)
  provenance badges on every food row + daily totals (verified/custom/
  source) — the locked `source` column made visible, always-visible tiny
  chips (trust is glanceable); (d) producer-switcher row (Manual / Food
  DB / Pack / Scale / Scanner) mirroring the locked source producers.
  No single-macro quick-add; facts-only.
- INPUTS PRODUCED: food log rows with source provenance; producer
  selection (Manual/Food DB/Pack/Scale/Scanner) — the producer taxonomy
  the tree's nutrition domain inputs inherit.

### N-03 ADHERENCE-NEUTRAL COMPLIANCE MATH (LOCKED) — line 1053
- WHAT: weekly check-up denominator rules — missed rows NEVER count as
  zero (unlogged days = typical intake or excluded); compliance = logged
  days' performance only; no streak displays for nutrition. Missing days
  EXCLUDED from the denominator when <5 logged days (thin-week rule);
  typical-average only when the week is otherwise complete.
- INPUTS PRODUCED: compliance metrics (adherence-neutral) — relevant to
  any nutrition-derived tree input (nutrition has NO streak display by
  design).

### N-11 GRAM-ANCHORED PORTION STEPPER UX (LOCKED) — line 1067
- WHAT: every food carries a gram reference; portion picker offers unit
  presets each carrying gram equivalents (1 cup = 125g, 100g, 1 serving
  as packaged); portionMultiplier scales from the gram anchor (1.5× of
  125g cup = 187.5g exact); text-based portion input (evidence: beats
  image-based); seed data brings FNDDS portion weights (N-02). Grams as
  canonical entry, presets as shortcuts.
- INPUTS PRODUCED: portion rows with gram anchors (gram reference field).

### N-18 VENDOR-RESILIENT EXPORT FOR FOODS/RECIPES (LOCKED) — line 1081
- WHAT: dedicated human-readable export for the nutrition namespace —
  foods + recipes (name, macros, servings, gram references) as
  readable/re-importable docs; rides the existing export machinery.
- INPUTS PRODUCED: none new (export surface).

### N-02 USDA FDC SEED + PRIVATE NAMESPACE — TIERED DATA ARCHITECTURE (LOCKED
  — all four decisions confirmed) — line 1088
- WHAT: we never BUILD a food database — the honest data exists free
  (USDA FDC = CC0, OpenFoodFacts = ODbL); the work is curation,
  licensing hygiene, and tiered distribution. THE TIERED ARCHITECTURE:
  TIER 1 BUNDLED CORE (FDC SR Legacy + Foundation + FNDDS generics +
  quality-flagged OFF top products, brotli-compressed at build; instant
  local search, airplane-mode complete; the SPEED tier; covers 80-90% of
  daily eating). TIER 2 GROWING LOCAL MIRROR (the accumulation rule,
  USER-CLARIFIED: EVERY food lookup — bundled hits AND online
  pass-through results — is cached into the local searchable mirror,
  ranked by frequency + recency; over months the mirror CONVERGES ON THE
  USER'S ACTUAL DIET; the personalization no cloud app can offer). TIER 3
  ONLINE PASS-THROUGH (when connected: full FDC + OFF API queries for the
  long-tail; barcode scans (N-09) hit the mirror first, then the online
  pool; EVERY tier-3 result is cached into tier 2). SEARCH PRECEDENCE:
  local mirror → bundled core → online pool. Provenance badges (N-01)
  label the result tier: bundled USDA / cached / online.
- THE ONLINE EXCEPTION (accepted — DecisionLog entry records it
  verbatim): food-database network exception — read-only, TERM-ONLY
  queries (food names / EANs) to public databases (USDA FDC,
  OpenFoodFacts) when connected. NO account, NO diary payloads, NO
  personal data, NO query logging, NO writes. The SOLE network exception
  in the nutrition domain; the security gate checks against this
  contract.
- NAMESPACE RULE (Cronometer's): a custom row can NEVER shadow a
  canonical row in search — canonical-first always; My Foods one tap
  away; provenance badges label every result tier.
- SEED SCOPE: ~15k bundled — FDC full generics (SR Legacy + Foundation +
  FNDDS) + quality-flagged top-5k OFF branded products (~10-15 MB
  brotli).
- MICRONUTRIENTS — SEPARATE MILESTONE M3b (CONFIRMED): micros get their
  own milestone (M3b, after M3 before M4 — needs the M3 diary
  foundation, self-contained after that); data already CC0 + complete in
  FDC (the same root Cronometer uses — the work is UI/UX + display
  science, NOT data); the milestone includes a LARGE GUI/UIX SECTION
  pulled from mobbin research (nutrient report cards, deficiency flags,
  %DV, adequacy coloring, per-nutrient trends).
- INPUTS PRODUCED (CRITICAL): food logs with tiered provenance (bundled
  USDA / cached / online) — the user's personal diet mirror; M3b
  micronutrient rows (84-nutrient profile, adequacy coloring,
  deficiency flags) as a future input stream.

### N-04 PLAN-CONFIRM LOGGING + GAP REBALANCE (LOCKED — both decision points
  my takes accepted) — line 1185
- WHAT: logging by CONFIRMING the plan: template-bound days show planned
  meals; logging = one-tap confirm (or log-all-planned); the locked
  batch catch-up becomes the confirm flow. GAP REBALANCE: a skipped/
  swapped meal's macro gap reshapes the REMAINING meals' suggested
  composition so the day lands near target — the macro-gap bar made
  proactive (report card → steering wheel). Rebalance = SUGGESTED
  adjustments, user confirms — NEVER auto-applied (the plan is the
  user's; same principle as the locked PO kill-switch and F-08's
  report-never-auto-change). Confirm is a MODE, not a template feature —
  applies to free-form days too.
- INPUTS PRODUCED: plan-confirmed meals; gap-rebalance suggestions —
  meal-slot adherence (planned vs confirmed).

### N-05 PACK MODEL — RECIPE → BATCH → CONTAINERS → CONSUME, WITH MIXED
  BATCHES FOLDED IN FROM DAY ONE (LOCKED — mixed batches included by
  user decision) — line 1202
- WHAT: prepped batches as first-class: recipe × N servings → BATCH →
  CONTAINERS → consume-decrement; the locked `pack` source producer gets
  its first-class flow; composes with N-04 (a packed meal IS a confirmed
  plan meal). MIXED BATCHES — NOT the simple count-per-batch model — the
  FULL containers model from day one: (1) CONTAINERS TABLE with
  per-container LINE ITEMS (a mini receipt per container): partial
  servings, mixed contents, multi-recipe meals (each part with its own
  portion multiplier); (2) CONSUME MATH per container's OWN line items
  (partial-consume semantics; per-part honest sources: packed / fooddb /
  recipe); (3) UI: a container LIST (an editor, not a badge); (4) SCHEMA:
  batch entity + containers table with line items — built full, nothing
  grows later. Both container kinds: recipe-linked AND free-form (for
  leftovers).
- INPUTS PRODUCED: pack-source food rows with container/line-item
  semantics + partial-consume — a full meal-prep input stream.

### N-10 ONE-TIME RECIPE SUBSTITUTION (LOCKED — two-scope cascade + macro-range
  adherence condition) — line 1235
- WHAT: a meal slot fills by ANY recipe/food as a one-time event — the
  substitution lives on the RECEIPT LINE, not the recipe (copy-in
  preserved, no fork, no variant) and not the plan (tomorrow's plan
  unchanged). Flexibility lives at the USE level, never the DEFINITION
  level; the escape valve that keeps confirm-mode (N-04) sustainable
  without guilt. TWO SCOPES: (1) CURRENT-MEAL-ONLY built FIRST (M3):
  affects today's slot, nothing else; (2) CASCADE built AFTER it (user
  wants it): substitute for the rest of the week — a deliberate
  EDIT-PLAN action with confirmation, never a silent side effect.
  ADHERENCE CONDITION: substituted meals count as adhered
  (done-differently) ONLY WHEN the substitute lands within the INTENDED
  PLANNED MACRO RANGE (the meal slot's planned macro band, e.g., dinner
  600-750 kcal); a substitute OUTSIDE the band logs honestly but does
  NOT count as adhered; the gap-rebalance (N-04) suggests adjustments
  toward the band.
- INPUTS PRODUCED: substitution events on receipt lines (with
  substituted-for notes) + adherence classification (within/outside
  macro band).

### N-06 FREE-FOODS LIST (LOCKED — both decision points agreed) — line 1262
- WHAT: a small, user-editable list of CALORIE-TRIVIAL foods (water,
  black coffee, tea, plain vegetables, herbs, zero-calorie drinks) that
  skip logging friction — with the integrity guarantee: NOTHING is
  actually free — each entry carries its REAL macros (MACRO COUNTS MUST
  BE ACCURATE — never fudged to zero); logged entries count honestly.
  Default seed = small curated default (~20-30) + user-extendable;
  skipped by DEFAULT (that is the point) with a log-it-anyway path; the
  daily totals footnote: "N trivial items not logged". Never hides
  calories (the WW failure mode explicitly avoided).
- INPUTS PRODUCED: trivial-food list + explicit "not logged" footnotes
  (an honesty input: unlogged-trivial counts).

### N-15 EATING-WINDOW AWARENESS (LOCKED — both decision points agreed) —
  line 1284
- WHAT: OPTIONAL fasting-window indicator on the diary — the window band
  shows fasting/window state; logged meals appear inside/outside it with
  a NEUTRAL marker (facts, no judgment). In-app only (no push, no timers
  nagging — the no-push rule untouched), quiet-week aware, default OFF
  (opt-in). It is a DISPLAY AWARENESS LAYER, NOT a fasting product: no
  window coaching, no window trophies, no streak pressure, no
  notifications. Composes with N-04 (window-aware plans place meals
  inside the window — optional). Schedule model = SIMPLE DAILY WINDOW
  (start/end, or two windows) WITH PER-DAY EXCEPTIONS; outside-window
  marker = neutral facts-only line, NEVER a warning color (no-shame
  applies to fasting too).
- INPUTS PRODUCED: eating-window schedule (per-day exceptions) + meal
  in/out-of-window classification — a fasting-domain derived input
  (relevant to the tree's nutrition domain forks: food/fasting/
  hydration per D088).

### N-17 DIET-MODE RE-DERIVATION — FUTURE-CAPABILITY SCOPED NOW (LOCKED —
  both decision points agreed) — line 1305
- WHAT: the re-derivation RULE any diet mode would use — fix two macros,
  flex one (the same shape as the locked architecture): keto = protein
  g/kg fixed + carb ceiling fixed → fat as remainder; low-carb = protein
  fixed + fat floor → carbs flex within a cap. The architecture does not
  change; the CONSTRAINT ORDER changes per mode. FEATURE IS FUTURE —
  recorded now so the macro derivation engine is BORN READY: written
  with the constraint-order abstraction (protein-fixed + floor-fixed +
  remainder-flex), never hard-coded to bulk/cut/maintain; zero extra
  build cost. Net-carbs and similar per-mode displays = FUTURE decision,
  gated by the honest-macros rule (net-carbs is a display convention,
  never a stored data change).
- INPUTS PRODUCED: none now (abstraction only).

### N-12 DENSITY FACTS AS NEUTRAL COACH LINES (LOCKED — both decision points
  my takes accepted) — line 1327
- WHAT: the density heuristic RESTATED NEUTRALLY as facts-only Coach
  lines — never colors, never good/bad framing, never Life-Score
  composites: "This meal is 2.1 kcal/g — a dense option." The fact is
  the same; the judgment is absent. Fires on SPECIFIC meals when the
  Coach has a factual density outlier to state — never a constant label
  on everything; RELATIVE framing (dense/lighter vs the user's typical
  meals) rather than absolute cutoffs. Facts-only; derived +
  explainable (show-your-work); no shame.
- INPUTS PRODUCED: density outliers (derived) — coach lines only.

### N-14 PER-MEAL PROTEIN PACING COACH FACTS (LOCKED — both decision points
  my takes accepted) — line 1346
- WHAT: facts-only Coach lines about protein DISTRIBUTION over the
  locked daily g/kg target: "Protein so far: 40g — 60g across the
  remaining meals keeps the 1.8 g/kg pace." Rides the macro-gap bar's
  protein line — a pacing NARRATIVE over the existing number; zero new
  logging (derived from existing protein rows). Once daily, evening,
  when the pattern is visible — never nagging; pace-neutral phrasing
  ("keeps the pace"), never "you're behind" — the no-shame boundary.
- INPUTS PRODUCED: none new (renders protein rows).

### N-16 VEGGIE SERVINGS + WATER HABIT CHECK-INS (LOCKED — both decision
  points my takes accepted) — line 1360
- WHAT: veggie servings + hydration become habit check-ins INSIDE the
  nutrition domain — the locked habit engine (daily check-ins, grace,
  quiet-week, no-shame, zero-XP) applies unchanged; nutrition data
  sources auto-tick them. Auto-tick rules: veggie servings auto-tick
  from a veggie-tagged food category (seeded, user-adjustable); water
  auto-ticks from logged water. Scope: seed TWO habits (veggies, water)
  as DEFAULTS-OFF, user-enabled, never forced. Zero XP for ticking
  (locked); manual check-in always wins; isImported excluded.
- INPUTS PRODUCED (CRITICAL): veggie-tagged food rows + water logs →
  auto-ticked habit check-ins — a nutrition→habits input bridge (the
  tree's buds can read these).

### N-08 EXERCISE KCAL DISPLAY-ONLY (LOCKED — both decision points agreed) —
  line 1378
- WHAT: exercise kcal (NU9 band + cardio MET) renders in the macro-gap
  bar as DISPLAY-ONLY and NEVER expands the day's targets (PAL already
  embeds exercise; wearables overestimate 27%+; eating-back silently
  stalls cuts / bloats bulks). SHOW the burn as a labeled fact (honesty
  is the product; the label prevents misuse); weekly check-up mentions
  it as a fact line only, never an adjustment.
- INPUTS PRODUCED: exercise kcal estimate (display-only fact).

### N-07 IMPLIED-TDEE INSIGHT (LOCKED — ALL decision points D1-D7 approved;
  the TDEE deep-dive, complete design) — line 1390
- WHAT: the three-layer TDEE architecture: L1 FORMULA SEED (locked, M3):
  Mifflin-St Jeor RMR × PAL — a guess (±200-500 kcal error); L2
  ROLLING-WEIGHT RECOMPUTE (locked, M3): Mifflin re-run on current
  rolling weight (F-13 EMA trend value), weekly — PAL's frozen error
  stays inside the number; L3 IMPLIED-TDEE INSIGHT (this candidate;
  M3+): SOLVED from intake + trended weight — cancels formula/PAL/
  activity/adaptation error (MacroFactor median error ~108 kcal/100 days
  vs formula >500). THE PIVOT: a formula TDEE is a guess; weight trend +
  intake is a measurement. THE MATH: L1: RMR_Mifflin = 10*W + 6.25*H −
  5*A + 5 (men) / ...−161 (women); TDEE_formula = RMR × PAL (PAL in
  {1.2, 1.375, 1.55, 1.725, 1.9}); calorieTarget = TDEE + (rate × 7700)/7
  (signed weekly rate: bulk +0.25-0.5, cut −0.5, maintain 0). L3:
  impliedTDEE ≈ avgLoggedKcal(7-14 d) − dTrendWeight × 7700/days.
- GUARDRAIL CONSTANTS (verbatim — D1, D2, D3, D6 approved):
  trendWindow = 20 DAYS (D1 — the change-rate inference signal; NOT the
  7-day display EMA — display vs inference are separate derived layers);
  completenessGate = ≥6 of 7 logged intake days, else HOLD;
  weighInGate = ≥3 weigh-ins/wk, else HOLD (D3 — a FREQUENCY NUDGE +
  gate, NOT a change to the locked first-of-day canonical weigh-in
  rule; the app nudges toward daily weigh-ins); updateCap = ±250 kcal/wk
  ABSOLUTE CEILING with TWO-STEP HEDGE (D2: week 1 moves ~half, week 2
  commits if the trend holds); symmetry = gain/loss energy content
  SYMMETRIC (7700 both ways) — D7 FIXED (not a knob): inherits the fix
  for MacroFactor's V3 ~80 kcal/day asymmetric drift bug; interpolation
  = linear gap interpolation on missing weigh-ins; HOLD presentation
  (D6): "Insufficient data — holding." No guess, no silent change.
- THE B4 CONTRACT (non-negotiable, preserved verbatim): L3 is SURFACED,
  NEVER AUTO-APPLIED. The implied TDEE renders in the weekly check-up as
  "Your data suggests maintenance ~ X kcal (from N logged days, trend
  ±Y kg/wk)." The user adopts it ONLY via the existing manual TDEE
  override (B4 freeze stays absolute).
- ADAPTATION ARC + PHASE ENTRY: cut entry (phase screen, one line):
  "Your body will fight the deficit — expect implied TDEE to drift ~10%
  lower over the first weeks; that's physiology, not a bug." Bulk entry:
  mirror image (transient upward read as glycogen loads). The check-up
  teaches the arc: weeks 1-3 = early water phase (7700 reads wrong),
  weeks 3+ = fat-dominated convergence. AGGRESSIVE-RATE WARNING (D4):
  when rate × 7700/7 exceeds ~30% of TDEE (~1% BW/wk equivalent):
  "Aggressive — the literature associates >1%/wk with greater lean-mass
  and hormonal cost; consider the slower option."
- SCOPE SPLIT (D5): M3 ships L1+L2 (already locked) + ALL estimate-
  framing copy (N-13) + the weigh-in policy nudge + the adaptation lines
  + the aggressive-rate warning; M3+ ships the L3 implied-TDEE insight
  itself.
- INPUTS PRODUCED (CRITICAL): implied TDEE (surfaced-only) from intake
  logs + F-13 trend weight — the nutrition domain's central derived
  number; weigh-in frequency nudge policy.

### N-13 ESTIMATE-FRAMING + TAP-TO-EXPLAIN (LOCKED — part of the approved TDEE
  deep-dive) — line 1479
- WHAT: every derived nutrition number carries honest error framing + a
  tap-to-explain sheet (formula, inputs, constants, sources). THE
  FRAMING COPY TABLE (verbatim — exact lines): TDEE (formula):
  "TDEE from Mifflin-St Jeor: ±10-15% typical error (±200-350 kcal for
  you) — refines as your weight data accumulates."; 7700 kcal/kg:
  "approx. energy content of 1 kg of fat tissue (Wishnofsky 1958); early
  weeks and water/glycogen swings can diverge 30-40%+; judge rates over
  2+ week trends."; Exercise kcal: "±25-50% estimate; your target
  already assumes this training — the weekly trend is the only
  adjustment authority."; Implied TDEE (M3+): "your data suggests
  maintenance ~ X kcal (from N logged days, trend ±Y kg/wk) — ±100-150
  kcal typical."; Fat floor: absolute grams with rationale (0.6 g/kg =
  45 g @ 75 kg, inside the 40-60 g/d sex-hormone band; Trexler's
  evidence-graded floor table; carb-crowding warning when a deep cut
  leaves carbs very low: consider raising fat toward 0.8-1.0 g/kg);
  Protein: phase values with WHY (cut 2.0 / bulk 1.8 / maintain 1.6 —
  validated by the literature; cut > bulk > maintain documented;
  very-lean users up to 2.4 g/kg BW; g/kg FFM = future precision
  upgrade if body fat % is ever captured); Per-meal pacing (N-14 tie):
  soft guidance, never a hard target (≥0.25-0.4 g/kg per meal across
  3-4 meals supports ~25% higher 24-h muscle synthesis).
- INPUTS PRODUCED: none new (explainability layer over all derived
  nutrition numbers).

---

## 4. LOCKED FEATURE DECISIONS — L-SERIES (LifeOS)

Section: LifeOS candidates (lines 1520-1846).

### L-01 NATURAL-LANGUAGE CAPTURE + CURATED TODAY (LOCKED — both decision
  points my takes accepted) — line 1520
- WHAT: (a) a single NL input field parses plain text into M5 structure —
  "Hit 82kg by Dec 1" → goal kind=weight, target=82, deadline; "Every
  Mon/Wed bench" → cadence; the parser is RULE-BASED and OFFLINE
  (patterns + units + date parsing — no AI, no deps); the structured
  form stays for precision, the parser pre-fills it. NL parser scope at
  M5 = dates + units + cadences (weight/strength targets, "by X",
  "every Y"); free-text-to-goal parsing is future. (b) the curated Today
  view — only due + scheduled items; overdue surfaced gently (no drama,
  no archive/shame state); deadline-ring days (M6) pull their goal into
  Today; "This Evening" micro-view (Things) splits today into day/
  evening. Curated Today DEFAULT with an "all" toggle — mirrors the
  dashboard's show-if-not-empty discipline.
- INPUTS PRODUCED (CRITICAL): NL-parsed goal/task rows (goal kind,
  target, deadline, cadence — parse-output fields, schema decision) —
  a low-friction capture input for the goals domain.

### L-02 2-DAY SLIP INDICATOR + LOGBOOK WON-ARCHIVE (LOCKED — decision (a)
  accepted; (b) noted with future-UI caveat) — line 1543
- WHAT: (a) the 2-DAY SLIP INDICATOR for goal cadences — one skipped day
  doesn't break the run; a "2" indicator shows with the neutral line
  "do it today or it's missed" (recoverable, never shame). Goals only at
  M5 — habits already have grace; the indicator is the goal-expiry-
  specific mechanic. (b) the LOGBOOK — a permanent, browsable won-archive
  where milestone-review "won" cards land with their one-line reflection
  (the quiet accumulation of wins; Things' reference design); placement
  SUGGESTION recorded (inside the goals surface as a "Won" archive
  section).
- INPUTS PRODUCED: goal slip states + won-goal archive (with one-line
  reflections). Life Tree relevance: the won-archive is the goals-domain
  "fruit" record (completed goals = fruit on spurs per D088).

### L-03 PACE LINE GOAL VISUALIZATION (LOCKED — decision (a) accepted; (b)
  recorded for future UI) — line 1565
- WHAT: the locked goal-pace + F1 projection rendered as a derived PACE
  LINE — dashed straight line from start value to target across the
  deadline (the required rate), actuals plotted against it, on/off-track
  status; "behind pace" = recoverable, never "failed". Derived stat,
  zero user effort, fully offline. Composes with the lit-mirror ladder
  (the target IS a ladder value), F1 projections, and the milestone
  chart for milestone-bearing goals. Pace Line for ALL dated numeric
  goals (weight/strength AND generic targets — the math is the same).
  On/off-track COLORS = future UI decision (amber for behind — the
  neutral drift color from plan-adherence; red reserved for
  genuinely-expired).
- INPUTS PRODUCED: goal pace/projection state (derived) — on/off-track
  status per dated goal.

### L-05 POST-RUN EXPECTED-VS-ACTUAL REPORT (LOCKED — both decision points my
  takes accepted) — line 1592
- WHAT: after a routine/day runs, a per-step report — expected vs actual
  minutes per slot ("gym 45 planned · 52 actual · +7"), feeding the
  plan-vs-actual toggle's data source; the CLOSE of the plan-vs-actual
  loop (planned → ran → compared). BOTH: the per-step minute-delta
  report (the data) AND the per-slot summary (done/skipped/different —
  the glance); lands in the DAY VIEW + the briefing's EVENING CLOSE (the
  wrap-up card pattern). Neutral tone (never scores); done-differently
  semantics; no shame.
- INPUTS PRODUCED (CRITICAL): routine_slot_logs with planned-vs-actual
  minute deltas + per-slot outcome (done/skipped/done-different) — the
  plan-vs-actual data stream.

### L-06 PLAN-VS-ACTUAL DAY-VIEW LINE (LOCKED — the signature feature;
  decision (c) accepted; (a)+(b) recorded with future-UI caveat) —
  line 1643
- WHAT: in the M6 day view, every planned slot renders its actual
  outcome as a neutral derived line: [planned: gym 17:00 · actual: done
  17:15] · [planned: meal 12:30 · actual: skipped] · [planned: rest ·
  actual: cardio]. Interleaved with the day's other derived lines
  (weigh-in, meals, journal, habits); derived from routine_slot_logs +
  the day's events; NEVER scored, NEVER judged. The locked plan-vs-
  actual toggle becomes the RENDERING of this data; the L-05 post-run
  report feeds it; L-08 badges tone it; the evening close summarizes it
  silently. (a) LINE PLACEMENT — interleaved in the day view's
  chronological feed (the signature; no separate screen) — future UI
  may change. (b) STATUS COLOR SEMANTICS — done = neutral fill
  consistent with the activity tint; missed/skipped = neutral outline;
  done-differently = the L-08 badge; NO red-as-failure anywhere (red
  reserved for genuinely-expired goals per L-03). (c) PERIOD-LEVEL
  DUALITY — INCLUDED (Polarsteps' plan/track model inside vacation/term
  periods: "planned schedule vs actual during the trip"). Tint-only
  compliance; done-differently semantics; no shame; derived-only;
  offline.
- INPUTS PRODUCED (CRITICAL): the day's plan-vs-actual lines (slot
  outcomes) — a cross-domain day-story input; period-level plan/track
  duality.

### L-07 SHOW-IF-NOT-EMPTY BLOCKS (LOCKED — my takes accepted) — line 1678
- WHAT: dashboard blocks render ONLY when they have data (or a pending
  signal); otherwise they COLLAPSE entirely. A new user sees Today +
  capture + habits + storage — no empty strength/goals/weekly cards. The
  locked one-line what-appears-here explanation survives only for
  soon-to-fill blocks (or inside the collapsed state's disclosure). (a)
  FULL collapse (no compact placeholders); (b) the heatmap strip ALSO
  collapses at zero data (a zero-data heatmap is a moral-less blank; it
  appears with the first activity week). Future UI/UX may change —
  noted, not locked.
- INPUTS PRODUCED: none (presentation rule) — but defines WHEN derived
  blocks exist at all (a "no data" input state for every dashboard
  surface, incl. any tree surfaces).

### L-08 NEUTRAL DEVIATION BADGES (LOCKED — both decision points my takes
  accepted) — line 1609
- WHAT: deviations (rescheduled/skipped/done-differently) render as
  NEUTRAL badges — plain factual counts with zero moral valence; the
  plan-vs-actual day view shows them on affected slots; the evening
  close lists them silently. Badges ALWAYS-ON in the day view (facts
  are facts); the evening close SUMMARIZES them; moved-count PER-SLOT
  ("moved 3x" on that slot); day-total only in the close. Never scored;
  no color-coded guilt; done-differently semantics.
- INPUTS PRODUCED: deviation counts (moved/skipped/done-different per
  slot) — the neutrality vocabulary for plan-vs-actual data.

### L-13 WEEK-PATTERN ROUTINE SCHEDULING (LOCKED — both decision points my
  takes accepted) — line 1625
- WHAT: routine patterns beyond daily — weekday/weekend variants,
  specific days (Mon/Wed/Fri), weekly cadence; "which days" as a
  first-class field; the day template's binding expands from one dayKey
  to a day-PATTERN; the briefing pre-loads today's applicable template;
  NL parser (L-01) feeds cadences. M4 scope = weekday/weekend + specific
  days + weekly; MONTHLY patterns future. Pattern changes apply
  FUTURE-ONLY by default with this/all-future/all scoping choices (the
  Structured recurrence-edit lesson — a template edited mid-week never
  corrupts the week).
- INPUTS PRODUCED: routine pattern field (day-pattern binding) —
  routines gain cadence structure.

### L-09 PER-BLOCK SKELETONS, RETURNING-USERS-ONLY (LOCKED — all UI details
  recorded; may change during future UI passes) — line 1730
- WHAT: the locked shimmer rule refined with three rules about WHEN the
  gray placeholder ghost shows: (1) NO ghost for brand-new users (a
  ghost outline of a block they've never seen means nothing; new users
  see the empty state (L-07) or nothing); (2) NO ghost for fast blocks
  (Today, habit ticks, storage, capture read instantly from local data;
  no shimmer for locally-cached light blocks, ever); (3)
  GEOMETRY-MATCHED ghosts (the gray outline matches the block's final
  shape exactly — number on top, chart below — so real content slides
  in without jumping; no layout shift).
- INPUTS PRODUCED: none (presentation rule).

### L-10 RULE-BASED CROSS-DOMAIN INSIGHT ENGINE (LOCKED — all three decision
  points accepted; STRESS-TESTING REQUIRED) — line 1757
- WHAT: the Coach computes cross-domain insights with pure logic: (1)
  WITH/WITHOUT COMPARISONS — split days into "with X" vs "without X",
  compare a second metric ("on days you train, journal word count
  averages 140 vs 90 on rest days"); (2) NEXT-DAY LAG — today's habit
  affects tomorrow's outcome (sleep → next-day gym performance);
  comparisons include a lag window; (3) CONFIDENCE TIERS — every insight
  carries a confidence label from sample size ("based on 14 training
  days vs 9 rest days") — never stated as truth without the n; (4) DATA
  THRESHOLDS — insights compute only with enough data — the 5+5/90-day
  rule (≥5 days in each group OR 90 days of history); a 2-day
  coincidence never becomes a pattern; (5) CORRELATION-NOT-CAUSATION
  wording, verbatim: always "correlates with", never "caused by".
- DECISIONS (all accepted): (a) the insight line lives in the weekly
  Coach message (F-24, ONE line per week) + the Life Tree branch detail;
  NOWHERE else (no dashboard block, no notifications — one-notification
  discipline). (b) FIRST COMPARISON SET = the big five: training ↔
  journal presence/word count; training ↔ mood-proxy; sleep-proxy ↔
  next-day training; protein hit-rate ↔ next-day gym performance;
  weigh-in trend ↔ journal cadence — each with thresholds. (c)
  MOOD-PROXY ACCEPTED: since C-04 (mood tracking) was rejected,
  mood-family comparisons use DERIVED PROXIES (journal presence, word
  counts, entry length) — honest data, safe under the correlation
  wording.
- STRESS-TESTING REQUIREMENT (user directive): the engine must be
  EXTENSIVELY STRESS-TESTED with SEEDED DATA — synthetic histories
  designed to produce known patterns, edge cases (tiny samples, lopsided
  groups, seasonal effects, missing data), and the full
  threshold/confidence matrix — before it ever ships a real insight;
  test fixtures become part of the engine's test suite (engine-2).
- INPUTS PRODUCED (CRITICAL — direct Life Tree tie): cross-domain
  insights (correlation statements with confidence + n) — fed into the
  tree's stolon adaptation (D088 adaptation map item 11: "STOLONS —
  sustained CROSS-DOMAIN influences: the L-10 insight engine's findings
  made structural; feed: L-10 (locked)"). The insight ALSO renders in
  the Life Tree branch detail.

### L-11 SPRAWL GUARDRAIL (LOCKED — all my takes passed) — line 1805
- WHAT: a standing guardrail, not a feature — every proposed feature
  must pass "does it earn its place in the surface?" before it locks.
  THREE CHECKS: (1) SURFACE-WORTHINESS — does it earn real estate on a
  screen (or collapse/disappear per show-if-not-empty)?; (2) SCHEMA
  DISCIPLINE — does it extend the existing model additively, or demand
  a new unbounded entity?; (3) SPRAWL TEST — if every future feature of
  this kind shipped, would the app survive? (One composite score is
  fine; a score SYSTEM is sprawl.) Recorded in House rules + carried to
  DevelopmentWorkflow at the docs pass.
- INPUTS PRODUCED: none (a standing filter on all future features —
  applies to Life Tree features too; D088 explicitly applies it inside
  the tree: "no templates, no made-up splits (the L-11 sprawl guardrail
  applied inside the tree)").

### L-12 NUMBERS>CHARTS GLANCE / CHARTS>NUMBERS ANALYSIS (LOCKED — recorded;
  future UI/UX may change) — line 1697
- WHAT: the block presentation rule — glance blocks lead with a SINGLE
  number (streak "14", storage "62%", protein "168/168g"); analysis
  surfaces (weekly review, strength snapshot, goal detail) get the
  charts; the macro-gap bar is the hybrid (live number + capacity
  context — locked). (a) dashboard top half (Today, habits, capture,
  storage) = number-led; bottom half (goals, strength, weekly) =
  chart-enabled with number-led headlines; (b) the heatmap strip is the
  EXCEPTION (a chart that IS a glance — tint volume at a glance,
  validated by the calendar research). Future UI/UX may change — noted.
- INPUTS PRODUCED: none (presentation rule) — governs how derived
  numbers vs charts render.

### L-14 STRENGTH-VS-HEATMAP ORDER (LOCKED — decision (a) accepted; (b) HELD
  for the UI/UX ordering pass) — line 1714
- WHAT: the one open position in the locked M2 block order: strength
  snapshot (analytical, heavier, shimmer) vs calendar/heatmap strip
  (glance-level volume). Evidence: the heatmap is a glance surface
  (volume language, 5-second readable — L-12's exception); the strength
  snapshot is analysis and belongs below the glance line. (a) CONFIRM
  the locked order (heatmap ABOVE strength snapshot) with this evidence
  — ACCEPTED; (b) the final resolution is HELD for the deferred UI/UX
  ordering pass — the evidence note above is what that pass inherits;
  not reopened blindly.
- INPUTS PRODUCED: none (ordering rule).

### L-15 LIFE-SCALE GRID (LOCKED as a DESIGN FEED — user: feed only;
  tree-session placement decision) — line 1825
- WHAT: a research feed for the LIFE TREE DESIGN SYSTEM session, NOT a
  locked feature: the weeks-as-cells grid family as the tree's
  quantitative twin (the tree = organic metaphor, trunk/rings/branches;
  the grid = the whole life as cells, filled by weeks lived + weeks
  logged) — Life Calendar's 90-weeks-per-year life grid (a human life
  as ~4,680 weekly cells). Takeaways: (1) the spatial-meta layer could
  appear as a strip or a zoomed-out mode — TREE SESSION DECIDES; (2)
  the emotional register is the tree's own (awe without guilt —
  life-scale apps monetize the epiphany moment); (3) the anti-farm
  lesson (fake-commit painters prove volume-grids attract gaming — the
  tree's derived-only + anti-farm rules inherit this defense). (a) FEED
  ONLY — the tree session decides whether the grid appears (strip, zoom
  mode, or not at all) — ACCEPTED; (b) PLACEMENT in the tree section
  (tree-2 anatomy / tree-5 render reference notes) MUST BE DECIDED
  DURING THE LIFE TREE DESIGN SESSION — recorded, deferred.
- INPUTS PRODUCED: none (design feed — weeks-lived/weeks-logged grid
  concept deferred to the tree session).

---

## 5. REJECTED DECISIONS THAT SHAPE INPUTS

### C-series rejections (lines 2071-2082)
- C-01 QUICK CHECK-IN (REJECTED — cheap tier closed): Daylio 2-tap
  pattern — mood + one line + optional photo quick capture beside
  long-form compose. RESTING PLACE: dead. → No mood input, no
  quick-check-in input.
- C-02 JOURNALING SUGGESTIONS (REJECTED — cheap tier closed): Apple
  Journal zero-LLM suggestion engine over the event log. RESTING PLACE:
  dead. → No suggestion input.
- C-04 MOOD AS FIRST-CLASS + CORRELATIONS (REJECTED): Daylio mood
  tracking + activity correlations. RESTING PLACE: dead. → NO MOOD
  INPUT EXISTS BY DESIGN. Consequence recorded in L-10 (c): mood-family
  comparisons use DERIVED PROXIES (journal presence, word counts, entry
  length). Consequence recorded in D088 (honest skips): pitcher/bladder/
  snap traps (require detecting "hard times" — no mood data by design,
  C-04 rejected — underivable).

### F-series rejections (lines 798-813, 1008-1015)
- F-21 SIX-LEVEL CHECK-IN LADDER (REJECTED — flexibility concern):
  JuggernautAI's six-level adaptation ladder (pre/intra/post/weekly/
  block/program) as Coach rule scopes. RESTING PLACE: dead. → the
  engine's effort input stays inference-based (F-09 expected-vs-actual
  from weight×reps) with NO user-facing check-in ladder.
- F-22 ONE-TAP POST-WORKOUT FEEDBACK (REJECTED — same category as F-21):
  Freeletics' 2-interaction post-workout feedback screen. RESTING
  PLACE: dead. → THE ENGINE DOES NOT GET USER EFFORT FEEDBACK; F-09
  inference from logged weight×reps is the SOLE effort signal.
- F-31 GYM PROFILES / EQUIPMENT PRESETS (REJECTED): switchable equipment
  profiles reshaping suggestions. RESTING PLACE: dead (F-23's adapt
  affordance covers the reactive path). → No equipment-profile input.
- F-32 MOVEMENT-PATTERN REPLACEMENT (REJECTED): derived same-pattern
  substitutes via muscle tags. RESTING PLACE: dead (mid-session swap
  stays manual via the F-02 anatomy). → NOTE: F-23's NO EQUIPMENT adapt
  variant was scoped "later, with F-32" — F-32's rejection affects that
  future variant.

### L-series rejections (lines 1586-1591)
- L-04 LIVE FINISH ESTIMATE (REJECTED — skipped): Routinery's running
  finish-time estimate in the routine run and briefing card. RESTING
  PLACE: dead (the briefing's slot list may still show planned
  end-times; the live-updating estimate itself is rejected). → No
  live-finish input.

### Rejections nested inside locked entries
- C-05: reply-to-your-past-self (StoryPad pattern) REJECTED — no
  reply-back input.
- C-09: repair tokens REJECTED — grace stays the only finite shield;
  pause must be bounded.
- N-09 / D069: PHOTO-AI food scanner REJECTED (do-not-build, evidence-
  backed: 1/3-calorie error + cloud-bound) — no photo-food-estimation
  input; EAN barcode lookup (N-09) is a different feature, approved.
- D084: getsentry/skills@security-review REJECTED (Snyk audit FAIL on
  skills.sh).

### Rejected inside the tree design (D088)
- AERIAL ROOTS / velamen — SCRAPPED from the adaptation map.
- HONEST SKIPS (documented — no zombie forcing): haustoria (parasitic —
  the tree has NO parasitic layer by design); pitcher/bladder/snap traps
  (require detecting "hard times" — no mood data by design, C-04
  rejected — underivable); rhizomes/bulbils/offsets (clonal spread needs
  a second tree — there is only the user's); pneumatophores/knee/
  floating/assimilatory roots (no flooded-soil/aquatic equivalent);
  pseudobulb (epiphyte storage — merged into the scrapped aerial
  roots); scale leaves/bulb scales (structural, merged). Future
  features may earn new mappings but nothing is forced today.

---

## 6. SKIPPED / PENDING / AGREED-IN-PRINCIPLE (future input surface)

- C-07 LIFE AREAS V2 — SUPERTAGS WITH FIELDS + PORTALS (SKIPPED for now)
  — line 2001: Life Areas gain optional data fields (3 types only:
  faces/mood, number, short text) defined per area in Settings; fields
  render as quick pills when tagging an entry (2 taps each, skippable);
  the area's filter view becomes a self-filling PORTAL (every entry of
  that area from all time, grouped by date, with a small summary strip
  on top — "the first computed chart the journal produces"). UNLOCKS:
  structured data for the M7 analytics engine (sleep/mood trends —
  numbers, not word counts) · facts-only Coach lines ("sleep field
  below 6h for 5 days") · Life Tree branch detail panels · C-03-style
  chips from area fields. REVISIT: when M7 analytics work starts, or
  when the Life Tree branch-detail design needs the data. NOT
  mood-as-global-feature (C-04, rejected) — fields are per-area,
  opt-in, invisible until used. INPUTS: per-area field values (sleep,
  mood-face, number, short text) — a future structured input source
  with an explicit Life Tree branch-detail tie.
- C-10 YEAR IN PIXELS MOSAIC (SKIPPED) — line 2083: Daylio annual
  mosaic — was to feed J5 Year Book + Life Tree rings. REVISIT: anytime;
  "it is a natural Life Tree annual-ring visual if the tree design
  wants it."
- C-12 PROMPT LIBRARY (SKIPPED) — line 2024: curated + user-editable
  writing prompts per Life Area, each optionally teaching a cognitive
  move; hand-written core (~25-40) + LLM-generated expansion curated at
  build; NO scraping (copyrighted IP). REVISIT: at the Coach rule-book
  session or if blank-page friction shows in real use.
- C-13 EPHEMERAL DAILY REVIEW RITUAL (SKIPPED) — line 2040: J1 strip
  upgraded to a Timehop-style ritual (one daily feed that EXPIRES at
  midnight, small "review streak", C-05 hide-controls apply). GUARD:
  review-streak reward must be XP-free and non-farmable. REVISIT:
  after J1 ships and proves itself.
- C-14 CONTEXT-TIMED NUDGES — COACH SCHEDULING LAYER (SKIPPED) — line
  2058: a rule about WHEN the Coach speaks (after a workout, after
  checking memories, after 3 quiet days, first open of the day); same
  content caps (1 notification/day, quiet week wins, never push,
  facts-only). REVISIT: the Coach rule-book session (M8 planning).
- C-15 LIFE TREE EMOTIONAL ENGINE (PENDING — feeds the main-goal
  section) — line 2088: care-object growth (Finch), ring visuals (Daylio
  mosaic), year artifacts (1SE mashup), then-&-now comparisons
  (Timehop), 10-year pledge (Standard Notes). DECIDED INSIDE THE LIFE
  TREE DESIGN SYSTEM SECTION, not here.
- F-25 WEEKLY STREAKS + EARNED SAVERS — GRACE V2 FITNESS (SKIPPED for
  now) — line 841: re-frames the fitness streak from a daily
  habit-style counter to a WEEKLY cadence ("the week is alive if the
  routine's scheduled sessions got done"; rest days structurally
  invisible). THE OPEN DECISION (deferred with the feature): what
  advances the weekly streak — (a) PLAN-COMPLETION (Perfect Week style;
  anti-farm by construction; recommended) · (b) MINIMUM-ONE (loose,
  farmable) · (c) HYBRID. SAVERS: earned at 12-week marks, max 2,
  settings-tunable — forgive GENUINELY skipped weeks, never rest days;
  earned-capped-automatic (anti-farm); positive-only streak displays
  (no broken-chain shaming). REVISIT: activation trigger = when M7
  gamification planning begins. TOUCHPOINT: v2 streak trophies read the
  fitness streak.
- F-26 SKILL-TREE PROGRESSION LADDER — REP-MODE (SKIPPED for now) —
  line 878: rep-mode exercises (pull-ups/push-ups/dips — locked, no rep
  cap) get explicit progression chains with difficulty edges (push-ups:
  incline → full → deficit → weighted; pull-ups: negatives → banded →
  full → weighted); the engine computes position from clean-rep history
  and surfaces "path to X" + "next tier". Compose with F-05 set labels
  (clean reps from working sets) and the v2 bodyweight ladder. REVISIT:
  when rep-mode exercise work starts (M2 build or later).
- F-27 ADHERENCE + SITUATION TROPHIES (AGREED IN PRINCIPLE — full
  proposal documented; activation at the achievement/gamification
  milestone) — line 897: (1) ADHERENCE TROPHIES — Goal-Getter shape:
  3/7/30/60-day runs of meeting your OWN plan (Perfect Week family;
  structurally unfarmable); (2) SITUATION TROPHIES — Early Bird (first
  session before 8am) · Night Owl (after 9pm) · Comeback (post-deload
  return) · Weatherproof (consistent through an unbroken stretch);
  (3) CATALOG DISCIPLINE: new entries go through the locked layer map;
  (4) LOUDNESS: Sprout/Branch-tier → silent in-game toasts only;
  (5) DECISION DEFERRED: do adapted sessions (F-23) count as "adhered"?
  (draft answer at activation: yes — done-differently, never skipped).
  DEFERRED QUESTION EXTENSION: adapted-everything week staying "adhered"
  could farm the strictest schedule-run trophies; decide at activation
  whether adapted sessions cap those trophies' count.

---

## 7. THE GUI/UX REFERENCE SECTIONS — milestone table M0-M9 + mobbin
   dataset maps (lines 2147-2227)

### Milestone → GUI research table (verbatim-critical lookup; nothing is a
  lock, it is a lookup)
- M0-M1 Journal: compose, timeline, editor — R01 GUI (Day One 3-pane/
  calendar, Apple Journal suggestion wall + inline media, Diaro
  photo-strip, Pencil one-page-per-day) · R06 GUI (Drafts open-to-blank,
  Keep capture buttons) · mobbin: Evernote/Apple Notes/Notion.
- M1 J1 memory strip — R01 On-This-Day surfaces · R04 Timehop ephemeral
  feed GUI · PART 9 §9.5 reflection surfaces.
- M1 J5 Year Book — R01 Day One calendar/print · R04 1SE grid + mosaic ·
  PART 9 §9.2.
- M1 D031 physique timeline — R04 Timehop Then-&-Now · R01 Diaro Atlas ·
  PART 9 §9.5.
- M2 Fitness — fitness research PART 9 (logging anatomy, vault, coaching
  surfaces) + per-report GUI sections + mobbin: Hevy/Fitbod/MacroFactor/
  NRC/Strava.
- M3 Nutrition — nutrition research PART 9 (logging flow, day summary,
  check-up, recipe/plan surfaces, trust surfaces) + mobbin:
  MFP/Noom/Yazio/Lifesum/Zero + MacroFactor (fitness set, 402 screens).
- M4 Routine & Briefing — lifeos research PART 8 (routine run, briefing
  card) + R02 report GUI (Routinery run, Structured replan) · R05 Ohai
  briefing · R04 Stoic ritual · R01 Day One Today tab.
- M5 Goals & Tasks — lifeos research PART 8 (goal surface, today
  surface) + R01 report GUI (Things 3 today, Strides milestone chart) ·
  mobbin: Todoist (326), Things 3 (166), TickTick (97).
- M6 Calendar & Periods — lifeos research PART 8 (month grid, year
  heatmap, day view, periods) + R03 report GUI (Fantastical year, Google
  agenda) · mobbin: Google Calendar (866), Cron (110).
- M7 Analytics & Gamification — R04 Daylio stats/Year-in-Pixels · R04
  1SE missed-day grid · R03 Ulysses progress ring · R04 Finch streak
  displays.
- M8 Coach — R05 AI journals (suggestion cards, briefing, opt-in
  controls) · R04 wellness (care-based streaks, no-nag returns) · R04
  Stoic prompt surfaces · PART 9 §9.6.
- M9 LIFE TREE — R04 Finch birdhouse (care-object home) · R04 Daylio
  mosaic · R04 1SE mashup · R04 Timehop then-&-now · R01 Day One Today
  tab · PART 9 §9.6-9.7 · L-15 Life Calendar grid (lifeos R03).
- Settings & trust surfaces — R03 Standard Notes · R01 Daylio privacy
  onboarding · PART 9 §9.7 · mobbin: Finch (671), stoic. (303), Evernote
  (352).

### Fitness mobbin dataset map (M2 surfaces)
| Dataset | App | Screens | Serves |
|---|---|---|---|
| research-fitness/mobbin-screens-hevy.json | Hevy | 295 | Logging screen anatomy (F-02), previous-session comparison (F-01), rest timer, stats charts (F-28) |
| research-fitness/mobbin-screens-fitbod.json | Fitbod | 216 | Generated-workout presentation, recovery/heatmap surfaces (F-19 context), session pre-load (A7) |
| research-fitness/mobbin-screens-macrofactor.json | MacroFactor | 402 | Body surfaces — trend chart, rate-vs-target, milestone/forecast, weigh-in flow (F-13/F-14/F-15/F-16) |
| research-fitness/mobbin-screens-nrc.json | Nike Run Club | 325 | PR callout + benchmark sessions, streak/achievement surfaces (F-03, F-25 context) |
| research-fitness/mobbin-screens-strava.json | Strava | 709 | Streak/challenge displays, activity summary surfaces (F-24 weekly context), positive-only gamification |
| research-fitness/mobbin-screens-workout.json | Workout family | 946 | Cross-app logging/progress patterns — charts, dashboards, achievements, calendars (general M2 reference) |
| research-fitness/mobbin-query.mjs | — | — | Query helper |

### Nutrition mobbin dataset map (M3 surfaces)
| Dataset | App | Screens | Serves |
|---|---|---|---|
| research-nutrition/mobbin-screens-mfp.json | MyFitnessPal | 290 | Diary anatomy (meal-type tabs), search sheet, food detail, macro ring (N-01, N-11) |
| research-nutrition/mobbin-screens-noom.json | Noom | 529 | Check-in + lesson surfaces, density display patterns (N-12 — neutral restatement) |
| research-nutrition/mobbin-screens-yazio.json | Yazio | 276 | Meal-plan/recipe surfaces, fasting window patterns (N-15) |
| research-nutrition/mobbin-screens-lifesum.json | Lifesum | 345 | Habit-tied nutrition, weekly review surfaces (N-16) |
| research-nutrition/mobbin-screens-zero.json | Zero | 139 | Fasting window ring/timer patterns (N-15) |
| research-fitness/mobbin-screens-macrofactor.json | MacroFactor | 402 | The M3 logging/check-up gold standard (N-01/N-03/N-13 context) |
| research-nutrition/mobbin-query.mjs | — | — | Query helper |

### LifeOS mobbin dataset map (M4/M5/M6 surfaces)
| Dataset | App | Screens | Serves |
|---|---|---|---|
| research-lifeos/mobbin-screens-todoist.json | Todoist | 326 | Task/today surface patterns, filters (L-01 context) |
| research-lifeos/mobbin-screens-things.json | Things 3 | 166 | Disciplined today, areas/projects, Logbook won-archive (L-02) |
| research-lifeos/mobbin-screens-ticktick.json | TickTick | 97 | Smart lists show-if-not-empty (L-07), all-in-one today assembly |
| research-lifeos/mobbin-screens-gcal.json | Google Calendar | 866 | Month grid, agenda day view, year dots (M6 / L-06) |
| research-lifeos/mobbin-screens-cron.json | Cron/Notion | 110 | Calendar+docs day, week-focused UI (M6) |
| research-lifeos/mobbin-query.mjs | — | — | Query helper |

MOBBIN CAVEAT (N-02): Cronometer — the micro-UI gold standard — has NO
mobbin screens (query returned only its app index); M3b needs a dedicated
mobbin pull + research pass at activation; the nutrition report's Cronometer
GUI descriptions (84-nutrient profile, adequacy coloring, deficiency flags)
seed the reference until then.

---

## 8. ENGINE BLOCKS

### engine-1 LOGGING FRICTION DISCIPLINE (LOCKED) — line 321
Full detail in section 2 above. Applies to ALL M2 logging work; default
path ≤2 interactions per set; everything pre-fillable is pre-filled;
friction budget (every new live-logging field must remove more friction
than it adds; anything optional goes to the post-session review);
MINIMAL MODE (pure-checkmark, zero-typing view — same principle as
journaling's progressive deepening).

### engine-2 COACH HEURISTIC ENGINE — REQUIRED DISCIPLINE (NOTED — details
  locked later at the Coach rule-book session) — line 341
Full detail in section 2 above. ~25 named rules committed by M2 alone;
ONE rule-execution architecture; H3 single-owner vocabulary; graceful
degradation; determinism + explainability as the test oracle;
provenance-as-authority; LLM = VOICE LAYER only (render-never-decide;
receives derived facts only; never emits a number the engine didn't
compute; OFF by default; offline = complete product).

---

## 9. THE LIFE TREE DESIGN SYSTEM SECTION (lines 2336-2693)

Idea recorded gen-1 (archived ledger): dedicated tab, huge stylized tree
that actively grows as everything is logged/achieved across all areas;
biggest UI-heavy feature; big review surface; Growth-Rings/10-ring
structure built into the graphic; implementation deferred to M2.

### tree-1 Vision & metaphor (SKELETON — design dim, filled at the Life Tree
  design session; no lock) — line 2345
- What the tree IS (life archive as a growing organism), what it is NOT
  (decoration — every element must mean real data).
- Tone: awe without guilt; dormant ≠ failed.

### tree-2 Tree anatomy (visual system) (SKELETON) — line 2350
- Trunk + the 10-ring structure (Pith → Yew; one ring = one Life, Fully
  Logged qualifying yearly window — locked definition, v2).
- Branches: one per achievement domain (which domains exactly, how they
  fork, how length/canopy encode yearly presence + trophies).
- Foliage/trophies: Sprout → Grove tier mapping, leaf/bud/twig per tier,
  trophy density, "new" states.
- Space & scale: how the tree grows in the viewport over years (decade
  scale without cramping); iPhone PWA ↔ desktop responsive behavior.
- Theme: dark-first tokens, ring/leaf palettes, seasonal or state tints.

### tree-3 Growth data (100% derived — never write-path) (SKELETON) —
  line 2361
- Exact H3 owner feeds: ring count, dayDomainPresence per domain,
  per-tier claim counts, yearly presence, milestone dates.
- Mapping table: data → visual element (every pixel traces to a number).
- Refresh/caching semantics (M2 Analytics-Engine derived cache; when the
  tree re-computes; shimmer vs incremental growth animation rules).
- Growth animation language: what animates (ring closing, branch
  extending, leaf appearing), triggers (unlock event, open tab), and
  duration/rhythm — celebratory but never spammy.

### tree-4 Surfaces & interaction (SKELETON) — line 2371
- Full tab layout: hero tree, overview strip, detail panel.
- Tapping a ring/branch/leaf → derived facts-only detail (domain yearly
  presence, trophy list, ring history); no journal text, no media.
- First-run / sprout state, empty states, dormant-domain states.
- Navigation: tab existence (gen-1), placement per the deferred UI/UX
  ordering pass.

### tree-5 Render & performance (SKELETON) — line 2379
- Heaviest derived block in the app: paint strategy (canvas vs layers),
  skeleton shimmer, never blocking first paint; decade-scale data cost
  bounds; reduced-motion accessibility.

### tree-6 Implementation plan (SKELETON) — line 2384
- M2 scope, build order (data owners → mock render → polish), test
  strategy (widget tests for states, perf gate), mockup in the UI/UX
  pass.

### tree-7 DESIGN SESSION DECISIONS (the schema session record — D-numbers
  per LANDS) — line 2388
SESSION PLAN (the 10-step implementation map; living roadmap with
statuses: life-tree-design/PLAN.md):
  1. The 6 open decisions — DONE (D085-D088)
  2. Refactor the organ map — DONE (D088; VISION §3 locked table)
  3. Feature scan (incl. the ACHIEVEMENT-SCAN sub-step) — NEXT
  4. Archetype mockups (design-time cohesion validation)
  5. Input map (SCHEMA.md rows, user-approved, D-numbers)
  6. Engine architecture (derivation cache, state model, renderer
     design + perf budgets, test harness)
  7. Trait space + visual design (mockups feed this)
  8. Engine contract (zero-decision-fatigue spec)
  9. Build sequencing (phase 0 = renderer perf spike, then organs →
     visuals → navigation → anatomy → review mode)
  10. Record into TEMP-PLANNING tree-1..tree-6 + docs pass
This feature-scan brief IS the Step-3 deliverable (input side).

- D085 SEASONALITY DRIVER (LOCKED, user yes — Option C layered) — line
  2403: the calendar year is the tree's botanical cycle — spring bud
  break + bloom, summer full canopy, autumn fruit + color, winter honest
  dormancy; the ring closes at the year boundary (calendar-anchored
  heartbeat, every user, every year). INTENSITY: user data modulates the
  season visuals — rich journaling spring = dense bloom; heavy gym
  summer = thick latewood; active winter logging = greener canopy than
  the calendar allows; quiet year = sparse bloom, honestly shown.
  BOTANY: MASTER-Botany-Reference.md PART 9 (seasons = the tree's own
  life; conditions = its health). ENGINE: season-phase function
  (calendar) + intensity modifiers (data per season); why-panel explains
  both halves ("every tree blooms in spring; THIS density is your March
  journaling"). INPUTS: calendar date + per-season data intensity
  (journaling density, gym volume, logging activity).
- D086 SUPER-HARD ACHIEVEMENT VISUAL (LOCKED, user yes — Option C
  hybrid): deterministic core + derived accents. The achievement grants
  its fixed designed transformation (same for every earner — the SHAPE
  of the event); the user's own data colors it (palette / accent details
  derived from their domain balance). Fully deterministic +
  explainable; no two earners' trees show it identically because their
  lives differ. Anti-farm intact (still a pure function of data).
  USER CORRECTION (recorded — important): the Ghost-in-the-Machine
  family is NOT the only/named hardest set — there are QUITE A FEW
  achievements across families that need cohesive mapping. The
  rarity-tier ladder must be built from the FULL scanned achievement
  list (every family, every tier), not a single named family. INPUTS:
  achievement unlocks + domain-balance derived accents.
- TREE-7 ADDENDUM (plan amendment, user-directed): the feature scan
  step (Step 3) explicitly includes an ACHIEVEMENT-SCAN sub-step:
  enumerate EVERY achievement family + every tier in the locked
  achievement system (not only Ghost-in-the-Machine), and map them
  cohesively onto the rarity-tier visual ladder (common flower →
  special flower → large visual → the top-tier transformation). Every
  achievement family lands somewhere on the ladder; nothing decorative,
  nothing un-mapped.
- D087 HABIT MAPPING (LOCKED, user yes — Option C, habits as BUDS):
  every active habit = a bud on the habit branch. Dormant when unworked;
  swelling with streak momentum; bursting into new growth/leaves on
  completion; withering honestly when abandoned; abandoned habits leave
  BUD SCARS (the tree records habit history like a real tree records
  its buds — MASTER part 4.3/4.6.11). Habit completions feed the
  extension engine (growth from the burst). ONE system — the bud is a
  native part of the tree, not a second visual layer. INPUTS: habit
  rows (streak momentum, completion, abandonment — bud state feeds).
- D089 MODIFICATION RARITY SPLIT (LOCKED, user yes — 2026-08-29; amends
  D088 C): modifications are RARE ITEMS — reserved for genuine years of
  consistency; at a glance, the structural modifications a stranger sees
  on the tree are only the ones earned through years. THE SPLIT (two
  tiers): (1) RARE STRUCTURAL MODIFICATIONS (silhouette-level, visible
  at a glance): caudex, buttress roots, phyllodes, cladode segments,
  thorns, storage leaves. HARD TENURE FLOOR: none manifest before real
  qualifying years exist (floor = 2+ qualifying years; caudex and
  buttress at HIGHER tenure — exact floors in the engine contract). (2)
  SUBTLE CHARACTER DETAILS (visible in close-up / anatomy views, never
  the silhouette): reaction wood, epicormic shoots, mycorrhizal/coach
  detail, bracts, bud scales, contractile roots, stolons,
  storage-taproot detail, SPINES (100-day streaks — DEMOTED from the
  structural tier). No tenure gate — the tree's fine texture, rewarding
  every user without diluting the rarity of the structural layer.
  AMENDED FROM D088: adaptation rows 3 (thorns stay structural 365-day;
  spines demoted to subtle), 12 (storage leaves moved to
  structural/rare), 2/8/9/10/11/13/14 (kept as subtle details).
- D088 LIFE TREE BRANCH SYSTEM + ADAPTATION LAYER + GRADIENT COHERENCE
  (LOCKED, user yes — 2026-08-29; recorded in absolute detail) — line
  2487:
  A. BRANCH SYSTEM v4:
    - 5 FIRST-ORDER BRANCHES = the 5 FIXED app sections (journal,
      habits, gym, nutrition, goals) — ALL present from day one. The
      seedling's structure is set at start; what varies is growth.
      Grounded correction (user): no "new domains" appear and no domain
      "dies" — the app's sections are fixed tabs; the tree mirrors
      EFFORT RHYTHMS across fixed branches, not invented domain
      life-cycles. No start-dates, no branch scars.
    - LEADER (apical dominance): the most SUSTAINED domain leads the
      crown — the silhouette encodes the user's center of gravity
      (MASTER 4.5; data: per-domain presence + consistency).
    - FORKS (second-order): derived ONLY from sustained differentiation
      of genuine sub-features (gym: strength/cardio; nutrition:
      food/fasting/hydration; journal: photo/voice/text) — no templates,
      no made-up splits (the L-11 sprawl guardrail applied inside the
      tree). NOTE: these fork definitions enumerate tree-relevant
      sub-inputs: gym strength vs cardio (D045 kinds), nutrition food/
      fasting (N-15)/hydration (N-16), journal photo/voice (C-11)/text.
    - TWIGS (the canopy mass — the beauty answer): one twig per month of
      sustained presence per domain; the canopy density IS consistency
      made visible; gaps are honest. A consistent user has ~10 twigs/
      year per active branch.
    - SCALE SEPARATION (each level = a time scale of the data): trunk+
      rings = years | branches = domains | forks = sub-features | twigs
      = months | leaves = entries/trophies (days) | buds = habits
      (streaks) | flowers = achievements (rarity) | fruits = goals
      (milestones). Zoom out = years; zoom in = days; every scale is
      data.
    - BRANCH RINGS: each branch carries its own rings = the years that
      domain was ACTIVELY PRESENT (real botany: branches have rings
      too — MASTER 7.2). Trunk rings = all years; branch rings = that
      domain's years.
    - DORMANCY + REVIVAL (no death, no scars): an inactive branch stops
      growing, goes dormant, loses its seasonal leaves (deciduous
      honesty — D085), keeps its structure, and resumes growth from its
      TIP BUDS when the user returns. Why-panel: "your gym branch has
      been dormant since June — it will resume when you do."
    - FRUIT SPURS = completed goals, on the branch they belong to
      (short stubby fruit-bearing branchlets — MASTER 4.5).
  B. THE DUALITY PRINCIPLE (the UI relation — user question): every
    section UI is the LOCAL view of its tree organ — ONE derived state,
    ONE animation language, TWO scales. Habits tab = the bud garden (the
    habit card's streak ring IS the bud swelling; the swipe-complete
    burst IS the bud bursting); journal = leaves (entry states: new =
    young leaf, photo = mature leaf); nutrition = the sap monitor (the
    vascular ring state in the nutrition UI AND the tree's
    cross-section; logging a meal = sap flowing, visible in both); gym
    = branch growth state (strength standards = branch girth trend);
    goals = the orchard (progress = fruit swelling, completion = fruit
    on the spur); achievements = the garden (earned = bloomed, at both
    scales). The tree is the global view of the sections; each section
    is the local view of its organ.
  C. THE ADAPTATION LAYER (modifications):
    - DEFINITION: modifications = the tree's LONG-TERM ADAPTATIONS to
      sustained life patterns — the rarest structural layer, slower
      than flowers (multi-year commitments, never fast); a TRANSFORM
      layer (they modify existing organs: trunk → caudex, branches →
      thorns, roots → buttress, leaves → phyllodes, wood → reaction).
    - GOVERNING RULE (user directive): the achievement system is the
      TRIGGER AUTHORITY — NO parallel trigger systems. Where an
      existing achievement already encodes a condition (365-day
      streaks, qualifying years, decade milestones), the achievement IS
      the trigger, and the tree's layers visualize that same
      accomplishment at different scales (flowers = bloom scale;
      modifications = structural scale). One condition set, two visual
      layers. The achievement-scan sub-step produces the correlation
      table directly.
    - THE ADAPTATION MAP (life pattern → trigger → master ref), 14
      rows:
      1. CAUDEX (trunk reserve tank, baobab dignity) — unbroken
         qualifying years (longevity) — MASTER 4.6.10.
      2. REACTION WOOD + EPICORMIC SHOOTS — comebacks: a dormant branch
         resumes, the revival point shows visibly different wood + fresh
         shoots from old wood — MASTER 7.4/4.5.
      3. THORNS (365-day) + SPINES (100-day) — TIERED streak armor on a
         domain — MASTER 4.6.8/6.5.2; existing streak achievements as
         triggers. [D089: thorns stay structural 365-day; spines
         DEMOTED to subtle]
      4. BUTTRESS ROOTS — sustained multi-domain balance (3+ domains
         active consistently) — MASTER 5.6.5.
      5. PHYLLODES — sustained sparse-but-stubborn logging (the tree
         adapts to survive on little) — MASTER 6.5.3.
      6. CLADODE SEGMENTS — streak-without-entries (the branch lives
         leafless: habits checked, nothing journaled) — MASTER 4.6.6;
         derived from streak vs entry-volume divergence.
      7. TENDRILS — long-horizon goals in progress (the 10-year pledge
         reaching outward); completed goals = fruit on spurs — MASTER
         4.6.7/6.5.1.
      8. STORAGE TAPROOT + WINTER STORAGE — the foundation years + quiet
         months banked (root cross-section during winter dormancy shows
         the reserves) — MASTER 5.6.1/9.5. [D089: storage leaves moved
         to structural/rare — this row's "storage leaves" detail]
      9. CONTRACTILE ROOTS — consistency trending UP year over year
         (the tree plants itself deeper) — MASTER 5.6.9.
      10. MYCORRHIZAL/NODULE CHARACTER — sustained coach engagement
          (the app's one true symbiont, visible in the root section) —
          MASTER 5.4.
      11. STOLONS — sustained CROSS-DOMAIN influences: the L-10 insight
          engine's findings made structural (the influencing branch
          grows toward the influenced one) — MASTER 4.6.2; FEED: L-10
          (LOCKED — the insight engine is the input).
      12. STORAGE LEAVES (succulent) — media-rich entries (the leaf
          holds the memory's substance) — MASTER 6.5.8; FEED: photo/
          media share of entries.
      13. BRACTS — the bloom's ceremonial presentation (the F-03 flair
          wrapping the flowers) — MASTER 6.5.10. [F-03 ceremony language
          tie]
      14. BUD SCALES — dormant habits' winter wrapper (the D087 bud's
          protected state during quiet periods) — MASTER 6.5.11/4.3.
    - SCRAPPED (user): AERIAL ROOTS / velamen — removed from the map.
    - HONEST SKIPS (documented — no zombie forcing): haustoria
      (parasitic — the tree has NO parasitic layer by design);
      pitcher/bladder/snap traps (require detecting "hard times" — no
      mood data by design, C-04 rejected — underivable);
      rhizomes/bulbils/offsets (clonal spread needs a second tree —
      there is only the user's); pneumatophores/knee/floating/
      assimilatory roots (no flooded-soil/aquatic equivalent);
      pseudobulb (epiphyte storage — merged into the scrapped aerial
      roots); scale leaves/bulb scales (structural, merged). Future
      features may earn new mappings (e.g., a future "phase shift"
      concept → epicormic resprouting) but nothing is forced today.
  D. GRADIENT COHERENCE MODEL (the anti-zombie; user: NO single
    environment — overlaps must be allowed):
    - 4 CONTINUOUS AXES (0.0-1.0), each a derived measurement from the
      event log (positions, NOT categories/buckets): RESOURCE
      (lush↔sparse: average logging volume per active day across
      domains — entries/day, photos/day, meals/day, workouts/week),
      RHYTHM (steady↔bursty: variation of weekly activity across the
      year — streak patterns, presence gaps), BALANCE (single-focus↔
      multi-domain: the distribution of activity across the 5 domains),
      TENURE (young↔ancient: qualifying years + longest continuous
      presence).
    - POSITION = where the user lands on each axis; overlaps are natural
      in the middle ranges (the MEDITERRANEAN position: a user at
      resource 0.45 + steady rhythm + mid balance is both
      drought-tolerant AND cold-season adapted).
    - ONE CHARACTER PER ORGAN (trunk / root system / leaf family /
      branch structure) — same-organ contradictions are the hard floor,
      always forbidden.
    - CONTRADICTION BY CONSTRUCTION: each adaptation has a required
      SIGNATURE on the axes; contradictory adaptations cannot co-occur
      because both read the SAME numbers (caudex requires tenure≥0.7 +
      resource≤0.6; buttress requires balance≥0.7 + resource≥0.6 — one
      user cannot be at resource 0.55 AND 0.65 at once). The position
      itself decides what can grow — no compatibility matrix needed for
      the hard cases.
    - RANK RULE: when several adaptations qualify on one organ, the
      strongest data support wins the DOMINANT character; compatible
      runner-ups render at a SUBTLE tier (the trunk is caudex-dominant
      but the leaves carry a phyllode tint).
    - UNIVERSAL ADAPTATIONS (no axis restrictions — appear anywhere):
      reaction wood, epicormic shoots, mycorrhizal/coach symbiosis,
      bracts, contractile roots, bud scales.
    - WORKED EXAMPLE (the overlap): gym+journal strong (high resource,
      high balance), nutrition sparse (low resource on that domain
      pattern), 2 qualifying years. Eligible: buttress (balance+
      resource), stolons (L-10 gym→journal influence), mycorrhizal
      (coach engagement), reaction wood (if a dormancy happened). NOT
      eligible: caudex (tenure too low), phyllodes (resource too high),
      thorns (no streak achievement). Rich multi-adaptation tree — and
      caudex+buttress is impossible for ANY user.
    - VERIFICATION: the archetype mockups + seeded-data stress tests
      include a botanical-contradiction check (a generated tree must
      pass every adaptation's axis signature or the engine does not
      ship).
  E. INTEGRATION RULES:
    - ACHIEVEMENT-TRIGGER + GRADIENT-FILTER: the achievement EARNS the
      right to the adaptation; the axis position decides MANIFESTATION;
      FLOWER-LAYER FALLBACK — every achievement is visualized at the
      flower layer at minimum, so NO achievement is ever unrewarded (a
      365-day streak in a rainforest-character tree grows a
      thorn-flower, not thorns).
    - WHY-PANEL explains both halves: the trigger ("your 400-day gym
      streak") + the position ("your resource 0.58 position allows
      thorns, not rainforest roots").
  F. THE CONSISTENCY PRINCIPLE (user directive, verbatim intent): THE
    MOST CONSISTENT USERS GET THE MOST BEAUTIFUL TREES WITH THE MOST
    MEANINGFUL MODIFICATIONS. Consistency compounds at every layer:
    tenure axis, branch rings, canopy density (twigs), caudex,
    reaction-wood history, winter storage. A consistent user's tree is
    structurally richer at EVERY level — the tree is the mirror of
    sustained effort, and sustained effort is rewarded with depth, not
    decoration.

---

## 10. D-NUMBER DECISIONS (D082-D089 + referenced earlier numbers)

Complete D-number inventory found in TEMP-PLANNING.md (14 distinct):
D018, D031, D038, D039, D060, D069, D082, D083, D084, D085, D086, D087,
D088, D089.

### Series start
- D082 (series start — line 6): gen-1 decisions live in docs/; new
  decisions continue DecisionLog numbering from D082 onward. Every
  LOCKED entry below implicitly gets a D-number at the docs pass.

### Skill-install decisions (input-adjacent: they arm the tree build)
- D084 SKILL INSTALL — SECURITY SUITE x2 (LOCKED, user yes —
  2026-08-29) — line 92: installed (a) openai/skills@security-threat-
  model (official OpenAI, 25.3K-star repo, 4.9K installs, ALL 3 audits
  pass) — repo-grounded AppSec threat modeling; serves the M3 OAuth
  gate + the engine build. (b) addyosmani/agent-skills@security-and-
  hardening (29.3K installs, 90.5K-star repo, ALL 3 audits pass) — web
  security hardening for the Flutter Web/PWA surface + its
  security-checklist.md reference fetched. REJECTED: getsentry/skills@
  security-review (14.8K installs — Snyk audit FAIL on skills.sh).
- D083 SKILL INSTALL — FLUTTER-EXPERT (LOCKED, user yes — 2026-08-29)
  — line 112: installed jeffallan/claude-skills@flutter-expert into
  .opencode/skills/ — Riverpod/Bloc state management + performance
  profiling references — "the app's exact stack (Riverpod, Flutter);
  supports the Life Tree engine build (off-UI-thread derivation via
  compute(), RepaintBoundary render isolation, DevTools profiling)."
  REJECTED: skills.sh entry "flutter/agent-plugins@flutter-performance"
  — stale index (verified against the repo tree).

### Fitness closure supersession
- D060 SUPERSESSION (recorded — Roadmap.md:283-288 fitness surface
  CLOSED (D060): no new features, revisit only with real usage) — line
  128: the gen-2 fitness mandate (user-approved F-series) SUPERSEDES
  D060 for the named locked candidates; the closure list is amended at
  the docs pass (DecisionLog D082+ entry records the override).
  Roadmap idea-park items touched by the series (N3 warm-up sets →
  F-05, N5 recovery → F-19) are re-opened by those locks explicitly.
  Roadmap.md:283-288's clause that N3/N5 remain park-able is amended
  (they are re-opened, not park-able).

### Nutrition do-not-build boundary
- D069 BARCODE/SCANNER DISTINCTION (recorded inside N-09) — line 1017:
  the D069 do-not-build AI food scanner is the PHOTO-AI scanner (meal
  estimation — stays rejected, evidence-backed: 1/3-calorie error +
  cloud-bound); EAN barcode lookup (N-09) is a DIFFERENT feature,
  never blocked, now approved. DecisionLog entry records the approval
  + D069 distinction.

### Referenced earlier decisions (context, not new)
- D018 — no-push rule (untouched by F-02's rest timer; in-app only).
- D031 — physique-photo timeline protocol (boundary photos anchor F-15's
  rung protocol; C-06 Then-&-Now companion).
- D038/D039 — the deferred-category precedent for the "Research
  leftovers — NOTED" pipeline (LANDS = docs/DecisionLog.md as OPEN
  ITEMS, category = deferred).

### Life Tree decisions (the tree-7 records — all LOCKED)
- D085 SEASONALITY DRIVER — detail in section 9 (tree-7).
- D086 SUPER-HARD ACHIEVEMENT VISUAL — detail in section 9 (tree-7).
- D087 HABIT MAPPING — detail in section 9 (tree-7).
- D088 LIFE TREE BRANCH SYSTEM + ADAPTATION LAYER + GRADIENT COHERENCE —
  detail in section 9 (tree-7).
- D089 MODIFICATION RARITY SPLIT (amends D088 C) — detail in section 9
  (tree-7).

---

## 11. OTHER LEDGER CONTENT IMPLYING INPUTS / FEATURE SURFACE

### House rules (lines 23-38)
- Every decision gets (LOCKED, user yes) + a D-number (D082+) written
  into docs/DecisionLog.md. No silent assumptions.
- No new dependencies without a DecisionLog entry + user approval.
- Achievement catalog relationship: docs/Gamification.md:129-141 (v2 =
  THE WHAT), TEMP-PLANNING-Achievement-Spec.md (E0-E13, 131 trophies +
  47 rungs = THE WHEN), ledger = THE WHY.
- Pipeline re-run readiness (A1a→G runbook in doc draft framework/
  RUNBOOK.md); source freeze from the moment a pipeline run starts.

### Label families / disambiguation legend (lines 40-66)
- Families: candidate-C (C-01…C-15, research-journaling), candidate-F
  (F-01…F-32, research-fitness), audit (audit-1…audit-13), tree
  (tree-1…tree-6 — note the legend omits tree-7, which exists in the
  file as the DESIGN SESSION DECISIONS record), engine (engine-1,
  engine-2). Additional status tokens: AGREED IN PRINCIPLE (F-27),
  PENDING (C-15 → Life Tree). Rejected entries carry a RESTING PLACE
  line (do-not-resurrect contract); skipped entries carry a REVISIT
  line (trigger that re-opens them); both must survive any docs pass.

### Open items checklist (lines 68-82) — audit anchors
- audit-1 dashboard (blocks, density, glance-value; shell-level
  concerns) · audit-2 journal (compose, timeline, search, media) ·
  audit-3 habits (check-off, streak, review) · audit-4 gym (session,
  history, PR, standards) · audit-5 nutrition (log, targets, macros) ·
  audit-6 body/weight (weigh-in, trends, physique) · audit-7 media
  (capture, archive, vault) · audit-8 settings (groups, reachability;
  shell-level) · audit-9 achievements/rings surface · audit-10 coach
  lines/surfaces · audit-11 Incorporate list · audit-12 Unlocks &
  extras · audit-13 LIFE TREE DESIGN SYSTEM (main goal).

### Research leftovers — recorded, NO decision yet (NOTED; lines
  2094-2145) — future input candidates, each LANDS as OPEN ITEMS
  (deferred category, D038/D039 precedent), never scattered into
  feature docs as decided scope:
- OCR SEARCH OVER ATTACHED PHOTOS (NOTED — future): extends J2 to image
  text; needs a PWA OCR path decision (local WASM vs defer); revisit
  when J2 ships.
- REGEX-CAPABLE SEARCH (NOTED — J2 detail): fold into J2's matcher.
- COMMAND PALETTE Ctrl+P (NOTED — GUI): UI/UX ordering pass.
- ATLAS / MAP VIEW OF ENTRIES (NOTED — future): spatial life-log; pairs
  with M6 periods/travel + physique timeline; revisit at M6.
- MULTIPLE JOURNALS vs SINGLE TIMELINE (NOTED — design pole): current
  direction = single timeline + Life Areas (folders-lite).
- DEFAULT-INBOX + TRIAGE (NOTED — capture GUI): UI/UX ordering pass.
- ONE-ENTRY-PER-DAY CONSTRAINT MODE (NOTED — pole): revisit if catch-up
  spirals show in real use.
- SMART FILL BACKFILL (NOTED — future): 1SE camera-roll backfill;
  revisit with habits/grace v2 work.
- GOAL/STREAK PROGRESS RING IN EDITOR (NOTED — GUI): UI/UX ordering
  pass.
- NO-FAIL JOURNALING (NOTED — coach): Coach rule-book session
  candidate.
- OPTIONAL FOCUS GATE (NOTED — coach): Stoic app-blocking; Coach
  rule-book session candidate.
- PRIVACY-FIRST ONBOARDING COPY (NOTED — UX): welcome/onboarding
  polish.
- ENCRYPTED EXPORT ARCHIVES (NOTED — future): revisit with backup/
  export v2 (M10 Drive P2 planning).
- YAML FRONTMATTER ON EXPORT (NOTED — J5 detail): fold into Year Book
  export format if wanted.
- QUOTE-YOUR-OLD-SELF / TRANSCLUSION (NOTED — C-08 family): extend
  links with "insert quote from" action — revisit then.
- MORNING/EVENING RITUAL RHYTHM (NOTED — coach): Coach rule-book
  session candidate (with C-14).
- RESEARCH ANTI-PATTERNS (NOTED — guardrail reference): paywall nagging
  (Reflectly), punishment loops (Habitica), cloud-only memory
  (companion graveyard), training on content (Rosebud ToS) — documented
  no-goes wherever nudges, gamification, or AI are described.

### APP MAP (lines 2242-2332) — the app's surface inventory
- A. Built / in progress (M0-M1): (1) core shell & navigation (tabs
  Dashboard/Journal/Habits/Settings, bottom bar mobile / left rail
  desktop, dark-first theme, responsive); (2) welcome/onboarding
  (3-step first run: what PersonalOS is, first habits, first journal
  entry); (3) dashboard — BUILT: today section (briefing + habit ticks
  + capture), Coach note, goals/tasks placeholders, streak ring,
  storage card, habit rows; PLANNED: calendar/heatmap strip (M6),
  strength snapshot (M2), weekly review/Coach note block (M2+); (4)
  journal — compose (text + photos + vlogs), chronological timeline,
  tags, Life Areas, edit/delete with event history, media thumbs +
  vlog capture; M1 expansion pending (J1-J6 + physique-photo timeline);
  (5) habits — today's list, one-tap check-off, habit detail sheet
  (streak, 7/30-day indicator), edit/create/archive, Life Areas; (6)
  settings & data — settings groups, export/restore, recovery screen,
  storage meter + data section.
- B. Services & data layers: (7) data layer — drift/sqlite WASM
  database, models, repositories (the ONLY storage touchpoint),
  adapters, event log (single behavior history), isImported flags; (8)
  services — storage, media (MediaRepository; blob handling), web,
  coach stub (M0 rule: 3-missed-days line), growth (growth_stage.dart
  — the Life Tree seed); (9) achievements catalog (cross-cutting, at
  repo root) — v2 = THE WHAT, TEMP-PLANNING-Achievement-Spec.md = THE
  WHEN (E0-E13, 131 trophies + 47 rungs), Gamification.md = THE WHY.
- C. Planned (milestone homes): (10) Fitness & Body (M2) — gym
  sessions, templates, exercises, PR/est-1RM (Epley), standards,
  records vault, deload, body metrics, physique timeline (audit-4 +
  audit-6); (11) Nutrition (M3) — food log, meals, recipes, macros
  (kcal/protein/carbs/fat), targets (TDEE), weigh-in resolution,
  macro-gap bar, weekly check-up (audit-5); (12) Routine & Briefing
  (M4) — daily routine templates, briefing (audit-3); (13) Goals &
  Tasks (M5) — goals with milestones/tasks, plan adherence,
  projections (audit-11); (14) Calendar & Periods (M6) — year heatmap,
  day view, plan-vs-actual, vacation/trip periods; (15) Analytics
  Engine & Gamification (M7) — H3 owner functions, XP policy (locked),
  streak grace, day activity score, trophy engine
  (achievement.unlocked events), Coach tie-in loudness (audit-9/10);
  (16) Full Coach (M8) — rule catalog session (deferred by design),
  coach_outputs weekly review, strictness, reflections (audit-10);
  (17) LIFE TREE (M9 — MAIN GOAL of this generation) — dedicated tab,
  huge stylized growing tree, 10-ring trunk, domain branches, tier
  foliage; design system spec = this file's main section; (18) Drive
  P2/P2.5/P3 (M10-M13) — backup, entity sync, media blob sync, media
  vault.
- Map notes: "The Life Tree sits on top of analytics feeds (M7) + rings
  data — its design section assumes those locks, nothing earlier."

### Unlocks & extras (lines 2229-2233) — _TO FILL_ (user picks; each item
  must state its interaction with locked XP/trophy rules: no XP for
  trophies, anti-farm gates). NOT YET DECIDED.

### Refactor proposals (lines 2235-2238) — _TO FILL_ during audits.
  NOT YET DECIDED.

### LANDS convention (line 91): the house rule requires a D-number per
  decision (D082+); entries in the fitness group do not repeat
  "DecisionLog (D082+)" in every LANDS — READ IT AS IMPLIED for every
  LOCKED entry.

---

## 12. INPUT SURFACE SUMMARY (what the tree can read)

Derived from the ledger as the exhaustive input inventory for the Life
Tree engine (Step 5 input map precursor):

Journal domain: entries (text/photo/vlog/voice — C-11), event-log
context chips (C-03), entry links + mentions (C-08), memory-hide flags
(C-05), physique photos + compare actions (C-06/D031), return-after-gap
events (C-03/C-09), pause records (C-09), area fields (C-07, future).

Habits domain: habit rows with streak momentum, completion, abandonment
(D087 buds), grace/quiet-week/pause semantics (C-09), auto-ticked
veggie/water check-ins (N-16), adherence semantics (done-differently —
F-23/F-25/N-10).

Gym domain: sessions with setType W/D/F labels (F-05 — the honesty
input), PR events (F-03/F-06), est-1RM + TM (F-10), e1RM adjust signals
(F-09), volume bands + decision table (F-08), cascade state (F-12),
training form CTL/ATL/TSB (F-19), recovery estimate + ramp alarms
(F-20), decayed loads + absence classification (F-11), adapted markers
(F-23), strength ratios + DOTS score (F-17/F-18), push:pull + squat:
hinge ratios (F-29), sets-per-muscle data (F-28), "adapted" marker.

Nutrition domain: food rows with provenance tiers + source producers
(N-01/N-02: bundled USDA / cached / online; Manual/Food DB/Pack/Scale/
Scanner), barcode scans (N-09), gram-anchored portions (N-11), plan-
confirmed meals + gap rebalance (N-04), pack/containers/line-items
(N-05), substitutions with macro-band adherence (N-10), free-foods
honesty footnotes (N-06), eating-window in/out classification (N-15),
implied TDEE + weigh-in gates (N-07), compliance math (N-03), exercise
kcal facts (N-08), micronutrients (M3b — future), veggie tags + water
logs (N-16).

Body domain: weigh-ins, time-indexed EMA trend + rate + prediction
(F-13), rate-vs-target + water-jump dots (F-14), ladder progress +
forecast ranges + boundary photos (F-15), Eyes-Closed mode (F-16),
current-BW rolling average (O3/F-17).

Goals domain: NL-parsed goals/tasks (L-01), slip states + won-archive
(L-02), pace lines + on/off-track (L-03), fruit-spur completions
(D088).

Routines/calendar domain: routine_slot_logs planned-vs-actual (L-05/
L-06), deviation badges (L-08), day-pattern cadences (L-13),
period-level plan/track (L-06c), year heatmap (M6), period structures
(vacation/term/holiday — F-11 correlations).

Cross-domain: L-10 insights (with n + confidence; mood via derived
proxies — C-04 rejection), event log (single behavior history,
isImported flags, compensating revoke events), achievement unlocks
(E0-E13 catalog), day activity score (M7), 4 gradient axes (RESOURCE/
RHYTHM/BALANCE/TENURE — D088), season-phase + intensity (D085).

ABSENT BY DESIGN (no input exists): mood (C-04 rejected — proxies
only), user effort feedback (F-21/F-22 rejected — F-09 inference only),
photo-AI meal estimation (D069), live finish estimates (L-04), repair
tokens (C-09), gym profiles/equipment presets (F-31), movement-pattern
replacement (F-32).

---

## 13. COUNTS

- C-series: 6 LOCKED (C-03, C-05, C-06, C-08, C-09, C-11) · 3 REJECTED
  (C-01, C-02, C-04) · 5 SKIPPED (C-07, C-10, C-12, C-13, C-14) · 1
  PENDING (C-15).
- F-series: 25 LOCKED (F-01…F-20, F-23, F-24, F-28, F-29, F-30) · 4
  REJECTED (F-21, F-22, F-31, F-32) · 2 SKIPPED (F-25, F-26) · 1 AGREED
  IN PRINCIPLE (F-27).
- N-series: 18 LOCKED (N-01…N-18; no rejected/skipped N-entries).
- L-series: 14 LOCKED (L-01, L-02, L-03, L-05, L-06, L-07, L-08, L-09,
  L-10, L-11, L-12, L-13, L-14, L-15) · 1 REJECTED (L-04).
- Engine blocks: engine-1 LOCKED · engine-2 NOTED.
- Tree: tree-1..tree-6 SKELETON (unlocked design dims) · tree-7 holds 5
  LOCKED D-decisions (D085-D089).
- TOTAL: 63 locked feature decisions + engine-1; 8 rejected feature
  decisions (C-01, C-02, C-04, F-21, F-22, F-31, F-32, L-04); 7
  skipped; 1 pending (C-15); 1 agreed-in-principle (F-27).
- D-numbers in file: 14 distinct (D018, D031, D038, D039, D060, D069,
  D082, D083, D084, D085, D086, D087, D088, D089).