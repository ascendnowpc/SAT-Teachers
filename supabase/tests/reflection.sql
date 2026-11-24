-- ============================================================================
--  After the exam: a reflection, and the PC's line (0108)
--
--    psql "$DATABASE_URL" -f supabase/tests/reflection.sql
--
--  What has to hold:
--
--    * the student writes their three answers and whether they retake, by
--      their key, and changes them; one row per SAT date
--    * not on an SAT still to come; not over 600 characters; not with a
--      made-up key
--    * the student's PC, or an admin, writes the summary line; not a
--      teacher, not another PC
--    * staff and the student's PC read it; another PC does not; nobody
--      writes the table directly
--    * the grants: the student's doors signed out too, the PC's never
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

create or replace function public.__reflection_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc    profiles;
  pc2   profiles;
  stu   profiles;
  v_pin text; k text; j jsonb; txt text; n int;
  sat   date := current_date - 20;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rf.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Rhea Reflect"}'),
         (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rf.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Ada Reflect"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Pat', 'Reflect', 'rf.pc@example.test');
  pc2 := create_pc_profile('Oli', 'Reflect', 'rf.pc2@example.test');
  perform __as(t_id);
  select * into stu from create_student('Remy', 'Reflect', pc.id);

  perform __as(null, 'postgres');
  select s.pin into v_pin from student_pins s where student_id = stu.id;
  perform __as(null, 'anon');
  k := student_sign_in(stu.display_id, v_pin)->>'key';

  -- ============ 1. the student ============
  j := student_save_reflection(k, sat, '  Timing on Math  ', 'Long passages', 'More timed sets', true);
  return query select '1 student'::text, 'writes the three answers and the retake'::text, 'Timing on Math|Long passages|More timed sets|true'::text,
    concat(j->0->>'went_well', '|', j->0->>'was_hard', '|', j->0->>'next_time', '|', j->0->>'retake'),
    __verdict(j->0->>'went_well' = 'Timing on Math' and j->0->>'was_hard' = 'Long passages'
              and j->0->>'next_time' = 'More timed sets' and (j->0->>'retake')::boolean);
  j := student_save_reflection(k, sat, 'Timing on Math', 'Long passages', '', false);
  return query select '1 student'::text, 'changes it: one row per SAT date, an empty answer cleared'::text, '1, null, false'::text,
    concat(jsonb_array_length(j), ', ', coalesce(j->0->>'next_time', 'null'), ', ', j->0->>'retake'),
    __verdict(jsonb_array_length(j) = 1 and j->0->>'next_time' is null and not (j->0->>'retake')::boolean);

  -- ============ 2. refusals ============
  begin perform student_save_reflection(k, current_date + 30, 'x', 'y', 'z', null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'an SAT still to come'::text, 'refused'::text, txt,
    __verdict(txt like 'a reflection is on an SAT already sat%');
  begin perform student_save_reflection(k, sat, repeat('x', 601), null, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'an answer over 600 characters'::text, 'refused'::text, txt,
    __verdict(txt like 'each answer fits%');
  begin perform student_save_reflection('not-a-key', sat, 'x', null, null, null); txt := 'kept';
  exception when others then txt := sqlerrm; end;
  return query select '2 refused'::text, 'a made-up key'::text, 'signed out'::text, txt, __verdict(txt = 'signed out');

  -- ============ 3. the PC's line ============
  perform __as(t_id);
  begin perform set_reflection_summary(stu.id, sat, 'x'); txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '3 the PC'::text, 'a teacher does not write it'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc2.id);
  begin perform set_reflection_summary(stu.id, sat, 'x'); txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '3 the PC'::text, 'nor another PC'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc.id);
  perform set_reflection_summary(stu.id, sat, 'Up 70 on Math; retake in March for the last 30.');
  perform __as(null, 'anon');
  j := student_reflections(k);
  return query select '3 the PC'::text, 'their PC writes it; the student reads it, their answers kept'::text,
    'Up 70 on Math; retake in March for the last 30.|Timing on Math'::text,
    concat(j->0->>'pc_summary', '|', j->0->>'went_well'),
    __verdict(j->0->>'pc_summary' = 'Up 70 on Math; retake in March for the last 30.' and j->0->>'went_well' = 'Timing on Math');

  -- ============ 4. readers ============
  perform __as(t_id);
  select count(*) into n from student_reflections where student_id = stu.id;
  return query select '4 readers'::text, 'a teacher reads it'::text, '1'::text, n::text, __verdict(n = 1);
  perform __as(pc2.id);
  select count(*) into n from student_reflections where student_id = stu.id;
  return query select '4 readers'::text, 'another PC does not'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(null, 'anon');
  select count(*) into n from student_reflections;
  return query select '4 readers'::text, 'signed out reads nothing'::text, '0'::text, n::text, __verdict(n = 0);
  perform __as(ad_id);
  begin update student_reflections set pc_summary = 'x' where student_id = stu.id; txt := 'written';
  exception when others then txt := 'refused'; end;
  return query select '4 readers'::text, 'nobody writes it directly'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 5. grants ============
  perform __as(null, 'postgres');
  return query select '5 grants'::text, 'student_save_reflection — signed out too'::text, 'anon'::text,
    (case when has_function_privilege('anon', 'public.student_save_reflection(text,date,text,text,text,boolean)', 'execute') then 'anon' else 'nobody' end),
    __verdict(has_function_privilege('anon', 'public.student_save_reflection(text,date,text,text,text,boolean)', 'execute'));
  return query select '5 grants'::text, 'set_reflection_summary — never signed out'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.set_reflection_summary(uuid,date,text)', 'execute') then 'anon' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.set_reflection_summary(uuid,date,text)', 'execute'));

  -- Cleanup.
  delete from student_login_keys where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__reflection_check();

drop function public.__reflection_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
