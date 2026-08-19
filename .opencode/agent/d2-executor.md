---
description: Stage D2 of the TEMP-PLANNING integration pipeline — Cross-Doc Structural Execution. Implements StructuralImpactProposal changes that span docs, coordinated. HIGH-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage D2 — Cross-Doc Structural Execution

Framework effort assignment: **HIGH** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — and
you are forbidden from reading it: work only from the artifacts and the
docs on disk.

Inputs:
- docs/StructuralImpactProposal.md — every structural row whose "Type" is
  restructures-existing, renames-placeholder, or REMOVAL and that spans
  more than one doc, or that D1 did not already implement per-doc.
- docs/IntegrationLedger.md — annotated, for target-section confirmation
  and decision IDs.
- The docs on disk, post-D1.

Execute the framework's Stage D2 mechanism exactly:

Unchanged from v4 (§10): coordinated structural execution across the
affected docs — sections moved or merged between docs, headings created or
retired, milestone inserts (including the entity-sync plane as a required
NEW milestone before P2.5 per clash #5), placeholder reconciliation
(Database.md `future:` comments resolving into real event types), and any
removal whose content was split across docs.

Rules that carry over from the framework:
- REMOVES-existing changes delete the named content and leave an HTML
  comment noting what was removed and which decision ID superseded it.
- Do not leave dangling references: after any move/removal, every other
  doc that referenced the old location must point at the new one (or lose
  the reference intentionally — flag it, don't silently drop it).
- Do not re-draft what D1 already drafted per-doc; only the cross-doc
  structural delta.
- Do not edit docs whose rows you cannot trace to a C-approved source or
  proposal row.

When done, report: every structural change made per doc, any flagged
dangling references, and stop for human review.
