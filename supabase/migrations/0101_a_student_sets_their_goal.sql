-- ============================================================================
--  0101 — a student sets their goal, and the day of their next SAT
--
--  The student's account read the SAT as one number: the latest total. A
--  student aims for a score in each half, though — Reading and Writing, and
--  Math — and works to a day. Now the student (or their parent, signed in with
--  the student's ID and PIN) says both, from their account:
--
--    student_goal(key)                          what is set, or null
--    student_set_goal(key, rw, math, next_on)   sets all three at once
--
--  A target is a section score: 200 to 800, in tens, as College Board scores
--  it — the total is the two added, and is never stored. Either target may be
--  left empty. The next test is a day, not one already gone; it may be left
--  empty too. Setting all three empty forgets the goal.
--
--  It goes with the student: a student the clean-up deletes takes their goal
--  with them (0071). Staff read it, and a PC reads their own students' — the
--  same readers as a Bluebook score (0088, 0099). Only the student writes it.
-- ============================================================================

create table if not exists student_goals (
  student_id   uuid primary key references profiles(id) on delete cascade,
  target_rw    int  check (target_rw   is null or (target_rw   between 200 and 800 and target_rw   % 10 = 0)),
  target_math  int  check (target_math is null or (target_math between 200 and 800 and target_math % 10 = 0)),
  next_test_on date,
  updated_at   timestamptz not null default now()
);

comment on table student_goals is
  'The score a student aims for in each half of the SAT, and the day of their next one — set by the student (0101).';
comment on column student_goals.target_rw is 'Reading and Writing, 200–800 in tens; null when not set.';
comment on column student_goals.target_math is 'Math, 200–800 in tens; null when not set.';
comment on column student_goals.next_test_on is 'The day of the student''s next SAT; null when not set.';

alter table student_goals enable row level security;

drop policy if exists student_goals_staff_read on student_goals;
create policy student_goals_staff_read on student_goals for select
  using ((select is_teacher()));

drop policy if exists student_goals_pc_read on student_goals;
create policy student_goals_pc_read on student_goals for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on student_goals from anon, authenticated;

-- ---------------------------------------------------------------- reading ---
create or replace function public.student_goal(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return (select jsonb_build_object('target_rw', g.target_rw, 'target_math', g.target_math,
                                    'next_test_on', g.next_test_on, 'updated_at', g.updated_at)
            from student_goals g where g.student_id = v_student);
end $$;

revoke execute on function public.student_goal(text) from public, anon, authenticated;
grant  execute on function public.student_goal(text) to anon, authenticated;

comment on function public.student_goal(text) is
  'The signed-in student''s goal: a target for each half of the SAT and the day of their next one, or null (0101).';

-- ---------------------------------------------------------------- setting ---
create or replace function public.student_set_goal(
  p_key          text,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date
) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  if p_target_rw is not null and (p_target_rw not between 200 and 800 or p_target_rw % 10 <> 0) then
    raise exception 'a Reading and Writing goal is 200 to 800, in tens';
  end if;
  if p_target_math is not null and (p_target_math not between 200 and 800 or p_target_math % 10 <> 0) then
    raise exception 'a Math goal is 200 to 800, in tens';
  end if;
  -- A day's slack either way: the student's today may be the server's yesterday.
  if p_next_test_on is not null and p_next_test_on < current_date - 1 then
    raise exception 'the next test is a day still to come';
  end if;
  if p_next_test_on is not null and p_next_test_on > current_date + interval '3 years' then
    raise exception 'the next test is within three years';
  end if;

  if p_target_rw is null and p_target_math is null and p_next_test_on is null then
    delete from student_goals where student_id = v_student;
    return null;
  end if;

  insert into student_goals (student_id, target_rw, target_math, next_test_on, updated_at)
  values (v_student, p_target_rw, p_target_math, p_next_test_on, now())
  on conflict (student_id) do update
     set target_rw = excluded.target_rw,
         target_math = excluded.target_math,
         next_test_on = excluded.next_test_on,
         updated_at = now();

  return student_goal(p_key);
end $$;

revoke execute on function public.student_set_goal(text, int, int, date) from public, anon, authenticated;
grant  execute on function public.student_set_goal(text, int, int, date) to anon, authenticated;

comment on function public.student_set_goal(text, int, int, date) is
  'The signed-in student (or their parent) sets their goal for each half of the SAT and the day of their next one; all three empty forgets it (0101).';
