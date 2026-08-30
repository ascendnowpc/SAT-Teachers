# SAT Teachers

Platform for Ascend Now's 1:1 SAT tutoring — a tagged question bank, a live teacher-driven
question loop during Zoom sessions, and an evidence-backed session report for the parent.

The full system design is in [`docs/`](docs/README.md). **What is built so far** is the first
slice: signup and login for teachers and students, and a text-only MCQ bank with difficulty.

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
| **Signup** | Direct, for teachers and students. Picking a role issues a readable ID — `TCH-0001`, `STU-0001` |
| **Login** | Email + password |
| **Question bank** | Teachers author text MCQs: passage, question, up to 4 options, correct answer, explanation |
| **Difficulty** | Easy / medium / hard, plus an optional note on *why* it sits at that level |
| **Classification** | Subject, and the four Digital SAT domains per subject |
| **Browsing** | Filter by subject, domain and difficulty; free-text search |

Students can sign in and see their ID, but have no access to questions — that arrives with
sessions. A student cannot read the bank, the options, or the answer key at all; see below.

## The one rule that shapes the schema

Postgres RLS is *row*-level: a policy cannot hide a single column of a row it grants. And
Supabase Realtime pushes whole rows to subscribed clients. So **anything a student must not
see lives in a table a student cannot read** — which is why `question_keys` is its own table
rather than a `correct_option` column on `questions`. Once students start receiving questions
in live sessions, there is no row and no column for the answer to leak from.

```bash
psql "$DATABASE_URL" -f supabase/tests/rls_contract.sql
```

That asserts it, along with: a signup asking for `admin` is coerced to `student`, a student
cannot self-promote by updating their own profile, and a student cannot author questions.
Every row must read PASS.

## Layout

```
apps/web/              React + TypeScript + Vite  → Vercel
supabase/migrations/   schema, RLS, the create_question RPC
supabase/tests/        the security contract
docs/                  system design for everything not yet built
tools/                 PDF question extractor (for the screenshot library, later)
```

`apps/api` (Fastify on Render) is not needed yet — nothing in this slice requires the service
role. It arrives with session grading, where comparing an answer against `question_keys` must
happen server-side. See [docs/03-architecture.md](docs/03-architecture.md).

## Deploying

**Vercel** — set the project root to `apps/web`; `vercel.json` already handles the SPA rewrite.
Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in the project's environment variables.

**Supabase** — migrations in `supabase/migrations` are ordered and idempotent to apply in
sequence. Do not change the schema from the dashboard; RLS policies are exactly the thing you
cannot afford to have drift undocumented.

> Email confirmation is on by default. To let people in immediately after signing up, turn it
> off under **Authentication → Sign In / Providers → Email**. The signup screen handles both.
