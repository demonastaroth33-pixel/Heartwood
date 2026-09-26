---
description: Stage A1b of the TEMP-PLANNING integration pipeline — Atomic Extraction. Turns docs/IntegrationIDCensus.md + TEMP-PLANNING.md into docs/IntegrationLedger.md with census reconciliation. HIGH-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage A1b — Atomic Extraction (Scribe)

Framework effort assignment: **HIGH** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger; the draftable scope is the delta's §4 (LOCKED C/F/N/L
entries + tree-7 D085–D117 + the doc-amendment flags; NOT draftable:
PENDING/AGREED-IN-PRINCIPLE entries, the tree-1..tree-6 skeletons,
unfilled Unlocks/Refactor sections).

Execute the framework's Stage A1b instruction exactly:

You are the Scribe agent. Input: docs/IntegrationIDCensus.md (your
checklist — read the disambiguation legend reproduced in it, or re-check
TEMP-PLANNING.md's own legend section, before assigning any Source ID)
and TEMP-PLANNING.md in full.

Produce docs/IntegrationLedger.md:

| ID | Source ID(s) | Summary | Category | Source state | Verbatim-critical | Likely target doc | Self-directed mapping? | Process note | Source lines |

- ID: L001, L002, ... (ledger's own sequential ID).
- Source ID(s): every census ID this row covers, family-qualified (e.g.
  "candidate-N3", "tree-7", "D097" — never bare letters). Split rows that
  cover more than one separable fact.
- Summary: your own compressed restatement, not a quote. Keep numbers/
  thresholds/names exact.
- Category: [feature, decision, constraint, open-question, deferred,
  math/rationale, terminology, rejected, skipped, declined].
- Source state: [locked, draft, pending-approval]. locked = decided content
  in a LOCKED section; draft = discussion/draft material; pending-approval
  = "Agreed in principle" content. Every draft/pending-approval row gets an
  explicit APPROVE/REJECT/REFER verdict at Stage C before any drafting —
  the Scribe must NOT let draft material sail through as if it were spec.
  Note: for LOCKED entries the D-number is IMPLIED (D082+ convention, delta
  §3) — record the implied number in the Process note, and flag the two
  skill-install records D083/D084 (ledger) for renumbering to D118/D119 at
  the docs pass (they collide with the DecisionLog's recorded D083).
- Verbatim-critical: YES if exact precision matters (register values,
  thresholds, the derivation math, the launch-day contract numbers — YES).
- Likely target doc: one of the live docs/*.md files (the docs/ folder
  currently holds 23 files - read the whole folder, don't trust a stale
  count; UIUX.md and DecisionLog.md are live targets), "NEW: docs/LifeTree.md" for the
  tree-7 decision rows (the anticipated Life Tree doc family — register,
  state model, trigger table, derivation contract; detail lives in the
  life-tree-design/ sources, the row points at it), "EXTERNAL: <path>" for
  the life-tree-design/*.md files (as update targets when a row amends
  them, e.g. a superseded register value) and for the achievement-catalog
  files, or "EXTERNAL: <research-* path>" for research-rooted citations.
  StorageSpikeStatus.md is eligible only if a row's content demands it —
  report doc, default read-only; StorageSpikeSessionA.md is never a target.
- Self-directed mapping: YES if TEMP-PLANNING.md states the target itself
  (quote the directing sentence briefly). This is now COMMON — the source
  frequently names its own doc via the LANDS lines (e.g. "LANDS: UIUX.md",
  "LANDS: Database.md"). Check for this FIRST on every row before falling
  back to inference.
- Process note: sequencing/timing instruction, if any.
- Source lines: line range.
- Rows from the closing "Research leftovers" section default to target
  DecisionLog.md as open items (D038/D039 precedent) unless the source
  explicitly names a different resting place — do not scatter them into
  feature docs as if they were decided scope.

CENSUS RECONCILIATION (required): confirm every census ID appears in at
least one ledger row's Source ID(s). Append "## Census reconciliation"
listing any unreconciled census ID with a reason. Empty list = full
reconciliation — verify, don't assume.

Material describing an organizational shape rather than a single fact goes
in a "## Flagged for Track 2" section instead of a forced row (this
includes the tree-7 design record itself — its shape belongs in the Intent
Brief, its facts belong in rows).

Write docs/IntegrationLedger.md to disk with the census reconciliation
appended, and STOP for human review — do not proceed to any later stage.