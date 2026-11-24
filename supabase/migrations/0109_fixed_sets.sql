-- ============================================================================
--  0109 — fixed Sets A to D: like with like
--
--  The scope's F3 (phase 3): for each domain, Sets A to D of 10 questions, the
--  same for every student, so a check-in "before" and one "after" compare like
--  with like. Malya and the tutors choose the questions; the platform drafts
--  them to start from and keeps them:
--
--    a draft    10 questions of the domain — 3 easy, 3 medium, 4 hard, easiest
--               first, spread across its skills — none in another set of the
--               same domain. Drafted from the bank a targeted test draws on:
--               published, in an active test or practice set of the subject.
--    review     any question of a draft swapped for another of the same
--               difficulty (the same skill first) that no set of the domain
--               has; a draft approved, or deleted and drafted again.
--    approved   locked: what a before/after comparison rests on cannot change
--               under it. Put back to draft to change it.
--    in use     a targeted test booked from a set records it (the questions
--               are the set's, through create_targeted_session's own list), so
--               the line can say "Set A, then Set B".
--
--  Staff (and admins) read, draft, review and approve. Done, per the scope,
--  when every domain in both subjects has at least 3 approved sets.
-- ============================================================================

create table if not exists fixed_sets (
  id          uuid primary key default gen_random_uuid(),
  subject     text not null check (subject in ('english', 'mathematics')),
  section     text not null,
  label       text not null check (label in ('A', 'B', 'C', 'D')),
  status      text not null default 'draft' check (status in ('draft', 'approved')),
  note        text check (note is null or length(note) <= 300),
  created_by  uuid references profiles(id) on delete set null,
  created_at  timestamptz not null default now(),
  approved_by uuid references profiles(id) on delete set null,
  approved_at timestamptz,
  unique (section, label)
);

create table if not exists fixed_set_items (
  set_id      uuid not null references fixed_sets(id) on delete cascade,
  position    int not null check (position between 1 and 20),
  question_id uuid not null references questions(id) on delete restrict,
  primary key (set_id, position),
  unique (set_id, question_id)
);

create table if not exists session_fixed_sets (
  session_id uuid primary key references sessions(id) on delete cascade,
  set_id     uuid references fixed_sets(id) on delete set null,
  set_label  text not null,
  recorded_at timestamptz not null default now()
);

comment on table fixed_sets is 'Sets A to D per domain, the same for every student (0109). Staff review and approve them.';
comment on table session_fixed_sets is 'Which fixed set a targeted test was booked from (0109).';

alter table fixed_sets enable row level security;
alter table fixed_set_items enable row level security;
alter table session_fixed_sets enable row level security;

drop policy if exists fixed_sets_staff_read on fixed_sets;
create policy fixed_sets_staff_read on fixed_sets for select using ((select is_teacher()) or (select is_admin()));
drop policy if exists fixed_set_items_staff_read on fixed_set_items;
create policy fixed_set_items_staff_read on fixed_set_items for select using ((select is_teacher()) or (select is_admin()));
drop policy if exists session_fixed_sets_staff_read on session_fixed_sets;
create policy session_fixed_sets_staff_read on session_fixed_sets for select using ((select is_teacher()) or (select is_admin()));

revoke insert, update, delete, truncate on fixed_sets, fixed_set_items, session_fixed_sets from anon, authenticated;

-- ------------------------------------------------------------- the pool ---
-- Internal: the questions a set of a domain may hold.
create or replace function public.fixed_set_pool(p_subject text, p_section text)
returns table (question_id uuid, difficulty difficulty_level, skill text)
language sql stable security definer set search_path = public as $$
  select distinct q.id, q.difficulty, q.skill
    from questions q
    join question_set_items qi on qi.question_id = q.id
    join question_sets qs      on qs.id = qi.set_id
   where q.status = 'published'
     and q.section = p_section
     and qs.subject = p_subject
     and qs.is_active
     and (qs.level is not null or qs.kind = 'practice')
$$;

revoke execute on function public.fixed_set_pool(text, text) from public, anon, authenticated;

create or replace function public.fixed_sets_guard()
returns void
language plpgsql stable security definer set search_path = public as $$
begin
  if not (is_teacher() or is_admin()) then raise exception 'only staff work on the fixed sets'; end if;
end $$;

revoke execute on function public.fixed_sets_guard() from public, anon, authenticated;

-- ------------------------------------------------------------ drafting ---
-- Drafts the sets a domain is missing, A first, each `p_size` long, from what
-- no other set of the domain holds; stops when the bank runs short. Returns
-- the labels drafted.
create or replace function public.draft_fixed_sets(p_subject text, p_section text, p_size int default 10)
returns text[]
language plpgsql security definer set search_path = public as $$
declare
  v_label  text;
  v_set    uuid;
  v_used   uuid[];
  v_pick   uuid[];
  v_take   uuid[];
  v_made   text[] := '{}';
  v_level  difficulty_level;
  v_want   int;
  v_easy   int := round(p_size * 0.3);
  v_medium int := round(p_size * 0.3);
begin
  perform fixed_sets_guard();
  if p_subject not in ('english', 'mathematics') then raise exception 'English or Math'; end if;
  if p_size not between 5 and 20 then raise exception 'a set is 5 to 20 questions'; end if;
  if not exists (select 1 from fixed_set_pool(p_subject, p_section)) then
    raise exception 'there are no questions on that domain';
  end if;

  foreach v_label in array array['A', 'B', 'C', 'D'] loop
    continue when exists (select 1 from fixed_sets where section = p_section and label = v_label);

    select coalesce(array_agg(i.question_id), '{}') into v_used
      from fixed_set_items i join fixed_sets s on s.id = i.set_id where s.section = p_section;

    v_pick := '{}';
    foreach v_level in array array['easy', 'medium', 'hard']::difficulty_level[] loop
      v_want := case v_level when 'easy' then v_easy when 'medium' then v_medium else p_size - v_easy - v_medium end;
      -- Round the skills: the first of each skill, then the second, and so on.
      select coalesce(array_agg(x.question_id), '{}') into v_take from (
        select p.question_id
          from (select fp.question_id, fp.skill,
                       row_number() over (partition by fp.skill order by random()) as rn
                  from fixed_set_pool(p_subject, p_section) fp
                 where fp.difficulty = v_level and not (fp.question_id = any(v_used))) p
         order by p.rn, random()
         limit v_want) x;
      v_pick := v_pick || v_take;
    end loop;

    -- Short at a level: make it up from whatever is left, easiest first.
    if cardinality(v_pick) < p_size then
      select v_pick || coalesce(array_agg(x.question_id), '{}') into v_pick from (
        select fp.question_id
          from fixed_set_pool(p_subject, p_section) fp
         where not (fp.question_id = any(v_used || v_pick))
         order by fp.difficulty, random()
         limit p_size - cardinality(v_pick)) x;
    end if;
    exit when cardinality(v_pick) < p_size;

    insert into fixed_sets (subject, section, label, created_by) values (p_subject, p_section, v_label, auth.uid())
    returning id into v_set;
    -- Easiest first.
    insert into fixed_set_items (set_id, position, question_id)
    select v_set, row_number() over (order by q.difficulty, ord), q.id
      from unnest(v_pick) with ordinality as u(id, ord)
      join questions q on q.id = u.id;
    v_made := v_made || v_label;
  end loop;
  return v_made;
end $$;

revoke execute on function public.draft_fixed_sets(text, text, int) from public, anon, authenticated;
grant  execute on function public.draft_fixed_sets(text, text, int) to authenticated;

-- ------------------------------------------------------------- review ---
create or replace function public.swap_fixed_set_question(p_set uuid, p_position int)
returns uuid
language plpgsql security definer set search_path = public as $$
declare
  s     fixed_sets;
  v_old uuid;
  v_lvl difficulty_level;
  v_sk  text;
  v_new uuid;
begin
  perform fixed_sets_guard();
  select * into s from fixed_sets where id = p_set;
  if s.id is null then raise exception 'no such set'; end if;
  if s.status <> 'draft' then raise exception 'an approved set is locked: put it back to draft first'; end if;
  select i.question_id, q.difficulty, q.skill into v_old, v_lvl, v_sk
    from fixed_set_items i join questions q on q.id = i.question_id
   where i.set_id = p_set and i.position = p_position;
  if v_old is null then raise exception 'no question there'; end if;

  select fp.question_id into v_new
    from fixed_set_pool(s.subject, s.section) fp
   where fp.difficulty = v_lvl
     and not exists (select 1 from fixed_set_items i join fixed_sets o on o.id = i.set_id
                      where o.section = s.section and i.question_id = fp.question_id)
   order by (fp.skill is not distinct from v_sk) desc, random()
   limit 1;
  if v_new is null then raise exception 'no other % question on this domain is free', v_lvl; end if;

  update fixed_set_items set question_id = v_new where set_id = p_set and position = p_position;
  return v_new;
end $$;

revoke execute on function public.swap_fixed_set_question(uuid, int) from public, anon, authenticated;
grant  execute on function public.swap_fixed_set_question(uuid, int) to authenticated;

create or replace function public.approve_fixed_set(p_set uuid, p_approve boolean, p_note text default null)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform fixed_sets_guard();
  if not exists (select 1 from fixed_sets where id = p_set) then raise exception 'no such set'; end if;
  if p_note is not null and length(p_note) > 300 then raise exception 'a note fits in 300 characters'; end if;
  update fixed_sets
     set status = case when p_approve then 'approved' else 'draft' end,
         approved_by = case when p_approve then auth.uid() end,
         approved_at = case when p_approve then now() end,
         note = coalesce(nullif(btrim(p_note), ''), note)
   where id = p_set;
end $$;

revoke execute on function public.approve_fixed_set(uuid, boolean, text) from public, anon, authenticated;
grant  execute on function public.approve_fixed_set(uuid, boolean, text) to authenticated;

create or replace function public.delete_fixed_set(p_set uuid)
returns void
language plpgsql security definer set search_path = public as $$
begin
  perform fixed_sets_guard();
  if exists (select 1 from fixed_sets where id = p_set and status = 'approved') then
    raise exception 'an approved set is not deleted: put it back to draft first';
  end if;
  delete from fixed_sets where id = p_set;
end $$;

revoke execute on function public.delete_fixed_set(uuid) from public, anon, authenticated;
grant  execute on function public.delete_fixed_set(uuid) to authenticated;

-- ------------------------------------------------------------ reading ---
create or replace function public.fixed_sets_overview(p_subject text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  perform fixed_sets_guard();
  return coalesce((
    select jsonb_agg(jsonb_build_object(
             'id', s.id, 'section', s.section, 'label', s.label, 'status', s.status, 'note', s.note,
             'approved_by', (select p.full_name from profiles p where p.id = s.approved_by), 'approved_at', s.approved_at,
             'uses', (select count(*) from session_fixed_sets u where u.set_id = s.id),
             'questions', (select coalesce(jsonb_agg(jsonb_build_object(
                                'position', i.position, 'question_id', q.id, 'difficulty', q.difficulty, 'skill', q.skill,
                                'stem', left(regexp_replace(coalesce(q.stem, ''), '\s+', ' ', 'g'), 160)) order by i.position), '[]'::jsonb)
                             from fixed_set_items i join questions q on q.id = i.question_id where i.set_id = s.id))
           order by s.section, s.label)
      from fixed_sets s where s.subject = p_subject), '[]'::jsonb);
end $$;

revoke execute on function public.fixed_sets_overview(text) from public, anon, authenticated;
grant  execute on function public.fixed_sets_overview(text) to authenticated;

-- How many questions each domain's pool holds, by difficulty: whether four sets can be drawn.
create or replace function public.fixed_set_pool_sizes(p_subject text)
returns jsonb
language plpgsql stable security definer set search_path = public as $$
begin
  perform fixed_sets_guard();
  return coalesce((
    select jsonb_object_agg(x.section, x.counts) from (
      select q.section, jsonb_build_object(
               'easy', count(*) filter (where q.difficulty = 'easy'),
               'medium', count(*) filter (where q.difficulty = 'medium'),
               'hard', count(*) filter (where q.difficulty = 'hard')) as counts
        from (select distinct q.id, q.section, q.difficulty
                from questions q
                join question_set_items qi on qi.question_id = q.id
                join question_sets qs on qs.id = qi.set_id
               where q.status = 'published' and qs.subject = p_subject and qs.is_active
                 and (qs.level is not null or qs.kind = 'practice') and q.section is not null) q
       group by q.section) x), '{}'::jsonb);
end $$;

revoke execute on function public.fixed_set_pool_sizes(text) from public, anon, authenticated;
grant  execute on function public.fixed_set_pool_sizes(text) to authenticated;

-- ------------------------------------------------------- in a booking ---
-- The teacher who booked a targeted test (or an admin) says which set it came
-- from; only an approved set, and only its questions, may be recorded.
create or replace function public.record_fixed_set(p_session uuid, p_set uuid)
returns void
language plpgsql security definer set search_path = public as $$
declare s fixed_sets;
begin
  perform fixed_sets_guard();
  select * into s from fixed_sets where id = p_set;
  if s.id is null or s.status <> 'approved' then raise exception 'only an approved set is booked from'; end if;
  if not exists (select 1 from sessions where id = p_session and mode = 'targeted'
                   and (teacher_id = auth.uid() or is_admin())) then
    raise exception 'only the teacher who booked it records its set';
  end if;
  insert into session_fixed_sets (session_id, set_id, set_label) values (p_session, p_set, s.label)
  on conflict (session_id) do update set set_id = excluded.set_id, set_label = excluded.set_label, recorded_at = now();
end $$;

revoke execute on function public.record_fixed_set(uuid, uuid) from public, anon, authenticated;
grant  execute on function public.record_fixed_set(uuid, uuid) to authenticated;
