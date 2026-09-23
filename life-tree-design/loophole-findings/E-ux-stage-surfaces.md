# E — UX/UI TIMELINE LOOPHOLES (the stage surfaces)

**Hunt date 2026-08-30. Lens: the UX/UI TIMELINE — what the user SEES at
each tree stage, and the display rules.** The stage model, the banking
forms, the L-series display rules, the shimmer rule, the duality
principle, and the anatomy views are all read against the first-run and
early-stage experience. Every finding proposes a resolution consistent
with the locked design (stage-gating, L-series, shimmer, duality).

Sources: LOOPHOLES.md (stage model + matrix + resolved L-01…L-05),
INPUT-INVENTORY.md (§12, §13.1, §14), VISION.md (§15/§16, D085–D088),
scan-outputs/05-uiux.md (UI surfaces brief), scan-outputs/07-ledger.md
(tree-1..tree-7, the L-series records), scan-outputs/04-roadmap.md (M9),
SCHEMA.md, research-botany (A-seed, B-stems).

**Result: 3 CRITICAL · 8 MAJOR · 5 MINOR = 16 findings.**

---

## CRITICAL

### C-1 — The day-1 tree render is undefined AND internally contradictory (the first-run experience has no spec)

**Location:** LOOPHOLES.md L41–48 (stage table, SEED row), L93–97 (L-03);
tree-4 skeleton 07-ledger.md L1416–1422 ("First-run / sprout state,
empty states" — listed, never designed); VISION.md L46 (day-1 beauty +
botanical honesty).

**The gap:** The stage table's SEED row says branch capacity "0 (5
branch-buds on the trunk)" — a SEED rendered with a trunk and five
branch-buds. L-03's own resolution language says the contrary: "the
SEEDLING's architecture is set, growth varies — real botany". Real
botany agrees with L-03's framing: a seed has NO shoot system, no
trunk, no buds — it has a testa, cotyledons, a radicle, a plumule
(research-botany A-seed). So the design is internally split on what a
day-1 user literally sees:

1. **The seed visual** — bare seed? seed + stem + 5 nubs? cotyledons?
   Nothing in any doc specifies the day-1 render.
2. **The 5 branch-buds** — do they exist on day 1 (per the table) or at
   germination (per botany)? Do they carry section identity (labels?
   colors?) or are they 5 identical nubs? The day-1 tree's only
   differentiated content, undefined.
3. **Banked-state visibility** — the master principle promises "data is
   never lost and never unrewarded — it is BANKED in stage-appropriate
   form". But per the matrix (LOOPHOLES L61–69), at SEED: class 1
   entries = "banked (no leaves yet)", class 2 completions = "banked",
   class 3 measurements = "banked". The SEED stage's only VISIBLE forms
   are the 5 branch-buds and achievement buds (class 6 = "achievement
   BUDS"). So a day-1 user who checks a habit and writes an entry sees
   ZERO tree change — the bank is invisible. "Never unrewarded" needs a
   visible bank (why-panel counters, branch-bud swelling, a pending
   count on the buds). Undefined.
4. **The why-panel at day 1** — copy exists for achievement buds
   ("blooms when the tree reaches its flowering stage", L-05) but for
   the seed, the branch-buds, the trunk, and the banked counts nothing
   is specified.
5. **Day-1 reward loop vs VISION L5** ("must NOT change visibly across
   a month") — the SEED stage is "first days" with a static render;
   the first visible change is the seed→seedling transition. If that
   transition is un-timed and undecorated (C-2), the first week is a
   static nub-tree.

**Resolution (locked-compatible):** Write the first-run spec: (a) SEED
= the seed in soil + two cotyledons + the 5 branch-buds rendered as a
stylized POTENTIAL crown (small, ghosted-but-real nubs at the shoot
apex — the "architecture preview" the L-03 lock intends; the why-panel
says "your five branches are set from day one — they grow where you
show up"); (b) each branch-bud carries its section's identity at
branch-detail tap (never colors on the hero — restraint, see m-2); (c)
banked data is always visible as counts in the why-panel/detail strip
("3 entries banked · 2 habits checked · they become your first leaves
at the seedling stage") — the bank is never invisible; (d) the
seed→seedling transition (C-2) is the first designed moment, timed
within the first days of sustained presence, so the first week has a
milestone. The UI never collapses to nothing (see m-5): the hero +
why-panel + branch-buds + achievement buds carry the day-1 tab.

---

### C-2 — Stage transitions are designed moments in name only — no trigger, no ceremony, no replay, no notification story

**Location:** VISION.md L66–71 ("the stage transitions are the early
milestones" — principle 5); LOOPHOLES.md L33–35 (first bloom "the
earned cherry-blossom moment"); tree-3 skeleton 07-ledger.md L1405–1414
(growth animation language lists "ring closing, branch extending, leaf
appearing" — stage transitions are NOT in the trigger list); tree-4
skeleton (nothing); D088 bracts (07-ledger.md L1621–1623, "the bloom's
ceremonial presentation"); 05-uiux.md L24–25 + L248–249 (shimmer rule).

**The gap:** Three stage events are explicitly called milestones/moments
and none has a UX definition:

1. **Seed→seedling (germination)** — when does it fire (days of
   presence? first twig? calendar?) and what does the user see? Real
   botany has a gorgeous sequence: imbibition → radicle → hook →
   cotyledons → first true leaves (A-seed §5). The tree's "when
   (derived)" column says only "first days". No trigger, no visual, no
   copy.
2. **Seedling→sapling / first branch extension** — the first branch
   extending is called "a visible milestone" (L-03) and the
   achievement-scan maps a Ring-tier trophy to "a branch-level visual
   event" — the branch extension animation is un-designed.
3. **Sapling→first bloom** — the single most promised moment in the
   whole design ("the earned cherry-blossom moment", "all banked buds
   burst together"). No ceremony spec beyond the bracts/F-03 tie; no
   timing rule (it coincides with the first spring bloom — see C-3);
   no reduced-motion branch (a motion-only ceremony fails the a11y
   contract 05-uiux.md L245); no notification story — the
   one-notification constraint is itself a flagged ambiguity
   (INPUT-INVENTORY.md §14), so whether the tree may announce the
   bloom is unknown; if the user isn't on the tree tab, is the moment
   missed forever?
4. **Ring close** — the year-boundary ring is the annual heartbeat
   (D085) and the yearly review artifact; its closing moment is a tree-3
   listed trigger ("ring closing") but no ceremony or review handoff
   (the J5 year book, the weekly surface merge rule 05-uiux.md L256) is
   tied to it.

**Resolution:** A transition-ceremony contract, one per stage event:
exact trigger (derived, debounced), the on-tab moment (germination
sequence at seed→seedling; branch extension with tip growth at first
branch; bracts-wrapped bloom ceremony at first flowering; ring-close
chime at year boundary), a REPLAY-ON-OPEN rule (the last unviewed
transition replays once on next tab open — never more than the last
one, anti-spam), a static-state fallback for reduced motion (the
transition renders as its end-state + a one-line why-panel note), and
an explicit "no push notification" line in the tree's copy of the
one-notification discipline (the tree announces only in-tab + inside
the single weekly surface — never its own notification).

---

### C-3 — Season × young-tree is undefined, and the first-spring contradiction breaks the stage gate (the open hot zone, now with a visible contradiction)

**Location:** LOOPHOLES.md §7 L163–164 (open hot zone: "Seasonal cycle
vs a newborn tree — a day-1 user's autumn — nothing to shed; the stage
gate must cover season-phase for young trees"); D085 (07-ledger.md
L1452–1465: "every tree blooms in spring"); stage matrix class 6
(LOOPHOLES.md L68: achievement buds "never bloomed" until SAPLING
FIRST BLOOM); D088 dormancy L1549–1553.

**The gap:** D085's calendar skeleton says the tree blooms in spring —
but the stage gate says a SEED/SEEDLING never blooms (matrix class 6).
The contradiction is real and visible: a user who plants their seed in
February hits their FIRST spring as a seedling. Does it bloom? Per the
matrix: no. Per D085's "every tree blooms in spring" (why-panel
example: "every tree blooms in spring; THIS density is your March
journaling"): yes. Nothing reconciles them. Consequences, all
undefined:

1. **First spring as a seedling** — no bloom, and no why-panel copy to
   explain the absence ("your tree is still too young to flower — it
   blooms when it reaches its flowering stage" is the L-02/L-05
   language and must be extended to the calendar-bloom).
2. **First autumn as a seedling** — "nothing to shed": the tree has no
   seasonal leaves; does the deciduous honesty (D085 "loses its
   seasonal leaves") apply? The seedling must NOT strip its buds
   (autumn defoliation of a leafless tree is a non-event that looks
   like data loss).
3. **First winter as a seedling** — whole-tree dormancy (calendar) vs
   the young tree's "not-yet-grown" state; visually the two must differ
   (see M-5), and a growth-paused why-panel ("your tree rests through
   winter — it resumes in spring") is needed. Without it, a winter
   seedling just looks dead — the exact "failed" reading the roadmap
   bans (04-roadmap.md L1260–1261).
4. **Quiet-year semantics** — D085 "quiet year = sparse bloom, honestly
   shown": for a young tree the "sparse" modifier applies to a bloom
   that can't happen yet.

**Resolution:** Stage-aware season-phase function (this is exactly the
"stage gate must cover season-phase" hot zone): young stages render
season = growth modulation only (spring = growth-on, autumn/winter =
growth-paused with an explicit "resting, not failed" why-panel; no
leaf-shedding visuals before the tree has seasonal leaves); the first
bloom event = the first spring at/after the SAPLING stage, i.e. the
calendar bloom and the banked-bud burst merge into ONE ceremony (this
also answers C-2's timing question — the first bloom has a natural
calendar anchor); the why-panel's spring line becomes stage-aware
("every tree blooms in spring once it reaches flowering age — yours
will next year").

---

## MAJOR

### M-1 — Seed-date anchor is destructive: deleting the first entry regresses the stage clock — and deleting all entries dissolves the tree

**Location:** INPUT-INVENTORY.md §9 L202 + §14 L299–300 (locked: "the
tree's seed date follows the coach's anniversary-anchor logic (first
journal entry; deletion shifts it) — no entries = no tree"); roadmap
"rings never shrink" (04-roadmap.md L1259–1260).

**The gap:** The anchor logic is locked, but its UI-timeline
consequences are not: (a) a user who deletes their first entry shifts
the seed date → the tree's AGE changes → the stage clock moves
backward → a stage transition can visibly REVERSE (sapling → seedling)
— the tree visibly shrinks, the exact emotional whiplash the design
bans ("no guilt", "rings never shrink"); (b) a user who deletes ALL
journal entries has "no tree" — the whole organism vanishes
mid-life, including its earned rings/flowers (ring permanence vs tree
dissolution — contradictory locks); (c) batch-import (J3) and delete
flows give no warning that they touch the tree's birthday.

**Resolution:** Monotonic stage clock (ratchet — the house style, per
"rings never shrink"): the seed DATE may shift, but stages, rings,
and manifested structures NEVER regress (the why-panel shows the
original planting date, noting the anchor shift in the data line).
Tree dissolution on zero entries is prevented by the ratchet: the tree
persists as its last state with an "archived-era" note rather than
vanishing; the no-tree state exists only for never-had-an-entry users
(m-3). Add the tree's birthday to the J3 import preview and the
journal delete confirmations.

---

### M-2 — The duality principle has no stage-scaled local readout: section UIs animate what the tree banks — and the day-1 "sap monitor" is undefined

**Location:** D088 duality (07-ledger.md L1556–1568: "ONE derived
state, ONE animation language, TWO scales"); D087 habit buds L1487–
1495; stage matrix class 2/3 (LOOPHOLES.md L64–65: SEED completions and
measurements = "banked"; SEEDLING = "bud bursts (small)" + "sap state
visible in the seedling stem"); INPUT-INVENTORY.md §4/§6.

**The gap:** The duality promises the section UIs show the SAME state
the tree shows, in the same animation language. At SEED/SEEDLING the
tree's organs don't exist (no branch, no vascular system), yet the
section UIs are live: (a) the habit card's swipe-complete burst (locked
UI animation, 05-uiux.md L153) fires on day 1 — the tree banks the
same completion invisibly. Two scales, TWO states — duality broken for
the tree's entire first weeks; (b) the nutrition tab's "sap monitor"
(read: vascular ring state + tree cross-section as the dual surface) —
the task's explicit question: for a week-old user it is empty by the
matrix (measurements banked at SEED; "sap state visible in the seedling
stem" only from SEEDLING). No spec says what the monitor shows before
that, or how it scales across stages (SEEDLING flow yes/no → SAPLING
"vascular character begins" → POLE full system); (c) the gym "branch
girth trend" and the journal "leaf state" duals have the same hole.

**Resolution:** Define the stage-scaled dual readout as a first-class
rule: the local (section-UI) organ readout expresses the SAME banked/
dormant/active state the tree expresses at that stage — at SEED the
habit card shows its normal locked UI plus a tree-correspondence state
badge ("banked — bursts when your tree reaches its seedling stage");
the burst language itself is stage-scaled (swell at SEED, small burst
at SEEDLING, full burst from SAPLING — one animation language, stage-
scaled amplitudes, mirroring the matrix's "bud bursts (small)" row);
the sap monitor gets an explicit three-state ladder (collapsed per L-07
with one-line explanation at SEED → stem flow state at SEEDLING →
composition at SAPLING+); same ladder for branch girth and leaf states.
The duality's "one state" claim then holds at every stage by
construction.

---

### M-3 — Anatomy views have no stage gating: rings on a ring-less seedling, leaves on a leaf-less tree, time-lapse with no history

**Location:** VISION.md §16 L139–149 (anatomy views — "the complete
review/anatomy mode"); SCHEMA.md §8 L114–117 (mapping skeleton);
stage matrix leaf/measurement rows (LOOPHOLES.md L63–65); H4
reveal-on-first-data (05-uiux.md L72, L251).

**The gap:** The five anatomy views are specified as a complete mode
with data-mapped layers — with no word about stage availability, so the
implementation will either render empty views (a week-old user opens
five sections: trunk section with no rings, leaf section with no
leaves, root section with no foundation, time-lapse of a static seed —
wasted surface, L-11 sprawl) or fabricate data (a trunk cross-section
with rings on a 6-month tree = the botanical lie the design bans).
The botany here is well-defined and gives a beautiful honest answer:
a young dicot stem's transverse section is PRIMARY STRUCTURE —
epidermis → cortex → vascular bundles in a ring → pith (B-stems L43)
— no rings, but the vascular-bundle ring IS the sap system (class 3
SEEDLING "sap state visible in the seedling stem"). So the stem view
is never empty — it just shows the right young structure.

**Resolution:** Per-view stage gates, aligned with data existence (the
H4 pattern): (1) STEM transverse section — available from SEEDLING,
renders primary structure + vascular bundle ring (bundle richness =
sap/nutrition state; this is also the sap monitor's anatomy anchor,
M-2); (2) TRUNK rings view — conceals until the first ring closes
(H4), then shows pith at center + closed rings + the CURRENT year's
in-progress outer layer (honest mid-year rendering — real botany: the
growing ring is a thin cambium-adjacent band, not a closed ring); (3)
LEAF cross-section — conceals until the first leaf cluster exists; (4)
ROOT transverse — available from day 1 as primary structure (stele +
cortex), foundation/tenure data fills it in; (5) TIME-LAPSE — unlocks
at the first ring close (it is a review artifact; a week-old replay is
a 4-frame gimmick). Every concealed view states its unlock condition
in one line (the L-07 empty-state grammar, 05-uiux.md L198).

---

### M-4 — The zoom mechanic (the L-04 granularity ladder) has no interaction spec and no stage-gated zoom UX

**Location:** LOOPHOLES.md L99–103 (L-04: clusters → per-entry
granularity, "also a zoom mechanic"); D088 scale separation
(07-ledger.md L1539–1544: "Zoom out = years; zoom in = days; every
scale is data"); L-15 (07-ledger.md L1106–1124 — grid placement
deferred to the tree session, fine); tree-2 skeleton "space & scale"
L1401–1402.

**The gap:** "Zoom" is named as the mechanic but nothing defines its
UX: (a) the gesture (pinch on mobile conflicts with browser zoom; wheel
on desktop conflicts with the tab's scroll — a 640px column and a
scrollable tab are the locked shell, 05-uiux.md L48/L201); (b) the
stage-gated range — at SEED there is nothing to zoom into (2 objects);
at SEEDLING the cluster is the finest object (tap = aggregated feed);
at POLE per-entry leaves appear — so the mechanic's BEHAVIOR changes
by stage (zoom-in reveals previously nonexistent objects) — is that a
render change or a view change?; (c) cluster tap vs zoom-into-cluster —
same action? (the feeds rule: "opening a leaf shows the memory",
VISION §15); (d) reduced-motion (zoom must not be a continuous pan —
a11y contract).

**Resolution:** A stage-gated zoom ladder + gesture contract: discrete
zoom steps (not continuous) — step 1 = whole tree (default, always),
step 2 = branch/cluster scale (unlocks at first twig), step 3 = entry
scale (unlocks at POLE per-entry granularity, i.e. the zoom literally
materializes the L-04 unlock); taps and zoom-steps are the same
affordance (tap cluster = open its aggregated feed — the feed IS the
zoom-in, one action); gestures: tap/scroll-step on desktop, tap/pinch-
step on mobile with the browser-zoom conflict resolved by scoping the
tree canvas (no continuous pinch); reduced motion = steps only, no
transition animation. The L-15 grid stays deferred, but its
placement decision slot is exactly the zoom-out step above the whole
tree, and should be recorded there.

---

### M-5 — "Dormant" vs "not yet extended" vs "absent" is undefined — and three dormancy concepts share one word

**Location:** D088 dormancy + revival (07-ledger.md L1549–1553);
D088 branch system (L1517–1524: all 5 branches from day one, no
scars); D087 bud dormancy (L1487–1495); D085 winter dormancy (L1452–
1465); roadmap "a thin domain looks young/dormant, never 'failed'"
(04-roadmap.md L1260–1261); tree-4 skeleton "dormant-domain states"
(07-ledger.md L1420).

**The gap:** Three distinct states exist in the locks with one UI word:
(1) NOT-YET-EXTENDED — a branch-bud that has never grown (the day-1
state of all 5 domains); (2) DORMANT-BRANCH — a branch that grew, then
stopped (D088: keeps structure, loses seasonal leaves, resumes from tip
buds — dormancy REQUIRES prior growth); (3) DORMANT-HABIT — the D087
bud's unworked state; plus the calendar WINTER dormancy that is
whole-tree (D085). Nothing defines how the UI distinguishes them, and
the roadmap copy actively conflates young and dormant. The display
rules and why-panel copy exist for only one of the four (the D088
example line: "your gym branch has been dormant since June — it will
resume when you do"). Consequences: a day-1 user's five never-grown
branch-buds could be misread as five failures; the F-11 inactivity
decay flip (absence → dormancy) has no visual threshold (when does a
young branch stop being "not yet extended" and become "dormant"?); the
L-14 strength-vs-heatmap order has nothing to order on a branch-bud;
and the winter season makes every branch look dormant at once —
indistinguishable from five abandoned domains.

**Resolution:** A four-state display taxonomy with distinct visuals +
copy, gated by the stage/state definitions: NOT-YET-EXTENDED =
branch-bud form, copy "your [domain] branch grows here when you show
up"; DORMANT-BRANCH = full branch, leafless (deciduous honesty),
copy with the since-date; DORMANT-HABIT = the bud's closed/scaled
state (bud scales adaptation), copy "resting — it resumes with your
next check-in"; WINTER = whole-tree pause with the season why-panel
(C-3). The F-11 flip threshold (absence length → dormant) is an
engine-contract number, but the UI rule is: never-dormant-before-first-
growth (a branch-bud cannot be "dormant" — only "not yet extended"),
and dormancy state is always text-labeled (never color-only, a11y).
L-14's ordering rule scopes to extended branches with both surfaces
present.

---

### M-6 — The day-1 interaction map is undefined: what tapping a branch-bud, the trunk, a cluster, or an achievement bud does

**Location:** VISION.md §15 L128–138 (tree = meta-UI: "opening a branch
shows its domain's feed"); tree-4 skeleton (07-ledger.md L1416–1422:
hero tree, overview strip, detail panel — content and interactions
unspecified); L-12 numbers-led glance (07-ledger.md L1079–1091).

**The gap:** The tree's only tappable objects on day 1 are the 5
branch-buds, the trunk, and achievement buds — and none has a defined
behavior at the SEED stage. A branch-bud is NOT a branch: does it open
the domain's feed (VISION §15 semantics) or a "not yet extended"
detail? The trunk: the life summary? Ring view? On day 1 the trunk has
no rings — what does tapping it show? Achievement buds: the L-05
why-panel exists (good precedent). The overview strip and detail panel
(tree-4's layout) have no content spec for the first week — L-12 says
glance = numbers-led, but no one has enumerated a seedling's glance
numbers ("day 4 · seed · 5 branches set · 2 buds banked · 1 achievement
bud"?). And the cluster feed (the first entry-level surface) has no
detail spec (what does an aggregated cluster open — the journal
timeline filtered? a derived facts list? — the tree shows facts-only,
never content: 05-uiux.md L249/L254 + INPUT-INVENTORY §14).

**Resolution:** An interaction map contract, one row per tappable per
stage (at minimum: branch-bud → "not yet extended" detail with the
section feed link-through; trunk → life summary + birth line + banked
counts; achievement bud → the L-05 why-panel; cluster → the domain's
derived facts feed (facts-only), with a "open section" pill honoring
VISION §15; leaf/ring/flower → their feeds when stages unlock). Plus
the day-1 overview strip content: the numbers-led glance set (day
count, stage name, branch set 5/5, banked counts, achievement-bud
count) — fixed per stage so the strip never collapses to empty (m-5).

---

### M-7 — The growth-replay scope is undefined: what replays when the tree tab opens?

**Location:** tree-3 skeleton (07-ledger.md L1410–1414: "Growth
animation language: what animates (ring closing, branch extending,
leaf appearing), triggers (unlock event, open tab), duration/rhythm —
celebratory but never spammy").

**The gap:** "Open tab" is listed as a trigger but the scope is not:
a returning user who hasn't opened the tree in 3 months — does the tree
replay 3 months of growth (twigs, a branch, seasonal changes) on open?
That's a 90-second animation festival = exactly the "spammy" the rule
bans. Replaying nothing = the growth is invisible (the "unrewarded"
failure). No rule states what batch of changes replays, in what order,
for how long, and what happens to multiple stage-level events (bloom +
ring close + branch extension all unviewed).

**Resolution:** Replay-scope rule: on open, the tree replays ONLY (a)
the most recent unviewed STAGE TRANSITION (one ceremony, C-2) and (b)
changes since the user's last view collapsed into ONE growth wave with
a hard duration budget (e.g. ≤4s, instanced procedural animation per
tree-5/L-09 geometry) — anything older renders statically; the
why-panel lists "since your last visit: 3 twigs, 1 branch, spring
bloom" as text (facts-first, L-12 numbers-led). A "viewed" watermark
persists per session. Reduced motion: static + the text list only.

---

### M-8 — Imported entries can birth the tree: seed date from an import vs "imports never count as growth"

**Location:** INPUT-INVENTORY.md §9 L202 + §14 L299 (seed date follows
the anniversary anchor "first journal entry"; imports excluded from
growth GLOBAL, §3 L84, J3 L146 in 05-uiux.md: "achievement/cadence
counters EXCLUDE imported rows").

**The gap:** The locked anchor is "first journal entry's date" — with
no import exclusion stated for the SEED DATE. Batch import (J3) can
create 47 backdated entries on day 1 of an install; under a literal
read, the tree is then BORN on an imported entry's date (possibly
years ago) while imports "NEVER count as growth" — the tree's birthday
is a non-growth event, and the tree jumps straight into a multi-year-
old stage (a sapling) that nothing in the user's real life earned; the
import UI gives no hint that it moves the tree's birth. The inverse
edge: a user whose ONLY entries are imports has a tree by the anchor
but zero growth by the exclusion — a tree that cannot grow.

**Resolution:** The tree's seed date = the earliest NON-IMPORTED
entry's date (a documented deviation from the coach anchor, or an
explicit clause in the anchor: the tree reads the anchor through the
import-exclusion filter); the J3 import preview adds one line ("imports
never grow the tree — its birthday comes from your first original
entry"); an imports-only user gets the m-3 no-tree state with the
explanation. This closes the "imported birth" case without touching
the locked growth exclusion.

---

## MINOR

### m-1 — The skeleton geometry for the tree render is unspecified (L-09 applied to a tree)

**Location:** L-09 (07-ledger.md L1013–1024, geometry-matched ghosts);
tree-5 skeleton (07-ledger.md L1424–1427); 05-uiux.md L248–249.

**The gap:** L-09's geometry-matched rule demands the ghost match the
final shape with zero layout shift — for a tree, the ghost is either a
tree-shaped silhouette (right) or a block-shaped card (wrong, and the
layout does shift). Also L-09 rule 2 (no shimmer for cheap/fast blocks)
should be stated for the tree: the SEED/SEEDLING renders are tiny and
cheap — they must render directly with NO ghost (a seed-sized shimmer
is absurd); shimmer applies only at the heavy stages (pole+), where the
skeleton = the tree's silhouette at the previous stage's shape.

**Resolution:** One line in tree-5: ghost = silhouette of the last
committed tree state, geometry-matched, no shimmer before the sapling
stage.

---

### m-2 — The restraint contract vs the tree's trait palette: the hero tree is one giant accent-colored element

**Location:** Restraint contract (05-uiux.md L220–226: "max two
accent-colored elements per viewport at rest", "one ambience moment
per screen"); TRAIT-SPACE.md L15–34 (trait-driven palettes: bark, leaf
family, flowers).

**The gap:** The tree's art is trait-colored by design (composite
species, derived palettes) — a full-color hero tree plus 5 labeled
branch-buds could read as 6+ accent elements, violating the contract
if applied literally; conversely the tree could be flattened into
accentDim and lose its identity. The "one ambience moment per screen"
rule needs the tree tab to be classified (the tree IS the ambience;
washes behind it are the standard atmosphere layer, no image layer).

**Resolution:** Explicit carve-out in the tree tab spec: the hero tree
is the screen's ambience moment and its trait palette is exempt from
the accent-count rule (it is derived art, not semantic accent — the
why-panel, strip, and detail chrome stay token-quiet); branch-buds
carry section identity only in their detail views, never as hero
colors; gold stays banned on the tree (streaks-only lock untouched).

---

### m-3 — The no-tree state (pre-seed, post-dissolve) has no empty-state spec

**Location:** 05-uiux.md §10 L192–198 (empty-state grammar: one line +
optional accent pill); LOOPHOLES.md §7 L165–166 ("when does the seed
appear?" — open); M-1/M-8 above.

**The gap:** A user with no journal entries (created habits only —
possible since the welcome flow's step 3 is the only entry gate and
pre-M9 users could exist without entries) opens the tree tab and sees
nothing defined: no seed, no invitation. The locked empty-state grammar
(one line + one accent pill action) maps perfectly but nothing says so.

**Resolution:** The no-tree state = the standard empty state per
05-uiux.md L381: "Your tree is planted with your first journal entry"
+ accent pill "Write your first entry" (→ compose, the day's one
primary action). Reused for the M-1 ratchet's "archived-era" note and
the M-8 imports-only case with adapted copy. Discoverability: the
welcome flow (G7) mentions the tree in one line (step 1) — no nav
ordering decision reopened, per the deferred-ordering lock.

---

### m-4 — Reduced-motion and a11y are unaddressed for the tree's moments

**Location:** 05-uiux.md L245 (a11y: reduced motion → all durations 0,
no color-only semantics); tree-3 animation language; C-2 ceremonies.

**The gap:** The ceremony/transition/replay designs (C-2, M-7) are
animation-first; with reduced motion they must degrade to static
end-states + copy, and dormancy/season/banked states must never be
color-only (the "dormant = gray" trap fails the no-color-only rule).

**Resolution:** One a11y line in the ceremony contract: every
transition has a static equivalent (the end-state render + a one-line
why-panel); every tree state that uses visual differentiation (bud
swell, dormancy, winter, banked) carries a text label; zoom = discrete
steps only (M-4).

---

### m-5 — L-07 applied inside the tree could collapse the seedling UI to nothing — the hero is never an empty block

**Location:** L-07 (07-ledger.md L973–985); stage matrix SEED/SEEDLING
(LOOPHOLES.md L61–69); tree-4 layout (hero + strip + panel).

**The gap:** L-07's collapse semantics are the dashboard precedent; a
naive application to the tree tab strips the overview strip and detail
panel of every block on day 1 (no rings, no streaks, no domain stats,
no leaves) — leaving a bare hero + empty chrome. The task's question —
"does the UI collapse to nothing" — is currently answerable as "maybe,
nobody defined it". The hero itself is NOT a block: it is the tree, and
the tree at SEED has real content (seed + buds + banked data, C-1).

**Resolution:** Scoped L-07 rule for the tree: the hero never
collapses (the tree is never "empty" — it is the seed state); the
strip/panel blocks collapse per L-07 BUT the day-1 strip content is
defined (M-6's glance numbers + banked counts) so the collapsed set
is never the whole screen; concealed anatomy views (M-3) use the
one-line unlock-condition grammar instead of silent absence.

---

## Summary

| ID | Severity | One-line gap |
|---|---|---|
| C-1 | CRITICAL | Day-1 render undefined + internally contradictory (seed-with-trunk vs L-03 botany); invisible bank; no first-run spec |
| C-2 | CRITICAL | Stage transitions (germination, first branch, first bloom, ring close) have no trigger/ceremony/replay/notification design |
| C-3 | CRITICAL | Season × young-tree undefined; first-spring bloom contradiction (D085 vs stage gate); dormancy seasons read as "failed" |
| M-1 | MAJOR | Deleting the first entry regresses the stage clock; zero entries dissolves the tree |
| M-2 | MAJOR | Duality has no stage-scaled readout; section UIs animate what the tree banks; day-1 sap monitor undefined |
| M-3 | MAJOR | Anatomy views ungated: rings on ring-less seedlings, leaves on leaf-less trees; young-stem primary structure unspecced |
| M-4 | MAJOR | Zoom mechanic: no gesture spec, no stage-gated ladder, cluster-tap ambiguity |
| M-5 | MAJOR | Not-yet-extended vs dormant vs winter vs habit-dormancy: four states, one word, no display rules |
| M-6 | MAJOR | Day-1 interaction map undefined (branch-bud/trunk/cluster taps) + strip/panel day-1 content |
| M-7 | MAJOR | Replay-on-open scope undefined (spam vs invisible growth) |
| M-8 | MAJOR | Imported entries can birth the tree, contradicting the global import exclusion |
| m-1 | MINOR | Tree skeleton ghost geometry + no-shimmer-before-sapling unspecced |
| m-2 | MINOR | Restraint contract vs trait-colored hero tree — no carve-out |
| m-3 | MINOR | No-tree empty state + welcome discoverability unspecced |
| m-4 | MINOR | Reduced-motion/color-only a11y for ceremonies and states unspecced |
| m-5 | MINOR | L-07 inside the tree could collapse the seedling screen to a bare hero |