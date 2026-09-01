-- ============================================================================
--  Teacher-paced session contract
--
--    psql "$DATABASE_URL" -f supabase/tests/teacher_paced_session.sql
--
--  0023 gave a session a pacing. Under 'teacher' the paper stops being a queue
--  and becomes a pool: nothing reaches the student until the teacher hands it
--  over, and the teacher may hand over the paper's third question first and its
--  first question never. What has to hold:
--
--    * a session paces itself unless it is told otherwise
--    * starting a teacher-paced session opens nothing — the student waits, and
--      the paper is as far out of reach as it was before they started
--    * the teacher can hand over any question in the paper, in any order
--    * only one at a time: a second is refused while the student is on one,
--      which is the whole basis of the per-question clock
--    * answering does not bring up the next one
--    * a student cannot hand themselves a question
--    * asked_no records the order the questions were actually asked in, which
--      is not the order the paper holds them in
--    * switching the pacing back mid-session resumes the queue
--
--  Every row must read PASS. Cleans up after itself.
-- ============================================================================

create or replace function public.__paced_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  qa uuid; qb uuid; qc uuid; sess uuid;
  i_a uuid; i_b uuid; i_c uuid;
  n int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'paced.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'paced.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}');

  -- ============ TEACHER: a three-question paper, opening a minute ago ========
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  qa := create_question('english','craft_and_structure', null, 'Question A?',
        'easy'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, null);
  qb := create_question('english','craft_and_structure', null, 'Question B?',
        'medium'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, null);
  qc := create_question('english','craft_and_structure', null, 'Question C?',
        'hard'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'A'::answer_option, null);

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() - interval '1 minute')
  returning id into sess;

  select pacing into txt from sessions where id = sess;
  return query select '1 pacing'::text,'a session paces itself unless told otherwise'::text,
    'student'::text, txt, (case when txt='student' then 'PASS' else 'FAIL' end)::text;

  n := set_session_paper(sess, array[qa, qb, qc]);
  perform set_session_pacing(sess, 'teacher');

  select pacing into txt from sessions where id = sess;
  return query select '1 pacing'::text,'the teacher takes it over'::text,
    'teacher'::text, txt, (case when txt='teacher' then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_session_pacing(sess, 'whoever');
    txt := 'accepted';
  exception when others then txt := 'refused';
  end;
  return query select '1 pacing'::text,'and it is one of two things'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  select id into i_a from session_items where session_id=sess and question_id=qa;
  select id into i_b from session_items where session_id=sess and question_id=qb;
  select id into i_c from session_items where session_id=sess and question_id=qc;

  -- Nothing can be handed over before the student is in the room.
  begin
    perform publish_item(i_a);
    txt := 'published';
  exception when others then txt := 'refused';
  end;
  return query select '2 gate'::text,'a question cannot be sent before the student starts'::text,
    'refused'::text,txt,(case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ STUDENT: starts, and waits ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := start_session_as_student(sess);
  select status::text into txt from sessions where id = sess;
  return query select '3 open'::text,'the session still goes live'::text,'live'::text,txt,
    (case when txt='live' then 'PASS' else 'FAIL' end)::text;

  -- The student's own view: RLS hides everything not published to them.
  select count(*) into n from session_items;
  return query select '3 open'::text,'but nothing is in reach — they are waiting'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  -- And they cannot help themselves to one.
  begin
    perform publish_item(i_b);
    txt := 'published';
  exception when others then txt := 'refused';
  end;
  return query select '3 open'::text,'a student cannot hand themselves a question'::text,
    'refused'::text,txt,(case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ TEACHER: hands over the paper's third question first ========
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  perform publish_item(i_c);

  begin
    perform publish_item(i_a);
    txt := 'published';
  exception when others then txt := 'refused';
  end;
  return query select '4 choose'::text,'a second question is refused while one is open'::text,
    'refused'::text,txt,(case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from session_items;
  return query select '4 choose'::text,'exactly one question is in reach'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select q.stem into txt from session_items si join questions q on q.id=si.question_id;
  return query select '4 choose'::text,'and it is the one the teacher picked, not the paper''s first'::text,
    'Question C?'::text, txt, (case when txt='Question C?' then 'PASS' else 'FAIL' end)::text;

  select asked_no into n from session_items where id = i_c;
  return query select '4 choose'::text,'asked first, though it sits third in the paper'::text,
    '1'::text, n::text, (case when n=1 then 'PASS' else 'FAIL' end)::text;

  -- ============ answering brings up nothing ============
  perform mark_item_viewed(i_c);
  perform submit_answer(i_c, 'A'::answer_option, '{}'::answer_option[], 3::smallint, null);

  select count(*) into n from session_items where status = 'published';
  return query select '5 hold'::text,'answering opens nothing on its own'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items;
  return query select '5 hold'::text,'and the rest of the paper is still out of reach'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ TEACHER: the next one, and then hands the paper back ========
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  perform publish_item(i_a);
  select asked_no into n from session_items where id = i_a;
  return query select '6 next'::text,'the ask order counts on regardless of the paper''s'::text,
    '2'::text, n::text, (case when n=2 then 'PASS' else 'FAIL' end)::text;

  perform set_session_pacing(sess, 'student');
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  perform mark_item_viewed(i_a);
  perform submit_answer(i_a, 'B'::answer_option, '{}'::answer_option[], 2::smallint, null);

  select q.stem into txt
    from session_items si join questions q on q.id=si.question_id
   where si.status = 'published';
  return query select '7 handed back'::text,'the queue resumes where the paper left off'::text,
    'Question B?'::text, coalesce(txt,'nothing'),
    (case when txt='Question B?' then 'PASS' else 'FAIL' end)::text;

  select asked_no into n from session_items where id = i_b;
  return query select '7 handed back'::text,'and it is the third thing asked'::text,
    '3'::text, n::text, (case when n=3 then 'PASS' else 'FAIL' end)::text;

  select coalesce(revealed_result::text,'null') into txt from session_items where id=i_c;
  return query select '7 handed back'::text,'nothing about the reveal changed'::text,'null'::text,txt,
    (case when txt='null' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Cleanup. The serial numbers the two accounts consumed stay consumed; see
  -- the note in prepared_session.sql for why they are not rewound.
  delete from sessions where id=sess;
  delete from questions where created_by=t_id;
  delete from auth.users where id in (t_id,s_id);
end $fn$;

select * from public.__paced_check();

drop function public.__paced_check();
