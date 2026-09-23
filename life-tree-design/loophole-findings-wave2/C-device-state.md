# C — WAVE 2: THE DEVICE & STATE LOOPHOLES (multi-device, sync, offline)

**Hunt date 2026-09-23. Lens: THE DEVICE & STATE LENS.** The tree is a
pure derivation of the event log (D098), local-first and offline-capable
(VISION), and the app ships phone ↔ PC with a REQUIRED entity-sync plane
(M11) plus Drive P2/P2.5/P3 (M10/M12/M13). Every tree feature that is
"once" (the D094 stage-transition replay, the D097 launch-day time-lapse,
the watermark, the D092/D093 annual bloom, the Coach anniversary review)
and every tree feature that is "cached" (the derived tree state) is read
against TWO devices, a merged event union, and an offline gap. Wave-1
(E-ux, F-recursive) covered the single-device watermark and the
restore-rewind case; this hunt is the multi-device and merged-log
dimension that wave-1's lens could not see.

Sources: VISION.md (§5 derivation/cache, §15/§16, principles 14b/5),
LOOPHOLES.md (D090–D099 record; §7 hot zones), TEMP-PLANNING.md tree-7
(D085–D099 verbatim: L2579–2629 D094, L2720–2759 D097, L2760–2804 D098,
L2805–2835 D099, L2630–2672 D095), scan-outputs/04-roadmap.md (M10–M13:
L905–993; §0.2 Drive phasing; D019/D059 sync), scan-outputs/01-data-layer.md
(events table, event rules L053/L044/L098, sync semantics §13, backup
format §8, EventRepository ordering), scan-outputs/03-coach.md (coach_outputs
lifecycle, anniversary smart catch-up, idempotency), scan-outputs/06-media.md
(tiers, archivedOnDevice, stubs, offload), docs/Database.md (D019 sync
semantics L282–289, backup format L301–361, migration strategy), docs/
DevelopmentWorkflow.md (S012/S031/S039), lib/data/database/database.dart
(events table: id/type/occurredAt/dayKey/area/entityType/entityId/
payloadVersion/payload/supersedesId — NO writtenAt, NO deviceId, schema
version 1), lib/data/repositories/event_repository.dart (query orders
asc(occurredAt)), loophole-findings/E-ux-stage-surfaces.md (M-7 watermark,
C-2 ceremony, M-1 ratchet) and F-recursive-audit.md (N-1 launch-day,
N-2 restore, G-2 backup/cache) — read and built upon, not repeated.

**Result: 4 CRITICAL · 6 MAJOR · 4 MINOR = 14 findings.**

---

## CRITICAL

### C-1 — The viewed-watermark is per-install with no sync rule: the "plays once" ceremonies replay on every device and after every restore

**Location:** D097 (TEMP-PLANNING.md L2739–2741: "THE VIEWED-WATERMARK: the
replay plays once (skippable…)"; L2753–2756 the one-time legend card);
D094 (L2599–2603: "REPLAY-ON-OPEN + VIEWED-WATERMARK: unviewed transitions
play… on next open"); F-recursive-audit N-1(d) (L227–228, 237: "all pre-M9
transitions are stamped viewed after the walkthrough" — a per-install
assumption); E-ux M-7 (L430: "A 'viewed' watermark persists per session");
D098 (L2795–2798: the tree cache is "REGENERABLE — never part of the backup
format's integrity story"); Database.md backup format (L301–361: NO viewed/
watermark/watermark-like state is enumerated — and the regenerable-cache
precedent, `nutrition_food_cache` L351–352, is excluded).

**The gap:** The watermark is, as the task brief states, USER STATE — a fact
about *which device has shown the user which moment* — and the design never
says where it lives, what backs it, or how it crosses devices. Concrete
breakage, all currently unspecified:

1. **Two devices, one account:** phone PWA + desktop. Both install, both
   sync. The D094 replay queue reads "unviewed transitions" — with a
   per-install watermark store, the stage transitions that played on the
   phone replay on the desktop, and the D097 launch-day time-lapse replays
   on the new device (the prompt's first-run question — see §7). The
   "once, elegantly" promise is silently per-device, not per-account.
2. **Restore wipes the watermark:** if the watermark is stored in a local
   derived/per-device table and is excluded from backup under the
   regenerable-cache precedent, then a routine restore (D098) erases every
   watermark → all ceremonies replay after restore. The D098 "older
   restore → rewind journey" affordance makes this worse: the user *may*
   want to watch, but nothing distinguishes "restore-rewind replay" from
   "accidental re-delivery of everything."
3. **WHERE it lives decides the semantics, and nothing decides it:** a
   settings scalar can hold only a single "launch replay consumed" flag —
   it cannot hold the set of viewed moment-ids the D094 replay queue needs;
   a per-device table (option B in the brief) gives per-device delivery but
   breaks once-per-account; a synced viewed-moments table (option A) gives
   once-per-account but means a fresh install shows *no* replay at all —
   which may be the wrong welcome for a veteran's new phone.

**Proposed contract (grounded in the locks):**
1. **Watermarks are user state, backup-enumerated, synced — never a
   regenerable cache.** A `viewed_moments` table: `(momentId, kind,
   viewedAt, deviceId)` — momentId = the D094 moment's derived id (stage
   transition tick id, or the D097 year-snapshot id, or the annual-bloom
   season id). It rides M11 like settings/coach_outputs and is added to the
   backup enumeration in an additive formatVersion 3. Rationale: the D098
   regenerable-cache exclusion exists because derived state rebuilds from
   the log; the watermark does NOT rebuild — it is the one piece of tree
   state that is genuinely non-regenerable, so it must be treated like user
   data, not cache.
2. **Once-per-account, delivered-per-device:** the *consumed* guarantee is
   account-level (the synced watermark set); the *delivery* is per-device.
   A device replays a moment only if (a) the account watermark lacks it AND
   (b) the device hasn't delivered it this session. Anti-spam: the E-ux M-7
   coalescing rule ("most recent unviewed transition + one growth wave
   ≤4s") applies to the *synced* queue after a merge, so a reconnect that
   lands three transitions + the annual bloom coalesces to one ceremony.
3. **The two first-run interpretations, presented (Karpathy rule — do not
   pick silently):** (i) the D097 launch-day time-lapse is account-once —
   a veteran's new phone opens straight to the current state with the
   why-panel legend, and "rewind journey" is an explicit on-demand
   affordance; or (ii) the time-lapse is per-device welcome — each fresh
   install gets the 20–40s journey once, and only the *stage transitions*
   are account-once. Both are coherent; (ii) preserves the emotional
   contract on every new device while (i) is the strictest reading of D097's
   "once." This needs a DecisionLog entry before the engine contract.
4. **Restore interaction:** the watermark rides the backup, so a same-era or
   newer restore never re-delivers; an older restore that rewinds the log
   (D098) re-arms only the moments that the rewound log un-births, and the
   "rewind journey" is an explicit opt-in, never automatic.

---

### C-2 — The derived tree cache has no cross-device invalidation trigger, and the backup/sync format has no log-state fingerprint to detect staleness

**Location:** D098 (L2795–2798: "THE CACHE RULE: the tree cache is
REGENERABLE… rebuilds on restore" — restore is the ONLY invalidation event
named); tree-3 skeleton (TEMP-PLANNING.md L2365–2366: "Refresh/caching
semantics… **when the tree re-computes**" — an open design dim); VISION.md
§5 (L258: "event log → tree state, deterministic, **cached**"); Database.md
backup format (L301–361: only `formatVersion`, `schemaVersion`, `exportedAt`
— no digest of the log content); scan-outputs/04-roadmap.md M11 (L1286–1299:
the sync plane "does NOT change the storage backend; no existing behavior is
re-derived because sync exists" — S012, which governs *entities*, not the
tree cache).

**The gap:** Device A derives its tree; device B syncs later and has a stale
cache. The design defines *what* the cache is (a pure-function cache, D098)
but not *how a device knows it is stale*. Three concrete holes:
1. **No staleness signal.** A device that syncs N new events cannot cheaply
   tell "the merged log changed → recompute" from "nothing changed → render
   from cache." The backup format carries no log fingerprint; the sync plane
   (D019) is an append-only UNION of event ids with no high-water-mark
   contract for *derived consumers*. If the tree recomputes on every sync
   push, the heaviest derivation in the app (D097's worst-frame budget is
   the tree's own perf contract) runs on every background merge; if it
   recomputes only on open, device B renders a stale tree after a sync.
2. **The two-cache skew.** The tree cache is per-device (regenerable, never
   synced — the `nutrition_food_cache` precedent, Database.md L351). Two
   devices necessarily hold two different cache states for the same account
   the moment their merge cursors differ. Nothing states that the *render*
   is allowed to differ while the *derived facts* must converge (the D060
   phone↔PC parity rule — "both devices read the same H3 owners so a number
   never differs" — has no tree-cache corollary).
3. **Restore is the only named rebuild.** D098 rebuilds on restore; sync is
   never mentioned. The sync plane is guaranteed to ship (M11 is REQUIRED,
   D059) and will touch the log far more often than restore does.

**Proposed contract (grounded in the locks):**
1. **A log-state fingerprint rides the backup format and the sync plane.**
   formatVersion 3 adds `logFingerprint` = a monotonic digest of the merged
   log state (count of distinct non-tombstoned event ids + max of a
   monotonic `syncSeq` assigned at merge time — see C-3 for the column) or,
   minimally, max(syncedSeq). The fingerprint is cheap to compare, order-
   independent, and regenerable — it belongs in the format, not in the tree
   state.
2. **The tree cache stores the fingerprint it was derived from**
   (`derivedFromFingerprint` in a per-device tree-cache row). Invalidation
   rule: on open and after every sync batch, compare the merged-log
   fingerprint to the cache's stored one; recompute (off-thread,
   shimmer-first, D098/D097 streaming rules) iff changed; otherwise render
   the cache. This is exactly the D098 "regenerable cache, never part of the
   integrity story" rule — the fingerprint *is* the integrity story's
   trigger.
3. **The D060 parity rule gets a tree-cache corollary:** derived *facts*
   (rings, stage, counts, season) converge on every device after their merge
   cursors pass the same fingerprint; the *render* (animation, ceremony)
   may differ per device — that difference is exactly the watermark's job
   (C-1).

---

### C-3 — The derivation is built as a time-ordered replay (the only reader orders asc(occurredAt)) but the synced log is an async-merged SET: delete-before-create, revoke-before-event, and parallel edit-chains can resurrect or regress tree organs, and the events table lacks the LWW columns the D019 contract requires

**Location:** D098 (L2767–2771: "the tree is always a PURE FUNCTION of the
current log"); D019/D059 sync semantics (docs/Database.md L282–289: "the
event log is an append-only UNION of distinct event ids; same-entity edits
resolve by last-write-wins on timestamp, with the stable per-install
deviceId breaking exact ties. TOMBSTONE RULE: a delete ALWAYS wins over an
earlier-timestamped edit… an entity never resurrects"); S031
(DevelopmentWorkflow.md: the same, applied to workout.deleted/revokes/
deletes); M11 (04-roadmap scan §12, L1286–1299); **lib/data/database/
database.dart L98–112 (events table: id, type, occurredAt, dayKey, area,
entityType, entityId, payloadVersion, payload, supersedesId — NO writtenAt,
NO deviceId, schemaVersion 1)**; lib/data/repositories/event_repository.dart
L45 ("orderBy asc(occurredAt)") — the natural derivation read is a
time-ordered replay; 01-data-layer §3.3 (L053 midnight rule, L044 tombstone
rule, L098 cross-domain revokes).

**The gap:** D098 asserts order-independence ("pure function of the current
log") and D019 asserts the union "needs no merge." Both are true only if the
*derivation* is order-independent over the event SET. Nothing states how;
the one existing reader orders by the user-declared, backdatable occurredAt.
Under the M11 union, four ordering hazards land on the tree:

1. **Delete-before-create.** Device A creates journal X; device B deletes X
   (tombstone). B's delete reaches the merged log before A's create
   (network/order). A naive "apply in occurredAt order" derivation either
   (a) sees `journal.deleted` with no matching create → undefined (does the
   why-panel show a phantom leaf?) or (b), when the create later arrives,
   births a leaf for an entity that was already deleted — resurrection, the
   exact thing the tombstone rule bans at entity level, unguarded at tree
   level.
2. **Revoke-before-event.** `habit.completed_revoked` (and nutrition.removed /
   body.weighed_revoked) synced ahead of the completion they revoke. The
   bud-burst must never fire from a completed whose revoke is already in the
   set.
3. **Parallel supersedesId chains.** Two devices editing the same entry
   concurrently produce two device-local edit-chains. The union contains
   both; the tree must resolve to ONE leaf state — D019's LWW-by-timestamp
   is defined for entities, and the tree reads events, so the resolution
   rule must be re-expressed for the tree's read (which chain, by what key).
4. **occurredAt is user-declared and backdatable.** The D097 backdating rule
   (honest forward-only growth) and the L053 midnight rule make occurredAt a
   story time, not an ordering key. The design's own operational-truth
   concept (CoachSystem L153: `writtenAt` = "operational truth only — sync,
   dedupe, import handling") has NO column on the events table to hold it.

**Proposed contract (grounded in the locks):**
1. **The derivation is a fold over per-entity resolved FINAL STATES, never a
   time-ordered replay.** For each (entityType, entityId): resolve the
   create/edit chain by the D019 LWW rule (timestamp, deviceId tie-break),
   apply the tombstone rule (delete/revoke wins over any earlier-timestamped
   edit/create), cancel revoke-pairs, then feed ONE final-state record into
   the tree fold. The result is commutative over the event set and immune to
   union order. The engine contract (tree-7 step 8) states this explicitly,
   and the seeded-data stress tests include "union arrives out of order"
   archetypes (delete-first, revoke-first, parallel-edit).
2. **The events table gains the sync-plane columns via additive migration
   (schemaVersion 2): `writtenAt` (immutable device clock, the LWW timestamp
   key) and `deviceId` (the D019 tie-break, reusing the existing per-install
   deviceId concept — MediaStorage `archivedOnDevice` already carries it).
   All event emission appends both from the write site. Backup format
   version 3 enumerates them. The `supersedesId` chain remains, but chain
   resolution keys on (writtenAt, deviceId), never on occurredAt.
3. **The `syncSeq` monotonic merge sequence (from C-2) is assigned at merge
   time** so the log has an order-independent total order the fingerprint
   and the derivation's dedupe can both use.

---

### C-4 — Restore × sync have no interaction contract: a per-device full-replace restore re-merges against the other device's live log and silently defeats or silently corrupts D098's monotonicity guarantee

**Location:** D098 (L2760–2804: restore is a full-replace "explicit conscious
act"; "NO silent regression ever"; the three restore cases; the cache
rebuilds on restore); Database.md L367–368 ("restore is a full-restore
operation, existing data is replaced"); D019/D059 sync (Database.md
L282–289: UNION + LWW + tombstone-wins); M11 (04-roadmap §12); S012
("no row is retroactively re-derived because sync exists"); S031.

**The gap:** Every restore rule is written for a single device. Under sync
the account has TWO live logs plus Drive. Device A restores an older backup
(full-replace → A's log rewinds, D098's honest-rewind case); the next sync
then re-merges device B's live log into A's union — the rewind is silently
undone (B's newer events re-advance the tree: **restore defeated**), or, if
A's rewound rows LWW-write over B's rows with older timestamps, the merged
log regresses B too — a *silent regression of a device that never touched
restore* (the exact guardrail D098 bans). The D098 "monotonicity by design"
scopes only to a log that "rewinds through an explicit restore"; the sync
plane has no notion of "this device just full-replaced — pause/fork the
merge." Neither the storage-frontier semantics (does A upload its rewound
log as the truth?) nor the Drive backup stream (which full backup wins when
two devices both auto-upload to P2?) is defined. The tree inherits the
result: its derived state silently re-advances or re-rewinds depending on
merge order — violating "rings never shrink" at the account level.

**Proposed contract (grounded in the locks):**
1. **Restore is a per-device rewind with an explicit sync consequence.**
   Before a restore-import that would rewind the merged log, the device
   records its current log fingerprint (C-2) and, on next sync, treats the
   restore as a fork point: the D098 "rewind journey" replay runs on THIS
   device, and the sync plane reconciles by the D019 rule set — never by
   silent re-merge. Concretely: the restore marks a `restoreStampedAt` in the
   account-level sync metadata, and the rewind-journey (D098 rule 4) is
   offered only on the restoring device; the other device's log is the
   account's live frontier and wins the merge (LWW), so the account never
   silently regresses.
2. **Drive P2 auto-upload gets a monotonicity rule:** the backup that wins
   the P2 stream is the one whose log fingerprint is a superset of the other
   (a newer restore never overwrites an older full backup with a strictly
   smaller event set — the "older backup never silently clobbers" mirror of
   D021's no-auto-restore). Restore-from-Drive is always explicit, per D098.
3. **The why-panel stamps the divergence:** the restoring device notes
   "your tree reflects your data as of [date]; this device's sync resumes
   from the account's live frontier" — honesty without corruption, per
   D098 rule 3's guardrail.

---

## MAJOR

### M-1 — The frozen account anchor is per-install: the first sync on a new device freezes the wrong birth date, and the backup format has no anchor field to converge on

**Location:** D090 (TEMP-PLANNING.md L2477–2479: "ONE frozen birth anchor:
the seed date = the account's FIRST EVENT EVER, frozen at creation; deletion
never shifts it"); S039 (DevelopmentWorkflow.md: "computed and FROZEN at the
moment the FIRST real event is written; stored immutable; survives
reinstall"); D098 (L2773: "the birth anchor is frozen at account creation
and the backup format carries it" — **the format does not**); Database.md
backup format (L301–361: no anchor field).

**The gap:** The anchor is derived as MIN(occurredAt) over non-imported,
non-tombstoned events and then frozen per-install. On a new device:
1. The install freezes its anchor at the first *synced-merged* event — but
   the merged MIN is device A's 3-year-old first event → the new device
   freezes the wrong value unless the anchor rides the merge. Two devices
   then disagree on the tree's age, stage-clock birth, and ring windows
   (the D090 stage clock and D088 trunk rings both read the anchor).
2. D098 claims the backup carries the anchor; the format (formatVersion 2)
   has no such field — the claim is aspirational.
3. Deletion-shift: S039 excludes tombstoned events, but under sync a
   tombstone for the oldest event arrives late — device A (pre-tombstone)
   and device B (post-tombstone) compute different Mins; "frozen" conflicts
   with "tombstone-arrives-later."

**Proposed contract:** The anchor is a *derived consensus value*, not a
per-install constant: MIN(occurredAt) over the merged, non-imported,
non-tombstoned event set, with a **ratchet** (monotonic — it never moves
forward past a previously-observed min except when the tombstone for that
min event arrives in the merged set; the E-ux M-1 ratchet is the house
style). Add `birthAnchor` to the backup format (formatVersion 3, additive)
and to the M11 sync metadata so devices converge; re-scope D090/S039's
"frozen" language to "frozen against backdating/import fraud; recomputed on
merged-log boundary changes, monotonically."

---

### M-2 — The offline tree is honest (season-phase is pure) but three offline-season gaps remain: the ceremony queue, the bloom-wave timing, and the D097 snapshot cold-start after a gap

**Location:** D085 (calendar skeleton; ring closes at the year boundary;
season-phase function + data intensity); D094 (L2597–2598: "plays live if
the app is open, else queued"); D095 (winter bank → spring flush; "THE
BLOOM IS EPHEMERAL… fades at the season's end"); D099 N-4a (bloom waves
across the flowering season); D097 (L2742–2746: the replay streams from
PRECOMPUTED YEARLY SNAPSHOTS, never live re-derivation); D090 (rings read
the frozen anchor, calendar-neutral).

**The good news first (stated so the fix is scoped, not alarmist):** the
derived tree never misses a season. The season-phase is `f(calendar date,
data intensity)` over the local log — pure and offline. A device offline
through a winter→spring boundary derives the spring flush, the winter-bank
conversion, and the ring close correctly on its first render after
reconnect; no data is lost. The gaps are delivery and timing:

1. **The ceremony queue has no offline-length rule.** A device offline for
   three months reconnects and finds: the ring-close chime, one or more
   stage-transition ceremonies, the annual bloom, and the spring-flush
   animation all "queued" (D094). E-ux M-7's coalescing ("most recent
   unviewed transition + one ≤4s wave") is single-device; the synced
   watermark (C-1) must drive the same coalescing so a reconnect delivers
   ONE ceremony, not a season of them.
2. **Bloom-wave scheduling is render-time.** D099 N-4a spreads an oversized
   bank across the flowering season in waves. A device that first renders in
   August has already "missed" the wave window — the waves collapse into one
   render. That is honest (derived), but the ephemeral display (D095) was
   missed, and nothing tells the user "spring's bloom came while you were
   away — here is what bloomed." The why-panel/legend needs the elapsed-
   season narration line.
3. **Snapshot cold-start.** D097's replay streams from precomputed yearly
   snapshots "never live re-derivation." A device that was offline (or a
   fresh install) across a year boundary has no snapshot for the elapsed
   year — the first render after reconnect is exactly the live re-derivation
   the D097 perf contract forbids, and N-2's worst-moment import already
   stacks on restore; sync-after-gap stacks on top.

**Proposed contract:** (a) ceremony delivery after reconnect = C-1's synced
watermark + coalescing, always one ceremony, reduced-motion static fallback;
(b) the legend/why-panel gains the season-gap narration ("your tree's spring
came while you were away — 3 rings, 12 blooms, the annual bloom" — facts-
first, L-12); (c) the snapshot builder runs lazily after any log-frontier
advance (the same off-thread, shimmer-first, streams-never-blocks rule as
D098's rebuild), and the replay degrades to live-derivation only when the
snapshot is missing, with the D097 perf budget honored.

---

### M-3 — The Coach's "viewed" state is the same watermark class and is worse: coach_outputs are synced entities whose only delivery mechanism is a destructive delete, and the per-(kind,dateKey) idempotency is per-device

**Location:** coach_outputs (database.dart L114–123; 9 kinds, 03-coach items
31–37); M0 idempotency (01-data-layer §7.1: "idempotent per (kind, dateKey) —
never overwrites/duplicates today's output"); dismissal (05-uiux §2: ghost X
"deletes today's coach_outputs row"); anniversary smart catch-up (03-coach
item 37: "generates the review the first time the app opens after the due
date — once only, no overdue nag"; S020 idempotent, never re-minted); D092
(L2529: "the Coach line fires at the EARN; the bloom is silent visual");
D088 adaptation 10 (mycorrhizal/coach symbiosis reads coach engagement).

**The gap:** The Coach line's only user-facing delivery state is *deletion*.
There is no non-destructive "seen" state. Under sync:
1. **Double minting.** Device A opens after the anniversary due date →
   generates the milestone-review row. Device B (also past due) opens →
   generates ANOTHER row, same kind+dateKey, different id. The D019 union
   keeps both → the merged account has two anniversary reviews; the
   "never re-minted" (S020) promise holds only per-device. The M0
   `(kind, dateKey)` idempotency is enforced at the write site, not on the
   merged set.
2. **Re-delivery vs dismissal.** Dismissing today's note deletes the row on
   A; the tombstone syncs, so B also loses it (correct). But the *anniversary
   card*, the *trophy line* (Ring/Grove appreciation), and the *"grew while
   you were away"* tree card have no seen-not-dismissed state at all — they
   re-deliver on every device that has not deleted them. The "once" Coach
   moments become per-device repeats, exactly the C-1 disease, with no
   watermark mechanism anywhere.
3. **The mycorrhizal read is blind to viewing.** The symbiosis adaptation
   (D088 #10) reads *engagement* from the log; dismissal-deletes are visible,
   but "seen" is not an event and cannot be derived — the tree's
   engagement signal is per-device by construction.

**Proposed contract:** (a) the C-1 `viewed_moments` table is the ONE
watermark system for tree moments AND Coach moments — coach deliverables
(anniversary review, milestone card, trophy line, weekly verdict) get
momentIds; the "once" guarantee is account-level and synced; (b) the
`(kind, dateKey)` idempotency is enforced ON THE MERGED SET — a unique
constraint or a post-merge LWW dedupe (keep the newest row id, tombstone the
duplicate) as part of the M11 apply step; (c) dismissal stays destructive
delete (locked), but "delivered-but-kept" is the watermark, not a new Coach
interaction — no new schema beyond viewed_moments, no new user affordance.

---

### M-4 — The storage-leaf character is undefined across tier moves: archiving/offloading is metadata-neutral, so the leaf must NOT change — but "storage" reads like local bytes, the stubs are device-local, and the tree would punish responsible space management

**Location:** D099 N-5 (L2820–2825: leaf-cluster character reflects media
content — storage-leaf at aggregation scale); D088 adaptation 12 (storage
leaves = media-rich entries; feed = "photo/media share of entries");
three-tier model (06-media V-01..V-06: exactly-one-tier invariant;
archivedOnDevice; syncState; thumbnails everywhere); stubs (V-10 view-only
stub, P-02/P-03 file-missing/soft-failure stubs, LC-10 `exported:false`);
L-01 vlog math (≈35 GB/yr vs 15 GB Drive; PC-archive primary); LOOPHOLES §7
media-scale hot zone (N-5 resolved at aggregation scale — tier-independence
NOT resolved).

**The gap:** The adaptation is named "storage leaf," and the natural first
implementation reads the media's *local presence* (blob resident on this
device / sizeBytes / syncState). Under the tier model that is wrong three
ways:
1. **Archiving punishes the tree.** The user PC-archives a vlog (the LOCKED
   primary destination for the majority of media volume — MediaStorage D-09)
   or offloads a photo to Drive to free space → if the storage-leaf character
   tracks local bytes, the leaf thins the moment the user responsibly frees
   space. The tree visibly changes as a *penalty for good storage hygiene*,
   and the change is an anti-incentive that fights the locked PC-archive
   primary.
2. **Cross-device divergence.** Device A (blob resident) renders a storage
   leaf; device B (same row, blob evicted/archived) renders a thin leaf for
   the same media — the D060 parity rule ("a number never differs") is
   broken for tree character.
3. **The stubs are runtime, not data.** "File missing" (adopted-folder
   scan), "stored on [device]" (V-10), and soft-failure-after-restore are
   device-local derived states that are not in the backup and not synced —
   device B cannot know A's folder file is gone, so B's leaf presentation
   for the same row differs, honestly but arbitrarily.

**Proposed contract:** Define the storage-leaf character as a **pure function
of media metadata that survives every tier move** — existence of the kept
media row + size class (sizeBytes band) + measured-once durationSec +
capturedAt — and explicitly TIER-INDEPENDENT: archiving to PC, offloading to
Drive, adoption, and re-import NEVER change the leaf's character. The
leaf's *detail panel* carries the honest availability facts (archivedOnDevice
stub note, `exported:false`, syncState, file-missing when the local scan
reports it) — availability is a presentation layer over a stable leaf, never
a character input. The offloaded case the brief asks about is then trivial
and correct: an offloaded photo's leaf keeps its character (metadata persists;
the always-local thumbnail is its preview; the stub note explains where the
blob lives). Consequence: freeing space never shrinks the tree; the storage
meter (which does track bytes) and the tree (which tracks media substance)
are allowed to diverge by design — the divergence is documented in the
why-panel's media line.

---

### M-5 — The leaf canopy at per-entry granularity has no cap under a media-heavy pattern: N-4 caps the bloom bank and the habit-bud row, nothing caps ~365 leaves/yr

**Location:** LOOPHOLES L-04 (L99–103: aggregation at early stages; per-entry
granularity at POLE+); D099 N-4a (bloom-burst visual budget — flowers only)
and N-4b (habit-bud clusters — buds only); D095 (L2643–2647: "the tree never
floods with thousands of flowers" — flowers only); D088 twigs (one per month
of sustained presence; leaves = entries/trophies); M7 media qualifying
(kept non-imported video, captured OR adopted → MEDIA domain); L-01 vlog
math (≈1 kept vlog/day is an expected daily pattern, not an edge case —
MediaStorage D-09).

**The gap:** The caps discipline (D099) covers the bloom bank and the live
habit-bud row. The leaf canopy — which at POLE+/MATURE runs per-entry
granularity — has NO cap, and a daily-vlogger archetype feeds it ~365
leaves/year (plus photos riding the same entries). At MATURE/OLD-GROWTH a
5-year consistent user's crown is thousands of leaves, each potentially a
storage-leaf (M-4) at aggregation scale. L-04's aggregation is a young-tree
mechanic ("a seedling shows a handful of leaves, never 50"); nothing re-caps
it at full granularity. This is a render/perf flood (the tree-5 perf budget
has no canopy bound) and a readability problem, and it is the tree's mirror
of the exact "never floods" discipline D095 states for flowers.

**Proposed contract:** Extend the N-4 discipline to the leaf canopy:
per-branch-per-year leaf budget (engine-contract number, e.g. storage-leaf
scale / visual budget like N-4a's); overflow aggregates into the existing
leaf-cluster (countable surface, D099 N-4b grammar — "N entries in this
cluster"), with per-entry leaves materialized only at the zoom/entry scale
(the E-ux M-4 discrete zoom ladder already materializes objects). A
media-heavy year renders as storage-leaf clusters, not a thousand
individual leaves; the count stays honest and readable.

---

### M-6 — dayKey is capture-time-local (L053) and the season-phase reads the device clock at render time: timezone travel and clock skew make the tree's months, qualifying days, and season attribution diverge across devices

**Location:** L053 midnight rule (01-data-layer §3.3: "dayKey = capture-time
LOCAL date"); D088 twigs (one per month of sustained presence); D085
(calendar skeleton seasons); dayActivityScore/dayDomainPresence
(qualifying-entry days read dayKey); M7 S039 anchor (MIN occurredAt);
01-data-layer §14 note 5 (timezone is a settings key, display-only).

**The gap:** The merged log is consistent per event (the writing device's
dayKey persists, union of ids) — but the tree reads dayKey for twigs
(month), qualifying-entry days, and season intensity, and it computes the
season-phase from the *calendar date at render time*:
1. **Two devices, one instant:** a weigh-in auto-habit or a check-in
   executed on both devices (the autoSource future producer) writes two
   events for the same instant with different dayKeys across a timezone
   boundary (23:30 vs 00:30) → two qualifying days where one instant
   happened; the first-of-day canonical weigh-in rule (NU8) then sees two
   canonical days.
2. **Render-time season from the device clock:** an offline device with a
   wrong clock or an un-updated timezone renders the wrong season-phase
   (D085 intensity + calendar) — an honest but *wrong-weather* tree until
   the clock corrects.
3. **Backdate dayKey:** the D097 honest-backdating rule lets a user file an
   event under a past date; under sync, a second device's tree derives that
   entry as a past twig/leaf — fine, honest — but a *device whose clock was
   wrong at write time* has stamped the wrong dayKey forever (the union
   preserves it), and no reconciliation exists.

**Proposed contract:** (a) the season-phase reads the account's canonical
timezone (a settings key, synced via M11) or the *merged log's* most recent
timezone record, never the bare device clock at render time; (b) the L053
midnight rule gains a sync corollary — a capturedAt-UTC column on events
(additive, formatVersion 3) so a merged log can *detect* same-instant
double-writes across devices and reconcile the first-of-day canonicalization
(a MIN-per-UTC-instant dedupe for body/nutrition/habit event families); (c)
the tree's month/twig derivation is documented as dayKey-based (writer's
local), so cross-device month attribution may differ by at most one
midnight boundary — accepted and shown in the why-panel's data line rather
than silently diverging.

---

## MINOR

### m-1 — The D097 legend card and the "grew while you were away" card are one-time but not in the watermark class: they re-deliver per device and after restore

**Location:** D097 (L2753–2756 legend card "after the replay, a one-time
card"); D094 (L2610–2612 "grew while you were away" card); C-1's watermark
table.

**The gap:** Both cards are explicitly "one-time" but have no synced flag;
they follow the same per-install fate as the replay (C-1). Minor only
because the cards are cheap and re-delivering a card is a soft failure — but
it is a visible soft failure on every new device.

**Proposed:** both cards get momentIds in the C-1 `viewed_moments` table;
account-level once, per-device delivery, restore-safe (rides the backup).

---

### m-2 — Vaulted/PC-adopted "deletes" keep the row: the tree cannot distinguish "deleted" from "retained-in-vault," so a deleted vlog can still show as a leaf after sync

**Location:** LC-04 (tier-aware delete: Drive-vaulted → "metadata row only;
never destroys the blob"; PC-adopted → app never removes the file, un-lists
+ do-not-readopt); P-05 (no silent deletion); the leaf-fall event pair
(`vlog.deleted` tombstone, 01-data-layer §3.2).

**The gap:** For vaulted/adopted media, "delete" intentionally keeps the row
(and the blob). The tree's leaf-fall is driven by the tombstone — but if the
row survives, the leaf survives; a user who "deleted" a vlog still sees its
leaf (correct per metadata honesty), and the tree cannot express "deleted
but blob retained" vs "deleted, gone" — the why-panel's leaf line can't say
which. Cross-device it gets murkier: B receives A's vlog.deleted tombstone
but B's own copy of the row (vaulted) is retained → the leaf falls on A's
derivation and stays on B's until the row state converges.

**Proposed:** the leaf's media line reads syncState + the tier-aware delete
semantics as presentation facts ("deleted — blob retained in the Drive
vault" / "removed from the library") so the leaf story is honest and
cross-device consistent; leaf *character* follows M-4 (metadata-stable).

---

### m-3 — Adopted (PC-folder) media counts as MEDIA qualifying entries on every device even though only the adopting PC holds the file

**Location:** M7 qualifyingEntry (VLOG/MEDIA = "a kept non-imported video
with measured duration, captured OR adopted"); M13 (adopted rows; "captured
OR adopted" explicitly reaffirmed, 04-roadmap §14); V-10 (foreign-device
rows = view-only stubs); A-09 (adopted ≠ app storage).

**The gap:** The phone syncs the adopted row's metadata (durationSec,
sizeBytes, capturedAt) and the M7 predicate fires — the phone's tree grows
MEDIA-domain character and storage-leaves for videos whose bytes live on the
PC. Honest (the event happened), but the phone's media branch is built on
rows whose blob it will never open, and its stubs (V-10) are
indistinguishable from "file missing." Cross-device divergence: the adopting
PC can render full stubs; the phone renders the same leaf as a foreign-device
stub.

**Proposed:** keep the qualifying predicate (locked — adopted counts), but
the leaf's detail availability line (M-4) shows `adopted on [device]` on
every non-adopting device, and the MEDIA-domain *character* weight (the
storage-leaf intensity) can optionally scale with local availability so a
phone's media branch honestly reflects what the phone can open — with the
why-panel explaining the split (facts-first).

---

### m-4 — The watermark must NOT live in `settings`: a scalar LWW settings key cannot hold a moment SET, and it would fight C-1's granularity

**Location:** settings table (database.dart L86–92: key/value scalar);
M11 entity sync (settings are syncable entities); C-1's proposed
viewed_moments table.

**The gap:** The brief's option A says "a viewed-transitions table synced
like settings." A tempting shortcut is a settings key (`treeLaunchReplaySeen:
true`). That cannot represent the per-moment set the D094 queue needs
(which transitions are unviewed after a partial replay, which bloom
delivered, per-moment restore re-arm), and a scalar LWW key cannot merge two
devices' partial histories (last write wins on the whole set). Choosing the
settings shortcut would silently degrade C-1's contract to "all or nothing."

**Proposed:** a positive rule in the DecisionLog: watermark state is a
moment-set table (`viewed_moments`), never a settings scalar; settings
carries at most the coarse "launch replay consumed" account flag as an
optimization hint, with the table as the source of truth.

---

## Summary

| ID | Severity | One-line gap |
|---|---|---|
| C-1 | CRITICAL | Viewed-watermark is per-install with no sync/backup home — ceremonies and the launch-day replay replay on every device and after every restore |
| C-2 | CRITICAL | Derived cache has no cross-device invalidation trigger; backup/sync carry no log-state fingerprint to detect staleness |
| C-3 | CRITICAL | Derivation is a time-ordered replay (only reader orders asc(occurredAt)) but the synced log is an async-merged set; delete/revoke-before-event and parallel edit-chains can resurrect/regress; events table lacks writtenAt/deviceId |
| C-4 | CRITICAL | Restore × sync undefined: a per-device full-replace re-merges the other device's live log — restore silently defeated or B silently regressed |
| M-1 | MAJOR | Account anchor is frozen per-install; new-device sync freezes the wrong birth date; backup format has no anchor field |
| M-2 | MAJOR | Offline season catch-up is honest for derived state but ceremony queue, bloom-wave timing, and D097 snapshot cold-start after a gap are undefined |
| M-3 | MAJOR | Coach viewed-state is the same watermark class and worse: double-minted (kind,dateKey) rows on the merged set, no seen-vs-dismissed state |
| M-4 | MAJOR | Storage-leaf character undefined across tier moves; naive "storage" read punishes archiving/offloading and diverges per device |
| M-5 | MAJOR | Leaf canopy has no cap at per-entry granularity; ~365 media leaves/yr floods the crown (N-4 caps flowers and buds only) |
| M-6 | MAJOR | dayKey is capture-time-local and season-phase reads the device clock — timezone travel/skew diverges months, qualifying days, seasons per device |
| m-1 | MINOR | Legend card + "grew while you were away" card are one-time but not watermarked — re-deliver per device/restore |
| m-2 | MINOR | Vaulted/adopted "deletes" keep the row; the tree can't distinguish deleted-from-library vs retained-in-vault across devices |
| m-3 | MINOR | Adopted PC media qualifies as MEDIA entries on every device although only the adopting PC holds the bytes |
| m-4 | MINOR | Watermark must not live in settings (scalar LWW can't hold a moment set) — a positive no-shortcut rule |

**The through-line:** the tree's once-ness (watermarks), its freshness
(cache invalidation), its correctness over a merged log (derivation
order-independence), and its character under media-tier moves (storage-leaf
stability) all reduce to ONE device-state principle: *derived facts converge
on every device from the same merged log; only delivery (what a device has
shown you) and presentation (what bytes this device holds) are allowed to
differ.* C-1's synced watermark set, C-2's log fingerprint, and C-3's
set-commutative derivation are the three mechanisms that make that principle
hold; everything else in this hunt is a corollary. These three need
DecisionLog entries at the engine-contract step (tree-7 step 8) and the M11
sync-plane contract, because M11 is REQUIRED (D059) and will ship against a
tree that must already be sync-safe.