-- ============================================================================
--  0071 — old data is cleared, once an admin turns it on
--
--  The brief asks for a data-retention policy: delete inactive profiles after
--  a set period. Two windows, the ones put to Ascend Now:
--
--    a student          deleted with everything of theirs — sessions,
--                       answers, forms, reports, transcripts, notes, PIN —
--                       once nothing has been booked for them for
--                       student_months (12). A month, as the brief first
--                       suggested, would erase the diagnostic every progress
--                       line is measured from whenever a student paused.
--    a recording        a session's transcript, and the model's reading of
--                       it (its quotes are the transcript's), deleted
--                       transcript_days (90) after the session ended. They
--                       are the most sensitive rows — a recording of a minor
--                       — and nothing a student's progress needs.
--
--  It is OFF until an admin turns it on, because the windows are Ascend Now's
--  to confirm and a deletion cannot be undone. Until then, and after, the
--  admin's Settings show what it would delete — every student due now and in
--  the next 30 days, by name — which is the warning before the deletion.
--
--  It runs once a day (pg_cron, where the project has it) and on an admin's
--  "Run now"; a run while it is off deletes nothing. Every run writes what it
--  did onto the policy row.
-- ============================================================================

create table if not exists retention_policy (
  id              boolean primary key default true check (id),
  enabled         boolean not null default false,
  student_months  int     not null default 12 check (student_months between 3 and 60),
  transcript_days int     not null default 90 check (transcript_days between 30 and 730),
  updated_at      timestamptz not null default now(),
  updated_by      uuid references profiles(id) on delete set null,
  last_run_at     timestamptz,
  last_run        jsonb
);

comment on table retention_policy is
  'When old data is deleted (0071): one row. Off until an admin turns it on.';

insert into retention_policy (id) values (true) on conflict (id) do nothing;

alter table retention_policy enable row level security;
drop policy if exists retention_policy_admin_read on retention_policy;
create policy retention_policy_admin_read on retention_policy for select using ((select is_admin()));
revoke insert, update, delete, truncate on retention_policy from anon, authenticated;

-- ----------------------------------------------------------- what is due ---
-- A student's last activity: their latest session, booked or held, or the
-- day they were added when they have none. A session booked for the future
-- keeps them, however long ago the last one was.
create or replace function public.retention_due(p_within interval default interval '0')
returns table (student_id uuid, full_name text, display_id text, last_active timestamptz, due_at timestamptz)
language sql stable security definer set search_path = public as $$
  select p.id, p.full_name, p.display_id, a.last_active,
         a.last_active + make_interval(months => r.student_months)
    from profiles p
    cross join retention_policy r
    cross join lateral (
      select greatest(p.created_at,
                      (select max(greatest(s.scheduled_at, coalesce(s.ended_at, s.scheduled_at)))
                         from sessions s where s.student_id = p.id)) as last_active
    ) a
   where p.role = 'student'
     and a.last_active + make_interval(months => r.student_months) <= now() + p_within
   order by 5, 2
$$;

revoke execute on function public.retention_due(interval) from public, anon, authenticated;

create or replace function public.retention_old_transcripts()
returns table (session_id uuid)
language sql stable security definer set search_path = public as $$
  select t.session_id
    from session_transcripts t
    join sessions s on s.id = t.session_id
    cross join retention_policy r
   where coalesce(s.ended_at, s.scheduled_at) + make_interval(days => r.transcript_days) <= now()
  union
  select x.session_id
    from session_context_extractions x
    join sessions s on s.id = x.session_id
    cross join retention_policy r
   where coalesce(s.ended_at, s.scheduled_at) + make_interval(days => r.transcript_days) <= now()
$$;

revoke execute on function public.retention_old_transcripts() from public, anon, authenticated;

-- --------------------------------------------------------- the admin's ----
create or replace function public.retention_preview()
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can see this'; end if;
  return jsonb_build_object(
    'policy', (select to_jsonb(r) - 'id' from retention_policy r),
    'students_due', coalesce((select jsonb_agg(to_jsonb(d)) from retention_due() d), '[]'::jsonb),
    'students_soon', coalesce((select jsonb_agg(to_jsonb(d)) from retention_due(interval '30 days') d
                                where d.due_at > now()), '[]'::jsonb),
    'transcripts_due', (select count(*) from retention_old_transcripts()));
end $$;

revoke execute on function public.retention_preview() from public, anon, authenticated;
grant  execute on function public.retention_preview() to authenticated;

create or replace function public.set_retention_policy(p_enabled boolean, p_student_months int, p_transcript_days int)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can change this'; end if;
  if p_student_months is null or p_student_months not between 3 and 60 then
    raise exception 'a student is kept 3 to 60 months';
  end if;
  if p_transcript_days is null or p_transcript_days not between 30 and 730 then
    raise exception 'a recording is kept 30 to 730 days';
  end if;
  update retention_policy
     set enabled = coalesce(p_enabled, false),
         student_months = p_student_months,
         transcript_days = p_transcript_days,
         updated_at = now(),
         updated_by = auth.uid();
end $$;

revoke execute on function public.set_retention_policy(boolean, int, int) from public, anon, authenticated;
grant  execute on function public.set_retention_policy(boolean, int, int) to authenticated;

-- ---------------------------------------------------------------- a run ----
-- Deletes nothing while the policy is off. A student's sessions go first —
-- every row of a session cascades from it — then the student's own row, whose
-- PIN, sign-ins, notes and summaries cascade from it, then any sign-in an old
-- self-signed-up student still has.
create or replace function public.run_retention()
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  r          retention_policy;
  v_students uuid[];
  v_sessions int := 0;
  v_rec      int := 0;
  v_read     int := 0;
  v_out      jsonb;
begin
  select * into r from retention_policy;
  if not r.enabled then
    v_out := jsonb_build_object('ran', false, 'reason', 'off');
    update retention_policy set last_run_at = now(), last_run = v_out;
    return v_out;
  end if;

  select coalesce(array_agg(d.student_id), '{}') into v_students from retention_due() d;

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

  with old as (select session_id from retention_old_transcripts())
  delete from session_context_extractions x using old where x.session_id = old.session_id;
  get diagnostics v_read = row_count;
  with old as (select session_id from retention_old_transcripts())
  delete from session_transcripts t using old where t.session_id = old.session_id;
  get diagnostics v_rec = row_count;
  -- Readings whose transcript went in the same run were counted above.

  v_out := jsonb_build_object('ran', true, 'students', cardinality(v_students), 'sessions', v_sessions,
                              'transcripts', v_rec, 'readings', v_read);
  update retention_policy set last_run_at = now(), last_run = v_out;
  return v_out;
end $$;

revoke execute on function public.run_retention() from public, anon, authenticated;

create or replace function public.run_retention_now()
returns jsonb
language plpgsql security definer set search_path = public as $$
begin
  if not is_admin() then raise exception 'only an admin can run this'; end if;
  return run_retention();
end $$;

revoke execute on function public.run_retention_now() from public, anon, authenticated;
grant  execute on function public.run_retention_now() to authenticated;

-- ------------------------------------------------------------ every day ----
-- Where the project has pg_cron, once a day at 03:17 UTC. A plain Postgres
-- without it (the local rebuild) skips this; "Run now" still works.
do $$
begin
  if exists (select 1 from pg_available_extensions where name = 'pg_cron') then
    create extension if not exists pg_cron;
    perform cron.schedule('sat-retention', '17 3 * * *', 'select public.run_retention()');
  end if;
exception when others then
  raise warning 'pg_cron not scheduled (%): use Run now in Settings', sqlerrm;
end $$;
