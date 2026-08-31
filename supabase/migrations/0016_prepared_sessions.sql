-- ============================================================================
--  0016 — the session is prepared, not conducted
--
--  The loop 0005 built asks the teacher to hand over one question at a time
--  while the lesson is running.  In practice the teachers do not want to be
--  operating a console mid-lesson: they want to build the paper beforehand,
--  put a time on it, and have the student sit it.
--
--  So the work moves off the clock:
--
--    before   the teacher picks the questions and orders them  (set_session_paper)
--    at time  the student opens the session themselves         (start_session_as_student)
--    during   each answer brings up the next question          (submit_answer)
--    after    the teacher reveals and diagnoses, as before     (unchanged)
--
--  One question is in front of the student at a time, and it is the *server*
--  that holds that line: only the current item is 'published', so only the
--  current item is readable at all (see items_student_read in 0005).  The next
--  one is published by submit_answer once the current one is answered, which
--  is what makes the per-question timer mean something — a student cannot read
--  ahead while the clock on question 3 is running, because question 4 is not
--  in their reach yet.
--
--  Nothing about the reveal changes.  The student learns the result when the
--  teacher reveals it and not before, which is the whole point of the split
--  between session_items and session_item_assessments.
-- ============================================================================

-- ------------------------------------------------------------- the paper ----
-- The teacher's whole build step, as one call: these questions, in this order.
--
-- It replaces the paper rather than appending to it, because the builder edits
-- a list — reordering it client-side and saving row by row would collide with
-- the unique (session_id, sequence_no) constraint halfway through.  Delete and
-- re-insert inside the one transaction has no such intermediate state.
--
-- Once any item has left the queue the paper is with the student, and changing
-- it under them would renumber questions they have already answered.  At that
-- point this refuses.
create or replace function public.set_session_paper(p_session uuid, p_questions uuid[])
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid;
  v_count   int := coalesce(array_length(p_questions, 1), 0);
begin
  perform assert_session_teacher(p_session);

  if exists (select 1 from session_items
              where session_id = p_session and status <> 'staged') then
    raise exception 'this paper is already with the student';
  end if;

  if v_count <> (select count(distinct x) from unnest(p_questions) x) then
    raise exception 'the same question appears twice in this paper';
  end if;

  select student_id into v_student from sessions where id = p_session;

  delete from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  select p_session, q.qid, v_student, q.ord
    from unnest(p_questions) with ordinality as q(qid, ord);

  return v_count;
end $$;

revoke execute on function public.set_session_paper(uuid, uuid[]) from anon;

comment on function public.set_session_paper(uuid, uuid[]) is
  'Replaces a session''s queued paper with these questions in this order. Teacher only, and only before the student has started.';

-- ------------------------------------------------------------ the opening ----
-- The student opens their own session.  The teacher does not have to be there
-- to press anything — the scheduled time is the gate, and it is enforced here
-- rather than by hiding a button, since hiding a button stops nobody.
create or replace function public.start_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_scheduled timestamptz;
  v_status    session_status;
  v_queued    int;
  v_first     uuid;
begin
  select scheduled_at, status into v_scheduled, v_status
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

  -- Only the first one. Everything after it arrives as the student answers.
  select id into v_first
    from session_items
   where session_id = p_session and status = 'staged'
   order by sequence_no
   limit 1;

  if v_first is not null then
    update session_items
       set status = 'published', published_at = now()
     where id = v_first;
  end if;

  return v_queued;
end $$;

revoke execute on function public.start_session_as_student(uuid) from anon;

comment on function public.start_session_as_student(uuid) is
  'The student opens their own session once its scheduled time has passed, and the first question is published to them.';

-- -------------------------------------------------------------- the loop ----
-- submit_answer, with one addition at the end: bringing up the next question.
-- Everything above that is 0005's function unchanged, including the reason it
-- is SECURITY DEFINER — grading has to read question_keys, which the student
-- cannot.
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
  v_elapsed int;
  v_session uuid;
  v_seq     int;
  v_next    uuid;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), si.session_id, si.sequence_no
    into v_status, v_started, v_session, v_seq
    from session_items si
   where si.id = p_item and si.student_id = auth.uid();

  if not found then raise exception 'not your question'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status             = 'answered',
         answered_at        = now(),
         selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence,
         student_reasoning  = nullif(btrim(p_reasoning), '')
   where id = p_item;

  select correct_option into v_correct
    from question_keys k
    join session_items si on si.question_id = k.question_id
   where si.id = p_item;

  v_elapsed := greatest(0, extract(epoch from (now() - coalesce(v_started, now())))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, p_option = v_correct, v_elapsed)
  on conflict (session_item_id) do update
    set is_correct = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at = now();

  -- Next question, if the paper has one. Published only now, so the student
  -- has had no way to read it while this one was being timed.
  select id into v_next
    from session_items
   where session_id = v_session and status = 'staged' and sequence_no > v_seq
   order by sequence_no
   limit 1;

  if v_next is not null then
    update session_items
       set status = 'published', published_at = now()
     where id = v_next;
  end if;
end $$;

-- ------------------------------------------------------------ the length ----
-- The student is shown "question 3 of 25", and cannot count the paper for
-- themselves: RLS hides every item that has not been published to them yet,
-- which is the whole point of the one-at-a-time loop above.  So the length
-- lives on the session, which they can read.
--
-- A trigger rather than a write inside set_session_paper(), because it is the
-- kind of number that goes wrong the first time some other path inserts an
-- item and forgets to update it.
alter table sessions add column if not exists question_count int not null default 0;

comment on column sessions.question_count is
  'How many questions the paper holds. Maintained by trigger; the student reads it to know how far through they are.';

create or replace function public.sync_session_question_count()
returns trigger language plpgsql security definer set search_path = public as $$
declare v_session uuid := case when tg_op = 'DELETE' then old.session_id else new.session_id end;
begin
  update sessions s
     set question_count = (select count(*) from session_items i where i.session_id = v_session)
   where s.id = v_session;
  return null;
end $$;

drop trigger if exists session_items_count on session_items;
create trigger session_items_count
  after insert or delete on session_items
  for each row execute function public.sync_session_question_count();

update sessions s
   set question_count = (select count(*) from session_items i where i.session_id = s.id)
 where s.question_count is distinct from (select count(*) from session_items i where i.session_id = s.id);
