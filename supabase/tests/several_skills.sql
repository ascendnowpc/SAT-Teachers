-- ============================================================================
--  A test on several skills (0086)
--
--    psql "$DATABASE_URL" -f supabase/tests/several_skills.sql
--
--  What has to hold:
--
--  The candidates
--    * one call reads the questions on every chosen skill, across sections,
--      each saying its section and skill — and nothing on a skill not chosen;
--      neither a section nor a skill is refused
--
--  Booking
--    * a test on two skills in two sections is booked with both, in the order
--      chosen, and no section; on two in one section, with that section
--    * one skill through p_skills is one skill through p_skill: the same row
--    * the call from before 0086 (p_skill alone) still books, and a whole
--      section still has no skills
--    * refused, and nothing left behind: a set that asks nothing on one of the
--      skills, a question on a skill not chosen, a skill twice, a skill no
--      question of the subject is on
--    * the set cannot be changed to leave a skill out, and can be changed to
--      keep every one
--
--  The table
--    * skill cannot drift from skills, and a test is on a section or on skills
--
--  Reading it
--    * student_progress sends the skills and how many of the set were on each,
--      counts and never ids; the parent card and the student's list of tests
--      carry the skills too
--
--  The teacher's wording
--    * on a test of several skills, one per skill: refused without a skill or
--      with a skill not on the test; each skill's draft and share are its own
--    * on a test with one line, the wording is the test's: refused with a
--      skill, and the call from before 0086 still writes it
--
--  The grants
--    * the two new internal functions are reachable by nobody
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

create or replace function public.__several_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher
  pc    profiles;
  stu   profiles;
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  tr1 uuid; tr2 uuid; rs1 uuid; bo1 uuid; bo2 uuid;
  two uuid; same uuid; one uuid; old uuid; whole uuid;
  n int; v_before int; txt text; j jsonb; pin text; skey text;
  i1 uuid;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'ss.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Several', 'ss.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Sev', 'Skills', pc.id);

  -- Two skills of Expression of Ideas and one of Standard English Conventions.
  tr1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Several transitions one?', null,
           opts, 'A', null, null, 'transitions', null, 'easy');
  tr2 := create_question_in_set(pool, 'expression_of_ideas', null, 'Several transitions two?', null,
           opts, 'A', null, null, 'transitions', null, 'hard');
  rs1 := create_question_in_set(pool, 'expression_of_ideas', null, 'Several synthesis?', null,
           opts, 'A', null, null, 'rhetorical_synthesis', null, 'medium');
  bo1 := create_question_in_set(pool, 'standard_english_conventions', null, 'Several boundaries one?', null,
           opts, 'A', null, null, 'boundaries', null, 'easy');
  bo2 := create_question_in_set(pool, 'standard_english_conventions', null, 'Several boundaries two?', null,
           opts, 'A', null, null, 'boundaries', null, 'medium');

  -- ============ 1. candidates ============
  select count(*) into n
    from targeted_candidates(stu.id, 'english', null, null, array['transitions', 'boundaries']) c
   where c.question_id in (tr1, tr2, bo1, bo2);
  return query select '1 candidates'::text, 'one call reads both skills, across sections'::text,
    '4'::text, n::text, __verdict(n = 4);

  select count(*) into n
    from targeted_candidates(stu.id, 'english', null, null, array['transitions', 'boundaries']) c
   where c.question_id = rs1;
  return query select '1 candidates'::text, 'and nothing on a skill not chosen'::text,
    '0'::text, n::text, __verdict(n = 0);

  select c.section || '/' || c.skill into txt
    from targeted_candidates(stu.id, 'english', null, null, array['transitions', 'boundaries']) c
   where c.question_id = bo1;
  return query select '1 candidates'::text, 'each says its section and skill'::text,
    'standard_english_conventions/boundaries'::text, coalesce(txt, '(none)'),
    __verdict(txt = 'standard_english_conventions/boundaries');

  select count(*) into n
    from targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions') c
   where c.question_id in (tr1, tr2, rs1);
  return query select '1 candidates'::text, 'the call from before 0086 reads one skill as it did'::text,
    '2'::text, n::text, __verdict(n = 2);

  begin perform targeted_candidates(stu.id, 'english', null, null, null); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 candidates'::text, 'neither a section nor a skill is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. booking ============
  two := create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
           4, array[tr1, bo1, tr2, bo2], false, 60, 300, array['transitions', 'boundaries']);
  select array_to_string(skills, ',') || ' | ' || coalesce(section, '(none)') || ' | ' || coalesce(skill, '(none)')
    into txt from targeted_tests where session_id = two;
  return query select '2 booking'::text, 'two skills in two sections: both, in order, no section'::text,
    'transitions,boundaries | (none) | (none)'::text, txt,
    __verdict(txt = 'transitions,boundaries | (none) | (none)');

  select count(*) into n from targeted_set_items where session_id = two;
  return query select '2 booking'::text, 'with its set'::text, '4'::text, n::text, __verdict(n = 4);

  same := create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
            2, array[tr1, rs1], false, 60, 300, array['transitions', 'rhetorical_synthesis']);
  select coalesce(section, '(none)') into txt from targeted_tests where session_id = same;
  return query select '2 booking'::text, 'two skills in one section: that section'::text,
    'expression_of_ideas'::text, txt, __verdict(txt = 'expression_of_ideas');

  one := create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
           2, array[bo1, bo2], false, 60, 300, array['boundaries']);
  select array_to_string(skills, ',') || ' | ' || coalesce(section, '(none)') || ' | ' || coalesce(skill, '(none)')
    into txt from targeted_tests where session_id = one;
  return query select '2 booking'::text, 'one skill through p_skills is a test on one skill'::text,
    'boundaries | standard_english_conventions | boundaries'::text, txt,
    __verdict(txt = 'boundaries | standard_english_conventions | boundaries');

  old := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() + interval '1 day', 'Transitions', 2, array[tr1, tr2], true, 60, 300);
  select array_to_string(skills, ',') || ' | ' || coalesce(section, '(none)') || ' | ' || coalesce(skill, '(none)')
    into txt from targeted_tests where session_id = old;
  return query select '2 booking'::text, 'the call from before 0086 books one skill as it did'::text,
    'transitions | expression_of_ideas | transitions'::text, txt,
    __verdict(txt = 'transitions | expression_of_ideas | transitions');

  whole := create_targeted_session(stu.id, 'english', 'expression_of_ideas', null,
             now() + interval '1 day', null, 3, array[tr1, rs1, tr2], true, 60, 300);
  select coalesce(array_to_string(skills, ','), '(none)') || ' | ' || coalesce(section, '(none)')
    into txt from targeted_tests where session_id = whole;
  return query select '2 booking'::text, 'a whole section has no skills'::text,
    '(none) | expression_of_ideas'::text, txt, __verdict(txt = '(none) | expression_of_ideas');

  select count(*) into v_before from sessions where student_id = stu.id;

  begin
    perform create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
              2, array[tr1, tr2], true, 60, 300, array['transitions', 'boundaries']);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  select count(*) into n from sessions where student_id = stu.id;
  return query select '2 booking'::text, 'a set asking nothing on one skill is refused, nothing left behind'::text,
    'refused, 0 new'::text, txt || ', ' || (n - v_before) || ' new',
    __verdict(txt = 'refused' and n = v_before);

  begin
    perform create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
              3, array[tr1, bo1, rs1], true, 60, 300, array['transitions', 'boundaries']);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a question on a skill not chosen is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
              2, array[tr1, tr2], true, 60, 300, array['transitions', 'transitions']);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a skill twice is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_targeted_session(stu.id, 'english', null, null, now() + interval '1 day', null,
              2, array[tr1, tr2], true, 60, 300, array['transitions', 'linear_functions']);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a skill no English question is on is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  select count(*) into n from sessions where student_id = stu.id;
  return query select '2 booking'::text, 'and none of the refusals left a session behind'::text,
    '0 new'::text, (n - v_before) || ' new', __verdict(n = v_before);

  -- ============ 3. changing the set ============
  begin perform save_targeted_set(two, 2, array[tr1, tr2], false, 60, 300); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '3 changing'::text, 'the set cannot be changed to leave a skill out'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform save_targeted_set(two, 2, array[bo2, tr2], false, 60, 300);
  select string_agg(question_id::text, ',' order by position) into txt from targeted_set_items where session_id = two;
  return query select '3 changing'::text, 'and can be changed keeping every skill'::text,
    'boundaries, then transitions'::text,
    (case when txt = bo2 || ',' || tr2 then 'boundaries, then transitions' else txt end),
    __verdict(txt = bo2 || ',' || tr2);

  -- ============ 4. the table ============
  perform __as(null, 'postgres');
  begin update targeted_tests set skill = 'transitions' where session_id = two; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '4 table'::text, 'skill cannot drift from skills'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin update targeted_tests set skills = null, skill = null where session_id = two; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '4 table'::text, 'a test with no skills needs a section'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin update targeted_tests set skills = '{}', skill = null where session_id = two; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '4 table'::text, 'nor is an empty list of skills a test'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 5. reading it ============
  -- The two-skill test, sat: one of each skill reached.
  update targeted_tests set locked_at = now() where session_id = two;
  insert into session_items (session_id, question_id, student_id, sequence_no, status, time_limit_seconds)
  values (two, bo2, stu.id, 1, 'answered', 60) returning id into i1;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds) values (i1, true, 30);
  update sessions set status = 'completed' where id = two;

  perform __as(t_id);
  j := (select e from jsonb_array_elements(student_progress(stu.id, 'english')->'targeted') e
         where e->>'session_id' = two::text);
  txt := j->>'skills';
  return query select '5 reading'::text, 'student_progress sends what the test is on'::text,
    '["transitions", "boundaries"]'::text, coalesce(txt, '(none)'), __verdict(txt = '["transitions", "boundaries"]');

  txt := j->>'set_by_skill';
  return query select '5 reading'::text, 'and how many of the set were on each — counts, not ids'::text,
    '{"boundaries": 1, "transitions": 1}'::text, coalesce(txt, '(none)'),
    __verdict(txt = '{"boundaries": 1, "transitions": 1}');

  j := (select e from jsonb_array_elements(student_progress(stu.id, 'english')->'targeted') e
         where e->>'session_id' = whole::text);
  return query select '5 reading'::text, 'a whole section has no skills and no split'::text,
    'null/null'::text, coalesce(j->>'skills', 'null') || '/' || coalesce(j->>'set_by_skill', 'null'),
    __verdict(j->'skills' = 'null'::jsonb and j->'set_by_skill' = 'null'::jsonb);

  perform __as(null, 'postgres');
  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  perform __as(null, 'anon');
  skey := student_sign_in(stu.display_id, pin)->>'key';

  j := (select e from jsonb_array_elements(student_report(skey)->'subjects'->'english'->'targeted') e
         where e->>'session_id' = two::text);
  txt := coalesce(j->>'skills', '(none)') || ' ' || coalesce(j->>'set_by_skill', '(none)');
  return query select '5 reading'::text, 'the parent card carries the skills and the split'::text,
    '["transitions", "boundaries"] {"boundaries": 1, "transitions": 1}'::text, txt,
    __verdict(txt = '["transitions", "boundaries"] {"boundaries": 1, "transitions": 1}');

  j := (select e from jsonb_array_elements(student_home(skey)->'sessions') e where e->>'id' = two::text);
  txt := coalesce(j->>'skills', '(none)');
  return query select '5 reading'::text, 'and so does the student''s list of tests'::text,
    '["transitions", "boundaries"]'::text, txt, __verdict(txt = '["transitions", "boundaries"]');

  -- ============ 6. the teacher's wording ============
  perform __as(t_id);
  begin perform save_verdict_override(two, null, 'Better.', ''); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '6 wording'::text, 'on a test of several skills, wording without a skill is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  begin perform save_verdict_override(two, null, 'Better.', '', 'rhetorical_synthesis'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '6 wording'::text, 'as is a skill the test is not on'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform save_verdict_override(two, null, 'Commas are sticking.', '', 'boundaries');
  perform save_verdict_override(two, null, 'Still guessing.', '', 'transitions');
  perform share_verdict_override(two, true, 'boundaries');
  select count(*) into n from verdict_overrides where session_id = two;
  return query select '6 wording'::text, 'one draft per skill'::text, '2'::text, n::text, __verdict(n = 2);

  select string_agg(skill || '=' || coalesce(shared_wording, '(not shared)'), '; ' order by skill) into txt
    from verdict_overrides where session_id = two;
  return query select '6 wording'::text, 'sharing one skill''s shares that one only'::text,
    'boundaries=Commas are sticking.; transitions=(not shared)'::text, txt,
    __verdict(txt = 'boundaries=Commas are sticking.; transitions=(not shared)');

  j := (select e from jsonb_array_elements(student_progress(stu.id, 'english')->'overrides') e
         where e->>'session_id' = two::text);
  return query select '6 wording'::text, 'student_progress says which skill the shared wording is for'::text,
    'boundaries'::text, coalesce(j->>'skill', '(none)'), __verdict(j->>'skill' = 'boundaries');

  begin perform save_verdict_override(one, null, 'Better.', '', 'boundaries'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '6 wording'::text, 'on a test with one line, a skill is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform save_verdict_override(one, null, 'Steady.', '');
  perform share_verdict_override(one, true);
  select coalesce(skill, '(null)') || '=' || coalesce(shared_wording, '(none)') into txt
    from verdict_overrides where session_id = one;
  return query select '6 wording'::text, 'and the call from before 0086 writes and shares the test''s wording'::text,
    '=Steady.'::text, txt, __verdict(txt = '=Steady.');

  -- ============ 7. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['targeted_skills(text,text[])', 'assert_override_skill(uuid,text)']) loop
    return query select '7 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'reachable' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  for txt in select unnest(array['targeted_question_fits(uuid,text,text,text)',
                                 'targeted_candidates(uuid,text,text,text)',
                                 'create_targeted_session(uuid,text,text,text,timestamptz,text,int,uuid[],boolean,int,int)',
                                 'save_verdict_override(uuid,uuid,text,text)',
                                 'share_verdict_override(uuid,boolean)']) loop
    return query select '7 grants'::text, txt || ' — replaced', 'absent'::text,
      (case when to_regprocedure('public.'||txt) is null then 'absent' else 'present' end),
      __verdict(to_regprocedure('public.'||txt) is null);
  end loop;

  -- Cleanup.
  delete from sessions where student_id = stu.id;
  delete from questions where id in (tr1, tr2, rs1, bo1, bo2);
  delete from profiles where id in (stu.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__several_check();

drop function public.__several_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
