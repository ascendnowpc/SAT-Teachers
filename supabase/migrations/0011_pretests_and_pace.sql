-- ============================================================================
--  0011 — pre-tests, pace targets, and one key the teaching corrected
--
--  Three things, all of them from watching a real diagnostic run.
--
--  1. A PRE-TEST IS A REUSABLE SET, NOT A PILE OF STAGED QUESTIONS.
--     Until now a teacher queued questions into one session by hand, and doing
--     the same diagnostic with the next student meant queueing all of them
--     again.  question_sets holds the paper once; stage_question_set() drops
--     the whole thing into a session in order, and publish_staged_items()
--     opens them all at once so the student works through the set the way they
--     would work through a real module.
--
--  2. PACE NEEDS A BENCHMARK.  We already time every answer (see
--     session_items.first_viewed_at → answered_at, and
--     session_item_assessments.elapsed_seconds).  What was missing was
--     something to compare against, so "42 seconds" could not become "rushed".
--     questions.target_seconds is that benchmark, defaulted off difficulty and
--     overridable per item.
--
--  3. ENG-DIAG-T4-M2-Q06 was keyed wrong.  In the recorded session the teacher
--     works the Whitman spider poem through with the student and lands on D:
--     main idea means the central message — the soul seeking connection — not
--     "observation prompts reflection", which is what the poem does rather than
--     what it says.  The bank said C.  The teaching is the authority here.
-- ============================================================================

-- ------------------------------------------------------------ the key fix ----
update question_keys k
   set correct_option = 'D',
       explanation    = 'The spider flinging filaments into empty space is an extended metaphor: the second half turns to the soul doing the same, "till the gossamer thread you fling catch somewhere". The main idea is that central message — the soul seeking connection. C describes what the poem does rather than what it says, which is why it reads as almost right.',
       updated_at     = now()
  from questions q
 where q.id = k.question_id
   and q.source_ref = 'ENG-DIAG-T4-M2-Q06';

update questions
   set difficulty_rationale = 'Two options are defensible and one of them, "observation prompts reflection", is true of the poem without being its point. Students who read the surface land there.'
 where source_ref = 'ENG-DIAG-T4-M2-Q06';

-- --------------------------------------------------------- pace benchmark ----
alter table questions add column if not exists target_seconds int
  check (target_seconds is null or target_seconds between 10 and 900);

comment on column questions.target_seconds is
  'What a confident student should need. Pace in the report is measured against this, not against a flat average.';

-- Digital SAT Reading & Writing gives about 71 seconds a question; these spread
-- that by level.  Per-item overrides are the point of the column — this is only
-- a starting value so the report has something to measure against on day one.
update questions
   set target_seconds = case difficulty
                          when 'easy'   then 55
                          when 'medium' then 75
                          when 'hard'   then 100
                        end
 where target_seconds is null;

-- --------------------------------------------------------- mark for review --
-- On a published set the student decides the order, so they need the test's own
-- way of saying "come back to this" — and the teacher wants to see which ones
-- those were, since a marked question answered correctly is a different thing
-- from a confident one.
alter table session_items add column if not exists marked_for_review boolean not null default false;

create or replace function public.set_marked_for_review(p_item uuid, p_marked boolean)
returns void language plpgsql security definer set search_path = public as $$
begin
  update session_items
     set marked_for_review = coalesce(p_marked, false)
   where id = p_item
     and student_id = auth.uid()
     and status in ('published', 'answered');
end $$;

revoke execute on function public.set_marked_for_review(uuid, boolean) from anon;

-- ------------------------------------------------------------ question sets --
create table question_sets (
  id          uuid primary key default gen_random_uuid(),
  created_by  uuid references profiles(id),   -- null = house content
  title       text not null,
  subject     text not null default 'english'
                check (subject in ('english', 'mathematics')),
  description text,
  is_active   boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index question_sets_subject_idx on question_sets (subject, is_active);

create table question_set_items (
  set_id      uuid not null references question_sets(id) on delete cascade,
  question_id uuid not null references questions(id) on delete cascade,
  position    int  not null,
  primary key (set_id, question_id)
);
-- Position is unique within a set so "question 7 of 27" means one question.
create unique index question_set_items_order_idx on question_set_items (set_id, position);

create trigger question_sets_touch before update on question_sets
  for each row execute function public.touch_updated_at();

alter table question_sets      enable row level security;
alter table question_set_items enable row level security;

-- Sets are staff-only in every direction: a student never reads the paper, only
-- the questions the teacher publishes to them one session at a time.
create policy sets_teacher_read on question_sets
  for select using (is_teacher());
create policy sets_author_write on question_sets
  for all using (is_teacher() and (created_by = auth.uid() or created_by is null))
  with check (is_teacher() and (created_by = auth.uid() or created_by is null));

create policy set_items_teacher_read on question_set_items
  for select using (is_teacher());
create policy set_items_author_write on question_set_items
  for all using (
    exists (select 1 from question_sets s
             where s.id = set_id and is_teacher()
               and (s.created_by = auth.uid() or s.created_by is null))
  ) with check (
    exists (select 1 from question_sets s
             where s.id = set_id and is_teacher()
               and (s.created_by = auth.uid() or s.created_by is null))
  );

-- ------------------------------------------------------------ the workflow --
-- Stage a whole set into a session, in the set's order, after whatever is
-- already queued.  Questions already staged in this session are skipped rather
-- than duplicated, so running it twice is harmless.
create or replace function public.stage_question_set(p_session uuid, p_set uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare
  v_next int;
  v_added int;
begin
  perform assert_session_teacher(p_session);

  select coalesce(max(sequence_no), 0) into v_next
    from session_items where session_id = p_session;

  with fresh as (
    select si.question_id,
           row_number() over (order by si.position) as n
      from question_set_items si
     where si.set_id = p_set
       and not exists (
         select 1 from session_items x
          where x.session_id = p_session and x.question_id = si.question_id)
  )
  insert into session_items (session_id, question_id, student_id, sequence_no)
  select p_session, fresh.question_id, s.student_id, v_next + fresh.n
    from fresh, sessions s
   where s.id = p_session;

  get diagnostics v_added = row_count;
  return v_added;
end $$;

-- Open every staged question at once.  This is the pre-test shape: the student
-- gets the whole module and works through it at their own pace, rather than
-- waiting for the teacher to hand over one question at a time.  The one-at-a-
-- time loop still exists — publish_item() is untouched — and a teacher can mix
-- the two in a session.
create or replace function public.publish_staged_items(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_count int;
begin
  perform assert_session_teacher(p_session);

  update session_items
     set status = 'published', published_at = now()
   where session_id = p_session and status = 'staged';

  get diagnostics v_count = row_count;
  return v_count;
end $$;

-- Reveal everything the student has answered, in one go — the other half of a
-- pre-test: they finish the paper, then the teacher opens the results and goes
-- through them together.
create or replace function public.reveal_answered_items(p_session uuid)
returns int
language plpgsql security definer set search_path = public as $$
declare v_item uuid; v_count int := 0;
begin
  perform assert_session_teacher(p_session);

  for v_item in
    select id from session_items
     where session_id = p_session and status = 'answered'
     order by sequence_no
  loop
    perform reveal_item(v_item);
    v_count := v_count + 1;
  end loop;

  return v_count;
end $$;

revoke execute on function public.stage_question_set(uuid, uuid)   from anon;
revoke execute on function public.publish_staged_items(uuid)       from anon;
revoke execute on function public.reveal_answered_items(uuid)      from anon;
