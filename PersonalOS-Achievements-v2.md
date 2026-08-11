# PersonalOS Achievement & Trophy System — v2 Design

Planning document only. No code, no visual/color decisions. Point values for
each tier are intentionally left blank — that's a later pass.

---

## Reward Tier System: Growth Rings

Instead of bronze/silver/gold, tiers borrow from the life-tree/timeline
metaphor already in the product. A tree doesn't get medals — it grows
rings. Each ring means the thing became part of who you are, not just a
score you hit.

- **Sprout** — a first: the first time you did the thing at all.
- **Root** — the thing took hold: short but real consistency (weeks, not days).
- **Branch** — the thing extended somewhere new: a new domain, a new
  personal best, a new kind of entry.
- **Heartwood** — the thing became structural: it's been true for months,
  it's load-bearing now, it'd be strange if it stopped.
- **Ring** — a full year passed and the thing was still true. Literally
  one ring per year, like the tree.
- **Grove** — multi-year, decade-scale, or genetically-ceiling-tier. The
  rare, quiet, huge ones.

---

## I. The Long Conversation — Journal & Reflection

**Ink on the Page** — one-time
- Criteria: first journal entry ≥ 40 words, on its own occurredAt day.
  Imported entries never count as eligible for "first."
- Tier: Sprout

**A Week of Honesty** — one-time
- Criteria: first 7 consecutive dayKeys each with ≥ 1 qualifying entry.
- Tier: Root

**A Season Kept** — repeatable, once per unbroken streak-run
- Criteria: 90 consecutive qualifying days.
- Tier: Branch

**Same Time, Every Time** — repeatable
- Criteria: qualifying journal entries logged within the same
  30-minute clock window (e.g. 22:00–22:30) on 60 consecutive
  qualifying days.
- Tier: Heartwood
- Guardrail: reads the entry's occurredAt — the time the USER
  DECLARES the writing happened — never the typing moment (audit
  clarity, TENSION 15 lock). The window has to hold across 60 real,
  consecutive, independently qualifying days.

**Full Orbit** — repeatable, once per anchored yearly window
- Criteria: qualifying entry on ≥ 300 distinct days within a 365-day
  window.
- Tier: Ring
- Guardrail: 300/365 not 365/365 — leaves room for honest gaps, each
  entry still independently meets the word minimum on its own day.

**Half Century** — one-time
- Criteria: 50th lifetime qualifying, non-imported entry.
- Tier: Root

**Five Hundred Pages** — one-time
- Criteria: 500th lifetime qualifying entry.
- Tier: Branch

**A Thousand Entries** — one-time
- Criteria: 1,000th lifetime qualifying entry.
- Tier: Heartwood

**Novel-Length Life** — repeatable, at 25k / 100k / 500k / 1M
cumulative words
- Criteria: sum of word counts across all non-imported qualifying
  entries crosses the threshold.
- Tier: Root → Branch → Heartwood → Grove

**Deep Dive** — repeatable, one-time per threshold (500 / 1,500 /
4,000 words in a single entry)
- Criteria: a single entry's word count crosses the threshold.
- Tier: Branch

**You Came Back** — repeatable
- Criteria: a qualifying entry after a gap ≥ 21 days since the
  previous qualifying entry.
- Tier: Root
- Guardrail: celebratory only, on the return itself — no negative
  mirror achievement for the gap exists.

**Same Question, New Answer** — repeatable, at 2 / 3 / 5+ years
- Criteria: a qualifying entry exists on the same month-day across
  ≥ N distinct years (e.g. an entry every March 14th for 3 different
  years). Fires the year the Nth match lands.
- Tier: Branch → Heartwood → Grove
- Guardrail: each year's entry must independently be a real,
  qualifying entry on its own actual date — this can only be earned
  by literally showing up on that date repeatedly, not retroactively.
- Re-arm (ledger G2, locked): fires at 2, 3, and 5 — one-time each,
  never again at 6+ ("5+" = final milestone at 5).

**Unprompted** — repeatable, first occurrence then count milestones
(10 / 50 / 200)
- Criteria: a qualifying journal entry logged on a day with zero
  other domain entries (no habit, workout, food log, or vlog that
  same day) — reflection for its own sake, not as a byproduct of
  routine tracking.
- Tier: Root → Branch → Heartwood

**The Turn of the Page** — repeatable, once per phase transition
- Criteria: a qualifying journal entry logged within 3 days of a
  phase entity's start date (a new bulk/cut/maintenance phase
  beginning) — the moment you wrote about the shift as it happened.
- Tier: Branch

**Bookended** — repeatable, once per calendar year (the one named
exception: definitionally calendar per the M4 ledger lock, because it
requires January-1-first + December-31-last in the SAME calendar year)
- Criteria: a qualifying entry exists on both January 1 and December
  31 of the same calendar year, with qualifying entries covering
  ≥ 40% of that year's days.
- Tier: Heartwood

**Three Years, Still Talking** — one-time
- Criteria: Full Orbit criteria (≥ 300 qualifying days within a
  365-day window) independently satisfied in 3 consecutive,
  non-overlapping yearly windows.
- Tier: Grove

**Half a Decade of Honesty** — one-time
- Criteria: Full Orbit criteria independently satisfied in 5
  consecutive, non-overlapping yearly windows.
- Tier: Grove
- Guardrail (both above): each yearly window must pass Full Orbit on
  its own — Full Orbit itself already requires the 300 qualifying
  days to be spread across the year, so there's no way to burst-log
  at year-end to fake a window, and no way to skip a year in the
  middle and still have the run count as consecutive.

---

## II. The Unbroken Chain — Habits & Consistency

**Day One** — one-time
- Criteria: first real habit-completion event ever logged.
- Tier: Sprout

**One Week In** — repeatable, once per habit
- Criteria: any habit's first 7-day unbroken streak.
- Tier: Root

**A Hundred Days** — repeatable, once per habit
- Criteria: any habit reaches a 100-day unbroken streak.
- Tier: Heartwood

**The Long Haul** — repeatable, once per habit
- Criteria: any habit reaches a 500-day unbroken streak.
- Tier: Grove

**Full Year, One Habit** — repeatable, once per habit
- Criteria: a habit logs ≥ 300 completions inside a 365-day window.
- Tier: Ring

**Perfect Month** — repeatable
- Criteria: a single habit is completed on every calendar day of a
  full month (28–31/31, matching that month's real length).
- Tier: Branch

**Five Strong** — one-time
- Criteria: ≥ 5 distinct habits each carrying an active streak ≥ 7
  days, simultaneously, on the same day.
- Tier: Branch
- Guardrail: "active" = strict consecutive completions only — a
  grace-covered day is not active (ledger G19, locked).

**Juggling Act** — repeatable
- Criteria: ≥ 3 distinct habits completed same-day, on 14 such days
  within any 21-day window.
- Tier: Branch
- Guardrail: fires once per closed qualifying 21-day window;
  overlapping sliding windows never re-fire (ledger G5, locked).

**Like Clockwork** — repeatable, once per habit
- Criteria: a single habit's completions each fall inside the same
  30-minute clock window on 90 consecutive completions.
- Tier: Heartwood
- Guardrail: reads the habit's occurredAt — the requested
  completion time as declared by the user, per the TENSION 15 lock.
  A run that's otherwise unbroken but drifts outside the window
  doesn't qualify; it isn't "close enough."

**Honest Rest** — repeatable
- Criteria: an explicit "planned rest" event logged against a habit,
  inside an otherwise active streak of ≥ 14 days on either side.
- Tier: Root
- Guardrail: only fires off an explicit rest-log event, never off
  silence — absence alone must never earn anything.

**Rebuilt** — repeatable
- Criteria: a habit that broke a ≥ 30-day streak rebuilds a fresh ≥
  30-day streak afterward.
- Tier: Branch
- Guardrail: no reward for the break, only the rebuild — both floors
  set at 30 days so it's not a cheap farmable ping-pong.

**One Trip Around the Sun** — repeatable, once per habit
- Criteria: a habit has a real completion logged within 7 days either
  side of the first anniversary of its creation date — it's still
  alive a year later, even if not unbroken.
- Tier: Ring
- Guardrail: doesn't require an unbroken streak, only evidence the
  habit is still genuinely practiced near its anniversary — rewards
  survival of the habit itself, distinct from the streak-based ones.
- Primitive: `anniversaryWindow(anchorDate = that habit's first
  qualifying completion, k = 1, tolerance = 7 days)` — ledger M2
  ANNIVERSARY WINDOW (locked).

**Renaissance Life** — one-time
- Criteria: 5 distinct habits have each individually reached a
  100-day unbroken streak at some point (not necessarily
  simultaneously, not necessarily currently active).
- Tier: Heartwood
- Guardrail: lifetime achievement per-habit, so an old abandoned
  habit's past 100-day streak still counts — this rewards breadth of
  genuine self-improvement attempts across your life, not just what's
  active today.

**Three Years, No Missing Links** — repeatable, once per habit
- Criteria: a single habit independently satisfies the Full Year, One
  Habit criteria (≥ 300 completions within a 365-day window) in 3
  consecutive, non-overlapping yearly windows.
- Tier: Grove

**Five Years, No Missing Links** — repeatable, once per habit
- Criteria: same as above, 5 consecutive yearly windows.
- Tier: Grove
- Guardrail (both above): same consecutive-window logic as the
  journal equivalents — each year independently clears the full
  300/365 bar on its own.

---

## III. The Iron Ledger — Gym & Strength

### First steps

**First Rep Logged** — one-time
- Criteria: first workout-completed event with ≥ 1 real logged set.
- Tier: Sprout

**The Basics** — one-time
- Criteria: first logged set for each of squat, bench press,
  deadlift, and overhead press (four separate first-occurrences,
  tracked as one composite achievement fired once the fourth lands).
- Tier: Root

### PR volume — the "how many times have you beaten yourself" ladder

**New Number** — repeatable
- Criteria: a set's weight×reps (or e1RM estimate) exceeds the prior
  best for that exact lift, on the day logged.
- Tier: Root
- Guardrail: PRs only compare against prior non-imported sets — an
  imported history can't manufacture or inflate a PR.

**Ten Times Better** — one-time
- Criteria: 10th lifetime PR across any lifts combined.
- Tier: Root

**Quarter Century of PRs** — one-time
- Criteria: 25th lifetime PR.
- Tier: Branch

**Fifty Beaten** — one-time
- Criteria: 50th lifetime PR.
- Tier: Heartwood

**Century of PRs** — one-time
- Criteria: 100th lifetime PR.
- Tier: Grove

**Same Lift, Ten Times Better** — repeatable, once per lift
- Criteria: 10th lifetime PR on one specific named lift.
- Tier: Branch

**PR Season** — repeatable
- Criteria: PRs logged on ≥ 3 distinct lifts within the same calendar
  month.
- Tier: Branch

**Trifecta Week** — repeatable
- Criteria: PRs on squat, bench press, and deadlift all logged within
  the same 7-day window.
- Tier: Heartwood
- Guardrail: fires once per closed qualifying 7-day window; overlapping
  scans never re-fire (ledger G6, locked).

**A PR Every Season** — one-time
- Criteria: at least one PR (any lift) logged in ≥ 12 distinct
  calendar months, not necessarily consecutive.
- Tier: Grove
- Guardrail: distinct-months count, not a streak — rewards strength
  progress sustained across real elapsed time and life phases, rather
  than a single hot stretch of training.

### Absolute numbers on the bar — the bragging-rights ladder

Each fires once, the first day a REAL logged set meets or exceeds the
threshold — weight ≥ threshold AND reps ≥ 1, straight from the set
log. No e1RM substitution, no estimated-1RM inflation (LOCKED, user
yes: "actual-lift-only"). Bodyweight-agnostic — pure external load
milestones. Every weight gets its own name instead of just a number.

**Bench Press**
- 60kg — *First Press* — Tier: Root
- 80kg — *Two Plates Deep* — Tier: Root
- 100kg — *Century Bench* — Tier: Branch
- 120kg — *Heavy Iron* — Tier: Heartwood
- 140kg — *The Furnace* — Tier: Grove

**Back Squat**
- 80kg — *First Descent* — Tier: Root
- 100kg — *Century Squat* — Tier: Root
- 140kg — *The Foundation* — Tier: Branch
- 180kg — *Bedrock* — Tier: Heartwood
- 220kg — *The Monolith* — Tier: Grove

**Deadlift**
- 100kg — *Ground Zero* — Tier: Root
- 140kg — *The Pull* — Tier: Root
- 180kg — *Iron Harvest* — Tier: Branch
- 220kg — *The Reckoning* — Tier: Heartwood
- 260kg — *Dragon Slayer* — Tier: Grove
  - Named for the sword nobody sane could actually swing — the
    kind of weight a certain black swordsman would consider a
    warm-up. Feels like the right name for the top of this ladder.

**Overhead Press**
- 40kg — *First Overhead* — Tier: Root
- 60kg — *Skyward* — Tier: Branch
- 80kg — *The Crown* — Tier: Heartwood
- 100kg — *Atlas Press* — Tier: Grove

**Barbell Curl**
- 20kg — *First Curl* — Tier: Root
- 30kg — *Gun Show* — Tier: Root
- 40kg — *Peak Contraction* — Tier: Branch
- 50kg — *Iron Grip* — Tier: Heartwood
- 60kg — *Cast Iron Arms* — Tier: Grove

- Guardrail (all five lifts above): threshold check reads the actual
  logged weight AND reps of a real set on its real day — real set
  only, NEVER an e1RM estimate, NEVER a user-typed "I could probably
  lift X." A 45kg×8 log is 45kg, not ~50kg.

### Relative-to-you numbers — the ladder that moves as you grow

These recompute against the 7-day rolling average bodyweight at the
time of the lift, so they stay meaningful through a bulk or a cut
rather than being fixed absolute targets. The strength metric here is
EST-1RM of the best logged set (single shared Epley owner per the
ledger, TENSION item 6) ÷ rolling bodyweight — LOCKED, user chose
option A. One metric, one family.

**Bodyweight Bench** — one-time
- Criteria: a logged bench set's est-1RM ≥ 1.0× rolling bodyweight.*
- Tier: Branch

**One and a Half** — one-time
- Criteria: a logged squat set's est-1RM ≥ 1.5× rolling bodyweight.
- Tier: Branch

**Double Bodyweight Pull** — one-time
- Criteria: a logged deadlift set's est-1RM ≥ 2.0× rolling bodyweight.
- Tier: Heartwood

**Press Three-Quarters** — one-time
- Criteria: a logged overhead press set's est-1RM ≥ 0.75× rolling
  bodyweight.
- Tier: Branch

**Triple Bodyweight Club** — one-time
- Criteria: on a single day, the sum of that day's best est-1RMs for
  squat + bench + deadlift ≥ 3.0× rolling bodyweight ("the Total").
- Tier: Heartwood

**Four Times Over** — one-time
- Criteria: same Total calculation ≥ 4.0× rolling bodyweight.
- Tier: Grove
- Guardrail (all six above): bodyweight = the 7-day rolling average
  (O3/rollingWindowMean), never a single raw weigh-in; est-1RM from
  the shared Epley owner — same number the standards table reads.

### Strength standards (bodyweight-relative, frozen inline below — no open tables)

**Strength Standard Reached** — repeatable, once per lift per tier
(Novice / Intermediate / Advanced)
- Criteria: a logged set's est-1RM ÷ rolling bodyweight crosses a
  published standard threshold for that lift for the first time
  (standard thresholds = men: bench 0.50/0.75/1.20/1.60/2.00, squat
  0.75/1.00/1.65/2.20/2.75, deadlift 1.00/1.25/2.00/2.50/3.00, OHP
  0.35/0.50/0.65/0.90/1.20 — frozen seed in list order: Beginner,
  Novice, Intermediate, Advanced, Elite; the trophy fires ONLY at
  the Novice/Intermediate/Advanced positions — e.g. bench 0.75 /
  1.20 / 1.60 (women's column ~60–70% upper, ~75–85% lower, per
  ledger TENSION 5); Beginner and Elite are Coach/profile display
  grades only, never trophies (ledger THRESHOLD-TO-RANK MAP,
  locked).
- Tier: Branch (Novice) → Heartwood (Intermediate) → Grove (Advanced)

### Bodyweight ladders — push-ups, pull-ups, dips

Rep ladders fire the first day a single, unbroken, continuous logged
set (not summed across a session) meets or exceeds the threshold.
Weighted ladders fire off the added external weight on a logged set
of the given exercise. Both read real logged reps/weight on their
real day — nothing here is ever a user-typed estimate.

**Push-Ups** (unbroken single-set reps)
- 20 — *Warm Floor* — Tier: Root
- 50 — *Fifty Push-Ups* — Tier: Root
- 100 — *Century Push* — Tier: Branch
- 150 — *Gazelle Pace* — Tier: Heartwood
- 200 — *Dempsey Roll* — Tier: Grove
  - Named for the relentless, can't-be-countered combo that closes
    out fights in *Hajime no Ippo* — the idea being that by 200
    unbroken reps, form stops being a technique and starts being
    something closer to a weapon.

**Pull-Ups** (unbroken single-set reps)
- 5 — *First Chin* — Tier: Root
- 10 — *Ten Clean* — Tier: Root
- 20 — *Twenty Strict* — Tier: Heartwood
- 30 — *Thirty and Counting* — Tier: Heartwood
- 50 — *The Long Ascent* — Tier: Grove

**Weighted Pull-Ups** (added external weight)
- >0kg — *Loaded Up* — Tier: Branch
- 20kg — *Added Iron* — Tier: Heartwood
- 40kg — *Beyond Bodyweight* — Tier: Grove
  - Guardrail: fires only off a real logged added-weight value on a
    real completed set — an empty or zero-weight log never counts as
    "loaded."

**Dips** (unbroken single-set reps)
- 20 — *First Dip* — Tier: Root
- 40 — *Forty Deep* — Tier: Root
- 60 — *Sixty Strong* — Tier: Branch
- 80 — *Eighty and Steady* — Tier: Heartwood
- 100 — *Century Dip* — Tier: Grove

**Weighted Dips** (added external weight)
- >0kg — *Loaded Dip* — Tier: Branch

### Consistency & volume

**Moved a Mountain** — repeatable, cumulative lifetime tonnage
- Criteria: running sum of weight×reps across all non-imported logged
  sets crosses the threshold.
- Tonnage rule (ledger M2 TONNAGE DEFINITION, locked): weight-mode
  sets only — rep-mode/bodyweight sets contribute 0, addedLoadKg
  never multiplies; no fake kg.
- 100,000kg — *The Quarry Opens* — Tier: Root
- 500,000kg — *The Rockslide* — Tier: Branch
- 1,000,000kg — *The Mountain Moves* — Tier: Heartwood
- 5,000,000kg — *The Brand* — Tier: Grove
  - Unofficially, this one's named for the cursed mark that never
    comes off once it's given. Five million kilograms doesn't wash
    out either.

**Heaviest Session** — repeatable
- Criteria: a single day's total logged tonnage exceeds the prior
  single-day record. Same weight-mode-only tonnage definition as
  Moved a Mountain.
- Tier: Root

**Trimester of Iron** — repeatable
- Criteria: 12 consecutive weeks each meeting the configured weekly-
  workout target, zero weeks below it.
- Tier: Branch

**The Schedule Never Breaks** — repeatable
- Criteria: workouts logged on the exact same set of weekdays (e.g.
  Mon/Wed/Fri) for 26 consecutive weeks, with zero weeks off-pattern.
- Tier: Heartwood
- Guardrail: the weekday pattern must be exact and consecutive — a
  single off-pattern week (right day, wrong week; right week, wrong
  day) resets the run rather than being rounded up to "close enough."

**Full Cycle** — repeatable, once per closed phase
- Criteria: a phase entity (bulk/cut/maintenance) is closed out with
  ≥ 1 qualifying workout logged in ≥ 80% of its weeks.
- Tier: Heartwood

**Back at It** — repeatable
- Criteria: after a gap ≥ 14 days with no logged workouts, a new
  workout is logged, and a prior PR is matched or exceeded within the
  following 60 days.
- Tier: Branch
- Guardrail: no shame framing for the gap — reward is entirely about
  the return. The prior PR may be ANY exercise's PR (ledger G7b,
  locked) — any real PR re-matched qualifies.

**Thousand Sessions** — one-time
- Criteria: 1,000th lifetime logged workout.
- Tier: Grove

**A Year on the Bar** — repeatable, once per year of training
- Criteria: a workout logged within 7 days either side of the
  anniversary of the first-ever logged workout.
- Tier: Ring
- Guardrail: mirrors One Trip Around the Sun's logic — evidence
  you're still training near the anniversary, not an unbroken-streak
  requirement.
- Primitive: `anniversaryWindow(anchor = first-ever qualifying
  workout, k = 1, tolerance = 7 days)` — ledger M2 ANNIVERSARY
  WINDOW (locked).

**Three Years in Iron** — one-time
- Criteria: 3 consecutive, non-overlapping 365-day windows (anchored
  to the first-ever logged workout) each independently contain ≥ 80
  qualifying workouts (roughly 1.5/week sustained).
- Tier: Grove

**Five Years in Iron** — one-time
- Criteria: same as above, 5 consecutive yearly windows.
- Tier: Grove
- Guardrail (both above): the per-year workout-count floor is what
  keeps this from being satisfied by a single anniversary touch —
  each year has to show genuine sustained training, not just
  survival.

---

## IV. The Fuel Line — Nutrition & Food Discipline

**First Plate Logged** — one-time
- Criteria: first calorie/food-log entry with real logged items.
- Tier: Sprout

**A Month of Logging** — repeatable, once per streak-run
- Criteria: 30 consecutive days with ≥ 1 qualifying food log per day.
- Tier: Root

**On Target** — repeatable
- Criteria: rolling 7-day window with ≥ 5 logged days, average daily
  calorie intake inside the active phase's target band. Fires once
  per qualifying week.
- Tier: Root
- Guardrail: weekly average with a 5/7-day logging floor, never a
  single-day check.

**Dialed In** — repeatable
- Criteria: protein target hit on ≥ 20 days within a rolling 30-day
  window.
- Tier: Branch

**No Deviation** — repeatable
- Criteria: total daily logged calorie intake (from real logged
  items) stays within ±3% of the same target number for 30
  consecutive logged days.
- Tier: Heartwood
- Guardrail: computed from the actual sum of that day's logged food
  items, never a typed daily total — you can't hit this by just
  entering the target number as a single fake line item.

**Half a Year of Fuel** — one-time
- Criteria: 180th cumulative lifetime logged food-log day (need not
  be consecutive).
- Tier: Branch

**The Long Table** — one-time
- Criteria: 1,000th cumulative lifetime logged food-log day.
- Tier: Heartwood

**Paced Bulk / Paced Cut** — repeatable, once per closed phase
- Criteria: a closed phase where the weekly rolling-average weight
  change stayed inside the target pace band for ≥ 80% of its weeks.
- Tier: Heartwood

**Broke the Plateau** — repeatable
- Criteria: within an active phase, the weekly rolling-average weight
  change stays under 0.1kg/week for ≥ 4 consecutive weeks (a real
  stall), followed by ≥ 2 consecutive weeks back inside the target
  pace band.
- Tier: Heartwood
- Guardrail: requires both the stall (real, sustained, measured on
  rolling averages) and the confirmed recovery — can't be triggered
  by noise in either direction.

**Both Directions** — one-time
- Criteria: at least one closed phase of type bulk and at least one
  closed phase of type cut have each independently satisfied Full
  Cycle criteria.
- Tier: Grove
- Guardrail: requires two fully separate closed-phase records — this
  is a whole-journey achievement, not something either phase alone
  can trigger.

**The Turn** — one-time
- Criteria: first phase entity of type "cut" is created with a start
  date immediately following a closed "bulk" phase (no gap-phase of
  a different type between them).
- Tier: Branch

**Three Years on the Line** — one-time
- Criteria: 3 consecutive, non-overlapping 365-day windows each
  independently contain ≥ 250 distinct logged food-log days.
- Tier: Grove

**Five Years on the Line** — one-time
- Criteria: same as above, 5 consecutive yearly windows.
- Tier: Grove

---

## V. The Shape of Things — Body & Weight Tracking

**First Measurement** — one-time
- Criteria: first body-metric entry logged.
- Tier: Sprout

**Steady Hand** — repeatable
- Criteria: a weight entry logged on the same weekday for 12
  consecutive weeks, no missed week.
- Tier: Root
- Guardrail: the anchor weekday = the FIRST qualifying weigh-in of
  the run (ledger G18, locked).

**Same Hour, Same Scale** — repeatable
- Criteria: a weight entry logged within the same 30-minute clock
  window on the same weekday, for 26 consecutive weeks.
- Tier: Heartwood
- Guardrail: uses the weigh-in's declared time (occurredAt — the
  time the user says the weigh-in happened; TENSION 15 lock).
  Tightens Steady Hand's weekday-only rule to weekday AND
  time-of-day — not a rounding-up of the looser one. The weekday
  and the 30-minute slot are both anchored to the first weigh-in
  of the run (ledger G18, locked).

**Real Progress** — repeatable, at meaningful cumulative net-change
thresholds toward an active goal direction
- Criteria: 7-day rolling average crosses the threshold distance from
  the phase's starting rolling average, confirmed at ≥ 2 consecutive
  weekly checkpoints.
- Tier: Branch
- Guardrail: rolling average + two-checkpoint confirmation — a single
  noisy reading can't trigger this.

**Then and Now** — repeatable, at 6-month / 1-year / multi-year gaps
between physique-timeline photos
- Criteria: two physique-timeline-tagged photos with a real capture
  gap ≥ threshold.
- Tier: Branch → Heartwood → Grove

**Eyes on the Data** — repeatable
- Criteria: a physique-timeline photo is logged within the same
  7-day window a weight-gain-ladder milestone (see below) is first
  confirmed — the visual evidence lands next to the number.
- Tier: Branch
- Guardrail: both halves must independently be real, qualifying
  events in their own right — this only rewards a coincidence you'd
  actually have to make happen, not a manufactured pairing.

**Frame by Frame** — one-time
- Criteria: a physique-timeline photo logged in ≥ 6 consecutive
  calendar months (at least one per month, no gap month).
- Tier: Heartwood

**Three Years in Frame** — one-time
- Criteria: 3 consecutive, non-overlapping 365-day windows each
  independently contain a weight entry on ≥ 40 distinct calendar
  weeks (roughly Steady Hand's cadence, sustained).
- Tier: Grove

**Five Years in Frame** — one-time
- Criteria: same as above, 5 consecutive yearly windows.
- Tier: Grove

### The weight-gain ladder (built for your current numbers)

Starting point on record: **190cm, 64kg.** Rather than pick arbitrary
round numbers, this ladder is derived from a rough natural-genetic-
potential estimate so the milestones actually mean something instead
of being decorative.

The estimate uses the FFMI (fat-free mass index) heuristic: natural
lifters' fat-free mass rarely exceeds an FFMI of about 25 without
pharmacological help (this is a commonly cited rough ceiling, not a
hard law — it ignores frame/wrist/ankle size, which really do shift
it a few points either way for a given person).

    FFM_max ≈ 25 × height(m)²
            = 25 × 1.90²
            = 25 × 3.61
            = 90.25 kg of fat-free mass

At an athletic-but-not-contest-stage bodyfat range of roughly 8–12%:

    Total weight = FFM_max / (1 − bodyfat%)
    at 12%: 90.25 / 0.88 ≈ 102.6 kg
    at  8%: 90.25 / 0.92 ≈  98.1 kg

So the rough natural-potential ceiling for a 190cm frame lands
**around 98–103 kg at athletic leanness — call it ~100kg.** This is a
population-level heuristic being applied to one person with no
wrist/ankle data, so treat it as a directional target, not a
prediction — the achievement below is deliberately framed as an
"estimate," not a promise.

**Six Kilos In** — one-time
- Criteria: 7-day rolling average bodyweight ≥ 70kg, confirmed at ≥ 2
  consecutive weekly checkpoints.
- Tier: Root

**Seventy-Five** — one-time
- Criteria: rolling average ≥ 75kg, same confirmation rule.
- Tier: Root

**Eighty** — one-time
- Criteria: rolling average ≥ 80kg, same confirmation rule.
- Tier: Branch

**Eighty-Five** — one-time
- Criteria: rolling average ≥ 85kg, same confirmation rule.
- Tier: Branch

**Ninety** — one-time
- Criteria: rolling average ≥ 90kg, same confirmation rule.
- Tier: Heartwood

**Ninety-Five** — one-time
- Criteria: rolling average ≥ 95kg, same confirmation rule.
- Tier: Heartwood

**The Estimated Ceiling** — one-time
- Criteria: rolling average ≥ 100kg, same confirmation rule.
- Tier: Grove
- Guardrail: like all Real Progress-family achievements, this reads
  the rolling average with a two-checkpoint confirmation — a single
  heavy weigh-in (post-meal, post-water-loading) can't trigger it.

---

## VI. Elsewhere — Vacations & Time-Off

**Off the Grid** — one-time
- Criteria: first logged vacation date-range ≥ 7 days.
- Tier: Sprout

**Took the Time** — repeatable, once per anchored yearly window
- Criteria: cumulative logged vacation days within a 365-day window
  cross a configured healthy-balance threshold (e.g. 14+ days/year).
- Tier: Root
- Guardrail: purely positive framing — no reverse "didn't rest
  enough" achievement exists. Day counting = day-level UNION of
  vacation periods (a calendar day counts once even inside
  overlapping ranges — ledger E2 VACATION-KEY UNION, locked).

**Still Here, Even Here** — repeatable
- Criteria: a qualifying journal entry logged on a day inside an
  active logged vacation range. Entirely optional.
- Tier: Root

**Somewhere Else, Still You** — repeatable
- Criteria: within a single active logged vacation, at least one
  qualifying journal entry AND at least one qualifying vlog are both
  logged on days inside the range.
- Tier: Branch

---

## VII. Proof of Life — Media Archive (Vlogs & Photos)

**Rolling Tape** — one-time
- Criteria: first kept vlog — captured through the pipeline OR
  adopted from the phone (per the M6 qualifying-entry lock; an
  adopted first vlog fires it).
- Tier: Sprout

**Behind the Scenes** — one-time
- Criteria: first logged vlog with duration ≥ 10 minutes.
- Tier: Root

**A Week on Camera** — repeatable, once per streak-run
- Criteria: 7 consecutive days each with ≥ 1 vlog.
- Tier: Root

**A Hundred Days on Camera** — repeatable, once per streak-run
- Criteria: 100 consecutive days each with ≥ 1 vlog.
- Tier: Heartwood

**Full Orbit, on Camera** — repeatable, once per anchored yearly window
- Criteria: ≥ 300 distinct days within a 365-day window have a
  qualifying vlog.
- Tier: Ring

**The Full Reel** — one-time
- Criteria: 1,000th lifetime logged vlog.
- Tier: Grove

**The Archive Grows** — repeatable, at 10 / 50 / 100 / 500 / 1,000
cumulative archived hours
- Criteria: sum of duration across all non-imported logged vlogs
  crosses the threshold.
- Tier: Root → Branch → Heartwood → Ring → Grove

**One Year, Same Day** — repeatable
- Criteria: a vlog is logged on the same month-day as another
  qualifying vlog from exactly 1 year prior (±1 day).
- Tier: Heartwood

**Half a Decade, Same Day** — one-time
- Criteria: same month-day match as above, but with a qualifying
  vlog from exactly 5 years prior.
- Tier: Grove
- Guardrail (both above): both vlogs must be real, independently
  qualifying, non-imported entries on their actual capture dates —
  this is only earned by literally filming on that date twice, years
  apart.

**The Long Take** — one-time
- Criteria: first logged vlog with duration ≥ 60 minutes.
- Tier: Branch

**Three Years of Proof** — one-time
- Criteria: Full Orbit, on Camera criteria (≥ 300 qualifying days
  within a 365-day window) independently satisfied in 3 consecutive,
  non-overlapping yearly windows.
- Tier: Grove

**Five Years of Proof** — one-time
- Criteria: same as above, 5 consecutive yearly windows.
- Tier: Grove

---

## VIII. The Rings — Longevity & Time

**One Year In** — one-time
- Criteria: 365 days since the app's real anchor date (occurredAt of
  the first-ever non-imported event, any domain), with qualifying
  activity in ≥ 3 domains logged in ≥ 9 of the 12 months.
- Tier: Ring
- Guardrail: anchored to the first real event, never install/open
  date — reinstalling can't fabricate an earlier anchor.

**Two Years / Five Years / Ten Years** — one-time each
- Criteria: same anchor logic, scaled window, ≥ 75% of months in that
  window showing qualifying activity.
- Tier: Ring (2yr) → Grove (5yr) → Grove, highest (10yr)

**Life, Fully Logged** — repeatable, once per anchored yearly window
- Criteria: within one 365-day window, all six domains each have ≥ 1
  qualifying non-imported entry.
- Tier: Heartwood

**A Week, Whole** — repeatable
- Criteria: within a single ISO calendar week (Mon–Sun), all six
  domains each have ≥ 1 qualifying non-imported entry.
- Tier: Branch
- Guardrail: the achievable, repeatable weekly cousin of Six for Six
  and Life, Fully Logged — still requires all six real, on their own
  days, just in a shorter honest window.

**The Three-Year Vow** — one-time
- Criteria: Life, Fully Logged criteria (all six domains each with
  ≥ 1 qualifying entry) independently satisfied in 3 consecutive
  anchored yearly windows.
- Tier: Grove

**The Five-Year Vow** — one-time
- Criteria: same as above, 5 consecutive anchored yearly windows.
- Tier: Grove
- Guardrail (both above): each year must independently clear the
  full six-domain bar on its own — this is the hardest achievement in
  the system to fake, since it compounds every other domain's
  guardrails at once, every year, for years running.

**Old Growth** — one-time
- Criteria: Life, Fully Logged criteria independently satisfied in 10
  consecutive anchored yearly windows.
- Tier: Grove
- Guardrail: the ceiling achievement of the entire system. Growth
  Rings deliberately has no tier above Grove — this is what "as high
  as the system goes" looks like when it actually happens: a decade
  where every domain, every year, was real.

**Ouroboros** — one-time
- Criteria: the Life, Fully Logged criterion (all six domains, each
  with ≥ 1 qualifying non-imported entry) passes in 10 CONSECUTIVE
  anchored yearly windows — with restart semantics: a single rested or
  missed window anywhere in the run restarts the count at zero; any
  10 consecutive qualifying windows qualifies, even across multiple
  broken runs.
- Tier: Grove (sits with Old Growth; there is deliberately no tier
  above Grove)
- Guardrail: the difference from Old Growth is restart semantics —
  Old Growth fires once a 10-consecutive-window run exists anywhere
  in history; the Ouroboros applies the same 10-consecutive rule but
  with a streak, not a once-history, judgment: a gap window anywhere
  restarts the counter at zero, and any later unbroken run of 10 that
completes fires the trophy — one-time like every other achievement,
   once earned, never taken back; a gap before reaching 10 only resets
   the attempt. Rings (ring trophies) hold forgiveness; the Ouroboros
   holds the streak truth: the wall isn't a single gap — it's staying
   in the run long enough to close a decade. Derived from history like
   everything else: same per-year real bars, same import rules — no XP.

**Pith** — one-time
- Criteria: 1 ring ever (ring = a Life, Fully Logged qualifying yearly
  window, per ring rules above).
- Tier: Sprout
- Guardrail: rings are the count track — they stack for life; a missed
  year never removes an existing ring.

**Medullary Ray** — one-time
- Criteria: 2 rings ever.
- Tier: Root

**Oak** — one-time
- Criteria: 3 rings ever.
- Tier: Branch
- Guardrail: 3 rings mark the tree grown up, a robust core. Ring count
  is a pure lifetime total, regardless of when the rings landed.

**Sapwood** — one-time
- Criteria: 4 rings ever.
- Tier: Branch

**Ironwood** — one-time
- Criteria: 5 rings ever.
- Tier: Heartwood
- Guardrail: at 5 rings the wood turns iron — half a decade, gaps
  allowed, still counted.

**Cambium** — one-time
- Criteria: 6 rings ever.
- Tier: Heartwood

**Latewood** — one-time
- Criteria: 7 rings ever.
- Tier: Ring

**Phloem** — one-time
- Criteria: 8 rings ever.
- Tier: Ring

**Cork** — one-time
- Criteria: 9 rings ever.
- Tier: Ring

**Yew** — one-time
- Criteria: 10 rings ever.
- Tier: Grove
- Guardrail: the ancient tree — a full decade of fully-logged years,
  no consecutive requirement, rings never unring; permanence is the
  point. The final trophy of the ring series: like a real tree, a
  year that wasn't fully logged simply adds no ring — nothing is
  taken from what came before.

---

## IX. Full Circle — Cross-Domain / Integration

**Full Circle Day** — one-time (first), then repeatable count
milestones (10 / 50 / 100 / 365 lifetime)
- Criteria: a single day has ≥ 1 qualifying, non-imported entry in
  journal, habits, gym, and nutrition simultaneously.
- Tier: Sprout → Root → Branch → Heartwood → Ring

**Six for Six** — one-time
- Criteria: a single day has ≥ 1 qualifying, non-imported entry in
  all six domains at once (journal, habits, gym, nutrition, body,
  media).
- Tier: Grove

**The Living Archive** — repeatable, once per anchored yearly window
- Criteria: within a 365-day window, ≥ 200 qualifying journal entries
  AND ≥ 100 qualifying vlogs AND ≥ 100 qualifying workouts, all
  concurrently true.
- Tier: Grove

**Wrote It Down** — repeatable, first occurrence then count
milestones (10 / 50)
- Criteria: a qualifying journal entry (≥ 40 words) logged on the
  same day a gym PR (New Number) is logged.
- Tier: Root → Branch → Heartwood
- Guardrail: both halves are independently real, qualifying events on
  their own day — this rewards the habit of reflecting on the moments
  that matter, not either event alone.

**Ghost in the Machine** — one-time
- Criteria: Like Clockwork (any habit), The Schedule Never Breaks,
  and No Deviation are all independently active at once, overlapping
  within the same 90-day period.
- Tier: Grove
- The capstone of the whole robot-consistency family — the same
  30-minute window, the same weekday pattern, the same calorie count,
  running in parallel for three straight months. Equal parts
  admirable and slightly unsettling.
- Guardrail: requires three already-guarded, independently-real
  achievements to overlap — nothing new to fake here, just three hard
  things all being true on the same 90 real days.

---

## NOTES

**On guardrails generally.** Every threshold that could be gamed by a
burst of low-effort entries is built on: (a) a minimum real-content
bar (word count, real logged sets, real food items, real duration —
never a blank/placeholder row), (b) computed sums/streaks over the
event log itself, never a counter the user or app could set directly,
(c) rolling averages or multi-checkpoint confirmation instead of
single-sample triggers wherever noise matters (weight, pace), and (d)
explicit exclusion of imported rows from every total, streak, and
threshold. Nothing here rewards opening the app or editing a setting.

**On tone.** No achievement is framed as a loss, failure, or reset
punishment. Gaps get "You Came Back" / "Back at It" / "Rebuilt" —
forward-facing, never punished-then-forgiven. "Honest Rest" and
"Still Here, Even Here" exist so the system doesn't quietly punish
normal pauses by omission.

**On the domain names.** Each category got a proper name instead of
staying a plain label, deliberately kept distinct from the Growth
Rings tier vocabulary (Sprout/Root/Branch/Heartwood/Ring/Grove) so
the two layers don't blur together in the UI:
- **The Long Conversation** (journal) — it's the same conversation
  with yourself, just spread across years.
- **The Unbroken Chain** (habits) — link by link, day by day.
- **The Iron Ledger** (gym) — every lift is a number that gets
  written down and has to be beaten later.
- **The Fuel Line** (nutrition) — the steady supply that either
  matches the goal or doesn't, week over week.
- **The Shape of Things** (body/weight) — the physical record of
  everything else in the system actually working.
- **Elsewhere** (vacations) — deliberately the odd one out, a single
  quiet word for the domain that's explicitly about stepping away.
- **Proof of Life** (media archive) — the footage and photos are
  literal, dated evidence you were here, doing this.
- **The Rings** (longevity) — the one category that's purely about
  years passing, so it gets to wear the tree metaphor most directly.
- **Full Circle** (integration) — the domains overlapping on the same
  day, the same week, the same year.

**On the peak-weight math specifically.** The FFMI-25 heuristic used
for the weight-gain ladder is a population-level rule of thumb, not a
personal prediction — it doesn't account for wrist/ankle size (the
actual frame-size inputs real natural-potential formulas like Casey
Butt's use), training history, or genetics beyond height. If more
precise inputs (wrist/ankle circumference) ever get logged as body
metrics, "The Estimated Ceiling" could be recomputed against a
proper Casey Butt-style formula instead of the height-only FFMI
shortcut — worth revisiting once that data exists rather than
treating ~100kg as gospel.

**TENSION — things this design needs that may not exist in the
schema yet:**
- An explicit "planned rest" event type distinct from silence, scoped
  per-habit (Honest Rest).
- A stored, immutable "account anchor date" the achievement engine
  can read without recomputing (Longevity tier).
- An `isImported` flag enforced at calculation time across every
  sum/streak query, not just the import pipeline.
- Duration as a queryable field per vlog media item (Behind the
  Scenes, The Archive Grows' hour-based tiers).
- A bodyweight-relative strength-standards reference table (novice/
  intermediate/advanced per lift) as calculation-time data.
- An e1RM formula (e.g. Epley) applied consistently at calculation
  time wherever a multi-rep set is compared against a 1RM-style
  threshold (absolute lift milestones, bodyweight-ratio milestones).
- Weekly rolling-average computation for weight and calorie pacing —
  an Analytics Engine dependency, not a raw counter.
- A per-day, cross-table rollup query across all six domain tables,
  efficient at years-of-daily-data scale (Full Circle Day, Six for
  Six, Life Fully Logged).
- Wrist/ankle circumference as a loggable body metric, if "The
  Estimated Ceiling" is ever upgraded from the FFMI shortcut to a
  frame-size-aware formula.
- A defined "stall" rule (rolling-average change under a fixed
  kg/week threshold, sustained N weeks) for Broke the Plateau — this
  needs to live as a named rule in the Analytics/Coach engine, not be
  reinvented ad hoc.
- Month-day matching logic (with a small tolerance window like ±1
  day) reusable across Same Question New Answer, One Year Same Day,
  and Half a Decade Same Day — worth building once as a shared
  utility rather than three separate implementations.
- Same-day cross-table lookups pairing two specific domains (PR+
  journal for Wrote It Down; photo+weight-milestone for Eyes on the
  Data; journal+vlog inside a vacation range for Somewhere Else,
  Still You) — a smaller, more targeted version of the six-domain
  rollup, but still needs the Analytics Engine to join across tables
  by dayKey.
- Phase-adjacency detection (no gap-phase of a different type between
  two phases) for The Turn — needs phase entities to be queryable in
  chronological order with type comparison, not just by ID.
- A "yearly meta-streak" concept for the new Three/Five/Ten-Year
  achievements: the engine needs to treat "did this year-level
  criterion (Full Orbit, Full Year One Habit, Life Fully Logged,
  etc.) pass or fail" as its own boolean per consecutive 365-day
  window, then streak *that* the same way day-level streaks are
  tracked today. This is a genuinely new layer on top of the existing
  day-streak logic, not a bigger version of it — worth designing as
  its own reusable primitive rather than one-off per achievement.
- Precise, real, device-set creation/completion timestamps (not just
  dayKey) for the robot-consistency family (Same Time Every Time,
  Like Clockwork, The Schedule Never Breaks, Same Hour Same Scale,
  No Deviation, Ghost in the Machine). RESOLVED (user decision): the
  family reads `occurredAt` — the time the user declares the thing
  happened — not the typing moment. A separate immutable `writtenAt`
  (device clock, set once at write, never user-editable) exists on the
  event row purely as operational truth: sync ordering, dedupe,
  import handling, audit. It is NOT trophy evidence — deciding to log
  at the exact moment it happened must never break a run, and a
  whatever-time-of-day honest log must read as its intended moment.
  Single-user trust model: the only person who could fake a declared
  time is the same person the trophy rewards; the system is a friend,
  not a court.

**On the robot-consistency family.** These five (plus the capstone)
are deliberately the strictest, least forgiving achievements in the
catalog — no honest-gap tolerance, no rolling averages, no "close
enough." That's the point: they're not meant to be commonly earned,
and they're explicitly opt-in territory for someone whose personality
runs toward routine-as-identity rather than a bar everyone's expected
to clear. Ghost in the Machine sits at Grove specifically because it
asks three of them to be true simultaneously for three months
straight — the odds of that happening by accident are effectively
zero, which is exactly the intent. Guardrail (LOCKED, audit clash):
grace NEVER applies to this family — no missed day is forgiven here;
only a user-declared planned rest FREEZES the run without breaking
it (rest = intent, grace = forgiveness; this family accepts the
first, never the second).

**On the multi-year additions.** Every Three/Five/Ten-Year
achievement in this pass is built by requiring an already-guarded,
already-real yearly achievement (Full Orbit, Full Year One Habit, A
Year on the Bar's underlying workout-count floor, Full Orbit on
Camera, Life Fully Logged) to independently pass in each consecutive
year — never by summing raw activity across the whole window. That's
what keeps a 3-year or 5-year trophy from being satisfiable by an
uneven, back-loaded push: every single year in the run has to clear
the bar entirely on its own before the next year even starts counting.
The Three/Five-Year Vow and Old Growth are deliberately the rarest
things in the whole system — they're what "The Whole Story," scaled
up from one year to a decade, actually looks like.

**On the newest additions.** The cross-domain "coincidence" trophies
(Wrote It Down, Eyes on the Data, Somewhere Else Still You, The Turn
of the Page) are intentionally rare and can't be farmed because both
halves of each pairing are already-guarded, independently-qualifying
achievements in their own domains — pairing two hard-to-fake things
doesn't make a new soft spot, it just makes an already-real moment
worth noticing twice. The anniversary-style trophies (One Trip Around
the Sun, A Year on the Bar, Same Question New Answer, One Year Same
Day) deliberately don't require an unbroken streak between the two
dates — they reward the thing still being true a year later, which is
a different and arguably more honest signal than a perfect streak.
