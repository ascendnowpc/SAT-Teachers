-- ============================================================================
--  0099 — everyone with the student records a Bluebook score
--
--  0088 made a Bluebook score the staff's to record: a teacher or an admin,
--  and nobody else. But the score report lands in the student's inbox, and
--  their parent or their PC is often the first to see it — and had to send it
--  on to a teacher to have it added. Now four people record one:
--
--    a teacher or an admin   any student, as before (save_bluebook_score)
--    the student's PC        their own students, and nobody else's
--                            (save_bluebook_score, signed in as the PC)
--    the student             their own, from their account — and so a parent
--                            signed in with the student's ID and PIN
--                            (student_save_bluebook_score, through the key)
--
--  The checks do not move: College Board's scale, the total the two sections
--  added, not a day still to come, one test once a day, and 0090's
--  percentiles and bands. They live in one internal function now, which all
--  three doors call, so a score cannot be recorded more loosely by one of them.
--
--  WHO RECORDED IT is kept as a role beside created_by — teacher, admin, pc or
--  student — so every list can say "added by the PC" without a name, and so a
--  score a student added can be told apart from one staff added: a student has
--  no sign-in of their own, and created_by holds their profile.
--
--  DELETING. An admin deletes any score. Anybody else deletes what they
--  recorded themselves: the teacher, the PC, or the student (through their
--  key) — and nobody deletes somebody else's, so a student cannot take back a
--  score their teacher recorded, nor a PC a teacher's.
--
--  student_bluebook_scores(key) is what the student's account lists, with
--  each score's id, who added it (as a role) and whether it is theirs to
--  delete. student_report (0090) is unchanged.
-- ============================================================================

alter table bluebook_scores add column if not exists recorded_by text
  check (recorded_by is null or recorded_by in ('teacher', 'admin', 'pc', 'student'));

comment on column bluebook_scores.recorded_by is
  'Who recorded the score, as a role: teacher, admin, pc, or student (through their key) (0099).';

-- Every score so far was recorded by staff (0088); say which.
update bluebook_scores b
   set recorded_by = case when p.role = 'admin' then 'admin' else 'teacher' end
  from profiles p
 where p.id = b.created_by and b.recorded_by is null;
update bluebook_scores set recorded_by = 'teacher' where recorded_by is null;

-- ------------------------------------------------- the one set of checks ---
-- Internal: every door's checks and the insert. The caller has already said
-- who is recording, and for which student.
create or replace function public.bluebook_record(
  p_student          uuid,
  p_by               uuid,
  p_role             text,
  p_test_name        text,
  p_taken_on         date,
  p_total            int,
  p_reading_writing  int,
  p_math             int,
  p_read_from        text,
  p_official         boolean,
  p_total_percentile int,
  p_rw_percentile    int,
  p_math_percentile  int,
  p_domains          jsonb
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_id      uuid;
  v_name    text  := coalesce(nullif(btrim(p_test_name), ''), 'Bluebook practice test');
  v_domains jsonb := case when p_domains = '{}'::jsonb or jsonb_typeof(p_domains) = 'null' then null else p_domains end;
begin
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
                               official, total_percentile, rw_percentile, math_percentile, domains,
                               created_by, recorded_by)
  values (p_student, v_name, p_taken_on, p_total, p_reading_writing, p_math,
          case when p_read_from = 'report' then 'report' else 'typed' end,
          coalesce(p_official, false), p_total_percentile, p_rw_percentile, p_math_percentile, v_domains,
          p_by, p_role)
  returning id into v_id;
  return v_id;
end $$;

revoke execute on function public.bluebook_record(uuid, uuid, text, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  from public, anon, authenticated;

-- ------------------------------------------------ staff, and the PC -------
-- 0090's signature, unchanged: the app being served calls it as it did.
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
declare v_role text;
begin
  if is_admin() then
    v_role := 'admin';
  elsif is_teacher() then
    v_role := 'teacher';
  elsif is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()) then
    v_role := 'pc';
  elsif is_pc() then
    raise exception 'a PC records a score for their own students';
  else
    raise exception 'only staff, the student''s PC or the student records a Bluebook score';
  end if;

  return bluebook_record(p_student, auth.uid(), v_role, p_test_name, p_taken_on, p_total,
                         p_reading_writing, p_math, p_read_from, p_official,
                         p_total_percentile, p_rw_percentile, p_math_percentile, p_domains);
end $$;

revoke execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  from public, anon, authenticated;
grant  execute on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  to authenticated;

comment on function public.save_bluebook_score(uuid, text, date, int, int, int, text, boolean, int, int, int, jsonb) is
  'Records a student''s SAT score from Bluebook: a teacher or an admin for any student, a PC for their own (0088, 0090, 0099).';

-- ------------------------------------------------------- the student -----
create or replace function public.student_save_bluebook_score(
  p_key              text,
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
declare v_student uuid := student_for_key(p_key);
begin
  return bluebook_record(v_student, v_student, 'student', p_test_name, p_taken_on, p_total,
                         p_reading_writing, p_math, p_read_from, p_official,
                         p_total_percentile, p_rw_percentile, p_math_percentile, p_domains);
end $$;

revoke execute on function public.student_save_bluebook_score(text, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  from public, anon, authenticated;
grant  execute on function public.student_save_bluebook_score(text, text, date, int, int, int, text, boolean, int, int, int, jsonb)
  to anon, authenticated;

comment on function public.student_save_bluebook_score(text, text, date, int, int, int, text, boolean, int, int, int, jsonb) is
  'The signed-in student (or their parent, with the student''s ID and PIN) records their own SAT score, under the same checks as staff (0099).';

-- ------------------------------------------------------------- deleting ---
create or replace function public.delete_bluebook_score(p_id uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if not (is_teacher() or is_pc()) then raise exception 'only staff or a PC delete a Bluebook score here'; end if;
  if not exists (select 1 from bluebook_scores where id = p_id) then raise exception 'no such score'; end if;
  if not is_admin() and not exists (select 1 from bluebook_scores
                                     where id = p_id and created_by = auth.uid() and recorded_by <> 'student') then
    raise exception 'only whoever recorded it or an admin deletes a score';
  end if;
  delete from bluebook_scores where id = p_id;
end $$;

revoke execute on function public.delete_bluebook_score(uuid) from public, anon, authenticated;
grant  execute on function public.delete_bluebook_score(uuid) to authenticated;

comment on function public.delete_bluebook_score(uuid) is
  'Deletes a Bluebook score: whoever recorded it — the teacher or the PC — or an admin (0088, 0099).';

create or replace function public.student_delete_bluebook_score(p_key text, p_id uuid)
returns void
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  if not exists (select 1 from bluebook_scores where id = p_id and student_id = v_student) then
    raise exception 'no such score';
  end if;
  if not exists (select 1 from bluebook_scores
                  where id = p_id and student_id = v_student and recorded_by = 'student') then
    raise exception 'only a score you added yourself can be deleted here; ask your teacher about this one';
  end if;
  delete from bluebook_scores where id = p_id;
end $$;

revoke execute on function public.student_delete_bluebook_score(text, uuid) from public, anon, authenticated;
grant  execute on function public.student_delete_bluebook_score(text, uuid) to anon, authenticated;

comment on function public.student_delete_bluebook_score(text, uuid) is
  'The signed-in student deletes a Bluebook score they added themselves, and no other (0099).';

-- ------------------------------------------------- the student's list -----
create or replace function public.student_bluebook_scores(p_key text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return coalesce((
    select jsonb_agg(jsonb_build_object(
             'id', b.id, 'test_name', b.test_name, 'taken_on', b.taken_on, 'total', b.total,
             'reading_writing', b.reading_writing, 'math', b.math, 'read_from', b.read_from,
             'official', b.official, 'total_percentile', b.total_percentile,
             'rw_percentile', b.rw_percentile, 'math_percentile', b.math_percentile,
             'domains', b.domains, 'recorded_by', b.recorded_by,
             'mine', b.recorded_by = 'student')
           order by b.taken_on, b.created_at)
      from bluebook_scores b where b.student_id = v_student), '[]'::jsonb);
end $$;

revoke execute on function public.student_bluebook_scores(text) from public, anon, authenticated;
grant  execute on function public.student_bluebook_scores(text) to anon, authenticated;

comment on function public.student_bluebook_scores(text) is
  'The signed-in student''s Bluebook scores, oldest first, each with who added it (as a role) and whether it is theirs to delete (0099).';
