-- ============================================================================
--  0047 — the teacher chooses what comes next
--
--  From a teacher's notes on a diagnostic: she wanted to move the student to a
--  different question on the strength of how he was doing, and could not. The
--  questions he had not reached were queued in a fixed order, and the only way
--  past the one on his screen was for him to press Next without answering it.
--  And because his screen told him whether he was on the easy, the medium or
--  the hard test, he started treating a diagnostic as a final exam.
--
--  She was asked which of two fixes she wanted — let the student move between
--  questions, or let the teacher choose each one and show the student nothing
--  but the question — and chose the second. So:
--
--    teacher_choose_question(session, question, now)
--
--      any question from any of the three tests for the session's subject,
--      put in front of the student:
--
--      now = true   at once. Whatever is on their screen is set aside, which
--                   is what a level move has always done with it — voided, and
--                   not counted against them.
--      now = false  the moment they answer the one on their screen. A teacher
--                   who decides while the student is still working should not
--                   have to throw away the question they are working on.
--
--  Either way the session moves onto that question's test, and the test
--  carries on from there: the questions after it in the test's own order, then
--  round to the ones before it that have not been asked. A teacher who picks
--  question 12 of the medium test is asking for that kind of question, and the
--  one after it should be 13, not 1 — but 1 to 11 are not lost, they come after
--  20.
--
--  This is not 0023 back. That made the teacher hand over every question, and
--  0027 took it out for a good reason: a teacher who has to pick each question
--  is reaching for a mouse mid-sentence. The test still runs itself — the easy
--  test loads, and every answer brings up the next question — and the teacher
--  can now reach in whenever the lesson calls for it.
--
--  What does NOT change is where the line is held. Exactly one item is
--  'published' at a time and everything else is 'staged', invisible under the
--  RLS from 0005: choosing a question is publishing one row, and the queue is
--  still rows the student cannot read. Nor does 0027's rule change — a question
--  is put in front of the student once. One they answered, and one that was
--  set aside, cannot be chosen again.
--
--  THE STUDENT NO LONGER MOVES THE LEVEL. set_session_level took the call from
--  either seat because the level was decided out loud and clicked by whoever
--  was nearer a mouse (0027). It is the teacher's decision now and the
--  teacher's button: the student's screen does not show a level at all, so a
--  button there that moved one would be a button about something they cannot
--  see. set_session_level checks for the session's teacher, and
--  set_level_by_token — the same move through the link — is dropped rather
--  than left standing, for 0027's reason: an RPC that exists is an RPC a client
--  can call.
--
--  AND ONE RACE, CLOSED. Until now the question on the screen was changed by
--  the person looking at it, give or take a level move. From here the teacher
--  reaches in while the student is working, so the two of them can press at
--  the same moment, and two things could go wrong:
--
--    * record_answer read the item's status and wrote it in two statements.
--      An answer that arrived as the teacher set the question aside would
--      write 'answered' over 'voided' and open a second question beside the
--      one the teacher chose. The write now carries the check.
--    * a teacher setting aside "the question on the screen" a moment after an
--      answer had put up the next one would miss it, and leave two open.
--      lock_open_item waits out an answer in flight and then looks again, and
--      the level loader uses it as well.
-- ============================================================================

-- ------------------------------------------------------- the open question --
-- Internal. The question on the student's screen, locked until the caller's
-- transaction ends — or null when nothing is up.
--
-- A plain read is not enough once two people can change the screen. If the
-- student is answering at this moment, FOR UPDATE queues behind the answer and
-- then re-reads the row; it is not published any more, so it is skipped. The
-- question that answer has just put up was not published when the statement
-- began, so it is not seen either. The second look is a new statement with a
-- new snapshot, and it finds that one.
create or replace function public.lock_open_item(p_session uuid)
returns uuid
language plpgsql security definer set search_path = public as $$
declare v_item uuid;
begin
  select id into v_item
    from session_items
   where session_id = p_session and status = 'published'
     for update;

  if v_item is null then
    select id into v_item
      from session_items
     where session_id = p_session and status = 'published'
       for update;
  end if;

  return v_item;
end $$;

revoke execute on function public.lock_open_item(uuid) from public, anon, authenticated;

comment on function public.lock_open_item(uuid) is
  'The question on the student''s screen, locked, after waiting out an answer in flight. Internal.';

-- -------------------------------------------------------------- the queue --
-- Internal. Every staged row is thrown away and the queue is built again on
-- one test: its questions in its own order, starting at position p_from and
-- coming back round to the ones before it — or from the top when p_from is
-- null. Anything this session has already put in front of the student is left
-- out, which is 0027's "never twice", and the session moves onto that test.
--
-- The question on the screen is not touched. Setting it aside, or leaving it
-- where it is, is the caller's decision, and it is made before this runs.
--
-- Staged rows are deleted rather than voided for the reason 0027 gave: they
-- were never in front of the student and they carry nothing.
create or replace function public.queue_test(p_session uuid, p_set uuid, p_from int)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid;
  v_level   text;
  v_base    int;
  v_added   int;
  v_size    int;
begin
  select student_id into v_student from sessions where id = p_session;
  select level into v_level from question_sets where id = p_set;

  delete from session_items where session_id = p_session and status = 'staged';

  select coalesce(max(sequence_no), 0) into v_base
    from session_items where session_id = p_session;

  -- (position < p_from) is false for the chosen question and everything after
  -- it, so those come first; null for "from the top", which sorts nothing.
  insert into session_items (session_id, question_id, student_id, sequence_no)
  select p_session, qi.question_id, v_student,
         (v_base + row_number() over (
            order by coalesce(qi.position < p_from, false), qi.position))::int
    from question_set_items qi
   where qi.set_id = p_set
     and not exists (select 1 from session_items si
                      where si.session_id = p_session
                        and si.question_id = qi.question_id);
  get diagnostics v_added = row_count;

  select count(*) into v_size
    from session_items si
    join question_set_items qi on qi.question_id = si.question_id and qi.set_id = p_set
   where si.session_id = p_session and si.status <> 'voided';

  update sessions set level = v_level, level_size = v_size where id = p_session;

  return v_added;
end $$;

revoke execute on function public.queue_test(uuid, uuid, int) from public, anon, authenticated;

comment on function public.queue_test(uuid, uuid, int) is
  'Rebuilds the session''s queue on one test, from a position and round again, leaving out anything already asked. Internal.';

-- ------------------------------------------------------- loading a level ----
-- 0027's loader, the same from outside: the question on the screen is set
-- aside, the test is queued from the top, and its first question opens. The
-- queue is queue_test's now, so a level move and a chosen question build it the
-- same way, and the question on the screen is found the way that survives an
-- answer landing at the same moment.
create or replace function public.load_session_level(p_session uuid, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_set   uuid;
  v_open  uuid;
  v_added int;
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

  -- The one they were looking at happened; the rest never reached them.
  v_open := lock_open_item(p_session);
  if v_open is not null then
    update session_items set status = 'voided' where id = v_open;
  end if;

  v_added := queue_test(p_session, v_set, null);

  -- One question, exactly as before. The rest stay staged, which is to say
  -- unreadable.
  select id into v_first
    from session_items
   where session_id = p_session and status = 'staged'
   order by sequence_no
   limit 1;

  if v_first is not null then
    perform publish_one_item(v_first);
  end if;

  return v_added;
end $$;

revoke execute on function public.load_session_level(uuid, text) from public, anon, authenticated;

-- ------------------------------------------------------------- the choice --
-- The teacher puts one question in front of the student. See the top of this
-- file for what now means and what happens after it.
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
  v_pos     int;
  v_open    uuid;
  v_was     item_status;
  v_item    uuid;
begin
  perform assert_session_teacher(p_session);

  select status, subject into v_status, v_subject from sessions where id = p_session;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if v_status <> 'live' then raise exception 'the test has not started yet'; end if;

  -- One of the three tests for this subject, or it is not a question this
  -- session can ask: a retired item, the other subject's, one no test holds.
  select qs.id, qi.position into v_set, v_pos
    from question_set_items qi
    join question_sets qs on qs.id = qi.set_id
   where qi.question_id = p_question
     and qs.subject = v_subject
     and qs.is_active
     and qs.level is not null;

  if v_set is null then
    raise exception 'that question is not in any of this subject''s tests';
  end if;

  -- Before anything is decided, so an answer landing now is waited out and
  -- the rest of this runs against the screen as it really is.
  v_open := lock_open_item(p_session);

  -- Once. Answered, on the screen, or set aside: it has been in front of them.
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

  if p_now and v_open is not null then
    update session_items set status = 'voided' where id = v_open;
  end if;

  perform queue_test(p_session, v_set, v_pos);

  select id into v_item
    from session_items
   where session_id = p_session and question_id = p_question and status = 'staged';

  -- Up now when that was asked for, or when there is nothing on the screen for
  -- it to wait behind. Otherwise it is the first of the queue, and answering
  -- the question on the screen publishes it.
  if p_now or v_open is null then
    perform publish_one_item(v_item);
  end if;

  return v_item;
end $$;

revoke execute on function public.teacher_choose_question(uuid, uuid, boolean) from public, anon;
grant  execute on function public.teacher_choose_question(uuid, uuid, boolean) to authenticated;

comment on function public.teacher_choose_question(uuid, uuid, boolean) is
  'Puts one question from any of the subject''s three tests in front of the student — now, setting aside what is on their screen, or as soon as they answer it — and carries the test on from there. Teacher only, while the test is running.';

-- ---------------------------------------------------------------- the loop --
-- 0033's record_answer with one change: the write that answers the question
-- is also the check that it is still open. Read and written apart, the status
-- could change in between — a teacher setting this question aside as the
-- answer arrives — and the answer would land on a voided row and open a second
-- question. Everything else is as it was, including why this is SECURITY
-- DEFINER: grading reads question_keys, which the student cannot.
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
  v_session uuid;
  v_seq     int;
  v_next    uuid;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), si.session_id, si.sequence_no,
         coalesce(si.decided_at, now())
    into v_status, v_started, v_session, v_seq, v_ended
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

  select id into v_next
    from session_items
   where session_id = v_session and status = 'staged' and sequence_no > v_seq
   order by sequence_no
   limit 1;

  if v_next is not null then
    perform publish_one_item(v_next);
  end if;
end $$;

revoke execute on function public.record_answer(uuid, answer_option, answer_option[], smallint, text)
  from public, anon, authenticated;

-- --------------------------------------------------------- moving a level --
-- 0027's, with the student taken out of it. The level is the teacher's to move
-- and the student's screen no longer says what it is.
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

  if p_level = v_level and exists (select 1 from session_items where session_id = p_session) then
    return 0;
  end if;

  -- Before the student has started there is nothing to load and nothing to
  -- void — the level is just a note about where they will begin.
  if v_status = 'scheduled' then
    update sessions set level = p_level where id = p_session;
    return 0;
  end if;

  return load_session_level(p_session, p_level);
end $$;

-- Signed in only, per 0035: it has refused an anonymous caller since 0027, and
-- being refused is not the same as being unable to ask.
revoke execute on function public.set_session_level(uuid, text) from public, anon;
grant  execute on function public.set_session_level(uuid, text) to authenticated;

comment on function public.set_session_level(uuid, text) is
  'Moves a session to another test: the question on the screen is set aside, the test is queued from the top, and its first question opens. The session''s teacher only.';

-- The student's own door to the same move, through the link. Nothing calls it.
drop function if exists public.set_level_by_token(text, text);

-- -------------------------------------------------------------- the notes --
comment on column sessions.level is
  'Which of the three tests the queue is running. Starts easy; moved by the teacher, with the level buttons or by choosing a question from another test. Never shown to the student.';

comment on column sessions.level_size is
  'How many questions of the test the queue is running this session holds. Set whenever a test is queued. The student was shown it as "of 20" until 0047 took the count off their screen.';
