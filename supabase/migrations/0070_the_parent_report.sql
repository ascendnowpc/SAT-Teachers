-- ============================================================================
--  0070 — the parent report, inside the student's account
--
--  The brief's parent report: simple, visual, screenshot-ready, opened with
--  the student's ID and no login of the parent's own — the headline progress
--  ("Writing 2/15 → 5/15 over 4 sessions"), a red / amber / green skill map
--  and the trend. A parent opens it from the student's account (0067: the
--  student ID and PIN), at /student/report.
--
--  It is drawn from the same numbers as the staff's progress page, so the two
--  cannot disagree: student_progress's body moves into progress_payload,
--  which checks nothing and is reachable by nobody, and student_progress keeps
--  its check and returns it — unchanged for every caller it had.
--
--  student_report(key) returns that payload for each subject the student has
--  sessions in, cut down to what the card draws from: per question, only its
--  session, section, skill, status, right or wrong and whether it timed out.
--  No question id, difficulty or timing (the student is never told which
--  level a question was, 0047), no teacher's name, and none of the teacher's
--  shared wording or summaries, which were written for the PC.
-- ============================================================================

create or replace function public.progress_payload(p_student uuid, p_subject text)
returns jsonb
language sql stable security definer set search_path = public as $$
  select jsonb_build_object(
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
  )
$$;

revoke execute on function public.progress_payload(uuid, text) from public, anon, authenticated;

-- 0063's door, its check unchanged, its body now progress_payload.
create or replace function public.student_progress(p_student uuid, p_subject text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if p_subject not in ('english', 'mathematics') then raise exception 'no such subject'; end if;

  if not (is_teacher()
          or (is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()))
          or coalesce(auth.jwt()->>'role', '') = 'service_role') then
    raise exception 'not your student';
  end if;

  return progress_payload(p_student, p_subject);
end $$;

revoke execute on function public.student_progress(uuid, text) from public, anon, authenticated;
grant  execute on function public.student_progress(uuid, text) to authenticated, service_role;

-- --------------------------------------------------- the student's door ----
create or replace function public.student_report(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare
  v_student uuid := student_for_key(p_key);
  v_subjects jsonb := '{}'::jsonb;
  v_subject text;
  v_payload jsonb;
begin
  for v_subject in
    select distinct s.subject from sessions s
     where s.student_id = v_student and s.status <> 'cancelled'
     order by 1
  loop
    v_payload := progress_payload(v_student, v_subject);
    v_subjects := v_subjects || jsonb_build_object(v_subject, jsonb_build_object(
      'sessions', coalesce((select jsonb_agg(e - 'teacher') from jsonb_array_elements(v_payload->'sessions') e), '[]'::jsonb),
      'targeted', coalesce((select jsonb_agg(jsonb_build_object(
                              'session_id', e->'session_id', 'section', e->'section', 'skill', e->'skill',
                              'set_size', e->'set_size', 'set_count', e->'set_count'))
                              from jsonb_array_elements(v_payload->'targeted') e), '[]'::jsonb),
      'items',    coalesce((select jsonb_agg(jsonb_build_object(
                              'session_id', e->'session_id', 'section', e->'section', 'skill', e->'skill',
                              'status', e->'status', 'is_correct', e->'is_correct', 'timed_out', e->'timed_out'))
                              from jsonb_array_elements(v_payload->'items') e), '[]'::jsonb),
      'config',   v_payload->'config'));
  end loop;

  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                  from profiles p where p.id = v_student),
    'at', now(),
    'subjects', v_subjects);
end $$;

revoke execute on function public.student_report(text) from public, anon, authenticated;
grant  execute on function public.student_report(text) to anon, authenticated;
