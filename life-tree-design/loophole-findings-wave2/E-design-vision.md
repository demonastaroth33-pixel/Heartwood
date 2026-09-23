# E — DESIGN-VISION LOOPHOLES (wave 2 · the design-vision lens)

**Hunt date 2026-09-23 · Lens: THE DESIGN-VISION LENS — does every locked
design decision actually MATCH the user's vision and the Heartwood
identity?** Read against: VISION.md (17 principles + organ map + §8),
LOOPHOLES.md (resolutions), ACHIEVEMENT-SCAN.md (§1.5 identity axis),
scan-outputs/05-uiux.md (UI surfaces brief), the Heartwood identity
(design/heartwood/heartwood-m0.html, heartwood-design-system.html,
design/heartwood-deepseek-handoff.md, docs/DesignSystem.md, docs/UIUX.md),
the D088 gradient-coherence record (scan-outputs/07-ledger.md L1514–1699),
SCHEMA.md, TRAIT-SPACE.md, INPUT-INVENTORY.md, and wave-1 findings
(A–F, loophole-findings/). Wave-1 hunted stages, temporal gaps, botany,
gamification, and UX surfaces; this brief hunts whether the LOCKED design
still delivers the user's stated vision and stays the same app as the
Heartwood shell. Overlap with wave-1 is cited, not re-found.

**Result: 5 CRITICAL · 12 MAJOR · 4 MINOR = 21 findings.**

---

## CRITICAL

### DV-C1 — The flower and fruit layers sit OUTSIDE the coherence envelope: the identity axis has no axis filter, so the zombie survives at the flower layer

**Location:** D088 gradient coherence (07-ledger.md L1638–1681, esp.
L1653 "ONE CHARACTER PER ORGAN (trunk / root system / leaf family /
branch structure)"); ACHIEVEMENT-SCAN §1.5 (the identity axis, families →
inflorescences, no axis filter); VISION §6 (cohesion imperative); D086
flower-layer fallback (07-ledger.md L1682–1691); wave-1 C-brief M-3b
(nine inflorescence families on one crown).

**What the vision/heartwood says:** Cohesion is "the single most
important constraint" (VISION §6). The D088 refactor replaced the
compatibility matrix with the axis system precisely so "contradictions
[are] impossible by construction." VISION principle 8: even though it is
a mishmash, everything must look beautiful and cohesive.

**What the design does:** The one-character-per-organ floor enumerates
trunk, root system, leaf family, branch structure — **flowers and fruits
are absent from the floor.** The identity axis (achievement family →
inflorescence) has NO axis signature and NO character filter. The only
flower-facing coherence rule that exists is D086's fallback, and it is
about ADAPTATIONS (a 365-day streak on a rainforest-character tree grows
a thorn-flower, not thorns), not about the flower identity itself. The
task's exact case is real and unlocked: a sparse/arid-character user
(low RESOURCE → phyllodes) who earns the IX Full Circle family earns a
**syconium** — a tropical fig inflorescence — on an arid, drought-
adapted tree. A boreal/arid character bearing tropical syconia,
tropical spadices (nutrition, Piper-anchored, already flagged in wave-1
C-brief M-7), and temperate catkins is a botanical contradiction the
current model structurally permits. The fruit layer is even more open:
the fruit-type driver is "goal completions + milestones" with no
envelope, so any of the 30 fruit types could attach to any character.
Wave-1's C M-3b proposed extending the rank rule to flowers; it was
never locked, and the design-vision reading adds that the AXIS
signatures (the coherence mechanism itself) must be extended to the
reproductive layer, not just a dominance rule.

**Proposed fix:** (a) Add flower-family + fruit-type to the
one-character-per-organ floor (one dominant inflorescence family per
bloom, one dominant fruit type per spur-set, same-organ contradiction
rule); (b) give each of the 9 identity-axis inflorescences an axis
signature (e.g., syconium/spadix = high-RESOURCE tropical character,
catkin/raceme = temperate any-resource, capitulum = sunny/prairie) —
the flower renders canonically when the user's position falls inside its
signature, otherwise the achievement's flower renders in the
character's own compatible family (the D086 fallback, extended to the
identity axis, exactly mirroring the thorn-flower precedent); (c) encode
the flower-family compatibility pairs into TRAIT-SPACE §3 (wave-1 C
M-3b's "catkin + raceme harmonize; spadix + capitulum need the accent
rule"). The why-panel then explains both halves ("your tree's arid
character grows this achievement as a desert bloom") — turning the
coherence rule into an explainability feature, per principle 11.

---

### DV-C2 — The bloom/flower palette is un-reconciled with the Heartwood identity: the cherry-blossom standard has no color token, and the tree's most-visible moment has zero art direction

**Location:** VISION principle 6 (seasonality, "the cherry-blossom-Japan
standard: everyone can see it"); D085 (spring bloom, 07-ledger.md L1452–
1465); DesignSystem.md tokens L69–85 (Ink: bg #0D110F, accent #8FBF72
sage, gold #E8B45A, rust #E06C5F — no pink/blush of any kind); restraint
contract D:L34–42 (one ambience moment, max two accent elements, no
glow/neon, gold on streaks only); heartwood-deepseek-handoff §2 (muted
sage accent "flat only, never as a gradient"); tree-2 skeleton
(07-ledger.md L1403: "Theme: dark-first tokens, ring/leaf palettes,
seasonal or state tints" — SKELETON, unfilled, no lock); D086 derived
accents (L1466–1472).

**What the vision/heartwood says:** The bloom is the single most
promised moment in the whole design ("the earned cherry-blossom
moment", L-02), and the user's standard is explicitly "everyone can see
it." The Heartwood identity is dark green-ink, muted sage, warm paper,
rust, gold-spent-sparingly — "quiet discipline, not gamified hustle,"
no neon, no glow, flat color only.

**What the design does:** There is no flower/bloom palette spec anywhere
in the life-tree design. D086 says "derived palette / accents" without
defining the palette family. The blossom (the app's emotional peak) will
be implemented against a token set that has NO pink, NO bright bloom
color, and a restraint contract that caps accent elements per viewport
and bans glow. Two failure modes are live: (1) the implementer invents a
candy pastel-pink blossom that reads as a different app (the "does it
read as Heartwood" clash), or (2) the tree is forced into sage-green
flowers and the "cherry-blossom standard" dies. Neither is acceptable
and neither is decided.

**Proposed fix:** Define the Heartwood bloom palette as a first-class
design decision before any mockup: a **muted, desaturated blush family**
(the ink-wash cherry-blossom — dusty rose / pale blush that sits on dark
ink-green, at wash-level opacity for the canopy and one allowed
"saturation moment" — the same privilege gold has for streaks), plus
the autumn fruit/leaf palette (rust/gold family, already in tokens), the
winter dormancy desaturation, and the spring green that merges with the
accent. Lock the rule "the bloom is the ONE surface allowed to carry
the blush hue; everything else stays token-quiet" (mirroring the
atmosphere-image rule). Add Paper-theme variants of the trait palettes
(DV-m1). This keeps the cherry-blossom standard AND the identity — the
bloom becomes the designed exception, not a rogue insert.

---

### DV-C3 — Full trait utilization (principle 17) is not delivered by the locked organ map: ~9 of 25 inflorescences, 1 fruit visual of 30, ~14+6 of 46 modifications are in use, and the trait-selection drivers that would close the gap are literally unfilled

**Location:** VISION principle 17 (L150–156: "if it's in the botanical
master … it is available as a derived trait" — LOCKED); D088 adaptation
map (07-ledger.md L1584–1637: 14 rows + 6 universal + honest skips);
ACHIEVEMENT-SCAN §1.5 (9 identity-axis families); TRAIT-SPACE.md §2
(leaf family driver: "per-section character (journal = ?, gym = ?,
habits = ?)" — the ? is verbatim in the doc); TRAIT-SPACE §2 fruit
driver ("goal completions + milestones" only); SCHEMA.md L150–156.

**What the vision says:** The researched variety is COMPLETELY utilized —
all 25 inflorescences, all 30 fruit types, all 46 organ modifications —
as the uniqueness engine. "Nothing researched sits unused."

**What the design does:** The locked organ map + D088 put ~9
inflorescence families (the identity axis) on the flower layer, one
fruit visual ("fruit on spurs" + tendrils) on the fruit layer, and 14
mapped adaptations + 6 universal of the 46-modification catalog in the
adaptation layer. The remaining ~16 inflorescences and ~29 fruit types
have no defined data driver at all. The stated drivers that would
differentiate them are gaps in the doc itself: the leaf-family
per-section character (the leaf-layer uniqueness + duality driver) is an
unfilled question mark, and the fruit-type driver is a single generic
phrase. The honest skips are fine (user-approved, documented); the
problem is the silent unused remainder. Principle 17 cannot be met by
the current container.

**Proposed fix:** Make Step 7 (Trait space + visual design) carry a
"17-audit": every inflorescence, fruit type, and modification not in an
honest skip must be attached to a data driver before the trait space is
locked — e.g., leaf-family per section driven by Life Area mix and
entry-type mix (journal: text vs voice vs photo → leaf blade/margin
families), fruit TYPE driven by goal kind (weight goals → pome/berry
classes, habit goals → drupe, project milestones → capsule), the
remaining inflorescences absorbed as runner-up/subtle-tier bloom accents
per the rank rule (not nine only). Record the "17-audit" result in
TRAIT-SPACE with a per-trait driver column; anything left unused must be
an explicit documented skip, never silent.

---

### DV-C4 — The uniqueness guarantee collapses for similar lives: four aggregate axes + nine flower families + five fixed branches do not differentiate two users who live similarly

**Location:** VISION principles 4 and 12 (uniqueness structural AND
visual, emergent, "the trait space is large enough that real users never
coincide" — §5); D088 (4 axes, 5 fixed branches, 9-fold identity);
TRAIT-SPACE §2 (drivers are aggregates: "dominant domains, focus
balance," "age + years"); INPUT-INVENTORY.md L90 (journal areas → class
4, "leaf placement" — the ONLY life-area mapping); ACHIEVEMENT-SCAN
§1.5 (identity axis); D086 (derived accents = "domain balance").

**What the vision says:** Uniqueness is structural AND visual and falls
out of the trait space because "the trait space is large and lives
differ" (VISION principle 4). Two users' trees must be recognizably
theirs even when their logging habits are similar.

**What the design does — the collapse cases:**
1. **Same-5-branch problem.** Every user has the same 5 fixed branches
   from day one (D088 A). Structural difference is only the leader
   (which of 5), forks (sub-feature splits), twig counts, and ring
   counts — all coarse.
2. **Four numbers encode everything.** RESOURCE, RHYTHM, BALANCE, TENURE
   are aggregate positions (averages, distributions). Two journal+habit
   users with similar volume, similar steadiness, similar balance, same
   tenure → identical axes → identical trait selections → near-identical
   trees. The trait space's size (25×30×46) is irrelevant if the
   selection inputs are 4 numbers plus ~9 achievement families.
3. **The event log's ORDER is discarded.** User A (heavy year 1, quiet
   year 2) and user B (quiet year 1, heavy year 2) have identical
   aggregates → identical trees, though their lives are genuinely
   different. No "rhythm of tenure" dimension exists.
4. **Life Area feeds almost nothing.** The journal's 8 Life Areas
   (Health/Learning/Career/Relationships/Projects/Self-Improvement/
   Finance) are the richest per-user signal in the app, mapped only to
   "leaf placement" (undefined). A user who journals 90% about career
   and one who journals 90% about relationships — same domains, same
   volume — get the same tree. This is both a uniqueness collapse AND a
   quiet violation of principle 1 ("every input feeds the tree").
5. **Derived accents are domain-balance only** (D086) — the top-tier
   transformation's differentiating palette is one aggregate number.

**Proposed fix:** (a) Add a high-dimensional deterministic per-user
morphology layer derived from the FULL log (not the 4 aggregates): e.g.,
a deterministic "growth signature" hash of the event stream → continuous
morphological parameters (crown spread, branch angle variance, leaf
size, ring eccentricity, bark texture) — deterministic (same data →
same tree, principle 4 intact) yet high-dimensional (different lives →
different trees); (b) wire Life Area mix into branch/leaf character and
the D086 derived accents (a career-journaler's tree leaf-family and
palette ≠ a relationships-journaler's); (c) add a time-distribution
dimension (early-heavy vs late-heavy) so the order of effort is
expressed; (d) seed-data stress tests must specifically test SIMILAR-
LIFE pairs (the "twin" archetype) and assert visible difference, not
just archetype-level difference.

---

### DV-C5 — The shipped Heartwood habit surface contradicts the locked bud model: the app speaks three growth languages, and "Heartwood" means the app, an achievement tier, a habit stage, and the trunk's anatomy

**Location:** D087 (habits = BUDS on the habit branch); D088 B duality
("the habit card's streak ring IS the bud swelling; the swipe-complete
burst IS the bud bursting"); heartwood-m0.html (the Habits screen: an
8-stage mini-plant ladder Seed→Sprout→Sapling→Young→Grown→Full→Elder→
**Heartwood**, each habit a plant, gold-wash glow at Elder/Heartwood,
L786, L1283–1284); handoff §5.2 (the 8-stage system is a NEW proposal
pending sign-off); D091 (trophy tier labels Sprout→Grove kept verbatim,
"the flower thematic is carried by the overlay"); heartwood-deepseek-
handoff §1 (product name = Heartwood); D093/D090 (tree stages =
seed→seedling→sapling→pole→mature→old-growth).

**What the vision/heartwood says:** The duality (principle 13 + D088 B):
one derived state, one animation language, two scales — the habit UI is
the LOCAL view of the habit branch's buds. The tree is the meta-UI;
growth vocabulary should cohere. The user is one person reading the
app; three parallel "growth ladders" on three screens is not Heartwood's
"calm, consistent" identity.

**What the design does — two live collisions:**
1. **Mini-plant vs bud.** The M0 Heartwood habit card renders each habit
   as its own 8-stage plant (streak days → Seed→Heartwood) with a gold
   glow at the top stages. D087 says each active habit is ONE bud on the
   habit branch (swell → burst → scar). The duality says the card's
   streak ring IS the bud swelling. Two different organisms are being
   displayed for the same data: a per-habit mini-tree (shipped mockup)
   and a bud on the tree (locked design). If the tree ships buds and the
   habit screen keeps mini-plants, the app's most-used surface breaks
   the duality on day one. If the habit screen becomes the bud garden,
   the shipped Heartwood stage-ladder (with its gold Heartwood stage)
   is deleted — a M0 visual the user approved.
2. **"Heartwood" × 4.** The app is named Heartwood; the achievement tier
   ladder has a Heartwood tier (D091, kept verbatim); the habit stage
   ladder has a Heartwood stage (120+ days); and the trunk's inner wood
   is literally heartwood. Four meanings of one word across the app's
   growth language — exactly the naming-collision class the D091
   resolution was meant to end, now re-invented inside the tree system
   (wave-1 F-audit N-3 touched this for tier relabeling; it did not
   catch the shipped habit stage ladder).

**Proposed fix:** (a) Reconcile the habit surface with D087 in the
duality spec: the habit card's local organ is the BUD — the streak ring
= bud swelling, completion burst = bud burst, abandoned = scar — and the
8-stage mini-plant ladder either becomes the bud's stage vocabulary
(seed/sprout/sapling stages on the BUD, not a second plant) or is
retired from Habits; (b) unify the three ladders into ONE visible growth
language with distinct names (the organism's stages seed→old-growth, the
flower's magnitudes Sprout→Grove, the bud's local stages) and eliminate
the Heartwood stage from the habit ladder (rename to "Elder" / fold into
the bud swelling), keeping the app name + the anatomy term as the two
remaining uses, documented in the why-panel ("your tree's heartwood —
the wood your years made").

---

## MAJOR

### DV-M1 — The tree-as-meta-UI (principle 15) has no home: the locked navigation contract places the tree in "(future systems)" and defers ordering to the end of design

**Location:** VISION principle 15 (L128–138: the tree IS the meta-UI the
sections live in); docs/UIUX.md L11–21 (MVP tabs: Dashboard, Journal,
Habits, Settings; "Later: Goals, Coach, (future systems)"; ordering
deferred L170); scan-outputs/05-uiux.md §0 (CRITICAL: the Life Tree tab
is not documented anywhere).

**What the vision says:** "The tree is not a widget beside the app — it
IS the meta-UI the sections live in. The tree opens each section's
content beautifully." The strongest expression of principle 13.

**What the design does:** The only documented slot is "(future systems)"
behind Goals and Coach. A tab is a peer, not a meta-surface: if the tree
lands as a fifth tab, it visually joins the section list rather than
being the surface the sections live in; if it replaces the dashboard it
reopens the locked ordering. The deferral (U:L19–21) is deliberate, but
the design-vision consequence is that the tree's core identity — the
"cohesive view of everything" — has no designed relationship to the
shell at all, and nothing in the tree design (SCHEMA §7 feeds mapping is
the only gesture) addresses how a 640px column + tab shell hosts a
meta-surface.

**Proposed fix:** Design the tree's shell relationship as part of Step
7, without reopening the locked ordering: specify (a) the tree as a
home-anchored surface (the dashboard hero slot as the tree's living
miniature that opens the full tree — the app's home literally shows the
organism), (b) the full tree as its own surface reachable from every
section via the organ-dual (each section's local view links "see it on
the tree"), and (c) the feed-opening semantics (SCHEMA §7) as the
section↔tree navigation contract. Leave the final tab ordering to the
deferred pass, but the shell relationship must be designed, not left to
the ordering revisit.

---

### DV-M2 — The calendar's tree-correspondence is not designed: the tint is activity, not season; dormancy and bloom have no calendar presence; and the mockup's calendar "climbing vine" is a second, unrelated plant metaphor

**Location:** docs/UIUX.md L136–167 (tint-only rule, dayActivityScore);
LOOPHOLES §7 (calendar tint rule OPEN — "tree state flows through the
H3 dayActivityScore owner — no independent presence"); D085 (calendar =
the tree's season skeleton); heartwood-design-system.html L748–784 (the
Calendar screen with a decorative climbing VINE + tendrils sized by
weekly activity — a different plant than the tree); wave-1 C-brief M-5
(tendrils are a climber organ — rejected for the tree).

**What the vision/heartwood says:** Principle 13: every section's UI
directly corresponds to the tree — calendar = seasons (organ map row
"Season cycle | Seasonal states"). The calendar is the app's memory map;
the tree's seasonality is the calendar's heartbeat (D085).

**What the design does:** The calendar tint (dayActivityScore) is pure
activity intensity — a quiet spring (low scores) renders faint, while
the tree (D085) blooms densely in spring. The calendar has NO seasonal
component: no bloom, no dormancy, no autumn color, no winter rest —
the tree's most public seasonality (D085's whole point) is invisible on
the calendar. And the shipped Heartwood calendar mockup draws a
climbing vine whose tendrils encode weekly activity — a second plant
metaphor, botanically a climber (wave-1 C M-5), visually unrelated to
the tree. The tint-only rule (no glyphs on cells) is respected; the
question is whether the calendar can express the tree's season at all
within it.

**Proposed fix:** Give the calendar an explicit season dual: (a) the
month-grid's All-view tint gains a seasonal baseline — the dayActivity
intensity layered on a season-phase wash (spring = faint blush, summer =
sage, autumn = rust, winter = desaturated) so the calendar IS the
tree's phenology; (b) replace or re-anchor the decorative vine: either
drop it or reinterpret it as the tree's own seasonal trail (the year's
twig-growth drawn along the rail — one plant, the user's), never a
second organism; (c) record the LOOPHOLES §7 open item as resolved by
"tree season flows through dayActivityScore's seasonal component, no
independent presence" — keeping zero-writes.

---

### DV-M3 — The Coach has no branch: its only tree presence is a root-level mycorrhiza detail, so principle 13's "every section corresponds" is weakest for the app's named future feature

**Location:** VISION principle 13 (every section's UI corresponds);
D088 A (5 fixed branches = journal, habits, gym, nutrition, goals —
Coach, Calendar, Dashboard excluded); D088 adaptation row 10
(mycorrhizal/nodule character — "sustained coach engagement … visible
in the root section"); heartwood-design-system.html (Coach screen).

**What the vision/heartwood says:** "Fitness → its organ, habits → the
habit-planting model … Each section's visual role is explicit and
designed." Coach is a first-class section (daily note, weekly review).
The app's "one true symbiont" (D088 row 10) deserves a real presence.

**What the design does:** The Coach's entire tree correspondence is a
root-section detail (mycorrhizae) gated behind sustained engagement, on
an organ the user rarely sees. There is no coach branch, no coach dual
on the Coach screen, and the coach weekly review (the app's big weekly
surface) has no tree reflection. The duality is silent for the app's
named future headline feature.

**Proposed fix:** Elevate the symbiont: (a) define the Coach's dual as
the mycorrhizal/root character visible on the Coach screen itself (the
weekly review gains a quiet "root state" line — foundation health,
symbiont strength — one derived readout, facts-first); (b) give coach
engagement a visible-but-subtle tree presence beyond the root (e.g.,
the mycorrhizal hyphae tint at the trunk base, or a "symbiont ring"
around the root collar), so sustained coaching compounds visibly on the
tree (consistency principle, D088 F); (c) document the Coach's
correspondence explicitly in the duality table so it is "explicit and
designed" per principle 13.

---

### DV-M4 — The Dashboard's correspondence is undefined: the trunk (the life itself) has no dual on the app's home screen

**Location:** VISION organ map (L171: "The whole life | Trunk = the life
itself — the only organ belonging to no section"); D088 B duality
(list: habits, journal, nutrition, gym, goals, achievements — Dashboard
absent); docs/UIUX.md L23–61 (Dashboard blocks).

**What the vision says:** The trunk is "the aggregate of ALL logging;
girth = overall consistency" — the whole-life organ. The dashboard is the
whole-life surface (the app opens to it, Today fusion + streak + storage).
The duality promises every section UI is the local view of its organ.

**What the design does:** The dashboard has no mapped organ and no dual
readout. The streak ring (the mockup's signature dashboard element) is
the closest gesture — and it is gold-streak territory, not the trunk.
The user's daily "the state of my life" moment has no tree reflection
at all; the tree's girth/consistency signal is invisible on the home
screen where the user lives.

**Proposed fix:** Map the dashboard to the trunk as its dual: a quiet
trunk-line readout in the Today/streak block (girth trend = consistency,
ring count = years) in the tree's token language, with a "see it on the
tree" link into the full surface (DV-M1). This completes the duality
table and makes the home screen the life-trunk's local view.

---

### DV-M5 — The journal / gym / nutrition / achievements local duals have no visual spec: leaf state on the timeline, girth trend in the gym, sap in the macro-gap bar, bloom state in the trophy list

**Location:** D088 B duality (the paragraph-level promises: journal =
leaves, gym = branch girth, nutrition = sap monitor, achievements =
bloomed at both scales); docs/UIUX.md L76–80 (macro-gap bar), L253–282
(session UI), L179–184 (journal tiles); heartwood-m0.html (the actual
shipped tiles/cards — no leaf/bud/girth/bloom states anywhere); wave-1
E-brief M-2 (duality has no stage-scaled local readout).

**What the vision/heartwood says:** "ONE derived state, ONE animation
language, TWO scales" — the section UI shows the SAME state the tree
shows. The Heartwood shell's cards are token-quiet and data-honest; the
duals must be readouts, not decoration.

**What the design does:** The duality is a sentence in D088, not a
surface spec. The shipped Heartwood journal tile has no leaf-state
expression (new entry = young leaf? photo = mature leaf? — nothing in
the tile grammar); the gym session screen has no girth/wood-quality
readout; the macro-gap bar (the nutrition dual's obvious anchor) shows
protein/kcal only — no sap/vascular correspondence; the trophy/achievement
surfaces have no bloom-state grammar. Wave-1 E M-2 covered the stage-
scaling half; this finding is that even at maturity the local visual
language for the duals is unspecified.

**Proposed fix:** Write the duality surface contract (Step 7): one
readout per section in the existing token grammar — journal tile footer
gains a leaf-state dot (young/mature/storage) with tooltip; gym session
header gains a quiet "branch" line (girth trend from strengthSnapshot);
macro-gap bar's footer gains the sap state (the vascular dual); the
trophy list/toast gains bloom-state (bud/abloom/wilted). Each is a
derived fact readout in textSecondary/mono (no new accent elements —
restraint), and each carries the "see it on the tree" link (DV-M1).

---

### DV-M6 — Day-1 beauty and explorability are unspecced: a seed alone in a space is either gorgeous or empty — nothing locks the day-1 composition

**Location:** VISION §8 ("the user demanded the tree be beautiful
immediately and explorable" — recorded assessment); D094 (stage-
transition UX LOCKED); wave-1 E-brief C-1 (day-1 render undefined +
invisible bank — resolution proposed); heartwood-m0.html (the ic-seed
glyph, loader sprout, atmosphere washes — the raw material exists).

**What the vision/heartwood says:** The tree must be beautiful from day
one — the user's explicit standard. Heartwood's identity is negative
space, calm, plant-like, ink-green; a single seed in a large dark canvas
with washes is literally the mood-world image (rainy bamboo, ink-wash
fields). This can be genuinely gorgeous — but only if composed.

**What the design does:** Nothing composes the day-1 tree. Wave-1 E C-1
proposed the content (seed + cotyledons + ghosted branch-bud crown +
visible banked counts) but the VISUAL composition — scale, soil, ground
line, negative space, what the seed looks like — is unowned. And
explorability: a day-1 user's tappable set (seed, 5 branch-buds, trunk)
with no defined interactions (wave-1 E M-6) plus anatomy views gated to
"first ring" (wave-1 E M-3) leaves the day-1 surface thin: the ONLY
real exploration on day 1 is the why-panel + seed anatomy, neither of
which has a spec.

**Proposed fix:** Lock the day-1 composition (the "seed in a room"
standard): the tree renders centered at ~35% viewport height on a
ground-line, the seed as the ic-seed glyph (identity coherence, DV-m4)
in a small soil mound with the ghosted 5-bud crown above it as a faint
architecture preview, atmosphere washes behind, and the overview strip
carrying the banked counts (wave-1 E C-1/M-6). Explorable day 1 = seed
tap (why-panel: what it is, when it germinates), each bud tap (its
section's not-yet-extended detail + feed link), and the SEED transverse
anatomy view (cotyledon/embryo — botanically real, educationally
beautiful, unlocked from day 1, per wave-1 E M-3's own root-view
precedent). Beauty and exploration are then both delivered on the
first open.

---

### DV-M7 — The bursty/sparse archetype has no beauty spec: "a tall sparse tree" is botanically true but visually unowned, and the consistency=beauty pillar implies every archetype must be gorgeous

**Location:** VISION §3 (two-engine law: "A bursty user gets a tall
sparse tree; a consistent user gets a dense thick one. Both are
botanically true."); principle 10 (consistency compounds — the most
consistent get the most beautiful trees); principle 6/§8 (beautiful
everywhere); D088 F.

**What the vision says:** Every user's tree is beautiful (the composite
is decided by data and must always be cohesive and beautiful, §6). The
"family of trees" (principle 12) is a family of beautiful trees.

**What the design does:** The bursty/sparse character is named ("tall
sparse") but has zero visual direction. A real savanna/acacia silhouette
(open crown, sculptural bare branches, few leaves) is genuinely
beautiful; a generic sparse tree rendered naively is a weedy stick —
and the wave-1 briefs never asked "is the sparse archetype beautiful?"
The two-engine law's honesty here is a double-edged promise: it must be
both true AND beautiful, and nothing in the trait space (crown types,
bark, leaf placement) addresses the sparse crown's composition.

**Proposed fix:** Add a "sparse archetype beauty" row to Step 4's
archetype mockups: the low-RESOURCE/bursty tree should be rendered as a
sculptural character (open savanna silhouette, visible reaction-wood
history, elegant bare branch structure, leaf clustering on twig tips),
with explicit crown/branch styling rules for low-canopy-density states
so the honest sparse tree reads as deliberate, not failed. The same for
the young/seedling archetypes (DV-M6).

---

### DV-M8 — The gold boundary on the tree is undefined: gold is locked to streaks only, yet the tree's rings, flowers, and first-bloom all want warmth, and the shipped mockup already spends gold on the habit Heartwood stage glow

**Location:** DesignSystem.md L34/L81/L190 + restraint #5 ("Gold on
streaks and nothing else"); D086 derived accents (must exclude a gold
palette — wave-1 D-brief C flagged this); heartwood-m0.html L785–786
(plant-stage.heartwood / elder = gold-wash + gold glow); VISION organ map
(rings = yearly consistency — not a streak).

**What the heartwood says:** Gold is the app's scarcity token — warmth
spent sparingly reads as achievement. The tree is the biggest visual in
the app; if it spends gold freely (rings in gold, flowers in gold, bloom
glow), the restraint contract collapses and gold stops meaning anything.

**What the design does:** The tree's warmth channel is undefined: year
rings (consistency, not a streak — gold or bark-tone?), achievement
flowers (achievements are not streaks — the wave-1 D-brief already says
derived accents must exclude gold), and the first bloom (blush per
DV-C2, or gold?). Meanwhile the shipped habit mockup already spends gold
on the Elder/Heartwood stage glow — a per-habit gold, competing with the
streak gold on the same screen (the streak numeral is gold too).

**Proposed fix:** Lock the tree's gold boundary explicitly: gold appears
on the tree ONLY for the streak-derived signals (a habit bud's swelling
ring, the app's streak ring on the dashboard dual) and NEVER on
achievement flowers, year rings, or the bloom; those use the bloom/rust
palette (DV-C2). Remove/replace the habit stage glow gold with the bud-
swelling gold (DV-C5), so one gold meaning survives. Encode the rule in
the engine contract so the renderer cannot spend gold on the flower
layer.

---

### DV-M9 — Same-family Grove trophies render identical flowers, and the top-tier transformation's derived accents (domain balance only) undercut "almost never seen on other users' trees"

**Location:** ACHIEVEMENT-SCAN §1.5 (identity + magnitude axes); §1
tier ladder (Grove = "the LARGE visuals"); VIII The Rings family (20
trophies, many Grove: VIII-3/4/7/8/9/10/20); D086 (deterministic core +
derived accents from "domain balance"); VISION principle 9 ("almost
never seen on other users' trees"); wave-1 C-brief M-4 (pseudanthium
collapse).

**What the vision says:** Super-hard achievements grant "a really large,
unique, standout visual difference … almost never seen on other users'
trees" — the user's explicit bar.

**What the design does:** Identity (family → inflorescence) + magnitude
(tier) are the only two axes. Two VIII-family Grove trophies (e.g., Ten
Years VIII-4 and Old Growth VIII-9) → same identity (the yearly bloom)
AND same magnitude (Grove) → visually identical flowers. Across users,
the transformation's differentiating palette is derived from "domain
balance" — one aggregate — so two earners with similar balance render
near-identical top-tier events. The "almost never seen" promise is
structurally undercut.

**Proposed fix:** (a) Add a third, higher-cardinality identity input:
the deterministic growth signature (DV-C4's per-user morphology) colors
each flower, so same-family same-tier flowers differ in proportion,
patterning, and accent within the family (the "derived accents" become
multi-dimensional, not balance-only); (b) within a family, differentiate
the tier-ladder flowers by the earned trophy's specifics (ring count for
the VIII family: a 9-ring bloom vs a 10-ring bloom carry visible ring
detail); (c) document that the transformation's core shape is shared
(determinism — honest, explainable) while the composition/palette is
per-user, and set the stress-test assertion to "two earners of the same
Grove trophy with different logs visibly differ."

---

### DV-M10 — The fixed 5-branch crown risks the "five-fingered tree": the 5-branch structure is constant, so the twig layer is the only canopy variance, and leader magnitude / branch angle are unspecced

**Location:** VISION principle (m) in the brief: "the tree must look
good with only 5 branches"; D088 A (5 fixed first-order branches from
day one; leader = most sustained domain; forks from sub-feature
differentiation); D088 (twigs = the canopy mass, "the beauty answer").

**What the vision says:** With only 5 branches — the same 5 for every
user, every day one — the tree must still look like a tree and vary by
user. "Looks good with only 5 branches" is an explicit user demand (the
twig layer was built as the answer).

**What the design does:** The branch STRUCTURE (5 first-order limbs off
one trunk) is constant and radially identical by default. The only
crown-shape variance is the leader (which branch is tallest), forks
(sparse, sustained-differentiation only), and twig mass. A naive render
of 5 equal limbs = the universal childhood "five-fingered tree" drawing;
nothing specifies branch angle distribution, limb curvature, leader
dominance magnitude (how MUCH the leader leads), or second-order length
falloff — the very parameters that make a 5-limb crown look like a real
tree vs a glyph.

**Proposed fix:** Add a crown-architecture spec to Step 7: branch
azimuth/elevation distribution (asymmetric, data-seeded — DV-C4's growth
signature), leader dominance as a continuous value (leader length ratio
vs laterals, from the sustained-domain margin), twig placement rules
(phyllotaxy, tip-weighted clustering per D088), and a minimum-silhouette
check in the archetype mockups ("does this 5-branch crown read as a
tree and not a 5-fingered glyph?"). This is the pillar-(m) guarantee.

---

### DV-M11 — The fruit layer has no type-selection driver: 30 fruit types exist in the trait space, but "goal completions" alone will bear undifferentiated fruit

**Location:** VISION principle 17 (all 30 fruit types available);
TRAIT-SPACE.md §2 (fruit driver: "goal completions + milestones");
D088 A (fruit spurs = completed goals); SCHEMA.md (class 5 → fruit
swelling / tendrils); INPUT-INVENTORY (goal.completed → fruit on the
spur).

**What the vision says:** The fruit variety is a uniqueness engine — 30
fruit types, actively used. Completed goals bear fruit; the TYPE should
mean something about the goal.

**What the design does:** The organ map routes every completed goal to
"fruit on the spur" with no type logic. A user's completed goals — weight
goals, habit goals, project milestones, the VIII-ring vows — would all
bear the same fruit. The 30-type catalog is decorative unless a driver
differentiates it. Wave-1 did not touch fruit types (botany brief
covered tendrils and spurs, not the fruit taxonomy).

**Proposed fix:** Give goal kind a fruit-type mapping (DV-C3's audit):
goal class (weight/body → pome/berry drupe classes; habit/consistency →
aggregate fruits; project/milestone → capsule/samara; decade-scale vows →
mast-year coning) + the growth signature for per-user fruit size/accent
variance. Fills principle 17 and adds a second uniqueness axis on the
fruit layer.

---

### DV-M12 — The why-panel and the ceremonies are unspecced against the design system: no token/layout contract for the explainability surface, and no rule tying the ceremonies to Heartwood's existing motion language

**Location:** VISION principle 11 (explainability — the why-panel is a
first-class output); D094 (stage-transition UX LOCKED); D088 row 13
(bracts = the bloom's ceremonial presentation, "F-03 ceremony language
tie"); wave-1 E-brief C-2 (ceremonies have no trigger/ceremony/replay
spec — resolution proposed) and m-4 (reduced-motion); heartwood-m0.html
(loader sprout-draw + ripple, check-spark ripple — the app's motion
grammar); DesignSystem.md §4.13 (loader draw language), §6 (motion).

**What the vision/heartwood says:** The tree must be fully explainable —
and the app has one motion grammar (stroke-draw reveal, ripple pulses,
durFast/durSlow/ease sets) and one token grammar (mono labels, tabular
figures, textSecondary, one primary action). The why-panel and the
ceremonies are tree surfaces that must BE Heartwood.

**What the design does:** Neither has a design-system contract. The
why-panel (the tree's most important explainability surface, the thing
that makes the whole composite honest) has no layout/token/typography
spec (wave-1 E-brief m-2 proposed "chrome stays token-quiet" but nothing
is locked); the ceremonies (germination, first branch, first bloom,
ring close — wave-1 E C-2) have no rule tying them to the existing
loader-draw and ripple language, so an implementer may invent new motion
that breaks the identity, or worse, game-style confetti (DV-m2).

**Proposed fix:** Lock the why-panel spec in Step 7 against the design
system: mono uppercase label + tabular figures + bodySmall textSecondary,
one-line answers per trait ("why is this so"), the D099 "resting"
no-guilt copy tone, zero new accent elements, one "see the data" link;
and lock the ceremony language: all tree ceremonies reuse the app's
draw/ripple grammar (germination = the loader's stroke-draw sequence
scaled up; bloom = bracts wrap + the check-spark ripple amplified;
ring close = the loader soil-line draw), with the wave-1 E-brief C-2
trigger/replay/reduced-motion contract as the behavioral half.

---

## MINOR

### DV-m1 — The tree's trait palettes are not theme-aware: Paper (light) has no tree-art variant

**Location:** DesignSystem.md §1 (theme registry, Ink + Paper ships with
the picker); D086 (derived palette); DV-C2 (bloom palette).

**What the heartwood says:** "Same component grammar, same tokens, same
motion — layout adapts, identity doesn't" (D:L413). Paper is a shipped
theme; the tree renders in both.

**What the design does:** Every tree palette decision (bloom blush, bark
tones, flower hues, the washes behind the hero) is specified only in the
Ink dark context; the Paper theme's tree rendering is untouched, so the
bloom/blush/leaf colors will either be too dark on paper or re-invented
ad hoc.

**Proposed fix:** One line in the palette decision: each trait palette
declares Ink + Paper values (same hue family, adjusted lightness/alpha),
and the archetype mockups render both themes.

---

### DV-m2 — No "no-video-game" guard on the tree's ceremonies and transformations

**Location:** DesignSystem.md restraint #4 (no glow, no neon), #6 (one
primary action); tree-1 skeleton (07-ledger.md L1392: "Tone: awe without
guilt"); D086 (the largest transformation); DV-C2/DV-M12.

**What the heartwood says:** "Quiet discipline, not gamified hustle";
the tree is the awe surface, not the celebration surface.

**What the design does:** The Grove transformation and bloom ceremonies
have no explicit "no particles, no sparkle, no glow, no screen-shake"
guard — the exact visual vocabulary the Heartwood identity rejects —
and the gold-glow habit stage (DV-M8) shows the drift is already live.

**Proposed fix:** Add to the ceremony spec: transformations render in
the draw/ripple/bloom language only (DV-M12), no particle systems, no
glow bloom, no animated screen effects beyond the token motion set —
awe comes from scale and composition, not FX.

---

### DV-m3 — The hero tree's scale and budget in the 640px column / mobile are unspecced

**Location:** DesignSystem.md L159 (content column max 640px), L404–413
(responsive); tree-5 skeleton (07-ledger.md L1424–1427: paint strategy,
decade-scale cost bounds — SKELETON); VISION §1 (the tree is "the
biggest, most beautiful … system ever built").

**What the vision says:** The tree is the peak of the app — it deserves
to be seen large.

**What the design does:** The shell gives every surface a 640px column
and the tree's placement is undeferred (DV-M1); whether the hero tree
gets full-bleed / a larger canvas / a dedicated frame (vs a card-sized
hero) is unaddressed, and the perf budget (tree-5) is an unfilled
skeleton.

**Proposed fix:** In Step 7's shell relationship (DV-M1), state the hero
tree's canvas budget per breakpoint (mobile full-width hero vs desktop
a larger-than-640 surface), with the tree-5 perf budget filled against
it. The tree is the one surface that may exceed the content column.

---

### DV-m4 — The seed visual should reuse the ic-seed glyph and the loader's sprout language for identity coherence

**Location:** heartwood-m0.html ic-seed (the line-art seed in soil);
heartwood-design-system.html loader (sprout draw); DV-M6 (day-1
composition).

**What the heartwood says:** One icon set, one botanical-line language,
the app's own mark is a sprout-on-rings; the tree IS the app's emblem —
it should be drawn in the same hand.

**What the design does:** The tree renderer (procedural, instanced) is a
separate art pipeline; nothing ties the tree's seed/sprout forms back to
the ic-seed/ic-sprout glyph vocabulary, risking a visual break between
the tree and the app's iconography (the loader draws a sprout the tree
then draws differently).

**Proposed fix:** One line in the renderer art direction: the tree's
seed/germination/sprout states reuse the ic-seed/ic-sprout proportions
and stroke character; the loader sprout and the tree's first sprout are
recognizably the same organism.

---

## Summary

| ID | Severity | One-line gap |
|---|---|---|
| DV-C1 | CRITICAL | Flower/fruit layers outside the coherence envelope; identity axis has no axis filter — syconium-on-arid zombie survives |
| DV-C2 | CRITICAL | Bloom/flower palette un-reconciled with Heartwood identity; cherry-blossom standard has no token, restraint contract unaddressed |
| DV-C3 | CRITICAL | Full trait utilization (17) not delivered: ~9/25 inflorescences, 1/30 fruits, ~14+6/46 modifications; drivers unfilled |
| DV-C4 | CRITICAL | Uniqueness collapses for similar lives: 4 aggregate axes + 9 flower families + fixed branches; Life Area ≈ unused; log order discarded |
| DV-C5 | CRITICAL | Shipped habit mini-plant ladder contradicts D087 buds; "Heartwood" × 4 meanings; duality broken on the most-used surface |
| DV-M1 | MAJOR | Tree-as-meta-UI has no shell relationship; only slot is "(future systems)", ordering deferred |
| DV-M2 | MAJOR | Calendar's tree-correspondence not designed: tint = activity not season; mockup's climbing vine is a second plant |
| DV-M3 | MAJOR | Coach has no branch; only a root-level mycorrhiza detail — principle 13 weakest for Coach |
| DV-M4 | MAJOR | Dashboard has no dual; the trunk (the life itself) invisible on the home screen |
| DV-M5 | MAJOR | Journal/gym/nutrition/achievements local duals have no visual spec (leaf/girth/sap/bloom states) |
| DV-M6 | MAJOR | Day-1 composition + explorability unspecced; seed-alone-in-space is either gorgeous or empty |
| DV-M7 | MAJOR | Bursty/sparse "tall sparse tree" has no beauty spec; consistency=beauty implies every archetype gorgeous |
| DV-M8 | MAJOR | Gold boundary on the tree undefined; mockup already spends gold on habit stage glow |
| DV-M9 | MAJOR | Same-family Grove trophies render identical flowers; top-tier accents are balance-only — "almost never seen" undercut |
| DV-M10 | MAJOR | Fixed 5-branch crown risks the "five-fingered tree"; leader magnitude / branch angle variance unspecced |
| DV-M11 | MAJOR | Fruit layer has no type-selection driver; 30 fruit types decorative |
| DV-M12 | MAJOR | Why-panel and ceremonies unspecced against the design system (tokens, motion grammar) |
| DV-m1 | MINOR | Tree trait palettes not theme-aware (Paper has no tree-art variant) |
| DV-m2 | MINOR | No no-video-game guard on transformations/ceremonies |
| DV-m3 | MINOR | Hero tree canvas scale/budget in the 640px column unspecced |
| DV-m4 | MINOR | Seed/sprout render not tied to the ic-seed/loader icon language |

**Cross-brief note:** DV-C1 and DV-C3 extend wave-1 C-brief M-3b (flower
coherence) and the unfilled trait drivers; DV-M2/M-5 extend wave-1 E-brief
M-2; DV-M12 extends wave-1 E C-2/m-4. The CRITICALs here are the 
design-vision commitments (principles 6, 8, 9, 12, 13, 15, 17 + the
Heartwood identity) that the locked design currently does not meet —
each is fixable within the existing locks, none requires reopening a
locked decision.