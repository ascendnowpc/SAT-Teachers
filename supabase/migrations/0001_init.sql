-- ============================================================================
--  0001 — auth, roles, and the text MCQ bank
--
--  Scope: direct signup for teachers and students, and teacher-authored
--  multiple-choice questions with a difficulty level.  Image-backed questions
--  and the PDF import pipeline are deliberately not here yet; see docs/.
-- ============================================================================

create type user_role        as enum ('admin','teacher','student');
create type difficulty_level as enum ('easy','medium','hard');
create type answer_option    as enum ('A','B','C','D');
create type question_status  as enum ('draft','published','retired');

-- ------------------------------------------------------------- profiles ----
-- Readable per-role identifiers: TCH-0001, STU-0001.
create sequence teacher_code_seq start 1;
create sequence student_code_seq start 1;

create table profiles (
  id         uuid primary key references auth.users(id) on delete cascade,
  role       user_role not null default 'student',
  display_id text not null unique,
  full_name  text not null default '',
  email      text,
  is_active  boolean not null default true,
  created_at timestamptz not null default now()
);
create index profiles_role_idx on profiles (role);

-- Signup writes role + full_name into user metadata; this promotes them into a
-- profile row.  The role is coerced to teacher|student here rather than trusted
-- from the client, so a crafted signup payload cannot mint an admin.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  requested text := coalesce(new.raw_user_meta_data->>'role', 'student');
  resolved  user_role;
  code      text;
begin
  resolved := case when requested = 'teacher' then 'teacher'::user_role
                   else 'student'::user_role end;

  code := case resolved
            when 'teacher' then 'TCH-' || lpad(nextval('teacher_code_seq')::text, 4, '0')
            else                'STU-' || lpad(nextval('student_code_seq')::text, 4, '0')
          end;

  insert into public.profiles (id, role, display_id, full_name, email)
  values (
    new.id,
    resolved,
    code,
    coalesce(new.raw_user_meta_data->>'full_name', ''),
    new.email
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Used by the question policies below.  security definer so it can read
-- profiles without tripping that table's own RLS.
create or replace function public.is_teacher()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from profiles
    where id = auth.uid() and role in ('teacher','admin') and is_active
  );
$$;

-- ------------------------------------------------------------ questions ----
create table questions (
  id                   uuid primary key default gen_random_uuid(),
  created_by           uuid not null references profiles(id),
  subject              text not null default 'english'
                         check (subject in ('english','math')),
  domain               text
                         check (domain is null or domain in (
                           'information_and_ideas',
                           'craft_and_structure',
                           'expression_of_ideas',
                           'standard_english_conventions',
                           'algebra',
                           'advanced_math',
                           'problem_solving_and_data_analysis',
                           'geometry_and_trigonometry'
                         )),
  passage              text,             -- optional stimulus the question is about
  stem                 text not null,    -- the question itself
  difficulty           difficulty_level not null,
  difficulty_rationale text,             -- why it sits at that level
  status               question_status not null default 'published',
  created_at           timestamptz not null default now(),
  updated_at           timestamptz not null default now()
);
create index questions_bank_idx on questions (subject, domain, difficulty, status);
create index questions_author_idx on questions (created_by, created_at desc);

create table question_options (
  id          uuid primary key default gen_random_uuid(),
  question_id uuid not null references questions(id) on delete cascade,
  label       answer_option not null,
  body        text not null,
  unique (question_id, label)
);
create index question_options_q_idx on question_options (question_id);

-- SEPARATE TABLE ON PURPOSE.  Postgres RLS is row-level, so a policy cannot
-- hide one column of a row it grants — and Realtime pushes whole rows.  Keeping
-- the answer here means there is no student-readable row to leak it from once
-- students start seeing questions in sessions.
create table question_keys (
  question_id    uuid primary key references questions(id) on delete cascade,
  correct_option answer_option not null,
  explanation    text,
  updated_at     timestamptz not null default now()
);

create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at := now(); return new; end;
$$;

create trigger questions_touch before update on questions
  for each row execute function public.touch_updated_at();

-- ------------------------------------------------------------------ RLS ----
alter table profiles         enable row level security;
alter table questions        enable row level security;
alter table question_options enable row level security;
alter table question_keys    enable row level security;

create policy profiles_read_own on profiles
  for select using (id = auth.uid());
create policy profiles_update_own on profiles
  for update using (id = auth.uid())
  with check (id = auth.uid() and role = (select role from profiles p where p.id = auth.uid()));

-- Teachers share one bank: everyone on staff can read it, only the author edits.
create policy questions_teacher_read on questions
  for select using (is_teacher());
create policy questions_author_write on questions
  for all using (is_teacher() and created_by = auth.uid())
  with check (is_teacher() and created_by = auth.uid());

create policy options_teacher_read on question_options
  for select using (is_teacher());
create policy options_author_write on question_options
  for all using (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by = auth.uid())
  ) with check (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by = auth.uid())
  );

-- Answer keys: staff only.  No student policy exists, so no student row exists.
create policy keys_teacher_read on question_keys
  for select using (is_teacher());
create policy keys_author_write on question_keys
  for all using (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by = auth.uid())
  ) with check (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by = auth.uid())
  );
