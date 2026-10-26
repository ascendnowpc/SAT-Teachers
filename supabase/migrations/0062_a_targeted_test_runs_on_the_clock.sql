-- ============================================================================
--  0062 — a targeted test runs on the clock
--
--  0061 books a targeted test with its set. This is the student sitting it:
--  alone, on their link, forward only. Nobody shows the questions — the test
--  shows them itself, one at a time, in the order of the set — and nobody can
--  hold one up: a question is answered or its time runs out, and then the next
--  is on screen. There is no skipping and no going back.
--
--  Two clocks, both the server's:
--
--    the question's  session_items.time_limit_seconds, fixed when it is shown:
--                    the test's question_seconds, or the question's own
--                    target_seconds, or none (then only the overall clock
--                    applies). Counted from first_viewed_at, which the server
--                    sets as it shows the question — not the browser.
--    the overall     started_at + targeted_tests.overall_seconds.
--
--  There is no cron. Every call that touches a running targeted test — the
--  student's reads, answers and advances, and the console's — first expires
--  whatever is overdue:
--
--    * the question on screen whose own clock has run out is recorded as timed
--      out: answered, no option, wrong (session_item_assessments.timed_out),
--      and the next question comes up — at the moment it is actually shown,
--      so a student who closed the tab does not come back to a chain of
--      questions that expired while nobody was looking;
--    * when the overall clock runs out, the question on screen is timed out
--      too and the test ends.
--
--  An answer is accepted up to 2 seconds after either clock — the network is
--  not the student's fault. An advance (the browser saying "time is up") is
--  accepted from 1 second before the question's clock runs out, and refused
--  quietly before that: it moves nothing and says so.
--
--  How it ends:
--
--    * the set runs out, or the overall clock does: the test is over;
--    * the student leaves (finish_by_token), or the teacher ends it from the
--      console: overdue questions are expired first, then the question on
--      screen is set aside (voided), as in a lesson. It was not answered and
--      its time had not run out, so it is not reached — like every question of
--      the set the student never saw. Not reached is left out of the score.
--
--  What reaches the student is a fixed list of fields — no level, no
--  difficulty, no rationale, no source, no key, no result before results are
--  published, and nothing about a question that is not yet on screen except
--  how many there are ("Question 2 of 5").
--
--  The doors:
--
--    start_session_by_token  for a targeted test: opens it, locks the set
--                            (targeted_tests.locked_at) and shows question 1.
--    answer_by_token         grades through record_answer, then shows the next.
--                            An answer that arrives after the clock is not an
--                            error: the question is recorded as timed out, the
--                            next one is up, and the call returns.
--    advance_by_token        new. Moves on only once the question's time is up.
--    session_by_token        the targeted payload, after expiring.
--    finish_by_token         expires, then ends.
--    teacher_finish_session  expires, then ends.
--    targeted_tick           new, for the console: expires, and nothing else —
--                            it never shows a question, because a question's
--                            clock starts when the student can see it.
--
--  The signed-in student's own doors (start_session_as_student, submit_answer)
--  refuse a targeted test: it runs on the link, where the clocks are.
--
--  Every lesson keeps the code path it has today; each changed function
--  branches on mode and leaves the other branch as it was.
-- ============================================================================

-- ------------------------------------------------------------ internals ----

-- Internal. Serialises everything on one targeted test: an answer and an
-- expiry must not both act on the same question.
create or replace function public.targeted_lock(p_session uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform 1 from targeted_tests where session_id = p_session for update;
  if not found then raise exception 'this session is not a targeted test'; end if;
end $$;

revoke execute on function public.targeted_lock(uuid) from public, anon, authenticated;

-- Internal. The question on screen ran out of time at p_at.
create or replace function public.targeted_time_out(p_item uuid, p_at timestamptz)
returns void
language plpgsql security definer set search_path = public as $$
declare v_viewed timestamptz;
begin
  update session_items
     set status             = 'answered',
         answered_at        = p_at,
         selected_option    = null,
         eliminated_options = '{}',
         student_confidence = null
   where id = p_item and status = 'published'
  returning first_viewed_at into v_viewed;

  if not found then return; end if;

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds, timed_out)
  values (p_item, false,
          greatest(0, extract(epoch from (p_at - coalesce(v_viewed, p_at)))::int), true)
  on conflict (session_item_id) do update
    set is_correct      = false,
        elapsed_seconds = excluded.elapsed_seconds,
        timed_out       = true,
        graded_at       = now();
end $$;

revoke execute on function public.targeted_time_out(uuid, timestamptz) from public, anon, authenticated;

-- Internal. Times out whatever is overdue; ends the test when the overall
-- clock has run out, or the set has and nothing is on screen. p_slack moves
-- the question's clock: +2 s for anything that might carry an answer, -1 s for
-- an advance. The overall clock gets the slack only when it is positive.
create or replace function public.targeted_expire(p_session uuid, p_slack interval)
returns void
language plpgsql security definer set search_path = public as $$
declare
  v_status   session_status;
  v_deadline timestamptz;
  v_item     uuid;
  v_ends     timestamptz;
  v_grace    interval := greatest(p_slack, interval '0');
begin
  select s.status, s.started_at + make_interval(secs => t.overall_seconds)
    into v_status, v_deadline
    from sessions s join targeted_tests t on t.session_id = s.id
   where s.id = p_session;

  if v_status is distinct from 'live' then return; end if;

  select si.id, si.first_viewed_at + make_interval(secs => si.time_limit_seconds)
    into v_item, v_ends
    from session_items si
   where si.session_id = p_session and si.status = 'published'
   order by si.sequence_no
   limit 1;

  if v_item is not null then
    if now() >= v_deadline + v_grace then
      perform targeted_time_out(v_item, least(v_deadline, coalesce(v_ends, v_deadline)));
    elsif v_ends is not null and now() >= v_ends + p_slack then
      perform targeted_time_out(v_item, least(v_ends, now()));
    end if;
  end if;

  if now() >= v_deadline + v_grace then
    perform end_session_now(p_session);
    return;
  end if;

  if not exists (select 1 from session_items where session_id = p_session and status = 'published')
     and not exists (select 1 from targeted_set_items tsi
                      where tsi.session_id = p_session
                        and not exists (select 1 from session_items si
                                         where si.session_id = p_session
                                           and si.question_id = tsi.question_id)) then
    perform end_session_now(p_session);
  end if;
end $$;

revoke execute on function public.targeted_expire(uuid, interval) from public, anon, authenticated;

-- Internal. Puts the next question of the set on screen, clock running.
-- Returns the item, or null when the set has run out.
create or replace function public.targeted_show_next(p_session uuid)
returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_question uuid;
  v_student  uuid;
  v_seconds  int;
  v_seq      int;
  v_item     uuid;
begin
  select tsi.question_id into v_question
    from targeted_set_items tsi
   where tsi.session_id = p_session
     and not exists (select 1 from session_items si
                      where si.session_id = p_session and si.question_id = tsi.question_id)
   order by tsi.position
   limit 1;

  if v_question is null then return null; end if;

  select s.student_id, coalesce(t.question_seconds, q.target_seconds)
    into v_student, v_seconds
    from sessions s
    join targeted_tests t on t.session_id = s.id
    join questions q      on q.id = v_question
   where s.id = p_session;

  select coalesce(max(sequence_no), 0) + 1 into v_seq
    from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no, time_limit_seconds)
  values (p_session, v_question, v_student, v_seq, v_seconds)
  returning id into v_item;

  perform publish_one_item(v_item);

  -- The server's moment, not the browser's: the clock starts as it is shown.
  update session_items set first_viewed_at = now() where id = v_item;

  return v_item;
end $$;

revoke execute on function public.targeted_show_next(uuid) from public, anon, authenticated;

-- Internal. Expire, then, if the test is still running and nothing is on
-- screen, put the next question up — or end it when there is none.
create or replace function public.targeted_step(p_session uuid, p_slack interval)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform targeted_expire(p_session, p_slack);

  if exists (select 1 from sessions where id = p_session and status = 'live')
     and not exists (select 1 from session_items where session_id = p_session and status = 'published') then
    if targeted_show_next(p_session) is null then
      perform end_session_now(p_session);
    end if;
  end if;
end $$;

revoke execute on function public.targeted_step(uuid, interval) from public, anon, authenticated;

-- Internal. The student presses Start.
create or replace function public.targeted_start(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  perform targeted_lock(p_session);
  perform open_session_now(p_session);

  update targeted_tests set locked_at = coalesce(locked_at, now()) where session_id = p_session;

  perform targeted_step(p_session, interval '2 seconds');

  return (select count(*)::int from targeted_set_items where session_id = p_session);
end $$;

revoke execute on function public.targeted_start(uuid) from public, anon, authenticated;

-- Internal. An answer to the question on screen, then the next question.
create or replace function public.targeted_answer(
  p_session    uuid,
  p_item       uuid,
  p_option     answer_option,
  p_eliminated answer_option[],
  p_confidence smallint,
  p_reasoning  text
) returns void
language plpgsql security definer set search_path = public as $$
declare v_status item_status;
begin
  perform targeted_lock(p_session);
  perform targeted_expire(p_session, interval '2 seconds');

  select status into v_status from session_items where id = p_item;

  if v_status = 'published' then
    if p_option is null then raise exception 'choose an answer'; end if;
    perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
  elsif v_status in ('staged', 'voided') then
    raise exception 'that question is not open for answering';
  end if;
  -- answered: it timed out a moment ago, or this is a repeat of an answer
  -- already in. Either way the test carries on.

  perform targeted_step(p_session, interval '2 seconds');
end $$;

revoke execute on function public.targeted_answer(uuid, uuid, answer_option, answer_option[], smallint, text)
  from public, anon, authenticated;

-- Internal. The fixed payload a targeted test sends the student.
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

comment on function public.targeted_payload(uuid) is
  'What a targeted test sends its student: a fixed list of fields, no level, difficulty, rationale, source, key or result before results are published, and nothing about a question not yet on screen but how many there are (0062). Internal.';

-- ------------------------------------------------------------ the link -----

create or replace function public.start_session_by_token(p_token text)
returns int
language plpgsql security definer set search_path = public as $$
declare v_session uuid := session_for_token(p_token);
begin
  if exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    return targeted_start(v_session);
  end if;
  return open_session_now(v_session);
end $$;

create or replace function public.answer_by_token(
  p_token       text,
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void
language plpgsql security definer set search_path = public as $$
declare v_session uuid := session_for_token(p_token);
begin
  if not exists (select 1 from session_items
                  where id = p_item and session_id = v_session) then
    raise exception 'that question is not in this session';
  end if;
  if exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    perform targeted_answer(v_session, p_item, p_option, p_eliminated, p_confidence, p_reasoning);
    return;
  end if;
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;

-- New. The browser's "time is up". Returns whether anything moved.
create or replace function public.advance_by_token(p_token text, p_item uuid)
returns boolean
language plpgsql security definer set search_path = public as $$
declare
  v_session uuid := session_for_token(p_token);
  v_before  item_status;
  v_after   item_status;
begin
  if not exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    raise exception 'only a targeted test moves on by itself';
  end if;
  select status into v_before from session_items where id = p_item and session_id = v_session;
  if v_before is null then raise exception 'that question is not in this session'; end if;

  perform targeted_lock(v_session);
  perform targeted_step(v_session, interval '-1 second');

  select status into v_after from session_items where id = p_item;
  return v_after is distinct from v_before;
end $$;

revoke execute on function public.advance_by_token(text, uuid) from public, anon, authenticated;
grant  execute on function public.advance_by_token(text, uuid) to anon, authenticated;

comment on function public.advance_by_token(text, uuid) is
  'Moves a targeted test on once the question''s time is up: records it timed out and shows the next. Before then it moves nothing — there is no skipping (0062).';

create or replace function public.session_by_token(p_token text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_session sessions;
  v_out     jsonb;
begin
  select * into v_session from sessions where id = session_for_token(p_token);

  if v_session.mode = 'targeted' then
    perform targeted_lock(v_session.id);
    perform targeted_step(v_session.id, interval '2 seconds');
    return targeted_payload(v_session.id);
  end if;

  select jsonb_build_object(
    'session',
      (to_jsonb(v_session) - 'access_token' - 'teacher_notes')
      || jsonb_build_object(
           'student', (select jsonb_build_object('id', p.id, 'full_name', p.full_name,
                                                 'display_id', p.display_id)
                         from profiles p where p.id = v_session.student_id),
           'teacher', (select jsonb_build_object('id', p.id, 'full_name', p.full_name,
                                                 'display_id', p.display_id)
                         from profiles p where p.id = v_session.teacher_id)
         ),
    'items', coalesce((
      select jsonb_agg(
               to_jsonb(si) || jsonb_build_object('questions', q.body)
               order by si.sequence_no)
        from session_items si
        left join lateral (
          select to_jsonb(qq) || jsonb_build_object(
                   'question_options',
                   coalesce((select jsonb_agg(to_jsonb(o) order by o.label)
                               from question_options o where o.question_id = qq.id),
                            '[]'::jsonb)) as body
            from questions qq
           where qq.id = si.question_id
        ) q on true
       where si.session_id = v_session.id
         and si.status <> 'staged'
    ), '[]'::jsonb)
  ) into v_out;

  return v_out;
end $$;

create or replace function public.finish_by_token(p_token text)
returns int
language plpgsql security definer set search_path = public as $$
declare v_session uuid := session_for_token(p_token);
begin
  if exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    perform targeted_lock(v_session);
    perform targeted_expire(v_session, interval '2 seconds');
  end if;
  return end_session_now(v_session);
end $$;

-- ------------------------------------------------------------ the console --

create or replace function public.teacher_finish_session(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_status session_status; v_mode text;
begin
  perform assert_session_teacher(p_session);

  select status, mode into v_status, v_mode from sessions where id = p_session;
  if v_status = 'scheduled' then raise exception 'the test has not started yet'; end if;

  if v_mode = 'targeted' then
    perform targeted_lock(p_session);
    perform targeted_expire(p_session, interval '2 seconds');
  end if;

  return end_session_now(p_session);
end $$;

-- New. The console's read of a running targeted test expires first, so what
-- the teacher watches is what the clocks say. It never shows a question.
create or replace function public.targeted_tick(p_session uuid)
returns text
language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
  perform targeted_lock(p_session);
  perform targeted_expire(p_session, interval '2 seconds');
  return (select status::text from sessions where id = p_session);
end $$;

revoke execute on function public.targeted_tick(uuid) from public, anon, authenticated;
grant  execute on function public.targeted_tick(uuid) to authenticated;

comment on function public.targeted_tick(uuid) is
  'Expires whatever is overdue on a targeted test and returns its status. Never shows a question. The session''s teacher or an admin (0062).';

-- ------------------------------------------- the signed-in student's doors --

create or replace function public.start_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from sessions where id = p_session and student_id = auth.uid()) then
    raise exception 'not your session';
  end if;
  perform assert_not_targeted(p_session);
  return open_session_now(p_session);
end $$;

create or replace function public.submit_answer(
  p_item       uuid,
  p_option     answer_option,
  p_eliminated answer_option[],
  p_confidence smallint,
  p_reasoning  text
) returns void
language plpgsql security definer set search_path = public as $$
declare v_session uuid;
begin
  select session_id into v_session from session_items where id = p_item and student_id = auth.uid();
  if v_session is null then
    raise exception 'not your question';
  end if;
  perform assert_not_targeted(v_session);
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;
