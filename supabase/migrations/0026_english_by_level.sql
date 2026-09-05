-- ============================================================================
--  0026 — English is three tests: easy, medium, hard
--
--  The bank was organised by where a question came from — the in-class 25Q
--  paper, Test 4 Module 1, Test 4 Module 2 — because that is how the source
--  documents arrived.  It is not how the teaching works.  A teacher opens a
--  session, watches the student for a few questions, and decides one thing:
--  is this the right level?  So the content is filed the way that decision is
--  made, and English holds exactly three tests.
--
--    Easy    the twenty items of Test 4 Module 1
--    Medium  twenty items new to the bank, loaded here
--    Hard    the twenty items of Test 4 Module 2 that the deck shows
--
--  The grouping is the teachers' own — it comes from the level document they
--  marked up, section by section — so this migration does not invent it, it
--  records it.  Two consequences follow, and both are the point:
--
--    * DIFFICULTY FOLLOWS THE TEST.  An item in the easy test is easy.  The
--      old per-item labels were assigned when the items were transcribed and
--      disagreed with the teachers' own sorting on about half of them; the
--      teachers' sorting wins.
--
--    * EVERY ITEM SAYS WHY.  questions.difficulty_rationale is not decoration
--      here: it is the sentence a teacher reads when deciding whether to move
--      a student up, and it is the only place the reasoning behind the level
--      is written down.  Every one of the sixty carries one, rewritten below
--      against the level it now sits at rather than the label it used to have.
--
--  The eight items the teachers commented on directly in the document keep
--  their reasoning almost word for word (Q01–Q08 of the easy test).
--
--  question_sets gains a `level` column, so a test is the level rather than
--  merely being named after it — the session RPCs in 0027 look a test up by
--  level, and matching on a title would be a bug waiting for a rename.
--
--  Nothing is deleted.  The in-class 25Q paper and its items stay in the bank
--  where a teacher can still find them under All questions; what changes is
--  that they are no longer a paper anybody can run, because a session runs a
--  level and there are three.
-- ============================================================================

-- ---------------------------------------------------------------- level ----
alter table question_sets add column if not exists level text
  check (level is null or level in ('easy', 'medium', 'hard'));

comment on column question_sets.level is
  'Which of the three English tests this is. Null for anything that is not one of them; unique among active sets, so a session can look one up by level.';

create unique index if not exists question_sets_level_idx
  on question_sets (subject, level) where level is not null and is_active;

-- -------------------------------------------------------------- loader ----
-- Registers one level test and fills it with named bank items, in the order
-- given.  Explicit refs rather than a source_ref prefix (the way seed_paper
-- works): the easy and hard tests are drawn from a paper the teachers did not
-- take whole, so "everything with this prefix" would put back the items they
-- left out.
create or replace function public.seed_level_test(
  p_level       text,
  p_title       text,
  p_description text,
  p_refs        text[]
) returns uuid
language plpgsql
as $fn$
declare
  sid  uuid;
  n    int;
  seen int;
begin
  if p_level not in ('easy', 'medium', 'hard') then
    raise exception 'a level test is easy, medium or hard';
  end if;

  insert into question_sets (created_by, title, subject, description, kind, level, source_ref)
  values (null, p_title, 'english', p_description, 'test', p_level, 'ENG-LEVEL-' || upper(p_level))
  on conflict (source_ref) where source_ref is not null do update set
    title       = excluded.title,
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
    raise exception '% test: % of % questions found in the bank', p_level, seen, n;
  end if;

  -- The level is the item's difficulty. Said here rather than left to each
  -- loader, so the two can never drift.
  update questions q
     set difficulty = p_level::difficulty_level,
         target_seconds = case p_level when 'easy' then 55 when 'medium' then 75 else 100 end
    from question_set_items i
   where i.set_id = sid and i.question_id = q.id;

  return sid;
end $fn$;

revoke execute on function public.seed_level_test(text, text, text, text[])
  from anon, authenticated;

comment on function public.seed_level_test(text, text, text, text[]) is
  'Registers one of the three English level tests and fills it from the bank by source_ref, in order. Sets every item''s difficulty to the level.';

-- ================================================================ MEDIUM ===
-- Twenty items new to the bank.  They are numbered as the teachers' document
-- numbers them — 1, 2, 3, 6, 7, … — and the gaps are the document's own, kept
-- because a teacher saying "look at 19" has to mean one question.
do $seed$
begin

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q01', 'craft_and_structure',
  'The percentage of US forest land that a 2023 federal report identified as being either mature or old growth exceeds other recent estimates. Given how little ______ there is among scientists regarding the scope of these categories, this discrepancy shouldn''t be surprising: forest researchers regularly dispute one another''s classifications.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'medium',
  'Three of the four options are ordinary words for scholarly activity, and only the clause after the colon separates "not much agreement" from "not much discussion". A student who answers at the blank picks deliberation.',
  '[
    {"label":"A","body":"vigilance"},
    {"label":"B","body":"interest"},
    {"label":"C","body":"deliberation"},
    {"label":"D","body":"consensus"}]'::jsonb,
  'D', 'The colon explains the blank: researchers "regularly dispute one another''s classifications", so what is in short supply is agreement. "Deliberation" is the near miss — the scientists are plainly deliberating; what they are not doing is agreeing.',
  'published', 'words_in_context');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q02', 'craft_and_structure',
  'Economist Jingting Fan argues that the effects of international trade may display spatial variation at sub-national levels. For instance, imported goods may reduce expenses for a country''s average consumer, but for consumers living far from ports, high intranational transport costs could ______ the price advantages associated with imports.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'medium',
  'Three options are near-synonyms for "misjudge", so the student has to notice that the thing filling the blank is a cost rather than a person before the sentence can decide it.',
  '[
    {"label":"A","body":"underestimate"},
    {"label":"B","body":"misconstrue"},
    {"label":"C","body":"denigrate"},
    {"label":"D","body":"nullify"}]'::jsonb,
  'D', '"But" sets the transport costs against the saving, so the costs have to cancel it: nullify. The other three are things a person does to an idea — misjudge it, misread it, disparage it — and a transport cost can do none of them to a price advantage.',
  'published', 'words_in_context');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q03', 'craft_and_structure',
  'As discussed by scholar Anna Mladentseva, many artworks produced in the mid-1990s to the early 2000s exclusively for exhibition on the internet, such as Sinae Kim''s Genesis (2001), have become inaccessible because viewing them requires the use of ______ software (most notably Adobe Flash, discontinued in 2021).',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'medium',
  'Two options — arcane and defunct — both fit the mood of abandoned internet art, and only the word "discontinued" inside the parenthesis tells them apart.',
  '[
    {"label":"A","body":"extraneous"},
    {"label":"B","body":"arcane"},
    {"label":"C","body":"defunct"},
    {"label":"D","body":"ubiquitous"}]'::jsonb,
  'C', 'The parenthesis names the software and says it was discontinued, so the word has to mean "no longer in existence" — defunct. "Arcane" is the trap: obscure software would still run, and it is the software being gone rather than being obscure that makes the artworks unviewable.',
  'published', 'words_in_context');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q06', 'craft_and_structure',
  'In 2011 Stephen D. Simpson and colleagues published a study concluding that ocean acidification has a strong effect on the behavior of Amphiprion percula, a species of fish. However, Simpson and colleagues'' study relied on a mean sample size of only about 26 fish. In a 2022 review of various scientists'' conclusions about the impacts of ocean acidification on fish behavior, Jeff C. Clements and colleagues caution that relying on such a relatively small sample size can increase the potential for biased analysis. Such analysis, in turn, can contribute to reports of exaggerated effects.',
  null,
  'Which choice best describes the overall structure of the text?',
  'medium',
  'The passage names two studies and a fish, so three of the four options describe something it genuinely contains. Only one of them describes what it does with any of that.',
  '[
    {"label":"A","body":"It states a similarity between two scientific studies, then notes a difference between them."},
    {"label":"B","body":"It describes a characteristic of a fish species, then explains why that characteristic is noteworthy."},
    {"label":"C","body":"It presents the result of a study, then raises a potential concern related to that result."},
    {"label":"D","body":"It summarizes a problem that scientists are investigating, then provides a possible solution to that problem."}]'::jsonb,
  'C', 'Sentence one is the 2011 finding; everything after "However" is the sample-size worry the 2022 review raises about it. A calls the second study a comparison, which it is not, and D calls a caution a solution.',
  'published', 'text_structure_and_purpose');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q07', 'craft_and_structure',
  'Researchers César A. Hidalgo, Elisa Castañer, and Andres Sevtsuk created a computer model to predict the mix of gyms, clothing stores, and other businesses found in a given neighborhood. How we define a neighborhood and its boundaries is subjective, so the team used a clustering algorithm to locate dense groupings of amenities that represent human identified neighborhoods like Boston''s Union Square. The predictive model, which incorporates this algorithm, is sure to be invaluable in determining the optimal mix of a city''s amenities.',
  'The predictive model, which incorporates this algorithm, is sure to be invaluable in determining the optimal mix of a city''s amenities.',
  'Which choice best describes the function of the underlined sentence in the text as a whole?',
  'medium',
  'Every option names something the passage really says; the work is holding on to which sentence is underlined while reading them, and D describes the sentence immediately before it.',
  '[
    {"label":"A","body":"It praises an algorithm''s accuracy in identifying neighborhood boundaries."},
    {"label":"B","body":"It emphasizes the potential utility of the team''s model."},
    {"label":"C","body":"It summarizes trends in recent urban development in Boston."},
    {"label":"D","body":"It suggests a difficulty associated with analyzing neighborhoods that the research team attempted to overcome."}]'::jsonb,
  'B', '"Sure to be invaluable" is a claim about what the model will be worth, so the sentence states its promise. A praises the algorithm rather than the model built on it, and D is the previous sentence — the subjectivity of neighborhood boundaries.',
  'published', 'text_structure_and_purpose');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q08', 'craft_and_structure',
  'Text 1
Scholarship today overrepresents experimentally fragmented narrative structures, such as that of William Faulkner''s As I Lay Dying, beyond the degree to which they actually influenced fiction in the United States during the modernist period (roughly 1900-1945). Meanwhile, Ellen Glasgow''s Barren Ground, whose coherent, linear narrative structure recalls the fiction of previous centuries, attracts woefully little attention from scholars of modernism.

Text 2
Distant reading, or computer-assisted quantitative analysis of massive collections of digitized texts, can reveal stylistic elements that have heretofore escaped notice, despite being shared by numerous texts from the modernist period. For too long, scholars have focused on narrative fragmentation versus coherence, inhibiting inquiry into other points of stylistic correspondence among works that would enrich our understanding of the modernist canon.',
  null,
  'Based on the texts, both the author of Text 1 and the author of Text 2 would most likely agree with which statement about scholarship on the modernist period in the United States?',
  'medium',
  'The agreement has to be built out of two complaints that are about different things on the surface, and the strongest distractor uses Text 2''s own vocabulary the wrong way round.',
  '[
    {"label":"A","body":"Its primary methods for analyzing fiction written in the period are growing obsolete as computer technology advances."},
    {"label":"B","body":"Instead of engaging in unproductive debates, it should work to rehabilitate the reputations of neglected modernist works."},
    {"label":"C","body":"At present, it only partially captures the stylistic dimensions of the fiction written in the period."},
    {"label":"D","body":"It must widen its focus to include aspects of modernist fiction beyond style, a productive but overrepresented site of inquiry."}]'::jsonb,
  'C', 'Text 1 says one narrative style is overrepresented and another neglected; Text 2 says the fragmentation-versus-coherence focus is blocking other stylistic questions. Both amount to "the picture is incomplete". D reverses Text 2, which wants more inquiry into style, not less.',
  'published', 'cross_text_connections');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q09', 'information_and_ideas',
  'Why do some people with high incomes vote for politicians supporting higher taxes on those with high incomes like themselves? Economists Benjamin Enke et al. propose that values are a luxury good: that is, the higher one''s income, the more weight one has the liberty to assign to one''s values when voting. Thus, Enke et al. suggest that although the behavior of high-income earners who advocate for higher taxes may seem counterintuitive, such people likely do so because they feel enabled by their economic security to take a stance they think is morally correct.',
  null,
  'Which choice best states the main idea of the text?',
  'medium',
  'The right answer is the most abstract of the four and every distractor is built out of the passage''s own terms, so the student has to be sure what "values are a luxury good" actually claims.',
  '[
    {"label":"A","body":"A group of economists asserts that people with relatively high incomes are consequently enabled to take certain considerations into account when voting."},
    {"label":"B","body":"A team of economists finds that people who vote for higher taxes on those with high incomes are likely to think their moral values coincide with their material interests."},
    {"label":"C","body":"According to a group of economists, politicians who support higher taxes on those with high incomes must convince a sufficient number of people with such incomes to vote against their material interest if the politicians are to be elected."},
    {"label":"D","body":"According to a team of economists, the higher a voter''s income, the more likely that voter''s values are to conflict with their material interests."}]'::jsonb,
  'A', 'Enke et al.''s claim is that income buys the liberty to vote your values, which is A in flatter words. B has the voters believing values and interests coincide, when the puzzle the passage opens with is that they do not; D turns a liberty into a likelihood of conflict; and C is about how politicians get elected, which the text never discusses.',
  'published', 'central_ideas_and_details');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q10', 'information_and_ideas',
  'Studies of cougar population density

Study authors | Study publication year | Location | Minimum density (cougars per 100 square kilometers) | Maximum density (cougars per 100 square kilometers)
Robin E. Russell et al. | 2012 | Montana (United States) | 3.70 | 6.70
Sean M. Murphy et al. | 2019 | New Mexico (United States) | 0.84 | 1.65
Richard A. Beausoleil et al. | 2016 | Washington (United States) | 1.90 | 2.40
Gregory A. Davidson et al. | 2014 | Oregon (United States) | 2.31 | 5.50

Studies of the population density of cougars (Puma concolor) have yielded a range of results, which may in part reflect natural variations in the resources that cougars need to survive. For example, the difference between the maximum population density reported by Sean M. Murphy et al. and that reported by Robin E. Russell et al. may indicate that ______',
  null,
  'Which choice most effectively uses data from the table to complete the example?',
  'medium',
  'Two rows out of four are the relevant ones and the table does not say which: the sentence names the authors, not the states, so the student has to look the names up before any number means anything.',
  '[
    {"label":"A","body":"the cougar habitat in Washington can support more than 1.90 individuals per 100 square kilometers."},
    {"label":"B","body":"the cougar habitat in New Mexico cannot support as many individuals as can the cougar habitat in Montana."},
    {"label":"C","body":"cougar habitat makes up a greater proportion of the overall land area in Montana than is the case in New Mexico."},
    {"label":"D","body":"there are more cougars overall in both Oregon and Washington than there are in New Mexico."}]'::jsonb,
  'B', 'The example names two studies: Murphy in New Mexico, maximum 1.65, and Russell in Montana, maximum 6.70. The sentence is about the resources a place offers, so the reading is that New Mexico habitat supports fewer cougars. A and D read rows the example did not name, and C swaps density for how much of the land is habitat.',
  'published', 'command_of_evidence_quantitative');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q11', 'information_and_ideas',
  'Joel Brown and collegues showed that high moonlight intensity inhibits the activity of the Arizona Pocket mouse (Perognathus amplus), a finding explicable in terms of benefits and costs: greater lunar intensity may not enable the mice to increase foraging success enough to offset the higher chance of detection by predatory owls and hawks. Though many other nocturnal mammals respond to lunar intensity variations similarly to Arizona Pocket mice, Azara''s night monkey''s (Aotus azarae) display the opposite pattern, as their heavy reliance on visual foraging results in a different balance of reward and risk.',
  null,
  'Based on the text, why do Azara''s night monkeys respond differently to high lunar intensity than the Arizona Pocket mouse?',
  'medium',
  'The answer is not stated — "a different balance of reward and risk" has to be turned into which way the balance tips — and the strongest distractor is that same idea with one extra claim attached that the text does not support.',
  '[
    {"label":"A","body":"In such conditions, the chance of detection by predators declines for Azara''s night monkeys but rises for Arizona Pocket mouse."},
    {"label":"B","body":"Although the risk of activity in such conditions are greater for Azara''s night monkeys than they are for Arizona Pocket mice, the rewards are also greater for Azara''s night monkeys."},
    {"label":"C","body":"In such conditions, the cost of activity are lower relative to the benefits for Azara''s night monkeys than they are for Arizona Pocket mice."},
    {"label":"D","body":"Due to their heavy reliance on visual foraging, Azara''s night monkeys experience a reduction in their foraging success in such conditions, whereas Arizona Pocket mice experience no change in their foraging success."}]'::jsonb,
  'C', 'The passage frames both animals as one cost-benefit sum and says the monkeys'' visual foraging gives "a different balance of reward and risk". Since the monkeys become more active in bright moonlight, the benefits must outweigh the costs for them where they do not for the mice. B invents a greater risk the text never claims, and D has the monkeys foraging worse in the very light they rely on.',
  'published', 'inferences');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q13', 'information_and_ideas',
  'Some pharmaceuticals contain titanium dioxide nanoparticles (TiO2-NPs) which can leach into waterways and soils via wastewater. In a 2014 study, Cheng Tan and Wen-Xiong Wang found that TiO2-NPs can accumulate in the bodies of water fleas (Daphnia magna). While bioaccumulation of manufactured nanoparticles may be inherently worrisome, it has been hypothesized that bioaccumulation in invertebrates like D. magna could serve a valuable proxy role, obviating the need for manufacturers to conduct costly and intrusive sampling of vertebrate species — such as Chinook salmon (Oncorhynchus tshawytscha), commonly used in regulatory compliance testing — for nanoparticle bioaccumulation, as environmental protection laws currently require.',
  null,
  'Which finding, if true, would most directly support the hypothesis presented in the text?',
  'medium',
  'Three options are true-sounding advantages of working with water fleas, and only one of them is about the thing the hypothesis actually needs, which is that the two species agree.',
  '[
    {"label":"A","body":"In comparable environments, D. magna and O. tshawytscha display comparable rates of TiO2-NPs uptake."},
    {"label":"B","body":"Compared with O. tshawytscha, D. magna can tolerate significantly higher TiO2-NPs concentrations without displaying any negative effects."},
    {"label":"C","body":"It is easier to detect low and harmless concentrations of TiO2-NPs in D. magna than it is to detect high and harmful concentrations of TiO2-NPs in O. tshawytscha."},
    {"label":"D","body":"TiO2-NPs concentrations in D. magna tend to vary more from individual to individual than do TiO2-NPs concentrations in O. tshawytscha when the species are exposed to similar levels of TiO2-NPs."}]'::jsonb,
  'A', 'A proxy is only a proxy if measuring the water flea tells you what the salmon would have told you, so the finding that supports it is matching uptake rates. B and C say the flea is easier to work with, which is not the same thing, and D undermines the proxy rather than supporting it.',
  'published', 'command_of_evidence_textual');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q14', 'information_and_ideas',
  'Neurobiologists Laura Cuaya, Raúl Hernández-Pérez, and colleagues investigated the language detection abilities of eighteen dogs of various ages. The researchers monitored the brain activity of Maverick (a 117-month-old border collie), Mini (a 126-month-old mixed breed), and other dogs while the animals listened to three recordings: one of The Little Prince being read in Spanish, the second in Hungarian, and a third made up of short, randomly selected fragments of the first two, scrambled so that they didn''t resemble human speech. Each of the dogs was familiar with either Spanish or Hungarian, but not both. The team concluded that the younger the dog, the worse it may be at differentiating between familiar and unfamiliar languages.',
  null,
  'Which finding from the study, if true, would most directly support the team''s conclusion?',
  'medium',
  'All four options are plausible results and three of them mention age, so the student has to hold the conclusion''s exact claim — telling two languages apart — against each one.',
  '[
    {"label":"A","body":"As the age of the dog scanned decreased, so did the amount of brain activity in response to hearing the language the dog was accustomed to or the other language, but not in response to hearing the scrambled recording."},
    {"label":"B","body":"The similarity between the pattern of brain activity a dog showed in response to hearing the scrambled recording and the pattern it showed in response to hearing the language it was not accustomed to was lowest among younger dogs."},
    {"label":"C","body":"Dogs showed a different pattern of brain activity when hearing the language they were accustomed to than when hearing the other language, and the difference in brain activity decreased as the age of the dog scanned decreased."},
    {"label":"D","body":"Although the dogs'' general hearing sensitivity declined with age, dogs of all ages showed more brain activity in response to hearing the language they were accustomed to than in response to hearing the other language."}]'::jsonb,
  'C', 'The conclusion is about telling the two languages apart, so the finding that supports it has to be a gap between the two language recordings that narrows in younger dogs — which is C exactly. A is about overall activity rather than the difference between the two, B is about the scrambled recording, and D reports no age effect on the discrimination at all.',
  'published', 'command_of_evidence_textual');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q15', 'information_and_ideas',
  'Quasars — such as the Markarian 231 quasar, located in Ursa Major — are extremely luminous galactic nuclei powered by supermassive black holes. Quasars range in age, with approximately 200 of them known to have developed within the first billion years of the formation of the universe. Cosmologists have long wondered how any quasars could have formed so early in the universe''s evolution given that conditions are believed to have been ill-suited to their creation, which suggests that ______',
  null,
  'Which choice most logically completes the text?',
  'medium',
  'The passage ends on a contradiction and the answer is the general conclusion drawn from it, while three distractors offer specific claims about particular quasars that read like science but do not follow from anything on the page.',
  '[
    {"label":"A","body":"the Markarian 231 quasar is likely less massive than quasars that formed more than a billion years after the beginnings of the universe."},
    {"label":"B","body":"quasars that formed in the early universe are likely not as luminous as those that formed later."},
    {"label":"C","body":"the Markarian 231 quasar is thought to have formed less than a billion years after the beginnings of the universe."},
    {"label":"D","body":"some aspect of the scientific understanding of quasar formation or the early universe may be incomplete."}]'::jsonb,
  'D', 'Two hundred quasars exist that the accepted conditions say should not, so what follows is that the accepted account is missing something. A, B and C add facts about particular quasars that the passage gives no basis for.',
  'published', 'inferences');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q16', 'standard_english_conventions',
  'Star actress Kiki Omeili, who has appeared in 47 Nollywood films, is one of numerous luminaries to be pictured in Nigerian portraitist Iké Udé''s exhibition Nollywood Portraits. ______ referred to Nollywood — Nigeria''s $3 billion film industry — as "Africa''s vivid mirror par excellence," honors its legacy with his vivid classical portraits of Omeili and her peers.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium',
  'The main verb sits at the far end of a sentence carrying a dash-bracketed aside and a quotation, so the student has to strip the sentence back to its bones before the missing piece is visible.',
  '[
    {"label":"A","body":"Udé has"},
    {"label":"B","body":"Udé, having"},
    {"label":"C","body":"Udé, has"},
    {"label":"D","body":"Udé"}]'::jsonb,
  'B', 'The sentence already has its main verb — "honors" — so the blank cannot supply a second one. "Udé, having referred to Nollywood … as ‘Africa''s vivid mirror par excellence,'' honors its legacy" puts the reference in a participial phrase between commas and leaves one finite verb standing. A and D give the sentence two verbs, and C strands one after a comma with nothing to attach it to.',
  'published', 'form_structure_and_sense');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q17', 'standard_english_conventions',
  'Researchers Tammy Kernodle and Christina Zanfagna have lent their expertise on Black history and music to an important new ______ Timeline of African American Music, a digital resource that traces the development of individual musical genres (such as swing and bebop) while also revealing the connections between them.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium',
  'Three of the four options are legitimate boundary marks, and the test is whether what follows them can stand as a sentence — which it cannot, though it is long enough to look like one.',
  '[
    {"label":"A","body":"initiative the"},
    {"label":"B","body":"initiative; the"},
    {"label":"C","body":"initiative: the"},
    {"label":"D","body":"initiative. The"}]'::jsonb,
  'C', 'What follows the blank names the initiative, and a colon is what introduces a naming after a complete clause. A semicolon and a full stop both promise a second independent clause, and "the Timeline of African American Music, a digital resource that traces…" is not one; A runs the title on with no punctuation at all.',
  'published', 'boundaries');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q19', 'standard_english_conventions',
  'While the greater adjutant can be found in places like the Inner Gulf of Thailand and Manchar Lake in Pakistan, more than 80 percent of this endangered stork species is found in Assam, India. There, wildlife biologist Dr. Purnima Devi Barman is on the front lines of conservation efforts ______ through community involvement and scientific study, aim to bring adjutants back from near extinction.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium',
  'The closing comma is already printed after "study", so the answer is decided by matching it — which is easy to miss when the three wrong options are exactly the marks students reach for around a long insertion.',
  '[
    {"label":"A","body":"that—"},
    {"label":"B","body":"that;"},
    {"label":"C","body":"that,"},
    {"label":"D","body":"that:"}]'::jsonb,
  'C', '"that … aim to bring adjutants back" is a relative clause, and "through community involvement and scientific study" is dropped into the middle of it. A phrase interrupting a clause is fenced by a comma at each end, and the closing one is already there. A dash, a semicolon and a colon each cut the clause off from its own verb.',
  'published', 'boundaries');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q20', 'standard_english_conventions',
  'Nicholas Galanin is known for using video and photography to explore questions of authenticity in the identification and presentation of Native art. The acclaimed Tlingit/Aleut artist was awarded a 2013 fellowship by the Eiteljorg Museum, whose extensive collection of artworks by Indigenous peoples of the Americas and other artists of the American West ______ among the best in the world.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium',
  'Twenty words of plural nouns separate the singular subject from its verb, and three of the four options agree with the nearest noun rather than the right one.',
  '[
    {"label":"A","body":"have been ranked"},
    {"label":"B","body":"rank"},
    {"label":"C","body":"are ranked"},
    {"label":"D","body":"ranks"}]'::jsonb,
  'D', 'The subject of the blank is "collection", which is singular, so the verb is "ranks". Everything between the two — artworks, peoples, artists — is plural and is there to pull the ear the other way.',
  'published', 'form_structure_and_sense');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q22', 'expression_of_ideas',
  'If you could travel in a spaceship to Leda, one of Jupiter''s many moons, you''d find a moon with a prograde orbit. This means that Leda orbits Jupiter in the same direction that Jupiter rotates on its axis. ______ at Ananke, another Jovian moon, you''d find an example of a retrograde orbit, with the moon revolving around Jupiter in the opposite direction.',
  null,
  'Which choice completes the text with the most logical transition?',
  'medium',
  'All four transitions read smoothly out loud; only noticing that Ananke''s orbit is the opposite of Leda''s rules three of them out.',
  '[
    {"label":"A","body":"For example,"},
    {"label":"B","body":"Elsewhere,"},
    {"label":"C","body":"Specifically,"},
    {"label":"D","body":"In other words,"}]'::jsonb,
  'B', 'The sentence goes to a different moon and finds the opposite orbit, so the transition has to move the reader somewhere else. "For example" and "Specifically" would make Ananke an instance of Leda''s prograde orbit, which it is not, and "In other words" would make it a restatement.',
  'published', 'transitions');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q24', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

Horridus is the nickname of a dinosaur fossil specimen from the Late Cretaceous period.
The Late Cretaceous period ended more than 65 million years ago.
Horridus is a member of the genus Triceratops.
Horridus is on display at the Melbourne Museum.
The Melbourne Museum is in Melbourne, Australia.',
  null,
  'The student wants to specify Horridus''s location. Which choice most effectively uses relevant information from the notes to accomplish this goal?',
  'medium',
  'The notes support all four sentences, so the only thing separating them is the stated goal — which is why a student who reads the notes before the goal gets it wrong.',
  '[
    {"label":"A","body":"Melbourne, Australia, is home to the Melbourne Museum, which displays a dinosaur fossil specimen from the Late Cretaceous period."},
    {"label":"B","body":"Horridus lived in the Late Cretaceous period, which ended more than 65 million years ago."},
    {"label":"C","body":"Horridus is on display at the Melbourne Museum in Melbourne, Australia."},
    {"label":"D","body":"Horridus is the nickname of a dinosaur fossil specimen belonging to the genus Triceratops."}]'::jsonb,
  'C', 'The goal is where Horridus is, and only C makes Horridus the subject and gives the place. A gives the same location but is a sentence about the museum, and B and D answer questions about age and genus that were not asked.',
  'published', 'rhetorical_synthesis');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q26', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

Louis Ballard was a classical composer and citizen of the Quapaw Tribe.
He sought to synthesize Western classical music with elements of various Native musical traditions.
Ballard''s composition Incident at Wounded Knee incorporates a Pueblo log drum, a traditional Native instrument.
Ethnomusicologist Tara Browner writes that Ballard''s classical music "relies on Indigenous instruments, rhythms, forms,…and other musical elements."',
  null,
  'The student wants to connect the quotation from Browner to a specific composition. Which choice most effectively uses relevant information from the notes to accomplish this goal?',
  'medium',
  'Two options carry the quotation and two name the composition; only one does both, so the student has to hold a two-part goal in mind while reading four long choices.',
  '[
    {"label":"A","body":"Browner notes that Ballard''s music \"relies on Indigenous instruments, rhythms, forms,…and other musical elements,\" further indicating that it synthesizes Western classical music with elements of various Native music traditions."},
    {"label":"B","body":"Consistent with Browner''s observation that Ballard''s music \"relies on Indigenous instruments, rhythms, forms,…and other musical elements,\" Incident at Wounded Knee incorporates a Pueblo log drum."},
    {"label":"C","body":"Browner''s writing discusses Ballard, the classical music composer responsible for Incident at Wounded Knee."},
    {"label":"D","body":"Discussing Ballard''s body of works, Browner observes that it relies on elements of various Native musical traditions."}]'::jsonb,
  'B', 'The goal asks for the quotation and one composition together. B quotes Browner and then names Incident at Wounded Knee and its log drum as the instance. C names the composition but drops the quotation; A and D keep the quotation and stay general.',
  'published', 'rhetorical_synthesis');

perform seed_bank_item(
  'ENG-DIAG-MEDIUM-Q27', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

Birds of Northern South America is an identification guidebook by ornithologists Robin Restall, Clemencia Rodner, and Miguel Lentino.
It lists the thirty-five hummingbird species found in Suriname.
The horned sungem is a medium-sized hummingbird found in Suriname.
It is identifiable by its distinctive multicolored, tufted crown and its short, black, straight bill.
The ruby-topaz hummingbird is a small hummingbird found in Suriname.
It is identifiable by its crimson crown and its short, black, curved bill.',
  null,
  'Which choice most effectively uses information from the given sentences to emphasize a difference between the two birds?',
  'medium',
  'Three of the options are accurate sentences about the birds. The goal word is "difference", and it is the only thing ruling them out.',
  '[
    {"label":"A","body":"One way to distinguish the horned sungem from the ruby-topaz hummingbird is to look at their bills: the horned sungem''s is straight, whereas the ruby-topaz hummingbird''s is curved."},
    {"label":"B","body":"Identifiable by its short, black, straight bill and its distinctive multicolored, tufted crown, the horned sungem is a medium-sized hummingbird found in Suriname."},
    {"label":"C","body":"The ruby-topaz hummingbird is a small hummingbird identifiable by its crimson crown and its short, black, curved bill."},
    {"label":"D","body":"The horned sungem and the ruby-topaz hummingbird are two of the thirty-five different hummingbird species found in Suriname."}]'::jsonb,
  'A', 'Only A puts the two birds side by side and names the feature that separates them. B and C describe one bird each, and D names the thing they have in common.',
  'published', 'rhetorical_synthesis');

end $seed$;

-- =========================================================== the rationales ==
-- Why each item sits at the level it sits at, rewritten against the teachers'
-- own sorting.  The eight the teachers annotated in the document keep their
-- reasoning; the rest are written from the same reading of the item — what the
-- question actually asks a student to do, and which wrong answer is the one
-- they reach for.
do $why$
declare
  r record;
  why jsonb := '{
    "ENG-DIAG-T4-M1-Q01": "The passage describes the terrains as various two lines above the blank, so the word it is asking for has already been given in a synonym. Nothing has to be inferred and no two options are close.",
    "ENG-DIAG-T4-M1-Q02": "\"Rapid and ___ decline\" in a passage about a pandemic that ravaged a continent can only be a disastrous one. Scale alone rules out three options, and none of them is a near miss.",
    "ENG-DIAG-T4-M1-Q03": "\"Catch\" is figurative here — the narrator is watching for impressions, not taking hold of anything — so the three literal senses all read plausibly. It is the hardest item in the easy test and a fair place to see whether a student reads words in context or by habit.",
    "ENG-DIAG-T4-M1-Q04": "\"Claim\" has several everyday meanings and only the line after it settles which one: the suns go back to the haven they came from. A student who answers from the word alone takes assert.",
    "ENG-DIAG-T4-M1-Q05": "The purpose has to be read off the imagery rather than any stated claim, but the imagery is unmistakable — the poem is remembering a scene and asking whether it is still there.",
    "ENG-DIAG-T4-M1-Q06": "The underlined portion opens with \"but\", which announces the relationship before the student has to work it out: the nutrients come from a desert half a world away, and that is the complication.",
    "ENG-DIAG-T4-M1-Q07": "The passage puts both sides of the argument on the page — some say valuable, others say outdated — so the structure is a debate. The trap is an option that names only one side of it.",
    "ENG-DIAG-T4-M1-Q08": "Once the archaic phrasing is unpicked the poem says its point outright: poets with the highest gifts were never led by circumstance to fulfil them.",
    "ENG-DIAG-T4-M1-Q09": "Three options are true statements about the passage; the main idea is the one that covers both the hut and the boy who lives in it rather than a detail of either.",
    "ENG-DIAG-T4-M1-Q10": "The passage is almost all description, so the purpose has to come from what it dwells on — the delicacy of everything Dorothy sees — rather than from a sentence that states it.",
    "ENG-DIAG-T4-M1-Q11": "Two options are about health and diet, and the student has to tell which one bears on Komlos''s health-care explanation rather than on a rival one. It is the hardest reasoning item in the easy test.",
    "ENG-DIAG-T4-M1-Q12": "More than one option reports the graph accurately. Only one of them makes the comparison the sentence is arguing for, which is the interdental brush against the toothbrush alone.",
    "ENG-DIAG-T4-M1-Q13": "The conclusion is a pattern and the answer is the row that breaks it, so the student has to read the table against the claim rather than for it — but Singapore is the only row that does.",
    "ENG-DIAG-T4-M1-Q14": "The colon promises a reason the damaged leaves are worth putting up with. Three options give no reason at all, so they go at a glance.",
    "ENG-DIAG-T4-M1-Q17": "Two independent clauses meet at the blank and two of the options look like fixes without being ones. The student needs the rule rather than an ear for it, which is what makes it the conventions item to watch in this test.",
    "ENG-DIAG-T4-M1-Q19": "The sentence has no other verb, so the blank has to supply a finite one, and the 1980s put it in the past. One option does both.",
    "ENG-DIAG-T4-M1-Q21": "Two options signal continuation and one signals result, so the direction of the sentence has to be read before the transition can be chosen — cats are predisposed to be independent, and then they were not.",
    "ENG-DIAG-T4-M1-Q22": "The sentence turns from the 1960s to recent years and from more hairspray to safer hairspray. Only one option marks a turn.",
    "ENG-DIAG-T4-M1-Q23": "Every option is accurate, so the goal in the stem does all the work: the student is asked for mystery, and only the unknown meaning of the headdresses supplies it.",
    "ENG-DIAG-T4-M1-Q25": "The notes contain both the definition and the mechanism, and the goal asks for the mechanism — why the two pixels blend — so the definition options can be set aside.",
    "ENG-DIAG-T4-M2-Q02": "The people in the blank question the authorship, and three of the options name people committed to a cause instead. It is the gentlest item in the hard test and a useful way in.",
    "ENG-DIAG-T4-M2-Q03": "Precision rather than tone decides it: the blank has to follow from \"outspoken\" and \"controversial\" together, and polemicist is a word a student may know only well enough to distrust.",
    "ENG-DIAG-T4-M2-Q05": "Two texts about different subjects on the surface — snowfall and self-care — and the agreement sits under both of them. Nothing on the page states it.",
    "ENG-DIAG-T4-M2-Q06": "The poem turns halfway from the spider to the soul, and the main idea has to hold both. The option describing what the poem does rather than what it says reads almost right, which is where students land.",
    "ENG-DIAG-T4-M2-Q07": "One passing moment — the wave of sadness — supports a wrong option more obviously than the whole passage supports the right one. The student has to weigh the paragraph against the sentence.",
    "ENG-DIAG-T4-M2-Q08": "The passage is a profile and the trap is to describe its examples instead of its point. Both of the examples have an option written for them.",
    "ENG-DIAG-T4-M2-Q09": "All four quotations are about Bimala and all four are plausible on their own. Only one puts the home and the country in the same sentence, which is what the claim needs.",
    "ENG-DIAG-T4-M2-Q11": "Support has to bear on the dances themselves rather than on the regions or the people who perform them, and three options quietly do the latter.",
    "ENG-DIAG-T4-M2-Q12": "The claim is about who the research could help, so facts about the site itself never reach it — and the site is what the passage spends most of its words on.",
    "ENG-DIAG-T4-M2-Q13": "The completion has to be the prediction the model makes rather than a true fact about solar cycles, and the distractors are all true facts about solar cycles.",
    "ENG-DIAG-T4-M2-Q14": "The blank needs a reason the groupers keep coming back despite the danger. Three options are facts about the sharks, which is the subject the student has just been reading about.",
    "ENG-DIAG-T4-M2-Q15": "The finding is about the order two things happened in, and the completion is the conclusion that order licenses — one step of reasoning past anything the passage states.",
    "ENG-DIAG-T4-M2-Q18": "A parenthetical inside a sentence has to open and close with the same mark. All four options punctuate something; only one of them punctuates it symmetrically.",
    "ENG-DIAG-T4-M2-Q20": "The word after the blank decides it — \"however\" is an interrupter and needs its comma — and the student has to read past the blank to find that out.",
    "ENG-DIAG-T4-M2-Q21": "Tense and number both have to be right and the two verbs joined by \"and\" have to match each other, so there are three ways to get it wrong and the options take all three.",
    "ENG-DIAG-T4-M2-Q22": "A full independent clause follows the blank, so the question is which mark can carry one. Two of the options can carry a phrase and look like they could carry this.",
    "ENG-DIAG-T4-M2-Q23": "The two sentences differ in when, not in whether, so the concessive transition is the trap — and it is the one that sounds best read aloud.",
    "ENG-DIAG-T4-M2-Q24": "The blank is the only verb its subject has, so a non-finite form cannot fill it. Straightforward as a rule, and the sentence around it is long enough to hide the subject.",
    "ENG-DIAG-T4-M2-Q25": "The last sentence is the remedy for the problem just described, so the relationship is consequence. The distractors are all transitions that would fit a different relationship in the same sentence.",
    "ENG-DIAG-T4-M2-Q26": "Several options are accurate about the bust; only one stacks the notes that argue for the identification, which is what the goal asks for."
  }'::jsonb;
begin
  for r in select key, value from jsonb_each_text(why) loop
    update questions set difficulty_rationale = r.value where source_ref = r.key;
    if not found then
      raise exception 'no bank item %', r.key;
    end if;
  end loop;
end $why$;

-- ============================================================== the tests ===
do $tests$
declare
  -- The standard Reading and Writing directions, shown on the first screen of
  -- each Bluebook module. All three levels print the same block.
  rw_directions text :=
    'The questions in this section address a number of important reading and writing skills. '
    'Each question includes one or more passages, which may include a table or graph. Read each '
    'passage and question carefully and then choose the best answer to the question based on the '
    'passage(s). All questions in this section are multiple-choice with four answer choices. Each '
    'question has a single best answer.';
begin

perform seed_level_test('easy',
  'English — Easy',
  'Where every English session starts. Words in context with the answer given in the passage, main-idea questions the text states outright, and conventions items that turn on one rule.',
  array[
    'ENG-DIAG-T4-M1-Q01','ENG-DIAG-T4-M1-Q02','ENG-DIAG-T4-M1-Q03','ENG-DIAG-T4-M1-Q04',
    'ENG-DIAG-T4-M1-Q05','ENG-DIAG-T4-M1-Q06','ENG-DIAG-T4-M1-Q07','ENG-DIAG-T4-M1-Q08',
    'ENG-DIAG-T4-M1-Q09','ENG-DIAG-T4-M1-Q10','ENG-DIAG-T4-M1-Q11','ENG-DIAG-T4-M1-Q12',
    'ENG-DIAG-T4-M1-Q13','ENG-DIAG-T4-M1-Q14','ENG-DIAG-T4-M1-Q17','ENG-DIAG-T4-M1-Q19',
    'ENG-DIAG-T4-M1-Q21','ENG-DIAG-T4-M1-Q22','ENG-DIAG-T4-M1-Q23','ENG-DIAG-T4-M1-Q25']);

perform seed_level_test('medium',
  'English — Medium',
  'A step up. Longer scientific and scholarly passages, two distractors alive on most items, and synthesis questions where every choice is accurate and only the goal decides.',
  array[
    'ENG-DIAG-MEDIUM-Q01','ENG-DIAG-MEDIUM-Q02','ENG-DIAG-MEDIUM-Q03','ENG-DIAG-MEDIUM-Q06',
    'ENG-DIAG-MEDIUM-Q07','ENG-DIAG-MEDIUM-Q08','ENG-DIAG-MEDIUM-Q09','ENG-DIAG-MEDIUM-Q10',
    'ENG-DIAG-MEDIUM-Q11','ENG-DIAG-MEDIUM-Q13','ENG-DIAG-MEDIUM-Q14','ENG-DIAG-MEDIUM-Q15',
    'ENG-DIAG-MEDIUM-Q16','ENG-DIAG-MEDIUM-Q17','ENG-DIAG-MEDIUM-Q19','ENG-DIAG-MEDIUM-Q20',
    'ENG-DIAG-MEDIUM-Q22','ENG-DIAG-MEDIUM-Q24','ENG-DIAG-MEDIUM-Q26','ENG-DIAG-MEDIUM-Q27']);

perform seed_level_test('hard',
  'English — Hard',
  'Where the answer is a step past anything the passage states: cross-text agreement, main ideas that have to hold two halves at once, and conventions items with three plausible marks.',
  array[
    'ENG-DIAG-T4-M2-Q02','ENG-DIAG-T4-M2-Q03','ENG-DIAG-T4-M2-Q05','ENG-DIAG-T4-M2-Q06',
    'ENG-DIAG-T4-M2-Q07','ENG-DIAG-T4-M2-Q08','ENG-DIAG-T4-M2-Q09','ENG-DIAG-T4-M2-Q11',
    'ENG-DIAG-T4-M2-Q12','ENG-DIAG-T4-M2-Q13','ENG-DIAG-T4-M2-Q14','ENG-DIAG-T4-M2-Q15',
    'ENG-DIAG-T4-M2-Q18','ENG-DIAG-T4-M2-Q20','ENG-DIAG-T4-M2-Q21','ENG-DIAG-T4-M2-Q22',
    'ENG-DIAG-T4-M2-Q23','ENG-DIAG-T4-M2-Q24','ENG-DIAG-T4-M2-Q25','ENG-DIAG-T4-M2-Q26']);

update question_sets set instructions = rw_directions where level is not null;

end $tests$;

-- ------------------------------------------------------- the old papers ----
-- English has three tests.  The source papers the bank was loaded from are no
-- longer among them: their items are all still in the bank, and forty of them
-- are in the easy and hard tests, but the paper as a runnable object is gone.
-- Deactivated rather than deleted — sessions that were run off them are still
-- in the reports, and a deleted set would take its question_set_items with it.
update question_sets
   set is_active = false
 where level is null
   and source_ref in ('ENG-DIAG-INCLASS', 'ENG-DIAG-T4-M1', 'ENG-DIAG-T4-M2');

-- Anything a teacher assembled by hand under the old flow goes the same way:
-- a session runs a level now, so a saved test cannot be run and listing it
-- would only offer a button that no longer exists.
update question_sets
   set is_active = false
 where level is null and source_ref is null;
