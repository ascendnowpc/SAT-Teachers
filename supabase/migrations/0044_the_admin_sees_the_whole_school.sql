-- ============================================================================
--  0044 — the admin sees the whole school, and nobody lets themselves in
--
--  There has been an `admin` in the role enum since 0001 and nothing behind
--  it.  `is_teacher()` counts an admin as staff, so an admin signing in got
--  the teacher's app — and then every policy in the schema asked
--  `teacher_id = auth.uid()`, which is false for somebody who teaches nothing.
--  An admin could see the question bank and not one session, not one form and
--  not one report.  The role was a label.
--
--  This is the role.  Three pieces, and they are one piece really:
--
--    1. `is_admin()`, and a SELECT policy for it on every table a session
--       leaves a trace in.  Read, and only read: an admin oversees the work,
--       they do not do it.  Every RPC that writes still goes through
--       `assert_session_teacher`, so the teacher whose name is on a session
--       remains the only person who can change it.
--
--    2. Teacher accounts arrive PENDING.  Signup is open to the internet —
--       anyone with an email address could tick `teacher` and the trigger
--       believed them — and a teacher reads the whole bank WITH ITS ANSWER
--       KEYS, every student's name and PC, and can edit house content.  That
--       is the loophole this migration is really about.  `is_teacher()` has
--       always required `is_active`, so the fix is one word in the signup
--       trigger: a new teacher is written inactive and an admin turns them on.
--       Everybody who already has an account keeps it, untouched.
--
--    3. Nobody rewrites their own identity.  `profiles_update_own` let a
--       signed-in user change every column of their own row but `role` — so a
--       teacher could take another teacher's display id, or quietly deactivate
--       themselves.  The role guard was also a subquery on `profiles` inside a
--       policy on `profiles`, which is the shape Postgres raises "infinite
--       recursion detected in policy" for.  A trigger does the job properly
--       and takes the recursion out of the policy with it.
--
--  Minting the first admin is deliberately not a thing the product can do.
--  There is no RPC here that grants the role, because any such RPC is a rung
--  on a ladder.  A project owner runs it in the SQL editor, once:
--
--      update profiles set role = 'admin', is_active = true
--       where email = 'you@ascendnow.info';
-- ============================================================================

-- ---------------------------------------------------------------- who ------
-- security definer for the same reason is_teacher() is: it reads profiles,
-- which has RLS, from inside the policies on profiles.
create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from profiles
    where id = auth.uid() and role = 'admin' and is_active
  );
$$;

-- Granted to anon as well as authenticated, and deliberately.
--
-- The instinct after 0035 is to revoke everything from anon by name, and it is
-- the wrong instinct for this one: a policy expression is evaluated AS THE
-- QUERYING ROLE, and none of the policies below carry a `TO` clause, so every
-- SELECT policy on these tables is OR'd together and evaluated for an
-- anonymous reader too. A function an anonymous reader cannot execute turns
-- what should be "you may read nothing" into "permission denied for function
-- is_admin" — a louder failure and not a safer one.
--
-- It tells anon nothing anyway: auth.uid() is null for them, so it is false.
-- This is the same shape is_teacher() has had since 0001, which is why the
-- student policies that sit beside it have never broken.
revoke execute on function public.is_admin() from public;
grant  execute on function public.is_admin() to anon, authenticated;

comment on function public.is_admin() is
  'True for a signed-in, active admin. The gate on every admin-read policy below.';

-- ------------------------------------------------------------- reading -----
-- One policy per table, all of them SELECT. An admin reads the school; they do
-- not teach in it. Adding `or is_admin()` to the existing teacher policies
-- would have been shorter and would have handed an admin every write those
-- policies carry, which is the opposite of what oversight is.

-- Every profile: the teachers, so there is a list of them, and the students,
-- so a session has names on it. The teacher policies only ever offered students.
drop policy if exists profiles_admin_read on profiles;
create policy profiles_admin_read on profiles
  for select using (is_admin());

drop policy if exists sessions_admin_read on sessions;
create policy sessions_admin_read on sessions
  for select using (is_admin());

drop policy if exists items_admin_read on session_items;
create policy items_admin_read on session_items
  for select using (is_admin());

drop policy if exists assessments_admin_read on session_item_assessments;
create policy assessments_admin_read on session_item_assessments
  for select using (is_admin());

-- The transcript is a recording of two people talking and half of it is the
-- teacher's assessment out loud. 0013 kept it staff-only in every direction;
-- an admin is staff, and "is the transcript in" is the question the portal
-- exists to answer.
drop policy if exists transcripts_admin_read on session_transcripts;
create policy transcripts_admin_read on session_transcripts
  for select using (is_admin());

drop policy if exists domain_notes_admin_read on session_domain_notes;
create policy domain_notes_admin_read on session_domain_notes
  for select using (is_admin());

drop policy if exists reports_admin_read on session_reports;
create policy reports_admin_read on session_reports
  for select using (is_admin());

-- The model's reading of the recording. An admin watching drop rates is the
-- reason 0031 bothered to store them.
drop policy if exists extractions_admin_read on session_context_extractions;
create policy extractions_admin_read on session_context_extractions
  for select using (is_admin());

-- questions, question_options, question_keys, question_sets and
-- question_set_items are already readable: their policies ask is_teacher(),
-- which has counted an admin as staff since 0001. Nothing to add.

-- ------------------------------------------------- teachers arrive pending --
-- The signup trigger, with one line changed. A student row is still active on
-- arrival — students do not sign up any more (0032), and the ones who already
-- did are sitting sessions today.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  requested text := coalesce(new.raw_user_meta_data->>'role', 'student');
  resolved  user_role;
  full_name text := coalesce(new.raw_user_meta_data->>'full_name', '');
begin
  resolved := case when requested = 'teacher' then 'teacher'::user_role
                   else 'student'::user_role end;

  insert into public.profiles (id, role, display_id, full_name, email, is_active)
  values (new.id, resolved,
          build_display_id(full_name, resolved, current_date),
          full_name, new.email,
          -- A teacher account reads every answer key in the bank. That is not
          -- something an email address should be able to award itself.
          resolved <> 'teacher');
  return new;
end;
$$;

revoke execute on function public.handle_new_user() from public, anon, authenticated;

comment on function public.handle_new_user() is
  'Promotes a new auth user into a profile. The role is coerced to teacher|student, and a teacher lands inactive until an admin approves them.';

-- Nothing backfills here on purpose. is_active defaults to true and every
-- account that exists already carries it, so this migration is a gate on the
-- door rather than a review of the people already inside.

-- --------------------------------------------------------- the approval ----
create or replace function public.set_profile_active(p_profile uuid, p_active boolean)
returns profiles
language plpgsql security definer set search_path = public as $$
declare v_row profiles;
begin
  if not is_admin() then
    raise exception 'only an admin can approve or suspend an account';
  end if;

  -- An admin may not switch themselves off: the last admin doing that locks
  -- the role out of the product with no way back but the SQL editor.
  if p_profile = auth.uid() then
    raise exception 'you cannot change your own account here';
  end if;

  update profiles
     set is_active = coalesce(p_active, false)
   where id = p_profile
   returning * into v_row;

  if v_row.id is null then raise exception 'no such account'; end if;
  return v_row;
end $$;

revoke execute on function public.set_profile_active(uuid, boolean) from public, anon;
grant  execute on function public.set_profile_active(uuid, boolean) to authenticated;

comment on function public.set_profile_active(uuid, boolean) is
  'An admin approves a pending teacher, or suspends an account. Admin only, and never their own row.';

-- ------------------------------------------------- nobody renames themselves --
-- What profiles_update_own is actually for is a teacher correcting their own
-- name. Everything else on the row identifies them to other people: the role
-- decides what they can read, the display id is what a teacher means when they
-- say AMAO26-3, and is_active is the approval above. None of the three is the
-- account holder's to write.
create or replace function public.profiles_guard_identity()
returns trigger
language plpgsql security definer set search_path = public as $$
begin
  -- No JWT means a migration or the service role, which is how the seeds and
  -- the backfills write this table. An admin is the approval RPC above.
  if auth.uid() is null or is_admin() then
    return new;
  end if;

  if new.role is distinct from old.role then
    raise exception 'a role is not something an account sets for itself';
  end if;
  if new.display_id is distinct from old.display_id then
    raise exception 'a display id is issued, not chosen';
  end if;
  if new.is_active is distinct from old.is_active then
    raise exception 'an account is activated by an admin';
  end if;

  return new;
end $$;

drop trigger if exists profiles_guard_identity on profiles;
create trigger profiles_guard_identity
  before update on profiles
  for each row execute function public.profiles_guard_identity();

-- With the trigger holding the line, the policy goes back to saying the one
-- thing a policy should say: this is your row. The subquery it used to carry
-- read profiles from inside a policy on profiles, which is the shape that
-- raises "infinite recursion detected in policy for relation profiles".
drop policy if exists profiles_update_own on profiles;
create policy profiles_update_own on profiles
  for update using (id = auth.uid()) with check (id = auth.uid());
