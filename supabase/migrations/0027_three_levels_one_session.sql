-- ============================================================================
--  0027 — a session is a level, not a paper
--
--  Everything before this asked the teacher to prepare.  0011 gave them a
--  reusable pre-test, 0016 gave them a builder to assemble a paper days in
--  advance, 0023 gave them a console to hand questions over one at a time.
--  Three ways to decide, before the lesson and during it, what this student
--  should be asked.
--
--  The teachers do not want any of them.  What they do is simpler and it is
--  the whole of it:
--
--      the session opens        the student gets the easy test
--      they work through it     one question, answer, next
--      it is too easy           move them to medium — and keep going
--      medium is right          leave it alone, keep pressing next
--      medium is too easy       move them to hard
--
--  So there is no paper to build, nothing to stage, and nothing to publish by
--  hand.  A session carries a LEVEL, the level's questions are loaded when it
--  is entered, and moving levels is one call that either the student or their
--  teacher can make — which is how it actually happens: the teacher sees it on
--  the call and says so, and whoever is closer to a mouse clicks.
--
--  What does NOT change is where the line is held.  Exactly one item is
--  'published' at a time and everything else is 'staged', which is invisible
--  under the RLS from 0005.  Loading twenty questions on a level switch is not
--  putting twenty questions in front of the student — it is putting one in
--  front of them and nineteen out of reach.  The per-question clock means what
--  it always meant, and there is still no reading ahead.
--
--  Two rules for a level switch, both of them about honesty in the report:
--
--    * The question on screen is voided, not abandoned.  They were being timed
--      on it and did not answer it; 'voided' is the state that already means
--      exactly that, and the report already excludes it.
--    * A question already asked in this session is never asked again, even if
--      the student is moved back down to a level they have been through.
-- ============================================================================

-- --------------------------------------------------------------- the level --
alter table sessions add column if not exists level text not null default 'easy';

do $$ begin
  alter table sessions add constraint sessions_level_check
    check (level in ('easy','medium','hard'));
exception when duplicate_object then null;
end $$;

comment on column sessions.level is
  'Which of the three tests the student is on. Starts easy; moved by the student or the teacher during the session.';

-- The student is shown "question 3 of 20" and cannot count the level for
-- themselves — staged items are invisible to them — so the length of the level
-- they are on lives here, where they can read it. question_count stays what it
-- was: everything this session has put in front of them, across levels.
alter table sessions add column if not exists level_size int not null default 0;

comment on column sessions.level_size is
  'How many questions the level the student is on holds for this session. Set when a level is loaded; the student reads it to know how far through they are.';

-- ------------------------------------------------------- loading a level ----
-- Internal: the only thing that puts questions into a session.  Not granted to
-- anybody, because the two callers below are where the permission checks are.
--
-- Staged leftovers from the level being left are deleted rather than voided:
-- they were never in front of the student, they carry nothing, and a voided
-- row the student never saw is noise on the teacher's board and in the report.
-- The question they were actually looking at is a different matter and is
-- voided, because that one did happen.
create or replace function public.load_session_level(p_session uuid, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_set     uuid;
  v_student uuid;
  v_base    int;
  v_added   int;
  v_size    int;
  v_first   uuid;
begin
  if p_level not in ('easy','medium','hard') then
    raise exception 'a level is easy, medium or hard';
  end if;

  select s.student_id into v_student from sessions s where s.id = p_session;

  select qs.id into v_set
    from question_sets qs
    join sessions s on s.id = p_session
   where qs.level = p_level and qs.subject = s.subject and qs.is_active;

  if v_set is null then
    raise exception 'there is no % test for this subject', p_level;
  end if;

  -- The one they were looking at happened; the rest never reached them.
  update session_items set status = 'voided'
   where session_id = p_session and status = 'published';
  delete from session_items where session_id = p_session and status = 'staged';

  select coalesce(max(sequence_no), 0) into v_base
    from session_items where session_id = p_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  select p_session, qi.question_id, v_student,
         (v_base + row_number() over (order by qi.position))::int
    from question_set_items qi
   where qi.set_id = v_set
     -- Never twice in one session, even coming back down a level.
     and not exists (select 1 from session_items si
                      where si.session_id = p_session
                        and si.question_id = qi.question_id);
  get diagnostics v_added = row_count;

  -- Everything this session holds from this level, including what the student
  -- has already answered at it. That is the "of 20" they are shown.
  select count(*) into v_size
    from session_items si
    join question_set_items qi on qi.question_id = si.question_id and qi.set_id = v_set
   where si.session_id = p_session and si.status <> 'voided';

  update sessions set level = p_level, level_size = v_size where id = p_session;

  -- One question, exactly as before. The other nineteen stay staged, which is
  -- to say unreadable.
  select id into v_first
    from session_items
   where session_id = p_session and status = 'staged'
   order by sequence_no
   limit 1;

  if v_first is not null then
    perform publish_one_item(v_first);
  end if;

  return v_added;
end $$;

revoke execute on function public.load_session_level(uuid, text) from anon, authenticated;

comment on function public.load_session_level(uuid, text) is
  'Loads one level test into a session and opens its first question. Internal — start_session_as_student and set_session_level do the permission checks.';

-- ------------------------------------------------------------- the opening --
-- The student opens their own session at its scheduled time, as they have
-- since 0016, and the easy test is loaded there and then. There is no longer
-- anything to refuse them for: a session with no paper is the normal state of
-- a session, because there is no paper.
create or replace function public.start_session_as_student(p_session uuid)
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
    from sessions where id = p_session and student_id = auth.uid();

  if not found then raise exception 'not your session'; end if;
  if v_status in ('completed', 'cancelled') then raise exception 'this session is over'; end if;
  if now() < v_scheduled and v_early is null then
    raise exception 'this session has not opened yet';
  end if;

  update sessions
     set status     = 'live',
         started_at = coalesce(started_at, now())
   where id = p_session and status = 'scheduled';

  -- Nothing loaded yet: this is the first opening, and it starts at whatever
  -- level the session carries — 'easy' unless the teacher moved it beforehand.
  if not exists (select 1 from session_items where session_id = p_session) then
    perform load_session_level(p_session, coalesce(v_level, 'easy'));
  else
    -- Coming back to a session that was already under way. Whatever they were
    -- on is still open; if nothing is, the next staged question opens.
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

revoke execute on function public.start_session_as_student(uuid) from anon;

comment on function public.start_session_as_student(uuid) is
  'The student opens their own session once its time has passed. The level''s questions are loaded and its first question is opened.';

-- --------------------------------------------------------- moving a level --
-- Either of them may call it.  The teacher is the one who decides — they are
-- watching the student work and they know when it is too easy — but what they
-- do with that is say so on the call, and the student is the one sitting at
-- the screen. Making it the teacher's button alone would mean a teacher
-- reaching for a console mid-sentence, which is the thing this whole change is
-- getting rid of.
--
-- Any level from any level: mostly this goes up, but "drop one level — rebuild
-- fluency before speed" is the oldest suggestion in the product and it needs
-- somewhere to be acted on.
create or replace function public.set_session_level(p_session uuid, p_level text)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_status session_status;
  v_level  text;
begin
  select status, level into v_status, v_level
    from sessions
   where id = p_session
     and (student_id = auth.uid() or teacher_id = auth.uid());

  if not found then raise exception 'not your session'; end if;
  if p_level not in ('easy','medium','hard') then
    raise exception 'a level is easy, medium or hard';
  end if;
  if v_status in ('completed','cancelled') then raise exception 'this session is over'; end if;

  if p_level = v_level and exists (select 1 from session_items where session_id = p_session) then
    return 0;
  end if;

  -- Before the student has started there is nothing to load and nothing to
  -- void — the level is just a note about where they will begin.
  if v_status = 'scheduled' then
    update sessions set level = p_level where id = p_session;
    return 0;
  end if;

  return load_session_level(p_session, p_level);
end $$;

revoke execute on function public.set_session_level(uuid, text) from anon;

comment on function public.set_session_level(uuid, text) is
  'Moves a live session to another level: the current question is voided, the rest of the old level is dropped, and the new level''s first question opens. Either the student or their teacher may call it.';

-- ---------------------------------------------------------------- the loop --
-- submit_answer as 0023 left it, with the pacing branch taken out: there is
-- one way a session runs now, and answering brings up the next question in the
-- level. Everything above it is unchanged, including the reason this is
-- SECURITY DEFINER — grading reads question_keys, which the student cannot.
create or replace function public.submit_answer(
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
   where si.id = p_item and si.student_id = auth.uid();

  if not found then raise exception 'not your question'; end if;
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

  -- To the decision, not to the button press.
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

-- ------------------------------------------------------- what is now gone --
-- Every route by which a question used to reach a student other than the one
-- above.  Dropped rather than left standing and unused: an RPC that exists is
-- an RPC a client can call, and these are all SECURITY DEFINER.
drop function if exists public.set_session_paper(uuid, uuid[]);
drop function if exists public.publish_item(uuid);
drop function if exists public.set_session_pacing(uuid, text);
drop function if exists public.stage_question(uuid, uuid);
drop function if exists public.unstage_item(uuid);
drop function if exists public.stage_question_set(uuid, uuid);
drop function if exists public.publish_staged_items(uuid);

-- Pacing was the question of who hands the next question over. Nobody does:
-- the level does, and the only choice left is which level.
alter table sessions drop constraint if exists sessions_pacing_check;
alter table sessions drop column if exists pacing;

-- ------------------------------------------------------------ in progress --
-- Sessions built under the old flow keep the paper they were given: their
-- items are already staged and start_session_as_student resumes them above
-- rather than loading a level over the top.
--
-- Their level is read back off the questions they actually hold rather than
-- left at the column default, because a session of twenty hard questions
-- labelled "easy" is a lie the console would print. Whatever level most of the
-- paper sits at is the level the session was, which is as true as it can be
-- made of a paper assembled by hand.
update sessions s
   set level_size = (select count(*) from session_items i
                      where i.session_id = s.id and i.status <> 'voided'),
       level = coalesce((select q.difficulty::text
                           from session_items i
                           join questions q on q.id = i.question_id
                          where i.session_id = s.id
                          group by q.difficulty
                          order by count(*) desc, q.difficulty
                          limit 1), s.level)
 where s.level_size = 0
   and exists (select 1 from session_items i where i.session_id = s.id);
