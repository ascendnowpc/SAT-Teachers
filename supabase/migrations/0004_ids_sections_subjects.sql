-- ============================================================================
--  0004 — identity codes, "section" instead of "domain", mathematics
--
--  IDs now read BATO26-1:
--    BAT  first three letters of the first name
--    O    first letter of the surname
--    26   two-digit year the person joined
--    -1   sequence within that prefix, starting at 1, unbounded
-- ============================================================================

-- ------------------------------------------------------------ identity ----
drop sequence if exists teacher_code_seq;
drop sequence if exists student_code_seq;

create table display_id_counters (
  prefix  text primary key,
  next_no integer not null default 1
);

create or replace function public.build_display_id(p_full_name text, p_joined_on date)
returns text
language plpgsql
set search_path = public
as $$
declare
  v_cleaned text;
  v_parts   text[];
  v_given   text;
  v_surname text;
  v_initial text;
  v_prefix  text;
  v_seq     int;
begin
  -- Keep letters and spaces only, so "O'Celik-Bey" still yields a usable code.
  v_cleaned := trim(regexp_replace(upper(coalesce(p_full_name, '')), '[^A-Z ]', '', 'g'));
  v_parts   := regexp_split_to_array(v_cleaned, '\s+');
  v_given   := coalesce(nullif(v_parts[1], ''), 'XXX');
  v_surname := case when array_length(v_parts, 1) > 1
                    then v_parts[array_length(v_parts, 1)] end;

  -- A missing surname falls back to the 4th letter of the given name, then X,
  -- so every code comes out the same shape whatever the name looks like.
  v_initial := coalesce(nullif(left(v_surname, 1), ''), nullif(substr(v_given, 4, 1), ''), 'X');

  v_prefix := rpad(left(v_given, 3), 3, 'X') || v_initial
              || to_char(coalesce(p_joined_on, current_date), 'YY');

  -- Upsert-loop rather than ON CONFLICT: two people signing up with the same
  -- prefix at the same moment must not collide on a number.
  loop
    update display_id_counters c
       set next_no = c.next_no + 1
     where c.prefix = v_prefix
    returning c.next_no - 1 into v_seq;
    exit when found;

    begin
      insert into display_id_counters (prefix, next_no) values (v_prefix, 2);
      v_seq := 1;
      exit;
    exception when unique_violation then
      -- another signup claimed the prefix first; loop and take the update path
    end;
  end loop;

  return v_prefix || '-' || v_seq;
end;
$$;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  requested text := coalesce(new.raw_user_meta_data->>'role', 'student');
  resolved  user_role;
  full_name text := coalesce(new.raw_user_meta_data->>'full_name', '');
begin
  resolved := case when requested = 'teacher' then 'teacher'::user_role
                   else 'student'::user_role end;

  insert into public.profiles (id, role, display_id, full_name, email)
  values (new.id, resolved, build_display_id(full_name, current_date), full_name, new.email);
  return new;
end;
$$;

revoke execute on function public.handle_new_user() from anon, authenticated;
revoke execute on function public.build_display_id(text, date) from anon, authenticated;

-- ------------------------------------------------- sections + subjects ----
-- "Domain" was the College Board's word; the teachers say "section", and the
-- four Reading & Writing sections are what every report is grouped by.
alter table questions rename column domain to section;

alter table questions drop constraint questions_domain_check;
alter table questions add constraint questions_section_check
  check (section is null or section in (
    'information_and_ideas',
    'expression_of_ideas',
    'standard_english_conventions',
    'craft_and_structure',
    'algebra',
    'advanced_math',
    'problem_solving_and_data_analysis',
    'geometry_and_trigonometry'
  ));

update questions set subject = 'mathematics' where subject = 'math';
alter table questions drop constraint questions_subject_check;
alter table questions add constraint questions_subject_check
  check (subject in ('english', 'mathematics'));

drop index if exists questions_bank_idx;
create index questions_bank_idx on questions (subject, section, difficulty, status);

-- create_question follows the rename.
drop function if exists public.create_question(text, text, text, text, difficulty_level, text, jsonb, answer_option, text);

create or replace function public.create_question(
  p_subject              text,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text
) returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  qid    uuid;
  labels text[];
begin
  select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;
  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;

  insert into questions (created_by, subject, section, passage, stem, difficulty, difficulty_rationale)
  values (auth.uid(), p_subject, nullif(p_section, ''), nullif(p_passage, ''), p_stem,
          p_difficulty, nullif(p_difficulty_rationale, ''))
  returning id into qid;

  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body' from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, nullif(p_explanation, ''));

  return qid;
end;
$$;
