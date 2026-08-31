-- ============================================================================
--  0019 — the clock stops when the student decides, not when they press submit
--
--  What is being measured is how long the question took to work out.  That ends
--  when the student has picked an answer and said how sure they are; the second
--  or two after it is finding the button, and it was landing in the number the
--  report calls "pace".
--
--  So the moment of deciding is stamped server-side, the same way first_viewed_at
--  is, and elapsed_seconds is measured to it.  Client-side timing was the other
--  option and it is worse: the number in the report would then be whatever the
--  student's browser said it was.
--
--  A student who changes their mind afterwards keeps the first stamp — the
--  decision is what was timed, and re-opening it would make the clock a thing
--  you could restart by clicking around.
-- ============================================================================

alter table session_items add column if not exists decided_at timestamptz;

comment on column session_items.decided_at is
  'When the student had both an answer and a confidence down. elapsed_seconds is measured to this rather than to answered_at.';

create or replace function public.mark_item_decided(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set decided_at = now()
   where id = p_item
     and student_id = auth.uid()
     and status = 'published'
     and decided_at is null;
end $$;

revoke execute on function public.mark_item_decided(uuid) from public;
grant execute on function public.mark_item_decided(uuid) to authenticated;

comment on function public.mark_item_decided(uuid) is
  'Stamps the moment the student settled on an answer. Stamped once; a change of mind does not restart the clock.';

-- submit_answer, with the one line that reads the new stamp. Everything else is
-- 0016's function unchanged.
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
