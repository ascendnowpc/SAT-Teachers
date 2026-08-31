-- ============================================================================
--  Prepared session contract
--
--    psql "$DATABASE_URL" -f supabase/tests/prepared_session.sql
--
--  The workflow 0016 moved off the clock: the teacher builds the paper before
--  the day, the student opens it themselves at the scheduled time, and each
--  answer brings up the next question. What has to hold:
--
--    * the paper is stored in the order the teacher gave, not the bank's
--    * a student cannot open a session before its scheduled time
--    * a student cannot open somebody else's session
--    * exactly one question is readable at a time — the rest are out of reach,
--      which is what makes the per-question timing mean anything
--    * answering publishes the next one, in the paper's order
--    * once the paper is with the student it cannot be renumbered underneath
--    * leaving a test ends it: unanswered questions are voided, answered ones
--      are kept, and nothing is left open to come back to
--
--  Every row must read PASS. Cleans up after itself, and is safe against a
--  real database: it is one statement, so a failure rolls back the accounts it
--  created rather than leaving them behind.
-- ============================================================================

create or replace function public.__prepared_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  o_id uuid := gen_random_uuid();          -- a second student, not on the session
  qa uuid; qb uuid; qc uuid; sess uuid; it uuid;
  n int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'prep.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'prep.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}'),
    (o_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'prep.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}');

  -- ============ TEACHER: three questions and a session next hour ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  qa := create_question('english','craft_and_structure', null, 'Question A?',
        'easy'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, 'B is right.');
  qb := create_question('english','craft_and_structure', null, 'Question B?',
        'easy'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, null);
  qc := create_question('english','craft_and_structure', null, 'Question C?',
        'easy'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'A'::answer_option, null);

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() + interval '1 hour')
  returning id into sess;

  -- ============ the build step ============
  n := set_session_paper(sess, array[qc, qa, qb]);
  return query select '1 build'::text,'the call returns the length'::text,'3'::text,n::text,
    (case when n=3 then 'PASS' else 'FAIL' end)::text;

  select string_agg(q.stem, ' ' order by si.sequence_no) into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess;
  return query select '1 build'::text,'stored in the teacher''s order'::text,
    'Question C? Question A? Question B?'::text, txt,
    (case when txt='Question C? Question A? Question B?' then 'PASS' else 'FAIL' end)::text;

  select question_count into n from sessions where id = sess;
  return query select '1 build'::text,'the length is on the session for the student to read'::text,
    '3'::text, n::text, (case when n=3 then 'PASS' else 'FAIL' end)::text;

  -- reordering is a whole-list re-save, and must not append
  n := set_session_paper(sess, array[qa, qb, qc]);
  select count(*) into n from session_items where session_id = sess;
  return query select '1 build'::text,'re-saving replaces rather than appends'::text,'3'::text,n::text,
    (case when n=3 then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_session_paper(sess, array[qa, qa]);
    txt := 'accepted';
  exception when others then txt := 'refused';
  end;
  return query select '1 build'::text,'the same question twice is refused'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
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

  select count(*) into n from session_items;
  return query select '2 gate'::text,'and the queued paper is invisible'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
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
  execute 'reset role';

  -- ============ the time comes ============
  update sessions set scheduled_at = now() - interval '1 minute' where id = sess;

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := start_session_as_student(sess);
  return query select '3 open'::text,'the student opens it themselves'::text,'3'::text,n::text,
    (case when n=3 then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '3 open'::text,'the session goes live'::text,'live'::text,txt,
    (case when txt='live' then 'PASS' else 'FAIL' end)::text;

  -- The student's own view: RLS hides everything not published to them, so
  -- this count is the number of questions within their reach.
  select count(*) into n from session_items;
  return query select '3 open'::text,'exactly one question is in reach'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select q.stem into txt from session_items si join questions q on q.id=si.question_id;
  return query select '3 open'::text,'and it is the first of the paper'::text,'Question A?'::text,txt,
    (case when txt='Question A?' then 'PASS' else 'FAIL' end)::text;

  -- ============ answering brings up the next one ============
  select id into it from session_items;
  perform mark_item_viewed(it);
  perform submit_answer(it, 'B'::answer_option, '{}'::answer_option[], 3::smallint, 'because');

  select count(*) into n from session_items;
  return query select '4 loop'::text,'now two are in reach — the answered one and the next'::text,
    '2'::text,n::text,(case when n=2 then 'PASS' else 'FAIL' end)::text;

  select q.stem into txt
    from session_items si join questions q on q.id=si.question_id
   where si.status = 'published';
  return query select '4 loop'::text,'the open one is the paper''s second'::text,'Question B?'::text,txt,
    (case when txt='Question B?' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from questions;
  return query select '4 loop'::text,'the third is still unreadable'::text,'2'::text,n::text,
    (case when n=2 then 'PASS' else 'FAIL' end)::text;

  select coalesce(revealed_result::text,'null') into txt from session_items where id=it;
  return query select '4 loop'::text,'and the result is still withheld'::text,'null'::text,txt,
    (case when txt='null' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the paper is fixed once it is out ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select (case when (select elapsed_seconds from session_item_assessments where session_item_id=it) is not null
          then 'timed' else 'not timed' end) into txt;
  return query select '5 fixed'::text,'the answer was timed'::text,'timed'::text,txt,
    (case when txt='timed' then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_session_paper(sess, array[qa]);
    txt := 'rewritten';
  exception when others then txt := 'refused';
  end;
  return query select '5 fixed'::text,'the paper cannot be rewritten under the student'::text,
    'refused'::text,txt,(case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ leaving a test in progress ends it ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := finish_session_as_student(sess);
  return query select '6 leave'::text,'the questions never reached are voided'::text,'2'::text,n::text,
    (case when n=2 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'published';
  return query select '6 leave'::text,'nothing is left open to come back to'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status = 'answered';
  return query select '6 leave'::text,'what they did answer is kept'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '6 leave'::text,'and the session is completed'::text,'completed'::text,txt,
    (case when txt='completed' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Cleanup. The three test accounts consume three serial numbers on their way
  -- through, and those are left consumed rather than reset: the counters are
  -- global, and rewinding them on a database with real accounts on it would
  -- hand the next signup an id somebody already has.
  delete from sessions where id=sess;
  delete from questions where created_by=t_id;
  delete from auth.users where id in (t_id,s_id,o_id);
end $fn$;

select * from public.__prepared_check();

drop function public.__prepared_check();
