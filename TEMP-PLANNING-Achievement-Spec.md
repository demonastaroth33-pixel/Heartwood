# TEMP PLANNING — Achievement SPEC (sub-file of TEMP-PLANNING.md)

SUB-FILE OF THE LEDGER. Same scope as TEMP-PLANNING.md: scratchpad, NOT
applied to docs/ until user approves.

## Role of this file

The EXACT-TRIGGER layer. The design layer is PersonalOS-Achievements-v2.md
(which trophies exist, tiers, names, guardrails — canonical for WHAT).
THIS file is canonical for the COMPUTABLE trigger of each trophy: a
predicate precise enough to unit-test and to hand the engine builder.

Per-trophy record must contain, at minimum:

    NAME        (from v2, no renaming without user approval)
    TIER        (Sprout | Root | Branch | Heartwood | Ring | Grove)
    REPEATABLE  one-time | per-run | per-year | once-per-X  (+ firing rule)
    DESCRIPTION one plain sentence: what celebration is and what it's FOR
    TRIGGER     exact predicate, pseudocode-level, unit-testable
    SOURCES     the fields/events it reads (from event log / storage)
    DEPS        engine or storage dependency it pulls in (see DEPENDENCIES)

GOOD TRIGGER CHECKLIST (each must be met):
- real content bar (word floor / real sets / real items), never blank rows
- angles: sums/streaks COMPUTED over the event log, never stored counters
- rolling avg + multi-checkpoint where noise matters (weight, pace)
- imported rows EXCLUDED inside the predicate itself (isImported in the
  filter, not just the import pipeline) — the fix, not the pipe
- never fires on app-open, setting edit, or any non-effortful signal
- One Coach line at most (Ring/Grove only), rest silent (ledger lock)

GOVERNING RULES (7, carried from TEMP-PLANNING-Achievements.md):
1. NO XP VALUES. A trophy is its own reward. Numbers live ZERO here.
2. Every trophy passes the 3-question anti-cheat gate: real? on its
   actual day? real content/effort? (else = cancelled at design time).
3. Derived-only: computed from real history via H3 owner functions.
   Never announced by single events (workout.pr), never user-editable.
4. No trophies for: opening the app, browsing, empty entries,
   retroactive/bulk logging, XP-farming, anything cosmetic.
5. Imported journal rows NEVER count toward any trophy.
6. Icons: NOT designed in planning. Deferred to implementation.
7. Trophy face = modal "trophy". One claim per record unless marked
   REPEATABLE with the exact repeat cadence.

## Census (verified Aug 09 against the v2 file + ledger)

17 (journal) + 15 (habits) + 28 (gym) + 14 (fuel) + 16 (body)
+ 4 (elsewhere) + 12 (media) + 20 (rings) + 5 (full circle)
= **131 trophies**; + **47 ladder tiers** (24 lift rungs + 19
bodyweight-ladder rungs + 4 tonnage rungs of Moved a Mountain)
= **178 named entries**. Every entry's trigger is defined below;
each section ends with a running total that must sum to these figures.

## 0. SHARED ENGINE — read first (every trigger builds on it)

E0  TRIGGER EXECUTION — a trophy's predicate is evaluated only after a
    WRITE that touches its SOURCES (check-and-fire; never a timer,
    never app-open, never render). When the predicate flips false→true:
    emit ONE `achievement.unlocked` event (the single event API, written
    transactionally). While true → silent. Repeatables re-arm per their
    cadence only (per-window/per-year/per-habit/per-run).

E1  QUALIFYING(domain, event) = real content bar per domain, enforced
      INSIDE every predicate:
     journal: wordCount ≥ 40, `isImported = false`
     habits:  a real logged completion (not a tick from grace)
     gym:     a real logged set (weight-mode or rep-mode)
     food:    a log with ≥ 1 real logged item
     body:    a real measurement / physique-timeline photo
     media:   a kept vlog or photo (captured OR adopted — M6 lock)
    `isImported` lives in the filter, not the import pipe (the fix).
    CARVE-OUT (M7/C2): Novel-Length Life and Deep Dive read EVERY
    non-imported entry's words regardless of the 40-word floor — the
    only two word-trophy exceptions; everything else keeps the bar.

E2  OCCURRED-AT TRUTH — robot-consistency triggers read `occurredAt`
    (the time the user declares the thing happened), never `writtenAt`.
    `writtenAt` stays on the row for operational truth only (sync,
    dedupe, audit). Single-user trust model (writtenAt guard).

E3  ANCHORED YEARS — `yearlyWindow(i, anchor)` = the i-th
    non-overlapping 365-day window counting from the DOMAIN'S FIRST
    QUALIFYING (non-imported) anchor event; never calendar-chopped,
    never install/open date.

E4  YEARLY META-STREAK (M3) — `yearlyPass(criterion, anchor)` =
    boolean “window i passed the criterion”; `consecutiveYears(
    booleans, N)`. Imports never make a window pass; a failed window
    restarts the run at the NEXT window (no partial credit); all-zero
    history → never fires.

E5  ANNIVERSARY WINDOW (lock E) — `anniversaryWindow(anchorDate, k,
    ±toleranceDays)` → boolean: a qualifying event (for the consuming
    domain) exists on some day within {anchor + k×365 ± tol} — exactly
    specified day-distance; NOT the same as yearlyWindow.

E6  DAY PRESENCE — `dayDomainPresence(dayKey, domain)` — boolean with
    the E1 bar inside; `domainSet(domain)` for counts;
    `sixDomains(dayKey)` for the all-six check.

E7  METRICS — one shared Epley owner `est1RM(kg, reps)` (weight-mode
    sets only; rep-mode NEVER Epley; best working set, 1–12 reps, one
    set per session). `rollingAvg(field, 7d)` for bodyweight.
    Gesture later: `stallRule(phase)` — 4 consecutive weekly deltas
    outside the phase's progress direction + recovery = 2 inside the
    band — one named Coach rule, no ad-hoc copies.

E8  SLOT30 — 30-minute slot around an anchor time. Per G1: a
    robot-consistency run anchors its slot to the FIRST qualifying
    completion of the run; every later completion must fall within ±30
    minutes of that anchor slot; outside = the run breaks. No fixed
    clock-grid.

E9  CALENDAR — weekday = Mon–Sun ISO (never drift); calendar month =
    1st–month-end real length; gaps/leaps per real calendar.

E10 COUNT MILESTONES — milestone counts (Unprompted, Wrote It Down,
    Full Circle Day) count DISTINCT QUALIFYING DAYS, never raw entry
    multiplicity (pin G4).

E11 ACTIVE PHASE — a trophy that requires a phase only fires when a
    phase entity is active on the participating day/weeks (G14/G15).

E12 COACH SIDE-EFFECT — a fire may emit ONE Coach line at most and
    only for Ring/Grove; everything else stays silent (ledger lock).

E13 DERIVED-ONLY — everything below reads H3 owner outputs over
    history; no stored counters, no user-editable totals, no sums
    computed by the UI. No XP anywhere (rule 1).

## I. The Long Conversation (journal) — 17 trophies

All journal triggers read `journal_entries {occurredAt date, words,
isImported}`; “qualifying entry” is E1's journal bar. The 40-word
floor and the import exclusion are GLOBAL (E1) — not repeated in each
record below.

**I-1 Ink on the Page** — Sprout · one-time
- TRIGGER: `count(qualifyingEntries(journal)) >= 1` first becomes
  true (the first real ≥40-word, non-imported entry).
- SOURCES: journal_entries. DEPS: E1.

**I-2 A Week of Honesty** — Root · one-time
- TRIGGER: 7 consecutive dayKeys each with ≥1 qualifying entry
  (day-streak over qualifying days). Fire once.
- SOURCES: journal_entries by dayKey. DEPS: E6, day-streak owner.

**I-3 A Season Kept** — Branch · repeatable (once per streak-run)
- TRIGGER: a qualifying-day streak reaches 90; fires once per run,
  re-arms when the current run breaks and a new run starts.
- DEPS: day-streak owner.

**I-4 Same Time, Every Time** — Heartwood · repeatable (per run)
- TRIGGER: 60 consecutive calendar days each with a qualifying entry
  whose `occurredAt` is within ±30 min of the current run's FIRST
  qualifying entry time-of-day (E8, G1). Any day outside → run breaks;
  fire on the 60th qualifying day.
- SOURCES: occurredAt of qualifying entries. DEPS: E8, day-streak.

**I-5 Full Orbit** — Ring · repeatable per qualifying year
- TRIGGER: `yearlyPass(journal: ≥300 distinct qualifying days in the
  window, anchor = first qualifying journal entry ever)`. Fires once
  when a window passes (check-and-fire, same as every yearly family).
- DEPS: E3/E3a yearlyPass, journal anchor.

**I-6 Half Century** — Root · one-time
- TRIGGER: 50th lifetime qualifying (non-imported) journal entry.

**I-7 Five Hundred Pages** — Branch · one-time — 500th such entry.

**I-8 A Thousand Entries** — Heartwood · one-time — 1,000th.

**I-9 Novel-Length Life** — Branch→…→Grove · repeatable once per
  threshold (25k / 100k / 500k / 1M words)
- TRIGGER: cumulative word count over ALL non-imported entries (every
  entry's words, no 40-word floor — carve-out C7) crosses the
  threshold. Fire once per threshold.
- DEPS: word-trophy exemption registry.

**I-10 Deep Dive** — Branch · repeatable once per threshold (500 / 1,500 / 4,000 words in ONE entry)
- TRIGGER: a single non-imported entry's words ≥ threshold. Fire once
  per threshold (each threshold fires at most once ever? — no: once
  per threshold crossing; the same entry can't double-fire).
  DEPS: carve-out registry.

**I-11 You Came Back** — Root · repeatable
- TRIGGER: a qualifying entry exists whose dayKey − previous
  qualifying entry's dayKey ≥ 21 days; fires on the return entry.
  Celebratory only; there is deliberately no mirror (gap) trophy.
- DEPS: entry-date difference.

**I-12 Same Question, New Answer** — Branch→Heartwood→Grove ·
  repeatable at 2 / 3 / 5 years (G2: fires ONCE at 2, ONCE at 3,
  ONCE at 5 — never at 6+)
- TRIGGER: `sameMonthDay(a, b, tol=1d)` — a qualifying entry and one
  from N years earlier, each independently qualifying, latests
  occurrence; leap-day handled inside the month-day matcher (locking
  letter: Feb 29 recognized as Feb 28 in non-leap years). Fire when
  the N-th year's entry lands.
- DEPS: month-day matcher (shared utility, built once).

**I-13 Unprompted** — Root→Branch→Heartwood · repeatable first
  occurrence then count milestones (10 / 50 / 200)
- TRIGGER (M7 pin): a qualifying journal entry on a day that has ZERO
  qualifying events in {habits, gym, nutrition, media} — body
  weigh-ins/photos deliberately EXCLUDED (do not break it). Count =
  DISTINCT qualifying solitary days (E10); the first occurrence is
  also the first of the 10-count.
- DEPS: E6-domain presence over the four effort domains + journal.

**I-14 The Turn of the Page** — Branch · repeatable, once per phase
  transition
- TRIGGER: a qualifying journal entry with |occurredAt − phase.startDate|
  ≤ 3 days, where a bulk/cut/maintenance phase starts (phase creation).
  Fire once per phase entity.

**I-15 Bookended** — Heartwood · repeatable once per CALENDAR year
  (the one calendar exception, by M4 lock)
- TRIGGER: qualifying entries on Jan 1 AND Dec 31 of the SAME
  calendar year, AND distinct qualifying days in that year ≥
  floor(0.40 × daysInYear): 146 (365-day) and 146 (366-day — 0.40×366
  = 146.4, floor ⇒ 146, per G12). Fire when the Dec-31 entry lands
  (once per year).
- DEPS: calendar-year day sets, G12 floor.

**I-16 Three Years, Still Talking** — Grove · one-time
- TRIGGER: `consecutiveYears(Full Orbit passed, 3)` — 3 consecutive
  yearlyWindows each independently clearing the ≥300-days-in-window
  criterion.
- DEPS: E3b.

**I-17 Half a Decade of Honesty** — Grove · one-time
- TRIGGER: same, `consecutiveYears(…, 5)`.

§I total: 17 ✓ (matches census)

---

## II. The Unbroken Chain (habits & consistency) — 15 trophies

Sources: `habit_completions {habitId, occurredAt, isImported}` +
`habits {createdAt}`. “active day” for streaks = a QUALIFYING
completion on that dayKey; grace-carried days are NOT active (G19
pin: a grace-rescued day never counts toward ANY streak in this
family — streaks are strict consecutive real completions).

**II-1 Day One** — Sprout · one-time
- TRIGGER: first-ever qualifying habit-completion event (any habit).
- SOURCES: habit_completions. DEPS: E1 habit bar.

**II-2 One Week In** — Root · repeatable, once per habit
- TRIGGER: some habit h reaches an active-day streak of exactly 7 for
  the first time ever (this habit). Fire at the 7th day.
- DEPS: per-habit day-streak owner.

**II-3 A Hundred Days** — Heartwood · repeatable, once per habit
- TRIGGER: h reaches 100 for the first time.

**II-4 The Long Haul** — Grove · repeatable, once per habit —
  PER-B1-WINDOW re-fire (the audit B1 note): a 500-day streak fires;
  every time a NEW 500-day streak is crossed (rebuilt after a break,
  or the same habit crossing again in any later run) — re-arms per
  distinct 500-day run.

**II-5 Full Year, One Habit** — Ring · repeatable per qualifying
  window (B1 per-window fire = the trophy fire itself)
- TRIGGER: `yearlyPass(habit h criterion: ≥300 qualifying completion
  days inside a 365-day window, anchor = h's FIRST qualifying
  completion ever — per-habit anchor, pin G8)`. Fires once per
  passing window; one close = one fire.
- DEPS: yearlyPass + per-habit anchor.

**II-6 Perfect Month** — Branch · repeatable
- TRIGGER: a single habit is completed on EVERY calendar day of a full
  calendar month (28–31 days, that month's real length). Fire at the
  month's close (once per habit per qualifying month).
- DEPS: E9 calendar month.

**II-7 Five Strong** — Branch · one-time
- TRIGGER: on one dayKey, ≥ 5 distinct habits each with an ACTIVE
  streak ≥ 7 days (strict consecutive; grace NEVER credits — G19).
  Fire once when first true.
- DEPS: active-day streaks.

**II-8 Juggling Act** — Branch · repeatable, once per closed
  qualifying 21-day window (G5)
- TRIGGER: within any closed 21-day window: ≥ 14 distinct days each
  with ≥ 3 distinct habits completed that day. Windows = the 21-day
  spans ending on each day; a window that qualifies fires ONCE when
  it closes; overlapping qualifying windows never re-fire the same
  event (pin G5: “fires once per closed qualifying 21-day window”).
- DEPS: closed-window scan.

**II-9 Like Clockwork** — Heartwood · repeatable, once per habit run
- TRIGGER: a single habit's 90 consecutive completions whose
  `occurredAt` each fall inside the current run's 30-min slot
  anchored at the run's FIRST qualifying completion (E8 + G1).
  Outside → run breaks; fire at the 90th.
- DEPS: occurredAt slots, run-anchored slot30.

**II-10 Honest Rest** — Root · repeatable
- TRIGGER: an explicit “planned rest” event for habit h, with an
  active streak ≥ 14 days on BOTH sides (the day before the rest was
  an active day, and the day after it is active). Silence alone never
  earns this. Fires once per qualifying rest event.
- DEPS: planned-rest event type.

**II-11 Rebuilt** — Branch · repeatable
- TRIGGER: a habit that broke a ≥30-day streak (a gap ≥30 days from
  its last completion) then rebuilds a fresh ≥30-day active streak.
  Fire at the 30th day of the rebuilt run. No trophy for the break
  itself; 30/30 floors make it non-farmable.

**II-12 One Trip Around the Sun** — Ring · repeatable, once per habit
  per anniversary
- TRIGGER: `anniversaryWindow(anchorDate = this habit's FIRST
  qualifying completion, k = 1, ±7 days)` → the habit still has a
  real completion inside the anniversary band (not an unbroken
  streak — just still practiced ~a year later). Fires once per
  passing anniversary; re-arms the following year.
- DEPS: E5.

**II-13 Renaissance Life** — Heartwood · one-time
- TRIGGER: ≥ 5 distinct habits have each EVER reached a 100-day
  streak (abandoned streaks count — lifetime per-habit). Fire when
  the 5th distinct habit's 100-day mark lands.
- DEPS: per-habit “ever reached 100” flag (derived).

**II-14 Three Years, No Missing Links** — Grove · one-time per habit
- TRIGGER: `consecutiveYears(Full Year One Habit passed, 3)` —
  habit's yearly criterion in 3 consecutive windows. Fire per habit
  that achieves it (once per habit).
- DEPS: yearlyPass + consecutiveYears.

**II-15 Five Years, No Missing Links** — Grove · one-time per habit
- TRIGGER: the same, `consecutiveYears(…, 5)`.

§II total: 15 ✓

---

## III. The Iron Ledger (gym & strength) — 28 trophies + 47 ladder tiers

The 47 ladder tiers (24 absolute-lift rungs + 19 bodyweight-ladder
rungs + 4 tonnage rungs) live entirely in THIS section; the 28
trophy entities are the named records below. Gym sources:
`workouts {occurredAt}`, `exercise_sets {exerciseId, mode, weightKg,
reps, addedLoadKg, isImported, sessionId}`, plus the strength-owner
functions in E7.

### III.A First steps — 2 trophies

**III-1 First Rep Logged** — Sprout · one-time
- TRIGGER: first qualifying workout (≥1 real logged set, non-imported,
  any exercise).

**III-2 The Basics** — Root · one-time
- TRIGGER: a qualifying set exists for EACH of squat, bench press,
  deadlift, overhead press — fires when the LAST of the four first-
  occurrences lands (composite, tracked as one trophy).

### III.B PR ladder — 9 trophies

PR definition (shared owner, per v2 guardrail): a set is a PR when
its `est1RM(weightKg, reps)` (weight-mode only) exceeds the prior
best est1RM for the EXACT same exercise among PRIOR NON-IMPORTED sets
on earlier days. Rep-mode/bodyweight sets never PR via Epley.

**III-3 New Number** — Root · repeatable (one fire per PR event)
- TRIGGER: a set's est1RM > the prior best for that exercise (prior
  non-imported sets only). Fires at the moment the new best logs in;
  re-arms immediately for the next higher best.

**III-4 Ten Times Better** — Root · one-time — 10th lifetime PR event.

**III-5 Quarter Century of PRs** — Branch · one-time — 25th PR event.

**III-6 Fifty Beaten** — Heartwood · one-time — 50th PR event.

**III-7 Century of PRs** — Grove · one-time — 100th PR event.

**III-8 Same Lift, Ten Times Better** — Branch · one-time per exercise
- TRIGGER: 10th lifetime PR on one SPECIFIC exercise. Each exercise
  can fire it once.

**III-9 PR Season** — Branch · repeatable
- TRIGGER: ≥ 3 distinct exercises with at least one PR within the SAME
  calendar month (E9). Fire once per qualifying calendar month.

**III-10 Trifecta Week** — Heartwood · repeatable per G6
- TRIGGER: PRs on squat, bench press, and deadlift (all three) within
  the same 7-day window; fires once per CLOSED qualifying window;
  overlapping scans never re-fire (pin G6).

**III-11 A PR Every Season** — Grove · one-time
- TRIGGER: ≥ 12 distinct calendar months each containing ≥1 PR (any
  exercise; not necessarily consecutive). Fire when the 12th distinct
  month lands.

### III.C Absolute weight ladders — 24 rungs, actual-lift-only (LOCK)

Template (applies to every rung below):
- EVALUATE after each set write. Fire the rung whose exercise matches
  AND `weightKg ≥ threshold AND reps ≥ 1` on a REAL logged set
  (weight-mode). NO est1RM substitution, NO estimated inflation
  (MMA lock: “if the log says 100kg on the bar, the 100kg trophy
  fires; nothing else does”). Warm-up failure / human error cases are
  outside the predicate's concern — the log IS the evidence.
- All 24 are one-time; a rung fires the first day its condition holds.

| Rung | exercise | threshold | name | tier |
|---|---|---|---|---|
| R1 | bench | 60kg | First Press | Root |
| R2 | bench | 80kg | Two Plates Deep | Root |
| R3 | bench | 100kg | Century Bench | Branch |
| R4 | bench | 120kg | Heavy Iron | Heartwood |
| R5 | bench | 140kg | The Furnace | Grove |
| R6 | squat | 80kg | First Descent | Root |
| R7 | squat | 100kg | Century Squat | Root |
| R8 | squat | 140kg | The Foundation | Branch |
| R9 | squat | 180kg | Bedrock | Heartwood |
| R10 | squat | 220kg | The Monolith | Grove |
| R11 | deadlift | 100kg | Ground Zero | Root |
| R12 | deadlift | 140kg | The Pull | Root |
| R13 | deadlift | 180kg | Iron Harvest | Branch |
| R14 | deadlift | 220kg | The Reckoning | Heartwood |
| R15 | deadlift | 260kg | Dragon Slayer | Grove |
| R16 | OHP | 40kg | First Overhead | Root |
| R17 | OHP | 60kg | Skyward | Branch |
| R18 | OHP | 80kg | The Crown | Heartwood |
| R19 | OHP | 100kg | Atlas Press | Grove |
| R20 | curl | 20kg | First Curl | Root |
| R21 | curl | 30kg | Gun Show | Root |
| R22 | curl | 40kg | Peak Contraction | Branch |
| R23 | curl | 50kg | Iron Grip | Heartwood |
| R24 | curl | 60kg | Cast Iron Arms | Grove |

### III.D Bodyweight-relative ladders — 6 trophies + standards (1)

Metric (lock C2): `est1RM ÷ rollingAvg(bodyweight, 7 days AS OF the
lift day)` — never a single raw weigh-in; same Epley owner as PRs.

**III-12 Bodyweight Bench** — Branch · one-time
- TRIGGER: a bench set with est1RM ÷ rollingBW ≥ 1.0.
**III-13 One and a Half** — Branch · one-time — squat set, ratio ≥ 1.5.
**III-14 Double Bodyweight Pull** — Heartwood · one-time — deadlift,
  ratio ≥ 2.0.
**III-15 Press Three-Quarters** — Branch · one-time — OHP, ratio ≥ 0.75.
**III-16 Triple Bodyweight Club** — Heartwood · one-time — on a single
  day, the sum of that day's best est1RMs for squat + bench + deadlift
  ÷ rollingBW ≥ 3.0.
**III-17 Four Times Over** — Grove · one-time — same total ÷ rollingBW
  ≥ 4.0.

**III-18 Strength Standard Reached** — Branch/Heartwood/Grove ·
  repeatable once per exercise per tier
- TRIGGER: est1RM ÷ rollingBW crosses a published standard rank for
  that exercise. Frozen seed (men; women ~60–70% upper / ~75–85%
  lower, same shape): bench 0.50/0.75/1.20/1.60/2.00, squat
  0.75/1.00/1.65/2.20/2.75, deadlift 1.00/1.25/2.00/2.50/3.00, OHP
  0.35/0.50/0.65/0.90/1.20 — ordered Beginner, Novice, Intermediate,
  Advanced, Elite. THRESHOLD-TO-RANK MAP (lock): the trophy fires
  ONLY at ranks Novice (Branch), Intermediate (Heartwood), Advanced
  (Grove). Rank 1 (Beginner) and rank 5 (Elite) NEVER fire — display
  grades only.
- Every (exercise, tier) pairing fires once; one pass covers all pairings.

### III.E Bodyweight ladders — 19 rungs (rep + weighted)

Template for REP ladders (push-ups / pull-ups / dips): a rung fires
when ONE single unbroken continuous set (never summed across a
session) reaches ≥ threshold reps on its real day.

| Rung | exercise | threshold | name | tier |
|---|---|---|---|---|
| R25 | push | 20 | Warm Floor | Root |
| R26 | push | 50 | Fifty Push-Ups | Root |
| R27 | push | 100 | Century Push | Branch |
| R28 | push | 150 | Gazelle Pace | Heartwood |
| R29 | push | 200 | Dempsey Roll | Grove |
| R30 | pull | 5 | First Chin | Root |
| R31 | pull | 10 | Ten Clean | Root |
| R32 | pull | 20 | Twenty Strict | Heartwood |
| R33 | pull | 30 | Thirty and Counting | Heartwood |
| R34 | pull | 50 | The Long Ascent | Grove |
| R35 | dips | 20 | First Dip | Root |
| R36 | dips | 40 | Forty Deep | Root |
| R37 | dips | 60 | Sixty Strong | Branch |
| R38 | dips | 80 | Eighty and Steady | Heartwood |
| R39 | dips | 100 | Century Dip | Grove |
| R40 | pull-ups | >0kg | Loaded Up | Branch |
| R41 | pull-ups | 20kg | Added Iron | Heartwood |
| R42 | pull-ups | 40kg | Beyond Bodyweight | Grove |
| R43 | dips | >0kg | Loaded Dip | Branch |

Template for WEIGHTED rungs (R40–R43): a real logged `addedLoadKg >
0` on a real completed set of that exercise — an empty/zero-weight
log never counts as loaded (v2 guardrail). No Epley, real added load.

### III.G Volume & consistency — 10 trophies (III-19 .. III-28)

**III-19 Moved a Mountain** — Root→Branch→Heartwood→Grove ·
  repeatable once per rung; the 4 rungs are ladder tiers R44–R47
- TONNAGE (lock): Σ over real weight-mode sets ONLY of
  `weightKg × reps`. Rep-mode/bodyweight sets contribute ZERO;
  addedLoadKg NEVER multiplies (a vest is not the load); no fake kg.
- TRIGGER: cumulative lifetime tonnage ≥ threshold:
  R44 100,000kg — The Quarry Opens — Root
  R45 500,000kg — The Rockslide — Branch
  R46 1,000,000kg — The Mountain Moves — Heartwood
  R47 5,000,000kg — The Brand — Grove

**III-20 Heaviest Session** — Root · repeatable
- TRIGGER: a single day's total tonnage (same weight-mode definition)
  exceeds every prior day's total (the daily record). Fires each time
  a new record day lands.

**III-21 Trimester of Iron** — Branch · repeatable
- TRIGGER: 12 consecutive weeks each containing ≥ the configured
  weekly-workout target workouts. A week is a calendar week (E9).
  EMPTY WEEKS (lock): a week with zero scheduled sessions is a FLAWED
  week — it breaks the run, never vacuously true.
- DEPS: weekly workout count owner, empty-week lock.

**III-22 The Schedule Never Breaks** — Heartwood · repeatable
- TRIGGER: workouts logged on the EXACT same weekday-set for 26
  consecutive weeks (a weekday-set = which weekdays have ≥1 workout
  that week; the SET must match the first week's pattern). Zero
  off-pattern weeks. A planned-rest event on a scheduled weekday
  FREEZES the slot (counts as the slot, not a break); a REAL missed
  day (no workout AND no rest) = off-pattern week. EMPTY weeks (zero
  scheduled sessions) = off-pattern (lock) — never vacuously true.
- DEPS: weekday-set equality + freeze rule.

**III-23 Full Cycle** — Heartwood · repeatable once per closed phase
- TRIGGER: a phase entity closes with ≥ 80% of its weeks each
  containing ≥1 QUALIFYING workout; partial weeks at the phase's
  START/END count as weeks when they contain ≥1 qualifying workout
  (pin G17). Evaluated when the phase closes; fires once per phase.

**III-24 Back at It** — Branch · repeatable
- TRIGGER: a workout logged after a GAP ≥14 consecutive days with
  zero workouts, and a PR (ANY exercise) is matched or exceeded within
  the following 60 days (pin G7b — the prior PR may be ANY exercise's,
  not necessarily the same lift). Fire once per gap+return cycle.
- DEPS: gap detector + PR owner history.

**III-25 Thousand Sessions** — Grove · one-time
- TRIGGER: 1,000th lifetime QUALIFYING workout event (non-imported).

**III-26 A Year on the Bar** — Ring · repeatable per anniversary
- TRIGGER: `anniversaryWindow(anchor = FIRST-EVER qualifying workout,
  k = 1, ±7 days)` → a real workout inside the band. Fires once per
  passing anniversary.
- DEPS: E5.

**III-27 Three Years in Iron** — Grove · one-time
- TRIGGER: 3 consecutive yearly windows (anchored at the first-ever
  qualifying workout) each containing ≥ 80 qualifying workouts
  (≈1.5/week sustained floor; keeps an anniversary-touch from
  qualifying).
- DEPS: yearlyPass (workout-count criterion per window).

**III-28 Five Years in Iron** — Grove · one-time — the same over 5
  consecutive anchored windows.

§III total: 28 trophies + 47 ladder tiers ✓ (matches census: 24 abs
+19 bwl +4 tonnage = 47)

---

---

## IV. The Fuel Line (nutrition) — 14 trophies

Sources: `food_logs {items, occurredAt, isImported}` — daily totals
are SUMS OF REAL LOGGED ITEMS, never a typed daily number (v2
guardrail, repeated on every trigger that reads calories); phase
entities for target bands.

**IV-1 First Plate Logged** — Sprout · one-time
- TRIGGER: first qualifying food-log event (≥1 real logged item).

**IV-2 A Month of Logging** — Root · repeatable, once per streak-run
- TRIGGER: 30 consecutive dayKeys each with ≥1 qualifying food log.
  Fires on the 30th day of each run.

**IV-3 On Target** — Root · repeatable, once per qualifying week
- TRIGGER: at the close of a rolling 7-day window: ≥5 LOGGED days in
  the window AND the mean of those days' real totals is inside the
  ACTIVE phase's calorie target band. G14/G15 pin: requires an active
  phase at the window close — no active phase → no fire, ever. Fires
  once per qualifying window (each window closes once).
- DEPS: weekly mean owner, active-phase lookup, E1.

**IV-4 Dialed In** — Branch · repeatable, once per qualifying window
- TRIGGER: within a rolling 30-day window, ≥20 distinct days each
  hitting that day's protein target (per active-phase protein band).
  Fires once per qualifying rolling window.
- DEPS: per-day protein-hit flag (derived).

**IV-5 No Deviation** — Heartwood · repeatable, once per qualifying
  30-day run
- TRIGGER: two properties must hold for 30 CONSECUTIVE logged days
  (robot-consistency family — grace never applies):
  (1) each day has ≥1 qualifying food log, AND
  (2) each day's total-of-real-items is within ±3% of the SAME
      target number (the phase's daily calorie target, fixed for the
      whole run — never computed day-to-day).
  Fires when a 30-day run completes. A single typed "daily total"
  line can never satisfy (real item sums only).
- DEPS: ±3% band owner over real item sums.

**IV-6 Half a Year of Fuel** — Branch · one-time
- TRIGGER: 180th cumulative qualifying food-log day (cumulative, not
  consecutive). Fire once.

**IV-7 The Long Table** — Heartwood · one-time
- TRIGGER: 1,000th cumulative qualifying food-log day.

**IV-8 Paced Bulk** — Heartwood · repeatable, once per closed phase
**IV-9 Paced Cut** — Heartwood · repeatable, once per closed phase
- TRIGGER (both, identical shape): at phase close, the weekly
  rolling-average weight change stayed inside the phase's pace band
  for ≥ 80% of the phase's NON-THIN weeks. THIN-WEEK pin (G16): a
  week with <5 valid logged weigh-in days counts NEITHER for NOR
  against the ratio — the 80% is computed over non-thin weeks only.
- DEPS: rollingAvg weight owner, thin-week rule, P1/Pace band owner.

**IV-10 Broke the Plateau** — Heartwood · repeatable, once per
  stall→recovery cycle
- TRIGGER (stallRule — the ONE named rule, shared with Coach): 4
  consecutive weekly deltas of the rolling-average weight OUTSIDE the
  phase's progress direction (bulk: < +0.1kg/week; cut: > −0.1kg/
  week) — that's the stalled run; THEN 2 consecutive weekly deltas
  back INSIDE the pace band — the confirmed recovery. Fires ONCE when
  the recovery confirms; never twice for the same stall.
- DEPS: stallRule owner, rollingAvg owner.

**IV-11 Both Directions** — Grove · one-time
- TRIGGER: at least one closed BULK phase AND at least one closed CUT
  phase each independently satisfying Full Cycle (≥80% of weeks with
  qualifying workouts). Fires when the second such closed phase
  exists. No partial credit for one direction alone.

**IV-12 The Turn** — Branch · one-time
- TRIGGER: the FIRST phase entity of type "cut" is created whose
  start date immediately follows a CLOSED "bulk" phase (no intervening
  phase of another type; adjacency, not overlap). Fire once.

**IV-13 Three Years on the Line** — Grove · one-time
**IV-14 Five Years on the Line** — Grove · one-time
- TRIGGER: yearlyPass(food criterion: ≥250 DISTINCT qualifying
  food-log days per window, anchor = first qualifying food-log day)
  — 3 / 5 consecutive windows must pass. Fire once at chain
  completion.
- DEPS: yearlyPass + consecutiveYears.

§IV total: 14 ✓ (Paced Bulk + Paced Cut = two records)

---

## V. The Shape of Things (body & weight) — 16 trophies

Sources: `body_metrics {type, value, occurredAt, isImported}`, phase
entities. All rolling-average reads = 7-day rolling mean (O3 owner);
all confirmations = 2 consecutive weekly checkpoints on that rolling
mean (never a single reading).

**V-1 First Measurement** — Sprout · one-time
- TRIGGER: first qualifying body-metric entry.

**V-2 Steady Hand** — Root · repeatable
- TRIGGER: a weigh-in on the SAME WEEKDAY for 12 consecutive weeks,
  no missed week. Weekday anchored to the FIRST qualifying weigh-in
  of the run (pin G18); every later weigh-in on that exact weekday.
  Run breaks on a miss; re-anchors at its own first weigh-in.
- DEPS: weekday anchor, G18.

**V-3 Same Hour, Same Scale** — Heartwood · repeatable
- TRIGGER: 26 consecutive weeks with a weigh-in on the same weekday
  AND within ±30 minutes of the run's anchor clock slot — BOTH
  anchored to the run's first qualifying weigh-in (pins G18 + G1).
  Any outside → run breaks. Uses the declared occurredAt time (E8).
- DEPS: slot30 anchor, weekday anchor.

**V-4 Real Progress** — Branch · repeatable, once per milestone
- TRIGGER: the 7-day rolling average crosses a cumulative net-change
  milestone from the ACTIVE phase's starting rolling average,
  CONFIRMED at ≥2 consecutive weekly checkpoints. G14 pin: only
  within an active phase — no active phase → no fire.
- DEPS: rollingAvg owner, phase start anchor, checkpoint confirmation.

**V-5 Then and Now** — Branch → Heartwood → Grove · repeatable, once
  per milestone
- TRIGGER: two physique-timeline photos with a REAL capture gap:
  ≥6 months (Branch) / ≥1 year (Heartwood) / ≥3 years (Grove —
  pin G3: the third threshold is 3 years).
- DEPS: month-day/physics gap computation.

**V-6 Eyes on the Data** — Branch · repeatable, once per milestone
- TRIGGER: a physique-timeline photo logged inside ANY 7-day band
  CONTAINING the day a weight-gain milestone (V-10..V-16) is first
  confirmed (containment, not centering — pin G13). Both halves must
  independently be qualifying events on their own days.
- DEPS: V-ladder confirmation days, photo dayKey.

**V-7 Frame by Frame** — Heartwood · one-time
- TRIGGER: a physique-timeline photo in ≥6 CONSECUTIVE real calendar
  months (pin G11: calendar months, 1st–month-end; a photo on the
  30th can't fill the next month).

**V-8 Three Years in Frame** — Grove · one-time
**V-9 Five Years in Frame** — Grove · one-time
- TRIGGER: yearlyPass(body criterion: ≥40 DISTINCT calendar weeks per
  window each with ≥1 qualifying weigh-in; anchor = first qualifying
  weigh-in ever) — 3 / 5 consecutive windows. Fire once at
  completion.

**V-10 Six Kilos In** — Root · one-time — rolling avg ≥ 70kg.
**V-11 Seventy-Five** — Root · one-time — ≥ 75kg.
**V-12 Eighty** — Branch · one-time — ≥ 80kg.
**V-13 Eighty-Five** — Branch · one-time — ≥ 85kg.
**V-14 Ninety** — Heartwood · one-time — ≥ 90kg.
**V-15 Ninety-Five** — Heartwood · one-time — ≥ 95kg.
**V-16 The Estimated Ceiling** — Grove · one-time — ≥ 100kg.
- TRIGGER (all seven): 7-day rolling average ≥ threshold, CONFIRMED
  at ≥2 consecutive weekly checkpoints (rolling average only — a
  single heavy weigh-in can never trigger, v2 guardrail).

§V total: 16 ✓

---

## VI. Elsewhere (vacations) — 4 trophies

Sources: `periods {type = vacation, startDate, endDate}`.

**VI-1 Off the Grid** — Sprout · one-time
- TRIGGER: first logged vacation period with duration ≥7 days.

**VI-2 Took the Time** — Root · repeatable, once per anchored yearly
  window
- TRIGGER: cumulative vacation days inside a 365-day window (anchor =
  first-ever vacation day) cross the configured healthy-balance
  threshold (default 14 days/year, user-editable). Day counting =
  DAY-LEVEL UNION (E-clash #5 lock): a calendar day inside ≥1
  overlapping vacation range counts AT MOST ONCE; overlapping ranges
  never inflate.
- DEPS: dayUnion owner over vacation ranges.

**VI-3 Still Here, Even Here** — Root · repeatable
- TRIGGER: a qualifying journal entry logged on a day inside an
  active vacation range. Fires once per qualifying vacation period
  (min 1 per period). Purely optional — no pressure framing.

**VI-4 Somewhere Else, Still You** — Branch · repeatable
- TRIGGER: within ONE active vacation period, at least one qualifying
  journal entry AND at least one qualifying vlog, both on days inside
  the range. Fires once per period.

§VI total: 4 ✓

---

## VII. Proof of Life (media archive) — 12 trophies

Sources: `media_attachments {type, durationSec, capturedAt,
isImported, adopted}` (vlog = kept media item). “Qualifying vlog” =
a kept vlog (captured through the pipeline OR adopted — M6 lock; an
adopted FIRST vlog fires Rolling Tape). Duration = stored field,
measured ONCE at intake (M2 lock).

**VII-1 Rolling Tape** — Sprout · one-time
- TRIGGER: first KEPT vlog — captured OR adopted (M6).

**VII-2 Behind the Scenes** — Root · one-time
- TRIGGER: first qualifying vlog with duration ≥10 minutes.

**VII-3 A Week on Camera** — Root · repeatable, once per streak-run
- TRIGGER: 7 consecutive dayKeys each with ≥1 qualifying vlog.

**VII-4 A Hundred Days on Camera** — Heartwood · repeatable, once per
  streak-run
- TRIGGER: 100 consecutive dayKeys each with ≥1 qualifying vlog.

**VII-5 Full Orbit, on Camera** — Ring · repeatable, once per
  anchored yearly window
- TRIGGER: yearlyPass(media criterion: ≥300 DISTINCT days per 365-day
  window with ≥1 qualifying vlog; anchor = first qualifying vlog
  ever). Fires when a window passes.

**VII-6 The Full Reel** — Grove · one-time
- TRIGGER: 1,000th lifetime qualifying vlog (non-imported).

**VII-7 The Archive Grows** — Root → Branch → Heartwood → Ring →
  Grove · repeatable, once per threshold
- TRIGGER: cumulative duration (sum of durationSec across all
  non-imported qualifying vlogs) ≥ 10h / 50h / 100h / 500h / 1,000h.
  Fire once per threshold crossed.

**VII-8 One Year, Same Day** — Heartwood · repeatable
- TRIGGER: a qualifying vlog whose month-day matches another
  qualifying vlog's month-day from exactly one year prior (month-day
  matcher tolerance ±1 day, leap-day handled inside). Both vlogs real
  and independently qualifying on their capture dates.

**VII-9 Half a Decade, Same Day** — Grove · one-time
- TRIGGER: the same month-day match but against a qualifying vlog
  from exactly 5 years prior.

**VII-10 The Long Take** — Branch · one-time
- TRIGGER: first qualifying vlog with duration ≥60 minutes.

**VII-11 Three Years of Proof** — Grove · one-time
**VII-12 Five Years of Proof** — Grove · one-time
- TRIGGER: yearlyPass(media criterion = Full Orbit on Camera bar:
  ≥300 qualifying days per window) — 3 / 5 consecutive windows.
  Fire once at chain completion.

§VII total: 12 ✓

---

## VIII. The Rings (longevity) — 20 trophies

Engine: the account's REAL anchor date = occurredAt of the FIRST-EVER
non-imported event across all domains (never install/open; a
reinstall can't fabricate an earlier anchor).

**VIII-1 One Year In** — Ring · one-time
- TRIGGER: ≥365 days since the real anchor, AND qualifying activity
  (any domain) in ≥3 distinct domains within ≥9 of the 12 calendar
  months after the anchor.
- DEPS: month/domain presence rollup.

**VIII-2 Two Years** — Ring · one-time
**VIII-3 Five Years** — Grove · one-time
**VIII-4 Ten Years** — Grove · one-time
- TRIGGER: N years since the real anchor, AND qualifying activity in
  ≥75% of the months since (2yr = 18/24 mo, 5yr = 45/60, 10yr =
  90/120 — floor of 0.75 × months, real month count).

**VIII-5 Life, Fully Logged** — Heartwood · repeatable, once per
  anchored yearly window
- TRIGGER: within one 365-day window (anchor = real anchor date):
  all SIX domains each have ≥1 qualifying non-imported entry.
  Fires when a window passes (yearlyPass criterion = six-domain bar).
- DEPS: dayDomainPresence, yearlyPass. Rings count = the number of
  windows that ever passed (see series below) — a missed year never
  removes an existing ring.

**VIII-6 A Week, Whole** — Branch · repeatable
- TRIGGER: within ONE ISO calendar week (Mon–Sun, pin G10 — never
  drifts with settings), all six domains each have ≥1 qualifying
  non-imported entry. Fire once per qualifying ISO week.

**VIII-7 The Three-Year Vow** — Grove · one-time
- TRIGGER: six-domain bar (Life, Fully Logged criterion) passes in 3
  consecutive anchored yearly windows.

**VIII-8 The Five-Year Vow** — Grove · one-time — 5 consecutive.

**VIII-9 Old Growth** — Grove · one-time
- TRIGGER: six-domain bar passes in 10 CONSECUTIVE anchored yearly
  windows, ANYWHERE in history (once-existed run of 10; not
  necessarily current).

**VIII-10 Ouroboros** — Grove · one-time
- TRIGGER: the same 10-consecutive rule but judged as a STREAK, not
  once-history: a failed window anywhere RESTARTS the count at zero;
  any 10 consecutive qualifying windows closes the attempt. Once
  earned, never taken back; a gap before reaching 10 only resets the
  attempt. Deliberate twin of Old Growth with restart semantics.

**VIII-11 Pith** — one-time, Sprout — rings ≥ 1 ever.
**VIII-12 Medullary Ray** — Root — rings ≥ 2.
**VIII-13 Oak** — Branch — rings ≥ 3.
**VIII-14 Sapwood** — Branch — rings ≥ 4.
**VIII-15 Ironwood** — Heartwood — rings ≥ 5.
**VIII-16 Cambium** — Heartwood — rings ≥ 6.
**VIII-17 Latewood** — Ring — rings ≥ 7.
**VIII-18 Phloem** — Ring — rings ≥ 8.
**VIII-19 Cork** — Ring — rings ≥ 9.
**VIII-20 Yew** — Grove — rings ≥ 10.
- Ring = one Life, Fully Logged qualifying yearly window, ever, for
  life. The ring series is a pure lifetime total: 1 ring ever → Pith,
  2 → Medullary Ray, … 10 → Yew. Gaps never erase rings.

§VIII total: 20 ✓ (4 longevities + 5 vow/ceiling + 1 week + Life +
Ouroboros + 10 series = 20)

---

## IX. Full Circle (cross-domain) — 5 trophies

**IX-1 Full Circle Day** — Sprout → Root → Branch → Heartwood → Ring ·
  repeatable: first occurrence (Sprout), then count milestones
  10 / 50 / 100 / 365
- TRIGGER: a single dayKey with ≥1 qualifying, non-imported entry in
  journal, habits, gym, AND nutrition simultaneously. Count =
  DISTINCT qualifying days (pin G4). Fires at the first day and at
  each count milestone.
- DEPS: four-domain same-day rollup.

**IX-2 Six for Six** — Grove · one-time
- TRIGGER: a single dayKey with ≥1 qualifying non-imported entry in
  ALL SIX domains at once (journal, habits, gym, nutrition, body,
  media). Fire once.
- DEPS: six-domain same-day rollup.

**IX-3 The Living Archive** — Grove · repeatable, once per qualifying
  anchored yearly window
- TRIGGER: ONE shared 365-day window (pin G9: anchored at the app's
  GLOBAL start anchor — first-ever non-imported event, ANY domain)
  in which ALL THREE hold concurrently: ≥200 qualifying journal
  entries AND ≥100 qualifying vlogs AND ≥100 qualifying workouts.
  Fires when the window closes with all three true.
- DEPS: three-domain yearly rollup on the global anchor.

**IX-4 Wrote It Down** — Root → Branch → Heartwood · repeatable:
  first occurrence then count milestones 10 / 50
- TRIGGER: a qualifying journal entry (≥40 words) AND a gym PR (New
  Number, III-3) logged on the SAME dayKey. Count = DISTINCT
  qualifying days (pin G4). Both halves independently real.
- DEPS: PR-day rollup + journal-day rollup.

**IX-5 Ghost in the Machine** — Grove · one-time
- TRIGGER: Like Clockwork (any habit), The Schedule Never Breaks,
  and No Deviation are ALL independently active at once, overlapping
  within the same 90-day span (their runs coincide for ≥90 days).
  Fires when the three-way overlap first completes 90 days. Nothing
  new to fake — three already-guarded runs coinciding.

§IX total: 5 ✓

---

## DEPENDENCIES (engine/storage items pulled in by triggers)

Growth list — each trigger that needs a piece of machinery adds its name
here with the trophies it serves. This list feeds the M0/M1 storage &
analytics scope decisions. (v2's TENSION list is the seed; every item
re-appears here once claimed by a trigger.)

| Dependency | Serves (first mention is enough; family listed) |
|---|---|
| E1 qualifying-entry floors per domain (word floor / real items / real sets / kept media / real measurement) + in-predicate `isImported` | ALL trophies across I–IX |
| E3 anchored 365-day windows (per-domain first-qualifying anchor) | I-5,16,17 · II-5,14,15 · III-27,28 · IV-13,14 · V-8,9 · VI-2 · VII-5,11,12 · VIII-5,7,8,9,10 · IX-3 |
| E4 yearlyPass + consecutiveYears (yearly meta-streak) | I-16,17 · II-14,15 · III-27,28 · IV-13,14 · V-8,9 · VII-11,12 · VIII-7,8,9,10 |
| E5 anniversaryWindow(anchor, k, ±tol) | II-12 · III-26 |
| E6 dayDomainPresence / domain presence day-rollups, incl. six-domain | I-2,3 · II-8 · VIII-5,6 · IX-1,2,3,5 |
| E7 est1RM single Epley owner (weight-mode, 1–12, best set) | all PR + strength-relative records (III-3..18), standards (III-18), standards-family |
| E8 occurredAt truth (declared time) — robot family | I-4 · II-9 · III-22 · V-3 |
| E9 calendar: ISO weeks (G10), calendar months (G11), real month lengths | II-6 · III-9 · V-7 · VI/G10 · VIII-6 |
| E10 distinct qualifying days for count milestones (G4) | I-13 · IX-1,4 |
| E11 active-phase lookup (G14/G15) | IV-3,4,5,8,9,10 · V-4 |
| Unprompted's four-effort-domain exclusion list (M7) | I-13 |
| bookended calendar-year floor 0.40 (G12) | I-15 |
| month-day matcher (±1 day, leap-day handled) — shared utility | I-12 · VII-8,9 |
| 30-min slot anchor (G1) + weekday/slot anchor (G18) | I-4 · II-9 · V-3 |
| closed-window cadence (G5 Juggling / G6 Trifecta) | II-8 · III-10 |
| tonnage owner (weight-mode only; addedLoadKg excluded) + single-day tonnage | III-19 (R44–R47) · III-20 |
| weekly-workout-count owner + EMPTY-WEEK lock | III-21 · III-22 |
| weekday-set equality for 26-week pattern + planned-rest freeze | III-22 |
| stallRule owner (4-out + 2-in) | IV-10 |
| thin-week rule (<5 weigh-in days) for pace ratios (G16) | IV-8,9 |
| pace-band owner + weekly rolling-weight delta owner | IV-8,9,10 · V-4 |
| gap detector (workout-free stretches) | III-24 |
| restart-semantics consecutive counter (Ouroboros) | VIII-10 |
| vacation day-level union owner (E-clash #5) | VI-2 |
| media durationSec stored field (measured once at intake) | VII-2,7,10 |
| phases in chronological/adjacency order (The Turn's cut-after-bulk) | IV-12 · I-14 |
| planned-rest event type (Honest Rest + robot freeze) | II-10 · III-22 · IV-5 |
| milestone-confirmation owner (2 consecutive weekly checkpoints) | V-4,10..16 (whole V-ladder) |
| real anchor date = first-ever non-imported event | VIII-1..10 · IX-3 |

(Engine-scope note: nothing above implies new tables beyond the ones
already locked in the ledger; several are pure function owners in the
Analytics Engine.)

## Notes

- Name collisions / overlaps with the retired TEMP-PLANNING-Achievements
  draft are resolved at first write (v2 wins; old draft has no vote).
- Nothing here implies code exists; this is the TARGET spec.
- Achievement descriptions (the human-facing flavor/reward text shown in
  the UI for each trophy and tier) are NOT defined anywhere in this spec
  or the catalog — they must be written during implementation, per trophy,
  at first-write time.