-- ============================================================================
--  0008 — the English (Reading & Writing) diagnostic, loaded into the bank
--
--  Source: "SAT Diagnostic Test (Reading and Writing - 25Q)", the in-class
--  paper the teachers run in the first session.  Unlike the screenshot decks
--  audited in docs/reference/source-material-audit.md, this one is real text
--  with an answer key at the back, so every item goes in fully structured:
--  passage, stem, four options, correct option, section and difficulty.
--
--  Three things the bank needed before it could hold them:
--
--    created_by   these are house content, not one teacher's authoring.  It
--                 becomes nullable, and a null author means "the bank's" —
--                 which any teacher may correct, per the policies below.
--    source_ref   where an item came from, so a re-import updates the item it
--                 already loaded instead of duplicating it.
--    underline    Q3 and Q25 ask about one specific sentence, underlined in
--                 the paper.  Without the span the question is unanswerable.
--
--  Seven of the keys printed at the back of the paper disagree with their own
--  passage (Q08 subtracts to 13, not 15; Q22 puts a comma between a subject and
--  its verb; and five more).  Those are keyed to what the text supports, not to
--  what the paper printed, and every change is listed with its reasoning in
--  docs/reference/english-diagnostic-key-review.md so the teachers can see what
--  was altered and why.
-- ============================================================================

alter table questions alter column created_by drop not null;

alter table questions add column if not exists source_ref text;
alter table questions add column if not exists passage_underline text;

comment on column questions.created_by is
  'Null for house content loaded from a source paper; set for teacher-authored questions.';
comment on column questions.source_ref is
  'Stable reference to where the item came from, e.g. ENG-DIAG-INCLASS-Q01. Unique.';
comment on column questions.passage_underline is
  'Exact substring of passage the stem refers to as "the underlined sentence".';

create unique index if not exists questions_source_ref_idx on questions (source_ref)
  where source_ref is not null;

-- ------------------------------------------------------------------ RLS ----
-- The author-write policies match on created_by = auth.uid(), which is false
-- for a null author — so without these, nobody could ever fix a house item.
-- Any teacher may edit house content; teacher-authored rows stay with their
-- author.
drop policy if exists questions_house_write on questions;
create policy questions_house_write on questions
  for all using (is_teacher() and created_by is null)
  with check (is_teacher() and created_by is null);

drop policy if exists options_house_write on question_options;
create policy options_house_write on question_options
  for all using (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by is null and is_teacher())
  ) with check (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by is null and is_teacher())
  );

drop policy if exists keys_house_write on question_keys;
create policy keys_house_write on question_keys
  for all using (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by is null and is_teacher())
  ) with check (
    exists (select 1 from questions q
            where q.id = question_id and q.created_by is null and is_teacher())
  );

-- ---------------------------------------------------------------- loader ----
-- A loader rather than 25 hand-written INSERT triples: keyed on source_ref, so
-- running it again updates the item in place and never orphans a session that
-- already used it.  It stays in the schema because every later paper is loaded
-- the same way (0009 loads 40 more with it), but only the migration role may
-- call it — it writes house content, which is not something a signed-in
-- teacher should be able to do in bulk from the client.
create or replace function public.seed_bank_item(
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
  p_status      question_status default 'published'
) returns uuid
language plpgsql
as $fn$
declare
  qid uuid;
begin
  insert into questions (
    created_by, subject, section, passage, passage_underline, stem,
    difficulty, difficulty_rationale, status, source_ref
  ) values (
    null, 'english', p_section, p_passage, p_underline, p_stem,
    p_difficulty, p_rationale, p_status, p_source_ref
  )
  -- Partial index, so the predicate has to be repeated for inference.
  on conflict (source_ref) where source_ref is not null do update set
    section              = excluded.section,
    passage              = excluded.passage,
    passage_underline    = excluded.passage_underline,
    stem                 = excluded.stem,
    difficulty           = excluded.difficulty,
    difficulty_rationale = excluded.difficulty_rationale,
    status               = excluded.status
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
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status
) from anon, authenticated;

comment on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text, question_status
) is 'Upserts one house question by source_ref, with its options and key. Used by the paper-loading migrations.';

-- ---------------------------------------------- Passage 1 · urban reform ----
-- Q1–Q5 share one stimulus; the paper prints it once, the bank stores it per
-- item so a question is always self-contained when it lands on a student's
-- screen.
do $seed$
declare
  p1 text := 'In the late 19th century, urban reformers sought to address the overcrowded and unsanitary living conditions in rapidly expanding cities. They promoted the development of public parks, improved sewage systems, and access to clean water. Their work laid the foundation for many modern urban planning practices.';
  u1 text := 'They promoted the development of public parks, improved sewage systems, and access to clean water.';
  p2 text := 'A study found that students who sleep at least 8 hours before a test score, on average, 10 points higher than those who sleep less. The chart shows average test scores based on hours of sleep.

Hours slept | Average score
5 | 72
6 | 74
7 | 78
8 | 82
9 | 85';
  p3 text := '"Her laughter was a sudden spark in the silence, a reminder that joy, even fragile, could survive in the darkest moments."';
  p4 text := 'Some argue that technology isolates people. However, it can also foster connections across the globe, allowing individuals to collaborate, share ideas, and support each other in ways that were once impossible.';
begin

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q01', 'information_and_ideas', p1, null,
  'According to the text, which choice best states the main idea of the text?',
  'easy', 'The main idea is stated outright in the first sentence; no inference is needed.',
  '[{"label":"A","body":"Reformers were primarily concerned with preserving green spaces."},
    {"label":"B","body":"Reformers sought to improve living conditions in cities."},
    {"label":"C","body":"Urban expansion slowed in the late 19th century."},
    {"label":"D","body":"Modern city planning eliminated overcrowding."}]'::jsonb,
  'B', 'The opening sentence says reformers "sought to address the overcrowded and unsanitary living conditions" — that is the main idea. A takes one item from the list of measures and treats it as the whole aim; C contradicts "rapidly expanding cities"; D claims an outcome the text never reaches.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q02', 'information_and_ideas', p1, null,
  'According to the text, which detail best supports the central idea?',
  'easy', 'Only one option is a measure the reformers took; the other three are background phrases.',
  '[{"label":"A","body":"“improved sewage systems”"},
    {"label":"B","body":"“rapidly expanding cities”"},
    {"label":"C","body":"“late 19th century”"},
    {"label":"D","body":"“modern urban planning practices”"}]'::jsonb,
  'A', 'The central idea is that reformers improved living conditions, so the supporting detail has to be one of the improvements they made. B and C set the scene, and D is the later legacy rather than the work itself.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q03', 'craft_and_structure', p1, u1,
  'According to the text, which choice best describes the function of the underlined sentence in the text as a whole?',
  'medium', 'Asks what a sentence does rather than what it says — the student has to read the sentence against the one before it.',
  '[{"label":"A","body":"It portrays the lack of public transportation."},
    {"label":"B","body":"It states the solutions the reformers were providing to the problems in the city."},
    {"label":"C","body":"It demonstrates the decline of industrial growth."},
    {"label":"D","body":"It elaborates on the conditions of expanding cities."}]'::jsonb,
  'B', 'Sentence one names the problem, the underlined sentence answers it with parks, sewers and clean water. D is the trap: it describes the sentence before the underlined one, not the underlined one.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q04', 'information_and_ideas', p1, null,
  'According to the text, what best summarizes the passage?',
  'easy', 'A summary question over three short sentences, with two options contradicted outright.',
  '[{"label":"A","body":"19th-century reformers made little progress in improving cities."},
    {"label":"B","body":"Public health and city design were influenced by reformers’ efforts."},
    {"label":"C","body":"Sewage systems were the reformers’ only concern."},
    {"label":"D","body":"Overcrowding ended with modern reforms."}]'::jsonb,
  'B', 'A summary has to cover both what the reformers did (sanitation, water, parks) and what it led to (modern planning). A contradicts the last sentence, C says "only" where the text lists three measures, and D claims an end to overcrowding the text never mentions.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q05', 'information_and_ideas', p1, null,
  'According to the text, what lasting effect did reformers have?',
  'easy', 'The answer is the final sentence, restated.',
  '[{"label":"A","body":"Ending urban overcrowding"},
    {"label":"B","body":"Preventing the spread of disease permanently"},
    {"label":"C","body":"Establishing principles of city planning still used today"},
    {"label":"D","body":"Creating new forms of industry"}]'::jsonb,
  'C', '"Their work laid the foundation for many modern urban planning practices" is the lasting effect. The other three overstate the result or introduce an outcome the text does not claim.');

-- ------------------------------------------------- Passage 2 · the table ----
perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q06', 'information_and_ideas', p2, null,
  'Which choice best describes the data in the table that supports the claim?',
  'easy', 'The table rises monotonically, so the trend can be read straight off it.',
  '[{"label":"A","body":"More sleep is associated with higher test scores."},
    {"label":"B","body":"Students who sleep less are more motivated."},
    {"label":"C","body":"Sleep has no effect on test performance."},
    {"label":"D","body":"Test scores peak at 7 hours of sleep."}]'::jsonb,
  'A', 'Every extra hour of sleep in the table comes with a higher average score, 72 up to 85. D is the common misread — 7 hours is a middle row, not a peak.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q07', 'information_and_ideas', p2, null,
  'Which evidence supports your answer to the previous question?',
  'medium', 'A two-step item: the student has to hold the previous answer and then find what backs it.',
  '[{"label":"A","body":"“score, on average, 10 points higher”"},
    {"label":"B","body":"“before a test”"},
    {"label":"C","body":"“students who sleep less”"},
    {"label":"D","body":"“chart shows average test scores”"}]'::jsonb,
  'A', 'Only A states a measured difference in scores. B, C and D quote setup — when the test was taken, who the group is, what the chart holds — none of which is evidence of an effect.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q08', 'information_and_ideas', p2, null,
  'Based on the table, how much higher do students who sleep 9 hours score compared to those who sleep 5?',
  'easy', 'One subtraction read off two rows of the table.',
  '[{"label":"A","body":"8 points"},
    {"label":"B","body":"10 points"},
    {"label":"C","body":"13 points"},
    {"label":"D","body":"15 points"}]'::jsonb,
  'C', 'The table gives 85 at 9 hours and 72 at 5, and 85 - 72 = 13. There is no reading of the table that produces 15 — a student choosing D has almost always subtracted a neighbouring row.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q09', 'information_and_ideas', p2, null,
  'Based on the table, what conclusion can be drawn?',
  'easy', 'Restates the trend as a conclusion; the distractors go beyond the data in obvious ways.',
  '[{"label":"A","body":"More than 9 hours of sleep lowers scores."},
    {"label":"B","body":"Sleeping longer tends to improve performance."},
    {"label":"C","body":"Students who sleep 5 hours work harder."},
    {"label":"D","body":"Test scores are unrelated to sleep."}]'::jsonb,
  'B', 'The table only runs to 9 hours, so A is about data that is not there. C invents a motive, D denies the pattern. B is the trend the five rows actually show.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q10', 'information_and_ideas', p2, null,
  'Which statement is best supported by both the text and the chart?',
  'medium', 'Has to hold for both sources at once — a claim true of only one of them is wrong.',
  '[{"label":"A","body":"7 hours is the optimal sleep time for students."},
    {"label":"B","body":"Students benefit from at least 8 hours of sleep."},
    {"label":"C","body":"Sleep is unrelated to academic performance."},
    {"label":"D","body":"Lack of sleep only impacts certain students."}]'::jsonb,
  'B', 'The text names 8 hours as the threshold and the table shows 8 and 9 hours scoring highest, so B is the one claim both support. A picks a row neither source singles out.');

-- -------------------------------------------- Passage 3 · the literary line ----
perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q11', 'craft_and_structure', p3, null,
  'As used in the text, what does "fragile" most nearly mean?',
  'medium', 'A words-in-context item on a figurative use, where more than one option is a dictionary sense of the word.',
  '[{"label":"A","body":"Weak"},
    {"label":"B","body":"Temporary"},
    {"label":"C","body":"Precious"},
    {"label":"D","body":"Breakable"}]'::jsonb,
  'D', '"Fragile" means easily broken, and the sentence uses it of a joy that only just survives — delicate, not sturdy. "Precious" is what the line implies about joy, not what the word means; a words-in-context answer has to be a meaning the word actually carries.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q12', 'craft_and_structure', p3, null,
  'Which choice best describes the overall structure of the text?',
  'medium', 'One sentence to analyse, but the student has to see the contrast between "spark" and "darkest moments".',
  '[{"label":"A","body":"To describe an event without emotional tone"},
    {"label":"B","body":"To show how silence is more powerful than joy"},
    {"label":"C","body":"To suggest joy can exist even in hardship"},
    {"label":"D","body":"To contrast laughter with anger"}]'::jsonb,
  'C', 'The line sets a spark of laughter against silence and darkness to say joy survives them. A ignores the emotional language, B reverses which side wins, and anger never appears.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q13', 'craft_and_structure', p3, null,
  'If paired with a passage about resilience, what would this passage most likely emphasize?',
  'medium', 'A cross-text item: the student has to carry this line into a second, hypothetical text.',
  '[{"label":"A","body":"Resilience depends on silence."},
    {"label":"B","body":"Even small joys can symbolize resilience."},
    {"label":"C","body":"Resilience prevents silence."},
    {"label":"D","body":"Joy is stronger than resilience."}]'::jsonb,
  'B', 'A brief spark of laughter surviving the darkest moments is exactly a small joy standing for endurance. The other three make silence or joy compete with resilience, which the line never does.');

-- --------------------------------------------- Passage 4 · the argument ----
perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q14', 'information_and_ideas', p4, null,
  'Which claim would best strengthen the argument?',
  'medium', 'The student has to identify whose side the passage is on before choosing evidence for it.',
  '[{"label":"A","body":"Studies show that social media decreases face-to-face interaction."},
    {"label":"B","body":"Online platforms have allowed scientists worldwide to solve problems collaboratively."},
    {"label":"C","body":"Technology companies profit from user engagement."},
    {"label":"D","body":"Many students use phones for entertainment."}]'::jsonb,
  'B', 'The argument is that technology connects people across the globe, so evidence of worldwide collaboration strengthens it. A supports the opposing view, and C and D are beside the point.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q15', 'expression_of_ideas', p4, null,
  'Which choice completes the text with the most logical transition?',
  'medium', 'Tests whether the concluding sentence has to agree with the paragraph it closes.',
  '[{"label":"A","body":"“This shows that technology is not inherently harmful.”"},
    {"label":"B","body":"“Therefore, technology has no value.”"},
    {"label":"C","body":"“Thus, isolation is unavoidable.”"},
    {"label":"D","body":"“For this reason, technology is a distraction.”"}]'::jsonb,
  'A', 'The paragraph argues that technology connects people, so its closing sentence has to agree with it. B, C and D all conclude the opposite of what the text just argued.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q16', 'expression_of_ideas', p4, null,
  'Which choice joins the statement with the most logical transition?
"Some argue that technology isolates people. ____ it can also foster connections across the globe…"',
  'medium', 'Four transitions, two of which (contrast and concession) are close enough to need care.',
  '[{"label":"A","body":"Furthermore,"},
    {"label":"B","body":"In contrast,"},
    {"label":"C","body":"Nevertheless,"},
    {"label":"D","body":"As a result,"}]'::jsonb,
  'B', 'The second sentence sets connection against isolation, so the link is contrast. "Furthermore" adds to the first claim and "As a result" makes it a cause, both of which get the relationship backwards.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q17', 'expression_of_ideas', p4, null,
  'The author wants to emphasize technology’s positive uses. Which revision achieves this?',
  'medium', 'A rhetorical-synthesis item: the goal is stated, and the revision has to serve it.',
  '[{"label":"A","body":"Delete “it can also foster connections across the globe”"},
    {"label":"B","body":"Replace “foster” with “weaken”"},
    {"label":"C","body":"Add: “These connections can lead to meaningful social change.”"},
    {"label":"D","body":"Remove: “allowing individuals to collaborate.”"}]'::jsonb,
  'C', 'The goal is to emphasise the positive, so the revision has to add to it. A deletes the only positive claim in the passage, B reverses it, and D removes an example of it.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q18', 'craft_and_structure', p4, null,
  'Which best describes the main purpose of the passage?',
  'medium', 'The passage concedes one view before arguing another, and the purpose has to account for both halves.',
  '[{"label":"A","body":"To argue technology is harmful"},
    {"label":"B","body":"To show technology has both positive and negative aspects"},
    {"label":"C","body":"To claim technology prevents communication"},
    {"label":"D","body":"To provide a historical overview of technology"}]'::jsonb,
  'B', 'The passage states the isolation view and then answers it with the connection view, so it presents both sides. C is the view the passage argues against, and A is its opposite.');

end
$seed$;

-- ------------------------------------------- Q19–Q25 · standalone items ----
-- Each of these carries its own stimulus, so they need no shared variables.
do $seed$
begin

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q19', 'craft_and_structure',
  'The invention in 1958 of the integrated circuit (or microchip) radically altered the semiconductor industry. In fact, some historians argue that it fundamentally ______ the industry by enabling it to take advantage of mass production methods for the first time.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'easy', 'Three of the four options are negative and the sentence is plainly positive, so the field narrows immediately.',
  '[{"label":"A","body":"overwhelmed"},
    {"label":"B","body":"bypassed"},
    {"label":"C","body":"obstructed"},
    {"label":"D","body":"transformed"}]'::jsonb,
  'D', '"Radically altered" in the first sentence sets the meaning the blank has to repeat, and enabling mass production is a change for the better. "Overwhelmed", "bypassed" and "obstructed" all cast the microchip as a hindrance.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q20', 'craft_and_structure',
  'The field of study called affective neuroscience seeks instinctive, physiological causes for feelings such as pleasure or displeasure. Because these sensations are linked to a chemical component (for example, the release of the neurotransmitter dopamine in the brain when one receives or expects a reward), they can be said to have a partly physiological basis. These processes have been described in mammals, but Jingnan Huang and his colleagues have recently observed that some behaviors of honeybees (such as foraging) are also motivated by a dopamine-based signaling process.',
  null,
  'Which choice best describes the main purpose of the text?',
  'hard', 'Two options are defensible readings of the last sentence; separating the finding from what the finding implies is the whole difficulty.',
  '[{"label":"A","body":"It describes an experimental method of measuring the strength of physiological responses in humans."},
    {"label":"B","body":"It illustrates processes by which certain insects can express how they are feeling."},
    {"label":"C","body":"It summarizes a finding suggesting that some mechanisms in the brains of certain insects resemble mechanisms in mammalian brains."},
    {"label":"D","body":"It presents research showing that certain insects and mammals behave similarly when there is a possibility of a reward for their actions."}]'::jsonb,
  'C', 'The text reports one finding: a dopamine-based signalling process seen in mammals also appears in honeybees. That is a resemblance between mechanisms, which is C. B goes further than the text does — it never claims bees express feelings.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q21', 'standard_english_conventions',
  'The Mission 66 initiative, which was approved by Congress in 1956, represented a major investment in the infrastructure of overburdened national ______ it prioritized physical improvements to the parks’ roads, utilities, employee housing, and visitor facilities while also establishing educational programming for the public.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'A boundaries item: two complete sentences meet at the blank, and only one option can join them.',
  '[{"label":"A","body":"parks and"},
    {"label":"B","body":"parks"},
    {"label":"C","body":"parks;"},
    {"label":"D","body":"parks,"}]'::jsonb,
  'C', 'Both halves stand alone as sentences, so they need a semicolon between them. A comma (D) or nothing (B) leaves a run-on, and "and" without a comma before it (A) does not fix the splice.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q22', 'standard_english_conventions',
  'A recent study tracked the number of bee species present in twenty-seven New York apple orchards over a ten-year period. ______ found that when wild growth near an orchard was cleared, the number of different bee species visiting the orchard decreased.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'Punctuation around a name and its title, where the blank is the subject of the verb that follows.',
  '[{"label":"A","body":"Entomologist Heather Grab:"},
    {"label":"B","body":"Entomologist, Heather Grab,"},
    {"label":"C","body":"Entomologist Heather Grab"},
    {"label":"D","body":"Entomologist Heather Grab,"}]'::jsonb,
  'C', 'The blank is the subject of "found", and nothing separates a subject from its verb. A comma (D), a comma pair around the name (B) or a colon (A) all break that rule.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q23', 'standard_english_conventions',
  'In recent years, economists around the world have created new tools that quantify the overall well-being of a country’s citizens. Economists in India, for example, use an Ease of Living Index. This tool ______ economic potential, sustainability, and citizens’ quality of life.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'easy', 'A verb-tense item where the surrounding sentences are plainly in the present.',
  '[{"label":"A","body":"measures"},
    {"label":"B","body":"had measured"},
    {"label":"C","body":"would have measured"},
    {"label":"D","body":"will have been measuring"}]'::jsonb,
  'A', 'The passage describes what the index does now — "economists in India use an Ease of Living Index" — so the simple present is the only tense that fits. The other three place the action in the past or the future.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q24', 'craft_and_structure',
  'Text 1
In 1916, H. Dugdale Sykes disputed claims that The Two Noble Kinsmen was coauthored by William Shakespeare and John Fletcher. Sykes felt Fletcher’s contributions to the play were obvious — Fletcher had a distinct style in his other plays, so much so that lines with that style were considered sufficient evidence of Fletcher’s authorship. But for the lines not deemed to be by Fletcher, Sykes felt that their depiction of women indicated that their author was not Shakespeare but Philip Massinger.

Text 2
Scholars have accepted The Two Noble Kinsmen as coauthored by Shakespeare since the 1970s: it appears in all major one-volume editions of Shakespeare’s complete works. Though scholars disagree about who wrote what exactly, it is generally held that on the basis of style, Shakespeare wrote all of the first act and most of the last, while John Fletcher authored most of the three middle acts.',
  null,
  'Based on the texts, both Sykes in Text 1 and the scholars in Text 2 would most likely agree with which statement?',
  'hard', 'Cross-text agreement: the student must find the one point two disagreeing sources share, not the point they argue over.',
  '[{"label":"A","body":"John Fletcher’s writing has a unique, readily identifiable style."},
    {"label":"B","body":"The women characters in John Fletcher’s plays are similar to the women characters in Philip Massinger’s plays."},
    {"label":"C","body":"The Two Noble Kinsmen belongs in one-volume compilations of Shakespeare’s complete plays."},
    {"label":"D","body":"Philip Massinger’s style in the first and last acts of The Two Noble Kinsmen is an homage to Shakespeare’s style."}]'::jsonb,
  'A', 'Sykes calls Fletcher’s style distinct enough to identify his lines, and Text 2 assigns Fletcher the middle acts "on the basis of style" — so both rely on the same premise. C is what they disagree about, and B and D are claims only one text could make.');

perform seed_bank_item(
  'ENG-DIAG-INCLASS-Q25', 'craft_and_structure',
  'The Bayeux Tapestry, from eleventh-century France, depicts 75 scenes over 250 feet of fabric. It was likely produced by workers embroidering in sections and then joining the resulting panels together. It’s plausible that the workshop that produced the tapestry had never produced one so large, and some researchers claim that a close examination of the joins — the places where the panels are stitched together — suggests that the workers developed and refined their joining process over the course of production. For example, the first join the workers completed exhibits a clear misalignment of the borders of the two panels, whereas the later joins are virtually invisible.',
  'For example, the first join the workers completed exhibits a clear misalignment of the borders of the two panels, whereas the later joins are virtually invisible.',
  'Which choice best describes the function of the underlined sentence in the text as a whole?',
  'medium', 'The sentence is an example, and the student has to name what it is an example of rather than summarise it.',
  '[{"label":"A","body":"It identifies the people and events depicted in the Bayeux Tapestry."},
    {"label":"B","body":"It supports an argument about the workers who produced the Bayeux Tapestry."},
    {"label":"C","body":"It compares the Bayeux Tapestry with other tapestries from eleventh-century France."},
    {"label":"D","body":"It describes how researchers determined where the Bayeux Tapestry was produced."}]'::jsonb,
  'B', 'The preceding sentence makes a claim — the workers refined their joining process as they went — and the underlined sentence gives the sloppy first join and the invisible later ones as evidence for it. A, C and D describe things the text never does.');

end
$seed$;

-- ------------------------------------------------------ authoring the span ----
-- The underlined sentence has to be reachable from the authoring form too, or
-- the column is seed-only and the next "function of the underlined sentence"
-- item cannot be typed in.  Added last with a default, so the existing call
-- from /questions/new keeps working unchanged.
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
  p_explanation          text,
  p_passage_underline    text default null
) returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  qid    uuid;
  labels text[];
  span   text := nullif(btrim(coalesce(p_passage_underline, '')), '');
begin
  select array_agg(o->>'label') into labels from jsonb_array_elements(p_options) o;

  if labels is null or array_length(labels, 1) < 2 then
    raise exception 'a question needs at least two options';
  end if;
  if not (p_correct::text = any(labels)) then
    raise exception 'the correct option must be one of the options provided';
  end if;
  -- A span that is not in the passage would silently render unmarked, which is
  -- the one failure the teacher cannot see from the form. Refuse it instead.
  if span is not null and position(span in coalesce(p_passage, '')) = 0 then
    raise exception 'the underlined sentence must appear in the passage exactly';
  end if;

  insert into questions (created_by, subject, section, passage, passage_underline,
                         stem, difficulty, difficulty_rationale)
  values (auth.uid(), p_subject, nullif(p_section, ''), nullif(p_passage, ''), span, p_stem,
          p_difficulty, nullif(p_difficulty_rationale, ''))
  returning id into qid;

  insert into question_options (question_id, label, body)
  select qid, (o->>'label')::answer_option, o->>'body' from jsonb_array_elements(p_options) o;

  insert into question_keys (question_id, correct_option, explanation)
  values (qid, p_correct, nullif(p_explanation, ''));

  return qid;
end;
$$;
