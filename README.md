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
| **Difficulty** | Easy / medium / hard, plus an optional note on *why* it sits at that level |
| **Sections** | Subject, and the four SAT sections the teachers assess against |
| **Sessions** | Schedule with a student, a time and a meeting link; queue questions; run it live |
| **Live loop** | Publish one question at a time, watch the answer land, reveal, diagnose in one tap |

## Identity codes

`BATO26-1` — first three letters of the given name, first letter of the surname, the two-digit
year of joining, then a number within that prefix starting at 1 and unbounded. So
*BATU Ozcelik*, joining in 2026, becomes `BATO26-1`; the next `BATO26` is `-2`.

Short or single names still produce the same shape: *Jo Kim* is `JOXK26-1`, *Madonna* is
`MADO26-1`.

## The session workflow

```
teacher creates a session with a student, a time and a meeting link
  → queues questions from the bank        (invisible to the student)
  → starts the session; student joins
  → publishes one question                (it appears on the student's screen)
  → student crosses out options, answers, says how sure and why
  → teacher sees the answer, the eliminations, the time and the confidence
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
```

Between them these assert: a signup asking for `admin` is coerced to `student`; a student
cannot self-promote or author questions; a queued question is invisible and unanswerable; a
published question exposes the question and its options but never the key; after submitting,
the student cannot learn whether they were right; and the teacher's diagnosis is never visible
to the student. Every row must read PASS.

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
