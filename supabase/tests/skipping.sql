-- ============================================================================
--  A question can be skipped (0072)
--
--    psql "$DATABASE_URL" -f supabase/tests/skipping.sql
--
--  What has to hold:
--
--    * a skip closes the question on screen with no option, wrong, marked
--      skipped and not timed out, and puts the next one up
--    * a second press on a question already skipped does not skip the next
--    * a time-out stays a time-out, not a skip
--    * the student's payload says which items they skipped; the score counts
--      skips and time-outs apart
--    * a lesson has no skip; the link's token alone cannot skip; a question
--      from another session cannot be skipped
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

create or replace function public.__skipping_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid; q4 uuid;
  tgt uuid; other uuid; lesson uuid;
  key text; link text; okey text; lkey text;
  i1 uuid; i2 uuid; i3 uuid; oi uuid;
  j jsonb; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'sk.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Skip', 'sk.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Sia', 'Skip', pc.id);
  q1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Skip one?', null, opts, 'A', null, null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Skip two?', null, opts, 'A', null, null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Skip three?', null, opts, 'A', null, null, 'transitions', null, 'hard');
  q4 := create_question_in_set(pool, 'expression_of_ideas', null, 'Skip four?', null, opts, 'A', null, null, 'transitions', null, 'hard');
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Transitions', 3, array[q1, q2, q3], false, 60, 600);
  other := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() - interval '1 minute', 'Other', 1, array[q4], false, 60, 600);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode)
  values (t_id, stu.id, 'english', now() - interval '1 minute', 'diagnostic') returning id into lesson;

  perform __as(null, 'postgres');
  select entry_key, access_token into key, link from sessions where id = tgt;
  select entry_key into okey from sessions where id = other;
  select entry_key into lkey from sessions where id = lesson;

  perform __as(null, 'anon');
  perform start_session_by_token(key);
  perform start_session_by_token(okey);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt and question_id = q1 and status = 'published';
  select id into oi from session_items where session_id = other and status = 'published';

  -- ============ 1. a skip ============
  perform __as(null, 'anon');
  perform skip_by_token(key, i1);
  perform __as(null, 'postgres');
  select (si.status = 'answered' and si.selected_option is null and not a.is_correct and a.skipped and not a.timed_out)::text
    into txt from session_items si join session_item_assessments a on a.session_item_id = si.id where si.id = i1;
  return query select '1 skip'::text, 'closes it: no option, wrong, skipped, not timed out'::text, 'true'::text,
    coalesce(txt, 'null'), __verdict(txt = 'true');
  select id into i2 from session_items where session_id = tgt and question_id = q2 and status = 'published';
  return query select '1 skip'::text, 'and the next question comes up'::text, 'q2 open'::text,
    (case when i2 is not null then 'q2 open' else 'nothing open' end), __verdict(i2 is not null);

  perform __as(null, 'anon');
  perform skip_by_token(key, i1);
  perform __as(null, 'postgres');
  select status::text into txt from session_items where id = i2;
  return query select '1 skip'::text, 'a second press on it does not skip the next'::text, 'published'::text,
    coalesce(txt, 'null'), __verdict(txt = 'published');

  -- ============ 2. a time-out is not a skip ============
  perform __as(null, 'anon');
  perform answer_by_token(key, i2, 'A', '{}', 2::smallint, null);
  perform __as(null, 'postgres');
  select id into i3 from session_items where session_id = tgt and question_id = q3 and status = 'published';
  update session_items set first_viewed_at = now() - interval '60 seconds' where id = i3;
  perform __as(null, 'anon');
  perform advance_by_token(key, i3);
  perform __as(null, 'postgres');
  select (a.timed_out and not a.skipped)::text into txt from session_item_assessments a where a.session_item_id = i3;
  return query select '2 time-out'::text, 'a time-out stays a time-out'::text, 'true'::text, coalesce(txt, 'null'),
    __verdict(txt = 'true');

  -- ============ 3. what the student sees ============
  perform __as(null, 'anon');
  j := session_by_token(key);
  select string_agg((e->>'skipped'), ',' order by (e->>'sequence_no')::int) into txt from jsonb_array_elements(j->'items') e;
  return query select '3 student'::text, 'the payload says which they skipped'::text, 'true,false,false'::text,
    coalesce(txt, 'null'), __verdict(txt = 'true,false,false');
  j := targeted_result_by_token(key);
  return query select '3 student'::text, 'the score counts skips and time-outs apart'::text,
    '1 of 3; 1 skipped; 1 timed out'::text,
    coalesce((j->>'right') || ' of ' || (j->>'reached') || '; ' || (j->>'skipped') || ' skipped; ' || (j->>'timed_out') || ' timed out', 'null'),
    __verdict((j->>'right')::int = 1 and (j->>'reached')::int = 3 and (j->>'skipped')::int = 1 and (j->>'timed_out')::int = 1);

  -- ============ 4. where it does not reach ============
  begin perform skip_by_token(lkey, gen_random_uuid()); txt := 'skipped';
  exception when others then txt := 'refused'; end;
  return query select '4 door'::text, 'a lesson has no skip'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform skip_by_token(link, oi); txt := 'skipped';
  exception when others then txt := 'refused'; end;
  return query select '4 door'::text, 'the link''s token alone cannot skip'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform skip_by_token(key, oi); txt := 'skipped';
  exception when others then txt := 'refused'; end;
  return query select '4 door'::text, 'nor a question from another session'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(null, 'postgres');
  select status::text into txt from session_items where id = oi;
  return query select '4 door'::text, 'which is still open'::text, 'published'::text, coalesce(txt, 'null'), __verdict(txt = 'published');

  -- ============ 5. grants ============
  return query select '5 grants'::text, 'skip_by_token(text,uuid) — the link'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.skip_by_token(text,uuid)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.skip_by_token(text,uuid)', 'execute'));
  return query select '5 grants'::text, 'targeted_skip(uuid,uuid) — internal'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.targeted_skip(uuid,uuid)', 'execute')
            or has_function_privilege('authenticated', 'public.targeted_skip(uuid,uuid)', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.targeted_skip(uuid,uuid)', 'execute')
              and not has_function_privilege('authenticated', 'public.targeted_skip(uuid,uuid)', 'execute'));

  -- Cleanup.
  delete from sessions where id in (tgt, other, lesson);
  delete from questions where id in (q1, q2, q3, q4);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__skipping_check();

drop function public.__skipping_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
