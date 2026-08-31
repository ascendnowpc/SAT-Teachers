-- ============================================================================
--  0020 — a question can be corrected, and can carry a picture
--
--  Two things the bank could not do.
--
--  EDITING.  0002 gave us create_question and nothing else, so a typo in a stem
--  or a wrong key could only be fixed from the SQL editor.  update_question is
--  its mirror: same shape, same one-transaction guarantee, and security invoker
--  so RLS decides who may touch which row — a teacher's own questions, or house
--  content, which any teacher may correct (0008).
--
--  Replacing the options wholesale rather than diffing them is deliberate.  The
--  key references a label, not an option row, so a diff that renumbered labels
--  could leave the key pointing at an option that had moved underneath it.
--
--  PICTURES.  Maths items are geometry as often as they are text, and a figure
--  cannot be typed into a passage.  questions.image_url holds one, stored in a
--  bucket rather than the database.
--
--  The bucket is public, and that is a real decision: a student has to be able
--  to load the image the moment a question is published to them, and signing
--  every URL would mean a round trip per render on a screen that must not
--  stall mid-test.  Paths are random, so an image is unlisted rather than
--  secret — the same standing as an unlisted document. The answer key is not in
--  the picture, so nothing in the bucket is worth guessing at.  Writing to it
--  is teacher-only.
-- ============================================================================

alter table questions add column if not exists image_url text;

comment on column questions.image_url is
  'A figure for the question — a diagram, a chart. Stored in the question-images bucket; the row holds its public URL.';

-- ------------------------------------------------------------- authoring ----
-- create_question gains the image. Defaulted, so every existing caller and the
-- loaders in 0008/0009 keep working untouched.
create or replace function public.create_question(
  p_subject              text,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null,
  p_image_url            text default null
) returns uuid
language plpgsql security invoker set search_path = public as $$
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

  insert into questions (
    created_by, subject, section, skill, passage, passage_underline, stem,
    difficulty, difficulty_rationale, image_url
  ) values (
    auth.uid(), p_subject, nullif(p_section, ''), nullif(p_skill, ''),
    nullif(p_passage, ''), nullif(p_passage_underline, ''), p_stem,
    p_difficulty, nullif(p_difficulty_rationale, ''), nullif(p_image_url, '')
  )
  returning id into qid;

  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body'
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, nullif(p_explanation, ''));

  return qid;
end $$;

-- --------------------------------------------------------------- editing ----
create or replace function public.update_question(
  p_question             uuid,
  p_subject              text,
  p_section              text,
  p_passage              text,
  p_stem                 text,
  p_difficulty           difficulty_level,
  p_difficulty_rationale text,
  p_options              jsonb,
  p_correct              answer_option,
  p_explanation          text,
  p_passage_underline    text default null,
  p_skill                text default null,
  p_image_url            text default null
) returns uuid
language plpgsql security invoker set search_path = public as $$
declare
  labels text[];
begin
  select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;
  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;

  -- RLS decides whether this row is theirs to change; a row they may not touch
  -- updates nothing, and the check below turns that into an error they can read.
  update questions
     set subject              = p_subject,
         section              = nullif(p_section, ''),
         skill                = nullif(p_skill, ''),
         passage              = nullif(p_passage, ''),
         passage_underline    = nullif(p_passage_underline, ''),
         stem                 = p_stem,
         difficulty           = p_difficulty,
         difficulty_rationale = nullif(p_difficulty_rationale, ''),
         image_url            = nullif(p_image_url, ''),
         updated_at           = now()
   where id = p_question;

  if not found then raise exception 'that question is not yours to edit'; end if;

  -- Wholesale, not a diff: the key points at a label, so an option that moved
  -- under a diff would leave the key pointing somewhere else.
  delete from question_options where question_id = p_question;
  insert into question_options (question_id, label, body)
  select p_question, (o->>'label')::answer_option, o->>'body'
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (p_question, p_correct, nullif(p_explanation, ''))
  on conflict (question_id) do update
    set correct_option = excluded.correct_option,
        explanation    = excluded.explanation,
        updated_at     = now();

  return p_question;
end $$;

comment on function public.update_question(
  uuid, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, text, text, text
) is 'Rewrites one question, its options and its key in one transaction. RLS decides whose questions may be rewritten.';

-- ---------------------------------------------------------------- images ----
insert into storage.buckets (id, name, public)
values ('question-images', 'question-images', true)
on conflict (id) do update set public = true;

-- Reading is open, which is what "public bucket" means. Writing is not.
drop policy if exists question_images_teacher_write on storage.objects;
create policy question_images_teacher_write on storage.objects
  for insert to authenticated
  with check (bucket_id = 'question-images' and public.is_teacher());

drop policy if exists question_images_teacher_update on storage.objects;
create policy question_images_teacher_update on storage.objects
  for update to authenticated
  using (bucket_id = 'question-images' and public.is_teacher())
  with check (bucket_id = 'question-images' and public.is_teacher());

drop policy if exists question_images_teacher_delete on storage.objects;
create policy question_images_teacher_delete on storage.objects
  for delete to authenticated
  using (bucket_id = 'question-images' and public.is_teacher());
