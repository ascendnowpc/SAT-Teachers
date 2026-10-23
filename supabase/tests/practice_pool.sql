-- ============================================================================
--  The practice pool (0060)
--
--    psql "$DATABASE_URL" -f supabase/tests/practice_pool.sql
--
--  What has to hold:
--
--    * each subject has one active pool: kind practice, no level — and a
--      second one cannot be made
--    * a teacher writes into it with a difficulty and a skill, in one call, and
--      the question keeps the difficulty it was given
--    * without the difficulty, or without the skill, it is refused
--    * the three tests still decide their own level: a question written into
--      the easy test is easy, and one sent as hard is refused
--    * a student cannot write into it
--    * a lesson cannot show a pool question: choosing one is refused
--    * the old create_question_in_set is gone, and the new one is signed-in
--      only
--
--  Every row must read PASS. Cleans up after itself. The lesson row needs the
--  three English tests (0026) and reads SKIP without them.
-- ============================================================================

create or replace function public.__as(p uuid, r text default 'authenticated') returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims',
    case when p is null then '' else json_build_object('sub', p::text, 'role', r)::text end, true);
  execute format('set local role %I', r);
end $$;

create or replace function public.__pool_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  s_id  uuid := gen_random_uuid();
  pc    profiles;
  pool  uuid; easy uuid;
  q     uuid; q_easy uuid;
  sess  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  n     int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pool.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pool.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Pool"}');
  update profiles set is_active = true where id = t_id;
  pc := create_pc_profile('Pat', 'Pool', 'pool.pc@example.test');
  update profiles set pc_id = pc.id where id = s_id;

  -- ============ 1. the pools ============
  select count(*) into n from question_sets
   where kind = 'practice' and is_active and level is null and subject in ('english', 'mathematics');
  return query select '1 pools'::text, 'one active pool for each subject, with no level'::text,
    '2'::text, n::text, (case when n = 2 then 'PASS' else 'FAIL' end)::text;

  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  begin
    insert into question_sets (title, subject, kind) values ('A second pool', 'english', 'practice');
    txt := 'made';
  exception when others then txt := 'refused'; end;
  return query select '1 pools'::text, 'a second active pool for a subject is refused'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  begin
    insert into question_sets (title, subject, kind, level) values ('A levelled pool', 'english', 'practice', 'easy');
    txt := 'made';
  exception when others then txt := 'refused'; end;
  return query select '1 pools'::text, 'and so is a pool with a level'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 2. writing into it ============
  perform __as(t_id);
  q := create_question_in_set(pool, 'expression_of_ideas', 'A passage.', 'Which transition?', 'Why hard.',
         opts, 'A', 'Because.', null, 'transitions', null, 'hard');

  select count(*) into n from question_set_items where set_id = pool and question_id = q;
  return query select '2 writing'::text, 'a teacher writes a question into the pool, filed in one call'::text,
    '1'::text, n::text, (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  select difficulty::text into txt from questions where id = q;
  return query select '2 writing'::text, 'and it keeps the difficulty it was given'::text,
    'hard'::text, txt, (case when txt = 'hard' then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question_in_set(pool, 'expression_of_ideas', null, 'No level?', null,
              opts, 'A', null, null, 'transitions', null, null);
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '2 writing'::text, 'without a difficulty it is refused'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question_in_set(pool, 'expression_of_ideas', null, 'No skill?', null,
              opts, 'A', null, null, null, null, 'easy');
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '2 writing'::text, 'without a skill it is refused'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. the tests keep their level ============
  select id into easy from question_sets where subject = 'english' and level = 'easy' and is_active;
  if easy is null then
    return query select '3 tests'::text, 'needs the English easy test (0026)'::text,
      'loaded'::text, 'not loaded'::text, 'SKIP'::text;
  else
    q_easy := create_question_in_set(easy, 'expression_of_ideas', null, 'Filed in easy?', null,
                opts, 'A', null, null, 'transitions', null, null);
    select difficulty::text into txt from questions where id = q_easy;
    return query select '3 tests'::text, 'a question written into the easy test is easy'::text,
      'easy'::text, txt, (case when txt = 'easy' then 'PASS' else 'FAIL' end)::text;

    begin
      perform create_question_in_set(easy, 'expression_of_ideas', null, 'Hard in easy?', null,
                opts, 'A', null, null, 'transitions', null, 'hard');
      txt := 'written';
    exception when others then txt := 'refused'; end;
    return query select '3 tests'::text, 'and one sent as hard is refused'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;
  end if;

  -- ============ 4. a student ============
  perform __as(s_id);
  begin
    perform create_question_in_set(pool, 'expression_of_ideas', null, 'A student''s?', null,
              opts, 'A', null, null, 'transitions', null, 'easy');
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '4 student'::text, 'a student cannot write into the pool'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 5. a lesson cannot show it ============
  if easy is null then
    return query select '5 lesson'::text, 'needs the three English tests (0026)'::text,
      'loaded'::text, 'not loaded'::text, 'SKIP'::text;
  else
    perform __as(t_id);
    insert into sessions (teacher_id, student_id, subject, scheduled_at)
    values (t_id, s_id, 'english', now() - interval '1 minute') returning id into sess;
    perform teacher_start_session(sess);
    begin perform teacher_choose_question(sess, q, true); txt := 'shown';
    exception when others then txt := 'refused'; end;
    return query select '5 lesson'::text, 'choosing a pool question in a lesson is refused'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;
  end if;

  -- ============ 6. grants ============
  perform __as(null, 'postgres');
  txt := 'create_question_in_set(uuid,text,text,text,text,jsonb,answer_option,text,text,text,text)';
  return query select '6 grants'::text, txt || ' — dropped', 'absent'::text,
    (case when to_regprocedure('public.'||txt) is null then 'absent' else 'present' end),
    (case when to_regprocedure('public.'||txt) is null then 'PASS' else 'FAIL' end)::text;

  txt := 'create_question_in_set(uuid,text,text,text,text,jsonb,answer_option,text,text,text,text,difficulty_level)';
  return query select '6 grants'::text, txt || ' — signed in only', 'authenticated'::text,
    (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
          when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
          else 'nobody' end),
    (case when not has_function_privilege('anon', 'public.'||txt, 'execute')
           and has_function_privilege('authenticated', 'public.'||txt, 'execute')
          then 'PASS' else 'FAIL' end)::text;

  -- Cleanup.
  delete from sessions where id = sess;
  delete from questions where id in (q, q_easy);
  delete from profiles where id in (t_id, s_id, pc.id);
  delete from auth.users where id in (t_id, s_id);
end $fn$;

select * from public.__pool_check();

drop function public.__pool_check();
drop function public.__as(uuid, text);
