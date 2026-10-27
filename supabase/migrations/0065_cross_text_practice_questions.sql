-- ============================================================================
--  0065 — forty-eight Cross-Text Connections questions for the practice pool
--
--  The three tests hold only a handful of Cross-Text Connections questions, so
--  a targeted test on the skill borrowed across levels and still came up
--  short (0060, 0061). These forty-eight go into the English practice pool —
--  14 easy, 17 medium, 17 hard — so a ten-question set on the skill fills at
--  every level, and fills again before the student sees a question twice.
--
--  WHERE THEY COME FROM. A transcription of two OnePrep screen recordings,
--  "OnePrep SAT Cross-Text Connections – Q1–53" (23 October 2026). Every
--  question in it is Reading & Writing → Craft and Structure → Cross-Text
--  Connections. They are numbered as OnePrep numbers them, gaps and all:
--  Q11 is a locked challenge question whose content was never shown, and
--  Q21, Q31, Q41 and Q51 are not in the recordings.
--
--  WHAT GOES WHERE.
--    * passage      Text 1 and Text 2 under their own headings, the way
--                   paper.ts prints a paired item (0009 does the same).
--    * underline    the nine questions that ask about an underlined part
--                   carry it, matched against the passage it sits in. Q34's
--                   was not legible in the recording; its explanation quotes
--                   "investigating a potentially niche problem", so the
--                   sentence holding that phrase is the one underlined.
--    * difficulty   OnePrep's own label — the pool takes the difficulty a
--                   question says, since there is no test to take it from.
--    * rationale    OnePrep's figures for the question: how many of its users
--                   answer it correctly and how long they take. It is the
--                   evidence for the difficulty, which is what the column is
--                   for, and it is staff-only.
--    * explanation  everything the recordings showed: why the key is right,
--                   then why each other choice is wrong. OnePrep shows only
--                   the first step of its explanations for free, so that is
--                   what there is; Q42's wrong-answer reasons were never
--                   opened, and Q14 showed OnePrep's written explanation in
--                   place of the steps.
--    * target_seconds  the house pace for the level (0011), not OnePrep's
--                   average, which counts every user and every wrong answer.
--
--  Re-runnable like every content migration here: seed_bank_item upserts by
--  source_ref, and a question already in the pool keeps its place.
-- ============================================================================

do $seed$
begin

-- Q1 · Leopard spots
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q01', 'craft_and_structure',
  'Text 1
Leopards do not need their spots to hide from predators; after all, in the varied ecosystems that they inhabit, these large wildcats are normally at the top of the food chain. Recent research from the University of Bristol indicates that spots make adult leopards superior hunters, helping them blend into forest environments. By examining almost three dozen wildcat species, the Bristol researchers discovered a possible correlation between shadowy, densely wooded environments and complex dark markings such as those of leopards and tigers.

Text 2
Already valuable as a means of concealing adult leopards as they stalk their prey, leopards'' distinctive spots provide a few other benefits. Adult leopards are "apex predators" that, by definition, are not preyed on by other animals, yet juvenile leopards that are too young to fend for themselves need to blend into their surroundings for the sake of safety. Camouflage-like spots, here, offer a useful defensive mechanism.',
  null,
  'Based on the texts, how would the author of Text 2 respond to the research discussed in Text 1?',
  'easy', 'OnePrep rates this easy: 72% of its users answer it correctly, in 1:17 on average; the middle half of correct answers take 48s to 1:55.',
  '[
    {"label": "A", "body": "By disputing the idea that spots can benefit adult leopards"},
    {"label": "B", "body": "By noting that spots can serve useful purposes for both young leopards and mature leopards"},
    {"label": "C", "body": "By arguing that leopards'' spots and tigers'' stripes provide very different sorts of benefits"},
    {"label": "D", "body": "By faulting the University of Bristol researchers for using an inappropriately small dataset to arrive at their conclusions"}]'::jsonb,
  'B', 'Why B is correct: Step 1, read the question direction: "how would the author of Text 2 respond to the research discussed in Text 1?" The question asks how Text 2 would respond to the research in Text 1. So first identify Text 1''s claim, then see whether Text 2 agrees, limits it, or adds to it. Keep the authors'' roles separate.

Why the others are wrong
A: Text 2 actually agrees that spots are beneficial for adult leopards. Step 1, check for agreement: Text 2 begins by stating that spots are already "valuable as a means of concealing adult leopards" as they hunt.
C: Text 2 does not discuss tigers or compare different types of markings. Step 1, check Text 2''s focus: Author 2 focuses entirely on leopards, specifically comparing the needs of "adult leopards" and "juvenile leopards."
D: Text 2 never critiques the research methods or dataset size mentioned in Text 1. Step 1, analyze the tone: Author 2 adds a new perspective rather than criticizing the University of Bristol''s findings.',
  'published', 'cross_text_connections');

-- Q2 · Sun Belt and knowledge workers
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q02', 'craft_and_structure',
  'Text 1
The term "Sun Belt" describes a considerable portion of the contiguous US, namely a southern grouping of states and regions that have shifted from agricultural production to increasingly knowledge- and services-based industries. One impediment to the otherwise breathtaking twentieth into twenty-first century growth of the Sun Belt was the dearth of industrial production, which resulted in an absence of existing large buildings (i.e., former factories, warehouses, and apartment blocks) that could be repurposed into office space, as frequently happened in northern states.

Text 2
Deficiencies in available buildings susceptible to repurposing have, at best, posed only a minor obstacle to the economic growth of the Sun Belt. In fact, rather than inhibiting the formation of companies or the migration of "knowledge workers" to Sun Belt states, the relative scarcity of such structures has fueled a combination of new construction to meet the most exigent of company real estate needs and business models based on flexibility rather than centralization on corporate hubs.',
  null,
  'Based on the texts, how would the author of Text 1 respond to the comments about "knowledge workers" (Text 2) in the Sun Belt?',
  'hard', 'OnePrep rates this hard: 52% of its users answer it correctly, in 2:00 on average; the middle half of correct answers take 1:13 to 2:52.',
  '[
    {"label": "A", "body": "By presenting information indicative of the fact that the employment of knowledge workers has bolstered employment in industries that are not necessarily knowledge-based"},
    {"label": "B", "body": "By pointing out that structures initially designed for other forms of production could have been an asset to companies employing these workers"},
    {"label": "C", "body": "By citing instances in which building projects in the Sun Belt have had detrimental effects on these workers"},
    {"label": "D", "body": "By arguing that the absence of new construction in the Sun Belt has led to long-term employment of knowledge workers"}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify the target: "Based on the texts, how would the author of Text 1 respond to the comments about ''knowledge workers'' (Text 2) in the Sun Belt?" This is a cross-text question. Identify the specific claim in Text 2, then predict how Text 1 would answer it. The target is the comment about companies and the migration of "knowledge workers," not every statement about Sun Belt growth.

Why the others are wrong
A: Choice A incorrectly assumes Text 1 focuses on the relationship between different industry types. Step 1, check the focus: Text 1 focuses on how the lack of existing buildings to repurpose hindered the growth of knowledge-based industries.
C: Choice C suggests a negative impact from construction that is never mentioned in Text 1. Step 1, analyze the obstacle (key phrase: "absence of existing large buildings"): Text 1 argues that the problem was a lack of existing buildings, not the presence of new ones.
D: Choice D contradicts the facts presented in Text 2 and misrepresents the argument in Text 1. Step 1, identify the error (key phrase: "fueled a combination of new construction"): Text 2 explicitly states that the scarcity of old buildings actually led to more new construction, not an absence of it.',
  'published', 'cross_text_connections');

-- Q3 · Ideas behind the American Revolution
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q03', 'craft_and_structure',
  'Text 1
Historical changes that preceded the American Revolution (1775-1783) resulted in a greater spirit of individualism among North American colonists. As part of the Enlightenment, an intellectual movement originating in the late 1600s, philosophers and political theorists began to question existing power structures. Rejecting outdated traditions, these thinkers determined that individuals should think independently and rationally about the best courses for politics and society. Many of these freethinking principles guided the American Revolution.

Text 2
A religious movement known as the Great Awakening (starting in the 1730s, lasting until the 1770s) shaped many of the ideas central to the American Revolution. The Great Awakening involved popular preachers who challenged older forms of church leadership. Often, these preachers encouraged their followers to form highly personal connections to religious faith and worship, rather than relying on received customs. New ideas about the importance of individualism in other areas, particularly government and politics, soon resulted.',
  null,
  'Which choice best describes a difference in how the two authors understand the ideas that guided the American Revolution?',
  'easy', 'OnePrep rates this easy: 73% of its users answer it correctly, in 1:24 on average; the middle half of correct answers take 50s to 2:08.',
  '[
    {"label": "A", "body": "The author of Text 1 emphasizes the role of the Enlightenment, while the author of Text 2 focuses on the Great Awakening."},
    {"label": "B", "body": "The author of Text 1 believes that revolutions undermine individualism, while the author of Text 2 states that individualism flourished during the American Revolution."},
    {"label": "C", "body": "The author of Text 1 questions the impact of the Great Awakening, while the author of Text 2 praises the Great Awakening as influential."},
    {"label": "D", "body": "The author of Text 1 explains the causes of the American Revolution, while the author of Text 2 shows how the Enlightenment led to the Great Awakening."}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify what to compare: The question asks how the authors explain the ideas behind the American Revolution differently. Look for which movement each author credits with encouraging people to think for themselves.

Why the others are wrong
B: This choice incorrectly suggests Text 1 views revolutions as harmful to individualism. Step 1, check Text 1: Text 1 actually states that the period before the revolution "resulted in a greater spirit of individualism," which contradicts the idea that the author sees revolutions as undermining it.
C: This choice claims Text 1 critiques a movement that is never actually mentioned in that text. Step 1, analyze Text 1''s focus: Text 1 focuses exclusively on the Enlightenment. It never mentions or questions the Great Awakening.
D: This choice misinterprets the relationship between the two movements described in the texts. Step 1, check Text 2 (key phrase: "New ideas about the importance of individualism in other areas, particularly government and politics, soon resulted"): Text 2 explains how the Great Awakening led to new ideas in politics, but it does not claim the Enlightenment caused the Great Awakening.',
  'published', 'cross_text_connections');

-- Q4 · Extended metaphors
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q04', 'craft_and_structure',
  'Text 1
Metaphorical language carries remarkable persuasive power, particularly when a single metaphor or system of related metaphors remains consistent. In 2019 research, Paul Thibodeau revealed that a single series of metaphors and similes (speaking of crime in an urban area as a "virus" requiring "treatment," in his demonstration) significantly impacted how listeners interpreted a problem that could have been approached more blandly otherwise. A figurative treatment of this sort (extending Thibodeau''s ideas) also facilitates a more intuitive and emotional response to the issue at hand.

Text 2
Theoretically enticing, extended metaphors more frequently evolve into awkward displays of loosely linked images than into brilliant showcases of varied rhetoric. Research, such as that by Jeffrey Min, indicates that extended metaphors register with hearers who may be impressed by the cleverness of improvised and interlocking figurative language. More often, extended metaphors rigidly and unimaginatively apply expected images (a social problem as a "disease," a crowd as a "sea" of people) to discussions that would benefit from greater directness.',
  'Metaphorical language carries remarkable persuasive power, particularly when a single metaphor or system of related metaphors remains consistent.',
  'Based on the texts, how would the author of Text 2 respond to the underlined statement in Text 1?',
  'hard', 'OnePrep rates this hard: 43% of its users answer it correctly, in 1:41 on average; the middle half of correct answers take 1:04 to 2:28.',
  '[
    {"label": "A", "body": "By explaining that extended metaphors are most effective when applied to highly personal topics rather than to social problems"},
    {"label": "B", "body": "By concurring that there are appealing features to extended metaphors despite the waning popularity of metaphors of this sort"},
    {"label": "C", "body": "By warning against the use of extended metaphors that apply unfamiliar imagery to familiar phenomena"},
    {"label": "D", "body": "By disputing the premise that extended metaphors represent an automatically compelling rhetorical strategy"}]'::jsonb,
  'D', 'Why D is correct: Step 1, read the target claim: We need to decide how Text 2''s author would respond to the underlined claim. That claim says metaphorical language is especially persuasive when one metaphor or a connected set of metaphors stays consistent. Text 1 therefore presents a sustained metaphor as a powerful way to persuade an audience.

Why the others are wrong
A: Text 2 critiques the quality of metaphors but never mentions personal topics. Step 1, check the scope (key phrase: "a social problem as a ''disease,'' a crowd as a ''sea'' of people"): Text 2 focuses on how metaphors are applied to social issues, such as a "social problem" or a "crowd."
B: Text 2 does not discuss whether metaphors are becoming less popular. Step 1, review Text 2''s tone: The author admits metaphors are "theoretically enticing" but argues they are usually executed poorly.
C: Text 2 actually criticizes metaphors for being too predictable, not too unfamiliar. Step 1, examine the warning: The author of Text 2 warns that extended metaphors often rely on "expected images" that lack impact.',
  'published', 'cross_text_connections');

-- Q5 · Queen Elizabeth I's poetry
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q05', 'craft_and_structure',
  'Text 1
Queen Elizabeth the First was both a poet and one of the most significant monarchs in English history—and that dual role guides much recent evaluation of her poetry. Mary Thomas Crane of the Poetry Foundation acknowledges that Elizabeth''s "own writings do not begin to equal the greatest of her age" but were "important in creating and sustaining that age," echoing the common critical view that the monarch''s historical agency is of more interest than her expressive powers.

Text 2
The literary output of Queen Elizabeth the First includes speeches, poems, letters, and translations. To a modern audience, her work across literary forms can appear remarkable. To Elizabeth''s fellow aristocrats of the middle to late 1500s, writing adept-enough poetry and letters was a commonplace recreation among the elite: a sign of technical cleverness, which Elizabeth reached, rather than ingenious insight, more the province of playwrights such as Shakespeare, Marlowe, and Middleton.',
  null,
  'Which choice best describes a difference in how Text 1 and Text 2 present the poetry of Queen Elizabeth the First?',
  'hard', 'OnePrep rates this hard: 56% of its users answer it correctly, in 1:57 on average; the middle half of correct answers take 1:18 to 2:42.',
  '[
    {"label": "A", "body": "Text 1 portrays Elizabeth''s poetry as a direct offshoot of her responsibilities as a political leader; Text 2 indicates that several of Elizabeth''s poems were intensely personal in nature."},
    {"label": "B", "body": "Text 1 approaches Elizabeth''s literary output from a scholarly perspective while largely avoiding recent viewpoints; Text 2 considers how a modern audience would most likely react to Elizabeth''s poems."},
    {"label": "C", "body": "Text 1 situates Elizabeth''s poetry in the context of Elizabeth''s broad political responsibilities; Text 2 considers Elizabeth''s writings beyond poetry to develop a contrast with other writers."},
    {"label": "D", "body": "Text 1 cites a few technical and compositional flaws of Elizabeth''s writing; Text 2 shows how Elizabeth''s poems and letters were deficient in developing thoughtful assessments of human nature."}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the comparison: The question asks how the texts differ in their focus when presenting Elizabeth''s poetry. Identify what each text emphasizes, then look for an answer whose descriptions of both texts fit the evidence.

Why the others are wrong
A: This choice incorrectly claims that Text 2 describes Elizabeth''s poetry as deeply personal. Step 1, check Text 2 (key phrase: "commonplace recreation"): Text 2 describes Elizabeth''s writing as a standard social activity for the elite, not as something deeply personal.
B: Text 1 actually includes modern viewpoints, and Text 2''s primary focus is not modern reactions. Step 1, verify Text 1: Text 1 explicitly mentions "recent evaluation," which directly contradicts the claim that it avoids recent viewpoints.
D: Both texts describe Elizabeth''s work as mediocre, but they do not list specific technical errors. Step 1, search for flaws (key phrase: "playwrights such as Shakespeare"): Neither passage identifies specific "compositional flaws"; they simply state she wasn''t as gifted as professional playwrights.',
  'published', 'cross_text_connections');

-- Q6 · Origins of Earth's ammonia
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q06', 'craft_and_structure',
  'Text 1
Earth''s early atmosphere featured considerable amounts of gaseous ammonia (NH3), which underwent chemical reactions to form both the nitrogen (N2) prevalent in the atmosphere today and the amino acids widely regarded as the "building blocks" of organic life. The source of the ammonia itself, though, may not have been the upper atmosphere at all. According to the findings of a 1990 Carnegie Institute study, Earth''s once-abundant reserves of ammonia may have originated from vents in Earth''s seafloor.

Text 2
In 2011, Sandra Pizzarello and her colleagues released a new explanation of the origins of Earth''s early reserves of ammonia, which most likely played a central role in the development of the planet''s first organisms. Rather than originating in some regions of Earth''s geography, ammonia could have been brought to Earth by a large meteor akin to one that Pizzarello examined—the ancient CR2 Grave Nunataks (GRA) 95229 meteorite, which contains traces of the substance.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree with which statement?',
  'easy', 'OnePrep rates this easy: 63% of its users answer it correctly, in 1:16 on average; the middle half of correct answers take 48s to 1:52.',
  '[
    {"label": "A", "body": "The meteorite theory is an implausible explanation of ammonia''s origins."},
    {"label": "B", "body": "Both the GRA meteorite and oceanic vents were significant sources of ammonia."},
    {"label": "C", "body": "Nitrogen and ammonia were both prevalent in Earth''s early atmosphere."},
    {"label": "D", "body": "Ammonia could have been instrumental in the origins of life on Earth."}]'::jsonb,
  'D', 'Why D is correct: Step 1, look for a shared claim: "...author of Text 2 would most likely agree with which statement?" We need a statement that both authors would support. Each text offers a possible source of ammonia, but we should also check what both say ammonia helped do.

Why the others are wrong
A: This choice incorrectly assumes that Text 1 critiques the theory presented in Text 2. Step 1, analyze Text 1: Text 1 focuses on the theory that ammonia originated from seafloor vents, but it never mentions or evaluates meteorite theories.
B: This choice incorrectly suggests that both authors accept both theories, when each text only discusses one. Step 1, check author agreement (key phrase: "ammonia could have been brought to Earth by a large meteor"): While each source is mentioned in one of the texts, neither author discusses or endorses the other''s specific theory.
C: This choice includes a detail that is only found in the first text. Step 1, identify unique details (key phrase: "nitrogen (N2) prevalent in the atmosphere today"): Text 1 discusses the presence of nitrogen (N2) in the atmosphere, but Text 2 does not mention nitrogen at all.',
  'published', 'cross_text_connections');

-- Q7 · Lake sturgeons
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q07', 'craft_and_structure',
  'Text 1
Visitors to Chicago''s Shedd Aquarium can encounter many forms of marine life native to the Great Lakes, including the largest fish species indigenous to these waterways: the lake sturgeon. One aquarium feature is a spacious, open-topped water tank that contains a few sturgeons for visitors to (very gently) touch. Together with educational videos and displays, experiences such as this sturgeon encounter promote a spirit of stewardship for the Great Lakes ecosystem.

Text 2
Lake sturgeons, despite a period of ongoing threats of population loss, are not classified as endangered today. While promoting awareness of these fish and their native ecosystems proves valuable, the real reason for the survival of these fish in the Great Lakes and elsewhere is the successful implementation of "collaborative conservation" efforts. The most significant of these—leading to the 2024 declaration that sturgeons did not represent an endangered species—pooled the resources of government agencies, local environmental groups, and Native American tribes to safeguard sturgeon populations.',
  null,
  'Based on the texts, both authors would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 37% of its users answer it correctly, in 1:37 on average; the middle half of correct answers take 1:01 to 2:23.',
  '[
    {"label": "A", "body": "Educational endeavors such as those that take place at the Shedd Aquarium are worthwhile."},
    {"label": "B", "body": "Fish species indigenous to the Great Lakes have begun to flourish."},
    {"label": "C", "body": "Lake sturgeons can be housed in aquariums now that sturgeon populations have increased considerably."},
    {"label": "D", "body": "Educating more people about lake sturgeon populations would most likely lead to additional \"collaborative conservation\" projects."}]'::jsonb,
  'A', 'Why A is correct: Step 1, read the task: "both authors would most likely agree." The question asks for a statement that both texts support. So an answer must fit Text 1 and Text 2, not merely mention a true detail from one of them.

Why the others are wrong
B: This choice is too broad because the texts only discuss the status of one specific species. Step 1, check species scope (key phrase: "sturgeons did not represent an endangered species"): Text 2 mentions that the lake sturgeon is not classified as endangered today, but it does not provide information about other fish species in the Great Lakes.
C: The texts do not establish a causal link between population size and the decision to house fish in aquariums. Step 1, analyze Text 1 (key phrase: "a spacious, open-topped water tank that contains a few sturgeons"): Text 1 describes sturgeons in an aquarium to promote stewardship but never mentions their wild population levels as a reason for being there.
D: This choice speculates on a future outcome that is not predicted by either text. Step 1, check Text 2 (key phrase: "pooled the resources of government agencies, local environmental groups, and Native American tribes"): Text 2 identifies collaborative conservation as the key to survival, but it doesn''t claim that educating the public will create more of these projects.',
  'published', 'cross_text_connections');

-- Q8 · Devices as fashion statements
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q08', 'craft_and_structure',
  'Text 1
At one point, devices such as cell phones and personal computers could serve as meaningful fashion statements. Fashion-like usages of this sort assumed that the devices would be personalized and unique. For instance, multicolored phones that flipped open gave their users a different fashion identity from users of less colorful, less dynamic phones. Now, however, most phones and computers come in standard shapes and limited metallic colors. Use of these devices for self-expression through fashion is impossible today.

Text 2
Phones, computers, and other devices continue to provide vivid and memorable opportunities for fashion-based expression. Simply applying colorful stickers to a tablet or laptop can transform the device into a unique fashion statement, for instance. In addition, users can depart from "standard" devices for the sake of personal fashion. Flip phones have returned to prominence for exactly this reason, offering consumers new ways of standing out through their device choices.',
  null,
  'Which choice best describes a difference in how the authors of the two texts depict electronic devices?',
  'easy', 'OnePrep rates this easy: 86% of its users answer it correctly, in 1:19 on average; the middle half of correct answers take 58s to 1:58.',
  '[
    {"label": "A", "body": "The author of Text 1 asserts that cell phones are becoming less popular, while the author of Text 2 sees the popularity of these devices as increasing."},
    {"label": "B", "body": "The author of Text 1 cites several influential devices, while the author of Text 2 argues that devices are not used in fashion statements."},
    {"label": "C", "body": "The author of Text 1 analyzes phones and computers, while the author of Text 2 neglects these devices entirely."},
    {"label": "D", "body": "The author of Text 1 argues that devices no longer function as fashion statements, while the author of Text 2 makes the opposite claim."}]'::jsonb,
  'D', 'Why D is correct: Step 1, identify the shared topic: The question asks how the authors describe electronic devices differently. Focus on what each author thinks about using devices to express personal style.

Why the others are wrong
A: This choice incorrectly focuses on device popularity rather than their use as fashion statements. Step 1, analyze the focus (key phrase: "fashion-based expression"): Both authors are debating the aesthetic and fashion potential of devices, not how many people own them.
B: This choice wrongly claims that Text 2 argues against using devices for fashion. Step 1, read Text 2''s argument (key phrase: "vivid and memorable opportunities for fashion-based expression"): Text 2 explicitly states that devices continue to provide opportunities for fashion.
C: This choice is factually incorrect because Text 2 clearly discusses phones and computers. Step 1, locate subjects in Text 2 (key phrase: "Phones, computers, and other devices"): The first sentence of Text 2 mentions phones and computers by name.',
  'published', 'cross_text_connections');

-- Q9 · Adapting James Baldwin
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q09', 'craft_and_structure',
  'Text 1
Few 20th century American novels have proven more resistant to effective film adaptation than the works of James Baldwin have. In part, the difficulty lies in Baldwin''s use of techniques that are easily deployed in a novel and much more awkward in a film, particularly time jumps. There is a 1985 film adaptation of Baldwin''s debut novel Go Tell It on the Mountain, but the virtually seamless use of flashbacks in Baldwin''s text translates uneasily to cinematic form.

Text 2
Adapting a novelist of James Baldwin''s stature is challenging, not impossible. While the workmanlike 1985 rendition of his African American epic Go Tell It on the Mountain is not an artistic success, a more nimble adaptation of a less famous Baldwin novel, If Beale Street Could Talk, is itself a work of art. Part of the credit is due to director Barry Jenkins, who is skilled at adapting the work of Black novelists and playwrights while staying true to his quietly virtuosic style of filming.',
  null,
  'Based on the texts, what would the author of Text 1 say about the assessment of Go Tell It on the Mountain in Text 2?',
  'easy', 'OnePrep rates this easy: 53% of its users answer it correctly, in 1:33 on average; the middle half of correct answers take 58s to 2:17.',
  '[
    {"label": "A", "body": "It misconstrues the role of flashbacks in Baldwin''s original novel."},
    {"label": "B", "body": "It accurately indicates the weakness of the 1985 film adaptation."},
    {"label": "C", "body": "It relies on a questionable parallel between two very different authors."},
    {"label": "D", "body": "It fails to account for the strengths of other Baldwin adaptations."}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify the task: "what would the author of Text 1 say about the assessment of Go Tell It on the Mountain in Text 2?" The question asks us to predict how Text 1 would respond to Text 2''s opinion about Go Tell It on the Mountain. Focus on that film adaptation, not on the separate discussion of If Beale Street Could Talk.

Why the others are wrong
A: Text 1 focuses on technical flaws that Text 2 doesn''t even mention. Step 1, check Text 2''s content (key phrase: "translates uneasily to cinematic form"): Text 1 highlights that Baldwin''s use of flashbacks "translates uneasily" to film, but Text 2 never mentions flashbacks or specific literary techniques.
C: Text 2 compares two films of the same author, not two different authors. Step 1, review Text 2''s parallels: Text 2 compares two adaptations of James Baldwin''s novels: Go Tell It on the Mountain and If Beale Street Could Talk.
D: Text 2 explicitly praises a different, successful Baldwin adaptation. Step 1, identify strengths in Text 2 (key phrase: "is itself a work of art"): Text 2 actually does account for other adaptations, calling the film version of If Beale Street Could Talk a "work of art."',
  'published', 'cross_text_connections');

-- Q10 · Benjamin's "aura" and reproductions
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q10', 'craft_and_structure',
  'Text 1
In the 1935 essay "The Work of Art in the Age of Mechanical Reproduction," Walter Benjamin attested that reproducing an artifact diminishes its "aura," the atmosphere of uniqueness and awe attached to the original. What Benjamin did not sufficiently consider is the necessity of reconstructing artifacts for educational purposes, which are often accompanied with the disclaimer that a reconstituted relic of ancient Sumeria (for instance) is being viewed, not an aura-rich original.

Text 2
Felicity Strong of the University of Melbourne has few qualms about reproducing artifacts, even in new media, as her 2016 article "Imitation Game" makes clear. Taking issue with Benjamin''s "aura" construct, she sees technology as fundamental to a "brand new—and possibly deeper—connection to our greatest treasures." Entire temples from ancient Egypt can be reconstituted using 3D printers and molded polymers, and Strong notes that visitors can be transported, almost, into the distant past.',
  'technology as fundamental to a "brand new—and possibly deeper—connection to our greatest treasures',
  'Based on the texts, how would the author of Text 1 most likely understand the underlined statement in Text 2?',
  'hard', 'OnePrep rates this hard: 31% of its users answer it correctly, in 1:41 on average; the middle half of correct answers take 1:03 to 2:28.',
  '[
    {"label": "A", "body": "As an understandable response to an idea that does not align with practical circumstances"},
    {"label": "B", "body": "As a compelling argument against the need to preserve artifacts in their original forms"},
    {"label": "C", "body": "As a possible misreading of an idea that guided the viewers'' responses to artifacts in an earlier era"},
    {"label": "D", "body": "As an important exception to the argument that technology is of limited use to specialists in conserving artifacts"}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify the relationship: "how would the author of Text 1 most likely understand the underlined statement in Text 2?" The question asks how the author of Text 1 would react to a specific claim in Text 2. So track each text''s view, then predict the response before looking for matching wording.

Why the others are wrong
B: Text 1 supports reproductions for education but never suggests that original artifacts shouldn''t be preserved. Step 1, analyze Text 1: Text 1 argues for the "necessity of reconstructing artifacts" for education, but it still values the original "aura-rich" relics.
C: Text 1 identifies a flaw in Benjamin''s theory itself, not a misreading of that theory by others. Step 1, check the critique: Text 1 claims Benjamin "did not sufficiently consider" the practical educational benefits of reproduction.
D: Neither text argues that technology is of limited use to specialists in conserving artifacts. Step 1, analyze usefulness: Text 1 highlights that reconstruction is a "necessity" for "educational purposes," showing that technology is a valuable tool.',
  'published', 'cross_text_connections');

-- Q12 · Limping dinosaur footprints
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q12', 'craft_and_structure',
  'Text 1
A track consisting of 130 dinosaur footprints and located in Colorado has proven to be of great interest to paleontologists, though the exact significance of some of the footprints remains uncertain. Close inspection by Anthony Romilio, who is affiliated with the Dinosaur Lab at the University of Queensland, revealed differences in right-side and left-side step lengths for the dinosaur that left the footprints. Still, Romilio admits that these irregularities could reveal either that the dinosaur had a slight limp or that the dinosaur preferred one side of its body.

Text 2
Scientists have indeed found the footprints of limping dinosaurs, as in the case of a 129 million year-old fossilized trace located near Madrid and discovered in 2022. Slightly more recent findings by Anthony Romilio are more ambiguous. Romilio himself notes that the series of 130 footprints that he inspected in 2025 could have been left by a limping dinosaur. Still, the possibility that the dinosaur was not in fact limping remains valid.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree about the answer to which question?',
  'medium', 'OnePrep rates this medium: 53% of its users answer it correctly, in 1:45 on average; the middle half of correct answers take 1:09 to 2:28.',
  '[
    {"label": "A", "body": "Were a group of footprints found in Madrid produced by a limping dinosaur?"},
    {"label": "B", "body": "How closely do the dinosaur footprints studied by Romilio resemble dinosaur footprints that were discovered earlier?"},
    {"label": "C", "body": "Were the footprints discovered by Romilio definitely produced by a limping dinosaur?"},
    {"label": "D", "body": "Do paleontologists find the footprints left by dinosaurs more interesting than other fossilized dinosaur traces?"}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the shared question: We need a question that both authors would answer the same way. That shared answer could be "no" or "we cannot be certain." Look for what both texts say about the explanation for Romilio''s footprints.

Why the others are wrong
A: Text 1 focuses only on the footprints in Colorado and never mentions the Madrid discovery. Step 1, check Text 1 (key phrase: "located in Colorado"): Text 1 focuses exclusively on a track in Colorado studied by Anthony Romilio.
B: The texts compare the certainty of a limp, not the physical appearance of different tracks. Step 1, check the comparison (key phrase: "more ambiguous"): Text 2 mentions an earlier discovery near Madrid, but it uses it to contrast scientific certainty, not to compare physical resemblance.
D: Neither text ranks the "interest level" of footprints against other types of fossils. Step 1, assess "interest" (key phrase: "great interest"): Text 1 says the footprints are of "great interest," but it doesn''t mention other traces like bones or eggs.',
  'published', 'cross_text_connections');

-- Q13 · Tomasello and digital civics
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q13', 'craft_and_structure',
  'Text 1
Legal and political scholar Federico Tomasello is one of several experts contributing to ongoing debates over "digital civics," a framework that situates classical discussions of how individuals relate to their society within considerations of data privacy and access to digital information. In fact, Tomasello sees citizenship today as inextricably linked to the movement and storage of digital information, so much so that he points to the "datafication" of life as inherent in notions of modern citizenship.

Text 2
Datafication, as a framework for understanding civic life, has become understandably appealing though ultimately questionable in its applicability. Take, for instance, a roundtable discussion of community-wide issues, an event hosted by a local library. Although some degree of data transmission is indeed inevitable in publicizing and coordinating such an event, the most meaningful contributions would proceed less from any data gathering and more from the spontaneously spoken feedback of community members on civic issues affecting their lives.',
  null,
  'Based on the texts, how would Tomasello in Text 1 respond to the description of the civics roundtable in Text 2?',
  'medium', 'OnePrep rates this medium: 58% of its users answer it correctly, in 1:31 on average; the middle half of correct answers take 58s to 2:16.',
  '[
    {"label": "A", "body": "By concurring that spoken contributions are more valuable than digital contributions even as \"digital civics\" becomes more prevalent"},
    {"label": "B", "body": "By refuting the argument that it is possible to coordinate a civic event without some degree of technology use"},
    {"label": "C", "body": "By questioning whether awareness of community-wide issues leads to civic engagement"},
    {"label": "D", "body": "By emphasizing that some aspects of the roundtable event attest to the \"datafication\" of civic life."}]'::jsonb,
  'D', 'Why D is correct: Step 1, identify the task: "how would Tomasello in Text 1 respond." The question asks you to predict Text 1''s response to the example in Text 2. Keep the viewpoints separate: first summarize what Tomasello believes, then compare the roundtable description with that belief.

Why the others are wrong
A: Tomasello views digital and civic life as inseparable, not as competing values where one is superior. Step 1, identify Tomasello''s stance: Tomasello argues that citizenship today is "inextricably linked" to the movement of digital information.
B: Text 2 already admits that technology is necessary, so Tomasello would not need to refute that point. Step 1, check Text 2''s concession: The author of Text 2 admits that data transmission is "indeed inevitable" for publicizing the roundtable.
C: This choice introduces a relationship between awareness and engagement that neither text explores. Step 1, define the scope: The texts focus on how citizenship is defined—either by data (Text 1) or by meaningful speech (Text 2).',
  'published', 'cross_text_connections');

-- Q14 · Ganvié and Venice
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q14', 'craft_and_structure',
  'Text 1
Referred to as the "African Venice," the city of Ganvié relies on a system of canals, bridges, and small boats, much as its European counterpart does. Further parallels arise when each city''s reasons for coming into being are considered. Both Venice and Ganvié came into being because their aquatic locations offered residents refuge from uncertainty and oppression—isolation from the political instability roiling Europe after the fall of the Roman empire in the case of Venice, protection from 16th century conflicts that led to the enslavement of free Africans in the case of Ganvié.

Text 2
To an extent, parallels between Ganvié and Venice seem supportable on account of each city''s network of waterways and each city''s historical identity as a place of sanctuary. Other connections between these "floating cities" are much more tenuous. While present-day residents of Ganvié rely on boats for much basic transportation and resort to fishing as a major livelihood, contemporary residents of Venice deal little with boating, which serves mainly as a tourist attraction.',
  null,
  'Which choice best describes a difference in how the authors of Text 1 and Text 2 compare Ganvié and Venice?',
  'hard', 'OnePrep rates this hard: 71% of its users answer it correctly, in 1:47 on average; the middle half of correct answers take 1:12 to 2:31.',
  '[
    {"label": "A", "body": "The author of Text 1 places less emphasis on the political significance of waterways than the author of Text 2 does."},
    {"label": "B", "body": "The author of Text 1 is more interested in defining the traits of a traditional \"floating city\" than the author of Text 2 is."},
    {"label": "C", "body": "The author of Text 2 establishes a contrast between Venice and Ganvié that the author of Text 1 considers and then rejects."},
    {"label": "D", "body": "The author of Text 2 cites differences between Venice and Ganvié that the author of Text 1 ignores."}]'::jsonb,
  'D', 'Choice D is the best answer because the author of Text 2 says that some parallels between Venice and Ganvié are "tenuous." Specifically, their reliance on boating is a difference between the two cities. In contrast, the author of Text 1 discusses only similarities between the two cities.

Choice A is incorrect because, though political factors are discussed in only one passage, that passage is Text 1, not Text 2. Choice B is incorrect because, though the author of Text 1 discusses some traits of a traditional "floating city," the author of Text 2 does as well ("each city''s network of waterways and each city''s historical identity as a place of sanctuary"). Choice C is incorrect because, though the author of Text 2 establishes a contrast between Venice and Ganvié, the author of Text 1 does not consider or reject that contrast.',
  'published', 'cross_text_connections');

-- Q15 · Yurts
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q15', 'craft_and_structure',
  'Text 1
Yurts are portable cylindrical dwellings associated primarily with nomadic communities that inhabited flatland areas throughout Asia centuries ago. Few vast civilizations relied on yurts, yet yurts appeared in vastly different regions. Mongolia was one seat of itinerant groups who relied on yurts; Turkey was another. For his part, the Greek historian Herodotus noted the use of yurts by the Scythians (once based in parts of eastern Turkey) around 440 B.C., even though he hailed from a stationary civilization.

Text 2
Commonly used to describe iconic round buildings overlaid with canvas or cloth, the term "yurt" encompasses multiple cultures. "Yurt" is itself a Russian term applied to a building type known as ger in Mongolia, the country arguably most famous for its yurts. The Turkish word jurt, for the same dwelling type, has an obvious connection. Names may vary, but the centrality of the "yurt" in the history of peoples with ever-moving, rather than permanent, settlements is indisputable.',
  null,
  'Based on the texts, both authors would most likely agree with which statement?',
  'easy', 'OnePrep rates this easy: 67% of its users answer it correctly, in 1:18 on average; the middle half of correct answers take 50s to 1:56.',
  '[
    {"label": "A", "body": "Herodotus was a central figure in the development and popularization of yurts."},
    {"label": "B", "body": "Yurts were known of and sometimes put to use in various regions of Europe and Asia."},
    {"label": "C", "body": "Yurt construction evolved significantly as the yurt spread from Mongolia to Turkey."},
    {"label": "D", "body": "Though yurts are often associated with nomadic peoples, some modern cultures have developed sturdy and immovable yurts."}]'::jsonb,
  'B', 'Why B is correct: Step 1, find a shared idea: The question asks what both authors would agree with. We need an idea supported by each passage, even if the authors express it differently. Start by checking what each says about where yurts were used or known.

Why the others are wrong
A: While Text 1 mentions Herodotus, he is only described as an observer, and Text 2 does not mention him at all. Step 1, check Text 1: Text 1 says Herodotus "noted the use of yurts," which means he observed them, not that he developed or popularized them.
C: Both authors mention different countries, but neither provides details on how yurt construction changed over time. Step 1, look for construction: Text 2 describes yurts as "round buildings overlaid with canvas or cloth" but doesn''t mention how this design evolved between regions.
D: The passages focus on the historical, portable nature of yurts rather than modern, permanent versions. Step 1, identify yurt type: Text 2 explicitly describes yurts as being for "ever-moving, rather than permanent, settlements."',
  'published', 'cross_text_connections');

-- Q16 · Leaf insects
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q16', 'craft_and_structure',
  'Text 1
There is much to learn about so-called leaf insects, explains zoologist Stéphane Le Tirant, who is both director of the Montreal Insectarium and one of the world''s leading experts on these well-camouflaged creatures. Noting the progress that has been made in studying Phylliidae (the biological family for leaf insects) for the Insectarium''s blog, Le Tirant explains that male and female leaf insects have been consistently mistaken for insects of different species; DNA analysis is central to eliminating possible misclassifications.

Text 2
Because male leaf insects are slight in build and capable of flight while females, even within the same species, are often larger, heavier, and flightless, related male and female Phylliidae are often mistaken for members of different species. Entomologist Stéphane Le Tirant eliminated one ambiguity of this sort when, in 2019, he and a group of Montreal Insectarium technicians decided to breed leaf insects and discovered that males and females presumably from separate species hailed from the same species, Phyllium asekiense.',
  'male and female leaf insects have been consistently mistaken for insects of different species; DNA analysis is central to eliminating possible misclassifications',
  'Based on the texts, how would the author of Text 2 most likely respond to the underlined portion of Text 1?',
  'medium', 'OnePrep rates this medium: 56% of its users answer it correctly, in 1:36 on average; the middle half of correct answers take 1:03 to 2:15.',
  '[
    {"label": "A", "body": "By noting that DNA analysis was linked to the initial misidentification of the Phyllium asekiense leaf insect"},
    {"label": "B", "body": "By claiming that some methods of DNA analysis assume that male and female leaf insects are physically similar"},
    {"label": "C", "body": "By pointing out that Le Tirant has used methods other than DNA analysis to properly identify leaf insects"},
    {"label": "D", "body": "By asserting that breeding new generations of leaf insects is probably the most reliable way to identify new species"}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the task: The question asks us to imagine Text 2''s author replying to one specific claim in Text 1. Keep that direction fixed: use Text 2''s evidence to test the underlined statement.

Why the others are wrong
A: While the text mentions misidentifications, they weren''t caused by DNA analysis. Step 1, find the cause: Text 2 explains that the initial confusion about the species happened because males and females look so different physically.
B: The texts emphasize that DNA analysis is used specifically because physical appearance is unreliable. Step 1, analyze physical traits (key phrase: "male leaf insects are slight in build and capable of flight while females, even within the same species, are often larger, heavier, and flightless"): Text 2 details the physical differences between males and females to explain why they were misidentified based on sight.
D: Text 2 shows that breeding works, but it doesn''t rank its reliability against other methods. Step 1, identify the method: Text 2 notes that Le Tirant and his team "decided to breed leaf insects" to solve a specific classification problem.',
  'published', 'cross_text_connections');

-- Q17 · Saturday Night Fever
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q17', 'craft_and_structure',
  'Text 1
The film Saturday Night Fever draws much of its inspiration from the music of a single band—the Bee Gees. Songs by this 1970s disco group animate key moments in the film. For example, in the iconic opening scene, actor John Travolta walks down a city street as the Bee Gees classic "Stayin'' Alive" pulses in the background. Music by the Bee Gees is so integral to Saturday Night Fever that some viewers assume (incorrectly) that characters in this drama sing along to Bee Gees songs.

Text 2
Saturday Night Fever is not in any way a musical, even though the songs of a single band, the Bee Gees, can be heard prominently throughout the film. To be classified as a musical, the film would require characters who sing along to the songs themselves. Instead, the music of the Bee Gees provides more of a "soundtrack" to adventures of characters who never actually sing.',
  'Music by the Bee Gees is so integral to Saturday Night Fever that some viewers assume (incorrectly) that characters in this drama sing along to Bee Gees songs.',
  'Based on the texts, how would the author of Text 2 respond to the underlined portion of Text 1?',
  'easy', 'OnePrep rates this easy: 85% of its users answer it correctly, in 1:08 on average; the middle half of correct answers take 45s to 1:41.',
  '[
    {"label": "A", "body": "By explaining that both singing and movement are important to Saturday Night Fever"},
    {"label": "B", "body": "By noting that bands other than the Bee Gees contributed songs to Saturday Night Fever"},
    {"label": "C", "body": "By questioning the status of Saturday Night Fever as a classic film"},
    {"label": "D", "body": "By asserting that characters in Saturday Night Fever definitely do not sing along to songs by the Bee Gees"}]'::jsonb,
  'D', 'Why D is correct: Step 1, identify the viewers'' assumption: "some viewers assume (incorrectly) that characters in this drama sing along to Bee Gees songs." We need to explain how Text 2''s author would respond to the underlined sentence—not to the whole of Text 1. That sentence says some viewers think the characters sing along to Bee Gees songs. But "incorrectly" tells us that Text 1 already identifies this belief as a mistake.

Why the others are wrong
A: Text 2 focuses on the technical definition of a musical rather than the importance of movement. Step 1, analyze Text 2 (key phrase: "Saturday Night Fever is not in any way a musical"): Text 2 focuses on why the film is not a musical, specifically noting that characters do not sing along to the music.
B: Neither text mentions other bands, focusing only on the Bee Gees'' contribution. Step 1, review the scope (key phrase: "the songs of a single band, the Bee Gees"): Both texts focus on the Bee Gees as the primary source of the film''s iconic sound.
C: Text 2 discusses the film''s genre categorization, not its quality or classic status. Step 1, check the tone (key phrase: "To be classified as a musical"): Text 2 provides a factual analysis of the film''s genre based on whether it meets the criteria for a musical.',
  'published', 'cross_text_connections');

-- Q18 · Kael's review of Raiders of the Lost Ark
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q18', 'craft_and_structure',
  'Text 1
When running a "contrarian" negative review, a movie critic runs the immediate risk of contradicting widespread acclaim and the longer-term risk of hastily belittling a film that, eventually, becomes a classic. Commentary from celebrated critic Pauline Kael on the 1981 adventure film Raiders of the Lost Ark illustrates both liabilities. By dismissing this movie as a slick commercial venture, Kael alienated the film''s many 1980s fans and inadvertently put herself at odds with the many post-1980s critics who would cheer Raiders of the Lost Ark as a cinematic achievement.

Text 2
Pauline Kael''s derisive 1981 review of Raiders of the Lost Ark missed its immediate mark—an enjoyable and iconic film—but took aim at broader filmmaking tendencies in a way that seems stunningly on-target, in retrospect. Part of Kael''s critique revolves around the commercialistic filmmaking that she imputes to the two creators of Raiders, George Lucas and Steven Spielberg—both of whom would create later films that sacrificed quality for easy profits, in the minds of many critics.',
  null,
  'Which choice best describes a difference in how the author of Text 1 and the author of Text 2 regard Kael''s commentary on Raiders of the Lost Ark?',
  'hard', 'OnePrep rates this hard: 51% of its users answer it correctly, in 1:44 on average; the middle half of correct answers take 1:06 to 2:29.',
  '[
    {"label": "A", "body": "The author of Text 1 maintains that Kael''s review failed to anticipate future responses to Raiders of the Lost Ark, but the author of Text 2 claims that the review''s commentary on the merits of the film is significant regardless of future trends."},
    {"label": "B", "body": "The author of Text 1 suggests that Kael''s review effectively anticipated broader trends, yet the author of Text 2 renounces this approach to film criticism."},
    {"label": "C", "body": "Although the author of Text 1 questions the wisdom of Kael''s review, the author of Text 2 argues that the review uncannily anticipated later problems."},
    {"label": "D", "body": "While the author of Text 1 highlights the divisive nature of Kael''s review, the author of Text 2 suggests that her review has gained popularity over time."}]'::jsonb,
  'C', 'Why C is correct: Step 1, read the question closely: "Which choice best describes a difference in how the author of Text 1 and ..." The question asks for a difference between the authors'' views. So first summarize each text separately, then compare those two summaries without mixing up which author holds which view.

Why the others are wrong
A: Text 2 actually uses future trends to support Kael''s review rather than dismissing them as insignificant. Step 1, analyze Text 2: Text 2 argues the review was "stunningly on-target, in retrospect" because of how Lucas and Spielberg''s later films prioritised profit.
B: Option B incorrectly reverses the authors'' stances on Kael''s foresight and filmmaking analysis. Step 1, check Text 1 (key phrase: "at odds with the many post-1980s critics"): Text 1 says Kael was "at odds" with later critics, meaning she did not effectively anticipate the movie''s lasting legacy.
D: Text 2 argues that Kael''s critique was accurate in hindsight, not that it became widely popular. Step 1, evaluate popularity (key phrase: "took aim at broader filmmaking tendencies"): Text 2 notes that Kael''s review was "on-target" regarding filmmaking trends, but it never mentions if the review itself became popular.',
  'published', 'cross_text_connections');

-- Q19 · Arcade game preservation
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q19', 'craft_and_structure',
  'Text 1
Albeit inadvertently, businesses that house large numbers of older "arcade-style" videogames contribute to the preservation of cultural moments from the twentieth century by housing defunct games and making sure that they remain playable. Due to the absence of widespread, systematic efforts to collect arcade game consoles and software, the survival of several games that date back decades hinges upon the seemingly random inclusion of particular titles in restaurant and "retro arcade" settings that exist primarily for leisure.

Text 2
Small restaurant-style businesses that maintain arcade-style videogames (individual large machines often dedicated to one game each) do not systematically contribute to videogame preservation, given the likelihood that a malfunctioning game will be discarded and replaced (as the most financially expedient option versus costly upkeep). Rather, companies such as Play Leisure, which sources and restores dozens of old games before reselling them, prove more significant to making sure that arcade titles and consoles from the 1970s onwards do not disappear completely.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely disagree about the answer to which question?',
  'hard', 'OnePrep rates this hard: 55% of its users answer it correctly, in 1:37 on average; the middle half of correct answers take 1:04 to 2:22.',
  '[
    {"label": "A", "body": "Do arcade-style small businesses participate in a broad-based, formal effort to preserve seemingly outdated video games?"},
    {"label": "B", "body": "Would a company that independently restores arcade-style video games be likely to sell those games to other businesses?"},
    {"label": "C", "body": "Does the preservation of arcade-style video games most directly result from the activity of businesses that function as arcades and restaurants?"},
    {"label": "D", "body": "Would most of the games found in contemporary arcade- and restaurant-style businesses be recognizable to video game enthusiasts from the 1970s?"}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the task: "...author of Text 2 would most likely disagree about the answer to which question?" The question asks for a question on which the two authors would give different answers. Read each text separately, then compare their main claims—not merely details that both mention.

Why the others are wrong
A: Both authors agree that small business efforts are not formal or systematic. Step 1, check Text 1 (key phrase: "absence of widespread, systematic efforts"): Text 1 explicitly notes the absence of systematic preservation efforts, calling the inclusion of titles in restaurants "seemingly random."
B: Text 1 never discusses restoration companies or their sales practices. Step 1, identify the gap (key phrase: "reselling them"): Text 2 mentions that companies like Play Leisure "resell" games, but Text 1 is entirely silent on where restored games go.
D: The texts focus on how games are preserved, not whether enthusiasts would recognize them. Step 1, identify the topic (key phrase: "remain playable"): Both texts mention games from the 1970s and 20th century, but they focus on the logistics of keeping them playable.',
  'published', 'cross_text_connections');

-- Q20 · Ida Presti
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q20', 'craft_and_structure',
  'Text 1
Ida Presti was one of the foremost classical guitarists of the 1950s and 1960s, notable for developing techniques that expanded both the expressive range and sheer volume of the acoustic guitar. She also performed alongside one of the few musicians who could approximate her talents: her own husband, Alexandre Legoya. Even then, her prowess was impossible to overshadow, and contemporary guitarists such as Sharon Isbin have hinted that Presti was a more virtuosic performer than Legoya.

Text 2
In a 2024 interview, guitarist Alice Artzt reflected on the duo performances of one of her mentors, French musician Ida Presti. When Presti performed with her husband, Alexandre Legoya, Presti was "incomparably amazing" and mostly took the lead in the performances; Legoya, though "physically stronger," was "the student for sure" in Artzt''s depiction. Presti even compensated for this "physical" deficiency by adopting a method of hitting strings directly with her fingernails, thus augmenting her instrument''s volume.',
  null,
  'Which choice best describes a similarity in how Isbin (Text 1) and Artzt (Text 2) view Ida Presti?',
  'medium', 'OnePrep rates this medium: 79% of its users answer it correctly, in 1:27 on average; the middle half of correct answers take 57s to 2:08.',
  '[
    {"label": "A", "body": "Both depict Presti as a stronger performer than Legoya while acknowledging Legoya''s level of talent."},
    {"label": "B", "body": "Both assert that Presti effectively worked around the limitations in classical guitar techniques."},
    {"label": "C", "body": "Both imply that Presti''s frequent duo performances have wrongly overshadowed Presti''s work as a soloist."},
    {"label": "D", "body": "Both suggest that Legoya''s approach to classical guitar evolved as a result of Presti''s influence."}]'::jsonb,
  'A', 'Why A is correct: Step 1, read the comparison: "Which choice best describes a similarity in how Isbin (Text 1) and Artzt (Text 2) view Ida Presti?" The question asks for a similarity: a view that both Isbin and Artzt express about Ida Presti. Check each text separately, then keep only the shared idea.

Why the others are wrong
B: While Presti innovated, neither text suggests she was restricted by "limitations" of the genre. Step 1, identify innovations (key phrases: "expanded both the expressive range", "adopting a method"): Text 1 notes Presti "expanded" the guitar''s range, while Text 2 describes her unique fingernail technique.
C: The texts compare Presti to Legoya rather than evaluating the impact of their duo on her solo career. Step 1, check solo mentions (key phrases: "performed alongside", "duo performances"): Text 1 focuses on her overall talent and Text 2 specifically discusses "duo performances."
D: Even if Text 2 implies a teaching dynamic, Text 1 focuses only on comparing their skill levels. Step 1, look for influence (key phrase: "the student for sure"): Text 2 calls Legoya "the student," but Text 1 simply compares their virtuosity without suggesting Legoya''s style changed.',
  'published', 'cross_text_connections');

-- Q22 · Nietzsche and Greek drama
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q22', 'craft_and_structure',
  'Text 1
In his 1872 treatise The Birth of Tragedy, German philosopher Friedrich Nietzsche argued that ancient Greek plays incorporated two forces: an "apollonian" sense of rationality and a "dionysian" impulse towards extreme, unbridled emotion. Truly compelling drama balanced the two, while Nietzsche traced the decline of Greek tragedy to an overabundance of apollonian reason. It is a fascinating framework, but virtually useless to modern students, scholars, and viewers of theater generally, who are more concerned with assessing Greek dramas scene by scene than with ruminating upon generalities.

Text 2
Friedrich Nietzsche''s criteria for evaluating ancient Greek plays, which presumably required a balance of overpowering emotion and controlled logic, can seem overly broad by today''s standards. Yet one audience can benefit from his framework: theater critics. Journalists who evaluate today''s dramas must resort to overarching judgments in any case, and Nietzsche''s spectrum of thought and feeling can help these critics to gauge if a performed play is too collected, too crazed, or just right.',
  null,
  'Which choice best describes how Text 1 and Text 2 relate to each other?',
  'easy', 'OnePrep rates this easy: 71% of its users answer it correctly, in 1:18 on average; the middle half of correct answers take 48s to 1:57.',
  '[
    {"label": "A", "body": "Text 2 disputes the historical accuracy of several statements in Text 1."},
    {"label": "B", "body": "Text 2 criticizes a specific play that is praised at length in Text 1."},
    {"label": "C", "body": "Text 2 offers a biographical profile of a figure mentioned in Text 1."},
    {"label": "D", "body": "Text 2 sets forward an important exception to the critique in Text 1."}]'::jsonb,
  'D', 'Why D is correct: Step 1, read Text 1 (key phrase: "It is a fascinating framework, but virtually useless to modern students, scholars, and viewers of theater generally, who are more concerned with assessing Greek dramas scene by scene"): Text 1 presents Nietzsche''s view: strong drama combines rational thinking with intense emotion. The author then criticizes that framework as nearly useless for most modern people who study or watch theater, because they focus on individual scenes rather than broad theories.

Why the others are wrong
A: Text 2 challenges the utility of the critique, not the historical facts presented. Step 1, check for factual disputes (key phrase: "virtually useless to modern students"): Text 1 describes Nietzsche''s theory and claims it is unusable for modern students, but it doesn''t list historical facts that Text 2 then refutes.
B: Neither text names or analyzes a specific play in detail. Step 1, check the scope (key phrase: "ancient Greek plays"): Both texts discuss "ancient Greek plays" or "drama" as general categories rather than focusing on a single specific work.
C: The texts focus on Nietzsche''s philosophical framework rather than his life story. Step 1, analyze the content (key phrase: "can help these critics to gauge if a performed play is too collected, too crazed, or just right"): Text 2 focuses on how Nietzsche''s spectrum of thought can help modern critics; it does not provide details about Nietzsche''s personal life or history.',
  'published', 'cross_text_connections');

-- Q23 · Bernini and Renaissance theatricality
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q23', 'craft_and_structure',
  'Text 1
Renaissance artworks synthesized the visual arts and theater in ways that brought some of these forms of expression to the artistic forefront in surprising ways. Among modern commentators, Renaissance Italy stands out not as a site of theatrical production but as a leading center of painting, sculpture, and poetry, yet the reality is that theatrical training and the principles of stage design guided Giovanni Bernini''s masterpiece of baroque sculpture The Ecstasy of Saint Teresa (1647-1652).

Text 2
A characterization of the Italian Renaissance as "theatrical" applies primarily if not exclusively to the later stages of this era. The paintings of Caravaggio in the late 1500s and early 1600s depict climactic scenes that could have appeared in dramas, and Bernini''s The Ecstasy of Saint Teresa both creates an emphatic "theatrical" sense of motion and places its figures in a stage-like space. Yet from the 1300s to the mid 1500s, Italian Renaissance sculptors and painters mostly avoided theatrical trappings in favor of more staid depictions of isolated human figures.',
  'theatrical training and the principles of stage design guided Giovanni Bernini''s masterpiece',
  'Based on the texts, how would the author of Text 2 regard the underlined characterization of The Ecstasy of Saint Teresa in Text 1?',
  'hard', 'OnePrep rates this hard: 56% of its users answer it correctly, in 1:40 on average; the middle half of correct answers take 1:06 to 2:25.',
  '[
    {"label": "A", "body": "As an effective exemplification of trends that appeared in a specific phase of the Italian Renaissance"},
    {"label": "B", "body": "As a thorough misinterpretation of the unique qualities of Bernini''s sculpture"},
    {"label": "C", "body": "As an understandable but unsuccessful attempt to extend the concept of Renaissance \"theatricality\" beyond Italian painting and sculpture"},
    {"label": "D", "body": "As a misunderstanding of the role of theatrical conventions in a formative early period of the Renaissance in Italy"}]'::jsonb,
  'A', 'Why A is correct: Step 1, read the question direction: "how would the author of Text 2 regard the underlined characterization." The question asks how the author of Text 2 would view one specific claim from Text 1. So keep the authors'' positions separate: first identify Text 1''s claim, then compare it with Text 2''s comments about Bernini''s sculpture.

Why the others are wrong
B: Text 2 actually agrees with the description of Bernini''s work as theatrical. Step 1, check for agreement (key phrase: "creates an emphatic ''theatrical'' sense of motion"): Text 1 claims Bernini''s work was guided by stage design. Text 2 supports this, stating it creates an emphatic "theatrical" sense of motion.
C: The example used in Text 1 is a sculpture, so it doesn''t extend beyond that medium. Step 1, identify the medium (key phrase: "The Ecstasy of Saint Teresa (1647-1652)"): Text 1 identifies the work as a sculpture, and Text 2 discusses theatricality within painting and sculpture.
D: Bernini''s work is from the late Renaissance, not the early period. Step 1, check the dates (key phrase: "from the 1300s to the mid 1500s"): Text 1 dates the sculpture to the mid-1600s, while Text 2 defines the early Renaissance as 1300s to mid 1500s.',
  'published', 'cross_text_connections');

-- Q24 · Small robots
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q24', 'craft_and_structure',
  'Text 1
Powering an entire car with an external form of energy like incoming solar rays or radio waves is not yet possible, but the MilliMobile, a thumbprint-sized robot developed by researchers at the University of Washington, points the way to such futuristic vehicles. Each MilliMobile robot moves along on wheels and can carry equipment much like a lunar rover does. Individual robots can even be programmed to gravitate toward the same light sources that power MilliMobile engines, massing to move unexpectedly large obstacles.

Text 2
Despite innovations in powering small robots with renewable energy, the real potential of such robots resides in aggregates—in the ability of robot clusters to complete construction or surveying tasks. Aggregates of this sort could also address one of the inherent disadvantages of larger single robots, which must be engineered for flexibility component by component and break easily. If one small robot slips out of place and breaks, dozens will be waiting to replace it.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree with which statement?',
  'hard', 'OnePrep rates this hard: 49% of its users answer it correctly, in 1:48 on average; the middle half of correct answers take 1:11 to 2:34.',
  '[
    {"label": "A", "body": "Several small robots could be programmed to cooperate on tasks that a single small robot might not be able to fulfill on its own."},
    {"label": "B", "body": "Current small robot designs were often intended as miniaturized versions of designs for larger robots, including robots that move like wheel-based rovers."},
    {"label": "C", "body": "The use of renewable energy in aggregating small robots would directly remove some of the liabilities associated with larger robots."},
    {"label": "D", "body": "The physical tasks that small robots could perform are most efficiently completed at present by vehicles and devices that require constant human supervision."}]'::jsonb,
  'A', 'Why A is correct: Step 1, read both claims: "author of Text 1 and the author of Text 2." The question asks for a statement that both authors would accept. So first reduce each text to its main point. Text 1: small robots can be powered by unusual energy sources, and several robots can work together to move large obstacles. Text 2: the greatest promise of small robots is their ability to form groups that complete large tasks; groups can also replace individual robots that fail.

Why the others are wrong
B: While Text 1 compares a robot to a rover, neither author claims small robots are meant to be miniaturized versions of large ones. Step 1, check design intent (key phrase: "much like a lunar rover does"): Text 1 compares robot movement to a lunar rover, but it doesn''t say the robot was designed to be a miniature version of one.
C: Text 2 attributes the removal of liabilities to the robots'' ability to cluster, not to their energy source. Step 1, locate the liability (key phrase: "If one small robot slips out of place and breaks, dozens will be waiting to replace it."): Text 2 says aggregates address disadvantages of large robots because they are replaceable, not because of their power source.
D: Neither text discusses the efficiency or necessity of human supervision for current physical tasks. Step 1, check for a human role: The texts compare small robots to large ones and discuss autonomous movement, but they never mention human supervision.',
  'published', 'cross_text_connections');

-- Q25 · Pop-up stores
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q25', 'craft_and_structure',
  'Text 1
Pop-up stores appear from time to time in shopping districts of all sizes. These stores are not meant to last. Rather, for a few days or a few weeks, a pop-up store sells specialized goods, often related to a popular trend or entertainment series. The various long-term benefits of this tendency are badly underestimated. Individual pop-up stores earn immense amounts of money in a short time, can make use of otherwise disregarded retail space, and can inspire additional successful pop-up stores.

Text 2
Nobody in a local town or city economy benefits significantly from a pop-up store. In fact, large corporations claim almost all of the beneficial effects of these stores. While pop-up stores can promote a brand, they are (despite their temporary nature) too difficult for small and medium sized retailers to manage. The largest entities, then, are best able to use pop-up stores for quick publicity.',
  'Nobody in a local town or city economy benefits significantly from a pop-up store.',
  'Based on the texts, how would the author of Text 1 reply to the underlined claim in Text 2?',
  'easy', 'OnePrep rates this easy: 87% of its users answer it correctly, in 1:15 on average; the middle half of correct answers take 45s to 2:00.',
  '[
    {"label": "A", "body": "By agreeing that the presence of pop-up stores is mostly problematic"},
    {"label": "B", "body": "By noting that large businesses never use pop-up stores"},
    {"label": "C", "body": "By arguing that pop-up stores offer important benefits to shopping districts"},
    {"label": "D", "body": "By explaining that many pop-up stores last for several years"}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the response: "how would the author of Text 1 reply to the underlined claim in Text 2?" (key phrase: "Nobody in a local town or city economy benefits significantly from a pop-up store"). The question asks what the author of Text 1 would say back to a claim in Text 2. So keep the two authors'' views separate: first find Text 1''s main point, then compare it with the underlined claim.

Why the others are wrong
A: The author of Text 1 views pop-up stores positively and would not describe them as "problematic." Step 1, analyze Text 1''s tone (key phrase: "badly underestimated"): Text 1 states that the benefits of pop-up stores are "badly underestimated" and that they provide "long-term benefits."
B: Text 1 does not make any claims about whether large businesses use pop-up stores. Step 1, check Text 1''s evidence: Text 1 focuses on the stores'' effects on districts, not on whether large or small companies operate them.
D: Both authors agree that pop-up stores are temporary, not long-lasting. Step 1, check store duration (key phrase: "not meant to last"): Text 1 explicitly says pop-up stores are "not meant to last" and exist for only "a few days or a few weeks."',
  'published', 'cross_text_connections');

-- Q26 · Spielberg and The Color Purple
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q26', 'craft_and_structure',
  'Text 1
By the mid 1980s, Steven Spielberg had garnered a reputation for directing sensational science fiction movies such as Close Encounters of the Third Kind and E.T. the Extra-Terrestrial. Then, in 1985, he helmed the screen adaptation of Alice Walker''s novel The Color Purple, an intensely realistic depiction of a rural African American community. Seemingly a departure from his usual tendencies, Spielberg''s adaptation actually revealed the director''s abiding interest in finely delineated conflicts and historical forces—as did several of the Spielberg movies that followed.

Text 2
Assuming that a given director should be confined to a single genre does a disservice to filmmakers of enormous talent. For instance, Steven Spielberg was admittedly a surprising choice to direct The Color Purple (1985) and was also an appropriate fit for the material. Walker''s novel relies on intimate moments and keen character portrayals, as do both the Spielberg science fiction adventures that preceded the Walker adaptation and the various Spielberg historical epics that followed.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree about the answer to which question?',
  'medium', 'OnePrep rates this medium: 45% of its users answer it correctly, in 1:30 on average; the middle half of correct answers take 1:00 to 2:10.',
  '[
    {"label": "A", "body": "Are Spielberg''s science fiction films the most popular films that he created?"},
    {"label": "B", "body": "Are there continuities between Spielberg''s adaptation of The Color Purple and some of Spielberg''s other films?"},
    {"label": "C", "body": "Could a director other than Spielberg have adapted The Color Purple from novel to film in an effective way?"},
    {"label": "D", "body": "Could a director of Spielberg''s level of talent hypothetically make outstanding contributions to all genres of film?"}]'::jsonb,
  'B', 'Why B is correct: Step 1, find a shared claim: We need a question that both authors would answer the same way, using evidence from each text. Start by finding what each author says about how The Color Purple connects to Spielberg''s other films.

Why the others are wrong
A: Neither text discusses the popularity or commercial success of Spielberg''s films. Step 1, check the focus (key phrase: "garnered a reputation for directing sensational science fiction movies"): Text 1 mentions Spielberg''s reputation for sci-fi, but neither text provides data on which of his films were the most popular.
C: The authors focus on why Spielberg was successful, not whether others could have been. Step 1, examine scope (key phrase: "appropriate fit for the material"): Text 2 states Spielberg was an "appropriate fit," but neither text speculates on alternative directors for the project.
D: This claim is far more general than the specific observations made about Spielberg''s career. Step 1, identify over-generalization (key phrase: "confined to a single genre"): Text 2 argues against limiting talented directors to one genre, but it doesn''t claim they can excel in every single genre.',
  'published', 'cross_text_connections');

-- Q27 · Digital etiquette and productivity
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q27', 'craft_and_structure',
  'Text 1
For Erica Dhawan, deficiencies in online etiquette do not simply translate to strained social contact: they are detrimental to workplace productivity. The leadership expert and author of Digital Body Language argues that poor digital communication and lapses in online courtesy can take up a tenth of an average workweek, all while placing a strain on the most sensitive workplace relationships. Communication between managers and lower-ranking employees—already a tense matter in some companies—can be undermined by deficiencies in digital etiquette.

Text 2
One straightforward way to increase workplace productivity is to cut down on "digital distraction," to take data journalist Alexandra Samuel''s term. Though she sees digital contact as a way to "spark new relationships," she cautions that such connection, unless engaged in sparingly and systematically, can result in polite though trifling contact that drains the energies of employees and executives alike.',
  null,
  'Based on the texts, how would Alexandra Samuel in Text 2 most likely respond to Dhawan''s ideas about "workplace productivity" in Text 1?',
  'easy', 'OnePrep rates this easy: 70% of its users answer it correctly, in 1:14 on average; the middle half of correct answers take 48s to 1:48.',
  '[
    {"label": "A", "body": "By agreeing with Dhawan that digital body language is a useful topic for further study"},
    {"label": "B", "body": "By faulting Dhawan for completely ignoring the relationship between productivity and technology"},
    {"label": "C", "body": "By noting that digital body language is most important at the executive level"},
    {"label": "D", "body": "By cautioning that some forms of digital communication can in fact harm workplace productivity"}]'::jsonb,
  'D', 'Why D is correct: Step 1, read the question direction: "how would Alexandra Samuel in Text 2 most likely respond to Dhawan''s ideas about ''workplace productivity'' in Text 1?" The question asks how Samuel in Text 2 would respond to Dhawan''s ideas in Text 1. Keep the speakers'' views separate: we need Samuel''s reaction to the shared issue of workplace productivity, not a claim about what Dhawan would say.

Why the others are wrong
A: Samuel focuses on digital distraction rather than endorsing Dhawan''s specific terminology. Step 1, check terminology (key phrase: "digital distraction"): While Text 1 names Dhawan''s book Digital Body Language, Text 2 shows that Samuel uses her own term, "digital distraction."
B: Dhawan does not ignore the relationship between productivity and technology; she makes it her central focus. Step 1, review Text 1 (key phrase: "detrimental to workplace productivity"): Dhawan argues that digital etiquette deficiencies are "detrimental to workplace productivity," showing she is very aware of this relationship.
C: Samuel suggests that digital contact can drain the energies of both employees and executives. Step 1, look at the scope (key phrase: "employees and executives alike"): Samuel warns that digital contact can drain the energies of both "employees and executives alike."',
  'published', 'cross_text_connections');

-- Q28 · Forgetting and memory
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q28', 'craft_and_structure',
  'Text 1
For Robert and Elizabeth Bjork, authors of the influential 1992 paper "The New Theory of Disuse," forgetting a fact over a long period of time is by no means completely counterproductive to the formation of strong memories. Rather, the downtime between when a fact is first encountered and when it is then retrieved after a period of forgetfulness ensures that more effort will be expended recalling the fact—and that the fact will be better remembered in the long run.

Text 2
Seminal research findings in cognitive science suggest that forgetfulness can in fact be an asset in some thought processes, yet the oddly beneficial effects of forgetfulness were intuited generations before today''s experts performed their research. Marcel Proust''s 1913 novel In Search of Lost Time depicts a protagonist whose memories rush back, strengthened and enriched, after long periods of forgetfulness; an entire book, Joshua Lehrer''s Proust was a Neuroscientist, is premised on Proust''s uncanny intuitions about forgetfulness and memory.',
  null,
  'Based on the texts, Robert and Elizabeth Bjork in Text 1 and the author of Text 2 would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 81% of its users answer it correctly, in 1:34 on average; the middle half of correct answers take 1:03 to 2:15.',
  '[
    {"label": "A", "body": "Depictions of forgetfulness in literature have often been responses to the work of recent cognitive scientists."},
    {"label": "B", "body": "The idea that forgetfulness is detrimental has become more popular despite the emergence of new research suggesting the opposite."},
    {"label": "C", "body": "Forgetfulness results from making an unreasonable effort to remember a small number of facts."},
    {"label": "D", "body": "Temporary periods of forgetfulness are enormously useful in imparting new strength and vividness to specific memories."}]'::jsonb,
  'D', 'Why D is correct: Step 1, find the shared claim: "...author of Text 2 would most likely agree with which statement?" The question asks what the Bjorks and the author of Text 2 would agree with. We need a claim supported by both texts, so first identify what each says about how forgetting affects memory.

Why the others are wrong
A: Text 2 states that literary intuitions existed long before modern research. Step 1, check the timeline (key phrase: "intuited generations before today''s experts performed their research"): Text 2 notes that the beneficial effects of forgetfulness were intuited generations before today''s research, using a 1913 novel as an example.
B: Neither text discusses how popular the opposite viewpoint has become. Step 1, analyze the focus (key phrase: "forgetting a fact over a long period of time is by no means completely counterproductive"): While both texts argue that forgetfulness is not detrimental, they focus on the science and literary examples rather than public opinion trends.
C: Text 1 says retrieval requires effort, but it doesn''t say effort causes forgetting. Step 1, examine the effort (key phrase: "more effort will be expended recalling the fact"): Text 1 mentions that effort is used to recall a fact after it has been forgotten, which helps long-term retention.',
  'published', 'cross_text_connections');

-- Q29 · The doors in Exit West
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q29', 'craft_and_structure',
  'Text 1
Mohsin Hamid''s 2017 novel Exit West mostly confronts the harsh realities of international displacement and migration, but there is one fantastical motif in Hamid''s narrative: a system of portals known simply as "doors." These openings to new locations and new fates are at once frightening and exhilarating. When Hamid''s main characters leave their home, a war-torn city, they follow the doors through an ingeniously connected series of adventures, as Hamid deftly juxtaposes the fantasy of escape with a sense of humanistic purpose.

Text 2
Rather than enlivening Exit West, the magical "doors" that guide the fates of Hamid''s characters remove some of the tension and conflict that should be central to the novel''s topic. Overall, Exit West seeks to present the hardships and triumphs faced by international refugees. The doors, which allow instant transportation, are fundamentally out of place in an otherwise grounded approach and prevent Hamid from fully addressing the disheartening delays and the possibility of failure that refugees face when crossing national borders.',
  null,
  'Which choice best describes a difference in how the two authors analyze the "doors" in Exit West?',
  'medium', 'OnePrep rates this medium: 65% of its users answer it correctly, in 1:23 on average; the middle half of correct answers take 51s to 2:05.',
  '[
    {"label": "A", "body": "The author of Text 2 is much less enthusiastic about the \"doors\" than the author of Text 1 is."},
    {"label": "B", "body": "The author of Text 2 finds the \"doors\" harder to explain than the author of Text 1 does."},
    {"label": "C", "body": "The author of Text 1 construes the \"doors\" as mostly unimportant, yet the author of Text 2 sees the \"doors\" as central to Hamid''s novel."},
    {"label": "D", "body": "Although the author of Text 1 sees the doors as realistic, the author of Text 2 understands the doors as purely imaginative."}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify the comparison: "Which choice best describes a difference in how the two authors analyze the ''doors'' in Exit West?" The question asks how the two authors'' views of the same feature differ. Read each text separately, then compare their attitudes toward the doors—not just whether both discuss them.

Why the others are wrong
B: This option mistakes a difference in opinion for a difference in understanding. Step 1, check for confusion (key phrase: "The doors, which allow instant transportation, are fundamentally out of place"): Both authors offer clear, confident explanations of how the doors function in the story, even though they disagree on their impact.
C: This option incorrectly suggests that Text 1 dismisses the importance of the doors. Step 1, check importance (key phrase: "humanistic purpose"): Text 1 describes the doors as a key motif that connects adventures and provides a sense of "humanistic purpose," suggesting they are quite important.
D: Both authors acknowledge that the doors are a supernatural or fantastical element. Step 1, identify descriptions (key phrase: "fantastical motif"): Text 1 explicitly labels the doors as a "fantastical motif," showing the author knows they are not meant to be realistic.',
  'published', 'cross_text_connections');

-- Q30 · GPM J1839-10
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q30', 'craft_and_structure',
  'Text 1
Astrophysicists participating in a project led by Natasha Hurley-Walker have found themselves puzzled by GPM J1839-10, an anomalous stellar object. By some accounts, GPM J1839-10 could be a magnetar—a neutron star that produces unusually strong magnetic fields. Yet as Hurley-Walker and colleagues admit, this supposition seems shaky. Typical magnetars emit radio waves every few seconds; GPM J1839-10 emits radio waves at a much larger interval of roughly 22 minutes.

Text 2
Hoping to achieve clarity about the identity of a perplexing stellar body known as GPM J1839-10, Natasha Hurley-Walker surveyed fellow experts in astronomy. Her poll did not, however, result in a definitive classification—quite the opposite. Reflecting on whether GPM J1839-10 is a magnetar, a white dwarf star, or another type of star, Hurley-Walker opined that GPM J1839-10 "just breaks all the rules. It''s why it''s such an exciting result." Indeed, the experts she polled did not return a decisive majority judgment of the identity of GPM J1839-10.',
  null,
  'Based on the texts, both authors would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 77% of its users answer it correctly, in 1:35 on average; the middle half of correct answers take 57s to 2:27.',
  '[
    {"label": "A", "body": "GPM J1839-10 could be plausibly classified as a white dwarf but not as a magnetar."},
    {"label": "B", "body": "There is a strong possibility that GPM J1839-10 could be identified as a neutron star."},
    {"label": "C", "body": "The magnetic fields emitted by GPM J1839-10 are much stronger than those emitted by a white dwarf star."},
    {"label": "D", "body": "No consensus exists about the classification of GPM J1839-10."}]'::jsonb,
  'D', 'Why D is correct: Step 1, find the shared view: "both authors would most likely agree." We need a statement that both authors would accept, not just a detail from one text. Track what each text says about whether scientists have settled on a type of star for GPM J1839-10.

Why the others are wrong
A: This option incorrectly rules out a magnetar classification. Step 1, check Text 1 (key phrase: "could be a magnetar"): Text 1 says the object "could be a magnetar," even if the evidence is "shaky," rather than ruling it out entirely.
B: The texts do not claim there is a "strong" possibility for any specific classification. Step 1, identify mentions (key phrase: "this supposition seems shaky"): Text 1 defines a magnetar as a neutron star, but it calls the magnetar classification "shaky."
C: This option introduces a comparison between magnetic fields that is not found in either text. Step 1, search for data (key phrase: "produces unusually strong magnetic fields"): While Text 1 mentions magnetars produce strong magnetic fields, it never compares them to those of white dwarfs.',
  'published', 'cross_text_connections');

-- Q32 · Courtroom TV shows
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q32', 'craft_and_structure',
  'Text 1
Daytime television shows that broadcast legal proceedings, though a fixture in contemporary entertainment, provide incomplete knowledge of the judicial system itself. For a format that is readily understandable, these programs routinely focus on cases that can be argued about in blatant terms and resolved relatively quickly (such as the person-to-person financial disputes that would normally reach small claims courts) rather than recording more extensive cases that are more representative of the laborious process of conducting litigation.

Text 2
Never meant to be principally educational, television programs that broadcast legal proceedings can, under some circumstances, teach viewers basic principles about how basic courtroom protocols or relatively simple trials are handled. Little knowledge could be gleaned otherwise, as a result of the ends that these programs are meant to achieve. Ultimately, such television shows function mainly to emphasize the vivid personality of a central figure (i.e., a presiding judge) or to emphasize the equally outlandish behavior of parties directly involved in the legal proceedings.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree about the answer to which question about television programs that record legal proceedings?',
  'hard', 'OnePrep rates this hard: 61% of its users answer it correctly, in 1:47 on average; the middle half of correct answers take 1:09 to 2:33.',
  '[
    {"label": "A", "body": "Are most of the cases that are considered on programs of this sort capable of being handled in small claims courts?"},
    {"label": "B", "body": "Are programs that revolve around memorable central figures less educational than those that address relatively simple cases?"},
    {"label": "C", "body": "Can the programs convey a few basic facts about the workings of a courtroom?"},
    {"label": "D", "body": "Can the priorities of these programs be adjusted to emphasize relatively simple cases instead of the personalities of the participants?"}]'::jsonb,
  'C', 'Why C is correct: Step 1, look for a shared answer: We need a question that both authors would most likely answer the same way. A choice may repeat a detail from one text, but we also need evidence for the other author''s view.

Why the others are wrong
A: This option fails because only Text 1 mentions small claims courts. Step 1, check Text 1 (key phrase: "small claims courts"): Text 1 specifically notes that these programs focus on simple disputes, such as those that would reach small claims courts.
B: This option is incorrect because Text 1 does not mention central figures or personalities. Step 1, analyze Text 2 (key phrase: "vivid personality of a central figure"): Text 2 claims shows focus on the vivid personality of a central figure, which limits the knowledge viewers can gain.
D: This option is wrong because neither author discusses changing the priorities of the shows. Step 1, review the current state (key phrase: "routinely focus on cases"): Both authors describe the shows as they currently exist, focusing on simple cases or big personalities.',
  'published', 'cross_text_connections');

-- Q33 · Killifish
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q33', 'craft_and_structure',
  'Text 1
Biologists have noted that a species of killifish (Anablepsoides hartii) native to the waters of Trinidad can adapt to environmental stressors in any one of a few different manners. Perhaps the most dramatic of these is the ability of A. hartii to become at least temporarily amphibious, escaping predation through brief spates of time on land, though research by Matthew Walsh and Christopher Roden also reveals that A. hartii can also modulate its egg-laying patterns in the presence of aquatic predators to ensure the survival of its offspring.

Text 2
New observations of A. hartii by Matthew Walsh and Christopher Roden illustrate the extent to which these killifish alter their egg-laying tendencies, which can be changed with surprising rapidity when the incidence of predators in the environment of these diminutive fish rises. Yet for the researchers, this work has implications beyond one species: Walsh explains that findings relevant to killifish adaptability could facilitate an understanding of how marine species more broadly respond to stressors ranging from predation to climate change.',
  null,
  'Based on the texts, how would the author of Text 2 respond to the information about Walsh and Roden''s research presented in Text 1?',
  'hard', 'OnePrep rates this hard: 68% of its users answer it correctly, in 1:41 on average; the middle half of correct answers take 1:04 to 2:24.',
  '[
    {"label": "A", "body": "By highlighting the extent to which Walsh sees research on killifish as applicable to other marine species that face environmental stressors"},
    {"label": "B", "body": "By emphasizing the ways in which the research shifted focus from amphibious responses to predation to ecosystem-wide responses to climate change"},
    {"label": "C", "body": "By calling attention to the fact that Walsh and Roden ultimately regard killifish as tangential to their research on marine species"},
    {"label": "D", "body": "By suggesting that Walsh initially underestimated the extent to which climate change impacts the egg-laying patterns of A. hartii killifish"}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify the finding (key phrase: "research by Matthew Walsh and Christopher Roden also reveals that A. hartii can also modulate its egg-laying patterns in the presence of aquatic predators to ensure the survival of its offspring"): We need to explain how Text 2''s author would respond to Text 1''s account of Walsh and Roden''s research. Text 1 says their research shows that killifish can change their egg-laying patterns when aquatic predators are present, helping their offspring survive. This is the finding Text 2''s author would address.

Why the others are wrong
B: Text 2 mentions climate change as a broad application, not as a replacement for the study''s original focus. Step 1, check the focus (key phrase: "respond to stressors ranging from predation to climate change"): While Text 2 mentions climate change, it presents it as a broader implication for other species, not a shift in the research focus of the killifish study itself.
C: Walsh sees killifish findings as potentially useful for understanding other species, not as a side note. Step 1, analyze the relationship (key phrase: "facilitate an understanding"): Text 2 states that findings about killifish are used to understand marine species more broadly, meaning the killifish are the primary subject of the study.
D: The text links climate change to marine species in general, not specifically to killifish egg-laying. Step 1, check the variables (key phrase: "modulate its egg-laying patterns in the presence of aquatic predators"): Text 1 and 2 discuss egg-laying in response to aquatic predators, not climate change.',
  'published', 'cross_text_connections');

-- Q34 · EHL friction
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q34', 'craft_and_structure',
  'Text 1
Engineer Lilian Hsiao and colleagues arrived at a broad scientific principle while investigating a potentially niche problem—how a robotic arm can lift a wet object without dropping it. At the core of the solution is elastohydrodynamic lubrication (or EHL) friction. The presence of a film of fluid between two solid objects introduces EHL forces, and heightening such friction—a goal achieved by patterning solid surfaces—correspondingly makes a robotic claw less likely to lose its grip on a moist object''s surface.

Text 2
Recent research led by Lilian Hsiao, who has investigated a seemingly obscure physical force known as elastohydrodynamic lubrication (EHL) friction, opens a series of broader implications in biomedicine and bio-inspired design. For one, robotic arms that depend on EHL friction can, with the new understanding achieved by Hsiao and colleagues, be refined to perform more efficient surgeries; for another, biological structures including human fingerprints offer templates for the patterned surfaces essential for generating EHL friction in all its forms.',
  'Engineer Lilian Hsiao and colleagues arrived at a broad scientific principle while investigating a potentially niche problem—how a robotic arm can lift a wet object without dropping it.',
  'Based on the texts, how would the author of Text 2 respond to the characterization of Hsiao and colleagues'' research in the underlined sentence in Text 1?',
  'hard', 'OnePrep rates this hard: 69% of its users answer it correctly, in 1:18 on average; the middle half of correct answers take 48s to 1:58.',
  '[
    {"label": "A", "body": "By agreeing with the general depiction of Hsiao''s research, in part because frictional forces will typically impede the movements of a robotic arm"},
    {"label": "B", "body": "By rejecting the idea of a \"niche\" problem, since EHL friction has important applications to biological and medical science"},
    {"label": "C", "body": "By questioning whether the interactions of moisture and EHL friction account for all aspects of effective performance in a robotic arm"},
    {"label": "D", "body": "By cautioning that current ideas about the role of EHL friction in bio-inspired design remain rudimentary"}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify the comparison: "how would the author of Text 2 respond to the characterization of Hsiao and colleagues'' research in the underlined sentence in Text 1?" The question asks you to compare the authors'' views. Focus on the exact description in Text 1, then ask whether Text 2 supports it, challenges it, or adds a limit to it.

Why the others are wrong
A: Text 2 emphasizes the broad importance of the research rather than viewing it as a limited or "niche" study of frictional resistance. Step 1, check the context (key phrases: "investigating a potentially niche problem", "opens a series of broader implications"): Text 1 refers to a "niche problem," but Text 2 highlights that this research "opens a series of broader implications."
C: Text 2 focuses on expanding the applications of EHL friction rather than critiquing its limitations in robotics. Step 1, analyze the focus (key phrase: "refined to perform more efficient surgeries"): Text 2 explores how robotic arms that depend on EHL friction can be "refined to perform more efficient surgeries," showing a positive outlook on its utility.
D: Text 2 presents the new understanding of EHL friction as a sophisticated tool for future technology, not a "rudimentary" one. Step 1, evaluate the tone (key phrase: "new understanding"): Text 2 describes the work as a "new understanding" that allows for "efficient surgeries," which implies a level of advanced progress.',
  'published', 'cross_text_connections');

-- Q35 · Selective attention in fish
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q35', 'craft_and_structure',
  'Text 1
Fish that move collectively respond to a select few visual cues—usually, the movements of two or three nearby individuals—according to researchers Susumu Ito and Nariya Uchida. When switching from a vortex movement (circling a central point) to a polarized movement (moving straight in a single direction), a fish does not by any means observe a particularly large number of the other fish in its school. Using "selective attention," a fish instead focuses on one to three other members of the school and responds to their motions.

Text 2
Employing a technique known as "force mapping," Andreu Puy, Elisabet Gimeno, and colleagues constructed a series of diagrams in order to better understand the movements of schools of fish. The work of these researchers revealed that an individual fish will narrow its focus to a few relatively nearby fish when determining how to move in reference to the school as a whole. In particular, any single fish will operate under the idea of selective attention, noticing and emulating the faster-moving fish close by and mostly neglecting slower-moving fish.',
  null,
  'Based on the texts, how would the author of Text 2 respond to the discussion of "selective attention" in Text 1?',
  'medium', 'OnePrep rates this medium: 62% of its users answer it correctly, in 1:25 on average; the middle half of correct answers take 55s to 2:06.',
  '[
    {"label": "A", "body": "By calling attention to the significant role of relative speed in guiding \"selective attention\" among fish"},
    {"label": "B", "body": "By pointing out that force mapping has led to an increasingly precise definition of \"selective attention\" as a concept"},
    {"label": "C", "body": "By suggesting that some movement patterns may be more readily guided by \"selective attention\" than others"},
    {"label": "D", "body": "By arguing that \"selective attention\" operates with meaningful variations across fish species"}]'::jsonb,
  'A', 'Why A is correct: Step 1, read the question direction: "how would the author of Text 2 respond to the discussion of ''selective attention'' in Text 1?" The question asks how Text 2 would respond to the discussion in Text 1. So first identify Text 1''s point, then find what Text 2 adds to that same point. Do not switch the authors'' roles.

Why the others are wrong
B: This option mistakes the research method for a change in the term''s definition. Step 1, method vs. concept (key phrase: "force mapping"): Text 2 mentions using "force mapping" as a technique to study fish, but it doesn''t suggest this method changed the definition of selective attention.
C: This option misinterprets the examples in Text 1 as a comparison of ease. Step 1, check examples (key phrase: "vortex movement"): Text 1 mentions "vortex movement" and "polarized movement" as examples where selective attention occurs, not as a comparison of how easily they are guided.
D: This option introduces a comparison between species that is not present in the texts. Step 1, scope check: Both texts discuss "fish" or "schools of fish" in a general sense to explain a common behavioral mechanism.',
  'published', 'cross_text_connections');

-- Q36 · The fish in The Road
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q36', 'craft_and_structure',
  'Text 1
At a pivotal moment in Cormac McCarthy''s post-apocalyptic novel The Road (2006), the course of the narration shifts entirely from the challenges faced by the principal characters to a description of a group of majestic freshwater fish in a mountain stream. Readers, understandably, could be confused by this switch. Considered more closely, though, this scene of nature evinces connections to McCarthy''s larger project of evoking an apocalyptic scenario so thoroughly bleak that the beauties of nature—those fish in their peaceful domain—have disappeared.

Text 2
McCarthy''s The Road can leave its audience perplexed for a few different reasons, though perhaps less so once evaluated within McCarthy''s entire output as a writer. One potentially confounding description of a group of large fish in a mountain stream, for instance, is in accordance with McCarthy''s tendency across novels to "digress" for the sake of symbolism. Yet here and elsewhere, McCarthy refuses to ascribe a meaning to his symbol, leaving the significance of the fish open to potentially divergent understandings.',
  null,
  'Based on the texts, both authors would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 75% of its users answer it correctly, in 1:22 on average; the middle half of correct answers take 47s to 2:04.',
  '[
    {"label": "A", "body": "The imagery of the fish can most plausibly be interpreted as a statement about the fragility of nature."},
    {"label": "B", "body": "Multiple McCarthy novels present images fundamentally similar to the image of the fish in The Road."},
    {"label": "C", "body": "In its use of symbolism, The Road deviates from other post-apocalyptic novels."},
    {"label": "D", "body": "McCarthy''s description of the fish might puzzle some readers of The Road."}]'::jsonb,
  'D', 'Why D is correct: Step 1, read the question: "both authors would most likely agree." We need a statement that both authors would agree with. So look for an idea supported by Text 1 and Text 2, not an interpretation found in only one text.

Why the others are wrong
A: Only one author offers a specific meaning for the fish imagery. Step 1, check Text 1 (key phrase: "evoking an apocalyptic scenario so thoroughly bleak that the beauties of nature—those fish in their peaceful domain—have disappeared"): Text 1 suggests that the fish represent the disappearance of nature, which aligns with an interpretation of fragility.
B: Only one author discusses McCarthy''s other works. Step 1, look for comparison (key phrase: "McCarthy''s tendency across novels"): Text 2 mentions McCarthy''s tendency to use symbolism across his entire body of work.
C: Neither text compares the novel to the rest of the genre. Step 1, identify scope (key phrase: "evoking an apocalyptic scenario"): While Text 1 mentions the "apocalyptic scenario," it doesn''t compare McCarthy''s style to other authors in that genre.',
  'published', 'cross_text_connections');

-- Q37 · Himalayan rainfall
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q37', 'craft_and_structure',
  'Text 1
Climate scientists have discovered a series of troubling trends in the Himalayas, with the mountain range now experiencing heightened rainfall. With temperatures that "are estimated to be warming at three times the rate of the global average" according to environmental journalist Navin Singh Khadka, the region is already particularly vulnerable to melting snowpack. Now, warmer temperatures have led more precipitation to fall as rain than as snow, and the risk of flooding and subsequent landslides in the region has increased as well.

Text 2
Reflecting on recent climate-driven meteorological changes in the Himalayas, geography specialist J.S. Rawat explained to the British Broadcasting Corporation that there "are now lots of flash floods after extreme rainfall." This is not the only change: Rawat further explains that "glacier-fed" lakes are becoming increasingly "rain-fed." A similar dynamic of warming and overflowing glacier-fed lakes has been observed in other parts of the globe (particularly in Alaska), suggesting that rising global temperatures are linked to such disturbances.',
  null,
  'Based on the texts, how would the climate scientists cited in Text 1 most likely respond to Rawat''s comments on "extreme rainfall" in Text 2?',
  'easy', 'OnePrep rates this easy: 86% of its users answer it correctly, in 1:26 on average; the middle half of correct answers take 54s to 2:07.',
  '[
    {"label": "A", "body": "By asserting that some of the effects of heightened rainfall have in fact been beneficial"},
    {"label": "B", "body": "By agreeing that intensified rainfall is causing problems in the Himalayas"},
    {"label": "C", "body": "By faulting Rawat for ignoring the role of glacier runoff"},
    {"label": "D", "body": "By claiming that landslides are more of a threat to the Himalayas than rainfall is"}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify Rawat''s point: We need to decide how the scientists in Text 1 would respond to Rawat''s point about extreme rainfall. Rawat says there "are now lots of flash floods after extreme rainfall." His point is that extreme rain is causing a harmful change in the Himalayas.

Why the others are wrong
A: Both texts view the increase in rainfall as a negative development, not a beneficial one. Step 1, check the tone (key phrase: "troubling trends"): Text 1 characterizes the changes as "troubling trends" and notes the region is "particularly vulnerable."
C: Text 1 and Text 2 are in agreement about the shift from ice to rain, so there is no reason for scientists to fault Rawat. Step 1, identify the focus: Text 1 focuses on how warmer temperatures cause precipitation to fall as rain instead of snow, affecting the "melting snowpack."
D: Text 1 presents landslides as a consequence of rainfall, not as a separate or more significant threat. Step 1, determine causality (key phrase: "risk of flooding and subsequent landslides"): Text 1 states that the risk of landslides increases as a result of the "heightened rainfall" and subsequent flooding.',
  'published', 'cross_text_connections');

-- Q38 · Vineland and One Battle After Another
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q38', 'craft_and_structure',
  'Text 1
For audiences acquainted with a specific narrative that exists in both novel and film, the question of which form will feel "definitive," though ultimately subjective, hinges largely upon the relative popularity of each version. One recent pairing proves illustrative: director Paul Thomas Anderson''s One Battle After Another (2025) is a reworking of novelist Thomas Pynchon''s Vineland (1990), but the current popularity of Anderson''s film all but guarantees that it, not Pynchon''s original saga, will define the characters and themes in the minds of many viewers.

Text 2
The "defining" version of a specific narrative that exists across media depends upon which form of said narrative is encountered first. With two connected works of satire—Vineland and One Battle After Another—readers acquainted with Thomas Pynchon''s 1990 book well before 2025 (the release date of the latter source) would see this version as authoritative. Yet those who view Anderson''s movie first may see One Battle After Another as definitive, forming ineffable mental images of Anderson''s actors even while reading Pynchon''s book.',
  null,
  'Which choice best describes the relationship between the two texts?',
  'hard', 'OnePrep rates this hard: 70% of its users answer it correctly, in 1:46 on average; the middle half of correct answers take 1:12 to 2:32.',
  '[
    {"label": "A", "body": "Text 1 and Text 2 focus on fundamentally different factors in considering how film and print versions of a core narrative might be received."},
    {"label": "B", "body": "Text 1 builds upon the position articulated in Text 2 by examining the manner in which Anderson adapted Vineland into One Battle After Another."},
    {"label": "C", "body": "Both Text 1 and Text 2 discuss the relative popularity of Vineland and One Battle After Another, but only Text 2 critiques the aesthetic merits of the two works."},
    {"label": "D", "body": "Like Text 1, Text 2 assesses how viewers might understand some of the themes in Vineland and One Battle After Another but does so based on an implicit preference for the latter work."}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify the shared issue (key phrase: "the question of which form will feel ''definitive,'' though ultimately subjective, hinges largely upon the relative…"): Both texts ask what makes one version of a story feel "definitive," meaning the version people treat as their main or authoritative one. The question is asking how the authors'' explanations relate—not simply whether they mention the same novel and film.

Why the others are wrong
B: Text 1 proposes a competing theory rather than building on Text 2''s logic. Step 1, check focus (key phrases: "relative popularity", "encountered first"): Text 1 focuses on popularity as the key factor, whereas Text 2 focuses on the order in which a person encounters the works.
C: Neither text critiques the quality of the works, and Text 2 does not focus on popularity. Step 1, review claims: Text 2 identifies the order of encounter as the primary factor, not "relative popularity" as Choice C claims.
D: Text 2 presents a neutral psychological observation rather than a preference for film. Step 1, analyze Text 2 (key phrase: "would see this version as authoritative"): Text 2 explicitly states that those who read the book first would see it as "authoritative," showing it values both perspectives equally.',
  'published', 'cross_text_connections');

-- Q39 · Feathered dinosaurs
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q39', 'craft_and_structure',
  'Text 1
Dinosaurs representing "intermediary" stages in the evolution of birds were not the only ones to grow feathers. Increasingly, excavated fossils support the idea that all dinosaurs, including those with massive and "reptilian" body types, sported feathers of some sort. With this new awareness, though, comes the caveat that massive carnivores like the Tyrannosaurus rex probably did not grow large interlocking feathers like those of birds and instead exhibited sparse feathery patches, much as some especially large mammals, like elephants, exhibit sparse hair.

Text 2
As part of the 2016-2017 exhibition Dinosaurs Among Us, the American Museum of Natural History unveiled a large-scale model of Yutyrannus huali, an imposing carnivorous dinosaur comparable to Tyrannosaurus rex. From a distance, the model of this dinosaur could be mistaken as coated in a thick pelt of rough fur. If Y. huali had been covered in an abundance of tiny feathers, it could have used them not for flight but for body heat regulation in the manner of a large predatory mammal.',
  null,
  'Based on the texts, how would the author of Text 1 regard the model of Y. huali described in Text 2?',
  'hard', 'OnePrep rates this hard: 60% of its users answer it correctly, in 1:46 on average; the middle half of correct answers take 1:12 to 2:30.',
  '[
    {"label": "A", "body": "As reflecting a use of feathers that ultimately facilitated the development of birdlike body types in dinosaurs"},
    {"label": "B", "body": "As deviating from the idea that massive carnivorous dinosaurs most likely grew sparse patches of feathers"},
    {"label": "C", "body": "As theoretically unconvincing but potentially supported by recently uncovered evidence from the fossil record"},
    {"label": "D", "body": "As representing an intermediate evolutionary stage in the development of large interlocking feathers among massive carnivorous dinosaurs"}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify Text 1''s view (key phrase: "massive carnivores like the Tyrannosaurus rex probably did not grow large interlocking feathers like those of birds and instead exhibited sparse feathery patches"): We need to judge the model through Text 1''s author''s view. That author accepts that even massive dinosaurs had feathers, but adds a limit: large carnivores probably had sparse feathery patches, meaning feathers scattered thinly over their bodies.

Why the others are wrong
A: Text 1 does not claim that feathers led to birdlike body shapes in massive dinosaurs. Step 1, check the focus (key phrase: "''intermediary'' stages in the evolution of birds"): Text 1 discusses the evolution of birds, but it focuses on feather distribution, not the development of birdlike body shapes.
C: Text 1 cites fossils as evidence that dinosaurs had feathers generally, but suggests massive carnivores had sparse feathers rather than thick pelts. Step 1, analyze fossil evidence (key phrase: "exhibited sparse feathery patches"): Text 1 notes that fossils support feathers in general, but specifically argues for sparse patches on large carnivores.
D: Text 1 explicitly doubts that massive carnivores had large interlocking feathers. Step 1, compare feather types (key phrase: "probably did not grow large interlocking feathers"): Text 1 specifies that massive carnivores likely lacked the interlocking feathers found in birds.',
  'published', 'cross_text_connections');

-- Q40 · Rendra's mini-word theater
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q40', 'craft_and_structure',
  'Text 1
The work of Indonesian dramatist, director, and poet Willibrordus Rendra in the 1960s introduced Asian audiences to plays that challenged traditional concepts of theme, narrative, and meaning. Prime among these were the works of Germany''s Bertolt Brecht and Ireland''s Samuel Beckett—unconventional scripts that Rendra translated and adapted. Some of these plays (namely Brecht''s) are fraught with political and ideological context, some of it conveyed through complex symbolism; others (namely Beckett''s) avoid identifiable ideologies to emphasize moments of intensely-felt gesture and utterance.

Text 2
Already notable for transposing European experimental theater into an Indonesian idiom, Willibrordus Rendra created daring experiments of his own. One of these, which recalls the fragmentary plays of Samuel Beckett, was dubbed "mini-word theater." Urging his actors to forsake dialogue, Rendra had his troupe rely on shouting and gesturing to engage a "mini-word" audience that could, perhaps, transcend language and thus empathize with the emotive characters onstage.',
  null,
  'Based on the texts, what would the author of Text 1 most likely say about the "mini-word" plays mentioned in Text 2?',
  'medium', 'OnePrep rates this medium: 57% of its users answer it correctly, in 1:30 on average; the middle half of correct answers take 58s to 2:14.',
  '[
    {"label": "A", "body": "They revealed that Rendra grew disenchanted with Brecht and began to gravitate towards Beckett."},
    {"label": "B", "body": "They are best suited to actors who are already familiar with Beckett''s works."},
    {"label": "C", "body": "They were natural extensions of some of Rendra''s interests as a translator."},
    {"label": "D", "body": "They say relatively little about Indonesian culture and society."}]'::jsonb,
  'C', 'Why C is correct: Step 1, find Text 1''s key clue (key phrases: "unconventional scripts that Rendra translated and adapted", "emphasize moments of intensely-felt gesture and utterance"): We need to work out how Text 1''s author would understand Rendra''s "mini-word" plays. Start with what that author says about the works Rendra translated: Beckett''s plays emphasize strongly felt gestures and utterances—movements and spoken sounds or words. This gives us a feature to look for in Text 2.

Why the others are wrong
A: The texts show Rendra was influenced by Beckett, but they don''t suggest he became unhappy with Brecht. Step 1, check the evidence (key phrase: "unconventional scripts that Rendra translated and adapted"): Text 1 notes that Rendra translated both Brecht and Beckett, providing different styles for Asian audiences.
B: The comparison to Beckett describes a style of performance, not a specific training requirement for actors. Step 1, performance styles (key phrase: "recalls the fragmentary plays of Samuel Beckett"): Text 2 describes how actors use shouting and gesturing to "transcend language," a style that "recalls" Beckett.
D: Using an experimental style does not prevent the plays from being culturally relevant to Indonesia. Step 1, cultural context (key phrase: "transposing European experimental theater into an Indonesian idiom"): Text 2 explicitly states that Rendra was "transposing European experimental theater into an Indonesian idiom."',
  'published', 'cross_text_connections');

-- Q42 · Fluorocarbons
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q42', 'craft_and_structure',
  'Text 1
Fluorocarbons represent a health hazard when present in considerable concentrations. Present in aerosol sprays and in the foam used in fire extinguishers, these often-gaseous substances can cause respiratory illness if they are not isolated in airtight metal containers—like those being refined by an international group of researchers. Materials scientists from Cornell University, the Korea Institute of Science and Technology, and Southern Methodist University are creating "metal organic frameworks" that can accommodate multiple fluorocarbons and absorb fluorocarbons before they leak out.

Text 2
The manufacture of versatile plastics and coatings hinges on the use of fluorocarbons, substances that are often associated with aerosols and foams and are often considered health hazards in liquid and gaseous forms. However, fluorocarbons have also been used in the manufacture of plastics that are toxic: the US Environmental Protection Agency notes that cast-off plastic food containers created with fluorocarbon-based chemicals present a growing health and environmental danger.',
  null,
  'Which choice best describes how Text 1 and Text 2 relate to each other?',
  'medium', 'OnePrep rates this medium: 59% of its users answer it correctly, in 1:19 on average; the middle half of correct answers take 49s to 2:00.',
  '[
    {"label": "A", "body": "Text 1 profiles a project that would address fluorocarbon-related liabilities, while Text 2 specifies a few of the difficulties that the same project has encountered."},
    {"label": "B", "body": "Text 1 outlines the problems that accompany gaseous fluorocarbon substances, while Text 2 explains how fluorocarbons are problematic in another physical form."},
    {"label": "C", "body": "Text 1 focuses on the industrial uses of fluorocarbons and a few associated dangers, while Text 2 cautions that fluorocarbons are ultimately too dangerous for daily use."},
    {"label": "D", "body": "Text 1 describes an effort to develop safer containers for fluorocarbon-based products, while Text 2 argues that new materials must be developed before fluorocarbons can be handled safely."}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify Text 1''s focus: Text 1 explains hazards from often-gaseous fluorocarbons and describes a containment project.',
  'published', 'cross_text_connections');

-- Q43 · Measuring enjoyment
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q43', 'craft_and_structure',
  'Text 1
Can enjoyment be quantified? Although fixing objective measures to subjective sources of "joy" and "fulfillment" seems inherently difficult, there are a few reliable enough means of calibrating enjoyment. The Physical Activity Enjoyment Scale (PACES) has been deployed by researchers to convincingly evaluate adults in exercise groups. Still, such measures may be best suited to small cohorts of research participants and could yield problematic data if extended, for example, to a large suburban community.

Text 2
Research from Timothy Haab, an environmental sciences professor from Ohio State University, suggests that pleasurable experiences can be measured—almost to the cent. Haab''s work largely avoided self-reporting and other "subjective" measures of happiness within groups. In a study that combined fieldwork and statistical modeling, he determined that visitors to California beaches would willingly pay "$12.91 in additional costs per trip if each of the beaches had 25 percent less debris," as noted in his 2019 article "What''s the Value of a Clean Beach?"',
  null,
  'Based on the texts, both authors would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 69% of its users answer it correctly, in 1:25 on average; the middle half of correct answers take 51s to 2:03.',
  '[
    {"label": "A", "body": "Financial models are more useful than enjoyment scale models are for assessing recreational activities."},
    {"label": "B", "body": "Models such as Haab''s do not properly account for the subjective responses of some research participants."},
    {"label": "C", "body": "Statistical models of enjoyment can quantify the larger societal benefits of an activity."},
    {"label": "D", "body": "Researchers have attained some success in quantitatively evaluating sources of pleasure."}]'::jsonb,
  'D', 'Why D is correct: Step 1, read the shared issue: "both authors would most likely agree." The question asks what both authors would agree with, so we need one statement supported by each text—not merely a detail from one text.

Why the others are wrong
A: Neither author claims that one specific measurement method is superior to the other. Step 1, identify separate methods (key phrases: "Physical Activity Enjoyment Scale (PACES)", "statistical modeling"): each text describes its own method without ranking them.
B: Timothy Haab''s research intentionally avoided subjective measures, so he would not view its absence as a failure. Step 1, analyze Haab''s approach (key phrase: "avoided self-reporting"): Text 2 explicitly states that Haab''s work "avoided self-reporting" and other subjective measures in favor of financial data.
C: The research cited focuses on individual or group preferences, not broad benefits to society. Step 1, determine scope (key phrases: "small cohorts of research participants", "visitors to California beaches"): The studies focus on specific groups, such as exercise participants or beach visitors, rather than the entire community or society.',
  'published', 'cross_text_connections');

-- Q44 · Deep sea mining
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q44', 'craft_and_structure',
  'Text 1
Although mining the seafloor could disrupt deep sea ecosystems, some proponents of renewable energy see mineral extraction efforts of this sort as involving necessary tradeoffs. Deep sea mining, these advocates argue, would yield the metals that power fuel storage cells in renewable power systems, meeting perhaps 35-45% of the demand for such substances by 2065, according to a 2022 report by the US Geological Survey. Consumer electronics could also benefit, since some of the same metals are integral to crafting the sensitive chip and circuit technologies of smartphones.

Text 2
Biologist Kirsten Thompson of the University of Exeter is concerned about the drawbacks of deep-sea mining—drawbacks that could be most pronounced in the little-charted environments far from the surface. The most vulnerable organisms, she notes, dwell in the "benthic zone" environment on the ocean floor, and even mining that yields in-demand metals such as nickel and manganese "could irreversibly damage benthic ecosystems."',
  null,
  'Based on the texts, what would the "proponents of renewable energy" (Text 1) most likely say about the "drawbacks" mentioned in Text 2?',
  'easy', 'OnePrep rates this easy: 77% of its users answer it correctly, in 1:13 on average; the middle half of correct answers take 46s to 1:48.',
  '[
    {"label": "A", "body": "The ecological problems with deep sea mining will continue to diminish its popularity."},
    {"label": "B", "body": "The benefits of deep sea mining outweigh the negative impacts."},
    {"label": "C", "body": "There are few measurable ways that deep sea mining affects the environment."},
    {"label": "D", "body": "There is no need to undertake deep sea mining in benthic ecosystems."}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify whose response matters: The question asks how the renewable-energy supporters in Text 1 would respond to Thompson''s concerns in Text 2. Thompson warns that mining could permanently harm ecosystems on the ocean floor. We need the supporters'' likely response to that harm.

Why the others are wrong
A: The proponents discuss mining as a necessary tradeoff, not a trend in its popularity. Step 1, analyze the demand (key phrase: "meeting perhaps 35-45% of the demand for such substances by 2065"): Text 1 cites a projection that mining could meet perhaps 35-45% of demand for certain metals by 2065, emphasizing its possible benefits.
C: Proponents actually acknowledge the environmental risks but prioritize the benefits. Step 1, check the admission (key phrase: "mining the seafloor could disrupt deep sea ecosystems"): Text 1 admits from the start that mining "could disrupt deep sea ecosystems."
D: The proponents view seafloor mining—which occurs in the benthic zone—as essential. Step 1, locate the mining (key phrase: "''benthic zone'' environment on the ocean floor"): Text 2 explains that the "benthic zone" is simply the ocean floor, which is exactly where Text 1 says the mining must occur.',
  'published', 'cross_text_connections');

-- Q45 · Cichlids
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q45', 'craft_and_structure',
  'Text 1
Cichlids are highly adaptable freshwater fish found in Africa—so adaptable, in fact, that they can branch out into underwater reaches avoided by other fish species. In sub-Saharan Africa''s Lake Victoria, cichlids occupy lower-down regions of the water where other fish tend not to venture. Researchers attribute this territorial spread to cichlids'' sensitive evolution; fossilized cichlid teeth from Lake Victoria signal that cichlids successfully specialized to target food sources in deeper and deeper waters.

Text 2
According to his 2015 article "The Extraordinary Evolution of Cichlid Fishes," zoologist Axel Meyer has "long marveled at the manifold forms of cichlids." Still, Meyer is well aware that cichlids—which form a taxonomic family encompassing over 2,500 varied species—exhibit a few commonalities. One of these involves jaw structure: as Meyer notes, cichlids in fact have two jaws, an outer and an inner—with the outer used to capture prey and the inner more instrumental in chewing food.',
  null,
  'Based on the texts, the author of Text 1 and the author of Text 2 would most likely agree with which statement?',
  'medium', 'OnePrep rates this medium: 59% of its users answer it correctly, in 1:32 on average; the middle half of correct answers take 58s to 2:15.',
  '[
    {"label": "A", "body": "Cichlids have developed a two-part jaw structure for capturing prey efficiently."},
    {"label": "B", "body": "Different cichlid species have developed in response to the abundance of particular food sources."},
    {"label": "C", "body": "Most cichlid species have similar jaws despite notable differences in tooth shape and size."},
    {"label": "D", "body": "Cichlids are noteworthy for the high extent of specialization that they exhibit."}]'::jsonb,
  'D', 'Why D is correct: Step 1, look for shared support: The question asks what both authors would most likely agree with. We need a statement supported by each passage, even if the authors use different examples. A detail from just one passage is not enough.

Why the others are wrong
A: While Text 2 describes jaw anatomy, Text 1 never mentions the fish''s jaws. Step 1, check Text 2 (key phrase: "two jaws, an outer and an inner"): Text 2 does mention that cichlids have "two jaws, an outer and an inner," making this detail feel relevant.
B: Only the author of Text 1 links the evolution of cichlids to specific food sources. Step 1, identify evidence (key phrase: "specialized to target food sources"): Text 1 explicitly states that cichlids "specialized to target food sources" in deeper waters.
C: This choice incorrectly combines details that appear separately in the two texts. Step 1, analyze details (key phrases: "fossilized cichlid teeth", "jaw structure"): Text 1 mentions "fossilized cichlid teeth" while Text 2 discusses "jaw structure."',
  'published', 'cross_text_connections');

-- Q46 · History of office spaces
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q46', 'craft_and_structure',
  'Text 1
As recounted by Nicole Kay Peterson of Iowa State University, the evolution of office spaces followed a twisted path through eras and contexts. She has traced the birth of individualized office areas, or cubicles, to fifth-century monasteries; then, Italian city-states such as Florence developed centrally-located administrative offices in the 1500s, while British trading firms built offices with dedicated conference rooms in the 1700s.

Text 2
Cubed: A Secret History of the Workplace functions as both history and hard-edged social commentary for author Nikil Saval, who largely attributes the development of today''s cubicle culture to questionable 1800s ideals. Cubicles, for Saval, offer the illusion of self-directed and fulfilling individual work but really align with an approach that treats workers as the implements of larger corporations—though such alienation, Saval notes, has recently begun to abate, as companies embrace more communal office plans.',
  null,
  'Based on the texts, how does Peterson''s approach to the history of office spaces in Text 1 differ from Saval''s in Text 2?',
  'hard', 'OnePrep rates this hard: 49% of its users answer it correctly, in 1:28 on average; the middle half of correct answers take 55s to 2:12.',
  '[
    {"label": "A", "body": "Peterson analyzes a variety of developments without passing critical judgment, while Saval combines a negative critique with a historical account."},
    {"label": "B", "body": "Peterson shows how the innovations of a single period defined the physical scale of offices, while Saval argues that offices have experienced uncontrolled expansion until recently."},
    {"label": "C", "body": "Peterson emphasizes how dissimilar cultures arrived at comparable ideas about office space, while Saval construes ideas about offices as originating from a single formative culture."},
    {"label": "D", "body": "Peterson surveys historical perspectives on office and individuality, while Saval both notes deficiencies in earlier research and seeks to develop a new perspective."}]'::jsonb,
  'A', 'Why A is correct: Step 1, read the comparison: "how does Peterson''s approach to the history of office spaces in Text 1 differ from Saval''s in Text 2?" The question asks how the approaches differ, so compare not only what each writer says about offices, but also how each writer presents the history. Text 1 mainly traces several developments across centuries and places. Text 2 gives a history while also judging cubicle culture.

Why the others are wrong
B: Peterson covers multiple centuries rather than a single period. Step 1, check Peterson''s scope (key phrases: "fifth century monasteries", "1500s", "1700s"): Text 1 describes office evolution across the 5th century, the 1500s, and the 1700s.
C: Saval focuses on corporate social critique rather than cultural origins. Step 1, analyze Saval''s goals (key phrases: "hard-edged social commentary", "treats workers as the implements of larger corporations"): Saval''s work is described as social commentary regarding corporate alienation, not an analysis of a single culture.
D: Text 2 does not mention Saval critiquing other researchers. Step 1, examine research context (key phrase: "questionable 1800s ideals"): Text 2 focuses on Saval''s critique of the workplace itself, rather than his opinion on previous academic studies.',
  'published', 'cross_text_connections');

-- Q47 · Melville's Fist
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q47', 'craft_and_structure',
  'Text 1
With her frequently cited 1979 essay "Melville''s Fist," literary critic Barbara Johnson delivered a spirited close reading of one of the great short novels of American tradition, Herman Melville''s 1891 character study Billy Budd. She did so, moreover, in prose laden with canny double meanings that recall Melville''s own pun-laden sentences. Of course, other critics of Johnson''s generation were alert to wordplay, but "Melville''s Fist" was remarkably adept in fitting the whimsical yet suggestive style of Johnson''s writing to the style of her source.

Text 2
Critics who object to the style of "Melville''s Fist" fault Johnson''s puns and witticisms as inappropriate to her project. Rather than complementing Melville''s brilliant wordplay, Johnson''s attempts at verbal cleverness are "silly, sorry approximations," in the words of one of these commentators; the same commentator further faults Johnson for applying a "distractingly unserious" mode of writing to a novel, Billy Budd, that is famous for its tragic tone.',
  null,
  'Based on the texts, how would the critics cited in Text 2 most likely respond to the assessment of "Melville''s Fist" in Text 1?',
  'easy', 'OnePrep rates this easy: 58% of its users answer it correctly, in 1:19 on average; the middle half of correct answers take 47s to 1:59.',
  '[
    {"label": "A", "body": "By claiming that Johnson''s prose is ultimately displeasing"},
    {"label": "B", "body": "By arguing that Johnson does not understand the themes present in Billy Budd"},
    {"label": "C", "body": "By noting that Johnson''s ideas are innovative but divisive"},
    {"label": "D", "body": "By praising Johnson''s writing as compatible with Melville''s"}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify Text 1''s praise: "''Melville''s Fist'' was remarkably adept in fitting the whimsical yet suggestive style of Johnson''s writing to the style of her source." We need to explain how the critics cited in Text 2 would respond to Text 1''s praise of Johnson''s essay. Text 1 says Johnson was "remarkably adept" at fitting her writing style to Melville''s. In other words, it praises her playful language as a successful match for his.

Why the others are wrong
B: This choice mistakes a critique of style for a critique of reading comprehension. Step 1, check the focus (key phrase: "object to the style of"): The critics in Text 2 focus specifically on Johnson''s style and puns, not her ability to comprehend the novel''s themes.
C: This choice focuses on "ideas" when the texts are debating Johnson''s writing style. Step 1, analyze the critique (key phrase: "verbal cleverness"): Text 2 critics are bothered by the "verbal cleverness" of the writing itself, rather than the innovation of her literary arguments.
D: This choice incorrectly suggests the critics in Text 2 agree with the positive view in Text 1. Step 1, identify the conflict (key phrases: "remarkably adept", "inappropriate"): Text 1 claims Johnson''s style is "remarkably adept" at fitting Melville''s style, but Text 2 argues her style is "inappropriate."',
  'published', 'cross_text_connections');

-- Q48 · Complex TV characters
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q48', 'craft_and_structure',
  'Text 1
Television journalist Brett Martin maintains that, starting in the late 1990s, television dramas set forward increasingly complex characters. His book Difficult Men centers on a few shows that developed "antiheroes," morally conflicted central characters who alternately intrigue and repulse viewers. Both detectives (in the police drama The Wire) and criminals (in organized crime series The Sopranos) ranked among these "difficult" leading men, who voiced complex moral doubts and blatantly disregarded basic morality, sometimes in a single episode.

Text 2
For television journalist Alan Sepinwall, the intricacy and thematic richness of television dramas resulted from seemingly risky but ultimately liberating creative decisions. Studio executives, in Sepinwall''s telling, gave directors the freedom to create multi-episode narrative arcs within police and detective dramas, genres with proven popularity. As a result, intricate plotlines and characters with complex personalities emerged in shows that, on the surface, revisited known television tropes.',
  null,
  'Based on the texts, what would Alan Sepinwall in Passage 2 most likely say about the "increasingly complex characters" mentioned in Passage 1?',
  'easy', 'OnePrep rates this easy: 71% of its users answer it correctly, in 1:11 on average; the middle half of correct answers take 43s to 1:48.',
  '[
    {"label": "A", "body": "They resemble characters from less ambitious television shows."},
    {"label": "B", "body": "Their complexity can be linked to decisions by executives and directors."},
    {"label": "C", "body": "Their appearance in the 1990s surprised television executives."},
    {"label": "D", "body": "They inspire sharply differing opinions among television viewers."}]'::jsonb,
  'B', 'Why B is correct: Step 1, read the question direction: "what would Alan Sepinwall in Passage 2 most likely say." The question asks what Alan Sepinwall in Text 2 would say about the complex characters described in Text 1. So keep the speakers separate: we need Text 2''s explanation for those characters, not merely a detail about viewers or the 1990s.

Why the others are wrong
A: While Sepinwall mentions that these shows used familiar genres, he emphasizes that the characters were a new, more complex evolution. Step 1, analyze Text 2 (key phrase: "intricate plotlines and characters with complex personalities emerged"): Sepinwall argues that new creative freedoms led to "intricate plotlines and characters" that moved beyond standard formulas.
C: Sepinwall says executives gave directors creative freedom, but does not say whether the resulting characters surprised the executives. Step 1, determine intent (key phrase: "gave directors the freedom to create multi-episode narrative arcs"): According to Sepinwall, executives made a choice to give directors "the freedom to create" these complex narrative arcs.
D: This choice confuses the viewer reactions mentioned by Martin with Sepinwall''s focus on the creators'' roles. Step 1, identify the source (key phrase: "alternately intrigue and repulse viewers"): It is Martin in Text 1, not Sepinwall in Text 2, who mentions how characters "intrigue and repulse viewers."',
  'published', 'cross_text_connections');

-- Q49 · Restaurant choice study
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q49', 'craft_and_structure',
  'Text 1
In 2020, Bee-Lia Chua, Shahrim Karim, and colleagues published an expansive study of how various factors, including menu price and brand reputation, guide consumers in choosing particular restaurants on particular occasions. Seeking to redress a perceived scarcity of data on which factors guide consumer choices, the researchers considered price, word-of-mouth reputation, and brand reputation. Each factor''s importance, the team found, varied by context: price guided quick-format dining, while word-of-mouth reputation was more important in larger celebratory contexts.

Text 2
Research in consumer preferences can either provide surprising insights or confirm intuitions that might appear to be matters of common sense. Published in 2020, a study of restaurant preferences by Bee-Lia Chua et al. falls squarely in the second of these categories. While the study''s findings (the essential roles that price and word-of-mouth play, the context-specific nature of restaurant choices) are not stunning by any measure, the study''s rigor and expansiveness lend empirical support to ideas that, otherwise, would remain everyday hunches.',
  'price guided quick-format dining, while word-of-mouth reputation was more important in larger celebratory contexts',
  'Based on the texts, how would the author of Text 2 respond to the underlined statement in Text 1?',
  'hard', 'OnePrep rates this hard: 74% of its users answer it correctly, in 1:26 on average; the middle half of correct answers take 56s to 2:04.',
  '[
    {"label": "A", "body": "By expressing interest in the research findings even while questioning the rigor of Chua and colleagues'' project"},
    {"label": "B", "body": "By pinpointing how consumers resist the behaviors described by Chua and colleagues"},
    {"label": "C", "body": "By noting that the cited conclusions are important yet fundamentally unsurprising"},
    {"label": "D", "body": "By asserting that research designed to confirm commonsense assumptions nonetheless has startling aspects"}]'::jsonb,
  'C', 'Why C is correct: Step 1, identify the finding being judged: We need Text 2''s reaction to the underlined finding, not our own opinion about restaurant choices. That finding says the importance of price and word-of-mouth reputation changes with the occasion: price guides quick-format dining, while word-of-mouth matters more in larger celebrations.

Why the others are wrong
A: Text 2 actually praises the study''s rigor rather than questioning it. Step 1, check the evaluation (key phrase: "the study''s rigor and expansiveness lend empirical support"): While Text 2 calls the findings "not stunning," it explicitly praises the "study''s rigor and expansiveness" as a positive quality.
B: Text 2 focuses on how the study confirms existing habits, not how people resist them. Step 1, identify focus (key phrase: "confirm intuitions that might appear to be matters of common sense"): Text 2 argues that the study confirms "everyday hunches" about how people choose restaurants, implying the findings are accurate reflections of behavior.
D: Text 2 explicitly states the findings are "not stunning," contradicting the idea of them being "startling." Step 1, distinguish categories (key phrase: "falls squarely in the second of these categories"): Text 2 lists two categories of research: those with "surprising insights" and those that "confirm intuitions." It places this study in the second category.',
  'published', 'cross_text_connections');

-- Q50 · Munger's windowless dorm
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q50', 'craft_and_structure',
  'Text 1
When investor and architect Charlie Munger unveiled the blueprint for a new dorm building at University of California, Santa Barbara, criticism centered on one factor: the design''s windowless bedrooms. Petitions followed, as did a tense discussion of the need for natural lighting even in modular housing; even when asleep, students may derive health benefits from early morning sunlight, which helps to configure the body''s natural patterns of dormancy and wakefulness. This debate and the negative publicity that it occasioned led university officials to scrap plans for construction.

Text 2
Charlie Munger''s proposed UC Santa Barbara dorm design drew inspiration from architectural giants of the 20th century, including French maestro Le Corbusier. Where Le Corbusier is best known for precisely contoured houses and factories, Munger attempted to craft a similarly harmonious example of university housing. His pristinely shaped yet since-discontinued design was hailed as "inspired and revolutionary" by University Chancellor Henry T. Yang when it was unveiled in 2021.',
  null,
  'Based on the texts, what would the author of Text 1 most likely say in response to Yang''s assessment in Text 2?',
  'medium', 'OnePrep rates this medium: 51% of its users answer it correctly, in 1:15 on average; the middle half of correct answers take 46s to 1:52.',
  '[
    {"label": "A", "body": "Munger''s project was undermined by a feature other than its inspired architectural style."},
    {"label": "B", "body": "The absence of natural lighting in Munger''s design was both divisive and revolutionary."},
    {"label": "C", "body": "With relatively few changes, Munger could have created a revolutionary design that incorporated bedroom windows."},
    {"label": "D", "body": "Munger''s design departed too radically from the familiar forms of 20th century architecture."}]'::jsonb,
  'A', 'Why A is correct: Step 1, identify the praise being answered (key phrase: "pristinely shaped yet since-discontinued design was hailed as ''inspired and revolutionary'' by University Chancellor Henry T. Yang"): We need to work out how Text 1''s author would respond to Yang''s praise. Yang calls Munger''s design "inspired and revolutionary." The task is not to decide whether we like the design, but to find what Text 1 would add to or challenge about that praise.

Why the others are wrong
B: Text 1 views the lack of light as a failure, while Text 2 applies the word "revolutionary" to the design''s artistic inspiration. Step 1, check the context (key phrase: "inspired and revolutionary"): In Text 2, Yang calls the design "inspired and revolutionary," referring to its overall architectural ambition.
C: Text 1 focuses on why the project was cancelled, not on how easily it could have been fixed. Step 1, evaluate the evidence: Text 1 highlights the "negative publicity" and the health risks of windowless rooms, which led officials to scrap the project entirely.
D: Text 1 critiques the design''s health impacts, not its stylistic relationship to 20th-century architecture. Step 1, identify the critique (key phrase: "students may derive health benefits from early morning sunlight"): The author of Text 1 focuses on "natural lighting" and "health benefits," not on whether the building looks like 20th-century factories.',
  'published', 'cross_text_connections');

-- Q52 · George Morrison's wood construction
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q52', 'craft_and_structure',
  'Text 1
Mural? Sculpture? Something else entirely? George Morrison''s surface decoration for the Minneapolis American Indian Center consists of interwoven wooden slats that create a dynamic pattern of abstract, seemingly shifting wedges. At once striking and resistant to classification, this artwork requires the same sort of upkeep as a prized canvas or sculpture: in 2022, Morrison''s creation was put into storage while the Center undertook a series of renovations.

Text 2
Attempting to categorize George Morrison''s wood-panel construction for the Minneapolis American Indian Center does not detract from the originality of Morrison''s creation, which has adorned the Center since 1975. This construct may not quite be a painting, but it is certainly not akin to a static fresco. In fact, a recent project to move this work from the Center''s hallway to the building''s exterior demonstrates how much movability and durability—traits that may impart a more sculptural feel to the wood-panel creation—were necessary aspects of Morrison''s final product.',
  'At once striking and resistant to classification',
  'Based on the texts, how would the author of Text 2 most likely respond to the underlined commentary on George Morrison''s work in Text 1?',
  'hard', 'OnePrep rates this hard: 53% of its users answer it correctly, in 1:29 on average; the middle half of correct answers take 57s to 2:10.',
  '[
    {"label": "A", "body": "By explaining that the sculptural properties of Morrison''s work are less pronounced than its similarities to a traditional painting"},
    {"label": "B", "body": "By affirming that the portable nature of the Morrison''s construction rules out at least one possible classification for the work"},
    {"label": "C", "body": "By conceding that the parallels between Morrison''s work and wooden sculptures have been granted less attention than the parallels between the same work and large-format paintings"},
    {"label": "D", "body": "By noting that the central position of Morrison''s wood construction in the Center''s layout has contributed to debates over how the construction is categorized"}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify the claim being addressed: We need to explain how Text 2''s author would respond to the underlined description. "Striking" means visually impressive; "resistant to classification" means hard to place in a category, such as mural or sculpture. Look for what Text 2 says about those possible categories.

Why the others are wrong
A: Text 2 actually suggests the work feels more like a sculpture than a traditional painting. Step 1, check the comparison (key phrase: "sculptural feel"): Text 2 states that the work has a "sculptural feel" and explicitly notes it is "not quite a painting."
C: Text 2 focuses on the physical traits of the work rather than how much attention various comparisons receive. Step 1, identify the focus (key phrase: "does not detract from the originality of"): Text 2 argues that classifying the work is possible and doesn''t "detract from the originality," but it never discusses the amount of attention given to different parallels.
D: The work''s location is mentioned to prove its portability, not as a reason for the classification debate. Step 1, check the context (key phrase: "move this work from the Center''s hallway to the building''s exterior"): Text 2 mentions the hallway and exterior only to illustrate a project that required moving the work.',
  'published', 'cross_text_connections');

-- Q53 · African video games
perform seed_bank_item(
  'ENG-PRACTICE-CTC-Q53', 'craft_and_structure',
  'Text 1
For the past ten years, Nigerian video game publishers such as Maliyo and Kuluya have presented players with classic challenges, from navigating obstacles to squashing swarms of opponents, in their smartphone-based offerings. Their mobile games feature uniquely African trivia, characters, and cityscapes, though, as do the offerings that have appeared in other African countries. For instance, navigating Lagos—a Nigerian city infamous for its traffic congestion—has inspired one fast-paced game that puts its player in the perspective of a motorbike driver.

Text 2
Growing up in the west African nation of Cameroon, Madiba Guillaume Olivier noticed that few video games "depicted African heroes." The devoted gamer eventually started his own company and released the role-playing adventure Aurion: Legacy of the Kori-Odan to promote African identity. Within a familiar gaming genre, the role-playing genre popularized by the World of Warcraft series, Aurion develops characters who embody African customs and traditions instead of the European Middle Ages sensibility of most role-playing games.',
  null,
  'Based on the texts, why would the author of Text 1 most likely find Aurion: Legacy of the Kori-Odan (Text 2) significant?',
  'medium', 'OnePrep rates this medium: 49% of its users answer it correctly, in 1:20 on average; the middle half of correct answers take 49s to 1:58.',
  '[
    {"label": "A", "body": "It suggests a new direction for video game publishers that have previously been confined to smartphone-based offerings."},
    {"label": "B", "body": "It demonstrates that the trend of adapting classic video game genres to African content extends beyond Nigeria."},
    {"label": "C", "body": "It shows that individual designers are frequently more innovative than established video game publishers."},
    {"label": "D", "body": "It hints at a method of combining mobile game formats with characters drawn from African life and culture."}]'::jsonb,
  'B', 'Why B is correct: Step 1, identify Text 1''s pattern (key phrases: "classic challenges", "uniquely African trivia, characters, and cityscapes", "as do the offerings that have appeared in other African countries"): We need to explain why Text 1''s author would consider Aurion significant. Start with the pattern that author describes: publishers use familiar game challenges but give them African trivia, characters, and settings. The phrase "as do the offerings that have appeared in other African countries" says this pattern also occurs outside Nigeria.

Why the others are wrong
A: This option incorrectly assumes that Text 1 views smartphone platforms as a limitation to be overcome. Step 1, analyze the focus (key phrase: "feature uniquely African trivia, characters, and cityscapes"): Text 1 highlights the cultural content of games, not the technical limitations of the smartphone platform.
C: The texts do not compare the innovation levels of individuals versus established companies. Step 1, evaluate innovation (key phrase: "promote African identity"): Both texts present their subjects—whether companies or individuals—as creative in how they incorporate African content into games.
D: This choice incorrectly assumes that the game described in Text 2 is a mobile game. Step 1, check the format (key phrase: "role-playing adventure Aurion: Legacy of the Kori-Odan"): While Text 1 discusses mobile games, Text 2 describes a role-playing adventure without specifying it is for mobile devices.',
  'published', 'cross_text_connections');

end $seed$;

-- --------------------------------------------------------------- pace ----
update questions
   set target_seconds = case difficulty
                          when 'easy'   then 55
                          when 'medium' then 75
                          when 'hard'   then 100
                        end
 where source_ref like 'ENG-PRACTICE-CTC-Q%';

-- --------------------------------------------------- into the pool ----
-- After whatever the pool already holds, in OnePrep's order. A question
-- already there keeps its position, so a second run changes nothing.
with pool as (
  select id from question_sets
   where subject = 'english' and kind = 'practice' and is_active
),
refs as (
  select r.ref, r.ord
    from unnest(array[
    'ENG-PRACTICE-CTC-Q01',
    'ENG-PRACTICE-CTC-Q02',
    'ENG-PRACTICE-CTC-Q03',
    'ENG-PRACTICE-CTC-Q04',
    'ENG-PRACTICE-CTC-Q05',
    'ENG-PRACTICE-CTC-Q06',
    'ENG-PRACTICE-CTC-Q07',
    'ENG-PRACTICE-CTC-Q08',
    'ENG-PRACTICE-CTC-Q09',
    'ENG-PRACTICE-CTC-Q10',
    'ENG-PRACTICE-CTC-Q12',
    'ENG-PRACTICE-CTC-Q13',
    'ENG-PRACTICE-CTC-Q14',
    'ENG-PRACTICE-CTC-Q15',
    'ENG-PRACTICE-CTC-Q16',
    'ENG-PRACTICE-CTC-Q17',
    'ENG-PRACTICE-CTC-Q18',
    'ENG-PRACTICE-CTC-Q19',
    'ENG-PRACTICE-CTC-Q20',
    'ENG-PRACTICE-CTC-Q22',
    'ENG-PRACTICE-CTC-Q23',
    'ENG-PRACTICE-CTC-Q24',
    'ENG-PRACTICE-CTC-Q25',
    'ENG-PRACTICE-CTC-Q26',
    'ENG-PRACTICE-CTC-Q27',
    'ENG-PRACTICE-CTC-Q28',
    'ENG-PRACTICE-CTC-Q29',
    'ENG-PRACTICE-CTC-Q30',
    'ENG-PRACTICE-CTC-Q32',
    'ENG-PRACTICE-CTC-Q33',
    'ENG-PRACTICE-CTC-Q34',
    'ENG-PRACTICE-CTC-Q35',
    'ENG-PRACTICE-CTC-Q36',
    'ENG-PRACTICE-CTC-Q37',
    'ENG-PRACTICE-CTC-Q38',
    'ENG-PRACTICE-CTC-Q39',
    'ENG-PRACTICE-CTC-Q40',
    'ENG-PRACTICE-CTC-Q42',
    'ENG-PRACTICE-CTC-Q43',
    'ENG-PRACTICE-CTC-Q44',
    'ENG-PRACTICE-CTC-Q45',
    'ENG-PRACTICE-CTC-Q46',
    'ENG-PRACTICE-CTC-Q47',
    'ENG-PRACTICE-CTC-Q48',
    'ENG-PRACTICE-CTC-Q49',
    'ENG-PRACTICE-CTC-Q50',
    'ENG-PRACTICE-CTC-Q52',
    'ENG-PRACTICE-CTC-Q53'
    ]) with ordinality as r(ref, ord)
),
fresh as (
  select q.id, r.ord
    from refs r
    join questions q on q.source_ref = r.ref
   where not exists (
     select 1 from question_set_items i, pool p
      where i.set_id = p.id and i.question_id = q.id)
)
insert into question_set_items (set_id, question_id, position)
select p.id, f.id,
       coalesce((select max(position) from question_set_items i where i.set_id = p.id), 0)
         + row_number() over (order by f.ord)
  from fresh f, pool p;

-- Forty-eight in, or nothing: a pool that quietly took forty-seven is a
-- question no targeted test can ever ask.
do $check$
declare n int;
begin
  select count(*) into n
    from question_set_items i
    join question_sets qs on qs.id = i.set_id
    join questions q      on q.id = i.question_id
   where qs.subject = 'english' and qs.kind = 'practice' and qs.is_active
     and q.source_ref like 'ENG-PRACTICE-CTC-Q%'
     and q.skill = 'cross_text_connections'
     and q.status = 'published';
  if n <> 48 then
    raise exception 'Cross-Text practice questions: % of 48 in the English pool', n;
  end if;
end $check$;
