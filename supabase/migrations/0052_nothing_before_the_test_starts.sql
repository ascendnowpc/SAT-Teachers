-- ============================================================================
--  0052 — nothing happens to a session before its test has started
--
--  The console offered the level buttons, and End session, from the moment a
--  session was scheduled. Moving the level before the start only changed the
--  note of which test the student would begin on — so a session could start
--  somewhere the teacher had clicked on the way past — and ending it handed in
--  a test nobody had sat, filing a lesson that never happened as completed.
--
--  Both wait for the test now, as choosing a question already did (0047):
--  set_session_level and teacher_finish_session refuse a session that is still
--  scheduled, in the words teacher_choose_question uses. A session starts on
--  the test its level names — easy, unless it was moved before this — and once
--  it is running the teacher moves it from there.
--
--  Starting it is untouched: the student opens it from their link, or the
--  teacher starts it for them (teacher_start_session), and either makes it
--  live.
-- ============================================================================

create or replace function public.set_session_level(p_session uuid, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_status session_status;
  v_level  text;
begin
  perform assert_session_teacher(p_session);

  select status, level into v_status, v_level from sessions where id = p_session;

  if p_level not in ('easy','medium','hard') then
    raise exception 'a level is easy, medium or hard';
  end if;
  if v_status in ('completed','cancelled') then raise exception 'this session is over'; end if;
  if v_status <> 'live' then raise exception 'the test has not started yet'; end if;

  if p_level = v_level and exists (select 1 from session_items where session_id = p_session) then
    return 0;
  end if;

  return load_session_level(p_session, p_level);
end $$;

comment on function public.set_session_level(uuid, text) is
  'Moves a session to another test: the question on the screen is set aside, the test is queued from the top, and its first question opens. The session''s teacher or an admin (0050), and only once the test has started (0052).';

create or replace function public.teacher_finish_session(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_status session_status;
begin
  perform assert_session_teacher(p_session);

  select status into v_status from sessions where id = p_session;
  if v_status = 'scheduled' then raise exception 'the test has not started yet'; end if;

  return end_session_now(p_session);
end $$;

comment on function public.teacher_finish_session(uuid) is
  'The teacher hands the test in. Unanswered questions are voided and the session is completed. Only once the test has started (0052).';
