-- ============================================================================
--  0087 — a report is saved before its data goes
--
--  0071 deletes a student with everything of theirs once nothing has been
--  booked for them for 12 months, and a session's recording 90 days after it
--  ended. Everything — the reports too. But a report is the record of what was
--  taught and what came of it: the thing the PC was sent and the parent read.
--  Ascend Now keeps those; it is the rows they were drawn from that it does not
--  need to.
--
--  So nothing a report is drawn from is deleted until the report is saved, as
--  the PDF the PC is sent, in a private bucket:
--
--    a student      is deleted once every report of theirs is saved — a
--                   lesson's generated report and every completed targeted
--                   test. Until then they are held, and the clean-up says so.
--    a recording    is deleted once its session's report is saved. The report
--                   quotes the model's reading of the recording, and deleting
--                   the reading first would change the report without a word.
--
--  WHAT A REPORT IS. A lesson's, as of its latest generation (generated_at); a
--  targeted test's, as of when it ended. An archived copy counts only for the
--  generation it was drawn from (made_from): a report generated again after it
--  was saved is saved again before anything goes, and both copies are kept.
--
--  WHO DRAWS THEM. The database cannot draw a PDF, so a run queues the
--  archive_reports edge function (pg_net, as 0055 queues a report's email),
--  which reads what is waiting through retention_reports_waiting, draws each
--  PDF with the code that draws the PC's, stores it, and calls run_retention
--  again so what is now saved can go. It asks for itself again only when it
--  saved something, so a report that cannot be drawn stops the loop rather
--  than spinning it; it is listed as waiting until somebody looks.
--
--  WHO READS THEM. An admin: report_archive lists them, and the bucket lets an
--  admin read and delete its files — which is also how a family's request to
--  be forgotten is met. Nobody writes them but the service role.
-- ============================================================================

-- --------------------------------------------------------------- the store --
insert into storage.buckets (id, name, public)
values ('report-archive', 'report-archive', false)
on conflict (id) do update set public = false;

drop policy if exists report_archive_files_admin_read on storage.objects;
create policy report_archive_files_admin_read on storage.objects
  for select to authenticated
  using (bucket_id = 'report-archive' and (select public.is_admin()));

drop policy if exists report_archive_files_admin_delete on storage.objects;
create policy report_archive_files_admin_delete on storage.objects
  for delete to authenticated
  using (bucket_id = 'report-archive' and (select public.is_admin()));

-- --------------------------------------------------------------- the index --
-- No foreign keys: the student and the session go after their report is saved,
-- and the copy outlives them. The ids are kept to group and to match.
create table if not exists report_archive (
  id           uuid primary key default gen_random_uuid(),
  student_id   uuid not null,
  student_name text not null,
  display_id   text,
  subject      text not null check (subject in ('english', 'mathematics')),
  session_id   uuid not null,
  kind         text not null check (kind in ('report', 'targeted')),
  session_at   timestamptz not null,
  made_from    timestamptz not null,
  title        text not null,
  path         text not null unique,
  bytes        int,
  archived_at  timestamptz not null default now(),
  unique (session_id, made_from)
);

comment on table report_archive is
  'Every report saved as a PDF before the rows it was drawn from were deleted (0087). Admin read only; the service role writes.';
comment on column report_archive.made_from is
  'The generation the PDF was drawn from: a lesson report''s generated_at, a targeted test''s end. A later generation is saved again.';
comment on column report_archive.path is
  'The file in the report-archive bucket.';

alter table report_archive enable row level security;
drop policy if exists report_archive_admin_read on report_archive;
create policy report_archive_admin_read on report_archive for select using ((select is_admin()));
revoke insert, update, delete, truncate on report_archive from anon, authenticated;

-- ============================================================================
--  What has to be saved first
-- ============================================================================

-- Internal. The report a session is kept as, if it has one: a lesson's
-- generated report, as of its latest generation; a completed targeted test's,
-- as of its end.
create or replace function public.session_report_to_keep(p_session uuid)
returns table (kind text, made_from timestamptz)
language sql stable security definer set search_path = public as $$
  select case when s.mode = 'targeted' then 'targeted' else 'report' end,
         case when s.mode = 'targeted' then coalesce(s.ended_at, s.scheduled_at) else r.generated_at end
    from sessions s
    left join session_reports r on r.session_id = s.id
   where s.id = p_session
     and ((s.mode = 'targeted' and s.status = 'completed')
          or (s.mode <> 'targeted' and r.generated_at is not null))
$$;

revoke execute on function public.session_report_to_keep(uuid) from public, anon, authenticated;

-- Internal. Every report a deletion due now would take that is not saved yet,
-- as of the generation it would be drawn from: the reports of a student due,
-- and of a session whose recording is due. What archive_reports draws.
create or replace function public.retention_reports_waiting()
returns table (session_id uuid, student_id uuid, kind text, made_from timestamptz)
language sql stable security definer set search_path = public as $$
  with touched as (
    select s.id from sessions s join retention_due() d on d.student_id = s.student_id
    union
    select o.session_id from retention_old_transcripts() o
  )
  select s.id, s.student_id, k.kind, k.made_from
    from touched t
    join sessions s on s.id = t.id
    cross join lateral session_report_to_keep(s.id) k
   where not exists (select 1 from report_archive a
                      where a.session_id = s.id and a.made_from = k.made_from)
   order by s.student_id, k.made_from
$$;

revoke execute on function public.retention_reports_waiting() from public, anon, authenticated;
grant  execute on function public.retention_reports_waiting() to service_role;

comment on function public.retention_reports_waiting() is
  'Every report a deletion due now would take that is not saved as a PDF yet (0087). Internal; the archive_reports function reads it on the service role.';

-- Internal. Asks archive_reports to save what is waiting — best effort, as
-- 0055 asks for a report's email: no URL, no extension or a failure is a
-- warning, and the run goes on holding back what is not saved.
create or replace function public.queue_report_archive()
returns boolean
language plpgsql security definer set search_path = public as $$
declare v_url text;
begin
  select value into v_url from app_config where key = 'functions_url';
  if v_url is null then return false; end if;
  begin
    perform net.http_post(
      url     := rtrim(v_url, '/') || '/archive_reports',
      body    := '{}'::jsonb,
      headers := '{"Content-Type": "application/json"}'::jsonb,
      -- Drawing a student's reports takes longer than pg_net's default.
      timeout_milliseconds := 300000
    );
    return true;
  exception when others then
    raise warning 'could not queue the report archive: %', sqlerrm;
    return false;
  end;
end $$;

revoke execute on function public.queue_report_archive() from public, anon, authenticated;

-- ============================================================================
--  A run
-- ============================================================================

-- 0071's run, holding back whatever a report not yet saved was drawn from.
-- p_queue: whether to ask archive_reports for what is waiting — every run but
-- one archive_reports makes after saving nothing.
drop function if exists public.run_retention();

create or replace function public.run_retention(p_queue boolean default true)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  r          retention_policy;
  v_waiting  uuid[];
  v_students uuid[];
  v_held     int := 0;
  v_sessions int := 0;
  v_rec      int := 0;
  v_read     int := 0;
  v_queued   boolean := false;
  v_out      jsonb;
begin
  select * into r from retention_policy;
  if not r.enabled then
    v_out := jsonb_build_object('ran', false, 'reason', 'off');
    update retention_policy set last_run_at = now(), last_run = v_out;
    return v_out;
  end if;

  -- The sessions whose report is not saved yet: nothing they hold goes.
  select coalesce(array_agg(w.session_id), '{}') into v_waiting from retention_reports_waiting() w;

  select coalesce(array_agg(d.student_id), '{}') into v_students
    from retention_due() d
   where not exists (select 1 from sessions s where s.student_id = d.student_id and s.id = any(v_waiting));
  select count(*) into v_held from retention_due() d where not (d.student_id = any(v_students));

  if cardinality(v_students) > 0 then
    delete from sessions where student_id = any(v_students);
    get diagnostics v_sessions = row_count;
    delete from profiles where id = any(v_students) and role = 'student';
    begin
      delete from auth.users where id = any(v_students);
    exception when others then
      null; -- a roster student has no sign-in; nothing else depends on this
    end;
  end if;

  with old as (select o.session_id from retention_old_transcripts() o where not (o.session_id = any(v_waiting)))
  delete from session_context_extractions x using old where x.session_id = old.session_id;
  get diagnostics v_read = row_count;
  with old as (select o.session_id from retention_old_transcripts() o where not (o.session_id = any(v_waiting)))
  delete from session_transcripts t using old where t.session_id = old.session_id;
  get diagnostics v_rec = row_count;

  if cardinality(v_waiting) > 0 and p_queue then
    v_queued := queue_report_archive();
  end if;

  v_out := jsonb_build_object('ran', true, 'students', cardinality(v_students), 'sessions', v_sessions,
                              'transcripts', v_rec, 'readings', v_read,
                              'held', v_held, 'waiting', cardinality(v_waiting), 'queued', v_queued);
  update retention_policy set last_run_at = now(), last_run = v_out;
  return v_out;
end $$;

revoke execute on function public.run_retention(boolean) from public, anon, authenticated;
grant  execute on function public.run_retention(boolean) to service_role;

comment on function public.run_retention(boolean) is
  'Deletes what is due (0071) — but nothing a report not yet saved as a PDF was drawn from, and asks archive_reports to save it (0087). Internal: the daily schedule, Run now, and archive_reports.';

create or replace function public.run_retention_now()
returns jsonb
language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can run this'; end if;
  return run_retention();
end $$;

revoke execute on function public.run_retention_now() from public, anon, authenticated;
grant  execute on function public.run_retention_now() to authenticated;

-- 0071's preview, with what is held back and what has been saved.
create or replace function public.retention_preview()
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can see this'; end if;
  return jsonb_build_object(
    'policy', (select to_jsonb(r) - 'id' from retention_policy r),
    'students_due', coalesce((select jsonb_agg(to_jsonb(d) || jsonb_build_object(
                                'reports_waiting', (select count(*) from retention_reports_waiting() w
                                                     where w.student_id = d.student_id)))
                                from retention_due() d), '[]'::jsonb),
    'students_soon', coalesce((select jsonb_agg(to_jsonb(d)) from retention_due(interval '30 days') d
                                where d.due_at > now()), '[]'::jsonb),
    'transcripts_due', (select count(*) from retention_old_transcripts()),
    'reports_waiting', (select count(*) from retention_reports_waiting()),
    'reports_saved', (select count(*) from report_archive));
end $$;

revoke execute on function public.retention_preview() from public, anon, authenticated;
grant  execute on function public.retention_preview() to authenticated;

-- ============================================================================
--  Forgetting a saved report
-- ============================================================================

-- An admin deletes a student's saved reports: the files first, through the
-- storage API (the bucket's delete policy), then their rows here — so a row
-- left behind is a file to delete again rather than a file nobody can see.
create or replace function public.forget_saved_reports(p_student uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_n int;
begin
  if not is_admin() then raise exception 'only an admin can delete a saved report'; end if;
  delete from report_archive where student_id = p_student;
  get diagnostics v_n = row_count;
  return v_n;
end $$;

revoke execute on function public.forget_saved_reports(uuid) from public, anon, authenticated;
grant  execute on function public.forget_saved_reports(uuid) to authenticated;

comment on function public.forget_saved_reports(uuid) is
  'Deletes the rows of a student''s saved reports, once an admin has deleted their files (0087). Admin only.';
