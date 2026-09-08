-- ============================================================================
--  0038 — the teacher can see the working, not just the answer
--
--  A student picks B, says they are fairly sure, and sits there. On the
--  console: nothing. The board says "On screen", the answer column says "—",
--  and it stays that way until they press Next.
--
--  Which is exactly what the schema said should happen — selected_option is
--  written by submit_answer and by nothing else — and it is the wrong thing
--  for the lesson this product is for. The teacher is on a call with the
--  student watching them work. "You've gone for B — talk me through it" is the
--  whole job, and until now it needed the student's screen to be shared, which
--  is the thing that keeps not working (0034).
--
--  So the working is written as it happens. The columns are the ones that
--  already mean this — selected_option, eliminated_options,
--  student_confidence — because a draft and an answer are the same three
--  facts; what separates them is the item's STATUS, which is untouched here.
--
--  What that buys, and what it deliberately does not:
--
--    * the item stays 'published'. It is not answered, it is not graded, no
--      assessment row is written, the clock is not stopped, and the next
--      question is not published. Only submit_answer does any of that.
--    * decided_at still marks the moment they settled, and is still stamped
--      once. Changing their mind on the draft does not restart the clock.
--    * a student reloading gets their working back, which they lost before.
--    * and nothing new is readable: the draft goes onto a row the student's
--      own RLS policy already grants them, and the answer key is nowhere near
--      this function.
--
--  The guard that matters is `status = 'published'`. A draft can never land on
--  an answered item, so this cannot overwrite what was actually submitted, and
--  it cannot resurrect a voided one.
-- ============================================================================

create or replace function public.record_draft(
  p_item       uuid,
  p_option     answer_option,
  p_eliminated answer_option[],
  p_confidence smallint
) returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence
   where id = p_item
     and status = 'published';
end $$;

revoke execute on function public.record_draft(uuid, answer_option, answer_option[], smallint)
  from public, anon, authenticated;

comment on function public.record_draft(uuid, answer_option, answer_option[], smallint) is
  'Saves what the student has picked so far, without answering. Only ever touches a published item. Internal — the callers check who is asking.';

-- ------------------------------------------------------- the signed-in one --
create or replace function public.save_draft(
  p_item       uuid,
  p_option     answer_option,
  p_eliminated answer_option[],
  p_confidence smallint
) returns void language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from session_items where id = p_item and student_id = auth.uid()) then
    raise exception 'not your question';
  end if;
  perform record_draft(p_item, p_option, p_eliminated, p_confidence);
end $$;

revoke execute on function public.save_draft(uuid, answer_option, answer_option[], smallint)
  from public, anon;
grant execute on function public.save_draft(uuid, answer_option, answer_option[], smallint)
  to authenticated;

-- ------------------------------------------------------------- on the link --
create or replace function public.draft_by_token(
  p_token      text,
  p_item       uuid,
  p_option     answer_option,
  p_eliminated answer_option[],
  p_confidence smallint
) returns void language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from session_items
                  where id = p_item and session_id = session_for_token(p_token)) then
    raise exception 'that question is not in this session';
  end if;
  perform record_draft(p_item, p_option, p_eliminated, p_confidence);
end $$;

revoke execute on function public.draft_by_token(
  text, uuid, answer_option, answer_option[], smallint
) from public;
grant execute on function public.draft_by_token(
  text, uuid, answer_option, answer_option[], smallint
) to anon, authenticated;
