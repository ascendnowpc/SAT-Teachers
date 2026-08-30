# 03 — Architecture

## Stack

| Layer | Choice | Deployed on |
| --- | --- | --- |
| Web app | React 18 + TypeScript + Vite, TanStack Query, Tailwind | **Vercel** |
| Database, auth, realtime, file storage | **Supabase** (Postgres 15 + RLS) | Supabase cloud |
| API / worker | Node 20 + TypeScript + Fastify | **Render** |
| AI | Claude (report drafting, later OCR-assisted import) | called from Render only |

## The boundary — what runs where

With Supabase providing auth, database, realtime and storage, it is fair to ask what the Render
service is actually for. It has four jobs that genuinely cannot live anywhere else, and drawing
this line clearly now prevents the usual drift where half the logic ends up in the browser:

> **Supabase serves reads and realtime directly to the browser. Render owns anything
> privileged, long-running, or AI-driven.**

**1. Anything that needs the service-role key.** Grading is the clearest case: comparing a
student's selection against `question_keys` requires reading a table the student cannot read.
That comparison cannot happen in the browser at any price.

**2. Anything long-running.** Report generation is a multi-step LLM pipeline over a full
transcript — realistically 30–90 seconds. Vercel's serverless functions have execution limits
that make this fragile; a persistent Render process with a job queue does not care.

**3. Anything that needs heavy binaries.** PDF report rendering needs headless Chromium.
Question import needs PDF rasterisation (the exact `pymupdf` pipeline used to audit the source
file). Neither belongs in a serverless bundle.

**4. Scheduled work.** Session reminders, nightly analytics rollups (`observed_difficulty`,
`observed_median_seconds`), transcript-processing retries.

Everything else — listing sessions, browsing the question bank, subscribing to the live board —
goes straight from React to Supabase with RLS enforcing access. Routing those through Render
would add a hop and a second place for authorisation bugs to hide.

```
                 ┌────────────────────────────────────────────┐
                 │  React SPA  (Vercel)                       │
                 │  teacher console · student view · reports  │
                 └───────┬──────────────────────────┬─────────┘
      reads + realtime   │                          │  privileged writes
      (RLS-enforced)     │                          │  (JWT verified)
                 ┌───────▼─────────┐        ┌───────▼──────────────┐
                 │    Supabase     │◄───────┤   Render API/worker  │
                 │  Postgres + RLS │ service│  grading · reports   │
                 │  Auth · Realtime│  role  │  import · PDF · cron │
                 │  Storage        │        └───────┬──────────────┘
                 └─────────────────┘                │
                                                    ▼
                                              Claude API
```

## Security model

Three rules, in priority order. The first two are structural — they hold even if a query is
written carelessly later.

### 1. Secrets live in tables, not columns

Postgres RLS is row-level. A policy cannot hide *one column* of a row it grants. So every field
a student must not see lives in a **separate table with its own policy**:

| Table | Holds | Readable by |
| --- | --- | --- |
| `question_keys` | correct option, per-distractor rationales | teacher, admin |
| `session_item_grades` | `is_correct` before reveal | teacher, admin |

This matters most for Realtime. Supabase pushes **whole rows** to subscribed clients. If
`is_correct` were a column on `session_items`, the student's own row — which they must be able
to subscribe to — would carry the answer to their browser the moment they submitted. With the
split, there is no row and no column to leak. Realtime is safe by construction.

### 2. Students read forward only

A student can read a `session_items` row only when `status <> 'staged'` and they are the
assigned student. They can never query `questions` directly — only questions reachable through
a published `session_item` of their own. Staging a question does not expose it; publishing does.

### 3. Grading is server-side and one-way

Submit posts to Render. Render verifies the Supabase JWT, checks the item is published and
unanswered, writes `selected_option` / `eliminated_options` / timings, grades against
`question_keys`, writes `session_item_grades`, and returns **`{ accepted: true }`** — never the
result. The result reaches the student only when the teacher hits reveal, which copies it to
`session_items.revealed_result`.

Once `answered_at` is set the selection is frozen. Students may change their mind freely before
submitting; submission is the lock.

## Realtime

One Postgres-changes subscription per role, both RLS-filtered:

- **Student** → their own `session_items` rows in the session. Sees a new question the instant
  the teacher publishes; sees `revealed_result` flip when the teacher reveals.
- **Teacher** → all `session_items` in the session, plus `session_item_grades`. Sees answers,
  eliminations and timings land live.

`ALTER PUBLICATION supabase_realtime ADD TABLE session_items, session_item_grades;`

A presence channel per session gives "student is here / has the question open", which the
teacher needs before publishing.

**Fallback:** Realtime over a flaky home connection is not guaranteed. The student view also
polls every 10s while a session is `live`, and reconciles on reconnect. A student staring at a
blank screen because a websocket dropped is a session ruined; the poll costs nothing.

## Repository layout

A single repo with npm workspaces — three deploy targets, one shared type definition, no
package publishing:

```
/apps/web          React SPA          → Vercel
/apps/api          Fastify service    → Render
/packages/shared   types, zod schemas, taxonomy constants, loop rules
/packages/db       migrations, RLS policies, seeds, generated Supabase types
/tools             content import scripts (PDF → images → question rows)
/docs              this plan
```

`packages/shared` is what keeps the two deploy targets honest: Zod schemas are defined once and
used for API validation on Render *and* form validation in React, and Supabase's generated types
mean a schema change surfaces as a TypeScript error rather than a runtime surprise.

## Environments

| | Supabase | Vercel | Render |
| --- | --- | --- | --- |
| **Local** | `supabase start` (Docker) | `vite dev` | `tsx watch` |
| **Preview** | Supabase branch per PR | Vercel preview deploy | Render preview env |
| **Production** | prod project, PITR on | prod domain | prod service |

Migrations are files in `packages/db/migrations`, applied via the Supabase CLI in CI. **No
schema changes through the dashboard** — an undocumented production schema is unreproducible,
and RLS policies are exactly the thing you cannot afford to have drift.

## What is deliberately not built

- **No Zoom API.** `meeting_url` is a text column. Revisit only if attendance or automatic
  recording pull becomes a real requirement.
- **No custom WebSocket server.** Supabase Realtime covers it.
- **No Redis in v1.** Report jobs go in a Postgres table with `SELECT ... FOR UPDATE SKIP
  LOCKED`. At this volume that is genuinely sufficient, and it is one less service to run.
- **No microservices.** One Fastify app with clear modules.
