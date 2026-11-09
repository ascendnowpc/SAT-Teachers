-- ============================================================================
--  0072 — a question can be skipped
--
--  The brief tracks skipped questions as a warning sign — "skipping long
--  questions = anxiety". 0062 had no skip: a question ended when it was
--  answered or its clock ran out. A targeted test has a Skip button now.
--
--  A skip is recorded the way a time-out is (0062): the question is closed
--  with no option, counted as reached and wrong, and the next one comes up.
--  It stays forward-only — a skipped question does not come back — so the
--  clock and the score keep the meaning they had. What tells the two apart is
--  session_item_assessments.skipped: a time-out is something that happened to
--  the student, a skip is something they chose, and the brief wants the
--  second.
--
--  The student's own payload carries the flag on each item (it is their own
--  action, not a result), so their end screen can say "Skipped" rather than
--  "Time ran out"; the score straight after (0068) counts skips beside
--  time-outs.
-- ============================================================================

alter table session_item_assessments add column if not exists skipped boolean not null default false;

comment on column session_item_assessments.skipped is
  'The student pressed Skip on a targeted test''s question (0072): no option, counted wrong, not a time-out.';

-- Internal. The student skips the question on screen, then the next comes up.
create or replace function public.targeted_skip(p_session uuid, p_item uuid)
returns void
language plpgsql security definer set search_path = public as $$
declare
  v_status item_status;
  v_viewed timestamptz;
begin
  perform targeted_lock(p_session);
  perform targeted_expire(p_session, interval '2 seconds');

  select status into v_status from session_items where id = p_item;

  if v_status = 'published' then
    update session_items
       set status             = 'answered',
           answered_at        = now(),
           selected_option    = null,
           eliminated_options = '{}',
           student_confidence = null
     where id = p_item and status = 'published'
    returning first_viewed_at into v_viewed;

    insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds, timed_out, skipped)
    values (p_item, false, greatest(0, extract(epoch from (now() - coalesce(v_viewed, now())))::int), false, true)
    on conflict (session_item_id) do update
      set is_correct      = false,
          elapsed_seconds = excluded.elapsed_seconds,
          timed_out       = false,
          skipped         = true,
          graded_at       = now();
  elsif v_status in ('staged', 'voided') then
    raise exception 'that question is not open';
  end if;
  -- answered: its clock ran out a moment before the skip landed, or this is
  -- a repeat. Either way the test carries on, and a time-out stays a time-out.

  perform targeted_step(p_session, interval '2 seconds');
end $$;

revoke execute on function public.targeted_skip(uuid, uuid) from public, anon, authenticated;

-- The link's door, with the entry key (0066).
create or replace function public.skip_by_token(p_token text, p_item uuid)
returns void
language plpgsql security definer set search_path = public as $$
declare v_session uuid := session_for_token(p_token);
begin
  if not exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    raise exception 'only a targeted test has a skip';
  end if;
  if not exists (select 1 from session_items where id = p_item and session_id = v_session) then
    raise exception 'that question is not in this session';
  end if;
  perform targeted_skip(v_session, p_item);
end $$;

revoke execute on function public.skip_by_token(text, uuid) from public, anon, authenticated;
grant  execute on function public.skip_by_token(text, uuid) to anon, authenticated;

-- ------------------------------------------------- the student's payload ----
-- 0062's, with 'skipped' on each item.
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
               'eliminated_options',      si.eliminated_options,
               'student_confidence',      si.student_confidence,
               'skipped',                 coalesce((select a.skipped from session_item_assessments a
                                                     where a.session_item_id = si.id), false),
               'revealed_result',         si.revealed_result,
               'revealed_correct_option', si.revealed_correct_option,
               'revealed_explanation',    si.revealed_explanation,
               'question', jsonb_build_object(
                 'id',                q.id,
                 'subject',           q.subject,
                 'passage',           q.passage,
                 'passage_underline', q.passage_underline,
                 'stem',              q.stem,
                 'image_url',         q.image_url,
                 'options', coalesce((select jsonb_agg(jsonb_build_object('label', o.label, 'body', o.body)
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

revoke execute on function public.targeted_payload(uuid) from public, anon, authenticated;

-- ------------------------------------------------------ the score (0068) ----
-- 0069's, with the skips counted.
create or replace function public.targeted_result(p_session uuid)
returns jsonb
language sql stable security definer set search_path = public as $$
  with s as (
    select s.id, (select count(*) from targeted_set_items x where x.session_id = s.id) as set_count
      from sessions s
      join targeted_tests t on t.session_id = s.id
     where s.id = p_session and s.mode = 'targeted' and s.status = 'completed'
  ),
  met as (
    select q.section, q.skill, coalesce(a.is_correct, false) as right_one,
           coalesce(a.timed_out, false) as timed_out, coalesce(a.skipped, false) as skipped
      from s
      join session_items i on i.session_id = s.id and i.status in ('answered', 'revealed')
      join questions q on q.id = i.question_id
      left join session_item_assessments a on a.session_item_id = i.id
  )
  select case when not exists (select 1 from s) then null else
    jsonb_build_object(
      'right',       (select count(*) from met where right_one),
      'reached',     (select count(*) from met),
      'timed_out',   (select count(*) from met where timed_out),
      'skipped',     (select count(*) from met where skipped),
      'not_reached', greatest(0, (select set_count from s) - (select count(*) from met)),
      'skills', coalesce((
        select jsonb_agg(jsonb_build_object('section', section, 'skill', skill, 'right', r, 'of', n)
                         order by r::numeric / n, skill)
          from (select section, skill, count(*) filter (where right_one) as r, count(*) as n
                  from met group by section, skill) g), '[]'::jsonb))
  end
$$;

revoke execute on function public.targeted_result(uuid) from public, anon, authenticated;

comment on function public.advance_by_token(text, uuid) is
  'Moves a targeted test on once the question''s time is up: records it timed out and shows the next. Before then it moves nothing; skipping is skip_by_token (0072).';
