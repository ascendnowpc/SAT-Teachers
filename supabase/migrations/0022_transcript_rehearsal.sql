-- ============================================================================
--  0022 — the recorded diagnostic, as a test you can sit
--
--  0012 seeds the 7 August diagnostic as it happened: a completed session with
--  the answers, the times and the teacher's diagnosis already on it.  That is
--  the right shape for reading a report, and the wrong shape for rehearsing the
--  write-up, because there is nothing left to do to it.
--
--  This adds the other half — the same eighteen questions, in the order the
--  recording works through them, as a TEST.  Build a session on it, sit it as
--  the student, then drop the Fathom transcript on the write-up page and watch
--  the analysis line the conversation up against the answers.
--
--  Why these eighteen and why this order.  The module is 27 questions; the
--  recording reaches 23 of them and the bank holds 18 of those (Q04, Q10, Q16,
--  Q17 and Q19 are in neither screenshot deck we were given).  Sorting by
--  source_ref would give a different paper to the one that was taught — the
--  transcript's Q11 is the eleventh thing discussed, not the eleventh item in
--  the bank — and the alignment is by position, so a different order would put
--  every quote under the wrong question.  The order below is the recording's.
--
--  Deliberately not seeded: the transcript itself.  The point of this migration
--  is to have somewhere to paste one.
-- ============================================================================

-- ------------------------------------------------------------- the test ----
insert into question_sets (id, created_by, title, subject, description, kind)
values ('22222222-2222-4222-8222-222222222222', null,
        'Recorded diagnostic — 7 August',
        'english',
        'The eighteen questions of the 7 August recording, in the order the hour works through them. Sit it, then paste the Fathom transcript on the write-up page: the quotes land under the questions they were about.',
        'test')
on conflict (id) do update
  set title = excluded.title, description = excluded.description, kind = excluded.kind;

delete from question_set_items where set_id = '22222222-2222-4222-8222-222222222222';

insert into question_set_items (set_id, question_id, position)
select '22222222-2222-4222-8222-222222222222', q.id, t.ord
  from (values
    ('ENG-DIAG-T4-M2-Q01',  1), ('ENG-DIAG-T4-M2-Q02',  2), ('ENG-DIAG-T4-M2-Q03',  3),
    ('ENG-DIAG-T4-M2-Q05',  4), ('ENG-DIAG-T4-M2-Q06',  5), ('ENG-DIAG-T4-M2-Q07',  6),
    ('ENG-DIAG-T4-M2-Q08',  7), ('ENG-DIAG-T4-M2-Q09',  8), ('ENG-DIAG-T4-M2-Q11',  9),
    ('ENG-DIAG-T4-M2-Q12', 10), ('ENG-DIAG-T4-M2-Q13', 11), ('ENG-DIAG-T4-M2-Q14', 12),
    ('ENG-DIAG-T4-M2-Q15', 13), ('ENG-DIAG-T4-M2-Q18', 14), ('ENG-DIAG-T4-M2-Q20', 15),
    ('ENG-DIAG-T4-M2-Q21', 16), ('ENG-DIAG-T4-M2-Q22', 17), ('ENG-DIAG-T4-M2-Q23', 18)
  ) as t(source_ref, ord)
  join questions q on q.source_ref = t.source_ref;

-- The paper is only useful if it is whole. Eighteen or the migration fails,
-- rather than a fifteen-question test nobody notices until the quotes shift.
do $check$
declare n int;
begin
  select count(*) into n from question_set_items
   where set_id = '22222222-2222-4222-8222-222222222222';
  if n <> 18 then
    raise exception 'the recorded paper is % questions, not 18 — the bank is missing items', n;
  end if;
end
$check$;

-- ------------------------------------------------- a session ready to sit ----
-- Scheduled just far enough in the past that the student's Start button is
-- already live, so rehearsing it is one login and one click.
do $seed$
declare
  v_teacher uuid;
  v_student uuid;
  v_session uuid;
begin
  select id into v_teacher from profiles where role = 'teacher' order by created_at limit 1;
  select id into v_student from profiles where role = 'student' order by created_at limit 1;

  if v_teacher is null or v_student is null then
    raise notice 'no teacher or no student yet — skipping the rehearsal session';
    return;
  end if;

  select id into v_session from sessions
   where teacher_id = v_teacher and title = 'English diagnostic — 7 August, to sit';

  if v_session is null then
    insert into sessions (teacher_id, student_id, subject, title, scheduled_at,
                          duration_mins, status, teacher_notes)
    values (v_teacher, v_student, 'english', 'English diagnostic — 7 August, to sit',
            now() - interval '5 minutes', 60, 'scheduled',
            'The 7 August paper, unsat. Answer it as the student, then add the Fathom transcript on the write-up page.')
    returning id into v_session;
  end if;

  -- Only ever rebuild a paper nobody has started; reordering questions under a
  -- student who has answered some of them renumbers their own answers.
  if exists (select 1 from session_items where session_id = v_session and status <> 'staged') then
    raise notice 'the rehearsal session is already under way — leaving its paper alone';
    return;
  end if;

  delete from session_items where session_id = v_session;

  insert into session_items (session_id, question_id, student_id, sequence_no)
  select v_session, i.question_id, v_student, i.position
    from question_set_items i
   where i.set_id = '22222222-2222-4222-8222-222222222222'
   order by i.position;
end
$seed$;
