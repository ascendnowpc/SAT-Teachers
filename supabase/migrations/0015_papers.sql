-- ============================================================================
--  0015 — the papers, as papers
--
--  The bank holds 66 items and the Questions tab listed all 66 in a flat run.
--  That is the wrong unit for a teacher: the teachers do not think in items,
--  they think in "the in-class diagnostic" — a paper with directions at the
--  top, passages that carry four or five questions each, and numbering that is
--  the paper's own.
--
--  question_sets is already that object (a paper built once, run with every
--  student), so this does not add a table.  It adds the two things a set was
--  missing before it could be *printed* rather than merely queued:
--
--    instructions  the directions block the paper prints above question 1
--    source_ref    which source paper the set is, so a re-run of this
--                  migration updates the set it made instead of making another
--
--  and then registers all three papers.  Only Test 4 Module 2 existed as a set
--  (0012 built it for the recorded session); the in-class 25Q paper and Test 4
--  Module 1 were loose items in the bank until now.
--
--  Item order inside a set is source_ref order, which is the order the paper
--  prints.  The number shown against a question is parsed from the source_ref
--  and is the paper's printed number, not the position — Test 4's numbering is
--  non-contiguous on purpose (see 0009) and renumbering it would make a
--  teacher's "look at 17" mean two different questions.
-- ============================================================================

alter table question_sets add column if not exists instructions text;
alter table question_sets add column if not exists source_ref  text;

comment on column question_sets.instructions is
  'The directions block the source paper prints above its first question.';
comment on column question_sets.source_ref is
  'Which source paper this set is, e.g. ENG-DIAG-INCLASS. Null for a teacher-built set.';

create unique index if not exists question_sets_source_ref_idx on question_sets (source_ref)
  where source_ref is not null;

-- ---------------------------------------------------------------- loader ----
-- Registers one source paper as a set and fills it with every bank item whose
-- source_ref carries the paper's prefix, in the paper's own order.  Keyed on
-- source_ref, so re-running it re-syncs a paper that has since gained items
-- rather than creating a second copy of it.
create or replace function public.seed_paper(
  p_source_ref   text,
  p_title        text,
  p_description  text,
  p_instructions text,
  p_subject      text default 'english'
) returns uuid
language plpgsql
as $fn$
declare
  sid uuid;
begin
  insert into question_sets (created_by, title, subject, description, instructions, source_ref)
  values (null, p_title, p_subject, p_description, p_instructions, p_source_ref)
  on conflict (source_ref) where source_ref is not null do update set
    title        = excluded.title,
    description  = excluded.description,
    instructions = excluded.instructions,
    subject      = excluded.subject
  returning id into sid;

  -- Position is rewritten wholesale: an item added to the paper later has to
  -- be able to land in the middle, and the unique (set_id, position) index
  -- makes an incremental update collide with itself.
  delete from question_set_items where set_id = sid;
  insert into question_set_items (set_id, question_id, position)
  select sid, q.id, row_number() over (order by q.source_ref)
    from questions q
   where q.source_ref like p_source_ref || '-%';

  return sid;
end $fn$;

revoke execute on function public.seed_paper(text, text, text, text, text)
  from anon, authenticated;

comment on function public.seed_paper(text, text, text, text, text) is
  'Registers one source paper as a question_set and fills it from the bank by source_ref prefix.';

-- ----------------------------------------------------------- the papers ----
-- 0012 built the Module 2 set by hand, under a fixed uuid and its own title.
-- Claiming it here means seed_paper() below updates that set in place rather
-- than inserting a second copy of the same paper beside it.
update question_sets
   set source_ref = 'ENG-DIAG-T4-M2'
 where id = '11111111-1111-4111-8111-111111111111'
   and source_ref is null
   and not exists (select 1 from question_sets s where s.source_ref = 'ENG-DIAG-T4-M2');

do $seed$
declare
  -- The standard Reading and Writing directions, printed verbatim at the head
  -- of the in-class paper and shown on the first screen of each Bluebook
  -- module.  All three papers print the same block.
  rw_directions text :=
    'The questions in this section address a number of important reading and writing skills. '
    'Each question includes one or more passages, which may include a table or graph. Read each '
    'passage and question carefully and then choose the best answer to the question based on the '
    'passage(s). All questions in this section are multiple-choice with four answer choices. Each '
    'question has a single best answer.';
begin

perform seed_paper(
  'ENG-DIAG-INCLASS',
  'SAT Diagnostic Test (Reading and Writing - 25Q)',
  'The in-class diagnostic the teachers run in the first session. Twenty-five questions over four passages and seven standalone items.',
  rw_directions);

perform seed_paper(
  'ENG-DIAG-T4-M1',
  'English Diagnostic Test 4 — Module 1',
  'Module 1 of Test 4, transcribed from the Bluebook deck. The item numbers are the paper''s own and are not contiguous.',
  rw_directions);

perform seed_paper(
  'ENG-DIAG-T4-M2',
  'English Diagnostic Test 4 — Module 2',
  'Module 2 of Test 4, transcribed from the Bluebook deck. The item numbers are the paper''s own and are not contiguous.',
  rw_directions);

end $seed$;
