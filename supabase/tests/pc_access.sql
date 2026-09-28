-- ============================================================================
--  The PC: an account, a student's, and a reader
--
--    psql "$DATABASE_URL" -f supabase/tests/pc_access.sql
--
--  0055 made the PC a person who signs in. What has to hold:
--
--    * making one: create_pc_profile is the service role's alone; it wants
--      both names and an address nobody has yet; the sign-in made afterwards
--      under the same id leaves the profile a PC and spends no student's
--      serial; a signup that asks to be a PC is a student
--    * booking: a teacher cannot book a student with no PC, and can once they
--      have one
--    * choosing one: a teacher gives a PC to a student who has none and
--      cannot change one already chosen; an admin can; nobody chooses a
--      teacher or a suspended PC; the name printed beside the student follows
--      the PC, renames included; a student cannot choose their own
--    * the list: staff read the PCs; a student does not
--    * reading: a PC reads their student, the student's teachers and the
--      session — what was asked (not what is staged), the assessments, the
--      form, the transcript, the reading, the report — and never the answer
--      key, another PC's student or a question nobody put to theirs
--    * and only reads: a PC changes nothing and runs nothing, and a suspended
--      one reads nothing at all
--    * the email: generating a report queues notify_pc_report and saving the
--      report without generating does not; the log is read by the session's
--      teacher, its PC and an admin, and written by no client; a generation
--      is claimed once, again on request, and a failed one can be retried
--
--  Every row must read PASS. It cleans up after itself and is safe against a
--  real database: it is one statement, so a failure rolls back what it made,
--  and the one request it queues is taken off the queue before it commits.
-- ============================================================================

-- Sit in a seat: the JWT a signed-in user's request carries, and the role
-- PostgREST runs it as.
create or replace function public.__pc_seat(p_user uuid) returns void
language plpgsql as $$
begin
  perform set_config('request.jwt.claims',
    json_build_object('sub', p_user::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';
end $$;

-- Back to the migration role with no JWT at all, which is how the fixtures are
-- written — and which the identity guard lets through, as it does migrations.
create or replace function public.__pc_off() returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);
end $$;

create or replace function public.__pc_access_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();          -- the session's teacher
  x_id uuid := gen_random_uuid();          -- a teacher who has never taught their students
  s_id uuid := gen_random_uuid();          -- the PC's student
  o_id uuid := gen_random_uuid();          -- another PC's student
  a_id uuid := gen_random_uuid();          -- an admin
  z_id uuid := gen_random_uuid();          -- a signup that asks to be a PC
  priya profiles; omar profiles; gone profiles;   -- three PCs; the last one suspended
  sess uuid; osess uuid; stray uuid;
  q1 uuid; q2 uuid; q3 uuid; it1 uuid; it2 uuid;
  n int; txt text; ok boolean; v_before int; v_after int;
  v_gen timestamptz; v_url text; v_queued int;
  body1 text := '@0:05 - Malya Rao' || chr(10) || 'Let us start with question one.';
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pcx.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pcx.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pcx.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Batu Ozcelik"}'),
    (o_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pcx.student2@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}'),
    (a_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'pcx.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');

  update profiles set is_active = true where id in (t_id, x_id);
  update profiles set role = 'admin', is_active = true where id = a_id;

  -- ============ 1. making a PC ============
  select coalesce(max(next_no), 0) into v_before from display_id_counters where role = 'student';

  priya := create_pc_profile('Priya', 'Rao', 'PCX.Priya@example.test');
  return query select '1 making'::text,'a PC profile, active, with an id of the usual shape'::text,
    'pc, active, PRIR26-n'::text,
    priya.role::text || ', ' || (case when priya.is_active then 'active' else 'inactive' end) || ', ' || priya.display_id,
    (case when priya.role = 'pc' and priya.is_active and priya.display_id ~ '^PRIR[0-9]{2}-[0-9]+$'
          then 'PASS' else 'FAIL' end)::text;
  return query select '1 making'::text,'its address kept, in lower case'::text,'pcx.priya@example.test'::text,
    coalesce(priya.email,'(null)'), (case when priya.email = 'pcx.priya@example.test' then 'PASS' else 'FAIL' end)::text;

  -- The sign-in, as manage_pc makes it: the admin API, under the profile's id.
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (priya.id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          priya.email, crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"full_name":"Priya Rao"}');

  select role::text || ', ' || display_id into txt from profiles where id = priya.id;
  return query select '1 making'::text,'its sign-in leaves the profile as it was'::text,
    'pc, ' || priya.display_id, txt, (case when txt = 'pc, ' || priya.display_id then 'PASS' else 'FAIL' end)::text;

  select coalesce(max(next_no), 0) into v_after from display_id_counters where role = 'student';
  return query select '1 making'::text,'and spends no student''s serial'::text,v_before::text,v_after::text,
    (case when v_after = v_before then 'PASS' else 'FAIL' end)::text;

  begin perform create_pc_profile('Priya', 'Rao', 'pcx.priya@EXAMPLE.test'); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 making'::text,'an address already taken is refused, whatever its case'::text,
    'refused'::text,txt,(case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform create_pc_profile('Priya', '', 'pcx.nosurname@example.test'); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 making'::text,'both names are required'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform create_pc_profile('Priya', 'Rao', 'not an address'); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 making'::text,'and a real address'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  for txt in select unnest(array['create_pc_profile(text,text,text)',
                                 'claim_report_email(uuid,timestamp with time zone,uuid,text,boolean)']) loop
    ok := has_function_privilege('anon', 'public.'||txt, 'execute')
       or has_function_privilege('authenticated', 'public.'||txt, 'execute');
    return query select '1 making'::text, txt || ' — service role only', 'no client'::text,
      (case when ok then 'a client can' else 'no client' end),
      (case when not ok and has_function_privilege('service_role', 'public.'||txt, 'execute')
            then 'PASS' else 'FAIL' end)::text;
  end loop;

  -- A signup is not a way in: user_metadata is whatever the signup says.
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (z_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'pcx.claims@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"pc","full_name":"Sly Signup"}');
  select role::text into txt from profiles where id = z_id;
  return query select '1 making'::text,'a signup asking to be a PC is a student'::text,'student'::text,
    coalesce(txt,'(none)'), (case when txt = 'student' then 'PASS' else 'FAIL' end)::text;

  omar := create_pc_profile('Omar', 'Haddad', 'pcx.omar@example.test');
  gone := create_pc_profile('Sam', 'Gone', 'pcx.gone@example.test');
  update profiles set is_active = false, suspended_at = now() where id = gone.id;

  -- ============ 2. booking needs a PC ============
  perform __pc_seat(t_id);
  begin
    insert into sessions (teacher_id, student_id, subject, scheduled_at)
    values (t_id, s_id, 'english', now() - interval '1 hour')
    returning id into stray;
    txt := 'booked';
  exception when others then txt := 'refused'; end;
  return query select '2 booking'::text,'a student with no PC cannot be booked'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. choosing ============
  begin perform assign_student_pc(s_id, priya.id); txt := 'chosen';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  select pc into txt from profiles where id = s_id and pc_id = priya.id;
  return query select '3 choosing'::text,'a teacher chooses the PC of a student who has none'::text,
    'Priya Rao'::text, coalesce(txt,'(not chosen)'), (case when txt = 'Priya Rao' then 'PASS' else 'FAIL' end)::text;

  begin
    insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
    values (t_id, s_id, 'english', now() - interval '1 hour', 'completed')
    returning id into sess;
    txt := 'booked';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '2 booking'::text,'and once they have one, they can be'::text,'booked'::text,txt,
    (case when txt='booked' then 'PASS' else 'FAIL' end)::text;

  begin perform assign_student_pc(s_id, omar.id); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '3 choosing'::text,'a teacher cannot change a PC already chosen'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform assign_student_pc(o_id, x_id); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '3 choosing'::text,'a teacher is not a PC because their id was sent'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform assign_student_pc(o_id, gone.id); txt := 'chosen';
  exception when others then txt := 'refused'; end;
  return query select '3 choosing'::text,'nor is a suspended PC'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- The other student goes to the other PC, and gets a session of their own:
  -- the one the first PC must not be able to see.
  perform assign_student_pc(o_id, omar.id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, o_id, 'english', now() - interval '2 hours', 'completed')
  returning id into osess;

  perform __pc_seat(a_id);
  begin perform assign_student_pc(s_id, omar.id); txt := 'changed';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  perform __pc_off();
  select pc into txt from profiles where id = s_id and pc_id = omar.id;
  return query select '3 choosing'::text,'an admin can change it, and the name follows'::text,
    'Omar Haddad'::text, coalesce(txt,'(unchanged)'), (case when txt = 'Omar Haddad' then 'PASS' else 'FAIL' end)::text;

  perform __pc_seat(a_id);
  perform assign_student_pc(s_id, priya.id);

  -- A PC correcting their own name: every student of theirs is printed with it.
  perform __pc_seat(priya.id);
  update profiles set full_name = 'Priya R. Rao' where id = priya.id;
  perform __pc_off();
  select pc into txt from profiles where id = s_id;
  return query select '3 choosing'::text,'a PC renamed is renamed beside their students'::text,
    'Priya R. Rao'::text, coalesce(txt,'(null)'), (case when txt = 'Priya R. Rao' then 'PASS' else 'FAIL' end)::text;
  update profiles set full_name = 'Priya Rao' where id = priya.id;

  -- A student with a sign-in of their own does not choose who reads their work.
  perform __pc_seat(s_id);
  begin update profiles set pc_id = omar.id where id = s_id; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '3 choosing'::text,'a student cannot choose their own PC'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  begin update profiles set pc = 'Anybody' where id = s_id; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '3 choosing'::text,'or rename the one they have'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 4. the list ============
  select count(*) into n from profiles where id in (priya.id, omar.id);
  return query select '4 list'::text,'a student reads no PC, their own included'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  perform __pc_seat(t_id);
  select count(*) into n from profiles where id in (priya.id, omar.id);
  return query select '4 list'::text,'a teacher reads the PCs, to choose one'::text,'2'::text,n::text,
    (case when n=2 then 'PASS' else 'FAIL' end)::text;
  perform __pc_off();

  -- ============ the session the PC reads ============
  -- Written as the migration role: the rows a lesson and its write-up leave,
  -- without running the lesson. Three questions of our own, so the contract
  -- does not depend on the bank being loaded.
  insert into questions (subject, stem, difficulty, target_seconds)
  values ('english', 'PC check: the one that was asked', 'easy', 60) returning id into q1;
  insert into questions (subject, stem, difficulty) values ('english', 'PC check: the one still staged', 'easy')
  returning id into q2;
  insert into questions (subject, stem, difficulty) values ('english', 'PC check: never put up', 'easy')
  returning id into q3;
  insert into question_options (question_id, label, body)
  values (q1,'A','first'),(q1,'B','second'),(q2,'A','first'),(q2,'B','second'),(q3,'A','first'),(q3,'B','second');
  insert into question_keys (question_id, correct_option, explanation)
  values (q1,'A','Because.'),(q2,'B','Because.'),(q3,'A','Because.');

  insert into session_items (session_id, question_id, student_id, sequence_no, asked_no, status,
                             published_at, first_viewed_at, answered_at, selected_option)
  values (sess, q1, s_id, 1, 1, 'answered', now(), now(), now(), 'A')
  returning id into it1;
  insert into session_items (session_id, question_id, student_id, sequence_no, status)
  values (sess, q2, s_id, 2, 'staged')
  returning id into it2;
  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds, diagnosis)
  values (it1, true, 42, 'solid_reasoning');

  insert into session_transcripts (session_id, source, body) values (sess, 'fathom', body1);
  insert into session_domain_notes (session_id, domain, performance, strengths, gaps, targets)
  values (sess, 'information_and_ideas', 'tick', 'Reads closely.', 'Rushes inference.', 'Slow down.');
  insert into session_reports (session_id, teacher_reflection, form_submitted_at)
  values (sess, 'A good first session.', now() - interval '1 hour');
  insert into session_context_extractions (session_id, body, drops, transcript_md5, model, offset_seconds)
  values (sess, '{"questions":[],"session":{"domainEvidence":[]}}', '[]', md5(body1), 'contract', 0);

  -- ============ 5. what the PC reads ============
  perform __pc_seat(priya.id);

  return query select '5 reading'::text,'a PC is a PC, not a teacher'::text,'pc, not staff'::text,
    (case when is_pc() then 'pc' else 'not pc' end) || ', ' || (case when is_teacher() then 'staff' else 'not staff' end),
    (case when is_pc() and not is_teacher() then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from profiles where id = s_id;
  return query select '5 reading'::text,'their student'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from profiles where id = t_id;
  return query select '5 reading'::text,'the teacher who taught them'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from profiles where id in (o_id, x_id, omar.id);
  return query select '5 reading'::text,'not another PC''s student, a stranger teacher or another PC'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from sessions where id = sess;
  return query select '5 reading'::text,'the session'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from sessions where id = osess;
  return query select '5 reading'::text,'not another PC''s student''s session'::text,'0'::text,n::text,(case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where id = it1;
  return query select '5 reading'::text,'the question that was asked'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from session_items where id = it2;
  return query select '5 reading'::text,'not the one still staged'::text,'0'::text,n::text,(case when n=0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_item_assessments where session_item_id = it1;
  return query select '5 reading'::text,'its assessment — right or wrong, the time, the diagnosis'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from questions where id = q1;
  return query select '5 reading'::text,'the question itself, and its options'::text,'1 + 2'::text,
    n::text || ' + ' || (select count(*) from question_options where question_id = q1)::text,
    (case when n = 1 and (select count(*) from question_options where question_id = q1) = 2 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from questions where id in (q2, q3);
  return query select '5 reading'::text,'not a staged question or one never put up'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from question_keys where question_id in (q1, q2, q3);
  return query select '5 reading'::text,'never the answer key'::text,'0'::text,n::text,(case when n=0 then 'PASS' else 'FAIL' end)::text;

  select (select count(*) from session_domain_notes where session_id = sess)
       + (select count(*) from session_reports where session_id = sess)
       + (select count(*) from session_transcripts where session_id = sess)
       + (select count(*) from session_context_extractions where session_id = sess)
    into n;
  return query select '5 reading'::text,'the form, the report, the transcript and the reading'::text,'4'::text,n::text,
    (case when n=4 then 'PASS' else 'FAIL' end)::text;

  select (select count(*) from session_domain_notes where session_id = osess)
       + (select count(*) from session_reports where session_id = osess)
       + (select count(*) from session_items where session_id = osess)
    into n;
  return query select '5 reading'::text,'none of it for another PC''s student'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  -- ============ 6. and only reads ============
  update sessions set title = 'Mine now' where id = sess;
  get diagnostics n = row_count;
  update session_reports set summary = 'Mine now' where session_id = sess;
  get diagnostics v_after = row_count;
  n := n + v_after;
  update session_items set selected_option = 'B' where id = it1;
  get diagnostics v_after = row_count;
  n := n + v_after;
  delete from session_transcripts where session_id = sess;
  get diagnostics v_after = row_count;
  n := n + v_after;
  return query select '6 read only'::text,'a PC changes no session, report, answer or transcript'::text,'0 rows'::text,
    n::text || ' rows', (case when n=0 then 'PASS' else 'FAIL' end)::text;

  begin
    insert into session_domain_notes (session_id, domain, strengths) values (sess, 'craft_and_structure', 'Mine');
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '6 read only'::text,'and writes no form'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  for txt in select unnest(array['generate_report', 'publish_report', 'submit_diagnostic_form',
                                 'teacher_start_session', 'create_student', 'assign_student_pc']) loop
    begin
      case txt
        when 'generate_report' then perform generate_report(sess);
        when 'publish_report' then perform publish_report(sess);
        when 'submit_diagnostic_form' then perform submit_diagnostic_form(sess);
        when 'teacher_start_session' then perform teacher_start_session(sess);
        when 'create_student' then perform create_student('Pat', 'Pupil', priya.id);
        when 'assign_student_pc' then perform assign_student_pc(o_id, priya.id);
      end case;
      ok := false;
    exception when others then ok := true; end;
    return query select '6 read only'::text, 'and runs nothing: ' || txt, 'refused'::text,
      (case when ok then 'refused' else 'ran' end), (case when ok then 'PASS' else 'FAIL' end)::text;
  end loop;

  perform __pc_seat(omar.id);
  select count(*) into n from sessions where id = sess;
  return query select '5 reading'::text,'another PC reads none of it'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  perform __pc_off();

  -- Suspended is off, for a PC as for a teacher: every policy asks is_active.
  update profiles set is_active = false, suspended_at = now() where id = priya.id;
  perform __pc_seat(priya.id);
  select (select count(*) from sessions where id = sess) + (select count(*) from profiles where id = s_id) into n;
  return query select '6 read only'::text,'a suspended PC reads nothing at all'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  perform __pc_off();
  update profiles set is_active = true, suspended_at = null where id = priya.id;

  -- ============ 7. the email ============
  -- Point the trigger at an address that is never called: the request it
  -- queues is removed below, before this statement commits and pg_net sees it.
  select value into v_url from app_config where key = 'functions_url';
  insert into app_config (key, value) values ('functions_url', 'https://functions.example.test/functions/v1')
  on conflict (key) do update set value = excluded.value;

  select count(*) into v_before from net.http_request_queue where url like '%/notify_pc_report';

  perform __pc_seat(t_id);
  update session_reports set summary = 'Worth reading twice.' where session_id = sess;
  perform __pc_off();
  select count(*) into v_after from net.http_request_queue where url like '%/notify_pc_report';
  return query select '7 email'::text,'saving the report does not send it'::text,'0 queued'::text,
    (v_after - v_before)::text || ' queued', (case when v_after = v_before then 'PASS' else 'FAIL' end)::text;

  perform __pc_seat(t_id);
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  perform __pc_off();
  select count(*) into v_after from net.http_request_queue
   where url = 'https://functions.example.test/functions/v1/notify_pc_report'
     and convert_from(body, 'utf8')::jsonb ->> 'session_id' = sess::text;
  return query select '7 email'::text,'generating it queues the email to the PC'::text,'generated, 1 queued'::text,
    txt || ', ' || v_after || ' queued', (case when txt = 'generated' and v_after = 1 then 'PASS' else 'FAIL' end)::text;

  select generated_at into v_gen from session_reports where session_id = sess;

  ok := claim_report_email(sess, v_gen, priya.id, 'pcx.priya@example.test', false);
  return query select '7 email'::text,'a generation is claimed once'::text,'claimed'::text,
    (case when ok then 'claimed' else 'refused' end), (case when ok then 'PASS' else 'FAIL' end)::text;
  ok := claim_report_email(sess, v_gen, priya.id, 'pcx.priya@example.test', false);
  return query select '7 email'::text,'and a second call for it finds it taken'::text,'refused'::text,
    (case when ok then 'claimed' else 'refused' end), (case when not ok then 'PASS' else 'FAIL' end)::text;
  ok := claim_report_email(sess, v_gen, priya.id, 'pcx.priya@example.test', true);
  select attempts into n from report_emails where session_id = sess and generated_at = v_gen;
  return query select '7 email'::text,'unless somebody asks for it again'::text,'claimed, attempt 2'::text,
    (case when ok then 'claimed' else 'refused' end) || ', attempt ' || n,
    (case when ok and n = 2 then 'PASS' else 'FAIL' end)::text;
  update report_emails set status = 'failed', detail = 'the mail server said no'
   where session_id = sess and generated_at = v_gen;
  ok := claim_report_email(sess, v_gen, priya.id, 'pcx.priya@example.test', false);
  return query select '7 email'::text,'and a failed one can be retried'::text,'claimed'::text,
    (case when ok then 'claimed' else 'refused' end), (case when ok then 'PASS' else 'FAIL' end)::text;
  update report_emails set status = 'sent' where session_id = sess and generated_at = v_gen;

  perform __pc_seat(t_id);
  select count(*) into n from report_emails where session_id = sess;
  return query select '7 email'::text,'the session''s teacher reads the log'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;
  begin
    insert into report_emails (session_id, generated_at, status) values (sess, now() + interval '1 day', 'sent');
    txt := 'written';
  exception when others then txt := 'refused'; end;
  update report_emails set status = 'failed' where session_id = sess;
  get diagnostics n = row_count;
  return query select '7 email'::text,'and cannot write it'::text,'refused, 0 rows'::text,
    txt || ', ' || n || ' rows', (case when txt = 'refused' and n = 0 then 'PASS' else 'FAIL' end)::text;
  begin perform claim_report_email(sess, now(), priya.id, 'someone@example.test', true); txt := 'claimed';
  exception when others then txt := 'refused'; end;
  return query select '7 email'::text,'nor claim a send'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  perform __pc_seat(priya.id);
  select count(*) into n from report_emails where session_id = sess;
  return query select '7 email'::text,'the PC reads the log'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  perform __pc_seat(a_id);
  select count(*) into n from report_emails where session_id = sess;
  return query select '7 email'::text,'and so does an admin'::text,'1'::text,n::text,(case when n=1 then 'PASS' else 'FAIL' end)::text;
  perform __pc_seat(x_id);
  select count(*) into n from report_emails where session_id = sess;
  return query select '7 email'::text,'but not another teacher'::text,'0'::text,n::text,(case when n=0 then 'PASS' else 'FAIL' end)::text;
  perform __pc_seat(s_id);
  select count(*) into n from report_emails where session_id = sess;
  return query select '7 email'::text,'nor the student'::text,'0'::text,n::text,(case when n=0 then 'PASS' else 'FAIL' end)::text;
  perform __pc_off();

  -- Cleanup. Nothing queued here may be sent, and the address goes back.
  delete from net.http_request_queue where url = 'https://functions.example.test/functions/v1/notify_pc_report';
  if v_url is null then
    delete from app_config where key = 'functions_url';
  else
    update app_config set value = v_url where key = 'functions_url';
  end if;

  -- The serial numbers the accounts consumed stay consumed; see the note in
  -- level_session.sql for why they are not rewound.
  delete from sessions where id in (sess, osess, stray);
  delete from questions where id in (q1, q2, q3);
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand.
  delete from profiles where id in (t_id, x_id, s_id, o_id, a_id, z_id, priya.id, omar.id, gone.id);
  delete from auth.users where id in (t_id, x_id, s_id, o_id, a_id, z_id, priya.id);
end $fn$;

select * from public.__pc_access_check();

drop function public.__pc_access_check();
drop function public.__pc_seat(uuid);
drop function public.__pc_off();
