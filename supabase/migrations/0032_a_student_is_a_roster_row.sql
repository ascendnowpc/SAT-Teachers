-- ============================================================================
--  0032 — a student is a roster row, not an account
--
--  Until now the only way a student existed was that they signed up: they
--  chose a password, confirmed an email, and a trigger on auth.users wrote
--  them a profile.  The teacher's New session screen then read that list and
--  said, when it was empty, "ask them to create a student account".
--
--  That is a sign-up flow standing between a teacher and a lesson, and the
--  teachers do not want it.  What they do is know the student's name before
--  the call and type it in.  So a student profile is now something a teacher
--  can write directly — first name, last name, and the PC they sit under —
--  and the student needs no account at all, because 0033 gives them a link.
--
--  Two consequences, both deliberate:
--
--    * profiles.id no longer references auth.users.  It could not: a roster
--      student has no auth user to point at.  The column keeps its shape (a
--      uuid primary key) and every foreign key into profiles is untouched,
--      so a student who DOES sign up is still the same row the trigger has
--      always written, with the same id as their auth user.
--    * deleting an auth user no longer cascades the profile away.  That was
--      the only thing the constraint bought, and it is a worse trade than it
--      looks: a session's history should not vanish because somebody tidied
--      up an account.
--
--  The teachers' own accounts are unaffected — a teacher signs in, so a
--  teacher still signs up.
-- ============================================================================

alter table profiles drop constraint if exists profiles_id_fkey;

comment on column profiles.id is
  'The profile''s own id. Equals the auth.users id for anyone who signed up; a roster student created by a teacher has no auth user and never gets one.';

-- --------------------------------------------------------------- the PC ----
-- Free text on purpose. The teachers say "PC" and write whatever identifies
-- one; a dropdown of the ones we happened to know about would be a list to
-- maintain and a wall to hit on the first name that is not in it.
alter table profiles add column if not exists pc text;

comment on column profiles.pc is
  'The student''s PC, as the teachers write it. Shown beside their name on the sessions list and searchable there.';

-- ------------------------------------------------------ adding a student ----
-- SECURITY DEFINER because it writes a profiles row for somebody who is not
-- the caller, which no RLS policy on that table allows and none should: the
-- gate is "you are a teacher", and it is checked here.
--
-- The display_id is built by build_display_id (0007), the same call the signup
-- trigger makes, so AMAO26-3 means exactly what it always meant whichever door
-- the student came through — and the serial stays a serial per role rather
-- than a second counter that could collide with the first.
create or replace function public.create_student(
  p_first text,
  p_last  text,
  p_pc    text default null
) returns profiles
language plpgsql security definer set search_path = public as $$
declare
  v_name text;
  v_row  profiles;
begin
  if not is_teacher() then
    raise exception 'only a teacher can add a student';
  end if;

  v_name := btrim(coalesce(btrim(p_first), '') || ' ' || coalesce(btrim(p_last), ''));
  if v_name = '' then
    raise exception 'a student needs a name';
  end if;

  insert into profiles (id, role, display_id, full_name, email, pc)
  values (
    gen_random_uuid(),
    'student',
    build_display_id(v_name, 'student', current_date),
    v_name,
    null,
    nullif(btrim(p_pc), '')
  )
  returning * into v_row;

  return v_row;
end $$;

revoke execute on function public.create_student(text, text, text) from public;
grant  execute on function public.create_student(text, text, text) to authenticated;

comment on function public.create_student(text, text, text) is
  'A teacher adds a student to the roster. No account, no email, no password — a name, a PC and a display id off the same builder signup uses. Teacher only.';

-- ------------------------------------------------- keeping the PC current ----
-- The same gate, for the one field a teacher may need to correct after the
-- fact. Names and ids are not editable here: a wrong name is a wrong student,
-- and the fix for that is to create the right one.
create or replace function public.set_student_pc(p_student uuid, p_pc text)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_teacher() then
    raise exception 'only a teacher can edit a student';
  end if;

  update profiles
     set pc = nullif(btrim(p_pc), '')
   where id = p_student and role = 'student';
end $$;

revoke execute on function public.set_student_pc(uuid, text) from public;
grant  execute on function public.set_student_pc(uuid, text) to authenticated;
