# SAT Teachers

Platform for Ascend Now's 1:1 SAT tutoring — a tagged question bank, a live teacher-driven
question loop during Zoom sessions, and an evidence-backed session report for the parent.

## Running it

```bash
npm install
cp apps/web/.env.example apps/web/.env.local   # fill in your Supabase keys
npm run dev                                    # http://localhost:5173
```

`npm run build` type-checks and builds. `npm run typecheck` on its own is faster.

## What works today

| | |
| --- | --- |
| **Signup** | Direct, for teachers and students. Each person gets a readable ID (see below) |
| **Login** | Email + password |
| **Question bank** | Teachers author text MCQs: passage, question, up to 4 options, correct answer, explanation |
| **Papers** | The bank opens on the source papers, not 66 loose items — click one and read it as printed |
| **Difficulty** | Easy / medium / hard, plus an optional note on *why* it sits at that level |
| **Sections** | Subject, the four SAT sections the teachers assess against, and the skill within each |
| **Sessions** | Schedule with a student and a time; build the paper up front; the student sits it themselves |
| **Paper builder** | The bank shown whole — passage, stem, all four choices — ticked into a paper and dragged into order |
| **Exam screen** | One question at a time, its own clock running, stimulus left and question right |
| **Live loop** | Watch each answer land with its time and confidence, reveal, diagnose in one tap |
| **Pre-tests** | Build a paper once, run it with every student |
| **Speed** | Every answer is timed from first view to submit, and measured against a per-question target |
| **Report** | Score, per-skill and per-section breakdown, pace, and every miss with what both people said |
| **Loaded bank** | Both English diagnostics — 66 items with passages, keys, sections and difficulty |
| **Branding** | Logo and colour tokens taken from the operations dashboard, so both apps look like one product |

## The English bank

Both English diagnostics are in the bank already — 66 published items, each with its passage,
four options, the correct option, an explanation, its SAT section, its skill from the teachers'
evaluation grid, and a difficulty with the reasoning behind it.

| Paper | Items | Source refs | Migration |
| --- | --- | --- | --- |
| In-class *Reading and Writing – 25Q* | 25 | `ENG-DIAG-INCLASS-Q01` … `Q25` | `0008` |
| *English Diagnostic Test 4*, Module 1 | 20 | `ENG-DIAG-T4-M1-Q01` … `Q25` | `0009` |
| *English Diagnostic Test 4*, Module 2 | 21 | `ENG-DIAG-T4-M2-Q01` … `Q26` | `0009`, `0012` |

The in-class paper came with an answer key; **seven of its printed answers disagreed with their
own passage** and the bank carries the answer the text supports instead. Test 4 is a deck of
Bluebook screenshots with no text and no key at all, so every item was transcribed off the
screenshots and keyed here. Both sets of decisions are listed item by item in
[`docs/reference/english-diagnostic-key-review.md`](docs/reference/english-diagnostic-key-review.md).

### Reading one as a paper

`/questions` opens on **Papers** — the three source documents rather than the items inside them.
Opening one prints it: the directions block at the top, each passage set once above the questions
that hang off it, the choices as the paper's own `A)`–`D)` run, and the paper's own numbering
(Test 4 skips numbers, and renumbering them would make a teacher's "look at 17" mean two
different questions). The answers are a toggle and start hidden — a key on screen while a teacher
is talking a student through a question is a key read out by accident. **Print** gives them the
paper on paper.

The tabs and tables the papers print are stored as text in the bank, so both the paper view and
the student's screen parse a stored passage back into what the paper set: paragraphs, the
"Text 1"/"Text 2" headings of a paired-text item, and a real table for the two chart items. The
student sees the same passage, the same stem and the same four choices the paper prints —
`apps/web/src/lib/paper.ts` is the one place that decides what that looks like.

`question_sets` is the paper — the same object the pre-tests are built from, so a paper a teacher
reads is a paper they can run. Migration `0015` registers the three source papers with their
directions and their order.

Every item is fully labelled: section, skill (all eleven of the grid's Skill Focus rows) and
level. A skill belongs to exactly one section and the database checks the pair, so an item cannot
be mis-filed. Nothing was left blank for the teachers to fill in — they correct a label in the
bank instead.

Some items ask about "the underlined sentence", so the bank stores the underlined span alongside
the passage (`questions.passage_underline`) and renders it marked wherever the passage appears.
Two items are built on a chart and a table; both are transcribed into the passage as text rows,
since the bank is text-only. House content like this has no author — `questions.created_by` is
null — and any teacher may correct it.

## Identity codes

`BATO26-1` — three letters of the given name, one of the surname, the two-digit year of
joining, then **a serial number for that role**, starting at 1 and unbounded.

The trailing number identifies the person, so it is shared across all names of that role rather
than restarting per name. There is exactly one `-1` for teachers and one `-1` for students:

| Order | Role | Name | Code |
| --- | --- | --- | --- |
| 1st teacher | teacher | Malya Rao | `MALR26-1` |
| 2nd teacher | teacher | Priya Sharma | `PRIS26-2` |
| 1st student | student | BATU Ozcelik | `BATO26-1` |
| 2nd student | student | Jo Kim | `JOXK26-2` |
| 3rd student | student | Madonna | `MADO26-3` |
| 4th student | student | Batu Ozdemir | `BATO26-4` |

Short or single names still produce the same shape — `JOXK26`, `MADO26` — padding with the
fourth letter of the given name, then `X`.

The number does not reset each year, so it stays unique for the life of the account. Two people
can still compute the same prefix (a teacher *Test* and a student *test* joining the same year
both give `TEST26`); when that happens the code takes the next number for its role rather than
failing the signup.

## How a session runs

The work is done before the day, not on the call.

**The teacher** creates a session with a student and a time, then builds the paper at
`/sessions/:id/paper`: the bank on the left as the papers it came from, every question shown
whole — its passage, its stem and all four choices — with a tick box on each and an **Add all**
on each passage. Ticked questions land in the list on the right, which is the order the student
will meet them in; drag a row to move it, or use the arrows. Save, and the teacher is done.

**Times are UTC**, everywhere and always — written on the schedule form, printed on every
session card, and said out loud in the text (`31 Aug 2026, 14:30 UTC`). A teacher in Singapore
and a student in Dubai have to mean the same moment by "half four", and rendering each browser's
own zone meant they did not. `apps/web/src/lib/time.ts` is the only place that formats one.

**The student** sees the session on their list with a countdown. Once the scheduled time passes
the **Start** button turns on — no one has to let them in. They then work through the paper one
question at a time, each with its own clock, and submitting moves them on. They cannot go back.

**Afterwards** the teacher reveals and diagnoses in the console as before, which is what the
report is built out of. The console shows the paper as a single box — saved, or how far through
the student is — rather than a card per question: there is nothing to do to any one of them from
there, and twenty-six cards is a wall to scroll past.

One question is in front of the student at a time and it is the *server* that holds that line:
only the current item is published, and the next one is published by `submit_answer` once the
current one is answered. So the clock on question 3 cannot be spent reading question 4 — question
4 is not in reach yet. That is also why the length lives on `sessions.question_count`: the
student is shown "question 3 of 25" and has no way to count the paper for themselves.

**Why pre-tests still exist.** A session's paper belongs to one student on one day. A pre-test is
a paper you intend to run again — build it once at `/pretests`, and it appears on the builder's
shelf beside the three source papers with a **Take all** button, so the next student's session is
one click rather than twenty-five ticks. Two students who sat the same pre-test have comparable
reports; two students whose papers were assembled by hand do not. Both are `question_sets`, and
the builder is the same screen, which is the point — a pre-test is just a paper you saved.

## Speed

Every answer is timed server-side: `session_items.first_viewed_at` (set when the question is
actually on the student's screen, not when it was published) to `answered_at`, stored as
`session_item_assessments.elapsed_seconds`. The student watches the same interval count up on
the question itself. Each question carries a `target_seconds` benchmark, so
the report can separate *wrong* from *wrong in nineteen seconds* — those need different fixes.

## The report

`/sessions/:id/report`. Score, per-skill and per-section breakdown weakest first, pace against
target, the teacher's diagnoses, and every miss with the student's own reasoning and the teacher's
note beside it. Everything is computed from the session's rows — nothing is stored and nothing is
written by hand, so the report cannot say something the session did not.

## The session workflow

```
teacher creates a session with a student and a time
  → builds the paper: ticks questions, drags them into order, saves
                                          (invisible to the student)
  → the scheduled time passes
  → student opens the session themselves; question 1 is published to them
  → student crosses out options, answers, says how sure and why
  → answering publishes the next question; repeat to the end of the paper
  → teacher sees each answer, the eliminations, the time and the confidence
  → teacher reveals                       (only now does the student learn the result)
  → teacher taps one diagnosis chip; the system suggests the next move
```

The suggestion encodes what the teachers already do — escalate on solid reasoning, hold the
level on a lucky guess or a concept gap, drop a level when they ran out of time. It suggests;
it never auto-advances. The teacher's judgement is the product.

## The one rule that shapes the schema

Postgres RLS is *row*-level: a policy cannot hide a single column of a row it grants. And
Supabase Realtime pushes whole rows to subscribed clients. So **anything a student must not
see lives in a table a student cannot read** — which is why `question_keys` is its own table
rather than a `correct_option` column on `questions`. Once students start receiving questions
in live sessions, there is no row and no column for the answer to leak from.

The same rule covers the live session: `is_correct` lands the moment a student submits, long
before the teacher reveals, so it lives in `session_item_assessments` rather than on the item
row the student subscribes to. Result, correct option and explanation are copied onto the item
only when the teacher reveals — which is the only route by which any of them reach the student.

```bash
psql "$DATABASE_URL" -f supabase/tests/rls_contract.sql
psql "$DATABASE_URL" -f supabase/tests/session_flow.sql
psql "$DATABASE_URL" -f supabase/tests/prepared_session.sql
```

Between them these assert: a signup asking for `admin` is coerced to `student`; a student
cannot self-promote or author questions; a queued question is invisible and unanswerable; a
published question exposes the question and its options but never the key; after submitting,
the student cannot learn whether they were right; and the teacher's diagnosis is never visible
to the student. `prepared_session.sql` adds the new flow: a student cannot open a session early
or open somebody else's, exactly one question is within their reach at a time, answering brings
up the next in the paper's order, and a paper already with a student cannot be renumbered under
them. Every row must read PASS.

The first two are written for a scratch database — they reset the display-id counters on their
way out. `prepared_session.sql` leaves them alone and is safe to run against a real one.

## Layout

```
apps/web/              React + TypeScript + Vite  → Vercel
supabase/migrations/   schema, RLS, and the session RPCs
supabase/tests/        the security contracts
docs/                  system design for everything not yet built
tools/                 PDF question extractor (for the screenshot library, later)
```

`apps/api` (Fastify on Render) is still not needed. Grading has to run somewhere the student
cannot reach `question_keys`, and `submit_answer` does that as a `SECURITY DEFINER` function
inside Postgres — which is server-side already. Render earns its place when the transcript and
report pipeline arrives; see [docs/03-architecture.md](docs/03-architecture.md).

## Deploying

**Vercel** — set the project root to `apps/web`; `vercel.json` already handles the SPA rewrite.
Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in the project's environment variables.

**Supabase** — migrations in `supabase/migrations` are ordered and idempotent to apply in
sequence. Do not change the schema from the dashboard; RLS policies are exactly the thing you
cannot afford to have drift undocumented.

> Email confirmation is on by default. To let people in immediately after signing up, turn it
> off under **Authentication → Sign In / Providers → Email**. The signup screen handles both.
