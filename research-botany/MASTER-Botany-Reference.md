# MASTER-BOTANY-REFERENCE.md

**The complete botanical growth reference for the Life Tree engine.**
(Super-thorough edition — seed to senescence, dicot focus, everything defined.)

> **What this is:** the single human-readable botanical knowledge base that
> the **Life Tree design system** and its growth engine are built from. Every
> plant structure, every growth process, every modification, every
> inflorescence, every fruit type, every seasonal behavior — captured in one
> chronological document, in plain language, with every term defined inline
> the first time it appears.
>
> **Who it's for:** the user (read it end to end to understand botany
> perfectly) and future AI sessions (cite `MASTER-Botany-Reference.md PART n`
> instead of relying on memory).
>
> **Scope:** angiosperm **dicots** (eudicots) — trees, shrubs, vines,
> herbs — the plant family the Life Tree belongs to. Monocot facts appear
> only where a contrast is needed (grasses, lilies, palms) so the dicot
> story stays clean. Gymnosperms (pines) are noted once where wood is
> discussed and otherwise out of scope.
>
> **How to read:** the spine is **chronological** — a plant's life from seed
> to death, in the order growth actually happens (Parts 1–3: birth; Parts
> 4–6: the three organs; Part 7: thickening; Part 8: the plumbing; Part 9:
> the seasons; Part 10: reproduction; Part 11: the whole life; Part 12:
> the environment; Part 13: how all of this maps to the Life Tree engine).
> Bolded terms are defined where they first appear. The GLOSSARY at the end
> collects every term for lookup. The COVERAGE CHECKLIST at the end is the
> audit contract — every row must stay covered.

---

## TABLE OF CONTENTS

- PART 1 — THE SEED (structure, dormancy, the waiting state)
- PART 2 — GERMINATION (the waking up)
- PART 3 — THE SEEDLING (first growth, first leaves)
- PART 4 — THE SHOOT SYSTEM (stems: anatomy, branching, ALL stem modifications)
- PART 5 — THE ROOT SYSTEM (roots: anatomy, types, ALL root modifications)
- PART 6 — LEAVES (anatomy, morphology, ALL leaf modifications)
- PART 7 — SECONDARY GROWTH (cambium, wood, rings, bark)
- PART 8 — THE VASCULAR SYSTEM (xylem, phloem, how the tree drinks and feeds)
- PART 9 — SEASONAL CYCLES (phenology, dormancy, the four seasons, tropics)
- PART 10 — REPRODUCTION (flowers, ALL inflorescences, pollination, ALL fruits, dispersal)
- PART 11 — THE LIFE CYCLE (annual/biennial/perennial, juvenility → senescence)
- PART 12 — ENVIRONMENT & STRESS (tropisms, stress responses, adaptation)
- PART 13 — THE LIFE TREE BRIDGE (every part → what it means for the engine)
- GLOSSARY (every term, one line each)
- COVERAGE CHECKLIST (the audit contract)

---

## SOURCE BRIEFS (the research files this master was built from)

The master is the distilled, unified reference; the briefs below are the
raw exhaustive research files produced by the 6 parallel research agents
(2026-08-29) that fed it. Each brief carries its own detail, examples,
and source verification. Use them when you need depth beyond the master
or want to trace a fact to its research origin. VERBATIM-CRITICAL:
cite the file paths exactly — never inline their full contents.

| File | Coverage | Feeds master parts |
|---|---|---|
| `research-botany/source-briefs/A-seed.md` | Seed structure, origins, ALL dormancy classes, ALL germination triggers, step-by-step germination, seedling establishment, special seeds | 1–3 |
| `research-botany/source-briefs/B-stems.md` | Shoot system, dicot stem anatomy, meristems, secondary growth + wood + bark detail, ALL stem modifications, branching, trunk layer stack | 4, 7 |
| `research-botany/source-briefs/C-roots.md` | Root systems, root anatomy (zones, Casparian strip, stele), feeding (mycorrhizae, nitrogen fixation), secondary growth in roots, ALL root modifications, root behavior | 5, 8 |
| `research-botany/source-briefs/D-leaves.md` | Leaf anatomy, morphology, development, movements, ALL leaf modifications, venation subtypes, identification | 6 |
| `research-botany/source-briefs/E-reproduction.md` | Flower anatomy, the COMPLETE inflorescence taxonomy (25), pollination, fertilization, the COMPLETE fruit taxonomy (30), dispersal, tree reproductive timeline | 10 |
| `research-botany/source-briefs/F-seasonality.md` | Phenology (BBCH, chill hours), ALL dormancy kinds, photoperiodism, evergreen/deciduous/marcescent, the four seasons, ALL tropisms, ALL stresses, plant lifestyles, tree life stages, succession | 9, 11, 12 |

**Audit trail** (the verification record — how the zero-miss guarantee
was proven): `research-botany/audits/ledger-audit-botany-pass1.md` (22
findings), `pass2.md` (11 residues), `pass3.md` (final pass: all
verified fixed; the master's 62-row COVERAGE CHECKLIST is the standing
contract every future edit must keep satisfied).

---

# PART 1 — THE SEED

## 1.1 Why the seed exists

A seed is a **dispersal-and-survival machine**: a baby plant (the embryo)
packed with food, wrapped in a protective coat, designed to travel and to
wait. The whole point is to start the next generation somewhere new, at the
right time, without the parent's help. For the Life Tree, the seed is the
natural **starting stage**: small, closed, full of potential, doing nothing
visible until conditions are right.

## 1.2 Seed structure — the anatomy of a dicot seed

Take a bean or a pea — the classic dicot seed — and peel it:

- **Seed coat (testa)** — the tough outer skin. Protects the embryo from
  drying, damage, and digestion. In hard seeds (many legumes, morning
  glories) it is so waterproof and hard that water cannot even enter until
  the coat is scratched or worn — a deliberate delay mechanism (see
  dormancy, §1.4). The inner layer is sometimes called the **tegmen**.
- **Hilum** — the scar where the seed was attached to the parent plant
  (the "belly button" of the bean).
- **Micropyle** — a tiny pore in the seed coat, the remnant of the opening
  through which the pollen tube entered the ovule. Water enters here first
  during germination.
- **Raphe** — a ridge along the seed coat marking the fused stalk
  (funiculus) that fed the seed.
- **Lens / strophiole** — a small raised bump on the seed coat of many
  hard-seeded legumes: the **water gap**. Water enters here first and
  pops the coat open (the scarification shortcut — one tiny door in
  the armor).
- **Chalaza** — the point at the base of the ovule where the seed coat
  layers meet.
- **Perisperm** — a food tissue some seeds keep from the nucellus
  (beet, black pepper) — a third storage option alongside endosperm
  and cotyledons.
- **Embryo** — the baby plant itself, and it already has all its future
  organs in miniature:
  - **Radicle** — the embryonic root. The first thing to emerge at
    germination. It grows downward (positive gravitropism — growth
    toward gravity).
  - **Plumule** — the embryonic shoot (first stem + first true leaves in
    bud form). It grows upward (negative gravitropism).
  - **Hypocotyl** — the embryonic stem segment *below* the cotyledons
    (between radicle and cotyledons).
  - **Epicotyl** — the embryonic stem segment *above* the cotyledons
    (between cotyledons and plumule).
  - **Cotyledons (seed leaves)** — the first leaves. **Dicots have two**
    (the name literally means "two seed leaves"). They either (a) store
    the seed's food as thick fleshy slabs that stay underground while
    they feed the seedling (storage cotyledons — bean, pea), or (b) rise
    into the light, turn green, and photosynthesize for a few weeks
    before withering (epigeal cotyledons — sunflower, mustard).
- **Endosperm** — the food tissue *outside* the embryo, produced by
  double fertilization (§10.4). It nourishes the embryo during germination.
  Seeds are **albuminous** (endosperm present at maturity — tomato,
  castor bean) or **exalbuminous** (endosperm absorbed into the cotyledons
  during seed development — bean, pea). The cotyledons are the
  endosperm's replacement in exalbuminous seeds.

**The one-sentence anatomy:** a dicot seed = coat (testa) + baby plant
(embryo: radicle, plumule, hypocotyl, epicotyl, two cotyledons) + food
(either endosperm or fat cotyledons) — all in a waterproof waiting package.

## 1.3 How a seed is born (the ovule → seed path)

- The **ovule** (the structure that becomes the seed) sits inside the
  ovary (the base of the flower's female organ). It is a **nucellus**
  (food tissue) wrapped in one or two **integuments** (layers that become
  the seed coat), containing the **embryo sac** (the female gamete
  chamber: egg cell + supporting cells).
- After **double fertilization** (one sperm fertilizes the egg → embryo;
  the second fertilizes the embryo sac's central cell → endosperm), the
  ovule wall hardens into the seed coat, the ovary wall becomes the fruit
  (Part 10), and the seed matures.
- **Embryo development stages** — the baby plant builds itself in a
  set sequence: **proembryo** (first cell mass) → **globular** (ball)
  → **heart** (two lobes — the future cotyledons appear) → **torpedo**
  (elongated — radicle and plumule visible) → mature embryo.
- **Ovule orientation** — how the ovule bends in the ovary:
  **anatropous** (inverted — the standard, bean), **orthotropous**
  (straight — pepper), **campylotropous** (curved — mustard),
  **amphitropous** (half-inverted).
- Oddities: **apomixis** — some plants make seeds without fertilization
  at all (dandelion, many hawthorns — clonal seeds, genetically identical
  to the mother); **polyembryony** — one seed containing several embryos
  (citrus).

## 1.4 Dormancy — the seed's power to wait

A ripe seed does not germinate immediately. It enters **dormancy** — a
state of arrested growth, often with the embryo dried to a fraction of its
weight, metabolism nearly stopped. (Distinguish shallow **quiescence** - an embryo merely waiting out bad weather, which springs back the moment conditions improve - from deep **dormancy**, which needs specific treatments to end: the two are the seed world's "pause" vs "sleep".) This is the plant kingdom's insurance
policy: seeds wait through winter, drought, or fire season and germinate
only when survival odds are good. Biologists classify dormancy
(the Baskin & Baskin system — the standard five classes):

- **Physical dormancy** — the seed coat is impermeable to water (hard
  coats). Broken by **scarification**: scratching, acid, frost heave,
  passing through an animal's gut, or fire. Examples: many legumes,
  morning glory, locust trees. Fire-dependent pines have a related
  strategy — **serotiny**: cones/seeds sealed by resin that only fire
  melts.
- **Physiological dormancy** — the embryo itself is "asleep," held by a
  hormone balance: **abscisic acid (ABA)** promotes dormancy,
  **gibberellins (GA)** promote germination. Broken by **after-ripening**
  (dry storage time), **stratification** (a cold, moist period — the
  standard treatment for apple, red oak, and most temperate tree seeds:
  the seed must experience winter to know spring has come), or light
  (photoblastic seeds, §1.5). White-oak acorns skip this entirely —
  they germinate at autumn shed; red-oak acorns need the cold months
  (§2.2).
- **Morphological dormancy** — the embryo is immature at seed shed and
  needs time to finish developing before germination.
- **Morphophysiological dormancy** — immature embryo + physiological
  block combined (common in woodland herbs).
- **Combinational dormancy** — hard coat AND physiological dormancy
  (must be scarified AND stratified — the double lock).

Dormancy also explains **seed banks**: soil full of waiting seeds that
germinate in waves over years when conditions allow (why weeds reappear
after tilling). Seed viability varies wildly: willow seeds die in days;
lotus seeds have germinated after centuries; the radiocarbon-verified records are the ~2,000-year-old Judean date palm and the ~1,300-year-old lotus.

## 1.5 Germination triggers — what the seed is waiting for

A seed germinates when its dormancy is broken AND conditions are right.
The four master triggers:

1. **Water (imbibition)** — the first act of germination. Water enters
   through the micropyle, the seed swells, the coat softens, enzymes
   activate. Imbibition is physical (dry tissues soak up water) — even
   dead seeds swell. Then metabolism restarts: respiration, protein
   synthesis, food mobilization from cotyledons/endosperm.
2. **Temperature** — every species has a **cardinal temperature range**
   (minimum, optimum, maximum). Temperate trees germinate in spring when
   soil warms past a threshold; the cold period was already spent in
   stratification. **Growing degree days** (accumulated warmth above a
   base temperature) predict spring germination and bud break precisely.
3. **Light** — **photoblastic** seeds respond to light quality:
   **positive photoblastic** seeds need light to germinate (small seeds
   that must not germinate buried too deep — lettuce, many weeds),
   **negative photoblastic** seeds are inhibited by light (onion,
   Nigella). The sensor is **phytochrome** (§9.1) — a pigment that
   detects red vs far-red light and thus whether the seed is in open sun
   or under a canopy.
4. **Oxygen** — germination is a burst of respiration; waterlogged soil
   suffocates seeds (one reason swamp plants have special strategies).
   Smoke also triggers germination in fire-adapted floras
   (**karrikins** — smoke-borne chemicals read by many Australian and
   Californian species).

**The finer triggers (the full list):**

- **Thermoinhibition** — some seeds refuse to germinate in HOT soil
   (lettuce, many summer weeds): warmth signals "too late in the
   season" and the seed waits for cooler weather.
- **Alternating temperatures** — daily warmth fluctuations (day warm /
   night cool) promote germination in many species — the signal that
   the soil is bare and spring-like (vs the constant temperature of
   deep burial).
- **Nitrate, ethylene, CO₂** — nitrate (from decaying organic matter /
   fertilizer) is a germination cue for many weeds ("there is food
   here"); ethylene and CO₂ help break dormancy in some buried seeds.
- **Fruit-pulp inhibitors** — seeds inside fleshy fruits often carry
   germination inhibitors in the surrounding juice (tomato): the seed
   only germinates after the fruit rots or passes through an animal —
   a timing device.
- **Seasonal-timing classes** — beyond "spring," seeds specialize:
   spring germinators (most temperate trees — they use the whole
   growing season), autumn germinators (winter-annual weeds: they make
   a rosette, then bloom next spring), and rain-threshold germinators
   (arid-land seeds that germinate only after a soaking rain — the
   desert bloom).

**Orthodox vs recalcitrant vs intermediate seeds:** orthodox seeds
(most temperate trees) tolerate drying and cold storage for years.
**Recalcitrant** seeds (white-oak acorns, chestnut, many tropicals)
die if they dry out — they must germinate immediately or rot. This is
why acorns cannot be stored like beans. **Vivipary** is the extreme:
the seed germinates WHILE still attached to the parent — mangrove
propagules grow into ready-to-plant seedlings before they drop. **Intermediate** seeds (some
citrus, coffee) tolerate partial drying but not full orthodox storage.

## 1.6 Specialized seeds

- **Samara** — a winged seed/fruit that autorotates in the wind (maple
  "helicopters", ash). Seed traits here: the wing is a flattened
  outgrowth that slows fall and carries the seed sideways.
- **Fleshy-fruit seeds** — designed to survive animal guts: tough coats,
  often with germination improved by acid scarification + fertilizer
  delivery (passing through a bird or bear is the germination strategy
  of many cherries, berries, apples). Mistletoe seeds are coated in
  **viscin** — a glue that sticks them to a new branch after the bird
  wipes its beak (the seed arrives pre-planted).
- **Wind-dispersed seeds** — plumes/pappus (dandelion's parachute is a
  fruit, but many seeds carry silky hairs), dust seeds (orchids — monocot
  note), true winged seeds (catalpa's winged seeds, bigtooth aspen's
  plumed seeds).
- **Burred seeds** — hooks and barbs that hitchhike on fur/clothing
  (burdock — the inspiration for Velcro).
- **Masting** — many trees (oaks, beeches) do not seed every year:
  they synchronize **mast years** — one bumper seed crop every 2–7
  years, flooding seed-eaters so some acorns always survive (predator
  satiation). Lean years in between starve seed-predator populations.
- **Seed predation** — most seeds never become plants; they are eaten
  (squirrels, weevils, beetles) or rot. Oaks survive partly because
  squirrels **cache** acorns and forget some (unintentional planting);
  jays are the great **scatter-hoarders** — a single jay buries
  thousands of acorns a season and forgets many, planting oak forests
  kilometres from the parent tree.

# PART 2 — GERMINATION (the waking up)

## 2.1 The step-by-step process

Germination is the seed's irreversible commitment: once the radicle
breaks the coat, there is no going back. The sequence for a typical dicot:

1. **Imbibition** — water floods in (mostly through the micropyle). The
   seed swells, the coat softens and often cracks. This is physical and
   fast (hours). Metabolism ignites: stored starch/fats/proteins break
   down into sugars and amino acids — the food is mobilized.
2. **Radicle emergence** — the embryonic root pushes through the coat,
   usually at the micropyle. It immediately grows **downward**
   (positive gravitropism) and starts absorbing water — the seedling is
   now self-feeding on water.
3. **Hypocotyl extension** — the embryonic stem grows. In **epigeal
   germination** (sunflower, bean, maple), the hypocotyl elongates
   dramatically and carries the cotyledons up out of the soil — often
   forming a **hypocotyl hook** (a bent elbow that pulls the delicate
   cotyledons through the soil, protecting them, then straightens in the
   light). The cotyledons unfold, green up, and photosynthesize until the
   first true leaves take over.
4. **Epicotyl extension** — in **hypogeal germination** (pea, oak,
   walnut), the hypocotyl stays short; the epicotyl pushes up instead
   (often with a **plumular hook** — a bent elbow protecting the leaf
   bud as it too pulls through the soil), and the cotyledons stay
   underground as storage organs, feeding the shoot from below. The
   first thing above ground is the plumule with its first true leaves.
5. **First true leaves** — the cotyledons are seed organs; the **first
   true leaves** are the plant's own adult machinery (full leaf anatomy,
   stomata, veins). Once they expand and photosynthesize, the seedling is
   nutritionally independent — the cotyledons wither (epigeal) or are
   absorbed (hypogeal).

**Etiolation** is the underground/light-starved growth mode: pale,
elongated, weak stems with unexpanded leaves (bean sprouts, the white
shoots under a board). The plant is spending all its stored energy on
reaching light. Light triggers **de-etiolation**: stem thickening,
greening, leaf expansion - the switch from "digging" mode to "sun" mode. The two modes have formal names: growth in darkness is **skotomorphogenesis** (the etiolated form); growth in light is **photomorphogenesis** (the normal form).

## 2.2 What the timeline looks like (real examples)

- **Bean (epigeal)**: day 0–2 imbibition + coat split; day 2–4 radicle;
  day 4–7 hook emergence; day 7–10 cotyledons open, first true leaves;
  day 14+ true-leaf growth, cotyledons wither.
- **Oak (hypogeal, recalcitrant)** — and here the two oak clans
  differ: **white oak** acorns have no dormancy and germinate within
  weeks of fall (radicle first, then the epicotyl rises the following
  spring — the acorn's food powers the sapling's first season); **red
  oak** acorns are dormant and need ~3 cold months before they will
  germinate the following spring (§1.4).
- **Maple (stratified)**: seed needs cold months; germinates in spring
  after soil warmth passes the threshold; epigeal, fast-growing first
  year.
- **Tomato (positive photoblastic)**: needs light + warmth; germinates
  in 5–10 days; epigeal.

## 2.3 Germination failure — the natural culling

Most seeds die at this stage: damping-off (fungal rot of the seedling
base), drying out, being eaten, smothered, out-competed. The seedling
**establishment bottleneck** is the hardest phase in a plant's life —
which is exactly why seeds are produced in such absurd numbers.

---

# PART 3 — THE SEEDLING (the first years)

## 3.1 What a seedling is

A **seedling** is a young plant from germination until it has a
self-sufficient root + shoot system — for trees, roughly the first 1–5
years. It has: a primary root (the original radicle) with young lateral
roots, a primary stem with true leaves, and (briefly) the cotyledons'
residual food. Everything a seedling does is establishment: anchor,
drink, catch light, outgrow the seedling zone.

## 3.2 Seedling morphology vs adult — heteroblasty

Many plants look different as juveniles than as adults — **heteroblasty**
(change in form with age). Classic dicot examples: eucalyptus seedlings
bear round, opposite, blue-green juvenile leaves; adults bear long,
drooping, alternate adult leaves (the famous koala food is the ADULT
leaf — juvenile leaves are poisonous). Acacia seedlings produce true
compound pinnate leaves; adults produce **phyllodes** (flattened
petioles — §6.5). Ivy's juvenile form is the climbing, lobed-leaf phase;
adult ivy is shrubby with unlobed leaves and flowers. **The lesson for
the Life Tree: a plant's form can change with age — the engine's visual
stages should have their own morphology, not just size scaling.**

## 3.3 Seedling biology

- **Primary root → taproot:** the radicle becomes the **primary root**;
  it branches into **lateral roots** (which arise from the inner
  pericycle — §5.3). Dicots typically keep a dominant **taproot**
  (carrot shape — one main root going deep) while monocots make fibrous
  mats; but many dicots (beech, many tropicals) switch to a fibrous
  system later.
- **Seedling vigor:** survival depends on stored food + first-season
  leaf area + root penetration. Tree seedlings grow slowly at first —
  the first year of an oak might be one 20 cm shoot with a deep root
  already reaching for water. **The classic rule: roots first, then
  shoots** — a seedling's underground work precedes its visible growth.
- **Seedling mortality:** drought, shade, herbivory, frost heave,
  damping-off, competition. The **Janzen–Connell effect**: seedlings
  directly under their parent die disproportionately (parent-specific
  pests) — a mechanism driving seed dispersal: "go somewhere else."
- **Seedling banks:** shade-tolerant species (beech, maple) can wait as
  suppressed seedlings for a canopy gap for years — a seedling can be
  old but small (the botanical version of the dormant seed).

## 3.4 The seedling→sapling transition

When a tree seedling's roots are established and its shoot clears the
herb layer, growth accelerates — the **sapling** phase: fast vertical
growth, strong **apical dominance** (the top bud suppresses side
branches — §4.5), a straight single trunk, and the beginning of wood.
This is the visible "the tree is now growing" moment.

# PART 4 — THE SHOOT SYSTEM (stems)

## 4.1 What a stem is and does

The stem is the plant's structural spine and transport highway: it holds
leaves up to the light, carries water up from the roots and sugar down
from the leaves, stores reserves, and (in some plants) does the
photosynthesis itself. The shoot system = stem + branches + leaves +
buds + flowers. Its growth happens at **meristems** — zones of
undividing-then-dividing cells (the plant's permanent stem-cell
fountains):

- **Apical meristems** — at every shoot tip (**shoot apical meristem,
  SAM**) and root tip (**root apical meristem, RAM**). They produce ALL
  new length: cells divide, then elongate, then differentiate (become
  specialized tissue). This is **primary growth** — lengthening.
- **Lateral meristems** — the **vascular cambium** and **cork cambium**
  (§7). They produce ALL new girth. This is **secondary growth** —
  thickening.
- **Intercalary meristems** — at stem nodes; mostly a monocot/grass
  feature (regrowth after mowing); dicots essentially lack them.

**The two-engine model (memorize this):** a tree gets taller by primary
growth at the tips; it gets thicker by secondary growth in the cambium
ring. Height and girth are driven by different engines, on different
timetables (§11).

## 4.2 Stem anatomy — the dicot layout

Cut a young dicot stem crosswise and read it from outside in:

1. **Epidermis** — the outer skin; a single layer of cells covered by a
   waterproof **cuticle** (waxy film). On young green stems it bears
   **stomata** (breathing pores — §6.2), just like leaves, and often
   **trichomes** (tiny hairs — reflective, insulating, or defensive).
2. **Cortex** — the rind between skin and vascular ring: soft
   **parenchyma** (the plant's general-purpose filler/storage cells),
   often with **collenchyma** (flexible support — the strings in celery)
   and **chlorenchyma** (green photosynthetic tissue) in herbaceous
   stems; in some stems the inner cortex is a **starch sheath**
   (a one-cell layer of starch-filled cells, the "starch jacket"
   around the vascular ring). Hard support cells — **sclerenchyma**
   (fibers, and stony **sclereids** — the grit in pears) — appear where
   strength matters.
3. **Vascular bundles in a RING** — the dicot signature. Each bundle is
   an **open collateral bundle**: **xylem** (water pipes) on the inside,
   **phloem** (sugar pipes) on the outside, with the **vascular cambium**
   sandwiched between them. The ring layout (vs monocots' scattered
   bundles) is the classic dicot-vs-monocot identification trait.
4. **Pith** — the soft center, storage tissue (the spongy core of a
   young twig). In many dicots the pith later collapses or is crushed by
   wood.
5. **Medullary rays** — lines of parenchyma radiating through the
   vascular ring, connecting pith to cortex; they become the **rays** of
   the wood (§7.1/§7.3).

Herbaceous (soft, green) stems keep this primary structure for life.
Woody stems keep it briefly, then the cambium adds wood and bark over it
(§7).

## 4.3 Nodes, internodes, buds, scars

- **Node** — the point where leaves attach; the stem's "joint."
- **Internode** — the stem segment between two nodes. Internode length
  is plastic: shade stretches internodes (etiolation), bright light
  shortens them.
- **Axillary bud** — a bud in the leaf axil (the angle between leaf and
  stem); a dormant mini-shoot that can grow into a branch, flower, or
  thorn. **Terminal (apical) bud** — the bud at the shoot tip that
  drives extension.
- **Leaf scar** — the scar left when a leaf falls; **bud scale scars** —
  the ring of scars left each year when the terminal bud's scales fell
  off. **You can age a twig in years by counting bud-scale scar rings**
  — the same principle as trunk rings, at twig scale. **Bundle scars**
  are the tiny dots inside a leaf scar — the cut ends of the leaf's
  vascular bundles.
- **Lenticels** — the porous dots/bumps on young bark (and on stems of
  woody plants); breathing pores for gas exchange through the otherwise
  sealed surface (birch's horizontal dashes).
- **Bud scales** — the protective modified leaves wrapping dormant buds
  (§6.5.11): often sticky (horse chestnut) or hairy, waterproof winter
  armor.

## 4.4 Phyllotaxy — how leaves are arranged

**Phyllotaxy** = leaf arrangement on the stem, and it is a Fibonacci
affair: **alternate** (one leaf per node, spiraling — oak, beech,
birch), **opposite** (two per node — maple, ash, mint family, horse
chestnut), **whorled** (three or more per node — oleander, bedstraw),
**distichous** (alternate but all in one plane — elm), **decussate**
(opposite pairs at right angles — mint family). The spiral angle
between successive leaves (~137.5°, the golden angle) maximizes light
capture without self-shading.
Phyllotaxy matters to the engine as the *pattern rule* for where leaves
and branches attach — organic-looking placement is not random, it's
spiral.

## 4.5 Branching — how the crown is built

- **Apical dominance:** the terminal bud produces **auxin** (the master
  growth hormone), which suppresses the axillary buds below it. The
  result: a single strong leader shoot — the tree's "one boss." If the
  tip is damaged (browsed, pruned, snapped), the dominance is broken and
  the nearest side buds compete — which is why cutting a hedge makes it
  bushy, and why a damaged sapling forks into a multi-trunk tree.
- **Monopodial growth** — one dominant leader for life (oak, beech,
  spruce analog): a straight trunk with ordered side branches.
- **Sympodial growth** — the leader dies or stops each year and a side
  bud takes over (elm, linden, many tropicals): a zigzag/arching trunk,
  a broad domed crown.
- **Dichotomous branching** — the tip splits into two equal forks;
  rare in dicots (some cacti; the classic dicot example is mistletoe, *Viscum*).
- **Crown architecture:** species build characteristic silhouettes
  (columnar, round, vase, weeping, flat-topped) from these rules plus
  light responses — **excurrent** crowns (one central leader to the
  top — oak, beech) vs **decurrent** crowns (the leader is lost and
  multiple branches take over, a broad rounded head — elm, maple,
  most tropicals). **Epicormic shoots** are dormant buds under the bark
  that erupt after damage (the shoots around a cut oak stump; the
  resprouting of fire-killed trees); **adventitious buds** are the
  general category — buds arising anywhere unexpected (stems, roots,
  leaf edges), of which epicormic buds are the trunk-and-branch case;
  **water sprouts** are vigorous vertical shoots from trunk buds (from
  stress or pruning).
- **Fruit spurs** — short, stubby branchlets on apple/pear trees that
  carry the flowers and fruit; they grow a ring per year, too.

## 4.6 Stem modifications — the exhaustive catalog

A **modification** is a stem (or part of a stem) reshaped by evolution
to do something other than hold leaves. All are **homologs** (same
evolutionary origin) of the ordinary stem.

1. **Rhizome** — a horizontal UNDERGROUND stem that stores starch and
   sends up shoots (iris, ginger — the edible spice is the rhizome,
   turmeric, couch grass — the weed that spreads by rhizomes). It *looks*
   like a root but has nodes, buds, and scale leaves; a root has none.
   Why: survival through bad seasons + spreading.
2. **Stolon / runner** — a horizontal ABOVE-GROUND stem that roots at
   its nodes and makes new plantlets (strawberry runners, spider-plant
   babies, mint stolons). Why: clonal spread — each rooted node becomes
   an independent plant.
3. **Stem tuber** — a swollen, fleshy terminal portion of an underground
   stem storing starch: the **potato**. Its "eyes" are axillary buds in
   leaf scars; its "skin" is a **periderm** (the corky protective layer, §7.5) — proof it is a stem. The sweet
   potato is a **root tuber** (swollen root — no eyes/nodes): same job,
   different organ. Also Jerusalem artichoke, yam, caladium.
4. **Corm** — a short, thick, SOLID vertical underground stem, a squat
   pillar wrapped in dry scale leaves (a **tunic**): gladiolus, crocus,
   taro. Each year a new corm forms atop the old, which shrivels. A corm
   is stem tissue; a bulb is layered leaves (§6.5.9).
5. **Bulb** — a shortened flattened stem (the **basal plate**) bearing a
   dense rosette of fleshy, food-storing MODIFIED LEAVES (**scales**):
   onion and tulip (tunicate bulbs — papery tunic), lily (scaly bulbs),
   garlic (each clove = an axillary bud of the bulb). Roots grow from
   the basal plate's underside. The bulb is the most watertight storage
   package: the onion survives months of drought because its scales are
   sealed leaves. (The stem part is only the basal plate — the bulk is
   leaf.)
6. **Cladode / phylloclade** — a flattened, green, leaf-LIKE stem that
   took over photosynthesis because the true leaves were reduced (often
   to spines) to cut water loss: prickly pear pads (*Opuntia*),
   butcher's broom (*Ruscus* — "leaves" that carry flowers in the middle
   of the blade, which real leaves never do), asparagus fern, leaf cacti.
   How to tell it's a stem: flowers, buds, and spines arise on it, and it
   has no petiole or axil.
7. **Stem tendril** — a slender coiling grasping structure that IS a
   modified stem (usually a modified axillary shoot or abortive
   inflorescence): grape (tendrils opposite the leaves), cucumber,
   passionflower, Virginia creeper (tendrils with adhesive pads).
   Contrast: the **pea** tendril is a modified LEAF (§6.5.1), clematis
   climbs with modified leaf stalks — same job, different organs.
8. **Thorn (stem spine)** — a sharp, hard, pointed MODIFIED STEM (a
   modified branch or axillary shoot): hawthorn, blackthorn, honey
   locust (spectacularly branched thorns), citrus thorns, bougainvillea.
   Thorns are persistent and firmly attached because they are wood.
   Contrast (memorize): **thorn = stem; spine = leaf or leaf part;
   prickle = mere skin outgrowth** (rose prickles snap off — they are
   epidermal, not vascular).
9. **Succulent stem** — a thick, fleshy, water-storing stem that also
   photosynthesizes, with leaves tiny, spiny, or absent: the cactus
   family (saguaro — a ribbed, expandable accordion trunk storing
   tonnes), African spurges (*Euphorbia* cactus-lookalikes),
   *Pachypodium*. Why: the desert trick — a water tank with waxy armor.
10. **Caudex** — a massively swollen stem base at/above ground level,
    a water-and-starch reserve tank: baobab (the bottle tree, storing
    thousands of litres), desert rose (*Adenium*), bottle trees
    (*Brachychiton*). The swollen base also carries resprouting buds —
    the fire-survival organ.
11. **Pseudobulb** — the swollen aerial stem segment of sympodial
    orchids (Cattleya, Dendrobium): a thickened internode storing water
    and nutrients. Why: epiphytes (plants growing on other plants, no
    soil) need a water tank between rains. NOT a true bulb — solid stem
    tissue, no leaf scales.
12. **Stem storage (general)** — ordinary stems also store: starch in
    pith/rays (sugar maple), sucrose in sugarcane (the whole cane is a
    sugar-reservoir stem), water in succulent parenchyma.
13. **Bulbils and offsets** — tiny detachable storage shoots (bulbils:
    in onion inflorescences, tiger-lily axils) and short crowded side
    shoots at the plant base (offsets: houseleeks, aloe pups) — both
    stem-based clonal propagation.

**Evolutionary logic in one sentence:** wherever a plant needs to store,
spread, climb, defend, or survive drought, evolution has reshaped the
stem into the needed tool — and often the "storage stem" looks nothing
like a stem (potato, ginger).

# PART 5 — THE ROOT SYSTEM

## 5.1 What roots do

Roots anchor the plant, drink water, mine minerals, store reserves,
synthesize hormones, and (in many plants) clone the plant. The root
system is the **hidden half** — often as large as the canopy and always
established first. For the Life Tree, roots are the obvious metaphor for
the foundation: invisible, load-bearing, the first thing built.

## 5.2 Root system types

- **Taproot system (the dicot hallmark)** — one dominant primary root
  plunging deep, with smaller laterals: oak, carrot, dandelion. Deep
  water access + strong anchorage. Depth records run far: a fig root
  has been measured ~68 m deep, mesquite roots 50+ m — the desert
  trees that mine deep water.
- **Fibrous system** — a mat of equal roots; the monocot standard
  (grasses), but many dicots (beech, maple, ash, most tropicals) switch
  to effectively fibrous or **heart-shaped** systems (many shallow
  spreading roots) later in life — canopy-wide water capture, less
  anchorage (beeches blow over in storms).
- **Adventitious roots** — roots that arise from non-root organs (stems,
  leaves): ivy's climbing roots, corn's brace roots, cuttings that root.
  Their existence is why you can propagate plants from cuttings.

## 5.3 Root anatomy — the dicot root from tip to base

A young root has five zones from the tip back:

1. **Root cap** — a thimble of cells at the very tip that protects the
   meristem as it pushes through soil; its outer cells slough off as
   "root slime" (mucilage) that lubricates penetration. Its central
   column — the **columella** — is the gravity sensor: dense starch
   grains (**statoliths**) settle and tell the root which way is down.
2. **Meristematic zone** — the dividing cells (the RAM).
3. **Elongation zone** — cells stretch, pushing the tip forward. Root
   growth is really tip-pushing, not base-pulling.
4. **Maturation (differentiation) zone** — cells become specialized:
   this is where **root hairs** form — tiny epidermal tubes that
   massively multiply the surface area for water absorption (a rye
   plant's root hairs would stretch for thousands of kilometres). Root
   hairs are short-lived; the root keeps extending and growing fresh
   hairs — the root "crawls" through the soil, drinking with its newest
   skin.
5. **The mature cross-section** (read outward→in or in→out): the
   **epidermis** (with root hairs), the **cortex** (large air-space
   storage cells), the **endodermis** — a single ring of cells sealed
   with the **Casparian strip** (a waterproof band forcing ALL water to
   pass THROUGH cells, not between them — the root's quality-control
   gate that filters what enters the vascular system), the **pericycle**
   (the inner ring that produces lateral roots — laterals therefore
   originate deep inside the root, not at the surface), and the central
   **vascular cylinder (stele)**: xylem (often in an X-shaped star —
   named by arm count: **diarch** = two arms, **triarch** = three,
   **tetrarch** = four, **polyarch** = many; the xylem matures toward
   the outside, **exarch**), phloem between the xylem arms, and usually
   a small pith.

## 5.4 How roots drink and feed

- **Osmosis + root pressure:** root hairs create strong osmotic pull;
   water flows in — along the **apoplast** (between cells, through
   walls) or the **symplast** (through cells, via **plasmodesmata** —
   the tiny cytoplasmic bridges linking plant cells) — until the
   Casparian strip forces the symplastic route. Pressure can push sap
   up (root pressure — the reason cut stems bleed in spring), but the
   main engine of tall-tree water movement is the **cohesion–tension**
   mechanism (§8.3).
- **Mycorrhizae — the universal partnership:** most dicot roots do NOT
   feed alone. They partner with soil fungi:
   - **Arbuscular mycorrhizae** — the fungus enters root cells and
     forms tree-shaped exchange structures (**arbuscules**), storing
     reserves in fatty **vesicles** (the fungus's larder inside the
     root); the fungus delivers phosphorus + water from far beyond the
     root's reach, the plant pays in sugar. The ancient, nearly
     universal type (80%+ of plants).
   - **Ectomycorrhizae** — the fungus wraps root tips in a sheath and
     threads between cells — the **Hartig net** (the exchange surface
     between fungus and root): oaks, beeches, pines — the mushroom
     above ground is often the fruiting body of the tree's partner.
   - A third type: **orchid mycorrhizae** — the fungus coils INSIDE
     orchid root cells (**pelotons**); the orchid, germinating from
     dust seeds with no food, lives off the fungus before it can
     photosynthesize (a reversed partnership).
   - The forest is one underground network: mycorrhizal fungi connect
     trees and shuttle resources between them ("the wood wide web").
- **Nitrogen fixation — the legume partnership:** legumes (pea, bean,
   clover, acacia, locust) host **Rhizobium** bacteria in root
   **nodules** (swellings where the bacteria convert atmospheric
   nitrogen into fertilizer for the plant, in exchange for sugar; the
   pink color of active nodules is **leghemoglobin** — a hemoglobin-like
   oxygen buffer protecting the bacteria).
   Actinorhizal dicots (alder, sea buckthorn) do the same with
   **Frankia**. Why it matters: nitrogen is the limiting nutrient of
   growth; nitrogen-fixers colonize bare ground first.

## 5.5 Secondary growth in roots

Woody roots thicken like stems: a vascular cambium forms in the root
(often **lobed** — star-shaped in section, unlike the stem's smooth
ring), produces wood inward and phloem outward, and a cork cambium
produces periderm. Old roots are woody cylinders; root bark is thin and
rarely seen because it rots underground. The root flare (the widening
where trunk meets soil) marks the transition zone. **Root rings exist
too** — but roots usually have fewer than the trunk because root growth
is less seasonal. Anomalous cambia (extra rings of cambium in
beet-like arrangements) occur in sweet potato and other tuberous roots
(§5.6.2) — the botanical engine of their growth rings.

## 5.6 Root modifications — the exhaustive catalog

1. **Storage taproots** — swollen taproots storing food for the
   biennial strategy (store year one, bloom year two): carrot (the
   sweet part is mostly secondary PHLOEM — the woody core is xylem),
   radish (fusiform), turnip (napiform — mostly hypocotyl), beet (red
   rings of anomalous cambia), parsnip, daikon.
2. **Tuberous roots** — swollen adventitious/lateral roots, no
   eyes/nodes (vs stem tubers): sweet potato, cassava (the tropical
   staple), dahlia, jicama. Cluster forms: **fasciculated** (bundles of
   fat fingers — dahlia, asparagus), **annulated** (ringed — ipecac),
   **moniliform** (beaded like a necklace — some *Momordica*),
   **nodulose** (knobby like rosary beads — some gingers).
3. **Aerial roots** — roots born above ground: epiphytic orchids hang
   **velamen**-coated roots (a spongy dead-cell skin that wicks rain,
   fog, and dew — the orchid's water tank and, in green forms, solar
   panel); monstera and many tropical figs dangle roots that absorb
   humidity and eventually ground-anchor.
4. **Prop / stilt roots** — roots bracing the plant like stilts, born
   from stems/branches and growing down into soil: the **banyan**
   (pillar roots descend from branches, root, and thicken into NEW
   TRUNKS — one tree becomes a grove; the Great Banyan of India covers
   ~1.4 ha), corn brace roots (monocot analog), screw pine and
   mangrove *Rhizophora* stilt roots arching into tidal mud. Why:
   support + conquering soft/flooded ground.
5. **Buttress roots** — the flying-buttress wings at the base of many
   rainforest trees: huge flattened root ridges that brace the trunk
   against shallow-soil toppling and harvest surface nutrients.
6. **Pneumatophores (breathing roots)** — upward-growing root branches
   of waterlogged swamps, especially mangroves: pencil-shaped
   (*Avicennia*) or cone-shaped (*Sonneratia*) snorkels poking above
   the tide, studded with **lenticels** and packed with **aerenchyma**
   (air-channel tissue), piping oxygen down to the drowned root system.
   Why: flooded soil = no oxygen; these are snorkels.
7. **Knee roots** — loop-like mangrove/swamp roots rising in a knee
   bend and re-descending: the same snorkel function, different geometry
   (*Bruguiera*).
8. **Clinging / attachment roots** — roots that glue the plant to
   surfaces: ivy's adhesive rootlets, climbing hydrangea. Not parasitic —
   purely anchors (support, §6.5.1's climbing alternative).
9. **Contractile roots** — roots that shorten as they grow, pulling the
   plant DOWN into the soil (the "self-planting" device): bulbs
   (daffodil), corms, dandelion crowns.
10. **Haustoria** — the parasite's syringe: modified roots of parasitic
    plants that penetrate a host and plug into its plumbing. Dodder
    (*Cuscuta*) is a **holoparasite** (no chlorophyll — steals
    everything): its threadlike orange stem wraps the host and sinks
    haustoria into both xylem and phloem. Mistletoe is a
    **hemiparasite** (photosynthesizes itself, steals water/minerals
    via haustoria into host xylem). More of the rogues' gallery:
    broomrape and *Striga* (witchweed — an African cereal-killer) are
    holoparasites, and *Rafflesia* (the giant corpse flower) is the
    extreme — a plant reduced to haustorial threads living entirely
    inside its host vine, flowering only to shed its enormous bloom.
11. **Reproductive roots / root suckers** — adventitious buds on roots
    → new shoots → new plants: quaking aspen ("Pando" in Utah is ONE
    male clone of ~47,000 stems covering ~43 ha, perhaps 8,000+ years
    old — possibly the oldest and heaviest organism on Earth), black
    locust, sumac, dandelion (any root fragment regenerates). Why:
    clonal expansion — a forest of one individual.
12. **Nodulated roots** — nitrogen-fixing partnerships (§5.4): legumes
    with *Rhizobium*, alder with *Frankia*, cycad coralloid roots with
    cyanobacteria.
13. **Mycorrhizal roots** — the partnered root form (§5.4): either
    arbuscular (internal) or ecto (sheathed tips).
14. **Pneumathodes** — localized patches of loose spongy aerenchyma on
    the roots of swamp plants through which air diffuses into the root's
    internal air channels — the fine-grained counterpart of
    pneumatophores (aeration pores on the root itself).
15. **Water-storage roots** — swollen, water-holding taproots of
    desert and semi-arid perennials that bank water through drought:
    caudex succulents and bottle trees (*Pachypodium*, baobab, some
    cucurbits). The root IS the canteen — the plant's drought reserve
    tank, separate from the stem caudex (§4.6.10).
16. **Assimilatory (photosynthetic) roots** — green, chlorophyll-
    bearing roots that have taken over photosynthesis from leaves:
    the leafless orchid *Taeniophyllum* and some *Tinospora* species
    essentially trade leaves for roots — the roots hang as green
    photosynthetic strands.
17. **Floating roots** — roots of aquatic plants that dangle freely in
    water (duckweed relatives, some water lilies, *Jussiaea/Ludwigia*
    floating mats); distinct from assimilatory roots — their function
    is buoyancy and nutrient uptake, not photosynthesis.

## 5.7 Root behavior

- **Gravitropism:** roots grow down (positive). **Hydrotropism:** roots
  bend toward moisture. **Root exudates:** roots secrete chemicals —
  acidifying, mobilizing minerals, suppressing competitors
  (**allelopathy** — black walnut kills neighbors with juglone from its
  roots). The soil immediately around roots — the **rhizosphere** — is
  a teeming microbial zone the root actively manages with its exudates
  (feeding beneficial microbes, repelling pathogens).
- **Tree root architecture:** most woody roots are in the top 30–60 cm
  of soil, spreading 1.5–3× the canopy radius. Root lifespan: fine
  roots turn over in months; structural roots live as long as the tree.
  Neighboring trees' roots sometimes **graft** to each other
  (intraspecific root grafting — the forest as a connected root
  network, sharing water and disease alike). Depth syndromes follow
  climate: alpine trees run shallow with frost-tolerant surface roots;
  permafrost trees are dwarfed by a thaw line they cannot cross.
- **Seasonal roots:** root growth bursts in spring (before/with
  leaf-out) and autumn; roots largely rest in winter and during summer
  drought. Frost hardiness of roots is much lower than shoots — a
  hard freeze without snow cover kills roots (winterkill).

# PART 6 — LEAVES

## 6.1 What leaves do

Leaves are the plant's solar panels: they capture light for
**photosynthesis** (turning CO₂ + water + light into sugar — the food
that builds everything), breathe (**gas exchange** via stomata), and
cool themselves by evaporating water (**transpiration** — which also
drives the water pump, §8.3). Leaves are also where many plants store
food, and where several reproduce. For the Life Tree, the leaf is the
most natural unit of *individual content* — the memory, the entry, the
trophy: many, replaceable, each one a small machine.

## 6.2 Leaf anatomy — the dicot leaf

- **Blade (lamina)** — the flat photosynthetic surface.
- **Petiole** — the stalk connecting blade to stem; it can twist to
  orient the blade to the sun.
- **Stipules** — small appendages at the leaf base (sometimes modified:
  spines in black locust, the "glands" in some legumes).
- **Leaf base** — where the petiole meets the stem (sometimes a
  sheathing base).

Cross-section of the blade, top to bottom:

1. **Upper epidermis** — a clear, wax-coated (**cuticle**) skin. Its
   transparency lets light through; its wax (the **epicuticular wax**
   layer — the "bloom" on plums and grapes) repels water and blocks
   pathogens. (The cuticle is the shiniest layer on a leaf.)
2. **Palisade mesophyll** — tall, tightly packed green columns: the
   main photosynthesis factory (most chloroplasts here).
3. **Spongy mesophyll** — loose, airy cells below: photosynthesis plus
   gas exchange; the air spaces connect to the stomata.
4. **Lower epidermis** — skin with the **stomata**: microscopic pores,
   each flanked by two **guard cells** (and usually two **subsidiary
   cells** — supporting neighbors that help the guard cells change
   shape) that swell/shrink with water pressure to open/close the pore
   (the plant's breathing and water-loss valve). Most dicots are
   **hypostomatous** (stomata only on the underside — water plants
   float them on top); **amphistomatous** = both sides (sun-exposed
   leaves).
5. **Veins** — the vascular bundles of the leaf: **xylem** up,
   **phloem** down, threaded through the mesophyll; the midrib is the
   main vein; veins branch into **veinlets** — the leaf's plumbing net.
   Each vein is wrapped in a **bundle sheath** (a collar of cells
   channeling water/sugar between vein and mesophyll).
   Vein arrangement (**venation**) is a dicot identification trait
   (§6.3), with named subtypes: **craspedodromous** (major veins run
   straight to the margin — elm, oak), **camptodromous** (they loop
   before reaching the margin — dogwood).

**Transpiration** (the leaf's water bill): water evaporates from the
spongy mesophyll and escapes through stomata, pulling water up the
xylem like a chain of tiny buckets (cohesion–tension, §8.3). A large
tree can transpire hundreds of litres a day. **Guttation** — when root
pressure is high and stomata are closed, water is pushed out of
special pores at leaf tips/edges as dew drops (morning droplets on
grass/leaves).

## 6.3 Leaf morphology — the identification system

- **Simple vs compound:** a **simple leaf** is one blade (oak, maple,
  birch). A **compound leaf** is divided into **leaflets** — each
  leaflet has no axillary bud (its stalk is a **petiolule**), and the
  whole leaf falls as one unit; leaflets themselves arrange opposite
  or alternate on the rachis. Compound
  forms: **pinnately compound** (leaflets along a central
  **rachis** (the leaf's own mid-stalk, a continuation of the petiole) — ash, walnut; **odd-pinnate** = terminal leaflet present,
  **even-pinnate** = none), **bipinnate** (leaflets again divided —
  honey locust), **decompound** (divided three times or more — many
  ferns' analogs in dicots: carrots, yarrow), **palmately compound**
  (leaflets from one point — horse chestnut, hemp), **trifoliolate**
  (three leaflets — clover, poison ivy). The old rhyme: "leaflets
  three, let it be."
- **Venation:** dicots have **reticulate (net) venation** — a branching
  network; **pinnate** (feather-like — oak, cherry) vs **palmate**
  (hand-like — maple, sycamore). (Parallel venation = monocot tell.)
- **Leaf margins:** entire (smooth), serrate (saw-toothed — birch),
  dentate (coarse teeth), crenate (rounded scallops), undulate
  (wavy — the ripple of many shade leaves), spinose (spine-toothed —
  holly), lobed (pinnatifid = deeply lobed half-way — oak; palmatifid
  = palmately lobed — maple).
- **Leaf shapes:** lanceolate (spear — willow), ovate (egg),
  cordate (heart — linden), obovate, sagittate (arrowhead), hastate,
  linear, orbicular (round — aspen), elliptic, reniform (kidney),
  acicular (needle), deltoid (triangle — poplar), spatulate (spoon —
  daisies), peltate (the stalk attached INSIDE the blade, shield-like
  — nasturtium, lotus).
- **Leaf apex:** acute, acuminate (drawn out), obtuse, mucronate
  (tipped with a small point), emarginate (notched at the tip).
- **Leaf base:** cuneate (wedge), truncate (cut off), cordate
  (heart-shaped notch), oblique (asymmetrical — elm, the classic
  "lopsided leaf").
- **Phyllotaxy:** covered in §4.4 (alternate/opposite/whorled/spiral);
  add **rosette** — leaves in a tight ground-level spiral (dandelion,
  daisies — the biennial's first-year form, §11.1). Leaf symmetry
  classes: **bilateral** (mirror halves — most leaves) vs **radial**
  (no mirror plane — many rolled/flattened leaves).
- **Leaf identification:** venation + margin + shape + arrangement
  form the botanist's **dichotomous key** — a two-choice ladder
  ("veins straight to margin? → craspedodromous → …") that identifies
  any leaf. The same trait dictionary is the natural basis for the
  Life Tree's leaf-type catalog (§13).

## 6.4 Leaf development & behavior

- **Development:** leaves arise as tiny bumps (**primordia**) on the
  flanks of the SAM, expand by cell division then cell enlargement, and
  mature basipetally (tip first). A leaf's final size is set early; it
  does not grow after maturity.
- **Heterophylly:** the same plant makes different leaves in different
  contexts: juvenile vs adult (eucalyptus, ivy — §3.2), sun leaves vs
  **shade leaves** (sun: small, thick, many palisade layers, high
  photosynthesis; shade: large, thin, few palisade layers — the plant
  stretches its panels to catch dim light), water leaves vs air leaves
  (aquatic plants). Leaf longevity spans weeks to years: temperate
  deciduous leaves live one season; evergreen leaves 1–5 years; the
  record is *Welwitschia*'s two permanent leaves (a gymnosperm — the
  dicot records are the slow evergreens). Some leaves even make
  plantlets: *Kalanchoe* (mother-of-thousands) sprouts whole babies
  along its leaf margins — leaf-edge reproduction.
- **Leaf movements:** **nyctinasty** — sleep movements (legumes fold
  leaves at night), **heliotropism** — sun-tracking (bean and sunflower
  leaves orient to the sun; some flowers track), **seismonasty** —
  the sensitive plant (*Mimosa pudica*) collapses leaves on touch
  (turgor loss — water pressure dumped from cells). These are turgor
  movements, not growth movements — and the folding hinge is the
  **pulvinus** (a swollen, motor-cell-packed joint at the leaf or
  leaflet base). Temperature and light also drive nastic folding
  (**thermonasty**, **photonasty**).

## 6.5 Leaf modifications — the exhaustive catalog

1. **Leaf tendrils** — coiling graspers that are modified leaves or
   leaflets: the garden pea's terminal leaflets became tendrils;
   vetch uses whole leaves; cucumber uses shoots (contrast §4.6.7).
   Why: cheap verticality — climb for light without wood.
2. **Spines** — hard pointed structures that are MODIFIED LEAVES (or
   leaf parts, e.g. stipules): barberry (each spine is an entire
   modified leaf), cactus (areoles — modified axillary buds — bear
   spines that are modified leaves; the green stem photosynthesisizes),
   black locust (paired stipule-spines). Spines have no vascular
   continuity with stem wood; thorns do (§4.6.8). Memorize: **thorn =
   stem; spine = leaf; prickle = skin** (rose prickles are epidermal
   outgrowths that peel off).
3. **Phyllodes** — flattened, leaf-LIKE petioles that took over
   photosynthesis while the true blade was reduced/absent: Australian
   acacias (seedlings make true pinnate leaves; adults make broad
   vertical phyllodes that present their edge to midday sun — less
   overheating, less water loss).
4. **Pitcher leaves** — hollow jug-shaped pitfall traps: insects enter
   the slippery rim, fall into fluid at the base, and are digested by
   enzymes + bacteria. One rolled, cup-shaped leaf with a lid
   (**operculum**): *Nepenthes* (tropical pitcher plants — hanging
   pitchers), *Sarracenia* (North American trumpets), *Darlingtonia*
   (cobra lily). Why: nitrogen starvation in bogs.
5. **Bladder traps** — tiny hollow sacs on submerged leaves that SUCK
   in prey: a trapdoor held shut by suction springs open when a water
   flea brushes trigger hairs; water rushes in with the prey; the door
   snaps shut: *Utricularia* (bladderwort).
6. **Sticky insectivorous leaves** — leaves armed with glandular hairs
   exuding adhesive mucilage; insects stick, struggle, trigger more
   secretion, and are digested on the leaf surface (or the leaf curls
   over them): *Drosera* (sundew — tentacle hairs that bend toward the
   prey), *Pinguicula* (butterwort — greasy rosette curling margins),
   *Byblis*. Why: nitrogen/phosphorus capture on poor soils.
7. **Snap traps** — hinged two-lobed leaves that close FAST (~0.1–0.5 s)
   when trigger hairs are touched twice (the double-trigger prevents
   false closures from raindrops); marginal teeth interlock; digestion
   takes days; the trap reopens: *Dionaea muscipula* (Venus flytrap).
   The most elaborate insect trap in the plant kingdom, built from a
   leaf that still photosynthesisizes when open.
8. **Storage (succulent) leaves** — thick fleshy leaves packed with
   water-storage parenchyma + mucilage, often with **CAM
   photosynthesis** (stomata open only at night, storing CO₂ as acid
   for daytime use — cutting water loss to a fraction): aloe,
   agave, sedum, echeveria, ice plant. Why: the leaf is a canteen.
9. **Bulb scales** — the fleshy layers of a bulb: thickened non-green
   storage leaves (or leaf bases) fueling next season's growth: onion
   (the edible layers), tulip, daffodil, garlic (cloves = modified
   buds within scales).
10. **Bracts** — modified leaves associated with flowers, usually small
    and green — but sometimes large, vividly colored, and mistaken for
    petals: poinsettia ("red petals" = bracts around tiny cyathia),
    bougainvillea (papery magenta "flowers" = bracts around tiny white
    true flowers), dogwood (white "petals" = bracts), the green cup
    under a daisy head (involucral bracts). Why: pollinator
    advertisement at lower cost than true petals.
11. **Bud scales** — tough, hairy or resinous modified leaves wrapping
    dormant buds through winter: horse chestnut (sticky varnished
    buds), beech, lilac. They fall when the bud opens, leaving the
    **bud scale scars** that let you age a twig in years (§4.3).
12. **Cotyledons** — the seed leaves (§1.2): the seedling's first food
    transfer organs; storage (bean) or photosynthetic (sunflower).
13. **Scale leaves** — small, thin, non-green, non-photosynthetic
    leaves: on rhizomes (ginger, iris — protecting tips, marking
    nodes), on buds (bud scales), on parasitic plants that lost
    photosynthesis (broomrape, dodder).
14. **Foliage leaves** — the standard green photosynthetic leaf — the
    default against which all modifications are defined.
15. **Catch leaves** — the leaf-surface trap of sticky insectivores
    (sundew, butterwort): the leaf itself is the trap.
16. **Spines-as-stipules / spine-tipped leaves** — marginal or tip
    spines that are part of the leaf: holly's spiny margins (modified
    marginal teeth), agave's needle tips.

**Evolutionary logic in one sentence:** wherever a plant is short of
water, nitrogen, support, or storage, natural selection recycles the
leaf — the cheapest, most abundant organ — into the needed tool.

# PART 7 — SECONDARY GROWTH (thickening, wood, rings, bark)

## 7.1 The second growth engine

**Primary growth** (Parts 3–6) lengthens the plant at the tips.
**Secondary growth** thickens it — the process that turns a sapling into
a trunk. It runs on two lateral meristems:

- **Vascular cambium** — a cylinder of dividing cells between wood and
  bark. It produces **xylem (wood)** to the inside and **phloem** to the
  outside. All girth comes from this one thin ring — which is why a
  fence wire nailed loosely around a young tree ends up INSIDE the wood
  decades later, while the bark grows around it.
- **Cork cambium (phellogen)** — a ring in the outer bark producing
  **cork (phellem)** outward and **phelloderm** inward; together with
  the cork layers it forms the **periderm** — the waterproof, gas-
  exchanging outer skin (§7.5).

**The formation of the cambium:** in a young dicot stem, the bundles'
fascicular cambium (between each bundle's xylem and phloem) joins with
**interfascicular cambium** (new cambium arising in the medullary rays
between bundles) to form one continuous cylinder — the ring that will
now grow the trunk. In roots the same thing happens.

**The two cell types the cambium makes:**
- **Fusiform initials** — long cells producing the axial system:
  vessel elements + fibers + tracheids (wood) and sieve tubes (phloem).
- **Ray initials** — producing the **rays**: radial lines of
  parenchyma running through the wood (the medullary rays of §4.2,
  continued outward), storing food and moving water sideways.

## 7.2 The yearly cycle of the cambium — where rings come from

The cambium does not work year-round (temperate zone). It wakes in
spring, sleeps in winter:

- **Spring (earlywood / springwood):** cambium divides fast; cells are
  large, thin-walled, wide-lumen — the efficient water pipes. Growth is
  rapid and light-colored.
- **Summer→autumn (latewood / summerwood):** division slows; cells are
  small, thick-walled, dense — the structural wood. Growth is slow and
  darker.
- **Winter:** the cambium goes dormant; a visible boundary line forms
  between latewood and the next year's earlywood. **That boundary is
  the annual ring.** Count the rings = count the growing seasons
  (with the caveats below).
- **Wood types:** **ring-porous** woods (oak, ash, elm) have
  dramatically large earlywood vessels — rings are obvious; **diffuse-
  porous** woods (maple, birch, beech) have uniform vessels — rings are
  subtle; **semi-ring-porous** (walnut, black cherry) sits between.
  **False rings** (extra boundaries from mid-season drought or
  defoliation) and **missing rings** (a year when the cambium did not
  grow — severe drought, heavy defoliation) are the known anomalies.
  Ring width also varies with year quality: wide rings = good years,
  narrow = bad. **Trees are living climate records — the science of
  reading them is dendrochronology**, and the cambium's spring wake-up
  is triggered by rising temperature + auxin arriving from the waking
  buds (the shoots order the trunk to grow).

## 7.3 Wood — sapwood, heartwood, and the living vs dead

- **Sapwood** — the outer, younger rings: the LIVING wood. It
  transports water (via vessels/tracheids), stores food, is soft and
  light-colored. The bulk of the active plumbing.
- **Heartwood** — the inner, older rings: the DEAD wood. Vessels get
  plugged with **tyloses** (outgrowths of neighboring cells blocking
  the pipes) and filled with resins, tannins, and colored compounds
  (why heartwood is dark — walnut's chocolate, oak's brown). Heartwood
  is dead weight — but it is the tree's structural skeleton and
  chemical defense (rot-resistant, insect-repellent).
- **The living wood rule:** only a thin shell near the bark is alive.
  A tree "dies" of age not when the center rots (hollow old oaks are
  alive and well) but when the cambium shell fails.
- **Hardwood vs softwood (botanical meaning):** hardwoods = angiosperm
  (dicot) woods — oak, maple; softwoods = gymnosperm (conifer) woods —
  pine, spruce. The names are about flower type (naked vs covered
  seed), not hardness: balsa is a hardwood, and it's softer than most
  softwoods.
- **Grain and rays:** the rays of §7.1 show as the medullary ray
  flecks on quarter-sawn oak — the "tiger stripes." Wood grain is the
  pattern of annual rings + rays + vessels seen in section — and it
  has named types: **straight** (most temperate woods), **spiral**
  (sweet gum), **interlocked** (elm, mahogany), **wavy** (maple —
  the "fiddleback" of violins), **bird's-eye** (the tiny lens pattern
  of bird's-eye maple). Heartwood colors go far beyond brown: ebony's
  black, purpleheart's violet, padauk's red — the heartwood is where
  a tree keeps its dyes and defenses.

## 7.4 Reaction wood

When a trunk leans or bends, it builds corrective wood: **tension
wood** on the UPPER side of dicot branches (gelatinous fibers that
contract, pulling the branch up — why bent trunks straighten), and
**compression wood** on the lower side of conifers (pushing). Reaction
wood is how trees right themselves and how branches hold their angles —
the tree actively manages its shape.

## 7.5 Bark — the tree's second skin

- **Periderm** — the cork cambium's output: cork (phellem) + cork
  cambium + phelloderm. Cork cells die air-filled, becoming the
  lightweight waterproof insulation — commercial cork is harvested
  from the cork oak's periderm (the tree regrows it — a renewable
  harvest).
- **Lenticels** — the breathing pores through the periderm (§4.3):
  the only places gas exchange gets through bark.
- **Rhytidome** — the accumulated layers of dead periderm + phloem
  that form the visible bark surface. Bark types: smooth (beech —
  the periderm keeps expanding), scaly, fissured (deep cracks — oak),
  papery (birch — peeling sheets), corky (cork oak, winged euonymus).
- **Bark as defense:** thick bark insulates against fire (redwood,
  cork oak — a fire jacket), resists herbivores (the tannins in oak
  bark), and seals wounds (the callus that rolls over a cut).

## 7.6 The trunk layer stack — memorize this

Outside → inside, a mature dicot tree trunk:

1. **Bark (rhytidome)** — dead outer armor.
2. **Periderm** — cork + cork cambium (the outer growth ring).
3. **Phloem** — the living sugar pipes (inner bark; thin, renewed each
   year, dies outward into the rhytidome).
4. **Vascular cambium** — the one-cell-thick engine of ALL girth.
5. **Sapwood** — living water pipes + storage (young rings).
6. **Heartwood** — dead structural skeleton (old rings).
7. **Pith** — the original stem core, usually crushed or gone.

Every year: cambium adds one ring of wood inward (the year's growth
record) and a layer of phloem outward (which becomes next year's bark).

## 7.7 Growth patterns summary

- **Indeterminate growth:** plants never stop adding organs (vs
  animals' determinate growth) — the tree keeps growing until it dies;
  only the RATE changes (§11.5). Individual shoots can be **determinate** (a pre-set number of nodes, then a flower or bud - apple spurs, many flowers) or indeterminate (grow on year after year - most tree shoots).
- **Seasonal cambium activity:** active spring–summer, dormant winter
  (temperate); in the tropics the cambium may grow continuously (no
  rings) or pulse with wet/dry seasons (faint rings).
- **Twig growth mirrors trunk growth:** every shoot tip adds length
  (primary) and girth (secondary) — the whole tree is a hierarchy of
  the same two engines.

# PART 8 — THE VASCULAR SYSTEM (the tree's plumbing)

## 8.1 The two pipe networks

The plant's transport system is two parallel one-way networks running
through every stem, root, leaf, and fruit:

- **Xylem** — water and dissolved minerals, UP from roots to leaves.
  The pipes are dead at maturity: **vessel elements** (short tubes
  joined end-to-end, perforated at the joints — dicots' water
  superhighways) and **tracheids** (long, tapering, overlapping cells —
  the backup/slow lanes; the only pipes of conifers). Reinforced by
  **fibers** (support cells). The wall of a vessel is the wood itself.
- **Phloem** — sugars and organic compounds, FROM the photosynthesizing
  leaves to everywhere else (roots, fruits, growing tips, storage).
  The pipes are ALIVE: **sieve tubes** (living cells whose nuclei are
  lost at maturity, end-to-end through perforated sieve plates) each
  accompanied by **companion cells** (the "support staff" that keep
  the enucleate sieve tubes alive). Phloem is the inner bark, renewed
  annually by the cambium.

**The master map:** roots drink → xylem carries water up the trunk →
leaves make sugar → phloem carries sugar down and out to every living
cell. The two networks run side by side in every bundle; their direction
of travel is opposite; both are produced by the cambium (§7).

## 8.2 Sap — what the tree actually moves

- **Xylem sap:** water + dissolved minerals (nitrogen, phosphorus,
  potassium — the fertilizer elements) drawn up from the roots. In
  spring, some trees (sugar maple) push sugar-rich xylem sap up under
  root pressure — the maple syrup harvest.
- **Phloem sap:** mostly sucrose (table sugar) + amino acids + hormones,
  moved by **pressure flow**: sugar is loaded into the phloem at the
  leaf (high concentration → water follows in → pressure builds) and
  unloaded at the sinks (roots, fruits, buds — pressure drops), so the
  sap flows from source to sink like a pressurized conveyor.
- **Sinks vs sources:** leaves are the primary source (spring: stored
  reserves are the source, buds the sink; autumn: leaves export their
  last sugars down into the trunk before falling — §9.5). The sink/source
  logic drives where growth happens.

## 8.3 How water rises to the top of a tall tree

The **cohesion–tension theory** (the modern consensus):

1. **Transpiration pull:** water evaporates from leaf mesophyll (§6.2);
   each evaporated molecule tugs its neighbor (water molecules are
   cohesive — they stick to each other), so the entire water column in
   the xylem is under tension, pulled from above.
2. **The chain:** leaf → twig → trunk → root → soil. It is one
   continuous tensioned column from the soil to the leaf (a "chain of
   tiny buckets" pulled up by evaporation).
3. **Root pressure** (osmotic push from the roots) helps in small
   plants and spring bleeding, but the pull from above is the main
   engine — which is why transpiration, drought, and air bubbles
   (**embolism** — an air pocket breaking the column; repaired under
   pressure or by new rings) matter so much.
   A giant redwood moves water ~100+ metres this way without a
   pump — evaporation does the work.

## 8.4 What the vascular system means for the Life Tree

This is the part the user explicitly wired: **nutrition feeds the
vascular system.** In botanical terms, the tree's food transport
(xylem+phloem, §8.1–8.2) is what keeps every other organ alive — the
trunk, branches, leaves, flowers, fruit all depend on the sap network.
A tree with a poor vascular system cannot grow leaves, flower, or fruit,
no matter how good the season. The parallel for the engine: nutrition
input = the tree's "sap" — the throughput that powers the rest of the
tree's systems (§13).

# PART 9 — SEASONAL CYCLES (the tree's year)

## 9.1 Phenology — the plant's calendar

**Phenology** is the timing of recurring biological events — the
plant's internal calendar: bud break, leaf-out, flowering, fruiting,
leaf color, leaf fall. It is driven by the two master clocks:

- **Temperature (warmth):** spring events are predicted by accumulated
  warmth — **growing degree days** (each day's warmth above a base
  temperature adds up; when the total passes a species threshold,
  buds break). This is why spring comes later at altitude and latitude
  (the lapse rate: roughly 1.5–3 days later per 100 m of elevation).
- **Day length (photoperiod):** autumn events (leaf color, dormancy
  onset) are triggered by shortening days — the plant's warning that
  winter approaches even if the weather is still warm. (The pigment
  **phytochrome** measures day length: it flips between two forms —
  Pfr, the far-red-absorbing active form made in daylight, and Pr —
  and the night's length resets the ratio: the plant literally counts
  the dark hours.)
- **Chilling requirement:** many temperate plants must also accumulate
  COLD (hours below a threshold — the winter requirement) before they
  can respond to warmth in spring (dormancy's exit ticket, §1.4
  stratification). Chill-hour values are species-specific (apple
  400–1,200 hours, peach 300–900). A warm winter that fails the
  chilling requirement produces a confused, staggered spring
  (**delayed foliation** — trees leafing out late and unevenly), a
  real climate-change damage.

**Budburst stages** (the standardized citizen-science sequence): bud
closed → bud swelling → bud break (green tip) → leaf unfolding → leaf
expansion → full leaf. The scientific standard is the **BBCH scale**
(00–99 two-digit codes covering the whole life cycle: 00–09
germination, 10–19 leaf development, 60–69 flowering — BBCH 65 = full
flowering, 90–99 senescence/dormancy). Phenology is how we see climate
change in real time (blooms weeks earlier than a century ago;
"false springs" — warm snaps that break buds early, then a killing
frost — are an increasing climate-change damage) — and it is the
natural calendar for the Life Tree's seasonal behaviors.

## 9.2 Dormancy — the three kinds and the wintering strategy

- **Paradormancy** — suppression by a nearby organ (apical dominance,
  §4.5): the bud is fine but its neighbor holds it back.
- **Endodormancy** — the bud's OWN internal winter rest: it cannot
  grow even in warm weather until it has satisfied its chilling
  requirement. The hard winter lock.
- **Ecodormancy** — external environmental block (still frozen, too
  dry): the bud is ready but the weather forbids it.

The cambium shares the cycle: active spring→summer, dormant winter
(§7.2) — rings are the fossil record of this dormancy rhythm. Roots
also rest (winter + summer drought in dry climates). Dormancy is what
lets temperate trees survive -30°C: cells dehydrate, sugars and
protective proteins accumulate (**cold hardiness** — and its extreme,
**supercooling**: cell fluids staying liquid below freezing, the tree
freezing "safely"), and the tree sits as a closed, breathing-less
skeleton until spring.

## 9.3 Photoperiodism — the flowering clock

Beyond leaf timing, day length controls REPRODUCTION:

- **Short-day plants** — flower when nights grow long (autumn
  bloomers: chrysanthemum, poinsettia — which is why poinsettias need
  dark treatment to "bloom" for Christmas).
- **Long-day plants** — flower when days grow long (summer bloomers:
  spinach, many grains).
- **Day-neutral plants** — ignore day length (tomato, cucumber,
  dandelion).
- **Critical day length:** each species has a threshold (e.g., "flowers
  when night exceeds 12 hours") — the switch is quantitative, not
  absolute. The flowering signal itself is a mobile hormone —
  **florigen** (the protein FT — *Flowering Locus T* — produced in
  leaves, shipped through the phloem to the shoot tip, where it flips
  the meristem to flower-making). **Vernalization** is the cold
  counterpart: a cold period (winter) is required before many
  biennials and winter annuals will flower at all (wheat, cabbage
  family, foxglove) — they count a winter before blooming in spring.

## 9.4 Evergreen vs deciduous — the leaf economics

- **Deciduous:** drop all leaves in autumn. Leaf production is cheap
  but short-lived; the bare season is a dormant, dry-run season.
  Deciduousness is a water-saving strategy (no leaf = no transpiration
  = no winter dehydration) and a cold-resistance strategy (no soft
  tissue to freeze).
- **Evergreen:** keep leaves year-round. Leaf production is EXPENSIVE
  (thick cuticle, sclerophyllous = hardened leaves, often needle-like
  or leathery) but leaves pay back over years. Evergreens dominate
  where winters are mild (Mediterranean, tropics) or where the growing
  season is too short to regrow leaves each year (boreal).
- **Semi-deciduous / drought-deciduous:** drop leaves in the DRY
  season (many tropicals: teak, baobab; desert shrubs). The trigger is
  water, not temperature.
- **Marcescent (the middle strategy):** beech and some oaks hold their
  DEAD brown leaves through winter, shedding them only at spring bud
  break. The dead leaves are not functional — they protect the buds,
  slow desiccation, and delay snow loading — and the strategy sits
  between evergreen and deciduous: the tree keeps its silhouette all
  winter (the "still full tree" of a winter beech wood).
- **Leaf flush patterns:** some trees flush ALL leaves at once
  (spring burst — most temperate trees), some flush continuously
  (tropicals), some flush in waves (Malaysian dipterocarps flush with
  the monsoon). Flush vs continuous affects canopy appearance all year.

## 9.5 The four seasons of a temperate dicot tree — month by month

**SPRING (the awakening):**
- Buds break (budburst) as warmth accumulates past the chilling
  requirement; bud scales fall (bud scale scars — §4.3).
- Flowering often comes BEFORE leaf-out (cherry, willow, hazel — flowers
  built last year's buds, using stored reserves; wind-pollinated trees
  bloom early while leaves would block pollen).
- Leaves flush; the cambium wakes; EARLYWOOD is laid down (wide water
  pipes — §7.2).
- Roots grow (the spring root flush); sap rises (maple syrup season).
- The tree runs on stored reserves until the new leaves pay back their
  cost (the "spring deficit").

**SUMMER (the working season):**
- Full canopy photosynthesis: the tree's peak food production.
- Shoots elongate (primary growth), new rings thicken (secondary
  growth — LATEWOOD begins), fruits swell, seeds develop.
- Transpiration peaks; drought stress possible (stomata close, growth
  slows — possibly a false ring).
- Heat and water decide the year's growth quality.

**AUTUMN (the harvest and the retreat):**
- Fruits ripen (**ethylene** — the ripening hormone, §10.7 — drives ripening) and seeds disperse.
- Day length shortens → the abscission program starts: chlorophyll
  breaks down (greens fade), **carotenoids** (orange/yellow — always
  present, now revealed) and **anthocyanins** (red/purple — NEW
  pigments, made as sugar is trapped in leaves) produce autumn color.
- **Nutrient resorption:** before the leaf falls, the tree pulls its
  nitrogen and phosphorus back out of the leaves into the trunk and
  roots (autumn leaves are lighter in nitrogen than summer leaves) —
  the tree banks its fertilizer for spring.
- **Abscission** — the leaf separates at the **abscission zone** (a
  weak seam at the petiole base), driven by ethylene + falling auxin;
  the leaf falls, the wound seals, the **leaf scar** forms (§4.3).
- The cambium shuts down (dormant); final latewood sets the ring
  boundary; sugars convert to storage starch in wood and roots.

**WINTER (the closed season):**
- Full dormancy: no growth, no transpiration, minimal metabolism.
- The tree survives frozen: cold hardiness (§9.2), buds sealed in
  scales, roots insulated by snow.
- What you see: the bare silhouette — the crown architecture, the
  branching pattern (§4.5) — the tree's true structure revealed.
- Animal life depends on it (browse, bark, stored acorns).

**The tropical alternative:** no thermal winter — a **wet/dry** rhythm
instead: growth flushes with the rains, dormancy/leaf-drop with the
dry season (drought-deciduous, §9.4); the cambium may grow year-round
(no rings, or faint wet/dry rings — which is why tropical wood is
hard to age).

# PART 10 — REPRODUCTION (flowers, inflorescences, pollination, fruits, dispersal)

## 10.1 The flower — the reproductive shoot

A flower is a compressed, modified shoot specialized for reproduction.
Its organs are modified leaves, arranged in whorls (rings), outside → in:

1. **Calyx** — the outermost ring: **sepals** (usually green, protective).
2. **Corolla** — the showy ring: **petals** (usually colored —
   advertisement). Together calyx + corolla = the **perianth**; when
   petals and sepals look alike they are called **tepals**
   (magnolia, tulip).
3. **Androecium** — the male organs: **stamens**, each = **filament**
   (stalk) + **anther** (the pollen box, releasing **pollen grains** —
   the male gametophytes, carrying the sperm).
4. **Gynoecium** — the female organs: one or more **carpels** (the
   pistil), each = **stigma** (the pollen-catching surface) + **style**
   (the neck) + **ovary** (the base holding **ovules** — the future
   seeds, §1.3, on the ovary's **placenta**; the ovary's internal
   chambers are **locules**). Carpels may be **apocarpous** (free —
   buttercup, strawberry's many little pistils) or **syncarpous**
   (fused into one compound pistil — tomato, apple).

**Flower classification vocabulary:**
- **Complete** = all four whorls present; **incomplete** = any missing.
- **Perfect (bisexual)** = has both stamens and carpels in one flower;
  **imperfect (unisexual)** = staminate (male) or carpellate (female)
  only. Plants bearing both unisexual types: **monoecious** (same plant:
  oak, walnut — separate male catkins + female flowers); separate
  plants: **dioecious** (willow, holly, most hollies — a male tree and
  a female tree). **Polygamous** plants mix sexes oddly (some flowers
  perfect, some unisexual — ash, maple).
- **Floral symmetry:** **actinomorphic** (radial — star-like: buttercup,
  apple), **zygomorphic** (bilateral — mirror halves: pea, mint, orchid
  analog), **asymmetric** (rare).
- **Ovary position:** **hypogynous** (ovary above the other whorls —
  "superior"; buttercup, tomato, pea), **perigynous** (ovary free
  inside a cup of fused floral bases — the hypanthium; cherry, rose),
  **epigynous** (ovary below — "inferior"; apple, cucumber — the fruit
  that results is attached above the floral cup, which matters for
  pomes/pepos, §10.5).
- **Floral formula** — the shorthand: K5 C5 A∞ G(5) means 5 sepals,
  5 petals, many stamens, 5 fused carpels — the botanist's compact
  description. The **floral diagram** is its visual form: a schematic
  cross-section showing the whorls, their overlaps, and the ovary's
  chamber layout.
- **Development (one line):** flowers arise when the SAM switches from
  leaf-making to flower-making — a **floral meristem**; the ABC model
  of organ identity (A genes → sepals/petals, B → petals/stamens,
  C → stamens/carpels) is the genetic program.
- **Why flowers are small or clustered:** a single flower may be
  tiny — but many together make a display big enough to attract
  pollinators. Which leads to the inflorescence…

## 10.2 INFLORESCENCES — THE COMPLETE TAXONOMY

An **inflorescence** is the arrangement of flowers on the stem. The
flower's own stalk is the **pedicel**; the main axis that carries the
inflorescence (or a solitary flower) is the **peduncle**. The master
distinction: **racemose (indeterminate)** — the axis keeps growing,
oldest flowers at the base/outside, youngest at the tip; **cymose
(determinate)** — the axis ends in a flower (the oldest at the
tip/center), younger flowers arise below it. Every form below is one
of these two, alone or compound.

### A. RACEMOSE (indeterminate — the axis grows on, flowers open base→tip)

1. **Raceme** — unbranched axis, stalked (pedicellate) flowers, oldest
   at base: mustard, radish (Brassicaceae), foxglove, lupine.
2. **Spike** — a raceme with SESSILE (stalkless) flowers: amaranth
   (dicot), wheat (monocot), plantain.
3. **Spikelet** — a tiny spike; the basic unit of grass/sedge
   inflorescences (nearly all monocot — no common dicot spikelet);
   grass "heads" and "panicles" are arrangements of spikelets.
4. **Catkin (ament)** — a soft, drooping, usually UNISEXUAL
   spike/raceme of tiny flowers, typically wind-pollinated, falling as
   a unit: willow (pussy willows), birch, oak (the dangling tails),
   walnut, poplar.
5. **Spadix + spathe** — a spike of tiny flowers embedded in a thick
   fleshy axis (spadix) wrapped in a showy hooded bract (spathe):
   arum family (jack-in-the-pulpit, peace lily, anthurium,
   *Amorphophallus* — mostly monocots; some dicots: *Piper*).
6. **Corymb** — a flat-topped raceme: axis elongated but lower
   pedicels longer, so all flowers level out: candytuft, cherry,
   hawthorn. (A flat-topped CYME = cymose corymb, §10.2B.)
7. **Umbel** — a short axis with equal pedicels from one point,
   umbrella-like: onion (monocot), ivy, milkweed; the classic family:
   Apiaceae ("Umbelliferae").
8. **Capitulum (head; technically calathid)** — a very condensed
   raceme: tiny sessile flowers on an expanded receptacle — **receptacle**: the flat flower-stalk tip the whorls attach to (also called the **torus**)
   ringed by an involucre (bract cup). Signature family: Asteraceae —
   sunflower, daisy, thistle, dandelion; also teasel. The head has two
   flower kinds: **disk florets** (inner, tubular, usually
   bisexual) and **ray florets** (outer, strap-shaped ligulate, often
   female or sterile — the daisy's "petals"). Heads can be all-ray
   (dandelion), all-disk (thistle), or both (sunflower).
9. **Panicle** — a branched (compound) raceme: repeated branching,
   usually pyramidal: oat (monocot), lilac, buckeye, chestnut.
   (Loosely, any branched cluster — but strictly it is an
   indeterminate branched raceme; a branched CYME is a thyrse, §C.)

### B. CYMOSE (determinate — the axis ends in the oldest flower)

10. **Cyme (dichasial)** — central flower opens first, younger flowers
    on branches below; typically flat-topped: **dichasium** = two
    lateral branches per node (chickweed, carnation, strawberry-bush).
11. **Monochasium** — one lateral branch per node, forming a
    coiled/zigzag chain:
    - **Helicoid cyme (bostryx)** — coils to one side: forget-me-not.
    - **Scorpioid cyme (rhipidium)** — branches alternate sides,
      zigzag: comfrey, viper's bugloss, some nightshades.
    - **Cincinnus** — a tight helicoid cyme with very short stalks:
      dayflower.
12. **Polychasium (pleiochasium)** — more than two lateral branches
    per node: euphorbia's wheel of cyathia, elder.
13. **Umbelliform cyme** — a compressed cyme mimicking an umbel
    (common in Allium; true umbels are racemose).

### C. COMPOUND & SPECIAL

14. **Compound raceme / double raceme** — racemes on a raceme; the
    general form of the panicle (§A9).
15. **Compound umbel** — umbels on umbels: primary rays bear secondary
    umbels (umbellets), each with a tiny involucre. Signature family:
    Apiaceae — carrot, dill, parsley, fennel, poison hemlock.
16. **Compound corymb** — corymb of corymbs, branched and flat-topped:
    hawthorn, yarrow (corymbs of capitula).
17. **Compound spike** — spike of spikes: wheat (spike of spikelets).
18. **Compound capitulum** — heads of heads: buttonbush, some
    Asteraceae.
19. **Thyrse / thyrsus** — an indeterminate (racemose) main axis
    bearing CYMOSE side branches (usually dichasia); compact, often
    pyramidal: lilac, grape, horse chestnut. Often mislabeled "panicle"
    — the distinction is the side-branch structure.
20. **Verticillaster** — whorls of small dichasial cymes (each reduced
    to a scorpioid cyme) in opposite leaf axils, forming false rings
    around the stem: signature family Lamiaceae — deadnettle, mint,
    sage, basil. Stacked verticillasters look like a spike.
21. **Cyathium** — a PSEUDANTHIUM: a cup-like involucre holding ONE
    tiny female flower (stalked 3-carpel ovary) ringed by male flowers
    reduced to single stamens, plus nectar glands. Looks like one
    flower, is many: the genus Euphorbia (poinsettia's "petals" are
    glands/bracts; cyathia arranged in umbels or thyrsoids).
22. **Hypanthodium / syconium** — the fig inflorescence: hundreds of
    tiny unisexual flowers lining the inside of an inverted hollow
    urn-shaped receptacle (the syconium), opening at the top
    (ostiole): fig (Ficus). Pollinated by fig wasps entering the
    ostiole; the mature syconium IS the fruit we eat (§10.5E).
23. **Fascicle** — a tight flower cluster from one axil: dogwoods.
24. **Glomerule** — a dense indeterminate cluster of sessile flowers:
    some catchflies.
25. **Pseudanthium — the big lesson:** a flower-LIKE structure made of
    MANY flowers: cyathium, syconium, most capitula. "One flower" can
    be many flowers — a sunflower head is a population of florets
    evolved to look like one bloom to recruit pollinators. Same trick:
    hydrangea's "petals" are sterile florets; dogwood's are bracts
    (§6.5.10).

## 10.3 Pollination — the matchmaking

**Pollination** = pollen transfer from anther to stigma.

- **Self-pollination:** same flower (or **geitonogamy** — between
  flowers of one plant). Preserves adapted genotypes; risks inbreeding.
  Avoided by: **cleistogamy** (flowers that never open — violets make
  hidden selfing flowers), **dichogamy** (male/female parts mature at
  different times: **protandry** = stamens first; **protogyny** =
  stigma first), **herkogamy** (physical separation of anthers and
  stigma), **self-incompatibility** (biochemical rejection of own
  pollen — brassicas, cherries, apples: why orchards need two
  varieties).
- **Cross-pollination (xenogamy):** the favored strategy of showy
  flowers. The pollination syndromes:
  - **Entomophily (insects):** color (bee-blue, UV nectar guides),
    scent, nectar, landing platforms (zygomorphic flowers — pea,
    mint, orchid analog). Bees see UV; flies like carrion scent;
    beetles like big open bowls; butterflies/moths favor tubular
    flowers (moths for the white night-bloomers, often
    hawk-moth pollinated — the flower's tube and the moth's tongue
    coevolved to absurd lengths); flies pollinate the stench flowers.
    **Buzz pollination** is the bees' trick with poricidal anthers
    (§10.5B9 — the poppy's pores): the bee grips the anther and
    vibrates at a specific frequency, shaking pollen out — tomatoes,
    blueberries, peppers depend on it. The ultimate insect gambits:
    *Ophrys* orchids mimic female bees so exactly that male bees
    attempt **pseudocopulation** with the flower and carry pollen —
    the flower fakes a mate.
  - **Anemophily (wind):** no petals or tiny ones, huge anther
    exposure, feathery stigmas, massive pollen (catkins, grasses,
    oaks). The pollen storm of spring.
  - **Ornithophily (birds):** red/orange tubular flowers, no scent,
    copious dilute nectar (hummingbirds, honeyeaters).
  - **Chiropterophily (bats):** night-opening white/cream flowers,
    strong fruity scent (baobab, some cacti).
  - **Hydrophily (water):** aquatic plants (eelgrass, some pondweeds).
  - **Coevolution:** the fig–fig wasp contract (each fig species has
    its own wasp — §10.2C22), the yucca–yucca moth contract (the moth
    lays eggs in the ovary AND pollinates — a mutual dependence).

## 10.4 From pollen to seed — fertilization

1. Pollen lands on the stigma and germinates: a **pollen tube** grows
   down the style to the ovule.
2. **Double fertilization (the angiosperm signature):** one sperm
   fertilizes the EGG → the **embryo** (2n); the second fuses with the
   central cell → the **endosperm** (3n — the food tissue, §1.2).
3. The ovule becomes the seed (§1.3); the ovary becomes the fruit.
   Seedless fruits are a side note: **parthenocarpy** — fruit
   development without fertilization (seedless banana, navel orange);
   the fruit forms, the seeds never do.

## 10.5 FRUITS — THE COMPLETE TAXONOMY

A **fruit** is the mature ovary (plus whatever is fused to it). The
classic definition: the ripened ovary wall (**pericarp**) — which can
be fleshy or dry — around the seeds. Fruits are classified by structure
and dehiscence (opening) behavior. **True fruits** = ovary wall only;
**accessory (false) fruits** = extra tissue joins in (§F).

### A. SIMPLE FLESHY FRUITS (one ovary, soft)

1. **Berry** — whole pericarp fleshy; seeds embedded in pulp, no
   stone: tomato, grape, blueberry, pepper, banana (leathery berry),
   currant, cranberry. (Gourds and citrus are specialized berries.)
2. **Drupe (stone fruit)** — thin skin, fleshy **mesocarp** (the eaten flesh), HARD stony **endocarp** (the pit) around one seed: peach, cherry, plum, apricot,
   olive, mango, almond (the "nut" IS the pit), coconut (fibrous
   drupe). Walnuts and pecans are drupe-like.
3. **Pome** — fleshy fruit whose edible bulk is mostly the hypanthium
   (floral cup) fused around the ovary; the papery core is the true
   pericarp: apple, pear, quince; rose hip. (A pome is accessory, §F.)
4. **Hesperidium** — a berry with a leathery rind (peel with oil
   glands) and juice sacs inside (modified hairs filling the
   chambers): orange, lemon, grapefruit — all citrus.
5. **Pepo** — a berry with a hard rind and fleshy interior, from an
   INFERIOR ovary, no internal partitions: cucumber, melon,
   watermelon, squash, pumpkin — the gourd family.

### B. SIMPLE DRY, DEHISCENT (open to release seeds)

6. **Follicle** — one carpel, splits along ONE seam; often plumed
   seeds: milkweed pods, columbine, larkspur; magnolia and peony
   fruits are aggregates of follicles.
7. **Legume (pod)** — one carpel, splits along TWO seams; the
   signature fruit of Fabaceae: pea, bean, peanut (the shell is the
   pod; peanuts are seeds), clover, locust trees.
8. **Silique / silicle** — two-carpel fruit with a false partition
   (replum); the outer walls (valves) fall away, leaving the
   seed-bearing frame: **silique** = elongated (mustard, radish),
   **silicle** = short/round (shepherd's purse) — both Brassicaceae.
9. **Capsule** — dehiscent fruit of two or more fused carpels, opening
   several ways: **poricidal** (pores — poppy's pepper-pot lid,
   bellflower), **loculicidal** (down the middle of each chamber —
   cotton, iris, lily), **septicidal** (along the partitions — foxglove),
   **circumscissile (pyxis)** (a lid pops off — plantain,
   pimpernel), **valvate** (hinged valves — eucalyptus),
   **denticidal** (teeth at top). Brazil nuts are a capsule, not a nut.

### C. SIMPLE DRY, INDEHISCENT (do not open)

10. **Achene** — one seed, seed coat free from the fruit wall; often
    with pappus or hooks: sunflower "seeds" (strictly a cypsela, #11),
    buttercup, clematis, sycamore; the specks on a strawberry are each
    an achene fruit.
11. **Cypsela** — achene-like fruit from an INFERIOR ovary, two fused
    carpels; the correct term for Asteraceae fruits (dandelion,
    thistle, sunflower). Most books just say achene.
12. **Caryopsis (grain)** — one seed FUSED to the pericarp; the
    signature grass fruit: wheat, rice, corn (all monocots).
13. **Nut** — one-seeded, hard woody pericarp, often in a cup-like
    cupule/involucre: acorn (oak), hazelnut, chestnut, beech. (Culinary
    "nuts" are mostly not nuts: peanut = legume, almond = drupe,
    cashew = §F, coconut = fibrous drupe.)
14. **Samara (key fruit)** — a winged achene: the pericarp grows a
    flat wing: maple "helicopters" (double samara), ash (single), elm,
    tulip tree (aggregate of samaras).
15. **Schizocarp** — does not open but splits into one-seeded
    mericarps: carrot/parsley/dill (Apiaceae), maple (two samara-like
    mericarps = "samaroid schizocarp"), mallow, linden.
16. **Loment** — a legume-like fruit breaking into one-seeded segments
    at constrictions instead of opening: tick trefoil, sensitive plant.
17. **Utricle** — a tiny bladder-like achene with a loose inflated
    pericarp: beet, dock.
18. **Nutlet** — a small hard one-seeded indehiscent fruit; the four
    nutlets at the base of each mint/borage flower: basil,
    forget-me-not.

### D. AGGREGATE FRUITS (etaerio) — many ovaries, ONE flower

Many free carpels in one flower, each ripening into a fruitlet, all on
one receptacle:

19. **Aggregate of achenes** — buttercup, clematis; strawberry =
    achenes on a swollen fleshy receptacle (§F — the red part is not
    ovary at all).
20. **Aggregate of drupelets** — raspberry (each juicy knob = one
    little drupe pulling off the white receptacle); blackberry is
    aggregate-ACCESSORY (receptacle eaten too).
21. **Aggregate of follicles** — magnolia (the cone-like fruit), peony.
22. **Aggregate of berries** — custard apple, soursop, cherimoya.
23. **Aggregate of samaras** — tulip tree; **of capsules** — sweet gum
    (the spiky ball); **of cypselas** — teasel.

### E. MULTIPLE (COMPOUND) FRUITS — ovaries of MANY flowers

The whole INFLORESCENCE ripens into one fruit; each flower's fruitlet
fuses with its neighbors:

24. **Syconium** — the inverted hollow fig inflorescence matures into
    a fleshy "fruit" lined with tiny achenes: fig. The fig we eat IS
    the inflorescence.
25. **Sorosis** — a fleshy spike of flowers fusing as they ripen:
    pineapple (the "eyes" are individual flowers; also accessory since
    bracts/sepals join in), mulberry (each bump = one flower's
    fruitlet with swollen perianth), osage orange, breadfruit.

### F. ACCESSORY (FALSE) FRUITS — the true fruit vs the swollen extra

**Accessory fruit (pseudocarp):** tissue OTHER than the ovary wall
forms a major part of what we eat. The false-fruit lesson: **what you
eat is often not the ovary.**

26. **Apple/pear (pome):** flesh = hypanthium; true fruit = the papery
    core with seeds.
27. **Strawberry:** flesh = swollen receptacle; true fruits = the
    achenes (each "seed" speck, with a tiny style still attached).
28. **Cashew:** the "cashew apple" = hugely swollen PEDICEL (flower
    stalk); the true fruit is the gray kidney-shaped shell (a
    drupe-like nut) hanging below — the "cashew nut" is the kernel
    inside the true fruit.
29. **Rose hip:** flesh = hypanthium; true achenes inside.
30. **Fig, mulberry, pineapple:** the fleshy mass includes the
    inflorescence axis, bracts, and perianth — multiple-ACCESSORY
    fruits.

## 10.6 Seed dispersal — the departure

Dispersal moves seeds away from the parent (competition + the
Janzen–Connell effect, §3.3):

- **Wind:** samaras (autorotating keys), plumes/pappus (dandelion),
  tumbling (tumbleweeds), dust seeds.
- **Water:** floating fruits/seeds (coconut — the great ocean
  traveler), rain-wash.
- **Animals:** fleshy fruits eaten → seeds defecated (often with
  fertilizer; bird cherries, apples, berries); burrs/hooks hitchhiking
  (burdock — Velcro's inspiration, beggar's ticks); **caching**
  (squirrels' forgotten acorns); **myrmecochory** — ants carrying
  seeds with nutritious elaiosomes (a fatty attachment — trillium,
  many woodland herbs).
- **Mechanical:** explosive dehiscence (touch-me-not/Impatiens — seeds
  flung; witch hazel — seeds shot metres; violet capsules).

## 10.7 The tree's reproductive timeline

- **Juvenile phase:** trees cannot flower until they reach maturity —
  oak ~20–40 years, apple ~5–8. Maturity is measured in size/mass
  more than age (bonsai stay juvenile long; a grafted mature scion
  flowers young).
- **Flowering cues:** photoperiod + accumulated warmth + (for many)
  vernalization (§9.3).
- **The bloom-to-fruit pipeline:** **anthesis** (the flower opening)
  → pollination → **fruit set** (the ovary committing to grow) → fruit
  growth → ripening. Trees shed excess fruit naturally — apples' "June
  drop" (the tree culls overloaded fruit in early summer); white-oak
  acorns mature in ONE season, red-oak acorns take TWO — the oak clans
  differ in fruit timing too (§2.2).
- **Mast years:** synchronized bumper seed crops every 2–7 years
  (oaks, beeches) — predator satiation (§1.6).
- **Spring bloom → autumn fruit:** the flower-to-fruit pipeline takes
  one season for most temperate trees (apple: May flowers → October
  apples); some fruits hang through winter (crabapples, hawthorn hips).
- **Fruit ripening:** **ethylene** (the ripening hormone — one ripe
  apple in a bag ripens the rest) drives color change, softening,
  sugar accumulation; abscission of fruit follows leaf logic (§9.5).
  Ripening styles: **climacteric** fruits ripen in an ethylene burst
  AFTER harvest (banana, apple, tomato — picked green, ripened in the
  box); **non-climacteric** fruits ripen only ON the plant (citrus,
  grape, strawberry — picked ripe or never).

# PART 11 — THE LIFE CYCLE (from seed to senescence)

## 11.1 The three lifestyles

- **Annual** — germinates, grows, flowers, seeds, and dies within ONE
  year: the entire life in one season (sunflower, tomato, most garden
  flowers, many weeds). Survival = the seed.
- **Biennial** — two years: year one = vegetative growth + storage
  (the rosette/root), year two = flowering, fruiting, death: carrot,
  beet, foxglove, cabbage family. The stored root IS the flower
  budget (§5.6.1).
- **Perennial** — lives many years, flowering repeatedly:
  **herbaceous perennials** (die back to roots/bulbs/rhizomes each
  winter — peony, iris, dandelion) and **woody perennials** (trees,
  shrubs, vines — they keep their structure). Most trees are
  **polycarpic** (flower many times — the **iteroparous** strategy:
  repeated reproduction); a few are **monocarpic** (bloom once then
  die — the **semelparous** strategy: all reserves poured into one
  colossal bloom — the century plant/agave and bamboos (monocot
  note); the true dicot monocarpics include the giant lobelias of
  East Africa).
- **The dicot tree is the flagship perennial:** the same individual
  experiences every season, every decade — the organism that keeps
  its whole history in its body (rings, scars, reaction wood).

## 11.2 The tree's life stages — the chronological spine

1. **SEED** — the waiting state (Part 1).
2. **GERMINATION → SEEDLING** — establishment (Parts 2–3): first roots,
   first leaves, high mortality, slow visible growth.
3. **SAPLING** — the fast-growth phase: strong apical dominance, one
   straight leader, rapid height gain, wood accumulation begins. The
   sapling is all investment — no flowers yet.
4. **POLE STAGE** — the canopy-rise phase: still fast height growth,
   competing for light; lower branches self-prune (shade-killed
   branches fall); the trunk clears its lower crown.
5. **MATURE STAGE** — full size reached or approached: height growth
   slows (the height plateau), secondary growth (thickening) continues,
   the crown spreads, **flowering begins** — the tree is now
   reproducing. Fruit years start. Growth ring width narrows with age
   (young rings wide, old rings narrow).
6. **OLD-GROWTH / SENESCENT STAGE** — the late phase: crown dieback
   (top branches die), growth minimal, heartwood hollowing (rot),
   epicormic resprouting (the tree's last defenses), reduced fruit.
   Old trees are not "sick" — they are the mature form of the
   organism, with slower metabolism and greater resilience.
7. **DEATH** — windthrow (blown over), disease, senescence, or the
   sudden end (fire, flood, man). The standing dead tree
   (**snag**) and the fallen log remain a habitat — the tree's death
   feeds the forest (the "afterlife" of a tree).

**Growth curve lesson:** the height/time curve is S-shaped (slow
start → fast middle → plateau), while girth keeps increasing until
near the end. Foresters quantify this as **mean annual increment**
(total growth ÷ age) vs **current annual increment** (this year's
growth): the curves cross at the rotation point — when the tree's
yearly gain peaks — after which the tree is "over its peak" in
production terms (though far from dead). **A tree's age is not its
size** — two same-age oaks can differ tenfold (sun, soil, competition).
Age shows in rings; stage shows in form.

## 11.3 Pioneer vs climax — the forest roles

- **Pioneer species** — colonize open ground: fast growth, sun-loving
  (shade-INTOLERANT), many small seeds, short-lived, weak wood:
  birch, aspen, willow, black locust. They build the conditions for…
- **Climax species** — the eventual dominants: slow growth,
  shade-TOLERANT, few large seeds, long-lived, strong wood: oak,
  beech, maple, hemlock analog. A young climax tree grows slowly in
  the shade of pioneers for decades (the seedling bank, §3.3) until a
  gap opens.
- **Succession** — the staged replacement of communities: field →
  pioneer forest → mixed forest → climax forest. The same plot of land
  hosts different trees over centuries.

## 11.4 Lifespan extremes (dicot trees)

- Short-lived pioneers: aspen ~60–100 years (but the CLONE lives
  millennia — Pando, §5.6.11).
- Middle: oak, maple ~300–600 years.
- Long-lived: the sacred fig (Ficus religiosa) ~2,300 years; baobab
  ~1,275–2,100 years; olive trees ~1,000+. (The oldest known trees
  are gymnosperm bristlecone pines ~4,850 years — out of dicot scope,
  noted once.)
- The record-keeper's lesson: longevity correlates with slow growth,
  dense wood, strong defenses, and (for baobabs) water storage.

## 11.5 The two-engine growth law (recap)

Primary growth (tips) does length; secondary growth (cambium) does
girth. The two run on different clocks: length is a spring/summer
burst (a shoot extends in weeks), girth is a whole-season accrual.
The trunk's ring count = years alive; the twig's bud-scale scar count
= years of that twig (§4.3). **Every year the tree adds a new outer
layer of itself and carries all previous years inside** — the tree is
the only common organism that literally embodies its entire history
in its own body. (The Life Tree's ring metaphor is not decorative —
it is the botanical truth of how trees record time.)

## 11.6 Growth quality through life

- Young trees: wide rings (fast), high growth efficiency (each leaf
  adds a lot of wood).
- Old trees: narrow rings (slow), declining efficiency, but massive
  stored capital — the old tree adds little but is the forest's
  backbone (the largest carbon store, the deepest roots, the most
  habitat).
- **Juvenile vs adult wood:** the wood of a young tree differs
  (lower density, more reaction wood); adult wood is denser — even a
  tree's wood changes character with age.

# PART 12 — ENVIRONMENT & STRESS (how the tree responds)

## 12.1 Tropisms — growth toward or away

A **tropism** is a growth response whose direction is determined by a
stimulus (vs **nastic movements** — non-directional responses, §6.4):

- **Phototropism** — growth toward light (positive): shoots bend to
  the sun via **auxin** redistribution (auxin moves to the shaded
  side → that side elongates → the shoot bends toward light). The
  reason plants on windowsills lean.
- **Gravitropism (geotropism)** — growth relative to gravity:
  roots positive (down), shoots negative (up). The same mechanism:
  statoliths (§5.3) + auxin redistribution (root: auxin on the lower
  side INHIBITS growth there, so the root bends down; shoot: auxin
  on the lower side STIMULATES, so the shoot bends up — one hormone,
  opposite responses in the two organs).
- **Thigmotropism** — growth in response to touch/contact: tendrils
  coil around supports (the touched side stops elongating; the
  opposite side grows — the spring-coil grasp, §4.6.7/§6.5.1).
- **Hydrotropism** — growth toward moisture (roots).
- **Chemotropism** — growth toward/away from chemicals (pollen tubes
  grow toward ovule attractants; roots toward nutrients).
- **Heliotropism** — sun-tracking by daily turgor adjustments
  (sunflowers' bud tracking — though mature sunflower
  heads face east and stay).

**Nastic movements (recap):** nyctinasty (sleep folding — legumes),
seismonasty (the sensitive plant's collapse — turgor dump, §6.4).

## 12.2 Water stress — drought responses

- **Immediate:** stomata close (ABA — the stress hormone — orders the
  guard cells), transpiration falls, growth stops, leaves may wilt
  (turgor loss) then roll/cup.
- **Medium-term:** roots grow deeper (the taproot's payoff), leaves
  shed early (drought-deciduous), growth stops entirely — false rings
  (§7.2).
- **Long-term (xerophyte adaptations):** small/thick leaves, sunken
  stomata, hairs, wax; succulence (CAM, §6.5.8); deep taproots;
  deciduous drought strategy; seed dormancy timed to rain (desert
  annuals bloom after rain within weeks — the "rain response").
- **Embolism danger:** drought + freezing pull air into xylem pipes
  (embolism — the "straw with a bubble" failure); trees repair by
  root pressure (spring) or by growing new rings.

## 12.3 Temperature stress

- **Frost damage:** ice crystals puncture cells; young tissue dies
  (late frosts kill blossoms — the apple grower's terror); hardened
  winter tissue survives (dehydration + sugars, §9.2). **Chilling
  injury:** tropical plants damaged by mere cool (10–15°C).
- **Heat stress:** enzymes denature, transpiration spikes; heat
  damage shows as scorched margins; some plants tolerate via
  reflective hairs, leaf orientation (phyllodes' edge-on stance,
  §6.5.3), thick cuticles.
- **Freeze–thaw embolism:** repeated freeze-thaw in winter embolizes
  xylem; spring sap flow and new rings recover the system.

## 12.4 Light stress & shade adaptation

- **Sun leaves vs shade leaves** (§6.4): plasticity — the same tree
  makes different leaves in sun and shade.
- **Shade tolerance spectrum:** intolerant (pioneers — need full sun,
  die in shade) → tolerant (climax — can sit in deep shade for
  decades, §3.3). Shade leaves are large and thin (light-catching
  panels); the understory tree spends its early life as a
  "photovoltaic crawler."
- **Shade avoidance:** when shaded, stems stretch (etiolation-like),
  apical dominance strengthens — the plant reaches for light.
- **Sunscald:** sudden sun exposure on bark (after thinning/defoliation)
  kills cambium patches — the bark blisters and peels.

## 12.5 Other stresses

- **Salt (halophytes):** mangroves and salt marsh plants exclude
  salt at the roots, secrete it through salt glands, or store it in
  shed leaves. Salt tolerance = osmotic mastery.
- **Wind:** constant wind dwarfs trees (wind shearing — the flag
  trees of ridges), triggers reaction wood (§7.4), and blows trees
  over (windthrow — shallow roots + saturated soil = the classic
  stormfall).
- **Fire:** thick bark (fire armor), epicormic resprouting (buds
  under bark), serotiny (fire-released seeds, §1.4), root
  resprouting (aspen clones). Some ecosystems REQUIRE fire (prairie
  trees, Mediterranean scrub).
- **Flooding:** anaerobic soil suffocates roots (no oxygen);
  flood-adapted species build aerenchyma + pneumatophores
  (§5.6.6/§5.6.14) — the mangrove solution.
- **Herbivory:** thorns/spines/prickles (§4.6.8/§6.5.2), tannins and
  toxins (unpalatable leaves — oak tannins), induced defenses (some
  plants boost toxins when grazed), rapid regrowth.

## 12.6 The plasticity principle

Plants are **modular** and **plastic**: they cannot run or fight, so
they adapt by re-routing growth — the same genotype grows into wildly
different shapes in sun vs shade, wet vs dry, wind vs calm. **The same
tree in different conditions becomes a different-looking tree.**
(For the Life Tree: per-user growth variation is botanical realism —
identical seeds make different trees.)

# PART 13 — THE LIFE TREE BRIDGE (botany → engine)

> **Status:** this part maps botanical reality onto the Life Tree engine
> concepts. It is a RESEARCH FEED for the Life Tree design session —
> proposals, not locked decisions. The design session decides what
> locks. Every mapping cites the PART it comes from.

## 13.1 The botanical spine (the chronological contract)

The Life Tree's growth should follow the real botanical chronology
(Part 11.2), because the user's vision is botanical fidelity, not
decoration:

| Life stage | Botanical reality (Part) | Engine meaning (proposal) |
|---|---|---|
| SEED | Waiting state, dormancy, germination triggers (P1–2) | App start / first logged days: the tree is a seed; growth triggers = first consistent behaviors |
| SEEDLING | Establishment, roots first, slow visible growth (P3) | Early months: mostly invisible growth (foundation = the root system grows as habits/entries accumulate) |
| SAPLING | Fast height growth, strong apical dominance (P11.2) | Early years: fast growth, one strong "leader" (the dominant activity the user actually keeps up) |
| POLE → MATURE | Canopy rise, flowering begins (P11.2) | Multi-year: crown spreads, first flowers = first achievements |
| SENESCENT | Slow growth, crown dieback, resprouting (P11.2) | Long-term: growth plateaus, the tree keeps its history |

## 13.2 The organ map (domain → organ)

| Engine concept | Botanical organ | Botanical reality (Part) |
|---|---|---|
| Longevity / rings | **Trunk + annual rings** | Rings = years the cambium grew (P7.2) — the locked ring-per-qualifying-year concept is botanically literal |
| Domains (gym, journal, nutrition, habits…) | **Branches / crown architecture** | Branching rules (P4.5): monopodial vs sympodial, apical dominance — domains as branches, dominance = the user's focus |
| Entries / trophies / memories | **Leaves** | Leaves are many, replaceable, individual machines (P6) — the leaf-per-entry / leaf-as-memory model |
| Achievements | **Flowers** | Flowers appear only at maturity, only under the right cues (P10) — rare = special flowers, botanically correct |
| Nutrition input | **Vascular system (xylem/phloem)** | The sap network feeds EVERY organ (P8) — nutrition as the tree's throughput, wired by the user's directive |
| Yearly review artifacts | **Rings, cross-sections, time-lapse** | The transverse section IS the ring anatomy (P7); time-lapse = the growth record |
| Streaks / consistency | **Cambial activity / growth seasons** | The cambium grows in the growing season, dormant in winter (P7.2, P9) — consistency = growing season |

## 13.3 The two-engine law (the growth engine's core)

Height = primary growth (tips); girth = secondary growth (cambium)
(P11.5). These are SEPARATE engines on SEPARATE clocks. Proposal: the
Life Tree engine has two derived growth components —
**extension** (new leaves/branches/flowers — driven by volume of
activity: entries, completions, trophies) and **thickening** (ring
quality — driven by year-round consistency: the qualifying-year
rings). A user who logs a lot in bursts gets a tall, sparse tree; a
consistent user gets a dense, thick one. Both are botanically true.

## 13.4 Per-user variation (the plasticity principle)

Plants are plastic — the same seed becomes different trees in
different conditions (P12.6). Proposal: the engine's growth rules are
data-driven, so **variation is emergent**: a gym-heavy user's tree
branches differently from a journal-heavy user's because the data is
different (branch dominance P4.5, sink/source P8.2, stress responses
P12). No per-user design — just data → growth.

## 13.5 Seasonal behavior (the year's rhythm)

Botanical seasonality (P9) maps naturally onto the app's calendar
year: the tree's cambium "grows" in the user's active seasons and
rests in their dormant seasons; the ring forms at the year boundary;
leaf fall = the yearly review ("what dropped this year"); bud break =
the fresh start. Dormancy (P9.2) is the honest visual for low-activity
stretches — the tree does not die, it waits, like a real tree in
winter. (Deciduous realism: the bare silhouette reveals the true
structure — P9.5.)

## 13.6 Flowers, fruits, and rarity (the achievement language)

Flowers require maturity + the right cues (P10.7); fruits follow
flowers (P10.5); mast years are synchronized rarity (P1.6). Proposal:
achievements = flowers (common = common flowers, super-hard =
rare/special flowers), milestones = fruit-bearing (fruits as
completed goals), and mast-year logic = the rarest visual events.
The F-03 celebration ceremony language (deferred from the F-series)
lands here.

## 13.7 Explorable memory (leaves as content)

Leaves hold the tree's individual content (P6) — the user's vision:
tap a leaf → the entry/memory/picture in a smart UI. The leaf is the
right unit: many, individually meaningful, replaceable — and the
LEAF FALL of autumn (P9.5) gives the honest lifecycle of content:
entries that fall and are re-absorbed (nutrient resorption — the
review that recovers the lesson from the year).

## 13.8 Anti-farm defenses (the genetic inheritance)

The locked anti-farm + derived-only + facts-only rules inherit
botanical reality: growth is **derived from data, never input directly**
(the tree cannot be "cheated" — no fake growth, like no fake cambium);
volume-grid gaming (the farming lesson, R03) is defeated by the
derived-only engine (P13.3) — you cannot paint rings; rings are grown.
The L-10 stress-testing discipline applies to the growth engine with
seeded data (the user directive, verbatim).

## 13.9 What the tree is NOT (botanical honesty)

- Not a growth bar: growth is emergent, not a progress meter.
- Not perfect: real trees have scars, reaction wood, missing rings,
  false rings (P7.2) — the honest tree records bad years too
  (narrow rings = the missed streak, honestly shown).
- Not always green: deciduous realism (P9.4) — the tree rests, and
  the rest is part of the story.

---

# GLOSSARY — every term, one line each

- **ABA (abscisic acid)** — the stress/dormancy hormone: closes stomata, keeps seeds dormant.
- **Abscission** — controlled shedding of leaves/fruit at a weak seam (abscission zone).
- **Achene** — one-seeded dry fruit with seed coat free from fruit wall (sunflower, strawberry specks).
- **Actinomorphic** — radially symmetric flower (star-like).
- **Adventitious buds** - buds arising anywhere unexpected (stems, roots, leaf edges).
- **Adventitious root** — root arising from a non-root organ (ivy's stem roots, cuttings).
- **Aerenchyma** — air-channel tissue allowing oxygen transport in waterlogged plants.
- **After-ripening** - dry-storage time that ends physiological dormancy.
- **Aggregate fruit (etaerio)** - many ovaries of ONE flower ripening together (raspberry, magnolia).
- **Albuminous** — seed keeping endosperm at maturity (tomato).
- **Allelopathy** — chemical suppression of neighboring plants by root exudates (walnut).
- **Alternating temperatures** - daily warm/cool fluctuation promoting germination.
- **Amphistomatous** - stomata on both leaf sides.
- **Amphitropous** - half-inverted ovule.
- **Anatropous** - the standard inverted ovule (bean).
- **Androecium** - the male whorl: all stamens of a flower.
- **Anemophily** — wind pollination.
- **Annual** — plant completing its whole life in one year.
- **Annulated** - ringed root swellings (ipecac).
- **Anther** — the pollen box at the stamen tip.
- **Anthesis** - the flower opening.
- **Anthocyanin** — red/purple pigment made in autumn leaves.
- **Apical dominance** — the terminal bud's auxin suppressing side buds below.
- **Apical meristem** — the dividing zone at every shoot/root tip (primary growth).
- **Apocarpous** - carpels free, not fused (buttercup).
- **Apomixis** — seed production without fertilization (clonal seeds — dandelion).
- **Apoplast** - the water path between cells (through walls), vs the symplast through cells.
- **Arbuscular mycorrhiza** — fungus entering root cells, exchanging phosphorus for sugar.
- **Arbuscules** - the tree-shaped fungus-in-root exchange structures of AM mycorrhizae.
- **Areole** - the cactus dimple: a modified axillary bud bearing spines.
- **Auxin** - the master growth hormone: apical dominance, phototropism, cambium wake-up.
- **Axillary bud** — bud in the leaf axil; can become a branch, flower, or thorn.
- **Banyan** - the fig whose aerial roots become new trunks (one-tree forest).
- **BBCH scale** - the 00-99 coded scientific phenology calendar.
- **Berry** — fleshy fruit with seeds in pulp, no stone (tomato, grape).
- **Biennial** — two-year life: store year one, flower year two (carrot, foxglove).
- **Bipinnate** - compound leaf divided twice (honey locust).
- **Blade (lamina)** — the flat part of a leaf.
- **Bract** — modified leaf near flowers (poinsettia's red "petals").
- **Bud scale scars** - the annual scar rings letting you age a twig.
- **Bud scale** — protective modified leaf wrapping a dormant bud.
- **Budburst** - the spring bud opening, stage by stage.
- **Bulb** — short stem (basal plate) + fleshy storage leaves (onion).
- **Bulbils / offsets** - detachable storage shoots; clonal propagation (tiger lily, aloe pups).
- **Bundle scars** - the cut vascular-vein dots inside a leaf scar.
- **Bundle sheath** - the collar of cells wrapping a leaf vein.
- **Buttress roots** - the flying-buttress wings bracing shallow-soil giants.
- **Buzz pollination** - bees vibrating poricidal anthers to shake out pollen.
- **Calyx** — the sepal ring.
- **CAM (Crassulacean Acid Metabolism)** - night-stomata photosynthesis; the succulent canteen strategy.
- **Cambium (vascular)** — the dividing ring producing wood inward, phloem outward — all girth.
- **Camptodromous** - leaf veins looping before the margin (dogwood).
- **Campylotropous** - curved ovule (mustard).
- **Capitulum** — condensed raceme on a flat receptacle: the daisy/sunflower head.
- **Capsule** — multi-carpel dehiscent fruit opening by pores/seams/lid.
- **Cardinal temperature** - a species minimum/optimum/maximum for germination.
- **Carotenoids** - orange/yellow pigments revealed in autumn leaves.
- **Carpel** — the female unit: stigma + style + ovary.
- **Caryopsis** — grass grain: seed fused to pericarp (wheat).
- **Casparian strip** — the waterproof gate in the root endodermis filtering what enters.
- **Catch leaves** - the sticky leaf trap of sundews and butterworts.
- **Catkin** — drooping unisexual wind-pollinated flower cluster (willow, oak).
- **Caudex** — swollen stem base water tank (baobab).
- **Chalaza** — base point of the ovule/seed.
- **Chemotropism** - growth toward/away from chemicals (pollen tubes, roots).
- **Chill hours** - cold hours a species must accumulate (apple 400-1,200).
- **Chilling injury** - damage from mere cool (10-15 C) in tropical plants.
- **Chilling requirement** — cold hours a bud must accumulate before it can wake.
- **Chiropterophily** - bat pollination (baobab).
- **Chlorenchyma** — green photosynthetic tissue.
- **Chlorophyll** — the green photosynthesis pigment.
- **Cincinnus** - a tight helicoid cyme with short stalks (dayflower).
- **Circumscissile (pyxis)** - capsule opening by a lid (plantain).
- **Cladode** — flattened green leaf-like stem doing photosynthesis (prickly pear pad).
- **Cleistogamy** — flowers that never open; self-pollinate in the bud.
- **Climacteric** - fruit ripening in a post-harvest ethylene burst (banana, apple).
- **Cohesion–tension** — evaporation pulling water up xylem as one tensioned column.
- **Cold hardiness** - the winter dehydration+sugar state that survives freezing.
- **Collenchyma** — flexible support tissue (celery strings).
- **Columella** - the root cap central column sensing gravity.
- **Companion cell** — support cell keeping a sieve tube alive.
- **Compound corymb** - corymb of corymbs (hawthorn, yarrow).
- **Compound leaf** — leaf divided into leaflets (ash, walnut).
- **Compression wood** - conifer reaction wood on the lower side (pushing).
- **Contractile roots** - roots that shorten, pulling the plant down (bulbs).
- **Cork cambium (phellogen)** — outer meristem producing cork (periderm).
- **Corm** — solid vertical storage stem (gladiolus).
- **Corolla** — the petal ring.
- **Cortex** — the rind between skin and vascular ring.
- **Corymb** - flat-topped raceme: lower stalks longer (candytuft, hawthorn).
- **Cotyledon** — seed leaf; dicots have two.
- **Craspedodromous** - leaf veins running straight to the margin (elm, oak).
- **Critical day length** - the species day/night threshold for flowering.
- **Crown** — the whole branch/leaf canopy of a tree.
- **Cupule** — the cup around a nut (acorn cap).
- **Current annual increment** - this year growth, vs the mean over life.
- **Cuticle** — the waxy waterproof leaf/stem film.
- **Cyathium** — Euphorbia's cup-shaped pseudanthium of many tiny flowers.
- **Cyme** — determinate inflorescence (oldest flower at tip/center).
- **Cymose** - determinate inflorescence: oldest flower at tip/center.
- **Cypsela** — achene-like Asteraceae fruit from an inferior ovary.
- **Damping-off** — fungal rot killing seedlings at soil level.
- **Day-neutral plant** - ignores day length (tomato, dandelion).
- **Deciduous** — dropping all leaves for a season.
- **Decompound** - leaf divided three or more times (carrot, yarrow).
- **Decurrent** - crown with the leader lost, broad rounded head (elm, maple).
- **Decussate** - opposite leaf pairs at right angles (mint family).
- **Dehiscence** — opening to release seeds (dehiscent vs indehiscent fruits).
- **Delayed foliation** - late uneven leaf-out after a failed chilling winter.
- **Dendrochronology** - reading tree rings as records.
- **Denticidal** - capsule opening by teeth at the top.
- **Determinate shoot** - a shoot with a pre-set node count ending in a flower/bud.
- **Diarch / triarch / tetrarch** - root xylem stars with 2/3/4 arms.
- **Dichasium** - two-branch cyme, oldest flower in the fork (chickweed).
- **Dichogamy** — male/female parts maturing at different times.
- **Dichotomous key** - the two-choice identification ladder.
- **Dichotomous** — tip splitting into two equal forks.
- **Dicot (eudicot)** — flowering plant with two cotyledons, ringed vascular bundles, net-veined leaves, taproots.
- **Diffuse-porous** - wood with uniform vessels (maple, birch) - subtle rings.
- **Dioecious** — male and female flowers on separate plants (willow, holly).
- **Disk floret** - the inner tubular flower of a head (sunflower center).
- **Distichous** - alternate leaves all in one plane (elm).
- **Dormancy** — arrested growth: seed dormancy, bud dormancy, cambial dormancy.
- **Double fertilization** - sperm + egg = embryo, sperm + central cell = endosperm.
- **Drupe** — stone fruit: hard pit inside flesh (peach, cherry).
- **Earlywood (springwood)** - wide thin-walled spring vessels; the light ring part.
- **Ecodormancy** - dormancy from external blocks (still frozen, too dry).
- **Ectomycorrhiza** — fungus sheathing root tips (oaks, beeches; the mushroom partner).
- **Elaiosome** — fatty seed attachment ants carry (myrmecochory).
- **Emarginate** - leaf apex notched.
- **Embolism** — air bubble breaking a xylem water column.
- **Embryo sac** - the ovule female gamete chamber (egg + support cells).
- **Embryo** — the baby plant in the seed (radicle, plumule, cotyledons).
- **Endocarp** - the innermost fruit-wall layer (the pit of a drupe).
- **Endodermis** — inner root ring with the Casparian strip gate.
- **Endodormancy** - the bud's own winter rest needing chilling.
- **Endosperm** — seed food tissue from double fertilization.
- **Entomophily** - insect pollination.
- **Epicormic shoot** — dormant bud erupting from trunk/branch bark after damage.
- **Epicotyl** — embryonic stem above the cotyledons.
- **Epicuticular wax** - the surface wax bloom (plums, grapes).
- **Epidermis** - the plant outer skin layer.
- **Epigeal germination** — cotyledons carried above ground (bean, sunflower).
- **Epigynous** — ovary below the other whorls ("inferior" — apple).
- **Establishment bottleneck** - the seedling death gauntlet.
- **Ethylene** — the ripening/fruit-abscission hormone.
- **Etiolation** — pale elongated shade growth; reversed by light (de-etiolation).
- **Evergreen** — keeping leaves year-round.
- **Exalbuminous** — seed with endosperm absorbed into cotyledons (bean).
- **Exarch** - root xylem maturing outward.
- **Excurrent** - one central leader to the top (oak, beech).
- **Exocarp** - the outermost fruit-wall layer (the skin).
- **False rings** - extra ring boundaries from mid-season stress.
- **Fascicle** — tight flower cluster from one axil.
- **Fasciculated** - clustered tuberous root fingers (dahlia, asparagus).
- **Fibers** - long strong support cells in wood.
- **Fibrous root system** — mat of equal roots (grasses; old beech).
- **Filament** - the stamen stalk.
- **Floral diagram** - schematic cross-section of a flower.
- **Floral formula** — shorthand of a flower's parts (K5 C5 A∞ G(5)).
- **Florigen (FT)** - the leaf-made flowering signal shipped to the shoot tip.
- **Flower** — a compressed modified reproductive shoot.
- **Foliage leaves** - the standard green photosynthetic leaf.
- **Follicle** — one-carpel fruit opening along one seam (milkweed).
- **Frankia** - the nitrogen-fixing bacterium of alder and sea buckthorn.
- **Fruit set** - the ovary committing to grow into fruit.
- **Fruit spurs** - short stubby branchlets bearing flowers/fruit (apple).
- **Fruit** — the mature ovary with its seeds.
- **Fusiform initial** — cambium cell producing wood/phloem axial pipes.
- **Geitonogamy** — pollination between flowers of the same plant.
- **Gibberellins (GA)** - germination/growth hormones; the dormancy-breakers.
- **Globular stage** - the ball-shaped early embryo.
- **Glomerule** — dense cluster of sessile flowers.
- **Golden angle** (~137.5) - the leaf-spiral angle maximizing light.
- **Graft (root)** - neighboring tree roots fusing (intraspecific grafting).
- **Grain** - the ring/ray/vessel pattern of wood in section; named types: straight, spiral, interlocked, wavy, bird's-eye.
- **Gravitropism** — growth relative to gravity (roots down, shoots up).
- **Growing degree days** — accumulated warmth predicting spring events.
- **Guard cells** — the pair of cells opening/closing a stoma.
- **Guttation** — dew drops pushed out of leaf pores by root pressure.
- **Gynoecium** - the female whorl: all carpels of a flower.
- **Halophytes** - salt-tolerant plants (mangroves).
- **Hardwood** - angiosperm (dicot) wood - oak, maple (name is about flower type, not hardness).
- **Hartig net** - the fungus-between-cells exchange surface of ectomycorrhizae.
- **Haustorium** — parasite's root syringe into the host (dodder, mistletoe).
- **Heart-shaped root system** - shallow spreading dicot roots (beech).
- **Heartwood** — dead plugged inner wood (dark, rot-resistant).
- **Helicoid cyme (bostryx)** - one-sided coiled cyme (forget-me-not).
- **Helicoid cyme** — one-sided coiled cyme (forget-me-not).
- **Heliotropism** — sun-tracking movement.
- **Hemiparasite** - parasite that still photosynthesizes (mistletoe).
- **Herkogamy** — physical separation of anthers and stigma.
- **Hesperidium** — citrus berry with leathery rind and juice sacs.
- **Heteroblasty** — form changing with age (eucalyptus, ivy).
- **Heterophylly** - different leaf forms on one plant (juvenile/adult, sun/shade).
- **Hilum** — the seed's attachment scar.
- **Holoparasite** — parasite with no chlorophyll, stealing everything (dodder).
- **Homolog** - same evolutionary origin (all leaf modifications are homologs of the leaf).
- **Hydrophily** — water pollination.
- **Hydrotropism** — growth toward moisture.
- **Hypanthium** - the fused floral cup (cherry, apple flesh, rose hip).
- **Hypanthodium** — the fig's hollow urn inflorescence (syconium).
- **Hypocotyl hook** - the bent elbow pulling cotyledons through soil.
- **Hypocotyl** — embryonic stem below the cotyledons.
- **Hypogeal germination** — cotyledons staying underground (pea, oak).
- **Hypogynous** — ovary above the other whorls ("superior").
- **Hypostomatous** — stomata only on the leaf underside.
- **Imbibition** — the seed's water-soaking first step of germination.
- **Inflorescence** — the arrangement of flowers on a stem.
- **Integuments** — ovule layers becoming the seed coat.
- **Intercalary meristem** - node-based meristem; mostly grasses, absent in dicots.
- **Interfascicular cambium** - new cambium joining bundles into a ring.
- **Intermediate seeds** - tolerate partial drying (some citrus, coffee).
- **Internode** — stem segment between nodes.
- **Involucre** — the bract cup under a head/umbel.
- **Iteroparous** - repeated reproduction across years (polycarpic).
- **Janzen-Connell effect** - seedlings under their parent die disproportionately.
- **June drop** - trees shedding excess fruit early.
- **Juvenility** - the pre-flowering juvenile phase of a tree.
- **Karrikin** — smoke chemical triggering germination in fire floras.
- **Knee roots** - mangrove snorkel roots rising in a knee bend.
- **Lateral meristem** - the cambia: thickening growth (vascular + cork).
- **Lateral root** — root branching from the pericycle of another root.
- **Latewood** — dense summer wood; dark ring part.
- **Leaf flush** - the burst of new leaves (spring flush, monsoon flush).
- **Leaf scar** - the scar left when a leaf falls.
- **Leaflet** — one division of a compound leaf.
- **Leghemoglobin** - the pink oxygen buffer in active nitrogen-fixing nodules.
- **Legume** — two-seam one-carpel pod (pea, bean).
- **Lenticel** — breathing pore through bark.
- **Locule** - an ovary chamber.
- **Loculicidal** - capsule opening down each chamber middle (cotton).
- **Loment** — legume fruit breaking into segments.
- **Long-day plant** - flowers when days grow long (spinach, most grains).
- **Marcescence** - holding dead leaves through winter (beech, some oaks).
- **Mast year** — synchronized bumper seed year (oak).
- **Mean annual increment** - total growth divided by age.
- **Medullary ray** — radial storage line through stem/wood.
- **Mericarp** - one one-seeded segment of a schizocarp.
- **Meristem** — the plant's permanent dividing-cell growth zone.
- **Mesocarp** - the middle fruit-wall layer (the flesh of a drupe).
- **Micropyle** — the seed pore where water enters.
- **Missing rings** - a year the cambium did not grow (severe stress).
- **Moniliform** - beaded root swellings, necklace-like.
- **Monocarpic** — blooming once then dying (agave).
- **Monochasium** — one-branch-per-node cyme chain.
- **Monoecious** — both flower sexes on one plant (oak).
- **Monopodial** — one dominant leader for life (oak).
- **Mycorrhiza** — the root–fungus partnership feeding most plants.
- **Myrmecochory** — ant-mediated seed dispersal.
- **Nastic movement** — non-directional response (sleep folding, touch collapse).
- **Nitrate** - a germination cue signaling food-rich soil.
- **Node** — leaf attachment point; the stem's joint.
- **Nodulose** - knobby root swellings, rosary-like.
- **Non-climacteric** - fruit ripening only on the plant (citrus, grape).
- **Nucellus** — ovule food tissue.
- **Nut** — hard one-seeded indehiscent fruit with cupule (acorn).
- **Nutlet** - small hard one-seeded fruit (mint/borage four nutlets).
- **Nyctinasty** — sleep movements (legume folding at night).
- **Oblique base** - asymmetric leaf base (elm).
- **Odd/even-pinnate** - compound leaf with/without a terminal leaflet.
- **Open collateral bundle** - xylem + phloem + cambium in one dicot bundle.
- **Operculum** — pitcher lid / capsule lid.
- **Ornithophily** - bird pollination.
- **Orthodox seeds** - seeds that tolerate drying and cold storage.
- **Orthotropous** - straight ovule (pepper).
- **Osmosis** - water moving toward higher solute concentration.
- **Ostiole** — the fig's top opening.
- **Ovary** — the carpel's base holding ovules; becomes the fruit.
- **Ovule** — the structure becoming the seed.
- **Palisade mesophyll** — the dense green photosynthesis columns.
- **Panicle** — branched (compound) raceme.
- **Pappus** - the parachute bristles on achenes/cypselas (dandelion).
- **Paradormancy** - suppression by a neighbor organ (apical dominance).
- **Parenchyma** — the plant's general-purpose storage/filler cells.
- **Parthenocarpy** - seedless fruit without fertilization (banana).
- **Pedicel** — a flower's stalk.
- **Peduncle** - the main inflorescence stalk.
- **Peloton** - the fungal coil inside orchid root cells.
- **Pepo** — hard-rind berry from inferior ovary (cucumber, melon).
- **Perennial** — plant living many years.
- **Perianth** — calyx + corolla together (tepals when uniform).
- **Pericarp** — the fruit wall (the ovary wall).
- **Pericycle** — root ring that produces lateral roots.
- **Periderm** — cork + cork cambium + phelloderm (bark's growth skin).
- **Perigynous** — ovary in a cup of fused floral bases (cherry).
- **Perisperm** - nucellus-derived seed food (beet, black pepper).
- **Petals** - the showy pollinator-advertisement whorl (the corolla).
- **Petiole** — the leaf stalk.
- **Petiolule** - the stalk of a single leaflet.
- **Pfr / Pr** - the phytochrome day/night-measuring forms.
- **Phellem** — cork cells.
- **Phelloderm** — inner periderm cells.
- **Phenology** — the timing of plant life events through the year.
- **Phloem** — living sugar pipes (inner bark).
- **Photoblastic** — germinating in response to light (or its absence).
- **Photomorphogenesis** - light-grown form (vs skotomorphogenesis).
- **Photoperiodism** — response to day/night length.
- **Photosynthesis** — light + CO₂ + water → sugar.
- **Phototropism** — growth toward light.
- **Phylloclade** — flattened photosynthetic stem (see cladode).
- **Phyllode** — flattened leaf-like petiole (acacia).
- **Phyllotaxy** — leaf arrangement (alternate/opposite/whorled/spiral).
- **Phytochrome** — the day-length-measuring pigment.
- **Pistil** - the female organ: stigma + style + ovary (one or more carpels).
- **Pith** — the stem's soft center.
- **Placenta** - the ovary tissue bearing ovules.
- **Plasmodesmata** - cytoplasmic bridges linking plant cells.
- **Plumular hook** - the bent elbow protecting the emerging plumule.
- **Plumule** — the embryonic shoot.
- **Pneumathode** — aeration pore patch on roots.
- **Pneumatophore** — mangrove snorkel root.
- **Pollen tube** — the pollen's growth down the style.
- **Pollen** — the male gametophyte (sperm carrier).
- **Pollination** - pollen transfer from anther to stigma.
- **Polyarch** - root xylem star with many arms.
- **Polycarpic** - flowering repeatedly across years (most trees).
- **Polychasium** — many-branch cyme (elder, euphorbia).
- **Polyembryony** - several embryos in one seed (citrus).
- **Polygamous** - mixed perfect and unisexual flowers (ash, maple).
- **Pome** — apple-type fruit: hypanthium flesh + papery core.
- **Poricidal** - capsule opening by pores (poppy).
- **Pressure flow** - the phloem source-to-sink sugar conveyor.
- **Prickle** — superficial skin outgrowth (rose) — NOT a thorn.
- **Primary growth** — lengthening at the tips (apical meristems).
- **Primordia** - the first tiny bumps of new organs.
- **Proembryo** - the first cell mass of the embryo.
- **Protandry / protogyny** — stamens/stigma maturing first.
- **Pseudanthium** — a many-flowered structure looking like one flower.
- **Pseudobulb** — orchid's thickened aerial stem segment.
- **Pseudocopulation** - Ophrys orchids faking female bees.
- **Pulvinus** - the motor-cell joint folding leaves.
- **Quiescence** - shallow dormancy from bad conditions (vs deep dormancy).
- **Raceme** — unbranched stalked-flower inflorescence.
- **Racemose** - indeterminate inflorescence: flowers open base-to-tip.
- **Rachis** - the mid-stalk of a compound leaf (or inflorescence axis).
- **Radicle** — the embryonic root.
- **Raphe** — seed-coat ridge marking the fused stalk.
- **Ray (medullary)** — radial storage line in wood; ray initials make it.
- **Ray floret** — the strap-shaped outer flower of a head (daisy "petal").
- **Recalcitrant seed** — seed that dies if dried (acorn).
- **Receptacle (torus)** - the flower-stalk tip the whorls attach to.
- **Replum** - the false partition frame of a silique.
- **Resorption** — autumn nutrient recovery from leaves into the tree.
- **Rhizobium** - the legume nodule nitrogen-fixing bacterium.
- **Rhizome** — horizontal underground storage stem (ginger, iris).
- **Rhizosphere** - the microbe-rich soil zone managed by root exudates.
- **Rhytidome** — the accumulated visible bark.
- **Ring (annual)** — one year's wood: earlywood + latewood + boundary.
- **Ring-porous** - wood with huge earlywood vessels (oak, ash) - bold rings.
- **Root cap** — the tip protector + gravity sensor.
- **Root exudates** - chemicals roots secrete (allelopathy, microbial management).
- **Root flare** - the trunk widening at the soil line.
- **Root hair** — epidermal tube multiplying absorption surface.
- **Root pressure** — osmotic push from roots (spring sap).
- **Root suckers** - shoots arising from root buds (aspen, dandelion).
- **Rosette** - a tight ground-level leaf spiral (dandelion).
- **Samara** — winged achene (maple key).
- **Sapling** - the fast-growth post-seedling tree stage.
- **Sapwood** — living outer wood (water pipes + storage).
- **Scale leaves** - small non-green protective leaves (rhizomes, parasites).
- **Scarification** — breaking a hard seed coat.
- **Scatter-hoarder** - a caching disperser that forgets seeds (jays).
- **Schizocarp** — fruit splitting into one-seeded mericarps (carrot).
- **Sclerenchyma / sclereids** - hard support cells (fiber, grit).
- **Sclerophyll** — hardened leathery evergreen leaf.
- **Scorpioid cyme** — zigzag cyme alternating sides (comfrey).
- **Secondary growth** — thickening by the cambia.
- **Seed bank** - viable seeds waiting in soil, germinating in waves.
- **Seed coat (testa)** — the seed's protective skin.
- **Seedling** — the plant's first establishment phase.
- **Seismonasty** — touch-triggered collapse (sensitive plant).
- **Self-incompatibility** — biochemical rejection of own pollen.
- **Semelparous** - one colossal bloom then death (monocarpic).
- **Semi-ring-porous** - wood between ring- and diffuse-porous (walnut).
- **Senescence** — the aging/decline phase.
- **Sepal** — the outer protective flower leaf.
- **Septicidal** - capsule opening along the partitions (foxglove).
- **Serotiny** — fire-released seeds.
- **Sessile** — stalkless.
- **Shade avoidance** - stretching for light in shade.
- **Short-day plant** - flowers when nights grow long (chrysanthemum, poinsettia).
- **Sieve plates** - the perforated end walls between sieve tubes.
- **Sieve tube** — living sugar-pipe cell; enucleate, with companion cell.
- **Silique / silicle** — mustard-family pod with replum.
- **Simple leaf** - one blade, not divided.
- **Sink / source** — where sugars are used / made (phloem flow logic).
- **Skotomorphogenesis** - dark-grown etiolated form.
- **Snag** - a standing dead tree, still habitat.
- **Snap traps** - the Venus flytrap fast-closing leaf.
- **Softwood** - gymnosperm (conifer) wood - pine, spruce (name is about flower type, not hardness).
- **Sorosis** - multiple fruit from a fused fleshy spike (pineapple, mulberry).
- **Spadix** — fleshy flower spike in a spathe (arum).
- **Spathe** — the hooded bract around a spadix.
- **Spike** — stalkless-flower raceme.
- **Spikelet** — grass's tiny spike unit.
- **Spine** — a MODIFIED LEAF/leaf part, sharp (barberry, cactus).
- **Spine-tipped** - leaf tips hardened into spines (holly, agave).
- **Spongy mesophyll** — loose airy leaf layer for gas exchange.
- **Stamen** — filament + anther (male organ).
- **Starch sheath** - the starch-filled inner-cortex jacket.
- **Statolith** — starch grain sensing gravity.
- **Stele** — the root's central vascular cylinder.
- **Stigma** — the pollen-catching surface.
- **Stipule** — small appendage at the leaf base.
- **Stolon** — horizontal above-ground runner rooting at nodes (strawberry).
- **Stoma** — breathing pore flanked by guard cells.
- **Stratification** — cold-moist treatment breaking seed dormancy.
- **Strophiole (lens)** - the water-gap bump on hard seed coats.
- **Style** — the stigma's neck.
- **Subsidiary cells** - the guard cell supporting neighbors.
- **Succession** — staged community replacement (field → forest).
- **Succulent stem** - fleshy water-storing photosynthetic stem (cactus).
- **Sunscald** - bark/cambium killed by sudden sun exposure.
- **Supercooling** - cell fluids staying liquid below freezing - safe freezing.
- **Syconium** — the fig inflorescence/fruit.
- **Symplast** - the water path through cells via plasmodesmata.
- **Sympodial** — leader replaced yearly by a side bud (elm).
- **Syncarpous** - carpels fused (tomato, apple).
- **Taproot** — the dominant primary root (carrot, oak).
- **Tegmen** — inner seed-coat layer.
- **Tendril** — coiling climber: leaf (pea) or stem (grape) derived.
- **Tension wood** - dicot reaction wood on the upper side (pulling).
- **Tepal** — sepal-like petal (magnolia).
- **Terminal (apical) bud** - the shoot-tip bud driving extension.
- **Testa** — the seed coat.
- **Thermoinhibition** - seeds refusing to germinate in hot soil.
- **Thermonasty / photonasty** - folding in response to temperature/light.
- **Thigmotropism** — growth in response to touch.
- **Thorn** — a MODIFIED STEM, sharp (hawthorn, citrus) — not a prickle.
- **Thyrse** — racemose axis with cymose branches (lilac, grape).
- **Torpedo stage** - the elongated late embryo (radicle and plumule visible).
- **Tracheid** — long overlapping water pipe (conifers' only pipe).
- **Transpiration** — evaporative water loss from leaves.
- **Trichomes** - tiny leaf/stem hairs.
- **Trifoliolate** - three leaflets (clover, poison ivy).
- **Tropism** - directional growth toward/away from a stimulus.
- **Tuber** — swollen storage organ: stem tuber (potato, has eyes) vs root tuber (sweet potato, none).
- **Tunic** - the papery dead-scale wrapper of a tunicate bulb (onion).
- **Turgor** - cell water pressure; drives movements and wilting.
- **Tylose** — plug blocking an old vessel (heartwood formation).
- **Umbel** — umbrella inflorescence of equal stalks from one point.
- **Utricle** — tiny bladder achene (beet, dock).
- **Valvate** - capsule opening by hinged valves (eucalyptus).
- **Veinlets** - the leaf fine vein branches.
- **Velamen** — orchid aerial root's spongy water-wicking skin.
- **Venation** - leaf vein arrangement (pinnate/palmate/reticulate).
- **Vernalization** — cold requirement for flowering.
- **Verticillaster** — mint-family's false whorls of cymes.
- **Vesicles (AM)** - the arbuscular mycorrhizal fungus's fatty storage sacs in the root.
- **Vessel element** — dicot's short wide water pipe.
- **Viscin** - mistletoe seed glue.
- **Vivipary** - germinating while still attached (mangrove propagules).
- **Water gap (lens/strophiole)** - the one weak door in a hard seed coat.
- **Water sprout** — vigorous vertical shoot from trunk buds (stress response).
- **Water-storage roots** - root canteens of desert perennials (Pachypodium).
- **Windthrow** - a tree blown over.
- **Xenogamy** — cross-pollination.
- **Xerophyte** — drought-adapted plant.
- **Xylem** — dead water pipes (the wood).
- **Zygomorphic** — bilaterally symmetric flower (pea, mint).

---
# COVERAGE CHECKLIST (the audit contract)

> Every row below is a coverage guarantee of this document. The audit
> pass (2026-08-29) verifies each row against the text; future edits
> must keep every row satisfied. Rows map to Parts.

| # | Coverage | Part |
|---|---|---|
| 1 | Seed structure: coat, hilum, micropyle, raphe, chalaza, embryo (radicle/plumule/hypocotyl/epicotyl/cotyledons), endosperm, albuminous/exalbuminous | 1.2 |
| 2 | Seed origins: ovule, integuments, nucellus, embryo sac, double fertilization, apomixis, polyembryony | 1.3 |
| 3 | ALL dormancy classes (Baskin & Baskin): physical, physiological, morphological, morphophysiological, combinational; stratification, scarification, ABA/GA, after-ripening, quiescence, seed banks, serotiny, viability records | 1.4 |
| 4 | ALL germination triggers: imbibition, temperature/cardinal temps, thermoinhibition, alternating temperatures, light/photoblasty, oxygen, nitrate/ethylene/CO2, karrikins, fruit-pulp inhibitors, seasonal-timing classes; orthodox vs recalcitrant vs intermediate | 1.5 |
| 5 | Special seeds: samara, fleshy-fruit seeds, wind/burred, masting, predation | 1.6 |
| 6 | Germination step-by-step: radicle, hypocotyl hook, epigeal vs hypogeal, etiolation/de-etiolation, true leaves | 2.1 |
| 7 | Germination timelines (bean/oak/maple/tomato); establishment bottleneck | 2.2–2.3 |
| 8 | Seedling: heteroblasty (eucalyptus/acacia/ivy), root-first rule, mortality (damping-off, Janzen–Connell), seedling banks | 3.1–3.4 |
| 9 | Meristems: apical (SAM/RAM), lateral (cambia), intercalary; the two-engine model | 4.1 |
| 10 | Dicot primary stem anatomy: epidermis, cuticle, cortex, collenchyma, chlorenchyma, vascular ring (open collateral bundles), pith, medullary rays | 4.2 |
| 11 | Nodes, internodes, buds, leaf scars, bud-scale scars, lenticels, bud scales | 4.3 |
| 12 | Phyllotaxy: alternate, opposite, whorled, distichous, decussate, golden angle | 4.4 |
| 13 | Branching: apical dominance/auxin, monopodial, sympodial, dichotomous, crown architecture, epicormic shoots, water sprouts, fruit spurs | 4.5 |
| 14 | ALL stem modifications: rhizome, stolon/runner, stem tuber, corm, bulb, cladode/phylloclade, stem tendril, thorn, succulent stem, caudex, pseudobulb, general storage, bulbils/offsets | 4.6 |
| 15 | Root functions; taproot/fibrous/adventitious systems | 5.1–5.2 |
| 16 | Root anatomy: cap, statoliths, meristem/elongation/maturation zones, root hairs, cortex, endodermis/Casparian strip, pericycle, stele | 5.3 |
| 17 | Root feeding: osmosis, root pressure, mycorrhizae (arbuscular/ecto), nitrogen fixation (Rhizobium/Frankia/cyanobacteria), wood wide web | 5.4 |
| 18 | Secondary growth in roots; root rings; root flare | 5.5 |
| 19 | ALL root modifications: storage taproots, tuberous (fasciculated/annulated/moniliform/nodulose), aerial/velamen, prop/stilt, buttress, pneumatophores, knee, clinging, contractile, haustoria (holo/hemi), suckers/Pando, nodules, mycorrhizal, pneumathodes, water-storage, assimilatory, floating | 5.6 |
| 20 | Root behavior: gravitropism, hydrotropism, exudates, allelopathy, architecture, seasonal roots | 5.7 |
| 21 | Leaf anatomy: blade, petiole, stipules, cuticle, palisade/spongy mesophyll, stomata/guard cells, hypostomatous/amphistomatous, veins, midrib | 6.2 |
| 22 | Transpiration; cohesion-tension; guttation | 6.2/8.3 |
| 23 | Leaf morphology: simple/compound (pinnate/palmate/trifoliolate/bipinnate), venation, margins, shapes, apexes, bases | 6.3 |
| 24 | Leaf development: primordia, heterophylly (juvenile/adult, sun/shade, water/air) | 6.4 |
| 25 | Leaf movements: nyctinasty, heliotropism, seismonasty | 6.4 |
| 26 | ALL leaf modifications: tendrils, spines, phyllodes, pitcher, bladder, sticky, snap, storage/CAM, bulb scales, bracts, bud scales, cotyledons, scale leaves, foliage, catch leaves, spine-tipped | 6.5 |
| 27 | Secondary growth: cambium formation (fascicular+interfascicular), fusiform/ray initials, spring/autumn wood, rings, ring-porous vs diffuse-porous, false/missing rings | 7.1–7.2 |
| 28 | Wood: sapwood, heartwood, tyloses, living-wood rule, hardwood/softwood meanings, grain, rays | 7.3 |
| 29 | Reaction wood: tension/compression | 7.4 |
| 30 | Bark: periderm, phellem, phelloderm, lenticels, rhytidome, bark types, bark as defense | 7.5 |
| 31 | Trunk layer stack outside→inside | 7.6 |
| 32 | Growth patterns: indeterminate, seasonal cambium activity, twig-mirrors-trunk | 7.7 |
| 33 | Vascular system: xylem (vessels/tracheids/fibers), phloem (sieve tubes/companion cells), directions, master map | 8.1 |
| 34 | Sap: xylem sap, phloem sap, pressure flow, sinks vs sources | 8.2 |
| 35 | Cohesion-tension theory; embolism; root pressure | 8.3 |
| 36 | Phenology: growing degree days, altitude lapse rate, photoperiod, chilling requirement + chill-hour values, BBCH scale, budburst stages, delayed foliation, false springs | 9.1 |
| 37 | Dormancy types: para/endo/ecodormancy; cambial dormancy; cold hardiness, supercooling | 9.2 |
| 38 | Photoperiodism: short-day/long-day/day-neutral, critical day length, vernalization | 9.3 |
| 39 | Evergreen vs deciduous vs semi/drought-deciduous vs marcescent; leaf economics; flush patterns | 9.4 |
| 40 | The four seasons month-by-month: spring (budburst, bloom-before-leaf, earlywood, root flush), summer (canopy, latewood, drought), autumn (fruit, color, resorption, abscission), winter (dormancy, silhouette); tropical alternative | 9.5 |
| 41 | Flower anatomy: whorls, sepals/petals/tepals, stamens, carpels, complete/perfect/unisexual, monoecious/dioecious, symmetry, ovary positions, floral formula | 10.1 |
| 42 | ALL inflorescences (25-item taxonomy): racemose (raceme, spike, spikelet, catkin, spadix, corymb, umbel, capitulum, panicle), cymose (dichasium, helicoid, scorpioid, cincinnus, polychasium, umbelliform), compound/special (compound raceme/umbel/corymb/spike/capitulum, thyrse, verticillaster, cyathium, hypanthodium, fascicle, glomerule, pseudanthium, ray/disk) | 10.2 |
| 43 | Pollination: self (cleistogamy, dichogamy, herkogamy, self-incompatibility), cross; entomophily, anemophily, ornithophily, chiropterophily, hydrophily; coevolution (fig wasp, yucca moth) | 10.3 |
| 44 | Fertilization: pollen tube, double fertilization, parthenocarpy | 10.4 |
| 45 | ALL fruit types (30-item taxonomy): fleshy (berry, drupe, pome, hesperidium, pepo), dry dehiscent (follicle, legume, silique/silicle, capsule modes), dry indehiscent (achene, cypsela, caryopsis, nut, samara, schizocarp, loment, utricle, nutlet), aggregate (5), multiple (syconium, sorosis), accessory (apple, strawberry, cashew, rose hip) | 10.5 |
| 46 | Dispersal: wind, water, animal (flesh, burrs, caching/scatter-hoarding, myrmecochory), mechanical, viscin, vivipary | 10.6 |
| 47 | Tree reproductive timeline: juvenility, cues, mast years, bloom→fruit, ethylene ripening | 10.7 |
| 48 | Lifestyles: annual, biennial, perennial (herbaceous/woody), monocarpic/polycarpic | 11.1 |
| 49 | Tree life stages: seed→seedling→sapling→pole→mature→senescent→death; growth curve; age≠size | 11.2 |
| 50 | Pioneer vs climax; succession | 11.3 |
| 51 | Lifespan extremes (dicot records) | 11.4 |
| 52 | Two-engine law; tree as embodied history | 11.5 |
| 53 | Growth quality through life; juvenile vs adult wood | 11.6 |
| 54 | ALL tropisms: photo, gravi, thigmo, hydro, chemo, helio; nastic movements | 12.1 |
| 55 | Water stress: ABA, stomatal closure, drought-deciduous, xerophytes, embolism | 12.2 |
| 56 | Temperature stress: frost, chilling injury, heat, freeze-thaw embolism | 12.3 |
| 57 | Light stress: sun/shade leaves, shade tolerance, avoidance, sunscald | 12.4 |
| 58 | Other stresses: salt, wind, fire, flooding, herbivory | 12.5 |
| 59 | Plasticity principle | 12.6 |
| 60 | Life Tree bridge: spine, organ map, two-engine, variation, seasons, flowers/rarity, explorable leaves, anti-farm, honesty | 13 |
| 61 | Glossary: every bolded term defined (461 entries across 3 audit passes) | Glossary |
| 62 | Readability: every technical term defined inline at first use (receptacle, rachis, ethylene, periderm, mesocarp/endocarp covered in audit pass); chronological order | entire |
