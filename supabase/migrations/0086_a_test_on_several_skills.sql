-- ============================================================================
--  0086 — a test on several skills
--
--  A targeted test was on one skill or on one whole section (0061). The skills
--  a diagnostic finds weak are seldom one, and seldom tidily in one section —
--  Transitions is in Expression of Ideas, Boundaries in Standard English
--  Conventions — so a teacher who wanted both tested booked two tests: two
--  links, two sittings, two clocks. A test can be on several skills now, from
--  any section, and each of them is still read on its own line.
--
--  WHAT A TEST IS ON. targeted_tests.skills, in the order the teacher chose
--  them; null is the whole of targeted_tests.section, as a null skill was. A
--  test on one skill holds a list of one. section is the section the test is
--  in when there is one — the whole section's, or the one every skill shares —
--  and null when the skills cross sections. skill stays, in step with skills
--  (the one skill, or null), for whatever read it before; a check keeps it
--  from drifting.
--
--  THE SET. Every question in it is on one of the skills, as before, and every
--  skill has at least one question in it: a test that says it is on Boundaries
--  and asks nothing on Boundaries would put a point on a line it never
--  measured. targeted_candidates reads every chosen skill at once, and says
--  which section and skill each question is on — what the builder balances a
--  set across.
--
--  READING IT. Each skill of a test is a point on that skill's line, made of
--  that skill's questions in the test — the way the baseline diagnostic, which
--  asks everything at once, has always been read (0063). So progress_payload
--  sends the skills and how many of the set were on each (set_by_skill), which
--  "not reached" is counted against on each line. The questions themselves
--  stay the teacher's (0061): a count says nothing about what is in the set.
--
--  THE TEACHER'S WORDING for a step was one per test (verdict_overrides, 0061).
--  A test on three skills is three steps, each from its own point before, so
--  the wording is one per test and skill: '' for a test with one line — every
--  row written before this — and the skill for a test on several.
--
--  SAFE FOR THE APP BEING SERVED. No argument is taken away: each RPC keeps the
--  ones it had and gains an optional one (p_skills, p_skill), and the new
--  column has a default, so an app from before this books one skill, reads its
--  tests and writes its wording as it did.
-- ============================================================================

-- ------------------------------------------------------------ the test ----
alter table targeted_tests add column if not exists skills text[];

update targeted_tests set skills = array[skill] where skill is not null and skills is null;

alter table targeted_tests alter column section drop not null;

alter table targeted_tests drop constraint if exists targeted_tests_on_something;
alter table targeted_tests add constraint targeted_tests_on_something check (
  case when skills is null then section is not null
       else cardinality(skills) between 1 and 20 and array_position(skills, null) is null
  end);

alter table targeted_tests drop constraint if exists targeted_tests_skill_in_step;
alter table targeted_tests add constraint targeted_tests_skill_in_step check (
  skill is not distinct from (case when cardinality(skills) = 1 then skills[1] end));

comment on column targeted_tests.skills is
  'The skills the test is on, in the order the teacher chose them (0086). Null: the whole of section.';
comment on column targeted_tests.section is
  'The section the test is in: all of it when skills is null, else the one every skill shares. Null when the skills cross sections (0086).';
comment on column targeted_tests.skill is
  'The skill of a test on exactly one, else null. Kept in step with skills for what read it before 0086.';

-- ------------------------------------------------- the wording, per skill --
alter table verdict_overrides add column if not exists skill text not null default '';
alter table verdict_overrides drop constraint if exists verdict_overrides_pkey;
alter table verdict_overrides add constraint verdict_overrides_pkey primary key (session_id, skill);

comment on column verdict_overrides.skill is
  'Empty for a test with one line (one skill, or a whole section); on a test of several skills, the skill whose step this is (0086).';

-- ============================================================================
--  The set
-- ============================================================================

-- Internal. What a test is on, from what an app before 0086 sends (p_skill)
-- or after it (p_skills): the skills, trimmed and in order, blanks dropped —
-- or null, for a whole section.
create or replace function public.targeted_skills(p_skill text, p_skills text[])
returns text[]
language sql immutable set search_path = public as $$
  select case
    when exists (select 1 from unnest(coalesce(p_skills, '{}'::text[])) k where nullif(btrim(k), '') is not null)
      then array(select btrim(u.k) from unnest(p_skills) with ordinality u(k, o)
                  where nullif(btrim(u.k), '') is not null order by u.o)
    when nullif(btrim(p_skill), '') is not null then array[btrim(p_skill)]
  end
$$;

revoke execute on function public.targeted_skills(text, text[]) from public, anon, authenticated;

-- Internal. Is this question one the test may ask? In one of the subject's
-- three tests or its pool, published, and on one of the test's skills — or,
-- for a test on a whole section, in it. A skill is in exactly one section
-- (questions_skill_check), so a skill needs no section beside it.
drop function if exists public.targeted_question_fits(uuid, text, text, text);

create or replace function public.targeted_question_fits(
  p_question uuid, p_subject text, p_section text, p_skills text[]
) returns boolean
language sql stable security definer set search_path = public as $$
  select exists (
    select 1
      from questions q
      join question_set_items qi on qi.question_id = q.id
      join question_sets qs      on qs.id = qi.set_id
     where q.id = p_question
       and q.status = 'published'
       and case when p_skills is null then q.section = p_section
                else q.skill = any(p_skills) end
       and qs.subject = p_subject
       and qs.is_active
       and (qs.level is not null or qs.kind = 'practice'));
$$;

revoke execute on function public.targeted_question_fits(uuid, text, text, text[]) from public, anon, authenticated;

-- Internal. Replaces the set wholesale, after checking every question in it —
-- and, on a test with skills, that every skill has a question.
create or replace function public.write_targeted_set(
  p_session       uuid,
  p_questions     uuid[],
  p_allow_repeats boolean
) returns int
language plpgsql security definer set search_path = public as $$
declare
  t         targeted_tests;
  v_student uuid;
  v_q       uuid;
  v_n       int := coalesce(array_length(p_questions, 1), 0);
  v_bare    text;
begin
  select * into t from targeted_tests where session_id = p_session;
  select student_id into v_student from sessions where id = p_session;

  if v_n = 0 then raise exception 'a targeted test needs at least one question'; end if;
  if v_n > 20 then raise exception 'a targeted test is at most 20 questions'; end if;
  if array_position(p_questions, null) is not null then
    raise exception 'a question in the set is missing';
  end if;
  if (select count(distinct q) from unnest(p_questions) q) <> v_n then
    raise exception 'a question is in the set twice';
  end if;

  foreach v_q in array p_questions loop
    if not targeted_question_fits(v_q, t.subject, t.section, t.skills) then
      raise exception 'a question in the set is not on this test''s % — or is in none of this subject''s tests',
        case when t.skills is null then 'section'
             when cardinality(t.skills) = 1 then 'skill'
             else 'skills' end;
    end if;
    if not coalesce(p_allow_repeats, false) and student_has_seen(v_student, v_q) then
      raise exception 'the student has already seen a question in the set — allow repeats to keep it';
    end if;
  end loop;

  -- A skill the test is on and the set never asks would be a point on a line
  -- the test never measured.
  if t.skills is not null then
    select string_agg(u.k, ', ' order by u.o) into v_bare
      from unnest(t.skills) with ordinality u(k, o)
     where not exists (select 1 from questions q where q.id = any(p_questions) and q.skill = u.k);
    if v_bare is not null then
      raise exception 'nothing in the set is on % — add a question on it, or take it off the test', v_bare;
    end if;
  end if;

  delete from targeted_set_items where session_id = p_session;
  insert into targeted_set_items (session_id, position, question_id)
  select p_session, o.n, o.q from unnest(p_questions) with ordinality o(q, n);

  update targeted_tests
     set allow_repeats = coalesce(p_allow_repeats, false),
         updated_at    = now()
   where session_id = p_session;

  return v_n;
end $$;

revoke execute on function public.write_targeted_set(uuid, uuid[], boolean) from public, anon, authenticated;

comment on function public.write_targeted_set(uuid, uuid[], boolean) is
  'Replaces a targeted test''s set after checking every question: on one of its skills (or in its section), in the subject''s tests or pool, published, no duplicates, not seen before unless repeats are allowed — and every skill asked at least once (0061, 0086). Internal.';

-- ----------------------------------------------------------- candidates ---
-- The return type gains the section and skill of each question, so the
-- function is dropped rather than replaced.
drop function if exists public.targeted_candidates(uuid, text, text, text);

create or replace function public.targeted_candidates(
  p_student uuid,
  p_subject text,
  p_section text,
  p_skill   text,
  p_skills  text[] default null
) returns table (
  question_id  uuid,
  difficulty   difficulty_level,
  source       text,
  set_level    text,
  set_position int,
  seen         boolean,
  section      text,
  skill        text
)
language plpgsql stable security definer set search_path = public as $$
declare
  v_skills text[] := targeted_skills(p_skill, p_skills);
begin
  if not is_teacher() then raise exception 'only staff can build a targeted test'; end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if v_skills is null and nullif(btrim(p_section), '') is null then
    raise exception 'a targeted test is on a section or on skills';
  end if;

  return query
    select distinct on (q.id)
           q.id, q.difficulty,
           case when qs.kind = 'practice' then 'practice' else 'test' end,
           qs.level, qi.position,
           student_has_seen(p_student, q.id),
           q.section, q.skill
      from questions q
      join question_set_items qi on qi.question_id = q.id
      join question_sets qs      on qs.id = qi.set_id
     where q.status = 'published'
       and case when v_skills is null then q.section = p_section
                else q.skill = any(v_skills) end
       and qs.subject = p_subject
       and qs.is_active
       and (qs.level is not null or qs.kind = 'practice')
     order by q.id, (qs.kind = 'practice'), qi.position;
end $$;

revoke execute on function public.targeted_candidates(uuid, text, text, text, text[]) from public, anon, authenticated;
grant  execute on function public.targeted_candidates(uuid, text, text, text, text[]) to authenticated;

comment on function public.targeted_candidates(uuid, text, text, text, text[]) is
  'Every question a targeted test on these skills (p_skills, or the one p_skill), or on the whole of p_section, could ask — from the three tests and the pool — with its section and skill, and whether the student has seen it in any session. Staff only (0061, 0086).';

-- --------------------------------------------------------------- booking ---
drop function if exists public.create_targeted_session(
  uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int);

create or replace function public.create_targeted_session(
  p_student          uuid,
  p_subject          text,
  p_section          text,
  p_skill            text,
  p_scheduled_at     timestamptz,
  p_title            text,
  p_size             int,
  p_questions        uuid[],
  p_allow_repeats    boolean,
  p_question_seconds int,
  p_overall_seconds  int,
  p_skills           text[] default null
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_session uuid;
  v_skills  text[] := targeted_skills(p_skill, p_skills);
  v_section text   := nullif(btrim(p_section), '');
  v_unknown text;
begin
  if not is_teacher() then raise exception 'only a teacher or an admin can book a targeted test'; end if;

  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  -- The rule sessions_need_a_pc keeps for a client's insert (0056). This one is
  -- made inside a security definer function, which that trigger lets through.
  if not student_has_pc(p_student) then
    raise exception 'this student has no PC yet — choose their PC before booking the session';
  end if;
  if p_scheduled_at is null then raise exception 'a targeted test needs a time'; end if;

  if v_skills is null then
    if v_section is null then raise exception 'a targeted test is on a section or on skills'; end if;
  else
    if cardinality(v_skills) > 20 then raise exception 'a targeted test is on at most 20 skills'; end if;
    if (select count(distinct k) from unnest(v_skills) k) <> cardinality(v_skills) then
      raise exception 'a skill is on the test twice';
    end if;
    -- A skill no question of the subject is on is a slip, not a test.
    select string_agg(k, ', ') into v_unknown
      from unnest(v_skills) k
     where not exists (select 1 from questions q where q.subject = p_subject and q.skill = k);
    if v_unknown is not null then
      raise exception 'no % question is on %', p_subject, v_unknown;
    end if;
    -- The section the skills share, or none when they cross sections. Each
    -- skill is in one section, so its questions say which.
    select case when count(distinct q.section) = 1 then min(q.section) end into v_section
      from questions q
     where q.subject = p_subject and q.skill = any(v_skills);
  end if;

  insert into sessions (teacher_id, student_id, subject, title, scheduled_at, duration_mins, mode)
  values (auth.uid(), p_student, p_subject, nullif(btrim(p_title), ''), p_scheduled_at,
          least(480, greatest(5, ceil(coalesce(p_overall_seconds, 0) / 60.0)::int)),
          'targeted')
  returning id into v_session;

  insert into targeted_tests (session_id, subject, section, skill, skills, set_size,
                              question_seconds, overall_seconds, allow_repeats, created_by)
  values (v_session, p_subject, v_section,
          case when cardinality(v_skills) = 1 then v_skills[1] end, v_skills, p_size,
          p_question_seconds, p_overall_seconds, coalesce(p_allow_repeats, false), auth.uid());

  perform write_targeted_set(v_session, p_questions, p_allow_repeats);

  return v_session;
end $$;

revoke execute on function public.create_targeted_session(
  uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int, text[])
  from public, anon, authenticated;
grant  execute on function public.create_targeted_session(
  uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int, text[])
  to authenticated;

comment on function public.create_targeted_session(
  uuid, text, text, text, timestamptz, text, int, uuid[], boolean, int, int, text[]) is
  'Books a targeted test with its set, in one transaction: the session, what it is on (several skills in p_skills, one in p_skill, or the whole of p_section) and its questions, or none of them (0061, 0086). Teacher or admin.';

-- ============================================================================
--  The wording, one per test and skill
-- ============================================================================

-- Internal. Which wording a step takes: '' on a test with one line, one of
-- its skills on a test of several.
create or replace function public.assert_override_skill(p_session uuid, p_skill text)
returns void
language plpgsql stable security definer set search_path = public as $$
declare
  v_skills text[];
begin
  select skills into v_skills from targeted_tests where session_id = p_session;
  if coalesce(cardinality(v_skills), 0) > 1 then
    if coalesce(p_skill, '') = '' or not (p_skill = any(v_skills)) then
      raise exception 'on a test of several skills, each skill''s step has its own wording — say which skill';
    end if;
  elsif coalesce(p_skill, '') <> '' then
    raise exception 'this test has one step, and its wording is the test''s';
  end if;
end $$;

revoke execute on function public.assert_override_skill(uuid, text) from public, anon, authenticated;

drop function if exists public.save_verdict_override(uuid, uuid, text, text);

create or replace function public.save_verdict_override(
  p_session uuid, p_previous uuid, p_wording text, p_context text, p_skill text default ''
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_targeted(p_session);
  perform assert_override_skill(p_session, p_skill);
  if p_previous is not null
     and not exists (select 1 from sessions a join sessions b on b.student_id = a.student_id
                      where a.id = p_session and b.id = p_previous and b.id <> a.id) then
    raise exception 'the earlier point is not one of this student''s sessions';
  end if;
  insert into verdict_overrides (session_id, skill, previous_session_id, draft_wording, draft_context,
                                 updated_by, updated_at)
  values (p_session, coalesce(p_skill, ''), p_previous, coalesce(p_wording, ''), coalesce(p_context, ''),
          auth.uid(), now())
  on conflict (session_id, skill) do update
    set previous_session_id = excluded.previous_session_id,
        draft_wording       = excluded.draft_wording,
        draft_context       = excluded.draft_context,
        updated_by          = excluded.updated_by,
        updated_at          = now();
end $$;

drop function if exists public.share_verdict_override(uuid, boolean);

create or replace function public.share_verdict_override(
  p_session uuid, p_share boolean, p_skill text default ''
) returns void
language plpgsql security definer set search_path = public as $$
begin
  perform assert_staff_on_targeted(p_session);
  perform assert_override_skill(p_session, p_skill);
  if p_share and exists (select 1 from verdict_overrides
                          where session_id = p_session and skill = coalesce(p_skill, '')
                            and btrim(draft_wording) = '' and btrim(draft_context) = '') then
    raise exception 'the wording is empty';
  end if;
  update verdict_overrides
     set shared_wording = case when p_share then nullif(btrim(draft_wording), '') end,
         shared_context = case when p_share then nullif(btrim(draft_context), '') end,
         shared_at      = case when p_share then now() end,
         shared_by      = case when p_share then auth.uid() end
   where session_id = p_session and skill = coalesce(p_skill, '');
  if not found then raise exception 'there is no wording to share yet'; end if;
end $$;

revoke execute on function public.save_verdict_override(uuid, uuid, text, text, text) from public, anon, authenticated;
revoke execute on function public.share_verdict_override(uuid, boolean, text)          from public, anon, authenticated;
grant  execute on function public.save_verdict_override(uuid, uuid, text, text, text) to authenticated;
grant  execute on function public.share_verdict_override(uuid, boolean, text)          to authenticated;

comment on function public.save_verdict_override(uuid, uuid, text, text, text) is
  'The draft of the teacher''s wording for the step up to a targeted test — for one of its skills, on a test of several — and the point it was written against (0061, 0086).';
comment on function public.share_verdict_override(uuid, boolean, text) is
  'Copies the wording''s draft to the copy the PC reads, or takes it back (0061, 0086).';

-- ============================================================================
--  Reading it
-- ============================================================================

-- 0070's payload, with what each test is on and how its set divides between
-- its skills, and which skill each shared wording is for.
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
               'skills',           tt.skills,
               'set_size',         tt.set_size,
               'set_count',        (select count(*) from targeted_set_items x where x.session_id = tt.session_id),
               -- How many of the set were on each skill: counts, never which.
               'set_by_skill',     case when tt.skills is not null then (
                                     select coalesce(jsonb_object_agg(g.skill, g.n), '{}'::jsonb)
                                       from (select q.skill, count(*) as n
                                               from targeted_set_items x
                                               join questions q on q.id = x.question_id
                                              where x.session_id = tt.session_id and q.skill is not null
                                              group by q.skill) g)
                                   end,
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
               'skill',               v.skill,
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

-- 0070's parent card, with the skills and how the set divides between them.
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
                              'skills', e->'skills', 'set_size', e->'set_size', 'set_count', e->'set_count',
                              'set_by_skill', e->'set_by_skill'))
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

-- 0069's list of the student's tests, naming every skill a test is on.
create or replace function public.student_home(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                  from profiles p where p.id = v_student),
    'sessions', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',              s.id,
               'title',           s.title,
               'subject',         s.subject,
               'mode',            s.mode,
               'status',          s.status,
               'scheduled_at',    s.scheduled_at,
               'opened_early_at', s.opened_early_at,
               'link',            s.access_token,
               'entry_key',       s.entry_key,
               'section',         t.section,
               'skill',           t.skill,
               'skills',          t.skills,
               'set_size',        case when t.session_id is not null
                                       then (select count(*) from targeted_set_items x where x.session_id = s.id)
                                  end,
               'revealed',        (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'),
               'right',           (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'
                                      and i.revealed_result = 'correct'),
               'score',           case when s.mode = 'targeted' and s.status = 'completed'
                                       then (select jsonb_build_object('right', r->'right', 'reached', r->'reached')
                                               from targeted_result(s.id) r)
                                  end)
             order by s.scheduled_at desc)
        from sessions s
        left join targeted_tests t on t.session_id = s.id
       where s.student_id = v_student
         and s.status <> 'cancelled'), '[]'::jsonb));
end $$;

revoke execute on function public.student_home(text) from public, anon, authenticated;
grant  execute on function public.student_home(text) to anon, authenticated;
