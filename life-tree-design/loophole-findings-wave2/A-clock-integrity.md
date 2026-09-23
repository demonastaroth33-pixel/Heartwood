# WAVE 2 — OPERATIONS HUNT · LENS: THE CLOCK & DATA-INTEGRITY

**Hunt date 2026-09-23. Scope: timezone anchoring, retroactive logging,
event mutation, rest-flag awareness, derivation integrity, the birth edge,
clock skew. Reads the locked design (VISION/SCHEMA/LOOPHOLES/INPUT-INVENTORY/
scan-outputs/01-data-layer + TEMP-PLANNING D085–D099) and the M0 code truth
(lib/data — the schema the tree will actually derive from).**

**Verified facts the hunt stands on (code, not docs):**

- The implemented `events` table has NO `writtenAt` column and the
  `EventRecord` model has NO `writtenAt` field (event_record.dart:3–26;
  database.dart §1.7). The locked E2/M7 contract ("writtenAt stays on the
  row for operational truth", TEMP-PLANNING-Achievement-Spec.md E2,
  04-roadmap.md L992–994) describes a column that does not exist. Every
  clock-skew guardrail in the locked design is therefore unimplementable
  today.
- `dayKey(DateTime)` = the DateTime's LOCAL y/m/d (lib/core/ids.dart:11–16)
  — the L053 midnight rule (capture-time local date) is device-local,
  offset-stripped. The `timezone` settings key (Database.md:21) is never
  read by any date path.
- `EventRecord.toJson` serializes `occurredAt` via `toIso8601String()` on a
  LOCAL DateTime — offset-less wall clock ("2026-09-23T14:30:00.000").
  `DateTime.parse` on restore re-interprets it as the restoring device's
  local time → the ABSOLUTE INSTANT of an event shifts across timezone
  restore; only the wall clock (and the stored dayKey) survive.
- `EventRepository.query` orders by `occurredAt` ASC only (event_repository.
  dart:26–49) — no tie-break. Equal-timestamp events (habit.missed batches
  at day-start; bulk restores) return in insertion order.
- `uncheckIn` HARD-DELETES the check-in row AND its `habit.completed` event
  (habit_repository.dart:91–105) — the M0 deviation from the doc's
  compensating revoke. The event log is NOT append-only in M0.
- Journal batch import (J3) is [DOC], not implemented; whether imports emit
  `journal.created` events is UNSPECIFIED anywhere.
- Imported rows: `imported` flag + importHash on journal_entries; exports
  preserve both (export_import_repository.dart:194–197).
- The locked anti-farm list (INPUT-INVENTORY §12; scan-outputs/02-
  achievements.md L416/L433/L462): "retroactive/bulk logging" NEVER produces
  growth; "only check-ins recorded on their actual day contribute to
  streak/XP bonuses". D097 (TEMP-PLANNING L2747–2752): "Manual backdating of
  NEW events … advances the derived state honestly". The two locked texts
  contradict each other on the exact question the tree must answer.

---

## CRITICAL

### C-1 — Retroactive logging: two locked texts contradict; a paper-log catch-up can farm the tree

**Location:** INPUT-INVENTORY.md §12 L240–242 (locked forbidden list:
"retroactive logging … NEVER produce growth") vs TEMP-PLANNING.md D097 L2747–
2752 ("Manual backdating of NEW events … advances the derived state honestly
but NEVER rewinds (N-7 – consistent with all locks)") vs F-recursive-audit.md
N-7 (L373–391: "the stage clock reads event-date tenure (same as
achievements — consistency wins)… no tree-specific guard, documented").

**What happens:** The tree's treatment of a backdated entry (e.g., logging
last week's workout, or a weekend paper-log catch-up spanning 5 years) is
undefined, and the two LOCKED documents demand opposite behaviors:
(a) read INPUT-INVENTORY §12 → retroactive events never grow the tree (no
leaves, no twigs, no ring-window days — like imports);
(b) read D097/N-7 → backdated events advance the derived state honestly →
a weekend catch-up can complete E3 qualifying-year windows, tick
SAPLING→POLE ("first qualifying year"), grow leaves onto old stages, and
bank achievements on stages that never happened — the exact anti-farm
vector ("fake growth via the only path the anti-farm rules don't cover",
N-7's own words, which it then waved through). The tree is the app's
largest reward surface; a week of backdating = years of tree. The
implementer cannot resolve this by reading the docs — they conflict.

**Proposed rule (mirror gamification's two-tier split EXACTLY — the gap is
that the tree never defined its two tiers):** gamification itself has two
tiers — streak/XP bonuses read the dayKey (capture date: "only check-ins
recorded on their actual day contribute to streak/XP"), achievements read
occurredAt (E2 occurred-at truth: "the time the user declares the thing
happened", TEMP-PLANNING-Achievement-Spec.md E2). The tree mirrors both,
per organ:
- **dayKey organs (presence/streak-like): twig production (D088 "one twig
  per month of sustained presence"), the RHYTHM axis (weekly variation),
  dormancy/revival (D088), habit-bud swelling momentum (D087), leaf-fall
  honesty.** Retroactive events NEVER revive dormancy, never extend twig
  presence, never smooth rhythm — they are not "presence on that day",
  exactly as they never extend streaks or earn XP.
- **occurredAt organs (volume/tenure-like): leaves + extension volume,
  ring/E3 qualifying windows, stage ticks, the birth anchor.** Backdated
  events count here, exactly as E2/E3 count them for achievements (D097's
  "advances honestly, never rewinds").
- **Imports: excluded EVERYWHERE** (the global exclusion; they are not
  "declared" events — J3 rows should emit NO events, or events flagged
  imported that no organ reads).
- Amend INPUT-INVENTORY §12's line to the two-tier wording (the current
  blanket "retroactive logging never produces growth" is wrong for the
  occurredAt organs) and record the split in the ENGINE-CONTRACT with the
  gamification cross-reference. This is a decision, not a doc cleanup — it
  needs a DecisionLog entry (amends D097's "consistent with all locks"
  claim, which is false as written).

---

### C-2 — The frozen birth anchor is destructible by a normal UI action; "no events = no tree" is reachable by unchecking

**Location:** D090 B (TEMP-PLANNING L2477–2480: seed date = "the account's
FIRST EVENT EVER, frozen at creation; deletion never shifts it"; "No events
= no tree"); the M0 deviation (01-data-layer.md §14.11 + habit_repository.
dart:91–105: uncheckIn hard-deletes the habit.completed event); D098
(L2760–2804: "life doesn't rewind").

**What happens:** The anchor is defined as "the first event ever" — but in
M0 the first event ever can be a `habit.completed` (onboarding seeds 10
habits; check-in is the lowest-friction first action), and uncheckIn
HARD-DELETES that event. Consequences, in increasing severity:
1. If the anchor is derived (MIN over the current log — the only option
   for pre-M9 users under D097, and what the M7 achievement spec does:
   04-roadmap.md L988–991), deleting the first event SHIFTS the seed date
   forward — "deletion never shifts it" is false by construction.
2. "No events = no tree": a user whose only events are habit completions
   can reach ZERO events by unchecking them all (journal.deleted/media.
   removed are EVENTS, so the journal path can't empty the log — but the
   habit path can) → the tree DISSOLVES mid-life through routine UI. The
   centerpiece of the app vanishes; the "life doesn't rewind" lock (D098)
   is broken by a normal action.
3. E M-1's resolution (monotonic ratchet: the tree persists as its last
   state) was never encoded into D090 — D090 kept "no events = no tree".

**Proposed rule:**
- The anchor is PERSISTED STATE, set once: `account anchor = MIN(occurredAt)
  over non-imported, non-tombstoned, non-absence events, computed at the
  first qualifying write, stored immutable in settings, carried in the
  backup (D098 already carries it), never recomputed`. This matches the M7
  definition (04-roadmap.md L988–991) — the tree and the achievement system
  share ONE anchor, as D090 E intends ("the anchor is a shared foundation
  the achievement system READS").
- Tree existence is monotonic: once born, the tree NEVER dissolves. A
  zero-event log post-birth renders the last derived state with an
  "archived-era" why-panel note (E M-1's ratchet, now encoded). "No events
  = no tree" applies ONLY to never-had-a-counting-event accounts.
- Record the M0 hard-delete as an anchor risk in the ENGINE-CONTRACT: the
  anchor must be written at the first counting event BEFORE any hard-delete
  can remove it (write-order invariant: anchor-write precedes any delete
  path).

---

### C-3 — Clock-skew guardrails are unimplementable: `writtenAt` does not exist; a wrong device clock silently corrupts rings, stage, and seasons

**Location:** TEMP-PLANNING-Achievement-Spec.md E2 (L76–79: "writtenAt stays
on the row for operational truth only (sync, dedupe, audit). Single-user
trust model (writtenAt guard)"); 04-roadmap.md L992–994 (same contract);
the events table §1.7 (01-data-layer.md L130–146) — verified NO writtenAt
column or model field; export JSON serializes occurredAt as offset-less
local wall clock (event_record.dart:47).

**What happens:** The locked design's own guard — "writtenAt = the clock;
occurredAt = the evidence" with a trust guard between them — cannot be
built: there is no writtenAt to compare against. A user with a wrong device
clock (off by months — common after CMOS/battery failure, manual clock
edit, or a mis-set travel clock) produces dayKeys and occurredAt values
that are wrong together: the D090 stage clock ticks early, E3 qualifying
windows fill with phantom days, rings brand years the user never lived,
twigs spawn for phantom months, and the season-phase function renders the
wrong season — with zero detection, because both timestamps lie in the same
direction and nothing cross-checks. Cross-timezone restore additionally
re-interprets every occurredAt's absolute instant (offset-less ISO-8601),
so the same backup derives differently on a device in another zone.

**Proposed rule (layered, honest, no overbuild):**
1. **Add `writtenAt` to the events table** (additive migration; the docs
   already assume it — this is E2 compliance, not scope creep). One line,
   set at insert, never user-visible.
2. **Future-dating exclusion (the only clamp the design can afford):**
   events whose dayKey > today (render clock) are excluded from ALL
   qualifying/window/stage/season math — there is no legitimate
   "future happened" pattern (backdating is past-only; D097). The
   why-panel shows "future-dated — not counted". This alone stops
   forward-dated farming AND the worst wrong-clock corruption (a clock set
   ahead produces phantom future years).
3. **Derivation never uses occurredAt's absolute instant.** All calendar
   bucketing reads stored dayKeys (TZ-neutral, frozen at capture); occurredAt
   is intra-day ordering only. This makes cross-timezone restores
   deterministic (the wall clock re-interprets identically; dayKeys don't
   move).
4. **First-run clock sanity check** (one line at onboarding/launch): if
   device time deviates from the server/NTP by more than a threshold (e.g.
   ±2 days), surface a notice — the tree is the most clock-sensitive
   surface in the app; the notice is the guardrail the trust model allows.
5. Past-dated wrong clocks (clock set back) remain undetectable without
   writtenAt; with rule 1 in place, the writtenAt guard the E2 spec
   actually promises becomes implementable at the input-map step (compare
   |occurredAt − writtenAt|; beyond a bound, flag the event's dayKey as
   unverified in the why-panel). Keep the clamp soft (trust, flagged) —
   backdating is legitimate (C-1).

---

## MAJOR

### M-1 — The season-phase clock is undefined: whose midnight closes the ring, whose spring fires the annual bloom, what happens when the user travels

**Location:** D085 (TEMP-PLANNING L2403–2420: "the ring closes at the year
boundary (calendar-anchored heartbeat)"); D090 D (L2487–2488: "Calendar
seasons = VISUAL-ONLY"); D092 (L2520: Ring tier "blooms at the next ANNUAL
BLOOM (the D085 spring)"); D095 (L2630–2672: growing vs resting season,
winter bank → spring flush); E9 (TEMP-PLANNING-Achievement-Spec.md L114:
"weekday = Mon–Sun ISO … real calendar"); the `timezone` settings key
(Database.md:21, never read by any date path — verified in lib/).

**What happens:** The season-phase function, the year-boundary heartbeat,
and the annual bloom have no defined clock. If the renderer uses the device
TZ (the default reading): (a) a user crossing timezones mid-day sees the
tree's season-state FLIP (a dateline crossing on Mar 1 can show winter and
then spring within hours — or two springs in one calendar year if they cross
the dateline twice, firing the annual bloom twice); (b) the "year boundary"
ring-close heartbeat fires at whichever midnight the device currently
stands in — the yearly snapshot artifacts (D097 precomputed yearly
snapshots) are then TZ-dependent and non-reproducible; (c) the why-panel's
"every tree blooms in spring" line is not explainable ("spring in which
clock?"). The E3 windows and D090 ticks are day-counted from stored dayKeys
and are TZ-safe — but nothing says so, and the D085 "ring closes at the year
boundary" vs D090 C "rings are calendar-neutral, never chopped at Dec 31"
(TEMP-PLANNING L2484–2486) look contradictory until the count-vs-visual
split is stated.

**Proposed rule (two clocks, never mixed — document in the engine contract):**
- **The CALENDAR/RENDER clock** = the stored `timezone` setting
  (Database.md:21); if unset, the device TZ captured and persisted WITH the
  anchor at the first counting event. Season-phase, year-boundary heartbeat,
  annual bloom, sliver year-labels, and the D097 yearly snapshots read it.
  Traveling never flips the tree's season; only a deliberate settings change
  does (conscious act, why-panel states it). This is the rule the task's
  prompt proposes and it is the right one — device-TZ rendering is
  ephemeral and unexplainable.
- **The DERIVATION clock** = stored dayKeys only (frozen at capture,
  TZ-neutral) for every duration: E3 windows, D090 qualifying years, twig
  months, streak-like organs. Never occurredAt recomputation, never device
  TZ.
- **Reconcile D085 vs D090 C in one line:** ring COUNTING = E3 anchored
  365-day windows (never chopped at Dec 31); the "ring closes at the year
  boundary" = the visual heartbeat only (the winter-dormancy phase +
  snapshot boundary in the render clock).

---

### M-2 — Supersession and revokes have no derivation semantics: an edited entry can grow two leaves; a revoked completion cannot be net-zeroed

**Location:** 01-data-layer.md §3.2/§3.3 — journal.edited carries
`supersedesId = previous event id` (journal_repository.dart:79–93);
journal.deleted payload EMPTY ("—"); habit.completed_revoked /
nutrition.removed / body.weighed_revoked payloads EMPTY and no
supersedesId/entity linkage specified; INPUT-INVENTORY §1 maps
journal.edited → "leaf state update", habit.completed_revoked → "bud state
correction"; the "compensating revoke (net-zero)" claim (03-data-layer
L279–281); LOOPHOLES matrix class 1 = leaves.

**What happens:** The derivation has no defined rule for what a superseded
or revoked event does to a previously derived organ:
1. If the engine counts "one leaf per class-1 event", an entry edited 5
   times produces 6 leaves; a journal.deleted (an event!) can ADD presence
   ("leaf fall" is a state, but nothing says the delete event itself is
   not growth — class 7 says absence → no growth, but no rule states it).
2. The DOC compensating revokes (habit.completed_revoked,
   nutrition.removed, body.weighed_revoked) carry NO reference to the event
   they revoke (empty payload, no supersedesId in the dictionary, 01-data-
   layer.md §3.2). The derivation cannot identify which bud burst / sap
   entry / weigh-in day to net-zero → the honest compensating pattern the
   docs promise ("net-zero") is unimplementable; the only working
   implementation today is the M0 hard-delete (which has C-2's problems).
3. habit.missed is written for the SAME day as a completion it should
   supersede? No — the miss evaluator dedupes (eventExists per habit+dayKey)
   — but a revoke-then-miss sequence (uncheck → miss evaluator fills the
   gap) is fine under hard-delete and UNTESTED under the DOC revoke.

**Proposed rule:** the derivation is ENTITY-ORIENTED, not event-count-
oriented: (a) leaves/extension count ONLY the type-created event per
entityId; journal.edited updates the leaf's derived state (maturity from
wordCount, placement from area); journal.deleted drops the leaf — the
delete event itself never grows anything; (b) every compensating revoke
carries `supersedesId` (or an explicit entityId) of the event it cancels —
amend the event dictionary rows (payload is metadata-only, this is
metadata); the derivation replays: completed → burst; completed_revoked →
burst reverted; (c) hard-deleted events (M0 uncheckIn) are net-zero by
absence (re-derivation is correct) — see M-3 for the cache consequence.

---

### M-3 — The incremental derivation cache is append-only by assumption: a hard-deleted event leaves a ghost burst in the cached tree forever

**Location:** SCHEMA.md §3 (L70: "Incremental derivation from the event log;
derived cache; debounced on writes"); the M0 hard-delete (habit_repository.
dart:91–105 — uncheckIn deletes the event, writes NOTHING); D098 (cache is
regenerable, rebuilt on restore).

**What happens:** The derivation contract says "incremental + debounced on
writes" — but the M0 event log has a DELETE path that is not a write
(no event appended, no signal emitted). An incremental cache that applies
appends will keep the revoked bud burst (and any derived contributions:
extension, ring-window day) in the cached tree INDEFINITELY — a leaf that
never dies, a burst that never un-bursts, a qualifying-year day that never
un-counts. The pure re-derivation would be correct (event gone → net-zero),
but the cache is the thing the UI reads; nothing invalidates it on delete.

**Proposed rule:** hard-deletes are first-class invalidation signals: the
event repository's delete path notifies the derivation cache (full
re-derive on delete — cheap at the ~10k-events/yr budget, 01-data-layer.md
§13); the M3 rule does not depend on migrating uncheckIn to the DOC revoke
pattern (recommended long-term so the log is append-only again, but the
cache rule must hold either way). The why-panel gains nothing to say —
the revocation is honest by re-derivation.

---

### M-4 — Derivation ordering is not total: equal-timestamp events re-order on restore → same log, different tree

**Location:** EventRepository.query orders by occurredAt only
(event_repository.dart:26–49); habit.missed events are batched with
occurredAt = day start (coach_service.dart:41–53 — 10 habits = 10 events
with the SAME timestamp); D098 (L2767–2771: "the tree is always a PURE
FUNCTION of the current log"); restore re-inserts rows in backup order
(export_import_repository.dart — enumeration order).

**What happens:** Two derivations of "the same log" can differ: equal-
timestamp events (miss batches, multi-entry journal days, restore
re-insertion order) come back in insertion order, which restore does not
preserve (backup JSON enumerates per-table; re-insert order = enumeration
order, not original write order). If any derivation step is
order-sensitive at equal timestamps (leaf-state transitions per entity,
per-day aggregation order), the derived tree depends on insertion order →
the D098 pure-function contract is broken in a way only a restore or a
future sync (LWW union) will surface.

**Proposed rule:** the derivation consumes events in TOTAL order
(occurredAt ASC, id ASC — ids are random hex, stable across restore);
the repository query gains the explicit secondary sort (one line);
ENGINE-CONTRACT states the order and the tie-break. Also: per-type
replay keyed by entityId (M-2) makes most equal-timestamp collisions
order-irrelevant — belt and suspenders.

---

### M-5 — Protected absence has no data mechanism: rest flags, vacations, and quiet-weeks tank the RHYTHM axis and trigger dormancy — "resting, never abandoned" (D099) is unbuildable

**Location:** D099 N-6 (TEMP-PLANNING L2826–2832: protected-absence branch
copy "resting", "never abandoned" — with NO data source named); D088
dormancy (L2896–2902: inactivity → dormant); SCHEMA.md §3 RHYTHM axis
(L65: "variation of weekly activity"); habit.rest_planned → "bud scale
(protected state)" (INPUT-INVENTORY §4 — bud-LEVEL protection IS mapped);
periods table (vacation/term, 01-data-layer.md §2.4), deload_markers, coach
quiet-weeks (LOOPHOLES.md §7 — still OPEN: "do they pause the tree's
growth?"); VI-2 "Took the Time" vacation-day threshold knob (default 14
days/year, 05-uiux.md L184).

**What happens:** The rhythm axis reads raw weekly variation of class 7
activity; a planned 2-week vacation produces two zero-activity weeks →
the axis spikes toward "bursty", branch dormancy triggers ("your gym
branch has been dormant since June"), and twig production stops for the
protected month — the tree punishes the exact behavior the app's own
coach and trophy system celebrate (VI Elsewhere family). D099's "resting"
copy has no data to read: nothing marks a week as protected absence at
the branch/axis level. Coach quiet-weeks (the original candidate for
"protected absence → bud scales", D088) remain an OPEN loophole. A user
cannot take a vacation without their tree withering — the honesty lock
("resting, never abandoned") is a string in the why-panel with no
mechanism behind it.

**Proposed rule (one data definition, one consumption rule):**
- **Protected-absence days** = the UNION of: days inside `periods`
  (type vacation/term/holiday…, inclusive range), days inside
  `deload_markers`, coach quiet-week days, and days covered by a
  `habit.rest_planned` (per-habit). One owner computes the union (H3
  discipline); the tree consumes it, and F-11's absence-classification
  output (already the F-recursive-audit N-6 owner) feeds the same union.
- **Consumption:** (a) RHYTHM axis counts protected weeks as NEUTRAL (the
  week's variation is ignored, not zeroed) — a planned rest cannot make
  the user bursty; (b) branch dormancy does not trigger from protected
  absence alone (bud-scale state, "resting" copy per D099; the winter-bank
  language of D095 applies — protected days bank, spring resumes);
  (c) twig production treats protected months as presence (thinner twig,
  "resting" — the month happened, the user was there); (d) anti-farm
  bound: neutrality holds only up to the locked VI-2 vacation-day
  threshold (default 14 days/year — the knob already exists in settings);
  beyond it, protected days count as honest zero (the tree cannot be
  farmed into year-round canopy by marking every week a vacation).
- Resolves the OPEN quiet-weeks item (LOOPHOLES §7) in the same stroke:
  quiet-week days join the union.

---

### M-6 — "The tree reads the log, not the UI" is unenforceable as written: the storage-leaf character needs media facts that live outside the log

**Location:** INPUT-INVENTORY.md §1 (L25: "the tree reads the log, not the
UI"); media.added payload is EMPTY ("—", 01-data-layer.md §3.2); media
facts (sizeBytes, durationSec, mimeType, contentHash, adopted) live ONLY
in media_attachments rows (01-data-layer.md §1.2); D099 N-5 (storage-leaf
character at aggregation scale); D088 storage leaves.

**What happens:** The storage-leaf character (media-rich leaves render
thicker/richer) requires media substance — but media.added events carry
nothing, and the log-only rule forbids reading media_attachments. An
implementer either (a) derives "media-rich" from the COUNT of media.added
events per entry (loses size/duration — a 2 GB vlog and a 40 KB photo
weigh identically), or (b) quietly joins entity tables, breaking the
stated rule with no contract acknowledging it. The derivation's true
input surface is undefined — the engine contract (Step 8) cannot be
written.

**Proposed rule:** define the derivation's read surface explicitly in the
ENGINE-CONTRACT: the events log PLUS a closed list of entity joins
(media_attachments by entityId for media facts — the only join needed in
M0; journal payloads already carry wordCount/tags/area). Either enrich
media.added's payload with sizeBytes/mimeType/durationSec (metadata-only,
allowed) or list the join; the contract must state which, and the
"log-only" sentence in INPUT-INVENTORY §1 gets a footnote naming the
exception. No table beyond the list may be read.

---

### M-7 — Malformed/partial events have no rules: corrupt payloads, old payloadVersions, and NULLs crash or silently double-count the derivation

**Location:** restore validation checks format/schemaVersion/sha256 but NOT
payload shape (export_import_repository.dart:138–289 — payload is free-form
JSON); the additive-migration promise ("old backups importable",
01-data-layer.md §13 L575); the media NULL precedent ("corrupt duration =
NULL, never counts", 01-data-layer.md §1.2/§6); journal_entries.area is
NULLABLE (01-data-layer.md §1.1); journal.created payload wordCount
(payloadVersion 1 — a legacy backup may lack it); SCHEMA.md §3 BALANCE
axis (distribution across the 5 domains).

**What happens:** A hand-edited or partially-corrupt backup (or an old
payloadVersion from a future additive migration) can carry: a journal.
created payload that is not JSON, a wordCount of the wrong type, a missing
wordCount (leaf maturity thresholds: 20-word XP floor vs 40-word
qualifying floor — NULL means what?), a NULL area (the BALANCE axis's
domain distribution has no bucket for NULL → the entry is either dropped
(skewing balance) or invented into a domain (fabricating balance)); a
future payloadVersion the tree doesn't understand (silently misread vs
refused). No rule exists for any of these — the media table got its NULL
rule; the other organs never did.

**Proposed rule (mirror the media precedent, generalize it):**
- **Per-type payload validation with a fallback ladder:** unparseable or
  schema-mismatched payload → the event counts as class 7 presence ONLY,
  never content/completion growth ("unreadable record — counted as
  presence" in the why-panel; no crash, no double-count).
- **NULL rules per organ:** absent/invalid wordCount → 0 (never
  qualifies — the NULL-never-counts rule); NULL area → neutral bucket,
  EXCLUDED from the BALANCE distribution (documented, not a 6th domain);
  NULL duration → already locked (never counts); NULL supersedesId on a
  revoke → the revoke cannot net-zero → flag the revoke as unlinked in
  the why-panel (never a crash).
- **payloadVersion-gated reads:** every payload field is read through its
  version's shape; an unknown payloadVersion > current → the event counts
  as presence only until the engine learns it (additive-migration safety
  both directions).

---

### M-8 — The birth anchor is defined three contradictory ways across locked texts, and one of them lets a miss or a tombstone be the tree's birthday

**Location:** D090 B (TEMP-PLANNING L2477–2480: "the account's FIRST EVENT
EVER (any class), frozen at creation; deletion never shifts it"); M7
account anchor (04-roadmap.md L988–991: "MIN(occurredAt) across all
non-imported, non-tombstoned events — computed and FROZEN at the moment
the first real event is written; imports can never set or shift it; rings
read it"); INPUT-INVENTORY §9/§14 (L202, L299–300: "the tree's seed date
follows the coach's anniversary-anchor logic (first journal entry;
deletion shifts it) — no entries = no tree" — the STALE text, pre-D090);
LOOPHOLES.md §7 (L172–173: "anniversary anchor — RESOLVED (D090)").

**What happens:** Three definitions compete for the tree's birthday:
1. D090: first event EVER, any class → a `habit.missed` (written by the
   idempotent miss-evaluator for a habit the user created and never
   checked — coach_service.dart:41–53) or a `journal.deleted`/`media.
   removed` tombstone can be the tree's birth event. The tree is then born
   on a day nothing happened — and worse, the SEED→SEEDLING tick ("first
   logged event (any class)") fires on pure absence: a user whose ONLY
   events are misses reaches SEEDLING — a tree whose first milestone is an
   absence.
2. M7: first non-imported, non-tombstoned event — excludes tombstones but
   still admits a habit.missed.
3. INPUT-INVENTORY §14 (still the constraint register): first journal
   entry, deletion shifts it, journal-only — contradicts D090 on every
   axis (journal-only vs any-class; shifting vs frozen) and would make a
   gym-only user's tree unborn ("no journal = no tree", which D090
   explicitly rejects). This is a LOCKED contract doc that was never
   updated after D090 — an implementer reading the register builds the
   wrong anchor.
   The import edge rides the same ambiguity: J3 import rows land on
   ORIGINAL dates with the imported flag — if the import path emits
   journal.created events (unspecified!), the "first event ever" could be
   an import, and the anchor would freeze on imported history that "never
   counts" (E-ux-stage-surfaces M-1 flagged the import-only user; D090's
   wording does not close it).

**Proposed rule:**
- The tree's anchor = the M7 account anchor definition, tightened: MIN
  over events that are (non-imported, non-tombstone, non-absence —
  absence types: habit.missed, habit.completed_revoked, journal.deleted,
  media.removed, vlog.deleted, nutrition.removed, body.weighed_revoked).
  "First event that COUNTS" — the tree is born from the first growth, not
  the first deletion or miss. Record as an explicit D090 wording amend
  (DecisionLog; D090's "any class" was about the six-domain gate, not
  about absence births).
- Stage ticks read the same counting-event set (SEED→SEEDLING = first
  counting event; absence-only logs never tick the stage clock — the tree
  stays an honest seed).
- Imports emit NO events (or events flagged imported that no organ and no
  anchor read) — the import path cannot set or shift the anchor (matches
  M7: "imports can never set or shift it").
- Fix INPUT-INVENTORY §14 + §9: delete the "follows the coach's
  anniversary-anchor logic" clause; the tree's anchor is the frozen
  account anchor; the COACH's anniversary anchor (first journal entry,
  shifts on deletion) remains a coach review artifact and is NOT the
  tree's birthday.
- The anchor's date = the counting event's dayKey (stored string,
  TZ-neutral — see M-1), never a recomputed MIN at derivation time
  (restore/clock-skew immunity).

---

## MINOR

### m-1 — Future-dated events have no rule: dayKey > today produces future twigs, future rings, and early stage ticks

**Location:** dayKey capture (lib/core/ids.dart:11–16 — no bound); D090
ticks; D088 twigs ("one twig per month of sustained presence" — a future
month with events is a future twig); E3 windows (a 365-day window from the
anchor can be completed with future-dated days).

**What happens:** A device clock set ahead (or a user forward-dating —
nothing blocks occurredAt/dayKey beyond now) completes the first
qualifying year early → SAPLING→POLE ticks early, the canopy grows
twigs in months that haven't happened, and the ring brand counts days
the user hasn't lived. Unlike backdating (legitimate, C-1), there is no
legitimate future pattern — nothing "happened" in the future.

**Proposed rule:** events with dayKey > today (render clock) are excluded
from all qualifying/window/stage/twig math (why-panel: "future-dated — not
counted"). One clause in the engine contract; no UI change needed
(backdating UI is past-only by design). Subsumed into C-3's fix but worth
its own contract line.

---

### m-2 — E3's 365-day windows drift against calendar years on leap days; ring labels can disagree with the calendar year

**Location:** E3 (TEMP-PLANNING-Achievement-Spec.md L81–84: "non-overlapping
365-day window"); D090 C ("never chopped at Dec 31"); D097 yearly
snapshots ("ring by ring").

**What happens:** Day-counted windows slide +1 day per leap year vs
calendar years: a tree's "year 5" window boundary can sit 2–3 days after
its calendar anniversary. The anatomy view's ring YEAR LABELS (render
clock) then disagree with the window counts (derivation clock) by a
couple of days on a decade tree — cosmetic, but the why-panel must not
claim "your 2029 ring = calendar 2029" when the window closed on Jan 2,
2030.

**Proposed rule:** ring labels read the render clock; ring COUNTS read the
windows; the why-panel wording is "year N of your life" not "calendar
year N"; D085's "ring closes at the year boundary" = the visual heartbeat
(M-1's reconciliation), never a count. Documented, not fixed (day-counting
is the locked E3 semantics).

---

### m-3 — The dayKey/occurredAt pair has no precedence rule when they disagree

**Location:** L053 midnight rule + the nutrition backdating exception
(01-data-layer.md L276: nutrition logs dayKey = actual eat date); restore
can import a hand-edited backup where dayKey ≠ the local date of
occurredAt.

**What happens:** For one event, dayKey (capture date) and occurredAt
(declared time) can disagree — legitimately for nutrition backdating,
illegitimately for edited backups. The tree's calendar math (twigs,
windows, seasons) reads dayKey; ordering reads occurredAt; nothing states
the precedence when they conflict → a derived twig month that contradicts
the event's own timestamp, or a ring window that counts a day the event
itself says didn't happen.

**Proposed rule:** dayKey WINS for all calendar bucketing; occurredAt
serves intra-day ordering only (already M-1/M-4's rule — state it as the
pair-precedence contract in the ENGINE-CONTRACT, one line).

---

### m-4 — Travel dayKey skew: one physical day can carry two dayKeys (or one dayKey span two physical days) at a timezone crossing

**Location:** L053 midnight rule (capture-time LOCAL date — lib/core/ids.
dart:11–16); habit streaks computed over dayKeys (habit_repository.dart:
128–153); RHYTHM axis weekly variation (SCHEMA.md §3).

**What happens:** A user flying east across several zones can log at
23:00 (dayKey D) and, 30 physical minutes later, at 01:00 local (dayKey
D+1) — one physical day produces two streak/twig days; the reverse
crossing can skip one. The rhythm axis sees a phantom bursty week; habit
streaks can inflate by one day. (The gamification tier has the same
property — consistent-with-locks — but the tree never acknowledged it.)

**Proposed rule:** accepted ±1-day distortion, self-correcting at the
next crossing, DOCUMENTED in the engine contract (no re-bucketing — events
do not store their capture TZ; a capture-TZ column is a possible future
additive fix, explicitly NOT required — simplicity first). The two-clock
rule (M-1) keeps the damage bounded: windows and stage are dayKey-counted
and unaffected; only the streak-like organs see ±1 day per crossing.

---

## SEVERITY SUMMARY

| Severity | Count | IDs |
|---|---|---|
| CRITICAL | 3 | C-1 retroactive contradiction · C-2 destructible anchor · C-3 unwritable clock guard |
| MAJOR | 8 | M-1 season clock · M-2 supersession/revoke · M-3 cache invalidation · M-4 total order · M-5 protected absence · M-6 read surface · M-7 malformed payloads · M-8 anchor definition |
| MINOR | 4 | m-1 future-dated · m-2 leap drift · m-3 pair precedence · m-4 travel skew |
| **Total** | **15** | |

## THE CRITICAL LIST (one line each)

1. **C-1** — INPUT-INVENTORY §12 ("retroactive logging never grows") and D097/N-7 ("backdating advances honestly") contradict; a weekend paper-log catch-up can complete qualifying years, tick the stage clock, and grow leaves on stages that never happened. Rule: mirror gamification's two-tier split — streak-like organs read dayKey (retroactive never extends), volume/tenure organs read occurredAt (backdating counts), imports excluded everywhere.
2. **C-2** — The M0 uncheckIn hard-delete can remove the anchor's source event and empty the log entirely via normal UI → the "frozen" birth anchor shifts and the tree dissolves mid-life ("no events = no tree" reachable by unchecking). Rule: anchor = persisted MIN over non-imported/non-tombstoned/non-absence events, written at first counting event, never recomputed; tree existence is monotonic (E M-1 ratchet encoded).
3. **C-3** — The locked E2 "writtenAt guard" references a column that does not exist in the events schema (verified in code); a wrong device clock silently corrupts rings, stage ticks, windows, and seasons with zero detection, and offset-less ISO-8601 export re-interprets instants across timezone restores. Rule: add writtenAt (E2 compliance), exclude future-dated events from all math, derivation never uses occurredAt's absolute instant (dayKeys only), first-run clock sanity notice.