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
| **Signup** | Teachers only. Students are added by their teacher and need no account at all |
| **Login** | Email + password, for teachers |
| **Question bank** | Teachers write and correct MCQs: passage or figure, question, up to 4 options, key, explanation |
| **Three tests** | English is easy, medium and hard — twenty questions each, under Questions, read as printed |
| **Maths, empty** | Mathematics has its three tests too, waiting for questions. A subject is bookable once they are filled |
| **Where it goes** | A question is written *inside* a test, in one call, and takes that test's subject and level |
| **Difficulty** | Easy / medium / hard, and every question says *why* it sits at that level |
| **Sections** | Subject, the four SAT sections the teachers assess against, and the skill within each |
| **Sessions** | Schedule with a student and a time. That is all — nothing to build beforehand |
| **The roster** | Add a student from the New session form: first name, last name, their PC. No sign-up |
| **The link** | Every session carries one. Send it and the student is in — no account, no login |
| **The list** | One table, searched and filtered: student, PC, id, title, status, level, subject |
| **The level** | The session starts on easy; the student *or the teacher* moves it while it runs |
| **The console** | Everything the student's screen can do: open the test, see the live question, answer for them, hand it in |
| **Exam screen** | One question at a time, its own clock running, stimulus left and question right |
| **Live loop** | Watch each answer land with its time and confidence, reveal, diagnose in one tap |
| **Speed** | Every answer is timed from first view to submit, and measured against a per-question target |
| **Report** | Score, per-skill and per-section breakdown, pace, and every miss with what both people said |
| **Transcript** | Drop in the Fathom recording; it lines up against the questions and is read back as findings |
| **Loaded bank** | 60 items with passages, keys, sections and difficulty, and every one of them in a test |
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

The bank used to hold twenty-six items besides: the in-class *Reading and Writing – 25Q*
diagnostic (`0008`) and one Test 4 item the level document does not use. `0029` retired them,
because an item no session can ask is not stock and totalling it with the sixty made the bank look
half again as deep as it is. `0040` deletes them, with one exception it makes on purpose —
`ENG-DIAG-T4-M2-Q01` is the first question of the 7 August recorded session (`0012`), and
`session_items` points at questions without a cascade, so deleting it would not tidy a report, it
would tear a question out of one. It stays, and it stays retired. Read on the in-class paper's
answer key, which came with **seven printed answers that disagreed with their own passage**, in
[`docs/reference/english-diagnostic-key-review.md`](docs/reference/english-diagnostic-key-review.md)
— the review stands even though the items are gone.

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

**A question is written into a test, or it is not written.** `/questions/new?paper=<id>` is the
only way in; reaching `/questions/new` without one lists the tests instead of opening the form.
`create_question_in_set` writes the question, its options, its key *and* its place in the test in
a single transaction (`0040`), so there is no window in which a question exists and is filed
nowhere. The test decides the subject and the level, so neither is asked for: an item in the easy
test is easy, which is the rule `0026` set and the one thing that keeps the bank's counts and the
tests from disagreeing.

They did disagree. The bank page read *61 questions in use · 21 medium* while the medium test
held twenty, because writing and filing were two calls and the bank page's own **Add question**
button had no test to file into — it made a question that was counted in the headline and
displayed on no screen in the product. Every count on the bank page and the dashboard is now
summed from the tests themselves, so a number that moves has a row you can open; anything the
bank still holds outside a test is named at the top of the page rather than folded into a total.

`/questions/:id/edit` corrects one — the same form, and
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

**Add question** on an open test — or on its row in the bank — arrives at
`/questions/new?paper=<id>` and files it onto the end. Every question carries an **Edit** link, so
a typo is fixed where you found it, and an edit cannot move a question out of step with the test
it is printed in: the level shown is the test's and is read-only.

**Mathematics has its three tests as of `0040`**, and they are empty. Nothing else was needed to
make them work — `load_session_level` has looked a test up by the session's subject as well as its
level since `0027` — so the day the first maths question is written, a maths session runs it. Until
then the New session form refuses the subject, and it refuses it by reading the bank rather than by
naming English in the code, so filling the tests is the whole of what it takes.

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

**The student is a roster row, not an account.** If the teacher already has them, they pick them
by name, id or PC. If not, they type first name, last name and PC into the same form and
the student is created as the session is — `create_student` (0032), teacher-only. There is no
student sign-up any more, and `profiles.id` no longer references `auth.users`, because a roster
student has no auth user to point at.

**The session is a link.** Every session carries a 64-character token and the form hands it back
the moment the session exists: `/s/<token>`. Opening it puts the student straight into their own
session with nothing to sign into — the same lobby, the same questions, the same clock. The token
functions (0033) take the token, find the one session it names, and do exactly what that
session's student could already do; the payload is built server-side and never carries the answer
key, the token itself, or a question that is still staged. Students who already have an account
still sign in and still open their sessions at `/exam/:id`; the link is a second door, not a
replacement for the first.

**The student** opens the session once its time has passed, and the **easy test**
loads for them: twenty questions, one on screen at a time, each with its own clock. They answer,
press **Next**, and the next one appears.

**The level moves when it is wrong.** The teacher is the one who decides — they are watching the
work and can see when it is too easy — and it can be pressed from either side: the student's own
screen offers the single obvious move (the next test up, or the way back down from hard), and the
console offers all three, because that is the person making the decision rather than being handed
it mid-question. Moving loads that test and opens its first question. The question that was on
screen is left unanswered and recorded as such, and a question already asked is never asked
again, even coming back down. Easy → medium → hard is the path; the other direction works too,
because "drop one level — rebuild fluency before speed" is a real instruction and had nowhere to
be acted on.

**When the student's screen is not working**, the teacher's is. A phone, a school network, a
browser that will not go full screen, a Zoom share that never starts — any of them used to leave
the teacher blind and the session stuck, because starting the test, answering, moving level and
handing in were all things only the student could do. The console does all four now (0034). It
shows the question the student is on in full — stimulus, stem, all four choices — and **Answer
for the student** enters what they said out loud. That is not a second kind of answer: it goes on
the student's own item, is graded against the same key, stops the same clock and opens their next
question, because the report reads one data set and a second kind of answer in it would be a lie
about the lesson.

**Routes.** Every screen is a place: `/questions` (the bank, opening on the three tests),
`/tests/:id` (read one), `/sessions` (the table), `/sessions/:id` (the console). There is no
`/tests` list and no Tests nav item — Questions already opens on that list, and a second entry
pointing at the same three rows was a menu item that told you nothing. The exam is `/exam/:id`
for a signed-in student and `/s/:token` for one on a link, both deliberately outside the app
shell: a student sitting a test should see the test and nothing else. `/s/` is matched before
anything asks who is signed in, because the answer is nobody.

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

**Afterwards** the teacher presses **Publish results** once and every answered question is
revealed to the student. Whether they learn how they did is one decision about the session, not
twenty decisions about twenty questions. It publishes no report: that is a separate, deliberate
step below the board, and it cannot happen before the diagnostic form is in.
Diagnoses are still per question — that is the teacher's judgement, and it is what the report is
built out of — but they can be tapped as soon as an answer lands rather than only after a reveal.

**The board is grouped by test, not by level-the-session-happens-to-be-on.** A student who did
six easy questions and then twenty medium ones sat two tests, and both get their own heading with
their own score. Questions the student never reached are behind a switch rather than in the list
— fourteen "not attempted" rows bury the six that carry the lesson — but a test that was opened
and produced no answers still gets its heading and says so, which is the case the grouping was
built for: without it, a level the student was moved off before answering anything vanished from
the console entirely.

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

## The diagnostic form

`/sessions/:id/diagnostic`. A diagnostic finishes with no score and no report, and what the
teachers do next they already do on paper: they fill in the English reflection grid while the
hour is still fresh, write what they made of it, and hand over the Fathom transcript. The report
is generated from those afterwards. This is that form, in the order they fill it.

```
diagnostic session ends
  → no score, no report
  → the console offers one thing: FILL THE DIAGNOSTIC FORM
  → teacher fills the reflection grid   ✓/✗, strengths, gaps, next steps — per domain
  → teacher writes their comments
  → teacher uploads or pastes the Fathom transcript
  → the console shows the form back, and offers GENERATE REPORT
  → teacher presses it; the report is generated and stored
  → the report goes to the student and the parent
```

**The console follows that order and offers nothing else.** There is no Report button and no
Diagnostic form button sitting in the header from the moment a session is created — a button that
is there before there is anything behind it is a button that gets pressed at the wrong time. While
the test is running the console is the board. Once the session is over, a panel above it offers
the form — above, because writing it up is the work now and the answers are the reference, and a
teacher scrolling past twenty rows to find the button is being shown the wrong thing first. Once
the form is submitted, the same panel shows what was written — the grid, the comments, the
transcript — with **Generate report** underneath. `generate_report` refuses to run
before `form_submitted_at` is set, so the rule holds outside the browser too. Generating is not
sharing: the report stays a draft until it is published.

The grid on screen is the grid on the paper: the same six columns in the same order, four domain
rows, Domain and Skill Focus printed and the rest editable. **Next steps/Targets arrives
prefilled** with the form's own wording — a teacher who agrees with it should not have to retype
it to say so — and is theirs to rewrite. Student Performance offers a tick and a cross and
nothing else, because that is what the paper offers: it is one judgement the teacher signs about
the domain, not an arithmetic over answers nobody has marked yet. The paper's box is bigger than
a tick and teachers write in it, so there is a note under the mark — the one optional box on the
form.

**Every field is required.** A report generated from a form with two domains filled in reads as a
judgement about four. Trying to hand in an unfinished one marks the empty cells and says what is
missing by column rather than listing sixteen of them; `submit_diagnostic_form` checks the same
thing in Postgres, so "required" is a rule rather than a convention the browser keeps. A
part-filled form still saves as a draft — nobody types four domains of notes in one sitting.

What it writes: `session_domain_notes` gains `performance`, `performance_note` and `targets`
alongside the strengths and gaps it already held; `session_reports` takes the comments in
`teacher_reflection` and the two moments in `form_submitted_at` and `generated_at`; the transcript
goes where it always went. Nothing on the form computes, scores or concludes anything.

## Reading the recording

Between the form and the report there is one more button: **Read the recording**. The transcript is
cut into one window per question — arithmetic, from `first_viewed_at` plus the offset, never a
guess — and a model reads each window and records what it shows: how the student got to their
answer, what they misunderstood, a word they said they did not know, and **everything the teacher
told them about that question**, typed by what kind of feedback it was.

The rule is the one the rest of the report keeps. **Every claim carries a quote, and a claim whose
quote is not verbatim in the recording is dropped rather than repaired** — along with any claim
carrying a number its own quote does not contain, because figures come from the answer rows. The
checking happens in the edge function, not the browser, since a promise a client makes about itself
is not a promise. What survives is stored; what did not is stored too, because a rising drop rate is
how a broken prompt announces itself.

It reads who is speaking from *what was said*, not from the label. Fathom attributes a block of time
to one person and the other's words land at the end of it — across the two recordings we have, the
teacher's "Very good absolutely right, good job with the vocab questions" sits at the tail of a turn
labelled with the student's name, fourteen provable times and never once the other way round. The
deterministic reader believes the label and therefore reads the teacher's own explanations as the
student's reasoning. Where the model overrules a label the report says so on the line.

The report then puts the three side by side and never merges them: **what the teacher wrote**, word
for word; **what the recording shows**, each with its quote; and **what the answers count**. Every
piece of transcript evidence says whether it *supports*, *complicates* or *adds to* what the teacher
wrote, and the ones that complicate get their own section — that is the row where one of the two is
wrong and only the teacher can say which. Without it a teacher's own sentence, handed back in
different words, would read to a parent as a second independent finding.

A reading is optional. The form, the grid and the computed numbers are a complete report on their
own, and a model being down on a Thursday does not stop a teacher finishing their work. A reading
taken from a transcript that has since been replaced is not optional to notice: `generate_report`
refuses it.

The design, the measurements behind it, and what to watch before trusting it are in
[`docs/reference/context-extraction.md`](docs/reference/context-extraction.md).

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

  → too easy?     the teacher says so and the student presses Medium
                  the open question is voided, the rest of easy is dropped,
                  medium's question 1 is published
  → about right?  nothing to press. keep going.
  → too easy again?  press Hard

  → teacher publishes the results          (only now does the student learn them)
  → teacher taps one diagnosis chip per question; the system suggests the next move
  → teacher fills the diagnostic form: the grid, their comments, the transcript
```

The suggestion encodes what the teachers already do — escalate on solid reasoning, hold the
level on a lucky guess or a concept gap, drop a level when they ran out of time. It suggests;
it never moves anybody. The teacher's judgement is the product.

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
psql "$DATABASE_URL" -f supabase/tests/session_link.sql
```

> **The revoke that does not revoke, three times.** `revoke execute … from anon` is decorative:
> Postgres grants EXECUTE to PUBLIC and `anon` is a member of PUBLIC, so revoking from the role
> leaves the PUBLIC grant standing. `0018` found that and fixed three functions by revoking from
> PUBLIC; `0028` found it again on `load_session_level`. `0035` found that revoking from PUBLIC is
> only half of it — this project has
>
> ```sql
> alter default privileges in schema public grant execute on functions to anon, authenticated, …;
> ```
>
> so every new function in `public` is born with an **explicit** grant to `anon` that has nothing
> to do with PUBLIC and survives revoking from it. A function can therefore have no PUBLIC grant,
> an explicit grant to `authenticated`, and still be callable by anyone holding the publishable
> key. That left four SECURITY DEFINER functions that check nothing — by design, because their
> callers do — reachable anonymously: `open_session_now`, `record_answer`, `end_session_now` and
> `publish_one_item` (open since `0023`). `0035` revokes from `anon` and `authenticated` by name
> as well as from PUBLIC, and `session_link.sql` now asserts the whole grant table, so the next
> function written in this schema fails a test rather than repeating the note.
>
> Watch for one trap when revoking: a **column default is evaluated as the INSERTing role**, so
> `sessions.access_token default new_session_token()` broke every session insert the moment that
> function was revoked from `authenticated`. The default carries the expression inline instead.
>
> The report and session RPCs `0018` deferred are still granted to PUBLIC. Every one of them opens
> with `assert_session_teacher` or a check on `auth.uid()`, so an anonymous caller gets an
> exception rather than a session; tightening them touches `is_teacher()`, which RLS policies call
> as the querying role, so it still wants its own test pass.

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
`level_session.sql`, `opening_early.sql`, `authoring.sql` and `session_link.sql` leave the counters
alone and are safe against a real one; `level_session.sql` and `session_link.sql` need the three
tests loaded (`0026`), and `authoring.sql`'s filing section needs the mathematics easy test
(`0040`) — without it those rows read SKIP rather than FAIL. `session_link.sql` is the contract for the three doors 0032–0034 opened: a teacher can
add a roster student and a student cannot; a session's token is unique, opens only its own
session, and never returns the key or the token itself; a link cannot answer another session's
question; and only a session's own teacher can open it, answer in it or end it.

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

**The edge function** — reading the recording runs server-side, because the key would otherwise
ship to every browser and the quote check would be a promise the client makes about itself:

```bash
supabase secrets set GEMINI_API_KEY=...
supabase functions deploy extract_session_context
```

**Gemini reads the recording**, and `apps/web/src/lib/gemini.ts` is the only file that knows it —
the guard, the prompt, the schema and the report are written against a shape, not a vendor. The
model id defaults to `gemini-2.5-pro` and `EXTRACTION_MODEL` overrides it, so a rename is a secret
change rather than a deploy.

To check a prompt change or a new model id against a real recording before deploying it,
`tools/bench-extraction.mjs` runs one transcript through with no database in the way and reports the
drop rate — how often the model was asked for a verbatim quote and did not give one:

```bash
GEMINI_API_KEY=… node tools/bench-extraction.mjs transcript.txt 23
```

It imports the guard from `apps/web/src/lib/` rather than carrying its own copy, so the modules
the vitest suite protects are the ones that actually run. Without the secret the function returns
a 500 saying so, and the rest of the report still works — a reading is an enrichment, not a
dependency.

> Email confirmation is on by default. To let people in immediately after signing up, turn it
> off under **Authentication → Sign In / Providers → Email**. The signup screen handles both.
