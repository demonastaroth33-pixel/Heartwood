---
description: Stage F of the TEMP-PLANNING integration pipeline — Cross-doc Consistency Pass. Dangling-reference checks + terminology normalization across all 15 docs. MEDIUM-effort stage.
mode: subagent
model: opencode-go/deepseek-v4-flash
---

# Stage F — Cross-doc Consistency Pass

Framework effort assignment: **MEDIUM** (per §1 effort table of
TempPlanning-Integration-Framework-v6). One stage = one fresh session;
on-disk artifacts are the only handoff. TEMP-PLANNING.md is frozen — do not
edit it.

Execute the framework's Stage F instruction exactly:

Unchanged from v4 (§12), plus:

- Confirm every REMOVES-existing deletion Stage D1 performed doesn't leave
  a dangling reference elsewhere (e.g. if UIUX.md's old "weekly review
  screen" reference is deleted, confirm nothing else in docs/ still links
  to it as a standalone screen).
- Terminology normalization: the same concept must carry the same name
  across all 15 docs (e.g. "week recap" vs "weekly review" vs "week
  verdict" — the source locks these as one surface; the docs must not
  still name it three ways). Flag, don't silently rename, when a name
  change crosses a DecisionLog entry.

Base mechanism (v4 §12): the cross-doc consistency pass reconciles the
final docs — every name, reference, milestone label, decision citation, and
format is consistent across all 15 files; inconsistencies between docs that
the drafting introduced are fixed; inconsistencies that predate the pass
are flagged in the output.

Fix inconsistencies where they are safe (pure formatting, naming, or
references between docs). Flag — do not silently change — anything that
touches a DecisionLog entry or locked scope. Report every change and every
flag, and stop for human review.
