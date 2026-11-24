-- ============================================================================
--  The Section Progress Report goes to the parent, through the PC (0103)
--
--    psql "$DATABASE_URL" -f supabase/tests/section_report.sql
--
--  What has to hold:
--
--    * the student's PC sets the parent's name and email; an admin too
--    * another PC and a teacher do not; signed out cannot
--    * an address that is not one is refused; both empty forgets them
--    * staff and the student's PC read them; another PC does not
--    * nobody writes student_parents or parent_report_emails directly
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

create or replace function public.__section_report_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc  profiles;
  pc2 profiles;
  stu profiles;
  txt text; n int; e text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'sr.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Sara Rao"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'sr.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Pat', 'Parent', 'sr.pc@example.test');
  pc2 := create_pc_profile('Pia', 'Elsewhere', 'sr.pc2@example.test');
  perform __as(t_id);
  select * into stu from create_student('Sami', 'Report', pc.id);

  -- ============ 1. who sets it ============
  perform __as(pc.id);
  perform set_parent_contact(stu.id, 'Dana Report', '  Dana@Example.TEST ');
  perform __as(null, 'postgres');
  select parent_email into e from student_parents where student_id = stu.id;
  return query select '1 set'::text, 'the student''s PC sets it, tidied'::text, 'dana@example.test'::text,
    coalesce(e, 'nothing'), __verdict(e = 'dana@example.test');

  perform __as(ad_id);
  perform set_parent_contact(stu.id, 'Dana Report', 'dana.r@example.test');
  perform __as(null, 'postgres');
  select parent_email into e from student_parents where student_id = stu.id;
  return query select '1 set'::text, 'an admin sets it'::text, 'dana.r@example.test'::text,
    coalesce(e, 'nothing'), __verdict(e = 'dana.r@example.test');

  perform __as(pc2.id);
  begin perform set_parent_contact(stu.id, null, 'x@example.test'); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '1 set'::text, 'another PC does not'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(t_id);
  begin perform set_parent_contact(stu.id, null, 'x@example.test'); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '1 set'::text, 'a teacher does not: it goes through the PC'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'anon');
  begin perform set_parent_contact(stu.id, null, 'x@example.test'); txt := 'set';
  exception when others then txt := 'refused'; end;
  return query select '1 set'::text, 'signed out cannot'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  perform __as(pc.id);
  begin perform set_parent_contact(stu.id, null, 'not an address'); txt := 'set';
  exception when others then txt := sqlerrm; end;
  return query select '1 set'::text, 'an address that is not one'::text, 'refused'::text, txt,
    __verdict(txt = 'that is not an email address');

  -- ============ 2. who reads it ============
  perform __as(t_id);
  select count(*) into n from student_parents where student_id = stu.id;
  return query select '2 readers'::text, 'a teacher reads it'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc.id);
  select count(*) into n from student_parents where student_id = stu.id;
  return query select '2 readers'::text, 'the student''s PC reads it'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc2.id);
  select count(*) into n from student_parents where student_id = stu.id;
  return query select '2 readers'::text, 'another PC does not'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 3. nobody writes the tables ============
  perform __as(pc.id);
  begin update student_parents set parent_email = 'y@example.test' where student_id = stu.id; txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '3 tables'::text, 'the PC does not write student_parents directly'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');
  begin insert into parent_report_emails (student_id, sent_to, status) values (stu.id, 'y@example.test', 'sent'); txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '3 tables'::text, 'nor the send log'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 4. forgetting ============
  perform set_parent_contact(stu.id, '', '');
  perform __as(null, 'postgres');
  select count(*) into n from student_parents where student_id = stu.id;
  return query select '4 forget'::text, 'both empty forgets them'::text, '0'::text, n::text, __verdict(n = 0);

  -- Cleanup.
  delete from profiles where id in (stu.id, t_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__section_report_check();

drop function public.__section_report_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
