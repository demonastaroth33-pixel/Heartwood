# ACHIEVEMENT-SCAN — Raw Brief (Life Tree rarity-ladder input)

**Date:** 2026-08-29 · **Scanner:** feature-scan agent · **Status:** exhaustive raw material, no summarization
**Sources read in full:** `docs/Gamification.md` (493 lines), `PersonalOS-Achievements-v2.md` (1159 lines), `TEMP-PLANNING-Achievement-Spec.md` (990 lines), `TEMP-PLANNING-Achievements.md` (270 lines)
**Purpose:** feeds the Life Tree rarity ladder (achievements = flowers, tier-mapped) + adaptation layer's trigger authority.

---

## 0. Source-of-truth hierarchy (WHAT / WHEN / WHY)

| Layer | File | Role |
|---|---|---|
| THE WHAT (catalog) | `PersonalOS-Achievements-v2.md` | Canonical names/criteria/tiers. **131 trophies + 47 ladder tiers = 178 named entries**, 9 domains. Wins every naming/criteria dispute. |
| THE WHEN (triggers) | `TEMP-PLANNING-Achievement-Spec.md` | E0–E13 shared trigger engine, per-trophy TRIGGER predicates, rung tables R1–R47, DEPENDENCIES table. Every v2 trophy has exactly one spec record and vice versa. |
| THE WHY (ledger pins) | `docs/Gamification.md` (ledger section) | Guardrails G1–G20, E-clash notes, DOCS-PASS rules. **When v2 and the spec disagree, the ledger decides.** |
| SUPERSEDED draft | `TEMP-PLANNING-Achievements.md` | **SUPERSEDED as catalog.** Only its **7 governing rules** carry over (see §7). Its reward classes BADGE/SMALL/MEDIUM/LARGE/RARE are referenced in §5.2 but carry no numbers. |

DOCS-PASS rules (a)–(e), Gamification.md:157–162: merged text = v2 verbatim; predicates = spec verbatim; pins land as named rules; both files stay LIVE sources; **1:1 mapping guard — 131 trophy records ↔ 131 spec records ↔ 47 rungs; any drift count is a drafting error.**

**Census corrections carried (Gamification.md:164–169) — do not reintroduce pre-correction numbers:**
- NoDeviation tolerance is **±3%** (earlier ±30% was a typo, fixed).
- Stale duplicate blocks deleted from v2 file.
- "Once per calendar year" residue scrubbed to anchored-yearly-window wording.
- Rolling Tape = first KEPT vlog (captured OR adopted).
- Push-up ladder tier renamed **"Fifty Push-Ups"** (was different name).

---

## 1. CENSUS — THE FULL INVENTORY COUNT

Per spec census (spec:45–52, verified against v2 + ledger):

| Domain | Family name | Trophies |
|---|---|---|
| I | The Long Conversation (journal & reflection) | 17 |
| II | The Unbroken Chain (habits & consistency) | 15 |
| III | The Iron Ledger (gym & strength) | 28 |
| IV | The Fuel Line (nutrition & food discipline) | 14 |
| V | The Shape of Things (body & weight tracking) | 16 |
| VI | Elsewhere (vacations & time-off) | 4 |
| VII | Proof of Life (media archive: vlogs & photos) | 12 |
| VIII | The Rings (longevity & time) | 20 |
| IX | Full Circle (cross-domain / integration) | 5 |
| **Total trophies** | | **131** |
| **Ladder rungs** | (24 absolute-lift + 19 bodyweight-ladder + 4 tonnage = 47; all inside §III) | **47** |
| **GRAND TOTAL named entries** | | **178** |

---

## 2. SHARED ENGINE — E0–E13 (THE WHEN; spec:54–129; primitives in Gamification.md:171–275)

Every trigger builds on these. Verbatim-critical:

- **E0 TRIGGER EXECUTION** — predicate evaluated only after a WRITE touching its SOURCES (check-and-fire; never a timer, never app-open, never render). On false→true: emit ONE `achievement.unlocked` event (single event API, written transactionally). While true → silent. Repeatables re-arm per cadence only (per-window/per-year/per-habit/per-run). (spec:56–61; Gamification.md "CHECK-AND-FIRE":196–197)
- **E1 QUALIFYING(domain, event)** — real-content bar enforced INSIDE every predicate (spec:63–74):
  - journal: wordCount ≥ 40, `isImported = false`
  - habits: a real logged completion (NOT a tick from grace)
  - gym: a real logged set (weight-mode or rep-mode)
  - food: a log with ≥ 1 real logged item
  - body: a real measurement / physique-timeline photo
  - media: a kept vlog or photo (captured OR adopted — M6 lock)
  - `isImported` lives in the filter, not the import pipe.
  - **CARVE-OUT (M7/C2):** Novel-Length Life and Deep Dive read EVERY non-imported entry's words regardless of the 40-word floor — the only two word-trophy exceptions. Override table is exactly: Novel-Length, Deep Dive (word-trophies), Ghost (run-alive, not entry-based), Bookended (calendar) — no others (Gamification.md:221–225).
- **E2 OCCURRED-AT TRUTH** — robot-consistency triggers read `occurredAt` (time the user DECLARES the thing happened), never `writtenAt`. `writtenAt` = operational truth only (sync, dedupe, audit). Single-user trust model. (spec:76–79; Gamification.md:180–185)
- **E3 ANCHORED YEARS** — `yearlyWindow(i, anchor)` = i-th non-overlapping 365-day window counting from the DOMAIN'S FIRST QUALIFYING (non-imported) anchor event; never calendar-chopped, never install/open date. (spec:81–84; Gamification.md:226–236) — "Once per calendar year" is DEAD as a phrase; trophies fire once per anchored year, checked when window closes (no double-fire within a calendar, no partial-window credit). Years labeled "Year 1/2/…/N". **Bookended is the single NAMED exception** (Jan-1 first + Dec-31 last in SAME calendar year). Imports never qualify any year.
- **E4 YEARLY META-STREAK** — `yearlyPass(criterion, anchor)` + `consecutiveYears(booleans, N)`. No honest-gap tolerance — a failed window restarts the run at the NEXT window, never partial credit; check-and-fire once per window completion; all-zero history → never fires. (spec:86–90; Gamification.md:238–244) Applies to all eleven multi-year non-ring families.
- **E5 ANNIVERSARY WINDOW** — `anniversaryWindow(anchorDate, k, ±toleranceDays)` → a qualifying event exists on any day within {anchor + k×365 ± tol}. Two consumers: II-12 (anchor = habit's first qualifying completion; k=1; tol 7) and III-26 (anchor = first-ever qualifying workout; k=1; tol 7). Distinct query class from yearlyPass. (spec:92–95; Gamification.md:250–257)
- **E6 DAY PRESENCE** — `dayDomainPresence(dayKey, domain)` boolean with E1 bar inside; `domainSet(domain)` for counts; `sixDomains(dayKey)` for the all-six check. (spec:97–99; Gamification.md:190–197) Naive per-day scan accepted.
- **E7 METRICS** — one shared Epley owner `est1RM(kg, reps)` (weight-mode sets ONLY; rep-mode NEVER Epley; best working set, 1–12 reps, one set per session). `rollingAvg(field, 7d)` for bodyweight. Gesture later: `stallRule(phase)` = 4 consecutive weekly deltas outside progress direction + recovery = 2 inside the band — ONE named Coach rule, no ad-hoc copies. (spec:101–106)
- **E8 SLOT30** — 30-minute slot around an anchor time. Per G1: a robot-consistency run anchors its slot to the FIRST qualifying completion of the run; every later completion must fall within ±30 min of that anchor slot; outside = run breaks. No fixed clock-grid. (spec:108–111; Gamification.md:350–353)
- **E9 CALENDAR** — weekday = Mon–Sun ISO (never drift); calendar month = 1st–month-end real length; gaps/leaps per real calendar. (spec:114–115)
- **E10 COUNT MILESTONES** — milestone counts (Unprompted, Wrote It Down, Full Circle Day) count DISTINCT QUALIFYING DAYS, never raw entry multiplicity (pin G4). (spec:117–119; Gamification.md:361–364)
- **E11 ACTIVE PHASE** — a trophy requiring a phase only fires when a phase entity is active on the participating day/weeks (G14/G15). (spec:121–122)
- **E12 COACH SIDE-EFFECT** — a fire may emit ONE Coach line at most and ONLY for Ring/Grove; everything else silent (ledger lock). (spec:124–125)
- **E13 DERIVED-ONLY** — everything reads H3 owner outputs over history; no stored counters, no user-editable totals, no UI-computed sums. No XP anywhere (rule 1). (spec:127–129)

**Account anchor (Gamification.md:173–177):** longevity "day one" = MINIMUM `occurredAt` across all events with `imported=false` and no tombstone/deletion; computed and FROZEN at first real event write; stored immutable, read O(1), never user-editable. NOT the milestone-review anchor (first journal entry). Survives reinstall; imports can never set or shift it. Rings read this anchor.

**Month-day matcher (Gamification.md:186–189):** one shared `sameMonthDay(a, b, toleranceDays=1)` serves Same Question New Answer / One Year Same Day / Half a Decade Same Day; leap day (Feb 29 → Feb 28 in non-leap years) handled inside; never re-implemented per trophy.

**Qualifying entry — ONE definition (Gamification.md:203–220):** `qualifyingEntry(domain, dayKey)`:
- JOURNAL — non-imported, ≥40 words, on its own `occurredAt` day. (40-word floor applies everywhere, matching Ink on the Page + anti-burst guardrail; DIFFERENT floor from the journal-XP content gate of ≥20 words.)
- FOOD — non-imported log with ≥1 real logged item (named, quantified); typed daily totals/placeholders/empty never count.
- GYM — non-imported training session with ≥1 real logged set (weight/reps or time; zero-set sessions never count).
- HABITS — a real completion that day (including auto-tracked); `completion_revoked` never counts; **PLANNED REST NEVER FILLS THE SLOT** (rest day = honest absence — streaks still freeze, Honest Rest still fires, nothing punished, domain simply not present).
- BODY — a real weigh-in value OR a physique-timeline photo that day (typed guesses never count).
- VLOG/MEDIA — a kept, non-imported video with measured duration, captured through the pipeline OR adopted.
- Imports NEVER count anywhere.
- Derived line 1 — "a qualifying day": ≥1 qualifying entry in that domain. Derived line 2 — "qualifying activity in a month": ≥1 qualifying entry in that month.

**Two-domain same-day joins (Gamification.md:198–202):** PR + journal (Wrote It Down), D031 photo + weight milestone (Eyes on the Data), journal + vlog-in-trip (Somewhere Else, Still You) — composed from `dayDomainPresence` + targeted day queries; each half must independently be real/qualifying. Built once, shared.

**Re-fire map (Gamification.md:264–271):** re-fire per qualifying window for the yearly-window families (Full Year One Habit, 3y–5y No Missing Links, and all 11 yearlyPass families); THE LONG HAUL re-fires per rebuilt 500-day streak; One Week In / A Hundred Days / Like Clockwork / One Trip Around the Sun are strictly once per habit; 3y/5y chains fire at chain completion. No double-fire within a window. Every once-per-habit/per-window fire calls out WHICH habit earned it. (Supersedes v2's "once per habit" wording for yearly-window families.)

**Vacation-day union (Gamification.md:272–275):** each calendar dayKey inside ≥1 vacation period counts AT MOST once toward any vacation-day total, regardless of overlapping ranges. Never naive per-period addition.

---

## 3. FAMILY-BY-FAMILY INVENTORY — ALL 131 TROPHIES (verbatim-critical detail)

Naming convention: `[File] [Spec-ID] Name — Tier · repeatability — condition/trigger.`

### 3.I — THE LONG CONVERSATION (journal & reflection) — 17 trophies
Sources: `journal_entries {occurredAt date, words, isImported}`; "qualifying entry" = E1 journal bar (40-word floor + import exclusion GLOBAL, not repeated per record).

1. **I-1 Ink on the Page** — Sprout · one-time (v2:30–33; spec:138–141) — `count(qualifyingEntries(journal)) >= 1` first becomes true (first real ≥40-word, non-imported entry, on its own occurredAt day). Imported entries never count as eligible for "first."
2. **I-2 A Week of Honesty** — Root · one-time (v2:35–37; spec:143–146) — 7 consecutive dayKeys each with ≥1 qualifying entry (day-streak over qualifying days). Fire once.
3. **I-3 A Season Kept** — Branch · repeatable once per streak-run (v2:39–41; spec:148–151) — qualifying-day streak reaches 90; fires once per run, re-arms when current run breaks and a new run starts.
4. **I-4 Same Time, Every Time** — Heartwood · repeatable per run (v2:43–51; spec:153–158) — 60 consecutive calendar days each with a qualifying entry whose `occurredAt` is within ±30 min of the current run's FIRST qualifying entry time-of-day (E8, G1). Any day outside → run breaks; fire on the 60th qualifying day. Guardrail: reads entry's occurredAt (declared time), never typing moment (TENSION 15 lock). Robot-consistency family.
5. **I-5 Full Orbit** — Ring · repeatable per qualifying year (v2:53–58; spec:160–164) — `yearlyPass(journal: ≥300 distinct qualifying days in the window, anchor = first qualifying journal entry ever)`. Fires once when a window passes. Guardrail: **300/365 not 365/365** — leaves room for honest gaps; each entry still independently meets the word minimum on its own day.
6. **I-6 Half Century** — Root · one-time (v2:60–61; spec:166) — 50th lifetime qualifying, non-imported journal entry.
7. **I-7 Five Hundred Pages** — Branch · one-time (v2:64–65; spec:169) — 500th such entry.
8. **I-8 A Thousand Entries** — Heartwood · one-time (v2:68–69; spec:171) — 1,000th.
9. **I-9 Novel-Length Life** — Root → Branch → Heartwood → Grove · repeatable once per threshold (v2:72–76; spec:173–178) — cumulative word count over ALL non-imported entries (EVERY entry's words, no 40-word floor — carve-out C7) crosses the threshold. Thresholds: **25k / 100k / 500k / 1M words**. Fire once per threshold.
10. **I-10 Deep Dive** — Branch · repeatable once per threshold (v2:78–81; spec:180–184) — a single non-imported entry's words ≥ threshold: **500 / 1,500 / 4,000 words in ONE entry**. Fire once per threshold crossing (same entry can't double-fire). Carve-out registry.
11. **I-11 You Came Back** — Root · repeatable (v2:83–88; spec:186–190) — a qualifying entry exists whose dayKey − previous qualifying entry's dayKey ≥ **21 days**; fires on the return entry. Celebratory only; deliberately NO mirror (gap) trophy.
12. **I-12 Same Question, New Answer** — Branch → Heartwood → Grove · repeatable at **2 / 3 / 5 years** (v2:90–99; spec:192–200) — `sameMonthDay(a, b, tol=1d)`: a qualifying entry exists on the same month-day across ≥N distinct years. Fires the year the Nth match lands. **G2 locked: fires ONCE at 2, ONCE at 3, ONCE at 5 — never at 6+ ("5+" = final milestone at 5).** Leap-day handled inside matcher (Feb 29 → Feb 28 in non-leap years). Each year's entry must independently be real/qualifying on its own actual date.
13. **I-13 Unprompted** — Root → Branch → Heartwood · repeatable: first occurrence then count milestones **10 / 50 / 200** (v2:101–107; spec:202–209) — a qualifying journal entry on a day with ZERO qualifying events in {habits, gym, nutrition, media} — reflection for its own sake. **BODY deliberately EXCLUDED** — a weigh-in or physique photo does NOT break Unprompted (body is routine tracking, not "another activity"). Count = DISTINCT qualifying solitary days (E10); the first occurrence is also the first of the 10-count.
14. **I-14 The Turn of the Page** — Branch · repeatable once per phase transition (v2:109–113; spec:211–215) — `phaseStartWindow(phaseId)`: a qualifying journal entry with |occurredAt − phase.startDate| ≤ 3 days where a bulk/cut/maintenance phase starts (phase creation). Fire once per phase entity; check-and-fire after phase-creation write and after journal writes near an open window; fires once when the window comes true. (Gamification.md:258–263)
15. **I-15 Bookended** — Heartwood · repeatable once per CALENDAR year (the ONE named calendar exception, by M4 lock) (v2:115–121; spec:217–224) — qualifying entries on Jan 1 AND Dec 31 of the SAME calendar year, AND distinct qualifying days in that year ≥ **floor(0.40 × daysInYear): 146 (365-day) and 146 (366-day — 0.40×366 = 146.4, floor ⇒ 146, per G12)**. Always floor, never round-up. Fire when the Dec-31 entry lands (once per year).
16. **I-16 Three Years, Still Talking** — Grove · one-time (v2:123–127; spec:226–230) — `consecutiveYears(Full Orbit passed, 3)` — Full Orbit criteria (≥300 qualifying days within 365-day window) independently satisfied in 3 consecutive, non-overlapping yearly windows.
17. **I-17 Half a Decade of Honesty** — Grove · one-time (v2:129–137; spec:232–233) — same, `consecutiveYears(…, 5)`. Guardrail (both): each window must pass Full Orbit on its own — no way to burst-log at year-end to fake a window, no way to skip a year mid-run and keep the run consecutive.

### 3.II — THE UNBROKEN CHAIN (habits & consistency) — 15 trophies
Sources: `habit_completions {habitId, occurredAt, isImported}` + `habits {createdAt}`. **"active day" = a QUALIFYING completion on that dayKey; grace-carried days are NOT active (G19: grace-rescued day never counts toward ANY streak in this family — strict consecutive real completions).**

1. **II-1 Day One** — Sprout · one-time (v2:143–144; spec:247–250) — first-ever qualifying habit-completion event (any habit). G20: "Day One" = first-ever qualifying habit-completion event; verified-consistent, no pin required.
2. **II-2 One Week In** — Root · repeatable, once per habit (v2:147–149; spec:251–254) — some habit h reaches an active-day streak of exactly 7 for the FIRST time ever (this habit). Fire at the 7th day.
3. **II-3 A Hundred Days** — Heartwood · repeatable, once per habit (v2:151–153; spec:256–257) — h reaches 100 for the first time.
4. **II-4 The Long Haul** — Grove · repeatable, once per habit — **PER-WINDOW re-fire (audit B1 note)** (v2:155–157; spec:259–263) — a 500-day streak fires; EVERY time a NEW 500-day streak is crossed (rebuilt after a break, or same habit crossing again in any later run) — re-arms per distinct 500-day run.
5. **II-5 Full Year, One Habit** — Ring · repeatable per qualifying window (v2:159–161; spec:265–271) — `yearlyPass(habit h criterion: ≥300 qualifying completion days inside a 365-day window, anchor = h's FIRST qualifying completion ever — per-habit anchor, pin G8)`. Fires once per passing window; one close = one fire. (G8: anchor at THAT habit's first qualifying completion, local rebuild anchor, never app-global.)
6. **II-6 Perfect Month** — Branch · repeatable (v2:163–166; spec:273–277) — a single habit completed on EVERY calendar day of a full month (**28–31/31, that month's real length**). Fire at month's close (once per habit per qualifying month). **NOT grace-able** — grace-covered miss leaves that day empty, trophy does NOT fire (Gamification.md:117–119).
7. **II-7 Five Strong** — Branch · one-time (v2:168–173; spec:279–283) — on one dayKey, ≥ **5 distinct habits** each with an ACTIVE streak ≥ 7 days, simultaneously, same day. **G19: strict consecutive only — grace-carrying weeks do NOT count as active; a grace-rescued day is not an active day.** Fire once when first true.
8. **II-8 Juggling Act** — Branch · repeatable once per closed qualifying 21-day window (v2:175–180; spec:285–292) — within any closed 21-day window: ≥ **14 distinct days** each with ≥ **3 distinct habits** completed that day. Windows = the 21-day spans ending on each day; a qualifying window fires ONCE when it closes; overlapping qualifying windows never re-fire the same event (**G5**). Sliding-window exists-a-window scan, NOT a rolling mean.
9. **II-9 Like Clockwork** — Heartwood · repeatable, once per habit run (v2:182–189; spec:294–299) — a single habit's **90 consecutive completions** whose `occurredAt` each fall inside the current run's 30-min slot anchored at the run's FIRST qualifying completion (E8 + G1). Outside → run breaks; fire at the 90th. A run unbroken but drifted outside the window doesn't qualify — not "close enough." Robot-consistency family.
10. **II-10 Honest Rest** — Root · repeatable (v2:191–196; spec:301–306) — an explicit "planned rest" event for habit h, with an active streak ≥ **14 days on BOTH sides** (the day before the rest was active AND the day after it is active). Silence alone never earns this. Fires once per qualifying rest event. Only fires off an explicit rest-log event, never off absence.
11. **II-11 Rebuilt** — Branch · repeatable (v2:198–203; spec:308–312) — a habit that broke a ≥30-day streak (a gap ≥30 days from its last completion) then rebuilds a fresh ≥30-day active streak. Fire at the 30th day of the rebuilt run. No trophy for the break; **30/30 floors make it non-farmable** (not a cheap farmable ping-pong).
12. **II-12 One Trip Around the Sun** — Ring · repeatable, once per habit per anniversary (v2:205–215; spec:314–321) — `anniversaryWindow(anchorDate = this habit's FIRST qualifying completion, k = 1, ±7 days)` → the habit still has a real completion inside the anniversary band (not an unbroken streak — just still practiced ~a year later). Fires once per passing anniversary; re-arms the following year. ±7 days is exact day distance; anchor never install/open date.
13. **II-13 Renaissance Life** — Heartwood · one-time (v2:217–225; spec:323–327) — ≥ **5 distinct habits** have each EVER reached a 100-day streak (abandoned streaks count — lifetime per-habit; not necessarily simultaneous, not necessarily currently active). Fire when the 5th distinct habit's 100-day mark lands. Rewards breadth of genuine self-improvement attempts across your life.
14. **II-14 Three Years, No Missing Links** — Grove · one-time per habit (v2:227–231; spec:329–333) — `consecutiveYears(Full Year One Habit passed, 3)` — habit's yearly criterion (≥300 completions within a 365-day window) in 3 consecutive, non-overlapping yearly windows. Fire per habit that achieves it (once per habit).
15. **II-15 Five Years, No Missing Links** — Grove · one-time per habit (v2:233–238; spec:335–336) — same, `consecutiveYears(…, 5)`. Guardrail (both): each year independently clears the full 300/365 bar on its own.

### 3.III — THE IRON LEDGER (gym & strength) — 28 trophies + 47 rungs
Sources: `workouts {occurredAt}`, `exercise_sets {exerciseId, mode, weightKg, reps, addedLoadKg, isImported, sessionId}`, plus strength-owner functions (E7).

**III.A First steps — 2 trophies:**
1. **III-1 First Rep Logged** — Sprout · one-time (v2:246–248; spec:353–355) — first qualifying workout (≥1 real logged set, non-imported, any exercise).
2. **III-2 The Basics** — Root · one-time (v2:250–253; spec:357–360) — a qualifying set exists for EACH of squat, bench press, deadlift, overhead press — fires when the LAST of the four first-occurrences lands (composite, tracked as one trophy).

**III.B PR ladder — 9 trophies.** PR definition (shared owner, spec:364–367): a set is a PR when its `est1RM(weightKg, reps)` (weight-mode only) exceeds the prior best est1RM for the EXACT same exercise among PRIOR NON-IMPORTED sets on earlier days. Rep-mode/bodyweight sets never PR via Epley. PRs only compare against prior non-imported sets — an imported history can't manufacture or inflate a PR.
3. **III-3 New Number** — Root · repeatable, one fire per PR event (v2:258–263; spec:369–373) — a set's est1RM > the prior best for that exercise (prior non-imported sets only). Fires the moment the new best logs in; re-arms immediately for the next higher best.
4. **III-4 Ten Times Better** — Root · one-time (v2:265–267; spec:374) — 10th lifetime PR event (across any lifts combined).
5. **III-5 Quarter Century of PRs** — Branch · one-time (v2:269–271; spec:376) — 25th lifetime PR.
6. **III-6 Fifty Beaten** — Heartwood · one-time (v2:273–275; spec:378) — 50th lifetime PR.
7. **III-7 Century of PRs** — Grove · one-time (v2:277–279; spec:380) — 100th lifetime PR.
8. **III-8 Same Lift, Ten Times Better** — Branch · one-time per exercise (v2:281–283; spec:382–384) — 10th lifetime PR on ONE specific named lift. Each exercise can fire it once.
9. **III-9 PR Season** — Branch · repeatable (v2:285–287; spec:386–388) — ≥ **3 distinct lifts** with at least one PR within the SAME calendar month (E9). Fire once per qualifying calendar month.
10. **III-10 Trifecta Week** — Heartwood · repeatable per G6 (v2:290–295; spec:390–393) — PRs on squat, bench press, AND deadlift (all three) within the same 7-day window; fires once per CLOSED qualifying window; overlapping scans never re-fire (G6).
11. **III-11 A PR Every Season** — Grove · one-time (v2:297–303; spec:395–398) — ≥ **12 distinct calendar months** each containing ≥1 PR (any lift; NOT necessarily consecutive). Fire when the 12th distinct month lands. Distinct-months count, not a streak.

**III.C Absolute weight ladders — 24 rungs, actual-lift-only (LOCK).** Template (spec:400–409): evaluate after each set write; fire the rung whose exercise matches AND `weightKg ≥ threshold AND reps ≥ 1` on a REAL logged set (weight-mode). **NO est1RM substitution, NO estimated inflation** (MMA lock: "if the log says 100kg on the bar, the 100kg trophy fires; nothing else does"). Warm-up failure/human error outside the predicate's concern — the log IS the evidence. All 24 one-time; a rung fires the first day its condition holds. (v2:305–353.) Full rung table in §4.

**III.D Bodyweight-relative — 6 trophies + 1 standards.** Metric (lock C2): `est1RM ÷ rollingAvg(bodyweight, 7 days AS OF the lift day)` — never a single raw weigh-in; same Epley owner as PRs. (v2:355–408; spec:438–466.)
12. **III-12 Bodyweight Bench** — Branch · one-time (v2:364–366; spec:443–444) — a bench set with est1RM ÷ rollingBW ≥ **1.0×**.
13. **III-13 One and a Half** — Branch · one-time (v2:368–370; spec:445) — squat set, ratio ≥ **1.5×**.
14. **III-14 Double Bodyweight Pull** — Heartwood · one-time (v2:372–374; spec:446–447) — deadlift set, ratio ≥ **2.0×**.
15. **III-15 Press Three-Quarters** — Branch · one-time (v2:376–378; spec:448) — OHP set, ratio ≥ **0.75×**.
16. **III-16 Triple Bodyweight Club** — Heartwood · one-time (v2:381–384; spec:449–451) — on a SINGLE day, the sum of that day's best est1RMs for squat + bench + deadlift ("the Total") ÷ rollingBW ≥ **3.0×**.
17. **III-17 Four Times Over** — Grove · one-time (v2:386–388; spec:452–453) — same Total ÷ rollingBW ≥ **4.0×**.
18. **III-18 Strength Standard Reached** — Branch/Heartwood/Grove · repeatable once per exercise per tier (v2:393–408; spec:455–466) — est1RM ÷ rollingBW crosses a published standard rank for that exercise. **Frozen seed (men; women ~60–70% upper / ~75–85% lower, same shape)**: bench 0.50/0.75/1.20/1.60/2.00; squat 0.75/1.00/1.65/2.20/2.75; deadlift 1.00/1.25/2.00/2.50/3.00; OHP 0.35/0.50/0.65/0.90/1.20 — ordered **Beginner, Novice, Intermediate, Advanced, Elite**. THRESHOLD-TO-RANK MAP (lock): trophy fires ONLY at ranks **Novice (Branch), Intermediate (Heartwood), Advanced (Grove)**. **Rank 1 (Beginner) and rank 5 (Elite) NEVER fire — display grades only (Coach/profile); no future pass may "fix" them in.** Every (exercise, tier) pairing fires once; one pass covers all pairings. SCOPE = 4 canonical lifts only (bench/squat/DL/OHP); barbell row ratio-display-only; non-BIG-5 ratio-only; bodyweight/rep-mode exercises NEVER touch the table. The overall level is a display-only profile grade — never a trophy, never a gate.

**III.E Bodyweight ladders — 19 rungs (rep + weighted).** Template for REP ladders (push-ups/pull-ups/dips): a rung fires when ONE single unbroken continuous set (never summed across a session) reaches ≥ threshold reps on its real day. Template for WEIGHTED rungs (R40–R43): a real logged `addedLoadKg > 0` on a real completed set of that exercise — an empty/zero-weight log never counts as "loaded." No Epley, real added load. (v2:410–452; spec:468–498.) Full rung table in §4.

**III.G Volume & consistency — 10 trophies:**
19. **III-19 Moved a Mountain** — Root → Branch → Heartwood → Grove · repeatable once per rung; the 4 rungs are ladder tiers R44–R47 (v2:456–468; spec:502–511) — **TONNAGE (lock): Σ over real weight-mode sets ONLY of `weightKg × reps`. Rep-mode/bodyweight sets contribute ZERO; addedLoadKg NEVER multiplies (a vest is not the load trophies measure); no fake kg.** Cumulative lifetime tonnage ≥ threshold: **R44 100,000kg — The Quarry Opens — Root; R45 500,000kg — The Rockslide — Branch; R46 1,000,000kg — The Mountain Moves — Heartwood; R47 5,000,000kg — The Brand — Grove.** Displays may SHOW both modes, but trophy counters stay strictly weight-mode.
20. **III-20 Heaviest Session** — Root · repeatable (v2:470–474; spec:513–516) — a single day's total tonnage (same weight-mode definition) exceeds every prior day's total (the daily record). Fires each time a new record day lands.
21. **III-21 Trimester of Iron** — Branch · repeatable (v2:476–479; spec:518–523) — **12 consecutive weeks** each containing ≥ the configured weekly-workout target workouts. A week is a calendar week (E9). **EMPTY-WEEK lock: a week with zero scheduled sessions is a FLAWED week — it breaks the run, never vacuously true** (same consequence as a logged-out-of-schedule week). Trimester's target = the weekly schedule itself; no separate target-workouts-per-week number exists or is added. Rest weeks = FREEZE: declared planned-rest week neither advances nor breaks the 12-week run, capped at ONE per run — a SECOND planned-rest week inside the same run breaks it. Off-pattern weeks (right days wrong week; wrong days right week) FAIL the week. Imports never qualify; grace never shields a missed week. Coach: one celebration line per closed run; repeats only when a new run closes. (Gamification.md:421–438)
22. **III-22 The Schedule Never Breaks** — Heartwood · repeatable (v2:481–487; spec:525–533) — workouts logged on the EXACT same weekday-set for **26 consecutive weeks** (weekday-set = which weekdays have ≥1 workout that week; the SET must match the first week's pattern). Zero off-pattern weeks. A planned-rest event ON a scheduled weekday FREEZES the slot (counts as the slot, not a break, not off-pattern); a REAL missed day (no workout AND no rest declared) = off-pattern week. **EMPTY weeks (zero scheduled sessions) = off-pattern (lock) — never vacuously true; a first empty week means no run starts until a real scheduled week; pre-pattern history doesn't count toward the 26.** The ONLY legal skip is a declared planned-rest week (cap 1 per run). Robot-consistency family.
23. **III-23 Full Cycle** — Heartwood · repeatable once per closed phase (v2:489–492; spec:535–539) — a phase entity closes with ≥ **80% of its weeks** each containing ≥1 QUALIFYING workout; **partial weeks at the phase's START/END count as weeks when they contain ≥1 qualifying workout (pin G17)**; 80% computed over the phase's spread span (startDate→endDate). Evaluated at phase close; fires once per phase.
24. **III-24 Back at It** — Branch · repeatable (v2:494–501; spec:541–546) — a workout logged after a GAP ≥ **14 consecutive days** with zero workouts, AND a PR (ANY exercise) matched or exceeded within the following **60 days** (**pin G7b — the prior PR may be ANY exercise's, not necessarily the same lift; a deadlift PR satisfies a gap behind any lift**). Fire once per gap+return cycle. No shame framing for the gap — reward entirely about the return.
25. **III-25 Thousand Sessions** — Grove · one-time (v2:503–505; spec:548–549) — 1,000th lifetime QUALIFYING workout event (non-imported).
26. **III-26 A Year on the Bar** — Ring · repeatable per anniversary (v2:507–516; spec:551–555) — `anniversaryWindow(anchor = FIRST-EVER qualifying workout, k = 1, ±7 days)` → a real workout inside the band. Fires once per passing anniversary. Mirrors One Trip Around the Sun — evidence still training near the anniversary, no unbroken-streak requirement.
27. **III-27 Three Years in Iron** — Grove · one-time (v2:518–522; spec:557–562) — 3 consecutive yearly windows (anchored at the first-ever qualifying workout) each containing ≥ **80 qualifying workouts** (≈1.5/week sustained floor; keeps an anniversary-touch from qualifying).
28. **III-28 Five Years in Iron** — Grove · one-time (v2:524–530; spec:564–565) — same over 5 consecutive anchored windows. Guardrail (both): the per-year workout-count floor is what keeps this from being satisfied by a single anniversary touch.

### 3.IV — THE FUEL LINE (nutrition & food discipline) — 14 trophies
Sources: `food_logs {items, occurredAt, isImported}` — daily totals are SUMS OF REAL LOGGED ITEMS, never a typed daily number; phase entities for target bands.

1. **IV-1 First Plate Logged** — Sprout · one-time (v2:536–538; spec:581–582) — first qualifying food-log event (≥1 real logged item).
2. **IV-2 A Month of Logging** — Root · repeatable once per streak-run (v2:540–542; spec:584–586) — **30 consecutive dayKeys** each with ≥1 qualifying food log. Fires on the 30th day of each run.
3. **IV-3 On Target** — Root · repeatable once per qualifying week (v2:544–550; spec:588–594) — at the close of a rolling 7-day window: ≥ **5 LOGGED days** in the window AND the mean of those days' real totals is inside the ACTIVE phase's calorie target band. **G14/G15: requires an active phase at window close — no active phase → no fire, ever; goal-only days without a phase never satisfy it.** Fires once per qualifying window. Weekly average with a 5/7-day logging floor, never a single-day check. (±10% band is the default under an Advanced-only knob clamped to 5–15%, Gamification.md:100–103.)
4. **IV-4 Dialed In** — Branch · repeatable once per qualifying window (v2:552–554; spec:596–600) — within a rolling **30-day window**, ≥ **20 distinct days** each hitting that day's protein target (per active-phase protein band). Fires once per qualifying rolling window.
5. **IV-5 No Deviation** — Heartwood · repeatable once per qualifying 30-day run (v2:557–564; spec:602–612) — two properties for **30 CONSECUTIVE logged days** (robot-consistency family — grace never applies): (1) each day has ≥1 qualifying food log, AND (2) each day's total-of-real-items is within **±3%** of the SAME target number (the phase's daily calorie target, fixed for the whole run — never computed day-to-day). Fires when a 30-day run completes. A single typed "daily total" line can never satisfy (real item sums only). **An UNLOGGED day is a HARD MISS, not a freeze: it breaks NoDeviation's run; the 90 days rebuild from the first day all three runs are alive, measured in LOGGED days (Gamification.md:291–293).**
6. **IV-6 Half a Year of Fuel** — Branch · one-time (v2:566–568; spec:614–616) — 180th cumulative qualifying food-log day (cumulative, NOT consecutive).
7. **IV-7 The Long Table** — Heartwood · one-time (v2:571–573; spec:618–619) — 1,000th cumulative qualifying food-log day.
8. **IV-8 Paced Bulk** — Heartwood · repeatable once per closed phase (v2:575–577; spec:621–628).
9. **IV-9 Paced Cut** — Heartwood · repeatable once per closed phase (v2:575–577; spec:621–628).
   - TRIGGER (both, identical shape): at phase close, the weekly rolling-average weight change stayed inside the phase's pace band for ≥ **80% of the phase's NON-THIN weeks**. **THIN-WEEK pin (G16): a week with <5 valid logged weigh-in days counts NEITHER for NOR against the ratio — the 80% is computed over non-thin weeks only.**
10. **IV-10 Broke the Plateau** — Heartwood · repeatable once per stall→recovery cycle (v2:580–588; spec:630–638) — **stallRule (the ONE named rule, shared with Coach)**: **4 consecutive weekly deltas** of the rolling-average weight OUTSIDE the phase's progress direction (bulk: < +0.1kg/week; cut: > −0.1kg/week) — the stalled run; THEN **2 consecutive weekly deltas** back INSIDE the pace band — the confirmed recovery. Fires ONCE when the recovery confirms; never twice for the same stall. Requires both the stall (real, sustained, measured on rolling averages) and the confirmed recovery — can't be triggered by noise in either direction.
11. **IV-11 Both Directions** — Grove · one-time (v2:590–597; spec:640–644) — at least one closed BULK phase AND at least one closed CUT phase each independently satisfying Full Cycle (≥80% of weeks with qualifying workouts). Fires when the second such closed phase exists. No partial credit for one direction alone; two fully separate closed-phase records.
12. **IV-12 The Turn** — Branch · one-time (v2:599–603; spec:646–649) — the FIRST phase entity of type "cut" is created whose start date immediately follows a CLOSED "bulk" phase (no intervening phase of another type; adjacency, not overlap). Fire once.
13. **IV-13 Three Years on the Line** — Grove · one-time (v2:605–608; spec:651–657) — `yearlyPass(food criterion: ≥250 DISTINCT qualifying food-log days per window, anchor = first qualifying food-log day)` — 3 consecutive windows must pass. Fire once at chain completion.
14. **IV-14 Five Years on the Line** — Grove · one-time (v2:610–612; spec:652–657) — same, 5 consecutive windows.

### 3.V — THE SHAPE OF THINGS (body & weight tracking) — 16 trophies
Sources: `body_metrics {type, value, occurredAt, isImported}`, phase entities. All rolling-average reads = 7-day rolling mean (O3 owner); all confirmations = 2 consecutive weekly checkpoints on that rolling mean (never a single reading).

1. **V-1 First Measurement** — Sprout · one-time (v2:618–620; spec:670–671) — first qualifying body-metric entry.
2. **V-2 Steady Hand** — Root · repeatable (v2:622–627; spec:673–678) — a weigh-in on the SAME WEEKDAY for **12 consecutive weeks**, no missed week. Weekday anchored to the FIRST qualifying weigh-in of the run (**G18**); every later weigh-in on that exact weekday. Run breaks on a miss; re-anchors at its own first weigh-in; uses occurredAt declared time.
3. **V-3 Same Hour, Same Scale** — Heartwood · repeatable (v2:629–638; spec:680–685) — **26 consecutive weeks** with a weigh-in on the same weekday AND within ±30 minutes of the run's anchor clock slot — BOTH anchored to the run's first qualifying weigh-in (**G18 + G1**). Any outside → run breaks. Uses the declared occurredAt time (E8). Tightens Steady Hand's weekday-only rule to weekday AND time-of-day — not a rounding-up of the looser one. Robot-consistency family.
4. **V-4 Real Progress** — Branch · repeatable once per milestone (v2:640–647; spec:687–692) — the 7-day rolling average crosses a cumulative net-change milestone from the ACTIVE phase's starting rolling average, CONFIRMED at ≥2 consecutive weekly checkpoints. **G14: only within an active phase — no active phase → no fire, ever.** **Ledger pin (Gamification.md:95–99): trophies fire on net change from the phase's STARTING rolling average, in the goal direction only, at 4 stepped repeatable thresholds: +2.5 kg / +5 kg / +10 kg / +20 kg, with 1-week rolling confirmation.** (Note: v2/spec name no explicit kg steps; the ledger supplies them — ledger decides.)
5. **V-5 Then and Now** — Branch → Heartwood → Grove · repeatable once per milestone (v2:649–653; spec:694–698) — two physique-timeline-tagged photos with a REAL capture gap: ≥ **6 months (Branch)** / ≥ **1 year (Heartwood)** / ≥ **3 years (Grove — pin G3: the third threshold is 3 years)**.
6. **V-6 Eyes on the Data** — Branch · repeatable once per milestone (v2:655–662; spec:701–706) — a physique-timeline photo logged inside ANY 7-day band **CONTAINING** the day a weight-gain milestone (V-10..V-16) is first confirmed (**containment, not centering — pin G13; no D−3…D+3 requirement**). Both halves must independently be qualifying events on their own days.
7. **V-7 Frame by Frame** — Heartwood · one-time (v2:664–667; spec:708–711) — a physique-timeline photo in ≥ **6 CONSECUTIVE real calendar months** (at least one per month, no gap month). **G11: calendar months 1st–month-end; a photo logged April 30 cannot fill March.**
8. **V-8 Three Years in Frame** — Grove · one-time (v2:669–673; spec:713–717) — `yearlyPass(body criterion: ≥40 DISTINCT calendar weeks per window each with ≥1 qualifying weigh-in; anchor = first qualifying weigh-in ever)` — 3 consecutive windows. Roughly Steady Hand's cadence, sustained.
9. **V-9 Five Years in Frame** — Grove · one-time (v2:675–677; spec:714–717) — same, 5 consecutive windows. Fire once at completion.
10. **V-10 Six Kilos In** — Root · one-time (v2:710–713; spec:720) — 7-day rolling average bodyweight ≥ **70kg**, confirmed at ≥2 consecutive weekly checkpoints.
11. **V-11 Seventy-Five** — Root · one-time (v2:715–717; spec:721) — ≥ **75kg**, same confirmation.
12. **V-12 Eighty** — Branch · one-time (v2:719–721; spec:722) — ≥ **80kg**.
13. **V-13 Eighty-Five** — Branch · one-time (v2:723–725; spec:723) — ≥ **85kg**.
14. **V-14 Ninety** — Heartwood · one-time (v2:727–729; spec:724) — ≥ **90kg**.
15. **V-15 Ninety-Five** — Heartwood · one-time (v2:731–733; spec:725) — ≥ **95kg**.
16. **V-16 The Estimated Ceiling** — Grove · one-time (v2:735–740; spec:726–729) — rolling avg ≥ **100kg**, same confirmation. **Guardrail (all seven V-10..V-16): 7-day rolling average only, confirmed at ≥2 consecutive weekly checkpoints — a single heavy weigh-in (post-meal, post-water-loading) can never trigger.**
    - Ladder origin math (v2:679–708): starting point on record **190cm, 64kg**; FFMI-25 heuristic → FFM_max ≈ 90.25kg → natural-potential ceiling ≈ 98–103kg at 8–12% bodyfat ("~100kg"). Deliberately framed as "estimate," not a promise. If wrist/ankle data ever lands, The Estimated Ceiling could be recomputed with a Casey Butt-style formula (NOT gospel; v2:1047–1056).
    - **Weight ladder = v2 trophy thresholds (Gamification.md:104–108): system weight milestones are the v2 weight-gain ladder: 70 · 75 · 80 · 85 · 90 · 95 · 100 kg, confirmed by the 7-day rolling average across TWO consecutive weekly checkpoints. Weight goals insert INTO this ladder — a goal's threshold is a ladder value, never bespoke; trophy and goal close on the same number.**

### 3.VI — ELSEWHERE (vacations & time-off) — 4 trophies
Sources: `periods {type = vacation, startDate, endDate}`.
1. **VI-1 Off the Grid** — Sprout · one-time (v2:746–748; spec:739–740) — first logged vacation period with duration ≥ **7 days**.
2. **VI-2 Took the Time** — Root · repeatable once per anchored yearly window (v2:750–757; spec:742–750) — cumulative vacation days inside a 365-day window (anchor = first-ever vacation day) cross the configured healthy-balance threshold (**default 14 days/year, user-editable**). Day counting = **DAY-LEVEL UNION (E-clash #5 lock): a calendar day inside ≥1 overlapping vacation range counts AT MOST ONCE; overlapping ranges never inflate.** Purely positive framing — no reverse "didn't rest enough" achievement exists.
3. **VI-3 Still Here, Even Here** — Root · repeatable (v2:759–762; spec:752–755) — a qualifying journal entry logged on a day inside an active vacation range. Fires once per qualifying vacation period (min 1 per period). Entirely optional — no pressure framing; lets the system not punish normal pauses by omission.
4. **VI-4 Somewhere Else, Still You** — Branch · repeatable (v2:764–768; spec:757–760) — within ONE active vacation period, at least one qualifying journal entry AND at least one qualifying vlog, both on days inside the range. Fires once per period. Two-domain same-day join (journal + vlog-in-trip).

### 3.VII — PROOF OF LIFE (media archive: vlogs & photos) — 12 trophies
Sources: `media_attachments {type, durationSec, capturedAt, isImported, adopted}` (vlog = kept media item). "Qualifying vlog" = a kept vlog (captured through the pipeline OR adopted — M6 lock; an adopted FIRST vlog fires Rolling Tape). Duration = stored field, measured ONCE at intake (M2 lock).
1. **VII-1 Rolling Tape** — Sprout · one-time (v2:774–776; spec:774–775) — first KEPT vlog — captured OR adopted (M6).
2. **VII-2 Behind the Scenes** — Root · one-time (v2:778–779; spec:777–778) — first qualifying vlog with duration ≥ **10 minutes**.
3. **VII-3 A Week on Camera** — Root · repeatable once per streak-run (v2:784–786; spec:780–781) — **7 consecutive dayKeys** each with ≥1 qualifying vlog.
4. **VII-4 A Hundred Days on Camera** — Heartwood · repeatable once per streak-run (v2:788–790; spec:783–785) — **100 consecutive dayKeys** each with ≥1 qualifying vlog.
5. **VII-5 Full Orbit, on Camera** — Ring · repeatable once per anchored yearly window (v2:792–795; spec:787–791) — `yearlyPass(media criterion: ≥300 DISTINCT days per 365-day window with ≥1 qualifying vlog; anchor = first qualifying vlog ever)`. Fires when a window passes.
6. **VII-6 The Full Reel** — Grove · one-time (v2:797–799; spec:793–794) — 1,000th lifetime qualifying vlog (non-imported).
7. **VII-7 The Archive Grows** — Root → Branch → Heartwood → Ring → Grove · repeatable once per threshold (v2:801–805; spec:796–800) — cumulative duration (sum of durationSec across all non-imported qualifying vlogs) ≥ **10h / 50h / 100h / 500h / 1,000h**. Fire once per threshold crossed.
8. **VII-8 One Year, Same Day** — Heartwood · repeatable (v2:807–810; spec:802–806) — a qualifying vlog whose month-day matches another qualifying vlog's month-day from exactly **1 year prior** (month-day matcher tolerance **±1 day**, leap-day handled inside). Both vlogs real and independently qualifying on their capture dates.
9. **VII-9 Half a Decade, Same Day** — Grove · one-time (v2:812–819; spec:808–810) — same month-day match but against a qualifying vlog from exactly **5 years prior**.
10. **VII-10 The Long Take** — Branch · one-time (v2:821–823; spec:812–813) — first qualifying vlog with duration ≥ **60 minutes**.
11. **VII-11 Three Years of Proof** — Grove · one-time (v2:825–828; spec:815–819) — `yearlyPass(media criterion = Full Orbit on Camera bar: ≥300 qualifying days per window)` — 3 consecutive windows. Fire once at chain completion.
12. **VII-12 Five Years of Proof** — Grove · one-time (v2:830–833; spec:816–819) — same, 5 consecutive windows.

### 3.VIII — THE RINGS (longevity & time) — 20 trophies
Engine: the account's REAL anchor date = occurredAt of the FIRST-EVER non-imported event across all domains (never install/open; a reinstall can't fabricate an earlier anchor).
1. **VIII-1 One Year In** — Ring · one-time (v2:839–845; spec:831–835) — ≥ **365 days** since the real anchor, AND qualifying activity (any domain) in ≥ **3 distinct domains** within ≥ **9 of the 12 calendar months** after the anchor.
2. **VIII-2 Two Years** — Ring · one-time (v2:847–850; spec:837–842) — N years since the real anchor, AND qualifying activity in ≥ **75% of the months since** (2yr = 18/24 mo — floor of 0.75 × months, real month count).
3. **VIII-3 Five Years** — Grove · one-time (v2:847–850; spec:838–842) — same anchor logic; ≥75% of months (5yr = **45/60**).
4. **VIII-4 Ten Years** — Grove · one-time (v2:847–850; spec:839–842) — same; ≥75% (10yr = **90/120**). Tier: Grove, highest.
5. **VIII-5 Life, Fully Logged** — Heartwood · repeatable once per anchored yearly window (v2:852–855; spec:844–851) — within one 365-day window (anchor = real anchor date): **all SIX domains each have ≥1 qualifying non-imported entry** (journal, habits, fitness, nutrition, body, media). Fires when a window passes (yearlyPass criterion = six-domain bar). **Rings count = the number of windows that ever passed — a missed year never removes an existing ring; rings are count-based and stack FOREVER; every year clearing the full six-domain bar brands one ring; gaps never erase (Gamification.md:245–249).**
6. **VIII-6 A Week, Whole** — Branch · repeatable (v2:857–863; spec:853–856) — within ONE ISO calendar week (Mon–Sun, **pin G10 — never drifts with the review-day or week-start setting**), all six domains each have ≥1 qualifying non-imported entry. Fire once per qualifying ISO week. The achievable, repeatable weekly cousin of Six for Six and Life, Fully Logged.
7. **VIII-7 The Three-Year Vow** — Grove · one-time (v2:865–869; spec:858–860) — six-domain bar (Life, Fully Logged criterion) passes in **3 consecutive** anchored yearly windows.
8. **VIII-8 The Five-Year Vow** — Grove · one-time (v2:871–877; spec:862) — **5 consecutive**. Guardrail (both): each year must independently clear the full six-domain bar on its own — "**this is the hardest achievement in the system to fake**, since it compounds every other domain's guardrails at once, every year, for years running" (v2:875–877).
9. **VIII-9 Old Growth** — Grove · one-time (v2:879–886; spec:864–867) — six-domain bar passes in **10 CONSECUTIVE anchored yearly windows, ANYWHERE in history** (once-existed run of 10; not necessarily current). "The ceiling achievement of the entire system. Growth Rings deliberately has no tier above Grove — this is what 'as high as the system goes' looks like when it actually happens: a decade where every domain, every year, was real."
10. **VIII-10 Ouroboros** — Grove · one-time (v2:888–907; spec:869–874) — the same 10-consecutive rule but judged as a **STREAK, not once-history**: a failed window ANYWHERE **restarts the count at zero**; any 10 consecutive qualifying windows closes the attempt. Once earned, never taken back; a gap before reaching 10 only resets the attempt; a single rested/missed window restarts the count at zero; a gap is not permanent death — any 10 consecutive qualifying years fire (Gamification.md:247–249). Deliberate twin of Old Growth with restart semantics. "Rings hold forgiveness; the Ouroboros holds the streak truth."
11. **VIII-11 Pith** — Sprout · one-time (v2:909–914; spec:876) — rings ≥ **1 ever** (ring = a Life, Fully Logged qualifying yearly window, per ring rules).
12. **VIII-12 Medullary Ray** — Root · one-time (v2:916–918; spec:877) — rings ≥ **2**.
13. **VIII-13 Oak** — Branch · one-time (v2:920–924; spec:878) — rings ≥ **3**. "3 rings mark the tree grown up, a robust core." Ring count is pure lifetime total regardless of when rings landed.
14. **VIII-14 Sapwood** — Branch · one-time (v2:926–928; spec:879) — rings ≥ **4**.
15. **VIII-15 Ironwood** — Heartwood · one-time (v2:930–934; spec:880) — rings ≥ **5**. "At 5 rings the wood turns iron — half a decade, gaps allowed, still counted."
16. **VIII-16 Cambium** — Heartwood · one-time (v2:936–938; spec:881) — rings ≥ **6**.
17. **VIII-17 Latewood** — Ring · one-time (v2:940–942; spec:882) — rings ≥ **7**.
18. **VIII-18 Phloem** — Ring · one-time (v2:944–946; spec:883) — rings ≥ **8**.
19. **VIII-19 Cork** — Ring · one-time (v2:948–950; spec:884) — rings ≥ **9**.
20. **VIII-20 Yew** — Grove · one-time (v2:952–959; spec:885) — rings ≥ **10**. "The ancient tree — a full decade of fully-logged years, no consecutive requirement, rings never unring; permanence is the point. The final trophy of the ring series: like a real tree, a year that wasn't fully logged simply adds no ring — nothing is taken from what came before."

### 3.IX — FULL CIRCLE (cross-domain / integration) — 5 trophies
1. **IX-1 Full Circle Day** — Sprout → Root → Branch → Heartwood → Ring · repeatable: first occurrence (Sprout), then count milestones **10 / 50 / 100 / 365 lifetime** (v2:965–969; spec:897–904) — a single dayKey with ≥1 qualifying, non-imported entry in **journal, habits, gym, AND nutrition simultaneously** (four domains). Count = **DISTINCT qualifying days (pin G4)** — a day with multiple qualifying entries still counts once; never entry-total multiplicity. Fires at the first day and at each count milestone.
2. **IX-2 Six for Six** — Grove · one-time (v2:971–974; spec:906–909) — a single dayKey with ≥1 qualifying non-imported entry in **ALL SIX domains at once** (journal, habits, gym, nutrition, body, media). Fire once.
3. **IX-3 The Living Archive** — Grove · repeatable once per qualifying anchored yearly window (v2:977–981; spec:912–919) — ONE shared 365-day window (**pin G9: anchored at the app's GLOBAL start anchor — first-ever non-imported event, ANY domain**) in which ALL THREE hold concurrently: **≥200 qualifying journal entries AND ≥100 qualifying vlogs AND ≥100 qualifying workouts**. Fires when the window closes with all three true.
4. **IX-4 Wrote It Down** — Root → Branch → Heartwood · repeatable: first occurrence then count milestones **10 / 50** (v2:983–990; spec:921–926) — a qualifying journal entry (≥40 words) AND a gym PR (New Number, III-3) logged on the SAME dayKey. Count = DISTINCT qualifying days (pin G4). Both halves independently real — rewards the habit of reflecting on the moments that matter, not either event alone.
5. **IX-5 Ghost in the Machine** — Grove · one-time (v2:992–1003; spec:928–933) — **Like Clockwork (any habit), The Schedule Never Breaks, and No Deviation are ALL independently active at once, overlapping within the same 90-day span** (their runs coincide for ≥90 days). Fires when the three-way overlap first completes 90 days. "The capstone of the whole robot-consistency family — the same 30-minute window, the same weekday pattern, the same calorie count, running in parallel for three straight months. Equal parts admirable and slightly unsettling."
    - **Engine (Gamification.md:277–295):** three independent robot-consistency runs, all alive at once, 90 consecutive days, overlapping: `runAlive(component, dayKey)` (Clock = in-window completion streak unbroken, ~30-min window; Schedule = weekday-pattern run unbroken; NoDeviation = ±3%-vs-daily-target run unbroken, measured in LOGGED qualifying days; alive from the moment it exists and is unbroken — no trophy-earned requirement) plus `robotOverlapWindow()`: a rolling 90-day window where EVERY day has all three runs alive; evaluated after a relevant write (journal/workout/food/habit event), never timer/render; one read, one fire.
    - **Semantics:** lookback is ONE-SHOT — retroactive credit valid the first time the check runs, permanently silent once Ghost fires (fires from the EARLIEST qualifying day; no re-fire/re-arm/re-scan). **NO GRACE — the robot family is exempt.** An UNLOGGED day is a HARD MISS, not a freeze: it breaks NoDeviation's run; the 90 days rebuild from the first day all three runs are alive, measured in LOGGED days. Planned rest FREEZES a run but does not count as an alive day. Imports never qualify. Coach: celebration line once; no repeat congrats.

---

## 4. THE RUNG SYSTEM — ALL 47 RUNGS (R1–R47)

### 4.1 Absolute-lift ladders — 24 rungs, actual-lift-only (spec:411–436; v2:313–353)
Condition for ALL: `weightKg ≥ threshold AND reps ≥ 1` on a REAL logged set (weight-mode); NO est1RM substitution, no inflation; one-time, first day condition holds.

| Rung | Exercise | Threshold | Name | Tier | Source |
|---|---|---|---|---|---|
| R1 | bench | 60kg | First Press | Root | spec:413 |
| R2 | bench | 80kg | Two Plates Deep | Root | spec:414 |
| R3 | bench | 100kg | Century Bench | Branch | spec:415 |
| R4 | bench | 120kg | Heavy Iron | Heartwood | spec:416 |
| R5 | bench | 140kg | The Furnace | Grove | spec:417 |
| R6 | squat | 80kg | First Descent | Root | spec:418 |
| R7 | squat | 100kg | Century Squat | Root | spec:419 |
| R8 | squat | 140kg | The Foundation | Branch | spec:420 |
| R9 | squat | 180kg | Bedrock | Heartwood | spec:421 |
| R10 | squat | 220kg | The Monolith | Grove | spec:422 |
| R11 | deadlift | 100kg | Ground Zero | Root | spec:423 |
| R12 | deadlift | 140kg | The Pull | Root | spec:424 |
| R13 | deadlift | 180kg | Iron Harvest | Branch | spec:425 |
| R14 | deadlift | 220kg | The Reckoning | Heartwood | spec:426 |
| R15 | deadlift | 260kg | Dragon Slayer | Grove | spec:427 |
| R16 | OHP | 40kg | First Overhead | Root | spec:428 |
| R17 | OHP | 60kg | Skyward | Branch | spec:429 |
| R18 | OHP | 80kg | The Crown | Heartwood | spec:430 |
| R19 | OHP | 100kg | Atlas Press | Grove | spec:431 |
| R20 | curl | 20kg | First Curl | Root | spec:432 |
| R21 | curl | 30kg | Gun Show | Root | spec:433 |
| R22 | curl | 40kg | Peak Contraction | Branch | spec:434 |
| R23 | curl | 50kg | Iron Grip | Heartwood | spec:435 |
| R24 | curl | 60kg | Cast Iron Arms | Grove | spec:436 |

### 4.2 Bodyweight ladders — 19 rungs (rep + weighted) (spec:474–498; v2:418–452)
REP rungs (R25–R39): fires when ONE single unbroken continuous set (never summed across a session) reaches ≥ threshold reps on its real day. WEIGHTED rungs (R40–R43): a real logged `addedLoadKg > 0` on a real completed set — an empty/zero-weight log never counts as "loaded"; no Epley, real added load.

| Rung | Exercise | Threshold | Name | Tier | Source |
|---|---|---|---|---|---|
| R25 | push-ups | 20 reps | Warm Floor | Root | spec:476 |
| R26 | push-ups | 50 reps | Fifty Push-Ups | Root | spec:477 |
| R27 | push-ups | 100 reps | Century Push | Branch | spec:478 |
| R28 | push-ups | 150 reps | Gazelle Pace | Heartwood | spec:479 |
| R29 | push-ups | 200 reps | Dempsey Roll | Grove | spec:480 |
| R30 | pull-ups | 5 reps | First Chin | Root | spec:481 |
| R31 | pull-ups | 10 reps | Ten Clean | Root | spec:482 |
| R32 | pull-ups | 20 reps | Twenty Strict | Heartwood | spec:483 |
| R33 | pull-ups | 30 reps | Thirty and Counting | Heartwood | spec:484 |
| R34 | pull-ups | 50 reps | The Long Ascent | Grove | spec:485 |
| R35 | dips | 20 reps | First Dip | Root | spec:486 |
| R36 | dips | 40 reps | Forty Deep | Root | spec:487 |
| R37 | dips | 60 reps | Sixty Strong | Branch | spec:488 |
| R38 | dips | 80 reps | Eighty and Steady | Heartwood | spec:489 |
| R39 | dips | 100 reps | Century Dip | Grove | spec:490 |
| R40 | pull-ups | >0kg added | Loaded Up | Branch | spec:491 |
| R41 | pull-ups | 20kg added | Added Iron | Heartwood | spec:492 |
| R42 | pull-ups | 40kg added | Beyond Bodyweight | Grove | spec:493 |
| R43 | dips | >0kg added | Loaded Dip | Branch | spec:494 |

### 4.3 Tonnage rungs — 4 rungs (Moved a Mountain, III-19) (spec:508–511; v2:462–465)
Cumulative lifetime tonnage (weight-mode sets only: Σ weightKg × reps; rep-mode/bodyweight contribute 0; addedLoadKg never multiplies):

| Rung | Threshold | Name | Tier | Source |
|---|---|---|---|---|
| R44 | 100,000kg | The Quarry Opens | Root | spec:508 |
| R45 | 500,000kg | The Rockslide | Branch | spec:509 |
| R46 | 1,000,000kg | The Mountain Moves | Heartwood | spec:510 |
| R47 | 5,000,000kg | The Brand | Grove | spec:511 |

**Rung census check:** 24 + 19 + 4 = **47 rungs** ✓ (matches spec census:49–50).

---

## 5. RARITY STRUCTURE

### 5.1 Growth Rings — the six-tier rarity ladder (v2:8–24; the ONLY tier system in the live catalog)
- **Sprout** — a first: the first time you did the thing at all.
- **Root** — the thing took hold: short but real consistency (weeks, not days).
- **Branch** — the thing extended somewhere new: a new domain, a new personal best, a new kind of entry.
- **Heartwood** — the thing became structural: it's been true for months, it's load-bearing now, it'd be strange if it stopped.
- **Ring** — a full year passed and the thing was still true. Literally one ring per year, like the tree.
- **Grove** — multi-year, decade-scale, or genetically-ceiling-tier. The rare, quiet, huge ones.

**Coach loudness by tier (Gamification.md:458–464):** ONLY Ring and Grove receive Coach appreciation — one sincere derived line; ALL other tiers (Sprout / Root / Recognition / Heartwood) are a silent in-game toast with no Coach speech. One Coach line AT MOST per trophy fire; celebrations fire once per run/landing, never repeat congratulations; respect quiet-week and facts-only privacy rules; ride the auto-written, deletable coach_outputs machinery.

**Tier distribution across the 131 trophies (approximate, by tier labels):** Sprout ~8 (I-1, II-1, III-1, IV-1, V-1, VI-1, VII-1, VIII-11), Root ~30, Branch ~34, Heartwood ~34, Ring ~12, Grove ~33 (multi-tier trophies counted per top tier; e.g., Novel-Length Life counts as Grove-family). **Note for rarity ladder: multi-tier trophies (e.g., Novel-Length Life Root→…→Grove; The Archive Grows Root→…→Grove; Moved a Mountain Root→…→Grove) fire SEPARATELY at each tier as their thresholds cross — each tier-step is its own rarity event.**

### 5.2 Reward classes (from SUPERSEDED TEMP-PLANNING-Achievements.md:28–38 — no numbers, M2 opens at the tap)
- **BADGE** = the trophy/icon itself is the reward (no XP). Used for identity/consistency trophies where XP would double-count habit XP.
- **SMALL** = matches the ownership "small" XP tier (like journal entry).
- **MEDIUM** = roughly a workout-type reward; used sparingly.
- **LARGE** = milestone-class reward.
- **RARE** = very-large goal-completion-class reward; sparse.
- Note: none of this changes the locked XP table; achievements OVERLAY it.

### 5.3 Explicit "rarest" statements in the docs (difficulty structure — see §8)

---

## 6. STREAK MECHANICS (Gamification.md:77–121)

- **Tracked per habit and per Life Area** (area streak = any qualifying action that day).
- **Streak data derives from the event log, never stored independently as user-editable state.**
- **Weekly checkpoint** — the rolling-average evaluation runs at the CLOSED calendar week (Sunday), once per week. **Thin weeks (fewer than 5 of 7 logged weigh-in days) neither confirm nor reset anything.** Weight-ladder and Real Progress confirmations read the **two most recent consecutive non-thin weeks' checkpoints**.
- **Fully-logged day** — two valid paths, one concept: a routine-active day counts when **kcal are within ±10% of the day's target AND the planned meal types were logged**; a no-routine day counts when **kcal are within ±10% AND ≥2 actual meal logs exist**. Streaks work from day one, before any routine setup. **The window is ONE number (±10%; the old ±20 tolerance is superseded — both paths use ±10%)**. The weekly check-in reports the actual average daily deviation (e.g. "~180 kcal above target") so precision lives in the verdict, not the badge.
- **Real Progress** — see §3.V V-4 (trophies fire on net change from phase's STARTING rolling average, goal direction only, at +2.5 / +5 / +10 / +20 kg, 1-week rolling confirmation; fires ONLY inside an active phase).
- **On Target** — weekly average (5/7-day floor) must sit inside **±10% of the day's target — the SAME ±10% band as the fully-logged window; one number used by both**. ±10% is the default under an Advanced-only knob clamped to 5–15%. Fires ONLY inside an active phase.
- **Weight ladder** — see §3.V (70 · 75 · 80 · 85 · 90 · 95 · 100 kg, confirmed by 7-day rolling average across TWO consecutive weekly checkpoints; weight goals insert into this ladder).
- **Grace** — forgiveness budget of **1 grace day per 7-day window, default 1, editable as a setting**; per-window so it cannot stack endlessly; **ONE shared budget across all habits**; applies everywhere (habit streaks and life-area streaks). History stays true: a missed day is still recorded as a miss; grace only prevents the streak break. **Grace is the ONLY finite streak shield — quiet weeks never shield streaks.** **Grace NEVER shields a robot-consistency run: a missed day there breaks the run.** Planned rest applies to robot-consistency runs as a freeze.
- **Perfect Month is not grace-able** — grace covers streaks only. Perfect Month requires every calendar day logged (28–31 / 31 real log days); a grace-covered miss leaves that day empty, so the trophy does NOT fire.
- **Zero-XP consistency marker** — a soft "N days fully logged" marker on the dashboard, built from the fully-logged-day definition. **No XP.**
- **Streak-relevant primitives:** `dayDomainPresence` (Gamification.md:190–197; boolean per domain {journal, habits, fitness, nutrition, body, media} with real-content floor and importless exclusion inside the predicate; imported-heavy days never paint "full"); the yearly meta-streak primitive (`yearlyPass` + `consecutiveYears`, Gamification.md:238–244); the anniversary window (Gamification.md:250–257); the re-fire map (Gamification.md:264–271).
- **"2-day rule":** NO literal 2-day rule exists in the four achievement sources. The nearest equivalents: (a) the grace budget (1 day per 7-day window), and (b) the research heritage — `research-lifeos/01-goals-tasks.md:122,479` documents the "2-day rule"-style grace from Streaks as design inspiration ("finite grace (Streaks' 2-day rule) rather than infinite rescheduling"; Lally et al. 2010 evidence). The achievement system implements grace as 1 day per 7-day window — strictly finite, shared across habits, never stacking.

---

## 7. XP / TROPHY ECONOMICS

### 7.1 XP sources (LOCKED, Gamification.md:14–30)
| Action | XP | Why it qualifies |
|---|---|---|
| Habit completed (on plan) | X per habit | consistency is the core value |
| Milestone completed | large bonus | meaningful progress |
| Goal completed | very large bonus | the rarest, most meaningful |
| Journal entry with content (word-count threshold, e.g. **≥20 words**) | small | documentation is a core loop step; capped — see Anti-Farming |
| Media captured with an entry | small | life documentation; rides the journal cap |
| PR (real session, per exercise) | small | meaningful progress; milestone tiers **1st/5th/10th**; size-weighted — **a +≥2.5 kg est-1RM gain counts, micro-PRs do not**; zero XP for logging itself; growth displays are the centerpiece |

- **REMOVED (D050 / L173): the "Weekly review completed" row.** Reviews never give XP — the weekly review loses its small-XP reward; the milestone review gets none either; all reviews are earned-honor-only. (Gamification.md:25–27)
- XP amounts are small by design. **Exact numbers are fixed at M2 and are NOT offered as settings toggles.**
- **NOT XP sources (Gamification.md:32–40):** opening the app; browsing screens; empty/blank journal saves; restoring old streaks artificially; logging itself (logging a set records history; it does not mint XP); **Trophies/achievements — they grant ZERO XP**; imported content — imports show history, never earn.

### 7.2 Anti-Farming Rules (Gamification.md:42–75)
1. **Capped streak bonuses** — no endless escalation. A bonus can grow within a week, but weekly; there is no infinite multiplicative curve. Farming "one micro-habit" to pump XP is capped by per-habit XP ceilings.
2. **Content-gated journal XP** — XP only for entries with real content (word-count threshold + at least one meaningful field). **At most the FIRST 2 content-gated entries per day earn XP** (caps the faucet; a genuine 3rd entry simply earns 0). **Media XP is awarded once per entry and is bounded by the same journal cap** — photos beyond an entry never mint XP; there is no standalone media faucet.
3. **No XP for logging retroactively in bulk** — events carry timestamps; only check-ins recorded on their actual day contribute to streak/XP bonuses.
4. **XP is a signal, not a score to farm** — levels exist for a sense of progression, but the Coach never uses XP to judge the user.
5. **Auto-tick is real — but only when the session is real** — an auto-ticked habit (from a workout session save) counts as a REAL completion with full XP, exactly like a manual completion, ONLY when the triggering session passes the same anti-cheat gate as everything else. A revoked tick (session deleted) returns its XP via the compensating `habit.completed_revoked` event — no double-earn, no delete-log cycles. Lives in the shared anti-farming gate, not per-screen.
6. **XP reversal is symmetric** — any auto-tick revoke or journal-invalidation that returns XP is written as a NEGATIVE XP event (additive reverse), never a deletion or retroactive edit. The event log keeps both sides so totals and history always reconcile; no re-derivation, no repair jobs.
7. **Imports never earn** — the `imported` flag is global on every importable entity row from the start. **Every derived owner and achievement predicate filters imported rows internally** (part of the contract); the 3-question anti-cheat gate rejects any import that would raise or trigger a trophy. Imports show history, never earn.
8. **XP caps kill faucets** — the journal cap (first 2 content-gated entries/day), the media cap (rides the journal cap), and the small, size-gated PR XP exist so no single activity becomes an XP pump.

### 7.3 Trophy claim mechanics
- **Trophy face = modal "trophy". One claim per record unless marked REPEATABLE with the exact repeat cadence** (TEMP-PLANNING-Achievements.md:25–26; spec:42–43). Repeat cadences: per-run, per-window, per-year, per-habit, per-threshold, per-phase, per-anniversary, once-per-exercise/tier pairing — each spelled out per trophy in §3.
- **Trophies grant ZERO XP** (Gamification.md:39, 163; spec rule 1: "NO XP VALUES. A trophy is its own reward.").
- Every trophy fire emits ONE `achievement.unlocked` event (transactional, single event API); Coach consumes it as recognition material only.
- Levels: curve defined at M2; must be simple (no asymptotic curves). Level thresholds are NOT settings toggles.

### 7.4 Governing rules that carried over from the superseded draft (TEMP-PLANNING-Achievements.md:9–26, per Gamification.md:152–156)
1. NO XP VALUES — a trophy is its own reward; numbers live ZERO in the spec.
2. Every trophy passes the 3-question anti-cheat gate: **real? on its actual day? real content/effort?** (wrongful = cancelled at design time).
3. Derived-only — computed from real history via H3 owner functions; never announced by single events (workout.pr), never user-editable, never "buyable."
4. No trophies for: opening the app, browsing, empty entries, retroactive/bulk logging, XP-farming, anything cosmetic.
5. Imported journal rows NEVER count toward any trophy (J3 flag).
6. Icons: NOT designed in planning — "cool icon" art designed at implementation time; ICON column is a placeholder keyword only.
7. One claim per record unless REPEATABLE with the exact repeat cadence.

---

## 8. THE ACTUAL DIFFICULTY STRUCTURE — hardest families per the docs

**The docs name THREE hard clusters explicitly:**

1. **The robot-consistency family — the strictest, least forgiving in the catalog** (v2:1121–1134; Gamification.md:277–295): **Same Time, Every Time (I-4, 60 days); Like Clockwork (II-9, 90 completions); The Schedule Never Breaks (III-22, 26 weeks exact weekday-set); Same Hour, Same Scale (V-3, 26 weeks weekday+slot); No Deviation (IV-5, 30 consecutive ±3% logged days); plus the capstone Ghost in the Machine (IX-5, 90-day three-way overlap).** Characteristics: **no honest-gap tolerance, no rolling averages, no "close enough"; NO GRACE (the robot family is exempt); an UNLOGGED day is a HARD MISS, not a freeze; only a user-declared planned rest FREEZES a run without breaking it** (rest = intent, grace = forgiveness; the family accepts the first, never the second). Deliberately not commonly earned; opt-in territory for routine-as-identity personalities.
2. **The Vow/Old Growth cluster — "deliberately the rarest things in the whole system"** (v2:1136–1147): **The Three-Year Vow (VIII-7), The Five-Year Vow (VIII-8), Old Growth (VIII-9, 10 consecutive six-domain years anywhere in history), Ouroboros (VIII-10, 10 consecutive years judged as a live streak with restart semantics)**. The Five-Year Vow guardrail calls them "**the hardest achievement in the system to fake**" — compounds every other domain's guardrails at once, every year, for years running (v2:874–877). Old Growth = "the ceiling achievement of the entire system" (v2:882–886).
3. **Ghost in the Machine (IX-5)** — Grove capstone: "three already-guarded, independently-real achievements to overlap — nothing new to fake here, just three hard things all being true on the same 90 real days. The odds of that happening by accident are effectively zero, which is exactly the intent" (v2:992–1003).

**Secondary difficulty axes (per trophy's own guardrails):**
- **Multi-year chains** (all built on yearly bars that must pass independently per window — no summing across the whole span; no burst-logging at year-end can fake a window; no skipped year mid-run): I-16/17 (Full Orbit ×3/×5), II-14/15 (Full Year One Habit ×3/×5), III-27/28 (80 workouts ×3/×5), IV-13/14 (250 food days ×3/×5), V-8/9 (40 weeks weigh-ins ×3/×5), VII-11/12 (300 vlog days ×3/×5), VIII-7/8 (six-domain ×3/×5).
- **No-miss week/month ladders:** Perfect Month (28–31/31, not grace-able), Steady Hand (12 consecutive same-weekday weeks), Same Hour Same Scale (26), The Schedule Never Breaks (26 exact-set weeks), Trimester of Iron (12 consecutive target weeks, empty-week lock), Frame by Frame (6 consecutive calendar months).
- **One-shot window/slot strictness:** Same Time Every Time (60 days ±30-min anchored), Like Clockwork (90 completions in anchored 30-min slot), NoDeviation (30 logged days ±3% of a FIXED target).
- **Strict-streak-only rules:** Five Strong (G19 — grace-rescued days never active), streak families (grace-carried days never count toward ANY streak in the Unbroken Chain family).
- **Ceiling/decade-scale:** Yew (10 rings ever), Ten Years (90/120 months ≥75% activity), Ouroboros.
- **Genetic ceiling:** The Estimated Ceiling (~100kg natural-potential estimate), Dragon Slayer (260kg DL), The Monolith (220kg squat), The Furnace (140kg bench), Atlas Press (100kg OHP), The Brand (5,000,000kg lifetime tonnage).
- **Cross-domain coincidence (rare, can't be farmed):** Wrote It Down, Eyes on the Data, Somewhere Else Still You, The Turn of the Page, Six for Six, The Living Archive (v2:1149–1159: pairing two hard-to-fake things doesn't make a new soft spot).

---

## 9. GAMIFICATION RULES THAT INTERACT WITH THE TREE

- **Derived-only (non-negotiable):** every achievement/trophy/streak/ring is COMPUTED from the event log via H3 owner functions — never stored counters, never user-editable, never "buyable," never announced by single events. Gamification reads the event log ONLY; never writes behavior events; writes derived state (`xp_transactions`, `achievements`, `streaks` derived views) and, on revokes, compensating NEGATIVE XP events. **Every stat has exactly ONE owner function; all surfaces consume the same output — rounding happens once, in the owner.** (Gamification.md:475–479)
- **Forbidden (never rewards):** opening the app; browsing screens; empty/blank saves; retroactive/bulk logging; restoring old streaks artificially; logging itself; imported content; **trophies/achievements (ZERO XP)**; cosmetic actions; settings edits.
- **"No XP for trophies" is explicit and locked** — reviews, trophies, ladders — all of it (Gamification.md:163). Achievements OVERLAY the XP table; they never mint XP.
- **XP/achievement values, formulas, and dayActivityScore weights are NOT offered as settings toggles** (Gamification.md:482–483). Only grace-day default (1, editable) and Took the Time threshold (default 14 days/year, user-editable) and the ±10% band knob (Advanced-only, clamped 5–15%) are user-facing.
- **Challenges/quests:** none exist in the achievement system. No challenge/quest system is defined in any of the four sources. (The closest concepts: milestone tiers on PR XP — 1st/5th/10th; phase entities as the container for Real Progress/On Target/Paced Bulk/Cut/Full Cycle/Broke the Plateau/The Turn; goals are a separate M1+ system that plugs into the weight ladder.)
- **Coach tie-in (one direction only):** the Coach REACTS to gamification events (`achievement.unlocked`, `level.reached`) as recognition material; it NEVER creates trophies and NEVER grants XP. Loudness: only Ring and Grove get Coach speech (one sincere derived line); everything else silent. The Coach never judges XP or points. (Gamification.md:453–468)
- **Relationships:** Events (source of truth for gamification); Dashboard (streak/XP status block, secondary; zero-XP "N days fully logged" marker); Settings (no toggles for values).
- **Open items (decide at M2):** exact XP numbers per source, level thresholds, per-habit XP ceiling — M2-open, NOT settings toggles. Grace-day default value — RESOLVED (1 per 7-day window). "Achievement list (first 10)" — RESOLVED: catalog is live v2 file (178 named entries) + spec trigger layer. (Gamification.md:485–493)
- **Open implementation notes (v2:1058–1119):** no code exists; TENSION items (planned-rest event type, account anchor, isImported at calculation time, vlog duration field, standards table, Epley, weekly rolling averages, six-domain rollup, stall rule, month-day matcher, same-day cross-table joins, phase-adjacency, yearly meta-streak, occurredAt timestamps) are the schema/engine prerequisites — several are already locked in the ledger.

---

## 10. APPENDIX — SUPERSEDED DRAFT CATALOG (TEMP-PLANNING-Achievements.md) — STATUS: SUPERSEDED AS CATALOG

Per Gamification.md:152–156: **TEMP-PLANNING-Achievements.md is SUPERSEDED as catalog — only its 7 governing rules carry over.** The trophy list below is HISTORICAL ONLY — v2 wins every naming/criteria dispute; old draft has no vote (spec:984–985). Inventoried for completeness; the rarity ladder MUST NOT map these as live achievements. **Draft planned cap was 40–70 entries (TODO, line 267); the actual draft below has ~80 entries.**

### F — Foundation/firsts (5)
- ACH-F-001 "Hello World" — first journal entry ever (count ≥1, never via import) — badge — line 61
- ACH-F-002 "First habit" — first habit created + completed on its actual day — badge — line 63
- ACH-F-003 "Day one part two" — 7 consecutive app days with ≥1 logged entity (handles post-install lull) — badge — line 65
- ACH-F-004 "The core loop" — same day: 1 journal entry WITH content, 1 habit completed, 1 weigh-in (any) — badge — line 67

### J — Journaling (10)
- ACH-J-001 "Three in a row" — journal on 3 consecutive calendar days — badge — line 72
- ACH-J-002 "Seven days of you" — journal on 7 consecutive calendar days — badge — line 74
- ACH-J-003 "Thirty days of you" — journal on 30 (not necessarily consecutive) calendar days within any 45-day window — MEDIUM — line 76
- ACH-J-004 "Every single day" — journal on EVERY calendar day for 30 consecutive days — MEDIUM (hard) — line 78
- ACH-J-005 "The wordsmith" — single entry ≥1000 words (content-gate) — badge — line 80
- ACH-J-006 "Deep pockets" — entries with 3 different lift-dim ends tags in the same week — badge — line 82
- ACH-J-007 "Back to the future" — On-This-Day (J1) viewed 10 times — badge — line 84
- ACH-J-008 "Documented century" — journal on 100 distinct calendar days total (all-time, import-excluded) — MEDIUM — line 86
- ACH-J-009 "Year, chapter one" — ≥1 journal entry in each of 12 distinct calendar months of the same year — MEDIUM — line 88
- ACH-J-010 "Rainy day" — journal entry on a day the user also logged weight (any) — badge — line 90

### H — Habits (7)
- ACH-H-001 "Seven-day habit" — 7 consecutive days with ALL active (non-archived) habits completed — badge — line 97
- ACH-H-002 "Thirty-day habit" — 30 consecutive days with ≥1 habit completed — MEDIUM — line 99
- ACH-H-003 "Streak saviour" — any single habit reaches a 21-day streak — badge — line 101
- ACH-H-004 "Century club" — any single habit reaches a 100-day streak — MEDIUM — line 103
- ACH-H-005 "Perfect week" — 7/7 days, every active habit done those 7 days — MEDIUM (rare streak) — line 105
- ACH-H-006 "Renaissance" — 5 different habits each completed ≥5 times within the same 30-day window — badge — line 107
- ACH-H-007 "Grace spirit" — used 0 grace days for 30 days straight (no grace consumed) — badge; fights the shield — line 109

### FS — Fitness/strength (14)
- ACH-FS-001 "First session" — first workout completed ever — badge — line 114
- ACH-FS-002 "Iron refuge" — 3 workouts in 7 days — badge — line 116
- ACH-FS-003 "Weekly knight" — 3 workout sessions per calendar week for 4 consecutive weeks — MEDIUM — line 118
- ACH-FS-004 "The regular" — 50 workouts total — MEDIUM — line 120
- ACH-FS-005 "Two hundred" — 200 workouts total — LARGE — line 122
- ACH-FS-006 "Heavy" — first 100kg deadlift (est-1RM ≥100kg, derived from top set using Epley) — LARGE — line 124
- ACH-FS-007 "Squat milestone" — est-1RM squat ≥1.5× bodyweight (derived, 7-day rolling bodyweight) — LARGE — line 126
- ACH-FS-008 "Bench press bar" — first est-1RM bench ≥1× bodyweight — LARGE — line 128
- ACH-FS-009 "Clean rep king" — 20 strict reps of a bodyweight exercise (pushup/chin) in a single session — badge — line 130
- ACH-FS-010 "Boss deload" — finish a deload week and return to a PR within 3 weeks after — MEDIUM (derived session-walk) — line 132
- ACH-FS-011 "Pace perfection" — 8 weeks of consistent training (≥3 sessions/week) with NO rest-day farming — MEDIUM — line 134
- ACH-FS-012 "Volume veteran" — cumulative tonnage of 1 million kg across all time — RARE — line 136
- ACH-FS-013 "Not skipping" — a full calendar month with 0 missed plan slots (slot adherence 100%) — MEDIUM — line 138
- ACH-FS-014 "PR tonight" — any exercise reaches a PR value 3 times this month, each from a real session walk — badge — line 140

### FB — Body (7)
- ACH-FB-001 "First weigh-in" — first body weigh-in — badge — line 141
- ACH-FB-002 "Calm baseline" — 10 weigh-ins total — badge — line 143
- ACH-FB-003 "Weekly citizen" — a weigh-in in each of 4 consecutive weeks — badge — line 145
- ACH-FB-004 "Target hit" — body weight reaches target of a weight goal (#16) — LARGE — line 147
- ACH-FB-005 "Progress caught" — physique photo taken 3 different months — badge — line 149
- ACH-FB-006 "The long watch" — 20 consecutive weeks with ≥1 weigh-in each — MEDIUM — line 151
- ACH-FB-007 "Scientist" — 100 weigh-ins total — MEDIUM — line 153

### N — Nutrition (8)
- ACH-N-001 "First meal" — first nutrition_log — badge — line 155
- ACH-N-002 "Fully logged" — a day with iso meals AND macro targets fully logged (weeback auto-check) — badge — line 157
- ACH-N-003 "Week of truth" — 7 consecutive fully-logged days (uses the ±10% "absolute solid" definition) — MEDIUM — line 159
- ACH-N-004 "Protein pal" — protein g/kg within target on 10 days in a 20-day window — badge — line 161
- ACH-N-005 "The chef" — creates 10 different recipes — MEDIUM — line 163
- ACH-N-006 "The macro master" — 30 fully-logged days per month (same month) — MEDIUM (anti-farm via real weekly cadence) — line 165
- ACH-N-007 "Packed and proud" — packs AND eats every pack meal in one day (R4) — badge — line 167
- ACH-N-008 "Food literate" — logs 25 different foods from the lookup (NU13) over time — badge — line 169

### G — Goals/milestones (6)
- ACH-G-001 "First milestone" — first milestone completed — MEDIUM — line 172
- ACH-G-002 "First goal done" — first goal completed (any kind) — LARGE — line 174
- ACH-G-003 "Goal farmer" — 3 goals completed in one year — LARGE — line 176
- ACH-G-004 "Weight goal" — completed a weight goal (Fitness body) — RARE — line 178
- ACH-G-005 "Strength goal demolished" — completed strength goal — RARE — line 180
- ACH-G-006 "Finale" — completed a phase (close report fired) having hit its target pace — MEDIUM — line 182

### P — Periods/trips/archive/life (8)
- ACH-P-001 "First chapter" — first period (vacation/trip) closed with 5+ journal entries inside — badge — line 185
- ACH-P-002 "Story teller" — 5 different periods each with 3+ entries — MEDIUM — line 187
- ACH-P-003 "1000 days" — 1000 calendar days since first journal entry — MEDIUM (longevity) — line 189
- ACH-P-004 "Anniversary" — today is the 1-year anniversary of the first entry — BADGE (once-only moment) — line 191
- ACH-P-005 "Home vault" — first 10 vlogs archived to PC — badge — line 193
- ACH-P-006 "Year book" — generated a Year Book (J5) for a full calendar year — badge — line 195
- ACH-P-007 "Copied to PC" — "My Videos" (J7) has ≥100 adopted video files — MEDIUM (archive keeper) — line 197
- ACH-P-008 "Just started" — the quiet week (J4) used twice — badge (recognizes listening, not punishment; quiet-ism does not reset streaks) — line 199

### U — Usage/milestone ladder ("you're still here" time trophies) (12)
- ACH-U-001 "Week one survived" — usage span ≥7 days (first recorded entity to today) — BADGE — line 209
- ACH-U-002 "The first moon" — usage span ≥30 days — BADGE — line 211
- ACH-U-003 "Seasoned" — usage span ≥100 days — BADGE — line 213
- ACH-U-004 "Quarter of a year" — usage span ≥90 days — SMALL — line 215
- ACH-U-005 "Half a year" — usage span ≥182 days — SMALL — line 217
- ACH-U-006 "One year of life" — usage span ≥365 days — MEDIUM (flagship "1 year" trophy) — line 219
- ACH-U-007 "Two years at war with gravity" — usage span ≥730 days — MEDIUM — line 221
- ACH-U-008 "The half-decade" — usage span ≥1825 days — LARGE — line 223
- ACH-U-009 "A decade back" — usage span ≥3650 days — RARE — line 225
- ACH-U-010 "Fact keeper" — ≥1000 events recorded all-time (any behavior event, import-excluded) — SMALL — line 227
- ACH-U-011 "Ten thousand moments" — ≥10,000 events recorded all-time — LARGE — line 229
- ACH-U-012 "Never close the book" — journal entries exist in ≥10 distinct calendar YEARS (all-time) — RARE — line 231

### L — Long-term status walls (6)
- ACH-L-001 "Documented century" (alias reference to J-008) — the long term reads, purely historical, never importable — LARGE — line 233
- ACH-L-002 "365+ days" — journal entry on ≥100 consecutive days at all-time high — LARGE — line 235
- ACH-L-003 "Life in tech" — month level completeness ratio over 60 consecutive weeks with ≥50% of days having any activity — LARGE — line 237
- ACH-L-004 "The vault" — 1 GB of personally logged media in app-managed storage OR PC folder (combined) — RARE — line 239
- ACH-L-005 "Five years" — ≥5 years between first and latest journal entry — RARE (time-gated rarity) — line 241
- ACH-L-006 "Net worth" — 10 different Life Areas each with ≥30 events associated over time — MEDIUM (systems breadth) — line 243

**Overlap note (lines 227–228):** the U ladder explicitly overlaps J-008/L — dedupe at M2 when the final list is agreed. **None of the above is implemented; final count can change at the M2 design session (user approves every trophy).**

---

## 11. SURPRISES / SCAN NOTES (for the rarity-ladder team)

1. **The docs call TWO different things "the hardest":** the robot-consistency family (strictness: no grace, hard-miss unlogged days, exact slots/patterns) AND the Vow/Old Growth/Ouroboros cluster (duration: 3/5/10 consecutive six-domain years). Ghost in the Machine is the single capstone combining one of each kind (90-day three-way overlap of the strictest runs). A rarity ladder should treat "strictness" and "duration" as two independent axes.
2. **Ouroboros vs Old Growth are NEAR-IDENTICAL conditions with different judgment semantics** (restart-on-gap streak vs once-existed-anywhere run of 10) — both Grove, both one-time. A tree mapping may want to distinguish them (e.g., same flower, different bloom condition).
3. **Real Progress thresholds (+2.5/+5/+10/+20kg) live ONLY in Gamification.md (the ledger), not in v2/spec** — v2/spec say "crosses the threshold distance from the phase's starting rolling average, confirmed at ≥2 consecutive weekly checkpoints" with no numbers. Ledger decides.
4. **NoDeviation's tolerance is ±3%** (the ±30% was a typo, corrected; do not reintroduce). The journal XP gate uses ≥20 words; the qualifying-entry floor is ≥40 words — two different floors, easily conflated.
5. **Rungs are not trophies** — the 47 rungs are ladder tiers nested inside §III (24 lift + 19 bodyweight + 4 tonnage); each rung fires one-time on first day its condition holds, except tonnage rungs are cumulative-crossing thresholds. Moved a Mountain is both a trophy entity (III-19) and 4 rungs (R44–R47).
6. **Moved a Mountain's rung tiers** (Root/Branch/Heartwood/Grove for 100k/500k/1M/5M kg) are unusually soft for their nominal difficulty (5M kg is ~25 years of heavy training at ~200k/yr); Groves are not uniformly hard — the tier map is by design intent, not calibrated difficulty.
7. **Unprompted deliberately EXCLUDES body from its "solitary day" domain list** — a weigh-in does not break it. Easy to implement wrong.
8. **The "2-day rule" is not in the achievement system** — it's research heritage (Streaks-style grace); the implemented form is 1 grace day per 7-day window, shared, non-stacking, non-robot-shielding.
9. **Perfect Month is grace-proof but Rebuilt/streak trophies are grace-tolerant by design** — grace never makes a day "active" (G19) but prevents the streak break for most streak trophies; the robot family ignores grace entirely.
10. **Every once-per-habit/per-window fire must name WHICH habit earned it** — the re-fire map requires per-habit attribution in the unlock event (Gamification.md:270–271).
11. **Coach speech is tier-gated (Ring/Grove only)** — if the tree adapts trophy display/celebration, Coach lines must respect this lock; tree-side celebrations are separate UI.
12. **11 yearlyPass multi-year families share ONE generic primitive** (yearlyPass + consecutiveYears) — the rarity ladder can treat all 11 as the same structural class with different per-window criteria: Full Orbit 300 days (I), Full Year One Habit 300 completions (II), 80 workouts (III), 250 food days (IV), 40 weigh-in weeks (V), 300 vlog days (VII), six-domain bar (VIII), living-archive concurrency (IX-3), plus 300-vacation-day… (VI-2 uses its own anchored window).