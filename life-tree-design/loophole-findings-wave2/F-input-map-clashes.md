# LOOPHOLE-FINDINGS WAVE 2 — THE INPUT-MAP LOGICAL-CLASH LENS

**Lens:** hunt every logical contradiction, ambiguity, and clash across the
input surface (INPUT-INVENTORY) and its mapping destinations (SCHEMA §2.1
classes, LOOPHOLES §3 matrix, D085–D099, ACHIEVEMENT-SCAN).
**Scope read:** SCHEMA.md · INPUT-INVENTORY.md · ACHIEVEMENT-SCAN.md ·
LOOPHOLES.md · scan-outputs/01-data-layer.md · 07-ledger.md · plus targeted
reads of 02-achievements.md, 03-coach.md, 04-roadmap.md, 05-uiux.md,
06-media.md.
**Date:** 2026-09-23 · **Status:** findings for the Step-5 input-map session.

Severity legend: **CRITICAL** = a logical contradiction that will produce
wrong tree behavior if resolved silently. **MAJOR** = ambiguity that will
cause decision fatigue at the input-map step. **MINOR** = polish.

---

## 1. CLASS-MAPPING CLASHES (feature rows vs class definitions, and row-vs-row)

### F-01 [CRITICAL] F-03 PR celebration ceremony classified 6+4 — flowers from NON-achievement conditions

**Location:** INPUT-INVENTORY §5 F-03 row (`6+4 — feeds the flower ceremony +
bracts`); 07-ledger F-03 (`first-ever PR per exercise` celebration, `milestone
PRs DEFER to locked trophy rules`); SCHEMA §2.1 class 6 (`Achievement unlocks |
any achievement, any tier | flowers`).

**What clashes:** Class 6's locked mapping is *achievement unlocks only* — the
flower layer's contract is "any achievement, any tier". F-03's celebration
fires on **first-ever PR per exercise** — a condition with NO trophy
counterpart (III-3 "New Number" is a one-time first-PR-ever; III-20 "Heaviest
Session" is a session PR). With ~44 seeded exercises, a user can earn
dozens of F-03 "first PR" ceremonies, none of which is an achievement.
Classifying F-03 as 6 means the tree blooms dozens of non-achievement
flowers — a mass-bloom that (a) violates the flower=achievement contract,
(b) floods the flower budget (D099 magnitude-order waves), (c) contradicts
L-05/banking (pre-maturity flowers are buds — what is a non-achievement
flower bud?).

**Proposed resolution:** Split F-03 into its two real halves at the input map:
(1) the PR moment itself = class 4 dated event (workout.pr → branch girth
event/twig anchor); (2) the *ceremony language* = display overlay (bracts) on
whichever flower event actually fires — bracts wrap REAL achievement blooms
only, per D088 row 13 ("the F-03 flair wrapping the flowers"). Per-exercise
first-PR celebrations then render as branch-level marks (class 4), never
flowers. Requires an explicit DecisionLog row amending the inventory's 6+4.

### F-02 [CRITICAL] The body domain has NO organ home — 5 branches vs 6 presence domains vs 9 achievement families

**Location:** D088-A (5 fixed branches: journal, habits, gym, nutrition,
goals); 04-roadmap 0.3 (`dayDomainPresence` six domains = {journal, habits,
fitness, nutrition, body, media}); inventory rows: F-16 body.weighed
(`vascular + branch wood density`), F-13 (`the Life Tree body-domain
presence`), C-06/physique timeline (`branch character (body domain)`),
ACHIEVEMENT-SCAN §1.5 family V (`The Shape of Things → zygomorphic flower`,
16 trophies).

**What clashes:** (a) Body is a first-class *domain* (weigh-ins, physique
photos, V-family trophies, Six-for-Six body slot) but is NOT one of the 5
branches, and D088's fork enumeration is closed (`gym: strength/cardio;
nutrition: food/fasting/hydration; journal: photo/voice/text` — no body
fork). (b) The inventory repeatedly references a "body-domain branch
character"/"body-domain presence" that D088's organ map does not contain —
three inventory rows reference an organ that doesn't exist. (c) Weigh-ins map
to "vascular + branch wood density" — the vascular system is the NUTRITION
organ ("the vascular system, user-wired", inventory §6) — so body.weighed
feeds nutrition's vascular? The wood density of WHICH branch is unspecified.
(d) Family V's 16 trophies have no branch to attach to. (e) BALANCE axis
reads the 5 domains — body activity is invisible to BALANCE while the
achievement system counts it as a domain (IX-2, VIII-5).

**Proposed resolution:** The input map must place body explicitly. Candidate
options to present to the user (D-number needed): (1) body = a fork of the
gym branch (`strength/cardio/body` — requires amending D088's closed fork
list); (2) body = trunk/vascular-level character (weigh-ins = sap/ring
density at the trunk, no branch) — matches "vascular + branch wood density"
if "branch" is dropped; (3) body = nutrition fork (`food/fasting/hydration/
body`). Recommend (1) — the app itself files body under "Fitness & Body"
(M2 section), and ACHIEVEMENT-SCAN family V then hangs on the gym branch.
Whatever is chosen, EVERY inventory row referencing "body-domain branch"
must be rewritten to the chosen organ.

### F-03 [CRITICAL] "Qualifying year" means three different things — the stage clock, the trunk rings, and the tenure axis read different definitions

**Location:** D090 tick (`SAPLING→POLE = first qualifying year (any-domain,
anchored)`); SCHEMA §3 (`qualifying = the locked Life-Fully-Logged year
rules`); tree-2/04-roadmap 0.4 (`one ring = one Life-Fully-Logged qualifying
yearly window`); 02-achievements VIII-5 (`all SIX domains each have ≥1
qualifying entry`); D089 (`floor = 2+ qualifying years`); D088 TENURE
(`qualifying years + longest continuous presence`).

**What clashes:** The term "qualifying year" is used for (a) the stage-clock
tick — D090 explicitly says ANY-domain (a gym-only user must be able to
reach POLE → MATURE → first bloom); (b) the trunk ring — Life-Fully-Logged =
ALL SIX domains ≥1 qualifying entry each (a Heartwood-level bar few users
ever clear); (c) SCHEMA §3's secondary-growth trigger, which cites the
Life-Fully-Logged rules. If (a) silently used (c)'s definition, most
single-domain users would stall at SAPLING forever — flowers stay buds
forever, the first bloom never comes, and the "one tree per user" promise
breaks for the majority of realistic users. TENURE (caudex/buttress gates)
and D089's floors are ambiguous about which definition they read.

**Proposed resolution:** At the input map, name three DISTINCT concepts and
lock each definition: (1) STAGE-YEAR (any-domain qualifying year, D090) —
needs its own numeric definition (see F-19); (2) RING-YEAR (Life-Fully-Logged
six-domain window — trunk ring = the "brand", decoupled from the clock,
LOOPHOLES §1); (3) TENURE = STAGE-YEARS + longest continuous presence (to be
defined). SCHEMA §3's "qualifying = Life-Fully-Logged rules" must be amended
to point at STAGE-YEAR, and D089's "2+ qualifying years" must say which.

### F-04 [CRITICAL] The tree's birth anchor: D090's frozen account anchor vs the inventory's coach-anniversary anchor — two locked sources disagree on the tree's birth date AND its existence condition

**Location:** LOOPHOLES §1/D090 (`One frozen birth anchor (the account's
first event ever). No events = no tree`); 02-achievements account anchor
(`MINIMUM occurredAt across all events with imported=false, computed and
FROZEN at first real event write; imports can never set or shift it; rings
read this anchor`); INPUT-INVENTORY §9 anniversary row (`the tree's seed date
must follow the same anchor logic` as the coach's anniversary) and §14
(`The tree's seed date follows the coach's anniversary-anchor logic (first
journal entry; deletion shifts it) — no entries = no tree`).

**What clashes:** (a) Anchor value: D090/account-anchor = first EVENT ever,
any domain, frozen, imports-excluded; inventory = first JOURNAL ENTRY,
deletion SHIFTS it. A user whose first logged thing is a habit check-in (no
journal for a week) has two different candidate birth dates. (b) Existence:
"no events = no tree" vs "no entries = no tree" — a habits-only user (or
gym-only, or nutrition-only) has a tree under D090 and NO tree under the
inventory. (c) Monotonicity (D098: "the tree is a pure function of the
current log, no silent regression"): a shift-on-delete anchor makes the tree
a NON-monotonic function of the log — deleting the first journal entry
retroactively re-dates birth, re-times every stage transition, and re-shifts
anniversary-based visuals (the ±7-day anniversary window). (d) Imports:
account anchor excludes imports; the inventory's "first journal entry" does
not say imported entries are excluded — an imported batch can become the
tree's birth.

**Proposed resolution:** The input map picks ONE anchor with a D-number:
recommend the D090 frozen account anchor (min occurredAt, imported=false,
frozen, never shifts) for birth + stages + rings + tenure, and treat the
coach anniversary (journal-entry, shift-on-delete) as a COACH-only surface
the tree mirrors as a derived fact — never as the tree's seed date. Amend
inventory §9/§14 lines. Also state the existence condition: `tree exists
iff ≥1 non-imported event exists`.

### F-05 [CRITICAL] Class 7 definitional drift — "presence/absence" has absorbed corrections, structures, displays, governance, and outputs; the "every input classifies into the 7 classes" claim is false as used

**Location:** SCHEMA §2.1 class 7 (`Presence/absence | any activity or
silence | rhythm axes, dormancy, twig production`); inventory rows assigned
class 7 that are none of those: habit.completed_revoked (correction),
journal.deleted (correction), import (exclusion), C-05 hide (display), C-09
pause (structure), habit create/edit (structure — yet "new bud on the habit
branch" is a VISIBLE tree change), day templates/week plans (structure),
settings (non-growth), L-07/09/11/12/15 (display/governance), N-18 (export),
backup/restore (restore), coach outputs (outputs), media stubs (display),
adopted media (state), F-07/F-24 (display), areas (taxonomy).

**What clashes:** The future-proofing rule promises "every input classifies
into the 7 classes — inherited mapping, zero new decisions." In practice
class 7 has become a catch-all "everything that isn't growth" bucket whose
members have NO shared tree behavior: some class-7 items produce visible
changes (habit create → new bud; journal.deleted → leaf fall; C-09 return →
twig revival; pause → dormancy), most produce none (settings, L-11), and the
class definition (presence/absence → rhythm axes, dormancy, twig production)
doesn't cover any of them. A future feature designer told to "classify into
class 7" gets no inherited mapping — they get a category that means
"something, but we'll decide at the input map". The zero-decision-fatigue
promise breaks exactly where the inventory is the most silent.

**Proposed resolution:** A DecisionLog entry formally redefining class 7 as
`NON-GROWTH: presence/absence + corrections + structure/metadata + display/
governance`, with a sub-table of the four behaviors: (a) no visible change
(settings, export, governance); (b) leaf/bud state correction (revokes,
deletes); (c) structure appears/disappears (habit create/abandon, areas,
wikilinks); (d) derived-fact mirroring (coach outputs, C-03 chips). Each
inventory class-7 row then names its sub-behavior. Without this, the
"locked" class system fails its own purpose at the input-map step.

### F-06 [MAJOR] Word-count floors classified class 3 (measurements) — but the mapping says "leaf maturity thresholds" (a class 1 property)

**Location:** inventory §3 row `Word counts: 20-word XP floor vs 40-word
qualifying floor | 3 | leaf maturity thresholds`; SCHEMA class 3 definition
(`weight, macros, calories, workout metrics, logged numbers`).

**What clashes:** Class 3 = user-logged NUMERIC inputs feeding vascular/sap.
Word count is a derived property of a content entry (class 1). The row's own
mapping ("leaf maturity thresholds") is a leaf property; the class number
sends it into the sap system. The 40-word qualifying floor ALSO feeds
qualifyingEntry (domain presence) — which feeds the twig/stage logic — so
this row sits at the junction of leaf maturity and presence, and class 3 is
neither.

**Proposed resolution:** Reclassify to class 1 (leaf property): entry word
count → leaf size/maturity; the qualifying floor rides qualifyingEntry
(class 7 presence), not the vascular system. If the intent was "word count
feeds RESOURCE axis", say so explicitly — RESOURCE reads "avg logging volume
per active day (entries/day…)" which is a count, not word length.

### F-07 [MAJOR] C-06 THEN & NOW selfie compare (1+3) — the same physique photo is simultaneously leaf substance (class 1) and body-domain branch character (class 3)

**Location:** inventory §3 C-06 row (`1+3 | leaf + measurement: the
body-domain leaf character`); §10 media rows (photos = class 1 storage-leaf);
04-roadmap M1-D031 (`BODY qualifying entry includes a physique-timeline
photo`); 06-media (`media_attachments anchored to a journal entry tagged
health+physique — zero new tables`).

**What clashes:** Physique photos are ordinary media_attachments on journal
entries (class 1 → storage-leaf substance AND media-domain presence), and
the SAME rows are the body-domain input (class 3 → body branch character).
One photo, two classes, two destinations, one event (media.added). The tree
would count the photo twice (leaf substance + body character) with no
priority rule. Also: a physique photo that is ALSO a "photo journaling"
photo is not distinguishable — the tag is the only differentiator, and the
inventory never keys the class split on the hidden tag.

**Proposed resolution:** Key the split on the hidden `health+physique` tag:
tagged photos = class 3 (body character) with a note that they remain leaf
substance for the journal branch (both, explicitly, with a defined ratio or
a "tagged photos count once per organ, never per class" rule); untagged
photos = class 1 only. The input map must define whether the photo counts
toward BOTH the leaf's media substance AND the body branch character, or
whether the tag REASSIGNS it (recommend: reassigns — a physique photo's
leaf is a body leaf, C-06's own mapping).

### F-08 [MAJOR] N-16 veggie/water check-ins (2+3): one real action can produce two log events and feed two organs — double-feed with no discount rule

**Location:** inventory §6 N-16 (`2+3 | bud bursts (nutrition branch) + sap
volume`); 07-ledger N-16 (`auto-tick from veggie-tagged food rows + water
logs; manual check-in always wins`); 01-data-layer habits bridge (autoSource).

**What clashes:** A veggie serving logged as a food row emits nutrition.logged
(class 3 → sap) AND auto-ticks the veggie habit → habit.completed (class 2 →
bud burst). The same fact, recorded via the food log, feeds TWO organs and
writes TWO events; recorded via a manual habit check-in it feeds ONE organ
and writes ONE event. The tree is "a pure function of the log" — so the same
life produces different trees depending on recording path (friction
difference), and the RESOURCE axis (event volume per day) is inflated for
food-log-first users. The manual-wins dedupe covers the CHECK-IN row, not
the tree's two-organ feed.

**Proposed resolution:** Define the double-feed rule at the input map:
recommend the auto-ticked check-in be marked as `autoSource` in the event
(already a doc field) and the tree discount it — e.g., the bud burst renders
at reduced swelling (the burst is "borrowed" from the sap entry) OR the
nutrition-branch bud only counts auto-ticks toward sap, with bursts reserved
for manual check-ins. Must be one explicit rule, not per-implementation.

### F-09 [MAJOR] Goal-declaration is classified 2+4 in the COACH surface but class 5 in the GOALS surface — the same action, two classes

**Location:** inventory §9 (`User actions toward coach (delete, quiet-week,
rest-flag, goal-declaration, opt-ins, annotate, tap) | 2+4 | symbiosis
intensity`); inventory §7 goal create (`5 | spur appears`).

**What clashes:** A goal declaration IS the goal create (L-01 NL parse →
goal row → spur appears, class 5). Listing it under "user actions toward
coach" as class 2+4 means the same event would ALSO feed "symbiosis
intensity" (mycorrhizal). Either a goal declaration counts twice (spur +
symbiosis) or the coach row is misclassified. Also "delete coach note" as
class 2 (completions) is odd — deletes are class 7 corrections everywhere
else (journal.deleted, media.removed); classifying a coach-note DELETE as a
completion would feed "symbiosis intensity" when the user actively
disengages — perverse signal for the mycorrhizal adaptation.

**Proposed resolution:** The coach-surface column should classify only the
coach-specific interactions: check-in respond (2), annotate/tap (2), opt-in
toggles (7 — settings), quiet-week (7 — absence shield, see F-10), rest-flag
(4 — rest_planned), delete (7 — correction, negative engagement must NOT
feed mycorrhizal intensity). goal-declaration moves to class 5 exclusively.

### F-10 [MAJOR] Coach outputs are simultaneously "output, not user input" (class 7) and "derived facts the tree may mirror" (input) — and the mirror boundary is unspecified against LLM narrative

**Location:** inventory §9 first two rows; 07-ledger engine-2 (`LLM is a
VOICE LAYER... receives derived facts only`); 01-data-layer §7.2 (coach_outputs
payloads carry kind + payload JSON); LOOPHOLES N-6/D099 (mirror boundary:
"tree mirrors derived facts only, never LLM narrative").

**What clashes:** (a) One row says "output, not user input" and the next
sentence says "coach_outputs = derived facts the tree may mirror" — the same
rows are both not-input and input. (b) A coach_outputs row is a MIXED payload:
facts (numbers, windows) + rendered narrative (the voice layer's sentence).
The N-6 resolution says the tree mirrors "derived facts only" — but the
inventory never specifies WHICH payload fields the tree may read; a naive
implementation mirrors a narrative line and violates "the tree never shows
content" (constraint register). (c) If the coach's output cadence/quantity
feeds the mycorrhizal "sustained coach engagement" trigger, then outputs ARE
growth-relevant — contradicting "class 7 = never growth".

**Proposed resolution:** Define at the input map: (1) the tree reads ONLY the
numeric/state fields of coach_outputs payloads (the whitelist to be written
row-by-row in the engine contract — e.g., compliance %, trend deltas), never
the rendered text; (2) the mycorrhizal trigger metric is defined on USER-side
engagement events (check-in responds, annotate) — never on output rows
written by the coach itself (the coach can't feed its own symbiosis); (3)
inventory §9 gains an explicit "mirrorable facts" sub-column.

### F-11 [MINOR] Yearbook (M1) classified class 4 "dated events" — a yearbook is an output artifact, not an input

**Location:** inventory §3 Yearbook row.

**What clashes:** The yearbook is a generated PDF (J5) — it produces no data
the tree could read. Class 4's mapping (twig anchors/seasonal moments) is
wrong. Harmless in practice (no events ever flow from it), but the row
pollutes the inventory's claim of "every feature → its tree mapping".

**Proposed resolution:** Reclassify as display/governance (class 7
sub-behavior (a) no visible change), or drop the row with a note.

---

## 2. THE 7-CLASSES COMPLETENESS (inputs that don't cleanly fit any class)

### F-12 [MAJOR] AREAS are classified class 4 "dated events" — a category error; areas are a taxonomy, and two competing leaf-organizing principles exist

**Location:** inventory §3 `Areas (journal areas/domains) | 4 | leaf
placement`; D088 forks (`journal: photo/voice/text — no templates, no made-up
splits`); 02-achievements area streaks (`area streak = any qualifying action
that day`); 01-data-layer areas table (7 seeded slugs).

**What clashes:** (a) Class 4 = DATED events — areas have no date; the
assignment is indefensible. (b) The tree mapping says "leaf placement" — but
D088 closed the journal-branch forks as photo/voice/text. Areas (7 slugs:
health, learning, career…) would organize leaves by a SECOND axis that D088
explicitly excluded ("no made-up splits"). (c) Areas carry their own streak
system (per-area streaks in the achievement engine) — an input surface the
inventory's area row ignores entirely. (d) The 7 areas ≠ the 5 branches ≠
the 6 domains — an entry with area=finance lands on the journal branch
(area is invisible to placement) while the area streak engine counts it.

**Proposed resolution:** Areas = taxonomy metadata riding class 1 (the
entry's area payload field) + a class 7 structure (the areas table itself).
"Leaf placement" must be reconciled with D088's closed fork list — either
areas are a leaf metadata badge (not placement) or D088 gains an amendment.
Area streaks: define whether the tree reads them (candidate: they feed
RHYTHM/leaf-cluster tint on the journal branch) or ignores them (candidate:
ignore — no tree mapping, no visible change).

### F-13 [MAJOR] WIKILINKS (C-08) and the future links table are "relationship metadata" — no tree mapping is defined; the class assignment is a placeholder

**Location:** inventory §3 C-08 (`1 | leaf relationship metadata (the tree's
relationship surface...)`); §2.2 future links table; 07-ledger C-08 (`the
link graph is a journal-domain structure the tree could surface (branch
detail / leaf detail)`); 04-roadmap (links connect entries, habits, goals,
projects, life areas).

**What clashes:** "The tree's relationship surface" is a destination, not a
mapping — nothing says what a wikilink DOES (leaf proximity? a stolon-like
drawn connection? nothing at all until branch detail). Links span entity
types (entry↔habit, goal↔area) — class 1 (leaf metadata) only covers the
entry↔entry subset; cross-entity links fit no class. The links table is
unbuilt and C-08 is locked — the input map must either commit to a mapping
or explicitly defer it to the tree design session (C-08's own flag: "the
tree session owns the language" only covers F-03; C-08's tree tie is
unowned).

**Proposed resolution:** Define at the input map: class 1 for
entry↔entry/entry↔area links (leaf relationship metadata = adjacency/backlink
density on the journal branch — a leaf-cluster cohesion character), class 7
structure for the link TAXONOMY, and an explicit "no tree effect until
branch-detail design" note for cross-entity links (or a stolon feed — the
L-10 stolons are cross-domain influences made structural; user-authored links
could join that layer, but that's a visual decision for the tree session).

### F-14 [MAJOR] Settings: the tree is "a pure function of the current log" (D098) — but derivation-affected settings enter the function unacknowledged

**Location:** inventory §11 settings row (`7 | never growth; tree ignores`);
01-data-layer §10 (keys: units, TDEE inputs, manual TDEE override, protein
g/kg per phase, fat floor, food-lookup toggle, grace default, PO kill-switch,
coachStrictness, review day, milestone cadence); D098.

**What clashes:** "Tree ignores" is true only for display-only keys (units,
theme). Derivation-affected keys CHANGE the derived facts the tree mirrors:
manual TDEE override freezes auto-recompute (sap-level TDEE facts), protein
g/kg changes pacing facts (sap composition), grace default changes streak
semantics (bud swelling), coachStrictness changes coach outputs (mirrored
facts), review day changes weekly windows (F-24 mirrored summaries). If the
tree re-derives only on events, a settings change leaves stale mirror facts
("silent regression" — D098's own taboo). If it re-derives on settings
change, the tree is a function of (log, settings) — which the backup/restore
contract covers (settings ride the backup) but the "pure function of the
log" claim must be amended.

**Proposed resolution:** At the input map, enumerate the settings keys that
enter the derivation function (recommend: TDEE inputs/override, protein/fat
targets, grace default, strictness, review day, milestone cadence) vs the
ignored keys (units, theme, device mode, toggles with no derived effect).
D098's wording is amended to "pure function of the current log + the
derivation-affected settings snapshot". A settings change then triggers a
debounced re-derivation like any write.

### F-15 [MINOR] Habit create/abandonment produce no events — the tree must read entity rows, contradicting "the tree reads the log, not the UI"

**Location:** inventory §4 (`Habit create/edit | 7 | new bud on the habit
branch`; `Habit abandonment | derived | 7 | bud scar`); 01-data-layer
HabitRepository (`setActive` writes no event; uncheckIn hard-deletes the
event).

**What clashes:** D087 says "INPUTS: habit rows (streak momentum, completion,
abandonment)" — the tree reads HABIT ROWS, while the event spine claims "the
tree reads the log, not the UI". Habit create/deactivate have no events, so
the bud/bud-scar layers MUST read the entity table. Not a contradiction if
stated, but the inventory presents the event spine as "the input backbone"
and then silently exempts the bud structure.

**Proposed resolution:** State the exception in the event-spine section:
bud structure (create/edit/archive) reads the habits table directly; bud
STATE (bursts/wither) reads events. Alternatively add habit.created/
habit.deactivated events (schema change — needs a DecisionLog entry).

### F-16 [MINOR] C-03 auto-context chips are classified class 1 but produce no new data — the chips are a derived display over events already classified in their own classes

**Location:** inventory §3 C-03 (`1 | leaf metadata: the chip facts enrich
the leaf's derived state`); 07-ledger C-03 (capture frozen at save,
tombstone-aware).

**What clashes:** None behavioral — the chips re-read the event log. The
class-1 assignment is a display claim, not an input claim; the only real
input is the location chip (explicit per-entry) and weather (pending). The
tombstone-aware recompute ("deleted/revoked underlying events → chip
recomputed honestly on view") means the leaf's derived state is a VIEW-TIME
function — fine for the tree (same derivation), but the snapshot-at-save
wording vs recompute-on-view should be reconciled in the engine contract.

**Proposed resolution:** Reclassify C-03 as class 7 display (sub-behavior d:
derived-fact mirroring) with the location chip as the only class-1 payload
addition. Low priority.

---

## 3. CROSS-CLASS LOGICAL CLASHES (organs interacting)

### F-17 [CRITICAL] The domain-set mismatch: 5 tree branches {journal, habits, gym, nutrition, goals} vs 6 presence domains {journal, habits, fitness, nutrition, body, media} — goals has no presence owner; body and media have presence but no branch

**Location:** D088-A vs 04-roadmap 0.3; 01-data-layer owner catalog
(dayDomainPresence — no goals domain); inventory §15; D088 twig rule (`one
twig per month of sustained presence per domain`); LOOPHOLES matrix class 7.

**What clashes:** (a) The twig/canopy rule is defined "per domain" but the
GOALS branch has no domain in dayDomainPresence — goals-branch twigs have no
defined presence input (see F-29). (b) Body and media presence EXIST (six
domains) but have no branches — their presence can never produce twigs
(F-02). (c) The tree's BALANCE axis reads the 5 branches; the calendar tint
rule reads dayActivityScore (which has NO media term); the achievement
engine reads the 6 domains — three overlapping-but-not-equal domain sets
drive the same tree. (d) The DUALITY principle promises "ONE derived state,
TWO scales" — but the section UI (gym tab shows body metrics; goals tab
shows fruit) and the tree's organs disagree for body (UI shows it, tree has
no organ) and goals (tree has a branch, dayDomainPresence has no goals
domain).

**Proposed resolution:** The input map produces ONE canonical domain table
with three columns — branch (D088), presence domain (H3), achievement
family (scan §1.5) — and resolves every orphan: body→gym branch (F-02),
media→journal leaf layer (storage-leaf, D099), goals→needs a presence
definition (F-29), family VIII→trunk bloom (F-24), VI/IX→their attachment
rule (F-23). This table becomes the engine contract's axis/domain reference.

### F-18 [MAJOR] Goals: derived fruit swelling vs user-declared hanging — provenance mismatch and a double-count surface; plus the matrix's "fruit buds only after the first flower" vs the inventory's unconditional "fruit on the spur"

**Location:** inventory §7 (`goal.progress REMOVED (D049) — progress DERIVED;
goal.completed = rare user-declared | 5 | fruit hangs on the spur`);
LOOPHOLES matrix class 5 (SEED→SAPLING: `fruit buds (only after the first
flower exists)`; MATURE: `FIRST FRUITS (follow the first bloom +1 season)`);
inventory §7 task.completed (`2 | extension; fruit spur feeder`).

**What clashes:** (a) Swelling is derived, hanging is declared. A goal whose
derived progress reaches 100% (all connected data satisfied) but is never
declared stays a fully-swollen fruit that never hangs — visually a completed
goal that the tree treats as uncompleted. Conversely a generic goal declared
complete with thin derived support hangs a fruit on an unswollen spur. The
input map must define which wins (candidate: hang ONLY on goal.completed;
the swelling saturates at 100% — honest, if awkward). (b) task.completed
feeds extension (class 2) AND the goal spur (class 5) — one completion, two
organs (same double-feed class as F-08; needs the same one-rule discount or
an explicit "spur feeder is a sub-effect of the task's extension, not
additional growth"). (c) The matrix gates fruits behind the first bloom +1
season; the inventory's goal.completed row says "fruit on the branch's spur"
unconditionally. Pre-maturity goal completions must render as fruit BUDS per
the matrix — the inventory row needs the stage gate written in.

**Proposed resolution:** (1) Lock: fruit hangs only on goal.completed;
derived swelling is capped and never auto-hangs. (2) Lock: spur-feeder is a
label on the task's extension growth, not an extra growth event. (3) Add
the stage gate to the inventory row: pre-first-bloom completions → fruit
buds (banked), per the matrix.

### F-19 [MAJOR] Auto-tracked habits (autoSource: workout, future weigh-in): one session writes workout.completed AND habit.completed — double bud burst

**Location:** 01-data-layer habits bridge (`auto-tracked habits write
check-in in same transaction as session save; manual entries win`); 05-uiux
auto-tracked habits; inventory §4.

**What clashes:** A logged workout that auto-ticks a habit produces two
class-2 events from one action (workout's own completion + the auto habit
check-in) — two bud bursts (gym branch? habit branch) plus extension plus
wood quality. Same recording-path-dependence as F-08, with the manual-wins
rule only deduping the check-in row, not the tree's feeds. Also the workout
bud burst location is ambiguous: does the workout's completion burst a bud
on the GYM branch (there is no gym bud concept — gym has branch girth) —
class 2's "bud bursts" mapping applied to a workout is already loose (the
inventory maps workout.completed to `extension + gym branch wood quality`,
correctly NOT to buds) — but the auto-ticked HABIT check-in IS a bud burst.
So the same session bursts a habit bud and extends the gym branch.

**Proposed resolution:** Define autoSource check-ins as discounted buds
(same rule as F-08 — one shared "auto-tick discount" rule for N-16 AND
autoSource, applied at the input map so both feed through one mechanism).

### F-20 [MAJOR] Calendar rows (4+7) vs the tint-only rule and the seasons: dated-event anchors vs the "no independent calendar presence" constraint

**Location:** inventory §8 calendar row (`the calendar feeds DATED EVENTS;
tree state must flow through the locked H3 dayActivityScore owner, never
independent presence`); LOOPHOLES open zone (`The calendar tint rule — OPEN
(input map step verifies)`); D085 seasons (calendar-anchored); 05-uiux tint
rule (`tree has no independent calendar presence`).

**What clashes:** (a) The tint rule governs the calendar's DAY-CELL display —
resolved by construction (dayActivityScore). But the tree's OWN seasonal
layer (D085) is calendar-anchored (spring bloom, winter dormancy, ring
closes at year boundary) — the tree's most visible seasonal behaviors are
calendar-driven, i.e., a form of "calendar presence" the tree renders
independently of dayActivityScore. Not a contradiction (seasons = the
botanical cycle, intensity = data) but the input map should state the
division explicitly: calendar tint = dayActivityScore; tree season state =
season-phase function + per-season intensity. (b) Dated events with FUTURE
user-set dates (milestones with targetDate, plans, periods) — the tree's
"twig anchors" fire on class-4 events; if a milestone's targetDate (not its
completedAt) is used, future anchors appear on the tree (a tree showing
tomorrow) — honesty violation. (c) Year heatmap (class 7 "ring/year summary
surface") — how a ring summary renders on a tint-only surface is undefined
(the heatmap strip is the one chart-as-glance exception, L-12 — but the
tree's ring data on it needs a mapping).

**Proposed resolution:** (1) Lock the division in the input map (above). (2)
Twig anchors read EVENT occurredAt only — never future targetDate fields
(anchors appear when the event fires). (3) The year heatmap's ring display
is deferred to the tree session with a note that the strip stays
dayActivityScore-driven (ring data lives on the tree/trunk, not the heatmap).

### F-21 [MINOR] The plan-vs-actual surface (L-06, class 5+7) maps to "growth vs plan" — but the PLAN is user-authored content; the tree cannot show it under the facts-only constraint

**Location:** inventory §8 performed days (`5+7 | day-line; growth vs plan`);
§7 L-06 (`5+7 | the day line`); constraint register (`The tree never shows
content...`); 07-ledger L-06 (planned slot names render in the day view).

**What clashes:** The day line (L-06) renders planned slot titles ("planned:
gym 17:00") — user-authored template content. If "growth vs plan" means the
TREE renders any planned-slot content, it violates the no-content rule. If
it means only a neutral deviation count (L-08 badges), then class 5+7's
"growth vs plan" mapping is really "growth vs plan COMPLIANCE" and the plan
itself never enters the tree's derivation.

**Proposed resolution:** Define "growth vs plan" as plan-COMPLIANCE facts
(done/skipped/done-different counts — L-08 vocabulary), never planned
content; the plan (day templates) = class 7 structure invisible to the
tree's visuals. The day line itself stays an M6 surface, not a tree surface.

### F-22 [MINOR] F-23 "Adapt" affordance classified class 2 (completions) — a tap is not a completion; the adapted marker is workout metadata

**Location:** inventory §5 F-23 (`2 | session-start affordance`); 07-ledger
F-23 (`adapted marker per session → feeds adherence semantics`); F-27
deferred question (`do adapted sessions count as adhered? draft: yes`).

**What clashes:** The F-23 row's class (2) describes a button, not an input.
The actual input (adapted marker on workout.completed) is adherence metadata
for the workout (2+3) — and its tree consequence is explicitly deferred
(F-27's open decision). The inventory's class-2 assignment gives the marker
a bud-burst mapping it shouldn't have.

**Proposed resolution:** Reclassify F-23 as a payload flag on
workout.completed (class 2+3), no independent input; note the F-27 open
decision ("adapted counts as adhered" vs the strict-schedule trophies) as a
dependency the tree's adherence reading must await.

---

## 4. THE TRIGGER-AUTHORITY CLASHES (D088: achievements are the trigger authority)

### F-23 [CRITICAL] Universal adaptations have non-achievement triggers — D088's "NO parallel trigger systems" contradicts its own adaptation map

**Location:** D088-C governing rule (`the achievement system is the TRIGGER
AUTHORITY — NO parallel trigger systems`); D088-C adaptation map rows 2
(reaction wood — any revival), 10 (mycorrhizal — coach engagement), 13
(bracts — F-03 flair), 14 (bud scales — dormant habits, D087), 9
(contractile — consistency trending UP), and the universal-adaptation list
in D088-E (reaction wood, epicormic, mycorrhizal, bracts, contractile, bud
scales — no axis restrictions, appear anywhere); also 5 (phyllodes — derived
presence pattern) and 6 (cladodes — streak-vs-entry divergence).

**What clashes:** At least 8 of the 14 adaptation rows fire on conditions NO
achievement encodes: any revival (III-24 "Back at It" is GYM-only; a journal
revival has I-11 but that's 21-day-gap-based, not dormancy-return-based),
coach engagement (no coach trophy exists), PR ceremony (F-03 — see F-01),
habit dormancy (no trophy for "habit went quiet"), upward consistency trend
(no trophy), sparse-but-stubborn logging (no trophy), streak-without-entries
(no trophy — II trophies all require the habit to be alive, not divergent
from journaling). The governing rule says no parallel trigger systems; the
map itself defines eight derived trigger systems. Either the rule is
narrowed ("achievements trigger STRUCTURAL-tier modifications where an
achievement exists; SUBTLE-tier + universal adaptations use derived
triggers") or the map is wrong. The D089 subtle/structural split was clearly
meant to carry this, but D089 doesn't say the derived triggers are legal for
the subtle tier.

**Proposed resolution:** At the input map (or a D-number amendment to D089):
(1) STRUCTURAL tier (caudex, buttress, thorns, storage leaves, phyllodes,
cladodes): achievement-triggered ONLY where an achievement exists (thorns ←
streak trophies; storage leaves ← media trophies — to be verified against
the correlation table); where NO achievement exists (phyllodes, cladodes),
an explicit derived-trigger definition with axis signatures (which F-25/F-26
below demand anyway) is locked as the trigger, documented as an exception.
(2) SUBTLE tier (reaction wood, epicormic, mycorrhizal, bracts, bud scales,
contractile, stolons, spines): derived triggers are the norm; achievements
may enhance (magnitude/ceremony), never gate. (3) The achievement-scan
correlation table (D088: "the achievement-scan sub-step produces the
correlation table directly") is a MISSING DELIVERABLE — the inventory and
scan reference it but it is not in any of the scanned docs; the input map
must produce it (every adaptation row × every achievement that could
trigger it) or the double-trigger question (F-24) cannot be closed.

### F-24 [MAJOR] Double-trigger risk: the same condition fires a flower AND a modification with no defined interaction (and family VIII's identity-vs-tier clash)

**Location:** D088-E (`the achievement EARNS the right to the adaptation...
ONE condition set, two visual layers`); ACHIEVEMENT-SCAN §1.5 family VIII
(`The Rings → the yearly spring bloom itself`) vs the tier table (Ring tier =
`a distinctive bloom + a branch-level visual event`) vs VIII-11 Pith =
Sprout tier.

**What clashes:** (a) "One condition set, two visual layers" (flower + 
modification from one achievement) is intended — but nothing defines the
CO-MANIFESTATION order/budget: does a 365-day streak fire thorns AND the
Ring-tier bloom simultaneously, both consuming the D099 visual budget? The
input map needs the co-fire rule (candidate: modification + flower render
together; the flower is the announcement, the modification is structural and
permanent). (b) Family VIII: identity says family VIII = "the yearly spring
bloom itself" — but VIII contains trophies at ALL tiers (VIII-11 Pith =
Sprout, VIII-2 Two Years = Ring, VIII-20 Yew = Grove). A Pith (Sprout)
blooming as "the yearly spring bloom" contradicts its magnitude ("a single
common flower"). The identity axis needs a family-VIII rule: below Ring
tier, VIII trophies manifest as trunk/branch marks (annual-bloom
contribution), NOT individual flowers; the spring bloom's richness encodes
the VIII family's progress. (c) The identity axis is TEMPORARY (not locked)
while the inventory's class-6 mapping says "auto-classified by tier" only —
the inventory and the scan disagree on the flower classification basis; the
input map must lock one (candidate: tier = magnitude, family = inflorescence
type, per §1.5 once approved).

**Proposed resolution:** Lock the co-fire rule + the family-VIII
manifestation rule + the tier-vs-family basis at the input map (all three
are one decision: the flower overlay contract).

### F-25 [MAJOR] F-15 milestone hero ring (class 4+6): ladder rungs 70 and 100 kg have no trophy counterparts — same non-achievement-flower defect as F-03, smaller scale

**Location:** inventory §5 F-15 (`4+6 | milestone events; hero-ring visual
language`); 07-ledger F-15 (ladder 70/75/80/85/90/95/100 with 2-week
confirmation); ACHIEVEMENT-SCAN family V (V-11 Seventy-Five … V-15
Ninety-Five — no 70 or 100 trophy; V-10 Six Kilos In is a delta trophy).

**What clashes:** F-15 rung crossings are body milestones (class 4). The
`6` in `4+6` implies flower-layer events for rungs that mostly DO correspond
to V-family trophies (75–95) — but 70 and 100 do NOT. Same defect class as
F-03 (flower from non-achievement); the 2-consecutive-week confirmation adds
a second firing condition that no trophy uses.

**Proposed resolution:** F-15 = class 4 (milestone events) + the hero-ring
visual = display overlay (deferred to the tree session, per F-15's own
"ceremony language deferred" note). Class 6 applies only where the rung
crossing IS a trophy fire (75/80/85/90/95) — 70/100 render as milestone
marks, never flowers.

---

## 5. THE INVENTORY VS THE MATRIX (stage × class cells)

### F-26 [MAJOR] The storage-leaf contradiction: LOOPHOLES matrix (storage-leaf character at OLD-GROWTH only) vs D099 (storage-leaf at AGGREGATION scale) vs D089 (storage leaves = rare structural, 2+ qualifying years) vs SCHEMA class 1 (media-rich → storage leaves, unconditional)

**Location:** LOOPHOLES §3 matrix class-1 OLD-GROWTH cell (`full granularity +
storage-leaf character`); D099 (`leaf-cluster character reflects media
content — storage-leaf at aggregation scale`); D089 (`storage leaves moved to
structural/rare`); SCHEMA §2.1 class 1 mapping (`media-rich → storage
leaves`); inventory §10/§3 media rows.

**What clashes:** "Storage leaf" means three incompatible things: (a) the
class-1 locked mapping — any media-rich entry is a storage leaf from day
one; (b) D099 — early leaf clusters show a storage-leaf CHARACTER at
aggregation scale; (c) D089 — storage leaves are a RARE STRUCTURAL
modification with a 2+ qualifying-year floor. If (a) is the locked mapping,
a brand-new user's first photo entry renders the rare structural
modification — destroying the rarity split (D089's entire point). The matrix
cell (OLD-GROWTH only) contradicts D099 (early aggregation); the inventory
never distinguishes the "character" from the "modification".

**Proposed resolution:** One DecisionLog row that (1) renames the class-1
mapping to `storage-leaf CHARACTER at aggregation scale` (media share
reflected in cluster shape/texture, from SEEDLING per D099); (2) keeps the
RARE `storage-leaf modification` (succulent leaf morphology, D089) gated by
tenure floor + the media trophies as trigger (VII family); (3) fixes the
matrix OLD-GROWTH cell to `full granularity + rare storage-leaf
modification` (the character is present from SEEDLING).

### F-27 [MAJOR] The class-5 matrix gate ("fruit buds only after the first flower exists", "FIRST FRUITS follow the first bloom +1 season") vs the inventory's unconditional "goal.completed → fruit on the spur" — and the DUALITY principle

**Location:** LOOPHOLES §3 matrix class 5 rows; inventory §7 goal.completed;
D088-B duality (`goals = the orchard (progress = fruit swelling, completion
= fruit on the spur) — ONE derived state, TWO scales`).

**What clashes:** Covered in F-18(c) for the inventory side. The additional
clash: the DUALITY principle promises the section UI and the tree show the
SAME state at two scales — but the goals TAB (the orchard) will show a
swelling fruit for a user whose TREE shows only fruit buds (pre-maturity).
The stage gate applies to the tree's visual only; the section UI is
ungated. The two scales disagree by design, which the duality principle
doesn't account for. Either the goals tab also shows buds pre-maturity
(contradicting the orchard UX) or the duality principle gains a
stage-gate exception clause ("the local view renders ungated; the tree
renders gated; the why-panel explains the difference").

**Proposed resolution:** Amend the duality principle with the explicit
stage-gate exception + the why-panel copy pattern (the D099 "resting" copy
precedent).

### F-28 [MINOR] Matrix class-6 SEED cell ("achievement BUDS (never bloomed)") vs the inventory's F-03 "feeds the flower ceremony" — the ceremony's pre-maturity rendering is undefined

**Location:** LOOPHOLES matrix class 6 SEED/SEEDLING; inventory §5 F-03.

**What clashes:** If any flower ceremony language (bracts, celebration
marks) renders pre-maturity, the "achievement buds only, never bloomed"
contract is broken. F-03's ceremony language is deferred to the tree
session, but the input map should state the pre-maturity behavior: no bloom
ceremony on the tree pre-maturity (the in-app toast/card still happens —
that's the trophy system's surface, untouched); the tree banks the mark as
a bud with a "pending" why-panel.

**Proposed resolution:** One line in the F-03 resolution (F-01): pre-maturity
F-03/PR marks render as branch-level marks (class 4) only; flower-layer
language starts at the first bloom.

---

## 6. THRESHOLD AMBIGUITIES (rows whose threshold source is UNDEFINED — the input map must define)

### F-29 [CRITICAL] "First sustained presence period / first twig on any branch" — the twig's presence threshold is undefined

**Location:** D090 tick (`SEEDLING→SAPLING = first sustained presence period
(first twig on any branch)`); D088 twigs (`one twig per month of sustained
presence per domain`); 02-achievements E6 (`dayDomainPresence(dayKey,
domain)` boolean with E1 bar; `qualifying activity in a month = ≥1
qualifying entry in that month`).

**What clashes:** "Sustained presence" is never defined: does a twig form
from ONE qualifying day in a month (dayDomainPresence is a boolean per day;
E6 gives "≥1 qualifying entry in that month" as the month-level presence
line) — a bar so low that a single journal entry per month grows twigs — or
from N days (a "sustained" floor)? The stage clock's FIRST tick (SEED→
SEEDLING→SAPLING transitions) rides this. Also: which domains can grow the
first twig — all 5 branches (goals has no presence owner, F-17), and do
class-3-only months (weigh-ins) grow twigs?

**Proposed resolution:** Define at the input map (candidate: twig = a
calendar month with ≥N qualifying days per dayDomainPresence, N to be
approved — suggest N=4 for "sustained" vs 1 for "touched"); state the goals
branch presence definition; state whether the twig owner is per-branch or
per-domain (body/media must resolve via F-02).

### F-30 [CRITICAL] "First qualifying year (any-domain, anchored)" — the any-domain qualifying year has no numeric definition

**Location:** D090 tick; SCHEMA §3; 02-achievements E4 (`yearlyPass` — the
per-domain bars are 300 days (journal), 300 completions (habits), 80
workouts (gym), 250 food days (nutrition), 40 weigh-in weeks (body), 300
vlog days (media)).

**What clashes:** No doc defines the ANY-domain qualifying year. The
per-domain yearly bars exist (E4) but none is "any-domain". Candidates: ≥300
qualifying days in a 365-day window each with ≥1 qualifying entry in ANY
domain; ≥1 qualifying day in each of ≥9 of 12 months (VIII-1's shape);
"any-domain" = the max of the per-domain bars? The stage clock (POLE→MATURE
gates the first bloom) depends on it, as does TENURE, as do D089's floors.

**Proposed resolution:** Lock a definition at the input map (candidate:
any-domain qualifying year = a 365-day anchored window with ≥300 distinct
days each having ≥1 qualifying entry in ANY domain — mirrors the journal
bar at the cross-domain level; document it as STAGE-YEAR, distinct from
RING-YEAR per F-03).

### F-31 [CRITICAL] POLE→MATURE = "DERIVED MATURITY (structural threshold, pioneer-speed)" — the threshold is a placeholder; it gates the FIRST BLOOM

**Location:** LOOPHOLES §1 D090 tick rules; LOOPHOLES §2 MATURE row (`derived
(pioneer-speed)`).

**What clashes:** The single most load-bearing stage transition (maturity =
first bloom + direct flowering + full leaf granularity + the D092
first-bloom contract) has NO candidate threshold anywhere — not even a
placeholder shape ("structural threshold" could be tenure-based,
volume-based, or stage-years-based). The LOOPHOLES matrix's own class-5/6
cells depend on it. This is a pure gap, not a contradiction — but the input
map cannot "verify" it; it must DEFINE it.

**Proposed resolution:** The input map proposes 2-3 candidate definitions
(candidates: (a) tenure-driven: N stage-years; (b) volume-driven: cumulative
qualifying days ≥ X; (c) hybrid: stage-year AND a qualifying-day floor) and
presents them for user approval with a D-number. This must happen before
the matrix can be finalized.

### F-32 [MAJOR] TENURE axis: "qualifying years + longest continuous presence" — both halves underdefined

**Location:** D088-D TENURE; D089 floors (`2+ qualifying years; caudex and
buttress at HIGHER tenure — exact floors in the engine contract`).

**What clashes:** Which qualifying-year definition (F-03/F-30 — STAGE-YEAR or
RING-YEAR?); "longest continuous presence" — continuous by what bar
(qualifying days? any logged day? dayActivityScore > 0?); caudex/buttress
exact floors deferred ("engine contract") — the input map is where the
engine contract starts; leaving it "exact floors in the engine contract"
after the input map means the decision moves to implementation = decision
fatigue at build.

**Proposed resolution:** Fix at the input map: TENURE = STAGE-YEARS (F-30)
weighted + longest continuous run of qualifying days (bar = the F-29
presence bar); caudex/buttress floors proposed there (candidates: caudex 4+
stage-years, buttress 3+ stage-years, both with axis signatures already
locked).

### F-33 [MAJOR] Phyllodes ("sustained sparse-but-stubborn logging") — no axis signature numbers

**Location:** D088-C row 5; D088-D (the worked example gives caudex and
buttress numbers only: `caudex requires tenure≥0.7 + resource≤0.6; buttress
requires balance≥0.7 + resource≥0.6`).

**What clashes:** The contradiction-by-construction guarantee ("every
adaptation has a required SIGNATURE on the axes") is only actually defined
for caudex and buttress. Phyllodes ("sparse-but-stubborn"), cladodes
("streak vs entry-volume divergence" — what ratio?), contractile ("trending
UP" — what slope?), mycorrhizal ("sustained coach engagement" — what
metric?), storage taproot ("foundation years + quiet months" — what is a
quiet month?), reaction wood ("dormant branch resumes" — what defines
dormancy end?) have no signatures. Without signatures, the "one character
per organ, rank rule" cannot run, and the anti-contradiction guarantee is
unenforced for most adaptations.

**Proposed resolution:** The input map produces the full signature table
(every adaptation × 4 axes × numbers), at least as candidates for user
approval. Priority: phyllodes, cladodes, mycorrhizal (they are also
trigger-ambiguous, F-23).

### F-34 [MAJOR] The tree's "return/revival moment" (C-09, class 7) has two competing gap thresholds: C-03's 3 days vs I-11's 21 days

**Location:** inventory §3 C-09 (`return = twig revival moment`);
07-ledger C-03 (`first entry in 3 days`); 02-achievements I-11 (`dayKey −
previous qualifying entry's dayKey ≥ 21 days`).

**What clashes:** The tree's revival signal (reaction wood, twig revival
moment) fires on "return-after-gap" — but the gap length is 3 days for the
C-03 chip and 21 days for the trophy. A 5-day gap revives the twig but
earns no trophy; the reaction-wood trigger (any revival) vs the III-24/I-11
achievements (21-day/gym-specific) fire on different scales. Which gap does
the tree's revival use?

**Proposed resolution:** Define the tree's dormancy/revival bar
independently (candidate: the F-29 presence bar — a domain with no
qualifying day for X weeks = dormant; first qualifying day after = revival)
and map the achievements onto it (III-24/I-11 = the same revival at
achievement scale, per "one condition set, two visual layers" — F-24).

### F-35 [MINOR] Season-intensity modifiers ("dense bloom from a rich spring, sparse bloom from a quiet year") have no density thresholds

**Location:** D085; SCHEMA §5.

**What clashes:** None contradictory — but "rich/quiet year" needs a bar
(per-season qualifying days? volume percentiles?) for the why-panel to
explain ("THIS density is your March journaling" — explainable requires a
number).

**Proposed resolution:** Define per-season intensity = the season's total
qualifying days (F-29 bar) against the user's own prior seasons (relative),
with a neutral 3-band mapping (sparse/moderate/dense). Lock at the input
map.

### F-36 [MINOR] Coach quiet-weeks: do they pause the tree's growth? — LOOPHOLES defers this to the input map; the inventory never answers it

**Location:** LOOPHOLES §7 (`Coach quiet-weeks: do they pause the tree's
growth? — OPEN (input map step; candidate: protected absence → bud scales,
D088)`); 03-coach (`quiet weeks silence coach lines; streaks NOT shielded
by quiet weeks`).

**What clashes:** The coach docs say quiet weeks silence the COACH and do
NOT shield streaks (05-uiux: "quiet weeks never shield streaks"). If the
tree paused growth during quiet weeks, that would effectively shield
streak-derived bud state — a contradiction with "quiet weeks never shield
streaks". The LOOPHOLES candidate ("protected absence → bud scales") is
compatible only if bud scales are a DISPLAY state, not a streak-semantic
shield. The input map must state: quiet week = display-level dormancy tint
(no growth visuals for that window), zero effect on any derived streak/
presence semantics.

**Proposed resolution:** Lock: quiet weeks are a display modifier only
(class 7 sub-behavior (a)); all presence/streak/stage derivation ignores
them; bud scales render during the quiet window as the protected-state
visual (D099 "resting" copy).

### F-37 [MINOR] The one-notification constraint — already flagged in the inventory as "verify at the input map"; confirm it does not constrain tree animations

**Location:** inventory §14; 05-uiux (`"One-notification constraint": not
found in UIUX.md or DesignSystem.md`).

**What clashes:** If the one-notification/day rule were read as
one-ANIMATION/day, the tree's growth animations (D094 stage-transition UX,
D097 time-lapse replay) would be throttled. The rule is about coach
notifications (push), not in-app tree animation; the input map should state
this explicitly so the engine contract doesn't inherit a phantom
constraint.

**Proposed resolution:** Record as resolved-by-statement: the constraint
applies to notifications only; tree animations are exempt; the why-panel
never uses the notification channel.

### F-38 [MINOR] Goals-branch twig presence (recap of F-17a): no H3 owner exists for goals presence

**Location:** D088 twigs; 01-data-layer owner catalog (dayDomainPresence —
six domains, no goals); inventory §7.

**What clashes:** Twigs = "month of sustained presence per domain" — the
goals branch needs a presence source: goal updates are derived, tasks are
class 2, goal.completed is rare. A goals-only user (NL-parsed goals, few
tasks) may never grow a twig on the goals branch — an honest-but-undefined
outcome. Candidate owner: `goalActivity(dayKey)` = day with any task
completion, goal milestone, or goal-completion declaration (a new H3 owner
or a redefinition of the branch's twig source).

**Proposed resolution:** Define the goals-branch presence owner at the
input map (candidate above); if no owner is wanted, state "the goals branch
grows only via spurs/fruits (class 5), never twigs" explicitly — an empty
branch is a design choice, but it must be a stated one.

---

## 7. SUMMARY

| Severity | Count | IDs |
|---|---|---|
| CRITICAL | 10 | F-01, F-02, F-03, F-04, F-05, F-17, F-23, F-29, F-30, F-31 |
| MAJOR | 19 | F-06, F-07, F-08, F-09, F-10, F-12, F-13, F-14, F-18, F-19, F-20, F-24, F-25, F-26, F-27, F-32, F-33, F-34, F-38 |
| MINOR | 9 | F-11, F-15, F-16, F-21, F-22, F-28, F-35, F-36, F-37 |

Total: 38 findings. (F-17 is grouped under §3 for readability but is a
CRITICAL; the §6 CRITICALs F-29/F-30/F-31 are the undefined stage-clock
thresholds.)

**The CRITICAL list (the input map MUST resolve before the matrix can be
finalized):**

1. **F-01 — F-03 PR ceremony → non-achievement flowers** (class 6 misuse;
   mass-bloom from per-exercise first-PRs; bracts must wrap real
   achievement blooms only).
2. **F-02 — Body domain has no organ home** (5 branches vs 6 presence
   domains vs 9 achievement families; three inventory rows reference a
   "body-domain branch" that D088's organ map doesn't contain; family V
   flowers homeless; body.weighed's "branch wood density" is
   branch-unspecified).
3. **F-03 — "Qualifying year" is three different definitions** (D090
   any-domain STAGE-YEAR vs SCHEMA §3/Life-Fully-Logged RING-YEAR vs
   tree-2 trunk rings) — the stage clock, trunk rings, TENURE, and D089
   floors all read this term; a single-domain user would otherwise stall
   before the first bloom forever.
4. **F-04 — Tree birth anchor contradiction** (D090 frozen account anchor,
   first event ever, imports-excluded vs inventory §9/§14 coach-anniversary
   anchor, first journal entry, shift-on-delete) — different birth dates,
   different existence conditions ("no events" vs "no entries"), and the
   shift-on-delete variant breaks D098 monotonicity.
5. **F-05 — Class 7 definitional drift** (presence/absence has absorbed
   corrections/structures/displays/governance/outputs; the "every input
   classifies into the 7 classes — zero new decisions" future-proofing
   claim is false as used; coach outputs are simultaneously "not input"
   and "mirrored facts").
6. **F-17 — The domain-set mismatch** (5 branches {…, goals} vs 6 presence
   domains {…, body, media}: goals branch has no presence owner, body and
   media presence have no branch, BALANCE/tint/achievements read three
   different domain sets).
7. **F-23 — The trigger-authority rule contradicts its own adaptation
   map** (D088 "NO parallel trigger systems" vs ≥8 adaptations with
   derived triggers; the promised achievement-scan correlation table is a
   missing deliverable).
8. **F-29/F-30/F-31 — The three load-bearing stage thresholds are
   undefined** ("sustained presence period/first twig" — no presence bar;
   "first qualifying year (any-domain)" — no numeric definition; "DERIVED
   MATURITY / structural threshold / pioneer-speed" — no candidate at all,
   and it gates the first bloom, the matrix's class-5/6 cells, and the D092
   first-bloom contract).

**Cross-cutting recommendation:** findings F-01…F-38 converge on a single
input-map deliverable beyond the SCHEMA rows: a **canonical domain table**
(branch × presence-domain × achievement-family × flower-attachment ×
twig-source) resolving F-02/F-17/F-23/F-29/F-38 in one place, plus the
**threshold register** (every undefined bar above, with candidate values for
user approval), and the **trigger correlation table** (D088's promised
deliverable, missing from the scan outputs). Without these three artifacts,
the matrix cannot be promoted from draft to contract (LOOPHOLES §8) without
reopening every one of these decisions at implementation.