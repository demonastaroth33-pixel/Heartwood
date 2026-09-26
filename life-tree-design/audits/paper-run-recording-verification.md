# PAPER-RUN RECORDING — FINAL VERIFICATION of the residual fixes

**Date:** 2026-09-23 (post-fix re-check of paper-run-recording-audit.md)
**Verifier:** final verifier pass on the claimed closure of the audit's
11 residual findings + consistency defects.
**Sources read (current text):**
- life-tree-design/SCHEMA.md (466 lines; register §2.4 L75-235, trigger
  table §2.5-B L255-295, tree-state §2.6 L317-336, decision record L426-466)
- TEMP-PLANNING.md L3380-3815 (D115 amendment, D116, THE RECORDING-AUDIT
  FOLLOW-UPS L3784-3814)
- life-tree-design/LOOPHOLES.md (227 lines; §8 L210-227)
- Baseline: audits/paper-run-recording-audit.md (gaps §5 G1-G7, defects
  §6 C-1..C-12, fixes §7)

**Standard:** a claim is closed only if the CURRENT text says it. A false
PASS is worse than a false FAIL.

---

## 1. THE 12 CLAIMED CLOSURES — per-item status

| # | Claimed closure | Status | Evidence (current text) |
|---|---|---|---|
| 1 | B4 mixed-domain register row | **CLOSED** | SCHEMA L123-129: "B4 POLE->MATURE: >=2 stage-years AND >=90 in-window days ANY-DOMAIN-MIXED in the best anchored year (D116 - the mixed-domain fix: the sparse-stubborn, rotating, every-other-day, and body-only users ALL mature ...)" — the old per-domain bar is gone; matches D1 and the D115 amendment. |
| 2 | Branch-ring bar (C14) | **CLOSED** | SCHEMA L447-451: "C14 BRANCH-RING BAR (D116 + the recording audit pin - the walks flagged it 3x): a branch ring = an anchored year in which the domain had >=40 in-window days (the A5 per-domain logic, no six-domain requirement) - the journal-only user's branch rings record the years honestly." |
| 3 | Dormancy/revival threshold (E15) | **CLOSED** | SCHEMA L200-202: "E15 DORMANCY THRESHOLD (D116 + the recording audit pin): a dormancy = >=14 consecutive days with no in-window presence (a fortnight of quiet); a REVIVAL = the dormancy ends - the E9 trigger unit." |
| 4 | A3 calendar-month pin | **CLOSED** | SCHEMA L94-98: "journal/habits/nutrition/goals >=15 in-window days/CALENDAR month (the calendar-month reading pinned - the February dip is an honest feature, never a lottery)". The >=15 inclusive bound is explicit (">="). The B2 window-completion-day sub-part of G4 remains unpinned (no text anywhere; see §3). |
| 5 | Rotating-logger canopy rule | **CLOSED** | SCHEMA L99-104: "PLUS THE CANOPY RULE (the rotating-logger fix, D116 + the recording audit): any month with >=15 in-window days ANY-DOMAIN-MIXED grows the tree - a twig on the month's most-active branch (the rotating logger logs 30 days/month - its canopy grows; the per-class bars still gate the per-domain branches). Dev-tunable." |
| 6 | A3 vacation-month lottery | **CLOSED** | Resolved by the pinned deterministic reading: SCHEMA L97-98 "the calendar-month reading pinned - the February dip is an honest feature, never a lottery" + TEMP-PLANNING L3801-3803 "(e) A3 calendar-month pin: the twig windows are CALENDAR months (the February dip is an honest feature, never a lottery; the vacation-month placement resolves to a deterministic reading)". No literal "no proration" phrase exists anywhere, but the lottery is dead: the reading is deterministic and the dip is declared honest. |
| 7 | M-2 wording ("regardless of twigs") | **CLOSED** | TEMP-PLANNING L3416-3421 (D115(3)): "the leaf-buds burst into clusters at SAPLING regardless of twigs (the canopy rule - a never-twig tree still leafs)". |
| 8 | Trigger-table rows 2/3/6/7/9/10 | **NOT CLOSED** | Only rows 3 and 6 were fixed. Rows 2, 7, 9, 10 still carry the pre-D116 text (full detail in §2). |
| 9 | §2.6 bankBuds aggregation | **CLOSED** | SCHEMA L323-324: "bankBuds [{achievementId, count}] (order = earn order; AGGREGATED by achievementId per C9 - the repeat-bloom count badge lives here)". The C-9 companion residue (habits stays a flat list, no cluster field) remains — SCHEMA L328-329 "habits [{habitId, state: dormant|swelling|bursting|scarred}]" (see §3). |
| 10 | LOOPHOLES §8 ceiling status | **CLOSED** | LOOPHOLES L227: "RESOURCE ceiling (-> D116: LOCKED at 12)" — the stale "(-> paper run)" deferral is gone. (C-12's other half — §8 showing none of the C8-C13/A6-A7/E15 closures — is unchanged; LOW, see §3.) |
| 11 | E2 arithmetic catch (balance-only) | **CLOSED** | SCHEMA L165-169: "E2 buttress: balance >=0.7 ONLY (D116 + the recording audit - the balance leg IS the whole signature: at the F4 ceiling 12 the rotating logger sits at 0.083 resource - any resource leg excludes the balance champion; the wide-crown roots belong to the balanced life, period; the resource dimension does its work in E1/E3)". |
| 12 | D116 follow-up record (a)-(i) | **PRESENT — but (h) is factually false** | TEMP-PLANNING L3784-3814: all nine items (a)-(i) exist: (a) B4 row, (b) canopy rule, (c) C14, (d) E15, (e) A3 calendar pin, (f) M-2 wording, (g) E2 balance-only, (h) "THE TRIGGER-TABLE STALE ROWS corrected (2/3/6/7/9/10 now carry the D116 values + the cadence armor + the exclusion)", (i) bankBuds. The (h) claim does not match SCHEMA §2.5-B (see §2), and the closing line L3813-3814 "ALL audit residuals closed; the register, the trigger table, and the records agree" is therefore false. |

## 2. THE TRIGGER-TABLE ROWS 2/7/9/10 — still stale (item 8 fails)

| Row | Current SCHEMA text | What the audit's fix §7(2) required | Status |
|---|---|---|---|
| 2 buttress | L261-262: "DERIVED (sustained multi-domain balance): balance >=0.7 + resource >=0.6 + stage floor POLE. Gate: D2 + E2." | B.2 resource >=0.4 (and after follow-up (g), E2 is balance-ONLY) | **STALE** — and now a LIVE contradiction: the row still demands resource >=0.6 while the just-fixed E2 row (L165) says "any resource leg excludes the balance champion". The two rows of the same register disagree — the exact drift class the runs flagged nine times. |
| 3 phyllodes | L263-266: "resource <=0.4 AND rhythm >=0.5 (D116 - the steadily-sparse acacia; never the bursty or the lush) + the PERSIST-INTENSITY reversion rule." | B.3 add rhythm >=0.5 | fixed |
| 6 thorns | L272-277: "DERIVED (D116 - the refuted 365-day trophy replaced by cadence armor): 52 CONSECUTIVE WEEKS of sustained presence in a domain (ANY domain) + tenure >=2." | B.6 the 52-week ANY-domain cadence reading | fixed |
| 7 spines | L278-279: "ACHIEVEMENT (the 100-day streak trophy, II-3 A Hundred Days). No tenure gate (subtle tier, D089)." | B.7 the 26-week ANY-domain cadence reading | **STALE** — the refuted referent (the catalog-gap trophy the walks disproved, 17-V3) is still in the table verbatim; nothing says 26 consecutive weeks ANY domain (E7/D9). |
| 9 reaction wood | L283-284: "DERIVED (the revival event - a dormancy period ends). UNIVERSAL (no gate)." | B.9 the protected-absence exclusion | **STALE** — no exclusion; E9's S11 pin (planned returns are NOT revivals) is absent from the trigger row. |
| 10 contractile | L286-287: "DERIVED (3 consecutive stage-years with rising active-day counts). NO D1 FLOOR (subtle tier per D089 - D114)." | B.10 the anchored-window clock | **STALE** — still "3 consecutive stage-years"; E10's S5 anchored 365-day windows pin (L190-192) is absent. |

## 3. Consistency defects outside the 12-item claim — status

| Defect | Current text | Status |
|---|---|---|
| C-8 (E1 cadence note) | SCHEMA L164: "E1 caudex: tenure >=0.7 AND resource <=0.6" — no ~8.3-year cadence note anywhere in SCHEMA (grep for "8.3" = no hits). Audit fix §7(4) said "add the S4 cadence note to E1 once B4 lands"; B4 has landed, the note never landed. The double-lock PREMISE half is resolved (B4 mixed-domain makes MATURE reachable). | **NOT CLOSED** (premise half closed, note half open) |
| C-9 (habits flat list) | SCHEMA L328-329 "habits [{habitId, state: dormant|swelling|bursting|scarred}]" — no cluster field. | PARTIAL (bankBuds closed per item 9; the C3 cluster surface in the state model still absent; audit rated LOW-MED) |
| C-10 (§2.5-A first-bloom winter deferral) | SCHEMA L244-245: "First bloom at maturity: Sprout->Heartwood burst." — no winter-deferral note; C13's pin (first bloom defers to next spring when maturity lands in winter) not reflected in the trigger section. | **NOT CLOSED** (LOW) |
| C-11 (2x/week gym residue) | SCHEMA L94-99: gym >=12 days/month; no note for the 2x/week cadence (8.7/30 < 12); the decade/media-rich gym branches stay twigless; the canopy rule grows a twig on the most-active branch, not the gym branch. | NOT CLOSED (LOW-MED, acknowledged residual in the audit itself) |
| C-12 other half (LOOPHOLES §8 shows no C8-C13/A6-A7/E15) | LOOPHOLES L227 lists only the ceiling closure; no register-row closures appear. | PARTIAL (LOW) |

## 4. VERDICT

**FAIL.**

Closed: items 1, 2, 3, 4, 5, 6, 7, 9, 10, 11 (10 of 12), and rows 3 and 6
of item 8.

NOT closed in the current text:
1. **Item 8 — trigger-table rows 2, 7, 9, 10** (4 of the 6 claimed rows):
   row 2 still "balance >=0.7 + resource >=0.6" (now contradicting the
   fixed E2 balance-only row — a live register-internal contradiction);
   row 7 still cites "II-3 A Hundred Days" (the refuted referent); row 9
   still "a dormancy period ends" with no protected-absence exclusion;
   row 10 still "3 consecutive stage-years" with no anchored-window clock.
2. **Item 12 — the D116 follow-up record's claim (h) is false**: the
   record says rows 2/3/6/7/9/10 "now carry the D116 values"; four of
   them do not. The closing line "the trigger table ... agree[s]" is
   wrong.
3. **C-8** — the E1 ~8.3-year cadence note (explicit in the audit's fix
   list §7(4)) was never added to SCHEMA L164.
4. **C-10** — the §2.5-A first-bloom trigger still lacks C13's
   winter-deferral note.
5. **C-11** — the 2x/week gym branch residue is still unaddressed.

The register's E-rows and the trigger table still disagree in four rows —
the exact defect class the audit exists to catch — and the follow-up
record asserts agreement that the text does not have.