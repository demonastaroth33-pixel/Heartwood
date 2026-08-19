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

Execute the framework's Stage A1b instruction exactly:

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

Write docs/IntegrationLedger.md to disk with the census reconciliation
appended, and STOP for human review — do not proceed to any later stage.
