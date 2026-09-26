---
description: Stage G of the TEMP-PLANNING integration pipeline — ID-Census Reconciliation + No-Holes Gate. Parts A (consume E Part 4), B (residual re-read), C (archive & close). MAX-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage G — ID-Census Reconciliation + No-Holes Gate

Framework effort assignment: **MAX** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it. If re-reading the source plus the docs exceeds your context
window, process in contiguous chunks and append findings incrementally.

GEN-2 (read FIRST — where it disagrees with v6-final, it wins):
`doc draft framework/Pipeline-Framework-v7-Gen2-Delta.md`. The ledger is
the GEN-2 ledger. The v6-final Part B section list was gen-1-era — the
gen-2 sections are listed below.

Execute the framework's Stage G instruction exactly:

**Part A (census gate):** consume E's Part 4 — verify it is present,
complete, and its unreconciled list is empty. Do NOT re-run the census
coverage check from scratch (same dedupe principle as Part 5 vs G); only
confirm E's output and clear the gate.

**Part B (residual re-read):** unchanged mechanism from v4 (§13), with the
un-numbered-prose scan now explicitly including: the candidate families'
entries (C-01–C-15, F-01–F-32, N-01–N-18, L-01–L-15), the tree-1..tree-7
skeletons (verified superseded, not live), the engine-1/engine-2 blocks,
the D-records' prose (D085-D117 - every decision record's body, not just
the headers; D060 is a supersession cross-ref only, not a record), the LANDS conventions (every LANDS line lands somewhere),
and the "Research leftovers" closing section (each item has a resting
place — DecisionLog open item or SequencingNotes).

**Part C (archive & close):** after A and B clear, and with the user's
final approval:

- `TEMP-PLANNING.md` moves to `audits/TEMP-PLANNING-2026-09-26.md`
  (date-suffixed, the gen-2 run) — do NOT collide with the gen-1 archive
  set already at `audits/TEMP-PLANNING-2026-08-20.md` + the gen-1
  `Integration*-2026-08-20.md` artifacts. The repo never keeps a second
  source of truth at root.
- The gen-2 pipeline artifacts (`IntegrationIDCensus.md`,
  `IntegrationLedger.md`, `IntegrationIntentBrief.md`,
  `IntegrationSequencingNotes.md`, `StructuralImpactProposal.md`,
  `IntegrationAuditReport.md`) move to `audits/` alongside it,
  date-suffixed as a set (`Integration*-2026-09-26.md`).
- `docs/README.md`'s doc map is updated: retired entries removed, the new
  docs (docs/LifeTree.md family) added, ONE line per archived generation
  for provenance (gen-1 `*-2026-08-20` set + the gen-2 `*-2026-09-26`
  set — after this run audits/ holds TWO TEMP-PLANNING ledgers; label
  both, never bare "the archived ledger").
- The Project Status "Integration" line in docs/README.md is updated:
  the gen-1 closure (2026-08-20) stays, the gen-2 closure (this run's
  date) is added as its own line.
- AGENTS.md's LANDS pointer is re-checked: any "recorded in
  TEMP-PLANNING.md" reference must now read "the active TEMP-PLANNING
  ledger (archived date-suffixed on close)" — the root file no longer
  exists after this move.
- Final commit covers the archive move (see §14 for the full end-state).

**Final sign-off condition:** Stage G is not complete until — Part A
(census) empty, Part B (residual) empty, Part 5 of the audit report has
zero ❌ ORPHANED-VALUE entries that trace to a genuine ledger miss rather
than a stale register value, C2's sampled rows all verify clean, AND
Part C's archive move is committed.

Part C happens only with the user's explicit final approval — if it has
not been given, do Parts A and B, report the gate verdict, and stop.
