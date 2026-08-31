-- ============================================================================
--  0014 — the recorded session's write-up
--
--  0012 seeded what happened; this is what the teacher made of it. The two
--  written columns of the grid, one row per domain, and the Overall Diagnostic
--  Summary underneath — all of it her own reading, taken from the recording.
--
--  The computed halves are deliberately absent: Student Performance, Accuracy
--  Rate and the recommended priority are derived from the answers every time
--  the report is opened, so there is nothing here that could disagree with them.
-- ============================================================================

do $writeup$
declare v_session uuid;
begin
  select id into v_session from sessions
   where title = 'English diagnostic — Module 2'
   order by created_at limit 1;

  if v_session is null then
    raise notice 'recorded session not seeded — nothing to write up';
    return;
  end if;

  insert into session_domain_notes (session_id, domain, strengths, gaps) values
  (v_session, 'information_and_ideas',
   'Inference is a genuine strength. She separated inference from fact unprompted on the solar-activity question — "not B, that is a fact, not an inference" — and rejected the too-obvious option on the coronal mass ejection one for the same reason.',
   'Central ideas and details on literary passages. She answers what the passage does rather than what it says: on the Whitman poem she took "observation prompts reflection", which is true of it without being its point. On the Tagore question she named the right answer aloud and talked herself out of it.'),

  (v_session, 'craft_and_structure',
   'Words in context is the strongest thing here. She got "polemicist" and "skeptics" without knowing either word, purely by killing the other three. She also names her own rules — extreme language in an option means it is wrong — and applies them.',
   'Nothing missed in this session. The habit worth adding is writing down the meanings as we meet them; there is no vocabulary list to learn from, so it has to be collected while reading.'),

  (v_session, 'expression_of_ideas',
   'Read the transition correctly and said why: then-versus-now is a contrast in time, not a reversal, so "Nevertheless" and "Instead" are both wrong.',
   'One question in this module is not enough to judge on. Needs a set that covers rhetorical synthesis properly.'),

  (v_session, 'standard_english_conventions',
   'The ear is good. She reasoned her way to the colon on the Harlem Renaissance question — "A is one continuous thing and does not explain" — without being able to name the rule she was using.',
   'She is going on what sounds right rather than on a rule, and does not yet separate dependent from independent clauses, which is exactly what the dash question turned on. Once the rules are written down this converts quickly.')
  on conflict (session_id, domain) do update
    set strengths = excluded.strengths, gaps = excluded.gaps;

  insert into session_reports (session_id, status, time_management, engagement, summary, published_at)
  values (
    v_session, 'published',
    'Comfortably inside the time and not under any clock pressure. The two rushed answers were reading too fast, not running out of time — which is a different fix.',
    'Engaged throughout and thinks out loud readily, which is what made the session diagnostic at all. Her confidence tracks her accuracy honestly: she flagged not-sure on the punctuation question and on the Tagore one, and both were misses.',
    'Strong on the scientific passages and on inference. The misses cluster in the literary questions and in grammar, and two of them were rushing rather than not knowing. Next: targeted practice on literary passages — poems and novel extracts for main idea, central idea and command of evidence — and the clause and punctuation rules written down so the ear has something to check itself against.',
    now())
  on conflict (session_id) do update
    set time_management = excluded.time_management,
        engagement      = excluded.engagement,
        summary         = excluded.summary,
        status          = excluded.status,
        published_at    = excluded.published_at;

  raise notice 'wrote up the recorded session';
end
$writeup$;
