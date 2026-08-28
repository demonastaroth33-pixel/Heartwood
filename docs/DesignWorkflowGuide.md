# PersonalOS — Design & Mockup Workflow (Friendly Guide)

> Read this when: making mockups, using Open Design, or wondering "how do mockups
> become the app?" It's the plain-English version of the AGENTS.md design rules.

## What this whole thing is

One HTML file per milestone = the visual contract for that milestone. The Flutter
code is built to match it 1:1 (colors, fonts, spacing, motion, copy). This is how
M0 was done (`design/heartwood/heartwood-m0.html` → `lib/`), and it's how every
milestone should go.

Two ways to make a mockup:

1. **Open Design interface** (recommended — the visual cockpit)
2. OpenCode chat via the `od` MCP (optional upgrade, see "The od MCP" below)

---

## Open Design — the 30-second start

Open Design is **local-first and BYOK**: it drives YOUR opencode CLI with YOUR
models. It is NOT a SaaS you need an account for.

### First-run: click "Local Agent"

On the welcome screen there are three options:

- **Sign in to OpenDesign** — only for their optional *cloud AI* (needs an
  account; you don't need this)
- **Local Agent** — ✅ use this: it detects your installed opencode CLI and runs
  everything locally, no account, no extra keys
- **Bring Your Own Key** — only if you want API mode instead of your CLI

Account question: if you ever sign up (https://open-design.ai), any token/key
goes into the app's own Settings — never paste credentials into a chat or the
repo.

### Commands

```powershell
# start (from .tools/open-design) — prints the web URL
pnpm tools-dev start web

# check status / ports / logs
pnpm tools-dev check

# stop everything
pnpm tools-dev stop
```

Notes:

- The web port changes on every start (e.g. :54703) — read it from the start
  output or `tools-dev check`.
- If an agent (opencode) starts it from a shell, it must use a detached launch —
  otherwise the server dies with the shell. (AGENTS.md has the recipe.)
- Console errors like `/api/integrations/vela/status` or `/api/amr/models`
  (503/500) are normal — those are optional cloud services you're not using.

---

## The golden rule: always IMPORT the repo folder

When creating a project in Open Design:

- **Project type: IMPORT the repo folder** (`C:\Users\dell\Desktop\Quanti_Delta`)
  — NOT "managed" project.

Why this matters more than anything: the design run is literally your opencode
spawned **inside that folder**. Import the repo → the design agent can read
AGENTS.md, all of docs/, the current lib/ code, and the design/ mockups, load
all its skills and MCPs, and use your models. Make a "managed" project → it runs
in a private daemon workspace with NO repo access and designs blind.

---

## Making a mockup, step by step

1. Open the web UI (start command above), import the repo folder as the project.
2. Pick **OpenCode** as the runtime, then your model — **must be a `freellmapi/*` model**
   (e.g. `freellmapi/nemotron-3-ultra-550b`): your opencode uses a local gateway
   at `http://127.0.0.1:31415/v1` and default/fallback models fail with
   "Unexpected server error" (see troubleshooting).
3. Pick a design system (or author a `PersonalOS DESIGN.md` from UIUX.md tokens)
   and a skill (e.g. `direction-picker`, `design-extract`, `token-map`).
4. **Prompt recipe** — always start with a "read first" instruction:

   ```
   Read docs/UIUX.md, docs/Roadmap.md (the <MILESTONE> section), and
   design/<milestone>/… if present. Then design: <what you want>.
   Write only under design/<milestone>/ — never touch lib/, docs/, or AGENTS.md.
   ```

   The docs are the requirements; the agent must read them before designing.
5. Send. The spawned opencode writes the mockup HTML into `design/<milestone>/`,
   you watch it live, and iterate in the interface (each follow-up resumes the
   same session — no cold restarts).
6. Done = one HTML file per milestone, sitting in `design/`.

---

## Mockup → Flutter (the handoff)

1. Accepted mockup + its tokens become the contract: I (opencode, in a normal
   session) extract tokens into the Flutter theme and build the real widgets
   1:1 against the HTML.
2. Preview the real app on the dev server: `powershell -File tools/restart_web.ps1`
   → http://localhost:8080 (the Open Design preview iframe is for HTML mockups,
   not Flutter).
3. After each UI milestone: unneeded UI skills go back to `.opencode/skills-off/`
   (see AGENTS.md), Retrospectives entry written.

Rules that keep everything sane:

- **docs/UIUX.md wins** over any skill or mockup on conflict — except where a
  handoff doc explicitly says otherwise (M0 colors/theme → the heartwood HTML).
- Mockups live only in `design/` (git-ignored) — `git status` stays clean.
- Design runs have permission bypass — scope the prompt to `design/<milestone>/`.

---

## Models: use anything opencode can use

Open Design's model picker is opencode's **live model catalog** — every provider
attached to opencode appears there. No extra setup inside Open Design.

- **Rule of thumb:** only pick models whose *provider* is actually configured
  in opencode (`~/.config/opencode/opencode.jsonc`). The catalog lists
  thousands of models from every provider in the world — unconfigured ones
  fail with "Unexpected server error".
- **Proven working models (tested 2026-08-28):**
  `freellmapi/nemotron-3-ultra-550b`, `freellmapi/minimax-m3` (local, free),
  `opencode/big-pickle` (included in the opencode subscription, cost $0),
  `opencode-go/deepseek-v4-flash` (subscription), and `openrouter/*` (billed
  through the OpenRouter key). Pick any of these in Open Design.
- **Premium zen models (`opencode/claude-opus-*` etc.) require credits** —
  they fail with "Insufficient balance. Manage your billing here:
  opencode.ai/workspace/…" (CreditsError). Not a setup bug: either add
  credits at that URL or use a covered model.
- **Current:** your config has one provider, `freellmapi` (local gateway at
  `http://127.0.0.1:31415/v1`) serving `nemotron-3-ultra-550b` and
  `minimax-m3`. Pick one of those in Open Design.
- **Adding OpenRouter / OmniRouter / anything later:** add the provider to
  your opencode config and it shows up in the picker automatically:

  ```jsonc
  // ~/.config/opencode/opencode.jsonc
  "provider": {
    "openrouter": {
      "options": {
        "baseURL": "https://openrouter.ai/api/v1",
        "apiKey": "{env:OPENROUTER_API_KEY}"   // never a literal key in the file
      }
      // catalog models openrouter/* become usable without listing them
    }
  }
  ```

  OmniRouter / LiteLLM / any OpenAI-compatible endpoint: same shape, your
  local `baseURL`. After adding: Rescan runtimes in Open Design (Settings →
  Execution mode) so the picker refreshes.
- **The picker's "Default" entry is unreliable** — it resolves to the first
  catalog model (e.g. `opencode/big-pickle`), which is never what you want.
  Always pick an explicit model from a configured provider.
- **Picker showing only ~6 models (fallback list)?** The daemon lists models
  via `opencode models --verbose`, which takes 18–41s locally — its default
  15s timeout trips and it serves a hardcoded fallback. The local install is
  patched to 90s (`apps/daemon/src/runtimes/defs/opencode.ts`, timeoutMs).
  Re-apply the patch after any Open Design update, then rebuild
  (`pnpm --filter @open-design/daemon build`) and restart.

---

## The od MCP (the optional "terminal driver")

`od` is the OpenDesign daemon's CLI. Currently the MCP entry in opencode.json is
`enabled: false`. Enabling it = build the CLI, put it on PATH, flip the flag.

What it gives you: **opencode (this terminal) can drive the design pipeline
directly** — create projects, submit prompts, read artifact files, check
previews — so you can say "make the M1 mockup" in chat instead of clicking
through the web UI. The interface shows the same state.

Do you need it? No — the interface-first workflow works without it. It's the
power-user upgrade for when you want design runs as part of chat sessions.
When we flip it, the daemon gets pinned to a fixed port first (dev mode uses a
random port per launch).

---

## Troubleshooting quick hits

| Symptom | Fix |
|---|---|
| Welcome screen wants sign-in | Click **Local Agent** — no account needed |
| "Loading workspace…" forever on first load | Wait — first Next.js compile takes ~90s |
| Web port different than last time | Normal — read it from `tools-dev check` |
| `vela/amr` errors in console | Ignore — optional cloud services, not in use |
| Design agent doesn't know the requirements | Your prompt must say "read docs/… first" (recipe above) |
| Mockup landed in the wrong place / repo got touched | Check `git status` after each run; scope prompts to `design/<milestone>/` |
| "Could not start OpenCode: Unexpected server error" / "Insufficient balance. Manage your billing here: opencode.ai/workspace/…" when connecting as Local Agent | **Model mismatch.** The run is using an `opencode/*` cloud model (the picker's "Default" = the first catalog entry, e.g. `opencode/big-pickle` — routed through opencode.ai, which needs billing). Your opencode talks to a local gateway (`http://127.0.0.1:31415/v1`) serving `freellmapi/*` models. In the Open Design model picker, select a `freellmapi/*` model (e.g. `freellmapi/nemotron-3-ultra-550b`) — free, no billing. Only pick `opencode/*` cloud models if you fund that workspace; only pick other providers once they're configured in opencode. |