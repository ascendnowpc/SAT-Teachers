-- ============================================================================
--  0101 — "Let's set our goals": the target, the day, and the PC's say
--
--  The student's account read the SAT as one number: the latest total. The
--  section-tracker scope starts every student's journey with their goals
--  instead, set on joining:
--
--    the score they aim for in each half — Reading and Writing, and Math —
--      (the total is the two added, and is never stored)
--    the day of their next SAT, and its registration deadline
--
--  WHO SETS THEM. The student enters them on joining — or their parent,
--  signed in with the student's ID and PIN — and their PC confirms them so
--  they are realistic. Once the PC has confirmed them, only the PC (or an
--  admin) changes them: a goal a student can lower the night before is not a
--  goal. Every version is kept in student_goal_history, with who set it.
--
--    student_goal(key)                                   what is set, or null
--    student_set_goal(key, rw, math, next_on, reg_on)    until the PC confirms
--    set_student_goal(student, rw, math, next_on, reg_on)
--                                                        the PC (their own
--                                                        students) or an admin;
--                                                        saving confirms it
--
--  A target is a section score: 200 to 800, in tens. Either target may be
--  empty, and so may either day. The next SAT is a day still to come; the
--  registration deadline is on or before it. All four empty forgets the goal.
--
--  Staff read every goal and its history; a PC their own students'. It goes
--  with the student when the clean-up deletes them (0071).
-- ============================================================================

create table if not exists student_goals (
  student_id               uuid primary key references profiles(id) on delete cascade,
  target_rw                int  check (target_rw   is null or (target_rw   between 200 and 800 and target_rw   % 10 = 0)),
  target_math              int  check (target_math is null or (target_math between 200 and 800 and target_math % 10 = 0)),
  next_test_on             date,
  registration_deadline_on date,
  confirmed_at             timestamptz,
  confirmed_by             uuid references profiles(id) on delete set null,
  updated_at               timestamptz not null default now(),
  updated_role             text not null default 'student' check (updated_role in ('student', 'pc', 'admin'))
);

comment on table student_goals is
  'The score a student aims for in each half of the SAT, the day of their next one and its registration deadline: entered by the student on joining, confirmed and then changed by their PC (0101).';
comment on column student_goals.confirmed_at is 'When the PC (or an admin) confirmed it; from then on only they change it.';

create table if not exists student_goal_history (
  id                       uuid primary key default gen_random_uuid(),
  student_id               uuid not null references profiles(id) on delete cascade,
  target_rw                int,
  target_math              int,
  next_test_on             date,
  registration_deadline_on date,
  set_by                   uuid references profiles(id) on delete set null,
  set_role                 text not null check (set_role in ('student', 'pc', 'admin')),
  set_at                   timestamptz not null default now()
);

comment on table student_goal_history is
  'Every version of a student''s goal, as it was set and by whom (0101): a changed goal keeps the old one.';

create index if not exists student_goal_history_student on student_goal_history (student_id, set_at desc);

alter table student_goals enable row level security;
alter table student_goal_history enable row level security;

drop policy if exists student_goals_staff_read on student_goals;
create policy student_goals_staff_read on student_goals for select
  using ((select is_teacher()));
drop policy if exists student_goals_pc_read on student_goals;
create policy student_goals_pc_read on student_goals for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

drop policy if exists student_goal_history_staff_read on student_goal_history;
create policy student_goal_history_staff_read on student_goal_history for select
  using ((select is_teacher()));
drop policy if exists student_goal_history_pc_read on student_goal_history;
create policy student_goal_history_pc_read on student_goal_history for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on student_goals from anon, authenticated;
revoke insert, update, delete, truncate on student_goal_history from anon, authenticated;

-- ------------------------------------------------------ the one way in ---
-- Internal: the checks, the row and its history line. The caller has said
-- who is setting it.
create or replace function public.goal_record(
  p_student      uuid,
  p_by           uuid,
  p_role         text,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date
) returns void
language plpgsql security definer set search_path = public as $$
begin
  if p_target_rw is not null and (p_target_rw not between 200 and 800 or p_target_rw % 10 <> 0) then
    raise exception 'a Reading and Writing goal is 200 to 800, in tens';
  end if;
  if p_target_math is not null and (p_target_math not between 200 and 800 or p_target_math % 10 <> 0) then
    raise exception 'a Math goal is 200 to 800, in tens';
  end if;
  -- A day's slack: the student's today may be the server's yesterday.
  if p_next_test_on is not null and p_next_test_on < current_date - 1 then
    raise exception 'the next test is a day still to come';
  end if;
  if p_next_test_on is not null and p_next_test_on > current_date + interval '3 years' then
    raise exception 'the next test is within three years';
  end if;
  if p_reg_on is not null and p_next_test_on is not null and p_reg_on > p_next_test_on then
    raise exception 'the registration deadline comes before the test';
  end if;
  if p_reg_on is not null and (p_reg_on < current_date - interval '1 year' or p_reg_on > current_date + interval '3 years') then
    raise exception 'that registration deadline is not within the coming SATs';
  end if;

  if p_target_rw is null and p_target_math is null and p_next_test_on is null and p_reg_on is null then
    delete from student_goals where student_id = p_student;
  else
    insert into student_goals (student_id, target_rw, target_math, next_test_on, registration_deadline_on,
                               confirmed_at, confirmed_by, updated_at, updated_role)
    values (p_student, p_target_rw, p_target_math, p_next_test_on, p_reg_on,
            case when p_role = 'student' then null else now() end,
            case when p_role = 'student' then null else p_by end,
            now(), p_role)
    on conflict (student_id) do update
       set target_rw = excluded.target_rw,
           target_math = excluded.target_math,
           next_test_on = excluded.next_test_on,
           registration_deadline_on = excluded.registration_deadline_on,
           confirmed_at = case when p_role = 'student' then student_goals.confirmed_at else now() end,
           confirmed_by = case when p_role = 'student' then student_goals.confirmed_by else p_by end,
           updated_at = now(),
           updated_role = p_role;
  end if;

  insert into student_goal_history (student_id, target_rw, target_math, next_test_on, registration_deadline_on, set_by, set_role)
  values (p_student, p_target_rw, p_target_math, p_next_test_on, p_reg_on, p_by, p_role);
end $$;

revoke execute on function public.goal_record(uuid, uuid, text, int, int, date, date) from public, anon, authenticated;

-- ---------------------------------------------------------------- reading ---
create or replace function public.student_goal(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return (select jsonb_build_object('target_rw', g.target_rw, 'target_math', g.target_math,
                                    'next_test_on', g.next_test_on,
                                    'registration_deadline_on', g.registration_deadline_on,
                                    'confirmed_at', g.confirmed_at, 'updated_at', g.updated_at)
            from student_goals g where g.student_id = v_student);
end $$;

revoke execute on function public.student_goal(text) from public, anon, authenticated;
grant  execute on function public.student_goal(text) to anon, authenticated;

comment on function public.student_goal(text) is
  'The signed-in student''s goal: a target for each half of the SAT, the next SAT and its registration deadline, and whether their PC has confirmed it — or null (0101).';

-- ------------------------------------------------------- the student ---
drop function if exists public.student_set_goal(text, int, int, date);

create or replace function public.student_set_goal(
  p_key          text,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date default null
) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  if exists (select 1 from student_goals where student_id = v_student and confirmed_at is not null) then
    raise exception 'your PC has confirmed your goals; ask them to change them';
  end if;
  perform goal_record(v_student, v_student, 'student', p_target_rw, p_target_math, p_next_test_on, p_reg_on);
  return student_goal(p_key);
end $$;

revoke execute on function public.student_set_goal(text, int, int, date, date) from public, anon, authenticated;
grant  execute on function public.student_set_goal(text, int, int, date, date) to anon, authenticated;

comment on function public.student_set_goal(text, int, int, date, date) is
  'The signed-in student (or their parent) sets their goals on joining — until their PC confirms them; all four empty forgets them (0101).';

-- -------------------------------------------------- the PC, an admin ---
create or replace function public.set_student_goal(
  p_student      uuid,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date default null
) returns void
language plpgsql security definer set search_path = public as $$
declare v_role text;
begin
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if is_admin() then
    v_role := 'admin';
  elsif is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()) then
    v_role := 'pc';
  else
    raise exception 'only the student''s PC or an admin changes their goals';
  end if;
  perform goal_record(p_student, auth.uid(), v_role, p_target_rw, p_target_math, p_next_test_on, p_reg_on);
end $$;

revoke execute on function public.set_student_goal(uuid, int, int, date, date) from public, anon, authenticated;
grant  execute on function public.set_student_goal(uuid, int, int, date, date) to authenticated;

comment on function public.set_student_goal(uuid, int, int, date, date) is
  'The student''s PC, or an admin, sets or changes their goals; saving confirms them, and the old version is kept in student_goal_history (0101).';
