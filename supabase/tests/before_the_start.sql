-- ============================================================================
--  Before the start, and the tests a session sat
--
--    psql "$DATABASE_URL" -f supabase/tests/before_the_start.sql
--
--  0052: nothing happens to a session before its test has started. While it
--  is scheduled the teacher can neither move the level nor end it, and it is
--  refused in the words choosing a question already used. Starting it is
--  untouched, and once it is live both work as they always did.
--
--  0053: a session keeps the tests the student sat beside the count of what
--  they answered — levels_sat, each test once, in the order first reached. A
--  question set aside by a level move is not in it, and handing the test in
--  keeps it.
--
--  Depends on the three level tests being loaded (migration 0026).
--
--  Every row must read PASS. Cleans up after itself, and is safe against a
--  real database: it is one statement, so a failure rolls back the accounts it
--  created rather than leaving them behind.
-- ============================================================================

create or replace function public.__before_start_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  sess uuid; it uuid;
  n int; txt text;
  pc profiles;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'start.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'start.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Zixi Test"}');

  -- A student is booked with their PC or not at all (0055).
  pc := create_pc_profile('Pat', 'Coordinator', 'start.pc@example.test');
  update profiles set pc_id = pc.id where id = s_id;

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  -- Its time has come, and nobody has started it: the case the console used to
  -- offer the level buttons and End session on.
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() - interval '1 minute')
  returning id into sess;

  -- ============ before the start ============
  begin perform set_session_level(sess, 'medium'); txt := 'moved';
  exception when others then txt := sqlerrm; end;
  return query select '1 before'::text,'the level does not move before the start'::text,
    'the test has not started yet'::text,txt,
    (case when txt='the test has not started yet' then 'PASS' else 'FAIL' end)::text;

  select level into txt from sessions where id = sess;
  return query select '1 before'::text,'so it still starts on easy'::text,'easy'::text,txt,
    (case when txt='easy' then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_finish_session(sess); txt := 'ended';
  exception when others then txt := sqlerrm; end;
  return query select '1 before'::text,'nor can it be ended'::text,
    'the test has not started yet'::text,txt,
    (case when txt='the test has not started yet' then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '1 before'::text,'so it is still scheduled'::text,'scheduled'::text,txt,
    (case when txt='scheduled' then 'PASS' else 'FAIL' end)::text;

  -- ============ starting it is untouched ============
  perform teacher_start_session(sess);
  select status::text into txt from sessions where id = sess;
  return query select '2 start'::text,'the teacher starts it for them'::text,'live'::text,txt,
    (case when txt='live' then 'PASS' else 'FAIL' end)::text;

  select levels_sat::text into txt from sessions where id = sess;
  return query select '2 start'::text,'nothing is sat until something is answered'::text,'{}'::text,txt,
    (case when txt='{}' then 'PASS' else 'FAIL' end)::text;

  -- ============ easy, up to medium, back down to easy ============
  select id into it from session_items where session_id = sess and status = 'published';
  perform teacher_answer_item(it, 'A'::answer_option, '{}'::answer_option[], 2::smallint, null);
  select levels_sat::text into txt from sessions where id = sess;
  return query select '3 sat'::text,'an easy answer: the easy test'::text,'{easy}'::text,txt,
    (case when txt='{easy}' then 'PASS' else 'FAIL' end)::text;

  -- Live now, so the level moves — and the easy question on the screen is set
  -- aside on the way, which is not sitting it.
  perform set_session_level(sess, 'medium');
  select level into txt from sessions where id = sess;
  return query select '3 sat'::text,'once it is live the level moves'::text,'medium'::text,txt,
    (case when txt='medium' then 'PASS' else 'FAIL' end)::text;

  select levels_sat::text into txt from sessions where id = sess;
  return query select '3 sat'::text,'moving is not sitting: still only easy'::text,'{easy}'::text,txt,
    (case when txt='{easy}' then 'PASS' else 'FAIL' end)::text;

  select id into it from session_items where session_id = sess and status = 'published';
  perform teacher_answer_item(it, 'B'::answer_option, '{}'::answer_option[], 2::smallint, null);
  select levels_sat::text into txt from sessions where id = sess;
  return query select '3 sat'::text,'a medium answer adds the medium test'::text,'{easy,medium}'::text,txt,
    (case when txt='{easy,medium}' then 'PASS' else 'FAIL' end)::text;

  perform set_session_level(sess, 'easy');
  select id into it from session_items where session_id = sess and status = 'published';
  perform teacher_answer_item(it, 'C'::answer_option, '{}'::answer_option[], 2::smallint, null);
  select levels_sat::text into txt from sessions where id = sess;
  return query select '3 sat'::text,'back on easy: each test once, in the order reached'::text,
    '{easy,medium}'::text,txt,
    (case when txt='{easy,medium}' then 'PASS' else 'FAIL' end)::text;

  select answered_count into n from sessions where id = sess;
  return query select '3 sat'::text,'and answered_count still counts the answers'::text,'3'::text,n::text,
    (case when n=3 then 'PASS' else 'FAIL' end)::text;

  -- ============ once live, it can be handed in ============
  perform teacher_finish_session(sess);
  select status::text into txt from sessions where id = sess;
  return query select '4 end'::text,'a live test can be ended'::text,'completed'::text,txt,
    (case when txt='completed' then 'PASS' else 'FAIL' end)::text;

  -- Handing in voids what was never reached, and none of that was sat.
  select levels_sat::text into txt from sessions where id = sess;
  return query select '4 end'::text,'and what was sat is kept'::text,'{easy,medium}'::text,txt,
    (case when txt='{easy,medium}' then 'PASS' else 'FAIL' end)::text;

  select level into txt from sessions where id = sess;
  return query select '4 end'::text,'while level still says where it ended'::text,'easy'::text,txt,
    (case when txt='easy' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the plumbing ============
  select count(*) into n from pg_trigger
   where tgrelid = 'public.session_items'::regclass and not tgisinternal
     and tgname in ('session_items_answered_count', 'session_items_answers');
  return query select '5 plumbing'::text,'one trigger keeps both numbers'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  return query select '5 plumbing'::text,'the old count-only function is gone'::text,'absent'::text,
    (case when to_regprocedure('public.sync_session_answered_count()') is null
          then 'absent' else 'present' end),
    (case when to_regprocedure('public.sync_session_answered_count()') is null
          then 'PASS' else 'FAIL' end)::text;

  return query select '5 plumbing'::text,'the level lookup is not a client''s to call'::text,
    'no execute'::text,
    (case when has_function_privilege('authenticated',
            to_regprocedure('public.session_levels_sat(uuid)')::oid, 'execute')
          then 'execute' else 'no execute' end),
    (case when has_function_privilege('authenticated',
            to_regprocedure('public.session_levels_sat(uuid)')::oid, 'execute')
          then 'FAIL' else 'PASS' end)::text;

  -- Cleanup, as level_session.sql does it.
  delete from sessions where id = sess;
  delete from profiles where id in (t_id, s_id, pc.id);
  delete from auth.users where id in (t_id, s_id);
end $fn$;

select * from public.__before_start_check();

drop function public.__before_start_check();
