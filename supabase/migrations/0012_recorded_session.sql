-- ============================================================================
--  0012 — the recorded diagnostic, replayed as a session you can open
--
--  On 7 August a teacher ran the English diagnostic with a student over Zoom,
--  one question at a time, thinking out loud.  The transcript of that hour is
--  the best description we have of what this product is for, so it goes in as
--  real data rather than as a document: a question set, a completed session,
--  every answer with the time it took, the teacher's diagnosis on each, and her
--  closing summary.
--
--  It is what the report reads from.  Open the session and the report is the
--  session's own numbers, not a mock-up.
--
--  Two honest gaps, both visible in the seeded data rather than papered over:
--
--    * The paper was a 27-question module; the recording covers 23 of them and
--      the bank holds 18 of those.  Five (Q04, Q10, Q16, Q17, Q19) are in the
--      module but not in either screenshot deck we were given, so they are not
--      in the bank and not in this session.  The session is 18 questions.
--    * The student got 6 wrong out of the 23 discussed.  One of those six
--      (Q10, the WCM films graph) is among the five missing questions, so the
--      seeded session shows 5 wrong out of 18.
--
--  Q01 is added here rather than in 0009 because it is not in the deck we
--  extracted — it comes from the screen recording of the session itself.
--
--  Each item's timestamps come from where the question actually starts in the
--  recording, not from a synthetic clock. That is what lets the write-up page
--  line the transcript up against the questions and put the right words under
--  each one.
-- ============================================================================

-- --------------------------------------------------- the missing first item --
select seed_bank_item(
  'ENG-DIAG-T4-M2-Q01', 'craft_and_structure',
  'Female hyenas remain within their clan and inherit their mother''s rank. As a result, sisters must compete with one another to obtain a ______ position in the hierarchy.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'easy', 'The passage gives the answer twice — "rank" and "hierarchy" — but the options include a plausible near-miss for anyone reading them before the text.',
  '[
    {"label":"A","body":"relative"},
    {"label":"B","body":"dominant"},
    {"label":"C","body":"regular"},
    {"label":"D","body":"secure"}]'::jsonb,
  'B', 'Sisters inherit a rank and compete within a hierarchy, so what they compete for is a dominant position. "Relative" is the trap for anyone who reads the options first: you would not compete merely to know where you stand.',
  'published', 'words_in_context');

update questions set target_seconds = 55 where source_ref = 'ENG-DIAG-T4-M2-Q01';

-- ------------------------------------------------------------- the pre-test --
-- The paper as a reusable set: build it once, run it with every new student.
insert into question_sets (id, created_by, title, subject, description)
values ('11111111-1111-4111-8111-111111111111', null,
        'English Diagnostic — Test 4, Module 2',
        'english',
        'The in-class diagnostic module. Publish the whole set and let the student work through it, then reveal and go through it together.')
on conflict (id) do update set title = excluded.title, description = excluded.description;

insert into question_set_items (set_id, question_id, position)
select '11111111-1111-4111-8111-111111111111', q.id,
       row_number() over (order by q.source_ref)
  from questions q
 where q.source_ref like 'ENG-DIAG-T4-M2-%'
on conflict (set_id, question_id) do nothing;

-- ------------------------------------------------------ the recorded session --
do $seed$
declare
  v_teacher uuid;
  v_student uuid;
  v_session uuid;
  v_item    uuid;
  v_started timestamptz := date_trunc('day', now()) - interval '3 days' + interval '15 hours';
  r         record;
  n         int := 0;
begin
  -- Seeded onto whoever is actually on the platform, so it opens under a real
  -- login. With no teacher or no student yet there is nothing to attach it to.
  select id into v_teacher from profiles where role = 'teacher' order by created_at limit 1;
  select id into v_student from profiles where role = 'student' order by created_at limit 1;
  if v_teacher is null or v_student is null then
    raise notice 'no teacher/student pair yet — demo session not seeded';
    return;
  end if;

  select id into v_session from sessions
   where teacher_id = v_teacher and title = 'English diagnostic — Module 2';

  if v_session is null then
    insert into sessions (teacher_id, student_id, subject, title, scheduled_at,
                          duration_mins, status, started_at, ended_at, teacher_notes)
    values (v_teacher, v_student, 'english', 'English diagnostic — Module 2',
            v_started, 60, 'completed', v_started, v_started + interval '61 minutes',
            'Strong on the scientific passages and on inference — she reasons well and eliminates properly. '
            'The misses cluster in two places. Literary passages: main idea and central-idea questions on a poem '
            'or a novel extract, where she answers what the text does rather than what it says. And grammar, '
            'where she is going on what sounds right rather than on a rule — the ear is good, so the rules will '
            'convert quickly. Two of the five misses were rushing, not knowledge: she read past "distinct" on one '
            'and had the right answer in hand on the Tagore question before talking herself out of it. '
            'Next: targeted practice on literary passages, and the clause and punctuation rules written down.')
    returning id into v_session;
  else
    delete from session_items where session_id = v_session;
  end if;

  for r in
    select * from (values
    ('ENG-DIAG-T4-M2-Q01', 172, 'B', 65, 3, 'solid_reasoning', 'Started on "relative" from the options alone, then went back to the text and let "inherit their mothers rank" and "compete" overturn it. That self-correction is the habit worth keeping.', 'First thought relative because I jumped to the options. Then I saw inherit their mothers rank — you would compete to win something, so dominant.'),
    ('ENG-DIAG-T4-M2-Q02', 259, 'D', 40, 3, 'solid_reasoning', 'Eliminated cleanly and got there without knowing "zealot" exactly. Worth writing the meanings down as we meet them.', 'Not A, not C. D, skeptics. Advocates makes no sense because you are not saying what you advocate for.'),
    ('ENG-DIAG-T4-M2-Q03', 360, 'B', 35, 2, 'solid_reasoning', 'Picked B without knowing the word, purely by killing the other three. "As a result" plus "outspoken" plus "controversial" is what gives it away.', 'Not amateur, people came before her. Not a curiosity. I do not know what polemicist means but the others do not fit.'),
    ('ENG-DIAG-T4-M2-Q05', 683, 'D', 95, 3, 'solid_reasoning', 'Named the elimination rule herself — extreme language is wrong — and applied it. Read both texts properly before answering.', 'A and B are the opposite of what is argued. C fails because self-care is not in text 1 and nature is not in text 2. D argues less strongly, which usually means it is right.'),
    ('ENG-DIAG-T4-M2-Q06', 835, 'C', 60, 2, 'concept_gap', 'Main idea is the central message, not what the passage does. C is true of the poem — the spider does prompt reflection — but the point is the soul seeking connection. She reached D once we broke the metaphor down.', 'Speakers observations of a spider inspire them to reflect. Not B. I think C.'),
    ('ENG-DIAG-T4-M2-Q07', 1197, 'A', 55, 2, 'concept_gap', 'Detail questions want the paraphrase of the passage, not the one line that caught the eye. She anchored on "pushing away the memories" and missed that his whole character is being described.', 'It is not B, he is not overcome by grief. Suppress the past or warm disposition — I will say A.'),
    ('ENG-DIAG-T4-M2-Q08', 1531, 'D', 39, 3, 'solid_reasoning', 'Clean and fast. Spotted "unique specialty" and "shedding new light" as the signal for unconventional.', 'No policy, no strategy, nothing negative. Shedding new light implies not many people are in this field.'),
    ('ENG-DIAG-T4-M2-Q09', 1613, 'B', 53, 1, 'careless_error', 'She had C in hand — said it "could very well be C" — and stayed on B. Rushed the first read. Her instinct was right; the second-guess went the wrong way.', 'I think it is B, but it could very well be C. B is her being torn between home and the larger world.'),
    ('ENG-DIAG-T4-M2-Q11', 2090, 'C', 59, 2, 'misread_question', 'Read past "distinct". Thought the question asked what proves the two belong to the Peruvian marinera, not what proves they differ. Found D immediately once she reread the stem.', 'I thought the question asked what proves these are Peruvian styles. I did not read distinct.'),
    ('ENG-DIAG-T4-M2-Q12', 2197, 'B', 64, 3, 'solid_reasoning', 'Went straight for the option with the numbers and the link to people alive today. Exactly the right instinct on a strengthen question.', 'B has the facts, the numbers and "alive today", so it connects them directly.'),
    ('ENG-DIAG-T4-M2-Q13', 2300, 'D', 103, 3, 'solid_reasoning', 'Slowest question of the session and worth every second. Separated inference from fact by herself: A and B are facts, so they cannot be what the passage suggests.', 'Not B, that is a fact, not an inference. A is also a fact. C — terrestrial phenomena were never discussed.'),
    ('ENG-DIAG-T4-M2-Q14', 2459, 'C', 84, 3, 'solid_reasoning', 'Saw that "because" was doing the work and that the reason had to benefit the groupers, not describe the sharks.', 'B is irrelevant — you are still dead either way. They would only travel if it benefits them, which is the tides.'),
    ('ENG-DIAG-T4-M2-Q15', 2626, 'A', 39, 3, 'solid_reasoning', 'Rejected C as too obvious to be an inference — that is the right test on this question type.', 'C is a no-brainer, anyone can infer it, so it is not an implication. D — Earth is never mentioned.'),
    ('ENG-DIAG-T4-M2-Q18', 2813, 'A', 39, 1, 'concept_gap', 'Went to A on sound rather than rule. Once we did dependent versus independent clauses she got to C and could say why. This is the pattern across the grammar questions — the ear is good, the rules are not there yet.', 'Not B. It is A. (After the rule: it has to be C, the punctuation is proper and the dash pair is equal.)'),
    ('ENG-DIAG-T4-M2-Q20', 3097, 'A', 46, 3, 'solid_reasoning', 'Correct, and for the right reason — a transition in the middle of a sentence takes commas both sides, and the title cannot be split from the name.', 'Not B, not D. Deborah Gordon, however — reads both ways, but it is A. C would be a run-on.'),
    ('ENG-DIAG-T4-M2-Q21', 3162, 'B', 14, 3, 'solid_reasoning', 'Fastest answer of the session and right. Tense consistency spotted instantly; the past-perfect distinction we then worked through was new to her.', 'Were printed as a book and used. B.'),
    ('ENG-DIAG-T4-M2-Q22', 3291, 'C', 82, 3, 'solid_reasoning', 'Rejected A because it explains nothing, and got that the colon is doing explanatory work. Strong reasoning on punctuation she could not have named a rule for.', 'A is one continuous thing and does not explain. C is the colon with the explanation.'),
    ('ENG-DIAG-T4-M2-Q23', 3415, 'D', 35, 3, 'solid_reasoning', 'Saw that B and C imply a contradiction that the passage does not contain. Then versus now is a time contrast, and "Today" carries it.', 'B and C are contradicting. Meanwhile does the same. Today just agrees with the statement.')
    ) as t(source_ref, at_seconds, answered, elapsed, confidence, diagnosis, teacher_note, student_reasoning)
  loop
    n := n + 1;

    insert into session_items (
      session_id, question_id, student_id, sequence_no, status,
      published_at, first_viewed_at, answered_at, revealed_at,
      selected_option, eliminated_options, student_confidence, student_reasoning,
      revealed_result, revealed_correct_option, revealed_explanation)
    select v_session, q.id, v_student, n, 'revealed',
           v_started + (r.at_seconds || ' seconds')::interval,
           v_started + (r.at_seconds || ' seconds')::interval,
           v_started + (r.at_seconds + r.elapsed || ' seconds')::interval,
           v_started + (r.at_seconds + r.elapsed + 45 || ' seconds')::interval,
           r.answered::answer_option, '{}', r.confidence, r.student_reasoning,
           case when r.answered = k.correct_option::text then 'correct' else 'incorrect' end::grade_result,
           k.correct_option, k.explanation
      from questions q
      join question_keys k on k.question_id = q.id
     where q.source_ref = r.source_ref
    returning id into v_item;

    if v_item is null then
      raise exception 'seed session: % is not in the bank', r.source_ref;
    end if;

    insert into session_item_assessments (session_item_id, is_correct, elapsed_seconds,
                                          diagnosis, teacher_note)
    select v_item,
           r.answered = k.correct_option::text,
           r.elapsed,
           r.diagnosis,
           r.teacher_note
      from session_items si
      join question_keys k on k.question_id = si.question_id
     where si.id = v_item;

  end loop;

  raise notice 'seeded % items into the recorded session', n;
end
$seed$;
