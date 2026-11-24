-- ============================================================================
--  My students, at a glance (0104)
--
--    psql "$DATABASE_URL" -f supabase/tests/students_overview.sql
--
--  What has to hold:
--
--    * a PC sees the students assigned to them, and nobody else
--    * a teacher sees the students they have a session with, and nobody else
--    * an admin sees every student
--    * each row carries the goal, the latest SAT and the progress rows by
--      subject, cut down: no teacher's name, no question id
--    * signed out, nothing
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

create or replace function public.__overview_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  t2_id uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc  profiles;
  pc2 profiles;
  a   profiles;
  b   profiles;
  j jsonb; ids text[]; txt text;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'ov.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Tara Over"}'),
    (t2_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'ov.teacher2@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Theo Other"}'),
    (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'ov.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Ada Admin"}');
  update profiles set is_active = true where id in (t_id, t2_id);
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Pat', 'Over', 'ov.pc@example.test');
  pc2 := create_pc_profile('Pia', 'Elsewhere', 'ov.pc2@example.test');
  perform __as(t_id);
  select * into a from create_student('Ana', 'Over', pc.id);
  select * into b from create_student('Ben', 'Over', pc2.id);

  perform __as(null, 'postgres');
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status)
  values (t_id, a.id, 'mathematics', now() - interval '2 days', 'completed');
  insert into student_goals (student_id, target_rw, target_math, next_test_on)
  values (a.id, 700, 750, current_date + 20);

  -- ============ 1. who is in it ============
  perform __as(pc.id);
  j := students_overview();
  select array_agg(e->>'id') into ids from jsonb_array_elements(j) e;
  return query select '1 who'::text, 'a PC: their own students'::text, 'Ana'::text,
    array_to_string(array(select e->>'full_name' from jsonb_array_elements(j) e), ', '),
    __verdict(ids = array[a.id::text]);

  perform __as(t_id);
  j := students_overview();
  select array_agg(e->>'id') into ids from jsonb_array_elements(j) e;
  return query select '1 who'::text, 'a teacher: the students they teach'::text, 'Ana'::text,
    array_to_string(array(select e->>'full_name' from jsonb_array_elements(j) e), ', '),
    __verdict(ids = array[a.id::text]);

  perform __as(t2_id);
  j := students_overview();
  return query select '1 who'::text, 'a teacher with no sessions: nobody'::text, '0'::text,
    jsonb_array_length(j)::text, __verdict(jsonb_array_length(j) = 0);

  perform __as(ad_id);
  j := students_overview();
  select array_agg(e->>'id') into ids from jsonb_array_elements(j) e;
  return query select '1 who'::text, 'an admin: every student'::text, 'both'::text,
    (case when a.id::text = any(ids) and b.id::text = any(ids) then 'both' else 'not both' end),
    __verdict(a.id::text = any(ids) and b.id::text = any(ids));

  perform __as(null, 'anon');
  begin perform students_overview(); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '1 who'::text, 'signed out: nothing'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 2. what a row carries ============
  perform __as(pc.id);
  j := students_overview()->0;
  return query select '2 row'::text, 'the goal'::text, '750'::text, coalesce(j->'goal'->>'target_math', 'none'),
    __verdict((j->'goal'->>'target_math')::int = 750);
  return query select '2 row'::text, 'the subject''s progress rows'::text, 'mathematics'::text,
    coalesce((select string_agg(k, ',') from jsonb_object_keys(j->'subjects') k), 'none'),
    __verdict(j->'subjects' ? 'mathematics');
  return query select '2 row'::text, 'cut down: no teacher''s name'::text, 'absent'::text,
    (case when (j->'subjects'->'mathematics'->'sessions'->0) ? 'teacher' then 'present' else 'absent' end),
    __verdict(not ((j->'subjects'->'mathematics'->'sessions'->0) ? 'teacher'));

  -- Cleanup.
  perform __as(null, 'postgres');
  delete from sessions where student_id in (a.id, b.id);
  delete from profiles where id in (a.id, b.id, t_id, t2_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, t2_id, ad_id);
end $fn$;

select * from public.__overview_check();

drop function public.__overview_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
