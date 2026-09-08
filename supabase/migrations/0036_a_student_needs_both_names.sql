-- ============================================================================
--  0036 — a roster student needs both names, because the id is made of them
--
--  create_student (0032) asked for a first name, a last name and a PC, and
--  only checked that the two names did not come to an empty string between
--  them. A first name alone was accepted, and the form said "Last name" with
--  no asterisk beside it.
--
--  That is wrong, and it is wrong in the one place it costs something. The
--  display id is built out of both names — three letters of the given name and
--  the FIRST LETTER OF THE SURNAME, then the year and the serial:
--
--      Amara Okonkwo   ->  AMAO26-3
--
--  With no surname, build_display_id (0007) falls back to the fourth letter of
--  the given name and then to 'X', so:
--
--      Amara           ->  AMAR26-3
--
--  which is not a shortened code — it is a different code, one whose fourth
--  letter no longer means what every other code's fourth letter means. Two
--  students called Amara are then AMAR26-3 and AMAR26-7, told apart by the
--  serial alone, which is the thing the prefix exists to avoid.
--
--  The fallbacks stay. They are for names that genuinely have one part —
--  Madonna — which the signup trigger still has to handle, because a person
--  can type whatever their name is into their own signup. What changes is that
--  a teacher filling in a roster row is not that case: they are looking at a
--  student list and they know the surname.
-- ============================================================================

create or replace function public.create_student(
  p_first text,
  p_last  text,
  p_pc    text default null
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
  -- Not politeness: the id's fourth letter comes from here.
  if v_last  = '' then raise exception 'a student needs a last name'; end if;

  insert into profiles (id, role, display_id, full_name, email, pc)
  values (
    gen_random_uuid(),
    'student',
    build_display_id(v_first || ' ' || v_last, 'student', current_date),
    v_first || ' ' || v_last,
    null,
    nullif(btrim(p_pc), '')
  )
  returning * into v_row;

  return v_row;
end $$;

revoke execute on function public.create_student(text, text, text) from public, anon;
grant  execute on function public.create_student(text, text, text) to authenticated;

comment on function public.create_student(text, text, text) is
  'A teacher adds a student to the roster. Both names are required — the display id is built from three letters of the first and the initial of the last. No account, no email, no password. Teacher only.';
