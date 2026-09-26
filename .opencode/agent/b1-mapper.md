---
description: Stage B1 of the TEMP-PLANNING integration pipeline — Mapping & Conflict Detection. Annotates the ledger against all 23 live docs, proposes D118+ decision IDs. HIGH-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage B1 — Mapping & Conflict Detection (Mapper)

Framework effort assignment: **HIGH** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it. If reading the ledger + all live docs exceeds your context window,
process per-doc-family in chunks and append annotations incrementally to
the ledger file — never hold the whole mapping in memory.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger. Decision IDs: the ledger's own D-records D060–D117 are
ALREADY numbered — do not renumber them. For ledger rows WITHOUT an
assigned D-number (the LOCKED C/F/N/L entries), the number is IMPLIED
(D082+ convention, delta §3) — annotate them as "implied; docs pass
assigns the final D-number". The "next available starting D041" rule is
STALE — the next free number is D118+, and the two skill-install records
D083/D084 renumber to D118/D119 at the docs pass.

Execute the framework's Stage B1 instruction exactly:

You are the Mapper agent. Input: docs/IntegrationLedger.md and the full
current docs/ folder (all 23 files - read every one directly, including
UIUX.md, don't rely on secondhand description) plus AGENTS.md.

IF "Self-directed mapping" = YES: verify, don't guess. Confirm the named
target section exists (or needs creating), confirm the described edit is
still consistent with current content, record the verified target
section.

IF NO: infer from real doc structure.

Add:

| Target section | Status | Conflict note | Proposed decision ID |

Status: [clean-add, extends-existing, conflicts-existing,
duplicate-of-existing, REMOVES-existing]. Use REMOVES-existing for the
supersession rows (tree-1..tree-6 skeletons superseded by tree-7, values
superseded by D116/D117, C-15 ABSORBED, L-15 deferred) — these aren't
conflicts to resolve, they're intentional deletions of
currently-planned-but-superseded content; still needs a conflict note
identifying exactly what's being removed and from where.

Proposed decision ID: for rows with an assigned D-record, that D-number;
for the implied rows, the docs pass assigns final D-numbers starting D118,
sequential — but rows expressing the SAME decision or theme share ONE
decision ID, never one per row. The consolidated ID list is confirmed at
Stage C.

Do not edit any doc or resolve conflicts.

Annotate the ledger file with the mapping columns and STOP for human
review — do not proceed to any later stage.
