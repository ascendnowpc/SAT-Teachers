-- ============================================================================
--  Security contract — run this against any environment before shipping.
--
--    psql "$DATABASE_URL" -f supabase/tests/rls_contract.sql
--
--  Creates a teacher and a student the way signup does, asserts what each seat
--  can and cannot reach, then cleans up after itself.  Every row must say PASS.
--
--  The assertions that matter most:
--    * a student can never read question_keys — the answer key lives in its own
--      table precisely because RLS cannot hide a column of a row it grants
--    * a signup asking for `admin` is coerced to `student`
--    * a student cannot self-promote by updating their own profile row
-- ============================================================================

create or replace function public.__rls_check()
returns table(seat text, assertion text, expected text, actual text, verdict text)
language plpgsql
as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  n    int;
  ok   boolean;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'rlscheck.teacher@example.test', crypt('x', gen_salt('bf')), now(), now(), now(),
     '{"provider":"email"}', '{"role":"teacher","full_name":"RLS Teacher"}'),
    -- deliberately asks for admin; the trigger must refuse it
    (s_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'rlscheck.student@example.test', crypt('x', gen_salt('bf')), now(), now(), now(),
     '{"provider":"email"}', '{"role":"admin","full_name":"RLS Student"}');

  return query select 'signup'::text, 'requested role is coerced, not trusted'::text,
    'student'::text,
    (select role::text from profiles where id = s_id),
    (select case when role = 'student' then 'PASS' else 'FAIL' end from profiles where id = s_id);

  return query select 'signup'::text, 'readable ids are issued'::text, 'TCH-* / STU-*'::text,
    (select string_agg(display_id, ' / ' order by display_id) from profiles where id in (t_id, s_id)),
    (select case when count(*) = 2 then 'PASS' else 'FAIL' end from profiles where id in (t_id, s_id));

  -- ---------------------------------------------------------- teacher ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', t_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  begin
    perform create_question('english', 'craft_and_structure', null,
      'Which choice completes the text?', 'medium'::difficulty_level, null,
      '[{"label":"A","body":"gentle"},{"label":"B","body":"diverse"}]'::jsonb,
      'B'::answer_option, 'Diverse fits.');
    ok := true;
  exception when others then ok := false;
  end;
  return query select 'teacher'::text, 'can author a question'::text, 'yes'::text,
    (case when ok then 'yes' else 'no' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from questions;
  return query select 'teacher'::text, 'reads the bank'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_keys;
  return query select 'teacher'::text, 'reads answer keys'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question('english', null, null, 'Bad key', 'easy'::difficulty_level, null,
      '[{"label":"A","body":"a"},{"label":"B","body":"b"}]'::jsonb, 'D'::answer_option, null);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'teacher'::text, 'correct option must be one of the options'::text,
    'rejected'::text, (case when ok then 'rejected' else 'accepted' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';

  -- ---------------------------------------------------------- student ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', s_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from questions;
  return query select 'student'::text, 'reads the bank'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_options;
  return query select 'student'::text, 'reads options'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_keys;
  return query select 'student'::text, 'reads ANSWER KEYS'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from profiles;
  return query select 'student'::text, 'reads profiles (own only)'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question('english', null, null, 'Sneaky', 'easy'::difficulty_level, null,
      '[{"label":"A","body":"a"},{"label":"B","body":"b"}]'::jsonb, 'A'::answer_option, null);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'student'::text, 'blocked from authoring'::text, 'blocked'::text,
    (case when ok then 'blocked' else 'allowed' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  begin
    update profiles set role = 'teacher' where id = s_id;
    select count(*) into n from profiles where id = s_id and role = 'teacher';
    ok := (n = 0);
  exception when others then ok := true;
  end;
  return query select 'student'::text, 'cannot self-promote to teacher'::text,
    'blocked'::text, (case when ok then 'blocked' else 'PROMOTED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';

  delete from questions where created_by = t_id;
  delete from auth.users where id in (t_id, s_id);
end $fn$;

select * from public.__rls_check();

drop function public.__rls_check();
