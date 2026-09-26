# FINAL GATE VERIFICATION — Life Tree paper-run correction round

**Date:** 2026-09-24
**Role:** final gate verifier (close-out of the 100%-certainty audit's residuals R1–R6)
**Source of residuals:** `audits/final-100pct-audit.md` §6 (the exact residual list)
**Verified against:** the CURRENT text of SCHEMA.md, LOOPHOLES.md, TEMP-PLANNING.md
**Standard:** each residual is closed surgically in the live (non-historical) text;
no neighboring register row was corrupted by the edit storms.

---

## Per-residual verdict

### R1 — SCHEMA §3 ring-year definition → SIX CORE domains — CLOSED
`SCHEMA.md` §3, the Secondary growth trigger (L372–376): "the trunk's
rings form at RING-YEAR closings (the anchored 365-day window with the
SIX CORE domains present — the D116 ring fold: journal, habits, gym,
nutrition, body, media — goals and periods excluded from the brand; the
trunk rings and the trophy ladder ALWAYS agree)". The stale "CANONICAL 7
presence-domains present, per D104/D114" is gone. An engine reading §3
now computes the ring on the six-core set. Note: §3's BALANCE axis line
(L384) still correctly reads "the CANONICAL 7 presence-domains, D104"
for the axes — the intended six-core-for-rings / canonical-7-for-axes
split is preserved.

### R2 — LOOPHOLES §1 rings line → SIX CORE domains — CLOSED
`LOOPHOLES.md` §1 master clock (L43–45): "Rings = a BRAND (decoupled
from the clock; the SIX CORE domains - the D116 ring fold: journal,
habits, gym, nutrition, body, media - calendar-neutral, never
chopped)". Same six-core fold as the register; the contradiction with
A5/D116 D10 is removed.

### R3 — D116 D2 record carries the GYM ≥8 amendment — CLOSED
`TEMP-PLANNING.md` L3453–3454, D116 D2: "journal/habits/nutrition/goals
>=15 days/30d; GYM >=8 days/30d (AMENDED by the recording audit - the
register carries >=8 so the 2x/week lifter passes; the 12 in the
original text was the 3x/week assumption; the register value governs)".
The record now matches the register's A3 GYM ≥8; the ≥12 stale value is
explicitly explained as superseded, so the follow-ups' "the register,
the trigger table, and the records agree" is TRUE on this number.

### R4 — SCHEMA §2.4 header F4 note → LOCKED at 12 — CLOSED
`SCHEMA.md` §2.4 header note (2) (L85–87): "The RESOURCE normalization
ceiling (F4) was calibrated by the paper run — LOCKED at 12 (D116): at
20 nearly every life read as sparse; at 12 the decade user lands
~0.6–0.8. Still dev-tunable." The stale "reads high at 20 events/day —
kept for now, calibrated via the dev tools at the paper-run step" is
gone; the note now agrees with the F4 row (ceiling 12).

### R5 — B2 window-completion-day pin (inclusive, the day the 15th lands) — CLOSED
`LOOPHOLES.md` §1 master clock, the SEEDLING->SAPLING tick (L39): "the
window completes INCLUSIVELY on the day the 15th in-window day lands -
the D116 day-29/day-30 pin". The 1-day day-29-vs-day-30 boundary that
08-V3(3)'s sub-part left unpinned is now pinned in the master clock.
(Home: LOOPHOLES §1, where the tick rules live; no stale 20-window text
remains in B2's surrounding rows.)

### R6 — LOOPHOLES §8 C8–C14/A6/A7/E15 closures marked — CLOSED
`LOOPHOLES.md` §8 status row (L227), "Open hot zones": "C8-C14/A6/A7/E15
CLOSED (D116) - tint rule (→ mockup step) · notification ambiguity (→
D094(3), resolved) · RESOURCE ceiling (→ D116: LOCKED at 12) · particle
cap (→ paper run) · matrix promotion (→ docs pass) · 17-audit (→ Step
7) · perf numbers (→ Step 6) · mast-year (→ engine contract) — ALL
deferred with homes (D114)". The register closures D116's LANDS claims
for LOOPHOLES.md are now visible in the status table; the recording-
verification's C-12 "other half" is closed.

---

## Final spot-check — key register rows after the edit storms

All rows read the correct D116 values; no neighbor was corrupted:

| Row | Expected | Current text (SCHEMA.md) | Verdict |
|---|---|---|---|
| A3 per-class + canopy | per-class bars + the canopy rule | L94–105: PER-CLASS; journal/habits/nutrition/goals ≥15/calendar-month; GYM ≥8 (2×/week passes, the C-11; 3×/week = 12–13); BODY/MEDIA ≥4 active weeks; PLUS THE CANOPY RULE (≥15 ANY-DOMAIN-MIXED grows the tree) | ✓ |
| A4 accrual | cumulative-accrual reading | L106–110: ≥200 in-window days, CUMULATIVE-ACCRUAL, counter resets at 200, 365-day-window reading dead | ✓ |
| A5 six-core | SIX CORE DOMAINS ring fold | L111–115: ≥40/day per domain over the SIX CORE DOMAINS, goals/periods excluded, canonical-7 stays for the axes/presence | ✓ |
| B4 mixed-domain | ≥90 ANY-DOMAIN-MIXED | L124–130: ≥2 stage-years AND ≥90 ANY-DOMAIN-MIXED in the best anchored year (D116) | ✓ |
| C4 earliest-earned | EARLIEST-EARNED crown, derived | L141–145: EARLIEST-EARNED Grove is the crown; crown DERIVED, never stored in the backup | ✓ |
| E2 balance-only | balance ≥0.7 ONLY | L169–173: balance ≥0.7 ONLY; resource leg removed (F4-ceiling 12 rationale intact) | ✓ |
| E3 rhythm+persist | resource ≤0.4 AND rhythm ≥0.5 + PERSIST-INTENSITY | L174–181: both legs + the persist-intensity reversion rule | ✓ |
| E6 52 weeks | 52 CONSECUTIVE WEEKS, ANY domain | L186–189: 52 consecutive weeks ANY domain + tenure ≥2 | ✓ |
| E7 26 weeks | 26 CONSECUTIVE WEEKS, ANY domain | L190–191: 26 consecutive weeks ANY domain | ✓ |
| F4 ceiling 12 | CEILING 12 + per-class unit | L217–223: CEILING 12 (paper-run proof) + the EVENT UNIT pinned | ✓ |

Trigger table §2.5-B rows 2/3/6/7/9/10 carry the same D116 values
(spot-confirmed in the same read: row 2 balance-only, row 3 rhythm leg,
row 6 52w ANY-domain, row 7 26w ANY-domain, row 9 protected-absence +
E15, row 10 anchored windows) — no cross-row regression.

---

## Verdict

### PASS (100% — all six residuals closed, no corruption)

- R1 closed · R2 closed · R3 closed · R4 closed · R5 closed · R6 closed.
- Spot-check: all 10 key register rows intact with their D116 values;
  the trigger table agrees; no neighboring row was corrupted by the
  correction edits.
- The live texts (SCHEMA.md, LOOPHOLES.md, TEMP-PLANNING.md D116) are
  now mutually consistent: ring fold (six-core) matches across
  SCHEMA §3 / A5 / LOOPHOLES §1 / D116 D10; F4 ceiling 12 matches
  across §2.4 header / F4 row / D116 D3 / LOOPHOLES §8; A3 gym ≥8
  matches across the register and the D116 D2 record.