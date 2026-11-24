-- ============================================================================
--  0105 — the goal as the dashboard blueprint has it: a target, a reason, and
--  never locked
--
--  The blueprint Ascend Now aligned on starts every student with a short
--  "let's start" on their first login: when is your SAT (a date, or not sure
--  yet), have you taken it before (upload the report or type the score), and
--  what are you aiming for and what does your college need. Every answer is
--  editable or skippable later — "nothing is locked in".
--
--  What changes from 0101:
--
--    target_total   the score they aim for, 400–1600 in tens. The section
--                   targets stay, optional; with no total set, the total is the
--                   two sections added, as before.
--    college_note   what their college needs, in their words ("NYU, 1450+").
--    onboarded_at   when they finished — or skipped — the first-login steps,
--                   so they are asked once.
--
--  NEVER LOCKED. 0101 let the PC confirm a goal and then took it from the
--  student. Now the student changes it whenever they like; a change of theirs
--  clears the PC's confirmation, so the PC sees it to confirm again. Every
--  version is still kept in student_goal_history. A goal emptied is kept as a
--  row, because the row also says the student has been through onboarding.
--
--    student_goal(key)          { joined_on, onboarded_at, goal | null }
--    student_set_goal(key, total, rw, math, next_on, reg_on, college)
--    student_finish_onboarding(key)
--    set_student_goal(student, total, rw, math, next_on, reg_on, college)
--                               the PC (their own students) or an admin;
--                               saving confirms it
--
--  students_overview (0104) carries the new fields.
-- ============================================================================

alter table student_goals
  add column if not exists target_total int
    check (target_total is null or (target_total between 400 and 1600 and target_total % 10 = 0)),
  add column if not exists college_note text check (college_note is null or length(college_note) <= 200),
  add column if not exists onboarded_at timestamptz;

alter table student_goal_history
  add column if not exists target_total int,
  add column if not exists college_note text;

comment on column student_goals.target_total is 'The total the student aims for, 400–1600 in tens; null when not set (0105).';
comment on column student_goals.college_note is 'What the student''s college needs, in their words (0105).';
comment on column student_goals.onboarded_at is 'When the student finished or skipped the first-login steps (0105).';

-- 0101's versions go: the arguments change, and two of a name confuse PostgREST.
drop function if exists public.student_set_goal(text, int, int, date, date);
drop function if exists public.set_student_goal(uuid, int, int, date, date);
drop function if exists public.goal_record(uuid, uuid, text, int, int, date, date);

-- ------------------------------------------------------ the one way in ---
create or replace function public.goal_record(
  p_student      uuid,
  p_by           uuid,
  p_role         text,
  p_target_total int,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date,
  p_college_note text
) returns void
language plpgsql security definer set search_path = public as $$
declare v_college text := nullif(btrim(coalesce(p_college_note, '')), '');
begin
  if p_target_total is not null and (p_target_total not between 400 and 1600 or p_target_total % 10 <> 0) then
    raise exception 'a total goal is 400 to 1600, in tens';
  end if;
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
  if v_college is not null and length(v_college) > 200 then
    raise exception 'what your college needs fits in 200 characters';
  end if;

  insert into student_goals (student_id, target_total, target_rw, target_math, next_test_on,
                             registration_deadline_on, college_note, confirmed_at, confirmed_by,
                             updated_at, updated_role)
  values (p_student, p_target_total, p_target_rw, p_target_math, p_next_test_on, p_reg_on, v_college,
          case when p_role = 'student' then null else now() end,
          case when p_role = 'student' then null else p_by end,
          now(), p_role)
  on conflict (student_id) do update
     set target_total = excluded.target_total,
         target_rw = excluded.target_rw,
         target_math = excluded.target_math,
         next_test_on = excluded.next_test_on,
         registration_deadline_on = excluded.registration_deadline_on,
         college_note = excluded.college_note,
         -- The student's change waits for the PC again; the PC's confirms it.
         confirmed_at = excluded.confirmed_at,
         confirmed_by = excluded.confirmed_by,
         updated_at = now(),
         updated_role = p_role;

  insert into student_goal_history (student_id, target_total, target_rw, target_math, next_test_on,
                                    registration_deadline_on, college_note, set_by, set_role)
  values (p_student, p_target_total, p_target_rw, p_target_math, p_next_test_on, p_reg_on, v_college,
          p_by, p_role);
end $$;

revoke execute on function public.goal_record(uuid, uuid, text, int, int, int, date, date, text)
  from public, anon, authenticated;

-- ---------------------------------------------------------------- reading ---
create or replace function public.student_goal(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'joined_on', (select p.created_at::date from profiles p where p.id = v_student),
    'onboarded_at', (select g.onboarded_at from student_goals g where g.student_id = v_student),
    'goal', (select case
                      when g.target_total is null and g.target_rw is null and g.target_math is null
                           and g.next_test_on is null and g.registration_deadline_on is null
                           and g.college_note is null then null
                      else jsonb_build_object(
                        'target_total', g.target_total, 'target_rw', g.target_rw, 'target_math', g.target_math,
                        'next_test_on', g.next_test_on, 'registration_deadline_on', g.registration_deadline_on,
                        'college_note', g.college_note, 'confirmed_at', g.confirmed_at, 'updated_at', g.updated_at)
                    end
               from student_goals g where g.student_id = v_student));
end $$;

revoke execute on function public.student_goal(text) from public, anon, authenticated;
grant  execute on function public.student_goal(text) to anon, authenticated;

comment on function public.student_goal(text) is
  'The signed-in student''s goal, the day they joined and whether they have been through the first-login steps (0101, 0105).';

-- ------------------------------------------------------- the student ---
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
  return student_goal(p_key);
end $$;

revoke execute on function public.student_set_goal(text, int, int, int, date, date, text) from public, anon, authenticated;
grant  execute on function public.student_set_goal(text, int, int, int, date, date, text) to anon, authenticated;

comment on function public.student_set_goal(text, int, int, int, date, date, text) is
  'The signed-in student (or their parent) sets their goal, whenever they like; it clears the PC''s confirmation (0105).';

create or replace function public.student_finish_onboarding(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  insert into student_goals (student_id, onboarded_at, updated_at, updated_role)
  values (v_student, now(), now(), 'student')
  on conflict (student_id) do update set onboarded_at = coalesce(student_goals.onboarded_at, now());
  return student_goal(p_key);
end $$;

revoke execute on function public.student_finish_onboarding(text) from public, anon, authenticated;
grant  execute on function public.student_finish_onboarding(text) to anon, authenticated;

comment on function public.student_finish_onboarding(text) is
  'The student has finished, or skipped, the first-login steps: they are not asked again (0105).';

-- -------------------------------------------------- the PC, an admin ---
create or replace function public.set_student_goal(
  p_student      uuid,
  p_target_total int,
  p_target_rw    int,
  p_target_math  int,
  p_next_test_on date,
  p_reg_on       date,
  p_college_note text
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
  perform goal_record(p_student, auth.uid(), v_role, p_target_total, p_target_rw, p_target_math,
                      p_next_test_on, p_reg_on, p_college_note);
end $$;

revoke execute on function public.set_student_goal(uuid, int, int, int, date, date, text) from public, anon, authenticated;
grant  execute on function public.set_student_goal(uuid, int, int, int, date, date, text) to authenticated;

comment on function public.set_student_goal(uuid, int, int, int, date, date, text) is
  'The student''s PC, or an admin, sets or changes their goal; saving confirms it (0101, 0105).';

-- ------------------------------------------------- the overview (0104) ---
create or replace function public.students_overview()
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare
  v_me uuid := auth.uid();
  v_out jsonb;
begin
  if v_me is null or not (is_teacher() or is_pc()) then
    raise exception 'only staff or a PC read the students overview';
  end if;

  with mine as (
    select p.id, p.full_name, p.display_id, p.pc
      from profiles p
     where p.role = 'student'
       and (
         is_admin()
         or (is_pc() and p.pc_id = v_me)
         or (is_teacher() and exists (select 1 from sessions s
                                        where s.student_id = p.id and s.teacher_id = v_me
                                          and s.status <> 'cancelled'))
       )
  )
  select coalesce(jsonb_agg(jsonb_build_object(
           'id', m.id,
           'full_name', m.full_name,
           'display_id', m.display_id,
           'pc', m.pc,
           'goal', (select jsonb_build_object('target_total', g.target_total,
                                              'target_rw', g.target_rw, 'target_math', g.target_math,
                                              'next_test_on', g.next_test_on,
                                              'registration_deadline_on', g.registration_deadline_on,
                                              'college_note', g.college_note,
                                              'confirmed_at', g.confirmed_at)
                      from student_goals g where g.student_id = m.id),
           'sat', (select jsonb_build_object('total', b.total, 'reading_writing', b.reading_writing,
                                             'math', b.math, 'taken_on', b.taken_on, 'test_name', b.test_name)
                     from bluebook_scores b where b.student_id = m.id
                    order by b.taken_on desc, b.created_at desc limit 1),
           'subjects', (
             select coalesce(jsonb_object_agg(x.subject, jsonb_build_object(
                      'sessions', coalesce((select jsonb_agg(e - 'teacher') from jsonb_array_elements(x.payload->'sessions') e), '[]'::jsonb),
                      'targeted', coalesce((select jsonb_agg(jsonb_build_object(
                                              'session_id', e->'session_id', 'section', e->'section', 'skill', e->'skill',
                                              'skills', e->'skills', 'set_size', e->'set_size', 'set_count', e->'set_count',
                                              'set_by_skill', e->'set_by_skill'))
                                              from jsonb_array_elements(x.payload->'targeted') e), '[]'::jsonb),
                      'items',    coalesce((select jsonb_agg(jsonb_build_object(
                                              'session_id', e->'session_id', 'section', e->'section', 'skill', e->'skill',
                                              'status', e->'status', 'is_correct', e->'is_correct', 'timed_out', e->'timed_out'))
                                              from jsonb_array_elements(x.payload->'items') e), '[]'::jsonb),
                      'config',   x.payload->'config')), '{}'::jsonb)
               from (select s.subject, progress_payload(m.id, s.subject) as payload
                       from (select distinct subject from sessions
                              where student_id = m.id and status <> 'cancelled') s) x)
         ) order by m.full_name), '[]'::jsonb)
    into v_out
    from mine m;

  return v_out;
end $$;

revoke execute on function public.students_overview() from public, anon, authenticated;
grant  execute on function public.students_overview() to authenticated;
