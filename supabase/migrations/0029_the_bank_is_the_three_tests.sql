-- ============================================================================
--  0029 — the bank is the three tests, and the count says so
--
--  The dashboard read:
--
--      QUESTIONS 86    EASY 30    MEDIUM 34    HARD 22
--
--  and every one of those numbers was true and none of them was useful. A
--  session runs a level, there are three levels, and each holds twenty items.
--  Sixty is the number of questions this product can put in front of a
--  student. The other twenty-six cannot be asked by anything: they are in no
--  level test, and 0027 took away every other way a question reached a
--  student.
--
--  Where they came from is 0026. The bank was loaded paper by paper — the
--  in-class 25Q diagnostic, Test 4 Module 1, Test 4 Module 2 — and then the
--  teachers re-sorted the content into three levels by hand. Forty of the
--  Test 4 items went into the easy and hard tests, twenty new items became
--  medium, and what the teachers did not pick stayed in the bank. 0026
--  deactivated the *papers* those leftovers belonged to, which stopped them
--  being runnable, and said in its own header that "nothing is deleted" and
--  the items stay "where a teacher can still find them under All questions".
--
--  That was right about the items and wrong about the counting. An item that
--  no session can ask is not stock, and totalling it with the sixty that can
--  be asked makes the bank look half again as deep as it is — which is the
--  one thing a teacher reads that number to find out.
--
--  So the twenty-six are RETIRED, which is the status the schema has carried
--  since 0001 for exactly this: still in the bank, no longer in use.
--
--    * Nothing is deleted, so every session already sat on these items still
--      renders — questions has no RLS policy that reads status (0001, 0005),
--      so a retired question is as readable as it ever was to the teachers who
--      own the bank and to the students who answered it.
--    * Nothing becomes askable or unaskable. load_session_level draws from a
--      level test's items and these are in none, before this migration and
--      after it.
--    * Undoing it is one statement: set status back to 'published' for the
--      rows this one moved.
--
--  Scoped to house content with `created_by is null`. A teacher-authored
--  question is in no level test the second it is written, and a rule that
--  swept those up would retire every new question the moment it was saved.
--  This is a one-time correction to what the loaders left behind, not a
--  standing rule about what belongs in the bank.
-- ============================================================================

do $$
declare
  v_retired int;
begin
  update questions q
     set status = 'retired'
   where q.status = 'published'
     and q.created_by is null
     and not exists (
       select 1
         from question_set_items qi
         join question_sets qs on qs.id = qi.set_id
        where qi.question_id = q.id
          and qs.level is not null
          and qs.is_active
     );
  get diagnostics v_retired = row_count;

  raise notice 'retired % house question(s) that no level test holds', v_retired;
end $$;

-- The three tests are what is left standing, and they are twenty each. Said
-- out loud here because it is the invariant the dashboard now prints, and a
-- content migration that quietly broke it would otherwise be found by a
-- teacher rather than by a deploy.
do $$
declare
  v_bad text;
begin
  select string_agg(format('%s has %s', level, n), ', ' order by level)
    into v_bad
    from (
      select qs.level, count(*) as n
        from question_sets qs
        join question_set_items qi on qi.set_id = qs.id
       where qs.level is not null and qs.is_active
       group by qs.level
      having count(*) <> 20
    ) bad;

  if v_bad is not null then
    raise warning 'a level test is not twenty questions: %', v_bad;
  end if;
end $$;
