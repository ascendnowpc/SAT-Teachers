-- ============================================================================
--  0106 — the goal doors, for the site that is live and the one coming
--
--  0105 changed student_goal's answer and replaced the goal savers' arguments.
--  The site on main (0101's goal panel, merged before the dashboard blueprint)
--  still reads student_goal as the goal itself and saves with five arguments,
--  so with 0105 alone it could no longer save a goal. Both are kept now:
--
--    student_goal(key)           the goal, or null — as 0101 had it, with the
--                                total and the college note besides
--    student_goal_state(key)     { joined_on, onboarded_at, goal } — the
--                                blueprint's onboarding reads this (0105)
--    student_set_goal(key, rw, math, next_on[, reg_on])
--    set_student_goal(student, rw, math, next_on[, reg_on])
--                                0101's arguments; the total and the college
--                                note already set are kept
--    student_set_goal(key, total, rw, math, next_on, reg_on, college)
--    set_student_goal(student, total, rw, math, next_on, reg_on, college)
--                                0105's, every argument named
--
--  A name with two argument lists is one PostgREST resolves by the names a call
--  sends, as long as no call fits both: 0101's take four or five, 0105's seven,
--  none of them defaulted. Never locked, in both: a student's change clears
--  the PC's confirmation (0105). 0101's versions can go once main has the
--  blueprint's dashboard.
-- ============================================================================

-- ------------------------------------------------------------- reading ---
create or replace function public.goal_json(p_student uuid)
returns jsonb
language sql stable security definer set search_path = public as $$
  select case
           when g.target_total is null and g.target_rw is null and g.target_math is null
                and g.next_test_on is null and g.registration_deadline_on is null
                and g.college_note is null then null
           else jsonb_build_object(
             'target_total', g.target_total, 'target_rw', g.target_rw, 'target_math', g.target_math,
             'next_test_on', g.next_test_on, 'registration_deadline_on', g.registration_deadline_on,
             'college_note', g.college_note, 'confirmed_at', g.confirmed_at, 'updated_at', g.updated_at)
         end
    from student_goals g where g.student_id = p_student
$$;

revoke execute on function public.goal_json(uuid) from public, anon, authenticated;

create or replace function public.student_goal(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  return goal_json(student_for_key(p_key));
end $$;

revoke execute on function public.student_goal(text) from public, anon, authenticated;
grant  execute on function public.student_goal(text) to anon, authenticated;

comment on function public.student_goal(text) is
  'The signed-in student''s goal, or null (0101, 0106).';

create or replace function public.student_goal_state(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'joined_on', (select p.created_at::date from profiles p where p.id = v_student),
    'onboarded_at', (select g.onboarded_at from student_goals g where g.student_id = v_student),
    'goal', goal_json(v_student));
end $$;

revoke execute on function public.student_goal_state(text) from public, anon, authenticated;
grant  execute on function public.student_goal_state(text) to anon, authenticated;

comment on function public.student_goal_state(text) is
  'The signed-in student''s goal, the day they joined and whether they have been through the first-login steps (0105, 0106).';

-- ----------------------------------------------------- 0105's, now state ---
create or replace function public.student_set_goal(
  p_key          text,
  p_target_total int,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date,
  p_college_note text
) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  perform goal_record(v_student, v_student, 'student', p_target_total, p_target_rw, p_target_math,
                      p_next_test_on, p_reg_on, p_college_note);
  return student_goal_state(p_key);
end $$;

create or replace function public.student_finish_onboarding(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  insert into student_goals (student_id, onboarded_at, updated_at, updated_role)
  values (v_student, now(), now(), 'student')
  on conflict (student_id) do update set onboarded_at = coalesce(student_goals.onboarded_at, now());
  return student_goal_state(p_key);
end $$;

-- ------------------------------------------------------ 0101's, kept ---
create or replace function public.student_set_goal(
  p_key          text,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date default null
) returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid := student_for_key(p_key);
  v_total int;
  v_college text;
begin
  select g.target_total, g.college_note into v_total, v_college
    from student_goals g where g.student_id = v_student;
  perform goal_record(v_student, v_student, 'student', v_total, p_target_rw, p_target_math,
                      p_next_test_on, p_reg_on, v_college);
  return student_goal(p_key);
end $$;

revoke execute on function public.student_set_goal(text, int, int, date, date) from public, anon, authenticated;
grant  execute on function public.student_set_goal(text, int, int, date, date) to anon, authenticated;

comment on function public.student_set_goal(text, int, int, date, date) is
  'As 0101 had it, for the site on main: the section targets and the dates; the total and the college note are kept (0106).';

create or replace function public.set_student_goal(
  p_student      uuid,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date default null
) returns void
language plpgsql security definer set search_path = public as $$
declare
  v_total int;
  v_college text;
begin
  select g.target_total, g.college_note into v_total, v_college
    from student_goals g where g.student_id = p_student;
  -- 0105's does the checks: a student, and their PC or an admin.
  perform set_student_goal(p_student, v_total, p_target_rw, p_target_math, p_next_test_on, p_reg_on, v_college);
end $$;

revoke execute on function public.set_student_goal(uuid, int, int, date, date) from public, anon, authenticated;
grant  execute on function public.set_student_goal(uuid, int, int, date, date) to authenticated;

comment on function public.set_student_goal(uuid, int, int, date, date) is
  'As 0101 had it, for the site on main: the PC or an admin sets the section targets and the dates; the total and the college note are kept (0106).';
