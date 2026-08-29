# BOTANY MASTER AUDIT 2 — FINAL VERIFICATION PASS
**Auditor:** zero-miss final pass · **Date:** 2026-08-29
**Scope:** MASTER-Botany-Reference.md (2,552 lines; Parts 1–13 + 392-entry glossary + 62-row checklist) vs the 22 findings of the prior audit (botany-audit.md)
**Method:** full re-read of the master (all 2,552 lines), programmatic extraction of all 79 §-pointers with per-pointer target validation, glossary-entry count + exact/duplicate scan, bold-term↔glossary coverage comparison (683 unique bold spans in body vs 392 glossary entries), targeted greps for every finding's content items.

---

## VERDICT: **PASS-WITH-FIXES** (borderline; see bottom line)

The two CRITICAL facts, the oak-dormancy contradiction, the missing root-modification category, marcescence, BBCH, and 12 of the 14 detail-bundle findings are genuinely fixed; the glossary grew 245→392 entries and row 62 (inline definitions) now verifies clean. **But 5 of the 7 broken cross-references were never touched, the glossary still omits ~45 bolded technical terms (row 61's "every bolded term" contract still fails), and 2 MINOR factual nits (Arctic lupine, redwood "hundreds of metres") remain verbatim.** All residual items are localized; nothing CRITICAL remains and the taxonomy spine is accurate.

**Counts:** FIXED = 16 · PARTIAL = 4 (F3, F10, F18, F19) · NOT FIXED = 2 (F11, F12) · NEW findings = 4 (all MINOR)

---

## PER-FINDING STATUS (22)

**F1 — CRITICAL, maple phyllotaxy (§4.4, line 472):** **FIXED.** Maple removed from the alternate list; alternate = "oak, beech, birch"; opposite = "maple, ash, mint family, horse chestnut".

**F2 — CRITICAL, rose ovary position (§10.1, line 1425-1428):** **FIXED.** Hypogynous = "buttercup, tomato, pea"; perigynous = "cherry, rose" (hypanthium cup).

**F3 — MAJOR, checklist row 61 (glossary):** **PARTIAL / NOT FULLY FIXED.** Glossary is now exactly 392 entries (row 61's count is accurate) and most of the finding's ~80 named terms are present (embryo sac, double fertilization, polyembryony, after-ripening, orthodox, de-etiolation, hypocotyl hook, Janzen–Connell, intercalary meristem, epidermis, open collateral bundle, leaf scar, bud scale scars, distichous, decussate, golden angle, auxin, osmosis, root flare, hemiparasite, root suckers, root exudates, amphistomatous, veinlets, venation, simple leaf, trifoliolate, bipinnate, odd/even-pinnate, primordia, heterophylly, turgor, CAM, catch leaves, interfascicular cambium, earlywood, ring-/diffuse-porous, false/missing rings, hardwood, tension/compression wood, fibers, sieve plates, pressure flow, budburst, para/endo/ecodormancy, critical day length, carotenoids, androecium, gynoecium, filament, racemose, cymose, dichasium, cincinnus, disk floret, pollination, ento/ornitho/chiropterophily, replum, mericarp, all 6 capsule modes, hypanthium, juvenility, halophytes, shade avoidance, sunscald, windthrow — all present). **However, the "every bolded term defined" contract still fails:** a programmatic bold-span↔glossary comparison (683 unique bold spans; fuzzy normalization) leaves ~45 genuinely bolded technical terms with **no glossary entry**, including: gibberellins/GA (§1.4), seed banks (§1.4), cardinal temperature range (§1.5), proembryo + globular (§1.3), anatropous/orthotropous/campylotropous/amphitropous (§1.3), establishment bottleneck (§2.3), sapling (§3.4), lateral meristem (§4.1), terminal (apical) bud (§4.3), adventitious buds (§4.5), fruit spurs (§4.5), decurrent (§4.5), homologs (§4.6), tunic (§4.6.4), basal plate (§4.6.5), succulent stem (§4.6.9), bulbils/offsets (§4.6.13), arbuscules (§5.4), Frankia (§5.4), Rhizobium (§5.4), nodules (§5.4), polyarch (§5.3), heart-shaped (§5.2), graft (§5.7), aerial/buttress/knee/contractile/prop-stilt/floating/assimilatory/nodulated roots (§5.6), banyan (§5.6.4), fasciculated/annulated (§5.6.2), rachis (§6.3), craspedodromous/camptodromous (§6.2), pitcher/bladder/snap traps (§6.5), scale leaves (§6.5.13), foliage leaves (§6.5.14), ray initials (§7.1), semi-ring-porous (§7.2), grain types straight/spiral/interlocked/wavy/bird's-eye + softwood (§7.3), Pfr/Pr (§9.1), cold hardiness + supercooling (§9.2), delayed foliation (§9.1), short-day/long-day/day-neutral plants (§9.3), corymb + compound corymb (§10.2), all five "aggregate of X" entries (§10.5D), sorosis (§10.5E25), nutlet (§10.5C18), pistil/petals (§10.1), polycarpic/iteroparous/semelparous (§11.1), snag (§11.2), current annual increment (§11.2), tropism + chemotropism (§12.1), chilling injury (§12.3). Most of these ARE defined inline (row 62 OK) — the failure is glossary completeness only. Glossary header still claims "every term, one line each".

**F4 — MAJOR, checklist row 62 (inline first-use definitions):** **FIXED.** receptacle now defined at first use §10.2A8 (line 1479, with torus); rachis defined at §6.3 line 875; ethylene has an inline gloss at §9.5 ("the ripening hormone, §10.7"); periderm glossed at §4.6.3 ("the corky protective layer, §7.5"); mesocarp/endocarp glossed inline at §10.5A2. Chronological order intact.

**F5 — MAJOR, root-modification catalog (§5.6):** **FIXED.** Catalog now 17 items: new item 15 "Water-storage roots" (*Pachypodium*, caudex succulents, bottle trees; cross-linked to §4.6.10) and assimilatory roots (16, *Taeniophyllum*/*Tinospora*) split from floating roots (17, buoyancy vs photosynthesis distinction explicit).

**F6 — MAJOR, germination triggers (§1.5):** **FIXED.** Added thermoinhibition, alternating temperatures, nitrate/ethylene/CO₂, fruit-pulp inhibitors, seasonal-timing classes (spring/autumn-winter-annual/rain-threshold), and intermediate seeds (citrus, coffee) under a "finer triggers" block.

**F7 — MAJOR, oak dormancy contradiction (§1.4 vs §2.2):** **FIXED.** §1.4 now says stratification is "the standard treatment for apple, red oak, and most temperate tree seeds" and adds "White-oak acorns skip this entirely — they germinate at autumn shed; red-oak acorns need the cold months (§2.2)"; §2.2's oak timeline explains the two clans identically. Consistent.

**F8 — MAJOR, marcescence (§9.4):** **FIXED.** Added "Marcescent (the middle strategy): beech and some oaks hold their DEAD brown leaves through winter… shedding them only at spring bud break" with function notes, between evergreen and deciduous.

**F9 — MAJOR, BBCH scale (§9.1):** **FIXED.** Added "The scientific standard is the BBCH scale (00–99 two-digit codes… 00–09 germination, 10–19 leaf development, 60–69 flowering — BBCH 65 = full flowering, 90–99 senescence/dormancy)" after the citizen-science budburst sequence.

**F10 — MAJOR, cross-references (7 broken):** **PARTIAL / NOT FULLY FIXED — 5 of 7 still wrong.** Fixed: (1) §1.2 double fertilization now → §10.4 ✓; (2) §1.5 phytochrome now → §9.1 ✓. Still broken:
- **§4.2 line 440** "they become the rays of the wood (§7.4)" — §7.4 is Reaction wood; rays are §7.1 (ray initials) / §7.3 (grain and rays).
- **§4.3 line 466** "Bud scales … (§6.5.13)" — §6.5.13 is Scale leaves; bud scales are §6.5.11.
- **§4.6.4 line 536** "a bulb is layered leaves (§6.5.11)" — §6.5.11 is Bud scales; bulb scales are §6.5.9.
- **§7.2 line 1063** "Count the rings = count the growing seasons (§7.3 caveats)" — §7.3 is sapwood/heartwood; the false/missing-ring caveats are in §7.2 itself (lines 1068–1070).
- **§10.2A8 line 1482** "The head has two flower kinds (§10.2C)" — §10.2C (compound & special) contains no ray/disk content; the definitions are inside item 8 itself.
All other 74 §-pointers (incl. §7.4 at line 1960 = reaction wood ✓, §6.5.9-style refs, §A9/§B/§C/§F/§10.2C22/§10.5B9/§10.5E) validate against the section headers.

**F11 — MINOR, Arctic lupine record (§1.4, line 176):** **NOT FIXED.** Text unchanged: "the oldest verified seed — an Arctic lupine — germinated after ~10,000 years in permafrost." The contested *Lupinus arcticus* claim is still called "verified" (Judean date palm ~2,000 yr / lotus ~1,300 yr are the radiocarbon-verified records and remain absent).

**F12 — MINOR, redwood water rise (§8.3, line 1218):** **NOT FIXED.** Text unchanged: "A giant redwood moves water hundreds of metres this way without a pump". Tallest tree ≈ 116 m; "hundreds of metres" still overstates.

**F13 — MINOR, dichotomous branching (§4.5, line 496-497):** **FIXED.** Clubmosses gone; now "rare in dicots (some cacti; the classic dicot example is mistletoe, *Viscum*)".

**F14 — MINOR, bloom-before-leaf (§9.5, line 1343):** **FIXED.** Now "cherry, willow, hazel"; apple and oak removed (willow/hazel are correct early-bloomers).

**F15 — MINOR, morning glory heliotropism (§12.1, line 1904-1906):** **FIXED.** Morning glory removed; now "sunflowers' bud tracking — though mature sunflower heads face east and stay".

**F16 — MINOR, Puya monocarpic (§11.1, line 1786-1790):** **FIXED.** Puya gone; now "the century plant/agave and bamboos (monocot note); the true dicot monocarpics include the giant lobelias of East Africa".

**F17 — MINOR, brief A omissions:** **FIXED.** lens/strophiole ✓ (§1.2), perisperm ✓ (§1.2), ovule orientations ✓ (§1.3), proembryo→globular→heart→torpedo ✓ (§1.3), fruit-pulp inhibitors ✓ (§1.5), plumular hook ✓ (§2.1), photomorphogenesis/skotomorphogenesis ✓ (§2.1), winged seeds ✓ (§1.6), viscin ✓ (§1.6), vivipary ✓ (§1.5), jays as scatter-hoarders ✓ (§1.6). Quiescence is now defined in the glossary (entry "Quiescence") but appears nowhere in the body — see NEW finding N4.

**F18 — MINOR, brief B omissions:** **PARTIAL.** Fixed: bundle scars ✓ (§4.3), trichomes ✓ (§4.2), sclerenchyma/sclereids ✓ (§4.2), starch sheath ✓ (§4.2), adventitious buds ✓ (§4.5), semi-ring-porous ✓ (§7.2), excurrent vs decurrent ✓ (§4.5), dendrochronology ✓ (§7.2), wood grain types ✓ (§7.3), heartwood colors ✓ (§7.3), auxin as spring cambium signal ✓ (§7.2). **Still absent: "determinate shoot growth"** — the 9 "determinate" hits are all inflorescence/animal contexts (§10.2, §7.7); the shoot-growth concept (B §11) was never added.

**F19 — MINOR, brief C omissions:** **PARTIAL.** Fixed: columella ✓ (§5.3), diarch/triarch/tetrarch + exarch ✓ (§5.3), apoplast/symplast/plasmodesmata ✓ (§5.4), leghemoglobin ✓ (§5.4), Hartig net ✓ (§5.4), orchid pelotons ✓ (§5.4), rhizosphere ✓ (§5.7), intraspecific root grafting ✓ (§5.7), root depth records ✓ (§5.2), anomalous cambia in sweet potato ✓ (§5.5), lobed root cambium ✓ (§5.5), haustoria rogues' gallery broomrape/*Striga*/*Rafflesia* ✓ (§5.6.10), alpine/permafrost depth syndromes ✓ (§5.7). **Still absent: AM vesicles** (arbuscules are covered, vesicles are not — 0 hits in body).

**F20 — MINOR, brief D omissions:** **FIXED.** All present: pulvinus ✓ (§6.4), subsidiary cells ✓ (§6.2), bundle sheath ✓ (§6.2), petiolule ✓ (§6.3), decompound ✓ (§6.3), leaflet arrangement ✓ (§6.3), bilateral/radial symmetry ✓ (§6.3), rosette phyllotaxy ✓ (§6.3), undulate/spinose margins ✓ (§6.3), deltoid/spatulate/peltate ✓ (§6.3), emarginate ✓ (§6.3), oblique base ✓ (§6.3), epicuticular wax ✓ (§6.2), *Kalanchoe* plantlets ✓ (§6.4), *Welwitschia* longevity ✓ (§6.4), craspedodromous/camptodromous ✓ (§6.2), dichotomous key ✓ (§6.3).

**F21 — MINOR, brief E omissions:** **FIXED.** All present: peduncle vs pedicel ✓ (§10.2 intro), placenta/locule ✓ (§10.1), apocarpous/syncarpous ✓ (§10.1), polygamous ✓ (§10.1), floral diagram ✓ (§10.1), parthenocarpy ✓ (§10.4), anthesis/fruit set/June drop ✓ (§10.7), climacteric vs non-climacteric ✓ (§10.7), buzz pollination + poricidal anthers ✓ (§10.3), butterfly/moth/fly/beetle subtypes ✓ (§10.3), *Ophrys* pseudocopulation ✓ (§10.3), white vs red oak acorn maturation ✓ (§10.7).

**F22 — MINOR, brief F omissions:** **FIXED.** All present: thermonasty/photonasty ✓ (§6.4), semelparous/iteroparous ✓ (§11.1), florigen/FT ✓ (§9.3), current vs mean annual increment ✓ (§11.2), chill hours ✓ (§9.1), altitude lapse rate ✓ (§9.1), false springs ✓ (§9.1), delayed foliation ✓ (§9.1), supercooling ✓ (§9.2).

---

## NEW FINDINGS (this pass)

**N1 — MINOR. §10.5A2 (line 1614), drupe entry:** repair artifact — duplicated fragment: "…HARD stony **endocarp** (the pit - the three pericarp layers: exocarp / mesocarp / endocarp) endocarp ("pit") around one seed…" The inline gloss was inserted but the original "endocarp ("pit")" was not removed.

**N2 — MINOR. GLOSSARY (lines 2240–2241):** duplicate entry — "Helicoid cyme (bostryx)" and "Helicoid cyme" are the same definition twice (one new-format, one legacy format). Also cosmetic: the glossary mixes "-" and "—" separators inconsistently (pre-existing style drift, not blocking).

**N3 — MINOR. GLOSSARY (line 2199), Endodormancy entry:** grammar typo in a new entry — "the bud own winter rest needing chilling" should be "the bud's own winter rest".

**N4 — MINOR. COVERAGE CHECKLIST row 3 vs §1.4:** row 3 lists "quiescence" as covered under §1.4, but the term appears **nowhere in the body** (0 hits before the glossary); it is defined only in the glossary entry. Row 3 is technically satisfiable via the glossary, but the row's Part-1.4 mapping is misleading for a zero-miss contract.

---

## COVERAGE CHECKLIST RE-VERIFICATION (rows 1–62)

Fully verified against text: **row 1** ✓ (§1.2: coat/testa+tegmen, hilum, micropyle, raphe, chalaza, radicle/plumule/hypocotyl/epicotyl/cotyledons, endosperm, albuminous/exalbuminous — all present) · **row 3** ✓ (§1.4: all 5 Baskin & Baskin classes, stratification, scarification, ABA/GA, after-ripening, seed banks, serotiny, viability records; quiescence only in glossary — see N4) · **row 4** ✓ (§1.5: imbibition, cardinal temps, thermoinhibition, alternating temps, photoblasty, oxygen, nitrate/ethylene/CO₂, karrikins, fruit-pulp inhibitors, seasonal-timing classes, orthodox/recalcitrant/intermediate) · **row 14** ✓ (§4.6: all 13 stem modifications, numbered) · **row 19** ✓ (§5.6: all 17 root modifications incl. water-storage, assimilatory, floating) · **row 26** ✓ (§6.5: all 16 leaf modifications, numbered) · **row 36** ✓ (§9.1: GDD, lapse rate, photoperiod, chilling + chill-hour values, BBCH, budburst stages, delayed foliation, false springs) · **row 37** ✓ (§9.2: para/endo/ecodormancy, cambial dormancy, cold hardiness, supercooling) · **row 39** ✓ (§9.4: deciduous/evergreen/semi-drought/marcescent + flush patterns) · **row 42** ✓ (§10.2: all 25 inflorescences incl. ray/disk in item 8; cross-checked against the taxonomy list — none dropped) · **row 45** ✓ (§10.5A–F: all 30 fruit types, none dropped) · **row 61** ✗ PARTIAL (see F3) · **row 62** ✓ (see F4).

Sampled rows all pass: 5 (§1.6) ✓, 6–8 (§2–3) ✓, 9–13 (§4.1–4.5) ✓, 15–18, 20 (§5) ✓, 21–25 (§6.2–6.4) ✓, 27–32 (§7) ✓, 33–35 (§8) ✓, 38, 40 (§9) ✓, 41, 43–44, 46–47 (§10) ✓, 48–53 (§11) ✓, 54–59 (§12) ✓, 60 (§13) ✓.

## CROSS-REFERENCE INTEGRITY
79 §-pointers extracted; 74 resolve correctly; **5 still wrong** (listed in F10). No new broken pointers beyond the F10 residue were found.

## BOTTOM LINE
Verdict **PASS-WITH-FIXES**, borderline on strict zero-miss grounds: the two CRITICALs, the contradiction, the catalog gap, and 16 findings are cleanly fixed, and row 62 now passes — but row 61's "every bolded term" contract, the 5 stale cross-references, and the two MINOR factual nits (F11/F12) plus 4 new MINOR artifacts must be cleared before the document can honestly claim "PASS". All outstanding items are localized, enumerable, and non-taxonomic.