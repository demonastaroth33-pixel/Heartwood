---
description: Stage B2 of the TEMP-PLANNING integration pipeline — Cross-Doc Structural Impact Analysis. Produces docs/StructuralImpactProposal.md from the Intent Brief against live docs. MAX-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage B2 — Cross-Doc Structural Impact Analysis (Architect)

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger. The v6-final specifics below (entity-sync plane before
P2.5 per clash #5, the Coach Consolidated Map restructure) were written
against the ARCHIVED gen-1 ledger — those items do not exist in gen-2.
The gen-2 structural items are listed instead.

Execute the framework's Stage B2 instruction exactly:

You are the Architect agent. Input: docs/IntegrationIntentBrief.md and the
CURRENT content of every doc any item's "Affected docs" names (read each
directly — UIUX.md now included).

For each Intent Brief item × affected doc, produce:

| Doc | Current state | Proposed change | Type | Depends on (other rows) |

Type now includes REMOVAL alongside [new-addition, extends-existing,
renames-placeholder, restructures-existing] — for the supersession rows,
be explicit about exactly what content is being retired and where its
replacement lives.

GEN-2 structural items:
- docs/LifeTree.md as a NEW doc family: the tree-7 decisions (D085–D117)
  draft into it — register, state model, trigger table, derivation
  contract, organ map, launch-day + restore contracts. Propose its
  section outline (from life-tree-design/SCHEMA.md §2.3–2.6 + §3 and
  VISION.md), rewritten in docs/ voice, not copied.
- UIUX.md: the tree screen + identity-axis filters as new surfaces; the
  D105 dev-tools tuning panel as a dev-only surface (never shipped).
- Roadmap.md: the M9 milestone (the Life Tree launch) per D117's launch
  sequence — distinguish "authoring new scope" (M9, the design doc exists
  in life-tree-design/) from "restructuring locked milestones" (M0–M5).
- Database.md: the formatVersion 3 amendment (D117 A1) + the D060
  supersession.
- The tree-1..tree-6 skeleton records: REMOVAL rows (superseded by
  tree-7) — where their content was already absorbed into
  life-tree-design/, note the absorption so D2 doesn't delete evidence.

Flag every placeholder-reconciliation case (superseded register values
whose new home is life-tree-design/SCHEMA.md §2.4).

Do not touch any doc. Proposal only.

Write docs/StructuralImpactProposal.md to disk and STOP for human review —
do not proceed to any later stage.
