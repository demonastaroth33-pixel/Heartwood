# D — WAVE 2: ACCESSIBILITY & SURFACE LOOPHOLES (the tree for everyone)

**Hunt date 2026-09-23. Lens: THE ACCESSIBILITY & SURFACE LENS.** The tree
is the app's peak surface — the biggest, most intricate, most personal
system — and the locked design (D094 transitions, D095 seasons, D096
tier-banking, D097 launch-day, D099 caps, D088 why-panel/dormancy,
DesignSystem §12.5 a11y) assumes a fully-sighted, motion-tolerant,
large-screen user at every step. This hunt reads every surface through
seven lenses: screen readers, color/contrast, motion/vestibular,
small screens, touch targets, first-run education, and the anatomy views.

Sources: VISION.md (§15/§16, principles 5/11/16), LOOPHOLES.md (D090–D099
record), TEMP-PLANNING.md tree-7 (D085–D099 verbatim), tree-4/tree-5
skeletons, scan-outputs/05-uiux.md (the global UI contract: §11 responsive,
§12.5 a11y, §12.1 tokens, §12.2 restraint, shimmer rule, H4),
docs/DesignSystem.md (L390–398 a11y, L297–299 targets, L404–413
responsive), loophole-findings/E-ux-stage-surfaces.md (wave 1 — read and
built upon: its m-4 is the seed this file grows), ACHIEVEMENT-SCAN.md
(§1.5 identity axis, "size/color/ceremony"), PerformanceOptimizationBrief.md
(prefers-reduced-motion hook exists in the runtime).

**The locked a11y contract the tree must satisfy (DesignSystem L390–398):**
targets ≥44×44 · textSecondary-on-surface ≥4.5:1 (Ink ≈7:1), accent-on-bg
≈4.6:1 · gold only bodySmall+ with text labels · 2px accent keyboard focus
ring, desktop · **NO color-only semantics** · reduced motion handled.

**Result: 3 CRITICAL · 5 MAJOR · 4 MINOR = 12 findings.**

---

## CRITICAL

### C-1 — The tree has NO semantics surface: a canvas-rendered organism is a screen-reader void

**Location:** tree-5 skeleton (TEMP-PLANNING.md L2379–2382: "paint strategy
(canvas vs layers)"); tree-4 (TEMP-PLANNING.md L2371–2377: hero + strip +
panel; taps open feeds); VISION.md §15 (the tree IS the meta-UI: "opening a
leaf shows the memory"); DesignSystem L390–398 (the a11y contract);
05-uiux.md L245. Nothing in any tree doc mentions semantics, screen readers,
or keyboard navigation.

**The gap:** The tree renders to a canvas (the tree-5 decision space). In
Flutter, canvas painting produces **zero semantics** — the accessibility
tree is built from the widget layer, never from painted pixels. The locked
design gives the tree the app's most information-dense surface — bloom
density, dormancy state, bank count, stage, seasonal phase, per-bud tier
(D096), per-branch dormancy (D088), leaf-per-entry granularity (L-04) —
and every one of those facts is expressed visually on the hero while the
hero contributes nothing to the screen reader. A blind user on the tree tab
hears only the strip and panel (if those are widgets) and a blank canvas:
**the tree itself — the app's soul — is inaccessible.** Every organ is
also a navigation affordance (VISION §15: leaf → memory, branch → domain
feed); a canvas with no semantics makes every one of those feeds
unreachable by assistive tech. Wave-1's m-4 (E-ux m-4: "reduced-motion and
a11y are unaddressed for the tree's moments") called this MINOR; it is not —
it is the tree's entire surface, absent.

**What breaks:** screen-reader users cannot (a) know the tree exists with
content, (b) read any organ's status (a bud's tier, a branch's dormancy, a
leaf's date), (c) reach the feeds the tree navigates to, (d) get any
summary of "why the tree looks this way" without manually tabbing to the
why-panel. Keyboard users get no focusable organs. Voice-control users
cannot say "tap the gym branch."

**Proposed contract — the a11y surface spec (grounded in the locks):**
1. **The renderer publishes a semantics model, always.** The canvas is
   wrapped in a semantics structure built from the SAME deterministic
   tree-state model that drives the paint (one source, two outputs — the
   D088 duality discipline applied to a11y). No canvas node is painted
   without a matching semantic node; the tree-state model gains a
   `semanticLabel` + `semanticStatus` per organ as derived fields.
2. **Per-organ semantics (the full hierarchy):** every organ gets
   label + status, one Semantics node per tappable:
   - branch-bud / branch: "gym branch — not yet extended" | "gym branch —
     dormant since June" | "gym branch — 3 years, 12 leaves" (M-5 wave-1's
     four-state taxonomy is the status vocabulary — never color-only);
   - leaf / leaf-cluster: "leaf — July 2025" | "cluster — 12 entries,
     June 2025" (D099 countable-cluster grammar);
   - bud: "habit bud — 'run' — resting" (D087);
   - achievement bud: "Grove bud — Dragon Slayer — blooms at the next
     annual bloom" (D096/D092 schedule language, verbatim from the
     why-panel's existing copy);
   - flower / fruit / ring: tier + family identity (D091 overlay) + date.
   Each node carries `button` + the same tap action as the visual organ
   (feeds, why-panel detail), so VISION §15 navigation is preserved.
3. **The whole-tree summary node (the "portrait"):** the hero's root
   semantics = one concise derived sentence per stage — e.g. "A 3-year-old
   pole-stage tree, spring; 5 branches, 12 twigs, 47 leaves, 3 banked
   buds (2 Sprout, 1 Grove); 2 rings." The portrait text IS the strip's
   glance set (M-6 wave-1) plus season phase — see C-3. Readable first
   (read-aloud order: portrait → strip → panel).
4. **Density disclosure, not enumeration:** a full leaf-granularity crown
   must NOT emit hundreds of leaf nodes into the semantics tree (screen-
   reader tab-storm). Semantics aggregation follows the SAME LOD as the
   paint: at crown scale, semantics = per-branch + clusters (counts);
   entering the zoom/entry scale (M-4 wave-1 discrete steps) exposes
   per-leaf nodes — zoom-in materializes semantics, exactly as it
   materializes objects.
5. **Tooltip semantics for clusters** — the app's precedent "dots =
   semantic tooltips" (DesignSystem L396) extends to bud/leaf clusters
   ("12 habits in this cluster" — D099 language).
6. **Keyboard map:** the 2px accent focus ring (DesignSystem L395) applies
   to focused organs; tab order = portrait → strip → organs in reading
   order (branch-buds → branches → leaves/clusters → buds → flowers →
   fruits → trunk); Enter/Space = the tap action; arrows navigate within
   the crown at the current zoom step; zoom steps themselves are focusable
   controls (M-4: "reduced motion = steps only" — also keyboard-only
   usable). One primary action per screen rule holds (DesignSystem L299):
   the tree's own primary is the focused organ's action.

---

### C-2 — Stage transitions have no announcement story: D094's static fallback is silence, and the why-panel is passive

**Location:** D094 (TEMP-PLANNING.md L2579–2629: every transition = "a
designed moment"; reduced-motion = "the state changes instantly, no
animation"; "the why-panel carries the story either way"); D097
(L2720–2759: the 20–40s veteran replay, "Why-panel narration: '2029 — your
first year'"; reduced-motion fallback = "jump straight to the current
state"); D092 ("the Coach line fires at the EARN; the bloom is silent
visual"); E-ux C-2/M-7 (replay-on-open + viewed watermark — wave-1).

**The gap:** D094's reduced-motion fallback says the STATE changes
instantly and the why-panel "carries the story." But a screen-reader user
never sees the state change (no animation to see) and the why-panel is a
passive text surface — nothing announces. The four designed moments
(germination, first branch, first bloom, old-growth) and the D097 replay
are **silent events for assistive tech**: no announcement, no narration
read-aloud, no focus move. The brief's exact question — "how do they
announce to a screen-reader user (the AUDIO/semantics fallback is
undefined)" — has no answer in any doc. D092's "the bloom is silent
visual" is doubly wrong for this population: the claim fires with a Coach
line (text, fine), but the bloom itself — the single most promised moment
in the design — has no text twin event. Reduced-motion users (sighted)
also lose the D097 replay's emotional content by the lock ("jump straight
to the current state") — the legend card (D097(6)) survives, but the
"most moving moment the app has" is skipped for them with no alternative
beyond one card.

**What breaks:** a screen-reader user's tree grows invisibly; the first
bloom (the earned cherry-blossom moment) passes with zero signal; the
"grew while you were away" replay (D094 replay-on-open) is a silent
replay; the veteran's launch-day journey (D097) is a blank. The moments
the design calls "milestones" (VISION principle 5) are milestones for the
eyes only.

**Proposed contract — the announcement & narration spec (grounded in D094's
own fallback discipline, "no content lost, why-panel carries the story"):**
1. **Announcement event = the transition's text twin.** Every D094 moment
   carries a derived one-line narration (the why-panel's existing copy IS
   this text — germination: "Your tree germinated — the first log grew
   it."; first bloom: "Your tree bloomed — 7 buds burst into flower.").
   On delivery (live or replay-on-open) the app announces it through
   Flutter's live-region/semantics-announce path — **in-tab only, in
   sequence with the visuals, once per viewed watermark** (the D094
   anti-spam discipline: nothing repeats).
2. **The "grew while you were away" card (D094) is the announcement
   carrier** — it already exists as a text card; it becomes the semantic
   home of the replay: focused on card arrival, its lines narrated
   (D097's "2029 — your first year — the gym branch grew" grammar),
   one concise card, silent visuals (D094 notification story preserved:
   no push, ever — in-tab + the single weekly surface only).
3. **Reduced-motion + screen-reader users get the narration without the
   visuals**: transitions render as instant end-states (D094 lock) AND the
   narration line is announced; the D097 replay's reduced-motion fallback
   becomes "jump to current state + the full narration + the legend card"
   — the journey's story is never skipped, only its motion.
4. **The bloom's "silent visual" clause (D092) is amended for a11y**: the
   bloom is silent VISUALLY but announced semantically — "your tree
   bloomed: [n] flowers — [tier/family list], the rarest: [name]" (D096
   bank-composition grammar). The Coach line at earn stays unchanged.
5. **No autonomous audio**: the app has no audio layer; "audio fallback"
   is realized as the screen-reader's own speech of the announced text —
   the contract is that the text EXISTS and is announced, not that the app
   speaks.

---

### C-3 — Seasonal phase and the rarity "legend" look are color/glow-only on the tree surface: a deuteranope cannot tell spring from autumn, and the strip omits the season

**Location:** D095 (TEMP-PLANNING.md L2630–2672: per-organ seasonal states;
autumn = leaf-fall + color; spring = bloom; winter = bare + winter-
persistent fruits); D085 ("every tree blooms in spring; THIS density is
your March journaling" — the why-panel density line); D096 (L2694–2702:
"TIER-VISIBLE BANKING: every banked bud wears its tier's visual weight…
the Grove bud is the tree's legend before it blooms"; "glowing with its
family's flower form"); ACHIEVEMENT-SCAN L37 ("size/color/ceremony within
the family"); D094(5) strip content (TEMP-PLANNING.md L2623–2626: branch
state, bank count, stage name, next-tick progress — **no season line**);
DesignSystem L396 ("NO color-only semantics"); E-ux M-5 (dormancy
text-label rule — resolved, wave-1).

**The gap:** The tree's season identity on the hero is carried by canopy
color: spring green (accent family) → autumn reds → winter bare. Autumn vs
spring differ ONLY by hue for a fully-sighted user; for a deuteranope
(red-green deficiency — the most common form) a green canopy and a red
canopy can be near-identical, and leaf-presence (the surviving shape cue)
distinguishes winter but NOT spring from autumn. The overview strip — the
text surface that carries every other identity fact (stage, bank, next
tick) — omits the season (D094(5) enumerates its contents; season is not
among them). The why-panel's density line ("THIS density is your March
journaling") assumes the reader already knows it's spring. Second, the
D096 "legend" look: a Grove bud is "larger, marked, glowing" — the
"glowing" is a luminance cue (survives deuteranopia) but tier distinctness
in the banked buds rests on visual weight + family identity, and the
bloomed flowers' tier + family ride "size/color/ceremony" — any tier or
family fact whose only surface expression is chroma violates the locked
no-color-only rule. Third, autumn-vs-winter fruit distinction (D095(3):
winter-persistent fruits hang on bare branches) is a shape cue — fine —
but the D095 winter leaf-buds ("bare winter branches ARE covered in
buds") vs dormant habit buds vs achievement buds: three bud kinds on one
bare tree, distinguished in winter by what will be shape/size/color only.
Nothing states the text twins on the tree surface itself (the why-panel is
tap-away, and per-organ semantics from C-1 are the only place the surface
can speak).

**What breaks:** colorblind users lose the season rhythm (the locked
"seasonality is real and apparent" — VISION principle 6 — fails for them:
it's real but not apparent); the Grove bud's "legend" status is guessable
only by proximity to the bank counter; post-bloom rarity (the whole
rarity economy, D092/D089) degrades to size-only; low-vision users in
autumn see a uniformly dark mass (see M-5).

**Proposed contract — every color-coded fact gets a surface twin:**
1. **The strip gains the season line** (D094(5) is extended, not
   contradicted): "Spring — 12 blooms this season" / "Autumn — leaf-fall
   month" / "Winter — resting; everything banks to spring" (D095 copy
   grammar). The strip is widgets — text is accessible for free; this one
   line closes the season gap for ALL users (sighted users get the label
   too — the "every color-coded fact has a text twin" verification rule).
2. **Per-organ semantic status carries the season-state of the organ**
   (C-1's status field): "winter leaf-bud — March entries waiting for
   spring" (D095(2) language), "flower bud — earned in winter, blooms when
   the tree wakes" (D095(1) verbatim).
3. **Tier identity is never chroma-only**: the D096 "legend" look is
   implemented as SIZE + MARK (the family's flower form in miniature is
   already the spec's own non-color twin — D096(1) "its flower's shape in
   miniature") + the semantic label. Glow is a luminance accent, not the
   carrier (and see m-2 — glow conflicts with the restraint contract
   anyway). The verification rule: **delete the color channel in review
   (a deuteranopia simulation pass in the archetype-mockup step, Step 4)
   and every fact must survive via shape/size/text.**
4. **Bloom density keeps its existing text twin** (D085's why-panel
   density line) and is additionally announced in the portrait (C-1) and
   the bloom announcement (C-2): "this spring: 47 blooms — dense (your
   March journaling)". No new surface, no new storage — derived text of
   the existing derived facts.

---

## MAJOR

### M-1 — Touch targets at crown density are unguaranteed: the LOD has no minimum-hit-area contract, and D099 clusters/zoom steps inherit the void

**Location:** DesignSystem L297–299 + L392 ("touch targets ≥44 everywhere",
"All interactive targets ≥44×44 logical px"); 05-uiux.md §11 (breakpoint,
parity); L-04 (LOOPHOLES.md L99–103: per-entry leaves at POLE+ = "full
leaf granularity"); D099 (N-4b: bud clusters "with individual buds revealed
on zoom"); M-4 wave-1 (discrete zoom steps); tree-5 (LOD — "twig LOD"
TEMP-PLANNING.md L3066; "decade-scale data cost bounds").

**The gap:** "Touch targets ≥44 everywhere" is a locked global rule; the
tree's own density design can make it physically unfulfillable, and no doc
says how. A MATURE crown at per-entry granularity on a 375px screen:
hundreds of leaves, each a real tap target (VISION §15: leaf → memory) —
at 100+ leaves in a ~300px crown, individual leaves are 3–8px. Taps are
then impossible or mis-hits; a "tap the memory" miss opening the wrong
day's feed is worse than no target (silent wrong-destination). D099's bud
clusters get a "countable surface" but no tap-area rule; the zoom ladder
(M-4 wave-1) unlocks finer objects but nothing guarantees the finest step
still yields 44px targets — a zoom step whose objects are sub-44px is a
dead step. The trunk (life summary), branch-buds (feeds), flowers (trophy
detail) — all locked tappable, all without a minimum at any stage or
density. Desktop hover states (DesignSystem L407) are fine; the touch
problem is mobile-first and unaddressed anywhere in tree-4/tree-5.

**What breaks:** at any density where a user cannot cleanly hit an organ,
the tree's navigation function (VISION §15) collapses; the mis-hit
frustration loop (tap → wrong feed → back → tap) is the fastest way a
user abandons the tree tab; the "every scale is data" promise (D088 scale
separation) fails at the scale where it matters most (the memory surface).

**Proposed contract — the hit-area LOD (grounded in the LOD itself):**
1. **Hit areas are decoupled from painted size.** The LOD computes, per
   zoom step, a MERGED hit-area map: organs within proximity threshold
   merge into one ≥44×44 hit target whose identity is the aggregate (the
   D099 cluster grammar: "July 2025 — 12 entries" opens the aggregated
   day/cluster feed — already the locked cluster behavior; clusters ARE
   the ≥44 answer at every scale).
2. **The invariant: at every zoom step, every tappable semantic object
   (C-1) has a ≥44×44 logical-px hit area.** Implementation rule: the
   finest step (entry scale) is allowed to reveal only as many per-leaf
   targets as fit at 44px in the hero space; the rest stay in clusters —
   i.e. the zoom step materializes objects up to the hit-budget, exactly
   as D099 caps blooms by visual budget. (A branch with 100 leaves shows
   100 leaves painted; it exposes ~14 tappable leaf targets + 3 clusters.
   Painting and hitting are different maps — the paint is the beauty, the
   hit map is the law.)
3. **Bud-cluster tap area ≥44 with the count label** ("12 habits in this
   cluster" — D099 verbatim) — the cluster is a button; individual bud
   targets appear only at the zoom step where 44px fits.
4. **Mis-hit defense:** the hit map is exclusive (no overlapping ≥44
   targets); when two organ targets genuinely overlap (dense crown), the
   nearer-to-viewer + larger organ wins and the loser merges up into the
   parent cluster target — never a dead pixel between targets.
5. **The trunk and branch-buds carry ≥44 at every stage** (they are the
   day-1 targets — E-ux M-6's interaction map).

---

### M-2 — Small-screen states are undefined: a 375px iPhone has no spec for the hero, the strip, the panel, or the anatomy views

**Location:** 05-uiux.md §11 (L3–5 parity: "experience roughly equal on
iPhone installed PWA and Windows desktop"; breakpoint <800 mobile / ≥800
desktop — ONE breakpoint; D:L404–413 mobile rules: full-width, padding 16);
tree-2 skeleton "iPhone PWA ↔ desktop responsive behavior" (07-ledger.md
L1401–1402 — listed, never designed); tree-4 (hero + strip + panel);
VISION.md §16 (the five anatomy views); E-ux wave-1 (M-3 stage gates,
M-4 zoom, m-5 hero-never-collapses).

**The gap:** The app's responsive contract has a single breakpoint (800)
and desktop content rules (640px column); the tree tab adds a second
vertical layout (hero + strip + panel) and a data-dense hero that scales
with years (D088 twigs: ~10 twigs/year per active branch; decade-scale
crown in a 375px space). Nothing defines: (a) the hero's height/scale on
a phone (a mature crown vs a 200px hero — the tree-2 "decade scale
without cramping" question is unanswered for 375px), (b) the strip's
small-screen form (D094(5) strip content at 375px: five branch chips +
bank counter + stage + next-tick progress — does it wrap, scroll
horizontally, or collapse to a compact row?), (c) the detail/why-panel at
375px (bottom sheet vs in-flow — the app's mobile precedent for panels is
the bottom sheet, D:L239, but nothing says the why-panel uses it), (d) the
anatomy views on a phone (the trunk cross-section, stem, root, leaf
cross-sections are detail-heavy surfaces — VISION §16 — with no phone
layout: full-screen pages? paged carousel? stepper?), (e) landscape phones
(a 667×375 viewport — the crown goes wide and short; the strip and hero
must rebalance), (f) dynamic type (iOS text scaling at 200% on a 375px
strip = chip overflow — no wrap rule). Wave-1's E-ux touched small screens
only via M-4 (zoom gestures) and m-5 (hero never collapses); the layout
states themselves were never verified — this finding deepens exactly
there.

**What breaks:** a phone user's tree tab is either a cramped hero with a
scrollable strip (breaking the "one glance" strip promise), a why-panel
that never surfaces without a sheet decision, anatomy views that render
as desktop layouts at 375px (overflowing cross-sections), and text-scale
users who lose the strip's numbers. The locked parity promise (U:L3–5)
fails on the app's most important surface.

**Proposed contract — per-surface small-screen states:**
1. **Hero:** phone height = 40% of the viewport, min 220px, max 320px;
   the crown scales to fit with the LOD (M-1) — the "decade scale without
   cramping" is solved by the zoom ladder, not by shrinking the tree:
   the phone hero defaults to the whole-tree step, and the strip is the
   scroll of record.
2. **Strip (phone):** compact two-line form — line 1: stage + season +
   next-tick progress; line 2: horizontally scrollable branch/bank chips
   (each ≥44px, the app's chip grammar); never wraps into a wall.
3. **Why-panel / detail (phone):** the bottom sheet (DesignSystem L239
   sheet grammar — radiusXl, drag handle, max 92% height) — the panel IS
   the sheet on mobile; desktop keeps the in-flow panel. Sheet content =
   the same detail spec (M-6 wave-1).
4. **Anatomy views (phone):** full-screen pages, one view per page, the
   app's pager/back semantics; cross-sections render at up to 100% width
   with the legend (m-1) collapsible; the time-lapse keeps the D094
   replay controls. Landscape: hero left / panel right split.
5. **Dynamic type:** strip chips and the why-panel tolerate 200% text
   scale (wrap → scroll, never truncate numbers — the tabularFigures
   rule, D:L214, holds: numbers stay whole).
6. **Everything above is a second breakpoint (<480px) added to the locked
   shell** — a tree-local rule, not a shell rewrite (the deferred nav/
   ordering lock is untouched).

---

### M-3 — Motion tiers are incomplete: no middle path, no particle policy for the bloom rain, no reduced-motion spec for the D097 replay narrative

**Location:** D094 (TEMP-PLANNING.md L2613–2618: reduced-motion = "state
changes instantly, no animation"; durations germination ~3s, transitions
~2–4s, first bloom ~8–12s — "soft bloom rain"; "Nothing loops, repeats,
or spams"); D097 (L2740: "reduced-motion fallback = jump straight to the
current state"); DesignSystem L218 ("reduced motion → all durations 0,
drift off, loader static"); tree-5 (reduced-motion lock); Performance-
OptimizationBrief.md L42 (prefers-reduced-motion is reported by the OS —
the hook exists).

**The gap:** The lock is binary — OS says reduce, everything is 0. The
brief's question: users who want SOME life (the middle path). The app's
own precedent already knows a middle tier exists (DesignSystem L121:
"under reduced motion" for atmosphere — off; the loader's "reduced motion
= static mark 300ms fade, still 2s" — a STATIC-FADE middle behavior in the
locked loader!). Three concrete holes: (a) **the bloom rain is a particle
effect** (D094 "soft bloom rain") — particles are the highest vestibular
risk in the app's entire motion vocabulary, and no policy exists (count,
speed, screen coverage, off-switch); (b) **the middle path is undefined**
— what a reduced-motion user MAY still get: a slow gentle non-looping
fade? a still end-state with a progress bar? (the loader precedent says:
static state + 300ms fade + full duration kept); (c) **the D097 replay's
reduced-motion story**: the fallback jumps to the current state — correct
per the lock — but then the narration (why-panel lines) must carry the
journey (C-2 covers the announcement; the motion side is: reduced users
skip the 20–40s replay entirely — fine — but the first-bloom's 8–12s is
the ONE long moment; under reduced motion it becomes an instant end-state
and the "earned cherry-blossom moment" has zero felt weight — the lock's
"no content lost" needs a felt-content equivalent for motion-sensitive
users). Vestibular: the Ink drift (DesignSystem L229, off in reduced
motion — locked OK), the pop scale 1→1.15→1 (habit burst — mild, kept),
the bloom rain (undefined), the growth waves (M-7 wave-1: ≤4s instanced
procedural animation — undefined motion-class).

**What breaks:** motion-sensitive users (vestibular disorders, migraine
trigger, the reduced-motion setting's actual medical purpose) hit an
unbounded particle effect at the app's most emotional moment — the exact
population the reduced-motion lock exists to protect; users who want some
life get a binary kill; the first bloom's weight is erased for them with
no substitute (the why-panel line is information, not felt event).

**Proposed contract — the three motion tiers (grounded in the locks and
the loader precedent):**
1. **Tier definitions (one OS signal, three outcomes):**
   - FULL (no OS reduce): D094 durations as locked; bloom rain at the
     particle budget (below); growth waves ≤4s (M-7 wave-1).
   - REDUCED (OS reduce, default): ALL motion becomes instant end-states
     EXCEPT the three locked tolerances: the 300ms static fade (the
     loader precedent verbatim), the 2s loader timing (locked), and the
     first-bloom's ONE slow non-looping gentle fade-in of the end-state
     (≤3s, no movement, no rain, no scale) — the "felt moment" without
     motion; bloom rain = replaced by the end-state + announcement
     (C-2). Ink drift off (locked). Zoom = steps only (M-4 wave-1,
     locked).
   - NONE (OS reduce + user's in-app "no motion" choice — a tree-tab
     setting, or Settings → GENERAL per the H4 discipline with a
     DecisionLog entry before any new setting): also kills the 300ms
     fade and the 2s loader timing on the tree tab only; everything is
     state-swap.
2. **The bloom-rain particle policy (FULL tier):** particles confined to
   the hero canvas (never the full viewport), ≤120 particles, fall speed
   ≤ 30px/s, no screen flash, total event ≤8s, hard-cap by D099's visual
   budget (waves, not floods — the bloom season already waves); the rain
   is a hero-local ambience, never an overlay on the strip/panel (the
   restraint contract's "ambience never touches text," D:L39).
3. **The middle path is REDUCED tier by default** (OS-reduce users get it
   with zero extra settings); the "some life" users (OS not set but
   sensitive) get FULL tier with the bloom-rain particle budget halved —
   expressed as the existing Settings → GENERAL preference if and only if
   a DecisionLog entry approves the setting (the tree adds no new
   settings otherwise — D094's discipline).

---

### M-4 — First-run education has no contract: the tree teaches nothing until it grows, and no one has specified what a new user is told, in what order

**Location:** D094(1) (TEMP-PLANNING.md L2581–2588: the day-1 why-panel
line "This is your tree. It grows from your life — log anything, and it
begins." — the ONLY locked teaching copy); D094(2) (germination "the first
log visibly grows the tree — the hook"); G7 welcome (05-uiux.md L196:
3 steps — what PersonalOS is / habits / journal entry; E-ux m-3: "the
welcome flow mentions the tree in one line (step 1)"); D096 (the bank is
"a living part of the tree"); D097(6) (the legend card); E-ux C-1 (the
bank must never be invisible — resolved wave-1).

**The gap:** A new user knows none of the rules: the bank, the buds, the
stages, the seasons, the rarity ladder, the why-panel's existence. The
locked design assumes each surface teaches by existing (the why-panel
line, the bank counter, the strip) — but nothing specifies the EDUCATION
SEQUENCE: what is told, when, in what order, how many facts per moment,
and what happens if the user never opens the tree again until the first
bloom (year 2+). The failure modes are concrete: (a) the day-1 user sees
the strip's "5 buds banked" and doesn't know what a bank is or why it
should matter — the why-panel line is present but the BANK concept (the
master principle!) is not introduced by any locked copy; (b) the first
bloom at maturity can be YEARS after first run — the user who logged in
that whole time may have forgotten the buds entirely — the bloom then
reads as noise, not payoff (the "earned cherry-blossom moment" needs the
anticipation to exist); (c) the seasons arrive silently (a seedling's
first autumn — E-ux C-3's resolved copy "resting, not failed" — is
passive text, not a taught lesson); (d) nothing teaches the duality
(D088 — the habit card IS the bud) or the why-panel's "tap anything to
ask why" affordance; (e) screen-reader users (C-1/C-2) get the same
education only if it's text-first — no visual-only teaching allowed.

**What breaks:** the tree's reward loop (the design's entire emotional
payload) depends on the user UNDERSTANDING the bank → bloom → rarity
chain; an untaught user experiences the tree as a random-shape generator,
the exact "zombie mishmash"/meaningless failure the cohesion principle
exists to prevent — meaninglessness, not ugliness, is the silent killer
here.

**Proposed contract — the education ladder (chronological, one fact per
moment, text-first, never a tutorial overlay):**
1. **Welcome (G7, step 1):** the existing one-line tree mention becomes
   the promise line — "Your life grows a tree here — every entry feeds
   it" (no rules taught; the promise only).
2. **Day 1 (D094(1) copy, locked):** the why-panel line + ONE added
   concept line introducing the bank: "Achievements you earn before your
   tree can flower are banked as buds — they bloom together when the
   tree matures." (The master principle in one sentence — E-ux C-1's
   "bank is never invisible" now includes a taught definition.)
3. **First germination (D094(2)):** the cause-effect lesson — the
   announcement (C-2) doubles as the teaching: "Your first log grew your
   tree — it grows from your life." No more facts.
4. **First autumn / winter (E-ux C-3's resolved copy):** the rest-lesson
   — "Your tree rests — winter banks everything to spring." (The season
   line in the strip, C-3, is the ongoing reminder.)
5. **First bloom (D092/D094):** the payoff lesson — the bloom
   announcement (C-2) narrates the bank→bloom conversion: "7 buds burst
   into flower — these were your earned achievements, waiting for
   maturity." The rarity lesson (D096's Grove legend) is taught HERE,
   when a legend exists to teach with.
6. **The why-panel affordance is taught once, at day 1:** "Tap any part
   of the tree — it will tell you why it looks this way." (One line in
   the day-1 panel; the affordance is the why-panel's existing purpose,
   VISION principle 11.)
7. **Never overloaded:** one concept per moment (the ladder above is the
   order); every lesson is one line; every lesson is text (screen-reader
   reachable — C-1/C-2); nothing is a separate tutorial screen; the
   ladder IS the tree's natural chronology, so a user who opens the tree
   yearly still receives each lesson at its moment.
8. **The veteran (D097 legend card)** is the same ladder compressed —
   the legend card's lines ARE the taught facts for pre-existing users
   (their "day 1" is launch day).

---

### M-5 — The tree's derived palettes have no contrast budget: autumn reds and flower colors live outside the token system, and dense-canopy legibility is unmeasured

**Location:** DesignSystem tokens (05-uiux.md L215–216: Ink/Paper — the
warm range contains ONLY warning #D9A441 and danger #E06C5F); TRAIT-SPACE
(skeleton: "trait-driven palettes: bark, leaf family, flowers" — content
not yet defined); D085 (autumn color, bloom density, data-intensity
modifiers); D086 (derived accents from the domain-balance palette);
D096 (bud visual weight, glow); DesignSystem L392–393 (contrast floors:
textSecondary-on-surface ≥4.5:1, accent-on-bg ≈4.6:1).

**The gap:** The locked a11y contract defines contrast floors for UI
tokens. The tree's art is a separate palette system (trait-derived,
composite-species colors, autumn reds, flower family colors, derived
accents) with **no contrast floor of its own** and no doc stating whether
the UI floors apply to it. Concrete failures this invites: (a) autumn
reds/oranges on the dark Ink background — a red canopy at ~30% luminance
on #0D110F can fall under 3:1 for the shapes it must separate (low-vision
users lose the canopy entirely — "a uniformly dark mass" in autumn);
(b) flower colors against a dense green canopy at bloom density (the
bloom is the tree's most important visual signal — if flowers don't
separate from foliage at 4.5:1, the bloom is invisible to low-vision
users); (c) the derived accents (D086) are data-colored with no luminance
guard — a dark accent on a dark canopy erases the achievement's accent;
(d) bloom-density gradients (D085 intensity) are luminance-driven by
design — fine for colorblind users, but their MINIMUM separation step is
undefined (a "dense vs sparse" distinction that needs ≥1 step of
luminance delta is a spec number, not a doc anywhere); (e) the Paper
(light) theme — the tree must re-derive its palettes for light bg; the
contrast problem inverts (pale flowers on white).

**What breaks:** low-vision users lose the canopy, the bloom, and the
rarity accents — the tree's three information layers — precisely in the
seasonal states where the design promises the most (autumn color, spring
bloom). The locked "contrast textSecondary ≈7:1" gives no protection
because tree art is not text.

**Proposed contract — the tree-palette contrast floor (a tree-5/trait-
space rule, not a token rewrite):**
1. **The UI floors apply to the tree as minimums:** every tree-art
   element that carries derived meaning (flowers vs foliage, autumn
   canopy vs background, tier accents, bloom-density steps) must hold
   ≥3:1 against its local background for NON-TEXT elements and ≥4.5:1
   where the element is text-like (labels, count badges) — the WCAG
   non-text floor, applied to the tree's information layers.
2. **The luminance guard on derived accents (D086):** accents derive
   within a luminance band (e.g. L* ≥ 45 on Ink) so data-colored accents
   can never sink into the canopy; the band is a trait-space constant
   verified in the archetype-mockup pass (Step 4).
3. **Density steps are luminance steps:** D085's intensity modifiers
   quantize to ≥2 discernible luminance levels on the canopy (the
   calendar tint's 4-level quantization, 05-uiux L141–147, is the
   precedent — same owner discipline, tree-local).
4. **Both themes:** the palette system ships with Ink AND Paper variants
   (the theme registry swap, D:L356–363) — a light-theme tree is not a
   brightness-inverted afterthought; contrast is verified per theme in
   the seeded-data stress tests (LOOPHOLES §6 step 6).
5. **Verification is part of the existing gates:** the deuteranopia
   simulation pass (C-3) + the luminance checks run in the archetype
   mockups and the seeded-data stress tests — no new ceremony, just the
   missing lens on the locked gates.

---

## MINOR

### m-1 — Anatomy views have no legend/labels: cross-sections are botanical jargon for a non-expert, and the why-panel's role per layer is undefined

**Location:** VISION.md §16 (the five anatomy views, "data-mapped: the
trunk's rings and vascular bundles show year/nutrition state, the root's
stele shows the foundation state, the leaf's palisade/stomata show its
life state"); E-ux M-3 (stage gates — resolved wave-1: which views exist
when); SCHEMA.md §8 (mapping skeleton); DesignSystem L396 (no color-only).

**The gap:** The views are data-mapped (locked) and stage-gated (wave-1
resolved), but nothing labels them for the user who doesn't know what a
stele, a palisade, or a vascular bundle is. The wave-1 M-3 resolution says
"renders primary structure + vascular bundle ring" — a user looking at a
cross-section of bundles cannot connect them to "your nutrition, this
year, this rich" without labels. The why-panel's role: VISION 11 says the
user can always see WHY — but the anatomy layers need BOTH the "what"
(label/legend) and the "why" (the panel's data line) — the "what" layer
is unspecified, and per-layer semantic labels (C-1) have no anatomy
extension.

**What breaks:** the anatomy mode (a locked principle-16 surface) is a
wall of unlabeled shapes — the "beautifully corresponds to what the user
input" promise degrades to decoration for any non-botanist (the whole
user base).

**Proposed contract:** each anatomy view carries a collapsible legend
(toggle, one line per layer: "vascular bundles — your nutrition, this
year"; "ring 2024 — a fully-logged year"; "pith — where it all started")
+ the why-panel's existing data line per tapped layer; the legend is text
(accessible for free, C-1 applies — anatomy layers are semantic groups
with labels); the legend collapses by default on small screens (M-2),
expands on tap; the D094 "one primary action" rule maps to "tap a layer
to ask why."

---

### m-2 — D096's "glowing" Grove bud conflicts with the locked no-glow rule and the gold ban; the legend look needs a non-conflicting carrier

**Location:** D096 (TEMP-PLANNING.md L2694–2702: "larger, marked,
glowing with its family's flower form"; "the Grove bud is the tree's
legend"); DesignSystem L224 ("no glow, no drop-shadow text" — restraint
contract) + L34/L81/L190 (gold = streaks ONLY); loophole-findings/
D-gamification-timeline.md m-07 (resolved: "the tree must not use gold
for achievement visuals; derived accents exclude a gold palette").

**The gap:** The D096 language and the restraint contract contradict:
"glowing" vs "no glow"; and the glow-as-legend cue sits next to the
locked gold ban (a glow is luminance, not gold — but the *visual
family* of gold-glowing-legend is exactly what the ban and the
gamification resolution forbid, and a gold-adjacent glow on the Grove
bud will read as a streak-gold violation to any reviewer of the
archetype mockups). The tier-distinction work is already done in
D096's own words — "larger, MARKED, [family form in miniature]" — the
glow is redundant AND conflicted.

**What breaks:** a mockup that honors "glowing" fails the restraint
review; a mockup that honors the contract loses the "legend at a glance"
promise unless the marked-shape carrier is explicitly the law.

**Proposed contract:** the legend look = SIZE + MARK (the family flower
form in miniature — D096's own second carrier) + the semantic label
(C-1); glow is dropped in favor of a luminance ACCENT (a 1-step brighter
outline, within the C-3 luminance discipline, never gold, never bloom —
D-gamification m-07 stands). One line in the trait-space doc settles the
conflict.

---

### m-3 — No keyboard focus-order spec exists for the tree canvas; the focus-ring rule is unfulfillable without it

**Location:** DesignSystem L395 ("Keyboard focus: 2px accent outline,
desktop") + L408 ("visible keyboard ring 2px accent"); tree-4 (interaction
map — E-ux M-6 wave-1 covers TAPS only); C-1 (this file — the semantics
contract).

**The gap:** The focus ring rule exists globally; the tree's canvas has
no defined focusable surface, no tab order, no arrow-key semantics, and
no focus-visible handling for a painted (non-widget) object. Wave-1's
interaction map (M-6) enumerated tap targets by stage but never keyboard
equivalents. A desktop keyboard user's tree tab = tab through strip and
panel, and the hero is a dead zone.

**What breaks:** desktop keyboard-only users (a real cohort for a
logging-heavy app) cannot navigate the tree at all; the "2px accent
outline" rule silently never applies to the app's largest surface.

**Proposed contract:** fold the focus map into the C-1 semantics spec as
its own section (tab order + arrow navigation at the current zoom step +
Enter/Space activation + the 2px accent ring rendered ON the canvas for
the focused organ — the ring is a paint-layer concern, cheap on canvas).
Verified by a keyboard walkthrough in the tree-6 widget-test plan.

---

### m-4 — The strip and why-panel have no dynamic-type behavior at small widths; numbers must never truncate

**Location:** DesignSystem L404–413 (mobile: full-width, padding 16) +
L214 (tabularFigures for numbers); D094(5) (strip content); M-2 (this
file).

**The gap:** The strip's numbers (bank counts, stage, next-tick progress)
and the why-panel's body at 200% iOS text scale on 375px have no wrap/
scroll rule. Truncated bank counts ("1.2k→1…") or clipped stage names
break the numbers-led glance (L-12 wave-1) — the strip's whole purpose.

**What breaks:** large-text users lose the glance facts; the numbers-led
promise (L-12) fails at exactly the population it should serve.

**Proposed contract:** one rule — the strip and why-panel wrap and
scroll, never truncate a number or a stage/season label; tabularFigures
keep their digits whole (the count is a fact, not a layout convenience);
verification in the widget tests at 200% text scale (tree-6).

---

## Summary

| ID | Severity | One-line gap |
|---|---|---|
| C-1 | CRITICAL | Canvas tree has zero semantics surface — screen-reader/keyboard users get a blank hero and no feed navigation; no per-organ labels, no portrait summary, no keyboard map |
| C-2 | CRITICAL | Stage transitions have no announcement story — D094's static fallback is silence; the why-panel is passive; first bloom + D097 replay are mute for assistive tech |
| C-3 | CRITICAL | Season identity is color-only on the tree (strip omits the season); the D096 Grove "legend" and tier accents ride color/glow — deuteranopia loses them; no text-twin contract on the surface |
| M-1 | MAJOR | No hit-area LOD: ≥44 targets unguaranteed at crown density; D099 clusters/zoom steps inherit the void; mis-hits break VISION §15 navigation |
| M-2 | MAJOR | No small-screen states: 375px hero/strip/panel/anatomy views/landscape/dynamic type all undefined — the single 800px breakpoint cannot serve the tree |
| M-3 | MAJOR | Motion tiers incomplete: no middle path, no bloom-rain particle policy (vestibular risk), reduced-motion replay narrative unspecified |
| M-4 | MAJOR | No first-run education contract: the bank/stage/season/rarity rules are never taught; the multi-year bloom payoff arrives untaught |
| M-5 | MAJOR | Tree palettes have no contrast floor: autumn reds, flower colors, D086 accents can sink into dark Ink; density steps unquantized; Paper theme unverified |
| m-1 | MINOR | Anatomy views lack legend/labels for non-experts; why-panel per-layer role undefined |
| m-2 | MINOR | D096 "glowing" legend bud conflicts with the no-glow rule + gold ban; carrier must be size+mark+luminance |
| m-3 | MINOR | No keyboard focus-order spec for the canvas; the 2px ring rule is unfulfillable on the tree |
| m-4 | MINOR | Strip/why-panel have no dynamic-type behavior; numbers must never truncate |

**Counts: 3 CRITICAL · 5 MAJOR · 4 MINOR = 12 findings.**

**The CRITICAL list (fix order matters):**
1. **C-1 — The semantics surface** (without it, C-2's announcements have
   nowhere to land and C-3's text twins have no surface to live on — the
   renderer's semantics model is the foundation of the other two).
2. **C-2 — The transition announcement contract** (the locked D094
   "story carried either way" is half-true today: carried in text,
   delivered nowhere).
3. **C-3 — The color-only facts** (season, tier, legend — violates the
   app's own locked "NO color-only semantics" rule the moment the tree
   ships).

Wave-1's m-4 (reduced-motion/color-only a11y as MINOR) is superseded by
C-1/C-2/C-3 + M-3/M-5 — the wave-1 resolution language is absorbed into
the contracts above.