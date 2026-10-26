-- ============================================================================
--  A student's progress, in numbers (0063)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_progress.sql
--
--  What has to hold:
--
--  Who reads it
--    * any teacher and an admin, across every teacher's sessions with the
--      student; the student's own PC; not another PC, not a suspended PC, not
--      the student, not anon
--
--  What it says
--    * numbers and ids only: an item carries no option chosen and no key
--    * a question still on screen is not in it; a cancelled session and the
--      other subject are not in it
--    * a timed-out question says so
--
--  Drafts
--    * a summary or an override that was never shared is not in it; once
--      shared, the shared copy is — and an edit after sharing is not
--
--  The grants
--    * signed-in only
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

create or replace function public.__progress_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher
  x_id  uuid := gen_random_uuid();   -- another teacher, who also taught the student
  ad_id uuid := gen_random_uuid();   -- an admin
  pc    profiles;
  pc2   profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid;
  mine uuid; theirs uuid; gone uuid; maths uuid; tgt uuid;
  i1 uuid; i2 uuid; i3 uuid;
  j jsonb; n int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'sp.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'sp.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'sp.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set role = 'admin', is_active = true where id = ad_id;
  update profiles set is_active = true where id in (t_id, x_id);

  pc  := create_pc_profile('Pat', 'Progress', 'sp.pc@example.test');
  pc2 := create_pc_profile('Pia', 'Elsewhere', 'sp.pc2@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Sia', 'Progress', pc.id);
  q1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Progress one?', null,
          opts, 'A', null, null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Progress two?', null,
          opts, 'A', null, null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Progress three?', null,
          opts, 'A', null, null, 'transitions', null, 'hard');

  -- The teacher's diagnostic, another teacher's lesson, a cancelled session,
  -- a mathematics session, and a targeted test.
  perform __as(null, 'postgres');
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, mode)
  values (t_id, stu.id, 'english', now() - interval '20 days', 'completed', 'diagnostic') returning id into mine;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (x_id, stu.id, 'english', now() - interval '10 days', 'completed') returning id into theirs;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, stu.id, 'english', now() - interval '5 days', 'cancelled') returning id into gone;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, stu.id, 'mathematics', now() - interval '5 days', 'completed') returning id into maths;

  insert into session_items (session_id, question_id, student_id, sequence_no, status, selected_option)
  values (mine, q1, stu.id, 1, 'answered', 'A') returning id into i1;
  insert into session_items (session_id, question_id, student_id, sequence_no, status, selected_option)
  values (theirs, q2, stu.id, 1, 'answered', 'B') returning id into i2;
  insert into session_items (session_id, question_id, student_id, sequence_no, status)
  values (theirs, q3, stu.id, 2, 'published') returning id into i3;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (i1, true, 30), (i2, false, 50);

  perform __as(t_id);
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 day', 'Transitions', 3, array[q1, q2, q3], true, 60, 600);
  perform __as(null, 'postgres');
  insert into session_items (session_id, question_id, student_id, sequence_no, status, time_limit_seconds)
  values (tgt, q1, stu.id, 1, 'answered', 60) returning id into i1;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds, timed_out)
  values (i1, false, 60, true);
  update sessions set status = 'completed' where id = tgt;

  -- ============ 1. who reads it ============
  perform __as(t_id);
  j := student_progress(stu.id, 'english');
  n := jsonb_array_length(j->'sessions');
  return query select '1 readers'::text, 'the teacher reads every teacher''s sessions with the student'::text,
    '3'::text, n::text, __verdict(n = 3);

  select count(*) into n from jsonb_array_elements(j->'sessions') s where s->>'teacher' = 'Sam Otter';
  return query select '1 readers'::text, 'the other teacher''s lesson among them, with their name'::text,
    '1'::text, n::text, __verdict(n = 1);

  perform __as(x_id);
  n := jsonb_array_length(student_progress(stu.id, 'english')->'sessions');
  return query select '1 readers'::text, 'so does the other teacher'::text, '3'::text, n::text, __verdict(n = 3);

  perform __as(ad_id);
  n := jsonb_array_length(student_progress(stu.id, 'english')->'sessions');
  return query select '1 readers'::text, 'and an admin'::text, '3'::text, n::text, __verdict(n = 3);

  perform __as(pc.id);
  n := jsonb_array_length(student_progress(stu.id, 'english')->'sessions');
  return query select '1 readers'::text, 'the student''s PC reads it'::text, '3'::text, n::text, __verdict(n = 3);

  perform __as(pc2.id);
  begin perform student_progress(stu.id, 'english'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 readers'::text, 'another PC does not'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  begin perform student_progress(stu.id, 'english'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 readers'::text, 'nor the student'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'anon');
  begin perform student_progress(stu.id, 'english'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 readers'::text, 'nor anon'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  update profiles set is_active = false where id = pc.id;
  perform __as(pc.id);
  begin perform student_progress(stu.id, 'english'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 readers'::text, 'nor a suspended PC'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(null, 'postgres');
  update profiles set is_active = true where id = pc.id;

  perform __as(gen_random_uuid(), 'service_role');
  n := jsonb_array_length(student_progress(stu.id, 'english')->'sessions');
  return query select '1 readers'::text, 'the service role reads it, for the PDF the PC is emailed'::text,
    '3'::text, n::text, __verdict(n = 3);

  -- ============ 2. what it says ============
  perform __as(pc.id);
  j := student_progress(stu.id, 'english');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0) k;
  return query select '2 contents'::text, 'an item is numbers and ids: no option, no key'::text,
    'difficulty,elapsed_seconds,is_correct,question_id,section,session_id,skill,status,target_seconds,time_limit_seconds,timed_out'::text,
    txt, __verdict(txt = 'difficulty,elapsed_seconds,is_correct,question_id,section,session_id,skill,status,target_seconds,time_limit_seconds,timed_out');

  return query select '2 contents'::text, 'nor anywhere in it'::text, 'true'::text,
    (position('selected_option' in j::text) = 0 and position('correct_option' in j::text) = 0
     and position('Progress one' in j::text) = 0)::text,
    __verdict(position('selected_option' in j::text) = 0 and position('correct_option' in j::text) = 0
              and position('Progress one' in j::text) = 0);

  select count(*) into n from jsonb_array_elements(j->'items') i where (i->>'question_id')::uuid = q3;
  return query select '2 contents'::text, 'a question still on screen is not in it'::text, '0'::text, n::text, __verdict(n = 0);

  select count(*) into n from jsonb_array_elements(j->'sessions') s where (s->>'id')::uuid in (gone, maths);
  return query select '2 contents'::text, 'nor a cancelled session, nor the other subject'::text, '0'::text, n::text, __verdict(n = 0);

  select (i->>'timed_out') into txt from jsonb_array_elements(j->'items') i where (i->>'session_id')::uuid = tgt;
  return query select '2 contents'::text, 'a timed-out question says so'::text, 'true'::text, txt, __verdict(txt = 'true');

  select (t->>'set_count') || '/' || (t->>'skill') into txt from jsonb_array_elements(j->'targeted') t;
  return query select '2 contents'::text, 'the targeted test: its skill and how many its set held'::text,
    '3/transitions'::text, txt, __verdict(txt = '3/transitions');

  txt := j->'config'->>'long_words';
  return query select '2 contents'::text, 'and the subject''s config'::text, '75'::text, txt, __verdict(txt = '75');

  -- ============ 3. drafts ============
  perform __as(t_id);
  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'Draft words.');
  perform save_verdict_override(tgt, mine, 'Draft wording.', 'Draft context.');
  perform __as(pc.id);
  j := student_progress(stu.id, 'english');
  return query select '3 drafts'::text, 'a summary and an override never shared are not in it'::text,
    '0, 0, absent'::text,
    jsonb_array_length(j->'summaries') || ', ' || jsonb_array_length(j->'overrides') || ', '
      || (case when position('Draft' in j::text) = 0 then 'absent' else 'present' end),
    __verdict(jsonb_array_length(j->'summaries') = 0 and jsonb_array_length(j->'overrides') = 0
              and position('Draft' in j::text) = 0);

  perform __as(t_id);
  perform share_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', true);
  perform share_verdict_override(tgt, true);
  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'Later words.');
  perform save_verdict_override(tgt, mine, 'Later wording.', '');
  perform __as(pc.id);
  j := student_progress(stu.id, 'english');
  return query select '3 drafts'::text, 'once shared, the shared copy is in it'::text,
    'Draft words. / Draft wording.'::text,
    (j->'summaries'->0->>'shared') || ' / ' || (j->'overrides'->0->>'shared_wording'),
    __verdict((j->'summaries'->0->>'shared') = 'Draft words.' and (j->'overrides'->0->>'shared_wording') = 'Draft wording.');

  return query select '3 drafts'::text, 'and an edit after sharing is not'::text, 'absent'::text,
    (case when position('Later' in j::text) = 0 then 'absent' else 'present' end),
    __verdict(position('Later' in j::text) = 0);

  -- ============ 4. grants ============
  perform __as(null, 'postgres');
  return query select '4 grants'::text, 'student_progress(uuid,text) — signed in only'::text, 'authenticated'::text,
    (case when has_function_privilege('anon', 'public.student_progress(uuid,text)', 'execute') then 'anon too!'
          when has_function_privilege('authenticated', 'public.student_progress(uuid,text)', 'execute') then 'authenticated'
          else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.student_progress(uuid,text)', 'execute')
              and has_function_privilege('authenticated', 'public.student_progress(uuid,text)', 'execute'));

  -- Cleanup.
  delete from sessions where student_id = stu.id;
  delete from skill_summaries where student_id = stu.id;
  delete from questions where id in (q1, q2, q3);
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, x_id, ad_id);
end $fn$;

select * from public.__progress_check();

drop function public.__progress_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
