# RUNBOOK — TEMP-PLANNING → /docs Integration Pipeline

Operational companion to
`doc draft framework/TempPlanning-Integration-Framework-v6-final.md`
(read it first — this runbook only covers execution mechanics).

## Setup summary

- **Model:** `opencode/deepseek-v4-flash-free` for every agent (set in each
  agent file — no per-stage model upgrades).
- **Agents:** `.opencode/agent/` — one file per pipeline stage, prompts
  preserved verbatim from the framework.
- **Effort:** per §1 effort table — MAX: A1a, B2, E, G · HIGH: A1b, A2,
  B1, D2, C2 · MEDIUM: A3, D1, F · C/C2 checkpoints are human.

## Stage agents

| Stage | Agent file | Output |
|---|---|---|
| A1a | `a1a-indexer` | `docs/IntegrationIDCensus.md` |
| A1b | `a1b-scribe` | `docs/IntegrationLedger.md` |
| A2 | `a2-cartographer` | `docs/IntegrationIntentBrief.md` |
| A3 | `a3-sequencer` | `docs/IntegrationSequencingNotes.md` |
| B1 | `b1-mapper` | Ledger annotated |
| B2 | `b2-architect` | `docs/StructuralImpactProposal.md` |
| C | — (human) | Ledger + proposal verdicts |
| D1 | `d1-drafter` | Updated docs (one run per affected doc) |
| D2 | `d2-executor` | Updated docs (coordinated) |
| E | `e-auditor` | `docs/IntegrationAuditReport.md` |
| C2 | — (human; optional agent: `c2-cross-auditor`) | Verified sample rows |
| F | `f-consistency` | Final reconciled docs |
| G | `g-gatekeeper` | Sign-off + archive commit |

## How to run a stage

1. **Fresh session each stage.** Open opencode and invoke the stage's
   subagent by @-mention in the input — e.g. `@a1a-indexer Run the stage
   now.` (type `@` to open the agent autocomplete). Tab only cycles the
   built-in PRIMARY agents (build/plan); the stage agents are subagents
   and are invoked by mention. The agent body IS the stage prompt —
   nothing else to paste. Subagents start with fresh context, which is
   the framework's "one stage = one fresh session" rule in action.
2. The agent writes its artifact to disk and stops for review. It will not
   proceed to later stages by itself.
3. **Git checkpoint (mandatory, §1):** commit the artifact after every
   stage. Before D1, create a rollback snapshot commit. Commit after D2.
4. Review the `git diff` of what changed at C and C2 — never just the
   artifacts.

## Human checkpoints

**C (after B2, before any drafting):** review the annotated ledger + the
structural proposal and record verdicts:
- Sign off every REMOVES-existing row (confirm the removal is intended,
  not an extraction error).
- Verdict every row with Source state **draft** / **pending-approval**:
  APPROVE (drafts into docs) / REJECT (resting place: Roadmap "explicitly
  not in scope" line or DecisionLog open item) / REFER (stays in
  ledger/SequencingNotes for a future pass). Nothing draft-sourced is
  drafted silently.
- Confirm the consolidated D041+ decision list from B1 (same-theme rows
  share one D-number).
- Decide placement of `IntegrationSequencingNotes.md` (DevelopmentWorkflow
  section vs standalone file).

**C2 (after E, before F):** sample 10–20 ledger rows — prioritize
verbatim-critical, REMOVES-existing, and E-flagged-marginal rows — and
verify each against the final docs via `git diff`. Mismatches → fix
directly or send the rows back to a fresh `d1-drafter` run; log outcomes in
the audit report as Part 6. Optional: run `c2-cross-auditor` as the
model cross-auditor instead.

## Disciplines (non-negotiable)

- **Source freeze:** TEMP-PLANNING.md is NOT edited from the moment A1a
  starts until G signs off. New material mid-pass → deferred item, folded
  in a future re-run.
- **One stage = one fresh session.** On-disk artifacts are the only
  handoff.
- **D1 isolation:** the Drafter never reads TEMP-PLANNING.md — only its
  own doc's C-approved rows, the ledger, and the structural proposal.
  Run `d1-drafter` once per affected doc, naming the doc in the message
  (e.g. `Assigned doc: docs/CoachSystem.md`).
- **D1/D2 removals** delete content and leave an HTML comment noting what
  was removed and which decision ID superseded it.

## End-state (G Part C + §14)

With the user's final approval, G's gatekeeper moves TEMP-PLANNING.md and
all six pipeline artifacts to `audits/` (date-suffixed set), updates
`docs/README.md`'s doc map, and the final commit covers the archive move.
After that: docs/ = single source of truth; DecisionLog holds D041+ and
the open items; unbuilt/undecided material lives only as DecisionLog open
items or Roadmap "explicitly not in scope" lines.

## After config changes

opencode loads config at startup — restart opencode before running the
first stage so the new agents are picked up.
