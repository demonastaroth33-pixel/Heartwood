# Heartwood — Agentic Milestone Implementation Framework (AMIF)

**Version 1.2** — Draft for human approval — Applies to all Heartwood/PersonalOS milestones.
Companion file: `AMIF-PROMPTS.md` v1.2 — keep both version numbers in lockstep; a phase/role change in one requires a matching change in the other.

## 0. Purpose & Scope

This framework formalizes the rough 14-step process you wrote into a repeatable, auditable, model-agnostic pipeline that any milestone (M0, M1, M2…) runs through, end to end, with hard human gates at every point where irreversible or judgment-heavy decisions happen.

It lives at `doc draft framework/AMIF.md` (+ `AMIF-PROMPTS.md`) and is referenced from `AGENTS.md`. It does **not** replace `AGENTS.md`'s orientation/layer-boundary rules or `TOOLING.md`'s skill reference — it sits above them as the *process* that invokes them in the right order.

Non-negotiable standing rules inherited from project policy (do not re-litigate per milestone):

- Any documentation/decision-log write requires explicit human permission before being written — this framework's own audit outputs are *proposals*, never auto-committed docs.
- GUI implementation is deferred milestone-by-milestone until a reference HTML file exists in `design/<milestone>/` (M0 precedent: `design/heartwood/heartwood-m0.html`). No reference → no GUI phase. Full stop.
- Storage backend, state management (Riverpod), and core architectural decisions already locked are *inputs*, not re-decided per milestone.
- Budget is $0 — every tool/model choice below must stay inside free/already-paid tiers.

## 1. Design Principles

1. **Idempotent by construction.** Every phase must be safely re-runnable. A milestone half-built by a crashed session is a *state*, not a disaster — Phase 1 always starts by reconciling "what exists" against "what's planned."
2. **Human gates are load-bearing, not ceremonial.** Each gate below has a specific *decision the human is uniquely positioned to make* (taste, scope trade-off, risk tolerance, approving irreversible docs writes). Gates are never skipped to save time.
3. **Plan/implement model separation is a control, not a preference.** Using a different model to plan than to implement gives you a built-in adversarial check — the implementer cannot silently reinterpret the planner's intent because it never *wrote* the intent.
4. **Audits are recursive and cheap; human review is expensive.** Push as much verification as possible into automated recursive audit loops so the human only reviews things machines structurally cannot verify (taste, priorities, ambiguous scope calls).
5. **No feature work disguised as optimization, and no optimization disguised as feature work.** Phase 7 (optimization) is behavior-preserving by contract. Anything that changes observable behavior is a feature change and must go back through Phase 1.
6. **Every phase produces an artifact, not just a state change.** Plans, audits, benchmark reports, security reports are all committed to `docs/agentic-runs/<milestone>/` (pending human write-approval) so the whole run is reconstructable later.

## 2. Roles & Model Assignment

| Role | Model | Responsibility | Never does |
|---|---|---|---|
| Planner | DeepSeek V4.1 Flash (`deepseek-v4.1-flash`) | Reads all source docs, produces the execution plan (Phase 1), recursively audits it (Phase 2), re-plans on rejection | Write implementation code |
| Implementer | DeepSeek V4 Flash (`deepseek-v4-flash`) | Executes the approved plan; may spawn sub-agents for independent plan segments | Alter plan scope without flagging back to Planner |
| Security/Heuristics Auditor | Strix suite + OWASP skill (Docker-gated, M3+) / `owasp-security` skill (pre-M3) | Runs the rigorous test phase | Silently patch findings — reports go to Implementer |
| Human (you) | — | Approves plans, resolves ambiguity, reviews corrections, approves docs writes, final milestone sign-off | — |

- **Model names are configuration, not architecture** — if either model is swapped later (e.g. GLM 5.3 Flash becomes available), only this table changes; the pipeline below is model-agnostic. The constraint is that Planner and Implementer must remain *different* models — the separation is the control.
- **GUI polish is a fully separate track, not part of this roster.** AMIF's Implementer builds a bare-bones/functional GUI as part of normal feature work (Phase 1/3) — no visual polish, no reference-matching. The *polished* pass against a reference design happens entirely outside AMIF, in OpenDesign MCP, once a milestone's functional core is done. AMIF does not own GUI-fidelity model assignments; it only owns the gate that decides when a milestone is ready to hand off to that track (§ Phase 6).
- Every role above has a full paste-as-is system prompt in the companion file `AMIF-PROMPTS.md`. Do not invoke any AMIF role from a summary or an ad hoc instruction — use the matching prompt in that file, which encodes the hard rules, read-order, output format, and escalation triggers this document only describes at a high level.

## 3. Milestone State Ledger (the anti-redo mechanism)

Before Phase 1 can run, the system must answer: *what already exists for this milestone?* This is the single most failure-prone part of an agentic pipeline (re-implementing done work, or silently skipping undone work), so it gets its own explicit sub-protocol.

`docs/agentic-runs/<milestone>/STATE.md` — maintained continuously, structure:

```markdown
## Milestone: <id> — <name>
Status: not-started | in-progress | plan-approved | implementing |
        gui-phase | optimizing | security-testing | complete

### Scope items (from Roadmap.md / docs/ — the archived TEMP-PLANNING
### ledgers in audits/ are provenance-only, never live scope)
- [ ] <item id> — <one-line scope> — status: unbuilt|partial|done — evidence: <file/commit/test>
...

### Deviations from original scope (requires human note)
- <item id>: <what changed and why>

### Carry-forward context
- <anything the next phase needs that isn't obvious from code>
```

Phase 1 always opens by: (a) reading `STATE.md` if present, (b) reading actual repo code/tests for the milestone's touched files, (c) diffing claimed-status vs. actual evidence, (d) flagging any mismatch to the human *before* planning continues. This prevents the classic failure mode of a stale status file lying to the planner.

## 4. The Pipeline

Each phase below states: **Input → Actor → Process → Output → Exit condition → Gate?**

### Phase 0 — Intake & State Reconciliation

- **Input:** Milestone id, `Roadmap.md`, all docs in `docs/`, `STATE.md` (if exists), repo source tree.
- **Actor:** Planner.
- **Process:** Reconcile claimed vs actual state per §3. Build a scope manifest — every atomic requirement for this milestone, sourced and citation-linked back to the doc/line it came from (no paraphrase-drift).
- **Output:** `STATE.md` (created/updated), `SCOPE-MANIFEST.md`.
- **Exit condition:** Every scope item has a status and a source citation. No orphaned "vibes-based" requirements.
- **Gate:** No — proceeds automatically into Phase 1, but STATE.md mismatches (if any) are surfaced inline for visibility.

### Phase 1 — Comprehensive Plan Authoring

- **Input:** `SCOPE-MANIFEST.md`, `STATE.md`, relevant architecture/database/UIUX docs, any archived TEMP-PLANNING material still relevant to this milestone (provenance only — `audits/TEMP-PLANNING-2026-09-26.md` for gen-2 decisions, `audits/TEMP-PLANNING-2026-08-20.md` for gen-1).
- **Actor:** Planner.
- **Process:** Read *everything* touching this milestone's scope — not a summary pass, a comprehensive one. Build a detailed, dependency-ordered execution plan. GUI is explicitly scoped as **bare-bones/functional only** at this stage — no visual polish, no animation, no reference-matching (that belongs entirely to the separate OpenDesign polish track, after the Phase 6 handoff). Plan must state: files touched, new files, data model deltas, test plan, and which items reuse existing partial work vs. build fresh.
- **Output:** `PLAN.md` — structured, numbered, with explicit "reused from existing" vs "net new" tagging per item.
- **Exit condition:** Plan traces 1:1 against `SCOPE-MANIFEST.md` with no gaps.
- **Gate:** No (feeds directly into Phase 2's audit).

### Phase 2 — Recursive Plan Audit

- **Input:** `PLAN.md`, `SCOPE-MANIFEST.md`.
- **Actor:** Planner, in a separate self-critique pass (fresh context recommended — don't let the authoring context bias the audit).
- **Process:** Cross-check every scope-manifest item is present in the plan; check for internal contradictions, architectural boundary violations (per `AGENTS.md` layer rules), missing test coverage, and silent scope narrowing. **Recurse:** if the audit finds gaps, Planner revises `PLAN.md` and re-audits. Stop when a full pass finds zero new issues, or after 3 recursion rounds — a 3rd-round unresolved issue escalates to the human rather than looping indefinitely (mirrors the `systematic-debugging` skill's 3-strike rule).
- **Output:** `PLAN-AUDIT.md` (issues found each round + resolutions), final `PLAN.md`.
- **Exit condition:** Clean audit pass, or an explicit escalation note for the human.
- **Gate:** **YES — Human Gate 1.** You review `PLAN.md` + `PLAN-AUDIT.md` and approve, reject, or amend. Nothing is implemented before this.

### Phase 3 — Implementation

- **Input:** Approved `PLAN.md`.
- **Actor:** Implementer (DeepSeek V4 Flash); may dispatch sub-agents (per `subagent-driven-development` / `dispatching-parallel-agents` skills) for independently-scoped plan segments **only** where the plan explicitly marks segments as parallel-safe (no shared file/state touches). Sub-agent use is never silent — each dispatch is logged in `IMPLEMENTATION-LOG.md`.
- **Parallel-dispatch guardrails (learned in the gen-2 integration run):** (a) parallel-safe segments must also be **file-disjoint** — no two in-flight segments may touch the same file, verified at dispatch time, not assumed; (b) if segments assign shared identifiers (D-numbers, keys, ranges), each segment gets a **pre-assigned disjoint range** — collisions from independent auto-numbering are a real failure mode; (c) cap concurrent sub-agents at **3** — larger batches have empirically failed in this environment (5-agent batches cancel); (d) any segment that turns out to share state/files mid-flight stops and escalates — it never runs anyway.
- **Process:** Execute plan tasks in dependency order. TDD where the plan calls for it (`test-driven-development` skill). GUI stays bare-bones per Phase 1 scope — no early polish.
- **Output:** Code changes, `IMPLEMENTATION-LOG.md` (task-by-task status, deviations, sub-agent dispatch record).
- **Exit condition:** All plan tasks marked done or explicitly blocked-with-reason.
- **Gate:** No (feeds Phase 4).

### Phase 4 — Recursive Scope-Landing Audit

- **Input:** `PLAN.md`, `IMPLEMENTATION-LOG.md`, actual code/tests.
- **Actor:** `code-reviewer` subagent + Planner cross-check.
- **Process:** Verify every plan item actually landed in code (not just claimed in the log) — evidence-based, per `verification-before-completion` skill discipline. GUI polish is explicitly out of scope for this audit (exception noted in your original spec — carried forward exactly).
- **Output:** `LANDING-AUDIT.md`.
- **Exit condition:** 100% plan-item landing confirmed, or explicit gap list.
- **Gate:** **YES — Human Gate 2.** You review the landing audit and any gaps/deviations, and accept or request corrections. Corrections loop back to Phase 3.

### Phase 5 — GUI Reference Gate

- **Input:** `design/<milestone>/<mockup>.html` (M0 precedent: `design/heartwood/heartwood-m0.html`).
- **Actor:** System check (no model needed) — this is a hard file-presence gate.
- **Process:** Check whether a reference HTML file exists for this milestone in the design folder.
- **Output:** Pass/fail signal.
- **Exit condition:** File present → proceed to Phase 6. File absent → pipeline pauses here, milestone is marked `gui-blocked` in `STATE.md`, and everything *except* GUI polish (i.e., the milestone's functional core from Phases 1–4) is still considered shippable/testable in bare-bones form.
- **Gate:** Implicit human gate — the reference file itself *is* the human's go-ahead. No separate approval needed once it's placed.

### Phase 6 — Handoff to GUI Polish Track (OpenDesign MCP)

- **Input:** Reference HTML (desktop + mobile variants if both exist), current bare-bones/functional GUI from Phase 3.
- **Actor:** None (AMIF) — this phase is a *handoff boundary*, not an execution phase. GUI polish itself runs entirely inside OpenDesign MCP as its own separate workflow (design-extract / token-map / critique-theater / diff-review / patch-edit, etc.), with its own model/agent choices that AMIF does not prescribe.
- **Process:** AMIF's only responsibility here is confirming the milestone's functional core (Phases 1–4) is landed and stable enough to hand off, then stepping out of the way. The barebones-first-then-polish sequencing is preserved: nothing goes to the OpenDesign polish pass until the functional build is done.
- **Output:** A handoff note in `STATE.md` marking the milestone `gui-handoff` with a pointer to the reference file and the current build.
- **Exit condition:** Handoff note recorded.
- **Gate:** **YES — Human Gate 3.** You decide when/whether to route the milestone into the OpenDesign polish track, and you review the polished result there (outside AMIF) before the milestone is considered visually complete. AMIF resumes ownership at Phase 7 once you bring the polished build back in.

### Phase 7 — Optimization & Simplification

- **Input:** Complete, human-approved milestone (functional + GUI).
- **Actor:** Planner produces the optimization plan; Implementer (with `code-simplifier` subagent) executes.
- **Process:**
  1. **Routing check first:** if this milestone's surface area is rendering/perf-heavy (CanvasKit, animation, list virtualization, etc.), invoke the existing perf-agent suite instead of running generic optimization from scratch — it already owns that workstream (see §5).
  2. **Before-benchmark:** capture concrete, reproducible metrics (frame times on the low-end AMD Radeon R4 target, load times, bundle size, query times — whatever's relevant to the milestone's surface area). Store raw numbers, not vibes.
  3. **Deep-dive optimization/simplification pass:** code simplification, redundant-render elimination, query optimization, dead-code removal, etc. **Hard constraint: zero behavior/feature degradation.** Anything that would change observable behavior is flagged and *excluded* from this phase, logged as a candidate feature-change for a future milestone instead.
  4. **After-benchmark:** same metrics, same methodology, re-measured.
  5. Large/structural changes (e.g. a rendering-pipeline rewrite) are flagged for explicit human approval *before* being executed, not just reported after.
- **Output:** `OPTIMIZATION-REPORT.md` with before/after benchmark table and a clear diff-of-behavior = none assertion (with evidence).
- **Exit condition:** Benchmarks captured both sides; no unresolved behavior-degradation flags.
- **Gate:** **YES — Human Gate 4** (only for the large/structural sub-decisions flagged in step 5; routine simplification doesn't need a separate gate beyond Phase 8's final review, to avoid gate-fatigue on low-risk work).

### Phase 8 — Optimization Audit

- **Input:** `OPTIMIZATION-REPORT.md`, pre/post code diff.
- **Actor:** `code-reviewer` subagent + Planner.
- **Process:** Confirm the "zero behavior change" claim is actually true (test suite still green, manual spot-check of touched surfaces), and that reported benchmark improvements are real/reproducible, not cherry-picked.
- **Output:** `OPTIMIZATION-AUDIT.md`.
- **Exit condition:** Clean pass.
- **Gate:** No (rolls into the final security/heuristics review below for a single combined human read, unless the audit finds something — then it escalates immediately).

### Phase 9 — Security Testing

- **Input:** Full milestone codebase (functional + GUI + optimized).
- **Actor:** Security Auditor.
- **Pre-M3** (Strix/Docker not yet gated on): `owasp-security` skill — OWASP Top 10:2025 + ASVS 5.0 + LLM/agentic top-10 checklist pass.
- **M3 and later:** full Strix suite — `find-security-vulnerabilities-in-code` (white-box) → `web-app-penetration-testing` (black-box) → `api-security-testing` → `application-security-testing` → `owasp-top-10-testing` → `fix-security-vulnerabilities-with-strix` for confirmed issues → `ci-security-scanning-with-strix` wired in going forward.
- `security-and-hardening` skill applied specifically to PWA concerns: storage (Drift/SQLite-WASM), import/export round-trip integrity, offline-auth edge cases, and any LLM-output-handling surfaces (Coach system).
- `security-threat-model` run once per milestone to keep the trust-boundary map current as the app grows.
- **Process:** Rigorous, not a checkbox pass — every finding gets a severity, a reproduction, and either a fix-in-this-phase or an explicit human-accepted-risk note.
- **Output:** `SECURITY-REPORT.md`.
- **Exit condition:** No unresolved Critical/High findings. Medium/Low findings either fixed or explicitly deferred with human sign-off.
- **Gate:** **YES — Human Gate 5.** Especially for any deferred finding — deferral is a human risk decision, never an agent's call.

### Phase 10 — Heuristics & Cross-Milestone Consistency Testing

*(This is the phase your notes flagged as needing to exist "in a smart rigorous manner" without fully specifying — formalized here.)*

- **Input:** This milestone's surfaces + any prior milestone's surfaces it interacts with (e.g. habits → coach → gamification).
- **Actor:** Planner (test design) + Implementer (execution) using the developer testing harness from Phase 11.
- **Process:** Not unit-test coverage (that's TDD's job in Phase 3) — this is *behavioral/UX heuristics*: Nielsen-style usability heuristics pass, data-consistency checks across features that share state (e.g. does a bulk→cut phase change actually stay cohesive across workout/calorie/gamification as required), and regression heuristics against previously-shipped milestones to catch cross-milestone drift.
- **Output:** `HEURISTICS-REPORT.md`.
- **Exit condition:** No unresolved heuristic violations affecting core flows.
- **Gate:** Rolls into Human Gate 6 (final review) unless a violation is severe enough to warrant immediate escalation.

### Phase 11 — Developer Testing Harness

*(Cross-cutting requirement, not a sequential phase — built alongside Phase 3, verified here.)*

- **Requirement:** Every feature, including GUI, ships with a way for you to test it directly: seeded/fixture data generators, a dev-only route or flag to jump straight to edge-case states (empty state, max-storage state, streak-broken state, etc.), and a reset-to-seed action. This is checked as an exit criterion of Phase 4's landing audit, not bolted on afterward.
- **Output:** `dev/seed_data.dart` (or milestone-appropriate equivalent), documented in `DevelopmentWorkflow.md` (pending your write-approval).

### Phase 12 — Final Human Review & Milestone Close

- **Input:** Everything above — `PLAN.md`, all audit reports, `OPTIMIZATION-REPORT.md`, `SECURITY-REPORT.md`, `HEURISTICS-REPORT.md`, plus a pointer to the OpenDesign polish outcome if that track has run.
- **Actor:** Human.
- **Process:** Final pass over the whole run. This is the only point where you're asked to read *everything* — every prior gate was scoped narrowly on purpose so this final read is a confirmation, not a first encounter.
- **Output:** `STATE.md` updated to `complete`; any approved doc writes committed (per the standing permission rule).
- **Exit condition:** Your explicit sign-off.
- **Gate:** **YES — Human Gate 6 (final).**

## 5. Sub-Agent Orchestration Map

| Pipeline need | Existing subagent/skill | Notes |
|---|---|---|
| Parallel independent plan segments | `subagent-driven-development`, `dispatching-parallel-agents` | Only for plan-marked parallel-safe segments, ≤3 concurrent, file-disjoint, pre-assigned ID ranges (see Phase 3 guardrails) |
| Plan authoring/audit | Planner model directly (DeepSeek V4.1 Flash) | No subagent needed — it's the top-level actor |
| Code review after implementation | `code-reviewer` subagent | Phase 4, Phase 8 |
| Post-milestone simplification | `code-simplifier` subagent | Phase 7 |
| GUI polish (fully separate track) | OpenDesign MCP atoms — `design-extract`, `token-map`, `critique-theater`, `diff-review`, `patch-edit`, etc. | Runs entirely outside AMIF, after Phase 6 handoff |
| Design token/reference extraction | OpenDesign atoms: `design-extract`, `token-map`, `diff-review`, `patch-edit` | Available if the reference HTML needs token extraction rather than pure visual diffing |
| Performance workstream | existing perf-agent suite — `.opencode/agent/perf-planner`, `perf-implementer`, `perf-reviewer`, `perf-verifier`, `perf-escalator` (+ `perf-orchestrator`) | This is your *already-built* Phase 7 engine for the CanvasKit/rendering workstream specifically — AMIF's Phase 7 should invoke it rather than duplicate it for perf-specific milestones |
| Security | Strix 9-skill suite (M3+), `owasp-security` (pre-M3) | Phase 9 |
| Threat modeling | `security-threat-model` | Phase 9, run once per milestone |
| Doc integration (historical, closed) | TEMP-PLANNING 12-stage pipeline | Closed in two generations: gen-1 2026-08-20 + gen-2 2026-09-26. Archives: `audits/TEMP-PLANNING-2026-08-20.md` + `audits/TEMP-PLANNING-2026-09-26.md` + their `Integration*-<date>.md` sets. Not part of ongoing AMIF — listed here only so it isn't confused with this framework |
| Library API grounding | `context7` MCP | Available throughout Phases 1 and 3 to prevent hallucinated Flutter/Riverpod/Drift/sqlite3 API usage |
| Browser/PWA verification | `playwright` MCP | Phase 4 (persistence/round-trip checks), Phase 11 (dev harness verification); GUI screenshot capture belongs to the separate OpenDesign polish track |
| Dev-scoped Drive testing | `drive` MCP (`/PersonalOS-dev` only) | Wherever export/sync logic is touched |
| Design-system mockups (dev) | `open-design` MCP (local daemon) | The GUI-polish track's engine; available in any phase for reference/mockup work |

## 6. Human Gate Summary (quick reference)

| Gate | After Phase | What you're deciding |
|---|---|---|
| 1 | 2 — Plan Audit | Is this the right plan? |
| 2 | 4 — Landing Audit | Did it actually land as planned? Accept deviations? |
| 3 | 6 — GUI Handoff | Route this milestone into the separate OpenDesign polish track, and later accept the polished result (reviewed there, not in AMIF) |
| 4 | 7 — Optimization (structural only) | Approve large/structural optimization changes before execution |
| 5 | 9 — Security | Accept any deferred medium/low findings? |
| 6 | 12 — Final | Ship the milestone |

Six gates, each scoped to a decision only you can make. Everything else is designed to resolve itself through recursive audit before it reaches you.

## 7. Templates

### 7.1 `PLAN.md` skeleton

```markdown
# Milestone <id> Execution Plan
## Scope traceability
- <scope item> → <plan section> → reused|net-new
## Dependency-ordered tasks
1. [ ] Task — files touched — reuse note — test plan
...
## Explicit non-scope (deferred)
- <item> — reason — target milestone
## Risk notes
- <anything ambiguous the human should know before approving>
```

### 7.2 GUI polish artifacts

Not templated here — the polish pass (fidelity diffing, reference comparison, round-by-round fixes) runs entirely inside OpenDesign MCP and produces its own artifacts there. AMIF only records the handoff/return pointers in `STATE.md`.

### 7.3 `OPTIMIZATION-REPORT.md` skeleton

```markdown
# Optimization Report — Milestone <id>
## Before benchmarks
| Metric | Value | Method |
## Changes made
- <change> — rationale — behavior-preserving evidence
## After benchmarks
| Metric | Value | Delta |
## Excluded (would change behavior)
- <candidate> — why excluded — suggested future milestone
```

### 7.4 `SECURITY-REPORT.md` skeleton

```markdown
# Security Report — Milestone <id>
## Findings
| Severity | Area | Description | Status: fixed|deferred | Human sign-off |
## Threat model delta
- <new trust boundaries or attack paths introduced this milestone>
```

## 8. Post-Ship Incident Protocol

The pipeline above assumes forward progress. It also needs an answer for what happens when something is found *after* Human Gate 6 has already closed a milestone — a regression another milestone's work exposes, a security finding that surfaces later, a heuristics violation a real usage session reveals. This is not a failure of the framework; a pipeline that never needed this section would just be one that hadn't shipped enough yet.

1. **Classify severity first, fix second.** Any post-ship finding gets the same severity scale as Phase 9 (Critical/High/Medium/Low) before anyone touches code.
2. **Critical/High** (data loss risk, security vulnerability, core-flow breakage): treat as an unscheduled re-entry into the pipeline at Phase 1, scoped narrowly to the fix — full plan → audit → implement → landing-audit cycle, just small. Do not hot-patch outside the pipeline even under time pressure; an unaudited hotfix is exactly the kind of untracked change this framework exists to prevent.
3. **Medium/Low:** logged as a new scope item against the milestone that most naturally owns the affected surface, and picked up in that milestone's next normal Phase 1 pass — no unscheduled re-entry needed.
4. `STATE.md` gets an `## Incidents` section the moment any post-ship finding is logged, regardless of severity, so the milestone's history stays honest even after it was marked `complete`.
5. **The human is notified immediately for Critical/High**, before any fix work starts — this mirrors Phase 9's rule that deferral/acceptance of risk is never an agent's call.

## 9. Glossary

- **Barebones/functional GUI** — a GUI implementation that satisfies the milestone's functional requirements (the right screens, the right data, the right navigation) with no attention to visual polish, animation, or pixel-level reference matching. Produced in Phase 3; superseded by the OpenDesign polish pass later.
- **Net-new vs. reused** — a plan-task tag from Phase 1. Net-new means built from scratch this milestone; reused means the task depends on/wraps something Phase 0 confirmed already exists — it is never re-implemented.
- **Behavior-preserving** — a Phase 7 change qualifies only if no user-observable output, timing-sensitive behavior, or data shape changes. "Basically the same" does not qualify; only "provably the same" does.
- **Parallel-safe segment** — a plan segment explicitly marked by the Planner as touching no files/state any other in-flight segment touches. Only these may be dispatched to sub-agents concurrently (≤3, file-disjoint, pre-assigned ID ranges).
- **Blocked-with-reason / deviated-with-reason** — the two acceptable non-"done" statuses in `IMPLEMENTATION-LOG.md`. A silent gap (neither status, task just missing) is always a Phase 4 finding.
- **Unverified (Phase 0 status)** — a scope item's implementation status when `STATE.md` claims something but no code/test evidence confirms it. Treated as "unbuilt" for planning purposes until evidence appears.

## 10. Open Decisions Requiring Your Input

1. **Recursion caps:** Phase 2 caps automatic recursion at 3 rounds for plan audit — confirm this threshold or set your own. (GUI-fidelity recursion is now owned by the separate OpenDesign track and isn't AMIF's cap to set.)
2. **Gate-fatigue trade-off:** Phases 4/8/10 are currently folded toward fewer, better-scoped gates rather than a gate after every phase. Confirm this matches your intent, or specify where you want tighter checkpoints.
3. **Strix/Docker gating:** confirmed M3+ per your notes — flag if any earlier milestone touches high-risk surfaces (auth, data export) enough to warrant pulling Strix forward.
4. **Doc-write approval mechanics:** this framework produces a lot of reports under `docs/agentic-runs/` — confirm whether *those* count as "documentation" under your standing approval rule (recommend: yes, batch-approved at Phase 12) or whether they're exempt as run-logs rather than project docs.

## Changelog

- **v1.2** — Repo-tailored (2026-09-26): model assignments set to the environment's available models (Planner `deepseek-v4.1-flash`, Implementer `deepseek-v4-flash` — separation preserved, GLM swappable later); TEMP-PLANNING status updated to two closed generations with archive paths; GUI Reference Gate path fixed to the repo convention (`design/<milestone>/<mockup>.html`, M0 precedent named); perf suite row names the actual `.opencode/agent/perf-*` agents; `open-design` MCP added to the orchestration map; Phase 3 gains the parallel-dispatch guardrails learned in the gen-2 integration run (≤3 concurrent, file-disjoint, pre-assigned ID ranges); converted from HTML to Markdown at `doc draft framework/AMIF.md`.
- **v1.1** — GUI Builder/Critic roles removed from AMIF's roster; Phase 6 redefined as a handoff-only boundary to the separate OpenDesign polish track (functional-build-first, polish-later preserved). Added companion `AMIF-PROMPTS.md`. Added Post-Ship Incident Protocol (§8) and Glossary (§9). Fixed stale phase-number references (optimization is Phase 7, not Phase 10; GUI reference-matching is OpenDesign's job, not "Phase 8"; `context7` MCP usage corrected to Phases 1/3 only).
- **v1.0** — Initial formalization of the 14-step process into the 12-phase pipeline, roles, state ledger, sub-agent map, human gates, and templates.

*This document is itself a plan pending Human Gate 0 (framework approval) before any milestone runs through it.*