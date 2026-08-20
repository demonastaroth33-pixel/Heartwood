# Integration Audit Report — Stage E (Auditor)

- **Stage:** E — Audit (Auditor), per framework §11 and `.opencode/agent/e-auditor.md`
- **Date:** Thu Aug 20 2026
- **Effort assigned:** MAX
- **Model:** opencode/deepseek-v4-flash
- **Inputs (read in full, contiguous):**
  - `TEMP-PLANNING.md` (repo root, 2,671 lines — read in four contiguous chunks 1–700 / 701–1400 / 1401–2100 / 2101–2671)
  - `docs/IntegrationLedger.md` (284 rows L001–L284 + B1 appendix + Stage C record, 871 lines — read in full)
  - `docs/IntegrationIDCensus.md` (375 enumerated rows, 805 lines — read in full)
  - `docs/IntegrationIntentBrief.md` (177 lines — read in full)
  - `docs/IntegrationSequencingNotes.md` — **note:** the standalone file was folded verbatim into `docs/DevelopmentWorkflow.md` at Stage C (documented at DevelopmentWorkflow.md line 87; commit cb278a8 deleted the standalone artifact). The SequencingNotes input was consumed from DevelopmentWorkflow.md §"Sequencing notes from TEMP-PLANNING.md integration" (S001–S082, read in full).
  - `docs/StructuralImpactProposal.md` (464 lines — read in full)
  - `docs/DecisionLog.md` (D001–D076 + dual-listing notes + open items, 1,014 lines — read in full)
  - All 15 live docs in their final drafted state: Database.md (395), Architecture.md (451), CoachSystem.md (473), Gamification.md (493), UIUX.md (390), Roadmap.md (246), MediaStorage.md (404), DecisionLog.md (1,014), Vision.md (76), README.md (74), Requirements.md (96), DevelopmentWorkflow.md (239), StorageDecision.md (121), StorageSpikeStatus.md (129), StorageSpikeSessionA.md (475; read §1–§5 to confirm non-target status)
  - External frozen inputs: `PersonalOS-Achievements-v2.md` (1,159 lines — read in full + targeted verification of verbatim-critical claims), `TEMP-PLANNING-Achievement-Spec.md` (targeted verification), `TEMP-PLANNING-Achievements.md` (superseded catalog — referenced via ledger)
  - `doc draft framework/TempPlanning-Integration-Framework-v6-final.md` §11 (governing instruction) + §0–§10 context
- **Scope discipline honored:** TEMP-PLANNING.md frozen (not edited); no source/pipeline artifact edited; only this report written. Pipeline state verified on disk before dispatch (Stages A1a→D2 complete; commits 5cf2816..cb278a8).

---

## Part 1 — Item coverage (ledger rows L001–L284)

**Method:** every ledger row was traced to its B1 per-row mapping (ledger appendix lines 531–816), then to the final drafted doc named in that mapping (or its documented resting place per framework: Roadmap "explicitly not in scope" line, DecisionLog open item, or SequencingNotes). Verdicts: ✅ represented · ⚠ partial/marginal · ❌ not represented.

### 1.1 Coverage counts

| Verdict | Count | Rows |
|---|---|---|
| ✅ Fully represented | 274 | (see trace below) |
| ⚠ Partial / marginal (details in §1.3) | 9 | L030, L050, L056, L058, L061, L141, L263, L264 |
| ❌ Not represented | **1** | **L050** |
| **Total** | **284** | L001–L284 |

### 1.2 Row-by-row trace (summary table by row group)

| Rows | Theme | Target doc (B1) | Final-doc representation | Verdict |
|---|---|---|---|---|
| L001–L004 | Health-area entities + event pattern + seeded lookups + macros-first nutrition | Database.md / Architecture.md | Database.md §Health area entities + workouts/nutrition/body tables; Architecture.md event table `workout.completed` | ✅ |
| L005–L006 | Pace placement + bulk/cut pace status | Architecture.md | §Rolling weight, thin data & pace ("no new subsystem", rolling 7–14d avg vs target → ahead/on-track/behind) | ✅ |
| L007 | Formula constants | Architecture.md | §Strength measurement & records — formula constants module, non-togglable | ✅ |
| L008 | Manual structured entry M1; NLP deferred | Roadmap.md | M1 scope ("manual structured entry; real NLP stays out") | ✅ |
| L009, L011 | Workout setups / layering (templates + frozen sessions) | Database.md | §workouts — two-layer model; template copy at save | ✅ |
| L010 | Priority: workout side first | Roadmap.md | M1 scope ("workout side (incl. phases) FIRST, macros after") | ✅ |
| L012–L013 | Muscle tags junction + 2-level hierarchy | Database.md | exercise_muscle_groups / muscle_groups rows | ✅ |
| L014, L020 | est-1RM metric + every-set logging + 1–12 guard | Architecture.md | §Strength measurement & records | ✅ |
| L015, L031, L049, L246, L247 | PR system / vault derived-only / workout.pr Coach-only / strengthSnapshot owner | Architecture.md | §Event Model (workout.pr, negative-XP) + §Strength measurement & records + owner catalog | ✅ |
| L016 | PR XP small / milestone tiers / growth displays centerpiece | Gamification.md | §XP Sources (PR row) | ✅ |
| L017 | Strength profile BIG-5 ratio | Architecture.md | §Strength measurement & records | ✅ |
| L018 | Auto-assort parser | Architecture.md / UIUX.md / Roadmap | Architecture.md §Fitness data entry; UIUX §Session UI; Roadmap M1 ("ships M1-or-M2") | ✅ |
| L019 | Daily logging flow | UIUX.md | §Session UI & Fitness Logging | ✅ |
| L021, L040 | Last-time hint + freshness tiers | UIUX.md / Architecture.md | UIUX §Session UI; Architecture §Fitness data entry | ✅ |
| L022, L024 | Phases + rate↔macros deferred | Database.md | §phases (C2.1) + deferral note | ✅ |
| L023, L026, L078, L079, L082–L088, L120 | Energy math, TDEE, sign convention, deriveMacros, protein g/kg, NU9, NU10, NU11, closures | Architecture.md | §Energy balance & macro derivation (all present: Mifflin, sign, deriveMacros, protein per phase, no-phase fallback, manual freeze, strength burn) | ✅ |
| L025, L027, L051, L162 | Goals extension | Roadmap.md / Database.md | M1 Goals (D048) + Database.md goals row (kind cols) | ✅ |
| L028, L029, L032, L050, L056, L057, L065, L067 | Coach named rules | CoachSystem.md | §Named rules (plan adherence, volume balance, weekly check-in, injury, return ramp, phase close, rest-day) — **except L050, see §1.3** | ⚠ (L050) / ✅ others |
| L030 | Deload markers | Database.md | CoachSystem.md §Named rules deload + deload suggestion; **Database.md entities table has NO `deload_markers` row** (only backup enumeration) | ⚠ |
| L033 | Cardio columns + MET formula | Database.md | §workouts — cardio columns, MET formula verbatim | ✅ |
| L034 | Progressive-overload | Architecture.md | §Strength measurement & records | ✅ |
| L035, L037, L045, L046, L053, L116 | Supersets / addedLoadKg / two-a-day / kg storage / midnight dayKey / routineSlotLogId | Database.md / Architecture.md | Database.md §workouts + exercise_sets; Architecture §Event Model midnight rule | ✅ |
| L036 | O1 template tables | Database.md | workout_templates + workout_template_exercises rows | ✅ |
| L038–L039 | Rolling avg + thin-data RESTATED | Architecture.md | §Rolling weight, thin data & pace | ✅ |
| L041 | Apply session deviation | Database.md | §workouts ("Apply session deviation to template ... folds structure only") | ✅ |
| L042, L095 | Backup enumeration | Database.md | §Backup / Restore Format (JSON + enumeration list verbatim) | ✅ |
| L043–L044, L096 | Sync plane + tombstone | Architecture.md / Roadmap.md / Database.md | Architecture §Entity-sync plane; Roadmap M4; Database sync semantics | ✅ |
| L047 | Drill-down | Architecture.md | §Strength measurement & records | ✅ |
| L048 | Deletion semantics | Architecture.md | §Data Flow step 7 + event model | ✅ |
| L050 | **I4 actionable pace nudges (gap → kcal gap → DIET/ACTIVITY levers)** | CoachSystem.md (B1: "new: pace nudges") | **NOT FOUND in CoachSystem.md or any other doc** — see §1.3 | ❌ |
| L052 | I6 rejected | CoachSystem.md | §MVP Coach "Recorded, never built" | ✅ |
| L054 | I8 skipped | UIUX.md | §Session UI "Recorded, never built" | ✅ |
| L055 | Onboarding | UIUX.md | §Empty & First-Run States | ✅ |
| L058 | N3 warm-up deferred line | Database.md (deferred line) | Not in Database.md; resting place = SequencingNotes S070 (DevelopmentWorkflow.md) | ⚠ (resting place only) |
| L059 | Session comparison | UIUX.md | §Session UI & Fitness Logging | ✅ |
| L060 | N5 deferred | CoachSystem.md | §Named rules "Deferred: recovery readiness (N5)" | ✅ |
| L061 | N6 cueNotes deferred line | Database.md (deferred line) | Not in Database.md; resting place = SequencingNotes S072 | ⚠ (resting place only) |
| L062–L063 | Habits bridge + auto-tick XP | Architecture.md / Database.md / Gamification.md | Architecture §Event Model habits bridge; Database habit_checkins autoCreated; Gamification §Anti-Farming #5 | ✅ |
| L064 | N8 session media deferred | MediaStorage.md | §Open Items ("Session media — SKIPPED for now (N8...)") | ✅ |
| L066 | Goal projection | Roadmap.md | M1 Goal progress section (projection line) | ✅ |
| L068 | F3 declined | DecisionLog.md | D069 (do-not-build list) | ✅ |
| L069 | Template cloning | UIUX.md | §Session UI | ✅ |
| L070 | F5 physique nudge | CoachSystem.md / MediaStorage.md | CoachSystem §Named rules "Physique-photo nudge (F5)"; MediaStorage §Physique-Photo Timeline | ✅ |
| L071 | Copy summary as text | UIUX.md | §Weekly Surfaces | ✅ |
| L072–L076 | Nutrition receipt model, meal types, recipes, backdating, NU4a | Database.md | §Nutrition — receipt-line model (all present) | ✅ |
| L077 | Producers seam | Architecture.md | §Nutrition producers seam | ✅ |
| L080–L081 | NU8 canonical weigh-in + first-of-day deletion | Database.md | §body_metrics — canonical weigh-in rule | ✅ |
| L085, L240, L241 | Macro-gap bar / briefing card / backfill semantics | UIUX.md | §Today — Briefing Card & Daily Log | ✅ |
| L089, L119, L127 | Fully-logged ±10% + no-routine path + deviation reporting | Gamification.md | §Streaks | ✅ |
| L090 | Backfill bound | Database.md | §Nutrition | ✅ |
| L091 | Food macro lookup | Database.md / Architecture.md / DecisionLog | Database nutrition_food_cache; DecisionLog D062 + open item; Architecture producers seam | ✅ |
| L092 | Nutrition check-up | CoachSystem.md | §Outputs & surfaces — Nutrition check-up | ✅ |
| L093, L126 | Quiet meal reminders (on-open, never push) | CoachSystem.md | §Named rules — Quiet meal reminders | ✅ |
| L094 | Zero-XP logging streak | Gamification.md | §Streaks — Zero-XP consistency marker | ✅ |
| L097–L098 | nutrition.logged / body.weighed + revokes | Architecture.md | §Event Model table + cross-domain revoke pattern | ✅ |
| L099, L101, L243 | Weekly-surface consolidation (A4/A6/H2) | CoachSystem.md / UIUX.md | CoachSystem §One weekly surface; UIUX §Weekly Surfaces | ✅ |
| L100 | Physique anchor (A5) | MediaStorage.md | §Physique-Photo Timeline (health+physique tag) | ✅ |
| L102–L107 | Census corrections + 168/178 counts | Gamification.md | §Canonical sources + Census corrections carried | ✅ |
| L108–L113 | routine-A1..A6 | Database.md / UIUX.md | Database §Routine (performed-day, prompt discipline, pack linkage, kinds, binding); UIUX §Today (prompt discipline) | ✅ |
| L114, L121 | week_plans re-purpose + dayTemplateId naming | Database.md | Database week_plans / week_plan_slots rows + §Routine | ✅ |
| L115 | Session pre-load | UIUX.md | §Today — Session pre-load | ✅ |
| L117–L118 | Record modes + strength kcal manual | Architecture.md | §Strength measurement & records; §Energy balance (strength burn manual replaces band) | ✅ |
| L122–L125 | resolve-B re-fire map / Real Progress / On Target / weekly checkpoint | Gamification.md | §Streaks + Shared primitives (Re-fire map) | ✅ |
| L128 | audit-C3 reviewed record | Database.md | §Nutrition reviewed-no-change record | ✅ |
| L129 | Track-this-exercise | UIUX.md | §Session UI | ✅ |
| L130, L266–L267 | Seed list + categories | Database.md | §exercises seeded lookup (verbatim) | ✅ |
| L131 | audit-C6 reviewed | Architecture.md | §Energy balance (strength burn reviewed note) | ✅ |
| L132, L134, L135 | resolve-E1 / E2-sub / E3 | Gamification.md | G5 scan kind; vacation-day union; Perfect Month | ✅ |
| L133 | resolve-E2 knob | UIUX.md | Settings Group 5 (default 14) | ✅ |
| L136, L138 | spec-E0–E13 / E13 span | Gamification.md | §Canonical sources (spec link) | ✅ |
| L137 | E12 one Coach line | CoachSystem.md | §Achievement tie-in | ✅ |
| L139 | Planned-rest event | Architecture.md / Gamification.md / CoachSystem.md | Architecture event table `habit.rest_planned`; Gamification; CoachSystem §Planned rest | ✅ |
| L140 | Account anchor | Gamification.md | §Shared primitives — Account anchor | ✅ |
| L141 | isImported global | Gamification.md | §Anti-Farming #7 + qualifying rules; **schema-level flag columns only on journal_entries in Database.md — see §1.3** | ⚠ |
| L142 | Vlog duration/lifecycle | MediaStorage.md | §Vlog duration & lifecycle | ✅ |
| L143, L160, L181, L182 | Strength seed / rank map / MMA / relative-ratio | Gamification.md | §Strength standards and records (frozen values verbatim) | ✅ |
| L144–L145 | est1RM + rollingWindowMean owners | Architecture.md | §Strength measurement; §Rolling weight (owner catalog) | ✅ |
| L146, L149–L153, L163–L164, L178–L180 | Engine primitives (six-domain, month-day, two-domain, writtenAt, phase-adjacency, rings, Ghost, Turn, meta-streak, anniversary) | Gamification.md / Architecture.md | Gamification §Shared primitives + Ghost; Architecture owner catalog | ✅ |
| L147 | Wrist/ankle deferred | Gamification.md | §Coach tie-in (deferred with door open) | ✅ |
| L148 | Stall rule | CoachSystem.md | §Named rules — stallRule(phase) | ✅ |
| L154 | Today fusion (clash #1) | UIUX.md | §Dashboard (Today section) | ✅ |
| L155 | goal.progress REMOVAL | Roadmap.md / Database.md / Architecture.md | All three docs updated; HTML removal comments left; Roadmap M1 exit criterion rewritten | ✅ |
| L156 | coach_outputs.kind dictionary | Database.md | §coach_outputs kinds — 9-kind dictionary with payload shapes | ✅ |
| L157 | Roadmap ordering (sync before P2.5) | Roadmap.md | Drive Phasing + M4/M5 restructure | ✅ |
| L158 | Privacy stamps | CoachSystem.md / Architecture.md | CoachSystem §Privacy & the never-list; Architecture §Event Model privacy stamp | ✅ |
| L159, L161, L183–L189, L192–L210 | E-clash#1, tonnage, grace, Trimester, M4/M5/M6/M7, G1–G20 | Gamification.md | §Streaks, §Shared primitives, §Cadence and window rules, §Schedule-run rules, §Ghost, §Strength standards | ✅ |
| L166 | Coach achievement tie-in | CoachSystem.md | §Achievement tie-in | ✅ |
| L167 | Weight ladder | Gamification.md | §Streaks (70·75·80·85·90·95·100 verbatim) | ✅ |
| L168, L244 | Derived-only / H3 | Architecture.md | §Layering Rules + owner catalog | ✅ |
| L169 | Dashboard render order | UIUX.md | §Dashboard M2 render order | ✅ |
| L170 | UI/UX ordering deferred | UIUX.md | §Navigation Shell | ✅ |
| L171 | Coach rule-book session | CoachSystem.md | §Scheduling & rule-book session | ✅ |
| L172–L173 | Milestone card + reviews-no-XP | CoachSystem.md / Gamification.md | CoachSystem §Milestone-review card; Gamification HTML removal comment (L173 struck) | ✅ |
| L174 | Phone↔PC parity | Roadmap.md | M2 scope | ✅ |
| L175 | Anti-farm audit | Gamification.md | §Anti-Farming #2/#6 | ✅ |
| L176–L177 | Catalog relationship + DOCS-PASS | Gamification.md | §Canonical sources (three layers + DOCS-PASS rules (a)–(e) verbatim) | ✅ |
| L190 | M2 rule catalog pending | CoachSystem.md | §Scheduling ("written as ONE list at M2 — pending") | ✅ |
| L191 | Sync milestone | Roadmap.md | M4 Entity Sync Plane | ✅ |
| L211–L215, L217, L226 | J1–J6 + J-audit-1 | UIUX.md / Database.md / DecisionLog | UIUX §Journal; Database imported cols; DecisionLog D056 | ✅ |
| L216 | Part-B declined | DecisionLog.md | D069 | ✅ |
| L218–L225 | J7 family | MediaStorage.md / Architecture.md | MediaStorage §PC Videos — "My Videos" (J7a–g all present); Architecture §Shared search matcher | ✅ |
| L227 | Journal XP cap | Gamification.md | §Anti-Farming #2 | ✅ |
| L228–L237 | R1–R10 | Database.md / UIUX.md | Database §Routine; UIUX §Today (week picker/override) | ✅ |
| L238–L239 | R11 + strip window | UIUX.md | §Weekly Surfaces | ✅ |
| L242 | H1 one-tap | UIUX.md | §Today — One-tap daily log | ✅ |
| L245 | H4 reveal-on-first-data | UIUX.md | §Dashboard + §Empty & First-Run States | ✅ |
| L248 | Feature-list closure | Roadmap.md / DecisionLog.md | Roadmap M7 (closed surface); DecisionLog D060 | ✅ |
| L249–L252 | Calendar role/tint/day-view/periods | UIUX.md | §Calendar — Memory Map (all present) | ✅ |
| L253–L262 | Settings principles + Groups 1–8 + NOT-OFFERED | UIUX.md / Database.md | UIUX §Settings (all groups + guardrails); Database §Settings keys | ✅ |
| L263 | Periods model | Database.md | **Database.md entities table has NO `periods` row** — present only in backup enumeration + D075 + UIUX §Calendar period creation | ⚠ |
| L264 | Milestone review | CoachSystem.md | §Milestone-review anniversary (core present); idempotency edge ("never re-mint") only in SequencingNotes S020 | ⚠ |
| L265 | RPE rejected | Database.md | exercise_sets "no RPE column (rejected — L265)"; DecisionLog D069 | ✅ |
| L268 | Nutrition status line | Database.md | §Nutrition status line | ✅ |
| L269 | Life Tree | Roadmap.md / DecisionLog.md | Roadmap M7 Idea park; DecisionLog D071 | ✅ |
| L270 | FUT-1 rejected | DecisionLog.md | D069 | ✅ |
| L271–L274 | FUT-2..5 open questions | DecisionLog.md | D070 (open items) | ✅ |
| L275–L280 | Coach-map named rules / context / never-list / settings | CoachSystem.md | §Named rules, §Context switches, §Privacy & the never-list, §Settings (Group 2 — Coach) | ✅ |
| L281 | Label-qualification legend | DecisionLog.md | D074 | ✅ |
| L282 | Draft schema shapes | DecisionLog.md | D072 (sketch, never decided schema) | ✅ |
| L283–L284 | D-series / S-series refs | DecisionLog.md | D074 (citation discipline) | ✅ |

### 1.3 Marginal and failed rows — detail

1. **❌ L050 (I4 — Actionable pace nudges) — NOT REPRESENTED.**
   Ledger L050 (TEMP 153–159): gap (actual − target kg/wk) → kcal gap (×7700) → DIET lever (−kcal/day) and ACTIVITY lever (+1 cardio session / MET kcal); never "push harder in the gym"; heavily-behind asks recalibration not crash; ahead-in-cut cautious; advisory only, lands in check-in + phase report, no XP, never auto-adjusts phase. B1 mapping: `CoachSystem.md §Full Coach Design (M2+) (new: pace nudges)` — clean-add, D051. **Final CoachSystem.md contains no "pace nudges", no "lever", no "kcal gap", no DIET/ACTIVITY lever content.** The related rule "Pace / bulk lines" (L276) covers only the voice-side lines ("gaining too fast = fat", slow-loss-is-muscle, water-jump line). No other doc (Architecture.md, UIUX.md, Gamification.md, Roadmap.md) carries the I4 lever mechanics either. No documented resting place (not in Roadmap's not-in-scope line, not a DecisionLog open item, not in SequencingNotes). **This is the single genuine drafting miss.** Should have landed in CoachSystem.md §Named rules (as the pace-nudges rule) and/or Architecture.md §Energy balance / pace. Flag for C2 spot-check; recommend a D2-style follow-up edit (or a ledger lock entry per S003 before editing).
2. **⚠ L030 / L056 / L263 — schema rows missing from Database.md entities table.** `deload_markers`, `limitations`, and `periods` are all present in the backup enumeration and D072/D075/D051 decision text and their Coach/UI behavior is drafted (CoachSystem.md deload + injury rules; UIUX period creation), but the Database.md §Logical Schema entities table does not list these three tables (unlike every other new table). They are implied but not defined in the schema section. Marginal-to-moderate; flag for C2.
3. **⚠ L141 — imported-flag schema columns only on journal_entries.** Gamification.md carries the two enforcement arms (global flag; every owner filters internally) fully, and Database.md journal_entries shows `imported` + `importHash`. The schema rows for workouts / nutrition_logs / body_metrics / habits do not show the global `imported` column the lock declares. Enforcement semantics are represented; the schema column surface is incomplete. Flag for C2.
4. **⚠ L058 / L061 (N3 / N6 deferred lines)** — resting place = SequencingNotes S070 / S072 (DevelopmentWorkflow.md). Acceptable per framework ("SequencingNotes" is a documented resting place), but note the B1 mapping intended a Database.md deferred-line note that was not added. Flag for C2 as a judgment call.
5. **⚠ L264 — milestone-review idempotency edge.** Core milestone-review content is fully in CoachSystem.md (anchor, cadence, catch-up, delivery, window, content, phase awareness, tone). The "milestone already generated for this date → never re-mint (idempotent)" and "partial-window rule (3.3)" edge rules exist only in SequencingNotes S020. Resting place acceptable; flag for C2.

---

## Part 2 — Intent fidelity (Intent Brief C1.1–C13.5)

**Method:** every Intent Brief item was checked against the doc(s) the StructuralImpactProposal named for it (proposal §1.1–§1.14 matrix + §2 Coach guide). Verdicts: ✅ faithful · ⚠ partial · ❌ failed.

### 2.1 REMOVALS — all verified applied (framework: "a removal that was silently skipped is a failure")

| REMOVAL | Source rows | Docs affected | Verified in final docs | Verdict |
|---|---|---|---|---|
| `goal.progress` event retired | L155 (clash #2), S014 | Database.md event list; Roadmap M1; Architecture.md diagram | Database.md: HTML removal comment at event list + no goal.progress in seeded list; Architecture.md: "Goal progress is computed, never an event (L155)"; Roadmap M1: "no `goal.progress` event" exit criterion. No doc still lists goal.progress as a live event. | ✅ APPLIED |
| Weekly-review small-XP line struck | L173, S019 | Gamification.md §XP Sources | HTML removal comment "REMOVED (D050 / L173)"; no XP row for reviews; "Reviews give NO XP" in CoachSystem milestone sections | ✅ APPLIED |
| Standalone Coach weekly-review surface retired | L099, L243, S063 | CoachSystem.md | §Outputs & surfaces — "One weekly surface — the merged check-in": "NOT a standalone surface … merge only"; old §3 Reflection Generator "weekly review" output re-scoped | ✅ APPLIED |
| Separate week-recap / nutrition check-up top-level screens not authored | L243, L092, L101 | UIUX.md | §Weekly Surfaces: "NOT separate top-level screens — COMPACT SECTIONS inside the check-in" | ✅ APPLIED |
| Standalone fitness week_plans scheduling retired + re-purpose | L114, L121, S027 | Database.md | week_plans row: "routine-week binder … standalone fitness week_plans scheduling RETIRED (A7)"; week_plan_slots.dayTemplateId named (NOT workoutTemplateId) | ✅ APPLIED |
| Dashboard "Today" fusion (briefing no longer separate top block) | L154, S026 | UIUX.md | §Dashboard: "Today" = briefing + habit ticks + journal quick-capture at top; old order below; M2 render order includes the fusion | ✅ APPLIED |
| P2.5 claim replaced (sync plane first; P2.5 = media blobs only) | L157, S011 | Roadmap.md | Drive Phasing §P2.5 + M4 Entity Sync Plane + M5 Media Blob Sync — old claim explicitly "replaced" | ✅ APPLIED |
| v2 external text removals (duplicate block, calendar-year residue, capture-only Rolling Tape) | L103, L104, L105 | EXTERNAL v2 file | v2 file verified: no duplicate block; "once per anchored yearly window" wording; Rolling Tape = first KEPT vlog (captured OR adopted) | ✅ APPLIED (external edits already applied pre-pass; docs reflect, not re-edit) |

**No REMOVAL was silently skipped. All eight REMOVALS are applied.**

### 2.2 Verbatim-critical rows — exact numbers/names preserved

| Row(s) | Content | Final doc | Verdict |
|---|---|---|---|
| L143 | Strength seed values (bench 0.50/0.75/1.20/1.60/2.00; squat 0.75/1.00/1.65/2.20/2.75; deadlift 1.00/1.25/2.00/2.50/3.00; OHP 0.35/0.50/0.65/0.90/1.20) | Gamification.md §Strength standards | ✅ exact |
| L160 | Rank map (0.50=Beginner … 2.00=Elite; ranks 2/3/4 fire only) | Gamification.md §Rank map | ✅ exact |
| L167 | Weight ladder 70·75·80·85·90·95·100 kg | Gamification.md §Streaks | ✅ exact |
| L266 | Seed exercise list (~44 names) | Database.md §exercises seeded lookup | ✅ exact name-for-name (Push/Legs/Pull/Core/Cardio groups match TEMP 2610–2618) |
| L267 | Categories push\|pull\|legs\|core\|cardio | Database.md exercises row + seed section | ✅ exact |
| L279 | Never-list | CoachSystem.md §The never-list | ✅ all 14 clauses present verbatim-in-spirit |
| L177 | DOCS-PASS rules (a)–(e); 131 ↔ 131 ↔ 47 mapping guard; 178 entries | Gamification.md §Canonical sources | ✅ rules (a)–(e) reproduced; 131 + 47 = 178 stated; mapping guard stated |
| L084 / L086 | deriveMacros owner; calorieTarget = TDEE + (rate × 7700)/7, signed additive | Architecture.md §Energy balance | ✅ formula exact |
| L033 | MET formula `MET × 3.5 × bodyweightKg × minutes / 200`, ×3.5 mandatory | Database.md §workouts | ✅ exact |
| L097 / L098 | Event payload shapes (nutrition.logged: mealType, kcal/macro totals, source, actual eat dateKey; revoke pattern; no per-set noise; ~2k rows/yr) | Architecture.md §Event Model | ✅ exact |
| L042 / L095 | Backup enumeration (all 19 collections) | Database.md §Backup / Restore Format JSON | ✅ all collections present; nutrition_food_cache excluded |
| L079 | Protein g/kg cut 2.0 / bulk 1.8 / maintain 1.6; fat floor 0.6 | Architecture.md / Database.md settings / UIUX Group 4 | ✅ exact |
| L156 | 9-kind coach_outputs dictionary (daily_note, nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal, milestone_review_anniversary, phase_close, pattern_alert) | Database.md §coach_outputs kinds | ✅ all 9 kinds + payload shapes |
| L123 / L124 / L125 / L127 | Real Progress +2.5/+5/+10/+20 kg; On Target ±10% band, clamp 5–15%; weekly checkpoint (closed Sun, thin <5/7); ±10% fully-logged | Gamification.md §Streaks | ✅ exact |
| L143 / L146 / L163 / L164 / L184 / L185 / L187 / L189 | Check-and-fire; one-shot Ghost lookback; empty-week rule; anchored years; qualifyingEntry bars (40-word floor; planned rest never fills; photos fill body); Unprompted body exclusion | Gamification.md | ✅ exact |
| L091 | USDA FoodData Central (core, public domain) + OpenFoodFacts (CC0, optional) | DecisionLog D062 + open items | ✅ exact |
| L086 | Sign convention rate −0.5 = cut, +0.25 = bulk | Architecture.md | ✅ (semantics exact; example values implied) |
| L100 / L070 | Physique anchor = journal entry tagged health+physique (hidden system tag) | MediaStorage.md §Physique-Photo Timeline | ✅ exact |

**No verbatim-critical row was paraphrased in a way that changed a number or name.**

### 2.3 Intent items — per-doc fidelity (all 32 items)

| Item | Named docs | Verdict | Notes |
|---|---|---|---|
| C1.1 | Database.md, Architecture.md | ✅ | entities + event table |
| C1.2 | Database.md | ✅ | exercises/muscle tables + seed verbatim + rpe? struck |
| C1.3 | Database.md, Architecture.md | ✅ | templates/sessions + additive migration |
| C1.4 | Architecture.md, Gamification.md | ✅ | est1RM/strengthSnapshot owners + PR source-of-truth + record modes |
| C1.4b/1.4c | Gamification.md, Architecture.md | ✅ | seed + rank map + formula constants |
| C1.5 | Database.md, Architecture.md | ✅ | cardio cols + TDEE split |
| C2.1 | Database.md, CoachSystem.md | ✅ | phases + phase-close report |
| C2.2 | Architecture.md, CoachSystem.md | ✅ | paceVerdict + thin-data + coach cites owner |
| C2.3 | Architecture.md, Database.md | ✅ | deriveMacros + settings keys |
| C2.4 | Architecture.md, Database.md | ✅ | rollingWindowMean + canonical weigh-in |
| C2.5 | Gamification.md | ✅ | weekly checkpoint + fully-logged + Real Progress + On Target |
| C3.1 | Database.md, Roadmap.md | ✅ | goals.kind + M1 scope |
| C3.2 | Database.md, Roadmap.md, Gamification.md | ✅ | REMOVAL applied (see 2.1) |
| C3.3 | Roadmap.md, CoachSystem.md, Gamification.md | ✅ | projection line + milestone card + XP strike |
| C4.1 | CoachSystem.md | ✅ | wholesale restructure per map §0–§9; own voice; all new headings present (Philosophy, Event-log discipline, Named rules, Outputs & surfaces, Achievement tie-in, Context switches, Privacy & the never-list, Settings (Group 2 — Coach), Scheduling & rule-book session) |
| C4.2 | CoachSystem.md | ⚠ | all named rules present **except the I4 pace-nudges rule (L050)** — see Part 1 ❌ L050 |
| C4.3 | CoachSystem.md, UIUX.md, Database.md | ✅ | outputs/surfaces + one weekly surface + kind dictionary |
| C4.4 | CoachSystem.md, Architecture.md | ✅ | never-list verbatim + stamps |
| C4.5 | UIUX.md, CoachSystem.md | ✅ | Group 2 settings + strictness scales |
| C5.1 | Database.md | ✅ | receipt model + meal types + recipes + NU4a |
| C5.2 | Architecture.md, Database.md | ✅ | producers seam + food cache + dependency flag |
| C5.3 | UIUX.md, CoachSystem.md, Gamification.md | ✅ | macro-gap bar + on-open reminders + zero-XP marker |
| C6.1 | Architecture.md, Database.md | ✅ | auto-track bridge + autoCreated |
| C6.2 | Gamification.md | ✅ | auto-tick real-when-real + negative XP |
| C7.1 | Gamification.md + EXTERNAL | ✅ | three layers, one truth; v2 + spec linked; superseded file noted |
| C7.2 | Gamification.md, Architecture.md | ✅ | pins G1–G20 + owners |
| C7.3 | Gamification.md | ✅ | census corrections carried; 178 cited |
| C7.4 | Gamification.md | ✅ | XP rulings + strike |
| C8.1 | Database.md, UIUX.md | ✅ | day templates + binder + override UI |
| C8.2 | Database.md, Roadmap.md, CoachSystem.md | ✅ | week_plans re-purpose + no scheduler milestone authored |
| C8.3 | Database.md | ✅ | performed-day model + pack linkage + slot statuses |
| C8.4 | UIUX.md | ✅ | briefing card + strip + glance/verdict |
| C9.1 | UIUX.md | ✅ | Today fusion |
| C9.2 | UIUX.md, CoachSystem.md | ✅ | one weekly surface |
| C9.3 | UIUX.md | ✅ | glance + verdict same owner |
| C9.4 | UIUX.md, Architecture.md | ✅ | calendar memory-map + dayActivityScore owner |
| C10.1 | UIUX.md, Database.md | ✅ | settings two-tier + Groups 1–8 + not-offered + keys |
| C11.1 | UIUX.md, Database.md, MediaStorage.md, Architecture.md | ✅ | J1–J7 + imports + search matcher + dependency flags |
| C11.2 | MediaStorage.md, Database.md, Architecture.md | ✅ | vlog lifecycle + durationSec + delete tiers |
| C11.3 | MediaStorage.md, CoachSystem.md | ✅ | A5 anchor + F5 nudge |
| C12.1 | Architecture.md, Roadmap.md, Database.md | ✅ | sync plane + milestone + semantics |
| C12.2 | Database.md, Architecture.md | ✅ | backup enumeration + metadata events |
| C13.1 | ALL | ✅ | process rule honored (docs rewritten to ledger; qualified labels used throughout) |
| C13.2 | Roadmap.md, DecisionLog.md | ✅ | closure note + D060 |
| C13.3 | Database.md, Roadmap.md, DecisionLog.md | ✅ | draft rows gated; D071/D070/D072 verdicts recorded |
| C13.4 | Database.md | ✅ | kind dictionary |
| C13.5 | Architecture.md | ✅ | owner catalog emitted (20 owners + dayActivityScore + tintLevelFor) |
| C14.1/14.2 | UIUX.md, Architecture.md | ✅ | session UI + onboarding + auto-assort + freshness tiers |

### 2.4 High-risk items (§4 of the Intent Brief)

| High-risk item | Verified |
|---|---|
| 1. Pending-approval + draft rows gated on Stage C | ✅ Stage C record in ledger appendix (C.1 ballot) — L001–L010 APPROVED; L269/L271–L274/L282 as recommended; only approved content drafted |
| 2. Removal rows not silently dropped | ✅ all eight verified (2.1) |
| 3. Coach-map citation integrity (26 ⚠ of 41) | ✅ B2 §2.3 rule honored: docs cite ledger row IDs (L-###), never map line numbers; no doc quotes map pointers as evidence. Cross-checked in Part 5 |
| 4. External-file drift (131/131/47; 178) | ✅ Gamification.md states 131 + 47 = 178; mapping guard; v2/spec linked as live; merged-canonical draft NOT created |
| 5. Dependency entries needed before build | ✅ DecisionLog "Open items — build-time dependency decisions required": J5 PDF, NU13 USDA FDC + OpenFoodFacts, J7g auto-adopt — all recorded |
| 6. Label-collision discipline | ✅ docs consistently qualify families (backup-A, census-A, routine-A, audit-B, resolve-B, audit-C, resolve-E, spec-E); D074 recorded; "D5" alias handled (L283/L218) |
| 7. E-clash #2 gap | ✅ never invented; Gamification.md §Cadence and window rules explicitly documents the gap; D068 records it |
| 8. Storage lock pending | ✅ D040 locked; schema prose logical/backend-neutral (Database.md §Sync semantics "logical-only, backend-neutral"; MediaStorage J7f "no IndexedDB/Drift assumption") |

---

## Part 3 — Dependency integrity (cross-doc consistency)

**Method:** each documented dependency chain (intent brief §2.5 + proposal §3 XD-1..XD-14) checked for consistent naming and continued existence of referenced surfaces, event types, milestones, and decisions.

### 3.1 Documented dependency chains

| Chain | Producer → Consumer | Verified |
|---|---|---|
| Achievements → events | Gamification reads event log only; `achievement.unlocked` / `level.reached` named identically in Gamification.md and CoachSystem.md; event kinds (workout.completed, nutrition.logged, body.weighed, revokes) named identically in Architecture.md, Database.md, CoachSystem.md | ✅ consistent |
| Coach lines → owners | CoachSystem.md cites Architecture.md owner catalog (paceVerdict, deriveMacros, strengthSnapshot, dayActivityScore); "a trophy and its Coach line are literally the same number (L168)" appears in both CoachSystem.md and Gamification.md | ✅ consistent |
| Routine → check-in | UIUX.md briefing card references Database.md §Routine; R11 strip references `adherenceWeek()` owner in Architecture.md; week picker references Settings Group 1 (WEEK STARTS ON) | ✅ consistent |
| Sync → events | Roadmap M4, Architecture.md §Entity-sync plane, Database.md §Sync semantics all state the same D019 mechanism (append-only UNION, LWW by timestamp, deviceId tie-break, tombstone wins) | ✅ consistent |
| Surfaces → owners | UIUX.md names dayActivityScore, adherenceWeek, deriveMacros, goalProgress, strengthSnapshot — all present in Architecture.md owner catalog | ✅ consistent |

### 3.2 Event-type naming consistency

- `workout.completed`, `workout.pr`, `workout.deleted`, `habit.completed_revoked`, `habit.rest_planned`, `nutrition.logged`, `nutrition.removed`, `body.weighed`, `body.weighed_revoked`, `vlog.deleted` — named identically across Architecture.md event table, Database.md event list/sync-semantics, CoachSystem.md event-log section, Gamification.md. ✅
- `check_in_weekly` replaced the "weekly review" label in Database.md kind dictionary; CoachSystem.md and Roadmap.md use "merged weekly check-in / merged weekly review (a section of it)"; no doc still presents the standalone weekly-review screen as a surface. ✅ (One residue: Architecture.md §Data Flow step 4 says "dashboard note / weekly review" — see 3.3 finding D-4.)

### 3.3 Findings (cross-doc inconsistencies / dangling references)

1. **⚠ Milestone renumber ripple incomplete (B2 §7.3 duty not fully executed).** The sync-plane insertion renumbered the graph view to **Milestone 8** (Roadmap.md "## Milestone 8 — Graph/"Brain" View"). But two docs still cite "Roadmap.md Milestone 7" for the graph view:
   - `DecisionLog.md` D023 line 185: "Revisit: at milestone start, post-M1 (see Roadmap.md Milestone 7)."
   - `Database.md` line 48: "for the graph/"brain" view — DecisionLog D023, Roadmap.md Milestone 7 (under consideration)."
   B2 §7.3 explicitly listed "D023 + Database.md event-log refs + README milestone list" as the cascade duty for this insertion. **D023 and Database.md were not updated.** Also `README.md` line 57 still says "Milestones M0–M6" (the current roadmap spans M0–M8). These are dangling references to a milestone number another doc no longer contains. **Stage F should fix; flag for C2.**
2. **⚠ Architecture.md §Storage Backend (lines 424–427) still says "OPEN — deferred to the M0 spike … Must be locked before M1."** StorageDecision.md and DecisionLog D040 lock Drift + SQLite (WASM) as of 2026-08-11. This section contradicts the lock record. The D1 pass added a D040 note in Database.md §Live Database Corruption Recovery but did not touch Architecture.md's parallel section. Pre-existing staleness, but Architecture.md was a drafting target and the docs now internally disagree on a *decision*. **Stage F should align; flag for C2.**
3. **⚠ Database.md seeded event list is a subset of Architecture.md's event model.** Database.md's "Event types seeded in MVP" lists workout.completed but not workout.pr / workout.deleted / habit.completed_revoked / habit.rest_planned / nutrition.logged / nutrition.removed / body.weighed / body.weighed_revoked, even though its own sync-semantics paragraph references `workout.deleted` (line 282). Naming is consistent everywhere (Architecture.md holds the canonical full table), so this is an enumeration-completeness issue, not a naming conflict. **Flag for C2 / Stage F alignment.**
4. **⚠ Architecture.md §Data Flow step 4 (line 315): "dashboard note / weekly review"** — a residue of the old standalone weekly-review naming. Mild; CoachSystem.md already defines the merged surface. **Stage F terminology normalization; flag for C2.**
5. **⚠ UIUX.md §Journal "Quiet week" routes to CoachSystem.md §Context switches ✓; UIUX Group 2 weekly-window rule routes to CoachSystem.md §Settings ✓** — these are consistent (verified, not findings). No action.

No doc references a surface, event type, milestone, or decision that another doc *names differently*. The two real cross-doc inconsistencies are findings D-1 (milestone numbering) and D-2 (storage decision state), both of which are *stale-state* mismatches rather than naming conflicts.

---

## Part 4 — ID census coverage (AUTHORITATIVE census gate — consumed by Stage G Part A)

**Method:** every one of the census's 375 enumerated rows was traced census-ID → ledger row(s) (Source IDs) → final doc. The ledger's own census-reconciliation section (lines 299–409) was re-verified row-by-row against the final docs (not just trusted). Unreconciled IDs are listed with reasons.

### 4.1 Family-by-family trace (375 rows)

| Census family | Rows | Ledger host row(s) | Final-doc trace | Verdict |
|---|---|---|---|---|
| Plain items 1–37 | 37 | L001–L038 (+ folds: item 10→L018, item 11→L014) | Database.md / Architecture.md / UIUX.md / Roadmap.md / Gamification.md / CoachSystem.md | ✅ all trace |
| O-series (O1–O8 + O6-ADD-ON) | 9 | L036–L046 | Database.md / Architecture.md / Roadmap.md | ✅ all trace |
| I-series (I1–I9) | 9 | L047–L055 | Architecture.md / CoachSystem.md / UIUX.md / Roadmap.md / UIUX | ✅ 8 trace; **I4 → L050 → not drafted (Part 1 ❌)** — see 4.3 |
| N-series (N1–N9 + N7-sub) | 10 | L056–L064 | Database.md / CoachSystem.md / Architecture.md / Gamification.md / MediaStorage.md | ✅ all trace (N3/N6 via SequencingNotes resting place) |
| F-series (F1–F6) | 6 | L066–L071 | Roadmap.md / CoachSystem.md / DecisionLog.md / UIUX.md / MediaStorage.md | ✅ all trace |
| NU-series (NU1–NU13 + NU4a + add-ons + closures) | 24 | L072–L094 (CLOSURE(2)→L038) | Database.md / Architecture.md / UIUX.md / Gamification.md / CoachSystem.md | ✅ all trace |
| backup-A1–A6 | 6 | L095–L101 | Database.md / Architecture.md / CoachSystem.md / MediaStorage.md / UIUX.md | ✅ all trace |
| census-A1–A4 (+2 context rows) | 6 | L102–L107 | Gamification.md + EXTERNAL v2 | ✅ all trace |
| routine-A1–A7 (+2 sub-rows) | 9 | L108–L116 | Database.md / UIUX.md | ✅ all trace |
| audit-B1–B4 (+B5 summary) | 5 | L117–L121 | Architecture.md / Gamification.md / Database.md | ✅ all trace |
| resolve-B1–B5 | 5 | L122–L125 (+L102) | Gamification.md | ✅ all trace |
| audit-C1–C6 | 6 | L126–L131 | CoachSystem.md / Gamification.md / Database.md / UIUX.md / Architecture.md | ✅ all trace |
| resolve-E1–E3 (+E2-sub) | 4 | L132–L135 | Gamification.md / UIUX.md | ✅ all trace |
| spec-E0–E13 (nominal 14) | 14 | L136, L138 (E1–E11 span members) | Gamification.md §Canonical sources | ✅ all trace (span members by definition) |
| TENSION 1–15 | 15 | L139–L153 | Architecture.md / Gamification.md / CoachSystem.md / MediaStorage.md | ✅ all trace |
| clash #1–6 | 6 | L154–L158, L063 | UIUX.md / Roadmap.md / Database.md / Gamification.md / CoachSystem.md / Architecture.md | ✅ all trace |
| audit E-clash 1–5 | 5 | L159, L160, L161, L134 (+#2 gap) | Gamification.md (+ DecisionLog D068) | ✅ 4 trace; #2 documented gap — see 4.2 |
| M0–M7 blocks | 46 | L100, L062, L155, L156, L162–L191 (each reconciled) | Architecture.md / Gamification.md / CoachSystem.md / UIUX.md / Roadmap.md / Database.md | ✅ all trace |
| G1–G20 + G7b | 21 | L192–L210 | Gamification.md §Cadence and window rules | ✅ all trace (G14/G15 co-labeled L205) |
| J1–J7 + J7a–g + J-audit + declined | 22 | L211–L227, L216 | UIUX.md / Database.md / MediaStorage.md / Architecture.md / DecisionLog.md | ✅ all trace |
| R1–R12 (+2 sub-rows) | 14 | L228–L241 | Database.md / UIUX.md | ✅ all trace |
| H1–H4 | 4 | L242–L245 | UIUX.md / Architecture.md | ✅ all trace |
| [x] Remaining Open Items | 5 | L265–L269 | Database.md / DecisionLog.md / Roadmap.md | ✅ all trace |
| Future Ideas | 5 | L270–L274 | DecisionLog.md (D069/D070) | ✅ all trace |
| Coach-map named rules | 12 | L148, L028, L029, L030, L067, L056, L057, L275, L276, L277, L060, L278/L279/L280 (index rows) | CoachSystem.md | ✅ all trace (L030 schema half — see Part 1 ⚠) |
| Audit-item cross-reference labels | 40 | host rows per ledger cross-ref table (341–382) | verified per host row | ✅ all trace |
| Referenced external families (D-series 14, S-series 13, P2.5, v2, spec) | 30 | L283, L284, L157, L176, L136 | DecisionLog.md / Roadmap.md / Gamification.md | ✅ all trace (D040 now exists; all D-series resolve) |
| **Total** | **375** | — | — | **369 clean trace; 6 documented caveats (below)** |

### 4.2 Unreconciled census IDs — list with reasons

The authoritative unreconciled list is **empty of drafting failures**, with six documented caveats (each has a ledger reason and a doc-side resting place):

1. **E-clash #2 — GAP, never labeled.** Census row exists (family table row with no source lines). Ledger 386–391: "no row can be written for a fact that does not exist … do not invent." Gamification.md §Cadence and window rules + DecisionLog D068 document the gap explicitly. **Status: reconciled-as-gap (intentional; standing rule "E-clash #2 (never invent)" honored).**
2. **G7 (plain) — absent by design.** Only G7b exists (TEMP 1703). Gamification.md G7b guardrail documents "The plain 'G7' label never appears in the source." **Status: reconciled (documented absence).**
3. **Coach-map author `ledger:NNN` citations (41 pointers, 26 ⚠ off-target).** These are citation artifacts, not census IDs against rows; census appendix + ledger Track-2 #3 record the flags; B2 §2.3 mandated re-anchoring; docs cite row IDs, never map pointers. **Status: reconciled-as-artifacts; claim-level representation verified in Part 5 (0 ❌).**
4. **"audit-C1"/"audit-C2" label reuse in the Journal section** (J2 perf note, J1 leap-day) — label collisions recorded in L211/L212 process notes; D074 mandates qualification; docs use qualified phrasing. **Status: reconciled (documented collision).**
5. **backup-A3 / routine "event-A3" physical-block sharing** (TEMP 534–561) — one block, two family lenses; recorded in L097 process note; docs carry the events once (Architecture.md). **Status: reconciled.**
6. **Item 25 vs closure (5) ±20% language** — superseded by audit-C2 ±10%; both line ranges cited (L023, L089); Gamification.md §Streaks documents the supersession. **Status: reconciled.**

### 4.3 Census findings

- **Census I4 → ledger L050 → final docs: NOT REPRESENTED.** This is the only census ID whose ledger host row fails to reach the docs (same finding as Part 1 ❌ L050). It is a genuine census→ledger→docs chain break and must be fixed before Stage G can clear (or recorded as an accepted gap with a DecisionLog entry). **Flag for C2 as the top-priority item.**
- **Census N3 (L058) / N6 (L061) / L264 edge rules** — trace through SequencingNotes resting places (S070/S072/S020). Acceptable per framework but flagged for C2 judgment.

**Gate statement for Stage G Part A:** E's Part 4 is present and complete. The unreconciled list contains **zero unreconciled census IDs other than the six documented caveats above**, but **Part 4 does NOT clear the gate yet because of L050** — one census ID (I4) traces to a ledger row (L050) that has no doc representation and no documented resting place. Stage G Part A should treat the list as "one open item (L050/I4)" until resolved; everything else reconciles.

> **Closure note (Stage G, 2026-08-20):** the sole census blocker above is
> RESOLVED — L050/I4 was drafted post-audit in the E audit-fix pass (same
> commit, 17e5def) as CoachSystem.md §Named rules — "Pace nudges (I4)"
> (lines 321–332): gap → kcal gap (×7700) → DIET/ACTIVITY levers; never
> "push harder in the gym"; recalibration not crash; ahead-in-cut cautious;
> advisory only, check-in + phase report, no XP, never auto-adjusts phase;
> cited L050. Stage G Part A re-verified the section against ledger L050
> (IntegrationLedger.md line 61) and the B1 mapping (line 582) and clears
> the census gate: the unreconciled list is now exactly the six documented
> caveats in §4.2, all reconciled-as-documented. No other census ID became
> newly unreconciled in the E-fix/F passes (verified against commits
> 17e5def and 087b372).

---

## Part 5 — Self-citation cross-check (Coach Consolidated Map `ledger:NNN` citations vs final CoachSystem.md)

**Method:** re-read TEMP-PLANNING.md lines 2439–2597 (COACH SYSTEM — CONSOLIDATED FUNCTIONALITY MAP) directly; extracted every `ledger:NNN` citation (44 pointer instances across the ten map sections, incl. the two cross-file pointers `spec:632` and `v2:405`); mapped each citation to the claim it supports; checked the claim against the final CoachSystem.md (and, where the map itself pointed elsewhere — §4's UIUX-facing outputs — against UIUX.md/Architecture.md as the mapped homes). The known line-range staleness of 26 of 41 map pointers (census appendix verdicts) is recorded separately: **line-range accuracy of the pointer is NOT the test here — claim representation is.** A stale pointer with a represented claim = ✅ (stale source citation, noted, not a drafting failure); a missing claim = ❌ ORPHANED-CITATION (then classified ledger-miss vs stale-source).

### 5.1 Citation-by-citation verdicts

| # | Map § | Author citation | Claim it supports | Final-doc representation | Verdict |
|---|---|---|---|---|---|
| 1 | §1 | ledger:20-23 | Pace math stays in Analytics→Rule→Reflection; no new subsystem | CoachSystem.md §Architecture "Pace computation follows the same separation of concerns with no new subsystem (L005)" | ✅ REPRESENTED |
| 2 | §2 | ledger:300, 469, 502, 525-544 | Event log = single behavior history; Coach+Gamification read the log only; compensating revokes | CoachSystem.md §Event-log discipline ("The event log is the single behavior history … read the event log only … revoke events stay transactional") | ✅ REPRESENTED |
| 3 | §2 | ledger:547 | ~10k events/yr engine budget | CoachSystem.md §Event-log discipline "Budget: ~10k events/yr is the ceiling" | ✅ REPRESENTED |
| 4 | §2 | ledger:379-380, 128-133 | workout.pr is Coach/toast ONLY, never vault truth | CoachSystem.md §Event-log discipline "workout.pr … never the source of truth for vaults or achievements; those re-derive by walking sessions (L246)" | ✅ REPRESENTED |
| 5 | §2 | ledger:841-845 | One H3 owner per stat; trophy and Coach line are the same number | CoachSystem.md §Architecture "a trophy and its Coach line are literally the same number … rounding happens once (L168)" | ✅ REPRESENTED |
| 6 | §3 | ledger:1022-1033; spec:632 | stallRule(phase) — shared vocabulary; 4 deltas; recovery 2; no scold | CoachSystem.md §Named rules — `stallRule(phase)` (full rule, verbatim semantics) | ✅ REPRESENTED |
| 7 | §3 | ledger:358-363 | Plan-adherence per-slot %; done-differently; pattern vs single miss; deload exempt | CoachSystem.md §Named rules — Plan adherence | ✅ REPRESENTED |
| 8 | §3 | ledger:364-368 | Volume balance; floors; imbalance checks; advisory only | CoachSystem.md §Named rules — Volume balance | ✅ REPRESENTED |
| 9 | §3 | ledger:182-187 | Rest-day pattern detection (F2) | CoachSystem.md §Named rules — Rest-day pattern detection | ✅ REPRESENTED |
| 10 | §3 | ledger:435-439 | Reasonable failure / limited-not-lazy (N1) | CoachSystem.md §Named rules — Injury / limitation | ✅ REPRESENTED |
| 11 | §3 | ledger:440-445 | Post-deload/return ramp 90→95→100% | CoachSystem.md §Named rules — Post-deload return ramp | ✅ REPRESENTED |
| 12 | §3 | ledger:374 | Deload suggestion after sustained low adherence | CoachSystem.md §Named rules — Deload suggestion | ✅ REPRESENTED |
| 13 | §3 | ledger:1990-1991 | Journal drought: 7 days → nudge; every poke through the rule pipeline | CoachSystem.md §Named rules — Journal drought | ✅ REPRESENTED |
| 14 | §3 | ledger:55-58, 606-608 | Pace/bulk lines (gaining-too-fast; slow-loss-is-muscle; water-jump) | CoachSystem.md §Named rules — Pace / bulk lines | ✅ REPRESENTED |
| 15 | §3 | ledger:1739-1741 | Missed-habit warnings live in Coach reflection, never tint | CoachSystem.md §Named rules — Missed-habit warnings | ✅ REPRESENTED |
| 16 | §3 | ledger:454-455 | Deferred: recovery readiness (N5) | CoachSystem.md §Named rules — Deferred: recovery readiness (N5) | ✅ REPRESENTED |
| 17 | §4 | ledger:1763-1764 | Daily dashboard note + quiet day-view Coach line | CoachSystem.md §MVP Coach (example line "Three days without {habit} — what's in the way?") + UIUX.md §Calendar day view ("Coach outputs render as a quiet line under the day's events") + Settings Group 2 (Coach notes in day view, default on) | ✅ REPRESENTED |
| 18 | §4 | ledger:1794 | Coach notes in calendar day view (default on) | CoachSystem.md §Settings (Group 2 — Coach) "Coach notes in the calendar day view — default on (L255)" | ✅ REPRESENTED |
| 19 | §4 | ledger:648-666 | Nudges; on-app-open only; never push; non-naggy | CoachSystem.md §Philosophy ("On-open delivery, never push") + §Named rules — Quiet meal reminders | ✅ REPRESENTED |
| 20 | §4 | ledger:2243-2253 | Weekly review (A4) = one Sunday surface; Coach section on top, fitness/nutrition below | CoachSystem.md §Outputs & surfaces — "One weekly surface — the merged check-in" | ✅ REPRESENTED |
| 21 | §4 | ledger:646-648 | Weekly nutrition check-up mirrors check-in | CoachSystem.md §Outputs & surfaces — Nutrition check-up | ✅ REPRESENTED |
| 22 | §4 | ledger:2264-2273 | R11 strip = glance, A4 = verdict | CoachSystem.md "The dashboard's glance strip (R11) is exactly that: a glance; the verdict lives here (L101)" | ✅ REPRESENTED |
| 23 | §4 | ledger:484-490 | Phase close report (trend, pace, sessions, adherence, volume, PRs, achievements, goal pace + one line) | CoachSystem.md §Outputs & surfaces — Phase-close report | ✅ REPRESENTED |
| 24 | §4 | ledger:875-880, 1881-1897 | Milestone review card at goal end only; cadence ladder +1m/3m/6m/1y | CoachSystem.md §Milestone-review card + §Milestone-review anniversary (cadence ladder verbatim) | ✅ REPRESENTED |
| 25 | §4 | ledger:1043 | Phase-transition line shares the ONE phase-adjacency helper | Architecture.md owner catalog has `phaseAdjacency` (L151); Gamification.md "The Turn" uses it. **CoachSystem.md has no explicit phase-transition line.** The shared-helper fact is represented; the specific Coach surface is not drafted | ⚠ REPRESENTED-PARTIAL — flag for C2 |
| 26 | §5 | ledger:813-824 | Coach reacts to achievement.unlocked / level.reached; never creates, never grants XP | CoachSystem.md §Achievement tie-in (full) | ✅ REPRESENTED |
| 27 | §5 | ledger:1328, 1364 | Celebrations fire once per run/landing; never repeat congrats; one line max | CoachSystem.md §Achievement tie-in ("One Coach line AT MOST per trophy fire; celebrations never repeat congrats (L137)") | ✅ REPRESENTED |
| 28 | §5 | (map text) 1075 | Coach's ONE line only when Ouroboros lands or its run ends | The general rule is represented (Ring/Grove get one sincere line; celebrations fire once). The specific Ouroboros one-line moment is not drafted anywhere | ⚠ REPRESENTED-PARTIAL — flag for C2 |
| 29 | §5 | ledger:914-916 | Coach never judges XP/points; trophies ZERO XP | CoachSystem.md §Achievement tie-in + §Philosophy ("never grants or withholds XP"); Gamification.md "Achievements grant ZERO XP" | ✅ REPRESENTED |
| 30 | §5 | ledger:1465-1470; v2:405 | Elite tier = Coach-observable ceiling, ZERO trophies read it | Gamification.md §Schedule-run rules — Elite tier (verbatim) | ✅ REPRESENTED (mapped to Gamification.md, its home) |
| 31 | §6 | ledger:1976-1992 | J4 quiet week: user-started only; streaks stay real; quiet ≠ shield | CoachSystem.md §Context switches — Quiet week (J4) | ✅ REPRESENTED |
| 32 | §6 | ledger:1873-1874 | Vacation/period quiets adherence like a deload — "vacation, not laziness" | CoachSystem.md §Context switches — Vacation / period | ✅ REPRESENTED |
| 33 | §6 | ledger:369-372 | Deload ranges: adherence quiet, volume-balance exempt, chart shaded | CoachSystem.md §Context switches — Deload ranges | ✅ REPRESENTED |
| 34 | §6 | ledger:955-962 | Planned-rest parsing: real-rest vs quiet-miss vs grace; rest only prevents resets | CoachSystem.md §Context switches — Planned rest | ✅ REPRESENTED |
| 35 | §7 | ledger:820-822 | Facts-only by default; never quotes journal text | CoachSystem.md §Privacy & the never-list (never-list first bullet) | ✅ REPRESENTED |
| 36 | §7 | ledger:1679-1687 | Every Coach/journal-reading feature stamped; mood/topics behind M2+ text-analysis opt-in | CoachSystem.md §Privacy & the never-list (stamp paragraph + "content is only read if the user opts into text analysis (M2+)") | ✅ REPRESENTED |
| 37 | §7 | ledger:2030 | Coach never inspects media/video content | CoachSystem.md never-list ("The Coach never inspects media/video content") | ✅ REPRESENTED |
| 38 | §7 | ledger:1952 | Coach gets NO journal text | CoachSystem.md never-list ("The Coach gets NO journal text") | ✅ REPRESENTED |
| 39 | §7 | ledger:1998 | J5 Year Book = pure artifact; no Coach lines in it | CoachSystem.md never-list ("Coach lines in the Year Book export (J5 — pure artifact)") | ✅ REPRESENTED |
| 40 | §8 | ledger:1894-1896 | Milestone-review cadence editable (enable/disable or flat interval) | CoachSystem.md §Settings — "Milestone-review cadence — editable ladder … enable/disable … or a flat interval" | ✅ REPRESENTED |
| 41 | §8 | ledger:1977 | Quiet-week range | CoachSystem.md §Settings — "Quiet-week range — user-started date range" | ✅ REPRESENTED |
| 42 | §8 | ledger:1834-1840 | NOT offered as toggles: XP/achievement values, formulas, dayActivityScore weights | CoachSystem.md §Settings — "NOT offered as toggles (L280)" | ✅ REPRESENTED |
| 43 | §9 | ledger:864-868 | Rule-book session AFTER features, BEFORE UI/UX ordering pass | CoachSystem.md §Scheduling — "scheduled AFTER all features are planned and BEFORE the UI/UX ordering pass" | ✅ REPRESENTED |
| 44 | §9 | ledger:869-874 | Carry-over locks (facts-only, loudness tiers, J4, no-shame, reviews-no-XP, auto-written, on-open never push, no-human-judgment voice) | CoachSystem.md §Scheduling — full carry-over lock list | ✅ REPRESENTED |
| — | §4 (self) | ledger:2443 (spec E12 self-cite) | One Coach line at most per trophy fire (E12) | CoachSystem.md §Achievement tie-in (L137) | ✅ REPRESENTED (E12 lock carried) |

### 5.2 Part 5 tally

| Verdict | Count |
|---|---|
| ✅ REPRESENTED | 42 |
| ⚠ REPRESENTED-PARTIAL (claim's core represented; specific Coach detail thin) | 2 (#25 phase-transition line; #28 Ouroboros one-line) |
| ❌ ORPHANED-CITATION | **0** |

### 5.3 Distinguishing ledger-miss vs stale-source-citation

- **0 ❌ ORPHANED-CITATION entries.** Every claim the Coach map's citations support is represented in the final docs. None of the 44 citations traces to a Coach capability with no doc reflection.
- The map's **line-range pointers are largely stale** (census appendix: 26 of 41 ⚠ off-target; e.g. `ledger:1022-1033` is stallRule but that range is Account Anchor in the real ledger; `ledger:874` etc.). This is a **stale-self-citation property of TEMP-PLANNING.md itself** — worth noting for the archive, **not** a drafting failure. The docs pass correctly re-anchored every citation to ledger row IDs (Part 2.4 item 3).
- The two ⚠ PARTIAL cases are **drafting-detail omissions, not ledger misses**: the ledger (L151, L152/L166, L137) carried the underlying rules, and the docs carry the general rules; only the fine-grained Coach surfaces ("phase-transition line", "Ouroboros lands/ends one-line") were not separately authored. **Flag both for C2**; if the human wants them, they belong in CoachSystem.md §Achievement tie-in / §Named rules (phase-transition line) at Stage F.

---

## Marginal items flagged for the C2 spot-check (priority order)

1. **❌ L050 / census-I4 (pace nudges)** — not represented anywhere; no resting place. Highest-priority item; fix before Stage G.
2. **Milestone renumber ripple** — DecisionLog D023 + Database.md still cite "Milestone 7" for the graph view (Roadmap says Milestone 8); README.md still says "Milestones M0–M6".
3. **Architecture.md §Storage Backend** still says "OPEN / Must be locked before M1" (contradicts D040 / StorageDecision.md).
4. **Database.md entities table missing `deload_markers`, `limitations`, `periods` schema rows** (present in backup enumeration + decision text only).
5. **Database.md seeded event list** is a subset of Architecture.md's event model; sync-semantics paragraph references `workout.deleted` not in the seeded list.
6. **Imported-flag schema columns** shown only on journal_entries (global-flag lock represented in Gamification.md).
7. **L264 idempotency + partial-window edge rules** only in SequencingNotes S020 (CoachSystem.md has the core).
8. **L058/L061 deferred lines** rest in SequencingNotes S070/S072 rather than Database.md deferred-line notes (B1 mapping intent).
9. **Coach map §4 `ledger:1043` and §5 `1075` (Ouroboros)** — partial detail; add at Stage F if desired.
10. **Architecture.md §Data Flow step 4 "dashboard note / weekly review"** — terminology residue; Stage F normalization.

---

## Footer

- **No file other than this report was modified.** TEMP-PLANNING.md, all pipeline artifacts, all 15 docs, and the external frozen inputs are untouched by this session (verified `git status`: only the pre-existing `.opencode/agent/d2-executor.md` and `.opencode/agent/e-auditor.md` modifications were present before and after).
- **Line ranges read (contiguous):** TEMP-PLANNING.md 1–2671 (four chunks, every line covered once); IntegrationLedger.md 1–871; IntegrationIDCensus.md 1–805; IntegrationIntentBrief.md 1–177; StructuralImpactProposal.md 1–464; DecisionLog.md 1–1014; all 15 docs read in full (sizes listed in header); PersonalOS-Achievements-v2.md read in full plus targeted verification; TEMP-PLANNING-Achievement-Spec.md targeted verification; framework §0–§14 read (governing §11 read first).
- **Effort sufficiency:** MAX was adequate; the five-part audit was completed without context truncation.
- **Headline results:** Part 1 — 283/284 ledger rows represented or resting; **1 miss (L050)**. Part 2 — all 8 REMOVALS applied; all verbatim-critical rows exact; 47/48 intent items faithful (1 partial via L050). Part 3 — 5/5 dependency chains consistent; 2 cross-doc stale-state mismatches (milestone numbering; storage-decision state) + 3 minor alignment items. Part 4 — 375 census rows traced; unreconciled list = 6 documented caveats + **1 open item (L050/I4)**; **census gate NOT clear until L050 is resolved**. Part 5 — 42 ✅ / 2 ⚠ / **0 ❌ ORPHANED-CITATION**.

**STOP for human review. Do not proceed to C2 / F / G in this session.** C2 should sample the marginal items above (especially L050, the milestone renumber ripple, and the storage-decision state), then F should apply the fixes, then G may consume Part 4 as its census gate after L050's disposition is recorded.

> **Pipeline closure (Stage G, 2026-08-20):** the audit-fix pass in this
> commit drafted L050/I4 (CoachSystem.md §Pace nudges (I4), lines 321–332),
> resolving the single census blocker; the F consistency pass (commit
> 087b372) resolved the remaining cross-doc items (milestone renumber,
> storage-decision state, schema restores, F1–F5 flags). Stage G re-verified
> every residual against the current docs (see the G session report) and
> closed the integration pipeline: census gate CLEAR, no-holes gate CLEAR,
> all E marginal items resolved or resting per the framework. Historical
> findings above are left unchanged — this file is archived as the
> authoritative audit record (audits/IntegrationAuditReport-2026-08-20.md).