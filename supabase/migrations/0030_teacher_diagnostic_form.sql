-- ============================================================================
--  0030 — the teacher's diagnostic form
--
--  How a diagnostic actually finishes, in the teachers' own order:
--
--      the session ends  →  no score and no report yet
--                        →  the teacher fills the English reflection grid
--                        →  the teacher drops in the Fathom transcript
--                        →  the report is generated from the two of them
--                        →  the report goes to the student and the parent
--
--  Everything before the third arrow is this migration.  The grid the teachers
--  already fill on paper has six columns; three of them are printed on the form
--  (Domain, Skill Focus, and the default Next steps/Targets) and three are the
--  teacher's to fill in — Student Performance as a tick or a cross, Strengths
--  observed, Gaps observed.  0013 stored two of those three.  This adds the
--  third, plus the teacher's own comments and the moment the form was handed in
--  complete.
--
--  Note what this does NOT do: it does not make the marked performance the
--  report's performance.  The report still computes its numbers from the
--  answers.  This is the teacher's reading of the session, stored beside them,
--  and the report engine is a separate piece of work.
-- ============================================================================

-- ------------------------------------------------------ the grid's columns --
alter table session_domain_notes
  add column if not exists performance      text,
  add column if not exists performance_note text,
  add column if not exists targets          text;

-- The paper form offers exactly two marks in the Student Performance column,
-- and so does this. 'mixed' belongs to the computed grid, which is a reading of
-- the answers rather than a judgement the teacher signed.
do $$
begin
  if not exists (
    select 1 from pg_constraint
     where conrelid = 'session_domain_notes'::regclass
       and conname  = 'session_domain_notes_performance_check'
  ) then
    alter table session_domain_notes
      add constraint session_domain_notes_performance_check
      check (performance is null or performance in ('tick', 'cross'));
  end if;
end $$;

comment on column session_domain_notes.performance is
  'The Student Performance column as the teacher marked it: tick or cross. Null until the form is filled in.';
comment on column session_domain_notes.performance_note is
  'Anything the teacher wrote beside the mark. Optional — the mark is the required part.';
comment on column session_domain_notes.targets is
  'The Next steps/Targets column. Null means the form''s printed default for that domain still stands.';

-- ------------------------------------------- the teacher's own reflection ---
alter table session_reports
  add column if not exists teacher_reflection text,
  add column if not exists form_submitted_at  timestamptz,
  add column if not exists generated_at       timestamptz;

comment on column session_reports.teacher_reflection is
  'The teacher''s comments on the session, written on the diagnostic form before any report exists.';
comment on column session_reports.form_submitted_at is
  'When the diagnostic form was handed in complete. Null while it is still a part-filled draft.';
comment on column session_reports.generated_at is
  'When the teacher generated the report from the form and the transcript. Null until they do.';

-- ---------------------------------------------------------- handing it in ---
-- Every field on the form is required, and "required" that only lives in the
-- browser is a convention rather than a rule. This is the rule: the form is in
-- when all four domains carry a mark, strengths, gaps and targets, the
-- transcript is there, and the teacher has written their comments — and the
-- timestamp is set here rather than by the client, so "when was this filled in"
-- is answerable later.
create or replace function public.submit_diagnostic_form(p_session uuid)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare
  v_filled int;
  v_at     timestamptz;
begin
  perform assert_session_teacher(p_session);

  select count(*) into v_filled
    from session_domain_notes n
   where n.session_id = p_session
     and n.performance is not null
     and coalesce(btrim(n.strengths), '') <> ''
     and coalesce(btrim(n.gaps),      '') <> ''
     and coalesce(btrim(n.targets),   '') <> '';

  if v_filled <> 4 then
    raise exception 'the evaluation grid is incomplete: % of 4 domains filled in', v_filled;
  end if;

  if not exists (select 1 from session_transcripts t
                  where t.session_id = p_session and btrim(t.body) <> '') then
    raise exception 'the Fathom transcript is missing';
  end if;

  if not exists (select 1 from session_reports r
                  where r.session_id = p_session
                    and coalesce(btrim(r.teacher_reflection), '') <> '') then
    raise exception 'the teacher''s comments are missing';
  end if;

  v_at := now();
  update session_reports set form_submitted_at = v_at where session_id = p_session;
  return v_at;
end $$;

revoke execute on function public.submit_diagnostic_form(uuid) from anon;

-- ------------------------------------------------------ generating it -----
-- The report is not a thing that quietly happens once the boxes are full. The
-- teacher presses the button, and it cannot be pressed before the form is in:
-- a report generated from a part-filled form reads as a judgement about four
-- domains when it was only ever told about two.
create or replace function public.generate_report(p_session uuid)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare v_at timestamptz;
begin
  perform assert_session_teacher(p_session);

  if not exists (select 1 from session_reports r
                  where r.session_id = p_session and r.form_submitted_at is not null) then
    raise exception 'the diagnostic form has not been submitted yet';
  end if;

  v_at := now();
  update session_reports set generated_at = v_at where session_id = p_session;
  return v_at;
end $$;

revoke execute on function public.generate_report(uuid) from anon;
