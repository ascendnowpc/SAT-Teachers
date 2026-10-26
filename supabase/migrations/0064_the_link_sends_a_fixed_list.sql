-- ============================================================================
--  0064 — the link sends a fixed list
--
--  session_by_token built a lesson's payload from whole rows: to_jsonb of the
--  session minus two columns, and to_jsonb of each question. Whatever a later
--  migration added to either table went to the student's browser without
--  anybody deciding it should — and some of what was already there should
--  not: the session's level and the tests the student had sat (which test a
--  question came from is the teacher's judgement, kept off the student's
--  screen since 0047), the teacher's private notes' neighbours, and on every
--  question its difficulty, the sentence saying why it is at that level, its
--  source reference, its section and skill and its target time.
--
--  This names the fields instead — the ones the student's screen reads, and
--  no others — the way the targeted payload has from the start (0062). A
--  column added to sessions, session_items or questions from now on stays off
--  the link until somebody adds it here.
--
--    session   id, mode, status, subject, title, scheduled_at, duration_mins,
--              meeting_url, opened_early_at, started_at, ended_at,
--              question_count, answered_count; the student's name and display
--              id; the teacher's name.
--    items     every question put in front of the student (never a staged
--              one): its place, its status and moments, what they picked,
--              crossed out and how sure they were, and — only once the
--              teacher publishes the results — the result, the right option
--              and the explanation.
--    question  id, subject, passage, underline, stem, figure, and the options
--              as label and body.
--
--  Not in it, whatever the tables hold: the token, the key, is_correct, the
--  level, the tests sat, the teacher's notes, a question's difficulty, its
--  rationale, source, section, skill or target, or anybody's uuid but the
--  session's, the items' and the questions'.
--
--  The targeted branch is 0062's, unchanged.
-- ============================================================================

create or replace function public.session_by_token(p_token text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_session sessions;
begin
  select * into v_session from sessions where id = session_for_token(p_token);

  if v_session.mode = 'targeted' then
    perform targeted_lock(v_session.id);
    perform targeted_step(v_session.id, interval '2 seconds');
    return targeted_payload(v_session.id);
  end if;

  return jsonb_build_object(
    'session', jsonb_build_object(
      'id',              v_session.id,
      'mode',            v_session.mode,
      'status',          v_session.status,
      'subject',         v_session.subject,
      'title',           v_session.title,
      'scheduled_at',    v_session.scheduled_at,
      'duration_mins',   v_session.duration_mins,
      'meeting_url',     v_session.meeting_url,
      'opened_early_at', v_session.opened_early_at,
      'started_at',      v_session.started_at,
      'ended_at',        v_session.ended_at,
      'question_count',  v_session.question_count,
      'answered_count',  v_session.answered_count,
      'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                    from profiles p where p.id = v_session.student_id),
      'teacher', (select jsonb_build_object('full_name', p.full_name)
                    from profiles p where p.id = v_session.teacher_id)),
    'items', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',                      si.id,
               'session_id',              si.session_id,
               'sequence_no',             si.sequence_no,
               'asked_no',                si.asked_no,
               'status',                  si.status,
               'published_at',            si.published_at,
               'first_viewed_at',         si.first_viewed_at,
               'decided_at',              si.decided_at,
               'answered_at',             si.answered_at,
               'revealed_at',             si.revealed_at,
               'selected_option',         si.selected_option,
               'eliminated_options',      si.eliminated_options,
               'student_confidence',      si.student_confidence,
               'revealed_result',         si.revealed_result,
               'revealed_correct_option', si.revealed_correct_option,
               'revealed_explanation',    si.revealed_explanation,
               'questions', jsonb_build_object(
                 'id',                q.id,
                 'subject',           q.subject,
                 'passage',           q.passage,
                 'passage_underline', q.passage_underline,
                 'stem',              q.stem,
                 'image_url',         q.image_url,
                 'question_options', coalesce((
                   select jsonb_agg(jsonb_build_object('id', o.id, 'label', o.label, 'body', o.body)
                                    order by o.label)
                     from question_options o where o.question_id = q.id), '[]'::jsonb)))
             order by si.sequence_no)
        from session_items si
        join questions q on q.id = si.question_id
       where si.session_id = v_session.id
         and si.status <> 'staged'), '[]'::jsonb));
end $$;

comment on function public.session_by_token(text) is
  'The student''s session, on their link: a fixed list of fields for a lesson (0064) and for a targeted test (0062). Never the token, the key, the level or a question''s difficulty, rationale, source or skill.';
