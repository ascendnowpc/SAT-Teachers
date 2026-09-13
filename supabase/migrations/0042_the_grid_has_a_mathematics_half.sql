-- ============================================================================
--  0042 — the grid has a mathematics half
--
--  0041 filled the three mathematics tests, so a mathematics session runs.
--  What it could not do was finish: the diagnostic form is the last step of a
--  session (0030) and the form would not take a mathematics answer.
--
--  session_domain_notes.domain has been checked against the four Reading and
--  Writing domains since 0013, so the four rows a mathematics teacher fills in
--  — Algebra, Advanced Math, Problem-Solving and Data Analysis, Geometry and
--  Trigonometry — were rejected by Postgres, and submit_diagnostic_form counts
--  four filled rows before it will hand the form in.  The only form that could
--  be handed in for a mathematics session was one judging it on Words in
--  Context.
--
--  So both checks learn the other four domains.  The eight values are the
--  sections the questions themselves already carry (0004, 0041), which is what
--  the report groups by — one list of domains, not two that can disagree.
--
--  There is deliberately no check that a session's notes match its subject.
--  The grid is written a row at a time while a teacher talks, the subject is on
--  another table, and a constraint that reaches across to it would fail a
--  half-written draft rather than a wrong one.  The form decides which four
--  rows it offers, from the session it was opened on.
-- ============================================================================

alter table session_domain_notes
  drop constraint if exists session_domain_notes_domain_check;

alter table session_domain_notes
  add constraint session_domain_notes_domain_check check (domain in (
    -- English — Reading and Writing
    'information_and_ideas', 'craft_and_structure',
    'expression_of_ideas',   'standard_english_conventions',
    -- Mathematics
    'algebra', 'advanced_math',
    'problem_solving_and_data_analysis', 'geometry_and_trigonometry'));

comment on table session_domain_notes is
  'The teacher evaluation grid, one row per domain: the mark, the note beside it, strengths, gaps and next steps. Four rows per session — which four depends on the session''s subject.';

alter table session_reports
  drop constraint if exists session_reports_practice_priority_check;

alter table session_reports
  add constraint session_reports_practice_priority_check
  check (practice_priority is null or practice_priority in (
    'information_and_ideas', 'craft_and_structure',
    'expression_of_ideas',   'standard_english_conventions',
    'algebra', 'advanced_math',
    'problem_solving_and_data_analysis', 'geometry_and_trigonometry'));
