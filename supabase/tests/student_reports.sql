-- ============================================================================
--  The student, and the family, read every report (0098)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_reports.sql
--
--  What has to hold:
--
--    * the list carries the student, their PC, and every report that is
--      ready: a lesson's once generated or published, a targeted test's once
--      over — each with its score — and nothing still being written or sat
--    * one report's rows open for a ready report of theirs, shaped as the
--      staff's pages read them: a lesson's with its form and its report row,
--      a targeted test's with its test, its set's size and its questions
--    * and leave out what the report never reads: a question's options, key,
--      rationale and explanation, and who generated the report
--    * a report not ready, somebody else's, or a made-up key opens nothing
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

create or replace function public.__student_reports_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  other profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"OPTION-ONE"},{"label":"B","body":"OPTION-TWO"}]';
  q1 uuid; q2 uuid; q3 uuid;
  tgt uuid; lesson uuid; draft uuid; later uuid; theirs uuid;
  key text; si uuid; pin text; skey text;
  j jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'srs.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Reports', 'srs.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu   from create_student('Rae', 'Reports', pc.id);
  select * into other from create_student('Oli', 'Reports', pc.id);
  q1 := create_question_in_set(pool, 'expression_of_ideas', 'Passage.', 'Reports one?', 'RATIONALE-SRS',
          opts, 'A', 'EXPLAIN-SRS', null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Reports two?', null,
          opts, 'A', null, null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Reports three?', null,
          opts, 'A', null, null, 'transitions', null, 'hard');

  -- A targeted test, sat to the end: two right, one wrong.
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Transitions', 3, array[q1, q2, q3], false, 60, 600);
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
  -- A lesson with a generated report and one answer, right.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, started_at, status, ended_at, mode, teacher_notes)
  values (t_id, stu.id, 'english', now() - interval '2 days', now() - interval '2 days', 'completed',
          now() - interval '2 days', 'diagnostic', 'TEACHERS-READ')
  returning id into lesson;
  insert into session_items (session_id, question_id, student_id, sequence_no, status, selected_option,
                             revealed_result, revealed_correct_option, revealed_explanation)
  values (lesson, q1, stu.id, 1, 'revealed', 'A', 'correct', 'A', 'EXPLAIN-SRS')
  returning id into si;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (si, true, 40);
  insert into session_domain_notes (session_id, domain, strengths, gaps)
  values (lesson, 'expression_of_ideas', 'STRENGTH-SRS', 'GAP-SRS');
  insert into session_reports (session_id, generated_at, generated_by, summary)
  values (lesson, now() - interval '1 day', t_id, 'SUMMARY-SRS');
  -- A lesson whose report is still being written: nothing generated, a draft.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at, mode)
  values (t_id, stu.id, 'english', now() - interval '1 day', 'completed', now() - interval '1 day', 'diagnostic')
  returning id into draft;
  insert into session_reports (session_id, summary) values (draft, 'NOT-YET');
  -- A targeted test still to come.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode)
  values (t_id, stu.id, 'english', now() + interval '2 days', 'targeted')
  returning id into later;
  -- Somebody else's lesson, generated.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at, mode)
  values (t_id, other.id, 'english', now() - interval '3 days', 'completed', now() - interval '3 days', 'diagnostic')
  returning id into theirs;
  insert into session_reports (session_id, generated_at) values (theirs, now());

  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  perform __as(null, 'anon');
  skey := student_sign_in(stu.display_id, pin)->>'key';

  -- ============ 1. the list ============
  j := student_report_list(skey);
  return query select '1 list'::text, 'it names the student and their PC'::text,
    stu.display_id || ' / Pat Reports', coalesce(j->'student'->>'display_id', '?') || ' / ' || coalesce(j->'student'->>'pc', '?'),
    __verdict(j->'student'->>'display_id' = stu.display_id and j->'student'->>'pc' = 'Pat Reports');
  select string_agg(e->>'kind', ',' order by e->>'at' desc) into txt from jsonb_array_elements(j->'reports') e;
  return query select '1 list'::text, 'every report ready, newest first, and nothing else'::text,
    'targeted,lesson'::text, coalesce(txt, '(none)'), __verdict(txt = 'targeted,lesson');
  select (e->>'right') || '/' || (e->>'of') into txt from jsonb_array_elements(j->'reports') e where e->>'kind' = 'targeted';
  return query select '1 list'::text, 'a targeted test carries its score'::text, '2/3'::text,
    coalesce(txt, '(none)'), __verdict(txt = '2/3');
  select (e->>'right') || '/' || (e->>'of') || ' ' || (e->>'teacher') into txt
    from jsonb_array_elements(j->'reports') e where e->>'kind' = 'lesson';
  return query select '1 list'::text, 'a lesson carries its score and its teacher'::text, '1/1 Malya Rao'::text,
    coalesce(txt, '(none)'), __verdict(txt = '1/1 Malya Rao');

  -- ============ 2. one report ============
  j := student_session_report(skey, lesson);
  return query select '2 lesson'::text, 'a generated lesson report opens, form and all'::text,
    'lesson 1 item, 1 note, SUMMARY-SRS'::text,
    (j->>'kind') || ' ' || jsonb_array_length(j->'items') || ' item, ' || jsonb_array_length(j->'notes')
      || ' note, ' || coalesce(j->'meta'->>'summary', '?'),
    __verdict(j->>'kind' = 'lesson' and jsonb_array_length(j->'items') = 1
              and jsonb_array_length(j->'notes') = 1 and j->'meta'->>'summary' = 'SUMMARY-SRS');
  return query select '2 lesson'::text, 'each item carries its question and its assessment'::text,
    'transitions / 40'::text,
    coalesce(j->'items'->0->'questions'->>'skill', '?') || ' / '
      || coalesce(j->'items'->0->'session_item_assessments'->>'elapsed_seconds', '?'),
    __verdict(j->'items'->0->'questions'->>'skill' = 'transitions'
              and (j->'items'->0->'session_item_assessments'->>'elapsed_seconds')::int = 40);
  return query select '2 lesson'::text, 'and the session, its teacher and the teacher''s read'::text,
    'Malya Rao / TEACHERS-READ'::text,
    coalesce(j->'session'->'teacher'->>'full_name', '?') || ' / ' || coalesce(j->'session'->>'teacher_notes', '?'),
    __verdict(j->'session'->'teacher'->>'full_name' = 'Malya Rao' and j->'session'->>'teacher_notes' = 'TEACHERS-READ');
  txt := j::text;
  return query select '2 lesson'::text, 'no options, key, rationale, explanation or who generated it'::text,
    'absent'::text,
    (case when position('OPTION-ONE' in txt) > 0 or position('RATIONALE-SRS' in txt) > 0
            or position('EXPLAIN-SRS' in txt) > 0 or position('generated_by' in txt) > 0
            or position('student_id' in (j->'items'->0)::text) > 0
          then 'present' else 'absent' end),
    __verdict(position('OPTION-ONE' in txt) = 0 and position('RATIONALE-SRS' in txt) = 0
              and position('EXPLAIN-SRS' in txt) = 0 and position('generated_by' in txt) = 0
              and position('student_id' in (j->'items'->0)::text) = 0);

  j := student_session_report(skey, tgt);
  return query select '2 targeted'::text, 'a finished targeted test opens with its test and set'::text,
    'targeted 3 items, set of 3, transitions'::text,
    (j->>'kind') || ' ' || jsonb_array_length(j->'items') || ' items, set of ' || (j->>'set_count')
      || ', ' || coalesce(j->'test'->>'skill', '?'),
    __verdict(j->>'kind' = 'targeted' and jsonb_array_length(j->'items') = 3
              and (j->>'set_count')::int = 3 and j->'test'->>'skill' = 'transitions');
  select count(*) into n from jsonb_array_elements(j->'questions') e
   where (e->>'id')::uuid in (q1, q2, q3);
  return query select '2 targeted'::text, 'with the questions its pattern is read from'::text, '3'::text,
    n::text, __verdict(n = 3);
  return query select '2 targeted'::text, 'and the progress the line is drawn from'::text, 'a config'::text,
    (case when j->'progress'->'config' is not null then 'a config' else 'none' end),
    __verdict(j->'progress'->'config' is not null);

  -- ============ 3. nothing else ============
  foreach si in array array[draft, later, theirs] loop
    begin perform student_session_report(skey, si); txt := 'opened';
    exception when others then txt := sqlerrm; end;
    return query select '3 refused'::text,
      (case si when draft then 'a report still being written' when later then 'a test not sat yet'
               else 'somebody else''s report' end)::text,
      'no such report'::text, txt, __verdict(txt = 'no such report');
  end loop;

  begin perform student_report_list('not-a-key'); txt := 'opened';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'a made-up key lists nothing'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');
  begin perform student_session_report('not-a-key', lesson); txt := 'opened';
  exception when others then txt := sqlerrm; end;
  return query select '3 refused'::text, 'and opens nothing'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  -- Published is ready too, generated or not.
  perform __as(null, 'postgres');
  update session_reports set status = 'published', published_at = now() where session_id = draft;
  perform __as(null, 'anon');
  select count(*) into n from jsonb_array_elements(student_report_list(skey)->'reports') e;
  return query select '3 refused'::text, 'until it is published'::text, '3 reports'::text,
    n::text || ' reports', __verdict(n = 3);

  -- ============ 4. grants ============
  perform __as(null, 'postgres');
  return query select '4 grants'::text, 'the two doors — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_report_list(text)', 'execute')
               and has_function_privilege('anon', 'public.student_session_report(text,uuid)', 'execute')
          then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_report_list(text)', 'execute')
              and has_function_privilege('anon', 'public.student_session_report(text,uuid)', 'execute'));
  return query select '4 grants'::text, 'student_report_ready — internal'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.student_report_ready(uuid,uuid)', 'execute')
            or has_function_privilege('authenticated', 'public.student_report_ready(uuid,uuid)', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.student_report_ready(uuid,uuid)', 'execute')
              and not has_function_privilege('authenticated', 'public.student_report_ready(uuid,uuid)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id in (stu.id, other.id);
  delete from sessions where student_id in (stu.id, other.id);
  delete from questions where id in (q1, q2, q3);
  delete from profiles where id in (stu.id, other.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__student_reports_check();

drop function public.__student_reports_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
