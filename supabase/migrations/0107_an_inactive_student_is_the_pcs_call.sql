-- ============================================================================
--  0107 — an inactive student is their PC's call
--
--  The scope's rule for inactive accounts (Data and retention), on 0071's
--  clean-up and 0087's saved reports:
--
--    day 60 with no activity — no check-in, no session; a sign-in does not
--      count — the student's PC is emailed, with Keep and Delete now.
--    Keep resets the clock: another 60 days before the next notice.
--    No answer by day 74 (a 14-day grace): the reports are saved as PDFs,
--      then the student's data is deleted. Delete now does it at once.
--    Saved PDFs are kept for 2 years, then deleted.
--    The admin sees who is due, and the whole rule stays switchable. It is
--      still OFF until an admin turns it on; off, nobody is told and nothing
--      goes.
--
--  So a student is never deleted without a notice their PC could answer: a
--  run first tells, and only a notice 14 days old — and still unanswered, with
--  nothing booked or held since — lets the next runs delete. Activity after a
--  notice voids it. A PC answers from the email's buttons, which open the
--  platform (My students), signed in: the email carries no power of its own.
--
--    retention_status()          every student: last activity, the notice,
--                                when they would go, and the stage —
--                                active | notice (to tell) | noticed | due
--    retention_due(within)       as 0071 and 0087 read it: who goes now, or by
--                                within; now only the 'due'
--    run_retention(queue)        tells, deletes what is due once saved (0087),
--                                and asks retention_notice to mail the PCs and
--                                retire the PDFs past their years
--    retention_notices_mine()    a PC's own flagged students; an admin's all
--    retention_decide(s, keep)   Keep, or Delete now — the PC or an admin
--    set_retention_rules(...)    the admin's switch and windows
--    retention_preview()         0087's, with the notices
-- ============================================================================

alter table retention_policy
  add column if not exists notice_days int not null default 60 check (notice_days between 14 and 365),
  add column if not exists grace_days int not null default 14 check (grace_days between 7 and 60),
  add column if not exists archive_years int not null default 2 check (archive_years between 1 and 10);

comment on column retention_policy.notice_days is 'Days with no check-in or session before the PC is told (0107).';
comment on column retention_policy.grace_days is 'Days after the notice before an unanswered student is deleted (0107).';
comment on column retention_policy.archive_years is 'Years a saved report PDF is kept (0107).';
comment on column retention_policy.student_months is 'Unused since 0107: notice_days and grace_days decide.';

create table if not exists retention_notices (
  student_id  uuid primary key references profiles(id) on delete cascade,
  noticed_at  timestamptz not null default now(),
  emailed_at  timestamptz,
  email_error text,
  decision    text check (decision in ('keep', 'delete')),
  decided_at  timestamptz,
  decided_by  uuid references profiles(id) on delete set null,
  kept_at     timestamptz
);

comment on table retention_notices is
  'The latest notice to a PC that a student has been inactive, and what the PC decided (0107). Read through functions only.';

alter table retention_notices enable row level security;
revoke all on retention_notices from anon, authenticated;

-- ------------------------------------------------------------- the stages ---
-- A student's last activity is 0071's: their latest session, booked or held,
-- or the day they were added. Keep counts as activity. A notice is OPEN when
-- it was not answered Keep and nothing has happened since it was sent.
create or replace function public.retention_status()
returns table (student_id uuid, full_name text, display_id text, pc_id uuid, last_active timestamptz,
               noticed_at timestamptz, decision text, delete_at timestamptz, stage text)
language sql stable security definer set search_path = public as $$
  with r as (select * from retention_policy),
  base as (
    select p.id, p.full_name, p.display_id, p.pc_id,
           greatest(p.created_at,
                    (select max(greatest(s.scheduled_at, coalesce(s.ended_at, s.scheduled_at)))
                       from sessions s where s.student_id = p.id)) as last_active,
           n.noticed_at, n.decision, n.decided_at, n.kept_at
      from profiles p
      left join retention_notices n on n.student_id = p.id
     where p.role = 'student'
  ),
  e as (
    select b.*,
           greatest(b.last_active, coalesce(b.kept_at, b.last_active)) as active_from,
           (b.noticed_at is not null and b.decision is distinct from 'keep' and b.last_active <= b.noticed_at) as open
      from base b
  )
  select e.id, e.full_name, e.display_id, e.pc_id, e.last_active,
         case when e.open then e.noticed_at end,
         case when e.open then e.decision end,
         case when e.open and e.decision = 'delete' then e.decided_at
              when e.open then e.noticed_at + make_interval(days => r.grace_days)
              else greatest(e.active_from + make_interval(days => r.notice_days), now()) + make_interval(days => r.grace_days)
         end,
         case when e.open and (e.decision = 'delete' or e.noticed_at + make_interval(days => r.grace_days) <= now()) then 'due'
              when e.open then 'noticed'
              when e.active_from + make_interval(days => r.notice_days) <= now() then 'notice'
              else 'active'
         end
    from e cross join r
$$;

revoke execute on function public.retention_status() from public, anon, authenticated;

comment on function public.retention_status() is
  'Every student''s place in the clean-up: active, to be told, told (noticed), or due (0107). Internal.';

-- 0071's question, answered by the stages: only a student whose notice has run
-- its grace, or whose PC chose Delete now, is due; within a window, everyone
-- who could be by then.
create or replace function public.retention_due(p_within interval default interval '0')
returns table (student_id uuid, full_name text, display_id text, last_active timestamptz, due_at timestamptz)
language sql stable security definer set search_path = public as $$
  select s.student_id, s.full_name, s.display_id, s.last_active, s.delete_at
    from retention_status() s
   where s.stage = 'due' or (p_within > interval '0' and s.delete_at <= now() + p_within)
   order by 5, 2
$$;

revoke execute on function public.retention_due(interval) from public, anon, authenticated;

-- ---------------------------------------------------- the mail, the PDFs ---
-- Internal. Asks retention_notice to mail the PCs and retire old PDFs — best
-- effort, as 0087 asks archive_reports.
create or replace function public.queue_retention_notice()
returns boolean
language plpgsql security definer set search_path = public as $$
declare v_url text;
begin
  select value into v_url from app_config where key = 'functions_url';
  if v_url is null then return false; end if;
  begin
    perform net.http_post(
      url     := rtrim(v_url, '/') || '/retention_notice',
      body    := '{}'::jsonb,
      headers := '{"Content-Type": "application/json"}'::jsonb,
      timeout_milliseconds := 120000
    );
    return true;
  exception when others then
    raise warning 'could not queue the retention notices: %', sqlerrm;
    return false;
  end;
end $$;

revoke execute on function public.queue_retention_notice() from public, anon, authenticated;

-- Internal, for retention_notice on the service role: the open notices not yet
-- mailed, each with whom to tell — the student's PC, or every admin when the
-- student has none.
create or replace function public.retention_notices_to_email()
returns jsonb
language sql stable security definer set search_path = public as $$
  select coalesce(jsonb_agg(jsonb_build_object(
           'student_id', s.student_id, 'full_name', s.full_name, 'display_id', s.display_id,
           'last_active', s.last_active, 'delete_at', s.delete_at,
           'to', coalesce(
                   (select jsonb_agg(jsonb_build_object('name', pc.full_name, 'email', pc.email))
                      from profiles pc where pc.id = s.pc_id and pc.email is not null and pc.is_active),
                   (select jsonb_agg(jsonb_build_object('name', a.full_name, 'email', a.email))
                      from profiles a where a.role = 'admin' and a.email is not null and a.is_active),
                   '[]'::jsonb))), '[]'::jsonb)
    from retention_status() s
    join retention_notices n on n.student_id = s.student_id
   where s.stage in ('noticed', 'due') and n.emailed_at is null and n.email_error is null
     and (select enabled from retention_policy)
$$;

create or replace function public.retention_mark_emailed(p_student uuid, p_error text default null)
returns void
language sql security definer set search_path = public as $$
  update retention_notices
     set emailed_at = case when p_error is null then now() end,
         email_error = p_error
   where student_id = p_student
$$;

-- The saved PDFs past their years.
create or replace function public.retention_archive_expired()
returns table (id uuid, path text)
language sql stable security definer set search_path = public as $$
  select a.id, a.path
    from report_archive a cross join retention_policy r
   where r.enabled and a.archived_at < now() - make_interval(years => r.archive_years)
   order by a.archived_at
   limit 500
$$;

create or replace function public.retention_forget_archived(p_ids uuid[])
returns int
language plpgsql security definer set search_path = public as $$
declare v_n int;
begin
  delete from report_archive where id = any(p_ids);
  get diagnostics v_n = row_count;
  return v_n;
end $$;

revoke execute on function public.retention_notices_to_email() from public, anon, authenticated;
revoke execute on function public.retention_mark_emailed(uuid, text) from public, anon, authenticated;
revoke execute on function public.retention_archive_expired() from public, anon, authenticated;
revoke execute on function public.retention_forget_archived(uuid[]) from public, anon, authenticated;
grant  execute on function public.retention_notices_to_email() to service_role;
grant  execute on function public.retention_mark_emailed(uuid, text) to service_role;
grant  execute on function public.retention_archive_expired() to service_role;
grant  execute on function public.retention_forget_archived(uuid[]) to service_role;

-- ------------------------------------------------------------------ a run ---
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
  v_noticed  int := 0;
  v_unsent   int := 0;
  v_expired  int := 0;
  v_queued   boolean := false;
  v_mailing  boolean := false;
  v_out      jsonb;
begin
  select * into r from retention_policy;
  if not r.enabled then
    v_out := jsonb_build_object('ran', false, 'reason', 'off');
    update retention_policy set last_run_at = now(), last_run = v_out;
    return v_out;
  end if;

  -- Tell first: every student the rule has reached gets a fresh notice.
  insert into retention_notices (student_id, noticed_at)
  select s.student_id, now() from retention_status() s where s.stage = 'notice'
  on conflict (student_id) do update
     set noticed_at = now(), emailed_at = null, email_error = null,
         decision = null, decided_at = null, decided_by = null;
  get diagnostics v_noticed = row_count;

  -- Then 0087's deletion of what is due, holding back what is not saved yet.
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

  select count(*) into v_unsent
    from retention_status() s join retention_notices n on n.student_id = s.student_id
   where s.stage in ('noticed', 'due') and n.emailed_at is null and n.email_error is null;
  select count(*) into v_expired from report_archive where archived_at < now() - make_interval(years => r.archive_years);

  if p_queue then
    if cardinality(v_waiting) > 0 then v_queued := queue_report_archive(); end if;
    if v_unsent > 0 or v_expired > 0 then v_mailing := queue_retention_notice(); end if;
  end if;

  v_out := jsonb_build_object('ran', true, 'noticed', v_noticed, 'students', cardinality(v_students),
                              'sessions', v_sessions, 'transcripts', v_rec, 'readings', v_read,
                              'held', v_held, 'waiting', cardinality(v_waiting), 'queued', v_queued,
                              'to_mail', v_unsent, 'pdfs_expired', v_expired, 'mailing', v_mailing);
  update retention_policy set last_run_at = now(), last_run = v_out;
  return v_out;
end $$;

revoke execute on function public.run_retention(boolean) from public, anon, authenticated;
grant  execute on function public.run_retention(boolean) to service_role;

comment on function public.run_retention(boolean) is
  'Tells the PCs of students inactive for notice_days, deletes those whose notice ran its grace (or whose PC chose Delete now) once their reports are saved, old recordings too, and asks for the mail and the PDF expiry (0071, 0087, 0107). Internal.';

-- ----------------------------------------------------------------- the PC ---
create or replace function public.retention_notices_mine()
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_me uuid := auth.uid();
begin
  if v_me is null or not (is_pc() or is_admin()) then
    raise exception 'only a PC or an admin reads these';
  end if;
  return coalesce((
    select jsonb_agg(jsonb_build_object(
             'student_id', s.student_id, 'full_name', s.full_name, 'display_id', s.display_id,
             'last_active', s.last_active, 'noticed_at', s.noticed_at, 'delete_at', s.delete_at,
             'decision', s.decision, 'stage', s.stage) order by s.delete_at, s.full_name)
      from retention_status() s
     where s.stage in ('noticed', 'due')
       and (select enabled from retention_policy)
       and (is_admin() or s.pc_id = v_me)), '[]'::jsonb);
end $$;

revoke execute on function public.retention_notices_mine() from public, anon, authenticated;
grant  execute on function public.retention_notices_mine() to authenticated;

comment on function public.retention_notices_mine() is
  'The students the clean-up has flagged: a PC''s own, an admin''s all (0107).';

create or replace function public.retention_decide(p_student uuid, p_keep boolean)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_me    uuid := auth.uid();
  v_stage text;
begin
  if v_me is null then raise exception 'sign in first'; end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if not (is_admin() or (is_pc() and exists (select 1 from profiles where id = p_student and pc_id = v_me))) then
    raise exception 'only the student''s PC or an admin decides this';
  end if;

  if p_keep then
    insert into retention_notices (student_id, noticed_at, decision, decided_at, decided_by, kept_at)
    values (p_student, now(), 'keep', now(), v_me, now())
    on conflict (student_id) do update
       set decision = 'keep', decided_at = now(), decided_by = v_me, kept_at = now();
    return jsonb_build_object('kept', true,
      'next_notice', now() + make_interval(days => (select notice_days from retention_policy)));
  end if;

  select s.stage into v_stage from retention_status() s where s.student_id = p_student;
  if v_stage is distinct from 'noticed' and v_stage is distinct from 'due' then
    raise exception 'only a student the clean-up has flagged is deleted from here';
  end if;
  update retention_notices set decision = 'delete', decided_at = now(), decided_by = v_me where student_id = p_student;
  return jsonb_build_object('deleting', true, 'run', run_retention());
end $$;

revoke execute on function public.retention_decide(uuid, boolean) from public, anon, authenticated;
grant  execute on function public.retention_decide(uuid, boolean) to authenticated;

comment on function public.retention_decide(uuid, boolean) is
  'Keep (another notice_days before the next notice) or Delete now (saved, then deleted at once) — the student''s PC or an admin (0107).';

-- -------------------------------------------------------------- the admin ---
create or replace function public.set_retention_rules(
  p_enabled         boolean,
  p_notice_days     int,
  p_grace_days      int,
  p_transcript_days int,
  p_archive_years   int
) returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can change this'; end if;
  if p_notice_days is null or p_notice_days not between 14 and 365 then
    raise exception 'the PC is told after 14 to 365 days';
  end if;
  if p_grace_days is null or p_grace_days not between 7 and 60 then
    raise exception 'the grace after a notice is 7 to 60 days';
  end if;
  if p_transcript_days is null or p_transcript_days not between 30 and 730 then
    raise exception 'a recording is kept 30 to 730 days';
  end if;
  if p_archive_years is null or p_archive_years not between 1 and 10 then
    raise exception 'a saved report is kept 1 to 10 years';
  end if;
  update retention_policy
     set enabled = coalesce(p_enabled, false),
         notice_days = p_notice_days,
         grace_days = p_grace_days,
         transcript_days = p_transcript_days,
         archive_years = p_archive_years,
         updated_at = now(),
         updated_by = auth.uid();
end $$;

revoke execute on function public.set_retention_rules(boolean, int, int, int, int) from public, anon, authenticated;
grant  execute on function public.set_retention_rules(boolean, int, int, int, int) to authenticated;

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
    'notices', coalesce((select jsonb_agg(jsonb_build_object(
                           'student_id', s.student_id, 'full_name', s.full_name, 'display_id', s.display_id,
                           'pc', (select pc.full_name from profiles pc where pc.id = s.pc_id),
                           'last_active', s.last_active, 'noticed_at', s.noticed_at, 'delete_at', s.delete_at,
                           'decision', s.decision, 'stage', s.stage,
                           'emailed_at', n.emailed_at, 'email_error', n.email_error) order by s.delete_at)
                           from retention_status() s join retention_notices n on n.student_id = s.student_id
                          where s.stage in ('noticed', 'due')), '[]'::jsonb),
    'to_notice', coalesce((select jsonb_agg(jsonb_build_object(
                             'student_id', s.student_id, 'full_name', s.full_name, 'display_id', s.display_id,
                             'last_active', s.last_active) order by s.last_active)
                             from retention_status() s where s.stage = 'notice'), '[]'::jsonb),
    'transcripts_due', (select count(*) from retention_old_transcripts()),
    'reports_waiting', (select count(*) from retention_reports_waiting()),
    'reports_saved', (select count(*) from report_archive),
    'reports_expiring', (select count(*) from report_archive a, retention_policy r
                          where a.archived_at < now() - make_interval(years => r.archive_years)));
end $$;

revoke execute on function public.retention_preview() from public, anon, authenticated;
grant  execute on function public.retention_preview() to authenticated;
