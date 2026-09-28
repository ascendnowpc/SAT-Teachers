-- ============================================================================
--  0056 — a PC is compulsory, and the free-text PC goes
--
--  0055 made the PC an account and left the old world standing beside it, so
--  that it could be applied to a live project while the app before it was
--  still the one being served: that app adds a student with the free-text
--  create_student(p_first, p_last, p_pc), edits the name with set_student_pc,
--  and books students who have no PC — which, the day 0055 lands, is every
--  student there is.
--
--  This is the other half, and it waits for the app that chooses a PC from the
--  list (the same branch as 0055). Applied before that app is live, it would
--  stop every booking and every new student until it was; applied after, it
--  changes nothing a teacher sees, because the form already asks.
--
--    * the free-text doors close. create_student(text, text, text) and
--      set_student_pc(uuid, text) are dropped: a PC typed in is a PC nobody
--      can sign in as, and an app still sending { p_pc: 'Priya Rao' } is now
--      refused by name ("could not find the function") rather than creating
--      a student with no PC.
--
--    * booking needs the student's PC. A session cannot be written for a
--      student with no PC. The form asks; this is the rule for when the form
--      is not what is asking.
-- ============================================================================

-- ------------------------------------------------------- the old doors ------
drop function if exists public.create_student(text, text, text);
drop function if exists public.set_student_pc(uuid, text);

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
