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

---

### Milestone: M0 — Phases 5–7: Export/restore, Coach stub, Storage meter (2026-08-21)

**Went well** (keep doing):
- Export→wipe→restore proven at the data layer: identical table dumps across a fresh DB, missing media = soft failure, newer-schema refusal, restore replaces populated data. sha256 manifest via crypto (D080).
- D021 recovery boot check wired: integrity check before runApp, recovery screen (export-what's-readable + restore) with a widget test.
- Coach stub is Decision-D faithful: idempotent habit.missed events (never duplicated on re-refresh), engine pure, outputs deduped per (kind, dateKey).
- Storage meter: threshold math is a pure function; web estimate() behind the same conditional-import pattern; widget test with overridden meter proved the 95% hard-warn banner + export action (and caught a real 36px overflow at phone width).

**Went wrong** (AI behavior worth fixing):
- Twice I wrote test expectations that didn't match the rule I'd implemented (compact-JSON assertion; "2 missed days" counted as a nudge). The tests were wrong, not the code — read the rule's numbers before writing the assertion.

**Root causes** (silent assumption? over-engineering? boundary-crossing? spec drift?):
- Assertions written from the plan sketch instead of the actual behavior contract (3 CONSECUTIVE missed days = habit skipped for 3 full days).

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
- "When a test fails and the code looks right, re-check the test's numbers against the doc's rule — the failing assertion is often the bug."

**Open items** (carried to the next milestone):
- Full UI overhaul pass (scheduled next).
- Cloudflare Pages deployment + iPhone PWA verification (Phase 8).

---

### Milestone: M0 — Pre-Phase-8 audit & hardening pass (2026-08-21)

**Went well** (keep doing):
- Full-diff code review (code-reviewer agent) surfaced 10 findings: 2 critical, 3 major, 5 minor — every one verified against drift/web 1.1.1 sources or empirically (download-attribute sanitization tested in real Chrome).
- The critical find (backup round-trip silently lost ALL media blobs through the browser: `download` sanitizes `media/<id>` → `media_<id>`, restore matcher could never match) was invisible to VM tests — it only exists at the browser boundary. The audit's existence proved itself.
- Fixes all TDD: concurrent double-check-in → exactly 1 event; journal delete cleans media + tombstones; stale coach gaps never fire; exported:false manifests; empty-DB round-trip; boot health on unusable DB.
- Release web build exposed a second class of bug VM tests can't see: `toJS` + async function is rejected by dart2js (compile error) — fixed by a sync handler. Rule: **the release build is part of verification, not just the final step.**
- Boot hardening (D021): main() now try/catches the integrity check — a corrupted DB shows the recovery screen instead of a white screen (this exact scenario reproduced in the browser after network-flap kills corrupted the dev profile's DB).

**Went wrong** (AI behavior worth fixing):
- Two attempts at simulating DB corruption in tests were wrong (integrity_check doesn't flag schema-text edits; closed in-memory DBs don't throw) before landing on LazyDatabase-thrower. Read the tool's actual semantics before writing the simulation.
- The web-compile bug (async→toJS) slipped through because flutter analyze checks the VM branch of conditional imports, not the web branch.

**Root causes** (silent assumption? over-engineering? boundary-crossing? spec drift?):
- Trusting VM-green as web-green; conditional-import branches need real web compilation to validate.

**Encoded lesson** (the AGENTS.md rule or DecisionLog entry this spawned):
- "flutter test never compiles the web branch of conditional imports — a release `flutter build web` is REQUIRED after any change touching services/web/*, media_capture*, estimate*, or main.dart. `toJS` callbacks must be synchronous (dart2js rejects async)."

**Open items** (carried to the next milestone):
- None new; audit clean (65 tests).