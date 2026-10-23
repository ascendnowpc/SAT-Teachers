-- ============================================================================
--  0061 — a test on one skill
--
--  The question a PC asks, and a parent through them, is whether the teaching
--  is working: the student was weak on transitions in September — are they
--  still? The diagnostic answers the first half. This is the second: a short
--  set on one skill (or one section), sat alone on the link against a clock,
--  whenever the teacher decides it is time. Its score set against the
--  diagnostic's on the same skill, and against the test before, is the line
--  the PC reads.
--
--  The teacher decides everything here. Nothing books a test on its own and
--  nothing requires one; the platform computes what the answers say and the
--  teacher says what it means.
--
--  What this adds:
--
--    targeted_tests       one row per targeted session: the skill, the size the
--                         teacher asked for, the clocks, whether repeats are
--                         allowed, and when the student started (after which
--                         the set is fixed).
--    targeted_set_items   the set, in order. Teacher and admin only — it is the
--                         questions the student has not seen yet, and nobody
--                         else reads ahead. A question reaches the student as
--                         a session_items row when it is shown, exactly as in
--                         a lesson (0057), so the student-facing rules are the
--                         ones that already hold.
--    session_items.time_limit_seconds
--                         the clock a targeted question was shown with, fixed
--                         when it is shown, so a later edit to the question's
--                         target cannot rewrite a test already sat.
--    session_item_assessments.timed_out
--                         the clock ran out on it. Teacher-side, like the rest
--                         of the grading.
--    progress_config      per subject: how a raw score maps to a level score,
--                         where Improved and Declined start, what counts as a
--                         long question, the default set size, and how sure the
--                         "struggles on long questions" flag has to be. Read by
--                         staff and PCs, who compute from it; changed by an
--                         admin, through set_progress_config.
--    skill_notes          the teacher's private note on a student and a skill.
--                         Staff only — a PC never reads it.
--    skill_summaries      the summary the PC is given, kept as a draft and a
--                         shared copy. Sharing copies the draft across.
--    verdict_overrides    the teacher's wording for the step up to a targeted
--                         test, with the earlier point it was written against,
--                         so a changed pair shows as out of date. Draft and
--                         shared copies, as above.
--
--  The last two are separate from the first on purpose. RLS is row-level: a
--  policy cannot hide one column of a row it grants (0001). The private note
--  is therefore its own table, and the PC has no policy on any of the three —
--  they read the shared copies through student_progress (0063), which returns
--  those and nothing else, so a draft cannot reach them through its row.
--
--  Nothing here stores a score. Every figure is computed on read from the
--  answers and the config, the rule the report has kept since 0013.
-- ============================================================================

-- ------------------------------------------------------------ the test ----
create table if not exists targeted_tests (
  session_id       uuid primary key references sessions(id) on delete cascade,
  subject          text not null check (subject in ('english', 'mathematics')),
  section          text not null,
  skill            text,
  set_size         int  not null check (set_size between 1 and 20),
  question_seconds int  check (question_seconds is null or question_seconds between 10 and 900),
  overall_seconds  int  not null check (overall_seconds between 60 and 10800),
  allow_repeats    boolean not null default false,
  locked_at        timestamptz,
  created_by       uuid references profiles(id) on delete set null,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now()
);

comment on table targeted_tests is
  'One row per targeted session (0061): the skill, the size asked for, the clocks, and whether repeats were allowed.';
comment on column targeted_tests.skill is
  'Null for a test on the whole section.';
comment on column targeted_tests.set_size is
  'The size the teacher asked for. The set itself may be shorter when the bank could not fill it; the difference is the shortfall the report names.';
comment on column targeted_tests.question_seconds is
  'One clock for every question. Null: each question''s own target_seconds.';
comment on column targeted_tests.locked_at is
  'When the student pressed Start. The set cannot change after it.';

create table if not exists targeted_set_items (
  session_id  uuid not null references targeted_tests(session_id) on delete cascade,
  position    int  not null check (position >= 1),
  question_id uuid not null references questions(id),
  primary key (session_id, position),
  unique (session_id, question_id)
);

comment on table targeted_set_items is
  'A targeted test''s set, in the order it is sat. Teacher and admin only: it is what the student has not seen yet.';

alter table session_items add column if not exists time_limit_seconds int
  check (time_limit_seconds is null or time_limit_seconds between 10 and 900);

comment on column session_items.time_limit_seconds is
  'A targeted question''s clock, fixed when it is shown (0061). Null in a lesson.';

alter table session_item_assessments add column if not exists timed_out boolean not null default false;

comment on column session_item_assessments.timed_out is
  'The clock ran out before an answer: recorded as wrong, with no option chosen (0061).';

-- ---------------------------------------------------------------- config ---
create table if not exists progress_config (
  subject          text primary key check (subject in ('english', 'mathematics')),
  score_points     jsonb   not null,
  improved_at      numeric not null default 5,
  declined_at      numeric not null default -5,
  long_words       int     not null check (long_words between 1 and 1000),
  default_set_size int     not null default 5 check (default_set_size between 1 and 20),
  pattern_min_each int     not null default 4 check (pattern_min_each between 1 and 100),
  pattern_gap      numeric not null default 0.4 check (pattern_gap > 0 and pattern_gap <= 1),
  updated_by       uuid references profiles(id) on delete set null,
  updated_at       timestamptz not null default now(),
  check (improved_at > 0 and declined_at < 0)
);

comment on table progress_config is
  'How targeted tests are read, per subject (0061). Changed by an admin only.';
comment on column progress_config.score_points is
  'Raw score out of 10 → level score, as [[raw, level], …] with raw rising. Linear between points; above the last, the last segment''s slope carries on.';
comment on column progress_config.long_words is
  'A question whose passage and stem together reach this many words is long.';
comment on column progress_config.pattern_gap is
  'How far apart short- and long-question accuracy must be (0.4 = 40 points) before the "struggles on long questions" flag shows.';

insert into progress_config (subject, score_points, long_words)
values ('english',     '[[0,20],[5,30],[8,40]]', 75),
       ('mathematics', '[[0,20],[5,30],[8,40]]', 40)
on conflict (subject) do nothing;

-- ----------------------------------------------------------------- notes ---
-- The skill is '' for a note on the whole section: a key cannot be null.
create table if not exists skill_notes (
  student_id uuid not null references profiles(id) on delete cascade,
  subject    text not null check (subject in ('english', 'mathematics')),
  section    text not null,
  skill      text not null default '',
  body       text not null default '',
  updated_by uuid references profiles(id) on delete set null,
  updated_at timestamptz not null default now(),
  primary key (student_id, subject, section, skill)
);

comment on table skill_notes is
  'The teacher''s private note on a student and a skill: mindset, effort, strategy. Staff only — never the PC (0061).';

create table if not exists skill_summaries (
  student_id uuid not null references profiles(id) on delete cascade,
  subject    text not null check (subject in ('english', 'mathematics')),
  section    text not null,
  skill      text not null default '',
  draft      text not null default '',
  shared     text,
  shared_at  timestamptz,
  shared_by  uuid references profiles(id) on delete set null,
  updated_by uuid references profiles(id) on delete set null,
  updated_at timestamptz not null default now(),
  primary key (student_id, subject, section, skill)
);

comment on table skill_summaries is
  'The summary the PC is given on a student and a skill. The draft is the teacher''s; the shared copy is what the PC reads, through student_progress (0063).';

create table if not exists verdict_overrides (
  session_id          uuid primary key references sessions(id) on delete cascade,
  previous_session_id uuid references sessions(id) on delete set null,
  draft_wording       text not null default '',
  draft_context       text not null default '',
  shared_wording      text,
  shared_context      text,
  shared_at           timestamptz,
  shared_by           uuid references profiles(id) on delete set null,
  updated_by          uuid references profiles(id) on delete set null,
  updated_at          timestamptz not null default now()
);

comment on table verdict_overrides is
  'The teacher''s wording for the step up to a targeted test (session_id) from the point before it (previous_session_id). The computed verdict is always shown under it (0061).';

-- ------------------------------------------------------------------- RLS ---
alter table targeted_tests     enable row level security;
alter table targeted_set_items enable row level security;
alter table progress_config    enable row level security;
alter table skill_notes        enable row level security;
alter table skill_summaries    enable row level security;
alter table verdict_overrides  enable row level security;

-- Reads only. Every write goes through the RPCs below, which check what a
-- policy cannot (the set against the bank, the student's history).
drop policy if exists targeted_tests_staff_read on targeted_tests;
create policy targeted_tests_staff_read on targeted_tests for select
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = (select auth.uid()))
         or (select is_admin()));

-- The PC reads what the test was on and how it was clocked — not its set.
drop policy if exists targeted_tests_pc_read on targeted_tests;
create policy targeted_tests_pc_read on targeted_tests for select
  using ((select is_pc()) and pc_has_session(session_id));

drop policy if exists targeted_set_items_staff_read on targeted_set_items;
create policy targeted_set_items_staff_read on targeted_set_items for select
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = (select auth.uid()))
         or (select is_admin()));

drop policy if exists progress_config_read on progress_config;
create policy progress_config_read on progress_config for select
  using ((select is_teacher()) or (select is_pc()));

-- Staff: any teacher reads the whole roster (0005), and a student's progress
-- is read across their teachers (0063), so the notes on them are too.
drop policy if exists skill_notes_staff_read on skill_notes;
create policy skill_notes_staff_read on skill_notes for select
  using ((select is_teacher()));

drop policy if exists skill_summaries_staff_read on skill_summaries;
create policy skill_summaries_staff_read on skill_summaries for select
  using ((select is_teacher()));

drop policy if exists verdict_overrides_staff_read on verdict_overrides;
create policy verdict_overrides_staff_read on verdict_overrides for select
  using ((select is_teacher()));

-- ============================================================================
--  The set
-- ============================================================================

-- Internal. Is this question one a targeted test on this subject, section and
-- skill may ask? In one of the subject's three tests or its pool, published,
-- and on the skill.
create or replace function public.targeted_question_fits(
  p_question uuid, p_subject text, p_section text, p_skill text
) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (
    select 1
      from questions q
      join question_set_items qi on qi.question_id = q.id
      join question_sets qs      on qs.id = qi.set_id
     where q.id = p_question
       and q.status = 'published'
       and q.section = p_section
       and (p_skill is null or q.skill = p_skill)
       and qs.subject = p_subject
       and qs.is_active
       and (qs.level is not null or qs.kind = 'practice'));
$$;

revoke execute on function public.targeted_question_fits(uuid, text, text, text) from public, anon, authenticated;

-- Internal. Every question ever put in front of the student, in any session,
-- by any teacher — set aside included, because they read it.
create or replace function public.student_has_seen(p_student uuid, p_question uuid)
returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from session_items
                  where student_id = p_student and question_id = p_question and status <> 'staged');
$$;

revoke execute on function public.student_has_seen(uuid, uuid) from public, anon, authenticated;

-- Internal. Replaces the set wholesale, after checking every question in it.
create or replace function public.write_targeted_set(
  p_session       uuid,
  p_questions     uuid[],
  p_allow_repeats boolean
) returns int
language plpgsql security definer set search_path = public as $$
declare
  t         targeted_tests;
  v_student uuid;
  v_q       uuid;
  v_n       int := coalesce(array_length(p_questions, 1), 0);
begin
  select * into t from targeted_tests where session_id = p_session;
  select student_id into v_student from sessions where id = p_session;

  if v_n = 0 then raise exception 'a targeted test needs at least one question'; end if;
  if v_n > 20 then raise exception 'a targeted test is at most 20 questions'; end if;
  if array_position(p_questions, null) is not null then
    raise exception 'a question in the set is missing';
  end if;
  if (select count(distinct q) from unnest(p_questions) q) <> v_n then
    raise exception 'a question is in the set twice';
  end if;

  foreach v_q in array p_questions loop
    if not targeted_question_fits(v_q, t.subject, t.section, t.skill) then
      raise exception 'a question in the set is not on this % — or is in none of this subject''s tests',
        case when t.skill is null then 'section' else 'skill' end;
    end if;
    if not coalesce(p_allow_repeats, false) and student_has_seen(v_student, v_q) then
      raise exception 'the student has already seen a question in the set — allow repeats to keep it';
    end if;
  end loop;

  delete from targeted_set_items where session_id = p_session;
  insert into targeted_set_items (session_id, position, question_id)
  select p_session, o.n, o.q from unnest(p_questions) with ordinality o(q, n);

  update targeted_tests
     set allow_repeats = coalesce(p_allow_repeats, false),
         updated_at    = now()
   where session_id = p_session;

  return v_n;
end $$;

revoke execute on function public.write_targeted_set(uuid, uuid[], boolean) from public, anon, authenticated;

comment on function public.write_targeted_set(uuid, uuid[], boolean) is
  'Replaces a targeted test''s set after checking every question: on the skill, in the subject''s tests or pool, published, no duplicates, and not seen before unless repeats are allowed (0061). Internal.';

-- ----------------------------------------------------------- candidates ---
-- What the set builder chooses from. Staff only: whether the student has seen
-- a question looks across every teacher's sessions, which RLS shows a teacher
-- only their own of. Ids and labels — the builder reads the questions
-- themselves from the bank, which a teacher reads anyway.
create or replace function public.targeted_candidates(
  p_student uuid, p_subject text, p_section text, p_skill text
) returns table (
  question_id uuid,
  difficulty  difficulty_level,
  source      text,
  set_level    text,
  set_position int,
  seen         boolean
)
language plpgsql stable security definer set search_path = public as $$
begin
  if not is_teacher() then raise exception 'only staff can build a targeted test'; end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;

  return query
    select distinct on (q.id)
           q.id, q.difficulty,
           case when qs.kind = 'practice' then 'practice' else 'test' end,
           qs.level, qi.position,
           student_has_seen(p_student, q.id)
      from questions q
      join question_set_items qi on qi.question_id = q.id
      join question_sets qs      on qs.id = qi.set_id
     where q.status = 'published'
       and q.section = p_section
       and (p_skill is null or q.skill = p_skill)
       and qs.subject = p_subject
       and qs.is_active
       and (qs.level is not null or qs.kind = 'practice')
     order by q.id, (qs.kind = 'practice'), qi.position;
end $$;

revoke execute on function public.targeted_candidates(uuid, text, text, text) from public, anon, authenticated;
grant  execute on function public.targeted_candidates(uuid, text, text, text) to authenticated;

comment on function public.targeted_candidates(uuid, text, text, text) is
  'Every question a targeted test on this skill could ask — from the three tests and the pool — and whether the student has seen it in any session. Staff only (0061).';

-- --------------------------------------------------------------- booking ---
create or replace function public.create_targeted_session(
  p_student          uuid,
  p_subject          text,
  p_section          text,
  p_skill            text,
  p_scheduled_at     timestamptz,
  p_title            text,
  p_size             int,
  p_questions        uuid[],
  p_allow_repeats    boolean,
  p_question_seconds int,
  p_overall_seconds  int
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_session uuid;
begin
  if not is_teacher() then raise exception 'only a teacher or an admin can book a targeted test'; end if;

  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  -- The rule sessions_need_a_pc keeps for a client's insert (0056). This one is
  -- made inside a security definer function, which that trigger lets through.
  if not student_has_pc(p_student) then
    raise exception 'this student has no PC yet — choose their PC before booking the session';
  end if;
  if p_scheduled_at is null then raise exception 'a targeted test needs a time'; end if;

  insert into sessions (teacher_id, student_id, subject, title, scheduled_at, duration_mins, mode)
  values (auth.uid(), p_student, p_subject, nullif(btrim(p_title), ''), p_scheduled_at,
          least(480, greatest(5, ceil(coalesce(p_overall_seconds, 0) / 60.0)::int)),
          'targeted')
  returning id into v_session;

  insert into targeted_tests (session_id, subject, section, skill, set_size,
                              question_seconds, overall_seconds, allow_repeats, created_by)
  values (v_session, p_subject, p_section, nullif(btrim(p_skill), ''), p_size,
          p_question_seconds, p_overall_seconds, coalesce(p_allow_repeats, false), auth.uid());

  perform write_targeted_set(v_session, p_questions, p_allow_repeats);

  return v_session;
end $$;

revoke execute on function public.create_targeted_session(uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int)
  from public, anon, authenticated;
grant  execute on function public.create_targeted_session(uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int)
  to authenticated;

comment on function public.create_targeted_session(uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int) is
  'Books a targeted test with its set, in one transaction: the session, its settings and its questions, or none of them (0061). Teacher or admin.';

-- ----------------------------------------------------------- changing it --
create or replace function public.save_targeted_set(
  p_session          uuid,
  p_size             int,
  p_questions        uuid[],
  p_allow_repeats    boolean,
  p_question_seconds int,
  p_overall_seconds  int
) returns int
language plpgsql security definer set search_path = public as $$
declare
  v_mode   text;
  v_status session_status;
  v_locked timestamptz;
begin
  perform assert_session_teacher(p_session);

  select s.mode, s.status, t.locked_at into v_mode, v_status, v_locked
    from sessions s left join targeted_tests t on t.session_id = s.id
   where s.id = p_session;

  if v_mode <> 'targeted' then raise exception 'this session is not a targeted test'; end if;
  if v_locked is not null or v_status <> 'scheduled' then
    raise exception 'the student has started — the set cannot change now';
  end if;

  update targeted_tests
     set set_size         = p_size,
         question_seconds = p_question_seconds,
         overall_seconds  = p_overall_seconds,
         updated_at       = now()
   where session_id = p_session;

  update sessions
     set duration_mins = least(480, greatest(5, ceil(p_overall_seconds / 60.0)::int))
   where id = p_session;

  return write_targeted_set(p_session, p_questions, p_allow_repeats);
end $$;

revoke execute on function public.save_targeted_set(uuid, int, uuid[], boolean, int, int) from public, anon, authenticated;
grant  execute on function public.save_targeted_set(uuid, int, uuid[], boolean, int, int) to authenticated;

comment on function public.save_targeted_set(uuid, int, uuid[], boolean, int, int) is
  'Swaps questions, resizes or re-clocks a targeted test before the student starts it. Every question is checked again (0061). The session''s teacher or an admin.';

-- ============================================================================
--  Config
-- ============================================================================

create or replace function public.set_progress_config(p_subject text, p_config jsonb)
returns void
language plpgsql security definer set search_path = public as $$
declare
  v_points jsonb := p_config->'score_points';
  v_prev   numeric := -1;
  v_pt     jsonb;
begin
  if not is_admin() then raise exception 'only an admin changes how progress is read'; end if;
  if p_subject not in ('english', 'mathematics') then raise exception 'no such subject'; end if;

  if jsonb_typeof(v_points) <> 'array' or jsonb_array_length(v_points) < 2 then
    raise exception 'the score mapping needs at least two points';
  end if;
  for v_pt in select * from jsonb_array_elements(v_points) loop
    if jsonb_typeof(v_pt) <> 'array' or jsonb_array_length(v_pt) <> 2
       or jsonb_typeof(v_pt->0) <> 'number' or jsonb_typeof(v_pt->1) <> 'number' then
      raise exception 'each point of the score mapping is [raw out of 10, level score]';
    end if;
    if (v_pt->>0)::numeric < 0 or (v_pt->>0)::numeric > 10 or (v_pt->>0)::numeric <= v_prev then
      raise exception 'the raw scores of the mapping run from 0 to 10, rising';
    end if;
    v_prev := (v_pt->>0)::numeric;
  end loop;

  update progress_config
     set score_points     = v_points,
         improved_at      = coalesce((p_config->>'improved_at')::numeric, improved_at),
         declined_at      = coalesce((p_config->>'declined_at')::numeric, declined_at),
         long_words       = coalesce((p_config->>'long_words')::int, long_words),
         default_set_size = coalesce((p_config->>'default_set_size')::int, default_set_size),
         pattern_min_each = coalesce((p_config->>'pattern_min_each')::int, pattern_min_each),
         pattern_gap      = coalesce((p_config->>'pattern_gap')::numeric, pattern_gap),
         updated_by       = auth.uid(),
         updated_at       = now()
   where subject = p_subject;
end $$;

revoke execute on function public.set_progress_config(text, jsonb) from public, anon, authenticated;
grant  execute on function public.set_progress_config(text, jsonb) to authenticated;

comment on function public.set_progress_config(text, jsonb) is
  'Changes how a subject''s targeted tests are read: the score mapping, the verdict thresholds, what is long, the default size and the pattern flag. Admin only (0061).';

-- ============================================================================
--  Notes, summaries and overrides
-- ============================================================================

-- Internal. Staff, writing about a student.
create or replace function public.assert_staff_on_student(p_student uuid, p_subject text)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_teacher() then raise exception 'only staff write about a student''s progress'; end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if p_subject not in ('english', 'mathematics') then raise exception 'no such subject'; end if;
end $$;

revoke execute on function public.assert_staff_on_student(uuid, text) from public, anon, authenticated;

create or replace function public.save_skill_note(
  p_student uuid, p_subject text, p_section text, p_skill text, p_body text
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_student(p_student, p_subject);
  insert into skill_notes (student_id, subject, section, skill, body, updated_by, updated_at)
  values (p_student, p_subject, p_section, coalesce(p_skill, ''), coalesce(p_body, ''), auth.uid(), now())
  on conflict (student_id, subject, section, skill) do update
    set body = excluded.body, updated_by = excluded.updated_by, updated_at = now();
end $$;

create or replace function public.save_skill_summary(
  p_student uuid, p_subject text, p_section text, p_skill text, p_draft text
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_student(p_student, p_subject);
  insert into skill_summaries (student_id, subject, section, skill, draft, updated_by, updated_at)
  values (p_student, p_subject, p_section, coalesce(p_skill, ''), coalesce(p_draft, ''), auth.uid(), now())
  on conflict (student_id, subject, section, skill) do update
    set draft = excluded.draft, updated_by = excluded.updated_by, updated_at = now();
end $$;

-- Share copies the draft across; unshare takes the shared copy back.
create or replace function public.share_skill_summary(
  p_student uuid, p_subject text, p_section text, p_skill text, p_share boolean
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_student(p_student, p_subject);
  update skill_summaries
     set shared    = case when p_share then draft end,
         shared_at = case when p_share then now() end,
         shared_by = case when p_share then auth.uid() end
   where student_id = p_student and subject = p_subject
     and section = p_section and skill = coalesce(p_skill, '');
  if not found then raise exception 'there is no summary to share yet'; end if;
  if p_share and exists (select 1 from skill_summaries
                          where student_id = p_student and subject = p_subject
                            and section = p_section and skill = coalesce(p_skill, '')
                            and btrim(draft) = '') then
    raise exception 'the summary is empty';
  end if;
end $$;

-- Internal. Staff, and a targeted test.
create or replace function public.assert_staff_on_targeted(p_session uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_teacher() then raise exception 'only staff write about a student''s progress'; end if;
  if not exists (select 1 from sessions where id = p_session and mode = 'targeted') then
    raise exception 'a verdict is written on a targeted test';
  end if;
end $$;

revoke execute on function public.assert_staff_on_targeted(uuid) from public, anon, authenticated;

create or replace function public.save_verdict_override(
  p_session uuid, p_previous uuid, p_wording text, p_context text
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_targeted(p_session);
  if p_previous is not null
     and not exists (select 1 from sessions a join sessions b on b.student_id = a.student_id
                      where a.id = p_session and b.id = p_previous and b.id <> a.id) then
    raise exception 'the earlier point is not one of this student''s sessions';
  end if;
  insert into verdict_overrides (session_id, previous_session_id, draft_wording, draft_context,
                                 updated_by, updated_at)
  values (p_session, p_previous, coalesce(p_wording, ''), coalesce(p_context, ''), auth.uid(), now())
  on conflict (session_id) do update
    set previous_session_id = excluded.previous_session_id,
        draft_wording       = excluded.draft_wording,
        draft_context       = excluded.draft_context,
        updated_by          = excluded.updated_by,
        updated_at          = now();
end $$;

create or replace function public.share_verdict_override(p_session uuid, p_share boolean)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_targeted(p_session);
  if p_share and exists (select 1 from verdict_overrides where session_id = p_session
                          and btrim(draft_wording) = '' and btrim(draft_context) = '') then
    raise exception 'the wording is empty';
  end if;
  update verdict_overrides
     set shared_wording = case when p_share then nullif(btrim(draft_wording), '') end,
         shared_context = case when p_share then nullif(btrim(draft_context), '') end,
         shared_at      = case when p_share then now() end,
         shared_by      = case when p_share then auth.uid() end
   where session_id = p_session;
  if not found then raise exception 'there is no wording to share yet'; end if;
end $$;

revoke execute on function public.save_skill_note(uuid, text, text, text, text)        from public, anon, authenticated;
revoke execute on function public.save_skill_summary(uuid, text, text, text, text)     from public, anon, authenticated;
revoke execute on function public.share_skill_summary(uuid, text, text, text, boolean) from public, anon, authenticated;
revoke execute on function public.save_verdict_override(uuid, uuid, text, text)        from public, anon, authenticated;
revoke execute on function public.share_verdict_override(uuid, boolean)                from public, anon, authenticated;
grant  execute on function public.save_skill_note(uuid, text, text, text, text)        to authenticated;
grant  execute on function public.save_skill_summary(uuid, text, text, text, text)     to authenticated;
grant  execute on function public.share_skill_summary(uuid, text, text, text, boolean) to authenticated;
grant  execute on function public.save_verdict_override(uuid, uuid, text, text)        to authenticated;
grant  execute on function public.share_verdict_override(uuid, boolean)                to authenticated;

comment on function public.save_skill_note(uuid, text, text, text, text) is
  'The private note on a student and a skill. Staff only; the PC never reads it (0061).';
comment on function public.save_skill_summary(uuid, text, text, text, text) is
  'The draft of the summary the PC is given. Staff only (0061).';
comment on function public.share_skill_summary(uuid, text, text, text, boolean) is
  'Copies the summary''s draft to the copy the PC reads, or takes it back (0061).';
comment on function public.save_verdict_override(uuid, uuid, text, text) is
  'The draft of the teacher''s wording for the step up to a targeted test, and the point it was written against (0061).';
comment on function public.share_verdict_override(uuid, boolean) is
  'Copies the wording''s draft to the copy the PC reads, or takes it back (0061).';
