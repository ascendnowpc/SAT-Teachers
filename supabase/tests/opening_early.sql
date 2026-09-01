-- ============================================================================
--  Opening a session early
--
--    psql "$DATABASE_URL" -f supabase/tests/opening_early.sql
--
--  0025 gave the teacher back a way to let a student start before the
--  scheduled time. The first version of this button (bec3d72) flipped the
--  session to 'live', which published nothing and hid the student's own Start
--  button, and it was taken out the same day. What has to hold this time:
--
--    * the scheduled time is still a real gate with no waiver on it
--    * a student cannot waive their own clock, and neither can a stranger
--    * the waiver does not rewrite scheduled_at — the arrangement stands
--    * nor does it touch status; the student is still the one who starts
--    * after it, the student starts and the first question is really published
--    * and it cannot be taken back once they are in
--
--  Every row must read PASS. Cleans up after itself, and is safe to run
--  against a real database.
-- ============================================================================

create or replace function public.__early_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  o_id uuid := gen_random_uuid();          -- a second student, not on the session
  qa uuid; sess uuid; n int; txt text; v_sched timestamptz;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'early.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'early.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}'),
    (o_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'early.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}');

  -- ============ TEACHER: a one-question session, three hours off ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  qa := create_question('english','craft_and_structure', null, 'Early Q?',
        'easy'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, null);

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() + interval '3 hours')
  returning id into sess;
  n := set_session_paper(sess, array[qa]);
  execute 'reset role';

  -- ============ the gate is real ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  begin perform start_session_as_student(sess); txt := 'opened';
  exception when others then txt := 'refused'; end;
  return query select '1 closed'::text,'three hours off, no waiver'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform set_session_open_early(sess, true); txt := 'waived';
  exception when others then txt := 'refused'; end;
  return query select '1 closed'::text,'a student cannot waive their own clock'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',o_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform set_session_open_early(sess, true); txt := 'waived';
  exception when others then txt := 'refused'; end;
  return query select '1 closed'::text,'nor anybody else'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the teacher waives it ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  perform set_session_open_early(sess, true);

  select scheduled_at into v_sched from sessions where id = sess;
  return query select '2 waive'::text,'the scheduled time is not rewritten'::text,'still future'::text,
    (case when v_sched > now() then 'still future' else 'rewritten' end),
    (case when v_sched > now() then 'PASS' else 'FAIL' end)::text;

  select status::text into txt from sessions where id = sess;
  return query select '2 waive'::text,'and the status is left alone'::text,'scheduled'::text,txt,
    (case when txt='scheduled' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ the student starts, for real ============
  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  n := start_session_as_student(sess);
  select status::text into txt from sessions where id = sess;
  return query select '3 start'::text,'the student starts ahead of time'::text,'live'::text,txt,
    (case when txt='live' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where status='published';
  return query select '3 start'::text,'and the first question is actually published'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ and cannot be undone behind them ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform set_session_open_early(sess, false); txt := 'withdrawn';
  exception when others then txt := 'refused'; end;
  return query select '4 undo'::text,'too late to take back once they have started'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Cleanup. The serial numbers the three accounts consumed stay consumed; see
  -- the note in prepared_session.sql for why they are not rewound.
  delete from sessions where id=sess;
  delete from questions where created_by=t_id;
  delete from auth.users where id in (t_id,s_id,o_id);
end $fn$;

select * from public.__early_check();

drop function public.__early_check();
