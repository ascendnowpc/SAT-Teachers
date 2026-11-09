-- ============================================================================
--  A Bluebook score (0088)
--
--    psql "$DATABASE_URL" -f supabase/tests/bluebook.sql
--
--  What has to hold:
--
--  Recording one
--    * staff record a score — any teacher, any student; a PC, a student and
--      anon cannot, and nobody writes the table but through the function
--    * College Board's scale: a section 200 to 800 in tens; the total the two
--      sections added; not a day still to come; one test once a day
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
--  The grants
--    * both functions are signed in only
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
  b1 uuid; b2 uuid; b3 uuid;
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

  perform __as(pc.id);
  begin perform save_bluebook_score(stu.id, 'Practice Test 6', current_date, 1250, 620, 630); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'the PC cannot record one'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(stu.id);
  begin perform save_bluebook_score(stu.id, 'Practice Test 6', current_date, 1600, 800, 800); txt := 'saved';
  exception when others then txt := 'refused'; end;
  return query select '1 recording'::text, 'nor can a student, of their own'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

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
  return query select '2 reading'::text, 'staff read every student''s'::text, '3'::text, n::text, __verdict(n = 3);

  perform __as(pc.id);
  select count(*) into n from bluebook_scores where student_id = stu.id;
  return query select '2 reading'::text, 'the PC reads their student''s'::text, '2'::text, n::text, __verdict(n = 2);
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
    '1250,1300'::text, coalesce(txt, '(none)'), __verdict(txt = '1250,1300');
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

  -- ============ 4. grants ============
  for txt in select unnest(array['save_bluebook_score(uuid,text,date,integer,integer,integer,text)',
                                 'delete_bluebook_score(uuid)']) loop
    return query select '4 grants'::text, txt || ' — signed in only'::text, 'authenticated'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon too!'
            when has_function_privilege('authenticated', 'public.'||txt, 'execute') then 'authenticated'
            else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  -- Cleanup.
  delete from bluebook_scores where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, x_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, x_id, ad_id);
end $fn$;

select * from public.__bluebook_check();

drop function public.__bluebook_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
