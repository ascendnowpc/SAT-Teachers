-- ============================================================================
--  Choosing the question contract
--
--    psql "$DATABASE_URL" -f supabase/tests/choosing.sql
--
--  0047: the teacher puts any question from any of the three tests in front of
--  the student — now, or as soon as they answer the one on their screen — and
--  the test carries on from there. What has to hold:
--
--    * only the session's teacher can choose: not the student, not another
--      teacher, and only while the test is running
--    * now: the question on the screen is set aside, the chosen one is the
--      only one open, and the session is on the chosen question's test
--    * the queue carries on after the chosen question and comes back round to
--      the ones before it
--    * after this one: the question on the screen stays open, and answering
--      it brings up the chosen one rather than the test's next
--    * with nothing on the screen there is nothing to wait behind, so it goes
--      up at once
--    * once: an answered question, the one on the screen and one that was set
--      aside cannot be chosen — nor can a question no test holds, or one from
--      the other subject's tests
--    * the student still reads only what is published: the queue is out of
--      reach whatever order it is in
--    * a finished session cannot be chosen into
--
--  Depends on the level tests being loaded: English (0026) for the choosing,
--  mathematics (0041) for the other-subject refusal, which reads SKIP without
--  it. Every row must read PASS. Cleans up after itself, and is safe against a
--  real database: it is one statement, so a failure rolls back what it made.
-- ============================================================================

-- A question by its place in one of the live tests.
create or replace function public.__choosing_q(p_subject text, p_level text, p_pos int)
returns uuid language sql stable as $$
  select qi.question_id
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
   where qs.subject = p_subject and qs.level = p_level and qs.is_active and qi.position = p_pos
$$;

create or replace function public.__choosing_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();          -- the teacher
  x_id uuid := gen_random_uuid();          -- a teacher with nothing to do with it
  s_id uuid := gen_random_uuid();          -- the student
  sess uuid; it uuid; ok boolean;
  easy1 uuid; easy2 uuid; easy3 uuid;
  med6 uuid; med7 uuid; med8 uuid;
  hard3 uuid; math1 uuid; stray uuid;
  n int; txt text; want text;
begin
  -- Read as the migration role: question_set_items is teacher-only, and these
  -- are the expectations, not something either seat is being tested on.
  easy1 := __choosing_q('english','easy',1);
  easy2 := __choosing_q('english','easy',2);
  easy3 := __choosing_q('english','easy',3);
  med6  := __choosing_q('english','medium',6);
  med7  := __choosing_q('english','medium',7);
  med8  := __choosing_q('english','medium',8);
  hard3 := __choosing_q('english','hard',3);
  math1 := __choosing_q('mathematics','easy',1);

  -- A question the bank holds and no live test does.
  select q.id into stray
    from questions q
   where not exists (select 1 from question_set_items qi
                       join question_sets qs on qs.id = qi.set_id
                      where qi.question_id = q.id and qs.is_active and qs.level is not null)
   limit 1;

  return query select '0 content'::text,'the English tests are loaded'::text,'all found'::text,
    (case when easy1 is null or med7 is null or hard3 is null then 'missing' else 'all found' end),
    (case when easy1 is null or med7 is null or hard3 is null then 'FAIL' else 'PASS' end)::text;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'choose.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'choose.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'choose.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}');

  -- A teacher account arrives pending (0044). Approving it is an admin's job;
  -- with no JWT this is the migration role, which the guard lets through.
  update profiles set is_active = true where id in (t_id, x_id);

  -- ============ a session, not yet started ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() - interval '1 minute')
  returning id into sess;

  begin
    perform teacher_choose_question(sess, med7, true);
    txt := 'chosen';
  exception when others then txt := 'refused';
  end;
  return query select '1 gate'::text,'nothing is chosen before the test starts'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  perform teacher_start_session(sess);
  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = easy1;
  return query select '1 gate'::text,'the test starts on the easy test''s first'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ who can choose ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    perform teacher_choose_question(sess, med7, true);
    txt := 'chosen';
  exception when others then txt := 'refused';
  end;
  return query select '2 who'::text,'the student cannot choose'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    perform teacher_choose_question(sess, med7, true);
    txt := 'chosen';
  exception when others then txt := 'refused';
  end;
  return query select '2 who'::text,'nor can another teacher'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ now: medium 7, while easy 1 is on the screen ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  it := teacher_choose_question(sess, med7, true);

  select count(*) into n from session_items where session_id = sess and status = 'published';
  return query select '3 now'::text,'one question is open'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = med7;
  return query select '3 now'::text,'and it is the one chosen'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  select (case when status = 'voided' and asked_no is not null then 'set aside' else status::text end)
    into txt
    from session_items where session_id = sess and question_id = easy1;
  return query select '3 now'::text,'the one on the screen is set aside'::text,'set aside'::text,txt,
    (case when txt='set aside' then 'PASS' else 'FAIL' end)::text;

  select level into txt from sessions where id = sess;
  return query select '3 now'::text,'the session is on the medium test'::text,'medium'::text,txt,
    (case when txt='medium' then 'PASS' else 'FAIL' end)::text;

  -- Up next is the lowest staged sequence number: the question after 7.
  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'staged'
   order by si.sequence_no limit 1;
  select source_ref into want from questions where id = med8;
  return query select '3 now'::text,'the test carries on from it'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'staged'
   order by si.sequence_no desc limit 1;
  select source_ref into want from questions where id = med6;
  return query select '3 now'::text,'and comes round to the ones before it last'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where session_id = sess and status = 'staged';
  return query select '3 now'::text,'the rest of the medium test is queued'::text,'19'::text,n::text,
    (case when n=19 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the student's view of it ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from session_items where session_id = sess and status = 'staged';
  return query select '4 student'::text,'the queue is out of reach'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where session_id = sess and status = 'published';
  return query select '4 student'::text,'one question in front of them'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  -- They answer it; the test carries on to medium 8.
  select id into it from session_items where session_id = sess and status = 'published';
  perform submit_answer(it, 'B'::answer_option, '{}'::answer_option[], 2::smallint, null);

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = med8;
  return query select '4 student'::text,'answering it brings up the next after it'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ after this one: hard 3, while medium 8 is on the screen ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  perform teacher_choose_question(sess, hard3, false);

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = med8;
  return query select '5 next'::text,'the question on the screen stays'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'staged'
   order by si.sequence_no limit 1;
  select source_ref into want from questions where id = hard3;
  return query select '5 next'::text,'and the chosen one is up next'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  select level into txt from sessions where id = sess;
  return query select '5 next'::text,'the session is on the hard test'::text,'hard'::text,txt,
    (case when txt='hard' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  select id into it from session_items where session_id = sess and status = 'published';
  perform submit_answer(it, 'A'::answer_option, '{}'::answer_option[], 3::smallint, null);

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = hard3;
  return query select '5 next'::text,'answering it brings up the chosen one'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ once ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  begin perform teacher_choose_question(sess, med7, true); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '6 once'::text,'not a question they have answered'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_choose_question(sess, hard3, true); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '6 once'::text,'not the one on their screen'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_choose_question(sess, easy1, true); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '6 once'::text,'not one that was set aside'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  if math1 is null then
    return query select '6 once'::text,'not the other subject''s'::text,'refused'::text,
      'no mathematics tests'::text,'SKIP'::text;
  else
    begin perform teacher_choose_question(sess, math1, true); txt := 'chosen';
    exception when others then txt := 'refused'; end;
    return query select '6 once'::text,'not the other subject''s'::text,'refused'::text,txt,
      (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  end if;

  if stray is null then
    return query select '6 once'::text,'not one no test holds'::text,'refused'::text,
      'every question is in a test'::text,'SKIP'::text;
  else
    begin perform teacher_choose_question(sess, stray, true); txt := 'chosen';
    exception when others then txt := 'refused'; end;
    return query select '6 once'::text,'not one no test holds'::text,'refused'::text,txt,
      (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  end if;

  -- None of the refusals moved anything.
  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = hard3;
  return query select '6 once'::text,'and the screen is as it was'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ nothing on the screen ============
  -- The student works through the whole of the hard test, so the queue runs
  -- dry and nothing is left up.
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  n := 0;
  loop
    select id into it from session_items where session_id = sess and status = 'published';
    exit when it is null or n > 40;
    perform submit_answer(it, 'C'::answer_option, '{}'::answer_option[], 2::smallint, null);
    n := n + 1;
  end loop;
  return query select '7 empty'::text,'the whole hard test is answered'::text,'20'::text,n::text,
    (case when n=20 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from session_items where session_id = sess and status in ('published','staged');
  return query select '7 empty'::text,'nothing is up and nothing is queued'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  perform teacher_choose_question(sess, easy2, false);

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'published';
  select source_ref into want from questions where id = easy2;
  return query select '7 empty'::text,'"after this one" goes up at once'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  -- Easy 1 was set aside at the start, so it is not queued again.
  select count(*) into n from session_items where session_id = sess and status = 'staged';
  return query select '7 empty'::text,'the easy test is queued without the one set aside'::text,
    '18'::text,n::text,(case when n=18 then 'PASS' else 'FAIL' end)::text;

  select q.source_ref into txt
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status = 'staged'
   order by si.sequence_no limit 1;
  select source_ref into want from questions where id = easy3;
  return query select '7 empty'::text,'and carries on from the one chosen'::text,want,txt,
    (case when txt=want then 'PASS' else 'FAIL' end)::text;

  -- ============ a finished session ============
  perform teacher_finish_session(sess);
  begin perform teacher_choose_question(sess, easy3, true); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '8 over'::text,'nothing is chosen into a finished session'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ who can even ask ============
  ok := has_function_privilege('anon', 'public.teacher_choose_question(uuid,uuid,boolean)', 'execute');
  return query select '9 grants'::text,'anon cannot reach it'::text,'no'::text,
    (case when ok then 'yes' else 'no' end),(case when ok then 'FAIL' else 'PASS' end)::text;

  -- Cleanup. The serial numbers the accounts consumed stay consumed; see the
  -- note in level_session.sql for why they are not rewound.
  delete from sessions where id = sess;
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand.
  delete from profiles where id in (t_id, x_id, s_id);
  delete from auth.users where id in (t_id, x_id, s_id);
end $fn$;

select * from public.__choosing_check();

drop function public.__choosing_check();
drop function public.__choosing_q(text, text, int);
