# 04 — The Live Session Loop

The core interaction. Everything else in the system exists to feed or consume it.

## Before the session

**Teacher creates the session:** picks a student, a subject, a date/time, pastes a Zoom link.
Student gets a notification with the join link.

**Teacher stages questions.** This is the step that replaces hunting through Google Drive
mid-call. The bank is filtered by *subject → section → skill → difficulty*, and the teacher drags
5–10 items into the session queue. Staged items are invisible to the student.

The stage list is a **plan, not a script** — the teacher will publish some, skip others, and add
items live based on what the student does. That is the point.

```
  ┌─ Question Bank ──────────────────┐   ┌─ Session Queue ────────────────┐
  │ Domain  ▾ Craft and Structure    │   │ 1. Words in Context     easy   │
  │ Skill   ▾ Words in Context       │   │ 2. Words in Context     medium │
  │ Diff    ▾ medium                 │   │ 3. Text Structure       medium │
  │                                  │   │ 4. Text Structure       hard   │
  │ ▸ Q01  motocross / "diverse"     │→  │                                │
  │ ▸ Q02  Black Death / "cata..."   │   │ ask for summary  ☑ on 3, 4     │
  │ ▸ Q03  Wuthering Heights/"catch" │   └────────────────────────────────┘
  └──────────────────────────────────┘
```

## During the session

### The publish → answer → reveal → diagnose cycle

```
TEACHER                                   STUDENT
───────                                   ───────
starts session  ─────────────────────────► sees "waiting for your teacher"
                                           (presence: teacher sees student is here)

clicks Publish on queue item 1 ──────────► question appears
                                           first_viewed_at recorded
                                           ⏱ timer starts

sees "student is reading…"       ◄──────── strikes out option A
     live elimination feed       ◄──────── strikes out option D
                                           eliminated_options = [A, D]

                                           selects B, adds confidence + why
                                           submits ──► Render grades it
sees: B · wrong (key: C)         ◄──────── student sees only "answer received"
      eliminated A, D            
      42s vs 55s target · fast
      confidence: high
      "B matched the wording in line 3"

── discusses on Zoom ──────────────────────────────────────────────────────

clicks Reveal ───────────────────────────► sees correct answer + rationale

taps a diagnosis chip:
  [misread_question]

system suggests: hold level, same skill
teacher publishes queue item 2 ──────────► next question appears
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

It highlights a suggested item in the queue. It does not auto-advance and it cannot be made to.
The teacher's judgement is the product; automating it away would remove the thing clients pay
for.

### Speed mode

Because speed is explicitly assessed, the teacher can publish a **set** of items with a shared
timer instead of one at a time — the student works through 5 items under time pressure, and the
board fills in as they go. Same data model (`session_items` with sequential `sequence_no`),
different publish action. Pace ratios are the primary output.

## Who paces it

A session carries a `pacing`, and it is one of two things. The whole difference is who decides
what the student sees next.

**`student` — the paper does.** The default, and what a diagnostic wants. Starting publishes
question 1; each answer publishes the next. The teacher does not touch anything while it runs.

**`teacher` — you do.** Nothing is published until the teacher hands it over. The student
starts, and waits. The teacher picks a question out of the paper — the console cuts it by
difficulty, with counts, because difficulty is the axis the decision is actually made on — and
it appears on the student's screen. They answer it, and wait again.

```
  ┌─ Ask a question ────────────────────────────────────────────────┐
  │ 3 left in the paper.              Difficulty ▾ Easy (4)         │
  ├─────────────────────────────────────────────────────────────────┤
  │ Q07  easy · Words in Context · 55s                   [Ask this] │
  │      The ______ nature of the tracks makes motocross exciting.  │
  │ Q11  easy · Transitions · 55s                        [Ask this] │
  │      Which choice completes the text with the most logical…     │
  └─────────────────────────────────────────────────────────────────┘
```

This is what the suggestion engine above was always for. "Drop one level — rebuild fluency
before speed" is advice nobody could take while the running order was fixed before the lesson
started: a student who could not do the easy one was handed the medium one anyway, and then the
hard one, and the teacher watched three failures where they meant to stay put and re-teach.

Three things do not change, and they are the ones that matter:

* **The server still holds the line.** Exactly one item is `published` at a time and everything
  else is `staged`, which is invisible under RLS. A teacher-paced session is not a client
  showing fewer questions — it is a server having published fewer. So the per-question clock
  means what it meant before, and there is still no reading ahead.
* **The hold is part of the test.** Between questions the student's screen stays full and
  leaving it still ends the paper. A wait you can walk out of and back into is not a held test.
* **Nothing about the reveal moves.** The student learns the result when the teacher publishes
  the results, exactly as before.

Since the teacher may ask question 11 before question 4 and may never ask question 4 at all,
`sequence_no` stops being the order anything happened in. It stays what it was — the question's
place in the paper — and `asked_no` records the order questions were actually put in front of
the student. The board, the student's own numbering and the report all read that one.

The pacing can be switched mid-session, which is the case it earns its keep in: a teacher three
questions into a paper who can see it is not going to work takes hold of it without abandoning
the session and building another.

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
| Teacher publishes the wrong item | Unpublish while `status = published` and unanswered; the row is voided, not deleted, and excluded from the report |
| Student answers by accident | Teacher can void a single item with a reason; voided items are visible on the board but never enter the report |
| Session runs over the queue | Teacher searches the bank live; the same filters, one click to publish directly |
| Realtime drops | 10s poll fallback while the session is `live` |
| Teacher forgets to diagnose | Board shows undiagnosed items amber; a prompt appears on End Session. Never blocking — an incomplete report beats a teacher fighting a modal in front of a student |
