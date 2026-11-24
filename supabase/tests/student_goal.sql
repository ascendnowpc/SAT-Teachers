-- ============================================================================
--  A student sets their goal and the day of their next SAT (0101)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_goal.sql
--
--  What has to hold:
--
--    * nothing is set until the student sets it
--    * a target for each half, the day and its registration deadline are
--      kept, and read back
--    * either target may be empty; all four empty forgets the goal
--    * a target off College Board's scale, a day already gone, or a deadline
--      after the test, is refused; so is a made-up key
--    * staff read every goal; a PC reads their own student's and nobody
--      else's; nobody writes the table directly
--    * the PC (their own student) or an admin sets it, which confirms it;
--      not a teacher, not another PC; once confirmed the student cannot
--      change it; every version is kept in the history
--    * the grants: signed out too, the key being the check
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

create or replace function public.__goal_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc   profiles;
  pc2  profiles;
  stu  profiles;
  v_pin text; k text; j jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'goal.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Gita Rao"}'),
         (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'goal.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Gil', 'Goal', 'goal.pc@example.test');
  pc2 := create_pc_profile('Ola', 'Other', 'goal.pc2@example.test');
  perform __as(t_id);
  select * into stu from create_student('Gemma', 'Goal', pc.id);

  perform __as(null, 'postgres');
  select s.pin into v_pin from student_pins s where student_id = stu.id;
  perform __as(null, 'anon');
  k := student_sign_in(stu.display_id, v_pin)->>'key';

  -- ============ 1. setting it ============
  j := student_goal(k);
  return query select '1 set'::text, 'nothing until it is set'::text, 'null'::text,
    coalesce(j::text, 'null'), __verdict(j is null);

  j := student_set_goal(k, 700, 750, current_date + 30, current_date + 5);
  return query select '1 set'::text, 'both targets, the day and its deadline'::text, '700/750'::text,
    concat(j->>'target_rw', '/', j->>'target_math'),
    __verdict((j->>'target_rw')::int = 700 and (j->>'target_math')::int = 750
              and (j->>'next_test_on')::date = current_date + 30
              and (j->>'registration_deadline_on')::date = current_date + 5
              and j->>'confirmed_at' is null);
  j := student_goal(k);
  return query select '1 set'::text, 'read back'::text, '700/750'::text,
    concat(j->>'target_rw', '/', j->>'target_math'),
    __verdict((j->>'target_rw')::int = 700 and (j->>'target_math')::int = 750);

  j := student_set_goal(k, null, 720, null);
  return query select '1 set'::text, 'one target alone, no day'::text, '/720/'::text,
    concat(j->>'target_rw', '/', j->>'target_math', '/', j->>'next_test_on'),
    __verdict(j->>'target_rw' is null and (j->>'target_math')::int = 720 and j->>'next_test_on' is null);

  -- ============ 2. refusals ============
  begin perform student_set_goal(k, 705, 700, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a target not in tens'::text, 'refused'::text, txt,
    __verdict(txt like 'a Reading and Writing goal is%');
  begin perform student_set_goal(k, 700, 900, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a target above 800'::text, 'refused'::text, txt,
    __verdict(txt like 'a Math goal is%');
  begin perform student_set_goal(k, 700, 700, current_date - 10); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a day already gone'::text, 'refused'::text, txt,
    __verdict(txt like 'the next test is a day still to come%');
  begin perform student_set_goal(k, 700, 700, current_date + 10, current_date + 20); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a deadline after the test'::text, 'refused'::text, txt,
    __verdict(txt like 'the registration deadline comes before%');
  begin perform student_set_goal('not-a-key', 700, 700, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a made-up key'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');
  j := student_goal(k);
  return query select '2 refused'::text, 'and none of them changed it'::text, '/720'::text,
    concat(j->>'target_rw', '/', j->>'target_math'),
    __verdict(j->>'target_rw' is null and (j->>'target_math')::int = 720);

  -- ============ 3. who reads it ============
  perform __as(t_id);
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '3 readers'::text, 'a teacher reads it'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc.id);
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '3 readers'::text, 'the student''s PC reads it'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc2.id);
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '3 readers'::text, 'another PC does not'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(null, 'anon');
  select count(*) into n from student_goals;
  return query select '3 readers'::text, 'signed out reads nothing'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(t_id);
  begin update student_goals set target_rw = 800 where student_id = stu.id; txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '3 readers'::text, 'staff do not write it directly'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  -- ============ 4. the PC's say ============
  perform __as(t_id);
  begin perform set_student_goal(stu.id, 650, 650, null); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '4 the PC'::text, 'a teacher does not set it'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc2.id);
  begin perform set_student_goal(stu.id, 650, 650, null); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '4 the PC'::text, 'nor another PC'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc.id);
  perform set_student_goal(stu.id, 680, 740, current_date + 40, current_date + 10);
  perform __as(null, 'anon');
  j := student_goal(k);
  return query select '4 the PC'::text, 'the student''s PC sets it, and that confirms it'::text, '680/740 confirmed'::text,
    concat(j->>'target_rw', '/', j->>'target_math', case when j->>'confirmed_at' is not null then ' confirmed' end),
    __verdict((j->>'target_rw')::int = 680 and j->>'confirmed_at' is not null);
  begin perform student_set_goal(k, 800, 800, null); txt := 'changed';
  exception when others then txt := sqlerrm; end;
  return query select '4 the PC'::text, 'once confirmed, the student cannot change it'::text, 'refused'::text, txt,
    __verdict(txt like 'your PC has confirmed%');
  perform __as(ad_id);
  perform set_student_goal(stu.id, 690, 740, current_date + 40, current_date + 10);
  perform __as(pc.id);
  select count(*) into n from student_goal_history where student_id = stu.id;
  return query select '4 the PC'::text, 'an admin changes it too, and every version is kept'::text, '>= 4'::text, n::text,
    __verdict(n >= 4);
  perform __as(pc2.id);
  select count(*) into n from student_goal_history where student_id = stu.id;
  return query select '4 the PC'::text, 'another PC reads no history'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 5. forgetting it ============
  perform __as(pc.id);
  perform set_student_goal(stu.id, null, null, null, null);
  perform __as(null, 'postgres');
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '5 forget'::text, 'the PC empties it, and it is forgotten'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(null, 'anon');
  j := student_set_goal(k, 700, null, null);
  perform __as(null, 'postgres');
  select count(*) into n from student_goals where student_id = stu.id and confirmed_at is null;
  return query select '5 forget'::text, 'then the student can set it again'::text, '1'::text, n::text, __verdict(n = 1);

  perform __as(null, 'anon');
  j := student_set_goal(k, null, null, null, null);
  perform __as(null, 'postgres');
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '6 forget'::text, 'all four empty forgets it'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 7. grants ============
  return query select '7 grants'::text, 'student_set_goal — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_set_goal(text,int,int,date,date)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_set_goal(text,int,int,date,date)', 'execute'));
  return query select '7 grants'::text, 'set_student_goal — never signed out'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.set_student_goal(uuid,int,int,date,date)', 'execute') then 'anon' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.set_student_goal(uuid,int,int,date,date)', 'execute'));
  return query select '7 grants'::text, 'student_goal — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_goal(text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_goal(text)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__goal_check();

drop function public.__goal_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
