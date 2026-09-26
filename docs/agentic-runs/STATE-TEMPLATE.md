# Milestone State Ledger — template

Copy this file to `docs/agentic-runs/<milestone>/STATE.md` at the start of
each milestone's Phase 0. Structure per AMIF.md §3. It is maintained
continuously through the run and is the anti-redo mechanism — Phase 1 always
reconciles claimed status vs. actual evidence before planning.

## Milestone: <id> — <name>
Status: not-started | in-progress | plan-approved | implementing |
        gui-phase | optimizing | security-testing | complete

### Scope items (from Roadmap.md / docs/ — the archived TEMP-PLANNING
### ledgers in audits/ are provenance-only, never live scope)
- [ ] <item id> — <one-line scope> — status: unbuilt|partial|done — evidence: <file/commit/test>
- [ ] <item id> — <one-line scope> — status: unbuilt|partial|done — evidence: <file/commit/test>

### Deviations from original scope (requires human note)
- <item id>: <what changed and why>

### Carry-forward context
- <anything the next phase needs that isn't obvious from code>

### Incidents (post-ship findings — appended when logged, any severity)
- <date>: <severity> <finding> <disposition>