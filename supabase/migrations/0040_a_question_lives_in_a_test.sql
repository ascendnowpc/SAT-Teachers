-- ============================================================================
--  0040 — a question lives in a test, or it does not exist
--
--  A teacher wrote a question, saved it, and it went nowhere. The headline on
--  the bank page counted it — 21 medium where the medium test holds 20 — and
--  no screen in the product would show it, because every screen that shows a
--  question shows it inside the test that holds it (0029). A number that goes
--  up and nothing to read: the worst of both.
--
--  It is not a display bug. Writing a question and filing it were two steps:
--  `create_question`, and then an insert into question_set_items from the
--  browser. The Add question button on the bank page took the first step and
--  never had a second one to take — there was no test in the URL to file into
--  — so it wrote questions into a place nothing reads from. And even from a
--  test's own Add question button, the two calls are two round trips: the
--  second one failing leaves the first one standing, which is the same orphan
--  by a rarer route.
--
--  So filing stops being a step.
--
--    create_question_in_set(p_set, …)   one call, one transaction: the
--                                       question, its options, its key, and
--                                       its place at the end of the test
--
--  It takes no subject and no difficulty, because the test already knows
--  both. That is 0026's rule — DIFFICULTY FOLLOWS THE TEST, an item in the
--  easy test is easy — enforced where it can no longer be contradicted rather
--  than written down and hoped for. It is exactly what went wrong here: the
--  question said "medium" and no medium test held it, and both halves of the
--  headline were reading a different fact.
--
--  The target must be one of the live level tests. Filing into a deactivated
--  paper is the same dead end with a row to show for it.
--
--  `create_question` itself stays as it is — update_question mirrors it, the
--  SQL contracts call it, and it is the thing this new function is built out
--  of. What changes is that nothing in the app calls it directly any more.
--
--  Then the two kinds of question that no test holds are cleared out, and
--  mathematics gets the three tests English has had since 0026.
-- ============================================================================

-- ------------------------------------------------- writing into a test ----
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
  p_image_url            text default null
) returns uuid
language plpgsql security invoker set search_path = public as $$
declare
  v_subject text;
  v_level   text;
  v_pos     int;
  qid       uuid;
begin
  -- An active level test, or nothing. A set that no session can run is not
  -- somewhere a question can be put.
  select qs.subject, qs.level into v_subject, v_level
    from question_sets qs
   where qs.id = p_set and qs.is_active and qs.level is not null;

  if v_level is null then
    raise exception 'a question is written into one of the level tests';
  end if;

  -- The subject and the level are the test's. Nothing else can set them, so
  -- the bank's counts and the tests can never disagree again.
  qid := create_question(
    v_subject, p_section, p_passage, p_stem, v_level::difficulty_level,
    p_difficulty_rationale, p_options, p_correct, p_explanation,
    p_passage_underline, p_skill, p_image_url
  );

  select coalesce(max(position), 0) + 1 into v_pos
    from question_set_items where set_id = p_set;

  -- Same transaction as the insert above: if this fails there is no question
  -- left behind, which is the whole point of the function existing.
  insert into question_set_items (set_id, question_id, position)
  values (p_set, qid, v_pos);

  return qid;
end $$;

-- 0035: this project grants execute to anon by default privilege, so revoking
-- from PUBLIC alone leaves the door open. By name, then.
revoke execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text
) from public, anon;
grant execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text
) to authenticated;

comment on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text
) is
  'Writes a question and files it at the end of a level test, in one transaction. Subject and difficulty come from the test.';

-- --------------------------------------------------- clearing the strays ----
--  Two kinds of row, one condition: no active level test holds them, so
--  nothing can put them in front of a student.
--
--    * the twenty-six 0029 retired — the twenty-five in-class diagnostic items
--      and ENG-DIAG-T4-M2-Q01, which the teachers did not pick when they
--      sorted the bank into three levels. 0029 left them in place on the
--      reasoning that a session which had already sat on one must still
--      render. That reasoning is kept here and is the one exception to this
--      whole block: ANYTHING A SESSION EVER ASKED IS NOT DELETED.
--      session_items points at questions without a cascade (0005) and a
--      student's report is built out of those rows, so deleting one would not
--      tidy a report, it would tear a question out of it.
--
--      On any database carrying the 7 August recording (0012) that keeps
--      exactly one of the twenty-six: Q01 is the first question of that
--      session. It stays, and it stays retired — no session can draw it, and
--      nothing counts it as stock — and the twenty-five go.
--
--    * the question this migration is named after, and anything else saved
--      before create_question_in_set existed and never filed.
--
--  Deleting a question takes its options, its key and its place in any
--  deactivated paper with it — all three cascade from 0001 and 0011. Which
--  papers those were is printed rather than left to be discovered: the source
--  papers 0026 deactivated are archives and are expected to shrink, and any
--  other set losing rows is worth reading about in the deploy output.
do $$
declare
  v_gone int;
  v_kept int;
  v_sets text;
begin
  -- What the cascade is about to take out of each set, while it is still there
  -- to count.
  select string_agg(format('%s loses %s', title, n), '; ' order by title)
    into v_sets
    from (
      select qs.title, count(*) as n
        from question_set_items qi
        join question_sets qs on qs.id = qi.set_id
       where not exists (
               select 1 from question_set_items qi2
                 join question_sets qs2 on qs2.id = qi2.set_id
                where qi2.question_id = qi.question_id
                  and qs2.level is not null and qs2.is_active)
         and not exists (
               select 1 from session_items si where si.question_id = qi.question_id)
       group by qs.title
    ) losing;

  delete from questions q
   where not exists (
           select 1 from question_set_items qi
             join question_sets qs on qs.id = qi.set_id
            where qi.question_id = q.id and qs.level is not null and qs.is_active)
     and not exists (
           select 1 from session_items si where si.question_id = q.id);
  get diagnostics v_gone = row_count;

  -- What is left over was asked in a real session. It stays readable, and it
  -- is marked for what it is so nothing counts it as stock.
  update questions q
     set status = 'retired'
   where q.status <> 'retired'
     and not exists (
           select 1 from question_set_items qi
             join question_sets qs on qs.id = qi.set_id
            where qi.question_id = q.id and qs.level is not null and qs.is_active);
  get diagnostics v_kept = row_count;

  raise notice 'deleted % question(s) that no test held; retired % that a session had already asked', v_gone, v_kept;
  if v_sets is not null then
    raise notice 'sets that shrank: %', v_sets;
  end if;
end $$;

-- ------------------------------------------------------- mathematics ----
--  Three tests, empty, waiting. The teachers add the questions from inside
--  them, which is now the only way a question gets written at all.
--
--  question_sets_level_idx is unique on (subject, level) where the set is
--  active, so these three sit beside the English three rather than competing
--  with them, and load_session_level already looks a test up by the session's
--  subject as well as its level (0027) — so the day the first maths question
--  is written, a maths session runs it with nothing further to deploy.
insert into question_sets (created_by, title, subject, description, kind, level, source_ref, is_active)
values
  (null, 'Mathematics — Easy', 'mathematics',
   'Where every mathematics session starts.', 'test', 'easy', 'MATH-LEVEL-EASY', true),
  (null, 'Mathematics — Medium', 'mathematics',
   'A step up from the easy test.', 'test', 'medium', 'MATH-LEVEL-MEDIUM', true),
  (null, 'Mathematics — Hard', 'mathematics',
   'The hardest of the three.', 'test', 'hard', 'MATH-LEVEL-HARD', true)
on conflict (source_ref) where source_ref is not null do update set
  title       = excluded.title,
  subject     = excluded.subject,
  description = excluded.description,
  kind        = excluded.kind,
  level       = excluded.level,
  is_active   = true;

-- ---------------------------------------------------------- the invariant ----
--  0029 printed a warning when a level test was not twenty questions. That
--  was true of the bank it was written against and is not an invariant any
--  more: a test a teacher is still filling is short on purpose, and three of
--  them are empty as of this migration. What holds now is narrower and is the
--  thing that broke: every question in the bank is either in a live test or
--  retired, and no third state.
do $$
declare
  v_stray int;
begin
  select count(*) into v_stray
    from questions q
   where q.status <> 'retired'
     and not exists (
           select 1 from question_set_items qi
             join question_sets qs on qs.id = qi.set_id
            where qi.question_id = q.id and qs.level is not null and qs.is_active);

  if v_stray > 0 then
    raise warning '% question(s) are in no live test and are not retired', v_stray;
  end if;
end $$;
