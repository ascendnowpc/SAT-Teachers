-- ============================================================================
--  0050 — the clock stops at the answer, not at the confidence
--
--  0019 stopped the clock when the student had "an answer and a confidence
--  down", on the reasoning that the two together are the decision. The
--  teachers who read the times say otherwise, and the number is for them: what
--  they want to know is how long the question took to answer. How sure the
--  student is comes after that, and is a second question about the answer (the
--  screen does not even ask it until one is picked), so the seconds spent on it
--  were landing in the number the report calls pace. That is the fault 0019
--  was written to fix, one step earlier: then it was finding the button.
--
--  So decided_at is now the moment the first answer is picked, and it gets
--  there two ways:
--
--    * the student's screen calls mark_item_decided / mark_decided_by_token as
--      soon as an option is picked, as it used to once the confidence was in;
--    * and record_draft stamps it the first time a draft carries an option.
--
--  The second is not belt and braces. The draft is how a pick reaches the
--  server in the first place (0038), and stamping there means the recorded
--  times change the moment this is applied rather than whenever the new screen
--  is deployed. A screen still on the old code sends its draft about 400ms
--  after the click (it is debounced) and calls mark_decided only once the
--  confidence is in, so for that screen the draft is what stops the clock.
--  The clock it draws itself runs to the confidence until the new screen
--  replaces it; the teacher's clock and the report stop at the answer.
--
--  What does not change:
--
--    * it is stamped once. A student who picks B, thinks again and picks C is
--      timed to B: 0019's reasoning, unchanged. A clock that restarted would
--      be a clock the student could run by clicking around, and the change of
--      mind is still on the record, in the answer they submit.
--    * a draft with no option in it (crossing out, before anything is picked)
--      does not stop it. Nothing has been answered yet.
--    * status = 'published' still guards the update, so a late draft cannot
--      stamp an answered or voided item any more than it can overwrite one.
--    * record_answer still fills decided_at in, with now(), when nothing did
--      earlier: the teacher answering on the student's behalf, or a draft that
--      never arrived.
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
         student_confidence = p_confidence,
         -- The first answer picked stops the clock, and nothing after it moves it.
         decided_at         = coalesce(decided_at, case when p_option is not null then now() end)
   where id = p_item
     and status = 'published';
end $$;

-- Replacing a function keeps its grants, so this changes nothing. It is here
-- so that the rule in 0035 is visible where the function is.
revoke execute on function public.record_draft(uuid, answer_option, answer_option[], smallint)
  from public, anon, authenticated;

comment on function public.record_draft(uuid, answer_option, answer_option[], smallint) is
  'Saves what the student has picked so far, without answering, and stops the clock on the first answer picked. Only ever touches a published item. Internal — the callers check who is asking.';

comment on column session_items.decided_at is
  'When the student first picked an answer; the confidence comes after and is not timed (0050). Stamped once. elapsed_seconds is measured to this rather than to answered_at.';

comment on function public.mark_item_decided(uuid) is
  'Stamps the moment the student first picked an answer. Stamped once; a change of mind does not restart the clock.';
