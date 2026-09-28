-- ============================================================================
--  0055 — the PC is an account, and a student's PC is chosen from a list
--
--  What was asked for, in this order:
--
--    1. Booking a session means choosing the student's PC from a list of PCs,
--       and it cannot be skipped. A student's first booking is where their PC
--       is chosen; from then on the student has one.
--    2. An admin adds PCs, and each PC is emailed their sign-in.
--    3. A PC signs in and sees the sessions and reports of their own students
--       — every question, the form, the transcript, the report — and nobody
--       else's.
--    4. Whenever a report is generated, the student's PC is emailed the PDF
--       and a link to the session.
--
--  The pieces, in the order this file builds them:
--
--    * profiles.pc_id — the student's PC, a profile of role 'pc' (0054). The
--      free-text profiles.pc stays, as the PC's NAME: it is what every screen
--      and every search already prints beside a student, so a trigger keeps
--      it in step with the person rather than every read joining for it. A
--      student from before this keeps whatever was typed until their next
--      booking, which makes somebody choose.
--
--    * a PC's account is made in two steps, by the manage_pc edge function:
--      the profile (create_pc_profile, service role only), then the sign-in,
--      under the same id. It has to be that way round. GoTrue writes a new
--      user's app_metadata in an UPDATE after the INSERT, so the signup
--      trigger never sees a role there — measured against GoTrue v2.197: an
--      account made the other way round arrived as a student and spent a
--      student's serial. And user_metadata is whatever a signup says it is,
--      so a role read from it is a role anybody could claim. So the signup
--      trigger now leaves alone a profile that already exists.
--
--    * reading. A PC reads what their student was shown and everything written
--      about it — the session, the questions put up, the assessments, the
--      form, the transcript, the reading of the recording, the report — and
--      the names of the teachers who taught them. Never the answer-key table
--      and never a staged question: the report takes the key from the item
--      once the results are published, which is when the student has it too.
--      Read only. Every write in the schema asks for a teacher or an admin,
--      and nothing here adds one.
--
--    * choosing. create_student takes the PC's id and refuses without one;
--      assign_student_pc gives a PC to a student who has none, and lets an
--      admin change one. A teacher cannot re-point a student who already has a
--      PC: the first booking chose it, and moving a student's reports to
--      somebody else is an admin's decision. set_student_pc, the free-text
--      editor, goes — a PC typed in is a PC nobody can sign in as.
--
--    * booking. A session cannot be written for a student with no PC. The
--      form asks; this is the rule for when the form is not what is asking.
--
--    * the email. Generating stamps session_reports.generated_at, and a trigger
--      on that stamp queues the notify_pc_report edge function the way 0046
--      queues the pending-teacher notice: pg_net, no secret, any failure
--      swallowed, because a report must never fail to generate for want of an
--      email. The function writes a row per generation into report_emails,
--      which is both the record the screens show ("emailed to Priya Rao at
--      14:32") and what makes it send once: a replayed call finds that
--      generation already sent.
-- ============================================================================

-- ---------------------------------------------------------- the assignment --
alter table profiles
  add column if not exists pc_id uuid references profiles(id) on delete set null;

create index if not exists profiles_pc_idx on profiles (pc_id) where pc_id is not null;

comment on column profiles.pc_id is
  'A student''s PC: a profile of role pc, chosen from the list at the student''s first booking (0055). Reads the student''s sessions and is emailed their reports.';
comment on column profiles.pc is
  'The PC''s name, as the screens print it. Kept in step with pc_id by trigger (0055). On a student nobody has chosen a PC for yet, whatever was typed before PCs had accounts.';

-- ----------------------------------------------------- who is live as a PC --
-- Internal: the two RPCs below take a PC's id from a client, and "is that an
-- active PC" is the question both ask before writing it anywhere.
create or replace function public.is_active_pc(p_profile uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from profiles where id = p_profile and role = 'pc' and is_active);
$$;

revoke execute on function public.is_active_pc(uuid) from public, anon, authenticated;

-- ---------------------------------------------------- the name follows ------
-- The name is copied, not joined, and so it has to be copied again whenever
-- either end moves: when a student is given a PC, and when a PC is renamed.
create or replace function public.profiles_pc_name()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.pc_id is not null then
    select p.full_name into new.pc from profiles p where p.id = new.pc_id;
  elsif tg_op = 'UPDATE' and old.pc_id is not null then
    -- The PC went (deleted, so the key was nulled): a name with nobody behind
    -- it is exactly what this migration is taking away.
    new.pc := null;
  end if;
  return new;
end $$;

revoke execute on function public.profiles_pc_name() from public, anon, authenticated;

drop trigger if exists profiles_pc_name on profiles;
create trigger profiles_pc_name
  before insert or update of pc_id on profiles
  for each row execute function public.profiles_pc_name();

create or replace function public.profiles_pc_renamed()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.role = 'pc' and new.full_name is distinct from old.full_name then
    update profiles set pc = new.full_name where pc_id = new.id;
  end if;
  return null;
end $$;

revoke execute on function public.profiles_pc_renamed() from public, anon, authenticated;

drop trigger if exists profiles_pc_renamed on profiles;
create trigger profiles_pc_renamed
  after update of full_name on profiles
  for each row execute function public.profiles_pc_renamed();

-- ------------------------------------------- an account made before its sign-in
-- 0044's trigger, with one early return. manage_pc writes a PC's profile and
-- then asks GoTrue for a sign-in under the same id; the profile it wrote IS
-- the account, and returning before build_display_id is the point of it —
-- calling that would spend a serial on a row that is never written.
--
-- No signup reaches the early return: GoTrue picks a signup's id itself, and
-- only the service role can name one.
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
  if exists (select 1 from public.profiles p where p.id = new.id) then
    return new;
  end if;

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
  'Promotes a new auth user into a profile, unless the profile was made first (a PC, 0055). The role is coerced to teacher|student, and a teacher lands inactive until an admin approves them.';

-- ------------------------------------------------------------- making a PC --
-- The first of manage_pc's two steps. The service role only: the function
-- checks that its caller is an admin before it calls this, and a profile with
-- no sign-in behind it is not something a browser should be able to leave
-- lying about. Both names, for the reason 0036 gives: the display id is made
-- of them.
create or replace function public.create_pc_profile(p_first text, p_last text, p_email text)
returns profiles
language plpgsql security definer set search_path = public as $$
declare
  v_first text := btrim(coalesce(p_first, ''));
  v_last  text := btrim(coalesce(p_last, ''));
  v_email text := lower(btrim(coalesce(p_email, '')));
  v_row   profiles;
begin
  if v_first = '' then raise exception 'a PC needs a first name'; end if;
  if v_last  = '' then raise exception 'a PC needs a last name'; end if;
  if v_email !~ '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$' then
    raise exception 'that is not an email address';
  end if;
  if exists (select 1 from profiles where lower(email) = v_email)
     or exists (select 1 from auth.users where lower(email) = v_email) then
    raise exception 'there is already an account with that email address';
  end if;

  insert into profiles (id, role, display_id, full_name, email, is_active)
  values (gen_random_uuid(), 'pc',
          build_display_id(v_first || ' ' || v_last, 'pc', current_date),
          v_first || ' ' || v_last, v_email, true)
  returning * into v_row;

  return v_row;
end $$;

revoke execute on function public.create_pc_profile(text, text, text) from public, anon, authenticated;
grant  execute on function public.create_pc_profile(text, text, text) to service_role;

comment on function public.create_pc_profile(text, text, text) is
  'The profile half of a new PC account; manage_pc then creates the sign-in under the same id. Service role only.';

-- ------------------------------------------------------ who, and whose -------
-- security definer for the reason is_admin() is (0044): they read profiles and
-- sessions from inside the policies on those tables. Granted to anon as well,
-- for the same reason as is_admin(): a policy is evaluated as the querying
-- role, every SELECT policy here is OR'd for an anonymous reader too, and a
-- function they could not execute would turn "you may read nothing" into a
-- permission error. They say nothing to anon: auth.uid() is null, so false.
create or replace function public.is_pc()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from profiles where id = auth.uid() and role = 'pc' and is_active);
$$;

-- This session is one of the caller's students', and the caller is their PC.
create or replace function public.pc_has_session(p_session uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select is_pc() and exists (
    select 1 from sessions x join profiles s on s.id = x.student_id
     where x.id = p_session and s.pc_id = auth.uid());
$$;

-- This teacher has taught one of the caller's students.
create or replace function public.pc_has_teacher(p_teacher uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select is_pc() and exists (
    select 1 from sessions x join profiles s on s.id = x.student_id
     where x.teacher_id = p_teacher and s.pc_id = auth.uid());
$$;

-- This item was put in front of one of the caller's students. A staged one was
-- not: it is the teacher's queue, which nobody else reads, and not anything
-- that has happened yet.
create or replace function public.pc_has_item(p_item uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select is_pc() and exists (
    select 1 from session_items i
      join sessions x on x.id = i.session_id
      join profiles s on s.id = x.student_id
     where i.id = p_item and i.status <> 'staged' and s.pc_id = auth.uid());
$$;

-- This question was put in front of one of the caller's students — the scope
-- the student has themselves (questions_student_read, 0005).
create or replace function public.pc_has_question(p_question uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select is_pc() and exists (
    select 1 from session_items i
      join sessions x on x.id = i.session_id
      join profiles s on s.id = x.student_id
     where i.question_id = p_question and i.status <> 'staged' and s.pc_id = auth.uid());
$$;

revoke execute on function public.is_pc()                from public;
revoke execute on function public.pc_has_session(uuid)   from public;
revoke execute on function public.pc_has_teacher(uuid)   from public;
revoke execute on function public.pc_has_item(uuid)      from public;
revoke execute on function public.pc_has_question(uuid)  from public;
grant  execute on function public.is_pc()                to anon, authenticated;
grant  execute on function public.pc_has_session(uuid)   to anon, authenticated;
grant  execute on function public.pc_has_teacher(uuid)   to anon, authenticated;
grant  execute on function public.pc_has_item(uuid)      to anon, authenticated;
grant  execute on function public.pc_has_question(uuid)  to anon, authenticated;

comment on function public.is_pc() is
  'True for a signed-in, active PC. The gate on every PC policy (0055).';

-- ----------------------------------------------------------------- reading --
-- Every policy below opens with `(select is_pc())` rather than leaving it to
-- the helper, and not for correctness — the helpers check it too — but for
-- everybody else. These policies are OR'd into every read of these tables,
-- a teacher reading the whole bank included, and a function in a policy runs
-- once per row. A scalar subquery with nothing from the row in it runs once
-- per query instead (an InitPlan), so for anybody who is not a PC the policy
-- is a single false and the per-row lookup never happens. Measured on the bank
-- read: the per-row form cost a teacher about a third as much again.

-- Staff choose a student's PC, so staff read the list of them. is_teacher()
-- counts an admin, who reads every profile already.
drop policy if exists profiles_teacher_reads_pcs on profiles;
create policy profiles_teacher_reads_pcs on profiles
  for select using ((select is_teacher()) and role = 'pc');

-- A PC's students: the row says whose it is, so no lookup is needed.
drop policy if exists profiles_pc_reads_students on profiles;
create policy profiles_pc_reads_students on profiles
  for select using ((select is_pc()) and role = 'student' and pc_id = (select auth.uid()));

-- And the teachers who taught them, so a session has both names on it.
drop policy if exists profiles_pc_reads_teachers on profiles;
create policy profiles_pc_reads_teachers on profiles
  for select using ((select is_pc()) and role in ('teacher', 'admin') and pc_has_teacher(id));

drop policy if exists sessions_pc_read on sessions;
create policy sessions_pc_read on sessions
  for select using ((select is_pc()) and pc_has_session(id));

drop policy if exists items_pc_read on session_items;
create policy items_pc_read on session_items
  for select using ((select is_pc()) and status <> 'staged' and pc_has_session(session_id));

drop policy if exists assessments_pc_read on session_item_assessments;
create policy assessments_pc_read on session_item_assessments
  for select using ((select is_pc()) and pc_has_item(session_item_id));

drop policy if exists transcripts_pc_read on session_transcripts;
create policy transcripts_pc_read on session_transcripts
  for select using ((select is_pc()) and pc_has_session(session_id));

drop policy if exists domain_notes_pc_read on session_domain_notes;
create policy domain_notes_pc_read on session_domain_notes
  for select using ((select is_pc()) and pc_has_session(session_id));

drop policy if exists reports_pc_read on session_reports;
create policy reports_pc_read on session_reports
  for select using ((select is_pc()) and pc_has_session(session_id));

drop policy if exists extractions_pc_read on session_context_extractions;
create policy extractions_pc_read on session_context_extractions
  for select using ((select is_pc()) and pc_has_session(session_id));

drop policy if exists questions_pc_read on questions;
create policy questions_pc_read on questions
  for select using ((select is_pc()) and pc_has_question(id));

drop policy if exists options_pc_read on question_options;
create policy options_pc_read on question_options
  for select using ((select is_pc()) and pc_has_question(question_id));

-- question_keys gets nothing, on purpose: see the header.

-- --------------------------------------------------------------- choosing ---
-- The PC's id now, not their name, and required. A new signature rather than a
-- new meaning for the old one: an app still sending { p_pc: 'Priya Rao' } is
-- refused by name ("could not find the function") instead of having a name
-- quietly read as an id, or an id quietly stored as a name.
drop function if exists public.create_student(text, text, text);

create or replace function public.create_student(
  p_first text,
  p_last  text,
  p_pc_id uuid
) returns profiles
language plpgsql security definer set search_path = public as $$
declare
  v_first text := btrim(coalesce(p_first, ''));
  v_last  text := btrim(coalesce(p_last, ''));
  v_row   profiles;
begin
  if not is_teacher() then
    raise exception 'only a teacher can add a student';
  end if;

  if v_first = '' then raise exception 'a student needs a first name'; end if;
  -- Not politeness: the id's fourth letter comes from here (0036).
  if v_last  = '' then raise exception 'a student needs a last name'; end if;
  -- Before the insert, so a refusal spends no serial.
  if not is_active_pc(p_pc_id) then
    raise exception 'a student needs a PC — choose one from the list';
  end if;

  insert into profiles (id, role, display_id, full_name, email, pc_id)
  values (
    gen_random_uuid(),
    'student',
    build_display_id(v_first || ' ' || v_last, 'student', current_date),
    v_first || ' ' || v_last,
    null,
    p_pc_id
  )
  returning * into v_row;

  return v_row;
end $$;

revoke execute on function public.create_student(text, text, uuid) from public, anon;
grant  execute on function public.create_student(text, text, uuid) to authenticated;

comment on function public.create_student(text, text, uuid) is
  'A teacher adds a student to the roster: both names, and their PC chosen from the list (0055). No account, no email, no password. Teacher only.';

-- A PC for a student who has none: the first booking of a student already on
-- the roster, which is where their PC is chosen. Changing a PC that is already
-- chosen is an admin's — it moves every session and report the student has to
-- somebody else.
create or replace function public.assign_student_pc(p_student uuid, p_pc_id uuid)
returns profiles
language plpgsql security definer set search_path = public as $$
declare
  v_current uuid;
  v_row     profiles;
begin
  if not is_teacher() then
    raise exception 'only a teacher or an admin can choose a student''s PC';
  end if;

  select pc_id into v_current from profiles where id = p_student and role = 'student';
  if not found then raise exception 'no such student'; end if;

  if not is_active_pc(p_pc_id) then
    raise exception 'choose a PC from the list';
  end if;

  if v_current is not null and v_current <> p_pc_id and not is_admin() then
    raise exception 'this student already has a PC — only an admin can change it';
  end if;

  update profiles set pc_id = p_pc_id where id = p_student
  returning * into v_row;
  return v_row;
end $$;

revoke execute on function public.assign_student_pc(uuid, uuid) from public, anon;
grant  execute on function public.assign_student_pc(uuid, uuid) to authenticated;

comment on function public.assign_student_pc(uuid, uuid) is
  'Gives a student their PC. A teacher can choose one for a student who has none; only an admin can change one already chosen (0055).';

drop function if exists public.set_student_pc(uuid, text);

-- 0045's guard, with the assignment in it. A student with a sign-in of their
-- own could otherwise point their sessions and reports at whichever PC they
-- liked. Only their own row: the RPCs above write other people's rows, and a
-- PC's rename rewrites the name on their students' rows (profiles_pc_renamed).
create or replace function public.profiles_guard_identity()
returns trigger
language plpgsql security definer set search_path = public as $$
begin
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
  if new.suspended_at is distinct from old.suspended_at then
    raise exception 'a suspension is lifted by an admin';
  end if;
  if new.id = auth.uid()
     and (new.pc_id is distinct from old.pc_id or new.pc is distinct from old.pc) then
    raise exception 'a student''s PC is chosen by their teacher or an admin';
  end if;

  return new;
end $$;

revoke execute on function public.profiles_guard_identity() from public, anon, authenticated;

-- ---------------------------------------------------------------- booking ---
-- Whether a student has a PC, for the trigger below. Granted to the client
-- roles because the trigger runs as whoever is inserting — it has to, to know
-- who that is — and it tells them nothing a booking form does not.
create or replace function public.student_has_pc(p_student uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from profiles where id = p_student and pc_id is not null);
$$;

revoke execute on function public.student_has_pc(uuid) from public;
grant  execute on function public.student_has_pc(uuid) to anon, authenticated;

-- The form's rule, held where the browser cannot skip it. A booking comes from
-- a client, so the rule is for the client roles: a migration or the service
-- role writing a session is not a booking (the recorded sessions of 0012 and
-- 0043 were written that way, and the contracts write their fixtures that way).
-- Not security definer, on purpose: inside one, current_user is the owner.
create or replace function public.sessions_need_a_pc()
returns trigger language plpgsql set search_path = public as $$
begin
  if current_user in ('anon', 'authenticated') and not student_has_pc(new.student_id) then
    raise exception 'this student has no PC yet — choose their PC before booking the session';
  end if;
  return new;
end $$;

revoke execute on function public.sessions_need_a_pc() from public, anon, authenticated;

drop trigger if exists sessions_need_a_pc on sessions;
create trigger sessions_need_a_pc
  before insert or update of student_id on sessions
  for each row execute function public.sessions_need_a_pc();

-- -------------------------------------------------------------- the email ---
create table if not exists report_emails (
  session_id   uuid not null references sessions(id) on delete cascade,
  -- Which generation of the report the email carried. One row per generation,
  -- which is what stops a replayed call sending the same report twice.
  generated_at timestamptz not null,
  pc_id        uuid references profiles(id) on delete set null,
  sent_to      text,
  status       text not null check (status in ('sending', 'sent', 'failed', 'skipped')),
  -- Why it failed or was skipped, in words a screen can show as they are.
  detail       text,
  attempts     integer not null default 1,
  updated_at   timestamptz not null default now(),
  primary key (session_id, generated_at)
);

comment on table report_emails is
  'Every generated report''s email to the student''s PC: one row per generation, written by the notify_pc_report edge function on the service role and read by the session''s teacher, its PC and the admins (0055).';

alter table report_emails enable row level security;

-- Read by whoever can read the session's report; written by nobody but the
-- service role, which is to say by the function that actually sent it.
drop policy if exists report_emails_read on report_emails;
create policy report_emails_read on report_emails
  for select using (
    (select is_admin())
    or exists (select 1 from sessions s where s.id = session_id and s.teacher_id = (select auth.uid()))
    or ((select is_pc()) and pc_has_session(session_id))
  );

-- Takes the right to send one generation's email. False when it is taken
-- already — sent, or being sent — unless p_again, which is a person pressing
-- "Send to the PC again". A failed or skipped one can always be taken: that is
-- a retry, not a repeat.
create or replace function public.claim_report_email(
  p_session      uuid,
  p_generated_at timestamptz,
  p_pc_id        uuid,
  p_to           text,
  p_again        boolean default false
) returns boolean
language plpgsql security definer set search_path = public as $$
declare v_claimed boolean;
begin
  insert into report_emails as r (session_id, generated_at, pc_id, sent_to, status)
  values (p_session, p_generated_at, p_pc_id, p_to, 'sending')
  on conflict (session_id, generated_at) do update
     set pc_id      = excluded.pc_id,
         sent_to    = excluded.sent_to,
         status     = 'sending',
         detail     = null,
         attempts   = r.attempts + 1,
         updated_at = now()
   where p_again or r.status in ('failed', 'skipped')
  returning true into v_claimed;

  return coalesce(v_claimed, false);
end $$;

revoke execute on function public.claim_report_email(uuid, timestamptz, uuid, text, boolean)
  from public, anon, authenticated;
grant  execute on function public.claim_report_email(uuid, timestamptz, uuid, text, boolean)
  to service_role;

-- 0046's shape, on the report row. Only a new generation: saving the report's
-- written text or publishing it moves other columns, not this one.
create or replace function public.notify_pc_report()
returns trigger
language plpgsql security definer set search_path = public as $$
declare v_url text;
begin
  if new.generated_at is null or new.generated_at is not distinct from old.generated_at then
    return new;
  end if;

  select value into v_url from app_config where key = 'functions_url';
  if v_url is null then
    return new;
  end if;

  begin
    perform net.http_post(
      url     := rtrim(v_url, '/') || '/notify_pc_report',
      body    := jsonb_build_object('session_id', new.session_id),
      headers := '{"Content-Type": "application/json"}'::jsonb,
      -- Building a PDF and holding an SMTP conversation take longer than
      -- pg_net's five-second default, and pg_net records a request it gave up
      -- on as a failure whatever the function went on to do.
      timeout_milliseconds := 60000
    );
  exception when others then
    -- An email is worth nothing next to a report. If the queue, the extension
    -- or the function is not there, the report is still generated and the
    -- console still offers to send it by hand.
    raise warning 'could not queue the report email to the PC: %', sqlerrm;
  end;

  return new;
end $$;

revoke execute on function public.notify_pc_report() from public, anon, authenticated;

comment on function public.notify_pc_report() is
  'Queues the email of a newly generated report to the student''s PC. Best effort in every direction: it never fails a generation and it carries no secret.';

drop trigger if exists session_reports_notify_pc on session_reports;
create trigger session_reports_notify_pc
  after update of generated_at on session_reports
  for each row execute function public.notify_pc_report();
