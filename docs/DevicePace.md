# DevicePace — Adaptive Motion Pacing

**Purpose:** one mechanism for all Heartwood animation durations, so every
animation spans the same number of *rendered frames* on every device — reading
like the reference (~300-500ms) on fast hardware and staying clearly
perceptible (1-2s+) on slow ones. User-mandated (T14 decision log; replaces
the fixed timings that were invisible on the target machine's ~20fps Radeon).

## Mechanism

`lib/core/device_pace.dart` measures the device's real frame rate from
`FrameTiming` callbacks (`DevicePace.init()` is called once in `main.dart`):

- **70th-percentile frame interval** over a ~1.5s window — ignores boot spikes
  and single long frames, tracks sustained conditions.
- **Hysteresis** (50/50 blend with the previous estimate) — the estimate moves
  smoothly instead of yanking.
- Clamped to 1-120fps; `durationForFrames(n)` is clamped to 150-5000ms.

Two consumers:

1. **`DevicePace.durationForFrames(n, max: ...)`** — a wall-clock duration that
   spans `n` frames at the measured pace. SNAPSHOT at call time. Use ONLY
   where the animation cannot be re-paced live: **route transitions** (the
   Navigator owns the route controller). Current route targets: compose slide
   45 frames capped at 2.2s, modal open 22 / close 10 (capped 1.6s / 0.8s).
   The per-route cap is deliberate: a 5s slide reads as "nothing happened".
2. **`PacedAnimation(targetFrames: n, vsync: ...)`** — an `Animation<double>`
   that advances `1/n` per RENDERED frame. Always spans exactly `n` visible
   frames, adapting LIVE to the current frame rate — including mid-animation
   stress dips. Use for **every widget-level animation**. Current targets:
   hover rotation 20 frames, FAB rotation 24, reveal 18, streak ring 30,
   storage bar 20.

## Cost: zero when idle

- `DevicePace.init()` registers a single passive timings callback — it only
  runs when the engine reports rendered frames; it never schedules frames and
  does no work while the app is idle (idle = no frames = no callback).
- `PacedAnimation` tickers run ONLY while an animation is actively
  progressing and stop at the ends — no continuous per-frame work.
- The HTML splash samples fps over exactly 15 frames once at boot, then stops.
- The estimate uses a 70th-percentile interval over a ~1.5s window with
  hysteresis, and sanitizes non-finite measurements, so it can never poison
  the durations or cause pathological values.

## Rules for future animations

- Any new widget-level animation (hover, reveal, pulse, draw-in) MUST use
  `PacedAnimation` — never a fixed `AnimationController`/`AnimatedX` duration
  for entrance/emphasis motion.
- Route transitions use `DevicePace.durationForFrames(...)` at construction.
- One-shot ambient motion (the hero rings settle, the streak ring draw-in)
  should also use `PacedAnimation` or `durationForFrames` — never a bare
  `const Duration`.
- The HTML boot splash (`web/index.html`) is paced separately: JS samples fps
  over the first 15 frames and sets `--pace` (clamped 1-4), and every splash
  animation duration + the min-hold time is multiplied by it.

## Why not wall-clock durations?

On a device rendering at 20fps, a 400ms animation is 8 frames; at 5fps it is 2
frames — invisible. Frame-count pacing makes the *number of visible frames*
the invariant, so the same design language survives any hardware. Measured
behavior on the target machine: compose slide went from imperceptible (550ms
fixed) to a clearly visible ~1.5-2s glide, crosses and the FAB turn visibly,
while a 60fps machine gets ~750ms / ~500ms respectively.

## Verification

- `test/core/device_pace_test.dart` — PacedAnimation advances exactly
  1/targetFrames per rendered frame and completes in exactly targetFrames
  frames; durations stay within clamps.
- `test/features/journal/hover_rotate_test.dart` — the cross rotation
  progresses per frame and settles at 90°.
- `test/features/journal/slide_up_route_test.dart` — duration-agnostic
  progressive-motion assertions (reads the route's own duration).

## Limitations / notes

- Route transitions are snapshot-paced (Navigator-owned controller); widget
  animations are live-paced. If a route's motion ever needs mid-flight
  adaptation, that requires custom route-controller plumbing — out of scope
  unless measurement demands it.
- The 150-5000ms clamps are guardrails; the 70th-percentile + hysteresis
  keeps the estimate from pathological values.