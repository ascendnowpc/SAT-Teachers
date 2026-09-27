# 04 — The Live Session Loop

The core interaction. Everything else in the system exists to feed or consume it.

## Before the session

**Teacher creates the session:** picks a student, a subject, a date/time, pastes a Zoom link.
Student gets a notification with the join link. That is the whole of it.

There is no staging step. Building a paper in advance was three versions of the same mistake — a
pre-test, a builder, a console for handing questions over — and all three asked the teacher to
decide before the lesson a thing they can only judge during it. English is **three tests**, easy,
medium and hard, and the decision is which one this student is on.

Which is also the whole of the bank: **sixty questions, twenty per level**. The loaders brought in
more than that — the in-class 25Q diagnostic and the Test 4 items the teachers did not pick — and
0029 retired them, because an item no level test holds cannot be asked by anything and counting it
with the sixty made the bank look half again as deep as it is. Retired is not deleted: the items
stay in the bank under All questions, and every session already sat on them still renders.

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

                                           selects B
                                           ⏱ timer stops
                                           adds confidence (not timed)
                                           presses Next ──► Postgres grades it
sees: B · wrong (key: C)         ◄──────── student sees only the next question
      eliminated A, D
      42s vs 55s target · fast
      confidence: high

taps a diagnosis chip:
  [misread_question]                       … answers 2, 3, 4, 5 …

── the teacher sees these are too easy ─────────────────────────────────────

Choose a question → Medium → 7
  [Show next] ───────────────────────────► they finish question 6, and
                                           medium 7 appears as their
                                           question 7
                                           ── the MEDIUM test carries on
                                              from 8 ──

── the lesson ends ───────────────────────────────────────────────────────

clicks Publish results ──────────────────► every answer revealed at once,
                                           with the right choice and why

fills the diagnostic form
then clicks Generate report ─────────────► the recording is read, then the
                                           report is stamped
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

It is a sentence under the board, not an action. Nothing moves a student but the teacher, on the
console; the teacher's judgement is the product, and automating it away would remove the thing
clients pay for.

## Who chooses the question

A session carries a `level` — `easy`, `medium` or `hard` — and it starts on `easy`. Loading a
level stages that test's twenty questions and publishes the first; every answer publishes the
next. Nobody has to hand anything over, and most of a lesson runs that way.

The teacher can reach in whenever the lesson calls for it (`0047`). The console names the question
the next answer will bring up, and **Choose a question** lists all three tests — every question by
the number the printed test gives it, what has happened to each in this session, and the chosen
one in full, with the sentence about why it sits at its level. Then one of two:

* **Show now** puts it on the student's screen at once. The question they were on is **set aside**,
  exactly as a level move sets it aside.
* **Show next** leaves them to finish the question they are on, and puts the chosen one up the
  moment they answer it. Deciding while the student is still working costs them nothing.

Either way the session moves onto the chosen question's test and carries on from there: the
questions after it in the test's own order, then round to the ones before it that have not been
asked. A teacher who picks medium 12 is asking for that kind of question, so the one after it is
13, not 1 — and 1 to 11 are still in the queue, after 20.

This came from a teacher's notes on a diagnostic. She wanted to move the student to a different
question on the strength of how he was doing, and the only way past a question was for him to
press Next without answering it — the rest were queued, in a fixed order, and nothing could change
it. And because his screen told him whether he was on the easy, the medium or the hard test, he
started treating a diagnostic as a final exam. Asked whether the student should be able to move
between questions or the teacher should choose, she chose the teacher.

**The student's screen does not know there are levels.** No level in the header, no level switch,
no "of 20" and no "Finish the test" on a twentieth question; the questions are numbered 1, 2, 3
across the whole session, the numbers the board and the report use. A student moved to medium
after six easy questions is on question 7. The level is the teacher's judgement about the student,
and read back to them it is only pressure.

So the level is **moved from one seat**. The console's three buttons move it, and so does choosing a
question from another test. The student's switch — the next test up, or back down from hard — went
with the level on their screen, and the database's half went with it: `set_session_level` answers
the session's teacher only, and `set_level_by_token`, the same move through the link, is dropped.

```
  STUDENT'S SCREEN                        TEACHER'S CONSOLE
  ────────────────                        ─────────────────
  ┌──────────────────────────────┐        ┌──────────────────────────────────────┐
  │ 07               ⏱ 0:41  ABC │        │ WHICH TEST                           │
  │                              │        │ On the easy test  [Easy|Medium|Hard] │
  │ Which choice completes the…  │        │ ──────────────────────────────────── │
  │  A  gentle                   │        │ Next up: Easy test, question 8 ·     │
  │  B  diverse                  │        │ Words in Context [Choose a question] │
  │  C  ordinary                 │        └──────────────────────────────────────┘
  │  D  static                   │
  │                              │         What is on the screen is the
  │  [ Next ]                    │         teacher's to change. The student
  └──────────────────────────────┘         sees the question and its number.
```

Choosing is **once per question**, the same rule as moving level: a question the student has
answered, one on their screen, and one set aside earlier cannot be chosen again, and the picker
shows them without letting them be picked. Nor can a question from the other subject's tests, or
one that is in no test at all — the server checks all of it, not the picker.

Moving does three things, in one transaction:

* the question on screen is **voided** — they were being timed on it and did not answer it, and
  `voided` is the state that already means exactly that;
* the rest of the level they are leaving is **deleted** — those rows were never in front of the
  student, they carry nothing, and a voided row nobody saw is noise on the board and in the
  report;
* the new level's questions are staged after the ones already there, **skipping any question this
  session has already asked**, and its first is published.

Choosing a question does the same three things, with two differences: the queue is built from the
chosen question rather than from the top, and with **Show next** the question on screen is left
where it is.

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
  out submits what they have. A test you can leave and come back to is not a test. That exit is
  now a **[Submit test]** button in the exam header as well as the back arrow — handing a test in
  early is a decision a student makes, and it should not have to be made by trying to leave the
  page.
* **Nothing about the reveal moves.** The student learns the result when the teacher publishes
  the results, exactly as before.

Since a session that moves levels does not ask its questions in the order they sit in,
`sequence_no` is not the order anything happened in. It stays what it was — where the question
sits in this session's run of items — and `asked_no` records the order questions were actually
put in front of the student. The board and the report both read that one, and since `0047` so does
the student's own numbering: it used to count **within the level**, "question 1 of 20" again after a
move, which told the student exactly what the screen no longer says.

Two people can now change the screen at once — the teacher choosing, the student pressing Next —
and the server is where that is settled. `record_answer` answers a question only if it is still
open in the same statement that answers it, and `lock_open_item` waits out an answer in flight
before the teacher's choice decides what is on the screen. Without both, the two pressed at once
could leave two questions open; `0047` sets out how.

## After the session

Teacher ends the session → `status = completed`, `ended_at` set. The session summary is already
complete without any writing: every item, answer, elimination, time and diagnosis is on the
board. The teacher adds an optional overall note.

The board shows **what the student sat**, not what the session loaded. Handing in at question six
voids the fourteen behind it, and those fourteen used to print as fourteen "Not attempted" rows
that buried the six carrying the lesson. They are one line under the table now — the count is
still a finding, the empty rows never were. The report and the student's own results screen have
always read the same way, so all three now agree.

The transcript is uploaded later (usually same day) and the report pipeline takes over —
`docs/05-report-engine.md`.

## Failure modes worth designing for

| Situation | Handling |
| --- | --- |
| Student's connection drops mid-question | State is server-side; on reconnect they resume at the same item with the timer adjusted for the gap (`disconnected_ms` tracked via presence) |
| Level moved by mistake | Move it back. The question that was open is voided and excluded from the report; nothing already answered is touched, and no question is repeated |
| Student answers by accident | Teacher can void a single item with a reason; voided items are visible on the board but never enter the report |
| Student finishes a whole level | Their screen says they are waiting for their teacher; the console says nothing is on their screen and offers **Choose a question**, so the session continues wherever the teacher takes it |
| Teacher and student press at the same moment | The server settles it: one question is open afterwards, never two, and an answer to a question the teacher has just set aside is refused rather than recorded |
| Realtime drops | 10s poll fallback while the session is `live` |
| Teacher forgets to diagnose | Board shows undiagnosed items amber; a prompt appears on End Session. Never blocking — an incomplete report beats a teacher fighting a modal in front of a student |
