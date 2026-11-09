-- ============================================================================
--  0073 — a question the student types the answer to
--
--  Every question in the bank so far is four options and one of them is right.
--  A quarter of the SAT's mathematics is not: 464 of the 1,925 questions in
--  College Board's own Question Bank export are student-produced responses —
--  "what is the value of s?", and the student writes 403. There is no A, B, C
--  or D to pick, and no way to store one, so they could not be imported at
--  all.
--
--    questions.answer_kind     'choice', every question written until now, or
--                              'entry', one the student types.
--    question_keys.accepted    the answers that count as right, for an entry
--                              question. A key is one or the other, never
--                              both and never neither.
--    session_items.entered_answer  what the student typed.
--
--  WHAT COUNTS AS RIGHT. College Board lists the accepted forms itself —
--  ".1764, .1765, 3/17" is one key — because a repeating decimal has to be
--  truncated or rounded to fit the grid and either is allowed. So the list is
--  taken as given and the entry is matched against it: once as written, after
--  the spelling differences that are not differences are taken out (spaces, a
--  leading plus, the nought in front of a decimal point, trailing noughts
--  after one), and once as a number, so that a student who writes 1/2 where
--  the key says .5 is right.
--
--  It is deliberately not fuzzy beyond that. A tolerance wide enough to catch
--  an unusual spelling is wide enough to mark a wrong answer right, and the
--  accepted list already carries every form the test itself allows.
--
--  Nothing here changes a choice question. answer_kind defaults to 'choice',
--  every existing key keeps its correct_option, and record_answer, the reveal
--  and the score are the ones they were.
-- ============================================================================

-- --------------------------------------------------------------- the kind --
alter table questions add column if not exists answer_kind text not null default 'choice';

do $$ begin
  alter table questions add constraint questions_answer_kind_check
    check (answer_kind in ('choice', 'entry'));
exception when duplicate_object then null;
end $$;

comment on column questions.answer_kind is
  'choice: four options, one right (every question before 0073). entry: the student types the answer, and question_keys.accepted holds what counts.';

-- ---------------------------------------------------------------- the key --
-- correct_option stops being compulsory, because an entry question has none.
-- The constraint is what keeps a key honest: exactly one of the two.
alter table question_keys alter column correct_option drop not null;
alter table question_keys add column if not exists accepted text[];

do $$ begin
  alter table question_keys add constraint question_keys_one_kind_of_key
    check ((correct_option is not null)
           <> (accepted is not null and cardinality(accepted) > 0));
exception when duplicate_object then null;
end $$;

comment on column question_keys.accepted is
  'Every form that counts as right for an entry question (0073), as College Board lists them: {".1764",".1765","3/17"}. Null for a choice question.';

-- ------------------------------------------------------- what the student --
alter table session_items add column if not exists entered_answer text;
alter table session_items add column if not exists revealed_answer text;

comment on column session_items.entered_answer is
  'What the student typed on an entry question (0073). Null on a choice question.';
comment on column session_items.revealed_answer is
  'The answer named at reveal time for an entry question (0073) — the same route revealed_correct_option takes for a choice one, and written only then.';

-- ------------------------------------------------------- reading an answer -
-- The spellings that are not differences, taken out. Kept deliberately small:
-- anything this does not strip is a real difference and is left to the
-- accepted list, which already holds the forms the test allows.
create or replace function public.normalise_answer(p_answer text)
returns text
language sql immutable set search_path = public as $$
  with trimmed as (
    select regexp_replace(lower(coalesce(p_answer, '')), '[\s,]', '', 'g') as a
  ),
  signed as (
    select case when a like '+%' then substr(a, 2) else a end as a from trimmed
  ),
  zeroed as (
    -- A nought in front of the point says nothing: 0.5 and .5 are one answer.
    select case when a like '0.%'  then substr(a, 2)
                when a like '-0.%' then '-' || substr(a, 3)
                else a end as a
      from signed
  )
  -- Noughts after the last digit of a decimal say nothing either, nor does a
  -- point with nothing after it. A whole number keeps every digit it has.
  select case when a ~ '^-?[0-9]*\.[0-9]*$'
              then regexp_replace(regexp_replace(a, '0+$', ''), '\.$', '')
              else a end
    from zeroed
$$;

revoke execute on function public.normalise_answer(text) from public, anon, authenticated;

-- An answer as a number, or null when it is not one. A fraction is divided
-- out so that 1/2 and .5 are the same value; the scale is wide enough that
-- dividing does not itself make two equal answers differ.
create or replace function public.answer_value(p_answer text)
returns numeric
language plpgsql immutable set search_path = public as $$
declare
  a text := normalise_answer(p_answer);
  n numeric;
  d numeric;
begin
  if a ~ '^-?[0-9]*\.?[0-9]+$' then
    return a::numeric;
  end if;
  if a ~ '^-?[0-9]+/[0-9]+$' then
    n := split_part(a, '/', 1)::numeric;
    d := split_part(a, '/', 2)::numeric;
    if d = 0 then return null; end if;
    return round(n / d, 20);
  end if;
  return null;
exception when others then
  return null;
end $$;

revoke execute on function public.answer_value(text) from public, anon, authenticated;

create or replace function public.entry_is_right(p_entered text, p_accepted text[])
returns boolean
language plpgsql immutable set search_path = public as $$
declare
  v_entered text := normalise_answer(p_entered);
  v_value   numeric;
  k         text;
begin
  if v_entered is null or v_entered = '' or p_accepted is null then
    return false;
  end if;

  foreach k in array p_accepted loop
    if normalise_answer(k) = v_entered then return true; end if;
  end loop;

  v_value := answer_value(p_entered);
  if v_value is null then return false; end if;
  foreach k in array p_accepted loop
    if answer_value(k) = v_value then return true; end if;
  end loop;

  return false;
end $$;

revoke execute on function public.entry_is_right(text, text[]) from public, anon, authenticated;

-- ---------------------------------------------------- recording an answer --
-- record_answer's twin (0057), for a typed answer. Same shape, same one
-- assessment row, and the same rule about what the student may learn: the
-- answer is marked here and nothing about it goes back until the reveal.
create or replace function public.record_entry(p_item uuid, p_entered text)
returns void
language plpgsql security definer set search_path = public as $$
declare
  v_status   item_status;
  v_kind     text;
  v_accepted text[];
  v_started  timestamptz;
  v_ended    timestamptz;
  v_elapsed  int;
begin
  select si.status, coalesce(si.first_viewed_at, si.published_at), coalesce(si.decided_at, now()),
         q.answer_kind, k.accepted
    into v_status, v_started, v_ended, v_kind, v_accepted
    from session_items si
    join questions q on q.id = si.question_id
    left join question_keys k on k.question_id = si.question_id
   where si.id = p_item;

  if not found then raise exception 'no such question'; end if;
  if v_kind <> 'entry' then raise exception 'that question is answered by choosing an option'; end if;
  if v_status <> 'published' then raise exception 'that question is not open for answering'; end if;

  update session_items
     set status         = 'answered',
         answered_at    = now(),
         decided_at     = coalesce(decided_at, now()),
         entered_answer = nullif(btrim(p_entered), '')
   where id = p_item
     and status = 'published';

  if not found then raise exception 'that question is not open for answering'; end if;

  v_elapsed := greatest(0, extract(epoch from (v_ended - coalesce(v_started, v_ended)))::int);

  insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds)
  values (p_item, entry_is_right(p_entered, v_accepted), v_elapsed)
  on conflict (session_item_id) do update
    set is_correct      = excluded.is_correct,
        elapsed_seconds = excluded.elapsed_seconds,
        graded_at       = now();
end $$;

revoke execute on function public.record_entry(uuid, text) from public, anon, authenticated;

-- ------------------------------------------------- the targeted test's door
-- targeted_answer's twin (0062): the same lock, the same expiry, the same
-- step on to the next question, so an entry question runs on the clock exactly
-- as a choice one does.
create or replace function public.targeted_enter(p_session uuid, p_item uuid, p_entered text)
returns void
language plpgsql security definer set search_path = public as $$
declare v_status item_status;
begin
  perform targeted_lock(p_session);
  perform targeted_expire(p_session, interval '2 seconds');

  select status into v_status from session_items where id = p_item;

  if v_status = 'published' then
    if nullif(btrim(coalesce(p_entered, '')), '') is null then
      raise exception 'write an answer';
    end if;
    perform record_entry(p_item, p_entered);
  elsif v_status in ('staged', 'voided') then
    raise exception 'that question is not open for answering';
  end if;
  -- answered: its clock ran out a moment ago, or this is a repeat. Either way
  -- the test carries on, as it does for a choice question.

  perform targeted_step(p_session, interval '2 seconds');
end $$;

revoke execute on function public.targeted_enter(uuid, uuid, text) from public, anon, authenticated;

-- The link's door, with the entry key (0066). Named for the answer rather than
-- for the key, because enter_by_token is already the student's way in (0066).
create or replace function public.answer_entry_by_token(p_token text, p_item uuid, p_entered text)
returns void
language plpgsql security definer set search_path = public as $$
declare v_session uuid := session_for_token(p_token);
begin
  if not exists (select 1 from sessions where id = v_session and mode = 'targeted') then
    raise exception 'only a targeted test is answered this way';
  end if;
  if not exists (select 1 from session_items where id = p_item and session_id = v_session) then
    raise exception 'that question is not in this session';
  end if;
  perform targeted_enter(v_session, p_item, p_entered);
end $$;

revoke execute on function public.answer_entry_by_token(text, uuid, text) from public, anon, authenticated;
grant  execute on function public.answer_entry_by_token(text, uuid, text) to anon, authenticated;

-- ------------------------------------------------------------- the reveal --
-- 0006's, naming the answer for an entry question the same way it names the
-- option for a choice one: copied onto the item at reveal time, and only then.
create or replace function public.reveal_item(p_item uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_session uuid; v_status item_status; v_correct boolean;
begin
  select si.session_id, si.status into v_session, v_status
    from session_items si where si.id = p_item;
  perform assert_session_teacher(v_session);
  if v_status <> 'answered' then raise exception 'nothing to reveal yet'; end if;

  select a.is_correct into v_correct
    from session_item_assessments a where a.session_item_id = p_item;

  update session_items si
     set status = 'revealed',
         revealed_at = now(),
         revealed_result = case when v_correct then 'correct' else 'incorrect' end::grade_result,
         revealed_correct_option = (select k.correct_option from question_keys k
                                     where k.question_id = si.question_id),
         revealed_answer = (select array_to_string(k.accepted, ', ') from question_keys k
                             where k.question_id = si.question_id),
         revealed_explanation = (select k.explanation from question_keys k
                                  where k.question_id = si.question_id)
   where si.id = p_item;
end $$;

-- ------------------------------------------------- the student's payload ---
-- 0072's, with what the question wants and what the student wrote. The
-- accepted answers are not in it, for the same reason the correct option
-- never was: the student learns the answer at the reveal and not before.
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

-- ------------------------------------------------------------- authoring ---
-- create_question gains the accepted answers. The old signature is dropped
-- rather than left beside the new one: a call naming the first twelve
-- arguments would match both and Postgres would refuse to choose (0024, 0060).
drop function if exists public.create_question(
  text, text, text, text, difficulty_level, text, jsonb, answer_option, text, text, text, text);

create or replace function public.create_question(
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
  p_image_url            text default null,
  p_accepted             text[] default null
) returns uuid
language plpgsql security invoker set search_path = public as $$
declare
  v_entry boolean := p_accepted is not null and cardinality(p_accepted) > 0;
  qid    uuid;
  labels text[];
begin
  -- A choice question is checked exactly as it was in 0020: at least two
  -- options, and a key that names one of them. An entry question is checked
  -- the other way — it must have no options and no option as its key — and
  -- everything below is 0020's, unchanged.
  if v_entry then
    if p_correct is not null then
      raise exception 'a question is answered by choosing an option or by writing one, not both';
    end if;
    if coalesce(jsonb_array_length(p_options), 0) > 0 then
      raise exception 'a question the student writes the answer to has no options';
    end if;
  else
    select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

    if labels is null or array_length(labels, 1) < 2 then
      raise exception 'a question needs at least two options';
    end if;
    if not (p_correct::text = any(labels)) then
      raise exception 'the correct option must be one of the options provided';
    end if;
  end if;

  insert into questions (
    created_by, subject, section, skill, passage, passage_underline, stem,
    difficulty, difficulty_rationale, image_url, answer_kind
  ) values (
    auth.uid(), p_subject, nullif(p_section, ''), nullif(p_skill, ''),
    nullif(p_passage, ''), nullif(p_passage_underline, ''), p_stem,
    p_difficulty, nullif(p_difficulty_rationale, ''), nullif(p_image_url, ''),
    case when v_entry then 'entry' else 'choice' end
  )
  returning id into qid;

  if not v_entry then
    insert into question_options (question_id, label, body)
    select qid, (o->>'label')::answer_option, o->>'body'
    from jsonb_array_elements(p_options) o;
  end if;

  insert into question_keys (question_id, correct_option, accepted, explanation)
  values (qid, p_correct, case when v_entry then p_accepted end, nullif(p_explanation, ''));

  return qid;
end $$;

revoke execute on function public.create_question(
  text, text, text, text, difficulty_level, text, jsonb, answer_option, text, text, text, text, text[])
  from public, anon, authenticated;
grant execute on function public.create_question(
  text, text, text, text, difficulty_level, text, jsonb, answer_option, text, text, text, text, text[])
  to authenticated;

-- create_question_in_set, the same way (0060's, with the accepted answers).
drop function if exists public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level);

create or replace function public.create_question_in_set(
  p_set                  uuid,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null,
  p_image_url            text default null,
  p_difficulty           difficulty_level default null,
  p_accepted             text[] default null
) returns uuid
language plpgsql set search_path = public as $$
declare
  v_subject text;
  v_level   text;
  v_kind    text;
  v_diff    difficulty_level;
  v_pos     int;
  qid       uuid;
begin
  select qs.subject, qs.level, qs.kind into v_subject, v_level, v_kind
    from question_sets qs
   where qs.id = p_set and qs.is_active
     and (qs.level is not null or qs.kind = 'practice');

  if v_kind is null then
    raise exception 'a question is written into one of the level tests or the practice pool';
  end if;

  if v_kind = 'practice' then
    if p_difficulty is null then
      raise exception 'a practice question needs its difficulty — there is no test to take it from';
    end if;
    if nullif(btrim(p_skill), '') is null then
      raise exception 'a practice question needs its skill — a targeted test finds its questions by skill';
    end if;
    v_diff := p_difficulty;
  else
    if p_difficulty is not null and p_difficulty::text <> v_level then
      raise exception 'a question in the % test is %', v_level, v_level;
    end if;
    v_diff := v_level::difficulty_level;
  end if;

  qid := create_question(
    v_subject, p_section, p_passage, p_stem, v_diff,
    p_difficulty_rationale, p_options, p_correct, p_explanation,
    p_passage_underline, p_skill, p_image_url, p_accepted
  );

  select coalesce(max(position), 0) + 1 into v_pos
    from question_set_items where set_id = p_set;

  insert into question_set_items (set_id, question_id, position)
  values (p_set, qid, v_pos);

  return qid;
end $$;

revoke execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level, text[])
  from public, anon, authenticated;
grant execute on function public.create_question_in_set(
  uuid, text, text, text, text, jsonb, answer_option, text, text, text, text, difficulty_level, text[])
  to authenticated;
