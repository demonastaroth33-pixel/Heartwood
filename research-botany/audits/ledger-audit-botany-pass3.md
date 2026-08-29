# BOTANY MASTER AUDIT 3 — THIRD AND FINAL VERIFICATION PASS
**Auditor:** zero-miss final pass · **Date:** 2026-08-29
**Scope:** MASTER-Botany-Reference.md (2,576 lines; Parts 1–13 + 417-entry glossary + 62-row checklist) vs the 22 findings of botany-audit.md + the 4 NEW findings (N1–N4) of botany-audit2.md
**Method:** full re-read of the master (all 2,576 lines), programmatic extraction + per-pointer validation of all 98 `§`-pointers and all 29 `P`-format pointers (Part 13), glossary entry count + exact-duplicate scan (417 entries, restricted to the glossary block), targeted greps for every finding's content items, first-use scans for the 5 inline-definition terms, and fact spot-checks (maple/rose/lupine/redwood/drupe).

---

## VERDICT: **PASS-WITH-FIXES**

Two unresolved artifacts remain (both MINOR, both pre-existing carry-overs from audit2): the stale `§10.2C` pointer at line 1482 (the last of the F10 residue — 6 of 7 now fixed), and the duplicate "Helicoid cyme" glossary entries at lines 2250–2251 (N2, untouched). The standing F3 partial also persists: row 61's "every bolded term defined" contract still fails for ~48 bolded technical terms (glossary grew 392→417; the 25 contract terms named in this pass's check group 3 are ALL present, but the broader contract is still not literally met — the same residual audit2 reported).

**Counts:** FIXED = 24 of 26 (all 4 NEW + 20 of 22 original) · PARTIAL = 2 (F3, F10 — each down to a single/few-item residue) · NOT FIXED = 2 (N2 duplicate glossary entry; the F10 `§10.2C` pointer) · NEW findings this pass = 0.

No CRITICAL content remains. The taxonomy spine, both previously-wrong facts, the contradiction, and the catalog gap are all clean.

---

## PER-FINDING STATUS (22 original)

**F1 — CRITICAL, maple phyllotaxy (§4.4, line 471–473):** **FIXED.** Alternate = "oak, beech, birch"; opposite = "maple, ash, mint family, horse chestnut". Maple appears in no other phyllotaxy context.

**F2 — CRITICAL, rose ovary position (§10.1, line 1425–1428):** **FIXED.** Hypogynous = "buttercup, tomato, pea"; perigynous = "cherry, rose" (hypanthium cup).

**F3 — MAJOR, checklist row 61 (glossary):** **PARTIAL (unchanged residue).** Glossary now has exactly 417 entries (line 2575's count is accurate). ALL 25 contract terms this pass was asked to verify are present as standalone entries (see check group 3). However, of audit2's ~45 listed missing bolded terms, ~48 still have NO glossary entry — the list is essentially unchanged: proembryo, globular, anatropous/orthotropous/campylotropous/amphitropous, establishment bottleneck, sapling, lateral meristem, terminal (apical) bud, adventitious buds, fruit spurs, decurrent, homologs, tunic, succulent stem, bulbils/offsets, arbuscules, Frankia, Rhizobium, polyarch, heart-shaped, graft, buttress, knee, contractile, floating/assimilatory/nodulated roots, banyan, fasciculated/annulated, craspedodromous/camptodromous, snap traps, scale leaves, foliage leaves, semi-ring-porous, Pfr/Pr, delayed foliation, compound corymb, nutlet, iteroparous, semelparous, snag, current annual increment, chilling injury. (Some are now substantively covered inside other entries — basal plate in "Bulb", nodules in "Leghemoglobin", ray initials in "Ray (medullary)", grain types in "Grain" — but not as entries.) Row 61's literal contract and the glossary's "every term, one line each" header claim remain overstated.

**F4 — MAJOR, checklist row 62 (inline first-use definitions):** **FIXED.** Verified at first use: receptacle — §10.2A8 line 1479 (with torus; all later uses at 1535/1679/1682/1685/1686/1713 follow the definition) ✓; rachis — §6.3 lines 873–875 (defined in the same sentence as first use) ✓; ethylene — glossed at §9.5 line 1361 ("the ripening hormone, §10.7"), full treatment §10.7 line 1761 (line 215 is a §1.5 list mention, not a definition — same acceptance standard as audit2) ✓; periderm — §4.6.3 line 529 ("the corky protective layer, §7.5"), full §7.1/§7.5 ✓; mesocarp/endocarp — §10.5A2 line 1614, glossed inline ✓.

**F5 — MAJOR, root-modification catalog (§5.6):** **FIXED.** 17 items: 15 Water-storage roots (*Pachypodium*, caudex succulents, bottle trees; cross-linked §4.6.10), 16 Assimilatory (*Taeniophyllum*/*Tinospora*), 17 Floating (buoyancy vs photosynthesis explicit). Checklist row 19 updated to match.

**F6 — MAJOR, germination triggers (§1.5):** **FIXED.** Thermoinhibition (line 208), alternating temperatures (211), nitrate/ethylene/CO₂ (215), fruit-pulp inhibitors (218), seasonal-timing classes (222), intermediate seeds (235). Checklist row 4 updated.

**F7 — MAJOR, oak dormancy contradiction (§1.4 vs §2.2):** **FIXED.** §1.4 (lines 161–165) now "standard treatment for apple, red oak…" + "White-oak acorns skip this entirely — they germinate at autumn shed; red-oak acorns need the cold months (§2.2)"; §2.2 (lines 311–316) tells the two-clan story identically.

**F8 — MAJOR, marcescence (§9.4):** **FIXED.** Lines 1327–1332, "Marcescent (the middle strategy)" with function notes; checklist row 39 and glossary entry (line 2293) updated.

**F9 — MAJOR, BBCH scale (§9.1):** **FIXED.** Lines 1263–1266, 00–99 codes, BBCH 65 = full flowering; checklist row 36 updated.

**F10 — MAJOR, cross-references (7 broken):** **PARTIAL — 6 of 7 now fixed; 1 still broken.** Fixed since audit2: §4.2 → "(§7.1/§7.3)" (line 439, rays; both sections correct) ✓; §4.3 → "(§6.5.11)" (line 465, bud scales) ✓; §4.6.4 → "(§6.5.9)" (line 535, bulb scales) ✓; §7.2 → "(with the caveats below)" (line 1063, pointer removed; caveats in §7.2 itself) ✓. **STILL BROKEN:** §10.2A8 line 1482 — "The head has two flower kinds (§10.2C)" — §10.2C (Compound & Special, items 14–25) contains no ray/disk content; the disk/ray floret definitions are inline in item 8 itself (lines 1482–1485). Pointer should be deleted.

**F11 — MINOR, Arctic lupine record (§1.4):** **FIXED.** Claim removed; lines 175–176 now read "the radiocarbon-verified records are the ~2,000-year-old Judean date palm and the ~1,300-year-old lotus." Only remaining "lupine" hit is the legitimate raceme example (§10.2A1, line 1458).

**F12 — MINOR, redwood water rise (§8.3):** **FIXED.** Line 1218: "moves water ~100+ metres this way without a pump". "Hundreds of metres" = 0 hits anywhere in the document.

**F13 — MINOR, dichotomous branching (§4.5):** **FIXED.** Line 495–496: "rare in dicots (some cacti; the classic dicot example is mistletoe, *Viscum*)".

**F14 — MINOR, bloom-before-leaf (§9.5):** **FIXED.** Line 1343: "cherry, willow, hazel".

**F15 — MINOR, morning glory heliotropism (§12.1):** **FIXED.** Line 1903–1905: "sunflowers' bud tracking — though mature sunflower heads face east and stay". Morning glory absent.

**F16 — MINOR, Puya monocarpic (§11.1):** **FIXED.** Line 1787–1789: "the century plant/agave and bamboos (monocot note); the true dicot monocarpics include the giant lobelias of East Africa".

**F17 — MINOR, brief A omissions:** **FIXED.** All items re-verified present: strophiole/lens (81), perisperm (87), ovule orientations (133–136), proembryo→globular→heart→torpedo (130–132), fruit-pulp inhibitors (218–221), plumular hook (290), photomorphogenesis/skotomorphogenesis (304), winged seeds (251), viscin (246–248), vivipary (233–235), jays as scatter-hoarders (262–264). Quiescence now also appears IN THE BODY at §1.4 line 146 (see N4).

**F18 — MINOR, brief B omissions:** **FIXED.** "Determinate shoot growth" now present — §7.7 line 1152: "Individual shoots can be **determinate** (a pre-set number of nodes, then a flower or bud - apple spurs, many flowers) or indeterminate (grow on year after year - most tree shoots)." Plus a matching glossary entry "Determinate shoot" (line 2182).

**F19 — MINOR, brief C omissions:** **FIXED.** AM vesicles now in §5.4 line 665–666: "storing reserves in fatty **vesicles** (the fungus's larder inside the root)"; glossary "Vesicles (AM)" (line 2493). All other C items re-verified present (columella 625, diarch/triarch/tetrarch + exarch 646–648, apoplast/symplast/plasmodesmata 654–656, leghemoglobin 683, Hartig net 670, pelotons 674, rhizosphere 792, intraspecific grafting 798–800, depth records 606–608, sweet-potato anomalous cambia 698–700, lobed cambium 692, haustoria rogues' gallery 751–755, alpine/permafrost syndromes 800–802).

**F20 — MINOR, brief D omissions:** **FIXED.** All 17 items re-verified present (pulvinus 935, subsidiary cells 842–843, bundle sheath 852, petiolule 871, decompound 877, leaflet arrangement 872–873, bilateral/radial 904–905, rosette 902, undulate/spinose 886–888, deltoid/spatulate/peltate 893–895, emarginate 897, oblique 899–900, epicuticular wax 834–835, *Kalanchoe* 927, *Welwitschia* 925, craspedodromous/camptodromous 855–857, dichotomous key 907–910).

**F21 — MINOR, brief E omissions:** **FIXED.** All re-verified (peduncle/pedicel 1447–1448, placenta/locules 1408–1411, apocarpous/syncarpous 1409–1411, polygamous 1420–1421, floral diagram 1433–1435, parthenocarpy 1597–1599, anthesis 1750, fruit set 1751, June drop 1753, climacteric/non-climacteric 1764–1767, buzz pollination + poricidal 1570–1573, butterfly/moth subtypes 1566–1569, *Ophrys* pseudocopulation 1574–1576, white/red oak acorn timing 1753–1755).

**F22 — MINOR, brief F omissions:** **FIXED.** All re-verified (thermonasty/photonasty 936–937, semelparous/iteroparous 1784–1786, florigen/FT 1304–1307, MAI vs CAI 1822–1824, chill hours 1255–1256, lapse rate 1244, false springs 1268, delayed foliation 1258, supercooling 1287–1288).

---

## NEW FINDINGS FROM AUDIT2 (N1–N4)

**N1 — MINOR, drupe duplicated fragment (§10.5A2, line 1614):** **FIXED.** Entry reads clean: "thin skin, fleshy **mesocarp** (the eaten flesh), HARD stony **endocarp** (the pit) around one seed…". No duplication; single endocarp mention.

**N2 — MINOR, duplicate helicoid glossary entry (lines 2250–2251):** **NOT FIXED.** Both entries remain verbatim: "**Helicoid cyme (bostryx)** - one-sided coiled cyme (forget-me-not)." and "**Helicoid cyme** — one-sided coiled cyme (forget-me-not)." — same definition twice, one new-format one legacy-format. (Exact-name duplicate scan otherwise clean: the other 415 entries have unique names.)

**N3 — MINOR, glossary grammar typo (Endodormancy, line 2206):** **FIXED.** Now "the bud's own winter rest needing chilling" (apostrophe present).

**N4 — MINOR, quiescence body-only:** **FIXED.** Quiescence now defined in the body at §1.4 line 146 (with the pause-vs-sleep contrast), satisfying checklist row 3's Part-1.4 mapping. Glossary entry (2386) retained.

---

## CROSS-REFERENCE INTEGRITY (check group 2)

- 98 `§`-pointers extracted and validated against the actual target content: **97 resolve correctly; 1 is stale** — §10.2A8 line 1482, "(§10.2C)" (details in F10; §10.2C contains no ray/disk content).
- 29 `P`-format pointers (Part 13, lines 1997–2081, incl. P1–2, P11.2, P7.2, P4.5, P8.2, P13.3, P9.4…): **all 29 validate** against their Parts/sections.
- All previously-fixed pointers remain correct (§10.4 at 108, §9.1 at 197, §10.5B9 at 1571, §10.2C22 at 1586, §5.6.6/§5.6.14 at 1968, §6.5.11/§6.5.9, §7.1/§7.3 at 439, "caveats below" at 1063).
- No NEW broken pointers found.

## GLOSSARY CONTRACT (check group 3)

All 25 requested terms exist as standalone glossary entries — **25/25 PASS**: gibberellins (2236), seed bank (2419), cardinal temperature (2133), rachis (2389), corymb (2164), sorosis (2438), petals (2344), pistil (2360), softwood (2437), cold hardiness (2154), supercooling (2460), short-day plant (2430), long-day plant (2292), day-neutral plant (2175), polycarpic (2371), tropism (2481), chemotropism (2142), grain (2239), aggregate fruit (2095), areole (2112), exocarp (2221), pappus (2329), vesicles (2493), determinate shoot (2182), leaf flush (2283). (Caveat: the broader row-61 contract still fails — see F3.)

## INLINE-DEFINITION CHECK (check group 4)

**5/5 PASS** — receptacle (§10.2A8 line 1479, first use), rachis (§6.3 lines 873–875, first use), ethylene (§9.5 line 1361 gloss, full §10.7), periderm (§4.6.3 line 529 gloss, full §7.5), mesocarp/endocarp (§10.5A2 line 1614, sole body use). Chronological order intact.

## FACT SPOT-CHECK (check group 5)

**5/5 PASS** — maple opposite-only (line 472); rose perigynous (line 1427); no Arctic lupine claim (only "lupine" = raceme example, line 1458); "hundreds of metres" = 0 hits (line 1218 now "~100+ metres"); drupe entry clean, no duplicated endocarp fragment (line 1614).

---

## COVERAGE CHECKLIST RE-VERIFICATION (rows 1–62)

Rows 1–60: no regressions found on full read (row 3 quiescence mapping now truthful; row 19 = 17 root items; row 45 = 30 fruit types; row 42 = 25 inflorescences). Row 61: **PARTIAL** (see F3 — count claim accurate, "every bolded term" overstated). Row 62: **PASS** (see F4).

## BOTTOM LINE

**PASS-WITH-FIXES.** This is the same verdict as audit2 but with the failure set cut from 11 items to 3 (2 PARTIAL residues + 1 NOT FIXED), all MINOR, all localized, and zero new defects introduced. Remaining work before an honest "PASS": (1) delete or retarget the "(§10.2C)" pointer at line 1482; (2) delete one of the two identical "Helicoid cyme" glossary entries at lines 2250–2251; (3) optionally (F3 standing residue) either add ~48 more glossary entries or soften the row-61/header claim to "every bolded term defined in the body or glossary". Items 1 and 2 are two-line fixes; item 3 is a scope decision. The document's factual content and the taxonomy spine are clean.