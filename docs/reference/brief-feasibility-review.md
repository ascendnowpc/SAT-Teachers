# Brief feasibility review

Reviewing `SAT_Tracker_Brief_Sneha.pdf` (Ascend Now, build brief) against this repository at
`88cfff3`, branch `english-cross-text-practice`. As of 6 November 2026.

## The short version

**Most of this brief is already built.** Four of the seven feature requirements are live today,
one is deliberately built the other way round, and two — Bluebook import and the retention
policy — do not exist at all.

A first version is roughly **three weeks of engineering**. It is gated on content rather than
code: no skill yet holds enough questions to fill a 10–15 question test, so the realistic date is
**about six weeks**, and the engineering finishes early and waits.

The sharpest finding is in the bank itself. The 48 newest questions were transcribed from
OnePrep, which the brief's own copyright constraint rules out. That decision gates the content
work, which gates the launch, so it is worth more to the timeline than any amount of developer
scheduling.

Health of what exists: 66 migrations, 496 tests across 34 files, all passing. Deployed on Vercel
and Supabase.

## Feature by feature

| Brief requirement | Where it stands |
| --- | --- |
| **Levelled question bank**, tagged by section + sub-skill + difficulty | **Built, and deeper than asked.** Three tests per subject (easy / medium / hard), 30 skills in the grid (11 English, 19 maths), and every item carries a `difficulty_rationale` — a sentence saying *why* it sits at that level. The database checks the section/skill pair, so an item cannot be misfiled. (`0010`, `0026`, `0040`, `0041`) |
| **Timed mini-tests**, 10–15 Qs, ~1 min each | **Built**, as targeted tests. Per-question clock and an overall clock, both counted in server time; a question whose clock runs out is marked wrong. Default set size is 5, capped at 20 — so 10–15 is a settings change, not a build. The set builder has level mixes defined for 5 and 10; 15 needs one line. (`0061`, `0062`) |
| **Analytics beyond score** — accuracy per sub-skill, time per question, behaviour flags | **Built** (`lib/targetedAnalytics.ts`). Accuracy per sub-skill and per difficulty, time against a per-question target, rushing / hesitation / gaps, what timed out, long questions against short, and question format. The brief's "skipping long questions = anxiety" insight already exists as a flag — pooled across every test on the skill and only stated once there is enough of each (`pattern_min_each`, `pattern_gap`). |
| **Personalised profiles** (student + tutor logins) holding history + trend | **Half built, and deliberately the other way.** Teachers, admins and PCs have accounts; students do not. But the *outcome* is already there: `student_progress()` holds each skill's line from the diagnostic baseline through every targeted test since, across every teacher the student has had. |
| **Bluebook integration** — import full-length results | **Does not exist.** Bluebook appears only as the source of the screenshots the English items were transcribed from, and as the UI the answer-eliminator was modelled on. There is no import of any kind. |
| **Parent report** — clean, visual, screenshot-ready, no login via student ID | **Built, but with a login.** The PC is a real role with an account, reads `/students/:id/progress` read-only, and is emailed the report as a PDF drawn by `_shared/pdf.ts` from the same functions the on-screen report uses. The no-login-by-student-ID part is not built, and should not be — see below. (`0054`, `0055`) |
| **Data-retention policy** — delete inactive profiles | **Does not exist.** No retention, no purge job, nothing scheduled. |

### One mismatch worth naming

The brief asks for **skipped questions** as a behaviour signal. There is no skip: `0062` removed
skipping and going back on purpose, so a targeted test runs forward only. The equivalent signals
already recorded are **timed out** (the clock ran out, counted wrong) and **not reached** (never
shown, left out of the score). Those carry the same diagnostic weight, but if the tutors
specifically want a *Skip* button the student can press, that is a real change to the test
mechanic and needs saying now rather than later.

## Three places the brief and the build disagree

### 1. The copyright rule and the bank contradict each other — decide this first

The brief says: do not host past official SAT papers, use official publicly available questions,
and point students at OnePrep and UWorld for extra volume.

The bank does not currently meet that rule.

- The 60 English items were transcribed off Bluebook UI screenshots of what the audit calls "a
  curated selection pulled from full tests" (`docs/reference/source-material-audit.md`).
- The 48 newest items — migration `0065`, on this branch now — were transcribed from two OnePrep
  screen recordings, and carry **OnePrep's own accuracy and timing statistics** stored per item as
  the difficulty rationale.

OnePrep is named in the brief as somewhere to *send* students, not somewhere to copy from. This is
the repository's oldest open question (`docs/07-open-questions.md` Q3, flagged blocking and
non-technical from the start) and it has never been answered.

It is cheap to settle now and expensive after the bank is 450 items deep, because the remedy is
re-sourcing every affected item. Options:

1. License a question bank.
2. Commission original items against the taxonomy that already exists.
3. Restrict to genuinely open sources — Khan Academy's official partnership content and the public
   College Board practice material — and check each one's terms.

Only (2) and (3) are free of a third-party licence, and (2) is what sets the content budget below.
**This is a decision for the employer and probably their lawyer, not an engineering call.**

### 2. Student logins buy less than they cost

The brief prefers logins because "the progress history is the whole point". The history already
works without them.

`0032` removed student accounts deliberately — the teachers did not want them, and students are
often minors without their own email. Adding logins back means handling accounts for minors:
parental consent, password resets for teenagers, and a support burden that lands on the tutors.
About one and a half to two weeks, and it adds a compliance surface the product currently does not
have.

I would defer it, and revisit if students actually start asking to sit practice outside a session.

### 3. "Opened via student ID, no login" is a step backwards

Student IDs are `BATO26-1` — three letters of the given name, one of the surname, the join year,
then a serial. **That is derivable from a name.** Anyone who can guess a classmate's ID could read
a child's performance history.

What the brief actually wants — a parent who does not have to remember a password — is better
served by a signed expiring link, which is what `docs/07-open-questions.md` Q6 recommended before
the PC account was built. Same accessibility, not guessable. The PC account should stay for
parents who want history rather than a single report.

## The six open questions

### 1 · Build vs off-the-shelf

**Build — and the question is largely settled by what already exists.** Roughly 70% of the brief
runs today across 66 migrations and 496 passing tests.

No off-the-shelf quiz or LMS does the three things this product actually sells: the live
teacher-driven question loop during a Zoom session, per-question pacing measured against a
per-skill target, and a parent report where every claim expands to the question, the answer and
the quote behind it. Configuring an LMS means rebuilding those or dropping them, and discarding
the row-level-security model that keeps answer keys out of reach of students. Finishing is cheaper
than switching by a wide margin.

### 2 · The question bank — source, and who tags them

**Tagging is solved. Depth is the problem.**

Every item already carries section, skill, difficulty and a rationale; the authoring form requires
all four, and the database rejects a skill that does not belong to its section. Nobody needs to go
back and tag anything.

What is missing is volume. The README states it plainly: *no skill has ten questions across the
three tests*. One skill — Cross-Text Connections — has depth, from the 48 OnePrep items, and those
are exactly the ones in question above.

For 10–15 question tests that can run twice on a skill without repeating, you need roughly 15–20
items per skill. Across 30 skills that is about **450 items**, against 168 today (108 English — 60
in the tests, 48 in the pool — and 60 maths).

At a realistic 12–15 items a day for one subject-matter person writing originals with keys,
explanations and rationales, that is **five to six weeks of content work**. It needs a tutor, not a
developer, and it runs in parallel with everything else — but it cannot start until question 1 is
answered.

### 3 · Bluebook import — manual entry, or anything automated?

**Manual, and that is not a budget problem.**

Bluebook is College Board's locked-down desktop application. There is no public API, no export
format a tool could read, and automating against it would breach its terms. There is no price at
which a true import is available — this is a hard constraint, not a cost trade-off.

What is feasible and cheap: a short form where the tutor types what College Board actually reports
back — the two section scores and the per-domain performance bands — stored as a mock result
against the student and shown on the progress line beside the targeted tests. That delivers the
"complete picture" the brief is after. **Three to four days.**

### 4 · Auth, hosting, and the retention period

**Auth and hosting are already decided and running.** Supabase Auth with row-level security
(reviewed and written up in `docs/reference/security-review.md`), Vercel for the web app, Supabase
edge functions for mail and for reading the recordings. Nothing needs to change.

Two free fixes are outstanding and should just be done: turn on leaked-password protection in the
Supabase project, and pin the edge function's CORS origin.

**On the retention period: a month after inactivity is too aggressive and would damage the
product.** The progress line hangs off a student's diagnostic baseline. Delete a profile a month
after their last session and a student who pauses over exam season comes back with no baseline —
so every trend the parent report sells is gone, and it cannot be rebuilt without re-running the
diagnostic.

What I would propose instead, as a written policy:

- Keep a student's profile and progress for as long as they are on the roster.
- Delete a dormant student **12 months** after their last session, with a soft-delete window first.
- Purge session recordings and transcripts much sooner — **60 to 90 days**. These are the sensitive
  records (a recording of a minor) and they are not what the progress line needs.

Implementation is a scheduled job (`pg_cron`) plus soft delete: **three to four days**. The policy
itself needs the employer's sign-off and ought to be checked against whichever jurisdiction
applies — the project currently defaults to `Asia/Singapore`.

### 5 · The parent-report output

**Most of it exists.** A report already renders as a page and as a PDF, emailed to the PC when a
teacher or admin sends it. The PDF is drawn from the same functions as the page, so the two cannot
disagree — a deliberate design choice, and worth keeping.

What the brief adds is "screenshot-ready": one compact card carrying the headline metric
("Writing 2/15 → 5/15"), the RAG skill map and the trend over time. That is a new view over data
that already exists. **Three to four days**, including the signed-link delivery from point 3 of the
previous section.

### 6 · Timeline and cost for a first version

Engineering, assuming one developer:

| Work | Days |
| --- | --- |
| Mini-test size 10–15 (config + one set-mix line) | 0.5 |
| Bluebook manual entry + mock result on the progress line | 3–4 |
| Parent screenshot card + signed expiring link | 3–4 |
| Retention: soft delete + `pg_cron` purge | 3–4 |
| Security tidy (leaked-password, CORS, token rotation) | 1–2 |
| Contingency | 2–3 |
| **Total** | **13–18 days (~3 weeks)** |

Content, in parallel: **~350 new items at 12–15/day ≈ 5–6 weeks**, by a tutor rather than a
developer — so it costs a tutor's rate, not an engineer's.

Student logins, only if required after all: **+1.5–2 weeks**, where the consent handling is the
slow part, not the code.

Where the time actually goes:

```
             wk1    wk2    wk3    wk4    wk5    wk6    wk7
Legal call   ####                                              <- blocks everything below
Content           ######################################       <- critical path
Engineering       ####################
Launch                                              ^
```

**About six weeks to a first version, and the critical path is content, not code.** Engineering
finishes in three weeks and then waits. Every week the copyright question goes unanswered moves the
launch by a week.

I have given this as developer-days rather than a figure, since the rate is yours to apply.

## Running costs

| Item | Monthly |
| --- | --- |
| Supabase Pro (daily backups, no auto-pause) | $25 |
| Vercel (Hobby covers one small app; Pro if the team needs seats) | $0–20 |
| Gemini API, for reading the recordings | a few dollars at this volume |
| Google Workspace SMTP | already paid for |
| Domain | ~$15/year |
| **Total** | **~$30–50/month** |

List prices as I understand them — worth confirming at purchase.

## What I need decided before starting

1. **The copyright question.** Gates the content work, which gates the launch. *(employer + legal)*
2. **Student logins** — yes or no, knowing the progress history already works without them.
   *(employer)*
3. **Parent access** — signed expiring link, the PC account, or both. I would say both. *(employer)*
4. **Retention windows** — 12 months for profiles and 60–90 days for recordings, or different
   numbers. *(employer)*
5. **Mini-test size** — 10, 12 or 15, and whether it differs by subject. *(tutors)*
6. **Skip button** — whether the tutors want a real one, given the test is currently forward-only.
   *(tutors)*
