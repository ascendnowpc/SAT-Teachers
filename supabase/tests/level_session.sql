-- ============================================================================
--  Level session contract
--
--    psql "$DATABASE_URL" -f supabase/tests/level_session.sql
--
--  The workflow 0027 left standing, and the whole of it: a session is a level.
--  The student opens it, the easy test loads, every answer brings up the next
--  question, and either of them moves the level when it is the wrong one.
--  What has to hold:
--
--    * a student cannot open a session before its scheduled time, or open
--      somebody else's at all
--    * opening loads the easy test and publishes its first question — the
--      teacher prepared nothing
--    * exactly one question is readable at a time, which is what makes the
--      per-question timing mean anything
--    * answering publishes the next one, in the test's order
--    * moving level voids the question on screen, drops the rest of the old
--      test, and opens the new test at its first question
--    * what the student already answered survives the move
--    * the teacher can move it too, and a stranger cannot
--    * a question already asked is never asked twice, even moving back down
--    * leaving ends the session: unanswered questions are voided, answered
--      ones are kept, and nothing is left open to come back to
--
--  Depends on the three level tests being loaded (migration 0026).
--
--  Every row must read PASS. Cleans up after itself, and is safe against a
--  real database: it is one statement, so a failure rolls back the accounts it
--  created rather than leaving them behind.
-- ============================================================================

create or replace function public.__level_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  o_id uuid := gen_random_uuid();          -- a second student, not on the session
  sess uuid; it uuid;
  easy_n int; med_n int;
  easy_1 text; easy_2 text; med_1 text;
  n int; txt text;
begin
  -- Read as the migration role, before any RLS is in play: question_sets is
  -- teacher-only and these are the expectations the assertions below compare
  -- against, not something either seat is supposed to be able to see.
  select count(*) into easy_n
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
   where qs.level = 'easy' and qs.subject = 'english' and qs.is_active;
  select count(*) into med_n
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
   where qs.level = 'medium' and qs.subject = 'english' and qs.is_active;

  -- By source_ref rather than by stem: three of these questions print the same
  -- stem ("Which choice completes the text…"), so a stem comparison would pass
  -- whichever of them turned up.
  select q.source_ref into easy_1
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
    join questions q on q.id = qi.question_id
   where qs.level = 'easy' and qs.subject = 'english' and qs.is_active and qi.position = 1;
  select q.source_ref into easy_2
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
    join questions q on q.id = qi.question_id
   where qs.level = 'easy' and qs.subject = 'english' and qs.is_active and qi.position = 2;
  select q.source_ref into med_1
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
    join questions q on q.id = qi.question_id
   where qs.level = 'medium' and qs.subject = 'english' and qs.is_active and qi.position = 1;

  return query select '0 content'::text,'the three tests are loaded'::text,
    'easy and medium both non-empty'::text,
    (easy_n::text || ' easy / ' || med_n::text || ' medium'),
    (case when easy_n > 0 and med_n > 0 then 'PASS' else 'FAIL' end)::text;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'level.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'level.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}'),
    (o_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'level.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}');

  -- ============ TEACHER: a session next hour, and nothing else ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() + interval '1 hour')
  returning id into sess;

  select level into txt from sessions where id = sess;
  return query select '1 create'::text,'a new session starts on easy'::text,'easy'::text,txt,
    (case when txt='easy' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where session_id = sess;
  return query select '1 create'::text,'with nothing in it — there is no paper'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ STUDENT: cannot open it early ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  begin
    perform start_session_as_student(sess);
    txt := 'opened';
  exception when others then txt := 'refused';
  end;
  return query select '2 gate'::text,'before the scheduled time'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ a different student cannot open it at all ============
  perform set_config('request.jwt.claims', json_build_object('sub',o_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    perform start_session_as_student(sess);
    txt := 'opened';
  exception when others then txt := 'refused';
  end;
  return query select '2 gate'::text,'somebody else''s session'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_session_level(sess, 'hard');
    txt := 'moved';
  exception when others then txt := 'refused';
  end;
  return query select '2 gate'::text,'nor move its level'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the time comes ============
  update sessions set scheduled_at = now() - interval '1 minute' where id = sess;

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := start_session_as_student(sess);
  return query select '3 open'::text,'opening loads the easy test'::text,easy_n::text,n::text,
    (case when n=easy_n then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '3 open'::text,'and the session goes live'::text,'live'::text,txt,
    (case when txt='live' then 'PASS' else 'FAIL' end)::text;

  -- The student's own view: RLS hides everything not published to them, so
  -- this count is the number of questions within their reach.
  select count(*) into n from session_items;
  return query select '3 open'::text,'exactly one question is in reach'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt from session_items si join questions q on q.id=si.question_id;
  return query select '3 open'::text,'and it is the easy test''s first'::text,easy_1,txt,
    (case when txt=easy_1 then 'PASS' else 'FAIL' end)::text;

  select level_size into n from sessions where id = sess;
  return query select '3 open'::text,'the length of the test is readable'::text,easy_n::text,n::text,
    (case when n=easy_n then 'PASS' else 'FAIL' end)::text;

  -- ============ answering brings up the next one ============
  select id into it from session_items;
  perform mark_item_viewed(it);
  perform submit_answer(it, 'B'::answer_option, '{}'::answer_option[], 3::smallint, 'because');

  select count(*) into n from session_items;
  return query select '4 loop'::text,'now two are in reach — the answered one and the next'::text,
    '2'::text,n::text,(case when n=2 then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id=si.question_id
   where si.status = 'published';
  return query select '4 loop'::text,'the open one is the test''s second'::text,easy_2,txt,
    (case when txt=easy_2 then 'PASS' else 'FAIL' end)::text;

  select coalesce(revealed_result::text,'null') into txt from session_items where id=it;
  return query select '4 loop'::text,'and the result is still withheld'::text,'null'::text,txt,
    (case when txt='null' then 'PASS' else 'FAIL' end)::text;

  -- ============ the student moves themselves up a level ============
  n := set_session_level(sess, 'medium');
  return query select '5 move'::text,'the medium test loads'::text,med_n::text,n::text,
    (case when n=med_n then 'PASS' else 'FAIL' end)::text;

  select level into txt from sessions where id = sess;
  return query select '5 move'::text,'and the session says so'::text,'medium'::text,txt,
    (case when txt='medium' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'published';
  return query select '5 move'::text,'exactly one question is open'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id=si.question_id
   where si.status = 'published';
  return query select '5 move'::text,'and it is the medium test''s first'::text,med_1,txt,
    (case when txt=med_1 then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from session_items where id = it;
  return query select '5 move'::text,'what they answered survives the move'::text,'answered'::text,txt,
    (case when txt='answered' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'voided';
  return query select '5 move'::text,'the question on screen is voided, not lost'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select level_size into n from sessions where id = sess;
  return query select '5 move'::text,'the length is the new test''s'::text,med_n::text,n::text,
    (case when n=med_n then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the teacher can move it too ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select (case when (select elapsed_seconds from session_item_assessments where session_item_id=it) is not null
          then 'timed' else 'not timed' end) into txt;
  return query select '6 teacher'::text,'the answer was timed'::text,'timed'::text,txt,
    (case when txt='timed' then 'PASS' else 'FAIL' end)::text;

  perform set_session_level(sess, 'easy');
  select level into txt from sessions where id = sess;
  return query select '6 teacher'::text,'the teacher moves them back down'::text,'easy'::text,txt,
    (case when txt='easy' then 'PASS' else 'FAIL' end)::text;

  -- The one they answered and the one that was voided on the way out are both
  -- already in this session, so the easy test comes back two questions short.
  select count(*) into n
    from session_items si
   where si.session_id = sess and si.status = 'staged';
  return query select '6 teacher'::text,'nothing already asked is asked again'::text,
    (easy_n - 3)::text, n::text,
    (case when n = easy_n - 3 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where session_id = sess and status = 'published';
  return query select '6 teacher'::text,'and one question is open'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  -- ============ what is gone is gone ============
  return query select '7 gone'::text,'set_session_paper no longer exists'::text,'absent'::text,
    (case when to_regprocedure('public.set_session_paper(uuid, uuid[])') is null
          then 'absent' else 'present' end),
    (case when to_regprocedure('public.set_session_paper(uuid, uuid[])') is null
          then 'PASS' else 'FAIL' end)::text;
  return query select '7 gone'::text,'nor can a teacher hand over a question'::text,'absent'::text,
    (case when to_regprocedure('public.publish_item(uuid)') is null
          then 'absent' else 'present' end),
    (case when to_regprocedure('public.publish_item(uuid)') is null
          then 'PASS' else 'FAIL' end)::text;

  -- load_session_level does no permission checking of its own — its callers do
  -- it — so a PUBLIC grant on it is a way to reload somebody else's session
  -- mid-test. 0027 revoked it from the roles, which does nothing while PUBLIC
  -- holds the grant; 0028 revoked it from PUBLIC. This is that, asserted.
  return query select '7 gone'::text,'the level loader is not reachable from a client'::text,
    'no'::text,
    (case when has_function_privilege('authenticated',
            to_regprocedure('public.load_session_level(uuid, text)')::oid, 'execute')
          then 'yes' else 'no' end),
    (case when has_function_privilege('authenticated',
            to_regprocedure('public.load_session_level(uuid, text)')::oid, 'execute')
          then 'FAIL' else 'PASS' end)::text;
  execute 'reset role';

  -- ============ leaving a test in progress ends it ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := finish_session_as_student(sess);
  return query select '8 leave'::text,'the questions never reached are voided'::text,
    (easy_n - 2)::text, n::text,
    (case when n = easy_n - 2 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'published';
  return query select '8 leave'::text,'nothing is left open to come back to'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'answered';
  return query select '8 leave'::text,'what they did answer is kept'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '8 leave'::text,'and the session is completed'::text,'completed'::text,txt,
    (case when txt='completed' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Cleanup. The three test accounts consume three serial numbers on their way
  -- through, and those are left consumed rather than reset: the counters are
  -- global, and rewinding them on a database with real accounts on it would
  -- hand the next signup an id somebody already has.
  delete from sessions where id=sess;
  delete from auth.users where id in (t_id,s_id,o_id);
end $fn$;

select * from public.__level_check();

drop function public.__level_check();
