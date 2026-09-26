# AMIF — Repo-Tailoring Audit (2026-09-26)

**Audited:** `tools/Heartwood – Agentic Milestone Implementation Framework (1).html` (v1.1, 611 content lines) + `tools/Heartwood – AMIF Agent Prompt Library.html` (v1.1, 594 content lines).
**Against:** the current repo reality (post gen-2 pipeline close, 2026-09-26) — AGENTS.md, TOOLING.md, opencode.json, .opencode/agent/, design/ conventions, Roadmap.md milestones, docs/ set, and the lessons of the just-completed gen-2 integration run.

## Verdict: PASS-WITH-FIXES — the framework is sound; 8 repo-alignment fixes + 1 experience-encoded improvement + 4 open decisions.

---

## Part 1 — Internal consistency (framework doc)

| Check | Result |
|---|---|
| Phase numbering (0–12) | ✅ PASS — Phase 7 Optimization, 8 Optimization-Audit, 9 Security, 10 Heuristics, 11 Dev-Harness (cross-cutting), 12 Final; v1.1 changelog's renumbering claims verified against the body |
| Human gates vs phases | ✅ PASS — 6 gates: G1 after P2, G2 after P4, G3 after P6, G4 after P7 (structural only), G5 after P9, G6 after P12; §6 table matches the phase bodies |
| §5 Sub-Agent Map vs phase bodies | ✅ PASS — code-reviewer→P4/P8, code-simplifier→P7, perf suite→P7 routing check, Strix→P9, OpenDesign atoms→P6 handoff, context7→P1/P3, playwright→P4/P11, drive→export/sync — all match |
| §7 templates vs prompt-library OUTPUT sections | ✅ PASS — PLAN/OPTIMIZATION/SECURITY skeletons match the prompt OUTPUT blocks |
| Prompt library §0–§10 ↔ framework roles | ✅ PASS — all 10 prompt sections map 1:1 to framework phases; no orphan prompts, no missing prompts |
| Version lockstep note | ✅ PASS — both files v1.1, cross-referenced |

## Part 2 — Internal consistency (prompt library)

| Check | Result |
|---|---|
| Shared Context Block prepend rule | ✅ PASS |
| SELF-CHECK + ESCALATE on every prompt | ✅ PASS — all 10 role prompts carry both blocks |
| Cross-refs to AMIF.md sections | ✅ PASS — §11 (dev harness), §7.1/7.3/7.4 (templates), §5 (map) all resolve |
| Hard rules as prohibitions | ✅ PASS — consistent style, no soft language |

## Part 3 — Repo-reality alignment (the fixes)

| # | Finding | Severity | Fix |
|---|---|---|---|
| R1 | **Implementer model "GLM 5.3 Flash" does not exist in this environment** — opencode resolves only `deepseek-v4-flash`, `deepseek-v4-flash-vision-exp`, `deepseek-v4.1-flash`. The plan/implement separation control (a stated design principle) would silently collapse if the model can't load | **CRITICAL** | Set Planner = `deepseek-v4.1-flash`, Implementer = `deepseek-v4-flash` — different models, the adversarial separation is preserved; note GLM is swappable later (framework already says models are configuration) |
| R2 | **TEMP-PLANNING pipeline status stale** — framework §5 says "Already closed 2026-08-20". The gen-2 pipeline closed TODAY (2026-09-26) | HIGH | Update to two generations + archive paths (`audits/TEMP-PLANNING-2026-08-20.md`, `audits/TEMP-PLANNING-2026-09-26.md`) |
| R3 | **STATE.md scope source says "Roadmap.md / TEMP-PLANNING derivatives"** — TEMP-PLANNING is archived; derivations live in docs/ | MEDIUM | Point at `Roadmap.md` + `docs/`; archived ledgers in `audits/` as provenance-only |
| R4 | **GUI Reference Gate path wrong for future milestones** — framework says `design/heartwood/<milestone>/*.html`; the repo convention is `design/<milestone>/<mockup>.html` (M0 precedent: `design/heartwood/heartwood-m0.html`) | HIGH | Fix path convention in Phase 5 + gate language |
| R5 | **Perf suite unnamed** — framework says "existing 5-agent perf suite"; the repo's agents are `.opencode/agent/perf-planner / perf-implementer / perf-reviewer / perf-verifier / perf-escalator / perf-orchestrator` | MEDIUM | Name the actual agents so the routing check can resolve them |
| R6 | **Shared Context Block omits the open-design MCP** — it is live in opencode.json and is the GUI-polish track's tool; the block lists only context7/playwright/drive | MEDIUM | Add open-design MCP to the tooling list |
| R7 | **Parallel-dispatch lessons not encoded** — the gen-2 run proved: parallel agents must get disjoint D-number ranges + disjoint file sets, and batches of 5 cancel (use ≤3). The framework's "parallel-safe segment" rule lacks these teeth | MEDIUM | Add the learned guardrails to Phase 3 + Implementer + Sub-Agent Dispatch Wrapper prompts |
| R8 | **Filenames are HTML with em-dash + "(1)" download artifact** — not drop-in as `AMIF.md`/`AMIF-PROMPTS.md` as the framework intends | MEDIUM | Convert to Markdown, canonical names, `doc draft framework/` location, version bump v1.2 with changelog entry |

## Part 4 — Open decisions requiring the human (framework §10, surfaced verbatim)

1. **Recursion caps** — Phase 2 caps plan-audit recursion at 3 rounds; confirm or set your own.
2. **Gate-fatigue trade-off** — Phases 4/8/10 fold into fewer gates; confirm.
3. **Strix/Docker gating** — confirmed M3+; flag if an earlier milestone touches auth/export surfaces.
4. **Doc-write approval mechanics** — do `docs/agentic-runs/` reports count as "documentation" needing approval (recommend: yes, batch-approved at Phase 12) or are they exempt run-logs?

## Part 5 — What is genuinely good (no change)

- Phase 0 STATE.md anti-redo protocol (claims ≠ facts) — proven wisdom, keep.
- Plan/implement model separation as a *control*, not preference — keep (fix R1 preserves it).
- Six gates each scoped to a human-only decision — keep.
- Recursive-audit-before-human-review philosophy — matches the project's relentless-audit directive.
- Post-Ship Incident Protocol — directly answers the "what if a shipped milestone breaks" gap; keep.
- $0 budget, layer-boundary inheritance, no-doc-write-without-approval standing rules — all consistent with AGENTS.md.

---

*Audit closes. Fixes R1–R8 to be applied in the conversion pass; then pipeline setup; then a separate setup audit.*