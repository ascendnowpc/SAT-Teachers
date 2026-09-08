-- ============================================================================
--  The link, the roster student, and the teacher who can do it all
--
--    psql "$DATABASE_URL" -f supabase/tests/session_link.sql
--
--  0032–0034 opened three doors that were shut before, and each of them is a
--  door into a student's test. What has to hold:
--
--  0032 / 0036 — a student is a roster row
--    * a teacher can add one, and it gets a display id off the same builder
--    * a student cannot add one
--    * it has no auth user, and never needed one
--    * both names are required, because the id's fourth letter is the
--      surname's initial and a first name alone silently changes what that
--      letter means
--
--  0033 — the session is a link
--    * every session has a token, and no two share one
--    * a wrong token is refused, and says nothing about what exists
--    * the token opens exactly one session: its own
--    * the payload never carries the answer key, and never carries the token
--    * staged questions are not in it — there is still no reading ahead
--    * answering through the link grades and opens the next question
--    * a link cannot be pointed at another session's question
--    * anon — the signed-out role the browser actually uses — can do all of it
--
--  0034 — the teacher has the same verbs
--    * they can open the test, answer on the student's behalf and hand it in
--    * a stranger cannot do any of that to somebody else's session
--
--  0035 — the grants are what they claim to be
--    * the internal functions — the ones that check nothing, on purpose —
--      are reachable by nobody: not anon, not authenticated, publish_one_item
--      (open since 0023) included
--    * the token functions are reachable by anon, which is the whole point
--    * everything else is signed-in only
--
--    This one is a table check rather than a call, and it is here because the
--    same mistake has now been made three times (0018, 0028, 0035): revoking
--    from PUBLIC does not remove the explicit `anon` grant that Supabase's
--    default privileges hand every new function in `public`. A test that
--    calls a function and gets "not your session" cannot tell the difference.
--
--  Every row must read PASS. Cleans up after itself, and is safe to run
--  against a real database. Needs the three level tests loaded (0026).
-- ============================================================================

create or replace function public.__link_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();          -- the teacher
  x_id  uuid := gen_random_uuid();          -- a teacher with nothing to do with it
  a_id  uuid := gen_random_uuid();          -- a signed-up student, for the stranger checks
  roster profiles;
  sess  uuid; other uuid;
  tok   text; tok2 text;
  item  uuid; foreign_item uuid;
  body  jsonb; n int; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'link.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'link.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (a_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'link.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"Jo Kim"}');

  -- ============ 1. the roster student ============
  perform set_config('request.jwt.claims', json_build_object('sub',a_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin perform create_student('Not','Allowed', null); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 roster'::text,'a student cannot add a student'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select * from create_student('Amara', 'Okonkwo', 'Priya Rao') into roster;
  return query select '1 roster'::text,'the teacher adds one'::text,'Amara Okonkwo'::text,roster.full_name,
    (case when roster.full_name='Amara Okonkwo' then 'PASS' else 'FAIL' end)::text;
  -- The same shape signup produces: four letters, the year, a serial per role.
  return query select '1 roster'::text,'with a display id of the usual shape'::text,'AMAO26-n'::text,
    roster.display_id,
    (case when roster.display_id ~ '^AMAO[0-9]{2}-[0-9]+$' then 'PASS' else 'FAIL' end)::text;
  return query select '1 roster'::text,'and the PC as written'::text,'Priya Rao'::text,coalesce(roster.pc,'(null)'),
    (case when roster.pc='Priya Rao' then 'PASS' else 'FAIL' end)::text;
  -- A first name alone would build AMAR26 rather than AMAO26 — a code whose
  -- fourth letter no longer means the surname.
  begin perform create_student('Amara', '', null); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 roster'::text,'a first name alone is refused'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform create_student('', 'Okonkwo', null); txt := 'created';
  exception when others then txt := 'refused'; end;
  return query select '1 roster'::text,'and so is a surname alone'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  select count(*) into n from auth.users where id = roster.id;
  return query select '1 roster'::text,'and no account behind it'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  -- ============ 2. two sessions, two tokens ============
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, roster.id, 'english', now() - interval '5 minutes')
  returning id, access_token into sess, tok;

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, a_id, 'english', now() - interval '5 minutes')
  returning id, access_token into other, tok2;
  execute 'reset role';

  return query select '2 token'::text,'a session gets one'::text,'64 chars'::text,coalesce(length(tok),0)::text,
    (case when length(tok)=64 then 'PASS' else 'FAIL' end)::text;
  return query select '2 token'::text,'and no two share it'::text,'different'::text,
    (case when tok = tok2 then 'same' else 'different' end),
    (case when tok <> tok2 then 'PASS' else 'FAIL' end)::text;

  -- ============ 3. the link, as the signed-out browser uses it ============
  execute 'set local role anon';
  perform set_config('request.jwt.claims', '', true);

  begin perform session_by_token('not-a-real-token'); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '3 link'::text,'a wrong token is refused'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  n := start_session_by_token(tok);
  body := session_by_token(tok);

  return query select '3 link'::text,'it opens its own session'::text,sess::text,
    (body->'session'->>'id'), (case when (body->'session'->>'id')=sess::text then 'PASS' else 'FAIL' end)::text;
  return query select '3 link'::text,'and never its own token back'::text,'absent'::text,
    (case when body->'session' ? 'access_token' then 'present' else 'absent' end),
    (case when body->'session' ? 'access_token' then 'FAIL' else 'PASS' end)::text;
  return query select '3 link'::text,'nor the teacher''s private notes'::text,'absent'::text,
    (case when body->'session' ? 'teacher_notes' then 'present' else 'absent' end),
    (case when body->'session' ? 'teacher_notes' then 'FAIL' else 'PASS' end)::text;
  return query select '3 link'::text,'the student''s name is on it'::text,'Amara Okonkwo'::text,
    coalesce(body->'session'->'student'->>'full_name','(none)'),
    (case when body->'session'->'student'->>'full_name'='Amara Okonkwo' then 'PASS' else 'FAIL' end)::text;

  -- Exactly one question is within reach, and the other nineteen are not in
  -- the payload at all — the same line items_student_read holds.
  n := jsonb_array_length(body->'items');
  return query select '3 link'::text,'one question, not the whole test'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  return query select '3 link'::text,'with its options'::text,'4'::text,
    coalesce(jsonb_array_length(body->'items'->0->'questions'->'question_options'),0)::text,
    (case when jsonb_array_length(body->'items'->0->'questions'->'question_options')=4
          then 'PASS' else 'FAIL' end)::text;
  return query select '3 link'::text,'and never the key'::text,'absent'::text,
    (case when body->'items'->0->'questions' ? 'question_keys' then 'present' else 'absent' end),
    (case when body->'items'->0->'questions' ? 'question_keys' then 'FAIL' else 'PASS' end)::text;

  -- ============ 4. answering through it ============
  item := (body->'items'->0->>'id')::uuid;

  -- A question that belongs to the other session is not this link's to answer.
  execute 'reset role';
  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  perform teacher_start_session(other);
  select id into foreign_item from session_items where session_id = other and status='published';
  execute 'reset role';

  execute 'set local role anon';
  perform set_config('request.jwt.claims', '', true);
  begin perform answer_by_token(tok, foreign_item, 'A'::answer_option, '{}'::answer_option[], 2::smallint, null);
    txt := 'answered';
  exception when others then txt := 'refused'; end;
  return query select '4 answer'::text,'a link cannot answer another session'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  perform answer_by_token(tok, item, 'A'::answer_option, '{}'::answer_option[], 2::smallint, null);
  body := session_by_token(tok);
  return query select '4 answer'::text,'answering opens the next question'::text,'2'::text,
    jsonb_array_length(body->'items')::text,
    (case when jsonb_array_length(body->'items')=2 then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';
  select count(*) into n from session_item_assessments where session_item_id = item;
  return query select '4 answer'::text,'and it is graded, like any other'::text,'1'::text,n::text,
    (case when n=1 then 'PASS' else 'FAIL' end)::text;

  -- ============ 5. the teacher has the same verbs ============
  -- The open question, read as the session's own teacher — a stranger cannot
  -- even see the row, which is the first of the guarantees below and would
  -- otherwise make the next three checks pass for the wrong reason.
  select id into item from session_items where session_id = sess and status='published';

  perform set_config('request.jwt.claims', json_build_object('sub',x_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from session_items where session_id = sess;
  return query select '5 teacher'::text,'another teacher sees none of it'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_start_session(sess); txt := 'started';
  exception when others then txt := 'refused'; end;
  return query select '5 teacher'::text,'not their session to open'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_answer_item(item,'B'::answer_option,'{}'::answer_option[],2::smallint,null);
    txt := 'answered';
  exception when others then txt := 'refused'; end;
  return query select '5 teacher'::text,'nor to answer in'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;

  begin perform teacher_finish_session(sess); txt := 'ended';
  exception when others then txt := 'refused'; end;
  return query select '5 teacher'::text,'nor to end'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  perform teacher_answer_item(item,'B'::answer_option,'{}'::answer_option[],2::smallint,null);
  select status::text into txt from session_items where id = item;
  return query select '5 teacher'::text,'their own, they can answer in'::text,'answered'::text,txt,
    (case when txt='answered' then 'PASS' else 'FAIL' end)::text;

  -- Moving level: the question on screen is voided, the new test opens.
  perform set_session_level(sess, 'medium');
  select level::text into txt from sessions where id = sess;
  return query select '5 teacher'::text,'and move the level'::text,'medium'::text,txt,
    (case when txt='medium' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n
    from session_items si join questions q on q.id = si.question_id
   where si.session_id = sess and si.status in ('answered','revealed') and q.difficulty='easy';
  return query select '5 teacher'::text,'what was answered on easy survives the move'::text,'2'::text,n::text,
    (case when n=2 then 'PASS' else 'FAIL' end)::text;

  n := teacher_finish_session(sess);
  select status::text into txt from sessions where id = sess;
  return query select '5 teacher'::text,'and hand the test in'::text,'completed'::text,txt,
    (case when txt='completed' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_items where session_id = sess and status in ('staged','published');
  return query select '5 teacher'::text,'leaving nothing hanging'::text,'0'::text,n::text,
    (case when n=0 then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- ============ 6. who can even ask ============
  -- The three that check nothing because their callers do. Reachable by
  -- nobody: this is the assertion 0028 needed and did not have.
  for txt in select unnest(array['open_session_now(uuid)',
                                 'end_session_now(uuid)',
                                 'new_session_token()',
                                 'session_for_token(text)',
                                 'record_answer(uuid,answer_option,answer_option[],smallint,text)',
                                 'load_session_level(uuid,text)',
                                 'publish_one_item(uuid)'])
  loop
    return query select '6 grants'::text, txt || ' — internal',
      'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon '
            else '' end
       || case when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
               else '' end
       || case when not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute')
               then 'nobody' else '' end),
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'FAIL' else 'PASS' end)::text;
  end loop;

  -- The seven the link is made of. anon has to reach every one.
  for txt in select unnest(array['session_by_token(text)',
                                 'start_session_by_token(text)',
                                 'set_level_by_token(text,text)',
                                 'mark_viewed_by_token(text,uuid)',
                                 'mark_decided_by_token(text,uuid)',
                                 'finish_by_token(text)',
                                 'answer_by_token(text,uuid,answer_option,answer_option[],smallint,text)'])
  loop
    return query select '6 grants'::text, txt || ' — the link',
      'anon'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon' else 'nobody' end),
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'PASS' else 'FAIL' end)::text;
  end loop;

  -- And the ones that need a signed-in caller. anon must not reach them even
  -- to be refused; authenticated must, or the app cannot work.
  for txt in select unnest(array['create_student(text,text,text)',
                                 'set_student_pc(uuid,text)',
                                 'teacher_start_session(uuid)',
                                 'teacher_finish_session(uuid)',
                                 'teacher_answer_item(uuid,answer_option,answer_option[],smallint,text)',
                                 'start_session_as_student(uuid)',
                                 'finish_session_as_student(uuid)',
                                 'submit_answer(uuid,answer_option,answer_option[],smallint,text)'])
  loop
    return query select '6 grants'::text, txt || ' — signed in only',
      'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
            else 'nobody' end),
      (case when not has_function_privilege('anon', 'public.'||txt, 'execute')
             and has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'PASS' else 'FAIL' end)::text;
  end loop;

  -- ============ 7. a dead link ============
  execute 'set local role anon';
  perform set_config('request.jwt.claims', '', true);
  begin perform start_session_by_token(tok); txt := 'started';
  exception when others then txt := 'refused'; end;
  return query select '7 over'::text,'a finished session cannot be reopened by its link'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Cleanup. The serial numbers the accounts consumed stay consumed; see the
  -- note in level_session.sql for why they are not rewound.
  delete from sessions where id in (sess, other);
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand now.
  delete from profiles where id in (roster.id, t_id, x_id, a_id);
  delete from auth.users where id in (t_id, x_id, a_id);
end $fn$;

select * from public.__link_check();

drop function public.__link_check();
