-- ============================================================================
--  Authoring contract
--
--    psql "$DATABASE_URL" -f supabase/tests/authoring.sql
--
--  What 0020 has to hold:
--
--    * a question can carry a figure
--    * update_question rewrites the stem, the level, the options and the key in
--      one go, replacing the options rather than adding to them
--    * a student cannot rewrite a question
--
--  Every row must read PASS. Cleans up after itself, and touches only the rows
--  it created — deliberately not the bank's own questions, which a test has no
--  business editing on a database with real content on it.
-- ============================================================================

create or replace function public.__authoring_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  q uuid; txt text; n int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'author.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}'),
    (s_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
     'author.student@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
     '{"provider":"email"}','{"role":"student","full_name":"BATU ozcelik"}');

  perform set_config('request.jwt.claims', json_build_object('sub',t_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';

  q := create_question('mathematics', null, null, 'A figure question?',
        'medium'::difficulty_level, null,
        '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
        'B'::answer_option, 'because', null, null, 'https://example.test/fig.png');

  select coalesce(image_url,'null') into txt from questions where id = q;
  return query select '1 image'::text,'a new question keeps its figure'::text,
    'https://example.test/fig.png'::text, txt,
    (case when txt='https://example.test/fig.png' then 'PASS' else 'FAIL' end)::text;

  perform update_question(q, 'mathematics', null, null, 'An edited question?',
        'hard'::difficulty_level, 'now harder',
        '[{"label":"A","body":"one"},{"label":"B","body":"two"},{"label":"C","body":"three"}]'::jsonb,
        'C'::answer_option, 'a new reason', null, null, null);

  select stem || ' / ' || difficulty::text || ' / ' || coalesce(image_url,'no image')
    into txt from questions where id = q;
  return query select '2 edit'::text,'stem, level and figure are rewritten'::text,
    'An edited question? / hard / no image'::text, txt,
    (case when txt='An edited question? / hard / no image' then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_options where question_id = q;
  return query select '2 edit'::text,'options are replaced, not appended'::text,'3'::text,n::text,
    (case when n=3 then 'PASS' else 'FAIL' end)::text;

  select correct_option::text into txt from question_keys where question_id = q;
  return query select '2 edit'::text,'and the key moves with them'::text,'C'::text,txt,
    (case when txt='C' then 'PASS' else 'FAIL' end)::text;

  begin
    perform update_question(q, 'mathematics', null, null, 'One option?',
          'easy'::difficulty_level, null,
          '[{"label":"A","body":"one"}]'::jsonb,
          'A'::answer_option, null, null, null, null);
    txt := 'accepted';
  exception when others then txt := 'refused';
  end;
  return query select '2 edit'::text,'a question cannot be edited down to one option'::text,
    'refused'::text, txt, (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  perform set_config('request.jwt.claims', json_build_object('sub',s_id::text,'role','authenticated')::text, true);
  execute 'set local role authenticated';
  begin
    perform update_question(q, 'mathematics', null, null, 'Rewritten by a student?',
          'easy'::difficulty_level, null,
          '[{"label":"A","body":"one"},{"label":"B","body":"two"}]'::jsonb,
          'A'::answer_option, null, null, null, null);
    txt := 'allowed';
  exception when others then txt := 'refused';
  end;
  return query select '3 student'::text,'a student cannot rewrite a question'::text,'refused'::text,txt,
    (case when txt='refused' then 'PASS' else 'FAIL' end)::text;
  execute 'reset role';

  -- Read back outside the student's seat: they cannot see this question at all,
  -- so asking them what it says would prove nothing either way.
  select stem into txt from questions where id = q;
  return query select '3 student'::text,'and the question is unchanged'::text,
    'An edited question?'::text, coalesce(txt,'missing'),
    (case when txt='An edited question?' then 'PASS' else 'FAIL' end)::text;

  delete from questions where id = q;
  delete from auth.users where id in (t_id, s_id);
end $fn$;

select * from public.__authoring_check();

drop function public.__authoring_check();
