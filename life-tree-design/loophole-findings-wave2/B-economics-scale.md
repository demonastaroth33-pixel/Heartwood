# LOOPHOLE FINDING — WAVE 2 / B: THE ECONOMICS & SCALE LENS

**Hunt date 2026-09-23.** Lens: the economics and scale of the Life
Tree — the 20-year user, the rarity economy at volume, the tree
layer's anti-farm, the monetization of consistency, the derived-cache
cost curve, and the empty/sparse extremes. Sources read in full:
VISION.md (principles 9, 10, 14b), LOOPHOLES.md (stage model,
capacities, D090–D099), ACHIEVEMENT-SCAN.md (rarity ladder, 131
trophies, 47 rungs, hard clusters), INPUT-INVENTORY.md (event spine),
scan-outputs/04-roadmap.md (M7/M9/M13), scan-outputs/02-achievements.md
(trigger predicates verbatim), scan-outputs/03-coach.md (event
budget), TEMP-PLANNING.md tree-7 (D085–D099 verbatim), TRAIT-SPACE.md,
SCHEMA.md. Wave-1 findings (loophole-findings/A–F) checked for
non-duplication; where wave-1 touched a cell (leaf caps, tier gates)
this pass hunts the NUMBER and the 20-year accumulation, not the cell.

---

## 0. THE SCALE ENVELOPE (the facts this hunt walks)

A 20-year consistent user, from the locked numbers:

| Quantity | Value | Source |
|---|---|---|
| Rings (six-domain brand) | 20 (≥1 qualifying entry per domain per 365-day window — the WEAKEST bar in the system) | VIII-5, 02-achievements:255 |
| Twigs | ~1000 (10/yr × 5 branches × 20y; 2000 at 40y) | D088 |
| Leaves (per-entry granularity) | 50k+ entries → 50k+ leaves, uncapped at MATURE+ | L-04, LOOPHOLES §2 |
| Habit check-ins | 40k+ → bud bursts; live bud count bounded by habit count; SCARS unbounded | D087 |
| Trophies | 178 base + re-fires (yearly families re-fire per window: I-5, II-5, II-12, III-26, VII-5, VIII-1/17/18/19; per-habit fires) → 1000+ flowers over 20y | re-fire map, M7-4 |
| Grove-tier visuals | ~46 (31 Grove + 5 multi-tier Grove steps I-12/III-18/III-19/V-5/VII-7 + 10 Grove rungs R5/R10/R15/R19/R24/R29/R34/R39/R42/R47) | ACHIEVEMENT-SCAN |
| Annual blooms | 20 (each hosting Ring/Grove + modifications + winter bank + growing-season earns) | D092/D093/D095 |
| Yearly time-lapse snapshots | 20 full tree-state snapshots, size unbounded | D097(4) |
| Event log | ~200k events (10k/yr budget ceiling, CoachSystem L098) | 03-coach:103 |
| The everything-user | 5k events/week = 260k/yr = **26× the budget ceiling** | hunt premise |

---

## CRITICAL

### C-01 — The transformation layer has no persistence rule and no rank rule; ~46 Grove visuals accumulate on one tree and the "standout at a glance" promise collapses

**Location:** D092(5) (Grove "manifests as THE TRANSFORMATION — the
D086 large visual") + D086 ("a transformation visible at a glance,
almost never seen on other users' trees") + D096 (the legend bud) vs
D088 §D rank rule (locked for ADAPTATIONS only: one dominant + subtle
runner-ups) + D095 (bloom ephemerality — flowers only) + D093
(modifications = persistent structural layer).

**What happens at scale:** Grove-capable visuals ≈ 46 on one tree.
A decade-user earns them all (chains at year 3 and 5, ceilings at
year 8–10, rungs on real lifts). Two readings, both broken:
- If transformations PERSIST (like D093 modifications): the year-20
  tree wears ~46 largest visuals simultaneously — nothing stands out,
  VISION 9's "almost never seen / standout at a glance" fails on the
  earner's OWN tree, "rare because Grove trophies are rare" (D092)
  flattens by volume (~3–4 new Groves/year), and the accumulation is
  unbounded at old-growth forever (real trees never keep 46 crowns).
- If transformations FADE (like D095 flowers): the earned Ghost-in-
  the-Machine disappears from the silhouette — VISION 9 fails the
  other way; the tree's greatest story lives only in the why-panel.
- Neither branch is specified anywhere. D099's visual budget covers
  the per-bloom wave only, never the accumulated persistent layer.

**Proposed rule (grounded in the locks):** extend the D088 rank rule
to the transformation layer. ONE dominant transformation per tree —
the legend: the highest-tenure / strongest-data-support earned Grove
(the D096 legend bud's bloom) — manifests in full; every other Grove
visual manifests at the SUBTLE tier (family identity + tier magnitude
per the D091 overlay, no full transformation). ONE transformation
slot per annual bloom (mirroring D093's "multi-year commitments,
never fast"). The legend, once bloomed, is permanent and never
changes. This preserves VISION 9 (the ONE crown is rare across users
AND unique per user), D092 (nothing unrewarded — every Grove still
blooms, family-identified), and D096 (the legend framing stays
singular).

### C-02 — The tree's rings, stage clock, and qualifying years are farmable through the DOCUMENTED legal backfill surfaces; the six-domain ring bar is six entries per year

**Location:** VIII-5 predicate (ring = all six domains each ≥1
qualifying non-imported entry within one 365-day window —
02-achievements:255) + M7 `qualifyingEntry` (FOOD = "≥1 real logged
item" on its occurredAt day; MEDIA = "kept non-imported video,
captured OR adopted") + the legal backdating surfaces: NU4 meal
backfill ("historical backfill mode" for dates older than 24h,
04-roadmap:337–343), journal backdating (D097(5): "logging last
week's workout" advances the derived state), M13 folder adoption
("adopted media DOES qualify as VLOG/MEDIA qualifying entry",
04-roadmap:1346–1347) + the forbidden-list ("retroactive logging
never rewards") with NO write-time enforcement + N-7 ("document,
don't special-case" — and the limits were never documented).

**What happens at scale:** the six-domain ring year needs SIX
qualifying entries — one per domain, anywhere in the window (the
weakest bar in the entire system). Farming: backfill one meal (NU4),
one journal entry, one workout (midnight-rule sessions are
capture-dated, but D097's premise allows backdated entries), one
weigh-in, one habit completion, one adopted video → one manufactured
ring. Sixty entries = ten rings (Yew + Old Growth + Ouroboros + the
Vow cluster all ride the same bar). Backfilled qualifying years
advance the stage clock (D090) → maturity, the first bloom, and the
Grove schedule (D092) can be forced. Backdated gap-filling
manufactures a steady RHYTHM axis and a lush RESOURCE axis (D088 §D).
The tree — a pure function of the log (D098) — rewards all of it,
and its deepest lock ("rings never shrink; the tree records life")
is the first thing farmed.

**Proposed rule (N-7 honored — one shared predicate, no tree
special-casing):** the M7 qualifying owners the tree already consumes
gain ONE write-time exclusion alongside the existing `isImported`
predicate: events written in historical-backfill mode (NU4's own
bound: older than 24h at write) and adopted rows (M13) never count
as qualifying entries for the tree's stage clock, ring years, or
axes. Pre-M9 history (D097) stays fully derived — it was real life,
never backfilled. The same gate already rejects imports ("the
3-question anti-cheat gate"); it extends to the legal backfill
surfaces so the tree inherits the locked forbidden-list literally.

### C-03 — The economy has no numbers: every bound that prevents flood, flatten, and explosion is deferred to "the engine contract (Step 8)"

**Location:** LOOPHOLES §2 ("Capacities are exact numbers for the
engine contract (Step 8)" — the table is still a draft), D099 (N-4a
"per-bloom VISUAL BUDGET" — unnumbered; N-4b "beyond branch
capacity" — capacity undefined), D093 ("exact floors in the engine
contract"), D090 (DERIVED MATURITY = "structural threshold" —
threshold undefined), the stage-clock qualifying-year predicate
(shape undefined), the L-11 sprawl guardrail (governs FEATURES and
UI elements — nothing governs the tree's own DERIVED growth; the
capacity table IS the tree's sprawl test and it is unnumbered).

**What happens at scale:** every one of these numbers is
load-bearing at 20 years. The bloom budget decides whether the first
bloom floods or the year-20 bloom drowns in waves; the tenure floors
decide whether the consistency curve holds or the structural layer
arrives on year-2 trees; the maturity threshold decides whether the
pioneer-speed compression (D090) means anything; the branch capacity
decides when bud clustering engages. Undefined = unbounded, and the
paper archetype run (PLAN step 4/5) and seeded stress tests (step 6)
cannot validate an economy whose constants don't exist. Wave-1
filled the stage × class CELLS; the NUMBERS are this pass's hole.

**Proposed rule:** lock the number set NOW, each traceable to a
locked decision, as the Step-8 contract's opening section:
- Per-bloom visual budget (e.g., ≤8 large visuals or a fixed total
  flower budget per bloom event — D099);
- Max waves per season + cadence (e.g., ≤12 weekly bloom events
  across the spring — D099);
- Branch capacity (e.g., 20 live buds per branch, cluster beyond —
  D099 N-4b);
- Tenure floors (e.g., thorns 2y, caudex 5y, buttress 7y — D093's
  "higher tenure" made exact);
- DERIVED MATURITY threshold (e.g., 2 extended branches + 1
  qualifying year — D090);
- Stage-clock qualifying year (see M-07: ≥300 qualifying days in
  the 365-day window — the locked II-5/I-5 shape).

---

## MAJOR

### M-01 — The rarity economy dries up at year 10: no new rarity supply after the ceiling achievements

**Location:** the ceiling family tops at decade scale (VIII-4 Ten
Years, VIII-9 Old Growth, VIII-10 Ouroboros, VIII-20 Yew, R47 The
Brand at 5M kg ≈ 5–10y) + D085 (annual bloom intensity reads ONLY
the current year's data) + VISION 10 (consistency compounds).

**What happens at scale:** a 20-year user has nothing left to earn
for the second decade; the annual blooms become Ring-tier re-fires
(the same Full Orbit / One Trip Around the Sun / A Year on the Bar
flowers, every year). The "most consistent users get the most
beautiful trees" principle has NO compounding mechanism past year
10 — the curve stalls exactly where the decade users live.

**Proposed rule:** mast-year logic (botany P1.6/P11.2 — the design's
own rarity language, already cited for old-growth fruit): the annual
bloom's BASE magnitude scales with qualifying-year count
(age-compounded); the current year's data modulates ± (D085's
intensity modifiers, unchanged). A year-20 bloom strictly outshines
a year-10 bloom of equal current-year effort, and the tree's own
vintage layer (ring richness — latewood density per year, D088)
carries the post-10-year story. No new trophies, no scope creep.

### M-02 — Twig accumulation at 20 years: ~1000 twigs (2000 at 40y) with no silhouette bound

**Location:** D088 ("one twig per month of sustained presence… a
consistent user has ~10 twigs/year per active branch") + TRAIT-SPACE
§5 (instanced leaves, LOD — no numbers).

**What happens at scale:** 5 branches × 10 twigs/yr × 20y = ~1000
twig instances; at old-growth forever the count is unbounded. 1000+
instanced twigs breaks the low-end-phone perf agreement (M9 exit
criterion) unless the unnumbered LOD does most of the work — and
real botany: mature trees don't display every historic twig; the
branch thickens and old twigs are covered by bark.

**Proposed rule (botany-correct aging):** twigs are young growth by
definition (P4.1/4.4). The silhouette renders the last ~5–10 years
of twigs at fidelity; older twigs age into the branch surface as it
thickens — the full twig history stays live in the anatomy view and
the why-panel count. Bound: max N live twig instances per branch.

### M-03 — The D098 rebuild at 20 years: a full re-derivation over ~200k events; "streams, never blocks" bounds the perceived blocking, not the cost

**Location:** D098(5) ("the rebuild stacks on the heaviest import,
so it streams, never blocks"), D097(4) (precomputed yearly
snapshots), Step 6 (incremental derivation — no cost contract).

**What happens at scale:** restore at year 20 = re-walk ~200k events
(10k/yr ceiling), re-run per-day domain scans, re-derive the four
axes, re-brand rings, regenerate 20 yearly snapshots, re-bloom the
bank. On SQLite-WASM/phone this is minutes; the D094 shimmer rule
hides the blocking, it doesn't bound the total. The "heaviest
import" at 20 years IS the whole log.

**Proposed rule — three bounds:** (1) snapshot-forward replay: the
D097 yearly snapshots become incremental checkpoints — a rebuild
replays 20 snapshot states + the current year's incremental, never
the full event walk (O(snapshots + year), not O(all events)); (2)
the incremental derivation contract states O(1) amortized per event
(Step 6); (3) the Coach event budget ("~10k events/yr ceiling",
L098) becomes a cache guardrail: twigs ≤12/yr/branch, snapshots
≤1/yr, leaves are read-through (never copied into the cache).

### M-04 — The bloom waves at 20 years are unbounded in count: re-fire accumulation + the winter bank + the annual schedule can exceed the season

**Location:** D099 N-4a (magnitude-order waves + "visual budget" —
unnumbered, cadence undefined), the re-fire map (yearly families
re-fire per window; per-habit fires), D095 (the winter bank → spring
flush).

**What happens at scale:** a 20-year user's flower count is
unbounded (178 base + 20× yearly re-fires + per-habit fires →
1000+). The year-20 spring hosts the winter bank (a heavy winter =
90 days of leaf-buds and flower-buds) + the year's Ring/Grove
schedule + growing-season earns — against a budget that doesn't
exist. Without a wave-count bound, the "spring SEASON of blooming"
is a spring of infinite waves, and the botany of it ("not all
flowers open on the same day") stops being beautiful at wave 40.

**Proposed rule:** D099's budget gets numbers (C-03): per-bloom
visual budget + max waves per season + wave cadence (e.g., weekly
bloom events). Re-fire flowers render at the subtle tier by default
— a re-fire is an echo of the same flower, not a new ceremony
(D092's silent re-fire philosophy applied visually), which is what
keeps 1000 flowers readable.

### M-05 — No within-tier magnitude: a year-3 chain Grove and the year-10 Old Growth render as the same transformation

**Location:** D086 magnitude ladder (tier = magnitude, flat within
tier), D092(5), the wave-1 precedent (D-gamification m-02: Ring
flowers should scale by ring count).

**What happens at scale:** on one tree, the 3-Year chains (I-16,
II-14, III-27, IV-13, V-8, VII-11) and the decade ceilings
(VIII-9/10/20, R47) are all Grove-tier and all render at the same
magnitude. The rarity economy cannot distinguish seven years of
effort from three. Under C-01's rank rule this is what the subtle
tier must sub-scale by.

**Proposed rule:** within-tier magnitude sub-steps (the m-02
precedent generalized): Grove visuals scale by their own
tenure/effort — decade Groves > 3-year Groves; ceiling rungs >
chain Groves. D099's magnitude-order wave sorting uses the sub-step,
not the flat tier.

### M-06 — The consistency curve inverts year-to-year at the bloom surface: the annual bloom reads only the current year's data

**Location:** D085 ("quiet year = sparse bloom; active winter
logging = greener canopy") + VISION 10 (consistency compounds at
every layer) + D095.

**What happens at scale:** a year-20 user with a quiet current year
blooms sparser than their own year-5 self — the most consistent
user's tree is non-monotone at the year's single biggest visual
moment. The lifetime surfaces (rings, tenure, twig density) stay
monotone; the bloom is the visible exception, and the exception sits
on the highest-visibility event of the year.

**Proposed rule:** the mast-year compounding (M-01) is the fix —
bloom base magnitude = f(qualifying years, rings), current-year data
as the ± modifier. Consistency stays dominant, seasonality stays
honest, and the curve never inverts.

### M-07 — The stage clock's "first qualifying year" predicate is unspecified: a once-a-month logger and a daily logger mature at the same speed

**Location:** D090 (SAPLING→POLE = "first qualifying year
(any-domain, anchored)") — the predicate shape is never defined;
VIII-5's six-domain bar needs only ≥1 entry per domain per window.

**What happens at scale:** with the weakest reading (≥1 qualifying
day in the window), the once-a-month logger closes a qualifying year
in twelve days of activity — maturity, the first bloom, the Grove
schedule (D092), and the tenure floors (D093) all arrive on
near-empty growth, and D090's "pioneer-speed compression" is
meaningless. Every stage-derived economy number downstream inherits
the hole.

**Proposed rule:** lock the stage-clock qualifying year to the
yearlyPass shape: ≥300 qualifying days inside the 365-day anchored
window (the II-5/I-5 precedent — "leaves room for honest gaps"),
one predicate everywhere (also feeds C-03's maturity threshold).

### M-08 — Leaf accumulation at per-entry granularity is unbounded: 50k leaves, and a 5k-events/week user breaks the event ceiling 26×

**Location:** LOOPHOLES §2 (MATURE = "full leaf granularity"), L-04
(per-entry granularity unlocks with stage — no cap at MATURE+),
D099 N-5 (storage-leaf at aggregation scale — no N), 03-coach item
12 ("budget ~10k events/yr ceiling").

**What happens at scale:** 50k entries = 50k leaves at per-entry
granularity; the everything-user (5k events/week = 260k/yr) drives
the log to 26× the Coach budget; the year-20 leader branch's twig
feed shows ~208 leaves per twig. The renderer is saved only by
unnumbered LOD/instancing (TRAIT-SPACE §5).

**Proposed rule:** (1) D099 N-5 gets its number — leaf clusters form
beyond N leaves per twig (candidate N ≈ 20–50; media-rich clusters
carry the storage-leaf character per N-5); (2) the derivation
contract states cost at 26× the event budget, and the existing
10k/yr event-log ceiling is enforced at write time (the guardrail
already exists for the Coach; the tree's cache must not be the first
unbounded consumer).

### M-09 — Adopted media is a bulk media-domain backfill vector: "captured OR adopted" with file dates manufactures qualifying days

**Location:** M13 ("adopted media DOES qualify as VLOG/MEDIA
qualifying entry — captured OR adopted", 04-roadmap:1346–1347),
INPUT-INVENTORY §10 (adopted = no XP — the XP gate only), M7
`qualifyingEntry` (MEDIA = "a kept non-imported video with measured
duration, captured OR adopted").

**What happens at scale:** adopting a PC folder of years of old
vlogs/photos (the M13 archive adoption is the DESIGNED workflow) —
if file dates ride the rows — creates media-domain qualifying
entries across years: media-domain presence for six-domain ring
years + the Vow/Ouroboros bars + the VII-family trophies, without a
day of live logging. The XP gate (adopted = no XP) protects the
gamification economy; nothing protects the tree.

**Proposed rule:** extend the C-02 write-time exclusion — adopted
rows qualify from the adoption date forward only (no backdated
qualifying days); the why-panel states "adopted — shows in the
archive, doesn't grow the tree backward."

### M-10 — The D096 bank counter legend dilutes: "the Grove bud is the tree's legend" is singular; ten banked Groves show ten legends

**Location:** D096(2) ("the Grove bud is the tree's legend before it
blooms"), D096(2) counter ("5 buds: 3 Sprout, 1 Heartwood, 1
Grove"), D099 N-4b (bud clusters), D097(6) (the legend card).

**What happens at scale:** the launch-day veteran (D097) can bank a
decade's Groves before first bloom: the counter reads "10 Grove" —
the legend framing (the ONE crown) is dead before the cherry-blossom
moment, and the first bloom (D092) then fires ten full
transformations at once (compounded by C-01).

**Proposed rule:** the counter renders the legend (the highest-tenure
Grove bud, named — "the legend: Old Growth") + tier totals ("10
Grove buds"); the first bloom manifests the legend in full and one
transformation slot per wave (C-01); the rest bloom at the subtle
tier.

---

## MINOR

### m-01 — The D097 time-lapse replay duration is unbounded at 20+ years

The launch replay is "~20–40s"; at 20 years the per-year pacing is
already at the ceiling and nothing caps it at 40+ years. Rule:
replay pacing = min(1s/year, 40s total), skippable; yearly snapshots
keep it O(snapshots) (D097(4) intact).

### m-02 — Habit bud scars accumulate without bound

20 years of created-and-abandoned habits = 100+ bud scars (D087
scar; "bud scar — honest record"). Each scar is individually
rendered today. Rule: scars beyond a bound aggregate into the
branch's bark texture (honest, countable in the why-panel, never
individually rendered).

### m-03 — The twig tick's "sustained presence period" is undefined

D090: SEEDLING→SAPLING = "first sustained presence period (the
first twig)" — the period length is never stated; a lax reading
gives a returning user a twig for one day of activity after a
5-year gap. Rule: the twig tick = one calendar month with ≥1
qualifying day (the month granularity D088 already implies),
everywhere — which also fixes the once-a-month logger's twig math
(M-07).

### m-04 — The everything-user's write path: 700 events/day against an unstated derivation batch contract

Step 6 says "debounced on writes" — at 5k events/week the debounce
window and the batch size decide whether the cache churns
continuously or batches sanely. Rule: derivation batches per
debounce window, never per event (ties to M-03's O(1) contract).

### m-05 — Delete→re-log churn doubles cache writes (revoke symmetry)

The compensating revoke events (M2-17, M7-2 negative-XP symmetry)
double the event volume at the tree's read layer. This is churn,
not a farm (a day either qualifies or not — deleting and re-creating
cannot add qualifying days). Rule: no special rule — the O(1)
contract absorbs it; noted for the cache cost model.

### m-06 — The D097 legend card count is unbounded

"37 blooms" on the launch card at year 5 (D097(6)); at year 20 the
card would list hundreds of entries. Rule: the legend card caps at
the top-N (the legend + the rarest 5), with a one-line total.

---

## 1. Summary

| Severity | Count | IDs |
|---|---|---|
| CRITICAL | 3 | C-01, C-02, C-03 |
| MAJOR | 10 | M-01…M-10 |
| MINOR | 6 | m-01…m-06 |

**The three criticals in one line each:**
- **C-01** — the transformation layer is unbounded and unranked:
  ~46 Grove visuals accumulate on a 20-year tree and nothing stands
  out; apply the D088 rank rule (one legend, one transformation slot
  per bloom, runner-ups subtle).
- **C-02** — the ring brand is farmable: the six-domain ring year is
  six qualifying entries, and every documented legal backfill
  surface (NU4 historical backfill, journal backdating, M13
  adoption) manufactures them; extend the import exclusion to
  historical-backfill-mode and adopted rows at the predicate level.
- **C-03** — the economy has no numbers: capacities, bloom budget,
  tenure floors, maturity threshold, and the stage-clock qualifying
  year are all deferred to Step 8; lock the constant set now or the
  paper archetype run and the seeded stress tests validate nothing.

**Cross-lens note:** C-02 is the single highest-leverage fix — it
protects the deepest lock (rings never shrink / the tree records
life) at write time, and every downstream rule (maturity, axes,
tenure floors, Vow/Ouroboros bars) inherits the protection from one
predicate. C-03 is the sequencing gate: the number set is the
contract the archetype mockups (PLAN step 4) and the seeded tests
(step 6) run against — without it, this wave's proposed rules stay
proposals.