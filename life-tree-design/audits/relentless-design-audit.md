# RELENTLESS DESIGN AUDIT — the final design-front wave (post-D114)

**Audit date:** 2026-09-23 · **Auditor:** relentless design-front auditor (final wave)
**Scope:** the LOCKED design as it stands after the D114 closure round —
VISION.md (all 17 principles + the organ map + §6/§8), SCHEMA.md (Artifacts
1–3, the derivation contract), TRAIT-SPACE.md, ACHIEVEMENT-SCAN.md (§1.5
identity axis + the full ladder), LOOPHOLES.md, INPUT-INVENTORY.md,
TEMP-PLANNING tree-7 (D085–D114, verbatim), PLAN.md, both final audits
(final-consistency-audit.md, final-adversarial-audit.md), docs/DesignSystem.md
(the Heartwood identity), docs/Roadmap.md M9, docs/UIUX.md (tree references),
docs/DecisionLog.md (verified: zero D085–D114 entries).

**Pre-verified:** D114 closed the previous waves' findings — the quiet-weeks
gap (consistency CRIT-1), storage-leaf tenure floor (CRIT-2), contractile
gate inversion (MAJ-1), particle cap (MAJ-2), F-11 (maturity gate), F-12
(ring domain set), the SCHEMA §3 stale trigger (F-2), the D097 citation, the
matrix G-1 SEED-bank form, the future-dating clamp, the "never dissolves"
ratchet, LOOPHOLES §7/§8 refresh. `relentless-logic-audit.md` does not
exist — nothing re-audited here, all findings below are new or residual.

**Method — four walks:** (1) the vision-pillar check, fresh; (2) the
five-moment experience walk; (3) the cohesion walk on a constructed mature
tree; (4) the Heartwood fit. Every finding traces to a doc location.

---

## 1. THE VISION-PILLAR CHECK (fresh)

| # | Pillar | Verdict | Evidence / thin spots |
|---|---|---|---|
| a | Every input feeds the tree | **PASS** | INPUT-INVENTORY is exhaustive (23 event types, 7 classes, future features classified at design time); the constraint register (§14) states what CANNOT feed (imports, settings, browsing, adopted-before-adoption, future-dated). Nothing decorative: the F-03 flourish is a manifestation of a real PR event (class 4/6), not decoration. |
| b | Real botanical fidelity | **PASS** | Two-engine law, chronological spine, cambium/rings/vascular/buds/bud-scales/dormancy/phyllotaxy/spurs/inflorescences, D095's winter states are botanically literal (leaf-buds on bare branches, winter-persistent fruits, nothing blooms in winter), D088 dormancy-with-tip-buds. |
| c | Per-user uniqueness, structural AND visual, emergent | **PASS** | 4 axes + DV-C4 (order of first use, life-area mix, weekly-rhythm texture) + within-tier variance (D113) + derived accents (D086). Deterministic, explainable. Thin: the uniqueness acceptance bar (how many distinct signatures) has no number — test-strategy deferral (F-4), home Step 9. |
| d | Years-scale growth mirroring life | **PASS** | Stage clock (5 years to maturity, 10 to old-growth), ring-years, stage-years, branch rings, twig retention window (C5), multi-year currency gated behind floors. The "no visible change across a month" rule holds: monthly = twigs only; seasons are the year's heartbeat. |
| e | Tree = cohesive view + navigation surface opening feeds | **PASS** | D088 duality + VISION §15 (branch→feed, vascular→nutrition, leaf→memory, fruit→goal, ring→year review) + the M9 nav tab. Thin: the dashboard↔tree relationship (DV-M4) and the feed-open mechanics (in-tab sheet vs tab switch, D111(1) tap actions) are deferred to Step 7/tree-4 — the "meta-UI" claim's strongest expression is still un-designed. Finding M-7. |
| f | Anatomy views for every organ | **PASS** | VISION §16 complete: root transverse, stem transverse, leaf cross-section, trunk rings, time-lapse — each data-mapped; cheap-render path in TRAIT-SPACE §5. |
| g | Full trait utilization (17-audit) | **PASS (committed, not executed)** | D112(3)+D113(5) lock the FOUR-status audit (WIRED / RESERVED-UNMAPPED / STRUCTURAL / EXCLUDED-BY-DESIGN), the honest-skip precedent, and the permanent-exclusion list (marshy/aquatic, haustoria, traps, rhizomes). Execution is PLAN Step 7 — a named home, but the 17-audit table itself does not exist yet; it is the single biggest remaining "variety bounded by the research" deliverable. Finding M-3 is its first pre-requirement. |
| h | Super-hard achievements = large unique visuals | **PASS** | D086 hybrid (deterministic core + derived accents), the full rarity ladder (131 trophies + 47 rungs), Grove = transformation, C4 legend cap (1/bloom + 1 all-time crown), D096 tier-marked banked buds, within-tier variance. Thin: the transformation's PERSISTENCE is unstated (F-20) — see M-5. |
| i | Consistency = beauty | **PASS** | D088 F + principle 10: tenure, branch rings, canopy density (twigs), caudex, reaction-wood history, winter storage all compound; twigs = the canopy mass. |
| j | Cohesive composite, never a zombie | **PASS (with one live vector)** | Gradient coherence: axis positions = character, one character per organ, axis signatures (contradiction by construction), rank rule, universal adaptations, D112(1) identity coherence filter with sibling-family fallback. The Mediterranean overlap is explicitly designed-for. ONE zombie vector remains: per-branch/per-area leaf-family variation has no envelope rule binding it to the tree's leaf character — finding M-3. |
| k | Explainability | **PASS** | Why-panel at every stage (D094(4)), the D110 value law (4 clauses), mirror boundary (D099 N-6, D110(1)), tap-to-explain precedent (N-13), the panel carries the schedule and the bank. The strongest pillar in the design. |
| l | The duality (section UI = tree organ) | **PASS** | D088 B: habits = bud garden (DV-C5: the habit card IS the bud's local view), journal = leaves, nutrition = sap monitor, gym = branch growth, goals = orchard, achievements = garden. One state, one animation language, two scales. Thin: dashboard dual (DV-M4), calendar tint surface (DV-M2), coach-surface dual (DV-M3) all deferred to Step 7 — the section duals are locked, the shell duals are not. Finding M-7. |
| m | Beauty with only 5 branches (the twig layer) | **PASS (contract-level)** | D088 A: twigs = one per month of sustained presence, canopy mass = consistency made visible; C5 bounds the mass (≤12/branch/yr + 3-yr retention, older twigs merge into woody character — the LOD honesty). The proof is the mockup step; the contract is right. |
| n | Visible seasonality (cherry-blossom standard) | **PASS** | D085 layered (calendar skeleton + data intensity), D095 per-organ states, the winter bank → spring flush, F1 fixed dates + stored-timezone render clock, bloom ephemerality (the cherry-blossom brevity, explicit), autumn color/fruit + leaf-fall with litter (D111(5)). ONE record drift: D085's "active winter logging = greener canopy" contradicts D095's winter leaf-bud model — finding M-4. |
| o | Beautiful from day 1 | **PASS (one real gap)** | D094(1): the seed is a closed package in heartwood language, ghosted branch-buds, bank counter, the why-panel promise. The gap: after germination, a new user's entries have NO visible form until the first twig (≥15 in-window days/month) — weeks of invisible content, counter-only. Finding M-2. |
| p | Family of unique trees | **PASS** | Deterministic high-dimensional morphology (DV-C4) + derived accents + within-tier variance + the 17-audit's wiring commitment. |

Pillar verdict: **15 PASS, 2 PASS-with-commitment (g, m's proof), every pillar
delivered or explicitly instrumented.** No pillar fails outright.

---

## 2. THE EXPERIENCE WALK (five moments, fresh eyes)

### Moment 1 — Day 1 (the seed)
The locked day-1: a beautiful closed seed, 5 ghosted branch-buds ("where your
branches will grow"), the bank counter, one why-panel line. First log →
germination (~3s: crack, root curls, stem rises, first achievement bud).
**Reads:** quiet, ceremonial, heartwood — right. The hook works.
**Thin spots:**
- The bank counter says "earned achievements bud here" — but D114's G-1 now
  banks ALL classes at SEED (content, completions, measurements, dates,
  goals). The day-1 why-panel line only mentions achievements. The seed's
  counter must communicate that the USER'S OWN ENTRIES are banked too, or
  the first entry's invisibility reads as a bug. (feeds M-2)
- F-17's guilt risk starts here: the "next-tick progress" fraction (D094(4))
  is always-on. A user who logs 14 days then stops sees "14/15 — one more
  day" forever. The staleness rule (F-17's proposal) is not locked. (M-6)

### Moment 2 — Week 3
A consistent user earns their first twig (15 in-window days), the first
branch extends (queued ceremony on open), the habit bud bursts daily (the
duality's strongest moment — the check-in pop IS the bud burst, one
animation language), leaf clusters appear, 2–5 banked Sprout/Root buds.
**Reads:** alive, honest, the first visible reward. Strong.
**Thin spots:**
- The five-bud confusion (F-9): a week-3 tree can show habit buds, banked
  achievement buds, a ghosted branch-bud, leaf clusters, and (in winter) a
  leaf-bud — five meanings of "bud" on one small tree. The why-panel and
  the F-9 glossary mitigate, but the VISUAL grammar that distinguishes them
  (tier marks, placement, scale) is a Step-7 deliverable. The 17-audit's
  WIRED column must include a "bud form" dimension with the five-way
  distinction. (M-3 extends to this)
- The sparse/even-rhythm user sees nothing for months — F-19(2)'s thinness;
  its proposal (early subtle-tier survival texture below the D1 floor) is a
  candidate with a paper-run home, not a lock. (M-6)
- Confusion check: the first branch extends at 15 days, not at a stage
  transition — the strip + why-panel carry it. OK.

### Moment 3 — The first winter
Leaf-fall (mass re-bake + litter picture), bare branches covered in leaf-
buds, habit buds scale-wrapped, winter-earned trophies bank ("blooms when
the tree wakes"), a winter-completed goal hangs as a winter-persistent
fruit, the annual ring sliver closes at the ANCHORED boundary.
**Reads:** the design's most poetic mechanism — the winter bank → spring
flush is genuinely beautiful and botanically true.
**Thin spots:**
- The "my tree died" misread: a SEEDLING losing its leaves right as the
  user got attached. D095's leaf-buds + D111(3)'s text line ("Winter") +
  the why-panel ("resting — the buds are next year's leaves") mitigate —
  but the FIRST-AUTUMN LESSON belongs to the D M-4 education ladder, which
  was never locked (F-10). The #1 comprehension moment of the young tree's
  life has no copy contract. (M-6)
- Ring timing: "the ring closes at the year boundary" (D085) vs anchored
  365-day windows (D090 C, F3). The ring closes at the ANCHORED boundary;
  the annual bloom is calendar. For an anchor born in June, "first ring"
  arrives in June, not January — the why-panel must say so; unstated copy
  rule. (M-6/M-8, minor)

### Moment 4 — The maturity bloom (~year 2, D114: ≥2 stage-years + 1 branch
at structural depth ≥6 twigs)
All banked Sprout/Root/Branch/Heartwood buds burst family by family, soft
bloom rain, 8–12 s, skippable, once. The earned cherry-blossom moment.
**Reads:** the designed peak; the blush (DV-C2) makes it the ONE saturation
moment — perfectly heartwood.
**Thin spots — two real:**
- **The every-other-day user never gets here (finding M-1).** B4's
  structural-depth bar (≥6 twigs) inherits the twig bar's monthly
  resolution (A3: ≥15 in-window days per 30-day month). A constructible
  archetype — ~55% year-round presence in even sub-half-month cycles
  (e.g., 5-on/5-off with light extra logging, or every-other-day with rest
  structure): 200+ in-window days/year (2 stage-years ✓) but every 30-day
  month at 11–15 in-window days (0 twigs ✗) → POLE forever → the first
  bloom never comes → every bud banked forever. This is F-11's exact
  emotional failure ("nothing unrewarded" breaks; the why-panel's locked
  promise "blooms at the first bloom" becomes a permanent lie) through a
  different door — D114 fixed the single-domain door but left the
  rhythm-impaired door open, and D114's own claim ("the first bloom is
  reachable for EVERY user") is false for this archetype. Fix: B4's bar
  reads days, not twigs — e.g., "≥1 branch with ≥120 in-window days in the
  current window" (or "≥6 twigs OR ≥120 branch-days") — B4 is dev-tunable
  (D105), and the paper run's bursty archetype MUST include the
  every-other-day profile to verify the fix.
- The 47-bud bank: C1/C2 caps (15/bloom, 4 waves) handle the flood, but
  "47 pending" can read as a debt ledger (F-18) and a 4-wave spring drip
  can read as a slow faucet, not a payoff. F-18's copy proposals
  (achievement-neutral, "saved for the first bloom", crown renders only
  when earned, tiers as achieved objects) are not locked. (M-6)

### Moment 5 — The annual bloom at year 5
A mature crown (twigs within the 3-year retention), the gym leader
expressed, branch rings, the annual spring bloom with Ring-tier blooms +
the C4 legend transformation + the once-set crown, the winter bank → spring
flush each year, autumn fruit + color, honest dormancy, the why-panel
narrating the whole. For the M9 veteran: the D097 launch replay (20–40 s
time-lapse) is the app's most moving moment, by design.
**Reads:** the years-scale promise, delivered in contract.
**Thin spots:**
- The ephemeral scope (F-20, M-5): does the Grove TRANSFORMATION fade in
  autumn like a flower, or persist? Unstated. If it fades, pillar (h)'s
  "visible at a glance" is true one season per year and the user's rarest
  visual silently disappears (the fade line "held in the archive" is
  F-20's proposal, not a lock). The crown persists (once-set, D107) —
  coherent — but only if the distinction is written into SCHEMA 2.5-A.
- The un-branded trunk: a 5-stage-year Mediterranean user with 0 ring-years
  shows a smooth trunk at maturity — honest (D090 C), but the why-panel
  line ("rings need all seven domains — the hardest honor") is un-locked
  copy. (M-6/M-8, minor)
- The legend card (F-21): "The rarest: Ink on the Page" for a low-tier
  user — tier-gating proposal un-locked. (M-6)

**Experience-walk verdict:** four of five moments are delivered in contract
and beautifully; the maturity bloom has the one structural blocker (M-1),
and the day-1/week-3 visibility gap (M-2) plus the un-locked emotional
guardrails (M-6) are the soft spots.

---

## 3. THE COHESION WALK (Mediterranean-overlap archetype)

**Constructed tree (per D088's own worked example, extended):** gym+journal
strong, nutrition sparse (≤40 days/yr), habits steady, 5 stage-years,
3 Groves (III-28 Five Years in Iron, I-17 Half a Decade of Honesty, IX-2
Six for Six), a 365-day streak (II-12/III-22 family), one nutrition dormancy
+ revival, a live 10-year goal, coach engagement, a gym→journal L-10 insight.

**Axes:** resource ≈ 0.6–0.7 · rhythm steady · balance ≈ 0.45–0.55
(gym+journal dominate 7 domains) · tenure 0.5.

**Eligibility scan against the E-group signatures:**
- caudex (tenure ≥0.7, resource ≤0.6): ✗ both — correctly absent.
- buttress (balance ≥0.7, resource ≥0.6): ✗ balance — correctly absent.
- phyllodes (resource ≤0.4): ✗ — correctly absent.
- cladodes (streak-without-entries ≥0.6): ✗ (journal is strong) — correct.
- storage leaves (media share ≥0.5): ✗ — correct.
- thorns (365-day streak + tenure ≥2): ✓ — manifests at the next annual
  bloom (D093). Correct: the armor IS earned.
- spines (subtle, 100-day): ✓ — no floor (D089). Correct.
- tendrils (live >1-year goal): ✓ — correct.
- reaction wood + epicormic (the revival): ✓ universal — correct.
- contractile (3 rising stage-years): ✓ subtle — correct.
- mycorrhizal (coachEngagement ≥ threshold): ✓ universal — correct
  (threshold = G-group register row, home: Step 6 owner contracts — the
  H-03 owner is still undefined, recorded deferral, not a hole in the
  coherence envelope).
- stolons (L-10 gym→journal ×3 windows): ✓ universal — the D088 worked
  example itself. Correct.
- bracts (ceremony display): ✓ — correct.
- bud scales (dormant habits): ✓ — correct.

**Flower identity scan (D112(1)):** the three Groves carry III=capitulum,
I=raceme/panicle, IX=syconium identities. The syconium's axis signature
(balance ≥0.6) is NOT met (balance ≈ 0.5) → the identity is rejected and
manifests in a COMPATIBLE SIBLING FAMILY, same tier, why-panel explains the
substitution. The coherence envelope WORKED — this is the D112 mechanism
firing exactly as designed. Residual: the sibling-family table and the
full per-family axis signatures are illustrative ("e.g."), not complete —
a Step 7 deliverable (M-9).

**Zombie scan — what is on this tree that shouldn't be?** Nothing. Every
adaptation passes its gate; contradictions impossible by construction;
rank rule governs the subtle tier; the crown sets only from the first/rarest
Grove (C4); no empty legend slot (pending F-18(b) lock). The trunk shows
zero rings (ring-years = the 7-domain brand, D114(3)) — honest, explained,
intended (D090 C).

**The one residue:** the LEAF FAMILY. TRAIT-SPACE §2 drives leaf family
"per-section character" and DV-C4 drives it "per journal AREA", while
TRAIT-SPACE §3's hard floor says the leaf family carries ONE character.
This Mediterranean tree's gym branch and journal branch render different
leaf families with no stated rule binding them to the tree's leaf character
— the one place a zombie can still crawl in, at the canopy's most visible
scale. **Fix (M-3):** the trait-space step (17-audit WIRED column) must
bind per-branch/per-area leaf variation to the tree's leaf character
(parameter variation within the family — size, margin, hue, density — never
a different family), plus a bud-form dimension (M-3b, from the experience
walk) and a sibling-family table (M-9).

**Cohesion-walk verdict:** the envelope is real and enforced by
construction; the walk found exactly one live residue (M-3) and two
unbuilt tables with named homes.

---

## 4. THE HEARTWOOD FIT (fresh)

Heartwood = DesignSystem.md: ink/paper dark-first, muted leaf-green,
gold-for-streaks-only, the restraint contract (one ambience moment per
screen, ≤2 accent elements, ≥96% opaque surfaces, no glow/neon/frosted
glass/gradient text), quiet discipline not gamified hustle, the plant-like
ink-wash mood, "no guilt copy anywhere" (Roadmap M9).

| Element | Fit |
|---|---|
| The seed (D094(1)) | "One beautiful stylized seed in the tree space (**heartwood language**)" — explicitly heartwood. ✓ |
| Germination | Crack + root + stem, ~3 s, quiet, botanical. ✓ |
| The first bloom / ink-wash blush (D112 DV-C2) | "A muted ink-wash blush is the ONE allowed saturation moment… the bloom palette derives from the Heartwood ink/paper tokens (dark-first), the blush reserved for the flowering events (**like gold is for streaks**)". This is the single best Heartwood sentence in the design — the blush is the gold-analog, one saturation moment, token-derived, dev-tunable with a mockup-step tuning gate. ✓ |
| Autumn colors | "Autumn fruit/color" is specified (D085/D095) but the autumn palette's token derivation is NOT stated — it must also derive from the ink/paper tokens (muted rust/amber, never saturated orange). Implied by DV-C2's rule, un-locked. (M-8) |
| The why-panel voice | D110's value law (facts-only, 4 clauses, never LLM narrative), the D099 "resting" copy, quiet numbers — the most heartwood element in the design. ✓ |
| The ceremony language | D094 durations (2–4 s, first bloom 8–12 s, "nothing loops, repeats, or spams"), particle caps (~150–300), reduced-motion tiers with static fallbacks, ceremonies queue and never interrupt writing (D108(5)) — the restraint contract in motion. ✓ |
| Gold discipline | ACHIEVEMENT-SCAN §5: the tree never uses gold for achievements; the blush is its substitute (D112(2)). ✓ |
| The bank counter | A quiet composition line ("5 buds: 3 Sprout, 1 Heartwood, 1 Grove") — honest, not a progress bar. ✓ (with F-18's debt-ledger copy risk, M-6) |
| The bloom rain | The ONE allowed celebration — the loader's brand-beat precedent; capped, tiered, skippable. Risk: reads as confetti if over-saturated — the mockup step (D112's user note) is the tuning gate. ✓ with a watch |
| The summer canopy | Must be muted-ink greens, not saturated forest — un-locked token rule (same M-8 as autumn). |

**Anything that would read as "a different app"?** No — the two danger
points (rainbow flowers, gamified HUD) are structurally excluded by the
blush lock and the fact-only voice. The fit is genuinely strong; the
residue is that DV-C2's token-derivation rule covers the BLOOM only — it
must be extended to every tree palette (canopy, autumn, fruit, bark,
winter) so the tree can never drift off-identity (M-8).

---

## 5. THE FINDINGS (post-D114 residuals, fresh)

| # | Sev | Finding | Location | Proposal |
|---|---|---|---|---|
| M-1 | **MAJOR** | B4's structural-depth bar (≥6 twigs) inherits the twig bar's monthly resolution (A3): a constructible archetype (~55% year-round presence in even sub-half-month cycles — 200+ in-window days/yr, every month <15 in-window) accumulates stage-years but never 6 twigs → POLE forever → the first bloom never comes → "nothing unrewarded" breaks again, and D114's "reachable for EVERY user" is false for this archetype | SCHEMA 2.4 A3/B4 · D114(2) · D101(1) | B4's bar reads days: "≥1 branch with ≥120 in-window days in the current window (or ≥6 twigs)" — dev-tunable (D105); the paper run's bursty archetype must include the every-other-day profile as a pass/fail check |
| M-2 | **MAJOR** | The SEEDLING's banked content has no visible form: entries 1–14 (until the first twig) render nothing but a counter; D114's G-1 fix covers the SEED's counter only; F-10(a)'s leaf-bud-cluster proposal was never locked | LOOPHOLES §3 matrix G-1 · D114 mechanical fixes · D095(2) | Lock the seedling's banked form: first weeks' entries render as a small leaf-bud cluster on the stem ("your entries are growing here") — D095's winter-leaf-bud language applied to the young tree; day-1 why-panel line mentions content banking, not just achievements |
| M-3 | **MAJOR** | The per-branch/per-area leaf-family variation has no envelope rule: TRAIT-SPACE §2 (per-section character) + DV-C4 (per journal area) sit in tension with §3's "one character per organ (leaf family)" — the one place a zombie can still enter, at the canopy's most visible scale | TRAIT-SPACE §2/§3 · D112(4) · VISION §6 | The 17-audit's WIRED column must bind branch/area leaf variation to the tree's leaf character (parameter variation within the family — size, margin, hue, density — never a different family); add a "bud form" dimension (the five-way bud distinction: habit / achievement / branch / leaf / scale) |
| M-4 | **MINOR–MAJOR** | Record drift: D085's "active winter logging = greener canopy" contradicts D095's winter leaf-bud model (leaves bank as buds on bare branches) — the later, more beautiful model wins, unstated | TEMP-PLANNING D085 INTENSITY · D095(2) | Amend D085 at the docs pass: the winter intensity modifier = a denser bank of leaf-buds / a fuller spring flush, never a green winter canopy |
| M-5 | **MINOR–MAJOR** | The Grove transformation's persistence is unstated: if it fades with the season like a flower (D095 ephemerality), pillar (h)'s "visible at a glance" is true one season per year, and the fade line is F-20's proposal, not a lock | D095 · D092(5) · C4 · D107 (legendAchievementId) | One contract line in SCHEMA 2.5-A: the CROWN and the current-year legend transformation are the only winter-persistent blooms (the transformation holds through the following winter, then yields to next year's legend); a "the season's blooms are held in the archive" strip line on fade |
| M-6 | **MINOR** | The emotional guardrails are all proposals, none locked: F-17 (next-tick fraction → guilt meter for the stagnant user), F-18 (bank counter → debt ledger; empty crown slot), F-19(2) (sparse user's two-year thinness; early survival texture candidate), F-21 (legend card tier-gate), plus the D M-4 education ladder (never resolved) whose first-autumn "resting" lesson is the young tree's #1 comprehension moment | F-17/F-18/F-19/F-21 in final-adversarial-audit.md · D111's resolve list (D M-4 absent) · D094(4) | Lock them as one batch at the mockup step: the staleness rule, the achievement-neutral counter copy, "no empty crown slot ever renders", the tier-gated legend card, the D M-4 ladder as a contract row (welcome → day-1 bank → germination → first twig → first-autumn resting → first-bloom anticipation → duality), and the ring-lessness why-panel line |
| M-7 | **MINOR** | The shell duals are un-designed: the dashboard↔tree relationship (DV-M4), the calendar tint surface (DV-M2), the coach-surface dual (DV-M3), and the feed-open mechanics (in-tab sheet vs tab switch, D111(1)) — the "meta-UI" claim's strongest expressions | DV-M4/DV-M2/DV-M3 (wave-2 E-brief) · VISION §15 · D111(1) | Step 7 deliverables, but state the default NOW: opening an organ opens a sheet-within-the-tree-tab (never a disruptive tab switch) until the mockups decide otherwise |
| M-8 | **MINOR** | DV-C2's token-derivation rule covers the bloom only: the canopy, autumn, fruit, bark, and winter palettes are not bound to the ink/paper tokens — the tree could drift off-identity | D112(2) · TRAIT-SPACE §5 | Extend the rule: EVERY tree palette derives from the Heartwood tokens (muted greens/rusts/ambers within the accent+gold families), dev-tunable, deuteranopia-passed (D111(3)) |
| M-9 | **MINOR** | Two unbuilt tables with named homes: the flower-family sibling table + full per-family axis signatures (D112(1) is illustrative: "e.g."), and the coachEngagement owner + G-group threshold (H-03, deferred to Step 6) | D112(1) · SCHEMA 2.4 E11 · 2.5 B-11 · H-coach-privacy H-03 | Step 7 (sibling table) + Step 6 (owner contracts) — already homed; this audit registers them as the cohesion envelope's remaining unbuilt parts |
| M-10 | **MINOR** | Records: docs/DecisionLog.md has zero D085–D114 entries (verified); the A2-vs-owner presence divergence (F-13) and the uniqueness acceptance bar (F-4) sit in the Step-6/Step-9 deferrals | docs/DecisionLog.md · F-13 · F-4 | The docs-pass amendment register (D114's deferral, home PLAN step 10) must include these rows explicitly |

**Non-findings (verified clean, noted for the record):** the D112(1)
sibling-family fallback fired correctly in the cohesion walk; the
contradiction-by-construction math holds for caudex/buttress and every
signature pair; the C4 legend cap prevents transformation inflation; the
winter bank → spring flush, the ephemeral bloom, and the anchored-vs-
calendar clock split are all internally consistent post-D114.

---

## 6. VERDICT

**PASS-WITH-FIXES.**

The design is beautiful and coherent at the contract level: 15 of 16
pillars deliver, the coherence envelope is enforced by construction, the
Heartwood fit is genuinely strong (the ink-wash blush lock is the exact
right call), and D114 genuinely closed the previous waves' findings. But a
clean PASS would be false on one count: **the maturity gate's twig bar
(M-1) re-opens F-11's "the first bloom never comes" failure for a
constructible every-other-day archetype — the design's own core promise
("nothing unrewarded", "reachable for EVERY user") is not yet true for
every user.** That is one register edit (B4 is dev-tunable) plus one paper-
run archetype, but it is a design-level fix, not a record correction.

The remaining findings are contract-level (M-2), envelope-level (M-3),
record-drift (M-4), and lock-the-proposal-level (M-5…M-10) — all with named
homes, none requiring a reopened locked decision.

**Must-fix before the engine contract:** M-1 (B4 bar + paper-run
archetype) · M-2 (seedling banked form) · M-3 (leaf-variation envelope rule
into the 17-audit).
**Must-lock at the mockup/Step-7 gate:** M-5 (transformation persistence),
M-6 (the emotional-guardrail batch + D M-4 ladder), M-8 (token derivation
for all tree palettes).
**Housekeeping (docs pass):** M-4, M-7, M-9, M-10.