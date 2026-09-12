-- ============================================================================
--  0041 — mathematics is three tests too
--
--  0040 created the three mathematics tests and left them empty, on the
--  reasoning that the teachers would fill them from inside each test with
--  create_question_in_set.  What arrived instead was the whole set of sixty at
--  once — SAT_Math_Questions, twenty easy, twenty medium, twenty hard, sorted
--  by the teachers before it reached us — and sixty items typed one at a time
--  through a browser form is not a thing to ask of anybody.  So they land the
--  way English landed in 0026: as house content, by source_ref, in one
--  migration that can be re-run.
--
--  Mathematics now works exactly as English does.  A session picks a level,
--  load_session_level (0027) finds the active test for that subject and level,
--  and twenty questions are there.  Nothing in the app changes.
--
--  Three things had to give first.
--
--  THE SKILL LABELS.  questions.skill has been checked against (section,
--  skill) pairs since 0010, and every pair in that list was one of the eleven
--  English ones — so any mathematics item with a skill would have been
--  rejected by the constraint, and one without a skill would have been a
--  report with its second column blank.  The nineteen mathematics skills are
--  added here, from the same source as the English eleven: the College Board's
--  own list, four sections and the skills under each.  All nineteen are
--  listed, not just the seventeen this document exercises, because the
--  constraint is the taxonomy and the next paper should not need a migration
--  to name a circle question.
--
--  The document's own Skill line is what each item is tagged from, normalised
--  to that list where it wandered — it writes "Percentage" and "One-Variable
--  Data and Measures of Center and Spread" for skills the College Board calls
--  "Percentages" and "One-variable data: distributions and measures of center
--  and spread", and those are the same skill under two spellings.  A report
--  that groups by string cannot know that, so the string is settled here.
--  Where the document's Domain and its Skill disagree — question 7 is filed
--  under Advanced Math and is a linear inequality — THE DOCUMENT'S DOMAIN
--  WINS, for the same reason 0026 let the teachers' sorting beat the
--  transcribed difficulty labels: the people who filed it teach from it.
--
--  THE LOADERS.  seed_bank_item wrote 'english' into every row it made and had
--  nowhere to put a figure; seed_level_test built its set's source_ref out of
--  a hardcoded 'ENG-LEVEL-'.  Both gain a subject rather than growing a
--  mathematics twin — 0024 is what two loaders doing one job costs, and it
--  cost the SQL contracts an afternoon.  Each is dropped and recreated rather
--  than replaced in place, because adding a defaulted argument makes a second
--  function of a different signature and leaves the first one standing, which
--  is that same 0024 bug exactly.
--
--  THE FIGURES.  Nine of the sixty are unreadable without a picture: a
--  scatterplot, two box-and-whisker summaries, a histogram, four geometry
--  diagrams, and one item whose equation is itself an image.  0020 put figures
--  in the question-images bucket, which is right for a teacher uploading one
--  from the authoring form — it is storage a browser can write to.  These nine
--  are not that.  They are house content, they arrive with the migration that
--  needs them, and a migration cannot upload to a bucket.  So they ship with
--  the app, in apps/web/public/question-figures, and image_url holds a
--  root-relative path rather than a bucket URL.  QuestionView renders it into
--  an <img src>, which does not care which of the two it is given, and Vercel
--  serves a file that exists before it considers the SPA rewrite.  The
--  trade-off is that correcting a figure is a deploy rather than an upload;
--  the gain is that the figure is versioned with the question it belongs to.
--
--  Every item carries a difficulty_rationale, for the reason 0026 gives: it is
--  the sentence a teacher reads when deciding whether to move a student up,
--  and the only written record of why the item sits where it does.  Sixty of
--  them are written against the level the teachers put the item at.
-- ============================================================================

-- ------------------------------------------------------- the skill labels ----
--  The four mathematics sections and the skills under each, added beside the
--  English eleven from 0010.  A skill still belongs to exactly one section, so
--  a "percentages" item filed under Geometry and Trigonometry is caught here
--  rather than in a report.
alter table questions drop constraint if exists questions_skill_check;
alter table questions add constraint questions_skill_check check (
  skill is null or (section, skill) in (
    -- English — Reading and Writing (0010)
    ('information_and_ideas',         'central_ideas_and_details'),
    ('information_and_ideas',         'command_of_evidence_textual'),
    ('information_and_ideas',         'command_of_evidence_quantitative'),
    ('information_and_ideas',         'inferences'),
    ('craft_and_structure',           'words_in_context'),
    ('craft_and_structure',           'text_structure_and_purpose'),
    ('craft_and_structure',           'cross_text_connections'),
    ('expression_of_ideas',           'rhetorical_synthesis'),
    ('expression_of_ideas',           'transitions'),
    ('standard_english_conventions',  'boundaries'),
    ('standard_english_conventions',  'form_structure_and_sense'),

    -- Mathematics
    ('algebra',                       'linear_equations_in_one_variable'),
    ('algebra',                       'linear_equations_in_two_variables'),
    ('algebra',                       'linear_functions'),
    ('algebra',                       'systems_of_two_linear_equations_in_two_variables'),
    ('algebra',                       'linear_inequalities_in_one_or_two_variables'),
    ('advanced_math',                 'equivalent_expressions'),
    ('advanced_math',                 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables'),
    ('advanced_math',                 'nonlinear_functions'),
    ('problem_solving_and_data_analysis', 'ratios_rates_proportional_relationships_and_units'),
    ('problem_solving_and_data_analysis', 'percentages'),
    ('problem_solving_and_data_analysis', 'one_variable_data_distributions_and_measures_of_center_and_spread'),
    ('problem_solving_and_data_analysis', 'two_variable_data_models_and_scatterplots'),
    ('problem_solving_and_data_analysis', 'probability_and_conditional_probability'),
    ('problem_solving_and_data_analysis', 'inference_from_sample_statistics_and_margin_of_error'),
    ('problem_solving_and_data_analysis', 'evaluating_statistical_claims_observational_studies_and_experiments'),
    ('geometry_and_trigonometry',     'area_and_volume'),
    ('geometry_and_trigonometry',     'lines_angles_and_triangles'),
    ('geometry_and_trigonometry',     'right_triangles_and_trigonometry'),
    ('geometry_and_trigonometry',     'circles')
  )
);

-- ------------------------------------------------------------- the loaders ----
--  seed_bank_item gains the subject it used to assume and the figure 0020 gave
--  the table.  Both are defaulted, so the call shape 0008, 0009 and 0026 use is
--  unchanged.  The old twelve-argument version is dropped rather than left
--  standing beside this one, because a caller passing the first nine
--  positionally would otherwise match both and Postgres would refuse to choose
--  (0024) — and the new fourteen-argument one is dropped too, because this
--  migration has to be re-runnable like every other content migration here and
--  on a second run it is its own previous self in the way.
drop function if exists public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status, text);
drop function if exists public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status, text, text, text);

create function public.seed_bank_item(
  p_source_ref  text,
  p_section     text,
  p_passage     text,
  p_underline   text,
  p_stem        text,
  p_difficulty  difficulty_level,
  p_rationale   text,
  p_options     jsonb,
  p_correct     answer_option,
  p_explanation text,
  p_status      question_status default 'published',
  p_skill       text default null,
  p_subject     text default 'english',
  p_image_url   text default null
) returns uuid
language plpgsql
as $fn$
declare
  qid uuid;
begin
  insert into questions (
    created_by, subject, section, skill, passage, passage_underline, stem,
    difficulty, difficulty_rationale, status, source_ref, image_url
  ) values (
    null, p_subject, p_section, p_skill, p_passage, p_underline, p_stem,
    p_difficulty, p_rationale, p_status, p_source_ref, p_image_url
  )
  on conflict (source_ref) where source_ref is not null do update set
    subject              = excluded.subject,
    section              = excluded.section,
    skill                = excluded.skill,
    passage              = excluded.passage,
    passage_underline    = excluded.passage_underline,
    stem                 = excluded.stem,
    difficulty           = excluded.difficulty,
    difficulty_rationale = excluded.difficulty_rationale,
    status               = excluded.status,
    image_url            = excluded.image_url
  returning id into qid;

  delete from question_options where question_id = qid;
  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body'
  from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, p_explanation)
  on conflict (question_id) do update set
    correct_option = excluded.correct_option,
    explanation    = excluded.explanation,
    updated_at     = now();

  return qid;
end;
$fn$;

revoke execute on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text,
  question_status, text, text, text
) from public, anon, authenticated;

comment on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text,
  question_status, text, text, text
) is 'Upserts one house question by source_ref, with its options, its key and its figure. Used by the paper-loading migrations.';

--  seed_level_test gains the same subject.  It also stops hardcoding English's
--  pace: the digital SAT gives about 71 seconds a Reading and Writing question
--  and about 95 a mathematics one, so a mathematics item that takes 80 seconds
--  is a student working well and an English one is a student stuck.  One
--  benchmark for both would read every mathematics session as slow.
drop function if exists public.seed_level_test(text, text, text, text[]);
drop function if exists public.seed_level_test(text, text, text, text[], text);

create function public.seed_level_test(
  p_level       text,
  p_title       text,
  p_description text,
  p_refs        text[],
  p_subject     text default 'english'
) returns uuid
language plpgsql
as $fn$
declare
  sid  uuid;
  n    int;
  seen int;
  pace int;
begin
  if p_level not in ('easy', 'medium', 'hard') then
    raise exception 'a level test is easy, medium or hard';
  end if;
  if p_subject not in ('english', 'mathematics') then
    raise exception 'a level test is english or mathematics';
  end if;

  insert into question_sets (created_by, title, subject, description, kind, level, source_ref)
  values (null, p_title, p_subject, p_description, 'test', p_level,
          case p_subject when 'mathematics' then 'MATH-LEVEL-' else 'ENG-LEVEL-' end || upper(p_level))
  on conflict (source_ref) where source_ref is not null do update set
    title       = excluded.title,
    subject     = excluded.subject,
    description = excluded.description,
    kind        = excluded.kind,
    level       = excluded.level,
    is_active   = true
  returning id into sid;

  -- Rewritten wholesale: position is unique within a set, so an incremental
  -- update collides with itself the moment an item moves.
  delete from question_set_items where set_id = sid;
  insert into question_set_items (set_id, question_id, position)
  select sid, q.id, r.ord
    from unnest(p_refs) with ordinality as r(ref, ord)
    join questions q on q.source_ref = r.ref;

  -- A test that quietly loaded nineteen of its twenty questions is worse than
  -- one that refuses to load: the missing item only shows up as a student who
  -- never saw it.
  n    := coalesce(array_length(p_refs, 1), 0);
  select count(*) into seen from question_set_items where set_id = sid;
  if seen <> n then
    raise exception '% % test: % of % questions found in the bank', p_subject, p_level, seen, n;
  end if;

  pace := case when p_subject = 'mathematics'
               then case p_level when 'easy' then 75 when 'medium' then 95 else 120 end
               else case p_level when 'easy' then 55 when 'medium' then 75 else 100 end
          end;

  -- The level is the item's difficulty. Said here rather than left to each
  -- loader, so the two can never drift.
  update questions q
     set difficulty = p_level::difficulty_level,
         target_seconds = pace
    from question_set_items i
   where i.set_id = sid and i.question_id = q.id;

  return sid;
end $fn$;

revoke execute on function public.seed_level_test(text, text, text, text[], text)
  from public, anon, authenticated;

comment on function public.seed_level_test(text, text, text, text[], text) is
  'Registers one level test for a subject and fills it from the bank by source_ref, in order. Sets every item''s difficulty to the level and its pace to the subject''s.';

-- =================================================================== EASY ===
--  Twenty items, the teachers' questions 1-20.  They are numbered as the
--  document numbers them, and that numbering runs 1-60 across the three tests
--  rather than restarting, because a teacher saying "look at 46" has to mean
--  one question.
do $seedeasy$
begin

perform seed_bank_item(
  'MATH-EASY-Q01', 'algebra',
  'The function f is defined by f(x) = 25x + 30.',
  null,
  'What is the value of f(x) when x = 2?',
  'easy',
  'One substitution and one multiplication, with nothing to rearrange first. A student who can read function notation at all gets this; one who cannot reads f(x) as f times x and is stuck at the first line.',
  '[
    {"label":"A","body":"50"},
    {"label":"B","body":"57"},
    {"label":"C","body":"80"},
    {"label":"D","body":"110"}]'::jsonb,
  'C', 'f(2) = 25(2) + 30 = 50 + 30 = 80. A is 25(2) with the +30 dropped, which is the near miss worth naming; B adds 25 and 30 and then the 2.',
  'published', 'linear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q02', 'algebra',
  null,
  null,
  'If 4x − 28 = −24, what is the value of x − 7?',
  'easy',
  'Two routes and both are short: solve for x and subtract, or notice the whole left side is 4(x − 7). The second is the one worth teaching, and a student who sees it answers in one step.',
  '[
    {"label":"A","body":"−24"},
    {"label":"B","body":"−22"},
    {"label":"C","body":"−6"},
    {"label":"D","body":"−1"}]'::jsonb,
  'C', '4x − 28 = 4(x − 7), so 4(x − 7) = −24 and x − 7 = −6. Solving the long way: 4x = 4, x = 1, x − 7 = −6. D is x − 7 with x = 6 — the sign of the −24 lost on the way across.',
  'published', 'linear_equations_in_one_variable', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q03', 'algebra',
  'Hiro and Sofia purchased shirts and pants from a store. The price of each shirt purchased was the same and the price of each pair of pants purchased was the same. Hiro purchased 4 shirts and 2 pairs of pants for $86, and Sofia purchased 3 shirts and 5 pairs of pants for $166.',
  null,
  'Which of the following systems of linear equations represents the situation, if x represents the price, in dollars, of each shirt and y represents the price, in dollars, of each pair of pants?',
  'easy',
  'No solving at all — the work is reading one shopper per equation rather than one item per equation. B and D are the trap for a student who groups the 4 and 3 shirts together because they are next to each other in the sentence.',
  '[
    {"label":"A","body":"4x + 2y = 86\n3x + 5y = 166"},
    {"label":"B","body":"4x + 3y = 86\n2x + 5y = 166"},
    {"label":"C","body":"4x + 2y = 166\n3x + 5y = 86"},
    {"label":"D","body":"4x + 3y = 166\n2x + 5y = 86"}]'::jsonb,
  'A', 'Hiro: 4 shirts and 2 pairs of pants for $86, so 4x + 2y = 86. Sofia: 3 shirts and 5 pairs for $166, so 3x + 5y = 166. B and D pair the two shirt counts in one equation, which describes nobody''s purchase. C has the right equations with the totals swapped.',
  'published', 'systems_of_two_linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q04', 'algebra',
  '7(2x − 3) = 63',
  null,
  'Which equation has the same solution as the given equation?',
  'easy',
  'Dividing both sides by 7 is the whole question. C is what a student writes who distributes the 7 on the left and forgets it on the right — the single most common slip at this level, and it is sitting right there as an option.',
  '[
    {"label":"A","body":"2x − 3 = 9"},
    {"label":"B","body":"2x − 3 = 56"},
    {"label":"C","body":"2x − 21 = 63"},
    {"label":"D","body":"2x − 21 = 70"}]'::jsonb,
  'A', 'Divide both sides by 7: 2x − 3 = 9. C distributes on the left (14x − 21) then divides only that side by 7, leaving the 63 untouched. B subtracts 7 instead of dividing.',
  'published', 'linear_equations_in_one_variable', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q05', 'algebra',
  null,
  null,
  'The point (8, 2) in the xy-plane is a solution to which of the following systems of inequalities?',
  'easy',
  'Both coordinates are positive and all four options are sign pairs, so the only thing that can go wrong is reading (8, 2) in the wrong order — and here that changes nothing. This is the floor of the section.',
  '[
    {"label":"A","body":"x > 0\ny > 0"},
    {"label":"B","body":"x > 0\ny < 0"},
    {"label":"C","body":"x < 0\ny > 0"},
    {"label":"D","body":"x < 0\ny < 0"}]'::jsonb,
  'A', 'x = 8 > 0 and y = 2 > 0, so the point satisfies x > 0 and y > 0. The other three each demand a negative coordinate the point does not have.',
  'published', 'linear_inequalities_in_one_or_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q06', 'advanced_math',
  null,
  null,
  'Which expression is equivalent to (m⁴q⁴z⁻¹)(mq⁵z³), where m, q, and z are positive?',
  'easy',
  'Add the exponents, three times. A is the answer a student gives who multiplies the exponents instead, which is the misconception this item is here to find.',
  '[
    {"label":"A","body":"m⁴q²⁰z⁻³"},
    {"label":"B","body":"m⁵q⁹z²"},
    {"label":"C","body":"m⁶q⁸z⁻¹"},
    {"label":"D","body":"m²⁰q¹²z⁻²"}]'::jsonb,
  'B', 'Multiplying powers of the same base adds exponents: m⁴·m¹ = m⁵, q⁴·q⁵ = q⁹, z⁻¹·z³ = z². So the product is m⁵q⁹z². A and D come from multiplying the exponents rather than adding them.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q07', 'advanced_math',
  '6x − 9y > 12',
  null,
  'Which of the following inequalities is equivalent to the given inequality?',
  'easy',
  'Divide through by 3 and keep the direction — nothing is multiplied by a negative, so the inequality sign is not the test here. What is being tested is dividing every term, including the 12.',
  '[
    {"label":"A","body":"x − y > 2"},
    {"label":"B","body":"2x − 3y > 4"},
    {"label":"C","body":"3x − 2y > 4"},
    {"label":"D","body":"3y − 2x > 2"}]'::jsonb,
  'B', 'Every term is divisible by 3: 6x/3 − 9y/3 > 12/3 gives 2x − 3y > 4. C swaps the two coefficients; A divides each term by whatever happens to go into it — 6 into 6x, 9 into 9y, 6 into 12 — instead of dividing the whole inequality by one number.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q08', 'advanced_math',
  '(x + 5) + (2x − 3)',
  null,
  'Which of the following is equivalent to the given expression?',
  'easy',
  'Collect like terms once. Every option has 3x, so the item comes down to 5 + (−3), and the two wrong signs are both on offer.',
  '[
    {"label":"A","body":"3x − 2"},
    {"label":"B","body":"3x + 2"},
    {"label":"C","body":"3x − 8"},
    {"label":"D","body":"3x + 8"}]'::jsonb,
  'B', '(x + 5) + (2x − 3) = (x + 2x) + (5 − 3) = 3x + 2. A subtracts the 5 as well as the 3; D adds both.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q09', 'advanced_math',
  'x = 49
y = √x + 9',
  null,
  'The graphs of the given equations intersect at the point (x, y) in the xy-plane. What is the value of y?',
  'easy',
  'The system solves itself once x is substituted; the only real decision is whether √49 + 9 means √49 plus 9 or √58. Reading the radical''s scope is the whole item.',
  '[
    {"label":"A","body":"16"},
    {"label":"B","body":"40"},
    {"label":"C","body":"81"},
    {"label":"D","body":"130"}]'::jsonb,
  'A', 'x = 49, so y = √49 + 9 = 7 + 9 = 16. C is 9², and D is 49 + 81 — both come of doing something with the 9 other than adding it to the root.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q10', 'advanced_math',
  null,
  null,
  'Which of the following points is on the graph shown?',
  'easy',
  'Read one point off a curve. Three of the four options sit on the y-axis, two of them a single unit apart, so a student who reads the axis carelessly — or counts the asymptote at y = −4 as the intercept — lands on C.',
  '[
    {"label":"A","body":"(−1, −9)"},
    {"label":"B","body":"(0, −5)"},
    {"label":"C","body":"(0, −4)"},
    {"label":"D","body":"(0, 0)"}]'::jsonb,
  'B', 'The curve crosses the y-axis at the marked point (0, −5). C is the horizontal asymptote y = −4, which the curve approaches on the right but never meets; D is the origin, which the curve passes well below.',
  'published', 'nonlinear_functions', 'mathematics', '/question-figures/math-easy-q10.png');

perform seed_bank_item(
  'MATH-EASY-Q11', 'advanced_math',
  '|x + 45| = 48',
  null,
  'What is the positive solution to the given equation?',
  'easy',
  'An absolute-value equation with two branches, but only one is asked for and it is the branch a student finds first. C is the other branch with its sign lost, which is the answer to watch for.',
  '[
    {"label":"A","body":"3"},
    {"label":"B","body":"48"},
    {"label":"C","body":"93"},
    {"label":"D","body":"96"}]'::jsonb,
  'A', 'x + 45 = 48 gives x = 3; x + 45 = −48 gives x = −93. The positive solution is 3. C is 93 — the negative branch reported without its sign.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q12', 'problem_solving_and_data_analysis',
  null,
  null,
  'Each face of a fair 14-sided die is labeled with a number from 1 through 14, with a different number appearing on each face. If the die is rolled one time, what is the probability of rolling a 2?',
  'easy',
  'One outcome out of fourteen equally likely ones. B is the answer of a student who reads the label on the face as the count of ways it can happen, and that confusion is exactly what this item catches.',
  '[
    {"label":"A","body":"1/14"},
    {"label":"B","body":"2/14"},
    {"label":"C","body":"12/14"},
    {"label":"D","body":"13/14"}]'::jsonb,
  'A', 'Exactly one of the fourteen equally likely faces shows a 2, so the probability is 1/14. B mistakes the number on the face for a frequency; D is the probability of not rolling a 2.',
  'published', 'probability_and_conditional_probability', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q13', 'problem_solving_and_data_analysis',
  'There are 55 students in Spanish club. A sample of the Spanish club students was selected at random and asked whether they intend to enroll in a new study program. Of those surveyed, 20% responded that they intend to enroll in the study program.',
  null,
  'Based on this survey, which of the following is the best estimate of the total number of Spanish club students who intend to enroll in the study program?',
  'easy',
  'A single percentage applied to a total. B is the percentage itself reported as a count, which is the misread this item exists to find; C is the complement.',
  '[
    {"label":"A","body":"11"},
    {"label":"B","body":"20"},
    {"label":"C","body":"44"},
    {"label":"D","body":"55"}]'::jsonb,
  'A', '20% of 55 is 0.20 × 55 = 11. B repeats the 20 from "20%" as though it were a number of students; C is the 80% who do not intend to enroll.',
  'published', 'inference_from_sample_statistics_and_margin_of_error', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q14', 'problem_solving_and_data_analysis',
  '2, 2, 2, 3, 4, 4, 11',
  null,
  'What is the median of the seven data values shown?',
  'easy',
  'The list is already in order and has an odd count, so the median is the fourth value and no arithmetic is needed. A is the mode and D is close to the mean, so each wrong option names a different measure — this reads which one the student reached for.',
  '[
    {"label":"A","body":"2"},
    {"label":"B","body":"3"},
    {"label":"C","body":"4"},
    {"label":"D","body":"9"}]'::jsonb,
  'B', 'Seven values in order: the median is the fourth, which is 3. A is the mode, C is the fifth and sixth value rather than the fourth, and D is close to nothing in the list — the mean is 4, which the 11 pulls up well above the median.',
  'published', 'one_variable_data_distributions_and_measures_of_center_and_spread', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q15', 'problem_solving_and_data_analysis',
  null,
  null,
  'Of the following, which is the best model for the data in the scatterplot?',
  'easy',
  'All four models are upward parabolas, so the shape decides nothing. The y-intercept does: the plot passes through (0, 20) and exactly one option has a constant term of 20. Reading a constant term off a graph is the easiest reliable check there is, and it settles this item on its own.',
  '[
    {"label":"A","body":"y = 2x² − 11x − 20"},
    {"label":"B","body":"y = 2x² − 11x + 20"},
    {"label":"C","body":"y = 2x² − 5x − 3"},
    {"label":"D","body":"y = 2x² − 5x + 3"}]'::jsonb,
  'B', 'The data meet the y-axis at 20, so the constant term must be +20 — which rules out A (−20), C (−3) and D (+3) outright. B survives, and it checks out: the vertex of y = 2x² − 11x + 20 sits at x = 2.75 with y ≈ 4.9, which is where the data bottom out.',
  'published', 'two_variable_data_models_and_scatterplots', 'mathematics', '/question-figures/math-easy-q15.png');

perform seed_bank_item(
  'MATH-EASY-Q16', 'geometry_and_trigonometry',
  null,
  null,
  'Triangles EFG and JKL are congruent, where E, F, and G correspond to J, K, and L, respectively. The measure of angle E is 45° and the measure of angle F is 20°. What is the measure of angle J?',
  'easy',
  'Congruence means corresponding angles are equal, and the correspondence is written out in the stem. A student who works out the third angle instead of reading the correspondence has done more arithmetic and got less.',
  '[
    {"label":"A","body":"20°"},
    {"label":"B","body":"45°"},
    {"label":"C","body":"135°"},
    {"label":"D","body":"160°"}]'::jsonb,
  'B', 'E corresponds to J and the triangles are congruent, so angle J = angle E = 45°. A is angle F, and C and D are supplements of the two given angles — the work of a student who started calculating before reading which angle was asked for.',
  'published', 'lines_angles_and_triangles', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q17', 'geometry_and_trigonometry',
  null,
  null,
  'In the figure, line m is parallel to line n. What is the value of w?',
  'easy',
  'One parallel-lines fact, used once. C tempts a student who subtracts from 180 out of habit without checking whether the two angles are on the same side of the transversal.',
  '[
    {"label":"A","body":"17"},
    {"label":"B","body":"30"},
    {"label":"C","body":"70"},
    {"label":"D","body":"170"}]'::jsonb,
  'D', 'The 170° angle and w° are corresponding angles where transversal t cuts the parallel lines m and n, so w = 170. The instinct this item tests against is subtracting from 180 out of habit; that gives 10, which is deliberately not on offer, so a student who reaches for it has to stop and work out why the two angles are equal instead.',
  'published', 'lines_angles_and_triangles', 'mathematics', '/question-figures/math-easy-q17.png');

perform seed_bank_item(
  'MATH-EASY-Q18', 'geometry_and_trigonometry',
  null,
  null,
  'What is the area, in square inches, of a rectangle with a length of 7 inches and a width of 6 inches?',
  'easy',
  'One formula, two numbers. A is the two sides added and D is that product doubled, so each wrong option is a different formula misremembered — this reads whether the student knows which one area is rather than whether they can multiply.',
  '[
    {"label":"A","body":"13"},
    {"label":"B","body":"20"},
    {"label":"C","body":"42"},
    {"label":"D","body":"84"}]'::jsonb,
  'C', '7 × 6 = 42 square inches. A adds the two sides instead of multiplying them; D is twice that product, the doubling that belongs to a perimeter and not to an area.',
  'published', 'area_and_volume', 'mathematics', null);

perform seed_bank_item(
  'MATH-EASY-Q19', 'geometry_and_trigonometry',
  null,
  null,
  'In the figure, lines ℓ and m are parallel, y = 20, and z = 60. What is the value of x?',
  'easy',
  'Two steps rather than one: move z across the parallel lines, then use the angle sum. It is the hardest of the easy geometry items and belongs at the top of the easy test.',
  '[
    {"label":"A","body":"120"},
    {"label":"B","body":"100"},
    {"label":"C","body":"90"},
    {"label":"D","body":"80"}]'::jsonb,
  'B', 'Because ℓ and m are parallel, the angle marked z° equals the triangle''s interior angle at its lower-right vertex, so that angle is 60°. The angle at the lower-left vertex is y = 20°. Then x = 180 − 60 − 20 = 100. A is 180 − 60, the answer of a student who used only one of the two given angles.',
  'published', 'lines_angles_and_triangles', 'mathematics', '/question-figures/math-easy-q19.png');

perform seed_bank_item(
  'MATH-EASY-Q20', 'geometry_and_trigonometry',
  null,
  null,
  'The area of a square is 64 square inches. What is the side length, in inches, of this square?',
  'easy',
  'A square root of a perfect square. B is 64/4, the answer of a student who treated 64 as a perimeter, which is the one misreading available here.',
  '[
    {"label":"A","body":"8"},
    {"label":"B","body":"16"},
    {"label":"C","body":"64"},
    {"label":"D","body":"128"}]'::jsonb,
  'A', 'Side = √64 = 8 inches. B divides by 4, which would be right if 64 were the perimeter; C repeats the area; D doubles it.',
  'published', 'area_and_volume', 'mathematics', null);

end $seedeasy$;

-- ================================================================= MEDIUM ===
--  Questions 21-40.
do $seedmedium$
begin

perform seed_bank_item(
  'MATH-MEDIUM-Q21', 'algebra',
  null,
  null,
  'A cargo helicopter delivers only 100-pound packages and 120-pound packages. For each delivery trip, the helicopter must carry at least 10 packages, and the total weight of the packages can be at most 1,100 pounds. What is the maximum number of 120-pound packages that the helicopter can carry per trip?',
  'medium',
  'Two constraints pulling opposite ways, and the student has to see that maximising the heavy packages means taking the minimum total of ten. Translating "at least" and "at most" into the right inequality signs is where this is won or lost.',
  '[
    {"label":"A","body":"2"},
    {"label":"B","body":"4"},
    {"label":"C","body":"5"},
    {"label":"D","body":"6"}]'::jsonb,
  'C', 'Let x be the number of 120-pound packages and y the 100-pound ones. Carrying more than ten packages only adds weight, so take x + y = 10. Then 120x + 100(10 − x) ≤ 1,100, so 20x ≤ 100 and x ≤ 5. Five heavy and five light weigh 1,100 pounds exactly. D fails the weight cap by 20 pounds.',
  'published', 'linear_inequalities_in_one_or_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q22', 'algebra',
  'f(x) = 4x + b',
  null,
  'For the linear function f, b is a constant and f(7) = 28. What is the value of b?',
  'medium',
  'Substitution followed by one subtraction, but the answer is zero — and a student who expects a constant to be "something" talks themselves out of it. That hesitation is what puts this above the easy test rather than the arithmetic.',
  '[
    {"label":"A","body":"0"},
    {"label":"B","body":"1"},
    {"label":"C","body":"4"},
    {"label":"D","body":"7"}]'::jsonb,
  'A', 'f(7) = 4(7) + b = 28 + b, and f(7) = 28, so b = 0. C and D are the coefficient and the input read back as the answer.',
  'published', 'linear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q23', 'algebra',
  '(1/2)y = 4
x − (1/2)y = 2',
  null,
  'The given system of equations has solution (x, y). What is the value of x?',
  'medium',
  'The first equation hands over ½y rather than y, and the second equation wants that same half — so the quickest correct route never computes y at all. The student who does compute y = 8 has an extra step to undo, and C is waiting for the one who reports ½y as though it were x.',
  '[
    {"label":"A","body":"3"},
    {"label":"B","body":"7/2"},
    {"label":"C","body":"4"},
    {"label":"D","body":"6"}]'::jsonb,
  'D', 'The second equation already contains ½y, and the first says ½y = 4, so x − 4 = 2 and x = 6 without ever finding y. C is 4, the value of ½y reported as though it were x.',
  'published', 'systems_of_two_linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q24', 'algebra',
  null,
  null,
  'The function h is defined by h(x) = 4x + 28. The graph of y = h(x) in the xy-plane has an x-intercept at (a, 0) and a y-intercept at (0, b), where a and b are constants. What is the value of a + b?',
  'medium',
  'Two intercepts, two different procedures, and the x-intercept is negative — so the final addition is a subtraction in disguise. D is 7 + 28, what a student gets who keeps the 7 positive, and it is the answer this item is built to catch.',
  '[
    {"label":"A","body":"21"},
    {"label":"B","body":"28"},
    {"label":"C","body":"32"},
    {"label":"D","body":"35"}]'::jsonb,
  'A', 'y-intercept: h(0) = 28, so b = 28. x-intercept: 4x + 28 = 0 gives x = −7, so a = −7. Then a + b = −7 + 28 = 21. D is 7 + 28, the sign of a dropped; B is b on its own.',
  'published', 'linear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q25', 'algebra',
  null,
  null,
  'Line p is defined by 2y + 18x = 9. Line r is perpendicular to line p in the xy-plane. What is the slope of line r?',
  'medium',
  'Rearranging into slope-intercept form and then taking the negative reciprocal are two separate chances to lose a sign, and all four sign-and-reciprocal combinations are on the list. Getting one of the two steps right still lands on a wrong option.',
  '[
    {"label":"A","body":"−9"},
    {"label":"B","body":"−1/9"},
    {"label":"C","body":"1/9"},
    {"label":"D","body":"9"}]'::jsonb,
  'C', '2y = −18x + 9, so y = −9x + 4.5 and the slope of p is −9. Perpendicular slopes are negative reciprocals: −1/(−9) = 1/9. A is the slope of p itself, B takes the reciprocal without the sign change, and D changes the sign without taking the reciprocal.',
  'published', 'linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q26', 'advanced_math',
  null,
  null,
  'A rectangle has a length that is 15 times its width. The function y = (15w)(w) represents this situation, where y is the area, in square feet, of the rectangle and y > 0. Which of the following is the best interpretation of 15w in this context?',
  'medium',
  'Nothing to calculate — the work is reading one factor of a product for what it stands for. It sits at medium because the habit this item punishes is answering with whatever the function computes rather than with what the named piece of it means.',
  '[
    {"label":"A","body":"The length of the rectangle, in feet"},
    {"label":"B","body":"The area of the rectangle, in square feet"},
    {"label":"C","body":"The difference between the length and the width of the rectangle, in feet"},
    {"label":"D","body":"The width of the rectangle, in feet"}]'::jsonb,
  'A', 'The width is w and the length is 15 times the width, so 15w is the length, in feet. B is y, the whole product rather than the one factor asked about; D is w rather than 15w.',
  'published', 'nonlinear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q27', 'advanced_math',
  'v = −w/(150x)',
  null,
  'The given equation relates the distinct positive numbers v, w, and x. Which equation correctly expresses w in terms of v and x?',
  'medium',
  'One multiplication across a fraction bar, but the 150x sits in the denominator as a product — so the student has to move both factors, not just the x. B is what happens when only one of them makes the trip.',
  '[
    {"label":"A","body":"w = −150vx"},
    {"label":"B","body":"w = −150v/x"},
    {"label":"C","body":"w = −x/(150v)"},
    {"label":"D","body":"w = v + 150x"}]'::jsonb,
  'A', 'Multiply both sides by 150x: 150xv = −w, so w = −150vx. B moves the x and leaves the 150 behind; C inverts the relationship entirely.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q28', 'advanced_math',
  null,
  null,
  'A system of equations consists of a quadratic equation and a linear equation. The equations in this system are graphed in the xy-plane. How many solutions does this system have?',
  'medium',
  'Counting intersections is easy; knowing that an intersection is a solution is the point. A student who counts x-intercepts instead of crossings gets a different number, and the graph offers plenty of those to count.',
  '[
    {"label":"A","body":"0"},
    {"label":"B","body":"1"},
    {"label":"C","body":"2"},
    {"label":"D","body":"3"}]'::jsonb,
  'C', 'The solutions of the system are the points where the two graphs meet, and the line crosses the parabola twice — once on the left near x = −4 and once on the right near x = 8. D counts the parabola''s own x-intercepts alongside a crossing.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', '/question-figures/math-medium-q28.png');

perform seed_bank_item(
  'MATH-MEDIUM-Q29', 'advanced_math',
  '4a² + 20ab + 25b²',
  null,
  'Which of the following is a factor of the given polynomial?',
  'medium',
  'Recognising a perfect square trinomial in two variables. C and D are what a student writes who lifts the coefficients 4 and 25 straight out of the trinomial instead of taking their square roots, 2 and 5.',
  '[
    {"label":"A","body":"a + b"},
    {"label":"B","body":"2a + 5b"},
    {"label":"C","body":"4a + 5b"},
    {"label":"D","body":"4a + 25b"}]'::jsonb,
  'B', '4a² + 20ab + 25b² = (2a + 5b)², since (2a)² = 4a², (5b)² = 25b² and 2(2a)(5b) = 20ab. So 2a + 5b is a factor. C and D lift the coefficients 4 and 25 straight out of the trinomial without taking their square roots.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q30', 'advanced_math',
  null,
  null,
  'If p = 3x + 4 and v = x + 5, which of the following is equivalent to pv − 2p + v?',
  'medium',
  'Three substitutions and a full expansion, with a subtraction in the middle. C is pv alone, so a student who stops after the product — the longest part — finds their answer waiting on the list.',
  '[
    {"label":"A","body":"3x² + 12x + 7"},
    {"label":"B","body":"3x² + 14x + 17"},
    {"label":"C","body":"3x² + 19x + 20"},
    {"label":"D","body":"3x² + 26x + 33"}]'::jsonb,
  'B', 'pv = (3x + 4)(x + 5) = 3x² + 19x + 20. Then −2p = −6x − 8 and +v = x + 5. Adding: 3x² + (19 − 6 + 1)x + (20 − 8 + 5) = 3x² + 14x + 17. C is pv on its own; D adds 2p instead of subtracting it.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q31', 'advanced_math',
  null,
  null,
  'A rectangle has a length of x units and a width of (x − 15) units. If the rectangle has an area of 76 square units, what is the value of x?',
  'medium',
  'Setting up the quadratic is the easy half; the hard half is that it factors into 19 and −4 and only one of those is a length. A is the rejected root, sitting on the list for anyone who solves correctly and then stops.',
  '[
    {"label":"A","body":"4"},
    {"label":"B","body":"19"},
    {"label":"C","body":"23"},
    {"label":"D","body":"76"}]'::jsonb,
  'B', 'x(x − 15) = 76 gives x² − 15x − 76 = 0, which factors as (x − 19)(x + 4) = 0. So x = 19 or x = −4, and a length cannot be negative: x = 19. A is |−4|, the discarded root with its sign removed.',
  'published', 'nonlinear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q32', 'advanced_math',
  'x² − 12x + 27 = 0',
  null,
  'How many distinct real solutions does the given equation have?',
  'medium',
  'The question asks how many, not which — so the discriminant answers it without factoring. A student who factors anyway still gets there, which is why this is medium rather than hard.',
  '[
    {"label":"A","body":"Exactly two"},
    {"label":"B","body":"Exactly one"},
    {"label":"C","body":"Zero"},
    {"label":"D","body":"Infinitely many"}]'::jsonb,
  'A', 'The discriminant is (−12)² − 4(1)(27) = 144 − 108 = 36, which is positive, so there are two distinct real solutions. Factoring confirms it: (x − 3)(x − 9) = 0 gives x = 3 and x = 9.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q33', 'advanced_math',
  '∛(x³y⁶)',
  null,
  'Which of the following expressions is equivalent to the given expression?',
  'medium',
  'A cube root distributed over a product, with one exponent that divides evenly and one that does not look as though it should. A is what a student writes who takes the cube root of y⁶ and loses the x entirely.',
  '[
    {"label":"A","body":"y²"},
    {"label":"B","body":"xy²"},
    {"label":"C","body":"y³"},
    {"label":"D","body":"xy³"}]'::jsonb,
  'B', '∛(x³y⁶) = ∛(x³) · ∛(y⁶) = x · y² = xy². Each exponent is divided by 3. D divides 6 by 2 instead of 3.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q34', 'advanced_math',
  null,
  null,
  'If a = 4k + 5r and b = 7k − 12r + 3, which expression is equivalent to a − b?',
  'medium',
  'Subtracting a three-term expression means distributing the minus sign across all three, and two of the three already carry a negative. The options differ only in the last two signs, so a single lapse is caught.',
  '[
    {"label":"A","body":"−3k + 17r + 3"},
    {"label":"B","body":"−3k + 17r − 3"},
    {"label":"C","body":"−3k − 7r − 3"},
    {"label":"D","body":"−3k − 7r + 3"}]'::jsonb,
  'B', 'a − b = (4k + 5r) − (7k − 12r + 3) = 4k + 5r − 7k + 12r − 3 = −3k + 17r − 3. A leaves the +3 unchanged; C and D fail to flip the −12r.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q35', 'problem_solving_and_data_analysis',
  'Residents of a town were surveyed about satisfaction with a concession stand at a local park. A random sample of 200 residents was selected, all responded, and 87% said they were satisfied.

I. Of all town residents, 87% would say they are satisfied.
II. If another random sample of 200 residents were surveyed, 87% would say they are satisfied.',
  null,
  'Based on this information, which statements must be true?',
  'medium',
  'The sample is random and the response rate perfect, so everything about the design looks reassuring — and neither statement follows anyway. Students who have learned that random sampling makes results trustworthy pick D; the item is asking what "must be true" rules out.',
  '[
    {"label":"A","body":"Neither"},
    {"label":"B","body":"I only"},
    {"label":"C","body":"II only"},
    {"label":"D","body":"I and II"}]'::jsonb,
  'A', 'A sample estimates a population proportion, it does not pin it down: 87% of the sample says nothing that must be true of all residents, so I fails. And a second random sample would almost certainly give a slightly different percentage, so II fails too. Neither must be true.',
  'published', 'evaluating_statistical_claims_observational_studies_and_experiments', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q36', 'geometry_and_trigonometry',
  null,
  null,
  'Triangle FGH is similar to triangle JKL, where angle F corresponds to angle J and angles G and K are right angles. If sin(F) = 308/317, what is the value of sin(J)?',
  'medium',
  'The answer is the given value unchanged, which is the hardest thing to write down when the numbers look as though they want working. A is the cosine — the third side of the 308-317 triangle — and rewards exactly the unnecessary work this item is testing against.',
  '[
    {"label":"A","body":"75/317"},
    {"label":"B","body":"308/317"},
    {"label":"C","body":"317/308"},
    {"label":"D","body":"317/75"}]'::jsonb,
  'B', 'Similar triangles have equal corresponding angles, and the sine of an angle depends only on the angle. Angle J corresponds to angle F, so sin(J) = sin(F) = 308/317. A is cos(F) — the missing leg is √(317² − 308²) = 75 — and C and D are reciprocals.',
  'published', 'right_triangles_and_trigonometry', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q37', 'geometry_and_trigonometry',
  null,
  null,
  'In the figure, AE intersects DB at point C and AB is parallel to DE, creating triangles ABC and CDE. If x = 63 and y = 2x − 47, what is the value of z?',
  'medium',
  'Three facts have to line up in order — evaluate y, carry the angle at A across the parallel lines to E, then use the angle sum. Each intermediate value (63, 79, 47) is also an option, so stopping early is visible.',
  '[
    {"label":"A","body":"38"},
    {"label":"B","body":"47"},
    {"label":"C","body":"63"},
    {"label":"D","body":"79"}]'::jsonb,
  'A', 'y = 2(63) − 47 = 79. Because AB is parallel to DE, angle E equals angle A = y = 79°. In triangle CDE the angles sum to 180, so z = 180 − 63 − 79 = 38. D is y, C is x, and B is the 47 from the stem — every partial answer has somewhere to land.',
  'published', 'lines_angles_and_triangles', 'mathematics', '/question-figures/math-medium-q37.png');

perform seed_bank_item(
  'MATH-MEDIUM-Q38', 'geometry_and_trigonometry',
  null,
  null,
  'The sum of the measures of two angles in a triangle is 64°. What is the measure of the third angle?',
  'medium',
  'One subtraction — but from 180, not 90, and A is the answer waiting for anyone who reaches for 90 instead. The arithmetic is easy and the recall is the whole item.',
  '[
    {"label":"A","body":"26°"},
    {"label":"B","body":"52°"},
    {"label":"C","body":"116°"},
    {"label":"D","body":"128°"}]'::jsonb,
  'C', 'The three angles sum to 180°, so the third is 180 − 64 = 116°. A is 90 − 64, the answer of a student who assumed a right triangle; B is 180 − 2(64) and D is 2(64).',
  'published', 'lines_angles_and_triangles', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q39', 'geometry_and_trigonometry',
  null,
  null,
  'A right circular cylinder has a volume of 45π. If the height of the cylinder is 5, what is the radius of the cylinder?',
  'medium',
  'The formula has to be rearranged and then a square root taken, and it is the square root that separates this from an easy item: C is r² reported as r, which is where a student who does everything else right ends up.',
  '[
    {"label":"A","body":"3"},
    {"label":"B","body":"4.5"},
    {"label":"C","body":"9"},
    {"label":"D","body":"40"}]'::jsonb,
  'A', 'V = πr²h, so 45π = πr²(5) and r² = 9, giving r = 3. C is r² reported as r; B is 45/(2·5), the height divided out and then halved; D is 45 − 5.',
  'published', 'area_and_volume', 'mathematics', null);

perform seed_bank_item(
  'MATH-MEDIUM-Q40', 'geometry_and_trigonometry',
  null,
  null,
  'In right triangle RST, the sum of the measures of angle R and angle S is 90 degrees. The value of sin(R) is √15/4. What is the value of cos(S)?',
  'medium',
  'The cofunction identity gives the answer immediately; without it a student has to build the triangle, find the third side and take a ratio. Both routes arrive, but only one is quick, and the distractors are the rationalised forms that come out of the long route done wrong.',
  '[
    {"label":"A","body":"√15/15"},
    {"label":"B","body":"√15/4"},
    {"label":"C","body":"4√15/15"},
    {"label":"D","body":"√15"}]'::jsonb,
  'B', 'R and S are complementary, and the sine of an angle equals the cosine of its complement: cos(S) = sin(R) = √15/4. A is 1/√15 rationalised and C is 4/√15 rationalised — both the answers of a student who inverted the ratio somewhere in the long route and then tidied the surd.',
  'published', 'right_triangles_and_trigonometry', 'mathematics', null);

end $seedmedium$;

-- =================================================================== HARD ===
--  Questions 41-60.
do $seedhard$
begin

perform seed_bank_item(
  'MATH-HARD-Q41', 'algebra',
  '3x = 36y − 45',
  null,
  'One of the two equations in a system of linear equations is given. The system has no solution. Which equation could be the second equation in this system?',
  'hard',
  'No solution means equal slopes and different intercepts, and every option is written in a form that hides its slope. The student has to normalise four equations before comparing any of them, and C is the same line — a solution set, not an empty one.',
  '[
    {"label":"A","body":"x = 4y"},
    {"label":"B","body":"(1/3)x = 4y"},
    {"label":"C","body":"x = 12y − 15"},
    {"label":"D","body":"(1/3)x = 12y − 15"}]'::jsonb,
  'B', 'The given equation is x = 12y − 15, so its slope in this form is 12 with intercept −15. B, (1/3)x = 4y, becomes x = 12y: same slope, different intercept, so the lines are parallel and the system has no solution. C is the given equation itself, which has infinitely many solutions rather than none; A becomes x = 4y, a different slope, so it meets the first line once.',
  'published', 'systems_of_two_linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q42', 'algebra',
  null,
  null,
  'The graph of the equation ax + ky = 6 is a line in the xy-plane, where a and k are constants. If the line contains the points (−2, −6) and (0, −3), what is the value of k?',
  'hard',
  'Two unknown coefficients and two points, but only one of the points is needed if the student notices that (0, −3) kills the ax term outright. A student who sets up the full system spends four times as long and has four times the chances to slip.',
  '[
    {"label":"A","body":"−2"},
    {"label":"B","body":"−1"},
    {"label":"C","body":"2"},
    {"label":"D","body":"3"}]'::jsonb,
  'A', 'Substituting (0, −3): a(0) + k(−3) = 6, so −3k = 6 and k = −2. The other point then gives a = 3, but it is not needed. C is the magnitude with the sign lost, which is what comes of dividing 6 by 3 and stopping.',
  'published', 'linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q43', 'algebra',
  null,
  null,
  'A window repair specialist charges $220 for the first two hours of repair plus an hourly fee for each additional hour. The total cost for 5 hours of repair is $400. Which function f gives the total cost, in dollars, for x hours of repair, where x ≥ 2?',
  'hard',
  'The flat $220 covers the first two hours, so the hourly rate applies to x − 2 and the constant in the final function is not $220. B is the answer of every student who reads "plus an hourly fee" as a straight slope-intercept sentence, and it is the majority answer on items of this shape.',
  '[
    {"label":"A","body":"f(x) = 60x + 100"},
    {"label":"B","body":"f(x) = 60x + 220"},
    {"label":"C","body":"f(x) = 80x"},
    {"label":"D","body":"f(x) = 80x + 220"}]'::jsonb,
  'A', 'Three additional hours cost 400 − 220 = 180, so the hourly fee is $60. Then f(x) = 220 + 60(x − 2) = 60x + 100. B keeps the 220 as the intercept without subtracting the two hours already paid for; C is 400/5 used as a flat rate.',
  'published', 'linear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q44', 'algebra',
  null,
  null,
  'Hector used a tool called an auger to remove corn from a storage bin at a constant rate. The bin contained 24,000 bushels of corn when Hector began to use the auger. After 5 hours of using the auger, 19,350 bushels of corn remained in the bin. If the auger continues to remove corn at this rate, what is the total number of hours Hector will have been using the auger when 12,840 bushels of corn remain in the bin?',
  'hard',
  'Two stages — find the rate, then solve for the time — with awkward numbers at both. And the question asks for the total hours, not the additional hours: B is the additional time after the first five, which is the answer a student gives who solves the second stage in isolation.',
  '[
    {"label":"A","body":"3"},
    {"label":"B","body":"7"},
    {"label":"C","body":"8"},
    {"label":"D","body":"12"}]'::jsonb,
  'D', 'The rate is (24,000 − 19,350)/5 = 930 bushels per hour. Setting 24,000 − 930t = 12,840 gives 930t = 11,160 and t = 12 hours in total. B is 12 − 5, the hours still to come rather than the total asked for.',
  'published', 'linear_equations_in_one_variable', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q45', 'algebra',
  'x | y
18 | 130
23 | 160
26 | 178',
  null,
  'Line k is the result of translating line h down 5 units in the xy-plane. What is the x-intercept of line k?',
  'hard',
  'Four steps, each of which must survive to the next: slope from the table, the equation of h, the translation, then an x-intercept that is not an integer. Every option is a plausible fraction, so there is nothing to check the answer against at the end.',
  '[
    {"label":"A","body":"(−26/3, 0)"},
    {"label":"B","body":"(−9/2, 0)"},
    {"label":"C","body":"(−11/3, 0)"},
    {"label":"D","body":"(−17/6, 0)"}]'::jsonb,
  'D', 'Slope of h: (160 − 130)/(23 − 18) = 6. Using (18, 130): y = 130 + 6(x − 18) = 6x + 22. Translating down 5 gives k: y = 6x + 17. Setting y = 0, x = −17/6. C is −11/3, the x-intercept of h itself — the answer of a student who found the intercept and then never applied the translation.',
  'published', 'linear_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q46', 'advanced_math',
  null,
  null,
  'How many times does the graph of the given equation in the xy-plane cross the x-axis, where a, b, and c are positive constants such that a > 7 and b > c?',
  'hard',
  'Nothing here can be computed — the constants stay constants. The student has to reason about an exponential''s shape from the conditions given: which way it runs, where its asymptote sits, and whether the curve gets below it. That is the top of this section.',
  '[
    {"label":"A","body":"Zero"},
    {"label":"B","body":"One"},
    {"label":"C","body":"Two"},
    {"label":"D","body":"Three"}]'::jsonb,
  'B', 'Since a > 7, the base a/7 exceeds 1, so 9(a/7)^(x+c) is a positive increasing function of x. Subtracting b shifts it down, giving a horizontal asymptote at y = −b, which is below the x-axis because b is positive. So the curve runs from just above −b up through every large positive value, increasing the whole way — it meets y = 0 exactly once.',
  'published', 'nonlinear_functions', 'mathematics', '/question-figures/math-hard-q46.png');

perform seed_bank_item(
  'MATH-HARD-Q47', 'advanced_math',
  'x | g(x)
−27 | 3
−9 | 0
21 | 5',
  null,
  'The function g is defined by g(x) = f(x)/(x + 3), where f is a linear function. The table shows three values of x and their corresponding values of g(x). What is the y-intercept of the graph of y = f(x) in the xy-plane?',
  'hard',
  'The table describes g and the question asks about f, so the first move is to turn every row into a point on f — and that move is invisible until the student writes f(x) = g(x)(x + 3). Everything after it is a straight line through two points.',
  '[
    {"label":"A","body":"(0, 36)"},
    {"label":"B","body":"(0, 12)"},
    {"label":"C","body":"(0, 4)"},
    {"label":"D","body":"(0, −9)"}]'::jsonb,
  'A', 'f(x) = g(x)(x + 3). The rows give f(−27) = 3(−24) = −72, f(−9) = 0(−6) = 0 and f(21) = 5(24) = 120. Through (−9, 0) and (21, 120) the slope is 120/30 = 4, so f(x) = 4(x + 9) = 4x + 36 — and f(−27) = −72 checks out. The y-intercept is (0, 36). C is the slope read as an intercept; D is the x-intercept.',
  'published', 'nonlinear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q48', 'advanced_math',
  'h(x) = 2(x − 4)² − 32',
  null,
  'The quadratic function h is defined as shown. In the xy-plane, the graph of y = h(x) intersects the x-axis at the points (0, 0) and (t, 0), where t is a constant. What is the value of t?',
  'hard',
  'Vertex form is given but the question is about roots, so the student either expands or uses the symmetry of the parabola about x = 4. C is the vertex''s x-coordinate, which is what a student reports who reads the 4 out of the bracket and stops.',
  '[
    {"label":"A","body":"1"},
    {"label":"B","body":"2"},
    {"label":"C","body":"4"},
    {"label":"D","body":"8"}]'::jsonb,
  'D', 'h(x) = 2(x − 4)² − 32 = 2x² − 16x = 2x(x − 8), so the roots are x = 0 and x = 8, giving t = 8. Equivalently the vertex is at x = 4 and the roots sit symmetrically either side of it, so one root at 0 forces the other at 8. C is the vertex''s x-coordinate itself.',
  'published', 'nonlinear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q49', 'advanced_math',
  'x² − 2x − 9 = 0',
  null,
  'One solution to the given equation can be written as 1 + √k, where k is a constant. What is the value of k?',
  'hard',
  'The quadratic formula gives 1 ± √10 only if the 2√10/2 is simplified correctly; C is that same answer with the division by 2 forgotten, and D is the raw discriminant. Three of the four options are stages of the correct working.',
  '[
    {"label":"A","body":"8"},
    {"label":"B","body":"10"},
    {"label":"C","body":"20"},
    {"label":"D","body":"40"}]'::jsonb,
  'B', 'By the quadratic formula, x = (2 ± √(4 + 36))/2 = (2 ± √40)/2 = (2 ± 2√10)/2 = 1 ± √10. So k = 10. D is the discriminant 40, reported before the root is simplified; C is 40/2, the division by 2 applied to the discriminant instead of to the whole numerator.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q50', 'advanced_math',
  '(ax + 3)(5x² − bx + 4) = 20x³ − 9x² − 2x + 12',
  null,
  'The given equation is true for all x, where a and b are constants. What is the value of ab?',
  'hard',
  'Two unknowns, and they have to be found from two different coefficients of the expanded cubic. The x³ term gives a at once; b only comes out of the x² or x coefficient, which means expanding a product the student may hope to avoid.',
  '[
    {"label":"A","body":"18"},
    {"label":"B","body":"20"},
    {"label":"C","body":"24"},
    {"label":"D","body":"40"}]'::jsonb,
  'C', 'Expanding, the x³ coefficient is 5a, and it equals 20, so a = 4. The x² coefficient is −ab + 15, and it equals −9, so ab = 24. (Then b = 6, and the x coefficient checks: 4a − 3b = 16 − 18 = −2.) B is the 20 from the x³ coefficient carried over as though it were ab.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q51', 'problem_solving_and_data_analysis',
  null,
  null,
  'The expression 0.35x represents the result of decreasing a positive quantity x by what percent?',
  'hard',
  'The multiplier is what remains, not what was taken, and B is the answer of anyone who reads the 0.35 straight off. It is the single most reliable percentage misconception on the test, and it is worth a hard slot for that reason alone.',
  '[
    {"label":"A","body":"3.5%"},
    {"label":"B","body":"35%"},
    {"label":"C","body":"6.5%"},
    {"label":"D","body":"65%"}]'::jsonb,
  'D', '0.35x = x − 0.65x, so the quantity has been decreased by 65%. B reads the multiplier as the decrease, which would be right for an increase of 35% written as 1.35x.',
  'published', 'percentages', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q52', 'problem_solving_and_data_analysis',
  null,
  null,
  'The box plots summarize the masses, in kilograms, of two groups of gazelles. Based on the box plots, which of the following statements must be true?',
  'hard',
  'A box plot shows the median and shows nothing at all about the mean, so half the options cannot be settled from the figure however carefully it is read. Knowing which statistic a display cannot support is the skill, and it is harder than reading the display.',
  '[
    {"label":"A","body":"The mean mass of group 1 is greater than the mean mass of group 2."},
    {"label":"B","body":"The mean mass of group 1 is less than the mean mass of group 2."},
    {"label":"C","body":"The median mass of group 1 is greater than the median mass of group 2."},
    {"label":"D","body":"The median mass of group 1 is less than the median mass of group 2."}]'::jsonb,
  'C', 'The line inside each box is the median: 25 for group 1 and 24 for group 2, so group 1''s median is the greater — C. A box plot gives five summary values and no individual masses, so neither mean can be determined from it, which rules out A and B whatever they claim.',
  'published', 'one_variable_data_distributions_and_measures_of_center_and_spread', 'mathematics', '/question-figures/math-hard-q52.png');

perform seed_bank_item(
  'MATH-HARD-Q53', 'problem_solving_and_data_analysis',
  'The histogram summarizes data set A, which represents the number of points per player earned by 50 players of a game. A new player earns 18 points playing the game, and this number of points is added to data set A to create data set B with 51 values.

I. The median number of points per player for data set B is less than the median number of points per player for data set A.
II. The mean number of points per player for data set B is less than the mean number of points per player for data set A.',
  null,
  'Which of the following must be true?',
  'hard',
  'The mean clearly falls; the median is the trap, because "adding a small value pulls everything down" is true of the mean and only sometimes true of the median. Seeing that both the 25th and 26th values of A already sit in the same bin — so the median may not move at all — is genuinely hard.',
  '[
    {"label":"A","body":"I only"},
    {"label":"B","body":"II only"},
    {"label":"C","body":"I and II"},
    {"label":"D","body":"Neither I nor II"}]'::jsonb,
  'B', 'Every value in A is at least 30, so adding 18 drags the mean down: II is true. The median is a different matter. A has 50 values, so its median is the average of the 25th and 26th; B has 51, so its median is the 26th value of B, which is the 25th of A. Both the 25th and 26th values of A fall in the 50–60 bin, so they may be equal, in which case the median does not change. I need not be true.',
  'published', 'one_variable_data_distributions_and_measures_of_center_and_spread', 'mathematics', '/question-figures/math-hard-q53.png');

perform seed_bank_item(
  'MATH-HARD-Q54', 'problem_solving_and_data_analysis',
  null,
  null,
  'A sample of 40 fourth-grade students was selected at random from a certain school. The 40 students completed a survey about the morning announcements, and 32 thought the announcements were helpful. Which of the following is the largest population to which the results of the survey can be applied?',
  'hard',
  'The word doing the work is "largest": A is safe and wrong, C and D overreach. The student has to identify the population the sample was actually drawn from and then resist both the cautious answer and the ambitious one.',
  '[
    {"label":"A","body":"The 40 students who were surveyed"},
    {"label":"B","body":"All fourth-grade students at the school"},
    {"label":"C","body":"All students at the school"},
    {"label":"D","body":"All fourth-grade students in the county in which the school is located"}]'::jsonb,
  'B', 'The sample was drawn at random from the fourth-grade students at that school, so that is the population the results generalise to — and the question asks for the largest such population, which rules out A. C and D include students the sample was never drawn from: nothing here was randomly selected from the whole school or from the county.',
  'published', 'evaluating_statistical_claims_observational_studies_and_experiments', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q55', 'problem_solving_and_data_analysis',
  null,
  null,
  'The positive number a is 2,241% of the sum of the positive numbers b and c, and b is 83% of c. What percent of b is a?',
  'hard',
  'Two chained percentages, one of them far over 100%, and an answer that is itself over 100% — so the sense-check a student would normally run on the size of an answer offers no help here. The options come in two pairs a hundred apart, so converting the multiplier to a percentage at the wrong moment lands on a wrong option rather than on something obviously absurd.',
  '[
    {"label":"A","body":"23.24%"},
    {"label":"B","body":"49.41%"},
    {"label":"C","body":"2,324%"},
    {"label":"D","body":"4,941%"}]'::jsonb,
  'D', 'Write c in terms of b: b = 0.83c, so c = b/0.83. Then b + c = b(1 + 1/0.83) ≈ 2.2048b, and a = 22.41(b + c) ≈ 22.41 × 2.2048b ≈ 49.41b. So a is about 4,941% of b. B is the multiplier 49.41 read as a percentage.',
  'published', 'percentages', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q56', 'geometry_and_trigonometry',
  null,
  null,
  'In triangle XYZ, angle Z is a right angle and the length of YZ is 24 units. If tan X = 12/35, what is the perimeter, in units, of triangle XYZ?',
  'hard',
  'The tangent gives a ratio, not the sides, so the student has to recognise 12-35-37, scale it by the one real length given, and only then add. A student who adds 12 + 35 + 37 and stops gets 84, which is on the list.',
  '[
    {"label":"A","body":"188"},
    {"label":"B","body":"168"},
    {"label":"C","body":"84"},
    {"label":"D","body":"71"}]'::jsonb,
  'B', 'tan X = YZ/XZ = 12/35, and YZ = 24, so the triangle is the 12-35-37 right triangle scaled by 2: YZ = 24, XZ = 70, XY = 74. The perimeter is 24 + 70 + 74 = 168. C is the unscaled perimeter 12 + 35 + 37 = 84; D is 12 + 24 + 35.',
  'published', 'right_triangles_and_trigonometry', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q57', 'geometry_and_trigonometry',
  null,
  null,
  'The circumference of the base of a right circular cylinder is 20π meters, and the height of the cylinder is 6 meters. What is the volume, in cubic meters, of the cylinder?',
  'hard',
  'The radius is not given, it is hidden in a circumference — and a student who takes 20π for the radius rather than for 2πr gets 2,400π, which is sitting on the list. The formulas are routine; the extraction is not.',
  '[
    {"label":"A","body":"60π"},
    {"label":"B","body":"120π"},
    {"label":"C","body":"600π"},
    {"label":"D","body":"2,400π"}]'::jsonb,
  'C', 'C = 2πr = 20π gives r = 10. Then V = πr²h = π(100)(6) = 600π cubic meters. D uses r = 20 rather than 10; B is the circumference times the height, which is the cylinder''s curved surface area and not its volume.',
  'published', 'area_and_volume', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q58', 'geometry_and_trigonometry',
  null,
  null,
  'In triangle ABC, the measure of angle A is 52° and AC = 30. In triangle PQR, the measure of angle P is 52° and PR = 120. Which additional piece of information is sufficient to prove that triangle ABC is similar to triangle PQR?',
  'hard',
  'Every option looks like evidence, and the student has to test each against a similarity criterion rather than against intuition. C is the only one that yields a second pair of equal angles, and it does so indirectly — through the angle sum, not by matching labels.',
  '[
    {"label":"A","body":"AB = 50 and PQ = 50."},
    {"label":"B","body":"AB = 50 and QR = 200."},
    {"label":"C","body":"The measures of angle B and angle R are 32° and 96°, respectively."},
    {"label":"D","body":"The measures of angle B and angle Q are 52° and 32°, respectively."}]'::jsonb,
  'C', 'In triangle PQR, angle P = 52° and angle R = 96°, so angle Q = 180 − 52 − 96 = 32°. That equals angle B, so the triangles share two pairs of equal angles and are similar by AA. A gives sides with no ratio to AC and PR that matches; B pairs AB with QR, which are not corresponding sides; D makes angle B = 52° and angle Q = 32°, and B does not correspond to Q.',
  'published', 'lines_angles_and_triangles', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q59', 'geometry_and_trigonometry',
  null,
  null,
  'A cube has an edge length of 68 inches. A solid sphere with a radius of 34 inches is inside the cube, such that the sphere touches the center of each face of the cube. To the nearest cubic inch, what is the volume of the space in the cube not taken up by the sphere?',
  'hard',
  'Two volume formulas, a subtraction, and six-figure arithmetic that has to be carried to the nearest cubic inch — with B sitting close to the sphere''s own volume, so a student who works the sphere out and forgets that the question asked for what is left around it finds an answer waiting.',
  '[
    {"label":"A","body":"149,796"},
    {"label":"B","body":"164,500"},
    {"label":"C","body":"190,955"},
    {"label":"D","body":"310,800"}]'::jsonb,
  'A', 'Cube: 68³ = 314,432. Sphere: (4/3)π(34³) = (4/3)π(39,304) ≈ 164,636. The space left is 314,432 − 164,636 ≈ 149,796 cubic inches. B is roughly the sphere''s volume rather than the space around it.',
  'published', 'area_and_volume', 'mathematics', null);

perform seed_bank_item(
  'MATH-HARD-Q60', 'geometry_and_trigonometry',
  null,
  null,
  'The perimeter of an isosceles right triangle is 18 + 18√2 inches. What is the length, in inches, of the hypotenuse of this triangle?',
  'hard',
  'The perimeter is written in a form that invites the student to match 18 to the legs and 18√2 to the hypotenuse — and that reading is wrong. Factoring the perimeter as 18(1 + √2) and comparing it with h(1 + √2) is the move, and it is not one most students have rehearsed.',
  '[
    {"label":"A","body":"9"},
    {"label":"B","body":"9√2"},
    {"label":"C","body":"18"},
    {"label":"D","body":"18√2"}]'::jsonb,
  'C', 'For an isosceles right triangle with hypotenuse h, each leg is h/√2, so the perimeter is 2(h/√2) + h = h√2 + h = h(1 + √2). Setting h(1 + √2) = 18 + 18√2 = 18(1 + √2) gives h = 18. D matches the 18√2 term to the hypotenuse directly, which is the reading the question is built on; A and B halve the 18 and the 18√2.',
  'published', 'right_triangles_and_trigonometry', 'mathematics', null);

end $seedhard$;

-- ------------------------------------------------------------ the three tests ----
--  The sets themselves already exist: 0040 created them, empty, with these
--  source_refs.  These calls find them by that ref and fill them, so the ids
--  0040 minted are the ids the sessions keep using.  The order is the
--  document's own.
do $tests$
begin
  perform seed_level_test('easy', 'Mathematics — Easy',
    'Where every mathematics session starts.',
    array['MATH-EASY-Q01',
      'MATH-EASY-Q02',
      'MATH-EASY-Q03',
      'MATH-EASY-Q04',
      'MATH-EASY-Q05',
      'MATH-EASY-Q06',
      'MATH-EASY-Q07',
      'MATH-EASY-Q08',
      'MATH-EASY-Q09',
      'MATH-EASY-Q10',
      'MATH-EASY-Q11',
      'MATH-EASY-Q12',
      'MATH-EASY-Q13',
      'MATH-EASY-Q14',
      'MATH-EASY-Q15',
      'MATH-EASY-Q16',
      'MATH-EASY-Q17',
      'MATH-EASY-Q18',
      'MATH-EASY-Q19',
      'MATH-EASY-Q20'],
    'mathematics');

  perform seed_level_test('medium', 'Mathematics — Medium',
    'A step up from the easy test.',
    array['MATH-MEDIUM-Q21',
      'MATH-MEDIUM-Q22',
      'MATH-MEDIUM-Q23',
      'MATH-MEDIUM-Q24',
      'MATH-MEDIUM-Q25',
      'MATH-MEDIUM-Q26',
      'MATH-MEDIUM-Q27',
      'MATH-MEDIUM-Q28',
      'MATH-MEDIUM-Q29',
      'MATH-MEDIUM-Q30',
      'MATH-MEDIUM-Q31',
      'MATH-MEDIUM-Q32',
      'MATH-MEDIUM-Q33',
      'MATH-MEDIUM-Q34',
      'MATH-MEDIUM-Q35',
      'MATH-MEDIUM-Q36',
      'MATH-MEDIUM-Q37',
      'MATH-MEDIUM-Q38',
      'MATH-MEDIUM-Q39',
      'MATH-MEDIUM-Q40'],
    'mathematics');

  perform seed_level_test('hard', 'Mathematics — Hard',
    'The hardest of the three.',
    array['MATH-HARD-Q41',
      'MATH-HARD-Q42',
      'MATH-HARD-Q43',
      'MATH-HARD-Q44',
      'MATH-HARD-Q45',
      'MATH-HARD-Q46',
      'MATH-HARD-Q47',
      'MATH-HARD-Q48',
      'MATH-HARD-Q49',
      'MATH-HARD-Q50',
      'MATH-HARD-Q51',
      'MATH-HARD-Q52',
      'MATH-HARD-Q53',
      'MATH-HARD-Q54',
      'MATH-HARD-Q55',
      'MATH-HARD-Q56',
      'MATH-HARD-Q57',
      'MATH-HARD-Q58',
      'MATH-HARD-Q59',
      'MATH-HARD-Q60'],
    'mathematics');
end $tests$;

-- ---------------------------------------------------------------- checks ----
--  0040's invariant, restated: every question in the bank is either in a live
--  test or retired.  And 0029's, which is true again now that all six tests
--  are full — six twenties, the sixty English and the sixty loaded here.
do $check$
declare
  v_stray int;
  v_bad   text;
  v_figs  int;
begin
  select count(*) into v_stray
    from questions q
   where q.status <> 'retired'
     and not exists (
           select 1 from question_set_items qi
             join question_sets qs on qs.id = qi.set_id
            where qi.question_id = q.id and qs.level is not null and qs.is_active);
  if v_stray > 0 then
    raise warning '% question(s) are in no live test and are not retired', v_stray;
  end if;

  select string_agg(format('%s %s has %s', subject, level, n), ', ' order by subject, level)
    into v_bad
    from (
      select qs.subject, qs.level, count(*) as n
        from question_sets qs
        join question_set_items qi on qi.set_id = qs.id
       where qs.level is not null and qs.is_active
       group by qs.subject, qs.level
      having count(*) <> 20
    ) bad;
  if v_bad is not null then
    raise warning 'a level test is not twenty questions: %', v_bad;
  end if;

  -- Every figure this migration references has to be a file the app ships.
  -- The database cannot check that the file exists, so it checks the shape:
  -- anything not under /question-figures/ is a path that was meant to be a
  -- bucket URL and got half-written.
  select count(*) into v_figs
    from questions
   where subject = 'mathematics' and source_ref like 'MATH-%'
     and image_url is not null and image_url not like '/question-figures/%';
  if v_figs > 0 then
    raise exception '% mathematics figure(s) do not point into /question-figures/', v_figs;
  end if;

  raise notice 'mathematics: % items in three tests, % of them with a figure',
    (select count(*) from questions where subject = 'mathematics' and source_ref like 'MATH-%'),
    (select count(*) from questions where subject = 'mathematics' and source_ref like 'MATH-%' and image_url is not null);
end $check$;
