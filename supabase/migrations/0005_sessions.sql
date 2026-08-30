-- ============================================================================
--  0005 — sessions, the live question loop, and teacher-only assessment
--
--  The workflow this implements:
--    teacher creates a session with a student, a time and a meeting link
--      -> teacher stages questions into a queue (invisible to the student)
--      -> teacher starts the session; student joins
--      -> teacher publishes one question; the student sees it appear
--      -> student eliminates options, answers, submits
--      -> teacher sees the answer land, discusses it on the call
--      -> teacher reveals; only now does the student learn if it was right
--      -> teacher taps one diagnosis chip; the next question is suggested
--
--  Grading runs inside submit_answer as SECURITY DEFINER, because comparing an
--  answer against question_keys needs a table the student cannot read.  That is
--  the server-side step; it does not need a separate API service to exist.
-- ============================================================================

create type session_status  as enum ('scheduled','live','completed','cancelled');
create type item_status     as enum ('staged','published','answered','revealed','voided');
create type grade_result    as enum ('correct','incorrect');

create table sessions (
  id             uuid primary key default gen_random_uuid(),
  teacher_id     uuid not null references profiles(id),
  student_id     uuid not null references profiles(id),
  subject        text not null default 'english'
                   check (subject in ('english','mathematics')),
  title          text,
  scheduled_at   timestamptz not null,
  duration_mins  integer not null default 60 check (duration_mins between 5 and 480),
  meeting_url    text,
  status         session_status not null default 'scheduled',
  started_at     timestamptz,
  ended_at       timestamptz,
  teacher_notes  text,
  created_at     timestamptz not null default now(),
  check (teacher_id <> student_id)
);
create index sessions_teacher_idx on sessions (teacher_id, scheduled_at desc);
create index sessions_student_idx on sessions (student_id, scheduled_at desc);

-- The spine: one row per question put in front of a student.
create table session_items (
  id                 uuid primary key default gen_random_uuid(),
  session_id         uuid not null references sessions(id) on delete cascade,
  question_id        uuid not null references questions(id),
  student_id         uuid not null references profiles(id),
  sequence_no        integer not null,
  status             item_status not null default 'staged',

  published_at       timestamptz,
  first_viewed_at    timestamptz,
  answered_at        timestamptz,
  revealed_at        timestamptz,

  selected_option    answer_option,
  eliminated_options answer_option[] not null default '{}',
  student_confidence smallint check (student_confidence between 1 and 3),
  student_reasoning  text,

  -- Written only when the teacher reveals. Everything the student is allowed
  -- to learn about correctness lives in these two columns and nowhere else.
  revealed_result      grade_result,
  revealed_explanation text,

  created_at         timestamptz not null default now(),
  unique (session_id, sequence_no)
);
create index session_items_session_idx on session_items (session_id, sequence_no);
create index session_items_student_idx on session_items (student_id);

-- Teacher-only. is_correct lands here at submit time, long before the reveal,
-- so it cannot live on session_items — Realtime pushes whole rows and the
-- student subscribes to their own.
create table session_item_assessments (
  session_item_id uuid primary key references session_items(id) on delete cascade,
  is_correct      boolean not null,
  elapsed_seconds integer,
  graded_at       timestamptz not null default now(),
  diagnosis       text check (diagnosis is null or diagnosis in (
                    'solid_reasoning','lucky_guess','careless_error',
                    'concept_gap','misread_question','ran_out_of_time')),
  diagnosed_at    timestamptz,
  teacher_note    text
);

-- ------------------------------------------------------------------ RLS ----
alter table sessions                 enable row level security;
alter table session_items            enable row level security;
alter table session_item_assessments enable row level security;

create policy sessions_teacher on sessions for all
  using (teacher_id = auth.uid()) with check (teacher_id = auth.uid());
create policy sessions_student_read on sessions for select
  using (student_id = auth.uid());

create policy items_teacher on session_items for all
  using (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()))
  with check (exists (select 1 from sessions s where s.id = session_id and s.teacher_id = auth.uid()));
-- Staging does not expose anything; publishing does.
create policy items_student_read on session_items for select
  using (student_id = auth.uid() and status <> 'staged');

create policy assessments_teacher on session_item_assessments for all
  using (exists (select 1 from session_items si join sessions s on s.id = si.session_id
                 where si.id = session_item_id and s.teacher_id = auth.uid()));

-- A student may read a question only through a published item of their own.
create policy questions_student_read on questions for select
  using (exists (select 1 from session_items si
                 where si.question_id = questions.id
                   and si.student_id = auth.uid()
                   and si.status <> 'staged'));

create policy options_student_read on question_options for select
  using (exists (select 1 from session_items si
                 where si.question_id = question_options.question_id
                   and si.student_id = auth.uid()
                   and si.status <> 'staged'));

-- Teachers need to pick a student; both sides need each other's name on a session.
create policy profiles_teacher_reads_students on profiles for select
  using (is_teacher() and role = 'student');
create policy profiles_session_counterpart on profiles for select
  using (exists (select 1 from sessions s
                 where (s.teacher_id = profiles.id and s.student_id = auth.uid())
                    or (s.student_id = profiles.id and s.teacher_id = auth.uid())));

-- ----------------------------------------------------------------- RPCs ----
create or replace function public.assert_session_teacher(p_session uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from sessions where id = p_session and teacher_id = auth.uid()) then
    raise exception 'not your session';
  end if;
end $$;

create or replace function public.stage_question(p_session uuid, p_question uuid)
returns uuid language plpgsql security definer set search_path = public as $$
declare v_student uuid; v_next int; v_id uuid;
begin
  perform assert_session_teacher(p_session);
  if not is_teacher() then raise exception 'teachers only'; end if;

  select student_id into v_student from sessions where id = p_session;
  select coalesce(max(sequence_no), 0) + 1 into v_next
    from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  values (p_session, p_question, v_student, v_next)
  returning id into v_id;
  return v_id;
end $$;

create or replace function public.unstage_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status;
begin
  select session_id, status into v_session, v_status from session_items where id = p_item;
  perform assert_session_teacher(v_session);
  if v_status <> 'staged' then raise exception 'only a staged question can be removed'; end if;
  delete from session_items where id = p_item;
end $$;

create or replace function public.publish_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status;
begin
  select session_id, status into v_session, v_status from session_items where id = p_item;
  perform assert_session_teacher(v_session);
  if v_status <> 'staged' then raise exception 'that question is already out'; end if;

  update session_items
     set status = 'published', published_at = now()
   where id = p_item;
end $$;

-- The student's browser calls this when the question first renders, so
-- time-on-question measures reading time rather than network lag.
create or replace function public.mark_item_viewed(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set first_viewed_at = now()
   where id = p_item
     and student_id = auth.uid()
     and status = 'published'
     and first_viewed_at is null;
end $$;

-- Grading. SECURITY DEFINER because it must read question_keys, which the
-- student cannot. Returns nothing: the result is withheld until the reveal.
create or replace function public.submit_answer(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
declare
  v_status  item_status;
  v_correct answer_option;
  v_started timestamptz;
  v_elapsed int;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at)
    into v_status, v_started
    from session_items si
   where si.id = p_item and si.student_id = auth.uid();

  if not found then raise exception 'not your question'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status             = 'answered',
         answered_at        = now(),
         selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence,
         student_reasoning  = nullif(btrim(p_reasoning), '')
   where id = p_item;

  select correct_option into v_correct
    from question_keys k
    join session_items si on si.question_id = k.question_id
   where si.id = p_item;

  v_elapsed := greatest(0, extract(epoch from (now() - coalesce(v_started, now())))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, p_option = v_correct, v_elapsed)
  on conflict (session_item_id) do update
    set is_correct = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at = now();
end $$;

-- Reveal copies the result and the written explanation onto the item, which is
-- the only route by which either reaches the student.
create or replace function public.reveal_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status; v_correct boolean;
begin
  select si.session_id, si.status into v_session, v_status
    from session_items si where si.id = p_item;
  perform assert_session_teacher(v_session);
  if v_status <> 'answered' then raise exception 'nothing to reveal yet'; end if;

  select a.is_correct into v_correct
    from session_item_assessments a where a.session_item_id = p_item;

  update session_items si
     set status = 'revealed',
         revealed_at = now(),
         revealed_result = case when v_correct then 'correct' else 'incorrect' end::grade_result,
         revealed_explanation = (select k.explanation from question_keys k
                                  where k.question_id = si.question_id)
   where si.id = p_item;
end $$;

create or replace function public.set_diagnosis(p_item uuid, p_diagnosis text, p_note text)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid;
begin
  select session_id into v_session from session_items where id = p_item;
  perform assert_session_teacher(v_session);

  update session_item_assessments
     set diagnosis = nullif(p_diagnosis, ''),
         diagnosed_at = now(),
         teacher_note = nullif(btrim(p_note), '')
   where session_item_id = p_item;
end $$;

create or replace function public.set_session_status(p_session uuid, p_status session_status)
returns void language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
  update sessions
     set status = p_status,
         started_at = case when p_status = 'live' and started_at is null then now() else started_at end,
         ended_at   = case when p_status = 'completed' then now() else ended_at end
   where id = p_session;
end $$;

revoke execute on function public.assert_session_teacher(uuid) from anon, authenticated;

-- --------------------------------------------------------------- realtime ---
alter publication supabase_realtime add table session_items;
alter publication supabase_realtime add table sessions;
