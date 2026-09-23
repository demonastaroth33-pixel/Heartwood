# RELENTLESS LOGIC-FRONT AUDIT — the final verification wave (post-D114)

**Audit date:** 2026-09-23 · **Auditor:** relentless logic-front auditor (final wave)
**Scope (all read in full):** TEMP-PLANNING.md tree-7 (D085–D114, verbatim;
the LIFE TREE DESIGN SYSTEM section L2336–L3632) · SCHEMA.md (§2.1–2.6 as
present + §3) · LOOPHOLES.md · INPUT-INVENTORY.md · VISION.md · PLAN.md ·
TRAIT-SPACE.md · ACHIEVEMENT-SCAN.md · both prior audits
(final-consistency-audit.md, final-adversarial-audit.md) · the sibling
relentless-design-audit.md (2026-09-23 13:17) · docs/DecisionLog.md
(verified: zero D085–D114 entries).

**Method:** (1) every D114 mechanical fix checked against the actual current
text, line by line; (2) a fresh full-decision sweep (lock × lock, register ×
gate/floor/signature, trigger × gate, schedule contradictions); (3) five
adversarial user stories walked through the full lock set — plus two
constructible archetypes the sweep surfaced; (4) verdict.

**Verdict up front: PASS-WITH-FIXES.** 10 of 13 fix items are genuinely
FIXED. **Fix (h) is NOT FIXED — D114 claims an edit it never made** (C-2),
and the sibling design audit re-asserted that fix as closed (a false-PASS
chain). One fresh CRITICAL logic hole survives D114's own claim: the twig
requirement (B2/B4) has no guaranteed path for two constructible archetypes
(C-1). The remaining defects are stale-row contradictions (M-1…M-13), none
reopening a locked decision.

---

## 1. THE D114 FIX VERIFICATION (against the actual text)

| # | Fix (D114 mechanical list, TEMP-PLANNING L3374–L3387) | Status | Evidence |
|---|---|---|---|
| a | Quiet-weeks resolved (protected-absence extension) | **FIXED** | D114(1) L3357–3363 ("do NOT pause the tree's growth … EXTEND THE PROTECTED-ABSENCE MECHANISM … the branch copy says 'resting' and the RHYTHM axis discounts them like planned rests. One mechanism, three sources"); LOOPHOLES.md L181–185 mirrors it. Residual: the discount is not encoded in register F5 (m-4). |
| b | B4 maturity gate (≥2 stage-years + ≥1 branch ≥6 twigs) in the register | **FIXED** | SCHEMA.md L104–107: "POLE->MATURE: >=2 stage-years AND >=1 branch extended to a STRUCTURAL DEPTH (>=6 twigs) … (D114; the first bloom is reachable for EVERY user …)". Matches D114(2) L3364–3368. (The reachability claim itself is still false — C-1.) |
| c | Ring domain set = the canonical 7 | **PARTIAL** | FIXED in SCHEMA §3 L282–287 ("the CANONICAL 7 presence-domains … per D104/D114") and D114(3) L3369–3373; **NOT fixed in LOOPHOLES.md L44** — the live master-clock text still says "six-domain meaning kept". See M-5. |
| d | Storage leaves + D1 | **FIXED** | SCHEMA 2.5 B5 L216–218: "Gate: D1 + E5 + stage floor SEEDLING (leaves exist) — D114 restored the structural-tier floor (D089: 2+ stage-years)". (Register E5 itself carries no floor text — consistent with the E-group-is-signature pattern; B5 is the gate row. Noted, not a defect.) |
| e | Contractile no floor | **FIXED** | SCHEMA 2.5 B10 L233–234: "NO D1 FLOOR (subtle tier per D089 — D114)". Register E10 L147–148: no floor. Matches D089(2). |
| f | Particle cap 150–300 | **FIXED (conflict level)** | D111(5) L3243 ("~150-300 sprites"); D114 L3377 ("the particle cap standardizes to ~150-300 (D111)") — the 120-vs-150–300 conflict is resolved in D111's favor. Residual: still no register C-row (consistency audit MAJ-2's "register C-group" ask unmet); LOOPHOLES §8 still defers calibration to the paper run (m-17). |
| g | INPUT-INVENTORY anchor rows | **FIXED** | §9 L202 ("D102: THE SHARED frozen anchor — the first in-window event; never shifts … (D102/D114)") and §14 L299–302 ("D102 — the first in-window event; never shifts; the Coach reads the SAME anchor — no events = no tree (first birth only; existence is monotonic once born, D114)"). |
| h | **D097 citation → D100** | **NOT FIXED** | D114 L3378–3379 claims "D097's N-7 citation -> D100". **D097(5) L2752 still reads: "…NEVER rewinds (N-7 - consistent with all locks)."** D097's LANDS L2757 still says "N-1/N-7 resolved"; D100's LANDS L2869–2871 still does not cite D097. This is the consistency audit's MAJ-4, re-asserted as closed by the sibling design audit (its "Pre-verified" block, L13–L19) — a false-PASS chain. See C-2. |
| i | SCHEMA §3 secondary-growth text | **FIXED (with two stale siblings in the same paragraph)** | §3 L282–287 now reads the D101/B4 definitions; the pre-D101 "Life-Fully-Logged year rules" trigger is gone. But the same §3 axes paragraph still says BALANCE reads "the 5 domains" (L292) and TENURE = "qualifying years + longest continuous presence" (L295–296) — see M-3/m-5. |
| j | Matrix G-1: all classes bank at SEED | **FIXED** | LOOPHOLES §3 L75: "BANKED (all classes bank at SEED - D114 G-1; the seed's bank counter holds everything)"; rows 2–5 SEED cells read "banked". |
| k | Future-dating clamp | **FIXED** | Register F10, SCHEMA.md L178–179: "future-dating clamp: events with occurredAt in the FUTURE are excluded from all math (D114)". (Scope vs content-truth — m-15.) |
| l | "Tree never dissolves" ratchet | **FIXED (recorded)** | D114 L3384–3386; INPUT-INVENTORY §14 L301–302 ("existence is monotonic once born, D114"). Residual: LOOPHOLES §7 L173 still states "no events = no tree" unqualified (M-5); D090 B's text unamended. |
| m | LOOPHOLES §7/§8 refresh | **PARTIAL** | §7: quiet-weeks resolution + the closure note added (L181–185, L203–207). §8: the hot-zones row gained "(D114)" (L226), but the status table still stops at **D098** (L211–225) — D099–D113 are unlisted, and the matrix row still says "DRAFT — becomes contract at the input-map step" although the input-map step is complete (D104–D106) and its promotion home is now the docs pass. Also §7 contains an internal contradiction: media-scale says "a media-aware aggregation rule is still open" (L176–177) while the same list says N-5 "RESOLVED (D099)" (L200–202) (m-10). |

**Score: 10 FIXED · 2 PARTIAL (c, m) · 1 NOT FIXED (h).** The sibling
design audit's "Pre-verified" block (L13–L19) asserts (h) as closed; the
file says otherwise.

---

## 2. THE LOGIC SWEEP (fresh — remaining holes)

### CRITICAL

**C-1 · THE TWIG REQUIREMENT (B2/B4) HAS NO GUARANTEED PATH — TWO CONSTRUCTIBLE
ARCHETYPES CAN NEVER REACH MATURITY, AND D114'S OWN CLAIM ("THE FIRST BLOOM IS
REACHABLE FOR EVERY USER", SCHEMA L106–107) IS FALSE FOR THEM.**
Locations: SCHEMA.md L53–54 (A1 rows 5/6 — the body and media "Twig source"
cells read "weigh-in days feed the forks" / "media days feed the forks"), L94–95
(A3: ">=15 in-window days per 30-day month"), L102–103 (B2: 1 twig), L104–107
(B4: ≥1 branch ≥6 twigs); TEMP-PLANNING L3444–3449 (D088: "one twig per month of
sustained presence **per domain**"); LOOPHOLES.md L75–81 (matrix: SEEDLING row
for completions/measurements is twig-gated).
- **Instance 1 — the rotating daily logger.** A user active every day but
  rotating domains (e.g., journal ~10 days/mo, gym ~8, nutrition ~8, weigh-ins
  daily, no habits, no task spikes): every domain stays <15 in-window days/month
  → **zero twigs on any branch** → B2 (1 twig) unreachable → SEEDLING forever,
  while A4's stage-year bar (≥200 **any-domain** in-window days) would have been
  met. Banked achievement buds never bloom; "blooms at the first bloom" becomes a
  permanent lie — F-11's exact failure, through a different door. Note: the
  arithmetic kills the sibling audit's every-other-day variant (200+ days/year
  forces a ≥15-day month on average; its M-1 example is impossible as stated) —
  but the rotating logger is constructible and needs no contrivance.
- **Instance 2 — the body-only / media-only user.** A1 routes body and media
  presence to their host branches' **forks**, not twigs; forks begin at SAPLING
  (LOOPHOLES §2) and SAPLING needs a twig — a deadlock. A weigh-in-only user or
  a vault-media-only user is SEEDLING-locked and their earned V/VII buds can
  never bloom. "Nothing unrewarded" fails for the most focused users in the two
  newest canonical domains.
- **Fix (one register/table edit, B4 is dev-tunable per D105):** either A1 rows
  5/6's twig-source cells must read "weigh-in/media days count toward the host
  branch's twig bar (fork sub-track)", or B2/B4 must accept fork twigs; and the
  twig bar needs a fallback for the evenly-spread user (e.g., "≥6 twigs on one
  branch **or** ≥120 in-window days in that branch's domains in the current
  window"). The paper run must include both archetypes as pass/fail checks.

**C-2 · D114'S FIX CLAIM (h) IS FALSE — A LOCKED CLOSURE RECORD ASSERTS AN EDIT
IT DID NOT MAKE, AND THE SIBLING AUDIT RE-ASSERTED IT AS CLOSED.**
Locations: TEMP-PLANNING L3378–3379 (D114 claims "D097's N-7 citation -> D100")
vs **L2752 (D097(5) still reads "(N-7 - consistent with all locks)")**, L2757
(D097's LANDS: "N-1/N-7 resolved"), L2869–2871 (D100's LANDS: no D097); the
sibling audit L13–L19 ("D114 closed … the D097 citation"). D100 overturns N-7
(L2836–2838, L2852–2856); the record's own honesty is the casualty. Fix: apply
the edit (L2752 → "(D100 - the two-tier split; backdating advances content,
never presence)"), add D097 to D100's LANDS, and correct the sibling audit's
pre-verified claim.

### MAJOR

**M-1 · D085 vs D090 C/D101(2)/F3 — THE RING'S CLOSING RULE IS DOUBLE-LOCKED.**
TEMP-PLANNING L2404–2407 (D085, LOCKED): "the ring closes at the year boundary
(calendar-anchored heartbeat, every user, every year)" vs L2481–2486 (D090 C:
"Rings are calendar-neutral (anchored windows per E3, never chopped at Dec 31)")
and L2885–2887 (D101(2): the anchored 365-day window) and SCHEMA L164–165 (F3).
The later decisions win, but no "amends D085" note exists anywhere. Fix: one
amendment line (D085's "ring" = the seasonal cycle's year-turn, not the ring-year).

**M-2 · THE SEEDLING'S PRE-TWIG CONTENT HAS NO VISIBLE FORM.** Matrix row 1
SEEDLING = "leaf clusters per twig" (LOOPHOLES.md L75); twigs need a full month
(A3). D114's G-1 banks classes at **SEED** only (L3380–3382). A week-1..4 user's
entries (and any content if they stop before the first twig) render nothing —
the master principle's "banked in stage-appropriate form" has no SEEDLING cell
for it. The sibling audit's M-2 is correct; fix: lock D095(2)'s leaf-bud-cluster
language for the young tree ("your entries are growing here").

**M-3 · SCHEMA §3's BALANCE AXIS STILL READS 5 DOMAINS.** SCHEMA.md L292:
"BALANCE (single-focus↔multi-domain: distribution across the 5 domains)" vs
F6 L170–171: "Shannon evenness across the 7 presence-domains (Artifact 1's
list)" and D104(3) ("Every system reads the same table — the BALANCE axis").
Same text in D088 (TEMP-PLANNING L3562–3563). An implementer building from §3
builds the pre-D104 axis. This is the exact stale-row disease D114 fixed for the
ring set — one row over.

**M-4 · INPUT-INVENTORY §9's COACH ROWS STILL CONTRADICT D110(1)/E11.**
L199: "coach_outputs = derived facts the tree may mirror" vs D110(1) L3168–3176
("THE TREE MIRRORS H3 OWNERS ONLY, NEVER coach_outputs rows … NEVER touches
it"). L201: "User actions toward coach (delete, quiet-week, rest-flag,
goal-declaration, **opt-ins**, annotate, tap) | 2+4 | symbiosis intensity" vs
E11 (SCHEMA L149–151: "opt-ins/deletes never feed it"). D114 fixed the anchor
rows only.

**M-5 · LOOPHOLES §1/§7 (THE LIVE TRACKER) STILL CARRIES THE PRE-FIX TEXTS.**
L43–44: "the account's **first event ever**" (D102/D100: the first **in-window**
event) and "**six-domain** meaning kept" (D114(3): the canonical 7). L173:
"no events = no tree" unqualified vs the D114 ratchet (INPUT-INVENTORY §14 has
it right). Fix: three line edits.

**M-6 · PLAN.MD CARRIES THE DISEASE D114 FIXED IN SCHEMA — AND ITS STATUS TABLE
IS STALE.** PLAN.md L91–92: Step 8's deliverable still lists "the
secondary-growth trigger (candidate: first qualifying year)" — the exact
pre-D101 row F-2 condemned and D114 corrected in SCHEMA §3. L36/L58/L122–133:
Step 3 "NEXT" and Step 5 "pending" though both are complete (SCHEMA §2.2,
D104–D106); L49–50's archetype roster is still the 6, not the 19 the wave-2
verification gate mandated; L51–52's Step-4 gate ("BEFORE schema rows are
locked") is dead.

**M-7 · THE TREE-STATE MODEL (D107) STILL HAS NO HOME.** D107's LANDS points at
"SCHEMA.md 2.6 (the model)" (TEMP-PLANNING L3091); SCHEMA has no §2.6 (sections
run 2.1, 2.3, 2.4, 2.5, 2.2, then §3). Adversarial F-3, unaddressed by D114.

**M-8 · ACHIEVEMENT-SCAN §1.5 STILL SAYS "NOT LOCKED".** L18–19: "TEMPORARY
proposal … NOT locked" and L41–47: the tier relabeling "pending user approval"
— vs D091 (the identity axis is the locked overlay; the relabeling is
**WITHDRAWN**). D091's LANDS cites §1.5 as the overlay's source, so the source
doc contradicts the lock.

**M-9 · THE UNRECORDED ENGINE-CONTRACT DEFERRALS.** The consistency audit's fix
#5 required recording every engine-contract deferral so nothing re-surfaces at
Step 8. D114's deferral list (L3388–3399) covers the amendment register, owner
contracts, perf numbers, mast-year/variance, test strategy, copy pass, glossary
— but still leaves **unstated**: the payload-validation ladder (A M-7), the
dual-feed discounts (F-08/F-19/F-18), the snapshot economy (P-06), checkpoints
(P-09), the bud-scar cap, the legend-card cap, the revival bar (F-34), the
intensity bands (F-35), settings-in-function (F-14), expired goals (H-13).

**M-10 · THE GROVE TRANSFORMATION / CROWN'S WINTER PERSISTENCE IS UNSTATED.**
D095's ephemerality ("blooms hold through their flowering season, then FADE",
L2643–2647) vs C4's once-set crown (SCHEMA L119–121) and D107's
legendAchievementId (L3084). If the transformation fades like a flower, the
user's rarest visual silently disappears each autumn; if it persists, the
contract must say so. Adversarial F-20, unaddressed.

**M-11 · D085's "GREENER CANOPY" vs D095's WINTER LEAF-BUD MODEL.**
TEMP-PLANNING L2410–2411 ("active winter logging = greener canopy than the
calendar allows") vs L2648–2652 (winter entries become leaf-buds on bare
branches; the evergreen override is character-derived, not activity-derived).
Unstated amendment; the later, more beautiful model should win.

**M-12 · THE EMOTIONAL/EDUCATION GUARDRAILS REMAIN UNLOCKED PROPOSALS.**
F-17 (D094(4)'s next-tick fraction as a guilt meter, L2619–2622), F-18 (the
bank counter as a debt ledger; no empty-crown-slot rule; C7 L128–129), F-19
(dormant-branch year-round bareness; D088 L3460–3466), F-21 (the legend card's
low-tier line, L2753–2756), and the D M-4 education ladder (never minted —
D111's resolve list omits it). None addressed by D114.

**M-13 · THE IMPLEMENTATION-ORDER RISKS REMAIN UNHOMED.** F-7 (the dev-tools
tuning surface is consumed by the paper run, the mockups, and the perf gate but
is sequenced nowhere), F-15 (the grace guard's write-time column, the fold key,
the watermark, and the anchor-in-backup are M11 schema living after M9's ship),
F-16 (Phase-0's dependency DAG). D114's deferrals do not cover them.

### MINOR (verified residuals)

| # | Finding | Location |
|---|---|---|
| m-1 | D090 A still says "first logged event" and "e.g., N extended branches + M rings"; D094(2) repeats "first logged event" — vs B1's/D100's "first in-window event" and B4 | TEMP-PLANNING L2466, L2472, L2589 |
| m-2 | C2's 4-wave cap vs D099 N-4a's uncapped "successive waves"; C4's "1 legend/bloom" vs D092(5)'s "every Grove manifests as THE transformation" — both unrecorded amendments | SCHEMA L113–121 vs TEMP-PLANNING L2808–2814, L2522–2525 |
| m-3 | C4's "the first/rarest Grove" is ambiguous; D107's once-set legendAchievementId implies "first" — a later rarer Grove cannot take the crown | SCHEMA L119–121; TEMP-PLANNING L3084 |
| m-4 | F5's RHYTHM formula ("1 - stddev/mean of weekly active-day counts") does not encode D114(1)'s protected-absence/planned-rest discount and has no zero-mean guard | SCHEMA L169–170 |
| m-5 | F7's formula (stage-years/10) omits §3's TENURE component "longest continuous presence" | SCHEMA L172 vs L295–296 |
| m-6 | F8's "~2s per year" vs D097's "~20-40s sequence" — a 5-year replay is 10s at 2s/yr | SCHEMA L173–174; TEMP-PLANNING L2733–2735 |
| m-7 | E1 (resource ≤0.6) and E2 (resource ≥0.6) overlap at exactly 0.6, so D088's "caudex+buttress is impossible for ANY user" is false at the boundary | SCHEMA L138–139; TEMP-PLANNING L3574–3581 |
| m-8 | D114's deferral cites "the register F9/F10" for perf numbers — F10 is the future-dating clamp, not a perf home | TEMP-PLANNING L3393–3394; SCHEMA L175–179 |
| m-9 | "(E3 — never calendar-chopped)" dangles in F3 and D101 (E3 is the phyllodes signature) | SCHEMA L165; TEMP-PLANNING L2880 |
| m-10 | LOOPHOLES §7: media-scale "still open" vs the same list's N-5 "RESOLVED"; tint/notification homes/statuses inconsistent between §7 and §8 | LOOPHOLES L175–177 vs L200–202; L178–180 vs L226 |
| m-11 | INPUT-INVENTORY §5 F-03 "feeds the flower ceremony" and §15 class 6 listing "F-03 ceremony" under flowers — vs D106's locked ZERO-flower arbitration | INPUT-INVENTORY L112, L313 |
| m-12 | D088's fork enumeration (gym: strength/cardio) predates D104's body-forks/media-forks | TEMP-PLANNING L3439–3443 |
| m-13 | D096(2)'s bank-composition example ("5 buds: 3 Sprout, 1 Heartwood, 1 Grove") vs C7's "top 3 by tier + the count" display | TEMP-PLANNING L2699–2702; SCHEMA L128–129 |
| m-14 | The first bloom's seasonal timing when maturity lands in winter is unstated (D092(2) "at derived maturity" vs D095's "nothing blooms in winter") | TEMP-PLANNING L2514–2517 vs L2636–2643 |
| m-15 | F10's "excluded from all math" vs D100(2)'s content-truth — whether a future-dated entry renders its leaf is undefined | SCHEMA L178–179; TEMP-PLANNING L2849–2851 |
| m-16 | The anchor's counting-event set is undefined (a habit.missed can birth the tree) — A M-8, still unhomed | TEMP-PLANNING L2919–2923 |
| m-17 | The particle cap has no register C-row (the consistency audit's ask); calibration home = paper run | SCHEMA §2.4 C-group; LOOPHOLES L226 |
| m-18 | A2's body/media rows still diverge from the qualifyingEntry owners — recorded deferral (owner contracts, Step 6), live in the register | SCHEMA L91–94; TEMP-PLANNING L3391–3393 |
| m-19 | PLAN Step 10 does not name the docs-pass amendment register (D114's named home) | PLAN.md L110–116 |

---

## 3. THE COUNTER-EXAMPLES (full-lock walks)

**(a) The single-domain journal-only user — PASS.** First entry births (B1);
journal-active days ≥15/month earn twigs (A1 row 1) → SAPLING (B2); 200+
in-window days/yr → stage-years (A4) → POLE (B3); B4 post-D114 (2 stage-years +
1 branch ≥6 twigs) → MATURE; the first bloom bursts the bank (D092(2));
Ring-tier trophies (I-5 etc.) bloom at the next annual bloom "rings or not"
(D092(4)); rings never (D090 C/D101(1) — honest, and the why-panel copy for it
is m-12's sibling gap). Nothing earned stays unbloomed. **The D114 fix works
for this user — which is exactly why C-1's two archetypes matter.**

**(b) The habit-hoarder (60 habits) — PASS.** C3 (≥30/branch → clusters;
individual buds ≤29; count honest) covers the bud flood; habit-active days earn
twigs; maturity unaffected. Residual: D107's habits model has no cluster field
(paint-time vs model-time undecided — F-3's sub-point, M-7's family).

**(c) The vacation-taker — PASS with one implementation gap.** Periods +
rest_planned = protected presence (A1 row 8) feeding the base/dormancy; "resting"
copy (D099 N-6 + D114(1)); VI trophies bloom at the base (A1); RHYTHM discounts
the protected weeks — **but F5's formula does not encode the discount** (m-4), so
an implementer reading only the register misses it. Vacation days correctly do
not count toward A4/A5 (absence is the signal) — honest, no farm.

**(d) The winter-bomber (backfills a year) — PASS.** D100's ±3-day written-in-
window guard (A1) + isBackfill (D113(1)) + F10's future clamp: backfilled
dayKeys outside the grace yield zero qualifying days, twigs, stage-years, rings;
leaves render on occurredAt truth (content is real). Achievements may still fire
from the backfilled real data — that is the achievement system's own anti-farm
domain (D103's authority), not a tree hole. Record-level caveat: D097(5) still
claims N-7 consistency (C-2).

**(e) The decade veteran with 46 Groves — PASS.** B5 (≥10 stage-years) reached;
C4 caps transformations at 1/annual bloom + 1 crown, other Groves render as
large blooms; C1/C2 (≤15/event, ≤4 waves, overflow banks to the next spring)
absorb the flood with "no flower lost"; C7 shows top-3 + count; D107's
legendAchievementId is once-set; the D097 launch replay + legend card frame it.
Residual: M-10 — the transformation/crown's winter persistence is unstated, so
the veteran's rarest visual may fade with no contract line.

**(f) NEW — the body-only user (weigh-ins only): FAIL (C-1).** No twig source
(A1 row 5 → forks); forks begin at SAPLING; SAPLING needs a twig → SEEDLING
forever; V-family buds never bloom. The tree shows sap state (matrix row 3
SEEDLING) and nothing else.

**(g) NEW — the rotating daily logger (active every day, no domain ≥15
in-window days/month): FAIL (C-1).** Zero twigs → SEEDLING forever despite
200+ in-window days/year; D114's own claim ("the first bloom is reachable for
EVERY user", SCHEMA L106–107) is false for them.

**(h) NEW (soft) — the week-1 content user: FAIL-until-fixed (M-2).** Entries
1–14 have no visible form until the first twig (matrix SEEDLING = leaf clusters
per twig; G-1 banks at SEED only). If the user stops before the twig, the
content is never expressed.

---

## 4. VERDICT

**PASS-WITH-FIXES.**

D114 genuinely closed the consistency round's CRIT-1/CRIT-2, MAJ-1, and most
mechanical items; the core lock set (clock, anchor, tier schedule, seasons,
caps, three artifacts) remains internally coherent. But a clean PASS would be
false on three counts: **(h) is not fixed and is falsely claimed fixed — and a
sibling audit already re-asserted it as closed (C-2); the maturity gate still
has no guaranteed path for two constructible archetypes, so the design's core
promise "the first bloom is reachable for EVERY user" is not yet true (C-1);
and a cluster of live-doc contradictions (M-1…M-13) still contradicts the
locked set at exact line numbers.**

**Must-fix before the engine contract:**
1. C-1 — the twig path (A1 rows 5/6 + B2/B4): fork-twigs clause or a
   days-based fallback; paper-run checks for the body/media-only and
   rotating-logger archetypes.
2. C-2 — apply the D097(5) edit (→ D100), add D097 to D100's LANDS, correct
   the sibling audit's claim.
3. M-1, M-3, M-5, M-6 — the stale-row line edits (D085's ring line, SCHEMA §3's
   "5 domains", LOOPHOLES §1/§7, PLAN Step 8 + status table).
4. M-2 — lock the seedling's pre-twig banked form (D095(2) language).
5. M-4, M-8 — the INPUT-INVENTORY coach rows and ACHIEVEMENT-SCAN §1.5's
   "NOT locked" header.

**Housekeeping (docs pass):** M-7 (SCHEMA 2.6), M-9 (deferral register), M-10,
M-11, M-12, M-13, and the m-series.

**Note on the sibling design audit:** its M-1 finding (B4's twig bar) is real
but its archetype math is wrong (200+ in-window days/year cannot coexist with
every 30-day window at ≤15 — the average forces qualifying months); the correct
construction is the rotating logger (C-1). Its "Pre-verified" list wrongly
includes the D097 citation (C-2).
