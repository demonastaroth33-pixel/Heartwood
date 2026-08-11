# TEMP PLANNING — Achievements catalog (sub-file of TEMP-PLANNING.md)

SUB-FILE OF THE LEDGER. Same scope as TEMP-PLANNING.md: scratchpad, NOT
applied to docs/ until user approves. This catalog is the single
canonical source for any future gamification doc draft; when docs are
written, Gamification.md must reference THIS file rather than re-list
achievements ad hoc.

## Rules governing the whole catalog (lock these with the file)

1. NO XP VALUES HERE. XP/achievement amounts are locked M2 open items.
   Each entry carries a REWARD CLASS (see below), never a number.
2. EVERY achievement must pass the 3-question anti-cheat gate:
   real? on its actual day? real content/effort? (wrongful = cancelled).
3. Derived-only discipline: every achievement is COMPUTED from real
   history via H3 owner functions (event log + entities walking). They
   are never announced by single events (e.g. workout.pr), never
   user-editable, never "buyable".
4. No achievements for: opening the app, browsing, empty entries,
   retroactive/bulk logging, XP-farming, or anything cosmetic.
5. Imported journal rows (J3 flag) NEVER count toward achievements.
6. Icons: ICON column is a placeholder keyword ONLY. The "cool icon"
   art itself is DESIGNED AT IMPLEMENTATION TIME — we do not design
   graphics now. (Icons are the hard part; deferred explicitly.)
7. Achievement faces = modal "trophy". Badges never farm XP beyond
   their own, single claim is one-time unless marked REPEATABLE.

## Reward classes (no numbers — M2 opens at the tap)

- BADGE  = the trophy/icon itself is the reward (no XP). Used for
  identity/consistency trophies where XP would double-count habit XP.
- SMALL  = matches the ownership "small" XP tier (like journal entry).
- MEDIUM = roughly a workout-type reward; used sparingly.
- LARGE  = milestone-class reward.
- RARE   = very-large goal-completion-class reward; sparse.

Note: none of this changes the locked XP table (habit / milestone /
goal / journal / media / weekly-review). Achievements OVERLAY it.

## Catalog index (by category)

F   Foundation (firsts / setup)
J   Journaling
H   Habits & consistency
FUSE Fitness
     FS Strength records
     FV Volume / adherence
     FB Body
   Nutrition
   Goals
P   Periods / trips / archive / anniversary
L   Lifetime / longevity

---

## CATALOG (draft — precise activation criteria)

### F — Foundation/firsts

- ACH-F-001 "Hello World" | first journal entry ever | Tier badge | Γ
  Criteria: journal_entries count >= 1 (never via import flag).
- ACH-F-002 "First habit" | first habit created + completed on its
  actual day. Tier badge.
- ACH-F-003 "Day one part two" | 7 consecutive app days with at least
  one logged entity (handles the post-install lull). Badge.
- ACH-F-004 "The core loop" | same day: 1 journal entry WITH content,
  1 habit completed, 1 weigh-in (any). Badge. Shows loop grip.

### J — Journaling

- ACH-J-001 "Three in a row" | journal entries on 3 consecutive
  calendar days. Badge.
- ACH-J-002 "Seven days of you" | journal entry on 7 consecutive
  calendar days. Badge.
- ACH-J-003 "Thirty days of you" | journal entries on 30 (not
  necessarily consecutive) calendar days within any 45-day window.
  MEDIUM.
- ACH-J-004 "Every single day" | journal entry on EVERY calendar day
  for 30 consecutive days. MEDIUM (hard).
- ACH-J-005 "The wordsmith" | a single entry >= 1000 words (content-
  gate; per user's own threshold). Badge.
- ACH-J-006 "Deep pockets" | has entries with 3 different lift-dim ends
  tags in the same week. Badge.
- ACH-J-007 "Back to the future" | the On-This-Day (J1) is viewed
  10 times. Badge. (reading your own history is its only reward.)
- ACH-J-008 "Documented century" | journal entries on 100 distinct
  calendar days total (all-time, import-excluded). large historical
  trophy. MEDIUM.
- ACH-J-009 "Year, chapter one" | at least 1 journal entry in each of
  12 distinct calendar months of the same year. MEDIUM.
- ACH-J-010 "Rainy day" | journal entry on a day when the user also
  logged weight (any) — "even the stats days count." Badge.

### H — Habits

- ACH-H-001 "Seven-day habit" | 7 consecutive days with ALL active
  (non-archived) habits completed. Badge.
- ACH-H-002 "Thirty-day habit" | 30 consecutive days with >= 1 habit
  completed. MEDIUM.
- ACH-H-003 "Streak saviour" | any single habit reaches a 21-day
  streak. Badge.
- ACH-H-004 "Century club" | any single habit reaches a 100-day
  streak. MEDIUM.
- ACH-H-005 "Perfect week" | 7/7 days, every active habit done those
  7 days. MEDIUM (rare streak).
- ACH-H-006 "Renaissance" | 5 different habits each completed >=5
  times within the same 30-day window. Badge.
- ACH-H-007 "Grace spirit" | used 0 grace days for 30 days straight
  (no grace consumed). Badge. Fights the shield.

### F — Fitness (workouts / strength)

- ACH-FS-001 "First session" | first workout completed ever. Badge.
- ACH-FS-002 "Iron refuge" | 3 workouts in 7 days. Badge.
- ACH-FS-003 "Weekly knight" | 3 workout sessions per calendar week
  for 4 consecutive weeks. MEDIUM.
- ACH-FS-004 "The regular" | 50 workouts total. MEDIUM.
- ACH-FS-005 "Two hundred" | 200 workouts total. LARGE.
- ACH-FS-006 "Heavy" | first 100 kg deadlift (est‑1RM >= 100 kg;
   derived from top set using Epley). LARGE.
- ACH-FS-007 "Squat milestone" | est-1RM squat >= 1.5x bodyweight (
  derived, 7-day rolling bodyweight). LARGE.
- ACH-FS-008 "Bench press bar" | first est-1RM bench >= 1x
  bodyweight. LARGE.
- ACH-FS-009 "Clean rep king" | 20 strict reps of a bodyweight
  exercise (pushup/chin) in a single session. Badge.
- ACH-FS-010 "Boss deload" | finish a deload week and return to a
  PR within 3 weeks after. MEDIUM (derived session-walk).
- ACH-FS-011 "Pace perfection" | 8 weeks of consistent training
  (>= 3 sessions/week) with NO rest-day farming. MEDIUM.
- ACH-FS-012 "Volume veteran" | cumulative volume (tonnage) of 1
  million kg across all time. RARE.
- ACH-FS-013 "Not skipping" | a full calendar month with 0 missed
  plan slots (slot adherence 100%). MEDIUM.
- ACH-FS-014 "PR tonight" | any exercise reaches a PR value 3 times
  this month, each from a real session walk. Badge.

### FB — Body

- ACH-FB-001 "First weigh-in" | first body weigh-in. Badge.
- ACH-FB-002 "Calm baseline" | 10 weigh-ins total. Badge.
- ACH-FB-003 "Weekly citizen" | a weigh-in in each of 4 consecutive
  weeks. Badge.
- ACH-FB-004 "Target hit" | body weight reaches target of a weight
  goal (#16). LARGE.
- ACH-FB-005 "Progress caught" | physique photo taken 3 different
  months. Badge.
- ACH-FB-006 "The long watch" | 20 consecutive weeks with >=1
  weigh-in each. MEDIUM.
- ACH-FB-007 "Scientist" | 100 weigh-ins total. MEDIUM.

### N — Nutrition

- ACH-N-001 "First meal" | first nutrition_log. Badge.
- ACH-N-002 "Fully logged" | a day with iso meals AND macro targets
  fully logged (weeback auto-check). Badge.
- ACH-N-003 "Week of truth" | 7 consecutive fully-logged days (uses
  the ±10% "absolute solid" definition). MEDIUM.
- ACH-N-004 "Protein pal" | protein g/kg within target on 10 days
  in a 20-day window. Badge.
- ACH-N-005 "The chef" | creates 10 different recipes. MEDIUM.
- ACH-N-006 "The macro master" | 30 fully-logged days per month
  (same month). MEDIUM. (anti-farm handled via real weekly cadence.)
- ACH-N-007 "Packed and proud" | packs AND eats every pack meal in
  one day (R4). Badge.
- ACH-N-008 "Food literate" | logs 25 different foods from the
  lookup (NU13) over time. Badge.

### G — Goals / milestones

- ACH-G-001 "First milestone" | first milestone completed. MEDIUM.
- ACH-G-002 "First goal done" | first goal completed (any kind).
  LARGE.
- ACH-G-003 "Goal farmer" | 3 goals completed in one year. LARGE.
- ACH-G-004 "Weight goal" | completed a weight goal (Fitness body).
  RARE for the specific achievement (the reach Achiever).
- ACH-G-005 "Strength goal demolished" | completed strength goal.
  RARE.
- ACH-G-006 "Finale" | completed a phase (close report fired) having
  hit its target pace. MEDIUM.

### P — Periods / trips / archive / life

- ACH-P-001 "First chapter" | first period (vacation/trip) closed
  with 5+ journal entries inside. Badge.
- ACH-P-002 "Story teller" | 5 different periods each with 3+
  entries. MEDIUM.
- ACH-P-003 "1000 days" | 1000 calendar days since first journal
  entry. MEDIUM (longevity).
- ACH-P-004 "Anniversary" | today is the 1-year anniversary of the
  first entry. BADGE (once-only moment).
- ACH-P-005 "Home vault" | first 10 vlogs archived to PC. Badge.
- ACH-P-006 "Year book" | generated a Year Book (J5) for a full
  calendar year. Badge.
- ACH-P-007 "Copied to PC" | "My Videos" (J7) has >= 100 adopted
  video files. MEDIUM (archive keeper).
- ACH-P-008 "Just started" | the quiet week (J4) used twice. Badge —
  recognizes listening, not punishment. (No farming:
  quiet-ism does not reset streaks etc.)

### U — USAGE / MILESTONE LADDER ("you're still here" — the time trophies)

These are the "years of use" markers: computed from the date span the
app has been OPEN (first recorded event / first journal entry → today),
plus big counters. Each is a milestone identity trophy, not a habit you
can game — the only way to earn them is to genuinely keep using the app.

- ACH-U-001 "Week one survived" | app usage span >= 7 days (first
  recorded entity to today). BADGE.
- ACH-U-002 "The first moon" | usage span >= 30 days. BADGE.
- ACH-U-003 "Seasoned" | usage span >= 100 days. BADGE.
- ACH-U-004 "Quarter of a year" | usage span >= 90 days. SMALL.
- ACH-U-005 "Half a year" | usage span >= 182 days. SMALL.
- ACH-U-006 "One year of life" | usage span >= 365 days. MEDIUM
  (the flagship "1 year" trophy).
- ACH-U-007 "Two years at war with gravity" | usage span >= 730 days.
  MEDIUM.
- ACH-U-008 "The half-decade" | usage span >= 1825 days. LARGE.
- ACH-U-009 "A decade back" | usage span >= 3650 days. RARE.
- ACH-U-010 "Fact keeper" | >= 1000 events recorded all-time
  (any behavior event, import-excluded). SMALL.
- ACH-U-011 "Ten thousand moments" | >= 10,000 events recorded
  all-time. LARGE.
- ACH-U-012 "Never close the book" | journal entries exist in >= 10
  distinct calendar YEARS (all-time). RARE.

(These overlap a bit with J-008/L — the ladder here is explicitly the
usage-span/time dimension; dedupe at M2 when the final list is agreed.)

### L — Long-term status walls ("the essay")

- ACH-L-001 "Documented century" (alias reference to J-008) — the
  long term reads, purely historical, never importable. LARGE.
- ACH-L-002 "365+ days" | journal entry on >= 100 consecutive days at
  all-time high. LARGE.
- ACH-L-003 "Life in tech" | month level completeness ratio over 60
  consecutive weeks with >= 50% of days having any activity. LARGE.
- ACH-L-004 "The vault" | 1 GB of personally logged media in
  app-managed storage OR PC folder (combined). RARE.
- ACH-L-005 "Five years" | >= 5 years between first and latest
  journal entry. RARE (time-gated rarity).
- ACH-L-006 "Net worth" | 10 different Life Areas each with >= 30
  events associated over time. MEDIUM (systems breadth).

## Notes / guardrails specific to this file

- Nothing above is implemented yet — it is a TARGET catalog. The final
  count can change at the M2 design session (user approves every
  trophy; icons designed at build-time only).
- XP VALUES + level thresholds are NOT here (M2 open). Each trophy's
  reward class marks the "weight", and even that may be adjusted at
  the design session after agreement, not silently.
- The "session-walk" discipline forbid single-event farming: e.g.
   ACH-FS-012 (tonnage) reads real session data, false or clipped
  values never histogram. All derived.
- Imported rows exclusion (J3) is input for every count above (count
  only rows WITHOUT import flag).
- Self-contained, the guardrails/rest always let the catalog stand
  alone; no symbol/state info.

---

## TODO / open while this sub-file grows

- [ ] Confirm classification (reward class) of each entry with user.
- [ ] Separate "REPEATABLE" set (e.g., monthly "Fully logged" again)
  vs one-time.
- [ ] Icon art and placement — DESIGNED AT IMPLEMENTATION (no drawing
  in planning).
- [ ] Cap total: aim 40–70 entries (robust but curated), no filler.