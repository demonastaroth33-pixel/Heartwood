# AMIF Setup Audit — fresh-eyes verification (2026-09-26)

**Auditor:** fresh-eyes pass, zero context shared with the setup sessions.
**Scope:** the 8 requested checks against the shipped AMIF pipeline.
**Method:** read every target file in full; verified every repo-alignment claim
against the actual filesystem (`opencode models`, `opencode.json`, design/,
.opencode/agent/, audits/, tools/). No files edited.

---

## Check 1 — `doc draft framework/AMIF.md` (v1.2) — **PASS (1 minor note)**

### Internal consistency
| Sub-check | Result |
|---|---|
| Phase numbering 0–12 | PASS — Phases 0–12 all present and correctly numbered; Phase 11 correctly framed as cross-cutting (not sequential); Phase 12 = final |
| 6 human gates | PASS — G1 after P2 (L95), G2 after P4 (L114), G3 after P6 (L132), G4 after P7 structural-only (L146), G5 after P9 (L168), G6 after P12 (L195). §6 summary table (L218–225) matches the phase bodies exactly |
| §5 sub-agent map vs phase bodies | PASS — code-reviewer→P4/P8, code-simplifier→P7, perf suite→P7 routing check, Strix→P9, security-threat-model→P9, OpenDesign atoms→P6 handoff, context7→P1/P3, playwright→P4/P11, drive→export/sync, subagent skills→P3 — every row matches a phase body |
| §7 templates vs prompt-library OUTPUT blocks | PASS — PLAN.md (7.1), OPTIMIZATION-REPORT.md (7.3), SECURITY-REPORT.md (7.4) skeletons match the §1/§2/§3, §7, §8 OUTPUT blocks in AMIF-PROMPTS.md |

### Repo-alignment claims
| Claim | Verified |
|---|---|
| Model table: Planner `deepseek-v4.1-flash` / Implementer `deepseek-v4-flash` are DIFFERENT models | PASS — confirmed via `opencode models`: both `opencode-go/deepseek-v4.1-flash` and `opencode-go/deepseek-v4-flash` resolve; the separation control is real |
| GUI gate path `design/<milestone>/<mockup>.html`, M0 precedent `design/heartwood/heartwood-m0.html` | PASS — file exists; convention matches repo |
| TEMP-PLANNING closure: two generations, audits/ archive paths | PASS — `audits/TEMP-PLANNING-2026-08-20.md` + `audits/TEMP-PLANNING-2026-09-26.md` + the `Integration*-<date>.md` sets for both dates all exist |
| perf-* agent names | PASS — `.opencode/agent/perf-planner / perf-implementer / perf-reviewer / perf-verifier / perf-escalator / perf-orchestrator` all exist |
| Parallel-dispatch guardrails in Phase 3 | PASS — L101–102: file-disjoint, pre-assigned disjoint ID ranges, ≤3 concurrent cap, mid-flight shared-state escalation |
| No stale gen-1-only closure / no wrong design path | PASS — §5 row (L210) and §0 (L15) both carry the two-generation + fixed-path language |

Minor note: R1's *premise* in `audits/AMIF-Repo-Audit.md` ("GLM 5.3 Flash does
not exist in this environment") is contradicted by the live `opencode models`
output (`opencode-go/glm-5.3-flash` IS listed). The shipped fix is still
correct and valid (two distinct deepseek models preserve the separation
control), so this is a documentation-accuracy note, not a functional one.

## Check 2 — `doc draft framework/AMIF-PROMPTS.md` (v1.2) — **PASS**

| Sub-check | Result |
|---|---|
| All 11 sections present (§0 + §1–§10) | PASS — verified headings in both the MD and the source HTML |
| Each role prompt has IDENTITY/READ/HARD RULES/OUTPUT/SELF-CHECK/ESCALATE | PASS — all 10 role prompts (§1–§10) carry SELF-CHECK + ESCALATE; §0 is a prepended shared-context block by design (no identity blocks needed) |
| §0 names all four live MCPs | PASS — context7 (L40), playwright (L44), drive (L46), open-design (L49) — matches opencode.json, where all four are `enabled: true` |
| §4 Implementer carries parallel-dispatch guardrails | PASS — L191 (file-disjoint, pre-assigned ranges, ≤3 cap, escalate-on-shared-state) |
| §10 wrapper carries the pre-assigned-range rule | PASS — L380 ("use ONLY the range pre-assigned to you... never auto-number") |
| Version lockstep | PASS — both files v1.2, cross-referenced (AMIF.md L4, AMIF-PROMPTS.md L3) |

## Check 3 — Agent files — **PASS**

| File | Frontmatter | Model | Prompt sections |
|---|---|---|---|
| amif-planner.md | valid (description/mode:subagent/model) | `opencode-go/deepseek-v4.1-flash` | §1–3 (Phases 0/1/2) — correct |
| amif-implementer.md | valid | `opencode-go/deepseek-v4-flash` | §4 (Phase 3) + §10 wrapper — correct |
| amif-security-auditor.md | valid | `opencode-go/deepseek-v4-flash` | §8 (Phase 9) — correct |
| amif-heuristics-tester.md | valid | `opencode-go/deepseek-v4-flash` | §9 (Phase 10) — correct |

- Model values match the AMIF.md model table (planner v4.1, others v4-flash).
- Provider prefix `opencode-go/...` matches the working-pipeline agent
  `a1a-indexer.md` (also `opencode-go/deepseek-v4-flash`).
- code-reviewer.md + code-simplifier.md exist and are referenced by AMIF
  (Phases 4/8 + 7) and listed in TOOLING.md §4.

## Check 4 — `docs/agentic-runs/STATE-TEMPLATE.md` — **PASS**

- Present at `docs/agentic-runs/STATE-TEMPLATE.md`.
- Matches AMIF.md §3 schema: Milestone/Status line, Scope items w/ evidence
  field, Deviations, Carry-forward — plus the `## Incidents` section mandated
  by §8 (Post-Ship Incident Protocol), so it is a superset consistent with the
  framework. Scope-items header uses the fixed provenance wording
  (Roadmap/docs live, audits/ provenance-only).

## Check 5 — AGENTS.md — **PASS**

- Doc-read map has the AMIF entry (L32–34: process/phases/gates → AMIF.md +
  AMIF-PROMPTS.md, live run state in docs/agentic-runs/).
- Commands section has the AMIF invocation block (L153–158: roles + artifact
  paths + gates 1–6 load-bearing).
- No broken formatting in the touched regions.

## Check 6 — TOOLING.md — **PASS (1 minor flag)**

- §4 subagents table lists all four amif-* agents + code-reviewer +
  code-simplifier + perf-* suite, and marks `a1a–g` as CLOSED with the
  two-generation note (L70). PASS.
- §6 rituals has the AMIF row (L105). PASS.
- FLAG (minor, out of strict check-6 scope but relevant): TOOLING.md §5 MCP
  table (L74–78) lists only context7/playwright/drive — **open-design is
  absent**, even though AGENTS.md, opencode.json, and AMIF-PROMPTS §0 all treat
  it as a live, enabled MCP. Since §0 tells agents "TOOLING.md is the
  authoritative live list," an agent cross-checking might conclude open-design
  isn't live. Recommend adding the row.

## Check 7 — `audits/AMIF-Repo-Audit.md` R1–R8 → fixes — **PASS**

| Finding | Fix verified in shipped files |
|---|---|
| R1 model table | AMIF.md §2 (Planner v4.1 / Implementer v4) + matching agent frontmatter. Premise note above. |
| R2 TEMP-PLANNING status | AMIF.md §5 L210 — two generations + archive paths; archive files exist |
| R3 STATE scope source | AMIF.md §3 L52–53 + STATE-TEMPLATE L12–13 — Roadmap/docs live, audits/ provenance-only |
| R4 GUI gate path | AMIF.md §0 L15 + Phase 5 L118 — `design/<milestone>/<mockup>.html`, M0 precedent named |
| R5 perf names | AMIF.md §5 L207 + AMIF-PROMPTS §7 — actual `.opencode/agent/perf-*` names |
| R6 open-design MCP | AMIF-PROMPTS §0 L49–51 + AMIF.md §5 L214 — added to tooling lists |
| R7 parallel guardrails | AMIF.md Phase 3 L101–102 + AMIF-PROMPTS §4 L191 + §10 wrapper L380 |
| R8 markdown conversion | Both v1.2 MD files exist at `doc draft framework/` with conversion noted in changelogs |

## Check 8 — HTML source files in tools/ — **PASS (1 doc-accuracy note)**

- Both files present with the em-dash download-artifact filenames
  (`Heartwood — Agentic Milestone Implementation Framework (1).html`,
  `Heartwood — AMIF Agent Prompt Library.html`).
- Content fidelity spot-checks (HTML → MD), verbatim-ish:
  - **Phase 9 tooling list** (HTML L184–187 → AMIF.md L161–164): the full
    Strix-suite chain (find → web-app → api → application → owasp-top-10 →
    fix → ci-scanning), owasp pre-M3, security-and-hardening scope, and
    security-threat-model once-per-milestone all match.
  - **§10 Open decisions** (HTML L399–402 → AMIF.md L295–298): all four
    decisions match verbatim.
  - §10 wrapper (HTML L605–638 → AMIF-PROMPTS §10): structure preserved; the
    pre-assigned-range rule is correctly ABSENT from the v1.1 HTML and present
    in the v1.2 MD (a genuine v1.2 addition, confirmed against the v1.2
    changelog).
  - HTML is confirmed v1.1 (contains GLM 5.3 Flash, old design path, old
    perf wording, "Already closed 2026-08-20") — i.e., the source artifacts
    are the untouched v1.1 and the fixes landed only in the v1.2 MD, as
    intended.
- DOC-ACCURACY NOTE: the audit recorded "611 content lines" (framework) and
  "594 content lines" (prompt). On-disk reality: framework HTML = 413 total
  lines (406 non-boilerplate); prompt HTML = 657 total (595 non-boilerplate).
  The recorded counts do not match the files; this does not affect the
  conversion (content coverage verified above), but the header line-counts in
  the audit are unreliable.

---

## Findings list

1. **F1 (note, non-blocking)** — R1's premise ("GLM 5.3 Flash does not exist")
   is wrong per the live model list; the shipped deepseek separation fix
   stands regardless.
2. **F2 (minor flag)** — TOOLING.md §5 MCP table omits open-design despite it
   being enabled in opencode.json and referenced by AGENTS.md + AMIF-PROMPTS §0.
3. **F3 (doc-accuracy, non-blocking)** — AMIF-Repo-Audit.md header line-counts
   (611/594) don't match the on-disk HTML files (413/657).

## Final verdict: **PASS — pipeline-ready**

All 8 checks pass. The framework and prompt library are internally consistent,
repo-aligned, version-locked at v1.2, the four agent files are correctly wired
with the right models and prompt sections, STATE-TEMPLATE matches the §3
schema, AGENTS.md + TOOLING.md reference the pipeline correctly, all R1–R8
fixes trace to shipped files, and the HTML→MD conversions captured full
content. The three findings are cosmetic/documentation-level and do not block
first use; F2 is worth fixing when TOOLING.md is next touched.