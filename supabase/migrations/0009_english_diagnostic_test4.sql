-- ============================================================================
--  0009 — the second English diagnostic (Test 4), transcribed off the deck
--
--  Source: "Ascend Now English Diagnostic Test 4" — 40 Bluebook screenshots
--  across two modules, with no machine-readable text and no answer key.  The
--  audit in docs/reference/source-material-audit.md called that out as the
--  blocker for using them.
--
--  This unblocks it: every item was read off the screenshots and typed out as
--  structured text, then keyed, levelled and filed under its SAT section here.
--  Three consequences worth knowing:
--
--    * The keys are ours, not the paper's — the paper has none.  Where the
--      teachers have already commented a difficulty on an item (Module 1
--      Q01-Q08), that difficulty is used instead of ours.
--    * Two items are built on a chart (M1 Q12) and a table (M1 Q13).  Both are
--      transcribed into the passage as text rows, the same way the in-class
--      paper's sleep table is, so the item works in a text-only bank.
--    * Item numbers inside each module are non-contiguous, exactly as printed.
--      The number in the source_ref is the paper's, never a position.
--
--  Loaded with the seed_bank_item() loader that 0008 installs: keyed on
--  source_ref, so a re-import updates rather than duplicates.
-- ============================================================================

do $seed$
begin

-- ------------------------------------------------------------- Module 1 ----

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q01', 'craft_and_structure',
  'Motocross, a form of off-road motorcycle racing, has gained popularity around the world. The sport is both physically demanding and technically challenging, as riders must navigate various terrains while maintaining their balance and speed. The ______ nature of the tracks makes motocross an exciting spectator sport.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'easy', 'The passage supplies a synonym for the blank two lines earlier, so one option matches outright.',
  '[
    {"label":"A","body":"gentle"},
    {"label":"B","body":"diverse"},
    {"label":"C","body":"ordinary"},
    {"label":"D","body":"static"}]'::jsonb,
  'B', '"Various terrains" in the sentence before is the blank restated, so the tracks are diverse. "Gentle", "ordinary" and "static" all contradict a sport described as demanding and challenging.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q02', 'craft_and_structure',
  'The Black Death, which ravaged Europe during the 14th century, was a pandemic caused by the bacterium Yersinia pestis. This deadly disease was transmitted by fleas that infested rats, leading to a rapid and ______ decline in population across the continent.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'easy', 'Paired with "rapid" and described as ravaging a continent, only one option carries the right scale.',
  '[
    {"label":"A","body":"gradual"},
    {"label":"B","body":"catastrophic"},
    {"label":"C","body":"unnoticeable"},
    {"label":"D","body":"trivial"}]'::jsonb,
  'B', '"Ravaged" and "deadly" set the register, and the blank sits beside "rapid", so the decline is severe. "Gradual" fights "rapid" directly, and "unnoticeable" and "trivial" contradict a pandemic.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q03', 'craft_and_structure',
  'The following text is from Emily Brontë''s 1847 novel Wuthering Heights.

The narrator is bringing a boy named Linton to his father. The boy was fully occupied with his own cogitations for the remainder of the ride, till we halted before the farmhouse garden-gate. I watched to catch his impressions in his countenance. He surveyed the carved front and low-browed lattices, the straggling gooseberry-bushes and crooked firs, with solemn intentness, and then shook his head: his private feelings entirely disapproved of the exterior of his new abode.',
  'I watched to catch his impressions in his countenance.',
  'As used in the text, what does "catch" mean?',
  'hard', 'The word is used figuratively, and three of the four options are common literal senses of it.',
  '[
    {"label":"A","body":"acquire"},
    {"label":"B","body":"gather"},
    {"label":"C","body":"attain"},
    {"label":"D","body":"observe"}]'::jsonb,
  'D', 'The narrator is watching the boy''s face for a reaction, so "catch" means to notice or observe. "Acquire", "gather" and "attain" are all senses of physically taking hold of something, which is not what a face gives you.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q04', 'craft_and_structure',
  'The following text is from Emily Dickinson''s 1896 poem "Beclouded".

Eternities before the first-born day,
Or ere the first sun fledged his wings of flame,
Calm Night, the everlasting and the same,
A brooding mother over chaos lay.
And whirling suns shall blaze and then decay,
Shall run their fiery courses and then claim
The haven of the darkness whence they came;
Back to Nirvanic peace shall grope their way.',
  'Shall run their fiery courses and then claim',
  'As used in the text, what does "claim" mean?',
  'medium', 'Several options are ordinary meanings of the word; only the context of the next line rules them out.',
  '[
    {"label":"A","body":"return to"},
    {"label":"B","body":"pick-up"},
    {"label":"C","body":"plea for"},
    {"label":"D","body":"assert"}]'::jsonb,
  'A', 'The next line says the suns go "back to Nirvanic peace" — they take back the darkness they came from. "Assert" and "plea for" are the everyday senses of claim and neither fits a sun reclaiming its origin.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q05', 'craft_and_structure',
  'There''s a bower of roses by Bendemeer''s stream, And the nightingale sings round it all the day long; In the time of my childhood ''twas like a sweet dream, To sit in the roses and hear the bird''s song. That bower and its music I never forget, But oft when alone, in the bloom of the year, I think—is the nightingale singing there yet? Are the roses still bright by the calm Bendemeer?',
  null,
  'Which choice best states the main purpose of the text?',
  'medium', 'The speaker''s tone has to be read off the imagery rather than any stated claim.',
  '[
    {"label":"A","body":"To hint at the many changes that occur in the world"},
    {"label":"B","body":"To show that the narrator is despondent about the present"},
    {"label":"C","body":"To capture the sight and sound of a nostalgic recollection"},
    {"label":"D","body":"To indicate how far the narrator has traveled in his lifetime"}]'::jsonb,
  'C', 'The poem remembers a childhood scene through what it looked and sounded like — roses and the nightingale''s song — and then wonders whether it survives. That is nostalgia, not despondency (B) or travel (D).');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q06', 'craft_and_structure',
  'The Amazon rainforest has some of the greatest biodiversity in the world, but many of the nutrients that support life in the Amazon come from a desert halfway around the world. The Bodele Depression, on the southern edge of the Sahara Desert in Chad, has dunes made not of sand but of diatomite, or the crushed remains of freshwater creatures that lived when the area was covered by a lake thousands of years ago. Strong winds sweep up dust from the dunes and carry it across the Atlantic Ocean on trade winds.',
  'but many of the nutrients that support life in the Amazon come from a desert halfway around the world',
  'What is the function of the underlined portion in the overall structure of the text?',
  'easy', 'The word "but" announces the relationship, so the function is signposted.',
  '[
    {"label":"A","body":"It highlights a misconception."},
    {"label":"B","body":"It introduces a surprising discussion."},
    {"label":"C","body":"It emphasizes a conundrum."},
    {"label":"D","body":"It points out a complication."}]'::jsonb,
  'D', 'The sentence opens with "but" and sets the Amazon''s own biodiversity against nutrients arriving from a desert an ocean away — a complication in the picture just given. Nothing in the text is corrected as a misconception (A) or left unresolved as a conundrum (C).');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q07', 'craft_and_structure',
  'The use of psychoanalytic therapy has been a topic of debate within the mental health field for many years. While some argue that it is a valuable tool in helping individuals understand and work through their emotions and past experiences, others argue that it is outdated and lacks scientific evidence for its effectiveness. The practice of psychoanalysis, as developed by Sigmund Freud, is built on the idea of the unconscious mind and the power of repressed memories and desires. This concept has been widely criticized and challenged by many in the field, leading to a decline in its popularity in recent years.',
  null,
  'Which choice best describes the overall structure of the text?',
  'medium', 'The passage presents both sides, so an option naming only one of them is a live trap.',
  '[
    {"label":"A","body":"A history of psychoanalytic therapy and its development"},
    {"label":"B","body":"A review of research on the effectiveness of psychoanalytic therapy"},
    {"label":"C","body":"A discussion of the ongoing debate about the value of psychoanalytic therapy"},
    {"label":"D","body":"A critique of the concept of the unconscious mind and repressed memories"}]'::jsonb,
  'C', 'The text names the debate outright, gives the case for and the case against, and reports where it stands. D takes only the critical half, and B promises research the text never cites.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q08', 'information_and_ideas',
  'The following text is from William Wordsworth''s 1814 poem "The Excursion".

Many are the poets that are sown
By nature; men endowed with highest gifts,
The vision and the faculty divine;
Yet wanting the accomplishment of verse
Nor having ever, as life advanced, been led
By circumstance to take unto the height
All but a scattered few, live out their time,
Are often those of whom the world hears least.',
  null,
  'Which choice best states the main idea of the text?',
  'easy', 'The poem states its point plainly once the archaic phrasing is unpicked.',
  '[
    {"label":"A","body":"Unfortunate circumstances can change how poets write poems to attract attention from an informed audience."},
    {"label":"B","body":"Poetic expression is one of the highest forms of artistic expression that is suppressed."},
    {"label":"C","body":"The works of some poets who possessed extraordinary talents have not been fulfilled."},
    {"label":"D","body":"Poets and their creative works have not evolved over time despite disapproval of the art form."}]'::jsonb,
  'C', 'Nature sows many poets with "highest gifts", but most are never led by circumstance to fulfil them and the world hears least of them. That unfulfilled talent is C; the other three read a different subject into the poem.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q09', 'information_and_ideas',
  'The following text is from the 1919 translation by Elizabeth P. Stork of Johanna Spyri''s novel "Heidi".

The Alm is a mountain in Switzerland. Situated half-way up the Alm, the cottage was luckily protected from the mighty winds. Had it been exposed to the tempests, it would have been a doubtful habitation in the state of decay it was in. Even as it was, the doors and windows rattled and the old rafters shook when the south wind swept the mountain side. If the hut had stood on the Alm top, the wind would have blown it down the valley without much ado when the storm season came. Here lived Peter the goatherd, a boy eleven years old, who daily fetched the goats from the village and drove them up the mountain to the short and luscious grasses of the pastures.',
  null,
  'Which choice best describes the main idea of the text?',
  'medium', 'Three options are true statements about the passage; only one covers both halves of it.',
  '[
    {"label":"A","body":"Peter the goatherd was a young boy who lived in a hut partway up the Alm."},
    {"label":"B","body":"On the Alm, there is a house where a young goatherd named Peter lives."},
    {"label":"C","body":"A young boy named Peter lived in a house that was protected from storms."},
    {"label":"D","body":"Peter the goatherd''s house was in an extreme state of disrepair."}]'::jsonb,
  'C', 'Most of the passage is about the cottage being sheltered from winds that would otherwise have destroyed it, and it ends with Peter living there. C carries both; A and B drop the shelter, and D says the house was ruined when the text says it was saved.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q10', 'craft_and_structure',
  'The following text is adapted from L. Frank Baum''s 1900 novel, "The Wonderful Wizard of Oz."

A girl named Dorothy is traveling through an imaginary world. Scattered around were many houses made entirely of china and painted in the brightest colors. These houses were quite small, the biggest of them reaching only as high as Dorothy''s waist. There were also pretty little barns, with china fences around them; and many cows and sheep and horses and pigs and chickens, all made of china, were standing about in groups. But the strangest of all were the people who lived in this queer country. There were milkmaids and shepherdesses, with brightly colored bodices and golden spots all over their gowns; and princesses with most gorgeous frocks of silver and gold and purple; and shepherds dressed in knee breeches with pink and yellow and blue stripes down them.',
  null,
  'Which choice best states the main purpose of the text?',
  'medium', 'The passage is almost entirely description, so the purpose has to be inferred from what is dwelt on.',
  '[
    {"label":"A","body":"To explain that the people in the imaginary world are very strange"},
    {"label":"B","body":"To highlight the preposterous nature of an unknown location"},
    {"label":"C","body":"To emphasize the delicacy and beauty of the things Dorothy sees"},
    {"label":"D","body":"To express Dorothy''s confusion regarding the unexpected location"}]'::jsonb,
  'C', 'Every detail is about how the china world looks — brightest colours, gorgeous frocks of silver and gold, tiny painted houses. The passage admires rather than mocks (B) or reports Dorothy''s state of mind (D).');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q11', 'information_and_ideas',
  'University of Munich economist John Komlos noted that there has been a steady growth in average people''s heights in Europe, but not in the United States. His rationale for the pattern is the universal health care system in Europe, as along with genetics, childhood diet and prenatal care greatly affect height. The Netherlands has the tallest average today: an average man in 1910 was 5 feet, 7.7 inches, but in 1976 was 6 feet 0.4 inches.',
  null,
  'Which finding, if true, would most strengthen John Komlos''s reasoning about average heights in Europe and the United States?',
  'hard', 'Two options are about health and diet; the student has to tell which one bears on the health-care explanation rather than an alternative one.',
  '[
    {"label":"A","body":"A man born in the United States in 1910 averaged 5 feet 8.1 inches, while one born in 1975 averaged 5 feet 10.5 inches."},
    {"label":"B","body":"John Komlos included permanent residents born outside the countries when making his comparisons, but not those with temporary visas."},
    {"label":"C","body":"The United States has a higher obesity rate and a higher average weight for adult men and women than almost every European country."},
    {"label":"D","body":"UNICEF ranks the United States in the bottom third of 21 wealthy nations for child well-being, and the Netherlands is ranked first."}]'::jsonb,
  'D', 'Komlos ties height to health care, childhood diet and prenatal care, so evidence about children''s well-being — worst in the US, best in the Netherlands — supports exactly his mechanism. A weakens the claim by showing American growth, and C points at weight, a different explanation.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q12', 'information_and_ideas',
  'Reduction in cavities compared to no tooth care

Toothbrush | about 58%
Toothbrush + dental floss | about 85%
Toothbrush + interdental brush | about 95%

While it is true that brushing teeth is an effective way to reduce cavities, it does not address the issue of plaque that forms between the teeth. Most toothbrushes are unable to reach into the fine spaces, but there are other dental health tools available. As early as 1975, Ben Yamamoto studied the reduction in cavities using various combinations of health care options available on the common market. His conclusions demonstrate the advisability of using them, especially interdental brushes, since ______',
  null,
  'Which choice most effectively completes the text with accurate and relevant data from the graph?',
  'medium', 'More than one option reports the graph accurately; only one of them supports the claim the sentence is making.',
  '[
    {"label":"A","body":"using one with a toothbrush reduces cavities about 10 percent compared to using dental floss."},
    {"label":"B","body":"in combination with a toothbrush, they can reduce cavities by about 95 percent compared to no tooth care."},
    {"label":"C","body":"about 95 percent of all teeth will not get cavities when one is used in conjunction with a toothbrush."},
    {"label":"D","body":"just using a toothbrush only reduces cavities by about 58 percent, but using one with an interdental brush reduces cavities by 95 percent."}]'::jsonb,
  'D', 'The sentence argues that interdental brushes are especially advisable, so the data has to show their advantage: 58 percent for a toothbrush alone against 95 percent with an interdental brush. B is accurate but makes no comparison, and C misreads the axis — the graph measures the reduction in cavities, not the share of teeth spared.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q13', 'information_and_ideas',
  'Country | Foreign-born population (%) | Males in population (%)
United Arab Emirates | 88 | 68.76
Qatar | 77 | 75.00
Kuwait | 73 | 61.32
Oman | 46 | 65.91
Singapore | 43 | 52.34

Around the globe, workers travel to different countries in pursuit of better employment options than are available in their home countries. Some of them accept temporary positions, but others make a permanent transition. Although the leading countries for immigration depend heavily on such individuals for everything from construction to medical care, there is a notable disadvantage to such a policy since most people who travel abroad for work are men. The median for the world is only 5 percent foreign born, and countries with far greater than that percentage tend to have ratio of men to women that is skewed far towards more men.',
  null,
  'Which choice best describes data from the table which weakens the conclusion of the text?',
  'medium', 'The student has to find the row that breaks the pattern rather than one that illustrates it.',
  '[
    {"label":"A","body":"Singapore has a foreign-born population of 43 percent, but the ratio of men to women is almost equal."},
    {"label":"B","body":"The United Arab Emirates has the highest foreign-born population at 88 percent, but Qatar has a greater percentage of males in its population."},
    {"label":"C","body":"Kuwait has a foreign-born population of 73 percent and Oman of only 46 percent, but they have a very similar percentage of males in their populations."},
    {"label":"D","body":"The leading five countries for foreign-born populations all have over 52 percent males in the population."}]'::jsonb,
  'A', 'The conclusion is that a high foreign-born share skews the sex ratio towards men. Singapore is far above the 5 percent median at 43 percent and still sits at 52.34 percent male — nearly even — so it is the counterexample. B, C and D restate the table without contradicting the claim.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q14', 'information_and_ideas',
  'Bees of the genus Megachilidae, commonly known as leaf-cutting bees, are small, solitary black bees that make their nests in holes found in soil, wood, or plant stems. The bees cut circular sections of leaves to form capsules that each contain one egg and pollen for the emerging larva to eat. Some gardeners get upset about the disfigurement of ornamental broad-leaved plants such as roses, but that inconvenience is worth enduring: ______',
  null,
  'Which choice most logically completes the text?',
  'easy', 'The colon promises a reason the damage is worth it, which rules out three options at a glance.',
  '[
    {"label":"A","body":"it is easy to prevent bees from making nearby nests by blocking available holes."},
    {"label":"B","body":"the bees are not aggressive, so they seldom sting unless seriously provoked."},
    {"label":"C","body":"unlike most bees, Megachilidae carry pollen on abdomens rather than back legs."},
    {"label":"D","body":"leaf-cutting bees are prolific pollinators of flowers, fruits, and vegetable crops."}]'::jsonb,
  'D', 'The sentence needs a benefit that outweighs damaged leaves, and pollination is that benefit. A tells the gardener how to get rid of the bees instead, and B and C are true facts that give no reason to tolerate the harm.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q17', 'standard_english_conventions',
  'Scott Evans is a golf ball diver. In other words, he dives into the water hazards placed on golf courses to collect and recycle the balls which accidentally landed there. His job may sound fun, but it is not ______ spends hours in murky water and can get trapped by unseen obstacles.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'Two independent clauses meet at the blank, and two of the options look like fixes without being ones.',
  '[
    {"label":"A","body":"easy, he"},
    {"label":"B","body":"easy; because he"},
    {"label":"C","body":"easy. Since he"},
    {"label":"D","body":"easy. He"}]'::jsonb,
  'D', '"It is not easy" and "he spends hours in murky water" are both complete sentences, so they need a full stop or a semicolon between them. A leaves a comma splice, B puts a subordinator after a semicolon, and C turns the second half into a fragment.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q19', 'standard_english_conventions',
  'In the 1980s, the Boston Celtics and the Los Angeles Lakers were two of the most dominant teams in the NBA. Their intense rivalry ______ to a series of memorable championship clashes, featuring legendary players like Larry Bird and Magic Johnson.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'easy', 'The sentence has no other verb, so the blank has to supply a finite one in the past.',
  '[
    {"label":"A","body":"to lead"},
    {"label":"B","body":"leading"},
    {"label":"C","body":"led"},
    {"label":"D","body":"leads"}]'::jsonb,
  'C', 'The clause needs a main verb, which rules out the infinitive (A) and the participle (B), and "in the 1980s" fixes it in the past, which rules out the present tense (D).');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q21', 'expression_of_ideas',
  'Because the wild ancestors of modern felines never lived in social groups, cats are genetically predisposed to be independent. ______ during the domestication process, they developed the ability to form social relationships with other members of their species as well as with people.',
  null,
  'Which choice completes the text with the most logical transition?',
  'medium', 'Two of the options signal continuation and one signals result, so the direction of the sentence has to be read first.',
  '[
    {"label":"A","body":"Moreover,"},
    {"label":"B","body":"Accordingly,"},
    {"label":"C","body":"For instance,"},
    {"label":"D","body":"Still,"}]'::jsonb,
  'D', 'Cats are predisposed to be independent, and yet they learned to be social — the second sentence contradicts the first, so it needs a concessive. "Moreover" and "For instance" would add to the first claim, and "Accordingly" would make sociability its consequence.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q22', 'expression_of_ideas',
  'Hairspray, a popular styling product, has been in use for decades to provide hold and volume to various hairstyles. In the 1960s, it was particularly popular for creating the beehive hairstyle, which required a significant amount of hairspray to maintain its shape. ______ in recent years, hairspray formulas have become more environmentally friendly, as they no longer contain chlorofluorocarbons (CFCs) that were once known to contribute to the depletion of the ozone layer.',
  null,
  'Which choice completes the text with the most logical transition?',
  'easy', 'The sentence turns from the 1960s to recent years, and only one option marks that turn.',
  '[
    {"label":"A","body":"However"},
    {"label":"B","body":"Moreover"},
    {"label":"C","body":"Alternatively"},
    {"label":"D","body":"In contrast"}]'::jsonb,
  'A', 'The passage moves from the CFC-heavy hairspray of the 1960s to the friendlier formulas of today, which is a contrast across time. "Moreover" adds, "Alternatively" offers a substitute, and "In contrast" would set two things side by side rather than mark a change over time.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q23', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

• The "colossal heads" are the most famous artworks produced by the Olmecs, the first Mesoamerican civilization (1200 BCE – 400 CE).
• Scholars theorize that the heads depicted Olmec rulers.
• They were carved from boulders weighing between 6 and almost 50 tons.
• Each one wears a headdress whose meaning is unclear.
• The monument at Takalik Abaj in Guatemala is the only sculpture outside the Olmec heartland.',
  null,
  'The student wants to emphasize the mystery surrounding the sculptures. Which choice most effectively uses relevant information from the notes to achieve this goal?',
  'medium', 'Every option is accurate; the goal in the stem is what decides between them.',
  '[
    {"label":"A","body":"The faces, which scholars believe may represent Olmec rulers, sit below headdresses of unknown significance."},
    {"label":"B","body":"Only one of the heads is located outside the Olmec heartland."},
    {"label":"C","body":"While all of the heads are immense, they do vary in size: the smallest weigh six tons, whereas the largest ones weigh 50."},
    {"label":"D","body":"The Olmecs, who created the first civilization in Mesoamerica, carved a series of enormous stone heads."}]'::jsonb,
  'A', 'Only A keeps what is unknown in view: the faces are merely believed to be rulers, and the headdresses have no known meaning. B, C and D report settled facts about location, size and origin, which is the opposite of emphasising mystery.');

perform seed_bank_item(
  'ENG-DIAG-T4-M1-Q25', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

• The word "pixel" stands for "picture element," which refers to tiny squares on an illuminated digital display.
• The number of pixels required depends on the distance of the screen from the viewer.
• A smartphone has around 450 pixels per inch, whereas street signage may have less than 50.
• The back of the eye has light receptors that send images to the brain when triggered by light focused through the lens of the eye.
• When pixels are far away, the lens of the eye focuses only one signal on the back of the eye, so the pixels appear to meld together.
• When pixels are close to the eye, the lens projects two images to the light receptors, so the image looks like two objects.',
  null,
  'The student wants to explain why two pixels may seem to blend together into a smooth image. Which choice most effectively uses relevant information from the notes to accomplish this goal?',
  'medium', 'The notes contain the mechanism and the definition; only one option gives the mechanism the goal asks for.',
  '[
    {"label":"A","body":"Pixels appear to blend together because the eye sends light through its lens and triggers receptors at the back of the eye to send images to the brain."},
    {"label":"B","body":"Pixels are tiny squares on an illuminated digital display that look like they blend together when they are far away from the eye."},
    {"label":"C","body":"Even though pixels are separate, if they are far from the eye, they only trigger one of the receptors in the eye that sends messages to the brain, so it looks like one image."},
    {"label":"D","body":"The lens of the eye projects light from the pixels onto the back of the eye, where receptors transmit images to the brain."}]'::jsonb,
  'C', 'The goal is to explain why the blending happens, and C gives the cause: at a distance the pixels trigger a single receptor, so the brain receives one image. A and D describe how sight works in general, and B reports the effect without explaining it.');

-- ------------------------------------------------------------- Module 2 ----

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q02', 'craft_and_structure',
  'For centuries, ______ have questioned the authorship of Shakespeare''s plays. In total, no fewer than fifty alternative candidates, including Francis Bacon, Queen Elizabeth I, and Christopher Marlowe, have been proposed as the true writer.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'easy', 'The blank names people who doubt something, and three options name people who support one.',
  '[
    {"label":"A","body":"partisans"},
    {"label":"B","body":"zealots"},
    {"label":"C","body":"advocates"},
    {"label":"D","body":"skeptics"}]'::jsonb,
  'D', 'The people in the blank question the authorship, which is what a skeptic does. "Partisans", "zealots" and "advocates" all describe someone committed to a cause rather than doubting a claim.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q03', 'craft_and_structure',
  'Like many of the surgeons general before her, Joycelyn Elders became an outspoken advocate for a variety of controversial health issues. As a result, she quickly established a reputation for being ______.',
  null,
  'Which choice completes the text with the most logical and precise word or phrase?',
  'medium', 'Precision, not tone, decides it: the blank has to follow from "outspoken" and "controversial" together.',
  '[
    {"label":"A","body":"a pragmatist"},
    {"label":"B","body":"a polemicist"},
    {"label":"C","body":"a curiosity"},
    {"label":"D","body":"an amateur"}]'::jsonb,
  'B', 'A polemicist argues forcefully on contested questions, which is what "outspoken advocate for controversial health issues" describes. A pragmatist avoids exactly that kind of fight, and neither "curiosity" nor "amateur" follows from being an advocate.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q05', 'craft_and_structure',
  'Text 1
The snow was falling gently like a blanket of white. It seemed to be in no hurry, taking its time as it slowly drifted down from the sky and landed on everything below. The trees were covered with a thick layer that sparkled brightly in the light from the moon above. Everywhere you looked there was beauty; each flake unique yet part of something much bigger, creating an atmosphere filled with magic and wonderment. Even though winter can sometimes seem cold and long, moments like these made one appreciate how truly beautiful nature is when we take time to stop and observe it all around us.

Text 2
Self-care is essential in today''s fast-paced world, and the key to successful self-care lies in taking life slow. It can be tempting to rush through activities or tasks that you have set yourself, but it often leads to feeling overwhelmed and stressed. Taking time for yourself allows you to connect with your thoughts and emotions, which helps build resilience so that when faced with challenging situations you are better equipped at dealing with them without burning out. When we take our time by slowing down throughout our day, then not only do we make more mindful decisions but also ensure there is enough energy left over for leisurely pursuits like reading a book or going on nature walks as part of an overall balanced lifestyle approach.',
  null,
  'What would the authors of the two paragraphs likely agree on?',
  'medium', 'Cross-text agreement: the shared idea sits beneath two texts that are about different subjects on the surface.',
  '[
    {"label":"A","body":"The authors of the paragraphs would agree that keeping track of the number of tasks accomplished each day is important for leading a productive life."},
    {"label":"B","body":"The authors of the paragraphs would agree that leisurely pursuits like reading a book should be set aside for more lucrative activities in order to maintain balance in life."},
    {"label":"C","body":"The authors of the paragraphs would agree that spending time in nature is unimportant when it comes to self-care practices."},
    {"label":"D","body":"Both of the authors would agree that individuals should take time to think and reflect in order to live a more satisfying, fulfilled life."}]'::jsonb,
  'D', 'Text 1 says stopping to observe makes one appreciate beauty; Text 2 says slowing down lets you connect with your thoughts. Both land on taking time to reflect. B and C are contradicted by Text 2 and Text 1 respectively, and neither text mentions counting tasks.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q06', 'information_and_ideas',
  'A noiseless patient spider, I mark''d where on a little promontory it stood isolated, Mark''d how to explore the vacant vast surrounding, It launch''d forth filament, filament, filament, out of itself, Ever unreeling them, ever tirelessly speeding them. And you O my soul where you stand, Surrounded, detached, in measureless oceans of space, Ceaselessly musing, venturing, throwing, seeking the spheres to connect them, Till the bridge you will need be form''d, till the ductile anchor hold, Till the gossamer thread you fling catch somewhere, O my soul.',
  null,
  'What is the main idea of the passage?',
  'medium', 'The poem has two halves, and the main idea has to hold both the spider and the soul.',
  '[
    {"label":"A","body":"The speaker compares their soul to the vastness of space."},
    {"label":"B","body":"A spider''s soul is a stable entity, unlike that of man."},
    {"label":"C","body":"The speaker''s observations of a spider inspire them to reflect."},
    {"label":"D","body":"The speaker hopes his soul finds connections."}]'::jsonb,
  'C', 'The first half watches a spider fling filaments into empty space; the second turns to the speaker''s soul doing the same. C covers that move from observation to reflection. D is only the second half, and A misreads the comparison — the soul is compared to the spider, not to space.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q07', 'information_and_ideas',
  'The Reverend Charles Austin sat quietly in his study, his hands folded in his lap and his eyes closed in prayer. He had been the rector of Justin for the past twenty years and the people of the small town had grown to love him. He had seen them through times of joy and sorrow, and had always been there to lend an ear and offer a word of comfort. He opened his eyes and looked around the room, taking in the familiar sight of the old books on the shelves, the comforting fire in the hearth, and the portrait of his late wife on the wall. A sudden wave of sadness washed over him as he thought of how much he missed her. He sighed and shook his head, pushing away the memories and focusing on the task before him: helping the people of Justin.',
  null,
  'Based on the passage, what is true of Charles Austin?',
  'medium', 'One passing moment in the passage supports a wrong option more obviously than the whole passage supports the right one.',
  '[
    {"label":"A","body":"He tries to suppress the past."},
    {"label":"B","body":"He is overcome by grief."},
    {"label":"C","body":"He has a warm disposition."},
    {"label":"D","body":"He changes jobs frequently."}]'::jsonb,
  'C', 'Twenty years as rector, a town that has grown to love him, an ear lent in joy and sorrow — the passage is built out of his warmth. B is the opposite of a man who sets his sadness aside to work, and D contradicts twenty years in one post.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q08', 'craft_and_structure',
  'Yehia Gad of the National Research Center in Egypt is a geneticist with a unique specialty—he is at the forefront of DNA analysis of mummies. For example, he has assessed the transmission over time of certain common mutations in the Mediterranean region. Using samples from ancient pharaohs and their family members, Gad is also shedding new light on relationships and genetic conditions of past Egyptian rulers such as Amenhotep II, who died about 1400 B.C.',
  null,
  'Which choice best states the main purpose of the text?',
  'medium', 'The passage is a profile, and the trap is to describe its examples instead of its point.',
  '[
    {"label":"A","body":"To explain a policy regarding studies of ancient remains"},
    {"label":"B","body":"To outline a strategy for acquiring new information"},
    {"label":"C","body":"To highlight the repercussions of an accomplishment"},
    {"label":"D","body":"To introduce an authority in an unconventional field"}]'::jsonb,
  'D', 'The text names Gad, calls his specialty unique, and gives two examples of his work — it exists to introduce him as the leading figure in an unusual field. No policy (A) or strategy (B) is set out, and the examples describe his work rather than its repercussions (C).');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q09', 'information_and_ideas',
  'Rabindranath Tagore''s 1916 classic "The Home and the World" recounts the tragic story of Bimala, who is torn between her duties at home and her duties to serve the larger world. Tagore eloquently illustrates the turmoil in India at the time the book was written through Bimala''s experiences: ______',
  null,
  'Which quotation from "The Home and the World" most effectively illustrates the claim?',
  'medium', 'All four quotations are about Bimala; only one puts the home and the country in the same sentence.',
  '[
    {"label":"A","body":"\"Everyone says that I resemble my mother. In my childhood I used to resent this. It made me angry with my mirror.\""},
    {"label":"B","body":"\"My husband wanted me to go and live with him in Calcutta. But I could not bring myself to do that…. Would not a curse come upon me if I deserted the house and went off to town?\""},
    {"label":"C","body":"\"The silent night stood there with forefinger upraised. I could not think of my house as separate from my country: I had robbed my house, I had robbed my country.\""},
    {"label":"D","body":"\"Never before had I had any opportunity of being present at a discussion between my husband and his men friends. Today for the first time I saw his fencer''s skill in debate.\""}]'::jsonb,
  'C', 'The claim is that Bimala''s experience carries the turmoil of India itself, and C fuses the two explicitly — house and country, robbed together. The others stay inside the household.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q11', 'information_and_ideas',
  'The Peruvian marinera, a traditional coastal dance, has evolved into various regional styles. In Northern Peru, the marinera norteña is characterized by its elegance and intricate footwork, while the marinera limeña from Lima has a more subdued tempo and focuses on graceful upper body movements.',
  null,
  'Which finding, if true, would best support the claim that the marinera norteña and marinera limeña are distinct regional styles of the Peruvian marinera?',
  'easy', 'Support has to bear on the dances themselves, and only one option describes them.',
  '[
    {"label":"A","body":"The marinera norteña has roots in Spanish, African, and indigenous Peruvian dance traditions, while the marinera limeña''s origins are unclear."},
    {"label":"B","body":"Some Peruvian dancers perform the marinera norteña exclusively, while others specialize in the marinera limeña."},
    {"label":"C","body":"Both the marinera norteña and marinera limeña are popular among Peruvian dancers and audiences, with numerous regional competitions held annually."},
    {"label":"D","body":"A comprehensive analysis of the dance techniques reveals significant differences in footwork and tempo between the two styles."}]'::jsonb,
  'D', 'The claim is about the dances being distinct, so the strongest support is a technical analysis finding real differences in footwork and tempo — the very features the passage names. B is about dancers, C about popularity, and A about origins.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q12', 'information_and_ideas',
  'Today, people enjoy using commercial DNA kits to both find out about their ancestors and gain a stronger sense of self-identity. African Americans form one large community lacking a comprehensive historical database for such inquiries. However, Carver Clinton, a postdoctoral geneticist at Pennsylvania State University, wants to correct that omission. He is actively searching New York''s African Burial Ground National Monument for viable DNA to help people in search of their backgrounds. His ambitious project may provide clues about the over 15,000 free and enslaved Africans from the 17th and 18th centuries who were buried there.',
  null,
  'Which finding, if true, would most strengthen the claim about the potential outcome of Carver Clinton''s research?',
  'medium', 'The claim is about who the research could help, so facts about the site itself do not reach it.',
  '[
    {"label":"A","body":"The African Burial Ground National Monument is the largest and oldest cemetery of its kind in the United States."},
    {"label":"B","body":"Millions of African Americans who are alive today had ancestors buried in the African Burial Ground National Monument."},
    {"label":"C","body":"African American suffer from a disproportionately large number of genetically related diseases such as asthma."},
    {"label":"D","body":"Carver Clinton first got his idea about excavating cemeteries for DNA when watching a reality television program."}]'::jsonb,
  'B', 'The potential outcome is helping African Americans trace their backgrounds, so it is strengthened by showing that millions of living people descend from the people buried there. A describes the site, C is about disease rather than ancestry, and D is biography.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q13', 'information_and_ideas',
  'If consistent and reliable geological evidence tracing the solar-activity cycle in the distant past could be found, it might help to model solar activity. One model supposes that the Sun''s internal motions interact with its large-scale magnetic field to produce a dynamo, a device in which mechanical energy is converted into a magnetic field. In short, the Sun''s large-scale magnetic field is taken to be self-sustaining, so that the solar-activity cycle it drives would be maintained with little change, suggesting that ______.',
  null,
  'Which choice most logically completes the text?',
  'hard', 'The completion has to be the prediction the model makes, not a fact about solar cycles.',
  '[
    {"label":"A","body":"solar activity with periodicities longer than a few decades is considered to be the most typical time span for solar-activity cycles."},
    {"label":"B","body":"in the last century the length of the sunspot cycle has been known to vary by as much as 2 years, from its average periodicity of 11 years."},
    {"label":"C","body":"the connection between terrestrial phenomena and solar activity can be resolved by devising experiments that use a uniform time frame."},
    {"label":"D","body":"hundreds of millions of years ago, solar activity cycles displayed the same periodicities as do present-day cycles."}]'::jsonb,
  'D', 'If the cycle is self-sustaining and changes little, then ancient cycles should look like today''s — which is exactly what geological evidence from the distant past could check. B describes variation, which cuts against "little change", and A and C do not follow from the model at all.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q14', 'information_and_ideas',
  'People often think of sharks as solitary, but the gray reef sharks of Fakarava Atoll in French Polynesia gather into a group of around 700 in June. These sharks await the seasonal mating ritual of groupers that spawn in the lagoon formed by a barrier reef. There is one channel about 100 yards wide into the lagoon from the ocean, so it appears to be an extremely vulnerable position. In fact, the gray sharks do kill hundreds of the 17,000 or so groupers that converge there, but the fish always return each year to spawn clouds of eggs because ______',
  null,
  'Which choice most logically completes the text?',
  'medium', 'The blank needs a reason the groupers keep returning despite the danger, not a fact about the sharks.',
  '[
    {"label":"A","body":"a single shark is unable to effectively hunt groupers because the groupers hide in narrow crevasses."},
    {"label":"B","body":"gray reef sharks are unable to eat a grouper whole, so the sharks tear the prey into small pieces."},
    {"label":"C","body":"the strong tides through the channel rapidly disperse the fertilized eggs so they cannot be eaten by fusilier fish."},
    {"label":"D","body":"groupers have been known to travel hundreds of miles to find a suitable spawning location."}]'::jsonb,
  'C', 'The sentence has to explain why the risk is worth taking, and C gives the payoff: the same narrow channel that exposes the groupers also sweeps their eggs to safety. A and B are about how sharks feed, and D says only that groupers travel.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q15', 'information_and_ideas',
  'Activities on the sun can significantly affect the environment of all planets in the solar system, particularly Earth''s atmosphere. These include solar flares and coronal mass ejections (CME). Solar flares are sudden releases of huge amounts of energy from the sun toward Earth, and CMEs are explosive ejections of plasma (electrons, protons and helium ions) from the sun. Researcher Mohamed Youssef, studying 776 events when solar flare events were associated with CME events, observed more CMEs after a solar flare event, suggesting that ______.',
  null,
  'Which choice most logically completes the text?',
  'medium', 'The finding is about order in time, and the completion has to be the conclusion that order licenses.',
  '[
    {"label":"A","body":"the higher frequency of coronal mass ejections observed following solar flare events may indicate that coronal mass ejections are a byproduct of solar flare events."},
    {"label":"B","body":"coronal mass ejections and solar flare events vary in the amount of energy released in the form of electrons, protons, and helium ions from the sun toward Earth."},
    {"label":"C","body":"The number of coronal mass ejections can affect the total amount of energy from the sun that is released toward Earth and other planets in the solar system during a period of time observed."},
    {"label":"D","body":"the incidence of coronal mass ejections and solar flare events are dependent on the rate of coronal mass ejections directed toward Earth."}]'::jsonb,
  'A', 'More CMEs after flares than before is exactly the pattern that suggests flares produce them, and A hedges it correctly with "may indicate". B, C and D introduce claims about energy and rates that the observation does not touch.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q18', 'standard_english_conventions',
  'Wrangell-St. Elias National Park, the largest national park in the United States, represents everything compelling about Alaska. It is ______ than Belgium. It showcases towering mountains such as Mount St. Elias, which stands more 18,000 feet tall, as well as glaciers.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'A parenthetical inside a sentence has to open and close with the same mark, which is what separates the four options.',
  '[
    {"label":"A","body":"immense; larger, in fact,"},
    {"label":"B","body":"immense, larger—in fact"},
    {"label":"C","body":"immense—larger, in fact,"},
    {"label":"D","body":"immense—larger, in fact-"}]'::jsonb,
  'C', '"Larger, in fact, than Belgium" expands on "immense", so a dash introduces it and the commas around "in fact" close properly. A puts a semicolon before a fragment, B mismatches its marks, and D ends on a hyphen where a comma is needed.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q20', 'standard_english_conventions',
  'In the popular imagination, ants are often depicted as brave soldiers or dutiful factory workers. According to ______ however, this portrayal is a human fiction.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'The word after the blank decides it: "however" is an interrupter and needs its comma.',
  '[
    {"label":"A","body":"Entomologist Deborah Gordon,"},
    {"label":"B","body":"Entomologist, Deborah Gordon"},
    {"label":"C","body":"Entomologist Deborah Gordon"},
    {"label":"D","body":"Entomologist, Deborah Gordon,"}]'::jsonb,
  'A', '"However" interrupts the sentence and needs a comma on each side, so the blank has to end in one. B and C leave it unpunctuated, and D also inserts a comma between the title and the name, which separates words that belong together.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q21', 'standard_english_conventions',
  'In 1860, the Lincoln-Douglas debates ______ as an important campaign document in the presidential race, which pitted Lincoln against Douglas for the second time. In this case, however, Douglas was running as the candidate of a divided party and finished a distant second in the popular vote.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'Tense and number both have to be right, and the two verbs joined by "and" have to match.',
  '[
    {"label":"A","body":"have been printed as a book and used"},
    {"label":"B","body":"were printed as a book and used"},
    {"label":"C","body":"were printed as a book and had been used"},
    {"label":"D","body":"printed as a book and used"}]'::jsonb,
  'B', '"In 1860" fixes a finished past, so the simple past passive is right and the present perfect (A) is not. C shifts the second verb into the past perfect for no reason, and D leaves the plural subject without a passive auxiliary.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q22', 'standard_english_conventions',
  'African American life during the 1920s was documented in great detail by the writers and artists of the Harlem Renaissance. Far less is known about it during the ______ the market for their work disappeared almost overnight when the stock market crashed.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'medium', 'A full independent clause follows the blank, so the question is which mark can carry it.',
  '[
    {"label":"A","body":"Great Depression in the 1930s,"},
    {"label":"B","body":"Great Depression, in the 1930s,"},
    {"label":"C","body":"Great Depression: in the 1930s,"},
    {"label":"D","body":"Great Depression in, the 1930s,"}]'::jsonb,
  'C', '"The market for their work disappeared almost overnight" is a complete sentence explaining what the Great Depression meant, and a colon is what introduces it. A, B and D all end in a comma, leaving a splice.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q23', 'expression_of_ideas',
  'Edgar Allan Poe''s Murders in the Rue Morgue is a detective story written in 1841. At the time it was written, it was praised as being exceptionally clever and considered quite a novelty. ______ it is considered the beginning of the detective fiction genre.',
  null,
  'Which choice completes the text with the most logical transition?',
  'medium', 'The two sentences differ in when, not in whether, so a concessive transition is the trap.',
  '[
    {"label":"A","body":"Meanwhile,"},
    {"label":"B","body":"Nevertheless,"},
    {"label":"C","body":"Instead,"},
    {"label":"D","body":"Today,"}]'::jsonb,
  'D', 'The passage sets what the story was thought to be in 1841 against what it is thought to be now, so the transition marks time. "Nevertheless" and "Instead" would signal a reversal, but nothing in the second sentence contradicts the first.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q24', 'standard_english_conventions',
  'Marie Curie, a physicist and chemist, conducted groundbreaking research on radioactivity. She ______ the first woman to win a Nobel Prize and remains the only person to have won Nobel Prizes in two different scientific fields: physics and chemistry.',
  null,
  'Which choice completes the text so that it conforms to the conventions of Standard English?',
  'easy', 'The blank is the sentence''s only verb for its subject, so a non-finite form cannot fill it.',
  '[
    {"label":"A","body":"became"},
    {"label":"B","body":"becoming"},
    {"label":"C","body":"to become"},
    {"label":"D","body":"would become"}]'::jsonb,
  'A', 'The clause needs a finite past-tense verb to pair with "remains" later in the sentence. "Becoming" and "to become" are non-finite, and "would become" puts a completed historical fact into the conditional.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q25', 'expression_of_ideas',
  'Market failure is a situation in which the allocation of goods and services by a free market is not efficient. This often occurs because of the presence of externalities, or costs and benefits that are not accounted for by market transactions. One common example of market failure is pollution, as polluting industries often do not bear the full cost of the damage they cause to the environment. ______ government intervention, such as the implementation of environmental regulations or a carbon tax, can help to correct these inefficiencies and improve overall welfare.',
  null,
  'Which choice completes the text with the most logical transition?',
  'easy', 'The last sentence is the remedy for the problem just described, so the relationship is consequence.',
  '[
    {"label":"A","body":"Therefore"},
    {"label":"B","body":"Alternatively"},
    {"label":"C","body":"Nonetheless"},
    {"label":"D","body":"In contrast"}]'::jsonb,
  'A', 'The passage describes a problem — unpriced pollution — and then the intervention that fixes it, which is a consequence. The other three would signal a substitute or a contrast, neither of which the sentence offers.');

perform seed_bank_item(
  'ENG-DIAG-T4-M2-Q26', 'expression_of_ideas',
  'While researching a topic, a student has taken the following notes:

• There is one known portrait of Roman Emperor Julius Caesar (100–44 B.C.) made during his lifetime, made on a series of small coins.
• In September 2007, a sculpture was found in the Rhone River near Arles, France, that some scholars claim is Julius Caesar.
• The life-size sculpture, called the Arles Bust, was made around 46 B.C. and is marble carved in a realistic style.
• The Arles Bust shows a Roman man with some features from the coins, but not as exaggerated as on the coins.
• Julius Caesar had strong political connections to Arles.',
  null,
  'The student wants to emphasize that the Arles Bust might indeed be that of Julius Caesar. Which choice most effectively uses relevant information from the notes to accomplish this goal?',
  'medium', 'Several options are accurate; only one stacks the notes that argue for the identification.',
  '[
    {"label":"A","body":"Found in September, 2007, the Arles Bust is a life-sized sculpture of a Roman man that resembles the portrait on coins of Julius Caesar."},
    {"label":"B","body":"The Arles Bust of Julius Caesar was found in September, 2007, and was carved in a realistic style out of marble about 46 B.C., when Julius Caesar was still alive."},
    {"label":"C","body":"A life-size sculpture of Julius Caesar found in the Rhone River near Arles, France, was made around 46 B.C., when Julius Caesar was still alive."},
    {"label":"D","body":"The Arles Bust, which resembles a known portrait of Julius Caesar and was made during his lifetime, was found in a place with strong political connections to him."}]'::jsonb,
  'D', 'D puts all three pieces of supporting evidence together: the resemblance to the coin portrait, the date within Caesar''s lifetime, and the political tie to Arles. B and C assume the identification instead of arguing for it, and A gives only the resemblance.');

end
$seed$;
