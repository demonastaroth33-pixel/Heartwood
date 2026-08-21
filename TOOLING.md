# TOOLING.md — Your Dev Stack Handbook

What's installed, where it lives, and when to use it. The AI reads AGENTS.md;
this handbook is for YOU — the human deciding when to reach for what.

All skills activate automatically when the AI sees a matching task (trigger
words are in each skill's description). You almost never "run" a skill —
you recognize when one is doing its job, or nudge the AI toward it.

---

## 1. Always-on rules (AGENTS.md)

| Rule | What it does for you |
|---|---|
| Karpathy ×4 | Think-before-coding, simplicity, surgical changes, goal-driven execution — the anti-stupid code of conduct |
| Security gate | Before any commit touching auth/storage/import-export: owasp review → findings shown → YOUR approval needed |
| context7 mandate | AI must fetch live library docs (drift, riverpod, flutter) instead of answering from memory |
| Permission gates | opencode asks YOU before: git commit/push, flutter run/build, every file edit. flutter test runs free |

## 2. Active skills (.opencode/skills/)

| Skill | When it kicks in |
|---|---|
| test-driven-development | Any feature/bugfix: writes the failing test first, then code |
| verification-before-completion | Whenever the AI is about to claim "done/fixed": forces evidence |
| systematic-debugging | Any bug/test failure: root cause first, then fix, then prove |
| requesting-code-review | Before the AI hands work off: pre-review checklist |
| receiving-code-review | When review feedback comes back: how to respond |
| writing-skills | When creating/editing a skill |
| skill-creator | Same job, Anthropic's factory version (evals, iteration loops) |
| brainstorming | New-task clarification: may ask you questions before coding |
| writing-plans / executing-plans | Big tasks: plan-file → batched execution with checkpoints |
| subagent-driven-development | Dispatching fresh subagents per task with 2-stage review |
| dispatching-parallel-agents | Running several independent jobs at once |
| owasp-security | Any auth/storage/user-input/import work: OWASP review checklist |

## 3. Skills OFF by default (.opencode/skills-off/)

| Skill | When to enable |
|---|---|
| frontend-design | M0 dashboard / journal / habits UI work |
| impeccable | Same, design-QA (audit/polish/critique) |
| mobbin-search | Real-app screen search: streak patterns, diary lists, storage meters |
| mobbin-capture | Save specific Mobbin flows/screens into a local reference store |
| mobbin-prompts | Reference-pack prompts for implementation work |
| mobbin-visuals | Contact sheets + visual-similarity lookups |
| mobbin-flow-architect | Study how a top app handles a flow → adapt as a spec (needs your sign-off) |

**Toggle ritual:** move the folder from `.opencode/skills-off/` into
`.opencode/skills/`, restart opencode, work the UI milestone, then move it
back. UIUX.md always wins over these skills.

**Mobbin notes:** runs on Mobbin's unofficial internal API — best-effort
reference, may break upstream. Auth once via `mobbin-mcp auth` (browser
login, Mobbin account with free tier). Ask for 3-5 screens per UI block,
never whole libraries.

## 4. Subagents (.opencode/agent/)

| Agent | What it does | Your move |
|---|---|---|
| code-reviewer | Audits the uncommitted diff: bugs, security, AGENTS.md compliance. Can't edit anything | Type `/code-review` in opencode |
| code-simplifier | Cleans up recently changed code (nesting, naming, ternaries) without changing behavior | Run after milestone tests are green, before your diff read |
| a1a–g (pipeline) | TEMP-PLANNING integration pipeline stages (census → ledger → audit). Docs work only | Used during that pipeline, ignore otherwise |

## 5. MCP servers (opencode.json)

| Server | What the AI gains | Status |
|---|---|---|
| context7 | Live library docs (drift, riverpod, flutter…) | ✅ active, free API key set |
| playwright | Drives your installed Chrome: click/fill/screenshot/logs | ✅ active |
| drive | Your Google Drive (read + write-own-files only) | ✅ active, OAuth done |

**Mobbin (NOT an MCP — a CLI + off-by-default skills):** `mobbin-mcp` v1.0.19
powers the 5 `mobbin-*` skills (search / prompts / visuals / capture /
flow-architect) in `.opencode/skills/` during UI milestones. No server schema
is loaded every session — the skills call the CLI directly, so Mobbin never
appears in the MCP list, by design. Auth is a one-time browser login
(`mobbin-mcp auth` — paste the cookie from mobbin.com console), never stored
in the repo. Use for 3–5 real reference screens per UI block (nav shell,
streak display, diary list, storage meter); treat results as best-effort
reference (unofficial API); UIUX.md wins on any conflict. Move the folders
back to `.opencode/skills-off/` when the UI milestone ends.

**Playwright's two jobs:** (1) M0 PWA persistence gate — create data → kill
browser → relaunch → assert data survived; (2) export→wipe→restore round
-trip through the real UI. NOT for widget assertions (that's
integration_test) and NOT for iPhone (manual, always).

**Drive's three jobs:** (1) P2 backup upload/restore testing, (2) vault
folder inspection at P3, (3) dropping fixtures. **Rules:** only
`/PersonalOS-dev` folder, credentials live in `~/.config/google-drive-mcp/`
(never committed), separate OAuth client from the app's future one.

## 6. Rituals (the compounding loop)

| Ritual | When | Where |
|---|---|---|
| Retrospective | After every milestone phase | docs/Retrospectives.md — write what went wrong, encode one lesson |
| DecisionLog entry | Any new decision (incl. tooling changes) | docs/DecisionLog.md |

## 7. The one-sentence cheat sheet

- **AI writing code** → TDD + verification skills are watching
- **Something's broken** → systematic-debugging
- **Big feature** → writing-plans → executing-plans
- **Before you review** → `/code-review`
- **After tests green** → code-simplifier, then read the diff
- **UI milestone** → toggle frontend-design + impeccable + mobbin-* ON
- **Library API unsure** → context7
- **Browser boundary** → playwright
- **Backup/restore testing** → drive MCP
- **Milestone done** → retrospective + encode a lesson