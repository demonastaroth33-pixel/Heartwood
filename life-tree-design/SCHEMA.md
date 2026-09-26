# LIFE TREE SCHEMA — the input map (DESIGN-SESSION DRAFT)

> **Status:** draft skeleton — the container for the complete input map.
> To be filled during the schema session (scan every feature → map every
> input → approve row by row with the user). Nothing here is locked.
> Authority for botany: `research-botany/MASTER-Botany-Reference.md`.
> Authority for the vision: `life-tree-design/VISION.md` (17 principles).

## 1. What this document is

The SCHEMA answers ONE question for every feature in the app:
**what does this input do to the tree, exactly?** — which organ, which
botanical mechanism, which threshold, which visible change, and why.
Its purpose is zero decision fatigue at implementation time: every
"what does a cutting phase do?" question is answered here before a
line of code is written.

## 2. The feature inventory (to be scanned from the docs)

### 2.1 The input-class framework (LOCKED — the future-proofing rule)

The input map is built on INPUT CLASSES, not per-feature entries. Every
input in the app — now or future — belongs to one of 7 classes; each
class has its locked tree mapping. A future feature classifies its
inputs into existing classes at design time (one-line classification,
alongside the event-log rule and L-11 guardrail) — inherited mapping,
zero new decisions. Only a genuinely unprecedented input class is a
deliberate DecisionLog event.

| Class | Examples (today) | Tree mapping (locked) |
|---|---|---|
| Content entries | journal entries, photos, voice notes, captures | leaves (media-rich → storage leaves) |
| Completions | habit completions, check-ins, task completions | bud bursts + extension growth |
| Measurements | weight, macros, calories, workout metrics, logged numbers | vascular/sap system + branch wood quality |
| Dated events | milestones, anniversaries, dated moments | twig anchors / seasonal moments |
| Goal progress | goal updates, milestone progress | fruit swelling / tendrils |
| Achievement unlocks | any achievement, any tier | flowers (auto-classified by tier) |
| Presence/absence | any activity or silence | rhythm axes, dormancy, twig production |

### 2.3 ARTIFACT 1 — THE CANONICAL DOMAIN TABLE (LOCKED — D104 + the
2026-08-29 review pass; every system reads this table)

Two-level model: PRESENCE-DOMAINS (what counts in rings/axes/tint) vs
BRANCHES (what the tree grows). Presence = creation events only
(D100 in-window predicate); content organs are mutation-aware.

| # | Presence-domain | Presence owner (creation events) | Tree attachment | Twig source | Families |
|---|---|---|---|---|---|
| 1 | Journal | journal.created + reflection.created | journal branch (1:1) | journal-active days | I (17) |
| 2 | Habits | habit.completed + habit.rest_planned (protected) | habit branch (1:1) | habit-active days | II (15) |
| 3 | Gym | workout.completed (+ pr rides) | gym branch (1:1) | workout-active days | III (28 + 47 rungs) |
| 4 | Nutrition | nutrition.logged | nutrition branch (1:1) | nutrition-active days | IV (14) |
| 5 | Body | body.weighed (first-of-day canonical) | gym branch's BODY-FORKS (sub-branch); body days count toward the GYM branch's presence — forks are render structure, never a gate (D115) | weigh-in days feed the body-forks' twigs | V (16) |
| 6 | Media | media.added (entry + vault) | journal branch's MEDIA-FORKS (sub-branch); media days count toward the JOURNAL branch's presence — forks are render structure, never a gate (D115) | media days feed the media-forks' twigs | VII (12) |
| 7 | Goals | task.completed + goal.completed | goals branch (1:1) | goal-active days | (fruits; IX is separate) |
| 8 | Periods/Vacation | logged vacation periods + habit.rest_planned (PROTECTED presence) | NO branch — feeds the base + dormancy logic | none (absence is the signal) | VI (4) blooms at the base |

SPECIAL ATTACHMENTS: VI Elsewhere → the tree's BASE (root flare);
VIII Rings (20) → the TRUNK (verified: VIII is entirely trunk
trophies — the per-domain yearly chains live in their own families);
IX Full Circle (5) → the CROWN CENTER (the integration point).

REVIEW FINDINGS (2026-08-29, all recorded): (1) the
periods/vacation entity is a NEW input (doc-only deload/periods
table) — joins as protected presence (the M-5 mechanism's data
ground); (2) VI-3/VI-4 are journal-vehicle trophies — base
attachment kept (family identity wins); (3) V-5/6/7 are
photo-driven body trophies — the body-forks render photo-derived
trophies (C-06's data home).

The 7→5 mapping: journal→journal · habits→habits · gym→gym ·
nutrition→nutrition · body→gym(body-forks) · media→journal
(media-forks) · goals→goals. Periods→base.

### 2.4 ARTIFACT 2 — THE THRESHOLD REGISTER (LOCKED 2026-08-29 — all
groups approved; DEV-TOOLS tuning surface required)

Every number in the tree, one list — the "economy without numbers"
(R4) dies here. ALL groups (A–F) approved by the user with two
locked notes: (1) THE DEV-TOOLS TUNING SURFACE (user directive):
every number in this register must be playable during the
development/visual-testing phase — a dev-only debug panel that
tweaks any value and drives a live re-derivation + re-render (the
archetype mockups and the perf gate use it); never shipped to users.
(2) The RESOURCE normalization ceiling (F4) was calibrated by the
paper run — LOCKED at 12 (D116): at 20 nearly every life read as
sparse; at 12 the decade user lands ~0.6–0.8. Still dev-tunable.

GROUP A — THE PRESENCE BARS:
A1 grace window: +-3 days (written-in-window presence, D100)
A2 qualifying-event rule: journal >=40 words non-imported (locked) ·
  gym >=1 real logged set · nutrition >=1 real food-log · body >=1
  canonical weigh-in · habits 1 completion · media 1 add
A3 twig bar - PER-CLASS (D116, the paper-run fix - the bar matches
  the domain natural cadence, so the canopy never lies about a
  consistent domain): journal/habits/nutrition/goals >=15 in-window
  days/CALENDAR month (the calendar-month reading pinned - the
  February dip is an honest feature, never a lottery); GYM >=8
  days/month (2x/week passes — the audit C-11; 3x/week = 12-13,
  comfortably over); BODY/MEDIA >=4 active weeks/month. PLUS THE CANOPY
  RULE (the rotating-logger fix, D116 + the recording audit): any
  month with >=15 in-window days ANY-DOMAIN-MIXED grows the tree -
  a twig on the month's most-active branch (the rotating logger
  logs 30 days/month - its canopy grows; the per-class bars still
  gate the per-domain branches). Dev-tunable.
A4 stage-year bar: >=200 in-window days, CUMULATIVE-ACCRUAL reading
  (D116 pin - the count accumulates from the anchor; a stage-year
  completes at 200, the counter resets; the every-other-day life
  takes ~13.2 months - the literal 365-day-window reading is dead).
  Active day = a day with >=1 in-window event.
A5 ring-year per-domain bar: ≥40 in-window days per domain over the
  SIX CORE DOMAINS (journal, habits, gym, nutrition, body, media —
  the D116 RING FOLD: goals and periods are excluded from the ring
  brand so the trunk rings and the trophy ladder ALWAYS agree; the
  canonical-7 stays for the axes/presence)

GROUP B — THE STAGE GATES:
B1 SEED->SEEDLING: first in-window event
B2 SEEDLING->SAPLING: >=15 in-window days within any 30-day
  window, ANY-DOMAIN-MIXED (the A3 month bar itself - the rotating
  logger qualifies; a genuine month of presence - D115, days not
  twigs)
B3 SAPLING->POLE: 1 stage-year (A4)
B4 POLE->MATURE: >=2 stage-years AND >=90 in-window days
  ANY-DOMAIN-MIXED in the best anchored year (D116 - the mixed-domain
  fix: the sparse-stubborn, rotating, every-other-day, and body-only
  users ALL mature - the caudex own archetype reaches its first
  bloom; no gate ever blocks on a single domain or a twig count;
  crown breadth = the BALANCE axis business) (pioneer-speed ~year
  2 for hyper-consistent users)
B5 MATURE->OLD-GROWTH: >=10 stage-years

GROUP C — THE CAPACITIES & BUDGETS:
C1 bloom budget: <=15 flowers per bloom event (waves per D099)
C2 bloom waves max: <=4 waves per flowering season (60
  flowers/season; overflow banks to the NEXT spring — no flower
  lost; the bank counter always shows the pending count)
C3 habit-bud cluster threshold: >=30 buds per branch -> clusters
  (individual buds <=29; clusters reveal on zoom; the count stays
  honest)
C4 legend transformations: 1 per annual bloom + 1 all-time CROWN
  (the EARLIEST-EARNED Grove is the crown - D116 tiebreak; other
  Groves get large blooms, not the transformation; the crown is
  DERIVED - the restore walk proved it re-sets honestly, never
  stored in the backup)
C5 twig capacity: <=12 twigs/branch/year (the monthly unit) + a
  RETENTION WINDOW (candidate: the last 3 years' twigs render
  individually; older twigs merge into the branch's woody character
  — botanically true, the LOD answer)
C6 leaf-cluster granularity unlock: at POLE (the stage gate, the
  zoom mechanic)
C7 bank-counter display: top 3 by tier + the count ("+47 more");
  the why-panel lists the full bank; a CLOSED bucket shows
  restore-foreclosed trophies (D116 - never silence); the LEGEND
  CARD computes its numbers FROM the tree state, never templates
  (D116)

GROUP D — THE TENURE FLOORS:
D1 structural-modification floor: >=2 stage-years
D2 buttress floor: >=3 stage-years
D3 caudex floor: >=5 stage-years

GROUP E — THE ADAPTATION AXIS SIGNATURES (gates, not triggers —
D103): see the full per-adaptation rationale in the session record.
E1 caudex: tenure >=0.7 AND resource <=0.6 (the ~8.3-year cadence
  pinned — D116; the MATURE floor dissolves with B4's mixed-domain
  bar, so the sparse-ancient user reaches the first bloom and the
  caudex's gate becomes the honest 7+ stage-years + sparse)
E2 buttress: balance >=0.7 ONLY (D116 + the recording audit — the
  balance leg IS the whole signature: at the F4 ceiling 12 the
  rotating logger sits at 0.083 resource — any resource leg excludes
  the balance champion; the wide-crown roots belong to the balanced
  life, period; the resource dimension does its work in E1/E3)
E3 phyllodes: resource <=0.4 AND rhythm >=0.5 (D116 - the drought
  adaptation fires only for the STEADILY-sparse (the acacia), never
  the bursty feast-famine or the lush; the F4 calibration keeps
  normal lives out of the band) + PERSIST-INTENSITY reversion rule:
  once manifested the adaptation stays (the history is real) but its
  visual intensity scales with the current axes at each bloom
  checkpoint, the why-panel narrating (the leaves grew richer as the
  logging deepened)
E4 cladodes: streak-without-entries divergence >=0.6
E5 storage leaves: media share >=0.5 of entry content, metric =
  ATTACHMENT-MIX (D116 pin: media attachments / total attachments,
  not bytes, not words)
E6 thorns: 52 CONSECUTIVE WEEKS of sustained presence in a domain
  (ANY domain - the cadence-relative armor, D116) + tenure >=2
  stage-years. The armor is rare: a full year of never-missing
  weekly presence on a 2+ year tree.
E7 spines (subtle): 26 CONSECUTIVE WEEKS of sustained presence in a
  domain (ANY domain - D116; half a year of every-week consistency)
E8 tendrils: a live long-horizon goal (>1 year, in progress)
E9 reaction wood + epicormic: a revival - an UNPROTECTED dormancy ending (D116: planned returns from rests/vacations/quiet-weeks are NOT revivals - the protected-absence exclusion; the vacation-heavy walk fired 16 false comebacks)
E10 contractile: 3 consecutive ANCHORED 365-day windows with rising
  active-day counts (D116 pin - the accrual unit killed it for every
  user; the anchored-window reading makes it real)
E11 mycorrhizal: coach engagement >= the threshold per the
  coachEngagement owner (H-03; one derived owner; opt-ins/deletes
  never feed it)
E12 stolons: a sustained L-10 insight confirmed >=3 monthly windows
  in a row
E13 bracts: no gate (ceremony display)
E14 bud scales: no gate (the dormant-habit state)
E15 DORMANCY THRESHOLD (D116 + the recording audit pin): a dormancy
  = >=14 consecutive days with no in-window presence (a fortnight
  of quiet); a REVIVAL = the dormancy ends - the E9 trigger unit.

GROUP F — THE TIME WINDOWS & FORMULAS:
F1 season-phase: FIXED DATES (spring Mar 1 / summer Jun 1 / autumn
  Sep 1 / winter Dec 1) + the RENDER CLOCK = the stored timezone
  SETTING (not the live device clock — travel never flips the
  seasons; the derivation uses dayKeys, never instants)
F2 growing season: spring->autumn (Mar 1 - Nov 30); winter = the
  resting/banking season (D095)
F3 anchored windows: 365 days anchored to the frozen birth anchor
  (E3 — never calendar-chopped; both year types share it)
F4 RESOURCE: avg in-window events per active day, normalized 0-1,
  CEILING 12 (D116 - the paper run proved the 20 ceiling made
  nearly every life read as sparse and decided whole characters;
  at 12 the decade user lands ~0.6-0.8 where buttress is reachable)
  + the EVENT UNIT pinned: per-input-class events, one count each
  (a meal = 1, a set = 1, a photo = 1 - no double-counting, no
  hidden multipliers)
F5 RHYTHM: 1 - (stddev/mean of weekly active-day counts), clamped; ACTIVE DAY pinned: a day with >=1 in-window event (D116); the D114 protected-absence discount lives HERE: planned rests, vacations, and quiet-weeks are discounted from the weekly counts
F6 BALANCE: Shannon evenness across the CANONICAL-7 presence-domains, PRESENT OR NOT (D116 pin - the normalization choice flipped the 0.70 gate; the pinned reading is stable)
  (Artifact 1's list)
F7 TENURE: stage-years / 10, clamped at 1
F8 replay pacing: ~2s per year (the D097 time-lapse; tuneable at
  the mockup step)
F9 perf gate - frame budgets: to be defined at Step 6 (tree-5) -
  the milestone gate numbers (<=16ms/frame at LOD-1/2 on the target
  device tier; the archetype perf runs measure against it)
F10 future-dating clamp: events with occurredAt in the FUTURE are
  excluded from all math (D114)

ALL VALUES DEV-TUNABLE (D105): the register ships a dev-only debug
panel driving live re-derivation + re-render; the paper run, the
archetype mockups, and the perf gate all play the numbers before
they freeze for the engine contract.

### 2.5 ARTIFACT 3 — THE TRIGGER-CORRELATION TABLE (LOCKED 2026-08-29
— D103's deliverable; every trigger, its condition, gate, visual,
schedule; nothing fires twice, nothing is hidden)

A. THE FLOWER TRIGGERS (achievements → flowers; D092 schedule):
- Every achievement → a flower at its tier magnitude + family
  identity (D091 overlay). Pre-maturity: banked as tier-marked buds
  (D096). First bloom at maturity: Sprout→Heartwood burst — WITH
  THE WINTER-DEFERRAL (D116/C13: a winter maturity defers the first
  bloom to the next spring flush — winter-exempt). Post-
  maturity: growing-season earns bloom on-earn; winter earns bank to
  spring. Ring tier → the annual bloom. Grove → the next annual
  bloom as the transformation (C4 legend cap: 1 per bloom + 1
  crown).
- F-03 PR CEREMONY — NO BLOOM (user arbitration, locked): the PR
  ceremony fires on PR events (not achievements) — it manifests as
  a NON-BLOOM BRACT-STYLE FLOURISH at the logging moment (the
  ceremony's sparkle). ZERO flowers — the flower=achievement
  contract survives.

B. THE ADAPTATION TRIGGERS (14 rows; the E-group signatures are the
GATES; the manifest moment = the next annual bloom per D093):
1 caudex — DERIVED trigger (no achievement encodes "7+ stage-years
  AND sparse"): tenure >=0.7 + resource <=0.6 + stage floor MATURE.
  Cousin achievements noted: VIII-4 Ten Years (anchor-age, different
  condition — no double-fire). Gate: D3 (5 stage-years) + E1.
2 buttress — DERIVED (sustained multi-domain balance): balance >=0.7
  ONLY (D116 — the resource leg removed: at the F4 ceiling 12 the
  balance champion sits at 0.083 resource; the balance leg IS the
  whole signature). Gate: D2 + E2 + stage floor POLE.
3 phyllodes — DERIVED (sparse-stubborn): resource <=0.4 AND rhythm
  >=0.5 (D116 — the steadily-sparse acacia; never the bursty or the
  lush) + the PERSIST-INTENSITY reversion rule. Gate: D1 + E3 + stage
  floor SEEDLING (leaves exist).
4 cladodes — DERIVED (streak-without-entries divergence >=0.6). Gate:
  D1 + E4 + stage floor SAPLING (branches exist).
5 storage leaves — DERIVED (media share >=0.5 of entry content).
  Gate: D1 + E5 + stage floor SEEDLING (leaves exist) — D114 restored
  the structural-tier floor (D089: 2+ stage-years).
6 thorns — DERIVED (D116 — the refuted 365-day trophy replaced by
  cadence armor): 52 CONSECUTIVE WEEKS of sustained presence in a
  domain (ANY domain) + tenure >=2. Gate: D1 + E6 + stage floor SAPLING
  (branches exist). Same condition also produces the domain's flower
  — DIFFERENT visuals (armor vs bloom) — both fire (no conflict;
  the no-double-fire rule covers same-visual collisions only).
7 spines (subtle) — DERIVED (D116): 26 CONSECUTIVE WEEKS of
  sustained presence in a domain (ANY domain — the refuted II-3
  referent replaced by cadence armor). No tenure gate (subtle tier,
  D089). Stage floor: SAPLING.
8 tendrils — DERIVED (a live long-horizon goal, horizon >1 year).
  Gate: E8. Stage floor: SAPLING (branches exist).
9 reaction wood + epicormic — DERIVED (the revival event — an
  UNPROTECTED dormancy period ends; >=14 consecutive quiet days per
  E15; planned returns from rests/vacations/quiet-weeks are NOT
  revivals — D116). UNIVERSAL (no gate). Stage floor: the organ
  exists.
10 contractile — DERIVED (3 consecutive ANCHORED 365-day windows
  with rising active-day counts — D116; the accrual-unit reading
  killed it for every user). NO D1 FLOOR (subtle tier per D089 —
  D114).
11 mycorrhizal — DERIVED (coachEngagement owner >= the threshold).
  Universal (no axis gate). Feed: H-03's single owner; opt-ins/
  deletes never feed it.
12 stolons — DERIVED (a sustained L-10 insight: the same cross-
  domain influence confirmed >=3 monthly windows). Universal.
13 bracts — DISPLAY (the F-03 flourish + the bloom presentation).
  No gate.
14 bud scales — DERIVED (the dormant-habit state). No gate.

C. THE STRUCTURAL/CEREMONY TRIGGERS:
- Stage transitions (D094 + B-group ticks) · seasonal states (D095 +
  F-group) · the FIRST BLOOM (B4) · the winter bank → spring flush
  (D095) · the launch-day replay (D097) · the restore re-derivation
  (D098) · the annual bloom (F2 window; waves C1/C2).

D. THE NO-DOUBLE-FIRE MAP:
- Rule (D103): if a derived pattern AND an achievement would both
  trigger the SAME visual for the same condition, the ACHIEVEMENT
  wins; the derived trigger yields.
- Same condition → DIFFERENT visuals: both fire (e.g., the 365-day
  streak earns the trophy's flower AND the branch's thorns — armor
  and bloom are distinct visuals).
- Contradictory signatures: impossible by construction (caudex vs
  buttress — the same axis numbers can't satisfy both).
- The F-03 flourish is non-bloom — no conflict with any flower.




### 2.6 THE TREE-STATE MODEL (LOCKED - D107, the lean form)

The derived cache's schema (the only place the renderer and the
why-panel read): meta (schemaVersion, registerVersion,
logFingerprint, derivedAt, anchor) - stage, stageYears,
currentWindowDays - axes (resource, rhythm, balance, tenure) -
bankBuds [{achievementId, count}] (order = earn order; AGGREGATED
  by achievementId per C9 — the repeat-bloom count badge lives here) -
legendAchievementId (the crown, once-set) - trunk {rings
[{index,sliver}], adaptations} - branches [{domain, dormantSince,
revivals [dateKey], twigs [{monthKey,daysPresent}], forks
[{type,twigs}], rings, adaptations, fruitSpurs}] - habits [{habitId,
state: dormant|swelling|bursting|scarred, clusterRef}] (clusterRef
per C3 — buds beyond 30 per branch cluster; the count stays honest)
- leaves (recent
granularity rows + older cluster aggregates) - flowers
[{achievementId, bloomDateKey, state: bud|bloomed|faded}] - fruits
[{goalId, dateKey}] - periods [{type, startKey, endKey}]. The
principle: only what the renderer draws and the derivation tracks
incrementally; every other fact stays in its owning system. The
season phase is computed (date + the timezone setting), never
stored.

### 2.2 The scan (Step 3— COMPLETE 2026-08-29, 3-pass audited)

The feature scan read the real docs (Database.md, Architecture.md,
CoachSystem.md, Gamification.md, Roadmap.md, UIUX.md, MediaStorage.md,
Requirements.md + PersonalOS-Achievements-v2.md +
TEMP-PLANNING-Achievement-Spec.md + TEMP-PLANNING.md) and produced:
(1) the FEATURE INVENTORY— every feature and its inputs, classified
into the 7 classes (life-tree-design/INPUT-INVENTORY.md, exhaustive,
nothing summarized); (2) the ACHIEVEMENT-SCAN— every achievement
family + tier + condition→ the rarity ladder
(life-tree-design/ACHIEVEMENT-SCAN.md). Raw briefs:
life-tree-design/scan-outputs/. Audits:
life-tree-design/audits/scan-audit-2026-08-29.md (3 passes).

## 3. The derivation contract (the engine core) (LOCKED — D088)

- Two-engine law: EXTENSION (new twigs/leaves/branches/flowers —
  activity volume) + THICKENING (ring quality — year-round
  consistency).
- **Secondary growth trigger (LOCKED - D101/D114):** the trunk's rings
form at RING-YEAR closings (the anchored 365-day window with the
SIX CORE domains present — the D116 ring fold: journal, habits, gym,
nutrition, body, media — goals and periods excluded from the brand;
the trunk rings and the trophy ladder ALWAYS agree); the stage
  clock runs on STAGE-YEARS (any-domain, >=200 in-window days per A4)
  - the two clocks never mix (D101). Maturity (B4) gates the first
  bloom; ring-years brand the trunk.
- **The gradient axes (4 continuous, 0.0–1.0, derived from the event
  log — positions, not categories):** RESOURCE (lush↔sparse: avg
  logging volume per active day), RHYTHM (steady↔bursty: variation
of weekly activity), BALANCE (single-focus↔multi-domain:
distribution across the CANONICAL 7 presence-domains, D104), TENURE (young↔ancient:
  qualifying years + longest continuous presence). Every adaptation
  reads its signature from these same numbers (contradiction by
  construction); one character per organ; rank rule for
  dominant/subtle tiers; universal adaptations unrestricted.
- Incremental derivation from the event log; derived cache; never
  on the UI thread; debounced on writes.
- Seeded-data stress testing (L-10 discipline) — including coherence
  checks (every generated tree must pass every adaptation's axis
  signature) and uniqueness checks across user archetypes.
- The consistency principle (D088): the most consistent users get
  the most beautiful trees with the most meaningful modifications —
  tenure, branch rings, canopy density, caudex, reaction-wood
  history, winter storage all compound consistency.

## 4. Phase mapping (fitness/nutrition phases — user-named examples)

bulking / cutting / maintenance / dieting → their exact tree effects
(which growth component, which visible channel — e.g., vascular
richness, ring density, leaf color state) — to be defined row by row.

## 5. Seasonality system (LOCKED — D085)

The layered model: the calendar year is the tree's botanical cycle
(skeleton — spring bloom, summer canopy, autumn fruit/color, winter
dormancy, ring closes at the year boundary); user data modulates
season-visual intensity (dense bloom from a rich spring, greener
canopy from active winter logging, sparse bloom from a quiet year).
Engine: season-phase function (calendar) + intensity modifiers (data
per season). Every visible season state has a two-part why: the
calendar guarantee + the data-derived density.

## 6. Rarity tiers (achievement visuals) (LOCKED — D086)

Hybrid model: deterministic core + derived accents. The tier ladder
(common flower → special flower → large visual → top-tier
transformation) is built from the FULL scanned achievement list —
every family, every tier, cohesively mapped (the achievement-scan
sub-step of the feature scan; Ghost-in-the-Machine is one family
among several hardest sets, NOT the only one). The top-tier
transformation is the engine's largest single visual: fixed shape,
user-data-derived accents, fully explainable.

## 7. Navigation & feeds mapping

Every organ → which section feed it opens (branch → section feed,
vascular → nutrition view, leaf → memory, fruit → goal, ring →
year review). The tree IS the meta-UI (VISION §15).

## 8. Anatomy views mapping

Root transverse section, stem transverse section, leaf cross-section,
trunk rings, time-lapse — which data each layer shows (VISION §16).

## 9. Decision record

Every approved row becomes a numbered decision (D08x+) with status;
open points from VISION §4 get resolved here first.

D116 ADDITIONS (the paper-run corrections - all 19 walks, 2026-08-29):
C8 SPUR ECONOMY: a fruit spur = ONE PER MILESTONE/PHASE of a goal
  (D116, user decision - the goal-focused walk produced 10,950
  spurs from per-task counting; milestones bring a real life to
  ~54-90 spurs; a cluster rule covers the rest)
C9 REPEAT-BLOOM AGGREGATION (D116, user decision - the faucet
  flood): the same achievement's re-fires MERGE into ONE flower
  with a COUNT BADGE (II-6 x120 -> one flower, badge x24), capped
  per achievement per bloom event; the C3 cluster surface extends
  to the flower-bank; the bloom queue drains (the habit-hoarder's
  99.9% re-fire bank becomes readable); per-habit caps apply
C10 COACH-LINE CAP (D116): Ring/Grove Coach lines capped per bloom
  event (the hoarder's 1,001-line flood becomes one line per
  event - the one-line discipline extended)
C11 EMPTY-SPRING RULE (D116): an annual bloom with nothing earned
  gets a QUIET-SPRING copy ("the tree rests this year - every
  year it blooms is earned"), never silence
C12 NEVER-MATURE MANIFEST FALLBACK (D116): if a pending adaptation
  has no annual bloom to manifest at (the never-mature sparse
  case), it manifests at the NEXT SPRING check regardless - a
  pending adaptation is never pending forever
C14 BRANCH-RING BAR (D116 + the recording audit pin - the walks
  flagged it 3x): a branch ring = an anchored year in which the
  domain had >=40 in-window days (the A5 per-domain logic, no
  six-domain requirement) - the journal-only user's branch rings
  record the years honestly.
C13 SCHEDULE PINS (D116): the FIRST BLOOM defers to the next
  spring flush when maturity lands in winter (winter-exempt); the
  bank is evaluated AT BLOOM OPENING (the same-day boundary)
  - both pins settle the 6-walk recurring edges
A6 THE BACKFILL-TROPHY PREDICATE (D116 - the winter-bomber W1): the
  isBackfill exclusion extends to TROPHY conditions - qualifying
  content fires trophies only for IN-WINDOW days; a PR-rich
  backfill can no longer reach a Grove through the content channel
A7 GOALS = FRUITS ONLY (D116, user decision - no G-family): the
  goals branch carries fruits + spurs + tendrils; goal completions
  NEVER produce flowers; the why-panel is the goal storyteller
E15 MEDIA TROPHY CENSUS (D116 - the vlog-lock): the VII Proof of
  Life family counts KEPT PHOTOS + VLOGS (the census always said
  "vlogs & photos"; the conditions drifted - the photo-rich user
  is un-starved)