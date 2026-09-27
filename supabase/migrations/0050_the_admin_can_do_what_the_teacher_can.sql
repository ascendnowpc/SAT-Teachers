-- ============================================================================
--  0050 — the admin can do what the teacher can, on every session
--
--  0044 made the admin a reader, and 0048 and 0049 opened the write-up to them
--  one door at a time: the transcript, the form, generating. The first admin
--  to pick a session up went through it the way its teacher would — the
--  console, the form, Publish results, Generate — and met "not your session"
--  at every step that was not one of those doors.
--
--  An admin is who picks a session up when its teacher cannot: a teacher off
--  sick with a report due, a form handed in wrong, results nobody has sent.
--  Oversight that has to ask the teacher to press each button is not
--  oversight. So an admin now has what the session's teacher has, on every
--  session:
--
--    * every RPC that runs a session. They all open with
--      assert_session_teacher, so that is where the change is: the gate lets
--      an active admin through for any session that exists. Starting it,
--      letting the student in early, moving the level, choosing the question,
--      answering for the student, ending it, revealing the answers, the
--      diagnoses, generating, publishing and unpublishing the report.
--
--    * every row a session writes: one policy per table, for every command,
--      beside the teacher's own — sessions, session_items,
--      session_item_assessments, session_transcripts, session_domain_notes and
--      session_reports. It replaces 0044's read policies and 0048's and 0049's
--      insert and update ones, which it covers.
--
--    * publishing. 0049's trigger refused an admin who changed a report's
--      status; publish_report lets them now, and a wall that a permitted RPC
--      walks through is not a wall.
--
--  Who did it is still recorded — generated_by, form_submitted_by, the
--  transcript's uploaded_by — so a teacher reading their console is told when
--  it was an admin. What nobody gains: writing the model's reading of the
--  recording (the edge function stores it on the service role, after its quote
--  check), or making anybody an admin.
-- ============================================================================

-- ------------------------------------------------------------------ the gate --
create or replace function public.assert_session_teacher(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  if exists (select 1 from sessions where id = p_session and teacher_id = auth.uid()) then
    return;
  end if;

  if is_admin() then
    if not exists (select 1 from sessions where id = p_session) then
      raise exception 'no such session';
    end if;
    return;
  end if;

  raise exception 'not your session';
end $$;

revoke execute on function public.assert_session_teacher(uuid) from public, anon, authenticated;

comment on function public.assert_session_teacher(uuid) is
  'Raises unless the caller teaches this session or is an admin. The gate every session RPC opens with. Internal.';

-- 0048's, which is the gate now. Kept for the functions that call it by name.
create or replace function public.assert_session_teacher_or_admin(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
end $$;

revoke execute on function public.assert_session_teacher_or_admin(uuid) from public, anon, authenticated;

comment on function public.assert_session_teacher_or_admin(uuid) is
  'The same as assert_session_teacher since 0050, which lets an admin through itself. Internal.';

-- ------------------------------------------------------------------ the rows --
-- One admin policy per table, the shape of the teacher's own.
drop policy if exists sessions_admin_read on sessions;
drop policy if exists sessions_admin on sessions;
create policy sessions_admin on sessions
  for all using (is_admin()) with check (is_admin());

drop policy if exists items_admin_read on session_items;
drop policy if exists items_admin on session_items;
create policy items_admin on session_items
  for all using (is_admin()) with check (is_admin());

drop policy if exists assessments_admin_read on session_item_assessments;
drop policy if exists assessments_admin on session_item_assessments;
create policy assessments_admin on session_item_assessments
  for all using (is_admin()) with check (is_admin());

drop policy if exists transcripts_admin_read on session_transcripts;
drop policy if exists transcripts_admin_insert on session_transcripts;
drop policy if exists transcripts_admin_update on session_transcripts;
drop policy if exists transcripts_admin on session_transcripts;
create policy transcripts_admin on session_transcripts
  for all using (is_admin()) with check (is_admin());

drop policy if exists domain_notes_admin_read on session_domain_notes;
drop policy if exists domain_notes_admin_insert on session_domain_notes;
drop policy if exists domain_notes_admin_update on session_domain_notes;
drop policy if exists domain_notes_admin on session_domain_notes;
create policy domain_notes_admin on session_domain_notes
  for all using (is_admin()) with check (is_admin());

drop policy if exists reports_admin_read on session_reports;
drop policy if exists reports_admin_insert on session_reports;
drop policy if exists reports_admin_update on session_reports;
drop policy if exists reports_admin on session_reports;
create policy reports_admin on session_reports
  for all using (is_admin()) with check (is_admin());

-- ------------------------------------------------------------ publishing ---
drop trigger if exists session_reports_guard_publishing on session_reports;
drop function if exists public.guard_report_publishing();
