-- ============================================================================
--  0068 — a targeted test's score comes straight after it
--
--  A student who finished a targeted test was told how many they answered and
--  to wait: the score came with the teacher's Publish results. The brief asks
--  for it at once — the score and the skills missed, as soon as the test ends.
--
--  targeted_result_by_token(key) gives exactly that, and nothing more, once
--  the session is over: right out of reached (a timed-out question is reached
--  and wrong, a question never shown is not reached and not counted — the
--  same rule the staff report uses), and the same per skill. Which questions
--  were right, the answers and the explanations still wait for Publish
--  results, so a student cannot pass a key on before the teacher has gone
--  through it. Before the test is over it returns null: there is no reading
--  the score mid-test.
--
--  student_home (0067) carries the same two numbers for a finished targeted
--  test, so the student's page shows the score without waiting either.
-- ============================================================================

create or replace function public.targeted_result(p_session uuid)
returns jsonb
language sql stable security definer set search_path = public as $$
  with s as (
    select s.id, t.set_size
      from sessions s
      join targeted_tests t on t.session_id = s.id
     where s.id = p_session and s.mode = 'targeted' and s.status = 'completed'
  ),
  met as (
    select q.section, q.skill, coalesce(a.is_correct, false) as right_one, coalesce(a.timed_out, false) as timed_out
      from s
      join session_items i on i.session_id = s.id and i.status in ('answered', 'revealed')
      join questions q on q.id = i.question_id
      left join session_item_assessments a on a.session_item_id = i.id
  )
  select case when not exists (select 1 from s) then null else
    jsonb_build_object(
      'right',       (select count(*) from met where right_one),
      'reached',     (select count(*) from met),
      'timed_out',   (select count(*) from met where timed_out),
      'not_reached', greatest(0, (select set_size from s) - (select count(*) from met)),
      'skills', coalesce((
        select jsonb_agg(jsonb_build_object('section', section, 'skill', skill, 'right', r, 'of', n)
                         order by r::numeric / n, skill)
          from (select section, skill, count(*) filter (where right_one) as r, count(*) as n
                  from met group by section, skill) g), '[]'::jsonb))
  end
$$;

revoke execute on function public.targeted_result(uuid) from public, anon, authenticated;

-- The link's door, with the entry key (0066), like every other.
create or replace function public.targeted_result_by_token(p_token text)
returns jsonb
language sql stable security definer set search_path = public as $$
  select targeted_result(session_for_token(p_token))
$$;

revoke execute on function public.targeted_result_by_token(text) from public, anon, authenticated;
grant  execute on function public.targeted_result_by_token(text) to anon, authenticated;

-- ------------------------------------------------------ the student's page --
-- As 0067's, with 'score' on a finished targeted test.
create or replace function public.student_home(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                  from profiles p where p.id = v_student),
    'sessions', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',              s.id,
               'title',           s.title,
               'subject',         s.subject,
               'mode',            s.mode,
               'status',          s.status,
               'scheduled_at',    s.scheduled_at,
               'opened_early_at', s.opened_early_at,
               'link',            s.access_token,
               'entry_key',       s.entry_key,
               'section',         t.section,
               'skill',           t.skill,
               'set_size',        t.set_size,
               'revealed',        (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'),
               'right',           (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'
                                      and i.revealed_result = 'correct'),
               'score',           case when s.mode = 'targeted' and s.status = 'completed'
                                       then (select jsonb_build_object('right', r->'right', 'reached', r->'reached')
                                               from targeted_result(s.id) r)
                                  end)
             order by s.scheduled_at desc)
        from sessions s
        left join targeted_tests t on t.session_id = s.id
       where s.student_id = v_student
         and s.status <> 'cancelled'), '[]'::jsonb));
end $$;

revoke execute on function public.student_home(text) from public, anon, authenticated;
grant  execute on function public.student_home(text) to anon, authenticated;
