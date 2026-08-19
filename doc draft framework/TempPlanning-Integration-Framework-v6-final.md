# TEMP-PLANNING.md → /docs Integration Framework (v6 — Final)

**HOW TO USE THIS FILE:** paste this entire document into DeepSeek (via
opencode, with repo access to the Heartwood project) as the first message
of a fresh session. Tell it to execute Stage A1a first and stop for review
before continuing — do not run all stages unattended in one pass. Each
stage's "Prompt" block is written to be copy-pasted as-is (or handed to
DeepSeek directly, since it already has the whole framework in context).
Model is fixed at `opencode/deepseek-v4-flash-free` for every stage; per-stage
effort levels are assigned in §1's "Agent model & effort assignment" table —
apply them when launching each stage.

Supersedes v4. Two things changed based on a fresh, more complete read of
TEMP-PLANNING.md (now covering Journal J1–J7, the Daily Routine system
R1–R12 + a second audit round A1–A7, Periods, Milestone Review, a UI
hierarchy pass H1–H4, and a "Coach System Consolidated Functionality Map"),
plus the source now containing tooling of its own that earlier versions
didn't know to use:

1. **Scope is no longer "fitness."** This ledger now touches Journal,
   Calendar, Settings, Routine/Scheduling, Coach architecture, and Periods
   in addition to fitness/nutrition/gamification. Practically every doc in
   `docs/` is an affected doc for at least one Intent Brief item. The
   framework's structure doesn't need to change for this — v4's cross-doc
   machinery was already built for "affects more than Roadmap" — but the
   Indexer and Architect prompts below are updated to stop treating fitness
   as the default assumption.
2. **The source now does some of the framework's own job.** Two features
   TEMP-PLANNING.md added since the last read change how extraction should
   run:
   - A **"LABEL FAMILIES — DISAMBIGUATION LEGEND"** section explicitly
     warns that audit labels (A1, B3, C2, etc.) repeat across independent
     families (backup-A1–A6, census-A1–A4, routine-A1–A7, audit-B1–B4,
     resolve-B1–B5, audit-C1–C6, resolve-E1–E3, spec-E0–E13) and must
     always be qualified by family, never by letter+number alone. The v4
     ID Census stage would have silently collided these. v5's Indexer
     stage now takes this legend as ground truth and requires every
     census ID to carry its family prefix.
   - The **"COACH SYSTEM — CONSOLIDATED FUNCTIONALITY MAP"** section is a
     self-written cross-reference: it already cites specific
     `ledger:NNN-NNN` line ranges for nearly every Coach-related decision
     in the file. This is a ready-made partial audit trail the user
     already built. v5 has the Auditor stage cross-check its own Part 1/4
     findings against this section's citations rather than only working
      from a from-scratch ledger — a mismatch between what this section
      claims and what the ledger extracted is a strong signal of a missed
      item.

**v6 changes (logical review pass over v5):**
1. **Ground truth corrected to 15 docs** — `StorageSpikeStatus.md` (spike
   metrics; read before any storage-touching drafting; default read-only)
   and `StorageSpikeSessionA.md` (NOT a drafting target) added, with the
   non-doc elements (`audits/`, `tools/`, `lib/`, `web/`, root `Edit.md`)
   declared out of drafting scope.
2. **Model pinned:** every stage runs `opencode/deepseek-v4-flash-free`;
   per-stage effort table added in §1 (MAX for A1a/B2/E/G, HIGH for
   A1b/A2/B1/D2, MEDIUM for A3/D1/F; C is human).
3. **Stage execution rules added in §1:** one stage = one fresh session
   (on-disk artifacts are the only handoff), git checkpoints per stage with
   a pre-D1 rollback snapshot, and TEMP-PLANNING.md frozen from A1a start
   through G sign-off (line refs must not shift mid-pass).
4. **New Stage C2 (§11):** human spot-check after E — samples ledger rows
   against final docs, because E is a self-audit and cannot catch its own
   systematic misses. Pipeline table updated.
5. **B1 decision dedupe:** same-themed rows share one D-number; the
   consolidated D041+ list is confirmed at C, not assigned per row.
6. **A1b ledger gains a Source state column** (locked / draft /
   pending-approval): rows from "Draft schema shapes" and "Decided …
   pending final user approval" sections get explicit APPROVE/REJECT/REFER
   verdicts at Stage C before any drafting.
7. **G's Part A consumes E's Part 4** instead of re-running the same census
   check (same dedupe principle as Part 5 vs G).
8. **A3 gets its own self-contained prompt** (was a stub pointing at v4),
   including the closing-section scan.
9. **§14 end-state defined:** after sign-off, TEMP-PLANNING.md and the
   pipeline artifacts move to `audits/` with a date suffix — the repo never
   carries a second source of truth; "Remaining open items" / "Future
   ideas" default to DecisionLog open items (D038/D039 precedent).

**Known gap:** UIUX.md was not read while building this framework —
GitHub's search doesn't index this repo yet, so I could only fetch files
whose exact blob URL was given to me directly, and UIUX.md's wasn't. Since
TEMP-PLANNING.md now references UIUX.md's structure directly (dashboard
block order, H4 reveal-on-first-data, theme-ability), the Architect stage
(B2) needs UIUX.md's actual current content to do its job — Stage A1a's
Indexer prompt below includes a first step that reads it directly from the
repo (DeepSeek has that access; this Claude session didn't).

---

## 0. Repo + source ground truth

**Docs in `docs/`:** README, Vision, Requirements, Architecture, Database,
CoachSystem, Gamification, MediaStorage, StorageDecision, UIUX,
DevelopmentWorkflow, Roadmap, DecisionLog, **StorageSpikeStatus** (spike
metrics + open items — read it before any storage-touching drafting;
generally read-only for this integration), **StorageSpikeSessionA** (Session
A execution spec — NOT a drafting target; listed so agents don't silently
skip it) (15 files) + AGENTS.md at repo root. DecisionLog ends at D040 — new
entries start at **D041**.

**Non-doc repo elements:** `audits/audit-2026-08-14.md` is a past integration
audit — out of drafting scope; the source's audit families (backup-A,
audit-B/C, etc.) refer to TEMP-PLANNING.md's own internal audits, not this
folder. `tools/`, `lib/`, `web/` are code-repo scaffolding (implementation
not started) — never a drafting target. Root `Edit.md` is empty/unused.

**External canonical files (outside `docs/`):**
`PersonalOS-Achievements-v2.md` (THE WHAT — 131 trophies + 47 ladder tiers
= 178 named entries) and `TEMP-PLANNING-Achievement-Spec.md` (THE WHEN —
trigger predicates E0–E13, rung tables R1–R47). `TEMP-PLANNING-
Achievements.md` is superseded as a catalog (only its 7 governing rules
carry over).

**TEMP-PLANNING.md's own disambiguation legend (verbatim ground truth —
do not re-derive this, use it):**

| Family | Covers |
|---|---|
| backup-A1–A6 | S12 fix summary (enumeration/sync/events/weekly review/physique anchor/week recap) |
| census-A1–A4 | S13-045 trophy-census corrections (incl. strength-C2 ref) |
| routine-A1–A7 | S20 daily-routine audit round 2 + S10-004's event-A3 |
| audit-B1–B4 | S12/S21 audit fixes (record modes/strength kcal/fully-logged/TDEE freeze) |
| resolve-B1–B5 | B1–B5 resolution entries (re-fire map/Real Progress/On Target/weekly checkpoint/ghost tolerance) |
| audit-C1–C6 | S11/S12 audit fixes (meal reminders/streak window/reviewed-only/track-this/seeds/band) |
| resolve-E1–E3 | E1–E3 resolutions (count-in-window/settings knob/Perfect Month) |
| spec-E0–E13 | S13-016 achievement spec shared trigger engine |

Same letter+number across different families is NOT the same item. Every
downstream ID reference in this framework (census, ledger Source ID(s),
audit trace) MUST carry the family prefix, never bare "A1" or "B3."

**TEMP-PLANNING.md's expanded ID families to enumerate (starting list —
Stage A1a confirms/completes it against the live file):** plain items
1–37, O1–O8 (+ sub-items like O6-ADD-ON), I1–I9, N1–N9, F1–F6, NU1–NU13,
the eight disambiguated audit families above, TENSION 1–15, "clash #"1–6,
"audit E-clash" 1–5, M0–M7, G1–G20 (+ G7b), J1–J7 (+ J7's own lettered
audit-fix list a–g), R1–R12, A1–A7 (routine-A, per the legend — do not
conflate with backup-A or audit-A), H1–H4, and the unlettered "Remaining
open items" checklist ([x]-prefixed) plus "Future ideas raised, not yet
scoped."

**Self-citation aid:** the "COACH SYSTEM — CONSOLIDATED FUNCTIONALITY MAP"
section cites specific `ledger:NNN-NNN` line ranges for its claims. Treat
this section as a partial, user-authored audit trail — Stage E cross-
checks against it (see §11).

---

## 1. Pipeline Overview

| Track | Stage | Name | Output |
|---|---|---|---|
| 0 (index) | A1a | ID Census (Indexer) | `docs/IntegrationIDCensus.md` |
| 1 (atomic) | A1b | Atomic Extraction (Scribe) | `docs/IntegrationLedger.md` |
| 2 (intent) | A2 | Intent & Structure Extraction (Cartographer) | `docs/IntegrationIntentBrief.md` |
| 3 (process) | A3 | Process-Note Extraction (Sequencer) | `docs/IntegrationSequencingNotes.md` |
| 1 | B1 | Mapping & Conflict Detection (Mapper) | Ledger annotated |
| 2 | B2 | Cross-Doc Structural Impact Analysis (Architect) | `docs/StructuralImpactProposal.md` |
| all | C | Human Resolution Checkpoint | Ledger + Proposal annotated |
| 1+2 | D1 | Per-doc Drafting (Drafter) | Updated docs |
| 2 | D2 | Cross-Doc Structural Execution | Updated docs (coordinated) |
| all | E | Audit — coverage + intent fidelity + dependency integrity + census + self-citation cross-check | `docs/IntegrationAuditReport.md` |
| all | C2 | Human Spot-Check (after E) | Sampled ledger rows verified against final docs |
| all | F | Cross-doc Consistency Pass | Final reconciled docs |
| 0+all | G | ID-Census Reconciliation + No-Holes Gate | Sign-off checklist |

### Agent model & effort assignment (all stages)

**Model:** every stage runs on `opencode/deepseek-v4-flash-free` (DeepSeek V4
Flash, free tier) — no exceptions, no per-stage model upgrades. Effort is the
only knob, and it is assigned per stage below. C is human — no model.

| Stage | Agent | Effort | Why this level |
|---|---|---|---|
| A1a | Indexer | **MAX** | Full-file census is the foundation — an ID missed here is invisible to every later stage; errors cascade silently. |
| A1b | Scribe | **HIGH** | Verbatim-critical precision (numbers, thresholds, names) — mechanical but unforgiving. |
| A2 | Cartographer | **HIGH** | Judgment-heavy pattern inference (cohesion, surface consolidation, removal flags). |
| A3 | Sequencer | **MEDIUM** | Mostly explicit timing-language extraction; low ambiguity. |
| B1 | Mapper | **HIGH** | Verifies self-directed mappings against 15 live docs; conflict statuses drive stages C–D. |
| B2 | Architect | **MAX** | Structural reasoning (removals, restructures, milestone insertion) — highest-leverage reasoning stage. |
| C | (human) | — | Manual resolution checkpoint — no model. |
| C2 | (human) | — | Post-E spot-check — no model. |
| D1 | Drafter | **MEDIUM** (CoachSystem restructure rows: **HIGH**) | Mostly transcription from ledger rows; the Coach Consolidated Map restructure needs real judgment. |
| D2 | Cross-doc executor | **HIGH** | Coordinated multi-doc edits + REMOVES with traceability comments. |
| E | Auditor | **MAX** | Five-part audit incl. self-citation cross-check — the safety net; under-efforting it defeats the pipeline. |
| F | Consistency pass | **MEDIUM** | Systematic dangling-reference checks across docs. |
| G | Gate keeper | **MAX** | Part B re-reads the entire source; final no-holes gate. |

Rules: effort is the reasoning/attention budget, not a substitute for reading
context — never lower a stage's effort below the table to save tokens, and
never raise it to compensate for skipped context reads. Flag in the stage's
output footer if the assigned effort proved insufficient.

### Stage execution rules (all stages)

1. **One stage = one fresh session.** On-disk artifacts are the only
   handoff — a fresh session must be able to pick up any stage by reading
   the artifacts listed in the pipeline table. If a stage risks context
   pressure (B1, D2, G in practice: ledger + 15 docs can exceed one
   window), process per-doc-family in chunks and append results to the
   artifact file incrementally — never hold the whole mapping in memory.
2. **Git checkpoints.** Commit the artifact (or docs changes) at the end of
   each stage. Before D1, create a rollback snapshot commit so a failed
   drafting pass can be reverted wholesale. Stage C and C2 review the
   actual `git diff` of what changed, not just the artifacts.
3. **Freeze TEMP-PLANNING.md** from the moment A1a starts until G signs
   off — no edits, not even typos. Every ledger Source-line reference was
   captured against a specific file state; edits mid-pass silently
   invalidate the audit trail. If the user adds material mid-pass, it is
   logged as a deferred item and folded in a future re-run (A1a diffs
   against the archived census from §14).

---

## 2. Stage A1a — ID Census (Indexer)

**Prompt:**

```
You are the Indexer agent, running inside the Heartwood repo with file
access. Before touching TEMP-PLANNING.md, first read docs/UIUX.md in full
and hold its structure in context — you'll need it for later stages, and
this is the one doc this framework's author could not read while building
it, so get it right here.

Then read TEMP-PLANNING.md in full (if you cannot load it in one context,
read it in sequential, contiguous chunks covering every line — confirm the
line ranges you covered at the end).

TEMP-PLANNING.md contains its OWN disambiguation legend (search for
"LABEL FAMILIES — DISAMBIGUATION LEGEND") — read it first and use it as
ground truth for family boundaries. Do not invent your own family
groupings where the legend already defines one.

Enumerate every ID in every family, INCLUDING (this list is a floor, not a
ceiling — confirm it against the live file and add any family it missed):
plain items 1–37, O-series, I-series, N-series, F-series, NU-series, the
eight legend-defined audit families (backup-A, census-A, routine-A,
audit-B, resolve-B, audit-C, resolve-E, spec-E — each qualified, never
bare letters), TENSION 1–15, clash #1–6, audit E-clash 1–5, M0–M7, G1–G20
(+G7b), J1–J7 (+ J7's own a–g sub-list), R1–R12, routine-A1–A7 (the SECOND
audit round — per the legend, distinct from backup-A and audit-A), H1–H4,
the "[x]"-prefixed Remaining Open Items checklist, and the unscoped Future
Ideas list.

Produce docs/IntegrationIDCensus.md as one table per family:

| Family | ID | Short label | Source lines | Status text found |

Include every ID even if REJECTED/SKIPPED/DEFERRED/DECLINED — these need a
documented resting place downstream, not disappearance. Where the source
itself cites a line range for a claim (e.g. the Coach Consolidated Map's
"ledger:379-380" citations), carry that citation into this table's Source
lines column rather than re-deriving it — trust the author's own pointer,
spot-check a sample of them, and flag any citation that appears wrong
rather than silently correcting it.

Footer: total ID count per family, full-file coverage confirmation
(contiguous line ranges read, including UIUX.md).
```

---

## 3. Stage A1b — Atomic Extraction (Scribe)

**Prompt:**

```
You are the Scribe agent. Input: docs/IntegrationIDCensus.md (your
checklist — read the disambiguation legend reproduced in it, or re-check
TEMP-PLANNING.md's own legend section, before assigning any Source ID)
and TEMP-PLANNING.md in full.

Produce docs/IntegrationLedger.md:

| ID | Source ID(s) | Summary | Category | Source state | Verbatim-critical | Likely target doc | Self-directed mapping? | Process note | Source lines |

- ID: L001, L002, ... (ledger's own sequential ID).
- Source ID(s): every census ID this row covers, family-qualified (e.g.
  "routine-A3", not "A3"). Split rows that cover more than one separable
  fact.
- Summary: your own compressed restatement, not a quote. Keep numbers/
  thresholds/names exact.
- Category: [feature, decision, constraint, open-question, deferred,
  math/rationale, terminology, rejected, skipped, declined].
- Source state: [locked, draft, pending-approval]. locked = decided content
  in a LOCKED section; draft = discussion/draft material (e.g. "Draft
  schema shapes (discussion draft — NOT locked)"); pending-approval =
  "Decided (session-scoped, pending final user approval)" content. Every
  draft/pending-approval row gets an explicit APPROVE/REJECT/REFER verdict
  at Stage C before any drafting — the Scribe must NOT let draft material
  sail through as if it were spec.
- Verbatim-critical: YES if exact precision matters.
- Likely target doc: one of the 15 real docs/*.md files (now including
  UIUX.md as a live target, not a guess — you have its real content from
  the census stage; StorageSpikeStatus.md is eligible only if a row's
  content demands it — report doc, default read-only; StorageSpikeSessionA.md
  is never a target), "EXTERNAL: <filename>" for the achievement-catalog
  files, or "NEW" + proposed name.
- Self-directed mapping: YES if TEMP-PLANNING.md states the target itself
  (quote the directing sentence briefly). This is now COMMON — the source
  frequently names its own doc, e.g. "Gamification.md 'weekly review
  completed = small XP' line must be struck," "UIUX.md's block list needs
  this 'Today = briefing + habits + capture' merge," "MediaStorage.md's
  'only PC-exclusive feature' claim stays literally true." Check for this
  FIRST on every row before falling back to inference.
- Process note: sequencing/timing instruction, if any.
- Source lines: line range.
- Rows from the "Remaining open items" and "Future ideas raised, not yet
  scoped" closing sections default to target DecisionLog.md as open items
  (D038/D039 precedent) unless the source explicitly names a different
  resting place — do not scatter them into feature docs as if they were
  decided scope.

CENSUS RECONCILIATION (required): confirm every census ID appears in at
least one ledger row's Source ID(s). Append "## Census reconciliation"
listing any unreconciled census ID with a reason. Empty list = full
reconciliation — verify, don't assume.

Material describing an organizational shape rather than a single fact goes
in a "## Flagged for Track 2" section instead of a forced row.
```

---

## 4. Stage A2 — Intent & Structure Extraction (Cartographer)

**Prompt:**

```
You are the Cartographer agent. Read docs/IntegrationLedger.md and
docs/IntegrationIDCensus.md first, then TEMP-PLANNING.md in full.

Name organizing ideas implied across sections rather than stated as one
fact. Given the file's now-broader scope, check ALL of these patterns, not
just fitness cohesion:
1. Cross-system cohesion (phase-aware bulk/cut touching Database +
   Architecture + Gamification + CoachSystem + Roadmap together).
2. The canonical-file-elsewhere pattern (achievement catalog — reproduce
   TEMP-PLANNING.md's own "DOCS-PASS RULES" language, don't invent it).
3. NEW — surface consolidation: the file locks several "one surface, not
   two" decisions (H2 one weekly surface, A4 merged weekly review, A6 week
   recap = glance + verdict, clash #1 dashboard fusion). Each of these is
   an INTENT item whose structural implication is "retire/merge an
   existing planned surface in UIUX.md and/or CoachSystem.md" — flag these
   explicitly since they read as REMOVALS from current docs, not additions,
   and the Architect stage needs to treat removal proposals with the same
   rigor as additions.
4. NEW — the Coach Consolidated Functionality Map itself: this section is
   largely already doc-shaped prose with self-citations. Treat it as a
   candidate STRUCTURAL SOURCE for CoachSystem.md's docs-pass rewrite
   (heavy restructuring, not just item-by-item drafting) rather than
   ordinary ledger material — flag it as its own Intent Brief item with
   "Affected docs: CoachSystem.md" and structural implication "wholesale
   section restructure using this map as the organizing outline, still
   rewritten in CoachSystem.md's own voice, not copied."

Produce docs/IntegrationIntentBrief.md:

| ID | Theme | Description | Evidence (source lines) | Affected docs (incl. EXTERNAL:) | Structural implication (per doc) | Confidence |

Do not edit any doc — identification only.
```

---

## 5. Stage A3 — Process/Sequencing Extraction (Sequencer)

Handles "implement during design" and anything like it. These notes are
instructions about *how work should happen*, not product content — they
don't belong inside Database.md or CoachSystem.md as prose. They need a home
that a future implementer (you, or DeepSeek in opencode) will actually
consult at the right time.

**Prompt:**

```
You are the Sequencer agent, Track 3. Your job: find every instruction in
TEMP-PLANNING.md about HOW or WHEN something should be built, prototyped,
tested, or decided — as opposed to WHAT should be built (that's Track 1/2).

Examples of what belongs here: "implement during design" (build this
alongside the design phase rather than after it's finalized), "don't lock
this until X is tested," "prototype this manually before automating,"
"revisit once Y ships."

Also scan the "Remaining open items" and "Future ideas raised, not yet
scoped" closing sections — several carry explicit timing language ("revisit
when 12+ months of consistent training," "Scope: M2 — blocks nothing in
M0/M1"). Every item there with a timing or gating condition belongs in this
file, not in the ledger.

Produce docs/IntegrationSequencingNotes.md as a table:

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |

- ID: S001, S002, ...
- Instruction: the sequencing/process guidance, in your own words, precise
  about the WHEN or HOW.
- Applies to: cross-reference the Track 1 ledger ID or Track 2 intent ID this
  attaches to, if one exists. If it's a general process note with no single
  attached item, describe what it applies to in free text.
- When-condition: the checkable trigger for "revisit/when" instructions
  ("12+ months of consistent training," "P2.5 ships," "M2 locks") so a
  future implementer can test the condition instead of re-reading the
  source. "Implement during design" rows get "immediate (with design
  phase)".
- Source lines: line range.

Footer: line ranges covered (contiguous), total instruction count, and any
instructions whose WHEN depends on unbuilt milestones — keep them here with
their target milestone noted; do not drop them as "future."

This file is NOT drafted into product docs. It becomes a standing reference
— likely appended to DevelopmentWorkflow.md as a "sequencing notes from
TEMP-PLANNING.md integration" section, or kept as its own file if the volume
warrants it. Do not decide that here; just extract completely. The human
will decide placement in Stage C.
```

---

## 6. Stage B1 — Mapping & Conflict Detection (Mapper)

**Prompt:**

```
You are the Mapper agent. Input: docs/IntegrationLedger.md and the full
current docs/ folder (all 15 files, including UIUX.md — read it directly,
don't rely on secondhand description) plus AGENTS.md.

IF "Self-directed mapping" = YES: verify, don't guess. Confirm the named
target section exists (or needs creating), confirm the described edit is
still consistent with current content, record the verified target
section.

IF NO: infer from real doc structure.

Add:

| Target section | Status | Conflict note | Proposed decision ID |

Status: [clean-add, extends-existing, conflicts-existing,
duplicate-of-existing, REMOVES-existing]. Use REMOVES-existing for the
surface-consolidation items the Cartographer flagged (H2, A4, A6, clash
#1) — these aren't conflicts to resolve, they're intentional deletions of
currently-planned-but-superseded surfaces; still needs a conflict note
identifying exactly what's being removed and from where.

Proposed decision ID: next available starting D041, sequential — but rows
expressing the SAME decision or theme share ONE proposed decision ID, never
one per row (e.g. a weekly-review consolidation touching 12 rows is one
decision, not twelve). The consolidated D041+ list is confirmed at Stage C.

Do not edit any doc or resolve conflicts.
```

---

## 7. Stage B2 — Cross-Doc Structural Impact Analysis (Architect)

**Prompt:**

```
You are the Architect agent. Input: docs/IntegrationIntentBrief.md and the
CURRENT content of every doc any item's "Affected docs" names (read each
directly — UIUX.md now included).

For each Intent Brief item × affected doc, produce:

| Doc | Current state | Proposed change | Type | Depends on (other rows) |

Type now includes REMOVAL alongside [new-addition, extends-existing,
renames-placeholder, restructures-existing] — for the surface-
consolidation items, be explicit about exactly what UIUX.md/CoachSystem.md
content is being retired and where its replacement lives.

For the Coach Consolidated Map item specifically: propose it as a
restructuring guide for CoachSystem.md — list which of that section's
subsections (Philosophy / Architecture & pipeline / Event-log discipline /
Named rules / Outputs & surfaces / Achievement tie-in / Context switches /
Privacy & the never-list / Settings / Scheduling) map to which existing
CoachSystem.md headings, and where CoachSystem.md needs new headings.

For Roadmap.md: distinguish "authoring new scope" (Milestone 6+, was a
one-line placeholder) from "restructuring locked milestones" (M0–M5) as in
prior versions — plus now: the entity-sync plane (O6-ADD-ON) as a required
NEW milestone inserted before P2.5, per the source's own explicit
ROADMAP ORDERING resolution (clash #5).

For DecisionLog.md: confirm D041+ IDs and dated-section grouping.

Flag every placeholder-reconciliation case (Database.md's `future:`
comments resolving into real event types).

Do not touch any doc. Proposal only.
```

---

## 8. Stage C — Human Resolution Checkpoint (you)

Same categories as v4 (§8), plus:

- Any REMOVES-existing status row needs explicit sign-off before Stage D —
  confirm the removal is intended and not an extraction error, since
  deleting planned-but-unbuilt UIUX.md/CoachSystem.md content is
  higher-stakes than adding new content.
- Every ledger row with Source state **draft** or **pending-approval** gets
  an explicit verdict: APPROVE (drafts into docs), REJECT (documented
  resting place: Roadmap "explicitly not in scope" line or DecisionLog
  open item), or REFER (stays in the ledger/SequencingNotes for a future
  pass). Nothing draft-sourced is drafted silently.
- Confirm the consolidated D041+ decision list from B1 — the final
  numbering and grouping — before any drafting begins.
- Decide the placement of `IntegrationSequencingNotes.md`
  (DevelopmentWorkflow.md section vs. standalone file).

---

## 9. Stage D1 — Per-doc Drafting (Drafter)

Same mechanism as v4 (§9): Drafter only sees its own doc's assigned rows,
never TEMP-PLANNING.md directly. Additions:

- **CoachSystem.md specifically:** when rows trace back to the Coach
  Consolidated Map (per the Cartographer's flag), the Drafter restructures
  using that map's subsection order as an outline, rewriting into
  CoachSystem.md's own voice/conventions — still no verbatim copy, but
  allowed to follow the map's organizational shape closely since that
  shape is itself a deliberate authoring decision, not incidental prose.
- **REMOVES-existing rows:** the Drafter deletes the named content and
  leaves an HTML comment noting what was removed and which decision ID
  superseded it, so the doc's history is traceable without keeping dead
  content inline.
- **EXTERNAL-tagged rows** (achievement ecosystem): link-out pattern as in
  v4 (§9) — unchanged.

---

## 10. Stage D2 — Cross-Doc Structural Execution

Unchanged from v4 (§10).

---

## 11. Stage E — Audit (Auditor)

Same four parts as v4 (item coverage / intent fidelity / dependency
integrity / ID census coverage), plus a fifth. Part 4 (census coverage) is
the authoritative census gate — Stage G's Part A consumes it rather than
re-running the same check (see §13).

**PART 5 — Self-citation cross-check (new):**

```
Input, in addition to the standard audit inputs: the "COACH SYSTEM —
CONSOLIDATED FUNCTIONALITY MAP" section of TEMP-PLANNING.md (re-read it
directly) and the final drafted CoachSystem.md.

For every `ledger:NNN-NNN` citation in that section, confirm the claim it
supports is represented in the final CoachSystem.md (or wherever else it
was mapped, if not CoachSystem.md). Verdict per citation:
- ✅ REPRESENTED — the cited claim shows up in the final docs.
- ❌ ORPHANED-CITATION — the source cited this line range as evidence for
  a Coach capability, but nothing in the final docs reflects it.

This is an independent check against the ledger's own extraction — a
mismatch here means either the ledger missed something the source author
already flagged as important (bad) or the self-citation was stale/wrong in
the source itself (worth noting but not a drafting failure). Distinguish
the two where you can.

Output as Part 5 of docs/IntegrationAuditReport.md.
```

### Stage C2 — Human spot-check (after E, before F)

E is a self-audit — the same model that drafted validates its own output,
which structurally misses systematic errors. C2 is the model-independent
checkpoint:

- The human samples 10–20 ledger rows (prioritize: verbatim-critical rows,
  REMOVES-existing rows, and any rows E flagged as marginal) and verifies
  each is faithfully represented in the final docs via `git diff`/read.
- Any mismatch → fix the draft directly or send the specific rows back to
  the Drafter session; log the outcome in the audit report as Part 6.
- Optionally, if the human is unavailable or wants a second model: run a
  FRESH session as a cross-auditor — same sampling brief, zero shared
  context with the drafting sessions (this is why each stage is a fresh
  session per §1).

C2 is not complete until the sampled rows all verify clean or their
fixes are in place.

---

## 12. Stage F — Cross-doc Consistency Pass

Unchanged from v4 (§12), plus:

- Confirm every REMOVES-existing deletion Stage D1 performed doesn't leave
  a dangling reference elsewhere (e.g. if UIUX.md's old "weekly review
  screen" reference is deleted, confirm nothing else in docs/ still links
  to it as a standalone screen).
- Terminology normalization: the same concept must carry the same name
  across all 15 docs (e.g. "week recap" vs "weekly review" vs "week
  verdict" — the source locks these as one surface; the docs must not
  still name it three ways). Flag, don't silently rename, when a name
  change crosses a DecisionLog entry.

---

## 13. Stage G — ID-Census Reconciliation + No-Holes Gate

**Part A (census gate):** consume E's Part 4 — verify it is present,
complete, and its unreconciled list is empty. Do NOT re-run the census
coverage check from scratch (same dedupe principle as Part 5 vs G); only
confirm E's output and clear the gate.

**Part B (residual re-read):** unchanged mechanism from v4 (§13), with the
un-numbered-prose scan now explicitly including: Periods, Milestone Review,
the Coach Consolidated Map (cross-checked against Part 5 above rather than
re-scanned independently — avoid doing the same check twice), Calendar UI,
Settings tab, and both "Remaining open items" / "Future ideas" closing
sections.

**Part C (archive & close):** after A and B clear, and with the user's
final approval:

- `TEMP-PLANNING.md` moves to `audits/` with a date suffix (precedent:
  `audits/audit-2026-08-14.md`) — the repo never keeps a second source of
  truth at root.
- The pipeline artifacts (`IntegrationIDCensus.md`, `IntegrationLedger.md`,
  `IntegrationIntentBrief.md`, `IntegrationSequencingNotes.md`,
  `StructuralImpactProposal.md`, `IntegrationAuditReport.md`) move to
  `audits/` alongside it, date-suffixed as a set.
- `docs/README.md`'s doc map is updated: retired entries removed, one line
  pointing at the archived integration set for provenance.
- Final commit covers the archive move (see §14 for the full end-state).

**Final sign-off condition:** Stage G is not complete until — Part A
(census) empty, Part B (residual) empty, Part 5 of the audit report has
zero ❌ ORPHANED-CITATION entries that trace to a genuine ledger miss rather
than a stale source citation, C2's sampled rows all verify clean, AND
Part C's archive move is committed.

---

## 14. End-state: source retirement + artifact disposal

After G's sign-off, the repo must contain exactly one source of truth per
subject. End-state layout:

- **`audits/`** (dated set, single commit, referenced by docs/README):
  - `temp-planning-source-<date>.md` — the retired TEMP-PLANNING.md
  - `integration-census-<date>.md`, `integration-ledger-<date>.md`,
    `integration-intent-brief-<date>.md`, `integration-sequencing-<date>.md`,
    `integration-structural-proposal-<date>.md`,
    `integration-audit-<date>.md` — the pipeline artifacts
- **`docs/`** — the 15 live docs, now carrying every approved item from the
  source; DecisionLog holds the D041+ entries and the open items that came
  from the source's "Remaining open items" / "Future ideas" sections.
- **Unbuilt/undecided material** lives ONLY as DecisionLog open items or
  Roadmap "explicitly not in scope" lines — never as orphaned scratch prose.
- The `doc draft framework/` folder stays as-is (pipeline recipe for future
  re-runs); a future re-run's A1a diffs TEMP-PLANNING.md (or a successor
  scratchpad) against the archived census from this pass.

If TEMP-PLANNING.md is ever needed as a living document again, it comes
back under a new name (e.g. `TEMP-PLANNING-2.md`) — never the same path,
so the audit trail can't silently fork.
