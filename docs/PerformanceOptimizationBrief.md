# Performance Optimization Brief — Heartwood (Flutter Web)

**Status:** Working reference for AI-assisted optimization of the Heartwood/PersonalOS
Flutter Web app's rendering performance on low-end hardware.
**Target reader:** An AI agent (Claude/opencode) about to work on performance.
**Golden rule:** Optimize the *cost of rendering*, never the *design*. The visual
language, motion timings, and reference fidelity are non-negotiable.

---

## 1. What this app is

- **Heartwood (PersonalOS)** — a private single-user life-management app
  (journal + habits + goals + coach). Flutter Web / PWA.
- UI built as a strict 1:1 replica of `UI develop/heartwood-m0.html` (the visual
  source of truth: same colors, spacing, type scale — Fraunces/Inter/JetBrains Mono —
  motion timings, and copy).
- **Stack:** Flutter **3.44.8** (stable, 2026-07), Dart 3.12, Riverpod, Drift +
  SQLite-WASM. Web release build (`flutter build web --release`).
- **Renderer:** **CanvasKit only.** The HTML renderer was removed in Flutter 3.35;
  `--web-renderer html` no longer exists. There is no compositor — CanvasKit
  re-rasterizes the entire scene through WebGL on every frame.
- Storage: Drift (`lib/data/database/database.dart`) via `drift_flutter`
  (`sqlite3.wasm` + `drift_worker.dart.js` served from `web/`).

## 2. The problem (with evidence)

On the **target machine** (user's laptop), animations visibly do not render and the
console spams Chrome `[Violation] 'requestAnimationFrame' handler took Nms` warnings.
The exact same app renders cleanly in Playwright/headless Chrome.

### Hardware/environment evidence (from the user's console)

```
Using WasmStorageImplementation.sharedIndexedDb due to missing browser features:
{MissingBrowserFeature.dedicatedWorkersInSharedWorkers, MissingBrowserFeature.sharedArrayBuffers}
[heartwood] prefers-reduced-motion: true | webgl2: false |
renderer: ANGLE (AMD, AMD Radeon(TM) R4 Graphics (0x000098E4) Direct3D11 vs_5_0 ps_5_0, D3D11)
```

- **AMD Radeon R4** — a ~2014 low-end APU. **No WebGL2.** Old D3D11 driver.
- **`prefers-reduced-motion: true`** — the OS reports reduced motion (Windows
  "Animation effects" off), which Flutter web maps to
  `MediaQuery.disableAnimations = true` (already force-overridden — see §4).
- **Drift falls back to `sharedIndexedDb`** — the browser lacks
  `dedicatedWorkersInSharedWorkers` + `sharedArrayBuffers`; the sqlite WASM storage
  layer degrades accordingly. Whether the DB executes on the main thread vs a worker
  under this fallback is an **open question** (§7).
- Historical rAF violations: 375ms / 325ms / 293ms per frame (now mostly gone after
  the first optimization pass).

### Frame diagnostics (instrumentation added in `lib/main.dart` → `_logFrameDiagnostics`)

Readout from a 90-second session with mouse movement:

```
[heartwood-frames] t=1s fps=13 lastAvg=37ms
[heartwood-frames] t=3s fps=14 lastAvg=9ms
[heartwood-frames] t=5s fps=2  lastAvg=98ms
[heartwood-frames] t=9s fps=2  lastAvg=10ms
... (sustained 2-9 fps while idle-ish)
[heartwood-frames] t=93s fps=32 lastAvg=18ms   ← active mouse hover
```

**Interpretation:**
- Per-frame *cost* is now low (avg 9–37ms) — the first optimization pass worked.
- Sustained fps is still 2–14: the GPU's real ceiling with CanvasKit is ~10–30fps.
- **Hovering drives the frame bursts** — moving the mouse across the dashboard
  crosses many `MouseRegion` hover zones; each enter/exit triggers a 220ms animated
  hover state; at ~10fps that is 2 frames of motion → looks dead + rAF violations.
- At 10fps, a 550ms dock-up produces ~5 frames (borderline invisible); a 220ms
  hover produces 2 frames (invisible). This is the *frame-budget* math of why
  animations "don't show" — not a code bug.

## 3. Why headless Chrome was smooth (so it's understood, not re-litigated)

1. Headless Chrome uses **SwiftShader** — a deterministic CPU software rasterizer
   independent of the machine's GPU.
2. Headless reports **no `prefers-reduced-motion`**.
3. Playwright typically runs on a more powerful machine.

Nothing about the app was "better" in headless — the renderer was unconstrained.

## 4. What has already been done (do not redo; verify instead)

### Animation correctness / reference fidelity (all shipped & tested, 73 tests green)
- Custom SVG icon set + full path parser (arcs, relative commands, implicit
  repeats) — `lib/widgets/heartwood_icon.dart` (`svgPath`, top-level).
- Boot-synchronized entrance animations: `lib/core/app_boot.dart` —
  `AppBoot.complete` is set when the HTML splash dispatches `hw-boot-done`
  (`web/index.html`) with a 6s fallback timer in `main.dart`.
- Compose opens via `SlideUpRoute` (full-height slide + fade, 550ms, standard
  ease) — verified by `test/features/journal/slide_up_route_test.dart`.
- Modals open via `showBlurDialog` → custom `BlurDialogRoute`
  (`lib/widgets/animated_widgets.dart`): open 450ms (scale .95→1 + 2% drift +
  fade, emphasis curve), **close 200ms**, blur sigma 5, blur lives *inside* the
  fade so it eases out. Backdrop taps dismiss; card taps absorbed.
- **`MediaQuery.disableAnimations` force-disabled** at `MaterialApp.builder`
  (`lib/app.dart`) — overrides the OS reduced-motion setting app-wide.
- Infinite hero-rings "breathe" changed to a **one-shot 3s settle**
  (`_BreatheRings` in `lib/features/dashboard/dashboard_screen.dart`) — the
  infinite loop was pinning the GPU at a few fps forever.

### Rendering-cost pass (shipped)
- `RepaintBoundary` around the whole dashboard body and the nav rail
  (`lib/features/dashboard/dashboard_screen.dart`,
  `lib/widgets/nav_shell.dart`).
- Splash element removed from the DOM after fading (`web/index.html`) so its
  infinite CSS animations stop ticking.
- Hover rotations use `AnimatedRotation` (angle-based, no matrix-lerp drift).

### Working tree, NOT yet built (verify before building)
- `RepaintBoundary` added inside `Reveal`
  (`lib/widgets/animated_widgets.dart`, unbuilt edit) — isolates each reveal
  block so only that region re-rasterizes during its entrance.

### Instrumentation (keep during work; remove at the end)
- `[heartwood] prefers-reduced-motion | webgl2 | renderer` — logged on
  `flutter-first-frame` (`web/index.html`).
- `[heartwood-frames] t=Ns fps=N lastAvg=Nms` — per-second frame counters for the
  first 30s (`_logFrameDiagnostics` in `lib/main.dart`). **Do not remove until the
  performance work is signed off.** (An `Intl.v8BreakIterator` deprecation warning
  in the console is a harmless Flutter-engine notice — ignore it.)

## 5. The optimization map (ordered; each preserves visuality)

### Phase A — Per-frame raster cost (biggest lever)

| # | Item | What | Expected gain |
|---|---|---|---|
| A1 | **Finish fine-grained RepaintBoundary isolation** | Every animated element gets its own cached layer: hero rings (`_BreatheRings`), streak ring (`StreakRingCard`'s animated `SizedBox`), storage fill, FAB, each `HoverLift`/`HoverRotate` target, modal route content. Only the dirty region re-rasterizes; the rest blits from GPU cache. | Animation frames 60–80% cheaper; 10fps → 25–40fps |
| A2 | **Shadow blur budget** | The blurred `BoxShadow`s are Gaussian passes: hover-lift 30px, pill glows 20–24px, FAB 30px, gold stage glow 18px, mobile FAB 24px. Trim the biggest ~30% (30→16, 24→16, 20→14, 18→12). Visually near-identical. | Frames containing shadows 30–50% cheaper |
| A3 | **Modal blur paid once, not per frame** | The scene behind an open modal is static during the pop, yet the `BackdropFilter` re-blurs every frame (the single most expensive effect). Engineering: capture the backdrop once (`RepaintBoundary.toImage`), pre-blur it, fade/scale the card on top. **Blur stays sigma 5.** | Pop frames lose their ~30–100ms blur pass |
| A4 | **Full-screen FadeTransition cost** | The dock-up fades a full-screen layer each frame. Option: keep the slide, drop the fade (near-indistinguishable on dark-on-dark). Only if A1–A3 insufficient. | 5–15% per transition frame |
| A5 | **`DashedBorder` painter** (`lib/widgets/core_widgets.dart`) | Use `PathMetrics`/`dashPath`-style segment generation instead of dozens of tiny `extractPath` draws. | Minor, free |

### Phase B — Frame scheduling (continuous work elimination)

| # | Item | What | Expected gain |
|---|---|---|---|
| B1 | **Verify idle = 0 fps** | After A1, leave the app untouched 30s: `[heartwood-frames]` should show ~0 frames/sec once entrance animations finish. If not, find the remaining scheduler (grep for `repeat(`, `Timer.periodic`, `Stream.periodic`, focused `TextField` cursor blinks). | Deterministic "idle = no GPU work" |
| B2 | **Hover spam** | With A1, hover animations re-raster tiny regions — violations become cheap frames. If still noisy, shorten hover animations (last resort; ~zero visual loss). | Console spam gone |

### Phase C — Main-thread / boot work

| # | Item | What | Expected gain |
|---|---|---|---|
| C1 | **Drift execution location** | Determine whether the DB runs on the main thread under the `sharedIndexedDb` fallback. If yes, every query blocks frames. Check `lib/services/storage/estimate_web.dart` path and the drift worker wiring; force worker-mode message passing if possible, or lazy-load heavy queries off the critical path. | Boot + provider loads: 100–300ms main-thread stalls removed |
| C2 | **Defer coach refresh** | `coachTodayProvider` reads all journal entries + runs the rule engine at boot (`lib/features/dashboard/dashboard_providers.dart`, `lib/services/coach/`). Defer past first paint. | First frames render sooner |
| C3 | **Compressed serving** | `main.dart.js` (~3.2MB) + `canvaskit.wasm` (~2MB). Check `tools/serve_web.mjs`; enable gzip/brotli for static assets (and verify the deployment target does too). | First load 2–4× faster |

### Phase D — Engine/build level

| # | Item | What | Expected gain |
|---|---|---|---|
| D1 | **`--wasm` build** (`flutter build web --wasm --release`) | Dart AOT → WASM; faster execution on weak CPUs. Risk: needs a modern Chrome (the target's Chrome looks old — no WebGL2). Test before committing to it. | Runtime 10–30% |
| D2 | **Font subsetting** | Bundle only used weights: Fraunces 400/500 (+italic), Inter 400/500/600, JetBrains Mono 400/500/600; Latin subset. See `pubspec.yaml` fonts section. | Smaller download, faster shaping init |

### Phase E — Environment checks (config, not code — do these first, they're free)

| # | Item | What | Expected gain |
|---|---|---|---|
| E1 | **`chrome://gpu`** | If "WebGL: Software only" (driver blacklisted), enable **chrome://flags → Override software rendering list** → forces real D3D11. | Possibly 2–4× |
| E2 | **Windows DPI scaling** | At 125–150% scaling the Flutter canvas is 1.5–2.25× more pixels/frame. Capping the Flutter view's `devicePixelRatio` (e.g. to 1.25) via the bootstrap would cut pixels ~2× at slight text softness. **Trade-off decision needed.** | ~2× fps, minor softness |
| E3 | **Power plan / battery saver** | Radeon APUs throttle on battery. Use High Performance while testing. | 10–30% |
| E4 | **GPU driver update** | AMD Radeon R4 driver. | 0–30% |
| E5 | **Window size** | Smaller window = fewer pixels. | Linear |

### Phase F — Honest scope note

A renderer "rewrite" is not the lever: CanvasKit is the constraint and the HTML
renderer no longer exists in this Flutter version. The closest rewrite-level wins
that preserve visuals are A1 + A3 + C1 together (target: animation frames ~30ms →
~8ms, idle 0fps, boot stalls gone). Beyond that, the remaining gap is hardware:
this app at reference fidelity needs roughly 2018-era hardware for true 60fps.

## 6. Constraints (non-negotiable)

- **Never reduce visual quality or reference fidelity**: colors, fonts, spacing,
  radii, motion timings/curves, copy — all must stay 1:1 with
  `UI develop/heartwood-m0.html` (exceptions: the mock's "System notes" block and
  top "Heartwood M0" band are intentionally absent from the app).
- **Do not drop the modal blur** (user explicitly requested it stays, sigma 5).
- No new pub dependencies without a `docs/DecisionLog.md` entry + user approval
  (AGENTS.md rule).
- Layer boundaries: features/ → repositories/ → services/ → store; UI never queries
  storage directly; no boundary-crossing fixes.
- `flutter analyze` clean; `flutter test` green (currently 73 tests) — never
  commit with failures. Watch the runner's final summary line.
- Remove the frame diagnostics + `hw-boot-done` instrumentation at the end of the
  work (keep until sign-off).
- Performance must be verified on the **target machine** (the user's laptop), not
  just headless Chrome. Headless smoothness is expected and proves nothing.

## 7. Open questions to resolve during the work

1. Does the drift DB execute on the main thread under the `sharedIndexedDb`
   fallback? (Performance panel: look for long synchronous tasks at boot / on
   provider loads.)
2. Does the target Chrome support WebGPU (`navigator.gpu`)? If yes, Flutter
   3.44's Impeller-Web path becomes available — a step-change in raster speed.
3. `chrome://gpu` WebGL status (hardware vs software).
4. What `devicePixelRatio` does the target display run at? (Decide E2.)
5. Is `tools/serve_web.mjs` serving compressed assets?

## 8. Definition of success

- `[heartwood-frames]` shows **~0 fps when idle** after entrance animations.
- Dock-up / modal pop / reveal animations are **visibly animate** on the target
  machine (choppy but perceptible motion; target: ≥15fps during transitions).
- No continuous rAF violations on hover.
- Visuals remain 1:1 with the reference; modal blur intact; analyze clean;
  tests green.
- Then: remove diagnostics, update docs (`docs/Retrospectives.md`, DecisionLog for
  any new decisions), and hand back for user review at http://localhost:8080
  (served via `tools/serve_web.mjs build/web 8080`).