# 04 — The Live Session Loop

The core interaction. Everything else in the system exists to feed or consume it.

## Before the session

**Teacher creates the session:** picks a student, a subject, a date/time, pastes a Zoom link.
Student gets a notification with the join link. That is the whole of it.

There is no staging step. Building a paper in advance was three versions of the same mistake — a
pre-test, a builder, a console for handing questions over — and all three asked the teacher to
decide before the lesson a thing they can only judge during it. English is **three tests**, easy,
medium and hard, and the decision is which one this student is on.

```
  ┌─ New session ────────────────────────────────────────┐
  │ Student   ▾ BATU Ozcelik  (BATO26-1)                 │
  │ Subject   ▾ English                                  │
  │ When        31 Aug 2026, 14:30 UTC   ·  60 minutes   │
  │ Zoom        https://zoom.us/j/…                      │
  │                                                      │
  │                          [ Create the session ]      │
  └──────────────────────────────────────────────────────┘
```

## During the session

### The answer → next → move → diagnose cycle

```
TEACHER                                   STUDENT
───────                                   ───────
                                           sees a countdown, then Start
                                           opens the session themselves
                                           ── the EASY test loads ──
                                           question 1 appears
                                           first_viewed_at recorded
                                           ⏱ timer starts

sees "student is reading…"       ◄──────── strikes out option A
     live elimination feed       ◄──────── strikes out option D
                                           eliminated_options = [A, D]

                                           selects B, adds confidence
                                           presses Next ──► Postgres grades it
sees: B · wrong (key: C)         ◄──────── student sees only the next question
      eliminated A, D
      42s vs 55s target · fast
      confidence: high

taps a diagnosis chip:
  [misread_question]                       … answers 2, 3, 4, 5 …

── on the call: "these are too easy for you, go to the medium one" ────────

presses [Medium]  ── or ──────────────────► student presses [Switch to medium]
                                           the open question is voided
                                           ── the MEDIUM test loads ──
                                           its question 1 appears, 1 of 20

── the lesson ends ───────────────────────────────────────────────────────

clicks Publish results ──────────────────► every answer revealed at once,
                                           with the right choice and why
```

The student's screen never contains information the teacher has not released. Correctness is
withheld until reveal (see `docs/03-architecture.md`, security rule 3).

### What the teacher sees, live

A board of the session's items, updating over Realtime as the student works:

| # | Skill | Diff | Answer | Elim | Time | Conf | Result | Diagnosis |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Words in Context | easy | B | A, D | 42s / 55s | high | ✗ | misread_question |
| 2 | Words in Context | easy | C | A | 61s / 55s | med | ✓ | solid_reasoning |
| 3 | Text Structure | med | — | A, C | *live* | — | — | — |

The elimination column updates *while the student is still deciding*. A teacher watching a
student strike out the two obviously-wrong options and then stall for ninety seconds knows
exactly what to ask before the answer is even submitted. That visibility does not exist when
questions are screenshots pasted into a chat.

### The suggestion engine

After each diagnosis the system proposes the next move, encoding the loop the teachers already
run:

| Result | Diagnosis | Suggestion |
| --- | --- | --- |
| ✓ | `solid_reasoning` | **Escalate** — same skill, next difficulty up |
| ✓ | `lucky_guess` | **Hold** — same skill, same difficulty, confirm it |
| ✗ | `concept_gap` | **Re-teach, then hold** — same skill, same difficulty |
| ✗ | `careless_error` | **Hold** — same difficulty, watch pace |
| ✗ | `misread_question` | **Hold** — same difficulty, ask for a summary first |
| ✗ | `ran_out_of_time` | **Drop one level** — rebuild fluency before speed |

It is a sentence under the board, not an action. Nothing moves a student but a person pressing
one of the three buttons; the teacher's judgement is the product, and automating it away would
remove the thing clients pay for.

## Who moves the level

A session carries a `level` — `easy`, `medium` or `hard` — and it starts on `easy`. Loading a
level stages that test's twenty questions and publishes the first; every answer publishes the
next. Nobody hands anything over.

The only decision is when the level is wrong, and it is made the way it is actually made on a
call: the teacher watches the student work, says "this is too easy, try the medium one", and
whoever is nearer the keyboard presses it. So `set_session_level` accepts the call from **either
seat** — the session's student or the session's teacher — and the same three buttons are on both
screens.

```
  STUDENT'S SCREEN                        TEACHER'S CONSOLE
  ────────────────                        ─────────────────
  ┌──────────────────────────────┐        ┌──────────────────────────┐
  │ 07  of 20        ⏱ 0:41  ABC │        │ The test                 │
  │                              │        │ Easy         7 asked · 20│
  │ Which choice completes the…  │        │ ████████░░░░░░░░░░░░░░░░ │
  │  A  gentle                   │        │                          │
  │  B  diverse                  │        │ BATU is working through  │
  │  C  ordinary                 │        │ the easy test one        │
  │  D  static                   │        │ question at a time.      │
  │                              │        │                          │
  │  [ Next ]                    │        │ ┌──────┬────────┬──────┐ │
  │ ─────────────────────────────│        │ │ Easy │ Medium │ Hard │ │
  │ You are on the easy test     │        │ └──────┴────────┴──────┘ │
  │  [Switch to medium] [ …hard] │        └──────────────────────────┘
  └──────────────────────────────┘
```

Moving does three things, in one transaction:

* the question on screen is **voided** — they were being timed on it and did not answer it, and
  `voided` is the state that already means exactly that;
* the rest of the level they are leaving is **deleted** — those rows were never in front of the
  student, they carry nothing, and a voided row nobody saw is noise on the board and in the
  report;
* the new level's questions are staged after the ones already there, **skipping any question this
  session has already asked**, and its first is published.

That last clause is what makes the downward move safe. "Drop one level — rebuild fluency before
speed" is the oldest suggestion in the product and it never had anywhere to be acted on; now it
does, and a student sent back to easy is not handed the two easy questions they already did.

Three things do not change, and they are the ones that matter:

* **The server still holds the line.** Exactly one item is `published` at a time and everything
  else is `staged`, which is invisible under RLS. Loading twenty questions is not putting twenty
  questions in front of the student — it is putting one in front of them and nineteen out of
  reach. So the per-question clock means what it meant before, and there is still no reading
  ahead.
* **Leaving still ends the test.** The screen stays full while a question is open, and walking
  out submits what they have. A test you can leave and come back to is not a test.
* **Nothing about the reveal moves.** The student learns the result when the teacher publishes
  the results, exactly as before.

Since a session that moves levels does not ask its questions in the order they sit in,
`sequence_no` is not the order anything happened in. It stays what it was — where the question
sits in this session's run of items — and `asked_no` records the order questions were actually
put in front of the student. The board and the report both read that one.

The student's own numbering reads neither: it counts **within the level**, so a student moved to
medium after six easy questions is on "question 1 of 20", not "question 7". The length of the
level they are on lives on `sessions.level_size`, because staged items are invisible to them and
they have no way to count it for themselves.

## After the session

Teacher ends the session → `status = completed`, `ended_at` set. The session summary is already
complete without any writing: every item, answer, elimination, time and diagnosis is on the
board. The teacher adds an optional overall note.

The transcript is uploaded later (usually same day) and the report pipeline takes over —
`docs/05-report-engine.md`.

## Failure modes worth designing for

| Situation | Handling |
| --- | --- |
| Student's connection drops mid-question | State is server-side; on reconnect they resume at the same item with the timer adjusted for the gap (`disconnected_ms` tracked via presence) |
| Level moved by mistake | Move it back. The question that was open is voided and excluded from the report; nothing already answered is touched, and no question is repeated |
| Student answers by accident | Teacher can void a single item with a reason; voided items are visible on the board but never enter the report |
| Student finishes a whole level | The end-of-test screen offers the move up, so the session continues on the next level rather than stopping |
| Realtime drops | 10s poll fallback while the session is `live` |
| Teacher forgets to diagnose | Board shows undiagnosed items amber; a prompt appears on End Session. Never blocking — an incomplete report beats a teacher fighting a modal in front of a student |
