-- ============================================================================
--  0043 — the 28 August mathematics diagnostic, replayed as a session
--
--  0012 did this for the 7 August English recording.  This is the mathematics
--  one: 46 minutes over Zoom on 28 August, a grade 11 IB student sitting the
--  SAT for the first time, and a teacher working through seven questions she
--  had picked from here and there — "some different ideas to see how will you
--  be able to approach those questions".
--
--  It goes in as data rather than as a document, for the same reason 0012 did:
--  it is the best description we have of what a mathematics diagnostic is, and
--  a report read off a real session is worth more than a mock-up of one.
--
--  WHAT IS FROM THE RECORDING, AND WHAT IS NOT.  The stems, the numbers in
--  them, every answer the student gave, the two times the teacher measured out
--  loud (16 seconds on question 2, 65 on question 3), her reasoning in her own
--  words and everything the teacher said about it are the recording's.  Three
--  things are not, and are marked where they appear:
--
--    * THE DISTRACTORS.  The student says the options aloud only where she
--      eliminates them, so the choices she names are hers and the rest are
--      built to be wrong in the way the question is wrong — most of them are
--      the near-misses the teacher names in the conversation.
--    * QUESTION 4'S KEY.  The teacher reads the printed choices and says the
--      answer is not among them: "I think I remembered something is wrong with
--      these choices here.  This is AI."  She is right — r = 3 and s = 403,
--      and the paper's four choices do not contain 403.  A bank item whose key
--      is not one of its options cannot be graded, so the item goes in with
--      403 restored as D and with 52, the number the student guessed, kept as
--      A.  The session records what she chose; the key records what is true.
--    * THE ELAPSED TIMES the teacher did not measure.  Where she did not, the
--      time is the gap between the turn the question opened on and the turn
--      the answer landed in — an upper bound, since Fathom stamps a block and
--      not a sentence.  Question 4 is the widest of them: 15:56 to 17:46.
--
--  The session is seven questions, not twenty.  It was a conversation about
--  seven questions, and padding it to a test's length would put thirteen rows
--  in a report that nobody sat.  sessions.level is left at its default for the
--  same reason: this paper is not one of the three level tests (0041), so the
--  session was never "on" easy, medium or hard.  The items carry their own
--  difficulty, which is the teachers' own reading — the teacher calls question
--  4 "one of the hard ones" on the recording.
-- ============================================================================

-- ------------------------------------------------------------ the questions --
do $seedq$
begin

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q01', 'algebra',
  null, null,
  'If 3x + 7 = 25, what is the value of 6x + 14?',
  'easy',
  'One step if it is read and two minutes if it is not: 6x + 14 is 2(3x + 7), so the answer is 2 × 25 without ever finding x. Everyone can solve it; the item is about whether the student looks before solving.',
  '[
    {"label":"A","body":"20"},
    {"label":"B","body":"25"},
    {"label":"C","body":"36"},
    {"label":"D","body":"50"}]'::jsonb,
  'D', '6x + 14 is exactly twice 3x + 7, so it is twice 25, which is 50. B is the given total copied back; C is 6x alone once x = 6 has been found, which is where the long route stops one step early.',
  'published', 'linear_equations_in_one_variable', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q02', 'problem_solving_and_data_analysis',
  'The price of an item is $80. The price is increased by 25%, and the new price is then decreased by 20%.',
  null,
  'What is the final price of the item?',
  'easy',
  'Two percentage steps, and the numbers are chosen so that the second exactly undoes the first. A student who works in amounts has to do four operations; one who works in multipliers does 80 × 1.25 × 0.8 in one.',
  '[
    {"label":"A","body":"$76"},
    {"label":"B","body":"$80"},
    {"label":"C","body":"$96"},
    {"label":"D","body":"$100"}]'::jsonb,
  'B', '80 × 1.25 = 100, and 100 × 0.8 = 80. D is the price after the increase, which is the step the question does not stop at; C takes 20% off the original rather than off the increased price.',
  'published', 'percentages', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q03', 'advanced_math',
  'y = x² − 5x + 3
y = 2x − 1',
  null,
  'What is the positive x-coordinate of an intersection point of the two graphs in the xy-plane?',
  'medium',
  'A quadratic met by a line. It is a graphing question on Desmos and a quadratic-formula question on paper, and both intersections are positive — so the option list cannot be settled by sign alone.',
  '[
    {"label":"A","body":"1.28"},
    {"label":"B","body":"3.50"},
    {"label":"C","body":"6.37"},
    {"label":"D","body":"7.00"}]'::jsonb,
  'C', 'x² − 5x + 3 = 2x − 1 gives x² − 7x + 4 = 0, so x = (7 ± √33)/2: 0.63 and 6.37. Both are positive and only 6.37 is offered. D is the sum of the roots, which is where stopping at −b/a lands.',
  'published', 'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q04', 'algebra',
  '(12x + 28)/4 − s/13 = r(x − 8)

In the given equation, r and s are constants and s > 0. The equation has infinitely many solutions.',
  null,
  'What is the value of s?',
  'hard',
  'Infinitely many solutions means the two sides are the same line, which is two equations — coefficients equal, constants equal — hidden inside one. The arithmetic is heavy enough that a student who does not know that rule cannot get there by pushing.',
  '[
    {"label":"A","body":"52"},
    {"label":"B","body":"91"},
    {"label":"C","body":"312"},
    {"label":"D","body":"403"}]'::jsonb,
  'D', '(12x + 28)/4 is 3x + 7. Multiplying through by 13: 39x + 91 − s = 13rx − 104r. Infinitely many solutions means the sides are identical, so 39 = 13r and r = 3, and then 91 − s = −104(3) = −312, so s = 403. C is that −312 read as the answer; B is the constant on the left, left alone.',
  'published', 'linear_equations_in_one_variable', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q05', 'advanced_math',
  'x + y = 12
xy = 20',
  null,
  'What is the value of x² + y²?',
  'medium',
  'The identity (x + y)² = x² + 2xy + y² turns it into one subtraction: 144 − 40. Solving for x and y is a quadratic, a surd and two substitutions, and every one of them is a place to drop a sign.',
  '[
    {"label":"A","body":"64"},
    {"label":"B","body":"84"},
    {"label":"C","body":"104"},
    {"label":"D","body":"144"}]'::jsonb,
  'C', '(x + y)² = 144, and (x + y)² = x² + 2xy + y², so x² + y² = 144 − 2(20) = 104. D is (x + y)² with the 2xy never taken off; B takes off xy once instead of twice.',
  'published', 'equivalent_expressions', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q06', 'algebra',
  'The function f is defined by f(x) = x + c, where c is a constant.',
  null,
  'If f(2) = 35, what is the value of c?',
  'easy',
  'One substitution into function notation. It is here as a pace question rather than a skill one — anything above ten seconds on it is time taken off the end of the module.',
  '[
    {"label":"A","body":"17.5"},
    {"label":"B","body":"33"},
    {"label":"C","body":"35"},
    {"label":"D","body":"37"}]'::jsonb,
  'B', 'f(2) = 2 + c = 35, so c = 33. D adds the 2 instead of subtracting it; A divides 35 by 2, which is what reading f(2) as f × 2 leads to.',
  'published', 'linear_functions', 'mathematics', null);

perform seed_bank_item(
  'MATH-DIAG-AUG28-Q07', 'algebra',
  '2x + 3y = 7
10x + 15y = 35

In the given system of equations, r is a real number.',
  null,
  'Which of the following points (x, y) lies on the graph of each equation in the xy-plane?',
  'hard',
  'The second equation is the first one times five, so the system is one line and every option is a point written in terms of a parameter. The work is substitution; the difficulty is that the letters make it look like something else.',
  '[
    {"label":"A","body":"(2r/3 + 7/3, r)"},
    {"label":"B","body":"(−3r/2 + 7/2, r)"},
    {"label":"C","body":"(r, 2r/3 + 7/3)"},
    {"label":"D","body":"(r, −3r/2 + 7/2)"}]'::jsonb,
  'B', 'Substitute and see which gives 7. B: 2(−3r/2 + 7/2) + 3r = −3r + 7 + 3r = 7 for every r. C gives 2r + 2r + 7 = 4r + 7, which is 7 only when r = 0 — it is the right rearrangement with the sign of the x-term dropped, so it is the option that survives matching the denominator instead of checking the expression.',
  'published', 'systems_of_two_linear_equations_in_two_variables', 'mathematics', null);

end
$seedq$;

--  The pace is the subject's, by level, as seed_level_test sets it (0041):
--  75 seconds an easy mathematics question, 95 a medium one, 120 a hard one.
update questions set target_seconds = case difficulty
         when 'easy' then 75 when 'medium' then 95 else 120 end
 where source_ref like 'MATH-DIAG-AUG28-%';

-- ---------------------------------------------------------------- the paper --
--  The seven questions as the teacher assembled them, kept together so the
--  session's rows point at a set rather than at seven loose items. It is
--  inactive: a paper is not runnable, a level test is (0029), and nobody
--  should be able to book this one.
insert into question_sets (created_by, title, subject, description, kind, is_active, source_ref)
values (null, 'Mathematics diagnostic — 28 August', 'mathematics',
        'The seven questions the teacher picked for the 28 August diagnostic, in the order she asked them. Kept as a record of that session rather than as a test to run.',
        'paper', false, 'MATH-DIAG-AUG28')
on conflict (source_ref) where source_ref is not null do update set
  title = excluded.title, description = excluded.description,
  kind = excluded.kind, is_active = excluded.is_active;

delete from question_set_items
 where set_id = (select id from question_sets where source_ref = 'MATH-DIAG-AUG28');

insert into question_set_items (set_id, question_id, position)
select (select id from question_sets where source_ref = 'MATH-DIAG-AUG28'), q.id,
       row_number() over (order by q.source_ref)
  from questions q
 where q.source_ref like 'MATH-DIAG-AUG28-%';

-- --------------------------------------------------------- the session ------
--  Seeded onto whoever is actually on the platform, as 0012 is, so it opens
--  under a real login rather than under a teacher nobody can sign in as. The
--  teacher on the recording is Sara Khalil; her name stays in the transcript
--  and in the write-up, which is where it is evidence rather than decoration.
--
--  The student is a roster row (0032) — the recording gives her first name and
--  nothing else, and a roster student needs nothing else.
do $seed$
declare
  v_teacher uuid;
  v_student uuid;
  v_session uuid;
  v_item    uuid;
  --  The session's clock is the recording's clock: at_seconds below are
  --  seconds into the Fathom recording, so the write-up page lines the
  --  transcript up against the questions with an offset of zero.
  v_started timestamptz := date_trunc('day', now()) - interval '2 days' + interval '11 hours';
  r         record;
  n         int := 0;
begin
  select id into v_teacher from profiles where role = 'teacher' order by created_at limit 1;
  if v_teacher is null then
    raise notice 'no teacher yet — the 28 August mathematics session is not seeded';
    return;
  end if;

  select id into v_student from profiles
   where role = 'student' and full_name = 'Sara' order by created_at limit 1;

  if v_student is null then
    insert into profiles (id, role, display_id, full_name, email, pc)
    values (gen_random_uuid(), 'student',
            build_display_id('Sara', 'student', current_date), 'Sara', null, null)
    returning id into v_student;
  end if;

  select id into v_session from sessions
   where teacher_id = v_teacher and title = 'Mathematics diagnostic — 28 August';

  if v_session is null then
    insert into sessions (teacher_id, student_id, subject, title, scheduled_at,
                          duration_mins, status, started_at, ended_at, level_size,
                          teacher_notes)
    values (v_teacher, v_student, 'mathematics', 'Mathematics diagnostic — 28 August',
            v_started, 60, 'completed', v_started, v_started + interval '46 minutes', 7,
            'Grade 11, IB, first time sitting the SAT, applying to a few US colleges. '
            'The mathematics is not the problem — she got five of seven and the two misses are '
            'both about what she does before she starts working. She solves everything the long '
            'way: found x and substituted on question 1 where 6x + 14 is twice 3x + 7, and solved '
            'a quadratic on question 5 where (x + y)² gives it in one line. She is fast enough '
            'that it still lands (16 seconds on the percentage question, on her own timer), but '
            'the long route is where the arithmetic slips come from. Question 4 is a real gap: '
            'she did not know that infinitely many solutions means the two sides are the same '
            'equation, and guessed. Question 7 she reasoned well and then picked the option whose '
            'denominator matched rather than substituting to check. She is on a TI and the test '
            'gives her Desmos — regression, sliders and the graph would take the algebra out of '
            'half of these. Next: observe before solving, Desmos drills, and Bluebook on a PC.')
    returning id into v_session;
  else
    delete from session_items where session_id = v_session;
  end if;

  --  at_seconds   where the question opened, in the recording
  --  elapsed      first view to the moment she had an answer.  16 and 65 are
  --               the teacher's own measurements, said out loud; the rest are
  --               the gap to the turn the answer landed in, which is an upper
  --               bound rather than a stopwatch.
  for r in
    select * from (values
    ('MATH-DIAG-AUG28-Q01', 252, 'D', 34, 3, 'solid_reasoning',
     'Right, and quickly, but by the long road: solved 3x + 7 = 25 for x = 6 and substituted. She could not find a faster way when asked, and did not see that 6x + 14 is 2(3x + 7) until it was pointed out. This is the habit the whole session is about — give the question a second before starting to work it.',
     '3x plus 7 equals 25. Then we would do 3x equals 18 and x equals 6. 6 times 6 plus 14 is 36 plus 14, which is 50, which is D.'),

    ('MATH-DIAG-AUG28-Q02', 608, 'B', 16, 3, 'solid_reasoning',
     'Sixteen seconds on her own timer, and the method was sound: 25% of 80 is 20, so 100, then 20% of 100 is 20, so 80. Two steps rather than one — she got to 80 × 1.25 × 0.8 herself once asked for it, and the multiplier form is what to drill.',
     '.25 times 80 gives you 20. Then I just added it in my head. Then I did 0.2 times 100. And that gave me 20. So I subtracted and I got 8.'),

    ('MATH-DIAG-AUG28-Q03', 798, 'C', 65, 3, 'solid_reasoning',
     'Graphed both on her TI and read the intersection off — the right instinct on this question type. The minute went on the window: she had to zoom out to find the second intersection, which is the cost of a calculator whose view is not a pinch away. On Desmos this is typed and read.',
     'I guess I have to zoom out for this. Ah! I have to zoom out for this! See, this is the problem of the graphing calculator. 6.37.'),

    ('MATH-DIAG-AUG28-Q04', 927, 'A', 139, 1, 'concept_gap',
     'The algebra was right to the last line — she divided out the 4, took 13 as the common denominator and reached 39x + 91 − s = 13rx − 104r without help. What was missing is what "infinitely many solutions" means: that the two sides are the same equation, so the coefficients match and the constants match. Without it there was nothing to do with the line she had, and she guessed. She got to r = 3 and then s the moment the rule was said out loud.',
     'I took the LCM, the common denominator, and I got 39x plus 91 minus s equals 13Rx minus 104R. And then I took s to the other side and 13Rx minus 104 to the left-hand side. And then I got stuck with how to solve it because I had some weird numbers that didn''t make sense. I''m gonna go with 52.'),

    ('MATH-DIAG-AUG28-Q05', 1449, 'C', 133, 2, 'careless_error',
     'The right answer, and the longest way to it: x = 12 − y, x = 20/y, equated, quadratic, back-substituted. It cost two minutes and the arithmetic came out near 104 rather than at it, and she called D before correcting herself to C. The identity (x + y)² = x² + 2xy + y² makes it 144 − 40, which she followed immediately — and she then spotted 10 and 2 by inspection.',
     'I did x equals 12 minus y, and I did x equals 20 over y, and I equated them. Then I did the quadratic thing to find the value of y, then I found the value of x, then I did x squared plus y squared, and I got an answer close to 104, but not 104. Sorry, I took the wrong thing. It''s not D. It''s C.'),

    ('MATH-DIAG-AUG28-Q06', 1742, 'B', 44, 3, 'solid_reasoning',
     'Straight in: 2 + c = 35, c = 33. The fastest answer of the session and no working needed. Worth knowing that the same shape done on Desmos with regression takes the same time, for the day one of these comes with numbers that do not divide.',
     'If f of 2 equals 35, what is the value of c? It''s 33.'),

    ('MATH-DIAG-AUG28-Q07', 1918, 'C', 116, 2, 'careless_error',
     'She did the hard part correctly — rearranged 2x + 3y = 7 into y = −2x/3 + 7/3 — and then chose by matching the denominator rather than the expression, so the sign on the x-term went unchecked and she took the one option that is only true at r = 0. The fix is the substitution the teacher showed: put the option into the equation and see whether it gives 7. The letters are what made it look like a harder question than it is.',
     'So I found the gradient. I solved for y, basically. I got minus 2x over 3 plus 7 over 3. And that''s the only one whose denominator is 3.')
    ) as t(source_ref, at_seconds, answered, elapsed, confidence, diagnosis, teacher_note, student_reasoning)
  loop
    n := n + 1;

    insert into session_items (
      session_id, question_id, student_id, sequence_no, asked_no, status,
      published_at, first_viewed_at, decided_at, answered_at, revealed_at,
      selected_option, eliminated_options, student_confidence, student_reasoning,
      revealed_result, revealed_correct_option, revealed_explanation)
    select v_session, q.id, v_student, n, n, 'revealed',
           v_started + (r.at_seconds || ' seconds')::interval,
           v_started + (r.at_seconds || ' seconds')::interval,
           v_started + (r.at_seconds + r.elapsed || ' seconds')::interval,
           v_started + (r.at_seconds + r.elapsed || ' seconds')::interval,
           v_started + (r.at_seconds + r.elapsed + 30 || ' seconds')::interval,
           r.answered::answer_option, '{}', r.confidence, r.student_reasoning,
           case when r.answered = k.correct_option::text then 'correct' else 'incorrect' end::grade_result,
           k.correct_option, k.explanation
      from questions q
      join question_keys k on k.question_id = q.id
     where q.source_ref = r.source_ref
    returning id into v_item;

    if v_item is null then
      raise exception 'the 28 August session: % is not in the bank', r.source_ref;
    end if;

    insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds,
                                          diagnosis, diagnosed_at, teacher_note)
    select v_item,
           r.answered = k.correct_option::text,
           r.elapsed,
           r.diagnosis,
           v_started + interval '46 minutes',
           r.teacher_note
      from session_items si
      join question_keys k on k.question_id = si.question_id
     where si.id = v_item;

  end loop;

  raise notice 'seeded % items into the 28 August mathematics session', n;
end
$seed$;

-- ------------------------------------------------- the diagnostic form ------
--  The session ends with no score and no report; what the teacher does next is
--  the form (0030), in the order it is filled: the grid, her comments, the
--  transcript. This is that form, filled in and handed in.
--
--  The report is NOT generated. generated_at stays null and session_reports
--  stays a draft, because generating it is the teacher pressing the button,
--  and nobody has pressed it. form_submitted_at is set, which is what the
--  console reads to offer the button at all.
--
--  The grid is the mathematics grid (0042). Geometry and Trigonometry is the
--  hard row on it: not one question in these seven touched it, and the form
--  offers a tick or a cross and nothing else. It is marked with a cross and the
--  note says why — an unevidenced domain marked as passing is the worse of the
--  two mistakes, and the note is the column the teachers write in.
do $form$
declare
  v_session uuid;
  v_teacher uuid;
begin
  select id, teacher_id into v_session, v_teacher from sessions
   where title = 'Mathematics diagnostic — 28 August'
   order by created_at limit 1;

  if v_session is null then
    raise notice 'the 28 August mathematics session is not seeded — nothing to write up';
    return;
  end if;

  insert into session_domain_notes (session_id, domain, performance, performance_note, strengths, gaps, targets) values
  (v_session, 'algebra', 'cross',
   'Four of the seven questions, two of them lost. The mechanics are not the problem; both misses are about what she does before and after the working.',
   'Rearranges cleanly and quickly under her own timer. On question 4 she simplified (12x + 28)/4 to 3x + 7, took 13 as the common denominator and reached 39x + 91 − s = 13rx − 104r with no help at all — every line of that is right. On question 7 she solved 2x + 3y = 7 for y correctly and was reading the options against the gradient rather than guessing.',
   'Infinitely many solutions is not known as a rule: she had the equation in the right form and no idea that it means the two sides are identical, so coefficients match and constants match. She guessed rather than stopping. And she does not verify — on question 7 she picked the option whose denominator matched instead of substituting it back to see whether it gives 7, which would have taken ten seconds and shown her the sign. On question 1 she found x and substituted rather than seeing that 6x + 14 is twice 3x + 7.',
   'Write down what infinitely many solutions and no solution mean, and drill both until they are a first thought rather than a rule to remember.
Substitute the option back in before committing on any question written in letters.
Look at the question for two seconds before starting: what is asked for is often already in front of you.'),

  (v_session, 'advanced_math', 'tick',
   'Both questions right, and the two of them are the strongest work in the session.',
   'Reads a nonlinear system as two graphs and goes straight to the calculator for the intersection — that is the right instinct, and she recovered the second root herself when the first window hid it. On question 5 she carried a quadratic, a substitution and a return trip to x² + y² and still landed on 104. She also spotted, unprompted, that 10 and 2 satisfy both x + y = 12 and xy = 20.',
   'The long route is the only route she has. (x + y)² = x² + 2xy + y² turns question 5 into 144 − 40, and she followed that immediately once shown it but did not reach for it — and the arithmetic on the long way out came near 104 rather than at it, then she named D before correcting to C. Speed here is a matter of knowing which identity ends the question.',
   'Drill the identities that shorten a question: (x + y)², (x − y)², difference of two squares, sum and product of roots.
Practise reading nonlinear systems off a graph on Desmos rather than solving them.
Say the answer once, after checking it — not while still deciding.'),

  (v_session, 'problem_solving_and_data_analysis', 'tick',
   'One question, answered correctly in sixteen seconds on her own timer.',
   'Percentage increase and decrease held under time pressure: 25% of 80 is 20 so 100, then 20% of 100 is 20 so 80, most of it done mentally. She asked to be timed, which is the right thing to be curious about at this stage.',
   'She works in amounts rather than multipliers — two steps where 80 × 1.25 × 0.8 is one, and the gap widens on a question that chains three changes or asks for the percentage rather than the price. One question is also not enough to judge the domain on: nothing here tested rates, units, a table, a graph or anything statistical.',
   'Percent change as a single multiplier: ×1.25 for up 25, ×0.8 for down 20, and never the amount unless the amount is what is asked for.
A set on rates, units and proportion, which this session never reached.
A set on reading tables, scatterplots and the statistics questions, same reason.'),

  (v_session, 'geometry_and_trigonometry', 'cross',
   'Not assessed. None of the seven questions was geometry or trigonometry, so this row carries no evidence either way — the cross is the absence of it, not a judgement about her.',
   'Nothing observed. The session was algebra, advanced mathematics and one percentage question.',
   'Unknown, and that is the gap: about 15% of the test is this domain and we have not seen her do any of it. It needs a paper of its own before anything here can be said.',
   'Sit a geometry and trigonometry set next session — area and volume, angles, right triangles, circles — before any more algebra.
Learn the reference sheet by using it, so that looking a formula up is quick rather than a decision.
Desmos as a calculator on this domain, since the graphing tricks do not apply to it.')
  on conflict (session_id, domain) do update
    set performance      = excluded.performance,
        performance_note = excluded.performance_note,
        strengths        = excluded.strengths,
        gaps             = excluded.gaps,
        targets          = excluded.targets;


  insert into session_transcripts (session_id, source, filename, body, uploaded_by)
  values (v_session, 'fathom', 'sara-khalil-august-28.txt', $fathom$Sara Khalil - August 28
VIEW RECORDING - 46 mins

@2:08 - Sara Khalil (sasso212@gmail.com)
Hi, Sara. Hi. How are you? I'm good.

@2:12 - sara
How are you? Good.

@2:14 - Sara Khalil (sasso212@gmail.com)
Nice to see you again. Yeah, nice to see you. So tell me, you are a grade 11 student, right? Yeah. Did you practice for SAT before?

@2:25 - sara
No. My first time taking it. Oh, okay.

@2:31 - Sara Khalil (sasso212@gmail.com)
So why do you need it? For college, it's required?
SCREEN SHARING: Sara started screen sharing - WATCH

@2:36 - sara
For college in the US, I need it.

@2:39 - Sara Khalil (sasso212@gmail.com)
In the US. Yeah. But you are following IB curriculum, right?

@2:44 - sara
Yes. So you don't actually need it, except for if you're going to the US. But I don't know if I definitely want to go there, but I probably will apply to like a few colleges there.

@2:55 - Sara Khalil (sasso212@gmail.com)
Yeah. We always tell the students, just keep it, you know, so you don't regret. You don't. And then I was like, oops, the college wanted Fathom, it was going to give me a scholarship or, you know, so just it's an easy test in the end, need some practice and you will do one. So I've got you some, I picked some questions from here and there or some different ideas to see how will you be able to approach those questions. So if we're looking at question now, and I want you to keep Dismiss open. You know Dismiss, right? What?

@3:29 - sara
Dismiss, I have calculator. Okay, but Dismiss is a graphing one. Graphing calculator.

@3:37 - Sara Khalil (sasso212@gmail.com)
Yeah, I can send you the link because some questions, they are easier when you, no, that depends too much on this, on the Dismiss itself. But anyways, I sent you the link. So if you want to follow up or check other strategies. is it okay if I use my graphing calculator or no? Yes, yes, sure. You can use anything that's allowed. All through the test, calculator, TI, graphing, they don't care. They care. You pick the right answer. Okay? So for the first question...

@4:12 - sara
Should I just...

@4:13 - Sara Khalil (sasso212@gmail.com)
Yeah, sorry.

@4:20 - sara
Should I just solve it? Yeah, tell me what we need do. Okay, so 3x plus 7 equals 25. Then we would do 3x equals 18 and x equals 6. 6 times 6 plus 14 is 36 plus 14, which is 50, which is D.

@4:46 - Sara Khalil (sasso212@gmail.com)
Okay, once we reach 36 plus 14, you might save the time and don't really add them. It's not this, it's not this, and 6 plus 4 doesn't give me 3, you know? You would directly pick the 50 because this is the one that makes sense. So... Over a year, they never asked you what is the value of x, did they?

@5:04 - sara
No. Okay, and nobody is checking your steps.

@5:08 - Sara Khalil (sasso212@gmail.com)
Here they always depend on your smartness and observing, like working faster, not harder. You got the steps and you got the x and you substituted. Do you see another way how you can solve it faster than that?

@5:31 - sara
Another way that's faster? Well, I know that it's not 20. I mean, you can just do process of elimination. So I know just by looking at it, it can't be 25 because x will not like, because we have to subtract seven, right? So x cannot be like five or something. It won't be like that. Yeah. 36, no, because 6 times 6 is 36. I don't know, this is like ridiculous. I genuinely don't see a way, apart from what I've already done, now that I've solved it, I know what it can't be.

@6:15 - Sara Khalil (sasso212@gmail.com)
Okay, I believe totally it's not 25, because 3x plus 7, whatsoever the x is, is equal to 25. So 6x plus 14 will never also equal to 25. Okay, so I believe 25 is out. started thinking about 36, I'm not sure. What I wanted you to observe is that from 3x to 6x multiplied by 2. From 7 to 14, this is what you need to see.

@6:41 - sara
Oh my god!

@6:43 - Sara Khalil (sasso212@gmail.com)
Yeah, and how this is what they actually do. Okay, so if you just saw this, if you gave yourself a second to see the question, you would have said the answer is 50. But this comes by training, because these questions are always coming, you know. And you have to check. What do they, like, the question might sometimes, I'll tell you another thing, might sometimes come as 5x minus 3 plus 2 equals 2x minus 3 plus 6. And they want x minus 3. If I were you, I would distribute and find x and substitute. But then you have to have another I. You have to see that already what is required is already there in the question. So what can I do not to lose it, not to get x and then go back and substitute?

@7:40 - sara
Well, first you would just do 4, right? Just 6 minus 2, that's 4.

@7:48 - Sara Khalil (sasso212@gmail.com)
Okay, so we're done with this. This is 4. And can we move this as it is to the other side?

@7:56 - sara
Yeah, yes, but you would have to make it negative.

@8:00 - Sara Khalil (sasso212@gmail.com)
Okay, so now we have 5x-3-2x-3 equals 4. And then, should we distribute or no?

@8:09 - sara
What do you mean by distribute? Should we like open the bracket?

@8:12 - Sara Khalil (sasso212@gmail.com)
Ah, do we need that or can we handle the question?

@8:16 - sara
No. Oh no, you can, so you just do, take x-3 common.

@8:21 - Sara Khalil (sasso212@gmail.com)
Okay.

@8:23 - sara
x-3, take it as common, and then do minus. 5-2.

@8:33 - Sara Khalil (sasso212@gmail.com)
Yeah. It's actually the same as 5x-2x. It's 3x. 3x. So this one is also 3, but x-3? Hmm.

@8:45 - sara
Yeah, exactly. And that's it. And the answer is, for example, 4 over 3.

@8:49 - Sara Khalil (sasso212@gmail.com)
But it doesn't mean if I went to graphing, would be wrong. It doesn't mean if I did move on distributing the 5 or multiple. planning to get rid of the bracket, and then I found X and all that. Nothing is wrong, but we are talking about speed. The questions, especially the first ones, must be solved in less than a minute. I the test goes... Well, I didn't think of a minute for that.

@9:13 - sara
I didn't think of a minute. Oh, yeah, okay.

@9:15 - Sara Khalil (sasso212@gmail.com)
Goes easy, medium, hard. Yes, you did, because you are fast. Easy, medium, hard, okay? The easy ones should take half a second or less to save time to those, you know? It's two modules. One module is 22 questions. The time you have is 35 minutes.

@9:33 - sara
Oh, no! For this module.

@9:36 - Sara Khalil (sasso212@gmail.com)
I would...

@9:37 - sara
Wow. And the timer, you know, the timer is up there, and it's...

@9:41 - Sara Khalil (sasso212@gmail.com)
So, no, I have to save time in these. Observe first. Before you start, observe. Give yourself, maybe there's something, a hidden word here, a hidden number here, okay? What about number two? How do you think we can get the answer quickly?

@9:57 - sara
Okay, wait, let me solve... only. bütün in And you the My method. Okay. Can you just time me real quick? I'll tell you when to start.

@10:05 - Sara Khalil (sasso212@gmail.com)
Okay. I just want to see.

@10:08 - sara
Okay. Ready? Three, two, one, go. Oh, shoot. I made a mistake. It's B. It is B.

@10:35 - Sara Khalil (sasso212@gmail.com)
So you took 0.16, not even half a second. So how did you solve it?

@10:42 - sara
I took not even half a second. Sorry. No.

@10:45 - Sara Khalil (sasso212@gmail.com)
And you took like 0.16. It's not even a minute. Yeah. Yeah. Yeah. 16 seconds.

@10:54 - sara
Okay. So, I mean, I was a bit tedious, but I just like spread it up a bit. Um, So.25 times 80 gives you 20.

@11:05 - Sara Khalil (sasso212@gmail.com)
And then I just added it in my head.

@11:08 - sara
Then I did 0.2 times 100. And that gave me 20. So I subtracted and I got 8. Yeah. And it's also very good.

@11:18 - Sara Khalil (sasso212@gmail.com)
And it was fast. Also, we can do it in one step. Do you have any idea how to get them all in one step? Like, get the answer in one step? Let me see if we can do that.

@11:30 - sara
Using percent increase and decrease. Okay. How?

@11:38 - Sara Khalil (sasso212@gmail.com)
I mean, when you said 80 times 25%, you got the amount of increase, which is 20. And then you have to do another step, which is addition or you did it mentally quickly and 100. How 80 multiplied by what directly gives me the 100 in one step without getting them. Because this question is not asking for the amount of increase. It's asking about the final price. 1.25?

@12:08 - sara
Yes, this is what I wanted you to say.

@12:11 - Sara Khalil (sasso212@gmail.com)
So if you know this idea, percent increase, we add to 100, a percent decrease, we subtract from 100, I can say 80 times 1.25 times 0.8.

@12:20 - sara
Oh, I have one question. So 1.25 will be from the increase of 25%.

@12:28 - Sara Khalil (sasso212@gmail.com)
But how did you get 0.8? 100 minus 20.

@12:35 - sara
Oh. Because there's a decrease.

@12:38 - Sara Khalil (sasso212@gmail.com)
Okay.

@12:39 - sara
What's left is 80%, the same idea.

@12:42 - Sara Khalil (sasso212@gmail.com)
I want the amount, the final price. I don't want to know the discount. I don't want to know how much it increased. I just want to know the price. And this is also unbelievable. Like some students would think it doesn't make sense that it's the same answer, but actually it is the same answer after the increase and the decrease anyways. Okay, good. So... You have an idea how we usually in SCT do it like that quickly in one step on the calculator and if the discount is not required? Okay, I will start the timer and you will finish. I need to see, I need to see the thing.

@13:16 - sara
Okay, you can start.

@13:18 - Sara Khalil (sasso212@gmail.com)
Okay.

@13:35 - sara
I'm a bit, I'm bit rusty. haven't done this in a while.

@13:41 - Sara Khalil (sasso212@gmail.com)
It's summertime.

@13:44 - sara
10.6. What? What is the positive x-coordinate of an intersection? Intersected to .

@13:56 - Sara Khalil (sasso212@gmail.com)
They're asking about the solution, a positive. Okay, sorry, sorry.

@14:00 - sara
I'm just...it's fine. I guess I have to zoom out for this. Ah! I have to zoom out for this! See, this is the problem of the graphing calculator..37c. Yes, 6.37.

@14:19 - Sara Khalil (sasso212@gmail.com)
Okay, so that's 65 seconds. Okay, so you solved this one on your graphing calculator, right?

@14:27 - sara
Yes.

@14:28 - Sara Khalil (sasso212@gmail.com)
Okay, for the windows of this calculator and all that, here we zoom in and out with our fingers, you know? We zoom in and out easily. We can directly say that y equals x to the power of 2, the same as you did, minus 5x plus 3, and there was another function which is a linear function, 2x minus 1, and that's it. And here I can grab this answer, 0.6, but that was not in the options. Both of them were positive, but that was not in the options. This is the one that was in the options. I want you also, beside your TI skills or your calculator, to start getting, adapting to business. Business has many, like, it's like a magic in this test. It has many tricks that are very helpful. Okay, so you took a minute in that and you got the right answer. Now, question number four, for example.

@15:27 - sara
Given equation, s and r are constants and s greater than zero. the equation has infinitely many solutions, what is the value of s? What is that r? s and r are constants. Oh, this is low-key hard, bro. It is one of the hard ones, yeah.

@15:54 - Sara Khalil (sasso212@gmail.com)
equation has infinitely many solutions.

@15:56 - sara
What is the value of s? Um, ok. Okay, let's start the timer, I'm just gonna try to do it. What is the value of s? I'm gonna go with 52.

@17:46 - Sara Khalil (sasso212@gmail.com)
Don't look at the answers. I think the answer is not there somehow. But you were trying to guess it, right? I was.

@17:54 - sara
I had no idea.

@17:55 - Sara Khalil (sasso212@gmail.com)
I think I remembered something is wrong with these choices here. This is AI. But what did you do?

@18:05 - sara
Well, first, I removed the four.

@18:09 - Sara Khalil (sasso212@gmail.com)
Excellent. You show this, that these are all divisible by four. Okay, so it became 3x plus eight.

@18:17 - sara
Four sevens. Four seven.

@18:20 - Sara Khalil (sasso212@gmail.com)
Three x plus seven.

@18:22 - sara
Oh, three x plus seven.

@18:24 - Sara Khalil (sasso212@gmail.com)
You are right. Minus s over three. And here are x minus r8, for example.

@18:29 - sara
Yeah, that's what I did. And then what happened?

@18:32 - Sara Khalil (sasso212@gmail.com)
What did you do with the infinitely many solutions story?

@18:36 - sara
Um, well, I basically I did, I took the LCM, the common denominator for 3x plus seven. Okay, so 13?

@18:46 - Sara Khalil (sasso212@gmail.com)
Um, yeah.

@18:47 - sara
then... you right and left?

@18:49 - Sara Khalil (sasso212@gmail.com)
Yes.

@18:51 - sara
Okay.

@18:52 - Sara Khalil (sasso212@gmail.com)
So why did you get the answer? So wait, because then I got 39x plus 91.

@19:01 - sara
Minus s equals 13Rx minus 104R.

@19:06 - Sara Khalil (sasso212@gmail.com)
Until here, everything is right. And then?

@19:09 - sara
And then I took s to the other side and 13Rx minus 104 this to the left-hand side. And then I got stuck with how to solve it because I had some weird numbers that didn't make sense.

@19:24 - Sara Khalil (sasso212@gmail.com)
Okay, but infinitely many solutions means what?

@19:27 - sara
It means that you can have a lot of, like, there's not, it just means that there's many solutions.

@19:36 - Sara Khalil (sasso212@gmail.com)
Yeah, they are exactly the same. Like, they are exactly the same equation. Like, for example, 3x plus 2y equals 4 and 6x plus 4y equals 8. When you graph them, they are exactly the same. Okay, because actually when you simplify this, you will come to that. So I should understand that the coefficient of x here is the same as the coefficient of

@20:02 - sara
And that can help me find R.

@20:06 - Sara Khalil (sasso212@gmail.com)
When you find R, is 26.

@20:11 - sara
Okay, R is, I think R is 3.

@20:13 - Sara Khalil (sasso212@gmail.com)
From where did you go? 39 divided by 13.

@20:17 - sara
Oh, divided by?

@20:18 - Sara Khalil (sasso212@gmail.com)
Yeah, so R is 3. And then what's another equation that can help me to find S?

@20:30 - sara
Oh, what is the constant in the left side?

@20:34 - Sara Khalil (sasso212@gmail.com)
Because the constant is going to equal to the constant.

@20:39 - sara
X? No, the constant means no X at all.

@20:43 - Sara Khalil (sasso212@gmail.com)
Numbers only. These are constant here. Because S is just a constant. 91 minus whatever, 3, 4, 5, I don't know. This should equal to this. Okay.

@20:56 - sara
And that's the second equation.

@20:57 - Sara Khalil (sasso212@gmail.com)
So 91 minus S equals negative 1. For four times three, and that will help you to find this, for example, but this, I want to tell you that the SAT test is adaptive. You know what? Module one comes like mostly to everyone the same, but module two, what happens on it depends on what you did on module one. So these questions, like, for example, they saw you're excellent on module one. They will start challenging you with such questions at the end of the second module, you know. If you did very, very well in the first one, they want to see the maximum of your level, but not everyone sees these questions, because in the other module, it's sometimes easy for some students. Do think this is the hardest.

@21:42 - sara
Yeah, this is hard, okay.

@21:44 - Sara Khalil (sasso212@gmail.com)
It doesn't show, these type of questions do not pop for everyone. Like if he's a weak student and never see this question, of course, they just adapt to his level and that's it. So over here in Dismissed, we can use regression, you know regression, you know the line of... The fit? And the R, the constant, the Pearson, I don't know what. Okay, if we use, but there will be a method, like you will have to get trained for that, but it's 12x1, we have to type x1 over 28, sorry, plus 28 over 4. I'm trying to tell Dismas, to inform Dismas that this left-hand side should exactly be the same as the right-hand side, and I will tell Dismas to do all the job that we did. We did try to equate the coefficients of x and try to equate the constants, so I use this is called tilde to inform Dismas that this left-hand side is exactly the same as the right-hand side, and then I will say, Mr. Dismas, give me R and s, minus 8. Okay, so look, what Dismas is suggesting as parameters over here is saying that when x is equal to 1, s is equal to 1, r is equal to blah blah blah. Okay, but I have a problem, I don't want one value. This graph is, this equation, I don't want to be, I don't want the answers for x equals to 1, so I'll tell business that I want this x to be a random number from 1 to 10, from 1 to 20, from 1 to 5, something like this, just to take x out of the parameter, to tell it, no, I don't want just x equals to 1, I want different values giving me the answer, and the answers are there. Look, that's why I'm telling you is sometimes, when you get used to it, I don't know if you can do this on your TI, but the answers are there, without the job that we did algebraically.

@23:35 - sara
Wow, you should really start using business.

@23:38 - Sara Khalil (sasso212@gmail.com)
Yes, but I have to give the right input, and use it in the right time, and how to use it, like, why do you use regression in this question, I didn't depend on the graph, other questions that might depend on the graph. But, and typing correctly, because this is a machine, if you type wrong, it gives you a wrong answer. So, this is the problem that you I have to type everything correctly. So this was one of the business tricks, but tell me when shall I start for question number five?

@24:09 - sara
You can start. Okay. Oh, I should use Desmos, bruh.

@25:25 - Sara Khalil (sasso212@gmail.com)
No, I don't think here it's needed.

@25:27 - sara
Algebra, you need algebra.

@25:29 - Sara Khalil (sasso212@gmail.com)
be a bit, yeah, might be a bit quicker though. You can't.

@26:00 - sara
I think I'm making so many mistakes.

@26:04 - Sara Khalil (sasso212@gmail.com)
I think it's D.

@26:22 - sara
Oh, no. Sorry. I'm sorry. I'm sorry. I took the wrong thing. It's not D. It's C. It is C.

@26:32 - Sara Khalil (sasso212@gmail.com)
Okay. So one of the most important things, Sara, in this test is that you have to be calm. Now the timer is not working. You have to be very confident and calm. And, you know, because if you're worried, you can do one plus two wrong. You know, this is one thing you have to train yourself. They take it lightly. Take it as a fun thing. Take it like I'm mastering math. I'm IBE is grade 11.

@26:56 - sara
And this is not even exceeding grade 10 level in America. You know, don't worry.

@27:03 - Sara Khalil (sasso212@gmail.com)
How did you do it? Did you do x plus y all squared?

@27:07 - sara
No, I did. Oh, wait, that would have made more sense, but I did something worse. I did x equals 12 minus y, and I did x equals 20 over y, and I equated them. Then I did the quadratic thing to find the value of y, then I found the value of x, then I did x squared plus y squared, and I got an answer close to 104, but not 104.

@27:37 - Sara Khalil (sasso212@gmail.com)
This happens. If you get an answer close to something, you pick it. Or, for example, you got an answer which is, for example, the answer is 144, but you got the answer as 1.44. I would pick that, you know, it happens. But I think the approach is to do x plus y all squared equals 144, because breaking this bracket or removing the bracket gives... It's you a 2xy, which I saw from the beginning, because I have xy, and I saw I'm going to get where I need, equals 144, and if you substitute here, the question will end quickly. So in these questions, I might not know x and y themselves. By the way, I might try to guess them. Maybe they are 6 times 6, no, 5 times 4, 5 plus. Do you think we can know the numbers? There's nothing here but 5 times 4 or 10 times 2.

@28:34 - sara
I think it's 10 times 2 that works in both of them. Yeah. And if you reach the number itself, you can also reach this. Okay. 10 times 2 and 10 plus 2 would both give you 12.

@28:45 - Sara Khalil (sasso212@gmail.com)
That would be also, if you observed for seconds, you would have known that the answer is 1 or 4. 12. Okay? So before going to our math skills and all that, give yourself just a couple of seconds to look at the question. 3. So number six.

@29:02 - sara
For the function, this y equals x plus c for all values of x. You should start it. Start the timer. Okay. If equals 35, what is the value of c? What? Okay. Oh, my God. Ridiculous question, by the way. It's 33.

@29:46 - Sara Khalil (sasso212@gmail.com)
Yeah, this one is easy. Okay, that was two seconds. Okay, if it was harder a bit, it's not a must to go with one way or with one approach. If it was harder a bit, I might have went to dismiss. I'll tell you an easy trick also that We can do here in this question on dismiss if I have such scenario, an x and a y and an x and a y. The question was saying that F of x equals x plus c, and there was another one where F of 2 equals 35. There is a way on dismiss that we can use, but here, look, now we need square brackets, and we need to inform dismiss that x1, comma, its answer is x plus c. Okay, and I'm going to use regression again. I'm going to tell him that this is equivalent because they're both on the same line. So this can also be 2. This is exactly what you did. You said when x is 2 and then x plus c is going to be equal to 35, and you found the value. This is what dismiss is going to do. I'll tell him 2 and 35, and that's it. Yeah.

@30:55 - sara
See?

@30:55 - Sara Khalil (sasso212@gmail.com)
So I solved this way quickly. Again, I ran away. had extra time. I can come back. don't can't wait. Double-check with Dismas if I know this method. What did I write? I'm telling Dismas that this x, this is its answer, and on the same line, regression exactly the same as 2, this tilde sign means equivalent, with 35. Then Dismas does the job that you already did when you plugged in the 2 over here and you said 2 plus c should equal to 35, so c should equal to 33. It will do it, if you gave it the right information, it will do it for you. Okay. Okay, so, give me a second. Okay, here's, for example, another question where also Dismas will be very useful, but tell me. I'm sure you will be able to do it algebraically.

@31:58 - sara
That's you. Oh. Here it is. How do you find the right answer? For the real number R, which of the following points lies on the graph of each equation in the x-y plane for the given system? What? Okay. Alright. I'm just going to solve it as normal. Is that fine? Yeah, of course. Okay, which of the following points lies on the graph of each equation? Okay. First, let's graph it. 2x plus 3y. Where's... Oh, it's not going to give me that, is it? No. So that's just a multiplier by 5.

@32:54 - Sara Khalil (sasso212@gmail.com)
No, they are the same. Actually, one of them, maybe ignore this one, because actually they are the same graph. But which point lies on this graph or this graph?

@33:04 - sara
Okay, which point lies on this graph? 2x plus 3y equals to 7. So, oh, it's just basically asking me for like the gradient, no. Um, so 2x plus 3y equals to 7. Um, it's C.

@33:54 - Sara Khalil (sasso212@gmail.com)
How did you know it's C?

@33:57 - sara
Am I right? I'm not sure I will double. So I found the gradient. I solved for y, basically. I got minus 2x over 3 plus 7 over 3. And that's the only one whose denominator is 3.

@34:16 - Sara Khalil (sasso212@gmail.com)
Oh, that's smart. Maybe. Okay. I will show you with dismiss how can we solve such question. So if something similar pops, you understand. You see this, you know how to do it on dismiss. Which trick? But I thought you will substitute r for x to double check and substitute this for y and make sure the answer is 7. You get me? Most of the students would do 2 times r plus 3 times 2r over 3 plus 7 over 3. If the answer is 7, then your choice is correct. No substitution. Why did they scare you to put r and s and they made it awful? Well, but in the end it's just substitution. Plus 7. Then, If to seven, is that true? Or R equals to zero? It's not equal to seven, so this is not the answer.

@35:10 - sara
Oh, no. Wow. And I thought I was doing something super smart.

@35:16 - Sara Khalil (sasso212@gmail.com)
But what you said was guessing in a way is also, okay, let's try, since we already wrote everything, let's try option D. Maybe option D will work, okay? Since we have already tried this one, so we can say, for example, that instead of Y, I'm going to put negative 3R over two, plus seven over two. And let's see, this is two R minus, I think it's getting worse, it's going to be minus nine R over two, plus, you know, I think, I have a feeling it's not going to end up in seven. Okay, so you, I think it is B, but you understood the idea? Yeah, no, no, I try the X and the Y, and the one that will give me seven is the right answer. Now, I think We'll tell you how we do this in Dismiss. If a point is on the graph, it will always stay on the graph. It's never going to be outside the graph. We have something on Dismiss called sliders. I'll just give me a second. I will resume. I'm not sure if you have those sliders on your TI because I'm not very friendly with those graphing calculators, but there's something called the slider. I can write 2x plus 3y. This is the graph equals 7. The right answer is a point that will always stay on the line. We have an option B, which I think I remember this was the answer because I don't have the answer. This option was, I think, negative 3r over 2 plus 7 over 2, and the y was r. I think this was the option to be as a character.

@36:59 - sara
It wasn't.

@37:02 - Sara Khalil (sasso212@gmail.com)
So I would tell this is, for example, okay, since I have a point here that's called negative, even if I just type 1.5 R, no problem, okay, plus 3.5, if I think this is easier, or 3 slash, or whatever, 7 slash, and then comma, I will put another R, I'm sorry, R, E, okay, R, and then, they said add a slider. Where's the point? You see the point? It's on the line, right?

@37:36 - sara
Now it's on the line.

@37:37 - Sara Khalil (sasso212@gmail.com)
If I move the slider, if I move this R to different answers, the point will always be on the line, so this is the right answer.

@37:45 - sara
Right, okay, okay, okay.

@37:46 - Sara Khalil (sasso212@gmail.com)
Without me bothering myself or even thinking, okay, so if we add another option, for example, this was positive. Look, it's not, even if it went on it one time, but it's moving away, if this is the answer, through it. So the Dismiss is embedded in the test, they put the option, and away from our traditional algebraic methods and all that, there are lots of tricks using Dismiss that can be very helpful for this test, you know? And as you know, these people, they don't care about our steps, they don't care about anything except the right answer in the end. Okay, so some students, because you are IBs, you have good skills. Some students, they make use of Dismiss to an extent that you can't imagine. I'll tell you, for example, I had an equation, because some students don't have the skills that you have or don't have this kind, okay? So they use Dismiss more. For example, there is a question that says 9R equals 7, R minus 7, and we want to find it all. Okay, I think rr plus 7. Anyways, you would, what would you do? Well, I just did it in my head.

@39:08 - sara
So we would do 2r equals minus 49. Okay.

@39:14 - Sara Khalil (sasso212@gmail.com)
And then just do 49 by 2 as a minus 9. Yes, it can be even done here by using the graph. Look, 9r and then regression. For example, I'm telling you this is equal to this. Hey, give me r. I don't even want to work. And here's the answer. Okay. Another option they do that they can say, split it into two parts. Okay. And pretend those are x's.

@39:41 - sara
And one equation is 1 equals 9x.

@39:44 - Sara Khalil (sasso212@gmail.com)
And one equation is 7x minus 7. Then this will graph and you get the intersection. Yeah, things like that. When I have a question that says, for example, a function y equals x squared minus 6x plus 9. And the line y equals So 2. Intersect at one point, for example. Find me the x of that point. That means what? It means find the x value of the Okay, say y equals k. But yeah, I mean, where are they going to intersect if they are going to intersect at one point?

@40:24 - sara
Yeah. Where exactly?

@40:26 - Sara Khalil (sasso212@gmail.com)
Oh, what do you mean where?

@40:30 - sara
Well, k is a constant, no. So it could be on any quadrant. No.

@40:39 - Sara Khalil (sasso212@gmail.com)
Why? These graphs, one of them is quadratic and one of them is linear. How can I make them intersect at one point only? There is a constant line and there is a quadratic function. How can I make them intersect at one point only?

@40:57 - sara
What do you mean we make them intersect? aspect the ั่ ens. some people have searched. Thank you. I want them, the question is saying they're intersecting at one point. All right, so. I changed it a bit to move away from the axis.

@41:09 - Sara Khalil (sasso212@gmail.com)
You're not answering my question.

@41:12 - sara
So y equals, I mean, you would, I don't know.

@41:18 - Sara Khalil (sasso212@gmail.com)
Okay, a constant line can intersect this graph twice if it passed here. Yeah.

@41:25 - sara
Oh, make sure it only intersects once. Once.

@41:28 - Sara Khalil (sasso212@gmail.com)
Yes, this is what I wanted to do. Yes, so I want this line to be at the vertex, so I can just go and dismiss. Okay, there is a y equals k, dismiss, but I don't know what is k. And then I would start seeing, but why is y, I think, wait, y equals five. Yeah, why is k coming to look, anyways, I would start a slider for k. K equals, for example, 6. This is not what I want, right? I want them to intersect at the vertex. So I'd say K equals 7, 0, 8, 0, 9, you know, until I reach the number, which will make them intersect 12. That's too much. So maybe it's 11. See? And then I would zoom in, things like that. While we can do use quadratic formula and discriminants, since they are intersecting at one point only. And all of that, like, in the SAT, the model answer will tell you, do use quadratic formula. And because these are intersecting at one point, then B squared minus 4AC equals 0. And work with that and have all the, maybe some algebraic mistakes, calculation mistakes. But here, I can just directly go and say, okay, this K has to be 3 to make them intersect at one point, you know? Things like that. There are many graphings. Like, this test is 70%. It's 30. 35% Algebra and 35% Advanced Algebra, okay? These parts, which are 70% of the test, mostly can be done on Dismiss, because they're either solved, they're graphing, they're either find the solutions. Most of them, we can use Dismiss on them. Some students use Dismiss from the beginning of the test to the end, but 15% do a little bit not going with Dismiss, because it's geometry, you know, volume, area, and all that. We can still use Dismississ as a calculator, and I can say, I want two times three. It has the keyboard, and it has everything that can be used, and it's there all through the test.

@43:44 - sara
And 15%, the statistics parts, which is problem solving, probability ratios, and all that, those are only 30%.

@43:52 - Sara Khalil (sasso212@gmail.com)
Tell me your question.

@43:55 - sara
Sorry? What were you asking? I wasn't asking. I thought I heard you saying something.

@44:03 - Sara Khalil (sasso212@gmail.com)
No? No, no, no question. Okay, and we have two modules. As I said, there are two for the English. Mine, I have module one, as we said, 35 minutes, 22 questions, and this is the one that's normal. The second one is adapted. Not everyone get the same module two. They differ a bit. Still, 35 minutes, 22. Calculator is allowed all through the test, any calculator. In the test itself, dismissed, and the scientific calculator, and you can convert from dismissed to scientific calculator. You can check. You can maybe install Bluebook to see how a real test looks like.

@44:38 - sara
Bluebook. Bluebook? But not on a tablet or a mobile.

@44:43 - Sara Khalil (sasso212@gmail.com)
It has to be on a PC.

@44:45 - sara
All right. Yeah. To see how a real test looks like and to practice from it.

@44:51 - Sara Khalil (sasso212@gmail.com)
It has practice questions, and it has tests. I think it has from four to 11 tests. You can practice from that as well. Academically, Basically you will rock, but you need to work on the speeds and the faster, like this question, the strategy, this question, the strategy, how to, as they're tricking you, you trick them more, you know, see their trick. That's it. Okay. Yeah.

@45:15 - sara
So nice to meet you, Sara.

@45:17 - Sara Khalil (sasso212@gmail.com)
Yes.

@45:18 - sara
Nice to see you. Enjoy your day.

@45:21 - Sara Khalil (sasso212@gmail.com)
Bye. Bye.

@45:26 - sara
Bye.

@45:27 - Sara Khalil (sasso212@gmail.com)
One sec.

@45:28 - sara
I'm sorry. This is awkward. I'm trying to get back and leave. Okay. Okay. Bye.
$fathom$, v_teacher)
  on conflict (session_id) do update
    set body = excluded.body, filename = excluded.filename, source = excluded.source;

  insert into session_reports (session_id, status, teacher_reflection, form_submitted_at)
  values (v_session, 'draft',
    'First diagnostic, and the headline is that the mathematics is there and the strategy is not. '
    'Five of seven, and she was quick on every one of them — sixteen seconds on the percentage '
    'question, two minutes on the hardest one in the set. What she does not do is look at a '
    'question before working it. Question 1 is 6x + 14 = 2(3x + 7) and she solved for x; question '
    '5 is one identity and she ran a quadratic. Both came out right, so the cost is only time, '
    'but the time is the whole test: two modules, 22 questions, 35 minutes each, and the easy ones '
    'are what pays for the hard ones.'
    || chr(10) || chr(10) ||
    'The two misses are different from each other. Question 4 is knowledge — infinitely many '
    'solutions means the two sides are the same equation, and she did not know it, so a clean page '
    'of algebra had nowhere to go and she guessed. That is one rule and it is fixed in a lesson. '
    'Question 7 is habit: she rearranged correctly and then picked on a matching denominator '
    'without substituting to check. Ten seconds of verification and she has it.'
    || chr(10) || chr(10) ||
    'She is on a TI and lost a minute on question 3 to a window she had to zoom out of. The test '
    'hands her Desmos, and regression and sliders would have answered questions 4, 6 and 7 without '
    'the algebra. That is worth real practice time — she is an IB student, the mathematics is '
    'below her level, and the marks she is going to lose are pace and checking. Bluebook on a PC '
    'for a full test, and the strategy questions before more content.',
    (select ended_at from sessions where id = v_session) + interval '95 minutes')
  on conflict (session_id) do update
    set teacher_reflection = excluded.teacher_reflection,
        form_submitted_at  = excluded.form_submitted_at,
        status             = excluded.status;

  raise notice 'filled the diagnostic form for the 28 August mathematics session';
end
$form$;
