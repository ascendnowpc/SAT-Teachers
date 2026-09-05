-- ============================================================================
--  Session workflow contract
--
--    psql "$DATABASE_URL" -f supabase/tests/session_flow.sql
--
--  Walks one whole session from both seats and asserts what each side can see
--  at every step. The four that matter:
--    * a staged question is invisible to the student, and unanswerable
--    * a published question exposes the question and its options — never the key
--    * after submitting, the student cannot learn whether they were right
--    * the teacher's diagnosis is never visible to the student
--
--  Every row must read PASS. Cleans up after itself.
-- ============================================================================

create or replace function public.__flow_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  q1 uuid; q2 uuid; sess uuid; i1 uuid; i2 uuid;
  n int; ok boolean; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'flow.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'flow.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}');

  return query select '0 signup'::text, 'ids issued'::text, 'MALR..-n / BATO..-n'::text,
    (select string_agg(display_id, ' / ' order by role::text) from profiles where id in (t_id,s_id)),
    'INFO'::text;

  -- ============ TEACHER: author two questions, create a session ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  q1 := create_question('english','craft_and_structure',
        'The ______ nature of the tracks makes motocross exciting.',
        'Which choice completes the text?', 'easy'::difficulty_level, null,
        '[{"label":"A","body":"gentle"},{"label":"B","body":"diverse"},
          {"label":"C","body":"ordinary"},{"label":"D","body":"static"}]'::jsonb,
        'B'::answer_option, 'Diverse matches the varied terrains.');
  q2 := create_question('english','information_and_ideas', null,
        'Which choice best states the main purpose?', 'hard'::difficulty_level, null,
        '[{"label":"A","body":"To hint at change"},{"label":"B","body":"To show despondency"}]'::jsonb,
        'A'::answer_option, null);

  insert into sessions (teacher_id, student_id, subject, title, scheduled_at, meeting_url)
  values (t_id, s_id, 'english', 'Diagnostic follow-up', now() - interval '1 minute',
          'https://zoom.us/j/123456789')
  returning id into sess;
  return query select '1 session'::text,'teacher creates it'::text,'created'::text,'created'::text,'PASS'::text;

  -- Two questions of this teacher's own, staged straight onto the session.
  -- A real session loads a level instead (see level_session.sql); what is
  -- being asserted here is what 'staged' and 'published' mean, and two known
  -- questions make the counts below readable.
  insert into session_items (session_id, question_id, student_id, sequence_no)
  values (sess, q1, s_id, 1), (sess, q2, s_id, 2);
  select id into i1 from session_items where session_id=sess and sequence_no=1;
  select id into i2 from session_items where session_id=sess and sequence_no=2;

  select count(*) into n from session_items where session_id = sess and status='staged';
  return query select '2 stage'::text,'two questions queued'::text,'2'::text,n::text,
    (case when n=2 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ STUDENT: staged questions must be invisible ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from session_items;
  return query select '3 staged'::text,'student sees queued items'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from questions;
  return query select '3 staged'::text,'student sees the questions'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  begin perform submit_answer(i1,'B'::answer_option,'{}'::answer_option[],3::smallint,null); ok:=false;
  exception when others then ok:=true; end;
  return query select '3 staged'::text,'student answers before publish'::text,'blocked'::text,
    (case when ok then 'blocked' else 'ALLOWED' end)::text,(case when ok then 'PASS' else 'FAIL' end)::text;

  -- ============ STUDENT opens the session: one question, not two ============
  perform start_session_as_student(sess);

  select count(*) into n from session_items;
  return query select '4 publish'::text,'student sees published item'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from questions;
  return query select '4 publish'::text,'and only that question'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from question_options;
  return query select '4 publish'::text,'with its 4 options'::text,'4'::text,n::text,
    (case when n=4 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from question_keys;
  return query select '4 publish'::text,'but NOT the answer key'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  perform mark_item_viewed(i1);
  perform submit_answer(i1,'A'::answer_option, array['C','D']::answer_option[], 2::smallint,
                        'A felt closest to the wording in line 2.');

  select count(*) into n from session_item_assessments;
  return query select '5 answer'::text,'student sees the grade'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  select revealed_result::text into txt from session_items where id=i1;
  return query select '5 answer'::text,'result withheld pre-reveal'::text,'null'::text,
    coalesce(txt,'null'),(case when txt is null then 'PASS' else 'FAIL' end)::text;

  select coalesce(revealed_correct_option::text,'null') into txt from session_items where id=i1;
  return query select '5 answer'::text,'correct option withheld too'::text,'null'::text,
    txt,(case when txt='null' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ TEACHER sees it land, reveals, diagnoses ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select (a.is_correct::text || ' / elim=' || array_to_string(si.eliminated_options,',')
          || ' / conf=' || si.student_confidence)
    into txt
    from session_item_assessments a join session_items si on si.id=a.session_item_id
   where a.session_item_id=i1;
  return query select '6 teacher'::text,'sees grade, eliminations, confidence'::text,
    'false / elim=C,D / conf=2'::text, txt,
    (case when txt='false / elim=C,D / conf=2' then 'PASS' else 'FAIL' end)::text;

  perform reveal_item(i1);
  perform set_diagnosis(i1,'misread_question','Read "logical" as "shortest".');
  execute 'reset role';

  -- ============ STUDENT sees the outcome only now ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select revealed_result::text || ' | ' || coalesce(revealed_explanation,'-')
    into txt from session_items where id=i1;
  return query select '7 reveal'::text,'student learns result + explanation'::text,
    'incorrect | Diverse matches the varied terrains.'::text, txt,
    (case when txt='incorrect | Diverse matches the varied terrains.' then 'PASS' else 'FAIL' end)::text;

  select coalesce(revealed_correct_option::text,'null') into txt from session_items where id=i1;
  return query select '7 reveal'::text,'and which answer was right'::text,'B'::text,txt,
    (case when txt='B' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_item_assessments;
  return query select '7 reveal'::text,'diagnosis stays teacher-only'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  -- Answering item 1 opened item 2 — that is the loop — so it is readable now
  -- and it is the one thing they are being timed on.
  select status::text into txt from session_items where id=i2;
  return query select '7 reveal'::text,'answering opened item 2'::text,'published'::text,
    coalesce(txt,'hidden'),(case when txt='published' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- cleanup
  delete from sessions where id=sess;
  delete from questions where created_by=t_id;
  delete from auth.users where id in (t_id,s_id);
  delete from display_id_counters;
end $fn$;

select * from public.__flow_check();

drop function public.__flow_check();
