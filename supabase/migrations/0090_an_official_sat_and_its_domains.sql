-- ============================================================================
--  0090 — an official SAT, and what its report says about each domain
--
--  0088 recorded a Bluebook practice test: a total and two section scores.
--  The report Ascend Now reads most is College Board's own "Your SAT Score
--  Report" — an official SAT, sat in Bluebook at a test centre — and it says
--  more than three numbers:
--
--    which SAT          "Test administration: SAT May 02, 2026", and the day
--                       it was sat ("Tested on").
--    percentiles        "1350 … 90th*", "650 … 85th*", "700 … 92nd*": where the
--                       score stands among the testers of the past three years.
--    the domains        "Knowledge and Skills": the eight content domains,
--                       each with a performance band — "Information and Ideas
--                       Performance: 550-600" — the same eight sections every
--                       question in this app is filed under.
--
--  So a score says whether it is an official SAT, keeps the three percentiles
--  where the report gives them (a practice test's does not), and keeps each
--  domain's band, by section. The rest of the report stays where it was: its
--  score ranges and three-year averages are about everybody, and the name,
--  grade and record locator are the student's own and are not kept.
--
--  The bands are checked as the scores are: a domain is one of the eight, and
--  its band is two scores of the section's 200–800, in tens, the lower first.
--
--  SAFE FOR THE APP BEING SERVED. Every new column has a default and every new
--  argument of save_bluebook_score is optional, so the app from before records
--  a practice test as it did.
-- ============================================================================

alter table bluebook_scores add column if not exists official boolean not null default false;
alter table bluebook_scores add column if not exists total_percentile int
  check (total_percentile is null or total_percentile between 1 and 99);
alter table bluebook_scores add column if not exists rw_percentile int
  check (rw_percentile is null or rw_percentile between 1 and 99);
alter table bluebook_scores add column if not exists math_percentile int
  check (math_percentile is null or math_percentile between 1 and 99);
alter table bluebook_scores add column if not exists domains jsonb;

comment on column bluebook_scores.official is
  'An official SAT, from College Board''s SAT score report — not a practice test (0090).';
comment on column bluebook_scores.domains is
  'Each content domain''s performance band from the report''s Knowledge and Skills, as {section: [low, high]} (0090).';

-- Internal. A report's domains, as the check reads them: an object of the
-- eight domains, each [low, high] on the section's scale, in tens, low first.
create or replace function public.bluebook_domains_ok(p jsonb)
returns boolean
language plpgsql immutable set search_path = public as $$
declare
  e   record;
  lo  numeric;
  hi  numeric;
begin
  if jsonb_typeof(p) <> 'object' then return false; end if;
  for e in select * from jsonb_each(p) loop
    if e.key not in ('information_and_ideas', 'craft_and_structure', 'expression_of_ideas',
                     'standard_english_conventions', 'algebra', 'advanced_math',
                     'problem_solving_and_data_analysis', 'geometry_and_trigonometry') then
      return false;
    end if;
    if jsonb_typeof(e.value) <> 'array' or jsonb_array_length(e.value) <> 2
       or jsonb_typeof(e.value->0) <> 'number' or jsonb_typeof(e.value->1) <> 'number' then
      return false;
    end if;
    lo := (e.value->>0)::numeric;
    hi := (e.value->>1)::numeric;
    if lo not between 200 and 800 or hi not between 200 and 800 or lo > hi
       or lo % 10 <> 0 or hi % 10 <> 0 then
      return false;
    end if;
  end loop;
  return true;
end $$;

revoke execute on function public.bluebook_domains_ok(jsonb) from public, anon, authenticated;

alter table bluebook_scores drop constraint if exists bluebook_scores_domains_ok;
alter table bluebook_scores add constraint bluebook_scores_domains_ok
  check (domains is null or bluebook_domains_ok(domains));

-- ------------------------------------------------------------- recording ---
-- 0088's door, with the new fields as optional arguments after its own.
drop function if exists public.save_bluebook_score(uuid, text, date, int, int, int, text);

create or replace function public.save_bluebook_score(
  p_student          uuid,
  p_test_name        text,
  p_taken_on         date,
  p_total            int,
  p_reading_writing  int,
  p_math             int,
  p_read_from        text    default 'typed',
  p_official         boolean default false,
  p_total_percentile int     default null,
  p_rw_percentile    int     default null,
  p_math_percentile  int     default null,
  p_domains          jsonb   default null
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_id      uuid;
  v_name    text  := coalesce(nullif(btrim(p_test_name), ''), 'Bluebook practice test');
  v_domains jsonb := case when p_domains = '{}'::jsonb or jsonb_typeof(p_domains) = 'null' then null else p_domains end;
begin
  if not is_teacher() then raise exception 'only staff record a Bluebook score'; end if;
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if p_taken_on is null then raise exception 'say which day the test was sat'; end if;
  if p_taken_on > current_date + 1 then raise exception 'a test cannot be sat on a day still to come'; end if;
  if p_reading_writing is null or p_reading_writing not between 200 and 800 or p_reading_writing % 10 <> 0 then
    raise exception 'a Reading and Writing score is 200 to 800, in tens';
  end if;
  if p_math is null or p_math not between 200 and 800 or p_math % 10 <> 0 then
    raise exception 'a Math score is 200 to 800, in tens';
  end if;
  if p_total is distinct from p_reading_writing + p_math then
    raise exception 'the total is the two sections added: % + % = %, not %',
      p_reading_writing, p_math, p_reading_writing + p_math, coalesce(p_total::text, 'nothing');
  end if;
  if (p_total_percentile is not null and p_total_percentile not between 1 and 99)
     or (p_rw_percentile is not null and p_rw_percentile not between 1 and 99)
     or (p_math_percentile is not null and p_math_percentile not between 1 and 99) then
    raise exception 'a percentile is 1 to 99';
  end if;
  if v_domains is not null and not bluebook_domains_ok(v_domains) then
    raise exception 'a domain''s band is two scores of 200 to 800, in tens, the lower first, for one of the eight domains';
  end if;
  if exists (select 1 from bluebook_scores where student_id = p_student
                and test_name = v_name and taken_on = p_taken_on) then
    raise exception 'this test is already recorded for that day';
  end if;

  insert into bluebook_scores (student_id, test_name, taken_on, total, reading_writing, math, read_from,
                               official, total_percentile, rw_percentile, math_percentile, domains, created_by)
  values (p_student, v_name, p_taken_on, p_total, p_reading_writing, p_math,
          case when p_read_from = 'report' then 'report' else 'typed' end,
          coalesce(p_official, false), p_total_percentile, p_rw_percentile, p_math_percentile, v_domains,
          auth.uid())
  returning id into v_id;
  return v_id;
end $$;

revoke execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  from public, anon, authenticated;
grant  execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  to authenticated;

comment on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb) is
  'Records a student''s SAT score from Bluebook — an official SAT or a practice test — with its percentiles and domain bands where the report gives them: staff only, on College Board''s scale, the total the sections added, once (0088, 0090).';

-- ---------------------------------------------------- the parent's card ----
-- 0088's student_report, each score with whether it was an official SAT, its
-- percentiles and its domains' bands.
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
    'subjects', v_subjects,
    'bluebook', coalesce((
      select jsonb_agg(jsonb_build_object(
               'test_name', b.test_name, 'taken_on', b.taken_on, 'total', b.total,
               'reading_writing', b.reading_writing, 'math', b.math,
               'official', b.official, 'total_percentile', b.total_percentile,
               'rw_percentile', b.rw_percentile, 'math_percentile', b.math_percentile,
               'domains', b.domains)
             order by b.taken_on, b.created_at)
        from bluebook_scores b where b.student_id = v_student), '[]'::jsonb));
end $$;

revoke execute on function public.student_report(text) from public, anon, authenticated;
grant  execute on function public.student_report(text) to anon, authenticated;
