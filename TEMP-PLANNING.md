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

## APP MAP — all major parts/sections

The app as one map: every major part, its build status, and its
milestone home (Roadmap M0–M13). Refactor audits hang off this list —
each area below is the anchor for its audit checklist item.

### A. Built / in progress (M0–M1)
1. **Core shell & navigation** — tabs (Dashboard, Journal, Habits,
   Settings), bottom bar mobile / left rail desktop, theme system
   (dark-first tokens, DesignSystem.md), responsive layout. Audit #1
   anchor for shell-level concerns.
2. **Welcome / onboarding** — 3-step first run (what PersonalOS is,
   first habits, first journal entry). Audit: reference onboarding
   flows.
3. **Dashboard** — block stack: today section (briefing + habit ticks +
   capture), calendar/heatmap strip, habits card, goals progress
   (placeholder), strength snapshot (placeholder), weekly review/Coach
   note, journal capture, storage meter. Audit #1 anchor.
4. **Journal** — compose (text + photos + vlogs), chronological
   timeline, tags, Life Areas, edit/delete with event history, media
   thumbs + vlog capture. M1 expansion pending (J1–J6 +
   physique-photo timeline). Audit #2 anchor.
5. **Habits** — today's list, one-tap check-off, habit detail sheet
   (streak, 7/30-day indicator), edit/create/archive, Life Areas.
   Audit #3 anchor.
6. **Settings & data** — settings groups, export/restore, recovery
   screen, storage meter + data section. Audit #8 anchor.

### B. Services & data layers (cross-cutting)
7. **Data layer** — drift/sqlite WASM database, models, repositories
   (the ONLY storage touchpoint), adapters, event log (single behavior
   history), isImported flags. Boundary rules per AGENTS.md.
8. **Services** — storage, media (MediaRepository; blob handling),
   web, coach stub (M0 rule: 3-missed-days line), growth
   (`growth_stage.dart` — the Life Tree seed).
9. **Achievements catalog (cross-cutting, lives at repo root)** — v2
   = THE WHAT, TEMP-PLANNING-Achievement-Spec.md = THE WHEN (E0–E13,
   131 trophies + 47 rungs), Gamification.md = THE WHY. Audit #9
   anchor (achievements/rings surface once it renders).

### C. Planned (milestone homes; audits can pre-plan, not pre-build)
10. **Fitness & Body (M2)** — gym sessions, templates, exercises,
    PR/est-1RM (Epley), standards, records vault, deload, body
    metrics, physique timeline. Audit #4 anchor.
11. **Nutrition (M3)** — food log, meals, recipes, macros (kcal/
    protein/carbs/fat), targets (TDEE), weigh-in resolution,
    macro-gap bar, weekly check-up. Audit #5 anchor.
12. **Routine & Briefing (M4)** — daily routine templates, briefing
    (today at a glance). Audit #6 anchor.
13. **Goals & Tasks (M5)** — goals with milestones/tasks, plan
    adherence, projections. (Audit #6/#7 shared surface.)
14. **Calendar & Periods (M6)** — year heatmap, day view,
    plan-vs-actual, vacation/trip periods. Audit #1/#8 surface ties.
15. **Analytics Engine & Gamification (M7)** — H3 owner functions,
    XP policy (locked), streak grace, day activity score, trophy
    engine (achievement.unlocked events), Coach tie-in loudness.
    Audit #9/#10 anchors.
16. **Full Coach (M8)** — rule catalog session (deferred by design),
    coach_outputs weekly review, strictness, reflections.
    Audit #10 anchor.
17. **LIFE TREE (M9 — MAIN GOAL of this generation)** — dedicated
    tab, huge stylized growing tree, 10-ring trunk, domain branches,
    tier foliage; design system spec = this file's main section.
18. **Drive P2/P2.5/P3 (M10–M13)** — backup, entity sync, media blob
    sync, media vault. No refactor audits planned; contracts only.

### Map notes
- Audit numbering matches the open-items checklist (1–10); audits
  target areas that exist or render first, planned areas get
  pre-planned proposals only.
- The Life Tree sits on top of analytics feeds (M7) + rings data —
  its design section (below) assumes those locks, nothing earlier.

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
