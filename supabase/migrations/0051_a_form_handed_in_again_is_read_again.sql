-- ============================================================================
--  0051 — a form handed in again is read again
--
--  The reading of the recording is taken against the teacher's form: the model
--  is shown the grid and the comments, and every piece of evidence it keeps is
--  filed as supporting, complicating or adding to what the form says. So a
--  reading belongs to the form it was taken against as well as to the
--  transcript — and only the transcript was ever checked. Hand the form in
--  again with a gap rewritten and generating reused the old reading, whose
--  "complicates what the teacher wrote" was about a sentence no longer there.
--
--  Three things:
--
--    * the reading is dated when it is taken, every time. The edge function
--      stores it with an upsert, and an upsert writes only the columns it is
--      given — so created_at stayed the FIRST reading's date for ever after,
--      and a reading taken again still looked older than the transcript it had
--      just been taken from.
--
--    * generate_report refuses a reading older than the latest hand-in of the
--      form, as it has refused one of a different transcript since 0031: read
--      it again first. The screens do that on their own when a form is handed
--      in again.
--
--    * generating without the recording is a way through rather than a dead
--      end. When a reading fails the screens offer to generate from the form
--      and the answers alone — and with a stale reading on the session,
--      generate_report refused that too, so there was no way to finish at all.
--      Asked to go ahead without it, it now removes the stale reading, so the
--      report says it has no reading rather than showing one of another form
--      or another recording.
-- ============================================================================

-- ------------------------------------------------- dated when it is taken ---
create or replace function public.stamp_reading()
returns trigger language plpgsql set search_path = public as $$
begin
  new.created_at := now();
  return new;
end $$;

revoke execute on function public.stamp_reading() from public, anon, authenticated;

drop trigger if exists session_context_extractions_stamp on session_context_extractions;
create trigger session_context_extractions_stamp
  before insert or update on session_context_extractions
  for each row execute function public.stamp_reading();

comment on column session_context_extractions.created_at is
  'When this reading was taken, the latest time it was. Older than the transcript''s created_at or the form''s form_submitted_at, it is a reading of another recording or another form.';

-- ------------------------------------------------------------ generating ---
-- A new signature, so the old one goes rather than standing beside it: two
-- overloads that both answer { p_session } are one PostgREST cannot choose
-- between. A caller that passes only p_session gets what it always got.
drop function if exists public.generate_report(uuid);

create or replace function public.generate_report(p_session uuid, p_without_reading boolean default false)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare
  v_form_at timestamptz;
  v_md5     text;
  v_read_at timestamptz;
  v_stale   text;
  v_at      timestamptz;
begin
  perform assert_session_teacher(p_session);

  select r.form_submitted_at into v_form_at
    from session_reports r where r.session_id = p_session;
  if v_form_at is null then
    raise exception 'the diagnostic form has not been submitted yet';
  end if;

  select e.transcript_md5, e.created_at into v_md5, v_read_at
    from session_context_extractions e where e.session_id = p_session;

  if found then
    if v_md5 is distinct from (select md5(t.body) from session_transcripts t
                                where t.session_id = p_session) then
      v_stale := 'the transcript changed after the recording was read';
    elsif v_read_at < v_form_at then
      v_stale := 'the diagnostic form was handed in again after the recording was read';
    end if;
  end if;

  if v_stale is not null then
    if not coalesce(p_without_reading, false) then
      raise exception '% — read it again before generating', v_stale;
    end if;
    delete from session_context_extractions where session_id = p_session;
  end if;

  v_at := now();
  update session_reports
     set generated_at = v_at,
         generated_by = auth.uid()
   where session_id = p_session;
  return v_at;
end $$;

-- Signed in only, per 0035.
revoke execute on function public.generate_report(uuid, boolean) from public, anon;
grant  execute on function public.generate_report(uuid, boolean) to authenticated;

comment on function public.generate_report(uuid, boolean) is
  'Stamps the report generated from the submitted form. The session''s teacher or an admin. Refuses before the form is in, and refuses a reading of another transcript or of an earlier hand-in of the form — unless asked to go ahead without the reading, which removes the stale one.';
