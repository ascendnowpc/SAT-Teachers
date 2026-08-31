-- ============================================================================
--  0021 — a paper in the bank, and a test made out of it
--
--  question_sets has been doing two jobs, told apart by whether source_ref was
--  null.  That worked while the only papers were the ones the bank was loaded
--  with, and stopped working the moment a teacher wanted to make one: a set
--  they created was filed as a test whatever they meant by it.
--
--  So the difference becomes a column rather than an inference.
--
--    kind = 'paper'   a paper in the bank — questions are WRITTEN into it.
--                     The three diagnostics are papers; so is "English Module
--                     3" when a teacher makes one to author into.
--
--    kind = 'test'    a paper ASSEMBLED from questions that already exist, to
--                     be sat in a session.
--
--  Both are an ordered list of questions, which is why they stay one table.
--  What differs is where they show up and what you do with them: a paper is
--  filed under Questions and you add questions to it; a test is filed under
--  Tests and you pick questions into it.
-- ============================================================================

alter table question_sets add column if not exists kind text not null default 'test'
  check (kind in ('paper', 'test'));

comment on column question_sets.kind is
  'paper: a bank paper, questions are written into it. test: assembled from existing questions, to be sat.';

-- Everything that came in with the bank is a paper by definition.
update question_sets set kind = 'paper' where source_ref is not null and kind <> 'paper';

create index if not exists question_sets_kind_idx on question_sets (kind, subject);
