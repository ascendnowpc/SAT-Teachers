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
in. That was read-only, and `0048` and `0049` opened a session's write-up to it one door at a
time — the transcript, the form, generating. The first admin to pick a session up then met "not
your session" at every step that was not one of those doors, so `0050` gives the seat what the
session's teacher has, on every session:

- `assert_session_teacher`, the gate every session RPC opens with, lets an active admin through
  for any session that exists — so an admin can run the console, reveal the results, diagnose,
  generate, publish and unpublish.
- Each session table (`sessions`, `session_items`, `session_item_assessments`,
  `session_transcripts`, `session_domain_notes`, `session_reports`) carries one admin policy for
  every command, beside the teacher's own. It replaces the read and write-up policies before it.
- The trigger that refused an admin who changed a report's status is gone.

What the seat still cannot do: write the model's reading of a recording (the edge function stores
it on the service role, after its quote check), grant the admin role, or switch itself off. Who
did what is recorded — `form_submitted_by`, `generated_by`, the transcript's `uploaded_by` — so a
teacher is told when an admin changed their session. `supabase/tests/admin_access.sql` asserts all
of it, and that another teacher, a student and an anonymous caller still get none of it.

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
  `teacher_id` against the signed-in user, or asks `is_admin()` as them; it loads the transcript itself rather than accepting
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

### The PC, reviewed on its way in (`0055`)

A new role with a password, read access to real students' sessions, three functions that send
mail or set a password — so the same questions as for `0044` and `0046`, asked before rather than
after:

- **Nobody makes themselves a PC.** The role is not read from anything a signup can write.
  `user_metadata` is the signup's own, and `app_metadata` — which only the service role can set —
  is written by GoTrue in an UPDATE after the INSERT, where the signup trigger cannot see it (measured
  against GoTrue v2.197). A PC is a profile made first by `create_pc_profile`, which only the service
  role may execute, called by `manage_pc` after it has asked `is_admin()` as the caller; the sign-in is
  then made under that profile's id, and the trigger leaves an existing profile alone. A public signup
  cannot name its own id, so it cannot land on one. `pc_access.sql` asserts a signup asking to be a PC
  is a student.
- **A PC reads their students and nothing else.** Every PC policy is SELECT only and goes through
  `is_pc()` (active, so a suspended PC reads nothing) and the student's `pc_id`. Not the answer-key
  table, not a staged question, not the bank, not another PC's students. A student cannot point
  their own `pc_id` anywhere: the identity guard refuses it.
- **Mail goes where the database says, never where a request says.** `notify_pc_report` takes a
  session id and nothing else, re-reads the report, the student's PC and the address the PC signs in
  with (auth, not the profile copy its owner can edit), and sends at most once per generation — a
  replayed call is refused by `claim_report_email`. Sending again needs the session's teacher or an
  admin, as themselves. `manage_pc` sends a PC's link only to the address that PC signs in with,
  read from auth for the same reason.
- **No password is ever in a mail.** A PC is emailed a link and chooses their own password on the
  page it opens. The link is the credential, so it is treated as one: 32 random bytes, carried in
  the URL fragment (never sent to a server, so in no access log and no `Referer`), stored only as a
  SHA-256 in `pc_invites`, good once and for seven days, replaced by the next one, and dead the
  moment its PC is suspended. `accept_pc_invite` runs without JWT verification — whoever calls it
  has no account yet — and so believes nothing but the token: the address it sets a password on is
  read from the profile, the token is spent in the same statement that finds it (two submissions
  cannot both have it), and every refusal says the same "expired or used" whether the token was
  spent, stale or never real. Opening the page spends nothing, so a mail scanner that fetches the
  link first does not burn it. The address is marked confirmed when the password is set: the link
  reaching it is the proof. Until then the sign-in has a random password nobody knows. The four
  functions behind it are the service role's only, and only admins read the table. `pc_access.sql`
  holds all of it.
- **No secret in the database, as `0046`.** The trigger's call carries no token; the function is
  deployed without JWT verification because the database has none to give, and everything above is
  why that is safe.

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
any student's session as that student. Admin is the most trusted seat in the product — since
`0050` it can do to any session whatever its teacher can, publishing included — and this is what
that means.

**A PC's link is as good as their password for a week.** Whoever holds an unspent link can set the
PC's password — that is what a link is — so a forwarded invitation is a forwarded sign-in until it
is used or replaced. The page does not ask for anything the mailbox holder would not have; a second
factor is the fix if that ever matters. An admin who sends one to the wrong address can kill it by
sending another or suspending the PC.

**`accept_pc_invite` has no rate limit of its own.** The token space (2^256) makes guessing
pointless, and the platform's function limits apply, but nothing counts failures per caller.

**A PC reads the transcript and the reading of the recording.** Deliberate — "all the details" was
the ask, and a PC is staff to the family — but it is a recording of a lesson, and it is now read by
somebody who was not in it.
