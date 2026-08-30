-- ============================================================================
--  0002 — create_question
--
--  A question, its options and its answer key are one thing.  Writing them as
--  three client round-trips can leave a question with no key behind, which is
--  exactly the state that is unusable in a session.  One call, one transaction.
--
--  security invoker: RLS still applies, so only teachers can call this
--  successfully and only ever as themselves.
-- ============================================================================

create or replace function public.create_question(
  p_subject              text,
  p_domain               text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text
) returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  qid    uuid;
  labels text[];
begin
  select array_agg(o->>'label') into labels
  from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;

  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;

  insert into questions (
    created_by, subject, domain, passage, stem, difficulty, difficulty_rationale
  ) values (
    auth.uid(),
    p_subject,
    nullif(p_domain, ''),
    nullif(p_passage, ''),
    p_stem,
    p_difficulty,
    nullif(p_difficulty_rationale, '')
  )
  returning id into qid;

  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body'
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, nullif(p_explanation, ''));

  return qid;
end;
$$;
