-- ============================================================================
--  0006 — the reveal has to name the right answer
--
--  Revealing told the student they were wrong and gave them the written
--  explanation, but never which option was correct — so they were left to infer
--  it. The correct option still cannot be a plain read of question_keys, so it
--  travels the same route as the result: copied onto the item at reveal time,
--  and only then.
-- ============================================================================

alter table session_items add column revealed_correct_option answer_option;

create or replace function public.reveal_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status; v_correct boolean;
begin
  select si.session_id, si.status into v_session, v_status
    from session_items si where si.id = p_item;
  perform assert_session_teacher(v_session);
  if v_status <> 'answered' then raise exception 'nothing to reveal yet'; end if;

  select a.is_correct into v_correct
    from session_item_assessments a where a.session_item_id = p_item;

  update session_items si
     set status = 'revealed',
         revealed_at = now(),
         revealed_result = case when v_correct then 'correct' else 'incorrect' end::grade_result,
         revealed_correct_option = (select k.correct_option from question_keys k
                                     where k.question_id = si.question_id),
         revealed_explanation = (select k.explanation from question_keys k
                                  where k.question_id = si.question_id)
   where si.id = p_item;
end $$;
