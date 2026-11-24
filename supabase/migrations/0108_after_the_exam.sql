-- ============================================================================
--  0108 — after the exam: waiting, the result, a reflection, new goals
--
--  The scope's student journey, steps 4 and 5 (F16):
--
--    After the exam   "Waiting for results" until the real score is added —
--                     worked out on the page from the goal's SAT date and the
--                     scores on record; nothing is stored for it.
--    Reflect, reset   the real score beside the goal, three short prompts for
--                     the student, one summary line from the PC, and new goals
--                     if they will retake.
--
--  One reflection per student per SAT date. The student writes theirs (by
--  their key, signed out like every door of theirs) and can change it; the PC
--  — their own student — or an admin writes the summary line. Staff read every
--  student's, a PC their own students', as with goals (0101).
--
--  And 0106's leftovers go: 0101's four- and five-argument goal savers were
--  kept for the site that was live then; main has had the blueprint's
--  dashboard since, which never calls them.
-- ============================================================================

create table if not exists student_reflections (
  id          uuid primary key default gen_random_uuid(),
  student_id  uuid not null references profiles(id) on delete cascade,
  exam_on     date not null,
  went_well   text check (went_well is null or length(went_well) <= 600),
  was_hard    text check (was_hard is null or length(was_hard) <= 600),
  next_time   text check (next_time is null or length(next_time) <= 600),
  retake      boolean,
  pc_summary  text check (pc_summary is null or length(pc_summary) <= 300),
  pc_by       uuid references profiles(id) on delete set null,
  pc_at       timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  unique (student_id, exam_on)
);

comment on table student_reflections is
  'After a real SAT: the student''s three answers, whether they will retake, and the PC''s summary line (0108).';

alter table student_reflections enable row level security;

drop policy if exists student_reflections_staff_read on student_reflections;
create policy student_reflections_staff_read on student_reflections for select
  using ((select is_teacher()));
drop policy if exists student_reflections_pc_read on student_reflections;
create policy student_reflections_pc_read on student_reflections for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on student_reflections from anon, authenticated;

-- --------------------------------------------------------- the student ---
create or replace function public.student_reflections(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return coalesce((select jsonb_agg(jsonb_build_object(
           'exam_on', r.exam_on, 'went_well', r.went_well, 'was_hard', r.was_hard, 'next_time', r.next_time,
           'retake', r.retake, 'pc_summary', r.pc_summary, 'pc_at', r.pc_at, 'updated_at', r.updated_at)
           order by r.exam_on desc)
           from student_reflections r where r.student_id = v_student), '[]'::jsonb);
end $$;

revoke execute on function public.student_reflections(text) from public, anon, authenticated;
grant  execute on function public.student_reflections(text) to anon, authenticated;

create or replace function public.student_save_reflection(
  p_key       text,
  p_exam_on   date,
  p_went_well text,
  p_was_hard  text,
  p_next_time text,
  p_retake    boolean
) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  if p_exam_on is null or p_exam_on > current_date + 1 then
    raise exception 'a reflection is on an SAT already sat';
  end if;
  if length(coalesce(p_went_well, '')) > 600 or length(coalesce(p_was_hard, '')) > 600 or length(coalesce(p_next_time, '')) > 600 then
    raise exception 'each answer fits in 600 characters';
  end if;
  insert into student_reflections (student_id, exam_on, went_well, was_hard, next_time, retake)
  values (v_student, p_exam_on, nullif(btrim(p_went_well), ''), nullif(btrim(p_was_hard), ''),
          nullif(btrim(p_next_time), ''), p_retake)
  on conflict (student_id, exam_on) do update
     set went_well = excluded.went_well, was_hard = excluded.was_hard, next_time = excluded.next_time,
         retake = excluded.retake, updated_at = now();
  return student_reflections(p_key);
end $$;

revoke execute on function public.student_save_reflection(text, date, text, text, text, boolean) from public, anon, authenticated;
grant  execute on function public.student_save_reflection(text, date, text, text, text, boolean) to anon, authenticated;

comment on function public.student_save_reflection(text, date, text, text, text, boolean) is
  'The signed-in student''s reflection on a real SAT: what went well, what was hard, what next time, and whether they retake (0108).';

-- ----------------------------------------------------------------- the PC ---
create or replace function public.set_reflection_summary(p_student uuid, p_exam_on date, p_summary text)
returns void
language plpgsql security definer set search_path = public as $$
declare v_text text := nullif(btrim(coalesce(p_summary, '')), '');
begin
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if not (is_admin() or (is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()))) then
    raise exception 'only the student''s PC or an admin writes the summary';
  end if;
  if v_text is not null and length(v_text) > 300 then
    raise exception 'the summary fits in 300 characters';
  end if;
  if p_exam_on is null or p_exam_on > current_date + 1 then
    raise exception 'a reflection is on an SAT already sat';
  end if;
  insert into student_reflections (student_id, exam_on, pc_summary, pc_by, pc_at)
  values (p_student, p_exam_on, v_text, auth.uid(), now())
  on conflict (student_id, exam_on) do update
     set pc_summary = excluded.pc_summary, pc_by = auth.uid(), pc_at = now(), updated_at = now();
end $$;

revoke execute on function public.set_reflection_summary(uuid, date, text) from public, anon, authenticated;
grant  execute on function public.set_reflection_summary(uuid, date, text) to authenticated;

comment on function public.set_reflection_summary(uuid, date, text) is
  'The student''s PC, or an admin, writes the one-line summary of a reflection (0108).';

-- ------------------------------------------------------- 0106's leftovers ---
drop function if exists public.student_set_goal(text, int, int, date, date);
drop function if exists public.set_student_goal(uuid, int, int, date, date);
