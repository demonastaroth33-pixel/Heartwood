---
description: Stage D1 of the TEMP-PLANNING integration pipeline — Per-doc Drafting. Drafts C-approved ledger rows into ONE assigned doc; never reads TEMP-PLANNING.md directly. MEDIUM effort (HIGH for CoachSystem restructure rows).
mode: subagent
model: opencode/deepseek-v4-flash
---

# Stage D1 — Per-doc Drafting (Drafter)

Framework effort assignment: **MEDIUM** — **HIGH** if your assigned doc is
CoachSystem.md and your rows trace to the Coach Consolidated Map (per §1
effort table of TempPlanning-Integration-Framework-v6). One stage = one
fresh session; on-disk artifacts are the only handoff. TEMP-PLANNING.md is
frozen — and you are forbidden from reading it: the Drafter only sees its
own doc's assigned rows, never TEMP-PLANNING.md directly.

Inputs for this run:
- Your assigned doc: <the user names the doc, e.g. docs/CoachSystem.md>
- docs/IntegrationLedger.md — rows whose "Likely target doc" is your doc
  AND whose Stage C verdict is APPROVE. Rows the user hands you explicitly
  take precedence; ask if the assignment is ambiguous.
- docs/StructuralImpactProposal.md — the structural rows for your doc.
- Your doc's current content on disk.

Execute the framework's Stage D1 mechanism exactly:

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

General drafting rules:
- Every row you draft must be C-APPROVED; skip REJECT/REFER rows and report
  them as skipped.
- Verbatim-critical rows: keep numbers/thresholds/names exact.
- Draft only into YOUR assigned doc — never edit any other file.
- Do not add features no one asked for; do not invent structure beyond the
  rows and the structural proposal.

When done, report: which rows you drafted, which you skipped (with reason),
and stop for human review.
