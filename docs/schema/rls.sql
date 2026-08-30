-- ============================================================================
--  Row Level Security  (DESIGN DOCUMENT, not yet applied)
--
--  Principle: anything a student must not see lives in a table a student
--  cannot read.  RLS is row-level, and Supabase Realtime pushes whole rows,
--  so column-level secrecy is not achievable by policy alone.
-- ============================================================================

alter table profiles              enable row level security;
alter table questions             enable row level security;
alter table question_options      enable row level security;
alter table question_assets       enable row level security;
alter table question_keys         enable row level security;
alter table sessions              enable row level security;
alter table session_participants  enable row level security;
alter table session_items         enable row level security;
alter table session_item_grades   enable row level security;
alter table transcripts           enable row level security;
alter table transcript_segments   enable row level security;
alter table reports               enable row level security;
alter table report_sections       enable row level security;
alter table report_claims         enable row level security;
alter table report_claim_evidence enable row level security;

-- ------------------------------------------------------------- helpers ----
create or replace function auth_role() returns user_role
language sql stable security definer set search_path = public as $$
  select role from profiles where id = auth.uid()
$$;

create or replace function auth_org() returns uuid
language sql stable security definer set search_path = public as $$
  select organization_id from profiles where id = auth.uid()
$$;

create or replace function is_staff() returns boolean
language sql stable as $$ select auth_role() in ('admin','teacher') $$;

-- -------------------------------------------------------------- content ----
-- Staff browse the whole published bank within their org.
create policy questions_staff_read on questions for select
  using (is_staff() and organization_id = auth_org());

create policy questions_admin_write on questions for all
  using (auth_role() = 'admin' and organization_id = auth_org())
  with check (auth_role() = 'admin' and organization_id = auth_org());

-- A student may read a question ONLY through a session item of their own that
-- has actually been published.  Staging never exposes anything.
create policy questions_student_read on questions for select
  using (
    exists (
      select 1 from session_items si
      where si.question_id = questions.id
        and si.student_id  = auth.uid()
        and si.status <> 'staged'
    )
  );

create policy options_read on question_options for select
  using (
    exists (select 1 from questions q where q.id = question_id)   -- inherits above
  );

create policy assets_read on question_assets for select
  using (
    exists (select 1 from questions q where q.id = question_id)
  );

-- THE ANSWER KEY.  Staff only.  No student policy exists, so no student row.
create policy keys_staff_only on question_keys for select using (is_staff());
create policy keys_admin_write on question_keys for all
  using (auth_role() = 'admin') with check (auth_role() = 'admin');

-- ------------------------------------------------------------- sessions ----
create policy sessions_teacher on sessions for all
  using (teacher_id = auth.uid())
  with check (teacher_id = auth.uid() and organization_id = auth_org());

create policy sessions_admin on sessions for all
  using (auth_role() = 'admin' and organization_id = auth_org());

create policy sessions_student_read on sessions for select
  using (
    exists (select 1 from session_participants p
            where p.session_id = sessions.id and p.student_id = auth.uid())
  );

-- Teacher sees every item in their own sessions.
create policy items_teacher on session_items for all
  using (
    exists (select 1 from sessions s
            where s.id = session_id and s.teacher_id = auth.uid())
  );

-- Student sees only their own items, and only once published.
create policy items_student_read on session_items for select
  using (student_id = auth.uid() and status <> 'staged');

-- Students do not write here directly; the Render service grades and writes
-- with the service role.  Deliberately no student INSERT/UPDATE policy.

-- Correctness before reveal: staff only.  Students learn the result through
-- session_items.revealed_result, which the teacher controls.
create policy grades_staff_only on session_item_grades for select
  using (
    exists (select 1 from session_items si
            join sessions s on s.id = si.session_id
            where si.id = session_item_id and s.teacher_id = auth.uid())
    or auth_role() = 'admin'
  );

-- ---------------------------------------------------------- transcripts ----
-- Raw transcripts are never student- or parent-visible; they contain the whole
-- conversation.  Parents see only the quotes promoted into a published report.
create policy transcripts_staff on transcripts for all
  using (
    exists (select 1 from sessions s
            where s.id = session_id and (s.teacher_id = auth.uid() or auth_role() = 'admin'))
  );

create policy segments_staff on transcript_segments for all
  using (
    exists (select 1 from transcripts t where t.id = transcript_id)
  );

-- --------------------------------------------------------------- reports ----
create policy reports_teacher on reports for all
  using (
    exists (select 1 from sessions s
            where s.id = session_id and s.teacher_id = auth.uid())
    or auth_role() = 'admin'
  );

-- Students and parents see PUBLISHED reports only.
create policy reports_student_read on reports for select
  using (status = 'published' and student_id = auth.uid());

create policy reports_guardian_read on reports for select
  using (
    status = 'published'
    and exists (select 1 from guardian_links g
                where g.student_id = reports.student_id and g.guardian_id = auth.uid())
  );

-- Sections / claims / evidence inherit report visibility.
create policy sections_read on report_sections for select
  using (exists (select 1 from reports r where r.id = report_id));

create policy claims_read on report_claims for select
  using (exists (select 1 from report_sections s where s.id = section_id));

create policy evidence_read on report_claim_evidence for select
  using (exists (select 1 from report_claims c where c.id = claim_id));

-- ============================================================================
--  Tests that must exist in CI (packages/db/tests):
--   1. student cannot select from question_keys                      -> 0 rows
--   2. student cannot select from session_item_grades                -> 0 rows
--   3. student cannot select a staged session_item                   -> 0 rows
--   4. student cannot select a question that is only staged for them -> 0 rows
--   5. student cannot select another student's items                 -> 0 rows
--   6. parent cannot select a draft report                           -> 0 rows
--   7. parent cannot select transcripts at all                       -> 0 rows
--   8. teacher cannot select sessions belonging to another teacher   -> 0 rows
--   9. publishing a report with an uncited claim                     -> raises
--  These are the security contract.  They run on every PR.
-- ============================================================================
