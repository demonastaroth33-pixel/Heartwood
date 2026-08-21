# Retrospectives — milestone lessons (the compound loop)

The after-action capture ritual: after every milestone phase, write one
entry here before moving on. The goal is at least one encoded lesson per
milestone — a rule added to AGENTS.md or a DecisionLog entry — so the next
unit of work is cheaper than the last.

## Template

### Milestone: <name> (<date>)

**Went well** (keep doing):
-

**Went wrong** (AI behavior worth fixing):
-

**Root causes** (silent assumption? over-engineering? boundary-crossing?
spec drift?):
-

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
-

**Open items** (carried to the next milestone):
-

---

### Milestone: M0 — Phase 1: Data layer skeleton (2026-08-21)

**Went well** (keep doing):
- TDD-first held: every repository started as a failing test; codegen/analyze verified after every step.
- The plan-review TableIndex catch was validated by an actual build_runner failure — doc-checking against context7 before codegen paid off twice over (index syntax, then `Table.blob` collision).
- Repositories write entity + event in one `db.transaction()`; tests assert the event log never diverges.

**Went wrong** (AI behavior worth fixing):
- Committed Task 1.5 with 7 failing tests — the full-suite verification line was misread and the commit went through anyway. Process violation: never commit with red tests; verify the final "All tests passed" line explicitly.
- The scaffold's schema stub carried three latent breakages that only surfaced at codegen/FK time (invalid `TableIndex` syntax, `blob` column colliding with `Table.blob`, missing `primaryKey` on entity tables). I copied the stub's patterns instead of verifying them — exactly what AGENTS.md's context7 mandate exists to prevent.

**Root causes** (silent assumption? over-engineering? boundary-crossing? spec drift?):
- Assumed the scaffold stub was compilable drift; it had never been code-generated. Drift codegen IS the compiler — the first real run exposes schema truth.
- Generated data-class names (`JournalEntry`, `Habit`, `Event`) collide with the domain models by default; fixed with `@DataClassName('XxxRow')`.
- SQLite rejects FK references to non-key parent columns at prepare time (`foreign key mismatch`); entity tables need explicit `primaryKey` on `id`.

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
- AGENTS.md Code rules: "Drift schema: after ANY database.dart edit, run build_runner + flutter analyze before proceeding; every entity table needs an explicit primaryKey on id (FK references fail at prepare time otherwise); column getters must not collide with Table built-ins (e.g. `blob` → `blobData`); use @DataClassName('XxxRow') so generated row classes don't collide with domain models. Never trust scaffold stubs — verify drift syntax via context7." Plus: "Never commit with failing tests — grep the runner's final line first."

**Open items** (carried to the next milestone):
- None.

---

### Milestone: M0 — Phase 2: Dashboard shell + navigation (2026-08-21)

**Went well** (keep doing):
- Playwright caught a real web-only bug the widget tests could not: `driftDatabase()` throws on web without `DriftWebOptions`. Widget tests run on the VM (NativeDatabase), so the browser boundary check earned its place.
- Fixed via docs, not memory: drift web setup requires `web/sqlite3.wasm` + `web/drift_worker.dart.js` from the SAME drift GitHub release tag (2.34.3), plus `DriftWebOptions(sqlite3Wasm:, driftWorker:)`. Verified end-to-end in Chrome (zero console errors).
- Responsive shell (bottom bar < 800px / left rail >= 800px) covered by two widget tests, not just manual resizing.

**Went wrong** (AI behavior worth fixing):
- The plan's smoke test assumed the default 800x600 test surface, which silently hits the desktop rail and fails `NavigationBar` assertions — surface size must be set explicitly in responsive widget tests.
- First browser run showed a crash the smoke test never could: web wasm bootstrap isn't exercised by flutter test at all.

**Root causes** (silent assumption? over-engineering? boundary-crossing? spec drift?):
- Assumed `driftDatabase(name: …)` was cross-platform by default; drift_flutter requires explicit web options.
- Test viewport defaults are desktop-width; responsive tests need `setSurfaceSize`.

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
- AGENTS.md Code rules: "drift_flutter web needs DriftWebOptions + web/sqlite3.wasm + web/drift_worker.dart.js from the matching drift GitHub release; flutter test never exercises web bootstrap — the browser boundary (playwright) is the only place wasm/worker errors surface. Responsive widget tests must setSurfaceSize explicitly."

**Open items** (carried to the next milestone):
- Screenshots `dashboard-shell-phone-v2.png` / `dashboard-shell-desktop.png` in repo root — visual review is the user's call (AI can't view images).

---

### Milestone: M0 — Phase 3: Habits UI (2026-08-21)

**Went well** (keep doing):
- Full flow driven by widget tests: create habit via bottom sheet → check off → streak line, and archive → empty state. Provider invalidation (family streak + today ticks) is explicit and testable.
- Today section (dashboard) wired to real habit data with one-tap ticks; dashboard smoke test still green — the fused block is real, not a stub.

**Went wrong** (AI behavior worth fixing):
- Flutter web renders to a canvas: the playwright accessibility snapshot is literally empty, so "create a habit in the browser" can't be driven reliably by the MCP snapshot. Don't plan browser interaction for canvas UI — widget tests own it.

**Root causes** (silent assumption? over-engineering? boundary-crossing? spec drift?):
- None structural; the ownership split (widget tests for interaction, playwright for console/persistence) held once applied.

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
- Already encoded in Phase 2's AGENTS.md entry (browser boundary only via playwright; widget tests own logic). No new rule needed.

**Open items** (carried to the next milestone):
- None.