-- ============================================================================
--  0049 — the admin can fill in the diagnostic form
--
--  0048 let an admin correct the transcript and generate the report, and
--  stopped at the form: the grid and the comments stayed the teacher's to
--  write. The first admin to open a session's form and press save met this —
--
--      new row violates row-level security policy for table "session_domain_notes"
--
--  — because the form saves the grid first, and the grid was the one thing on
--  the page an admin could not write. The transcript it saves third was
--  already theirs. A form is one page and one save; half of it open to an
--  admin is none of it.
--
--  So an admin writes the whole write-up now:
--
--    * the grid                  session_domain_notes, insert and update
--    * the comments, and the     session_reports, insert and update
--      report's written text
--    * the transcript            since 0048
--    * handing the form in       submit_diagnostic_form, whose checks do not
--                                move: four domains filled, a transcript, and
--                                comments
--    * generating the report     since 0048
--
--  What stays the teacher's is what reaches the family. publish_report and
--  unpublish_report have always checked for the session's teacher; but an
--  UPDATE policy on session_reports is also a way to set its status by hand,
--  so a trigger holds the same line there — an admin writing the row directly
--  can change anything on it but whether it is published. The same rule, held
--  where a crafted request cannot step around it.
--
--  form_submitted_by joins 0048's generated_by: whoever handed the form in.
-- ============================================================================

-- ---------------------------------------------------------------- the grid --
drop policy if exists domain_notes_admin_insert on session_domain_notes;
create policy domain_notes_admin_insert on session_domain_notes
  for insert with check (is_admin());

drop policy if exists domain_notes_admin_update on session_domain_notes;
create policy domain_notes_admin_update on session_domain_notes
  for update using (is_admin()) with check (is_admin());

-- ------------------------------------------------------------ the report ---
drop policy if exists reports_admin_insert on session_reports;
create policy reports_admin_insert on session_reports
  for insert with check (is_admin());

drop policy if exists reports_admin_update on session_reports;
create policy reports_admin_update on session_reports
  for update using (is_admin()) with check (is_admin());

alter table session_reports add column if not exists form_submitted_by uuid references profiles(id);

comment on column session_reports.form_submitted_by is
  'Who handed the diagnostic form in: the session''s teacher or an admin. Set by submit_diagnostic_form.';

-- ------------------------------------------------------------ publishing ---
-- Not an admin's, whichever way they come at it. The session's own teacher,
-- the migration role and the service role are not what this is about, and pass.
create or replace function public.guard_report_publishing()
returns trigger language plpgsql set search_path = public as $$
begin
  if auth.uid() is null
     or not is_admin()
     or exists (select 1 from sessions s where s.id = new.session_id and s.teacher_id = auth.uid()) then
    return new;
  end if;

  if tg_op = 'INSERT' then
    if new.status = 'published' or new.published_at is not null then
      raise exception 'publishing a report is the teacher''s step';
    end if;
  elsif new.status is distinct from old.status
     or new.published_at is distinct from old.published_at then
    raise exception 'publishing a report is the teacher''s step';
  end if;

  return new;
end $$;

revoke execute on function public.guard_report_publishing() from public, anon, authenticated;

drop trigger if exists session_reports_guard_publishing on session_reports;
create trigger session_reports_guard_publishing
  before insert or update on session_reports
  for each row execute function public.guard_report_publishing();

-- ----------------------------------------------------- handing the form in --
-- 0030's, with the caller widened to an admin and the caller recorded. Every
-- check stands for both.
create or replace function public.submit_diagnostic_form(p_session uuid)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare
  v_filled int;
  v_at     timestamptz;
begin
  perform assert_session_teacher_or_admin(p_session);

  select count(*) into v_filled
    from session_domain_notes n
   where n.session_id = p_session
     and n.performance is not null
     and coalesce(btrim(n.strengths), '') <> ''
     and coalesce(btrim(n.gaps),      '') <> ''
     and coalesce(btrim(n.targets),   '') <> '';

  if v_filled <> 4 then
    raise exception 'the evaluation grid is incomplete: % of 4 domains filled in', v_filled;
  end if;

  if not exists (select 1 from session_transcripts t
                  where t.session_id = p_session and btrim(t.body) <> '') then
    raise exception 'the Fathom transcript is missing';
  end if;

  if not exists (select 1 from session_reports r
                  where r.session_id = p_session
                    and coalesce(btrim(r.teacher_reflection), '') <> '') then
    raise exception 'the teacher''s comments are missing';
  end if;

  v_at := now();
  update session_reports
     set form_submitted_at = v_at,
         form_submitted_by = auth.uid()
   where session_id = p_session;
  return v_at;
end $$;

-- Signed in only, per 0035.
revoke execute on function public.submit_diagnostic_form(uuid) from public, anon;
grant  execute on function public.submit_diagnostic_form(uuid) to authenticated;

comment on function public.submit_diagnostic_form(uuid) is
  'Hands the diagnostic form in once every field is filled. The session''s teacher or an admin.';
