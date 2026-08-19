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

Execute the framework's Stage A2 instruction exactly:

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

Write docs/IntegrationIntentBrief.md to disk and STOP for human review — do
not proceed to any later stage.
