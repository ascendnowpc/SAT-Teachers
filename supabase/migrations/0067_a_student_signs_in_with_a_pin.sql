-- ============================================================================
--  0067 — a student signs in with their ID and a PIN
--
--  0066 put the student ID in front of a session's link. That is a login for
--  one test, reached from the link. This is the student's own way in, with no
--  link: the sign-in page's Student tab asks for the student ID and a 4-digit
--  PIN, and the right pair opens the student's page — every test they have,
--  each one a click away.
--
--    student_pins        one PIN per student, made when the student is. Staff
--                        read it (the tutor gives it to the student) and so
--                        does the student's own PC. No client writes it.
--    student_login_keys  what a signed-in student's browser holds, stored only
--                        as its SHA-256. Seven days, or until they sign out.
--
--  The ID is no secret — it is built from a name and a year — so the PIN is
--  what keeps a student's page theirs, and four digits only hold if guessing
--  is slow. Five wrong in a row locks the PIN for 15 minutes; every five after
--  that doubles the lock, up to a day. A right PIN clears the count. A tutor
--  can give a student a new PIN, which also clears the lock and signs the
--  student out everywhere.
--
--  Nothing here changes the link. A session's link still asks for the ID
--  alone (0066): the link itself is the secret half of that check.
-- ============================================================================

-- ------------------------------------------------------------- the PIN -----
-- Four digits from gen_random_uuid(), which is drawn from a strong source;
-- random() is not.
create or replace function public.new_student_pin()
returns text language sql volatile set search_path = public as $$
  select lpad(((('x' || lpad(substr(replace(gen_random_uuid()::text, '-', ''), 1, 8), 16, '0'))::bit(64)::bigint
               % 10000))::text, 4, '0')
$$;

revoke execute on function public.new_student_pin() from public, anon, authenticated;

create table if not exists student_pins (
  student_id      uuid primary key references profiles(id) on delete cascade,
  pin             text not null check (pin ~ '^[0-9]{4}$'),
  failed_attempts int  not null default 0 check (failed_attempts >= 0),
  locked_until    timestamptz,
  updated_at      timestamptz not null default now()
);

comment on table student_pins is
  'A student''s PIN for the Student sign-in (0067). Read by staff and the '
  'student''s own PC; written only by the functions in 0067.';

alter table student_pins enable row level security;

-- is_teacher() counts an admin. The subqueries run once per query, not per row.
drop policy if exists student_pins_staff_read on student_pins;
create policy student_pins_staff_read on student_pins
  for select using ((select is_teacher()));

drop policy if exists student_pins_pc_read on student_pins;
create policy student_pins_pc_read on student_pins
  for select using ((select is_pc())
                    and exists (select 1 from profiles p
                                 where p.id = student_id and p.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on student_pins from anon, authenticated;
revoke select on student_pins from anon;

-- Every student gets one when they are made, and every student made before
-- this gets one now.
create or replace function public.give_student_a_pin()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.role = 'student' then
    insert into student_pins (student_id, pin) values (new.id, new_student_pin())
    on conflict (student_id) do nothing;
  end if;
  return new;
end $$;

revoke execute on function public.give_student_a_pin() from public, anon, authenticated;

drop trigger if exists profiles_give_student_a_pin on profiles;
create trigger profiles_give_student_a_pin
  after insert on profiles
  for each row execute function give_student_a_pin();

insert into student_pins (student_id, pin)
select id, new_student_pin() from profiles where role = 'student'
on conflict (student_id) do nothing;

-- ------------------------------------------------------------ the key ------
create table if not exists student_login_keys (
  key_hash   text primary key check (key_hash ~ '^[0-9a-f]{64}$'),
  student_id uuid not null references profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  expires_at timestamptz not null
);

create index if not exists student_login_keys_student on student_login_keys (student_id);

comment on table student_login_keys is
  'A signed-in student''s key, as its SHA-256 (0067). No policies: no client '
  'reads or writes it; the student functions do.';

alter table student_login_keys enable row level security;
revoke all on student_login_keys from anon, authenticated;

-- The student a key belongs to, or "signed out". Internal: every student
-- function starts here, as every link function starts at session_for_token.
create or replace function public.student_for_key(p_key text)
returns uuid
language plpgsql security definer set search_path = public as $$
declare v_id uuid;
begin
  select k.student_id into v_id
    from student_login_keys k
    join profiles p on p.id = k.student_id
   where k.key_hash = encode(sha256(convert_to(coalesce(p_key, ''), 'UTF8')), 'hex')
     and k.expires_at > now()
     and p.is_active;
  if v_id is null then raise exception 'signed out'; end if;
  return v_id;
end $$;

revoke execute on function public.student_for_key(text) from public, anon, authenticated;

-- ------------------------------------------------------------ signing in ---
-- Returns what happened rather than raising it, because a raise would roll
-- back the very count that makes guessing slow.
--
--   {ok: true,  key}                 the key, once; only its hash is kept
--   {ok: false, reason: 'wrong'}     the ID and PIN do not match — which half
--                                    is not said, so the ID is not confirmed
--   {ok: false, reason: 'locked', until}
--   {ok: false, reason: 'closed'}    the right PIN, on a suspended account
create or replace function public.student_sign_in(p_student text, p_pin text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_profile profiles;
  v_pins    student_pins;
  v_tries   int;
  v_key     text;
begin
  select * into v_profile
    from profiles
   where role = 'student'
     and display_id = upper(regexp_replace(coalesce(p_student, ''), '\s', '', 'g'));
  if v_profile.id is null then
    return jsonb_build_object('ok', false, 'reason', 'wrong');
  end if;

  select * into v_pins from student_pins where student_id = v_profile.id for update;
  if v_pins.student_id is null then
    return jsonb_build_object('ok', false, 'reason', 'wrong');
  end if;

  if v_pins.locked_until is not null and v_pins.locked_until > now() then
    return jsonb_build_object('ok', false, 'reason', 'locked', 'until', v_pins.locked_until);
  end if;

  if v_pins.pin <> btrim(coalesce(p_pin, '')) then
    v_tries := v_pins.failed_attempts + 1;
    update student_pins
       set failed_attempts = v_tries,
           -- 15 minutes at five wrong, doubling every five after, a day at most.
           locked_until = case when v_tries % 5 = 0
                               then now() + least(interval '15 minutes' * power(2, v_tries / 5 - 1),
                                                  interval '1 day')
                          end
     where student_id = v_profile.id
    returning locked_until into v_pins.locked_until;
    if v_pins.locked_until is not null then
      return jsonb_build_object('ok', false, 'reason', 'locked', 'until', v_pins.locked_until);
    end if;
    return jsonb_build_object('ok', false, 'reason', 'wrong');
  end if;

  update student_pins set failed_attempts = 0, locked_until = null where student_id = v_profile.id;

  if not v_profile.is_active then
    return jsonb_build_object('ok', false, 'reason', 'closed');
  end if;

  v_key := replace(gen_random_uuid()::text, '-', '') || replace(gen_random_uuid()::text, '-', '');
  delete from student_login_keys where student_id = v_profile.id and expires_at <= now();
  insert into student_login_keys (key_hash, student_id, expires_at)
  values (encode(sha256(convert_to(v_key, 'UTF8')), 'hex'), v_profile.id, now() + interval '7 days');

  return jsonb_build_object('ok', true, 'key', v_key);
end $$;

revoke execute on function public.student_sign_in(text, text) from public, anon, authenticated;
grant  execute on function public.student_sign_in(text, text) to anon, authenticated;

create or replace function public.student_sign_out(p_key text)
returns void
language sql security definer set search_path = public as $$
  delete from student_login_keys
   where key_hash = encode(sha256(convert_to(coalesce(p_key, ''), 'UTF8')), 'hex');
$$;

revoke execute on function public.student_sign_out(text) from public, anon, authenticated;
grant  execute on function public.student_sign_out(text) to anon, authenticated;

-- ------------------------------------------------------- the student's page -
-- Their name and ID, and every test they have that was not cancelled, newest
-- first. Each carries its link and its entry key (0066): the student has
-- already proved who they are, so opening one from here asks nothing more.
-- No question, answer, key, level or teacher's note is in it; a score is only
-- what the student can already see on the test itself once the results are
-- published.
create or replace function public.student_home(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                  from profiles p where p.id = v_student),
    'sessions', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',              s.id,
               'title',           s.title,
               'subject',         s.subject,
               'mode',            s.mode,
               'status',          s.status,
               'scheduled_at',    s.scheduled_at,
               'opened_early_at', s.opened_early_at,
               'link',            s.access_token,
               'entry_key',       s.entry_key,
               'section',         t.section,
               'skill',           t.skill,
               'set_size',        t.set_size,
               'revealed',        (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'),
               'right',           (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'
                                      and i.revealed_result = 'correct'))
             order by s.scheduled_at desc)
        from sessions s
        left join targeted_tests t on t.session_id = s.id
       where s.student_id = v_student
         and s.status <> 'cancelled'), '[]'::jsonb));
end $$;

revoke execute on function public.student_home(text) from public, anon, authenticated;
grant  execute on function public.student_home(text) to anon, authenticated;

-- --------------------------------------------------------- a new PIN -------
-- A tutor's or an admin's. Always a different PIN from the one it replaces;
-- clears the lock and signs the student out everywhere, since a PIN that has
-- to be replaced may be a PIN somebody else knows.
create or replace function public.reset_student_pin(p_student uuid)
returns text
language plpgsql security definer set search_path = public as $$
declare
  v_old text;
  v_new text;
begin
  if not is_teacher() then
    raise exception 'only staff can give a student a new PIN';
  end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'that is not a student';
  end if;

  select pin into v_old from student_pins where student_id = p_student;
  loop
    v_new := new_student_pin();
    exit when v_old is null or v_new <> v_old;
  end loop;

  insert into student_pins (student_id, pin) values (p_student, v_new)
  on conflict (student_id) do update
     set pin = excluded.pin, failed_attempts = 0, locked_until = null, updated_at = now();
  delete from student_login_keys where student_id = p_student;
  return v_new;
end $$;

revoke execute on function public.reset_student_pin(uuid) from public, anon, authenticated;
grant  execute on function public.reset_student_pin(uuid) to authenticated;
