-- ============================================================================
--  0007 — the trailing number is a serial per role, not per name
--
--  0004 counted per name-prefix, so every distinct name restarted at 1 and
--  BATO26-1, JOXK26-1 and MADO26-1 could all exist at once. The number is meant
--  to identify the person: teacher #1 and student #1, and no other -1.
--
--  Two people can still compute the same prefix — a teacher and a student both
--  called Test, joining the same year, both give TEST26 — so after taking a
--  number the whole code is checked and the next one taken if it is spoken for.
--  Without that the unique index on display_id would fail the signup outright.
-- ============================================================================

drop table display_id_counters;

create table display_id_counters (
  role    user_role primary key,
  next_no integer not null default 1
);

drop function if exists public.build_display_id(text, date);

create or replace function public.build_display_id(
  p_full_name text,
  p_role      user_role,
  p_joined_on date
) returns text
language plpgsql
set search_path = public
as $$
declare
  v_cleaned text;
  v_parts   text[];
  v_given   text;
  v_surname text;
  v_initial text;
  v_prefix  text;
  v_seq     int;
  v_id      text;
begin
  -- Letters and spaces only, so "O'Celik-Bey" still yields a usable code.
  v_cleaned := trim(regexp_replace(upper(coalesce(p_full_name, '')), '[^A-Z ]', '', 'g'));
  v_parts   := regexp_split_to_array(v_cleaned, '\s+');
  v_given   := coalesce(nullif(v_parts[1], ''), 'XXX');
  v_surname := case when array_length(v_parts, 1) > 1
                    then v_parts[array_length(v_parts, 1)] end;

  -- No surname falls back to the 4th letter of the given name, then X, so
  -- every code is the same shape whatever the name looks like.
  v_initial := coalesce(nullif(left(v_surname, 1), ''), nullif(substr(v_given, 4, 1), ''), 'X');

  v_prefix := rpad(left(v_given, 3), 3, 'X') || v_initial
              || to_char(coalesce(p_joined_on, current_date), 'YY');

  loop
    -- Take the next serial for this role. Upsert-loop rather than ON CONFLICT
    -- so two simultaneous signups cannot land on the same number.
    loop
      update display_id_counters c
         set next_no = c.next_no + 1
       where c.role = p_role
      returning c.next_no - 1 into v_seq;
      exit when found;

      begin
        insert into display_id_counters (role, next_no) values (p_role, 2);
        v_seq := 1;
        exit;
      exception when unique_violation then
        -- another signup created the row first; go round and take the update
      end;
    end loop;

    v_id := v_prefix || '-' || v_seq;
    exit when not exists (select 1 from profiles p where p.display_id = v_id);
    -- Same prefix already taken by the other role; burn this number, take the next.
  end loop;

  return v_id;
end;
$$;

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

  insert into public.profiles (id, role, display_id, full_name, email)
  values (new.id, resolved,
          build_display_id(full_name, resolved, current_date),
          full_name, new.email);
  return new;
end;
$$;

revoke execute on function public.handle_new_user() from anon, authenticated;
revoke execute on function public.build_display_id(text, user_role, date) from anon, authenticated;

-- ---------------------------------------------------------------- backfill --
-- Existing accounts still carry the retired TCH-0004 / STU-0004 shape. Renumber
-- them in signup order so the first teacher and first student are each -1.
do $$
declare r record;
begin
  update profiles set display_id = 'pending-' || id::text;

  for r in select id, full_name, role, created_at from profiles order by created_at loop
    update profiles
       set display_id = build_display_id(r.full_name, r.role, r.created_at::date)
     where id = r.id;
  end loop;
end $$;
