-- ============================================================================
--  0095 — an option can be a figure
--
--  A handful of College Board's maths questions ask "which table gives three
--  values of x…" or "which graph represents the system?", and answer it with
--  four tables or four graphs. The option is the figure: there is no sentence
--  under the B that could carry it, and nothing to read out of it.
--
--  So an option may have a figure of its own, beside the one the question
--  already has (0020). Both are optional and independent: a question may have
--  a stimulus and plain options, plain prose and four figures, or neither.
--
--  WHAT THE APP DOES WITH IT. The choice shows the figure where its wording
--  would go, and keeps the label it is chosen by — so a student still picks A,
--  B, C or D, the answer is still a letter, and nothing about marking,
--  reporting or the key changes.
--
--  THE BODY STAYS. An option whose figure carries it has an empty body rather
--  than no body, because body is the wording and these have none. Every
--  question in the bank is still answered by choosing a label.
--
--  RE-RUNNABLE, and nothing already in the bank changes: the column is added
--  empty, and the loader only writes it when the import hands it one.
-- ============================================================================

alter table question_options add column if not exists image_url text;

comment on column question_options.image_url is
  'The figure this option is, where the option is a figure rather than wording (0095).';

-- ---------------------------------------------------------- the loader ---
-- seed_pool_question (0074) unchanged but for the options it writes: each may
-- now carry an image_url beside its label and body. An import that does not
-- hand one over — which is every one before this — writes null, as it did.
create or replace function public.seed_pool_question(
  p_source_ref  text,
  p_subject     text,
  p_section     text,
  p_skill       text,
  p_difficulty  difficulty_level,
  p_passage     text,
  p_stem        text,
  p_image_url   text,
  p_options     jsonb,
  p_correct     answer_option,
  p_accepted    text[],
  p_explanation text
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_entry boolean := p_accepted is not null and cardinality(p_accepted) > 0;
  v_pool  uuid;
  qid     uuid;
  v_pos   int;
begin
  if v_entry = (p_correct is not null) then
    raise exception 'a question is answered by choosing an option or by writing one: %', p_source_ref;
  end if;

  select id into v_pool
    from question_sets
   where kind = 'practice' and is_active and subject = p_subject;
  if v_pool is null then
    raise exception 'no practice pool for %', p_subject;
  end if;

  select id into qid from questions where source_ref = p_source_ref;

  if qid is null then
    insert into questions (created_by, subject, section, skill, passage, stem, difficulty,
                           image_url, source_ref, status, answer_kind)
    values (null, p_subject, p_section, p_skill, nullif(btrim(p_passage), ''), p_stem,
            p_difficulty, nullif(btrim(p_image_url), ''), p_source_ref, 'published',
            case when v_entry then 'entry' else 'choice' end)
    returning id into qid;
  else
    update questions
       set subject     = p_subject,
           section     = p_section,
           skill       = p_skill,
           passage     = nullif(btrim(p_passage), ''),
           stem        = p_stem,
           difficulty  = p_difficulty,
           image_url   = nullif(btrim(p_image_url), ''),
           answer_kind = case when v_entry then 'entry' else 'choice' end,
           updated_at  = now()
     where id = qid;
  end if;

  -- Wholesale, not a diff: the key names a label, so an option that moved
  -- under a diff would leave the key pointing somewhere else (0020).
  delete from question_options where question_id = qid;
  if not v_entry then
    insert into question_options (question_id, label, body, image_url)
    select qid, (o->>'label')::answer_option, o->>'body',
           nullif(btrim(coalesce(o->>'image_url', '')), '')
    from jsonb_array_elements(coalesce(p_options, '[]'::jsonb)) o;
  end if;

  insert into question_keys (question_id, correct_option, accepted, explanation)
  values (qid, p_correct, case when v_entry then p_accepted end, nullif(btrim(p_explanation), ''))
  on conflict (question_id) do update
    set correct_option = excluded.correct_option,
        accepted       = excluded.accepted,
        explanation    = excluded.explanation,
        updated_at     = now();

  if not exists (select 1 from question_set_items where set_id = v_pool and question_id = qid) then
    select coalesce(max(position), 0) + 1 into v_pos from question_set_items where set_id = v_pool;
    insert into question_set_items (set_id, question_id, position) values (v_pool, qid, v_pos);
  end if;

  return qid;
end $$;

revoke execute on function public.seed_pool_question(
  text, text, text, text, difficulty_level, text, text, text, jsonb, answer_option, text[], text)
  from public, anon, authenticated;

comment on function public.seed_pool_question(
  text, text, text, text, difficulty_level, text, text, text, jsonb, answer_option, text[], text) is
  'Writes one College Board question into a subject''s practice pool, by source_ref (0074, 0095). Re-runnable; reachable by nobody but a migration.';


-- ------------------------------------- the option as everything else sees it
-- Three functions wrote an option as its label and its body, which was all an
-- option was. Each is restated here with its figure beside them and nothing
-- else changed, so the student's screen, the stored report and a teacher's own
-- edit all carry it.
--
--   session_by_token   the fixed list a student's link sends (0064)
--   targeted_payload   the report a finished targeted test is kept as (0073)
--   update_question    a teacher rewriting a question (0020)

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
                   select jsonb_agg(jsonb_build_object('id', o.id, 'label', o.label, 'body', o.body,
                                                        'image_url', o.image_url)
                                    order by o.label)
                     from question_options o where o.question_id = q.id), '[]'::jsonb)))
             order by si.sequence_no)
        from session_items si
        join questions q on q.id = si.question_id
       where si.session_id = v_session.id
         and si.status <> 'staged'), '[]'::jsonb));
end $$;

create or replace function public.targeted_payload(p_session uuid)
returns jsonb
language sql security definer set search_path = public as $$
  select jsonb_build_object(
    'server_now', now(),
    'session', jsonb_build_object(
      'id',              s.id,
      'mode',            s.mode,
      'status',          s.status,
      'subject',         s.subject,
      'title',           s.title,
      'scheduled_at',    s.scheduled_at,
      'opened_early_at', s.opened_early_at,
      'started_at',      s.started_at,
      'ended_at',        s.ended_at,
      'student',         (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                            from profiles p where p.id = s.student_id),
      'teacher',         (select jsonb_build_object('full_name', p.full_name)
                            from profiles p where p.id = s.teacher_id)),
    'targeted', jsonb_build_object(
      'question_count',  (select count(*) from targeted_set_items where session_id = s.id),
      'overall_seconds', t.overall_seconds,
      'deadline',        s.started_at + make_interval(secs => t.overall_seconds)),
    'items', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',                      si.id,
               'sequence_no',             si.sequence_no,
               'status',                  si.status,
               'first_viewed_at',         si.first_viewed_at,
               'time_limit_seconds',      si.time_limit_seconds,
               'answered_at',             si.answered_at,
               'decided_at',              si.decided_at,
               'selected_option',         si.selected_option,
               'entered_answer',          si.entered_answer,
               'eliminated_options',      si.eliminated_options,
               'student_confidence',      si.student_confidence,
               'skipped',                 coalesce((select a.skipped from session_item_assessments a
                                                     where a.session_item_id = si.id), false),
               'revealed_result',         si.revealed_result,
               'revealed_correct_option', si.revealed_correct_option,
               'revealed_answer',         si.revealed_answer,
               'revealed_explanation',    si.revealed_explanation,
               'question', jsonb_build_object(
                 'id',                q.id,
                 'subject',           q.subject,
                 'answer_kind',       q.answer_kind,
                 'passage',           q.passage,
                 'passage_underline', q.passage_underline,
                 'stem',              q.stem,
                 'image_url',         q.image_url,
                 'options', coalesce((select jsonb_agg(jsonb_build_object('label', o.label, 'body', o.body,
                                                                         'image_url', o.image_url)
                                                       order by o.label)
                                        from question_options o where o.question_id = q.id), '[]'::jsonb)))
             order by si.sequence_no)
        from session_items si
        join questions q on q.id = si.question_id
       where si.session_id = s.id
         and si.status <> 'staged'), '[]'::jsonb))
    from sessions s
    join targeted_tests t on t.session_id = s.id
   where s.id = p_session;
$$;

create or replace function public.update_question(
  p_question             uuid,
  p_subject              text,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null,
  p_image_url            text default null
) returns uuid
language plpgsql security invoker set search_path = public as $$
declare
  labels   text[];
  v_figures jsonb;
begin
  select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;
  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;

  -- RLS decides whether this row is theirs to change; a row they may not touch
  -- updates nothing, and the check below turns that into an error they can read.
  update questions
     set subject              = p_subject,
         section              = nullif(p_section, ''),
         skill                = nullif(p_skill, ''),
         passage              = nullif(p_passage, ''),
         passage_underline    = nullif(p_passage_underline, ''),
         stem                 = p_stem,
         difficulty           = p_difficulty,
         difficulty_rationale = nullif(p_difficulty_rationale, ''),
         image_url            = nullif(p_image_url, ''),
         updated_at           = now()
   where id = p_question;

  if not found then raise exception 'that question is not yours to edit'; end if;

  -- Wholesale, not a diff: the key points at a label, so an option that moved
  -- under a diff would leave the key pointing somewhere else.
  -- An option that is a figure (0095) keeps it. The editor has no field for
  -- one and sends none, so without this a teacher correcting a word of the
  -- stem would quietly drop four tables. Held by label, which is what the
  -- student chooses and what the key already names.
  select coalesce(jsonb_object_agg(label::text, image_url), '{}'::jsonb) into v_figures
    from question_options where question_id = p_question and image_url is not null;

  delete from question_options where question_id = p_question;
  insert into question_options (question_id, label, body, image_url)
  select p_question, (o->>'label')::answer_option, o->>'body',
         coalesce(nullif(btrim(coalesce(o->>'image_url', '')), ''),
                  v_figures->>(o->>'label'))
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (p_question, p_correct, nullif(p_explanation, ''))
  on conflict (question_id) do update
    set correct_option = excluded.correct_option,
        explanation    = excluded.explanation,
        updated_at     = now();

  return p_question;
end $$;
