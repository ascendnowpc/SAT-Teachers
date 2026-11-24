-- ============================================================================
--  0104 — my students, at a glance
--
--  The section-tracker scope's PC view (F9) and teacher view (F10): one list
--  of the students someone is responsible for, each with their next SAT, their
--  goal against their latest score, and the domains improving or stuck.
--
--    students_overview()
--
--  Who is in it, by who asks:
--
--    a PC        the students assigned to them (profiles.pc_id)
--    a teacher   every student they have a session with, not cancelled
--    an admin    every student
--
--  For each: name, ID and PC; the goal (0101); the latest SAT score (0088);
--  and, per subject, the rows the progress pages read — progress_payload
--  (0070) cut down as student_report cuts it, so the list's "improving" and
--  "stuck" come from the same functions as every progress page
--  (lib/subjectProgress), never from a second rule written here.
-- ============================================================================

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
           'goal', (select jsonb_build_object('target_rw', g.target_rw, 'target_math', g.target_math,
                                              'next_test_on', g.next_test_on,
                                              'registration_deadline_on', g.registration_deadline_on,
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

comment on function public.students_overview() is
  'The students a PC is assigned, a teacher teaches, or (for an admin) every student: goal, latest SAT and the progress rows by subject (0104).';
