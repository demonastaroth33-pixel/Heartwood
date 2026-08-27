# TEMP-PLANNING — Generation 2 (refactor & Life Tree design)

Generation-1 planning is COMPLETE and archived: `audits/TEMP-PLANNING-2026-08-20.md`
(frozen history — never edit). All gen-1 decisions now live in `docs/`
(see `docs/README.md` doc map). New decisions continue DecisionLog numbering
from **D082** onward.

## Purpose (this generation)

1. **REFACTOR** — audit every existing feature against majorly successful
   apps in its area (journal, habits, gym, nutrition, body/weight, media,
   dashboard, settings, achievements, coach); keep what works, adopt
   proven patterns, kill weak ones. Research via the mobbin workflow
   (search/capture/flow-architect skills) + any other reference evidence.
2. **INCORPORATE** — features the user likes from those apps, deliberately
   listed with rationale per item.
3. **UNLOCKS** — a few unlock/earn mechanics and extras (list below).
4. **MAIN GOAL — LIFE TREE DESIGN SYSTEM**: fully and cleanly design the
   Life Tree in detail (visual system, growth data, surfaces, states,
   render/perf, implementation plan) so M2 implementation is smooth.
   This is the deliverable that ends this generation.

## House rules (same as gen-1)

- Every decision gets `(LOCKED, user yes)` + a D-number (D082+) written
  into docs/DecisionLog.md. No silent assumptions — state them, get a yes.
- Docs are live truth; this file is the scratchpad. Divergence discovered
  while building → DecisionLog entry first, then docs.
- No new dependencies without a DecisionLog entry + user approval.
- Achievement catalog relationship already drafted: docs/Gamification.md
  :129-141 (v2 = THE WHAT, TEMP-PLANNING-Achievement-Spec.md = THE WHEN,
  ledger = THE WHY) — this file restates nothing; new achievement work
  follows that map.
- Pipeline re-run readiness: this file keeps the canonical name
  TEMP-PLANNING.md so the integration pipeline agents (A1a→G, runbook in
  `doc draft framework/RUNBOOK.md`) work unchanged. When this batch
  matures → run the pipeline once, then this file gets archived like gen-1.
- Source freeze applies from the moment a pipeline run starts.

## Open items checklist

- [ ] Refactor audit: dashboard (blocks, density, glance-value)
- [ ] Refactor audit: journal (compose, timeline, search, media)
- [ ] Refactor audit: habits (check-off, streak, review)
- [ ] Refactor audit: gym (session, history, PR, standards)
- [ ] Refactor audit: nutrition (log, targets, macros)
- [ ] Refactor audit: body/weight (weigh-in, trends, physique)
- [ ] Refactor audit: media (capture, archive, vault)
- [ ] Refactor audit: settings (groups, reachability)
- [ ] Refactor audit: achievements/rings surface
- [ ] Refactor audit: coach lines/surfaces
- [ ] Incorporate list (user picks, per item: app + why + what to copy)
- [ ] Unlocks & extras list (user picks)
- [ ] LIFE TREE DESIGN SYSTEM (main goal — see below)

## Incorporate list (user picks)

_TO FILL — one bullet per feature: app it comes from, what it does, why
it fits PersonalOS, any doc/ledger impact._

## Unlocks & extras (user picks)

_TO FILL — unlock/earn mechanics and small extras the user wants; each
item states its interaction with the XP/trophy rules already locked (no
XP for trophies, anti-farm gates)._

## Refactor proposals (per area)

_TO FILL during audits — each proposal: current behavior, reference
evidence, proposed change, decision status._

---

## LIFE TREE DESIGN SYSTEM (MAIN GOAL)

Idea recorded gen-1 (archived ledger): dedicated tab, huge stylized tree
that actively grows as everything is logged/achieved across all areas;
biggest UI-heavy feature; big review surface; Growth-Rings/10-ring
structure built into the graphic; implementation deferred to M2.

This section is the working design space. Dimensions to lock, in order:

### 1. Vision & metaphor
- What the tree IS (life archive as a growing organism), what it is NOT
  (decoration — every element must mean real data).
- Tone: awe without guilt; dormant ≠ failed.

### 2. Tree anatomy (visual system)
- Trunk + the 10-ring structure (Pith → Yew; one ring = one Life, Fully
  Logged qualifying yearly window — locked definition, v2).
- Branches: one per achievement domain (which domains exactly, how they
  fork, how length/canopy encode yearly presence + trophies).
- Foliage/trophies: Sprout → Grove tier mapping, leaf/bud/twig per tier,
  trophy density, "new" states.
- Space & scale: how the tree grows in the viewport over years (decade
  scale without cramping); iPhone PWA ↔ desktop responsive behavior.
- Theme: dark-first tokens, ring/leaf palettes, seasonal or state tints.

### 3. Growth data (100% derived — never write-path)
- Exact H3 owner feeds: ring count, dayDomainPresence per domain,
  per-tier claim counts, yearly presence, milestone dates.
- Mapping table: data → visual element (every pixel traces to a number).
- Refresh/caching semantics (M2 Analytics-Engine derived cache; when the
  tree re-computes; shimmer vs incremental growth animation rules).
- Growth animation language: what animates (ring closing, branch
  extending, leaf appearing), triggers (unlock event, open tab), and
  duration/rhythm — celebratory but never spammy.

### 4. Surfaces & interaction
- Full tab layout: hero tree, overview strip, detail panel.
- Tapping a ring/branch/leaf → derived facts-only detail (domain yearly
  presence, trophy list, ring history); no journal text, no media.
- First-run / sprout state, empty states, dormant-domain states.
- Navigation: tab existence (gen-1), placement per the deferred UI/UX
  ordering pass.

### 5. Render & performance
- Heaviest derived block in the app: paint strategy (canvas vs layers),
  skeleton shimmer, never blocking first paint; decade-scale data cost
  bounds; reduced-motion accessibility.

### 6. Implementation plan
- M2 scope, build order (data owners → mock render → polish), test
  strategy (widget tests for states, perf gate), mockup in the UI/UX pass.
