# FINAL ADVERSARIAL AUDIT — the fresh-eyes wave (the wave nobody ran)

**Audit date:** 2026-09-23 · **Auditor:** fresh-eyes adversarial auditor (final wave)
**Inputs:** VISION.md (17 principles) · SCHEMA.md · LOOPHOLES.md · TRAIT-SPACE.md ·
ACHIEVEMENT-SCAN.md · INPUT-INVENTORY.md · PLAN.md · TEMP-PLANNING tree-7
(D085–D113, verbatim L2447–L3585) · docs/Roadmap.md (M7 L609–708, M9 L876–901,
M10–M13) · docs/Gamification.md · docs/CoachSystem.md · docs/Database.md ·
docs/Architecture.md · docs/DecisionLog.md · wave-1 meta-audit
(loophole-findings/F-recursive-audit.md, 109 findings) · wave-2 meta-audit
(loophole-findings-wave2/I-recursive-audit.md, 154 findings, D100–D113) ·
wave-2 briefs (H-coach-privacy, D-accessibility-surface, G-render-perf).

**Method:** eight NEW dimensions — none covered by the previous waves:
(1) docs-pass implications, (2) test strategy, (3) M9 roadmap integration,
(4) vocabulary/overloading, (5) onboarding/education, (6) gamification-system
integration (owner contracts), (7) implementation-order risks, (8) emotional
design. Every finding was checked against the wave-1/wave-2 records for
non-duplication; resolved items are not re-reported.

**Counts:** 6 CRITICAL · 10 MAJOR · 7 MINOR = 23 findings.

---

## 1. THE DOCS-PASS IMPLICATIONS (dimension 1)

### F-1 — CRITICAL · THERE IS NO DOCS-PASS AMENDMENT REGISTER, AND FIVE LOCKED DOCS CURRENTLY CONTRADICT THE DESIGN

**Location:** VISION §7 (the drafting strategy — "the drafter pipeline drafts
from the design docs into docs/" — the ONLY planning for the docs pass);
PLAN Step 10 ("the docs pass later drafts into docs/ (a docs/LifeTree.md
family, DecisionLog entries)"); scattered LANDS lines in D090/D098/D102/D104/
D109/D110/D112. The LANDS convention (TEMP-PLANNING L91) assumes every lock
carries its amendment target — it does not.

**What's missing:** a consolidated amendment register. Today the amendment
targets exist only as fragments inside individual D-records, and the list is
incomplete. Verified **live contradictions in docs/ right now**:

| Doc (current text) | Contradicts | Status of the amendment |
|---|---|---|
| Gamification.md:173–178 "Account anchor = MINIMUM occurredAt ... imported=false ... FROZEN at the moment the first real event is written" | D100(5) + D102(1): the anchor = the account's FIRST **IN-WINDOW** event — a pure backfill cannot birth it. The docs' MIN(occurredAt) lets a backfilled year set the anchor | **Never named** in any LANDS — D102's LANDS list (LOOPHOLES/CoachSystem/INPUT-INVENTORY/D090/D098) omits Gamification.md |
| Gamification.md:176 "It is NOT the milestone-review anchor (first journal entry)" | D102(3): "The Coach's anniversary = the same anchor" — the split the doc asserts is abolished | Never named |
| CoachSystem.md:208–210 milestone-review anchor = "FIRST journal entry's date; if that entry is deleted the anchor falls back to the next-earliest" | D102(1): deletion never shifts the anchor | Named in D102's LANDS ("amend at the docs pass") — OK |
| Roadmap.md:815–816 (M8 milestone review "anchored to the FIRST journal entry's date ... falls back to the next-earliest if deleted") | D102 | Never named |
| Roadmap.md:886–900 (M9: "no new tables", "Analytics-Engine-derived cache from M7", exit "fully derived from the M7 owner catalog") | D107/D108/D109 (new tables: the tree-state model + viewed_moments), D110(6) (log + own owners, never M7 tables) | Flagged by wave-2 (2.8/IA-8) as "amended at the engine-contract step" — **still unamended, no D-number, no docs-pass row** |
| Database.md:311 "formatVersion": 2 | D109(2): formatVersion 3 carries the monotonic logFingerprint; D102(2): the anchor rides the format | Never named |
| Gamification.md:190–192 "Six-domain presence {journal, habits, fitness, nutrition, body, media}" | D104: seven presence-domains (goals added) — the tree's BALANCE axis, ring-years, tint owner read the canonical 7-row table | Never named |
| Gamification.md qualifyingEntry (BODY = "a real weigh-in OR a physique-timeline photo"; VLOG/MEDIA = "captured OR adopted") | SCHEMA A2 (body = canonical weigh-in only; media = any add) + D113(4) adopted-forward-only | Never named (see F-3) |
| Roadmap M7 anchor row (L674) "MIN(occurredAt) across all non-imported, non-tombstoned events" | D100/D102 in-window first event | Never named |

**Proposal:** mint the register NOW as a Step-10 deliverable: one table in
life-tree-design (doc × exact line anchor × D-number × action: amend/append/
new section), reconciled against every LANDS line plus the rows above. The
drafter pipeline consumes ONLY this register; its gate: every D085–D113
record has ≥1 row, and every row resolves to an edit. The DecisionLog
entries the docs pass mints (D114+) cite the register row numbers.

### F-2 — CRITICAL · SCHEMA §3 STILL CARRIES THE PRE-D101 SECONDARY-GROWTH TRIGGER THAT CONTRADICTS THE LOCKED STAGE GATES

**Location:** SCHEMA.md §3 ("**Secondary growth trigger:** to be defined
exactly in the engine contract step (candidate: the first qualifying year;
qualifying = the locked Life-Fully-Logged year rules)").

**What's missing:** the stale-row disease the 2026-08-29 review pass fixed
in INPUT-INVENTORY ("the input map's stale rows are corrected" — D102(4))
was never applied to SCHEMA itself. "Qualifying = the locked Life-Fully-
Logged year rules" means the six-domain brand drives the growth trigger —
directly contradicted by D093 (floors read the tree's own stage-years),
D101(1) ("the stage clock NEVER reads ring-years"), and B4 (POLE→MATURE =
3 branches + 2 stage-years). SCHEMA is the implementation-authority doc;
an implementer building the secondary-growth trigger from §3 builds the
starvation D090/D093/D101 were each written to kill.

**Proposal:** one edit, anchored to the register (F-1): "secondary-growth
trigger = POLE→MATURE tick per B4 (stage-years, any-domain, in-window per
D100) — see the threshold register B-group; ring-years never gate growth."

### F-3 — MAJOR · THE TREE-STATE MODEL (D107) HAS NO HOME — ITS LANDS POINTER IS A DEAD SECTION

**Location:** D107's LANDS ("SCHEMA.md 2.6 (the model)") — SCHEMA.md has NO
§2.6 (sections stop at 2.5; §3 jumps to the derivation contract). The state
model — the wave-2 IA-1 fix and the "first deliverable of Step 6" — exists
only inside TEMP-PLANNING's D107 record. The design-doc layer Step 6 says
it lives in has no such section, and VISION §7's planned doc list
(ENGINE-CONTRACT.md) was never created either.

**Proposal:** add SCHEMA §2.6 with the D107 model verbatim (or create
ENGINE-CONTRACT.md's state-model half now); the docs pass then drafts from
a real home, not from a ledger record. Also: the C3 habit-bud cluster
(≥30/branch) has no representation in D107's "habits [{habitId, state}]" —
decide model-time vs paint-time aggregation at Step 6 and record it.

---

## 2. THE TEST STRATEGY (dimension 2)

### F-4 — MAJOR · THE TEST STRATEGY DOES NOT EXIST: NO GENERATOR SPEC, NO PER-GATE ACCEPTANCE CRITERIA, NO DERIVATION REGRESSION SUITE

**Location:** PLAN Steps 4–9 (gates are qualitative: "zero un-mapped
features", "every threshold defined", "an implementer needs zero open
questions"); VISION §5 ("stress testing ... verify uniqueness actually
differentiates, verify coherence holds"); TRAIT-SPACE §3; D108 (the fold);
LOOPHOLES §6.4 (the paper run).

**What's missing, concretely:**
1. **The perf gate has NO numbers.** G P-05's proposal (≤2.5k ops/frame
   ceremonies, ≤1.5k LOD-1, ≤500 LOD-0, ≤1ms/event incremental, ≤16ms
   frames, ≤3 resident pictures) was never locked: D111 resolves P-01/P-03
   only; Roadmap M9's exit criterion is still "render performance
   acceptable on the phone". A milestone gate with no number is not a gate.
2. **The uniqueness gate has no acceptance criterion.** "Verify uniqueness
   actually differentiates" (VISION §5) — no bar: e.g., "N archetypes × M
   seed runs → ≥K distinct trait signatures" or a collision budget for
   similar-life twins (DV-C4). Without a bar, the check is a vibe.
3. **No derivation regression suite is specified:** golden-state fixtures
   (log X → expected tree state Y, incl. the D108 fold's permutation tests:
   delete-first / revoke-first / parallel-edit / union-order swaps →
   identical state) exist only as wave-2 stress-archetype names, never as a
   test contract. The derivation is the single most deterministic system in
   the app; determinism has no test.
4. **The seeded generator is unspecified:** what it must produce (archetype
   × span × event mix × volume), its seed determinism, its fixture output
   format, and its reuse across the perf gate / coherence check / paper run
   are nowhere. "The seeded-data stress tests are the paper run's automated
   descendant" (LOOPHOLES §6.6) — the descendant has no parent spec.

**Proposal:** a TEST-STRATEGY.md in life-tree-design (or PLAN Step-9's
first deliverable): (a) the generator contract (deterministic seed, archetype
roster, event vocab, output fixtures); (b) a gate table — every PLAN gate
Steps 4–9 gets either a number (P-05's budgets) or a named check (the
coherence check's axis-signature pass, the deuteranopia pass D111(3), the
D108 permutation suite); (c) the golden-fixture regression suite with
fixture versioning (register-version bump = fixture re-baseline).

### F-5 — MAJOR · THE PLAN'S ARCHETYPE ROSTER IS STALE, AND WAVE-2'S OWN VERIFICATION GATE WAS NEVER RECORDED

**Location:** PLAN Step 4 ("gym-heavy, journal-heavy, balanced,
decade-consistent, bursty, Mediterranean-overlap" — 6 archetypes);
I-recursive-audit §6 Step 8 (the consolidated verification gate: "the
archetype list now REQUIRES the wave-2 archetypes (everything-user,
timezone-traveler, two-device, two-tab, screen-reader, LLM-opt-in,
backfiller, adopted-media user, similar-life twins, 20-year user) + the
perf gate + the coherence check + the matrix's cells re-walked (G-1) +
the seeded union-order stress archetypes").

**What's missing:** the D-record stream stops at D113; the resolution
order's Step-8 verification gate has no D-number, and its deliverables are
absent: (a) PLAN.md's archetype list was never updated (19 mandated
archetypes across wave-1 N-1/N-2/N-4 + wave-2 Step 8; PLAN still lists 6);
(b) the stage×class matrix was never promoted (LOOPHOLES §8 still says
"DRAFT — becomes contract at the input-map step", and the input map's
D104–D106 did not promote it); (c) LOOPHOLES §8's status table stops at
D099 — it does not list D100–D113 (a living tracker that does not track);
(d) G-1 (the "banked" cells for classes 1–5 at SEED/SEEDLING — what a
banked journal entry/completion/weigh-in LOOKS like) remains unresolved;
(e) P-06 (snapshot economy: format, scope, residency) remains unresolved.

**Proposal:** one DecisionLog entry at the next session: mint the
verification gate (archetype roster + matrix promotion + G-1 cell
definitions + P-05/P-06 numbers) as Step-8.5 with its own record, update
PLAN Step 4's archetype list, and re-open LOOPHOLES §8's status table to
D100–D113.

### F-6 — MAJOR · PLAN.MD'S STEP SEQUENCE CONTRADICTS LOOPHOLES' VALIDATION ORDER AND ITS OWN PREMISES — THREE WAYS

**Location:** PLAN Step 4 ("Archetype mockups ... the cohesion check BEFORE
schema rows are locked") vs LOOPHOLES §6.4 ("PAPER ARCHETYPE RUN (after
Step 5, before the mockups)") vs I-recursive-audit §6 Step 6 ("the archetype
mockups ... need the palette, the contrast, and the semantics to be real" —
i.e., the surface/render cluster must land FIRST).

**What's missing / broken:**
1. PLAN puts the mockups (Step 4) BEFORE the input map (Step 5); LOOPHOLES
   puts the paper run after Step 5 and before the mockups — the two
   validation instruments' order is contradictory across the two docs.
2. Step 4's gate premise is dead: "cohesion check BEFORE schema rows are
   locked" — the rows (D104–D113) are locked; the mockups now validate, not
   gate, the input-map artifacts. The gate text must change.
3. The wave-2 resolution order's sequence (clock → derivation → device-state
   → privacy → surface/render → identity → economy) was never folded back
   into PLAN; a builder following PLAN runs the mockups before the renderer
   semantics (D111), the palette (D112), and the copy (D110) exist.

**Proposal:** rewrite PLAN Steps 4–8 in the I-recursive-audit §6 order,
renumber Step 4 to post-Step-6/7, and restate Step 4's gate as "validates
the locked register + palette with the dev tools" (D105).

### F-7 — MAJOR · THE DEV-TOOLS TUNING SURFACE (D105) IS LOCKED BUT UNSEQUENCED — EVERY VALIDATION STEP DEPENDS ON IT

**Location:** SCHEMA 2.4 + D105 ("every number ... must be playable during
the development/visual-testing phase — a dev-only debug panel that tweaks
any value and drives a live re-derivation + re-render; the archetype
mockups and the perf gate use it"; "the RESOURCE normalization ceiling (F4)
... CALIBRATED VIA THE DEV TOOLS at the paper-run step").

**What's missing:** no PLAN step builds the dev tools. The paper run, the
archetype mockups, the F4 calibration, and the perf gate all consume it —
and the register "freezes for the engine contract" (Step 8) AFTER the
calibration that should inform the freeze. The tools' position in the
build sequence is undefined, so either the freeze happens on uncalibrated
numbers or the calibration happens on tools that don't exist.

**Proposal:** the dev tools are a first-class Phase-0/pipeline deliverable
(a step between the paper run and the mockups), with their own gate
("every register value editable + live re-derivation + re-render on a
real device"); the F4 calibration is a paper-run checkpoint, not a
post-freeze discovery.

---

## 3. THE M9 ROADMAP INTEGRATION (dimension 3)

### F-8 — MAJOR · ALL FOUR M9 EXIT CRITERIA ARE STALE AGAINST THE LOCKED DESIGN

**Location:** docs/Roadmap.md M9 (L876–901).

**What's missing / broken (each criterion vs the locks):**
1. "Tree renders fully derived from the M7 owner catalog" — D110(6): the
   tree derives from the event log + its OWN H3 owners, never M7's cache
   tables. The criterion's verbatim premise is contradicted.
2. "No write-path entity, no new tables" — D107 (the tree-state model) and
   D109 (viewed_moments) ARE new tables. The premise is dead on arrival.
3. "Rings never shrink across missed years" — true for natural log
   evolution but D098(2) honestly shrinks rings on an older-backup restore.
   The criterion needs the D098 scoping line or the docs will contradict
   the restore contract (the wave-1 N-2 restore-rewind resurfaces in the
   roadmap's own text).
4. "Render performance acceptable on the phone" — no number (F-4.1).

Plus the scope text's "an Analytics-Engine-derived cache from M7" (L886-887)
contradicts D110(6)/IA-8's arbitration, and "the mockup is produced in the
UI/UX ordering pass that closes M8" conflicts with the re-sequenced PLAN
Step 4 (F-6) — the mockup artifact is scheduled in two different places
for two different purposes with no statement of which is which.

**Proposal:** a single Roadmap M9 amendment (via the F-1 register): rewrite
the CONFIRMED PREMISES block to the locked wording ("derived from the event
log via the shared H3 owner predicates; its own read-model cache; additive
schema in M9; restore scoping per D098; perf gate numbers per P-05") and
align the mockup line with PLAN's re-sequenced Step 4.

---

## 4. THE VOCABULARY / NAMING (dimension 4)

### F-9 — MAJOR · "BLOOM" AND "BUD" CARRY FOUR-TO-FIVE LIVE MEANINGS EACH, AND TWO OF THEM ARE GENUINELY AMBIGUOUS IN CONTRACT POSITIONS

**Location:** D092/D095/D096/D087/L-03/LOOPHOLES §1/§3; SCHEMA 2.4 C-group;
D106.

**The overloads (defined once, never disambiguated):**
- **bud** ×5: habit buds (D087) · achievement buds (D092/D096 bankBuds) ·
  winter leaf-buds (D095) · branch-buds (L-03/D094) · bud scales
  (adaptation 14, and the D087 bud's winter wrapper). The state model's
  bankBuds holds only one kind; the matrix's "fruit buds" (class 5) is a
  sixth.
- **bloom** ×4: the first bloom (B4) · the annual bloom (F2) · the per-
  flower "blooms directly on earn" (D092(3)) · the ephemeral bloom season
  (D095 — "holds through its flowering season, then FADE").
- **ring** ×8: trunk rings (ring-years) · branch rings (domain active years)
  · Ring tier · the thin-sliver partial year (D090 C) · family VIII ·
  F-15's hero ring · the habit streak ring (D088 duality) · the vascular/sap
  ring.
- **axis** ×2 systems: the four gradient axes vs the identity/magnitude
  axes (ACHIEVEMENT-SCAN §1.5) — different systems, same word.
- **ladder** ×4: the rarity ladder · the 47 rungs · D096's "THE LADDER"
  heading (early-fire expression) · the education ladder (D M-4).
- **legend** ×3: the rarest banked bud ("the Grove bud is the tree's legend"
  — D096(2)) · the all-time CROWN (C4) · the legend card (D097(6)) — plus
  wave-2's "legend counter" (B M-10).
- **gate** ×3: stage gates (B-group) · axis gates (E-group) · tenure floors
  (D-group) — D103 distinguishes triggers from gates but the three gate
  kinds share the word.

**Where it genuinely bites (not just noise):**
1. **The ephemeral rule's scope is unreadable**: "the bloom is ephemeral"
   (D095) — does the C4 CROWN (once-set, persistent by implication in
   D107's legendAchievementId) fade? Does the current-year legend
   transformation fade? The contract cannot be written until "bloom" is
   scoped per visual (see F-16 — this is also an emotional design issue).
2. **D096's "THE LADDER"** sits in the same document as the rarity ladder —
   a reader conflates the early-fire expression schedule with the tier
   ladder.
3. **"branch rings" vs "rings"**: D101 named the YEAR types but the two
   ring STRUCTURES (trunk ring-years vs branch domain-years) are never
   distinguished in one sentence anywhere; D101(2) says ring-years drive
   "ONLY the trunk rings + the ring-tier trophies" — the branch rings'
   relationship to ring-years is implied (branch rings read the domain's
   ring-year? the A5 per-domain bar?) and never stated (see F-2's register
   row: A5 is the per-domain ring bar — does a branch ring = that domain's
   ring-year?).

**Proposal:** a NAMING GLOSSARY appendix in SCHEMA (term → locked meaning →
D-number), produced at the docs pass as a drafting guardrail (the drafter
must not redefine any term); the F-16 contract line resolves the
ephemeral-scope ambiguity; A5 gains a "branch rings read this bar" row.

---

## 5. THE ONBOARDING / EDUCATION (dimension 5)

### F-10 — MAJOR · NO EDUCATION CONTRACT EXISTS — THE D M-4 LADDER WAS NEVER RESOLVED, AND THE WEEK-1 USER SEES BANKED CONTENT WITH NO VISIBLE FORM

**Location:** D111's resolve list ("resolves D C-1/C-2/C-3, G P-01/P-03,
D M-1/M-3/M-5") — **D M-4 (first-run education) is absent**; the wave-2
resolution order Step 6 lists "the education ladder (D M-4)" as a
deliverable — no D-number covers it. G-1 (the banked-cells contract for
classes 1–5) is unresolved (F-5). The only locked teaching copy in the
entire design: D094(1)'s single why-panel line + the day-1 strip + the
germination moment.

**The week-1 reality, walked:**
- The user's first entry: SEED banks it (matrix cell "banked (no leaves
  yet)") → germination flips to SEEDLING → class 1 at SEEDLING = "leaf
  clusters per twig" — but twigs need a MONTH of sustained presence (A3).
  So entries 1–14 render **nothing**; only the Sprout trophy's bud shows
  (D094(2)). The most personal content a new user creates is invisible for
  weeks, and nothing tells them why ("banked" has no visible form — G-1).
- The bank concept (the master principle!) is taught by nothing but the
  counter's existence. D M-4's own failure list stands: the user who
  reaches the first bloom in year 2+ has forgotten the buds; the bloom
  reads as noise, not payoff.
- The seasons arrive silently ("resting, not failed" is passive text); the
  duality (habit card = bud) is taught nowhere; the why-panel's tap-to-ask
  affordance is taught nowhere.
- The register-value reveal (D110(2)(b): the why-panel may show raw
  thresholds — "200 days") is ungated — a week-1 user seeing "stage-year
  bar: 200 in-window days" gets homework, not education.

**Proposal:** adopt D M-4's ladder as a contract row (chronological, one
fact per moment, text-first — welcome promise line → day-1 bank sentence →
germination → first-twig → first-autumn "resting" lesson → first-bloom
anticipation reinforcement → duality note), PLUS: (a) G-1 cell definitions
(the banked content's visible form: the first weeks' entries render as a
seedling's first leaf-bud cluster on the stem — "your entries are growing
here" — visible, honest, promising, exactly D095's winter-leaf-bud language
applied to the young tree); (b) the why-panel's threshold reveal is
stage-gated (raw numbers only from POLE+, D M-4's ladder rung); (c) the
first-run G7 welcome (UIUX.md) gains the tree promise line D M-4 proposes.

---

## 6. THE GAMIFICATION-SYSTEM INTEGRATION (dimension 6)

### F-11 — CRITICAL · B4 vs D090 C vs D101(1): SINGLE-DOMAIN USERS CAN NEVER REACH MATURITY — THE FIRST BLOOM IS UNREACHABLE FOR THEM, AND "NOTHING UNREWARDED" BREAKS

**Location:** SCHEMA 2.4 B4 ("POLE->MATURE: >=3 branches extended AND >=2
stage-years (the first bloom)") vs D090 C ("Single-domain users reach full
maturity — they just never brand rings") vs D101(1) ("a single-domain user
accumulates stage-years forever — **reaches maturity, blooms, grows old** —
they just never brand a ring"). D090's own POLE→MATURE example even reads
"N extended branches + M rings" — pre-D101 wording that B4 fixed the rings
half of but kept the branch-count half of.

**What's missing:** a maturity path for narrow-breadth users. A journal-only
(or habits-only) user has exactly ONE extended branch forever (the 5
branches are fixed; forks need sub-feature differentiation). B4's ">=3
branches extended" is structurally unsatisfiable → POLE forever → every
banked achievement bud (D092(2): "ALL banked Sprout/Root/Branch/Heartwood
buds burst together at the first bloom") stays banked forever → the
LOOPHOLES master principle ("data is never lost and never unrewarded") and
D096's "no trophy is ever a silent bud" fail for the most single-focused,
often most consistent, users. The why-panel's locked promise line ("blooms
at the first bloom" — D092(1)) becomes a permanent lie on their tree.
Emotionally this is the worst possible failure: the faithful single-domain
user's tree NEVER flowers while D101 promised it would.

**Proposal:** re-derive B4 to decouple maturity from breadth: maturity =
N stage-years (D101's own language) AND >=1 branch extended (maturity is
years, breadth is what the BALANCE axis and the ring brand measure —
exactly D090 C's decoupling). Concretely: "POLE->MATURE: >=2 stage-years
AND >=1 extended branch; pioneer-speed for hyper-consistent users" — the
>=3-branch variant can remain as the "canopy maturity" fast-path, but the
stage must never be closed to a single-domain user. A register row (B4 is
dev-tunable per D105) + a DecisionLog entry; the paper run's
"single-domain decade-consistent" archetype (LOOPHOLES §6.4) verifies the
bloom arrives.

### F-12 — CRITICAL · THE RING-YEAR DOMAIN SET IS DOUBLE-LOCKED: SIX (D101) vs SEVEN (D104)

**Location:** D101(2) ("RING-YEARS (six-domain, THE BRAND): ... ALL SIX
DOMAINS present") vs D104(3) ("Every system reads the same table — the
BALANCE axis, the **ring-years**, the tint owner, the achievement families'
attachment, the twig sources") where the canonical table has **seven**
presence-domains (goals added), and D104(2): goals presence exists "so the
rings can count it honestly". Roadmap M9: "one ring = one Life-Fully-Logged
qualifying yearly window" — the achievement system's six-domain definition.

**What's missing:** one answer to "does a Life-Fully-Logged ring-year
require goals presence?" The tree's trunk rings and the achievement family
VIII (Life, Fully Logged / Old Growth = 10 consecutive six-domain years)
would diverge if the tree reads 7 domains while the trophies read 6 — two
ring counts on the same trunk, and Old Growth (VIII-9) could fire while the
tree shows a different ring count, or vice versa. Nobody reconciled D101
with D104 after D104 added goals.

**Proposal:** one DecisionLog entry fixing the ring-year domain set
(recommended: ring-years stay the locked six — goals presence counts in
axes/twigs/balance but NOT in the ring brand, preserving the achievement
contract; the canonical table gains a "ring-year participation" column so
the two-level model is explicit).

### F-13 — CRITICAL · THE TREE'S PRESENCE PREDICATES DIVERGE FROM THE LOCKED OWNERS — THE ONE-OWNER RULE IS VIOLATED, AND D100'S SHARED PREDICATE IS HALF-APPLIED

**Location:** SCHEMA 2.4 A2 vs docs/Gamification.md:203-208 (qualifyingEntry)
+ Roadmap M7 rows; D110(6) ("the one-owner-per-shared-predicate rule");
D060 ("a number never differs"); D100(3) ("one rule ... kills the
manufacture-a-year attack for the tree AND for the gamification's yearly
bars — one fix, two systems").

**The divergences (verified against both texts):**
1. **BODY**: the tree's A2 = ">=1 canonical weigh-in"; the owner's
   qualifyingEntry = "a real weigh-in OR a physique-timeline photo". A
   photo-only body user (D031 timeline) is body-present for achievements,
   invisible to the tree.
2. **MEDIA**: the tree's A2 = "1 media add"; the owner = "a kept
   non-imported video with measured duration". A photo-attach day counts
   for the tree, not the owner — and the owner's "captured OR adopted"
   clause predates D113(4)'s adopted-forward-only rule (which was never
   baked back into the owner or A2).
3. **D100's shared predicate is tree-only today**: D100(3) promises the
   gamification yearly bars inherit the in-window grace guard; no D-number
   amended the M7 yearlyPass/anchored-year rows, and Gamification.md's
   anchored-year text still reads qualifyingEntry without the grace guard.
   The farm attack D100 closed for the tree is still open in gamification
   until the M7 rows are amended — and the "six-domain family = the app's
   first-ever qualifying logged event" anchor (M7) can still be set by a
   backfilled year, diverging from D102's in-window anchor (F-1's table).

**Proposal:** A2's rows become REFERENCES to the shared owners
(qualifyingEntry(domain, dayKey) per the canonical 7-row table + the D100
predicate + D113 forward-only + the D110(6) never-read-surface list) —
one predicate, one owner, consumed by the tree, the achievements, and the
ring-years; the M7 milestone rows and Architecture.md's owner catalog are
amended via the F-1 register.

### F-14 — CRITICAL · THE coachEngagement OWNER (H-03) IS REFERENCED IN THREE LOCKED ARTIFACTS AND DEFINED NOWHERE — ITS EVENT KINDS WERE NEVER RATIFIED

**Location:** SCHEMA 2.4 E11 ("coach engagement >= the threshold per the
coachEngagement owner (H-03; one derived owner; opt-ins/deletes never feed
it)") · SCHEMA 2.5 B-11 (the same, in the LOCKED trigger-correlation
table) · D110(1) ("the tree mirrors H3 owners only ... the mycorrhizal
character ... read the derived owners (engagement counts, check-in dates,
the anniversary)") · H-coach-privacy H-03 (the proposed rule: ONE owner
over check-in completions + goal declarations + kept-line tenure; additive
event kinds coach.checkin_completed / coach.line_deleted at M8).

**What's missing:** the feed (which events), the window, the formula, and
the threshold of the mycorrhizal adaptation's owner — and the H-03 proposal
was never ratified into a D-number. The additive M8 event kinds are a
schema change (event-kind contract, additive-versioned, DecisionLog entry
required) with no entry. As locked today, the mycorrhizal adaptation (row
11 of the locked trigger-correlation table) is unimplementable — exactly
the H-02 disease D110 was written to cure, one table over. The H-03
"never-list" (opt-ins, quiet-week starts, annotations, catch-up taps never
feed it — the tree must never reveal LLM opt-in state) is also unratified.

**Proposal:** one DecisionLog entry defining coachEngagement (feed events
incl. the additive M8 kinds OR the "manifests from M8 on" fallback, the
window, the threshold as a G-group register row, and H-03's never-list
verbatim); the docs pass drafts it into CoachSystem.md's owner list
(Architecture.md catalog) via the F-1 register.

---

## 7. THE IMPLEMENTATION-ORDER RISKS (dimension 7)

### F-15 — MAJOR · THE DERIVATION'S REQUIRED SCHEMA LIVES IN M11 (AFTER M9): THE GRACE GUARD, THE FOLD KEY, THE WATERMARK, AND THE ANCHOR-IN-BACKUP ARE UNBUILDABLE AT M9 AS SCHEDULED

**Location:** D108(3) (the fold keyed on (writtenAt, deviceId) — C-device
C-3), D100 (the in-window grace guard — needs a write timestamp), D109(1)
(viewed_moments — a SYNCED table), D109(2) (formatVersion 3 + logFingerprint
+ anchor) vs Roadmap M9 (ships before M11's sync plane and M10's backup
work) and the live events table (wave-2 A C-3 verified: no writtenAt
column).

**What's missing:** a dependency statement. Concretely, at M9:
1. The D100 grace guard (the anti-farm core of the whole design) cannot be
   computed without a write-time column; the two-tab lock (D108(4)) and the
   fold's (writtenAt, deviceId) key need both columns; the account-once
   watermark (D109(1)) is a synced table whose semantics only exist after
   M11.
2. Restore at M9 runs against formatVersion-2 backups with no anchor and no
   logFingerprint: D098's monotonicity story and D109(2)'s stale-cache
   detection silently degrade (the anchor is re-derivable from the restored
   log, but a backfill-only restored log cannot re-birth it per D100(5) —
   an unhandled corner).

**Proposal:** the Roadmap M9 row gains a "schema dependencies" line: the
additive event columns (writtenAt, deviceId, syncSeq) + formatVersion 3
(anchor + logFingerprint) + viewed_moments land IN M9 (all additive; the
M11/M10 rows then consume them) — or, if the columns stay in M11, the M9
contract must state the degraded behavior (no grace guard = the farm vector
reopens at M9; watermark = local-only until M11). The two-tab
single-instance guard (IA-10 option (i)) is an M9 deliverable, not M11's.

### F-16 — MAJOR · PHASE-0'S DEPENDENCIES ARE UNSTATED: THE PERF SPIKE NEEDS THE FOLD, THE STATE MODEL, THE DEV TOOLS, AND THE REGISTER NUMBERS — TWO OF WHICH ARE UNSEQUENCED (F-4/F-7)

**Location:** PLAN Step 9 ("PHASE 0 = the renderer perf spike (prove the
perf budget on a minimal derived tree with a real device) → organs → visuals
→ navigation → anatomy → review mode").

**What's missing:** the phase list is output-ordered but never
dependency-ordered. Phase 0's "minimal derived tree" requires: the fold
(D108 — needs the F-15 columns), the state model (D107 — no home, F-3), the
register numbers (D105 — uncalibrated until the paper run, F-7), and the
dev tools (F-7). The organs phase needs the LOD ladder + semantics surface
(D111) before the visuals phase can be perf-checked (a flower burst at
LOD-3 without the ladder = the 45k-draw-op disaster P-01 forbids). The
review mode (last) needs the yearly-snapshot economy (P-06 — unresolved,
F-5e). The plan reads as sequential when it is actually a DAG.

**Proposal:** rewrite Step 9 as a dependency DAG with the phase
preconditions named (fold+columns → state model → organs at LOD-1 → LOD
ladder + dev tools → visuals with ceremony budgets → snapshots before
review mode), each phase's gate naming its acceptance test (F-4's table).

---

## 8. THE EMOTIONAL DESIGN (dimension 8)

### F-17 — MAJOR · THE NEXT-TICK PROGRESS LINE (D094(4)) IS A GUILT METER FOR A STAGNANT USER

**Location:** D094(4) ("the next tick's progress ('the first branch grows at
3/4 weeks of gym presence')") — locked copy that renders at EVERY stage via
the overview strip (D094(5)), permanently.

**The risk:** for a user in a genuine low period, the always-on fraction
("3/4 of the way to the next stage — finish") is the exact "guilt UI" the
Roadmap M9 lock forbids ("no guilt copy anywhere"). The tree's own honesty
(dormancy, "resting") is designed; the progress fraction is not.

**Proposal:** D094(4) gains a staleness rule: after N inactive days
(register candidate, dev-tunable), the fraction swaps to the dormant copy
("growth resumes when you return — the first branch will grow then") —
same why-panel slot, two states, no fraction shown to a user who is not
growing. The "looks young/dormant, never failed" roadmap promise then holds
at the copy level too.

### F-18 — MAJOR · THE BANK COUNTER CAN READ AS A DEBT LEDGER, AND THE "LEGEND" FRAMING IMPLIES AN EMPTY CROWN SLOT

**Location:** C2 ("the bank counter always shows the pending count"), C7
("top 3 by tier + the count ('+47 more')"), D096(2) ("the Grove bud is the
tree's legend before it blooms").

**The risk:** pre-maturity users watch the bank grow with EVERY trophy
(trophies are zero-XP but still banked) while the payoff is months/years
away (B4, and F-11 shows it can be FOREVER) — "47 pending" reads as
unredeemed labor, not a promise. And D096's "legend" language on a bank
with no Grove implies a legend-shaped absence (the crown slot the user
doesn't have) — a quiet judgment on their ceiling. The gamification system
forbids claim/progress tables (ACHIEVEMENT-SCAN §5); the tree's bank
counter is the closest thing the design has to one.

**Proposal:** (a) the counter copy is achievement-neutral and always frames
the bank as stored ("saved for the first bloom" — the bloom date is ALREADY
the only countdown, per D092's why-panel line); (b) the legend/crown
renders ONLY when earned (D107's legendAchievementId is once-set — the
design must state that NO empty crown slot, NO ghosted legend, NO
"your legend will grow here" placeholder ever renders — the D091
no-progress-table discipline extended to the tree); (c) C7's top-3
composition line shows tiers as achieved objects, never as a rank against
"legend".

### F-19 — MAJOR · THE DORMANT BRANCH'S YEAR-ROUND BARE STATE AMONG LIVING NEIGHBORS, AND THE SPARSE USER'S TWO-YEAR INVISIBILITY

**Location:** D088 ("an inactive branch ... goes dormant, loses its seasonal
leaves (deciduous honesty), keeps its structure, and resumes growth from its
TIP BUDS") + the D099 "resting" copy + E3 (phyllodes gate: resource <=0.4,
D1 floor = 2 stage-years) + D095's winter leaf-buds.

**The risks:**
1. A mature tree with one dormant branch reads as "a dead branch on a live
   tree" for a full year — deciduous honesty is designed for WINTER (all
   trees bare); a year-round bare branch among lush siblings is different.
   The tip-bud promise (D088) is designed but its VISIBILITY is not
   specified — if the tip-buds are small, the branch reads dead.
2. The sparse-but-honest user (the phyllode/cladode character — the
   design's beautiful answer to "survives on little") waits 2 stage-years
   (D1) before any survival character appears; until then their tree is a
   thin, mostly-bare seedling with a growing bank counter and a shrinking
   streak economy — the mirror shows failure for years before it shows
   adaptation. Reaction wood (the comeback moment, universal) is their only
   early moment.

**Proposal:** (a) a locked visual invariant: the dormant branch ALWAYS
renders its tip-buds (the "alive underneath" promise, D095's leaf-bud
language extended year-round) + the "resting, will resume" why-panel line —
a dormant branch is never a bare stick; (b) the paper run's sparse
archetype (LOOPHOLES §6.4) gains an explicit "beautiful at year 1" check,
and the register gains a dev-tunable candidate: an early subtle-tier
survival texture (bud-scale tint / leaf-margin character) below the D1
floor — if the paper run shows the sparse year-1 tree is emotionally thin,
the D093 floor is amended by DecisionLog (not silently).

### F-20 — MAJOR · THE EPHEMERAL BLOOM (D095) vs THE PERSISTENT CROWN: WHAT SURVIVES WINTER IS UNSPECIFIED, AND THE FADING OF THE USER'S RAREST VISUAL IS UNDESIGNED

**Location:** D095 ("THE BLOOM IS EPHEMERAL: blooms hold through their
flowering season, then FADE ... the tree never floods with thousands of
flowers") vs C4 ("1 legend per annual bloom + 1 all-time CROWN (once-set)")
vs D107 ("crown -> legendAchievementId (once-set)").

**What's missing:** the fade rule's scope. If EVERYTHING fades, the
once-set crown (the user's rarest moment ever) vanishes in autumn like a
common flower — the "most meaningful modification" (D089/D093's structural
layer is persistent, the crown's layer is not stated). If the crown
persists, the design must say so and distinguish the annual-bloom legend
transformation (fades? persists through the following winter?).

**Proposal:** one contract line in SCHEMA 2.5-A: the CROWN and the
current-year legend transformation are the ONLY winter-persistent blooms
(the transformation holds through the following winter, then yields to the
next year's legend); every other flower follows D095's fade with the
why-panel/archive permanence. Also emotionally: a fade is never silent —
D111(2)'s announcement contract covers transitions; add "the season's
blooms have faded — held in the archive" as a strip-line (the ephemerality
is a designed message, not a disappearance).

### F-21 — MINOR · THE LEGEND CARD (D097(6)) MINTED FOR A LOW-TIER BANK READS AS A LETDOWN

**Location:** D097(6) ("The rarest: Ghost in the Machine — blooming at the
next annual bloom" — the one-time card after the launch replay).

**The risk:** the card's template names the user's rarest achievement
verbatim. For a user whose rarest is a Sprout-tier trophy, "The rarest:
Ink on the Page" is a joke, not a legend — the card's own example assumes a
Grove.

**Proposal:** the card's rarity line is tier-gated: it names the rarest
achievement only at Heartwood+; below that the line reads "Your first
blooms are saved for the first bloom" (no rarity comparison at all).

---

## THE CRITICAL LIST (6)

| # | Finding | Location |
|---|---|---|
| F-1 | No docs-pass amendment register; 8+ live doc contradictions (Gamification anchor/six-domain/qualifyingEntry, CoachSystem anniversary, Roadmap M7 anchor + M9 premises, Database formatVersion 2) | VISION §7 · PLAN Step 10 · docs/Gamification.md:173-192,203-208 · docs/CoachSystem.md:208-210 · docs/Roadmap.md:674,815-816,886-900 · docs/Database.md:311 |
| F-2 | SCHEMA §3's secondary-growth trigger still reads the pre-D101 "Life-Fully-Logged" rules — contradicts D093/D101/B4 | SCHEMA.md §3 |
| F-11 | B4's ">=3 branches" makes maturity unreachable for single-domain users — first bloom never comes, "nothing unrewarded" breaks (contradicts D090 C + D101(1)) | SCHEMA 2.4 B4 · D090 C · D101(1) |
| F-12 | Ring-year domain set double-locked: six (D101) vs the canonical seven (D104) — the ring brand's meaning is undefined | D101(2) vs D104(3) · SCHEMA 2.3 |
| F-13 | A2 presence bars diverge from the locked qualifyingEntry owners (body/media/adopted); D100's shared predicate half-applied — the one-owner rule is violated | SCHEMA 2.4 A2 · Gamification.md qualifyingEntry · D100(3) · D110(6) |
| F-14 | coachEngagement (H-03) referenced in three locked artifacts, defined nowhere; its M8 event kinds unratified | SCHEMA 2.4 E11 · 2.5 B-11 · D110(1) · H-coach-privacy H-03 |

## Coverage proof

- All eight design docs + the full D085–D113 records + the wave-1/wave-2
  meta-audits and their briefs read in full; every finding checked against
  the wave records for non-duplication (wave-1 N-1…N-7, wave-2 A–H + IA-1…
  IA-10 + G-1…G-5: none re-reported; F-12 and F-13 extend wave-2's F-03/F-17
  family but are new contradictions between LOCKED records D100–D113 that
  the wave-2 arbitrations themselves created — D104 after D101, B4 after
  F-31, D110 after H-03).
- Every hunt dimension yielded findings (no empty result): docs-pass 3 ·
  test strategy 4 · roadmap 1 · vocabulary 1 · education 1 · gamification 4
  · implementation order 2 · emotional design 5 — plus cross-cutting
  governance (F-5) and one naming/contract ambiguity shared by dims 4/8
  (F-9 → F-20).
- Residuals the next session must close: B4's re-derivation (F-11), the
  ring domain set (F-12), the coachEngagement definition (F-14), the
  amendment register (F-1), and the P-05/P-06/D M-4/G-1/P-07 numbers
  (F-4/F-5).