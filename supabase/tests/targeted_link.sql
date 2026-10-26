-- ============================================================================
--  A targeted test runs on the clock (0062)
--
--    psql "$DATABASE_URL" -f supabase/tests/targeted_link.sql
--
--  What has to hold:
--
--  Starting
--    * not before its time; then it opens, the set locks, and question 1 is on
--      screen with the server's first_viewed_at and the test's clock on it —
--      and nothing else is: the next question does not exist yet
--    * the set cannot be changed once it has started
--
--  What the student is sent
--    * exactly the fixed fields: no level, difficulty, rationale, source, key,
--      is_correct or token — and how many questions there are, not which
--
--  Answering and moving on
--    * an answer is graded and the next question comes up
--    * an advance before the time is up moves nothing; after it, the question
--      is timed out (answered, no option, wrong) and the next comes up
--    * an answer up to 2 s late is graded; later than that it is timed out and
--      the call does not fail
--    * a read expires an overdue question and puts the next up
--    * the overall clock ends the test: the question on screen is timed out
--      and the questions never shown are not reached (no row at all)
--
--  Ending early
--    * leaving, or the teacher's End test, sets the question on screen aside
--      (not reached); the teacher's tick expires and never shows a question;
--      another teacher, a student and anon cannot tick or end it
--
--  Doors
--    * the signed-in student's own start and submit refuse a targeted test;
--      advancing a lesson is refused; a lesson's link works as before
--    * Publish results reveals a timed-out question as incorrect
--
--  The grants
--    * internal functions are reachable by nobody; advance_by_token is the
--      link's (anon); targeted_tick is signed-in only
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

create or replace function public.__targeted_link_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher
  x_id  uuid := gen_random_uuid();   -- another teacher
  ad_id uuid := gen_random_uuid();   -- an admin
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid; q4 uuid;
  tgt uuid; tgt2 uuid; tgt3 uuid; lesson uuid;
  tok text; tok2 text; tok3 text; ltok text;
  i1 uuid; i2 uuid; i3 uuid; i4 uuid;
  n int; txt text; ok boolean; j jsonb;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tl.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tl.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tl.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set role = 'admin', is_active = true where id = ad_id;
  update profiles set is_active = true where id in (t_id, x_id);

  pc := create_pc_profile('Pat', 'Linked', 'tl.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Tom', 'Linked', pc.id);

  -- Four questions on one skill, key A on each. In the pool, so the contract
  -- does not depend on what the three tests hold.
  q1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Link one?', null,
          opts, 'A', 'Because one.', null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Link two?', null,
          opts, 'A', 'Because two.', null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Link three?', null,
          opts, 'A', 'Because three.', null, 'transitions', null, 'hard');
  q4 := create_question_in_set(pool, 'expression_of_ideas', null, 'Link four?', null,
          opts, 'A', 'Because four.', null, 'transitions', null, 'hard');

  -- Four questions, 60 s each, ten minutes over all, booked for tomorrow.
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() + interval '1 day', 'Transitions', 4, array[q1, q2, q3, q4], false, 60, 600);
  perform __as(null, 'postgres');
  select access_token into tok from sessions where id = tgt;

  -- ============ 1. starting ============
  perform __as(null, 'anon');
  begin perform start_session_by_token(tok); txt := 'started';
  exception when others then txt := 'refused'; end;
  return query select '1 starting'::text, 'not before its time'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  update sessions set scheduled_at = now() - interval '1 minute' where id = tgt;

  perform __as(null, 'anon');
  n := start_session_by_token(tok);
  return query select '1 starting'::text, 'then it opens, and says how many questions'::text,
    '4'::text, n::text, __verdict(n = 4);

  perform __as(null, 'postgres');
  select (status = 'live' and (select locked_at is not null from targeted_tests where session_id = tgt))::text
    into txt from sessions where id = tgt;
  return query select '1 starting'::text, 'it is live and the set is locked'::text, 'true'::text, txt, __verdict(txt = 'true');

  select count(*) into n from session_items where session_id = tgt;
  select id into i1 from session_items where session_id = tgt and question_id = q1 and status = 'published';
  return query select '1 starting'::text, 'question 1 is on screen, and only question 1 exists'::text,
    '1 row, q1 open'::text, n || ' row' || (case when n = 1 then '' else 's' end) || (case when i1 is not null then ', q1 open' else '' end),
    __verdict(n = 1 and i1 is not null);

  select (first_viewed_at = now() and time_limit_seconds = 60)::text into txt from session_items where id = i1;
  return query select '1 starting'::text, 'with the server''s first_viewed_at and the test''s clock'::text,
    'true'::text, txt, __verdict(txt = 'true');

  perform __as(t_id);
  begin perform save_targeted_set(tgt, 4, array[q1, q2, q3, q4], false, 60, 600); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 starting'::text, 'the set cannot change once it has started'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. the payload ============
  perform __as(null, 'anon');
  j := session_by_token(tok);

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'session') k;
  return query select '2 payload'::text, 'the session is a fixed list'::text,
    'ended_at,id,mode,opened_early_at,scheduled_at,started_at,status,student,subject,teacher,title'::text, txt,
    __verdict(txt = 'ended_at,id,mode,opened_early_at,scheduled_at,started_at,status,student,subject,teacher,title');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0) k;
  return query select '2 payload'::text, 'an item is a fixed list — no is_correct, no question id outside it'::text,
    'answered_at,decided_at,eliminated_options,first_viewed_at,id,question,revealed_correct_option,revealed_explanation,revealed_result,selected_option,sequence_no,status,student_confidence,time_limit_seconds'::text, txt,
    __verdict(txt = 'answered_at,decided_at,eliminated_options,first_viewed_at,id,question,revealed_correct_option,revealed_explanation,revealed_result,selected_option,sequence_no,status,student_confidence,time_limit_seconds');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0->'question') k;
  return query select '2 payload'::text, 'a question carries no level, difficulty, rationale, source or key'::text,
    'id,image_url,options,passage,passage_underline,stem,subject'::text, txt,
    __verdict(txt = 'id,image_url,options,passage,passage_underline,stem,subject');

  ok := position('difficulty' in j::text) = 0 and position('source_ref' in j::text) = 0
        and position('access_token' in j::text) = 0 and position('Because one' in j::text) = 0
        and position('"level"' in j::text) = 0 and position('is_correct' in j::text) = 0;
  return query select '2 payload'::text, 'and none of them appear anywhere in it'::text,
    'true'::text, ok::text, __verdict(ok);

  ok := jsonb_array_length(j->'items') = 1 and (j->'targeted'->>'question_count')::int = 4
        and position('Link two' in j::text) = 0;
  return query select '2 payload'::text, 'how many questions there are, and nothing of the ones to come'::text,
    'true'::text, ok::text, __verdict(ok);

  -- ============ 3. answering and moving on ============
  perform answer_by_token(tok, i1, 'A', '{}', 2::smallint, null);
  perform __as(null, 'postgres');
  select (si.status = 'answered' and a.is_correct and not a.timed_out)::text into txt
    from session_items si join session_item_assessments a on a.session_item_id = si.id where si.id = i1;
  select id into i2 from session_items where session_id = tgt and question_id = q2 and status = 'published';
  return query select '3 moving on'::text, 'an answer is graded and the next question comes up'::text,
    'true, q2 open'::text, coalesce(txt, 'null') || (case when i2 is not null then ', q2 open' else '' end),
    __verdict(txt = 'true' and i2 is not null);

  perform __as(null, 'anon');
  ok := advance_by_token(tok, i2);
  perform __as(null, 'postgres');
  select status::text into txt from session_items where id = i2;
  return query select '3 moving on'::text, 'an advance before the time is up moves nothing'::text,
    'false, published'::text, ok || ', ' || txt, __verdict(not ok and txt = 'published');

  update session_items set first_viewed_at = now() - interval '60 seconds' where id = i2;
  perform __as(null, 'anon');
  ok := advance_by_token(tok, i2);
  perform __as(null, 'postgres');
  select (si.status = 'answered' and si.selected_option is null and not a.is_correct and a.timed_out
          and a.elapsed_seconds = 60)::text into txt
    from session_items si join session_item_assessments a on a.session_item_id = si.id where si.id = i2;
  return query select '3 moving on'::text, 'after it, the question is timed out: no option, wrong, its full time'::text,
    'true, true'::text, ok || ', ' || coalesce(txt, 'null'), __verdict(ok and txt = 'true');

  select id into i3 from session_items where session_id = tgt and question_id = q3 and status = 'published';
  return query select '3 moving on'::text, 'and the next question comes up'::text,
    'q3 open'::text, (case when i3 is not null then 'q3 open' else 'nothing open' end), __verdict(i3 is not null);

  -- One second past its clock: inside the grace.
  update session_items set first_viewed_at = now() - interval '61 seconds' where id = i3;
  perform __as(null, 'anon');
  perform answer_by_token(tok, i3, 'B', '{}', 1::smallint, null);
  perform __as(null, 'postgres');
  select (si.selected_option = 'B' and not a.timed_out)::text into txt
    from session_items si join session_item_assessments a on a.session_item_id = si.id where si.id = i3;
  return query select '3 moving on'::text, 'an answer 1 s late is graded'::text, 'true'::text,
    coalesce(txt, 'null'), __verdict(txt = 'true');

  select id into i4 from session_items where session_id = tgt and question_id = q4 and status = 'published';
  update session_items set first_viewed_at = now() - interval '70 seconds' where id = i4;
  perform __as(null, 'anon');
  begin perform answer_by_token(tok, i4, 'A', '{}', 1::smallint, null); txt := 'returned';
  exception when others then txt := 'failed: ' || sqlerrm; end;
  perform __as(null, 'postgres');
  select txt || ', ' || (si.selected_option is null and a.timed_out)::text into txt
    from session_items si join session_item_assessments a on a.session_item_id = si.id where si.id = i4;
  return query select '3 moving on'::text, 'an answer 10 s late is timed out, and the call does not fail'::text,
    'returned, true'::text, coalesce(txt, 'null'), __verdict(txt = 'returned, true');

  select status::text into txt from sessions where id = tgt;
  return query select '3 moving on'::text, 'the set ran out: the test is over'::text,
    'completed'::text, txt, __verdict(txt = 'completed');

  -- ============ 4. reads expire, and the overall clock ============
  perform __as(t_id);
  tgt2 := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
            now() - interval '1 minute', 'Transitions again', 3, array[q1, q2, q3], true, 60, 600);
  perform __as(null, 'postgres');
  select access_token into tok2 from sessions where id = tgt2;

  perform __as(null, 'anon');
  perform start_session_by_token(tok2);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt2 and status = 'published';
  update session_items set first_viewed_at = now() - interval '5 minutes' where id = i1;

  perform __as(null, 'anon');
  j := session_by_token(tok2);
  perform __as(null, 'postgres');
  select (a.timed_out and a.elapsed_seconds = 60)::text into txt
    from session_item_assessments a where a.session_item_id = i1;
  select count(*) into n from session_items where session_id = tgt2 and status = 'published';
  return query select '4 reads'::text, 'a read times out an overdue question at its own clock, and puts the next up'::text,
    'true, 1 open'::text, coalesce(txt, 'null') || ', ' || n || ' open', __verdict(txt = 'true' and n = 1);

  select (first_viewed_at = now())::text into txt from session_items where session_id = tgt2 and status = 'published';
  return query select '4 reads'::text, 'and the next one''s clock starts as it is shown, not when the last ran out'::text,
    'true'::text, txt, __verdict(txt = 'true');

  update sessions set started_at = now() - interval '11 minutes' where id = tgt2;
  perform __as(null, 'anon');
  j := session_by_token(tok2);
  perform __as(null, 'postgres');
  select status::text into txt from sessions where id = tgt2;
  select count(*) into n from session_item_assessments a join session_items si on si.id = a.session_item_id
   where si.session_id = tgt2 and a.timed_out;
  return query select '4 overall'::text, 'the overall clock ends the test and times out the question on screen'::text,
    'completed, 2 timed out'::text, txt || ', ' || n || ' timed out', __verdict(txt = 'completed' and n = 2);

  select count(*) into n from session_items where session_id = tgt2;
  return query select '4 overall'::text, 'the question never shown is not reached: it has no row'::text,
    '2 rows of 3'::text, n || ' rows of 3', __verdict(n = 2);

  perform __as(null, 'anon');
  begin perform answer_by_token(tok2, i1, 'A', '{}', 1::smallint, null); txt := 'answered';
  exception when others then txt := 'refused'; end;
  perform __as(null, 'postgres');
  select txt || ', ' || (selected_option is null)::text into txt from session_items where id = i1;
  return query select '4 overall'::text, 'nothing is answered after it'::text,
    'answered, true'::text, txt, __verdict(txt like '%, true');

  -- ============ 5. ending early ============
  perform __as(t_id);
  tgt3 := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
            now() - interval '1 minute', 'Transitions, ended', 3, array[q1, q2, q3], true, 60, 600);
  perform __as(null, 'postgres');
  select access_token into tok3 from sessions where id = tgt3;
  perform __as(null, 'anon');
  perform start_session_by_token(tok3);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt3 and status = 'published';

  perform __as(x_id);
  begin perform targeted_tick(tgt3); txt := 'ticked';
  exception when others then txt := 'refused'; end;
  return query select '5 ending'::text, 'another teacher cannot tick it'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform teacher_finish_session(tgt3); txt := 'ended';
  exception when others then txt := 'refused'; end;
  return query select '5 ending'::text, 'nor end it'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  begin perform targeted_tick(tgt3); txt := 'ticked';
  exception when others then txt := 'refused'; end;
  return query select '5 ending'::text, 'nor can the student'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'anon');
  begin perform targeted_tick(tgt3); txt := 'ticked';
  exception when others then txt := 'refused'; end;
  return query select '5 ending'::text, 'nor anon'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  update session_items set first_viewed_at = now() - interval '2 minutes' where id = i1;
  perform __as(ad_id);
  txt := targeted_tick(tgt3);
  perform __as(null, 'postgres');
  select txt || ', ' || (select a.timed_out::text from session_item_assessments a where a.session_item_id = i1)
         || ', ' || (select count(*) from session_items where session_id = tgt3 and status = 'published') || ' open'
    into txt;
  return query select '5 ending'::text, 'an admin''s tick times out the overdue question and shows nothing'::text,
    'live, true, 0 open'::text, txt, __verdict(txt = 'live, true, 0 open');

  perform __as(null, 'anon');
  j := session_by_token(tok3);
  perform __as(null, 'postgres');
  select id into i2 from session_items where session_id = tgt3 and status = 'published';
  return query select '5 ending'::text, 'the student''s next read puts the next question up'::text,
    'open'::text, (case when i2 is not null then 'open' else 'nothing' end), __verdict(i2 is not null);

  perform __as(t_id);
  perform teacher_finish_session(tgt3);
  perform __as(null, 'postgres');
  select (select status::text from sessions where id = tgt3) || ', ' || (select status::text from session_items where id = i2)
    into txt;
  return query select '5 ending'::text, 'End test sets the question on screen aside: not reached'::text,
    'completed, voided'::text, txt, __verdict(txt = 'completed, voided');

  -- Leaving, on the second test of the day: book, start, leave.
  perform __as(t_id);
  tgt3 := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
            now() - interval '1 minute', 'Transitions, left', 2, array[q1, q2], true, 60, 600);
  perform __as(null, 'postgres');
  select access_token into tok3 from sessions where id = tgt3;
  perform __as(null, 'anon');
  perform start_session_by_token(tok3);
  perform finish_by_token(tok3);
  perform __as(null, 'postgres');
  select (select status::text from sessions where id = tgt3) || ', '
         || (select string_agg(status::text, ',') from session_items where session_id = tgt3)
    into txt;
  return query select '5 ending'::text, 'leaving ends it and sets the question on screen aside'::text,
    'completed, voided'::text, txt, __verdict(txt = 'completed, voided');

  -- ============ 6. doors ============
  perform __as(t_id);
  tgt3 := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
            now() - interval '1 minute', 'Transitions, doors', 2, array[q1, q2], true, 60, 600);
  perform __as(stu.id);
  begin perform start_session_as_student(tgt3); txt := 'started';
  exception when others then txt := 'refused'; end;
  return query select '6 doors'::text, 'the signed-in student''s Start refuses a targeted test'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  select access_token into tok3 from sessions where id = tgt3;
  perform __as(null, 'anon');
  perform start_session_by_token(tok3);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt3 and status = 'published';
  perform __as(stu.id);
  begin perform submit_answer(i1, 'A', '{}', 1::smallint, null); txt := 'answered';
  exception when others then txt := 'refused'; end;
  return query select '6 doors'::text, 'and so does their submit'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(t_id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, stu.id, 'english', now() - interval '1 minute') returning id, access_token into lesson, ltok;
  perform __as(null, 'anon');
  perform start_session_by_token(ltok);
  perform __as(null, 'postgres');
  select (status = 'live')::text || ', ' || (select count(*) from session_items where session_id = lesson) || ' items'
    into txt from sessions where id = lesson;
  return query select '6 doors'::text, 'a lesson''s link opens as before, with nothing on screen'::text,
    'true, 0 items'::text, txt, __verdict(txt = 'true, 0 items');

  perform __as(null, 'anon');
  begin perform advance_by_token(ltok, i1); txt := 'advanced';
  exception when others then txt := 'refused'; end;
  return query select '6 doors'::text, 'a lesson does not advance by itself'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin perform advance_by_token(tok3, i3); txt := 'advanced';
  exception when others then txt := 'refused'; end;
  return query select '6 doors'::text, 'nor does a link reach another session''s question'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- Publish results on the first test: q2 and q4 timed out.
  perform __as(t_id);
  perform reveal_answered_items(tgt);
  perform __as(null, 'postgres');
  select string_agg(coalesce(revealed_result::text, '-'), ',' order by sequence_no) into txt
    from session_items where session_id = tgt;
  return query select '6 doors'::text, 'Publish results reveals a timed-out question as incorrect'::text,
    'correct,incorrect,incorrect,incorrect'::text, txt, __verdict(txt = 'correct,incorrect,incorrect,incorrect');

  -- ============ 7. grants ============
  for txt in select unnest(array['targeted_lock(uuid)',
                                 'targeted_time_out(uuid,timestamptz)',
                                 'targeted_expire(uuid,interval)',
                                 'targeted_show_next(uuid)',
                                 'targeted_step(uuid,interval)',
                                 'targeted_start(uuid)',
                                 'targeted_answer(uuid,uuid,answer_option,answer_option[],smallint,text)',
                                 'targeted_payload(uuid)'])
  loop
    return query select '7 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'reachable' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  return query select '7 grants'::text, 'advance_by_token(text,uuid) — the link'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.advance_by_token(text,uuid)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.advance_by_token(text,uuid)', 'execute'));

  return query select '7 grants'::text, 'targeted_tick(uuid) — signed in only'::text, 'authenticated'::text,
    (case when has_function_privilege('anon', 'public.targeted_tick(uuid)', 'execute') then 'anon too!'
          when has_function_privilege('authenticated', 'public.targeted_tick(uuid)', 'execute') then 'authenticated'
          else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.targeted_tick(uuid)', 'execute')
              and has_function_privilege('authenticated', 'public.targeted_tick(uuid)', 'execute'));

  -- Cleanup.
  delete from sessions where student_id = stu.id;
  delete from questions where id in (q1, q2, q3, q4);
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, pc.id);
  delete from auth.users where id in (t_id, x_id, ad_id);
end $fn$;

select * from public.__targeted_link_check();

drop function public.__targeted_link_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
