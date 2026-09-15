# Security review

A pass over the whole repository — every migration, every RPC grant, the edge function, the
client, and what is committed — asking one question: what can somebody reach that they should
not? This records what was found, what `0044` fixed, and what is still open with the reason it
is still open.

It is a snapshot, not a certificate. The thing worth keeping from it is the
[contract test](../../supabase/tests/rls_contract.sql), which asserts the findings below as
rows that must say PASS.

## What was wrong

### 1. Anyone with an email address could become a teacher — **fixed in `0044`**

Signup is open to the internet, the client asked for `teacher`, and `handle_new_user` honoured
it. The role was coerced away from `admin`, which is the check everybody looked at and the one
that was never the problem: a **teacher** reads

- `question_keys` — every answer key in the bank, for all sixty published items,
- every student on the roster, with their names and their PCs,
- every house question, which any teacher may also *edit* (`questions_house_write`), so one
  account could rewrite content that everybody else's sessions are built from.

Nothing stood between a stranger and all of that but a confirmation email.

`is_teacher()` has required `is_active` since `0001`, so the fix is one word in the signup
trigger: a new teacher is written **inactive**, and an admin approves them. Every policy in the
schema asks `is_teacher()`, so a pending account reads nothing at all — which is also why the
app shows it [a screen of its own](../../apps/web/src/pages/Pending.tsx) rather than an empty
product. Accounts that already existed are untouched.

The first admin is deliberately not something the product can mint. There is no RPC that grants
the role, because any such RPC is a rung on a ladder. A project owner runs it once:

```sql
update profiles set role = 'admin', is_active = true where email = 'you@ascendnow.info';
```

### 2. A signed-in user could rewrite their own identity — **fixed in `0044`**

`profiles_update_own` pinned exactly one column:

```sql
with check (id = auth.uid() and role = (select role from profiles p where p.id = auth.uid()))
```

Everything else on the row was the account holder's to write — including `display_id`, which is
what a teacher means when they say "AMAO26-3", and `is_active`, which is the approval above.
A `profiles_guard_identity` trigger now refuses a change to `role`, `display_id` or `is_active`
from anybody but an admin (through `set_profile_active`) or a migration.

### 3. A policy on `profiles` read `profiles` — **fixed in `0044`**

The subquery above is the shape Postgres raises `infinite recursion detected in policy for
relation "profiles"` for. It was doing the trigger's job badly; with the trigger holding the
line the policy says the one thing a policy should say — this is your row.

### 3b. A suspended account could still sign in — **fixed in `0045`**

`0044`'s suspension was `is_active = false`, which every policy in the schema reads, so the
account lost every row at once. What it did not do is stop the sign-in: the password still worked
and the person landed on a product with nothing in it. The right amount of data and the wrong
door.

Suspending now also bans the auth user (`banned_until` a century out) and deletes their sessions,
so the password stops working and the tab they already had stops refreshing. That forced one
distinction the product had been missing: **off is two things.** An account that is merely
*pending* must still be able to sign in — that is how it reaches the screen telling it so —
while a *suspended* one must not. `profiles.suspended_at` tells them apart, which also keeps a
teacher an admin removed out of the approval queue they would otherwise head every morning.

### 4. `admin` was a label, not a role — **this is the portal**

`admin` has been in the enum since `0001` and `is_teacher()` has counted one as staff the whole
time, so an admin signing in got the teacher's app — and then every policy asked
`teacher_id = auth.uid()`, which is false for somebody who teaches nothing. Not a hole, but the
reason there was no oversight of any kind: no list of teachers, no way to see a session you did
not run, no way to tell whether a report was ever published.

`0044` adds `is_admin()` and a **SELECT** policy for it on every table a session leaves a trace
in. Read, and only read. There is no admin write policy anywhere, and every RPC that changes a
session still goes through `assert_session_teacher`, so a button added to an admin screen by
mistake would fail at the database — which is the right place for it to fail.

## What was checked and is sound

- **The answer key.** It lives in its own table because RLS is row-level and Realtime pushes
  whole rows. No student-facing policy exists on `question_keys`, `submit_answer` grades as
  `SECURITY DEFINER`, and the result reaches the student only through `reveal_item` writing it
  onto the item. The contract test asserts a student reads zero key rows.
- **The revoke bug, three times over.** `revoke execute … from anon` does nothing while PUBLIC
  holds the grant, and this project's default privileges grant execute to `anon` *by name*, so
  `revoke … from public` is not enough either — `0018`, `0028` and `0035` each found one half of
  that. Every function added since `0035` (`0036`, `0038`, `0040`, `0041`) revokes from
  `public, anon` by name and grants back explicitly. All of them were re-checked here; none
  repeats the bug, and `0044` follows the same rule.
- **The student link.** Every token RPC resolves the token to exactly one session and checks the
  item against *that* session, so a link to one session cannot be pointed at another session's
  question. `session_by_token` strips `access_token` and `teacher_notes` and never joins
  `question_keys` at all.
- **The edge function.** It reads as the caller, so RLS decides what it may see; it checks
  `teacher_id` against the signed-in user; it loads the transcript itself rather than accepting
  one from the client (a client that could post its own transcript could post one containing the
  quotes it wanted to see); and it stores the reading on the service role because the table has
  no client-side insert policy.
- **Secrets.** Nothing sensitive is committed. The Gemini key is read from the environment on the
  server only; `VITE_SUPABASE_ANON_KEY` is publishable by design and is useless without a policy
  that grants something.

### The notification, reviewed on its way in (`0046`)

The approval queue got an email, which means the database now makes an outbound HTTP call. Worth
stating what that call is and is not:

- It **carries no credential**. The function needs none, because it does not trust the request: it
  takes an id, re-reads that profile on the service role, and sends only if the row really is a
  pending teacher. The worst a stranger who guesses a uuid achieves is a duplicate of a true notice.
- The recipients are **read from the database**, never from the request, so the endpoint cannot be
  used to mail an arbitrary address.
- The mail body names the pending teacher and nobody else.
- The call is **queued** by pg_net rather than made inside the signup transaction, and every
  failure path is swallowed, so neither a missing key nor a dead provider can fail an account
  creation. That is also why the first version's wrong schema name showed up as a silent no-op —
  the safety net worked, and the test that caught it was the response table, not an error.
- `app_config`, which holds the URL, has RLS on and **no policies at all**, so no client role can
  read it.

## What is still open

These are recorded rather than fixed, because each one is a product decision rather than a bug,
and changing any of them silently would change what a teacher or a student can do.

**The session link never expires and is never rotated.** Sixty-four hex characters is not
guessable, but the token is in a URL, so it travels in browser history, in whatever chat app the
teacher sent it through, and in the `Referer` header of any outbound link that page ever gains.
Anyone who ever held it can reopen the session, move its level and hand the test in. The obvious
fix — expire it when the session completes — would also close the after-the-test review screen
the student reads afterwards, so it needs a decision first. A `rotate_session_token` RPC for the
teacher is the cheaper half and breaks nothing.

**`question-images` is a public bucket.** Reading a figure needs no credentials at all. Writing
is teacher-only, and no key or rationale is in there, but the exam figures themselves are
world-readable to anybody who has a URL.

**One school, one bank, and no isolation between teachers.** Any teacher reads every student on
the roster and every other teacher's edits to house content. That is the intended shape today; it
stops being intended the first time two tutoring outfits share a database.

**A teacher may repoint their own session's `student_id` at any profile,** including another
teacher's, which then makes that profile readable through `profiles_session_counterpart`. Small
— a teacher already reads every student row — but it widens the leak to teacher names and ids.

**The edge function answers `Access-Control-Allow-Origin: *`.** It requires an `Authorization`
header, so this is not a route into somebody's session from another site; pinning the origin
still costs nothing.

**Suspension is immediate at the database and lazy in the browser.** `is_active` is read every
time a policy runs, so a suspended teacher loses every row at once — but their JWT stays valid
until it expires, so their open tab looks signed in until something reloads. No data reaches it.

**Leaked-password protection is off in the Supabase project.** One toggle
(Authentication → Password security) checks new passwords against HaveIBeenPwned. It matters more
now than it did: a teacher password is a key to every answer in the bank. This is a project
setting rather than anything in this repository, so it is listed here rather than changed.

**An admin reads `sessions.access_token`.** A consequence of giving the admin the whole row, and
useful — it is how the portal offers to re-send a student's link — but it means an admin can open
any student's session as that student. Admin is the most trusted seat in the product; this is
what that means.
