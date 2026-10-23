-- ============================================================================
--  The link sends a fixed list (0064)
--
--    psql "$DATABASE_URL" -f supabase/tests/link_payload.sql
--
--  What has to hold, for a lesson on its link:
--
--    * the session, an item, a question and an option are each exactly the
--      named fields — nothing a later column could slip in
--    * none of the level, the tests sat, the teacher's notes, the token, the
--      key, is_correct, a question's difficulty, rationale, source, section,
--      skill or target appear anywhere in it
--    * a staged question is not in it; a question on screen is, with its
--      options; the result, the right option and the explanation are null
--      until the teacher publishes the results, and there once they do
--    * anon reads it with the token and nothing without one
--    * a targeted test still gets its own payload (0062)
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

create or replace function public.__link_payload_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid;
  lesson uuid; tgt uuid; tok text; ttok text;
  i1 uuid; i2 uuid;
  j jsonb; txt text; ok boolean;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'lp.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Payload', 'lp.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Lia', 'Payload', pc.id);
  q1 := create_question_in_set(pool, 'expression_of_ideas', 'Passage one.', 'Payload one?', 'RATIONALE-TEXT',
          opts, 'A', 'EXPLANATION-ONE', null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Payload two?', null,
          opts, 'B', 'EXPLANATION-TWO', null, 'transitions', null, 'hard');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'STAGED-STEM?', null,
          opts, 'A', null, null, 'transitions', null, 'medium');

  insert into sessions (teacher_id, student_id, subject, scheduled_at, teacher_notes)
  values (t_id, stu.id, 'english', now() - interval '1 minute', 'PRIVATE-NOTES')
  returning id, access_token into lesson, tok;

  perform __as(null, 'postgres');
  update sessions set status = 'live', started_at = now(), level = 'hard', levels_sat = '{easy,hard}' where id = lesson;
  update questions set source_ref = 'SOURCE-REF-LP', target_seconds = 77 where id = q1;
  insert into session_items (session_id, question_id, student_id, sequence_no, status, asked_no, published_at, selected_option)
  values (lesson, q1, stu.id, 1, 'answered', 1, now(), 'A') returning id into i1;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds) values (i1, true, 40);
  insert into session_items (session_id, question_id, student_id, sequence_no, status, asked_no, published_at)
  values (lesson, q2, stu.id, 2, 'published', 2, now()) returning id into i2;
  insert into session_items (session_id, question_id, student_id, sequence_no, status)
  values (lesson, q3, stu.id, 3, 'staged');

  -- ============ 1. the fields ============
  perform __as(null, 'anon');
  j := session_by_token(tok);

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j) k;
  return query select '1 fields'::text, 'the payload is a session and its items'::text,
    'items,session'::text, txt, __verdict(txt = 'items,session');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'session') k;
  return query select '1 fields'::text, 'the session is a fixed list'::text,
    'answered_count,duration_mins,ended_at,id,meeting_url,mode,opened_early_at,question_count,scheduled_at,started_at,status,student,subject,teacher,title'::text,
    txt, __verdict(txt = 'answered_count,duration_mins,ended_at,id,meeting_url,mode,opened_early_at,question_count,scheduled_at,started_at,status,student,subject,teacher,title');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'session'->'student') k;
  return query select '1 fields'::text, 'the student is a name and a display id'::text,
    'display_id,full_name'::text, txt, __verdict(txt = 'display_id,full_name');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0) k;
  return query select '1 fields'::text, 'an item is a fixed list'::text,
    'answered_at,asked_no,decided_at,eliminated_options,first_viewed_at,id,published_at,questions,revealed_at,revealed_correct_option,revealed_explanation,revealed_result,selected_option,sequence_no,session_id,status,student_confidence'::text,
    txt, __verdict(txt = 'answered_at,asked_no,decided_at,eliminated_options,first_viewed_at,id,published_at,questions,revealed_at,revealed_correct_option,revealed_explanation,revealed_result,selected_option,sequence_no,session_id,status,student_confidence');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0->'questions') k;
  return query select '1 fields'::text, 'a question is a fixed list'::text,
    'id,image_url,passage,passage_underline,question_options,stem,subject'::text, txt,
    __verdict(txt = 'id,image_url,passage,passage_underline,question_options,stem,subject');

  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(j->'items'->0->'questions'->'question_options'->0) k;
  return query select '1 fields'::text, 'an option is its id, label and body'::text,
    'body,id,label'::text, txt, __verdict(txt = 'body,id,label');

  -- ============ 2. what is not in it ============
  for txt in select unnest(array['"level"', 'levels_sat', 'level_size', 'teacher_notes', 'PRIVATE-NOTES',
                                 'access_token', '"correct_option"', 'is_correct', 'difficulty',
                                 'RATIONALE-TEXT', 'SOURCE-REF-LP', 'source_ref', '"section"', '"skill"',
                                 'target_seconds', 'created_by', 'student_reasoning', 'teacher_id', 'student_id',
                                 'EXPLANATION-ONE', 'STAGED-STEM'])
  loop
    return query select '2 absent'::text, txt || ' — nowhere in it', 'absent'::text,
      (case when position(txt in j::text) = 0 then 'absent' else 'present' end),
      __verdict(position(txt in j::text) = 0);
  end loop;

  -- ============ 3. the questions ============
  ok := jsonb_array_length(j->'items') = 2
        and (j->'items'->1->>'status') = 'published'
        and jsonb_array_length(j->'items'->1->'questions'->'question_options') = 2;
  return query select '3 questions'::text, 'the one on screen is there with its options, the staged one is not'::text,
    'true'::text, ok::text, __verdict(ok);

  ok := (j->'items'->0->>'revealed_result') is null and (j->'items'->0->>'revealed_correct_option') is null;
  return query select '3 questions'::text, 'no result before the results are published'::text,
    'true'::text, ok::text, __verdict(ok);

  perform __as(t_id);
  perform reveal_answered_items(lesson);
  perform __as(null, 'anon');
  j := session_by_token(tok);
  txt := (j->'items'->0->>'revealed_result') || ', ' || (j->'items'->0->>'revealed_correct_option') || ', '
         || (j->'items'->0->>'revealed_explanation');
  return query select '3 questions'::text, 'and the result, the right option and the explanation after'::text,
    'correct, A, EXPLANATION-ONE'::text, txt, __verdict(txt = 'correct, A, EXPLANATION-ONE');

  -- ============ 4. the door ============
  begin perform session_by_token('not-a-token'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '4 door'::text, 'nothing without the token'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(t_id);
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Transitions', 1, array[q2], true, 60, 600);
  perform __as(null, 'postgres');
  select access_token into ttok from sessions where id = tgt;
  perform __as(null, 'anon');
  j := session_by_token(ttok);
  return query select '4 door'::text, 'a targeted test still gets its own payload'::text,
    'true'::text, (j ? 'targeted')::text, __verdict(j ? 'targeted');

  -- Cleanup.
  perform __as(null, 'postgres');
  delete from sessions where student_id = stu.id;
  delete from questions where id in (q1, q2, q3);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__link_payload_check();

drop function public.__link_payload_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
