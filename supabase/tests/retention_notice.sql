-- ============================================================================
--  An inactive student is their PC's call (0107)
--
--    psql "$DATABASE_URL" -f supabase/tests/retention_notice.sql
--
--  What has to hold:
--
--    * the rule starts off, at 60 days to a notice, 14 of grace, 2 years for
--      a saved PDF
--    * the stages: 30 days quiet is active; 70 days is to be told; told 5
--      days ago is noticed; told 20 days ago is due; told and then booked is
--      not due; kept is active again
--    * off, a run tells nobody and deletes nobody
--    * on, a run tells the PC of everyone the rule has reached, deletes only
--      the due, and leaves the noticed
--    * the PC reads their own flagged students; another PC none; a teacher
--      is refused
--    * the mail: who is to be told, with the PC's address; marked, they are
--      not listed again
--    * Keep: active again, by the PC; Delete now: only on a flagged student,
--      only by their PC or an admin, and it goes at once
--    * the rules: an admin only, and bounded
--    * the internal functions are reachable by nobody
--
--  Every row must read PASS. Leaves the rule off and cleans up after itself.
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

create or replace function public.__notice_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  ad_id uuid := gen_random_uuid();
  pc    profiles;
  pc2   profiles;
  quiet profiles; long profiles; told profiles; gone profiles; back profiles; kept profiles; spare profiles;
  was   retention_policy;
  j jsonb; txt text; n int;
begin
  select * into was from retention_policy;
  update retention_policy set enabled = false, notice_days = 60, grace_days = 14, archive_years = 2;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rn.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Tara Notice"}'),
         (ad_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'rn.admin@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Ada Notice"}');
  update profiles set is_active = true where id = t_id;
  update profiles set role = 'admin', is_active = true where id = ad_id;
  pc  := create_pc_profile('Pia', 'Notice', 'rn.pc@example.test');
  pc2 := create_pc_profile('Oto', 'Notice', 'rn.pc2@example.test');
  perform __as(t_id);
  select * into quiet from create_student('Quinn', 'Notice', pc.id);
  select * into long  from create_student('Lena', 'Notice', pc.id);
  select * into told  from create_student('Toby', 'Notice', pc.id);
  select * into gone  from create_student('Gwen', 'Notice', pc.id);
  select * into back  from create_student('Bela', 'Notice', pc.id);
  select * into kept  from create_student('Kofi', 'Notice', pc.id);
  select * into spare from create_student('Sara', 'Notice', pc.id);
  perform __as(null, 'postgres');

  update profiles set created_at = now() - interval '2 years'
   where id in (quiet.id, long.id, told.id, gone.id, back.id, kept.id, spare.id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at, status, ended_at) values
    (t_id, quiet.id, 'english', now() - interval '30 days', 'completed', now() - interval '30 days'),
    (t_id, long.id,  'english', now() - interval '70 days', 'completed', now() - interval '70 days'),
    (t_id, told.id,  'english', now() - interval '70 days', 'completed', now() - interval '70 days'),
    (t_id, gone.id,  'english', now() - interval '90 days', 'completed', now() - interval '90 days'),
    (t_id, back.id,  'english', now() - interval '90 days', 'completed', now() - interval '90 days'),
    (t_id, kept.id,  'english', now() - interval '100 days', 'completed', now() - interval '100 days'),
    (t_id, spare.id, 'english', now() - interval '80 days', 'completed', now() - interval '80 days');
  -- Bela was told 20 days ago, then booked for next week.
  insert into sessions (teacher_id, student_id, subject, scheduled_at) values (t_id, back.id, 'english', now() + interval '7 days');
  insert into retention_notices (student_id, noticed_at) values
    (told.id, now() - interval '5 days'), (gone.id, now() - interval '20 days'), (back.id, now() - interval '20 days'),
    (spare.id, now() - interval '3 days');
  insert into retention_notices (student_id, noticed_at, decision, decided_at, kept_at)
  values (kept.id, now() - interval '10 days', 'keep', now() - interval '10 days', now() - interval '10 days');

  -- ============ 1. the rule ============
  return query select '1 rule'::text, 'starts off, 60 days, 14 of grace, 2 years'::text, 'off, 60, 14, 2'::text,
    (case when was.enabled then 'on' else 'off' end) || ', ' || was.notice_days || ', ' || was.grace_days || ', ' || was.archive_years,
    __verdict(not was.enabled and was.notice_days = 60 and was.grace_days = 14 and was.archive_years = 2);

  -- ============ 2. the stages ============
  select string_agg(split_part(full_name, ' ', 1) || '=' || stage, ', ' order by full_name) into txt
    from retention_status() where full_name like '% Notice' and display_id is not null;
  return query select '2 stages'::text, 'quiet 30 days, long 70, told 5 days ago, gone 20, back booked, kept'::text,
    'Bela=active, Gwen=due, Kofi=active, Lena=notice, Quinn=active, Sara=noticed, Toby=noticed'::text, txt,
    __verdict(txt = 'Bela=active, Gwen=due, Kofi=active, Lena=notice, Quinn=active, Sara=noticed, Toby=noticed');
  select count(*) into n from retention_due() where student_id in (quiet.id, long.id, told.id, gone.id, back.id, kept.id, spare.id);
  return query select '2 stages'::text, 'only the one past its grace is due now'::text, '1'::text, n::text, __verdict(n = 1);

  -- ============ 3. off ============
  perform __as(ad_id);
  j := run_retention_now();
  perform __as(null, 'postgres');
  select count(*) into n from profiles where id = gone.id;
  return query select '3 off'::text, 'tells nobody, deletes nobody'::text, 'off, Gwen kept, Lena not told'::text,
    coalesce(j->>'reason', 'ran') || ', ' || (case when n = 1 then 'Gwen kept' else 'Gwen gone' end) || ', ' ||
      (case when exists (select 1 from retention_notices where student_id = long.id) then 'Lena told' else 'Lena not told' end),
    __verdict(j->>'reason' = 'off' and n = 1 and not exists (select 1 from retention_notices where student_id = long.id));

  -- ============ 4. the PC's list (off: empty) ============
  perform __as(pc.id);
  j := retention_notices_mine();
  return query select '4 the PC'::text, 'off, the PC sees nothing flagged'::text, '0'::text, jsonb_array_length(j)::text,
    __verdict(jsonb_array_length(j) = 0);

  -- ============ 5. on ============
  perform __as(ad_id);
  perform set_retention_rules(true, 60, 14, 90, 2);
  j := run_retention_now();
  perform __as(null, 'postgres');
  select count(*) into n from profiles where id = gone.id;
  return query select '5 on'::text, 'the due student is deleted'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from profiles where id in (quiet.id, long.id, told.id, back.id, kept.id, spare.id);
  return query select '5 on'::text, 'and nobody else'::text, '6'::text, n::text, __verdict(n = 6);
  select count(*) into n from retention_notices where student_id = long.id and decision is null and noticed_at > now() - interval '1 minute';
  return query select '5 on'::text, 'the one the rule reached is told'::text, '1'::text, n::text, __verdict(n = 1);
  return query select '5 on'::text, 'the run says so'::text, 'noticed 1, deleted 1'::text,
    'noticed ' || (j->>'noticed') || ', deleted ' || (j->>'students'),
    __verdict((j->>'noticed')::int = 1 and (j->>'students')::int = 1);

  -- ============ 6. who reads the list ============
  perform __as(pc.id);
  j := retention_notices_mine();
  select string_agg(e->>'full_name', ', ' order by e->>'full_name') into txt from jsonb_array_elements(j) e;
  return query select '6 readers'::text, 'the PC: their flagged students'::text, 'Lena Notice, Sara Notice, Toby Notice'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'Lena Notice, Sara Notice, Toby Notice');
  perform __as(pc2.id);
  j := retention_notices_mine();
  return query select '6 readers'::text, 'another PC: none'::text, '0'::text, jsonb_array_length(j)::text,
    __verdict(jsonb_array_length(j) = 0);
  perform __as(t_id);
  begin perform retention_notices_mine(); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '6 readers'::text, 'a teacher is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 7. the mail ============
  perform __as(null, 'postgres');
  j := retention_notices_to_email();
  select string_agg(e->>'full_name' || '→' || (e->'to'->0->>'email'), ', ' order by e->>'full_name') into txt
    from jsonb_array_elements(j) e where e->>'full_name' like '% Notice';
  return query select '7 mail'::text, 'the notices to send, to the PC'::text,
    'Lena Notice→rn.pc@example.test, Sara Notice→rn.pc@example.test, Toby Notice→rn.pc@example.test'::text, coalesce(txt, '(none)'),
    __verdict(txt = 'Lena Notice→rn.pc@example.test, Sara Notice→rn.pc@example.test, Toby Notice→rn.pc@example.test');
  perform retention_mark_emailed(long.id);
  perform retention_mark_emailed(told.id, 'mailbox full');
  select count(*) into n from jsonb_array_elements(retention_notices_to_email()) e
   where e->>'student_id' in (long.id::text, told.id::text);
  return query select '7 mail'::text, 'once sent, or failed, not listed again'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 8. Keep and Delete now ============
  perform __as(pc2.id);
  begin perform retention_decide(long.id, true); txt := 'decided';
  exception when others then txt := 'refused'; end;
  return query select '8 decide'::text, 'another PC cannot keep'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(pc.id);
  j := retention_decide(long.id, true);
  perform __as(null, 'postgres');
  select stage into txt from retention_status() where student_id = long.id;
  return query select '8 decide'::text, 'Keep: active again, next notice in 60 days'::text, 'active'::text, txt,
    __verdict(txt = 'active' and (j->>'next_notice')::timestamptz > now() + interval '59 days');
  perform __as(pc.id);
  begin perform retention_decide(quiet.id, false); txt := 'deleted';
  exception when others then txt := 'refused'; end;
  return query select '8 decide'::text, 'Delete now on an active student: refused'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');
  j := retention_decide(spare.id, false);
  perform __as(null, 'postgres');
  select count(*) into n from profiles where id = spare.id;
  return query select '8 decide'::text, 'Delete now on a flagged one: gone at once'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from profiles where id in (quiet.id, long.id, told.id, back.id, kept.id);
  return query select '8 decide'::text, 'and only them'::text, '5'::text, n::text, __verdict(n = 5);

  -- ============ 9. the rules ============
  perform __as(pc.id);
  begin perform set_retention_rules(false, 60, 14, 90, 2); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '9 rules'::text, 'a PC cannot change them'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(ad_id);
  begin perform set_retention_rules(true, 5, 14, 90, 2); txt := 'changed';
  exception when others then txt := 'refused'; end;
  return query select '9 rules'::text, 'a notice after 5 days is out of bounds'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');
  j := retention_preview();
  select string_agg(e->>'full_name', ', ') into txt from jsonb_array_elements(j->'notices') e where e->>'full_name' like '% Notice';
  return query select '9 rules'::text, 'the admin sees who is still flagged (Lena kept, Sara gone)'::text, 'Toby Notice'::text,
    coalesce(txt, '(none)'), __verdict(txt = 'Toby Notice');

  -- ============ 10. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['retention_status()', 'retention_notices_to_email()', 'retention_mark_emailed(uuid,text)',
                                 'retention_archive_expired()', 'retention_forget_archived(uuid[])', 'queue_retention_notice()']) loop
    return query select '10 grants'::text, txt || ' — nobody'::text, 'nobody'::text,
      (case when has_function_privilege('authenticated', 'public.' || txt, 'execute') then 'authenticated' else 'nobody' end),
      __verdict(not has_function_privilege('authenticated', 'public.' || txt, 'execute'));
  end loop;
  select count(*) into n from information_schema.table_privileges
   where table_name = 'retention_notices' and grantee in ('anon', 'authenticated');
  return query select '10 grants'::text, 'retention_notices — no direct access'::text, '0'::text, n::text, __verdict(n = 0);

  -- Cleanup.
  update retention_policy set enabled = false, notice_days = 60, grace_days = 14, archive_years = 2, last_run = null, last_run_at = null;
  delete from sessions where teacher_id = t_id;
  delete from student_login_keys where student_id in (quiet.id, long.id, told.id, back.id, kept.id);
  delete from profiles where id in (quiet.id, long.id, told.id, back.id, kept.id, t_id, ad_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, ad_id);
end $fn$;

select * from public.__notice_check();

drop function public.__notice_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
