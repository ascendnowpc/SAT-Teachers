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
| **Question bank** | Teachers write and correct MCQs: passage or figure, question, up to 4 options, key, explanation |
| **Three tests** | English is easy, medium and hard — twenty questions each, under Questions, read as printed |
| **Difficulty** | Easy / medium / hard, and every question says *why* it sits at that level |
| **Sections** | Subject, the four SAT sections the teachers assess against, and the skill within each |
| **Sessions** | Schedule with a student and a time. That is all — nothing to build beforehand |
| **The level** | The session starts on easy; the student or the teacher moves it while it runs |
| **Exam screen** | One question at a time, its own clock running, stimulus left and question right |
| **Live loop** | Watch each answer land with its time and confidence, reveal, diagnose in one tap |
| **Speed** | Every answer is timed from first view to submit, and measured against a per-question target |
| **Report** | Score, per-skill and per-section breakdown, pace, and every miss with what both people said |
| **Transcript** | Drop in the Fathom recording; it lines up against the questions and is read back as findings |
| **Loaded bank** | 86 items with passages, keys, sections and difficulty; 60 of them in the three tests |
| **Branding** | Logo and colour tokens taken from the operations dashboard, so both apps look like one product |

## English is three tests

Easy, medium and hard. Sixty published items, twenty in each, every one with its passage, four
options, the correct option, an explanation, its SAT section, its skill from the teachers'
evaluation grid, and **a sentence saying why it sits at that level**.

| Test | Items | Source refs | Migration |
| --- | --- | --- | --- |
| **English — Easy** | 20 | `ENG-DIAG-T4-M1-Q01` … `Q25` | `0009`, filed by `0026` |
| **English — Medium** | 20 | `ENG-DIAG-MEDIUM-Q01` … `Q27` | `0026` |
| **English — Hard** | 20 | `ENG-DIAG-T4-M2-Q02` … `Q26` | `0009`, filed by `0026` |

The grouping is the teachers' own, taken from the level document they marked up. It replaced the
per-item difficulty labels the items were transcribed with, which disagreed with the teachers'
sorting on about half of them — so `questions.difficulty` is now the test an item is in, and
`questions.difficulty_rationale` explains that placement item by item. It is not decoration: it is
the sentence a teacher reads when deciding whether to move a student up.

The item numbers are each test's own and are not contiguous — the medium test runs 1, 2, 3, 6, 7,
… — because renumbering them would make a teacher's "look at 19" mean two different questions.

The bank also still holds the in-class *Reading and Writing – 25Q* diagnostic (`0008`) and one
Test 4 item the level document does not use. They are under **All questions**, they are not in any
test, and no session can run them. The in-class paper came with an answer key and **seven of its
printed answers disagreed with their own passage**; the bank carries the answer the text supports
instead, listed item by item in
[`docs/reference/english-diagnostic-key-review.md`](docs/reference/english-diagnostic-key-review.md).

### Reading one as a paper

`/questions` opens on the three. Opening one prints it: the
directions block at the top, each passage set once above the questions that hang off it, the
choices as the paper's own `A)`–`D)` run, and the test's own numbering. The answers are a toggle
and start hidden — a key on screen while a teacher is talking a student through a question is a
key read out by accident. Under each answer is why the item is at this level. **Print** gives them
the paper on paper.

The tabs and tables the papers print are stored as text in the bank, so both the paper view and
the student's screen parse a stored passage back into what the paper set: paragraphs, the
"Text 1"/"Text 2" headings of a paired-text item, and a real table for the two chart items. The
student sees the same passage, the same stem and the same four choices the paper prints —
`apps/web/src/lib/paper.ts` is the one place that decides what that looks like.

`question_sets` is the test — the same object a session loads a level from, so a test a teacher
reads is the test their student sits. Migration `0026` registers the three with their level,
their directions and their order.

Every item is fully labelled: section, skill (all eleven of the grid's Skill Focus rows) and
level. A skill belongs to exactly one section and the database checks the pair, so an item cannot
be mis-filed. Nothing was left blank for the teachers to fill in — they correct a label in the
bank instead.

Some items ask about "the underlined sentence", so the bank stores the underlined span alongside
the passage (`questions.passage_underline`) and renders it marked wherever the passage appears.
Two items are built on a chart and a table; both are transcribed into the passage as text rows,
since the bank is text-only. House content like this has no author — `questions.created_by` is
null — and any teacher may correct it.

## Writing and correcting a question

`/questions/new` writes one; `/questions/:id/edit` corrects one — the same form, and
`update_question` mirrors `create_question`: one call, one transaction. Options are replaced
wholesale rather than diffed, because the key points at a *label* and a diff could leave it
pointing at an option that had moved underneath it. RLS decides whose questions may be rewritten:
a teacher's own, and house content, which any teacher may correct.

A question can carry a **figure** — a diagram or a chart, for the maths items that are a picture
rather than a paragraph. It is uploaded to the `question-images` bucket and the row keeps its
URL. That bucket is public, which is a real decision: a student has to load the image the moment
the question is published to them, and signing every URL would mean a round trip per render on a
screen that must not stall mid-test. Paths are random UUIDs, so an image is *unlisted* rather
than secret — the standing of an unlisted document. No answer key is in the picture. Writing to
the bucket is teacher-only.

### There are three tests, and that is the number

`question_sets.level` is what makes one of them a level: `easy`, `medium` or `hard`, unique per
subject among the active sets, and the column a session looks a test up by. Matching on a title
would have been a bug waiting for a rename.

Everything else that was ever a set is deactivated rather than deleted — the three source papers
the bank was loaded from, and any test a teacher assembled by hand under the old flow. Their rows
and their items are still there, so a report of a session that ran off one still resolves; what
they are not is runnable, because a session runs a level.

Adding a question to a level is the same form as writing any other: **Add question** on an open
test arrives at `/questions/new?paper=<id>` and files it onto the end. Every question carries an
**Edit** link, so a typo is fixed where you found it.

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

There is nothing to prepare.

**The teacher** creates a session with a student and a time, and that is the whole of their side
of it. No paper to build, nothing to stage, nothing to hand over during the lesson.

**The student** opens the session themselves once its time has passed, and the **easy test**
loads for them: twenty questions, one on screen at a time, each with its own clock. They answer,
press **Next**, and the next one appears.

**The level moves when it is wrong.** The teacher is the one who decides — they are watching the
work and can see when it is too easy — and both screens carry the same three buttons, because on
a call it is usually quicker for the student to click than for the teacher to switch windows.
Moving loads that test and opens its first question. The question that was on screen is left
unanswered and recorded as such, and a question already asked is never asked again, even coming
back down. Easy → medium → hard is the path; the other direction works too, because "drop one
level — rebuild fluency before speed" is a real instruction and had nowhere to be acted on.

**Routes.** Every screen is a place: `/questions` (the bank, opening on the three tests),
`/tests/:id` (read one), `/sessions/:id` (the console). There is no `/tests` list and no Tests
nav item — Questions already opens on that list, and a second entry pointing at the same three
rows was a menu item that told you nothing. The exam is `/exam/:id`, deliberately outside the app
shell: a student sitting a test should see the test and nothing else.

**Times are UTC**, everywhere and always — written on the schedule form, printed on every
session card, and said out loud in the text (`31 Aug 2026, 14:30 UTC`). A teacher in Singapore
and a student in Dubai have to mean the same moment by "half four", and rendering each browser's
own zone meant they did not. `apps/web/src/lib/time.ts` is the only place that formats one.

When the results are published the student gets the whole test back, not a list of letters:
every question as they met it, their answer and the right one marked on the choices, and the
explanation underneath. The key is not in a student's reach — `question_keys` is teacher-only —
so it comes from what the reveal copied onto their own item row.

The student sees the session on their list with a countdown. Once the scheduled time passes the
**Start** button turns on — no one has to let them in.

The test runs full screen, asked for inside the click that starts it — the only moment a browser
grants it. Leaving full screen is not blocked (no browser allows that, and none should), so it is
treated as what it is: the screen asks them to come back or to finish.

Nor can they wander off: while a question is open, the browser's back button and a refresh are
both caught, and leaving is a decision the screen asks about first. Saying yes submits the test
as it stands — `finish_session_as_student` completes the session and voids every question they
never answered, including the one on screen. A test you can leave and come back to is not a test,
and the per-question clock would mean nothing.

**Afterwards** the teacher presses **Publish results** once: every answered question is revealed
to the student and the report is published in the same action. Whether the student learns how
they did is one decision about the session, not twenty decisions about twenty questions.
Diagnoses are still per question — that is the teacher's judgement, and it is what the report is
built out of — but they can be tapped as soon as an answer lands rather than only after a reveal.
The console shows the level as a single box, with the three buttons that change it, rather than a
card per question: there is nothing to do to any one of them from there, and twenty cards is a
wall to scroll past.

One question is in front of the student at a time and it is the *server* that holds that line:
only the current item is `published` and everything else is `staged`, which is invisible under
RLS. The next one is published by `submit_answer` once the current one is answered. So loading
twenty questions on a level move is not putting twenty questions in front of the student — it is
putting one in front of them and nineteen out of reach, and the clock on question 3 cannot be
spent reading question 4. That is also why the length lives on `sessions.level_size`: the student
is shown "question 3 of 20" and has no way to count the test for themselves.

## Speed

Every answer is timed server-side: `session_items.first_viewed_at` (set when the question is
actually on the student's screen, not when it was published) to `decided_at` — the moment the
student has an answer and a confidence down. The seconds after that are finding the Submit
button, and they were landing in the number the report calls pace. Stored as
`session_item_assessments.elapsed_seconds`; the student watches the same interval stop on the
question itself. A change of mind afterwards does not restart it. Each question carries a `target_seconds` benchmark, so
the report can separate *wrong* from *wrong in nineteen seconds* — those need different fixes.

## The report

`/sessions/:id/report`. Score, per-skill and per-section breakdown weakest first, pace against
target, the teacher's diagnoses, and every miss with the student's own reasoning and the teacher's
note beside it. Everything is computed from the session's rows — nothing is stored and nothing is
written by hand, so the report cannot say something the session did not.

**Save as PDF** gives the parent's copy. The app furniture drops away — sidebar, back link,
buttons — and what is left is the report as it appears on screen, keeping its heading (student,
subject, date, teacher) and keeping cards off page breaks. There is no second document to hold in
step with the data: the PDF is the report.

## Writing it up from the recording

`/sessions/:id/report/edit`. The session finishes, the teacher drops in the Fathom transcript, and
the page does the part nobody wants to do by hand: it lines the recording up against the questions
and reads it back.

Alignment is a lookup, not a guess. Every question already knows when it was on the student's
screen, and every Fathom turn knows how many minutes into the recording it was said. The one
unknown is where question 1 sits in the recording — Fathom starts before the lesson does — so
there is one dial for that, and **Find it** sets it by trying every offset and keeping the one
that leaves the fewest questions with nobody talking about them.

Then it reads the conversation. The teacher asks for the reasoning on every question, including
the ones the student gets right, and that is the thing the answer rows cannot see: a tick is a tick
whether the student explained it or shrugged. So each question gets a verdict — *explained it*,
*self-corrected*, *right but no reason given*, *misread the stem*, *talked out of the right one*,
*method held but the concept did not*, *no reasoning* — together with who did the talking on it. A
miss the teacher explained is not the same finding as one the student worked and still lost.

Those become findings, per domain, offered as buttons under the two written columns of the grid.
Each one names the questions it came from and shows the student's own words underneath, so it can
be checked before it goes in. Clicking appends it; the teacher edits it into their own words or
ignores it and writes their own. **Nothing is written into the report by the analysis**, and the
sentences that reach a parent are the teacher's.

It is deterministic — no model, no network call — so the same transcript gives the same findings
twice and the whole thing is unit tested. Who is who in the recording is a control rather than an
inference, because Fathom labels turns with whatever people typed into Zoom and attributing the
teacher's explanation to the student would poison every finding under it.
[`docs/reference/transcript-analysis.md`](docs/reference/transcript-analysis.md) is the structure
in full.

## The session workflow

```
teacher creates a session with a student and a time      (nothing else to do)
  → the scheduled time passes
  → student opens the session themselves
  → the EASY test loads; question 1 is published to them
  → student crosses out options, answers, says how sure
  → Next → answering publishes the next question; repeat
  → teacher sees each answer, the eliminations, the time and the confidence

  → too easy?     either of them presses Medium
                  the open question is voided, the rest of easy is dropped,
                  medium's question 1 is published
  → about right?  nothing to press. keep going.
  → too easy again?  press Hard

  → teacher publishes the results          (only now does the student learn them)
  → teacher taps one diagnosis chip per question; the system suggests the next move
```

The suggestion encodes what the teachers already do — escalate on solid reasoning, hold the
level on a lucky guess or a concept gap, drop a level when they ran out of time. It suggests;
it never moves anybody. The teacher's judgement is the product, and now the three buttons that
act on it are on both screens.

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
psql "$DATABASE_URL" -f supabase/tests/level_session.sql
psql "$DATABASE_URL" -f supabase/tests/opening_early.sql
psql "$DATABASE_URL" -f supabase/tests/authoring.sql
```

> Every `revoke execute … from anon` in `supabase/migrations` before `0018` is decorative:
> Postgres grants EXECUTE to PUBLIC, `anon` is a member of PUBLIC, and revoking from the role
> leaves the PUBLIC grant standing. Nothing leaks through it — the RPCs are all SECURITY DEFINER
> *and* check `auth.uid()`, and the loaders are not SECURITY DEFINER so RLS refuses their writes —
> but `0018` shuts it properly for the three functions no client should ever reach. The rest are
> still granted to PUBLIC; tightening those touches `is_teacher()`, which RLS policies call as the
> querying role, so it wants its own test pass.

Between them these assert: a signup asking for `admin` is coerced to `student`; a student
cannot self-promote or author questions; a queued question is invisible and unanswerable; a
published question exposes the question and its options but never the key; after submitting,
the student cannot learn whether they were right; and the teacher's diagnosis is never visible
to the student. `level_session.sql` is the whole of the session flow: a student cannot open a
session early or open somebody else's, opening loads the easy test, exactly one question is
within their reach at a time, answering brings up the next in the test's order, moving level
voids the question on screen and opens the new test at its first, what was already answered
survives the move, no question is asked twice even coming back down, either seat can move it and
a stranger cannot, and `set_session_paper` and `publish_item` are gone. `opening_early.sql`
covers the waiver: the scheduled time is a real gate, only the session's own teacher can lift it,
lifting it rewrites neither `scheduled_at` nor the status, and it cannot be taken back once the
student is in. Every row must read PASS.

`rls_contract.sql` and `session_flow.sql` are written for a scratch database — they reset the
display-id counters on their way out, and `rls_contract.sql` counts the whole bank, so its two
count rows read FAIL against a database the content migrations have been run on.
`level_session.sql` and `opening_early.sql` leave the counters alone and are safe against a real
one; `level_session.sql` needs the three tests loaded (`0026`).

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
