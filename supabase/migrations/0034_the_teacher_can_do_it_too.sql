-- ============================================================================
--  0034 — whatever the student can do, the teacher can do
--
--  The console was built for a lesson where the teacher watches: the student
--  shares their screen, works the questions, and the answers land on the
--  board.  Every one of those steps assumes the share works.
--
--  It does not always.  A student on a phone, on a school network, on a
--  browser that will not grant full screen, or simply unable to get the Zoom
--  share going, leaves the teacher blind — and worse, leaves the session
--  stuck, because starting the test, answering, moving level and handing in
--  were all things only the student could do.  The lesson then happens out
--  loud, over the call, and the teacher has nowhere to put it.
--
--  So the teacher gets the same four verbs, checked against being the
--  session's teacher rather than its student.  0033 already moved the work
--  into internal functions for exactly this reason; these are the third
--  caller of each.
--
--  Moving level needed nothing: set_session_level has accepted either side of
--  the session since 0027.  It is the console that never offered it, and that
--  is a screen, not a schema.
-- ============================================================================

-- ------------------------------------------------------------- opening -----
-- Opening it on the student's behalf before its time IS opening it early, so
-- it is stamped as such rather than quietly bypassing the clock. The card and
-- the report keep saying half past four was when it was arranged.
create or replace function public.teacher_start_session(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);

  update sessions
     set opened_early_at = coalesce(opened_early_at, now())
   where id = p_session
     and now() < scheduled_at;

  return open_session_now(p_session);
end $$;

revoke execute on function public.teacher_start_session(uuid) from public;
grant  execute on function public.teacher_start_session(uuid) to authenticated;

comment on function public.teacher_start_session(uuid) is
  'The teacher opens the test for a student who cannot. Same work as the student''s own Start button, and it stamps opened_early_at if the time has not come.';

-- ----------------------------------------------------------- answering -----
-- The answer is the student's answer: it goes on their item, it is graded the
-- same way, it stops the same clock and it opens the next question. Which
-- keyboard it was typed on is not a distinction the report can carry, and
-- pretending otherwise would put a second kind of answer into a data set the
-- whole report engine reads as one.
create or replace function public.teacher_answer_item(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid;
begin
  select session_id into v_session from session_items where id = p_item;
  if v_session is null then raise exception 'no such question'; end if;
  perform assert_session_teacher(v_session);
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;

revoke execute on function public.teacher_answer_item(uuid, answer_option, answer_option[], smallint, text) from public;
grant  execute on function public.teacher_answer_item(uuid, answer_option, answer_option[], smallint, text) to authenticated;

comment on function public.teacher_answer_item(uuid, answer_option, answer_option[], smallint, text) is
  'The teacher enters the answer the student gave out loud. Graded exactly as the student''s own would be.';

-- ------------------------------------------------------------ handing in ---
-- set_session_status(…, 'completed') is still there and still only changes the
-- status. This is the one that ends a test: the questions the student never
-- reached are voided, which is what "handed in" means everywhere else.
create or replace function public.teacher_finish_session(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
  return end_session_now(p_session);
end $$;

revoke execute on function public.teacher_finish_session(uuid) from public;
grant  execute on function public.teacher_finish_session(uuid) to authenticated;

comment on function public.teacher_finish_session(uuid) is
  'The teacher hands the test in. Unanswered questions are voided and the session is completed.';
