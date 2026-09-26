# PersonalOS — Design System (M0)

> Status: **DRAFT v3 — awaiting user approval before any implementation.**
> Source hierarchy: user reference images (described 2026-08-21) → `docs/UIUX.md`
> (wins on conflict — no conflicts found; UIUX.md leaves palette/theme values
> open, which this doc fills) → design skills (frontend-design, impeccable:
> brief-pinned direction — no concept roll needed) → real-app evidence via
> `tools/mobbin_search.mjs` (52+ screens across 6 surfaces, §9) → reference
> prototype pickups (loader, atmosphere, nav pill, focus rings — folded in).
> Mode: **Operate** — scanability, consistency, native expectations outrank
> expression; the brand lives in precise details, not decoration.

## 0. Design brief — who this is for

PersonalOS is a private, single-user life-management app: journal, habits,
dashboard, coach. A **life archive** opened every day, in quiet moments, on a
phone in sunlight and a desktop at night. Core loop:
Open → Understand → Execute → Record → Reflect.

Personality: **quiet discipline, not gamified hustle.** The mood world — rainy
bamboo, ink-wash fields, willows at dusk (images 2/5/8) — is the emotional
core: muted greens, negative space, calm, *plant-like*. The UI references
(1/9/10) supply the component language: pill buttons, pill date strips, flat
colored cards, circular icon buttons, a strong active nav state. The
**signature** is the **pill**: pill primary actions, pill date chips, pill
badges, pill nav indicators — a calm, recognizable silhouette in every screen.

One aesthetic risk taken deliberately: the accent is a **muted leaf green**
(not acid lime), and amber is reserved for **streaks only** — warmth spent
sparingly reads as achievement. The deliberate refusal: near-black + one neon
accent + glowing edges (the AI-default "hustle dashboard") — no glow, no neon,
no frosted glass everywhere.

**Not-overdone rules (the restraint contract):**
1. One ambience moment per screen. Journal gets the atmospheric image;
   Dashboard gets gradient washes only; Habits gets neither (its ambience is
   the check animation). Never two.
2. Max two accent-colored elements per viewport at rest.
3. Content surfaces are always ≥96% opaque; ambience never touches text.
4. No gradient text, no glow, no blur-frosted panels, no drop-shadow text.
5. Gold appears on streaks and nothing else.
6. Every screen has exactly one primary action; everything else is quiet.

## 1. Multi-theme architecture (theme-able from day one)

Three layers; UI code references **semantic tokens only**, never raw hexes.

```
lib/core/theme/
  tokens.dart     — AppTokens: semantic tokens (colors, radii, spacing, type, elevation, motion, atmosphere)
  themes.dart     — THEME REGISTRY: Map<String, ThemeValues> + ordered list; buildTheme(values) → ThemeData
  theme.dart      — existing entry; delegates to the registry; app.dart reads the active key via provider
```

- **Theme registry** — `Map<String, ThemeValues>`. Each entry: palette,
  derived colors, atmosphere spec (§2.4), optional atmospheric image asset,
  loader spec. A new theme = one registry entry + a settings value —
  **settings swap, never a rewrite.** Ink is theme #1 (encoded here), Paper
  #2 (ships with the picker). The registry drives the theme picker and
  `buildTheme`.
- Settings key `theme` (registry keys, default `ink`), Settings group
  GENERAL (UIUX.md); a Riverpod provider rebuilds `MaterialApp`'s theme.
  Widgets never rebuild — tokens are theme-stable by construction.
- Dark-first default (UIUX.md); Ink is the reference theme, built first.

## 2. Tokens — semantic layer

### 2.1 Color tokens

| Token | Ink (dark, default) | Paper (light) | Use |
|---|---|---|---|
| `bg` | `#0D110F` ink-black, green-tinted | `#F2F5F1` cool paper | scaffold background |
| `surface` | `#141A16` | `#FFFFFF` | cards, sheets, dialogs |
| `surfaceRaised` | `#1C241E` | `#FAFBF9` | tiles above surface, popovers, inputs |
| `textPrimary` | `#E8EDE9` | `#1A211C` | headings, body |
| `textSecondary` | `#93A29A` | `#5C6B61` | metadata, captions, empty lines |
| `textDisabled` | `#55615A` | `#A8B2AB` | disabled controls, ghost dates |
| `accent` | `#8FBF72` leaf green | `#4E7A35` | primary actions, active states, success |
| `onAccent` | `#0D110F` (ink bg) | `#F2F5F1` | text/icons ON accent fills (inverted pill) |
| `accentDim` | `#8FBF72` @ 22% | `#4E7A35` @ 14% | indicators, hover wash, nav pill, atmosphere |
| `gold` | `#E8B45A` | `#8A6A1F` | streaks ONLY (flame/achievement) |
| `danger` | `#E06C5F` warm coral | `#B3382A` | destructive actions, hard-warn |
| `warning` | `#D9A441` | `#8F6A12` | 70% storage warn |
| `hairline` | `#FFFFFF` @ 7% | `#1A211C` @ 10% | card/tile borders |

### 2.2 Radius / spacing / elevation / type / motion tokens

| Radius | Value | | Spacing | Value | | Elevation | Definition |
|---|---|---|---|---|---|---|
| `radiusSm` | 8 | | `spaceXs` | 4 | | `elevFlat` | hairline border, no shadow (cards, tiles) |
| `radiusMd` | 12 | | `spaceSm` | 8 | | `elevRaised` | hairline + `0 2 8 rgba(0,0,0,.35)` (FAB, sheets, nav) |
| `radiusLg` | 16 | | `spaceMd` | 12 | | `elevOverlay` | hairline + `0 4 20 rgba(0,0,0,.5)` (compose, viewer) |
| `radiusXl` | 24 | | `spaceLg` | 16 | | | |
| `radiusPill` | 999 | | `spaceXl` | 24 | | | |
| | | | `spaceXxl` | 32 | | | |

Type (system fonts, no webfonts — UIUX.md): `display` 34/40 w600 · `headline`
24/30 w600 · `title` 18/24 w600 · `tileTitle` 15/22 w600 · `body` 15/22 w400 ·
`bodySmall` 13/18 w400 · `label` 12/16 w500 · `button` 14/20 w600. Numbers use
`tabularFigures` where they matter (meter, streaks). Font family: platform
default (remove explicit `Roboto`).

Motion: `durInstant` 120ms · `durFast` 200ms · `durSlow` 320ms ·
`curveStandard` easeOutCubic · `curveEmphasis` easeInOutCubic. Reduced motion:
`MediaQuery.disableAnimations` → all durations 0, drift off, loader static.

### 2.3 Atmosphere — the ambience engine (plant-like, never overdone)

The app shell carries a **restrained atmosphere layer** behind all content —
how the ink-green mood world becomes present without touching readability.

**Two layers, one on top of the other:**

1. **Wash layer (every screen):** two radial gradient washes —
   - Ink: `accentDim` 560×320px at top-left (15% / -8%) + faint warm
     `rgba(232,180,90,.06)` 420×260px at top-right (110% / 8%); opacity 0.9.
   - Paper: same geometry, `accentDim` + `rgba(138,106,31,.05)`; opacity 0.7;
     no motion.
   - Ink drift: ±14px translateY over 7s ease-in-out alternate — the only
     continuous motion in the app ("rain on the glass"). Off in Paper, off
     under reduced motion.
2. **Image layer (optional, per-theme, one asset):** a bundled atmospheric
   image — **soft-focus botanical/ink-wash photograph** (bamboo rain, willow,
   grass field — the mood world) rendered full-bleed behind the content:
   - Opacity ≤ 12% (Ink) / ≤ 8% (Paper), plus a `bg`-colored scrim gradient
     (stronger at top and bottom) so content zones stay clean.
   - Blurred 2–4px (soft depth, no detail to fight text).
   - **Ownership rule:** only one surface per theme may show the image layer
     — the **Journal screen** (the ambience home). Other screens use washes
     only. This is the "not overdone" contract made concrete.
   - Asset: user-provided (the mood images 2/5/8 as files in
     `assets/atmosphere/`, ≤ 200KB webp each) or a procedural fallback
     (CustomPainter ink-wash silhouette + grain, zero dependencies, offline).
     Decision needed at approval — see open questions.
- All atmosphere: z-index 0, `pointer-events: none`, content cards opaque on
  top. Never animated except the one drift.

### 2.4 ThemeValues record shape

```dart
class ThemeValues {
  final String key;                       // 'ink' | 'paper'
  final String label;                     // 'Ink' | 'Paper'
  final List<Color> palette;              // bg, surface, surfaceRaised, textPrimary, textSecondary, textDisabled, accent, onAccent, accentDim, gold, danger, warning, hairline
  final AtmosphereSpec atmosphere;        // washes, opacity, drift, optional image asset + scrim
  final LoaderSpec loader;                // colors, durations
}
```

### 2.5 Ceremony tokens — the ONE shared ceremony language (L009/L022, INT-07; docs-pass D164)

<!-- docs-pass D164 (ceremony tokens): L009 (F-03) + L022 (F-15) + INT-07 ceremony half. Superseding sources: LifeTree.md §10 (ceremony language), D094 (stage-transition UX + durations), D106 (F-03 NO-BLOOM arbitration), D112 DV-C2 (blush), D111(5) (particle budget). -->

The tree decisions define ONE ceremony language, owned by LifeTree.md §10: the F-03 PR flourish, the F-15 weight-ladder hero ring, and the ink-wash blush as the one saturation moment. DesignSystem.md carries its tokens. **NOT confetti — never.**

| Token | Color role | Where it renders |
|---|---|---|
| `ceremonyBract` | `accent` family (a bract is a modified leaf — the flourish is accent-toned, never gold) | F-03 bract-style flourish at the logging moment — the ceremony's sparkle, **ZERO flowers** (D106 no-bloom arbitration; the flower = achievement contract survives) |
| `ceremonyRing` | `accent` family (active/milestone channel) | F-15 milestone hero ring — current rung + % to next; completes with the differentiator copy ("80kg — confirmed by 2 consecutive weeks"); the forecast is a DATE RANGE, never a single date |
| `blush` | see §2.6 | the saturation moment — flowering events ONLY (D112 DV-C2) |
| gold | — | **never** in the ceremony; gold stays streaks-only (the tree's gold boundary, §2.6) |

Ceremony motion (D094, verbatim-critical durations): germination ~3s · transitions ~2–4s · maturity + first bloom 8–12s — **nothing loops, repeats, or spams.** Particles: capped to the shared ~150–300-sprite budget (the bloom-rain budget, D111(5)); a bloom that reads as confetti fails the ceremony. Ceremonies queue and never interrupt an active session (D108(5)); unviewed transitions replay on the next open + viewed watermark (D094(3)/D109). Reduced motion: the REDUCED tier's static fallback (§2.7). No push notifications for transitions.

The functional rules stay in their owning docs (F-03: Roadmap M2 + UIUX session screen; F-15: Roadmap M2 body + Gamification weight ladder); this token set is the visual contract only, tuned at the M9 mockup step.

### 2.6 Life Tree palette tokens — the blush, the seasons, the identity axis (L142/D112, D085/D095, INT-07/08; docs-pass D165)

<!-- docs-pass D165 (Life Tree palette tokens): L142 (D112 heartwood palette note) + D085/D095 (seasonal states) + INT-07 blush half + INT-08 (season palette). Superseding sources: LifeTree.md §9/§10/§14, ACHIEVEMENT-SCAN §5 (gold discipline), relentless-design-audit M-8 (palette derivation rule), loophole-findings-wave2/E-design-vision DV-C2/DV-M8 (bloom palette + gold boundary). -->

Every tree palette derives from the Heartwood ink/paper tokens, dark-first — the M-8 palette rule extends DV-C2's token derivation from the bloom to the whole tree: muted greens/rusts/ambers within the accent + gold families, dev-tunable, deuteranopia-passed (D111(3)). Nothing saturated, nothing neon. These tokens join the ThemeValues palette list (§2.4) when the tree ships (M9); every value is dev-tunable (D105 — the dev-tools panel plays them, never shipped).

**The blush — the ONE allowed saturation moment (D112 DV-C2).** A muted, desaturated ink-wash blush (dusty rose / pale blush that sits on the dark ink-green), reserved for the flowering events — the same privilege gold has for streaks. The tree never uses gold for achievements (ACHIEVEMENT-SCAN §5); the blush is its substitute. Values below are PROVISIONAL — the D112 user note locks this open to edits during implementation/visual testing, the tokens join the dev-tools playable surface, and the final blush treatment is tuned at the M9 mockup step:

| Token | Ink (provisional) | Paper (provisional) | Role |
|---|---|---|---|
| `blush` | `#C99A9A` | `#8A5C60` | the saturation moment: the bloom palette, flowering events (buds → bloomed flowers), the first-bloom cherry-blossom moment |
| `blushDim` | `#C99A9A` @ 22% | `#8A5C60` @ 14% | wash-level blush — the canopy bloom wash / spring-flush atmosphere, mirroring `accentDim` |

**Seasonal state color roles (D085/D095).** The season-phase function (register F1 — fixed dates + the stored timezone setting, never the live device clock) keys the render states; the user's data modulates intensity (rich journaling spring = dense bloom; heavy gym summer = thick latewood; quiet year = sparse bloom, honestly shown). All roles derive from the existing tokens:

| Role | Season (F2) | Token derivation | Renders |
|---|---|---|---|
| `seasonSpring` | growing · Mar 1–May 31 | `blush` + `accent` (the spring green merges with the accent) | the flush: buds burst, the winter bank converted at once |
| `seasonSummer` | growing · Jun 1–Aug 31 | `accent` family, muted-ink greens | full canopy (never saturated forest); thick latewood on the gym branch |
| `seasonAutumn` | growing · Sep 1–Nov 30 | muted rust/amber — `danger`-family rust + the `gold` family | fruit + color, the leaf-fall re-bake (D111 P-03 + the ~150–300-sprite litter), winter-persistent fruits (crabapples/hawthorn hips) |
| `seasonWinter` | resting · Dec 1–Feb 28/29 | desaturation of the canopy + `blushDim`/leaf-bud tones | honest dormancy: bare branches, leaf-buds, scale-wrapped habit buds; everything banks |

**The gold boundary on the tree (DV-M8, token-level lock).** gold appears on the tree ONLY for streak-derived signals (a habit bud's swelling ring, the app's streak ring on the dashboard dual) — NEVER on achievement flowers, year rings, or the bloom; those use the blush/rust palette. The renderer must not spend gold on the flower layer.

**Identity-axis color roles (D112 + D086).** The identity-axis filter chips (UIUX.md tree tab / LifeTree §16 — flower family, tier magnitude, branch/domain) use the existing chip grammar: `surfaceRaised` pill track, active = `accent`, inactive `textSecondary`. The flower-family identity's color is the D086 derived accent: a deterministic core (same for every earner) + accents derived from the user's domain balance, within the accent luminance band (D111(7)), never gold. Tier magnitude carries size/mark differences, not color alone (D111(3)) — a Grove bloom is visibly larger and structurally distinct, not just brighter.

### 2.7 LOD render & accessibility tokens (D111, INT-09; docs-pass D166)

<!-- docs-pass D166 (LOD render & accessibility tokens): D111 (surface/render cluster) + INT-09 (motion tiers). Superseding sources: LifeTree.md §15, UIUX.md render states. -->

**Motion tiers (D111 M-3).** The duration/curve tokens (§2.2) are the shared base; the tree and its ceremonies add three explicit tiers:

| Tier | Rule |
|---|---|
| FULL | the D094 durations (§2.5); the tree's growing/seasonal motion |
| REDUCED | particles off, transitions as quick fades (the locked 300ms-fade precedent); the reduced-motion preference selects it |
| NONE | instant state changes, announcements only (the semantics surface still narrates) |

The full path degrades automatically on low-end devices (an FPS-based ladder, not binary).

**The LOD-ladder typography contract.** LOD-1 MASS = silhouette + canopy masses only (first paint — the current state blob instantly, shimmer for detail); LOD-2 STRUCTURE = branches, retention-window twigs, leaves at mature granularity; LOD-3 DETAIL = per-entry leaves + organ anatomy, on zoom/interaction only. Labels and numbers render legible at their LOD (the label type tokens + `tabularFigures` for counts); the semantics surface (one deterministic source → pixels and semantics, LifeTree §15) supplies every organ's label + status + tap action — the pixels and semantics cannot diverge.

**Contrast + hit-area floors (D111(7)/(8)).** Tree palette colors meet **≥3:1 non-text contrast** in both themes (the design-system floor; the existing text floors in §7 stay). The D086 accent luminance band is respected. A deuteranopia pass is a locked gate at the mockup + stress-test steps. Every tappable organ has a **≥44px effective target** even at LOD-1 mass — the cluster map decouples the hit area from the painted size.

### 2.8 Duality tokens — one animation language, two scales (INT-06, D088 B; docs-pass D167)

<!-- docs-pass D167 (duality tokens): INT-06 + D088 B + D112 DV-C5. Superseding sources: LifeTree.md §4.3 (the duality principle). -->

The section UI is the local view of its tree organ: habits tab = bud garden · journal = leaves · nutrition = sap monitor · gym = branch growth · goals = orchard · achievements = garden. ONE derived state, ONE animation language, TWO scales. Token implication: the same duration/curve tokens (§2.2) + the motion tiers (§2.7) govern the tree AND the section-local views — the habit card's bud states (dormant / swelling / bursting / scarred, replacing the mini-plant stages per D112 DV-C5) animate with the same tokens as the tree's habit branch, so the local view and the tree never disagree.

### 2.9 Block presentation rule — numbers > charts glance (L071; docs-pass D168)

<!-- docs-pass D168 (block presentation rule): L071 (L-12). Extends the token section; future UI/UX may change — noted, not locked. -->

Glance blocks lead with a **SINGLE number** — streak "14", storage "62%", protein "168/168g" — number-led headlines use the `title`/`display` type tokens with `tabularFigures`; **analysis surfaces** (weekly review, strength snapshot, goal detail) get the charts; the **macro-gap bar is the hybrid** (live number + capacity context — locked); the dashboard's top half is number-led, the bottom half chart-enabled with number-led headlines; the **heatmap strip is the EXCEPTION** — a chart that IS a glance.

## 3. App shell composition

```
App
└─ Stack
   ├─ AtmosphereLayer           (z0: washes (+ image layer on Journal surface only))
   ├─ Scaffold
   │  ├─ desktop (≥800): Row [ NavigationRail 80px (pill indicator), ContentColumn ]
   │  └─ mobile:       Column [ ContentColumn, NavigationBar 76px (sliding pill indicator) ]
   │     ContentColumn: max 640px centered, padding spaceLg, scrollable
   ├─ Fab                      (56px accent pill; per-screen: Journal/Habits; hidden on Settings)
   └─ ComposeOverlay / MediaViewer / Sheets   (stack top, elevOverlay)
```

Nav switching: fade-through (`durFast`). Active pill indicator slides with
`curveEmphasis` via `AnimatedAlign` (layout-driven, no manual index math):
mobile 52×30 accentDim pill in the bar; desktop 48px pill in the rail.

## 4. Component specs

### 4.1 Pill button (the signature)
- Inverted pill: `accent` fill, `onAccent` text/icon, `StadiumBorder`;
  height 48 mobile / 40 desktop (≥44 target with padding). Pressed: scale
  .97 `durInstant` + accent @ 85%. Disabled: `surfaceRaised` fill,
  `textDisabled`. Loading: spinner in-pill. Secondary pill (`ghost2`):
  `surfaceRaised` fill + hairline border + `textPrimary`. One primary per
  screen.

### 4.2 BlockCard
- `surface` fill, `radiusLg`, `elevFlat`, padding `spaceLg`; optional title
  row (`title` + quiet accent link `bodySmall`). Successor to the current
  BlockCard — same API, token-driven. Dashboard blocks stack `spaceXl` apart,
  full-width on mobile, 640px column on desktop.

### 4.3 Habit tile (Habits + Today ticks)
- `surfaceRaised` fill, `radiusLg`, `elevFlat`, min 44px tall. Left: 44×44
  check circle (`radiusPill`, hairline border; checked = `accent` fill +
  `onAccent` check). Middle: name `tileTitle` + streak line `bodySmall`
  (≥3 → `gold`). Right: **7-day dot row** (G9) — 6px pills, checked =
  `accent`, unchecked = hairline, today = accent ring (transparent fill +
  1.5px accent ring). Checked animation: pop scale 1→1.15→1 `durInstant`;
  streak text fades `durFast`, gold transition 300ms.
- Habits screen detail (extra): tap name → expand reveals **30-day dot grid**
  (5×6, same dot grammar) — G9, no charts.

### 4.4 Journal entry tile
- `surface` fill, `radiusLg`, `elevFlat`. **Media-first anatomy:** when the
  entry has attachments, a 16:9 media row leads (1 hero thumb full-width, or
  2–3 thumbs 3-up with a count pill `surface`/`label` on the last); then
  body preview 2 lines `bodySmall` `textSecondary`; footer row: time `label`
  `textSecondary` + Life Area `label` (accent-tinted at 60%). Thumbs fade in
  `durFast` on decode; placeholder = gradient wash `surfaceRaised`→`accentDim`
  + "generating…" `label` `textDisabled` (G6 non-blocking).
- Text-only entries: body preview leads, 16:9-less, same footer.

### 4.5 Date group header (journal timeline)
- Sticky row: day label (`title` 15px — "Today", "Yesterday", or "Tuesday,
  Aug 21") + entry count `label` `textSecondary` ("2 entries") right;
  hairline bottom rule; solid `surface` background so timeline content
  scrolls under it cleanly. First group sits below the screen header with
  `spaceLg` margin.

### 4.6 FAB
- 56×56 `radiusPill`, `accent` fill, `onAccent` icon, `elevRaised`; pressed
  scale .92 `durInstant`. Position: bottom-right above nav bar (mobile) /
  content column bottom-right (desktop). Visible on Journal + Habits only;
  hidden (fade+scale .7, `durFast`) on Dashboard (quick-capture owns the
  action) and Settings (Export owns it).

### 4.7 Nav bar / rail
- Mobile: `NavigationBar` 76px, `surface` @ 96% + hairline top border,
  backdrop blur 8px; sliding accentDim pill indicator; active icon+label
  `accent`, inactive `textSecondary`; labels `label` 11px.
- Desktop: `NavigationRail` 80px, `surface` fill + hairline right border,
  same pill indicator, 48px targets; icons 22px.

### 4.8 Storage meter (always visible)
- BlockCard; label row ("Storage" `title` 15px + "1.2 GB / 4.5 GB"
  `bodySmall` tabularFigures); 8px `radiusMd` track `surfaceRaised`, fill =
  `accent` → `warning` at ≥70% → `danger` at ≥90%; fill width animates
  `durSlow` `curveStandard` with the color shift. ≥70%: dismissible banner
  (slide-down fade `durFast`) — "Storage at 70% — free space by removing
  media"; ≥90%: hard-warn + "Export backup now" pill → Settings → Data.
  Banners re-appear on next load until resolved (MediaStorage.md).

### 4.9 Dialogs & sheets
- Dialog: `radiusXl`, `surface`, padding `spaceXl`; `title` + `body`; actions
  ≥44px — Cancel = ghost2 pill, destructive = `danger` text pill.
- Bottom sheet: `radiusXl` top corners, 32×4 hairline drag handle, `spaceXl`
  padding, max 92% height. Used: habit edit, habit add, media viewer caption.
- Media viewer (G3): full-screen `bg` sheet, photo `BoxFit.contain`, close
  pill top-right, caption bar `bodySmall` bottom.

### 4.10 Empty states
- Centered in-card column: one line `body` `textSecondary` + optional accent
  pill action ("Create your first habit"). No illustration in M0. Honest,
  non-judgmental (UIUX.md); an empty screen is an invitation to act.

### 4.11 Segmented control
- `surfaceRaised` track `radiusPill`, 3px padding; active pill = `surface`
  fill + hairline + `textPrimary`, slides `durFast` `curveStandard`; inactive
  `textSecondary`; height ≥44. Used: compose Life Area, theme picker.

### 4.12 Coach note block
- BlockCard "Coach"; content `bodySmall` `textSecondary`; 24×24 ghost X
  top-right (G10) → confirm dialog "Dismiss today's note?" → deletes today's
  `coach_outputs` row; surfaces again tomorrow.

### 4.13 Loader / brand moment (first paint — 2.0s solid)
- Full-screen `bg` over the atmosphere. Sequence (fixed 2s total, cold start
  only, never tab switches):
  1. 0–1.15s — pill-outline brand mark (132×64, `radiusPill` stroke 2.5,
     `accent`) **draws itself** (stroke-dasharray animation, `curveStandard`)
  2. 1.05–1.55s — accent dot pops in center (scale .4→1, `durFast`)
  3. 1.25–1.85s — wordmark "PersonalOS" fades up 4px (label 13px,
     letterspaced .16em, `textSecondary`)
  4. 1.45s+ — three breathing dots pulse (5px pills, 1.4s loop, accent at
     peak) — fill remaining time until 2.0s
  5. 2.0s — layer fades out `durSlow` (unless content not ready — waits for
     first frame, never blocks; transparent when done, `AnimatedOpacity`)
- Flutter: `CustomPainter` stroke draw + `AnimationController` sequence.
- Reduced motion: static mark, 300ms fade, still 2s (brand beat is the
  contract, not the animation).

### 4.14 Quick-capture (G8)
- 48px `radiusPill` row, `surfaceRaised`, placeholder "What happened today?"
  `textDisabled`; trailing 36px accent send pill (inverted), disabled until
  text. Focus: border hairline→`accent` over `durFast` (focus ring). Enter →
  compose pre-filled with today's timestamp.

### 4.15 Text inputs — the "not generic" field system
- The default TextField look is explicitly rejected. Fields are **layered
  surfaces**, not boxes:
  - Base: `surfaceRaised` fill, `radiusMd` (title uses `radiusPill`),
    hairline border, 14px 16px padding, 15px text.
  - Focus: border → `accent` (1.5px), `durFast`; no floating label — a
    persistent quiet label above (`label` `textSecondary`) or a meaningful
    placeholder, never both.
  - Multiline (journal body): `radiusMd`, min 130px, `lineHeight 1.5`,
    hairline bottom emphasis grows with content height (AnimatedSize,
    `durFast`) — the field *responds* to the entry being written.
  - Error: `danger` border + `bodySmall` `danger` message; never both border
    colors.
  - Desktop hover: `surfaceRaised` → `#202A22` wash; cursor text.

## 5. Per-screen layout rules

Breakpoint < 800 mobile (bottom nav) / ≥ 800 desktop (rail). Content column
desktop: centered max 640px, padding `spaceXl`. Touch targets ≥44 everywhere.
One primary action per screen.

### 5.1 Dashboard
Block order (UIUX.md): **Today** → Coach → Goal progress → Today's tasks →
Streak/XP; **storage meter always visible**.
1. Header: "Good morning." `display` + "Friday, August 21" `bodySmall`
   `textSecondary`. No avatar in M0. (The greeting is the thesis: the app
   opens on *the user's day*, not on chrome.)
2. **Today card** (BlockCard): habit ticks (§4.3, compact rows) + quick-
   capture (§4.14). Primary action = quick-capture.
3. Coach note BlockCard (§4.12).
4. Goal progress / Today's tasks / Streak-XP: BlockCards, one-line empty
   states (H4: placeholders in MVP).
5. Storage meter BlockCard (§4.8), last.
Desktop: single 640px column; Goal/Tasks placeholders may sit side-by-side
in a `Row` only when both are empty-state cards (cheap, honest).

### 5.2 Journal (the ambience home)
- **Ambience:** the image layer (§2.3) renders behind this surface only —
  soft botanical photo, ≤12% opacity + scrim. Cards stay opaque; the image
  lives in the gutters, the header zone, and between groups. Fades in
  `durSlow` on surface open.
- App bar: "Journal" `headline`. No search icon in M0 (open question c
  resolved: drop — dead affordances violate the honesty contract).
- **Ordering** (researched from ABY/5 Minute/stoic./Bloom/one year):
  newest-first, grouped by day under sticky date headers (§4.5); entries
  within a day ordered by time descending; media-first tiles (§4.4);
  "Today"/"Yesterday" naming, older days by date. First group margin
  `spaceLg`; groups separated `spaceXl`.
- FAB = compose (primary action).
- Entry tap → compose screen read mode (edit allowed).

### 5.3 Compose (full-screen overlay, `elevOverlay`)
- Top bar: close X left (icon-btn `surfaceRaised`), "New entry" `title`,
  **Save pill** right — primary action, disabled until body/title/media
  exists.
- Body (§4.15 fields): title pill field; body multiline field (responds to
  content); timestamp row (editable → date/time picker); Life Area segmented
  (§4.11); tags chips (`surfaceRaised` pills, "+ Add tag" ghost).
- Media row: 16:9 thumb strip (`radiusMd`) + "+ Add" dashed pill; vlog
  recording dialog (G5): live video preview (srcObject), red-dot pulse,
  stop → review screen (G4): duration + optional title + Keep/Discard pills
  (Keep: row created immediately, duration stamped; Discard: file wiped, no
  row, zero trophies).
- Save → pop fade `durFast`.

### 5.4 Habits
- App bar: "Habits" `headline`.
- List: habit tiles (§4.3) in one BlockCard group; one-tap check-off; tap
  name → expand 30-day dot grid (G9). FAB = add habit (primary) → bottom
  sheet: name field (§4.15), Life Area picker, Save pill.
- Tile menu (desktop hover chevron / mobile long-press): edit, archive
  (archive → confirm dialog).
- Research basis: Streaks (circular toggles, week dots), Habitify (sheet
  add/edit, segmented), Fabulous (card list) — our tile merges these into
  one grammar with the pill/check language.

### 5.5 Settings
- App bar: "Settings" `headline`; search pill field at top (`surfaceRaised`,
  filters group labels — H4 escape hatch).
- Groups as BlockCards (GENERAL, COACH, DATA & STORAGE in M0; others render
  on data — H4). GENERAL: theme picker segmented Ink/Paper (proves the
  registry swap). DATA & STORAGE: "Export backup" pill = primary action +
  "Restore" ghost2 pill.
- Advanced tier: collapsed drawer (M0: none; flagged).

### 5.6 Welcome (G7, first-run)
- 3 steps, full-screen, `bg` + washes (no image layer): (1) what PersonalOS
  is — `display` line + 2 lines `body` + "Start" pill; (2) create 2–3 habits
  — habit add rows + "Continue" pill; (3) first journal entry — compose-lite
  (body field + "Done" pill). Progress: 3 pill dots, active = `accent` fill.
  No skip (UIUX.md 3-step); back allowed. Research basis: Headspace/Calm
  single-CTA + dot progress — no carousel.

## 6. Animation details (beyond tokens)

- **Cold start:** loader 2s (§4.13) over atmosphere; shell painted behind.
- **Content open:** column fades up 8px `durSlow`; blocks stagger 40ms
  (Today first; never blocks first paint).
- **Tab switch:** fade-through `durFast`; pill indicator slides
  `durFast` `curveEmphasis` (`AnimatedAlign`).
- **Habit check:** pop `durInstant` + streak fade; gold at ≥3 (300ms).
- **Quick-capture → compose:** compose fades up `durSlow`; send pill enables
  `durInstant`.
- **Thumbs:** `durFast` fade-in on decode.
- **Storage:** fill + color `durSlow`; banner slides in.
- **Vlog recording:** red dot pulse 600ms loop — the one ambient motion on
  that surface; stops on capture.
- **Atmosphere drift:** §2.3 (Ink only).
- **Ceremony language:** §2.5 — the D094 durations, the queue + replay-on-open + viewed watermark, the REDUCED-tier static fallback; never confetti, never a push.
- All gated by `disableAnimations`.

## 7. Accessibility & targets

- All interactive targets ≥44×44 logical px.
- Contrast: `textSecondary` on `surface` ≥ 4.5:1 (Ink ≈ 7:1); accent-on-bg
  ≈ 4.6:1; gold only at bodySmall+ with text labels.
- Tree surface (M9): the tree palette meets ≥3:1 non-text contrast in both
  themes (the §2.7 floor); every tappable organ keeps a ≥44px effective target
  even at LOD-1 mass; a deuteranopia pass is a locked gate (D111).
- Keyboard focus: 2px `accent` outline, desktop.
- No color-only semantics: streaks = gold + text; storage = color + numbers;
  dots = semantic tooltips.
- Reduced motion: everything instant, drift off, loader static.

## 8. PC vs mobile differences (explicit)

| Aspect | Mobile (<800) | Desktop (≥800) |
|---|---|---|
| Nav | bottom bar 76px, thumb-reachable | left rail 80px, mouse-reachable |
| Content | full-width, padding 16 | centered 640px column, rail beside |
| Primary action | FAB above bar / pill in card | same, bottom-right of column |
| Hover | none (touch) | ghost buttons get accentDim wash; tiles raise 1px; cursor pointer |
| Focus | tap-to-focus fields | visible keyboard ring 2px accent |
| Scrollbar | hidden | visible thin (8px, hairline thumb) |
| Atmosphere | washes + image layer same | same layer, wider geometry (washes scale up) |
| Density | one column always | placeholders may pair (Goal/Tasks) only when both empty |
| Loader | 2s brand moment | same 2s |
Same component grammar, same tokens, same motion — layout adapts, identity doesn't.

## 9. Mobbin evidence (2026-08-21)

Via `tools/mobbin_search.mjs` (bypass harness; findings in
`tools/research_*.json`):

- **Habit dashboards (Streaks/Fabulous/Habitify — 16):** flat surface cards
  on near-black, pill active states, circular checks, gold streak numerals,
  no glow/neon → muted-accent direction confirmed.
- **Ambient homes (Headspace/Calm/Ultrahuman/Mindvalley/pillowtalk — 15):**
  quiet gradient washes, breathing negative space, one calm focal image;
  progress tucked into small chips → atmosphere layer + restrained image
  layer validated; Dashboard = greeting + one hero card + quiet blocks.
- **Journal timelines (Journal/ABY/5 Minute/stoic./Bloom/one year — 29):**
  sticky day headers with counts, cards grouped by day, media-first tiles,
  date-pill affordances, FAB compose; stoic. pairs Toolbar+TextField+Upload
  in one compose strip; Bloom uses Timeline+Notifications; one year uses
  carousel tabs → ordering spec (§5.2) built from these.
- **Journal compose (same apps — 20):** TextField-centered, Full-Screen
  Overlay or Bottom Sheet with Gallery, segmented areas, date pickers →
  field system (§4.15) + compose layout (§5.3).
- **Habit surfaces (Fabulous/Streaks/Habitify — 11):** Calendar + Progress
  + Reminder screens; segmented controls in sheets; bottom-sheet add/edit →
  habits spec (§5.4).
- **Settings (Apple Fitness/Gymshark/Lifesum/Strava — 36):** grouped lists,
  switches, sliders, avatar rows; search-first on large sets → settings
  spec (§5.5).
- **Onboarding (Headspace/Calm/Ultrahuman/Mindvalley/pillowtalk — 9):**
  single CTA pill, dot progress, checklist setup → welcome spec (§5.6).
- **Reference prototype:** token parity confirmed; pickups — loader, washes,
  nav pill slide, per-screen FAB, focus rings, gradient thumb placeholders.
  Rejected: full-bleed imagery everywhere, 480px max-width, inline overrides.
- **User reference images:** pill signature + inverted pills (1), nav pill +
  FAB (10), ink-green mood (2/5/8).

## 10. Implementation notes (build order)

1. `lib/core/theme/tokens.dart` + `themes.dart` (registry: Ink + Paper
   incl. atmosphere/loader specs); `theme.dart` delegates; `app.dart` reads
   key via provider. No new dependencies.
2. Shell: `AtmosphereLayer` + `NavShell` rework (sliding pill, per-screen
   FAB) + loader widget (2s).
3. `BlockCard` → token-driven; field system (§4.15).
4. Per-screen passes: Dashboard → Journal (ambience image + ordering) →
   Habits (dots grid) → Settings (picker) → Welcome. Widget tests + release
   build + `tools/serve_web.mjs` boot + playwright screenshots at every
   stage; user reviews screenshots visually.
5. Verify: analyze clean, tests green, release build, boot check. Retro
   entry + lesson (AGENTS.md).

## Open questions (resolved 2026-08-21 — user decisions)

- (a) Amber-as-gold reserved for streaks — **APPROVED**.
- (b) Paper ships with the picker (basic polish) — **APPROVED**.
- (c) Journal search icon — **DROPPED** for M0 (dead affordance).
- (d) Atmosphere drift on Ink — **KEPT** (kill if gimmicky in browser).
- (e) Loader — **2.0s SOLID** (user-set).
- (f) **NEW — atmosphere image asset:** decision **DEFERRED by user 2026-08-21**
  — the procedural ink-wash fallback (CustomPainter, zero deps) is built
  first so the UI is complete; the user decides on real imagery (mood images
  2/5/8 as webp ≤200KB in `assets/atmosphere/`) AFTER reviewing the built UI.
  The image-layer slot stays in the architecture regardless.