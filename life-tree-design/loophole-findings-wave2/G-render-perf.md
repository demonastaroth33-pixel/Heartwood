# G — RENDER & PERFORMANCE LOOPHOLES (the Life Tree's practical feasibility on a low-end phone)

**Hunt date 2026-09-23. Wave 2. Lens: THE RENDER & PERFORMANCE LENS — every
render state, derivation path, snapshot, memory and frame budget against the
locked perf agreement** (stylized art, instanced procedural leaves, LOD,
derivation cache, precomputed snapshots — TRAIT-SPACE.md §5, the session
record; the app's own perf discipline: docs/PerfBacklog.md +
docs/PerformanceOptimizationBrief.md).

The M9 exit criterion is "render performance acceptable on the phone"
(scan-outputs/04-roadmap.md L59) and TRAIT-SPACE.md §5 says the perf pillar is
"verified by perf budgets as milestone gates" — but **no budget number exists
anywhere in the design.** Every finding below is therefore stated with a
concrete cost estimate and a budget for the stated low-end targets: **a stylized
2D canvas holds ~2–5k draw ops at 60fps on a mid phone; ~1–2k ops on a 2016-era
phone** (the renderer is CanvasKit: it re-rasterizes the whole scene through
WebGL every dirty frame — no compositor, PerformanceOptimizationBrief L19–23).

**Result: 4 CRITICAL · 12 MAJOR · 6 MINOR = 22 findings.**

---

## 0. The baseline numbers every estimate is built on (locked design, scanned)

| Fact | Source | Number |
|---|---|---|
| Twigs (canopy mass) | D088 (07-ledger L1535–1538): "one twig per month of sustained presence per domain; a consistent user has ~10 twigs/yr per active branch" | 10 yr × 10 twigs × 5 domains = **500 twigs**; 20 yr = **1,000 twigs** |
| Leaves = entries, per-entry granularity at MATURE | L-04 (LOOPHOLES L99–103), stage matrix class 1 | journal-heavy user ~1–3 entries/day → **3.6k–11k leaves @10 yr**, **7k–22k @20 yr** (+photos/voice as separate entries) |
| Event budget | 01-data-layer L288 / 03-coach L103: "~10k events/yr personal scale; revokes ~2k/yr" | 20 yr ≈ **200k–240k events** |
| Flowers (banked achievements) | D092/D099; "dozens" at first bloom | 24–96 first bloom; 100–300 at a decade's annual blooms |
| Rings | D090 (yearly, any-domain) | 10–20 rings at maturity |
| Perf budget | (this hunt's stated target) | mid phone 2–5k ops@60fps · 2016 phone 1–2k ops |
| Renderer | PerformanceOptimizationBrief L19–23 | CanvasKit, whole-scene re-raster per dirty frame |

The full-detail hero render of a mature tree (500 twigs × 1 stroke + 3.6k–11k
leaves × ~2 ops [fill + petiole], compound leaves ×3–5 leaflets) is therefore
**7.7k–30k ops** — **3–15× over the mid-phone budget, 8–30× over a 2016 phone.**
That number is the spine of this entire hunt.

---

## CRITICAL

### P-01 — The mature full-canopy render has no LOD ladder and blows the draw-op budget by 3–30× — the default hero view is unspecified

**Location:** L-04 (LOOPHOLES.md L99–103: per-entry granularity at MATURE);
stage matrix (LOOPHOLES.md L57 "full leaf granularity"); D088 scale separation
(07-ledger.md L1539–1544); tree-5 skeleton (TEMP-PLANNING.md L2379–2383);
TRAIT-SPACE.md §5 ("instanced procedural leaves, LOD" — named, never specified).

**The gap:** The design locks "full leaf granularity" at MATURE and calls
leaves "the explorable memory surface" (VISION.md §3) — but nothing defines
what the **default hero view** of a mature tree actually draws. A naive
implementation draws every entry as a leaf in the hero view:
- **Cost at 10 yr:** 500 twig strokes + 3.6k–11k leaves × ~2 ops = **7.7k–23k ops**.
- **Cost at 20 yr (old-growth):** 1,000 twigs + 7k–22k leaves = **15k–45k ops**.
- **Verdict:** 3–15× over the mid-phone 2–5k budget; 8–30× over a 2016 phone's
  1–2k. A static render at this cost is a one-time 300ms–1s freeze; **during any
  ceremony (bloom, season, replay) it is per-frame jank for the ceremony's whole
  duration.** This is the guaranteed-worst state and it is the *default* state.

**Proposed mechanism (perf-agreement-grounded):** a **zoom-scale LOD ladder
that locks the hero view to LOD-1, not LOD-2:**
- **LOD-0 (whole-tree/hero, the mass at distance):** one silhouette + the canopy
  drawn as N mass strokes (100–500 ops). Default first paint + the zoomed-out
  "years" scale (D088 "zoom out = years"). This IS the E-m1 shimmer ghost
  (07-ledger L-09 geometry-matched silhouette) — converge them: the ghost IS
  LOD-0.
- **LOD-1 (branch scale, the default hero view of a mature tree):** per-twig
  **leaf-cluster paths**, not per-entry leaves (~1k–1.5k ops for 500 twigs). The
  L-04 "cluster" IS the LOD-1 leaf form; per-entry granularity is a *zoom
  affordance*, exactly as L-04 framed it ("also a zoom mechanic") — make that
  explicit as a *render* rule, not just a *data* rule.
- **LOD-2 (entry scale):** per-entry leaves — **spatial only**: the focused
  branch draws detail (a few hundred ops), off-focus branches stay at mass
  (spatial LOD, see P-16).
- Static states draw once into a cached `ui.Picture` and blit (a single blit per
  frame at rest → idle = 0 fps, matching PerfBacklog B1); **only the animating
  elements ever re-rasterize.**

### P-02 — The first bloom ceremony (D092/D094, 8–12s) has no draw-op budget, no particle cap, and no degradation ladder below "all-or-nothing reduced-motion"

**Location:** D094 (TEMP-PLANNING.md L2579–2629: "MATURITY + FIRST BLOOM …
buds burst family by family, soft bloom rain, … 8–12s"); D092 first-bloom
schedule (L2508–2537); D094 reduced-motion line (L2613–2615: "every transition
has a static fallback" — the only escape hatch); tree-3 animation language
(skeleton).

**The gap:** The bloom rain has no count, no sprite budget, no shader-free
mechanism; the burst has no flower-draw budget; the ceremony has no per-ceremony
frame budget. Naive math during the 8–12s window:
- Tree at LOD-1: ~1.5k ops (if LOD exists — see P-01; without it, 8k+).
- Flowers at bloom detail: 24–96 banked buds × 10–30 ops per inflorescence =
  **250–2,900 ops**.
- Bloom rain: "soft" implies a few hundred petals; each petal as a *path fill*
  = 200–600 ops **per frame** on top of the above.
- **Total ~2k–5k ops/frame sustained for 8–12s** → jank on a mid phone, heavy
  jank on a 2016 phone. The reduced-motion branch is binary (static or full) —
  there is no "runs but cheaper" rung, and reduced-motion is a user setting, not
  a device-capability response. **The full-motion path is mandated to not drop
  frames (this hunt's point 7) and currently cannot.**

**Proposed mechanism:** per-ceremony frame budgets + a **three-rung degradation
ladder driven by a runtime FPS monitor** (see P-15): FULL (≤2.5k ops, bloom rain
**capped at ~150 shader-free petals** rendered as pre-baked sprites via
`drawImageRect` — one texture sample per petal, never per-petal path fills;
flowers drawn at detail), REDUCED (LOD-0 canopy mass + flower *mass* per
cluster ~1k ops, ~80 petals), STATIC (the end-state picture + why-panel, the
existing D094 fallback). The ladder step is selected by measured device fps
during the first ceremony and persisted; it is **not** only `prefers-reduced-
motion`.

### P-03 — Autumn leaf-fall (D095) has no mass mechanism — the naive per-leaf fall of 3.6k–22k leaves is catastrophic and recurs every year for every mature tree

**Location:** D095 (TEMP-PLANNING.md L2648–2652: "autumn = leaf-fall
(deciduous honesty)"; L2643–2645: "bloom is ephemeral … fades at the season's
end"); D094 transition duration rule (L2616–2618: transitions ~2–4s); stage
matrix class 1.

**The gap:** D095 guarantees a **recurring, every-mature-tree, every-year**
state whose animation cost is undefined. The naive implementation animates each
falling leaf: 3.6k–22k falling leaf objects × (position update + draw) per
frame = **7k–44k ops/frame for the 2–4s fall** — catastrophic on any phone; on a
2016 phone it is a lock-up. And it re-occurs every autumn. Winter after the
fall is cheap (bare twigs + leaf-buds ≈ 1k ops at LOD-1), so the *state* is
fine — only the *transition* is dangerous.

**Proposed mechanism:** **leaf-fall as a mass event, never per-leaf:**
1. The canopy's leaves are **removed as a single re-bake** of the bare LOD-1
   picture (one picture, one blit) at the start of the ceremony.
2. A **capped falling-petal particle layer (~150–300, shader-free sprites)** —
   the "honest autumn" reads visually while the object count stays bounded;
   particles are spawned from cluster *counts* (probability-weighted), never
   one object per leaf.
3. The **ground litter layer accumulates as one picture** whose opacity/area
   grows over the season — never as N individual leaf objects.
4. Winter leaf-buds (D095: "winter entries become leaf-buds") render as the
   LOD-1 cluster form on bare twigs — no new object class.
   Same mechanism (reverse) for the spring flush (see m-4).

### P-04 — The tree's first paint is only guaranteed cheap if the derived cache is persisted and updated incrementally — nothing specifies either, so a tab open can re-derive 200k events on the main thread

**Location:** D097 (TEMP-PLANNING.md L2742–2746: "first frame = current state
instantly (the D094 skeleton shimmer rule)"); D090 (VISION.md L258 "derived,
deterministic, cached"; SCHEMA.md L70 "incremental derivation from the event
log; derived cache"); shimmer rule (scan-outputs/05-uiux.md L24–25, U:L52–54);
PerformanceOptimizationBrief C1 (L148 — drift may run main-thread under the
`sharedIndexedDb` fallback).

**The gap:** The D097 "first frame = current state instantly" contract assumes a
cache that is *already built and cheap to read*. Nothing specifies: (a) where
the derived cache lives (a Drift table? IndexedDB? memory-only?), (b) whether
tab open reads the cache or re-derives, (c) the incremental update path for new
events. The naive M9 build re-derives on every open:
- A 20-yr veteran's first tree open = a **200k+ event re-derivation = ~4–20s on
  desktop, ~8–40s on a 2016 phone CPU** (P-07's arithmetic), plus a 7.7k–30k-op
  full-detail draw = a **multi-second main-thread block** → the tree tab's first
  paint violates U:L52–54 and D097's own contract on launch day — the exact
  worst case the contract was written to prevent. And it re-occurs **every
  cold start** if the cache is memory-only (PWA closes = cache gone).

**Proposed mechanism:** (1) the derived cache is a **persisted, versioned Drift
table** (the tree is "a pure function of the current log", D098 — so the cache
is a first-class read-model; rebuildable per D098 (5), never part of backup
integrity); (2) tab open = **cache read + LOD-0 draw only** (P-01/P-10 ordering),
never re-derivation; (3) every event write updates the cache **transactionally
and incrementally** in the same transaction as the entity write (the locked
event-log transactional rule), with a bounded per-event cost (<1ms, P-07); (4)
heavy recomputes (stage transition, year boundary, restore) run **chunked
off-thread** (P-08). This is the single change that makes the whole D097 launch
contract physically true on a phone.

---

## MAJOR

### P-05 — There is no measurable M9 perf gate: "render performance acceptable on the phone" and TRAIT-SPACE §5's "perf budgets" cite numbers that do not exist

**Location:** 04-roadmap.md L59 (M9 exit: "render performance acceptable on the
phone"); TRAIT-SPACE.md L68–73 (§5: "beauty at low-end-device cost … verified
by perf budgets as milestone gates"); tree-5 skeleton (TEMP-PLANNING.md L2379–
2383: "decade-scale data cost bounds" — listed, never filled).

**The gap:** The gate references "perf budgets" as *the* M9 verification
mechanism, and no budget exists: no ops-per-frame number, no fps target, no
LOD-selection rule, no derivation-time budget, no memory budget, no measurement
method. P-01..P-04 are each "will jank" *by estimate* — but with no gate, no
test, and no number, M9 ships by vibes and the guarantee is unenforceable.
Additionally the roadmap's measurement culture (PerfBacklog) measures the *browser
boundary* only — the tree's *derivation* cost is deterministically measurable in
`flutter test` and no such test exists.

**Proposed mechanism:** encode the budgets as the tree-5 lock (one paragraph):
**≤2.5k ops/frame during ceremonies, ≤1.5k at LOD-1 rest, ≤500 at LOD-0; idle
= 0 fps; derivation ≤1ms/event incremental; full 20-yr rebuild chunked to no
frame >16ms; ≤3 resident tree pictures (P-13).** Plus a **seeded-data perf gate
test** (200k synthetic events; assert rebuild time + per-event cost + op-count
of each LOD) in the engine's test suite — deterministic, phone-independent, and
the only thing `flutter test` can actually gate. The browser-boundary numbers
get the PerfBacklog HW-GATE treatment on the target device.

### P-06 — The yearly-snapshot economy (D097) is undefined: format, scope, serialized size, count, and residency — a wrong choice here doubles the replay cost or the storage

**Location:** D097 (TEMP-PLANNING.md L2743–2745: "streams from PRECOMPUTED
YEARLY SNAPSHOTS (the time-lapse artifacts already planned), never live
re-derivation; background-loaded"); tree-5 perf LANDS (L2757); F-recursive-audit
N-1.

**The gap:** "Precomputed snapshots" is the right call — but three of its
degrees of freedom are open, and each wrong choice is expensive:
1. **Scope:** if a snapshot serializes the *full derived state including every
   entry-leaf*, a 20-yr snapshot is ~7k–22k leaf records × ~40B = **300KB–1MB**;
   20 snapshots = **6–20MB** — and the replay would render 7k–22k leaves per
   year at LOD-2 for no visual gain (the replay shows *structure*: ring by ring,
   branch by branch, buds appearing).
2. **Render mode:** if the replay re-*draws* each year's tree live from the
   snapshot (even without re-deriving), that's 20 full-tree redraws over 20–40s
   — a slow, janky "growing" that violates the perf agreement. The cheap path is
   **pre-baked per-year pictures**, cross-faded (≤10 ops/frame), with at most a
   handful of live "growing" accents (this year's twigs/flowers) on top.
3. **Residency:** 20 full-res pictures resident = 20 × ~3.7MB (P-13) = ~74MB →
   a 2GB-phone death. Snapshots must stream.

**Proposed mechanism:** the snapshot = the **structural derived state only**
(organs, positions, counts, stage, rings, character, axes, season, version —
**not** the per-entry leaf list; the leaf layer is the LOD-1 cluster aggregate in
every snapshot). Serialized estimate: **~50–100KB per snapshot** (500–1,000
twigs × 48B + rings + flower/bud registry + character). **20–30 snapshots ≈
1.5–3MB** in IndexedDB/Drift — comfortably bounded. Snapshots are **baked to
pictures during the background rebuild** (D097 "background-loaded") and the
replay is a **picture cross-fade stream, 2–3 pictures resident at a time**. The
snapshot format is versioned and regen-worthy (D098 (5)).

### P-07 — Incremental vs full derivation cost is undefined: the per-event O(1) path (the aggregate maintenance) is never specified, so "a single event" could cost anything up to a full re-derivation

**Location:** SCHEMA.md L70 ("Incremental derivation from the event log; derived
cache" — the only line); D090 master clock (TEMP-PLANNING.md L2461–2494); D088
four gradient axes (VISION.md §4.5: "0.0–1.0, derived from the event log");
tree-5 skeleton.

**The gap:** The derivation must maintain, at minimum: per-domain **month
presence buckets** (twigs), **leaf counts** per twig, **ring windows** (D090
qualifying years), habit **streak/grace** state, and the **four gradient axes**
(resource/rhythm/balance/tenure). Whether these are O(1) running aggregates or
re-scan queries is unspecified. Worst case (the code a naive implementer writes):
a new event triggers a per-month `SELECT COUNT(*)` or a per-axis re-scan of the
relevant window → single-event cost O(month) to O(year) of events, and the
event-write path (which the whole app is on) janks.

**Proposed mechanism:** lock the **incremental path**: every aggregate is a
running counter/accumulator (month buckets per domain, leaf counts, ring
eligibility, **Welford running mean/variance for the four axes** — O(1) per
event, no log scans). A single event's incremental cost is bounded **<1ms** and
updates only the touched organs' cache rows (the rest is untouched — P-04 (3)).
Full re-derivation exists only for (a) first-ever build, (b) restore (D098), (c)
schema/cache-version bump — all chunked (P-08). The derivation is a **single
streaming ordered pass** over the log (one `SELECT … ORDER BY dateKey`, no
per-event subqueries): 200k events × ~20–100μs of arithmetic = 4–20s desktop /
8–40s phone *if uninterrupted* — hence the chunking, never an in-frame cost.

### P-08 — The 20-year rebuild (D098 restore / D097 first open) has no chunked off-thread strategy: SQLite-WASM read bounds, chunk size, yield cadence, and progress surface are all unspecified

**Location:** D098 (TEMP-PLANNING.md L2795–2798: "the tree cache is REGENERABLE
… rebuilds on restore (off-thread, shimmer-first … streams, never blocks)");
D097 background-load; F-recursive-audit (L250–272, the "rebirth-from-history"
rebuild + progress surface); PerformanceOptimizationBrief C1 (L148 — drift may
be main-thread under the `sharedIndexedDb` fallback on the target machine).

**The gap:** The contract says "off-thread … streams, never blocks" but no
strategy exists for: what reads the log (drift worker vs main thread — **known
open question on the target machine**, PerfBacklog C1), chunk size, where the
yield happens, and the progress UI. Numbers: reading 200k indexed rows through
SQLite-WASM is only ~100–400ms — **the read is not the bottleneck; the
per-event derivation math is** (~4–20s, P-07). A naive "read all + derive all"
in one synchronous block freezes the tab for seconds; a naive "call
`compute()`" with the whole log at once blows the isolate's transfer.

**Proposed mechanism:** the rebuild = **chunked pipeline**: stream events in
**~5k-row chunks** (indexed, ordered) → derive the chunk's increments (running
aggregates, P-07) → post chunk-derived rows to the cache (batched transaction)
→ report progress ("rebuilding your tree… 43%") per D098's progress surface →
yield (scheduler/timer gap, and a main-thread guard: **coalesce writes to a
single transaction per chunk**, never per event). ~40 chunks × 100–200ms = 5–10s
total with **no frame over 16ms**. If drift is main-thread (C1 verdict), the
chunk-yield is mandatory; if a worker is available, run the derivation inside it
and post results. The shimmer-first rule (L-09 ghost) shows while this runs; the
tree tab is fully interactive (empty tree space + strip + why-panel).

### P-09 — The four gradient axes + lineage character have no re-derivation checkpoint: one event can shift an axis and (under the coherence rules) re-pick the whole tree's character — an unplanned whole-tree re-render

**Location:** VISION.md §4.5 (axes "0.0–1.0, derived from the event log"; "the
lineage character IS the axis position"); TRAIT-SPACE.md §3 (coherence
envelopes; "one character per organ"); SCHEMA.md L61–70.

**The gap:** The axes are *continuous* and every event moves them. The coherence
envelope maps axis position → character → trait selection. If every event that
moves an axis across a trait boundary re-picks traits, then a single journal
entry can silently re-render the whole canopy (different leaf family, different
crown) — a jarring, expensive, and *frequent* surprise (mid-decade trees move
axes with every month's rhythm change). The design implies character is stable
over years (VISION principle 5: "must NOT change visibly across a month") but no
checkpoint rule says *when* the character is re-evaluated.

**Proposed mechanism:** the **character is re-derived at defined checkpoints
only**: stage transitions, year boundaries (ring close), and the annual bloom
event — never per-event. Within a checkpoint window, the axes *values* update
incrementally (P-07) but the *trait selection* is frozen. When a checkpoint
re-picks a trait, the renderer treats it as a derived-state version bump → one
re-bake of the affected picture (P-11), never a live re-render. This also keeps
the why-panel honest ("your leaf family follows your character — re-evaluated
each spring").

### P-10 — The "current state first, replay background" contract is achievable only with an explicit first-paint ordering that nobody has written

**Location:** D097 (TEMP-PLANNING.md L2742–2746); U:L52–54 (shimmer rule);
E m-1 (loophole-findings/E-ux-stage-surfaces.md L466–484: ghost = silhouette of
the last committed state); PerformanceOptimizationBrief (idle = 0 fps, L141).

**The gap:** The contract states the *what* (current state first) and *when*
(background replay) but not the *order of operations* — and the current state
itself at full maturity is the heavy render (P-01). If the sequence is "derive →
render full detail → then replay", the first visible thing is a multi-second
freeze, which fails the contract even though every *line* of it is obeyed.

**Proposed mechanism:** lock the ordering:
1. **t0 (same frame):** persist-cache read (P-04) + **LOD-0 picture blit** (the
   silhouette/mass — this IS the L-09 ghost; <50ms, one blit).
2. **Background:** bake LOD-1 and LOD-2 current-state pictures + the yearly
   snapshot pictures (P-06), chunked (P-08), never on the critical path.
3. **Swap:** when LOD-1 is ready, a single picture swap (one blit) lifts the
   mass to the readable canopy; LOD-2 only on spatial zoom (P-16).
4. **Replay** (unviewed): streams the pre-baked snapshot pictures on top,
   skippable (D097 (3)); reduced-motion = jump straight to current (existing
   lock).
   Verified achievable *if and only if* steps 1–3 are the actual sequence and
   step 1 never touches derivation or LOD-2.

### P-11 — Anatomy views (principle 16) are cheap *as states* but have no baking/caching rule, no re-bake trigger, and no defined zoom-transition mode

**Location:** VISION.md §16 (L139–149: transverse sections, trunk rings, leaf
cross-section, time-lapse); E m-3 (loophole-findings L256–290: per-view stage
gates); scan-outputs/07-ledger.md L1418 (ring/branch/leaf detail taps).

**The gap:** The task's own lens asks "the sections are static per state — cache
them as images?" — the answer is yes, but it's unstated, so a naive
implementation re-draws the section on every frame of the zoom-in transition and
re-bakes nothing. Op estimates are genuinely cheap:
- **Trunk transverse:** pith (1) + 10–20 rings (stroked circles, ~1 op each) +
  per-ring early/latewood segments (~2 fills each) + vascular bundles (~30/ring
  small ellipses) ≈ **700–900 ops**.
- **Root transverse:** stele + cortex + bundles + storage-taproot detail ≈
  **400–800 ops**.
- **Leaf cross-section:** epidermis + palisade/spongy cells + stomata + veins ≈
  **100–150 ops**.
  Cheap as one-time draws — expensive if (a) animated per-frame on zoom, (b)
  re-baked on every state change (a full-detail re-bake is 30–80ms on a phone
  and the sap monitor / ring view are re-entered constantly).

**Proposed mechanism:** every anatomy view **bakes to a `ui.Picture` at
derived-state version (P-09/P-11 trigger: year close, stage transition, restore)
and blits thereafter** — re-bake only when its data actually changes (trunk/root
views at year close; leaf view when its cluster's state changes). The zoom into
a section is a **cross-fade from the tree picture to the section picture**
(~3 ops/frame), never an animated section draw. The sap-monitor dual (D088
duality, nutrition) reuses the same baked section picture at small scale —
one bake, two consumers (P-14).

### P-12 — Season transitions have no re-bake cadence: the seasonal skeleton + intensity modifiers could re-bake the whole canopy picture per day or per event

**Location:** D085 (TEMP-PLANNING.md L2403–2419: calendar skeleton + "data
modulates the intensity"); D095 seasonal model (L2630–2672); tree-3 season
visuals skeleton.

**The gap:** D085's "intensity modifiers (data per season)" means the seasonal
look changes as data accrues. If each new event shifts the intensity and each
shift re-bakes the canopy picture, a journaling-heavy autumn re-bakes a
10k-op-equivalent picture multiple times a day on the main thread (30–100ms each
on a phone). The leaf-fall itself is P-03; this finding is the *cadence* of the
seasonal state changes that happen dozens of times per season.

**Proposed mechanism:** **one re-bake per season-phase change per derived-state
version** — the season look is a pure function of (calendar phase + the cached
season intensity aggregates), and the intensity aggregates are O(1) running sums
(P-07). The renderer re-bakes only when the *derived-state version bumps* (a
data change that moves a cached season aggregate), **coalesced/debounced** (e.g.
≤1 re-bake per 60s of writes), never per-frame and never per-event. The four
phase changes per year (bud-break, full canopy, fall color, dormancy) are the
ceremony moments (P-03/m-4), each a budgeted transition, each ending at a baked
picture.

### P-13 — No memory budget for the tree on a 2GB phone: resident picture count, particle buffers, replay residency, and the derived cache are all unbounded

**Location:** 04-roadmap.md L59 (phone parity); PerformanceOptimizationBrief
L19–23 (CanvasKit textures); D097 replay; tree-5 skeleton.

**The gap:** The tree adds a new class of memory with hard physical bounds on a
2GB phone (of which the OS + Flutter + the existing app already consume most).
Unbounded items: (1) the derived cache in Dart objects — measured: ~2MB at 20
years (1k twigs × 150B + 7k leaf *records* × ~100B if LOD-2 descriptors are
kept — keep them, they're cheap; do NOT keep 7k leaf *objects* with paths); (2)
**cached pictures** — each full-canvas picture ≈ 360×640 logical × DPR 2 =
3.7MB; (3) **replay snapshot residency** — 20 × 3.7MB = **74MB if all resident
= a crash on 2GB**; (4) particle buffers (trivial ~10KB but must be capped with
P-02/P-03).

**Proposed mechanism — hard bounds:**
- **≤3 resident tree pictures** (current LOD-0, current LOD-1, ceremony/replay
  working set) ≈ **~11MB GPU**, freed on tab hide / ceremony end.
- **Replay streams 2–3 snapshot pictures at a time** (current, next, previous
  for the cross-fade), never the whole set (P-06).
- **Particles: capped buffers** (≤300 sprites, pre-allocated arrays, no per-frame
  allocation).
- **LOD-2 leaf descriptors are data, not canvas objects** — entries stay as rows
  in the cache; only the spatially-focused branch ever materializes leaf paths
  (P-16).
- **Snapshot store: ≤3MB** (IndexedDB/Drift, P-06). Total marginal tree memory
  ≈ **15–20MB** — bounded and safe on 2GB.

### P-14 — The duality principle multiplies derivation and render cost unless the section readouts consume the one shared cache

**Location:** D088 duality (07-ledger.md L1556–1568); VISION.md §13/§15;
scan-outputs/05-uiux.md (section UIs); E m-2 (loophole-findings L217–255).

**The gap:** "ONE derived state, ONE animation language, TWO scales" means the
habits bud-garden, the journal leaf states, the nutrition sap monitor, the gym
branch girth, and the goals orchard each render a local view of tree organs.
If each section **re-derives or re-queries** its organ state (a naive
implementation: each provider reads the log again), the app pays N× the
derivation cost and N× the read latency on every section open — and the
local/global views can *disagree* (the tree's own no-competing-numbers rule).
This is a *cost and correctness* loophole the tree's perf contract inherits.

**Proposed mechanism:** a **single derived-cache repository/service** (the only
owner, per the layer rules — features never touch storage) exposing the organ
readouts; every dual surface (sap monitor, streak-ring bud swell, branch girth)
is a **read-only consumer of the same cached rows + the baked section pictures**
(P-11). One cache version → numbers can never disagree by construction, and the
app's total tree-derived work is the incremental path (P-07) plus cheap widget
reads. The local animations stay local (bud burst, streak ring) — they animate
*cached values*, they never re-derive.

### P-15 — Ceremonies have no per-ceremony frame budgets and no capability-aware degradation ladder (D094's reduced-motion is binary; a mid device with motion enabled gets the full jank)

**Location:** D094 durations (TEMP-PLANNING.md L2616–2618: germination ~3s,
transitions ~2–4s, first bloom 8–12s; "nothing loops"); reduced-motion
(L2613–2615); PerformanceOptimizationBrief (the target machine's own fps
reality: CanvasKit ceiling ~10–30fps, hover-driven bursts — L57–70).

**The gap:** "The full-motion path must not drop frames" (this hunt's point 7)
has no budget to enforce it. Without per-ceremony budgets and a device-sensing
ladder, a mid phone with motion *enabled* runs the 8–12s bloom at whatever fps
the hardware gives (PerfBacklog evidence: 2–14fps on the target laptop — a
phone will be worse), and the "runs but cheaper" rung that reduced-motion
users never get is missing entirely.

**Proposed mechanism — per-ceremony frame budgets (ops/frame, all LOD-1):**
- **Germination (~3s):** ≤500 ops — a seed + stem + buds; trivially cheap.
- **Branch/pole/old-growth transitions (~2–4s):** ≤1.5k ops (a few animating
  organs on a static LOD-0/1 backdrop picture).
- **First bloom (~8–12s):** ≤2.5k ops + ≤150 shader-free petal sprites (P-02).
- **Time-lapse replay (20–40s):** ≤10 ops/frame (picture cross-fade, P-06) —
  the *cheapest* long moment, not the dearest.
**Degradation ladder (all ceremonies):** FULL → REDUCED (LOD-0 mass, halved
particles) → STATIC (end-state picture + why-panel). **Selected by a runtime FPS
monitor** (measure during the first ceremony; if sustained fps < ~30 for N
frames, drop one rung and persist the choice; `prefers-reduced-motion` jumps
straight to STATIC). This gives the full-motion path a defined frame-budget
envelope and a graceful device-capability floor.

### P-16 — The zoom mechanic's render cost (L-04 granularity) needs spatial LOD: "full granularity" must be a focused-region render, never a global one

**Location:** L-04 (LOOPHOLES.md L99–103); D088 scale separation (07-ledger.md
L1539–1544: "zoom out = years; zoom in = days; every scale is data"); E m-4
(loophole-findings L306–327: discrete zoom steps).

**The gap:** L-04 frames per-entry granularity as "also a zoom mechanic" — the
correct read, but its render consequence is unstated: when the user zooms to
entry scale on one branch, the *whole tree* must not re-render at LOD-2 (that
is the P-01 blowout again, on a pinch). The zoomed-out "years" scale must render
the canopy as a mass (LOD-0), not as a 20k-op display list waiting to be
magnified.

**Proposed mechanism:** **spatial LOD**: the zoomed/focused region (the tapped
branch or a zoom-step viewport) renders at LOD-2; **off-focus regions render at
LOD-0/1** (mass/clusters) always. Discrete zoom steps (E m-4) map 1:1 to LOD
steps (whole-tree = LOD-0, branch = LOD-1, entry = LOD-2 on the focus only) —
the step transition is a picture cross-fade, not a live scale of 20k paths.
This keeps the "every scale is data" promise (D088) while capping draw ops at
every scale.

---

## MINOR

### m-1 — D099's bloom waves need a per-wave render budget, not just a flower-count budget

**Location:** D099 (TEMP-PLANNING.md L2808–2814: magnitude-order waves, "the
moment never floods"); D095 bloom ephemerality (L2643–2645).

**The gap:** D099 bounds the *flower count* per wave ("if the bank exceeds the
budget, the overflow blooms in successive waves") but not the *draw cost* per
wave — at peak season the accumulated blooms from waves 1..N are all on the
tree simultaneously (D095: blooms hold through the season). **Mechanism:** each
wave adds ≤ its flower-draw budget (e.g. ≤40 detailed flowers/wave); older
waves' flowers degrade to the flower-*mass* LOD (one cluster path per
inflorescence family) once a new wave fires; peak-season cost stays ≤1.5k ops.
The wave scheduler becomes a render-budget scheduler for free.

### m-2 — Snapshot retention needs a prune rule (annual only, ~20–30 cap, rebuildable)

**Location:** D097 snapshots; P-06.

**The gap:** If a snapshot is written on every stage transition *and* every year,
a decade user accumulates dozens with no retention rule, and the D097 replay
"year by year" only needs the **annual** cadence. **Mechanism:** one snapshot
per closed year (the D090 year boundary) + the current-state cache; cap ~20–30
(≈2–3MB, P-06); older-than-cap snapshots are dropped — the replay's emotional arc
(year by year) doesn't need sub-annual fidelity, and snapshots are regen-worthy
(D098 (5)) so dropping is never data loss.

### m-3 — The tree hero canvas needs a DPR/pixel cap (the CanvasKit whole-scene raster scales linearly with pixels)

**Location:** PerformanceOptimizationBrief E2 (L170–172: DPR cap trade-off);
tree-4 hero layout.

**The gap:** At DPR 2–2.25 (common on phones), the tree hero canvas is ~4–5× the
pixels of the logical size, and CanvasKit re-rasterizes the whole canvas per
dirty frame — so the tree's canvas *size* is a first-order cost multiplier
independent of op count. **Mechanism:** cap the tree canvas's backing scale at
~DPR 1.25–1.5 (slightly soft, visually negligible for stylized art — the same
trade the app already weighs for the whole view in E2), and repaint-bound the
hero so only the tree canvas re-rasterizes during ceremonies, never the whole
tab.

### m-4 — The spring flush (D095's winter bank → burst) is a re-bake + budgeted burst, not per-bud animation

**Location:** D095 (L2659–2665: "spring converts the whole bank at once";
L2649–2652: winter entries → leaf-buds).

**The gap:** "Winter's entries burst into foliage" naively means animating every
winter leaf-bud opening — again a per-object animation at winter-archive scale.
**Mechanism:** the flush = one re-bake of the leafed LOD-1 picture (a single
blit) + the capped petal/burst particle layer (P-03's particle system reused)
+ the budgeted 2–4s ceremony (P-15). The *readable* moment (the tree visibly
"fills in") comes from the re-bake, not from 1,000 individual bud animations.

### m-5 — The strip / why-panel / legend must read the cache only — never query the log on tab open

**Location:** tree-4 strip + why-panel; L-12 numbers-led glance; P-04/P-14.

**The gap:** The overview strip's glance numbers ("day N · stage · 5/5 branches ·
N buds banked") and the legend card (D097 (6)) are the *first* things to render
and the cheapest — unless a naive implementer sources them from live H3/log
queries at open, which reintroduces the P-04 freeze in miniature. **Mechanism:**
one cache-read for the whole tab build; strip + panel + legend read the same
derived rows as the renderer (P-14's single owner). Zero log queries on open.

### m-6 — The perf gate (P-05) needs a browser-boundary verification step, not just the deterministic test

**Location:** P-05; PerfBacklog HW-GATE discipline (L7); PerformanceOptimizationBrief (target-machine-only verification, L192–194).

**The gap:** `flutter test` can gate derivation cost and op counts deterministically,
but "renders acceptably on the phone" is a runtime property (frames, GPU) that
the PerfBacklog has already established only the target machine / a real device
can measure (the headless trap, brief L75–82). **Mechanism:** the M9 tree gate
adds one HW-GATE measurement on a low-end device during (a) first bloom, (b)
launch-day replay, (c) autumn leaf-fall, (d) tab open with a 20-yr cache — same
batch-and-verify discipline as PerfBacklog T1/T2; the deterministic budget test
(m-6 part of P-05) runs first and blocks the HW-GATE.

---

## Summary

| ID | Severity | One-line gap |
|---|---|---|
| P-01 | CRITICAL | Mature hero render = 7.7k–45k ops (3–30× over budget); no LOD ladder, no hero-view LOD lock |
| P-02 | CRITICAL | First bloom (8–12s): no draw-op budget, no petal-particle cap, no degradation ladder below binary reduced-motion |
| P-03 | CRITICAL | Autumn leaf-fall: naive per-leaf fall of 3.6k–22k leaves = catastrophic, every year, every mature tree |
| P-04 | CRITICAL | First paint depends on a persisted + incrementally-updated cache; neither specified → tab open can re-derive 200k events on the main thread |
| P-05 | MAJOR | No measurable M9 perf gate; TRAIT-SPACE §5's "perf budgets" don't exist |
| P-06 | MAJOR | Snapshot economy undefined: scope (must be structural, ~50–100KB), bake-to-picture, stream-not-resident |
| P-07 | MAJOR | Incremental derivation path unspecified: per-event cost unbounded (could be O(month)/O(year) scans, not O(1) aggregates) |
| P-08 | MAJOR | 20-yr rebuild (restore/first-open): no chunked off-thread strategy, no SQLite-read bounds, no progress cadence |
| P-09 | MAJOR | Gradient axes + character re-pick has no checkpoint → a single event can re-render the whole tree |
| P-10 | MAJOR | First-paint ordering (LOD-0 mass → background bake → replay) unspecified; contract's intent unachievable as written |
| P-11 | MAJOR | Anatomy views (cheap as states, 100–900 ops) have no bake/cache rule, no re-bake trigger, no cross-fade zoom |
| P-12 | MAJOR | Season re-bake cadence unbounded: intensity modifiers could re-bake the canopy per event |
| P-13 | MAJOR | No memory budget on 2GB: 20 resident replay pictures = ~74MB = crash; needs ≤3 pictures, streamed snapshots, capped particles |
| P-14 | MAJOR | Duality multiplies derivation/render cost unless all section readouts consume the one shared cache |
| P-15 | MAJOR | No per-ceremony frame budgets + no capability-aware degradation ladder (FULL→REDUCED→STATIC + FPS monitor) |
| P-16 | MAJOR | Zoom needs spatial LOD: full granularity must be focus-only, never a global render |
| m-1 | MINOR | D099 waves need a per-wave *draw* budget; old waves degrade to flower-mass LOD |
| m-2 | MINOR | Snapshot retention: annual cadence only, ~20–30 cap, rebuildable |
| m-3 | MINOR | Tree hero canvas needs a DPR/pixel cap (CanvasKit scales linearly with pixels) |
| m-4 | MINOR | Spring flush = one re-bake + budgeted burst, not per-bud animation |
| m-5 | MINOR | Strip/why-panel/legend must read the cache only — zero log queries on open |
| m-6 | MINOR | Perf gate needs the deterministic test AND an HW-GATE device measurement (bloom/replay/leaf-fall/tab-open) |

**Final count: 4 CRITICAL · 12 MAJOR · 6 MINOR = 22 findings.**

**The CRITICAL list (states that will jank or crash a low-end phone as designed):**
1. **P-01** — mature full-canopy render at per-entry granularity (7.7k–45k ops);
2. **P-02** — the first-bloom ceremony (8–12s) with unbudgeted flowers + bloom rain;
3. **P-03** — autumn leaf-fall as a per-leaf animation (recurring annually);
4. **P-04** — first paint that may re-derive the full 200k-event log on the main thread.

All four share one cure and one gate: **the LOD ladder (P-01/P-10/P-16) +
persisted incremental cache (P-04/P-07) + baked pictures for every static and
replayed state (P-06/P-10/P-11) + the measured perf budget that enforces them
(P-05/P-15).** None of these exist in any doc today; the tree-5 skeleton is the
correct home for the lock.