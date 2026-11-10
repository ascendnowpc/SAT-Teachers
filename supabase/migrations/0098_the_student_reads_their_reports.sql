-- ============================================================================
--  0098 — the student, and the family, read every report
--
--  A report was the staff's and the PC's: the teacher or an admin generates a
--  lesson's report, the PC is emailed it as a PDF (0055), and a targeted test's
--  report is computed the moment the test is over (0062). The family saw it
--  only if the PC passed it on. Now the student's own account (0067, the ID and
--  PIN a parent signs in with too) reads them, every one, at /student/reports:
--
--    a lesson's report      once it has been generated or published — the
--                           moment the PC is sent it, and not before. A form
--                           still being written is the teacher's.
--    a targeted test's      once the test is over, as the PC's PDF has it.
--
--  It is the same report the PC is sent, not a second one: these doors return
--  the rows that report is drawn from, and the page draws it with the very
--  function the PC's PDF is drawn with (lessonDocFrom, targetedDocFrom), so
--  the two cannot say different things.
--
--    student_report_list(key)            who they are and their PC, and every
--                                        report that is ready, newest first,
--                                        with its score.
--    student_session_report(key, id)     one report's rows. "no such report"
--                                        for a session that is not theirs or
--                                        whose report is not ready.
--
--  What the rows leave out is what the report never reads: the student's id
--  on each item and the explanation shown with its result, a question's
--  options, key, rationale and source, who generated or handed in the form,
--  the transcript itself (only when it went in, to tell whether the reading
--  is of it), and the targeted set's own questions beyond those the student
--  met.
-- ============================================================================

-- Internal. The session, if it is this student's and its report is ready.
create or replace function public.student_report_ready(p_student uuid, p_session uuid)
returns boolean
language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from sessions s
     where s.id = p_session
       and s.student_id = p_student
       and s.status <> 'cancelled'
       and ((s.mode = 'targeted' and s.status = 'completed')
            or (s.mode <> 'targeted' and exists (
                  select 1 from session_reports r
                   where r.session_id = s.id
                     and (r.generated_at is not null or r.status = 'published')))))
$$;

revoke execute on function public.student_report_ready(uuid, uuid) from public, anon, authenticated;

-- ------------------------------------------------------------- the list ----
create or replace function public.student_report_list(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id, 'pc', p.pc)
                  from profiles p where p.id = v_student),
    'reports', coalesce((
      select jsonb_agg(x.row order by x.at desc)
        from (
          select coalesce(s.started_at, s.scheduled_at) as at,
                 jsonb_build_object(
                   'session_id', s.id,
                   'kind',       case when s.mode = 'targeted' then 'targeted' else 'lesson' end,
                   'mode',       s.mode,
                   'subject',    s.subject,
                   'title',      s.title,
                   'at',         coalesce(s.started_at, s.scheduled_at),
                   'ready_at',   case when s.mode = 'targeted' then coalesce(s.ended_at, s.scheduled_at)
                                      else coalesce(r.generated_at, r.published_at) end,
                   'published',  case when s.mode = 'targeted' then true else r.status = 'published' end,
                   'teacher',    t.full_name,
                   'section',    tt.section,
                   'skill',      tt.skill,
                   'skills',     tt.skills,
                   'right',      case when s.mode = 'targeted'
                                      then (select (tr->>'right')::int from targeted_result(s.id) tr)
                                      else (select count(*) from session_items i
                                              left join session_item_assessments a on a.session_item_id = i.id
                                             where i.session_id = s.id and i.status in ('answered', 'revealed')
                                               and coalesce(a.is_correct, i.revealed_result = 'correct'))
                                 end,
                   'of',         case when s.mode = 'targeted'
                                      then (select (tr->>'reached')::int from targeted_result(s.id) tr)
                                      else (select count(*) from session_items i
                                             where i.session_id = s.id and i.status in ('answered', 'revealed'))
                                 end) as row
            from sessions s
            left join session_reports r on r.session_id = s.id
            left join targeted_tests tt on tt.session_id = s.id
            left join profiles t on t.id = s.teacher_id
           where s.student_id = v_student
             and student_report_ready(v_student, s.id)) x), '[]'::jsonb));
end $$;

revoke execute on function public.student_report_list(text) from public, anon, authenticated;
grant  execute on function public.student_report_list(text) to anon, authenticated;

comment on function public.student_report_list(text) is
  'Every report of the signed-in student that is ready — a lesson''s once generated or published, a targeted test''s once over — newest first, with its score (0098).';

-- ------------------------------------------------------------- one report --
create or replace function public.student_session_report(p_key text, p_session uuid)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare
  v_student uuid := student_for_key(p_key);
  v_session sessions;
  v_out     jsonb;
begin
  if not student_report_ready(v_student, p_session) then
    raise exception 'no such report';
  end if;
  select * into v_session from sessions where id = p_session;

  v_out := jsonb_build_object(
    'kind', case when v_session.mode = 'targeted' then 'targeted' else 'lesson' end,
    'session', (
      select jsonb_build_object(
               'id',            s.id,
               'subject',       s.subject,
               'title',         s.title,
               'mode',          s.mode,
               'scheduled_at',  s.scheduled_at,
               'started_at',    s.started_at,
               'duration_mins', s.duration_mins,
               'teacher_notes', s.teacher_notes,
               'teacher',       jsonb_build_object('full_name', t.full_name),
               'student',       jsonb_build_object('full_name', st.full_name, 'display_id', st.display_id, 'pc', st.pc))
        from sessions s
        left join profiles t  on t.id = s.teacher_id
        join profiles st      on st.id = s.student_id
       where s.id = p_session),
    -- The rows the report reads, shaped as the staff's pages read them:
    -- the question and the assessment nested under each item.
    'items', coalesce((
      select jsonb_agg(
               (to_jsonb(i) - 'student_id' - 'revealed_explanation')
               || jsonb_build_object(
                    'questions', jsonb_build_object(
                       'id', q.id, 'subject', q.subject, 'section', q.section, 'skill', q.skill,
                       'difficulty', q.difficulty, 'passage', q.passage,
                       'passage_underline', q.passage_underline, 'stem', q.stem,
                       'image_url', q.image_url, 'target_seconds', q.target_seconds,
                       'answer_kind', q.answer_kind),
                    'session_item_assessments', case when a.session_item_id is null then null
                                                     else to_jsonb(a) end)
             order by i.sequence_no)
        from session_items i
        join questions q on q.id = i.question_id
        left join session_item_assessments a on a.session_item_id = i.id
       where i.session_id = p_session and i.status <> 'staged'), '[]'::jsonb),
    'progress', progress_payload(v_student, v_session.subject));

  if v_session.mode = 'targeted' then
    v_out := v_out || jsonb_build_object(
      'test', (select to_jsonb(tt) - 'created_by' from targeted_tests tt where tt.session_id = p_session),
      'set_count', (select count(*) from targeted_set_items x where x.session_id = p_session),
      -- The questions behind the long-question pattern: every question the
      -- student met on a targeted test in this subject. The page pools the
      -- ones on this test's lines, as the PC's PDF does.
      'questions', coalesce((
        select jsonb_agg(distinct jsonb_build_object(
                 'id', q.id, 'difficulty', q.difficulty, 'passage', q.passage,
                 'passage_underline', q.passage_underline, 'stem', q.stem,
                 'image_url', q.image_url, 'target_seconds', q.target_seconds))
          from session_items i
          join sessions s  on s.id = i.session_id
          join questions q on q.id = i.question_id
         where s.student_id = v_student and s.subject = v_session.subject and s.mode = 'targeted'
           and s.status <> 'cancelled' and i.status in ('answered', 'revealed', 'voided')), '[]'::jsonb));
  else
    v_out := v_out || jsonb_build_object(
      'notes', coalesce((select jsonb_agg(to_jsonb(n)) from session_domain_notes n where n.session_id = p_session), '[]'::jsonb),
      'meta', (select to_jsonb(r) - 'generated_by' - 'form_submitted_by' from session_reports r where r.session_id = p_session),
      'transcript_at', (select tr.created_at from session_transcripts tr where tr.session_id = p_session),
      'reading', (select jsonb_build_object('body', e.body, 'created_at', e.created_at)
                    from session_context_extractions e where e.session_id = p_session));
  end if;

  return v_out;
end $$;

revoke execute on function public.student_session_report(text, uuid) from public, anon, authenticated;
grant  execute on function public.student_session_report(text, uuid) to anon, authenticated;

comment on function public.student_session_report(text, uuid) is
  'One report''s rows for the signed-in student, drawn on the page by the function that draws the PC''s PDF (0098). "no such report" when it is not theirs or not ready.';
