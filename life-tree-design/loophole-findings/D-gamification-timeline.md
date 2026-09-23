# LOOPHOLE FINDING — D: THE GAMIFICATION TIMELINE

**Hunt date 2026-08-30.** Lens: contradictions between the achievement
system's clocks (trophy/streak/rung fire times) and the tree's stage
clock (seed → seedling → sapling → pole → mature → old-growth, with the
stage-gated banking model). Sources read in full: ACHIEVEMENT-SCAN.md,
LOOPHOLES.md, SCHEMA.md, VISION.md, TRAIT-SPACE.md, INPUT-INVENTORY.md,
TEMP-PLANNING.md tree-7 (D085–D089), docs/Gamification.md, and the raw
brief scan-outputs/02-achievements.md (every trigger verbatim).

**Root cause behind most findings — the multi-clock collision.** The
system runs FOUR clocks: (1) the anchored domain-year windows
(`yearlyPass` — Full Orbit, chains), (2) the six-domain ring year
(Life, Fully Logged — the trunk rings), (3) the calendar season
skeleton (D085 — spring bloom), (4) the tree's LIFE STAGE (the master
clock, stage-gated manifestation). The first-bloom trigger, the
Ring/Grove visual magnitudes, and the rare-tier banking all inherit
conflicts from these clocks not being reconciled in the locked docs.

---

## CRITICAL

### C-01 — The first bloom is gated on the six-domain "qualifying year": non-six-domain users never flower, and the locked docs contradict each other on the trigger

**Location:** LOOPHOLES §1 ("at the flowering stage (first qualifying
year), all banked achievement buds burst") + SCHEMA §3 ("Secondary
growth trigger … candidate: the first qualifying year; qualifying = the
locked Life-Fully-Logged year rules") + LOOPHOLES §2 matrix row 6
(SAPLING = "FIRST BLOOM (the banked buds burst)" — unconditioned).

**What fires when:** The first bloom is the ONLY path by which banked
achievement buds ever become flowers ("the earned cherry-blossom
moment"). If its trigger is the Life-Fully-Logged year (all six domains
each ≥1 qualifying entry in one 365-day window — VIII-5's bar), then:

- A user who never logs one domain (e.g., no media/vlogs, or no body
  tracking) can NEVER close a qualifying year → no rings, no first
  bloom, and **every achievement they earn stays a bud forever**. This
  violates the locked master principle "data is never lost and never
  unrewarded" (LOOPHOLES §1) and the matrix's own SAPLING cell, which
  grants the FIRST BLOOM unconditionally at the stage (~year 1–2).
- A six-domain user's first bloom and their first ring close land in
  the SAME moment (the qualifying year closes = the ring brands + the
  buds burst + Pith fires) — three ceremonies stacked without a stated
  ordering.

**Internal contradiction:** LOOPHOLES §1 + SCHEMA §3 (qualifying-year
gate) vs LOOPHOLES §2 stage table (SAPLING ~year 1–2 = FIRST BLOOM,
calendar-derived, no gate). The docs disagree with themselves.

**Resolution (consistent with the locks):** decouple. The flowering
stage is a STAGE event (the stage clock), not an achievement-year
event. The first bloom fires at SAPLING (~year 1–2 — e.g., the first
spring after 365 days of existence with any qualifying activity). The
six-domain bar keeps its own meaning: rings only. The why-panel
explains both halves ("you reached your flowering stage; these buds
were earned on <dates>"). Nothing unrewarded for partial-domain users;
SCHEMA §3's "candidate" wording is exactly where this gets locked.

### C-02 — "All banked buds burst" at the SAPLING first bloom vs the tier-gated expression: the rare-tier/Grove split is undefined, so year-1 Grove fires (Ghost, ceiling rungs, Advanced standards) either burst the top-tier transformation on a 1–2-year-old tree or contradict the locked matrix

**Location:** LOOPHOLES §2 matrix row 6 (SAPLING = "FIRST BLOOM (all
banked buds burst)") vs LOOPHOLES L-05 ("manifests when the tree's
stage can express it") vs LOOPHOLES §2 capacity table (MATURE = "full
flowering + **rare tiers**"; OLD-GROWTH = "**the largest visuals**")
vs D089 (modifications are "RARE ITEMS — reserved for genuine years of
consistency").

**What fires when:** Grove-tier events can fire in the first year —
Ghost in the Machine (IX-5) earliest at **day ~182** (the bottleneck is
The Schedule Never Breaks' 26 consecutive weeks; NoDeviation's run
needs 30 logged days ±3% and Like Clockwork 90 completions), and Grove
rungs fire on **day 1** (The Furnace 140kg bench, The Monolith 220kg
squat, Dragon Slayer 260kg DL, Atlas Press 100kg OHP, Cast Iron Arms
60kg curl — the genetic-ceiling clause of the Grove definition makes
these legitimately Grove-tier). III-18 Advanced strength standards are
also Grove-tier and reachable in year ~1–2.

**What the tree expresses:** Under the literal matrix, the SAPLING
first bloom bursts EVERY banked bud — including the Grove buds — so a
1–2-year-old tree wears the D086 top-tier transformation (Ghost = "the
engine's largest single visual", SCHEMA §6) plus the largest-visual
Grove rung flowers. That flattens the entire visual rarity economy from
day one (every later Grove is visually a repeat), contradicts the
capacity table's MATURE "rare tiers" and OLD-GROWTH "largest visuals"
cells (which become vacuous), and contradicts D089's spirit (rare
things visible at a glance must be earned through years). Under L-05's
"expressible stage" reading, the Grove buds wait for MATURE/OLD-GROWTH
— but then "ALL banked buds burst" is false. Either way, the locked
docs are internally inconsistent, and the tree has no contract for what
a year-0.5 Ghost shows.

**Resolution (consistent with the locks):** split banking by tier —
the manifesting schedule is part of the stage contract:
- Sprout/Root/Branch/Heartwood buds → burst at the SAPLING first bloom
  (the cherry-blossom moment stays rich and earned).
- Ring-tier buds → ride the yearly bloom (D085 calendar spring) after
  their qualifying year closes.
- Grove-tier buds → bank to MATURE (year 4+) for the "large visuals";
  the D086 top-tier transformation (Ghost, Old Growth, Ouroboros, Yew,
  Ten Years, Dragon Slayer-class) → bank to OLD-GROWTH (decade+).
- The why-panel states the exact gate per bud ("blooms at old-growth —
  the largest visuals wait for the oldest trees"). L-05's wording
  ("blooms when the tree reaches its flowering stage") must be amended
  to tier-aware wording, and the matrix row 6 cell must read "FIRST
  BLOOM (all banked **stage-eligible** buds burst; rare-tier buds wait
  per the tier schedule)". This preserves L-02/L-05, D085, D086, D088,
  D089 and "nothing unrewarded" (the bud is visible + claimed + the
  why-panel explains the wait).

---

## MAJOR

### M-01 — The anchored-year first bloom is season-agnostic and can land in autumn/winter, contradicting D085's spring-bloom skeleton

**Location:** D085 ("every tree blooms in spring" — calendar skeleton)
vs LOOPHOLES §1 first-flowering event (fires when the first qualifying
year CLOSES — an anchored 365-day window from the user's first event,
which closes 12 months after they start, in any season).

**What fires when vs what the tree expresses:** a user starting
August 15 gets their "cherry-blossom moment" on August 15 of the next
year — the first bloom bursting in late summer, while the season system
is showing fruit/color → honest autumn dormancy. Botanically incoherent
by the system's own standard ("the cherry-blossom-Japan standard:
everyone can see it", VISION §6).

**Resolution:** the first bloom is a SPRING event: the first bloom
fires at the first calendar spring after the SAPLING stage is reached
(and, per C-01's decoupling, after the qualifying-activity floor);
banked buds simply wait a few months. D085 already owns the spring
bloom — the first bloom is its first instance, intensity-boosted by the
banked-bud count (a clean D085 "intensity modifier").

### M-02 — The ring-count tier curve is non-monotonic: rings 7–9 are LOWER tier than rings 5–6, and the Ring-tier magnitude is flat from year 1 to year 9

**Location:** VIII-11..VIII-20 (the ring-count trophies), mapped in
ACHIEVEMENT-SCAN §2 family VIII: Ring (1–2: One Year In, Two Years) →
Branch (3–4: Oak, Sapwood) → Heartwood (5–6: Ironwood, Cambium) →
**Ring (7–9: Latewood, Phloem, Cork)** → Grove (10: Yew).

**What fires when vs what the tree expresses:** the tier definitions
(Ring = "a full year passed and the thing was still true"; Grove =
"multi-year, decade-scale") make the 7/8/9-ring trophies definitionally
Grove-caliber — they are the most multi-year trophies in the catalog
after the decade ones — yet they sit BELOW the 5/6-ring trophies. The
tree's flower magnitude spine (D086) inherits this: a 5-ring tree shows
a Heartwood "rare flower family + small accent", a 9-ring tree shows a
Ring "distinctive bloom" — the older tree's flowers render SMALLER than
the younger tree's, exactly where the trunk ring layer is at its most
emphatic. Also within the Ring tier: Full Orbit (I-5) fires at year 1
and Cork fires at year 9 — the same "distinctive bloom + branch-level
visual event" for a 1× and a 9× event.

**Resolution (catalog untouched — it is locked):** tree-side
within-tier magnitude scaling: ring-family flowers scale their size/
accent with the ring count inside the tier (a 9-ring bloom is the Ring
tier's max, visually approaching Grove without crossing it); the
why-panel quotes the ring count. Optionally a DecisionLog note flagging
the 7–9 dip for the user's awareness (v2 owns tier labels; the tree
cannot re-tier, but the scan should record the definitional tension).

### M-03 — The year-3 Grove-tier x3/x5 chains fire during POLE (years 2–4), which per the matrix cannot express rare tiers; plus the dual-year-truth lets a Grove flower appear on a 0–2-ring trunk

**Location:** I-16/17, II-14/15, III-27/28, IV-13/14, V-8/9, VII-11/12,
VIII-7/8 (all Grove, fire at the close of the 3rd / 5th anchored year)
vs LOOPHOLES §2 (POLE = years 2–4, "flowers bloom directly" — no rare
tier; MATURE 4+ = "rare tiers").

**What fires when vs what the tree expresses:** the earliest possible
x3-chain fire is day ~1095 (year 3, POLE stage). Per the capacity
table, POLE cannot express rare tiers → the Grove flower must wait
until MATURE (year 4+) — an unstated ≤1-year banking gap with no
contract cell. Second: the chains' yearly bars are DOMAIN bars (e.g.,
Full Orbit = 300 journal days), while the trunk rings are the SIX-DOMAIN
bar — a journal-everything user fires I-16 (Grove) at year 3 with ZERO
rings on the trunk. The flower's "multi-year" magnitude reads against a
ringless trunk.

**Resolution:** (a) the tier schedule from C-02 covers the stage gap
(Grove → MATURE); (b) the why-panel template must state the domain-year
count explicitly ("3 years × 300 journal days — the trunk's rings count
fully-logged years, which is a stricter bar") so the two year-truths
never silently conflate; (c) note in the engine contract that Grove
magnitude is earned by the ACHIEVEMENT's own window, never by ring
count.

### M-04 — Coach loudness vs banking: the lines fire at data-time, the visuals bloom years later; the year-1 Ring cluster is a loudness wall; the first bloom is silent

**Location:** E12 + Gamification.md Coach tie-in ("ONLY Ring and Grove
receive Coach appreciation — one sincere derived line… celebrations
fire once per run/landing and never repeat congratulations"; the Coach
consumes `achievement.unlocked`, which E0 emits at the DATA fire) vs
the banking model (visual at stage time).

**What fires when vs what the tree expresses:**
- (a) A Grove-tier Ghost (day ~182) gets the Coach's "sincere derived
  line" for an achievement whose visual is a bud for years. The line
  references a fact (fine under facts-only), but the user's emotional
  moment (the bloom) is where the tree is loudest — and the locked rule
  already spent the line.
- (b) The first-anniversary Ring cluster — Full Orbit (I-5), One Year
  In (VIII-1), One Trip Around the Sun (II-12), A Year on the Bar
  (III-26), Full Orbit on Camera (VII-5) can all land within ~2 weeks
  → up to 5 Coach lines in the same fortnight. "One line at most per
  fire" permits it; the "rare, quiet" spirit of Ring/Grove loudness
  does not.
- (c) The first bloom (the biggest tree moment in years 1–2) is silent
  by construction — its buds' Coach lines all fired at data-time.

**Resolution (keeps both locks):** Coach lines fire at data-time
(unchanged — E12 rides `achievement.unlocked`); the bloom ceremonies are
tree-side visual events with no Coach speech (already "separate UI" per
the scan's note 11 — make that explicit); add a stated coalescing rule
for the anniversary cluster — one Coach line per 7-day window at most
across Ring/Grove fires (a schedule the ledger must approve, since it
amends "per fire" only in aggregation, not per-trophy entitlement).

### M-05 — Day-1 Grove rungs and day-1 Branch rungs front-load the whole rarity ladder onto week 1, and the gym branch's girth/latewood render target doesn't exist at SEED

**Location:** rung table R1–R47 (ACHIEVEMENT-SCAN §3/§4) + D088 (gym =
"branch growth + wood quality… strength standards = girth trend;
training consistency = dense latewood") + LOOPHOLES §2 (SEED = 0
branches, 5 branch-buds).

**What fires when vs what the tree expresses:** Grove rungs are
day-1-possible for elite users (R5/R10/R15/R19/R24); Branch rungs R40
and R43 (">0kg added" pull-up/dip — the softest thresholds in the whole
ladder) fire trivially on day 1; Root rungs (R1 60kg bench, R11 100kg
DL, R25 20 push-ups, R30 5 pull-ups) fire day 1 for average trained
users. A week-1 user can hold the full Sprout→Grove rung ladder as
banked buds (C-02's schedule absorbs the visual side). Unresolved: the
rungs also feed "branch wood quality / latewood density / girth trend" —
at SEED the gym branch is a bud with NO render target for girth or
latewood; an elite day-1 bench shows a girth trend that has nowhere to
render honestly (it cannot appear on the trunk — the trunk's girth is
overall consistency, D088).

**Resolution:** the girth/latewood owner derives continuously but its
RENDER is stage-scaled: SEED/SEEDLING = the branch-bud's scale/size
(visible at the bud, not the branch); SAPLING+ = the branch's girth
once the branch extends (the "lit mirror number" stays true in the
section UI at every stage — the mirror is data, the tree is the
stage-gated render). Add a contract row: "strength girth renders at the
branch, not before."

### M-06 — Pith (VIII-11): the tree's single most significant botanical event gets the smallest flower

**Location:** VIII-11 Pith — Sprout tier (ACHIEVEMENT-SCAN §2 family
VIII) — "rings ≥ 1 ever".

**What fires when vs what the tree expresses:** the first ring is the
tree's own botanical first (a full six-domain year; the first ring
closes; the first bloom bursts at the same moment per C-01). Pith maps
to Sprout = "the smallest bloom — a single common flower" (D086),
visually identical to Ink on the Page (day 1). The first-ring trophy
renders smaller than the Ring-tier year-1 flowers (Full Orbit etc.) that
fire the same week. Magnitude inversion at the crown-jewel moment.

**Resolution:** the tree cannot re-tier the catalog; the why-panel and
the bloom ceremony can: Pith's flower blooms IN the first ring's
ceremony (the first ring close is a branch/trunk-level event — D085's
ring-close), and the why-panel pairs it with the ring. If C-01's
decoupling passes, Pith's trigger (the six-domain bar) keeps its own
meaning; the visual rides the ring ceremony, not the Sprout-single-
flower default.

### M-07 — Perfect Month and the Branch-at-day-7–31 softness cluster: Branch-tier fires in weeks for near-zero differentiation

**Location:** II-6 Perfect Month (Branch, day 28–31, one habit, no
grace), II-7 Five Strong (Branch, day 7+, five 7-day streaks), II-8
Juggling Act (Branch, day 21), R40/R43 (Branch, day 1).

**What fires when vs what the tree expresses:** Branch = "the thing
extended somewhere new: a new domain, a new personal best, a new kind
of entry". A single-habit Perfect Month (28–31 days) is a consistency
feat, not an extension — it is Root/Heartwood-caliber by the
definitions (weeks = Root; months = Heartwood), yet renders as the
Branch "prominent flower family (inflorescence type)" — a tier HIGHER
than, say, a 90-day A Season Kept is NOT — wait, A Season Kept IS
Branch (90-day streak, day 90). The inconsistency: 90 days of journal
streak (I-3) and 28 days of one habit (II-6) are both Branch. Banked
buds absorb the timing; the tier-equivalence remains soft.

**Resolution:** MINOR-to-MAJOR depending on taste; the tree-side fix is
the within-tier accent scaling of C-02's schedule (branch-tier flowers
scale by the underlying effort: a 90-day streak reads larger than a
28-day month). No catalog change; record the softness in the scan.

---

## MINOR

### m-01 — Bud swelling vs grace-rescued days: the bud's owner is undefined

D087 says "streak momentum = swelling"; grace (1 day per 7-day window)
prevents the streak break but G19 says a grace-rescued day is NOT an
active day. If the bud reads the shielded streak, a max-grace user's bud
swells 14% louder than their effort; if it reads active days, the bud
visibly pauses on a day the streak survived. Neither reading is stated.
Resolution: the bud reads the STRICT owner (active days, G19 semantics);
the why-panel shows both ("streak 100 · grace 14"). Planned-rest
freezes map cleanly to bud scales (D088 row 14) — no conflict there.

### m-02 — Twig-count canopy is farmable at minimum effort

D088: "one twig per month of sustained presence per domain" (sustained
presence = ≥1 qualifying entry in that month). Five qualifying events/
month (1 per domain) = 60 twigs/year — the same silhouette as the
design's own "consistent user ~10 twigs/year per branch" example, which
assumes gaps but no rule enforces them. The canopy density (consistency
made visible) can't distinguish a 1-entry month from a 20-entry month
at silhouette level. Resolution: the twig's SIZE (and its leaf-cluster
count) scales with the month's volume via the RESOURCE axis — minimum-
effort twigs are visibly tiny; the count stays as the D088 unit.

### m-03 — Moved a Mountain's tonnage tier curve is front-loaded soft / back-loaded brutal (scan note 6, confirmed)

R44 100,000kg → Root fires at ~3–6 months (Root = "weeks"); R45
500,000kg → Branch ~1–2 years; R46 1,000,000kg → Heartwood ~3–5 years;
R47 5,000,000kg → Grove ~20–25 years. The Grove step lands at
OLD-GROWTH (aligned ✓) but the Root step is late for its tier, and the
Grove step's 2-decade latency means the tonnage family's Grove flower
arrives ~20 years after the day-1 Grove rungs — the family's magnitude
curve is not monotonic in time either. Resolution: accept (scan note 6
already flags "tiers by design intent, not calibrated difficulty") and
let C-02's schedule + within-tier scaling carry it; no tree-side
special-casing.

### m-04 — Novel-Length Life's Grove step (1M words) is content-paced, fireable at ~1.5–2 years

A 2,000-words/day writer crosses 1M in ~18 months — Grove ("multi-year,
decade-scale") at year 1.5–2, SAPLING/POLE stage. Banking (C-02) absorbs
the visual; the why-panel states the word count. The 25k Root step
(~12 days for essay-length entries) is fine. Record only.

### m-05 — The Archive Grows' Ring step (500h) fires at ~5–10 years — a year-magnitude flower for a 5–10-year achievement

10h (Root, ~2 weeks) → 50h (Branch) → 100h (Heartwood) → 500h (Ring,
~5–10 years of vlogging) → 1,000h (Grove, ~10–20 years). The Ring step
is UNDER-scaled by its own tier definition (a full year). Same
within-tier scaling note as M-02 (scale Ring-tier flowers by the
achievement's age when the tier is time-flat).

### m-06 — D087's "burst into new growth/leaves on completion" vs SEED's zero leaf capacity

The matrix row 2 (completions: SEED = banked, SEEDLING = bud bursts)
already stage-gates the burst; D087's wording is implicitly gated. One
line in the engine contract ("bud bursts render per the completion
stage cell, never before SEEDLING") closes the wording gap.

### m-07 — Zero-XP / gold carry-over: the tree must not use gold for achievement visuals

Scan §5 constraint ("Gold is streaks-only… the tree must not use gold
for achievements") has no contract cell yet. The Ring-tier "distinctive
bloom" and the D086 derived accents must exclude a gold palette
(derived accents come from the domain-balance palette; gold is
reserved for the streak/bud system if used anywhere). Verify at the
engine-contract step; no logic change.

### m-08 — Day-1-possible IX-4 Wrote It Down (Root) and II-1/III-1 (Sprout) — no tree conflict

Sprout fires on day 1 are the tier's definition; IX-4 (PR + 40-word
journal same day) is Root-tier on day 1 for a lifter who journals —
within "the thing took hold"? Borderline; banking absorbs. Record only.

---

## STAGE × TIER FIRE-TIME REFERENCE (the audit table)

Earliest REAL fire time per tier, given the triggers (not the
definitions):

| Tier | Definitional time | Earliest real fires | Stage at earliest fire | Capacity-table expression |
|---|---|---|---|---|
| Sprout | a first (day 1) | day 1 (I-1…VII-1) — but VIII-11 Pith = year 1 | SEED | achievement buds ✓ |
| Root | weeks | day 1 (rungs R1/R6/R11/R16/R20/R25/R30/R35); day 7 (I-2, II-2); day 30 (IV-2); 3–6 mo (R44) | SEED → SEEDLING | buds ✓ (banking) |
| Branch | extension/new best | day 1 (R40/R43, R3/R8/R13/R17/R22 for trained users); day 7 (II-7); day 21 (II-8); day 28 (II-6); day 30–90 (I-3) | SEED → SEEDLING | buds ✓ (banking) |
| Heartwood | months, structural | day 30 (IV-5 NoDeviation); day 60 (I-4); day 84 (III-21); day 90–180 (II-9); day 182 (III-22, V-3); day 365 (VIII-5) | SEEDLING → SAPLING | buds / first bloom (banking) |
| Ring | a full year | day ~358–372 (II-12, III-26); day 365 (I-5, VII-5, VIII-1); **year 7/8/9 (VIII-17/18/19)** | SAPLING / … / MATURE | first bloom / direct (M-02 non-monotonicity) |
| Grove | multi-year/decade/ceiling | **day 1** (R5/R10/R15/R19/R24); day ~182 (IX-5 Ghost); ~1.5–2 y (I-9 1M words; III-18 Advanced); year 3 (all x3 chains); year 5 (x5); year 10 (VIII-4/9/10/20); ~20–25 y (R47) | SEED → OLD-GROWTH | **C-02 tier schedule required** |

**Robot family (year-1 fireable, all of it):** I-4 (d60), II-9
(d90–180), III-22 (d182), V-3 (d182), IV-5 (d30), IX-5 (d182+). Six
Heartwood + one Grove, all fireable within a user's first year — the
hardest family in the catalog is ALSO the family with the most compact
year-1 fire window, which is exactly why C-02 (the tier schedule) is
the load-bearing resolution.

---

## RESOLUTION SUMMARY (all consistent with the locked design)

1. **C-01:** first bloom = SAPLING stage event (calendar, ~year 1–2,
   first spring), decoupled from the six-domain qualifying year; rings
   keep the six-domain bar. SCHEMA §3's "candidate" wording becomes the
   lock.
2. **C-02:** tier-banked manifestation schedule — Sprout/Root/Branch/
   Heartwood burst at the first bloom; Ring rides the yearly bloom;
   Grove large visuals at MATURE (4+); the D086 top-tier transformation
   at OLD-GROWTH (decade+). Amend L-05's why-panel wording + matrix
   row 6 to "all banked stage-eligible buds".
3. **M-01:** first bloom fires at the first spring after SAPLING
   (D085 intensity modifier).
4. **M-02:** within-tier magnitude scaling by ring count / achievement
   age; DecisionLog note on the 7–9 ring-tier dip (catalog locked).
5. **M-03:** Grove → MATURE per C-02; why-panel states domain-year vs
   six-domain ring counts explicitly.
6. **M-04:** Coach lines stay at data-time; blooms are tree-side
   visual-only ceremonies; coalescing rule for the anniversary Ring
   cluster (ledger approval needed).
7. **M-05:** girth/latewood derives always, renders stage-scaled
   (bud-scale at SEED/SEEDLING, branch girth from SAPLING).
8. **M-06:** Pith blooms in the first-ring ceremony, not the Sprout
   default.
9. **m-01…m-08:** engine-contract lines (strict bud owner + grace
   count, resource-scaled twigs, gold exclusion, wording gates).

**Status: 2 CRITICAL · 7 MAJOR · 8 MINOR = 17 findings.** All
resolutions preserve the locked primitives (stage-gated manifestation,
banking, D085/D086/D087/D088/D089, Coach loudness, derived-only,
zero-XP). No catalog (v2) trophy, tier label, or trigger is changed.