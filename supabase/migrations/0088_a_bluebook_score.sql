-- ============================================================================
--  0088 — a Bluebook score
--
--  Students sit College Board's full practice tests in Bluebook on their own,
--  and the score report is what tells a parent where they are on the scale
--  colleges read: 400 to 1600. Until now it lived in an email or a screenshot.
--  A teacher records it here — read off the report College Board gives, or
--  typed from it — and it sits beside the targeted tests on the student's
--  progress, for staff, their PC and their parent.
--
--  WHAT IS KEPT. The test, the day it was sat, the total and the two section
--  scores — and nothing else of the report: not the file, which carries the
--  student's name and more, and is read in the browser and let go.
--
--  WHAT IS CHECKED. What College Board's scale makes true: a section is 200 to
--  800 in tens, the total is 400 to 1600 in tens, and the total is the two
--  sections added — which is also what tells a misread report from a real
--  one. A test is recorded once, and not on a day still to come.
--
--  WHO. Staff record and read, any student, as they read every student's
--  progress (0063); the teacher who recorded a score or an admin deletes it.
--  The PC reads their own students'. The student and their parent read theirs
--  on the parent card (0070), through the student's key.
--
--  It goes with the student: a student the clean-up deletes takes their
--  scores with them (0071), and no report was drawn from them to keep (0087).
-- ============================================================================

create table if not exists bluebook_scores (
  id              uuid primary key default gen_random_uuid(),
  student_id      uuid not null references profiles(id) on delete cascade,
  test_name       text not null default 'Bluebook practice test'
                    check (btrim(test_name) <> '' and length(test_name) <= 80),
  taken_on        date not null,
  total           int  not null check (total between 400 and 1600 and total % 10 = 0),
  reading_writing int  not null check (reading_writing between 200 and 800 and reading_writing % 10 = 0),
  math            int  not null check (math between 200 and 800 and math % 10 = 0),
  read_from       text not null default 'typed' check (read_from in ('report', 'typed')),
  created_by      uuid references profiles(id) on delete set null,
  created_at      timestamptz not null default now(),
  check (total = reading_writing + math),
  unique (student_id, test_name, taken_on)
);

comment on table bluebook_scores is
  'A student''s Bluebook practice test scores, recorded by staff from College Board''s score report (0088).';
comment on column bluebook_scores.read_from is
  'report: read off the score report by the browser and confirmed; typed: entered by hand.';

create index if not exists bluebook_scores_student on bluebook_scores (student_id, taken_on);

alter table bluebook_scores enable row level security;

drop policy if exists bluebook_scores_staff_read on bluebook_scores;
create policy bluebook_scores_staff_read on bluebook_scores for select
  using ((select is_teacher()));

drop policy if exists bluebook_scores_pc_read on bluebook_scores;
create policy bluebook_scores_pc_read on bluebook_scores for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on bluebook_scores from anon, authenticated;

-- ------------------------------------------------------------- recording ---
create or replace function public.save_bluebook_score(
  p_student         uuid,
  p_test_name       text,
  p_taken_on        date,
  p_total           int,
  p_reading_writing int,
  p_math            int,
  p_read_from       text default 'typed'
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_id   uuid;
  v_name text := coalesce(nullif(btrim(p_test_name), ''), 'Bluebook practice test');
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
  if exists (select 1 from bluebook_scores where student_id = p_student
                and test_name = v_name and taken_on = p_taken_on) then
    raise exception 'this test is already recorded for that day';
  end if;

  insert into bluebook_scores (student_id, test_name, taken_on, total, reading_writing, math, read_from, created_by)
  values (p_student, v_name, p_taken_on, p_total, p_reading_writing, p_math,
          case when p_read_from = 'report' then 'report' else 'typed' end, auth.uid())
  returning id into v_id;
  return v_id;
end $$;

revoke execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text) from public, anon, authenticated;
grant  execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text) to authenticated;

comment on function public.save_bluebook_score(uuid, text, date, int, int, int, text) is
  'Records a student''s Bluebook practice test score: staff only, on College Board''s scale, the total the sections added, once (0088).';

create or replace function public.delete_bluebook_score(p_id uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not is_teacher() then raise exception 'only staff delete a Bluebook score'; end if;
  if not exists (select 1 from bluebook_scores where id = p_id) then raise exception 'no such score'; end if;
  if not is_admin() and not exists (select 1 from bluebook_scores where id = p_id and created_by = auth.uid()) then
    raise exception 'only the teacher who recorded it or an admin deletes a score';
  end if;
  delete from bluebook_scores where id = p_id;
end $$;

revoke execute on function public.delete_bluebook_score(uuid) from public, anon, authenticated;
grant  execute on function public.delete_bluebook_score(uuid) to authenticated;

comment on function public.delete_bluebook_score(uuid) is
  'Deletes a Bluebook score: the teacher who recorded it, or an admin (0088).';

-- ---------------------------------------------------- the parent's card ----
-- 0086's student_report, with the student's Bluebook scores beside the
-- subjects: the test, the day and the three scores, nothing about who
-- recorded them.
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
               'reading_writing', b.reading_writing, 'math', b.math)
             order by b.taken_on, b.created_at)
        from bluebook_scores b where b.student_id = v_student), '[]'::jsonb));
end $$;

revoke execute on function public.student_report(text) from public, anon, authenticated;
grant  execute on function public.student_report(text) to anon, authenticated;
