-- ============================================================================
--  0033 — the session is a link, and the link is the whole login
--
--  A student had to have an account to sit a test: sign up, confirm, sign in,
--  find the session, open it.  Five steps before the first question, every one
--  of them a place to get stuck, and all five of them in service of proving
--  the student is who they say they are — which the teacher already knows,
--  because they are on the call together.
--
--  So a session carries a token, the token is a URL, and the teacher sends it.
--  Opening it puts the student in their own session with no account anywhere
--  in the story.  0032 already made the student a roster row rather than an
--  account; this is the other half of that.
--
--  What the token is worth is exactly one session.  It is 64 hex characters
--  from two uuids — not guessable — and every function below takes it, finds
--  the one session it names, and does the same thing that session's student
--  could already do.  Nothing else is reachable with it: no other session, no
--  profile beyond the two names on this one, and never the answer key.
--
--  The shape of the change is a refactor first.  Every action a student can
--  take had its permission check and its work in one function; the work moves
--  into an internal function and the checks stay where they were.  The token
--  functions are then the same work behind a different check, rather than a
--  second copy of the logic that can drift from the first.
-- ============================================================================

-- ---------------------------------------------------------------- token ----
create or replace function public.new_session_token()
returns text language sql volatile set search_path = public as $$
  -- Two uuids, hyphens out. 64 hex characters, and no extension to install.
  select replace(gen_random_uuid()::text, '-', '') || replace(gen_random_uuid()::text, '-', '')
$$;

revoke execute on function public.new_session_token() from public;

alter table sessions add column if not exists access_token text;
update sessions set access_token = new_session_token() where access_token is null;
alter table sessions alter column access_token set default new_session_token();
alter table sessions alter column access_token set not null;

create unique index if not exists sessions_access_token_key on sessions (access_token);

comment on column sessions.access_token is
  'The student''s way in. /s/<token> opens this session and nothing else, with no account. Teacher-readable through the sessions policy; never returned by the token RPCs below.';

-- ============================================================================
--  The work, without the checks
-- ============================================================================

-- ------------------------------------------------------------- opening -----
-- 0027's start_session_as_student, from the line after "not your session".
create or replace function public.open_session_now(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_scheduled timestamptz;
  v_early     timestamptz;
  v_status    session_status;
  v_level     text;
  v_open      int;
  v_first     uuid;
begin
  select scheduled_at, opened_early_at, status, level
    into v_scheduled, v_early, v_status, v_level
    from sessions where id = p_session;

  if not found then raise exception 'no such session'; end if;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if now() < v_scheduled and v_early is null then
    raise exception 'this session has not opened yet';
  end if;

  update sessions
     set status     = 'live',
         started_at = coalesce(started_at, now())
   where id = p_session and status = 'scheduled';

  if not exists (select 1 from session_items where session_id = p_session) then
    perform load_session_level(p_session, coalesce(v_level, 'easy'));
  else
    select count(*) into v_open
      from session_items where session_id = p_session and status = 'published';

    if v_open = 0 then
      select id into v_first
        from session_items
       where session_id = p_session and status = 'staged'
       order by sequence_no
       limit 1;
      if v_first is not null then perform publish_one_item(v_first); end if;
    end if;
  end if;

  return (select level_size from sessions where id = p_session);
end $$;

revoke execute on function public.open_session_now(uuid) from public;

comment on function public.open_session_now(uuid) is
  'Opens a session and puts its first question up. Internal — the callers check who is asking.';

-- ------------------------------------------------------------ answering ----
-- 0027's submit_answer, from the line after "not your question". The one
-- change: the clock is measured against whoever the item belongs to rather
-- than auth.uid(), because the row is found by id here.
create or replace function public.record_answer(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
declare
  v_status  item_status;
  v_correct answer_option;
  v_started timestamptz;
  v_ended   timestamptz;
  v_elapsed int;
  v_session uuid;
  v_seq     int;
  v_next    uuid;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), si.session_id, si.sequence_no,
         coalesce(si.decided_at, now())
    into v_status, v_started, v_session, v_seq, v_ended
    from session_items si
   where si.id = p_item;

  if not found then raise exception 'no such question'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status             = 'answered',
         answered_at        = now(),
         decided_at         = coalesce(decided_at, now()),
         selected_option    = p_option,
         eliminated_options = coalesce(p_eliminated, '{}'),
         student_confidence = p_confidence,
         student_reasoning  = nullif(btrim(p_reasoning), '')
   where id = p_item;

  select correct_option into v_correct
    from question_keys k
    join session_items si on si.question_id = k.question_id
   where si.id = p_item;

  v_elapsed := greatest(0, extract(epoch from (v_ended - coalesce(v_started, v_ended)))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, p_option = v_correct, v_elapsed)
  on conflict (session_item_id) do update
    set is_correct = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at = now();

  select id into v_next
    from session_items
   where session_id = v_session and status = 'staged' and sequence_no > v_seq
   order by sequence_no
   limit 1;

  if v_next is not null then
    perform publish_one_item(v_next);
  end if;
end $$;

revoke execute on function public.record_answer(uuid, answer_option, answer_option[], smallint, text) from public;

comment on function public.record_answer(uuid, answer_option, answer_option[], smallint, text) is
  'Grades one answer and opens the next question. Internal — the callers check who is answering.';

-- ------------------------------------------------------------- handing in --
-- 0017's finish_session_as_student, from the line after "not your session".
create or replace function public.end_session_now(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_status session_status; v_left int;
begin
  select status into v_status from sessions where id = p_session;
  if not found then raise exception 'no such session'; end if;
  if v_status = 'cancelled' then raise exception 'this session is cancelled'; end if;

  update session_items
     set status = 'voided'
   where session_id = p_session
     and status in ('staged', 'published');
  get diagnostics v_left = row_count;

  update sessions
     set status   = 'completed',
         ended_at = coalesce(ended_at, now())
   where id = p_session;

  return v_left;
end $$;

revoke execute on function public.end_session_now(uuid) from public;

comment on function public.end_session_now(uuid) is
  'Hands the test in: everything unanswered is voided and the session is completed. Internal.';

-- ============================================================================
--  The checks, unchanged — now thin
-- ============================================================================

create or replace function public.start_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from sessions where id = p_session and student_id = auth.uid()) then
    raise exception 'not your session';
  end if;
  return open_session_now(p_session);
end $$;

revoke execute on function public.start_session_as_student(uuid) from public;
grant  execute on function public.start_session_as_student(uuid) to authenticated;

create or replace function public.submit_answer(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from session_items where id = p_item and student_id = auth.uid()) then
    raise exception 'not your question';
  end if;
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;

revoke execute on function public.submit_answer(uuid, answer_option, answer_option[], smallint, text) from public;
grant  execute on function public.submit_answer(uuid, answer_option, answer_option[], smallint, text) to authenticated;

create or replace function public.finish_session_as_student(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from sessions where id = p_session and student_id = auth.uid()) then
    raise exception 'not your session';
  end if;
  return end_session_now(p_session);
end $$;

revoke execute on function public.finish_session_as_student(uuid) from public;
grant  execute on function public.finish_session_as_student(uuid) to authenticated;

-- ============================================================================
--  The link
-- ============================================================================

-- Every function below starts here. A bad token is "that link is not valid"
-- and nothing else — no hint about whether a session exists behind it.
create or replace function public.session_for_token(p_token text)
returns uuid
language plpgsql security definer set search_path = public as $$
declare v_id uuid;
begin
  select id into v_id from sessions where access_token = p_token;
  if v_id is null then raise exception 'that link is not valid'; end if;
  return v_id;
end $$;

revoke execute on function public.session_for_token(text) from public;

-- ------------------------------------------------------------- reading -----
-- The whole screen in one call: the session, the two names, and every item
-- the student is allowed to see, questions and options embedded.
--
-- Staged items are excluded, exactly as items_student_read excludes them —
-- there is still no reading ahead, and a link does not change that. The
-- session's own token and the teacher's private notes are stripped, and
-- question_keys is not joined at all.
create or replace function public.session_by_token(p_token text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_session sessions;
  v_out     jsonb;
begin
  select * into v_session from sessions where id = session_for_token(p_token);

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

revoke execute on function public.session_by_token(text) from public;
grant  execute on function public.session_by_token(text) to anon, authenticated;

comment on function public.session_by_token(text) is
  'The student''s whole screen, for somebody holding the link. Staged questions and the answer key are not in it.';

-- ------------------------------------------------------------- acting ------
create or replace function public.start_session_by_token(p_token text)
returns int
language plpgsql security definer set search_path = public as $$
begin
  return open_session_now(session_for_token(p_token));
end $$;

revoke execute on function public.start_session_by_token(text) from public;
grant  execute on function public.start_session_by_token(text) to anon, authenticated;

create or replace function public.set_level_by_token(p_token text, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status session_status; v_level text;
begin
  v_session := session_for_token(p_token);

  select status, level into v_status, v_level from sessions where id = v_session;

  if p_level not in ('easy','medium','hard') then
    raise exception 'a level is easy, medium or hard';
  end if;
  if v_status in ('completed','cancelled') then raise exception 'this session is over'; end if;

  if p_level = v_level and exists (select 1 from session_items where session_id = v_session) then
    return 0;
  end if;

  if v_status = 'scheduled' then
    update sessions set level = p_level where id = v_session;
    return 0;
  end if;

  return load_session_level(v_session, p_level);
end $$;

revoke execute on function public.set_level_by_token(text, text) from public;
grant  execute on function public.set_level_by_token(text, text) to anon, authenticated;

-- The item is checked against the token's session, so a link to one session
-- cannot be pointed at another session's question.
create or replace function public.answer_by_token(
  p_token       text,
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void language plpgsql security definer set search_path = public as $$
begin
  if not exists (select 1 from session_items
                  where id = p_item and session_id = session_for_token(p_token)) then
    raise exception 'that question is not in this session';
  end if;
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;

revoke execute on function public.answer_by_token(text, uuid, answer_option, answer_option[], smallint, text) from public;
grant  execute on function public.answer_by_token(text, uuid, answer_option, answer_option[], smallint, text) to anon, authenticated;

create or replace function public.mark_viewed_by_token(p_token text, p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set first_viewed_at = now()
   where id = p_item
     and session_id = session_for_token(p_token)
     and status = 'published'
     and first_viewed_at is null;
end $$;

revoke execute on function public.mark_viewed_by_token(text, uuid) from public;
grant  execute on function public.mark_viewed_by_token(text, uuid) to anon, authenticated;

create or replace function public.mark_decided_by_token(p_token text, p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set decided_at = now()
   where id = p_item
     and session_id = session_for_token(p_token)
     and status = 'published'
     and decided_at is null;
end $$;

revoke execute on function public.mark_decided_by_token(text, uuid) from public;
grant  execute on function public.mark_decided_by_token(text, uuid) to anon, authenticated;

create or replace function public.finish_by_token(p_token text)
returns int
language plpgsql security definer set search_path = public as $$
begin
  return end_session_now(session_for_token(p_token));
end $$;

revoke execute on function public.finish_by_token(text) from public;
grant  execute on function public.finish_by_token(text) to anon, authenticated;
