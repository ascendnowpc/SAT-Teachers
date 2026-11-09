-- ============================================================================
--  A question the student types the answer to (0073)
--
--    psql "$DATABASE_URL" -f supabase/tests/typed_answer.sql
--
--  What has to hold:
--
--    * an entry question is written with its accepted answers and no options;
--      one written with both, or with neither, is refused
--    * a key is one kind or the other and never both — the constraint says so
--    * a typed answer closes the question and is marked against the accepted
--      list; the next question comes up, as it does for a choice question
--    * the spellings that are not differences count: spaces, a leading nought,
--      trailing noughts, a comma in a thousand, and a fraction where the key
--      is a decimal
--    * a wrong answer is wrong, and an empty one is refused
--    * the student's payload says which kind the question is and what they
--      typed, and never carries the accepted answers
--    * the reveal names the answer, and only then
--    * a choice question cannot be typed at; the link's token alone types
--      nothing; a question from another session is refused
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

create or replace function public.__typed_answer_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid; q4 uuid; q5 uuid; qc uuid;
  tgt uuid; other uuid;
  key text; link text; okey text;
  i1 uuid; i2 uuid; i3 uuid; i4 uuid; oi uuid;
  j jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ty.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Typed', 'ty.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Tia', 'Typed', pc.id);

  -- ============ 1. writing one ============
  q1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Type 403?', null,
          '[]'::jsonb, null, null, null, 'transitions', null, 'easy', array['403']);
  perform __as(null, 'postgres');
  select (q.answer_kind = 'entry'
          and k.correct_option is null
          and k.accepted = array['403']
          and not exists (select 1 from question_options o where o.question_id = q.id))::text
    into txt from questions q join question_keys k on k.question_id = q.id where q.id = q1;
  return query select '1 writing'::text, 'an entry question: no options, accepted answers, no correct option'::text,
    'true'::text, coalesce(txt, 'null'), __verdict(txt = 'true');

  perform __as(t_id);
  qc := create_question_in_set(pool, 'expression_of_ideas', null, 'Choose one?', null,
          opts, 'A', null, null, 'transitions', null, 'easy');
  perform __as(null, 'postgres');
  select (q.answer_kind = 'choice' and k.correct_option = 'A' and k.accepted is null)::text
    into txt from questions q join question_keys k on k.question_id = q.id where q.id = qc;
  return query select '1 writing'::text, 'a choice question is what it always was'::text,
    'true'::text, coalesce(txt, 'null'), __verdict(txt = 'true');

  perform __as(t_id);
  begin
    perform create_question_in_set(pool, 'expression_of_ideas', null, 'Both?', null,
      opts, 'A', null, null, 'transitions', null, 'easy', array['1']);
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '1 writing'::text, 'options and accepted answers together are refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_question_in_set(pool, 'expression_of_ideas', null, 'Neither?', null,
      '[]'::jsonb, null, null, null, 'transitions', null, 'easy', null);
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '1 writing'::text, 'neither an option nor an accepted answer is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  begin
    update question_keys set accepted = array['9'] where question_id = qc;
    txt := 'allowed';
  exception when others then txt := 'refused'; end;
  return query select '1 writing'::text, 'a key cannot be both kinds at once'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. a test of them ============
  perform __as(t_id);
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Type a half?', null,
          '[]'::jsonb, null, null, null, 'transitions', null, 'medium', array['.5']);
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Type 1100?', null,
          '[]'::jsonb, null, null, null, 'transitions', null, 'hard', array['1100']);
  q4 := create_question_in_set(pool, 'expression_of_ideas', null, 'Type a third?', null,
          '[]'::jsonb, null, null, null, 'transitions', null, 'hard', array['.3333','.3334','1/3']);
  q5 := create_question_in_set(pool, 'expression_of_ideas', null, 'Type 7?', null,
          '[]'::jsonb, null, null, null, 'transitions', null, 'hard', array['7']);
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Typed', 4, array[q1, q2, q3, q4], false, 60, 600);
  other := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Other', 1, array[q5], false, 60, 600);

  perform __as(null, 'postgres');
  select entry_key, access_token into key, link from sessions where id = tgt;
  select entry_key into okey from sessions where id = other;

  perform __as(null, 'anon');
  perform start_session_by_token(key);
  perform start_session_by_token(okey);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt and question_id = q1 and status = 'published';
  select id into oi from session_items where session_id = other and status = 'published';

  perform __as(null, 'anon');
  perform answer_entry_by_token(key, i1, ' 403 ');
  perform __as(null, 'postgres');
  select (si.status = 'answered' and si.entered_answer = '403'
          and si.selected_option is null and a.is_correct)::text
    into txt from session_items si join session_item_assessments a on a.session_item_id = si.id
   where si.id = i1;
  return query select '2 answering'::text, 'a typed answer closes it, is kept and is marked right'::text,
    'true'::text, coalesce(txt, 'null'), __verdict(txt = 'true');

  select id into i2 from session_items where session_id = tgt and question_id = q2 and status = 'published';
  return query select '2 answering'::text, 'and the next question comes up'::text, 'q2 open'::text,
    (case when i2 is not null then 'q2 open' else 'nothing open' end), __verdict(i2 is not null);

  -- ============ 3. the spellings that are not differences ============
  perform __as(null, 'anon');
  perform answer_entry_by_token(key, i2, '1/2');
  perform __as(null, 'postgres');
  select a.is_correct::text into txt from session_item_assessments a where a.session_item_id = i2;
  return query select '3 spelling'::text, 'a fraction where the key is a decimal'::text, 'true'::text,
    coalesce(txt, 'null'), __verdict(txt = 'true');

  select id into i3 from session_items where session_id = tgt and question_id = q3 and status = 'published';
  perform __as(null, 'anon');
  perform answer_entry_by_token(key, i3, '1,100');
  perform __as(null, 'postgres');
  select a.is_correct::text into txt from session_item_assessments a where a.session_item_id = i3;
  return query select '3 spelling'::text, 'a comma in a thousand'::text, 'true'::text,
    coalesce(txt, 'null'), __verdict(txt = 'true');

  return query select '3 spelling'::text, 'a leading and trailing nought, and a wrong answer'::text,
    'true,true,false'::text,
    concat_ws(',', entry_is_right('0.50', array['.5'])::text, entry_is_right('403.0', array['403'])::text,
                   entry_is_right('.3335', array['.3333','.3334','1/3'])::text),
    __verdict(entry_is_right('0.50', array['.5'])
              and entry_is_right('403.0', array['403'])
              and not entry_is_right('.3335', array['.3333','.3334','1/3']));

  -- ============ 4. what the student sees ============
  select id into i4 from session_items where session_id = tgt and question_id = q4 and status = 'published';
  perform __as(null, 'anon');
  begin perform answer_entry_by_token(key, i4, '   '); txt := 'taken';
  exception when others then txt := 'refused'; end;
  return query select '4 student'::text, 'an empty answer is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  j := session_by_token(key);
  select string_agg(e->'question'->>'answer_kind', ',' order by (e->>'sequence_no')::int)
    into txt from jsonb_array_elements(j->'items') e;
  return query select '4 student'::text, 'the payload says which kind each question is'::text,
    'entry,entry,entry,entry'::text, coalesce(txt, 'null'), __verdict(txt = 'entry,entry,entry,entry');

  select string_agg(coalesce(e->>'entered_answer', '-'), ',' order by (e->>'sequence_no')::int)
    into txt from jsonb_array_elements(j->'items') e;
  return query select '4 student'::text, 'and what they typed'::text, '403,1/2,1,100,-'::text,
    coalesce(txt, 'null'), __verdict(txt = '403,1/2,1,100,-');

  return query select '4 student'::text, 'and never the accepted answers'::text, 'absent'::text,
    (case when j::text like '%accepted%' or j::text like '%.3333%' then 'present!' else 'absent' end),
    __verdict(j::text not like '%accepted%' and j::text not like '%.3333%');

  -- ============ 5. the reveal ============
  perform __as(null, 'postgres');
  select coalesce(revealed_answer, '-') into txt from session_items where id = i1;
  return query select '5 reveal'::text, 'before the reveal the answer is not on the item'::text,
    '-'::text, txt, __verdict(txt = '-');
  perform __as(t_id);
  perform reveal_item(i1);
  perform __as(null, 'postgres');
  select coalesce(revealed_answer, '-') into txt from session_items where id = i1;
  return query select '5 reveal'::text, 'and after it, it is'::text, '403'::text, txt, __verdict(txt = '403');

  -- ============ 6. the door ============
  perform __as(null, 'anon');
  begin perform answer_entry_by_token(link, i4, '1/3'); txt := 'taken';
  exception when others then txt := 'refused'; end;
  return query select '6 door'::text, 'the link''s token alone types nothing'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform answer_entry_by_token(key, oi, '7'); txt := 'taken';
  exception when others then txt := 'refused'; end;
  return query select '6 door'::text, 'nor a question from another session'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  begin perform record_entry(i4, '1/3'); txt := 'taken';
  exception when others then txt := 'refused'; end;
  perform __as(null, 'postgres');
  return query select '6 door'::text, 'an entry answer is taken on an entry question'::text, 'taken'::text,
    txt, __verdict(txt = 'taken');

  -- A choice question will not take a typed answer.
  perform __as(null, 'postgres');
  update session_items set status = 'published' where id = oi;
  update questions set answer_kind = 'choice' where id = q5;
  begin perform record_entry(oi, 'A'); txt := 'taken';
  exception when others then txt := 'refused'; end;
  return query select '6 door'::text, 'a choice question will not take a typed answer'::text, 'refused'::text,
    txt, __verdict(txt = 'refused');

  -- ============ 7. grants ============
  return query select '7 grants'::text, 'answer_entry_by_token(text,uuid,text) — the link'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.answer_entry_by_token(text,uuid,text)', 'execute')
          then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.answer_entry_by_token(text,uuid,text)', 'execute'));

  return query select '7 grants'::text, 'record_entry, targeted_enter, entry_is_right — internal'::text,
    'nobody'::text,
    (case when has_function_privilege('anon', 'public.record_entry(uuid,text)', 'execute')
            or has_function_privilege('authenticated', 'public.record_entry(uuid,text)', 'execute')
            or has_function_privilege('anon', 'public.targeted_enter(uuid,uuid,text)', 'execute')
            or has_function_privilege('authenticated', 'public.targeted_enter(uuid,uuid,text)', 'execute')
            or has_function_privilege('anon', 'public.entry_is_right(text,text[])', 'execute')
            or has_function_privilege('authenticated', 'public.entry_is_right(text,text[])', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.record_entry(uuid,text)', 'execute')
              and not has_function_privilege('authenticated', 'public.record_entry(uuid,text)', 'execute')
              and not has_function_privilege('anon', 'public.targeted_enter(uuid,uuid,text)', 'execute')
              and not has_function_privilege('authenticated', 'public.targeted_enter(uuid,uuid,text)', 'execute')
              and not has_function_privilege('anon', 'public.entry_is_right(text,text[])', 'execute')
              and not has_function_privilege('authenticated', 'public.entry_is_right(text,text[])', 'execute'));

  -- Cleanup.
  delete from sessions where id in (tgt, other);
  delete from questions where id in (q1, q2, q3, q4, q5, qc);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__typed_answer_check();

drop function public.__typed_answer_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
