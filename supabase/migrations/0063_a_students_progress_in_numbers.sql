-- ============================================================================
--  0063 — a student's progress, in numbers
--
--  The line a PC reads — baseline on a skill, then every targeted test on it,
--  and the sessions between — is computed in the browser from rows (lib/
--  progress.ts), the rule the report keeps. But the rows are not all in reach
--  of the people who read the line:
--
--    * a teacher reads only their own sessions (0005), and a student's
--      baseline and progress run across every teacher they have had;
--    * the PC has no policy on skill_summaries or verdict_overrides (0061), so
--      a draft cannot reach them through its row.
--
--  student_progress(student, subject) is the one door, for staff and for the
--  student's own PC. It returns numbers and ids only:
--
--    sessions   every session in the subject: id, mode, status, when, and the
--               teacher's name. Cancelled ones are left out.
--    targeted   what each targeted test was on and how it was clocked, and how
--               many questions its set held — not which.
--    items      every question put in front of the student in the subject and
--               not still on screen or staged: the question's id, section,
--               skill, level and target, and whether it was right, timed out,
--               and how long it took. No option chosen, no key.
--    config     the subject's progress_config.
--    summaries  the shared copy of each summary on the student. Never a draft.
--    overrides  the shared copy of each verdict override. Never a draft.
--
--  The question's words are not here: staff read the bank, and a PC reads the
--  questions put to their students (0055), so the browser fetches them by id
--  under RLS when it needs a format or a word count.
--
--  The drafts and the private notes stay where 0061 put them, read by staff
--  through their own policies.
-- ============================================================================

create or replace function public.student_progress(p_student uuid, p_subject text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if p_subject not in ('english', 'mathematics') then raise exception 'no such subject'; end if;

  if not (is_teacher()
          or (is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()))) then
    raise exception 'not your student';
  end if;

  return jsonb_build_object(
    'sessions', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',      s.id,
               'mode',    s.mode,
               'status',  s.status,
               'at',      coalesce(s.started_at, s.scheduled_at),
               'teacher', t.full_name)
             order by coalesce(s.started_at, s.scheduled_at))
        from sessions s
        left join profiles t on t.id = s.teacher_id
       where s.student_id = p_student and s.subject = p_subject and s.status <> 'cancelled'), '[]'::jsonb),

    'targeted', coalesce((
      select jsonb_agg(jsonb_build_object(
               'session_id',       tt.session_id,
               'section',          tt.section,
               'skill',            tt.skill,
               'set_size',         tt.set_size,
               'set_count',        (select count(*) from targeted_set_items x where x.session_id = tt.session_id),
               'question_seconds', tt.question_seconds,
               'overall_seconds',  tt.overall_seconds))
        from targeted_tests tt
        join sessions s on s.id = tt.session_id
       where s.student_id = p_student and s.subject = p_subject and s.status <> 'cancelled'), '[]'::jsonb),

    'items', coalesce((
      select jsonb_agg(jsonb_build_object(
               'session_id',         si.session_id,
               'question_id',        si.question_id,
               'section',            q.section,
               'skill',              q.skill,
               'difficulty',         q.difficulty,
               'status',             si.status,
               'is_correct',         a.is_correct,
               'timed_out',          coalesce(a.timed_out, false),
               'elapsed_seconds',    a.elapsed_seconds,
               'time_limit_seconds', si.time_limit_seconds,
               'target_seconds',     q.target_seconds)
             order by si.session_id, si.sequence_no)
        from session_items si
        join sessions s  on s.id = si.session_id
        join questions q on q.id = si.question_id
        left join session_item_assessments a on a.session_item_id = si.id
       where s.student_id = p_student and s.subject = p_subject and s.status <> 'cancelled'
         and si.status in ('answered', 'revealed', 'voided')), '[]'::jsonb),

    'config', (select to_jsonb(c) - 'updated_by' - 'updated_at' from progress_config c where c.subject = p_subject),

    'summaries', coalesce((
      select jsonb_agg(jsonb_build_object(
               'section', ss.section, 'skill', ss.skill, 'shared', ss.shared, 'shared_at', ss.shared_at))
        from skill_summaries ss
       where ss.student_id = p_student and ss.subject = p_subject and ss.shared is not null), '[]'::jsonb),

    'overrides', coalesce((
      select jsonb_agg(jsonb_build_object(
               'session_id',          v.session_id,
               'previous_session_id', v.previous_session_id,
               'shared_wording',      v.shared_wording,
               'shared_context',      v.shared_context,
               'shared_at',           v.shared_at))
        from verdict_overrides v
        join sessions s on s.id = v.session_id
       where s.student_id = p_student and s.subject = p_subject and v.shared_at is not null), '[]'::jsonb)
  );
end $$;

revoke execute on function public.student_progress(uuid, text) from public, anon, authenticated;
grant  execute on function public.student_progress(uuid, text) to authenticated;

comment on function public.student_progress(uuid, text) is
  'A student''s progress in a subject, as numbers and ids: sessions, targeted tests, the questions put to them with right/timed out/time (no option, no key), the config, and the shared copies of summaries and overrides — never a draft. Staff, and the student''s own PC (0063).';
