-- ============================================================================
--  0017 — leaving a test is a decision, and it is final
--
--  A student part-way through a paper could walk out of it with the browser's
--  back button and walk back in, and the questions they had not reached were
--  still waiting.  That is not a test — the per-question clock means nothing
--  if the question can be left and returned to, and the whole point of
--  publishing one question at a time (0016) was that the clock should mean
--  something.
--
--  So leaving ends the paper.  The screen asks first, and if the student says
--  yes this is what happens: the session is completed, and every question they
--  had not answered is voided rather than left hanging — including the one on
--  screen, which they were being timed on and did not answer.
--
--  A voided item is already understood everywhere: it is not published, so the
--  student cannot read it; it is not answered, so it is not in the report's
--  score; and the teacher's board shows it for what it is.  Nothing else had
--  to learn a new state.
-- ============================================================================

create or replace function public.finish_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_status session_status;
  v_left   int;
begin
  select status into v_status
    from sessions where id = p_session and student_id = auth.uid();

  if not found then raise exception 'not your session'; end if;
  if v_status = 'cancelled' then raise exception 'this session is cancelled'; end if;

  -- Everything they never answered, including the one they were looking at.
  update session_items
     set status = 'voided'
   where session_id = p_session
     and status in ('staged', 'published');
  get diagnostics v_left = row_count;

  update sessions
     set status   = 'completed',
         ended_at = coalesce(ended_at, now())
   where id = p_session;

  return v_left;
end $$;

revoke execute on function public.finish_session_as_student(uuid) from anon;

comment on function public.finish_session_as_student(uuid) is
  'The student ends their own paper. Unanswered questions are voided and the session is completed. Called when they choose to leave a test in progress.';
