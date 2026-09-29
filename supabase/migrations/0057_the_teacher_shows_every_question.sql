-- ============================================================================
--  0057 — the teacher shows every question
--
--  Until now the test ran itself: starting it loaded the easy test and put its
--  first question up, and every answer put up the next one in the queue. The
--  teacher could reach in (0047), but a lesson left alone walked through the
--  test in order, and the student's button said Next.
--
--  That is not how the lessons are run. The teacher chooses the question and
--  shows it, and that is the only way a question reaches the student's screen.
--  So nothing is queued any more:
--
--    * starting the test puts nothing up. The session goes live and the student
--      waits for the first question the teacher chooses.
--    * answering puts nothing up. The answer is graded and timed exactly as
--      before, and the student waits for the next question the teacher chooses.
--    * teacher_choose_question puts the one question up, and only that one. With
--      a question still open, "now" sets it aside as it always has; "not now"
--      has nothing left to wait in — there is no queue for the chosen question
--      to sit at the front of — so it is refused while a question is open, and
--      is the same as now when nothing is.
--    * a level button puts up the first question of that test the student has
--      not had in front of them, and nothing behind it.
--
--  What does not change: exactly one item is published at a time, a question
--  is put in front of the student once, the student's screen says nothing
--  about which test a question came from, and record_answer still answers and
--  checks the item is open in one statement.
--
--  Staged rows stop being made. The ones a live session is holding from before
--  this are deleted, for the reason 0027 gave for deleting them on a level
--  move: they were never in front of the student and they carry nothing. Left
--  behind, the first answer after this migration would still put one up.
-- ============================================================================

-- ------------------------------------------------------- one question up --
-- Internal. Puts one question from one test in front of the student and moves
-- the session onto that test. The caller has already decided the question may
-- be asked, and has set aside whatever was on the screen.
create or replace function public.show_one_question(p_session uuid, p_question uuid, p_set uuid)
returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid;
  v_seq     int;
  v_item    uuid;
begin
  select student_id into v_student from sessions where id = p_session;

  -- Anything a session was holding from before 0057.
  delete from session_items where session_id = p_session and status = 'staged';

  select coalesce(max(sequence_no), 0) + 1 into v_seq
    from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  values (p_session, p_question, v_student, v_seq)
  returning id into v_item;

  perform publish_one_item(v_item);

  update sessions
     set level      = (select level from question_sets where id = p_set),
         level_size = (select count(*)
                         from session_items si
                         join question_set_items qi
                           on qi.question_id = si.question_id and qi.set_id = p_set
                        where si.session_id = p_session and si.status <> 'voided')
   where id = p_session;

  return v_item;
end $$;

revoke execute on function public.show_one_question(uuid, uuid, uuid) from public, anon, authenticated;

comment on function public.show_one_question(uuid, uuid, uuid) is
  'Puts one question in front of the student, and nothing behind it, and moves the session onto its test. Internal — the callers check who is asking and whether it may be asked.';

-- Nothing builds a queue now.
drop function if exists public.queue_test(uuid, uuid, int);

-- ------------------------------------------------------- loading a level ----
-- The level buttons. The question on the screen is set aside, and the first
-- question of the test that has not been in front of the student goes up — one
-- question, not the test. A test with nothing left in it says so rather than
-- clearing the student's screen for nothing.
create or replace function public.load_session_level(p_session uuid, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_set   uuid;
  v_open  uuid;
  v_first uuid;
begin
  if p_level not in ('easy','medium','hard') then
    raise exception 'a level is easy, medium or hard';
  end if;

  select qs.id into v_set
    from question_sets qs
    join sessions s on s.id = p_session
   where qs.level = p_level and qs.subject = s.subject and qs.is_active;

  if v_set is null then
    raise exception 'there is no % test for this subject', p_level;
  end if;

  v_open := lock_open_item(p_session);

  select qi.question_id into v_first
    from question_set_items qi
   where qi.set_id = v_set
     and not exists (select 1 from session_items si
                      where si.session_id = p_session
                        and si.question_id = qi.question_id
                        and si.status <> 'staged')
   order by qi.position
   limit 1;

  if v_first is null then
    raise exception 'every question in the % test has already been in front of them', p_level;
  end if;

  if v_open is not null then
    update session_items set status = 'voided' where id = v_open;
  end if;

  perform show_one_question(p_session, v_first, v_set);
  return 1;
end $$;

revoke execute on function public.load_session_level(uuid, text) from public, anon, authenticated;

comment on function public.load_session_level(uuid, text) is
  'Sets aside the question on the screen and puts up the first question of that level''s test the student has not had in front of them — one question, nothing queued (0057). Internal.';

-- ------------------------------------------------------------- the choice --
create or replace function public.teacher_choose_question(
  p_session  uuid,
  p_question uuid,
  p_now      boolean
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_status  session_status;
  v_subject text;
  v_set     uuid;
  v_open    uuid;
  v_was     item_status;
begin
  perform assert_session_teacher(p_session);

  select status, subject into v_status, v_subject from sessions where id = p_session;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if v_status <> 'live' then raise exception 'the test has not started yet'; end if;

  select qs.id into v_set
    from question_set_items qi
    join question_sets qs on qs.id = qi.set_id
   where qi.question_id = p_question
     and qs.subject = v_subject
     and qs.is_active
     and qs.level is not null;

  if v_set is null then
    raise exception 'that question is not in any of this subject''s tests';
  end if;

  v_open := lock_open_item(p_session);

  select status into v_was
    from session_items
   where session_id = p_session and question_id = p_question and status <> 'staged'
   limit 1;

  if v_was = 'published' then
    raise exception 'that question is on their screen now';
  elsif v_was in ('answered', 'revealed') then
    raise exception 'they have already answered that question';
  elsif v_was is not null then
    raise exception 'that question has already been in front of them';
  end if;

  if v_open is not null then
    if not p_now then
      raise exception 'they are still on a question — show this one now to set that one aside';
    end if;
    update session_items set status = 'voided' where id = v_open;
  end if;

  return show_one_question(p_session, p_question, v_set);
end $$;

revoke execute on function public.teacher_choose_question(uuid, uuid, boolean) from public, anon;
grant  execute on function public.teacher_choose_question(uuid, uuid, boolean) to authenticated;

comment on function public.teacher_choose_question(uuid, uuid, boolean) is
  'Puts one question from any of the subject''s three tests in front of the student, setting aside what is on their screen, and nothing after it (0057). Teacher only, while the test is running.';

-- ------------------------------------------------------------- the opening --
-- 0033's open_session_now without the loading. The session goes live and the
-- student waits for the teacher's first question.
create or replace function public.open_session_now(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_scheduled timestamptz;
  v_early     timestamptz;
  v_status    session_status;
begin
  select scheduled_at, opened_early_at, status
    into v_scheduled, v_early, v_status
    from sessions where id = p_session;

  if not found then raise exception 'no such session'; end if;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if now() < v_scheduled and v_early is null then
    raise exception 'this session has not opened yet';
  end if;

  update sessions
     set status     = 'live',
         started_at = coalesce(started_at, now())
   where id = p_session and status = 'scheduled';

  return (select level_size from sessions where id = p_session);
end $$;

revoke execute on function public.open_session_now(uuid) from public, anon, authenticated;

comment on function public.open_session_now(uuid) is
  'Opens a session. Nothing is put on the student''s screen until the teacher chooses it (0057). Internal — the callers check who is asking.';

-- ---------------------------------------------------------------- the loop --
-- 0047's record_answer without its last step: answering no longer puts the
-- next question up. Everything else is as it was, including the write that is
-- also the check the question is still open.
create or replace function public.record_answer(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
declare
  v_status  item_status;
  v_correct answer_option;
  v_started timestamptz;
  v_ended   timestamptz;
  v_elapsed int;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), coalesce(si.decided_at, now())
    into v_status, v_started, v_ended
    from session_items si
   where si.id = p_item;

  if not found then raise exception 'no such question'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status             = 'answered',
         answered_at        = now(),
         decided_at         = coalesce(decided_at, now()),
         selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence,
         student_reasoning  = nullif(btrim(p_reasoning), '')
   where id = p_item
     and status = 'published';

  if not found then raise exception 'that question is not open for answering'; end if;

  select correct_option into v_correct
    from question_keys k
    join session_items si on si.question_id = k.question_id
   where si.id = p_item;

  v_elapsed := greatest(0, extract(epoch from (v_ended - coalesce(v_started, v_ended)))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, p_option = v_correct, v_elapsed)
  on conflict (session_item_id) do update
    set is_correct = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at = now();
end $$;

revoke execute on function public.record_answer(uuid, answer_option, answer_option[], smallint, text)
  from public, anon, authenticated;

comment on function public.record_answer(uuid, answer_option, answer_option[], smallint, text) is
  'Grades one answer. Puts nothing else up — the teacher shows the next question (0057). Internal — the callers check who is answering.';

-- ------------------------------------------------------ what was queued --
delete from session_items si
 using sessions s
 where s.id = si.session_id
   and s.status = 'live'
   and si.status = 'staged';

-- -------------------------------------------------------------- the notes --
comment on column sessions.level is
  'Which of the three tests the question the teacher last showed came from. Starts easy; never shown to the student.';

comment on column sessions.level_size is
  'How many questions of the current test this session has put in front of the student, not counting any set aside.';
