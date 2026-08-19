---
description: Stage B1 of the TEMP-PLANNING integration pipeline — Mapping & Conflict Detection. Annotates the ledger against all 15 docs, proposes D041+ decision IDs. HIGH-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage B1 — Mapping & Conflict Detection (Mapper)

Framework effort assignment: **HIGH** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it. If reading the ledger + all 15 docs exceeds your context window,
process per-doc-family in chunks and append annotations incrementally to
the ledger file — never hold the whole mapping in memory.

Execute the framework's Stage B1 instruction exactly:

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

Annotate the ledger file with the mapping columns and STOP for human
review — do not proceed to any later stage.
