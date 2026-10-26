-- ============================================================================
--  A test on one skill (0061)
--
--    psql "$DATABASE_URL" -f supabase/tests/targeted.sql
--
--  What has to hold:
--
--  The set
--    * the candidates are staff's: a teacher and an admin read them, a PC, a
--      student and anon do not — and "seen" counts a question the student had
--      in front of them in another teacher's session
--    * a teacher books a targeted test with its set in one call; it is
--      refused, and leaves nothing behind, when a question is off the skill,
--      in the set twice, already seen (unless repeats are allowed), or when
--      the set is empty or over twenty; a student with no PC is not booked
--    * a student, a PC and anon cannot book one
--    * the set is changed by its teacher and an admin, not another teacher,
--      and not once the student has started
--    * the set is read by its teacher and an admin — not another teacher, not
--      the PC, not the student, not anon. The PC reads what the test was on.
--
--  The config
--    * staff and PCs read it, anon does not; only an admin changes it, and a
--      mapping that does not rise, or has one point, is refused
--
--  Notes, summaries and overrides
--    * staff write and read them; the PC and the student read none of the
--      three tables — the PC gets the shared copies through student_progress
--      (0063) and nothing else
--    * sharing copies the draft; an edit after sharing changes the draft only
--    * an empty summary is not shared
--    * an override is written on a targeted test, against one of the same
--      student's sessions
--
--  The grants
--    * internal functions are reachable by nobody; the RPCs are signed-in only
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

create or replace function public.__targeted_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher
  x_id  uuid := gen_random_uuid();   -- another teacher
  ad_id uuid := gen_random_uuid();   -- an admin
  pc    profiles;
  stu   profiles;
  orphan uuid := gen_random_uuid();  -- a student with no PC
  pool  uuid;
  opts  jsonb := '[{"label":"A","body":"one"},{"label":"B","body":"two"}]';
  qe    uuid; qm uuid; qh uuid; qoff uuid;
  lesson uuid; tgt uuid; tgt2 uuid;
  n     int; txt text; v_before int;
  cfg   jsonb;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tgt.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tgt.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tgt.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}'),
    (orphan,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'tgt.orphan@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"No Pc"}');
  update profiles set role = 'admin', is_active = true where id = ad_id;
  update profiles set is_active = true where id in (t_id, x_id);

  pc := create_pc_profile('Pat', 'Targeted', 'tgt.pc@example.test');
  select id into pool from question_sets where kind = 'practice' and is_active and subject = 'english';

  perform __as(t_id);
  select * into stu from create_student('Tia', 'Targeted', pc.id);

  -- Three questions on one skill, one of each level, and one off it. In the
  -- pool, so the contract does not depend on what the three tests hold.
  qe := create_question_in_set(pool, 'expression_of_ideas', null, 'Contract easy?', null,
          opts, 'A', null, null, 'transitions', null, 'easy');
  qm := create_question_in_set(pool, 'expression_of_ideas', null, 'Contract medium?', null,
          opts, 'A', null, null, 'transitions', null, 'medium');
  qh := create_question_in_set(pool, 'expression_of_ideas', null, 'Contract hard?', null,
          opts, 'A', null, null, 'transitions', null, 'hard');
  qoff := create_question_in_set(pool, 'expression_of_ideas', null, 'Contract off skill?', null,
          opts, 'A', null, null, 'rhetorical_synthesis', null, 'easy');

  -- ============ 1. candidates ============
  select count(*) into n from targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions') c
   where c.question_id in (qe, qm, qh);
  return query select '1 candidates'::text, 'the teacher reads the questions on the skill, pool included'::text,
    '3'::text, n::text, __verdict(n = 3);

  select count(*) into n from targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions') c
   where c.question_id = qoff;
  return query select '1 candidates'::text, 'and none off it'::text,
    '0'::text, n::text, __verdict(n = 0);

  select count(*) into n from targeted_candidates(stu.id, 'english', 'expression_of_ideas', null) c
   where c.question_id in (qe, qm, qh, qoff);
  return query select '1 candidates'::text, 'a whole-section test reads every skill in it'::text,
    '4'::text, n::text, __verdict(n = 4);

  -- Another teacher puts qe in front of the student, in their own lesson.
  perform __as(x_id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (x_id, stu.id, 'english', now() - interval '1 hour') returning id into lesson;
  perform __as(null, 'postgres');
  insert into session_items (session_id, question_id, student_id, sequence_no, status)
  values (lesson, qe, stu.id, 1, 'answered');

  perform __as(t_id);
  select c.seen::text into txt from targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions') c
   where c.question_id = qe;
  return query select '1 candidates'::text, 'seen counts another teacher''s session'::text,
    'true'::text, txt, __verdict(txt = 'true');

  perform __as(ad_id);
  select count(*) into n from targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions');
  return query select '1 candidates'::text, 'an admin reads them'::text,
    '>= 3'::text, n::text, __verdict(n >= 3);

  perform __as(pc.id);
  begin perform targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 candidates'::text, 'the PC does not'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  begin perform targeted_candidates(stu.id, 'english', 'expression_of_ideas', 'transitions'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 candidates'::text, 'nor does a student'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. booking ============
  perform __as(t_id);
  select count(*) into v_before from sessions where student_id = stu.id;

  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 3, array[qm, qh, qoff], false, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  select count(*) into n from sessions where student_id = stu.id;
  return query select '2 booking'::text, 'a question off the skill is refused, and nothing is left behind'::text,
    'refused, 0 new'::text, txt || ', ' || (n - v_before) || ' new',
    __verdict(txt = 'refused' and n = v_before);

  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 3, array[qm, qm], false, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a question twice is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 3, array[]::uuid[], false, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'an empty set is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 21, array_fill(qm, array[21]), true, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a set over twenty is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 3, array[qe, qm, qh], false, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a question the student has seen is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  tgt := create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
           now() + interval '1 day', 'Transitions', 3, array[qe, qm, qh], true, null::int, 600);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '2 booking'::text, 'with repeats allowed it is booked, with its set'::text,
    '3'::text, n::text, __verdict(n = 3);

  select string_agg(question_id::text, ',' order by position) into txt from targeted_set_items where session_id = tgt;
  return query select '2 booking'::text, 'in the order given'::text,
    'easy,medium,hard'::text,
    (case when txt = qe || ',' || qm || ',' || qh then 'easy,medium,hard' else txt end),
    __verdict(txt = qe || ',' || qm || ',' || qh);

  select teacher_id::text into txt from sessions where id = tgt;
  return query select '2 booking'::text, 'and it is the booking teacher''s'::text,
    'the teacher'::text, (case when txt = t_id::text then 'the teacher' else txt end), __verdict(txt = t_id::text);

  begin
    perform create_targeted_session(orphan, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 1, array[qm], true, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'a student with no PC is not booked'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(pc.id);
  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 1, array[qm], true, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'the PC cannot book one'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  begin
    perform create_targeted_session(stu.id, 'english', 'expression_of_ideas', 'transitions',
              now() + interval '1 day', 'Transitions', 1, array[qm], true, null::int, 600);
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text, 'nor can a student'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 3. changing the set ============
  perform __as(t_id);
  perform save_targeted_set(tgt, 2, array[qm, qh], false, 60, 300);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '3 changing'::text, 'the teacher swaps and resizes it'::text, '2'::text, n::text, __verdict(n = 2);

  select question_seconds::text || '/' || overall_seconds::text into txt from targeted_tests where session_id = tgt;
  return query select '3 changing'::text, 'and re-clocks it'::text, '60/300'::text, txt, __verdict(txt = '60/300');

  begin perform save_targeted_set(tgt, 3, array[qe, qm, qh], false, null::int, 300); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '3 changing'::text, 'a seen question is refused on a change too'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(x_id);
  begin perform save_targeted_set(tgt, 1, array[qh], false, null::int, 300); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '3 changing'::text, 'another teacher cannot change it'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(ad_id);
  perform save_targeted_set(tgt, 2, array[qh, qm], false, null::int, 300);
  select question_id::text into txt from targeted_set_items where session_id = tgt and position = 1;
  return query select '3 changing'::text, 'an admin can'::text, 'hard first'::text,
    (case when txt = qh::text then 'hard first' else txt end), __verdict(txt = qh::text);

  perform __as(null, 'postgres');
  update targeted_tests set locked_at = now() where session_id = tgt;
  perform __as(t_id);
  begin perform save_targeted_set(tgt, 2, array[qm, qh], false, null::int, 300); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '3 changing'::text, 'not once the student has started'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 4. who reads the set ============
  perform __as(t_id);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '4 reading'::text, 'the teacher reads the set'::text, '2'::text, n::text, __verdict(n = 2);

  perform __as(ad_id);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '4 reading'::text, 'an admin reads it'::text, '2'::text, n::text, __verdict(n = 2);

  perform __as(x_id);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '4 reading'::text, 'another teacher does not'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(pc.id);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '4 reading'::text, 'the PC does not read the set'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from targeted_tests where session_id = tgt;
  return query select '4 reading'::text, 'but reads what the test was on'::text, '1'::text, n::text, __verdict(n = 1);

  perform __as(stu.id);
  select count(*) into n from targeted_set_items where session_id = tgt;
  return query select '4 reading'::text, 'the student does not'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'anon');
  select count(*) into n from targeted_set_items;
  return query select '4 reading'::text, 'nor does anon'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from targeted_tests;
  return query select '4 reading'::text, 'nor what any test is on'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 5. config ============
  perform __as(t_id);
  select count(*) into n from progress_config;
  return query select '5 config'::text, 'staff read it, per subject'::text, '2'::text, n::text, __verdict(n = 2);

  perform __as(pc.id);
  select count(*) into n from progress_config;
  return query select '5 config'::text, 'so does the PC'::text, '2'::text, n::text, __verdict(n = 2);

  perform __as(null, 'anon');
  select count(*) into n from progress_config;
  return query select '5 config'::text, 'anon does not'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(t_id);
  begin perform set_progress_config('english', '{"score_points":[[0,20],[10,50]]}'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '5 config'::text, 'a teacher cannot change it'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(ad_id);
  select to_jsonb(c) into cfg from progress_config c where subject = 'english';
  perform set_progress_config('english', '{"score_points":[[0,20],[5,30],[8,40],[10,48]], "long_words": 80}');
  select score_points::text || ' ' || long_words into txt from progress_config where subject = 'english';
  return query select '5 config'::text, 'an admin can'::text, '[[0, 20], [5, 30], [8, 40], [10, 48]] 80'::text,
    txt, __verdict(txt = '[[0, 20], [5, 30], [8, 40], [10, 48]] 80');

  begin perform set_progress_config('english', '{"score_points":[[8,40],[5,30]]}'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '5 config'::text, 'a mapping that does not rise is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  begin perform set_progress_config('english', '{"score_points":[[5,30]]}'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '5 config'::text, 'and one with a single point'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- Put it back as it was.
  perform __as(null, 'postgres');
  update progress_config
     set score_points = cfg->'score_points', long_words = (cfg->>'long_words')::int,
         updated_by = (cfg->>'updated_by')::uuid, updated_at = (cfg->>'updated_at')::timestamptz
   where subject = 'english';

  -- ============ 6. notes ============
  perform __as(t_id);
  perform save_skill_note(stu.id, 'english', 'expression_of_ideas', 'transitions', 'Rushes when anxious.');
  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'Steady work on transitions.');

  perform __as(x_id);
  select count(*) into n from skill_notes where student_id = stu.id;
  return query select '6 notes'::text, 'staff read the private note'::text, '1'::text, n::text, __verdict(n = 1);

  perform __as(pc.id);
  select count(*) into n from skill_notes where student_id = stu.id;
  return query select '6 notes'::text, 'the PC does not'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from skill_summaries where student_id = stu.id;
  return query select '6 notes'::text, 'nor the summary''s row — shared or not'::text, '0'::text, n::text, __verdict(n = 0);
  begin perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'PC wrote this'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '6 notes'::text, 'and cannot write one'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  select count(*) into n from skill_notes where student_id = stu.id;
  return query select '6 notes'::text, 'the student reads no note'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'anon');
  select count(*) into n from skill_summaries;
  return query select '6 notes'::text, 'nor does anon read a summary'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(t_id);
  perform share_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', true);
  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', 'transitions', 'A new draft.');
  select coalesce(shared, '(none)') into txt from skill_summaries
   where student_id = stu.id and section = 'expression_of_ideas' and skill = 'transitions';
  return query select '6 notes'::text, 'sharing copies the draft; a later edit changes the draft only'::text,
    'Steady work on transitions.'::text, txt, __verdict(txt = 'Steady work on transitions.');

  perform save_skill_summary(stu.id, 'english', 'expression_of_ideas', '', '');
  begin perform share_skill_summary(stu.id, 'english', 'expression_of_ideas', '', true); txt := 'shared';
  exception when others then txt := 'refused'; end;
  return query select '6 notes'::text, 'an empty summary is not shared'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 7. overrides ============
  begin perform save_verdict_override(lesson, null, 'Wording', ''); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '7 overrides'::text, 'an override is not written on a lesson'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, orphan, 'english', now()) returning id into tgt2;
  perform __as(t_id);
  begin perform save_verdict_override(tgt, tgt2, 'Wording', ''); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '7 overrides'::text, 'nor against another student''s session'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform save_verdict_override(tgt, lesson, 'Steady progress.', 'Two weeks of method work.');
  perform share_verdict_override(tgt, true);
  perform save_verdict_override(tgt, lesson, 'Changed my mind.', '');
  select shared_wording into txt from verdict_overrides where session_id = tgt;
  return query select '7 overrides'::text, 'sharing copies the draft; a later edit changes the draft only'::text,
    'Steady progress.'::text, txt, __verdict(txt = 'Steady progress.');

  perform __as(pc.id);
  select count(*) into n from verdict_overrides;
  return query select '7 overrides'::text, 'the PC reads no override row'::text, '0'::text, n::text, __verdict(n = 0);
  begin perform share_verdict_override(tgt, false); txt := 'unshared';
  exception when others then txt := 'refused'; end;
  return query select '7 overrides'::text, 'and cannot unshare one'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 8. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['targeted_question_fits(uuid,text,text,text)',
                                 'student_has_seen(uuid,uuid)',
                                 'write_targeted_set(uuid,uuid[],boolean)',
                                 'assert_staff_on_student(uuid,text)',
                                 'assert_staff_on_targeted(uuid)'])
  loop
    return query select '8 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'reachable' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  for txt in select unnest(array['targeted_candidates(uuid,text,text,text)',
                                 'create_targeted_session(uuid,text,text,text,timestamptz,text,int,uuid[],boolean,int,int)',
                                 'save_targeted_set(uuid,int,uuid[],boolean,int,int)',
                                 'set_progress_config(text,jsonb)',
                                 'save_skill_note(uuid,text,text,text,text)',
                                 'save_skill_summary(uuid,text,text,text,text)',
                                 'share_skill_summary(uuid,text,text,text,boolean)',
                                 'save_verdict_override(uuid,uuid,text,text)',
                                 'share_verdict_override(uuid,boolean)'])
  loop
    return query select '8 grants'::text, txt || ' — signed in only', 'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
            else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  -- Cleanup.
  delete from sessions where id in (lesson, tgt, tgt2);
  delete from skill_notes where student_id = stu.id;
  delete from skill_summaries where student_id = stu.id;
  delete from questions where id in (qe, qm, qh, qoff);
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, orphan, pc.id);
  delete from auth.users where id in (t_id, x_id, ad_id, orphan);
end $fn$;

select * from public.__targeted_check();

drop function public.__targeted_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
