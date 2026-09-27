-- ============================================================================
--  The admin, the recording and the report
--
--    psql "$DATABASE_URL" -f supabase/tests/admin_recording.sql
--
--  0048 opened two doors in the admin's read-only seat and no others. What has
--  to hold:
--
--    * an admin can put a transcript into a session they do not teach, and
--      change it — but not delete it
--    * the transcript is signed by whoever changed its text, and re-dated; the
--      same text saved again is not a new recording
--    * another teacher and a student can do none of that
--    * an admin can generate the report, and only once the teacher's form is
--      in; generated_by says who pressed it
--    * a reading of a transcript that has since changed is refused, whoever
--      asks — including after an admin's edit
--    * everything else stays read-only for an admin: the form, the report's
--      text, submitting the form and publishing the report
--    * generate_report is signed-in only; the two internal functions are
--      reachable by nobody
--
--  Every row must read PASS. Cleans up after itself, and is safe against a real
--  database: it is one statement, so a failure rolls back what it made.
-- ============================================================================

create or replace function public.__admin_recording_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();          -- the session's teacher
  x_id uuid := gen_random_uuid();          -- another teacher
  s_id uuid := gen_random_uuid();          -- the student
  a_id uuid := gen_random_uuid();          -- the admin
  sess uuid; n int; txt text; ok boolean; who uuid; at timestamptz;
  body1 text := '@0:05 - Malya Rao' || chr(10) || 'Let us start with question one.';
  body2 text := '@0:05 - Malya Rao' || chr(10) || 'Let us start with question one, Batu.';
  d text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'rec.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'rec.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'rec.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Batu Ozcelik"}'),
    (a_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'rec.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');

  -- Teachers arrive pending (0044) and admins are made in the SQL editor. With
  -- no JWT this is the migration role, which the identity guard lets through.
  update profiles set is_active = true where id in (t_id, x_id);
  update profiles set role = 'admin', is_active = true where id = a_id;

  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, s_id, 'english', now() - interval '2 hours', 'completed')
  returning id into sess;

  -- ============ 1. the recording ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  begin
    insert into session_transcripts (session_id, source, filename, body)
    values (sess, 'fathom', 'call.txt', body1);
    txt := 'added';
  exception when others then txt := 'refused: ' || sqlerrm;
  end;
  return query select '1 recording'::text,'an admin puts in a transcript for a session they do not teach'::text,
    'added'::text, txt, (case when txt='added' then 'PASS' else 'FAIL' end)::text;

  select uploaded_by into who from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'and it is signed by them'::text,'the admin'::text,
    (case when who = a_id then 'the admin' else coalesce(who::text,'nobody') end),
    (case when who = a_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Back-dated, so a re-dating can be seen: this whole check is one
  -- transaction, and now() does not move inside one.
  perform set_config('request.jwt.claims', '', true);
  update session_transcripts set created_at = now() - interval '1 day', uploaded_by = t_id
   where session_id = sess;

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  update session_transcripts set body = body2 where session_id = sess;
  select body, uploaded_by, created_at into txt, who, at from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'an admin corrects it'::text,'corrected'::text,
    (case when txt = body2 then 'corrected' else 'unchanged' end),
    (case when txt = body2 then 'PASS' else 'FAIL' end)::text;
  return query select '1 recording'::text,'which signs and re-dates it'::text,'the admin, now'::text,
    (case when who = a_id and at = now() then 'the admin, now' else 'not stamped' end),
    (case when who = a_id and at = now() then 'PASS' else 'FAIL' end)::text;

  delete from session_transcripts where session_id = sess;
  execute 'reset role';
  select count(*) into n from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'but cannot delete it'::text,'still there'::text,
    (case when n = 1 then 'still there' else 'deleted' end),
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  -- The same text saved again, as the teacher's form does on every save.
  update session_transcripts set created_at = now() - interval '1 day' where session_id = sess;
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  insert into session_transcripts (session_id, source, filename, body)
  values (sess, 'fathom', 'call.txt', body2)
  on conflict (session_id) do update set body = excluded.body, filename = excluded.filename;
  select uploaded_by, created_at into who, at from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'the same text saved again is not a new recording'::text,
    'unchanged'::text,
    (case when who = a_id and at < now() then 'unchanged' else 'stamped again' end),
    (case when who = a_id and at < now() then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    update session_transcripts set body = 'not mine' where session_id = sess;
    insert into session_transcripts (session_id, source, body) values (sess, 'manual', 'not mine')
    on conflict (session_id) do update set body = excluded.body;
    txt := 'wrote';
  exception when others then txt := 'refused';
  end;
  execute 'reset role';
  select body into d from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'another teacher cannot write it'::text,'untouched'::text,
    (case when d = body2 then 'untouched' else 'OVERWRITTEN' end),
    (case when d = body2 then 'PASS' else 'FAIL' end)::text;

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    update session_transcripts set body = 'not mine' where session_id = sess;
    insert into session_transcripts (session_id, source, body) values (sess, 'manual', 'not mine')
    on conflict (session_id) do update set body = excluded.body;
    txt := 'wrote';
  exception when others then txt := 'refused';
  end;
  execute 'reset role';
  select body into d from session_transcripts where session_id = sess;
  return query select '1 recording'::text,'nor can the student'::text,'untouched'::text,
    (case when d = body2 then 'untouched' else 'OVERWRITTEN' end),
    (case when d = body2 then 'PASS' else 'FAIL' end)::text;

  -- ============ 2. the report ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '2 report'::text,'not before the teacher''s form is in'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- The teacher fills the form in and hands it in.
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  foreach d in array array['information_and_ideas','craft_and_structure',
                           'expression_of_ideas','standard_english_conventions'] loop
    insert into session_domain_notes (session_id, domain, performance, strengths, gaps, targets)
    values (sess, d, 'tick', 'Reads closely.', 'Rushes the last line.', 'Slow down on the stem.');
  end loop;
  insert into session_reports (session_id, teacher_reflection) values (sess, 'A good first session.');
  perform submit_diagnostic_form(sess);
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '2 report'::text,'an admin generates it once the form is in'::text,'generated'::text,txt,
    (case when txt='generated' then 'PASS' else 'FAIL' end)::text;

  select generated_by into who from session_reports where session_id = sess;
  return query select '2 report'::text,'and the report says who pressed it'::text,'the admin'::text,
    (case when who = a_id then 'the admin' else coalesce(who::text,'nobody') end),
    (case when who = a_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  perform generate_report(sess);
  select generated_by into who from session_reports where session_id = sess;
  return query select '2 report'::text,'the teacher still can, and it says so'::text,'the teacher'::text,
    (case when who = t_id then 'the teacher' else coalesce(who::text,'nobody') end),
    (case when who = t_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '2 report'::text,'another teacher cannot'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '2 report'::text,'nor can the student'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- A reading of this transcript, as the edge function stores it; then the
  -- admin corrects the transcript, and the reading is of another recording.
  perform set_config('request.jwt.claims', '', true);
  insert into session_context_extractions (session_id, body, transcript_md5, model, offset_seconds)
  values (sess, '{}'::jsonb, md5(body2), 'test', 0);

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  update session_transcripts set body = body1 where session_id = sess;
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '2 report'::text,'a reading of the old transcript is refused after an edit'::text,
    'refused'::text, txt, (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. still a reader everywhere else ============
  update session_reports set teacher_reflection = 'Admin was here' where session_id = sess;
  update session_domain_notes set gaps = 'Admin was here' where session_id = sess;
  execute 'reset role';
  select count(*) into n from session_reports where session_id = sess and teacher_reflection = 'Admin was here';
  return query select '3 reader'::text,'an admin cannot rewrite the teacher''s comments'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  select count(*) into n from session_domain_notes where session_id = sess and gaps = 'Admin was here';
  return query select '3 reader'::text,'nor the grid'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform submit_diagnostic_form(sess); txt := 'submitted';
  exception when others then txt := 'refused'; end;
  return query select '3 reader'::text,'nor hand the form in'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform publish_report(sess); txt := 'published';
  exception when others then txt := 'refused'; end;
  return query select '3 reader'::text,'nor publish the report'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ 4. who can even ask ============
  ok := has_function_privilege('anon', 'public.generate_report(uuid)', 'execute');
  return query select '4 grants'::text,'generate_report — signed in only'::text,'no anon'::text,
    (case when ok then 'anon too!' else 'no anon' end),(case when ok then 'FAIL' else 'PASS' end)::text;

  for txt in select unnest(array['assert_session_teacher_or_admin(uuid)', 'stamp_transcript()']) loop
    ok := has_function_privilege('anon', 'public.'||txt, 'execute')
       or has_function_privilege('authenticated', 'public.'||txt, 'execute');
    return query select '4 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when ok then 'reachable' else 'nobody' end),(case when ok then 'FAIL' else 'PASS' end)::text;
  end loop;

  -- Cleanup. The serial numbers the accounts consumed stay consumed; see the
  -- note in level_session.sql for why they are not rewound.
  delete from sessions where id = sess;
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand.
  delete from profiles where id in (t_id, x_id, s_id, a_id);
  delete from auth.users where id in (t_id, x_id, s_id, a_id);
end $fn$;

select * from public.__admin_recording_check();

drop function public.__admin_recording_check();
