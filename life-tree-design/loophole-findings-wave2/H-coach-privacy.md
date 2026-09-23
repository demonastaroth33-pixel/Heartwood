# H — THE COACH & PRIVACY LENS (loophole-hunt wave 2)

**Hunt date:** 2026-09-23 · **Lens:** the tree's interactions with the Coach
system and every privacy boundary between them.
**Authorities read in full:** INPUT-INVENTORY.md (§9 coach surface, §14
constraint register) · LOOPHOLES.md (D090/D095/D098/D099, the why-panel) ·
scan-outputs/03-coach.md (117 items) · docs/CoachSystem.md (497 lines) ·
docs/MediaStorage.md (405 lines) · TEMP-PLANNING.md D088–D099 (the locked
decisions, verbatim) · docs/Roadmap.md M9 · docs/Database.md (coach_outputs) ·
lib/data/repositories/export_import_repository.dart (formatVersion 2, verified
in code) · lib/features/dashboard/dashboard_providers.dart (the live anchor
implementation) · wave-1 findings B (M-4) and F (N-6, the D099 mirror boundary
origin).

**13 findings: 3 CRITICAL · 5 MAJOR · 5 MINOR.**

---

## 1. THE COACH-TREE INTERACTIONS

### H-01 — CRITICAL · THREE-WAY BIRTH-DATE CONTRADICTION: the tree, the Coach, the input map, and the code all disagree on "day one"

**Location:** D090 (TEMP-PLANNING.md:2477-2480 — frozen first-event anchor,
"deletion never shifts it", "no events = no tree (not no journal = no tree —
a gym-only user gets a tree from day 1)") vs **CoachSystem.md:208-210** (the
milestone-review anniversary anchor = "the FIRST journal entry's date = day
one; if that entry is deleted the anchor falls back to the next-earliest. No
journal entries at all → no milestone review") vs **INPUT-INVENTORY.md:202**
("Anniversary anchor … | 4 | the tree's birth date — CRITICAL: the tree's
seed date must follow the same anchor logic") and **INPUT-INVENTORY.md:299-300**
("The tree's seed date follows the coach's anniversary-anchor logic (first
journal entry; deletion shifts it) — no entries = no tree") vs
**lib/features/dashboard/dashboard_providers.dart:23-39**
(`daysInHeartwoodProvider`: earliest habit/journal `createdAt`, recomputed
live, entity-based — a third, shifting anchor already rendered in the UI as
"Day N in Heartwood").

**What breaks:** Four anchor semantics coexist today.

| Anchor | Definition | Frozen? | Source |
|---|---|---|---|
| The tree (D090, LOCKED) | first EVENT ever, any domain | frozen, never shifts | TEMP-PLANNING.md:2477 |
| The Coach's "day one" (CoachSystem) | first JOURNAL entry; shifts on deletion; no journal → no review | shifting | CoachSystem.md:208-210 |
| The input map (Step-5 contract source!) | same as the Coach's shifting journal anchor | shifting | INPUT-INVENTORY.md:202, 299-300 |
| The live app (M0 code) | earliest habit/journal createdAt | shifting, entity-based, log-blind | dashboard_providers.dart:23-39 |

Concrete breaks:
1. **The Coach and the tree disagree on the birth date by construction.** A
   user who logs habits for three weeks before their first journal entry has
   a tree born three weeks earlier than the Coach's "day one". The Coach's
   +1-month/+3-month milestone ladder and the tree's age/rings count from
   different dates.
2. **Deleting the first journal entry moves the Coach's day one but not the
   tree's** (and the M0 "Heartwood day" moves when the first habit is
   deleted — three different behaviors for one act).
3. **A gym-only user has a tree from day 1 (D090) but can NEVER get a
   milestone anniversary review** (CoachSystem.md:210: "no journal entries at
   all → no milestone review") — the review is the exact surface the tree's
   birth date should share.
4. The input map — the document Step 5 (the schema session) builds the
   contract FROM — encodes the pre-D090 anchor logic; the recursive audit
   (F) fixed LOOPHOLES.md but never fixed INPUT-INVENTORY §9/§14.

**Proposed rule (the alignment the task directs):** the D090 frozen
first-event anchor becomes **THE shared account anchor** — one owner, all
consumers: (a) the tree's seed date + rings (D090, unchanged); (b) the
Coach's milestone-review-anniversary ladder — amend CoachSystem.md:208-210
to read "the frozen first-event anchor (D090); deletion never shifts it; no
events → no review"; (c) the M0 "Heartwood day" owner reads the same anchor
(H-11); (d) the backup format carries it (H-10). Consequences to lock in the
same DecisionLog entry: "no events → no review" replaces "no journal → no
review" (a gym-only user gets anniversary reviews; the journaling-cadence
section renders its honest empty line — already the rule for empty sections);
the review's "anchor story" copy changes from "your first journal entry" to
"your first log"; existing reviews are never deleted and the ladder restarts
from the shared anchor with smart catch-up capped at ONE coalesced catch-up
review (S020 extension — otherwise a veteran user with an earlier frozen
anchor gets a batch of re-minted reviews for dates already passed); a
deleted first entry never shifts day one anywhere in the app.

### H-02 — CRITICAL · D099's "the Coach's derived coach_outputs facts do [mirror]" HAS NO IMPLEMENTABLE REFERENT — payload-blindness is the only safe reading

**Location:** D099 N-6 (TEMP-PLANNING.md:2826-2828: "the why-panel mirrors
DERIVED FACTS ONLY — never LLM narrative (the Coach's LLM output never appears
on the tree; the Coach's derived coach_outputs facts do)") vs the actual
storage shape: **Database.md:22** (`coach_outputs` = id, kind, dateKey,
payload — a JSON string) and **CoachSystem.md:150-156** (9 kinds: daily_note,
nudge, briefing, check_in_weekly, nutrition_checkup, milestone_review_goal,
milestone_review_anniversary, phase_close, pattern_alert) and
**CoachSystem.md:139-148** (the LLM adapter renders "reflections in the same
slots" — same table, same kinds) and **CoachSystem.md:167-185** (every kind
carries "one Coach line": check_in_weekly "+ one Coach line per strictness",
phase_close "plus one Coach line", milestone reviews "one-line derived
reflection", daily_note IS a line by definition).

**What breaks:** `coach_outputs` rows store the RENDERED TEXT — in every one
of the 9 kinds. The analytics facts that fill the templates live in the H3
owner catalog (CoachSystem.md:40-45, L168), not in the table. D099 authorizes
mirroring "the Coach's derived coach_outputs facts" — but **no field of
coach_outputs is a fact**; the payload is narrative in all 9 kinds (rule-
templated today, LLM-rendered in the identical slot the day the opt-in
flips). The M0 `daily_note` payload is literally the sentence "Three days
without {habit} — what's in the way?" (01-data-layer scan §7.2). An
implementer reading the lock literally mirrors payload text (privacy break:
personal narrative on the tree); an implementer reading it safely must
diverge from the locked text (consistency break). A kind-based whitelist is
fragile: the same kind slot flips rule→LLM with one settings change — a
whitelist that is safe today is a leak after the LLM opt-in.

**Proposed rule:** rewrite D099 N-6's second sentence — **the tree mirrors
facts ONLY from the shared H3 owner catalog (the M7 analytics engine / the
tree's own owners) and NEVER from coach_outputs rows — payload-blindness
across all 9 kinds, both renderers (RuleBased and LLMBacked)**. The tree is
a sibling consumer of the owners, never a mirror of the Coach. The same
blindness extends to the stolon adaptation's L-10 feed: the why-panel
mirrors the rule's FACT, never the Reflection Generator's sentence (L-10's
status as a distinct engine is itself [AMBIG] — scan brief R). This rule is
what makes H-05/H-07/H-08/H-13 enforceable.

### H-03 — CRITICAL · THE MYCORRHIZAL CHARACTER'S FEED IS UNDEFINED — AND THE INPUT MAP FEEDS PRIVACY-ADJACENT ACTIONS INTO IT

**Location:** D088 row 10 (TEMP-PLANNING.md:2961-2963: "MYCORRHIZAL/NODULE
CHARACTER — sustained coach engagement (the app's one true symbiont, visible
in the root section)") vs **INPUT-INVENTORY.md:200** ("User actions toward
coach (delete, quiet-week, rest-flag, goal-declaration, opt-ins, annotate,
tap) | 2+4 | symbiosis intensity") vs **SCHEMA.md:70** ("Incremental
derivation from the event log") vs **CoachSystem.md:47-54** (the event log is
the single behavior history; the analytics engine aggregates the log only)
vs scan-outputs/03-coach.md items 79-87 (the seven user actions).

**What breaks — two independent breaks:**

*(a) The feed has no derivable data.* "Sustained coach engagement" has no
data contract. Of the seven user actions, only `goal.completed` (M1, class 5)
and `habit.rest_planned` (event, class 4) exist in the event log — and both
are DOMAIN events, not coach events. Not evented at all: coach check-in
completions (no event kind exists), line deletes (row deletion, no event),
quiet-week starts (a settings range, Settings → Coach), opt-ins (settings
keys), annotations (no documented table — "[AMBIG]" per scan brief item 116),
catch-up taps (no event). The tree and the M7 analytics engine read the
event log only — the mycorrhizal character **cannot be derived at all**
without a DecisionLog boundary decision.

*(b) The input map maps ALL SEVEN actions to "symbiosis intensity" — a
privacy break waiting for Step 5.* If the schema session builds from the
inventory row, the root texture derives from the **text-analysis opt-in and
the LLM opt-in state**: the tree would visibly advertise "AI is on" (the
tree must never reveal opt-in state — the LLM adapter is a private, future,
opt-in feature), and annotation text is user narrative (the mirror boundary
does not cover it because it is not coach_outputs).

**Proposed rule:** (1) the mycorrhizal feed = ONE H3 owner `coachEngagement`,
owned by the Coach subsystem (L168 — the tree consumes the owner output; the
owner's internal read surface is the Coach's own business), computed over
coach-domain inputs only: coach check-in completions + goal declarations
(`goal.completed` as the review trigger) + kept-line tenure over
coach_outputs. Deletes are **neutral by construction**: the metric is
windowed/tenure-based — a deleted line stops being counted, never subtracts,
never triggers copy ("your symbiosis faded") — the delete affordance the
Coach promises (CoachSystem.md:21-22) must never be punished by the tree.
(2) **NEVER in the feed:** opt-ins (settings are class 7 "never growth;
tree ignores" — locked), quiet-week starts (context, not engagement),
annotations (user text), catch-up taps (a delivery affordance). (3) The
event-log gap closes with additive event kinds at M8 (`coach.checkin_completed`,
`coach.line_deleted` — additive-versioned per the event contract, each with a
DecisionLog entry) — or, if zero new events are preferred, the character
manifests only from M8 on. (4) **The tree never reads mood words even after
the M2+ text-analysis opt-in** — the opt-in unlocks coach features only;
the tree's input surface is mood-free forever (C-04 rejected; the constraint
register's "mood-proxy derived-only" holds regardless of any opt-in).

### H-04 — MAJOR · THE SHARED QUIET DISCIPLINE IS HALF-DEFINED: derivation protected (wave-1 B M-4), ceremony and copy layer undefined

**Location:** J4 quiet week (CoachSystem.md:385-397 — "quiets GUILT only
(nudges/Coach lines) — never facts"; "affects nudge/Coach rules only, never
body/gym metrics") vs D099's "resting" copy (TEMP-PLANNING.md:2829-2832,
branch-level only) vs D094 (4) (TEMP-PLANNING.md:2619-2622 — the why-panel's
next-tick progress line: "the first branch grows at 3/4 weeks of gym
presence") vs D094 (3) (TEMP-PLANNING.md:2599-2618 — the ceremony queue and
"your tree grew while you were away" card) vs wave-1 B M-4 (protected
absence: no dormancy trigger, no decay, no axis penalty; bud scales).

**What breaks:** wave-1 resolved the tree's DERIVATION inside quiet weeks
(protected absence reads rhythm-neutral; dormancy never triggers from
protected days; "resting (planned)" branch copy). Undefined — the tree's
BEHAVIORAL quiet:
1. The D094 next-tick progress line is a motivational nudge-adjacent line —
   mid-quiet-week it pokes ("2 more weeks of gym presence!"), recreating the
   guilt loop the quiet week exists to mute.
2. The ceremony queue card ("your tree grew while you were away") — the
   "away" framing lands tone-deaf inside a declared pause.
3. Return-after-gap lines (C-09 family) firing inside a quiet week are
   exactly the poke J4 silences (the journal-drought rule routes through the
   quiet-week precondition — the tree has no equivalent precondition).
4. D099 gives the "resting" state to BRANCHES only; the trunk/overview has
   no quiet-week-aware line.

**Proposed rule — the SHARED QUIET DISCIPLINE (one contract line, consumed
by Coach + tree): quiet weeks mute GUILT-family and NUDGE-family copy, never
facts.** Tree-side concretely: (1) derivation unchanged (B M-4 protected
absence); (2) nudge-family copy mutes inside the range — next-tick progress
lines, return-after-gap lines, drought lines, dormancy announcements —
resuming after the range; (3) fact-family copy stays — stage, age, counts,
banked-bud schedules (facts, J4); (4) ceremonies PLAY (they are facts, and
D094's queue is not a nudge) but their copy is tone-neutral: "your tree
reached {stage}", never "grew while you were away" inside a quiet week;
reduced-motion fallback unchanged; (5) visual growth continues honestly from
logged data — a quiet week never pauses or shields the tree's growth (J4:
"never facts"; no data is logged, so growth honestly reflects that); (6) the
"resting (planned)" language extends to any organ whose absence is
quiet-week-protected (D099 branch rule + trunk-adjacent states), never a new
global "quiet tree" state. The same discipline extends to deload ranges and
periods (their quiet semantics). **And the tree never celebrates a return
that is mid-quiet-week** — the "return" moment is a coach-rule-family
nudge, silenced like all the others.

### H-08 — MINOR · D092 EARN LINE vs WHY-PANEL: no duplication today, but the copy subjects overlap and nothing forbids quoting

**Location:** D092 supporting rules (TEMP-PLANNING.md:2529-2532: "the Coach
line fires at the EARN … the bloom is silent visual; the why-panel states
the schedule for every banked bud") vs the loudness taxonomy
(CoachSystem.md:366-372, Ring/Grove only, one line at most) vs D096 banked-
bud copy (TEMP-PLANNING.md:2681-2686: "this bud carries the strongest bloom
your tree will ever grow").

**What breaks:** the two surfaces are correctly separated in time (earn =
Coach line + silent bank; bloom = silent visual + why-panel) and D092's
division of labor exists. But nothing forbids the Coach line from quoting
the tree schedule ("your tree will bloom this in spring") or the why-panel
from echoing the Coach line — which would double-celebrate one moment and
violate H-02 (the why-panel echoing Coach text).

**Proposed rule:** the Coach line speaks the ACHIEVEMENT (the streak, the
run, the record); the why-panel speaks the TREE SCHEDULE (when it blooms,
what it means for the tree) — never the reverse; the why-panel never quotes
or references any coach_outputs line (H-02); the Coach line never references
tree visuals (H-12). One celebration per moment: earn = Coach line (Ring/
Grove only) + silent bank; bloom = silent visual + schedule copy; the Coach
stays silent at the bloom (already locked).

### H-09 — MINOR · "CHECK-INS → BUD-LIKE INTERACTIONS" IS MISREADABLE AS VISIBLE BUDS

**Location:** INPUT-INVENTORY.md:198 (check-ins | class 2 | "mycorrhizal
engagement; bud-like interactions") vs D088 A (five fixed branches,
TEMP-PLANNING.md:2864-2871 — no coach branch exists) vs D088 row 10
(mycorrhizal = root-section subtle detail).

**What breaks:** the mapping phrase invites a phantom "coach branch" or
visible-bud reading at Step 5. There are exactly 5 fixed branches; the
mycorrhizal character is root texture. Habit check-ins keep their locked
class-2 bud-burst mapping (INPUT-INVENTORY §4) — those ARE visible buds; the
COACH check-in is a different input.

**Proposed rule:** correct the inventory row: coach check-ins = class 7
(presence of engagement) feeding the `coachEngagement` owner ONLY (H-03) —
never visible buds, never branch growth, never flowers.

---

## 2. THE WHY-PANEL PRIVACY BOUNDARY (deepening N-6)

### H-05 — MAJOR · WHY-PANEL DISCRETION ON CLASS-3 ROWS IS UNDEFINED (body weight, nutrition values, physique category)

**Location:** INPUT-INVENTORY.md:44 (body.weighed → "vascular + branch wood
density; weigh-in trend") and §5/§6 (class 3 mappings) vs the why-panel
(D094 (4), D096 (2)) vs **MediaStorage.md:3** ("Media is the heaviest and
most sensitive data in PersonalOS: physique photos…") and **MediaStorage.md:51-53**
(physique photos anchored via the hidden `health`+`physique` tag — the
tree's body-domain leaf character derives from class 1+3 inputs that include
C-06 physique photos, INPUT-INVENTORY.md:80).

**What breaks:** nothing leaks today — the why-panel spec quotes no values —
but **nothing forbids value quoting either**: a why-panel on the body branch
could quote "your weigh-in trend" numbers (kg, deltas) — body weight is the
single most sensitive class-3 datum; the F-13/F-18 girth/DOTS metrics are
candidates for value quoting; and the physique-photo category (the most
sensitive media category in the app) can be NAMED by the body-leaf copy.
Single-user risk is low; the shared-surface (screenshot) risk is real and
undefined.

**Proposed rule — the why-panel copy law: the why-panel explains the VISUAL,
never the source values.** It quotes the tree's own derived-visual numbers
(stage, age, twigs, rings, blooms, buds, cluster counts, density states) and
NEVER quotes source-domain analytics values (kg, kcal, macros, %, pace
verdicts, DOTS scores, weigh-in trends, adherence). Body/nutrition rows read
"your body records feed this branch's density — see Body" — no numbers, no
deltas, no trend direction. The physique-photo category is **never named in
tree copy** ("body records" at most) — its existence as a category stays in
the physique timeline surface (a deliberate surface, MediaStorage.md:270-285).
Values live in the source sections, which the user opens deliberately. This
law is also the H-07 sharing-safe default.

### H-06 — MINOR · MEDIA STUBS VERIFIED CONTENT-FREE — ONE EXPLICIT RULE MISSING: MEDIA TITLES NEVER RENDER

**Location:** INPUT-INVENTORY.md:218 ("the tree shows stubs, never content")
and :213-217 (stub honesty rules) vs D099 N-5 (TEMP-PLANNING.md:2820-2825,
the storage-leaf character) vs **MediaStorage.md:327-329** (the J7 naming
hook: `title` on media rows, "editable any time") and **MediaStorage.md:340-343**
(J7 guardrails: facts-only, "file missing" stubs, names stay offline).

**What breaks:** verified safe — the storage-leaf character is a VISUAL
(thicker/richer); count facts ("2 photos") are fine; the "file missing"
stub is a state. One gap: `media_attachments.title` is user-authored text
(the J7 naming hook) and nothing states the tree never renders it — a title
like "first gym day" on a leaf's why-panel is content-adjacent and breaks
the register's "no media in derived surfaces".

**Proposed rule:** media titles never appear on the tree or any why-panel
row (leaves, clusters, stubs alike): counts, types, sizes, and states only —
the "2 photos" fact yes, the subject never. No why-panel row may imply
content. (This is the verification the task asked for: no row currently
implies content; the title rule closes the only remaining vector.)

### H-13 — MINOR · EXPIRED GOALS: NO-BLAME EXTENDS TO THE TREE'S FRUIT SURFACE

**Location:** milestone_review_goal EXPIRED case (CoachSystem.md:197-198 —
"window closed, here's where you started, here's what to carry forward",
zero blame) vs class 5 (goals → fruits/tendrils, INPUT-INVENTORY §7).

**What breaks:** an expired goal has a defined review but the tree's goal
surface has no defined expired state — a tendril that withdraws? A withered
spur? Whatever an implementer invents carries the no-shame risk ("failed"
visuals). The review's narrative is coach text (never mirrored, H-02); the
tree still must show the expiry honestly.

**Proposed rule:** contract row — an expired goal renders as a neutral spur
without fruit (no tendril, no wither visual; why-panel: "window closed", the
same neutrality as the review); never "failed"/"missed" copy; the review's
reflection never mirrors (H-02).

---

## 3. THE SCREENSHOT / SHARING SURFACE

### H-07 — MAJOR · THE SHARING-SAFE DEFAULT DOES NOT EXIST — the why-panel is the risk surface

**Location:** Roadmap.md:876-885 (the tree = the showcase tab, "a big review
surface of the user's logged life") vs D096 (2) bank counter
(TEMP-PLANNING.md:2699-2702) vs D094 (4) why-panel vs D097 legend card.

**What breaks:** the app is single-user, but the tree is the screen users
screenshot and share. Verified already safe on the overview: trophy names and
tier labels (public game artifacts), bank composition ("5 buds: 3 Sprout, 1
Heartwood, 1 Grove"), bloom/twig/ring counts, stage, age, branch labels,
"resting" states. Unspecified and risky: class-3 values in why-panel copy
(H-05), goal titles on fruits (a fruit's why-panel showing "get to 75kg" is
a body-sensitive title), media titles (H-06), milestone-review text (H-02),
the physique category (H-05), opt-in-derived texture (H-03).

**Proposed rule — sharing-safe BY CONSTRUCTION (no "sharing mode" needed):**
(1) the H-05 value law makes every why-panel screenshot-safe; (2) fruit
labels render on zoom only — the overview strip/glance (L-12, numbers-led)
stays title-free; the why-panel may show the goal title (structured
metadata, class 5 — the goal is the entity) but never the milestone-review
reflection; (3) nothing Coach-authored (H-02), nothing opt-in-derived
(H-03), no media titles (H-06), no physique naming (H-05) ever renders; (4)
the bank counter and legend card copy stay as specced (verified safe).

---

## 4. THE EXPORT / IMPORT PRIVACY

### H-10 — MAJOR · FORMAT VERSION 2 DOES NOT CARRY THE ANCHOR THAT D098(2) LOCKS — THE TREE CACHE IS CORRECTLY EXCLUDED (verified in code)

**Location:** D098 (TEMP-PLANNING.md:2772-2774: "the birth anchor is frozen
at account creation and **the backup format carries it**"; :2795-2798: "the
tree cache is REGENERABLE — never part of the backup format's integrity
story") vs **lib/data/repositories/export_import_repository.dart:114-134**
(verified: formatVersion 2 = settings, areas, journalEntries,
mediaAttachments, habits, habitCheckins, events, coachOutputs — **no anchor
field exists**) vs INPUT-INVENTORY.md:228.

**What breaks:** D098(2)'s monotonicity-by-design is half-implemented. On an
older-backup restore, the anchor is re-derived from the restored log's first
event → **the birth date rewinds with the log** (the exact case D098(2)
exists to prevent: "If the log says years didn't happen, the tree honestly
shows fewer rings" — with the format lacking the anchor, the tree's AGE and
the Coach's milestone ladder rewind too, and H-01's shared anchor silently
regresses). Verified GOOD: the tree cache is NOT in the format (D098(5)
honored) — and it must never be added: the cache is a pure function of the
log + anchor.

**Proposed rule:** formatVersion 3 adds one account-level field (e.g.,
`accountAnchor` — the frozen first-event timestamp, written at account
creation, never rewritten; carried beside `exportedAt`, not inside `data`).
Import: present → restore the frozen anchor; absent (v2 files) → derive from
the restored log's first event and stamp the tree's why-panel with the
re-anchor note (D098(3)'s restore-stamp discipline). The anchor is an ACCOUNT
fact, not tree state — it belongs in the format; no other tree-derived data
ever enters the format. (Borderline CRITICAL — a locked-contract violation —
but fixable pre-M9 with a version bump; the tree does not ship until M9.)

### H-11 — MINOR · daysInHeartwoodProvider IS A THIRD, SHIFTING ANCHOR IN THE LIVE APP

**Location:** lib/features/dashboard/dashboard_providers.dart:23-39
("Day count in Heartwood — days since the earliest activity (first habit
planted or first journal entry)").

**What breaks:** M0's only birth-date implementation computes from earliest
habit/journal `createdAt`, live, entity-based, event-log-blind: deletes shift
it; it ignores gym/nutrition/body events; when the tree ships it will
contradict the D090 frozen anchor — the user sees "Day 214 in Heartwood" and
a tree born on a different day (H-01's multi-anchor problem, third
incarnation).

**Proposed rule:** when the tree ships, `daysInHeartwood` reads the D090
shared-anchor owner (H-01). Until then it is M0 UI — no behavior change, but
the owner swap is a contract row so the app never carries two "day one"s.

---

## 5. THE COACH'S VIEW OF THE TREE

### H-12 — MAJOR · THE COACH ↔ TREE CITATION BOUNDARY IS UNDEFINED IN BOTH DIRECTIONS

**Location:** CoachSystem.md (497 lines — the tree is never mentioned) vs
Roadmap.md M9 (876-901 — the Coach is never mentioned) vs the owner-stat
discipline (CoachSystem.md:40-45, L168: "every stat consumed by the Coach
has exactly one H3 owner … the Coach consumes owner outputs, never
re-derives") vs F-24 (weekly message depth, 3-5 lines) vs the no-hype rule
(CoachSystem.md:366-367).

**What breaks:** no rule says whether the Coach may reference the tree.
Risks: (a) the Coach computing tree visuals itself (a "bloom count" would
get a second owner — violates L168); (b) the Coach praising the tree
("your tree is beautiful") — hype, banned by the loudness taxonomy's "never
hype" and empty self-praise (the app praising its own mirror); (c) a tree
line inside a trophy fire breaks H-08's division of labor; (d) the feedback
triangle: mycorrhizal (tree reads coach engagement) → Coach cites tree facts
→ why-panel mirrors coach text — self-referential and privacy-relevant.

**Proposed rule — one direction, owners only:** the Coach MAY cite
tree-derived FACTS (age, stage, ring count, bloom count — e.g., "your tree
closed its third ring this year") in its own surfaces only —
`check_in_weekly` / `milestone_review_anniversary` / `phase_close` — via the
tree's H3 owners, cited never re-derived (L168); never in trophy lines
(loudness taxonomy + H-08); never as visual praise ("beautiful/full/lush" —
the tree is a mirror, not a trophy; the no-hype rule holds); quiet-week
respect applies to tree lines like every line (H-04); the tree's why-panel
never cites "the Coach said" (H-02); tree lines are OPTIONAL sections
(L-07 show-if-not-empty) and the Coach handles the owners' absence
gracefully before M9. The mycorrhizal character itself is never a
Coach-citable fact — engagement is the tree's private mirror of the app's
symbiosis, not a stat to quote back.

---

## 6. VERIFIED SAFE (negative findings — no new rule needed)

- **Quiet weeks never pause the tree's growth derivation** — J4 "never
  facts" + no data logged = honest non-growth; only the copy/ceremony layer
  was open (H-04).
- **Backup containing coach_outputs narrative is correct** — the backup's
  job is everything, user-owned, offline (Database.md export contract);
  no change.
- **Settings ride the backup** (quiet-week ranges, strictness, review day —
  export_import_repository.dart:121) → the protected-absence classification
  survives restore. Verified good.
- **coach_outputs idempotency (S020)** — no re-mint — good.
- **The tree never reads mood words even post-opt-in** (C-04 rejected;
  register §14) — restated as part of H-03's never-list so Step 5 cannot
  inherit the coach's opt-in surface.
- **Trophy names, tier labels, bank composition, bloom counts on the
  overview** — verified screenshot-safe (H-07's baseline).

---

## 7. SUMMARY

| # | Severity | Finding | Proposed rule in one line |
|---|---|---|---|
| H-01 | CRITICAL | Three-way birth-date contradiction (tree D090 vs Coach vs input map vs code) | D090 frozen first-event anchor = THE shared anchor; amend CoachSystem.md:208-210 + INPUT-INVENTORY §9/§14; one catch-up cap |
| H-02 | CRITICAL | D099 "coach_outputs facts" has no implementable referent (payload = text in all 9 kinds) | Payload-blindness: the tree mirrors H3 owners only, never coach_outputs rows, both renderers |
| H-03 | CRITICAL | Mycorrhizal feed undefined + inventory maps opt-ins/annotate/deletes into "symbiosis intensity" | One `coachEngagement` owner (check-ins + goal declarations + kept-line tenure); opt-ins/deletes/annotations never feed the tree; mood never reaches the tree |
| H-04 | MAJOR | Quiet discipline half-defined: derivation protected, ceremony/copy layer open | Shared quiet discipline: nudge-family copy mutes, fact-family stays, ceremonies play tone-neutral, "resting" extends beyond branches |
| H-05 | MAJOR | Why-panel class-3 discretion undefined (kg, kcal, DOTS, physique naming) | Why-panel copy law: explains the visual, never source values; physique category never named |
| H-06 | MINOR | Media stubs verified content-free; media titles unruled | Titles never render; counts/types/states only |
| H-07 | MAJOR | No sharing-safe default for the showcase screen | Sharing-safe by construction: value law + titles-on-zoom + nothing coach/opt-in-derived |
| H-08 | MINOR | Earn line vs why-panel overlap unruled | Coach speaks the achievement, why-panel speaks the schedule; never quote each other |
| H-09 | MINOR | "Check-ins → bud-like interactions" misreadable | Coach check-ins feed the mycorrhizal owner only, never visible buds |
| H-10 | MAJOR | formatVersion 2 lacks the anchor D098(2) locks (cache correctly excluded) | formatVersion 3 adds `accountAnchor`; cache stays out; v2 fallback = derive + stamp |
| H-11 | MINOR | daysInHeartwoodProvider = third shifting anchor in live code | Swap to the D090 owner at M9 |
| H-12 | MAJOR | Coach ↔ tree citation boundary undefined | Coach cites tree facts via H3 owners only, own surfaces only, never praise, no feedback loop |
| H-13 | MINOR | Expired goals have no no-blame tree state | Neutral spur without fruit, "window closed" copy |

**CRITICAL list (3):** H-01 (birth-date contradiction — Coach and tree
disagree on day one; the input map contradicts D090) · H-02 (the D099 mirror
boundary is unimplementable as written — coach_outputs payloads are text in
every kind, LLM or rule) · H-03 (the mycorrhizal character has no derivable
feed AND the input map feeds opt-ins/annotations into tree texture).