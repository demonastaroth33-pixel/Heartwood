# BOTANY MASTER AUDIT — MASTER-Botany-Reference.md

**Auditor:** zero-miss coverage contract pass
**Date:** 2026-08-29
**Scope:** MASTER-Botany-Reference.md (2,197 lines; Parts 1–13 + GLOSSARY + 62-row COVERAGE CHECKLIST) vs the 6 source briefs (A-seed, B-stems, C-roots, D-leaves, E-reproduction, F-seasonality).
**Method:** full read of the master (all 2,197 lines), full read of all 6 briefs, verification greps for suspected omissions (receptacle, rachis, trichome, marcescence, BBCH, quiescence, vivipary, parthenocarpy, thermoinhibition, perisperm, strophiole, pulvinus, sclerenchyma, photonasty, semelparous, florigen, petiolule, peduncle, decompound, intermediate, alternating — all zero matches in the master), and a cross-reference pass over all 80 `§` pointers.

---

## EXECUTIVE VERDICT: **FAIL**

The document is a strong, genuinely complete botanical synthesis at the taxonomy level — but the audit contract it carries is **not** satisfied: two of its own checklist rows fail (61 Glossary, 62 Readability), two beginner-level botanical facts are wrong (maple phyllotaxy, rose ovary position), the doc contradicts itself on oak dormancy, one root-modification category is missing from an "exhaustive" catalog, and 7 cross-references point at the wrong sections. A doc whose stated purpose is to be cited by future AI sessions as ground truth cannot carry known-wrong facts or broken pointers. All fixes are localized; the taxonomy spine (rows 1–60) verifies clean.

**Finding counts:** CRITICAL = 2 · MAJOR = 8 · MINOR = 12 · Total = 22

---

## VERIFIED CORRECT (positive baseline)

- **Checklist rows 1–60: all satisfied** after reading the actual sections, not just the row text. Every item in every row is present and substantively correct in the cited part:
  - Row 3 (5 Baskin & Baskin dormancy classes + stratification, scarification, ABA/GA, after-ripening, seed banks, serotiny, viability records) — §1.4. ✓
  - Row 14 (ALL 13 stem modifications) — §4.6.1–13. ✓
  - Row 19 (ALL 15 root modifications incl. fasciculated/annulated/moniliform/nodulose, Pando, pneumathodes) — §5.6.1–15. ✓ (one brief item missing — see CRITICAL-adjacent MAJOR-3)
  - Row 26 (ALL 16 leaf modifications) — §6.5.1–16. ✓
  - Row 42 (ALL 25 inflorescence types, numbered 1–25) — §10.2A/B/C. ✓ — cross-checked against brief E §2.1/2.2/2.3: raceme, spike, spikelet, catkin, spadix, corymb, umbel, capitulum, panicle; dichasium, helicoid, scorpioid, cincinnus, polychasium, umbelliform cyme; compound raceme/umbel/corymb/spike/capitulum, thyrse, verticillaster, cyathium, hypanthodium, fascicle, glomerule, ray/disk, pseudanthium — all 25 present, none dropped.
  - Row 45 (ALL 30 fruit types, numbered 1–30) — §10.5A–F. ✓ — cross-checked against brief E §4.1–4.6: all 30 present, none dropped.
- **Dormancy classes (A §3):** all 5 classes present; ABA/GA, after-ripening, stratification, scarification, seed banks, serotiny, viability records all present.
- **Chronological organization:** PASS. Seed (1) → germination (2) → seedling (3) → organs (4–6) → secondary growth (7) → vascular (8) → seasons (9) → reproduction (10) → lifecycle (11) → environment (12) → bridge (13) → glossary → checklist. No orphaned content; forward references (Part 9 flowering clocks before Part 10 flowers; §4.6.5 bulb → §6.5.9/11) are by-design cross-links, not orphans.
- **TOC vs actual parts:** PASS — all 13 parts + glossary + checklist present in both; titles match.
- **Dispersal (E §5.1):** wind/water/animal/mechanical all covered (§10.6); myrmecochory + elaiosome present.
- **Pollination (E §3):** all selfing-avoidance mechanisms + 5 syndromes + fig-wasp and yucca-moth coevolution present (§10.3).
- **Seasonality/lifecycle (F):** phenology clocks, 3 dormancy types, photoperiodism, vernalization, evergreen/deciduous/semi/drought-deciduous, four seasons, abscission chemistry, tropisms, all stress classes, lifestyles, 7 life stages, succession, lifespan records, sigmoid curve, juvenile/adult wood — all present. (Specific gaps below are the exceptions.)

---

## CRITICAL FINDINGS (incorrect content)

**FINDING 1 — CRITICAL. Location: PART 4, §4.4 Phyllotaxy (line 412).**
"alternate (one leaf per node, spiraling — oak, beech, **maple**)" — maple is wrong: ALL maples (*Acer*) are opposite-leaved (the classic opposite example, along with ash, dogwood, horse chestnut). The doc contradicts itself: the very next clause lists "opposite (two per node — **maple**, ash, mint family)". A reader memorizing either list gets an identification fact wrong. Remove maple from the alternate list.

**FINDING 2 — CRITICAL. Location: PART 10, §10.1 Ovary position (line 1252).**
"hypogynous (ovary above the other whorls — 'superior'; buttercup, **rose**)" — rose is wrong: *Rosa* is the textbook **perigynous** example (ovary free inside the hypanthium cup), which the doc itself defines in the next clause ("perigynous (ovary in a cup of fused bases — cherry)") — rose is exactly that. Move rose to perigynous; hypogynous examples: buttercup, tomato, pea (as in brief E §1.4).

---

## MAJOR FINDINGS (incomplete / contradictory / broken structure)

**FINDING 3 — MAJOR. Location: COVERAGE CHECKLIST row 61 (Glossary).**
Row 61 ("every bolded term defined") is NOT satisfied. The glossary omits the large majority of bolded terms used in the body. Representative missing entries (all bolded in the text): embryo sac, double fertilization, polyembryony, gibberellins, after-ripening, seed bank, cardinal temperature, orthodox seed, de-etiolation, hypocotyl hook, primary root, Janzen–Connell, lateral meristem, intercalary meristem, epidermis, open collateral bundle, terminal bud, leaf scar, bud scale scars, distichous, decussate, golden angle, auxin, fruit spur, homolog, basal plate, succulent stem, bulbils, offsets, osmosis, nitrogen fixation, root flare, hemiparasite, root suckers, root exudates, amphistomatous, veins, veinlets, midrib, venation, simple leaf, trifoliolate, bipinnate, odd/even-pinnate, all margin terms (entire/serrate/dentate/crenate/lobed/pinnatifid/palmatifid), all shape terms (lanceolate…acicular), all apex/base terms, primordia, heterophylly, turgor, pitcher leaves, bladder traps, snap traps, CAM, scale leaves, foliage leaves, catch leaves, fascicular/interfascicular cambium, earlywood, ring-porous/diffuse-porous, false rings, missing rings, hardwood/softwood, tension wood, compression wood, fibers, sieve plates, pressure flow, Pfr/Pr, budburst, paradormancy/endodormancy/ecodormancy, cold hardiness, short-day/long-day/day-neutral, critical day length, carotenoids, petals, androecium, gynoecium, filament, pistil, racemose, cymose, corymb, dichasium, cincinnus, disk floret, pollination, entomophily, ornithophily, chiropterophily, replum, mericarp, poricidal/loculicidal/septicidal/circumscissile/valvate/denticidal, aggregate fruit, multiple fruit, accessory fruit, sorosis, hypanthium, juvenility, polycarpic, tropism, chemotropism, halophytes, shade avoidance, sunscald, windthrow. (80+ entries.) The glossary's header claim "every term, one line each" is therefore false.

**FINDING 4 — MAJOR. Location: COVERAGE CHECKLIST row 62 (Readability).**
Row 62 ("every technical term defined inline at first use") is NOT satisfied. Two technical terms are used repeatedly and **never defined anywhere** (not inline, not in the glossary):
- **receptacle** — used at §10.2A8 ("expanded receptacle (torus)"), §10.5D19, §10.5D20, §10.5F27; "torus" is likewise never defined. A non-botanist cannot know that the receptacle is the flower-stalk tip to which the whorls attach (brief E §1 defines it; the master dropped the definition).
- **rachis** — used at §6.3 ("leaflets along a central rachis") with no definition (leaf-stalk of a compound leaf; also the flower-bearing axis in brief E §2 intro).
Additional first-use violations: **ethylene** first appears at §9.5 (fruits bullet) as a bare cross-ref "(ethylene drives ripening — §10.7)" with no inline definition until §10.7; **periderm** first appears at §4.6.3 (potato "skin is a periderm") with no definition until §7.5; **mesocarp/endocarp** (§10.5A2 drupe) are used without definition. Chronological ordering itself is satisfied.

**FINDING 5 — MAJOR. Location: PART 5, §5.6 (root modifications).**
The "exhaustive" catalog is missing one category from brief C §6: **water-storage roots** (C §6.16 — succulent taproots of desert/caudex plants holding water through drought, e.g. *Pachypodium*, caudex succulents, bottle trees). Also, **assimilatory (photosynthetic) roots** (C §6.14, e.g. the leafless orchid *Taeniophyllum* — "the plant has essentially traded leaves for roots") are collapsed into item 15 "Floating / assimilatory roots," losing the defining example and the distinct function (photosynthesis vs buoyancy). Master = 15 numbered items vs brief's 16.

**FINDING 6 — MAJOR. Location: PART 1, §1.5 (germination triggers).**
Incomplete vs brief A §4. Missing: **thermoinhibition** (A §4.2), **alternating temperatures** as a germination promoter (A §4.2), **nitrate / ethylene / CO₂ promotion** (A §4.6), **intermediate seeds** (A §4.7 — between orthodox and recalcitrant; some citrus), and the whole **seasonal-timing class** (A §4.8 — spring germinators, autumn germinators/winter-annual rosettes, rain-threshold germination of arid-land seeds). The master's "four master triggers" frame covers the checklist row 4 items but drops these brief-level triggers.

**FINDING 7 — MAJOR. Location: PART 1 §1.4 vs PART 2 §2.2 (oak dormancy).**
Internal contradiction. §1.4: "stratification (… the standard treatment for apple, **oak**, and most temperate tree seeds)". §2.2: "**Oak** (hypogeal, recalcitrant): acorn germinates within weeks of fall (**no dormancy**)". Both are true for different oaks — brief A §3.2: white oak has no dormancy (germinates at autumn shed), red oak has deep physiological dormancy needing ~3 months cold — but the master states both as universal, so a reader cannot reconcile them. Either qualify both sentences or add the white/red split in one place.

**FINDING 8 — MAJOR. Location: PART 9, §9.4 (leaf strategies).**
**Marcescence** is missing (brief F §5 and D §6: beech and some oaks hold dead brown leaves through winter, shedding at bud break — a distinct middle strategy between evergreen and deciduous). The §9.4 trio (deciduous / evergreen / semi-drought-deciduous) is incomplete without it.

**FINDING 9 — MAJOR. Location: PART 9, §9.1 (phenology).**
The **BBCH scale** is missing (brief F §1 presents it as "the scientific standard" — two-digit 00–99 codes covering the whole life cycle: germination, leaf development, flowering 60–69, senescence 90–99; example BBCH 65 = full flowering). The master presents only the citizen-observatory "Budburst stages" sequence and claims that is "the standardized sequence"; the scientific-standard scale is absent.

**FINDING 10 — MAJOR. Location: cross-references throughout (7 broken).**
Verified pointer audit of all 80 `§` references — seven point at the wrong section:
1. §1.2 (line 101): "produced by double fertilization **(§10.7)**" — double fertilization is at **§10.4**; §10.7 is the reproductive timeline.
2. §1.5 (line 181): "The sensor is **phytochrome** (§9.3)" — phytochrome (Pfr/Pr) is explained at **§9.1**, not §9.3 (photoperiodism).
3. §4.2 (line 382): medullary rays "become the rays of the wood **(§7.4)**" — §7.4 is reaction wood; rays are covered in **§7.1** (ray initials) and §7.3 (ray flecks).
4. §4.3 (line 406): "Bud scales … **(§6.5.13)**" — §6.5.13 is scale leaves; bud scales are **§6.5.11**.
5. §4.6.4 (line 469): "a bulb is layered leaves **(§6.5.11)**" — §6.5.11 is bud scales; bulb scales are **§6.5.9**.
6. §7.2 (line 923): "Count the rings = count the growing seasons **(§7.3 caveats)**" — the caveats (false rings, missing rings) are described in **§7.2 itself**; §7.3 is sapwood/heartwood.
7. §10.2A8 (line 1303): "The head has two flower kinds **(§10.2C)**" — the disk/ray floret definitions are inside item 8 (A section) itself; §10.2C (compound & special) contains no ray/disk content.

---

## MINOR FINDINGS (accuracy nits)

**FINDING 11 — MINOR. §1.4 (line 159):** "the oldest verified seed — an Arctic lupine — germinated after ~10,000 years in permafrost." The Arctic lupine (*Lupinus arcticus*) claim is contested and was never properly verified; the radiocarbon-verified records are the ~2,000-year-old Judean date palm and ~1,300-year-old lotus (brief A §4.7 gives exactly these). Calling the lupine "verified" overstates it.

**FINDING 12 — MINOR. §8.3 (line 1068):** "A giant redwood moves water hundreds of metres this way" — the tallest tree is ~116 m (brief D §8: "often >100 m in tall trees"). "Hundreds of metres" is an overstatement.

**FINDING 13 — MINOR. §4.5 (line 436):** dichotomous branching examples "some cacti, clubmosses" — clubmosses are lycophytes, not dicots; the brief (B §9) cites mistletoe (*Viscum*) as the classic dicot example. Citing non-dicots as examples of a "rare in dicots" trait is confusing.

**FINDING 14 — MINOR. §9.5 Spring (lines 1173–1175):** "Flowering often comes BEFORE leaf-out (cherry, **apple**, **oak** …)" — apple typically flowers with/after leaf-out, and brief F §1 says "oaks flower as leaves emerge" (not before). Cherry is right; apple and oak are wrong examples for bloom-before-leaf.

**FINDING 15 — MINOR. §12.1 (line 1696):** heliotropism example "(**morning glory**, sunflowers' bud tracking …)" — morning glory flowers are nyctinastic, not heliotropic; brief F §8 explicitly corrects this ("the classic 'morning glory' behavior is not heliotropism — it is nyctinasty"). The master's own §6.4/§12.1 nastic recap never claims morning glory, so the two sections disagree with the brief.

**FINDING 16 — MINOR. §11.1 (lines 1584–1585):** monocarpic examples "(the century plant/agave, some bamboos — monocot note; some Andean *Puya*)" — *Puya* is a bromeliad, i.e. also a monocot; the "monocot note" flag applies to it too, yet it is listed after the flag as though it were a dicot example. Brief F's dicot monocarpics (giant lobelias) are the missing dicot examples.

## MINOR FINDINGS (brief→master completeness, detail level)

**FINDING 17 — MINOR. Brief A omissions (seed/seedling detail):** lens/strophiole (water gap, A §1.1); perisperm (A §1.3, beet/black pepper); ovule orientations anatropous/orthotropous/campylotropous/amphitropous (A §2.2); proembryo→globular→heart→torpedo embryo stages (A §2.2); quiescence vs dormancy (A §3 intro); germination inhibitors in fruit pulp as a timing device (A §4.6 — tomato juice case); plumular hook for hypogeal germination (A §5); photomorphogenesis/skotomorphogenesis terms (A §5); true winged seeds (catalpa, A §8.1); mistletoe viscin (A §8.2); vivipary/mangrove propagules (A §8.3); jays as scatter-hoarders ("jays are oaks' main gardeners," A §8.4).

**FINDING 18 — MINOR. Brief B omissions (stem detail):** bundle scars (B §1); trichomes (B §2 — never mentioned in master, though "hairs" appear in passing at §12.3); sclerenchyma/sclereids (B §2); starch sheath (B §2); adventitious buds (B §1 — epicormic buds are described but the category is unnamed); semi-ring-porous wood (B §4, walnut/black cherry); excurrent vs decurrent crown architecture (B §9); determinate shoot growth (B §11 — master only contrasts animal determinate growth at §7.7); dendrochronology term (B §4); wood grain types straight/spiral/interlocked/wavy/bird's-eye (B §7); heartwood color examples (ebony/purpleheart etc., B §7); auxin as the spring cambium-reactivation signal (B §11).

**FINDING 19 — MINOR. Brief C omissions (root detail):** columella (C §3.1); xylem-arch arm types diarch/triarch/tetrarch + exarch maturation (C §3.8); apoplast/symplast/plasmodesmata (C §3.6); leghemoglobin (C §4); Hartig net (C §4 — master says only "threads between cells"); AM vesicles (C §4); orchid peloton mycorrhiza third type (C §4); rhizosphere (C §4/§7); intraspecific root grafting (C §7); root depth records (~68 m fig, mesquite 50+ m, C §2.4); anomalous cambia in sweet potato (C §5 — beet is covered, sweet potato is not); lobed root cambium (C §5); additional haustoria examples broomrape/*Striga*/*Rafflesia* (C §6.9 — master has only dodder + mistletoe); depth syndromes alpine/permafrost (C §8).

**FINDING 20 — MINOR. Brief D omissions (leaf detail):** pulvinus/pulvini (D §7 — master's leaf-movement mechanism is "turgor loss" without the hinge); subsidiary cells (D §2.3); bundle sheath (D §2.5); petiolule (D §3.1); decompound leaves (D §3.1); leaflet arrangement opposite/alternate (D §3.1); leaf symmetry classes bilateral/radial (D §3.8); rosette phyllotaxy (D §3.7); undulate and spinose margins (D §3.3); deltoid/spatulate/peltate shapes (D §3.4); emarginate apex (D §3.5); oblique/inequilateral base (D §3.6); epicuticular wax/bloom (D §2.2); leaf-edge plantlets (*Kalanchoe*, D §1); leaf-longevity records (Welwitschia, evergreen 1–5 yr, D §4); venation subtypes craspedodromous/camptodromous (D §3.2/§9); the dichotomous-key identification ladder (D §9 — directly relevant to the engine's trait dictionary).

**FINDING 21 — MINOR. Brief E omissions (reproduction detail):** peduncle vs pedicel (E §1); placenta/locule (E §1.1); apocarpous/syncarpous pistils (E §1.1); polygamous (E §1.2); floral diagram (E §1.5); parthenocarpy (E §3.2 — seedless banana/navel orange); anthesis, fruit set, "June drop" (E §6); climacteric vs non-climacteric ripening (E §6); buzz pollination + poricidal anther vibration (E §3.1); butterfly/moth/fly/beetle syndrome subtypes (E §3.1 — master condenses to "bees/flies/beetles"); *Ophrys* pseudocopulation and hawkmoth coevolution (E §3.1); white vs red oak acorn maturation timing (E §6).

**FINDING 22 — MINOR. Brief F omissions (seasonality detail):** thermonasty/photonasty (F §8); semelparous/iteroparous synonyms (F §10); florigen/FT (F §3); current vs mean annual increment (F §12); chill-hour values (apple 400–1,200, peach 300–900, F §2); altitude lapse rate 1.5–3 days/100 m (F §1); "false springs" term (F §1 — concept partially present at §9.5 as "late frosts"); delayed foliation (F §2); supercooling (F §6).

---

## VERDICT SUMMARY

- **CRITICAL (2):** F1 maple phyllotaxy (Part 4 §4.4); F2 rose ovary position (Part 10 §10.1).
- **MAJOR (8):** F3 checklist row 61 (glossary incomplete); F4 checklist row 62 (receptacle/rachis undefined); F5 root-modification catalog missing water-storage roots + assimilatory merge (Part 5 §5.6); F6 germination triggers incomplete (Part 1 §1.5); F7 oak dormancy contradiction (Part 1 §1.4 vs Part 2 §2.2); F8 marcescence missing (Part 9 §9.4); F9 BBCH scale missing (Part 9 §9.1); F10 seven broken cross-references.
- **MINOR (12):** F11–F16 accuracy nits; F17–F22 brief-detail omissions (A/B/C/D/E/F respectively).

**Bottom line:** the taxonomic core (all 25 inflorescences, all 30 fruits, all stem/leaf/dormancy items, 15 of 16 root items, rows 1–60) is genuinely complete and largely accurate; the document fails as a zero-miss contract on the glossary, inline definitions, two wrong facts, one contradiction, and the pointer integrity. Fixes are localized and enumerated above.