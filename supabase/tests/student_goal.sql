-- ============================================================================
--  A student's goal: set on joining, never locked (0101, 0105, 0106)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_goal.sql
--
--  What has to hold:
--
--    * before anything, no goal and no onboarding; the day they joined is known
--    * a total target, section targets, the day, its deadline and what their
--      college needs are kept, and read back
--    * finishing (or skipping) onboarding is remembered, and keeps the goal
--    * a target off College Board's scale, a day already gone, a deadline
--      after the test or a made-up key is refused
--    * the PC (their own student) or an admin sets it, which confirms it; not
--      a teacher, not another PC
--    * the student can still change it after the PC confirmed: nothing is
--      locked, and their change waits for the PC again
--    * every version is kept; staff and the student's PC read goals and
--      history, another PC does not; nobody writes the tables directly
--    * the grants: the student's doors signed out too, the PC's never
--    * student_goal reads the goal itself (0106); 0101's four- and
--      five-argument savers are gone (0108)
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
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc   profiles;
  pc2  profiles;
  stu  profiles;
  v_pin text; k text; j jsonb; g jsonb; txt text; n int;
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

  -- ============ 1. before anything ============
  j := student_goal_state(k);
  return query select '1 start'::text, 'no goal, not onboarded, the day they joined'::text, 'null/null/today'::text,
    concat(coalesce(j->>'goal', 'null'), '/', coalesce(j->>'onboarded_at', 'null'), '/', j->>'joined_on'),
    __verdict(j->'goal' = 'null'::jsonb and j->>'onboarded_at' is null and (j->>'joined_on')::date = current_date);

  -- ============ 2. setting it ============
  j := student_set_goal(k, 1450, 720, 730, current_date + 30, current_date + 5, '  NYU, 1450+  ');
  g := j->'goal';
  return query select '2 set'::text, 'total, sections, day, deadline, college'::text, '1450/720/730/NYU, 1450+'::text,
    concat(g->>'target_total', '/', g->>'target_rw', '/', g->>'target_math', '/', g->>'college_note'),
    __verdict((g->>'target_total')::int = 1450 and (g->>'target_rw')::int = 720 and (g->>'target_math')::int = 730
              and (g->>'next_test_on')::date = current_date + 30
              and (g->>'registration_deadline_on')::date = current_date + 5
              and g->>'college_note' = 'NYU, 1450+' and g->>'confirmed_at' is null);
  return query select '2 set'::text, 'setting a goal is not finishing onboarding'::text, 'null'::text,
    coalesce(j->>'onboarded_at', 'null'), __verdict(j->>'onboarded_at' is null);

  j := student_finish_onboarding(k);
  return query select '2 set'::text, 'finishing onboarding is remembered, the goal kept'::text, 'onboarded, 1450'::text,
    concat(case when j->>'onboarded_at' is not null then 'onboarded' else 'not' end, ', ', j->'goal'->>'target_total'),
    __verdict(j->>'onboarded_at' is not null and (j->'goal'->>'target_total')::int = 1450);

  -- ============ 3. refusals ============
  begin perform student_set_goal(k, 1455, null, null, null, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a total not in tens'::text, 'refused'::text, txt,
    __verdict(txt like 'a total goal is%');
  begin perform student_set_goal(k, null, 705, null, null, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a section target not in tens'::text, 'refused'::text, txt,
    __verdict(txt like 'a Reading and Writing goal is%');
  begin perform student_set_goal(k, null, null, null, current_date - 10, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a day already gone'::text, 'refused'::text, txt,
    __verdict(txt like 'the next test is a day still to come%');
  begin perform student_set_goal(k, null, null, null, current_date + 10, current_date + 20, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a deadline after the test'::text, 'refused'::text, txt,
    __verdict(txt like 'the registration deadline comes before%');
  begin perform student_set_goal('not-a-key', 1400, null, null, null, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a made-up key'::text, 'signed out'::text, txt, __verdict(txt = 'signed out');
  j := student_goal_state(k);
  return query select '3 refused'::text, 'and none of them changed it'::text, '1450'::text,
    coalesce(j->'goal'->>'target_total', 'none'), __verdict((j->'goal'->>'target_total')::int = 1450);

  -- ============ 4. the PC's say ============
  perform __as(t_id);
  begin perform set_student_goal(stu.id, 1400, null, null, null, null, null); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '4 the PC'::text, 'a teacher does not set it'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc2.id);
  begin perform set_student_goal(stu.id, 1400, null, null, null, null, null); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '4 the PC'::text, 'nor another PC'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc.id);
  perform set_student_goal(stu.id, 1420, 700, 720, current_date + 30, current_date + 5, 'NYU, 1450+');
  perform __as(null, 'anon');
  j := student_goal_state(k);
  return query select '4 the PC'::text, 'the student''s PC sets it, and that confirms it'::text, '1420 confirmed'::text,
    concat(j->'goal'->>'target_total', case when j->'goal'->>'confirmed_at' is not null then ' confirmed' end),
    __verdict((j->'goal'->>'target_total')::int = 1420 and j->'goal'->>'confirmed_at' is not null);

  -- ============ 5. never locked ============
  j := student_set_goal(k, 1480, 720, 760, current_date + 30, current_date + 5, 'NYU, 1450+');
  return query select '5 never locked'::text, 'the student changes it after the PC confirmed'::text, '1480, to confirm'::text,
    concat(j->'goal'->>'target_total', case when j->'goal'->>'confirmed_at' is null then ', to confirm' else ', confirmed' end),
    __verdict((j->'goal'->>'target_total')::int = 1480 and j->'goal'->>'confirmed_at' is null);
  j := student_set_goal(k, null, null, null, null, null, null);
  return query select '5 never locked'::text, 'emptied, it reads as no goal — still onboarded'::text, 'null, onboarded'::text,
    concat(coalesce(j->>'goal', 'null'), case when j->>'onboarded_at' is not null then ', onboarded' end),
    __verdict(j->'goal' = 'null'::jsonb and j->>'onboarded_at' is not null);

  -- ============ 6. who reads it ============
  perform __as(pc.id);
  select count(*) into n from student_goal_history where student_id = stu.id;
  return query select '6 readers'::text, 'every version is kept, and the PC reads it'::text, '4'::text, n::text,
    __verdict(n = 4);
  perform __as(t_id);
  select count(*) into n from student_goals where student_id = stu.id;
  return query select '6 readers'::text, 'a teacher reads the goal'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc2.id);
  select count(*) into n from student_goal_history where student_id = stu.id;
  return query select '6 readers'::text, 'another PC reads no history'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(null, 'anon');
  select count(*) into n from student_goals;
  return query select '6 readers'::text, 'signed out reads nothing'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(ad_id);
  begin update student_goals set target_total = 1600 where student_id = stu.id; txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '6 readers'::text, 'nobody writes it directly, an admin neither'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  -- ============ 7. grants ============
  perform __as(null, 'postgres');
  return query select '7 grants'::text, 'student_set_goal — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_set_goal(text,int,int,int,date,date,text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_set_goal(text,int,int,int,date,date,text)', 'execute'));
  return query select '7 grants'::text, 'student_finish_onboarding — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_finish_onboarding(text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_finish_onboarding(text)', 'execute'));
  return query select '7 grants'::text, 'set_student_goal — never signed out'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.set_student_goal(uuid,int,int,int,date,date,text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.set_student_goal(uuid,int,int,int,date,date,text)', 'execute'));
  return query select '7 grants'::text, 'goal_record — nobody'::text, 'nobody'::text,
    (case when has_function_privilege('authenticated', 'public.goal_record(uuid,uuid,text,int,int,int,date,date,text)', 'execute') then 'authenticated' else 'nobody' end),
    __verdict(not has_function_privilege('authenticated', 'public.goal_record(uuid,uuid,text,int,int,int,date,date,text)', 'execute'));
  return query select '7 grants'::text, 'goal_json — nobody'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.goal_json(uuid)', 'execute') then 'anon' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.goal_json(uuid)', 'execute'));

  -- ============ 8. 0101's doors are gone (0108) ============
  return query select '8 gone'::text, '0101''s student_set_goal'::text, 'absent'::text,
    (case when to_regprocedure('public.student_set_goal(text,int,int,date,date)') is null then 'absent' else 'present' end),
    __verdict(to_regprocedure('public.student_set_goal(text,int,int,date,date)') is null);
  return query select '8 gone'::text, '0101''s set_student_goal'::text, 'absent'::text,
    (case when to_regprocedure('public.set_student_goal(uuid,int,int,date,date)') is null then 'absent' else 'present' end),
    __verdict(to_regprocedure('public.set_student_goal(uuid,int,int,date,date)') is null);
  j := student_goal(k);
  return query select '8 gone'::text, 'student_goal still reads the goal itself'::text, 'no state'::text,
    (case when j ? 'onboarded_at' then 'state' else 'no state' end), __verdict(coalesce(not (j ? 'onboarded_at'), true));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__goal_check();

drop function public.__goal_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
