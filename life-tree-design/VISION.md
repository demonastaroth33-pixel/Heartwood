# LIFE TREE VISION — the fundamental understanding

**Recorded 2026-08-29 (design session zero).** This is the canonical
statement of what the Life Tree IS, agreed between the user and the AI,
for every future session to return to. If a future decision contradicts
this document, it needs a DecisionLog entry explaining the change.

> **How to read:** Section 1 = the vision in one paragraph. Section 2 =
> the LOCKED principles (user-approved, non-negotiable). Section 3 = the
> organ-map BASELINE — explicitly REFACTORABLE (the user's directive:
> rethink everything, change anything if better, revert if not). Section
> 4 = open decision points (must be resolved at schema time). Section 5 =
> the engine implications. Section 6 = the cohesion imperative (the
> single most important design constraint).

---

## 1. The vision in one paragraph

The Life Tree is the app's living meta-surface: a single organism that
IS the user's life data, grown with real botanical fidelity. Every input
the app records — journal entries, habit completions, gym logs, food
logs, check-ins, goals, achievements — feeds a specific part of the
tree. Each major app section corresponds to a major part of the tree
(nutrition = the vascular system, sections = branches, entries =
leaves, achievements = flowers, years = rings). The tree grows SLOWLY,
over YEARS, genuinely mirroring how the user's life changes. Every
user's tree is unique — structurally AND visually — because uniqueness
is emergent from their decisions, never chosen. The tree is a composite:
it pulls traits from across different real tree species (crown from one
lineage, bark from another, leaf family from another), and the composite
is decided purely by the user's data. Super-hard achievements (the
Ghost-in-the-Machine tier) grant large, standout, unique visuals. Fruits
and plant modifications have their places. Everything is explainable —
the user can always see WHY the tree looks the way it does. The tree is
the peak of the entire app: the biggest, most beautiful, most
intricate, most personal system ever built — the whole app's purpose
made visible as one living thing.

---

## 2. LOCKED principles (user-approved)

1. **EVERYTHING feeds the tree.** Every input in the app maps to a
   botanical organ. Nothing is decorative. (User: "every single input in
   the app feeds the life tree from the seed to a tree".)
2. **Real botanical fidelity.** Growth follows actual botany: the
   chronological spine (seed → germination → seedling → sapling → pole →
   mature), the two-engine law (extension at the tips = activity volume;
   thickening in the cambium = year-round consistency), real anatomy
   (vascular bundles, rings, bark, leaves, flowers, inflorescences,
   fruits, root/leaf/stem modifications). Authority:
   `research-botany/MASTER-Botany-Reference.md` (the full botanical
   knowledge base, Parts 1–13).
3. **Derived-only + anti-farm (genetic).** The tree's state is derived
   purely from the event log. No direct input, no painting rings — rings
   are grown. The growth engine inherits the locked derived-only,
   facts-only, anti-farm discipline.
4. **Per-user uniqueness — structural AND visual, emergent, never
   chosen.** Different decisions give different results: different
   forms, different flowers, different ring types, different bark,
   different everything — completely determined by the user's data.
   No skins, no user-picked traits. The engine is deterministic: same
   data → same tree (reproducible, testable, honest); uniqueness falls
   out because the trait space is large and lives differ.
5. **Years, not months.** The tree is a multi-year organism. It must NOT
   change visibly across a month. It grows over years of logging and
   inputting, genuinely mirroring life change over time. (Design
   implication: extension gives slow, monthly-visible life; rings,
   flowers, fruits are the multi-year currency; the stage transitions
   are the early milestones.)
6. **Seasonality is real and apparent.** The tree actively changes
   across seasons — beautifully and visibly (the cherry-blossom-Japan
   standard: everyone can see it). (Which seasons drive it = OPEN,
   section 4.)
7. **Composite species, not one tree.** The app does NOT grow a single
   species. The research is used to pull characteristics from across
   different real trees and mesh them into one beautiful tree — purely
   determined by user decision. The "species" of the user's tree emerges
   from their life.
8. **Cohesion is the single most important constraint.** Because the
   tree is a composite of traits from different species, the danger is a
   "zombie mishmash" that looks broken. Even though it is a mishmash,
   everything must look beautiful and cohesive. (See section 6 — the
   coherence-envelope rule.)
9. **Super-hard achievements = large unique visuals.** The hardest
   achievements in the entire list (the Ghost-in-the-Machine family is
   the hardest tier — user-confirmed memory) grant a really large,
   unique, standout visual difference — NOT just a small flower — a
   transformation visible at a glance, almost never seen on other users'
   trees. (Deterministic-core vs literally-one-of-a-kind = OPEN,
   section 4.)
10. **Long consistency compounds — and the most consistent users get
    the most beautiful trees with the most meaningful modifications.**
    (User directive, locked D088.) Consistency compounds at every
    layer: the tenure axis, branch rings, canopy density (twigs),
    caudex, reaction-wood history, winter storage. A consistent
    user's tree is structurally richer at EVERY level — the tree is
    the mirror of sustained effort, and sustained effort is rewarded
    with depth, not decoration.
11. **Transparency / explainability.** The user can see everything:
    different fruit types, flower types, inflorescences, traits — all
    cleanly visible, and the user can always see WHY something is the
    way it is. The system already passes a shit-ton of data; the
    why-panel is a derived explanation.
12. **A family of trees.** Different users give different trees — the
    app grows a family of incredibly unique trees, each one its user's.
13. **UI correspondence.** Every section's UI directly corresponds to
    what the Life Tree does: nutrition → vascular, fitness → its organ,
    habits → the habit-planting model (which itself may evolve), etc.
    Each section's visual role is explicit and designed.
14. **Refactor-first on the schema.** The organ map in section 3 is a
    BASELINE to attack, not a baseline to keep. The user's directive:
    rethink, refactor, change anything if something is better; if not
    better, revert to the old; beautify and cohere at every step —
    without breaking anything already locked.
14b. **Stage-gated manifestation (the master clock).** The tree's life
    stage (seed → seedling → sapling → pole → mature → old-growth)
    is the master clock: every stage has a CAPACITY (leaves,
    branches, flowers, structures it can honestly express), and every
    visual manifestation passes through the stage gate. Data is never
    lost and never unrewarded — it is BANKED in stage-appropriate
    form (achievement buds, leaf clusters, branch-buds on the trunk)
    until the tree can express it. Pre-maturity achievements are
    flower buds; the first flowering stage bursts all banked buds
    into the first bloom together. The flower-layer fallback (D086)
    is stage-aware. (LOOPHOLES.md L-02…L-05, locked 2026-08-29.)
15. **The tree is the app's navigation surface (the original soul,
    evolved).** The Life Tree STARTED as "a cohesive view of everything
    that happened across my life" — that factor stays, and is now
    integrated into FEEDS: every part of the tree that corresponds to a
    section (nutrition, gym, journal, habits) opens that section's
    content beautifully — opening a branch shows its domain's feed,
    opening the vascular system shows the nutrition view, opening a
    leaf shows the memory. The tree is not a widget beside the app —
    it IS the meta-UI the sections live in. (This is the strongest
    expression of principle 13: UI correspondence runs both ways —
    sections feed the tree, and the tree opens the sections.)
16. **Anatomical views for every organ — the full section-view mode.**
    Beyond the trunk cross-section and time-lapse: the user can see the
    TRANSVERSE section of the roots, the transverse section of the
    stem, the cross-section of the leaf — every part of the plant
    beautifully corresponds to what the user input and which families
    they have. The anatomy views are data-mapped: the trunk's rings
    and vascular bundles show year/nutrition state, the root's stele
    shows the foundation state, the leaf's palisade/stomata show its
    life state. (Root transverse section + stem transverse section +
    leaf cross-section + trunk rings + time-lapse = the complete
    review/anatomy mode.)
17. **Full trait utilization — the research is the uniqueness engine.**
    The researched variety is COMPLETELY utilized: the different fruit
    types, the different inflorescences, the different plant
    modifications — all actively used to build each user's uniquely
    beautiful tree. Nothing researched sits unused: if it's in the
    botanical master (all 25 inflorescences, all 30 fruit types, all
    46 organ modifications), it is available as a derived trait.

---

## 3. The organ map — LOCKED STRUCTURE (D088 supersedes the baseline)

> History: the table below was proposed as a REFACTORABLE baseline
> (principle 14 — refactor-first). The refactor session (D085–D088)
> attacked it and locked the refined structure; the refactored
> branches/adaptations/axes live in TEMP-PLANNING tree-7 (D088) and
> SCHEMA.md. What remains below is the settled mapping.

| App domain | Locked organ | Botanical mechanism | Locked detail |
|---|---|---|---|
| Longevity / years | **Trunk + annual rings** | Secondary growth, cambium (Part 7) | Ring per qualifying year — botanically literal |
| The whole life | **Trunk = the life itself** | — | The only organ belonging to no section: aggregate of ALL logging; girth = overall consistency |
| Sections (gym, journal, nutrition, habits, goals) | **5 fixed first-order branches** | Branching, apical dominance (Part 4.5) | All present from day one; leader = most sustained domain; forks only from sustained differentiation (D088) |
| Monthly rhythm | **Twigs** | Tip growth, phyllotaxy (Parts 4.1, 4.4) | One twig per month of sustained presence — the canopy mass (D088) |
| Entries / trophies / memories | **Leaves** | Leaf anatomy, leaf fall (Part 6) | The explorable memory surface; media-rich = storage leaves |
| Habits | **Buds** | Buds, bud scales, dormancy (Parts 4.3, 9.2) | D087: streak momentum = swelling, completion = burst, abandoned = scar |
| Nutrition | **Vascular system (xylem/phloem)** | Sap, sinks/sources (Part 8) | User-wired: nutrition = the tree's throughput; runs through the trunk |
| Gym | **Branch growth + wood quality** | Extension, latewood density (Part 7.2) | Strength standards = girth trend; training consistency = dense latewood |
| Achievements | **Flowers** | Inflorescences, rarity (Part 10) | Rarity ladder from the full achievement scan (D086); top tier = transformation |
| Goals / milestones | **Fruits on spurs** | Fruit taxonomy, fruit spurs (Parts 4.5, 10.5) | Completed goals bear fruit; long-horizon goals = tendrils reaching |
| Special life-states | **Modifications (adaptations)** | All modification catalogs (Parts 4.6, 5.6, 6.5) | 14 mapped adaptations, achievement-triggered, axis-filtered (D088) |
| Consistency | **Cambium activity** | Growing season vs dormancy (Part 9) | Consistency = growing season; the most consistent get the most beautiful trees |
| Roots (foundation) | **Root system** | Root growth first, hidden half (Part 5) | Storage taproot + winter storage; foundation years |
| Yearly review | **Rings, cross-section, time-lapse** | Ring anatomy, transverse view (Part 7) | The review artifacts; anatomy views of every organ (principle 16) |
| The whole app | **Navigation surface + feeds** | — | The tree opens each section's content beautifully (principle 15) + the duality principle (D088) |
| Season cycle | **Seasonal states** | Phenology, dormancy (Part 9) | D085: calendar skeleton + data intensity |

**The two-engine law (engine core):** extension (new twigs/leaves/
branches/flowers — driven by activity volume) + thickening (ring
quality — driven by year-round consistency). A bursty user gets a tall
sparse tree; a consistent user gets a dense thick one. Both are
botanically true.

**Coherence:** no single environment — the tree's character is its
position on four continuous axes (resource, rhythm, balance, tenure),
one character per organ, contradictions impossible by construction
(D088, TRAIT-SPACE §3).

---

## 4. OPEN decision points (resolve at schema time)

1. **SEASONALITY DRIVER** — RESOLVED (D085, user approved Option C):
   the calendar year is the tree's skeleton (bloom in spring, canopy
   in summer, color/fruit in autumn, honest dormancy in winter, ring
   closes at the year boundary); the user's data modulates the
   intensity (rich journaling spring = dense bloom; active winter
   logging = greener canopy; quiet year = sparse bloom). The engine
   has a calendar season-phase function + data intensity modifiers.
2. **SUPER-HARD ACHIEVEMENT VISUAL** — RESOLVED (D086, user approved
   Option C hybrid): deterministic core + derived accents. The
   achievement grants its fixed designed transformation (same shape
   for every earner); the user's own data colors it (derived palette /
   accents). Fully deterministic + explainable. USER CORRECTION
   (recorded): Ghost-in-the-Machine is NOT the only hardest set —
   quite a few achievements across families need cohesive mapping;
   the rarity-tier ladder is built from the FULL scanned achievement
   list (every family, every tier) via a dedicated achievement-scan
   step in the schema session.
3. **HABIT MAPPING** — RESOLVED (D087, user approved Option C):
   every active habit = a bud on the habit branch — dormant when
   unworked, swelling with streak momentum, bursting into new growth
   on completion, withering honestly when abandoned; abandoned habits
   leave bud scars. Habit completions feed the extension engine. One
   system, botanical (the bud = the real unit of potential growth),
   keeps the planting soul.
4. **BRANCH REFACTOR** — RESOLVED (D088, user approved v4): 5
   first-order branches = the 5 FIXED app sections, all present from
   day one (no new domains, no branch scars — the tree mirrors effort
   rhythms across fixed branches); the leader (apical dominance) =
   the most sustained domain; forks = derived only from sustained
   sub-feature differentiation; twigs = one per month of sustained
   presence (the canopy mass, scale separation); branch rings = the
   domain's active years; dormancy + tip-bud revival instead of
   death; fruit spurs = completed goals.
5. **SPECIES-COMPOSITE RULES** — RESOLVED (D088, gradient coherence):
   no single environment type. Four continuous axes (resource,
   rhythm, balance, tenure — each 0.0–1.0, derived from the event
   log); the tree's position on the axes IS its character; one
   character per organ (same-organ contradictions forbidden);
   adaptations have axis signatures (contradictions impossible by
   construction); overlaps natural in the middle ranges (the
   Mediterranean position); rank rule for dominant vs subtle tiers;
   universal adaptations (reaction wood, epicormic, coach symbiosis,
   bracts, contractile roots, bud scales) appear anywhere. The
   achievement system is the trigger authority; the axis position
   decides manifestation; flower-layer fallback means no achievement
   is ever unrewarded.
6. **GHOST-IN-THE-MACHINE TIER** — folded into the achievement-scan
   sub-step (D086 correction: quite a few families are hardest; the
   full scanned list maps onto the rarity ladder cohesively).

---

## 5. Engine implications (what this means to build)

The Life Tree engine is the biggest system in the app:

- **Derivation engine:** event log → tree state, deterministic, cached,
  H3-owner functions. Two growth components (extension + thickening).
- **Trait space:** the morphological dictionary (from the botanical
  master's identification system: crown types, bark types, leaf shape
  families, margins, venation, phyllotaxy, inflorescence families,
  flower types, fruit types, ring characters, modifications) — large
  enough that real users never coincide.
- **Coherence envelopes (the anti-zombie rule):** traits are not picked
  independently — they are picked within a lineage character, with
  compatibility rules (section 6).
- **Rarity-tier visual system:** achievement tiers → visual magnitude
  (flower → special flower → large transformation); Ghost-in-the-
  Machine tier = the largest.
- **Seasonality system:** the year's rhythm (calendar skeleton + data
  intensity).
- **Explainability system:** the why-panel — every visible trait can
  answer "why is this so" from the derived data.
- **Stress testing:** the engine must be extensively stress-tested with
  seeded data (the locked L-10 discipline) — now at maximum scale:
  verify uniqueness actually differentiates, verify coherence holds,
  verify the growth curves across user archetypes.

---

## 6. The cohesion imperative (the single most important constraint)

The tree is a composite of traits from different species — the danger
is a "zombie mishmash" that looks broken or ugly. Even though it is a
mishmash, everything must look beautiful and cohesive. THIS IS THE
SINGLE MOST IMPORTANT THING in the whole design. The solution to be
designed at schema time:

- **Lineage character:** the engine first derives the user's tree
  CHARACTER (a coherent botanical family/ecology type — e.g., temperate
  hardwood, legume-family, rosaceous, willow-family, arid/succulent
  character) from the data; all trait selections then stay within that
  character's coherence envelope.
- **Compatibility rules:** a trait-compatibility matrix (which crown
  types, bark types, leaf families, flower families visually cohere);
  at most one or two ACCENT traits from outside the envelope (e.g., a
  special flower family for a unique achievement), chosen to harmonize.
- **Verification:** the seeded-data stress tests must include a
  coherence check — generated trees across user archetypes are reviewed
  for visual coherence before the engine ships.

---

## 7. The drafting strategy (where this design lives)

DECISION (AI recommendation, pending user confirmation): the Life Tree
design does NOT get drafted directly into TEMP-PLANNING.md. The full
design is too massive for the ledger. Instead:

1. `life-tree-design/` folder holds the master design docs: this
   VISION.md, then SCHEMA.md (the refactored organ map + input map),
   TRAIT-SPACE.md (the morphological dictionary + coherence envelopes),
   ENGINE-CONTRACT.md (derivation rules, thresholds, seasons, tiers).
2. TEMP-PLANNING.md's LIFE TREE DESIGN SYSTEM sections (tree-1..tree-6)
   receive the CONDENSED decision record (statuses, LANDS, pointers to
   the design docs) — the ledger stays the decision record, not the
   design.
3. At the docs pass, the drafter pipeline drafts from the design docs
   into docs/ (a new docs/LifeTree.md family) with DecisionLog entries
   (D08x+), per the existing pipeline discipline.

---

## 8. The response to "is this beautiful / has anyone built this"

The user's belief: this is genuinely beautiful and something no other
app or thing has ever built of this kind. The AI's assessment (recorded
agreement): correct. The closest things are grow-a-garden widgets
(Finch, Forest, tamagotchi apps — researched in research-journaling):
cosmetic skins over generic streaks — no real anatomy, no derived
logic, no years-scale, no explanation. A deterministic, multi-year,
botanically-faithful mirror of every life input, with per-user
morphological uniqueness, real seasonality, and full explainability —
does not exist. The only real risk is execution scale; that is what the
schema, the engine discipline, and seeded-data stress testing exist
for.