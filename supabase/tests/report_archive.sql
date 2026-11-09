-- ============================================================================
--  A report is saved before its data goes (0087)
--
--    psql "$DATABASE_URL" -f supabase/tests/report_archive.sql
--
--  What has to hold:
--
--  What is waiting
--    * a due student's generated lesson report and completed targeted test are
--      waiting to be saved; a session with no report to keep is not; nor is a
--      report already saved for the generation it would be drawn from
--    * a recording due with a generated report waiting holds that report
--    * the preview says how many are waiting, and for each due student how many
--
--  A run
--    * a due student with nothing to save is deleted at once; one with a
--      report not saved is held, sessions and all, and the run asks
--      archive_reports for it
--    * a recording whose report is not saved stays; one with nothing to save goes
--    * a copy drawn from an earlier generation does not count: the student
--      stays held
--    * once every report is saved, the run deletes the student and the
--      recording — and the saved copies stay, the only thing that does
--    * a run told not to ask (archive_reports's own) asks nobody
--
--  Who reads them
--    * an admin reads the index and the files; a teacher, the PC, the student
--      and anon read neither; no client writes the index
--    * an admin deletes a student's saved reports; a teacher cannot
--
--  The grants
--    * the internal functions are reachable by nobody signed in; the two the
--      archive function calls are the service role's
--
--  Every row must read PASS. Leaves the policy off and the function URL as it
--  found them, and cleans up after itself.
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

create or replace function public.__archive_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc    profiles;
  kept_s profiles; bare_s profiles; act_s profiles;
  s_lesson uuid; s_test uuid; s_bare uuid; s_rec_kept uuid; s_rec_bare uuid;
  gen_at timestamptz := now() - interval '13 months';
  j jsonb; txt text; n int; v_queue_before int;
  had_url text;
  rw record;
begin
  update retention_policy set enabled = false, student_months = 12, transcript_days = 90;
  select value into had_url from app_config where key = 'functions_url';
  insert into app_config (key, value) values ('functions_url', 'https://fn.example.test/functions/v1')
  on conflict (key) do update set value = excluded.value;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ra.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
         (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ra.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc := create_pc_profile('Pat', 'Archive', 'ra.pc@example.test');

  perform __as(t_id);
  select * into kept_s from create_student('Kira', 'Archive', pc.id);
  select * into bare_s from create_student('Bram', 'Archive', pc.id);
  select * into act_s  from create_student('Ada',  'Archive', pc.id);

  perform __as(null, 'postgres');
  update profiles set created_at = now() - interval '3 years' where id in (kept_s.id, bare_s.id, act_s.id);

  -- Kira: due, with a generated lesson report and a completed targeted test.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at, mode)
  values (t_id, kept_s.id, 'english', now() - interval '14 months', 'completed', now() - interval '14 months', 'diagnostic')
  returning id into s_lesson;
  insert into session_reports (session_id, generated_at) values (s_lesson, gen_at);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at, mode)
  values (t_id, kept_s.id, 'english', now() - interval '13 months', 'completed', now() - interval '13 months', 'targeted')
  returning id into s_test;

  -- Bram: due, a session with no report — nothing to save.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, bare_s.id, 'english', now() - interval '13 months', 'completed', now() - interval '13 months')
  returning id into s_bare;

  -- Ada: active, two recordings past 90 days — one with a generated report.
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at, mode)
  values (t_id, act_s.id, 'english', now() - interval '100 days', 'completed', now() - interval '100 days', 'diagnostic')
  returning id into s_rec_kept;
  insert into session_reports (session_id, generated_at) values (s_rec_kept, now() - interval '99 days');
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at)
  values (t_id, act_s.id, 'english', now() - interval '100 days', 'completed', now() - interval '100 days')
  returning id into s_rec_bare;
  insert into session_transcripts (session_id, body) values (s_rec_kept, 'KEPT-RECORDING'), (s_rec_bare, 'BARE-RECORDING');
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, act_s.id, 'english', now() + interval '3 days');

  -- ============ 1. what is waiting ============
  select string_agg(kind, ',' order by kind) into txt from retention_reports_waiting() w where w.student_id = kept_s.id;
  return query select '1 waiting'::text, 'a due student''s lesson report and targeted test wait to be saved'::text,
    'report,targeted'::text, coalesce(txt, '(none)'), __verdict(txt = 'report,targeted');

  select count(*) into n from retention_reports_waiting() w where w.student_id = bare_s.id;
  return query select '1 waiting'::text, 'a session with no report has nothing to save'::text,
    '0'::text, n::text, __verdict(n = 0);

  select count(*) into n from retention_reports_waiting() w where w.session_id = s_rec_kept;
  return query select '1 waiting'::text, 'a recording due holds its session''s report'::text,
    '1'::text, n::text, __verdict(n = 1);

  select w.made_from::text into txt from retention_reports_waiting() w where w.session_id = s_lesson;
  return query select '1 waiting'::text, 'a lesson report is saved as of its generation'::text,
    'generated_at'::text, (case when txt::timestamptz = gen_at then 'generated_at' else coalesce(txt, '(none)') end),
    __verdict(txt::timestamptz = gen_at);

  perform __as(ad_id);
  j := retention_preview();
  return query select '1 waiting'::text, 'the preview counts what is waiting'::text, '>= 3'::text,
    j->>'reports_waiting', __verdict((j->>'reports_waiting')::int >= 3);
  select (e->>'reports_waiting') into txt from jsonb_array_elements(j->'students_due') e
   where e->>'student_id' = kept_s.id::text;
  return query select '1 waiting'::text, 'and, for each due student, how many of theirs'::text, '2'::text,
    coalesce(txt, '(none)'), __verdict(txt = '2');

  -- ============ 2. a run holds back what is not saved ============
  perform set_retention_policy(true, 12, 90);
  perform __as(null, 'postgres');
  select count(*) into v_queue_before from net.http_request_queue where url like '%/archive_reports';
  perform __as(ad_id);
  j := run_retention_now();
  perform __as(null, 'postgres');

  select count(*) into n from profiles where id = bare_s.id;
  return query select '2 held'::text, 'a due student with nothing to save is deleted at once'::text, '0'::text, n::text,
    __verdict(n = 0);
  select count(*) into n from sessions where student_id = kept_s.id;
  return query select '2 held'::text, 'one with a report not saved is held, sessions and all'::text, '2'::text, n::text,
    __verdict(n = 2);
  select string_agg(body, ',' order by body) into txt from session_transcripts where session_id in (s_rec_kept, s_rec_bare);
  return query select '2 held'::text, 'a recording whose report is not saved stays; the other goes'::text,
    'KEPT-RECORDING'::text, coalesce(txt, '(none)'), __verdict(txt = 'KEPT-RECORDING');
  return query select '2 held'::text, 'the run says what it held back'::text, 'held 1, waiting 3, queued'::text,
    'held ' || (j->>'held') || ', waiting ' || (j->>'waiting') || (case when (j->>'queued')::boolean then ', queued' else '' end),
    __verdict((j->>'held')::int = 1 and (j->>'waiting')::int = 3 and (j->>'queued')::boolean);
  select count(*) into n from net.http_request_queue where url like '%/archive_reports';
  return query select '2 held'::text, 'and asks archive_reports to save it'::text, '1 more'::text,
    (n - v_queue_before) || ' more', __verdict(n - v_queue_before = 1);

  -- ============ 3. a copy of an earlier generation ============
  insert into report_archive (student_id, student_name, display_id, subject, session_id, kind, session_at,
                              made_from, title, path)
  values (kept_s.id, kept_s.full_name, kept_s.display_id, 'english', s_lesson, 'report', now() - interval '14 months',
          gen_at - interval '1 day', 'Report — earlier', kept_s.id || '/' || s_lesson || '/earlier.pdf');
  j := run_retention(false);
  select count(*) into n from sessions where student_id = kept_s.id;
  return query select '3 earlier'::text, 'a copy of an earlier generation does not count: still held'::text,
    '2'::text, n::text, __verdict(n = 2);

  -- ============ 4. once it is saved ============
  -- What archive_reports writes for each, on the service role.
  for rw in select * from retention_reports_waiting() loop
    insert into report_archive (student_id, student_name, subject, session_id, kind, session_at, made_from, title, path)
    values (rw.student_id, 'Saved', 'english', rw.session_id, rw.kind, now(), rw.made_from, 'Saved report',
            rw.student_id || '/' || rw.session_id || '/' || extract(epoch from rw.made_from) || '.pdf');
  end loop;
  select count(*) into v_queue_before from net.http_request_queue where url like '%/archive_reports';
  j := run_retention(false);

  select count(*) into n from profiles where id = kept_s.id;
  return query select '4 saved'::text, 'once every report is saved, the student goes'::text, '0'::text, n::text,
    __verdict(n = 0);
  select count(*) into n from sessions where id in (s_lesson, s_test);
  return query select '4 saved'::text, 'with their sessions'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from session_transcripts where session_id = s_rec_kept;
  return query select '4 saved'::text, 'and the recording, its report saved'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from report_archive where student_id = kept_s.id;
  return query select '4 saved'::text, 'the saved copies stay — both generations'::text, '3'::text, n::text,
    __verdict(n = 3);
  select count(*) into n from net.http_request_queue where url like '%/archive_reports';
  return query select '4 saved'::text, 'a run told not to ask asks nobody'::text, '0 more'::text,
    (n - v_queue_before) || ' more', __verdict(n = v_queue_before);
  select count(*) into n from retention_reports_waiting();
  return query select '4 saved'::text, 'and nothing is waiting'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 5. who reads them ============
  insert into storage.objects (bucket_id, name) values ('report-archive', kept_s.id || '/x.pdf');

  perform __as(ad_id);
  select count(*) into n from report_archive where student_id = kept_s.id;
  return query select '5 readers'::text, 'an admin reads the index'::text, '3'::text, n::text, __verdict(n = 3);
  select count(*) into n from storage.objects where bucket_id = 'report-archive' and name = kept_s.id || '/x.pdf';
  return query select '5 readers'::text, 'and the files'::text, '1'::text, n::text, __verdict(n = 1);

  perform __as(t_id);
  select count(*) into n from report_archive;
  return query select '5 readers'::text, 'a teacher reads no saved report'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from storage.objects where bucket_id = 'report-archive';
  return query select '5 readers'::text, 'nor its file'::text, '0'::text, n::text, __verdict(n = 0);
  begin
    insert into report_archive (student_id, student_name, subject, session_id, kind, session_at, made_from, title, path)
    values (act_s.id, 'x', 'english', s_rec_bare, 'report', now(), now(), 'x', 'forged.pdf');
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '5 readers'::text, 'nor writes one'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform forget_saved_reports(kept_s.id); txt := 'deleted';
  exception when others then txt := 'refused'; end;
  return query select '5 readers'::text, 'nor deletes one'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  delete from storage.objects where bucket_id = 'report-archive';
  get diagnostics n = row_count;
  return query select '5 readers'::text, 'nor its file'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(pc.id);
  select count(*) into n from report_archive;
  return query select '5 readers'::text, 'the PC reads none'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'anon');
  select count(*) into n from report_archive;
  return query select '5 readers'::text, 'nor does anon'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(ad_id);
  delete from storage.objects where bucket_id = 'report-archive' and name = kept_s.id || '/x.pdf';
  get diagnostics n = row_count;
  return query select '5 readers'::text, 'an admin deletes a saved file'::text, '1'::text, n::text, __verdict(n = 1);
  n := forget_saved_reports(kept_s.id);
  return query select '5 readers'::text, 'and then its rows'::text, '3'::text, n::text, __verdict(n = 3);

  -- ============ 6. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['session_report_to_keep(uuid)', 'retention_reports_waiting()',
                                 'queue_report_archive()', 'run_retention(boolean)']) loop
    return query select '6 grants'::text, txt || ' — internal'::text, 'nobody signed in'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'somebody' else 'nobody signed in' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;
  for txt in select unnest(array['retention_reports_waiting()', 'run_retention(boolean)']) loop
    return query select '6 grants'::text, txt || ' — the archive function''s'::text, 'service_role'::text,
      (case when has_function_privilege('service_role', 'public.'||txt, 'execute') then 'service_role' else 'nobody' end),
      __verdict(has_function_privilege('service_role', 'public.'||txt, 'execute'));
  end loop;
  return query select '6 grants'::text, 'forget_saved_reports(uuid) — signed in, admin inside'::text, 'authenticated'::text,
    (case when has_function_privilege('anon', 'public.forget_saved_reports(uuid)', 'execute') then 'anon too!'
          when has_function_privilege('authenticated', 'public.forget_saved_reports(uuid)', 'execute') then 'authenticated'
          else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.forget_saved_reports(uuid)', 'execute')
              and has_function_privilege('authenticated', 'public.forget_saved_reports(uuid)', 'execute'));
  return query select '6 grants'::text, 'run_retention() — replaced'::text, 'absent'::text,
    (case when to_regprocedure('public.run_retention()') is null then 'absent' else 'present' end),
    __verdict(to_regprocedure('public.run_retention()') is null);

  -- Cleanup: the policy off, the URL as it was, everything made here gone.
  update retention_policy set enabled = false, student_months = 12, transcript_days = 90, last_run = null,
                              last_run_at = null, updated_by = null;
  if had_url is null then delete from app_config where key = 'functions_url';
  else update app_config set value = had_url where key = 'functions_url'; end if;
  delete from net.http_request_queue where url like 'https://fn.example.test/%';
  delete from report_archive where student_id in (kept_s.id, bare_s.id, act_s.id);
  delete from sessions where student_id = act_s.id;
  delete from profiles where id in (act_s.id, t_id, ad_id, pc.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__archive_check();

drop function public.__archive_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
