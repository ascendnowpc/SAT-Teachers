-- ============================================================================
--  0025 — letting them in early
--
--  There was an "Open early" button once (bec3d72) and it was taken out the
--  same day (5fb08c4), because it did not work: it flipped the session to
--  'live', which published nothing and simultaneously hid the student's own
--  Start button — the session was neither open nor openable, and the student
--  sat on "Nothing to answer yet" with no way in.
--
--  The need behind it was real, though.  The call starts at ten past, the
--  student is already there, and nobody wants to watch a countdown.  So the
--  button comes back, and this time it moves the thing that actually decides:
--  the gate in start_session_as_student.
--
--  It does NOT rewrite scheduled_at.  That is when the session was arranged,
--  and it stays true — the cards, the lobby and the report all read it, and a
--  session that says it is at 16:00 should still say so after a teacher let
--  the student in at 15:40.  Instead the early opening is its own fact:
--
--    opened_early_at   when a teacher waived the clock, or null
--
--  which is a record of something that happened rather than the erasure of
--  something that was planned.  The gate reads both.
--
--  Status is left alone.  It goes 'live' when the student starts, as it has
--  since 0016, which is the mistake the first version of this button made.
-- ============================================================================

alter table sessions add column if not exists opened_early_at timestamptz;

comment on column sessions.opened_early_at is
  'When a teacher let the student in ahead of scheduled_at. Null normally. scheduled_at is never rewritten — this is the waiver, not a new time.';

-- ------------------------------------------------------------ the waiver ----
-- A toggle rather than a one-way door: a teacher who clicks it on the wrong
-- session should be able to take it back, and can — right up until the student
-- has actually started, after which there is nothing left to waive.
create or replace function public.set_session_open_early(p_session uuid, p_open boolean)
returns timestamptz
language plpgsql security definer set search_path = public as $$
declare v_status session_status; v_at timestamptz;
begin
  perform assert_session_teacher(p_session);

  select status into v_status from sessions where id = p_session;
  if v_status <> 'scheduled' then
    raise exception 'this session has already started';
  end if;

  update sessions
     set opened_early_at = case when coalesce(p_open, false) then coalesce(opened_early_at, now()) end
   where id = p_session
  returning opened_early_at into v_at;

  return v_at;
end $$;

revoke execute on function public.set_session_open_early(uuid, boolean) from anon;

comment on function public.set_session_open_early(uuid, boolean) is
  'Waives the scheduled time so the student can start now, or takes the waiver back. Teacher only, and only before the student has started.';

-- ------------------------------------------------------------- the gate -----
-- 0023's function with one clause widened: the scheduled time is the gate
-- unless a teacher has opened it. Everything else is unchanged, including the
-- refusal to open somebody else's session and the pacing branch at the end.
create or replace function public.start_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_scheduled timestamptz;
  v_early     timestamptz;
  v_status    session_status;
  v_pacing    text;
  v_queued    int;
  v_first     uuid;
begin
  select scheduled_at, opened_early_at, status, pacing
    into v_scheduled, v_early, v_status, v_pacing
    from sessions where id = p_session and student_id = auth.uid();

  if not found then raise exception 'not your session'; end if;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if now() < v_scheduled and v_early is null then
    raise exception 'this session has not opened yet';
  end if;

  select count(*) into v_queued from session_items where session_id = p_session;
  if v_queued = 0 then raise exception 'there are no questions in this session yet'; end if;

  update sessions
     set status     = 'live',
         started_at = coalesce(started_at, now())
   where id = p_session and status = 'scheduled';

  if v_pacing = 'student' then
    -- Only the first one. Everything after it arrives as the student answers.
    select id into v_first
      from session_items
     where session_id = p_session and status = 'staged'
     order by sequence_no
     limit 1;

    if v_first is not null then
      perform publish_one_item(v_first);
    end if;
  end if;

  return v_queued;
end $$;

revoke execute on function public.start_session_as_student(uuid) from anon;
