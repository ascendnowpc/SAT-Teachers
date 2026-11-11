-- ============================================================================
--  A Bluebook score (0088, 0090, 0099)
--
--    psql "$DATABASE_URL" -f supabase/tests/bluebook.sql
--
--  What has to hold:
--
--  Recording one
--    * staff record a score — any teacher, any student; a signed-in student
--      role and anon cannot through the staff door, and nobody writes the
--      table but through the functions
--    * College Board's scale: a section 200 to 800 in tens; the total the two
--      sections added; not a day still to come; one test once a day
--    * an official SAT keeps its percentiles and its domains' bands (0090);
--      a percentile is 1 to 99, a domain one of the eight, a band two scores
--      on the section's scale, in tens, the lower first
--
--  Reading them
--    * staff read every student's; the PC their own students' and nobody
--      else's; the student and their parent read theirs on the parent card,
--      with nothing about who recorded them; anon reads nothing
--
--  Deleting one
--    * the teacher who recorded it or an admin; not another teacher, not the PC
--    * a student deleted takes their scores with them
--
--  The PC and the student record one too (0099)
--    * the PC records for their own students, and not another PC's
--    * the student records their own through their key, under the same checks
--    * each score says who recorded it, as a role; staff scores before 0099
--      say teacher or admin
--    * the student's list carries every score with who added it, and which
--      are theirs to delete
--    * the PC deletes what they recorded, not a teacher's; the student
--      deletes what they added, not a teacher's or the PC's; a made-up key
--      does nothing
--
--  The grants
--    * the staff doors are signed in only; the student's three doors are
--      open signed out (the key is the check); bluebook_record is internal
--
--  Every row must read PASS. Cleans up after itself.
-- ============================================================================

create or replace function public.__as(p uuid, r text default 'authenticated') returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims',
    case when p is null then '' else json_build_object('sub', p::text, 'role', r)::text end, true);
  execute format('set local role %I', r);
end $$;

create or replace function public.__verdict(ok boolean) returns text
language sql as $$ select case when ok then 'PASS' else 'FAIL' end $$;

create or replace function public.__bluebook_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();   -- the teacher who records it
  x_id  uuid := gen_random_uuid();   -- another teacher
  ad_id uuid := gen_random_uuid();   -- an admin
  pc    profiles;
  pc2   profiles;
  stu   profiles;
  other profiles;
  b1 uuid; b2 uuid; b3 uuid; b4 uuid;
  bands jsonb := '{"information_and_ideas":[550,600],"craft_and_structure":[610,670],
                   "expression_of_ideas":[680,800],"standard_english_conventions":[610,670],
                   "algebra":[680,800],"advanced_math":[610,670],
                   "problem_solving_and_data_analysis":[610,670],"geometry_and_trigonometry":[680,800]}';
  n int; txt text; j jsonb; pin text; skey text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'bb.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (x_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'bb.other@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sam Otter"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'bb.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id in (t_id, x_id);
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Pat', 'Bluebook', 'bb.pc@example.test');
  pc2 := create_pc_profile('Pia', 'Elsewhere', 'bb.pc2@example.test');

  perform __as(t_id);
  select * into stu   from create_student('Bea', 'Bluebook', pc.id);
  select * into other from create_student('Oli', 'Bluebook', pc2.id);

  -- ============ 1. recording one ============
  b1 := save_bluebook_score(stu.id, 'Practice Test 4', current_date - 30, 1250, 620, 630, 'report');
  select test_name || ' ' || total || '=' || reading_writing || '+' || math || ' ' || read_from || ' by ' ||
         (case when created_by = t_id then 'the teacher' else coalesce(created_by::text, 'nobody') end)
    into txt from bluebook_scores where id = b1;
  return query select '1 recording'::text, 'a teacher records a score read off the report'::text,
    'Practice Test 4 1250=620+630 report by the teacher'::text, coalesce(txt, '(none)'),
    __verdict(txt = 'Practice Test 4 1250=620+630 report by the teacher');

  perform __as(x_id);
  b2 := save_bluebook_score(stu.id, '', current_date - 10, 1300, 650, 650);
  select test_name || ' ' || read_from into txt from bluebook_scores where id = b2;
  return query select '1 recording'::text, 'any teacher can, typed, and a test with no name is a Bluebook practice test'::text,
    'Bluebook practice test typed'::text, coalesce(txt, '(none)'), __verdict(txt = 'Bluebook practice test typed');
  b3 := save_bluebook_score(other.id, 'Practice Test 1', current_date - 5, 1000, 500, 500);

  begin perform save_bluebook_score(stu.id, 'Practice Test 5', current_date, 1260, 620, 630); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a total that is not the two sections added is refused'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'Practice Test 5', current_date, 1250, 625, 625); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a section not in tens is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'Practice Test 5', current_date, 1700, 900, 800); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a section over 800 is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'Practice Test 5', current_date + 7, 1250, 620, 630); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a day still to come is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'Practice Test 4', current_date - 30, 1250, 620, 630); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'the same test on the same day twice is refused'::text, 'refused'::text,
    txt, __verdict(txt = 'refused');

  -- An official SAT, read off College Board's score report (0090).
  b4 := save_bluebook_score(stu.id, 'SAT May 2026', current_date - 3, 1350, 650, 700, 'report',
                            true, 90, 85, 92, bands);
  select official || ' ' || total_percentile || '/' || rw_percentile || '/' || math_percentile || ' ' ||
         (domains->'information_and_ideas')::text || ' ' || (select count(*) from jsonb_object_keys(domains))
    into txt from bluebook_scores where id = b4;
  return query select '1 recording'::text, 'an official SAT keeps its percentiles and its eight domains'' bands'::text,
    'true 90/85/92 [550, 600] 8'::text, coalesce(txt, '(none)'), __verdict(txt = 'true 90/85/92 [550, 600] 8');

  begin perform save_bluebook_score(stu.id, 'SAT June 2026', current_date - 2, 1350, 650, 700, 'report',
                                    true, 100, null, null, null); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a percentile of 100 is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'SAT June 2026', current_date - 2, 1350, 650, 700, 'report',
                                    true, null, null, null, '{"vocabulary":[550,600]}'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a domain that is not one of the eight is refused'::text, 'refused'::text,
    txt, __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'SAT June 2026', current_date - 2, 1350, 650, 700, 'report',
                                    true, null, null, null, '{"algebra":[800,680]}'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a band higher end first is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform save_bluebook_score(stu.id, 'SAT June 2026', current_date - 2, 1350, 650, 700, 'report',
                                    true, null, null, null, '{"algebra":[680,805]}'); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'and a band off the scale'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  begin update bluebook_scores set domains = '{"algebra":"high"}' where id = b4; txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'the table itself refuses a band that is not two scores'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  -- A student has no sign-in of their own (0067): one signed in with the
  -- student role still cannot use the staff door. Theirs is the key (§5).
  perform __as(stu.id);
  begin perform save_bluebook_score(stu.id, 'Practice Test 6', current_date, 1600, 800, 800); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'a signed-in student role cannot use the staff door'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'anon');
  begin perform save_bluebook_score(stu.id, 'Practice Test 6', current_date, 1600, 800, 800); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'nor can anon'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(t_id);
  begin
    insert into bluebook_scores (student_id, taken_on, total, reading_writing, math)
    values (stu.id, current_date, 1600, 800, 800);
    txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'nobody writes the table but through the function'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. reading them ============
  perform __as(x_id);
  select count(*) into n from bluebook_scores where student_id in (stu.id, other.id);
  return query select '2 reading'::text, 'staff read every student''s'::text, '4'::text, n::text, __verdict(n = 4);

  perform __as(pc.id);
  select count(*) into n from bluebook_scores where student_id = stu.id;
  return query select '2 reading'::text, 'the PC reads their student''s'::text, '3'::text, n::text, __verdict(n = 3);
  select count(*) into n from bluebook_scores where student_id = other.id;
  return query select '2 reading'::text, 'and not another PC''s student''s'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(stu.id);
  select count(*) into n from bluebook_scores;
  return query select '2 reading'::text, 'a signed-in student reads no row'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'anon');
  select count(*) into n from bluebook_scores;
  return query select '2 reading'::text, 'nor does anon'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'postgres');
  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  perform __as(null, 'anon');
  skey := student_sign_in(stu.display_id, pin)->>'key';
  j := student_report(skey)->'bluebook';
  select string_agg(e->>'total', ',' order by e->>'taken_on') into txt from jsonb_array_elements(j) e;
  return query select '2 reading'::text, 'the parent card carries the student''s scores, oldest first'::text,
    '1250,1300,1350'::text, coalesce(txt, '(none)'), __verdict(txt = '1250,1300,1350');
  select (e->>'official') || ' ' || (e->>'total_percentile') || ' ' || (e->'domains'->>'algebra') into txt
    from jsonb_array_elements(j) e where e->>'test_name' = 'SAT May 2026';
  return query select '2 reading'::text, 'with whether it was an official SAT, its percentile and its bands'::text,
    'true 90 [680, 800]'::text, coalesce(txt, '(none)'), __verdict(txt = 'true 90 [680, 800]');
  return query select '2 reading'::text, 'with nothing about who recorded them'::text, 'absent'::text,
    (case when position('created_by' in j::text) > 0 or position(t_id::text in j::text) > 0 then 'present' else 'absent' end),
    __verdict(position('created_by' in j::text) = 0 and position(t_id::text in j::text) = 0);

  -- ============ 3. deleting one ============
  perform __as(x_id);
  begin perform delete_bluebook_score(b1); txt := 'deleted';
  exception when others then txt := 'refused'; end;
  return query select '3 deleting'::text, 'another teacher cannot delete a score they did not record'::text,
    'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(pc.id);
  begin perform delete_bluebook_score(b1); txt := 'deleted';
  exception when others then txt := 'refused'; end;
  return query select '3 deleting'::text, 'nor can the PC'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(t_id);
  perform delete_bluebook_score(b1);
  select count(*) into n from bluebook_scores where id = b1;
  return query select '3 deleting'::text, 'the teacher who recorded it can'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(ad_id);
  perform delete_bluebook_score(b2);
  select count(*) into n from bluebook_scores where id = b2;
  return query select '3 deleting'::text, 'and an admin can delete anyone''s'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'postgres');
  delete from profiles where id = other.id;
  select count(*) into n from bluebook_scores where id = b3;
  return query select '3 deleting'::text, 'a student deleted takes their scores with them'::text, '0'::text, n::text,
    __verdict(n = 0);

  -- ============ 5. the PC and the student record one too (0099) ============
  perform __as(null, 'postgres');
  select string_agg(distinct recorded_by, ',') into txt from bluebook_scores where student_id = stu.id;
  return query select '5 who'::text, 'a staff score says it was a teacher''s'::text, 'teacher'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'teacher');

  perform __as(pc.id);
  b4 := save_bluebook_score(stu.id, 'Practice Test 7', current_date - 2, 1400, 700, 700);
  select recorded_by || ' ' || (created_by = pc.id)::text into txt from bluebook_scores where id = b4;
  return query select '5 PC'::text, 'the PC records one for their own student'::text, 'pc true'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'pc true');

  perform __as(pc2.id);
  begin perform save_bluebook_score(stu.id, 'Practice Test 8', current_date, 1400, 700, 700); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '5 PC'::text, 'and not for another PC''s student'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(pc.id);
  begin perform save_bluebook_score(stu.id, 'Practice Test 8', current_date, 1410, 700, 700); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '5 PC'::text, 'under the same checks: a wrong total is refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'anon');
  declare s_own uuid;
  begin
    s_own := student_save_bluebook_score(skey, 'Practice Test 9', current_date - 1, 1450, 720, 730, 'report');
    perform __as(null, 'postgres');
    select recorded_by || ' ' || read_from || ' ' || (created_by = stu.id)::text into txt from bluebook_scores where id = s_own;
    return query select '5 student'::text, 'the student records their own through their key'::text,
      'student report true'::text, coalesce(txt, '(none)'), __verdict(txt = 'student report true');

    perform __as(null, 'anon');
    begin perform student_save_bluebook_score(skey, 'Practice Test 9', current_date - 1, 1450, 720, 730); txt := 'saved';
    exception when others then txt := sqlerrm; end;
    return query select '5 student'::text, 'under the same checks: the same test twice is refused'::text,
      'this test is already recorded for that day'::text, txt,
      __verdict(txt = 'this test is already recorded for that day');
    begin perform student_save_bluebook_score(skey, 'Practice Test 10', current_date + 5, 1450, 720, 730); txt := 'saved';
    exception when others then txt := sqlerrm; end;
    return query select '5 student'::text, 'and a day still to come'::text,
      'a test cannot be sat on a day still to come'::text, txt,
      __verdict(txt = 'a test cannot be sat on a day still to come');
    begin perform student_save_bluebook_score('not-a-key', 'Practice Test 10', current_date, 1450, 720, 730); txt := 'saved';
    exception when others then txt := sqlerrm; end;
    return query select '5 student'::text, 'a made-up key records nothing'::text, 'signed out'::text, txt,
      __verdict(txt = 'signed out');

    j := student_bluebook_scores(skey);
    select string_agg((e->>'recorded_by') || ':' || (e->>'mine'), ',' order by e->>'taken_on') into txt
      from jsonb_array_elements(j) e;
    return query select '5 list'::text, 'the student''s list: who added each, and which are theirs'::text,
      'teacher:false,pc:false,student:true'::text, coalesce(txt, '(none)'),
      __verdict(txt = 'teacher:false,pc:false,student:true');
    return query select '5 list'::text, 'with no one''s id'::text, 'absent'::text,
      (case when position(t_id::text in j::text) > 0 or position(pc.id::text in j::text) > 0
              or position('created_by' in j::text) > 0 then 'present' else 'absent' end),
      __verdict(position(t_id::text in j::text) = 0 and position(pc.id::text in j::text) = 0
                and position('created_by' in j::text) = 0);

    -- Deleting: each their own.
    select (e->>'id')::uuid into b1 from jsonb_array_elements(j) e where e->>'recorded_by' = 'teacher' limit 1;
    begin perform student_delete_bluebook_score(skey, b1); txt := 'deleted';
    exception when others then txt := 'refused'; end;
    return query select '5 delete'::text, 'the student cannot delete a teacher''s score'::text, 'refused'::text, txt,
      __verdict(txt = 'refused');
    begin perform student_delete_bluebook_score(skey, b4); txt := 'deleted';
    exception when others then txt := 'refused'; end;
    return query select '5 delete'::text, 'nor the PC''s'::text, 'refused'::text, txt, __verdict(txt = 'refused');

    perform __as(pc.id);
    begin perform delete_bluebook_score(s_own); txt := 'deleted';
    exception when others then txt := 'refused'; end;
    return query select '5 delete'::text, 'the PC cannot delete the student''s'::text, 'refused'::text, txt,
      __verdict(txt = 'refused');
    perform delete_bluebook_score(b4);
    perform __as(null, 'postgres');
    select count(*) into n from bluebook_scores where id = b4;
    return query select '5 delete'::text, 'the PC deletes what they recorded'::text, '0'::text, n::text, __verdict(n = 0);

    perform __as(null, 'anon');
    begin perform student_delete_bluebook_score('not-a-key', s_own); txt := 'deleted';
    exception when others then txt := sqlerrm; end;
    return query select '5 delete'::text, 'a made-up key deletes nothing'::text, 'signed out'::text, txt,
      __verdict(txt = 'signed out');
    perform student_delete_bluebook_score(skey, s_own);
    perform __as(null, 'postgres');
    select count(*) into n from bluebook_scores where id = s_own;
    return query select '5 delete'::text, 'the student deletes what they added'::text, '0'::text, n::text,
      __verdict(n = 0);
  end;

  -- ============ 4. grants ============
  for txt in select unnest(array['save_bluebook_score(uuid,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)',
                                 'delete_bluebook_score(uuid)']) loop
    return query select '4 grants'::text, txt || ' — signed in only'::text, 'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
            else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  for txt in select unnest(array['student_save_bluebook_score(text,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)',
                                 'student_delete_bluebook_score(text,uuid)', 'student_bluebook_scores(text)']) loop
    return query select '4 grants'::text, txt || ' — signed out too'::text, 'anon'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon' else 'nobody' end),
      __verdict(has_function_privilege('anon', 'public.'||txt, 'execute'));
  end loop;
  return query select '4 grants'::text, 'bluebook_record — internal'::text, 'nobody signed in'::text,
    (case when has_function_privilege('anon', 'public.bluebook_record(uuid,uuid,text,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)', 'execute')
            or has_function_privilege('authenticated', 'public.bluebook_record(uuid,uuid,text,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)', 'execute')
          then 'somebody' else 'nobody signed in' end),
    __verdict(not has_function_privilege('anon', 'public.bluebook_record(uuid,uuid,text,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)', 'execute')
              and not has_function_privilege('authenticated', 'public.bluebook_record(uuid,uuid,text,text,date,integer,integer,integer,text,boolean,integer,integer,integer,jsonb)', 'execute'));

  return query select '4 grants'::text, 'bluebook_domains_ok(jsonb) — internal'::text, 'nobody signed in'::text,
    (case when has_function_privilege('anon', 'public.bluebook_domains_ok(jsonb)', 'execute')
            or has_function_privilege('authenticated', 'public.bluebook_domains_ok(jsonb)', 'execute')
          then 'somebody' else 'nobody signed in' end),
    __verdict(not has_function_privilege('anon', 'public.bluebook_domains_ok(jsonb)', 'execute')
              and not has_function_privilege('authenticated', 'public.bluebook_domains_ok(jsonb)', 'execute'));
  return query select '4 grants'::text, 'save_bluebook_score with 0088''s arguments only — replaced'::text, 'absent'::text,
    (case when to_regprocedure('public.save_bluebook_score(uuid,text,date,integer,integer,integer,text)') is null
          then 'absent' else 'present' end),
    __verdict(to_regprocedure('public.save_bluebook_score(uuid,text,date,integer,integer,integer,text)') is null);

  -- Cleanup.
  perform __as(null, 'postgres');
  delete from student_login_keys where student_id = stu.id;
  delete from bluebook_scores where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, x_id, ad_id);
end $fn$;

select * from public.__bluebook_check();

drop function public.__bluebook_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
