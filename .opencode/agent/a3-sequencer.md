---
description: Stage A3 of the TEMP-PLANNING integration pipeline — Process/Sequencing Extraction. Finds HOW/WHEN instructions, produces docs/IntegrationSequencingNotes.md. MEDIUM-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage A3 — Process/Sequencing Extraction (Sequencer)

Framework effort assignment: **MEDIUM** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger — its closing sections are "Research leftovers" (not
"Remaining open items"/"Future ideas", which were gen-1 sections).

Context: this stage handles "implement during design" and anything like
it. These notes are instructions about *how work should happen*, not
product content — they don't belong inside Database.md or CoachSystem.md as
prose. They need a home that a future implementer (you, or DeepSeek in
opencode) will actually consult at the right time.

Execute the framework's Stage A3 instruction exactly:

You are the Sequencer agent, Track 3. Your job: find every instruction in
TEMP-PLANNING.md about HOW or WHEN something should be built, prototyped,
tested, or decided — as opposed to WHAT should be built (that's Track 1/2).

Examples of what belongs here: "implement during design" (build this
alongside the design phase rather than after it's finalized), "don't lock
this until X is tested," "prototype this manually before automating,"
"revisit once Y ships."

GEN-2 additions — the D117 development-handoff records are the richest
sequencing material in the ledger. Extract them with precision:
- The M9 launch sequence (D117 D1/D2): the trait-space + mockup step
  happens in M9 against the real renderer (L-15's deferred placement);
  the launch phase order (engine foundation → organs → visuals →
  navigation → anatomy → review) with the 19 archetypes as seeded-data
  test fixtures. When-condition: "M9 development starts".
- The D105 dev-tools tuning surface: register values playable in a
  dev-only panel — "build with the engine, never ship".
- The paper-run validation discipline: the 19 archetype walks are the
  regression fixtures for the derivation engine.

Also scan the "Research leftovers" closing section — items there carry
explicit timing language or none; those with a timing or gating condition
belong in this file, not in the ledger.

Produce docs/IntegrationSequencingNotes.md as a table:

| ID | Instruction | Applies to (ledger ID / intent ID / free text) | When-condition | Source lines |

- ID: S001, S002, ...
- Instruction: the sequencing/process guidance, in your own words, precise
  about the WHEN or HOW.
- Applies to: cross-reference the Track 1 ledger ID or Track 2 intent ID this
  attaches to, if one exists. If it's a general process note with no single
  attached item, describe what it applies to in free text.
- When-condition: the checkable trigger for "revisit/when" instructions
  ("M9 development starts," "the derivation engine ships," "the tree
  screen exists") so a future implementer can test the condition instead
  of re-reading the source. "Implement during design" rows get "immediate
  (with design phase)".
- Source lines: line range.

Footer: line ranges covered (contiguous), total instruction count, and any
instructions whose WHEN depends on unbuilt milestones — keep them here with
their target milestone noted; do not drop them as "future."

This file is NOT drafted into product docs. It becomes a standing reference
— likely appended to DevelopmentWorkflow.md as a "sequencing notes from
TEMP-PLANNING.md integration" section, or kept as its own file if the volume
warrants it. Do not decide that here; just extract completely. The human
will decide placement in Stage C.

Write docs/IntegrationSequencingNotes.md to disk and STOP for human review —
do not proceed to any later stage.