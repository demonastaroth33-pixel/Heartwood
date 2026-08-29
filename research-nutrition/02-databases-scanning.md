# PersonalOS Nutrition Research 02 — Food Databases, Barcode Scanning, Photo Recognition, Portion Estimation, Data Quality, Ingredient Parsing, GUI Patterns

Research cluster: food databases (OpenFoodFacts, USDA FoodData Central), barcode scanning tech + UX, photo food recognition, portion estimation, data quality, ingredient parsing, GUI layout. Current state as of Aug 2026. Research only — this file contains no code and makes no build decisions; it is input for a future DecisionLog entry.

Context anchors (from the task brief): PersonalOS is a private single-user offline-first Flutter Web/PWA. M3 nutrition scope = per-meal receipt-line logging (kcal/protein/carbs/fat + portionMultiplier), recipes, TDEE targets, macro-gap bar, weekly check-up, quiet meal reminders. No new dependencies without DecisionLog + approval. Barcode scanning is a FUTURE item. Estimated photo logging is REJECTED (no fake data). This report evaluates whether those constraints hold up against the 2026 evidence.

---

## 1. OpenFoodFacts (OFF) — the open product database

### Size and reach
- ~4.7M products as of Aug 2026, from ~180 countries / 40 languages, 25k–100k+ contributors; ~1,500 new products/day (https://world.openfoodfacts.org/, https://blog.openfoodfacts.org/wp-content/uploads/2025/05/Webinar-Open-Food-Facts-Science.pdf).
- Growth curve: 80k (2016) → 1M (2019) → 2.3M (2022) → 4M (2025) (https://en.wikipedia.org/wiki/Open_Food_Facts).
- Not all 4.7M are barcoded or nutrition-complete: the count is raw products; completeness is much lower (see below).

### License — viable for a private app, with obligations
- Database: Open Database License (ODbL); individual contents: Database Contents License (DbCL); product images: CC BY-SA (https://world.openfoodfacts.org/data, https://world.openfoodfacts.org/terms-of-use, https://openfoodfacts.github.io/openfoodfacts-server/api/).
- Practical reading for a **private, single-user, offline** app: ODbL permits use for any purpose; the share-alike obligation binds when you **redistribute a derived database** to others. A single user consuming an offline snapshot privately is on the safe side; shipping an "OFF mirror" as part of a public product or syncing it between users' devices without an ODbL disclosure would trigger the share-alike terms (https://traceapps.github.io/docs/nutritrace/off/ describes exactly this: "Personal and internal use is unrestricted," bulk redistribution needs ODbL compliance + a disclosure banner).
- Attribution required in derivative works (credit Open Food Facts + link). Cheap to satisfy in-app (source flag on entries).
- Trade-off vs USDA FDC: OFF is ODbL (copyleft-ish, share-alike on redistribution); USDA FDC is CC0/public domain — cleaner for any future redistribution (e.g., user export of the food DB, or if the app later becomes multi-user).

### API and offline/export
- Live JSON/XML API (`/api/v2/product/{code}`, `/api/v3/...`). Terms: "1 API call = 1 real scan by a user"; bulk scraping is blocked on purpose because full nightly dumps exist (https://world.openfoodfacts.org/data, https://openfoodfacts.github.io/openfoodfacts-server/api/).
- Exports generated nightly in: MongoDB dump, JSONL (gzip), Parquet (filtered/simplified; ~7–8 GB for the whole DB), CSV (en CSV ~0.9 GB gz / ~9 GB uncompressed), plus daily diffs (https://world.openfoodfacts.org/data, https://huggingface.co/datasets/openfoodfacts/product-database, https://github.com/openfoodfacts/openfoodfacts-exports).
- OFF ships an official Flutter app (source on GitHub), so Flutter-API integration is well-trodden (https://world.openfoodfacts.org/data).
- **Offline packaging is real and precedented**: a third-party FOSS tracker (NutriTrace) pulls the whole OFF `food.parquet` (~7–8 GB) to disk, serves barcode + name lookups from a local DuckDB view, supports `OFF_LOCAL_ONLY=1` air-gap mode, and falls through to the public API during download (https://traceapps.github.io/docs/nutritrace/off/). This proves the local-mirror architecture works, though 7–8 GB is far too large to bundle into a PWA — a **filtered subset** (see §9) is the realistic shape.

### Nutrition table (nutriments) completeness — the weak spot
- Nutrition fields are per-100g standardised: `energy-kcal_100g`, `proteins_100g`, `carbohydrates_100g`, `fat_100g`, `fiber_100g`, `salt/sodium_100g`, plus optional micronutrients (https://world.openfoodfacts.org/data/data-fields.txt). Macronutrient fields (kcal/protein/carbs/fat) are the well-populated core.
- Historical completeness (2018-era full-DB audit): "Nutrition facts completed 94%", "Complete 6%" (i.e., ~94% of products have *some* nutrition fields; only ~6% are fully completed across all states) (https://www.kaggle.com/datasets/michaelfumery/enopenfoodfactsorgproducts). A separate 2023-era snapshot shows "nutrition-facts-completed 35%" — the number swings with which facet/definition you read; the consistent takeaway is **a large minority of products have missing/partial nutrition data** (https://www.kaggle.com/datasets/konradb/open-food-facts).
- Deeper 2020 French-dump audit (1.12M products): 178 columns, 63% of columns >90% empty, 79% of table cells missing, 20% of products missing energy (https://github.com/titsitits/median-food-facts). Per-100g macro completeness is far higher than this implies (energy/protein/carbs/fat are the "core" fields people fill), but micronutrient coverage is sparse.
- There is a known bug where "nutrition facts completed" is marked with zero real nutrients (NOVA / fruit-veg estimates get stored in `nutriments`), i.e. the completed-flag is not trustworthy — apps must check the actual macro fields, not the state tag (https://github.com/openfoodfacts/openfoodfacts-server/issues/7061).

### Quality issues
- OFF is genuinely crowdsourced; OFF itself advises researchers to "filter by completeness scores or data quality indicators" and "validate critical data points" (https://world.openfoodfacts.org/scientific-publications).
- It has a real quality-control layer: 218+ automated data-quality checks (e.g., impossible values >105 g per 100 g, energy-not-matching-macros, category-vs-NutriScore incoherence), a `data_quality_errors_tags` facet to filter bad rows, and an "ingredients single ingredient" / "nutri-score grade from category" error taxonomy (https://openfoodfacts.github.io/openfoodfacts-server/dev/ref-perl-pod/ProductOpener/DataQualityFood.html, https://github.com/openfoodfacts/openfoodfacts-server/issues/8353).
- OFF also cross-fills nutrition from ingredients via CIQUAL (French composition DB) — estimates stored only when ≥95% of ingredients match (https://github.com/openfoodfacts/openfoodfacts-server/pull/8351). Useful for recipe-ish math but must be labelled as estimated.
- Barcode coverage: EAN-13/UPC/EAN-8 are the spine; products without a barcode get a synthetic `200...` prefix. Real-world scan hit-rate on OFF-sourced data is not directly measured in the app benchmarks (apps use their own DBs), but OFF is the seed source for Yazio/Lifesum/Foodvisor, so hit rates are "good for mainstream packaged goods, patchier for niche/local products" (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results).

### Verdict for PersonalOS
OFF is **viable as a seed source** for a private offline app: free, open, per-100g macros standardised, nightly dumps, an existing offline-mirror precedent, and a Flutter app already in the wild. The costs: ODbL attribution (easy), share-alike if you ever redistribute a derived DB (avoidable in a private app), and **data-quality heterogeneity** (you must filter to products with real macro values and treat OFF entries as "community-verified", not gold).

---

## 2. USDA FoodData Central (FDC) — the analytical backbone

### Coverage — five sub-databases, one API
- **Foundation Foods** ~250 items (quarterly updates): highest analytical quality, complete macro + deep micro panels (https://selfhostednutrition.org/api/usda-foundation-vs-survey-vs-branded/, https://fdc.nal.usda.gov/Foundation_Foods_Documentation).
- **SR Legacy** ~7,800 items: Standard Reference 28, frozen April 2018, never updated; the historical backbone for raw/minimally processed foods (https://fdc.nal.usda.gov/faq).
- **FNDDS (Survey)** ~7,000 items: NHANES "as eaten" foods, updated every ~2 years; includes portion weights (https://fdc.nal.usda.gov/faq).
- **Branded Foods** ~1.4M+ items (continuous monthly updates via API): manufacturer-submitted label data via the GDSN/GS1 partnership — this is what powers barcode lookups (https://selfhostednutrition.org/api/usda-foundation-vs-survey-vs-branded/, https://fdc.nal.usda.gov/faq).
- **Experimental** <100 items.
- Total: ~1.5M food rows, ~700 nutrients, ~28M food-nutrient tuples in the full bulk dump (https://selfhostednutrition.org/api/usda-bulk-csv-downloads-postgres/).

### API
- REST API at `https://api.nal.usda.gov/fdc/v1/...` with an API key (free): `/foods/search` (query + `dataType` filter), `/foods/list` (paged), `/food/{fdcId}`. Sort/filter by `dataType=Foundation,SR Legacy` to avoid Branded drowning search results. Returns nutrients per 100 g (energy in kcal + kJ), plus `foodPortions` (https://fdc.nal.usda.gov/api-guide, https://selfhostednutrition.org/api/usda-fdc-api-getting-started/).
- The old USDA Food Composition Databases API was discontinued 2020; FDC is the only current one (https://fdc.nal.usda.gov/api-guide).

### Licensing — cleanest possible
- Public domain, published under CC0 1.0; no permission needed; USDA only *requests* attribution/citation and notification (https://fdc.nal.usda.gov/, https://fdc.nal.usda.gov/api-guide). This is strictly simpler than OFF's ODbL for any future redistribution.

### Offline / bulk download
- Bulk downloads per data type in CSV + JSON, updated ~monthly (Branded refresh 6-monthly for downloads, monthly in API). April 2026 sizes: Foundation CSV 3.7M zipped; SR Legacy CSV 6.7M; FNDDS CSV 200M; **Branded CSV 428M zipped / 2.9G unzipped**; full-download-of-all-types CSV 460M zipped / ~3.1G (https://fdc.nal.usda.gov/download-datasets).
- Full-DB bulk load into Postgres: ~6 GiB compressed / ~14 GiB uncompressed, ~18 min on a Pi 5, sub-10 ms queries; recommended for offline-first or >200 lookups/day (https://selfhostednutrition.org/api/usda-bulk-csv-downloads-postgres/). A ready-made SQLite conversion exists (~430 MB file) specifically for offline mobile use (https://github.com/MenuLogistics/USDASQLite).

### Units / measures — gram-anchored, which matches PersonalOS's portionMultiplier model
- Analytical foods (Foundation/SR Legacy/FNDDS) are **per 100 g**, with `foodPortions` carrying household measures: `amount` (e.g. 3), `measure_unit` (tsp, cup), `portion_description` ("1 slice is 1/8th of a 14 inch pizza"), and crucially **`gram_weight`** — the gram equivalent of each measure (https://fdc.nal.usda.gov/docs/Download_Field_Descriptions_Oct2020.pdf, https://fdc.nal.usda.gov/portal-data/external/dataDictionary).
- FNDDS alone has ~22,000 portion weights (slice, piece, medium, teaspoon, cup...) all expressed in grams of edible portion (https://www.ars.usda.gov/ARSUserFiles/80400530/pdf/fndds/2021_2023_FNDDS_Doc.pdf).
- **This is the key structural fit**: PersonalOS stores `portionMultiplier` against a gram-based reference. FDC already ships the "1 unit of household measure = X grams" table, so a recipe/food can store "1 cup = 125 g" and the multiplier math is exact rather than guessed.
- Caveat: FNDDS portion gram weights are *averages/composites* ("medium apple" is a generic), and branded serving sizes are whatever the label says (https://www.ars.usda.gov/ARSUserFiles/80400530/pdf/fndds/2021_2023_FNDDS_Doc.pdf).

### Macros completeness
- Foundation + SR Legacy have complete kcal/protein/carbs/fat + fiber per 100 g. Branded entries carry only what's on the label (~14–16 mandatory nutrients; energy + macros are always present by law in US/UK/EU) (https://fdc.nal.usda.gov/faq, https://cronometer.com/blog/7-tips-accurate-nutrition-data/).

### Verdict
USDA FDC is the **highest-quality, most license-friendly, and best-gram-structure** source. For PersonalOS it is the natural "generic/analytical" layer (whole foods, raw foods, cooked basics) and the branded layer for barcode lookups later. OFF complements FDC on international/local packaged products. The two are the canonical pair used by the best-regarded FOSS trackers (https://selfhostednutrition.org/api/usda-fdc-api-getting-started/).

---

## 3. Barcode scanning UX across apps + technical options for a Flutter offline app

### The scan → result flow (as actually shipped)
All major trackers follow the same skeleton; the differences are in **post-scan decision points** and **database**:
1. Camera opens (or camera-less: Cronometer lets you type the barcode number; MFP too) (https://cronometer.com/blog/how-to-use-the-barcode-scanner/).
2. Auto-recognise → lookup by GTIN/UPC/EAN against the app's DB.
3. Result page = product name + photo + per-serving nutrition + serving-size control.
4. User adjusts serving (grams/household units) → "Add to Diary" → (optionally) meal slot (https://cronometer.com/blog/how-to-use-the-barcode-scanner/, https://fittechreview.me/how-myfitnesspal-barcode-scanner-fixes-calorie-count-errors/).
5. No-match path is the real differentiator: Cronometer → create Custom Food from photos of front + nutrition label, works immediately, optional submit to curation (https://cronometer.com/blog/how-to-use-the-barcode-scanner/); MFP → manual entry (slow); Lose It → manual search or Snap It photo (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results).

### Speed and the "duplicate-selection tax"
- Median scan→result ~1.5–3 s across apps; scan-to-log ~8–15 s including serving confirmation (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results, https://humanfuelguide.com/en/articles/tools/best-calorie-tracking-apps-with-barcode-scanner-2026).
- MFP's crowdsourced DB means **multiple entries per barcode** → the scan redirects to an entry-selection screen, adding 5–10 s and a decision point per scan (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results). Cronometer's one-verified-entry model lets the scan go straight to serving size (https://cronometer.com/blog/how-to-use-the-barcode-scanner/).
- Logging time is the strongest behavioural predictor of long-term adherence: a 2021 Appetite study found <30 s/meal ⇒ 78% 6-month retention vs 23% at >2 min (https://www.amyfoodjournal.com/blog/lose-it-app-review, https://nutrola.app/en/blog/i-tested-every-barcode-scanner-in-5-calorie-apps-accuracy-results).

### Verification / product-mismatch handling
- Every review emphasises: **a successful scan is not a verified entry**. Users must compare product name, serving size, and calories against the package; reformulations, old entries, and unit mixups (ml vs g!) are the classic traps (https://fittechreview.me/how-myfitnesspal-barcode-scanner-fixes-calorie-count-errors/, https://nutrola.app/en/blog/i-tested-every-barcode-scanner-in-5-calorie-apps-accuracy-results).
- "Phantom entries" — barcode mapped to a completely different product after a manufacturer reassigns a code — are a documented failure mode in unverified databases (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results).
- 100-barcode accuracy test (2026): MFP found 91/100 but only 58 matched the label within ±3% (14 major errors, 4 phantom); Cronometer found only 71/100 but 64 of those matched within ±3% (fewest errors per found product); Lose It 85 found/55 matched (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results).

### Offline scan availability
- Most scanners require internet (lookup hits a cloud DB). "Partial offline" = you can log foods already cached locally (MFP, Cronometer, Lose It); full offline logging = Nutrola/MacroFactor (queue scans, resolve on reconnect) (https://nutrola.app/en/blog/food-tracking-app-comparison-chart-2026, https://nutrola.app/en/blog/lose-it-barcode-scanner-not-accurate-better-options-2026). A local DB mirror eliminates this problem entirely — the trade-off is DB freshness.

### Technical options for a Flutter offline app (2026)
- **ML Kit Barcode Scanning** (Google): on-device, no network, free. Supports EAN-8/13, UPC-A/E, Code 39/128, QR, PDF417, Datamatrix. **Mobile-only (iOS + Android)** — explicitly no web (https://developers.google.com.cn/ml-kit/vision/barcode-scanning, https://pub.dev/packages/google_mlkit_barcode_scanning). Android model unbundled ~200 KB (Play Services download) or bundled ~2.4 MB; auto-zoom helps (https://developers.google.com/ml-kit/vision/barcode-scanning/android).
- **Flutter plugins**: `google_mlkit_barcode_scanning`, `google_barcode_kit`, `flutter_barcode_scanner_sdk` (all native/on-device) (https://pub.dev/packages/google_mlkit_barcode_scanning, https://github.com/hugobrancowb/google_barcode_kit, https://pub.dev/packages/flutter_barcode_scanner_sdk).
- **Web/PWA** (the PersonalOS reality): ML Kit does **not** run on web. Options: native **`BarcodeDetector` API** — Chrome 134 (2026) ships it enabled by default (~94% of Chrome installs; no Firefox, Safari "under consideration"), backed by Google's ML stack, 2–3× faster than ZXing WASM, works offline (https://dev.to/jamiepark-design/building-a-zero-dependency-barcode-scanner-with-the-web-barcode-detection-api-246k, https://whatpwacando.today/barcode/). Fallback: **zxing-wasm** (~2 MB, all modern browsers incl. Firefox) or **jsQR**. Flutter packages handling this: `mobile_scanner` (web backend auto = BarcodeDetector → zxing-wasm) and `omni_qrcode_barcode_web_reader` (BarcodeDetector + ZXing, validated multi-frame reads) (https://pub.dev/documentation/mobile_scanner/latest/, https://pub.dev/documentation/omni_qrcode_barcode_web_reader/latest/).
- PWA caveats: needs HTTPS/localhost for `getUserMedia`; camera focus on close barcodes is the weak point; HTML element overlay via `HtmlElementView` (https://dev.to/jamiepark-design/building-a-zero-dependency-barcode-scanner-with-the-web-barcode-detection-api-246k, https://github.laiyagushi.com/LHARISMENDY/PWA_Flutter).
- **No new dependency without DecisionLog**: on web, `BarcodeDetector` is a built-in browser API (no package needed); `mobile_scanner`/`omni_qrcode_barcode_web_reader` are packages that would need a DecisionLog entry. The browser-native path is dependency-free.

### What a "no-barcode-now" app loses
Concretely, from the 2026 evidence:
- The fastest, most accurate logging path for packaged food (barcode = anchor to manufacturer label; ±2–5% MAPE, vs ±15–20% for photo estimates) (https://nutrient-metrics.com/en/guides/barcode-scanner-accuracy-vs-photo-logging-field-test/, https://clinicalappreport.com/en/rankings/best-calorie-tracker-with-barcode-scanner-2026/).
- The no-match → "snap label, add entry" loop that keeps a database complete over time.
- Adherence: scan-based logging is the highest-retention input mode (https://www.amyfoodjournal.com/blog/lose-it-app-review).
What it does **not** lose for M3: whole-food/generic logging (analytical DB + search), recipes, and the macro-gap bar all work without barcodes. The barcode lane is additive, not foundational — but the **data source (branded product DB) and the local-mirror plumbing can be built now** and the camera layer added later.

---

## 4. Photo food recognition — current state 2026, and the REJECTED photo lane

### Where the field is
- AI photo logging went from ~±9% MAPE (2020–21) to ~±2.8% (2024–25) in the best measured systems, per a 89-study PRISMA-style systematic review (31,847 participants) — but the spread between apps is enormous: MyFitnessPal ±6.9% (text/barcode), SnapCalorie ±4.2%, Cal AI ±3.9% in that review's numbers, while other independent tests put the same apps far worse (https://www.nutrition-research-journal.com/articles/calorie-tracking-accuracy-systematic-review).
- Independent 2026 benchmarks are less flattering than vendor marketing: NIDDK/NIH tested four photo apps (MFP, Lose It, CalAI, Appediet) on 102 metabolically weighed meals: **calories underestimated ~250–345 kcal/meal (~⅓), fat underestimated ~30 g**, worst on high-fat/keto meals; carbs most consistent (https://www.sciencedaily.com/releases/2026/07/260726015237.htm). MFP ±18% and Foodvisor ±16.2% MAPE on weighed meals in the DAI 2026 benchmark; the category leader claimed ±1.1% but is not independently reproducible (https://clinicalnutritionreport.com/reviews/foodvisor/, https://caloriappdirectory.com/reviews/snapcalorie-review/).
- Apps: **Foodvisor** (France, 2018, one of the first; plate segmentation is its differentiator; ~±7–16% MAPE depending on test; strong on European cuisine, weak on Asian — 39–41% ID accuracy; portion ±28–31%) (https://clinicalappreport.com/en/reviews/foodvisor/, https://ai-food-tracker.com/reviews/foodvisor/, https://www.food-trackers.com/reviews/foodvisor/). **Calorie Mama** (Azumio, cited as a commercial photo logger in the research literature) (https://pmc.ncbi.nlm.nih.gov/articles/PMC10708545/). **SnapCalorie** — the most polished photo-only UX (~11 s to log), but **no independent validation** of its accuracy claims; 71/100 dish ID on mixed dishes; fails on non-Western cuisine (https://caloriappdirectory.com/reviews/snapcalorie-review/, https://clinicalnutritionreport.com/compare/cal-ai-vs-snapcalorie/).
- Google's own entry: Gemini models (2.0 Flash → 3.x) do open-ended meal photo analysis. A 2026 benchmark of ten VLMs on Nutrition5k: Gemini 3.0 Flash best calorie CCC 0.767 (MAE ~80.7 kcal) — but **weight/calorie MAPE still 39–120%** across models even with prompt engineering; models default to "canonical serving" portions unless explicitly told to estimate what they see (https://www.biorxiv.org/content/10.64898/2026.07.26.740845v1.full.pdf). Tom's Guide hands-on: surprisingly close on simple meals (ranges bracketing his weighed logs), overestimates on shallow/overhead shots due to lack of depth perception (https://www.tomsguide.com/ai/google-gemini/...). The "free Gemini hack" is a real 2026 consumer pattern.

### The privacy/trust problem for a private app — this is the decisive argument
- Photo logging is, almost by construction, **cloud-based**: Lose It's Snap It uploads to AWS S3 (us-west-2) with EXIF/geotag not stripped in 8/20 observed captures, and the policy permits retention "for model training"; no deletion timeline (https://selfhostednutrition.org/privacy/lose-it-snap-it-cloud-photos/).
- The app category sits **outside HIPAA** (a consumer health app is not a covered entity), and the FTC has brought four cases (2021–23) against health apps quietly shipping intimate data to ad/analytics companies (https://fuelnutrition.app/blog/where-your-food-data-goes-ai-nutrition-app-privacy).
- Even "good" policies are hedged: SnapFood sends resized photos to OpenAI/Qwen with no-training-by-default claims; Nourai admits it "cannot confirm" whether DeepSeek trains on API inputs; BiteSense requires acknowledging AI data-sharing before core features work (https://snapfoodapp.com/privacy-policy, https://nourai.app/privacy/, https://bitesense.app/privacy-policy/).
- On-device FOSS photo recognition is not viable yet: a self-hosted experiment on a Pixel 7 with an ~800 MB quantised vision model got ~30% MAPE — far below cloud quality (https://selfhostednutrition.org/privacy/lose-it-snap-it-cloud-photos/).

### Verdict on the REJECTED photo lane
The rejection is **validated, twice over**:
1. **Accuracy**: even in 2026, independent tests show photo apps miss calories by ~⅓ on real meals (https://www.sciencedaily.com/releases/2026/07/260726015237.htm); the "best" figures are either vendor claims without independent replication or benchmark-specific. For a TDEE-driven macro app, ±15–30% per-meal noise on fabricated numbers is worse than no estimate.
2. **Privacy**: photo analysis cannot be done offline at acceptable quality today, and sending meal photos (with EXIF geotags) to a third-party model provider is the single biggest privacy violation possible in a "private, single-user, offline-first" product. The "no fake data" rule and the privacy rule together make the photo lane the wrong hill.

This is also consistent with the SNAPMe research finding that ingredient-from-photo prediction (FB Inverse Cooking, Im2Recipe) is poor (mean F1 0.13–0.23), i.e., the input side (ingredient lists) is itself unreliable (https://pmc.ncbi.nlm.nih.gov/articles/PMC10708545/).

---

## 5. Portion estimation — serving-size methods and accuracy

### The hierarchy of portion methods (from controlled studies)
1. **Weighing (grams) is the gold standard.** Recurring conclusion across every review: gram-based logging is the most reliable; the biggest real-world errors come from eyeballing household units (https://fittechreview.me/how-myfitnesspal-barcode-scanner-fixes-calorie-count-errors/, https://www.amyfoodjournal.com/blog/lose-it-app-review).
2. **Text-based portion descriptions (TB-PSE)** — standard portions ("medium"), household measures, and gram input — beat **image-based portion photo aids (IB-PSE)**: in a 40-participant lunch study, TB-PSE had 0% median error and 31% of estimates within 10% of truth vs 6% and 13% for IB-PSE; single-units (pieces) were the most accurate (95% within 10%) (https://onlinelibrary.wiley.com/doi/10.1111/jhn.12878, https://pmc.ncbi.nlm.nih.gov/articles/PMC9291996/). This is a strong argument for **text/unit-based portion input over photo selection** in a privacy-first app.
3. **Hand comparisons** (fist/palm/thumb/handful) are genuinely useful in free-living: a 1,081-adult, 12,148-meal Japanese weighed-record study found Spearman r = 0.59 (grains) / 0.85 (fruits) / 0.72 (protein) / 0.76 (vegetables) between reported "hands" and actual grams, with small mean bias (−2.5 to −0.3 g/meal) though wide individual limits of agreement (https://pubmed.ncbi.nlm.nih.gov/40669561/, https://www.sciencedirect.com/science/article/pii/S019566632500385X). A 2016 controlled study: the "finger-width ruler" method got 80% of geometric foods within ±25% of true weight vs only 29% for household cups/spoons (https://pmc.ncbi.nlm.nih.gov/articles/PMC4976119/).
4. **Camera/AI volume estimation** is the least reliable: mixed-dish portion error is the unsolved core problem — mixed-dish MAPE is typically 1.5–3× single-item MAPE, driven by ingredient-proportion estimation (the largest error source, 8–22% of MAPE) plus total-volume error; the field's own review concludes mixed-dish estimation "is unlikely to be solved by image analysis alone" (https://dietaryassessmentinitiative.org/publications/mixed-dish-portion-error-2025/). Depth sensing (LiDAR) and reference objects help volume only; VLMs "snap to canonical servings" unless prompted otherwise (https://www.biorxiv.org/content/10.64898/2026.07.26.740845v1.full.pdf). A 2026 atlas vs AI study found a culturally adapted **visual food atlas beat AI** (MAPE 44.8% vs 67.9%); unassisted estimation was worst at 79.4% (https://www.medrxiv.org/content/10.64898/2026.04.16.26351036v1.full.pdf).

### What's worth using for PersonalOS
- Store the **gram reference** per food (FDC foodPortions give this for free, §2) and expose **portionMultiplier × gram-equivalent** as the primary input.
- Offer text/household portion presets (pieces, cups, spoons — each carrying a gram weight) rather than photo-based portion selection: the evidence says text descriptions beat photo aids and are trivially offline (https://onlinelibrary.wiley.com/doi/10.1111/jhn.12878).
- Optionally support hand-comparison presets as rough guides (fist/palm/handful with per-food-group gram estimates) — evidence-backed for group-level accuracy and zero tech cost (https://pubmed.ncbi.nlm.nih.gov/40669561/).
- Explicitly do NOT ship camera/AI portion estimation: it's the least accurate *and* the most privacy-hostile (https://dietaryassessmentinitiative.org/publications/mixed-dish-portion-error-2025/, https://selfhostednutrition.org/privacy/lose-it-snap-it-cloud-photos/).

---

## 6. Data quality — user-submitted vs verified, branded vs generic, and why Cronometer is the gold standard

### The "garbage in garbage out" problem, quantified
- **MFP (user-submitted-default)**: ~20.5M entries, est. ~23% verified, **23.1% of sampled entries >10% off** reference (11.2% error even on packaged/labeled items; 38.4% on restaurant items) — a database 20× bigger than PlateLens's is ~58× worse by error rate (https://nutrition-research-review.com/articles/database-quality-nutrition-apps-2024/). Search "apple" returns 48 entries with materially different values (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/). A 2023 study put duplicates at ~2.7 per common food with calorie gaps up to 40% (https://nutrola.app/en/blog/i-tested-every-barcode-scanner-in-5-calorie-apps-accuracy-results). Evenepoel et al. 2020: MFP is accurate for energy/macros/sugar/fiber vs the Belgian Nubel reference (r≥0.90 after outlier cleaning) but weak for cholesterol/sodium, and needs ~2.8% of extreme values cleaned out (https://doi.org/10.2196/18237). A Filipino validation: poor validity vs local FCT, underestimates energy/carbs/fat (https://doi.org/10.1136/bmjnph-2023-000770). User-submitted DBs also produce the systematic under-reporting that photo apps inherit (https://www.sciencedaily.com/releases/2026/07/260726015237.htm).
- **Cronometer (verified-default)**: 850K–1.2M entries, 98.2% verified, **0.9% error rate** (>10%) (https://nutrition-research-review.com/articles/database-quality-nutrition-apps-2024/); ±5.2% MAPE on weighed reference meals in DAI 2026 — best of non-AI apps; every brand entry traced to a verified source within ±2% in a 200-item audit (https://clinicalnutritionreport.com/reviews/cronometer/). A clinical-app ranking gives Cronometer the highest "evidence grade B" for verified databases (https://clinicalappreport.com/en/rankings/best-calorie-tracker-with-verified-database-2026/).
- The DAI provenance audit (2026): median analytical/verified share of top-5 search results = MFP 40%, Lose It 60%, **Cronometer 80%, MacroFactor 80%**, PlateLens 100%; its three recommendations are (1) per-entry provenance tagging visible to the user, (2) restaurant data from licensed sources not user approximations, (3) published duplication rates (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/).

### Why Cronometer is (rightly) the gold standard
Verified by its own documentation, not just benchmarks (https://support.cronometer.com/hc/en-us/articles/360018239472-Data-Sources, https://cronometer.com/features/accurate-databases.html, https://cronometer.com/blog/accurate-data-tips/):
1. **Analytical anchors**: NCCDB (Univ. of Minnesota; 17k+ entries, 70 nutrients) + USDA (SR28/FDC) + Canadian Nutrient File + Irish/UK/AU/NL databases. Lab-analyzed, not crowd-guessed.
2. **Sandboxed user submissions**: custom foods are private by default; publishing to CRDB (Cronometer Community DB) requires the barcode, front-package photo, and nutrition-label photo, and is reviewed by a human curation team before going public — user entries never contaminate the canonical search. The DAI audit confirms user submissions "appear only in the submitter's account and never contaminate the canonical search" (https://clinicalnutritionreport.com/reviews/cronometer/, https://support.cronometer.com/hc/en-us/articles/360018652672-Publishing-a-food-to-the-CRDB-Database).
3. **Provenance + completeness surfaced to the user**: each entry shows its source (NCCDB/USDA/CRDB/UPC/Nutritionix), a lab-beaker icon for fully-analyzed vs barcode icon for label-only entries, and a **Data Confidence** score that tells you how much of each nutrient total is actually backed by data (https://support.cronometer.com/hc/en-us/articles/360042550452-Data-Confidence-Scores). The "Better Alternative" feature cross-fills missing micros from a similar lab-analyzed food (https://cronometer.com/blog/best-barcode-scanner/).
4. **Restricted submission = fewer duplicates**: one verified entry per common food vs 48 MFP "apple" entries (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/).

### Branded vs generic
- Branded = manufacturer label data (regulated in US/UK/EU for the 14–16 mandatory nutrients; macros always present). Generic = analytical (complete micros, but may differ from a specific package). Best-practice search order: Foundation+SR Legacy (analytical) first, Branded for barcode lookups, Survey (FNDDS) for "as cooked" (https://selfhostednutrition.org/api/usda-foundation-vs-survey-vs-branded/). Cronometer's own guidance says exactly this: use NCCDB/USDA generics when you want full nutrient profiles; use barcode/branded when you want the label's exact numbers (https://cronometer.com/blog/accurate-data-tips/).

### What a privacy-first app should steal
- **No uncurated user submission into the canonical index.** The app is single-user, so "user submissions" = the user's own custom foods/recipes — keep those private and marked as custom, never merged with the seeded analytical DB. That reproduces Cronometer's core architectural choice (verified default, custom sandboxed) at zero curation cost because there is only one user.
- **Provenance tagging**: store and show the source (USDA-FDC generic / OFF community / custom) per entry. Cheap, honest, and it's the field's #1 recommended practice (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/).
- **Filter OFF imports by data-quality flags** (drop rows with data-quality errors, require real energy+protein+carbs+fat values, not the broken "completed" state tag) (https://openfoodfacts.github.io/openfoodfacts-server/dev/ref-perl-pod/ProductOpener/DataQualityFood.html, https://github.com/openfoodfacts/openfoodfacts-server/issues/7061).

---

## 7. Ingredient parsing / recipe math

### The pattern: parse → normalize to grams → multiply nutrient-per-100g → sum
- **Whisk** (a mature recipe platform): parses free-text ingredient lines into `{product, canonicalName, quantity, unit, multiplier, brand, category}` (normalized ingredients), then normalizes every quantity to grams — "1 apple = 182g (USDA)", "1 cup flour = 125g (volume×density)", custom units via average product weight — then multiplies by per-100g nutrient values and sums. They compute 30+ nutrients per recipe, a `coverage` score (0–1) indicating how much of the recipe was analyzable, GI/GL, and a health score. Crucially they use **pre-cooked** nutrient values and do not attempt cooking-loss correction (https://docs.whisk.com/resources/nutrients.md, https://docs.whisk.com/master/api/recipes/get-recipe-nutrition, https://docs.whisk.com/api/recipes). Whisk's NLP ingests >15 GB of recipe data daily (https://docs.whisk.com/readme.md).
- **Eat This Much**: "add ingredients as text, click Parse, review the results, accept matches" — the user is always in the confirmation loop before an ingredient is added; custom recipes must contain basic foods, and custom foods must be entered as calories + macros so the plan generator can do 4/4/9 math (https://blog.eatthismuch.com/eat-this-much-tutorial-5-getting-meals-you-like-part-3-how-to-add-custom-recipes-and-foods/). ETM itself sources from a 6,000-recipe + 1,000,000-food database (https://www.eatthismuch.com/how-it-works/).
- **Open Food Facts** has an ingredient-nutrient estimation pipeline (CIQUAL-based): estimates nutrients from the ingredient list, but only stores them when ≥95% of ingredients match the taxonomy→CIQUAL chain; percent-estimate quality metrics (avg per-ingredient difference ~12.3 on the all-CIQUAL test set) (https://github.com/openfoodfacts/recipe-estimator-metrics, https://github.com/openfoodfacts/openfoodfacts-server/pull/8351).
- **Open-source building block**: the `ingredient-parser` Python package (sequence-labeling model trained on 81k+ sentences) cleanly extracts amount/unit/name/preparation from lines like "3 pounds pork shoulder, cut into 2-inch chunks", flags approximate/range/prepared cases, handles alternative units, and can even resolve to USDA Foundation foods by FDC ID (https://github.com/strangetom/ingredient-parser, https://ingredient-parser.readthedocs.io/en/latest/). A Dart-side equivalent does not appear in the surveyed sources — this is the one area that might warrant a small dependency + DecisionLog if "paste a recipe's ingredients and get macros" is in M3.
- **Nutritionix** is the commercial NLP API the research literature uses for free-text food parsing (1.2M+ items, entity + ingredient + macro extraction) (https://pmc.ncbi.nlm.nih.gov/articles/PMC13089452/).

### Accuracy and caveats
- Recipe-nutrition accuracy is bounded by (a) parse correctness, (b) match to a nutrient entry, (c) **serving-size assumption** (Whisk normalizes missing quantities to defaults like 1 tbsp), and (d) no cooking-loss/water-loss modeling (Whisk explicitly skips it). The SNAPMe study shows even ingredient-from-photo prediction is poor (F1 0.13–0.23), so text parsing (not photo parsing) is the reliable lane (https://pmc.ncbi.nlm.nih.gov/articles/PMC10708545/).
- The human-confirmation loop (Eat This Much's "review + accept matches") is the single most effective accuracy control and the cheapest to ship — for a single user it doubles as a curation mechanism.

### Relevance to PersonalOS recipes
PersonalOS's recipe feature (ingredients → macros → per-serving → portionMultiplier) maps 1:1 onto the Whisk pipeline: parse lines → normalize to grams (reuse FDC foodPortions gram weights) → multiply per-100g macros → divide by servings. The privacy-friendly shape is: **parse + confirm on-device**, store the confirmed recipe, never send the text anywhere. No new-dependency pressure exists if a minimal internal parser (amount/unit/name regex + unit→gram table) is acceptable for M3; a full ML parser would need a DecisionLog entry (AGENTS.md).

---

## 8. GUI layout — the scan flow, search list, food detail, add-to-log (concrete)

### 1. The scan screen
- Full-screen camera feed, auto-detect, torch button, a "Type Barcode" text fallback (Cronometer) (https://cronometer.com/blog/how-to-use-the-barcode-scanner/). Fast apps show a confirming overlay; validation across 2+ identical frames before firing (web packages) (https://pub.dev/documentation/omni_qrcode_barcode_web_reader/latest/).
- Entry point: a floating "+" (Cronometer: tap + → "Scan Food") or a scan icon in the dock (SnapCalorie: one tap from dock) (https://cronometer.com/blog/how-to-use-the-barcode-scanner/, https://caloriappdirectory.com/reviews/snapcalorie-review/).

### 2. Post-scan result / search-result list
- Cronometer: scan → if found, straight to the food entry screen (serving control + Add to Diary); if not found → Custom Food flow (2 photos: front + label) → usable immediately; optional "publish to CRDB" later (https://cronometer.com/blog/how-to-use-the-barcode-scanner/).
- MFP: scan → **entry-selection list** (duplicates) → choose → serving → add; scan rarely lands directly on a single item (https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results).
- Search-result lists (all apps): typed search → grouped results with name + brand + per-serving kcal; duplicates and generic-vs-branded both appear; best-in-class (Cronometer/PlateLens) show a **source/provenance tag** per entry (NCCDB vs CRDB vs UPC) at point of use — the field's recommended pattern (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/).

### 3. Food detail sheet
- Product name + photo + brand; a per-serving nutrition panel (kcal, P/C/F, optionally fiber/sugar/sodium/micros); **serving-size selector** (grams, household units, pieces — each a gram value); Data Confidence / completeness indicator in Cronometer; source label (https://cronometer.com/blog/accurate-data-tips/, https://support.cronometer.com/hc/en-us/articles/360042550452-Data-Confidence-Scores).

### 4. Add-to-log flow
- Select serving → confirm → choose meal slot (breakfast/lunch/dinner/snack) → appears in diary with running totals. Cronometer/Lose It keep this to 2–3 taps post-scan (~8–15 s total scan-to-log) (https://nutrola.app/en/blog/food-tracking-app-comparison-chart-2026, https://www.amyfoodjournal.com/blog/lose-it-app-review).
- Logging-speed research (Appetite 2021): <30 s/meal predicts 78% 6-month retention — every tap you remove from scan→log is an adherence feature (https://www.amyfoodjournal.com/blog/lose-it-app-review).

### 5. SnapCalorie's photo card (the counterfactual that was rejected)
- Photo → 2–3 s processing → a meal card with an editable kcal estimate + macro breakdown + "log" — deliberately no confidence interval, no portion confirmation, one estimate to accept-or-edit (https://caloriappdirectory.com/reviews/snapcalorie-review/). This is the UX that makes photo logging feel fast, and it is exactly the "estimated numbers presented as truth" pattern PersonalOS rejected.

---

## 9. Steal-worthy recommendations for a private offline app

### R1 — Two-layer data source: USDA FDC (analytical, CC0) + filtered OFF (branded, ODbL), both offline-bundled subsets
Why: FDC gives the license-cleanest, gram-anchored, macro-complete generic layer (Foundation ~250 + SR Legacy ~7,800 + FNDDS ~7,000); OFF adds global branded barcode coverage the USDA branded layer lacks for non-US markets. Both have nightly/monthly bulk dumps (OFF 7–8 GB parquet; FDC branded 428 MB zipped) — neither fits in a PWA, but a **curated subset** does (e.g., top-N by category + barcode-lookup pass-through queue later, or SR Legacy+FNDDS for generics + OFF branded filtered by data-quality flags). Source choice guidance: analytical first, branded for barcodes, survey for "as cooked" (https://selfhostednutrition.org/api/usda-foundation-vs-survey-vs-branded/). License hygiene: OFF ODbL attribution in-app; FDC CC0 (https://world.openfoodfacts.org/terms-of-use, https://fdc.nal.usda.gov/).

### R2 — Build the "Cronometer architecture" for a single user: verified canonical DB + sandboxed custom foods
The highest-leverage quality decision is not which DB but **who can write to it**. Cronometer's verified-default + private-custom + curated-public model is the gold standard (98% verified, 0.9% error vs MFP's 23%) (https://clinicalnutritionreport.com/reviews/cronometer/, https://nutrition-research-review.com/articles/database-quality-nutrition-apps-2024/). PersonalOS gets the same effect for free: seed foods come only from FDC/OFF (with provenance tags); the user's own custom foods/recipes live in a separate, clearly-marked private namespace. Never let a "custom" row shadow a canonical row in search.

### R3 — Provenance tagging + completeness/confidence surfacing at point of use
Show the source (USDA generic / OFF community / custom) and whether macro data is complete on every food row and on daily totals. This is the DAI audit's #1 recommendation and Cronometer's Data Confidence feature; it is ~zero cost and directly serves a privacy-first "the numbers are honest" stance (https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/, https://support.cronometer.com/hc/en-us/articles/360042550452-Data-Confidence-Scores).

### R4 — Gram-anchored portion model: portionMultiplier × gram-equivalent, text/household presets, no photo portion estimation
FDC `foodPortions` already ship "1 cup = 125 g" style gram weights; FNDDS adds ~22k portion weights (https://fdc.nal.usda.gov/docs/Download_Field_Descriptions_Oct2020.pdf, https://www.ars.usda.gov/ARSUserFiles/80400530/pdf/fndds/2021_2023_FNDDS_Doc.pdf). Evidence: text-based portion input beats image-based portion aids; hand presets are decent at group level; camera/AI portion is the worst and privacy-poisoned (https://onlinelibrary.wiley.com/doi/10.1111/jhn.12878, https://pubmed.ncbi.nlm.nih.gov/40669561/, https://dietaryassessmentinitiative.org/publications/mixed-dish-portion-error-2025/). So: store gram reference per food, offer unit presets (each carrying grams), and let portionMultiplier do the rest.

### R5 — Ship the recipe lane now with an on-device parse-and-confirm loop
Recipe math is a solved pipeline (Whisk: parse → normalize to grams → per-100g × quantity → sum → /servings) (https://docs.whisk.com/resources/nutrients.md). PersonalOS should mirror it but with the human always confirming parsed lines before save (Eat This Much's accept-matches pattern) (https://blog.eatthismuch.com/eat-this-much-tutorial-5-getting-meals-you-like-part-3-how-to-add-custom-recipes-and-foods/). No photo/cloud step; use FDC gram weights as the normalization table. If an ML ingredient parser is ever wanted, that's a DecisionLog + dependency question, not M3.

### R6 — Keep the barcode lane architecturally ready but gated; use the dependency-free browser path when it lands
ML Kit is mobile-only; on Flutter **web** the native `BarcodeDetector` API is Chrome 134+ (2026, ~94% of Chrome, offline, dependency-free) with zxing-wasm as the Firefox fallback — both are on-device and privacy-safe (https://dev.to/jamiepark-design/building-a-zero-dependency-barcode-scanner-with-the-web-barcode-detection-api-246k, https://pub.dev/documentation/mobile_scanner/latest/). The M3 play: build the branded-product lookup + local-mirror plumbing against OFF/FDC now (so a future scan hits a local DB), and treat the camera UI + package (if any) as the later DecisionLog item. What's lost by waiting: the single highest-retention logging input (barcode = label-accurate, ~±2–5%) and the snap-a-label fallback loop — acceptable to defer for M3 since generics, search, and recipes carry the feature (https://clinicalappreport.com/en/rankings/best-calorie-tracker-with-barcode-scanner-2026/, https://www.amyfoodjournal.com/blog/lose-it-app-review).

### Cross-cutting
- **Reject photo logging permanently for this product**, on both evidence axes: independent 2026 tests show ~⅓ calorie/fat underestimation on real meals, and photo analysis is cloud-bound (EXIF/geotag leaks, model-training retention) — the exact opposite of the privacy contract (https://www.sciencedaily.com/releases/2026/07/260726015237.htm, https://selfhostednutrition.org/privacy/lose-it-snap-it-cloud-photos/).
- **Speed is a feature**: <30 s/meal drives retention; keep scan/search→log to 2–3 taps (https://www.amyfoodjournal.com/blog/lose-it-app-review).

---

## Source index (top URLs cited)
- OpenFoodFacts: https://world.openfoodfacts.org/data · https://world.openfoodfacts.org/terms-of-use · https://openfoodfacts.github.io/openfoodfacts-server/api/ · https://en.wikipedia.org/wiki/Open_Food_Facts · https://huggingface.co/datasets/openfoodfacts/product-database · https://blog.openfoodfacts.org/wp-content/uploads/2025/05/Webinar-Open-Food-Facts-Science.pdf · https://github.com/openfoodfacts/openfoodfacts-exports · https://github.com/openfoodfacts/openfoodfacts-server/issues/7061 · https://openfoodfacts.github.io/openfoodfacts-server/dev/ref-perl-pod/ProductOpener/DataQualityFood.html · https://github.com/openfoodfacts/openfoodfacts-server/issues/8353 · https://traceapps.github.io/docs/nutritrace/off/ · https://www.kaggle.com/datasets/michaelfumery/enopenfoodfactsorgproducts · https://github.com/titsitits/median-food-facts
- USDA FDC: https://fdc.nal.usda.gov/ · https://fdc.nal.usda.gov/api-guide · https://fdc.nal.usda.gov/faq · https://fdc.nal.usda.gov/download-datasets · https://fdc.nal.usda.gov/data-documentation · https://fdc.nal.usda.gov/docs/Download_Field_Descriptions_Oct2020.pdf · https://www.ars.usda.gov/ARSUserFiles/80400530/pdf/fndds/2021_2023_FNDDS_Doc.pdf · https://selfhostednutrition.org/api/usda-foundation-vs-survey-vs-branded/ · https://selfhostednutrition.org/api/usda-fdc-api-getting-started/ · https://selfhostednutrition.org/api/usda-bulk-csv-downloads-postgres/ · https://github.com/MenuLogistics/USDASQLite
- Barcode UX: https://nutrola.app/en/blog/we-scanned-100-barcodes-in-8-calorie-apps-accuracy-results · https://nutrola.app/en/blog/i-tested-every-barcode-scanner-in-5-calorie-apps-accuracy-results · https://cronometer.com/blog/how-to-use-the-barcode-scanner/ · https://fittechreview.me/how-myfitnesspal-barcode-scanner-fixes-calorie-count-errors/ · https://clinicalappreport.com/en/rankings/best-calorie-tracker-with-barcode-scanner-2026/ · https://humanfuelguide.com/en/articles/tools/best-calorie-tracking-apps-with-barcode-scanner-2026 · https://www.amyfoodjournal.com/blog/lose-it-app-review
- Barcode tech: https://developers.google.com/ml-kit/vision/barcode-scanning · https://pub.dev/packages/google_mlkit_barcode_scanning · https://pub.dev/packages/flutter_barcode_scanner_sdk · https://pub.dev/documentation/mobile_scanner/latest/ · https://pub.dev/documentation/omni_qrcode_barcode_web_reader/latest/ · https://dev.to/jamiepark-design/building-a-zero-dependency-barcode-scanner-with-the-web-barcode-detection-api-246k · https://whatpwacando.today/barcode/
- Photo recognition: https://clinicalnutritionreport.com/reviews/foodvisor/ · https://ai-food-tracker.com/reviews/foodvisor/ · https://clinicalappreport.com/en/reviews/foodvisor/ · https://caloriappdirectory.com/reviews/snapcalorie-review/ · https://clinicalnutritionreport.com/compare/cal-ai-vs-snapcalorie/ · https://www.nutrition-research-journal.com/articles/calorie-tracking-accuracy-systematic-review · https://www.sciencedaily.com/releases/2026/07/260726015237.htm · https://pmc.ncbi.nlm.nih.gov/articles/PMC10708545/ · https://www.biorxiv.org/content/10.64898/2026.07.26.740845v1.full.pdf · https://www.tomsguide.com/ai/google-gemini/ · https://developers.googleblog.com/en/calcam-transforming-food-tracking-with-the-gemini-api/
- Portion: https://onlinelibrary.wiley.com/doi/10.1111/jhn.12878 · https://pmc.ncbi.nlm.nih.gov/articles/PMC9291996/ · https://pmc.ncbi.nlm.nih.gov/articles/PMC4976119/ · https://pubmed.ncbi.nlm.nih.gov/40669561/ · https://dietaryassessmentinitiative.org/publications/mixed-dish-portion-error-2025/ · https://www.medrxiv.org/content/10.64898/2026.04.16.26351036v1.full.pdf
- Data quality: https://support.cronometer.com/hc/en-us/articles/360018239472-Data-Sources · https://cronometer.com/blog/accurate-data-tips/ · https://support.cronometer.com/hc/en-us/articles/360042550452-Data-Confidence-Scores · https://cronometer.com/blog/best-barcode-scanner/ · https://clinicalnutritionreport.com/reviews/cronometer/ · https://dietaryassessmentinitiative.org/publications/manual-entry-database-quality-2026/ · https://nutrition-research-review.com/articles/database-quality-nutrition-apps-2024/ · https://doi.org/10.2196/18237 · https://doi.org/10.1136/bmjnph-2023-000770
- Ingredient parsing: https://docs.whisk.com/resources/nutrients.md · https://docs.whisk.com/api/recipes · https://blog.eatthismuch.com/eat-this-much-tutorial-5-getting-meals-you-like-part-3-how-to-add-custom-recipes-and-foods/ · https://github.com/strangetom/ingredient-parser · https://github.com/openfoodfacts/recipe-estimator-metrics · https://pmc.ncbi.nlm.nih.gov/articles/PMC13089452/
- Privacy: https://selfhostednutrition.org/privacy/lose-it-snap-it-cloud-photos/ · https://fuelnutrition.app/blog/where-your-food-data-goes-ai-nutrition-app-privacy · https://snapfoodapp.com/privacy-policy · https://nourai.app/privacy/
