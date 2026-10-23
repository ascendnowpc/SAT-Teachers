-- ============================================================================
--  0059 — a session says what it is for
--
--  Every session so far has been one thing: the teacher shows each question,
--  and afterwards writes it up on the diagnostic form. That one thing was
--  doing two jobs. The first session a student has in a subject is their
--  diagnostic — where they start — and every one after it is a lesson. The
--  progress a student makes on a skill is measured from the first, so the
--  database has to be able to tell them apart.
--
--  And there is a third kind coming (0061): a targeted test — a short set on
--  one skill that the student works through alone, on their link, against a
--  clock. It runs nothing like the other two, so it has to be told apart too.
--
--    live        a lesson. The teacher shows every question (0057).
--    diagnostic  the same flow, exactly. Marked, because a student's baseline
--                on a skill is computed from it.
--    targeted    a short set on one skill, student-paced (0061, 0062).
--
--  What this does:
--
--    * sessions.mode, 'live' by default, so nothing that books a session
--      today changes meaning.
--    * the existing sessions are sorted. Each student's earliest completed
--      session in a subject was their diagnostic — that is how the lessons
--      have been run — so it is marked diagnostic. The rest stay live. A
--      teacher who knows better corrects it with set_session_mode.
--    * a mode moves between live and diagnostic and nowhere else. A targeted
--      test is made targeted, by create_targeted_session (0061), and stays
--      it: turning a lesson into a targeted test would hand a running lesson
--      a clock, and turning a test into a lesson would leave its set behind.
--      A client cannot book one by inserting a row either — the set has to
--      come with it — and cannot change a targeted test's subject.
--    * the controls of a lesson refuse a targeted test: the level buttons,
--      choosing a question, answering for the student and starting it from
--      the console. A targeted test is the student's to start and to answer.
--    * a targeted test has no diagnostic form and no generated report — its
--      report is computed from its answers. session_reports refuses the two
--      stamps for one, whoever writes them and however.
-- ============================================================================

-- ------------------------------------------------------------------ mode ---
alter table sessions add column if not exists mode text not null default 'live';

do $$ begin
  alter table sessions add constraint sessions_mode_check
    check (mode in ('live', 'diagnostic', 'targeted'));
exception when duplicate_object then null;
end $$;

comment on column sessions.mode is
  'live: a lesson. diagnostic: the same flow, marked — a student''s baseline on a skill is computed from it. targeted: a short set on one skill the student works through alone (0061). Moves between live and diagnostic only.';

create index if not exists sessions_student_mode_idx on sessions (student_id, subject, mode);

-- ---------------------------------------------------------- the backfill ---
-- The earliest completed session per student and subject. Run once, here; a
-- session booked after this says what it is when it is booked.
update sessions s
   set mode = 'diagnostic'
  from (select distinct on (student_id, subject) id
          from sessions
         where status = 'completed'
         order by student_id, subject, coalesce(started_at, scheduled_at), created_at) first
 where s.id = first.id
   and s.mode = 'live';

-- ------------------------------------------------------------- the guard ---
-- Not security definer: it reads nothing, and current_user has to be the
-- caller's role for the insert rule to mean anything. Inside a security
-- definer function (create_targeted_session) current_user is the owner, which
-- is exactly the door a targeted test is allowed through.
create or replace function public.sessions_guard_mode()
returns trigger
language plpgsql set search_path = public as $$
begin
  if tg_op = 'INSERT' then
    if new.mode = 'targeted' and current_user in ('anon', 'authenticated') then
      raise exception 'a targeted test is booked with its set — use create_targeted_session';
    end if;
    return new;
  end if;

  if new.mode is distinct from old.mode
     and (old.mode = 'targeted' or new.mode = 'targeted') then
    raise exception 'a session moves between live and diagnostic only — a targeted test stays one';
  end if;

  if old.mode = 'targeted' and new.subject is distinct from old.subject then
    raise exception 'a targeted test''s subject is its set''s';
  end if;

  return new;
end $$;

revoke execute on function public.sessions_guard_mode() from public, anon, authenticated;

drop trigger if exists sessions_guard_mode on sessions;
create trigger sessions_guard_mode
  before insert or update of mode, subject on sessions
  for each row execute function public.sessions_guard_mode();

-- ------------------------------------------------------- correcting one ----
create or replace function public.set_session_mode(p_session uuid, p_mode text)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);

  if p_mode not in ('live', 'diagnostic') then
    raise exception 'a session is a lesson (live) or a diagnostic';
  end if;

  update sessions set mode = p_mode where id = p_session;
end $$;

revoke execute on function public.set_session_mode(uuid, text) from public, anon, authenticated;
grant  execute on function public.set_session_mode(uuid, text) to authenticated;

comment on function public.set_session_mode(uuid, text) is
  'Marks a session a lesson (live) or a diagnostic. Never makes or unmakes a targeted test. The session''s teacher or an admin (0059).';

-- ---------------------------------------------------------- internal gate --
create or replace function public.assert_not_targeted(p_session uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if exists (select 1 from sessions where id = p_session and mode = 'targeted') then
    raise exception 'this is a targeted test — the student works through it on their link';
  end if;
end $$;

revoke execute on function public.assert_not_targeted(uuid) from public, anon, authenticated;

comment on function public.assert_not_targeted(uuid) is
  'Raises for a targeted test. The lesson''s controls open with it (0059). Internal.';

-- ------------------------------------------------ the lesson's controls ---
-- 0057's show_one_question, with the gate first. It is under both the level
-- buttons (load_session_level) and choosing a question, so one line covers
-- both.
create or replace function public.show_one_question(p_session uuid, p_question uuid, p_set uuid)
returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid;
  v_seq     int;
  v_item    uuid;
begin
  perform assert_not_targeted(p_session);

  select student_id into v_student from sessions where id = p_session;

  -- Anything a session was holding from before 0057.
  delete from session_items where session_id = p_session and status = 'staged';

  select coalesce(max(sequence_no), 0) + 1 into v_seq
    from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  values (p_session, p_question, v_student, v_seq)
  returning id into v_item;

  perform publish_one_item(v_item);

  update sessions
     set level      = (select level from question_sets where id = p_set),
         level_size = (select count(*)
                         from session_items si
                         join question_set_items qi
                           on qi.question_id = si.question_id and qi.set_id = p_set
                        where si.session_id = p_session and si.status <> 'voided')
   where id = p_session;

  return v_item;
end $$;

revoke execute on function public.show_one_question(uuid, uuid, uuid) from public, anon, authenticated;

-- 0034's, with the gate.
create or replace function public.teacher_answer_item(
  p_item        uuid,
  p_option      answer_option,
  p_eliminated  answer_option[],
  p_confidence  smallint,
  p_reasoning   text
) returns void
language plpgsql security definer set search_path = public as $$
declare v_session uuid;
begin
  select session_id into v_session from session_items where id = p_item;
  if v_session is null then raise exception 'no such question'; end if;
  perform assert_session_teacher(v_session);
  perform assert_not_targeted(v_session);
  perform record_answer(p_item, p_option, p_eliminated, p_confidence, p_reasoning);
end $$;

revoke execute on function public.teacher_answer_item(uuid, answer_option, answer_option[], smallint, text) from public, anon;
grant  execute on function public.teacher_answer_item(uuid, answer_option, answer_option[], smallint, text) to authenticated;

-- 0034's, with the gate: the clock on a targeted test starts when the
-- student presses Start, not when the teacher opens it from the console.
create or replace function public.teacher_start_session(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
begin
  perform assert_session_teacher(p_session);
  perform assert_not_targeted(p_session);

  update sessions
     set opened_early_at = coalesce(opened_early_at, now())
   where id = p_session
     and now() < scheduled_at;

  return open_session_now(p_session);
end $$;

revoke execute on function public.teacher_start_session(uuid) from public, anon;
grant  execute on function public.teacher_start_session(uuid) to authenticated;

-- --------------------------------------------- no form, no generated report --
create or replace function public.session_reports_not_for_targeted()
returns trigger
language plpgsql security definer set search_path = public as $$
begin
  if (new.form_submitted_at is not null or new.generated_at is not null)
     and exists (select 1 from sessions where id = new.session_id and mode = 'targeted') then
    raise exception 'a targeted test has no diagnostic form and no generated report — its report is computed from its answers';
  end if;
  return new;
end $$;

revoke execute on function public.session_reports_not_for_targeted() from public, anon, authenticated;

drop trigger if exists session_reports_not_for_targeted on session_reports;
create trigger session_reports_not_for_targeted
  before insert or update on session_reports
  for each row execute function public.session_reports_not_for_targeted();
