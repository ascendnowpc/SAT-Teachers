-- ============================================================================
--  A student changes their own PIN (0100)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_pin_change.sql
--
--  What has to hold:
--
--    * the right current PIN and a new four digits change it: the new one
--      signs in, the old one does not
--    * this device stays signed in; every other device is signed out
--    * a wrong current PIN changes nothing, and counts towards the lock: the
--      fifth wrong one locks it, and the lock holds for sign-in too
--    * a new PIN that is not four digits, or is the same, changes nothing
--    * a made-up key changes nothing
--    * the grant: signed out too, the key being the check
--
--  Every row must read PASS. Cleans up after itself.
-- ============================================================================

create or replace function public.__as(p uuid, r text default 'authenticated') returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims',
    case when p is null then '' else json_build_object('sub', p::text, 'role', r)::text end, true);
  execute format('set local role %I', r);
end $$;

create or replace function public.__verdict(ok boolean) returns text
language sql as $$ select case when ok then 'PASS' else 'FAIL' end $$;

create or replace function public.__pin_change_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  pc   profiles;
  stu  profiles;
  old_pin text; new_pin text; here text; there text; j jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'pinch.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;
  pc := create_pc_profile('Pat', 'Pin', 'pinch.pc@example.test');
  perform __as(t_id);
  select * into stu from create_student('Pia', 'Pin', pc.id);

  perform __as(null, 'postgres');
  select pin into old_pin from student_pins where student_id = stu.id;
  new_pin := case when old_pin = '2468' then '1357' else '2468' end;

  perform __as(null, 'anon');
  here  := student_sign_in(stu.display_id, old_pin)->>'key';
  there := student_sign_in(stu.display_id, old_pin)->>'key';

  -- ============ 1. refusals that change nothing ============
  j := student_change_pin(here, old_pin, '12a4');
  return query select '1 refused'::text, 'a new PIN that is not four digits'::text, 'invalid'::text,
    coalesce(j->>'reason', '?'), __verdict(j->>'reason' = 'invalid');
  j := student_change_pin(here, old_pin, old_pin);
  return query select '1 refused'::text, 'the same PIN again'::text, 'same'::text,
    coalesce(j->>'reason', '?'), __verdict(j->>'reason' = 'same');
  begin perform student_change_pin('not-a-key', old_pin, new_pin); txt := 'changed';
  exception when others then txt := sqlerrm; end;
  return query select '1 refused'::text, 'a made-up key'::text, 'signed out'::text, txt, __verdict(txt = 'signed out');
  j := student_change_pin(here, '0000', new_pin);
  if old_pin = '0000' then j := student_change_pin(here, '9999', new_pin); end if;
  return query select '1 refused'::text, 'a wrong current PIN'::text, 'wrong'::text,
    coalesce(j->>'reason', '?'), __verdict(j->>'reason' = 'wrong');
  perform __as(null, 'postgres');
  select pin into txt from student_pins where student_id = stu.id;
  return query select '1 refused'::text, 'and none of them changed it'::text, 'unchanged'::text,
    (case when txt = old_pin then 'unchanged' else 'changed' end), __verdict(txt = old_pin);

  -- ============ 2. the change ============
  perform __as(null, 'anon');
  j := student_change_pin(here, old_pin, new_pin);
  return query select '2 changed'::text, 'the right current PIN and four new digits'::text, 'true'::text,
    coalesce(j->>'ok', '?'), __verdict((j->>'ok')::boolean);
  return query select '2 changed'::text, 'the new PIN signs in'::text, 'true'::text,
    coalesce(student_sign_in(stu.display_id, new_pin)->>'ok', '?'),
    __verdict((student_sign_in(stu.display_id, new_pin)->>'ok')::boolean);
  return query select '2 changed'::text, 'the old one does not'::text, 'wrong'::text,
    coalesce(student_sign_in(stu.display_id, old_pin)->>'reason', '?'),
    __verdict(student_sign_in(stu.display_id, old_pin)->>'reason' = 'wrong');

  begin perform student_home(here); txt := 'signed in';
  exception when others then txt := sqlerrm; end;
  return query select '2 changed'::text, 'this device stays signed in'::text, 'signed in'::text, txt,
    __verdict(txt = 'signed in');
  begin perform student_home(there); txt := 'signed in';
  exception when others then txt := sqlerrm; end;
  return query select '2 changed'::text, 'every other device is signed out'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  -- ============ 3. guessing ============
  perform __as(null, 'postgres');
  update student_pins set failed_attempts = 0, locked_until = null where student_id = stu.id;
  perform __as(null, 'anon');
  for n in 1..5 loop
    j := student_change_pin(here, case when new_pin = '0000' then '9999' else '0000' end, '1111');
  end loop;
  return query select '3 guessing'::text, 'the fifth wrong current PIN locks it'::text, 'locked'::text,
    coalesce(j->>'reason', '?'), __verdict(j->>'reason' = 'locked');
  j := student_change_pin(here, new_pin, '1111');
  return query select '3 guessing'::text, 'even the right one waits out the lock'::text, 'locked'::text,
    coalesce(j->>'reason', '?'), __verdict(j->>'reason' = 'locked');
  return query select '3 guessing'::text, 'and sign-in is locked too'::text, 'locked'::text,
    coalesce(student_sign_in(stu.display_id, new_pin)->>'reason', '?'),
    __verdict(student_sign_in(stu.display_id, new_pin)->>'reason' = 'locked');

  -- ============ 4. grant ============
  perform __as(null, 'postgres');
  return query select '4 grants'::text, 'student_change_pin — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_change_pin(text,text,text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_change_pin(text,text,text)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__pin_change_check();

drop function public.__pin_change_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
