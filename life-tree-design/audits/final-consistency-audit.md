# FINAL CONSISTENCY AUDIT — Life Tree locked set (D085–D113 + 3 artifacts)

**Audit date:** 2026-09-23 · **Auditor:** final consistency auditor (meta-lens)
**Scope:** every lock D085–D113 in TEMP-PLANNING.md tree-7 (read verbatim,
L2403–L3585), VISION.md, SCHEMA.md (2.1–2.6), LOOPHOLES.md, TRAIT-SPACE.md,
PLAN.md, all wave-1 briefs (A–F, 109 + 28 findings), all wave-2 briefs
(A–H, 154 findings), I-recursive-audit (10 IA findings), INPUT-INVENTORY.md
(spot-verified §9/§14), docs/DecisionLog.md (verified absent), live schema
claims (events table columns per wave-2 A/C-device code reads).

**Verdict: PASS-WITH-FIXES.** The core lock set is internally coherent — the
clock, the anchor, the tier schedule, the seasons, the caps, and all three
artifacts cross-check cleanly at the decision level. But there are **2 CRITICAL,
12 MAJOR, 11 MINOR** defects, a stale-docs cluster (LOOPHOLES, INPUT-INVENTORY,
DecisionLog, PLAN), and a small set of findings with **no resolution and no
deferral** (the quiet-weeks arbitration being the largest). A clean PASS would
be false.

---

## 1. LOCK CONSISTENCY — D085–D113 cross-checks

### 1.1 Verified consistent (the core, checked pairwise)

| Decision pair | Check | Result |
|---|---|---|
| D090 ticks × D105 B-group | SEED→SEEDLING = B1 first in-window event · SEEDLING→SAPLING = B2 1 twig · SAPLING→POLE = B3 1 stage-year (A4 ≥200d) · POLE→MATURE = B4 ≥3 branches AND ≥2 stage-years (fills D090's "e.g. N branches + M rings") · MATURE→OLD-GROWTH = B5 ≥10 stage-years (= D090 "~10 qualifying years") | CONSISTENT |
| D089 floors × D105 D-group × D101 | D089 "2+ qualifying years; caudex/buttress higher" → D1 ≥2 / D2 ≥3 / D3 ≥5 **stage-years** (D101: floors read stage-years, never ring-years) | CONSISTENT |
| D099 caps × D105 C-group | N-4a bloom budget → C1 ≤15/event + C2 ≤4 waves (60/season) · N-4b habit clusters → C3 ≥30 · legend → C4 1/bloom + 1 crown · twigs → C5 ≤12/yr + 3-yr retention | CONSISTENT (C2 note, §1.3) |
| D092 × D095 × D096 × Artifact 3 A | D092 schedule + D095 seasons (winter earns bank) + D096 tier-marked banking + Artifact 3 A row = one coherent flower pipeline; D095 "amends D092 rule 3" stated | CONSISTENT |
| D093 × D089 × Artifact 3 B | Four gates (trigger/tenure/axes/stage-floor) match the B rows; stage floors (thorns SAPLING+, phyllodes/storage-leaves SEEDLING+, buttress POLE+, caudex MATURE+) match; manifestation = next annual bloom | CONSISTENT except B5/B10 (§1.2) |
| D104 × Artifact 1 | 7 presence-domains, body→gym(body-forks), media→journal(media-forks), goals presence owner = task.completed + goal.completed; 7→5 mapping; VI→base, VIII→trunk, IX→crown; row 8 (Periods) = protected presence, not an 8th domain (consistent with F6's "7 presence-domains") | CONSISTENT |
| D100 × D105 A1/A2 × D113(1) | grace ±3d locked (D100's candidate became the lock); in-window + non-imported + `isBackfill` predicate implements the two-tier split | CONSISTENT |
| D101 × D105 A4/A5 | D101's deferred piece (ring-year per-domain bar) **locked as A5 ≥40d/domain** — the deferral is CLOSED | CONSISTENT |
| D105 F1 × A M-1 × C-device M-6 | render clock = stored timezone setting, derivation = dayKeys only, never instants | CONSISTENT |
| D108 × D109 | fingerprint in format v3 (D109(2)) ↔ incremental cache invalidation (D108(1)); watermark = user state in backup vs cache = regenerable excluded (D098(5)) | CONSISTENT |
| D111 × G P-01/P-16 | D111's LOD-1/2/3 = G's LOD-0/1/2 renumbered; hero defaults to mass; zoom = spatial LOD | CONSISTENT (naming note, §1.3) |
| D112 × D111(7) | blush palette (DV-C2) vs ≥3:1 contrast floor + accent luminance band — no conflict | CONSISTENT |
| D106's F-03 arbitration × D092 | non-bloom bract flourish, zero flowers — flower=achievement contract survives | CONSISTENT |
| D110 × D099 N-6 × D106 | mirror boundary implementable via payload-blindness (H-02); trigger table mirrors derived facts only | CONSISTENT |
| D113 × D105 | isBackfill/adoptedAt flags feed the D100 predicate and B C-02's fix | CONSISTENT |

### 1.2 Lock-level inconsistencies (findings)

- **CRITICAL · ARTIFACT-3 B5 vs D089 + D105 E5 — storage leaves lose their
  tenure floor.** D089 classifies storage leaves as RARE STRUCTURAL (floor =
  2+ qualifying years). Artifact 3 B5's gate is "E5 + stage floor SEEDLING" —
  **no D1 floor** — and register E5 ("media share ≥0.5") also omits it. Sibling
  rows B3 (phyllodes), B4 (cladodes), B6 (thorns) all carry D1. A new user's
  media-rich cluster could manifest the rare structural modification, destroying
  D089's rarity split. **Location:** SCHEMA.md 2.5 B5; D089 (1); D105 E5.
  **Fix:** add D1 to B5 and E5.
- **MAJOR · ARTIFACT-3 B10 vs D089 — contractile gets a forbidden tenure gate.**
  D089: contractile roots = SUBTLE tier, "no tenure gate". Register E10: no
  floor. Artifact 3 B10: "Universal-ish (no axis gate; **D1 floor**)". Same
  artifact, opposite error from B5. **Location:** SCHEMA.md 2.5 B10; D089 (2).
  **Fix:** delete the D1 note from B10.
- **MAJOR · I-audit §2.5 particle-cap arbitration never applied.** The
  recursive audit mandates "one number must win … adopt **120**"; D111(5)
  locked "**~150–300 sprites**" as the shared bloom-rain/leaf-fall budget. No
  number sits in the register (C-group has no particle row). **Location:**
  I-recursive-audit.md §2.5; D111(5); D-accessibility M-3. **Fix:** one number
  at the register/dev-tools calibration (paper-run).

### 1.3 Record drift (later decisions changing earlier locks — all benign but unstated)

- **MINOR · C2 caps the wave season at 4 waves; D099 N-4a says overflow blooms
  in "successive waves across the flowering season" (no cap).** The register
  wins (user-approved number-lock), but no "amends D099" note is recorded.
- **MINOR · D105 C4 (1 legend crown; other Groves = large blooms) refines
  D092(5) ("every Grove manifests as THE transformation").** Compatible intent
  ("nothing unrewarded"), unstated as an amendment.
- **MINOR · LOD numbering differs between G P-01 (LOD-0/1/2) and D111(4)
  (LOD-1/2/3).** Same ladder, renamed; document the mapping once.
- **MINOR · 7 presence-domains (D104) vs 8 Artifact-1 rows.** Row 8
  (Periods/Vacation) is explicitly protected-presence, not a domain — consistent
  with F6, but the row count invites a misread.
- **MAJOR · D097(5) still claims "consistent with all locks" citing N-7 —
  which D100 overturns — and D100 never cites D097 in its LANDS.** The I-audit
  (§2.1) required one entry amending D097(5); it was not made. The false claim
  stands in the record. **Location:** TEMP-PLANNING D097(5), D100.

---

## 2. FINDING → RESOLUTION TRACEABILITY

Legend: **D0xx** = resolved by that decision · **A1/A2/A3** = resolved by
Artifact 1/2/3 (D104/D105/D106) · **DEF(home)** = deferred with named home
(engine contract, mockups/Step 4, trait-space/Step 7, paper-run calibration,
perf gate/tree-5, M11 docs pass) · **GAP** = no resolution and no deferral.

### 2.1 Wave 1 — F-recursive-audit (7 N-findings + 5 contradictions + 7 G-gaps)

| Finding | Resolution |
|---|---|
| N-1 M9 backdated growth | D097 |
| N-2 restore/backup × tree | D098 |
| N-3 §5 relabeling collision | D091 (withdrawn) |
| N-4 banked-bud unboundedness | D099 N-4a/N-4b + D105 C1-C3 |
| N-5 media in early clusters | D099 N-5 |
| N-6 why-panel mirror boundary | D099 N-6 + D110(1) (H-02) |
| N-7 backdating window | D100 (overturns) |
| Contradiction 1 (first-bloom stage) | D090 + D092 |
| Contradiction 2 (SEED branch-buds) | D094(1) (closed package + ghosted strip) |
| Contradiction 3 (first-winter shed) | D095 (+ LOOPHOLES hot-zone note) |
| Contradiction 4 (twig start) | D090 + D105 A3 |
| Contradiction 5 (post-bloom directness) | D092 + D095 |
| G-1 … G-7 lock-coverage gaps | G-1 D091 · G-2 D098 · G-3 D097 · G-4 D100 · G-5 D110(1) · G-6 D099 N-4b · G-7 DEF(A1 class-7 rows) |
| 9 convergence root causes | D090/D092/D101/D102/D104/D105/D106 |

### 2.2 Wave 1 — A-stage-class-matrix (33)

| Finding | Resolution |
|---|---|
| C-01 first bloom at MATURE | D090 + D092 |
| C-02/C-03 fruit pipeline | D095 (states) + matrix promotion **DEF(LOOPHOLES §8)** — the "fruits only after first bloom +1 season" cell is still draft |
| C-04 old-growth reduced fruit + mast years | D095 partial; mast-year logic **DEF(engine contract, B M-01 cluster)** |
| C-05 OLD-GROWTH capacity "—" | D105 C6 + D111(4) LOD |
| M-01…M-03 stage compression/boundaries | D090 + D101 |
| M-04 seed branch-buds | D094(1) |
| M-05 first branch at SEEDLING | D094(2) |
| M-06 SAPLING bloom | D090/D092 |
| M-07 leader timing | D088 (leader rule); timing cell DEF(matrix) |
| M-08 modifications at OLD-GROWTH | D093 (stage floors) + D089 |
| M-09 twig feed vs stage gate | D090 + D105 A3 |
| M-10 capacity numbers | D105 |
| M-11/M-19 seedling twigs | D094(2) + D090; leaf-form cell DEF(matrix) |
| M-12 storage-leaf at OLD-GROWTH | D099 N-5 + D089 (character from 2y) |
| M-13/M-15/M-16/M-17/M-18/M-20/M-22/M-26/M-31 | DEF(matrix promotion — cell-level botany wording) |
| M-14 bud-burst vocabulary | DEF(matrix) |
| M-21 season at every stage | D095 |
| M-23 tendrils | D088 adaptation 7 / D089 |
| M-24 SEED bud rendering | D094(1) bank counter + why-panel |
| M-25 direct blooms post-bloom | D092 |
| M-27 tier→stage ladder | D092 + D105 C4/C6 |
| M-28 SEED imbibition | D094(1)/(2) |
| M-29 first dormancy at SEEDLING | D095 |
| M-30/M-31 adaptations in class 7 | D093/D103 (trigger authority) |
| m-01…m-12 (12 minors) | D090/D095/D105/D111 or DEF(matrix) |

### 2.3 Wave 1 — B-temporal-fidelity (22)

| Finding | Resolution |
|---|---|
| C-1 two birth dates | D090 + D102 |
| C-2 stage starvation | D090 + D101 |
| C-3 L-02 vs L-05 | D092 + D095 |
| C-4 master clock ticks | D090 + D105 B-group |
| C-5 two ring calendars | D090 C + D105 F3 |
| M-1 bloom/spring alignment | D092 + D095 |
| M-2 season vs newborn | D095 |
| M-3 calendar tint path | D105 F1/F2 + A1; tint surface **DEF(Step 7, DV-M2)** |
| M-4 quiet-weeks/protected absence | **GAP** — see §3 CRIT-1 |
| M-5 D089 floor × six-domain | D093 + D101 |
| M-6 bud-wither/scar timeline | D099 N-4b + D087; scar cap DEF(engine contract) |
| M-7 one-notification scope | D094(3) |
| m-1 first-fortnight flood | D092 + D096 |
| m-2 bodyweight family | D104/A1 (V→gym) |
| m-3 pre-existing users' bloom | D097 |
| m-4 storage-leaf swap | D099 N-5 + D105 E5 (B5 floor defect, §1.2) |
| m-5 seedling revival | D094(2) + D088 dormancy |
| m-6 yearbook/ring-less review | DEF(trivial; docs pass) |
| m-7 milestone-review anniversary | D102 |
| m-8 multi-tier re-bloom | D092(6) |
| m-9 sub-40-word entries | D105 A2 |
| m-10 vacation family | D104/A1 (VI→base) + protected-absence cluster **DEF(engine contract)** |

### 2.4 Wave 1 — C-botanical-coherence (21)

C-1→D090/D092 · C-2→D094(1) · C-3 (stolons)→D103 · M-1→D094(2) ·
M-2→D090 · M-10→D095/matrix · M-3 (compound leaf naming)→DEF(matrix) ·
m-4→D105 C6 + D111(4) · m-2 (spring flush)→D095 · M-4 (pseudanthium
collapse)→D091 + D112(1) · M-5 (tendrils)→D088/D089 · M-7 (spadix)→D112(1)
· m-3/m-5→DEF(matrix/trait-space) · M-3b (9 families)→D112(1) · M-6
(contractile)→D105 E10 (B10 gate defect, §1.2) · M-9 (matrix gates
adaptations)→D093 + D089 · M-8 (young-tree seasons)→D095 · m-1 (old-growth
mast)→DEF(engine contract, B M-01 cluster).

### 2.5 Wave 1 — D-gamification-timeline (17)

C-01→D090/D101 · C-02→D092/D096 · M-01→D092/D095 · M-02 (ring tier curve)→
D105 C4 + D113(3) · M-03→D092/D096 · M-04 (loudness)→D092 + D094 ·
M-05 (day-1 rungs)→D092/D096 · M-06 (Pith)→D092 + family-VIII rule
DEF(flower-overlay contract) · M-07 (softness cluster)→D105 A2 ·
m-01 (bud owner)→D087/D100 DEF(engine contract) · m-02 (twig farm)→D105 A3 ·
m-03/m-04/m-05 (trophy curves)→DEF(achievement system, not tree) ·
m-06→D095 · m-07 (gold)→D112(2) + D111(7) · m-08 (verified no conflict).

### 2.6 Wave 1 — E-ux-stage-surfaces (16)

C-1→D094(1) · C-2→D094(3) · C-3→D095 · M-1 (destructible anchor)→D102
(monotonic-existence residual **DEF(engine contract)**) · M-2 (duality
readouts)→DEF(Step 7, DV-M5) · M-3 (anatomy gating)→DEF(matrix/Step 7) ·
M-4 (zoom)→D111(4) + D105 C6 · M-5 (dormancy vocabulary)→D095 + D099 ·
M-6 (day-1 interactions)→D094(1)/(5) + D111(1) · M-7 (replay scope)→D094 +
D109(1) · M-8 (imports birth)→D100 + D102 · m-1→D111(4) · m-2→D112(2) ·
m-3 (no-tree state)→DEF(trivial) · m-4→superseded by wave-2 D-brief
(D111) · m-5→D094(5).

### 2.7 Wave 2 — A-clock-integrity (15)

| Finding | Resolution |
|---|---|
| C-1 retroactive contradiction | D100 |
| C-2 destructible anchor | D102 |
| C-3 writtenAt guard | D108(3) + D109(2) (columns implied); future-dating clamp + clock sanity **DEF(engine contract)** |
| M-1 season clock | D105 F1 |
| M-2 supersession/revokes | D108(3) |
| M-3 cache invalidation on delete | D108(1) fingerprint |
| M-4 total order | D108(3) (per I-audit §2.3 arbitration) |
| M-5 protected absence | **GAP** — see §3 CRIT-1 |
| M-6 read surface | D110(6) + D107 (media owner) |
| M-7 malformed payloads | **DEF(engine contract)** — no D |
| M-8 anchor definitions | D102 (ratchet/counting-set residual DEF(engine contract)) |
| m-1 future-dated | **DEF(engine contract)** — no D |
| m-2 leap drift | D090 C + D105 F3 |
| m-3 pair precedence | D105 F1 + D108(3) |
| m-4 travel skew | D105 F1 |

### 2.8 Wave 2 — B-economics-scale (19)

C-01→D105 C4 + D096 · C-02→D100 + D113(1) · C-03→D105 · M-01 (rarity dries
up)→**DEF(engine contract, mast-year)** — not minted in D113 ·
M-02→D105 C5 · M-03 (rebuild)→D108 + DEF(P-08 chunking) · M-04 (waves)→
D105 C1/C2 (re-fire subtle-tier rule DEF) · M-05→D113(3) · M-06 (bloom
inversion)→**DEF(engine contract, mast-year)** · M-07→D105 A4 · M-08→
D111(4) + D105 C6 · M-09→D113(4) · M-10 (legend dilution)→D105 C7 + C4 ·
m-01→D105 F8 · m-02 (bud scars)→**DEF(engine contract)** · m-03→D105 A3 ·
m-04→D108(1) · m-05→D108(3) · m-06 (legend card cap)→**DEF(engine contract)**.

### 2.9 Wave 2 — C-device-state (14)

C-1→D109(1) · C-2→D109(2) · C-3→D108(3) · C-4→D109(3) · M-1 (anchor
per-install)→D102 (ratchet DEF) · M-2 (offline gaps)→D109(1) + D108(5);
snapshot cold-start DEF(P-06/m-2) · M-3 (coach viewed)→D109(1) ·
M-4 (storage-leaf tier moves)→DEF(engine contract, media rows) ·
M-5 (leaf canopy cap)→D111(4) + D105 C6 (count-rule DEF) · M-6 (dayKey/season
clock)→D105 F1 (capturedAt-UTC DEF) · m-1→D109(1) · m-2 (vaulted deletes)→
DEF(engine contract) · m-3 (adopted media)→D113(2)/(4) · m-4 (watermark
not in settings)→D109(1).

### 2.10 Wave 2 — D-accessibility-surface (12)

C-1→D111(1) · C-2→D111(2) · C-3→D111(3) · M-1→D111(8) · M-2 (small
screens)→DEF(mockups/Step 4) · M-3 (motion tiers)→D111(6) (particle number
conflict, §1.2) · M-4 (education)→DEF(mockups/Step 4 + engine copy rows) ·
M-5 (contrast)→D111(7) · m-1 (anatomy legends)→DEF(Step 7/tree-4) ·
m-2 (glow)→D112(2) + D111(3) · m-3 (keyboard)→D111(1) · m-4 (dynamic
type)→DEF(tree-4/mockups).

### 2.11 Wave 2 — E-design-vision (21)

DV-C1…C5→D112(1)…(5) (all five CRITICALs locked) · DV-M1 (shell)→DEF(Step 7
residual/mockups) · DV-M2 (calendar/season dual)→DEF(Step 7; also carries
the LOOPHOLES tint rule) · DV-M3 (coach branch)→DEF(Step 7) ·
DV-M4 (dashboard dual)→DEF(Step 7) · DV-M5 (local duals)→DEF(Step 7) ·
DV-M6/DV-M7 (day-1 + sparse beauty)→DEF(Step 4 mockups) · DV-M8 (gold
boundary)→D112(2) partial + DEF(engine contract) · DV-M9/DV-M10→D112(4)
partial + DEF(mockups) · DV-M11 (fruit drivers)→DEF(Step 7, 17-audit) ·
DV-M12 (why-panel/ceremony spec)→DEF(Step 7 + engine contract) ·
DV-m1…m4→DEF(Step 4/7).

### 2.12 Wave 2 — F-input-map-clashes (38)

F-01→D106 · F-02→D104 · F-03→D101 · F-04→D102 · F-05→D104/A1 + inventory
correction · F-06→D105 A2 · F-07→A1 (body row + review finding 3) ·
F-08 (veggie double-feed)→**DEF(engine contract, auto-tick discount)** ·
F-09→D110(1)/H-03 + A1 · F-10→D110(1) · F-11→DEF(inventory correction) ·
F-12→D112(4) · F-13 (wikilinks)→DEF(branch-detail design) ·
F-14 (settings-in-function)→**DEF(engine contract)** · F-15→D107 ·
F-16→DEF(inventory correction) · F-17→D104 · F-18 (fruit hang/double-count)→
**DEF(engine contract)** (D107 "fruits = completed goals only" partial) ·
F-19 (auto-tracked habits)→**DEF(engine contract, auto-tick discount)** ·
F-20 (calendar rows/future dates)→D105 F1/F2 + tint DEF(Step 7) ·
F-21 (plan-vs-actual)→DEF(inventory/engine contract) · F-22→DEF(inventory
correction) · F-23→D103 · F-24→D103(3) + A3 D + D106 · F-25 (F-15 rungs)→
DEF(ceremony language, tree session) · F-26 (storage-leaf)→D089 + D099 N-5
+ D105 E5 (B5 defect, §1.2; matrix cell DEF) · F-27 (duality gate
exception)→DEF(Step 7, DV-M5) · F-28→D106 · F-29→D105 A3 · F-30→D105 A4 +
D101 · F-31→D105 B4 · F-32→D105 D-group + F7 + D101 · F-33→D105 E-group ·
F-34 (revival bar)→**DEF(engine contract)** (E9 has no gap number) ·
F-35 (intensity bands)→**DEF(paper-run calibration)** · F-36 (quiet
weeks)→**GAP** — see §3 CRIT-1 · F-37 (notification)→D094(3) ·
F-38→A1 row 7.

### 2.13 Wave 2 — G-render-perf (22)

P-01→D111(4) · P-02→D111(6) (particle number conflict §1.2) · P-03→D111(5) ·
P-04→D108(1)/(2) · P-05 (perf gate numbers)→**DEF(tree-5/perf gate)** — no
budget in the register · P-06 (snapshot scope)→**DEF(engine contract)** ·
P-07→D108(1) · P-08 (chunked rebuild)→D108(2) partial + DEF · P-09
(checkpoints)→**DEF(engine contract)** · P-10→D108(2) · P-11/P-12/P-13→
DEF(tree-5) · P-14→D107 + D110(6) · P-15→D111(6) · P-16→D111(4) ·
m-1…m-6→DEF(tree-5/perf gate) (m-5 covered by D108(2)/D107).

### 2.14 Wave 2 — H-coach-privacy (13)

H-01→D102 · H-02→D110(1) · H-03→D110(1) · H-04 (quiet discipline copy)→
**GAP** — see §3 CRIT-1 · H-05→D110(2) · H-06→D110(2) · H-07→D110(3) ·
H-08→D110(2) + D092 · H-09→D110(1) + A1 · H-10→D109(2) + D102(2) ·
H-11→D102(5) · H-12 (coach cites tree)→D110(2) partial + DEF(CoachSystem
docs pass) · H-13 (expired goals)→DEF(engine contract).

### 2.15 Wave 2 — I-recursive-audit (10)

IA-1→D107 · IA-2→D110(4) · IA-3→D113(1) · IA-4→D113(2) · IA-5→D110(5) ·
IA-6→D110(6) · IA-7 (cache lifecycle decades)→DEF(engine contract) ·
IA-8→D110(6) · IA-9→D108(5) · IA-10→D108(4).
Inter-brief contradictions: §2.1→D100 · §2.2→**GAP (CRIT-1)** · §2.3→D108(3) ·
§2.4→D102 + DEF(ratchet) · §2.5→**GAP (particle cap)** · §2.6→D111(6) ·
§2.7→D105 A3 · §2.8→D108 + D110(6). Lock-coverage gaps: G-1→**GAP** (matrix
banked cells, §3 MAJ-7) · G-2→A1 ✓ · G-3→D109(1) partial + DEF · G-4→D110(1)
+ A1 ✓-ish · G-5→D112(1) implied, explicit approval DEF(docs pass).

### 2.16 The gap list — findings with NO resolution AND NO deferral

1. **A M-5 (wave-2) — protected absence (RHYTHM-neutral data).** No D; the
   I-audit's arbitration was assigned [D101], which minted a different
   decision. **CRITICAL.**
2. **F-36 (wave-2) — quiet weeks display-only.** Direct contradiction with
   A M-5, un-arbitrated. **CRITICAL.**
3. **H-04 (wave-2) — shared quiet discipline (copy half).** Same un-minted
   cluster. **CRITICAL.**
4. **B M-4 (wave-1) — quiet-weeks/planned absence.** Same cluster; its
   proposed resolution ("protected absence → bud scales") was never locked.
   **CRITICAL.**
5. **LOOPHOLES §7 quiet-weeks open item.** Its home ("input map step") has
   passed (D104–D106) without a resolution record. **CRITICAL.**
6. **Artifact 3 B5 — storage-leaf tenure floor omitted** (lock-vs-lock with
   D089). **CRITICAL.**
7. **Artifact 3 B10 — contractile D1 floor invented** (lock-vs-lock with
   D089). **MAJOR.**
8. **I-audit §2.5 particle cap (120 vs 150–300)** — arbitration dropped; the
   audit record and D111(5) both stand. **MAJOR.**
9. **D097(5) "consistent with all locks" vs D100's overturn of N-7** — the
   required amendment entry was never made. **MAJOR.**
10. **INPUT-INVENTORY §9/§14 stale anchor rows** — D102(4) claims correction;
    the file still carries the coach-anniversary wording (lines 202, 299).
    **MAJOR.**
11. **LOOPHOLES.md wave-2 staleness** — §8 status table stops at D099; §7
    hot zones and the "CLOSED" claim predate D100–D113. **MAJOR.**
12. **docs/DecisionLog.md has zero D100–D113 entries** (verified 0 matches).
    **MAJOR.**
13. **I-audit G-1 — matrix SEED/SEEDLING banked cells (classes 1–5)** — no
    resolution anywhere; matrix still draft. **MAJOR.**
14. **A C-2 / C-device M-1 — "tree never dissolves" monotonic existence +
    anchor ratchet** — not minted; "no events = no tree" (D090 B) still
    stands unreconciled against the frozen anchor under the M0 uncheckIn
    hard-delete. **MAJOR (partial deferral: engine contract).**
15. **A m-1 / A C-3-rule-2 future-dating exclusion** — not in any D, not in
    the register. **MAJOR (home: engine contract — unstated).**
16. **A M-7 payload-validation ladder** — no D. **MAJOR (home: engine
    contract — unstated).**
17. **F-08/F-19/F-18 dual-feed discount rules** — I-audit Step 1a promised
    them in Artifact 1; D104/A1 does not contain them. **MAJOR (home: engine
    contract — unstated).**
18. **B M-01/M-06 mast-year compounding** — Step-8 residual, not minted in
    D113. **MAJOR (home: engine contract — unstated).**
19. **G P-05 perf-gate numbers** — not in the register. **MAJOR (home:
    tree-5 — unstated).**
20. **A M-8 anchor counting-event set (absence exclusion)** — D102's "first
    in-window event" admits a habit.missed birth. **MINOR (home: engine
    contract — unstated).**

---

## 3. ARTIFACT CONSISTENCY vs the locks

| Artifact | Check | Result |
|---|---|---|
| A1 (domain table) × D104 | 7 domains, attachments, presence owners, 7→5 mapping, families IV/VI/IX homes | CONSISTENT |
| A1 row 8 × D104 | Periods = protected presence, not an 8th counting domain (F6 reads 7) | CONSISTENT (presentation note) |
| A2 (register) A-group × D100/D101 | grace ±3d; twig ≥15d/mo; stage-year ≥200d; ring ≥40d/domain (D101's deferred piece LOCKED) | CONSISTENT |
| A2 B-group × D090 ticks | B1–B5 = D090's five ticks, numbered | CONSISTENT |
| A2 C-group × D099 | C1/C2 = N-4a; C3 = N-4b; C4 = legend/crown; C5 = twig bound | CONSISTENT (C2 note §1.3) |
| A2 D-group × D089/D093/D101 | D1 2 / D2 3 / D3 5 stage-years; floors read stage-years | CONSISTENT |
| A2 E-group × D088 signatures | E1–E14 = the 14 adaptation signatures; caudex/buttress match D088's worked example | CONSISTENT |
| A2 F-group × D085/D095/D097 | fixed-date seasons; render clock = stored tz; anchored windows; axis formulas; replay ~2s/yr | CONSISTENT |
| A3 (trigger table) A × D092/D095/D096 | flower pipeline incl. D095 winter-bank and D096 banking, C4 legend cap | CONSISTENT |
| A3 B rows × D093 gates | trigger/tenure/axis/stage-floor per row; manifest at next annual bloom | **2 DEFECTS: B5 missing D1, B10 extra D1 (CRIT-2, MAJ-1)** |
| A3 C × D094/D097/D098 | structural/ceremony triggers complete | CONSISTENT |
| A3 D × D103 | no-double-fire map = D103(3) | CONSISTENT |

**Register number provenance is otherwise clean:** every D089/D090/D092/D093/
D095/D097/D099/D100/D101 number referenced in the decisions has a register row.

---

## 4. THE OPEN ITEMS LEDGER (short — every item with a home)

| # | Item | Home | Status |
|---|---|---|---|
| 1 | **Quiet-weeks / protected-absence semantics** (A M-5 × F-36 × H-04 × B M-4) | **NO HOME MINTED** — proposed: engine contract (register E-group adjacencies) + docs pass | **CRITICAL — open** |
| 2 | Calendar tint rule (LOOPHOLES §7) | Step 7 / mockups (DV-M2 resolution) | open, has home |
| 3 | Notification ambiguity (LOOPHOLES §7) | **RESOLVED by D094(3)** — LOOPHOLES §7 list stale | resolved; housekeeping |
| 4 | RESOURCE ceiling (20 events/day, D105 note 2 + F4) | dev-tools tuning at the paper-run | open, has home |
| 5 | Particle cap (120 vs 150–300, I-audit §2.5) | dev-tools/paper-run calibration | open, has home |
| 6 | Stage×class matrix promotion (LOOPHOLES §8) | matrix promotion at the docs pass / engine contract | open, has home |
| 7 | 17-audit execution (D112(3) + D113(5)) | PLAN Step 7 (trait space) | open, has home |
| 8 | Perf-gate numbers (G P-05) | tree-5 / perf gate at M9 | open, has home |
| 9 | Mast-year compounding + bloom monotonicity (B M-01/M-06) | engine contract (Step-8 residual) | open, has home |
| 10 | Identity-axis explicit approval (I-audit G-5) | docs pass (D112(1) implies approval) | open, has home |

---

## 5. VERDICT

**PASS-WITH-FIXES.** The decision set is consistent at its core (clock, anchor,
tier schedule, seasons, caps, and the artifacts trace cleanly to their
decisions), and the large majority of the 164 wave-2 + 137 wave-1 findings
carry a resolution or a named deferral. It is not a clean PASS: 2 CRITICAL
(the un-minted quiet-weeks arbitration; the storage-leaf tenure-floor defect in
Artifact 3) and 12 MAJOR defects (incl. the contractile-gate inversion, the
dropped particle-cap arbitration, the uncorrected INPUT-INVENTORY rows, the
stale LOOPHOLES/DecisionLog records, the unamended D097(5), and the still-draft
stage×class matrix) sit in the locked record, and 20 findings have no
resolution and no deferral. All are fixable without reopening a locked
decision — they are record corrections and one arbitration.

### Severity counts

- **CRITICAL: 2** (§1.2 CRIT-2; §2.16 items 1–5/CRIT-1 cluster)
- **MAJOR: 12** (§1.2 MAJ-1/MAJ-2/MAJ-4; §2.16 items 7–19)
- **MINOR: 11** (§1.3 notes; §2.16 item 20; LOD numbering; C2/C4 unstated
  refinements; A1 row-8 presentation; anchor counting-set)
- **Findings with NO resolution and NO deferral: 20** (listed §2.16)
- **Findings resolved or deferred-with-home:** wave-1 109/109 mapped
  (F-audit's own 19 + root causes all resolved by D090–D113) · wave-2
  164/164 mapped, of which 144 carry a D-number/artifact resolution and the
  remainder carry a deferral with a named home.

### Fixes required before the engine contract is written

1. Mint the protected-absence arbitration (A M-5 data union + F-36 copy
   constraint, zero streak shielding) — D-number + DecisionLog entry.
2. Repair Artifact 3: add D1 to B5 (storage leaves), remove it from B10
   (contractile).
3. Resolve the particle cap (one number; register C-group) and record the
   C2/C4 refinements as amendments.
4. Correct INPUT-INVENTORY §9/§14; amend D097(5); add D100–D113 to the
   DecisionLog; refresh LOOPHOLES §7/§8; promote the stage×class matrix.
5. Record the engine-contract deferrals explicitly (future-dating clamp,
   payload ladder, dual-feed discounts, mast-year, perf numbers, monotonic
   existence, anchor ratchet) so no finding re-surfaces at Step 8.