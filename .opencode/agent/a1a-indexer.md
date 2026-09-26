---
description: Stage A1a of the TEMP-PLANNING integration pipeline — ID Census. Reads UIUX.md + TEMP-PLANNING.md in full, enumerates every ID in every family, produces docs/IntegrationIDCensus.md. MAX-effort stage.
mode: subagent
model: opencode/deepseek-v4-flash-free
---

# Stage A1a — ID Census (Indexer)

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger (refactor & Life Tree design). The v6-final family lists
below were archived with gen-1 — the live families are in the delta's §2
table and in the ledger's own legend section.

Execute the framework's Stage A1a instruction exactly:

You are the Indexer agent, running inside the Heartwood repo with file
access. Before touching TEMP-PLANNING.md, first read docs/UIUX.md in full
and hold its structure in context — you'll need it for later stages, and
this is the one doc this framework's author could not read while building
it, so get it right here.

Then read TEMP-PLANNING.md in full (if you cannot load it in one context,
read it in sequential, contiguous chunks covering every line — confirm the
line ranges you covered at the end).

TEMP-PLANNING.md contains its OWN disambiguation legend (search for
"LABEL FAMILIES — DISAMBIGUATION LEGEND") — read it first and use it as
ground truth for family boundaries. Do not invent your own family
groupings where the legend already defines one.

Enumerate every ID in every family, INCLUDING (this list is a floor, not a
ceiling — confirm it against the live file and add any family it missed):
the candidate families candidate-C (C-01–C-15), candidate-F (F-01–F-32),
candidate-N (N-01–N-18), candidate-L (L-01–L-15); the refactor-audit
family audit-1–audit-13; the Life Tree family tree-1–tree-7 (tree-7 = the
authoritative design record — the D085–D117 decisions; tree-1..tree-6 are
superseded skeletons, still enumerated with their FILLED BY tree-7
markers); the cross-cutting engine-1/engine-2 blocks; and the D-record
family D060–D117 (the decision records — enumerate EVERY D-number, with
its status token: LOCKED/SKIPPED/REJECTED/AGREED-IN-PRINCIPLE/PENDING).
Also enumerate the closing "Research leftovers" section (recorded, no
decision yet). The gen-1 families (plain items 1–37, O/I/NU-series,
backup-A…spec-E, TENSION, clash, G/J/R/H, M0–M7…) are ARCHIVED — do not
hunt for them.

Additionally, the Life Tree design's authoritative detail lives outside
the ledger and is PART of the drafting surface — list these as drafting
inputs in a separate census table (not IDs, but source files + section
anchors): `life-tree-design/VISION.md`, `SCHEMA.md` (§2.3 canonical
domain table, §2.4 threshold register, §2.5 trigger table, §2.6 state
model, §3 derivation contract), `LOOPHOLES.md`, `ACHIEVEMENT-SCAN.md`,
`INPUT-INVENTORY.md`, plus `research-botany/MASTER-Botany-Reference.md`
and the four research-*/ sources as citation roots.

Produce docs/IntegrationIDCensus.md as one table per family:

| Family | ID | Short label | Source lines | Status text found |

Include every ID even if REJECTED/SKIPPED/DEFERRED/DECLINED — these need a
documented resting place downstream, not disappearance. Where the source
itself cites a line range for a claim, carry that citation into this
table's Source lines column rather than re-deriving it — trust the
author's own pointer, spot-check a sample of them, and flag any citation
that appears wrong rather than silently correcting it.

Footer: total ID count per family, full-file coverage confirmation
(contiguous line ranges read, including UIUX.md).

Write docs/IntegrationIDCensus.md to disk, confirm the footer coverage, and
STOP for human review — do not proceed to any later stage.