-- ============================================================================
--  A targeted test's score comes straight after it (0068)
--
--    psql "$DATABASE_URL" -f supabase/tests/targeted_result.sql
--
--  What has to hold:
--
--    * mid-test there is no score: null
--    * once over, the score is right out of reached — a timed-out question is
--      reached and wrong, one never shown is not reached — and the same per
--      skill, weakest first
--    * it is those numbers only: no question, option, key or level
--    * the link's token alone reads nothing; a lesson has no such score
--    * the student's own page (0067) carries the score of a finished
--      targeted test, and none on a lesson
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

create or replace function public.__targeted_result_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  q1 uuid; q2 uuid; q3 uuid; q4 uuid;
  tgt uuid; lesson uuid;
  key text; link text; lkey text;
  i1 uuid; i2 uuid; i3 uuid;
  r jsonb; home jsonb; txt text; pin text; skey text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'tr.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Result', 'tr.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Ria', 'Result', pc.id);

  -- Two skills in one section, key A on each.
  q1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Result one?', null,
          opts, 'A', 'Because one.', null, 'transitions', null, 'easy');
  q2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Result two?', null,
          opts, 'A', 'Because two.', null, 'transitions', null, 'medium');
  q3 := create_question_in_set(pool, 'expression_of_ideas', null, 'Result three?', null,
          opts, 'A', 'Because three.', null, 'rhetorical_synthesis', null, 'medium');
  q4 := create_question_in_set(pool, 'expression_of_ideas', null, 'Result four?', null,
          opts, 'A', 'Because four.', null, 'rhetorical_synthesis', null, 'hard');

  -- The whole section, four questions, 60 s each.
  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', null,
           now() - interval '1 minute', 'Expression of Ideas', 4, array[q1, q2, q3, q4], false, 60, 600);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode)
  values (t_id, stu.id, 'english', now() - interval '1 minute', 'diagnostic') returning id into lesson;

  perform __as(null, 'postgres');
  select entry_key, access_token into key, link from sessions where id = tgt;
  select entry_key into lkey from sessions where id = lesson;

  -- ============ 1. mid-test ============
  perform __as(null, 'anon');
  perform start_session_by_token(key);
  perform __as(null, 'postgres');
  select id into i1 from session_items where session_id = tgt and question_id = q1 and status = 'published';
  perform __as(null, 'anon');
  perform answer_by_token(key, i1, 'A', '{}', 2::smallint, null);         -- right
  r := targeted_result_by_token(key);
  return query select '1 mid-test'::text, 'there is no score while it runs'::text, 'null'::text,
    coalesce(r::text, 'null'), __verdict(r is null);

  perform __as(null, 'postgres');
  select id into i2 from session_items where session_id = tgt and question_id = q2 and status = 'published';
  perform __as(null, 'anon');
  perform answer_by_token(key, i2, 'B', '{}', 2::smallint, null);         -- wrong
  perform __as(null, 'postgres');
  select id into i3 from session_items where session_id = tgt and question_id = q3 and status = 'published';
  update session_items set first_viewed_at = now() - interval '60 seconds' where id = i3;
  perform __as(null, 'anon');
  perform advance_by_token(key, i3);                                      -- timed out
  perform finish_by_token(key);                                           -- q4 on screen: not reached

  -- ============ 2. the score ============
  r := targeted_result_by_token(key);
  return query select '2 score'::text, 'right out of reached'::text, '1 of 3'::text,
    coalesce((r->>'right') || ' of ' || (r->>'reached'), 'null'),
    __verdict((r->>'right')::int = 1 and (r->>'reached')::int = 3);
  return query select '2 score'::text, 'a timed-out question is reached and wrong'::text, '1'::text,
    coalesce(r->>'timed_out', 'null'), __verdict((r->>'timed_out')::int = 1);
  return query select '2 score'::text, 'the one left on screen is not reached'::text, '1'::text,
    coalesce(r->>'not_reached', 'null'), __verdict((r->>'not_reached')::int = 1);

  select string_agg((s->>'skill') || ' ' || (s->>'right') || '/' || (s->>'of'), ', ' order by ord)
    into txt from jsonb_array_elements(r->'skills') with ordinality as e(s, ord);
  return query select '2 score'::text, 'per skill, weakest first'::text,
    'rhetorical_synthesis 0/1, transitions 1/2'::text, coalesce(txt, 'null'),
    __verdict(txt = 'rhetorical_synthesis 0/1, transitions 1/2');

  -- ============ 3. nothing more ============
  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(r) k;
  return query select '3 only'::text, 'the result is its numbers'::text,
    'not_reached,reached,right,skills,timed_out'::text, txt,
    __verdict(txt = 'not_reached,reached,right,skills,timed_out');
  select string_agg(k, ',' order by k) into txt from jsonb_object_keys(r->'skills'->0) k;
  return query select '3 only'::text, 'a skill is its name and counts'::text,
    'of,right,section,skill'::text, txt, __verdict(txt = 'of,right,section,skill');
  txt := r::text;
  return query select '3 only'::text, 'no question, option, key or level in it'::text, 'absent'::text,
    (case when position(q1::text in txt) > 0 or position('Result one' in txt) > 0
            or position('"A"' in txt) > 0 or position('difficulty' in txt) > 0
          then 'present' else 'absent' end),
    __verdict(position(q1::text in txt) = 0 and position('Result one' in txt) = 0
              and position('"A"' in txt) = 0 and position('difficulty' in txt) = 0);

  -- ============ 4. who reads it ============
  begin perform targeted_result_by_token(link); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '4 door'::text, 'the link''s token alone reads nothing'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  r := targeted_result_by_token(lkey);
  return query select '4 door'::text, 'a lesson has no such score'::text, 'null'::text,
    coalesce(r::text, 'null'), __verdict(r is null);

  -- ============ 5. the student's page ============
  perform __as(null, 'postgres');
  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  perform __as(null, 'anon');
  skey := student_sign_in(stu.display_id, pin)->>'key';
  home := student_home(skey);
  select e->'score' into r from jsonb_array_elements(home->'sessions') e where e->>'id' = tgt::text;
  return query select '5 page'::text, 'a finished targeted test carries its score'::text, '1 of 3'::text,
    coalesce((r->>'right') || ' of ' || (r->>'reached'), 'null'),
    __verdict((r->>'right')::int = 1 and (r->>'reached')::int = 3);
  select e->'score' into r from jsonb_array_elements(home->'sessions') e where e->>'id' = lesson::text;
  return query select '5 page'::text, 'a lesson does not'::text, 'null'::text,
    coalesce(nullif(r::text, 'null'), 'null'), __verdict(r is null or r = 'null'::jsonb);

  -- ============ 6. grants ============
  perform __as(null, 'postgres');
  return query select '6 grants'::text, 'targeted_result_by_token(text) — the link'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.targeted_result_by_token(text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.targeted_result_by_token(text)', 'execute'));
  return query select '6 grants'::text, 'targeted_result(uuid) — internal'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.targeted_result(uuid)', 'execute')
            or has_function_privilege('authenticated', 'public.targeted_result(uuid)', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.targeted_result(uuid)', 'execute')
              and not has_function_privilege('authenticated', 'public.targeted_result(uuid)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from sessions where id in (tgt, lesson);
  delete from questions where id in (q1, q2, q3, q4);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__targeted_result_check();

drop function public.__targeted_result_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
