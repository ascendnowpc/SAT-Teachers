-- ============================================================================
--  A session says what it is for (0059)
--
--    psql "$DATABASE_URL" -f supabase/tests/modes.sql
--
--  What has to hold:
--
--    * a session booked the usual way is a lesson (live); one booked as a
--      diagnostic is a diagnostic; nobody books a targeted test by inserting a
--      row — it comes with its set, through create_targeted_session
--    * set_session_mode moves a session between live and diagnostic, for its
--      teacher and an admin, and for nobody else — and never makes a targeted
--      test, or unmakes one, by the RPC or by writing the row
--    * a targeted test's subject is its set's
--    * a lesson's controls refuse a targeted test: the level buttons, choosing
--      a question, starting it from the console
--    * a targeted test has no diagnostic form and no generated report, however
--      the stamp is written
--    * a diagnostic runs exactly as a lesson does
--    * the grants are what they claim to be
--
--  Every row must read PASS. Cleans up after itself, and is safe to run
--  against a real database. The diagnostic's run needs the three tests (0026),
--  and reads SKIP without them.
-- ============================================================================

create or replace function public.__as(p uuid, r text default 'authenticated') returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims',
    case when p is null then '' else json_build_object('sub', p::text, 'role', r)::text end, true);
  execute format('set local role %I', r);
end $$;

create or replace function public.__modes_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher
  x_id  uuid := gen_random_uuid();   -- another teacher
  ad_id uuid := gen_random_uuid();   -- an admin
  pc    profiles;
  stu   profiles;
  lesson uuid; diag uuid; tgt uuid;
  q     uuid;
  n     int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'modes.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'modes.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'modes.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  -- A signup cannot make an admin (0044); the SQL editor can.
  update profiles set role = 'admin', is_active = true where id = ad_id;
  update profiles set is_active = true where id in (t_id, x_id);

  pc := create_pc_profile('Pat', 'Modes', 'modes.pc@example.test');

  perform __as(t_id);
  select * into stu from create_student('Mia', 'Modes', pc.id);

  -- ============ 1. booking ============
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, stu.id, 'english', now() - interval '1 minute') returning id into lesson;
  select mode into txt from sessions where id = lesson;
  return query select '1 booking'::text, 'a session booked the usual way is a lesson'::text,
    'live'::text, txt, (case when txt = 'live' then 'PASS' else 'FAIL' end)::text;

  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode)
  values (t_id, stu.id, 'english', now() - interval '1 minute', 'diagnostic') returning id into diag;
  select mode into txt from sessions where id = diag;
  return query select '1 booking'::text, 'one booked as a diagnostic is a diagnostic'::text,
    'diagnostic'::text, txt, (case when txt = 'diagnostic' then 'PASS' else 'FAIL' end)::text;

  begin
    insert into sessions (teacher_id, student_id, subject, scheduled_at, mode)
    values (t_id, stu.id, 'english', now(), 'targeted');
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '1 booking'::text, 'a targeted test cannot be booked by inserting a row'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 2. correcting it ============
  perform set_session_mode(lesson, 'diagnostic');
  select mode into txt from sessions where id = lesson;
  return query select '2 correcting'::text, 'the teacher marks a lesson a diagnostic'::text,
    'diagnostic'::text, txt, (case when txt = 'diagnostic' then 'PASS' else 'FAIL' end)::text;

  begin perform set_session_mode(lesson, 'targeted'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 correcting'::text, 'and cannot make it a targeted test'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  begin update sessions set mode = 'targeted' where id = lesson; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 correcting'::text, '— not by writing the row either'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  perform __as(x_id);
  begin perform set_session_mode(lesson, 'live'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 correcting'::text, 'another teacher cannot correct it'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  perform __as(pc.id);
  begin perform set_session_mode(lesson, 'live'); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 correcting'::text, 'nor can the PC'::text,
    'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  perform __as(ad_id);
  perform set_session_mode(lesson, 'live');
  select mode into txt from sessions where id = lesson;
  return query select '2 correcting'::text, 'an admin can'::text,
    'live'::text, txt, (case when txt = 'live' then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. a targeted test stays one ============
  perform __as(null, 'postgres');
  select q2.id into q
    from questions q2
    join question_set_items qi on qi.question_id = q2.id
    join question_sets qs on qs.id = qi.set_id
   where qs.subject = 'english' and qs.level is not null and qs.is_active
     and q2.status = 'published' and q2.section is not null
   limit 1;

  if q is null then
    return query select '3 targeted'::text, 'needs the three English tests (0026)'::text,
      'loaded'::text, 'not loaded'::text, 'SKIP'::text;
  else
    perform __as(t_id);
    tgt := create_targeted_session(stu.id, 'english',
             (select section from questions where id = q), (select skill from questions where id = q),
             now() - interval '1 minute', 'One skill', 1, array[q], true, null::int, 300);

    select mode into txt from sessions where id = tgt;
    return query select '3 targeted'::text, 'create_targeted_session books a targeted test'::text,
      'targeted'::text, txt, (case when txt = 'targeted' then 'PASS' else 'FAIL' end)::text;

    begin update sessions set mode = 'live' where id = tgt; txt := 'changed';
    exception when others then txt := 'refused'; end;
    return query select '3 targeted'::text, 'it cannot be turned into a lesson by writing the row'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    begin perform set_session_mode(tgt, 'live'); txt := 'changed';
    exception when others then txt := 'refused'; end;
    return query select '3 targeted'::text, '— or by set_session_mode'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    begin update sessions set subject = 'mathematics' where id = tgt; txt := 'changed';
    exception when others then txt := 'refused'; end;
    return query select '3 targeted'::text, 'its subject is its set''s'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    -- ============ 4. a lesson's controls ============
    begin perform teacher_start_session(tgt); txt := 'started';
    exception when others then txt := 'refused'; end;
    return query select '4 controls'::text, 'the console cannot start a targeted test'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    -- Live, as if the student had started it, to reach the controls that
    -- need a running test.
    perform __as(null, 'postgres');
    update sessions set status = 'live', started_at = now() where id = tgt;
    perform __as(t_id);

    begin perform set_session_level(tgt, 'medium'); txt := 'moved';
    exception when others then txt := 'refused'; end;
    return query select '4 controls'::text, 'the level buttons refuse a targeted test'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    begin perform teacher_choose_question(tgt, q, true); txt := 'shown';
    exception when others then txt := 'refused'; end;
    return query select '4 controls'::text, 'choosing a question refuses a targeted test'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    -- ============ 5. no form, no generated report ============
    begin
      insert into session_reports (session_id, form_submitted_at) values (tgt, now());
      txt := 'stamped';
    exception when others then txt := 'refused'; end;
    return query select '5 report'::text, 'a targeted test''s form cannot be handed in'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    begin perform generate_report(tgt); txt := 'generated';
    exception when others then txt := 'refused'; end;
    return query select '5 report'::text, 'and no report is generated for it'::text,
      'refused'::text, txt, (case when txt = 'refused' then 'PASS' else 'FAIL' end)::text;

    -- ============ 6. a diagnostic is a lesson ============
    perform teacher_start_session(diag);
    perform set_session_level(diag, 'easy');
    select count(*) into n from session_items where session_id = diag and status = 'published';
    return query select '6 diagnostic'::text, 'a diagnostic runs as a lesson: the teacher shows a question'::text,
      '1'::text, n::text, (case when n = 1 then 'PASS' else 'FAIL' end)::text;
  end if;

  -- ============ 7. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['sessions_guard_mode()',
                                 'assert_not_targeted(uuid)',
                                 'session_reports_not_for_targeted()',
                                 'show_one_question(uuid,uuid,uuid)'])
  loop
    return query select '7 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'reachable' else 'nobody' end),
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'FAIL' else 'PASS' end)::text;
  end loop;

  for txt in select unnest(array['set_session_mode(uuid,text)',
                                 'teacher_start_session(uuid)',
                                 'teacher_answer_item(uuid,answer_option,answer_option[],smallint,text)'])
  loop
    return query select '7 grants'::text, txt || ' — signed in only', 'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
            else 'nobody' end),
      (case when not has_function_privilege('anon', 'public.'||txt, 'execute')
             and has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'PASS' else 'FAIL' end)::text;
  end loop;

  -- Cleanup.
  delete from sessions where id in (lesson, diag, tgt);
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, pc.id);
  delete from auth.users where id in (t_id, x_id, ad_id, pc.id);
end $fn$;

select * from public.__modes_check();

drop function public.__modes_check();
drop function public.__as(uuid, text);
