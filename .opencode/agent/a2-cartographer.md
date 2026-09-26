---
description: Stage A2 of the TEMP-PLANNING integration pipeline — Intent & Structure Extraction. Reads ledger + census + TEMP-PLANNING.md, produces docs/IntegrationIntentBrief.md. HIGH-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage A2 — Intent & Structure Extraction (Cartographer)

Framework effort assignment: **HIGH** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger. The v6-final intent checklist below (H2/A4/A6/clash #1
surface consolidation, the Coach Consolidated Functionality Map) was
written against the ARCHIVED gen-1 ledger — those sections do not exist in
gen-2. The gen-2 intents are listed in the checklist instead.

Execute the framework's Stage A2 instruction exactly:

You are the Cartographer agent. Read docs/IntegrationLedger.md and
docs/IntegrationIDCensus.md first, then TEMP-PLANNING.md in full.

Name organizing ideas implied across sections rather than stated as one
fact. Given the gen-2 ledger's scope, check ALL of these patterns:
1. The Life Tree as a structural addition: tree-7 (D085–D117) locks a new
   product surface (the tree screen), a state model, a derivation contract,
   and a set of register values. Its structural implication is a NEW doc
   family (docs/LifeTree.md) plus UIUX.md gaining the tree surface —
   flag the new-doc intent explicitly, with "Affected docs:
   docs/LifeTree.md (NEW) + UIUX.md (tree screen) + Roadmap.md (M9)".
2. The D105 dev-tools tuning surface: every register value playable in a
   dev-only debug panel, never shipped. This is an INTENT with a
   structural implication ("dev-tooling section, excluded from the shipped
   product") — flag it so the docs pass records it without shipping it.
3. The Coach authority re-point: gen-2 has NO Coach Consolidated Map —
   the Coach's authority is docs/CoachSystem.md + the L-10 record + the
   tree decisions D103/D110/D111. Coach-related intents restructure
   CoachSystem.md against those, not against a ledger map.
4. The organ-state cluster: seasonal organ states, stage-transition UX,
   the ceremony queue, the launch-day + restore contracts (D097/D098) —
   each is an INTENT item whose structural implication spans the tree doc
   family and the app's state layer.
5. The privacy/copy boundary: payload-blindness (the tree never touches
   coach_outputs) and the identity-axis filters (ACHIEVEMENT-SCAN.md) —
   flag as constraints with structural reach into CoachSystem.md +
   LifeTree.md.

Produce docs/IntegrationIntentBrief.md:

| ID | Theme | Description | Evidence (source lines) | Affected docs (incl. EXTERNAL:) | Structural implication (per doc) | Confidence |

Do not edit any doc — identification only.

Write docs/IntegrationIntentBrief.md to disk and STOP for human review — do
not proceed to any later stage.