# Perf Backlog — Heartwood (source of truth for perf-orchestrator)

State file: `.opencode/perf-state.json` mirrors status here; this table is
context. Gate = `AUTO` (fully closable by the pipeline) or `HW-GATE` (halts
for on-target-machine measurement; halts are BATCHED, never per-ticket).
Batching groups: **T1+T2**, **T4+T11**, **T5+T6+T9**. Golden rule: optimize
HOW things are computed, never WHAT they look like.

| ID | Ticket | Depends on | Gate | Rollback trigger |
|----|--------|-----------|------|-------------------|
| T0 | COOP/COEP headers in `tools/serve_web.mjs` (plus gzip for large assets); verify via curl header check, re-check console for `sharedArrayBuffers` | — | AUTO (header check is deterministic, no browser) | Header change breaks an asset — revert, note in escalation |
| T1 | One Chrome Performance trace on target machine during a slow window | T0 | **HW-GATE** *(batched with T2)* | n/a — pure data collection |
| T2 | E1/E2 checks: `chrome://gpu` WebGL2 blocklist reason; DPR bootstrap-level override if adopted | T0, T1 | **HW-GATE** *(batched with T1)* | E2 causes visible softness beyond agreed trade-off — revert |
| T3 | Re-verify C1 (Drift thread) after T0 | T0, T1 | AUTO (grep drift package source; the Performance-panel confirmation comes out of T1's trace) | none — read-only investigation |
| T4 | Finish A1: RepaintBoundary isolation (hero rings, streak ring, storage fill, FAB, each hover target, modal content). **Starts from the existing unbuilt edit** — `RepaintBoundary` inside `Reveal` (`lib/widgets/animated_widgets.dart`): build + verify it first, then add the rest — never duplicate it | — | **HW-GATE** *(batched with T11)* | Any flutter test regression; reviewer finds a boundary above a widget needing shared repaint context; implementer duplicates the existing Reveal edit |
| T5 | A3: pre-baked modal backdrop blur, captured pre-transition | T4 | **HW-GATE** *(batched with T6, T9)* | Visible blur pop-in on capture; live backdrop content frozen incorrectly |
| T6 | A4 broadened: audit + fix all `Opacity`/`FadeTransition`/`AnimatedOpacity` bounds | T4 | **HW-GATE** *(batched with T5, T9)* | Any fade reads as a visual regression on review |
| T7 | Overdraw audit + fixes (critique §6) | — | AUTO — structural correctness, no perf claim needed. Skip the release-build verifier step (runtime-neutral) | Any layout regression |
| T8 | ClipRRect audit (critique §7) — **rescoped: zero `ClipRRect` occurrences in `lib/` (verified)**; grep-and-confirm-zero only, nothing to fix | — | AUTO (grep only) | n/a — no code change |
| T9 | A2: shadow radius trim + shadow-sprite caching for static glows | T4 | **HW-GATE** *(batched with T5, T6)* | Shadow "near-identical" fails visual check |
| T10 | Const/allocation hygiene pass (critique §8) | — | AUTO — skip the release-build verifier step (runtime-neutral) | none — pure refactor, tests must stay green |
| T11 | B1/B2 re-measure; shorten hover only if storm persists after T4 | T4 | **HW-GATE** *(batched with T4)* | n/a |
| T12 | D1/skwasm spike, time-boxed, on a throwaway branch | T0 | **HW-GATE**, mandatory on-machine smoke test before any merge consideration | Any crash/white-screen on target Chrome → branch discarded, canvaskit path stays, logged and closed |
| T13 | C2/C3/D2 (defer coach refresh; gzip serving if not done in T0; font subsetting) | — | AUTO | none |
| T14 | **Finalization** — strip `[heartwood-frames]` + `hw-boot-done` instrumentation; draft `docs/Retrospectives.md` entry + DecisionLog entries for every decision actually adopted (COEP/COOP headers, shadow budget, DPR override if T2 adopted it, blur-once approach) — **drafted for review, never written until approved** | all others | AUTO to draft, then manual approval (permission gate, not a measurement one) | n/a |

## Follow-up re-entry rule

If a HW-GATE measurement resolves as "follow-up implementation needed" (e.g.
T11 shorten hovers, T2 DPR override), the ticket re-enters the loop from the
top (planner → implementer → verifier → reviewer) with that follow-up as its
scope, then re-measures before being marked done.

## Commit gate

After each reviewer APPROVE, and again after each batched HW-GATE resolves as
"proceed," the orchestrator proposes ONE grouped commit for explicit user
yes/no. Never auto-commit (repo `opencode.json` already routes `git commit*`
through an ask gate). Storage/Drift-touching diffs get the standard
security-review posture before inclusion.