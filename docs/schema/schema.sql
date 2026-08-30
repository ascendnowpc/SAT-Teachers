-- ============================================================================
--  SAT Teachers — proposed schema  (DESIGN DOCUMENT, not yet applied)
--  Postgres 15 / Supabase.  RLS policies live in ./rls.sql
-- ============================================================================

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------- enums ----
create type user_role         as enum ('admin','teacher','student','parent');
create type difficulty_level  as enum ('easy','medium','hard');
create type render_mode       as enum ('image','structured');
create type response_type     as enum ('mcq','spr');
create type question_status   as enum ('draft','needs_key','published','retired');
create type session_status    as enum ('scheduled','live','completed','cancelled');
create type item_status       as enum ('staged','published','answered','revealed','discussed','voided');
create type answer_option     as enum ('A','B','C','D');
create type grade_result      as enum ('correct','incorrect');
create type report_status     as enum ('draft','in_review','published');
create type claim_author      as enum ('ai','teacher');
create type transcript_source as enum ('zoom_vtt','manual_paste','otter','other');
create type speaker_role      as enum ('teacher','student','other','unmapped');

-- ------------------------------------------------------------- tenancy ----
create table organizations (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  slug        text not null unique,
  created_at  timestamptz not null default now()
);

create table profiles (
  id              uuid primary key references auth.users(id) on delete cascade,
  organization_id uuid not null references organizations(id),
  role            user_role not null,
  full_name       text not null,
  email           text,
  timezone        text not null default 'Asia/Singapore',
  is_active       boolean not null default true,
  created_at      timestamptz not null default now()
);
create index on profiles (organization_id, role);

-- student <-> teacher
create table enrolments (
  id              uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id),
  student_id      uuid not null references profiles(id) on delete cascade,
  teacher_id      uuid not null references profiles(id) on delete cascade,
  subject_id      uuid,                       -- fk added after subjects
  started_on      date not null default current_date,
  ended_on        date,
  unique (student_id, teacher_id, subject_id)
);

-- parent <-> student; gates report visibility
create table guardian_links (
  id           uuid primary key default gen_random_uuid(),
  guardian_id  uuid not null references profiles(id) on delete cascade,
  student_id   uuid not null references profiles(id) on delete cascade,
  relationship text,
  unique (guardian_id, student_id)
);

-- ------------------------------------------------------------ taxonomy ----
create table subjects (
  id    uuid primary key default gen_random_uuid(),
  code  text not null unique,                 -- 'english' | 'math'
  name  text not null,
  sort_order int not null default 0
);
alter table enrolments
  add constraint enrolments_subject_fk foreign key (subject_id) references subjects(id);

create table domains (
  id         uuid primary key default gen_random_uuid(),
  subject_id uuid not null references subjects(id) on delete cascade,
  code       text not null,                   -- 'information_and_ideas'
  name       text not null,                   -- 'Information and Ideas'
  sort_order int not null default 0,
  unique (subject_id, code)
);

create table skills (
  id         uuid primary key default gen_random_uuid(),
  domain_id  uuid not null references domains(id) on delete cascade,
  code       text not null,                   -- 'words_in_context'
  name       text not null,
  sort_order int not null default 0,
  unique (domain_id, code)
);

-- -------------------------------------------------------------- content ----
create table questions (
  id                    uuid primary key default gen_random_uuid(),
  organization_id       uuid not null references organizations(id),
  subject_id            uuid not null references subjects(id),
  domain_id             uuid not null references domains(id),
  skill_id              uuid not null references skills(id),

  render_mode           render_mode   not null default 'image',
  response_type         response_type not null default 'mcq',

  -- structured mode only (see docs/02-domain-model.md for the block schema)
  stimulus              jsonb,
  stem                  text,

  difficulty            difficulty_level not null,
  difficulty_rationale  text,                 -- WHY it is that level

  target_seconds        integer,              -- expected working time; speed is assessed
  observed_p_value      numeric(4,3),         -- rolling % correct   (nightly job)
  observed_median_secs  integer,              -- rolling median time (nightly job)
  attempt_count         integer not null default 0,

  source_ref            text,                 -- 'English Diagnostic Test 3 · M1 · Q23'
  status                question_status not null default 'needs_key',
  created_by            uuid references profiles(id),
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now(),

  -- a structured question must carry its own text; an image one must not need to
  constraint structured_needs_text
    check (render_mode <> 'structured' or (stem is not null and stimulus is not null))
);
create index on questions (organization_id, subject_id, skill_id, difficulty, status);
create index on questions (status) where status = 'needs_key';

create table question_assets (
  id           uuid primary key default gen_random_uuid(),
  question_id  uuid not null references questions(id) on delete cascade,
  kind         text not null,                 -- 'full_screenshot' | 'stimulus' | 'figure'
  storage_path text not null,                 -- Supabase Storage
  width        integer,
  height       integer,
  alt_text     text,
  sort_order   int not null default 0
);

create table question_options (
  id           uuid primary key default gen_random_uuid(),
  question_id  uuid not null references questions(id) on delete cascade,
  label        answer_option not null,
  body         text,                          -- null in image mode
  sort_order   int not null default 0,
  unique (question_id, label)
);

-- SEPARATE TABLE ON PURPOSE: RLS is row-level, so anything a student must not
-- see cannot live as a column on a row they can read.  Teachers/admins only.
create table question_keys (
  question_id       uuid primary key references questions(id) on delete cascade,
  correct_option    answer_option,            -- null when response_type = 'spr'
  spr_accepted      text[],                   -- accepted grid-in answers
  explanation       text,                     -- why the correct answer is correct
  option_rationales jsonb,                    -- { "A": "why A is wrong", ... }
  updated_by        uuid references profiles(id),
  updated_at        timestamptz not null default now(),
  constraint key_shape check (correct_option is not null or spr_accepted is not null)
);

-- ------------------------------------------------------------- sessions ----
create table sessions (
  id               uuid primary key default gen_random_uuid(),
  organization_id  uuid not null references organizations(id),
  teacher_id       uuid not null references profiles(id),
  subject_id       uuid not null references subjects(id),
  title            text,
  scheduled_start  timestamptz not null,
  duration_minutes integer not null default 60,
  meeting_url      text,                      -- pasted Zoom link; no Zoom API in v1
  status           session_status not null default 'scheduled',
  started_at       timestamptz,               -- wall-clock anchor for transcript alignment
  ended_at         timestamptz,
  teacher_notes    text,
  created_at       timestamptz not null default now()
);
create index on sessions (teacher_id, scheduled_start desc);
create index on sessions (organization_id, status);

create table session_participants (
  session_id uuid not null references sessions(id) on delete cascade,
  student_id uuid not null references profiles(id),
  joined_at  timestamptz,
  left_at    timestamptz,
  primary key (session_id, student_id)
);

-- ============================ THE SPINE =====================================
-- One row per question put in front of a student.  Everything the report can
-- claim derives from this table (or a transcript segment aligned to it).
create table session_items (
  id                 uuid primary key default gen_random_uuid(),
  session_id         uuid not null references sessions(id) on delete cascade,
  question_id        uuid not null references questions(id),
  student_id         uuid not null references profiles(id),
  sequence_no        integer not null,
  status             item_status not null default 'staged',

  -- timeline: drives pace metrics AND transcript alignment windows
  published_at       timestamptz,
  first_viewed_at    timestamptz,
  answered_at        timestamptz,
  revealed_at        timestamptz,
  discussed_at       timestamptz,
  disconnected_ms    integer not null default 0,   -- excluded from elapsed time

  -- what the student did
  selected_option    answer_option,
  spr_response       text,
  eliminated_options answer_option[] not null default '{}',  -- in strike order
  student_confidence smallint check (student_confidence between 1 and 3),
  student_reasoning  text,                      -- "why did you choose this?"
  student_summary    text,                      -- passage summary, when requested
  ask_for_summary    boolean not null default false,

  -- what the student is allowed to know, and only after reveal
  revealed_result    grade_result,

  teacher_note       text,
  voided_reason      text,
  created_at         timestamptz not null default now(),

  unique (session_id, sequence_no),
  constraint answered_has_response check (
    status not in ('answered','revealed','discussed')
    or selected_option is not null or spr_response is not null
  )
);
create index on session_items (session_id, sequence_no);
create index on session_items (student_id, answered_at desc);
create index on session_items (question_id);

-- Correctness before reveal.  Separate table for the same reason as
-- question_keys: Realtime pushes whole rows, so this cannot be a column above.
create table session_item_grades (
  session_item_id uuid primary key references session_items(id) on delete cascade,
  is_correct      boolean not null,
  graded_at       timestamptz not null default now(),
  elapsed_seconds integer
);

-- Teacher's one-tap read on WHY the answer went the way it did.
-- Lookup table, not an enum, so the vocabulary can be tuned without a migration.
create table diagnosis_tags (
  id              uuid primary key default gen_random_uuid(),
  organization_id uuid not null references organizations(id),
  code            text not null,       -- solid_reasoning, lucky_guess, careless_error,
  label           text not null,       -- concept_gap, misread_question, ran_out_of_time
  applies_to      text not null default 'both',   -- 'correct' | 'incorrect' | 'both'
  sort_order      int not null default 0,
  is_active       boolean not null default true,
  unique (organization_id, code)
);

create table session_item_diagnoses (
  session_item_id  uuid not null references session_items(id) on delete cascade,
  diagnosis_tag_id uuid not null references diagnosis_tags(id),
  tagged_by        uuid not null references profiles(id),
  tagged_at        timestamptz not null default now(),
  primary key (session_item_id, diagnosis_tag_id)
);

-- ----------------------------------------------------------- transcripts ----
create table transcripts (
  id                    uuid primary key default gen_random_uuid(),
  session_id            uuid not null references sessions(id) on delete cascade,
  source                transcript_source not null,
  storage_path          text,
  raw_text              text,
  recording_started_at  timestamptz,           -- anchor for relative -> wall clock
  clock_offset_ms       integer not null default 0,  -- teacher-nudgeable drift fix
  processed_at          timestamptz,
  uploaded_by           uuid references profiles(id),
  created_at            timestamptz not null default now()
);

create table transcript_segments (
  id              uuid primary key default gen_random_uuid(),
  transcript_id   uuid not null references transcripts(id) on delete cascade,
  seq             integer not null,
  speaker_label   text,                        -- raw name from the VTT
  speaker_role    speaker_role not null default 'unmapped',
  start_ms        integer,
  end_ms          integer,
  text            text not null,
  -- alignment result
  session_item_id uuid references session_items(id),
  align_confidence numeric(3,2),
  unique (transcript_id, seq)
);
create index on transcript_segments (session_item_id);
create index on transcript_segments (transcript_id, start_ms);

-- --------------------------------------------------------------- reports ----
create table reports (
  id            uuid primary key default gen_random_uuid(),
  session_id    uuid references sessions(id) on delete cascade,
  student_id    uuid not null references profiles(id),
  period_start  date,      -- set instead of session_id for programme reports
  period_end    date,
  status        report_status not null default 'draft',
  generated_at  timestamptz,
  published_at  timestamptz,
  published_by  uuid references profiles(id),
  model_version text,
  has_transcript boolean not null default false,
  metrics       jsonb,     -- Tier 1 computed facts; narrative numbers substitute from here
  created_at    timestamptz not null default now()
);
create index on reports (student_id, published_at desc);

create table report_sections (
  id         uuid primary key default gen_random_uuid(),
  report_id  uuid not null references reports(id) on delete cascade,
  code       text not null,   -- overview | speed | method | domain_breakdown |
  title      text not null,   -- strengths | gaps | progress | next_steps
  body       text,
  sort_order int not null default 0,
  unique (report_id, code)
);

create table report_claims (
  id           uuid primary key default gen_random_uuid(),
  section_id   uuid not null references report_sections(id) on delete cascade,
  text         text not null,
  claim_type   text,          -- strength | gap | observation | recommendation
  skill_id     uuid references skills(id),
  authored_by  claim_author not null default 'ai',
  edited_at    timestamptz,
  sort_order   int not null default 0
);

-- The evidence chain, made physical.
create table report_claim_evidence (
  id                    uuid primary key default gen_random_uuid(),
  claim_id              uuid not null references report_claims(id) on delete cascade,
  session_item_id       uuid references session_items(id),
  transcript_segment_id uuid references transcript_segments(id),
  quote                 text,   -- must match the segment text verbatim
  constraint one_evidence_kind check (
    (session_item_id is not null)::int + (transcript_segment_id is not null)::int = 1
  )
);
create index on report_claim_evidence (claim_id);

-- A claim may not be published without evidence.  Enforced here so it cannot be
-- skipped by a future code path.
create or replace function assert_report_evidence() returns trigger
language plpgsql as $$
begin
  if new.status = 'published' and (old.status is distinct from 'published') then
    if exists (
      select 1
      from report_claims c
      join report_sections s on s.id = c.section_id
      left join report_claim_evidence e on e.claim_id = c.id
      where s.report_id = new.id
      group by c.id
      having count(e.id) = 0
    ) then
      raise exception 'cannot publish report %: every claim requires at least one evidence row', new.id;
    end if;
  end if;
  return new;
end $$;

create trigger reports_require_evidence
  before update on reports
  for each row execute function assert_report_evidence();

-- --------------------------------------------------------------- realtime ---
-- alter publication supabase_realtime add table session_items, session_item_grades;
