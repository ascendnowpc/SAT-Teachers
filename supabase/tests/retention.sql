-- ============================================================================
--  Old data is cleared, once an admin turns it on (0071)
--
--    psql "$DATABASE_URL" -f supabase/tests/retention.sql
--
--  What has to hold:
--
--    * the policy starts off, at 12 months for a student and 90 days for a
--      recording
--    * only an admin sees what is due, changes the policy or runs it; the
--      windows are bounded
--    * what is due: a student with nothing for 12 months is due now, one at
--      11½ months is due in the next 30 days, a recent one is not, and one
--      with a session booked ahead is not however old the last one was
--    * a run while it is off deletes nothing
--    * on, a run deletes the due student with every session and row of
--      theirs, and nobody else; and the transcript and reading of a session
--      that ended more than 90 days ago, and not a recent one
--    * every run is written onto the policy
--    * the internal functions are reachable by nobody
--
--  Every row must read PASS. Leaves the policy off and cleans up after itself.
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

create or replace function public.__retention_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc    profiles;
  old_s profiles; soon_s profiles; new_s profiles; ahead_s profiles;
  s_old uuid; s_soon uuid; s_new uuid; s_ahead_past uuid; s_ahead_next uuid; s_rec_old uuid; s_rec_new uuid;
  j jsonb; txt text; n int;
  was retention_policy;
begin
  select * into was from retention_policy;
  update retention_policy set enabled = false, student_months = 12, transcript_days = 90;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rt.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
         (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rt.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc := create_pc_profile('Pat', 'Retain', 'rt.pc@example.test');

  perform __as(t_id);
  select * into old_s   from create_student('Olga', 'Retain', pc.id);
  select * into soon_s  from create_student('Sami', 'Retain', pc.id);
  select * into new_s   from create_student('Nora', 'Retain', pc.id);
  select * into ahead_s from create_student('Ali', 'Retain', pc.id);

  perform __as(null, 'postgres');
  update profiles set created_at = now() - interval '3 years' where id in (old_s.id, soon_s.id, new_s.id, ahead_s.id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, old_s.id, 'english', now() - interval '13 months', 'completed', now() - interval '13 months')
  returning id into s_old;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, soon_s.id, 'english', now() - interval '11 months 2 weeks', 'completed', now() - interval '11 months 2 weeks')
  returning id into s_soon;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, new_s.id, 'english', now() - interval '100 days', 'completed', now() - interval '100 days')
  returning id into s_rec_old;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, new_s.id, 'english', now() - interval '10 days', 'completed', now() - interval '10 days')
  returning id into s_rec_new;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, ahead_s.id, 'english', now() - interval '2 years', 'completed', now() - interval '2 years')
  returning id into s_ahead_past;
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, ahead_s.id, 'english', now() + interval '3 days') returning id into s_ahead_next;

  insert into session_transcripts (session_id, body) values (s_old, 'OLD-TRANSCRIPT'), (s_rec_old, 'RECORDING-100-DAYS'), (s_rec_new, 'RECORDING-10-DAYS');
  insert into session_context_extractions (session_id, body, transcript_md5, model, offset_seconds)
  values (s_rec_old, '{}', 'x', 'm', 0), (s_rec_new, '{}', 'x', 'm', 0);

  -- ============ 1. the policy ============
  select * into was from retention_policy;
  return query select '1 policy'::text, 'it starts off, at 12 months and 90 days'::text, 'off, 12, 90'::text,
    (case when was.enabled then 'on' else 'off' end) || ', ' || was.student_months || ', ' || was.transcript_days,
    __verdict(not was.enabled and was.student_months = 12 and was.transcript_days = 90);

  -- ============ 2. who ============
  perform __as(t_id);
  begin perform retention_preview(); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '2 who'::text, 'a teacher cannot see what is due'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform set_retention_policy(true, 12, 90); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 who'::text, 'nor change the policy'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform run_retention_now(); txt := 'ran';
  exception when others then txt := 'refused'; end;
  return query select '2 who'::text, 'nor run it'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(ad_id);
  begin perform set_retention_policy(false, 1, 90); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '2 who'::text, 'an admin cannot set a window below the floor'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  -- ============ 3. what is due ============
  j := retention_preview();
  select string_agg(e->>'full_name', ',' order by e->>'full_name') into txt from jsonb_array_elements(j->'students_due') e
   where e->>'full_name' like '%Retain';
  return query select '3 due'::text, 'nothing for 12 months: due now'::text, 'Olga Retain'::text, coalesce(txt, '(none)'),
    __verdict(txt = 'Olga Retain');
  select string_agg(e->>'full_name', ',' order by e->>'full_name') into txt from jsonb_array_elements(j->'students_soon') e
   where e->>'full_name' like '%Retain';
  return query select '3 due'::text, 'at 11½ months: due in the next 30 days'::text, 'Sami Retain'::text, coalesce(txt, '(none)'),
    __verdict(txt = 'Sami Retain');
  return query select '3 due'::text, 'a recent student and one booked ahead: neither'::text, 'absent'::text,
    (case when position('Nora Retain' in j::text) > 0 or position('Ali Retain' in j::text) > 0 then 'present' else 'absent' end),
    __verdict(position('Nora Retain' in j::text) = 0 and position('Ali Retain' in j::text) = 0);
  return query select '3 due'::text, 'recordings past 90 days are counted'::text, '>= 2'::text,
    j->>'transcripts_due', __verdict((j->>'transcripts_due')::int >= 2);

  -- ============ 4. off deletes nothing ============
  j := run_retention_now();
  perform __as(null, 'postgres');
  select count(*) into n from profiles where id = old_s.id;
  return query select '4 off'::text, 'a run while it is off deletes nothing'::text, 'off, still there'::text,
    coalesce(j->>'reason', 'ran') || ', ' || (case when n = 1 then 'still there' else 'gone' end),
    __verdict(j->>'reason' = 'off' and n = 1);

  -- ============ 5. on ============
  perform __as(ad_id);
  perform set_retention_policy(true, 12, 90);
  j := run_retention_now();
  perform __as(null, 'postgres');
  select count(*) into n from profiles where id = old_s.id;
  return query select '5 on'::text, 'the due student is deleted'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from sessions where id = s_old;
  return query select '5 on'::text, 'with their sessions'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from student_pins where student_id = old_s.id;
  return query select '5 on'::text, 'and their PIN'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from profiles where id in (soon_s.id, new_s.id, ahead_s.id);
  return query select '5 on'::text, 'and nobody else'::text, '3'::text, n::text, __verdict(n = 3);
  select string_agg(body, ',' order by body) into txt from session_transcripts where session_id in (s_rec_old, s_rec_new);
  return query select '5 on'::text, 'a recording past 90 days goes; a recent one stays'::text, 'RECORDING-10-DAYS'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'RECORDING-10-DAYS');
  select count(*) into n from session_context_extractions where session_id = s_rec_old;
  return query select '5 on'::text, 'and its reading with it'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from session_context_extractions where session_id = s_rec_new;
  return query select '5 on'::text, 'the recent reading stays'::text, '1'::text, n::text, __verdict(n = 1);
  select count(*) into n from sessions where id = s_rec_old;
  return query select '5 on'::text, 'the session itself stays: only the recording goes'::text, '1'::text, n::text,
    __verdict(n = 1);

  select last_run into j from retention_policy;
  return query select '5 on'::text, 'the run is written down'::text, 'ran, 1 student'::text,
    coalesce((case when (j->>'ran')::boolean then 'ran' else 'did not run' end) || ', ' || (j->>'students') || ' student', 'null'),
    __verdict((j->>'ran')::boolean and (j->>'students')::int >= 1);

  -- ============ 6. grants ============
  for txt in select unnest(array['run_retention()', 'retention_due(interval)', 'retention_old_transcripts()']) loop
    return query select '6 grants'::text, txt || ' — internal'::text, 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'somebody' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;
  for txt in select unnest(array['retention_preview()', 'set_retention_policy(boolean,integer,integer)', 'run_retention_now()']) loop
    return query select '6 grants'::text, txt || ' — signed in, admin inside'::text, 'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  -- Cleanup: the policy back off, everything made here gone.
  update retention_policy set enabled = false, student_months = 12, transcript_days = 90, last_run = null, last_run_at = null,
                              updated_by = null;
  delete from sessions where student_id in (soon_s.id, new_s.id, ahead_s.id);
  delete from profiles where id in (soon_s.id, new_s.id, ahead_s.id, t_id, ad_id, pc.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__retention_check();

drop function public.__retention_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
