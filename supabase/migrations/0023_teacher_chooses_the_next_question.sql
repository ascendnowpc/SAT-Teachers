-- ============================================================================
--  0023 — the teacher chooses the next question
--
--  0016 moved the session off the clock: the teacher builds the paper days
--  before, the student opens it, and every answer brings up the next question.
--  That is the right shape for a diagnostic, where the point is to see the
--  whole paper sat under time.
--
--  It is the wrong shape for teaching.  A paper walks a student from easy to
--  hard whatever happens in front of it — a student who cannot do the easy one
--  is handed the medium one anyway, and then the hard one, and the teacher
--  watches three failures where they wanted to stay put and re-teach.  The
--  suggestion engine in 04-session-flow already writes down what a teacher does
--  instead (hold, drop a level, escalate).  It had nothing to act on, because
--  the order was fixed before the lesson started.
--
--  So a session now has a PACING, and it is one of two:
--
--    'student'  the paper runs itself.  Unchanged, and still the default:
--               start publishes question 1, each answer publishes the next.
--
--    'teacher'  nothing is published until the teacher says so.  The student
--               starts, and waits; the teacher picks a question out of the
--               paper — by difficulty, which is the axis they are actually
--               deciding on — and it appears.  They answer it, and wait again.
--
--  What does NOT change is where the line is held.  It is still the server
--  that decides what the student can read: exactly one item is 'published' at
--  a time, everything else is 'staged', and 'staged' is invisible under the
--  RLS from 0005.  A teacher-led session is not a client that shows fewer
--  questions — it is a server that has published fewer.  So the per-question
--  clock means the same thing it meant before, and a student still cannot read
--  ahead, because ahead does not exist yet.
--
--  Since the teacher may ask question 11 before question 4, and may never ask
--  question 4 at all, sequence_no stops being the order anything happened in.
--  It stays what it always was — the question's place in the paper the teacher
--  built — and a second number records the order questions were actually put
--  in front of the student.  The board reads that one, and so does the student.
-- ============================================================================

-- ------------------------------------------------------------- the pacing ---
alter table sessions add column if not exists pacing text not null default 'student';

do $$ begin
  alter table sessions add constraint sessions_pacing_check
    check (pacing in ('student','teacher'));
exception when duplicate_object then null;
end $$;

comment on column sessions.pacing is
  '''student'': the paper runs itself, each answer publishes the next question. ''teacher'': nothing is published until the teacher picks it.';

-- ---------------------------------------------------------- the ask order ---
-- sequence_no is where a question sits in the paper.  asked_no is when it was
-- put in front of the student, which under teacher pacing is a different thing
-- and under student pacing is the same thing.
alter table session_items add column if not exists asked_no int;

comment on column session_items.asked_no is
  'The order this question was actually put in front of the student, 1-based. Null while staged. Equal to sequence_no when the session paces itself.';

update session_items
   set asked_no = sequence_no
 where asked_no is null and status <> 'staged';

-- Publishing, in one place, so the three callers below cannot drift apart.
create or replace function public.publish_one_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items si
     set status       = 'published',
         published_at = now(),
         asked_no     = coalesce(si.asked_no, (select coalesce(max(x.asked_no), 0) + 1
                                                 from session_items x
                                                where x.session_id = si.session_id))
   where si.id = p_item;
end $$;

revoke execute on function public.publish_one_item(uuid) from anon, authenticated;

-- ------------------------------------------------------ setting the pacing --
-- Changeable mid-session on purpose.  A teacher who is three questions into a
-- paper and can see it is not going to work should be able to take hold of it
-- without abandoning the session and building another one.
create or replace function public.set_session_pacing(p_session uuid, p_pacing text)
returns void language plpgsql security definer set search_path = public as $$
declare v_status session_status;
begin
  perform assert_session_teacher(p_session);

  if p_pacing not in ('student','teacher') then
    raise exception 'pacing is either student or teacher';
  end if;

  select status into v_status from sessions where id = p_session;
  if v_status in ('completed','cancelled') then
    raise exception 'this session is over';
  end if;

  update sessions set pacing = p_pacing where id = p_session;
end $$;

revoke execute on function public.set_session_pacing(uuid, text) from anon;

comment on function public.set_session_pacing(uuid, text) is
  'Switches a session between the paper running itself and the teacher choosing each question. Teacher only, and not once the session is over.';

-- ------------------------------------------------------------- the opening --
-- Under teacher pacing the student starts and lands on a wait: the session is
-- live, the clock on the lesson is running, and there is nothing to read until
-- the teacher picks something.  That wait is the feature.
create or replace function public.start_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_scheduled timestamptz;
  v_status    session_status;
  v_pacing    text;
  v_queued    int;
  v_first     uuid;
begin
  select scheduled_at, status, pacing into v_scheduled, v_status, v_pacing
    from sessions where id = p_session and student_id = auth.uid();

  if not found then raise exception 'not your session'; end if;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if now() < v_scheduled then raise exception 'this session has not opened yet'; end if;

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

-- -------------------------------------------------------------- the choice --
-- The teacher hands over one question.  It may be any staged question in the
-- paper — the whole point is that the order is decided now rather than then —
-- but only one at a time, because a second published item is a second question
-- the student can read while the first one is being timed.
create or replace function public.publish_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status;
begin
  select session_id, status into v_session, v_status from session_items where id = p_item;
  if not found then raise exception 'no such question'; end if;
  perform assert_session_teacher(v_session);
  if v_status <> 'staged' then raise exception 'that question is already out'; end if;

  if (select status from sessions where id = v_session) <> 'live' then
    raise exception 'the student has not started this session yet';
  end if;

  if exists (select 1 from session_items
              where session_id = v_session and status = 'published') then
    raise exception 'the student is still on a question';
  end if;

  perform publish_one_item(p_item);
end $$;

revoke execute on function public.publish_item(uuid) from anon;

comment on function public.publish_item(uuid) is
  'Puts one staged question in front of the student. Teacher only, only while the session is live, and only when nothing else is open.';

-- ---------------------------------------------------------------- the loop --
-- submit_answer as 0019 left it, with the tail made conditional: under teacher
-- pacing an answer ends the question and nothing follows it until the teacher
-- chooses.  Everything above the tail — including the reason this is SECURITY
-- DEFINER, that grading reads question_keys — is unchanged.
create or replace function public.submit_answer(
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
  v_pacing  text;
  v_next    uuid;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), si.session_id, si.sequence_no,
         coalesce(si.decided_at, now())
    into v_status, v_started, v_session, v_seq, v_ended
    from session_items si
   where si.id = p_item and si.student_id = auth.uid();

  if not found then raise exception 'not your question'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status             = 'answered',
         answered_at        = now(),
         decided_at         = coalesce(decided_at, now()),
         selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence,
         student_reasoning  = nullif(btrim(p_reasoning), '')
   where id = p_item;

  select correct_option into v_correct
    from question_keys k
    join session_items si on si.question_id = k.question_id
   where si.id = p_item;

  -- To the decision, not to the button press.
  v_elapsed := greatest(0, extract(epoch from (v_ended - coalesce(v_started, v_ended)))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, p_option = v_correct, v_elapsed)
  on conflict (session_item_id) do update
    set is_correct = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at = now();

  select pacing into v_pacing from sessions where id = v_session;

  if v_pacing = 'student' then
    select id into v_next
      from session_items
     where session_id = v_session and status = 'staged' and sequence_no > v_seq
     order by sequence_no
     limit 1;

    if v_next is not null then
      perform publish_one_item(v_next);
    end if;
  end if;
end $$;
