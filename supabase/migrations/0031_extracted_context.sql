-- ============================================================================
--  0031 — what the recording said, extracted and kept
--
--  0030 stopped at the point the teacher presses Generate.  This is what the
--  button now has to press against:
--
--      the form is in  →  the transcript is cut into one window per question
--                      →  a model reads each window and records what it shows,
--                         every claim carrying a verbatim quote
--                      →  the claims that cannot be pointed at a line are
--                         dropped by the edge function, not stored
--                      →  the survivors land here
--                      →  the report is the teacher's form and this, side by
--                         side, with a computed column of numbers
--
--  Three things this table is NOT.
--
--  It is not the report.  The report is assembled at read time from the form,
--  these rows and the answers, so a report cannot drift from the session it
--  describes — the same rule 0013 set for the grid.
--
--  It is not a cache of something cheap.  The deterministic reading in
--  analysis.ts is recomputed on every page open precisely because it costs
--  nothing.  This costs a model call, so it is stored — and stored with the
--  transcript's own fingerprint, so a re-uploaded recording invalidates a
--  reading taken from the old one instead of quietly outliving it.
--
--  It is not trusted.  Everything in `body` has already survived the quote
--  check in the edge function; `drops` is what did not, kept because a rising
--  drop rate is how a broken prompt announces itself and there is nowhere else
--  it would be visible.
-- ============================================================================

create table session_context_extractions (
  session_id     uuid primary key references sessions(id) on delete cascade,

  -- The validated reading: questions[] and session{}, exactly the shape
  -- apps/web/src/lib/extraction.ts calls Extraction. Kept as jsonb rather than
  -- shredded into columns because it is read whole, always, and a schema change
  -- here would otherwise mean a migration for every field the model learns to
  -- report.
  body           jsonb not null,

  -- What failed validation, and why. Not an error log — a quality signal.
  drops          jsonb not null default '[]'::jsonb,

  -- md5 of the transcript body this was read from. A transcript is replaced by
  -- a second upload (0013 keeps one per session), and a reading of the old
  -- recording quoting lines the new one does not contain is exactly the kind of
  -- silent wrongness this whole design exists to prevent.
  transcript_md5 text not null,

  -- Which model, and the offset the alignment used. Both are needed to make
  -- sense of a bad reading months later, and neither can be recovered from the
  -- output.
  model          text not null,
  offset_seconds int  not null,

  created_at     timestamptz not null default now()
);

comment on table session_context_extractions is
  'The model''s reading of the recording, after every claim without a verbatim quote has been dropped. One row per session, replaced when the transcript is.';
comment on column session_context_extractions.drops is
  'Claims that failed validation. Watched, not shown: a rising drop rate means the prompt broke.';
comment on column session_context_extractions.transcript_md5 is
  'The transcript this reading came from. A different transcript makes this row stale, and generate_report refuses it.';

alter table session_context_extractions enable row level security;

-- The session's own teacher, and nobody else. Students do not read the
-- teacher's working, and the parent reads the published report rather than this.
create policy session_context_extractions_teacher_read on session_context_extractions
  for select using (
    exists (select 1 from sessions s
             where s.id = session_context_extractions.session_id
               and s.teacher_id = auth.uid())
  );

-- Writes come from the edge function on the service role, which bypasses RLS.
-- No client-side insert policy exists on purpose: if a teacher's browser could
-- write this table, "every claim carries a checked quote" would be a promise
-- made by the client about itself, which is not a promise.

-- ------------------------------------------------------- generating it -----
-- 0030's generate_report only stamped the time. It now also refuses to generate
-- a report from a reading of a transcript that has since been replaced —
-- silently reporting on the wrong recording is worse than not reporting.
--
-- A missing reading is NOT refused. The extraction is an enrichment: the
-- teacher's form and the computed numbers are a complete report without it, and
-- a model being down on a Thursday should not stop a teacher finishing their
-- work. The report says which of the two it is.
create or replace function public.generate_report(p_session uuid)
returns timestamptz language plpgsql security definer set search_path = public as $$
declare
  v_at    timestamptz;
  v_body  text;
  v_md5   text;
begin
  perform assert_session_teacher(p_session);

  if not exists (select 1 from session_reports r
                  where r.session_id = p_session and r.form_submitted_at is not null) then
    raise exception 'the diagnostic form has not been submitted yet';
  end if;

  select t.body into v_body from session_transcripts t where t.session_id = p_session;
  select e.transcript_md5 into v_md5
    from session_context_extractions e where e.session_id = p_session;

  if v_md5 is not null and v_md5 <> md5(v_body) then
    raise exception 'the transcript changed after the recording was read — read it again before generating';
  end if;

  v_at := now();
  update session_reports set generated_at = v_at where session_id = p_session;
  return v_at;
end $$;

revoke execute on function public.generate_report(uuid) from anon;
