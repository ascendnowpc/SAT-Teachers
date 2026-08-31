-- ============================================================================
--  0013 — the evaluation grid, the diagnostic summary, and the transcript
--
--  The teachers already have a report format: a paper grid, four domain rows
--  wide, filled in while the student is taking the test.  This makes it the
--  actual report rather than a second thing kept alongside one.
--
--    session_transcripts   the Fathom recording's transcript, pasted or
--                          uploaded after the session
--    session_domain_notes  the grid's two written columns, one row per domain:
--                          strengths observed, gaps observed
--    session_reports       the Overall Diagnostic Summary underneath it
--
--  The split matters.  Student Performance, Accuracy Rate and the recommended
--  priority are COMPUTED from the answers — they are never stored, so they
--  cannot drift from what happened.  Strengths, gaps and the teacher's reading
--  of engagement are WRITTEN, because no amount of answer data knows that a
--  student went quiet or talked herself out of a right answer.  This table
--  holds only the written half.
-- ============================================================================

-- ----------------------------------------------------------- transcripts ----
create table session_transcripts (
  id          uuid primary key default gen_random_uuid(),
  session_id  uuid not null references sessions(id) on delete cascade,
  source      text not null default 'fathom'
                check (source in ('fathom', 'zoom', 'manual')),
  filename    text,
  body        text not null,
  uploaded_by uuid references profiles(id),
  created_at  timestamptz not null default now()
);
-- One transcript per session: a second upload replaces the first rather than
-- leaving the report to guess which recording it is quoting.
create unique index session_transcripts_one_per_session on session_transcripts (session_id);

comment on table session_transcripts is
  'The session recording''s transcript. Quotes in the report are aligned to questions by timestamp.';

-- --------------------------------------------------------- the grid rows ----
create table session_domain_notes (
  session_id uuid not null references sessions(id) on delete cascade,
  domain     text not null check (domain in (
               'information_and_ideas', 'craft_and_structure',
               'expression_of_ideas',   'standard_english_conventions')),
  strengths  text,
  gaps       text,
  updated_at timestamptz not null default now(),
  primary key (session_id, domain)
);

comment on table session_domain_notes is
  'The Strengths observed / Gaps observed columns of the teacher evaluation grid, one row per domain.';

-- ------------------------------------------------ overall diagnostic summary --
create type report_status as enum ('draft', 'published');

create table session_reports (
  session_id        uuid primary key references sessions(id) on delete cascade,
  status            report_status not null default 'draft',
  -- Time management and accuracy are computed from the answers; these two are
  -- the teacher's words about them, not a second copy of the numbers.
  time_management   text,
  engagement        text,
  -- Computed weakest domain unless the teacher overrides it here.
  practice_priority text check (practice_priority is null or practice_priority in (
                      'information_and_ideas', 'craft_and_structure',
                      'expression_of_ideas',   'standard_english_conventions')),
  summary           text,
  published_at      timestamptz,
  updated_at        timestamptz not null default now()
);

create trigger session_reports_touch before update on session_reports
  for each row execute function public.touch_updated_at();
create trigger session_domain_notes_touch before update on session_domain_notes
  for each row execute function public.touch_updated_at();

-- ------------------------------------------------------------------ RLS ----
alter table session_transcripts   enable row level security;
alter table session_domain_notes  enable row level security;
alter table session_reports       enable row level security;

-- The transcript is staff-only in every direction. It is a recording of two
-- people talking, and half of it is the teacher's assessment out loud.
create policy transcripts_teacher on session_transcripts for all
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()))
  with check (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()));

create policy domain_notes_teacher on session_domain_notes for all
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()))
  with check (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()));

create policy reports_teacher on session_reports for all
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()))
  with check (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()));

-- A student sees their own report only once it is published — a draft is the
-- teacher's working copy, and half-written gaps are not something to hand over.
create policy reports_student_read on session_reports for select
  using (status = 'published'
         and exists (select 1 from sessions s
                      where s.id = session_id and s.student_id = auth.uid()));

create policy domain_notes_student_read on session_domain_notes for select
  using (exists (select 1 from session_reports r
                  join sessions s on s.id = r.session_id
                 where r.session_id = session_domain_notes.session_id
                   and r.status = 'published' and s.student_id = auth.uid()));

-- --------------------------------------------------------------- the flow --
-- Publishing is a state change with a timestamp, not a column the client sets,
-- so "when did the parent get this" is answerable later.
create or replace function public.publish_report(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);

  insert into session_reports (session_id, status, published_at)
  values (p_session, 'published', now())
  on conflict (session_id) do update
    set status = 'published', published_at = now();
end $$;

create or replace function public.unpublish_report(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
  update session_reports set status = 'draft', published_at = null where session_id = p_session;
end $$;

revoke execute on function public.publish_report(uuid)   from anon;
revoke execute on function public.unpublish_report(uuid) from anon;
