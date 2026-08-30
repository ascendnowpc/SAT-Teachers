-- ============================================================================
--  0010 — the skill label, filled in for every English item
--
--  The teachers' evaluation grid has two columns before anything else: Domain
--  and Skill Focus.  The bank had the first (questions.section) and not the
--  second, which meant a report could say a student is weak in Craft and
--  Structure but not whether that is words in context or text structure — and
--  those want different practice.
--
--  This adds the skill and fills it in for all 65 loaded items.  The list is
--  the grid's, which is the College Board's:
--
--    Information and Ideas          central ideas and details
--                                   command of evidence — textual
--                                   command of evidence — quantitative
--                                   inferences
--    Craft and Structure            words in context
--                                   text structure and purpose
--                                   cross-text connections
--    Expression of Ideas            rhetorical synthesis
--                                   transitions
--    Standard English Conventions   boundaries
--                                   form, structure and sense
--
--  A skill belongs to exactly one section, so the pair is checked together
--  rather than separately: a "boundaries" item filed under Craft and Structure
--  is a tagging mistake, and the constraint is what catches it.
-- ============================================================================

alter table questions add column if not exists skill text;

comment on column questions.skill is
  'Skill focus within the section, from the teachers'' evaluation grid. Must belong to the section.';

alter table questions drop constraint if exists questions_skill_check;
alter table questions add constraint questions_skill_check check (
  skill is null or (section, skill) in (
    ('information_and_ideas',         'central_ideas_and_details'),
    ('information_and_ideas',         'command_of_evidence_textual'),
    ('information_and_ideas',         'command_of_evidence_quantitative'),
    ('information_and_ideas',         'inferences'),
    ('craft_and_structure',           'words_in_context'),
    ('craft_and_structure',           'text_structure_and_purpose'),
    ('craft_and_structure',           'cross_text_connections'),
    ('expression_of_ideas',           'rhetorical_synthesis'),
    ('expression_of_ideas',           'transitions'),
    ('standard_english_conventions',  'boundaries'),
    ('standard_english_conventions',  'form_structure_and_sense')
  )
);

drop index if exists questions_bank_idx;
create index questions_bank_idx on questions (subject, section, skill, difficulty, status);

-- ------------------------------------------------------------- the labels ----
-- One row per loaded item.  Keyed on source_ref rather than id, so this says
-- the same thing whether it runs on a fresh database or the live one.
update questions q
   set skill = v.skill
  from (values
    ('ENG-DIAG-INCLASS-Q01', 'central_ideas_and_details'),
    ('ENG-DIAG-INCLASS-Q02', 'command_of_evidence_textual'),
    ('ENG-DIAG-INCLASS-Q03', 'text_structure_and_purpose'),
    ('ENG-DIAG-INCLASS-Q04', 'central_ideas_and_details'),
    ('ENG-DIAG-INCLASS-Q05', 'central_ideas_and_details'),
    ('ENG-DIAG-INCLASS-Q06', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-INCLASS-Q07', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-INCLASS-Q08', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-INCLASS-Q09', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-INCLASS-Q10', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-INCLASS-Q11', 'words_in_context'),
    ('ENG-DIAG-INCLASS-Q12', 'text_structure_and_purpose'),
    ('ENG-DIAG-INCLASS-Q13', 'cross_text_connections'),
    ('ENG-DIAG-INCLASS-Q14', 'command_of_evidence_textual'),
    ('ENG-DIAG-INCLASS-Q15', 'transitions'),
    ('ENG-DIAG-INCLASS-Q16', 'transitions'),
    ('ENG-DIAG-INCLASS-Q17', 'rhetorical_synthesis'),
    ('ENG-DIAG-INCLASS-Q18', 'text_structure_and_purpose'),
    ('ENG-DIAG-INCLASS-Q19', 'words_in_context'),
    ('ENG-DIAG-INCLASS-Q20', 'text_structure_and_purpose'),
    ('ENG-DIAG-INCLASS-Q21', 'boundaries'),
    ('ENG-DIAG-INCLASS-Q22', 'boundaries'),
    ('ENG-DIAG-INCLASS-Q23', 'form_structure_and_sense'),
    ('ENG-DIAG-INCLASS-Q24', 'cross_text_connections'),
    ('ENG-DIAG-INCLASS-Q25', 'text_structure_and_purpose'),

    ('ENG-DIAG-T4-M1-Q01', 'words_in_context'),
    ('ENG-DIAG-T4-M1-Q02', 'words_in_context'),
    ('ENG-DIAG-T4-M1-Q03', 'words_in_context'),
    ('ENG-DIAG-T4-M1-Q04', 'words_in_context'),
    ('ENG-DIAG-T4-M1-Q05', 'text_structure_and_purpose'),
    ('ENG-DIAG-T4-M1-Q06', 'text_structure_and_purpose'),
    ('ENG-DIAG-T4-M1-Q07', 'text_structure_and_purpose'),
    ('ENG-DIAG-T4-M1-Q08', 'central_ideas_and_details'),
    ('ENG-DIAG-T4-M1-Q09', 'central_ideas_and_details'),
    ('ENG-DIAG-T4-M1-Q10', 'text_structure_and_purpose'),
    ('ENG-DIAG-T4-M1-Q11', 'command_of_evidence_textual'),
    ('ENG-DIAG-T4-M1-Q12', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-T4-M1-Q13', 'command_of_evidence_quantitative'),
    ('ENG-DIAG-T4-M1-Q14', 'inferences'),
    ('ENG-DIAG-T4-M1-Q17', 'boundaries'),
    ('ENG-DIAG-T4-M1-Q19', 'form_structure_and_sense'),
    ('ENG-DIAG-T4-M1-Q21', 'transitions'),
    ('ENG-DIAG-T4-M1-Q22', 'transitions'),
    ('ENG-DIAG-T4-M1-Q23', 'rhetorical_synthesis'),
    ('ENG-DIAG-T4-M1-Q25', 'rhetorical_synthesis'),

    ('ENG-DIAG-T4-M2-Q02', 'words_in_context'),
    ('ENG-DIAG-T4-M2-Q03', 'words_in_context'),
    ('ENG-DIAG-T4-M2-Q05', 'cross_text_connections'),
    ('ENG-DIAG-T4-M2-Q06', 'central_ideas_and_details'),
    ('ENG-DIAG-T4-M2-Q07', 'central_ideas_and_details'),
    ('ENG-DIAG-T4-M2-Q08', 'text_structure_and_purpose'),
    ('ENG-DIAG-T4-M2-Q09', 'command_of_evidence_textual'),
    ('ENG-DIAG-T4-M2-Q11', 'command_of_evidence_textual'),
    ('ENG-DIAG-T4-M2-Q12', 'command_of_evidence_textual'),
    ('ENG-DIAG-T4-M2-Q13', 'inferences'),
    ('ENG-DIAG-T4-M2-Q14', 'inferences'),
    ('ENG-DIAG-T4-M2-Q15', 'inferences'),
    ('ENG-DIAG-T4-M2-Q18', 'boundaries'),
    ('ENG-DIAG-T4-M2-Q20', 'boundaries'),
    ('ENG-DIAG-T4-M2-Q21', 'form_structure_and_sense'),
    ('ENG-DIAG-T4-M2-Q22', 'boundaries'),
    ('ENG-DIAG-T4-M2-Q23', 'transitions'),
    ('ENG-DIAG-T4-M2-Q24', 'form_structure_and_sense'),
    ('ENG-DIAG-T4-M2-Q25', 'transitions'),
    ('ENG-DIAG-T4-M2-Q26', 'rhetorical_synthesis')
  ) as v(source_ref, skill)
 where q.source_ref = v.source_ref;

-- Every loaded item is labelled, and it stays that way: a paper that lands
-- half-tagged is the state this migration exists to prevent.
do $$
declare n int;
begin
  select count(*) into n from questions where source_ref is not null and skill is null;
  if n > 0 then
    raise exception '% loaded item(s) have no skill label', n;
  end if;
end;
$$;

-- --------------------------------------------------------- loader + RPC ----
-- Both writers carry the skill, so the next paper is labelled as it lands
-- rather than in a follow-up migration like this one.
drop function if exists public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status);

create function public.seed_bank_item(
  p_source_ref  text,
  p_section     text,
  p_passage     text,
  p_underline   text,
  p_stem        text,
  p_difficulty  difficulty_level,
  p_rationale   text,
  p_options     jsonb,
  p_correct     answer_option,
  p_explanation text,
  p_status      question_status default 'published',
  p_skill       text default null
) returns uuid
language plpgsql
as $fn$
declare
  qid uuid;
begin
  insert into questions (
    created_by, subject, section, skill, passage, passage_underline, stem,
    difficulty, difficulty_rationale, status, source_ref
  ) values (
    null, 'english', p_section, p_skill, p_passage, p_underline, p_stem,
    p_difficulty, p_rationale, p_status, p_source_ref
  )
  on conflict (source_ref) where source_ref is not null do update set
    section              = excluded.section,
    skill                = excluded.skill,
    passage              = excluded.passage,
    passage_underline    = excluded.passage_underline,
    stem                 = excluded.stem,
    difficulty           = excluded.difficulty,
    difficulty_rationale = excluded.difficulty_rationale,
    status               = excluded.status
  returning id into qid;

  delete from question_options where question_id = qid;
  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body'
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, p_explanation)
  on conflict (question_id) do update set
    correct_option = excluded.correct_option,
    explanation    = excluded.explanation,
    updated_at     = now();

  return qid;
end;
$fn$;

revoke execute on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status, text
) from anon, authenticated;

comment on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status, text
) is 'Upserts one house question by source_ref, with its options and key. Used by the paper-loading migrations.';

drop function if exists public.create_question(
  text, text, text, text, difficulty_level, text, jsonb, answer_option, text, text);

create function public.create_question(
  p_subject              text,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null
) returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  qid    uuid;
  labels text[];
  span   text := nullif(btrim(coalesce(p_passage_underline, '')), '');
begin
  select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;
  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;
  -- A span that is not in the passage would silently render unmarked, which is
  -- the one failure the teacher cannot see from the form. Refuse it instead.
  if span is not null and position(span in coalesce(p_passage, '')) = 0 then
    raise exception 'the underlined sentence must appear in the passage exactly';
  end if;

  insert into questions (created_by, subject, section, skill, passage, passage_underline,
                         stem, difficulty, difficulty_rationale)
  values (auth.uid(), p_subject, nullif(p_section, ''), nullif(p_skill, ''),
          nullif(p_passage, ''), span, p_stem,
          p_difficulty, nullif(p_difficulty_rationale, ''))
  returning id into qid;

  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body' from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, nullif(p_explanation, ''));

  return qid;
end;
$$;
