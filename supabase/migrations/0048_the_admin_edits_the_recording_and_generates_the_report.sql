-- ============================================================================
--  0048 — the admin edits the recording and generates the report
--
--  0044 made the admin a reader: a SELECT policy on every table a session
--  leaves a trace in and no write policy anywhere, so that a button added to an
--  admin screen by mistake would fail at the database. That was the right
--  default and it is still the default. This opens two doors in it, on
--  purpose, and nothing else:
--
--    * THE RECORDING. An admin can put a session's Fathom transcript in, or
--      replace it, or correct it — a transcript the teacher never uploaded, the
--      wrong call pasted into the right session, a speaker label Zoom got wrong.
--      Insert and update on session_transcripts, not delete: a report cannot be
--      generated without a transcript, and taking one away is not an edit.
--
--    * THE REPORT. generate_report takes the call from an admin as well as
--      from the session's teacher. Its rules do not move for either of them:
--      the teacher's diagnostic form must be in, and a reading of a transcript
--      that has since changed is refused. An admin generates the report the
--      teacher's form describes; they do not write the form, and they do not
--      publish — sending a report to a parent stays the teacher's step.
--
--  Reading the recording — the model call between the transcript and the
--  report — is an edge function, not SQL, and it checked the caller against the
--  session's teacher itself. It asks is_admin() as well now; see
--  supabase/functions/extract_session_context. Everything it reads it reads as
--  the caller, and 0044 already lets an admin read all of it.
--
--  And two stamps, because a thing two roles can do is a thing somebody will
--  one day ask "who did that" about:
--
--    * session_reports.generated_by — whoever pressed Generate, teacher or
--      admin, set by generate_report rather than by the client.
--
--    * the transcript is dated and signed when its text changes. uploaded_by
--      has been on the table since 0013, and only the seeds of the recorded
--      sessions ever set it — no upload from the app did. And
--      created_at was only ever the first upload's: a replacement is an
--      upsert, which leaves it alone — so the console's "the transcript was
--      replaced after the last reading", which compares created_at with the
--      reading's, never fired for a replacement. generate_report's md5 check
--      caught it and said so, one click too late. A trigger now moves both
--      whenever the body changes, for whoever changes it.
-- ============================================================================

-- ------------------------------------------------------------------ who ----
-- The session's teacher, or an admin. Internal: the functions that call it do
-- the work, and a client has nothing to ask it.
create or replace function public.assert_session_teacher_or_admin(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  if is_admin() then
    if not exists (select 1 from sessions where id = p_session) then
      raise exception 'no such session';
    end if;
    return;
  end if;
  perform assert_session_teacher(p_session);
end $$;

revoke execute on function public.assert_session_teacher_or_admin(uuid) from public, anon, authenticated;

comment on function public.assert_session_teacher_or_admin(uuid) is
  'Raises unless the caller teaches this session or is an admin. Internal.';

-- ------------------------------------------------------------ the report ---
alter table session_reports add column if not exists generated_by uuid references profiles(id);

comment on column session_reports.generated_by is
  'Who last generated the report: the session''s teacher or an admin. Set by generate_report.';

-- 0031's, with the caller widened to an admin and the caller recorded. Both
-- refusals stand for everybody.
create or replace function public.generate_report(p_session uuid)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare
  v_at    timestamptz;
  v_body  text;
  v_md5   text;
begin
  perform assert_session_teacher_or_admin(p_session);

  if not exists (select 1 from session_reports r
                  where r.session_id = p_session and r.form_submitted_at is not null) then
    raise exception 'the diagnostic form has not been submitted yet';
  end if;

  select t.body into v_body from session_transcripts t where t.session_id = p_session;
  select e.transcript_md5 into v_md5
    from session_context_extractions e where e.session_id = p_session;

  if v_md5 is not null and v_md5 <> md5(v_body) then
    raise exception 'the transcript changed after the recording was read — read it again before generating';
  end if;

  v_at := now();
  update session_reports
     set generated_at = v_at,
         generated_by = auth.uid()
   where session_id = p_session;
  return v_at;
end $$;

-- Signed in only, per 0035. It has refused an anonymous caller since 0030 —
-- assert_session_teacher asks auth.uid() — and being refused is not the same as
-- being unable to ask.
revoke execute on function public.generate_report(uuid) from public, anon;
grant  execute on function public.generate_report(uuid) to authenticated;

comment on function public.generate_report(uuid) is
  'Stamps the report generated from the teacher''s submitted form. The session''s teacher or an admin; refuses before the form is in, and refuses a reading of a transcript that has since changed.';

-- ---------------------------------------------------------- the recording ---
-- Insert and update, not delete, and not "for all": the policy an admin needs
-- to put a transcript in or change one, and no more.
drop policy if exists transcripts_admin_insert on session_transcripts;
create policy transcripts_admin_insert on session_transcripts
  for insert with check (is_admin());

drop policy if exists transcripts_admin_update on session_transcripts;
create policy transcripts_admin_update on session_transcripts
  for update using (is_admin()) with check (is_admin());

-- Dated and signed when the text changes. Saving a form whose transcript is
-- unchanged upserts the same body again, and that is not a new recording.
create or replace function public.stamp_transcript()
returns trigger language plpgsql set search_path = public as $$
begin
  if tg_op = 'INSERT' or new.body is distinct from old.body then
    new.uploaded_by := coalesce(auth.uid(), new.uploaded_by);
    if tg_op = 'UPDATE' then
      new.created_at := now();
    end if;
  end if;
  return new;
end $$;

revoke execute on function public.stamp_transcript() from public, anon, authenticated;

drop trigger if exists session_transcripts_stamp on session_transcripts;
create trigger session_transcripts_stamp
  before insert or update on session_transcripts
  for each row execute function public.stamp_transcript();

comment on column session_transcripts.created_at is
  'When this text went in: the first upload, or the latest change to it. A reading older than this is a reading of another recording.';
comment on column session_transcripts.uploaded_by is
  'Who put this text in — the session''s teacher or an admin. Set by trigger whenever the body changes.';
