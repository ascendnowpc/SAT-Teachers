-- ============================================================================
--  The admin, on every session
--
--    psql "$DATABASE_URL" -f supabase/tests/admin_access.sql
--
--  0050 gave an admin what a session's teacher has, on every session: every
--  RPC that runs one and every row it writes, publishing included. 0051 made a
--  reading of the recording belong to the form it was taken against as well as
--  to the transcript. What has to hold:
--
--    * an admin runs a session they do not teach: lets the student in early,
--      starts it, moves the level, chooses the question, answers for the
--      student, reveals the answers, diagnoses, ends it, edits the session
--    * an admin writes the whole write-up: the transcript (in, corrected,
--      deleted), the grid and the comments, and handing the form in — under
--      the form's own checks — and form_submitted_by says so
--    * the transcript is signed and re-dated when its text changes, and not
--      when the same text is saved again
--    * an admin generates the report once the form is in, generated_by says
--      who pressed it, and the session's teacher still can
--    * a reading is refused once the transcript has changed after it, or the
--      form has been handed in again after it — whoever asks; it is dated when
--      it is stored, whatever it is given
--    * generating without the recording removes a stale reading, and leaves a
--      current one where it is
--    * an admin publishes and unpublishes, through the RPCs and by writing the
--      report row; the session's teacher still can
--    * another teacher, a student and an anonymous caller can do none of it
--    * the RPCs are signed-in only; the internal functions reachable by nobody
--
--  The console rows need the English tests loaded (0026) and read SKIP without
--  them. Every row must read PASS. Cleans up after itself, and is safe against
--  a real database: it is one statement, so a failure rolls back what it made.
-- ============================================================================

-- A question by its place in one of the live tests.
create or replace function public.__admin_q(p_subject text, p_level text, p_pos int)
returns uuid language sql stable as $$
  select qi.question_id
    from question_set_items qi join question_sets qs on qs.id = qi.set_id
   where qs.subject = p_subject and qs.level = p_level and qs.is_active and qi.position = p_pos
$$;

create or replace function public.__admin_access_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();          -- the session's teacher
  x_id uuid := gen_random_uuid();          -- another teacher
  s_id uuid := gen_random_uuid();          -- the student
  a_id uuid := gen_random_uuid();          -- the admin
  sess uuid; live uuid; it uuid; n int; txt text; ok boolean; who uuid; at timestamptz;
  easy1 uuid; med7 uuid;
  body1 text := '@0:05 - Malya Rao' || chr(10) || 'Let us start with question one.';
  body2 text := '@0:05 - Malya Rao' || chr(10) || 'Let us start with question one, Batu.';
  d text;
begin
  -- Read as the migration role: question_set_items is staff-only, and these
  -- are the expectations, not something any seat is being tested on.
  easy1 := __admin_q('english','easy',1);
  med7  := __admin_q('english','medium',7);

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'adm.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'adm.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'adm.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Batu Ozcelik"}'),
    (a_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'adm.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');

  -- Teachers arrive pending (0044) and admins are made in the SQL editor. With
  -- no JWT this is the migration role, which the identity guard lets through.
  update profiles set is_active = true where id in (t_id, x_id);
  update profiles set role = 'admin', is_active = true where id = a_id;

  -- Two sessions of the teacher's, neither of them the admin's: one to run
  -- from the console, not due for an hour; one that is over, to write up.
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, s_id, 'english', now() + interval '1 hour')
  returning id into live;

  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, s_id, 'english', now() - interval '2 hours', 'completed')
  returning id into sess;

  -- ============ 1. the console ============
  if easy1 is null or med7 is null then
    return query select '1 console'::text,'the English tests are loaded'::text,'loaded'::text,
      'missing'::text,'SKIP'::text;
  else
    perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
    execute 'set local role authenticated';
    begin perform set_session_open_early(live, true); txt := 'opened';
    exception when others then txt := 'refused'; end;
    execute 'reset role';
    return query select '1 console'::text,'another teacher cannot let the student in'::text,'refused'::text,txt,
      (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

    perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
    execute 'set local role authenticated';

    begin perform set_session_open_early(live, true); txt := 'opened';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    return query select '1 console'::text,'an admin lets the student in early'::text,'opened'::text,txt,
      (case when txt='opened' then 'PASS' else 'FAIL' end)::text;

    begin perform teacher_start_session(live); txt := 'started';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select count(*) into n from session_items where session_id = live and status = 'published';
    return query select '1 console'::text,'starts it for the student, one question up'::text,'started, 1'::text,
      txt || ', ' || n, (case when txt='started' and n=1 then 'PASS' else 'FAIL' end)::text;

    begin perform set_session_level(live, 'medium'); txt := 'moved';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select level into d from sessions where id = live;
    return query select '1 console'::text,'moves the level'::text,'moved, medium'::text,
      txt || ', ' || coalesce(d,'?'), (case when txt='moved' and d='medium' then 'PASS' else 'FAIL' end)::text;

    begin perform teacher_choose_question(live, med7, true); txt := 'chosen';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select question_id, id into who, it from session_items where session_id = live and status = 'published';
    return query select '1 console'::text,'chooses the question'::text,'chosen, on screen'::text,
      txt || (case when who = med7 then ', on screen' else ', not up' end),
      (case when txt='chosen' and who = med7 then 'PASS' else 'FAIL' end)::text;

    begin perform teacher_answer_item(it, 'A'::answer_option, '{}'::answer_option[], 2::smallint, null); txt := 'answered';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select status::text into d from session_items where id = it;
    return query select '1 console'::text,'answers for the student'::text,'answered'::text,
      txt || ', ' || d, (case when txt='answered' and d='answered' then 'PASS' else 'FAIL' end)::text;

    -- Publish results: the button that met "not your session" first.
    begin n := reveal_answered_items(live); txt := 'revealed';
    exception when others then txt := 'refused: ' || sqlerrm; n := 0; end;
    select status::text into d from session_items where id = it;
    return query select '1 console'::text,'publishes the results to the student'::text,'revealed'::text,
      txt || ', ' || d, (case when txt='revealed' and d='revealed' then 'PASS' else 'FAIL' end)::text;

    begin perform set_diagnosis(it, 'concept_gap', 'Mixed up the two claims.'); txt := 'diagnosed';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select diagnosis into d from session_item_assessments where session_item_id = it;
    return query select '1 console'::text,'diagnoses a question'::text,'concept_gap'::text,coalesce(d, txt),
      (case when d='concept_gap' then 'PASS' else 'FAIL' end)::text;

    begin perform teacher_finish_session(live); txt := 'ended';
    exception when others then txt := 'refused: ' || sqlerrm; end;
    select status::text into d from sessions where id = live;
    return query select '1 console'::text,'ends it'::text,'completed'::text,coalesce(d, txt),
      (case when d='completed' then 'PASS' else 'FAIL' end)::text;

    update sessions set title = 'Picked up by the admin' where id = live;
    select count(*) into n from sessions where id = live and title = 'Picked up by the admin';
    return query select '1 console'::text,'edits the session itself'::text,'1'::text,n::text,
      (case when n=1 then 'PASS' else 'FAIL' end)::text;
    execute 'reset role';

    perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
    execute 'set local role authenticated';
    begin perform set_diagnosis(it, 'lucky_guess', null); txt := 'diagnosed';
    exception when others then txt := 'refused'; end;
    execute 'reset role';
    return query select '1 console'::text,'another teacher still cannot touch it'::text,'refused'::text,txt,
      (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

    perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
    execute 'set local role authenticated';
    begin perform set_diagnosis(it, 'lucky_guess', null); txt := 'diagnosed';
    exception when others then txt := 'refused'; end;
    execute 'reset role';
    return query select '1 console'::text,'nor can the student'::text,'refused'::text,txt,
      (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  end if;

  -- ============ 2. the recording ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  begin
    insert into session_transcripts (session_id, source, filename, body)
    values (sess, 'fathom', 'call.txt', body1);
    txt := 'added';
  exception when others then txt := 'refused: ' || sqlerrm;
  end;
  return query select '2 recording'::text,'an admin puts in a transcript for a session they do not teach'::text,
    'added'::text, txt, (case when txt='added' then 'PASS' else 'FAIL' end)::text;

  select uploaded_by into who from session_transcripts where session_id = sess;
  return query select '2 recording'::text,'and it is signed by them'::text,'the admin'::text,
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
  return query select '2 recording'::text,'an admin corrects it'::text,'corrected'::text,
    (case when txt = body2 then 'corrected' else 'unchanged' end),
    (case when txt = body2 then 'PASS' else 'FAIL' end)::text;
  return query select '2 recording'::text,'which signs and re-dates it'::text,'the admin, now'::text,
    (case when who = a_id and at = now() then 'the admin, now' else 'not stamped' end),
    (case when who = a_id and at = now() then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- The same text saved again, as the form does on every save.
  update session_transcripts set created_at = now() - interval '1 day' where session_id = sess;
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  insert into session_transcripts (session_id, source, filename, body)
  values (sess, 'fathom', 'call.txt', body2)
  on conflict (session_id) do update set body = excluded.body, filename = excluded.filename;
  select uploaded_by, created_at into who, at from session_transcripts where session_id = sess;
  return query select '2 recording'::text,'the same text saved again is not a new recording'::text,
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
  return query select '2 recording'::text,'another teacher cannot write it'::text,'untouched'::text,
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
  return query select '2 recording'::text,'nor can the student'::text,'untouched'::text,
    (case when d = body2 then 'untouched' else 'OVERWRITTEN' end),
    (case when d = body2 then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. the form ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '3 form'::text,'no report before the form is in'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- The form's own checks stand for an admin: half a grid is refused.
  begin
    insert into session_domain_notes (session_id, domain, performance, strengths, gaps, targets)
    values (sess, 'information_and_ideas', 'tick', 'Reads closely.', 'Rushes.', 'Slow down.');
    insert into session_reports (session_id, teacher_reflection) values (sess, 'A good first session.');
  exception when others then null;
  end;
  begin perform submit_diagnostic_form(sess); txt := 'submitted';
  exception when others then txt := 'refused'; end;
  return query select '3 form'::text,'an admin cannot hand in half a grid'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- The rest of the grid, the way the form saves it: an upsert over all four.
  begin
    foreach d in array array['information_and_ideas','craft_and_structure',
                             'expression_of_ideas','standard_english_conventions'] loop
      insert into session_domain_notes (session_id, domain, performance, strengths, gaps, targets)
      values (sess, d, 'tick', 'Reads closely.', 'Rushes the last line.', 'Slow down on the stem.')
      on conflict (session_id, domain) do update
        set performance = excluded.performance, strengths = excluded.strengths,
            gaps = excluded.gaps, targets = excluded.targets;
    end loop;
    insert into session_reports (session_id, teacher_reflection) values (sess, 'A steady first session.')
    on conflict (session_id) do update set teacher_reflection = excluded.teacher_reflection;
    txt := 'saved';
  exception when others then txt := 'refused: ' || sqlerrm;
  end;
  return query select '3 form'::text,'an admin saves the grid and the comments'::text,'saved'::text,txt,
    (case when txt='saved' then 'PASS' else 'FAIL' end)::text;

  begin perform submit_diagnostic_form(sess); txt := 'submitted';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '3 form'::text,'and hands the form in'::text,'submitted'::text,txt,
    (case when txt='submitted' then 'PASS' else 'FAIL' end)::text;

  select form_submitted_by into who from session_reports where session_id = sess;
  return query select '3 form'::text,'which says who handed it in'::text,'the admin'::text,
    (case when who = a_id then 'the admin' else coalesce(who::text,'nobody') end),
    (case when who = a_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  update session_domain_notes set gaps = 'Not mine' where session_id = sess;
  begin perform submit_diagnostic_form(sess); txt := 'submitted';
  exception when others then txt := 'refused'; end;
  execute 'reset role';
  select count(*) into n from session_domain_notes where session_id = sess and gaps = 'Not mine';
  return query select '3 form'::text,'another teacher can neither write the grid nor hand it in'::text,
    'untouched, refused'::text, (case when n = 0 then 'untouched, ' else 'WRITTEN, ' end) || txt,
    (case when n = 0 and txt = 'refused' then 'PASS' else 'FAIL' end)::text;

  -- ============ 4. the report ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '4 report'::text,'an admin generates it once the form is in'::text,'generated'::text,txt,
    (case when txt='generated' then 'PASS' else 'FAIL' end)::text;

  select generated_by into who from session_reports where session_id = sess;
  return query select '4 report'::text,'and the report says who pressed it'::text,'the admin'::text,
    (case when who = a_id then 'the admin' else coalesce(who::text,'nobody') end),
    (case when who = a_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess);
  exception when others then null; end;
  select generated_by into who from session_reports where session_id = sess;
  return query select '4 report'::text,'the teacher still can, and it says so'::text,'the teacher'::text,
    (case when who = t_id then 'the teacher' else coalesce(who::text,'nobody') end),
    (case when who = t_id then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '4 report'::text,'another teacher cannot'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '4 report'::text,'nor can the student'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ 5. the reading ============
  -- Stored the way the edge function stores it, on the service role, and
  -- asking for a day-old date: the table dates it itself.
  perform set_config('request.jwt.claims', '', true);
  insert into session_context_extractions (session_id, body, transcript_md5, model, offset_seconds, created_at)
  values (sess, '{}'::jsonb, md5(body2), 'test', 0, now() - interval '1 day');
  select created_at into at from session_context_extractions where session_id = sess;
  return query select '5 reading'::text,'a reading is dated when it is stored'::text,'now'::text,
    (case when at = now() then 'now' else at::text end),
    (case when at = now() then 'PASS' else 'FAIL' end)::text;

  -- Taken again: an upsert that does not mention the date, as the function's.
  insert into session_context_extractions (session_id, body, transcript_md5, model, offset_seconds)
  values (sess, '{}'::jsonb, md5(body2), 'test', 0)
  on conflict (session_id) do update set body = excluded.body, model = excluded.model;
  update session_context_extractions set created_at = now() - interval '1 day' where session_id = sess;
  select created_at into at from session_context_extractions where session_id = sess;
  return query select '5 reading'::text,'and dated again whenever it is written'::text,'now'::text,
    (case when at = now() then 'now' else at::text end),
    (case when at = now() then 'PASS' else 'FAIL' end)::text;

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '5 reading'::text,'a reading of this transcript and this form is used'::text,'generated'::text,
    txt, (case when txt='generated' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- The form handed in again a minute after the reading. Moved by hand, as the
  -- migration role, because now() does not move inside this transaction.
  update session_reports set form_submitted_at = now() + interval '1 minute' where session_id = sess;

  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := sqlerrm; end;
  return query select '5 reading'::text,'a reading older than the form handed in again is refused'::text,
    'refused: form handed in again'::text,
    (case when txt like '%handed in again%' then 'refused: form handed in again' else txt end),
    (case when txt like '%handed in again%' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := 'refused'; end;
  return query select '5 reading'::text,'for the teacher too'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Going ahead without the recording: the stale reading goes with it.
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess, true); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  execute 'reset role';
  select count(*) into n from session_context_extractions where session_id = sess;
  return query select '5 reading'::text,'generating without it removes the stale reading'::text,
    'generated, 0 readings'::text, txt || ', ' || n || ' readings',
    (case when txt='generated' and n=0 then 'PASS' else 'FAIL' end)::text;

  -- A current reading is not stale, and going ahead without one leaves it.
  update session_reports set form_submitted_at = now() - interval '1 minute' where session_id = sess;
  insert into session_context_extractions (session_id, body, transcript_md5, model, offset_seconds)
  values (sess, '{}'::jsonb, md5(body2), 'test', 0)
  on conflict (session_id) do update set transcript_md5 = excluded.transcript_md5;
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform generate_report(sess, true); txt := 'generated';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  execute 'reset role';
  select count(*) into n from session_context_extractions where session_id = sess;
  return query select '5 reading'::text,'and leaves a current one where it is'::text,'generated, 1 reading'::text,
    txt || ', ' || n || ' reading', (case when txt='generated' and n=1 then 'PASS' else 'FAIL' end)::text;

  -- The transcript corrected after the reading: of another recording.
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  update session_transcripts set body = body1 where session_id = sess;
  begin perform generate_report(sess); txt := 'generated';
  exception when others then txt := sqlerrm; end;
  return query select '5 reading'::text,'a reading of the old transcript is refused after an edit'::text,
    'refused: transcript changed'::text,
    (case when txt like '%transcript changed%' then 'refused: transcript changed' else txt end),
    (case when txt like '%transcript changed%' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ 6. publishing ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform publish_report(sess); txt := 'published';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  select status::text into d from session_reports where session_id = sess;
  return query select '6 publishing'::text,'an admin publishes the report'::text,'published'::text,
    coalesce(d, txt), (case when d='published' then 'PASS' else 'FAIL' end)::text;

  begin perform unpublish_report(sess); txt := 'unpublished';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  select status::text into d from session_reports where session_id = sess;
  return query select '6 publishing'::text,'and takes it back'::text,'draft'::text,
    coalesce(d, txt), (case when d='draft' then 'PASS' else 'FAIL' end)::text;

  begin
    update session_reports set status = 'published', published_at = now() where session_id = sess;
    txt := 'written';
  exception when others then txt := 'refused: ' || sqlerrm;
  end;
  select status::text into d from session_reports where session_id = sess;
  return query select '6 publishing'::text,'or by writing the row directly'::text,'published'::text,
    coalesce(d, txt), (case when d='published' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform unpublish_report(sess); perform publish_report(sess); txt := 'published';
  exception when others then txt := 'refused: ' || sqlerrm; end;
  return query select '6 publishing'::text,'the teacher still can'::text,'published'::text,txt,
    (case when txt='published' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform unpublish_report(sess); txt := 'unpublished';
  exception when others then txt := 'refused'; end;
  execute 'reset role';
  return query select '6 publishing'::text,'another teacher cannot'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform unpublish_report(sess); txt := 'unpublished';
  exception when others then txt := 'refused'; end;
  execute 'reset role';
  return query select '6 publishing'::text,'nor can the student'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  -- publish_report is still granted to PUBLIC (see the README's note on 0018);
  -- the gate is what refuses a caller with no JWT, and widening it for an
  -- admin must not have widened it for nobody.
  perform set_config('request.jwt.claims', '', true);
  execute 'set local role anon';
  begin perform unpublish_report(sess); txt := 'unpublished';
  exception when others then txt := 'refused'; end;
  execute 'reset role';
  select status::text into d from session_reports where session_id = sess;
  return query select '6 publishing'::text,'nor can an anonymous caller'::text,'refused, published'::text,
    txt || ', ' || d, (case when txt='refused' and d='published' then 'PASS' else 'FAIL' end)::text;

  -- ============ 7. deleting ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  delete from session_transcripts where session_id = sess;
  execute 'reset role';
  select count(*) into n from session_transcripts where session_id = sess;
  return query select '7 rows'::text,'an admin can delete a transcript, as its teacher can'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  -- ============ 8. who can even ask ============
  for txt in select unnest(array['generate_report(uuid,boolean)', 'submit_diagnostic_form(uuid)']) loop
    ok := has_function_privilege('anon', 'public.'||txt, 'execute');
    return query select '8 grants'::text, txt || ' — signed in only', 'no anon'::text,
      (case when ok then 'anon too!' else 'no anon' end),(case when ok then 'FAIL' else 'PASS' end)::text;
  end loop;

  for txt in select unnest(array['assert_session_teacher(uuid)', 'assert_session_teacher_or_admin(uuid)',
                                 'stamp_transcript()', 'stamp_reading()']) loop
    ok := has_function_privilege('anon', 'public.'||txt, 'execute')
       or has_function_privilege('authenticated', 'public.'||txt, 'execute');
    return query select '8 grants'::text, txt || ' — internal', 'nobody'::text,
      (case when ok then 'reachable' else 'nobody' end),(case when ok then 'FAIL' else 'PASS' end)::text;
  end loop;

  -- Cleanup. The serial numbers the accounts consumed stay consumed; see the
  -- note in level_session.sql for why they are not rewound.
  delete from sessions where id in (sess, live);
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand.
  delete from profiles where id in (t_id, x_id, s_id, a_id);
  delete from auth.users where id in (t_id, x_id, s_id, a_id);
end $fn$;

select * from public.__admin_access_check();

drop function public.__admin_access_check();
drop function public.__admin_q(text, text, int);
