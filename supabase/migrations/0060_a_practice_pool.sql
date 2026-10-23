-- ============================================================================
--  0060 — a practice pool, outside the three tests
--
--  A targeted test (0061) is a short set on one skill. The three tests were
--  never written for that: twenty questions each across eleven skills, so the
--  deepest skill in English has nine questions over all three levels and most
--  have five or six — and the student's diagnostic has already used some of
--  them. A second test on the same skill would find almost nothing new.
--
--  So each subject gets a practice pool: questions the teachers write by
--  skill, which a targeted test can draw on and a lesson cannot. It is a
--  question_set like the three tests, so writing into it is the same form and
--  the same one-transaction call — what is different is what it is:
--
--    * kind 'practice', and no level. Every lesson control looks a test up by
--      its level, so a question in the pool can never be shown in a lesson,
--      and every count of the three tests (they filter on the level) leaves
--      the pool out without being told to.
--    * one active pool per subject.
--    * a question in the pool carries its own difficulty, because there is no
--      test to take it from — and its own skill, because a targeted test finds
--      its questions by skill and a pool question with none would be stock
--      nobody can reach.
--
--  create_question_in_set gains the difficulty as its last argument. For one
--  of the three tests it is the test's and nothing else: leave it out, or send
--  the test's own level. For the pool it is required. The old signature is
--  dropped rather than left beside the new one — a call naming the first
--  eleven arguments would match both and Postgres would refuse to choose
--  (0024).
-- ============================================================================

-- ------------------------------------------------------------------ kind ---
alter table question_sets drop constraint if exists question_sets_kind_check;
alter table question_sets add constraint question_sets_kind_check
  check (kind in ('paper', 'test', 'practice'));

do $$ begin
  alter table question_sets add constraint question_sets_practice_has_no_level
    check (kind <> 'practice' or level is null);
exception when duplicate_object then null;
end $$;

create unique index if not exists question_sets_practice_idx
  on question_sets (subject) where kind = 'practice' and is_active;

comment on column question_sets.kind is
  'paper: a bank paper. test: one of the three level tests, or an old assembled one. practice: the subject''s practice pool — questions by skill for targeted tests, never shown in a lesson (0060).';

-- ----------------------------------------------------------- the two pools --
-- House content, like the three tests: no author, any teacher may add to it.
insert into question_sets (created_by, title, subject, description, kind, level, source_ref)
values
  (null, 'English — Practice pool', 'english',
   'Questions by skill for targeted tests. Never shown in a lesson.', 'practice', null, 'ENG-PRACTICE'),
  (null, 'Mathematics — Practice pool', 'mathematics',
   'Questions by skill for targeted tests. Never shown in a lesson.', 'practice', null, 'MATH-PRACTICE')
on conflict (source_ref) where source_ref is not null do nothing;

-- ------------------------------------------------------------ writing one --
drop function if exists public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text);

create or replace function public.create_question_in_set(
  p_set                  uuid,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null,
  p_image_url            text default null,
  p_difficulty           difficulty_level default null
) returns uuid
language plpgsql set search_path = public as $$
declare
  v_subject text;
  v_level   text;
  v_kind    text;
  v_diff    difficulty_level;
  v_pos     int;
  qid       uuid;
begin
  -- An active level test or an active pool, or nothing.
  select qs.subject, qs.level, qs.kind into v_subject, v_level, v_kind
    from question_sets qs
   where qs.id = p_set and qs.is_active
     and (qs.level is not null or qs.kind = 'practice');

  if v_kind is null then
    raise exception 'a question is written into one of the level tests or the practice pool';
  end if;

  if v_kind = 'practice' then
    if p_difficulty is null then
      raise exception 'a practice question needs its difficulty — there is no test to take it from';
    end if;
    if nullif(btrim(p_skill), '') is null then
      raise exception 'a practice question needs its skill — a targeted test finds its questions by skill';
    end if;
    v_diff := p_difficulty;
  else
    -- The test's level, and nothing else can set it (0040).
    if p_difficulty is not null and p_difficulty::text <> v_level then
      raise exception 'a question in the % test is %', v_level, v_level;
    end if;
    v_diff := v_level::difficulty_level;
  end if;

  qid := create_question(
    v_subject, p_section, p_passage, p_stem, v_diff,
    p_difficulty_rationale, p_options, p_correct, p_explanation,
    p_passage_underline, p_skill, p_image_url
  );

  select coalesce(max(position), 0) + 1 into v_pos
    from question_set_items where set_id = p_set;

  -- Same transaction as the insert above (0040).
  insert into question_set_items (set_id, question_id, position)
  values (p_set, qid, v_pos);

  return qid;
end $$;

revoke execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level)
  from public, anon;
grant execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level)
  to authenticated;

comment on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level) is
  'Writes a question into one of the level tests (which decides its level) or the practice pool (which needs a difficulty and a skill), in one transaction (0040, 0060). RLS on the bank decides who may.';
