-- ============================================================================
--  The parent report, inside the student's account (0070)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_report.sql
--
--  What has to hold:
--
--    * a signed-in student's key opens their report: their name, and each
--      subject they have sessions in
--    * it carries the numbers the card draws from — the sessions, the
--      targeted tests, and per question its skill, right or wrong and whether
--      it timed out — and the same right answers as the staff's progress
--    * and nothing else: no question id, difficulty, timing, teacher's name,
--      shared wording or summary
--    * a made-up key opens nothing
--    * student_progress, whose body moved into progress_payload, still
--      answers staff and refuses a stranger
--    * the grants are what they say
--
--  Every row must read PASS. Cleans up after itself, and is safe to run
--  against a real database: it writes its own questions into the English
--  practice pool (0060) and removes them.
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

create or replace function public.__student_report_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid;
  tgt uuid; key text; si uuid; pin text; skey text;
  rep jsonb; prog jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'sr.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Report', 'sr.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Rae', 'Report', pc.id);
  q1 := create_question_in_set(pool, 'expression_of_ideas', 'Passage.', 'Report one?', 'RATIONALE-SR',
          opts, 'A', 'EXPLAIN-SR', null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Report two?', null,
          opts, 'A', null, null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Report three?', null,
          opts, 'A', null, null, 'transitions', null, 'hard');
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Transitions', 3, array[q1, q2, q3], false, 60, 600);
  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'SUMMARY-FOR-THE-PC');
  perform share_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', true);

  perform __as(null, 'postgres');
  select entry_key into key from sessions where id = tgt;
  perform __as(null, 'anon');
  perform start_session_by_token(key);
  for n in 1..3 loop
    perform __as(null, 'postgres');
    select id into si from session_items where session_id = tgt and status = 'published';
    perform __as(null, 'anon');
    perform answer_by_token(key, si, case when n = 3 then 'B' else 'A' end::answer_option, '{}', 2::smallint, null);
  end loop;

  perform __as(null, 'postgres');
  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  perform __as(null, 'anon');
  skey := student_sign_in(stu.display_id, pin)->>'key';

  -- ============ 1. the report ============
  rep := student_report(skey);
  return query select '1 report'::text, 'the key opens the student''s report'::text, stu.display_id,
    coalesce(rep->'student'->>'display_id', '(none)'), __verdict(rep->'student'->>'display_id' = stu.display_id);
  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(rep->'subjects') k;
  return query select '1 report'::text, 'with each subject they have sessions in'::text, 'english'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'english');

  select count(*) filter (where (e->>'is_correct')::boolean) into n
    from jsonb_array_elements(rep->'subjects'->'english'->'items') e where e->>'session_id' = tgt::text;
  return query select '1 report'::text, 'it counts what the test counted'::text, '2 right'::text,
    n::text || ' right', __verdict(n = 2);

  perform __as(t_id);
  prog := student_progress(stu.id, 'english');
  select count(*) filter (where (e->>'is_correct')::boolean) into n
    from jsonb_array_elements(prog->'items') e where e->>'session_id' = tgt::text;
  return query select '1 report'::text, 'and so does the staff''s progress, from the same rows'::text, '2 right'::text,
    n::text || ' right', __verdict(n = 2);

  -- ============ 2. nothing else ============
  perform __as(null, 'anon');
  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(rep->'subjects'->'english'->'items'->0) k;
  return query select '2 only'::text, 'a question is its numbers'::text,
    'is_correct,section,session_id,skill,status,timed_out'::text, txt,
    __verdict(txt = 'is_correct,section,session_id,skill,status,timed_out');
  txt := rep::text;
  return query select '2 only'::text, 'no question id, difficulty, timing, teacher, summary or rationale'::text,
    'absent'::text,
    (case when position(q1::text in txt) > 0 or position('difficulty' in txt) > 0
            or position('elapsed_seconds' in txt) > 0 or position('Malya' in txt) > 0
            or position('SUMMARY-FOR-THE-PC' in txt) > 0 or position('RATIONALE-SR' in txt) > 0
            or position('EXPLAIN-SR' in txt) > 0
          then 'present' else 'absent' end),
    __verdict(position(q1::text in txt) = 0 and position('difficulty' in txt) = 0
              and position('elapsed_seconds' in txt) = 0 and position('Malya' in txt) = 0
              and position('SUMMARY-FOR-THE-PC' in txt) = 0 and position('RATIONALE-SR' in txt) = 0
              and position('EXPLAIN-SR' in txt) = 0);

  begin perform student_report('not-a-key'); txt := 'opened';
  exception when others then txt := sqlerrm; end;
  return query select '2 only'::text, 'a made-up key opens nothing'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  -- ============ 3. student_progress still answers as it did ============
  perform __as(t_id);
  return query select '3 progress'::text, 'staff still read it, summary included'::text, 'true'::text,
    (position('SUMMARY-FOR-THE-PC' in prog::text) > 0)::text, __verdict(position('SUMMARY-FOR-THE-PC' in prog::text) > 0);
  perform __as(null, 'anon');
  begin perform student_progress(stu.id, 'english'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '3 progress'::text, 'and a stranger still cannot'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  -- ============ 4. grants ============
  perform __as(null, 'postgres');
  return query select '4 grants'::text, 'student_report(text) — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_report(text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_report(text)', 'execute'));
  return query select '4 grants'::text, 'progress_payload(uuid,text) — internal'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.progress_payload(uuid,text)', 'execute')
            or has_function_privilege('authenticated', 'public.progress_payload(uuid,text)', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.progress_payload(uuid,text)', 'execute')
              and not has_function_privilege('authenticated', 'public.progress_payload(uuid,text)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from skill_summaries where student_id = stu.id;
  delete from sessions where id = tgt;
  delete from questions where id in (q1, q2, q3);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__student_report_check();

drop function public.__student_report_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
